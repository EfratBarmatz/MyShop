using Entities;
using Reposetories;
using System.Reflection.Metadata.Ecma335;
using System.Text.Json;
using Zxcvbn;


namespace Servicess
{
    public class UserServices : IUserServices
    {
        IUserReposetory Ireposetory ;

        public UserServices(IUserReposetory reposetory)
        {
            this.Ireposetory = reposetory;
        }

        public void Get()
        {

        }

        public User GetById(int id)
        {
            return Ireposetory.GetById(id);
        }

        public User Add(User user)
        {
            if (CheckPassword(user.Password) >= 3)
                return Ireposetory.Add(user);
            return null;
        }

        public User Login(string email, string password)
        {
            return Ireposetory.Login(email, password);
        }

        public User Update(int id, User userToUpdate)
        {
            if (CheckPassword(userToUpdate.Password) >= 3)
                return Ireposetory.Update(id, userToUpdate);
            return null;
        }

        public void Delete(int id)
        {

        }

        public int CheckPassword(string password)
        {
            var levelPassword = Zxcvbn.Core.EvaluatePassword(password);
            return levelPassword.Score;
        }



    }
}
