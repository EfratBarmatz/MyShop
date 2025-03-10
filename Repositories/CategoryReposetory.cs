﻿using Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Reposetories
{
    public class CategoryReposetory : ICategoryReposetory
    {
        MyShop327707238Context myShop;

        public CategoryReposetory(MyShop327707238Context myShop)
        {
            this.myShop = myShop;
        }

        public async Task<List<Category>> Get()
        {
            List<Category> categories = await myShop.Categories.Include(c => c.Products).ToListAsync();
            return categories;
        }



    }
}
