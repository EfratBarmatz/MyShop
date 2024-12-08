using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using Reposetories;

namespace Servicess
{
    public class CategoryServices : ICategoryServices
    {
        ICategoryReposetory reposetory;

        public CategoryServices(ICategoryReposetory reposetory)
        {
            this.reposetory = reposetory;
        }

        public async Task<List<Category>> Get()
        {
            return await reposetory.Get();
        }

        
    }
}
