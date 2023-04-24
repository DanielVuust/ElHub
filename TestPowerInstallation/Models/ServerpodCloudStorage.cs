using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodCloudStorage
{
    public int Id { get; set; }

    public string StorageId { get; set; } = null!;

    public string Path { get; set; } = null!;

    public DateTime AddedTime { get; set; }

    public DateTime? Expiration { get; set; }

    public byte[] ByteData { get; set; } = null!;

    public bool Verified { get; set; }
}
