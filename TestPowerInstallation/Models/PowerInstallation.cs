using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class PowerInstallation
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Type { get; set; }

    public string? Owners { get; set; }

    public string ComponentId { get; set; } = null!;

    public virtual ICollection<PowerReadInterval> PowerReadIntervals { get; set; } = new List<PowerReadInterval>();
}
