using Entities;

namespace Reposetories
{
    public interface IUserReposetory
    {
        Task<User> Add(User user);
        Task Delete(int id);
        Task<User> Get();
        Task<User> GetById(int id);
        Task<User> Login(string email, string password);
        Task<User> Update(int id, User userToUpdate);
    }
}