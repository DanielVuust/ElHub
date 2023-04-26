using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodQueryLog
{
    public int Id { get; set; }

    public string ServerId { get; set; } = null!;

    public int SessionLogId { get; set; }

    public int? MessageId { get; set; }

    public string Query { get; set; } = null!;

    public double Duration { get; set; }

    public int? NumRows { get; set; }

    public string? Error { get; set; }

    public string? StackTrace { get; set; }

    public bool Slow { get; set; }

    public int Order { get; set; }

    public virtual ServerpodSessionLog SessionLog { get; set; } = null!;
}
