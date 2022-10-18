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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    description text,
    has_life boolean,
    asteroid_id integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    distance_from_earth integer,
    description text,
    has_life boolean,
    galaxy_id integer NOT NULL,
    galaxy_coords character varying(9)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_universe_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_universe_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    description text,
    moon_id integer NOT NULL,
    temperature numeric(5,2),
    has_life boolean,
    planet_id integer,
    full_rotation_hours integer,
    planet_coords character varying(9)
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
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    description text,
    planet_id integer NOT NULL,
    temperature numeric(5,2),
    has_life boolean,
    star_ref integer,
    full_rotation_hours integer,
    planet_coords character varying(9),
    star_coords character varying(9)
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
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    description text,
    star_id integer NOT NULL,
    temperature numeric(5,2),
    galaxy_id integer,
    galaxy_ref character varying(50),
    galaxy_coords character varying(9),
    star_coords character varying(9)
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_universe_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Murder Roid', 29, '5000km', false, 1, NULL);
INSERT INTO public.asteroid VALUES ('Murder Roid 33', 29, '5000km', false, 2, NULL);
INSERT INTO public.asteroid VALUES ('Murder Roid 43', 29, '5000km', false, 3, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Tech Galaxy', 109, 'Cyberpunk style galaxy', true, 1, '(192,888)');
INSERT INTO public.galaxy VALUES ('Death Galaxy', 259, 'Vast Nothing', false, 2, '(292,588)');
INSERT INTO public.galaxy VALUES ('Star Wars Galaxy', 59, 'Darth Vader Rules it', true, 3, '(192,188)');
INSERT INTO public.galaxy VALUES ('Star Trek Galaxy', 59, 'Dont wear a red shirt', true, 4, '(92,88)');
INSERT INTO public.galaxy VALUES ('Hockey Galaxy', 59, 'Every Planet Has a Hockey Team', true, 5, '(892,588)');
INSERT INTO public.galaxy VALUES ('Gears of War Galaxy', 29, 'Always at war', true, 6, '(762,768)');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Blood Moon', 102, 'Full of horrifying creatures', 1, 56.00, true, NULL, 16, '(190,887)');
INSERT INTO public.moon VALUES ('Rock Moon', 102, 'Barren Rock, no resources', 2, 12.00, false, NULL, 8, '(190,887)');
INSERT INTO public.moon VALUES ('Gold Moon', 102, 'Full of gold!', 3, 35.00, false, NULL, 45, '(190,887)');
INSERT INTO public.moon VALUES ('Moss Moon', 102, 'Full of moss from failed terraforming', 4, 31.00, true, NULL, 34, '(190,887)');
INSERT INTO public.moon VALUES ('Combat Moon', 102, 'Military Operations', 5, 5.00, true, NULL, 55, '(190,887)');
INSERT INTO public.moon VALUES ('Milvoc Moon base 1', 29, 'Resources', 6, 5.00, false, NULL, 14, '(753,766)');
INSERT INTO public.moon VALUES ('Milvoc Moon base 2', 29, 'Resources', 7, 5.00, false, NULL, 14, '(753,766)');
INSERT INTO public.moon VALUES ('Milvoc Moon base 3', 29, 'Resources', 8, 5.00, false, NULL, 14, '(753,766)');
INSERT INTO public.moon VALUES ('Milvoc Moon base 4', 29, 'Resources', 9, 5.00, false, NULL, 14, '(753,766)');
INSERT INTO public.moon VALUES ('Milvoc Moon base 5', 29, 'Resources', 10, 5.00, false, NULL, 14, '(753,766)');
INSERT INTO public.moon VALUES ('Saturn Moon 1', 29, 'Dangerous', 11, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Saturn Moon 2', 29, 'Never been', 12, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Saturn Moon 3', 29, 'Never been', 13, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Saturn Moon 4', 29, 'Never been', 14, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Saturn Moon 5', 29, 'Never been', 15, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Saturn Moon 6', 29, 'Never been', 16, 5.00, false, NULL, 14, '(84,88)');
INSERT INTO public.moon VALUES ('Jacinto Moon 1', 29, 'Never been', 17, 5.00, false, NULL, 14, '(759,766)');
INSERT INTO public.moon VALUES ('Jacinto Moon 2', 29, 'Never been', 18, 5.00, false, NULL, 14, '(759,766)');
INSERT INTO public.moon VALUES ('Jacinto Moon 3', 29, 'Never been', 19, 5.00, false, NULL, 14, '(759,766)');
INSERT INTO public.moon VALUES ('Jacinto Moon 4', 29, 'Never been', 20, 5.00, false, NULL, 14, '(759,766)');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Night City', 102, 'Keannu Reeves Runs this', 1, 28.00, true, NULL, 27, '(190,887)', '(191,887)');
INSERT INTO public.planet VALUES ('Earth 2', 29, 'We moved', 2, 23.00, true, NULL, 24, '(87,88)', '(88,87)');
INSERT INTO public.planet VALUES ('Pluto', 59, 'Its a planet if its in this db', 3, 23.00, false, NULL, 44, '(85,88)', '(88,87)');
INSERT INTO public.planet VALUES ('Saturn', 39, 'Its got moons and stuff', 4, 23.00, false, NULL, 14, '(84,88)', '(88,87)');
INSERT INTO public.planet VALUES ('Mars 3', 39, 'We built this one better', 5, 23.00, true, NULL, 14, '(82,88)', '(88,87)');
INSERT INTO public.planet VALUES ('Mars 2', 39, 'We messed up building it', 6, 23.00, false, NULL, 34, '(81,88)', '(88,87)');
INSERT INTO public.planet VALUES ('Jacinto', 29, 'Half gone', 7, 33.00, true, NULL, 24, '(759,766)', '(760,767)');
INSERT INTO public.planet VALUES ('Rembar', 29, 'Stable', 8, 43.00, true, NULL, 34, '(758,766)', '(760,767)');
INSERT INTO public.planet VALUES ('Renderer', 29, 'Where the magic happens', 9, 23.00, true, NULL, 14, '(757,766)', '(760,767)');
INSERT INTO public.planet VALUES ('Milvoc', 29, 'Missle launch planet', 10, 55.00, true, NULL, 54, '(755,766)', '(760,767)');
INSERT INTO public.planet VALUES ('Milvoc 2', 29, 'Missle launch planet', 11, 15.00, true, NULL, 34, '(754,766)', '(760,767)');
INSERT INTO public.planet VALUES ('Milvoc 3', 29, 'Missle launch planet', 12, 15.00, true, NULL, 34, '(753,766)', '(760,767)');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Dyson Sphere', 103, 'Blue sun', 1, 450.00, NULL, NULL, '(192,888)', '(191,887)');
INSERT INTO public.star VALUES ('Gears Sun', 29, 'Made of gears', 2, 333.00, NULL, NULL, '(762,768)', '(761,767)');
INSERT INTO public.star VALUES ('Gears Sun 2', 29, 'Old dying sun not made of gears', 3, 13.00, NULL, NULL, '(762,768)', '(760,767)');
INSERT INTO public.star VALUES ('Darth Sun', 29, 'Darth Vader owns it and uses it for personal use', 4, 13.00, NULL, NULL, '(192,188)', '(191,187)');
INSERT INTO public.star VALUES ('Red Sun', 29, 'It is very doomed in this universe', 5, 13.00, NULL, NULL, '(92,88)', '(91,87)');
INSERT INTO public.star VALUES ('Blue Sun', 29, 'The people feel invulnerable', 6, 13.00, NULL, NULL, '(92,88)', '(88,87)');


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_universe_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_id PRIMARY KEY (asteroid_id);


--
-- Name: asteroid asteroid_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_unique UNIQUE (name);


--
-- Name: galaxy galaxy_coords_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_coords_unique UNIQUE (galaxy_coords);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: planet planet_coords_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_coords_unique UNIQUE (planet_coords);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_coords_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_coords_unique UNIQUE (star_coords);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: galaxy universe_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT universe_unique UNIQUE (galaxy_id);


--
-- Name: star galaxy_coords; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_coords FOREIGN KEY (galaxy_coords) REFERENCES public.galaxy(galaxy_coords);


--
-- Name: moon planet_coords; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_coords FOREIGN KEY (planet_coords) REFERENCES public.planet(planet_coords);


--
-- Name: planet star_coords; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_coords FOREIGN KEY (star_coords) REFERENCES public.star(star_coords);


--
-- PostgreSQL database dump complete
--

