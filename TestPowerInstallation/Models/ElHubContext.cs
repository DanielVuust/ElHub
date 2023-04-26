using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TestPowerInstallation.Models;

public partial class ElHubContext : DbContext
{
    public ElHubContext()
    {
    }

    public ElHubContext(DbContextOptions<ElHubContext> options)
        : base(options)
    {
    }

    public virtual DbSet<PowerInstallation> PowerInstallations { get; set; }

    public virtual DbSet<PowerReadInterval> PowerReadIntervals { get; set; }

    public virtual DbSet<ServerpodAuthKey> ServerpodAuthKeys { get; set; }

    public virtual DbSet<ServerpodCloudStorage> ServerpodCloudStorages { get; set; }

    public virtual DbSet<ServerpodCloudStorageDirectUpload> ServerpodCloudStorageDirectUploads { get; set; }

    public virtual DbSet<ServerpodEmailAuth> ServerpodEmailAuths { get; set; }

    public virtual DbSet<ServerpodEmailCreateRequest> ServerpodEmailCreateRequests { get; set; }

    public virtual DbSet<ServerpodEmailFailedSignIn> ServerpodEmailFailedSignIns { get; set; }

    public virtual DbSet<ServerpodEmailReset> ServerpodEmailResets { get; set; }

    public virtual DbSet<ServerpodFutureCall> ServerpodFutureCalls { get; set; }

    public virtual DbSet<ServerpodGoogleRefreshToken> ServerpodGoogleRefreshTokens { get; set; }

    public virtual DbSet<ServerpodHealthConnectionInfo> ServerpodHealthConnectionInfos { get; set; }

    public virtual DbSet<ServerpodHealthMetric> ServerpodHealthMetrics { get; set; }

    public virtual DbSet<ServerpodLog> ServerpodLogs { get; set; }

    public virtual DbSet<ServerpodMessageLog> ServerpodMessageLogs { get; set; }

    public virtual DbSet<ServerpodMethod> ServerpodMethods { get; set; }

    public virtual DbSet<ServerpodQueryLog> ServerpodQueryLogs { get; set; }

    public virtual DbSet<ServerpodReadwriteTest> ServerpodReadwriteTests { get; set; }

    public virtual DbSet<ServerpodRuntimeSetting> ServerpodRuntimeSettings { get; set; }

    public virtual DbSet<ServerpodSessionLog> ServerpodSessionLogs { get; set; }

    public virtual DbSet<ServerpodUserImage> ServerpodUserImages { get; set; }

    public virtual DbSet<ServerpodUserInfo> ServerpodUserInfos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("User ID=postgres;Password=vPV4Xj6q2B3iXMhUzNfFXxUYlR9RMrZK;Host=localhost;Port=8090;Database=el_hub;Pooling=true;Connection Lifetime=0;;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<PowerInstallation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("power_installation_pkey");

            entity.ToTable("power_installation");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ComponentId).HasColumnName("componentId");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Owners)
                .HasColumnType("json")
                .HasColumnName("owners");
            entity.Property(e => e.Type).HasColumnName("type");
        });

        modelBuilder.Entity<PowerReadInterval>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("power_read_interval_pkey");

            entity.ToTable("power_read_interval");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.LengthInSeconds).HasColumnName("lengthInSeconds");
            entity.Property(e => e.PowerInKilowatts).HasColumnName("powerInKilowatts");
            entity.Property(e => e.PowerInstallationId).HasColumnName("powerInstallationId");
            entity.Property(e => e.PowerReadIntervalEnd)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("powerReadIntervalEnd");
            entity.Property(e => e.PowerReadIntervalStart)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("powerReadIntervalStart");

            entity.HasOne(d => d.PowerInstallation).WithMany(p => p.PowerReadIntervals)
                .HasForeignKey(d => d.PowerInstallationId)
                .HasConstraintName("power_read_interval_fk_0");
        });

        modelBuilder.Entity<ServerpodAuthKey>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_auth_key_pkey");

            entity.ToTable("serverpod_auth_key");

            entity.HasIndex(e => e.UserId, "serverpod_auth_key_userid_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Hash).HasColumnName("hash");
            entity.Property(e => e.Method).HasColumnName("method");
            entity.Property(e => e.ScopeNames)
                .HasColumnType("json")
                .HasColumnName("scopeNames");
            entity.Property(e => e.UserId).HasColumnName("userId");
        });

        modelBuilder.Entity<ServerpodCloudStorage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_cloud_storage_pkey");

            entity.ToTable("serverpod_cloud_storage");

            entity.HasIndex(e => e.Expiration, "serverpod_cloud_storage_expiration");

            entity.HasIndex(e => new { e.StorageId, e.Path }, "serverpod_cloud_storage_path_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AddedTime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("addedTime");
            entity.Property(e => e.ByteData).HasColumnName("byteData");
            entity.Property(e => e.Expiration)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expiration");
            entity.Property(e => e.Path).HasColumnName("path");
            entity.Property(e => e.StorageId).HasColumnName("storageId");
            entity.Property(e => e.Verified).HasColumnName("verified");
        });

        modelBuilder.Entity<ServerpodCloudStorageDirectUpload>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_cloud_storage_direct_upload_pkey");

            entity.ToTable("serverpod_cloud_storage_direct_upload");

            entity.HasIndex(e => new { e.StorageId, e.Path }, "serverpod_cloud_storage_direct_upload_storage_path").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AuthKey).HasColumnName("authKey");
            entity.Property(e => e.Expiration)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expiration");
            entity.Property(e => e.Path).HasColumnName("path");
            entity.Property(e => e.StorageId).HasColumnName("storageId");
        });

        modelBuilder.Entity<ServerpodEmailAuth>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_email_auth_pkey");

            entity.ToTable("serverpod_email_auth");

            entity.HasIndex(e => e.Email, "serverpod_email_auth_email").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Hash).HasColumnName("hash");
            entity.Property(e => e.UserId).HasColumnName("userId");
        });

        modelBuilder.Entity<ServerpodEmailCreateRequest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_email_create_request_pkey");

            entity.ToTable("serverpod_email_create_request");

            entity.HasIndex(e => e.Email, "serverpod_email_auth_create_account_request_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Hash).HasColumnName("hash");
            entity.Property(e => e.UserName).HasColumnName("userName");
            entity.Property(e => e.VerificationCode).HasColumnName("verificationCode");
        });

        modelBuilder.Entity<ServerpodEmailFailedSignIn>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_email_failed_sign_in_pkey");

            entity.ToTable("serverpod_email_failed_sign_in");

            entity.HasIndex(e => e.Email, "serverpod_email_failed_sign_in_email_idx");

            entity.HasIndex(e => e.Time, "serverpod_email_failed_sign_in_time_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.IpAddress).HasColumnName("ipAddress");
            entity.Property(e => e.Time)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("time");
        });

        modelBuilder.Entity<ServerpodEmailReset>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_email_reset_pkey");

            entity.ToTable("serverpod_email_reset");

            entity.HasIndex(e => e.VerificationCode, "serverpod_email_reset_verification_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Expiration)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expiration");
            entity.Property(e => e.UserId).HasColumnName("userId");
            entity.Property(e => e.VerificationCode).HasColumnName("verificationCode");
        });

        modelBuilder.Entity<ServerpodFutureCall>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_future_call_pkey");

            entity.ToTable("serverpod_future_call");

            entity.HasIndex(e => e.Identifier, "serverpod_future_call_identifier_idx");

            entity.HasIndex(e => e.ServerId, "serverpod_future_call_serverid_idx");

            entity.HasIndex(e => e.Time, "serverpod_future_call_time_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Identifier).HasColumnName("identifier");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.SerializedObject).HasColumnName("serializedObject");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.Time)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("time");
        });

        modelBuilder.Entity<ServerpodGoogleRefreshToken>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_google_refresh_token_pkey");

            entity.ToTable("serverpod_google_refresh_token");

            entity.HasIndex(e => e.UserId, "serverpod_google_refresh_token_userid_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.RefreshToken).HasColumnName("refreshToken");
            entity.Property(e => e.UserId).HasColumnName("userId");
        });

        modelBuilder.Entity<ServerpodHealthConnectionInfo>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_health_connection_info_pkey");

            entity.ToTable("serverpod_health_connection_info");

            entity.HasIndex(e => new { e.Timestamp, e.ServerId, e.Granularity }, "serverpod_health_connection_info_timestamp_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Active).HasColumnName("active");
            entity.Property(e => e.Closing).HasColumnName("closing");
            entity.Property(e => e.Granularity).HasColumnName("granularity");
            entity.Property(e => e.Idle).HasColumnName("idle");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.Timestamp)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("timestamp");
        });

        modelBuilder.Entity<ServerpodHealthMetric>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_health_metric_pkey");

            entity.ToTable("serverpod_health_metric");

            entity.HasIndex(e => new { e.Timestamp, e.ServerId, e.Name, e.Granularity }, "serverpod_health_metric_timestamp_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Granularity).HasColumnName("granularity");
            entity.Property(e => e.IsHealthy).HasColumnName("isHealthy");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.Timestamp)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("timestamp");
            entity.Property(e => e.Value).HasColumnName("value");
        });

        modelBuilder.Entity<ServerpodLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_log_pkey");

            entity.ToTable("serverpod_log");

            entity.HasIndex(e => e.SessionLogId, "serverpod_log_sessionlogid_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Error).HasColumnName("error");
            entity.Property(e => e.LogLevel).HasColumnName("logLevel");
            entity.Property(e => e.Message).HasColumnName("message");
            entity.Property(e => e.MessageId).HasColumnName("messageId");
            entity.Property(e => e.Order).HasColumnName("order");
            entity.Property(e => e.Reference).HasColumnName("reference");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.SessionLogId).HasColumnName("sessionLogId");
            entity.Property(e => e.StackTrace).HasColumnName("stackTrace");
            entity.Property(e => e.Time)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("time");

            entity.HasOne(d => d.SessionLog).WithMany(p => p.ServerpodLogs)
                .HasForeignKey(d => d.SessionLogId)
                .HasConstraintName("serverpod_log_fk_0");
        });

        modelBuilder.Entity<ServerpodMessageLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_message_log_pkey");

            entity.ToTable("serverpod_message_log");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Duration).HasColumnName("duration");
            entity.Property(e => e.Endpoint).HasColumnName("endpoint");
            entity.Property(e => e.Error).HasColumnName("error");
            entity.Property(e => e.MessageId).HasColumnName("messageId");
            entity.Property(e => e.MessageName).HasColumnName("messageName");
            entity.Property(e => e.Order).HasColumnName("order");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.SessionLogId).HasColumnName("sessionLogId");
            entity.Property(e => e.Slow).HasColumnName("slow");
            entity.Property(e => e.StackTrace).HasColumnName("stackTrace");

            entity.HasOne(d => d.SessionLog).WithMany(p => p.ServerpodMessageLogs)
                .HasForeignKey(d => d.SessionLogId)
                .HasConstraintName("serverpod_message_log_fk_0");
        });

        modelBuilder.Entity<ServerpodMethod>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_method_pkey");

            entity.ToTable("serverpod_method");

            entity.HasIndex(e => new { e.Endpoint, e.Method }, "serverpod_method_endpoint_method_idx").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Endpoint).HasColumnName("endpoint");
            entity.Property(e => e.Method).HasColumnName("method");
        });

        modelBuilder.Entity<ServerpodQueryLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_query_log_pkey");

            entity.ToTable("serverpod_query_log");

            entity.HasIndex(e => e.SessionLogId, "serverpod_query_log_sessionlogid_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Duration).HasColumnName("duration");
            entity.Property(e => e.Error).HasColumnName("error");
            entity.Property(e => e.MessageId).HasColumnName("messageId");
            entity.Property(e => e.NumRows).HasColumnName("numRows");
            entity.Property(e => e.Order).HasColumnName("order");
            entity.Property(e => e.Query).HasColumnName("query");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.SessionLogId).HasColumnName("sessionLogId");
            entity.Property(e => e.Slow).HasColumnName("slow");
            entity.Property(e => e.StackTrace).HasColumnName("stackTrace");

            entity.HasOne(d => d.SessionLog).WithMany(p => p.ServerpodQueryLogs)
                .HasForeignKey(d => d.SessionLogId)
                .HasConstraintName("serverpod_query_log_fk_0");
        });

        modelBuilder.Entity<ServerpodReadwriteTest>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_readwrite_test_pkey");

            entity.ToTable("serverpod_readwrite_test");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Number).HasColumnName("number");
        });

        modelBuilder.Entity<ServerpodRuntimeSetting>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_runtime_settings_pkey");

            entity.ToTable("serverpod_runtime_settings");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.LogMalformedCalls).HasColumnName("logMalformedCalls");
            entity.Property(e => e.LogServiceCalls).HasColumnName("logServiceCalls");
            entity.Property(e => e.LogSettings)
                .HasColumnType("json")
                .HasColumnName("logSettings");
            entity.Property(e => e.LogSettingsOverrides)
                .HasColumnType("json")
                .HasColumnName("logSettingsOverrides");
        });

        modelBuilder.Entity<ServerpodSessionLog>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_session_log_pkey");

            entity.ToTable("serverpod_session_log");

            entity.HasIndex(e => e.IsOpen, "serverpod_session_log_isopen_idx");

            entity.HasIndex(e => e.ServerId, "serverpod_session_log_serverid_idx");

            entity.HasIndex(e => e.Touched, "serverpod_session_log_touched_idx");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AuthenticatedUserId).HasColumnName("authenticatedUserId");
            entity.Property(e => e.Duration).HasColumnName("duration");
            entity.Property(e => e.Endpoint).HasColumnName("endpoint");
            entity.Property(e => e.Error).HasColumnName("error");
            entity.Property(e => e.IsOpen).HasColumnName("isOpen");
            entity.Property(e => e.Method).HasColumnName("method");
            entity.Property(e => e.Module).HasColumnName("module");
            entity.Property(e => e.NumQueries).HasColumnName("numQueries");
            entity.Property(e => e.ServerId).HasColumnName("serverId");
            entity.Property(e => e.Slow).HasColumnName("slow");
            entity.Property(e => e.StackTrace).HasColumnName("stackTrace");
            entity.Property(e => e.Time)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("time");
            entity.Property(e => e.Touched)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("touched");
        });

        modelBuilder.Entity<ServerpodUserImage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_user_image_pkey");

            entity.ToTable("serverpod_user_image");

            entity.HasIndex(e => new { e.UserId, e.Version }, "serverpod_user_image_user_id");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Url).HasColumnName("url");
            entity.Property(e => e.UserId).HasColumnName("userId");
            entity.Property(e => e.Version).HasColumnName("version");
        });

        modelBuilder.Entity<ServerpodUserInfo>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("serverpod_user_info_pkey");

            entity.ToTable("serverpod_user_info");

            entity.HasIndex(e => e.Email, "serverpod_user_info_email");

            entity.HasIndex(e => e.UserIdentifier, "serverpod_user_info_user_identifier").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Blocked).HasColumnName("blocked");
            entity.Property(e => e.Created)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.FullName).HasColumnName("fullName");
            entity.Property(e => e.ImageUrl).HasColumnName("imageUrl");
            entity.Property(e => e.ScopeNames)
                .HasColumnType("json")
                .HasColumnName("scopeNames");
            entity.Property(e => e.UserIdentifier).HasColumnName("userIdentifier");
            entity.Property(e => e.UserName).HasColumnName("userName");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
