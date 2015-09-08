--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: brands; Type: TABLE; Schema: public; Owner: lesliepoole; Tablespace: 
--

CREATE TABLE brands (
    id integer NOT NULL,
    description character varying
);


ALTER TABLE brands OWNER TO lesliepoole;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: lesliepoole
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO lesliepoole;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lesliepoole
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: lesliepoole; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE stores OWNER TO lesliepoole;

--
-- Name: stores_brands; Type: TABLE; Schema: public; Owner: lesliepoole; Tablespace: 
--

CREATE TABLE stores_brands (
    id integer NOT NULL,
    store_id integer,
    brand_id integer
);


ALTER TABLE stores_brands OWNER TO lesliepoole;

--
-- Name: stores_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: lesliepoole
--

CREATE SEQUENCE stores_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_brands_id_seq OWNER TO lesliepoole;

--
-- Name: stores_brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lesliepoole
--

ALTER SEQUENCE stores_brands_id_seq OWNED BY stores_brands.id;


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: lesliepoole
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO lesliepoole;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lesliepoole
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lesliepoole
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lesliepoole
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lesliepoole
--

ALTER TABLE ONLY stores_brands ALTER COLUMN id SET DEFAULT nextval('stores_brands_id_seq'::regclass);


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: lesliepoole
--

COPY brands (id, description) FROM stdin;
1	Nike
2	Coach
3	Adidas
4	Gucci
5	Brooks
6	Vans
7	Converse
8	Birkenstocks
9	Doc Martens
10	Danner
11	Dockers
12	Reebok
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lesliepoole
--

SELECT pg_catalog.setval('brands_id_seq', 12, true);


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: lesliepoole
--

COPY stores (id, name) FROM stdin;
6	Ross
7	TJ Maxx
8	Fit Right
9	When the Shoe Fits
10	Gap
5	Nordstrom
11	JCPenneys
12	Khols
13	Macys
\.


--
-- Data for Name: stores_brands; Type: TABLE DATA; Schema: public; Owner: lesliepoole
--

COPY stores_brands (id, store_id, brand_id) FROM stdin;
1	8	1
2	8	3
3	8	6
4	9	1
5	9	3
6	9	7
7	9	6
8	6	11
9	6	12
10	13	4
11	13	2
12	12	1
13	12	9
14	12	10
15	8	12
16	7	12
17	6	7
\.


--
-- Name: stores_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lesliepoole
--

SELECT pg_catalog.setval('stores_brands_id_seq', 17, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lesliepoole
--

SELECT pg_catalog.setval('stores_id_seq', 13, true);


--
-- Name: brands_pkey; Type: CONSTRAINT; Schema: public; Owner: lesliepoole; Tablespace: 
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: stores_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: lesliepoole; Tablespace: 
--

ALTER TABLE ONLY stores_brands
    ADD CONSTRAINT stores_brands_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: lesliepoole; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: lesliepoole
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM lesliepoole;
GRANT ALL ON SCHEMA public TO lesliepoole;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

