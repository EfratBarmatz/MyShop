using Entities;

namespace Servicess
{
    public interface IProductServices
    {
        Task<List<Product>> Get();
        Task<Product> GetById(int id);
    }
}