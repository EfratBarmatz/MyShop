using Entities;
using Moq;
using Moq.EntityFrameworkCore;
using Reposetories;
namespace Tests
{
    public class UserReposetoryUnitTest
    {
        [Fact]
        public async Task Login()
        {
            var user = new User { FirstName = "Efrat", Email = "e0556737828@gmail.com" ,Password="As12aS12" };
            
            var mockContext = new Mock<MyShop327707238Context>();
            var users = new List<User>() { user };
            mockContext.Setup(x => x.Users).ReturnsDbSet(users);
            
            var userRepository = new UserReposetory(mockContext.Object);
            
            var result = await userRepository.Login(user.Email, user.Password);
            
            Assert.Equal(user, result);
        }
    }
}