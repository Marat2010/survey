--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-1.pgdg20.04+1)

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_answer (
    id integer NOT NULL,
    answer text NOT NULL
);


ALTER TABLE public.api_answer OWNER TO postgres;

--
-- Name: api_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_answer_id_seq OWNER TO postgres;

--
-- Name: api_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_answer_id_seq OWNED BY public.api_answer.id;


--
-- Name: api_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_question (
    id integer NOT NULL,
    question_text text NOT NULL,
    type_answer character varying(1) NOT NULL
);


ALTER TABLE public.api_question OWNER TO postgres;

--
-- Name: api_question_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_question_answers (
    id integer NOT NULL,
    question_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_question_answers OWNER TO postgres;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_question_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_answers_id_seq OWNER TO postgres;

--
-- Name: api_question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_question_answers_id_seq OWNED BY public.api_question_answers.id;


--
-- Name: api_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_question_id_seq OWNER TO postgres;

--
-- Name: api_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_question_id_seq OWNED BY public.api_question.id;


--
-- Name: api_survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_survey (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date_start timestamp with time zone NOT NULL,
    date_end timestamp with time zone NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.api_survey OWNER TO postgres;

--
-- Name: api_survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_id_seq OWNER TO postgres;

--
-- Name: api_survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_survey_id_seq OWNED BY public.api_survey.id;


--
-- Name: api_survey_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_survey_questions (
    id integer NOT NULL,
    survey_id integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE public.api_survey_questions OWNER TO postgres;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_survey_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_survey_questions_id_seq OWNER TO postgres;

--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_survey_questions_id_seq OWNED BY public.api_survey_questions.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_user (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.api_user OWNER TO postgres;

--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO postgres;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_useranswer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_useranswer (
    id integer NOT NULL,
    question_id integer NOT NULL,
    survey_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.api_useranswer OWNER TO postgres;

--
-- Name: api_useranswer_answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_useranswer_answer (
    id integer NOT NULL,
    useranswer_id integer NOT NULL,
    answer_id integer NOT NULL
);


ALTER TABLE public.api_useranswer_answer OWNER TO postgres;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_useranswer_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_answer_id_seq OWNER TO postgres;

--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_useranswer_answer_id_seq OWNED BY public.api_useranswer_answer.id;


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_useranswer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_useranswer_id_seq OWNER TO postgres;

--
-- Name: api_useranswer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_useranswer_id_seq OWNED BY public.api_useranswer.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: api_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_answer ALTER COLUMN id SET DEFAULT nextval('public.api_answer_id_seq'::regclass);


--
-- Name: api_question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question ALTER COLUMN id SET DEFAULT nextval('public.api_question_id_seq'::regclass);


--
-- Name: api_question_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers ALTER COLUMN id SET DEFAULT nextval('public.api_question_answers_id_seq'::regclass);


--
-- Name: api_survey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey ALTER COLUMN id SET DEFAULT nextval('public.api_survey_id_seq'::regclass);


--
-- Name: api_survey_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions ALTER COLUMN id SET DEFAULT nextval('public.api_survey_questions_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_useranswer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_id_seq'::regclass);


--
-- Name: api_useranswer_answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer ALTER COLUMN id SET DEFAULT nextval('public.api_useranswer_answer_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_answer (id, answer) FROM stdin;
1	Да
2	Нет
3	Муж.
4	Жен.
5	Зима
6	Весна
7	Лето
8	Осень
9	Путин
10	Зюганов
11	Жириновский
12	Явлинский
13	Медведев
14	Николай
15	Александр
16	34
17	Василий
18	Иван
\.


--
-- Data for Name: api_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question (id, question_text, type_answer) FROM stdin;
3	Ваш пол?	1
1	Ваше имя?	0
2	Ваш возраст?	0
4	Какие времена года Вам нравиться?	2
5	Самое холодное время года?	1
6	Кто выиграет на выборах?	1
7	Кому из политиков Вы доверяете?	2
8	Почему катаклизмы в погоде?	0
\.


--
-- Data for Name: api_question_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_question_answers (id, question_id, answer_id) FROM stdin;
1	3	3
2	3	4
3	4	8
4	4	5
5	4	6
6	4	7
7	5	8
8	5	5
9	5	6
10	5	7
11	6	9
12	6	10
13	6	11
14	6	12
15	6	13
16	7	9
17	7	10
18	7	11
19	7	12
20	7	13
\.


--
-- Data for Name: api_survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey (id, name, date_start, date_end, description) FROM stdin;
1	Общая информация	2021-03-21 20:53:02+03	2021-04-14 19:00:00+03	Общая информация об опрашиваемом
2	Погода	2021-03-21 20:54:06+03	2021-04-30 20:00:00+03	Мнение о погоде
3	Политика	2021-03-21 20:00:00+03	2021-07-21 20:00:00+03	О политике и выборах
\.


--
-- Data for Name: api_survey_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_survey_questions (id, survey_id, question_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	1
5	2	4
6	2	5
7	3	6
8	3	7
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_user (id, name) FROM stdin;
1	AnonymousUser
2	AnonymousUser
3	AnonymousUser
4	AnonymousUser
5	adm
6	api
7	AnonymousUser
8	AnonymousUser
9	AnonymousUser
10	AnonymousUser
11	AnonymousUser
\.


--
-- Data for Name: api_useranswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_useranswer (id, question_id, survey_id, user_id) FROM stdin;
1	1	2	5
2	4	2	5
3	5	2	5
4	1	1	6
5	2	1	6
6	3	1	6
7	6	3	6
8	7	3	6
9	1	2	6
10	4	2	6
11	5	2	6
12	1	2	8
13	4	2	8
14	5	2	8
\.


--
-- Data for Name: api_useranswer_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_useranswer_answer (id, useranswer_id, answer_id) FROM stdin;
1	1	14
2	2	6
3	2	7
4	3	5
5	4	15
6	5	16
7	6	3
8	7	9
9	8	10
10	8	11
11	8	12
12	9	17
13	10	7
14	11	5
15	12	18
16	13	7
17	14	5
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$16qyWIbFsfOC$sv35c/s4Z+D6J0R5Mg5JB6d01mVpCOIMp8CQ1QNtD/4=	2021-03-21 20:39:47.16735+03	t	admin			adm@localhost	t	t	2021-03-21 04:02:48.344796+03
4	pbkdf2_sha256$150000$qjkq2N0yvbIm$P4cMfAlCEmLR9meSW9x/OSUxtogGY02cvtkbxjTkPEI=	2021-03-21 21:34:27.627994+03	f	adm			adm@localhost	t	t	2021-03-21 21:25:10+03
5	pbkdf2_sha256$150000$MPkwaomeajUc$o4D50jHEqan1kRPgxPT5B09j0nrBMIN8PfbwCluEmcY=	2021-03-21 21:41:38.174949+03	f	api				f	t	2021-03-21 21:26:34+03
2	pbkdf2_sha256$150000$JrH6dlTlDSVD$yoLyQEKC5ZjcV3sbDQBsBVu4/Hk8uVyfhLNnTY2VA40=	2021-03-21 21:43:00.622939+03	t	marat			marat@localhost	t	t	2021-03-21 04:03:21.52813+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
21	4	25
22	4	26
23	4	27
24	4	28
25	4	29
26	4	30
27	4	31
28	4	32
29	4	33
30	4	34
31	4	35
32	4	36
33	4	37
34	4	38
35	4	39
36	4	40
37	4	41
38	4	42
39	4	43
40	4	44
41	5	25
42	5	26
43	5	27
44	5	28
45	5	29
46	5	30
47	5	31
48	5	32
49	5	33
50	5	34
51	5	35
52	5	36
53	5	37
54	5	38
55	5	39
56	5	40
57	5	41
58	5	42
59	5	43
60	5	44
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-03-21 20:43:54.141614+03	1	Да	1	[{"added": {}}]	9	1
2	2021-03-21 20:43:58.144426+03	2	Нет	1	[{"added": {}}]	9	1
3	2021-03-21 20:44:04.420076+03	3	Муж.	1	[{"added": {}}]	9	1
4	2021-03-21 20:44:15.284921+03	4	Жен.	1	[{"added": {}}]	9	1
5	2021-03-21 20:44:23.02909+03	5	Зима	1	[{"added": {}}]	9	1
6	2021-03-21 20:44:27.237274+03	6	Весна	1	[{"added": {}}]	9	1
7	2021-03-21 20:44:32.824025+03	7	Лето	1	[{"added": {}}]	9	1
8	2021-03-21 20:45:16.626779+03	8	Осень	1	[{"added": {}}]	9	1
9	2021-03-21 20:46:27.012356+03	2	0 - Ваш возраст	2	[{"changed": {"fields": ["type_answer"]}}]	7	1
10	2021-03-21 20:47:38.553858+03	1	0 - Ваше имя?	2	[{"changed": {"fields": ["question_text"]}}]	7	1
11	2021-03-21 20:47:45.064115+03	2	0 - Ваш возраст?	2	[{"changed": {"fields": ["question_text"]}}]	7	1
12	2021-03-21 20:53:57.945562+03	1	1: Общая информация	1	[{"added": {}}]	8	1
13	2021-03-21 20:55:11.147419+03	2	2: Погода	1	[{"added": {}}]	8	1
14	2021-03-21 20:55:27.886872+03	2	2: Погода	2	[{"changed": {"fields": ["description"]}}]	8	1
15	2021-03-21 21:04:47.123703+03	9	Путин	1	[{"added": {}}]	9	1
16	2021-03-21 21:05:00.264646+03	10	Зюганов	1	[{"added": {}}]	9	1
17	2021-03-21 21:05:31.461203+03	11	Жириновский	1	[{"added": {}}]	9	1
18	2021-03-21 21:06:32.373653+03	12	Явлинский	1	[{"added": {}}]	9	1
19	2021-03-21 21:06:47.939958+03	13	Медведев	1	[{"added": {}}]	9	1
20	2021-03-21 21:14:18.716277+03	3	3: Политика	2	[{"changed": {"fields": ["questions"]}}]	8	1
21	2021-03-21 21:21:25.341565+03	8	0 - Почему катаклизмы в погоде?	1	[{"added": {}}]	7	1
22	2021-03-21 21:22:42.760005+03	3	api	1	[{"added": {}}]	4	1
23	2021-03-21 21:23:14.36815+03	3	api	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
24	2021-03-21 21:25:35.69402+03	4	adm	2	[{"changed": {"fields": ["is_superuser", "user_permissions"]}}]	4	1
25	2021-03-21 21:26:19.328226+03	3	api	3		4	1
26	2021-03-21 21:26:59.257283+03	5	api	2	[{"changed": {"fields": ["is_staff", "is_superuser", "user_permissions"]}}]	4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-03-21 03:41:53.912427+03
2	auth	0001_initial	2021-03-21 03:41:54.011392+03
3	admin	0001_initial	2021-03-21 03:41:54.137673+03
4	admin	0002_logentry_remove_auto_add	2021-03-21 03:41:54.178308+03
5	admin	0003_logentry_add_action_flag_choices	2021-03-21 03:41:54.200775+03
6	api	0001_initial	2021-03-21 03:41:54.349232+03
7	api	0002_auto_20210304_2013	2021-03-21 03:41:54.638288+03
8	api	0003_auto_20210304_2131	2021-03-21 03:41:54.724679+03
9	api	0004_auto_20210304_2159	2021-03-21 03:41:54.769905+03
10	api	0005_auto_20210304_2250	2021-03-21 03:41:54.839262+03
11	api	0006_user	2021-03-21 03:41:54.879359+03
12	api	0007_auto_20210304_2327	2021-03-21 03:41:54.896671+03
13	api	0008_auto_20210304_2331	2021-03-21 03:41:54.914234+03
14	api	0009_auto_20210304_2333	2021-03-21 03:41:54.928188+03
15	api	0010_auto_20210304_2334	2021-03-21 03:41:54.938281+03
16	api	0011_useranswer	2021-03-21 03:41:54.97262+03
17	api	0012_auto_20210305_0220	2021-03-21 03:41:55.102088+03
18	api	0013_auto_20210305_0259	2021-03-21 03:41:55.131385+03
19	api	0014_auto_20210306_0207	2021-03-21 03:41:55.177314+03
20	api	0015_auto_20210306_2355	2021-03-21 03:41:55.196888+03
21	api	0016_auto_20210307_1859	2021-03-21 03:41:55.248206+03
22	api	0017_auto_20210307_1901	2021-03-21 03:41:55.310245+03
23	api	0018_auto_20210307_1903	2021-03-21 03:41:55.349257+03
24	api	0019_auto_20210307_1905	2021-03-21 03:41:55.395088+03
25	api	0020_auto_20210307_1906	2021-03-21 03:41:55.456683+03
26	api	0021_auto_20210307_1919	2021-03-21 03:41:55.500134+03
27	api	0022_auto_20210307_1930	2021-03-21 03:41:55.538286+03
28	api	0023_auto_20210307_1932	2021-03-21 03:41:55.606329+03
29	api	0024_auto_20210307_1948	2021-03-21 03:41:55.655445+03
30	api	0025_auto_20210307_2000	2021-03-21 03:41:55.698556+03
31	api	0026_auto_20210311_1948	2021-03-21 03:41:55.728475+03
32	api	0027_auto_20210311_2014	2021-03-21 03:41:55.982411+03
33	api	0028_auto_20210312_1228	2021-03-21 03:41:56.023157+03
34	api	0029_auto_20210312_1943	2021-03-21 03:41:56.105063+03
35	api	0030_auto_20210320_0108	2021-03-21 03:41:56.178309+03
36	api	0031_auto_20210321_0017	2021-03-21 03:41:56.247078+03
37	api	0032_auto_20210321_0046	2021-03-21 03:41:56.294703+03
38	contenttypes	0002_remove_content_type_name	2021-03-21 03:41:56.356561+03
39	auth	0002_alter_permission_name_max_length	2021-03-21 03:41:56.372635+03
40	auth	0003_alter_user_email_max_length	2021-03-21 03:41:56.3995+03
41	auth	0004_alter_user_username_opts	2021-03-21 03:41:56.429863+03
42	auth	0005_alter_user_last_login_null	2021-03-21 03:41:56.454272+03
43	auth	0006_require_contenttypes_0002	2021-03-21 03:41:56.462236+03
44	auth	0007_alter_validators_add_error_messages	2021-03-21 03:41:56.484116+03
45	auth	0008_alter_user_username_max_length	2021-03-21 03:41:56.518177+03
46	auth	0009_alter_user_last_name_max_length	2021-03-21 03:41:56.544405+03
47	auth	0010_alter_group_name_max_length	2021-03-21 03:41:56.572441+03
48	auth	0011_update_proxy_permissions	2021-03-21 03:41:56.606421+03
49	sessions	0001_initial	2021-03-21 03:41:56.630494+03
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8ohirdh5ehp03162ngedo3vjchsn8bvj	YmMxNGM1MDk1MjdiYjFkMjUzMGI4MTM1MmI5NjhjZWE3MDI4ZjdjMjp7InVzZXJfc2Vzc2lvbiI6MSwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjBmZWU2NTc2OTMyNjRhYjg5NjZjODQyZjkyZmU1MDkzYWE1NjIyOGIifQ==	2021-04-04 04:03:33.722004+03
hfumfcnbx9tezqg00qu2ahsh9obfvboh	NmVjY2RkZjFhODhkMmY4ODc5YzIyMGM2ZWRmZDFjNDU0NGY0ZmZiNjp7InVzZXJfc2Vzc2lvbiI6M30=	2021-04-04 20:38:20.422492+03
g83udie199cz61s545rmgbrw2q9vgpbb	MmI2Njc5OTg0NDM4NGQ5YjYzMjAyZjI5YWUyZTNkZWJiNTFlMDU0Zjp7InVzZXJfc2Vzc2lvbiI6NywiX2F1dGhfdXNlcl9pZCI6IjIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjUzODJjMDNhOWZhMzg0MWEwNjRhYjkxNjc4NDgwNWQyZTEyNWZiMDEifQ==	2021-04-04 21:43:00.628374+03
hhxqs27565o3i3aec5c34jkz79cwn1cq	NDQ0ODcxMGQ0YmRhOGU5NWM1YmQzMGJkMjIyZmMzYWQwNjM2M2RkODp7InVzZXJfc2Vzc2lvbiI6OH0=	2021-04-04 21:43:55.31545+03
ivqif5zrt872dqf39mujv1r27oncnzda	NzIzOWZiOGExNTdkOTQyMWQ1MjNiZjU2YjdiZjkwNjU2YjhkZDEwZTp7InVzZXJfc2Vzc2lvbiI6OX0=	2021-04-04 22:45:00.24145+03
6eor5omrvwf61cuh6w03zh5aqee2uglk	MzcxY2RlMzRhOTliNDdlNzI5MjU4NmIzNjAyMzM2ZTA3NjQ4YTkwODp7InVzZXJfc2Vzc2lvbiI6MTB9	2021-04-04 23:26:37.010722+03
jh4yeddeo78z8wf96yw36w679o74mny3	ZTc1MThlZTM3YWQ5MzcwYmIzNjhlNjdmZTg0NzJmZmQzMWM1OTQwZDp7InVzZXJfc2Vzc2lvbiI6MTF9	2021-04-04 23:30:55.165541+03
\.


--
-- Name: api_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_answer_id_seq', 18, true);


--
-- Name: api_question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_answers_id_seq', 20, true);


--
-- Name: api_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_question_id_seq', 8, true);


--
-- Name: api_survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_id_seq', 3, true);


--
-- Name: api_survey_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_survey_questions_id_seq', 8, true);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_user_id_seq', 11, true);


--
-- Name: api_useranswer_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_useranswer_answer_id_seq', 17, true);


--
-- Name: api_useranswer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_useranswer_id_seq', 14, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 26, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 49, true);


--
-- Name: api_answer api_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_answer
    ADD CONSTRAINT api_answer_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_pkey PRIMARY KEY (id);


--
-- Name: api_question_answers api_question_answers_question_id_answer_id_cc7ec79d_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_answer_id_cc7ec79d_uniq UNIQUE (question_id, answer_id);


--
-- Name: api_question api_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question
    ADD CONSTRAINT api_question_pkey PRIMARY KEY (id);


--
-- Name: api_survey api_survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey
    ADD CONSTRAINT api_survey_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_pkey PRIMARY KEY (id);


--
-- Name: api_survey_questions api_survey_questions_survey_id_question_id_94640fc2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_question_id_94640fc2_uniq UNIQUE (survey_id, question_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_pkey PRIMARY KEY (id);


--
-- Name: api_useranswer_answer api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_useranswer_id_answer_id_49ea029e_uniq UNIQUE (useranswer_id, answer_id);


--
-- Name: api_useranswer api_useranswer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_question_answers_answer_id_e042d42d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_question_answers_answer_id_e042d42d ON public.api_question_answers USING btree (answer_id);


--
-- Name: api_question_answers_question_id_c6a78bf4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_question_answers_question_id_c6a78bf4 ON public.api_question_answers USING btree (question_id);


--
-- Name: api_survey_date_end_4977d1cd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_date_end_4977d1cd ON public.api_survey USING btree (date_end);


--
-- Name: api_survey_date_start_7b596edf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_date_start_7b596edf ON public.api_survey USING btree (date_start);


--
-- Name: api_survey_questions_question_id_1beb7d3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_questions_question_id_1beb7d3b ON public.api_survey_questions USING btree (question_id);


--
-- Name: api_survey_questions_survey_id_bd41f0c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_survey_questions_survey_id_bd41f0c5 ON public.api_survey_questions USING btree (survey_id);


--
-- Name: api_useranswer_answer_answer_id_4dfdce7a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_answer_answer_id_4dfdce7a ON public.api_useranswer_answer USING btree (answer_id);


--
-- Name: api_useranswer_answer_useranswer_id_217efb29; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_answer_useranswer_id_217efb29 ON public.api_useranswer_answer USING btree (useranswer_id);


--
-- Name: api_useranswer_question_id_1b9aaa53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_question_id_1b9aaa53 ON public.api_useranswer USING btree (question_id);


--
-- Name: api_useranswer_survey_id_09e0aac4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_survey_id_09e0aac4 ON public.api_useranswer USING btree (survey_id);


--
-- Name: api_useranswer_user_id_a7a24a0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_useranswer_user_id_a7a24a0d ON public.api_useranswer USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_question_answers api_question_answers_answer_id_e042d42d_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_answer_id_e042d42d_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_question_answers api_question_answers_question_id_c6a78bf4_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_question_answers
    ADD CONSTRAINT api_question_answers_question_id_c6a78bf4_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_question_id_1beb7d3b_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_question_id_1beb7d3b_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_survey_questions api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_survey_questions
    ADD CONSTRAINT api_survey_questions_survey_id_bd41f0c5_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answe_useranswer_id_217efb29_fk_api_usera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answe_useranswer_id_217efb29_fk_api_usera FOREIGN KEY (useranswer_id) REFERENCES public.api_useranswer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer_answer api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer_answer
    ADD CONSTRAINT api_useranswer_answer_answer_id_4dfdce7a_fk_api_answer_id FOREIGN KEY (answer_id) REFERENCES public.api_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_question_id_1b9aaa53_fk_api_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_question_id_1b9aaa53_fk_api_question_id FOREIGN KEY (question_id) REFERENCES public.api_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_survey_id_09e0aac4_fk_api_survey_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_survey_id_09e0aac4_fk_api_survey_id FOREIGN KEY (survey_id) REFERENCES public.api_survey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_useranswer api_useranswer_user_id_a7a24a0d_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_useranswer
    ADD CONSTRAINT api_useranswer_user_id_a7a24a0d_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

