using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public record OrderDTO(string Id,string UserFirstName, DateOnly Date, int? Sum, ICollection<string>ProductName);
    
}
