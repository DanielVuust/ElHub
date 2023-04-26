using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodMethod
{
    public int Id { get; set; }

    public string Endpoint { get; set; } = null!;

    public string Method { get; set; } = null!;
}
