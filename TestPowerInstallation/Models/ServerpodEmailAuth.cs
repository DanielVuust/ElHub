using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodEmailAuth
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string Email { get; set; }

    public string Hash { get; set; }
}
