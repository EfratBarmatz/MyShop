using Entities;

namespace Reposetories
{
    public interface IOrderReposetory
    {
        Task<Order> Post(Order order);
        Task<Order> GetById(int id);

    }
}