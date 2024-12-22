using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Servicess;
using Entities;
using AutoMapper;
using DTO;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        IUserServices servicess;
        IMapper mapper;
        public UsersController(IUserServices servicess,IMapper mapper)
        {
            this.servicess = servicess;
            this.mapper = mapper;
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
            User newUser = await servicess.Add(mapper.Map<UserDTO,User>(user));
            if (newUser != null)
                return CreatedAtAction(nameof(Get), new { id = newUser.Id }, mapper.Map<User, UserDTOGet>(newUser));
            return BadRequest();

        }

        [HttpPost("login")]
        public async Task<ActionResult<UserDTOGet>> Login([FromQuery] string email, [FromQuery] string password)
        {
            User user = await servicess.Login(email, password);
            if (user != null)
                return Ok(mapper.Map<User, UserDTOGet>(user));
            return NoContent();
        }

        [HttpPost("checkPassword")]
        public ActionResult<int> checkPassword([FromBody] string password)
        {
            return Ok(servicess.CheckPassword(password));
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<UserDTOGet>> Put(int id, [FromBody] UserDTO userToUpdate)
        {
            User user = await servicess.Update(id, mapper.Map<UserDTO, User>(userToUpdate));
            if (user != null)
                return Ok(mapper.Map<User, UserDTOGet>(user));
            return BadRequest();
        }
    }
}
