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
            List<Product> product = await myShop.Products.ToListAsync();
            return product;
        }

        public async Task<Product> GetById(int id)
        {
            Product thisProduct = await myShop.Products.FindAsync(id);
            return thisProduct;
        }
    }
}
