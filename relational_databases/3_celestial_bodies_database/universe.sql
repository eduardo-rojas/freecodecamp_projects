--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    isophotal_diameter numeric(10,2),
    redshift character varying(50),
    distance real
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: minor_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.minor_planet (
    minor_planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    category text,
    discovered_date date,
    mean_diameter real,
    in_solar_system boolean NOT NULL
);


ALTER TABLE public.minor_planet OWNER TO freecodecamp;

--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.minor_planet_minor_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.minor_planet_minor_planet_id_seq OWNER TO freecodecamp;

--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.minor_planet_minor_planet_id_seq OWNED BY public.minor_planet.minor_planet_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mean_radius real,
    surface_area real,
    planet_id integer,
    mass character varying(50)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mean_radius integer,
    surface_area numeric(40,2),
    star_id integer,
    mass character varying(50),
    temperature numeric(5,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50),
    apparent_magnitude integer,
    distance real NOT NULL,
    galaxy_id integer,
    is_supergiant boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: minor_planet minor_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet ALTER COLUMN minor_planet_id SET DEFAULT nextval('public.minor_planet_minor_planet_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via lactea', 26.80, NULL, 7.93);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Overdensity', 8.00, '0', 7.66);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Spheroidal Galaxy', 30.60, '140', 21.46);
INSERT INTO public.galaxy VALUES (4, 'Sagittarius Dwarf Irregular', 3.06, '-79', 7.93);
INSERT INTO public.galaxy VALUES (5, 'Segue 2', NULL, NULL, 114);
INSERT INTO public.galaxy VALUES (6, 'andromeda', 46.56, '-0.001004', 765);


--
-- Data for Name: minor_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.minor_planet VALUES (1, '46 Hestia', 'ateroid', '1857-08-16', 131, true);
INSERT INTO public.minor_planet VALUES (2, '47 Aglaja', 'ateroid', '1857-09-15', 136, true);
INSERT INTO public.minor_planet VALUES (3, '48 doris', 'ateroid', '1857-09-19', 136, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Metis', 21.5, 5800, 8, '3.6 X 10^16 kg');
INSERT INTO public.moon VALUES (2, 'adrastea', 8.2, 1200, 8, '3.6 X 10^15 kg');
INSERT INTO public.moon VALUES (3, 'Thebe', 49.3, 45000, 8, '4.3 X 10^17 kg');
INSERT INTO public.moon VALUES (4, 'Io', 1821.6, 3.09e+07, 11, '8.9 X 10^22 kg');
INSERT INTO public.moon VALUES (5, 'Europa', 1560, 3.09e+07, 11, '4.7 X 10^22 kg');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 8.72e+08, 11, '1.4 X 10^23 kg');
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 7.3e+07, 11, '1.07 X 10^23 kg');
INSERT INTO public.moon VALUES (8, 'Themisto', 4.5, NULL, 11, NULL);
INSERT INTO public.moon VALUES (9, 'Leda', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (10, 'Ersa', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (11, 'Himalia', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (12, 'Pandia', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (13, 'Lysithea', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (14, 'Flara', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (15, 'Dia', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (16, 'Carpo', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (17, 'Valetudo', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (18, 'Euporie', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (19, 'Eupheme', NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (20, 'Elara', NULL, NULL, 11, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (4, 'Mercury', 2439, 74800000.00, 6, '3.3011 X 10^23 kg', 164.00);
INSERT INTO public.planet VALUES (5, 'Venus', 6051, 460230000.00, 6, '4.8675 X 10^24 kg', 737.00);
INSERT INTO public.planet VALUES (6, 'Earth', 6371, 510072000.00, 6, '5.97 X 10^24 kg', 287.00);
INSERT INTO public.planet VALUES (7, 'Mars', 3389, 144370000.00, 6, '6.41 X 10^22 kg', 209.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622, 7618700000.00, 6, '1.024 X 10^26 kg', 55.00);
INSERT INTO public.planet VALUES (9, 'Uranus', 25362, 8115600000.00, 6, '8.68 X 10^25 kg', 49.00);
INSERT INTO public.planet VALUES (10, 'saturn', 58232, 42700000000.00, 6, '5.6834 X 10^26 kg', 130.00);
INSERT INTO public.planet VALUES (11, 'Jupiter', 69911, 61469000000.00, 6, '1.89 X 10^27 kg', 33.00);
INSERT INTO public.planet VALUES (12, 'Ceres', 470, 2772368.00, 6, '9.38 X 10^20 kg', NULL);
INSERT INTO public.planet VALUES (13, 'Orcus', 479, NULL, 6, '6.8 X 10^20 kg', 44.00);
INSERT INTO public.planet VALUES (14, 'Pluto', 1188, 17744430.00, 6, '1.30 X 10^22 kg', -240.00);
INSERT INTO public.planet VALUES (15, 'Haumea', 780, 8140000.00, 6, '4.2 X 10^21 kg', 50.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'ADS 7251 A', 'Ursa Major', 7, 6.33, 1, false);
INSERT INTO public.star VALUES (2, 'LHS 2090', 'Cancer', 16, 6.35, 1, false);
INSERT INTO public.star VALUES (3, 'Gliese 784', 'Telescopium', 7, 6.16, 1, false);
INSERT INTO public.star VALUES (4, 'EQ Pegasi A', 'Pegasus', 7, 6.33, 1, false);
INSERT INTO public.star VALUES (5, 'Orionis', 'Orion', 0, 168.1, 1, true);
INSERT INTO public.star VALUES (6, 'Sol', NULL, -26, 4.9296e-06, 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: minor_planet_minor_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.minor_planet_minor_planet_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: minor_planet minor_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet
    ADD CONSTRAINT minor_planet_name_key UNIQUE (name);


--
-- Name: minor_planet minor_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.minor_planet
    ADD CONSTRAINT minor_planet_pkey PRIMARY KEY (minor_planet_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

