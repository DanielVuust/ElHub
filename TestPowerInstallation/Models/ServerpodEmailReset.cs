using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodEmailReset
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public string VerificationCode { get; set; } = null!;

    public DateTime Expiration { get; set; }
}
