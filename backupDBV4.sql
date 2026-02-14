--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-02-14 11:09:40

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
-- TOC entry 21 (class 2615 OID 18808)
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO postgres;

--
-- TOC entry 22 (class 2615 OID 19064)
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- TOC entry 20 (class 2615 OID 18398)
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- TOC entry 6138 (class 0 OID 0)
-- Dependencies: 20
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- TOC entry 6 (class 3079 OID 18568)
-- Name: address_standardizer; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer WITH SCHEMA public;


--
-- TOC entry 6139 (class 0 OID 0)
-- Dependencies: 6
-- Name: EXTENSION address_standardizer; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer IS 'Used to parse an address into constituent elements. Generally used to support geocoding address normalization step.';


--
-- TOC entry 7 (class 3079 OID 18576)
-- Name: address_standardizer_data_us; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS address_standardizer_data_us WITH SCHEMA public;


--
-- TOC entry 6140 (class 0 OID 0)
-- Dependencies: 7
-- Name: EXTENSION address_standardizer_data_us; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION address_standardizer_data_us IS 'Address Standardizer US dataset example';


--
-- TOC entry 12 (class 3079 OID 18797)
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- TOC entry 6141 (class 0 OID 0)
-- Dependencies: 12
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- TOC entry 14 (class 3079 OID 19208)
-- Name: h3; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3 WITH SCHEMA public;


--
-- TOC entry 6142 (class 0 OID 0)
-- Dependencies: 14
-- Name: EXTENSION h3; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3 IS 'H3 bindings for PostgreSQL';


--
-- TOC entry 2 (class 3079 OID 16399)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 6143 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- TOC entry 3 (class 3079 OID 17479)
-- Name: postgis_raster; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_raster WITH SCHEMA public;


--
-- TOC entry 6144 (class 0 OID 0)
-- Dependencies: 3
-- Name: EXTENSION postgis_raster; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_raster IS 'PostGIS raster types and functions';


--
-- TOC entry 15 (class 3079 OID 19324)
-- Name: h3_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS h3_postgis WITH SCHEMA public;


--
-- TOC entry 6145 (class 0 OID 0)
-- Dependencies: 15
-- Name: EXTENSION h3_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION h3_postgis IS 'H3 PostGIS integration';


--
-- TOC entry 11 (class 3079 OID 18791)
-- Name: ogr_fdw; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ogr_fdw WITH SCHEMA public;


--
-- TOC entry 6146 (class 0 OID 0)
-- Dependencies: 11
-- Name: EXTENSION ogr_fdw; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ogr_fdw IS 'foreign-data wrapper for GIS data access';


--
-- TOC entry 4 (class 3079 OID 18036)
-- Name: pgrouting; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrouting WITH SCHEMA public;


--
-- TOC entry 6147 (class 0 OID 0)
-- Dependencies: 4
-- Name: EXTENSION pgrouting; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrouting IS 'pgRouting Extension';


--
-- TOC entry 9 (class 3079 OID 18685)
-- Name: pointcloud; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud WITH SCHEMA public;


--
-- TOC entry 6148 (class 0 OID 0)
-- Dependencies: 9
-- Name: EXTENSION pointcloud; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud IS 'data type for lidar point clouds';


--
-- TOC entry 10 (class 3079 OID 18780)
-- Name: pointcloud_postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pointcloud_postgis WITH SCHEMA public;


--
-- TOC entry 6149 (class 0 OID 0)
-- Dependencies: 10
-- Name: EXTENSION pointcloud_postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pointcloud_postgis IS 'integration for pointcloud LIDAR data and PostGIS geometry data';


--
-- TOC entry 8 (class 3079 OID 18623)
-- Name: postgis_sfcgal; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_sfcgal WITH SCHEMA public;


--
-- TOC entry 6150 (class 0 OID 0)
-- Dependencies: 8
-- Name: EXTENSION postgis_sfcgal; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_sfcgal IS 'PostGIS SFCGAL functions';


--
-- TOC entry 13 (class 3079 OID 18809)
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- TOC entry 6151 (class 0 OID 0)
-- Dependencies: 13
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- TOC entry 5 (class 3079 OID 18399)
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- TOC entry 6152 (class 0 OID 0)
-- Dependencies: 5
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 314 (class 1259 OID 23456)
-- Name: agendamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agendamiento (
    idagendamiento integer NOT NULL,
    dia date,
    horainicio time without time zone,
    horafinal time without time zone
);


ALTER TABLE public.agendamiento OWNER TO postgres;

--
-- TOC entry 315 (class 1259 OID 23459)
-- Name: agendamiento_idagendamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agendamiento_idagendamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agendamiento_idagendamiento_seq OWNER TO postgres;

--
-- TOC entry 6153 (class 0 OID 0)
-- Dependencies: 315
-- Name: agendamiento_idagendamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agendamiento_idagendamiento_seq OWNED BY public.agendamiento.idagendamiento;


--
-- TOC entry 316 (class 1259 OID 23460)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    idcategoria integer NOT NULL,
    nombrecategoria character varying(255)
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 317 (class 1259 OID 23463)
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_idcategoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_idcategoria_seq OWNER TO postgres;

--
-- TOC entry 6154 (class 0 OID 0)
-- Dependencies: 317
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_idcategoria_seq OWNED BY public.categoria.idcategoria;


--
-- TOC entry 318 (class 1259 OID 23464)
-- Name: foto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foto (
    idfoto integer NOT NULL,
    rutafoto character varying(255),
    idsitioturistico integer
);


ALTER TABLE public.foto OWNER TO postgres;

--
-- TOC entry 319 (class 1259 OID 23467)
-- Name: foto_idfoto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.foto_idfoto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.foto_idfoto_seq OWNER TO postgres;

--
-- TOC entry 6155 (class 0 OID 0)
-- Dependencies: 319
-- Name: foto_idfoto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.foto_idfoto_seq OWNED BY public.foto.idfoto;


--
-- TOC entry 320 (class 1259 OID 23468)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    idservicio integer NOT NULL,
    nombreservicio character varying(255),
    descripcionservicio text,
    valorservicio numeric(10,2)
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 321 (class 1259 OID 23473)
-- Name: servicio_idservicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_idservicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.servicio_idservicio_seq OWNER TO postgres;

--
-- TOC entry 6156 (class 0 OID 0)
-- Dependencies: 321
-- Name: servicio_idservicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_idservicio_seq OWNED BY public.servicio.idservicio;


--
-- TOC entry 322 (class 1259 OID 23474)
-- Name: servicioagendamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicioagendamiento (
    idservicio integer NOT NULL,
    idagendamiento integer NOT NULL
);


ALTER TABLE public.servicioagendamiento OWNER TO postgres;

--
-- TOC entry 323 (class 1259 OID 23477)
-- Name: sitioturistico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sitioturistico (
    idsitioturistico integer NOT NULL,
    nombresitioturistico character varying(255),
    descripcionsitioturistico text,
    petfriendly boolean,
    aceptanmenores boolean,
    direccionsitioturistico character varying(255),
    idcategoria integer,
    coordenadas public.geometry(Point,4326)
);


ALTER TABLE public.sitioturistico OWNER TO postgres;

--
-- TOC entry 324 (class 1259 OID 23482)
-- Name: sitioturistico_idsitioturistico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sitioturistico_idsitioturistico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sitioturistico_idsitioturistico_seq OWNER TO postgres;

--
-- TOC entry 6157 (class 0 OID 0)
-- Dependencies: 324
-- Name: sitioturistico_idsitioturistico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sitioturistico_idsitioturistico_seq OWNED BY public.sitioturistico.idsitioturistico;


--
-- TOC entry 325 (class 1259 OID 23483)
-- Name: sitioturisticoxservicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sitioturisticoxservicio (
    idsitioturistico integer NOT NULL,
    idservicio integer NOT NULL
);


ALTER TABLE public.sitioturisticoxservicio OWNER TO postgres;

--
-- TOC entry 326 (class 1259 OID 23486)
-- Name: vista_alojamientos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_alojamientos AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Alojamientos'::text);


ALTER TABLE public.vista_alojamientos OWNER TO postgres;

--
-- TOC entry 327 (class 1259 OID 23490)
-- Name: vista_cafes; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_cafes AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Cafés'::text);


ALTER TABLE public.vista_cafes OWNER TO postgres;

--
-- TOC entry 328 (class 1259 OID 23494)
-- Name: vista_monumentos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_monumentos AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Monumentos'::text);


ALTER TABLE public.vista_monumentos OWNER TO postgres;

--
-- TOC entry 329 (class 1259 OID 23498)
-- Name: vista_museos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_museos AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Museos'::text);


ALTER TABLE public.vista_museos OWNER TO postgres;

--
-- TOC entry 330 (class 1259 OID 23502)
-- Name: vista_parques; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_parques AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Parques'::text);


ALTER TABLE public.vista_parques OWNER TO postgres;

--
-- TOC entry 331 (class 1259 OID 23506)
-- Name: vista_templos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_templos AS
 SELECT s.idsitioturistico,
    s.nombresitioturistico,
    s.descripcionsitioturistico,
    s.petfriendly,
    s.aceptanmenores,
    s.direccionsitioturistico,
    s.coordenadas
   FROM (public.sitioturistico s
     JOIN public.categoria c ON ((s.idcategoria = c.idcategoria)))
  WHERE ((c.nombrecategoria)::text = 'Templos'::text);


ALTER TABLE public.vista_templos OWNER TO postgres;

--
-- TOC entry 5821 (class 2604 OID 23510)
-- Name: agendamiento idagendamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamiento ALTER COLUMN idagendamiento SET DEFAULT nextval('public.agendamiento_idagendamiento_seq'::regclass);


--
-- TOC entry 5822 (class 2604 OID 23511)
-- Name: categoria idcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria ALTER COLUMN idcategoria SET DEFAULT nextval('public.categoria_idcategoria_seq'::regclass);


--
-- TOC entry 5823 (class 2604 OID 23512)
-- Name: foto idfoto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto ALTER COLUMN idfoto SET DEFAULT nextval('public.foto_idfoto_seq'::regclass);


--
-- TOC entry 5824 (class 2604 OID 23513)
-- Name: servicio idservicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN idservicio SET DEFAULT nextval('public.servicio_idservicio_seq'::regclass);


--
-- TOC entry 5825 (class 2604 OID 23514)
-- Name: sitioturistico idsitioturistico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturistico ALTER COLUMN idsitioturistico SET DEFAULT nextval('public.sitioturistico_idsitioturistico_seq'::regclass);


--
-- TOC entry 6121 (class 0 OID 23456)
-- Dependencies: 314
-- Data for Name: agendamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.agendamiento (idagendamiento, dia, horainicio, horafinal) FROM stdin;
\.


--
-- TOC entry 6123 (class 0 OID 23460)
-- Dependencies: 316
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (idcategoria, nombrecategoria) FROM stdin;
1	templos
2	alojamientos
3	estatuas y monumentos
4	parques y naturaleza
5	museos y sitios de interes
6	cafes y experiencias cafeteras
\.


--
-- TOC entry 6125 (class 0 OID 23464)
-- Dependencies: 318
-- Data for Name: foto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foto (idfoto, rutafoto, idsitioturistico) FROM stdin;
\.


--
-- TOC entry 5788 (class 0 OID 18687)
-- Dependencies: 259
-- Data for Name: pointcloud_formats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pointcloud_formats (pcid, srid, schema) FROM stdin;
\.


--
-- TOC entry 6127 (class 0 OID 23468)
-- Dependencies: 320
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (idservicio, nombreservicio, descripcionservicio, valorservicio) FROM stdin;
\.


--
-- TOC entry 6129 (class 0 OID 23474)
-- Dependencies: 322
-- Data for Name: servicioagendamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicioagendamiento (idservicio, idagendamiento) FROM stdin;
\.


--
-- TOC entry 6130 (class 0 OID 23477)
-- Dependencies: 323
-- Data for Name: sitioturistico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sitioturistico (idsitioturistico, nombresitioturistico, descripcionsitioturistico, petfriendly, aceptanmenores, direccionsitioturistico, idcategoria, coordenadas) FROM stdin;
229	Capilla San Pio X	Testigo del surgimiento y desarrollo de la ciudad desde 1876, la Capilla San Pio X (originariamente capilla de la Enea) fue lamentablemente consumida por un incendio en 2010. A pesar de ello, su valor arquitectónico y su designación como monumento histórico nacional en 1983 hizo que se reconstruyera en el primer cuarto de este siglo.	f	f	Barrio la Enea	1	0101000020E6100000D9731D5665DD52C0F79E881986221440
230	Palacio Arzobispal	El Palacio Arzobispal es un edificio sede de la arquidiócesis de Manizales, que data de 1926, ubicado en el centro histórico de la ciudad y declarado monumento nacional de Colombia en 1982, por su valor histórico y artístico	f	f	Carrera 23 # 19 - 22	1	0101000020E6100000A4BFE75E3DE152C0F7E40BC496441440
231	Catedreal Basilica Metropolitana De Nuestra Señora Del Rosario	La Catedral Basílica Metropolitana Nuestra Señora del Rosario de Manizales es un templo católico, emplazado frente a la Plaza de Bolívar, en la ciudad de Manizales, Colombia. Con 115 m de altura desde la base del templo​ sobre la carrera 22, es la catedral más alta de Colombia y compite contra la Basílica del Voto Nacional en Quito	f	f	Carrera 22 # 22 - 12	1	0101000020E6100000A9187A2019E152C0AF322C4D1A451440
232	Sacrosanta Basilica Menor de la Inmaculada Concepción	En el año 1902 el Papa León XIII eleva a Manizales a la dignidad de Diócesis, por cuando su Templo Parroquial se hubo de destinar a Catedral y Monseñor Gregorio Nacianceno Hoyos, su primer Obispo, encomendó al Padre Nazario Restrepo Botero la elección del sitio para construir el templo de la nueva Parroquia, pues la catedral quería destinarse únicamente a ser la iglesia del obispo.	f	f	Calle 31 # 22 - 27	1	0101000020E61000007CC5ADDEC8E052C0FCF6A88798451440
233	Sagrado Corazon De Jesus (Agustinos)	Los primeros religiosos Agustinos Recoletos llegaron en 1901 a la región de Manizales para fundar una nueva casa. La primera piedra se colocó en 1914 para la construcción de tres naves de 48 metros de largo, 12 metros de ancho y 18 metros de alto. Uno de los religiosos más notables fue el padre Julian Ongay Arbe.	f	f	Carrera 19 # 18 -50	1	0101000020E6100000EEFB78DB48E152C05D2CA56097471440
234	Sacrosanta Basilica Menor de la Inmaculada Concepción	La Basílica Menor Inmaculada Concepción es un templo religioso de culto católico ubicado en la ciudad de Manizales, Colombia. Su construcción comenzó en 1903 y fue inaugurada en 1921. El arquitecto Santiago Páramo diseñó el templo en estilo neo-gótico, y se encuentra en la misma manzana sobre la carrera 21	f	f	Calle 31 # 22 - 27	1	0101000020E61000007CC5ADDEC8E052C0FCF6A88798451440
235	Nuestra Señora de Fatima	La construcción de esta iglesia comenzó en 1950 y se completó en 1952. Fue diseñada por el arquitecto Germán Samper Gnecco, La parroquia fue erigida como Santuario Diocesano en 1986 por el Obispo de Manizales, Monseñor José de Jesús Pimiento Rodríguez.	f	f	Caller 65 # 32 - 04	1	0101000020E6100000DACC4152CCDF52C0FB4849B528381440
236	Iglesia Nuestra Señora del Rosario	La construcción del templo comenzó el 24 de octubre de 1948, como una réplica de la antigua Catedral de Manizales que se quemó en el incendio del 20 de marzo de 1926, construida por el presbítero Esteban Arango González, en 1954 por medio del decreto 1416, fue consagrada como parroquia por Monseñor Luís Concha Córdoba.Su planta es en cruz látina orientada este-oeste quedando su fachada en el lado oeste, su arquitectura tiene estilo románico, consta de tres naves, las laterales son más bajas que la central, sus vitrales laterales representan el Santo Rosario.	f	f	Calle 10 No 12-48	1	0101000020E6100000EC731AD595E152C068B5D1F71B4C1440
237	Cementerio San Esteban	El Cementerio San Esteban es un lugar histórico ubicado en Manizales, Caldas, Colombia. Es conocido por su belleza arquitectónica y su importancia cultural en la región. Además de ser un sitio de descanso final para muchos residentes de la ciudad, el cementerio también es un destino turístico popular debido a su valor histórico y artístico.	f	f	Calle 44 No 24B-36	1	0101000020E6100000414C343F39E052C09680497917411440
238	Corredor polaco	Es un excelente lugar para conocer, no muy apto si temes a las alturas o sufres de vértigo. Las vistas son increíbles y el conocer parte de la historia de Manizales es un plus. El mejor sitio para unas fotos panorámicas de la ciudad.	f	f	Cl. 23 #22-45, Manizales, Caldas	1	0101000020E61000006CD782B21AE152C0187A1A88FF441440
239	Mirador Finca Morrogacho	El Mirador Finca Morrogacho es una granja tranquila cerca de Manizales con vistas a las montañas, habitaciones con baño privado, y ofrece cenas vegetarianas y actividades como yoga	f	f	cerca a la quiebra de velez	2	0101000020E61000008F82C6CF7CE252C029EC44826B501440
240	Hotel Benidorm Manizales	El Hotel Benidorm en Manizales ofrece habitaciones confortables, Wi-Fi gratis, y está cerca de la Universidad Autónoma y el centro de convenciones. Cuenta con aparcamiento gratuito y desayuno americano1.	f	f	Calle 44 #20-20, Cra. 21a #44-41	2	0101000020E61000006860871C36E052C04A18F0B9C5451440
241	ESTELAR El Cable Hotel	El Hotel ESTELAR El Cable es un moderno alojamiento en Manizales, ideal para negocios o placer, con servicios exclusivos y una ubicación privilegiada cerca de la Zona Rosa	f	f	Cra. 23c #64a-60	2	0101000020E6100000E0A9D4DE39DF52C00CDD612069391440
242	Regines Hotel	El Hotel Regine’s Manizales está en la Zona Rosa, cerca del centro comercial Cable Plata. Ofrece habitaciones elegantes con Wi-Fi gratuito y desayuno americano con frutas tropicales	f	f	Cl. 65a #23 B 113	2	0101000020E6100000BF6811742FDF52C0D650E2B561381440
243	Europa Hotel Boutique Manizales	El Europa Hotel Boutique en Manizales es un hotel moderno con Wi-Fi gratuito, recepción 24 horas, y habitaciones equipadas con TV de pantalla plana y minibar. Está cerca del centro histórico y ofrece servicios como lavandería y mostrador de información turística	f	f	Cl. 10 #24-79	2	0101000020E6100000064BF1D095E152C0D135208574431440
244	Centro de Convenciones y Hotel Termales El Otoño	Los Termales El Otoño es conocido por sus piscinas naturales con aguas termales ricas en minerales, que ofrecen propiedades terapéuticas y relajantes. El lugar cuenta con diferentes instalaciones, como piscinas de diferentes temperaturas, zonas de spa, y áreas para disfrutar de tratamientos de salud y belleza.	f	f	Kilometro 5, Antigua Vía al Nevado	2	0101000020E6100000AEC7649626DC52C0961F99612F0A1440
245	Hotel Termales de el otoño	Una Estadía en Familia Perfecta. Disfruta de Nuestro Acquaparque y de las Aguas Termales. Naturales, Directas de los Andes. Un Lujo Natural para para Dormir, Despertar y Soñar.	f	f	Via nevado de el ruiz - via Gallinazo	2	0101000020E6100000EB66FC4B20DC52C093F56CADCA081440
246	Hotel termales de el ruiz	El Hotel Termales del Ruiz es el lugar ideal para vivir una experiencia ¡Única en su especie!Aquí podrás conectarte con lo más profundo de la naturaleza, nuestros senderos naturales te llevarán a cascadas, nacimientos de agua y a conocer cientos de especies de plantas que deslumbran con sus formas, colores y texturas.	f	f	Via nevado de el ruiz - via Gallinazo	2	0101000020E6100000A8ECD7B936D852C0ABC99AB7ADE11340
268	parque del agua	El Parque del Agua en Manizales, Colombia, es un homenaje al agua como recurso renovable. Ofrece diversión y esparcimiento con plazoletas, senderos, fuentes, luces y sonido. Promueve la conservación del agua a través de prácticas de ahorro y uso eficiente	f	f	carrera 23 entre calles 12 a 14	4	0101000020E61000008DAC4B5786E152C0F6EBA8831E451440
247	Tierra viva	A unos pocos minutos de Manizales, en el municipio de Villamaria, departamento de Caldas, se encuentra el Hotel Termales Tierra Viva, un lugar en medio de las montañas, donde la vegetación y la naturaleza rodean este singular espacio, creado para disfrutar de las aguas termales y de la conexión con la naturaleza.Nuestras tres piscinas en piedra, el ambiente familiar, la naturaleza, el sonido del río, las hermosas especies de aves que nos visitan y nuestra gente amable, dispuesta a servirte, harán de tu estadía una experiencia para recordar y repetir.	f	f	Vereda gallinazo 2km	2	0101000020E61000006EFF735AF7DB52C02ABF9AE631151440
248	Ayenda 1133 Casa Polty	El Ayenda 1133 Casa Polty es un hotel en Manizales con servicios como estación de café, room service, y acepta mascotas. Ofrece habitaciones con baño privado, WiFi y desayuno americano	f	f	Cra 20 #22-25	2	0101000020E6100000B1966EB51FE152C0B456F909F7491440
249	Glamping leon dormido	El Glamping León Dormido en Manizales ofrece una experiencia única de alojamiento que combina la comodidad de un hotel con la conexión directa con la naturaleza, su nombre es debido al nombre que se le dio al nevado del Ruiz "León Dormido" y el cual está situado justo en frente de este glampling. Este lugar además de ofrecer un servicio de alojamiento sofisticado, cuenta con actividades recreativas como: sembrar un frailejón, montar en cuatrimoto a lo largo de una ruta hermosa, picnic en comedores tipo tipi y participar de la fogata nocturna que tienen todas las noches; cualquier persona sea huesped o no puede participar de estas actividades.	f	f	Vía al Parque Nacional Los Nevados, La Tribuna, Manizales, Villamaría, Caldas	2	0101000020E6100000CB850586F4D552C054BF8E7264E01340
250	La cacerina Plaza de las ciudades hermanas	“La Cacerina” es un monumento en Manizales, ubicado cerca de la Plaza de Toros y el Parque del Agua. Es un homenaje al maestro torero Pepe Cáceres, reconocido por su amor a la ciudad y su contribución a las obras sociales de Manizales.	f	f	Av. Centenario, Manizales, Caldas	3	0101000020E6100000C9E5BF2FCDE152C03A812285FA3A1440
251	Bolívar Cóndor	“El Bolívar Cóndor” es una escultura de bronce en la Plaza de Bolívar de Manizales. Creada por Rodrigo Arenas Betancourt en 1991, representa a Simón Bolívar y simboliza la libertad	f	f	Cl. 22 #23-10, Manizales, Caldas	3	0101000020E61000002A2A96C61EE152C04DAE361CB8451440
252	Grupo escultórico adan y eva	Las esculturas de Adán y Eva en el Parque Bolívar de Manizales son representaciones icónicas de estos personajes bíblicos	f	f	Calle 23, Centro, Manizales, Caldas	3	0101000020E6100000B324155716E152C0CD091563D1451440
253	Preludio de Lanzas Llaneras	“Preludio de Lanzas Llaneras” es un mural en la Plaza de Bolívar de Manizales. Creado en 1987, representa el resurgir del pueblo colombiano y los eventos de la independencia de Colombia en 1810	f	f	Cra. 22 #22-2 a 22-82, Manizales, Caldas	3	0101000020E610000061D559D019E152C08FA07B1BA9451440
254	Vientos de libertad	“Vientos de Libertad” es un monumento en Manizales.	f	f	Cra. 22 #22-2 a 22-82, Manizales, Caldas	3	0101000020E6100000ACD8D5801EE152C02233428395451440
255	homenaje a rafael uribe uribe	“Rafael Uribe Uribe” es un monumento en Manizales que honra a Rafael Victor Zenón Uribe Uribe, un abogado, periodista y general del partido liberal rebelde. Es conocido por su apoyo a ideas políticas como el socialismo corporativo y la sindicalización en Colombia	f	f	Cl. 26 #N 15, Manizales, Caldas	3	0101000020E610000092573E42F4E052C0764CC6D0D8491440
256	Francisco José de Caldas	El monumento a “Francisco José de Caldas” en Manizales honra a este científico, geógrafo, botánico, astrónomo, naturalista, periodista e ingeniero militar colombiano. Su legado en las ciencias y su contribución a la independencia de Colombia son reconocidos	f	f	Cl. 30 #22-39, Manizales, Caldas	3	0101000020E61000008FC114C6D0E052C018D408B056451440
257	José María Guingue Cavalho	“Jesús María Guingue Cavahlo” es un monumento en Manizales que honra a Jesús María Guingue, un destacado personaje de la región. Aunque no se encontró información detallada, su legado es reconocido en la ciudad	f	f	Cl. 30 #22-39, Manizales, Caldas	3	0101000020E61000008FC114C6D0E052C018D408B056451440
258	Homenaje Ernesto Gutiérrez Arango	“Ernesto Gutiérrez Arango” es un monumento en Manizales que honra a este académico, político y empresario ganadero. Fue Ministro de Salud Pública, tres veces alcalde de Manizales, y fundador y rector de la Universidad Autónoma de Manizales	f	f	Cra. 22 #31-08, Manizales, Caldas	3	0101000020E61000003E589BD3C6E052C061E37F6B0C461440
259	Monumento a los fundadores	“Monumento a los Fundadores” en Manizales es una obra del escultor Luis Guillermo Vallejo Vargas. Consta de 7 esculturas que representan “La Agonía” y “El Éxtasis” de los fundadores que llegaron desde algunos municipios del sur de Antioquia	f	f	Cra 22 Cl.31, Manizales,Caldas	3	0101000020E6100000D1F43E6EADE052C0E4F3823860451440
260	Atlas	“Atlas” es un monumento en Manizales, ubicado cerca de la Universidad de Caldas. Sugiere un homenaje a la resistencia y la fortaleza del espíritu humano.	f	f	Cra 26 Cl.65, Manizales,Caldas	3	0101000020E6100000F7A6A1466BDF52C0B60F8E00C7381440
261	Arco de la vida	“Arco de la Vida” es un monumento en Manizales que simboliza la continuidad de la vida y la esperanza en el futuro. Su diseño y ubicación hacen de él un punto de referencia en la ciudad.	f	f	Cra 26 Cl.65, Manizales,Caldas	3	0101000020E61000002FA8A1E166DF52C08D51414DC6381440
262	Pila de los fundadores	“Pila de los Fundadores” en Manizales es una reliquia que data de 1888. Fue parte del acueducto municipal y un punto de encuentro para la gente. Hoy, es un emblema especial de la ciudad	f	f	Cl. 33 #24-28, Manizales, Caldas	3	0101000020E6100000A6EDD5A3A6E052C025384042C4451440
263	El sembrador o el caficultor	“El Sembrador” o “El Caficultor” es un monumento en Manizales que rinde homenaje a los trabajadores del café. Simboliza la laboriosidad y dedicación de los caficultores que han hecho de Manizales un referente en la producción de café.	f	f	a 97b-120, Cra. 35 #97b-2, Manizales, Caldas	3	0101000020E6100000CFC2CE0AEADD52C05D1A7E91D6201440
264	Plaza Bolivar	En la Plaza Bolívar, se pueden encontrar varios elementos destacados, como la estatua ecuestre de Simón Bolívar, que es el punto focal de la plaza. También hay bancos y áreas verdes donde las personas pueden descansar y disfrutar del ambiente. Además, alrededor de la plaza, se encuentran importantes edificaciones históricas, como la Catedral Basílica Metropolitana de Manizales y el Palacio de Gobierno	f	f	Cra 22 Calles 21 y 22	3	0101000020E6100000BB2ED3861CE152C0DA78D3A1C3451440
265	ecoparque los yarumos	El Ecoparque Los Yarumos en Manizales, Colombia, es un espacio natural de 53 hectáreas con diversas especies de flora y fauna. Ofrece actividades como senderismo, observación de aves y ciencia interactiva.	f	f	Calle 61a No 15A-01, Manizales	4	0101000020E6100000FD8F53F3DEDE52C0DF56FC8B7C401440
266	ecoparque Alcazares Arenillo	El Ecoparque Alcázares Murillo en Manizales, Colombia, es un pulmón verde de 33.43 hectáreas. Destaca por su rica biodiversidad y actividades de observación de fauna y flora	f	f	Calle 3, Manizales, Caldas	4	0101000020E6100000213080DAF5E152C06B9E30EBC6431440
267	Bosque Popular el Prado	El Bosque Popular El Prado en Manizales, Colombia, es un área de interés ambiental de 53 hectáreas. Ofrece zonas verdes, bosques de selva húmeda tropical, y promueve actividades físicas, deportivas y ecológicas	f	f	km 3 via al Magdalena	4	0101000020E6100000B46D18E76DDE52C031C8370B4D251440
269	Recinto del Pensamiento Jaime Restrepo Mejia	El Recinto del Pensamiento Jaime Restrepo Mejía en Manizales, Colombia, es una reserva natural de 179 hectáreas. Ofrece una rica biodiversidad y actividades de observación de fauna y flora. Es conocido por su Pabellón de Madera, un homenaje a la arquitectura de la zona cafetera	f	f	km 11 via al Magdalena	4	0101000020E61000006D324A148CDC52C0B791ACDF2B281440
270	reserva natural forestal protectora Rio Blanco	La Reserva Natural Forestal Protectora Río Blanco en Manizales, Colombia, es un área de 4.943 hectáreas de bosque y naturaleza. Es conocida por su rica biodiversidad y actividades de observación de fauna y flora. Esencial para la conservación del agua que beben los habitantes de Manizales	f	f	av. Kevin Angel N 59-181	4	0101000020E6100000EF6AE7750FE052C0DE785329AA471440
271	parque de la mujer Luz Marina Zuluaga	El Parque de la Mujer Luz Marina Zuluaga en Manizales, Colombia, es un homenaje a la primera Miss Universo colombiana. Cuenta con un puente panorámico, un ascensor, una pared con nombres de mujeres y una escultura de Luz Marina Zuluaga. También tiene un Punto de Atención a la Mujer (PAM)	f	f	carrera 23 calle 48	4	0101000020E6100000D42F5812F6DF52C008AA307706431440
272	parque Ernesto Guitierrez	El Parque Ernesto Gutiérrez es un espacio emblemático en Manizales para eventos culturales y artísticos, recientemente revitalizado con nueva iluminación	f	f	carreras 21 y 22 con calles 30 y 31	4	0101000020E61000001FA464EAC7E052C0E249B37A3C461440
273	Parque Cristo Rey o Marcelino Champañant	Parque Cristo Rey que está ubicado fuera de la Parroquia Cristo Rey en Manizales. Este parque es famoso por su ubicación justo al lado de la iglesia. Aquí se puede disfrutar de espacios verdes y del comercio que ofrece la zona.	f	f	Cl. 45 #23-43 a 23-3	4	0101000020E6100000E50C70742BE052C0EAAA4C694E431440
274	Alta montaña- Nevado Ruiz	La naturaleza geológica del parque, supone que es uno de los mayores complejos volcánicos del país, con 6 estratovolcanes de más de 4.600 metros de altura, así como una numerosa formación de fuentes termales.	f	f	Nevado del ruiz	4	0101000020E610000060C28E8FA3D452C02201566C66901340
276	Avistamiento de aves - Recinto de el pensamineto	El Recinto del Pensamiento, un lugar sin igual.Muy cerca a la ciudad, este espacio les permite a todos sus visitantes conectarse con la naturaleza, admirar el paisaje, recorrer el Bosque de Niebla que representa una esponja protectora del agua, los suelos y la biodiversidad.	f	f	Kilometro 11 Vía Al Magdalena, Manizales, Caldas	4	0101000020E610000013E5107380DC52C0AE278279A0291440
277	Parque los fundadores	El Parque Los Fundadores es conocido por su gran estatua de bronce que representa a los fundadores de la ciudad, quienes llegaron en el siglo XIX y establecieron las bases de lo que hoy es Manizales. Además de la estatua, el parque cuenta con zonas verdes, bancos para descansar, fuentes y áreas para eventos culturales y recreativos.	f	f	Cra 23 Calle 31, 32 y 33	4	0101000020E6100000EC34AC3416E152C0293C6B4D4C561440
278	Centro Historico De Manizales	Es un Bien de Interés Cultural o monumento nacional de Colombia, declarado mediante el decreto N° 2178 del 2 de diciembre de 1996, por el Ministerio de Educación, siendo un conjunto de inmuebles de arquitectura republicana, localizados en el centro de Manizales, de valor histórico y artístico	f	f	Carrera 19 a 25 y Calles 17 a 25	5	0101000020E6100000228B34F10EE152C0D4EFC2D66C451440
279	Estacion Del Ferrocaril	La Antigua Estación del Ferrocarril, es una estación del antiguo sistema de transporte y carga del Ferrocarril de Caldas, ubicado en Manizales y que actualmente es propiedad de la Universidad Autónoma de Manizales	f	f	Av. Santander #65-77	5	0101000020E6100000E801D71113DF52C04A0EB423E2381440
280	Locomotora la pichinga o la zapata	“La Pichinga” es un monumento en Manizales, ubicado en la glorieta de la Universidad Autónoma. Fue la primera locomotora que llegó a la ciudad, crucial para el desarrollo de la región y el transporte del grano de café. Anteriormente, se encontraba en el Parque Olaya Herrera	f	f	Glorieta Universidad Autónoma	5	0101000020E61000009B06D3636BE052C0B3762FEFCC441440
281	Estacion Del Cable Aereo	En la ciudad de Manizales no es la primera vez que se hablaba de un sistema de cable, pues anteriormente se tuvieron estos sistemas en funcionamiento y demostraron ser una solución al problema de comunicación entre las regiones montañosas.	f	f	Av. Santander Calle 65	5	0101000020E6100000E15F1B2F1FDF52C030702C0295391440
282	Torre de Herveo	La Torre de Herveo o Torre del Cable, es una estructura portante de madera que sirvió al sistema de transporte y carga, cable aéreo Manizales - Mariquita, originalmente ubicada en el municipio de Herveo, Tolima, de donde toma su nombre y posteriormente trasladada a Manizales.	f	f	Av Santander Calle 65 Parque Antonia Nariño	5	0101000020E6100000E15F1B2F1FDF52C030702C0295391440
283	Placio de Bellas Artes	El Palacio de Bellas Artes es una de las sedes de la Universidad de Caldas. Está ubicado sobre la avenida 12 de Octubre, cerca del Parque de las Aguas Olaya Herrera de la ciudad de Manizales, Colombia. En 1995 fue declarado monumento nacional.	f	f	carrera21 # 13 - 02	5	0101000020E610000039B8053D80E152C073B1ED8187451440
284	Palacio de Gobernación	El Palacio de la Gobernación de Caldas o Palacio amarillo, es la sede de la gobernación del departamento Colombiano de Caldas. Está ubicado sobre la plaza de Bolívar del centro histórico de Manizales capital del departamento. Fue construido entre 1925 y 1927, como resultado de la destrucción del primer palacio en el incendio de 1925.	f	f	Carrera 21 No 22 - 23	5	0101000020E610000098E1E5F21BE152C0A41A341B84451440
285	Centro de Cultura y Convenciones Teatro Fundadores	El Teatro Fundadores es el teatro más grande de la ciudad de Manizales, con capacidad para 1900 personas, posee varias salas, se ubica en el Parque del mismo nombre sobre la Avenida Santander, entre la carrera 21 y la calle 33, inaugurado en 1965, su diversos espacios permite la realización de gran variedad de eventos.	f	f	Carrera 22 calle 32 - 33	5	0101000020E610000052DB1258A9E052C0909FA252F1451440
286	torre panoramica	La Torre Panorámica de Chipre en Manizales es un mirador urbano que ofrece vistas del Nevado del Ruiz y actividades como columpios extremos y caminatas	f	f	parque del observatorio av. 12 de octubre chipre	5	0101000020E6100000575127A49AE152C0573D1642884A1440
287	Centro Cultural y de Convenciones Teatro Los Fundadores	El Teatro Los Fundadores es un icónico teatro que abrió sus puertas en 1974. Es uno de los principales escenarios culturales de la ciudad, conocido por su arquitectura moderna y su capacidad para albergar eventos diversos como conciertos, obras de teatro, y espectáculos de danza.	f	f	Cl. 33 #24-28	5	0101000020E6100000A7518EEAA5E052C03869B543F7461440
288	Universidad Nacional de Colombia - Campus Palogrande	La Universidad Nacional de Colombia sede Manizales es una de las sedes regionales de la Universidad Nacional de Colombia. Fue fundada en 1971 y es conocida por su excelencia académica y su impacto en la región.También se destaca por su énfasis en la investigación y su contribución al desarrollo regional, mediante proyectos que abordan problemáticas locales.	f	f	Carrera 27 # 64-60	5	0101000020E6100000F5AA9BFD6DDF52C09FB33FED173B1440
304	Café Tío Conejo	Experiencia cafetera, finca cafetera con alojamiento.	f	f	Vereda Santa Rita. Finca Cafe, Manizales, Caldas	6	0101000020E6100000668522DDCF891440B9E00CFE7EDF52C0
289	Universidad Nacional de Colombia - Campus El Cable	La Universidad Nacional de Colombia sede Manizales es una de las sedes regionales de la Universidad Nacional de Colombia. Fue fundada en 1971 y es conocida por su excelencia académica y su impacto en la región.También se destaca por su énfasis en la investigación y su contribución al desarrollo regional, mediante proyectos que abordan problemáticas locales.	f	f	Carrera 27 # 70-10	5	0101000020E61000005CAAEE701EDF52C0C344183BF83A1440
290	Universidad Nacional de Colombia - Campus La Nubia	La Universidad Nacional de Colombia sede Manizales es una de las sedes regionales de la Universidad Nacional de Colombia. Fue fundada en 1971 y es conocida por su excelencia académica y su impacto en la región.También se destaca por su énfasis en la investigación y su contribución al desarrollo regional, mediante proyectos que abordan problemáticas locales.	f	f	Km 9 vía al Aeropuerto La Nubia	5	0101000020E6100000EDB02AB83CDE52C0C12AF1E45B1F1440
291	Universidad De Caldas - Sede Principal	La Universidad de Caldas, fundada en 1943, es una de las instituciones de educación superior más destacadas de la región.  Se caracteriza por su compromiso con la investigación y el desarrollo regional, así como por su enfoque en la innovación y la responsabilidad social. Cuenta con laboratorios, bibliotecas, centros de investigación, y otros recursos que apoyan la formación académica y el avance científico.	f	f	Calle 65 No 26 - 10	5	0101000020E6100000D7AD749F8ADF52C0F8FA49FE9E391440
292	Universidad De Caldas - Sede Bellas Artes	La Universidad de Caldas, fundada en 1943, es una de las instituciones de educación superior más destacadas de la región.  Se caracteriza por su compromiso con la investigación y el desarrollo regional, así como por su enfoque en la innovación y la responsabilidad social. Cuenta con laboratorios, bibliotecas, centros de investigación, y otros recursos que apoyan la formación académica y el avance científico.	f	f	Carrera 21 No 13 - 02	5	0101000020E61000008F19A88C7FE152C0E50F84CDDB451440
293	Universidad De Caldas - Sede Palogrande	La Universidad de Caldas, fundada en 1943, es una de las instituciones de educación superior más destacadas de la región.  Se caracteriza por su compromiso con la investigación y el desarrollo regional, así como por su enfoque en la innovación y la responsabilidad social. Cuenta con laboratorios, bibliotecas, centros de investigación, y otros recursos que apoyan la formación académica y el avance científico.	f	f	Carrera 23 No 58-65	5	0101000020E6100000A76E308862DF52C05C819D171F3F1440
294	Universidad De Caldas - Sede Sancancio	La Universidad de Caldas, fundada en 1943, es una de las instituciones de educación superior más destacadas de la región.  Se caracteriza por su compromiso con la investigación y el desarrollo regional, así como por su enfoque en la innovación y la responsabilidad social. Cuenta con laboratorios, bibliotecas, centros de investigación, y otros recursos que apoyan la formación académica y el avance científico.	f	f	Calle 65 No 30 - 65	5	0101000020E6100000EDD6B33E88DF52C0B304AD1BC1381440
295	Parque Caldas	El Centro Comercial es un edificio conformado por 7 niveles, su oferta está conformada por marcas locales, regionales y nacionales. En el nivel 1 se encuentra la plazoleta principal donde se realizan de manera permanente eventos y activaciones de marca. En el nivel 6 se encuentra la oferta gastronómica y en el nivel 7 entretenimiento para jóvenes y chicos, considerándose como uno de los espacios más importantes para el disfrute de las familias que visitan el Centro Comercial.	f	f	Cra 21 y 22 - Calle 29 y 30	5	0101000020E610000061CCFF59D0E052C0E8E06D469E451440
296	Parque Observatorio(chipre)	Este parque se encuentra en el barrio Chipre y es conocido por ofrecer una vista panorámica impresionante de la ciudad. Desde aquí, puedes disfrutar de una vista completa de Manizales y su entorno montañoso. Además de ser un lugar popular para disfrutar del paisaje, el Parque Observatorio también cuenta con senderos para caminar y áreas verdes donde las personas pueden relajarse y disfrutar del aire fresco. Algunos visitantes también aprovechan para observar las aves que habitan en la zona	f	f	Av. 12 de Octubre	5	0101000020E6100000954E64E798E152C0F20B4FA4C34A1440
297	Centro de museos de la Universidad de Caldas	El Centro de Museos de la Universidad de Caldas es un espacio dedicado a la preservación, exhibición y difusión del patrimonio cultural y científico de la región y del país. Algunos de los museos que forman parte del Centro de Museos de la Universidad de Caldas son:Museo de Arte de la Universidad de Caldas, Museo de Historia Natural de la Universidad de Caldas, Museo Arqueológico de la Universidad de Caldas, Otros museos y espacios culturales.	f	f	Cra 23 No 58-65	5	0101000020E610000016FE4CE45BDF52C0801D85161F401440
298	Museo de arte de Caldas(Teatro los fundadores)	El Museo de Arte de la Universidad de Caldas, ubicado en el Teatro los Fundadores, cuenta con exposiciones de arqueología, geología, paleontología e historia natural. También alberga una sala digital dedicada a David Manzur.	f	f	Cl. 33 #24-28	5	0101000020E6100000BC0F8EA9AAE052C0E573B3BE1C461440
299	Samoga museo interactivo ciencia juego tecnología Universidad Nacional	Este museo ligadoa la Universidad Nacional de Colombia,sede Manizales, divulga sobre todo temasrelacionados a las ciencias exactas, como físicay matemática. Su área de exposicionesestá dividida en cuatro partes principales.La primera tiene módulos interactivos defísica y la segunda, de matemática, lógicay raciocinio.	f	f	Carrera 27 No 64-60	5	0101000020E61000008A0772FF6EDF52C095BA9634533A1440
300	Observatorio Astronómico Universidad Nacional	Este observatorio tiene como objetivo principal contribuir al desarrollo de la astronomía en Colombia y en la región, así como también fomentar el interés público por la ciencia.Entre sus actividades destacadas se encuentran la observación astronómica, la investigación en diversas áreas de la astronomía, la realización de cursos y talleres para estudiantes y público en general, y la organización de eventos de divulgación científica.El observatorio cuenta con diversos instrumentos y telescopios que permiten la observación de objetos celestes como planetas, estrellas, nebulosas y galaxias	f	f	a 62-338,, Cra. 25 #62236	5	0101000020E61000003124170770DF52C00337AA74AC391440
301	Centro Cultural Banco de la República	El Banco de la República abre su nuevo Centro Cultural en Manizales con espacios de encuentro y disfrute para todos: biblioteca, sala de exposiciones, auditorio, sala de creación, sala infantil y librería.	f	f	Carrera 23, Manizales, Caldas	5	0101000020E61000001955078A15E152C067A11362B0441440
302	Plaza de toros, Av.Centenario	Es un icónico escenario que destaca por su arquitectura y por ser sede de importantes eventos taurinos. Construida en 1948, esta plaza es conocida por su belleza arquitectónica y su ubicación en una zona montañosa que ofrece un paisaje espectacular. La Plaza de Toros de Manizales es famosa por albergar la Feria de Manizales, uno de los eventos taurinos más importantes de Colombia y de América Latina. Además de los eventos taurinos, la Plaza de Toros de Manizales también es utilizada para otros espectáculos y actividades culturales, como conciertos, eventos deportivos y festivales.	f	f	Cra. 27 No 10A-07	5	0101000020E6100000518571D396E052C05731131699671440
303	Expoferias	Expoferias es un recinto ferial y de eventos. Es conocido por albergar una variedad de ferias, exposiciones, congresos, conferencias y eventos culturales a lo largo del año.	f	f	Km 2 Av Alberto Mendoza	5	0101000020E6100000E8BC719572DE52C00D9457286D2C1440
305	Iguana Café	Café de especialidad , desayunos y panadería. Situado en el centro comercial Cable plaza.	f	f	Carrera 23 65 11 Local 103, Manizales, Caldas	6	0101000020E6100000D313967840391440B404190115DF52C0
306	Pasión del Cielo	Café de especialidad, coctelería y música en vivo. Situado en la avenida Santander.	f	f	carrera 23 # 62 - 39 Edificio Capitalia Piso 12, Manizales, Caldas	6	0101000020E6100000EA3E00A94D3C1440DE3994A12ADF52C0
307	Caferatto Café especial	En Caferatto encontrará cada mes una variedad diferente de café colombiano, métodos de preparación y la preparación tradicional del café. Café de especialidad	f	f	Cra. 23c #62-72, Manizales, Caldas	6	0101000020E6100000DBBE45A836DF52C0C1505B6E893B1440
308	Majestic Coffe & Coffe	ideal en Manizales para tomar un buen café, un delicioso cóctel, una rica torta y compartir con los amigos en un ambiente de antigüedades y en medio de buena música.	f	f	No. 54, Calle 23 #47, Manizales, Caldas	6	0101000020E6100000456A568AA1DF52C0CFCBD728DE3F1440
309	Siriana Coffee House	Café de especialidad , desayunos y panadería. Situado en el barrio palermo.	f	f	Cra 26 A Nº 67- 20 Barrio Palermo, Manizales, Caldas	6	0101000020E61000004BC8073D9B351440FDC0559E40DF52C0
310	Café Liebre de Marzo	Café de especialidad , desayunos y panadería. Situado en el barrio palermo.	f	f	Cl. 69 #24-52, Manizales, Caldas	6	0101000020E610000012DB02C32FDF52C05380391846351440
311	Coffee Parche Manizales	Cafetería con experiencia de pintura de esculturas de yeso.	f	f	Av. Santander #75A - 57, MILAN, Manizales, Caldas	6	0101000020E6100000C7E51BCCDADE52C09AEA844AEF2E1440
312	Inmersso la boutique del Café	Tienda de café de especialidad situada en el centro comercial Fundadores.	f	f	Cl. 33 #20-03, Manizales, Caldas. piso 3 fundadores	6	0101000020E6100000655CCE49A3E052C0B2340C91A7471440
313	Café La Terraza	Después de visitar Catedral de Manizales, puedes echarle un vistazo a la carta de este restaurante. En Café La Terraza van a ofrecerte una carta variada basada en la cocina colombiana. Prueba su generoso laing. La mayoría de visitantes consideran que puedes beber un insuperable café en este lugar.	f	f	Cl. 21 #23 22, Manizales, Caldas	6	0101000020E6100000144B32952CE152C04D5034BB7B441440
314	Specialty Coffee Boutique	Café de especialidad y experiencias. Lugar de reuniones. Situado en milán.	f	f	Calle 65A # 23B - 145, edificio Bellissimo Local #3, Barrio Guayacanes, Manizales, Caldas	6	0101000020E6100000C493DDCCE8371440826F9A3E3BDF52C0
315	la madriguera tio conejo	Café de especialidad y experiencias. Lugar de reuniones. Situado en milán.	f	f	Cl. 77 #2198, Manizales, Caldas	6	0101000020E6100000CC7C7F83ADDE52C09050469FD82F1440
316	Santo kaffeto	Son una tienda especializada de café en donde encontraras diversidad de bebidas, métodos de preparación, variedades de café colombiano	f	f	Cerro de oro	6	0101000020E6100000548CF33721DE52C06925E5294E3A1440
\.


--
-- TOC entry 6132 (class 0 OID 23483)
-- Dependencies: 325
-- Data for Name: sitioturisticoxservicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sitioturisticoxservicio (idsitioturistico, idservicio) FROM stdin;
\.


--
-- TOC entry 5781 (class 0 OID 16721)
-- Dependencies: 232
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- TOC entry 5787 (class 0 OID 18592)
-- Dependencies: 256
-- Data for Name: us_gaz; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5785 (class 0 OID 18578)
-- Dependencies: 254
-- Data for Name: us_lex; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5786 (class 0 OID 18604)
-- Dependencies: 258
-- Data for Name: us_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.us_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 5789 (class 0 OID 18815)
-- Dependencies: 262
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- TOC entry 5790 (class 0 OID 19147)
-- Dependencies: 307
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5791 (class 0 OID 19157)
-- Dependencies: 309
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- TOC entry 5792 (class 0 OID 19167)
-- Dependencies: 311
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: postgres
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- TOC entry 5783 (class 0 OID 18401)
-- Dependencies: 247
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- TOC entry 5784 (class 0 OID 18413)
-- Dependencies: 248
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- TOC entry 6158 (class 0 OID 0)
-- Dependencies: 315
-- Name: agendamiento_idagendamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agendamiento_idagendamiento_seq', 1, false);


--
-- TOC entry 6159 (class 0 OID 0)
-- Dependencies: 317
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_idcategoria_seq', 6, true);


--
-- TOC entry 6160 (class 0 OID 0)
-- Dependencies: 319
-- Name: foto_idfoto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.foto_idfoto_seq', 1, false);


--
-- TOC entry 6161 (class 0 OID 0)
-- Dependencies: 321
-- Name: servicio_idservicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_idservicio_seq', 1, false);


--
-- TOC entry 6162 (class 0 OID 0)
-- Dependencies: 324
-- Name: sitioturistico_idsitioturistico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sitioturistico_idsitioturistico_seq', 316, true);


--
-- TOC entry 6163 (class 0 OID 0)
-- Dependencies: 246
-- Name: topology_id_seq; Type: SEQUENCE SET; Schema: topology; Owner: postgres
--

SELECT pg_catalog.setval('topology.topology_id_seq', 1, false);


--
-- TOC entry 5946 (class 2606 OID 23516)
-- Name: agendamiento agendamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agendamiento
    ADD CONSTRAINT agendamiento_pkey PRIMARY KEY (idagendamiento);


--
-- TOC entry 5948 (class 2606 OID 23518)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (idcategoria);


--
-- TOC entry 5950 (class 2606 OID 23520)
-- Name: foto foto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_pkey PRIMARY KEY (idfoto);


--
-- TOC entry 5952 (class 2606 OID 23522)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (idservicio);


--
-- TOC entry 5954 (class 2606 OID 23524)
-- Name: servicioagendamiento servicioagendamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicioagendamiento
    ADD CONSTRAINT servicioagendamiento_pkey PRIMARY KEY (idservicio, idagendamiento);


--
-- TOC entry 5956 (class 2606 OID 23526)
-- Name: sitioturistico sitioturistico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturistico
    ADD CONSTRAINT sitioturistico_pkey PRIMARY KEY (idsitioturistico);


--
-- TOC entry 5958 (class 2606 OID 23528)
-- Name: sitioturisticoxservicio sitioturisticoxservicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturisticoxservicio
    ADD CONSTRAINT sitioturisticoxservicio_pkey PRIMARY KEY (idsitioturistico, idservicio);


--
-- TOC entry 5959 (class 2606 OID 23529)
-- Name: foto foto_idsitioturistico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foto
    ADD CONSTRAINT foto_idsitioturistico_fkey FOREIGN KEY (idsitioturistico) REFERENCES public.sitioturistico(idsitioturistico);


--
-- TOC entry 5960 (class 2606 OID 23534)
-- Name: servicioagendamiento servicioagendamiento_idagendamiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicioagendamiento
    ADD CONSTRAINT servicioagendamiento_idagendamiento_fkey FOREIGN KEY (idagendamiento) REFERENCES public.agendamiento(idagendamiento);


--
-- TOC entry 5961 (class 2606 OID 23539)
-- Name: servicioagendamiento servicioagendamiento_idservicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicioagendamiento
    ADD CONSTRAINT servicioagendamiento_idservicio_fkey FOREIGN KEY (idservicio) REFERENCES public.servicio(idservicio);


--
-- TOC entry 5962 (class 2606 OID 23544)
-- Name: sitioturistico sitioturistico_idcategoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturistico
    ADD CONSTRAINT sitioturistico_idcategoria_fkey FOREIGN KEY (idcategoria) REFERENCES public.categoria(idcategoria);


--
-- TOC entry 5963 (class 2606 OID 23549)
-- Name: sitioturisticoxservicio sitioturisticoxservicio_idservicio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturisticoxservicio
    ADD CONSTRAINT sitioturisticoxservicio_idservicio_fkey FOREIGN KEY (idservicio) REFERENCES public.servicio(idservicio);


--
-- TOC entry 5964 (class 2606 OID 23554)
-- Name: sitioturisticoxservicio sitioturisticoxservicio_idsitioturistico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sitioturisticoxservicio
    ADD CONSTRAINT sitioturisticoxservicio_idsitioturistico_fkey FOREIGN KEY (idsitioturistico) REFERENCES public.sitioturistico(idsitioturistico);


-- Completed on 2026-02-14 11:09:41

--
-- PostgreSQL database dump complete
--

