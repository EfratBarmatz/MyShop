using Entities;

namespace Servicess
{
    public interface ICategoryServices
    {
        Task<List<Category>> Get();
        
    }
}