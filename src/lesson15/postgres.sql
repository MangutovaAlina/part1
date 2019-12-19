-- SQL Manager Lite for PostgreSQL 5.9.4.51539
-- ---------------------------------------
-- Host      : localhost
-- Database  : postgres
-- Version   : PostgreSQL 11.3, compiled by Visual C++ build 1914, 64-bit



CREATE SCHEMA "InnBD" AUTHORIZATION postgres;
SET check_function_bodies = false;
--
-- Structure for table USER (OID = 16394) :
--
SET search_path = "InnBD", pg_catalog;
CREATE TABLE "InnBD"."USER" (
    id integer NOT NULL,
    name varchar(255),
    "login_ID" integer,
    city varchar(255),
    birthday date,
    email varchar(255),
    description text
)
WITH (oids = false);
--
-- Definition for type enum_name (OID = 16403) :
--
CREATE TYPE "InnBD".enum_name AS ENUM (
  'Administration', 'Clients', 'Billing'
);
--
-- Structure for table ROLE (OID = 16417) :
--
CREATE TABLE "InnBD"."ROLE" (
    id integer NOT NULL,
    name enum_name,
    description text
)
WITH (oids = false);
--
-- Structure for table USER_ROLE (OID = 16425) :
--
CREATE TABLE "InnBD"."USER_ROLE" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    rode_id integer NOT NULL
)
WITH (oids = false);
--
-- Definition for index USER_pkey (OID = 16400) :
--
ALTER TABLE ONLY "USER"
    ADD CONSTRAINT "USER_pkey"
    PRIMARY KEY (id);
--
-- Definition for index ROLE_pkey (OID = 16423) :
--
ALTER TABLE ONLY "ROLE"
    ADD CONSTRAINT "ROLE_pkey"
    PRIMARY KEY (id);
--
-- Definition for index USER_ROLE_pkey (OID = 16428) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_pkey"
    PRIMARY KEY (id);
--
-- Definition for index USER_ROLE_user_id_key (OID = 16430) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_user_id_key"
    UNIQUE (user_id);
--
-- Definition for index USER_ROLE_rode_id_key (OID = 16432) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_rode_id_key"
    UNIQUE (rode_id);
--
-- Definition for index USER_ROLE_fk (OID = 16434) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_fk"
    FOREIGN KEY (user_id) REFERENCES "USER"(id);
--
-- Definition for index USER_ROLE_fk1 (OID = 16439) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_fk1"
    FOREIGN KEY (rode_id) REFERENCES "ROLE"(id);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON COLUMN "InnBD"."ROLE".id IS 'идентификатор';
COMMENT ON COLUMN "InnBD"."ROLE".name IS 'название роли';
COMMENT ON COLUMN "InnBD"."ROLE".description IS 'описание';
COMMENT ON COLUMN "InnBD"."USER_ROLE".id IS 'идентификатор';
COMMENT ON COLUMN "InnBD"."USER_ROLE".user_id IS 'идентификатор юзера, ссылка на таблицу user, поле id';
COMMENT ON COLUMN "InnBD"."USER_ROLE".rode_id IS 'индентификатор роли, ссылка на таблицу role, поле id';
