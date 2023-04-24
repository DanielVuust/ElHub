using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodSessionLog
{
    public int Id { get; set; }

    public string ServerId { get; set; } = null!;

    public DateTime Time { get; set; }

    public string? Module { get; set; }

    public string? Endpoint { get; set; }

    public string? Method { get; set; }

    public double? Duration { get; set; }

    public int? NumQueries { get; set; }

    public bool? Slow { get; set; }

    public string? Error { get; set; }

    public string? StackTrace { get; set; }

    public int? AuthenticatedUserId { get; set; }

    public bool? IsOpen { get; set; }

    public DateTime Touched { get; set; }

    public virtual ICollection<ServerpodLog> ServerpodLogs { get; set; } = new List<ServerpodLog>();

    public virtual ICollection<ServerpodMessageLog> ServerpodMessageLogs { get; set; } = new List<ServerpodMessageLog>();

    public virtual ICollection<ServerpodQueryLog> ServerpodQueryLogs { get; set; } = new List<ServerpodQueryLog>();
}
