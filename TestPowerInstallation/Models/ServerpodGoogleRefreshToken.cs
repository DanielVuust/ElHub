using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodGoogleRefreshToken
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string RefreshToken { get; set; } = null!;
}
