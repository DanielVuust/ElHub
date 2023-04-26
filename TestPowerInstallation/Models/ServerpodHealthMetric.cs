using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodHealthMetric
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string ServerId { get; set; } = null!;

    public DateTime Timestamp { get; set; }

    public bool IsHealthy { get; set; }

    public double Value { get; set; }

    public int Granularity { get; set; }
}
