using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodEmailCreateRequest
{
    public int Id { get; set; }

    public string UserName { get; set; }

    public string Email { get; set; }

    public string Hash { get; set; }

    public string VerificationCode { get; set; }
}
