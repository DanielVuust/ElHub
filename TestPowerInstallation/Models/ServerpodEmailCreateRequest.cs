using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodEmailCreateRequest
{
    public int Id { get; set; }

    public string UserName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string Hash { get; set; } = null!;

    public string VerificationCode { get; set; } = null!;
}
