using Entities;
using Moq;
using System.Threading.Tasks;
using Xunit;
using Entities;  // המקום שבו המודלים נמצאים
using Reposetories;
using Microsoft.EntityFrameworkCore;
using Moq.EntityFrameworkCore;  // המקום שבו MyShop327707238Context נמצא

public class UserRepositoryUnitTests
{
    [Fact]
    public async Task Get_UserExists_ReturnsUser()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock של הקונטקסט
        var userToReturn = new User { Id = 1, FirstName = "John", LastName = "Doe", Email = "john.doe@example.com" };

        // המוק של ה-DbSet מחזיר את המשתמש הרצוי כשה-id הוא 1
        mockContext.Setup(m => m.Users.FindAsync(It.IsAny<int>())).ReturnsAsync(userToReturn);

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.GetById(1); // קוראים לפונקציה עם id 1

        // Assert
        Assert.NotNull(result);  // תוודא שהמשתמש לא null
        Assert.Equal(1, result.Id); // תוודא שה-id הוא 1
        Assert.Equal("John", result.FirstName); // תוודא שהשם הפרטי הוא "John"
        Assert.Equal("Doe", result.LastName); // תוודא שהשם משפחה הוא "Doe"
        Assert.Equal("john.doe@example.com", result.Email); // תוודא שהדוא"ל נכון
    }

    [Fact]
    public async Task Get_UserDoesNotExist_ReturnsNull()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>();

        // המוק של ה-DbSet מחזיר null כאשר לא נמצא משתמש עם ה-id המבוקש
        mockContext.Setup(m => m.Users.FindAsync(It.IsAny<int>())).ReturnsAsync((User)null);

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.GetById(-1); // קוראים לפונקציה עם id שלא קיים

        // Assert
        Assert.Null(result); // תוודא שהתוצאה היא null במקרה של id שלא קיים
    }


    [Fact]
    public async Task Add_ValidUser_AddsUserAndSavesChanges()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock של הקונטקסט
        var mockUsersDbSet = new Mock<DbSet<User>>(); // Mock של DbSet של משתמשים

        var userToAdd = new User
        {
            FirstName = "John",
            LastName = "Doe",
            Email = "john.doe@example.com",
            Password = "securepassword"
        };

        // הגדרת ההתנהגות של ה-Context כך שיחזיר את ה-mock DbSet
        mockContext.Setup(m => m.Users).Returns(mockUsersDbSet.Object);
        mockContext.Setup(m => m.SaveChangesAsync(default)).ReturnsAsync(1); // לדמות פעולה מוצלחת

        var repository = new UserReposetory(mockContext.Object); // יצירת ה-Repository

        // Act
        var result = await repository.Add(userToAdd); // קריאה לפונקציה

        // Assert
        Assert.NotNull(result); // לוודא שהחזרנו תוצאה
        Assert.Equal("John", result.FirstName); // לוודא שהשם לא השתנה
        Assert.Equal("john.doe@example.com", result.Email); // לוודא שהאימייל לא השתנה

        // לוודא ש-AddAsync נקראה על ה-DbSet עם המשתמש הנכון
        mockContext.Verify(m => m.Users.AddAsync(It.IsAny<User>(), default), Times.Once);

        // לוודא ש-SaveChangesAsync נקראה פעם אחת
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

        // Setup של AddAsync כך שיזרוק Exception
        mockContext.Setup(m => m.Users.AddAsync(It.IsAny<User>(), default)).ThrowsAsync(new System.Exception("Failed to add user"));

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act & Assert
        await Assert.ThrowsAsync<System.Exception>(async () => await Reposetory.Add(userToAdd)); // תוודא שהשגיאה נזרקת
    }

    [Fact]
    public async Task Update_ValidUser_UpdatesUserAndSavesChanges()
    {
        // Arrange
        var mockContext = new Mock<MyShop327707238Context>(); // Mock של הקונטקסט
        var mockUsersDbSet = new Mock<DbSet<User>>(); // Mock של DbSet של משתמשים

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

        // הגדרת ההתנהגות של ה-Mock DbSet - להחזיר את המשתמשים (כדי שנוכל לעדכן אותם)
        var users = new List<User> { existingUser }.AsQueryable();
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.Provider).Returns(users.Provider);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.Expression).Returns(users.Expression);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.ElementType).Returns(users.ElementType);
        mockUsersDbSet.As<IQueryable<User>>().Setup(m => m.GetEnumerator()).Returns(users.GetEnumerator());

        // הגדרת ההתנהגות של ה-Context כך שיחזיר את ה-mock DbSet
        mockContext.Setup(m => m.Users).Returns(mockUsersDbSet.Object);
        mockContext.Setup(m => m.SaveChangesAsync(default)).ReturnsAsync(1); // לדמות פעולה מוצלחת

        var repository = new UserReposetory(mockContext.Object); // יצירת ה-Repository

        // Act
        var result = await repository.Update(1, userToUpdate); // קריאה לפונקציה

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

        // Setup של Update כך שהיא לא תשפיע, רק תחזיר את המשתמש החדש
        mockContext.Setup(m => m.Users.Update(It.IsAny<User>()));

        // Setup של SaveChangesAsync כך שיזרוק Exception
        mockContext.Setup(m => m.SaveChangesAsync(default)).ThrowsAsync(new System.Exception("Failed to save changes"));

        var Reposetory = new UserReposetory(mockContext.Object);

        // Act & Assert
        await Assert.ThrowsAsync<System.Exception>(async () => await Reposetory.Update(1, userToUpdate)); // תוודא שהשגיאה נזרקת
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


