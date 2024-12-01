using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Entities;

public partial class User
{
    public int UserId { get; set; }
    [EmailAddress, Required]
    public string Email { get; set; } = null!;
    [StringLength(15, ErrorMessage = "Password can be between 2 till 20 letters", MinimumLength = 2), Required]
    public string Password { get; set; } = null!;
    [StringLength(15, ErrorMessage = "FirstName can be between 2 till 20 letters", MinimumLength = 2)]
    public string? FirstName { get; set; }
    [StringLength(15, ErrorMessage = "LastName can be between 2 till 20 letters", MinimumLength = 2)]
    public string? LastName { get; set; }
}
