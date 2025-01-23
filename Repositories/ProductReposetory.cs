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

        public async Task<List<Product>> Get(string? desc, float? minPrice, float? maxPrice, int?[] categoryIds)
        {

            var query = myShop.Products.Where(product =>
                (desc == null ? (true) : (product.Name.Contains(desc)))
                && ((minPrice == null) ? (true) : (product.Price >= minPrice))
                && ((maxPrice == null) ? (true) : (product.Price <= maxPrice))
                && ((categoryIds.Length == 0) ? (true) : (categoryIds.Contains(product.CategoryId))))
               .OrderBy(product => product.Price);
            Console.WriteLine(query.ToQueryString());//
            List<Product> products = await query.Include(c => c.Category).ToListAsync();
            return products;

        }
    }
}
