--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: yunesh
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE universe OWNER TO yunesh;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: yunesh
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text NOT NULL,
    has_black_hole boolean NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    age_in_millions_of_years integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO yunesh;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: yunesh
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO yunesh;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yunesh
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: yunesh
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    is_inhabited boolean NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL
);


ALTER TABLE public.moon OWNER TO yunesh;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: yunesh
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO yunesh;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yunesh
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: yunesh
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    star_id integer NOT NULL,
    mass_in_earths numeric(10,2) NOT NULL
);


ALTER TABLE public.planet OWNER TO yunesh;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: yunesh
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO yunesh;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yunesh
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: yunesh
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_class character varying(10) NOT NULL,
    is_binary boolean NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL
);


ALTER TABLE public.star OWNER TO yunesh;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: yunesh
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO yunesh;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yunesh
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: yunesh
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 100000.00, 13000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 2500000.00, 13000);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', true, 55000000.00, 6000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'Spiral', false, 3000000.00, 13000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', false, 23000000.00, 13000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', false, 15000000.00, 13000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: yunesh
--

INSERT INTO public.moon VALUES (1, 'Moon', true, false, 3, 384.40);
INSERT INTO public.moon VALUES (2, 'Phobos', true, false, 4, 9.40);
INSERT INTO public.moon VALUES (3, 'Deimos', true, false, 4, 23.50);
INSERT INTO public.moon VALUES (4, 'Io', true, false, 5, 421.70);
INSERT INTO public.moon VALUES (5, 'Europa', true, false, 5, 671.10);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, false, 5, 1070.00);
INSERT INTO public.moon VALUES (7, 'Callisto', true, false, 5, 1883.00);
INSERT INTO public.moon VALUES (8, 'Mimas', true, false, 6, 185.50);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, false, 6, 238.00);
INSERT INTO public.moon VALUES (10, 'Tethys', true, false, 6, 294.70);
INSERT INTO public.moon VALUES (11, 'Dione', true, false, 6, 377.40);
INSERT INTO public.moon VALUES (12, 'Rhea', true, false, 6, 527.10);
INSERT INTO public.moon VALUES (13, 'Titan', true, false, 6, 1221.90);
INSERT INTO public.moon VALUES (14, 'Iapetus', true, false, 6, 3561.30);
INSERT INTO public.moon VALUES (15, 'Miranda', true, false, 7, 129.80);
INSERT INTO public.moon VALUES (16, 'Ariel', true, false, 7, 190.90);
INSERT INTO public.moon VALUES (17, 'Umbriel', true, false, 7, 266.00);
INSERT INTO public.moon VALUES (18, 'Titania', true, false, 7, 435.00);
INSERT INTO public.moon VALUES (19, 'Oberon', true, false, 7, 583.50);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: yunesh
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Rocky', false, 1, 0.06);
INSERT INTO public.planet VALUES (2, 'Venus', 'Rocky', false, 1, 0.82);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rocky', true, 1, 1.00);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rocky', false, 1, 0.11);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 1, 317.80);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 1, 95.20);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 1, 14.60);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 1, 17.20);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 'Rocky', true, 2, 2.36);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 'Rocky', true, 4, 1.27);
INSERT INTO public.planet VALUES (11, 'Gliese 667 Cc', 'Rocky', true, 4, 2.70);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 'Rocky', true, 4, 0.30);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: yunesh
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', false, 1, 0.00);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 'G2V', false, 1, 4.37);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1V', false, 1, 8.60);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 'M5.5Ve', false, 1, 4.24);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'M1-2Ia-ab', false, 1, 643.00);
INSERT INTO public.star VALUES (6, 'Rigel', 'B8Ia', false, 1, 860.00);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yunesh
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yunesh
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 19, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yunesh
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yunesh
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: yunesh
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

