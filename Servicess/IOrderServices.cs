using Entities;

namespace Servicess
{
    public interface IOrderServices
    {
        Task<Order> Post(Order Order);
        Task<Order> GetById(int id);

    }
}