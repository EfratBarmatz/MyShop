using Entities;
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
        public OrderServices(IOrderReposetory reposetory)
        {
            this.reposetory = reposetory;
        }

        public async Task<List<Order>> Get()
        {
            return await reposetory.Get();
        }

        public async Task<Order> GetById(int id)
        {
            return await reposetory.GetById(id);

        }

        public async Task<Order> Add(Order order)
        {
            return await reposetory.Add(order);
        }

        public async Task<Order> Update(int id, Order OrderToUpdate)
        {
            return await reposetory.Update(id, OrderToUpdate);
        }
    }
}
