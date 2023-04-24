using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodUserInfo
{
    public int Id { get; set; }

    public string UserIdentifier { get; set; } = null!;

    public string UserName { get; set; } = null!;

    public string? FullName { get; set; }

    public string? Email { get; set; }

    public DateTime Created { get; set; }

    public string? ImageUrl { get; set; }

    public string ScopeNames { get; set; } = null!;

    public bool Blocked { get; set; }
}
