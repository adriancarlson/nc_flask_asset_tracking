--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-03-11 19:51:59 UTC

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 98632)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 49532)
-- Name: devices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices (
    id integer NOT NULL,
    serial_number integer NOT NULL,
    purchase_date date NOT NULL,
    manufacture text NOT NULL,
    model text NOT NULL,
    status text NOT NULL,
    condition text NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.devices OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 49531)
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.devices_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.devices_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 213
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.devices_id_seq OWNED BY public.devices.id;


--
-- TOC entry 215 (class 1259 OID 49542)
-- Name: devices_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.devices_users (
    device_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.devices_users OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 49577)
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    id integer NOT NULL,
    name text NOT NULL,
    address_line_1 text NOT NULL,
    address_line_2 text,
    city text NOT NULL,
    state character(2) NOT NULL,
    zip integer NOT NULL
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 49576)
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 216
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_id_seq OWNED BY public.schools.id;


--
-- TOC entry 210 (class 1259 OID 49512)
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 49511)
-- Name: user_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_accounts_id_seq OWNED BY public.user_accounts.id;


--
-- TOC entry 212 (class 1259 OID 49523)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    middle_name text,
    grade integer,
    user_type text NOT NULL,
    user_account_id integer NOT NULL,
    school_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 49522)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3191 (class 2604 OID 49535)
-- Name: devices id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices ALTER COLUMN id SET DEFAULT nextval('public.devices_id_seq'::regclass);


--
-- TOC entry 3192 (class 2604 OID 49580)
-- Name: schools id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools ALTER COLUMN id SET DEFAULT nextval('public.schools_id_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 49515)
-- Name: user_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts ALTER COLUMN id SET DEFAULT nextval('public.user_accounts_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 49526)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 98632)
-- Dependencies: 218
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
96ef8f80d70c
\.


--
-- TOC entry 3359 (class 0 OID 49532)
-- Dependencies: 214
-- Data for Name: devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices (id, serial_number, purchase_date, manufacture, model, status, condition, school_id) FROM stdin;
1	123456	2022-02-22	Apple	iPad Pro	Checked Out	New	1
2	234567	2022-01-22	Apple	iPad Air	Inventory	New	1
3	321654	2019-02-22	Apple	iPad Mini	Checked Out	Used	3
4	963852	2018-03-22	Apple	iPad Mini	Checked Out	Used	2
5	741852	2016-02-09	Apple	iPad Mini	Checked Out	Used	3
6	258951	2022-02-15	Google	Chrombook	Checked Out	New	2
7	852159	2021-04-05	Dell	Latitude 5300	Checked Out	Used	2
8	456789	2019-07-28	Dell	Latitude 4900	Checked Out	Used	3
9	321456	2014-02-22	Dell	Latitude 1350	Retired	Used	3
10	789456	2020-02-20	Google	Chromebook	Checked Out	Used	2
\.


--
-- TOC entry 3360 (class 0 OID 49542)
-- Dependencies: 215
-- Data for Name: devices_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.devices_users (device_id, user_id) FROM stdin;
1	2
9	2
6	3
3	4
4	6
7	6
5	7
8	7
\.


--
-- TOC entry 3362 (class 0 OID 49577)
-- Dependencies: 217
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schools (id, name, address_line_1, address_line_2, city, state, zip) FROM stdin;
1	Apple Grove High School	123 Fake St.	\N	Lincoln	NE	68507
3	Washington Elementary	2300 South St.	\N	Lincoln	NE	68503
2	Chery Hill Middle School	6000 A Street	\N	Hastings	NE	68901
\.


--
-- TOC entry 3355 (class 0 OID 49512)
-- Dependencies: 210
-- Data for Name: user_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accounts (id, username, password, user_id) FROM stdin;
2	stu-dent	Stu123	2
3	sally-smith	Sal123	3
4	joe-smith	Joe123	4
5	george-pinkerton	Geo123	5
6	suzane-miller	Suz123	6
7	shane-whittford	Sha123	7
\.


--
-- TOC entry 3357 (class 0 OID 49523)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, middle_name, grade, user_type, user_account_id, school_id) FROM stdin;
2	Stu	Dent	Reginald	12	Student	2	1
3	Sally	Smith	Regina	8	Student	3	2
4	Joe	Smith	George	4	Student	4	3
5	George	Pinkerton	Peter	\N	Teacher	5	1
6	Suzane	Miller	Chelle	8	Teacher	6	2
7	Shane	Whitford	\N	2	Teacher	7	3
\.


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 213
-- Name: devices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.devices_id_seq', 13, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 216
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_id_seq', 4, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_accounts_id_seq', 8, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 211
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- TOC entry 3208 (class 2606 OID 98636)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3200 (class 2606 OID 49539)
-- Name: devices devices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 2606 OID 49546)
-- Name: devices_users devices_users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices_users
    ADD CONSTRAINT devices_users_pkey PRIMARY KEY (device_id, user_id);


--
-- TOC entry 3204 (class 2606 OID 49586)
-- Name: schools schools_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_name_key UNIQUE (name);


--
-- TOC entry 3206 (class 2606 OID 49584)
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 49519)
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3196 (class 2606 OID 49521)
-- Name: user_accounts user_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_username_key UNIQUE (username);


--
-- TOC entry 3198 (class 2606 OID 49530)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 49602)
-- Name: devices fk_devices_schools; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices
    ADD CONSTRAINT fk_devices_schools FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 3214 (class 2606 OID 49597)
-- Name: devices_users fk_devices_users_devices; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices_users
    ADD CONSTRAINT fk_devices_users_devices FOREIGN KEY (device_id) REFERENCES public.devices(id);


--
-- TOC entry 3213 (class 2606 OID 49592)
-- Name: devices_users fk_devices_users_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.devices_users
    ADD CONSTRAINT fk_devices_users_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3209 (class 2606 OID 49566)
-- Name: user_accounts fk_user_accounts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT fk_user_accounts_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 3211 (class 2606 OID 49587)
-- Name: users fk_users_schools; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_schools FOREIGN KEY (school_id) REFERENCES public.schools(id);


--
-- TOC entry 3210 (class 2606 OID 49571)
-- Name: users fk_users_user_accounts_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_user_accounts_users FOREIGN KEY (user_account_id) REFERENCES public.user_accounts(id);


-- Completed on 2022-03-11 19:52:00 UTC

--
-- PostgreSQL database dump complete
--

