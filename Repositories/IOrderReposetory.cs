using Entities;

namespace Reposetories
{
    public interface IOrderReposetory
    {
        Task<Order> Add(Order order);
        Task<Order> GetById(int id);
       
    }
}