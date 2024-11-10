using Entities;

namespace Reposetories
{
    public interface IUserReposetory
    {
        User Add(User user);
        void Delete(int id);
        void Get();
        User GetById(int id);
        User Login(string email, string password);
        User Update(int id, User userToUpdate);
    }
}