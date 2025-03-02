using Entities;
using Reposetories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Servicess
{
    public class RatingServices : IRatingServices
    {
        IRatingReposetory reposetory;

        public RatingServices(IRatingReposetory reposetory)
        {
            this.reposetory = reposetory;
        }

        public async Task Post(Rating rating)
        {

             await reposetory.Post(rating);

        }
    }
}
