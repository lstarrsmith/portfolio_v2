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
-- Name: admins; Type: TABLE; Schema: public; Owner: Logan; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    fname character varying,
    lname character varying,
    email character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO "Logan";

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: Logan
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO "Logan";

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Logan
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: Logan; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    project_id integer,
    name character varying,
    project_text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO "Logan";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Logan
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO "Logan";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Logan
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: Logan; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    category_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone,
    caption character varying,
    project_main_image boolean
);


ALTER TABLE public.images OWNER TO "Logan";

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: Logan
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO "Logan";

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Logan
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: Logan; Tablespace: 
--

CREATE TABLE projects (
    id integer NOT NULL,
    rank integer,
    name character varying,
    has_subsection boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    short_description character varying
);


ALTER TABLE public.projects OWNER TO "Logan";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: Logan
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO "Logan";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Logan
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Logan; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO "Logan";

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Logan
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Logan
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Logan
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Logan
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: Logan
--

COPY admins (id, fname, lname, email, password_digest, created_at, updated_at) FROM stdin;
2	Logan	Smith	logan29smith@gmail.com	$2a$10$dwkQKaeRVKdTzaZFg4sjkuJJe380SEHByOx0dFkZrOYnlszB5jHKq	2016-01-31 06:18:51.274856	2016-01-31 06:18:51.274856
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Logan
--

SELECT pg_catalog.setval('admins_id_seq', 2, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Logan
--

COPY categories (id, project_id, name, project_text, created_at, updated_at) FROM stdin;
11	1	Implementation	We launched with Uganda’s Central Public Health Laboratory (CPHL) for their HIV testing programs (Early Infant Diagnosis and Viral Load). Then we expanded to pulling approved, aggregate data from DHIS2 for malaria and vaccines data.	2016-01-31 06:18:51.361423	2016-01-31 06:18:51.361423
10	17	Project Main Image		2016-01-31 06:18:51.359242	2016-02-06 16:29:03.930305
24	17	Image Test Great	\N	2016-02-03 12:30:08.021357	2016-02-03 12:30:08.021357
25	26	Test	\N	2016-02-04 11:41:05.348364	2016-02-04 11:41:05.348364
26	21	Problem	\N	2016-02-05 12:48:47.360955	2016-02-05 12:48:47.360955
28	19	Problem	\N	2016-02-05 12:56:29.243271	2016-02-05 12:56:29.243271
29	20	Problem	\N	2016-02-05 12:57:28.807812	2016-02-05 12:57:28.807812
30	22	Problem	\N	2016-02-05 12:58:17.284384	2016-02-05 12:58:17.284384
27	18	Problem	This is how you remind me	2016-02-05 12:52:15.433107	2016-02-06 12:21:08.993184
31	18	Context	of what i really am	2016-02-06 12:20:56.931596	2016-02-06 12:21:15.155245
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Logan
--

SELECT pg_catalog.setval('categories_id_seq', 31, true);


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: Logan
--

COPY images (id, category_id, created_at, updated_at, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, caption, project_main_image) FROM stdin;
6	\N	2016-02-02 15:53:38.512873	2016-02-02 15:53:38.512873	Screen_Shot_2016-02-02_at_9.20.58_AM.png	image/png	80299	2016-02-02 15:53:37.872503	\N	\N
7	\N	2016-02-02 15:55:58.295119	2016-02-02 15:55:58.295119	Screen_Shot_2016-02-02_at_9.20.58_AM.png	image/png	80299	2016-02-02 15:55:57.736862	\N	\N
8	\N	2016-02-02 15:57:14.907464	2016-02-02 15:57:14.907464	Screen_Shot_2015-11-02_at_12.50.15_PM.png	image/png	427313	2016-02-02 15:57:14.422631	\N	\N
9	\N	2016-02-02 15:58:51.439975	2016-02-02 15:58:51.439975	Screen_Shot_2015-11-02_at_12.23.59_PM.png	image/png	2179669	2016-02-02 15:58:49.879478	\N	\N
24	31	2016-02-06 12:22:15.910502	2016-02-06 12:22:15.910502	bridge_main.png	image/png	44561	2016-02-06 12:22:15.579695	hey dudes	\N
11	24	2016-02-04 11:02:16.961379	2016-02-04 11:02:16.961379	Screen_Shot_2015-11-02_at_12.50.15_PM.png	image/png	427313	2016-02-04 11:01:58.005471	\N	\N
12	25	2016-02-04 11:41:24.566946	2016-02-04 11:41:24.566946	Screen_Shot_2016-01-13_at_1.42.07_PM.png	image/png	318104	2016-02-04 11:41:23.960566	\N	\N
15	\N	2016-02-04 12:53:06.613386	2016-02-04 12:53:06.613386	Screen_Shot_2015-12-13_at_4.19.24_PM.png	image/png	6780340	2016-02-04 12:53:03.53892	yoy yo	\N
18	10	2016-02-05 12:51:57.847391	2016-02-07 07:32:09.212303	dashboard_main.png	image/png	36758	2016-02-07 07:30:47.996824	Template and open-source dashboard front end for public health metrics	t
19	27	2016-02-05 12:53:09.260532	2016-02-05 14:21:59.061613	eIMS_main.png	image/png	46555	2016-02-05 12:53:08.930846	Tablet and mobile application for tracking health inventory at rural health centers	t
20	28	2016-02-05 12:57:12.077601	2016-02-05 14:23:11.352341	handle_it_main.png	image/png	50265	2016-02-05 12:57:11.751934	App for lower-to-middle-income families to access public services and benefits	t
21	29	2016-02-05 12:58:01.376365	2016-02-05 14:23:41.823421	bridge_main.png	image/png	44561	2016-02-05 12:58:00.995737	Platform for connecting Fortune 500s to startups 	t
22	30	2016-02-05 12:58:49.685427	2016-02-05 14:23:59.200361	our_recovery_main.png	image/png	72094	2016-02-05 12:58:49.362706	Rehab application for recovering addicts	t
17	26	2016-02-05 12:50:32.974074	2016-02-05 14:26:45.180942	project_al_main.png	image/png	123437	2016-02-05 12:50:32.458683	 Allows doctors to remotely monitor their elderly patients with chronic illnesses and uses elements of cognitive computing.	t
\.


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Logan
--

SELECT pg_catalog.setval('images_id_seq', 24, true);


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: Logan
--

COPY projects (id, rank, name, has_subsection, created_at, updated_at, short_description) FROM stdin;
19	3	Handle It	t	2016-01-31 06:18:51.309375	2016-01-31 06:18:51.309375	\N
20	4	Bridge	t	2016-01-31 06:18:51.312695	2016-01-31 06:18:51.312695	\N
21	5	Project Al	t	2016-01-31 06:18:51.316194	2016-01-31 06:18:51.316194	\N
22	6	Our Recovery	t	2016-01-31 06:18:51.318811	2016-01-31 06:18:51.318811	\N
23	7	SWAT App	t	2016-01-31 06:18:51.322896	2016-01-31 06:18:51.322896	\N
24	8	Diabetes App	t	2016-01-31 06:18:51.325847	2016-01-31 06:18:51.325847	\N
25	9	CMP	f	2016-01-31 06:18:51.328961	2016-01-31 06:18:51.328961	\N
26	10	EID	f	2016-01-31 06:18:51.332273	2016-01-31 06:18:51.332273	\N
27	11	KOI	f	2016-01-31 06:18:51.3368	2016-01-31 06:18:51.3368	\N
28	12	Human Connect	f	2016-01-31 06:18:51.339569	2016-01-31 06:18:51.339569	\N
29	13	Digital Health Product Hunt	f	2016-01-31 06:18:51.341728	2016-01-31 06:18:51.341728	\N
30	14	Contact App	f	2016-01-31 06:18:51.344797	2016-01-31 06:18:51.344797	\N
17	1	Health Dashboard	t	2016-01-31 06:18:51.300065	2016-02-05 15:48:42.419137	this is the best
18	2	eIMS	t	2016-01-31 06:18:51.304771	2016-02-06 12:22:42.111856	This is the best ever
\.


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Logan
--

SELECT pg_catalog.setval('projects_id_seq', 30, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Logan
--

COPY schema_migrations (version) FROM stdin;
20160127110127
20160127115606
20160127115927
20160127120059
20160127124219
20160204120415
20160204120528
20160204130011
\.


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: Logan; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Logan; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: Logan; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: Logan; Tablespace: 
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: Logan; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: Logan
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "Logan";
GRANT ALL ON SCHEMA public TO "Logan";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

