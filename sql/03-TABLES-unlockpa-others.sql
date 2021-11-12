CREATE SEQUENCE unlockpa.utenti_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	CACHE 1
	NO CYCLE;

CREATE SEQUENCE unlockpa.categorie_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE unlockpa.audittrail_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE unlockpa.comuni_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 4;

CREATE SEQUENCE unlockpa.feedback_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1;

CREATE SEQUENCE userlevels_userlevelid_seq; 

CREATE TABLE unlockpa.zone
(
    id integer NOT NULL,
    zona character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_zona PRIMARY KEY (id)
);


CREATE TABLE unlockpa.comuni
(
    id integer NOT NULL DEFAULT nextval('comuni_id_seq'::regclass),
    istat character varying(5) COLLATE pg_catalog."default",
    toponimo character varying(50) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(20) COLLATE pg_catalog."default",
    indirizzo character varying(50) COLLATE pg_catalog."default",
    provincia character(2) COLLATE pg_catalog."default",
    avviso character varying(2000) COLLATE pg_catalog."default",
    fk_zona integer,
    vide boolean,
    vide_url character varying(512) COLLATE pg_catalog."default",
    logo text COLLATE pg_catalog."default",
    no_response character varying(2000) COLLATE pg_catalog."default",
    dominio character varying(512) NULL,
    botattivo boolean NOT NULL DEFAULT FALSE,
    logobin bytea,
    CONSTRAINT pk_comune PRIMARY KEY (id),
    CONSTRAINT fk_zona_01 FOREIGN KEY (fk_zona)
        REFERENCES unlockpa.zone (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE unlockpa.categorie
(
    id integer NOT NULL,
    categoria character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_categoria PRIMARY KEY (id)
);

CREATE TABLE unlockpa.domande
(
    id integer NOT NULL,
    domanda character varying(200) COLLATE pg_catalog."default" NOT NULL,
    risposta_default character varying(4000) COLLATE pg_catalog."default",
    fk_categoria integer,
    CONSTRAINT pk_domanda PRIMARY KEY (id),
    CONSTRAINT fk_categoria_01 FOREIGN KEY (fk_categoria)
        REFERENCES unlockpa.categorie (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE unlockpa.risposte
(
    id_comune integer NOT NULL,
    id_domanda integer NOT NULL,
    risposta character varying COLLATE pg_catalog."default",
    validato boolean,
    domanda character varying(200) COLLATE pg_catalog."default",
    categoria character varying(50) NULL,
    CONSTRAINT pk_risposte PRIMARY KEY (id_comune, id_domanda),
    CONSTRAINT fk_comune_02 FOREIGN KEY (id_comune)
        REFERENCES unlockpa.comuni (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_domanda_01 FOREIGN KEY (id_domanda)
        REFERENCES unlockpa.domande (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE unlockpa.risposte_zona
(
    id_domanda integer NOT NULL,
    id_zona integer NOT NULL,
    risposta_default character varying(4000) COLLATE pg_catalog."default",
    CONSTRAINT pk_risposte_zona PRIMARY KEY (id_domanda, id_zona),
    CONSTRAINT fk_domanda_03 FOREIGN KEY (id_domanda)
        REFERENCES unlockpa.domande (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_zona_02 FOREIGN KEY (id_zona)
        REFERENCES unlockpa.zone (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE unlockpa.utenti
(
    id integer NOT NULL DEFAULT nextval('utenti_id_seq'::regclass),
    name character varying(60) COLLATE pg_catalog."default",
    pass character varying(255) COLLATE pg_catalog."default",
    mail character varying(254) COLLATE pg_catalog."default",
    langcode character varying(12) COLLATE pg_catalog."default",
    preferred_langcode character varying(12) COLLATE pg_catalog."default",
    preferred_admin_langcode character varying(12) COLLATE pg_catalog."default",
    timezone character varying(32) COLLATE pg_catalog."default",
    status smallint,
    access integer,
    login integer,
    init character varying(254) COLLATE pg_catalog."default",
    default_langcode smallint,
    userlevel bigint,
    profile_field_memo character varying COLLATE pg_catalog."default",
    userlevel_segn bigint,
    userlevel_cellule bigint,
    accettazione boolean,
    fk_comune integer,
    created date,
    changed date,
    CONSTRAINT pk_utenti PRIMARY KEY (id),
    CONSTRAINT fk_comune_01 FOREIGN KEY (fk_comune)
        REFERENCES unlockpa.comuni (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
CREATE TABLE unlockpa.userlevels
(
    userlevelid integer NOT NULL DEFAULT nextval('userlevels_userlevelid_seq'),
    userlevelname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pkuserlevels PRIMARY KEY (userlevelid)
);
CREATE TABLE unlockpa.userlevelpermissions
(
    userlevelid integer NOT NULL,
    tablename character varying(255) COLLATE pg_catalog."default" NOT NULL,
    permission integer NOT NULL,
    CONSTRAINT pkuserlevelpermissions PRIMARY KEY (userlevelid, tablename)
);

CREATE TABLE unlockpa.audittrail
(
    id integer NOT NULL DEFAULT nextval('audittrail_id_seq'::regclass),
    datetime timestamp without time zone NOT NULL,
    script character varying(255) COLLATE pg_catalog."default",
    "user" character varying(255) COLLATE pg_catalog."default",
    action character varying(255) COLLATE pg_catalog."default",
    "table" character varying(255) COLLATE pg_catalog."default",
    field character varying(255) COLLATE pg_catalog."default",
    keyvalue text COLLATE pg_catalog."default",
    oldvalue text COLLATE pg_catalog."default",
    newvalue text COLLATE pg_catalog."default",
    CONSTRAINT pkaudittrail PRIMARY KEY (id)
);

CREATE TABLE unlockpa.feedback
(
    id integer NOT NULL DEFAULT nextval('feedback_id_seq'::regclass),
    datetime timestamp without time zone NOT NULL,
    id_session character varying(256) COLLATE pg_catalog."default",
    id_tenant integer NOT NULL,
    content text COLLATE pg_catalog."default",
    last_question text COLLATE pg_catalog."default",
    last_answer text COLLATE pg_catalog."default",
    id_question integer NOT NULL,
    CONSTRAINT pkfeedbacktrail PRIMARY KEY (id)
);

CREATE TABLE unlockpa.events (
	id serial NOT NULL,
	sender_id varchar(255) NOT NULL,
	type_name varchar(255) NOT NULL,
	"timestamp" float8 NULL,
	intent_name varchar(255) NULL,
	action_name varchar(255) NULL,
	"data" text NULL,
	CONSTRAINT events_pkey PRIMARY KEY (id)
);

CREATE TABLE unlockpa.risposte_archivio
(
    id_comune integer NOT NULL,
    id_domanda integer NOT NULL,
	data_modifica timestamp with time zone NOT NULL DEFAULT now(),
    risposta character varying(4000) COLLATE pg_catalog."default",
    validato boolean,
    domanda character varying(200) COLLATE pg_catalog."default",
    categoria character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_risposte_archivio PRIMARY KEY (id_comune, id_domanda, data_modifica),
    CONSTRAINT fk_comune_03 FOREIGN KEY (id_comune)
        REFERENCES unlockpa.comuni (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_domanda_02 FOREIGN KEY (id_domanda)
        REFERENCES unlockpa.domande (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


