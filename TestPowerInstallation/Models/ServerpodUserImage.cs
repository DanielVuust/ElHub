using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodUserImage
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int Version { get; set; }

    public string Url { get; set; } = null!;
}
