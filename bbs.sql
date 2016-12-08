--
-- PostgreSQL database dump
--

-- Dumped from database version 8.4.20
-- Dumped by pg_dump version 9.5.1

-- Started on 2016-11-23 16:42:38

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 141 (class 1259 OID 16390)
-- Name: bbs; Type: TABLE; Schema: public; Owner: postgres
--
Drop table bbs;
CREATE TABLE bbs (
    id integer NOT NULL,
    title character(50),
    name character(50),
    hp_address character(50),
    gender integer,
    area character(50),
    body character(255),
    delete_key character(20),
    post_date timestamp with time zone
);


ALTER TABLE bbs OWNER TO postgres;

--
-- TOC entry 142 (class 1259 OID 16395)
-- Name: bbs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bbs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bbs_id_seq OWNER TO postgres;

--
-- TOC entry 1783 (class 0 OID 0)
-- Dependencies: 142
-- Name: bbs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bbs_id_seq OWNED BY bbs.id;


--
-- TOC entry 1688 (class 2604 OID 16397)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bbs ALTER COLUMN id SET DEFAULT nextval('bbs_id_seq'::regclass);


--
-- TOC entry 1777 (class 0 OID 16390)
-- Dependencies: 141
-- Data for Name: bbs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1784 (class 0 OID 0)
-- Dependencies: 142
-- Name: bbs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--


--
-- TOC entry 1690 (class 2606 OID 16402)
-- Name: bbs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bbs
    ADD CONSTRAINT bbs_pkey PRIMARY KEY (id);


-- Completed on 2016-11-23 16:42:38

--
-- PostgreSQL database dump complete
--

