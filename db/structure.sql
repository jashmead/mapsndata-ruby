--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: data_sources; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE data_sources (
    id integer NOT NULL,
    map_id integer,
    label character varying(255),
    details text,
    url character varying(255),
    email character varying(255),
    contact_name character varying(255),
    address text,
    ds_x numeric,
    ds_y numeric,
    ds_width numeric,
    ds_height numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ds_type character varying(255) DEFAULT 'point'::character varying
);


--
-- Name: data_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE data_sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: data_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE data_sources_id_seq OWNED BY data_sources.id;


--
-- Name: helps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE helps (
    id integer NOT NULL,
    name character varying(255),
    title character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: helps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE helps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: helps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE helps_id_seq OWNED BY helps.id;


--
-- Name: maps; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE maps (
    id integer NOT NULL,
    user_id integer,
    map_type character varying(255) DEFAULT 'blank'::character varying,
    name character varying(255),
    description text,
    map_width numeric,
    map_height numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying(255),
    avatar_content_type character varying(255),
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    map_x numeric,
    map_y numeric
);


--
-- Name: maps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE maps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: maps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE maps_id_seq OWNED BY maps.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    description text,
    url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY data_sources ALTER COLUMN id SET DEFAULT nextval('data_sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY helps ALTER COLUMN id SET DEFAULT nextval('helps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY maps ALTER COLUMN id SET DEFAULT nextval('maps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: data_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY data_sources
    ADD CONSTRAINT data_sources_pkey PRIMARY KEY (id);


--
-- Name: helps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY helps
    ADD CONSTRAINT helps_pkey PRIMARY KEY (id);


--
-- Name: maps_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY maps
    ADD CONSTRAINT maps_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_name ON users USING btree (name);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20131216220408');

INSERT INTO schema_migrations (version) VALUES ('20131216232457');

INSERT INTO schema_migrations (version) VALUES ('20131217145339');

INSERT INTO schema_migrations (version) VALUES ('20131217152148');

INSERT INTO schema_migrations (version) VALUES ('20131217220225');

INSERT INTO schema_migrations (version) VALUES ('20131217224049');

INSERT INTO schema_migrations (version) VALUES ('20131217224110');

INSERT INTO schema_migrations (version) VALUES ('20131218234045');

INSERT INTO schema_migrations (version) VALUES ('20131230175056');

INSERT INTO schema_migrations (version) VALUES ('20131230175342');

INSERT INTO schema_migrations (version) VALUES ('20131230180332');

INSERT INTO schema_migrations (version) VALUES ('20131231225808');

INSERT INTO schema_migrations (version) VALUES ('20131231234408');
