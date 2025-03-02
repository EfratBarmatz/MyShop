using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Moq;
using Xunit;
using Entities;
using Reposetories;

public class CategoryReposetoryUnitTests
{
    private readonly Mock<MyShop327707238Context> _mockContext;
    private readonly CategoryReposetory _categoryReposetory;

    public CategoryReposetoryUnitTests()
    {
        _mockContext = new Mock<MyShop327707238Context>();
        _categoryReposetory = new CategoryReposetory(_mockContext.Object);
    }

    [Fact]
    public async Task Get_ShouldReturnListOfCategories()
    {
        // Arrange
        var categories = new List<Category>
        {
            new Category { Id = 1, Name = "Category 1" },
            new Category { Id = 2, Name = "Category 2" }
        };

        var mockSet = new Mock<DbSet<Category>>();

        // Mocking IQueryable for the DbSet
        mockSet.As<IQueryable<Category>>()
            .Setup(m => m.Provider).Returns(categories.AsQueryable().Provider);
        mockSet.As<IQueryable<Category>>()
            .Setup(m => m.Expression).Returns(categories.AsQueryable().Expression);
        mockSet.As<IQueryable<Category>>()
            .Setup(m => m.ElementType).Returns(categories.AsQueryable().ElementType);
        mockSet.As<IQueryable<Category>>()
            .Setup(m => m.GetEnumerator()).Returns(categories.AsQueryable().GetEnumerator());

        // Instead of using ToListAsync directly, return the result asynchronously
        mockSet.Setup(m => m.ToListAsync(It.IsAny<System.Threading.CancellationToken>()))
            .Returns(Task.FromResult(categories.ToList()));  // Use Task.FromResult to return the list asynchronously

        // Set up the mock context to return the mock DbSet
        _mockContext.Setup(x => x.Categories).Returns(mockSet.Object);

        // Act
        var result = await _categoryReposetory.Get();

        // Assert
        Assert.NotNull(result);
        Assert.Equal(2, result.Count);
        Assert.Equal("Category 1", result[0].Name);
        Assert.Equal("Category 2", result[1].Name);
    }
}
