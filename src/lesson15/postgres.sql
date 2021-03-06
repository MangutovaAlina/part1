-- SQL Manager Lite for PostgreSQL 6.0.1.53431
-- ---------------------------------------
-- Host      : localhost
-- Database  : postgres
-- Version   : PostgreSQL 9.6.13, compiled by Visual C++ build 1800, 64-bit



CREATE SCHEMA "InnBD" AUTHORIZATION postgres;
SET check_function_bodies = false;
--
-- Structure for table USER (OID = 16394) :
--
SET search_path = "InnBD", pg_catalog;
CREATE TABLE "InnBD"."USER" (
    id bigint DEFAULT nextval(('"InnBD".user_id_seq'::text)::regclass) NOT NULL,
    name varchar(255),
    "login_ID" varchar(255),
    city varchar(255),
    birthday date,
    email varchar(255),
    description text
)
WITH (oids = false);
--
-- Definition for type enum_name (OID = 16401) :
--
CREATE TYPE "InnBD".enum_name AS ENUM (
  'Administration', 'Clients', 'Billing'
);
--
-- Structure for table ROLE (OID = 16407) :
--
CREATE TABLE "InnBD"."ROLE" (
    id integer NOT NULL,
    name enum_name,
    description text
)
WITH (oids = false);
--
-- Structure for table USER_ROLE (OID = 16413) :
--
CREATE TABLE "InnBD"."USER_ROLE" (
    id bigint DEFAULT nextval(('"InnBD".user_role_id_seq'::text)::regclass) NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
)
WITH (oids = false);
--
-- Structure for table LOGS (OID = 16416) :
--
CREATE TABLE "InnBD"."LOGS" (
    "ID" integer NOT NULL,
    "DATE" date,
    "LOG_LEVEL" varchar,
    "MESSAGE" text,
    "EXCEPTION" text
)
WITH (oids = false);
--
-- Definition for type enum_sex (OID = 16452) :
--
CREATE TYPE "InnBD".enum_sex AS ENUM (
  'Man', 'Woman'
);
--
-- Definition for sequence role_id_seq (OID = 24592) :
--
CREATE SEQUENCE "InnBD".role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_id_seq (OID = 24609) :
--
CREATE SEQUENCE "InnBD".user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for sequence user_role_id_seq (OID = 24641) :
--
CREATE SEQUENCE "InnBD".user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Definition for index LOGS_pkey (OID = 16442) :
--
ALTER TABLE ONLY "LOGS"
    ADD CONSTRAINT "LOGS_pkey"
    PRIMARY KEY ("ID");
--
-- Definition for index USER_pkey (OID = 24611) :
--
ALTER TABLE ONLY "USER"
    ADD CONSTRAINT "USER_pkey"
    PRIMARY KEY (id);
--
-- Definition for index USER_ROLE_fk (OID = 24613) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_fk"
    FOREIGN KEY (user_id) REFERENCES "USER"(id);
--
-- Definition for index ROLE_pkey (OID = 24626) :
--
ALTER TABLE ONLY "ROLE"
    ADD CONSTRAINT "ROLE_pkey"
    PRIMARY KEY (id);
--
-- Definition for index USER_ROLE_fk1 (OID = 24628) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_fk1"
    FOREIGN KEY (role_id) REFERENCES "ROLE"(id);
--
-- Definition for index USER_ROLE_pkey (OID = 24643) :
--
ALTER TABLE ONLY "USER_ROLE"
    ADD CONSTRAINT "USER_ROLE_pkey"
    PRIMARY KEY (id);
--
-- Data for sequence "InnBD".role_id_seq (OID = 24592)
--
SELECT pg_catalog.setval('role_id_seq', 1, false);
--
-- Data for sequence "InnBD".user_id_seq (OID = 24609)
--
SELECT pg_catalog.setval('user_id_seq', 1, true);
--
-- Data for sequence "InnBD".user_role_id_seq (OID = 24641)
--
SELECT pg_catalog.setval('user_role_id_seq', 1, true);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
COMMENT ON COLUMN "InnBD"."ROLE".id IS 'идентификатор';
COMMENT ON COLUMN "InnBD"."ROLE".name IS 'название роли';
COMMENT ON COLUMN "InnBD"."ROLE".description IS 'описание';
COMMENT ON COLUMN "InnBD"."USER_ROLE".id IS 'идентификатор';
COMMENT ON COLUMN "InnBD"."USER_ROLE".user_id IS 'идентификатор юзера, ссылка на таблицу User, поле id';
COMMENT ON COLUMN "InnBD"."USER_ROLE".role_id IS 'индентификатор роли, ссылка на таблицу Role, поле id';
