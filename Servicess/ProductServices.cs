using Entities;
using Reposetories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicess
{
    public class ProductServices : IProductServices
    {
        IProductReposetory reposetory;

        public ProductServices(IProductReposetory reposetory)
        {
            this.reposetory = reposetory;
        }

        public async Task<List<Product>> Get(string? desc, float? minPrice, float? maxPrice, int?[] categoryIds)
        {
            return await reposetory.Get(desc, minPrice, maxPrice, categoryIds);
        }
    }
}
