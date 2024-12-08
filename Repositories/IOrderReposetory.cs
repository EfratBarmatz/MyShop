using Entities;

namespace Reposetories
{
    public interface IOrderReposetory
    {
        Task<Order> Add(Order order);
        Task<List<Order>> Get();
        Task<Order> GetById(int id);
        Task<Order> Update(int id, Order OrderToUpdate);
    }
}