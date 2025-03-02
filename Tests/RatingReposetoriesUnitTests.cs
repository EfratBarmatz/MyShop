using System;
using System.Threading.Tasks;
using Moq;
using Xunit;
using Entities;
using Reposetories;
using Microsoft.EntityFrameworkCore;
using System.Threading;

public class RatingReposetoryUnitTest
{
    private readonly RatingReposetory _ratingRepository;

    public RatingReposetoryUnitTest()
    {
        // Mock context
        var contextMock = new Mock<MyShop327707238Context>();
        _ratingRepository = new RatingReposetory(contextMock.Object);
    }

    [Fact]
    public async Task Post_ShouldInsertRatingAndReturnRating()
    {
        // Arrange
        var rating = new Rating
        {
            Host = "localhost",
            Method = "GET",
            Path = "/api/rating",
            Referer = "http://example.com",
            UserAgent = "Mozilla/5.0",
            RecordDate = DateTime.Now
        };

        // Mock DbSet for Ratings
        var mockDbSet = new Mock<DbSet<Rating>>();

        // Set up AddAsync method on DbSet to return a Task that completes with the rating
       // mockDbSet.Setup(m => m.AddAsync(It.IsAny<Rating>(), It.IsAny<CancellationToken>()))
                 //.ReturnsAsync((Rating r, CancellationToken ct) => r);  // Return the rating that was passed in

        // Mock the context to return the mocked DbSet
        var mockContext = new Mock<MyShop327707238Context>();
        mockContext.Setup(c => c.Ratings).Returns(mockDbSet.Object);

        // Initialize repository with mock context
        var ratingRepository = new RatingReposetory(mockContext.Object);

        // Act
        var result = await ratingRepository.Post(rating);

        // Assert
        Assert.NotNull(result);
        Assert.Equal(rating.Host, result.Host);
    }
}
