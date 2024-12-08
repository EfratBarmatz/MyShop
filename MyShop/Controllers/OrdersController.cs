using Entities;
using Microsoft.AspNetCore.Mvc;
using Servicess;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace MyShop.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrdersController : ControllerBase
    {
        IOrderServices services;

        public OrdersController(IOrderServices services)
        {
            this.services = services;
        }

        
        // GET api/<OrdersController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Order>> Get(int id)
        {
            Order order = await services.GetById(id);
            if (order != null)
                return Ok(order);
            return BadRequest();
        }

        // POST api/<OrdersController>
        [HttpPost]
        public async Task<ActionResult> Post([FromBody] Order order)
        {
            Order newOrder = await services.Add(order);
            if (newOrder != null)
                return CreatedAtAction(nameof(Get), new { id = newOrder.Id }, newOrder);
            return BadRequest();
        }
    }
}
