using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodAuthKey
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string Hash { get; set; } = null!;

    public string ScopeNames { get; set; } = null!;

    public string Method { get; set; } = null!;
}
