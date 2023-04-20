--
-- Class PowerInstallation as table power_installation
--

CREATE TABLE "power_installation" (
  "id" serial,
  "name" text NOT NULL,
  "type" text,
  "owners" json
);

ALTER TABLE ONLY "power_installation"
  ADD CONSTRAINT power_installation_pkey PRIMARY KEY (id);


--
-- Class PowerReadInterval as table power_read_interval
--

CREATE TABLE "power_read_interval" (
  "id" serial,
  "powerInstallationId" integer NOT NULL,
  "lengthInSeconds" integer NOT NULL,
  "powerInKilowatts" integer NOT NULL,
  "powerReadIntervalStart" timestamp without time zone NOT NULL,
  "powerReadIntervalEnd" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "power_read_interval"
  ADD CONSTRAINT power_read_interval_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "power_read_interval"
  ADD CONSTRAINT power_read_interval_fk_0
    FOREIGN KEY("powerInstallationId")
      REFERENCES power_installation(id)
        ON DELETE CASCADE;

--
-- Class ServerpodEmailAuth as table serverpod_email_auth
--

CREATE TABLE "serverpod_email_auth" (
  "id" serial,
  "test" text NOT NULL
);

ALTER TABLE ONLY "serverpod_email_auth"
  ADD CONSTRAINT serverpod_email_auth_pkey PRIMARY KEY (id);


--
-- Class User as table user
--

CREATE TABLE "user" (
  "id" serial,
  "authUserId" integer NOT NULL
);

ALTER TABLE ONLY "user"
  ADD CONSTRAINT user_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "user"
  ADD CONSTRAINT user_fk_0
    FOREIGN KEY("authUserId")
      REFERENCES serverpod_email_auth(id)
        ON DELETE CASCADE;

