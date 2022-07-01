-- DROP TABLE IF EXISTS <TABLE NAME>;
DROP TABLE IF EXISTS "CognitoUsers";
DROP TABLE IF EXISTS "UsersSecureContacts";
DROP TABLE IF EXISTS "DailyAnalyses";
DROP TABLE IF EXISTS "Bracelets";
DROP TABLE IF EXISTS "Alarms";

-- Cognito Users Username
CREATE TABLE "CognitoUsers"(
    "Username" varchar(256) PRIMARY KEY;
);
-- Users Secure Contacts Emails
CREATE TABLE "UsersSecureContacts"(
    "Id" uuid PRIMARY KEY,
    "Username" varchar (256) references "CognitoUsers" ("Username") NOT NULL,
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
    "Username" varchar(256) references "CognitoUsers" ("Username"),
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