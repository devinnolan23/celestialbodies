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
-- Name: anomaly; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.anomaly (
    name character varying(30),
    anomaly_id integer NOT NULL,
    year_discovered integer NOT NULL,
    size_mi_sqrd integer,
    description text NOT NULL
);


ALTER TABLE public.anomaly OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.anomaly_anomaly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anomaly_anomaly_id_seq OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.anomaly_anomaly_id_seq OWNED BY public.anomaly.anomaly_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(15) NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_ly integer,
    about character varying(100),
    constellation character varying(30)
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
    name character varying(15),
    moon_id integer NOT NULL,
    colonized boolean NOT NULL,
    rings boolean NOT NULL,
    orbits character varying(30),
    miles_from_planet numeric,
    planet_id integer
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
    name character varying(15),
    planet_id integer NOT NULL,
    has_rings boolean NOT NULL,
    has_life boolean NOT NULL,
    mil_mi_from_star numeric,
    planet_type character varying(30),
    star_id integer
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
    name character varying(15),
    star_id integer NOT NULL,
    type character varying(30),
    surface_temp_k integer NOT NULL,
    gravity character varying(10) NOT NULL,
    planets_nearby boolean,
    planets_amount integer,
    galaxy_id integer
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
-- Name: anomaly anomaly_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly ALTER COLUMN anomaly_id SET DEFAULT nextval('public.anomaly_anomaly_id_seq'::regclass);


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
-- Data for Name: anomaly; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.anomaly VALUES ('STATION 313', 1, 2050, 940, 'Station 313 was previously a bio-lab studying the effects of gene alteration therapy on humans. We do not know for sure what happened to cause its fall to ruin, but we dare not go near it. It has drifted from its original location to a mere 300 miles from Sulan, the lava planet. If anyone were to go near, their ship and crew would suffer harshly from Sulan''s radiation field.');
INSERT INTO public.anomaly VALUES ('Space Whale', 2, 3233, 1333, 'An astroid that has taken on the shape of Earth''s blue whale. Rather unremarkable aside from the strange groaning noises heard while passing by it.');
INSERT INTO public.anomaly VALUES ('Atlantis', 3, 2988, 345, 'Once thought to exist somewhere on earth. The legendary  Atlantis was found, empty, amongst the stars. If found again, with the right equipment, could be turned into some kind of tourist attraction');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Andromeda', 1, 220000, 'The Andromeda galaxy is the closest big galaxy to the Milky Way.', 'Andromeda');
INSERT INTO public.galaxy VALUES ('Milky Way', 2, 105700, 'We call it home.', 'Sagittarius');
INSERT INTO public.galaxy VALUES ('Cartwheel', 7, 130000, 'Made up of four spiral galaxies.', 'Sculptor');
INSERT INTO public.galaxy VALUES ('Whirlpool', 6, 60000, 'Named after its ''Whirlpool-like'' appearance.', 'Canes Venatici');
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 50000, 'Is also known as Messier Object 104 or M104.', 'Pegasus');
INSERT INTO public.galaxy VALUES ('Black Eye', 3, 52962, 'Is also known as "Sleeping Beauty Galaxy".', 'Coma Berenices');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, false, false, 'Earth', 238900, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, false, false, 'Mars', 3700, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, false, false, 'Mars', 14600, 4);
INSERT INTO public.moon VALUES ('Europa', 4, false, false, 'Jupiter', 417000, 5);
INSERT INTO public.moon VALUES ('Ganymede', 5, false, false, 'Jupiter', 665000, 5);
INSERT INTO public.moon VALUES ('Io', 6, false, false, 'Jupiter', 262000, 5);
INSERT INTO public.moon VALUES ('Castillo', 7, false, false, 'Jupiter', 1170000, 5);
INSERT INTO public.moon VALUES ('Titan', 8, false, false, 'Saturn', 759000, 6);
INSERT INTO public.moon VALUES ('Rhea', 9, false, true, 'Saturn', 327500, 6);
INSERT INTO public.moon VALUES ('Iapetus', 10, false, false, 'Saturn', 2213000, 6);
INSERT INTO public.moon VALUES ('Puck', 11, false, false, 'Uranus', 53400, 7);
INSERT INTO public.moon VALUES ('Oberon', 12, false, false, 'Uranus', 362000, 7);
INSERT INTO public.moon VALUES ('Triton', 13, false, false, 'Neptune', 220500, 8);
INSERT INTO public.moon VALUES ('Thalassa', 14, false, false, 'Neptune', 31000, 8);
INSERT INTO public.moon VALUES ('Lurva', 15, false, false, 'Sulan', 1000, 9);
INSERT INTO public.moon VALUES ('Weevun', 16, true, true, 'Weevis', 51300, 10);
INSERT INTO public.moon VALUES ('Weevack', 17, true, true, 'Weevis', 899000, 10);
INSERT INTO public.moon VALUES ('Seldur', 20, false, false, 'Uye', 134000, 11);
INSERT INTO public.moon VALUES ('Nulun', 18, true, false, 'Folley', 9100, 12);
INSERT INTO public.moon VALUES ('Bruin', 19, false, true, 'Folley', 330000, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, false, false, 35.98, 'terrestrial', 2);
INSERT INTO public.planet VALUES ('Earth', 3, false, true, 92.96, 'terrestrial', 2);
INSERT INTO public.planet VALUES ('Venus', 2, false, false, 67.24, 'terrestrial', 2);
INSERT INTO public.planet VALUES ('Mars', 4, false, false, 141.6, 'terrestrial', 2);
INSERT INTO public.planet VALUES ('Jupiter', 5, true, false, 483.8, 'gas giant', 2);
INSERT INTO public.planet VALUES ('Saturn', 6, true, false, 890.7, 'gas giant', 2);
INSERT INTO public.planet VALUES ('Uranus', 7, true, false, 1787, 'ice giant', 2);
INSERT INTO public.planet VALUES ('Neptune', 8, true, false, 2798, 'ice giant', 2);
INSERT INTO public.planet VALUES ('Weevis', 10, true, true, 121, 'ocean planet', 7);
INSERT INTO public.planet VALUES ('Sulan', 9, false, false, 12, 'lava planet', 5);
INSERT INTO public.planet VALUES ('Uye', 11, false, false, 58.22, 'desert planet', 4);
INSERT INTO public.planet VALUES ('Folley', 12, false, false, 0.4, 'chthonian', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 2, 'Yellow Dwarf', 5772, '247', true, 8, 2);
INSERT INTO public.star VALUES ('Medetep', 7, 'White Dwarf', 113, '11', false, 0, 1);
INSERT INTO public.star VALUES ('Noris', 6, 'Yellow Dwarf', 6859, '342', true, 13, 7);
INSERT INTO public.star VALUES ('Unik', 5, 'Brown Dwarf', 778, '44', false, 0, 6);
INSERT INTO public.star VALUES ('Frela', 3, 'Red Dwarf', 2887, '129', true, 3, 5);
INSERT INTO public.star VALUES ('Olus', 4, 'Brown Dwarf', 1337, '58', true, 2, 3);


--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.anomaly_anomaly_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: anomaly anomaly_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_pkey PRIMARY KEY (anomaly_id);


--
-- Name: anomaly aprox_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT aprox_unq UNIQUE (size_mi_sqrd);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_miles_from_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_miles_from_planet_key UNIQUE (miles_from_planet);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_miles_from_sun_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_miles_from_sun_key UNIQUE (mil_mi_from_star);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star surface_temp_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT surface_temp_unq UNIQUE (surface_temp_k);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

