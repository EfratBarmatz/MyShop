using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Servicess;
using Entities;
using AutoMapper;
using DTO;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
   
    public class UsersController : ControllerBase
    {
        private readonly ILogger<UserServices> logger;
        IUserServices servicess;
        IMapper mapper;
        private readonly TokenService _tokenService;
        public UsersController(IUserServices servicess, IMapper mapper, ILogger<UserServices> logger, TokenService tokenService)
        {
            this.servicess = servicess;
            this.mapper = mapper;
            this.logger = logger;
            _tokenService = tokenService;
        }

        // GET api/<Users>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<UserDTOGet>> Get(int id)
        {
            User user = await servicess.GetById(id);
            if (user != null)
                return Ok(mapper.Map<User, UserDTOGet>(user));
            return NoContent();

        }

        // POST api/<Users>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] UserDTO user)
        {
            User newUser = await servicess.Add(mapper.Map<UserDTO, User>(user));
            if (newUser != null)
                return CreatedAtAction(nameof(Get), new { id = newUser.Id }, mapper.Map<User, UserDTOGet>(newUser));
            return BadRequest();

        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDTOGet>> Login([FromQuery] string email, [FromQuery] string password)
        {
            User user = await servicess.Login(email, password);
            if (user != null)
            {
                logger.LogInformation($"{user.Id}, {user.Email}, {user.FirstName}, {user.LastName} login to app!!");
                var token = _tokenService.GenerateToken(user.Email, "User");
                Response.Cookies.Append("jwt_token", token, new CookieOptions
                {
                    HttpOnly = true,
                    Secure = true,
                    SameSite = SameSiteMode.Strict,
                    Expires = DateTimeOffset.UtcNow.AddHours(1)
                });
                return Ok(mapper.Map<User, UserDTOGet>(user));
            }
            return NoContent();
        }

        [HttpPost("checkPassword")]
        public ActionResult<int> checkPassword([FromBody] string password)
        {
            return Ok(servicess.CheckPassword(password));
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        [Authorize]
        public async Task<ActionResult<UserDTOGet>> Put(int id, [FromBody] UserDTO userToUpdate)
        {
            User user = await servicess.Update(id, mapper.Map<UserDTO, User>(userToUpdate));
            if (user != null)
                return Ok(mapper.Map<User, UserDTOGet>(user));
            return BadRequest();
        }
    }
}
