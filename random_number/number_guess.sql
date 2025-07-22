--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(23)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3, 2, 329, 23);
INSERT INTO public.games VALUES (2, 5, 52, 22);
INSERT INTO public.games VALUES (19, 2, 172, 39);
INSERT INTO public.games VALUES (18, 5, 4, 38);
INSERT INTO public.games VALUES (5, 2, 225, 25);
INSERT INTO public.games VALUES (44, 2, 816, 64);
INSERT INTO public.games VALUES (4, 5, 262, 24);
INSERT INTO public.games VALUES (7, 2, 395, 27);
INSERT INTO public.games VALUES (21, 2, 552, 41);
INSERT INTO public.games VALUES (43, 5, 250, 63);
INSERT INTO public.games VALUES (6, 5, 27, 26);
INSERT INTO public.games VALUES (20, 5, 57, 40);
INSERT INTO public.games VALUES (9, 2, 196, 29);
INSERT INTO public.games VALUES (8, 5, 71, 28);
INSERT INTO public.games VALUES (23, 2, 532, 43);
INSERT INTO public.games VALUES (11, 2, 896, 31);
INSERT INTO public.games VALUES (46, 2, 688, 66);
INSERT INTO public.games VALUES (10, 5, 175, 30);
INSERT INTO public.games VALUES (22, 5, 322, 42);
INSERT INTO public.games VALUES (13, 2, 228, 33);
INSERT INTO public.games VALUES (45, 5, 190, 65);
INSERT INTO public.games VALUES (12, 5, 383, 32);
INSERT INTO public.games VALUES (25, 2, 50, 45);
INSERT INTO public.games VALUES (15, 2, 654, 35);
INSERT INTO public.games VALUES (24, 5, 6, 44);
INSERT INTO public.games VALUES (14, 5, 270, 34);
INSERT INTO public.games VALUES (26, 0, 0, 46);
INSERT INTO public.games VALUES (27, 0, 0, 47);
INSERT INTO public.games VALUES (1, 23, 9, 1);
INSERT INTO public.games VALUES (17, 2, 165, 37);
INSERT INTO public.games VALUES (28, 0, 0, 48);
INSERT INTO public.games VALUES (29, 0, 0, 49);
INSERT INTO public.games VALUES (16, 5, 268, 36);
INSERT INTO public.games VALUES (30, 0, 0, 50);
INSERT INTO public.games VALUES (31, 0, 0, 51);
INSERT INTO public.games VALUES (48, 2, 100, 68);
INSERT INTO public.games VALUES (34, 2, 169, 54);
INSERT INTO public.games VALUES (33, 5, 22, 53);
INSERT INTO public.games VALUES (32, 1, 8, 52);
INSERT INTO public.games VALUES (47, 5, 454, 67);
INSERT INTO public.games VALUES (36, 2, 226, 56);
INSERT INTO public.games VALUES (35, 5, 722, 55);
INSERT INTO public.games VALUES (50, 2, 825, 70);
INSERT INTO public.games VALUES (38, 2, 139, 58);
INSERT INTO public.games VALUES (49, 5, 535, 69);
INSERT INTO public.games VALUES (37, 5, 589, 57);
INSERT INTO public.games VALUES (40, 2, 202, 60);
INSERT INTO public.games VALUES (39, 5, 51, 59);
INSERT INTO public.games VALUES (42, 2, 11, 62);
INSERT INTO public.games VALUES (41, 5, 13, 61);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Leonardo');
INSERT INTO public.users VALUES (2, 'user_1753139124828');
INSERT INTO public.users VALUES (3, 'user_1753139124827');
INSERT INTO public.users VALUES (4, 'user_1753139219345');
INSERT INTO public.users VALUES (5, 'user_1753139219344');
INSERT INTO public.users VALUES (6, 'user_1753139406246');
INSERT INTO public.users VALUES (7, 'user_1753139406245');
INSERT INTO public.users VALUES (8, 'user_1753139776973');
INSERT INTO public.users VALUES (9, 'user_1753139776972');
INSERT INTO public.users VALUES (10, 'user_1753139801535');
INSERT INTO public.users VALUES (11, 'user_1753139801534');
INSERT INTO public.users VALUES (12, 'user_1753139847193');
INSERT INTO public.users VALUES (13, 'user_1753139847192');
INSERT INTO public.users VALUES (14, 'user_1753139884138');
INSERT INTO public.users VALUES (15, 'user_1753139884137');
INSERT INTO public.users VALUES (16, 'user_1753140134736');
INSERT INTO public.users VALUES (17, 'user_1753140134735');
INSERT INTO public.users VALUES (18, 'user_1753140241277');
INSERT INTO public.users VALUES (19, 'user_1753140241276');
INSERT INTO public.users VALUES (20, 'user_1753140292411');
INSERT INTO public.users VALUES (21, 'user_1753140292410');
INSERT INTO public.users VALUES (22, 'user_1753140933048');
INSERT INTO public.users VALUES (23, 'user_1753140933047');
INSERT INTO public.users VALUES (24, 'user_1753141202104');
INSERT INTO public.users VALUES (25, 'user_1753141202103');
INSERT INTO public.users VALUES (26, 'user_1753141250173');
INSERT INTO public.users VALUES (27, 'user_1753141250172');
INSERT INTO public.users VALUES (28, 'user_1753141383843');
INSERT INTO public.users VALUES (29, 'user_1753141383842');
INSERT INTO public.users VALUES (30, 'user_1753141512250');
INSERT INTO public.users VALUES (31, 'user_1753141512249');
INSERT INTO public.users VALUES (32, 'user_1753141519647');
INSERT INTO public.users VALUES (33, 'user_1753141519646');
INSERT INTO public.users VALUES (34, 'user_1753141535771');
INSERT INTO public.users VALUES (35, 'user_1753141535770');
INSERT INTO public.users VALUES (36, 'user_1753141567444');
INSERT INTO public.users VALUES (37, 'user_1753141567443');
INSERT INTO public.users VALUES (38, 'user_1753141608866');
INSERT INTO public.users VALUES (39, 'user_1753141608865');
INSERT INTO public.users VALUES (40, 'user_1753141827484');
INSERT INTO public.users VALUES (41, 'user_1753141827483');
INSERT INTO public.users VALUES (42, 'user_1753142413627');
INSERT INTO public.users VALUES (43, 'user_1753142413626');
INSERT INTO public.users VALUES (44, 'user_1753142425897');
INSERT INTO public.users VALUES (45, 'user_1753142425896');
INSERT INTO public.users VALUES (46, 'user_1753142452899');
INSERT INTO public.users VALUES (47, 'user_1753142452898');
INSERT INTO public.users VALUES (48, 'user_1753142502457');
INSERT INTO public.users VALUES (49, 'user_1753142502456');
INSERT INTO public.users VALUES (50, 'user_1753142607770');
INSERT INTO public.users VALUES (51, 'user_1753142607769');
INSERT INTO public.users VALUES (52, 'Hola');
INSERT INTO public.users VALUES (53, 'user_1753142814237');
INSERT INTO public.users VALUES (54, 'user_1753142814236');
INSERT INTO public.users VALUES (55, 'user_1753142846685');
INSERT INTO public.users VALUES (56, 'user_1753142846684');
INSERT INTO public.users VALUES (57, 'user_1753142917608');
INSERT INTO public.users VALUES (58, 'user_1753142917607');
INSERT INTO public.users VALUES (59, 'user_1753142947619');
INSERT INTO public.users VALUES (60, 'user_1753142947618');
INSERT INTO public.users VALUES (61, 'user_1753142971555');
INSERT INTO public.users VALUES (62, 'user_1753142971554');
INSERT INTO public.users VALUES (63, 'user_1753142978409');
INSERT INTO public.users VALUES (64, 'user_1753142978408');
INSERT INTO public.users VALUES (65, 'user_1753143011747');
INSERT INTO public.users VALUES (66, 'user_1753143011746');
INSERT INTO public.users VALUES (67, 'user_1753143245873');
INSERT INTO public.users VALUES (68, 'user_1753143245872');
INSERT INTO public.users VALUES (69, 'user_1753143343338');
INSERT INTO public.users VALUES (70, 'user_1753143343337');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 50, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 70, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

