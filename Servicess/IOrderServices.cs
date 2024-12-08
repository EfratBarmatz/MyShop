using Entities;

namespace Servicess
{
    public interface IOrderServices
    {
        Task<Order> Add(Order Order);
        Task<Order> GetById(int id);
        
    }
}