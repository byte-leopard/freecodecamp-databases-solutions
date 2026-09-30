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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(60) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(60) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.team_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.team_team_id_seq OWNER TO freecodecamp;

--
-- Name: team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.team_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.team_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (13, 2018, 'Final', 4, 2, 263, 264);
INSERT INTO public.games VALUES (14, 2018, 'Third Place', 2, 0, 265, 266);
INSERT INTO public.games VALUES (15, 2018, 'Semi-Final', 2, 1, 264, 266);
INSERT INTO public.games VALUES (16, 2018, 'Semi-Final', 1, 0, 263, 265);
INSERT INTO public.games VALUES (17, 2018, 'Quarter-Final', 3, 2, 264, 267);
INSERT INTO public.games VALUES (18, 2018, 'Quarter-Final', 2, 0, 266, 269);
INSERT INTO public.games VALUES (19, 2018, 'Quarter-Final', 2, 1, 265, 268);
INSERT INTO public.games VALUES (20, 2018, 'Quarter-Final', 2, 0, 263, 274);
INSERT INTO public.games VALUES (21, 2018, 'Eighth-Final', 2, 1, 266, 278);
INSERT INTO public.games VALUES (22, 2018, 'Eighth-Final', 1, 0, 269, 271);
INSERT INTO public.games VALUES (23, 2018, 'Eighth-Final', 3, 2, 265, 270);
INSERT INTO public.games VALUES (24, 2018, 'Eighth-Final', 2, 0, 268, 272);
INSERT INTO public.games VALUES (25, 2018, 'Eighth-Final', 2, 1, 264, 283);
INSERT INTO public.games VALUES (26, 2018, 'Eighth-Final', 2, 1, 267, 284);
INSERT INTO public.games VALUES (27, 2018, 'Eighth-Final', 2, 1, 274, 275);
INSERT INTO public.games VALUES (28, 2018, 'Eighth-Final', 4, 3, 263, 276);
INSERT INTO public.games VALUES (29, 2014, 'Final', 1, 0, 277, 276);
INSERT INTO public.games VALUES (30, 2014, 'Third Place', 3, 0, 273, 268);
INSERT INTO public.games VALUES (31, 2014, 'Semi-Final', 1, 0, 276, 273);
INSERT INTO public.games VALUES (32, 2014, 'Semi-Final', 7, 1, 277, 268);
INSERT INTO public.games VALUES (33, 2014, 'Quarter-Final', 1, 0, 273, 286);
INSERT INTO public.games VALUES (34, 2014, 'Quarter-Final', 1, 0, 276, 265);
INSERT INTO public.games VALUES (35, 2014, 'Quarter-Final', 2, 1, 268, 278);
INSERT INTO public.games VALUES (36, 2014, 'Quarter-Final', 1, 0, 277, 263);
INSERT INTO public.games VALUES (37, 2014, 'Eighth-Final', 2, 1, 268, 279);
INSERT INTO public.games VALUES (38, 2014, 'Eighth-Final', 2, 0, 278, 274);
INSERT INTO public.games VALUES (39, 2014, 'Eighth-Final', 2, 0, 263, 280);
INSERT INTO public.games VALUES (40, 2014, 'Eighth-Final', 2, 1, 277, 281);
INSERT INTO public.games VALUES (41, 2014, 'Eighth-Final', 2, 1, 273, 272);
INSERT INTO public.games VALUES (42, 2014, 'Eighth-Final', 2, 1, 286, 285);
INSERT INTO public.games VALUES (43, 2014, 'Eighth-Final', 1, 0, 276, 271);
INSERT INTO public.games VALUES (44, 2014, 'Eighth-Final', 2, 1, 265, 282);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (263, 'France');
INSERT INTO public.teams VALUES (264, 'Croatia');
INSERT INTO public.teams VALUES (265, 'Belgium');
INSERT INTO public.teams VALUES (266, 'England');
INSERT INTO public.teams VALUES (267, 'Russia');
INSERT INTO public.teams VALUES (268, 'Brazil');
INSERT INTO public.teams VALUES (269, 'Sweden');
INSERT INTO public.teams VALUES (270, 'Japan');
INSERT INTO public.teams VALUES (271, 'Switzerland');
INSERT INTO public.teams VALUES (272, 'Mexico');
INSERT INTO public.teams VALUES (273, 'Netherlands');
INSERT INTO public.teams VALUES (274, 'Uruguay');
INSERT INTO public.teams VALUES (275, 'Portugal');
INSERT INTO public.teams VALUES (276, 'Argentina');
INSERT INTO public.teams VALUES (277, 'Germany');
INSERT INTO public.teams VALUES (278, 'Colombia');
INSERT INTO public.teams VALUES (279, 'Chile');
INSERT INTO public.teams VALUES (280, 'Nigeria');
INSERT INTO public.teams VALUES (281, 'Algeria');
INSERT INTO public.teams VALUES (282, 'United States');
INSERT INTO public.teams VALUES (283, 'Denmark');
INSERT INTO public.teams VALUES (284, 'Spain');
INSERT INTO public.teams VALUES (285, 'Greece');
INSERT INTO public.teams VALUES (286, 'Costa Rica');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 44, true);


--
-- Name: team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.team_team_id_seq', 286, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams team_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_name_key UNIQUE (name);


--
-- Name: teams team_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

