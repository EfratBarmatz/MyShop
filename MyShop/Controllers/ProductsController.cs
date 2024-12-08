using Entities;
using Microsoft.AspNetCore.Mvc;
using Servicess;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
   
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        IProductServices services;
        public ProductsController(IProductServices services)
        {
            this.services = services;
        }
        // GET: api/<ProductsController>
        [HttpGet]


        public async Task<ActionResult<List<Product>>> Get()
        {
            List<Product> product = await services.Get();
            if (product != null)
                return Ok(product);
            return BadRequest();
        }

        // GET api/<ProductsController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Product>> Get(int id)
        {
            Product product = await services.GetById(id);
            if (product != null)
                return Ok(product);
            return BadRequest();
        }

        // POST api/<ProductsController>
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<ProductsController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ProductsController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
