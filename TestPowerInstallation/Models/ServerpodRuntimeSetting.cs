using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodRuntimeSetting
{
    public int Id { get; set; }

    public string LogSettings { get; set; } = null!;

    public string LogSettingsOverrides { get; set; } = null!;

    public bool LogServiceCalls { get; set; }

    public bool LogMalformedCalls { get; set; }
}
