using Entities;

namespace Servicess
{
    public interface IRatingServices
    {
        Task<Rating> Post(Rating rating);
    }
}