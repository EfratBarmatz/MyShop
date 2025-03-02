using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace Entities;

public partial class User
{
    public int Id { get; set; }
    [EmailAddress,Required]
    public string Email { get; set; } = null!;

    public string Password { get; set; } = null!;
    [MaxLength(20,ErrorMessage ="first name can be maxLength 20 chars"),MinLength(3,ErrorMessage = "first name can be minLength 3 chars")]
    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
