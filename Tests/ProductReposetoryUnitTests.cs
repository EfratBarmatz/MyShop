using Moq;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Xunit;
using Entities;
using Microsoft.EntityFrameworkCore;
using Reposetories;

public class ProductReposetoryUnitTests
{
    [Fact]
    public async Task Get_FiltersByDescription_ReturnsFilteredProducts()
    {
        // Arrange
        var data = new List<Product>
    {
        new Product { Id = 1, Name = "Product1", Price = 100, Descreaption = "Description A", CategoryId = 1 },
        new Product { Id = 2, Name = "Product2", Price = 150, Descreaption = "Description B", CategoryId = 2 },
        new Product { Id = 3, Name = "Product3", Price = 200, Descreaption = "Description A", CategoryId = 1 }
    }.AsQueryable();

        var mockSet = new Mock<DbSet<Product>>();

        mockSet.As<IQueryable<Product>>().Setup(m => m.Provider).Returns(data.Provider);
        mockSet.As<IQueryable<Product>>().Setup(m => m.Expression).Returns(data.Expression);
        mockSet.As<IQueryable<Product>>().Setup(m => m.ElementType).Returns(data.ElementType);
        mockSet.As<IQueryable<Product>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());

        // Mock של ToListAsync עבור DbSet
        mockSet.Setup(m => m.ToListAsync(It.IsAny<CancellationToken>())).ReturnsAsync(data.ToList());

        var mockContext = new Mock<MyShop327707238Context>();
        mockContext.Setup(c => c.Products).Returns(mockSet.Object);

        var Reposetory = new ProductReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.Get(desc: "Description A", minPrice: null, maxPrice: null, categoryIds: new int?[] { });

        // Assert
        Assert.Equal(2, result.Count()); // ציפייה לקבל 2 מוצרים שמתאימים לתיאור "Description A"
        Assert.All(result, product => Assert.Contains("Description A", product.Descreaption)); // תוודא שכל המוצרים יש להם את התיאור המתאים
    }


    [Fact]
    public async Task Get_FiltersByPrice_ReturnsFilteredProducts()
    {
        // Arrange
        var mockSet = new Mock<DbSet<Product>>();
        var data = new List<Product>
        {
            new Product { Id = 1, Name = "Product1", Price = 100, Descreaption = "Description A", CategoryId = 1 },
            new Product { Id = 2, Name = "Product2", Price = 150, Descreaption = "Description B", CategoryId = 2 },
            new Product { Id = 3, Name = "Product3", Price = 200, Descreaption = "Description A", CategoryId = 1 }
        }.AsQueryable();

        mockSet.As<IQueryable<Product>>().Setup(m => m.Provider).Returns(data.Provider);
        mockSet.As<IQueryable<Product>>().Setup(m => m.Expression).Returns(data.Expression);
        mockSet.As<IQueryable<Product>>().Setup(m => m.ElementType).Returns(data.ElementType);
        mockSet.As<IQueryable<Product>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());

        var mockContext = new Mock<MyShop327707238Context>();
        mockContext.Setup(c => c.Products).Returns(mockSet.Object);

        var Reposetory = new ProductReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.Get(desc: null, minPrice: 100, maxPrice: 150, categoryIds: new int?[] { });

        // Assert
        Assert.Equal(2, result.Count()); // ציפייה לקבל 2 מוצרים במחירים בין 100 ל-150
        Assert.All(result, product => Assert.True(product.Price >= 100 && product.Price <= 150));

        //Assert.All(result, product => Assert.InRange(product.Price, 100, 150)); // תוודא שכל המוצרים במחיר בטווח המבוקש
    }

    [Fact]
    public async Task Get_FiltersByCategory_ReturnsFilteredProducts()
    {
        // Arrange
        var mockSet = new Mock<DbSet<Product>>();
        var data = new List<Product>
        {
            new Product { Id = 1, Name = "Product1", Price = 100, Descreaption = "Description A", CategoryId = 1 },
            new Product { Id = 2, Name = "Product2", Price = 150, Descreaption = "Description B", CategoryId = 2 },
            new Product { Id = 3, Name = "Product3", Price = 200, Descreaption = "Description A", CategoryId = 1 }
        }.AsQueryable();

        mockSet.As<IQueryable<Product>>().Setup(m => m.Provider).Returns(data.Provider);
        mockSet.As<IQueryable<Product>>().Setup(m => m.Expression).Returns(data.Expression);
        mockSet.As<IQueryable<Product>>().Setup(m => m.ElementType).Returns(data.ElementType);
        mockSet.As<IQueryable<Product>>().Setup(m => m.GetEnumerator()).Returns(data.GetEnumerator());

        var mockContext = new Mock<MyShop327707238Context>();
        mockContext.Setup(c => c.Products).Returns(mockSet.Object);

        var Reposetory = new ProductReposetory(mockContext.Object);

        // Act
        var result = await Reposetory.Get(desc: null, minPrice: null, maxPrice: null, categoryIds: new int?[] { 1 });

        // Assert
        Assert.Equal(2, result.Count()); // ציפייה לקבל 2 מוצרים מקטגוריה 1
        Assert.All(result, product => Assert.Equal(1, product.CategoryId));

        //Assert.All(result, product => Assert.Contains(1, product.CategoryId)); // תוודא שכל המוצרים שייכים לקטגוריה 1
    }
}
