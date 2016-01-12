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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ideas_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ideas_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ideas_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ideas_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ideas_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ideas_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ideas_user;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ideas_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ideas_user;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ideas_user;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ideas_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ideas_user;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ideas_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ideas_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ideas_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ideas_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ideas_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ideas_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ideas_user;

--
-- Name: idea_category; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE idea_category (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.idea_category OWNER TO ideas_user;

--
-- Name: idea_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE idea_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idea_category_id_seq OWNER TO ideas_user;

--
-- Name: idea_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE idea_category_id_seq OWNED BY idea_category.id;


--
-- Name: idea_idea; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE idea_idea (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    created_date timestamp with time zone NOT NULL,
    description text NOT NULL,
    category_id integer NOT NULL,
    user_id integer NOT NULL,
    votes integer NOT NULL
);


ALTER TABLE public.idea_idea OWNER TO ideas_user;

--
-- Name: idea_idea_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE idea_idea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idea_idea_id_seq OWNER TO ideas_user;

--
-- Name: idea_idea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE idea_idea_id_seq OWNED BY idea_idea.id;


--
-- Name: idea_userideavote; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE idea_userideavote (
    id integer NOT NULL,
    vote integer NOT NULL,
    idea_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.idea_userideavote OWNER TO ideas_user;

--
-- Name: idea_userideavote_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE idea_userideavote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idea_userideavote_id_seq OWNER TO ideas_user;

--
-- Name: idea_userideavote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE idea_userideavote_id_seq OWNED BY idea_userideavote.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO ideas_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO ideas_user;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO ideas_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO ideas_user;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO ideas_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO ideas_user;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO ideas_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: ideas_user
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO ideas_user;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ideas_user
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_category ALTER COLUMN id SET DEFAULT nextval('idea_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_idea ALTER COLUMN id SET DEFAULT nextval('idea_idea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_userideavote ALTER COLUMN id SET DEFAULT nextval('idea_userideavote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add user social auth	7	add_usersocialauth
20	Can change user social auth	7	change_usersocialauth
21	Can delete user social auth	7	delete_usersocialauth
22	Can add nonce	8	add_nonce
23	Can change nonce	8	change_nonce
24	Can delete nonce	8	delete_nonce
25	Can add association	9	add_association
26	Can change association	9	change_association
27	Can delete association	9	delete_association
28	Can add code	10	add_code
29	Can change code	10	change_code
30	Can delete code	10	delete_code
31	Can add Category	11	add_category
32	Can change Category	11	change_category
33	Can delete Category	11	delete_category
34	Can add idea	12	add_idea
35	Can change idea	12	change_idea
36	Can delete idea	12	delete_idea
37	Can add user idea vote	13	add_userideavote
38	Can change user idea vote	13	change_userideavote
39	Can delete user idea vote	13	delete_userideavote
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_permission_id_seq', 39, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	!iTHO7S1S9h3hOaI9NQHgcxOM0cq4YPnkrR2UNDtA	2015-10-23 13:36:10.489446+00	f	PierreGuillemot	Pierre	Guillemot		f	t	2015-10-23 12:48:46.92385+00
2	pbkdf2_sha256$20000$wQeaC5lOUi6h$G5zarc33Dxr2IFMqAa0S5Cgx6Dl22wS6GPiJ1HboQIk=	2015-10-23 13:53:49.125797+00	t	admin			admin@admin.com	t	t	2015-10-23 13:53:19.536206+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2015-10-23 13:55:57.670357+00	1	Technology	1		11	2
2	2015-10-23 14:56:51.84963+00	2	Internet	1		11	2
3	2015-10-23 14:57:21.776792+00	3	Mobile	1		11	2
4	2015-10-23 14:58:05.204574+00	4	Video game	1		11	2
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 4, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	default	usersocialauth
8	default	nonce
9	default	association
10	default	code
11	idea	category
12	idea	idea
13	idea	userideavote
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('django_content_type_id_seq', 13, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2015-10-21 19:03:38.49482+00
2	auth	0001_initial	2015-10-21 19:03:38.625847+00
3	admin	0001_initial	2015-10-21 19:03:38.672507+00
4	contenttypes	0002_remove_content_type_name	2015-10-21 19:03:38.746723+00
5	auth	0002_alter_permission_name_max_length	2015-10-21 19:03:38.777142+00
6	auth	0003_alter_user_email_max_length	2015-10-21 19:03:38.802208+00
7	auth	0004_alter_user_username_opts	2015-10-21 19:03:38.831637+00
8	auth	0005_alter_user_last_login_null	2015-10-21 19:03:38.860315+00
9	auth	0006_require_contenttypes_0002	2015-10-21 19:03:38.864957+00
10	default	0001_initial	2015-10-21 19:03:38.98694+00
11	default	0002_add_related_name	2015-10-21 19:03:39.044554+00
12	default	0003_alter_email_max_length	2015-10-21 19:03:39.05886+00
13	idea	0001_initial	2015-10-21 19:03:39.07561+00
14	idea	0002_auto_20150824_1440	2015-10-21 19:03:39.085056+00
15	idea	0003_category	2015-10-21 19:03:39.101549+00
16	idea	0004_auto_20150827_1459	2015-10-21 19:03:39.13166+00
17	idea	0005_idea_user	2015-10-21 19:03:39.172506+00
18	idea	0006_idea_votes	2015-10-21 19:03:39.224049+00
19	idea	0007_auto_20150928_1334	2015-10-21 19:03:39.311504+00
20	sessions	0001_initial	2015-10-21 19:03:39.332008+00
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('django_migrations_id_seq', 20, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
om7l9wdyey32aoro0qkw3lt48jrh3989	YjZmNzYwMGYzOTBmZmNlMDYwNzEwOGZkMGRjZTZmMGE1Y2JkYmIxMzp7Il9hdXRoX3VzZXJfaGFzaCI6ImIwZTU4NDJiMzRlMjdkZjg0Y2E0ZWMyZWQwMDgwMjkwMTkyY2RkOWEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIyIn0=	2015-11-06 13:53:49.130347+00
\.


--
-- Data for Name: idea_category; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY idea_category (id, title, description) FROM stdin;
1	Technology	Technology things
2	Internet	Description for internet
3	Mobile	Ideas for the mobile world
4	Video game	New concepts or refactor of old video games
\.


--
-- Name: idea_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('idea_category_id_seq', 4, true);


--
-- Data for Name: idea_idea; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY idea_idea (id, title, created_date, description, category_id, user_id, votes) FROM stdin;
\.


--
-- Name: idea_idea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('idea_idea_id_seq', 1, false);


--
-- Data for Name: idea_userideavote; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY idea_userideavote (id, vote, idea_id, user_id) FROM stdin;
\.


--
-- Name: idea_userideavote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('idea_userideavote_id_seq', 1, false);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY social_auth_code (id, email, code, verified) FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: ideas_user
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
1	facebook	10206766770719437	{"access_token": "CAAYPfU4fZBHwBAFUr22ie5im8cHSOPBaLSRZAvzaRvblSSZCyNf2jrkJ5tbrWlNKUMnxzPknuLsKglw3b9IZCWROuuZAWILz8OpGAZAP2JNsDeVXSEDtx6l46ZCNOXHvZC2rkIZB5AuYZA5y3hityvqepDCpgdneDc71zGnAjlNkoQ81ZB0HA7TaZAP4Bz0nS2TcVr3dBYZBpJZAHqZAQZDZD", "expires": null, "id": "10206766770719437"}	1
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ideas_user
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 1, true);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_45f3b1d93ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_45f3b1d93ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: idea_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY idea_category
    ADD CONSTRAINT idea_category_pkey PRIMARY KEY (id);


--
-- Name: idea_idea_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY idea_idea
    ADD CONSTRAINT idea_idea_pkey PRIMARY KEY (id);


--
-- Name: idea_userideavote_idea_id_7a1a2eb818e0818d_uniq; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY idea_userideavote
    ADD CONSTRAINT idea_userideavote_idea_id_7a1a2eb818e0818d_uniq UNIQUE (idea_id, user_id);


--
-- Name: idea_userideavote_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY idea_userideavote
    ADD CONSTRAINT idea_userideavote_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_code_email_75f27066d057e3b6_uniq; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_75f27066d057e3b6_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_36601f978463b4_uniq; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_36601f978463b4_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq; Type: CONSTRAINT; Schema: public; Owner: ideas_user; Tablespace: 
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_253ae2a6331666e8_like; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_group_name_253ae2a6331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_51b3b110094b8aae_like; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX auth_user_username_51b3b110094b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_461cfeaa630ca218_like; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX django_session_session_key_461cfeaa630ca218_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: idea_idea_b583a629; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX idea_idea_b583a629 ON idea_idea USING btree (category_id);


--
-- Name: idea_idea_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX idea_idea_e8701ad4 ON idea_idea USING btree (user_id);


--
-- Name: idea_userideavote_3491610b; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX idea_userideavote_3491610b ON idea_userideavote USING btree (idea_id);


--
-- Name: idea_userideavote_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX idea_userideavote_e8701ad4 ON idea_userideavote USING btree (user_id);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX social_auth_code_c1336794 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_32d820bdeaa954bc_like; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX social_auth_code_code_32d820bdeaa954bc_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: ideas_user; Tablespace: 
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_content_type_id_508cf46651277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_content_type_id_508cf46651277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_group_id_689710a9a73b7457_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user__permission_id_384b62483d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permiss_user_id_7f0938558328534a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: djan_content_type_id_697914295151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT djan_content_type_id_697914295151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idea_idea_category_id_f15e4391977b2b2_fk_idea_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_idea
    ADD CONSTRAINT idea_idea_category_id_f15e4391977b2b2_fk_idea_category_id FOREIGN KEY (category_id) REFERENCES idea_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idea_idea_user_id_7d1bad3e807412ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_idea
    ADD CONSTRAINT idea_idea_user_id_7d1bad3e807412ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idea_userideavote_idea_id_9117ce2869faca_fk_idea_idea_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_userideavote
    ADD CONSTRAINT idea_userideavote_idea_id_9117ce2869faca_fk_idea_idea_id FOREIGN KEY (idea_id) REFERENCES idea_idea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: idea_userideavote_user_id_96fa0251969f102_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY idea_userideavote
    ADD CONSTRAINT idea_userideavote_user_id_96fa0251969f102_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocial_user_id_193b2d80880502b2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ideas_user
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocial_user_id_193b2d80880502b2_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

