using System;
using System.Collections.Generic;

namespace TestPowerInstallation.Models;

public partial class ServerpodCloudStorageDirectUpload
{
    public int Id { get; set; }

    public string StorageId { get; set; } = null!;

    public string Path { get; set; } = null!;

    public DateTime Expiration { get; set; }

    public string AuthKey { get; set; } = null!;
}
