using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class PowerReadInterval
{
    public int Id { get; set; }

    public int PowerInstallationId { get; set; }

    public int LengthInSeconds { get; set; }

    public int PowerInKilowatts { get; set; }

    public DateTime PowerReadIntervalStart { get; set; }

    public DateTime PowerReadIntervalEnd { get; set; }

    public virtual PowerInstallation PowerInstallation { get; set; } = null!;
}
