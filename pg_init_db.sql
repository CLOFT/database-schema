-- DROP TABLE IF EXISTS <TABLE NAME> CASCADE;
-- DROP TABLE IF EXISTS "Users" CASCADE;
-- DROP TABLE IF EXISTS "UsersSecureContacts" CASCADE;
-- DROP TABLE IF EXISTS "Bracelets" CASCADE;
-- DROP TABLE IF EXISTS "Alarms" CASCADE;

-- Users
CREATE TABLE "Users"(
    "Username" varchar(256) PRIMARY KEY,
    "Role" varchar(64) NOT NULL,
    "Birth" date NOT NULL 
);

-- Users Secure Contacts Emails
CREATE TABLE "UsersSecureContacts"(
    "Id" uuid PRIMARY KEY,
    "Username" varchar (256) references "Users" ("Username") NOT NULL,
    "ContactEmail" varchar(256)  NOT NULL
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