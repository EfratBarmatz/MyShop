using Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Reposetories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicess
{
    public class OrderServices : IOrderServices
    {
        IOrderReposetory reposetory;
        IProductReposetory productReposetory;
        private readonly ILogger<OrderServices> _logger;
        public OrderServices(IOrderReposetory reposetory, IProductReposetory productReposetory, ILogger<OrderServices> logger)
        {
            this.reposetory = reposetory;
            this.productReposetory = productReposetory;
            _logger=logger;
        }
        public async Task<Order> GetById(int id)
        {
            return await reposetory.GetById(id);

        }
        public async Task<Order> Post(Order order)
        {
            await checkSum(order);

            return await reposetory.Post(order);

        }
        private async Task checkSum(Order order)
        {
            float sum = 0;

            foreach (var o in order.OrderItems)
            {
                Product product = await productReposetory.GetById(o.ProductId);
                sum += product.Price;

            }


            if (sum != order.Sum)
            {
           
                _logger.LogError("ניסיון לגניבה !!!יש לבדוק דחוף.");
                order.Sum = sum;



            }

        }


    }
}
