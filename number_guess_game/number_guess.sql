--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    user_id integer NOT NULL,
    game_id integer NOT NULL,
    guesses integer NOT NULL
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (42, 63, 959);
INSERT INTO public.games VALUES (42, 64, 810);
INSERT INTO public.games VALUES (43, 65, 493);
INSERT INTO public.games VALUES (43, 66, 260);
INSERT INTO public.games VALUES (42, 67, 557);
INSERT INTO public.games VALUES (42, 68, 204);
INSERT INTO public.games VALUES (42, 69, 589);
INSERT INTO public.games VALUES (44, 70, 10);
INSERT INTO public.games VALUES (45, 71, 983);
INSERT INTO public.games VALUES (45, 72, 922);
INSERT INTO public.games VALUES (46, 73, 71);
INSERT INTO public.games VALUES (46, 74, 84);
INSERT INTO public.games VALUES (45, 75, 943);
INSERT INTO public.games VALUES (45, 76, 418);
INSERT INTO public.games VALUES (45, 77, 933);
INSERT INTO public.games VALUES (47, 78, 890);
INSERT INTO public.games VALUES (47, 79, 282);
INSERT INTO public.games VALUES (48, 80, 955);
INSERT INTO public.games VALUES (48, 81, 698);
INSERT INTO public.games VALUES (47, 82, 373);
INSERT INTO public.games VALUES (47, 83, 465);
INSERT INTO public.games VALUES (47, 84, 749);
INSERT INTO public.games VALUES (49, 85, 125);
INSERT INTO public.games VALUES (49, 86, 390);
INSERT INTO public.games VALUES (50, 87, 197);
INSERT INTO public.games VALUES (50, 88, 647);
INSERT INTO public.games VALUES (49, 89, 954);
INSERT INTO public.games VALUES (49, 90, 5);
INSERT INTO public.games VALUES (49, 91, 91);
INSERT INTO public.games VALUES (51, 92, 769);
INSERT INTO public.games VALUES (51, 93, 47);
INSERT INTO public.games VALUES (52, 94, 940);
INSERT INTO public.games VALUES (52, 95, 551);
INSERT INTO public.games VALUES (51, 96, 57);
INSERT INTO public.games VALUES (51, 97, 360);
INSERT INTO public.games VALUES (51, 98, 940);
INSERT INTO public.games VALUES (53, 99, 924);
INSERT INTO public.games VALUES (53, 100, 602);
INSERT INTO public.games VALUES (54, 101, 426);
INSERT INTO public.games VALUES (54, 102, 509);
INSERT INTO public.games VALUES (53, 103, 185);
INSERT INTO public.games VALUES (53, 104, 82);
INSERT INTO public.games VALUES (53, 105, 517);
INSERT INTO public.games VALUES (55, 106, 344);
INSERT INTO public.games VALUES (55, 107, 914);
INSERT INTO public.games VALUES (56, 108, 789);
INSERT INTO public.games VALUES (56, 109, 67);
INSERT INTO public.games VALUES (55, 110, 941);
INSERT INTO public.games VALUES (55, 111, 184);
INSERT INTO public.games VALUES (55, 112, 650);
INSERT INTO public.games VALUES (57, 113, 816);
INSERT INTO public.games VALUES (57, 114, 373);
INSERT INTO public.games VALUES (58, 115, 386);
INSERT INTO public.games VALUES (58, 116, 163);
INSERT INTO public.games VALUES (57, 117, 269);
INSERT INTO public.games VALUES (57, 118, 559);
INSERT INTO public.games VALUES (57, 119, 274);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (42, 'user_1791195951627');
INSERT INTO public.users VALUES (43, 'user_1791195951626');
INSERT INTO public.users VALUES (44, 'Kate');
INSERT INTO public.users VALUES (45, 'user_1791196053937');
INSERT INTO public.users VALUES (46, 'user_1791196053936');
INSERT INTO public.users VALUES (47, 'user_1791196057179');
INSERT INTO public.users VALUES (48, 'user_1791196057178');
INSERT INTO public.users VALUES (49, 'user_1791196060215');
INSERT INTO public.users VALUES (50, 'user_1791196060214');
INSERT INTO public.users VALUES (51, 'user_1791196066746');
INSERT INTO public.users VALUES (52, 'user_1791196066745');
INSERT INTO public.users VALUES (53, 'user_1791196075811');
INSERT INTO public.users VALUES (54, 'user_1791196075810');
INSERT INTO public.users VALUES (55, 'user_1791196084198');
INSERT INTO public.users VALUES (56, 'user_1791196084197');
INSERT INTO public.users VALUES (57, 'user_1791196133482');
INSERT INTO public.users VALUES (58, 'user_1791196133481');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 119, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 58, true);


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

