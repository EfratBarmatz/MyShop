using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Servicess;
using Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Users : ControllerBase
    {
        IUserServices Iservicess ;

        public Users(IUserServices servicess)
        {
           Iservicess = servicess;
        }


        // GET: api/<Users>
        [HttpGet]
        public void Get()
        {
            
        }

        // GET api/<Users>/5
        [HttpGet("{id}")]
        public ActionResult<User> Get(int id)
        {
            User user = Iservicess.GetById(id);
             if (user!=null)
                return Ok(user);
            return NoContent();

        }

        // POST api/<Users>
        [HttpPost]
        public IActionResult Post([FromBody] User user)
        {
            User newUser = Iservicess.Add(user);
            if(newUser!= null)
                return CreatedAtAction(nameof(Get), new { id = newUser.UserId }, newUser);//סיסמה לא חזקה לא אמורה להחזיר שגיאה אלא הודעה ברורה
            return BadRequest();

        }

        [HttpPost("login")]
        public ActionResult<User> Login([FromQuery] string email, [FromQuery] string password)
        {
            User user = Iservicess.Login(email,password);
            if (user != null)
                return Ok(user);
            return NoContent();
        }

        [HttpPost("checkPassword")]
        public ActionResult<int> checkPassword([FromBody] string password)
        {
            return Ok( Iservicess.CheckPassword(password));
        }

        // PUT api/<Users>/5
        [HttpPut("{id}")]
        public ActionResult<User> Put(int id, [FromBody] User userToUpdate)
        {
            User user = Iservicess.Update(id, userToUpdate);
            if (user != null)
                return Ok(user);
            return BadRequest();//סיסמה לא חזקה לא אמורה להחזיר שגיאה אלא הודעה ברורה
        }

        // DELETE api/<Users>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
