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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    mass_in_solar_masses numeric(15,2),
    discovery_year integer,
    is_supermassive boolean,
    distance_from_earth_ly numeric(15,2),
    description text
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,2),
    diameter_in_light_years numeric(10,2),
    galaxy_type character varying(40),
    distance_from_earth numeric(15,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    discovery_year integer,
    diameter_in_km numeric(10,2),
    orbital_period_in_days numeric(10,2)
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
    name character varying(40) NOT NULL,
    star_id integer,
    planet_type character varying(20),
    has_life boolean,
    has_rings boolean,
    orbital_period_in_days numeric(10,2),
    radius_in_km numeric(10,2)
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    spectral_type character varying(20),
    temperature_in_kelvin integer,
    mass_in_solar_masses numeric(10,2),
    radius_in_solar_radii numeric(10,2),
    black_hole_id integer
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 1, 'Sagittarius A*', 4300000.00, 1974, true, 26000.00, 'Supermassive black hole at the center of Milky Way');
INSERT INTO public.black_hole VALUES (2, 2, 'Andromeda BH', 100000000.00, 1968, true, 2537000.00, 'Central black hole of Andromeda galaxy');
INSERT INTO public.black_hole VALUES (3, 4, 'M87*', 6500000000.00, 2019, true, 53500000.00, 'First black hole ever imaged by Event Horizon Telescope');
INSERT INTO public.black_hole VALUES (4, 1, 'Cygnus X-1', 14.80, 1964, false, 6070.00, 'First black hole candidate discovered');
INSERT INTO public.black_hole VALUES (5, 3, 'Triangulum BH', 50000000.00, 2005, true, 3000000.00, 'Central black hole of Triangulum galaxy');
INSERT INTO public.black_hole VALUES (6, 5, 'Sombrero BH', 1000000000.00, 1990, true, 29300000.00, 'Supermassive black hole in Sombrero galaxy');
INSERT INTO public.black_hole VALUES (7, 6, 'Whirlpool BH', 1000000.00, 2000, true, 23000000.00, 'Black hole in Whirlpool galaxy core');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600.00, 105700.00, 'Barred Spiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest spiral galaxy to Milky Way', 10000.00, 220000.00, 'Spiral', 2537.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest galaxy in Local Group', 5000.00, 60000.00, 'Spiral', 3000.00);
INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Our home galaxy containing the Solar System', 13600.00, 105700.00, 'Barred Spiral', 0.00);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Closest spiral galaxy to the Milky Way', 10000.00, 220000.00, 'Spiral', 2537000.00);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Third-largest galaxy in the Local Group', 5000.00, 60000.00, 'Spiral', 3000000.00);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Famous for its supermassive black hole', 13200.00, 240000.00, 'Elliptical', 53500000.00);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'Resembles a wide-brimmed hat', 13250.00, 90000.00, 'Spiral', 29300000.00);
INSERT INTO public.galaxy VALUES (9, 'Whirlpool', 'Known for its spiral structure', 1000.00, 60000.00, 'Spiral', 23000000.00);
INSERT INTO public.galaxy VALUES (10, 'Centaurus A', 'Notable for its dust lane', 12000.00, 60000.00, 'Elliptical', 13600000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, NULL, 3474.00, 27.32);
INSERT INTO public.moon VALUES (2, 'Io', 3, 1610, 3643.00, 1.77);
INSERT INTO public.moon VALUES (3, 'Europa', 3, 1610, 3121.00, 3.55);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 1610, 5268.00, 7.15);
INSERT INTO public.moon VALUES (5, 'Callisto', 3, 1610, 4820.00, 16.69);
INSERT INTO public.moon VALUES (6, 'Titan', 4, 1655, 5150.00, 15.95);
INSERT INTO public.moon VALUES (7, 'Rhea', 4, 1672, 1527.00, 4.52);
INSERT INTO public.moon VALUES (8, 'Iapetus', 4, 1671, 1468.00, 79.33);
INSERT INTO public.moon VALUES (9, 'Dione', 4, 1684, 1123.00, 2.74);
INSERT INTO public.moon VALUES (10, 'Tethys', 4, 1684, 1062.00, 1.89);
INSERT INTO public.moon VALUES (11, 'Enceladus', 4, 1789, 504.00, 1.37);
INSERT INTO public.moon VALUES (12, 'Mimas', 4, 1789, 396.00, 0.94);
INSERT INTO public.moon VALUES (13, 'Phobos', 2, 1877, 22.40, 0.32);
INSERT INTO public.moon VALUES (14, 'Deimos', 2, 1877, 12.40, 1.26);
INSERT INTO public.moon VALUES (15, 'Moon', 3, NULL, 3474.80, 27.32);
INSERT INTO public.moon VALUES (16, 'Io', 5, 1610, 3643.20, 1.77);
INSERT INTO public.moon VALUES (17, 'Europa', 5, 1610, 3121.60, 3.55);
INSERT INTO public.moon VALUES (18, 'Ganymede', 5, 1610, 5268.20, 7.15);
INSERT INTO public.moon VALUES (19, 'Callisto', 5, 1610, 4820.60, 16.69);
INSERT INTO public.moon VALUES (20, 'Amalthea', 5, 1892, 167.00, 0.50);
INSERT INTO public.moon VALUES (21, 'Titan', 6, 1655, 5150.00, 15.95);
INSERT INTO public.moon VALUES (22, 'Rhea', 6, 1672, 1527.00, 4.52);
INSERT INTO public.moon VALUES (23, 'Iapetus', 6, 1671, 1468.00, 79.33);
INSERT INTO public.moon VALUES (24, 'Dione', 6, 1684, 1123.00, 2.74);
INSERT INTO public.moon VALUES (25, 'Tethys', 6, 1684, 1062.00, 1.89);
INSERT INTO public.moon VALUES (26, 'Enceladus', 6, 1789, 504.00, 1.37);
INSERT INTO public.moon VALUES (27, 'Mimas', 6, 1789, 396.00, 0.94);
INSERT INTO public.moon VALUES (28, 'Phobos', 4, 1877, 22.40, 0.32);
INSERT INTO public.moon VALUES (29, 'Deimos', 4, 1877, 12.40, 1.26);
INSERT INTO public.moon VALUES (30, 'Titania', 7, 1787, 1576.80, 8.71);
INSERT INTO public.moon VALUES (31, 'Oberon', 7, 1787, 1522.80, 13.46);
INSERT INTO public.moon VALUES (32, 'Umbriel', 7, 1851, 1169.40, 4.14);
INSERT INTO public.moon VALUES (33, 'Ariel', 7, 1851, 1157.80, 2.52);
INSERT INTO public.moon VALUES (34, 'Miranda', 7, 1948, 471.60, 1.41);
INSERT INTO public.moon VALUES (35, 'Triton', 8, 1846, 2706.80, 5.88);
INSERT INTO public.moon VALUES (36, 'Proteus', 8, 1989, 420.00, 1.12);
INSERT INTO public.moon VALUES (37, 'Nereid', 8, 1949, 340.00, 360.13);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', true, false, 365.25, 6371.00);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', false, false, 687.00, 3389.00);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', false, true, 4333.00, 69911.00);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', false, true, 10759.00, 58232.00);
INSERT INTO public.planet VALUES (5, 'Sirius b', 2, 'White Dwarf', false, false, 50.10, 5840.00);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 'Terrestrial', false, false, 88.00, 2439.70);
INSERT INTO public.planet VALUES (7, 'Venus', 1, 'Terrestrial', false, false, 224.70, 6051.80);
INSERT INTO public.planet VALUES (8, 'Earth', 1, 'Terrestrial', true, false, 365.25, 6371.00);
INSERT INTO public.planet VALUES (9, 'Mars', 1, 'Terrestrial', false, false, 687.00, 3389.50);
INSERT INTO public.planet VALUES (10, 'Jupiter', 1, 'Gas Giant', false, true, 4333.00, 69911.00);
INSERT INTO public.planet VALUES (11, 'Saturn', 1, 'Gas Giant', false, true, 10759.00, 58232.00);
INSERT INTO public.planet VALUES (12, 'Uranus', 1, 'Ice Giant', false, true, 30687.00, 25362.00);
INSERT INTO public.planet VALUES (13, 'Neptune', 1, 'Ice Giant', false, true, 60190.00, 24622.00);
INSERT INTO public.planet VALUES (14, 'Pluto', 1, 'Dwarf', false, false, 90560.00, 1188.30);
INSERT INTO public.planet VALUES (15, 'Sirius b', 2, 'White Dwarf', false, false, 50.10, 5840.00);
INSERT INTO public.planet VALUES (16, 'Alpha Centauri Bb', 3, 'Super Earth', false, false, 3.24, 8848.00);
INSERT INTO public.planet VALUES (17, 'Betelgeuse Prime', 4, 'Gas Giant', false, true, 1250.00, 85714.00);
INSERT INTO public.planet VALUES (18, 'Vega b', 5, 'Hot Jupiter', false, true, 2.43, 92300.00);
INSERT INTO public.planet VALUES (19, 'Polaris b', 6, 'Ice Giant', false, true, 18000.00, 32400.00);
INSERT INTO public.planet VALUES (20, 'Alpheratz b', 7, 'Gas Giant', false, true, 96.70, 65400.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 5778, 1.00, 1.00, NULL);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A1V', 9940, 2.06, 1.71, NULL);
INSERT INTO public.star VALUES (3, 'Alpheratz', 2, 'B8IV', 13800, 3.80, 2.70, NULL);
INSERT INTO public.star VALUES (4, 'Sun', 1, 'G2V', 5778, 1.00, 1.00, NULL);
INSERT INTO public.star VALUES (5, 'Sirius', 1, 'A1V', 9940, 2.06, 1.71, NULL);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 1, 'G2V', 5790, 1.10, 1.22, NULL);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, 'M1-2Ia', 3500, 11.60, 887.00, NULL);
INSERT INTO public.star VALUES (8, 'Vega', 1, 'A0Va', 9602, 2.14, 2.36, NULL);
INSERT INTO public.star VALUES (9, 'Polaris', 1, 'F7Ib', 6015, 5.40, 37.50, NULL);
INSERT INTO public.star VALUES (10, 'Alpheratz', 2, 'B8IV', 13800, 3.80, 2.70, NULL);
INSERT INTO public.star VALUES (11, 'Mirach', 2, 'M0III', 3840, 3.50, 100.00, NULL);
INSERT INTO public.star VALUES (12, 'Delta Trianguli', 3, 'G0V', 5900, 1.19, 1.53, NULL);
INSERT INTO public.star VALUES (13, 'M87*', 4, 'Black Hole', 1000000, 6500000.00, NULL, NULL);
INSERT INTO public.star VALUES (14, 'HD 109271', 5, 'G5', 5620, 1.02, 1.12, NULL);
INSERT INTO public.star VALUES (15, 'NGC 5194 Star', 6, 'Unknown', 4500, 0.80, 0.90, NULL);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 37, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy description_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT description_unique UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_black_hole_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_black_hole_id_fkey FOREIGN KEY (black_hole_id) REFERENCES public.black_hole(black_hole_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

