--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-08-10 13:28:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: contacto_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: contacto; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.contacto (
    id integer DEFAULT nextval('public.contacto_id_seq'::regclass) NOT NULL,
    nombre character varying(100) NOT NULL,
    apellidos character varying(200) NOT NULL,
    direccion character varying(200) NOT NULL,
    email character varying(100) NOT NULL,
    telefono character varying(100) NOT NULL,
    "fechaCreacion" timestamp without time zone NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16406)
-- Name: pertenece_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pertenece_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: pertenece; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pertenece (
    id integer DEFAULT nextval('public.pertenece_id_seq'::regclass) NOT NULL,
    id_usuario smallint NOT NULL,
    id_contacto smallint NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16411)
-- Name: usuario; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellidos character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL
);


--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- TOC entry 3185 (class 2604 OID 16415)
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- TOC entry 3337 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.contacto (id, nombre, apellidos, direccion, email, telefono, "fechaCreacion") FROM stdin;
21	Lucia	Domínguez	C/Torneo 18 1ºD	luci@gmail.com	677004546	2022-03-03 10:00:49.317622
4	Sofía	Fernández	C/Tetuán 71	sofia@gmail.com	695122014	2022-02-18 00:00:00
26	Rocio	Gómez	C/Sol 3	roci34@gmail.com	674456444	2022-03-06 22:53:51.421436
28	Raul	Vega	C/Toneleros 7	raul@hotmail.com	675400127	2022-03-07 17:15:17.241052
30	Marina	Cerdán Vázquez	C/Federico García Lorca 7	marina@gmail.com	637103700	2022-03-07 17:15:17.241052
31	Antonio	Sánchez 	Av. Miraflores 72 4ºD	antsan176@hotmail.com	600237803	2022-03-07 17:15:17.241052
19	Jose	Moreno Rodríguez	C/Catadores	jose@gmail.com	678453764	2022-03-02 16:28:29.237501
33	César	Uni Vargas	C/Palmera 7, Almería	cvargas@gmail.com	696584734	2023-08-07 18:03:50.510844
\.


--
-- TOC entry 3339 (class 0 OID 16407)
-- Dependencies: 217
-- Data for Name: pertenece; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pertenece (id, id_usuario, id_contacto) FROM stdin;
4	3	4
19	3	19
21	3	21
25	3	28
27	3	30
28	3	31
30	6	33
\.


--
-- TOC entry 3340 (class 0 OID 16411)
-- Dependencies: 218
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.usuario (id, nombre, apellidos, email, password) FROM stdin;
3	Miguel	Rodriguez	miguel@gmail.com	1234
6	pepe	garcía	pepe@gmail.com	1234
8	rocio	garcía	rocio@gmail.com	1234
4	luis	tamayo	sergio@gmail.com	1111
\.


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 214
-- Name: contacto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.contacto_id_seq', 33, true);


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 216
-- Name: pertenece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pertenece_id_seq', 30, true);


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.usuario_id_seq', 8, true);


--
-- TOC entry 3187 (class 2606 OID 16417)
-- Name: contacto contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);


--
-- TOC entry 3189 (class 2606 OID 16419)
-- Name: pertenece pertenece_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT pertenece_pkey PRIMARY KEY (id);


--
-- TOC entry 3191 (class 2606 OID 16421)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- TOC entry 3192 (class 2606 OID 16422)
-- Name: pertenece fk_contacto; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT fk_contacto FOREIGN KEY (id_contacto) REFERENCES public.contacto(id);


--
-- TOC entry 3193 (class 2606 OID 16427)
-- Name: pertenece fk_usuario; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pertenece
    ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id);


-- Completed on 2023-08-10 13:28:32

--
-- PostgreSQL database dump complete
--

