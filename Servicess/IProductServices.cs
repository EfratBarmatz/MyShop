using Entities;

namespace Servicess
{
    public interface IProductServices
    {
        Task<List<Product>> Get();
    }
}