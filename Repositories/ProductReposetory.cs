using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Reposetories
{
    public class ProductReposetory : IProductReposetory
    {
        MyShop327707238Context myShop;

        public ProductReposetory(MyShop327707238Context myShop)
        {
            this.myShop = myShop;
        }

        public async Task<List<Product>> Get()
        {
           
            List<Product> product = await myShop.Products.Include(c => c.Category).ToListAsync();
            return product;
        }
    }
}
