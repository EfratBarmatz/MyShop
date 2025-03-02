using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public record UserDTO([EmailAddress] string Email,string Password, [MaxLength(20, ErrorMessage = "first name can be maxLength 20 chars"), MinLength(3, ErrorMessage = "first name can be minLength 3 chars")] string? FirstName, string? LastName);

    public record UserDTOGet(int Id, [EmailAddress] string Email, [MaxLength(20, ErrorMessage = "first name can be maxLength 20 chars"), MinLength(3, ErrorMessage = "first name can be minLength 3 chars")] string? FirstName, string? LastName);
}
