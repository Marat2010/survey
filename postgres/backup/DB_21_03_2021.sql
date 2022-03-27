--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

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
-- Name: api_answer; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_answer (
    id integer NOT NULL,
    answer text NOT NULL
);


ALTER TABLE public.api_answer OWNER TO marat;

--
-- Name: api_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_answer_id_seq OWNER TO marat;

--
-- Name: api_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_answer_id_seq OWNED BY public.api_answer.id;


--
-- Name: api_question; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_question (
    id integer NOT NULL,
    question_text text NOT NULL,
    type_answer character varying(1) NOT NULL
);


ALTER TABLE public.api_question OWNER TO marat;

--
-- Name: api_question_answers; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_question_answers (
    id integer NOT NULL,
    question_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_question_answers OWNER TO marat;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_question_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_answers_id_seq OWNER TO marat;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_question_answers_id_seq OWNED BY public.api_question_answers.id;


--
-- Name: api_question_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_id_seq OWNER TO marat;

--
-- Name: api_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_question_id_seq OWNED BY public.api_question.id;


--
-- Name: api_survey; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_survey (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_start timestamp with time zone NOT NULL,
    date_end timestamp with time zone NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.api_survey OWNER TO marat;

--
-- Name: api_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_id_seq OWNER TO marat;

--
-- Name: api_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_survey_id_seq OWNED BY public.api_survey.id;


--
-- Name: api_survey_questions; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_survey_questions (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.api_survey_questions OWNER TO marat;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_survey_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_questions_id_seq OWNER TO marat;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_survey_questions_id_seq OWNED BY public.api_survey_questions.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_user (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.api_user OWNER TO marat;

--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO marat;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_useranswer; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_useranswer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    survey_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_useranswer OWNER TO marat;

--
-- Name: api_useranswer_answer; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.api_useranswer_answer (
    id integer NOT NULL,
    useranswer_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_useranswer_answer OWNER TO marat;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_useranswer_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_answer_id_seq OWNER TO marat;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_useranswer_answer_id_seq OWNED BY public.api_useranswer_answer.id;


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.api_useranswer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_id_seq OWNER TO marat;

--
-- Name: api_useranswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.api_useranswer_id_seq OWNED BY public.api_useranswer.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO marat;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO marat;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO marat;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO marat;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO marat;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO marat;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO marat;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO marat;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO marat;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO marat;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO marat;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO marat;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO marat;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO marat;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO marat;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO marat;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO marat;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: marat
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO marat;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: marat
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: marat
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO marat;

--
-- Name: api_answer id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_answer ALTER COLUMN id SET DEFAULT nextval('public.api_answer_id_seq'::regclass);


--
-- Name: api_question id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question ALTER COLUMN id SET DEFAULT nextval('public.api_question_id_seq'::regclass);


--
-- Name: api_question_answers id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question_answers ALTER COLUMN id SET DEFAULT nextval('public.api_question_answers_id_seq'::regclass);


--
-- Name: api_survey id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey ALTER COLUMN id SET DEFAULT nextval('public.api_survey_id_seq'::regclass);


--
-- Name: api_survey_questions id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.api_survey_questions_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_useranswer id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_id_seq'::regclass);


--
-- Name: api_useranswer_answer id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer_answer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_answer_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_answer; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_answer (id, answer) FROM stdin;
1	Да
2	Нет
3	Мужчина
4	Женщина
5	Зима
6	Весна
7	Лето
8	Осень
9	Marat
10	John
11	40
12	33
13	20
14	Pol
15	25
16	Иван
17	Рома
18	50
19	Женя
20	15
21	Валя
22	52
23	31
24	88
25	Ира
26	243
27	оля
28	21
29	Таня
30	47
\.


--
-- Data for Name: api_question; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_question (id, question_text, type_answer) FROM stdin;
1	Ваше Имя?	0
2	Ваш пол?	1
3	Любимые времена года?	2
4	Ваш Возраст?	0
5	Когда теплее всего?	1
6	Кто ваш друг?	2
\.


--
-- Data for Name: api_question_answers; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_question_answers (id, question_id, answer_id) FROM stdin;
1	2	3
2	2	4
3	3	8
4	3	5
5	3	6
6	3	7
7	5	8
8	5	5
9	5	6
10	5	7
11	6	16
12	6	17
13	6	10
14	6	14
\.


--
-- Data for Name: api_survey; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_survey (id, name, date_start, date_end, description) FROM stdin;
1	Об участнике опроса	2021-03-20 18:32:51+03	2022-06-30 18:33:11+03	Общая информация опрашиваемого
2	Погода	2021-03-20 18:34:00+03	2022-03-31 18:34:14+03	Про погоду
\.


--
-- Data for Name: api_survey_questions; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_survey_questions (id, survey_id, question_id) FROM stdin;
1	1	1
2	1	2
3	1	4
4	2	1
5	2	3
6	2	5
7	1	3
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_user (id, name) FROM stdin;
4	marat
1	admin
2	admin
3	admin
\.


--
-- Data for Name: api_useranswer; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_useranswer (id, question_id, survey_id, user_id) FROM stdin;
14	1	1	1
15	2	1	1
16	3	1	1
17	4	1	1
18	1	2	1
19	2	2	1
20	3	2	1
21	4	2	1
22	1	2	2
23	2	2	2
24	3	2	2
25	4	2	2
26	1	1	4
27	2	1	4
28	3	1	4
29	4	1	4
\.


--
-- Data for Name: api_useranswer_answer; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.api_useranswer_answer (id, useranswer_id, answer_id) FROM stdin;
35	15	4
36	16	6
37	16	7
50	14	29
51	17	30
52	18	14
53	19	4
54	20	6
55	20	7
57	21	15
58	22	14
59	23	4
60	24	6
61	24	7
62	25	15
63	26	14
64	27	4
65	28	6
66	28	7
67	29	15
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Вопрос	7	add_question
26	Can change Вопрос	7	change_question
27	Can delete Вопрос	7	delete_question
28	Can view Вопрос	7	view_question
29	Can add Опрос	8	add_survey
30	Can change Опрос	8	change_survey
31	Can delete Опрос	8	delete_survey
32	Can view Опрос	8	view_survey
33	Can add Ответ	9	add_answer
34	Can change Ответ	9	change_answer
35	Can delete Ответ	9	delete_answer
36	Can view Ответ	9	view_answer
37	Can add Пользователь	10	add_user
38	Can change Пользователь	10	change_user
39	Can delete Пользователь	10	delete_user
40	Can view Пользователь	10	view_user
41	Can add Ответ Пользователя	11	add_useranswer
42	Can change Ответ Пользователя	11	change_useranswer
43	Can delete Ответ Пользователя	11	delete_useranswer
44	Can view Ответ Пользователя	11	view_useranswer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
3	pbkdf2_sha256$150000$QsCFWkpjh5Sb$WYRKh+dAuI8EAbAirQVmomDMRIRB8AiclKmHzxVK27w=	2021-03-20 23:28:56.300445+03	f	api				t	t	2021-03-20 23:27:13+03
1	pbkdf2_sha256$150000$9aEsXGtLh2XC$wXieSINwmdHcgXEQvOA5L3B0m64WO9jPyOY2pIFoX9A=	2021-03-20 23:44:02.744896+03	t	admin			adm@localhost	t	t	2021-03-20 18:12:48.578116+03
2	pbkdf2_sha256$150000$qvwFCRlw9JWm$jdudnymIWi+okO3XwbRki0Rfat4qk36vDuV2jkcsUiU=	2021-03-20 23:44:29.012249+03	t	marat			marat@localhost	t	t	2021-03-20 18:13:41.746202+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	3	25
2	3	26
3	3	27
4	3	28
5	3	29
6	3	30
7	3	31
8	3	32
9	3	33
10	3	34
11	3	35
12	3	36
13	3	37
14	3	38
15	3	39
16	3	40
17	3	41
18	3	42
19	3	43
20	3	44
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-20 18:14:56.494732+03	1	Да	1	[{"added": {}}]	9	1
2	2021-03-20 18:15:01.547403+03	2	Нет	1	[{"added": {}}]	9	1
3	2021-03-20 18:15:41.106412+03	3	Мужчина	1	[{"added": {}}]	9	1
4	2021-03-20 18:15:41.240763+03	4	Мужчина	1	[{"added": {}}]	9	1
5	2021-03-20 18:16:02.224871+03	4	Женщина	2	[{"changed": {"fields": ["answer"]}}]	9	1
6	2021-03-20 18:16:09.008845+03	5	Зима	1	[{"added": {}}]	9	1
7	2021-03-20 18:16:13.166984+03	6	Весна	1	[{"added": {}}]	9	1
8	2021-03-20 18:16:18.594552+03	7	Лето	1	[{"added": {}}]	9	1
9	2021-03-20 18:16:25.916612+03	8	Осень	1	[{"added": {}}]	9	1
10	2021-03-20 18:28:39.362694+03	1	0 - Ваше Имя?	1	[{"added": {}}]	7	1
11	2021-03-20 18:29:12.549373+03	2	1 - Ваш пол?	1	[{"added": {}}]	7	1
12	2021-03-20 18:29:35.422966+03	3	2 - Любимые времена года?	1	[{"added": {}}]	7	1
13	2021-03-20 18:30:17.720381+03	4	0 - Ваш Возраст?	1	[{"added": {}}]	7	1
14	2021-03-20 18:31:49.06433+03	5	1 - Когда теплее всего?	1	[{"added": {}}]	7	1
15	2021-03-20 18:33:35.583255+03	1	Об участнике	1	[{"added": {}}]	8	1
16	2021-03-20 18:34:29.764391+03	2	Погода	1	[{"added": {}}]	8	1
17	2021-03-20 20:28:02.02421+03	1	Об участнике опроса	2	[{"changed": {"fields": ["questions"]}}]	8	1
18	2021-03-20 20:38:31.03008+03	1	UserAnswer object (1)	3		11	1
19	2021-03-20 20:38:31.034909+03	2	UserAnswer object (2)	3		11	1
20	2021-03-20 20:38:31.038365+03	3	UserAnswer object (3)	3		11	1
21	2021-03-20 20:38:31.04202+03	4	UserAnswer object (4)	3		11	1
22	2021-03-20 20:58:47.391646+03	5	UserAnswer object (5)	3		11	1
23	2021-03-20 20:58:47.396038+03	6	UserAnswer object (6)	3		11	1
24	2021-03-20 20:58:47.399127+03	7	UserAnswer object (7)	3		11	1
25	2021-03-20 20:58:47.402185+03	8	UserAnswer object (8)	3		11	1
26	2021-03-20 20:58:47.406245+03	9	UserAnswer object (9)	3		11	1
27	2021-03-20 21:06:14.856157+03	10	UserAnswer object (10)	3		11	1
28	2021-03-20 21:06:14.859996+03	11	UserAnswer object (11)	3		11	1
29	2021-03-20 21:06:14.86407+03	12	UserAnswer object (12)	3		11	1
30	2021-03-20 21:06:14.86839+03	13	UserAnswer object (13)	3		11	1
31	2021-03-20 23:27:13.527936+03	3	api	1	[{"added": {}}]	4	1
32	2021-03-20 23:28:18.653747+03	3	api	2	[{"changed": {"fields": ["is_staff", "user_permissions"]}}]	4	1
33	2021-03-20 23:35:30.556415+03	6	0 - Кто ваш друг?	1	[{"added": {}}]	7	3
34	2021-03-20 23:35:40.359571+03	6	1 - Кто ваш друг?	2	[{"changed": {"fields": ["type_answer"]}}]	7	3
35	2021-03-20 23:35:54.413023+03	6	2 - Кто ваш друг?	2	[{"changed": {"fields": ["type_answer"]}}]	7	3
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	api	question
8	api	survey
9	api	answer
10	api	user
11	api	useranswer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-20 18:06:48.092024+03
2	auth	0001_initial	2021-03-20 18:06:48.192535+03
3	admin	0001_initial	2021-03-20 18:06:48.31907+03
4	admin	0002_logentry_remove_auto_add	2021-03-20 18:06:48.362047+03
5	admin	0003_logentry_add_action_flag_choices	2021-03-20 18:06:48.385784+03
6	api	0001_initial	2021-03-20 18:06:48.546287+03
7	api	0002_auto_20210304_2013	2021-03-20 18:06:48.83835+03
8	api	0003_auto_20210304_2131	2021-03-20 18:06:48.928272+03
9	api	0004_auto_20210304_2159	2021-03-20 18:06:48.975106+03
10	api	0005_auto_20210304_2250	2021-03-20 18:06:49.048684+03
11	api	0006_user	2021-03-20 18:06:49.088187+03
12	api	0007_auto_20210304_2327	2021-03-20 18:06:49.107378+03
13	api	0008_auto_20210304_2331	2021-03-20 18:06:49.125737+03
14	api	0009_auto_20210304_2333	2021-03-20 18:06:49.138344+03
15	api	0010_auto_20210304_2334	2021-03-20 18:06:49.148899+03
16	api	0011_useranswer	2021-03-20 18:06:49.182173+03
17	api	0012_auto_20210305_0220	2021-03-20 18:06:49.313347+03
18	api	0013_auto_20210305_0259	2021-03-20 18:06:49.346663+03
19	api	0014_auto_20210306_0207	2021-03-20 18:06:49.397022+03
20	api	0015_auto_20210306_2355	2021-03-20 18:06:49.418854+03
21	api	0016_auto_20210307_1859	2021-03-20 18:06:49.471677+03
22	api	0017_auto_20210307_1901	2021-03-20 18:06:49.532914+03
23	api	0018_auto_20210307_1903	2021-03-20 18:06:49.571688+03
24	api	0019_auto_20210307_1905	2021-03-20 18:06:49.615381+03
25	api	0020_auto_20210307_1906	2021-03-20 18:06:49.675796+03
26	api	0021_auto_20210307_1919	2021-03-20 18:06:49.718022+03
27	api	0022_auto_20210307_1930	2021-03-20 18:06:49.754344+03
28	api	0023_auto_20210307_1932	2021-03-20 18:06:49.820614+03
29	api	0024_auto_20210307_1948	2021-03-20 18:06:49.872779+03
30	api	0025_auto_20210307_2000	2021-03-20 18:06:49.915072+03
31	api	0026_auto_20210311_1948	2021-03-20 18:06:49.946421+03
32	api	0027_auto_20210311_2014	2021-03-20 18:06:50.210867+03
33	api	0028_auto_20210312_1228	2021-03-20 18:06:50.252446+03
34	api	0029_auto_20210312_1943	2021-03-20 18:06:50.338984+03
35	api	0030_auto_20210320_0108	2021-03-20 18:06:50.412132+03
36	contenttypes	0002_remove_content_type_name	2021-03-20 18:06:50.494352+03
37	auth	0002_alter_permission_name_max_length	2021-03-20 18:06:50.511254+03
38	auth	0003_alter_user_email_max_length	2021-03-20 18:06:50.535654+03
39	auth	0004_alter_user_username_opts	2021-03-20 18:06:50.560727+03
40	auth	0005_alter_user_last_login_null	2021-03-20 18:06:50.584294+03
41	auth	0006_require_contenttypes_0002	2021-03-20 18:06:50.590422+03
42	auth	0007_alter_validators_add_error_messages	2021-03-20 18:06:50.618837+03
43	auth	0008_alter_user_username_max_length	2021-03-20 18:06:50.652792+03
44	auth	0009_alter_user_last_name_max_length	2021-03-20 18:06:50.678587+03
45	auth	0010_alter_group_name_max_length	2021-03-20 18:06:50.703915+03
46	auth	0011_update_proxy_permissions	2021-03-20 18:06:50.737537+03
47	sessions	0001_initial	2021-03-20 18:06:50.759758+03
48	api	0031_auto_20210321_0017	2021-03-21 00:17:48.634451+03
49	api	0032_auto_20210321_0046	2021-03-21 00:46:31.738404+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: marat
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
lf92w1uez6q2rnwesffoxnozs7widuyo	ZTdmZDE2ZmUwYjgzZDRkMDdhMDM3NDZmZmQyODIwNmVhMDc1MzgxNDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhNDc1ZWM0NDIzMWE1YjBmMzg4ZTVmNjIwNmExY2FiNmMwNmQ5YzFlIiwidXNlcl9zZXNzaW9uIjozfQ==	2021-04-04 01:45:07.480652+03
lmjwhsqcs3czcu5io7cgy3kyx3tf2gbd	MDk5ZGFlY2YyNTNlYmExNWM1NzExOTIwMDllOTZiOWVhOTBiMzZjZjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2NmMxMmQ3OWQ0MzQ4OTgzNmZjOTYxZjQ2NzdmMjA1YzJlYzBmN2UxIiwidXNlcl9zZXNzaW9uIjo0fQ==	2021-04-04 02:47:10.520924+03
\.


--
-- Name: api_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_answer_id_seq', 30, true);


--
-- Name: api_question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_question_answers_id_seq', 14, true);


--
-- Name: api_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_question_id_seq', 6, true);


--
-- Name: api_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_survey_id_seq', 2, true);


--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_survey_questions_id_seq', 7, true);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_user_id_seq', 4, true);


--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_useranswer_answer_id_seq', 67, true);


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.api_useranswer_id_seq', 29, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 20, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 35, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: marat
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Name: api_answer api_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_answer
    ADD CONSTRAINT api_answer_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_question_id_answer_id_cc7ec79d_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_answer_id_cc7ec79d_uniq UNIQUE (question_id, answer_id);


--
-- Name: api_question api_question_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question
    ADD CONSTRAINT api_question_pkey PRIMARY KEY (id);


--
-- Name: api_survey api_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey
    ADD CONSTRAINT api_survey_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_survey_id_question_id_94640fc2_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_question_id_94640fc2_uniq UNIQUE (survey_id, question_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq UNIQUE (useranswer_id, answer_id);


--
-- Name: api_useranswer api_useranswer_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_question_answers_answer_id_e042d42d; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_question_answers_answer_id_e042d42d ON public.api_question_answers USING btree (answer_id);


--
-- Name: api_question_answers_question_id_c6a78bf4; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_question_answers_question_id_c6a78bf4 ON public.api_question_answers USING btree (question_id);


--
-- Name: api_survey_date_end_4977d1cd; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_survey_date_end_4977d1cd ON public.api_survey USING btree (date_end);


--
-- Name: api_survey_date_start_7b596edf; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_survey_date_start_7b596edf ON public.api_survey USING btree (date_start);


--
-- Name: api_survey_questions_question_id_1beb7d3b; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_survey_questions_question_id_1beb7d3b ON public.api_survey_questions USING btree (question_id);


--
-- Name: api_survey_questions_survey_id_bd41f0c5; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_survey_questions_survey_id_bd41f0c5 ON public.api_survey_questions USING btree (survey_id);


--
-- Name: api_useranswer_answer_answer_id_4dfdce7a; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_useranswer_answer_answer_id_4dfdce7a ON public.api_useranswer_answer USING btree (answer_id);


--
-- Name: api_useranswer_answer_useranswer_id_217efb29; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_useranswer_answer_useranswer_id_217efb29 ON public.api_useranswer_answer USING btree (useranswer_id);


--
-- Name: api_useranswer_question_id_1b9aaa53; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_useranswer_question_id_1b9aaa53 ON public.api_useranswer USING btree (question_id);


--
-- Name: api_useranswer_survey_id_09e0aac4; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_useranswer_survey_id_09e0aac4 ON public.api_useranswer USING btree (survey_id);


--
-- Name: api_useranswer_user_id_a7a24a0d; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX api_useranswer_user_id_a7a24a0d ON public.api_useranswer USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: marat
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_question_answers api_question_answers_answer_id_e042d42d_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_answer_id_e042d42d_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_question_answers api_question_answers_question_id_c6a78bf4_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_c6a78bf4_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_question_id_1beb7d3b_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_question_id_1beb7d3b_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answe_useranswer_id_217efb29_fk_api_usera; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answe_useranswer_id_217efb29_fk_api_usera FOREIGN KEY (useranswer_id) REFERENCES public.api_useranswer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_question_id_1b9aaa53_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_question_id_1b9aaa53_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_survey_id_09e0aac4_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_survey_id_09e0aac4_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_user_id_a7a24a0d_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_user_id_a7a24a0d_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: marat
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

