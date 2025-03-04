using Entities;
using Microsoft.Extensions.Logging;
using Reposetories;
using System.Reflection.Metadata.Ecma335;
using System.Text.Json;
using Zxcvbn;


namespace Servicess
{
    public class UserServices : IUserServices
    {
        IUserReposetory reposetory;
       
        public UserServices(IUserReposetory reposetory)
        {
            this.reposetory = reposetory;
            
        }

        

        public async Task<User> GetById(int id)
        {
            return await reposetory.GetById(id);

        }

        public async Task<User> Add(User user)
        {
            if (CheckPassword(user.Password) >= 3)
                return await reposetory.Add(user);
            return null;
        }

        public async Task<User> Login(string email, string password)
        {
            User user =await reposetory.Login(email, password);
            
            return user;
        }

        public async Task<User> Update(int id, User userToUpdate)
        {
            if (CheckPassword(userToUpdate.Password) >= 3)
            {
                User user=await reposetory.Update(id, userToUpdate);
                return user;
            }
                 
            return null;
        }


        public int CheckPassword(string password)
        {
            var levelPassword = Zxcvbn.Core.EvaluatePassword(password);
            return levelPassword.Score;
        }



    }
}
