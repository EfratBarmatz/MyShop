using Entities;
using Microsoft.EntityFrameworkCore;
using Moq;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using Entities;
using Microsoft.EntityFrameworkCore;
using Reposetories;

public class OrderReposetoryUnitTests
{
    [Fact]
    public async Task Get_ReturnsOrderWithUserAndOrderItems()
    {
        // Arrange
        var mockSetOrder = new Mock<DbSet<Order>>();
        var mockSetUser = new Mock<DbSet<User>>();

        var order = new Order
        {
            Id = 1,
            UserId = 2,
            Date = new DateOnly(2025, 1, 29),
            Sum = 500,
            OrderItems = new List<OrderItem>
            {
                new OrderItem { ProductId = 1, Quentity = 2 },
                new OrderItem { ProductId = 3, Quentity = 1 }
            }
        };

        var user = new User
        {
            Id = 2,
            Email = "testuser@example.com",
            FirstName = "Test",
            LastName = "User",
            Password = "password123"
        };

        var dataOrders = new List<Order> { order }.AsQueryable();
        var dataUsers = new List<User> { user }.AsQueryable();

        mockSetOrder.As<IQueryable<Order>>().Setup(m => m.Provider).Returns(dataOrders.Provider);
        mockSetOrder.As<IQueryable<Order>>().Setup(m => m.Expression).Returns(dataOrders.Expression);
        mockSetOrder.As<IQueryable<Order>>().Setup(m => m.ElementType).Returns(dataOrders.ElementType);
        mockSetOrder.As<IQueryable<Order>>().Setup(m => m.GetEnumerator()).Returns(dataOrders.GetEnumerator());

        mockSetUser.As<IQueryable<User>>().Setup(m => m.Provider).Returns(dataUsers.Provider);
        mockSetUser.As<IQueryable<User>>().Setup(m => m.Expression).Returns(dataUsers.Expression);
        mockSetUser.As<IQueryable<User>>().Setup(m => m.ElementType).Returns(dataUsers.ElementType);
        mockSetUser.As<IQueryable<User>>().Setup(m => m.GetEnumerator()).Returns(dataUsers.GetEnumerator());

        var mockContext = new Mock<MyShop327707238Context>();
        mockContext.Setup(c => c.Orders).Returns(mockSetOrder.Object);
        mockContext.Setup(c => c.Users).Returns(mockSetUser.Object);

        var orderReposetory = new OrderReposetory(mockContext.Object);

        // Act
        var result = await orderReposetory.GetById(1); // אנחנו מחפשים את ההזמנה עם id=1

        // Assert
        Assert.NotNull(result);  // התוצאה לא אמורה להיות null
        Assert.Equal(1, result.Id);  // ה-id של ההזמנה צריך להיות 1
        Assert.Equal(2, result.UserId);  // ה-userId של ההזמנה צריך להיות 2
        Assert.NotNull(result.User);  // הפונקציה צריכה לכלול את המשתמש
        Assert.Equal("Test", result.User.FirstName);  // שם המשתמש צריך להיות "Test"
        Assert.Equal(2, result.OrderItems.Count);  // צריכים להיות 2 פריטים בהזמנה
    }
    private readonly Mock<MyShop327707238Context> _mockContext;
    private readonly OrderReposetory _orderReposetory; // Assuming you have a Reposetory that contains the Post method

    public OrderReposetoryUnitTests()
    {
        _mockContext = new Mock<MyShop327707238Context>();
        _orderReposetory = new OrderReposetory(_mockContext.Object); // Assuming you pass the context to the Reposetory
    }

    [Fact]
    public async Task Post_ShouldAddOrderAndReturnOrder()
    {
        // Arrange
        var order = new Order { Id = 1, UserId = 1, Date = DateOnly.FromDateTime(DateTime.Now) };

        //_mockContext.Setup(x => x.Orders.AddAsync(order, default)).ReturnsAsync((Order o, CancellationToken ct) => o);
        _mockContext.Setup(x => x.SaveChangesAsync(default)).ReturnsAsync(1);

        // Act
        var result = await _orderReposetory.Post(order);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(order.Id, result.Id);
        _mockContext.Verify(x => x.Orders.AddAsync(order, default), Times.Once);
        _mockContext.Verify(x => x.SaveChangesAsync(default), Times.Once);
    }
}
