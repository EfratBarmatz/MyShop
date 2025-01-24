using Entities;

namespace Reposetories
{
    public interface IRatingReposetory
    {
        Task<Rating> Post(Rating rating);
    }
}