CREATE ROLE mcm_test LOGIN ENCRYPTED PASSWORD 'mcm_test' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;

CREATE DATABASE mcm_test WITH OWNER = mcm_test ENCODING = 'UTF8' TABLESPACE = pg_default LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8' CONNECTION LIMIT = -1;

\c mcm_test

CREATE SCHEMA mcm_test_schema AUTHORIZATION mcm_test;

GRANT ALL ON SCHEMA mcm_test_schema TO mcm_test;


CREATE TABLE mcm_test_schema.color (
	id int4 NOT NULL,
	nome varchar(250) NOT NULL,
	CONSTRAINT color_pk PRIMARY KEY (id)
);

CREATE TABLE mcm_test_schema.car (
	id int4 NOT NULL,
	brand varchar(250) NOT NULL,
	ano numeric(10) NULL,
	id_color int4 NULL,
	price numeric(10) NULL,
	sale_date date NULL,
	status varchar(1) NULL,
	CONSTRAINT car_pk PRIMARY KEY (id),
	CONSTRAINT car_fk FOREIGN KEY (id_color) REFERENCES mcm_test_schema.color(id)
);

CREATE TABLE mcm_test_schema.usuario (
	id int4 NOT NULL,
	email varchar(250) NOT NULL,
	"password" varchar(250) NOT NULL,
	perfil varchar(250) NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_un UNIQUE (email)
);


CREATE TABLE mcm_test_schema.perfil (
	id int4 NOT NULL,
	"enum" varchar(250) NOT NULL,
	id_usuario int4 NOT NULL,
	CONSTRAINT perfil_pk PRIMARY KEY (id),
	CONSTRAINT perfil_un UNIQUE (enum, id_usuario),
	CONSTRAINT perfil_fk FOREIGN KEY (id_usuario) REFERENCES mcm_test_schema.usuario(id)
);


CREATE SEQUENCE mcm_test_schema.car_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


CREATE SEQUENCE mcm_test_schema.color_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

CREATE SEQUENCE mcm_test_schema.perfil_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

CREATE SEQUENCE mcm_test_schema.user_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

