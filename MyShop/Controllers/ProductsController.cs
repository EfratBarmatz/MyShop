using AutoMapper;
using DTO;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;
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
        IMapper mapper;
        IMemoryCache memoryCache;
        public ProductsController(IProductServices services, IMapper mapper,IMemoryCache memoryCache)
        {
            this.services = services;
            this.mapper = mapper;
            this.memoryCache = memoryCache; 
        }
        // GET: api/<ProductsController>
        [HttpGet]


        public async Task<ActionResult<List<ProductDTO>>> Get(string? desc,float? minPrice,float? maxPrice, [FromQuery] int?[] categoryIds)
        {
            
                List<Product> products = await services.Get(desc, minPrice, maxPrice, categoryIds);
                List<ProductDTO> productsDTO = mapper.Map<List<Product>, List<ProductDTO>>(products);
                if (productsDTO != null)
                {
                    
                    return Ok(productsDTO);
                }
               
                return BadRequest();

               

            
            
        }
       


    }
}
