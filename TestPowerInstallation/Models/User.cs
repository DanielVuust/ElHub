using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class User
{
    public int Id { get; set; }

    public int AuthUserId { get; set; }

    public virtual ServerpodEmailAuth AuthUser { get; set; } = null!;
}
