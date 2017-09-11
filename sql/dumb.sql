--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-12 02:39:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 24587)
-- Name: receivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE receivers (
    id bigint NOT NULL,
    name character varying(80),
    email character varying(40)
);


ALTER TABLE receivers OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 24585)
-- Name: receivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE receivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE receivers_id_seq OWNER TO postgres;

--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 186
-- Name: receivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE receivers_id_seq OWNED BY receivers.id;


--
-- TOC entry 190 (class 1259 OID 24624)
-- Name: statment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE statment (
    id bigint NOT NULL,
    user_id bigint,
    receiver_id bigint,
    last_name character varying(40),
    first_name character varying(40),
    middle_name character varying(40),
    title character varying(40),
    message text,
    search text
);


ALTER TABLE statment OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 24622)
-- Name: statment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE statment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statment_id_seq OWNER TO postgres;

--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 189
-- Name: statment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE statment_id_seq OWNED BY statment.id;


--
-- TOC entry 185 (class 1259 OID 24580)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    email character varying(40) NOT NULL,
    pass character varying(40) NOT NULL,
    is_operator boolean,
    id bigint NOT NULL,
    auth_hash character varying(40)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24593)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2015 (class 2604 OID 24590)
-- Name: receivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY receivers ALTER COLUMN id SET DEFAULT nextval('receivers_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 24627)
-- Name: statment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statment ALTER COLUMN id SET DEFAULT nextval('statment_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 24595)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2142 (class 0 OID 24587)
-- Dependencies: 187
-- Data for Name: receivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY receivers (id, name, email) FROM stdin;
1	other man	example@example.com
2	kostya polenkov	kostya14@gmail.com
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 186
-- Name: receivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('receivers_id_seq', 2, true);


--
-- TOC entry 2145 (class 0 OID 24624)
-- Dependencies: 190
-- Data for Name: statment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY statment (id, user_id, receiver_id, last_name, first_name, middle_name, title, message, search) FROM stdin;
1	1	2	3	4	5	1	3	\N
2	3	2	3	4	\N	\N	\N	\N
3	3	2	3	4	\N	\N	\N	\N
4	2	1	fdsa	fdas	fdsa	fdsa	fdsa	
5	2	1	fdsa	fdas	fdsa	fdsa	fdsa	fdsa fdas fdsa fdsa fdsa 
6	2	2	fdsa	fdas	fdsa	fdsa	fdsa	fdsa fdas fdsa kostya14@gmail.com kostya polenkov fdsa fdsa 
7	2	2	fdsa	fdas	fdsa	fdsa	fdsa	fdsafdasfdsakostya14@gmail.comkostya polenkovfdsafdsa
8	2	2	Константин	Поленков	Павлович	Это сообщение сохранится?	точно?!	КонстантинПоленковПавловичkostya14@gmail.comkostya polenkovЭто сообщение сохранится?точно?!
9	3	1	12	2	3	213	321	1223example@example.comother man213321
10	3	1	1	2	3	4	5	123example@example.comother man45
\.


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 189
-- Name: statment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('statment_id_seq', 10, true);


--
-- TOC entry 2140 (class 0 OID 24580)
-- Dependencies: 185
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (email, pass, is_operator, id, auth_hash) FROM stdin;
guest@example.com	123	\N	2	\N
kostya14@gmail.com	3918fb3a6b3d2033f42f2d354de0f7ba	\N	3	ryR2fHJApQXR8JKC4CrxnAAFWk8EppL
\.


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 188
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- TOC entry 2018 (class 2606 OID 24600)
-- Name: users id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT id PRIMARY KEY (id);


--
-- TOC entry 2020 (class 2606 OID 24592)
-- Name: receivers receivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY receivers
    ADD CONSTRAINT receivers_pkey PRIMARY KEY (id);


--
-- TOC entry 2022 (class 2606 OID 24632)
-- Name: statment statment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY statment
    ADD CONSTRAINT statment_pkey PRIMARY KEY (id);


-- Completed on 2017-09-12 02:39:08

--
-- PostgreSQL database dump complete
--

