using Entities;

namespace Reposetories
{
    public interface IProductReposetory
    {
        Task<List<Product>> Get();
        Task<Product> GetById(int id);
    }
}