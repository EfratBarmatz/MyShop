using Entities;

namespace Servicess
{
    public interface IRatingServices
    {
        Task Post(Rating rating);
    }
}