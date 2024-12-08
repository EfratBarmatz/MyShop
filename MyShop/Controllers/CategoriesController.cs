using Entities;
using Microsoft.AspNetCore.Mvc;
using Servicess;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriesController : ControllerBase
    {
        ICategoryServices services;
       
        public CategoriesController(ICategoryServices services)
        {
            this.services = services;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<ActionResult<List<Category>>> Get()
        {
            List<Category> category = await services.Get();
            if (category != null)
                return Ok(category);
            return BadRequest();
        }

        // GET api/<CategoriesController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> Get(int id)
        {
            Category category = await services.GetById(id);
            if (category != null)
                return Ok(category);
            return BadRequest();
        }

        // POST api/<CategoriesController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<CategoriesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<CategoriesController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
