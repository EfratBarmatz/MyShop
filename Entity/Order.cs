using System;
using System.Collections.Generic;

namespace Entities;

public partial class Order
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public DateOnly Date { get; set; }

    public int? Sum { get; set; }

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();

    public virtual User User { get; set; } = null!;
}
