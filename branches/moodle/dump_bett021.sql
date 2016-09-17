--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: character; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE "character" (
    entity text NOT NULL,
    string text,
    exercise text NOT NULL
);


ALTER TABLE public."character" OWNER TO drbean;

--
-- Name: exercise; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE exercise (
    type character varying(15) NOT NULL,
    genre character varying(15) NOT NULL,
    id character varying(15) NOT NULL,
    description character varying(50) NOT NULL
);


ALTER TABLE public.exercise OWNER TO drbean;

--
-- Name: genre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE genre (
    id integer NOT NULL,
    value text
);


ALTER TABLE public.genre OWNER TO drbean;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: drbean
--

CREATE SEQUENCE genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_id_seq OWNER TO drbean;

--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drbean
--

ALTER SEQUENCE genre_id_seq OWNED BY genre.id;


--
-- Name: league; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE league (
    id text NOT NULL,
    name text,
    field text,
    genre text
);


ALTER TABLE public.league OWNER TO drbean;

--
-- Name: leaguegenre; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE leaguegenre (
    league text NOT NULL,
    genre smallint NOT NULL
);


ALTER TABLE public.leaguegenre OWNER TO drbean;

--
-- Name: member; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE member (
    league text NOT NULL,
    player text NOT NULL
);


ALTER TABLE public.member OWNER TO drbean;

--
-- Name: play; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE play (
    question text NOT NULL,
    answer text,
    player text NOT NULL,
    league text NOT NULL,
    course text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer,
    exercise text NOT NULL
);


ALTER TABLE public.play OWNER TO drbean;

--
-- Name: player; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE player (
    id text NOT NULL,
    name text,
    password text
);


ALTER TABLE public.player OWNER TO drbean;

--
-- Name: question; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE question (
    player text NOT NULL,
    lexed text NOT NULL,
    league text NOT NULL,
    exercise text NOT NULL,
    course text NOT NULL,
    quoted text NOT NULL,
    grammatical boolean NOT NULL
);


ALTER TABLE public.question OWNER TO drbean;

--
-- Name: role; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    role text
);


ALTER TABLE public.role OWNER TO drbean;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: drbean
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO drbean;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: drbean
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: rolebearer; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE rolebearer (
    player text NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public.rolebearer OWNER TO drbean;

--
-- Name: s; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE s (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.s OWNER TO drbean;

--
-- Name: session; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE session (
    id character(72) NOT NULL,
    session_data character varying(7500),
    expires integer
);


ALTER TABLE public.session OWNER TO drbean;

--
-- Name: tag; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE tag (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.tag OWNER TO drbean;

--
-- Name: try; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE try (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer NOT NULL,
    quoted text,
    answer text
);


ALTER TABLE public.try OWNER TO drbean;

--
-- Name: wh; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE wh (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.wh OWNER TO drbean;

--
-- Name: word; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE word (
    exercise text NOT NULL,
    string text
);


ALTER TABLE public.word OWNER TO drbean;

--
-- Name: yn; Type: TABLE; Schema: public; Owner: drbean; Tablespace: 
--

CREATE TABLE yn (
    exercise text NOT NULL,
    player text NOT NULL,
    league text NOT NULL,
    try integer,
    score integer,
    questionchance integer,
    answerchance integer
);


ALTER TABLE public.yn OWNER TO drbean;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY genre ALTER COLUMN id SET DEFAULT nextval('genre_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY "character" (entity, string, exercise) FROM stdin;
P	the_color_pink	intros
E	applied_foreign_languages	intros
B	dr_bean	intros
Y		intros
Z	music	intros
H	minghsin_university	intros
Q	mi_mi	intros
I	hello_kitty	intros
R	rena	intros
L	avril_lavigne	intros
U	america	intros
P	the_color_pink	q-and-a
E	applied_foreign_languages	q-and-a
B	dr_bean	q-and-a
Y		q-and-a
Z	music	q-and-a
H	minghsin_university	q-and-a
Q	mi_mi	q-and-a
I	hello_kitty	q-and-a
R	rena	q-and-a
L	avril_lavigne	q-and-a
U	america	q-and-a
RI	hello_kitty	q-and-a
JM	Jeff's mother	q-and-a
JS	Jeff's 2 siblings	q-and-a
JN	April 30th, 1994	q-and-a
RU	america	q-and-a
RZ	music	q-and-a
RP	the_color_pink	q-and-a
JZ		q-and-a
JB	basketball	q-and-a
JG	Jeff's grandmother	q-and-a
JF	Jeff's father	q-and-a
JH	Huang Che-Yu	q-and-a
JT	Taoyuan	q-and-a
RL	avril_lavigne	q-and-a
RQ	mi_mi	q-and-a
J	jeff	q-and-a
X	hsinchu	q-and-a
AT	travel	q-and-a
JE	exercise	q-and-a
AD	drawing	q-and-a
AZ		q-and-a
AB	Alex's brother	q-and-a
AJ	Alex's job	q-and-a
AS	Alex's sister	q-and-a
AH	Alex's hobbies	q-and-a
A	alex	q-and-a
AR	reading	q-and-a
JY	1994	q-and-a
CQ	k	q-and-a
CR	reading	q-and-a
CD	Cindy's dad	q-and-a
RK	hello_kitty	q-and-a
CP	playing_the_piano	q-and-a
CZ		q-and-a
AL	sleeping	q-and-a
CJ	jiayi	q-and-a
CT	24	q-and-a
CM	Cindy's mom	q-and-a
CS	Cindy's sister	q-and-a
CL	listening_to_music	q-and-a
VZ		q-and-a-2
JM	Jeff's mother	q-and-a-2
VM	Vicky's mother	q-and-a-2
AT	travel	q-and-a-2
JE	exercise	q-and-a-2
E	applied_foreign_languages	q-and-a-2
JN	April 30th, 1994	q-and-a-2
RP	the_color_pink	q-and-a-2
VW	weekends	q-and-a-2
AD	drawing	q-and-a-2
JG	Jeff's grandmother	q-and-a-2
J	jeff	q-and-a-2
RK	hello_kitty	q-and-a-2
JF	Jeff's father	q-and-a-2
B	dr_bean	q-and-a-2
H	minghsin_university	q-and-a-2
CP	playing_the_piano	q-and-a-2
VG	shopping	q-and-a-2
VS	Vicky's first sister	q-and-a-2
JH	Huang Che-Yu	q-and-a-2
RL	avril_lavigne	q-and-a-2
AB	Alex's brother	q-and-a-2
RQ	mi_mi	q-and-a-2
U	listening_to_music	q-and-a-2
AL	sleeping	q-and-a-2
VF	Vicky's father	q-and-a-2
V	vicky	q-and-a-2
JS	Jeff's 2 siblings	q-and-a-2
CJ	jiayi	q-and-a-2
VD	drug_store	q-and-a-2
RU	america	q-and-a-2
AJ	Alex's job	q-and-a-2
AS	Alex's sister	q-and-a-2
C	cindy	q-and-a-2
JB	basketball	q-and-a-2
A	alex	q-and-a-2
AH	Alex's hobbies	q-and-a-2
CM	Cindy's mom	q-and-a-2
VE	exercising	q-and-a-2
X	hsinchu	q-and-a-2
AR	reading	q-and-a-2
VT	Vicky's second sister	q-and-a-2
CS	Cindy's sister	q-and-a-2
CF	Cindy's dad	q-and-a-2
JY	1994	q-and-a-2
R	rena	q-and-a-2
JT	taoyuan	q-and-a-2
SC	hsiao_ching-teng	q-and-a-3
S	shane	q-and-a-3
NI	swimming	q-and-a-3
MS	the_song,_memory	q-and-a-3
N	neil	q-and-a-3
K	kelly	q-and-a-3
KF	Kelly's father	q-and-a-3
E	applied_foreign_languages	q-and-a-3
DK	making_friends	q-and-a-3
SJ	jeremy_lin	q-and-a-3
MM	Mindy's mother	q-and-a-3
DM	Dave's mother	q-and-a-3
SS	Shane's first sister	q-and-a-3
NA	the_military	q-and-a-3
SH	hukou	q-and-a-3
NM	Neil's mother	q-and-a-3
DB	Dave's brother	q-and-a-3
MB	Mindy's younger brother	q-and-a-3
KM	Kelly's mother	q-and-a-3
MP	pizza	q-and-a-3
MF	Mindy's father	q-and-a-3
B	dr_bean	q-and-a-3
H	minghsin_university	q-and-a-3
NJ	jogging	q-and-a-3
KD	a_dietitian	q-and-a-3
SF	Shane's father	q-and-a-3
D	dave	q-and-a-3
DZ		q-and-a-3
I	reading	q-and-a-3
U	listening_to_music	q-and-a-3
F	japanese	q-and-a-3
ST	Shane's second sister	q-and-a-3
KS	Kelly's sister	q-and-a-3
NS	Neil's first sister	q-and-a-3
KL	lextar	q-and-a-3
NO	non-commissioned_officer	q-and-a-3
M	mindy	q-and-a-3
NB	Neil's brother	q-and-a-3
MD	the_tv_program_discovery	q-and-a-3
NN	nantou	q-and-a-3
L	basketball	q-and-a-3
DF	Dave's father	q-and-a-3
NT	Neil's second sister	q-and-a-3
X	hsinchu	q-and-a-3
MG	going_to_the_movies	q-and-a-3
KT	watching_tv	q-and-a-3
P	playing_the_piano	q-and-a-3
MI	a_japanese_interpreter	q-and-a-3
SG	gemitek	q-and-a-3
SN	singing	q-and-a-3
SM	Shane's mother	q-and-a-3
NF	Neil's father	q-and-a-3
Z		q-and-a-3
S	shane	q-and-a-exam
JM	Jeff's mother	q-and-a-exam
K	kelly	q-and-a-exam
AT	travel	q-and-a-exam
JE	exercise	q-and-a-exam
E	applied_foreign_languages	q-and-a-exam
JN	April 30th, 1994	q-and-a-exam
DK	making_friends	q-and-a-exam
RP	the_color_pink	q-and-a-exam
VW	weekends	q-and-a-exam
SS	Shane's first sister	q-and-a-exam
NA	the_military	q-and-a-exam
SH	hukou	q-and-a-exam
NM	Neil's mother	q-and-a-exam
JG	Jeff's grandmother	q-and-a-exam
J	jeff	q-and-a-exam
KM	Kelly's mother	q-and-a-exam
MP	pizza	q-and-a-exam
JF	Jeff's father	q-and-a-exam
MF	Mindy's father	q-and-a-exam
NJ	jogging	q-and-a-exam
SF	Shane's father	q-and-a-exam
JH	Huang Che-Yu	q-and-a-exam
D	dave	q-and-a-exam
AB	Alex's brother	q-and-a-exam
RQ	mi_mi	q-and-a-exam
ST	Shane's second sister	q-and-a-exam
AL	sleeping	q-and-a-exam
KS	Kelly's sister	q-and-a-exam
NS	Neil's first sister	q-and-a-exam
VF	Vicky's father	q-and-a-exam
KL	lextar	q-and-a-exam
CJ	jiayi	q-and-a-exam
VD	drug_store	q-and-a-exam
NO	non-commissioned_officer	q-and-a-exam
AJ	Alex's job	q-and-a-exam
M	mindy	q-and-a-exam
C	cindy	q-and-a-exam
MD	the_tv_program_discovery	q-and-a-exam
NB	Neil's brother	q-and-a-exam
AH	Alex's hobbies	q-and-a-exam
NT	Neil's second sister	q-and-a-exam
CM	Cindy's mom	q-and-a-exam
X	hsinchu	q-and-a-exam
MG	going_to_the_movies	q-and-a-exam
KT	watching_tv	q-and-a-exam
P	playing_the_piano	q-and-a-exam
VT	Vicky's second sister	q-and-a-exam
CF	Cindy's father	q-and-a-exam
SM	Shane's mother	q-and-a-exam
JY	1994	q-and-a-exam
SC	hsiao_ching-teng	q-and-a-exam
NI	swimming	q-and-a-exam
N	neil	q-and-a-exam
MS	the_song,_memory	q-and-a-exam
VM	Vicky's mother	q-and-a-exam
KF	Kelly's father	q-and-a-exam
Z		q-and-a-exam
SJ	jeremy_lin	q-and-a-exam
MM	Mindy's mother	q-and-a-exam
DM	Dave's mother	q-and-a-exam
AD	drawing	q-and-a-exam
DB	Dave's brother	q-and-a-exam
RK	hello_kitty	q-and-a-exam
W	taiwan	q-and-a-exam
MB	Mindy's younger brother	q-and-a-exam
B	dr_bean	q-and-a-exam
H	minghsin_university	q-and-a-exam
VG	shopping	q-and-a-exam
KD	a_dietitian	q-and-a-exam
VS	Vicky's first sister	q-and-a-exam
RL	avril_lavigne	q-and-a-exam
I	reading	q-and-a-exam
U	listening_to_music	q-and-a-exam
F	japanese	q-and-a-exam
V	vicky	q-and-a-exam
JS	Jeff's 2 siblings	q-and-a-exam
RU	america	q-and-a-exam
AS	Alex's sister	q-and-a-exam
JB	basketball	q-and-a-exam
NN	nantou	q-and-a-exam
DF	Dave's father	q-and-a-exam
A	alex	q-and-a-exam
VE	exercising	q-and-a-exam
MI	a_japanese_interpreter	q-and-a-exam
SG	gemitek	q-and-a-exam
CS	Cindy's sister	q-and-a-exam
SN	singing	q-and-a-exam
NF	Neil's father	q-and-a-exam
JT	taoyuan	q-and-a-exam
R	rena	q-and-a-exam
\.


--
-- Data for Name: exercise; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY exercise (type, genre, id, description) FROM stdin;
Non-competitive	business	candidate	Barbara, Tadeusz, Eva, Dr Bean
Non-competitive	conversation	dickson	testing GF
\.


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY genre (id, value) FROM stdin;
1	conversation
2	business
3	friends
4	intercultural
5	speaking
6	pop
7	media
8	multimedia
\.


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drbean
--

SELECT pg_catalog.setval('genre_id_seq', 1, false);


--
-- Data for Name: league; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY league (id, name, field, genre) FROM stdin;
GL00006	日語文共同學制虛擬班二甲	中級英文聽說訓練	\N
GL00030	日語文共同學制虛擬班二甲	中級英文聽說訓練	\N
FLA0006	夜應外大學四甲	新聞英語	\N
FLA0007	夜應外大學四甲	英語演說	\N
AFN2N0	NAF021_四技外二甲_選修_2	初級商用英文	\N
AFN300	NAF031_四技外三甲_必修_2	高階英語聽力	\N
AFN3Y0	NAF031_四技外三甲_選修_2	電腦多媒體語言教學	call
\.


--
-- Data for Name: leaguegenre; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY leaguegenre (league, genre) FROM stdin;
GL00006	1
GL00030	1
FLA0006	7
FLA0007	5
AFN2N0	2
AFN3Y0	8
AFN300	1
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY member (league, player) FROM stdin;
GL00006	U0018027
GL00006	U0042050
GL00006	U0017024
GL00006	U0043033
GL00006	U0016030
GL00006	U0142042
GL00006	K220155482
GL00006	U9911237
GL00006	U0016051
GL00006	U0042041
GL00006	M0210002
GL00006	U0043001
GL00006	U0023121
GL00006	U0222133
GL00006	U0042039
GL00006	U0142036
GL00006	U0031213
GL00006	U9923120
GL00006	U0042031
GL00006	U9917017
GL00006	U9911242
GL00006	U0018046
GL00006	U9943007
GL00006	U0122002
GL00006	U0222228
GL00006	U0042012
GL00006	U0043004
GL00030	U0131020
GL00030	U0131034
GL00030	U0214036
GL00030	U9933028
GL00030	U0114037
GL00030	V9941010
GL00030	U0123013
GL00030	U0010040
GL00030	U0114045
GL00030	U9923150
FLA0006	V9941015
FLA0006	V9941027
FLA0006	V9941045
FLA0006	V9941060
FLA0006	V9941007
FLA0006	V9941067
FLA0006	V9741064
FLA0006	V9941022
FLA0006	V9941023
FLA0006	V9941001
FLA0006	V9941012
FLA0006	V9941073
FLA0006	V9941040
FLA0006	V9841010
FLA0006	V9841025
FLA0006	V9941050
FLA0006	V9941011
FLA0006	V9941059
FLA0006	V9941047
FLA0006	V9841028
FLA0006	V9741044
FLA0006	V9941037
FLA0006	V9841049
FLA0006	T9823041
FLA0006	V9941075
FLA0006	V9941013
FLA0006	V9941029
FLA0006	V9941026
FLA0006	V9941049
FLA0006	V9841042
FLA0007	V9941015
FLA0007	V9941027
FLA0007	V9941014
FLA0007	V9941007
FLA0007	V9941025
FLA0007	V9941031
FLA0007	V9941023
FLA0007	V9941022
FLA0007	V9841046
FLA0007	V9941001
FLA0007	V9941012
FLA0007	V9841063
FLA0007	V9841025
FLA0007	V9941011
FLA0007	V9941010
FLA0007	V9741022
FLA0007	V9916050
FLA0007	V9941013
FLA0007	V9941005
FLA0007	V9941029
FLA0007	V9941026
FLA0007	V9841042
AFN2N0	N01200024
AFN2N0	N01200021
AFN2N0	N99080062
AFN2N0	N01200009
AFN2N0	N01200018
AFN2N0	N01200048
AFN2N0	N01200025
AFN2N0	N02202112
AFN2N0	N01200006
AFN2N0	N01200035
AFN2N0	N02202106
AFN2N0	N01200045
AFN2N0	N01200038
AFN2N0	N02202114
AFN2N0	N01200016
AFN2N0	N01200058
AFN2N0	N01200044
AFN2N0	N02202107
AFN2N0	N01200041
AFN2N0	N01200002
AFN2N0	N02202104
AFN2N0	N96080091
AFN2N0	N02202101
AFN2N0	N01200042
AFN2N0	N99080092
AFN2N0	N01200029
AFN2N0	N01200008
AFN2N0	N97200035
AFN2N0	N01200051
AFN2N0	N02202113
AFN2N0	N01200033
AFN2N0	N01200015
AFN2N0	N02202111
AFN2N0	N97120058
AFN2N0	N97200033
AFN2N0	N01200030
AFN2N0	N00082007
AFN2N0	N01200023
AFN2N0	N01200049
AFN2N0	N02202110
AFN2N0	N01200056
AFN2N0	N01200026
AFN2N0	N01200014
AFN2N0	N99080075
AFN2N0	N01200020
AFN2N0	N97200045
AFN2N0	N01200046
AFN2N0	N01200028
AFN2N0	N01200010
AFN3Y0	N00200042
AFN3Y0	N01202001
AFN3Y0	N00200025
AFN3Y0	N00200044
AFN3Y0	N96200030
AFN3Y0	N00200054
AFN3Y0	N00200017
AFN3Y0	N01202004
AFN3Y0	N00200010
AFN3Y0	N00200055
AFN3Y0	N00200037
AFN3Y0	N00200030
AFN3Y0	N00200056
AFN3Y0	N01203003
AFN3Y0	N00200009
AFN3Y0	N00200001
AFN300	N00200034
AFN300	N00200031
AFN300	N00200048
AFN300	N00200042
AFN300	N00200008
AFN300	N00200013
AFN300	N02203101
AFN300	N01202104
AFN300	N00202103
AFN300	N00200036
AFN300	N01202001
AFN300	N00200025
AFN300	N00200044
AFN300	N00200054
AFN300	N00200043
AFN300	N00200007
AFN300	N99030025
AFN300	N00200047
AFN300	N98200037
AFN300	N00200029
AFN300	N00200017
AFN300	N99100009
AFN300	N00200032
AFN300	N00200006
AFN300	N01202004
AFN300	N00200010
AFN300	N00200055
AFN300	N02203102
AFN300	N00200058
AFN300	N00200037
AFN300	N00200003
AFN300	N01202101
AFN300	N00200051
AFN300	N00200045
AFN300	N97200033
AFN300	N98200021
AFN300	N00200030
AFN300	N00200014
AFN300	N01202105
AFN300	N01202103
AFN300	N00200056
AFN300	N00200009
AFN300	N00200022
AFN300	N00200015
AFN300	N00200001
AFN300	N00200027
AFN300	N00200018
AFN300	N01202002
AFN300	N99030033
AFN300	N01202003
AFN300	N00120056
AFN3Y0	N00200036
AFN3Y0	N00200034
AFN3Y0	N00200008
AFN3Y0	N00200051
AFN3Y0	N00200043
AFN3Y0	N00200029
AFN3Y0	N00200031
\.


--
-- Data for Name: play; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY play (question, answer, player, league, course, try, score, questionchance, answerchance, exercise) FROM stdin;
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY player (id, name, password) FROM stdin;
N99080062	彭聖仁	sheng
N00200008	王雅慧	ya
N01200025	劉昱宜	yu
N01200038	張煥翊	huan
U0023121	洪珮其	pei
N01200058	張敏鈺	min
N01200044	黃小芳	xiao
N02202107	劉怡甄	yi
N00200025	陳宣貝	xuan
N00200044	邱欣蘭	xin
N01200041	蔡佩燕	pei
N01200002	范芝喬	zhi
N00200054	呂恩華	en
N99030025	管得成	de
V9941005	徐?焜	?
V9941026	張真黛	zhen
N97200035	張志嘉	zhi
N00200055	蔡秉倉	bing
N00200058	郭姵妤	pei
U0016030	蔡欣儒	xin
N01202101	黃秀娟	xiu
N00200051	戴睿萱	rui
N02202111	董翌亦	yi
K220155482	林沂慧	yi
U0214036	林泓毅	hong
N01200030	戴??	?
U9933028	林建禹	jian
U9911237	湯光煜	guang
N00200014	羅莉玲	li
N00200030	徐頌華	song
N01202105	鄭瑞昇	rui
N01200023	詹庭羽	ting
N02202110	鄭煒諺	wei
U9917017	楊聖	sheng
V9741044	張馨卿	xin
N97200045	劉宇凡	yu
V9916050	黎彥廷	yan
N01202002	彭雅楹	ya
N01200046	江佳璇	jia
U0122002	陳蓉萱	rong
U0131034	謝清?	qing
N00200048	葉俞萱	yu
N00200042	馮小蓉	xiao
U0043033	陳佩暄	pei
N01200018	王楚寒	chu
V9741064	白芳瑜	fang
N02203101	呂旻汶	min
N01200006	王詩云	shi
U0042041	辛昆星	kun
N01202001	蕭巧薇	qiao
U0042039	陳靖宜	jing
N96200030	王安妤	an
U0010040	卓羿廷	yi
U0042031	陳忠偉	jung
U0018046	楊佳宜	jia
V9841042	李家安	jia
N00200006	江麗玲	li
N01200008	徐瑋萱	wei
V9941015	涂為智	wei
N01200051	林秀華	xiu
N02202113	黃哲禹	zhe
V9941014	謝東霖	dong
U0042050	向垣蓉	yuan
U0017024	王志睿	zhi
V9941060	吳李龍	li
N97120058	羅芳鋙	fang
V9841046	胡佳玟	jia
V9941001	吳仰婷	yang
N00200056	徐敏華	min
V9941012	?翔義	xiang
V9941073	楊千慧	qian
N00200009	劉玉慧	yu
U0142036	楊苑羚	yuan
U0031213	吳肇茗	zhao
U0123013	沈皓鈞	hao
N00200022	胡文瑄	wen
N01200020	凾登舜	deng
N99080075	劉晨宇	chen
N00200018	曾孟妍	meng
T9823041	李秉霖	bing
V9941037	劉紋君	wen
N00200034	魏雪如	xue
U0131020	張馨鎂	xin
N00200031	嚴佳馨	jia
N01200021	蔡雨樵	yu
N01200024	李姿嫺	zi
V9941027	楊琬茹	wan
V9941045	黃宇襄	yu
V9941067	劉好英	hao
V9941025	陳乙瑄	yi
N01200048	陳怡真	yi
N01202104	詹益昌	yi
V9941031	洪欣慈	xin
N02202112	方志嘉	zhi
N00202103	張嘉晏	jia
U0016051	胡亞微	ya
N00200036	彭成賓	cheng
N02202106	劉芳瑀	fang
U0043001	張雅芬	ya
V9841063	湯浩軍	hao
V9841010	彭浩瑀	hao
N01200016	許依萍	yi
N02202114	鄭巧柔	qiao
V9741022	羅尹妮	yin
N02202104	鄭宇婷	yu
N02202101	陳文億	wen
N01200042	蔡承翰	cheng
V9941075	林柏如	bai
N98200037	林雯柔	wen
N00200029	魏羽娸	yu
U0042012	陳紹順	shao
N99100009	張君鈺	jun
N00200032	曾詩穎	shi
N01200029	黃俞嘉	yu
N00200003	林宗賢	zong
N00200037	林昱瑤	yu
N00200045	余岱蓉	dai
V9941023	彭姿菁	zi
V9941022	陳俞靜	yu
N97200033	鄧茜久	ge
N98200021	鐘元君	yuan
N00082007	陳翰境	han
M0210002	褚春美	chun
N01200056	吳聲均	sheng
N01200026	葉淑玲	shu
N01200014	范育芳	yu
U0114045	張博堯	bo
N00200015	劉啟芬	qi
V9841028	彭怡靜	yi
U9911242	陳柏合	bo
N99030033	郭駿緯	jun
U0222228	林立婷	li
N01202003	黃冠潔	guan
N00120056	李桂英	guei
V9941049	詹春英	chun
N01200010	凾紫渝	zi
U0018027	林珈羽	jia
193001	DrBean	ok
V9941007	朱文章	wen
N01200009	徐禹婷	yu
N00200013	彭為騰	wei
N01200035	徐詩茹	shi
N01200045	江進慧	jin
V9941040	莊翌蝶	yi
V9841025	葉瓊惠	qiong
V9941050	詹春華	chun
V9941010	湯明勳	ming
V9941047	徐婉綾	wan
N96080091	賴正傑	zheng
N00200043	劉佩欣	pei
N00200007	鄒瓊瑩	qiong
V9841049	駱佳帷	jia
N00200047	陳俊生	jun
V9941013	洪詠舜	yong
V9941029	張雅婷	ya
N00200017	潘信安	xin
U0043004	陳嬿羽	yan
N99080092	李郁芬	yu
N01202004	林宜儒	yi
N00200010	陳映如	ying
N02203102	溫嘉翔	jia
N01200033	蕭至祐	zhi
U0142042	黃理偉	li
N01200015	王子銘	zi
N01202103	吳振暐	zhen
U0114037	陳冠廷	guan
N01203003	吳紫彤	zi
U0222133	洪崇沼	chung
N01200049	陳怡芳	yi
V9941011	鍾興科	xing
V9941059	黃于真	yu
U9923120	吳冠甫	guan
U9923150	王秉亮	bing
N00200001	張芯瑀	xin
N00200027	周彥伶	yan
U9943007	林芳瑩	fang
N01200028	陳俐婷	li
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY question (player, lexed, league, exercise, course, quoted, grammatical) FROM stdin;
N01200014	Barbara is ambitious	AFN2N0	candidate	S	Barbara is ambitious	f
N01200014	Barbara is an ambitious person	AFN2N0	candidate	S	Barbara is an ambitious person	f
N01200014	Barbara like to win	AFN2N0	candidate	S	Barbara like to win	f
N01200014	Eva think everyone in the team should help each other	AFN2N0	candidate	S	Eva think everyone in the team should help each other	f
N01200014	Eva had a lot of sales experience.	AFN2N0	candidate	S	Eva had a lot of sales experience.	f
N01200014	Eva don't like telling then what to do	AFN2N0	candidate	S	Eva don't like telling then what to do	f
N97120058	Eva is not competitive.	AFN2N0	candidate	S	Eva is not competitive.	f
N97120058	Barbara was outgoing. 	AFN2N0	candidate	S	Barbara was outgoing. 	f
N97120058	Eva is poor person.	AFN2N0	candidate	S	Eva is poor person.	f
N01200056	Dr Bean know Eva's job.	AFN2N0	candidate	S	Dr Bean know Eva's job.	f
N01200056	Eva choose Barbara.	AFN2N0	candidate	S	Eva choose Barbara.	f
N01200056	Dr Bean is not a director	AFN2N0	candidate	S	Dr Bean is not a director	f
B00200054	Eva must go.	AFN2N0	candidate	S	Eva must go.	f
B00200054	How does Eva feel working in the team?	AFN2N0	candidate	S	How does Eva feel working in the team?	f
N01200016	F	AFN2N0	candidate	S	F	f
N01200016	Barbara is appeared  aggressive	AFN2N0	candidate	S	Barbara is appeared  aggressive	f
N01200044	Barbara is ambitious.	AFN2N0	candidate	S	Barbara is ambitious.	f
N01200044	Barbara is competitive.	AFN2N0	candidate	S	Barbara is competitive.	f
N01200044	Barbara's aim is to want to win.	AFN2N0	candidate	S	Barbara's aim is to want to win.	f
N01200044	Barbara is difficult to work with people.	AFN2N0	candidate	S	Barbara is difficult to work with people.	f
N01200044	Dr Bean did bad job.	AFN2N0	candidate	S	Dr Bean did bad job.	f
N01200044	Dr Bean was not sales experience.	AFN2N0	candidate	S	Dr Bean was not sales experience.	f
N01200044	Dr Bean was outgoing.	AFN2N0	candidate	S	Dr Bean was outgoing.	f
N01200044	How Dr Bean felt? Dr Bean did bad job.	AFN2N0	candidate	S	How Dr Bean felt? Dr Bean did bad job.	f
N01200044	How does eva do if she  get the job? Eva will improve sales team.	AFN2N0	candidate	S	How does eva do if she  get the job? Eva will improve sales team.	f
N01200044	Dr Bean had confident.	AFN2N0	candidate	S	Dr Bean had confident.	f
N01200044	Tadeusz had good jugement.	AFN2N0	candidate	S	Tadeusz had good jugement.	f
N01200024	does barbara polish	AFN2N0	candidate	S	does barbara polish	f
N01200024	Does barbara polish	AFN2N0	candidate	S	Does barbara polish	f
N02202112	Tadeusz want to do a good job for the company.	AFN2N0	candidate	S	Tadeusz want to do a good job for the company.	f
N02202112	Tadeusz had judgement.	AFN2N0	candidate	S	Tadeusz had judgement.	f
N02202101	Is Dr bean a confident and easygoing man?	AFN2N0	candidate	S	Is Dr bean a confident and easygoing man?	f
N02202112	Tadeusz had a judgement.	AFN2N0	candidate	S	Tadeusz had a judgement.	f
B00200054		AFN2N0	candidate	S		f
B00200054	Eva feels bad.	AFN2N0	candidate	S	Eva feels bad.	f
B00200054	Eva respects her English teacher.	AFN2N0	candidate	S	Eva respects her English teacher.	f
N02202112	Tadeusz has good judgement.	AFN2N0	candidate	S	Tadeusz has good judgement.	f
N02202112	Dr Bean was competitive.	AFN2N0	candidate	S	Dr Bean was competitive.	f
N02202101	Does Tadeusz graguate from college?	AFN2N0	candidate	S	Does Tadeusz graguate from college?	f
N02202101	does Tedeusz like to work with coworkers?	AFN2N0	candidate	S	does Tedeusz like to work with coworkers?	f
N01200058	Barbara likes to take risk a woman?	AFN2N0	candidate	S	Barbara likes to take risk a woman?	f
N01200058	I don't know what your mean	AFN2N0	candidate	S	I don't know what your mean	f
N01200058	•what they did. 	AFN2N0	candidate	S	•what they did. 	f
N01200058	Attempted is Barbara?	AFN2N0	candidate	S	Attempted is Barbara?	f
N01200058	Eva was fast.	AFN2N0	candidate	S	Eva was fast.	f
N02202104	Dr Bean's ambitious.	AFN2N0	candidate	S	Dr Bean's ambitious.	f
N02202104	Eva is ambitious.	AFN2N0	candidate	S	Eva is ambitious.	f
N01200021	Eva wanted to be patient	AFN2N0	candidate	S	Eva wanted to be patient	f
N02202101	Is it right Tedeusz think doing things should be patient and reliable? 	AFN2N0	candidate	S	Is it right Tedeusz think doing things should be patient and reliable? 	f
N01200021	Dr Bean was competitive	AFN2N0	candidate	S	Dr Bean was competitive	f
V9741064		FLA0006	candidate	S		f
N01200021	Barbara likes to take risk a woman? 	AFN2N0	candidate	S	Barbara likes to take risk a woman? 	f
N01200029	Barbara did not ambitious.	AFN2N0	candidate	S	Barbara did not ambitious.	f
N01200021	Eva was fast. 	AFN2N0	candidate	S	Eva was fast. 	f
N01200021	Eva wanted to improve the sales team	AFN2N0	candidate	S	Eva wanted to improve the sales team	f
N01200029	Tadeusz want to help for the company.	AFN2N0	candidate	S	Tadeusz want to help for the company.	f
N01200029	Tadeusz have good judgement.	AFN2N0	candidate	S	Tadeusz have good judgement.	f
N01200029	Tadeusz think he has the ability and experience to do this job.	AFN2N0	candidate	S	Tadeusz think he has the ability and experience to do this job.	f
N01200035	Eva likes to take a risk?	AFN2N0	candidate	S	Eva likes to take a risk?	f
N01200029	Eva have a lot of sales experience.	AFN2N0	candidate	S	Eva have a lot of sales experience.	f
N01200029	Eva is  a very fast learner.	AFN2N0	candidate	S	Eva is  a very fast learner.	f
N01200029	Dr Bean  tried very hard to motivate the sales team.	AFN2N0	candidate	S	Dr Bean  tried very hard to motivate the sales team.	f
N01200035	Do you know Eva was a director?	AFN2N0	candidate	S	Do you know Eva was a director?	f
N01200029	Dr Bean don't have any sales experience.	AFN2N0	candidate	S	Dr Bean don't have any sales experience.	f
N01200035	Dr Bean have successful life	AFN2N0	candidate	S	Dr Bean have successful life	f
N01200035	Tadeusz can help that people	AFN2N0	candidate	S	Tadeusz can help that people	f
N01200035	Barbara doesn't respect that man.	AFN2N0	candidate	S	Barbara doesn't respect that man.	f
N02202106	Barbara is difficult to work with people?	AFN2N0	candidate	S	Barbara is difficult to work with people?	f
N00082007	Eva is polish but the app crashed	AFN2N0	candidate	S	Eva is polish but the app crashed	f
N00082007	Eva was poor.	AFN2N0	candidate	S	Eva was poor.	f
N00082007	Eva is good.	AFN2N0	candidate	S	Eva is good.	f
N00082007	Eva is honest	AFN2N0	candidate	S	Eva is honest	f
N00082007	Eva is realistic	AFN2N0	candidate	S	Eva is realistic	f
N01200014	Barbara is a ambitious person	AFN2N0	candidate	S	Barbara is a ambitious person	f
N01200014	Barbara is an ambitious women	AFN2N0	candidate	S	Barbara is an ambitious women	f
N01200014	Tadeusz think they sould be rerlistic	AFN2N0	candidate	S	Tadeusz think they sould be rerlistic	f
N01200014	Tadeusz has good judgment	AFN2N0	candidate	S	Tadeusz has good judgment	f
N01200014	Eva is a very fast learner	AFN2N0	candidate	S	Eva is a very fast learner	f
N97120058	Dr Bean is adirector.	AFN2N0	candidate	S	Dr Bean is adirector.	f
N99080092	Eva is girl	AFN2N0	candidate	S	Eva is girl	f
N01200033	Dr Bean can choose the director.	AFN2N0	candidate	S	Dr Bean can choose the director.	f
N01200041	Barbara is an ambitious woman.	AFN2N0	candidate	S	Barbara is an ambitious woman.	f
N01200041	Barbara have confident.	AFN2N0	candidate	S	Barbara have confident.	f
N01200041	Tadeusz has the ability.	AFN2N0	candidate	S	Tadeusz has the ability.	f
N01200041	Tadeusz wants to do a good job for the company.	AFN2N0	candidate	S	Tadeusz wants to do a good job for the company.	f
N01200041	Barbara wants have the job.	AFN2N0	candidate	S	Barbara wants have the job.	f
N01200009	Tadeusz is a sales director.	AFN2N0	candidate	S	Tadeusz is a sales director.	f
N01200009	Tadeusz improve sales.	AFN2N0	candidate	S	Tadeusz improve sales.	f
N01200041	Dr Bean have sales experience	AFN2N0	candidate	S	Dr Bean have sales experience	f
N97120058	Dr Bean is fast.	AFN2N0	candidate	S	Dr Bean is fast.	f
N97120058	Tadeusz is fast learner.	AFN2N0	candidate	S	Tadeusz is fast learner.	f
N01200009	Barbara must help Eva.	AFN2N0	candidate	S	Barbara must help Eva.	f
N01200009	Eva become poor.	AFN2N0	candidate	S	Eva become poor.	f
N01200009	Eva lead sales team.	AFN2N0	candidate	S	Eva lead sales team.	f
N01200009	Tadeusz become successful director	AFN2N0	candidate	S	Tadeusz become successful director	f
N01200023	Barbara is an ambitious girl.	AFN2N0	candidate	S	Barbara is an ambitious girl.	f
N01200023	Barbara isn't ambitious.	AFN2N0	candidate	S	Barbara isn't ambitious.	f
N01200056	Tadeusz have a successful job.	AFN2N0	candidate	S	Tadeusz have a successful job.	f
N01200056	Tadeusz feel good.	AFN2N0	candidate	S	Tadeusz feel good.	f
N01200056	Barbara enjoy the course.	AFN2N0	candidate	S	Barbara enjoy the course.	f
N01200023	Dr. Bean have lots of  sales experience.	AFN2N0	candidate	S	Dr. Bean have lots of  sales experience.	f
B00200054	Eva shares the experience.	AFN2N0	candidate	S	Eva shares the experience.	f
N01200023	Barbara is not competitive.	AFN2N0	candidate	S	Barbara is not competitive.	f
N01200023	Barbara likes to win.	AFN2N0	candidate	S	Barbara likes to win.	f
N01200033	Does the Eva can say many different language?	AFN2N0	candidate	S	Does the Eva can say many different language?	f
N01200033	Eva can speak different language	AFN2N0	candidate	S	Eva can speak different language	f
N01200033	Eva can speak different language?	AFN2N0	candidate	S	Eva can speak different language?	f
N01200033	Dr.Bean can choose the director.	AFN2N0	candidate	S	Dr.Bean can choose the director.	f
N01200016	T	AFN2N0	candidate	S	T	f
N01200016	Barbara is not a good player	AFN2N0	candidate	S	Barbara is not a good player	f
N01200041	Dr Bean wants to have the job.	AFN2N0	candidate	S	Dr Bean wants to have the job.	f
193001	Tadeusz has a team	AFN2N0	candidate	S	Tadeusz had a team	t
N01200041	Dr Bean choose Barbara, Because he can start by improving our sales team.	AFN2N0	candidate	S	Dr Bean choose Barbara, Because he can start by improving our sales team.	f
B00200054	Eva wants a job.	AFN2N0	candidate	S	Eva wants a job.	f
B00200054	Eva is honest person.	AFN2N0	candidate	S	Eva is honest person.	f
N02202101	Is Babara a ambitious women? 	AFN2N0	candidate	S	Is Babara a ambitious women? 	f
N02202101	Does dr. bean have any experience of sales?	AFN2N0	candidate	S	Does dr. bean have any experience of sales?	f
N01200041	Barbara think we should expand competitive over the next five years.	AFN2N0	candidate	S	Barbara think we should expand competitive over the next five years.	f
N01200041	Eva is outgoing woman ,because she is from Polish.	AFN2N0	candidate	S	Eva is outgoing woman ,because she is from Polish.	f
N02202101	Does Eva like teamwork if there is a project need done	AFN2N0	candidate	S	Does Eva like teamwork if there is a project need done	f
N02202101	Is dr. bean a cofident and outgoing man	AFN2N0	candidate	S	Is dr. bean a cofident and outgoing man	f
N02202101	Does dr, bean get a lot of feedback when he tries maketing sales	AFN2N0	candidate	S	Does dr, bean get a lot of feedback when he tries maketing sales	f
N02202101	Does Eva have experience of marketing sales?	AFN2N0	candidate	S	Does Eva have experience of marketing sales?	f
N02202101	Does dr. bean enjoy marketing?	AFN2N0	candidate	S	Does dr. bean enjoy marketing?	f
193001		AFN3Y0	intros	WH		f
193001	Who is a person	AFN3Y0	intros	WH	Who is a person	f
193001	Who was a person.	AFN3Y0	intros	WH	Who was a person.	f
193001	Was Dr Bean a person?	AFN3Y0	intros	YN	Was Dr Bean a person?	f
193001	Was Mi Mi a person?	AFN3Y0	intros	YN	Was Mi Mi a person?	f
193001	YN	AFN3Y0	intros	YN	Was music a person?	t
N00200056	Questioner_q-and-a: unknown words: ["cat"]	AFN3Y0	q-and-a	WH	Who had a cat?	t
N00200056	Questioner_q-and-a: unknown words: ["color","is","like"]	AFN3Y0	q-and-a	WH	what color is Rena like?	t
N00200056	Questioner_q-and-a: unknown words: ["is"]	AFN3Y0	q-and-a	WH	Who is Rena's teacher?	t
N00200056	Questioner_q-and-a: unknown words: ["is","cat","name"]	AFN3Y0	q-and-a	WH	What is the cat's name?	t
N00200056	Questioner_q-and-a: unknown words: ["is","like"]	AFN3Y0	q-and-a	WH	What is Rena like?	t
N00200029	Questioner_q-and-a: unknown words: ["does","color","rene","like"]	AFN3Y0	q-and-a	WH	What does the color Rene like ?	t
N00200029	Questioner_q-and-a: unknown words: ["is","your","favorite"]	AFN3Y0	q-and-a	WH	What is your favorite ?	t
N00200029	Questioner_q-and-a: unknown words: ["is","rene","cat","name"]	AFN3Y0	q-and-a	WH	what is Rene's  cat name?	t
N00200029	Questioner_q-and-a: unknown words: ["you","study"]	AFN3Y0	q-and-a	WH	Where did you study in ?	t
N00200029	Questioner_q-and-a: unknown words: ["is","your","major","university"]	AFN3Y0	q-and-a	WH	What is your major in university ?	t
N00200001	Questioner_q-and-a: unknown words: ["is","favorite","color"]	AFN3Y0	q-and-a	WH	What is Rena's favorite color?	t
N00200001	Questioner_q-and-a: unknown words: ["how","do","you","call","name","cat"]	AFN3Y0	q-and-a	WH	How do you call the name of Rena's cat?	t
N00200001	Questioner_q-and-a: unknown words: ["is","favorite","singer"]	AFN3Y0	q-and-a	WH	Who is Rena's favorite singer?	t
N00200001	Questioner_q-and-a: unknown words: ["is","another","favorite"]	AFN3Y0	q-and-a	WH	What is Rena's another favorite?	t
N00200001	Questioner_q-and-a: unknown words: ["is","interest"]	AFN3Y0	q-and-a	WH	What is Rena's interest?	t
N00200042	Questioner_q-and-a: unknown words: ["mindy","study"]	AFN3Y0	q-and-a	WH	Where did Mindy study in ? 	t
N00200030	Questioner_q-and-a: unknown words: ["is","favorite","sport"]	AFN3Y0	q-and-a	WH	What is Jeff's favorite Sport?	t
N00200030	Questioner_q-and-a: unknown words: ["is","date","birth"]	AFN3Y0	q-and-a	WH	What is Jeff's date of birth?	t
N00200030	Questioner_q-and-a: unknown words: ["is","computer","and","multimedia","language","teaching"]	AFN3Y0	q-and-a	WH	who is a teacher of Computer and Multimedia Language Teaching? 	t
N00200030	WH	AFN3Y0	q-and-a	WH	Where was Jeff born?	t
N00200055	Questioner_q-and-a: unknown words: ["likes"]	AFN3Y0	q-and-a	WH	Who likes Hello Kitty	t
N00200017	Questioner_q-and-a: unknown words: ["likes","singer"]	AFN3Y0	q-and-a	WH	Who likes the singer Avril Lavigne?	t
N00200055	Questioner_q-and-a: unknown words: ["does","go"]	AFN3Y0	q-and-a	WH	Where does she want to go work?	t
N00200017	Questioner_q-and-a: unknown words: ["does","study"]	AFN3Y0	q-and-a	YN	Does Jeff study in Minghsin University?	t
N00200030	Questioner_q-and-a: unknown words: ["father","is","truck","driver","isn't"]	AFN3Y0	q-and-a	Tag	Jeff's father is a truck driver, isn't he?	t
N00200055	Questioner_q-and-a: unknown words: ["is","shane","favorite","sport"]	AFN3Y0	q-and-a	WH	What is Shane's favorite sport?	t
N00200055	Questioner_q-and-a: unknown words: ["is","name"]	AFN3Y0	q-and-a	WH	What is Rena's cat name ?	t
N00200030	Questioner_q-and-a: unknown words: ["is","jeff'","chinese","name"]	AFN3Y0	q-and-a	WH	What is Jeff''s Chinese name?	t
N00200017	Questioner_q-and-a: unknown words: ["does"]	AFN3Y0	q-and-a	YN	Does Rena had a cat?	t
N00200055	Questioner_q-and-a: unknown words: ["country","does","go"]	AFN3Y0	q-and-a	WH	What country does Rena want to go ?	t
N00200017	Questioner_q-and-a: unknown words: ["hobby","does","will","do"]	AFN3Y0	q-and-a	WH	What hobby does Jeff will do?	t
N00200017	Questioner_q-and-a: unknown words: ["county","does","working"]	AFN3Y0	q-and-a	WH	Which county does Rena want to working	t
N00200017	Questioner_q-and-a: unknown words: ["university","does","studied"]	AFN3Y0	q-and-a	WH	Which university does Jeff studied?	t
N00200025	Questioner_q-and-a: unknown words: ["university","does","study"]	AFN3Y0	q-and-a	WH	What university does Jeff study in ?	t
N00200017	Questioner_q-and-a: unknown words: ["department","does","studied"]	AFN3Y0	q-and-a	WH	What  department does Jeff studied?	t
N00200025	Questioner_q-and-a: unknown words: ["is","habit"]	AFN3Y0	q-and-a	WH	What is Rena's habit? 	t
N00200025	Questioner_q-and-a: unknown words: ["color","does"]	AFN3Y0	q-and-a	WH	What color does Rena like ?	t
N00200025	Questioner_q-and-a: unknown words: ["is","chinese","name"]	AFN3Y0	q-and-a	WH	What is Jeff Chinese name ? 	t
N00200025	Questioner_q-and-a: unknown words: ["pet"]	AFN3Y0	q-and-a	WH	Who had the pet of cats?	t
N01203003	Questioner_q-and-a: unknown words: ["cartoon","character","is"]	AFN3Y0	q-and-a	WH	Which cartoon character is Rena most like?	t
N01203003	Questioner_q-and-a: unknown words: ["is","our","computer","multimedia","language","teaching","lecturer"]	AFN3Y0	q-and-a	WH	Who is our Computer Multimedia in Language Teaching of lecturer?	t
N01203003	Questioner_q-and-a: unknown words: ["is","color","for"]	AFN3Y0	q-and-a	WH	What is the color for Rena's Hello Kitty?	t
N01203003	Questioner_q-and-a: unknown words: ["is","chinese","full","name"]	AFN3Y0	q-and-a	WH	What is Jeff's Chinese full name?	t
N01203003	Questioner_q-and-a: unknown words: ["is","pet","name"]	AFN3Y0	q-and-a	WH	What is Rena's pet name?	t
N96200030	Questioner_q-and-a: unknown words: ["is","you"]	AFN3Y0	q-and-a	WH	who is you a teacher	t
N96200030	Questioner_q-and-a: unknown words: ["pink","color"]	AFN3Y0	q-and-a	WH	who like pink color?	t
N96200030	Questioner_q-and-a: unknown words: ["is","hometown"]	AFN3Y0	q-and-a	WH	where is the hometown?	t
N96200030	Questioner_q-and-a: unknown words: ["is","you","interest"]	AFN3Y0	q-and-a	WH	what is you a interest?	t
N96200030	Questioner_q-and-a: unknown words: ["mimi"]	AFN3Y0	q-and-a	WH	who have cat mimi?	t
N00200036	Questioner_q-and-a: unknown words: ["animal","does"]	AFN3Y0	q-and-a	WH	What animal does Rena most like?	t
N00200036	Questioner_q-and-a: unknown words: ["is","living","now"]	AFN3Y0	q-and-a	WH	Where is Rena living now?	t
N00200036	Questioner_q-and-a: unknown words: ["is","go"]	AFN3Y0	q-and-a	WH	Where is Rena want to go?	t
N00200036	Questioner_q-and-a: unknown words: ["is","favorite"]	AFN3Y0	q-and-a	WH	What is Rena favorite music?	t
N00200036	Questioner_q-and-a: unknown words: ["country","does"]	AFN3Y0	q-and-a	WH	What country does Rena like?	t
N01202004	Unparseable	AFN3Y0	q-and-a	WH		t
N00200054	Questioner_q-and-a: unknown words: ["color","is"]	AFN3Y0	q-and-a	WH	what color is Rena like?	t
N00200054	Questioner_q-and-a: unknown words: ["is","this"]	AFN3Y0	q-and-a	WH	what is Rena had this?	t
N00200054	Questioner_q-and-a: unknown words: ["is","your","favorite","color"]	AFN3Y0	q-and-a	WH	What is your favorite color ?	t
N00200054	Questioner_q-and-a: unknown words: ["is","sleeping"]	AFN3Y0	q-and-a	WH	who is like sleeping?	t
N00200054	Questioner_q-and-a: unknown words: ["is","your","hobby"]	AFN3Y0	q-and-a	WH	What is your hobby ?	t
N00200008	Questioner_q-and-a: unknown words: ["why","does","raise"]	AFN3Y0	q-and-a	WH	Why does Rena raise a cat?	t
N00200008	Questioner_q-and-a: unknown words: ["is","mimi","master"]	AFN3Y0	q-and-a	WH	Who is the MIMI master?	t
N00200008	Questioner_q-and-a: unknown words: ["is","name","pet"]	AFN3Y0	q-and-a	WH	What is the name of Rena pet?	t
N00200008	Questioner_q-and-a: unknown words: ["does","live"]	AFN3Y0	q-and-a	WH	Where does Jeff live in?	t
N00200008	Questioner_q-and-a: unknown words: ["cares","about"]	AFN3Y0	q-and-a	WH	Who cares about travel?	t
N00200037		AFN3Y0	q-and-a	WH		f
N00200037	where does alex live	AFN3Y0	q-and-a	WH	Where does Alex live?	t
N00200037	who likes hello_kitty	AFN3Y0	q-and-a	WH	who likes Hello kitty?	t
N00200037	what day is jeff 's birthday	AFN3Y0	q-and-a	WH	what day is Jeff's birthday?	t
N00200037	where 's minchain university	AFN3Y0	q-and-a	WH	where's minchain university?	t
N00200037	who comes from taoyan	AFN3Y0	q-and-a	WH	Who comes from Taoyan?	t
N00200034			q-and-a	WH		f
N00200034	what does her cat 's name		q-and-a	WH	What does her cat's name?	t
N00200042	how do you call the name of rena 's cat	AFN3Y0	q-and-a	WH	How do you call the name of Rena's cat?	t
N00200034	where do you come from		q-and-a	WH	Where do you come from	t
N00200042	what color is rena like	AFN3Y0	q-and-a	WH	what color is Rena like?	t
N00200034	which country do you from		q-and-a	WH	Which country do you from	t
N00200042	where did kelly study in	AFN3Y0	q-and-a	WH	Where did Kelly study in ?	t
N00200042	who had the pet of cats	AFN3Y0	q-and-a	WH	Who had the pet of cats?	t
N00200034	what is rena 's cat name		q-and-a	WH	What is Rena's cat name	t
N00200034	what does rena 's cat name		q-and-a	WH	What does Rena's cat name?	t
N00200051	which color does rena like pink or green	AFN3Y0	q-and-a	WH	Which color does Rena like, pink or green?	t
N00200051	which color did rena like	AFN3Y0	q-and-a	WH	Which color did Rena like?	t
193001	who was the student whose grandmother was a farmer	AFN3Y0	q-and-a	WH	Who was the student whose grandmother was a farmer?	t
N00200051	who 's favorite singer was avril_lavigne	AFN3Y0	q-and-a	WH	Who's favorite singer was Avril Lavigne?	t
N00200051	who liked listening_to_music	AFN3Y0	q-and-a	WH	Who liked listening to music?	t
N00200051	who had a cat	AFN3Y0	q-and-a	WH	Who had a cat?	t
193001	what was jeff 's chinese name	AFN3Y0	q-and-a	WH	What was Jeff's Chinese name?	t
193001	where did rena want to work	AFN3Y0	q-and-a	WH	Where did Rena want to work?	t
N01202001	jeff was born in taoyuan	AFN3Y0	q-and-a	YN	Jeff was born in Taoyuan.	t
N01202001	jeff 's father is a farmer	AFN3Y0	q-and-a	YN	Jeff's father is a farmer.	t
N01202001	jeff was born on april 30th .1994	AFN3Y0	q-and-a	YN	Jeff was born on April 30th.1994	t
N01202001	jeff 's mother is a babysitter	AFN3Y0	q-and-a	YN	Jeff's mother is a babysitter.	t
N01202001	jeff 's favorite sport is baseball	AFN3Y0	q-and-a	YN	Jeff's favorite sport is baseball.	t
N01202001	jeff has one sibling	AFN3Y0	q-and-a	YN	Jeff has one sibling.	t
N01202004	rana dislike pink	AFN3Y0	q-and-a	YN	Rana dislike pink	t
N01202004	what is rena 's like color	AFN3Y0	q-and-a	WH	What is Rena's like color?	t
N01202004	what is rena 's habit	AFN3Y0	q-and-a	WH	What is Rena's habit? 	t
N01202004	who love avril_lavigne	AFN3Y0	q-and-a	WH	Who love avril lavigne?	t
N01202004	what is jeff	AFN3Y0	q-and-a	WH	what is jeff	t
N01202004	what is jeff 's birthday	AFN3Y0	q-and-a	WH	what is jeff's birthday?	t
N00200043	what is rena 's favorite	AFN3Y0	q-and-a	WH	What is Rena's favorite? 	t
N00200043	what is alex 's hobby	AFN3Y0	q-and-a	WH	what is Alex's hobby?	t
N00200043	which part is alex 's favorite	AFN3Y0	q-and-a	WH	Which part is Alex's favorite?	t
N00200043	what is can help mindy forget trouble	AFN3Y0	q-and-a	WH	What is can help Mindy forget trouble?	t
N00200043	what is dave major in minchain university	AFN3Y0	q-and-a	WH	what is dave major in minchain university?	t
N00200034	who haven't cat	AFN3Y0	q-and-a	WH	Who haven't cat?	t
N00200034	who want to play the piano	AFN3Y0	q-and-a	WH	Who want to play the piano?	t
N00200034	who want playing the piano	AFN3Y0	q-and-a	WH	Who want playing the piano?	t
N00200034	who like listening_to_music	AFN3Y0	q-and-a	WH	Who like listening to music?	t
N00200034	who likes listening_to_music	AFN3Y0	q-and-a	WH	Who likes listening to music?	t
N00200034	what is the cat 's name	AFN3Y0	q-and-a	WH	What is the cat's name?	t
193001	what is jeff 's name	AFN3Y0	q-and-a	WH	What is Jeff's name?	t
193001	who was cat	AFN3Y0	q-and-a	WH	Who was cat?	t
193001	who was teacher	AFN3Y0	q-and-a	WH	Who was teacher?	f
193001	what was cat name	AFN3Y0	q-and-a	WH	What was cat name	t
193001	what was rena name	AFN3Y0	q-and-a	WH	What was Rena name?	t
193001	who was student	AFN3Y0	q-and-a	WH	Who was student?	f
193001	who was rena name	AFN3Y0	q-and-a	WH	who was rena name?	t
193001	who was sister	AFN3Y0	q-and-a	WH	who was sister	f
193001	who had mother	AFN3Y0	q-and-a	WH	Who had mother	f
193001	who had father	AFN3Y0	q-and-a	WH	who had father	f
193001	who had brother	AFN3Y0	q-and-a	WH	who had brother	f
193001	who had man	AFN3Y0	q-and-a	WH	who had man	f
193001	who had man name	AFN3Y0	q-and-a	WH	who had man name	t
193001	who had woman	AFN3Y0	q-and-a	WH	who had woman	f
{"N00200056","Unparseable","AFN3Y0","q-and-a","Tag","","1"}	{"N00200056","Questioner_q-and-a: unknown words: [\\"lives\\",\\"hshinchu\\",\\",isn't\\"]","AFN3Y0","q-and-a","YN","Rena lives in Hshinchu,isn't she?","1"}	{"N00200056","Questioner_q-and-a: unknown words: [\\"likes\\",\\",isn't\\"]","AFN3Y0","q-and-a","YN","Rena likes Hello Kitty,isn't she?","1"}	{"N00200056","Questioner_q-and-a: unknown words: [\\"is\\",\\",isn't\\"]","AFN3Y0","q-and-a","YN","Dr Bean is a teacher,isn't he?","1"}	{"N00200056","Questioner_q-and-a: unknown words: [\\"cat\\",\\"name\\",\\"is\\",\\"mimi\\",\\",isn't\\"]","AFN3Y0","q-and-a","YN","Cat's name is Mimi,isn't it?","1"}	{"N00200056","Questioner_q-and-a: unknown words: [\\"is\\",\\"american\\",\\",isn't\\"]","AFN3Y0","q-and-a","YN","Dr Bean is an American,isn't he?","1"}	t
N00200056	Questioner_q-and-a: unknown words: ["lives","hshinchu",",isn't"]	AFN3Y0	q-and-a	YN	Rena lives in Hshinchu,isn't she?	t
N00200056	Questioner_q-and-a: unknown words: ["likes",",isn't"]	AFN3Y0	q-and-a	YN	Rena likes Hello Kitty,isn't she?	t
N00200056	Questioner_q-and-a: unknown words: ["is",",isn't"]	AFN3Y0	q-and-a	YN	Dr Bean is a teacher,isn't he?	t
N00200056	Questioner_q-and-a: unknown words: ["cat","name","is","mimi",",isn't"]	AFN3Y0	q-and-a	YN	Cat's name is Mimi,isn't it?	t
N00200056	Questioner_q-and-a: unknown words: ["is","american",",isn't"]	AFN3Y0	q-and-a	YN	Dr Bean is an American,isn't he?	t
N00200056	Questioner_q-and-a: unknown words: ["lives","taiwan",",isn't"]	AFN3Y0	q-and-a	YN	Dr Bean lives in Taiwan,isn't he?	t
N00200036	Questioner_q-and-a: unknown words: ["dr","bean","hometown","is",",isn't"]	AFN3Y0	q-and-a	YN	Dr. Bean hometown is America,isn't he?	t
N00200036	Questioner_q-and-a: unknown words: ["dr","bean","likes",",doesn't"]	AFN3Y0	q-and-a	YN	Dr. Bean likes America's music,doesn't he?	t
N00200036	Questioner_q-and-a: unknown words: ["is","good","boy",",isn't"]	AFN3Y0	q-and-a	YN	Jeff is a good boy,isn't he?	t
N00200036	Questioner_q-and-a: unknown words: ["likes","foreign",",doesn't"]	AFN3Y0	q-and-a	YN	Rena likes foreign music,doesn't she? 	t
N00200036	Questioner_q-and-a: unknown words: ["is","lover",",isn't"]	AFN3Y0	q-and-a	YN	Rena is a cat's lover,isn't she?	t
N00200036	Questioner_q-and-a: unknown words: ["is","on","her","way","dream",",isn't"]	AFN3Y0	q-and-a	YN	Rena is on her way to the dream,isn't she?	t
N00200001	did cindy can playing the piano	AFN3Y0	q-and-a	YN	Did Cindy can playing the piano?	t
N00200001	was alex a design_assistant	AFN3Y0	q-and-a	YN	Was Alex a design_assistant ?	t
N00200001	wasn't dr_bean a student	AFN3Y0	q-and-a	YN	Wasn't Dr_Bean a student?	t
N00200001	rena 's favorite singer was avril_lavigne	AFN3Y0	q-and-a	YN	Rena's favorite singer was Avril_Lavigne ?	t
N00200001	was cindy live in jiayi	AFN3Y0	q-and-a	YN	Was Cindy live in Jiayi ?	t
N00200001	did cindy live in jiayi	AFN3Y0	q-and-a	YN	Did Cindy live in Jiayi ?	t
N00200001	was jeff 's father a truck_driver	AFN3Y0	q-and-a	YN	Was Jeff's father a  truck_driver ?	t
N00200001	was rena 's favorite the_color_pink	AFN3Y0	q-and-a	YN	Was Rena's favorite the_color_pink?	t
N01202004		AFN300	q-and-a	YN		f
N00200034	who lived in hsinchu	AFN3Y0	q-and-a-2	WH	Who lived in Hsinchu?	t
N00200034	who liked hello_kitty	AFN3Y0	q-and-a-2	WH	Who liked Hello kitty?	t
N00200034	who was career_woman	AFN3Y0	q-and-a-2	WH	Who was career woman?	f
N00200034	who liked playing_the_piano	AFN3Y0	q-and-a-2	WH	Who liked playing the piano?	t
N00200001	was vicky 's mother a babysitter	AFN3Y0	q-and-a-2	Tag	Was Vicky's mother a babysitter?	t
N00200001	vicky had sisters didn't she	AFN3Y0	q-and-a-2	Tag	Vicky had sisters, didn't she?	f
N00200001	cindy liked playing_the_piano didn't she	AFN3Y0	q-and-a-2	Tag	Cindy liked playing the piano, didn't she?	f
N00200001	alex was a design_assistant wasn't he	AFN3Y0	q-and-a-2	Tag	Alex was a design_assistant, wasn't he?	t
N00200001	alex lived in hsinchu didn't he	AFN3Y0	q-and-a-2	Tag	Alex lived in Hsinchu, didn't he?	f
N00200001	cindy was born in jiayi wasn't she	AFN3Y0	q-and-a-2	Tag	Cindy was born in Jiayi, wasn't she?	t
N00200001	mi_mi was rena 's cat wasn't it	AFN3Y0	q-and-a-2	Tag	Mi Mi was Rena's cat, wasn't it?	t
N00200001	jeff 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-2	Tag	Jeff's father was a truck_driver, wasn't he?	t
N00200001	alex was born in taoyuan wasn't he	AFN3Y0	q-and-a-2	Tag	Alex was born in Taoyuan, wasn't he?	t
N00200017	who lived in taoyuan	AFN3Y0	q-and-a-2	WH	Who lived in Taoyuan?	t
N00200029	who liked avril_lavigne	AFN3Y0	q-and-a-2	WH	Who liked Avril_Lavigne ?	t
N00200029	rena liked to listening_to_music didn't she	AFN3Y0	q-and-a-2	WH	Rena liked to listening to music , didn't she ?	f
N00200029	was vicky 's mother a teacher	AFN3Y0	q-and-a-2	WH	Was Vicky's mother a teacher ?	t
N00200029	was cindy liked to playing_the_piano wasn't she	AFN3Y0	q-and-a-2	WH	Was Cindy liked to playing the piano , wasn't she ?	f
N00200029	was jeff 's grandmother a farmer wasn't she	AFN3Y0	q-and-a-2	WH	Was Jeff's grandmother a farmer , wasn't she ?	f
N00200029	was jeff 's grandmother a farmer	AFN3Y0	q-and-a-2	WH	Was Jeff's grandmother a farmer ?	t
N00200030	alex liked to travel didn't he	AFN3Y0	q-and-a-2	Tag	Alex liked to travel didn't he? 	f
N00200030	did alex liked to travel	AFN3Y0	q-and-a-2	YN	Did Alex liked to travel?	f
N00200030	did alex liked to shopping	AFN3Y0	q-and-a-2	YN	Did Alex liked to shopping?	f
N00200030	did alex lived in hsinchu	AFN3Y0	q-and-a-2	YN	Did Alex lived in Hsinchu?	f
N00200030	was alex lived in hsinchu	AFN3Y0	q-and-a-2	YN	Was Alex lived in Hsinchu?	f
N00200030	jeff was born in taoyuan wasn't he	AFN3Y0	q-and-a-2	Tag	Jeff was born in Taoyuan, wasn't he?	t
N00200030	jeff 's mother was a career_woman wasn't she	AFN3Y0	q-and-a-2	Tag	Jeff's mother was a career woman, wasn't she?	t
N00200030	jeff 's grandmother was a farmer wasn't she	AFN3Y0	q-and-a-2	Tag	Jeff's grandmother  was a farmer , wasn't she?	t
N00200056	alex mother was a truck_driver wasn't he	AFN3Y0	q-and-a-2	YN	Alex mother was a truck_driver, wasn't he? 	f
N00200008	who had a cat	AFN3Y0	q-and-a-2	WH	who had a cat?	t
N00200008	who liked to travel	AFN3Y0	q-and-a-2	WH	who liked to travel?	f
N00200008	cindy liked listening_to_music didn't she	AFN3Y0	q-and-a-2	WH	Cindy liked listening to music, didn't she? 	f
N00200008	they all lived in hsinchu	AFN3Y0	q-and-a-2	WH	They all lived in Hsinchu?	f
N00200008	who liked exercising	AFN3Y0	q-and-a-2	WH	Who liked exercising?	t
N00200008	who liked the_color_pink	AFN3Y0	q-and-a-2	WH	Who liked the_color_pink?	t
N00200008	who liked drawing	AFN3Y0	q-and-a-2	WH	Who liked drawing?	t
N01202001	who 's father was a truck_driver	AFN3Y0	q-and-a-2	WH	Who's father was a truck driver?	t
N01202001	who liked reading	AFN3Y0	q-and-a-2	WH	Who liked reading?	t
N96200030	who liked shopping	AFN3Y0	q-and-a-2	YN	who liked shopping?	t
N01202004	jeff was born in 1994 didn't he	AFN3Y0	q-and-a-2	Tag	Jeff was born in 1994, didn't he?	f
N01202004	rena liked cat didn't she	AFN3Y0	q-and-a-2	Tag	Rena liked cat, didn't she?	f
N01203003	rena liked the_color_pink didn't she	AFN3Y0	q-and-a-2	YN	Rena liked the color pink, didn't she?	f
N01203003	rena liked avril_lavigne didn't she	AFN3Y0	q-and-a-2	YN	Rena liked Avril_Lavigne, didn't she?	f
N01203003	jeff lived in taoyuan didn't he	AFN3Y0	q-and-a-2	YN	Jeff lived in Taoyuan, didn't he?	f
N01203003	rena lived in hsinchu didn't she	AFN3Y0	q-and-a-2	YN	Rena lived in Hsinchu, didn't she?	f
N01203003	jeff studied in minghsin_university didn't he	AFN3Y0	q-and-a-2	YN	Jeff studied in Minghsin_University , didn't he?	f
N00200055	alex liked to drawing didn't he	AFN3Y0	q-and-a-2	YN	Alex liked to drawing , didn't he?	f
N00200055	rena liked listening_to_music didn't she	AFN3Y0	q-and-a-2	YN	Rena liked listening to music didn't she?	f
N00200055	was rena liked listening_to_music	AFN3Y0	q-and-a-2	YN	Was Rena liked listening to music?	f
N00200055	who liked listening_to_music	AFN3Y0	q-and-a-2	WH	who liked listening to music?	t
N00200055	who was truck_driver	AFN3Y0	q-and-a-2	WH	Who was truck driver?	f
N00200055	was rena liked to reading	AFN3Y0	q-and-a-2	YN	Was Rena liked to reading?	f
N00200055	was rena like to reading	AFN3Y0	q-and-a-2	YN	Was Rena like to reading?	f
N00200055	was rena liked reading	AFN3Y0	q-and-a-2	YN	Was Rena liked reading?	f
N00200055	who was rena liked	AFN3Y0	q-and-a-2	WH	who was Rena liked? 	f
N00200055	who liked travel	AFN3Y0	q-and-a-2	WH	who liked travel?	t
N00200055	what did rena study in	AFN3Y0	q-and-a-2	WH	what did Rena study in?	t
N00200036	mindy liked listening_to_music wasn't she	AFN3Y0	q-and-a-3	YN	Mindy  liked listening_to_music wasn't she ?	f
N00200036	mindy liked to listening_to_music wasn't she	AFN3Y0	q-and-a-3	YN	Mindy liked to listening to music wasn't she	f
N00200017	who studied in the minghsin_university	AFN3Y0	q-and-a-3	WH	Who studied in the Minghsin University?	f
N00200043	where did neil lived	AFN3Y0	q-and-a-3	WH	where did Neil lived?	f
N00200043	neil live in where	AFN3Y0	q-and-a-3	WH	Neil live in where?	f
N00200043	who like to jogging	AFN3Y0	q-and-a-3	WH	who like to jogging?	f
N00200008	mindy liked the_song_memory didn't she	AFN3Y0	q-and-a-3	YN	Mindy liked the_song_memory, didn't she?	f
N00200008	mindy liked pizza didn't she	AFN3Y0	q-and-a-3	YN	Mindy liked pizza, didn't she?	f
N00200008	mindy liked going_to_the_movies didn't she	AFN3Y0	q-and-a-3	YN	Mindy liked going to the movies, didn't she?	f
N00200008	dave liked making_friends didn't he	AFN3Y0	q-and-a-3	YN	Dave liked making_friends, didn't he?	f
N00200008	dave had a brother didn't he	AFN3Y0	q-and-a-3	YN	Dave had a brother, didn't he?	f
N00200008	neil liked hello_kitty didn't he	AFN3Y0	q-and-a-3	YN	Neil liked hello_kitty, didn't he?	f
N00200001	was mindy live in hsinchu	AFN3Y0	q-and-a-3	YN	Was Mindy live in Hsinchu?	f
N00200001	did mindy live in hsinchu	AFN3Y0	q-and-a-3	YN	Did Mindy live in Hsinchu?	t
N00200001	did dave have a sister	AFN3Y0	q-and-a-3	YN	Did Dave have a sister?	t
N00200001	was neil 's father a truck_driver	AFN3Y0	q-and-a-3	YN	Was Neil's father a truck_driver?	t
N00200001	was mindy a_japanese_interpreter	AFN3Y0	q-and-a-3	YN	Was Mindy a_japanese_interpreter?	t
N00200001	was kelly 's mother a babysitter	AFN3Y0	q-and-a-3	YN	Was Kelly's mother a babysitter?	t
N00200001	did mindy born in america	AFN3Y0	q-and-a-3	YN	Did Mindy born in America?	f
N00200001	was mindy born in america	AFN3Y0	q-and-a-3	YN	Was Mindy born in America?	t
N00200056	was mindy liked to going_to_the_movies	AFN3Y0	q-and-a-3	YN	was Mindy liked to going to the movies?	f
N00200056	did kelly live in hsinchu	AFN3Y0	q-and-a-3	YN	Did Kelly live in Hsinchu?	t
N00200056	did mindy have a brother	AFN3Y0	q-and-a-3	YN	Did Mindy have a brother?	t
N00200056	did shane liked exercising	AFN3Y0	q-and-a-3	YN	Did Shane liked exercising?	f
N00200056	did mindy live in nantou	AFN3Y0	q-and-a-3	YN	Did Mindy live in Nantou?	t
N00200036	did dave liked cat	AFN3Y0	q-and-a-3	YN	Did Dave liked cat?	f
N00200036	did dave have a brother	AFN3Y0	q-and-a-3	YN	Did Dave have a brother?	t
N00200036	did mindy live in taoyuan	AFN3Y0	q-and-a-3	YN	Did Mindy live in Taoyuan?	t
N00200036	did mindy have a sister	AFN3Y0	q-and-a-3	YN	Did Mindy have a sister?	t
N00200036	was dave 's father a truck_driver	AFN3Y0	q-and-a-3	YN	Was Dave's father a truck_driver?	t
N00200036	dave liked pizza didn't he	AFN3Y0	q-and-a-3	YN	Dave liked pizza, didn't he?	f
N00200036	did neil have a sister	AFN3Y0	q-and-a-3	YN	Did Neil have a sister?	t
N00200036	did shane live in hsinchu	AFN3Y0	q-and-a-3	YN	Did Shane live in Hsinchu?	t
N00200043	did shane live in nantou	AFN3Y0	q-and-a-3	WH	Did Shane live in Nantou? 	t
N00200043	was neil a truck_driver	AFN3Y0	q-and-a-3	WH	was Neil a truck_driver ?	t
N01203003	did shane liked hsiao_ching-teng	AFN3Y0	q-and-a-3	YN	Did shane liked Hsiao_Ching-teng?	f
N01203003	did mindy liked japanese	AFN3Y0	q-and-a-3	YN	Did Mindy liked Japanese?	f
N01203003	did mindy like japanese	AFN3Y0	q-and-a-3	YN	Did Mindy like Japanese?	t
N01203003	did shane like hsiao_ching-teng	AFN3Y0	q-and-a-3	YN	Did shane like Hsiao_Ching-teng?	t
N96200030	did neil live in nantou	AFN3Y0	q-and-a-3	YN	Did Neil live in Nantou?	t
N00200036	did shane live in taoyuan	AFN3Y0	q-and-a-3	YN	Did Shane live in Taoyuan?	t
N00200043	did neil like japanese	AFN3Y0	q-and-a-3	WH	Did Neil like Japanese?	t
N96200030	did dave like making_friends	AFN3Y0	q-and-a-3	YN	Did Dave like making_friends?	t
N00200030	mindy was born in taoyuan wasn't she	AFN3Y0	q-and-a-3	Tag	Mindy was born in Taoyuan, wasn't she?	t
N00200030	who was a student of minghsin_university	AFN3Y0	q-and-a-3	WH	Who was a student of Minghsin University?	t
N00200030	was shane a student of minghsin_university	AFN3Y0	q-and-a-3	YN	Was Shane a student of Minghsin University?	t
N00200030	where did neil live	AFN3Y0	q-and-a-3	WH	where did Neil live?	t
N00200030	shane lived in jiayi didn't he	AFN3Y0	q-and-a-3	Tag	Shane lived in Jiayi, didn't he?	t
N00200030	neil was a design_assistant wasn't he	AFN3Y0	q-and-a-3	Tag	Neil was a design assistant , wasn't he?	t
N00200030	lextar was a career_woman wasn't she	AFN3Y0	q-and-a-3	Tag	Lextar was a  career woman, wasn't she?	f
N00200042	did kelly like japanese	AFN3Y0	q-and-a-3	YN	Did Kelly like Japanese?	t
N00200042	did kelly liked playing_the_piano	AFN3Y0	q-and-a-3	YN	Did Kelly liked playing the piano?	f
N00200042	did kelly like playing_the_piano	AFN3Y0	q-and-a-3	YN	Did Kelly like playing the piano?	t
N00200042	did shane live in jiayi	AFN3Y0	q-and-a-3	YN	Did Shane live in Jiayi?	t
N00200043	did shane like playing_the_piano	AFN3Y0	q-and-a-3	YN	Did Shane like playing the piano?	t
N00200043	did kelly live in jiayi	AFN3Y0	q-and-a-3	YN	Did Kelly live in Jiayi?	t
N00200043	did neil like playing_the_piano	AFN3Y0	q-and-a-3	YN	Did Neil like playing the piano?	t
N00200043	was dave a student of minghsin_university	AFN3Y0	q-and-a-3	YN	Was Dave a student of Minghsin University?\t	t
N00200043	did neil like jogging	AFN3Y0	q-and-a-3	YN	Did Neil like jogging?	t
N00200043	did kelly like pizza	AFN3Y0	q-and-a-3	YN	Did Kelly like pizza?	t
N01202004	who lived in nantou	AFN3Y0	q-and-a-3	WH	who lived in Nantou?	t
N01202004	who lived in hsinchu	AFN3Y0	q-and-a-3	WH	who lived in Hsinchu?	t
N01202004	who lived in hukou	AFN3Y0	q-and-a-3	WH	who lived in Hukou?	t
N01202004	neil lived in hukou didn't he	AFN3Y0	q-and-a-3	YN	Neil lived in Hukou, didn't he?	t
N01202004	who was born in nantou	AFN3Y0	q-and-a-3	WH	who was born in Nantou?	t
193001	was a woman who lived in hsinchu a student in minghsin_university	AFN3Y0	q-and-a-3	YN	Was a woman who lived in Hsinchu a student in Minghsin University?	t
193001	did a man who was born in nantou like jogging	AFN3Y0	q-and-a-3	YN	Did a man who was born in Nantou like jogging?	t
193001	was a man who had a sister in minghsin_university	AFN3Y0	q-and-a-3	YN	Was a man who had a sister in Minghsin University?	t
193001	shane liked jogging didn't he	AFN3Y0	q-and-a-3	Tag	Shane liked jogging, didn't he?	t
193001	some man who was born in nantou liked jogging didn't he	AFN3Y0	q-and-a-3	Tag	Some man who was born in Nantou liked jogging, didn't he?	t
193001	some men who were born in nantou liked jogging didn't they	AFN3Y0	q-and-a-3	Tag	Some men who were born in Nantou liked jogging, didn't they?	t
N00200029	who lived in hsinchu like japanese	AFN3Y0	q-and-a-3	WH	who  lived  in Hsinchu like Japanese ?	f
193001	where did vicky work	AFN3Y0	q-and-a-exam	WH	Where did Vicky work?	t
N00200037	did mindy have a cat	AFN3Y0	q-and-a-3	YN	Did Mindy have a cat?	t
N00200037	did mindy have cats	AFN3Y0	q-and-a-3	YN	Did Mindy have cats?	t
N00200037	did mindy like hello_kitty	AFN3Y0	q-and-a-3	YN	Did Mindy like hello_kitty?	t
N00200037	did dr_bean live in hsinchu	AFN3Y0	q-and-a-3	YN	Did Dr_Bean live in Hsinchu?	t
N00200037	did neil 's father a farmer	AFN3Y0	q-and-a-3	YN	Did Neil 's father a farmer?	f
N00200001	did mindy live in hsinchu	AFN3Y0	q-and-a-exam	Tag	Did Mindy live in Hsinchu?	t
N00200001	mindy live in hsinchu didn't she	AFN3Y0	q-and-a-exam	Tag	Mindy live in Hsinchu, didn't she?	f
N00200030	was dave 's sister a student	AFN3Y0	q-and-a-exam	YN	Was Dave's sister a student?	t
N00200030	did a man who was born in nantou like jogging	AFN3Y0	q-and-a-exam	YN	Did a man who was born in Nantou like jogging?\t	t
N00200056	did mindy born in hsinchu	AFN3Y0	q-and-a-exam	YN	did mindy born in Hsinchu?	f
N00200054	neil was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	YN	Neil was a design assistant , wasn't he?\t	t
N00200031	who born in jiayi	AFN3Y0	q-and-a-exam	WH	Who born in Jiayi?	f
N00200029	who lived in nantou like jogging	AFN3Y0	q-and-a-exam	WH	Who  lived in Nantou like jogging?	f
N00200009	did dave have a sister	AFN3Y0	q-and-a-exam	YN	Did Dave have a sister?\t	t
N00200030	did kelly live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Kelly live in Jiayi?\t	t
N00200054	Did Dave have a sister？	AFN3Y0	q-and-a-exam	YN	Did Dave have a sister？	t
N00200029	where did neil lived in	AFN3Y0	q-and-a-exam	WH	Where did Neil  lived in?	f
N00200001	did mindy lived in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Mindy lived in Hsinchu?	f
N01202004	mindy was born in hsinchu	AFN3Y0	q-and-a-exam	YN	Mindy was born in Hsinchu	t
N00200030	did shane like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Shane like playing the piano?\t	t
N00200009	was neil 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Neil's father a truck_driver?	t
N00200030	was shane a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Shane a student of Minghsin University?\t	t
N00200054	did kelly live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Kelly live in Hsinchu	t
N00200009	was kelly 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Kelly's mother a babysitter?	t
N00200025	did neil like jogging	AFN3Y0	q-and-a-exam	YN	DId Neil like jogging?	t
N00200054	did dave have a brother	AFN3Y0	q-and-a-exam	YN	Did Dave have a brother	t
N00200009	was mindy born in america	AFN3Y0	q-and-a-exam	YN	Was Mindy born in America?\t	t
N00200001	was mindy live in hsinchu wasn't she	AFN3Y0	q-and-a-exam	Tag	Was Mindy live in Hsinchu, wasn't she?	f
N01202004	who liked the cat	AFN3Y0	q-and-a-exam	WH	Who liked the cat?	t
N00200051	who liked hello_kitty	AFN3Y0	q-and-a-exam	WH	Who liked hello_kitty?	t
N00200056	did a woman who was born in hsinchu	AFN3Y0	q-and-a-exam	WH	Did a woman who was born in Hsinchu?	f
N00200031	did cindy born in jiayi	AFN3Y0	q-and-a-exam	YN	Did Cindy born in Jiayi?	f
N00200008	who liked cat	AFN3Y0	q-and-a-exam	WH	Who liked  cat?	f
N00200054	did mindy live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Mindy live in Taoyuan	t
N01202004	who was born in hsinchu	AFN3Y0	q-and-a-exam	WH	Who was born in Hsinchu?	t
N00200054	did neil have a sister	AFN3Y0	q-and-a-exam	YN	Did Neil have a sister	t
N00200054	was neil a truck_driver	AFN3Y0	q-and-a-exam	YN	was Neil a truck_driver	t
N00200009	did mindy have a brother	AFN3Y0	q-and-a-exam	YN	Did Mindy have a brother?	t
N01202004	who lived in hukou	AFN3Y0	q-and-a-exam	WH	who lived in Hukou?	t
N00200054	did neil like japanese	AFN3Y0	q-and-a-exam	YN	Did Neil like Japanese	t
N00200043	was alex 's father a truck_driver	AFN3Y0	q-and-a-exam	WH	was Alex's father a truck driver?	t
N00200001	was mindy a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Mindy a_japanese_interpreter?	t
N00200009	did mindy live in nantou	AFN3Y0	q-and-a-exam	YN	Did Mindy live in Nantou?	t
N00200030	was dave 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Dave's father a truck driver?\t	t
N00200056	who like the_color_pink	AFN3Y0	q-and-a-exam	WH	who like the color pink?	f
N00200042	did mindy born in jiayi	AFN3Y0	q-and-a-exam	YN	Did Mindy born in Jiayi?	f
N00200030	was jeff 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Jeff's father a truck driver?\t	t
N00200037	who was born in hukou	AFN3Y0	q-and-a-exam	WH	Who was born in Hukou?	t
N00200008	did alex live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Alex live in Hsinchu?	t
N00200036	did mindy have a sister	AFN3Y0	q-and-a-exam	YN	Did Mindy have a sister?\t	t
N01202004	who was born in taoyuan	AFN3Y0	q-and-a-exam	WH	who was born in Taoyuan	t
N00200025	did shane live jiayi	AFN3Y0	q-and-a-exam	YN	DId Shane live JIayi?	f
N01202001	cindy was born in jiayi	AFN3Y0	q-and-a-exam	YN	Cindy was born in Jiayi.	t
N01203003	who liked to jogging	AFN3Y0	q-and-a-exam	WH	Who liked to jogging?	f
N00200042	did cindy was born in jiayi	AFN3Y0	q-and-a-exam	YN	Did Cindy was born in Jiayi?	f
N00200017	where did alex live	AFN3Y0	q-and-a-exam	WH	Where did Alex live?	t
N00200029	who liked jogging	AFN3Y0	q-and-a-exam	WH	Who liked jogging ?	t
N00200030	was mindy 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Mindy's father a truck driver?\t	t
N00200042	was cindy born in jiayi	AFN3Y0	q-and-a-exam	YN	Was Cindy born in Jiayi?	t
N00200025	did kelly like japanese	AFN3Y0	q-and-a-exam	YN	DId Kelly like japanese?	t
N00200030	was vicky 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Vicky's father a truck_driver?\t	t
N00200037	who had a cat	AFN3Y0	q-and-a-exam	WH	Who had a cat?	t
N00200017	did neil born in nantou	AFN3Y0	q-and-a-exam	YN	Did Neil born in Nantou	f
N00200042	did cindy live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Cindy live in Hsinchu?	t
N00200055	did kelly like pizza	AFN3Y0	q-and-a-exam	YN	Did Kelly like pizza?	t
N00200030	was cindy 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Cindy's father a truck_driver?\t	t
N00200056	who was a student	AFN3Y0	q-and-a-exam	WH	who was a student?	t
N00200036	did shane like hsiao_ching-teng	AFN3Y0	q-and-a-exam	YN	Did shane like Hsiao_Ching-teng?	t
N00200043	did alex like jogging	AFN3Y0	q-and-a-exam	YN	Did Alex like jogging?	t
N01202004	who was born in jiayi	AFN3Y0	q-and-a-exam	WH	who was born in Jiayi?	t
N00200055	did shane live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Shane live in Jiayi?	t
N00200001	neil 's father was a truck_driver	AFN3Y0	q-and-a-exam	YN	Neil's father was a truck_driver?	t
N00200008	was alex a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Alex a student in Minghsin University?	t
N00200030	was lextar 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Lextar's father a truck driver?\t	t
N00200017	was dave a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Dave a student in Minghsin University	t
N00200054	was a woman who lived in hsinchu a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was a woman who lived in Hsinchu a student in Minghsin University?\t	t
N00200029	did cindy liked reading	AFN3Y0	q-and-a-exam	WH	Did Cindy liked reading?	f
N00200009	did shane live in hsinchu	AFN3Y0	q-and-a-exam	YN	\tDid Shane live in Hsinchu?	t
N00200056	who was a teacher	AFN3Y0	q-and-a-exam	WH	who was a teacher?	t
N00200036	did mindy like pizza	AFN3Y0	q-and-a-exam	YN	Did Mindy like pizza?\t	t
N00200001	was mindy a student	AFN3Y0	q-and-a-exam	YN	was Mindy a student ?	t
N00200030	was rena 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Rena's father a truck driver?\t	t
N01202001	who live in hsinchu	AFN3Y0	q-and-a-exam	WH	Who live in Hsinchu?	f
N00200009	did dave like making_friends	AFN3Y0	q-and-a-exam	YN	Did Dave like making_friends?	t
N01202004	who lived in nantou	AFN3Y0	q-and-a-exam	WH	who lived in Nantou?	t
N00200055	did mindy have sister	AFN3Y0	q-and-a-exam	YN	Did Mindy have sister	f
N00200054	was a man who had a sister in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was a man who had a sister in Minghsin University?	t
N00200030	was jeff born in america	AFN3Y0	q-and-a-exam	YN	Was Jeff born in America?	t
N00200009	shane lived in jiayi didn't he	AFN3Y0	q-and-a-exam	YN	Shane lived in Jiayi, didn't he?	t
N00200001	cindy liked playing_the_piano	AFN3Y0	q-and-a-exam	YN	Cindy liked playing_the_piano 	t
N00200036	did dave like jogging	AFN3Y0	q-and-a-exam	YN	Did Dave like jogging?	t
N00200054	shane liked jogging didn't he	AFN3Y0	q-and-a-exam	YN	Shane liked jogging, didn't he?\t	t
N00200055	did neil like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Neil like playing the piano?	t
N00200030	was cindy born in america	AFN3Y0	q-and-a-exam	YN	Was Cindy born in America?	t
N00200017	did dave have a cat	AFN3Y0	q-and-a-exam	YN	Did Dave have a cat?	t
N00200030	was rena born in america	AFN3Y0	q-and-a-exam	YN	Was Rena born in America?	t
N00200054	some man who was born in nantou liked jogging didn't he	AFN3Y0	q-and-a-exam	YN	Some man who was born in Nantou liked jogging, didn't he?\t	t
N01202004	shane liked jeremy_lin	AFN3Y0	q-and-a-exam	YN	Shane liked Jeremy_Lin 	t
N00200001	was cindy playing_the_piano	AFN3Y0	q-and-a-exam	YN	was cindy playing_the_piano ?	t
N00200030	was alex born in america	AFN3Y0	q-and-a-exam	YN	Was Alex born in America?	t
N00200036	did mindy like jogging	AFN3Y0	q-and-a-exam	YN	Did Mindy like jogging?	t
N00200055	did neil live in nantou	AFN3Y0	q-and-a-exam	YN	Did Neil live in Nantou	t
N00200008	who liked to travel	AFN3Y0	q-and-a-exam	WH	Who liked to travel?	f
N00200054	some men who were born in nantou liked jogging didn't they	AFN3Y0	q-and-a-exam	YN	Some men who were born in Nantou liked jogging, didn't they?	t
N01202004	shane liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	YN	Shane liked Jeremy_Lin , didn't he?	t
N00200030	was lextar born in america	AFN3Y0	q-and-a-exam	YN	Was Lextar born in America?	t
N00200051	who lived in hsinchu	AFN3Y0	q-and-a-exam	WH	Who lived in Hsinchu?	t
N00200025	did mindy like japanese	AFN3Y0	q-and-a-exam	YN	DId MIndy like Japanese?	t
N00200055	did shane like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Shane like Jeremy Lin?	t
N00200009	did kelly like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Kelly like playing the piano?	t
N00200034	did rena like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Rena like playing the piano?	t
N00200030	was kelly born in america	AFN3Y0	q-and-a-exam	YN	Was Kelly born in America?	t
N00200008	who liked travel	AFN3Y0	q-and-a-exam	WH	Who liked travel?	t
N00200036	did mindy live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Mindy live in Jiayi?	t
N00200030	was dave born in america	AFN3Y0	q-and-a-exam	YN	Was Dave born in America?	t
N00200017	did dave like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Dave like Jeremy Lin?	t
N96200030	who have cat mi_mi	AFN3Y0	q-and-a-exam	WH	Who have cat mi_mi?	f
N00200036	did dave live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Dave live in Jiayi?	t
N00200030	was shane born in america	AFN3Y0	q-and-a-exam	YN	Was Shane born in America?	t
N00200034	did jeff live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Jeff live in Jiayi?	t
N00200025	did shane live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did shane live in Taoyuan?	t
N00200042	who liked playing_the_piano	AFN3Y0	q-and-a-exam	WH	Who liked playing the piano?	t
N00200031	was cindy born in taoyuan	AFN3Y0	q-and-a-exam	YN	Was Cindy born in Taoyuan?\t	t
N00200055	did shane have a sister	AFN3Y0	q-and-a-exam	YN	Did Shane have a sister?	t
N00200001	mindy had a sister	AFN3Y0	q-and-a-exam	YN	Mindy had a sister?	t
N00200030	was jeremy_lin born in america	AFN3Y0	q-and-a-exam	YN	Was Jeremy Lin born in America?	t
N01202004	did shane like cat	AFN3Y0	q-and-a-exam	Tag	Did shane like cat 	f
N00200051	did rena have a cat	AFN3Y0	q-and-a-exam	YN	Did Rena have a cat?	t
N00200017	did alex like hsiao_ching-teng	AFN3Y0	q-and-a-exam	YN	Did Alex like Hsiao_Ching-teng ?	t
N96200030	who had cat mi_mi	AFN3Y0	q-and-a-exam	WH	Who had cat mi_mi?	f
N00200043	did alex like pizza	AFN3Y0	q-and-a-exam	Tag	Did Alex like pizza	t
N00200001	did mindy had a brother	AFN3Y0	q-and-a-exam	YN	Did Mindy had a brother	f
N00200056	who like japanese	AFN3Y0	q-and-a-exam	WH	who like Japanese	f
N00200037	did dave studied in minghsin_university	AFN3Y0	q-and-a-exam	YN	Did Dave studied in Minghsin_University?	f
N00200055	did alex have a sister	AFN3Y0	q-and-a-exam	YN	Did Alex have a sister?	t
N00200036	did mindy like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Mindy like playing the piano?	t
N00200030	was jeff a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Jeff a student in Minghsin University.	t
N00200009	did shane like pizza	AFN3Y0	q-and-a-exam	YN	Did Shane like pizza?\t	t
N00200036	did dave like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Dave like playing the piano?	t
N00200030	was shane a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Shane a student in Minghsin University.	t
N00200051	did mindy like listening_to_music	AFN3Y0	q-and-a-exam	YN	Did Mindy like listening to music?	t
N00200055	did neil have a brother	AFN3Y0	q-and-a-exam	YN	Did Neil have a brother	t
N01203003	did jeff live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Jeff live in Taoyuan?	t
N00200030	was rena a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Rena a student in Minghsin University.	t
N00200037	did dr_bean born in america	AFN3Y0	q-and-a-exam	YN	Did Dr_Bean born in America?	f
N00200025	did shane live in nantou	AFN3Y0	q-and-a-exam	YN	Did shane live in Nantou?	t
N00200030	was lextar a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Lextar a student in Minghsin University?	t
N96200030	neil liked jogging	AFN3Y0	q-and-a-exam	YN	Neil liked jogging?	t
N00200042	who liked study japanese	AFN3Y0	q-and-a-exam	WH	Who liked study Japanese?	f
N00200029	was cindy liked listening_to_music wasn't she	AFN3Y0	q-and-a-exam	WH	Was Cindy liked listening to music , wasn't she ?	f
N00200036	did dave like pizza	AFN3Y0	q-and-a-exam	YN	Did Dave like pizza?	t
N00200009	did cindy like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Cindy like playing the piano?\t	t
N00200001	didn't mindy like playing_the_piano	AFN3Y0	q-and-a-exam	YN	didn't Mindy like playing_the_piano?	t
N00200054	mindy was born in taoyuan wasn't she	AFN3Y0	q-and-a-exam	YN	Mindy was born in Taoyuan, wasn't she?\t	t
N00200030	was neil a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Neil a student in Minghsin University?	t
N00200030	was cindy a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Cindy a student in Minghsin University?	t
N00200051	did rena want to work in america	AFN3Y0	q-and-a-exam	YN	Did Rena want to work in America?	t
N00200036	did neil like pizza	AFN3Y0	q-and-a-exam	YN	Did Neil like pizza?	t
N00200001	didn't mindy 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	didn't Mindy's father a truck driver?	f
N00200037	did rena like cat	AFN3Y0	q-and-a-exam	YN	Did Rena like cat?	f
N00200036	did rena like pizza	AFN3Y0	q-and-a-exam	YN	Did Rena like pizza?	t
N00200056	was dr_bean a student	AFN3Y0	q-and-a-exam	YN	was Dr_Bean a student	t
N00200017	alex lived in jiayi didn't he	AFN3Y0	q-and-a-exam	Tag	Alex lived in Jiayi, didn't he? 	t
N00200008	who liked a japanese	AFN3Y0	q-and-a-exam	WH	Who liked a japanese?	f
N00200051	did vicky live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Vicky live in Hsinchu?	t
N00200030	was kelly a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Kelly a student in Minghsin University.	t
N00200056	was dr_bean a teacher	AFN3Y0	q-and-a-exam	YN	was Dr_Bean a teacher	t
N00200034	did neil live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Neil live in Hsinchu?	t
N00200042	who like english	AFN3Y0	q-and-a-exam	WH	who like English?	f
N00200017	did alex like japanese	AFN3Y0	q-and-a-exam	YN	Did Alex like japanese	t
N00200029	who liked drawing	AFN3Y0	q-and-a-exam	WH	Who liked drawing ?	t
N00200001	didn't mindy had a cat	AFN3Y0	q-and-a-exam	YN	didn't Mindy had a cat?	f
N00200030	was vicky a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Vicky a student in Minghsin University?	t
N00200056	was mindy a teacher	AFN3Y0	q-and-a-exam	YN	was Mindy a teacher	t
N00200037	was dave studied in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Dave studied in Minghsin_University?	f
N00200051	did vicky like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Vicky like hello kitty?	t
N00200031	who was a babysitter	AFN3Y0	q-and-a-exam	WH	Who was a babysitter?\t	t
N00200008	who liked japanese	AFN3Y0	q-and-a-exam	WH	Who liked japanese?	t
N00200030	was jeremy_lin a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Jeremy Lin a student in Minghsin University?	t
N00200036	did rena like japanese	AFN3Y0	q-and-a-exam	YN	Did Rena like Japanese?\t	t
N00200029	where did cindy lived	AFN3Y0	q-and-a-exam	WH	Where did Cindy lived?	f
N00200009	did dave like cat	AFN3Y0	q-and-a-exam	YN	Did Dave like cat?	f
N00200056	was rena a student	AFN3Y0	q-and-a-exam	YN	was Rena a student	t
N00200008	who liked the_color_pink	AFN3Y0	q-and-a-exam	WH	Who liked the color pink	t
N00200056	was rena a teacher	AFN3Y0	q-and-a-exam	YN	was Rena a teacher	t
N00200036	did dave like japanese	AFN3Y0	q-and-a-exam	YN	Did Dave like Japanese?\t	t
N00200017	dave liked travel didn't he	AFN3Y0	q-and-a-exam	Tag	Dave liked travel, didn't he?	t
N00200051	did alex want to work in america	AFN3Y0	q-and-a-exam	YN	Did Alex want to work in America?	t
N00200030	did dave live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Dave live in Hsinchu?\t	t
N00200056	was alex a student	AFN3Y0	q-and-a-exam	YN	was Alex a student	t
N00200001	wasn't neil like music	AFN3Y0	q-and-a-exam	YN	Wasn't Neil like music?	f
N00200030	did jeremy_lin live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Jeremy Lin live in Hsinchu?\t	t
N00200056	did rena like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Rena like the color pink	t
N00200051	did jeff have a cat	AFN3Y0	q-and-a-exam	YN	Did Jeff have a cat?	t
N00200017	did alex had a sister	AFN3Y0	q-and-a-exam	Tag	Did Alex had a sister?	f
N00200042	who liked listening_to_music	AFN3Y0	q-and-a-exam	WH	Who liked listening_to_music?	t
N00200030	did jeff live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Jeff live in Hsinchu?	t
N00200008	who liked reading	AFN3Y0	q-and-a-exam	WH	Who liked reading?	t
N00200001	didn't jeff like jogging	AFN3Y0	q-and-a-exam	YN	Didn't Jeff like jogging?	t
N00200036	did rena live in nantou	AFN3Y0	q-and-a-exam	YN	Did Rena live in Nantou?	t
N00200009	did alex like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Alex like Jeremy Lin?	t
N01203003	did rena like the cat	AFN3Y0	q-and-a-exam	YN	Did Rena like the cat ?	t
N00200030	was a man whose father was a truck_driver have no brother	AFN3Y0	q-and-a-exam	YN	Was a man whose father was a truck driver have no brother?	f
N00200017	was shane 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Shane's father a truck driver	t
N01202004	did shane had sister	AFN3Y0	q-and-a-exam	Tag	Did Shane had sister?	f
N00200009	did rena like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Rena like Jeremy Lin?	t
N00200036	did dave live in nantou	AFN3Y0	q-and-a-exam	YN	Did Dave live in Nantou?	t
N00200008	who liked swimming	AFN3Y0	q-and-a-exam	WH	Who liked swimming?	t
N00200029	was vicky 's mother a babysitter wasn't it	AFN3Y0	q-and-a-exam	WH	Was Vicky's mother a babysitter , wasn't it ?	f
N00200001	didn't mindy like jogging	AFN3Y0	q-and-a-exam	YN	didn't Mindy like jogging?	t
N00200009	did kelly like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Kelly like Jeremy Lin?	t
N00200034	did mindy like making_friends	AFN3Y0	q-and-a-exam	YN	Did Mindy like making_friends?	t
N00200036	did kelly live in nantou	AFN3Y0	q-and-a-exam	YN	Did Kelly live in Nantou?	t
N00200017	did shane live in taiwan	AFN3Y0	q-and-a-exam	YN	Did Shane live in Taiwan?	t
N00200042	where did kelly work	AFN3Y0	q-and-a-exam	WH	Where did Kelly work?	t
N00200009	did cindy like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Cindy like Jeremy Lin?	t
N00200030	was dave born in nantou	AFN3Y0	q-and-a-exam	YN	Was Dave born in Nantou?	t
N00200056	did mindy liked listening_to_music	AFN3Y0	q-and-a-exam	YN	did Mindy liked listening to music	f
N00200029	who born in 1994	AFN3Y0	q-and-a-exam	WH	Who born in 1994 ?	f
N01202004	alex student in minghsin_university	AFN3Y0	q-and-a-exam	Tag	Alex student in Minghsin University?\t 	f
N00200001	didn't shane like jogging	AFN3Y0	q-and-a-exam	YN	didn't shane like jogging?	t
N00200030	was lextar born in nantou	AFN3Y0	q-and-a-exam	YN	Was Lextar born in Nantou?	t
N01203003	did mindy as a teacher	AFN3Y0	q-and-a-exam	YN	Did Mindy as a teacher?	f
N00200001	didn't cindy like jogging	AFN3Y0	q-and-a-exam	YN	didn't Cindy like jogging?	t
N00200009	did cindy live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Cindy live in Taoyuan?\t	t
N00200030	was jeff born in nantou	AFN3Y0	q-and-a-exam	YN	Was Jeff born in Nantou?	t
N00200034	did rena live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Rena live in Jiayi?	t
N01202004	did rena lived in america	AFN3Y0	q-and-a-exam	Tag	did Rena lived in America?	f
N00200043	was kelly 's father a truck_driver	AFN3Y0	q-and-a-exam	WH	was kelly's father a truck driver?	t
N00200051	did rena have a sister	AFN3Y0	q-and-a-exam	YN	Did Rena have a sister?	t
N00200009	did alex live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Alex live in Taoyuan?\t	t
N00200030	was rena born in nantou	AFN3Y0	q-and-a-exam	YN	Was Rena born in Nantou?	t
N00200008	who liked shopping	AFN3Y0	q-and-a-exam	WH	Who liked shopping?	t
N00200001	didn't alex like jogging	AFN3Y0	q-and-a-exam	YN	didn't Alex like jogging?	t
N00200034	did alex like making_friends	AFN3Y0	q-and-a-exam	YN	Did Alex like making_friends?	t
N00200009	did dave live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Dave live in Taoyuan?\t	t
N00200030	was alex born in nantou	AFN3Y0	q-and-a-exam	YN	Was Alex born in Nantou?	t
N00200030	was cindy born in nantou	AFN3Y0	q-and-a-exam	YN	Was Cindy born in Nantou?	t
N00200034	did cindy like making_friends	AFN3Y0	q-and-a-exam	YN	Did Cindy like making_friends?	t
N00200054	dave liked jogging didn't he	AFN3Y0	q-and-a-exam	YN	Dave liked jogging, didn't he?\t	t
N01202004	who was born in 1994	AFN3Y0	q-and-a-exam	WH	Who was born in 1994?	t
N00200036	did rena have a brother	AFN3Y0	q-and-a-exam	YN	Did Rena have a brother?	t
N00200030	was mindy born in nantou	AFN3Y0	q-and-a-exam	YN	Was Mindy born in Nantou?	t
N00200009	did vicky live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Vicky live in Taoyuan?\t	t
N00200034	did alex live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Alex live in Jiayi?	t
N00200001	didn't rena like jogging	AFN3Y0	q-and-a-exam	YN	didn't Rena like jogging?	t
N01203003	was neil a student	AFN3Y0	q-and-a-exam	YN	Was Neil a student?	t
N00200036	did shane have a brother	AFN3Y0	q-and-a-exam	YN	Did Shane have a brother?	t
N00200030	was shane born in nantou	AFN3Y0	q-and-a-exam	YN	Was Shane born in Nantou?	t
N00200029	did shane lived in taoyuan	AFN3Y0	q-and-a-exam	WH	Did Shane lived in Taoyuan ?	f
N00200030	was vicky born in nantou	AFN3Y0	q-and-a-exam	YN	Was Vicky born in Nantou?	t
N00200036	did kelly have a brother	AFN3Y0	q-and-a-exam	YN	Did Kelly have a brother?	t
N00200056	did dr_bean live in hsinchu	AFN3Y0	q-and-a-exam	YN	did Dr_Bean live in Hsinchu	t
N00200009	was cindy a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Cindy a truck_driver ?\t	t
N00200001	didn't dr_bean like jogging	AFN3Y0	q-and-a-exam	YN	didn't  Dr_Bean like jogging?	t
N00200009	was rena a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Rena a truck_driver ?\t	t
N00200051	was mindy lived in america	AFN3Y0	q-and-a-exam	YN	Was Mindy lived in America?	f
N00200017	where did shane live	AFN3Y0	q-and-a-exam	WH	Where did Shane live ?	t
N00200056	was cindy a student	AFN3Y0	q-and-a-exam	YN	was Cindy a student	t
N00200031	did vicky live in jiayi	AFN3Y0	q-and-a-exam	Tag	Did Vicky live in Jiayi?\t	t
N00200009	was kelly a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Kelly a truck_driver ?\t	t
N00200051	did mindy live in america	AFN3Y0	q-and-a-exam	YN	Did Mindy live in America?	t
N00200054	did jeff like pizza	AFN3Y0	q-and-a-exam	YN	Did Jeff like pizza?	t
N00200030	was dr_bean born in nantou	AFN3Y0	q-and-a-exam	YN	Was Dr Bean born in Nantou?	t
N00200056	was cindy a teacher	AFN3Y0	q-and-a-exam	YN	was Cindy a teacher	t
N00200001	did jeff was born in america	AFN3Y0	q-and-a-exam	YN	Did Jeff was born in America?	f
N01203003	was neil lived in nantou	AFN3Y0	q-and-a-exam	YN	Was Neil lived in Nantou?	f
N00200034	did cindy like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Cindy like hello_kitty ?	t
N96200030	jeff liked making_friends	AFN3Y0	q-and-a-exam	YN	Jeff liked making_friends?	t
N00200009	was shane a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Shane a truck_driver ?\t	t
N00200030	was jeremy_lin born in nantou	AFN3Y0	q-and-a-exam	YN	Was Jeremy Lin born in Nantou?	t
N00200051	did jeff live in america	AFN3Y0	q-and-a-exam	YN	Did Jeff live in America?	t
N00200056	was dave a student	AFN3Y0	q-and-a-exam	YN	was Dave a student	t
N00200029	rena liked cats wasn't she	AFN3Y0	q-and-a-exam	WH	Rena liked cats , wasn't she ?	f
N00200001	shane 's father was a truck_driver	AFN3Y0	q-and-a-exam	YN	Shane's father was a truck_driver?	t
N00200054	did jeff live in nantou	AFN3Y0	q-and-a-exam	YN	Did Jeff live in Nantou	t
N00200037	rena had a brother didn't she	AFN3Y0	q-and-a-exam	Tag	Rena had a brother, didn't she?	t
N00200034	did alex like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Alex like hello_kitty?	t
N00200056	was dave a teacher	AFN3Y0	q-and-a-exam	YN	was Dave a teacher	t
N01203003	did neil lived in nantou	AFN3Y0	q-and-a-exam	YN	DId Neil lived in Nantou?	f
N00200008	who liked singing	AFN3Y0	q-and-a-exam	WH	Who liked singing?	t
N00200009	did shane like japanese	AFN3Y0	q-and-a-exam	YN	Did Shane like Japanese?\t	t
N00200034	did neil like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Neil like hello_kitty?	t
N00200001	was mindy 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Mindy's mother a babysitter?	t
N00200034	did mindy like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Mindy like hello_kitty?	t
N00200037	rena was a women wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a women, wasn't she?	f
N00200056	was neil a teacher	AFN3Y0	q-and-a-exam	YN	was Neil a teacher	t
N01203003	was dave lived in america	AFN3Y0	q-and-a-exam	YN	Was Dave lived in America?	f
N00200031	cindy liked travel didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked travel, didn't she?\t	t
N00200009	did cindy like japanese	AFN3Y0	q-and-a-exam	YN	Did Cindy like Japanese?\t	t
N00200034	did jeff like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Jeff like hello_kitty?	t
N00200017	did avril_lavigne live in hsinchu	AFN3Y0	q-and-a-exam	Tag	Did Avril_Lavigne  live in Hsinchu? 	t
N00200001	was cindy 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Cindy's mother a babysitter?	t
N00200056	was jeff a student	AFN3Y0	q-and-a-exam	YN	was Jeff a student	t
N00200037	rena was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a woman, wasn't she?	t
N00200034	did kelly like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Kelly like hello_kitty?	t
N00200056	was jeff a teacher	AFN3Y0	q-and-a-exam	YN	was Jeff a teacher	t
N00200001	was vicky 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Vicky's mother a babysitter?	t
N00200017	did hsiao_ching-teng live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Hsiao_Ching-teng  live in Hsinchu? 	t
N96200030	jeff was liked making_friends	AFN3Y0	q-and-a-exam	YN	Jeff was liked making_friends?	f
N00200036	did mindy like cat	AFN3Y0	q-and-a-exam	YN	Did Mindy like cat?	f
N00200031	cindy liked cat didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked cat, didn't she?\t	f
N00200034	did shane like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Shane like hello_kitty?	t
N00200001	was jeff 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Jeff's mother a babysitter?	t
N00200054	did mindy like jeremy_lin	AFN3Y0	q-and-a-exam	YN	Did Mindy like Jeremy Lin?	t
N00200037	cindy was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Cindy was a woman, wasn't she?	t
N00200017	did hukou live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Hukou  live in Hsinchu?	t
N00200031	cindy liked jogging didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked jogging, didn't she?\t	t
N00200051	did alex like the_color_pink	AFN3Y0	q-and-a-exam	YN	Did Alex like the color pink?	t
N00200030	did cindy like pizza	AFN3Y0	q-and-a-exam	YN	Did Cindy like pizza?\t	t
N00200001	was neil 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Neil's mother a babysitter	t
N00200042	was alex 's mother a babysitter	AFN3Y0	q-and-a-exam	Tag	Was Alex's mother a babysitter?	t
N01203003	did rena lived in taiwan	AFN3Y0	q-and-a-exam	YN	DId Rena lived in Taiwan?	f
N00200034	did alex like shopping	AFN3Y0	q-and-a-exam	YN	Did Alex like shopping?	t
N00200017	did lextar live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Lextar  live in Hsinchu?	t
N00200009	did shane like making_friends	AFN3Y0	q-and-a-exam	YN	Did Shane like making_friends?	t
N96200030	jeff liked singing	AFN3Y0	q-and-a-exam	YN	Jeff liked singing?	t
N00200037	vicky was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was a woman, wasn't she?	t
N00200031	cindy liked swimming didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked swimming, didn't she?\t	t
N00200034	did shane like shopping	AFN3Y0	q-and-a-exam	YN	Did Shane like shopping?	t
N00200054	did rena like hsiao_ching-teng	AFN3Y0	q-and-a-exam	YN	Did Rena like Hsiao_Ching-teng?\t	t
N00200001	was dave 's mother a babysitter	AFN3Y0	q-and-a-exam	YN	Was Dave's mother a babysitter	t
N00200036	did rena live in taoyuan	AFN3Y0	q-and-a-exam	YN	Did Rena live in Taoyuan?	t
N00200017	did taiwan live in hsinchu	AFN3Y0	q-and-a-exam	YN	Did Taiwan live in Hsinchu?	t
N00200008	did vicky have father	AFN3Y0	q-and-a-exam	YN	Did Vicky have father?	f
N00200037	mindy was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Mindy was a woman, wasn't she?	t
N01203003	did rena live in taiwan	AFN3Y0	q-and-a-exam	YN	Did Rena live in Taiwan?	t
N00200009	did vicky like making_friends	AFN3Y0	q-and-a-exam	YN	Did Vicky like making_friends?	t
N01202004	was dave 's father a teacher	AFN3Y0	q-and-a-exam	YN	Was Dave's father a teacher?\t 	t
N00200034	did rena like shopping	AFN3Y0	q-and-a-exam	YN	Did Rena like shopping?	t
N00200054	did rena live in america	AFN3Y0	q-and-a-exam	YN	Did Rena live in America?	t
N00200031	cindy liked watching_tv didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked watching TV, didn't she?\t	t
N00200029	who liked basketball	AFN3Y0	q-and-a-exam	WH	Who liked basketball ?	t
N00200017	did lextar 's father a truck_driver	AFN3Y0	q-and-a-exam	YN	Did Lextar's father a truck driver?	f
N00200009	did kelly like making_friends	AFN3Y0	q-and-a-exam	YN	Did Kelly like making_friends?	t
N00200037	kelly was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was a woman, wasn't she?	t
N00200030	did jeremy_lin like pizza	AFN3Y0	q-and-a-exam	YN	Did Jeremy Lin like pizza?\t	t
N96200030	jeff liked to singing	AFN3Y0	q-and-a-exam	YN	Jeff liked to singing?	f
N00200051	did rena live in hukou	AFN3Y0	q-and-a-exam	YN	Did Rena live in Hukou?	t
N00200025	shane lived in nantou didn't he	AFN3Y0	q-and-a-exam	Tag	Shane lived in nantou, didn't he ?	t
N00200034	did mindy like shopping	AFN3Y0	q-and-a-exam	YN	Did Mindy like shopping?	t
N00200009	did jeff like making_friends	AFN3Y0	q-and-a-exam	YN	Did Jeff like making_friends?	t
N00200056	was vicky a student	AFN3Y0	q-and-a-exam	YN	was Vicky a student	t
N00200031	cindy liked reading didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked reading, didn't she?\t	t
N00200001	was alex a design_assistant	AFN3Y0	q-and-a-exam	YN	was Alex a design_assistant?	t
N00200030	did avril_lavigne like pizza	AFN3Y0	q-and-a-exam	YN	Did Avril Lavigne like pizza?	t
N00200037	lextar was a woman wasn't she	AFN3Y0	q-and-a-exam	Tag	Lextar was a woman, wasn't she?	f
N00200009	did rena like making_friends	AFN3Y0	q-and-a-exam	YN	Did Rena like making_friends?	t
N01202004	was cindy 's mother a student	AFN3Y0	q-and-a-exam	YN	Was cindy's mother a student?\t 	t
N00200034	did dave like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Dave like hello_kitty?	t
N00200008	did vicky like shopping	AFN3Y0	q-and-a-exam	YN	Did Vicky like shopping?	t
N00200056	was vicky a teacher	AFN3Y0	q-and-a-exam	YN	was Vicky a teacher	t
N00200031	cindy liked exercising didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked exercising, didn't she?\t	t
N00200017	lextar 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	 Lextar's father was a truck driver, wasn't he?	t
N00200001	was cindy a design_assistant	AFN3Y0	q-and-a-exam	YN	was Cindy a design_assistant	t
N00200037	neil was a man wasn't he	AFN3Y0	q-and-a-exam	Tag	Neil was a man, wasn't he?	t
N00200030	did dr_bean like pizza	AFN3Y0	q-and-a-exam	YN	Did Dr Bean like pizza?	t
N00200043	was kelly 's father a farmer	AFN3Y0	q-and-a-exam	YN	was kelly's father a farmer?	t
N00200031	cindy liked singing didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked singing, didn't she?\t	t
N00200008	did alex like travel	AFN3Y0	q-and-a-exam	YN	Did Alex like travel?	t
N00200017	neil 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	Neil 's father was a truck driver, wasn't he	t
N00200056	was shane a student	AFN3Y0	q-and-a-exam	YN	was Shane a student	t
N00200001	was neil a design_assistant	AFN3Y0	q-and-a-exam	YN	was Neil a design_assistant	t
N00200037	dave was a man wasn't he	AFN3Y0	q-and-a-exam	Tag	Dave was a man, wasn't he?	t
N00200025	dave live in hsinchu didn't he	AFN3Y0	q-and-a-exam	Tag	Dave live in Hsinchu , didn't he?	f
N00200034	did dave like shopping	AFN3Y0	q-and-a-exam	YN	Did Dave like shopping?	t
N00200009	did cindy live in hukou	AFN3Y0	q-and-a-exam	YN	Did Cindy live in Hukou?\t	t
N00200054	rena liked travel didn't she	AFN3Y0	q-and-a-exam	YN	Rena liked travel, didn't she?	t
N00200056	was shane a teacher	AFN3Y0	q-and-a-exam	YN	was Shane a teacher	t
N00200017	jeremy_lin 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy_Lin 's father was a truck driver, wasn't he?	t
N00200030	did alex like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Alex like playing the piano?\t	t
N00200009	did dave live in hukou	AFN3Y0	q-and-a-exam	YN	Did Dave live in Hukou?\t	t
N00200001	was shane a design_assistant	AFN3Y0	q-and-a-exam	YN	was Shane a design_assistant	t
N00200030	did lextar like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Lextar like playing the piano?\t	t
N01203003	was dr_bean jeff 's teacher	AFN3Y0	q-and-a-exam	YN	Was Dr_Bean Jeff's teacher?	t
N00200042	some woman who was born in nantou liked jogging didn't she	AFN3Y0	q-and-a-exam	Tag	Some woman who was born in Nantou liked jogging, didn't she?	t
N00200017	jeff 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeff's father was a truck driver, wasn't he?	t
N00200037	shane was a man wasn't he	AFN3Y0	q-and-a-exam	Tag	Shane was a man, wasn't he?	t
N00200009	did vicky live in hukou	AFN3Y0	q-and-a-exam	YN	Did Vicky live in Hukou?\t	t
N00200031	cindy liked drawing didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked drawing, didn't she?\t	t
N00200001	was jeff a design_assistant	AFN3Y0	q-and-a-exam	YN	was Jeff a design_assistant	t
N00200017	alex 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	Alex's father was a truck driver, wasn't he	t
N00200008	did shane like singing	AFN3Y0	q-and-a-exam	YN	Did Shane like singing?	t
N00200009	did mindy live in hukou	AFN3Y0	q-and-a-exam	YN	Did Mindy live in Hukou?\t	t
N00200056	did rena like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Rena like Avril_Lavigne	t
N00200029	where did jeff lived in	AFN3Y0	q-and-a-exam	WH	Where did Jeff lived in ?	f
N00200009	did jeff live in hukou	AFN3Y0	q-and-a-exam	YN	Did Jeff live in Hukou?\t	t
N00200030	did jeff like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Jeff like playing the piano?\t	t
N00200017	avril_lavigne 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	Avril_Lavigne 's father was a truck driver, wasn't he	t
N00200001	was rena a design_assistant	AFN3Y0	q-and-a-exam	YN	was Rena a design_assistant	t
N00200037	jeff was a man wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeff was a man, wasn't he?	t
N96200030	was mindy cat mi_mi	AFN3Y0	q-and-a-exam	YN	was Mindy cat mi_mi?	f
N00200009	did vicky live in america	AFN3Y0	q-and-a-exam	YN	Did Vicky live in America?\t	t
N00200042	kelly liked jeremy_lin didn't she	AFN3Y0	q-and-a-exam	Tag	Kelly liked Jeremy_Lin , didn't she?	t
N00200056	did mindy like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Mindy like Avril_Lavigne	t
N00200001	was dr_bean a design_assistant	AFN3Y0	q-and-a-exam	YN	was Dr_Bean a design_assistant	t
N01203003	did dr_bean a teacher	AFN3Y0	q-and-a-exam	YN	Did Dr_Bean a teacher?	f
N00200017	1994 's father was a truck_driver wasn't he	AFN3Y0	q-and-a-exam	Tag	1994's father was a truck driver, wasn't he?	t
N00200054	did rena have a father	AFN3Y0	q-and-a-exam	YN	Did Rena have a father?	t
N00200042	alex liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	Tag	Alex liked Jeremy_Lin , didn't he?	t
N00200030	did dr_bean like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Dr Bean like playing the piano?\t	t
N00200043	was neil a farmer	AFN3Y0	q-and-a-exam	YN	was neil a farmer?	t
N00200056	did alex like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Alex like Avril_Lavigne	t
N00200009	did alex live in america	AFN3Y0	q-and-a-exam	YN	Did Alex live in America?\t	t
N01202004	was shane 's sister a design_assistant	AFN3Y0	q-and-a-exam	YN	Was Shane's sister a design assistant?\t 	t
N00200051	did rena like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Rena like going to the movies?	t
N00200030	did avril_lavigne like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Avril Lavigne like playing the piano?\t	t
N00200042	jeff liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	Tag	Jeff liked Jeremy_Lin , didn't he?	t
N00200056	did cindy like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Cindy like Avril_Lavigne	t
N00200009	did shane live in america	AFN3Y0	q-and-a-exam	YN	Did Shane live in America?\t	t
N00200037	jeff was cindy 's father wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeff was Cindy's father, wasn't he	t
N00200043	was alex a farmer	AFN3Y0	q-and-a-exam	YN	was Alex a farmer?	t
N00200029	was a man who lived in taoyuan like jogging	AFN3Y0	q-and-a-exam	WH	Was a man  who lived in Taoyuan like jogging ?	f
N00200042	cindy liked jeremy_lin didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy liked Jeremy_Lin , didn't she?	t
N00200056	did neil like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Neil like Avril_Lavigne	t
N00200056	did dr_bean like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Avril_Lavigne	t
N96200030	was vicky cat mi_mi	AFN3Y0	q-and-a-exam	YN	Was vicky cat mi_mi?	f
N00200042	vicky liked jeremy_lin didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky liked Jeremy_Lin , didn't she?	t
N00200037	dave was cindy 's father wasn't he	AFN3Y0	q-and-a-exam	Tag	Dave was Cindy's father, wasn't he?	t
N00200043	was shane a farmer	AFN3Y0	q-and-a-exam	YN	was Shane a farmer?	t
N00200056	did vicky like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Vicky like Avril_Lavigne	t
N00200001	was jeff a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Jeff a_japanese_interpreter	t
N00200031	was cindy liked hello_kitty	AFN3Y0	q-and-a-exam	YN	Was Cindy liked hello kitty?	f
N00200056	did dave like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Dave like Avril_Lavigne	t
N00200051	who liked avril_lavigne	AFN3Y0	q-and-a-exam	WH	Who liked Avril Lavigne?	t
N00200042	neil liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked Jeremy_Lin , didn't he?	t
N00200029	who liked cats	AFN3Y0	q-and-a-exam	WH	Who liked cats ?	t
N00200017	1994 liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	1994  liked jogging, didn't he? 	f
N00200001	was shane a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Shane a_japanese_interpreter	t
N00200025	who was a student in minghsin_university	AFN3Y0	q-and-a-exam	WH	Who was a student in Minghsin University?\t	t
N00200031	was cindy a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Cindy a student of Minghsin University?\t	t
N00200009	did neil like english	AFN3Y0	q-and-a-exam	YN	Did Neil like English?\t	t
N00200001	was cindy a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Cindy a_japanese_interpreter	t
N00200042	dave liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	Tag	Dave liked Jeremy_Lin , didn't he?	t
N00200043	was kelly a farmer	AFN3Y0	q-and-a-exam	YN	was kelly a farmer?	t
N00200037	rena was dave 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was Dave's mother, wasn't she?	t
N00200051	where did rena want to work	AFN3Y0	q-and-a-exam	WH	Where did Rena want to work?	t
N00200009	did alex like english	AFN3Y0	q-and-a-exam	YN	Did Alex like English?\t	t
N01202004	was cindy liked playing_the_piano	AFN3Y0	q-and-a-exam	YN	Was cindy liked playing the piano ?\t 	f
N00200029	did shane like jogging didn't he	AFN3Y0	q-and-a-exam	WH	Did Shane like jogging , didn't he?	f
N00200031	was kelly a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Kelly a student of Minghsin University?\t	t
N00200009	did cindy like english	AFN3Y0	q-and-a-exam	YN	Did Cindy like English?\t	t
N00200001	was vicky a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Vicky  a_japanese_interpreter	t
N00200017	neil liked avril_lavigne didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked Avril_Lavigne , didn't he? 	t
N00200031	was vicky a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Vicky a student of Minghsin University?\t	t
N00200025	where did neil live	AFN3Y0	q-and-a-exam	WH	where did Neil live?	t
N00200043	was cindy a farmer	AFN3Y0	q-and-a-exam	YN	was cindy a farmer?	t
N00200054	was lextar born in jiayi	AFN3Y0	q-and-a-exam	YN	Was Lextar born in Jiayi?	t
N00200001	was rena a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Rena a_japanese_interpreter	t
N00200009	did dave like english	AFN3Y0	q-and-a-exam	YN	Did Dave like English?\t	t
N00200037	kelly was cindy 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was Cindy's mother, wasn't she?	t
N00200017	dr_bean liked avril_lavigne didn't he	AFN3Y0	q-and-a-exam	Tag	Dr_Bean  liked Avril_Lavigne , didn't he?	t
N00200009	did vicky like english	AFN3Y0	q-and-a-exam	YN	Did Vicky like English?\t	t
N00200031	was mindy a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Mindy a student of Minghsin University?\t	t
N00200001	was alex a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Alex a_japanese_interpreter	t
N00200054	did lextar like japanese	AFN3Y0	q-and-a-exam	YN	Did Lextar  like japanese	t
N00200017	hsiao_ching-teng liked avril_lavigne didn't he	AFN3Y0	q-and-a-exam	Tag	Hsiao_Ching-teng  liked Avril_Lavigne , didn't he?	t
N00200043	was dave a farmer	AFN3Y0	q-and-a-exam	YN	was Dave a farmer?	t
N96200030	did jeff had cat	AFN3Y0	q-and-a-exam	YN	Did Jeff had cat?	f
N00200001	was dave a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Dave a_japanese_interpreter	t
N00200008	did vicky like pizza	AFN3Y0	q-and-a-exam	YN	Did Vicky like pizza?	t
N00200037	shane was cindy 's father wasn't he	AFN3Y0	q-and-a-exam	Tag	Shane was Cindy's father, wasn't he?	t
N00200034	did neil like shopping	AFN3Y0	q-and-a-exam	YN	Did Neil like shopping?	t
N00200009	did rena like english	AFN3Y0	q-and-a-exam	YN	Did Rena like English?\t	t
N00200056	did alex born in 1994	AFN3Y0	q-and-a-exam	YN	did Alex born in 1994	f
N00200031	was dave a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Dave a student of Minghsin University?\t	t
N00200042	kelly was dave 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was Dave's mother, wasn't she?	t
N00200001	was kelly a_japanese_interpreter	AFN3Y0	q-and-a-exam	YN	Was Kelly a_japanese_interpreter	t
N00200034	did neil like making_friends	AFN3Y0	q-and-a-exam	YN	Did Neil like making_friends?	t
N00200042	vicky was dave 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was Dave's mother, wasn't she?	t
N00200009	did jeff like english	AFN3Y0	q-and-a-exam	YN	Did Jeff like English?\t	t
N00200008	did vicky have cat	AFN3Y0	q-and-a-exam	YN	Did Vicky have cat?	f
N00200037	neil was kelly 's father wasn't he	AFN3Y0	q-and-a-exam	Tag	Neil was Kelly's father, wasn't he?	t
N96200030	was vicky had cat mi_mi	AFN3Y0	q-and-a-exam	YN	Was Vicky had cat mi_mi?	f
N00200042	cindy was dave 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Cindy was Dave's mother, wasn't she?	t
N00200017	hsiao_ching-teng was cindy 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Hsiao_Ching-teng was Cindy's mother, wasn't she? 	f
N00200037	kelly was mindy 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was Mindy's mother, wasn't she?	t
N00200056	did shane like avril_lavigne	AFN3Y0	q-and-a-exam	YN	did Shane like Avril_Lavigne	t
N01202001	neil was a teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Neil was a teacher, wasn't he?	t
N00200042	mindy was dave 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Mindy was Dave's mother, wasn't she?	t
N00200008	did vicky had cat	AFN3Y0	q-and-a-exam	YN	Did Vicky had cat?	f
N01202004	kelly lived in jiayi didn't she	AFN3Y0	q-and-a-exam	Tag	kelly lived in Jiayi, didn't she?\t 	t
N00200017	alex liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Alex  liked swimming, didn't he? 	t
N00200056	did alex like cat	AFN3Y0	q-and-a-exam	YN	did Alex like cat	f
N00200042	shane was dave 's mother wasn't he	AFN3Y0	q-and-a-exam	Tag	shane was Dave's mother, wasn't he?	t
N00200009	was neil born in america	AFN3Y0	q-and-a-exam	YN	Was Neil born in America?\t	t
N00200054	lextar like cat	AFN3Y0	q-and-a-exam	YN	Lextar like cat?	f
N01203003	did alex a teacher	AFN3Y0	q-and-a-exam	YN	Did Alex a teacher?	f
N00200037	vicky was mindy 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was Mindy's mother, wasn't she?	t
N00200043	did kelly have a sister	AFN3Y0	q-and-a-exam	YN	did kelly have a sister?	t
N00200042	jeff was dave 's mother wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeff was Dave's mother, wasn't he?	t
N01202004	rena lived in nantou didn't she	AFN3Y0	q-and-a-exam	Tag	Rena lived in Nantou, didn't she?\t 	t
N00200017	america liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	America  liked swimming, didn't he? 	f
N00200042	neil was dave 's mother wasn't he	AFN3Y0	q-and-a-exam	Tag	Neil was Dave's mother, wasn't he?	t
N00200008	did vicky like travel	AFN3Y0	q-and-a-exam	YN	Did Vicky like travel?	t
N00200034	did cindy like shopping	AFN3Y0	q-and-a-exam	YN	Did Cindy like shopping?	t
N00200009	was dr_bean born in america	AFN3Y0	q-and-a-exam	YN	Was Dr_Bean born in America?\t	t
N00200029	was vicky 's father a truck_driver wasn't he	AFN3Y0	q-and-a-exam	WH	Was Vicky's father a truck driver , wasn't he ?	f
N00200017	dr_bean liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Dr_Bean  liked swimming, didn't he	t
N00200036	was jeff a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Jeff a student of Minghsin University?	t
N00200025	dave live in nantou didn't he	AFN3Y0	q-and-a-exam	Tag	dave live in nantou didn't he?	f
N00200051	did rena like watching_tv	AFN3Y0	q-and-a-exam	YN	Did Rena like watching tv?	t
N96200030	was jeff liked making_friends	AFN3Y0	q-and-a-exam	YN	Was Jeff liked making friends?	f
N00200017	gemitek liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Gemitek liked swimming, didn't he?	f
N00200034	did kelly like shopping	AFN3Y0	q-and-a-exam	YN	Did Kelly like shopping?	t
N00200056	dave like japanese	AFN3Y0	q-and-a-exam	YN	Dave like Japanese	f
N01202004	cindy liked jeremy_lin didn't he	AFN3Y0	q-and-a-exam	Tag	Cindy liked Jeremy_Lin , didn't he?	f
N00200036	was neil a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Neil a student of Minghsin University?	t
N00200017	jeremy_lin liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy_Lin  liked swimming, didn't he?	t
N00200029	where did mindy lived	AFN3Y0	q-and-a-exam	WH	Where did Mindy lived ?	f
N00200001	wasn't rena like the_color_pink	AFN3Y0	q-and-a-exam	YN	wasn't Rena like the_color_pink	f
N00200036	was rena a student of minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Rena a student of Minghsin University?	t
N00200042	neil liked travel didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked travel, didn't he?	t
N00200034	did lextar like hello_kitty	AFN3Y0	q-and-a-exam	YN	Did Lextar like hello_kitty?	t
N01202004	was cindy liked jeremy_lin didn't she	AFN3Y0	q-and-a-exam	Tag	Was cindy liked Jeremy Lin , didn't she?	f
N00200017	shane liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Shane liked swimming, didn't he?	t
N00200043	did kelly like jogging	AFN3Y0	q-and-a-exam	YN	Did kelly like jogging?	t
N00200051	did mindy like basketball	AFN3Y0	q-and-a-exam	YN	Did Mindy like basketball?	t
N00200025	did dr_bean like making_friends	AFN3Y0	q-and-a-exam	YN	Did Dr Bean like making friends?\t	t
N00200042	jeff liked travel didn't he	AFN3Y0	q-and-a-exam	Tag	Jeff liked travel, didn't he?	t
N00200025	did avril_lavigne like making_friends	AFN3Y0	q-and-a-exam	YN	Did Avril Lavigne like making friends?\t	t
N01202001	rena had a cat didn't she	AFN3Y0	q-and-a-exam	Tag	Rena had a cat, didn't she?	t
N00200017	some man who was born in hsinchu liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in Hsinchu liked jogging, didn't he? 	t
N00200037	rena was a cat wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a cat, wasn't she?	t
N00200025	did lextar like making_friends	AFN3Y0	q-and-a-exam	YN	Did Lextar like making friends?\t	t
N00200042	shane liked travel didn't he	AFN3Y0	q-and-a-exam	Tag	shane liked travel, didn't he?	t
N00200051	did jeff like avril_lavigne	AFN3Y0	q-and-a-exam	YN	Did Jeff like Avril Lavigne?	t
N00200017	some man who was born in jiayi liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in Jiayi  liked jogging, didn't he? 	t
N00200009	was neil born in taiwan	AFN3Y0	q-and-a-exam	YN	Was Neil born in Taiwan?\t	t
N00200017	some man who was born in america liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in America  liked jogging, didn't he?	t
N00200008	dave had a brother didn't he	AFN3Y0	q-and-a-exam	Tag	Dave had a brother, didn't he?	t
N00200036	jeff was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	YN	Jeff was a design assistant , wasn't he?	t
N00200051	did rena like drawing	AFN3Y0	q-and-a-exam	YN	Did Rena like drawing?	t
N00200034	did lextar live in jiayi	AFN3Y0	q-and-a-exam	YN	Did Lextar live in Jiayi?	t
N00200037	vicky was a cat wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was a cat, wasn't she?	t
N00200001	did mindy like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Mindy like the_color_pink	t
N00200056	did dr_bean like japanese	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Japanese	t
N00200017	some man who was born in hukou liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in Hukou  liked jogging, didn't he?	t
N00200043	did vicky like jogging	AFN3Y0	q-and-a-exam	YN	Did vicky like jogging?	t
N01202004	alex was mindy 's mother wasn't he	AFN3Y0	q-and-a-exam	Tag	alex was Mindy's mother, wasn't he?\t 	t
N00200054	dave like cat	AFN3Y0	q-and-a-exam	YN	Dave like cat?	f
N00200008	vicky had a brother didn't he	AFN3Y0	q-and-a-exam	Tag	Vicky had a brother, didn't he?	f
N00200042	kelly liked travel didn't she	AFN3Y0	q-and-a-exam	Tag	Kelly liked travel, didn't she?	t
N96200030	was vicky liked japanese	AFN3Y0	q-and-a-exam	YN	Was Vicky liked japanese?	f
N00200017	some man who was born in taiwan liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in Taiwan liked jogging, didn't he?	t
N00200037	mindy was a cat wasn't she	AFN3Y0	q-and-a-exam	Tag	Mindy was a cat, wasn't she?	t
N00200036	dave was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	YN	Dave was a design assistant , wasn't he?	t
N00200001	did shane like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Shane like the_color_pink	t
N00200056	did dr_bean like english	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like English	t
N00200031	where did cindy born in	AFN3Y0	q-and-a-exam	WH	Where did Cindy born in ?\t	f
N00200008	dave had a brother didn't she	AFN3Y0	q-and-a-exam	Tag	Dave had a brother, didn't she?	f
N00200031	where did cindy born	AFN3Y0	q-and-a-exam	WH	Where did Cindy born ?\t	f
N00200043	was dave a truck_driver	AFN3Y0	q-and-a-exam	YN	was Dave a truck driver?	t
N00200001	did jeff like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Jeff like the_color_pink	t
N01202004	cindy was dave 's sister wasn't she	AFN3Y0	q-and-a-exam	Tag	cindy was Dave's sister, wasn't she?\t 	t
N00200037	kelly was a cat wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was a cat, wasn't she?	t
N00200056	did dr_bean like jogging	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like jogging	t
N00200008	vicky had a brother didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky had a brother, didn't she?	t
N00200001	did neil like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Neil like the_color_pink	t
N96200030	wasn't vicky liked japanese	AFN3Y0	q-and-a-exam	YN	Wasn't Vicky liked japanese?	f
N00200009	did kelly like avril_lavigne	AFN3Y0	q-and-a-exam	YN	Did Kelly  like Avril_Lavigne?	t
N00200051	did rena like exercising	AFN3Y0	q-and-a-exam	YN	Did Rena like exercising?	t
N01203003	did dave a teacher	AFN3Y0	q-and-a-exam	YN	Did Dave a teacher?	f
N00200001	did dave like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Dave like the_color_pink	t
N00200031	was cindy born in hsinchu	AFN3Y0	q-and-a-exam	YN	Was Cindy born in Hsinchu?\t	t
N00200025	kelly liked jogging didn't she	AFN3Y0	q-and-a-exam	Tag	kelly liked jogging , didn't  she?	t
N00200029	did mindy liked cats	AFN3Y0	q-and-a-exam	YN	Did  Mindy liked cats ?	f
N01202004	kelly was shane 's teacher wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was Shane's teacher, wasn't she?\t 	t
N00200017	some man who was born in taoyuan liked jogging didn't he	AFN3Y0	q-and-a-exam	Tag	Some man who was born in Taoyuan liked jogging, didn't he?	t
N00200025	was dr_bean a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Dr Bean a student in Minghsin University?\t	t
N00200037	rena was a japanese wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a Japanese, wasn't she?	f
N00200051	did rena like jiayi	AFN3Y0	q-and-a-exam	YN	Did Rena like Jiayi?	t
N00200001	did cindy like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Cindy like the_color_pink	t
N00200042	neil liked swimming didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked swimming, didn't he?	t
N00200009	was mindy born in 1994	AFN3Y0	q-and-a-exam	YN	Was Mindy born in 1994?\t	t
N01202004	shane was kelly 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Shane was Kelly's teacher, wasn't he?\t 	t
N00200043	did rena like jogging	AFN3Y0	q-and-a-exam	YN	Did Rena like jogging?	t
N00200009	was alex born in 1994	AFN3Y0	q-and-a-exam	YN	Was Alex born in 1994?\t	t
N00200025	was avril_lavigne a student in minghsin_university	AFN3Y0	q-and-a-exam	YN	Was Avril Lavigne a student in Minghsin University?\t	t
N00200001	did kelly like the_color_pink	AFN3Y0	q-and-a-exam	YN	did Kelly like the_color_pink	t
N01202004	mindy was neil 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Mindy was Neil's mother, wasn't she?\t 	t
N00200009	was jeff born in 1994	AFN3Y0	q-and-a-exam	YN	Was Jeff born in 1994?\t	t
N00200056	did dr_bean like hello_kitty	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Hello_kitty	t
N00200017	dave liked singing	AFN3Y0	q-and-a-exam	Tag	Dave liked singing? 	t
N00200009	was cindy born in 1994	AFN3Y0	q-and-a-exam	YN	Was Cindy born in 1994?\t	t
N00200037	rena was a teacher wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a teacher, wasn't she?	t
N00200009	was lextar born in 1994	AFN3Y0	q-and-a-exam	YN	Was Lextar born in 1994?\t	t
N00200029	was dr_bean a teacher wasn't he	AFN3Y0	q-and-a-exam	YN	Was Dr_bean a teacher , wasn't he ?	f
N01202004	rena was jeff 's sister wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was Jeff's sister, wasn't she?\t 	t
N00200017	did dave liked singing	AFN3Y0	q-and-a-exam	YN	Did Dave liked singing? 	f
N00200009	was rena born in 1994	AFN3Y0	q-and-a-exam	YN	Was Rena born in 1994?\t	t
N00200037	kelly was a teacher wasn't she	AFN3Y0	q-and-a-exam	Tag	Kelly was a teacher, wasn't she?	t
N00200001	was mindy 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Mindy's grandmother a farmer	t
N00200037	vicky was a teacher wasn't she	AFN3Y0	q-and-a-exam	Tag	vicky was a teacher, wasn't she?	t
N00200001	was jeff 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Jeff's grandmother a farmer	t
N00200009	was shane born in 1994	AFN3Y0	q-and-a-exam	YN	Was Shane born in 1994?\t	t
N00200034	did alex like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Alex like going_to_the_movies?	t
N01202004	vicky was alex 's mother wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was Alex's mother, wasn't she?\t 	t
N00200036	was vicky born in america	AFN3Y0	q-and-a-exam	YN	Was Vicky born in America?	t
N00200051	did mindy have a cat	AFN3Y0	q-and-a-exam	YN	Did Mindy have a cat?	t
N00200037	dr_bean was a teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr_Bean was a teacher, wasn't he?	t
N96200030	was vicky had brother	AFN3Y0	q-and-a-exam	YN	Was Vicky had brother?	f
N00200001	was neil 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Neil's grandmother a farmer	t
N00200009	was dr_bean born in 1994	AFN3Y0	q-and-a-exam	YN	Was Dr_Bean born in 1994?\t	t
N00200008	dave liked making_friends didn't he	AFN3Y0	q-and-a-exam	Tag	Dave liked making friends, didn't he?	t
N00200034	did dave like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Dave like going_to_the_movies?	t
N00200001	was dave 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Dave's grandmother a farmer	t
N00200056	did dr_bean like jeremy_lin	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Jeremy_Lin	t
N00200055	alex was born in taoyuan wasn't he	AFN3Y0	q-and-a-exam	Tag	Alex was born in Taoyuan, wasn't he?\t	t
N00200009	was vicky born in 1994	AFN3Y0	q-and-a-exam	YN	Was Vicky born in 1994?\t	t
N01202004	dave was vicky 's father wasn't he	AFN3Y0	q-and-a-exam	Tag	Dave was Vicky's father, wasn't he?\t 	t
N00200031	did jeremy_lin like playing_the_piano	AFN3Y0	q-and-a-exam	YN	Did Jeremy lin like playing the piano?\t	t
N00200034	did shane like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Shane like going_to_the_movies?	t
N00200001	was shane 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Shane's grandmother a farmer	t
N00200008	vicky liked making_friends didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky liked making friends, didn't she?	t
N00200037	mindy was a teacher wasn't she	AFN3Y0	q-and-a-exam	Tag	Mindy was a teacher, wasn't she?	t
N00200055	lextar was born in taoyuan wasn't he	AFN3Y0	q-and-a-exam	Tag	Lextar was born in Taoyuan, wasn't he?\t	f
N00200001	was cindy 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Cindy's grandmother a farmer	t
N00200042	kelly worked in lextar didn't she	AFN3Y0	q-and-a-exam	Tag	Kelly worked in Lextar , didn't she?	t
N00200055	cindy was born in taoyuan wasn't she	AFN3Y0	q-and-a-exam	Tag	Cindy was born in Taoyuan, wasn't she?\t	t
N00200037	shane was a teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Shane was a teacher, wasn't he?	t
N00200034	did mindy like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Mindy like going_to_the_movies?	t
N00200051	did rena work in america	AFN3Y0	q-and-a-exam	YN	Did Rena work in America?	t
N00200001	was alex 's grandmother a farmer	AFN3Y0	q-and-a-exam	YN	was Alex's grandmother a farmer	t
N00200037	dave was a teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dave was a teacher, wasn't he?	t
N00200034	did jeff like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Jeff like going_to_the_movies?	t
N01202004	dr_bean was dave 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Dave's teacher, wasn't he?\t 	t
N00200051	did jeff want to work in taiwan	AFN3Y0	q-and-a-exam	YN	Did Jeff want to work in Taiwan?	t
N00200001	was mindy 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Mindy's mother a farmer	t
N00200056	did dr_bean like hsinchu	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Hsinchu	t
N00200034	did neil like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Neil like going_to_the_movies?	t
N96200030	didn't vicky have brother	AFN3Y0	q-and-a-exam	YN	didn't Vicky have brother?	f
N00200056	did dr_bean like neil	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Neil	t
N00200034	did kelly like going_to_the_movies	AFN3Y0	q-and-a-exam	YN	Did Kelly like going_to_the_movies?	t
N00200001	was jeff 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Jeff's mother a farmer	t
N00200009	vicky was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	YN	Vicky was a design assistant , wasn't he?\t	f
N00200042	cindy worked in lextar didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy worked in Lextar , didn't she?	t
N00200056	did dr_bean like vicky	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Vicky	t
N96200030	did rena had mi_mi	AFN3Y0	q-and-a-exam	YN	Did Rena had mi_mi?	f
N01202004	dr_bean was alex 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Alex's teacher, wasn't he?\t 	t
N00200042	mindy worked in lextar didn't she	AFN3Y0	q-and-a-exam	Tag	Mindy worked in Lextar , didn't she?	t
N00200051	did rena work in hukou	AFN3Y0	q-and-a-exam	YN	Did Rena work in Hukou?	t
N00200009	shane was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	YN	Shane  was a design assistant , wasn't he?\t	t
N00200056	did dr_bean like alex	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Alex	t
N00200001	was dave 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Dave's mother a farmer	t
N01202004	dr_bean was mindy 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Mindy's teacher, wasn't he?	t
N00200008	neil liked hello_kitty didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked Hello kitty, didn't he?	t
N00200042	vicky worked in lextar didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky worked in Lextar , didn't she?	t
N00200056	did dr_bean like cindy	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Cindy	t
N00200043	did vicky like swimming	AFN3Y0	q-and-a-exam	YN	Did vicky like swimming?	t
N00200051	did rena like listening_to_music	AFN3Y0	q-and-a-exam	YN	Did Rena like listening to music?	t
N01203003	was dave a father	AFN3Y0	q-and-a-exam	YN	Was Dave a father?	t
N00200001	was cindy 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Cindy's mother a farmer	t
N01202004	dr_bean was cindy 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Cindy's teacher, wasn't he?	t
N00200036	was vicky a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Vicky a truck_driver ?\t	t
N00200009	shane was a babysitter wasn't he	AFN3Y0	q-and-a-exam	YN	Shane  was a  babysitter  , wasn't he?\t	t
N00200056	did dr_bean like dave	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Dave	t
N01202004	dr_bean was jeff 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Jeff's teacher, wasn't he?	t
N01203003	was rena a mother	AFN3Y0	q-and-a-exam	YN	Was Rena a mother?	t
N00200043	did shane like swimming	AFN3Y0	q-and-a-exam	YN	Did shane like swimming?	t
N96200030	was mindy have cat	AFN3Y0	q-and-a-exam	YN	Was Mindy have cat?	f
N00200034	did mindy like reading	AFN3Y0	q-and-a-exam	YN	Did Mindy like reading?	t
N00200042	rena worked in lextar didn't she	AFN3Y0	q-and-a-exam	Tag	Rena worked in Lextar , didn't she?	t
N00200001	was vicky 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Vicky's mother a farmer	t
N00200008	neil liked the_color_pink didn't he	AFN3Y0	q-and-a-exam	Tag	Neil liked the color pink, didn't he?	t
N00200037	shane had a cat didn't he	AFN3Y0	q-and-a-exam	Tag	Shane had a cat, didn't he?	t
N01203003	was vicky a mother	AFN3Y0	q-and-a-exam	YN	Was Vicky a mother?	t
N00200056	did dr_bean like mindy	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Mindy	t
N01202004	dr_bean was neil 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Neil's teacher, wasn't he?	t
N00200034	did alex like reading	AFN3Y0	q-and-a-exam	YN	Did Alex like reading?	t
N00200037	neil had a cat didn't he	AFN3Y0	q-and-a-exam	Tag	Neil had a cat, didn't he?	t
N00200042	neil worked in lextar didn't he	AFN3Y0	q-and-a-exam	Tag	Neil worked in Lextar , didn't he?	t
N00200055	lextar was born in taoyuan wasn't she	AFN3Y0	q-and-a-exam	Tag	Lextar was born in Taoyuan, wasn't she?\t	f
N00200001	was kelly 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Kelly's mother a farmer	t
N01203003	was jeff a father	AFN3Y0	q-and-a-exam	YN	Was Jeff a father?	t
N01202004	dr_bean was shane 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was Shane's teacher, wasn't he?	t
N00200034	did shane like reading	AFN3Y0	q-and-a-exam	YN	Did Shane like reading?	t
N00200043	did rena like swimming	AFN3Y0	q-and-a-exam	YN	Did Rena like swimming?	t
N00200001	was rena 's mother a farmer	AFN3Y0	q-and-a-exam	YN	was Rena's mother a farmer	t
N00200042	jeff worked in lextar didn't he	AFN3Y0	q-and-a-exam	Tag	Jeff worked in Lextar , didn't he?	t
N01203003	was neil a father	AFN3Y0	q-and-a-exam	YN	Was Neil a father?	t
N00200037	kelly had a cat didn't she	AFN3Y0	q-and-a-exam	Tag	Kelly had a cat, didn't she?	t
N00200056	did dr_bean like jeff	AFN3Y0	q-and-a-exam	YN	did Dr_Bean like Jeff	t
N96200030	was mindy teacher dr_bean	AFN3Y0	q-and-a-exam	YN	Was Mindy teacher  Dr_Bean?	f
N00200008	vicky liked swimming didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky liked swimming, didn't she?	t
N00200034	did rena like reading	AFN3Y0	q-and-a-exam	YN	Did Rena like reading?	t
N00200042	alex worked in lextar didn't he	AFN3Y0	q-and-a-exam	Tag	Alex worked in Lextar , didn't he?	t
N00200037	mindy had a cat didn't she	AFN3Y0	q-and-a-exam	Tag	Mindy had a cat, didn't she?	t
N01203003	was kelly a mother	AFN3Y0	q-and-a-exam	YN	Was Kelly a mother?	t
N00200055	alex was a design_assistant wasn't he	AFN3Y0	q-and-a-exam	Tag	Alex was a design assistant , wasn't he?\t	t
N01202004	dr_bean was kelly 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dr bean was kelly's teacher, wasn't he?	t
N00200008	vicky liked jogging didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky liked jogging, didn't she?	t
N00200031	cindy had a cat didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy had a cat, didn't she?\t	t
N00200043	did kelly like swimming	AFN3Y0	q-and-a-exam	YN	Did kelly like swimming?	t
N00200056	did alex like dave	AFN3Y0	q-and-a-exam	YN	did Alex like Dave	t
N00200042	dave worked in lextar didn't he	AFN3Y0	q-and-a-exam	Tag	Dave worked in Lextar , didn't he?	t
N00200001	was rena had a cat	AFN3Y0	q-and-a-exam	YN	Was Rena had a cat	f
N00200034	did neil like reading	AFN3Y0	q-and-a-exam	YN	Did Neil like reading?	t
N00200036	was dr_bean a truck_driver	AFN3Y0	q-and-a-exam	YN	Was Dr_Bean a truck_driver ?	t
N00200037	dave had a cat didn't he	AFN3Y0	q-and-a-exam	Tag	Dave had a cat, didn't he?	t
N01203003	was mindy a mother	AFN3Y0	q-and-a-exam	YN	Was Mindy a mother?	t
N00200031	alex had a cat didn't he	AFN3Y0	q-and-a-exam	Tag	Alex had a cat, didn't he?\t	t
N00200055	vicky was a design_assistant wasn't she	AFN3Y0	q-and-a-exam	Tag	Vicky was a design assistant , wasn't she?\t	t
N00200008	vicky liked cat didn't she	AFN3Y0	q-and-a-exam	Tag	Vicky liked cat, didn't she?	f
N00200055	was alex liked playing_the_piano	AFN3Y0	q-and-a-exam	YN	Was Alex liked playing the piano ? 	f
N00200034	did kelly like reading	AFN3Y0	q-and-a-exam	YN	Did Kelly like reading?	t
N00200056	did alex like shane	AFN3Y0	q-and-a-exam	YN	did Alex like Shane	t
N00200001	did rena had a cat	AFN3Y0	q-and-a-exam	YN	did Rena had a cat	f
N00200043	did cindy like swimming	AFN3Y0	q-and-a-exam	YN	Did cindy like swimming?	t
N01202004	jeremy_lin was alex 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy Lin was Alex's teacher, wasn't he?	t
N00200055	cindy was a design_assistant wasn't she	AFN3Y0	q-and-a-exam	Tag	Cindy was a design assistant , wasn't she?	t
N01203003	was dr_bean a father	AFN3Y0	q-and-a-exam	YN	Was Dr_Bean a father?	t
N00200056	did alex like cindy	AFN3Y0	q-and-a-exam	YN	did Alex like Cindy	t
N00200001	was jeff 's father a farmer	AFN3Y0	q-and-a-exam	YN	was Jeff's father a farmer	t
N00200008	cindy had a brother didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy had a brother, didn't she?	t
N96200030	was neil liked cat	AFN3Y0	q-and-a-exam	YN	Was Neil liked cat?	f
N00200034	did cindy like reading	AFN3Y0	q-and-a-exam	YN	Did Cindy like reading?	t
N00200056	did alex like mindy	AFN3Y0	q-and-a-exam	YN	did Alex like Mindy	t
N00200008	cindy had a sister didn't she	AFN3Y0	q-and-a-exam	Tag	Cindy had a sister, didn't she?	t
N00200043	did dave like swimming	AFN3Y0	q-and-a-exam	YN	Did dave like swimming?	t
N00200001	was mindy 's father a farmer	AFN3Y0	q-and-a-exam	YN	was Mindy's father a farmer	t
N01203003	was shane a father	AFN3Y0	q-and-a-exam	YN	Was Shane a father?	t
N01202004	jeremy_lin was shane 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy Lin was Shane's teacher, wasn't he?	t
N00200055	avril_lavigne was a design_assistant wasn't she	AFN3Y0	q-and-a-exam	Tag	Avril Lavigne was a design assistant , wasn't she?	t
N00200055	alex liked singing didn't she	AFN3Y0	q-and-a-exam	Tag	Alex liked singing, didn't she? 	f
N00200056	did cindy like dave	AFN3Y0	q-and-a-exam	YN	did Cindy like Dave	t
N96200030	did jeff had sister	AFN3Y0	q-and-a-exam	YN	Did Jeff had sister?	f
N01202004	jeremy_lin was neil 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy Lin was Neil's teacher, wasn't he?	t
N00200031	jeff had a cat didn't he	AFN3Y0	q-and-a-exam	Tag	Jeff had a cat, didn't he?\t	t
N00200055	rena was a design_assistant wasn't she	AFN3Y0	q-and-a-exam	Tag	Rena was a design assistant , wasn't she?	t
N00200034	did cindy like jogging	AFN3Y0	q-and-a-exam	YN	Did Cindy like jogging?	t
N00200008	kelly had a sister didn't she	AFN3Y0	q-and-a-exam	Tag	Kelly had a sister, didn't she?	t
N00200029	was cindy like jogging wasn't she	AFN3Y0	q-and-a-exam	Tag	Was Cindy like jogging, wasn't she ?	f
N00200055	avril_lavigne was shane 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Avril_Lavigne was Shane's teacher, wasn't he?	f
N01203003	did jeff a farmer	AFN3Y0	q-and-a-exam	YN	Did Jeff a farmer?	f
N00200043	did mindy like swimming	AFN3Y0	q-and-a-exam	YN	Did mindy like swimming?	t
N00200056	did mindy like dave	AFN3Y0	q-and-a-exam	YN	did Mindy like Dave	t
N00200055	avril_lavigne	AFN3Y0	q-and-a-exam	Tag	Avril_Lavigne	f
N01202004	jeremy_lin was rena 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy Lin was Rena's teacher, wasn't he?	t
N00200001	was shane 's father a farmer	AFN3Y0	q-and-a-exam	YN	was Shane's father a farmer	t
N00200055	dave was shane 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Dave  was Shane's teacher, wasn't he?	t
N01202004	jeremy_lin was kelly 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	Jeremy Lin was Kelly's teacher, wasn't he?	t
N00200008	dave had a sister didn't she	AFN3Y0	q-and-a-exam	Tag	Dave had a sister, didn't she?	f
N96200030	did jeff had brother	AFN3Y0	q-and-a-exam	YN	Did Jeff had brother?	f
N00200055	1994 was shane 's teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	1994 was Shane's teacher, wasn't he?	f
N00200056	did mindy like shane	AFN3Y0	q-and-a-exam	YN	did Mindy like Shane	t
N00200008	dave had a sister didn't he	AFN3Y0	q-and-a-exam	Tag	Dave had a sister, didn't he?	t
N01203003	was jeremy_lin a father	AFN3Y0	q-and-a-exam	YN	Was Jeremy_Lin a father?	t
N00200043	did jeff like swimming	AFN3Y0	q-and-a-exam	YN	Did jeff like swimming?	t
N00200056	did mindy like alex	AFN3Y0	q-and-a-exam	YN	did Mindy like Alex	t
N00200034	did lextar like jogging	AFN3Y0	q-and-a-exam	YN	Did Lextar like jogging?	t
N00200029	was cindy a teacher wasn't he	AFN3Y0	q-and-a-exam	Tag	was Cindy a teacher , wasn't he 	f
193001	Who told Dee that Dee was little	GL00006	dickson	WH	Who told Dee that Dee was little	t
193001	Was Dee little?	GL00006	dickson	YN	Was Dee little?	t
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY role (id, role) FROM stdin;
1	official
2	player
3	amateur
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: drbean
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Data for Name: rolebearer; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY rolebearer (player, role) FROM stdin;
193001	1
U0018027	2
U0042050	2
U0017024	2
U0043033	2
U0016030	2
U0142042	2
K220155482	2
U9911237	2
U0016051	2
U0042041	2
M0210002	2
U0043001	2
U0023121	2
U0222133	2
U0042039	2
U0142036	2
U0031213	2
U9923120	2
U0042031	2
U9917017	2
U9911242	2
U0018046	2
U9943007	2
U0122002	2
U0222228	2
U0042012	2
U0043004	2
U0131020	2
U0131034	2
U0214036	2
U9933028	2
U0114037	2
V9941010	2
U0123013	2
U0010040	2
U0114045	2
U9923150	2
V9941015	2
V9941027	2
V9941045	2
V9941060	2
V9941007	2
V9941067	2
V9741064	2
V9941022	2
V9941023	2
V9941001	2
V9941012	2
V9941073	2
V9941040	2
V9841010	2
V9841025	2
V9941050	2
V9941011	2
V9941059	2
V9941047	2
V9841028	2
V9741044	2
V9941037	2
V9841049	2
T9823041	2
V9941075	2
V9941013	2
V9941029	2
V9941026	2
V9941049	2
V9841042	2
V9941014	2
V9941025	2
V9941031	2
V9841046	2
V9841063	2
V9741022	2
V9916050	2
V9941005	2
N01200024	2
N01200021	2
N99080062	2
N01200009	2
N01200018	2
N01200048	2
N01200025	2
N02202112	2
N01200006	2
N01200035	2
N02202106	2
N01200045	2
N01200038	2
N02202114	2
N01200016	2
N01200058	2
N01200044	2
N02202107	2
N01200041	2
N01200002	2
N02202104	2
N96080091	2
N02202101	2
N01200042	2
N99080092	2
N01200029	2
N01200008	2
N97200035	2
N01200051	2
N02202113	2
N01200033	2
N01200015	2
N02202111	2
N97120058	2
N97200033	2
N01200030	2
N00082007	2
N01200023	2
N01200049	2
N02202110	2
N01200056	2
N01200026	2
N01200014	2
N99080075	2
N01200020	2
N97200045	2
N01200046	2
N01200028	2
N01200010	2
N00200042	2
N01202001	2
N00200025	2
N00200044	2
N96200030	2
N00200054	2
N00200017	2
N01202004	2
N00200010	2
N00200055	2
N00200037	2
N00200030	2
N00200056	2
N01203003	2
N00200009	2
N00200001	2
N00200034	2
N00200031	2
N00200048	2
N00200008	2
N00200013	2
N02203101	2
N01202104	2
N00202103	2
N00200036	2
N00200043	2
N00200007	2
N99030025	2
N00200047	2
N98200037	2
N00200029	2
N99100009	2
N00200032	2
N00200006	2
N02203102	2
N00200058	2
N00200003	2
N01202101	2
N00200051	2
N00200045	2
N98200021	2
N00200014	2
N01202105	2
N01202103	2
N00200022	2
N00200015	2
N00200027	2
N00200018	2
N01202002	2
N99030033	2
N01202003	2
N00120056	2
\.


--
-- Data for Name: s; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY s (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
q-and-a-3	N00200056	AFN3Y0	0	0	10	4
q-and-a-3	N00200036	AFN3Y0	0	0	10	4
q-and-a-3	N00200017	AFN3Y0	0	0	10	4
candidate	N01200021	AFN2N0	11	0	-1	4
q-and-a-3	N00200043	AFN3Y0	0	0	10	4
q-and-a-3	N00200030	AFN3Y0	0	0	10	4
candidate	N01200023	AFN2N0	11	0	-1	4
q-and-a-3	N00200008	AFN3Y0	0	0	10	4
q-and-a-3	N00200001	AFN3Y0	0	0	10	4
q-and-a-3	N00200034	AFN3Y0	0	0	10	4
q-and-a-3	193001	AFN3Y0	0	0	10	4
q-and-a-3	N01203003	AFN3Y0	0	0	10	4
q-and-a-3	N96200030	AFN3Y0	0	0	10	4
q-and-a-3	N00200031	AFN3Y0	0	0	10	4
q-and-a-3	N00200042	AFN3Y0	0	0	10	4
candidate	N01200029	AFN2N0	11	0	-1	4
q-and-a-3	N01202004	AFN3Y0	0	0	10	4
candidate	N01200033	AFN2N0	11	0	-1	4
candidate	N01200035	AFN2N0	5	0	5	4
candidate	N01200014	AFN2N0	11	0	-1	4
candidate	N01200044	AFN2N0	11	0	-1	4
candidate	N01200010	AFN2N0	0	0	10	4
candidate	N02202106	AFN2N0	2	0	8	4
candidate	N01200024	AFN2N0	3	0	7	4
candidate	V9941012	FLA0007	0	0	10	4
candidate	N02202114	AFN2N0	0	0	10	4
candidate	N02202111	AFN2N0	1	0	9	4
q-and-a-3	N00200029	AFN3Y0	0	0	10	4
q-and-a-3	N00200025	AFN3Y0	0	0	10	4
candidate	193001	AFN2N0	235	1	8	4
q-and-a-exam	193001	AFN3Y0	0	0	10	4
q-and-a-3	N00200009	AFN3Y0	0	0	1000	400
candidate	N01200005	AFN2N0	0	0	10	4
q-and-a-3	N00200037	AFN3Y0	0	0	1000	400
candidate	N02202112	AFN2N0	10	0	0	4
candidate	N97120058	AFN2N0	6	0	4	4
candidate	N00082007	AFN2N0	8	0	2	4
q-and-a-exam	N00200001	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200009	AFN3Y0	0	0	1000	400
candidate	N01200058	AFN2N0	5	0	5	4
q-and-a-exam	N00200056	AFN3Y0	0	0	1000	400
candidate	N02202104	AFN2N0	2	0	8	4
candidate	N99080092	AFN2N0	4	0	6	4
q-and-a-exam	N00200042	AFN3Y0	0	0	1000	400
q-and-a-exam	N01202001	AFN3Y0	0	0	1000	400
candidate	N01200056	AFN2N0	6	0	4	4
candidate	N02202101	AFN2N0	10	0	9	4
jackson	U0222133	GL00006	0	0	10	4
careers	N01200033	AFN2N0	0	0	10	4
careers	N00120056	AFN300	0	0	10	4
candidate	V9741064	FLA0006	0	0	10	4
intros	193001	AFN3Y0	0	0	10	4
q-and-a	193001	AFN3Y0	0	0	10	4
q-and-a	N00200056	AFN3Y0	0	0	10	4
q-and-a	N96200030	AFN3Y0	0	0	10	4
q-and-a	N00200056	AFN300	0	0	10	4
candidate	B00200054	AFN2N0	3	0	7	4
candidate	N01200025	AFN2N0	0	0	10	4
candidate	N01200009	AFN2N0	8	0	2	4
q-and-a	N00200008	AFN300	0	0	10	4
q-and-a	N00200029	AFN3Y0	0	0	10	4
q-and-a	N00200001	AFN3Y0	0	0	10	4
candidate	N01200041	AFN2N0	10	0	0	4
q-and-a	N00200001	AFN300	0	0	10	4
q-and-a	N00200042	AFN3Y0	0	0	10	4
candidate	N01200016	AFN2N0	6	0	4	4
q-and-a	N00200030	AFN3Y0	0	0	10	4
q-and-a	N00200017	AFN3Y0	0	0	10	4
q-and-a	N00200017	AFN300	0	0	10	4
q-and-a	N00200055	AFN3Y0	0	0	10	4
q-and-a	N00200025	AFN3Y0	0	0	10	4
q-and-a	N01203003	AFN3Y0	0	0	10	4
q-and-a	N00200008	AFN3Y0	0	0	10	4
q-and-a	N00200036	AFN3Y0	0	0	10	4
q-and-a	N00200036	AFN300	0	0	10	4
q-and-a	N00200009	AFN3Y0	0	0	10	4
q-and-a	N01202004	AFN3Y0	0	0	10	4
q-and-a	N00200054	AFN3Y0	0	0	10	4
q-and-a	N00200037	AFN3Y0	0	0	10	4
q-and-a	N00200034		0	0	10	4
q-and-a	N00200051	AFN3Y0	0	0	10	4
q-and-a	N01202001	AFN3Y0	0	0	10	4
q-and-a	N00200043	AFN3Y0	0	0	10	4
q-and-a	N00200043	AFN300	0	0	10	4
q-and-a-exam	N01202004	AFN3Y0	0	0	1000	400
q-and-a	N00200034	AFN3Y0	0	0	10	4
q-and-a-2	193001	AFN3Y0	0	0	10	4
q-and-a	N01202004	AFN300	0	0	10	4
q-and-a-2	N00200056	AFN3Y0	0	0	10	4
q-and-a-2	N00200001	AFN3Y0	0	0	10	4
q-and-a-2	N00200034	AFN3Y0	0	0	10	4
q-and-a-2	N00200017	AFN3Y0	0	0	10	4
q-and-a-2	N00200029	AFN3Y0	0	0	10	4
q-and-a-2	N00200030	AFN3Y0	0	0	10	4
q-and-a-2	N00200054	AFN3Y0	0	0	10	4
q-and-a-2	N00200043	AFN3Y0	0	0	10	4
q-and-a-2	N00200008	AFN3Y0	0	0	10	4
q-and-a-2	N01202001	AFN3Y0	0	0	10	4
q-and-a-2	N96200030	AFN3Y0	0	0	10	4
q-and-a-2	N01202004	AFN3Y0	0	0	10	4
q-and-a-2	N01203003	AFN3Y0	0	0	10	4
q-and-a-2	N00200055	AFN3Y0	0	0	10	4
q-and-a-exam	N00200030	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200036	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200017	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200029	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200031	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200054	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200025	AFN3Y0	0	0	1000	400
q-and-a-exam	N01203003	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200043	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200008	AFN3Y0	0	0	1000	400
q-and-a-exam	N96200030	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200051	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200055	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200037	AFN3Y0	0	0	1000	400
q-and-a-exam	N00200034	AFN3Y0	0	0	1000	400
dickson	193001	GL00006	0	0	10	4
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY session (id, session_data, expires) FROM stdin;
session:434b0fd54d6d002c0aab2df0082edbc8d7090c03                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM3OTY4MDU3NAAAAAlfX2NyZWF0ZWQKBkFGTjJOMAAAAAZsZWFndWUKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSPEZpAAAACV9fdXBkYXRlZA==\n	1379687808
session:30ccdbad005f0a09912cdf82547066e069d025e1                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0NAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQKCem7g+Wwj+iKswAAAARu\nYW1lCglOMDEyMDAwNDQAAAACaWQAAAAGX191c2VyCVJA6vYAAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUkDq9gAAAAlfX3VwZGF0ZWQ=\n	1379992953
session:13c4b68d5d866ff02489c105b3e10ec3b124587f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0NAAAAAlwbGF5ZXJfaWQK\nCjEzNzk3Njk4MzMAAAAJX19jcmVhdGVkBAMAAAADCgR4aWFvAAAACHBhc3N3b3JkCgnpu4PlsI/o\nirMAAAAEbmFtZQoJTjAxMjAwMDQ0AAAAAmlkAAAABl9fdXNlcgoGQUZOMk4wAAAABmxlYWd1ZQoH\namFja3NvbgAAAAhleGVyY2lzZQlSPZ3rAAAACV9fdXBkYXRlZA==\n	1379773435
session:aebed1452a0c86616312c8d5dec75b8334753d36                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM3OTU3NzQ5MAAAAAlfX2NyZWF0ZWQKBkFGTjJOMAAAAAZsZWFndWUKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSOq9TAAAACV9fdXBkYXRlZA==\n	1379581283
session:7ab7cc7b4d0cb82b1c92ccc6171bea938783f893                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0NAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHhpYW8AAAAIcGFzc3dvcmQKCem7g+Wwj+iKswAAAARu\nYW1lCglOMDEyMDAwNDQAAAACaWQAAAAGX191c2VyCVJAa0gAAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUkBrSAAAAAlfX3VwZGF0ZWQ=\n	1379957260
session:5935c8874ca49c950918fea3906e65061128389e                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM3OTY1NTc1MgAAAAlfX2NyZWF0ZWQKBkFGTjJOMAAAAAZsZWFndWUJUjvgkwAAAAlfX3Vw\nZGF0ZWQ=\n	1379659427
session:6828c702c8b91a67f62eaf339860666a43ef0c98                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUKCjEzNzk4NTIzODUAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSPuiTAAAACV9fdXBkYXRlZA==\n	1379859455
session:2b7e2a923076069cc7713ff27be774050b8a8a07                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0NAAAAAlwbGF5ZXJfaWQK\nCjEzNzk3Njk3NDkAAAAJX19jcmVhdGVkBAMAAAADCgR4aWFvAAAACHBhc3N3b3JkCgnpu4PlsI/o\nirMAAAAEbmFtZQoJTjAxMjAwMDQ0AAAAAmlkAAAABl9fdXNlcgoGQUZOMk4wAAAABmxlYWd1ZQoH\namFja3NvbgAAAAhleGVyY2lzZQlSPZ2XAAAACV9fdXBkYXRlZA==\n	1379774372
session:a3ec89006ff599a8a18f663163c833b2e399fc29                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSQa/XAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJBr9cAAAAJX191cGRhdGVk\n	1380040169
session:f587210a13ba28ed0a3ba38ec41ffb171f03ecc4                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyNAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnppAAAACHBhc3N3b3JkCgnmnY7lp7/lq7oAAAAEbmFt\nZQoJTjAxMjAwMDI0AAAAAmlkAAAABl9fdXNlcgoKMTM3OTc2OTAzMAAAAAlfX2NyZWF0ZWQKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSPZt9AAAACV9fdXBkYXRlZA==\n	1379773019
session:3978019a429814c63cfad36c28f322f38507a9c5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUKCjEzNzk3MzYzMDMAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSPSHCAAAACV9fdXBkYXRlZA==\n	1379741842
session:1e877667ea7551b09d68995c228689ccccb4bc42                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBXNoZW5nAAAACHBhc3N3b3JkCgnlkLPogbLlnYcAAAAE\nbmFtZQoJTjAxMjAwMDU2AAAAAmlkAAAABl9fdXNlcglSQgJkAAAACV9fY3JlYXRlZAoJY2FuZGlk\nYXRlAAAACGV4ZXJjaXNlCVJCAmQAAAAJX191cGRhdGVk\n	1380062770
session:2ddd0a77c980aba7b7f1cd6b2116766733d28b39                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUj7oLQAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVI+6DcAAAAJX191cGRhdGVk\n	1379859542
session:f832ed52fdc48191c3ca3ad84b1b46cbde490486                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSQeKRAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJB4pEAAAAJX191cGRhdGVk\n	1380053242
session:d57aa4bfddfeeb276f30e330a26e252befdb3b7f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSQd42AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJB3jYAAAAJX191cGRhdGVk\n	1380055287
session:6a580a281177090f81c2d47c2af651dcd1bb5eca                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBXNoZW5nAAAACHBhc3N3b3JkCgnlkLPogbLlnYcAAAAE\nbmFtZQoJTjAxMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoKMTM4MDA1OTM0OAAAAAlfX2NyZWF0ZWQK\nCWNhbmRpZGF0ZQAAAAhleGVyY2lzZQlSQgqWAAAACV9fdXBkYXRlZA==\n	1380063937
session:5a0b13a35e5215b156fb4f276af92f74b674fafc                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIJUkLnSwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSQudLAAAACV9fdXBkYXRlZA==\n	1380119932
session:ec9ef08cb0c63156b79c83ed914e5cd3d346eede                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyNAAAAAlwbGF5ZXJfaWQK\nCjEzODAxMTk4NTYAAAAJX19jcmVhdGVkBAMAAAADCgJ6aQAAAAhwYXNzd29yZAoJ5p2O5ae/5au6\nAAAABG5hbWUKCU4wMTIwMDAyNAAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSQvVvAAAACV9fdXBkYXRlZA==\n	1380123519
session:21d845f983bc0673b55b8980a1c4e3231d2abd15                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAwOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnlvpDnprnlqbcAAAAEbmFt\nZQoJTjAxMjAwMDA5AAAAAmlkAAAABl9fdXNlcglSQwx/AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJDDH8AAAAJX191cGRhdGVk\n	1380129427
session:2a9452a9dd707dcb6a5b869a2734778c6586d10f                        	BQgDAAAAAwlS0YOeAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLRg54A\nAAAJX191cGRhdGVk\n	1389466030
session:ad4d2d0436b8007880ac25a096ceb0ec5e886404                        	BQgDAAAAAwlS2U89AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVLZTz0AAAAJ\nX191cGRhdGVk\n	1389976908
session:0c98952af498b9f4d119cdddea9eef90409d148b                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFY5OTQxMDEyAAAACXBsYXllcl9pZAoH\nRkxBMDAwNwAAAAZsZWFndWUJUkQmEgAAAAlfX2NyZWF0ZWQEAwAAAAMKBXhpYW5nAAAACHBhc3N3\nb3JkCgc/57+U576pAAAABG5hbWUKCFY5OTQxMDEyAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJEJhgAAAAJX191cGRhdGVk\n	1380201514
session:ff852cd926deea4de9a06152c1f28fa0fd852504                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIJUkVMcQAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRUxxAAAACV9fdXBkYXRlZA==\n	1380276867
session:57c9eb0b9a296e6d61a9cd56897c652a7d5101ff                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjEwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3dlbgAAAAhwYXNzd29yZAoJ6Zmz5paH5YSEAAAABG5h\nbWUKCU4wMjIwMjEwMQAAAAJpZAAAAAZfX3VzZXIJUkWkNgAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRaQ2AAAACV9fdXBkYXRlZA==\n	1380300465
session:204244bb8e8846555cd84a4894266920b89d6703                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSRZgkAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJFmCQAAAAJX191cGRhdGVk\n	1380298193
session:19525eabfc32b8b0f7bde3753f510c4f34b077a1                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSREE1AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJEQTUAAAAJX191cGRhdGVk\n	1380208773
session:6ebef26e1d75b077cc33da6556f02005985aa967                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjExMgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoJ5pa55b+X5ZiJAAAABG5h\nbWUKCU4wMjIwMjExMgAAAAJpZAAAAAZfX3VzZXIJUkWRMwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRZEzAAAACV9fdXBkYXRlZA==\n	1380294566
session:993c2d905385d1e3b93388c165432b89415c7315                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSRF19AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJEXX0AAAAJX191cGRhdGVk\n	1380215695
session:903d3be88a14c160ef7344363d630c0806c677ff                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSRZlcAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJFmVwAAAAJX191cGRhdGVk\n	1380296558
session:85d3ecd1cb700b0ef3904757a63e3f83b90e1220                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjExNAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHFpYW8AAAAIcGFzc3dvcmQKCemEreW3p+aflAAAAARu\nYW1lCglOMDIyMDIxMTQAAAACaWQAAAAGX191c2VyCVJFRTMAAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUkVFMwAAAAlfX3VwZGF0ZWQ=\n	1380275416
session:725164ab19447cb8c21f5c977861dd21ce5f2ed6                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnpu4Pkv57lmIkAAAAEbmFt\nZQoJTjAxMjAwMDI5AAAAAmlkAAAABl9fdXNlcglSRk/qAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJGT+oAAAAJX191cGRhdGVk\n	1380343293
session:6e19a8f286e77a9502ba2ead197119450f3ac9b6                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjExMgAAAAlwbGF5ZXJfaWQK\nCjEzODAyOTQ3MzQAAAAJX19jcmVhdGVkBAMAAAADCgN6aGkAAAAIcGFzc3dvcmQKCeaWueW/l+WY\niQAAAARuYW1lCglOMDIyMDIxMTIAAAACaWQAAAAGX191c2VyCgZBRk4yTjAAAAAGbGVhZ3VlCglj\nYW5kaWRhdGUAAAAIZXhlcmNpc2UJUkWtNQAAAAlfX3VwZGF0ZWQ=\n	1380301641
session:c306abc5705234810d9c53bf0e4208c62decd2da                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjExNAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHFpYW8AAAAIcGFzc3dvcmQKCemEreW3p+aflAAAAARu\nYW1lCglOMDIyMDIxMTQAAAACaWQAAAAGX191c2VyCVJFq+oAAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUkWr6gAAAAlfX3VwZGF0ZWQ=\n	1380301370
session:6255bb749a5cb734df2dd8673d454151c7a1a345                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3NoaQAAAAhwYXNzd29yZAoJ5b6Q6Kmp6Iy5AAAABG5h\nbWUKCU4wMTIwMDAzNQAAAAJpZAAAAAZfX3VzZXIKCjEzODAyOTQ3MjAAAAAJX19jcmVhdGVkCVJF\noLMAAAAJX191cGRhdGVk\n	1380298435
session:d5c8bd4b58f814ce44ed1a59ca4d87109088a797                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjEwNAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnphK3lroflqbcAAAAEbmFt\nZQoJTjAyMjAyMTA0AAAAAmlkAAAABl9fdXNlcglSRlQiAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJGVCIAAAAJX191cGRhdGVk\n	1380345761
session:32486b21f9ad495d480778eb026fe00f7dba9f78                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAwNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBGppbmcAAAAIcGFzc3dvcmQKCeabvumdnOWmggAAAARu\nYW1lCglOMDEyMDAwMDUAAAACaWQAAAAGX191c2VyCVJFrL8AAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUkWsvwAAAAlfX3VwZGF0ZWQ=\n	1380303071
session:676e4c4e92c6d490c0f4ae5a0e2eeef5693684f5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1OAAAAAlwbGF5ZXJfaWQK\nCjEzODAzMzEwODAAAAAJX19jcmVhdGVkBAMAAAADCgNtaW4AAAAIcGFzc3dvcmQKCeW8teaVj+mI\nugAAAARuYW1lCglOMDEyMDAwNTgAAAACaWQAAAAGX191c2VyCgZBRk4yTjAAAAAGbGVhZ3VlCglj\nYW5kaWRhdGUAAAAIZXhlcmNpc2UJUkY+7gAAAAlfX3VwZGF0ZWQ=\n	1380340986
session:20af9c05521343897d8c3931394880be28d97da5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1OAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA21pbgAAAAhwYXNzd29yZAoJ5by15pWP6Yi6AAAABG5h\nbWUKCU4wMTIwMDA1OAAAAAJpZAAAAAZfX3VzZXIJUkZGIAAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRkYgAAAACV9fdXBkYXRlZA==\n	1380340787
session:346613f275c1ed31dd1e1042875abc3f272bb8c0                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMQAAAAlwbGF5ZXJfaWQK\nCjEzODAzNDQ2MzgAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ6JSh6Zuo5qi1\nAAAABG5hbWUKCU4wMTIwMDAyMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRmfeAAAACV9fdXBkYXRlZA==\n	1380349422
session:d26708b862920a1d961f757d9ca8d35a437a272c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnolKHpm6jmqLUAAAAEbmFt\nZQoJTjAxMjAwMDIxAAAAAmlkAAAABl9fdXNlcglSRmgGAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJGaAYAAAAJX191cGRhdGVk\n	1380349462
session:e58f1b067bf9c75fc70c5d45752c655152a1b2d1                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQK\nCjEzODc0NjMzMTUAAAAJX19jcmVhdGVkBAMAAAADCgRiaW5nAAAACHBhc3N3b3JkCgnolKHnp4nl\ngIkAAAAEbmFtZQoJTjAwMjAwMDU1AAAAAmlkAAAABl9fdXNlcglSswKqAAAACV9fdXBkYXRlZA==\n	1387466938
session:5ed3e56c452da167382f7b9e8123e60c0b12d472                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyOQAAAAlwbGF5ZXJfaWQK\nCjEzODAzNTQ2ODUAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ6buD5L+e5ZiJ\nAAAABG5hbWUKCU4wMTIwMDAyOQAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRpAZAAAACV9fdXBkYXRlZA==\n	1380361107
session:3ec12275615748e4104d906c8b58aa777928ab6f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMQAAAAlwbGF5ZXJfaWQK\nCjEzODAzNDU4NjQAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ6JSh6Zuo5qi1\nAAAABG5hbWUKCU4wMTIwMDAyMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRmilAAAACV9fdXBkYXRlZA==\n	1380349621
session:75109b1a0fbd2618912d1bfc8949c9609ffdf84f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjEwNgAAAAlwbGF5ZXJfaWQK\nCjEzODAzNjQ1NDMAAAAJX19jcmVhdGVkBAMAAAADCgRmYW5nAAAACHBhc3N3b3JkCgnlionoirPn\nkYAAAAAEbmFtZQoJTjAyMjAyMTA2AAAAAmlkAAAABl9fdXNlcgoGQUZOMk4wAAAABmxlYWd1ZQoJ\nY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVJGsWIAAAAJX191cGRhdGVk\n	1380368297
session:eed3602cf91e75423d37d0c997b28e53db004b77                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3NoaQAAAAhwYXNzd29yZAoJ5b6Q6Kmp6Iy5AAAABG5h\nbWUKCU4wMTIwMDAzNQAAAAJpZAAAAAZfX3VzZXIJUkZ/LQAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRn8tAAAACV9fdXBkYXRlZA==\n	1380355558
session:5d97a96ae0f966f5cfd309d1b1708ecde4fe8f8d                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3NoaQAAAAhwYXNzd29yZAoJ5b6Q6Kmp6Iy5AAAABG5h\nbWUKCU4wMTIwMDAzNQAAAAJpZAAAAAZfX3VzZXIKCjEzODAzNTYzNTMAAAAJX19jcmVhdGVkCVJG\nkW0AAAAJX191cGRhdGVk\n	1380360061
session:c3417e519fa70b3c954b1a8b3baa9ae80841d524                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3NoaQAAAAhwYXNzd29yZAoJ5b6Q6Kmp6Iy5AAAABG5h\nbWUKCU4wMTIwMDAzNQAAAAJpZAAAAAZfX3VzZXIJUkaSHwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRpIfAAAACV9fdXBkYXRlZA==\n	1380362003
session:7b439004e5aad6ba052a8bd0151dcba5290a9233                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIJUkbdlAAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRt2UAAAACV9fdXBkYXRlZA==\n	1380387586
session:8745e2785e09499aa1bb88f29641e5f4153f82ce                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45OTA4MDA5MgAAAAlwbGF5ZXJfaWQK\nCjEzODAzNjU0MTYAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ5p2O6YOB6Iqs\nAAAABG5hbWUKCU45OTA4MDA5MgAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRry0AAAACV9fdXBkYXRlZA==\n	1380371140
session:ef5df27d5b28c0a79608e2b7442e54c89ece8b4c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjExMQAAAAlwbGF5ZXJfaWQK\nCjEzODAzNjUxOTcAAAAJX19jcmVhdGVkBAMAAAADCgJ5aQAAAAhwYXNzd29yZAoJ6JGj57+M5Lqm\nAAAABG5hbWUKCU4wMjIwMjExMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjJOMAAAAAZsZWFndWUKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRrPNAAAACV9fdXBkYXRlZA==\n	1380368861
session:1ddc2af7847b09463ff21eb645ba8821e0549fd9                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUkarWgAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJGq2QAAAAJX191cGRhdGVk\n	1380366836
session:8965a6a7f00b4413fabb0842e560bc58655173e0                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnolKHpm6jmqLUAAAAEbmFt\nZQoJTjAxMjAwMDIxAAAAAmlkAAAABl9fdXNlcglSRo0sAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJGjSwAAAAJX191cGRhdGVk\n	1380359049
session:d2341a90c2cff2dc6f295e8ae3d345c601ce5c13                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAwOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnlvpDnprnlqbcAAAAEbmFt\nZQoJTjAxMjAwMDA5AAAAAmlkAAAABl9fdXNlcgoKMTM4MDM4MDY2MAAAAAlfX2NyZWF0ZWQKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSRvhoAAAACV9fdXBkYXRlZA==\n	1380388857
session:8b89fc81b1ceb290b471a294c52c2fe41c0ef2af                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDA4MjAwNwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA2hhbgAAAAhwYXNzd29yZAoJ6Zmz57+w5aKDAAAABG5h\nbWUKCU4wMDA4MjAwNwAAAAJpZAAAAAZfX3VzZXIKCjEzODAzNjkxMDUAAAAJX19jcmVhdGVkCVJG\nw2EAAAAJX191cGRhdGVk\n	1380372849
session:3e9b277ee830ce03d83b4b831e36c50a09eee0e8                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoJ6JWt6Iez56WQAAAABG5h\nbWUKCU4wMTIwMDAzMwAAAAJpZAAAAAZfX3VzZXIJUkbLiwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSRsuLAAAACV9fdXBkYXRlZA==\n	1380377385
session:759e98ce58d7f0870ff84ea688dea3cf00458ae8                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnNpAAAACHBhc3N3b3JkCgnojIPmgJ3mg58AAAAEbmFt\nZQoJQjAwMjAwMDU0AAAAAmlkAAAABl9fdXNlcglSR8SeAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJHxJ4AAAAJX191cGRhdGVk\n	1380438705
session:e0281e5f863a3cd434019975e646931dfe60cb7a                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45OTA4MDA5MgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnmnY7pg4HoiqwAAAAEbmFt\nZQoJTjk5MDgwMDkyAAAAAmlkAAAABl9fdXNlcglSRsHhAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJGweEAAAAJX191cGRhdGVk\n	1380372766
session:1d44044caae0693a5fb44f59c9edb3d1cc4b64f9                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAwOQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnlvpDnprnlqbcAAAAEbmFt\nZQoJTjAxMjAwMDA5AAAAAmlkAAAABl9fdXNlcglSRwH+AAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJHAf4AAAAJX191cGRhdGVk\n	1380389011
session:4f978c9435716d200c56ed66456e88f889c2e686                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoJ6JWt6Iez56WQAAAABG5h\nbWUKCU4wMTIwMDAzMwAAAAJpZAAAAAZfX3VzZXIJUkfodwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSR+h3AAAACV9fdXBkYXRlZA==\n	1380449077
session:c8d30edf9cbdfd17117905177544ddcd4c2140cc                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBXNoZW5nAAAACHBhc3N3b3JkCgnlkLPogbLlnYcAAAAE\nbmFtZQoJTjAxMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoKMTM4MDQ2NDUwNgAAAAlfX2NyZWF0ZWQJ\nUkg4dgAAAAlfX3VwZGF0ZWQ=\n	1380468358
session:f65b768dd47a44d74a839d03de50c9923974242c                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA0MgAAAAlwbGF5ZXJfaWQK\nCjEzODc1MDUxMTEAAAAJX19jcmVhdGVkBAMAAAADCgR4aWFvAAAACHBhc3N3b3JkCgnppq7lsI/o\nk4kAAAAEbmFtZQoJTjAwMjAwMDQyAAAAAmlkAAAABl9fdXNlcglSs6XgAAAACV9fdXBkYXRlZA==\n	1387508720
session:d91635aa6a82d848d2a7bb802f539fb7fc2b80b4                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQJUk9s\ntgAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkz\nMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOMk4wAAAABmxlYWd1ZQoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJPbXoAAAAJX191cGRhdGVk\n	1380945932
session:15da7aca66b9f643f2523b24a529c9464e272d37                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUkouYQAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJKLnEAAAAJX191cGRhdGVk\n	1380598167
session:92514c0fd3cf737e390060adfdb452605160230d                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoJ6JWt6Iez56WQAAAABG5h\nbWUKCU4wMTIwMDAzMwAAAAJpZAAAAAZfX3VzZXIKCjEzODA1MjQ5MDIAAAAJX19jcmVhdGVkCglj\nYW5kaWRhdGUAAAAIZXhlcmNpc2UJUkknjAAAAAlfX3VwZGF0ZWQ=\n	1380529984
session:d2e5e898f7973d26203c61891e13c7ade9275931                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIJUklJ+QAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSSUn5AAAACV9fdXBkYXRlZA==\n	1380538391
session:a92a43d7d20ac106665af3a4cd14891773da6f65                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA1NgAAAAlwbGF5ZXJfaWQJ\nUk7I7AAAAAlfX2NyZWF0ZWQEAwAAAAMKBXNoZW5nAAAACHBhc3N3b3JkCgnlkLPogbLlnYcAAAAE\nbmFtZQoJTjAxMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOMk4wAAAABmxlYWd1ZQoJY2FuZGlk\nYXRlAAAACGV4ZXJjaXNlCVJOzTAAAAAJX191cGRhdGVk\n	1380900574
session:1e53d1daa4b34b06cc8ad59a21bf30e3bec61fa3                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDA4MjAwNwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA2hhbgAAAAhwYXNzd29yZAoJ6Zmz57+w5aKDAAAABG5h\nbWUKCU4wMDA4MjAwNwAAAAJpZAAAAAZfX3VzZXIJUk/eHgAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlST94eAAAACV9fdXBkYXRlZA==\n	1380969527
session:55e19e430290febee07fab33fa3d417342ab6bd7                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHRpbmcAAAAIcGFzc3dvcmQKCeipueW6ree+vQAAAARu\nYW1lCglOMDEyMDAwMjMAAAACaWQAAAAGX191c2VyCgoxMzgwNDY2MDYzAAAACV9fY3JlYXRlZAoJ\nY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVJIP4sAAAAJX191cGRhdGVk\n	1380470244
session:9b29ee8e4fa6b1503dcd3faaf090e21c7ae9885f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAxNAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnojIPogrLoirMAAAAEbmFt\nZQoJTjAxMjAwMDE0AAAAAmlkAAAABl9fdXNlcglSTC4xAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJMLjEAAAAJX191cGRhdGVk\n	1380732518
session:baad1c85c4a1c86953d642f432aadd51681e6246                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIJUk7kXgAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSTuReAAAACV9fdXBkYXRlZA==\n	1380905591
session:3522bafc7816585f75f141ecc7ddfb08ae28c151                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDA0MQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ6JSh5L2p54eVAAAABG5h\nbWUKCU4wMTIwMDA0MQAAAAJpZAAAAAZfX3VzZXIKCjEzODA1NTAwNTYAAAAJX19jcmVhdGVkCglj\nYW5kaWRhdGUAAAAIZXhlcmNpc2UJUkmGDwAAAAlfX3VwZGF0ZWQ=\n	1380556158
session:891d4923688ea0e8c55402cda1365961bda07b78                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAxMAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnppAAAACHBhc3N3b3JkCgnlh77ntKvmuJ0AAAAEbmFt\nZQoJTjAxMjAwMDEwAAAAAmlkAAAABl9fdXNlcglSTTwEAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJNPAUAAAAJX191cGRhdGVk\n	1380797025
session:0fb62173662a4b9add6e2d7019a5dc6a06de93db                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyNQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnlionmmLHlrpwAAAAEbmFt\nZQoJTjAxMjAwMDI1AAAAAmlkAAAABl9fdXNlcglST8JoAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJPwmgAAAAJX191cGRhdGVk\n	1380962432
session:0c6bb7e150c80a4a648aebca788dac3888634f92                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUkogswAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJKILsAAAAJX191cGRhdGVk\n	1380595304
session:2bb2e3592894101665d6533b5018060c640198db                        	BQgDAAAAAglSSiBOAAAACV9fY3JlYXRlZAlSSiBOAAAACV9fdXBkYXRlZA==\n	1380596821
session:0be4a33400787e6a70c05c1c95203e631e63786a                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAxNgAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnoqLHkvp3okI0AAAAEbmFt\nZQoJTjAxMjAwMDE2AAAAAmlkAAAABl9fdXNlcglST8wyAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJPzDIAAAAJX191cGRhdGVk\n	1380965911
session:9d818d70f631f37a9fbb665940a64e44107d9ed8                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnNpAAAACHBhc3N3b3JkCgnojIPmgJ3mg58AAAAEbmFt\nZQoJQjAwMjAwMDU0AAAAAmlkAAAABl9fdXNlcglST6dJAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRl\nAAAACGV4ZXJjaXNlCVJPp0kAAAAJX191cGRhdGVk\n	1380956930
session:005055a484341a2d57a7af727c0f2ba3b19c0fca                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUlP9qAAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJT/bUAAAAJX191cGRhdGVk\n	1381240246
session:c92a4341ca2c176d9a8a37734b46ef095d77d4bd                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUlQDmgAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJUA6AAAAAJX191cGRhdGVk\n	1381246048
session:a3096ce1469981f541108ac4e58fb6de5281c957                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUlQWpgAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJUFq8AAAAJX191cGRhdGVk\n	1381246173
session:0af5d7180e65905239c53d0701a4d3700ef1a0d1                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUKCjEzODEyODEwMjAAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSVLa5AAAACV9fdXBkYXRlZA==\n	1381298825
session:9e4f61030f09067bbd45baebe815d90b482849b1                        	BQgDAAAAAwlS0YhWAAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlS0YhWAAAACV9f\ndXBkYXRlZA==\n	1389467238
session:2e830f8027017418be89344bee8aa24fbb8873e4                        	BQgDAAAAAwlS3UxyAAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlS3UxyAAAACV9f\ndXBkYXRlZA==\n	1390238338
session:4d6ef74df484226c435d19dc2346e13da0566ae2                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDEyMDA1NgAAAAlwbGF5ZXJfaWQK\nCjEzODU2MjcyMzEAAAAJX19jcmVhdGVkBAMAAAADCgRndWVpAAAACHBhc3N3b3JkCgnmnY7moYLo\ni7EAAAAEbmFtZQoJTjAwMTIwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOMzAwAAAABmxlYWd1ZQoH\nY2FyZWVycwAAAAhleGVyY2lzZQlSlv73AAAACV9fdXBkYXRlZA==\n	1385630983
session:86cd69fb6c9a5de8195629d1c68dda73a120d63e                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAyMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKBHRpbmcAAAAIcGFzc3dvcmQKCeipueW6ree+vQAAAARu\nYW1lCglOMDEyMDAwMjMAAAACaWQAAAAGX191c2VyCVJZEwEAAAAJX19jcmVhdGVkCgljYW5kaWRh\ndGUAAAAIZXhlcmNpc2UJUlkTAQAAAAlfX3VwZGF0ZWQ=\n	1381572886
session:9e06458c44c46bc6921f04d3a54fbdfc7fee109e                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUJUlX/9AAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJY2FuZGlkYXRlAAAACGV4ZXJj\naXNlCVJV//4AAAAJX191cGRhdGVk\n	1381371513
session:834ed4008f399018ba75ec5d7d8392f5af456ef8                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMDAzMwAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3poaQAAAAhwYXNzd29yZAoJ6JWt6Iez56WQAAAABG5h\nbWUKCU4wMTIwMDAzMwAAAAJpZAAAAAZfX3VzZXIKCjEzODUwMDYxNzEAAAAJX19jcmVhdGVkCgdj\nYXJlZXJzAAAACGV4ZXJjaXNlCVKNhHsAAAAJX191cGRhdGVk\n	1385009803
session:37fffe4546f26e8109352dcbca383f98f210a515                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqfobQAAAAlfX2NyZWF0ZWQEAwAAAAMKA21pbgAAAAhwYXNzd29y\nZAoJ5b6Q5pWP6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqgD/gAAAAlfX3VwZGF0ZWQ=\n	1386746391
session:48d96b5199b5184e5d845dc6c11183dac36eba6f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFY5NzQxMDY0AAAACXBsYXllcl9pZAoH\nRkxBMDAwNgAAAAZsZWFndWUEAwAAAAMKBGZhbmcAAAAIcGFzc3dvcmQKCeeZveiKs+eRnAAAAARu\nYW1lCghWOTc0MTA2NAAAAAJpZAAAAAZfX3VzZXIJUqK9nAAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSor2cAAAACV9fdXBkYXRlZA==\n	1386400711
session:0f1dabc57e0ee761dc8958d5328fbb7fb4ea3fd9                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDEyMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUEAwAAAAMKBGd1ZWkAAAAIcGFzc3dvcmQKCeadjuahguiLsQAAAARu\nYW1lCglOMDAxMjAwNTYAAAACaWQAAAAGX191c2VyCgoxMzg1MzU0NDAxAAAACV9fY3JlYXRlZAoH\nY2FyZWVycwAAAAhleGVyY2lzZQlSktUUAAAACV9fdXBkYXRlZA==\n	1385358116
session:d4b4f4f2cbdedf3021b02c2e535c330b80929554                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMjIwMjEwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKA3dlbgAAAAhwYXNzd29yZAoJ6Zmz5paH5YSEAAAABG5h\nbWUKCU4wMjIwMjEwMQAAAAJpZAAAAAZfX3VzZXIKCjEzODE1OTAzMTAAAAAJX19jcmVhdGVkCglj\nYW5kaWRhdGUAAAAIZXhlcmNpc2UJUllrDQAAAAlfX3VwZGF0ZWQ=\n	1381595427
session:e7a224d72bda353bf2e0f383a7fa222eb6cc1d76                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFUwMjIyMTMzAAAACXBsYXllcl9pZAoH\nR0wwMDAwNgAAAAZsZWFndWUEAwAAAAMKBWNob25nAAAACHBhc3N3b3JkCgnmtKrltIfmtLoAAAAE\nbmFtZQoIVTAyMjIxMzMAAAACaWQAAAAGX191c2VyCVJbjKgAAAAJX19jcmVhdGVkCgdqYWNrc29u\nAAAACGV4ZXJjaXNlCVJbjKgAAAAJX191cGRhdGVk\n	1381735096
session:6727d0b299e891d734ec9b8b2f8ddd511833f200                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCUIwMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nBkFGTjJOMAAAAAZsZWFndWUEAwAAAAMKAnNpAAAACHBhc3N3b3JkCgnojIPmgJ3mg58AAAAEbmFt\nZQoJQjAwMjAwMDU0AAAAAmlkAAAABl9fdXNlcgoKMTM4MTU2Nzk1NQAAAAlfX2NyZWF0ZWQKCWNh\nbmRpZGF0ZQAAAAhleGVyY2lzZQlSWRDuAAAACV9fdXBkYXRlZA==\n	1381572356
session:b5c5bf02df4900bb9f090480b0a5ab3619b15f90                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjJOMAAAAAZsZWFndWUKCjEzODE0MDUwNDgAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCWNhbmRpZGF0ZQAA\nAAhleGVyY2lzZQlSVpHLAAAACV9fdXBkYXRlZA==\n	1381411587
session:8d4a4e00f2f0ebd355fedaef021d14bb6ec51fae                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM4NjczMjIwMQAAAAlfX2NyZWF0ZWQKBkFGTjNZMAAAAAZsZWFndWUKB3EtYW5kLWEAAAAI\nZXhlcmNpc2UJUqfbSgAAAAlfX3VwZGF0ZWQ=\n	1386735962
session:c577e6e90b3d40f77ef0da88f727f9d58b69c0d9                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFUwMjIyMTMzAAAACXBsYXllcl9pZAoK\nMTM4MTczMTQ5OAAAAAlfX2NyZWF0ZWQEAwAAAAMKBWNob25nAAAACHBhc3N3b3JkCgnmtKrltIfm\ntLoAAAAEbmFtZQoIVTAyMjIxMzMAAAACaWQAAAAGX191c2VyCgdHTDAwMDA2AAAABmxlYWd1ZQoH\namFja3NvbgAAAAhleGVyY2lzZQlSW4ytAAAACV9fdXBkYXRlZA==\n	1381735101
session:05e7b8629c1794df0d9cede1f43997d3e2e6649a                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCFY5NzQxMDY0AAAACXBsYXllcl9pZAoH\nRkxBMDAwNgAAAAZsZWFndWUEAwAAAAMKBGZhbmcAAAAIcGFzc3dvcmQKCeeZveiKs+eRnAAAAARu\nYW1lCghWOTc0MTA2NAAAAAJpZAAAAAZfX3VzZXIJUqVZOwAAAAlfX2NyZWF0ZWQKCWNhbmRpZGF0\nZQAAAAhleGVyY2lzZQlSpVk7AAAACV9fdXBkYXRlZA==\n	1386571598
session:150f92b8ffd1baa8159e68e337b0a1e71b5d2bd0                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODY2ODQyMjgAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKBmludHJvcwAAAAhl\neGVyY2lzZQlSpx/fAAAACV9fdXBkYXRlZA==\n	1386688822
session:b907b3c3977207cbe008e7ded0db91a6d6a18aa5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODY3MjgxMjkAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAI\nZXhlcmNpc2UJUqfbcgAAAAlfX3VwZGF0ZWQ=\n	1386736194
session:f3e03b366d53f725b1c419ab22d93b7fb24552c3                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUEAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFt\nZQoJTjk2MjAwMDMwAAAAAmlkAAAABl9fdXNlcglSp/vHAAAACV9fY3JlYXRlZAoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSp/vHAAAACV9fdXBkYXRlZA==\n	1386744524
session:7f68e09823815c22931a971931d6988e1395b5f6                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUJUqgudgAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlhAAAACHBhc3N3b3Jk\nCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqC6BAAAACV9fdXBkYXRlZA==\n	1386757267
session:95814f8d321a0bb8b7de22e4e88b024441bb0116                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAyOQAAAAlwbGF5ZXJfaWQK\nAAAAAAZsZWFndWUKCjEzODY3NTgyMDcAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29y\nZAoJ6a2P57695ai4AAAABG5hbWUKCU4wMDIwMDAyOQAAAAJpZAAAAAZfX3VzZXIJUqhATwAAAAlf\nX3VwZGF0ZWQ=\n	1386761823
session:7ce3926125a495616b9eb7c5a63e32e2c7d000a4                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzcxNjcwOAAAAAlfX2NyZWF0ZWQJUrbgZAAAAAlfX3VwZGF0ZWQ=\n	1387720308
session:7a291427020e33434560e9038dd7cb351cb4bcc2                        	BQgDAAAAAwlS3pzyAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVLenPIAAAAJ\nX191cGRhdGVk\n	1390324481
session:3c3773f61a4755fc0eca2f4d5e0027e6ba7b7cfb                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAyNQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHh1YW4AAAAIcGFzc3dvcmQKCemZs+Wuo+iynQAAAARuYW1lCglOMDAyMDAwMjUAAAAC\naWQAAAAGX191c2VyCVKp0eUAAAAJX19jcmVhdGVkCgZBRk4zWTAAAAAGbGVhZ3VlCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKp1UkAAAAJX191cGRhdGVk\n	1386866063
session:02bd5ce832f69ab6f0566ba1afb6f62427fe4597                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODY3NjgwOTYAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAI\nZXhlcmNpc2UJUqhnCgAAAAlfX3VwZGF0ZWQ=\n	1386771752
session:903de1eb7013b33bbd144319baaeaa5a7ed80381                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODY4NTY2MTMAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAI\nZXhlcmNpc2UJUqnA1wAAAAlfX3VwZGF0ZWQ=\n	1386860274
session:c2c8aa72a84511d7a7b03ee9c8f8bc13fe70019c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA0MgAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqnFvAAAAAlfX2NyZWF0ZWQEAwAAAAMKBHhpYW8AAAAIcGFzc3dv\ncmQKCemmruWwj+iTiQAAAARuYW1lCglOMDAyMDAwNDIAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKpxcQAAAAJX191cGRhdGVk\n	1386862501
session:b0426f64d6b89ee8eca47023109ad46dbfe5f50f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAyOQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqhAdgAAAAlfX2NyZWF0ZWQEAwAAAAMKAnl1AAAACHBhc3N3b3Jk\nCgnprY/nvr3lqLgAAAAEbmFtZQoJTjAwMjAwMDI5AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqECEAAAACV9fdXBkYXRlZA==\n	1386764976
session:c3a57796e21690083e2cc10f2a3a73455b0d2b09                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqnP3wAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqnQKgAAAAlfX3VwZGF0ZWQ=\n	1386868044
session:35feeaebc56a2b1580513d4b544be7455ceb362f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMzAwMwAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUEAwAAAAMKAnppAAAACHBhc3N3b3JkCgnlkLPntKvlvaQAAAAEbmFt\nZQoJTjAxMjAzMDAzAAAAAmlkAAAABl9fdXNlcglSqdZMAAAACV9fY3JlYXRlZAoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqdZMAAAACV9fdXBkYXRlZA==\n	1386868360
session:dbd2f968b988af0246d58b123f8d5c0f3e1af2f2                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIJUqhjAQAAAAlfX2NyZWF0ZWQKBkFGTjMwMAAAAAZsZWFndWUKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqhkYAAAAAlfX3VwZGF0ZWQ=\n	1386771058
session:40b3f00346879dc842c4282dfed9fc2c92568289                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NgAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUJUqiSdwAAAAlfX2NyZWF0ZWQEAwAAAAMKA21pbgAAAAhwYXNzd29y\nZAoJ5b6Q5pWP6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqibZwAAAAlfX3VwZGF0ZWQ=\n	1386785146
session:824c6a5467e1b04b1037db4cfca8ce353d0f2c02                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUEAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFt\nZQoJTjk2MjAwMDMwAAAAAmlkAAAABl9fdXNlcglSqfS0AAAACV9fY3JlYXRlZAoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqfS0AAAACV9fdXBkYXRlZA==\n	1386876309
session:917d6015bd0e9cfcf56a53d6d410a856e9d71b74                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqp1+QAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqp1/wAAAAlfX3VwZGF0ZWQ=\n	1386906650
session:970ca33b22f7156ede793fe8fd4c60a103c17059                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUqpX/AAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSqlgFAAAACV9fdXBkYXRlZA==\n	1386899021
session:58f924c79a458d789bd4b0583b267cf1bb99c466                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqnJUAAAAAlfX2NyZWF0ZWQEAwAAAAMKBHNvbmcAAAAIcGFzc3dv\ncmQKCeW+kOmgjOiPrwAAAARuYW1lCglOMDAyMDAwMzAAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKpyVYAAAAJX191cGRhdGVk\n	1386865209
session:057a51a33d77696ce3e16f3d81e32b99fce1dfc6                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqpEJQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqpEKgAAAAlfX3VwZGF0ZWQ=\n	1386893890
session:505213b1ee046ad849f1be4685af6207bf633076                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnlhAAAACHBhc3N3b3JkCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlk\nAAAABl9fdXNlcglSqmjrAAAACV9fY3JlYXRlZAoGQUZOM1kwAAAABmxlYWd1ZQoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqmmbAAAACV9fdXBkYXRlZA==\n	1386905205
session:d72cffa1f98219636480e24cf281013a478b5b30                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODY4OTkyNjEAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAI\nZXhlcmNpc2UJUqpnYgAAAAlfX3VwZGF0ZWQ=\n	1386903469
session:b4a35acc45f389afb761fec8726527894aa04852                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNgAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqp1FAAAAAlfX2NyZWF0ZWQEAwAAAAMKBWNoZW5nAAAACHBhc3N3\nb3JkCgnlva3miJDos5MAAAAEbmFtZQoJTjAwMjAwMDM2AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQt\nYQAAAAhleGVyY2lzZQlSqoKBAAAACV9fdXBkYXRlZA==\n	1386910148
session:cae4cc5bfd91be0fd30767ca996ff747b817e557                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUqqFPAAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSqoVCAAAACV9fdXBkYXRlZA==\n	1386916065
session:b830d11e7d1c8843dc2e57810b6d3ab2567baa9e                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA21pbgAAAAhwYXNzd29yZAoJ5b6Q5pWP6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJp\nZAAAAAZfX3VzZXIJUqqFtQAAAAlfX2NyZWF0ZWQKBkFGTjMwMAAAAAZsZWFndWUKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqqGEQAAAAlfX3VwZGF0ZWQ=\n	1386910760
session:9af2ed3aca9f2160b27922e3a2603a65f3521ffd                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUqqK9QAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSqor9AAAACV9fdXBkYXRlZA==\n	1386912047
session:35e8ffe749574c6fca184d06de56007dc7ae1c0f                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1MQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3J1aQAAAAhwYXNzd29yZAoJ5oi0552/6JCxAAAABG5hbWUKCU4wMDIwMDA1MQAAAAJp\nZAAAAAZfX3VzZXIJUqsJmQAAAAlfX2NyZWF0ZWQKB3EtYW5kLWEAAAAIZXhlcmNpc2UJUqsJmQAA\nAAlfX3VwZGF0ZWQ=\n	1386944425
session:c6719d4645edd772fd3324d91c3c554475faf9e7                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqqcgwAAAAlfX2NyZWF0ZWQEAwAAAAMKAnl1AAAACHBhc3N3b3Jk\nCgnlionnjonmhacAAAAEbmFtZQoJTjAwMjAwMDA5AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqpyMAAAACV9fdXBkYXRlZA==\n	1386916527
session:01706f354ed651a9dcb201e843239604cc805d12                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1MQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqr/UgAAAAlfX2NyZWF0ZWQEAwAAAAMKA3J1aQAAAAhwYXNzd29y\nZAoJ5oi0552/6JCxAAAABG5hbWUKCU4wMDIwMDA1MQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqr/aQAAAAlfX3VwZGF0ZWQ=\n	1386943597
session:975db18e7556ee8a00ef8551bdc8045e6b266613                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMjAwNAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqqeNQAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlpAAAACHBhc3N3b3Jk\nCgnmnpflrpzlhJIAAAAEbmFtZQoJTjAxMjAyMDA0AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqp5AAAAACV9fdXBkYXRlZA==\n	1386917013
session:7469e6587f6caf871564ef65d6b746133d30a405                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUqrkFwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSquQfAAAACV9fdXBkYXRlZA==\n	1386935885
session:ed1e74351e790ff8fd62a584a66b6654afcd0410                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUqr7pQAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSqvuzAAAACV9fdXBkYXRlZA==\n	1386943669
session:daf0d7abe7b40c9af13c3cfbbac819f758041b92                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUJUqu4MAAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqu4NgAAAAlfX3VwZGF0ZWQ=\n	1386990295
session:2a13b4dd1fc570e6efc3eca038ec6326a31a1365                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA0MgAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqr8ZwAAAAlfX2NyZWF0ZWQEAwAAAAMKBHhpYW8AAAAIcGFzc3dv\ncmQKCemmruWwj+iTiQAAAARuYW1lCglOMDAyMDAwNDIAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKq/IIAAAAJX191cGRhdGVk\n	1386941836
session:20cbc41d36d885ef0148ab3f73201079a03eadd3                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqqpEgAAAAlfX2NyZWF0ZWQEAwAAAAMKAmVuAAAACHBhc3N3b3Jk\nCgnlkYLmganoj68AAAAEbmFtZQoJTjAwMjAwMDU0AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqqkbAAAACV9fdXBkYXRlZA==\n	1386921409
session:c97bca5c652802b47ba7bdf288d10c1e3d55a2f7                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqr8kQAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlhAAAACHBhc3N3b3Jk\nCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqvypAAAACV9fdXBkYXRlZA==\n	1386941125
session:815f02ed55d36679bfe301139cd4a1bce7217f73                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqr+1QAAAAlfX2NyZWF0ZWQEAwAAAAMKBGJpbmcAAAAIcGFzc3dv\ncmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKq/uMAAAAJX191cGRhdGVk\n	1386941697
session:6b777cc355552cdbe3216dafe8d21251bd6310db                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqqjBQAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlhAAAACHBhc3N3b3Jk\nCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqtsPAAAACV9fdXBkYXRlZA==\n	1386932593
session:519a29d53982b9ff6c852514167be876f83e015c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqsB0gAAAAlfX2NyZWF0ZWQEAwAAAAMKAmVuAAAACHBhc3N3b3Jk\nCgnlkYLmganoj68AAAAEbmFtZQoJTjAwMjAwMDU0AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqwHlAAAACV9fdXBkYXRlZA==\n	1386943671
session:fdf12c72bb9105962fd09fc83ae48e31d3a7596a                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNAAAAAlwbGF5ZXJfaWQK\nAAAAAAZsZWFndWUJUqr8eQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3h1ZQAAAAhwYXNzd29yZAoJ6a2P\n6Zuq5aaCAAAABG5hbWUKCU4wMDIwMDAzNAAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAIZXhl\ncmNpc2UJUqr8gQAAAAlfX3VwZGF0ZWQ=\n	1386941873
session:376162ce0ab1cfa380b7ac0c9c67bfa02c480ac1                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNwAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqr0+wAAAAlfX2NyZWF0ZWQEAwAAAAMKAnl1AAAACHBhc3N3b3Jk\nCgnmnpfmmLHnkaQAAAAEbmFtZQoJTjAwMjAwMDM3AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSqvUJAAAACV9fdXBkYXRlZA==\n	1386941184
session:72e4273295cdaebe4c4546641c30349db85bc4cc                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIJUqr/MwAAAAlfX2NyZWF0ZWQKBkFGTjNZMAAAAAZsZWFndWUKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUqsGNgAAAAlfX3VwZGF0ZWQ=\n	1386943560
session:7e5c408dbf8bea5636d708de8314750e6d3dc6e5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMjAwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqsdXQAAAAlfX2NyZWF0ZWQEAwAAAAMKBHFpYW8AAAAIcGFzc3dv\ncmQKCeiVreW3p+iWhwAAAARuYW1lCglOMDEyMDIwMDEAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKrHWcAAAAJX191cGRhdGVk\n	1386952577
session:32e1ad428bed1544e54c2a3f1d75bd7bd7f7d427                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqsdnAAAAAlfX2NyZWF0ZWQEAwAAAAMKBHNvbmcAAAAIcGFzc3dv\ncmQKCeW+kOmgjOiPrwAAAARuYW1lCglOMDAyMDAwMzAAAAACaWQAAAAGX191c2VyCgdxLWFuZC1h\nAAAACGV4ZXJjaXNlCVKrHaIAAAAJX191cGRhdGVk\n	1386951466
session:80fa8472d87fd0189e0aac0c5401fcb1cf237f26                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNAAAAAlwbGF5ZXJfaWQK\nAAAAAAZsZWFndWUJUqxSlgAAAAlfX2NyZWF0ZWQEAwAAAAMKA3h1ZQAAAAhwYXNzd29yZAoJ6a2P\n6Zuq5aaCAAAABG5hbWUKCU4wMDIwMDAzNAAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEAAAAIZXhl\ncmNpc2UJUqxSmgAAAAlfX3VwZGF0ZWQ=\n	1387028674
session:e2fd763c752053e41a271fd74e8681e9c5676f2c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMjAwNAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUqx0XAAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlpAAAACHBhc3N3b3Jk\nCgnmnpflrpzlhJIAAAAEbmFtZQoJTjAxMjAyMDA0AAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSrHX4AAAACV9fdXBkYXRlZA==\n	1387039601
session:27e6ac5da0dfca9322d63f778b02c29c022bc84b                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzQyODQ5MQAAAAlfX2NyZWF0ZWQJUrJ6iwAAAAlfX3VwZGF0ZWQ=\n	1387432091
session:bc1fb31463f394366f6293cb4da060bfbe881414                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUJUq0ePgAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUq0eRQAAAAlfX3VwZGF0ZWQ=\n	1387080791
session:b279def0c700e1f7e41b7b0f2333bbd3a8080ce3                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMzAwMwAAAAlwbGF5ZXJfaWQK\nCjEzODc0NTkyNDAAAAAJX19jcmVhdGVkBAMAAAADCgJ6aQAAAAhwYXNzd29yZAoJ5ZCz57Sr5b2k\nAAAABG5hbWUKCU4wMTIwMzAwMwAAAAJpZAAAAAZfX3VzZXIJUrLy2AAAAAlfX3VwZGF0ZWQ=\n	1387462888
session:baefc8756576d4e20fa9142d06d780d6b648e877                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrABNwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoHcS1hbmQtYQAAAAhleGVyY2lz\nZQlSsAFCAAAACV9fdXBkYXRlZA==\n	1387275810
session:85f504e7f8982824112be37ec27e88cb8b2a8753                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQK\nBkFGTjMwMAAAAAZsZWFndWUJUq8PkQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUq8PnwAAAAlfX3VwZGF0ZWQ=\n	1387208185
session:7d762fd9b8a185ab07cc216f2139b5e18230b4fe                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUq0NTgAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29y\nZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUq0NVQAAAAlfX3VwZGF0ZWQ=\n	1387076484
session:9c45dd41bb47500e97b4174765417bcf3a03ec38                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNAAAAAlwbGF5ZXJfaWQK\nBkFGTjNZMAAAAAZsZWFndWUJUq/yzQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3h1ZQAAAAhwYXNzd29y\nZAoJ6a2P6Zuq5aaCAAAABG5hbWUKCU4wMDIwMDAzNAAAAAJpZAAAAAZfX3VzZXIKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUq/y1gAAAAlfX3VwZGF0ZWQ=\n	1387267193
session:2f9ea54836aa3b410bbc6a586b597c71dc47535f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrL+TwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0yAAAACGV4ZXJj\naXNlCVKy/lsAAAAJX191cGRhdGVk\n	1387465871
session:681d56243ef6b977aad133dea1aebe87df668b13                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA21pbgAAAAhwYXNzd29yZAoJ5b6Q5pWP6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc0MzUxODUAAAAJX19jcmVhdGVkCVKylSgAAAAJX191cGRhdGVk\n	1387438904
session:a5889328dff6aa4296f7477179b289d76f2d3194                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODczMjM2NTUAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCXEtYW5kLWEtMgAA\nAAhleGVyY2lzZQlSsOFTAAAACV9fdXBkYXRlZA==\n	1387327506
session:60a0f47ca0ddfe36e85b3e81fed00dfbd69e1db2                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMjAwNAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnmnpflrpzlhJIAAAAEbmFtZQoJTjAxMjAyMDA0AAAAAmlk\nAAAABl9fdXNlcglSsGsDAAAACV9fY3JlYXRlZAoGQUZOM1kwAAAABmxlYWd1ZQoHcS1hbmQtYQAA\nAAhleGVyY2lzZQlSsGs6AAAACV9fdXBkYXRlZA==\n	1387297173
session:a4d2dc4565fc9602b4902f6c8a08c0df1c2155c9                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQlS\nsF+xAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoGMTkzMDAxAAAACXBsYXllcl9pZAQDAAAA\nAwoCb2sAAAAIcGFzc3dvcmQKBkRyQmVhbgAAAARuYW1lCgYxOTMwMDEAAAACaWQAAAAGX191c2Vy\nCgoxMzg3Mjg0MzI0AAAACV9fY3JlYXRlZAoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387294149
session:f44269cd1195886e0488ae9f08093b56c145e698                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA0MwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ5YqJ5L2p5qyjAAAABG5hbWUKCU4wMDIwMDA0MwAAAAJp\nZAAAAAZfX3VzZXIJUq0JZQAAAAlfX2NyZWF0ZWQKBkFGTjMwMAAAAAZsZWFndWUKB3EtYW5kLWEA\nAAAIZXhlcmNpc2UJUq0ZOgAAAAlfX3VwZGF0ZWQ=\n	1387079837
session:59f3c613fa68c1963cf7a817b0dac67be877b736                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJp\nZAAAAAZfX3VzZXIKCjEzODczNzczMjgAAAAJX19jcmVhdGVkCVKxsrAAAAAJX191cGRhdGVk\n	1387380928
session:79025aa8df4a2da1e028c8a031e73eb964c46e94                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnlhAAAACHBhc3N3b3JkCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzQyMzU5OQAAAAlfX2NyZWF0ZWQJUrJncAAAAAlfX3VwZGF0ZWQ=\n	1387427199
session:d6f5ad7b63023ba7dfcf5860ef9239edef592a6c                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzQyODQzMAAAAAlfX2NyZWF0ZWQJUrJ6TwAAAAlfX3VwZGF0ZWQ=\n	1387432030
session:da18c6c55f493e0660561078df9f9cd00baf7b36                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc0NTg5MzIAAAAJX19jcmVhdGVkCVKy8XQAAAAJX191cGRhdGVk\n	1387462532
session:e7a7973b5d741256bc354918daa9fdcc9fd7b9d7                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc0NTk1NzQAAAAJX19jcmVhdGVkCVKy8/YAAAAJX191cGRhdGVk\n	1387463182
session:d26d7f32d74c023efb36d88251ddeb412b314953                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHNvbmcAAAAIcGFzc3dvcmQKCeW+kOmgjOiPrwAAAARuYW1lCglOMDAyMDAwMzAAAAAC\naWQAAAAGX191c2VyCgoxMzg3NDYyNTM3AAAACV9fY3JlYXRlZAlSsv+KAAAACV9fdXBkYXRlZA==\n	1387466137
session:2f046eee627ea4fd771c973880f511fe1e8d5113                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHNvbmcAAAAIcGFzc3dvcmQKCeW+kOmgjOiPrwAAAARuYW1lCglOMDAyMDAwMzAAAAAC\naWQAAAAGX191c2VyCgoxMzg3NDYyNTU5AAAACV9fY3JlYXRlZAlSsv+fAAAACV9fdXBkYXRlZA==\n	1387466159
session:55e5e72970d298f573954550fbaa09db2bf28d71                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg3NDYzMzE0AAAACV9fY3JlYXRlZAlSswKTAAAACV9fdXBkYXRlZA==\n	1387466914
session:c00862552ee921ccde0a8672e55ca2ba28e740a0                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnl1AAAACHBhc3N3b3JkCgnlionnjonmhacAAAAEbmFtZQoJTjAwMjAwMDA5AAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzUwMjU3OQAAAAlfX2NyZWF0ZWQJUrOb9AAAAAlfX3VwZGF0ZWQ=\n	1387506179
session:416b5a2e4db3f5c39534e3f5d0ece429f9e758bb                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg3NTQyOTQwAAAACV9fY3JlYXRlZAlStDnHAAAACV9fdXBkYXRlZA==\n	1387546583
session:1afcec663c91cded23f206f90327a95049d93079                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrOryAAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0yAAAACGV4ZXJj\naXNlCVKzq9AAAAAJX191cGRhdGVk\n	1387517418
session:1c0df85d9a1e3319717fbe444a03b218b288dae2                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNgAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBWNoZW5nAAAACHBhc3N3b3JkCgnlva3miJDos5MAAAAEbmFtZQoJTjAwMjAwMDM2AAAA\nAmlkAAAABl9fdXNlcgoKMTM4NzUwNzk4MwAAAAlfX2NyZWF0ZWQJUrOxDwAAAAlfX3VwZGF0ZWQ=\n	1387511583
session:e6a8b78c6b72e99d18edca92853b49f76fcbde9d                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzUxNTE1NQAAAAlfX2NyZWF0ZWQJUrPNEwAAAAlfX3VwZGF0ZWQ=\n	1387518755
session:9363b58c8d9f24c1518b14d8c8778aef65c0ceab                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzUxNTIxMwAAAAlfX2NyZWF0ZWQJUrPNTQAAAAlfX3VwZGF0ZWQ=\n	1387518813
session:7f2e5f4c7a72586deff32dfdbd41c4c7714e789b                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwOAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnlhAAAACHBhc3N3b3JkCgnnjovpm4XmhacAAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzUxNjQ0MQAAAAlfX2NyZWF0ZWQJUrPSGQAAAAlfX3VwZGF0ZWQ=\n	1387520041
session:ba8441a341d7e8d8a17e3a190fc48f9ac46e1558                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHNvbmcAAAAIcGFzc3dvcmQKCeW+kOmgjOiPrwAAAARuYW1lCglOMDAyMDAwMzAAAAAC\naWQAAAAGX191c2VyCgoxMzg3NTI0MDc1AAAACV9fY3JlYXRlZAlSs+/rAAAACV9fdXBkYXRlZA==\n	1387529444
session:34f159ca21fb52e4b0e258b5fcdfe336421cf2bf                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1MTA0NzAAAAAJX19jcmVhdGVkCVKzusYAAAAJX191cGRhdGVk\n	1387514081
session:020dc9575c5aa602ac931beea6686d26a17a5b41                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA0MwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3BlaQAAAAhwYXNzd29yZAoJ5YqJ5L2p5qyjAAAABG5hbWUKCU4wMDIwMDA0MwAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NDMwNzQAAAAJX19jcmVhdGVkCVK0OiIAAAAJX191cGRhdGVk\n	1387546674
session:1bad1b129a42a3b9afbf2da7fc59040a18f1c0c3                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStCrhAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAoG\nQUZOM1kwAAAABmxlYWd1ZQoKMTM4NzUzODU0MwAAAAlfX2NyZWF0ZWQEAwAAAAMKA21pbgAAAAhw\nYXNzd29yZAoJ5b6Q5pWP6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJpZAAAAAZfX3VzZXI=\n	1387543481
session:b082f433b206edefac7f0aa14b099f10b85a9201                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NgAAAAlwbGF5ZXJfaWQK\nCjEzODc1Mzg1OTYAAAAJX19jcmVhdGVkBAMAAAADCgNtaW4AAAAIcGFzc3dvcmQKCeW+kOaVj+iP\nrwAAAARuYW1lCglOMDAyMDAwNTYAAAACaWQAAAAGX191c2VyCVK0KS4AAAAJX191cGRhdGVk\n	1387542334
session:069440f1affcdff975e13daa5e866351fcaed5ed                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMTIwMjAwNAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAnlpAAAACHBhc3N3b3JkCgnmnpflrpzlhJIAAAAEbmFtZQoJTjAxMjAyMDA0AAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzU0MzMyNAAAAAlfX2NyZWF0ZWQJUrQ7HQAAAAlfX3VwZGF0ZWQ=\n	1387546924
session:c7911f77cbec9323d490fcc09d1e301358e8f888                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NTgyNzAAAAAJX19jcmVhdGVkCVK0dX4AAAAJX191cGRhdGVk\n	1387561870
session:aa5359261f0ff8801a1e0698b09de769b4cc9460                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NDI3NDEAAAAJX19jcmVhdGVkCVK0ONUAAAAJX191cGRhdGVk\n	1387546341
session:4e210a06df1de7c7c48c4037038ca0d6894f4e1f                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrQ4mwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0yAAAACGV4ZXJj\naXNlCVK0OKUAAAAJX191cGRhdGVk\n	1387548758
session:7076f1c652877a6b3380b06f5ae0c7089e42b75f                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNAAAAAlwbGF5ZXJfaWQK\nCjEzODc1NTM4NjcAAAAJX19jcmVhdGVkBAMAAAADCgN4dWUAAAAIcGFzc3dvcmQKCemtj+mbquWm\nggAAAARuYW1lCglOMDAyMDAwMzQAAAACaWQAAAAGX191c2VyCVK0ZKoAAAAJX191cGRhdGVk\n	1387557562
session:9f6189c941fb7e3b801c81feaf545e07695c0d2e                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAxNwAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5r2Y5L+h5a6JAAAABG5hbWUKCU4wMDIwMDAxNwAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NDczMjcAAAAJX19jcmVhdGVkCVK0Sr8AAAAJX191cGRhdGVk\n	1387550927
session:20d8fa994c8a069f3b7be1256be8567c7d1cefae                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU45NjIwMDAzMAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKAmFuAAAACHBhc3N3b3JkCgnnjovlronlpqQAAAAEbmFtZQoJTjk2MjAwMDMwAAAAAmlk\nAAAABl9fdXNlcgoKMTM4NzU1MDEwNwAAAAlfX2NyZWF0ZWQJUrRVmwAAAAlfX3VwZGF0ZWQ=\n	1387553707
session:38f81cdb1f4297efe1af638c79be803f806629fe                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNAAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3h1ZQAAAAhwYXNzd29yZAoJ6a2P6Zuq5aaCAAAABG5hbWUKCU4wMDIwMDAzNAAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NTM4NDIAAAAJX19jcmVhdGVkCVK0ZDIAAAAJX191cGRhdGVk\n	1387557442
session:1f2ad925965cf3a5e85e7964ede7ded93bcaaac3                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA2ppYQAAAAhwYXNzd29yZAoJ5Zq05L2z6aaoAAAABG5hbWUKCU4wMDIwMDAzMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1NTQzNjYAAAAJX19jcmVhdGVkCVK0Zj4AAAAJX191cGRhdGVk\n	1387557966
session:5bcc95e8641bd849bf63de259ae9734010ce9acb                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQK\nCjEzODc1ODcyNTMAAAAJX19jcmVhdGVkBAMAAAADCgN4aW4AAAAIcGFzc3dvcmQKCeW8teiKr+eR\ngAAAAARuYW1lCglOMDAyMDAwMDEAAAACaWQAAAAGX191c2VyCVK06D4AAAAJX191cGRhdGVk\n	1387591246
session:adfd0d137bce8ff4d34898e5b07d5ea68f97aafa                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzMQAAAAlwbGF5ZXJfaWQK\nCjEzODkzNTU5NjcAAAAJX19jcmVhdGVkBAMAAAADCgNqaWEAAAAIcGFzc3dvcmQKCeWatOS9s+mm\nqAAAAARuYW1lCglOMDAyMDAwMzEAAAACaWQAAAAGX191c2VyCgxxLWFuZC1hLWV4YW0AAAAIZXhl\ncmNpc2UJUs/kLQAAAAlfX3VwZGF0ZWQ=\n	1389359691
session:cc639541e51af56337328202ef0dd21cdd83a78e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStXDDAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\ntXC4AAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387626649
session:0a87129e7f51aa864f08a35496cc4e510256f0df                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODc1ODc3MTUAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCXEtYW5kLWEtMgAA\nAAhleGVyY2lzZQlStOvhAAAACV9fdXBkYXRlZA==\n	1387592182
session:9526e03229461fa939cc2de2e8796695d6043201                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStOdkAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAoG\nQUZOM1kwAAAABmxlYWd1ZQQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoKMTM4NzU4NzMxMAAAAAlfX2NyZWF0ZWQ=\n	1387591283
session:5b49d4ffda7186a020c85fc9624566e3900e2aea                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1OTEyNzkAAAAJX19jcmVhdGVkCVK09m8AAAAJX191cGRhdGVk\n	1387594879
session:366c99c6d1777394445dd3903ca4af9dfb15da4a                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1ODc5MzkAAAAJX19jcmVhdGVkCVK06WMAAAAJX191cGRhdGVk\n	1387591539
session:b3fc55a09ad6958fcd83a2cf184bd115048a3036                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQlS\ntQC1AAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAoK\nMTM4NzU5MjU1MAAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GA\nAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387597539
session:d65f5e63af12736b0f59ad1c52b56b44d87eedef                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrTpjwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0yAAAACGV4ZXJj\naXNlCVK06aIAAAAJX191cGRhdGVk\n	1387591623
session:9763e19990cd575c5ae5de73fec58ed74d14e1b5                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODc1ODgwODEAAAAJX19jcmVhdGVkCVK06fEAAAAJX191cGRhdGVk\n	1387591681
session:eb60347db3b9c33c165183e7ca35c697c5093a66                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStkg7AAAACV9fdXBkYXRlZAoJTjAwMjAwMDE3AAAACXBsYXllcl9pZAlS\ntkgsAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnmvZjkv6HlrokAAAAEbmFt\nZQoJTjAwMjAwMDE3AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387681872
session:45ddbb4336e3eb54629be78bd87eec1c963d4a07                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUrTqDAAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0yAAAACGV4ZXJj\naXNlCVK06hoAAAAJX191cGRhdGVk\n	1387591727
session:311bb50316c184da089c0cd333c3e7f00c38cb2e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQlS\ntPmBAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAoG\nQUZOM1kwAAAABmxlYWd1ZQQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoKMTM4NzU5MTQxNAAAAAlfX2NyZWF0ZWQ=\n	1387596124
session:2d65bb4e90eb5465e6c3b280f37240f85eb17784                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStWjGAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\ntWi2AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387624160
session:c129485b8b24b58329067285025d75ecc3cd7cb9                        	BQgDAAAAAwlStqtiAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0yAAAACGV4ZXJjaXNlCVK2q2IAAAAJ\nX191cGRhdGVk\n	1387706738
session:249f725e77c9be378d1f1e22619fb8b754712186                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStqJ1AAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\ntqJgAAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387705922
session:a04ce121b25559e3ef24e046a81d3bdf19fb5935                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStgNbAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\ntgNMAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387666092
session:7685582acc1d848b2e74752048e313d6ebf67d46                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStnw/AAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\ntnwtAAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387694680
session:7fccb0458934db65a1c07e988e16658d05260b1d                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStmQDAAAACV9fdXBkYXRlZAoJTjAwMjAwMDI5AAAACXBsYXllcl9pZAlS\ntmHNAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCemtj+e+veWouAAAAARuYW1l\nCglOMDAyMDAwMjkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387691623
session:290d852f040c40b9baa3e71be5132f0a3a76d952                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStqqNAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\ntqp6AAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387706539
session:239d7e4c7f68bad73c82163165f3677a62fe0819                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStrk9AAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\ntrksAAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387710517
session:0b54dd74e0b785c920638eb36583b0fe73ba87d3                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStswVAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\ntswJAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387715136
session:99df1d7203da4d67d6857cd10f597d44e34edb52                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStuFoAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU0AAAACXBsYXllcl9pZAlS\ntuFVAAAACV9fY3JlYXRlZAQDAAAAAwoCZW4AAAAIcGFzc3dvcmQKCeWRguaBqeiPrwAAAARuYW1l\nCglOMDAyMDAwNTQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387720570
session:fdac5c63cb2cdf3655305f4c16aa84bd0928e181                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSt+OjAAAACV9fdXBkYXRlZAoJTjAxMjAyMDAxAAAACXBsYXllcl9pZAlS\nt+OQAAAACV9fY3JlYXRlZAQDAAAAAwoEcWlhbwAAAAhwYXNzd29yZAoJ6JWt5ben6JaHAAAABG5h\nbWUKCU4wMTIwMjAwMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387787744
session:430428552752844c66d722f9a0ce732a3fb34e67                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSt6VbAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nt6VIAAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387771758
session:631d0e42036f003f66190c65f801bf5e758e219a                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStuS3AAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\ntuSkAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387721429
session:bd94a4ec1a16e0536c07e9ae3933c7b028fd80a6                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQlS\nuBeLAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nuBbJAAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387800151
session:63c0a1e164b3748346546ef79a6e1b492fa4ff08                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSt+UFAAAACV9fdXBkYXRlZAoJTjk2MjAwMDMwAAAACXBsYXllcl9pZAlS\nt+T7AAAACV9fY3JlYXRlZAQDAAAAAwoCYW4AAAAIcGFzc3dvcmQKCeeOi+WuieWmpAAAAARuYW1l\nCglOOTYyMDAwMzAAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387789280
session:c2fe86898b7f89c08173c207e022fd2bbb4fb05e                        	BQgDAAAAAwlSuDGTAAAACV9fY3JlYXRlZAoHY29ubmVsbAAAAAhleGVyY2lzZQlSuDGTAAAACV9f\ndXBkYXRlZA==\n	1387806627
session:296ec7966501339cdbfc864c459610c4db25af60                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSt9GoAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAlS\nt9GJAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARuYW1l\nCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387783251
session:f2e8ccd73a8bb224556d3a070d4608d0d11b5ff5                        	BQgDAAAAAwlSt+KwAAAACV9fY3JlYXRlZAoHY2FyZWVycwAAAAhleGVyY2lzZQlSt+KwAAAACV9f\ndXBkYXRlZA==\n	1387786431
session:2bdb7e2f6234057e660b0037cb72c1808ba32704                        	BQgDAAAAAwlSt+wJAAAACV9fY3JlYXRlZAoHY2FyZWVycwAAAAhleGVyY2lzZQlSt+wJAAAACV9f\ndXBkYXRlZA==\n	1387788825
session:da45c0815372956ee6c3f2b8d40d582def1d5d81                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlStwelAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\ntweRAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387732833
session:44b1162f250401b7a8e7c8141fd5fcc4252e9304                        	BQgDAAAAAwlSt0d5AAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlSt0d5AAAACV9f\ndXBkYXRlZA==\n	1387746697
session:a2df052e7c8bd78299af021dd4260615aba30b27                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuZmIAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nuZlyAAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387898861
session:467e8f25f4b1041debca2476a87f222c87ccbf81                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuEubAAAACV9fdXBkYXRlZAoJTjAxMjAyMDA0AAAACXBsYXllcl9pZAlS\nuEtQAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeael+WunOWEkgAAAARuYW1l\nCglOMDEyMDIwMDQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387815533
session:e464f9fa787cf5b8a3600bcc903af288e0e74123                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuQUPAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\nuQT9AAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387860788
session:f33eaf1071b1834364cf939084ccc76073c62f56                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuFdHAAAACV9fdXBkYXRlZAoJTjAxMjAzMDAzAAAACXBsYXllcl9pZAlS\nuFcvAAAACV9fY3JlYXRlZAQDAAAAAwoCemkAAAAIcGFzc3dvcmQKCeWQs+e0q+W9pAAAAARuYW1l\nCglOMDEyMDMwMDMAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387818038
session:c854c05d2f45dc13b1ff38553288d98bbbf68598                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuPbdAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU1AAAACXBsYXllcl9pZAlS\nuPbMAAAACV9fY3JlYXRlZAQDAAAAAwoEYmluZwAAAAhwYXNzd29yZAoJ6JSh56eJ5YCJAAAABG5h\nbWUKCU4wMDIwMDA1NQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387858753
session:6cffaf762dcfbf5b9151e2079ef25f62e9e67599                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuFSBAAAACV9fdXBkYXRlZAoJTjAxMjAyMDA0AAAACXBsYXllcl9pZAlS\nuFRxAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeael+WunOWEkgAAAARuYW1l\nCglOMDEyMDIwMDQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387815601
session:6321763d1d14ded94e6e394d23f7cae4d6425537                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuRRgAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAoK\nMTM4Nzg2MTA2MwAAAAlfX2NyZWF0ZWQEAwAAAAMKA21pbgAAAAhwYXNzd29yZAoJ5b6Q5pWP6I+v\nAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387865855
session:1af5cecd20e92b10960220c7616e5e5521f08f8f                        	BQgDAAAAAwlSuQw0AAAACV9fY3JlYXRlZAoJcS1hbmQtYS0yAAAACGV4ZXJjaXNlCVK5DDQAAAAJ\nX191cGRhdGVk\n	1387862595
session:c790d42e1c131fa9b71279eeb56bdaed47383c9e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMgAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuWv3AAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nuWvqAAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387887155
session:2f5f6cde6cb33c15333a39597c18600724cb0829                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODk2NjYwOTUAAAAJX19jcmVhdGVkCgxxLWFuZC1hLWV4YW0AAAAIZXhl\ncmNpc2UJUtSfPQAAAAlfX3VwZGF0ZWQ=\n	1389669709
session:df40091422aaa4ad73e9fff850a6db74e2140bae                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuwcIAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nuwb3AAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387996229
session:32c57bad6edb8a081cfa8558e56df54525cc694c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuamxAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nuamVAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387905185
session:15bb127c192427ea4202c44e940a3927dbf84e7c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuaVWAAAACV9fdXBkYXRlZAoJTjAwMjAwMDE3AAAACXBsYXllcl9pZAlS\nuaVNAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnmvZjkv6HlrokAAAAEbmFt\nZQoJTjAwMjAwMDE3AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387902757
session:6342d6e13edf5e01813aeb16711d0db862c3aacb                        	BQgDAAAAAwlSukSsAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK6RKwAAAAJ\nX191cGRhdGVk\n	1387942588
session:053821c21469247b9c22fcdd07b5390f7e338a57                        	BQgDAAAAAwlSuoYBAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK6hgEAAAAJ\nX191cGRhdGVk\n	1387959313
session:fb400af74d49a8d543e4f740e651912c2b7f3353                        	BQgDAAAAAwlSuoZbAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK6hlsAAAAJ\nX191cGRhdGVk\n	1387959403
session:3873a8f3f9cb7cfef8fc0de51ad4364a2f1f5733                        	BQgDAAAAAwlSuoZcAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK6hlwAAAAJ\nX191cGRhdGVk\n	1387959403
session:a1e77bd0c0b3677440ef18510ae30f494b67afd2                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSu+YrAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nu+U1AAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388051157
session:0b662b046c3d018d7b21dd64606a818649e443be                        	BQgDAAAAAwlSupxNAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK6nE0AAAAJ\nX191cGRhdGVk\n	1387965021
session:50b83950e6a30e9c66e8c4a2310a325ae3d292db                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuaOtAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9pZAlS\nuaOdAAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAAAARu\nYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1387902105
session:a2f6b28bb16c8de5694658949db94b540361a637                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSuoZyAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\nuoZdAAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387959449
session:97c9b3bf76e3e2348733bc330350c00ea6987c61                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSupXcAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nupW0AAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387965719
session:8d6140ffb522053444b91d5389a7580f9141f3fa                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUKCjEzODgwMTcwNTAAAAAJX19jcmVhdGVkBAMAAAADCgJvawAAAAhwYXNz\nd29yZAoGRHJCZWFuAAAABG5hbWUKBjE5MzAwMQAAAAJpZAAAAAZfX3VzZXIKCXEtYW5kLWEtMwAA\nAAhleGVyY2lzZQlSu3WzAAAACV9fdXBkYXRlZA==\n	1388020701
session:1a14291a464f2bf6229947971e783813e4e55f10                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQlS\nuuJyAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAoK\nMTM4Nzk3ODk5NQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GA\nAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1387983133
session:10aa2c534ca5fca62570e4a054e2520e982ab652                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSusm4AAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nusmtAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387981648
session:f0a57a390cf0af6cbc6543c47eeba545bbff350b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQlS\nurIZAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAoK\nMTM4Nzk2NTc0NgAAAAlfX2NyZWF0ZWQEAwAAAAMKAnlhAAAACHBhc3N3b3JkCgnnjovpm4XmhacA\nAAAEbmFtZQoJTjAwMjAwMDA4AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1387971000
session:44d4e03a0e1b39719da567210480513f06c6afec                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSu9JeAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAlS\nu9JBAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARuYW1l\nCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388044455
session:de472d1e3e821c7cdff6b1dca5d993cc3355d9c2                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvDQtAAAACV9fdXBkYXRlZAoJTjAwMjAwMDE3AAAACXBsYXllcl9pZAlS\nvDQmAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnmvZjkv6HlrokAAAAEbmFt\nZQoJTjAwMjAwMDE3AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388069764
session:f1baa7c1542a09189765957c3201e97e5e744874                        	BQgDAAAAAwlSvIlXAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVK8iVcAAAAJ\nX191cGRhdGVk\n	1388091239
session:7a439f7b2d44aa44326c105abc094d6b205525f9                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncglSvOA2AAAACV9fY3JlYXRlZAoGQUZOM1kwAAAABmxlYWd1ZQoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVK84d8AAAAJX191cGRhdGVk\n	1388113931
session:c03530ce363e940e1c1bc089dc4ac06da4f3f4df                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvLLUAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9pZAlS\nvLK4AAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAAAARu\nYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388103208
session:32b972ee9f8c92130e29e25b485bac221dae0180                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvOdWAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nvOc+AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388115325
session:c5951d05133862862c094299bf7d83fd4733ef79                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSw6jWAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nw6i/AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388558068
session:116d26d25c6d7032cc021a2014ed4f674dafe02f                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSwR1IAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nwR05AAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388391275
session:d8b9c0bfacab339ecfa3d0808370d5fc341fc77e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvPBlAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nvPBNAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388118899
session:1b3a5ac7cadff7d3d9a08eb7d0980d9309df229d                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUr0MYQAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVK9DHAAAAAJX191cGRhdGVk\n	1388124809
session:6fda350aef542dc4da18b60aaf06eb3a20bf4873                        	BQgDAAAAAwlSv8lEAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVK/yUQAAAAJ\nX191cGRhdGVk\n	1388304212
session:531c1bae079d325a1ecd35bafb6759a45df42a86                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvXWZAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nvXWKAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388154016
session:8f49f95dc8ce7bad43f0aced0836b0d31a7e359c                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUr5HsgAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVK+R8sAAAAJX191cGRhdGVk\n	1388205539
session:6e1c08dbd742199c64d222da5d9cefc15ee3510a                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvXEYAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMxAAAACXBsYXllcl9pZAlS\nvXEHAAAACV9fY3JlYXRlZAQDAAAAAwoDamlhAAAACHBhc3N3b3JkCgnlmrTkvbPppqgAAAAEbmFt\nZQoJTjAwMjAwMDMxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388151373
session:4cf478d0e834c5d413bb3a2bf9fb8efc05d0fccf                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvSgIAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\nvSf6AAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1388134167
session:68ca495b6b333b80fa7e25d74388efae2f71f945                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvQ2oAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nvQ2aAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388125536
session:ae626e794056809c8d3df82d615326a2b40de3f0                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvQYHAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9pZAlS\nvQX8AAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAAAARu\nYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388123208
session:9bcb01f28e7af6ebb32f3d0a203242d143480734                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvQYGAAAACV9fdXBkYXRlZAoJTjAxMjAzMDAzAAAACXBsYXllcl9pZAlS\nvPnxAAAACV9fY3JlYXRlZAQDAAAAAwoCemkAAAAIcGFzc3dvcmQKCeWQs+e0q+W9pAAAAARuYW1l\nCglOMDEyMDMwMDMAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388123445
session:0cc73ef4d7831779113f4416693eab0e69b4aa77                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvRghAAAACV9fdXBkYXRlZAoJTjk2MjAwMDMwAAAACXBsYXllcl9pZAlS\nvRgSAAAACV9fY3JlYXRlZAQDAAAAAwoCYW4AAAAIcGFzc3dvcmQKCeeOi+WuieWmpAAAAARuYW1l\nCglOOTYyMDAwMzAAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388128991
session:50c92612047e05ebb3ec0996ca312104b06eec6c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSwG0+AAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nwG0qAAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388346209
session:6c9ad2e3fe06ba7da799b38ff6a8bfbba340527b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSvXJPAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQyAAAACXBsYXllcl9pZAlS\nvXJBAAAACV9fY3JlYXRlZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6aau5bCP6JOJAAAABG5h\nbWUKCU4wMDIwMDA0MgAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1388157640
session:e0e5f1b3f269c6e1377aa4e03757f1ab92db6209                        	BQgDAAAAAwlSwJLtAAAACV9fY3JlYXRlZAoHZm9yZW1hbgAAAAhleGVyY2lzZQlSwJLtAAAACV9f\ndXBkYXRlZA==\n	1388355837
session:e4cff890c63e280a862f7186377ce85f2ca69362                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSv8WLAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nv8V7AAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388304247
session:70ddb4af4e14a325c4b0d1c0a1334a1984322f0b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSwmr9AAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAlS\nwmryAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARuYW1l\nCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388476716
session:b70a2d8bfbdd8ebd531c7d968a495317f372bfc5                        	BQgDAAAAAwlSxJaPAAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlSxJaPAAAACV9f\ndXBkYXRlZA==\n	1388618911
session:2c368ead9d9304f05302a919f6d9d634c1b0e50e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxI4/AAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9pZAlS\nxI4rAAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAAAARu\nYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388616799
session:068214223f22f922c2c54eec7502becf64ffc1d8                        	BQgDAAAAAwlSxJaWAAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlSxJaWAAAACV9f\ndXBkYXRlZA==\n	1388618918
session:179b32c59a41edd6892f97c4d8f30236fb6325b0                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxOpcAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nxOpNAAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388640366
session:23a1e1b98bd26971a6fd10d5256a49c838ab56a8                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxrCZAAAACV9fdXBkYXRlZAoJTjAxMjAyMDA0AAAACXBsYXllcl9pZAlS\nxrCBAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeael+WunOWEkgAAAARuYW1l\nCglOMDEyMDIwMDQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388756663
session:95efcf6cf08878e306e96916efa9e78ca5a0afcb                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUsadYwAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVLGnXsAAAAJX191cGRhdGVk\n	1388751767
session:57d60716f3e6d41c47eb6c5e6137a002fa0d5849                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxgiBAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9pZAlS\nxgh1AAAACV9fY3JlYXRlZAQDAAAAAwoDbWluAAAACHBhc3N3b3JkCgnlvpDmlY/oj68AAAAEbmFt\nZQoJTjAwMjAwMDU2AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388713627
session:00c98f2a624526f395c0189f329af750d5d974c8                        	BQgDAAAAAwlSxgt3AAAACV9fY3JlYXRlZAoEY2FycwAAAAhleGVyY2lzZQlSxgt3AAAACV9fdXBk\nYXRlZA==\n	1388714375
session:e2cc64be32ee2469cc3708a928c4d67b64e4f852                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxQbGAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nxQa7AAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388647669
session:514cb797bc24246cfbabd1359040d6328bb6924a                        	BQgDAAAAAwlSxSWtAAAACV9fY3JlYXRlZAoHY29ubmVsbAAAAAhleGVyY2lzZQlSxSWtAAAACV9f\ndXBkYXRlZA==\n	1388655549
session:ce99bbf59766da6d7f2d5b701a4bb8f853e3b585                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxjoxAAAACV9fdXBkYXRlZAoJTjAxMjAzMDAzAAAACXBsYXllcl9pZAlS\nxjoQAAAACV9fY3JlYXRlZAQDAAAAAwoCemkAAAAIcGFzc3dvcmQKCeWQs+e0q+W9pAAAAARuYW1l\nCglOMDEyMDMwMDMAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388726429
session:c8510ab8eac74c1ef3ec8f69769db517d38eeb2c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxmS1AAAACV9fdXBkYXRlZAoJTjAxMjAzMDAzAAAACXBsYXllcl9pZAlS\nxmSoAAAACV9fY3JlYXRlZAQDAAAAAwoCemkAAAAIcGFzc3dvcmQKCeWQs+e0q+W9pAAAAARuYW1l\nCglOMDEyMDMwMDMAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388737237
session:b6dbff8bf55f853b40cac149e89fae4bd5b0122e                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxS1PAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAlS\nxS1BAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARuYW1l\nCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388657528
session:6f8ae768d22c8757f945994173e79b8f1f46886e                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUsaGMAAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVLGhkMAAAAJX191cGRhdGVk\n	1388745840
session:787170bb4960265c77bf3a331a683d6f26437332                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxXWZAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\nxXWLAAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1388676021
session:c38fc77242574c8637135404d32f1625b0e78276                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxYQnAAAACV9fdXBkYXRlZAoJTjAxMjAyMDA0AAAACXBsYXllcl9pZAlS\nxYQRAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeael+WunOWEkgAAAARuYW1l\nCglOMDEyMDIwMDQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388680359
session:7edace3fd2b85775dbbe3b72a00508298ddd29fd                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQlS\nxoBTAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAxMjAzMDAzAAAACXBsYXllcl9pZAoK\nMTM4ODc0MDYyOAAAAAlfX2NyZWF0ZWQEAwAAAAMKAnppAAAACHBhc3N3b3JkCgnlkLPntKvlvaQA\nAAAEbmFtZQoJTjAxMjAzMDAzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388744310
session:30f557c191e96bda5380134288a572d508fa357c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxjkOAAAACV9fdXBkYXRlZAoJTjk2MjAwMDMwAAAACXBsYXllcl9pZAlS\nxjj9AAAACV9fY3JlYXRlZAQDAAAAAwoCYW4AAAAIcGFzc3dvcmQKCeeOi+WuieWmpAAAAARuYW1l\nCglOOTYyMDAwMzAAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388729249
session:92b6aa02a9cf25e6f329e0035444247f59b2b4c4                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxq5WAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMxAAAACXBsYXllcl9pZAlS\nxq5IAAAACV9fY3JlYXRlZAQDAAAAAwoDamlhAAAACHBhc3N3b3JkCgnlmrTkvbPppqgAAAAEbmFt\nZQoJTjAwMjAwMDMxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388756206
session:dd63efe6b31273b2460bae4ad3b98ca011beda07                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxq3OAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nxq23AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388755937
session:119b2c016f00adeb492817b4f7ac2f667fea15cf                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUsar/gAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoJcS1hbmQtYS0zAAAACGV4ZXJj\naXNlCVLGrBgAAAAJX191cGRhdGVk\n	1388758884
session:a09fd93793367723e82e65d1ca17d45f5e3ff382                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxuNGAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nxuM0AAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388769633
session:27610dea3181dd33f74321c9d23c506119a1e8a8                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSxxtIAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nxxs3AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388783970
session:fa0747de031b2281d4e3eee64035cfe6c73e0514                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSyhXWAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9pZAlS\nyhXBAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARuYW1l\nCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388979186
session:837183751bec050d672b12f10a2b140c1e34d6b1                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSyBpXAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nyBo/AAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388849279
session:f37dc1422b733763ad50a9f56655aa648ff52640                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSySXfAAAACV9fdXBkYXRlZAoJTjAwMjAwMDI5AAAACXBsYXllcl9pZAlS\nySXIAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCemtj+e+veWouAAAAARuYW1l\nCglOMDAyMDAwMjkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388918600
session:3fdf5f160c5347f1c36ef909fdae854ca0b9b361                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSyBrYAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9pZAlS\nyBqrAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAEbmFt\nZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388849399
session:e01ce726d4f6fc038fb5f59623beb30f0f8032b4                        	BQgDAAAAAwlSyCvPAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVLIK88AAAAJ\nX191cGRhdGVk\n	1388853727
session:846a3a42625fa69927edb1244509b6afaa584375                        	BQgDAAAAAwlSymwAAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVLKbAAAAAAJ\nX191cGRhdGVk\n	1389001231
session:5834db206652be57fd30d80847f3e90d73f415f9                        	BQgDAAAAAwlSzw08AAAACV9fY3JlYXRlZAoHY2FyZWVycwAAAAhleGVyY2lzZQlSzw08AAAACV9f\ndXBkYXRlZA==\n	1389304652
session:be59288a229689b1f446a2f002f010b6b185e797                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSyLB2AAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9pZAlS\nyLBgAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAEbmFt\nZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1388887696
session:bdee1abd223b023003b6171508c07006fdfe3840                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSySlkAAAACV9fdXBkYXRlZAoJTjAwMjAwMDI5AAAACXBsYXllcl9pZAlS\nySlQAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCemtj+e+veWouAAAAARuYW1l\nCglOMDAyMDAwMjkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1388918665
session:0907f2f55e776b35e0af388ba1af0f66c6eb45f6                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSz80pAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM3AAAACXBsYXllcl9pZAlS\nz8yRAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeael+aYseeRpAAAAARuYW1l\nCglOMDAyMDAwMzcAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389354751
session:bc6ea8325dfc148a98b1b6fa0730e4e14462c79b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSymwMAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM0AAAACXBsYXllcl9pZAlS\nymwAAAAACV9fY3JlYXRlZAQDAAAAAwoDeHVlAAAACHBhc3N3b3JkCgnprY/pm6rlpoIAAAAEbmFt\nZQoJTjAwMjAwMDM0AAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389001253
session:a5a74217108df000048d3b0a9a4930a5e215ad1f                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSyXUlAAAACV9fdXBkYXRlZAoJTjAwMjAwMDI1AAAACXBsYXllcl9pZAlS\nyXUPAAAACV9fY3JlYXRlZAQDAAAAAwoEeHVhbgAAAAhwYXNzd29yZAoJ6Zmz5a6j6LKdAAAABG5h\nbWUKCU4wMDIwMDAyNQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1388938050
session:432c767ac228f11e586364beb4c2178f3b970f49                        	BQgDAAAAAwlSzZspAAAACV9fY3JlYXRlZAoHY2FyZWVycwAAAAhleGVyY2lzZQlSzZspAAAACV9f\ndXBkYXRlZA==\n	1389209913
session:87f70ffc4823d59ab3715cc33cdfbad2b27caa64                        	BQgDAAAAAwlSzgPIAAAACV9fY3JlYXRlZAoHY29ubmVsbAAAAAhleGVyY2lzZQlSzgPJAAAACV9f\ndXBkYXRlZA==\n	1389236696
session:54aa44ab5cd76a8ae790f629e5ed5eea96f9c290                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM4OTMzMDU5MAAAAAlfX2NyZWF0ZWQKBkFGTjNZMAAAAAZsZWFndWUKDHEtYW5kLWEtZXhh\nbQAAAAhleGVyY2lzZQlSz4DDAAAACV9fdXBkYXRlZA==\n	1389335019
session:8b189ff9ec3ee3fa1b746f41069beb17e65a435e                        	BQgDAAAAAwlSz+JnAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVLP4mcAAAAJ\nX191cGRhdGVk\n	1389359222
session:a1c70417496683e632de8e097d54b48bc5597a01                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSz54gAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA5AAAACXBsYXllcl9pZAlS\nz5xHAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeWKieeOieaFpwAAAARuYW1l\nCglOMDAyMDAwMDkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389341746
session:73fe84b2370f51f7ce5d1529b3f582ba90d8f2ee                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSzqsCAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMwAAAACXBsYXllcl9pZAlS\nzqrzAAAACV9fY3JlYXRlZAQDAAAAAwoEc29uZwAAAAhwYXNzd29yZAoJ5b6Q6aCM6I+vAAAABG5h\nbWUKCU4wMDIwMDAzMAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389279523
session:f0b6c5195f05c2ae67189d857c35be1eec34741a                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQKBkFG\nTjNZMAAAAAZsZWFndWUJUs+F/AAAAAlfX2NyZWF0ZWQEAwAAAAMKAm9rAAAACHBhc3N3b3JkCgZE\nckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNlcgoMcS1hbmQtYS1leGFtAAAACGV4\nZXJjaXNlCVLPhgsAAAAJX191cGRhdGVk\n	1389335784
session:4b4d70062fae346531cdd43045e263d499abbc74                        	BQgDAAAAAwlSz6Y+AAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVLPpj4AAAAJ\nX191cGRhdGVk\n	1389343822
session:c1d65256ddbec50e64791779d5e3294caaddcd9e                        	BQgDAAAAAwlSz6ZDAAAACV9fY3JlYXRlZAoJcS1hbmQtYS0zAAAACGV4ZXJjaXNlCVLPpkMAAAAJ\nX191cGRhdGVk\n	1389343827
session:3f2112e789b54d9ef7269f4782376948b7f0c9db                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCXEtYW5kLWEtMwAAAAhleGVyY2lzZQoE\nY2FsbAAAAAVnZW5yZQlSz7mkAAAACV9fdXBkYXRlZAoJTjk2MjAwMDMwAAAACXBsYXllcl9pZAlS\nz7mXAAAACV9fY3JlYXRlZAQDAAAAAwoCYW4AAAAIcGFzc3dvcmQKCeeOi+WuieWmpAAAAARuYW1l\nCglOOTYyMDAwMzAAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389349003
session:b811eb1e048ef89d95bfa59d6fd14cf943b85afb                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz9k3AAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9p\nZAlSz9kiAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAE\nbmFtZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389358318
session:82fcf491c3b84668b4c61fcbf3d882e1257e103c                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NAAAAAlwbGF5ZXJfaWQK\nCjEzODkzNTU5ODcAAAAJX19jcmVhdGVkBAMAAAADCgJlbgAAAAhwYXNzd29yZAoJ5ZGC5oGp6I+v\nAAAABG5hbWUKCU4wMDIwMDA1NAAAAAJpZAAAAAZfX3VzZXIJUs/j9gAAAAlfX3VwZGF0ZWQ=\n	1389359622
session:b02fedb7a0ce4306a5639e290ad7ce37627d7a5d                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+PaAAAACV9fdXBkYXRlZAoJTjAxMjAyMDA0AAAACXBsYXllcl9p\nZAlSz+OjAAAACV9fY3JlYXRlZAQDAAAAAwoCeWkAAAAIcGFzc3dvcmQKCeael+WunOWEkgAAAARu\nYW1lCglOMDEyMDIwMDQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363910
session:46725e8400cb0f63149d5171124ed294e6237822                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+QmAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU0AAAACXBsYXllcl9p\nZAlSz+P+AAAACV9fY3JlYXRlZAQDAAAAAwoCZW4AAAAIcGFzc3dvcmQKCeWRguaBqeiPrwAAAARu\nYW1lCglOMDAyMDAwNTQAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363825
session:8d7999e321448896d7c86435e1b06d02f562cd14                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+OxAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQyAAAACXBsYXllcl9p\nZAlSz+OhAAAACV9fY3JlYXRlZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6aau5bCP6JOJAAAA\nBG5hbWUKCU4wMDIwMDA0MgAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389359575
session:f14359895a644ebf5d373ace7a5e3243497b395b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+OtAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU2AAAACXBsYXllcl9p\nZAoKMTM4OTM1NTg4NwAAAAlfX2NyZWF0ZWQEAwAAAAMKA21pbgAAAAhwYXNzd29yZAoJ5b6Q5pWP\n6I+vAAAABG5hbWUKCU4wMDIwMDA1NgAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389363945
session:2deafd5bdb8e5fb2ff5d215e6ed8a0d901daaee1                        	BQgDAAAAAwlSz+QdAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5B0A\nAAAJX191cGRhdGVk\n	1389359661
session:1da484f3ce9421a0ac7abdc76e066395b5fdc71b                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+MbAAAACV9fdXBkYXRlZAoJTjAwMjAwMDAxAAAACXBsYXllcl9p\nZAlSz+MOAAAACV9fY3JlYXRlZAQDAAAAAwoDeGluAAAACHBhc3N3b3JkCgnlvLXoiq/nkYAAAAAE\nbmFtZQoJTjAwMjAwMDAxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389367108
session:67f04cb34227df6b483a90296c3cad0aa38d41de                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz/IUAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU1AAAACXBsYXllcl9p\nZAlSz+POAAAACV9fY3JlYXRlZAQDAAAAAwoEYmluZwAAAAhwYXNzd29yZAoJ6JSh56eJ5YCJAAAA\nBG5hbWUKCU4wMDIwMDA1NQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389363863
session:580b01cdd742df6c5d62db3b8db4836379781ab0                        	BQgDAAAAAwlSz+OyAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP47IA\nAAAJX191cGRhdGVk\n	1389359554
session:7e9a34cc9c3c3033fdf89972cf2fc8cbee08f164                        	BQgDAAAAAwlSz+PnAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP4+gA\nAAAJX191cGRhdGVk\n	1389359607
session:dea0db21310b06257fff7acf968731c267bbdced                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+P6AAAACV9fdXBkYXRlZAoJTjAwMjAwMDI5AAAACXBsYXllcl9p\nZAlSz+PWAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCemtj+e+veWouAAAAARu\nYW1lCglOMDAyMDAwMjkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363952
session:23e82bfa8227672e9d566b0c350f6536744407cc                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQlSz/PLAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDU1AAAACXBsYXllcl9p\nZAoGQUZOM1kwAAAABmxlYWd1ZQlSz+KjAAAACV9fY3JlYXRlZAQDAAAAAwoEYmluZwAAAAhwYXNz\nd29yZAoJ6JSh56eJ5YCJAAAABG5hbWUKCU4wMDIwMDA1NQAAAAJpZAAAAAZfX3VzZXI=\n	1389363914
session:2d5b0cdc5ec90f69a0f1611edb1fe9d6988b54c5                        	BQgDAAAABwoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KBjE5MzAwMQAAAAlwbGF5ZXJfaWQEAwAA\nAAMKAm9rAAAACHBhc3N3b3JkCgZEckJlYW4AAAAEbmFtZQoGMTkzMDAxAAAAAmlkAAAABl9fdXNl\ncgoKMTM4OTQ5ODMwNwAAAAlfX2NyZWF0ZWQKB0dMMDAwMDYAAAAGbGVhZ3VlCgdkaWNrc29uAAAA\nCGV4ZXJjaXNlCVLSFcEAAAAJX191cGRhdGVk\n	1389504386
session:e765f94bbc9f05a151ac48837ae7aed88e5bf407                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQlSz+UrAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAxMjAyMDAxAAAACXBsYXllcl9p\nZAoKMTM4OTM1NTk3NQAAAAlfX2NyZWF0ZWQEAwAAAAMKBHFpYW8AAAAIcGFzc3dvcmQKCeiVreW3\np+iWhwAAAARuYW1lCglOMDEyMDIwMDEAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389359954
session:a2254d046baf881da01922463df1227168c21fe3                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+PnAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9p\nZAlSz+O3AAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAA\nAARuYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389359615
session:57ff6ca2ee2018f80db89f4d2e66d2e1ce4a33d5                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+QCAAAACV9fdXBkYXRlZAoJTjAwMjAwMDMxAAAACXBsYXllcl9p\nZAlSz+PkAAAACV9fY3JlYXRlZAQDAAAAAwoDamlhAAAACHBhc3N3b3JkCgnlmrTkvbPppqgAAAAE\nbmFtZQoJTjAwMjAwMDMxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389363898
session:47eb01e0037eebb3021d59a3ab5d9323ac075842                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAyOQAAAAlwbGF5ZXJfaWQK\nCjEzODk0MjQ2NDQAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ6a2P57695ai4\nAAAABG5hbWUKCU4wMDIwMDAyOQAAAAJpZAAAAAZfX3VzZXIKDHEtYW5kLWEtZXhhbQAAAAhleGVy\nY2lzZQlS0PBDAAAACV9fdXBkYXRlZA==\n	1389428307
session:818f3f871cf03e252e976170a23f40fad0502aa3                        	BQgDAAAAAwlSz+QbAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5BsA\nAAAJX191cGRhdGVk\n	1389359659
session:646fa1f8d8e8c12fc71564421bd1d630d9567e06                        	BQgDAAAAAwlSz+QeAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5B4A\nAAAJX191cGRhdGVk\n	1389359662
session:303df3e34c7fd3f6ec72d9c0cb0910a013f6b358                        	BQgDAAAAAwlSz+QgAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5CAA\nAAAJX191cGRhdGVk\n	1389359664
session:47f653bdeebac6e22dc3cfff30d712856601ddfc                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODk3OTY1OTQAAAAJX19jcmVhdGVkCgxxLWFuZC1hLWV4YW0AAAAIZXhl\ncmNpc2UJUtac/wAAAAlfX3VwZGF0ZWQ=\n	1389800207
session:7f8c0fde150c7787fcaddf3173abd74cd6fccb3d                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+STAAAACV9fdXBkYXRlZAoJTjk2MjAwMDMwAAAACXBsYXllcl9p\nZAlSz+QyAAAACV9fY3JlYXRlZAQDAAAAAwoCYW4AAAAIcGFzc3dvcmQKCeeOi+WuieWmpAAAAARu\nYW1lCglOOTYyMDAwMzAAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363917
session:40ed5388d6a7389fc02e7f6ace8d6f7152cb856c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQlSz+VDAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAxMjAzMDAzAAAACXBsYXllcl9p\nZAoKMTM4OTM1NjEzNAAAAAlfX2NyZWF0ZWQEAwAAAAMKAnppAAAACHBhc3N3b3JkCgnlkLPntKvl\nvaQAAAAEbmFtZQoJTjAxMjAzMDAzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389363919
session:93f2f6abe4a2cc8860dea389b69bbdd2a5165a21                        	BQgDAAAAAwlSz+RdAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5F0A\nAAAJX191cGRhdGVk\n	1389359724
session:0cee3d7a2cdec453592a18c05825d5cd32af86c1                        	BQgDAAAAAwlSz+RjAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5GMA\nAAAJX191cGRhdGVk\n	1389359731
session:0437ad9f36e65d5e3ac58c0ce76c02355929c7e8                        	BQgDAAAAAwlSz+RlAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5GUA\nAAAJX191cGRhdGVk\n	1389359733
session:f67dd819d5ea08420de9c47e6676fb492727c8be                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+QrAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQyAAAACXBsYXllcl9p\nZAlSz+QOAAAACV9fY3JlYXRlZAQDAAAAAwoEeGlhbwAAAAhwYXNzd29yZAoJ6aau5bCP6JOJAAAA\nBG5hbWUKCU4wMDIwMDA0MgAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389363929
session:3242dd29165db6cc3133d24e64e392dbc60434b2                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+SDAAAACV9fdXBkYXRlZAoJTjAwMjAwMDQzAAAACXBsYXllcl9p\nZAlSz+ReAAAACV9fY3JlYXRlZAQDAAAAAwoDcGVpAAAACHBhc3N3b3JkCgnlionkvanmrKMAAAAE\nbmFtZQoJTjAwMjAwMDQzAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389364395
session:a701564c20b0c6dd2642ed2ba57abb52327f330d                        	BQgDAAAAAwlS0YKfAAAACV9fY3JlYXRlZAoJY2FuZGlkYXRlAAAACGV4ZXJjaXNlCVLRgp8AAAAJ\nX191cGRhdGVk\n	1389465775
session:1c969ecbae25d16e2ac73b17f7adec5a1cb931fa                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg5MzU2Mjg5AAAACV9fY3JlYXRlZAlSz+URAAAACV9fdXBkYXRlZA==\n	1389359885
session:8bf440f38385a8f11a4a660c758365905fc2976d                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+SKAAAACV9fdXBkYXRlZAoJTjAwMjAwMDM2AAAACXBsYXllcl9p\nZAlSz+RKAAAACV9fY3JlYXRlZAQDAAAAAwoFY2hlbmcAAAAIcGFzc3dvcmQKCeW9reaIkOizkwAA\nAARuYW1lCglOMDAyMDAwMzYAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363716
session:2f8b2f951000d091adb008f566d3dee2359aae36                        	BQgDAAAAAwlS0yrhAAAACV9fY3JlYXRlZAoGZGF2aXN0AAAACGV4ZXJjaXNlCVLTKuEAAAAJX191\ncGRhdGVk\n	1389574384
session:b0f81d116e69abbe97343eca6878edd9d39ef8f9                        	BQgDAAAAAwlS17kyAAAACV9fY3JlYXRlZAoHamFja3NvbgAAAAhleGVyY2lzZQlS17kyAAAACV9f\ndXBkYXRlZA==\n	1389872962
session:0b8f4c43b974b29bdf2e6a76547d1b6e6c4b8491                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg5MzU2MTU0AAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4\nZXJjaXNlCVLP5RgAAAAJX191cGRhdGVk\n	1389359929
session:9b8ca61a417d1312933a540646eb63ff77b6e17a                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+T8AAAACV9fdXBkYXRlZAoJTjAwMjAwMDUxAAAACXBsYXllcl9p\nZAlSz+SRAAAACV9fY3JlYXRlZAQDAAAAAwoDcnVpAAAACHBhc3N3b3JkCgnmiLTnnb/okLEAAAAE\nbmFtZQoJTjAwMjAwMDUxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389362300
session:a9febb88b4b3f0b8813a7282945093a10b5ac9cb                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQlSz/U4AAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDM0AAAACXBsYXllcl9p\nZAoKMTM4OTM1NjAxMQAAAAlfX2NyZWF0ZWQEAwAAAAMKA3h1ZQAAAAhwYXNzd29yZAoJ6a2P6Zuq\n5aaCAAAABG5hbWUKCU4wMDIwMDAzNAAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389364040
session:cfb3fda1ba957c42a6cdc07193a9c65b31f2f48e                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAzNwAAAAlwbGF5ZXJfaWQK\nCjEzODkzNTYwNjQAAAAJX19jcmVhdGVkBAMAAAADCgJ5dQAAAAhwYXNzd29yZAoJ5p6X5pix55Gk\nAAAABG5hbWUKCU4wMDIwMDAzNwAAAAJpZAAAAAZfX3VzZXIKCXEtYW5kLWEtMwAAAAhleGVyY2lz\nZQlSz+Y2AAAACV9fdXBkYXRlZA==\n	1389360198
session:2ffce7364e76bf7e19b650a60fbf28d2e7ee74f1                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+SDAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA4AAAACXBsYXllcl9p\nZAlSz+RMAAAACV9fY3JlYXRlZAQDAAAAAwoCeWEAAAAIcGFzc3dvcmQKCeeOi+mbheaFpwAAAARu\nYW1lCglOMDAyMDAwMDgAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363912
session:5aff5cf49261b298932be7cbe918e724ab0303c4                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg5MzU2MzAxAAAACV9fY3JlYXRlZAlSz+UNAAAACV9fdXBkYXRlZA==\n	1389359901
session:e5946f2b36b06e42c3aad7b05aabb21a87981e3b                        	BQgDAAAAAwlSz+6XAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP7pcA\nAAAJX191cGRhdGVk\n	1389362343
session:cb57e38c59539d8d4e64551bcc67b96ea17a846c                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg5MzU2MzI4AAAACV9fY3JlYXRlZAlSz+UpAAAACV9fdXBkYXRlZA==\n	1389359928
session:6168a2549d5537356bd9c7641be9c63829e31e0a                        	BQgDAAAAAwlSz/S0AAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP9LQA\nAAAJX191cGRhdGVk\n	1389363908
session:41885c2aa2d1b32184744a2d321ca74b39300e13                        	BQgDAAAAAwlSz+6YAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP7pgA\nAAAJX191cGRhdGVk\n	1389362344
session:712cdac0e322ee338dd096a7bfac1587b9d83f07                        	BQgDAAAAAwlSz+VAAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5UEA\nAAAJX191cGRhdGVk\n	1389359951
session:c31f8fe349311d3c0554078e8c3f0cd3c65caee3                        	BQgDAAAAAwlSz+VPAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP5U8A\nAAAJX191cGRhdGVk\n	1389359966
session:bd58ea62877476099bff7739e9364687ac739b07                        	BQgDAAAAAwlSz+6aAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP7poA\nAAAJX191cGRhdGVk\n	1389362345
session:164acaa1d76e2806e2b0c214b6a1d3a12b306a9d                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+aoAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU1AAAACXBsYXllcl9p\nZAlSz+W/AAAACV9fY3JlYXRlZAQDAAAAAwoEYmluZwAAAAhwYXNzd29yZAoJ6JSh56eJ5YCJAAAA\nBG5hbWUKCU4wMDIwMDA1NQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389361026
session:d371fadb94a6c817f87fe61c02f9868911fa7e88                        	BQgDAAAAAwlSz/QWAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP9BYA\nAAAJX191cGRhdGVk\n	1389363750
session:096a48fdaf3db385c86f9dc0ba6d831ca8b88bac                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+WrAAAACV9fdXBkYXRlZAoJTjAwMjAwMDI1AAAACXBsYXllcl9p\nZAlSz+WZAAAACV9fY3JlYXRlZAQDAAAAAwoEeHVhbgAAAAhwYXNzd29yZAoJ6Zmz5a6j6LKdAAAA\nBG5hbWUKCU4wMDIwMDAyNQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389360265
session:a10a0b5ce16c04f9c1073879caaf79fcdc2738ea                        	BQgDAAAAAwlSz/PXAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP89cA\nAAAJX191cGRhdGVk\n	1389363687
session:6b315fd6be7d6a9fdeff0cf5ac0af7605e0afaa7                        	BQgDAAAAAwlSz+q6AAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP6rsA\nAAAJX191cGRhdGVk\n	1389361354
session:b70b35be29603ddb44d6257318adc48a31dcde7a                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+YkAAAACV9fdXBkYXRlZAoJTjAwMjAwMDU1AAAACXBsYXllcl9p\nZAlSz+VAAAAACV9fY3JlYXRlZAQDAAAAAwoEYmluZwAAAAhwYXNzd29yZAoJ6JSh56eJ5YCJAAAA\nBG5hbWUKCU4wMDIwMDA1NQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389360981
session:8097c28ba7922ac5c5167666719a7ed55605083f                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDA1NQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBGJpbmcAAAAIcGFzc3dvcmQKCeiUoeenieWAiQAAAARuYW1lCglOMDAyMDAwNTUAAAAC\naWQAAAAGX191c2VyCgoxMzg5MzU2NDAzAAAACV9fY3JlYXRlZAlSz+aFAAAACV9fdXBkYXRlZA==\n	1389360277
session:8264a4406a0e15a4834ec02bcc31b1bd4698ebd2                        	BQgDAAAAAwlSz+rYAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP6tgA\nAAAJX191cGRhdGVk\n	1389361384
session:52722e2881d2612696d1e033aa9cd3231df3ca96                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQlSz+VCAAAACV9fdXBkYXRlZAoEY2FsbAAAAAVnZW5yZQoJTjAwMjAwMDI1AAAACXBsYXllcl9p\nZAoKMTM4OTM1NjA2NwAAAAlfX2NyZWF0ZWQEAwAAAAMKBHh1YW4AAAAIcGFzc3dvcmQKCemZs+Wu\no+iynQAAAARuYW1lCglOMDAyMDAwMjUAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389364744
session:5905217541e919d54b3be4e74498e43cc488608e                        	BQgDAAAAAwlSz+6UAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLP7pQA\nAAAJX191cGRhdGVk\n	1389362340
session:340c5207ecd5b77d5071f0ebd9f0eff4ac796af7                        	BQgDAAAAAwlS0AXIAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLQBcgA\nAAAJX191cGRhdGVk\n	1389368280
session:1d3609cf18536b257b66b4dbde77283878b4684c                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+Z3AAAACV9fdXBkYXRlZAoJTjAwMjAwMDM3AAAACXBsYXllcl9p\nZAlSz+ZsAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeael+aYseeRpAAAAARu\nYW1lCglOMDAyMDAwMzcAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363748
session:d656a1262ca3a8d4a69ffa07517ea0f4ea007419                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+OXAAAACV9fdXBkYXRlZAoJTjAwMjAwMDA5AAAACXBsYXllcl9p\nZAlSz+NwAAAACV9fY3JlYXRlZAQDAAAAAwoCeXUAAAAIcGFzc3dvcmQKCeWKieeOieaFpwAAAARu\nYW1lCglOMDAyMDAwMDkAAAACaWQAAAAGX191c2VyCgZBRk4zWTAAAAAGbGVhZ3Vl\n	1389363568
session:7e29f6942fe0b05a158cb05f4fc7e7fc6517dd5a                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+XDAAAACV9fdXBkYXRlZAoJTjAxMjAyMDAxAAAACXBsYXllcl9p\nZAlSz+WZAAAACV9fY3JlYXRlZAQDAAAAAwoEcWlhbwAAAAhwYXNzd29yZAoJ6JWt5ben6JaHAAAA\nBG5hbWUKCU4wMTIwMjAwMQAAAAJpZAAAAAZfX3VzZXIKBkFGTjNZMAAAAAZsZWFndWU=\n	1389363693
session:18d9bc40ad895e1e3e15a15a893fc87167868890                        	BQgDAAAACAoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KDHEtYW5kLWEtZXhhbQAAAAhleGVyY2lz\nZQoEY2FsbAAAAAVnZW5yZQlSz+64AAAACV9fdXBkYXRlZAoJTjAwMjAwMDUxAAAACXBsYXllcl9p\nZAlSz+6hAAAACV9fY3JlYXRlZAQDAAAAAwoDcnVpAAAACHBhc3N3b3JkCgnmiLTnnb/okLEAAAAE\nbmFtZQoJTjAwMjAwMDUxAAAAAmlkAAAABl9fdXNlcgoGQUZOM1kwAAAABmxlYWd1ZQ==\n	1389363837
session:026d74d1b456631bfaa9446b2a915f3fb90698e9                        	BQgDAAAABgoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAwMQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKA3hpbgAAAAhwYXNzd29yZAoJ5by16Iqv55GAAAAABG5hbWUKCU4wMDIwMDAwMQAAAAJp\nZAAAAAZfX3VzZXIKCjEzODkzNjM0MjQAAAAJX19jcmVhdGVkCgxxLWFuZC1hLWV4YW0AAAAIZXhl\ncmNpc2UJUtAA/wAAAAlfX3VwZGF0ZWQ=\n	1389367055
session:804f9386ab28f64f8d804961b65ef8519225c4df                        	BQgDAAAAAwlS0JSKAAAACV9fY3JlYXRlZAoFc2hvZXMAAAAIZXhlcmNpc2UJUtCUigAAAAlfX3Vw\nZGF0ZWQ=\n	1389404826
session:f25f6e36a11683458cfda9e4ef6293d15fac2b19                        	BQgDAAAABQoHZGVmYXVsdAAAAAxfX3VzZXJfcmVhbG0KCU4wMDIwMDAyNQAAAAlwbGF5ZXJfaWQE\nAwAAAAMKBHh1YW4AAAAIcGFzc3dvcmQKCemZs+Wuo+iynQAAAARuYW1lCglOMDAyMDAwMjUAAAAC\naWQAAAAGX191c2VyCgoxMzg5NDEyMjk0AAAACV9fY3JlYXRlZAlS0L/GAAAACV9fdXBkYXRlZA==\n	1389415893
session:eb480c3e362c9f50b61dad224a4b239f8f92811b                        	BQgDAAAAAwlS0QAzAAAACV9fY3JlYXRlZAoMcS1hbmQtYS1leGFtAAAACGV4ZXJjaXNlCVLRADMA\nAAAJX191cGRhdGVk\n	1389432387
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY tag (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
candidate	193001	AFN2N0	0	0	9	6
q-and-a-exam	N00200029	AFN3Y0	4	1	897	600
jackson	N01200044	AFN2N0	0	0	9	6
candidate	N01200044	AFN2N0	0	0	9	6
candidate	N01200029	AFN2N0	0	0	9	6
candidate	N01200056	AFN2N0	0	0	9	6
candidate	N01200041	AFN2N0	0	0	9	6
candidate	N01200024	AFN2N0	0	0	9	6
candidate	N01200009	AFN2N0	0	0	9	6
candidate	V9941012	FLA0007	0	0	9	6
candidate	N02202114	AFN2N0	0	0	9	6
candidate	N02202112	AFN2N0	0	0	9	6
candidate	N02202101	AFN2N0	0	0	9	6
candidate	N01200005	AFN2N0	0	0	9	6
candidate	N01200058	AFN2N0	0	0	9	6
candidate	N02202104	AFN2N0	0	0	9	6
candidate	N01200021	AFN2N0	0	0	9	6
candidate	N01200035	AFN2N0	0	0	9	6
candidate	N02202106	AFN2N0	0	0	9	6
candidate	N02202111	AFN2N0	0	0	9	6
candidate	N00082007	AFN2N0	0	0	9	6
candidate	N99080092	AFN2N0	0	0	9	6
candidate	N01200033	AFN2N0	0	0	9	6
candidate	B00200054	AFN2N0	0	0	9	6
candidate	N01200023	AFN2N0	0	0	9	6
candidate	N01200014	AFN2N0	0	0	9	6
candidate	N01200010	AFN2N0	0	0	9	6
candidate	N97120058	AFN2N0	0	0	9	6
candidate	N01200025	AFN2N0	0	0	9	6
candidate	N01200016	AFN2N0	0	0	9	6
jackson	U0222133	GL00006	0	0	9	6
careers	N01200033	AFN2N0	0	0	9	6
careers	N00120056	AFN300	0	0	9	6
candidate	V9741064	FLA0006	0	0	9	6
intros	193001	AFN3Y0	0	0	9	6
q-and-a	N00200056	AFN3Y0	0	0	9	6
q-and-a	N96200030	AFN3Y0	0	0	9	6
q-and-a	N00200056	AFN300	0	0	9	6
q-and-a	N00200008	AFN300	0	0	9	6
q-and-a	N00200029	AFN3Y0	0	0	9	6
q-and-a	N00200001	AFN3Y0	0	0	9	6
q-and-a	N00200001	AFN300	0	0	9	6
q-and-a	N00200042	AFN3Y0	0	0	9	6
q-and-a	N00200017	AFN3Y0	0	0	9	6
q-and-a	N00200017	AFN300	0	0	9	6
q-and-a	N00200055	AFN3Y0	0	0	9	6
q-and-a	N00200030	AFN3Y0	1	1	9	6
q-and-a	N00200025	AFN3Y0	0	0	9	6
q-and-a	N01203003	AFN3Y0	0	0	9	6
q-and-a	N00200008	AFN3Y0	0	0	9	6
q-and-a	N00200036	AFN3Y0	0	0	9	6
q-and-a	N00200036	AFN300	0	0	9	6
q-and-a	N00200009	AFN3Y0	0	0	9	6
q-and-a	N01202004	AFN3Y0	0	0	9	6
q-and-a	N00200054	AFN3Y0	0	0	9	6
q-and-a	N00200037	AFN3Y0	0	0	9	6
q-and-a	N00200034		0	0	9	6
q-and-a	N00200051	AFN3Y0	0	0	9	6
q-and-a	N01202001	AFN3Y0	0	0	9	6
q-and-a	N00200043	AFN3Y0	0	0	9	6
q-and-a	N00200043	AFN300	0	0	9	6
q-and-a	N00200034	AFN3Y0	0	0	9	6
q-and-a	193001	AFN3Y0	0	0	9	6
q-and-a-2	193001	AFN3Y0	0	0	9	6
q-and-a	N01202004	AFN300	0	0	9	6
q-and-a-2	N00200056	AFN3Y0	0	0	9	6
q-and-a-2	N00200034	AFN3Y0	0	0	9	6
q-and-a-exam	N01202004	AFN3Y0	34	25	894	600
q-and-a-exam	193001	AFN3Y0	0	0	900	600
q-and-a-2	N01202004	AFN3Y0	6	2	5	6
q-and-a-2	N01203003	AFN3Y0	0	0	9	6
q-and-a-2	N00200055	AFN3Y0	0	0	9	6
q-and-a-3	N00200056	AFN3Y0	0	0	9	6
q-and-a-3	N00200036	AFN3Y0	0	0	9	6
q-and-a-3	N00200017	AFN3Y0	1	1	9	6
q-and-a-2	N00200001	AFN3Y0	10	6	6	6
q-and-a-2	N00200017	AFN3Y0	0	0	9	6
q-and-a-2	N00200029	AFN3Y0	0	0	9	6
q-and-a-3	N00200043	AFN3Y0	0	0	9	6
q-and-a-3	N00200008	AFN3Y0	0	0	9	6
q-and-a-3	N00200001	AFN3Y0	0	0	9	6
q-and-a-3	N00200009	AFN3Y0	0	0	900	600
q-and-a-3	N00200037	AFN3Y0	0	0	900	600
q-and-a-3	N00200030	AFN3Y0	7	7	8	6
q-and-a-3	N00200031	AFN3Y0	0	0	9	6
q-and-a-3	N00200042	AFN3Y0	0	0	9	6
q-and-a-2	N00200030	AFN3Y0	11	6	8	5
q-and-a-2	N00200054	AFN3Y0	0	0	9	6
q-and-a-2	N00200043	AFN3Y0	0	0	9	6
q-and-a-2	N00200008	AFN3Y0	0	0	9	6
q-and-a-2	N01202001	AFN3Y0	0	0	9	6
q-and-a-2	N96200030	AFN3Y0	0	0	9	6
q-and-a-3	N00200034	AFN3Y0	6	6	9	6
q-and-a-3	N01202004	AFN3Y0	0	0	9	6
q-and-a-3	N01203003	AFN3Y0	1	0	9	6
q-and-a-3	N96200030	AFN3Y0	0	0	9	6
q-and-a-exam	N00200031	AFN3Y0	19	12	899	599
q-and-a-exam	N01202001	AFN3Y0	27	27	900	600
q-and-a-exam	N00200025	AFN3Y0	37	34	898	600
q-and-a-exam	N00200009	AFN3Y0	0	0	900	600
q-and-a-3	193001	AFN3Y0	4	4	9	6
q-and-a-3	N00200029	AFN3Y0	0	0	9	6
q-and-a-3	N00200025	AFN3Y0	0	0	9	6
q-and-a-exam	N00200056	AFN3Y0	0	0	900	600
q-and-a-exam	N00200030	AFN3Y0	0	0	900	600
q-and-a-exam	N00200036	AFN3Y0	0	0	900	600
dickson	193001	GL00006	0	0	9	6
q-and-a-exam	N00200054	AFN3Y0	0	0	900	600
q-and-a-exam	N00200042	AFN3Y0	45	35	900	599
q-and-a-exam	N01203003	AFN3Y0	0	0	900	600
q-and-a-exam	N00200043	AFN3Y0	3	2	900	600
q-and-a-exam	N96200030	AFN3Y0	0	0	900	600
q-and-a-exam	N00200051	AFN3Y0	0	0	900	600
q-and-a-exam	N00200001	AFN3Y0	5	1	897	600
q-and-a-exam	N00200034	AFN3Y0	0	0	900	600
q-and-a-exam	N00200017	AFN3Y0	39	27	895	598
q-and-a-exam	N00200037	AFN3Y0	50	42	897	598
q-and-a-exam	N00200008	AFN3Y0	24	17	896	598
q-and-a-exam	N00200055	AFN3Y0	19	9	894	599
\.


--
-- Data for Name: try; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY try (exercise, player, league, try, quoted, answer) FROM stdin;
candidate	193001	AFN2N0	54	Eva confident	--
candidate	193001	AFN2N0	55	Eva confident	--
candidate	193001	AFN2N0	56	Eva is 	--
candidate	193001	AFN2N0	57	Eva is confident.	--
candidate	193001	AFN2N0	58	Eva was difficult.	--
candidate	193001	AFN2N0	59	Eva was fast	--
candidate	193001	AFN2N0	60	Eva was patient.	--
candidate	193001	AFN2N0	61	Eva was next.	--
candidate	193001	AFN2N0	62	Eva was next.	--
candidate	193001	AFN2N0	63	Eva was good.	--
candidate	193001	AFN2N0	64	Eva was fast.	--
candidate	193001	AFN2N0	65	Eva was fast.	--
candidate	193001	AFN2N0	66	Eva was five.	--
candidate	193001	AFN2N0	67	Eva was bad	--
candidate	193001	AFN2N0	68	Eva was Polish	--
candidate	193001	AFN2N0	69	Eva was poor.	--
candidate	193001	AFN2N0	70	Eva wanted to improve the sales team.	--
candidate	193001	AFN2N0	71	Eva enjoyed administration.	--
candidate	193001	AFN2N0	72		--
candidate	193001	AFN2N0	73	Eva thought that Dr Bean was honest.	--
candidate	193001	AFN2N0	74	Barbara increased sales.	--
candidate	193001	AFN2N0	75	Dr Bean was outgoing.	--
candidate	193001	AFN2N0	76		\N
candidate	193001	AFN2N0	77		\N
candidate	193001	AFN2N0	78	Dr Bean wanted Tadeusz to be patient.	False
candidate	193001	AFN2N0	79	Eva wanted to be patient.	True
candidate	193001	AFN2N0	80	Dr Bean is posish.	--
candidate	193001	AFN2N0	81	Dr Bean is posish.	--
candidate	193001	AFN2N0	82	Dr Bean is posish.	--
candidate	193001	AFN2N0	83	Dr Bean is posish.	--
candidate	193001	AFN2N0	84	Dr Bean was posish.	--
candidate	193001	AFN2N0	85		\N
candidate	193001	AFN2N0	86	Dr Bean was posish.	--
candidate	193001	AFN2N0	87		\N
candidate	193001	AFN2N0	88	fdsds fds fdsd	True
candidate	193001	AFN2N0	89	fdsf fdds fdds	--
candidate	N01200044	AFN2N0	1		\N
candidate	N01200044	AFN2N0	2		\N
candidate	N01200044	AFN2N0	3	Barbara is ambitious.	True
candidate	N01200044	AFN2N0	4	Barbara is competitive.	True
candidate	N01200044	AFN2N0	5	Barbara's aim is to want to win.	True
candidate	N01200044	AFN2N0	6	Barbara is difficult to work with people.	True
candidate	N01200044	AFN2N0	7	Dr Bean did bad job.	True
candidate	N01200044	AFN2N0	8	Dr Bean was not sales experience.	True
candidate	N01200044	AFN2N0	9	Dr Bean was outgoing.	False
candidate	N01200044	AFN2N0	10		\N
candidate	N01200044	AFN2N0	11		\N
candidate	N01200044	AFN2N0	12	How Dr Bean felt? Dr Bean did bad job.	True
candidate	N01200044	AFN2N0	13	How does eva do if she  get the job? Eva will improve sales team.	True
candidate	N01200044	AFN2N0	14	Dr Bean had confident.	False
candidate	N01200044	AFN2N0	15	Tadeusz had good jugement.	True
candidate	N01200029	AFN2N0	1		\N
candidate	N01200029	AFN2N0	2		\N
candidate	N01200029	AFN2N0	3		\N
candidate	N01200056	AFN2N0	1		\N
candidate	N01200056	AFN2N0	2		\N
candidate	N01200056	AFN2N0	3		\N
candidate	N01200024	AFN2N0	1		\N
candidate	N01200024	AFN2N0	2	does barbara polish	False
candidate	N01200024	AFN2N0	3	Does barbara polish	False
candidate	N01200024	AFN2N0	4	Does barbara polish	True
candidate	N01200029	AFN2N0	4		\N
candidate	N01200029	AFN2N0	5		\N
candidate	N01200029	AFN2N0	6		\N
candidate	N02202114	AFN2N0	1		\N
candidate	N02202114	AFN2N0	2		\N
candidate	N01200029	AFN2N0	7		\N
candidate	N01200029	AFN2N0	8		\N
candidate	N01200029	AFN2N0	9		\N
candidate	N02202112	AFN2N0	1		\N
candidate	N02202112	AFN2N0	2	Tadeusz want to do a good job for the company.	True
candidate	N02202101	AFN2N0	1		\N
candidate	N02202101	AFN2N0	2		\N
candidate	N02202112	AFN2N0	3	Tadeusz had judgement.	True
candidate	N02202101	AFN2N0	3	Is Dr bean a confident and easygoing man?	False
candidate	N02202112	AFN2N0	4	Tadeusz had a judgement.	True
candidate	N02202112	AFN2N0	5	Tadeusz had a judgement.	True
candidate	N02202112	AFN2N0	6	Tadeusz had judgement.	True
candidate	N02202112	AFN2N0	7	Tadeusz want to do a good job for the company.	True
candidate	N02202112	AFN2N0	8		\N
candidate	N02202112	AFN2N0	9		\N
candidate	N02202114	AFN2N0	3		\N
candidate	N02202112	AFN2N0	10	Tadeusz has good judgement.	True
candidate	N02202112	AFN2N0	11	Dr Bean was competitive.	True
candidate	N02202112	AFN2N0	12	Dr Bean was competitive.	True
candidate	N02202112	AFN2N0	13	Tadeusz has good judgement.	True
candidate	N02202112	AFN2N0	14		\N
candidate	N01200058	AFN2N0	1		\N
candidate	N01200058	AFN2N0	2		\N
candidate	N01200058	AFN2N0	3		\N
candidate	N01200058	AFN2N0	4		--
candidate	N01200058	AFN2N0	5		--
candidate	N01200058	AFN2N0	6	Barbara likes to take risk a woman?	True
candidate	N01200058	AFN2N0	7	I don't know what your mean	--
candidate	N01200058	AFN2N0	8		--
candidate	N01200058	AFN2N0	9	•what they did. 	True
candidate	N01200058	AFN2N0	10	Attempted is Barbara?	True
candidate	N01200058	AFN2N0	11	Eva was fast.	True
candidate	N02202104	AFN2N0	1		\N
candidate	N02202104	AFN2N0	2	Dr Bean's ambitious.	False
candidate	N02202104	AFN2N0	3	Eva is ambitious.	False
candidate	N01200021	AFN2N0	1		\N
candidate	N01200021	AFN2N0	2	Eva wanted to be patient	True
candidate	N01200021	AFN2N0	3	Eva wanted to be patient	False
candidate	N01200021	AFN2N0	4		\N
candidate	N01200021	AFN2N0	5	Dr Bean was competitive	False
candidate	N01200021	AFN2N0	6	Dr Bean was competitive	True
candidate	N01200021	AFN2N0	7	Dr Bean was competitive	True
candidate	N01200021	AFN2N0	8	Dr Bean was competitive	False
candidate	N01200021	AFN2N0	9		\N
candidate	N01200021	AFN2N0	10	Barbara likes to take risk a woman? 	True
candidate	N01200021	AFN2N0	11	Barbara likes to take risk a woman? 	False
candidate	N01200021	AFN2N0	12		\N
candidate	N01200021	AFN2N0	13	Barbara likes to take risk a woman? 	False
candidate	N01200035	AFN2N0	1		\N
candidate	N01200029	AFN2N0	10		\N
candidate	N01200029	AFN2N0	11	Barbara did not ambitious.	False
candidate	N01200021	AFN2N0	14		\N
candidate	N01200021	AFN2N0	15	Eva was fast. 	False
candidate	N01200021	AFN2N0	16	Eva wanted to improve the sales team	True
candidate	N01200029	AFN2N0	12	Tadeusz want to help for the company.	True
candidate	N01200029	AFN2N0	13	Tadeusz have good judgement.	True
candidate	N01200029	AFN2N0	14	Tadeusz think he has the ability and experience to do this job.	True
candidate	N01200029	AFN2N0	15	Tadeusz have good judgement.	True
candidate	N01200029	AFN2N0	16	Tadeusz want to help for the company.	True
candidate	N01200029	AFN2N0	17	Barbara did not ambitious.	False
candidate	N01200029	AFN2N0	18		\N
candidate	N01200029	AFN2N0	19		\N
candidate	N01200029	AFN2N0	20		\N
candidate	N01200029	AFN2N0	21		\N
candidate	N01200035	AFN2N0	2		\N
candidate	N01200035	AFN2N0	3		\N
candidate	N01200035	AFN2N0	4	Eva likes to take a risk?	False
candidate	N01200029	AFN2N0	22	Eva have a lot of sales experience.	True
candidate	N01200029	AFN2N0	23	Eva is  a very fast learner.	True
candidate	N01200029	AFN2N0	24	Dr Bean  tried very hard to motivate the sales team.	True
candidate	N01200035	AFN2N0	5	Do you know Eva was a director?	--
candidate	N01200029	AFN2N0	25	Dr Bean don't have any sales experience.	True
candidate	N01200035	AFN2N0	6	Dr Bean have successful life	--
candidate	N01200035	AFN2N0	7	Tadeusz can help that people	True
candidate	N01200035	AFN2N0	8	Barbara doesn't respect that man.	--
candidate	193001	AFN2N0	90		\N
candidate	193001	AFN2N0	91	Tadeusz was ambitious.	--
candidate	N02202106	AFN2N0	1		\N
candidate	N02202106	AFN2N0	2	Barbara is difficult to work with people.	True
candidate	N02202106	AFN2N0	3	Barbara is difficult to work with people?	True
candidate	N02202111	AFN2N0	1		\N
candidate	N02202111	AFN2N0	2	Barbara likes to take risk a woman?	True
candidate	N00082007	AFN2N0	1		\N
candidate	N00082007	AFN2N0	2		\N
candidate	N00082007	AFN2N0	3	Eva is polish but the app crashed	True
candidate	N00082007	AFN2N0	4		\N
candidate	N00082007	AFN2N0	5		\N
candidate	N00082007	AFN2N0	6		\N
candidate	N00082007	AFN2N0	7		\N
candidate	N00082007	AFN2N0	8	Eva was poor.	True
candidate	N00082007	AFN2N0	9	Eva is good.	True
candidate	N00082007	AFN2N0	10	Eva is honest	True
candidate	N00082007	AFN2N0	11	Eva is realistic	True
candidate	N00082007	AFN2N0	12	Eva is honest	True
candidate	N00082007	AFN2N0	13	Eva is good.	True
candidate	N00082007	AFN2N0	14	Eva was poor.	True
candidate	N00082007	AFN2N0	15		\N
candidate	N99080092	AFN2N0	1		\N
candidate	N99080092	AFN2N0	2		\N
candidate	N99080092	AFN2N0	3	Eva was fast.	True
candidate	N99080092	AFN2N0	4		\N
candidate	N99080092	AFN2N0	5	Eva was fast.	True
candidate	N99080092	AFN2N0	6	Eva was fast.	True
candidate	N99080092	AFN2N0	7		\N
candidate	N99080092	AFN2N0	8		\N
candidate	N99080092	AFN2N0	9	Eva is girl	True
candidate	N01200033	AFN2N0	1		\N
candidate	N01200033	AFN2N0	2	Dr Bean can choose the director.	True
candidate	N01200033	AFN2N0	3		\N
candidate	N01200041	AFN2N0	1		\N
candidate	N01200041	AFN2N0	2		\N
candidate	N01200041	AFN2N0	3	Barbara is an ambitious woman.	True
candidate	N01200041	AFN2N0	4	Barbara have confident.	True
candidate	N01200041	AFN2N0	5	Tadeusz has the ability.	True
candidate	N01200041	AFN2N0	6	Tadeusz wants to do a good job for the company.	True
candidate	N01200041	AFN2N0	7	Barbara wants have the job.	True
candidate	N01200009	AFN2N0	1		\N
candidate	N01200009	AFN2N0	2		\N
candidate	N01200009	AFN2N0	3	Tadeusz is a sales director.	True
candidate	N01200009	AFN2N0	4	Tadeusz improve sales.	True
candidate	N01200041	AFN2N0	8	Dr Bean have sales experience	False
candidate	N01200041	AFN2N0	9		\N
candidate	N01200009	AFN2N0	5	Tadeusz improve sales.	True
candidate	N01200009	AFN2N0	6	Tadeusz improve sales.	True
candidate	N01200009	AFN2N0	7		\N
candidate	N01200009	AFN2N0	8	Barbara must help Eva.	False
candidate	N01200009	AFN2N0	9	Eva become poor.	False
candidate	N01200009	AFN2N0	10	Eva lead sales team.	False
candidate	N01200009	AFN2N0	11	Tadeusz become successful director	True
candidate	N01200009	AFN2N0	12		\N
candidate	N01200033	AFN2N0	4		\N
candidate	N01200033	AFN2N0	5		\N
candidate	N01200023	AFN2N0	1		\N
candidate	N01200023	AFN2N0	2	Barbara is an ambitious girl.	True
candidate	N01200023	AFN2N0	3	Barbara isn't ambitious.	False
candidate	N01200023	AFN2N0	4	Barbara is ambitious.	True
candidate	N01200023	AFN2N0	5	Barbara isn't ambitious.	False
candidate	N01200023	AFN2N0	6		\N
candidate	N01200023	AFN2N0	7	Tadeusz want to do a good job for the company.	True
candidate	N01200023	AFN2N0	8	Dr. Bean have lots of  sales experience.	False
candidate	N01200023	AFN2N0	9	Barbara is ambitious.	True
candidate	N01200023	AFN2N0	10	Dr. Bean have lots of  sales experience.	False
candidate	N01200023	AFN2N0	11		\N
candidate	N01200023	AFN2N0	12	Barbara is competitive.	True
candidate	N01200023	AFN2N0	13	Barbara is not competitive.	False
candidate	N01200023	AFN2N0	14	Barbara likes to win.	True
candidate	N01200033	AFN2N0	6		\N
candidate	N01200033	AFN2N0	7	Does the Eva can say many different language?	True
candidate	N01200033	AFN2N0	8	Eva can speak different language	False
candidate	N01200033	AFN2N0	9	Eva can speak different language?	True
candidate	N01200033	AFN2N0	10	Dr.Bean can choose the director.	True
candidate	N01200033	AFN2N0	11	Eva can speak different language?	--
candidate	N01200033	AFN2N0	12	Dr.Bean can choose the director.	True
candidate	N01200033	AFN2N0	13	Eva can speak different language?	True
candidate	N01200033	AFN2N0	14	Eva can speak different language	False
candidate	N01200033	AFN2N0	15	Does the Eva can say many different language?	True
candidate	N01200033	AFN2N0	16		\N
candidate	N01200033	AFN2N0	17	Does the Eva can say many different language?	True
candidate	193001	AFN2N0	92		\N
candidate	193001	AFN2N0	93	Dr Bean was bad	--
candidate	193001	AFN2N0	94		\N
candidate	193001	AFN2N0	95	Dr Bean is fast	True
candidate	193001	AFN2N0	96	Dr Bean is fast	True
candidate	193001	AFN2N0	97	Dr Bean is fast	True
candidate	193001	AFN2N0	98	Dr Bean is long	True
candidate	193001	AFN2N0	99	Dr Bean is long	True
candidate	193001	AFN2N0	100	Dr Bean is next	True
candidate	N01200041	AFN2N0	10		\N
candidate	193001	AFN2N0	101	Eva is five	False
candidate	193001	AFN2N0	102	Eva is five.	True
candidate	193001	AFN2N0	103	Eva is local.	True
candidate	193001	AFN2N0	104	Eva increased sales.	True
candidate	193001	AFN2N0	105	Eva was fast.	True
candidate	N01200041	AFN2N0	11		\N
candidate	193001	AFN2N0	106	Eva was poor.	False
candidate	N01200041	AFN2N0	12	Dr Bean wants to have the job.	False
candidate	193001	AFN2N0	107	Eva was poor.	False
candidate	193001	AFN2N0	108	Eva is poor.	False
candidate	193001	AFN2N0	109	Eva can become a director.	False
candidate	193001	AFN2N0	110	Eva is true.	--
candidate	N01200041	AFN2N0	13	Dr Bean choose Barbara, Because he can start by improving our sales team.	False
candidate	193001	AFN2N0	111	Eva was confident.	--
candidate	193001	AFN2N0	112	Eva was confident.	--
candidate	193001	AFN2N0	113	The aim was true	True
candidate	193001	AFN2N0	114	Eva can become bad	True
candidate	193001	AFN2N0	115	dfds fdsds	--
candidate	N01200041	AFN2N0	14	Barbara think we should expand competitive over the next five years.	False
candidate	N01200041	AFN2N0	15	Eva is outgoing woman ,because she is from Polish.	False
candidate	193001	AFN2N0	116		\N
candidate	193001	AFN2N0	117	Dr Bean was true.	True
candidate	193001	AFN2N0	118	Dr Bean was true.	True
candidate	193001	AFN2N0	119	Eva was ambitious	True
candidate	193001	AFN2N0	120	Eva was ambitious	True
candidate	193001	AFN2N0	121	Eva was ambitious	True
candidate	193001	AFN2N0	122	Eva was ambitious	True
candidate	193001	AFN2N0	123	Eva was ambitious	True
candidate	193001	AFN2N0	124		\N
candidate	193001	AFN2N0	125		\N
candidate	193001	AFN2N0	126	Eva is patient	True
candidate	193001	AFN2N0	127	Eva is five	False
candidate	193001	AFN2N0	128	Eva is realistic	True
candidate	193001	AFN2N0	129	Eva is gooder	True
candidate	193001	AFN2N0	130	Eva wanted Eva to be patient.	True
candidate	193001	AFN2N0	131	Eva wanted to be patient.	True
candidate	193001	AFN2N0	132	Eva can become patient	True
candidate	193001	AFN2N0	133	Eva had judgement	True
candidate	193001	AFN2N0	134	Eva has judgement	True
candidate	193001	AFN2N0	135	Eva was honest.	True
candidate	193001	AFN2N0	136	Eva became the director	False
candidate	193001	AFN2N0	137	Eva enjoyed Fast-Track.	True
candidate	193001	AFN2N0	138	Dr Bean was Polish.	False
candidate	N01200014	AFN2N0	1		\N
candidate	N01200014	AFN2N0	2		\N
candidate	N01200014	AFN2N0	3	Barbara is ambitious	True
candidate	N01200014	AFN2N0	4	Barbara is a ambitious person	True
candidate	N01200014	AFN2N0	5	Barbara is an ambitious person	True
candidate	N01200014	AFN2N0	6	Barbara is an ambitious women	True
candidate	N01200014	AFN2N0	7	Barbara like to win	True
candidate	N01200014	AFN2N0	8	Tadeusz think they sould be rerlistic	True
candidate	N01200014	AFN2N0	9	Eva think everyone in the team should help each other	True
candidate	N01200014	AFN2N0	10	Tadeusz has good judgment	True
candidate	N01200014	AFN2N0	11	Eva had a lot of sales experience.	True
candidate	N01200014	AFN2N0	12	Eva is a very fast learner	True
candidate	N01200014	AFN2N0	13	Eva don't like telling then what to do	False
candidate	N01200010	AFN2N0	1		\N
candidate	N97120058	AFN2N0	1		\N
candidate	N97120058	AFN2N0	2	Dr Bean is adirector.	True
candidate	N97120058	AFN2N0	3	Eva is not competitive.	True
candidate	N97120058	AFN2N0	4	Dr Bean is fast.	False
candidate	N97120058	AFN2N0	5	Barbara was outgoing. 	True
candidate	N97120058	AFN2N0	6	Tadeusz is fast learner.	True
candidate	N97120058	AFN2N0	7	Eva is poor person.	True
candidate	N01200056	AFN2N0	4		\N
candidate	N01200056	AFN2N0	5	Tadeusz have a successful job.	True
candidate	N01200056	AFN2N0	6	Dr Bean know Eva's job.	True
candidate	N01200056	AFN2N0	7	Tadeusz feel good.	True
candidate	N01200056	AFN2N0	8	Eva choose Barbara.	True
candidate	N01200056	AFN2N0	9	Barbara enjoy the course.	True
candidate	N01200056	AFN2N0	10	Dr Bean is not a director	True
candidate	N01200041	AFN2N0	16		\N
candidate	N97120058	AFN2N0	8		\N
candidate	193001	AFN2N0	139		\N
candidate	193001	AFN2N0	140	Barbara is adirector.	False
candidate	193001	AFN2N0	141		\N
candidate	193001	AFN2N0	142	Dr Bean is adirector	False
candidate	193001	AFN2N0	143	Dr Bean was a director.	False
candidate	193001	AFN2N0	144		\N
candidate	193001	AFN2N0	145	Dr Bean was a director.	False
candidate	193001	AFN2N0	146	Dr Bean was a director	False
candidate	193001	AFN2N0	147		\N
candidate	193001	AFN2N0	148	Dr Bean was a director.	False
candidate	193001	AFN2N0	149	Dr Bean was a director.	False
candidate	B00200054	AFN2N0	1		\N
candidate	B00200054	AFN2N0	2	Eva must go.	True
candidate	B00200054	AFN2N0	3	Eva shares the experience.	True
candidate	B00200054	AFN2N0	4	How does Eva feel working in the team?	--
candidate	N01200025	AFN2N0	1		\N
candidate	N01200016	AFN2N0	1		\N
candidate	N01200016	AFN2N0	2		True
candidate	N01200016	AFN2N0	3		False
candidate	N01200016	AFN2N0	4	T	--
candidate	N01200016	AFN2N0	5	F	--
candidate	N01200016	AFN2N0	6	F	False
candidate	N01200016	AFN2N0	7	F	False
candidate	N01200016	AFN2N0	8	Barbara is not a good player	True
candidate	N01200016	AFN2N0	9	Barbara is appeared  aggressive	True
candidate	N00082007	AFN2N0	16		\N
candidate	193001	AFN2N0	150		\N
candidate	193001	AFN2N0	151	Dr Bean is a director.	False
candidate	193001	AFN2N0	152	Eva was a director.	False
candidate	193001	AFN2N0	153		\N
candidate	193001	AFN2N0	154		\N
candidate	193001	AFN2N0	155	Eva is a director	False
candidate	193001	AFN2N0	156	Dr Bean is a director.	False
candidate	193001	AFN2N0	157	Dr Bean was a director.	False
candidate	193001	AFN2N0	158	Barbara was not a director.	True
candidate	193001	AFN2N0	159	sfdds fdsds fdsfds 	False
candidate	193001	AFN2N0	160	who was a director.	True
candidate	193001	AFN2N0	161		\N
candidate	193001	AFN2N0	162		\N
candidate	193001	AFN2N0	163	Dr Bean is a director.	True
candidate	193001	AFN2N0	164	Eva is a director.	False
candidate	193001	AFN2N0	165		\N
candidate	193001	AFN2N0	166	Eva is a director.	False
candidate	193001	AFN2N0	167	Barbara was a director.	False
candidate	193001	AFN2N0	168	Tadeusz was a director.	False
candidate	193001	AFN2N0	169		\N
candidate	193001	AFN2N0	170	Tadeusz was a director.	False
candidate	193001	AFN2N0	171		\N
candidate	193001	AFN2N0	172	Dr Bean is a learner	True
candidate	193001	AFN2N0	173		\N
candidate	193001	AFN2N0	174	Dr Bean was a pair	False
candidate	193001	AFN2N0	175		\N
candidate	193001	AFN2N0	176	Dr Bean was honest	True
candidate	193001	AFN2N0	177		\N
candidate	193001	AFN2N0	178	Dr Bean was a team.	True
candidate	193001	AFN2N0	179		\N
candidate	193001	AFN2N0	180	Dr Bean was a team	False
candidate	193001	AFN2N0	181		\N
candidate	193001	AFN2N0	182	Dr Bean was a system	True
candidate	193001	AFN2N0	183		\N
candidate	193001	AFN2N0	184	Dr Bean was a learner.	True
candidate	193001	AFN2N0	185	Dr Bean is a learner.	True
candidate	193001	AFN2N0	186	dr bean is a learner.	True
candidate	193001	AFN2N0	187	dr bean is a learner.	True
candidate	193001	AFN2N0	188	Dr Bean was personality	True
candidate	193001	AFN2N0	189		\N
candidate	193001	AFN2N0	190	DR Bean was a personality	True
candidate	193001	AFN2N0	191	Dr Bean was a personality	True
candidate	193001	AFN2N0	192	Dr Bean was personality	True
candidate	193001	AFN2N0	193	Dr Bean was ambitious.	True
candidate	193001	AFN2N0	194		\N
candidate	193001	AFN2N0	195	Dr Bean was a risk.	True
candidate	193001	AFN2N0	196	Dr Bean was a risk.	True
candidate	193001	AFN2N0	197		\N
candidate	193001	AFN2N0	198	Dr Bean was a risk.	True
candidate	193001	AFN2N0	199		\N
candidate	193001	AFN2N0	200	Eva was a risk.	True
candidate	193001	AFN2N0	201		\N
candidate	193001	AFN2N0	202	Dr Bean was successful	False
candidate	193001	AFN2N0	203	Dr Bean is a risk.	True
candidate	193001	AFN2N0	204	Eva was a risk.	True
candidate	193001	AFN2N0	205	Eva was a risk.	False
candidate	193001	AFN2N0	206	Barbara was a risk.	True
candidate	193001	AFN2N0	207	Barbara was a risk.	True
candidate	193001	AFN2N0	208	Barbara was a risk.	True
candidate	193001	AFN2N0	209		\N
candidate	193001	AFN2N0	210	Barbara was a risk.	True
candidate	193001	AFN2N0	211	Barbara was a risk.	True
candidate	193001	AFN2N0	212	Eva was a risk	True
candidate	193001	AFN2N0	213	Eva was a risk	True
candidate	193001	AFN2N0	214	Eva was a risk	True
candidate	193001	AFN2N0	215		\N
candidate	193001	AFN2N0	216	Eva was a risk	True
candidate	193001	AFN2N0	217	Barbara was a risk	True
q-and-a-2	193001	AFN3Y0	5		\N
candidate	193001	AFN2N0	218	Barbara is a risk.	True
candidate	193001	AFN2N0	219	Dr Bean was a risk.	True
candidate	193001	AFN2N0	220		\N
candidate	193001	AFN2N0	221	the team was a risk.	True
candidate	193001	AFN2N0	222	The team was a risk.	True
candidate	193001	AFN2N0	223	Tadeusz was a risk.	False
candidate	193001	AFN2N0	224		\N
candidate	193001	AFN2N0	225		\N
candidate	193001	AFN2N0	226	Dr Bean was a risk.	True
candidate	193001	AFN2N0	227	Fast-Track was a risk.	True
candidate	193001	AFN2N0	228	Fast-Track was a risk.	True
candidate	193001	AFN2N0	229	Eva was the head.	False
candidate	193001	AFN2N0	230		\N
candidate	193001	AFN2N0	231	Barbara was the head.	False
candidate	193001	AFN2N0	232		\N
candidate	193001	AFN2N0	233	Dr Bean was the head.	True
candidate	193001	AFN2N0	234	Dr Bean was the head.	True
candidate	193001	AFN2N0	235		\N
candidate	193001	AFN2N0	236	Dr Bean was the head.	True
candidate	193001	AFN2N0	237	Dr Bean was the head.	True
candidate	193001	AFN2N0	238	Tadeusz was the head.	False
candidate	193001	AFN2N0	239	Tadeusz was the head.	False
candidate	193001	AFN2N0	240	Tadeusz was the head.	False
candidate	193001	AFN2N0	241	Tadeusz was the head.	False
candidate	193001	AFN2N0	242	Tadeusz was the head.	False
candidate	193001	AFN2N0	243		\N
candidate	193001	AFN2N0	244	Dr Bean was the head.	True
candidate	193001	AFN2N0	245	Dr Bean was the head.	True
candidate	193001	AFN2N0	246		\N
candidate	193001	AFN2N0	247	Eva was the head.	False
candidate	193001	AFN2N0	248	Eva was the head	False
candidate	193001	AFN2N0	249	The director was the head.	True
candidate	193001	AFN2N0	250	Barbara was the way.	False
candidate	193001	AFN2N0	251	Dr Bean was the head	True
candidate	193001	AFN2N0	252	Tadeusz was the head	False
candidate	193001	AFN2N0	253	Tadeusz was a head.	True
candidate	193001	AFN2N0	254	Tadeusz was the head.	False
candidate	193001	AFN2N0	255	Tadeusz was the head.	False
candidate	193001	AFN2N0	256		\N
candidate	193001	AFN2N0	257	Tadeusz was the director.	False
candidate	193001	AFN2N0	258		\N
candidate	193001	AFN2N0	259	Tadeusz was the director.	False
candidate	193001	AFN2N0	260	Tadeusz was the director.	False
candidate	193001	AFN2N0	261	Tadeusz was the director.	False
candidate	193001	AFN2N0	262		\N
candidate	193001	AFN2N0	263	Tadeusz was the director.	False
candidate	193001	AFN2N0	264		\N
candidate	193001	AFN2N0	265	Dr Bean was the head.	True
candidate	193001	AFN2N0	266	Dr Bean was the head.	True
candidate	193001	AFN2N0	267	Dr Bean was the head.	True
candidate	193001	AFN2N0	268		\N
candidate	193001	AFN2N0	269	Dr Bean was the head.	True
candidate	193001	AFN2N0	270	Dr Bean was a head.	True
candidate	193001	AFN2N0	271	Eva was a head.	False
candidate	193001	AFN2N0	272	Barbara was a head.	False
candidate	193001	AFN2N0	273		\N
candidate	193001	AFN2N0	274	Fast-Track was a company.	True
candidate	193001	AFN2N0	275	Barbara was a personality.	True
candidate	193001	AFN2N0	276	Barbara was the personality.	True
candidate	193001	AFN2N0	277	Tadeusz was a personality.	True
candidate	193001	AFN2N0	278	Tadeusz was a personality.	True
candidate	193001	AFN2N0	279	Tadeusz was a personality.	True
candidate	193001	AFN2N0	280		\N
candidate	193001	AFN2N0	281	Tadeusz was a personality.	True
candidate	193001	AFN2N0	282	Eva was a personality.	True
candidate	193001	AFN2N0	283		\N
candidate	193001	AFN2N0	284	Eva was a personality.	True
candidate	193001	AFN2N0	285		\N
candidate	193001	AFN2N0	286	Eva was a course.	False
candidate	193001	AFN2N0	287		\N
candidate	193001	AFN2N0	288	Eva is a thing.	False
candidate	193001	AFN2N0	289		\N
candidate	193001	AFN2N0	290	Eva was a way.	True
candidate	193001	AFN2N0	291	Eva was bad.	False
candidate	193001	AFN2N0	292		\N
candidate	193001	AFN2N0	293	Dr Bean was a learner.	True
candidate	193001	AFN2N0	294	Dr Bean was a way.	True
candidate	193001	AFN2N0	295	Dr Bean was a learner.	True
candidate	193001	AFN2N0	296	Eva was fast.	True
candidate	193001	AFN2N0	297	Eva was a learner.	True
candidate	193001	AFN2N0	298		\N
candidate	193001	AFN2N0	299	Eva was patient.	True
candidate	193001	AFN2N0	300	Eva was patient.	True
candidate	193001	AFN2N0	301		--
candidate	193001	AFN2N0	302	Eva was a risk.	True
candidate	193001	AFN2N0	303	Eva was a risk.	True
candidate	193001	AFN2N0	304	Eva was difficult.	False
candidate	193001	AFN2N0	305	Eva was good.	True
candidate	193001	AFN2N0	306	Barbara was good.	True
candidate	193001	AFN2N0	307	Dr Bean was five.	False
candidate	193001	AFN2N0	308	Eva was hard.	False
candidate	193001	AFN2N0	309		\N
candidate	193001	AFN2N0	310	Eva was hard.	False
candidate	193001	AFN2N0	311	Eva was a learner.	True
candidate	193001	AFN2N0	312	Barbara was a learner.	True
candidate	193001	AFN2N0	313		\N
candidate	193001	AFN2N0	314	Dr Bean was a director.	False
candidate	193001	AFN2N0	315	Dr Bean was a director	False
candidate	193001	AFN2N0	316	Dr Bean was a director.	False
candidate	193001	AFN2N0	317	DR Bean was a director.	False
candidate	193001	AFN2N0	318	Dr Bean was a director.	False
candidate	193001	AFN2N0	319	Dr Bean was a risk	True
candidate	193001	AFN2N0	320	Dr Bean was a risk.	True
candidate	193001	AFN2N0	321	Dr Bean was a risk.	True
candidate	193001	AFN2N0	322	Dr Bean was a risk.	True
candidate	193001	AFN2N0	323	Tadeusz was a risk.	False
candidate	193001	AFN2N0	324	Barbara was a risk.	True
candidate	193001	AFN2N0	325	fds fsd fsd	--
candidate	193001	AFN2N0	326	Eva was a risk.	True
candidate	193001	AFN2N0	327	Tadeusz had a team	True
candidate	193001	AFN2N0	328	Tadeusz had a team.	True
candidate	B00200054	AFN2N0	5		\N
candidate	B00200054	AFN2N0	6	Eva wants a job.	True
candidate	B00200054	AFN2N0	7		\N
candidate	B00200054	AFN2N0	8		\N
candidate	B00200054	AFN2N0	9	Eva feels bad.	True
candidate	B00200054	AFN2N0	10		\N
candidate	B00200054	AFN2N0	11	Eva is honest person.	True
candidate	B00200054	AFN2N0	12		\N
candidate	B00200054	AFN2N0	13	Eva respects her English teacher.	True
candidate	B00200054	AFN2N0	14		\N
candidate	N02202101	AFN2N0	4		\N
candidate	N02202101	AFN2N0	5		\N
candidate	N02202101	AFN2N0	6	Is Babara a ambitious women? 	True
candidate	N02202101	AFN2N0	7	Does Tadeusz graguate from college?	False
candidate	N02202101	AFN2N0	8	Does Tadeusz graguate from college?	False
candidate	N02202101	AFN2N0	9	Does dr. bean have any experience of sales?	False
candidate	N02202101	AFN2N0	10	Does dr. bean have any experience of sales?	False
candidate	N02202101	AFN2N0	11	does Tedeusz like to work with coworkers?	True
candidate	N02202101	AFN2N0	12	does Tedeusz like to work with coworkers?	True
candidate	N02202101	AFN2N0	13	Does Eva like teamwork if there is a project need done	True
candidate	N02202101	AFN2N0	14	Does Eva like teamwork if there is a project need done	True
candidate	N02202101	AFN2N0	15	Is it right Tedeusz think doing things should be patient and reliable? 	True
candidate	N02202101	AFN2N0	16	Is it right Tedeusz think doing things should be patient and reliable? 	True
candidate	N02202101	AFN2N0	17	Is dr. bean a cofident and outgoing man	False
candidate	N02202101	AFN2N0	18	Is dr. bean a cofident and outgoing man	False
candidate	N02202101	AFN2N0	19	Does dr, bean get a lot of feedback when he tries maketing sales	False
candidate	N02202101	AFN2N0	20	Does dr, bean get a lot of feedback when he tries maketing sales	False
candidate	N02202101	AFN2N0	21	Does Eva have experience of marketing sales?	True
candidate	N02202101	AFN2N0	22	Does Eva have experience of marketing sales?	True
candidate	N02202101	AFN2N0	23	Does dr. bean enjoy marketing?	False
candidate	N02202101	AFN2N0	24	Does dr. bean enjoy marketing?	False
candidate	V9741064	FLA0006	1		\N
intros	193001	AFN3Y0	1		\N
intros	193001	AFN3Y0	2	Who is a person	Dr Bean
intros	193001	AFN3Y0	3		\N
intros	193001	AFN3Y0	4		\N
intros	193001	AFN3Y0	5	Who was a person.	Dr Bean
intros	193001	AFN3Y0	6		\N
intros	193001	AFN3Y0	7	Was Dr Bean a person?	Yes
intros	193001	AFN3Y0	8		\N
intros	193001	AFN3Y0	9	Was Mi Mi a person?	No
intros	193001	AFN3Y0	10	Was music a person?	No
q-and-a	193001	AFN3Y0	1		\N
q-and-a	193001	AFN3Y0	2	Was Dr Bean a person?	Yes
q-and-a	193001	AFN3Y0	3		\N
q-and-a	N00200056	AFN3Y0	1		\N
q-and-a	N00200056	AFN3Y0	2		\N
q-and-a	N00200056	AFN3Y0	3		\N
q-and-a	N00200056	AFN3Y0	4		\N
q-and-a	N00200056	AFN3Y0	5	Who had a cat?	Rena
q-and-a	N00200056	AFN3Y0	6	what color is Rena like?	The Color Pink
q-and-a	N00200056	AFN3Y0	7	Who is Rena's teacher?	Dr Bean
q-and-a	N00200056	AFN3Y0	8	What is the cat's name?	Mi Mi
q-and-a	N00200056	AFN3Y0	9	What is Rena like?	Hello Kitty
q-and-a	N96200030	AFN3Y0	1		\N
q-and-a	N00200056	AFN300	1		\N
q-and-a	N00200056	AFN300	2		\N
q-and-a	N00200056	AFN300	3		\N
q-and-a	N00200056	AFN300	4	Rena lives in Hshinchu,isn't she?	Yes
q-and-a	N00200056	AFN300	5	Rena likes Hello Kitty,isn't she?	Yes
q-and-a	N00200056	AFN300	6	Dr Bean is a teacher,isn't he?	Yes
q-and-a	N00200056	AFN300	7	Rena is a student,isn't she?	Yes
q-and-a	N00200056	AFN300	8	Rena is a teacher,isn't she?	No
q-and-a	N00200056	AFN300	9	Cat's name is Mimi,isn't it?	Yes
q-and-a	N00200056	AFN300	10	Dr Bean is an American,isn't he?	No
q-and-a	N00200056	AFN300	11	Dr Bean lives in Taiwan,isn't he?	Yes
q-and-a	N00200029	AFN3Y0	1		\N
q-and-a	N00200029	AFN3Y0	2	What does the color Rene like ?	The Color Pink
q-and-a	N00200029	AFN3Y0	3	What is your favorite ?	Hello Kitty
q-and-a	N00200029	AFN3Y0	4	what is Rene's  cat name?	Mi Mi
q-and-a	N00200029	AFN3Y0	5	Where did you study in ?	Minghsin University
q-and-a	N00200029	AFN3Y0	6	What is your major in university ?	Applied Foreign Languages
q-and-a	193001	AFN3Y0	4		\N
q-and-a	N00200001	AFN3Y0	1		\N
q-and-a	N00200001	AFN3Y0	2	What is Rena's favorite color?	The Color Pink
q-and-a	N00200001	AFN3Y0	3	How do you call the name of Rena's cat?	Mi Mi
q-and-a	N00200001	AFN3Y0	4	Who is Rena's favorite singer?	Avril Lavigne
q-and-a	N00200001	AFN3Y0	5	What is Rena's another favorite?	Hello Kitty
q-and-a	N00200001	AFN3Y0	6	What is Rena's interest?	Music
q-and-a	193001	AFN3Y0	5		\N
q-and-a	N00200042	AFN3Y0	1		\N
q-and-a	N00200042	AFN3Y0	2	Where did you study in ? 	Minghsin University
q-and-a	N00200042	AFN3Y0	3	Where did Mindy study in ? 	Minghsin University
q-and-a	N00200042	AFN3Y0	4		--
q-and-a	N00200030	AFN3Y0	1		\N
q-and-a	N00200030	AFN3Y0	2	What is Jeff's favorite Sport?	Basketball
q-and-a	N00200030	AFN3Y0	3	What is Jeff's date of birth?	April 30th, 1994
q-and-a	N00200030	AFN3Y0	4	who is a teacher of Computer and Multimedia Language Teaching? 	Dr Bean
q-and-a	N00200017	AFN3Y0	1		\N
q-and-a	N00200017	AFN3Y0	2		\N
q-and-a	N00200030	AFN3Y0	5	Where was Jeff born?	Taoyuan
q-and-a	N00200030	AFN3Y0	6		\N
q-and-a	N00200055	AFN3Y0	1		\N
q-and-a	N00200030	AFN3Y0	7		\N
q-and-a	N00200055	AFN3Y0	2	Who likes Hello Kitty	Rena
q-and-a	N00200017	AFN3Y0	3	Who likes the singer Avril Lavigne?	Mi Mi
q-and-a	N00200055	AFN3Y0	3	Where does she want to go work?	Rena
q-and-a	N00200017	AFN3Y0	4		\N
q-and-a	N00200017	AFN3Y0	5	Does Jeff study in Minghsin University?	Yes
q-and-a	N00200030	AFN3Y0	8	Jeff's father is a truck driver, isn't he?	Yes
q-and-a	N00200017	AFN3Y0	6	Does Jeff study in Minghsin University?	Yes
q-and-a	N00200055	AFN3Y0	4	What is Shane's favorite sport?	Basketball
q-and-a	N00200055	AFN3Y0	5	What is Rena's cat name ?	Mi Mi
q-and-a	N00200030	AFN3Y0	9	What is Jeff''s Chinese name?	Huang Che-Yu
q-and-a	N00200017	AFN3Y0	7	Does Rena had a cat?	Yes
q-and-a	N00200017	AFN3Y0	8	Does Rena like Hello Kitty?	Yes
q-and-a	N00200017	AFN3Y0	9	Does Rena like Hello Kitty?	Yes
q-and-a	N00200017	AFN3Y0	10	Does Jeff like music?	No
q-and-a	N00200055	AFN3Y0	6	What country does Rena want to go ?	America
q-and-a	N00200017	AFN3Y0	11		\N
q-and-a	N00200017	AFN3Y0	12	What hobby does Jeff will do?	Basketball
q-and-a	N00200025	AFN3Y0	1		\N
q-and-a	N00200025	AFN3Y0	2		\N
q-and-a	N00200025	AFN3Y0	3		\N
q-and-a	N00200017	AFN3Y0	13	Which county does Rena want to working	America
q-and-a	N00200025	AFN3Y0	4		\N
q-and-a	N00200017	AFN3Y0	14	Which university does Jeff studied?	Minghsin University
q-and-a	N00200025	AFN3Y0	5	What university does Jeff study in ?	Minghsin University
q-and-a	N00200017	AFN3Y0	15	What  department does Jeff studied?	Applied Foreign Languages
q-and-a	N00200025	AFN3Y0	6	What is Rena's habit? 	Music
q-and-a	N00200025	AFN3Y0	7	What color does Rena like ?	The Color Pink
q-and-a	N00200025	AFN3Y0	8	What is Jeff Chinese name ? 	Huang Che-Yu
q-and-a	N00200025	AFN3Y0	9	What is Jeff favorite sport?	Basketball
q-and-a	N00200025	AFN3Y0	10	Who had the pet of cats?	Rena
q-and-a	N01203003	AFN3Y0	1		\N
q-and-a	N01203003	AFN3Y0	2		\N
q-and-a	N01203003	AFN3Y0	3		\N
q-and-a	N01203003	AFN3Y0	4	Which cartoon character is Rena most like?	Hello Kitty
q-and-a	N01203003	AFN3Y0	5	Who is our Computer Multimedia in Language Teaching of lecturer?	Dr Bean
q-and-a	N01203003	AFN3Y0	6	What is the color for Rena's Hello Kitty?	The Color Pink
q-and-a	N01203003	AFN3Y0	7	What is Jeff's Chinese full name?	Huang Che-Yu
q-and-a	N01203003	AFN3Y0	8	What is Rena's pet name?	Mi Mi
q-and-a	N96200030	AFN3Y0	2		\N
q-and-a	N96200030	AFN3Y0	3	where did you study in?	Minghsin University
q-and-a	N96200030	AFN3Y0	4	who is you a teacher	Dr Bean
q-and-a	N96200030	AFN3Y0	5	who like pink color?	The Color Pink
q-and-a	N96200030	AFN3Y0	6	where is the hometown?	Hsinchu
q-and-a	N96200030	AFN3Y0	7	what is you a interest?	Music
q-and-a	N96200030	AFN3Y0	8	who have cat mimi?	Rena
q-and-a	193001	AFN3Y0	6		\N
q-and-a	193001	AFN3Y0	7		\N
q-and-a	193001	AFN3Y0	8	lsdfds dsfds sfds	The Color Pink
q-and-a	193001	AFN3Y0	9	dfd dfds dfdsdfs	The Color Pink
q-and-a	193001	AFN3Y0	10	dfd dfds dfdsdfs	The Color Pink
q-and-a	193001	AFN3Y0	11	dfds dfds dfds	The Color Pink
q-and-a	193001	AFN3Y0	12	dfsds dfsd fdds	The Color Pink
q-and-a	193001	AFN3Y0	13	dfsds dfsd fdds	The Color Pink
q-and-a	193001	AFN3Y0	14	Mindy was a student.	Applied Foreign Languages
q-and-a	N00200008	AFN3Y0	1		\N
q-and-a	N00200008	AFN3Y0	2		\N
q-and-a	N00200008	AFN3Y0	3		\N
q-and-a	N00200008	AFN3Y0	4		\N
q-and-a	N00200036	AFN3Y0	1		\N
q-and-a	N00200036	AFN3Y0	2		\N
q-and-a	N00200036	AFN3Y0	3	What animal does Rena most like?	Rena
q-and-a	N00200036	AFN3Y0	4	Where is Rena living now?	Rena
q-and-a	N00200036	AFN3Y0	5	Where is Rena want to go?	Rena
q-and-a	N00200036	AFN3Y0	6		\N
q-and-a	N00200036	AFN3Y0	7		\N
q-and-a	N00200036	AFN3Y0	8		\N
q-and-a	N00200036	AFN300	1		\N
q-and-a	N00200036	AFN300	2		\N
q-and-a	N00200036	AFN300	3		\N
q-and-a	N00200036	AFN300	4		\N
q-and-a	N00200036	AFN300	5		\N
q-and-a	N00200036	AFN300	6	Dr. Bean hometown is America,isn't he?	Yes
q-and-a	N00200036	AFN300	7	Dr. Bean likes America's music,doesn't he?	Yes
q-and-a	N00200036	AFN300	8	Mi_Mi is a cat,isn't it?	Yes
q-and-a	N00200036	AFN300	9	Jeff is a good boy,isn't he?	Yes
q-and-a	N00200036	AFN300	10	Rena likes foreign music,doesn't she? 	Yes
q-and-a	N00200036	AFN300	11	Rena is a cat's lover,isn't she?	Yes
q-and-a	N00200036	AFN300	12	Rena is on her way to the dream,isn't she?	Yes
q-and-a	N00200036	AFN3Y0	9		\N
q-and-a	N00200036	AFN3Y0	10	Where is Jeff hometown?	Jeff
q-and-a	N00200036	AFN3Y0	11	What is Jeff favorite sport?	Jeff
q-and-a	N00200036	AFN3Y0	12	What is Rena favorite music?	Rena
q-and-a	N00200036	AFN3Y0	13	What country does Rena like?	Rena
q-and-a	193001	AFN3Y0	15		\N
q-and-a	193001	AFN3Y0	16		\N
q-and-a	193001	AFN3Y0	17		\N
q-and-a	193001	AFN3Y0	18	does alex like drawing	Yes
q-and-a	193001	AFN3Y0	19	did alex like drawing	Yes
q-and-a	193001	AFN3Y0	20	did Jeff like basketball	Yes
q-and-a	193001	AFN3Y0	21		\N
q-and-a	193001	AFN3Y0	22	Did Jeff like basketball?	Yes
q-and-a	193001	AFN3Y0	23		\N
q-and-a	193001	AFN3Y0	24		\N
q-and-a	193001	AFN3Y0	25	Was Dr Bean a student?	No
q-and-a	193001	AFN3Y0	26	Who was a teacher	Yes
q-and-a	193001	AFN3Y0	27	Who was a teacher	No
q-and-a	193001	AFN3Y0	28		\N
q-and-a	193001	AFN3Y0	29	Who was a student?	Rena
q-and-a	193001	AFN3Y0	30	Who are students?	Rena
q-and-a	193001	AFN3Y0	31	who were students?	Rena
q-and-a	193001	AFN3Y0	32	who were some students	Rena
q-and-a	193001	AFN3Y0	33	Who was the student whose grandmother was a farmer?	Jeff
q-and-a	193001	AFN3Y0	34	Whose grandmother was a farmer?	Jeff
q-and-a	193001	AFN3Y0	35	Who was the student who had a cat?	Rena
q-and-a	193001	AFN3Y0	36		\N
q-and-a	193001	AFN3Y0	37	Who wasn't born in Hsinchu?	Rena
q-and-a	193001	AFN3Y0	38	who was the student whose cat was mi mi?	Rena
q-and-a	193001	AFN3Y0	39	Whose cat was Mi Mi?	Rena
q-and-a	N01202004	AFN3Y0	1		\N
q-and-a	N00200008	AFN3Y0	5		\N
q-and-a	N00200008	AFN3Y0	6	who like listening to music?	Rena
q-and-a	N00200008	AFN3Y0	7		\N
q-and-a	N00200054	AFN3Y0	1		\N
q-and-a	N00200008	AFN3Y0	8		\N
q-and-a	N00200054	AFN3Y0	2	what color is Rena like?	The Color Pink
q-and-a	N00200054	AFN3Y0	3	What country does Rena like?	Minghsin University
q-and-a	N00200054	AFN3Y0	4	What is Rena like?	Hello Kitty
q-and-a	N00200054	AFN3Y0	5	What is the cat's name?	Mi Mi
q-and-a	N00200054	AFN3Y0	6	Who had a cat?	Mi Mi
q-and-a	N00200054	AFN3Y0	7	What is Rena like?	Music
q-and-a	N00200054	AFN3Y0	8		\N
q-and-a	N00200054	AFN3Y0	9		\N
q-and-a	N00200054	AFN3Y0	10	what is Rena had this?	--
q-and-a	N00200054	AFN3Y0	11	Where did you study in ?	--
q-and-a	N00200054	AFN3Y0	12	What is your favorite color ?	--
q-and-a	N00200054	AFN3Y0	13	Where did you study in ?	--
q-and-a	N00200008	AFN3Y0	9		\N
q-and-a	N00200054	AFN3Y0	14	who is like sleeping?	--
q-and-a	N00200054	AFN3Y0	15	What is Jeff name?	--
q-and-a	N00200054	AFN3Y0	16	What is your hobby ?	--
q-and-a	N00200008	AFN3Y0	10	Who is Rena favorite singer?	Avril Lavigne
q-and-a	N00200008	AFN3Y0	11	Who like Avril Lavigne?	Rena
q-and-a	N00200008	AFN3Y0	12	Who like Avril Lavigne	Rena
q-and-a	N00200008	AFN3Y0	13	Which color does Rena like?	The Color Pink
q-and-a	N00200008	AFN3Y0	14	Which color does Rena like	The Color Pink
q-and-a	N00200008	AFN3Y0	15	Which color does Rena like?	--
q-and-a	N00200008	AFN3Y0	16	Why does Rena raise a cat?	--
q-and-a	N00200008	AFN3Y0	17	Who is the MIMI master?	Rena
q-and-a	N00200008	AFN3Y0	18	What is the name of Rena pet?	Mi Mi
q-and-a	N00200008	AFN3Y0	19	What is Jeff's Chinese name?	--
q-and-a	N00200008	AFN3Y0	20	Where does Jeff live in?	Hsinchu
q-and-a	N00200008	AFN3Y0	21	Who likes to travel?	Alex
q-and-a	N00200008	AFN3Y0	22	Who cares about travel?	Alex
q-and-a	N00200008	AFN300	1		\N
q-and-a	N00200008	AFN300	2		\N
q-and-a	N00200008	AFN300	3		\N
q-and-a	N00200008	AFN300	4		\N
q-and-a	N00200008	AFN300	5		\N
q-and-a	N00200008	AFN300	6		\N
q-and-a	N00200008	AFN300	7		\N
q-and-a	N00200008	AFN300	8		\N
q-and-a	N00200008	AFN300	9		\N
q-and-a	193001	AFN3Y0	40		\N
q-and-a	193001	AFN3Y0	41	Who were students who lived in Hsinchu	Alex
q-and-a	193001	AFN3Y0	42	Who were students who didn't live in Hsinchu?	Jeff
q-and-a	193001	AFN3Y0	43	Who were students who didn't live in Hsinchu?	Jeff
q-and-a	N00200037	AFN3Y0	1		\N
q-and-a	N00200037	AFN3Y0	2	Where does Alex live?	Hsinchu
q-and-a	N00200037	AFN3Y0	3	who likes Hello kitty?	Rena
q-and-a	N00200037	AFN3Y0	4	what day is Jeff's birthday?	--
q-and-a	N00200037	AFN3Y0	5	where's minchain university?	--
q-and-a	N00200037	AFN3Y0	6	Who comes from Taoyan?	--
q-and-a	193001	AFN3Y0	44		\N
q-and-a	193001	AFN3Y0	45	Who was the student whose grandmother was a farmer?	Jeff
q-and-a	193001	AFN3Y0	46	Whose grandmother was a farmer?	Jeff
q-and-a	N00200042	AFN3Y0	5		\N
q-and-a	N00200034		1		\N
q-and-a	N00200034		2	What does her cat's name?	Mi Mi
q-and-a	N00200034		3		\N
q-and-a	N00200042	AFN3Y0	6	How do you call the name of Rena's cat?	Mi Mi
q-and-a	N00200034		4		\N
q-and-a	N00200034		5	Where do you come from	Taoyuan
q-and-a	N00200042	AFN3Y0	7	what color is Rena like?	The Color Pink
q-and-a	N00200034		6	Which country do you from	Taoyuan
q-and-a	N00200042	AFN3Y0	8	Where did Kelly study in ?	Minghsin University
q-and-a	N00200042	AFN3Y0	9	Who had the pet of cats?	Rena
q-and-a	N00200034		7		\N
q-and-a	N00200034		8		\N
q-and-a	N00200034		9	What is Rena's cat name	Rena
q-and-a	N00200034		10	What does Rena's cat name?	Rena
q-and-a	N00200051	AFN3Y0	1		\N
q-and-a	N00200051	AFN3Y0	2	Which color does Rena like, pink or green?	The Color Pink
q-and-a	N00200051	AFN3Y0	3	Which color did Rena like?	The Color Pink
q-and-a	193001	AFN3Y0	47	Who was the student whose grandmother was a farmer?	Jeff
q-and-a	N00200051	AFN3Y0	4	Who's favorite singer was Avril Lavigne?	Rena
q-and-a	N00200051	AFN3Y0	5	Who liked listening to music?	Rena
q-and-a	N00200051	AFN3Y0	6	Who had a cat?	Rena
q-and-a	193001	AFN3Y0	48		\N
q-and-a	193001	AFN3Y0	49		\N
q-and-a	193001	AFN3Y0	50		\N
q-and-a	193001	AFN3Y0	51		\N
q-and-a	193001	AFN3Y0	52	What was Jeff's Chinese name?	Huang Che-Yu
q-and-a	193001	AFN3Y0	53	Where did Rena want to work?	America
q-and-a	N01202001	AFN3Y0	1		\N
q-and-a	N01202001	AFN3Y0	2		\N
q-and-a	N01202001	AFN3Y0	3	Jeff was born in Taoyuan.	Yes
q-and-a	N01202001	AFN3Y0	4	Jeff's father is a farmer.	No
q-and-a	N01202001	AFN3Y0	5	Jeff was born on April 30th.1994	Yes
q-and-a	N01202001	AFN3Y0	6	Jeff's mother is a babysitter.	No
q-and-a	N01202001	AFN3Y0	7	Jeff's favorite sport is baseball.	No
q-and-a	N01202001	AFN3Y0	8	Jeff has one sibling.	No
q-and-a	N00200001	AFN300	1		\N
q-and-a	N00200001	AFN300	2	Did Cindy can playing the piano?	Yes
q-and-a	N00200001	AFN300	3	Was Alex a design_assistant ?	Yes
q-and-a	N00200001	AFN300	4	Wasn't Dr_Bean a student?	No
q-and-a	N00200001	AFN300	5	Rena's favorite singer was Avril_Lavigne ?	Yes
q-and-a	N00200001	AFN300	6	Was Cindy live in Jiayi ?	Yes
q-and-a	N00200001	AFN300	7	Did Cindy live in Jiayi ?	Yes
q-and-a	N00200001	AFN300	8	Did Cindy live in Jiayi ?	No
q-and-a	N00200001	AFN300	9	Was Jeff's father a  truck_driver ?	Yes
q-and-a	N00200001	AFN300	10	Was Rena's favorite the_color_pink?	Yes
q-and-a	N01202004	AFN3Y0	2		\N
q-and-a	N01202004	AFN3Y0	3		\N
q-and-a	N01202004	AFN3Y0	4		\N
q-and-a	N01202004	AFN3Y0	5		\N
q-and-a	N01202004	AFN3Y0	6	Rana dislike pink	No
q-and-a	N01202004	AFN3Y0	7		\N
q-and-a	N01202004	AFN3Y0	8		\N
q-and-a	N01202004	AFN3Y0	9	What is Rena's like color?	The Color Pink
q-and-a	N01202004	AFN3Y0	10	Who likes hello kitty?	Rena
q-and-a	N01202004	AFN3Y0	11	What is Rena's habit? 	Listening To Music
q-and-a	N01202004	AFN3Y0	12	Who love avril lavigne?	Rena
q-and-a	N01202004	AFN3Y0	13	what is jeff	--
q-and-a	N01202004	AFN3Y0	14	what is jeff's birthday?	April 30th, 1994
q-and-a	N00200043	AFN3Y0	1		\N
q-and-a	N00200043	AFN3Y0	2		\N
q-and-a	N00200043	AFN3Y0	3		\N
q-and-a	N00200043	AFN3Y0	4		\N
q-and-a	N00200043	AFN3Y0	5		\N
q-and-a	N00200043	AFN3Y0	6	What is Rena's favorite? 	Hello Kitty
q-and-a	N00200043	AFN3Y0	7	what is Alex's hobby?	Drawing
q-and-a	N00200043	AFN3Y0	8	Which part is Alex's favorite?	Travel
q-and-a	N00200043	AFN3Y0	9	What is can help Mindy forget trouble?	Listening To Music
q-and-a	N00200043	AFN3Y0	10	what is dave major in minchain university?	Applied Foreign Languages
q-and-a	N00200034	AFN3Y0	1		\N
q-and-a	N00200034	AFN3Y0	2	What is Rena's favorite?	Hello Kitty
q-and-a	N00200034	AFN3Y0	3	Who had a cat?	Rena
q-and-a	N00200034	AFN3Y0	4	Who likes hello kitty?	Rena
q-and-a	N00200034	AFN3Y0	5	Who haven't cat?	Jeff'S Mother
q-and-a	N00200034	AFN3Y0	6	Who want to play the piano?	Cindy'S Sister
q-and-a	N00200034	AFN3Y0	7	Who want playing the piano?	Cindy'S Sister
q-and-a	N00200034	AFN3Y0	8	Who like listening to music?	Jeff
q-and-a	N00200034	AFN3Y0	9	Who likes listening to music?	Jeff
q-and-a	N00200034	AFN3Y0	10	Who liked listening to music?	Jeff
q-and-a	N00200034	AFN3Y0	11	Who liked listening to music?	Alex
q-and-a	N00200034	AFN3Y0	12	Who liked listening to music?	Rena
q-and-a	N00200034	AFN3Y0	13	What is the cat's name?	Mi Mi
q-and-a	193001	AFN3Y0	54		\N
q-and-a	193001	AFN3Y0	55		\N
q-and-a	193001	AFN3Y0	56	What is Jeff's name?	Jeff
q-and-a	193001	AFN3Y0	57		\N
q-and-a	193001	AFN3Y0	58	Who was cat?	Mi Mi
q-and-a	193001	AFN3Y0	59		\N
q-and-a	193001	AFN3Y0	60	Who was teacher?	Dr Bean
q-and-a	193001	AFN3Y0	61	What was cat name	Mi Mi
q-and-a	193001	AFN3Y0	62		\N
q-and-a	193001	AFN3Y0	63	What was Rena name?	Mi Mi
q-and-a	193001	AFN3Y0	64		\N
q-and-a	193001	AFN3Y0	65	What was Rena name?	Mi Mi
q-and-a	193001	AFN3Y0	66	Who was student?	Rena
q-and-a	193001	AFN3Y0	67	who was rena name?	Rena
q-and-a	193001	AFN3Y0	68	who was student	Mi Mi
q-and-a	193001	AFN3Y0	69	who was sister	Jeff
q-and-a	193001	AFN3Y0	70		\N
q-and-a	193001	AFN3Y0	71	Who had mother	Jeff
q-and-a	193001	AFN3Y0	72	who had father	Jeff
q-and-a	193001	AFN3Y0	73	who had brother	Jeff
q-and-a	193001	AFN3Y0	74	who had man	Dr Bean
q-and-a	193001	AFN3Y0	75		\N
q-and-a	193001	AFN3Y0	76	who had man name	Dr Bean
q-and-a	193001	AFN3Y0	77	who had cat name	Mi Mi
q-and-a	193001	AFN3Y0	78		\N
q-and-a	193001	AFN3Y0	79		\N
q-and-a	193001	AFN3Y0	80	who had woman name	Avril Lavigne
q-and-a	193001	AFN3Y0	81	who had woman	Avril Lavigne
q-and-a	193001	AFN3Y0	82		\N
q-and-a	193001	AFN3Y0	83	was cindy live in jiayi	No
q-and-a	N01202004	AFN300	1		\N
q-and-a	N01202004	AFN300	2		\N
q-and-a	N01202004	AFN300	3		\N
q-and-a-2	193001	AFN3Y0	1		\N
q-and-a-2	193001	AFN3Y0	2		\N
q-and-a-2	193001	AFN3Y0	3	Was Avril Lavigne student?	No
q-and-a-2	193001	AFN3Y0	4	Was Avril Lavigne Rena's favorite?	Yes
q-and-a-2	193001	AFN3Y0	6		\N
q-and-a-2	193001	AFN3Y0	7		\N
q-and-a-2	193001	AFN3Y0	8		\N
q-and-a-2	193001	AFN3Y0	9	What was Alex's hobby?	Drawing
q-and-a-2	193001	AFN3Y0	10	hobby hobby hobby	Drawing
q-and-a-2	193001	AFN3Y0	11		\N
q-and-a-2	193001	AFN3Y0	12		\N
q-and-a-2	193001	AFN3Y0	13		\N
q-and-a-2	193001	AFN3Y0	14	Who was Rena's cat?	Mi Mi
q-and-a-2	193001	AFN3Y0	15	h	--
q-and-a-2	193001	AFN3Y0	16		\N
q-and-a-2	193001	AFN3Y0	17	Was Rena's cat Mi mi?	Yes
q-and-a-2	193001	AFN3Y0	18	Who was a farmer?	Jeff'S Grandmother
q-and-a-2	193001	AFN3Y0	19		\N
q-and-a-2	193001	AFN3Y0	20		\N
q-and-a-2	193001	AFN3Y0	21	Did Alex live in Hsinchu?	Yes
q-and-a-2	193001	AFN3Y0	22	Did Alex live in Hsinchu?	Yes
q-and-a-2	193001	AFN3Y0	23		\N
q-and-a-2	N00200001	AFN3Y0	1		\N
q-and-a-2	N00200001	AFN3Y0	2		\N
q-and-a-2	N00200001	AFN3Y0	3		\N
q-and-a-2	N00200001	AFN3Y0	4		\N
q-and-a-2	N00200001	AFN3Y0	5		\N
q-and-a-2	N00200034	AFN3Y0	1		\N
q-and-a-2	N00200034	AFN3Y0	2	Alex was live in Hsinchu,didn't he?	Hsinchu
q-and-a-2	N00200034	AFN3Y0	3	Who lived in Hsinchu?	Alex
q-and-a-2	N00200034	AFN3Y0	4	Who liked Hello kitty?	Rena
q-and-a-2	N00200034	AFN3Y0	5	Who was career woman?	Jeff'S Mother
q-and-a-2	N00200034	AFN3Y0	6	Who liked to play the piano?	Cindy
q-and-a-2	N00200034	AFN3Y0	7	Who liked playing the piano?	Cindy
q-and-a-2	N00200001	AFN3Y0	6		\N
q-and-a-2	N00200001	AFN3Y0	7	Was Vicky's mother a babysitter?	Yes
q-and-a-2	N00200001	AFN3Y0	8	Vicky liked to go shopping, didn't she?	Yes
q-and-a-2	N00200001	AFN3Y0	9	Vicky had sisters, didn't she?	Yes
q-and-a-2	N00200001	AFN3Y0	10	Cindy liked playing the piano, didn't she?	Yes
q-and-a-2	N00200001	AFN3Y0	11	Alex was a design_assistant, wasn't he?	Yes
q-and-a-2	N00200001	AFN3Y0	12	Alex lived in Hsinchu, didn't he?	Yes
q-and-a-2	N00200001	AFN3Y0	13	Cindy was born in Jiayi, wasn't she?	Yes
q-and-a-2	N00200001	AFN3Y0	14	Mi Mi was Rena's cat, wasn't it?	Yes
q-and-a-2	N00200001	AFN3Y0	15	Jeff's father was a truck_driver, wasn't he?	Yes
q-and-a-2	N00200001	AFN3Y0	16	Alex was born in Taoyuan, wasn't he?	No
q-and-a-2	N00200017	AFN3Y0	1		\N
q-and-a-2	N00200017	AFN3Y0	2	Who lived in Taoyuan?	Jeff
q-and-a-2	N00200017	AFN3Y0	3	Who want to came to America in the future?	Rena
q-and-a-2	N00200017	AFN3Y0	4	Which year is Jeff birth?	1994
q-and-a-2	N00200017	AFN3Y0	5	Which year is Jeff birth?	1994
q-and-a-2	N00200017	AFN3Y0	6	Who likes to play the piano	Cindy
q-and-a-2	N00200029	AFN3Y0	1		\N
q-and-a-2	N00200029	AFN3Y0	2	Who liked Avril_Lavigne ?	Rena
q-and-a-2	N00200029	AFN3Y0	3	Rena liked to listening to music , didn't she ?	--
q-and-a-2	N00200029	AFN3Y0	4	Who lived in Taoyuan ?	Jeff
q-and-a-2	N00200029	AFN3Y0	5	Who liked Hello Kitty ?	Rena
q-and-a-2	N00200029	AFN3Y0	6	Was Vicky's mother a teacher ?	--
q-and-a-2	N00200029	AFN3Y0	7	Was Cindy liked to playing the piano , wasn't she ?	--
q-and-a-2	N00200029	AFN3Y0	8	Was Alex liked  go shopping , wasn't he ?  	--
q-and-a-2	N00200029	AFN3Y0	9	Who liked palying basketball ?	--
q-and-a-2	N00200029	AFN3Y0	10	Was Jeff's grandmother a farmer , wasn't she ?	--
q-and-a-2	N00200029	AFN3Y0	11	Was Jeff's grandmother a farmer ?	--
q-and-a-2	N00200056	AFN3Y0	1		\N
q-and-a-2	N00200030	AFN3Y0	1		\N
q-and-a-2	N00200030	AFN3Y0	2	Jeff was born on April 30th, 1994, wasn't he?	Yes
q-and-a-2	N00200030	AFN3Y0	3	Jeff was born on April,30th,1994, wasn't he?	Yes
q-and-a-2	N00200030	AFN3Y0	4	Alex liked to travel,didn't he? 	Yes
q-and-a-2	N00200030	AFN3Y0	5	Alex liked to travel,didn't he? 	--
q-and-a-2	N00200030	AFN3Y0	6	Alex liked to travel didn't he? 	Yes
q-and-a-2	N00200030	AFN3Y0	7		\N
q-and-a-2	N00200030	AFN3Y0	8	Was Vicky's mother a baby sister?	Yes
q-and-a-2	N00200030	AFN3Y0	9	Did Rena liked to read?	No
q-and-a-2	N00200030	AFN3Y0	10	Did Alex liked to sleep? 	Yes
q-and-a-2	N00200030	AFN3Y0	11	Did Alex liked to travel?	Yes
q-and-a-2	N00200030	AFN3Y0	12	Did Alex liked to shopping?	No
q-and-a-2	N00200030	AFN3Y0	13		\N
q-and-a-2	N00200030	AFN3Y0	14	Who was born April 30th, 1994?	Jeff
q-and-a-2	N00200030	AFN3Y0	15	Who was born on April 30th 1994?	Jeff
q-and-a-2	N00200030	AFN3Y0	16	Where was Jeff from?	Taoyuan
q-and-a-2	N00200030	AFN3Y0	17		\N
q-and-a-2	N00200030	AFN3Y0	18	Did Alex lived in Hsinchu?	Yes
q-and-a-2	N00200030	AFN3Y0	19		\N
q-and-a-2	N00200030	AFN3Y0	20	Was Alex lived in Hsinchu?	Yes
q-and-a-2	N00200030	AFN3Y0	21		\N
q-and-a-2	N00200056	AFN3Y0	2		\N
q-and-a-2	N00200030	AFN3Y0	22		\N
q-and-a-2	N00200030	AFN3Y0	23	Jeff was born in Taoyuan, wasn't he?	--
q-and-a-2	N00200030	AFN3Y0	24	Jeff was born in Taoyuan, wasn't he?	Yes
q-and-a-2	N00200030	AFN3Y0	25	Jeff was born in Taoyuan, wasn't he?	Yes
q-and-a-2	N00200030	AFN3Y0	26	Jeff was born in Taoyuan, wasn't he?	Yes
q-and-a-2	N00200030	AFN3Y0	27	Jeff's mother was a career woman, wasn't she?	Yes
q-and-a-2	N00200030	AFN3Y0	28	Jeff's grandmother  was a farmer , wasn't she?	Yes
q-and-a-2	N00200043	AFN3Y0	1		\N
q-and-a-2	N00200043	AFN3Y0	2		\N
q-and-a-2	N00200043	AFN3Y0	3		\N
q-and-a-2	N00200043	AFN3Y0	4	who is mother career a babysistter?	Vicky'S Mother
q-and-a-2	N00200043	AFN3Y0	5	who mother career is a babysistter?	Vicky'S Mother
q-and-a-2	N00200043	AFN3Y0	6	whose is mother career is a babysitter?	Vicky'S Mother
q-and-a-2	N00200056	AFN3Y0	3		\N
q-and-a-2	N00200056	AFN3Y0	4	Cindy liked listening to music,didn't she?	Yes
q-and-a-2	N00200056	AFN3Y0	5	Alex lived in Hsinchu,didn't he?	Yes
q-and-a-2	N00200056	AFN3Y0	6	Alex was lived in Hsinchu,wasn't he?	Yes
q-and-a-2	N00200056	AFN3Y0	7	Alex was a student,wasn't he?	Yes
q-and-a-2	N00200056	AFN3Y0	8	Alex mother was a truck_driver, wasn't he? 	No
q-and-a-2	N00200056	AFN3Y0	9	Vicky had brothers, didn't she?	No
q-and-a-2	N00200056	AFN3Y0	10	Rena liked Hello Kitty,didn't she?	Yes
q-and-a-2	N00200008	AFN3Y0	1		\N
q-and-a-2	N00200008	AFN3Y0	2		\N
q-and-a-2	N00200008	AFN3Y0	3		\N
q-and-a-2	N00200008	AFN3Y0	4		\N
q-and-a-2	N00200008	AFN3Y0	5	who had a cat?	Rena
q-and-a-2	N00200008	AFN3Y0	6	who liked to travel?	Alex
q-and-a-2	N00200008	AFN3Y0	7	Alex liked to travel, didn't he?	Alex
q-and-a-2	N00200008	AFN3Y0	8	Cindy liked listening to music, didn't she? 	--
q-and-a-2	N00200008	AFN3Y0	9	Was Vicky's father an architect?	Vicky'S Father
q-and-a-2	N00200008	AFN3Y0	10	Who liked Avril Lavigne?	Rena
q-and-a-2	N00200008	AFN3Y0	11	They all lived in Hsinchu?	--
q-and-a-2	N00200008	AFN3Y0	12	Who liked exercising?	Vicky
q-and-a-2	N00200008	AFN3Y0	13	Who liked the_color_pink?	Rena
q-and-a-2	N00200008	AFN3Y0	14	Who liked drawing?	Alex
q-and-a-2	N01202001	AFN3Y0	1		\N
q-and-a-2	N96200030	AFN3Y0	1		\N
q-and-a-2	N01202001	AFN3Y0	2	Who liked to play basketball?	Jeff
q-and-a-2	N01202001	AFN3Y0	3	Who liked listening music?	Rena
q-and-a-2	N96200030	AFN3Y0	2		\N
q-and-a-2	N01202001	AFN3Y0	4	Who born in Jiayi country?	Cindy
q-and-a-2	N01202001	AFN3Y0	5	Who's father was a truck driver?	Jeff
q-and-a-2	N01202001	AFN3Y0	6	Who liked reading?	Alex
q-and-a-2	N96200030	AFN3Y0	3	vicky mother is babysister?	Yes
q-and-a-2	N96200030	AFN3Y0	4	whose mother is babysister?vickey didn't?	Yes
q-and-a-2	N96200030	AFN3Y0	5	Vickey liked shopping? 	Yes
q-and-a-2	N96200030	AFN3Y0	6	who liked shopping?	Yes
q-and-a-2	N96200030	AFN3Y0	7	Vickey liked shopping? didn't she?	Yes
q-and-a-2	N96200030	AFN3Y0	8	shopping is vickey liked?	Yes
q-and-a-2	N96200030	AFN3Y0	9	Rena has cat mi_mi?	Yes
q-and-a-2	N01202004	AFN3Y0	1		\N
q-and-a-2	N01202004	AFN3Y0	2		\N
q-and-a-2	N01202004	AFN3Y0	3		\N
q-and-a-2	N01202004	AFN3Y0	4		\N
q-and-a-2	N01202004	AFN3Y0	5		\N
q-and-a-2	N01202004	AFN3Y0	6	Cindy liked playing the piano, didn't she? 	Yes
q-and-a-2	N01202004	AFN3Y0	7		\N
q-and-a-2	N01202004	AFN3Y0	8	Who lived in Taoyuan?	Jeff
q-and-a-2	N01202004	AFN3Y0	9		\N
q-and-a-2	N01202004	AFN3Y0	10	Rene lived in HsinChu,didn't she?	Yes
q-and-a-2	N01202004	AFN3Y0	11	Rena lived in HsinChu,didn't she?	Yes
q-and-a-2	N01202004	AFN3Y0	12	Cindy liked playing the piano, didn't she?	Yes
q-and-a-2	N01202004	AFN3Y0	13	Jeff was born in 1994, didn't he?	--
q-and-a-2	N01202004	AFN3Y0	14	Jeff was born in 1994, didn't he?	Yes
q-and-a-2	N01202004	AFN3Y0	15	Rena liked cat, didn't she?	Yes
q-and-a-2	N01202004	AFN3Y0	16		\N
q-and-a-2	N01202004	AFN3Y0	17		\N
q-and-a-2	N01203003	AFN3Y0	1		\N
q-and-a-2	N01203003	AFN3Y0	2		\N
q-and-a-2	N01203003	AFN3Y0	3		\N
q-and-a-2	N01203003	AFN3Y0	4		\N
q-and-a-2	N01203003	AFN3Y0	5		\N
q-and-a-2	N01203003	AFN3Y0	6		\N
q-and-a-2	N01203003	AFN3Y0	7	Rena liked the color pink, didn't she?	Yes
q-and-a-2	N01203003	AFN3Y0	8		\N
q-and-a-2	N01203003	AFN3Y0	9	Rena liked Avril_Lavigne, didn't she?	Yes
q-and-a-2	N01203003	AFN3Y0	10	Jeff lived in Taoyuan, didn't he?	Yes
q-and-a-2	N01203003	AFN3Y0	11	Rena lived in Hshinchu, didn't she?	Yes
q-and-a-2	N01203003	AFN3Y0	12	Rena lived in Hsinchu, didn't she?	Yes
q-and-a-2	N01203003	AFN3Y0	13	Jeff studied in Minghsin_University , didn't he?	Yes
q-and-a-2	N00200055	AFN3Y0	1		\N
q-and-a-2	N00200055	AFN3Y0	2		\N
q-and-a-2	N00200055	AFN3Y0	3	Alex liked to drawing , didn't he?	Yes
q-and-a-2	N00200055	AFN3Y0	4	Was Vicky's mother a babysitter?	Yes
q-and-a-2	N00200055	AFN3Y0	5	Alex liked to drawing,didn't he?	Yes
q-and-a-2	N00200055	AFN3Y0	6	Alex liked to drawing,didn't he?	No
q-and-a-2	N00200055	AFN3Y0	7	Alex liked to drawing didn't he?	--
q-and-a-2	N00200055	AFN3Y0	8	Alex liked to drawing didn't he?	Yes
q-and-a-2	N00200055	AFN3Y0	9	Was Jeff liked to playing basketball didn't he?	Yes
q-and-a-2	N00200055	AFN3Y0	10	Rena liked listening to music didn't she?	Yes
q-and-a-2	N00200055	AFN3Y0	11	Was Rena liked listening to music?	Yes
q-and-a-2	N00200055	AFN3Y0	12	who liked listening to music?	Rena
q-and-a-2	N00200055	AFN3Y0	13	Who liked listening to music?	Alex
q-and-a-2	N00200055	AFN3Y0	14	Who was truck driver?	Jeff'S Father
q-and-a-2	N00200055	AFN3Y0	15	Who liked playing the piano?	Cindy
q-and-a-2	N00200055	AFN3Y0	16	who like playing the basketball	Jeff
q-and-a-2	N00200055	AFN3Y0	17	Who liked playing the basketball?	Jeff
q-and-a-2	N00200055	AFN3Y0	18	Was Rena liked to reading?	No
q-and-a-2	N00200055	AFN3Y0	19	Was Rena like to reading?	No
q-and-a-2	N00200055	AFN3Y0	20	Was Rena liked reading?	No
q-and-a-2	N00200055	AFN3Y0	21	Who lived in Hsinchu	Alex
q-and-a-2	N00200055	AFN3Y0	22	who was Rena liked? 	Avril Lavigne
q-and-a-2	N00200055	AFN3Y0	23	who liked travel?	Alex
q-and-a-2	N00200055	AFN3Y0	24	Who liked exercising?	Jeff
q-and-a-2	N00200055	AFN3Y0	25	Who liked exercising?	Alex
q-and-a-2	N00200055	AFN3Y0	26	Who liked exercising	Vicky
q-and-a-2	N00200055	AFN3Y0	27	what did Rena study in?	Applied Foreign Languages
q-and-a-3	N00200056	AFN3Y0	1		\N
q-and-a-3	N00200056	AFN3Y0	2	Who had a good father?	Dave
q-and-a-3	N00200036	AFN3Y0	1		\N
q-and-a-3	N00200036	AFN3Y0	2	Where is Dave hometown?	Hsinchu
q-and-a-3	N00200036	AFN3Y0	3	Where is Mindy  hometown?	Hsinchu
q-and-a-3	N00200036	AFN3Y0	4		\N
q-and-a-3	N00200036	AFN3Y0	5		\N
q-and-a-3	N00200017	AFN3Y0	1		\N
q-and-a-3	N00200036	AFN3Y0	6	Mindy  liked listening_to_music wasn't she ?	Yes
q-and-a-3	N00200017	AFN3Y0	2		\N
q-and-a-3	N00200036	AFN3Y0	7	Mindy liked listening_to_music,wasn't she?	Yes
q-and-a-3	N00200036	AFN3Y0	8	Mindy liked to listening to music wasn't she	Yes
q-and-a-3	N00200036	AFN3Y0	9	Mindy liked to listening to music wasn't she?	Yes
q-and-a-3	N00200017	AFN3Y0	3	Who studied in the Minghsin University?	Shane
q-and-a-3	N00200017	AFN3Y0	4		\N
q-and-a-3	N00200017	AFN3Y0	5		\N
q-and-a-3	N00200017	AFN3Y0	6		\N
q-and-a-3	N00200017	AFN3Y0	7	Is Neil lived in Nantou?	Yes
q-and-a-3	N00200017	AFN3Y0	8	Is Neil lived in Nantou?	Yes
q-and-a-3	N00200017	AFN3Y0	9	Dose Dave lived in Hsinchu	Yes
q-and-a-3	N00200017	AFN3Y0	10		\N
q-and-a-3	N00200017	AFN3Y0	11		\N
q-and-a-3	N00200017	AFN3Y0	12	What is Neil's job	The Military
q-and-a-3	N00200017	AFN3Y0	13		\N
q-and-a-3	N00200017	AFN3Y0	14	Does Neil likes jogging?	Yes
q-and-a-3	N00200017	AFN3Y0	15		\N
q-and-a-3	N00200017	AFN3Y0	16		\N
q-and-a-3	N00200017	AFN3Y0	17	 Neil is born in Nantou, isn't he?	No
q-and-a-3	N00200017	AFN3Y0	18		\N
q-and-a-3	N00200017	AFN3Y0	19		\N
q-and-a-3	N00200017	AFN3Y0	20	Is Neil born in Nantou?	Yes
q-and-a-3	N00200017	AFN3Y0	21	Is Shane likes jogging?	No
q-and-a-3	N00200043	AFN3Y0	1		\N
q-and-a-3	N00200043	AFN3Y0	2		\N
q-and-a-3	N00200043	AFN3Y0	3	where is Neil lived?	Nantou
q-and-a-3	N00200043	AFN3Y0	4	where is Neil lived in?	Nantou
q-and-a-3	N00200043	AFN3Y0	5	where did Neil lived?	Nantou
q-and-a-3	N00200043	AFN3Y0	6	Neil live in where?	Nantou
q-and-a-3	N00200043	AFN3Y0	7		\N
q-and-a-3	N00200030	AFN3Y0	1		\N
q-and-a-3	N00200030	AFN3Y0	2		\N
q-and-a-3	N00200043	AFN3Y0	8		\N
q-and-a-3	N00200043	AFN3Y0	9	Who likes to jogging?	Neil
q-and-a-3	N00200043	AFN3Y0	10	who like to jogging?	Neil
q-and-a-3	N00200043	AFN3Y0	11		\N
q-and-a-3	N00200008	AFN3Y0	1		\N
q-and-a-3	N00200008	AFN3Y0	2	Mindy liked the_song_memory, didn't she?	Yes
q-and-a-3	N00200008	AFN3Y0	3	Mindy liked pizza, didn't she?	Yes
q-and-a-3	N00200008	AFN3Y0	4	Mindy liked going to the movies, didn't she?	Yes
q-and-a-3	N00200008	AFN3Y0	5	Dave liked make friends, didn't he?	Yes
q-and-a-3	N00200008	AFN3Y0	6		--
q-and-a-3	N00200008	AFN3Y0	7		--
q-and-a-3	N00200008	AFN3Y0	8	Dave liked make friends, didn't he?	Yes
q-and-a-3	N00200008	AFN3Y0	9	Dave liked making_friends, didn't he?	Yes
q-and-a-3	N00200008	AFN3Y0	10	Dave had a brother, didn't he?	Yes
q-and-a-3	N00200008	AFN3Y0	11	Neil liked hello_kitty, didn't he?	No
q-and-a-3	N00200001	AFN3Y0	1		\N
q-and-a-3	N00200001	AFN3Y0	2	Was Mindy live in Hsinchu?	Yes
q-and-a-3	N00200001	AFN3Y0	3		\N
q-and-a-3	N00200001	AFN3Y0	4		\N
q-and-a-3	N00200001	AFN3Y0	5	Did Mindy live in Hsinchu?	Yes
q-and-a-3	N00200001	AFN3Y0	6	Did Dave have a sister?	No
q-and-a-3	N00200001	AFN3Y0	7	Was Neil's father a truck_driver?	No
q-and-a-3	N00200001	AFN3Y0	8	Was Mindy a_japanese_interpreter?	No
q-and-a-3	N00200001	AFN3Y0	9	Was Mindy a_japanese_interpreter?	No
q-and-a-3	N00200001	AFN3Y0	10	Was Kelly's mother a babysitter?	No
q-and-a-3	N00200001	AFN3Y0	11	Did Mindy born in America?	No
q-and-a-3	N00200001	AFN3Y0	12	Was Mindy born in America?	No
q-and-a-3	N00200034	AFN3Y0	1		\N
q-and-a-3	N00200034	AFN3Y0	2	Cindy liked playing_the_piano,wasn't she ?	Playing The Piano
q-and-a-3	N00200034	AFN3Y0	3		\N
q-and-a-3	N00200034	AFN3Y0	4	Cindy liked playing_the_piano, wasn't she ?	Yes
q-and-a-3	N00200034	AFN3Y0	5	Rena liked swimming,wasn't she ?	No
q-and-a-3	N00200034	AFN3Y0	6	Nei liked listening_to_music,didn't he ?	No
q-and-a-3	N00200034	AFN3Y0	7	Neil liked listening_to_music,was he ?'	No
q-and-a-3	N00200034	AFN3Y0	8	Neil liked listening_to_music,was he?	No
q-and-a-3	N00200034	AFN3Y0	9	Neil liked listening_to_music,wasn't he?	No
q-and-a-3	193001	AFN3Y0	1		\N
q-and-a-3	N00200008	AFN3Y0	12		\N
q-and-a-3	N00200008	AFN3Y0	13		\N
q-and-a-3	N00200008	AFN3Y0	14		\N
q-and-a-3	N00200056	AFN3Y0	3		\N
q-and-a-3	N00200056	AFN3Y0	4	Mindy was a student,wasn't she?	Yes
q-and-a-3	N00200056	AFN3Y0	5	was Mindy liked to going to the movies,didn't she?	No
q-and-a-3	N00200056	AFN3Y0	6	was Mindy liked to going to the movies?	No
q-and-a-3	N00200056	AFN3Y0	7	Did Kelly live in Hsinchu?	Yes
q-and-a-3	N00200056	AFN3Y0	8	Did Mindy have a brother?	Yes
q-and-a-3	N00200056	AFN3Y0	9	Was Neil born in Taiwan? 	Yes
q-and-a-3	N00200056	AFN3Y0	10	Did Shane liked exercising?	Yes
q-and-a-3	N00200056	AFN3Y0	11	Did Mindy live in Nantou?	No
q-and-a-3	N00200036	AFN3Y0	10		\N
q-and-a-3	N00200036	AFN3Y0	11		\N
q-and-a-3	N00200036	AFN3Y0	12	Did Dave liked cat?	No
q-and-a-3	N00200036	AFN3Y0	13	Did Dave have a brother?	Yes
q-and-a-3	N00200036	AFN3Y0	14	Did Mindy live in Taoyuan?	No
q-and-a-3	N00200036	AFN3Y0	15	Did Mindy have a sister?	No
q-and-a-3	N00200036	AFN3Y0	16	Was Dave's father a truck_driver?	No
q-and-a-3	N00200036	AFN3Y0	17	Dave liked pizza, didn't he?	No
q-and-a-3	N00200036	AFN3Y0	18	Did Neil have a sister?	No
q-and-a-3	N00200036	AFN3Y0	19	Did Neil have a sister?	Yes
q-and-a-3	N00200036	AFN3Y0	20	Did Shane live in Hsinchu?	Yes
q-and-a-3	N00200036	AFN3Y0	21	Did Shane live in Hsinchu?	No
q-and-a-2	193001	AFN3Y0	24		\N
q-and-a-3	N00200043	AFN3Y0	12		\N
q-and-a-3	N00200043	AFN3Y0	13	Did Shane live in Nantou? 	Hukou
q-and-a-3	N00200043	AFN3Y0	14	was Neil a truck_driver ?	Non-Commissioned Officer
q-and-a-3	N01203003	AFN3Y0	1		\N
q-and-a-3	N01203003	AFN3Y0	2	whose liked playing the basketball?	Shane
q-and-a-3	N01203003	AFN3Y0	3		\N
q-and-a-3	N01203003	AFN3Y0	4		\N
q-and-a-3	N01203003	AFN3Y0	5	Was Kelly's mother a babysitter?	No
q-and-a-3	N01203003	AFN3Y0	6	Did Shane live in Hsinchu?	Yes
q-and-a-3	N01203003	AFN3Y0	7	Did Shane liked play basketball?	Yes
q-and-a-3	N01203003	AFN3Y0	8	Did shane liked Hsiao_Ching-teng?	Yes
q-and-a-3	N01203003	AFN3Y0	9	Did Mindy liked Japanese?	Yes
q-and-a-3	N01203003	AFN3Y0	10	Did Mindy like Japanese?	Yes
q-and-a-3	N01203003	AFN3Y0	11	Did shane like Hsiao_Ching-teng?	Yes
q-and-a-3	N01203003	AFN3Y0	12		\N
q-and-a-3	N01203003	AFN3Y0	13		\N
q-and-a-3	N01203003	AFN3Y0	14	Did Mindy live in Nantou?	No
q-and-a-3	N01203003	AFN3Y0	15		\N
q-and-a-3	N01203003	AFN3Y0	16	Did shane live in Nantou?	No
q-and-a-3	N01203003	AFN3Y0	17		\N
q-and-a-3	N01203003	AFN3Y0	18		\N
q-and-a-3	N01203003	AFN3Y0	19	Did Mindy like Japanese?	Yes
q-and-a-3	N01203003	AFN3Y0	20		\N
q-and-a-3	N96200030	AFN3Y0	1		\N
q-and-a-3	N96200030	AFN3Y0	2	Did Neil live in Nantou?	Yes
q-and-a-3	N96200030	AFN3Y0	3	Did Neil live in Nantou?	No
q-and-a-3	N96200030	AFN3Y0	4		\N
q-and-a-3	N96200030	AFN3Y0	5		\N
q-and-a-3	N96200030	AFN3Y0	6		\N
q-and-a-3	N00200036	AFN3Y0	22		\N
q-and-a-3	N01203003	AFN3Y0	21		\N
q-and-a-3	N01203003	AFN3Y0	22		\N
q-and-a-3	N00200036	AFN3Y0	23	Did Shane live in Taoyuan?	No
q-and-a-3	N01203003	AFN3Y0	23	Did Rena have cat?	Yes
q-and-a-3	N01203003	AFN3Y0	24	Did Rena had mi_mi?	Yes
q-and-a-3	N01203003	AFN3Y0	25	Did Rena like hello_kitty ?	Yes
q-and-a-3	193001	AFN3Y0	2		\N
q-and-a-3	N00200043	AFN3Y0	15		\N
q-and-a-3	N00200043	AFN3Y0	16	Did Mindy live in Taoyuan? 	Hsinchu
q-and-a-3	N00200043	AFN3Y0	17	Did Neil like Japanese?	Jogging
q-and-a-3	N96200030	AFN3Y0	7		\N
q-and-a-3	N96200030	AFN3Y0	8	Did Dave like making_friends?	Yes
q-and-a-3	N96200030	AFN3Y0	9	Did Candy like playing_the_piano?	Yes
q-and-a-3	N96200030	AFN3Y0	10	Did Alex like listening_to_music?	Yes
q-and-a-3	N96200030	AFN3Y0	11		\N
q-and-a-3	N96200030	AFN3Y0	12		\N
q-and-a-3	N96200030	AFN3Y0	13	Did Alex liked listening_to_music?	Yes
q-and-a-3	N96200030	AFN3Y0	14	Did Alex live in Hsinchu?	Yes
q-and-a-3	N96200030	AFN3Y0	15	Did Vicky mother a babysitter?	Yes
q-and-a-3	N00200030	AFN3Y0	3		\N
q-and-a-3	N00200030	AFN3Y0	4	Jeff's mother was a career woman, wasn't she?	Yes
q-and-a-3	N00200030	AFN3Y0	5		--
q-and-a-3	N00200030	AFN3Y0	6	Mindy was born in Taoyuan, wasn't she?	No
q-and-a-3	N00200030	AFN3Y0	7		\N
q-and-a-3	N00200030	AFN3Y0	8	Was Vicky's mother a baby sister?	Yes
q-and-a-3	N00200030	AFN3Y0	9		\N
q-and-a-3	N00200030	AFN3Y0	10		\N
q-and-a-3	N00200030	AFN3Y0	11	Who was a student of Minghsin University?	Dave
q-and-a-3	N00200030	AFN3Y0	12		\N
q-and-a-3	N00200030	AFN3Y0	13		\N
q-and-a-3	N00200030	AFN3Y0	14	Was Shane a student of Minghsin University?	Yes
q-and-a-3	N00200030	AFN3Y0	15		\N
q-and-a-3	N00200030	AFN3Y0	16	Where was Neil from?	Nantou
q-and-a-3	N00200030	AFN3Y0	17	'Where did Neil live?	Nantou
q-and-a-3	N00200030	AFN3Y0	18	where did Neil live?	Nantou
q-and-a-3	N00200030	AFN3Y0	19		\N
q-and-a-3	N00200030	AFN3Y0	20		\N
q-and-a-3	N00200030	AFN3Y0	21	Mindy was born on April 30th, 1994, wasn't she?	No
q-and-a-3	N00200030	AFN3Y0	22	Shane lived in Jiayi, didn't he?	No
q-and-a-3	N00200030	AFN3Y0	23		\N
q-and-a-3	N00200030	AFN3Y0	24		\N
q-and-a-3	N00200030	AFN3Y0	25		\N
q-and-a-3	N00200030	AFN3Y0	26	Neil was a design assistant , wasn't he?	No
q-and-a-3	N00200030	AFN3Y0	27	Lextar was a  career woman, wasn't she?	No
q-and-a-3	N00200030	AFN3Y0	28	Vicky's mother was a babysitter, wasn't she?	Yes
q-and-a-3	N00200031	AFN3Y0	1		\N
q-and-a-3	N00200042	AFN3Y0	1		\N
q-and-a-3	N00200042	AFN3Y0	2		\N
q-and-a-3	N00200042	AFN3Y0	3	Was Kelly born in Taoyuan?	No
q-and-a-3	N00200031	AFN3Y0	2		\N
q-and-a-3	N00200042	AFN3Y0	4	Did Kelly like Japanese?	Yes
q-and-a-3	N00200042	AFN3Y0	5	Did Kelly liked playing the pino?	Yes
q-and-a-3	N00200042	AFN3Y0	6	Did Kelly liked playing the piano?	Yes
q-and-a-3	N00200042	AFN3Y0	7	Did Kelly like playing the piano?	Yes
q-and-a-3	N00200042	AFN3Y0	8	Did Kelly liked playing the piano?	Yes
q-and-a-3	N00200042	AFN3Y0	9		\N
q-and-a-3	N00200042	AFN3Y0	10	Did Shane live in Jiayi?	No
q-and-a-3	N00200042	AFN3Y0	11	Was Kelly live in Taoyuan?	No
q-and-a-3	193001	AFN3Y0	3		\N
q-and-a-3	N00200043	AFN3Y0	18		\N
q-and-a-3	N00200043	AFN3Y0	19		\N
q-and-a-3	N00200043	AFN3Y0	20	Did Shane like playing the piano?	No
q-and-a-3	N00200043	AFN3Y0	21	Did Kelly live in Jiayi?	No
q-and-a-3	N00200043	AFN3Y0	22	Did Kelly like playing the piano?	Yes
q-and-a-3	N00200043	AFN3Y0	23	Did Neil like playing the piano?	No
q-and-a-3	N00200043	AFN3Y0	24	Was Dave a student of Minghsin University?\t	Yes
q-and-a-3	N00200043	AFN3Y0	25	Did Shane like Jam Hsiao?	Yes
q-and-a-3	N00200043	AFN3Y0	26	Did Neil like jogging?	Yes
q-and-a-3	N00200043	AFN3Y0	27	Did Kelly like pizza?	No
q-and-a-3	N00200008	AFN3Y0	15		\N
q-and-a-3	N00200008	AFN3Y0	16		\N
q-and-a-3	N00200008	AFN3Y0	17		\N
q-and-a-3	N01202004	AFN3Y0	1		\N
q-and-a-3	N01202004	AFN3Y0	2		\N
q-and-a-3	N01202004	AFN3Y0	3	Where did Neil lived?	Nantou
q-and-a-3	N01202004	AFN3Y0	4	who lived in Nantou?	Neil
q-and-a-3	N01202004	AFN3Y0	5	who lived in Hsinchu?	Mindy
q-and-a-3	N01202004	AFN3Y0	6	who lived in Hukou?	Shane
q-and-a-3	N01202004	AFN3Y0	7		\N
q-and-a-3	N01202004	AFN3Y0	8	Neil lived in taipei, didn't he?	No
q-and-a-3	N01202004	AFN3Y0	9	Neil lived in Hukou, didn't he?	No
q-and-a-3	N01202004	AFN3Y0	10		\N
q-and-a-3	N01202004	AFN3Y0	11	who liked maked friend? 	Dave
q-and-a-3	N01202004	AFN3Y0	12	who was born in Nantou?	Neil
q-and-a-3	193001	AFN3Y0	4		\N
q-and-a-3	193001	AFN3Y0	5	Dave liked Japanese, didn't he?	No
q-and-a-3	193001	AFN3Y0	6		\N
q-and-a-3	193001	AFN3Y0	7	Who was the woman who was born in Hsinchu?	Kelly
q-and-a-3	193001	AFN3Y0	8		\N
q-and-a-3	193001	AFN3Y0	9	Was a woman who lived in Hsinchu a student in Minghsin University?	Yes
q-and-a-3	193001	AFN3Y0	10		\N
q-and-a-3	193001	AFN3Y0	11	Did a man who was born in Nantou like jogging?	Yes
q-and-a-3	193001	AFN3Y0	12		\N
q-and-a-3	N00200031	AFN3Y0	3		\N
q-and-a-3	193001	AFN3Y0	13	Was a man who had a sister in Minghsin University?	Yes
q-and-a-3	193001	AFN3Y0	14		\N
q-and-a-3	193001	AFN3Y0	15		\N
q-and-a-3	193001	AFN3Y0	16	Shane liked jogging, didn't he?	No
q-and-a-3	193001	AFN3Y0	17	Some man who was born in Nantou liked jogging, didn't he?	Yes
q-and-a-3	193001	AFN3Y0	18	Some men who were born in Nantou liked jogging, didn't they?	Yes
q-and-a-3	N00200029	AFN3Y0	1		\N
q-and-a-3	N00200029	AFN3Y0	2	Did a waman was born in Jiayi like to play piano ?	--
q-and-a-3	N00200029	AFN3Y0	3	'Did a waman who was born in Jiayi like to play piano 	--
q-and-a-3	N00200029	AFN3Y0	4		--
q-and-a-3	N00200029	AFN3Y0	5	'Did a waman was born in Hsinchu  like to listening to music ?	Mindy
q-and-a-3	N00200029	AFN3Y0	6	Was a waman who  born in Hsinchu like Japanese ?	Mindy
q-and-a-3	N00200029	AFN3Y0	7	who  lived  in Hsinchu like Japanese ?	Mindy
q-and-a-3	N00200029	AFN3Y0	8	Aux Shane who was a student had a sister ?	--
q-and-a-3	N00200025	AFN3Y0	1		\N
q-and-a-3	N00200008	AFN3Y0	18		\N
q-and-a-exam	193001	AFN3Y0	1		\N
q-and-a-exam	193001	AFN3Y0	2	Who were students?	Shane
q-and-a-exam	193001	AFN3Y0	3		\N
q-and-a-exam	193001	AFN3Y0	4	Where did Vicky work?	Drug Store
q-and-a-3	N96200030	AFN3Y0	16		\N
q-and-a-3	N00200037	AFN3Y0	1		\N
q-and-a-3	N00200037	AFN3Y0	2	Did Neil live in Nantou?	--
q-and-a-3	N00200037	AFN3Y0	3	Did Mindy have a cat?	--
q-and-a-3	N00200037	AFN3Y0	4	Did Mindy have cats?	--
q-and-a-3	N00200037	AFN3Y0	5	Did Mindy have cats?	--
q-and-a-3	N00200037	AFN3Y0	6	Did Mindy like hello_kitty?	--
q-and-a-3	N00200037	AFN3Y0	7	Did Dr_Bean live in Hsinchu?	--
q-and-a-3	N00200037	AFN3Y0	8	Did Dr_Bean live in Hsinchu?	No
q-and-a-3	N00200037	AFN3Y0	9	Did Mindy have a cat?	No
q-and-a-3	N00200037	AFN3Y0	10	Did Neil 's father a farmer?	No
q-and-a-exam	N00200001	AFN3Y0	1		\N
q-and-a-exam	N00200001	AFN3Y0	2		\N
q-and-a-exam	N00200042	AFN3Y0	1		\N
q-and-a-exam	N00200056	AFN3Y0	1		\N
q-and-a-exam	N00200001	AFN3Y0	3		\N
q-and-a-exam	N00200056	AFN3Y0	2		\N
q-and-a-exam	N00200029	AFN3Y0	1		\N
q-and-a-exam	N00200029	AFN3Y0	2		\N
q-and-a-exam	N00200017	AFN3Y0	1		\N
q-and-a-exam	N00200001	AFN3Y0	4	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200030	AFN3Y0	1		\N
q-and-a-exam	N00200009	AFN3Y0	1		\N
q-and-a-exam	N00200042	AFN3Y0	2		\N
q-and-a-exam	N00200031	AFN3Y0	1		\N
q-and-a-exam	N00200001	AFN3Y0	5	Mindy live in Hsinchu, didn't she?	Yes
q-and-a-exam	N00200054	AFN3Y0	1		\N
q-and-a-exam	N01202004	AFN3Y0	1		\N
q-and-a-exam	N00200030	AFN3Y0	2	Was Dave's sister a student?	No
q-and-a-exam	N00200017	AFN3Y0	2	Where is neli lived?	Nantou
q-and-a-exam	N00200030	AFN3Y0	3	Did a man who was born in Nantou like jogging?\t	Yes
q-and-a-exam	N00200056	AFN3Y0	3	did mindy born in Hsinchu?	Yes
q-and-a-exam	N00200001	AFN3Y0	6	Alex lived in Japanese,did'nt he?	No
q-and-a-exam	N01202001	AFN3Y0	1		\N
q-and-a-exam	N01202001	AFN3Y0	2		\N
q-and-a-exam	N00200008	AFN3Y0	1		\N
q-and-a-exam	N00200025	AFN3Y0	1		\N
q-and-a-exam	N00200025	AFN3Y0	2		\N
q-and-a-exam	N00200054	AFN3Y0	2	Neil was a design assistant , wasn't he?\t	Yes
q-and-a-exam	N00200025	AFN3Y0	3		\N
q-and-a-exam	N00200025	AFN3Y0	4		\N
q-and-a-exam	N01202001	AFN3Y0	3		\N
q-and-a-exam	N00200008	AFN3Y0	2		\N
q-and-a-exam	N01202001	AFN3Y0	4		\N
q-and-a-exam	N96200030	AFN3Y0	1		\N
q-and-a-exam	N00200030	AFN3Y0	4	Did a woman who was born in Jiayi county like to play the piano?	Yes
q-and-a-exam	N00200056	AFN3Y0	4	did mindy born in Hsinchu?	Yes
q-and-a-exam	N00200043	AFN3Y0	1		\N
q-and-a-exam	N01203003	AFN3Y0	1		\N
q-and-a-exam	N00200008	AFN3Y0	3		\N
q-and-a-exam	N00200025	AFN3Y0	5		\N
q-and-a-exam	N01202004	AFN3Y0	2	Jeff was born in Tayouan	Yes
q-and-a-exam	N01202001	AFN3Y0	5		\N
q-and-a-exam	N00200017	AFN3Y0	3	Who is Shane's most like singer	Hsiao Ching-Teng
q-and-a-exam	N00200030	AFN3Y0	5	Did a woman who was born in Jiayi county like to play the piano?	Yes
q-and-a-exam	N00200056	AFN3Y0	5		\N
q-and-a-exam	N01203003	AFN3Y0	2		\N
q-and-a-exam	N96200030	AFN3Y0	2		\N
q-and-a-exam	N00200031	AFN3Y0	2	Who born in Jiayi?	Cindy
q-and-a-exam	N00200001	AFN3Y0	7		\N
q-and-a-exam	N00200008	AFN3Y0	4		\N
q-and-a-exam	N00200009	AFN3Y0	2		\N
q-and-a-exam	N01202004	AFN3Y0	3	Jeff was born in Tayouan	Yes
q-and-a-exam	N00200009	AFN3Y0	3		\N
q-and-a-exam	N00200009	AFN3Y0	4	Did Mindy live in Hsinchu?\t	Yes
q-and-a-exam	N00200029	AFN3Y0	3	Who  lived in Nantou like jogging?	Neil
q-and-a-exam	N00200051	AFN3Y0	1		\N
q-and-a-exam	N00200056	AFN3Y0	6	what school is Mindy study?	Minghsin University
q-and-a-exam	N00200009	AFN3Y0	5	Did Dave have a sister?\t	No
q-and-a-exam	N00200054	AFN3Y0	3	Did Dave have a sister	No
q-and-a-exam	N00200030	AFN3Y0	6	Did Kelly live in Jiayi?\t	No
q-and-a-exam	N00200054	AFN3Y0	4	Did Dave have a sister？	No
q-and-a-exam	N00200029	AFN3Y0	4	Where did Neil  lived in?	Nantou
q-and-a-exam	N00200025	AFN3Y0	6		\N
q-and-a-exam	N00200025	AFN3Y0	7		\N
q-and-a-exam	N00200025	AFN3Y0	8		\N
q-and-a-exam	N96200030	AFN3Y0	3	Who is shane mose like singer	Hsiao Ching-Teng
q-and-a-exam	N00200001	AFN3Y0	8	Did Mindy lived in Hsinchu?	Yes
q-and-a-exam	N00200025	AFN3Y0	9		\N
q-and-a-exam	N01203003	AFN3Y0	3	Who is Shane's most like singer?	Hsiao Ching-Teng
q-and-a-exam	N00200054	AFN3Y0	5	Did Dave have a sister？	Yes
q-and-a-exam	N01202001	AFN3Y0	6		\N
q-and-a-exam	N01202004	AFN3Y0	4	Mindy was born in Hsinchu	Yes
q-and-a-exam	N00200001	AFN3Y0	9		\N
q-and-a-exam	N00200030	AFN3Y0	7	Did Shane like playing the piano?\t	No
q-and-a-exam	N00200009	AFN3Y0	6	Was Neil's father a truck_driver?	No
q-and-a-exam	N00200043	AFN3Y0	2		\N
q-and-a-exam	N01202004	AFN3Y0	5		\N
q-and-a-exam	N00200036	AFN3Y0	1		\N
q-and-a-exam	N00200008	AFN3Y0	5	Did Mindy live in Hsinchu?	Mindy
q-and-a-exam	N00200030	AFN3Y0	8	Was Shane a student of Minghsin University?\t	Yes
q-and-a-exam	N00200054	AFN3Y0	6	Did Kelly live in Hsinchu	Yes
q-and-a-exam	N01202001	AFN3Y0	7	Jeff was born in Tayoaun.	Yes
q-and-a-exam	N00200042	AFN3Y0	3		\N
q-and-a-exam	N01202004	AFN3Y0	6		\N
q-and-a-exam	N00200009	AFN3Y0	7	Was Kelly's mother a babysitter?	No
q-and-a-exam	N00200031	AFN3Y0	3		\N
q-and-a-exam	N00200025	AFN3Y0	10	DId Neil like jogging?	Yes
q-and-a-exam	N00200054	AFN3Y0	7	Did Dave have a brother	Yes
q-and-a-exam	N00200009	AFN3Y0	8	Was Mindy born in America?\t	No
q-and-a-exam	N00200001	AFN3Y0	10	Was Mindy live in Hsinchu, wasn't she?	--
q-and-a-exam	N01202004	AFN3Y0	7	Who liked the cat?	Rena
q-and-a-exam	N01202001	AFN3Y0	8	Jeff's father is a farmer.	No
q-and-a-exam	N00200051	AFN3Y0	2	Who liked hello_kitty?	Rena
q-and-a-exam	N00200056	AFN3Y0	7	Did a woman who was born in Hsinchu?	Mindy
q-and-a-exam	N00200031	AFN3Y0	4	Did Cindy born in Jiayi?	Yes
q-and-a-exam	N00200001	AFN3Y0	11	Was Mindy live in Hsinchu, wasn't she?	Yes
q-and-a-exam	N00200008	AFN3Y0	6	Who liked  cat?	Rena
q-and-a-exam	N00200054	AFN3Y0	8	Did Mindy live in Taoyuan	Yes
q-and-a-exam	N01202004	AFN3Y0	8	Who was born in Hsinchu?	Mindy
q-and-a-exam	N00200001	AFN3Y0	12		\N
q-and-a-exam	N01202001	AFN3Y0	9	Shane majors in English.	Yes
q-and-a-exam	N00200054	AFN3Y0	9	Did Mindy live in Taoyuan	No
q-and-a-exam	N00200009	AFN3Y0	9	Did Kelly live in Hsinchu?\t	Yes
q-and-a-exam	N00200025	AFN3Y0	11		\N
q-and-a-exam	N00200054	AFN3Y0	10	Did Neil have a sister	Yes
q-and-a-exam	N00200029	AFN3Y0	5	Was Hello Kitty Rena's favorite ,wasn't it?	--
q-and-a-exam	N00200001	AFN3Y0	13	Was Kelly's mother a babysitter?	Yes
q-and-a-exam	N00200042	AFN3Y0	4		\N
q-and-a-exam	N00200036	AFN3Y0	2		\N
q-and-a-exam	N00200054	AFN3Y0	11	was Neil a truck_driver	Yes
q-and-a-exam	N00200009	AFN3Y0	10	Did Mindy have a brother?	No
q-and-a-exam	N00200030	AFN3Y0	9	Was Mindy born in America?	No
q-and-a-exam	N00200008	AFN3Y0	7		\N
q-and-a-exam	N00200037	AFN3Y0	1		\N
q-and-a-exam	N00200054	AFN3Y0	12	was Neil a truck_driver	No
q-and-a-exam	N00200037	AFN3Y0	2		\N
q-and-a-exam	N00200037	AFN3Y0	3		\N
q-and-a-exam	N00200036	AFN3Y0	3	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200001	AFN3Y0	14	Was Kelly's mother a babysitter?	No
q-and-a-exam	N01202001	AFN3Y0	10	Cindy likes playing the piano.	Yes
q-and-a-exam	N96200030	AFN3Y0	4	Who likes to jogging?	Neil
q-and-a-exam	N00200030	AFN3Y0	10	Was Kelly's mother a babysitter?\t	No
q-and-a-exam	N01202004	AFN3Y0	9	who lived in Hukou?	Shane
q-and-a-exam	N00200054	AFN3Y0	13	Did Neil like Japanese	Yes
q-and-a-exam	N01203003	AFN3Y0	4	Who likes to jogging?	Neil
q-and-a-exam	N00200025	AFN3Y0	12	DId Kelly live in jiayi	No
q-and-a-exam	N00200054	AFN3Y0	14	Did Neil like Japanese	No
q-and-a-exam	N00200031	AFN3Y0	5	Cindy like to play the piano,aren't she?\t	Yes
q-and-a-exam	N00200030	AFN3Y0	11	Did Mindy live in Taoyuan?\t	No
q-and-a-exam	N00200008	AFN3Y0	8	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200043	AFN3Y0	3	was Alex's father a truck driver?	Dave'S Father
q-and-a-exam	N00200001	AFN3Y0	15	Was Mindy a_japanese_interpreter?	No
q-and-a-exam	N00200034	AFN3Y0	1		\N
q-and-a-exam	N00200009	AFN3Y0	11	Did Mindy live in Nantou?	No
q-and-a-exam	N00200030	AFN3Y0	12	Was Dave's father a truck driver?\t	No
q-and-a-exam	N00200056	AFN3Y0	8	who like the color pink?	Rena
q-and-a-exam	N00200001	AFN3Y0	16	Was Mindy born in America?	No
q-and-a-exam	N00200042	AFN3Y0	5	Did Mindy born in Jiayi?	No
q-and-a-exam	N00200055	AFN3Y0	1		\N
q-and-a-exam	N00200030	AFN3Y0	13	Was Jeff's father a truck driver?\t	Yes
q-and-a-exam	N00200037	AFN3Y0	4	Who was born in Hukou?	Dave
q-and-a-exam	N00200054	AFN3Y0	15	who lived in Hukou?	No
q-and-a-exam	N00200009	AFN3Y0	12	Did Dave have a brother?	Yes
q-and-a-exam	N00200008	AFN3Y0	9	Did Alex live in Hsinchu?	Yes
q-and-a-exam	N01202004	AFN3Y0	10	who was born in Taoyuan	Jeff
q-and-a-exam	N00200036	AFN3Y0	4	Did Mindy have a sister?\t	No
q-and-a-exam	N00200025	AFN3Y0	13	DId Shane live JIayi?	No
q-and-a-exam	N01202001	AFN3Y0	11	Cindy was born in Jiayi.	Yes
q-and-a-exam	N01203003	AFN3Y0	5	Who liked to jogging?	Neil
q-and-a-exam	N00200042	AFN3Y0	6	Did Cindy was born in Jiayi?	No
q-and-a-exam	N00200017	AFN3Y0	4	Where did Alex live?	Hsinchu
q-and-a-exam	N00200054	AFN3Y0	16	Did Mindy have a brother	No
q-and-a-exam	N00200029	AFN3Y0	6	Who liked jogging ?	Neil
q-and-a-exam	N00200030	AFN3Y0	14	Was Mindy's father a truck driver?\t	No
q-and-a-exam	N00200009	AFN3Y0	13	Did Mindy live in Taoyuan?	No
q-and-a-exam	N00200034	AFN3Y0	2	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200055	AFN3Y0	2		\N
q-and-a-exam	N00200042	AFN3Y0	7	Was Cindy born in Jiayi?	No
q-and-a-exam	N00200043	AFN3Y0	4		\N
q-and-a-exam	N96200030	AFN3Y0	5	Who liked jogging?	Neil
q-and-a-exam	N00200036	AFN3Y0	5	Did Neil have a sister?	No
q-and-a-exam	N00200017	AFN3Y0	5		\N
q-and-a-exam	N00200001	AFN3Y0	17	Was Mindy's father a truck_driver?	No
q-and-a-exam	N00200031	AFN3Y0	6		\N
q-and-a-exam	N01203003	AFN3Y0	6	Who liked jogging?	Neil
q-and-a-exam	N00200017	AFN3Y0	6		\N
q-and-a-exam	N00200054	AFN3Y0	17	Did Mindy have a sister	No
q-and-a-exam	N00200030	AFN3Y0	15	Was Neil's father a truck_driver?\t	No
q-and-a-exam	N00200025	AFN3Y0	14	DId Kelly like japanese?	Yes
q-and-a-exam	N01202004	AFN3Y0	11	what is the Rena liked?	Hello Kitty
q-and-a-exam	N00200055	AFN3Y0	3	Did Neil like jogging?	Yes
q-and-a-exam	N00200009	AFN3Y0	14	Did Mindy have a sister?\t	No
q-and-a-exam	N00200036	AFN3Y0	6	Did Neil have a sister?	Yes
q-and-a-exam	N00200054	AFN3Y0	18	Did Mindy have a sister	Yes
q-and-a-exam	N00200030	AFN3Y0	16	Was Vicky's father a truck_driver?\t	No
q-and-a-exam	N00200001	AFN3Y0	18	Was Neil's father a truck_driver?	No
q-and-a-exam	N00200054	AFN3Y0	19	Did Neil have a sister	No
q-and-a-exam	N00200037	AFN3Y0	5	Who had a cat?	Rena
q-and-a-exam	N01202001	AFN3Y0	12	Alex was born on April 1994.	No
q-and-a-exam	N00200017	AFN3Y0	7	Did Neil born in Nantou	Yes
q-and-a-exam	N00200042	AFN3Y0	8	Did Cindy live in Hsinchu?	No
q-and-a-exam	N00200055	AFN3Y0	4	Did Kelly like pizza?	No
q-and-a-exam	N00200009	AFN3Y0	15	Was Dave's father a truck_driver?\t	Yes
q-and-a-exam	N00200051	AFN3Y0	3	Who had a cat?	Rena
q-and-a-exam	N00200030	AFN3Y0	17	Was Cindy's father a truck_driver?\t	No
q-and-a-exam	N00200017	AFN3Y0	8	Did Neil born in Nantou?	Yes
q-and-a-exam	N00200054	AFN3Y0	20	Did shane like Hsiao	Yes
q-and-a-exam	N00200025	AFN3Y0	15	Did Shane like playing the piano?	No
q-and-a-exam	N00200056	AFN3Y0	9	who was a student?	Mindy
q-and-a-exam	N00200036	AFN3Y0	7	Did shane like Hsiao_Ching-teng?	Yes
q-and-a-exam	N00200054	AFN3Y0	21	Did shane like Hsiao	No
q-and-a-exam	N00200043	AFN3Y0	5	Did Alex like jogging?	No
q-and-a-exam	N01202004	AFN3Y0	12	who was born in Jiayi?	Cindy
q-and-a-exam	N00200009	AFN3Y0	16	Did Neil have a sister?\t	Yes
q-and-a-exam	N00200055	AFN3Y0	5	Did Shane live in Jiayi?	Yes
q-and-a-exam	N00200001	AFN3Y0	19	Neil's father was a truck_driver?	No
q-and-a-exam	N00200054	AFN3Y0	22	Did Kelly like pizza?	Yes
q-and-a-exam	N00200043	AFN3Y0	6		\N
q-and-a-exam	N00200008	AFN3Y0	10	Was Alex a student in Minghsin University?	Yes
q-and-a-exam	N00200034	AFN3Y0	3		\N
q-and-a-exam	N00200009	AFN3Y0	17	Did Neil like jog?\t	Yes
q-and-a-exam	N01202001	AFN3Y0	13	Jeff was born in Tayoaun.	Yes
q-and-a-exam	N00200054	AFN3Y0	23	Did Kelly like pizza?	No
q-and-a-exam	N01202001	AFN3Y0	14		\N
q-and-a-exam	N00200034	AFN3Y0	4		\N
q-and-a-exam	N00200030	AFN3Y0	18	Was Lextar's father a truck driver?\t	No
q-and-a-exam	N01202001	AFN3Y0	15		\N
q-and-a-exam	N00200036	AFN3Y0	8	Did Kelly like pizza	No
q-and-a-exam	N00200055	AFN3Y0	6	Did Kelly live in Jiayi?	No
q-and-a-exam	N00200017	AFN3Y0	9	Was Dave a student in Minghsin University	Yes
q-and-a-exam	N00200054	AFN3Y0	24	Was a woman who lived in Hsinchu a student in Minghsin University?\t	Yes
q-and-a-exam	N00200025	AFN3Y0	16	Diid Neil like playing the piano?	No
q-and-a-exam	N00200029	AFN3Y0	7	Did Cindy liked reading?	--
q-and-a-exam	N00200009	AFN3Y0	18	\tDid Shane live in Hsinchu?	Yes
q-and-a-exam	N00200055	AFN3Y0	7		\N
q-and-a-exam	N00200034	AFN3Y0	5		\N
q-and-a-exam	N00200042	AFN3Y0	9	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200055	AFN3Y0	8		\N
q-and-a-exam	N00200054	AFN3Y0	25	Did a man who was born in Nantou like jogging?\t	Yes
q-and-a-exam	N00200056	AFN3Y0	10	who was a teacher?	Dr Bean
q-and-a-exam	N00200036	AFN3Y0	9	Did Mindy like pizza?\t	Yes
q-and-a-exam	N00200055	AFN3Y0	9	Did Neil like Japanese?	No
q-and-a-exam	N00200051	AFN3Y0	4	What was Rena's cat name?	Mi Mi
q-and-a-exam	N00200055	AFN3Y0	10		\N
q-and-a-exam	N00200001	AFN3Y0	20	was Mindy a student ?	Yes
q-and-a-exam	N00200030	AFN3Y0	19	Was Rena's father a truck driver?\t	No
q-and-a-exam	N00200054	AFN3Y0	26	Did a man who was born in Nantou like jogging?\t	No
q-and-a-exam	N00200017	AFN3Y0	10	Was Dave's father a truck_driver	No
q-and-a-exam	N01202001	AFN3Y0	16	Who live in Hsinchu?	Kelly
q-and-a-exam	N00200008	AFN3Y0	11		\N
q-and-a-exam	N00200009	AFN3Y0	19	Did Dave like making_friends?	Yes
q-and-a-exam	N00200031	AFN3Y0	7	Some man who was born in Nantou liking jogging,didn't he?	Yes
q-and-a-exam	N01203003	AFN3Y0	7	Who lived in Hukou?	Shane
q-and-a-exam	N01202004	AFN3Y0	13	who lived in Nantou?	Neil
q-and-a-exam	N00200055	AFN3Y0	11	Did Mindy have sister	No
q-and-a-exam	N00200037	AFN3Y0	6	Who liked hello_kitty?	--
q-and-a-exam	N00200055	AFN3Y0	12	Did Shane like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	6		\N
q-and-a-exam	N00200037	AFN3Y0	7	Who liked hello_kitty?	Rena
q-and-a-exam	N00200054	AFN3Y0	27	Was a man who had a sister in Minghsin University?	Yes
q-and-a-exam	N00200030	AFN3Y0	20	Was Jeff born in America?	No
q-and-a-exam	N00200009	AFN3Y0	20	Shane lived in Jiayi, didn't he?	--
q-and-a-exam	N00200042	AFN3Y0	10		\N
q-and-a-exam	N00200001	AFN3Y0	21	Cindy liked playing_the_piano 	Yes
q-and-a-exam	N00200034	AFN3Y0	7	Did a man who was born in Nantou like jogging?	Yes
q-and-a-exam	N00200055	AFN3Y0	13	Did Mindy fave a sister	No
q-and-a-exam	N00200009	AFN3Y0	21	Shane lived in Jiayi, didn't he?	No
q-and-a-exam	N01202004	AFN3Y0	14		\N
q-and-a-exam	N00200036	AFN3Y0	10	Did Dave like jogging?	No
q-and-a-exam	N00200054	AFN3Y0	28	Shane liked jogging, didn't he?\t	No
q-and-a-exam	N00200055	AFN3Y0	14	Did Neil like playing the piano?	No
q-and-a-exam	N00200030	AFN3Y0	21	Was Cindy born in America?	No
q-and-a-exam	N00200054	AFN3Y0	29	Shane liked jogging, didn't he?\t	Yes
q-and-a-exam	N00200031	AFN3Y0	8	Some man who was born in Nantou like jogging,wasn't he?	Yes
q-and-a-exam	N01202001	AFN3Y0	17	Who lives in Hukou?	Shane
q-and-a-exam	N00200025	AFN3Y0	17	DId Dave like like making-friends?	Yes
q-and-a-exam	N00200017	AFN3Y0	11	Did Dave have a cat?	No
q-and-a-exam	N00200030	AFN3Y0	22	Was Rena born in America?	No
q-and-a-exam	N00200054	AFN3Y0	30	Some man who was born in Nantou liked jogging, didn't he?\t	Yes
q-and-a-exam	N01202004	AFN3Y0	15	Shane liked Jeremy_Lin 	Yes
q-and-a-exam	N00200037	AFN3Y0	8		\N
q-and-a-exam	N00200009	AFN3Y0	22	Did Kelly like Japanese?\t	Yes
q-and-a-exam	N00200054	AFN3Y0	31	Some man who was born in Nantou liked jogging, didn't he?\t	No
q-and-a-exam	N00200001	AFN3Y0	22	was cindy playing_the_piano ?	Yes
q-and-a-exam	N00200042	AFN3Y0	11	Who was a student?	Alex
q-and-a-exam	N00200030	AFN3Y0	23	Was Alex born in America?	No
q-and-a-exam	N00200055	AFN3Y0	15	Was Kelly's mother a baby sister?	No
q-and-a-exam	N00200036	AFN3Y0	11	Did Mindy like jogging?	No
q-and-a-exam	N00200055	AFN3Y0	16	Did Neil live in Nantou	Yes
q-and-a-exam	N00200008	AFN3Y0	12	Who liked to travel?	Alex
q-and-a-exam	N00200054	AFN3Y0	32	Some men who were born in Nantou liked jogging, didn't they?	Yes
q-and-a-exam	N00200054	AFN3Y0	33	Some men who were born in Nantou liked jogging, didn't they?	--
q-and-a-exam	N00200056	AFN3Y0	11	who likes basketball	Shane
q-and-a-exam	N01202004	AFN3Y0	16	Shane liked Jeremy_Lin , didn't he?	Yes
q-and-a-exam	N01202001	AFN3Y0	18	Who likes playing the piano?	Cindy
q-and-a-exam	N00200055	AFN3Y0	17	Did Mindy have a sister?	No
q-and-a-exam	N00200030	AFN3Y0	24	Was Lextar born in America?	No
q-and-a-exam	N00200051	AFN3Y0	5	Who lived in Hsinchu?	Vicky
q-and-a-exam	N00200025	AFN3Y0	18	DId MIndy like Japanese?	Yes
q-and-a-exam	N00200055	AFN3Y0	18	Did Shane like Jeremy Lin?	Yes
q-and-a-exam	N00200009	AFN3Y0	23	Did Kelly like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	8	Did Rena like playing the piano?	No
q-and-a-exam	N00200054	AFN3Y0	34	Was Neil's father a truck_driver?\t	Yes
q-and-a-exam	N01202004	AFN3Y0	17		\N
q-and-a-exam	N00200017	AFN3Y0	12	Did Shane like playing the piano?	No
q-and-a-exam	N01202004	AFN3Y0	18		\N
q-and-a-exam	N01202004	AFN3Y0	19		\N
q-and-a-exam	N00200001	AFN3Y0	23	was cindy playing_the_piano?	Yes
q-and-a-exam	N00200030	AFN3Y0	25	Was Kelly born in America?	No
q-and-a-exam	N00200031	AFN3Y0	9	Was Cindy born in Europe?\t	No
q-and-a-exam	N00200029	AFN3Y0	8	Did Cindy liked reading?	--
q-and-a-exam	N00200009	AFN3Y0	24	Did Shane like playing the piano?\t	No
q-and-a-exam	N00200054	AFN3Y0	35	Was Kelly's mother a babysitter?\t	Yes
q-and-a-exam	N00200037	AFN3Y0	9	Did Neil born in Nantou?	Yes
q-and-a-exam	N00200051	AFN3Y0	6	Who lived in Hsinchu?	Alex
q-and-a-exam	N00200008	AFN3Y0	13	Who liked travel?	Alex
q-and-a-exam	N00200055	AFN3Y0	19	Did Dave have a brother?	Yes
q-and-a-exam	N00200055	AFN3Y0	20	Did Neil like pet?	No
q-and-a-exam	N01203003	AFN3Y0	8	Who is liked sports?	Neil
q-and-a-exam	N00200036	AFN3Y0	12	Did Mindy live in Jiayi?	No
q-and-a-exam	N00200029	AFN3Y0	9	Was Dr_Bean a farmer ,was he ?	--
q-and-a-exam	N00200051	AFN3Y0	7		\N
q-and-a-exam	N00200051	AFN3Y0	8		\N
q-and-a-exam	N00200030	AFN3Y0	26	Was Dave born in America?	No
q-and-a-exam	N00200051	AFN3Y0	9		\N
q-and-a-exam	N01202004	AFN3Y0	20		\N
q-and-a-exam	N00200051	AFN3Y0	10		\N
q-and-a-exam	N00200054	AFN3Y0	36	Was Mindy born in America?\t	No
q-and-a-exam	N00200051	AFN3Y0	11		\N
q-and-a-exam	N00200017	AFN3Y0	13	Did Dave like Jeremy Lin?	No
q-and-a-exam	N96200030	AFN3Y0	6	Who have cat mi_mi?	Rena
q-and-a-exam	N00200036	AFN3Y0	13	Did Dave live in Jiayi?	No
q-and-a-exam	N00200055	AFN3Y0	21	Did Mindy have a brother?	Yes
q-and-a-exam	N00200030	AFN3Y0	27	Was Shane born in America?	No
q-and-a-exam	N00200034	AFN3Y0	9	Did Jeff live in Jiayi?	No
q-and-a-exam	N00200025	AFN3Y0	19	Did shane live in Taoyuan?	No
q-and-a-exam	N00200042	AFN3Y0	12	Who liked playing the piano?	Cindy
q-and-a-exam	N00200031	AFN3Y0	10	Was Cindy born in Taoyuan?\t	No
q-and-a-exam	N00200036	AFN3Y0	14	Did Shane live in Jiayi?	No
q-and-a-exam	N00200051	AFN3Y0	12		\N
q-and-a-exam	N00200055	AFN3Y0	22	Did Shane have a sister?	Yes
q-and-a-exam	N00200001	AFN3Y0	24	Mindy had a sister?	No
q-and-a-exam	N00200030	AFN3Y0	28	Was Jeremy Lin born in America?	Yes
q-and-a-exam	N00200055	AFN3Y0	23	Did Kelly live in Hsinchu?	Yes
q-and-a-exam	N00200054	AFN3Y0	37	Was Dave's father a truck_driver?\t	No
q-and-a-exam	N01202004	AFN3Y0	21	Did shane like cat 	No
q-and-a-exam	N00200008	AFN3Y0	14	Who had a cat?	Rena
q-and-a-exam	N00200051	AFN3Y0	13	Did Rena have a cat?	Yes
q-and-a-exam	N01202004	AFN3Y0	22		\N
q-and-a-exam	N00200001	AFN3Y0	25	Did Dave have a sister?	No
q-and-a-exam	N00200017	AFN3Y0	14	Did Alex like Hsiao_Ching-teng ?	No
q-and-a-exam	N00200025	AFN3Y0	20	Did shane live in Hsinchu?	Yes
q-and-a-exam	N00200055	AFN3Y0	24	Did Mindy have a sister?	No
q-and-a-exam	N96200030	AFN3Y0	7	Who had cat mi_mi?	Rena
q-and-a-exam	N00200043	AFN3Y0	7	Did Alex like pizza	No
q-and-a-exam	N00200055	AFN3Y0	25	Did Mindy live in Taoyuan?	No
q-and-a-exam	N00200017	AFN3Y0	15		\N
q-and-a-exam	N00200008	AFN3Y0	15	Who had a cat of name was MiMi?	Rena
q-and-a-exam	N00200051	AFN3Y0	14	Did Mindy like listen to music?	Yes
q-and-a-exam	N00200008	AFN3Y0	16	Who had a cat of name was MiMi?	Rena
q-and-a-exam	N00200029	AFN3Y0	10	Did Mindy exercising every weekend ?	--
q-and-a-exam	N00200001	AFN3Y0	26	Did Mindy had a brother	Yes
q-and-a-exam	N00200056	AFN3Y0	12	who like Japanese	Mindy
q-and-a-exam	N00200037	AFN3Y0	10	Did Dave studied in Minghsin_University?	Yes
q-and-a-exam	N00200055	AFN3Y0	26	Did Neil have a sister?	Yes
q-and-a-exam	N01202004	AFN3Y0	23		\N
q-and-a-exam	N00200025	AFN3Y0	21	Did mindy have a brother?	Yes
q-and-a-exam	N00200055	AFN3Y0	27	Did Alex have a sister?	No
q-and-a-exam	N01202004	AFN3Y0	24		\N
q-and-a-exam	N00200009	AFN3Y0	25	Did Kelly like playing the piano?	No
q-and-a-exam	N01203003	AFN3Y0	9		\N
q-and-a-exam	N96200030	AFN3Y0	8		\N
q-and-a-exam	N00200036	AFN3Y0	15	Did Mindy like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	10	Did a girl who was born in Nantou like jogging?	No
q-and-a-exam	N00200001	AFN3Y0	27	Did Mindy had a brother?	Yes
q-and-a-exam	N00200030	AFN3Y0	29	Was Jeff a student in Minghsin University.	Yes
q-and-a-exam	N00200009	AFN3Y0	26	Did Shane like pizza?\t	No
q-and-a-exam	N00200055	AFN3Y0	28	Did Shane live in Hsinchu?	Yes
q-and-a-exam	N00200036	AFN3Y0	16	Did Dave like playing the piano?	No
q-and-a-exam	N00200030	AFN3Y0	30	Was Shane a student in Minghsin University.	Yes
q-and-a-exam	N00200056	AFN3Y0	13	who likes Japanese	Mindy
q-and-a-exam	N00200031	AFN3Y0	11	Who born in Jiayi?	Cindy
q-and-a-exam	N00200051	AFN3Y0	15	Did Mindy like listening to music?	Yes
q-and-a-exam	N00200025	AFN3Y0	22	Did mindy live in Nantou?	No
q-and-a-exam	N00200017	AFN3Y0	16	Shane likes Hsiao_Ching-teng , doesn't he?	Yes
q-and-a-exam	N00200054	AFN3Y0	38	Did shane like Hsiao_Ching-teng?\t	Yes
q-and-a-exam	N00200055	AFN3Y0	29	Did Neil have a brother	Yes
q-and-a-exam	N01202004	AFN3Y0	25	who have two siblings?	Jeff
q-and-a-exam	N00200036	AFN3Y0	17	Did Shane like playing the piano?	No
q-and-a-exam	N00200054	AFN3Y0	39	Did shane like Hsiao_Ching-teng?\t	--
q-and-a-exam	N00200009	AFN3Y0	27	Did Kelly like pizza?\t	No
q-and-a-exam	N01203003	AFN3Y0	10	Did Jeff live in Taoyuan?	Yes
q-and-a-exam	N00200055	AFN3Y0	30	Was Mindy born in America?	No
q-and-a-exam	N00200030	AFN3Y0	31	Was Rena a student in Minghsin University.	Yes
q-and-a-exam	N00200034	AFN3Y0	11	Did Neil like Japanese?	No
q-and-a-exam	N00200054	AFN3Y0	40	Did shane like Hsiao_Ching-teng?\t	No
q-and-a-exam	N00200051	AFN3Y0	16	Did Alex live in Hsinchu?	Yes
q-and-a-exam	N00200037	AFN3Y0	11	Did Dr_Bean born in America?	No
q-and-a-exam	N00200025	AFN3Y0	23	Did shane live in Nantou?	No
q-and-a-exam	N00200056	AFN3Y0	14	Did a woman who was born in Hsinchu?	Mindy
q-and-a-exam	N00200056	AFN3Y0	15	what school is Mindy study?	Minghsin University
q-and-a-exam	N00200009	AFN3Y0	28	Did Dave like playing the piano?\t	No
q-and-a-exam	N00200008	AFN3Y0	17	Who has cat?	Rena
q-and-a-exam	N00200055	AFN3Y0	31	Was Neil a truck driver?	No
q-and-a-exam	N00200054	AFN3Y0	41	Did Shane live in Taoyuan?\t	Yes
q-and-a-exam	N00200031	AFN3Y0	12	Who liked play the piano?\t	Cindy
q-and-a-exam	N00200034	AFN3Y0	12	Did Mindy like Japanese?	--
q-and-a-exam	N00200030	AFN3Y0	32	Was Lextar a student in Minghsin University?	Yes
q-and-a-exam	N96200030	AFN3Y0	9	Neil liked jogging?	Yes
q-and-a-exam	N00200042	AFN3Y0	13	Who liked study Japanese?	Mindy
q-and-a-exam	N01202004	AFN3Y0	26	who likes drawing?	Alex
q-and-a-exam	N00200029	AFN3Y0	11	Was Cindy liked listening to music , wasn't she ?	--
q-and-a-exam	N00200036	AFN3Y0	18	Did Dave like pizza?	No
q-and-a-exam	N00200009	AFN3Y0	29	Did Cindy like playing the piano?\t	No
q-and-a-exam	N00200001	AFN3Y0	28	didn't Mindy like playing_the_piano?	No
q-and-a-exam	N00200034	AFN3Y0	13	Did Mindy like Japanese?	No
q-and-a-exam	N00200054	AFN3Y0	42	Mindy was born in Taoyuan, wasn't she?\t	No
q-and-a-exam	N00200056	AFN3Y0	16		\N
q-and-a-exam	N00200030	AFN3Y0	33	Was Neil a student in Minghsin University?	Yes
q-and-a-exam	N00200042	AFN3Y0	14	Who liked studing Japanese?	Mindy
q-and-a-exam	N00200036	AFN3Y0	19	Did Shane like pizza?	No
q-and-a-exam	N00200025	AFN3Y0	24	Did neil like Japanese?	No
q-and-a-exam	N00200030	AFN3Y0	34	Was Cindy a student in Minghsin University?	Yes
q-and-a-exam	N00200017	AFN3Y0	17	Dave liked jogging,didn't he	No
q-and-a-exam	N00200051	AFN3Y0	17	Did Rena want to work in America?	Yes
q-and-a-exam	N00200009	AFN3Y0	30	Was Dave born in America	--
q-and-a-exam	N00200036	AFN3Y0	20	Did Neil like pizza?	No
q-and-a-exam	N00200001	AFN3Y0	29	didn't Mindy's father a truck driver?	No
q-and-a-exam	N00200009	AFN3Y0	31	Was Dave born in America	No
q-and-a-exam	N01202004	AFN3Y0	27	who likes playing basketball?	Shane
q-and-a-exam	N00200054	AFN3Y0	43	Mindy was born in Taoyuan, wasn't she?\t	Yes
q-and-a-exam	N00200037	AFN3Y0	12	Did Rena like cat?	Yes
q-and-a-exam	N00200036	AFN3Y0	21	Did Rena like pizza?	--
q-and-a-exam	N00200056	AFN3Y0	17	was Dr_Bean a student	No
q-and-a-exam	N00200030	AFN3Y0	35	Was Alex a student in Minghsin University.	Yes
q-and-a-exam	N00200017	AFN3Y0	18	Alex lived in Jiayi, didn't he? 	No
q-and-a-exam	N00200042	AFN3Y0	15	who like Japanese?	Mindy
q-and-a-exam	N00200036	AFN3Y0	22	Did Rena like pizza?	No
q-and-a-exam	N00200009	AFN3Y0	32	Was Mindy born in Japen	--
q-and-a-exam	N00200008	AFN3Y0	18	Who liked a japanese?	Mindy
q-and-a-exam	N00200051	AFN3Y0	18	Did Vicky live in Hsinchu?	No
q-and-a-exam	N00200054	AFN3Y0	44	Neil was a design assistant , wasn't he?\t	Yes
q-and-a-exam	N00200030	AFN3Y0	36	Was Kelly a student in Minghsin University.	Yes
q-and-a-exam	N00200025	AFN3Y0	25	Did kelly live in Hsinchu?	Yes
q-and-a-exam	N00200056	AFN3Y0	18	was Dr_Bean a teacher	Yes
q-and-a-exam	N00200034	AFN3Y0	14	Did Neil live in Hsinchu?	No
q-and-a-exam	N00200042	AFN3Y0	16	who like English?	Cindy
q-and-a-exam	N01203003	AFN3Y0	11	Did Mindy live in Hsinchu?	Yes
q-and-a-exam	N00200017	AFN3Y0	19	Did Alex like japanese	No
q-and-a-exam	N00200029	AFN3Y0	12	Who liked drawing ?	--
q-and-a-exam	N01202004	AFN3Y0	28	who liked read novies?	Cindy
q-and-a-exam	N00200054	AFN3Y0	45	Did Shane live in Jiayi?	Yes
q-and-a-exam	N00200001	AFN3Y0	30	didn't Mindy had a cat?	No
q-and-a-exam	N00200030	AFN3Y0	37	Was Vicky a student in Minghsin University?	Yes
q-and-a-exam	N00200009	AFN3Y0	33	Was Cindy's father a truck_driver?\t	No
q-and-a-exam	N00200056	AFN3Y0	19	was Mindy a teacher	No
q-and-a-exam	N00200037	AFN3Y0	13	Was Dave studied in Minghsin_University?	Yes
q-and-a-exam	N00200051	AFN3Y0	19	Did Vicky like hello kitty?	No
q-and-a-exam	N00200031	AFN3Y0	13	Who was a babysitter?\t	Vicky'S Mother
q-and-a-exam	N00200025	AFN3Y0	26	Did dave have a sister?	No
q-and-a-exam	N00200025	AFN3Y0	27	Did dave have a sister?	No
q-and-a-exam	N00200056	AFN3Y0	20	was Mindy a student	Yes
q-and-a-exam	N00200017	AFN3Y0	20	Dave liked travel,didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	19	Who liked japanese?	Mindy
q-and-a-exam	N96200030	AFN3Y0	10	Vicky have truck_drive father?	Yes
q-and-a-exam	N00200036	AFN3Y0	23	Did Mindy like Japanese?\t	Yes
q-and-a-exam	N01202004	AFN3Y0	29	who worked in lestar?	Kelly
q-and-a-exam	N00200034	AFN3Y0	15	Did Kelly like playing the piano?	No
q-and-a-exam	N00200030	AFN3Y0	38	Was Jeremy Lin a student in Minghsin University?	No
q-and-a-exam	N00200036	AFN3Y0	24	Did Rena like Japanese?\t	No
q-and-a-exam	N00200001	AFN3Y0	31	Did Dave's mother a babysister?	No
q-and-a-exam	N00200029	AFN3Y0	13	Where did Cindy lived?	--
q-and-a-exam	N00200025	AFN3Y0	28	DId neil have a brother?	Yes
q-and-a-exam	N00200009	AFN3Y0	34	Did Dave like cat?	No
q-and-a-exam	N00200056	AFN3Y0	21	was Rena a student	Yes
q-and-a-exam	N01203003	AFN3Y0	12	Was Neil a truck driver?	No
q-and-a-exam	N00200036	AFN3Y0	25	Did Neil like Japanese?\t	No
q-and-a-exam	N00200037	AFN3Y0	14	Did Rena like pizza ?	No
q-and-a-exam	N00200008	AFN3Y0	20	Who liked the color pink	Rena
q-and-a-exam	N00200056	AFN3Y0	22	was Rena a teacher	No
q-and-a-exam	N00200037	AFN3Y0	15	Did Dave studied in Minghsin_University ?	Yes
q-and-a-exam	N00200034	AFN3Y0	16	Did Rena like playing the piano?	No
q-and-a-exam	N00200031	AFN3Y0	14	Did Shane like playing the piano?\t	No
q-and-a-exam	N00200036	AFN3Y0	26	Did Dave like Japanese?\t	No
q-and-a-exam	N00200017	AFN3Y0	21	Dave liked travel, didn't he?	No
q-and-a-exam	N00200030	AFN3Y0	39	Did Neil live in Hsinchu?\t	No
q-and-a-exam	N00200051	AFN3Y0	20	Did Alex want to work in America?	No
q-and-a-exam	N00200037	AFN3Y0	16	Did Dr_Bean born in America ?	No
q-and-a-exam	N01202004	AFN3Y0	30	who liked to go swimming?	Neil
q-and-a-exam	N00200030	AFN3Y0	40	Did Dave live in Hsinchu?\t	Yes
q-and-a-exam	N00200025	AFN3Y0	29	DId dave have a birthday?	Yes
q-and-a-exam	N00200056	AFN3Y0	23	was Alex a student	Yes
q-and-a-exam	N00200030	AFN3Y0	41	Did Cindy live in Hsinchu?\t	No
q-and-a-exam	N00200043	AFN3Y0	8	was cindy's father a truck driver? wasn't she?	--
q-and-a-exam	N00200001	AFN3Y0	32	Wasn't Neil like music?	No
q-and-a-exam	N01202004	AFN3Y0	31		\N
q-and-a-exam	N01203003	AFN3Y0	13	Jeff lived in Taoyuan, didn't him?	Yes
q-and-a-exam	N00200017	AFN3Y0	22	Did Alex has a sister?	No
q-and-a-exam	N00200025	AFN3Y0	30	Did mindy have a sister?	No
q-and-a-exam	N00200054	AFN3Y0	46	mindy was born in Taoyuan, wasn't she?\t	--
q-and-a-exam	N00200034	AFN3Y0	17	Did Rena like pizza?	No
q-and-a-exam	N00200030	AFN3Y0	42	Did Jeremy Lin live in Hsinchu?\t	No
q-and-a-exam	N00200056	AFN3Y0	24	did Rena like the color pink	Yes
q-and-a-exam	N00200008	AFN3Y0	21	Who liked playing the piano?	Cindy
q-and-a-exam	N00200051	AFN3Y0	21	Did Jeff have a cat?	No
q-and-a-exam	N00200037	AFN3Y0	17		\N
q-and-a-exam	N00200017	AFN3Y0	23	Did Alex had a sister?	No
q-and-a-exam	N00200042	AFN3Y0	17	Who liked listening_to_music?	Dave
q-and-a-exam	N01202004	AFN3Y0	32	Who liked go shopping?	Vicky
q-and-a-exam	N00200029	AFN3Y0	14	Where did Vicky work?	Drug Store
q-and-a-exam	N00200017	AFN3Y0	24	Did Alex have a sister?	No
q-and-a-exam	N00200030	AFN3Y0	43	Did Jeff live in Hsinchu?	No
q-and-a-exam	N01202004	AFN3Y0	33		\N
q-and-a-exam	N00200009	AFN3Y0	35	Did Dave like Jeremy Lin?	No
q-and-a-exam	N00200034	AFN3Y0	18	Did Mindy like pizza?	No
q-and-a-exam	N00200036	AFN3Y0	27	Did Mindy live in Nantou?	No
q-and-a-exam	N00200017	AFN3Y0	25	Did Alex have a sister?	No
q-and-a-exam	N00200008	AFN3Y0	22	Who liked reading?	Cindy
q-and-a-exam	N00200001	AFN3Y0	33	Didn't Jeff like jogging?	No
q-and-a-exam	N00200051	AFN3Y0	22	Did Alex like Japan?	No
q-and-a-exam	N00200025	AFN3Y0	31	Did shane like hsiao-ching-teng?	Yes
q-and-a-exam	N00200042	AFN3Y0	18	Who liked listening_to_music?	Alex
q-and-a-exam	N00200036	AFN3Y0	28	Did Rena live in Nantou?	No
q-and-a-exam	N00200009	AFN3Y0	36	Did Alex like Jeremy Lin?	No
q-and-a-exam	N01203003	AFN3Y0	14	Did Rena like the cat ?	Yes
q-and-a-exam	N00200054	AFN3Y0	47	was cindy playing_the_piano ?	Yes
q-and-a-exam	N00200030	AFN3Y0	44	Was a man whose father was a truck driver have no brother?	No
q-and-a-exam	N01202001	AFN3Y0	19	who work ay drug store?	Vicky
q-and-a-exam	N00200017	AFN3Y0	26	Was Shane's father a truck driver	No
q-and-a-exam	N00200043	AFN3Y0	9	was kelly a student,wasn't she?	--
q-and-a-exam	N01202004	AFN3Y0	34	Did Shane had sister?	Yes
q-and-a-exam	N00200009	AFN3Y0	37	Did Rena like Jeremy Lin?	No
q-and-a-exam	N00200036	AFN3Y0	29	Did Dave live in Nantou?	No
q-and-a-exam	N00200054	AFN3Y0	48	Was Jeremy Lin born in America?	Yes
q-and-a-exam	N00200008	AFN3Y0	23	Who liked swimming?	Cindy
q-and-a-exam	N00200056	AFN3Y0	25	did Mindy likes listening to music	Yes
q-and-a-exam	N00200031	AFN3Y0	15		\N
q-and-a-exam	N00200029	AFN3Y0	15	Was Vicky's mother a babysitter , wasn't it ?	--
q-and-a-exam	N00200030	AFN3Y0	45	Was Dave born in Nantous?	No
q-and-a-exam	N00200001	AFN3Y0	34	didn't Mindy like jogging?	No
q-and-a-exam	N00200009	AFN3Y0	38	Did Kelly like Jeremy Lin?	No
q-and-a-exam	N00200037	AFN3Y0	18	Renabled liked pink, didn't she ?	Yes
q-and-a-exam	N00200034	AFN3Y0	19	Did Mindy like making_friends?	No
q-and-a-exam	N00200036	AFN3Y0	30	Did Kelly live in Nantou?	No
q-and-a-exam	N00200054	AFN3Y0	49	Did Jeff have a cat?	No
q-and-a-exam	N00200017	AFN3Y0	27	Did Shane live in Taiwan?	Yes
q-and-a-exam	N00200042	AFN3Y0	19	Where did Kelly work?	Lextar
q-and-a-exam	N00200009	AFN3Y0	39	Did Cindy like Jeremy Lin?	No
q-and-a-exam	N01202001	AFN3Y0	20		\N
q-and-a-exam	N00200043	AFN3Y0	10		\N
q-and-a-exam	N00200037	AFN3Y0	19	Rena liked pink, didn't she ?	Yes
q-and-a-exam	N00200036	AFN3Y0	31	Did Shane live in Nantou?	No
q-and-a-exam	N00200025	AFN3Y0	32	Did dave live in Nantou?	No
q-and-a-exam	N00200030	AFN3Y0	46	Was Dave born in Nantou?	No
q-and-a-exam	N00200056	AFN3Y0	26	did Mindy liked listening to music	Yes
q-and-a-exam	N00200029	AFN3Y0	16	Who born in 1994 ?	--
q-and-a-exam	N01202004	AFN3Y0	35	Alex student in Minghsin University?\t 	Yes
q-and-a-exam	N00200001	AFN3Y0	35	didn't shane like jogging?	No
q-and-a-exam	N00200030	AFN3Y0	47	Was Lextar born in Nantou?	No
q-and-a-exam	N00200054	AFN3Y0	50	Did dave like Jeremy Lin?	No
q-and-a-exam	N01203003	AFN3Y0	15	Did Mindy as a teacher?	No
q-and-a-exam	N01202001	AFN3Y0	21	Vicky's mother is a babysitter,isn't she ?	--
q-and-a-exam	N00200001	AFN3Y0	36	didn't Cindy like jogging?	No
q-and-a-exam	N00200009	AFN3Y0	40	Did Cindy live in Taoyuan?\t	No
q-and-a-exam	N00200017	AFN3Y0	28	Did Shane like pizza?	No
q-and-a-exam	N00200030	AFN3Y0	48	Was Jeff born in Nantou?	No
q-and-a-exam	N00200034	AFN3Y0	20	Did Rena live in Jiayi?	No
q-and-a-exam	N01202004	AFN3Y0	36	did Rena lived in America?	No
q-and-a-exam	N00200043	AFN3Y0	11	was kelly's father a truck driver?	Dave'S Father
q-and-a-exam	N00200054	AFN3Y0	51	was Dave Lin born in America?	--
q-and-a-exam	N00200051	AFN3Y0	23	Did Rena have a sister?	No
q-and-a-exam	N00200056	AFN3Y0	27	did Mindy like listening to music	Yes
q-and-a-exam	N00200009	AFN3Y0	41	Did Alex live in Taoyuan?\t	No
q-and-a-exam	N00200030	AFN3Y0	49	Was Rena born in Nantou?	No
q-and-a-exam	N00200036	AFN3Y0	32	Did Neil have a brother?	Yes
q-and-a-exam	N00200008	AFN3Y0	24	Who liked shopping?	Vicky
q-and-a-exam	N00200001	AFN3Y0	37	didn't Alex like jogging?	No
q-and-a-exam	N01202004	AFN3Y0	37		\N
q-and-a-exam	N00200034	AFN3Y0	21	Did Alex like making_friends?	No
q-and-a-exam	N00200009	AFN3Y0	42	Did Dave live in Taoyuan?\t	--
q-and-a-exam	N00200054	AFN3Y0	52	Was Alex born in America?	No
q-and-a-exam	N00200029	AFN3Y0	17	Did Vicky liked shopping on weekends ?	--
q-and-a-exam	N00200030	AFN3Y0	50	Was Alex born in Nantou?	No
q-and-a-exam	N00200037	AFN3Y0	20	Alex liked listen music, didn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	33	Did Neil have a brother?	No
q-and-a-exam	N00200043	AFN3Y0	12		\N
q-and-a-exam	N00200009	AFN3Y0	43	Did Dave live in Taoyuan?\t	No
q-and-a-exam	N00200030	AFN3Y0	51	Was Cindy born in Nantou?	No
q-and-a-exam	N00200034	AFN3Y0	22	Did Cindy like making_friends?	No
q-and-a-exam	N01202004	AFN3Y0	38	Who was born in 1994?	Jeff
q-and-a-exam	N00200054	AFN3Y0	53	Dave liked jogging, didn't he?\t	No
q-and-a-exam	N00200001	AFN3Y0	38	didn't killy like jogging?	No
q-and-a-exam	N00200043	AFN3Y0	13	was kelly's father a truck driver?	No
q-and-a-exam	N00200017	AFN3Y0	29		\N
q-and-a-exam	N00200036	AFN3Y0	34	Did Rena have a brother?	No
q-and-a-exam	N00200030	AFN3Y0	52	Was Mindy born in Nantou?	No
q-and-a-exam	N00200054	AFN3Y0	54	Dave liked jogging, didn't he?\t	Yes
q-and-a-exam	N00200009	AFN3Y0	44	Did Vicky live in Taoyuan?\t	No
q-and-a-exam	N00200025	AFN3Y0	33	Did kelly like playing the piano?	No
q-and-a-exam	N00200037	AFN3Y0	21	Alex liked listening_to_ music, didn't he?	Yes
q-and-a-exam	N00200030	AFN3Y0	53	Was Shanel born in Nantou?	No
q-and-a-exam	N00200034	AFN3Y0	23	Did Alex live in Jiayi?	No
q-and-a-exam	N01202001	AFN3Y0	22	Dave was 21 years old,wasn't he ?	Yes
q-and-a-exam	N00200008	AFN3Y0	25	Who liked swimming?	Neil
q-and-a-exam	N00200001	AFN3Y0	39	didn't Rena like jogging?	No
q-and-a-exam	N01203003	AFN3Y0	16	Was Neil a student?	Yes
q-and-a-exam	N00200036	AFN3Y0	35	Did Shane have a brother?	No
q-and-a-exam	N00200054	AFN3Y0	55	Did Alex have a sister?	Yes
q-and-a-exam	N00200030	AFN3Y0	54	Was Shane born in Nantou?	No
q-and-a-exam	N00200043	AFN3Y0	14	was kelly's mother a babysistter?	No
q-and-a-exam	N00200054	AFN3Y0	56	Was Mindy born in Nantou?	No
q-and-a-exam	N00200029	AFN3Y0	18	Did Shane lived in Taoyuan ?	--
q-and-a-exam	N00200030	AFN3Y0	55	Was Vicky born in Nantou?	No
q-and-a-exam	N00200025	AFN3Y0	34	Did kelly like playing the piano?	No
q-and-a-exam	N00200036	AFN3Y0	36	Did Kelly have a brother?	No
q-and-a-exam	N00200056	AFN3Y0	28	did Dr_Bean live in Hsinchu	Yes
q-and-a-exam	N00200009	AFN3Y0	45	Was Cindy a truck_driver ?\t	No
q-and-a-exam	N00200001	AFN3Y0	40	didn't  Dr_Bean like jogging?	No
q-and-a-exam	N00200008	AFN3Y0	26	Who liked go to swimming?	Neil
q-and-a-exam	N00200054	AFN3Y0	57	Was Dave born in Nantou?	--
q-and-a-exam	N00200037	AFN3Y0	22	Shawn liked listening_to_ music, didn't he?	Yes
q-and-a-exam	N00200009	AFN3Y0	46	Was Rena a truck_driver ?\t	No
q-and-a-exam	N00200051	AFN3Y0	24	Was Mindy lived in America?	No
q-and-a-exam	N00200030	AFN3Y0	56	Was Mindy born in Nantou?	No
q-and-a-exam	N00200017	AFN3Y0	30	Where did Shane live ?	Hsinchu
q-and-a-exam	N01202001	AFN3Y0	23	Dave had one brother? didn't he ?	Yes
q-and-a-exam	N00200054	AFN3Y0	58	Did Minday like pizza?	--
q-and-a-exam	N00200056	AFN3Y0	29	was Cindy a student	Yes
q-and-a-exam	N00200031	AFN3Y0	16	Did Vicky live in Jiayi?\t	No
q-and-a-exam	N00200009	AFN3Y0	47	Was Kelly a truck_driver ?\t	No
q-and-a-exam	N00200051	AFN3Y0	25	Did Mindy live in America?	--
q-and-a-exam	N00200051	AFN3Y0	26	Did Mindy live in America?	No
q-and-a-exam	N00200017	AFN3Y0	31	Where did Shane live?	Hukou
q-and-a-exam	N00200054	AFN3Y0	59	Did Jeff like pizza?	No
q-and-a-exam	N00200030	AFN3Y0	57	Was Dr Bean born in Nantou?	No
q-and-a-exam	N00200056	AFN3Y0	30	was Cindy a teacher	No
q-and-a-exam	N00200001	AFN3Y0	41	Did Jeff was born in America?	No
q-and-a-exam	N01203003	AFN3Y0	17	Was Neil lived in Nantou?	Yes
q-and-a-exam	N00200034	AFN3Y0	24	Did Cindy like hello_kitty ?	No
q-and-a-exam	N96200030	AFN3Y0	11	Jeff liked making_friends?	Yes
q-and-a-exam	N00200009	AFN3Y0	48	Was Shane a truck_driver ?\t	No
q-and-a-exam	N00200042	AFN3Y0	20		\N
q-and-a-exam	N00200030	AFN3Y0	58	Was Jeremy Lin born in Nantou?	No
q-and-a-exam	N00200051	AFN3Y0	27	Did Jeff live in America?	No
q-and-a-exam	N00200043	AFN3Y0	15	was shane born in nantou?	No
q-and-a-exam	N00200009	AFN3Y0	49	Was Andy a truck_driver ?\t	No
q-and-a-exam	N00200056	AFN3Y0	31	was Dave a student	Yes
q-and-a-exam	N00200029	AFN3Y0	19	Rena liked cats , wasn't she ?	--
q-and-a-exam	N00200001	AFN3Y0	42	Shane's father was a truck_driver?	No
q-and-a-exam	N00200054	AFN3Y0	60	Did Jeff live in Nantou	--
q-and-a-exam	N00200037	AFN3Y0	23	Rena had a brother, didn't she?	Yes
q-and-a-exam	N00200036	AFN3Y0	37	Did Mindy have a sister?	No
q-and-a-exam	N00200034	AFN3Y0	25	Did Alex like hello_kitty?	No
q-and-a-exam	N00200054	AFN3Y0	61	Did Neil live in Nantou	No
q-and-a-exam	N00200031	AFN3Y0	17		\N
q-and-a-exam	N00200051	AFN3Y0	28	Did Mindy like jogging?	No
q-and-a-exam	N00200056	AFN3Y0	32	was Dave a teacher	No
q-and-a-exam	N01203003	AFN3Y0	18	DId Neil lived in Nantou?	Yes
q-and-a-exam	N00200008	AFN3Y0	27	Who liked singing?	Shane
q-and-a-exam	N00200042	AFN3Y0	21	Who liked listening_to_music?	Alex
q-and-a-exam	N00200042	AFN3Y0	22	Who liked listening_to_music?	Dave
q-and-a-exam	N00200042	AFN3Y0	23	who like English?	Cindy
q-and-a-exam	N00200042	AFN3Y0	24	who like Japanese?	Mindy
q-and-a-exam	N00200042	AFN3Y0	25	Who liked studing Japanese?	Mindy
q-and-a-exam	N00200042	AFN3Y0	26	Who liked study Japanese?	Mindy
q-and-a-exam	N00200042	AFN3Y0	27	Who liked playing the piano?	Cindy
q-and-a-exam	N00200036	AFN3Y0	38	Did Rena have a sister?	No
q-and-a-exam	N01202001	AFN3Y0	24	Shane liked playing basketball,didn't he?	Yes
q-and-a-exam	N00200009	AFN3Y0	50	Did Shane like Japanese?\t	No
q-and-a-exam	N00200034	AFN3Y0	26	Did Neil like hello_kitty?	No
q-and-a-exam	N01202004	AFN3Y0	39	What is Alex liked?	Travel
q-and-a-exam	N00200056	AFN3Y0	33	was Neil a student	Yes
q-and-a-exam	N00200001	AFN3Y0	43	Was Mindy's mother a babysitter?	No
q-and-a-exam	N00200043	AFN3Y0	16	was shane born in jaiyi?	No
q-and-a-exam	N00200034	AFN3Y0	27	Did Mindy like hello_kitty?	No
q-and-a-exam	N00200009	AFN3Y0	51	Did Dave like Japanese?\t	No
q-and-a-exam	N00200037	AFN3Y0	24	Rena was a women, wasn't she?	Yes
q-and-a-exam	N00200056	AFN3Y0	34	was Neil a teacher	No
q-and-a-exam	N00200042	AFN3Y0	28		\N
q-and-a-exam	N00200054	AFN3Y0	62	didn't Mindy like jogging?	No
q-and-a-exam	N00200051	AFN3Y0	29	Did Alex like hello kitty?	No
q-and-a-exam	N01203003	AFN3Y0	19	Was Dave lived in America?	No
q-and-a-exam	N00200031	AFN3Y0	18	Cindy liked travel, didn't she?\t	No
q-and-a-exam	N00200009	AFN3Y0	52	Did Cindy like Japanese?\t	No
q-and-a-exam	N00200034	AFN3Y0	28	Did Jeff like hello_kitty?	No
q-and-a-exam	N00200017	AFN3Y0	32	Did Avril_Lavigne  live in Hsinchu? 	No
q-and-a-exam	N00200001	AFN3Y0	44	Was Cindy's mother a babysitter?	No
q-and-a-exam	N00200030	AFN3Y0	59	Did Kelly live in Jiayi?\t	No
q-and-a-exam	N00200009	AFN3Y0	53	Did Rena like Japanese?\t	No
q-and-a-exam	N96200030	AFN3Y0	12	Making_friend  was Jeff liked?	Yes
q-and-a-exam	N00200054	AFN3Y0	63	Did Dave have a cat?	--
q-and-a-exam	N00200036	AFN3Y0	39	Did Rena like cat?	Yes
q-and-a-exam	N00200056	AFN3Y0	35	was Jeff a student	Yes
q-and-a-exam	N00200037	AFN3Y0	25	Rena was a woman, wasn't she?	Yes
q-and-a-exam	N00200025	AFN3Y0	35		\N
q-and-a-exam	N00200017	AFN3Y0	33	Did Avril_Lavigne live in Hsinchu? 	No
q-and-a-exam	N00200034	AFN3Y0	29	Did Kelly like hello_kitty?	No
q-and-a-exam	N00200009	AFN3Y0	54	Did Andy like Japanese?\t	No
q-and-a-exam	N00200029	AFN3Y0	20	Was Jeff's grandmother a famer , wasn't she ?	--
q-and-a-exam	N00200054	AFN3Y0	64	Did Dave have a cat?	No
q-and-a-exam	N01202001	AFN3Y0	25	Neil came from Nontou,didn't he?	Yes
q-and-a-exam	N00200056	AFN3Y0	36	was Jeff a teacher	No
q-and-a-exam	N00200030	AFN3Y0	60	Did Dave live in Jiayi?\t	No
q-and-a-exam	N01202004	AFN3Y0	40		\N
q-and-a-exam	N00200001	AFN3Y0	45	Was Vicky's mother a babysitter?	Yes
q-and-a-exam	N00200008	AFN3Y0	28		\N
q-and-a-exam	N00200042	AFN3Y0	29	Where did Vicky work?	No
q-and-a-exam	N00200017	AFN3Y0	34	Did Hsiao_Ching-teng  live in Hsinchu? 	No
q-and-a-exam	N01203003	AFN3Y0	20	Did Shane has a sister?	Yes
q-and-a-exam	N96200030	AFN3Y0	13	Jeff was liked making_friends?	Yes
q-and-a-exam	N00200036	AFN3Y0	40	Did Mindy like cat?	No
q-and-a-exam	N00200031	AFN3Y0	19	Cindy liked cat, didn't she?\t	No
q-and-a-exam	N00200037	AFN3Y0	26	Cindy was a woman, was't she?	Yes
q-and-a-exam	N00200034	AFN3Y0	30	Did Shane like hello_kitty?	No
q-and-a-exam	N00200030	AFN3Y0	61	Did Dave like pizza?\t	No
q-and-a-exam	N01202004	AFN3Y0	41		\N
q-and-a-exam	N00200001	AFN3Y0	46	Was Jeff's mother a babysitter?	No
q-and-a-exam	N00200054	AFN3Y0	65	Did Mindy like Jeremy Lin?	No
q-and-a-exam	N00200042	AFN3Y0	30	Was Cindy's mother a babysitter?	No
q-and-a-exam	N00200037	AFN3Y0	27	Cindy was a woman, wasn't she?	Yes
q-and-a-exam	N00200017	AFN3Y0	35	Did Hukou  live in Hsinchu?	No
q-and-a-exam	N00200051	AFN3Y0	30	Did Alex like the color pink?	No
q-and-a-exam	N00200031	AFN3Y0	20	Cindy liked jogging, didn't she?\t	No
q-and-a-exam	N00200030	AFN3Y0	62	Did Cindy like pizza?\t	No
q-and-a-exam	N00200056	AFN3Y0	37	did Mindy like Pizza	Yes
q-and-a-exam	N01202001	AFN3Y0	26	Neil worked in the military,didn't he?	Yes
q-and-a-exam	N00200001	AFN3Y0	47	Was Neil's mother a babysitter	No
q-and-a-exam	N01202004	AFN3Y0	42	Was Alex's father a truck driver?\t 	No
q-and-a-exam	N00200042	AFN3Y0	31	Was Alex's mother a babysitter?	No
q-and-a-exam	N00200030	AFN3Y0	63	Did Alex like pizza?\t	No
q-and-a-exam	N01203003	AFN3Y0	21	DId Rena lived in Taiwan?	Yes
q-and-a-exam	N00200029	AFN3Y0	21	Who lived in Jaiyi ?	Cindy
q-and-a-exam	N00200034	AFN3Y0	31	Did Alex like shopping?	No
q-and-a-exam	N00200017	AFN3Y0	36	Did Lextar  live in Hsinchu?	No
q-and-a-exam	N00200043	AFN3Y0	17		\N
q-and-a-exam	N01203003	AFN3Y0	22	Did Rens	--
q-and-a-exam	N00200036	AFN3Y0	41	Did Mindy live in Taoyuan?	No
q-and-a-exam	N00200009	AFN3Y0	55	Did Shane like making_friends?	No
q-and-a-exam	N96200030	AFN3Y0	14	Jeff liked singing?	No
q-and-a-exam	N00200056	AFN3Y0	38	did Alex like Pizza	No
q-and-a-exam	N00200037	AFN3Y0	28	Vicky was a woman, wasn't she?	Yes
q-and-a-exam	N00200025	AFN3Y0	36	Mindy was born in Toyuan ,wasn't she?	No
q-and-a-exam	N00200031	AFN3Y0	21	Cindy liked swimming, didn't she?\t	No
q-and-a-exam	N00200030	AFN3Y0	64	Did Cindy like pizza?\t	No
q-and-a-exam	N00200034	AFN3Y0	32	Did Shane like shopping?	No
q-and-a-exam	N00200009	AFN3Y0	56	Did Alex like making_friends?	No
q-and-a-exam	N00200054	AFN3Y0	66	Did Rena like Hsiao_Ching-teng?\t	No
q-and-a-exam	N00200001	AFN3Y0	48	Was Dave's mother a babysitter	No
q-and-a-exam	N00200036	AFN3Y0	42	Did Rena live in Taoyuan?	No
q-and-a-exam	N00200017	AFN3Y0	37	Did Taiwan live in Hsinchu?	No
q-and-a-exam	N00200008	AFN3Y0	29	Did Vicky have father?	Yes
q-and-a-exam	N00200037	AFN3Y0	29	Mindy was a woman, wasn't she?	Yes
q-and-a-exam	N00200030	AFN3Y0	65	Did Jeff like pizza?\t	No
q-and-a-exam	N01203003	AFN3Y0	23	Did Rena live in Taiwan?	Yes
q-and-a-exam	N00200009	AFN3Y0	57	Did Vicky like making_friends?	No
q-and-a-exam	N00200042	AFN3Y0	32	Did Alex live in Hsinchu?	Yes
q-and-a-exam	N01202004	AFN3Y0	43	Was Dave's father a teacher?\t 	No
q-and-a-exam	N00200034	AFN3Y0	33	Did Rena like shopping?	No
q-and-a-exam	N00200054	AFN3Y0	67	Did Rena live in America?	No
q-and-a-exam	N00200056	AFN3Y0	39	did Mindy like jogging	No
q-and-a-exam	N00200031	AFN3Y0	22	Cindy liked watching TV, didn't she?\t	No
q-and-a-exam	N00200029	AFN3Y0	22	Who liked basketball ?	Jeff
q-and-a-exam	N00200036	AFN3Y0	43	Did Alex live in Taoyuan?	No
q-and-a-exam	N00200017	AFN3Y0	38	Did Lextar's father a truck driver?	No
q-and-a-exam	N00200029	AFN3Y0	23	Who liked basketball ?	Jeff
q-and-a-exam	N01202001	AFN3Y0	27	Neil liked to go swimming,didn't he?	Yes
q-and-a-exam	N00200029	AFN3Y0	24	Who liked basketball ?	Jeff
q-and-a-exam	N00200029	AFN3Y0	25	Who liked basketball ?	Jeff
q-and-a-exam	N00200009	AFN3Y0	58	Did Kelly like making_friends?	No
q-and-a-exam	N00200029	AFN3Y0	26	Who liked basketball ?	Jeff
q-and-a-exam	N00200037	AFN3Y0	30	Kelly was a woman, wasn't she?	Yes
q-and-a-exam	N00200043	AFN3Y0	18	who is a farmer?	Kelly'S Father
q-and-a-exam	N00200030	AFN3Y0	66	Did Jeremy Lin like pizza?\t	No
q-and-a-exam	N00200017	AFN3Y0	39	Was Lextar's father is a truck driver?	No
q-and-a-exam	N96200030	AFN3Y0	15	Jeff liked to singing?	No
q-and-a-exam	N00200051	AFN3Y0	31	Did Rena live in Hukou?	No
q-and-a-exam	N00200025	AFN3Y0	37	Shane lived in nantou, didn't he ?	No
q-and-a-exam	N01203003	AFN3Y0	24	Was Cindy a teacher?	No
q-and-a-exam	N00200034	AFN3Y0	34	Did Mindy like shopping?	No
q-and-a-exam	N00200036	AFN3Y0	44	Did Dave live in Taoyuan?	No
q-and-a-exam	N00200009	AFN3Y0	59	Did Jeff like making_friends?	No
q-and-a-exam	N00200042	AFN3Y0	33	Did Mindy live in Hsinchu,dose she?	Yes
q-and-a-exam	N00200054	AFN3Y0	68	Was Rena a truck_driver ?	No
q-and-a-exam	N00200056	AFN3Y0	40	was Vicky a student	Yes
q-and-a-exam	N00200031	AFN3Y0	23	Cindy liked reading, didn't she?\t	No
q-and-a-exam	N00200017	AFN3Y0	40	 Lextar's father is a truck driver, isn't he?	No
q-and-a-exam	N00200001	AFN3Y0	49	was Alex a design_assistant?	Yes
q-and-a-exam	N00200030	AFN3Y0	67	Did Avril Lavigne like pizza?	No
q-and-a-exam	N00200037	AFN3Y0	31	Lextar was a woman, wasn't she?	Yes
q-and-a-exam	N00200043	AFN3Y0	19		\N
q-and-a-exam	N00200009	AFN3Y0	60	Did Rena like making_friends?	No
q-and-a-exam	N01202004	AFN3Y0	44	Was cindy's mother a student?\t 	No
q-and-a-exam	N00200034	AFN3Y0	35	Did Dave like hello_kitty?	--
q-and-a-exam	N00200008	AFN3Y0	30	Did Vicky like shopping?	Yes
q-and-a-exam	N01203003	AFN3Y0	25	Was Jeff a teacher?	No
q-and-a-exam	N00200054	AFN3Y0	69	Did Rena like Jeremy Lin?	No
q-and-a-exam	N00200056	AFN3Y0	41	was Vicky a teacher	No
q-and-a-exam	N00200042	AFN3Y0	34	Did Mindy live in Hsinchu,didn't she?	Yes
q-and-a-exam	N00200031	AFN3Y0	24	Cindy liked exercising, didn't she?\t	No
q-and-a-exam	N00200017	AFN3Y0	41	 Lextar's father was a truck driver, wasn't he?	No
q-and-a-exam	N00200001	AFN3Y0	50	was Cindy a design_assistant	No
q-and-a-exam	N00200037	AFN3Y0	32	Neil was a man, wasn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	45	Did Cindy live in Taoyuan?	No
q-and-a-exam	N00200054	AFN3Y0	70	Did Mindy like Jeremy Lin?	No
q-and-a-exam	N00200030	AFN3Y0	68	Did Dr Bean like pizza?	No
q-and-a-exam	N00200043	AFN3Y0	20	was kelly's father a farmer?	Yes
q-and-a-exam	N00200031	AFN3Y0	25	Cindy liked singing, didn't she?\t	No
q-and-a-exam	N00200008	AFN3Y0	31	Did Alex like travel?	Yes
q-and-a-exam	N00200017	AFN3Y0	42	Neil 's father was a truck driver, wasn't he	No
q-and-a-exam	N00200056	AFN3Y0	42	was Shane a student	Yes
q-and-a-exam	N00200001	AFN3Y0	51	was Neil a design_assistant	No
q-and-a-exam	N00200037	AFN3Y0	33	Dave was a man, wasn't he?	Yes
q-and-a-exam	N00200025	AFN3Y0	38	Dave live in Hsinchu , didn't he?	Yes
q-and-a-exam	N01202001	AFN3Y0	28	Kelly liked watching TV,didn't she?	Yes
q-and-a-exam	N00200034	AFN3Y0	36	Did Dave like shopping?	No
q-and-a-exam	N00200029	AFN3Y0	27	What is Alex job?	--
q-and-a-exam	N01202004	AFN3Y0	45	Was Kelly's father a farmer?\t 	No
q-and-a-exam	N00200009	AFN3Y0	61	Did Cindy live in Hukou?\t	No
q-and-a-exam	N00200051	AFN3Y0	32	Did Rena can playing the piano?	No
q-and-a-exam	N00200054	AFN3Y0	71	Rena liked travel, didn't she?	No
q-and-a-exam	N00200056	AFN3Y0	43	was Shane a teacher	No
q-and-a-exam	N00200017	AFN3Y0	43	Jeremy_Lin 's father was a truck driver, wasn't he?	No
q-and-a-exam	N00200036	AFN3Y0	46	Did Jeff live in Taoyuan?	Yes
q-and-a-exam	N00200030	AFN3Y0	69	Did Alex like playing the piano?\t	No
q-and-a-exam	N00200009	AFN3Y0	62	Did Dave live in Hukou?\t	No
q-and-a-exam	N00200034	AFN3Y0	37	Did Dave live in Jiayi?	--
q-and-a-exam	N00200043	AFN3Y0	21	was kelly's father a farmer?	No
q-and-a-exam	N00200001	AFN3Y0	52	was Shane a design_assistant	No
q-and-a-exam	N00200031	AFN3Y0	26	Cindy liked deawing, didn't she?\t	No
q-and-a-exam	N00200009	AFN3Y0	63	Did Bean live in Hukou?\t	No
q-and-a-exam	N00200030	AFN3Y0	70	Did Lextar like playing the piano?\t	No
q-and-a-exam	N01203003	AFN3Y0	26	Was Dr_Bean Jeff's teacher?	Yes
q-and-a-exam	N00200051	AFN3Y0	33	Did Rena like playing the piano?	No
q-and-a-exam	N00200042	AFN3Y0	35	Some woman who was born in Nantou liked jogging, didn't she?	No
q-and-a-exam	N00200017	AFN3Y0	44	Jeff's father was a truck driver, wasn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	47	Did Jeff live in Taoyuan?	No
q-and-a-exam	N00200037	AFN3Y0	34	Shane was a man, wasn't he?	Yes
q-and-a-exam	N00200009	AFN3Y0	64	Did Vicky live in Hukou?\t	No
q-and-a-exam	N00200054	AFN3Y0	72	Did Mindy have a sister	No
q-and-a-exam	N00200030	AFN3Y0	71	Did Kelly like playing the piano?\t	No
q-and-a-exam	N00200031	AFN3Y0	27	Cindy liked drawing, didn't she?\t	No
q-and-a-exam	N00200025	AFN3Y0	39	Neil live in nantou,didn't he?	Yes
q-and-a-exam	N00200001	AFN3Y0	53	was Jeff a design_assistant	No
q-and-a-exam	N00200017	AFN3Y0	45	Alex's father was a truck driver, wasn't he	No
q-and-a-exam	N00200008	AFN3Y0	32	Did Shane like singing?	Yes
q-and-a-exam	N00200009	AFN3Y0	65	Did Mindy live in Hukou?\t	No
q-and-a-exam	N00200056	AFN3Y0	44	did Rena like Avril_Lavigne	Yes
q-and-a-exam	N00200029	AFN3Y0	28	Where did Jeff lived in ?	--
q-and-a-exam	N00200009	AFN3Y0	66	Did Jeff live in Hukou?\t	No
q-and-a-exam	N00200030	AFN3Y0	72	Did Jeff like playing the piano?\t	No
q-and-a-exam	N00200017	AFN3Y0	46	Avril_Lavigne 's father was a truck driver, wasn't he	No
q-and-a-exam	N00200001	AFN3Y0	54	was Rena a design_assistant	No
q-and-a-exam	N00200034	AFN3Y0	38	Did Kelly like hello_kitty?	No
q-and-a-exam	N00200034	AFN3Y0	39	Did Shane like hello_kitty?	No
q-and-a-exam	N00200034	AFN3Y0	40	Did Jeff like hello_kitty?	No
q-and-a-exam	N00200034	AFN3Y0	41	Did Mindy like hello_kitty?	No
q-and-a-exam	N00200037	AFN3Y0	35	Jeff was a man, wasn't he?	Yes
q-and-a-exam	N01202001	AFN3Y0	29	Shane was a Christian,wasn't he?	Yes
q-and-a-exam	N00200054	AFN3Y0	73	DId Neil like sining?	No
q-and-a-exam	N00200036	AFN3Y0	48	Did Alex like Japanese?	No
q-and-a-exam	N00200030	AFN3Y0	73	Did Shane like playing the piano?\t	No
q-and-a-exam	N00200034	AFN3Y0	42	Did Neil like hello_kitty?	No
q-and-a-exam	N00200034	AFN3Y0	43	Did Alex like hello_kitty?	No
q-and-a-exam	N96200030	AFN3Y0	16	was Mindy cat mi_mi?	No
q-and-a-exam	N00200009	AFN3Y0	67	Did Vicky live in America?\t	No
q-and-a-exam	N00200042	AFN3Y0	36	Kelly liked Jeremy_Lin , didn't she?	No
q-and-a-exam	N00200056	AFN3Y0	45	did Mindy like Avril_Lavigne	No
q-and-a-exam	N00200034	AFN3Y0	44	Did Cindy like hello_kitty ?	No
q-and-a-exam	N00200034	AFN3Y0	45	Did Alex live in Jiayi?	No
q-and-a-exam	N00200034	AFN3Y0	46	Did Cindy like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	47	Did Alex like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	48	Did Rena live in Jiayi?	No
q-and-a-exam	N00200034	AFN3Y0	49	Did Mindy like pizza?	No
q-and-a-exam	N00200034	AFN3Y0	50	Did Mindy like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	51	Did Rena like pizza?	No
q-and-a-exam	N00200001	AFN3Y0	55	was Dr_Bean a design_assistant	No
q-and-a-exam	N00200034	AFN3Y0	52	Did Rena like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	53	Did Kelly like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	54	Did Mindy like Japanese?	No
q-and-a-exam	N00200034	AFN3Y0	55	Did Neil live in Hsinchu?	No
q-and-a-exam	N00200034	AFN3Y0	56	Did Neil like Japanese?	No
q-and-a-exam	N00200034	AFN3Y0	57	Did Mindy like Japanese?	--
q-and-a-exam	N00200034	AFN3Y0	58	Did a girl who was born in Nantou like jogging?	No
q-and-a-exam	N00200034	AFN3Y0	59	Did Rena like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	60	Did Jeff live in Jiayi?	No
q-and-a-exam	N01203003	AFN3Y0	27	Did Dr_Bean a teacher?	Yes
q-and-a-exam	N00200009	AFN3Y0	68	Did Jeff live in America?\t	No
q-and-a-exam	N00200034	AFN3Y0	61	Did Cindy like hello_kitty ?	No
q-and-a-exam	N00200017	AFN3Y0	47	1994's father was a truck driver, wasn't he?	No
q-and-a-exam	N00200054	AFN3Y0	74	Did Rena have a father?	Yes
q-and-a-exam	N00200042	AFN3Y0	37	Alex liked Jeremy_Lin , didn't he?	No
q-and-a-exam	N00200036	AFN3Y0	49	Did Cindy like Japanese?	No
q-and-a-exam	N00200030	AFN3Y0	74	Did Dr Bean like playing the piano?\t	No
q-and-a-exam	N00200001	AFN3Y0	56	was Dr_Bean a design_assistant	No
q-and-a-exam	N01203003	AFN3Y0	28	Did Dr_Bean a teacher?	Yes
q-and-a-exam	N00200025	AFN3Y0	40	Shane liked jogging ,didn't he?	No
q-and-a-exam	N00200001	AFN3Y0	57	was Dr_Bean a design_assistant	No
q-and-a-exam	N00200008	AFN3Y0	33	Did Neil like jogging?	Yes
q-and-a-exam	N00200043	AFN3Y0	22	was neil a farmer?	No
q-and-a-exam	N00200056	AFN3Y0	46	did Alex like Avril_Lavigne	No
q-and-a-exam	N00200009	AFN3Y0	69	Did Alex live in America?\t	No
q-and-a-exam	N01202004	AFN3Y0	46	Was Shane's sister a design assistant?\t 	No
q-and-a-exam	N00200051	AFN3Y0	34	Did Rena like going to the movies?	No
q-and-a-exam	N00200009	AFN3Y0	70	Did Rena live in America?\t	No
q-and-a-exam	N96200030	AFN3Y0	17	Was Mindy cat mi_mi?	No
q-and-a-exam	N00200030	AFN3Y0	75	Did Avril Lavigne like playing the piano?\t	No
q-and-a-exam	N00200042	AFN3Y0	38	Jeff liked Jeremy_Lin , didn't he?	No
q-and-a-exam	N00200001	AFN3Y0	58	was cindy playing_the_piano ?	Yes
q-and-a-exam	N00200054	AFN3Y0	75	Did Alex like playing the piano?	No
q-and-a-exam	N01202001	AFN3Y0	30	Alex was a design assistant,wasn't he?	Yes
q-and-a-exam	N00200009	AFN3Y0	71	Did Vicky live in America?\t	No
q-and-a-exam	N00200030	AFN3Y0	76	Did Rena like playing the piano?	No
q-and-a-exam	N00200056	AFN3Y0	47	did Cindy like Avril_Lavigne	No
q-and-a-exam	N00200009	AFN3Y0	72	Did Shane live in America?\t	No
q-and-a-exam	N00200037	AFN3Y0	36	Jeff was Cindy's father, wasn't he	No
q-and-a-exam	N00200034	AFN3Y0	62		\N
q-and-a-exam	N00200043	AFN3Y0	23	was Alex a farmer?	No
q-and-a-exam	N00200029	AFN3Y0	29	Was a man  who lived in Taoyuan like jogging ?	--
q-and-a-exam	N00200042	AFN3Y0	39	Cindy liked Jeremy_Lin , didn't she?	No
q-and-a-exam	N00200008	AFN3Y0	34	Did Neil like do exercise?	Yes
q-and-a-exam	N00200056	AFN3Y0	48	did Neil like Avril_Lavigne	No
q-and-a-exam	N01202004	AFN3Y0	47	Did Dave like making_friends?\t 	Yes
q-and-a-exam	N00200051	AFN3Y0	35		\N
q-and-a-exam	N00200056	AFN3Y0	49	did Dr_Bean like Avril_Lavigne	No
q-and-a-exam	N96200030	AFN3Y0	18	Was vicky cat mi_mi?	No
q-and-a-exam	N00200054	AFN3Y0	76	Was Jeff living Taiwan	Yes
q-and-a-exam	N00200042	AFN3Y0	40	Vicky liked Jeremy_Lin , didn't she?	No
q-and-a-exam	N00200037	AFN3Y0	37	Dave was Cindy's father, wasn't he?	No
q-and-a-exam	N01203003	AFN3Y0	29	Was Dr_Bean from Australia?	Yes
q-and-a-exam	N00200025	AFN3Y0	41		\N
q-and-a-exam	N00200043	AFN3Y0	24	was Shane a farmer?	No
q-and-a-exam	N00200056	AFN3Y0	50	did Vicky like Avril_Lavigne	No
q-and-a-exam	N00200001	AFN3Y0	59	Was Jeff a_japanese_interpreter	No
q-and-a-exam	N01202001	AFN3Y0	31	Alex liked traveling,didn't he?	Yes
q-and-a-exam	N00200031	AFN3Y0	28	Was Cindy liked hello kitty?	No
q-and-a-exam	N01202004	AFN3Y0	48	Was Shane a student of Minghsin University?	Yes
q-and-a-exam	N96200030	AFN3Y0	19	Was Vicky cat mi_mi?	No
q-and-a-exam	N00200056	AFN3Y0	51	did Dave like Avril_Lavigne	No
q-and-a-exam	N00200051	AFN3Y0	36	Who liked Avril Lavigne?	Rena
q-and-a-exam	N00200042	AFN3Y0	41	Neil liked Jeremy_Lin , didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	42	Neil was a design assistant , wasn't he?	No
q-and-a-exam	N00200029	AFN3Y0	30	Who liked cats ?	Rena
q-and-a-exam	N00200017	AFN3Y0	48	1994  liked jogging, didn't he? 	No
q-and-a-exam	N00200001	AFN3Y0	60	Was Shane a_japanese_interpreter	No
q-and-a-exam	N00200001	AFN3Y0	61	Was Shane a_japanese_interpreter	No
q-and-a-exam	N00200025	AFN3Y0	43	Who was a student in Minghsin University?\t	Alex
q-and-a-exam	N00200031	AFN3Y0	29	Was Cindy a student of Minghsin University?\t	No
q-and-a-exam	N00200009	AFN3Y0	73	Did Neil like English?\t	No
q-and-a-exam	N00200001	AFN3Y0	62	Was Cindy a_japanese_interpreter	No
q-and-a-exam	N00200042	AFN3Y0	42	Dave liked Jeremy_Lin , didn't he?	No
q-and-a-exam	N00200043	AFN3Y0	25	was kelly a farmer?	No
q-and-a-exam	N00200025	AFN3Y0	44	Who was a student in Minghsin University?\t	Cindy
q-and-a-exam	N00200037	AFN3Y0	38	Rena was Dave's mother, wasn't she?	No
q-and-a-exam	N00200034	AFN3Y0	63	Did Vicky like hello_kitty?	No
q-and-a-exam	N01203003	AFN3Y0	30	Was Dr_Bean a Australian?	Yes
q-and-a-exam	N00200051	AFN3Y0	37	Where did Rena want to work?	America
q-and-a-exam	N00200009	AFN3Y0	74	Did Alex like English?\t	No
q-and-a-exam	N00200008	AFN3Y0	35	Did Mindy like pizza?	Yes
q-and-a-exam	N01202004	AFN3Y0	49	Was cindy liked playing the piano ?\t 	Yes
q-and-a-exam	N00200029	AFN3Y0	31	Did Shane like jogging , didn't he?	--
q-and-a-exam	N00200031	AFN3Y0	30	Was Kelly a student of Minghsin University?\t	No
q-and-a-exam	N00200009	AFN3Y0	75	Did Cindy like English?\t	No
q-and-a-exam	N00200001	AFN3Y0	63	Was Vicky  a_japanese_interpreter	No
q-and-a-exam	N00200009	AFN3Y0	76	Did Cindy like English?\t	Yes
q-and-a-exam	N96200030	AFN3Y0	20	Did Mandy have cat?	No
q-and-a-exam	N00200034	AFN3Y0	64	Did Vicky like making_friends?	No
q-and-a-exam	N01202001	AFN3Y0	32	Rena liked playing the piano,didn't she?	Yes
q-and-a-exam	N00200009	AFN3Y0	77	Did Cindy like English?\t	No
q-and-a-exam	N00200017	AFN3Y0	49	Neil liked Avril_Lavigne , didn't he? 	No
q-and-a-exam	N00200031	AFN3Y0	31	Was Vicky a student of Minghsin University?\t	No
q-and-a-exam	N01203003	AFN3Y0	31	Was Dr_Bean a tall man?	Yes
q-and-a-exam	N00200025	AFN3Y0	45	where did Neil live?	Nantou
q-and-a-exam	N00200043	AFN3Y0	26	was cindy a farmer?	No
q-and-a-exam	N00200056	AFN3Y0	52	did Alex born in April_30th,_1994	No
q-and-a-exam	N00200054	AFN3Y0	77	Was Lextar born in Jiayi?	No
q-and-a-exam	N00200001	AFN3Y0	64	Was Rena a_japanese_interpreter	No
q-and-a-exam	N01202004	AFN3Y0	50	Did Alex live in Taoyuan\t?	No
q-and-a-exam	N00200009	AFN3Y0	78	Did Dave like English?\t	No
q-and-a-exam	N00200042	AFN3Y0	43	Alex's father was a truck driver, wasn't he?	No
q-and-a-exam	N00200036	AFN3Y0	50		\N
q-and-a-exam	N00200008	AFN3Y0	36	Did Mindy like eat pizza?	Yes
q-and-a-exam	N00200037	AFN3Y0	39	Kelly was Cindy's mother, wasn't she?	No
q-and-a-exam	N00200017	AFN3Y0	50	Dr_Bean  liked Avril_Lavigne , didn't he?	No
q-and-a-exam	N00200009	AFN3Y0	79	Did Vicky like English?\t	No
q-and-a-exam	N00200034	AFN3Y0	65	Did Vicky live in Jiayi?	No
q-and-a-exam	N00200031	AFN3Y0	32	Was Mindy a student of Minghsin University?\t	No
q-and-a-exam	N00200001	AFN3Y0	65	Was Alex a_japanese_interpreter	No
q-and-a-exam	N00200008	AFN3Y0	37	Did Alex like pizza?	No
q-and-a-exam	N01203003	AFN3Y0	32	Was Dr Bean a student?	No
q-and-a-exam	N00200025	AFN3Y0	46	who lived in Nantou?	Neil
q-and-a-exam	N00200009	AFN3Y0	80	Did Neil like English?\t	No
q-and-a-exam	N00200054	AFN3Y0	78	Did Lextar  like japanese	No
q-and-a-exam	N00200029	AFN3Y0	32	Was  Cindy liked listening to music ,was she ?	--
q-and-a-exam	N00200009	AFN3Y0	81	Did Neil like English?\t	No
q-and-a-exam	N00200017	AFN3Y0	51	Hsiao_Ching-teng  liked Avril_Lavigne , didn't he?	No
q-and-a-exam	N00200056	AFN3Y0	53	did Alex born in April_30th_1994	No
q-and-a-exam	N00200043	AFN3Y0	27	was Dave a farmer?	No
q-and-a-exam	N96200030	AFN3Y0	21	Did Jeff had cat?	No
q-and-a-exam	N00200001	AFN3Y0	66	Was Dave a_japanese_interpreter	No
q-and-a-exam	N00200008	AFN3Y0	38	Did Vicky like pizza?	No
q-and-a-exam	N00200037	AFN3Y0	40	Shane was Cindy's father, wasn't he?	No
q-and-a-exam	N00200034	AFN3Y0	66	Did Neil like shopping?	No
q-and-a-exam	N00200009	AFN3Y0	82	Did Rena like English?\t	No
q-and-a-exam	N00200056	AFN3Y0	54	did Alex born in 1994	No
q-and-a-exam	N00200031	AFN3Y0	33	Was Dave a student of Minghsin University?\t	Yes
q-and-a-exam	N00200025	AFN3Y0	47	neil live in hukou,didn't he?	No
q-and-a-exam	N00200029	AFN3Y0	33	Who live in Jaiyi ?	Cindy
q-and-a-exam	N01203003	AFN3Y0	33	Was Dr_Bean a student?	No
q-and-a-exam	N01203003	AFN3Y0	34	Was Dr_Bean a student?	No
q-and-a-exam	N01202001	AFN3Y0	33	Dave had a sister,didn't he?	Yes
q-and-a-exam	N00200054	AFN3Y0	79	Lextar like movie	No
q-and-a-exam	N01202004	AFN3Y0	51	Shane lived in Jiayi, didn't he?\t 	No
q-and-a-exam	N00200042	AFN3Y0	44	Kelly was Dave's mother, wasn't she?	No
q-and-a-exam	N00200001	AFN3Y0	67	Was Kelly a_japanese_interpreter	No
q-and-a-exam	N00200031	AFN3Y0	34	Was Dave a student of Minghsin University?\t	No
q-and-a-exam	N00200034	AFN3Y0	67	Did Neil like making_friends?	No
q-and-a-exam	N00200054	AFN3Y0	80	Lextar like sleep?	No
q-and-a-exam	N00200042	AFN3Y0	45	Vicky was Dave's mother, wasn't she?	No
q-and-a-exam	N00200009	AFN3Y0	83	Did Jeff like English?\t	No
q-and-a-exam	N00200008	AFN3Y0	39	Did Vicky have cat?	No
q-and-a-exam	N00200029	AFN3Y0	34	Who born in Jaiyi ?	--
q-and-a-exam	N00200029	AFN3Y0	35	Who born in Jaiyi ?	Cindy
q-and-a-exam	N00200037	AFN3Y0	41	Neil was Kelly's father, wasn't he?	No
q-and-a-exam	N01202004	AFN3Y0	52		\N
q-and-a-exam	N00200051	AFN3Y0	38		\N
q-and-a-exam	N96200030	AFN3Y0	22	Was Vicky had cat mi_mi?	No
q-and-a-exam	N00200042	AFN3Y0	46	Cindy was Dave's mother, wasn't she?	No
q-and-a-exam	N00200054	AFN3Y0	81	Lextar like driving?	No
q-and-a-exam	N00200051	AFN3Y0	39		\N
q-and-a-exam	N00200017	AFN3Y0	52	Hsiao_Ching-teng was Cindy's mother, wasn't she? 	No
q-and-a-exam	N00200008	AFN3Y0	40	Did Vicky has cat?	No
q-and-a-exam	N96200030	AFN3Y0	23		--
q-and-a-exam	N00200037	AFN3Y0	42	Kelly was Mindy's mother, wasn't she?	No
q-and-a-exam	N00200034	AFN3Y0	68	Did Shane live in Jiayi?	No
q-and-a-exam	N00200056	AFN3Y0	55	did Shane like Avril_Lavigne	No
q-and-a-exam	N01202001	AFN3Y0	34	Neil was a teacher, wasn't he?	No
q-and-a-exam	N00200051	AFN3Y0	40	Did Rena like sleeping?	No
q-and-a-exam	N00200042	AFN3Y0	47	Mindy was Dave's mother, wasn't she?	No
q-and-a-exam	N00200054	AFN3Y0	82	Lextar like going?	No
q-and-a-exam	N00200008	AFN3Y0	41	Did Vicky had cat?	No
q-and-a-exam	N00200036	AFN3Y0	51	Was Shane a student of Minghsin University?	No
q-and-a-exam	N01202004	AFN3Y0	53	kelly lived in Jiayi, didn't she?\t 	No
q-and-a-exam	N01203003	AFN3Y0	35	Was color pink is Rena's favorite color?	Yes
q-and-a-exam	N00200017	AFN3Y0	53	Alex  liked swimming, didn't he? 	No
q-and-a-exam	N00200056	AFN3Y0	56	did Alex like cat	No
q-and-a-exam	N00200054	AFN3Y0	83	Lextar like paying	No
q-and-a-exam	N00200009	AFN3Y0	84	Was Alex born in America?\t	No
q-and-a-exam	N00200043	AFN3Y0	28	did dave have a sister?	No
q-and-a-exam	N00200031	AFN3Y0	35	Who was born in Jiayi\t	Cindy
q-and-a-exam	N00200001	AFN3Y0	68	Did Cindy live in Hukou	No
q-and-a-exam	N00200042	AFN3Y0	48	shane was Dave's mother, wasn't he?	No
q-and-a-exam	N00200009	AFN3Y0	85	Was Neil born in America?\t	No
q-and-a-exam	N00200036	AFN3Y0	52	Was Mindy a student of Minghsin University?	Yes
q-and-a-exam	N00200054	AFN3Y0	84	Lextar like cat?	No
q-and-a-exam	N00200009	AFN3Y0	86	Was Dave born in America?\t	No
q-and-a-exam	N01203003	AFN3Y0	36	Did Alex a teacher?	No
q-and-a-exam	N00200037	AFN3Y0	43	Vicky was Mindy's mother, wasn't she?	Yes
q-and-a-exam	N00200043	AFN3Y0	29	did kelly have a sister?	No
q-and-a-exam	N00200042	AFN3Y0	49	Jeff was Dave's mother, wasn't he?	No
q-and-a-exam	N00200036	AFN3Y0	53	Was Mindy a student of Minghsin University?	No
q-and-a-exam	N00200001	AFN3Y0	69	Did Mindy live in Hukou	No
q-and-a-exam	N01202004	AFN3Y0	54	Rena lived in Nantou, didn't she?\t 	No
q-and-a-exam	N00200037	AFN3Y0	44	Vicky was Mindy's mother, wasn't she?	No
q-and-a-exam	N00200017	AFN3Y0	54	America  liked swimming, didn't he? 	No
q-and-a-exam	N00200054	AFN3Y0	85	Mindy like sleep?	No
q-and-a-exam	N00200042	AFN3Y0	50	Neil was Dave's mother, wasn't he?	No
q-and-a-exam	N00200008	AFN3Y0	42	Did Vicky like travel?	No
q-and-a-exam	N00200043	AFN3Y0	30	did kelly have a sister?	Yes
q-and-a-exam	N01202004	AFN3Y0	55	Alex lived in Jiayi, didn't he?\t 	No
q-and-a-exam	N00200034	AFN3Y0	69	Did Cindy like shopping?	No
q-and-a-exam	N00200009	AFN3Y0	87	Was Dr_Bean born in America?\t	No
q-and-a-exam	N00200029	AFN3Y0	36	Was Vicky's father a truck driver , wasn't he ?	--
q-and-a-exam	N00200017	AFN3Y0	55	Dr_Bean  liked swimming, didn't he	No
q-and-a-exam	N00200036	AFN3Y0	54	Was Jeff a student of Minghsin University?	No
q-and-a-exam	N00200054	AFN3Y0	86	Mindy like shoping?	No
q-and-a-exam	N00200025	AFN3Y0	48	dave live in nantou didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	43		\N
q-and-a-exam	N00200008	AFN3Y0	44		\N
q-and-a-exam	N00200009	AFN3Y0	88	Was Jeff born in America?\t	No
q-and-a-exam	N00200051	AFN3Y0	41	Did Rena like watching tv?	No
q-and-a-exam	N01202001	AFN3Y0	35	Mindy majored in English,didn't she?	Yes
q-and-a-exam	N01203003	AFN3Y0	37	Did Dr_ Bean like Japan?	Yes
q-and-a-exam	N96200030	AFN3Y0	24	Was Jeff liked making friends?	Yes
q-and-a-exam	N00200017	AFN3Y0	56	Gemitek liked swimming, didn't he?	No
q-and-a-exam	N00200034	AFN3Y0	70	Did Kelly like shopping?	No
q-and-a-exam	N00200056	AFN3Y0	57	Dave like Japanese	No
q-and-a-exam	N00200043	AFN3Y0	31	did shanehave a sister?	Yes
q-and-a-exam	N01202004	AFN3Y0	56	Cindy liked Jeremy_Lin , didn't he?	No
q-and-a-exam	N00200051	AFN3Y0	42		\N
q-and-a-exam	N00200036	AFN3Y0	55	Was Neil a student of Minghsin University?	No
q-and-a-exam	N00200037	AFN3Y0	45	Dr_Bean speaked Japanese, didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	49	Did Jeff like making friends?\t	No
q-and-a-exam	N00200008	AFN3Y0	45		\N
q-and-a-exam	N00200054	AFN3Y0	87	Mindy like paying	No
q-and-a-exam	N00200017	AFN3Y0	57	Jeremy_Lin  liked swimming, didn't he?	--
q-and-a-exam	N00200009	AFN3Y0	89	Was Kelly born in America?\t	No
q-and-a-exam	N00200008	AFN3Y0	46		\N
q-and-a-exam	N00200029	AFN3Y0	37	Where did Mindy lived ?	--
q-and-a-exam	N00200025	AFN3Y0	50	Did Alex like making friends?\t	--
q-and-a-exam	N00200001	AFN3Y0	70	wasn't Rena like the_color_pink	Yes
q-and-a-exam	N00200017	AFN3Y0	58	Jeremy_Lin liked swimming, didn't he?	No
q-and-a-exam	N00200036	AFN3Y0	56	Was Rena a student of Minghsin University?	No
q-and-a-exam	N00200056	AFN3Y0	58	did Dave like Japanese	No
q-and-a-exam	N00200025	AFN3Y0	51	Did Alex like making friends?\t	No
q-and-a-exam	N00200042	AFN3Y0	51	Neil liked travel, didn't he?	No
q-and-a-exam	N00200034	AFN3Y0	71	Did Lextar like hello_kitty?	No
q-and-a-exam	N01202004	AFN3Y0	57	Was cindy liked Jeremy Lin , didn't she?	No
q-and-a-exam	N00200009	AFN3Y0	90	Was Lextar born in America?\t	No
q-and-a-exam	N00200017	AFN3Y0	59	Shane liked swimming, didn't he?	No
q-and-a-exam	N00200043	AFN3Y0	32	Did kelly like jogging?	No
q-and-a-exam	N00200054	AFN3Y0	88	Mindy like dog?	No
q-and-a-exam	N00200051	AFN3Y0	43	Did Mindy like basketball?	No
q-and-a-exam	N00200025	AFN3Y0	52	neil liked jogging ,didn''t he ?	Yes
q-and-a-exam	N00200025	AFN3Y0	53	Did Dr Bean like making friends?\t	No
q-and-a-exam	N00200042	AFN3Y0	52	Jeff liked travel, didn't he?	No
q-and-a-exam	N00200036	AFN3Y0	57	Was Vicky a student of Minghsin University?	No
q-and-a-exam	N00200009	AFN3Y0	91	Was Neil born in America?\t	No
q-and-a-exam	N00200056	AFN3Y0	59	did Shane like Japanese	No
q-and-a-exam	N00200025	AFN3Y0	54	Did Avril Lavigne like making friends?\t	No
q-and-a-exam	N01202001	AFN3Y0	36	Rena had a cat, didn't she?	Yes
q-and-a-exam	N00200043	AFN3Y0	33	Did Dave like jogging?	No
q-and-a-exam	N00200017	AFN3Y0	60	Some man who was born in Hsinchu liked jogging, didn't he? 	No
q-and-a-exam	N00200037	AFN3Y0	46	Rena was a cat, wasn't she?	No
q-and-a-exam	N00200001	AFN3Y0	71	did Rena like the_color_pink	Yes
q-and-a-exam	N01203003	AFN3Y0	38	Did Dr_Bean work in Mingsin_University?	Yes
q-and-a-exam	N00200025	AFN3Y0	55	Did Lextar like making friends?\t	No
q-and-a-exam	N00200042	AFN3Y0	53	shane liked travel, didn't he?	No
q-and-a-exam	N00200054	AFN3Y0	89	Mindy like pink?	Yes
q-and-a-exam	N00200034	AFN3Y0	72	Did Lextar like making_friends?	No
q-and-a-exam	N00200056	AFN3Y0	60		--
q-and-a-exam	N00200051	AFN3Y0	44	Did Jeff like Avril Lavigne?	No
q-and-a-exam	N00200017	AFN3Y0	61	Some man who was born in Jiayi  liked jogging, didn't he? 	No
q-and-a-exam	N00200025	AFN3Y0	56	Did Rena like making friends?\t	No
q-and-a-exam	N00200009	AFN3Y0	92	Was Neil born in Taiwan?\t	Yes
q-and-a-exam	N00200042	AFN3Y0	54	Cindy liked travel, didn't she?	No
q-and-a-exam	N00200029	AFN3Y0	38		\N
q-and-a-exam	N00200054	AFN3Y0	90	Dave like sleep?	No
q-and-a-exam	N00200017	AFN3Y0	62	Some man who was born in America  liked jogging, didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	47	Dave had a brother, didn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	58	Jeff was a design assistant , wasn't he?	No
q-and-a-exam	N00200051	AFN3Y0	45	Did Rena like drawing?	No
q-and-a-exam	N00200034	AFN3Y0	73	Did Lextar live in Jiayi?	No
q-and-a-exam	N00200037	AFN3Y0	47	Vicky was a cat, wasn't she?	No
q-and-a-exam	N00200001	AFN3Y0	72	did Mindy like the_color_pink	No
q-and-a-exam	N00200056	AFN3Y0	61	did Dr_Bean like Japanese	No
q-and-a-exam	N00200017	AFN3Y0	63	Some man who was born in Hukou  liked jogging, didn't he?	No
q-and-a-exam	N00200043	AFN3Y0	34	Did vicky like jogging?	No
q-and-a-exam	N01202004	AFN3Y0	58	alex was Mindy's mother, wasn't he?\t 	No
q-and-a-exam	N01203003	AFN3Y0	39	Did Neil live in Hsinchu?	No
q-and-a-exam	N00200054	AFN3Y0	91	Dave like cat?	No
q-and-a-exam	N00200025	AFN3Y0	57	dave liked jogging,didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	48	Vicky had a brother, didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	58	Who lived in Hukou?\t	Shane
q-and-a-exam	N00200042	AFN3Y0	55	Kelly liked travel, didn't she?	No
q-and-a-exam	N00200017	AFN3Y0	64	Some man who was born in Taiwan liked jogging, didn't he?	Yes
q-and-a-exam	N96200030	AFN3Y0	25	Was Vicky liked japanese?	No
q-and-a-exam	N01202001	AFN3Y0	37	Mindy born in America,didn't she?	No
q-and-a-exam	N00200037	AFN3Y0	48	Mindy was a cat, wasn't she?	No
q-and-a-exam	N00200036	AFN3Y0	59	Dave was a design assistant , wasn't he?	Yes
q-and-a-exam	N00200001	AFN3Y0	73	did Shane like the_color_pink	No
q-and-a-exam	N00200056	AFN3Y0	62	did Dr_Bean like English	No
q-and-a-exam	N00200031	AFN3Y0	36	Where did Cindy born in ?\t	Jiayi
q-and-a-exam	N00200054	AFN3Y0	92	Cindy like drinking?	No
q-and-a-exam	N00200034	AFN3Y0	74	Did Alex like making_friends?	No
q-and-a-exam	N00200008	AFN3Y0	49	Dave had a brother, didn't she?	No
q-and-a-exam	N00200042	AFN3Y0	56	Mind liked travel, didn't she?	No
q-and-a-exam	N00200031	AFN3Y0	37	Where did Cindy born ?\t	Jiayi
q-and-a-exam	N00200043	AFN3Y0	35	was Dave a truck driver?	No
q-and-a-exam	N00200001	AFN3Y0	74	did Jeff like the_color_pink	No
q-and-a-exam	N00200036	AFN3Y0	60	Davel was a design assistant , wasn't he?	No
q-and-a-exam	N00200009	AFN3Y0	93	Did Neil like Avril_Lavigne?	No
q-and-a-exam	N00200054	AFN3Y0	93	Jeff like drinking?	No
q-and-a-exam	N00200051	AFN3Y0	46	Did Rena like exercise?	No
q-and-a-exam	N00200029	AFN3Y0	39	Was Vicky's father a truck driver , wasn't he ?	Yes
q-and-a-exam	N01203003	AFN3Y0	40	Did Rena like English?	Yes
q-and-a-exam	N00200029	AFN3Y0	40	Was Vicky's father a truck driver , wasn't he ?	Yes
q-and-a-exam	N00200029	AFN3Y0	41	Was Vicky's father a truck driver , wasn't he ?	Yes
q-and-a-exam	N01202004	AFN3Y0	59	cindy was Dave's sister, wasn't she?\t 	No
q-and-a-exam	N00200037	AFN3Y0	49	Kelly was a cat, wasn't she?	No
q-and-a-exam	N00200034	AFN3Y0	75	Did Shane like playing the piano?	No
q-and-a-exam	N00200056	AFN3Y0	63	did Dr_Bean like jogging	No
q-and-a-exam	N00200036	AFN3Y0	61	Dave was a design assistant , wasn't he?	No
q-and-a-exam	N00200008	AFN3Y0	50	Vicky had a brother, didn't she?	No
q-and-a-exam	N00200001	AFN3Y0	75	did Neil like the_color_pink	No
q-and-a-exam	N96200030	AFN3Y0	26	Wasn't Vicky liked japanese?	Yes
q-and-a-exam	N00200009	AFN3Y0	94	Did Kelly  like Avril_Lavigne?	No
q-and-a-exam	N00200051	AFN3Y0	47	Did Rena like exercising?	No
q-and-a-exam	N01203003	AFN3Y0	41	Did Dave a teacher?	No
q-and-a-exam	N00200001	AFN3Y0	76	did Dave like the_color_pink	No
q-and-a-exam	N00200009	AFN3Y0	95	Did Alex  like Avril_Lavigne?	No
q-and-a-exam	N00200031	AFN3Y0	38	Was Cindy born in Hsinchu?\t	--
q-and-a-exam	N00200025	AFN3Y0	59	kelly liked jogging , didn't  she?	No
q-and-a-exam	N00200029	AFN3Y0	42	Did  Mindy liked cats ?	No
q-and-a-exam	N00200054	AFN3Y0	94	Cindy like bike?	No
q-and-a-exam	N00200017	AFN3Y0	65	Some man who was born in Taoyuan  liked jogging, didn't he?'	No
q-and-a-exam	N00200034	AFN3Y0	76	Did Vicky like shopping?	No
q-and-a-exam	N01202004	AFN3Y0	60	Kelly was Shane's teacher, wasn't she?\t 	No
q-and-a-exam	N00200043	AFN3Y0	36	was Rena a truck driver?	No
q-and-a-exam	N00200009	AFN3Y0	96	Did Jeff  like Avril_Lavigne?	No
q-and-a-exam	N01202001	AFN3Y0	38	Mindy liked traveling,didn't she?	No
q-and-a-exam	N00200001	AFN3Y0	77	did Dr_Beab like the_color_pink	--
q-and-a-exam	N00200017	AFN3Y0	66	Some man who was born in Taoyuan liked jogging, didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	51	Vicky had a cat,didn't she?	No
q-and-a-exam	N00200054	AFN3Y0	95	Cindy like phone?	No
q-and-a-exam	N00200056	AFN3Y0	64	did Dr_Bean like color pink	No
q-and-a-exam	N00200025	AFN3Y0	60	Was Dr Bean a student in Minghsin University?\t	No
q-and-a-exam	N00200036	AFN3Y0	62	Was Jeff's father a truck_driver?	Yes
q-and-a-exam	N00200037	AFN3Y0	50	Rena was a Japanese, wasn't she?	No
q-and-a-exam	N01203003	AFN3Y0	42	Was Vicky a housewife?	No
q-and-a-exam	N00200051	AFN3Y0	48	Did Rena like Jiayi?	No
q-and-a-exam	N00200017	AFN3Y0	67	'Some man who was born in Japanese  liked jogging, didn't he?	No
q-and-a-exam	N00200001	AFN3Y0	78	did Cindy like the_color_pink	No
q-and-a-exam	N00200042	AFN3Y0	57	Neil liked swimming, didn't he?	No
q-and-a-exam	N00200009	AFN3Y0	97	Was Mindy born in 1994?\t	No
q-and-a-exam	N01202004	AFN3Y0	61	Shane was Kelly's teacher, wasn't he?\t 	No
q-and-a-exam	N00200025	AFN3Y0	61	shane lived in hukou,didn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	63	Was Mindy's father a truck_driver?	No
q-and-a-exam	N00200008	AFN3Y0	52	Vicky had a cats,didn't she?	No
q-and-a-exam	N00200054	AFN3Y0	96	Jeff like drinking?	No
q-and-a-exam	N00200043	AFN3Y0	37	Did Rena like jogging?	No
q-and-a-exam	N00200009	AFN3Y0	98	Was Alex born in 1994?\t	No
q-and-a-exam	N00200029	AFN3Y0	43	Was  Rena  liked cats ,wasn' she ?	Yes
q-and-a-exam	N01202001	AFN3Y0	39	Mindy had a cat ,didn't she?	No
q-and-a-exam	N00200009	AFN3Y0	99	Was Alex born in 1994?\t	No
q-and-a-exam	N00200025	AFN3Y0	62	Was Avril Lavigne a student in Minghsin University?\t	No
q-and-a-exam	N00200009	AFN3Y0	100	Was Alex born in 1994?\t	No
q-and-a-exam	N00200031	AFN3Y0	39	Did Shane like playing the piano?\t	No
q-and-a-exam	N00200001	AFN3Y0	79	did Kelly like the_color_pink	No
q-and-a-exam	N00200037	AFN3Y0	51	Rena was a_Japanese, wasn't she?	No
q-and-a-exam	N00200008	AFN3Y0	53	Vicky had cat,didn't she?	No
q-and-a-exam	N00200008	AFN3Y0	54	Vicky had cat,didn't she?	No
q-and-a-exam	N00200025	AFN3Y0	63	kelly lived in nantou,didn't she?	No
q-and-a-exam	N01202004	AFN3Y0	62	Mindy was Neil's mother, wasn't she?\t 	No
q-and-a-exam	N00200036	AFN3Y0	64	Was Vicky's father a truck_driver?	No
q-and-a-exam	N00200009	AFN3Y0	101	Was Jeff born in 1994?\t	No
q-and-a-exam	N00200056	AFN3Y0	65	did Dr_Bean like Hello_kitty	No
q-and-a-exam	N00200054	AFN3Y0	97	Jeff like shoping?	No
q-and-a-exam	N96200030	AFN3Y0	27	Was Mindy liked  sing?	No
q-and-a-exam	N01203003	AFN3Y0	43	Was Vicky studied at Mingsin_University?	Yes
q-and-a-exam	N00200031	AFN3Y0	40	Did Kelly like playing the piano?\t	No
q-and-a-exam	N00200017	AFN3Y0	68	Dave liked singing? 	No
q-and-a-exam	N00200009	AFN3Y0	102	Was Cindy born in 1994?\t	No
q-and-a-exam	N00200034	AFN3Y0	77	Did Rena like going_to_the_movies?	No
q-and-a-exam	N00200051	AFN3Y0	49	Did Neil like pizza?	No
q-and-a-exam	N00200017	AFN3Y0	69	Dave liked singing? 	No
q-and-a-exam	N00200054	AFN3Y0	98	Jeff like going?	No
q-and-a-exam	N00200037	AFN3Y0	52	Rena was a teacher, wasn't she?	No
q-and-a-exam	N01202001	AFN3Y0	40	Mindy lived in Juibei,didn't she?	No
q-and-a-exam	N00200009	AFN3Y0	103	Was Lextar born in 1994?\t	No
q-and-a-exam	N00200029	AFN3Y0	44	Was Dr_bean a teacher , wasn't he ?	Yes
q-and-a-exam	N00200025	AFN3Y0	64	neil lived in nantou,didn't he?	Yes
q-and-a-exam	N00200009	AFN3Y0	104	Was Lextar born in 1994?\t	No
q-and-a-exam	N00200031	AFN3Y0	41	Did Kelly like playing the piano?\t	No
q-and-a-exam	N01202004	AFN3Y0	63	Rena was Jeff's sister, wasn't she?\t 	No
q-and-a-exam	N00200017	AFN3Y0	70	Did Dave liked singing? 	No
q-and-a-exam	N00200036	AFN3Y0	65	Was Jeff born in America?	No
q-and-a-exam	N00200054	AFN3Y0	99	Jeff like tracing?	No
q-and-a-exam	N00200009	AFN3Y0	105	Was Rena born in 1994?\t	No
q-and-a-exam	N00200034	AFN3Y0	78	Did Alex like going_to_the_movie?	No
q-and-a-exam	N00200051	AFN3Y0	50	Did Rena like making friends?	No
q-and-a-exam	N00200037	AFN3Y0	53	Kelly was a teacher, wasn't she?	No
q-and-a-exam	N00200031	AFN3Y0	42	Did Kelly like playing the piano?\t	Yes
q-and-a-exam	N00200001	AFN3Y0	80	was Mindy's grandmother a farmer	No
q-and-a-exam	N00200056	AFN3Y0	66	did Mindy like the song memory	Yes
q-and-a-exam	N00200055	AFN3Y0	32		\N
q-and-a-exam	N00200036	AFN3Y0	66	Was Rena born in America?	No
q-and-a-exam	N00200009	AFN3Y0	106	Was Cindy born in 1994?\t	No
q-and-a-exam	N00200042	AFN3Y0	58	Kelly working in Lextar,didn't she?	Yes
q-and-a-exam	N00200037	AFN3Y0	54	vicky was a teacher, wasn't she?	No
q-and-a-exam	N01203003	AFN3Y0	44	Was Jeremy_Lin a superstar?	Yes
q-and-a-exam	N00200054	AFN3Y0	100	Cindy like blue?	No
q-and-a-exam	N00200001	AFN3Y0	81	was Jeff's grandmother a farmer	Yes
q-and-a-exam	N00200031	AFN3Y0	43	Did Neil like playing the piano?\t	No
q-and-a-exam	N00200008	AFN3Y0	55	Dave liked making friends, did't he?	Yes
q-and-a-exam	N01202001	AFN3Y0	41	Alex liked playing basketball,didn't he?	No
q-and-a-exam	N00200009	AFN3Y0	107	Was Shane born in 1994?\t	No
q-and-a-exam	N00200056	AFN3Y0	67	did Mindy like Hello_kitty	No
q-and-a-exam	N00200034	AFN3Y0	79	Did Alex like going_to_the_movies?	No
q-and-a-exam	N01202004	AFN3Y0	64	Vicky was Alex's mother, wasn't she?\t 	No
q-and-a-exam	N00200036	AFN3Y0	67	Was Vicky born in America?	No
q-and-a-exam	N00200051	AFN3Y0	51	Did Mindy have a cat?	No
q-and-a-exam	N00200037	AFN3Y0	55	Dr_Bean was a teacher, wasn't he?	Yes
q-and-a-exam	N96200030	AFN3Y0	28	Was Vicky had brother?	No
q-and-a-exam	N00200054	AFN3Y0	101	Mindy like cooler blue?	No
q-and-a-exam	N00200001	AFN3Y0	82	was Neil's grandmother a farmer	No
q-and-a-exam	N00200009	AFN3Y0	108	Was Dr_Bean born in 1994?\t	No
q-and-a-exam	N00200029	AFN3Y0	45	Did Cindy  lived in Jaiyi liked listening to music ?	Yes
q-and-a-exam	N00200031	AFN3Y0	44	Did Dr bean like playing the piano?\t	No
q-and-a-exam	N00200025	AFN3Y0	65	dave lived in hsinchu,didn't he?	Yes
q-and-a-exam	N00200008	AFN3Y0	56	Dave liked making friends, didn't he?	Yes
q-and-a-exam	N00200036	AFN3Y0	68	Was Alex born in America?	No
q-and-a-exam	N00200042	AFN3Y0	59	Kelly worked in Lextar,didn't she?	Yes
q-and-a-exam	N00200034	AFN3Y0	80	Did Dave like going_to_the_movies?	No
q-and-a-exam	N00200037	AFN3Y0	56	Neil was a teacher, wasn't he?	No
q-and-a-exam	N00200001	AFN3Y0	83	was Dave's grandmother a farmer	No
q-and-a-exam	N01203003	AFN3Y0	45	Was Avril_Lavigne is a singiner?	Yes
q-and-a-exam	N00200056	AFN3Y0	68	did Dr_Bean like Jeremy_Lin	No
q-and-a-exam	N00200055	AFN3Y0	33	Alex was born in Taoyuan, wasn't he?\t	No
q-and-a-exam	N00200054	AFN3Y0	102	shane liked cooler black?	No
q-and-a-exam	N00200009	AFN3Y0	109	Was Vicky born in 1994?\t	No
q-and-a-exam	N01202004	AFN3Y0	65	Dave was Vicky's father, wasn't he?\t 	No
q-and-a-exam	N01202001	AFN3Y0	42	Shane liked playing the piano,didn't he?	No
q-and-a-exam	N00200051	AFN3Y0	52	Did Mindy like basketball?	No
q-and-a-exam	N00200043	AFN3Y0	38	was shane a man,wasn't he?	Yes
q-and-a-exam	N00200031	AFN3Y0	45	Did Jeremy lin like playing the piano?\t	No
q-and-a-exam	N00200034	AFN3Y0	81	Did Shane like going_to_the_movies?	No
q-and-a-exam	N00200001	AFN3Y0	84	was Shane's grandmother a farmer	No
q-and-a-exam	N00200008	AFN3Y0	57	Vicky liked making friends, didn't she?	No
q-and-a-exam	N00200054	AFN3Y0	103	MIndy like cooler yellow?	No
q-and-a-exam	N00200037	AFN3Y0	57	Mindy was a teacher, wasn't she?	No
q-and-a-exam	N00200036	AFN3Y0	69	Was Jeff born in America?	No
q-and-a-exam	N00200055	AFN3Y0	34	Lextar was born in Taoyuan, wasn't he?\t	No
q-and-a-exam	N00200001	AFN3Y0	85	was Cindy's grandmother a farmer	No
q-and-a-exam	N01202004	AFN3Y0	66	Kelly was Dr.bean's mother, wasn't she?\t 	No
q-and-a-exam	N01202001	AFN3Y0	43	Shane liked traveling, didn't he?	No
q-and-a-exam	N00200056	AFN3Y0	69	did Mindy like Jeremy_Lin	No
q-and-a-exam	N00200042	AFN3Y0	60	Kelly worked in Lextar , didn't she?	Yes
q-and-a-exam	N00200055	AFN3Y0	35	Cindy was born in Taoyuan, wasn't she?\t	No
q-and-a-exam	N00200037	AFN3Y0	58	Shane was a teacher, wasn't he?	No
q-and-a-exam	N00200034	AFN3Y0	82	Did Mindy like going_to_the_movies?	No
q-and-a-exam	N00200043	AFN3Y0	39	Did Rena like jogging?	No
q-and-a-exam	N00200025	AFN3Y0	66	neil lived in jiayi,didn't he?	No
q-and-a-exam	N00200051	AFN3Y0	53	Did Rena work in America?	No
q-and-a-exam	N00200054	AFN3Y0	104	Lextar like coler black?	No
q-and-a-exam	N00200043	AFN3Y0	40	was Rena a truck driver?	No
q-and-a-exam	N00200017	AFN3Y0	71	Dave liked singing? 	No
q-and-a-exam	N00200009	AFN3Y0	110	Was Vicky born in pril_30th,_1994?	No
q-and-a-exam	N00200043	AFN3Y0	41	was Dave a truck driver?	No
q-and-a-exam	N01203003	AFN3Y0	46	Was Avril_Lavigne from America?	Yes
q-and-a-exam	N00200043	AFN3Y0	42	Did vicky like jogging?	No
q-and-a-exam	N00200029	AFN3Y0	46	Was Cindy's mother a famer , wasn't she ?	No
q-and-a-exam	N00200001	AFN3Y0	86	was Alex's grandmother a farmer	No
q-and-a-exam	N00200037	AFN3Y0	59	Dave was a teacher, wasn't he?	No
q-and-a-exam	N00200054	AFN3Y0	105	shane liked cooler yellow?	No
q-and-a-exam	N00200034	AFN3Y0	83	Did Jeff like going_to_the_movies?	No
q-and-a-exam	N00200036	AFN3Y0	70	Was Jeff a_japanese_interpreter?	No
q-and-a-exam	N00200043	AFN3Y0	43	Did Dave like jogging?	No
q-and-a-exam	N00200031	AFN3Y0	46	Did Hsiao ching teng like playing the piano?\t	No
q-and-a-exam	N01202001	AFN3Y0	44	Neil liked Japanese,didn't he?	No
q-and-a-exam	N01202004	AFN3Y0	67	Dr bean was Dave's teacher, wasn't he?\t 	Yes
q-and-a-exam	N00200042	AFN3Y0	61	Cindy working in Lextar , didn't she?	No
q-and-a-exam	N00200051	AFN3Y0	54	Did Jeff want to work in Taiwan?	No
q-and-a-exam	N00200001	AFN3Y0	87	was Mindy's mother a farmer	No
q-and-a-exam	N00200056	AFN3Y0	70	did Dr_Bean like Hsinchu	No
q-and-a-exam	N00200036	AFN3Y0	71	Was Rena a_japanese_interpreter?	No
q-and-a-exam	N00200025	AFN3Y0	67	mindy liked jogging,didn't she?	No
q-and-a-exam	N00200034	AFN3Y0	84	Did Neil like going_to_the_movies?	No
q-and-a-exam	N00200029	AFN3Y0	47	Was Shane born in 1994 ?	No
q-and-a-exam	N00200054	AFN3Y0	106	shan like purpol?	No
q-and-a-exam	N96200030	AFN3Y0	29	didn't Vicky have brother?	Yes
q-and-a-exam	N00200037	AFN3Y0	60	Rena was born in April_30th,_1994?	No
q-and-a-exam	N00200051	AFN3Y0	55	Did Neil like Avril Lavigne?	No
q-and-a-exam	N00200036	AFN3Y0	72	Was Vicky a_japanese_interpreter?	No
q-and-a-exam	N00200056	AFN3Y0	71	did Dr_Bean like Neil	No
q-and-a-exam	N01202001	AFN3Y0	45	Shane liked drawing,didn't he?	No
q-and-a-exam	N00200054	AFN3Y0	107	Jeff like cooler yellow?	No
q-and-a-exam	N00200034	AFN3Y0	85	Did Kelly like going_to_the_movies?	No
q-and-a-exam	N00200031	AFN3Y0	47	Did Cindy like Jeremy Lin?\t	No
q-and-a-exam	N00200001	AFN3Y0	88	was Jeff's mother a farmer	No
q-and-a-exam	N00200009	AFN3Y0	111	Vicky was a design assistant , wasn't he?\t	No
q-and-a-exam	N00200001	AFN3Y0	89	was Jeff's mother a farmer	No
q-and-a-exam	N00200025	AFN3Y0	68	mindy lived in hsinchu,didn't she?	Yes
q-and-a-exam	N01203003	AFN3Y0	47	Was Dave a girl?	No
q-and-a-exam	N00200042	AFN3Y0	62	Cindy worked in Lextar , didn't she?	No
q-and-a-exam	N00200054	AFN3Y0	108	Lextar like cooler pink?	No
q-and-a-exam	N00200056	AFN3Y0	72	did Dr_Bean like Vicky	No
q-and-a-exam	N00200008	AFN3Y0	58	Neil liked Hello kitty,didn't he?	No
q-and-a-exam	N96200030	AFN3Y0	30	Did Rena had mi_mi?	Yes
q-and-a-exam	N01202004	AFN3Y0	68	Dr bean was Alex's teacher, wasn't he?\t 	Yes
q-and-a-exam	N00200042	AFN3Y0	63	Mindy worked in Lextar , didn't she?	No
q-and-a-exam	N00200051	AFN3Y0	56	Did Rena work in Hukou?	No
q-and-a-exam	N00200009	AFN3Y0	112	Shane  was a design assistant , wasn't he?\t	No
q-and-a-exam	N00200054	AFN3Y0	109	Cindy like cooler pink?	No
q-and-a-exam	N00200056	AFN3Y0	73	did Dr_Bean like Alex	No
q-and-a-exam	N00200029	AFN3Y0	48	Was Alex like sleeping , wasn't he ?	Yes
q-and-a-exam	N00200001	AFN3Y0	90	was Dave's mother a farmer	No
q-and-a-exam	N00200025	AFN3Y0	69	mindy lived in taoyuan,didn't she?	No
q-and-a-exam	N01202004	AFN3Y0	69	Dr bean was Mindy's teacher, wasn't he?	Yes
q-and-a-exam	N00200029	AFN3Y0	49		\N
q-and-a-exam	N00200008	AFN3Y0	59	Neil liked Hello kitty, didn't he?	No
q-and-a-exam	N00200042	AFN3Y0	64	Vicky worked in Lextar , didn't she?	No
q-and-a-exam	N00200037	AFN3Y0	61	Shane had a cat,didn't he?	No
q-and-a-exam	N00200054	AFN3Y0	110	Mindy like cooler browing?	No
q-and-a-exam	N00200056	AFN3Y0	74	did Dr_Bean like Cindy	No
q-and-a-exam	N00200043	AFN3Y0	44	Did vicky like swimming?	No
q-and-a-exam	N00200051	AFN3Y0	57	Did Rena like listening to music?	No
q-and-a-exam	N01203003	AFN3Y0	48	Was Dave a father?	No
q-and-a-exam	N00200001	AFN3Y0	91	was Cindy's mother a farmer	No
q-and-a-exam	N01202001	AFN3Y0	46	Shane liked to eat pizza,didn't he?	No
q-and-a-exam	N01202004	AFN3Y0	70	Dr bean was Cindy's teacher, wasn't he?	Yes
q-and-a-exam	N00200054	AFN3Y0	111	Jeff like cooler growing	No
q-and-a-exam	N00200036	AFN3Y0	73	Was Vicky a truck_driver ?\t	No
q-and-a-exam	N00200009	AFN3Y0	113	Shane  was a  babysitter  , wasn't he?\t	No
q-and-a-exam	N00200056	AFN3Y0	75	did Dr_Bean like Dave	No
q-and-a-exam	N01202004	AFN3Y0	71	Dr bean was Jeff's teacher, wasn't he?	Yes
q-and-a-exam	N01203003	AFN3Y0	49	Was Rena a mother?	No
q-and-a-exam	N00200043	AFN3Y0	45	Did shane like swimming?	No
q-and-a-exam	N96200030	AFN3Y0	31	Was Mindy have cat?	No
q-and-a-exam	N00200034	AFN3Y0	86	Did Mindy like reading?	No
q-and-a-exam	N00200042	AFN3Y0	65	Rena worked in Lextar , didn't she?	No
q-and-a-exam	N00200001	AFN3Y0	92	was Vicky's mother a farmer	No
q-and-a-exam	N00200051	AFN3Y0	58	Did Rena like listening to music?	Yes
q-and-a-exam	N00200008	AFN3Y0	60	Neil liked the color pink, didn't he?	No
q-and-a-exam	N00200037	AFN3Y0	62	Shane had a cat, didn't he?	No
q-and-a-exam	N00200054	AFN3Y0	112	Lextar like cooler bowing?	No
q-and-a-exam	N00200036	AFN3Y0	74	Was Kelly a truck_driver ?	No
q-and-a-exam	N00200055	AFN3Y0	36		\N
q-and-a-exam	N00200025	AFN3Y0	70	kelly liked pizza,didn't she?	Yes
q-and-a-exam	N00200054	AFN3Y0	113	Lextar like cooler green?	No
q-and-a-exam	N01203003	AFN3Y0	50	Was Vicky a mother?	No
q-and-a-exam	N00200056	AFN3Y0	76	did Dr_Bean like Mindy	No
q-and-a-exam	N01202004	AFN3Y0	72	Dr bean was Neil's teacher, wasn't he?	Yes
q-and-a-exam	N00200034	AFN3Y0	87	Did Alex like reading?	No
q-and-a-exam	N00200037	AFN3Y0	63	Neil had a cat, didn't he?	No
q-and-a-exam	N00200042	AFN3Y0	66	Neil worked in Lextar , didn't he?	No
q-and-a-exam	N00200055	AFN3Y0	37	Lextar was born in Taoyuan, wasn't she?\t	No
q-and-a-exam	N00200001	AFN3Y0	93	was Kelly's mother a farmer	No
q-and-a-exam	N00200036	AFN3Y0	75	Was Rena a truck_driver ?	No
q-and-a-exam	N01203003	AFN3Y0	51	Was Jeff a father?	No
q-and-a-exam	N00200008	AFN3Y0	61	Neil liked swimming, didn't he?	No
q-and-a-exam	N00200029	AFN3Y0	50		\N
q-and-a-exam	N00200029	AFN3Y0	51		\N
q-and-a-exam	N01202004	AFN3Y0	73	Dr bean was Shane's teacher, wasn't he?	Yes
q-and-a-exam	N00200029	AFN3Y0	52		\N
q-and-a-exam	N00200025	AFN3Y0	71	neil liked pizza,didn't he?	No
q-and-a-exam	N00200055	AFN3Y0	38	Mindy was born in Taoyuan,wasn't she?\t	No
q-and-a-exam	N00200029	AFN3Y0	53		\N
q-and-a-exam	N00200051	AFN3Y0	59	Did Alex like cat?	No
q-and-a-exam	N00200034	AFN3Y0	88	Did Shane like reading?	No
q-and-a-exam	N00200043	AFN3Y0	46	Did Rena like swimming?	No
q-and-a-exam	N00200029	AFN3Y0	54		\N
q-and-a-exam	N00200001	AFN3Y0	94	was Rena's mother a farmer	No
q-and-a-exam	N00200042	AFN3Y0	67	Jeff worked in Lextar , didn't he?	No
q-and-a-exam	N01203003	AFN3Y0	52	Was Neil a father?	No
q-and-a-exam	N00200037	AFN3Y0	64	Kelly had a cat, didn't she?	No
q-and-a-exam	N00200029	AFN3Y0	55		\N
q-and-a-exam	N00200056	AFN3Y0	77	did Dr_Bean like Jeff	No
q-and-a-exam	N00200029	AFN3Y0	56		\N
q-and-a-exam	N96200030	AFN3Y0	32	Was Mindy teacher  Dr_Bean?	Yes
q-and-a-exam	N01202004	AFN3Y0	74	Dr bean was Lelly's teacher, wasn't he?	Yes
q-and-a-exam	N00200025	AFN3Y0	72	dave liked pazza,didn't he?	No
q-and-a-exam	N00200008	AFN3Y0	62	Vicky liked swimming, didn't she?	No
q-and-a-exam	N00200029	AFN3Y0	57		\N
q-and-a-exam	N00200055	AFN3Y0	39	Neil was a design assistant , wasn't he?\t	No
q-and-a-exam	N00200034	AFN3Y0	89	Did Rena like reading?	No
q-and-a-exam	N00200042	AFN3Y0	68	Alex worked in Lextar , didn't he?	No
q-and-a-exam	N00200029	AFN3Y0	58		\N
q-and-a-exam	N00200037	AFN3Y0	65	Mindy had a cat, didn't she?	No
q-and-a-exam	N00200055	AFN3Y0	40		\N
q-and-a-exam	N01203003	AFN3Y0	53	Was Kelly a mother?	No
q-and-a-exam	N00200055	AFN3Y0	41		\N
q-and-a-exam	N01202001	AFN3Y0	47	Mindy liked playing basketball,didn't she?	No
q-and-a-exam	N00200055	AFN3Y0	42	Alex was a design assistant , wasn't he?\t	Yes
q-and-a-exam	N01202004	AFN3Y0	75	Dr bean was kelly's teacher, wasn't he?	Yes
q-and-a-exam	N00200051	AFN3Y0	60	Did Mindy have a cat?	No
q-and-a-exam	N00200008	AFN3Y0	63	Vicky liked jogging, didn't she?	No
q-and-a-exam	N00200031	AFN3Y0	48	Cindy had a cat, didn't she?\t	No
q-and-a-exam	N00200043	AFN3Y0	47	Did kelly like swimming?	No
q-and-a-exam	N00200056	AFN3Y0	78	did Alex like Dave	No
q-and-a-exam	N00200042	AFN3Y0	69	Dave worked in Lextar , didn't he?	No
q-and-a-exam	N00200001	AFN3Y0	95	Was Rena had a cat	Yes
q-and-a-exam	N00200034	AFN3Y0	90	Did Neil like reading?	No
q-and-a-exam	N00200025	AFN3Y0	73	mindy liked pazza,didn't she?	No
q-and-a-exam	N96200030	AFN3Y0	33	Making_friend  was Jeff like?	Yes
q-and-a-exam	N00200036	AFN3Y0	76	Was Dr_Bean a truck_driver ?	No
q-and-a-exam	N01202004	AFN3Y0	76	Dr bean was Mindy's teacher, wasn't he?	Yes
q-and-a-exam	N00200037	AFN3Y0	66	Dave had a cat, didn't he?	No
q-and-a-exam	N01203003	AFN3Y0	54	Was Mindy a mother?	No
q-and-a-exam	N00200031	AFN3Y0	49	Alex had a cat, didn't he?\t	No
q-and-a-exam	N00200055	AFN3Y0	43	Vicky was a design assistant , wasn't she?\t	No
q-and-a-exam	N00200008	AFN3Y0	64	Vicky liked cat, didn't she?	No
q-and-a-exam	N00200055	AFN3Y0	44	Was Alex liked playing the piano ? 	No
q-and-a-exam	N00200034	AFN3Y0	91	Did Kelly like reading?	No
q-and-a-exam	N00200056	AFN3Y0	79	did Alex like Shane	No
q-and-a-exam	N00200001	AFN3Y0	96	did Rena had a cat	Yes
q-and-a-exam	N00200037	AFN3Y0	67	Alex had a cat, didn't he?	No
q-and-a-exam	N00200031	AFN3Y0	50	Mindy had a cat, didn't she?\t	No
q-and-a-exam	N00200025	AFN3Y0	74	shane liked pazza,didn't he?	No
q-and-a-exam	N00200043	AFN3Y0	48	Did cindy like swimming?	No
q-and-a-exam	N01202004	AFN3Y0	77	Jeremy Lin was Alex's teacher, wasn't he?	No
q-and-a-exam	N00200055	AFN3Y0	45	Cindy was a design assistant , wasn't she?	No
q-and-a-exam	N01203003	AFN3Y0	55	Was Dr_Bean a father?	No
q-and-a-exam	N00200055	AFN3Y0	46	Alex had a cat, didn't he? 	No
q-and-a-exam	N00200056	AFN3Y0	80	did Alex like Cindy	No
q-and-a-exam	N00200001	AFN3Y0	97	was Jeff's father a farmer	No
q-and-a-exam	N00200008	AFN3Y0	65	Cindy had a brother, didn't she?	No
q-and-a-exam	N96200030	AFN3Y0	34	Was Neil liked cat?	No
q-and-a-exam	N00200031	AFN3Y0	51	Shan had a cat, didn't he?\t	No
q-and-a-exam	N00200051	AFN3Y0	61	Did Rena live in Nantou?	No
q-and-a-exam	N00200055	AFN3Y0	47	Alex had a cat, didn't he?	No
q-and-a-exam	N00200054	AFN3Y0	114	Lextar like cooler chock	No
q-and-a-exam	N00200034	AFN3Y0	92	Did Cindy like reading?	No
q-and-a-exam	N00200056	AFN3Y0	81	did Alex like Mindy	No
q-and-a-exam	N00200025	AFN3Y0	75	neil liked jogging,didn't he?	Yes
q-and-a-exam	N00200008	AFN3Y0	66	Cindy had a sister, didn't she?	No
q-and-a-exam	N00200043	AFN3Y0	49	Did dave like swimming?	No
q-and-a-exam	N00200031	AFN3Y0	52	Shane had a cat, didn't he?\t	No
q-and-a-exam	N00200029	AFN3Y0	59		\N
q-and-a-exam	N00200051	AFN3Y0	62	Did Rena like studying English?	No
q-and-a-exam	N00200001	AFN3Y0	98	was Mindy's father a farmer	No
q-and-a-exam	N01203003	AFN3Y0	56	Was Shane a father?	No
q-and-a-exam	N01203003	AFN3Y0	57	Was Shane a father?	No
q-and-a-exam	N01202004	AFN3Y0	78	Jeremy Lin was Shane's teacher, wasn't he?	No
q-and-a-exam	N00200055	AFN3Y0	48	Avril Lavigne was a design assistant , wasn't she?	No
q-and-a-exam	N00200055	AFN3Y0	49	Alex liked singing, didn't she? 	No
q-and-a-exam	N00200008	AFN3Y0	67	Cindy had a sister, didn't she?	Yes
q-and-a-exam	N00200042	AFN3Y0	70	Kelly liked food , didn't she?	No
q-and-a-exam	N00200056	AFN3Y0	82	did Cindy like Dave	No
q-and-a-exam	N96200030	AFN3Y0	35	Did Jeff had sister?	No
q-and-a-exam	N00200025	AFN3Y0	76	mindy like jogging,didn't she?	No
q-and-a-exam	N00200054	AFN3Y0	115	Cindy like cooler chock	No
q-and-a-exam	N01202004	AFN3Y0	79	Jeremy Lin was Neil's teacher, wasn't he?	No
q-and-a-exam	N00200031	AFN3Y0	53	Jeff had a cat, didn't he?\t	No
q-and-a-exam	N00200051	AFN3Y0	63	Did Rena like the color pink?	Yes
q-and-a-exam	N00200055	AFN3Y0	50	Rena was a design assistant , wasn't she?	No
q-and-a-exam	N00200034	AFN3Y0	93	Did Cindy like jogging?	No
q-and-a-exam	N00200008	AFN3Y0	68	Kelly had a sister, didn't she?	Yes
q-and-a-exam	N00200042	AFN3Y0	71	Kelly was a woman, wasn't she?	Yes
q-and-a-exam	N00200029	AFN3Y0	60	Was Cindy like jogging, wasn't she ?	No
q-and-a-exam	N00200055	AFN3Y0	51	Avril_Lavigne was Shane's teacher, wasn't he?	No
q-and-a-exam	N01203003	AFN3Y0	58	Did Jeff a farmer?	No
q-and-a-exam	N00200025	AFN3Y0	77	dave like jogging,didn't he?	No
q-and-a-exam	N96200030	AFN3Y0	36	Did Mandy had cat	No
q-and-a-exam	N00200043	AFN3Y0	50	Did mindy like swimming?	No
q-and-a-exam	N00200056	AFN3Y0	83	did Mindy like Dave	No
q-and-a-exam	N00200055	AFN3Y0	52	Avril_Lavigne	--
q-and-a-exam	N00200055	AFN3Y0	53	Cindy was a design assistant , wasn't she?	No
q-and-a-exam	N00200034	AFN3Y0	94	Did Kelly like jogging?	No
q-and-a-exam	N01202004	AFN3Y0	80	Jeremy Lin was Rena's teacher, wasn't he?	No
q-and-a-exam	N00200001	AFN3Y0	99	was Shane's father a farmer	No
q-and-a-exam	N00200055	AFN3Y0	54	Dave  was Shane's teacher, wasn't he?	No
q-and-a-exam	N00200025	AFN3Y0	78	kelly liked jogging,didn't she?	No
q-and-a-exam	N01202004	AFN3Y0	81	Jeremy Lin was Kelly's teacher, wasn't he?	No
q-and-a-exam	N00200008	AFN3Y0	69	Dave had a sister, didn't she?	No
q-and-a-exam	N96200030	AFN3Y0	37	Did Jeff had brother?	Yes
q-and-a-exam	N00200055	AFN3Y0	55	1994 was Shane's teacher, wasn't he?	No
q-and-a-exam	N00200031	AFN3Y0	54	Did Alex like jogging?\t	No
q-and-a-exam	N00200034	AFN3Y0	95	Did Rena like jogging?	No
q-and-a-exam	N00200056	AFN3Y0	84	did Mindy like Shane	No
q-and-a-exam	N00200029	AFN3Y0	61	was Shane lived in Hischu ,wasn't he ?	No
q-and-a-exam	N00200042	AFN3Y0	72	Kelly was Dave's mother, wasn't she?	No
q-and-a-exam	N00200001	AFN3Y0	100	was Neils father a farmer	No
q-and-a-exam	N01202004	AFN3Y0	82	Jeremy Lin was Alex's teacher, wasn't he?	No
q-and-a-exam	N00200008	AFN3Y0	70	Dave had a sister, didn't he?	No
q-and-a-exam	N00200055	AFN3Y0	56	Dr_Bean  was Shane's teacher, wasn't he?	No
q-and-a-exam	N96200030	AFN3Y0	38	Did Mandy had cat?	No
q-and-a-exam	N01203003	AFN3Y0	59	Was Jeremy_Lin a father?	No
q-and-a-exam	N00200043	AFN3Y0	51	Did jeff like swimming?	No
q-and-a-exam	N00200042	AFN3Y0	73	Cindy was Dave's mother, wasn't she?	No
q-and-a-exam	N00200056	AFN3Y0	85	did Mindy like Alex	No
q-and-a-exam	N00200034	AFN3Y0	96	Did Lextar like jogging?	No
q-and-a-exam	N00200056	AFN3Y0	86	did Dr_Bean like Mindy	No
q-and-a-exam	N00200029	AFN3Y0	62	was Cindy a teacher , wasn't he 	No
q-and-a-exam	N00200029	AFN3Y0	63	was Cindy a teacher , wasn't he 	No
q-and-a-exam	N00200043	AFN3Y0	52	Did vicky like swimming?	No
q-and-a-exam	N00200034	AFN3Y0	97	Did Vicky likejogging?	No
q-and-a-exam	N00200034	AFN3Y0	98	Did Kelly like reading?	No
q-and-a-exam	N00200034	AFN3Y0	99	Did Rena like reading?	No
q-and-a-exam	N00200034	AFN3Y0	100	Did Shane like reading?	No
q-and-a-exam	N00200034	AFN3Y0	101	Did Alex like reading?	No
q-and-a-exam	N00200034	AFN3Y0	102	Did Jeff like going_to_the_movies?	No
q-and-a-exam	N00200034	AFN3Y0	103	Did Mindy like reading?	No
q-and-a-exam	N00200034	AFN3Y0	104	Did Shane like going_to_the_movies?	No
q-and-a-exam	N00200034	AFN3Y0	105	Did Alex like going_to_the_movies?	No
q-and-a-exam	N00200034	AFN3Y0	106	Did Mindy like going_to_the_movies?	No
q-and-a-exam	N00200034	AFN3Y0	107	Did Dave like going_to_the_movies?	No
q-and-a-exam	N00200034	AFN3Y0	108	Did Alex like going_to_the_movie?	No
q-and-a-exam	N00200034	AFN3Y0	109	Did Lextar live in Jiayi?	No
q-and-a-exam	N00200034	AFN3Y0	110	Did Lextar like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	111	Did Neil like shopping?	No
q-and-a-exam	N00200034	AFN3Y0	112	Did Kelly like shopping?	No
q-and-a-exam	N00200034	AFN3Y0	113	Did Alex like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	114	Did Shane like playing the piano?	No
q-and-a-exam	N00200034	AFN3Y0	115	Did Vicky like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	116	Did Neil like making_friends?	No
q-and-a-exam	N00200034	AFN3Y0	117	Did Cindy like shopping?	No
q-and-a-exam	N00200034	AFN3Y0	118	Did Vicky live in Jiayi?	No
q-and-a-exam	N00200034	AFN3Y0	119	Did Vicky like hello_kitty?	No
q-and-a-exam	N00200025	AFN3Y0	79	kelly lived in nantou,didn't she?	No
q-and-a-exam	N00200043	AFN3Y0	53		\N
q-and-a-exam	N00200043	AFN3Y0	54	Did dave like swimming?	No
q-and-a-exam	N00200025	AFN3Y0	80	dave live in nantou,didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	81	mindy lived in hukou,didn't she?	No
q-and-a-exam	N00200025	AFN3Y0	82	neil lived in hokou,didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	83	kelly live in hokou,didn't she?	No
q-and-a-exam	N00200025	AFN3Y0	84	neil live in japan,didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	85	mindy lived in japan,didn't she?	No
q-and-a-exam	N00200025	AFN3Y0	86	dave live in japan,didn't he?	No
q-and-a-exam	N00200025	AFN3Y0	87	kelly live in japan,didn't she?	No
q-and-a-exam	N00200001	AFN3Y0	101	was Shane's father a farmer	No
q-and-a-exam	N00200001	AFN3Y0	102	was Mindy's father a farmer	No
q-and-a-exam	N00200001	AFN3Y0	103	was Jeff's father a farmer	No
dickson	193001	GL00006	1		\N
dickson	193001	GL00006	2	Who told Dee that Dee was little	--
dickson	193001	GL00006	3		\N
dickson	193001	GL00006	4	Was Dee little?	Yes
\.


--
-- Data for Name: wh; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY wh (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
candidate	193001	AFN2N0	0	0	12	8
jackson	N01200044	AFN2N0	0	0	12	8
candidate	N01200044	AFN2N0	0	0	12	8
candidate	N01200029	AFN2N0	0	0	12	8
candidate	N01200056	AFN2N0	0	0	12	8
candidate	N01200041	AFN2N0	0	0	12	8
candidate	N01200024	AFN2N0	0	0	12	8
candidate	N01200009	AFN2N0	0	0	12	8
candidate	V9941012	FLA0007	0	0	12	8
candidate	N02202114	AFN2N0	0	0	12	8
candidate	N02202112	AFN2N0	0	0	12	8
candidate	N02202101	AFN2N0	0	0	12	8
candidate	N01200005	AFN2N0	0	0	12	8
candidate	N01200058	AFN2N0	0	0	12	8
candidate	N02202104	AFN2N0	0	0	12	8
candidate	N01200021	AFN2N0	0	0	12	8
candidate	N01200035	AFN2N0	0	0	12	8
candidate	N02202106	AFN2N0	0	0	12	8
candidate	N02202111	AFN2N0	0	0	12	8
candidate	N00082007	AFN2N0	0	0	12	8
candidate	N99080092	AFN2N0	0	0	12	8
candidate	N01200033	AFN2N0	0	0	12	8
candidate	B00200054	AFN2N0	0	0	12	8
candidate	N01200023	AFN2N0	0	0	12	8
candidate	N01200014	AFN2N0	0	0	12	8
candidate	N01200010	AFN2N0	0	0	12	8
candidate	N97120058	AFN2N0	0	0	12	8
candidate	N01200025	AFN2N0	0	0	12	8
candidate	N01200016	AFN2N0	0	0	12	8
jackson	U0222133	GL00006	0	0	12	8
careers	N01200033	AFN2N0	0	0	12	8
careers	N00120056	AFN300	0	0	12	8
candidate	V9741064	FLA0006	0	0	12	8
intros	193001	AFN3Y0	1	0	11	8
q-and-a-3	N00200001	AFN3Y0	0	0	12	8
q-and-a-3	N00200034	AFN3Y0	1	1	12	8
q-and-a	N00200056	AFN3Y0	5	5	12	8
q-and-a	N00200056	AFN300	0	0	12	8
q-and-a	N00200008	AFN300	0	0	12	8
q-and-a-2	N00200055	AFN3Y0	13	5	10	6
q-and-a	N00200029	AFN3Y0	5	5	12	8
q-and-a	N00200001	AFN300	0	0	12	8
q-and-a	N00200036	AFN300	0	0	12	8
q-and-a-2	N00200034	AFN3Y0	6	5	11	8
q-and-a	N00200037	AFN3Y0	5	5	12	8
q-and-a	N00200001	AFN3Y0	5	5	12	8
q-and-a	N00200036	AFN3Y0	7	5	12	8
q-and-a-3	193001	AFN3Y0	0	0	12	8
q-and-a-3	N00200042	AFN3Y0	0	0	12	8
q-and-a	N00200034	AFN3Y0	12	5	11	7
q-and-a	N00200017	AFN300	0	0	12	8
q-and-a-2	N00200008	AFN3Y0	10	5	8	8
q-and-a-2	N00200017	AFN3Y0	5	5	12	8
q-and-a-2	N96200030	AFN3Y0	0	0	12	8
q-and-a-3	N00200056	AFN3Y0	0	0	12	8
q-and-a	N00200030	AFN3Y0	5	5	12	8
q-and-a	N00200055	AFN3Y0	5	5	12	8
q-and-a	N00200042	AFN3Y0	6	5	12	8
q-and-a	N00200009	AFN3Y0	0	0	12	8
q-and-a	N00200017	AFN3Y0	5	5	12	8
q-and-a	N00200034		5	5	12	8
q-and-a	N00200025	AFN3Y0	6	5	12	8
q-and-a-3	N00200036	AFN3Y0	2	2	12	8
q-and-a-2	N01202001	AFN3Y0	5	3	12	7
q-and-a-2	N01202004	AFN3Y0	1	0	12	8
q-and-a	N01203003	AFN3Y0	5	5	12	8
q-and-a-2	N01203003	AFN3Y0	0	0	12	8
q-and-a-2	N00200029	AFN3Y0	10	3	9	8
q-and-a	N00200051	AFN3Y0	5	5	12	8
q-and-a	N96200030	AFN3Y0	6	5	12	8
q-and-a	N01202001	AFN3Y0	0	0	12	8
q-and-a	N00200054	AFN3Y0	13	5	12	8
q-and-a-2	N00200030	AFN3Y0	3	3	12	8
q-and-a-2	N00200054	AFN3Y0	0	0	12	8
q-and-a	N01202004	AFN3Y0	6	5	12	8
q-and-a	193001	AFN3Y0	41	3	8	8
q-and-a	N01202004	AFN300	0	0	12	8
q-and-a-3	N00200017	AFN3Y0	2	1	11	8
q-and-a	N00200043	AFN3Y0	5	5	12	8
q-and-a	N00200043	AFN300	0	0	12	8
q-and-a	N00200008	AFN3Y0	14	5	12	8
q-and-a-2	N00200043	AFN3Y0	3	3	12	8
q-and-a-3	N01203003	AFN3Y0	1	1	12	8
q-and-a-2	193001	AFN3Y0	5	4	11	8
q-and-a-2	N00200056	AFN3Y0	0	0	12	8
q-and-a-2	N00200001	AFN3Y0	0	0	12	8
q-and-a-3	N96200030	AFN3Y0	0	0	12	8
q-and-a-exam	193001	AFN3Y0	0	0	1200	800
q-and-a-3	N00200043	AFN3Y0	10	3	9	8
q-and-a-3	N00200009	AFN3Y0	0	0	1200	800
q-and-a-3	N00200037	AFN3Y0	0	0	1200	800
q-and-a-3	N00200029	AFN3Y0	6	5	11	8
q-and-a-3	N00200008	AFN3Y0	0	0	12	8
q-and-a-3	N00200025	AFN3Y0	0	0	12	8
q-and-a-3	N01202004	AFN3Y0	6	5	11	8
q-and-a-3	N00200030	AFN3Y0	4	5	12	8
q-and-a-3	N00200031	AFN3Y0	0	0	12	8
q-and-a-exam	N00200001	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200009	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200030	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200036	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200054	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200031	AFN3Y0	7	2	1196	800
q-and-a-exam	N00200025	AFN3Y0	5	2	1200	800
q-and-a-exam	N01202004	AFN3Y0	16	16	1200	800
q-and-a-exam	N00200029	AFN3Y0	35	13	1185	794
q-and-a-exam	N00200042	AFN3Y0	15	4	1194	798
q-and-a-exam	N01202001	AFN3Y0	4	3	1199	800
q-and-a-exam	N00200056	AFN3Y0	10	6	1196	800
q-and-a-exam	N00200055	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200034	AFN3Y0	0	0	1200	800
q-and-a-exam	N00200037	AFN3Y0	4	2	1200	799
q-and-a-exam	N01203003	AFN3Y0	6	3	1199	800
q-and-a-exam	N96200030	AFN3Y0	5	2	1198	800
q-and-a-exam	N00200017	AFN3Y0	5	3	1200	799
q-and-a-exam	N00200008	AFN3Y0	18	10	1197	799
q-and-a-exam	N00200043	AFN3Y0	3	1	1200	800
q-and-a-exam	N00200051	AFN3Y0	7	4	1200	799
dickson	193001	GL00006	1	0	12	8
\.


--
-- Data for Name: word; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY word (exercise, string) FROM stdin;
candidate	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>Barbara <TR><TD>Dr Bean <TR><TD>Eva <TR><TD>Fast-Track <TR><TD>Tadeusz\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>ambitious bad competitive confident difficult each fast few five good hard honest local long next other outgoing past patient Polish poor possible realistic safe successful true unable various\n<TR><TD>Determiner:<TD>a the\n<TR><TD>Noun:<TD>ability administration aim club company training course department director effort sales experience hand head job judgement learner lot main market material pair people personality respect result risk sales share system sales team term thing time top way year\n<TR><TD>Proper Noun:<TD>Barbara Dr Bean Eva Fast-Track Tadeusz\n<TR><TD>Verb:<TD>allow for can become choose enjoy expand feel improve increase go have help know lead must think want\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> ambitious a ability administration aim allow\n<TR><TD>B:<TD> bad become\n<TR><TD>C:<TD> competitive confident club company course can choose\n<TR><TD>D:<TD> difficult department director\n<TR><TD>E:<TD> each effort experience enjoy expand\n<TR><TD>F:<TD> fast few five for feel\n<TR><TD>G:<TD> good go\n<TR><TD>H:<TD> hard honest hand head have help\n<TR><TD>I:<TD> improve increase\n<TR><TD>J:<TD> job judgement\n<TR><TD>K:<TD> know\n<TR><TD>L:<TD> local long learner lot lead\n<TR><TD>M:<TD> main market material must\n<TR><TD>N:<TD> next\n<TR><TD>O:<TD> other outgoing\n<TR><TD>P:<TD> past patient poor possible pair people personality\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> realistic respect result risk\n<TR><TD>S:<TD> safe successful sales sales share system sales\n<TR><TD>T:<TD> true the training team term thing time top think\n<TR><TD>U:<TD> unable\n<TR><TD>V:<TD> various\n<TR><TD>W:<TD> way want\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> year\n<TR><TD>Z:<TD>\n</TABLE>
intros	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>America <TR><TD>Applied_Foreign_Languages <TR><TD>Avril_Lavigne <TR><TD>Dr_Bean <TR><TD>Hello_Kitty <TR><TD>Mi_Mi <TR><TD>Minghsin_University <TR><TD>Music <TR><TD>Rena <TR><TD>The_Color_Pink\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>auxiliary verbs:<TD>did didn't was wasn't were weren't\n<TR><TD>adjectives:<TD>\n<TR><TD>interesting verbs:<TD>born\n<TR><TD>other verbs:<TD>had have wanted want\n<TR><TD>WH words:<TD>who what which whose where when\n<TR><TD>object_names:<TD>teacher student students\n<TR><TD>class_names:<TD>thing things person persons people man men woman women\n<TR><TD>pronouns:<TD>he she it they\n<TR><TD>prepositions:<TD>in by to\n<TR><TD>determiners:<TD>zero every all some several a no the most many few\n<TR><TD>possessives:<TD>'s of\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> all a\n<TR><TD>B:<TD> born by but\n<TR><TD>C:<TD>\n<TR><TD>D:<TD> did didn't\n<TR><TD>E:<TD> every\n<TR><TD>F:<TD> few\n<TR><TD>G:<TD>\n<TR><TD>H:<TD> he had have\n<TR><TD>I:<TD> it in\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD>\n<TR><TD>M:<TD> man men most many\n<TR><TD>N:<TD> no\n<TR><TD>O:<TD> of\n<TR><TD>P:<TD> person persons people\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD>\n<TR><TD>S:<TD> student students she some several\n<TR><TD>T:<TD> teacher thing things they to the\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> woman women who what which whose where when wanted want worked work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD> zero\n</TABLE>
q-and-a-2	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>1994 <TR><TD>Alex <TR><TD>America <TR><TD>Applied_Foreign_Languages <TR><TD>April_30th,_1994 <TR><TD>Avril_Lavigne <TR><TD>Cindy <TR><TD>Dr_Bean <TR><TD>English <TR><TD>Hsinchu <TR><TD>Jeff <TR><TD>Jiayi <TR><TD>Minghsin_University <TR><TD>Rena <TR><TD>Taoyuan <TR><TD>Vicky\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>auxiliary verbs:<TD>did didn't was wasn't were weren't\n<TR><TD>adjectives:<TD>\n<TR><TD>interesting verbs:<TD>born liked like lived live\n<TR><TD>other verbs:<TD>had have wanted want\n<TR><TD>WH words:<TD>who what which whose where when\n<TR><TD>object_names:<TD>teacher student students mother father sister sisters brother brothers_and_sisters cat cats music hello_kitty the_color_pink mi_mi basketball exercising drawing listening_to_music reading travel grandmother farmer career_woman truck_driver design_assistant 24 playing_the_piano babysitter shopping weekends\n<TR><TD>class_names:<TD>thing things person persons people man men woman women\n<TR><TD>pronouns:<TD>he she it they\n<TR><TD>prepositions:<TD>in by to\n<TR><TD>determiners:<TD>zero every all some several a no the most many few\n<TR><TD>possessives:<TD>'s of\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> all a\n<TR><TD>B:<TD> brother brothers_and_sisters basketball babysitter born by but\n<TR><TD>C:<TD> cat cats career_woman\n<TR><TD>D:<TD> drawing design_assistant did didn't\n<TR><TD>E:<TD> exercising every\n<TR><TD>F:<TD> father farmer few\n<TR><TD>G:<TD> grandmother\n<TR><TD>H:<TD> hello_kitty he had have\n<TR><TD>I:<TD> it in\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> listening_to_music liked like lived live\n<TR><TD>M:<TD> mother music mi_mi man men most many\n<TR><TD>N:<TD> no\n<TR><TD>O:<TD> of\n<TR><TD>P:<TD> playing_the_piano person persons people\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> reading\n<TR><TD>S:<TD> student students sister sisters shopping she studied study some several\n<TR><TD>T:<TD> teacher the_color_pink travel truck_driver thing things they to the\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> weekends woman women who what which whose where when wanted want worked work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD> zero\n</TABLE>
q-and-a	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>1994 <TR><TD>Alex <TR><TD>America <TR><TD>Applied_Foreign_Languages <TR><TD>April_30th,_1994 <TR><TD>Avril_Lavigne <TR><TD>Cindy <TR><TD>Dr_Bean <TR><TD>English <TR><TD>Hsinchu <TR><TD>Jeff <TR><TD>Jiayi <TR><TD>Minghsin_University <TR><TD>Rena <TR><TD>Taoyuan\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>auxiliary verbs:<TD>did didn't was wasn't were weren't\n<TR><TD>adjectives:<TD>\n<TR><TD>interesting verbs:<TD>born liked like lived live\n<TR><TD>other verbs:<TD>had have wanted want\n<TR><TD>WH words:<TD>who what which whose where when\n<TR><TD>object_names:<TD>teacher student students mother father sister brother brothers_and_sisters cat cats music hello_kitty the_color_pink mi_mi basketball exercise drawing listening_to_music reading travel grandmother farmer career_woman truck_driver design_assistant 24 playing_the_piano\n<TR><TD>class_names:<TD>thing things person persons people man men woman women\n<TR><TD>pronouns:<TD>he she it they\n<TR><TD>prepositions:<TD>in by to\n<TR><TD>determiners:<TD>zero every all some several a no the most many few\n<TR><TD>possessives:<TD>'s of\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> all a\n<TR><TD>B:<TD> brother brothers_and_sisters basketball born by but\n<TR><TD>C:<TD> cat cats career_woman\n<TR><TD>D:<TD> drawing design_assistant did didn't\n<TR><TD>E:<TD> exercise every\n<TR><TD>F:<TD> father farmer few\n<TR><TD>G:<TD> grandmother\n<TR><TD>H:<TD> hello_kitty he had have\n<TR><TD>I:<TD> it in\n<TR><TD>J:<TD>\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> listening_to_music liked like lived live\n<TR><TD>M:<TD> mother music mi_mi man men most many\n<TR><TD>N:<TD> no\n<TR><TD>O:<TD> of\n<TR><TD>P:<TD> playing_the_piano person persons people\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> reading\n<TR><TD>S:<TD> student students sister she studied study some several\n<TR><TD>T:<TD> teacher the_color_pink travel truck_driver thing things they to the\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> woman women who what which whose where when wanted want worked work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD> zero\n</TABLE>
q-and-a-3	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>1994 <TR><TD>America <TR><TD>Applied_Foreign_Languages <TR><TD>April_30th,_1994 <TR><TD>Avril_Lavigne <TR><TD>Dave <TR><TD>Dr_Bean <TR><TD>English <TR><TD>Gemitek <TR><TD>Hsiao_Ching-teng <TR><TD>Hsinchu <TR><TD>Hukou <TR><TD>Japanese <TR><TD>Jeremy_Lin <TR><TD>Jiayi <TR><TD>Kelly <TR><TD>Lextar <TR><TD>Mindy <TR><TD>Minghsin_University <TR><TD>Nantou <TR><TD>Neil <TR><TD>Shane\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>auxiliary verbs:<TD>did didn't was wasn't were weren't\n<TR><TD>adjectives:<TD>shy reserved good nice busy\n<TR><TD>interesting verbs:<TD>born liked like lived live\n<TR><TD>other verbs:<TD>had have wanted want\n<TR><TD>WH words:<TD>who what which whose where when\n<TR><TD>object_names:<TD>teacher student students mother father sister sisters brother brothers_and_sisters cat cats music hello_kitty the_color_pink mi_mi basketball exercising drawing listening_to_music reading travel grandmother farmer career_woman truck_driver design_assistant 24 playing_the_piano babysitter shopping weekends the_tv_program_discovery the_song_memory going_to_the_movies a_japanese_interpreter pizza watching_tv a_dietitian 27 non-commissioned_officer jogging swimming the_military 21 christian singing making_friends\n<TR><TD>class_names:<TD>thing things person persons people man men woman women\n<TR><TD>pronouns:<TD>he she it they\n<TR><TD>prepositions:<TD>in by as to\n<TR><TD>determiners:<TD>zero every all some several a no the most many few\n<TR><TD>possessives:<TD>'s of\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> a_japanese_interpreter a_dietitian as all a\n<TR><TD>B:<TD> brother brothers_and_sisters basketball babysitter born busy by but\n<TR><TD>C:<TD> cat cats career_woman christian\n<TR><TD>D:<TD> drawing design_assistant did didn't\n<TR><TD>E:<TD> exercising every\n<TR><TD>F:<TD> father farmer few\n<TR><TD>G:<TD> grandmother going_to_the_movies good\n<TR><TD>H:<TD> hello_kitty he had have\n<TR><TD>I:<TD> it in\n<TR><TD>J:<TD> jogging\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> listening_to_music liked like lived live\n<TR><TD>M:<TD> mother music mi_mi making_friends man men most many\n<TR><TD>N:<TD> non-commissioned_officer nice no\n<TR><TD>O:<TD> of\n<TR><TD>P:<TD> playing_the_piano pizza person persons people\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> reading reserved\n<TR><TD>S:<TD> student students sister sisters shopping swimming singing shy she studied study some several\n<TR><TD>T:<TD> teacher the_color_pink travel truck_driver the_tv_program_discovery the_song_memory the_military thing things they to the\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> weekends watching_tv woman women who what which whose where when wanted want worked work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD> zero\n</TABLE>
q-and-a-exam	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>1994 <TR><TD>Alex <TR><TD>America <TR><TD>Applied_Foreign_Languages <TR><TD>April_30th,_1994 <TR><TD>Avril_Lavigne <TR><TD>Cindy <TR><TD>Dave <TR><TD>Dr_Bean <TR><TD>English <TR><TD>Gemitek <TR><TD>Hsiao_Ching-teng <TR><TD>Hsinchu <TR><TD>Hukou <TR><TD>Japanese <TR><TD>Jeff <TR><TD>Jeremy_Lin <TR><TD>Jiayi <TR><TD>Kelly <TR><TD>Lextar <TR><TD>Mindy <TR><TD>Minghsin_University <TR><TD>Nantou <TR><TD>Neil <TR><TD>Rena <TR><TD>Shane <TR><TD>Taiwan <TR><TD>Taoyuan <TR><TD>Vicky\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>auxiliary verbs:<TD>did didn't was wasn't were weren't\n<TR><TD>adjectives:<TD>shy reserved good nice busy\n<TR><TD>interesting verbs:<TD>born liked like lived live\n<TR><TD>other verbs:<TD>had have wanted want studied study worked work\n<TR><TD>WH words:<TD>who what which whose where when\n<TR><TD>object_names:<TD>teacher student students mother father sister sisters brother brothers_and_sisters cat cats music hello_kitty the_color_pink mi_mi basketball exercising drawing listening_to_music reading travel grandmother farmer career_woman truck_driver design_assistant 24 playing_the_piano babysitter shopping weekends the_tv_program_discovery the_song_memory going_to_the_movies a_japanese_interpreter pizza watching_tv a_dietitian 27 non-commissioned_officer jogging swimming the_military 21 christian singing making_friends\n<TR><TD>class_names:<TD>thing things person persons people man men woman women\n<TR><TD>pronouns:<TD>he she it they\n<TR><TD>prepositions:<TD>in by as to\n<TR><TD>determiners:<TD>zero every all some several a no the most many few\n<TR><TD>possessives:<TD>'s of\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> a_japanese_interpreter a_dietitian as all a\n<TR><TD>B:<TD> brother brothers_and_sisters basketball babysitter born busy by but\n<TR><TD>C:<TD> cat cats career_woman christian\n<TR><TD>D:<TD> drawing design_assistant did didn't\n<TR><TD>E:<TD> exercising every\n<TR><TD>F:<TD> father farmer few\n<TR><TD>G:<TD> grandmother going_to_the_movies good\n<TR><TD>H:<TD> hello_kitty he had have\n<TR><TD>I:<TD> it in\n<TR><TD>J:<TD> jogging\n<TR><TD>K:<TD>\n<TR><TD>L:<TD> listening_to_music liked like lived live\n<TR><TD>M:<TD> mother music mi_mi making_friends man men most many\n<TR><TD>N:<TD> non-commissioned_officer nice no\n<TR><TD>O:<TD> of\n<TR><TD>P:<TD> playing_the_piano pizza person persons people\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> reading reserved\n<TR><TD>S:<TD> student students sister sisters shopping swimming singing shy she studied study some several\n<TR><TD>T:<TD> teacher the_color_pink travel truck_driver the_tv_program_discovery the_song_memory the_military thing things they to the\n<TR><TD>U:<TD>\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> weekends watching_tv woman women who what which whose where when wanted want worked work\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD>\n<TR><TD>Z:<TD> zero\n</TABLE>
dickson	<UL>\n<LI><TABLE><CAPTION><H3>Names:</H3>\n<TR><TD>alf <TR><TD>dee\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Other words (classified):</H3>\n<TR><TD>Adjective:<TD>bad better first little mad next none several slow two hard right same\n<TR><TD>Adverb:<TD>along away because before but differently down ever finally here just now on out probably so then there too well\n<TR><TD>Conjunction:<TD>and if\n<TR><TD>Determiner:<TD>a an my no some that theirs these the\n<TR><TD>Noun:<TD>apprentice dad 80 end family graduation guy guys jobs kind knack life man men men's monday money nights position pound raise school ship stuff superintendent supervisor things time top transformer uncle way week weeks word work\n<TR><TD>Proper Noun:<TD>alf dee\n<TR><TD>Preposition:<TD>about at for from like of than to with\n<TR><TD>Pronoun:<TD>he i i'm it it's me myself they us we you you're who\n<TR><TD>Relative Pronoun:<TD>that\n<TR><TD>Verb:<TD>are be been become can did didn't do doing done don't found get getting go got had have hired. interviewing is know laughs lift like look made making need needed proving said see started take taking think thought told took was went were would wouldn't\n</TABLE>\n\n<LI><TABLE><CAPTION><H3>Words (in alphabetical order):</H3>\n<TR><TD>A:<TD> along away and a an apprentice alf about at are\n<TR><TD>B:<TD> bad better because before but be been become\n<TR><TD>C:<TD> can\n<TR><TD>D:<TD> differently down dad dee did didn't do doing done don't\n<TR><TD>E:<TD> ever end\n<TR><TD>F:<TD> first finally family for from found\n<TR><TD>G:<TD> graduation guy guys get getting go got\n<TR><TD>H:<TD> hard here he had have hired.\n<TR><TD>I:<TD> if i i'm it it's interviewing is\n<TR><TD>J:<TD> just jobs\n<TR><TD>K:<TD> kind knack know\n<TR><TD>L:<TD> little life like laughs lift like look\n<TR><TD>M:<TD> mad my man men men's monday money me myself made making\n<TR><TD>N:<TD> next none now no nights need needed\n<TR><TD>O:<TD> on out of\n<TR><TD>P:<TD> probably position pound proving\n<TR><TD>Q:<TD>\n<TR><TD>R:<TD> right raise\n<TR><TD>S:<TD> several slow same so some school ship stuff superintendent supervisor said see started\n<TR><TD>T:<TD> two then there too that theirs these the things time top transformer than to they that take taking think thought told took\n<TR><TD>U:<TD> uncle us\n<TR><TD>V:<TD>\n<TR><TD>W:<TD> well way week weeks word work with we who was went were would wouldn't\n<TR><TD>X:<TD>\n<TR><TD>Y:<TD> you you're\n<TR><TD>Z:<TD>\n</TABLE>
\.


--
-- Data for Name: yn; Type: TABLE DATA; Schema: public; Owner: drbean
--

COPY yn (exercise, player, league, try, score, questionchance, answerchance) FROM stdin;
candidate	193001	AFN2N0	0	0	9	6
q-and-a-exam	N00200029	AFN3Y0	10	4	895	600
jackson	N01200044	AFN2N0	0	0	9	6
candidate	N01200044	AFN2N0	0	0	9	6
candidate	N01200029	AFN2N0	0	0	9	6
candidate	N01200056	AFN2N0	0	0	9	6
candidate	N01200041	AFN2N0	0	0	9	6
candidate	N01200024	AFN2N0	0	0	9	6
candidate	N01200009	AFN2N0	0	0	9	6
candidate	V9941012	FLA0007	0	0	9	6
candidate	N02202114	AFN2N0	0	0	9	6
candidate	N02202112	AFN2N0	0	0	9	6
candidate	N02202101	AFN2N0	0	0	9	6
candidate	N01200005	AFN2N0	0	0	9	6
candidate	N01200058	AFN2N0	0	0	9	6
candidate	N02202104	AFN2N0	0	0	9	6
candidate	N01200021	AFN2N0	0	0	9	6
candidate	N01200035	AFN2N0	0	0	9	6
candidate	N02202106	AFN2N0	0	0	9	6
candidate	N02202111	AFN2N0	0	0	9	6
candidate	N00082007	AFN2N0	0	0	9	6
candidate	N99080092	AFN2N0	0	0	9	6
candidate	N01200033	AFN2N0	0	0	9	6
candidate	B00200054	AFN2N0	0	0	9	6
candidate	N01200023	AFN2N0	0	0	9	6
candidate	N01200014	AFN2N0	0	0	9	6
candidate	N01200010	AFN2N0	0	0	9	6
candidate	N97120058	AFN2N0	0	0	9	6
candidate	N01200025	AFN2N0	0	0	9	6
candidate	N01200016	AFN2N0	0	0	9	6
jackson	U0222133	GL00006	0	0	9	6
careers	N01200033	AFN2N0	0	0	9	6
careers	N00120056	AFN300	0	0	9	6
candidate	V9741064	FLA0006	0	0	9	6
intros	193001	AFN3Y0	2	1	8	6
q-and-a	N00200056	AFN3Y0	0	0	9	6
q-and-a	N96200030	AFN3Y0	0	0	9	6
q-and-a	N00200001	AFN300	9	6	8	5
q-and-a	N01202004	AFN3Y0	1	1	9	6
q-and-a	N00200043	AFN3Y0	0	0	9	6
q-and-a	N00200043	AFN300	0	0	9	6
q-and-a	N00200034	AFN3Y0	0	0	9	6
q-and-a	193001	AFN3Y0	9	0	8	6
q-and-a	N00200056	AFN300	8	6	9	6
q-and-a	N00200008	AFN300	0	0	9	6
q-and-a	N00200029	AFN3Y0	0	0	9	6
q-and-a	N00200001	AFN3Y0	0	0	9	6
q-and-a	N00200042	AFN3Y0	0	0	9	6
q-and-a	N00200030	AFN3Y0	0	0	9	6
q-and-a	N00200017	AFN300	0	0	9	6
q-and-a	N00200055	AFN3Y0	0	0	9	6
q-and-a	N01202004	AFN300	0	0	9	6
q-and-a-2	N96200030	AFN3Y0	7	6	9	6
q-and-a-2	N01202004	AFN3Y0	1	0	8	6
q-and-a	N00200017	AFN3Y0	6	2	9	6
q-and-a	N00200025	AFN3Y0	0	0	9	6
q-and-a	N01203003	AFN3Y0	0	0	9	6
q-and-a	N00200008	AFN3Y0	0	0	9	6
q-and-a	N00200036	AFN3Y0	0	0	9	6
q-and-a-2	193001	AFN3Y0	5	3	8	6
q-and-a-2	N00200001	AFN3Y0	0	0	9	6
q-and-a-2	N00200034	AFN3Y0	0	0	9	6
q-and-a-2	N00200017	AFN3Y0	0	0	9	6
q-and-a	N00200036	AFN300	7	6	9	6
q-and-a-2	N00200029	AFN3Y0	0	0	9	6
q-and-a-exam	N00200009	AFN3Y0	110	57	898	589
q-and-a-3	N00200056	AFN3Y0	8	6	7	6
q-and-a-exam	193001	AFN3Y0	0	0	900	600
q-and-a-3	N00200043	AFN3Y0	8	6	9	5
q-and-a	N00200009	AFN3Y0	0	0	9	6
q-and-a	N00200054	AFN3Y0	0	0	9	6
q-and-a	N00200037	AFN3Y0	0	0	9	6
q-and-a	N00200034		0	0	9	6
q-and-a	N00200051	AFN3Y0	0	0	9	6
q-and-a-2	N01203003	AFN3Y0	6	1	4	6
q-and-a-2	N00200030	AFN3Y0	7	3	5	6
q-and-a-2	N00200054	AFN3Y0	0	0	9	6
q-and-a-2	N00200043	AFN3Y0	0	0	9	6
q-and-a	N01202001	AFN3Y0	6	6	9	6
q-and-a-3	N00200009	AFN3Y0	0	0	900	600
q-and-a-3	N96200030	AFN3Y0	8	6	9	5
q-and-a-3	N00200042	AFN3Y0	8	6	7	6
q-and-a-3	N00200017	AFN3Y0	6	6	9	6
q-and-a-2	N00200056	AFN3Y0	7	6	8	6
q-and-a-2	N00200008	AFN3Y0	0	0	9	6
q-and-a-2	N01202001	AFN3Y0	0	0	9	6
q-and-a-3	N00200001	AFN3Y0	9	6	7	6
q-and-a-3	N00200034	AFN3Y0	0	0	9	6
q-and-a-3	N01202004	AFN3Y0	2	1	9	6
q-and-a-2	N00200055	AFN3Y0	12	3	1	6
q-and-a-3	N00200036	AFN3Y0	15	6	4	4
q-and-a-3	N00200008	AFN3Y0	8	2	3	6
q-and-a-3	N00200030	AFN3Y0	2	2	9	5
q-and-a-3	N00200031	AFN3Y0	0	0	9	6
q-and-a-exam	N00200036	AFN3Y0	73	27	898	595
q-and-a-3	N01203003	AFN3Y0	12	6	7	5
q-and-a-3	193001	AFN3Y0	3	3	9	6
q-and-a-3	N00200029	AFN3Y0	0	0	9	6
q-and-a-3	N00200037	AFN3Y0	9	1	899	595
q-and-a-3	N00200025	AFN3Y0	0	0	9	6
q-and-a-exam	N00200025	AFN3Y0	33	14	899	595
q-and-a-exam	N00200031	AFN3Y0	23	11	898	597
q-and-a-exam	N00200017	AFN3Y0	22	11	896	599
q-and-a-exam	N00200030	AFN3Y0	75	55	899	595
q-and-a-exam	N00200042	AFN3Y0	5	1	898	599
q-and-a-exam	N01202004	AFN3Y0	15	5	899	599
q-and-a-exam	N01203003	AFN3Y0	50	28	890	597
dickson	193001	GL00006	1	0	9	6
q-and-a-exam	N01202001	AFN3Y0	7	6	900	600
q-and-a-exam	N00200034	AFN3Y0	104	44	900	585
q-and-a-exam	N00200043	AFN3Y0	39	23	900	598
q-and-a-exam	N00200001	AFN3Y0	92	59	890	596
q-and-a-exam	N00200037	AFN3Y0	8	0	893	600
q-and-a-exam	N00200055	AFN3Y0	28	8	898	596
q-and-a-exam	N00200008	AFN3Y0	17	10	897	600
q-and-a-exam	N00200054	AFN3Y0	113	52	898	579
q-and-a-exam	N00200051	AFN3Y0	45	28	898	598
q-and-a-exam	N96200030	AFN3Y0	29	7	881	600
q-and-a-exam	N00200056	AFN3Y0	71	53	894	599
\.


--
-- Name: character_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY "character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (entity, exercise);


--
-- Name: exercise_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY exercise
    ADD CONSTRAINT exercise_pkey PRIMARY KEY (genre, id);


--
-- Name: genre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: league_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY league
    ADD CONSTRAINT league_pkey PRIMARY KEY (id);


--
-- Name: leaguegenre_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_pkey PRIMARY KEY (league);


--
-- Name: member_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_pkey PRIMARY KEY (player, league);


--
-- Name: play_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_pkey PRIMARY KEY (player, league, course, question, exercise);


--
-- Name: player_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (lexed, exercise, league);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: rolebearer_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_pkey PRIMARY KEY (player, role);


--
-- Name: s_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY s
    ADD CONSTRAINT s_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: session_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: try_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY try
    ADD CONSTRAINT try_pkey PRIMARY KEY (player, league, exercise, try);


--
-- Name: wh_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY wh
    ADD CONSTRAINT wh_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: word_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY word
    ADD CONSTRAINT word_pkey PRIMARY KEY (exercise);


--
-- Name: yn_pkey; Type: CONSTRAINT; Schema: public; Owner: drbean; Tablespace: 
--

ALTER TABLE ONLY yn
    ADD CONSTRAINT yn_pkey PRIMARY KEY (player, league, exercise);


--
-- Name: leaguegenre_idx_genre; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX leaguegenre_idx_genre ON leaguegenre USING btree (genre);


--
-- Name: member_idx_league; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX member_idx_league ON member USING btree (league);


--
-- Name: member_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX member_idx_player ON member USING btree (player);


--
-- Name: play_idx_league_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX play_idx_league_player ON play USING btree (league, player);


--
-- Name: rolebearer_idx_player; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearer_idx_player ON rolebearer USING btree (player);


--
-- Name: rolebearer_idx_role; Type: INDEX; Schema: public; Owner: drbean; Tablespace: 
--

CREATE INDEX rolebearer_idx_role ON rolebearer USING btree (role);


--
-- Name: leaguegenre_fk_genre; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_genre FOREIGN KEY (genre) REFERENCES genre(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: leaguegenre_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY leaguegenre
    ADD CONSTRAINT leaguegenre_fk_league FOREIGN KEY (league) REFERENCES league(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: member_fk_league; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_fk_league FOREIGN KEY (league) REFERENCES league(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: member_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY member
    ADD CONSTRAINT member_fk_player FOREIGN KEY (player) REFERENCES player(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: play_fk_league_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY play
    ADD CONSTRAINT play_fk_league_player FOREIGN KEY (league, player) REFERENCES member(league, player) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rolebearer_fk_player; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_fk_player FOREIGN KEY (player) REFERENCES player(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rolebearer_fk_role; Type: FK CONSTRAINT; Schema: public; Owner: drbean
--

ALTER TABLE ONLY rolebearer
    ADD CONSTRAINT rolebearer_fk_role FOREIGN KEY (role) REFERENCES role(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: character; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE "character" FROM PUBLIC;
REVOKE ALL ON TABLE "character" FROM drbean;
GRANT ALL ON TABLE "character" TO drbean;
GRANT SELECT ON TABLE "character" TO apache;


--
-- Name: exercise; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE exercise FROM PUBLIC;
REVOKE ALL ON TABLE exercise FROM drbean;
GRANT ALL ON TABLE exercise TO drbean;
GRANT SELECT ON TABLE exercise TO apache;


--
-- Name: leaguegenre; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE leaguegenre FROM PUBLIC;
REVOKE ALL ON TABLE leaguegenre FROM drbean;
GRANT ALL ON TABLE leaguegenre TO drbean;
GRANT SELECT ON TABLE leaguegenre TO apache;


--
-- Name: question; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE question FROM PUBLIC;
REVOKE ALL ON TABLE question FROM drbean;
GRANT ALL ON TABLE question TO drbean;
GRANT SELECT,INSERT ON TABLE question TO apache;


--
-- Name: s; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE s FROM PUBLIC;
REVOKE ALL ON TABLE s FROM drbean;
GRANT ALL ON TABLE s TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE s TO apache;


--
-- Name: session; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE session FROM PUBLIC;
REVOKE ALL ON TABLE session FROM drbean;
GRANT ALL ON TABLE session TO drbean;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE session TO apache;


--
-- Name: tag; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE tag FROM PUBLIC;
REVOKE ALL ON TABLE tag FROM drbean;
GRANT ALL ON TABLE tag TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE tag TO apache;


--
-- Name: try; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE try FROM PUBLIC;
REVOKE ALL ON TABLE try FROM drbean;
GRANT ALL ON TABLE try TO drbean;
GRANT SELECT,INSERT ON TABLE try TO apache;


--
-- Name: wh; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE wh FROM PUBLIC;
REVOKE ALL ON TABLE wh FROM drbean;
GRANT ALL ON TABLE wh TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE wh TO apache;


--
-- Name: word; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE word FROM PUBLIC;
REVOKE ALL ON TABLE word FROM drbean;
GRANT ALL ON TABLE word TO drbean;
GRANT SELECT ON TABLE word TO apache;


--
-- Name: yn; Type: ACL; Schema: public; Owner: drbean
--

REVOKE ALL ON TABLE yn FROM PUBLIC;
REVOKE ALL ON TABLE yn FROM drbean;
GRANT ALL ON TABLE yn TO drbean;
GRANT SELECT,INSERT,UPDATE ON TABLE yn TO apache;


--
-- PostgreSQL database dump complete
--

