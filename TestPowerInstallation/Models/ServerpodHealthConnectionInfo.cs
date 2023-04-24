using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodHealthConnectionInfo
{
    public int Id { get; set; }

    public string ServerId { get; set; } = null!;

    public DateTime Timestamp { get; set; }

    public int Active { get; set; }

    public int Closing { get; set; }

    public int Idle { get; set; }

    public int Granularity { get; set; }
}
