CREATE ROLE mcm LOGIN ENCRYPTED PASSWORD 'mcm' SUPERUSER INHERIT CREATEDB CREATEROLE REPLICATION;

CREATE DATABASE mcm WITH OWNER = mcm ENCODING = 'UTF8' TABLESPACE = pg_default LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8' CONNECTION LIMIT = -1;

\c mcm

CREATE SCHEMA mcm_schema AUTHORIZATION mcm;

GRANT ALL ON SCHEMA mcm_schema TO mcm;


CREATE TABLE mcm_schema.color (
	id int4 NOT NULL,
	nome varchar(250) NOT NULL,
	CONSTRAINT color_pk PRIMARY KEY (id)
);

CREATE TABLE mcm_schema.car (
	id int4 NOT NULL,
	brand varchar(250) NOT NULL,
	ano numeric(10) NULL,
	id_color int4 NULL,
	price numeric(10) NULL,
	sale_date date NULL,
	status varchar(1) NULL,
	CONSTRAINT car_pk PRIMARY KEY (id),
	CONSTRAINT car_fk FOREIGN KEY (id_color) REFERENCES mcm_schema.color(id)
);

CREATE TABLE mcm_schema.usuario (
	id int4 NOT NULL,
	email varchar(250) NOT NULL,
	"password" varchar(250) NOT NULL,
	perfil varchar(250) NOT NULL,
	CONSTRAINT usuario_pk PRIMARY KEY (id),
	CONSTRAINT usuario_un UNIQUE (email)
);


CREATE TABLE mcm_schema.perfil (
	id int4 NOT NULL,
	"enum" varchar(250) NOT NULL,
	id_usuario int4 NOT NULL,
	CONSTRAINT perfil_pk PRIMARY KEY (id),
	CONSTRAINT perfil_un UNIQUE (enum, id_usuario),
	CONSTRAINT perfil_fk FOREIGN KEY (id_usuario) REFERENCES mcm_schema.usuario(id)
);


CREATE SEQUENCE mcm_schema.car_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;


CREATE SEQUENCE mcm_schema.color_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

CREATE SEQUENCE mcm_schema.perfil_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

CREATE SEQUENCE mcm_schema.user_sq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

INSERT INTO mcm_schema.color (id,nome) VALUES 
(1,'Orange')
,(2,'Black')
,(3,'Gray')
,(4,'Blue')
,(5,'Yellow')
,(6,'Red')
;

INSERT INTO mcm_schema.car (id,brand,ano,id_color,price,sale_date,status) VALUES 
(1,'VW',2012,1,10000,'0001-01-01','P')
,(2,'Audi',2013,2,11000,'0001-01-02','S')
,(3,'Renault',2014,3,12000,'0001-01-03','P')
,(4,'BMW',2015,4,13000,'0001-01-04','B')
,(5,'Mercedes',2016,5,14000,'0001-01-05','S')
,(6,'Volvo',2017,6,15000,'0001-01-06','P')
,(7,'Honda',2018,1,16000,'0001-01-07','B')
,(8,'Jaguar',2019,2,17000,'0001-01-08','S')
,(9,'Ford',2020,3,18000,'0001-01-09','P')
,(10,'Fiat',2021,4,19000,'0001-01-10','B')
,(16,'AAAAAAAAAAAAAA',222222,2,222222,'0001-03-11','S')
;

INSERT INTO mcm_schema.usuario (id,email,"password",perfil) VALUES 
(1,'admin@helpdesk.com','$2a$10$qUU8yaDD4.JGTXzDj.G1Z.c8Gb0KYfXA4Qk/SixA.PnAE1GVrykhu','ROLE_ADMIN')
,(2,'custumer@helpdesk.com','$2a$10$8lAC1uDRhLci6tSl7W9MDOkEC.peDrDsD.ImnHidx7KrFPepHakn6','ROLE_CUSTUMER')
;

INSERT INTO mcm_schema.perfil (id,"enum",id_usuario) VALUES 
(1,'ROLE_ADMIN',1)
,(2,'ROLE_CUSTUMER',2)
;
