using Entities;

namespace Servicess
{
    public interface IOrderServices
    {
        Task<Order> Add(Order Order);
        Task<List<Order>> Get();
        Task<Order> GetById(int id);
        Task<Order> Update(int id, Order OrderToUpdate);
    }
}