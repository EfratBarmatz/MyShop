using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Reposetories
{
    public class OrderReposetory : IOrderReposetory
    {
        MyShop327707238Context myShop;

        public OrderReposetory(MyShop327707238Context myShop)
        {
            this.myShop = myShop;
        }

        public async Task<Order> GetById(int id)
        {
            Order newOrder = await myShop.Orders.FindAsync(id);
            return newOrder;

        }

        public async Task<Order> Add(Order order)
        {
            await myShop.Orders.AddAsync(order);
            await myShop.SaveChangesAsync();
            return order;
        }

    }
}
