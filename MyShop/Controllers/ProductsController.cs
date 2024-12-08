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

       
       
    }
}
