using Entities;

namespace Reposetories
{
    public interface IProductReposetory
    {
        Task<List<Product>> Get();
       
    }
}