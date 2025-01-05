using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public record OrderDTOPost(int UserId, DateOnly Date,List<OrderItemDTO> OrderItems);
    public record OrderDTOGet(int Id, string UserFirstName, DateOnly Date, int? Sum);  
    
}
