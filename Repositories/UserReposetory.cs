using Entities;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

namespace Reposetories
{
    public class UserReposetory : IUserReposetory
    {
        MyShop327707238Context myShop;

        List<User> users = new();
        User u = new();
        public UserReposetory(MyShop327707238Context myShop)
        {
            this.myShop = myShop;
        }

        public async Task<User> Get()
        {
            //users = await myShop.Users.ToList();
            return null;
        }

        public async Task<User> GetById(int id)
        {
            User user = await myShop.Users.FindAsync(id);
            return user;

        }

        public async Task<User> Add(User user)
        {
            await myShop.Users.AddAsync(user);
            await myShop.SaveChangesAsync();
            return user;
        }

        public async Task<User> Login(string email, string password)
        {
            User user = await myShop.Users.FirstOrDefaultAsync(currentUser=> currentUser.Password==password && currentUser.Email==email);
            return user;
        }

        public async Task<User> Update(int id, User userToUpdate)
        {
            myShop.Users.Update(userToUpdate);
            await myShop.SaveChangesAsync();
            return userToUpdate;
        }

        public async Task Delete(int id)
        {
            
        }
    }
}
