using Entities;
using Reposetories;
using System.Reflection.Metadata.Ecma335;
using System.Text.Json;
using Zxcvbn;


namespace Servicess
{
    public class UserServices : IUserServices
    {
        IUserReposetory reposetory ;

        public UserServices(IUserReposetory reposetory)
        {
            this.reposetory = reposetory;
        }

        public void Get()
        {

        }

        public User GetById(int id)
        {
            return reposetory.GetById(id);
        }

        public User Add(User user)
        {
            if (CheckPassword(user.Password) >= 3)
                return reposetory.Add(user);
            return null;
        }

        public User Login(string email, string password)
        {
            return reposetory.Login(email, password);
        }

        public User Update(int id, User userToUpdate)
        {
            if (CheckPassword(userToUpdate.Password) >= 3)
                return reposetory.Update(id, userToUpdate);
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
