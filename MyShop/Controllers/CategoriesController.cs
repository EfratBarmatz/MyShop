using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
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
        IMemoryCache memoryCache;
        public CategoriesController(ICategoryServices services, IMapper mapper, IMemoryCache memoryCache)
        {
            this.services = services;
            this.mapper = mapper;
            this.memoryCache = memoryCache;
        }

        // GET: api/<CategoriesController>
        [HttpGet]
        public async Task<ActionResult<List<CategoryDTO>>> Get()
        {
            var cacheKey = "category";

            var cachedData = memoryCache.Get(cacheKey);

            if (cachedData == null)

            {
                List<Category> categories = await services.Get();
                List<CategoryDTO> categoriesDTO = mapper.Map<List<Category>, List<CategoryDTO>>(categories);
                if (categoriesDTO != null)
                {
                    cachedData = categoriesDTO;
                    memoryCache.Set(cacheKey, cachedData, TimeSpan.FromMinutes(10));
                    return Ok(categoriesDTO);
                }

                return BadRequest();



            }

            return Ok(cachedData);



            
        }
    }
}
