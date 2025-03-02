using Entities;
using Moq;
using System.Threading.Tasks;
using Xunit;
using Entities;  // ����� ��� ������� ������
using Reposetories;
using Microsoft.EntityFrameworkCore;
using Moq.EntityFrameworkCore;  // ����� ��� MyShop327707238Context ����

public class UserRepositoryUnitTests
{
    [Fact]
    public async Task Get_UserExists_ReturnsUser()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock �� ��������
        var userToReturn = new User { Id = 1, FirstName = "John", LastName = "Doe", Email = "john.doe@example.com" };

        // ���� �� �-DbSet ����� �� ������ ����� ���-id ��� 1
        mockContext.Setup(m => m.Users.FindAsync(It.IsAny<int>())).ReturnsAsync(userToReturn);

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.GetById(1); // ������ �������� �� id 1

        // Assert
        Assert.NotNull(result);  // ����� ������� �� null
        Assert.Equal(1, result.Id); // ����� ��-id ��� 1
        Assert.Equal("John", result.FirstName); // ����� ���� ����� ��� "John"
        Assert.Equal("Doe", result.LastName); // ����� ���� ����� ��� "Doe"
        Assert.Equal("john.doe@example.com", result.Email); // ����� �����"� ����
    }

    [Fact]
    public async Task Get_UserDoesNotExist_ReturnsNull()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>();

        // ���� �� �-DbSet ����� null ���� �� ���� ����� �� �-id ������
        mockContext.Setup(m => m.Users.FindAsync(It.IsAny<int>())).ReturnsAsync((User)null);

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.GetById(-1); // ������ �������� �� id ��� ����

        // Assert
        Assert.Null(result); // ����� ������� ��� null ����� �� id ��� ����
    }


    [Fact]
    public async Task Add_ValidUser_AddsUserAndSavesChanges()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock �� ��������
        var mockUsersDbSet = new Mock<DbSet<User>>(); // Mock �� DbSet �� �������

        var userToAdd = new User
        {
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            Password = "securepassword"
        };

        // ����� �������� �� �-Context �� ������ �� �-mock DbSet
        mockContext.Setup(m => m.Users).Returns(mockUsersDbSet.Object);
        mockContext.Setup(m => m.SaveChangesAsync(default)).ReturnsAsync(1); // ����� ����� ������

        var repository = new UserReposetory(mockContext.Object); // ����� �-Repository

        // Act
        var result = await repository.Add(userToAdd); // ����� ��������

        // Assert
        Assert.NotNull(result); // ����� ������� �����
        Assert.Equal("John", result.FirstName); // ����� ���� �� �����
        Assert.Equal("john.doe@example.com", result.Email); // ����� �������� �� �����

        // ����� �-AddAsync ����� �� �-DbSet �� ������ �����
        mockContext.Verify(m => m.Users.AddAsync(It.IsAny<User>(), default), Times.Once);

        // ����� �-SaveChangesAsync ����� ��� ���
        mockContext.Verify(m => m.SaveChangesAsync(default), Times.Once);
    }


    [Fact]
    public async Task Post_FailedToAddUser_ThrowsException()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>();
        var userToAdd = new User
        {
            Id = 1,
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            Password = "securepassword"
        };

        // Setup �� AddAsync �� ������ Exception
        mockContext.Setup(m => m.Users.AddAsync(It.IsAny<User>(), default)).ThrowsAsync(new System.Exception("Failed to add user"));

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act & Assert
        await Assert.ThrowsAsync<System.Exception>(async () => await Reposetory.Add(userToAdd)); // ����� ������� �����
    }

    [Fact]
    public async Task Update_ValidUser_UpdatesUserAndSavesChanges()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock �� ��������
        var mockUsersDbSet = new Mock<DbSet<User>>(); // Mock �� DbSet �� �������

        var existingUser = new User
        {
            Id = 1,
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            Password = "securepassword"
        };

        var userToUpdate = new User
        {
            FirstName = "Jane",
            LastName = "Doe",
            Email = "jane.doe@example.com",
            Password = "newpassword"
        };

        // ����� �������� �� �-Mock DbSet - ������ �� �������� (��� ����� ����� ����)
        var users = new List<User> { existingUser }.AsQueryable();
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.Provider).Returns(users.Provider);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.Expression).Returns(users.Expression);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.ElementType).Returns(users.ElementType);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.GetEnumerator()).Returns(users.GetEnumerator());

        // ����� �������� �� �-Context �� ������ �� �-mock DbSet
        mockContext.Setup(m => m.Users).Returns(mockUsersDbSet.Object);
        mockContext.Setup(m => m.SaveChangesAsync(default)).ReturnsAsync(1); // ����� ����� ������

        var repository = new UserReposetory(mockContext.Object); // ����� �-Repository

        // Act
        var result = await repository.Update(1, userToUpdate); // ����� ��������

        // Assert
        Assert.NotNull(result);
        Assert.Equal(1, result.Id); 
        Assert.Equal("Jane", result.FirstName);
        Assert.Equal("jane.doe@example.com", result.Email); 
        mockContext.Verify(m => m.Users.Update(It.IsAny<User>()), Times.Once);
        mockContext.Verify(m => m.SaveChangesAsync(default), Times.Once);
    }

    [Fact]
    public async Task Put_UserDoesNotExist_ThrowsException()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>();
        var userToUpdate = new User
        {
            Id = 1,
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            Password = "securepassword"
        };

        // Setup �� Update �� ���� �� �����, �� ����� �� ������ ����
        mockContext.Setup(m => m.Users.Update(It.IsAny<User>()));

        // Setup �� SaveChangesAsync �� ������ Exception
        mockContext.Setup(m => m.SaveChangesAsync(default)).ThrowsAsync(new System.Exception("Failed to save changes"));

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act & Assert
        await Assert.ThrowsAsync<System.Exception>(async () => await Reposetory.Update(1, userToUpdate)); // ����� ������� �����
    }

    [Fact]
    public async Task Login()
    {
        var user = new User { FirstName = "Efrat", Email = "e0556737828@gmail.com", Password = "aAaA11111" };

        var mockContext = new Mock<MyShop327707238Context>();
        var users = new List<User>() { user };
        mockContext.Setup(x => x.Users).ReturnsDbSet(users);
        var userRepository = new UserReposetory(mockContext.Object);
        var result = await userRepository.Login(user.Email, user.Password);
        Assert.Equal(user, result);
    }

    [Fact]
    public async Task NotLogin()
    {
        var user = new User { FirstName = "Efrat", Email = "e0556737828@gmail.com", Password = "aAaA11111" };

        var mockContext = new Mock<MyShop327707238Context>();
        var users = new List<User>() { user };
        mockContext.Setup(x => x.Users).ReturnsDbSet(users);
        var userRepository = new UserReposetory(mockContext.Object);
        var result = await userRepository.Login("testuser@example.com", user.Password);
        Assert.Null( result);
    }
}


