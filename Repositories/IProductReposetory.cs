using Entities;

namespace Reposetories
{
    public interface IProductReposetory
    {
        Task<List<Product>> Get(string? desc, float? minPrice, float? maxPrice, int?[] categoryIds);
        Task<Product> GetById(int id);
    }
}