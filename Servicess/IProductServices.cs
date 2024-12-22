using Entities;

namespace Servicess
{
    public interface IProductServices
    {
        Task<List<Product>> Get(string? desc, float? minPrice, float? maxPrice, int?[] categoryIds);
    }
}