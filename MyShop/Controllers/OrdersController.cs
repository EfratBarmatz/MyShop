using AutoMapper;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Servicess;
using DTO;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        IOrderServices services;
        IMapper mapper;
        public OrdersController(IOrderServices services, IMapper mapper)
        {
            this.services = services;
            this.mapper = mapper;
        }


        // GET api/<OrdersController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<OrderDTOGet>> Get(int id)
        {
            Order order = await services.GetById(id);
            if (order != null)
                return Ok(mapper.Map<Order, OrderDTOGet>(order));
            return BadRequest();
        }

        // POST api/<OrdersController>
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] OrderDTOPost order)
        {
            Order newOrder = await services.Add(mapper.Map<OrderDTOPost, Order>(order));
            if (newOrder != null)
                return CreatedAtAction(nameof(Get), new { id = newOrder.Id }, mapper.Map<Order, OrderDTOGet>(newOrder));
            return BadRequest();
        }
    }
}
