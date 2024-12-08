using Entities;

namespace Reposetories
{
    public interface ICategoryReposetory
    {
        Task<List<Category>> Get();
        Task<Category> GetById(int id);
    }
}