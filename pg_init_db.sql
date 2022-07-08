-- DROP TABLE IF EXISTS <TABLE NAME>;
-- DROP TABLE IF EXISTS "Users" CASCADE;
-- DROP TABLE IF EXISTS "UsersSecureContacts" CASCADE;
-- DROP TABLE IF EXISTS "DailyAnalyses" CASCADE;
-- DROP TABLE IF EXISTS "Bracelets" CASCADE;
-- DROP TABLE IF EXISTS "Alarms" CASCADE;

-- Users
CREATE TABLE "Users"(
    "Username" varchar(256) PRIMARY KEY,
    "Role" varchar(64) NOT NULL
);
-- Users Secure Contacts Emails
CREATE TABLE "UsersSecureContacts"(
    "Id" uuid PRIMARY KEY,
    "Username" varchar (256) references "Users" ("Username") NOT NULL,
    "ContactEmail" varchar(256)  NOT NULL
);
-- Daily Analyses
CREATE TABLE "DailyAnalyses"(
    "Id" uuid PRIMARY KEY,
    "BraceletsCount" int DEFAULT 0,
    "UsersCount" integer DEFAULT 0,
    "AdminCount" integer DEFAULT 0
);
-- Bracelets 
CREATE TABLE "Bracelets" (
    "SerialNumber" uuid PRIMARY KEY,
    "Username" varchar(256) references "Users" ("Username") ON DELETE CASCADE ON UPDATE CASCADE,
    "Color" varchar(64) NOT NULL,
    "Serendipity" decimal
);
-- Alarms
CREATE TABLE "Alarms" (
    "Id" uuid PRIMARY KEY,
    "BraceletId" uuid references "Bracelets" ("SerialNumber") ON DELETE CASCADE ON UPDATE CASCADE,
    "Type" varchar(24) NOT NULL,
    "Value" integer,
    "Time" timestamp NOT NULL
);