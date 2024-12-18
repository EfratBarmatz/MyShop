﻿using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Servicess;
using Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        IUserServices servicess;

        public UsersController(IUserServices servicess)
        {
            this.servicess = servicess;
        }

        // GET api/<Users>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User>> Get(int id)
        {
            User user = await servicess.GetById(id);
            if (user != null)
                return Ok(user);
            return NoContent();

        }

        // POST api/<Users>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] User user)
        {
            User newUser = await servicess.Add(user);
            if (newUser != null)
                return CreatedAtAction(nameof(Get), new { id = newUser.Id }, newUser);
            return BadRequest();

        }

        [HttpPost("login")]
        public async Task<ActionResult<User>> Login([FromQuery] string email, [FromQuery] string password)
        {
            User user = await servicess.Login(email, password);
            if (user != null)
                return Ok(user);
            return NoContent();
        }

        [HttpPost("checkPassword")]
        public ActionResult<int> checkPassword([FromBody] string password)
        {
            return Ok(servicess.CheckPassword(password));
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        public async Task<ActionResult<User>> Put(int id, [FromBody] User userToUpdate)
        {
            User user = await servicess.Update(id, userToUpdate);
            if (user != null)
                return Ok(user);
            return BadRequest();
        }
    }
}
