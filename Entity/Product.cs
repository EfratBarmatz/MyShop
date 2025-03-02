using System;
using System.Collections.Generic;

namespace Entities;

public partial class Product
{
    public int Id { get; set; }

    public int CategoryId { get; set; }

    public string? Name { get; set; }

    public string Descreaption { get; set; } = null!;

    public float Price { get; set; }

    public string Image { get; set; } = null!;

    public int? Quentity { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual ICollection<OrderItem> OrderItems { get; set; } = new List<OrderItem>();
}
