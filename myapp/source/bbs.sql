--
-- PostgreSQL database dump
--

-- Started on 2016-11-05 16:04:02 JST

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
-- TOC entry 142 (class 1259 OID 17872)
-- Dependencies: 3
-- Name: bbs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

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


ALTER TABLE public.bbs OWNER TO postgres;

--
-- TOC entry 1777 (class 0 OID 17872)
-- Dependencies: 142
-- Data for Name: bbs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bbs (id, title, name, hp_address, gender, area, body, delete_key, post_date) FROM stdin;
1	管理人です                                             	たけはる \t\n                                           	http://bbs7.sekkaku.net/bbs/takeharu.html         	0	1                                                 	 \t新しく立ち上げたばかりですが気楽に書き込んでください＾＾                                                                                                                                                                                                                                 	123456              	2016-11-05 15:57:00+09
\.


--
-- TOC entry 1776 (class 2606 OID 17878)
-- Dependencies: 142 142
-- Name: bbs_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bbs
    ADD CONSTRAINT bbs_pk PRIMARY KEY (id);


-- Completed on 2016-11-05 16:04:02 JST

--
-- PostgreSQL database dump complete
--

