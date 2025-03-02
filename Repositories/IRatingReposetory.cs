using Entities;

namespace Reposetories
{
    public interface IRatingReposetory
    {
        Task Post(Rating rating);
    }
}