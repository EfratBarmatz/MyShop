using Entities;

namespace Servicess
{
    public interface IUserServices
    {
        User Add(User user);
        int CheckPassword(string password);
        void Delete(int id);
        void Get();
        User GetById(int id);
        User Login(string email, string password);
        User Update(int id, User userToUpdate);
    }
}