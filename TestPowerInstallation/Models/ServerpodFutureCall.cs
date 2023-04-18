using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodFutureCall
{
    public int Id { get; set; }

    public string Name { get; set; }

    public DateTime Time { get; set; }

    public string SerializedObject { get; set; }

    public string ServerId { get; set; }

    public string Identifier { get; set; }
}
