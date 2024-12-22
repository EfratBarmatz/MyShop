using AutoMapper;
using DTO;
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
        IMapper mapper;
        public CategoriesController(ICategoryServices services, IMapper mapper)
        {
            this.services = services;
            this.mapper = mapper;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<ActionResult<List<CategoryDTO>>> Get()
        {
            List<Category> categories = await services.Get();
            List<CategoryDTO> categoriesDTO = mapper.Map<List<Category>, List<CategoryDTO>>(categories);
            if (categoriesDTO != null)
                return Ok(categoriesDTO);
            return BadRequest();
        }
    }
}
