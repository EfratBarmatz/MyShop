using Entities;
using Microsoft.Extensions.Logging;
using Moq;
using Moq.EntityFrameworkCore;
using Reposetories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Servicess;

namespace Tests
{
    public class OrderUnitTest
    {
        [Fact]
        public async Task CheckOrderSum_ValidCredentialsReturnOrder()
        {
            var products = new List<Product>
            {
                new Product { Id = 1, Price = 40 },
                new Product { Id = 2, Price = 20 }
            };

            var orders = new List<Order>
            {
                new Order
                {
                    UserId = 1,
                    Sum = 100,
                    OrderItems = new List<OrderItem>
                    {
                        new OrderItem { ProductId = 1, Quentity = 1 },
                        new OrderItem { ProductId = 2, Quentity = 1 }
                    }
                }
            };


            var mockContext = new Mock<MyShop327707238Context>();
            mockContext.Setup(x => x.Products).ReturnsDbSet(products);
            mockContext.Setup(x => x.Orders).ReturnsDbSet(new List<Order>());
            mockContext.Setup(x => x.SaveChangesAsync(default)).ReturnsAsync(1);
            
            var productRepository = new Mock<IProductReposetory>();
            productRepository.Setup(x => x.GetById(1)).ReturnsAsync(products[0]);
            productRepository.Setup(x => x.GetById(2)).ReturnsAsync(products[1]);

            var orderRepository = new OrderReposetory(mockContext.Object);
            var mockLogger = new Mock<ILogger<OrderServices>>();
            var orderService = new OrderServices(orderRepository, productRepository.Object, mockLogger.Object);

            var result = await orderService.Post(orders[0]);
            Assert.Equal(result, orders[0]);
        }

        [Fact]
        public async Task CheckOrderSum_InvalidOrderSumUpdatesOrderSum()
        {
            // Arrange
            var products = new List<Product>
            {
                new Product { Id = 1, Price = 40 },
                new Product { Id = 2, Price = 20 }
            };

            var invalidOrder = new Order
            {
                UserId = 1,
                Sum = 50, // סכום לא נכון
                OrderItems = new List<OrderItem>
                {
                    new OrderItem { ProductId = 1, Quentity = 2 },
                    new OrderItem { ProductId = 2, Quentity = 1 }
                }
            };

            var mockContext = new Mock<MyShop327707238Context>();
            mockContext.Setup(x => x.Products).ReturnsDbSet(products);
            mockContext.Setup(x => x.Orders).ReturnsDbSet(new List<Order>());
            mockContext.Setup(x => x.SaveChangesAsync(default)).ReturnsAsync(1);

            var productRepository = new Mock<IProductReposetory>();
            productRepository.Setup(x => x.GetById(1)).ReturnsAsync(products[0]);
            productRepository.Setup(x => x.GetById(2)).ReturnsAsync(products[1]);

            var orderRepository = new OrderReposetory(mockContext.Object);
            var mockLogger = new Mock<ILogger<OrderServices>>();
            var orderService = new OrderServices(orderRepository, productRepository.Object, mockLogger.Object);

            // Act
            var result = await orderService.Post(invalidOrder);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(60, result.Sum); // הסכום המעודכן צריך להיות 100
            Assert.Equal(invalidOrder.UserId, result.UserId);
            Assert.Equal(invalidOrder.OrderItems.Count, result.OrderItems.Count);
        }

    
    }
}
