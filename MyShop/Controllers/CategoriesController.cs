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

        
    }
}
