using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodEmailFailedSignIn
{
    public int Id { get; set; }

    public string Email { get; set; }

    public DateTime Time { get; set; }

    public string IpAddress { get; set; }
}
