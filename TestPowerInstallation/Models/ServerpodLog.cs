using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodLog
{
    public int Id { get; set; }

    public int SessionLogId { get; set; }

    public int? MessageId { get; set; }

    public string Reference { get; set; }

    public string ServerId { get; set; }

    public DateTime Time { get; set; }

    public int LogLevel { get; set; }

    public string Message { get; set; }

    public string Error { get; set; }

    public string StackTrace { get; set; }

    public int Order { get; set; }

    public virtual ServerpodSessionLog SessionLog { get; set; }
}
