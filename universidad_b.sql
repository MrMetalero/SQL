--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: tipoasignatura; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipoasignatura AS ENUM (
    'básica',
    'obligatoria',
    'optativa'
);


ALTER TYPE public.tipoasignatura OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno (
    id integer NOT NULL,
    nif character varying(9),
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50),
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character varying(1) NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- Name: alumno_se_matricula_asignatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumno_se_matricula_asignatura (
    id_alumno integer NOT NULL,
    id_asignatura integer NOT NULL,
    id_curso_escolar integer NOT NULL
);


ALTER TABLE public.alumno_se_matricula_asignatura OWNER TO postgres;

--
-- Name: asignatura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignatura (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    creditos double precision NOT NULL,
    tipo public.tipoasignatura NOT NULL,
    curso integer NOT NULL,
    cuatrimestre integer NOT NULL,
    id_profesor integer,
    id_grado integer NOT NULL
);


ALTER TABLE public.asignatura OWNER TO postgres;

--
-- Name: curso_escolar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso_escolar (
    id integer NOT NULL,
    anyo_inicio character varying(4) NOT NULL,
    anyo_fin character varying(4) NOT NULL
);


ALTER TABLE public.curso_escolar OWNER TO postgres;

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamento (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: grado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grado (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.grado OWNER TO postgres;

--
-- Name: profesor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    nif character varying(9),
    nombre character varying(25) NOT NULL,
    apellido1 character varying(50) NOT NULL,
    apellido2 character varying(50),
    ciudad character varying(25) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(9),
    fecha_nacimiento date NOT NULL,
    sexo character varying(1) NOT NULL,
    id_departamento integer NOT NULL
);


ALTER TABLE public.profesor OWNER TO postgres;

--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo) FROM stdin;
1	89542419S	Juan	Saez	Vega	Almería	C/ Mercurio	618253876	1992-08-08	H
2	26902806M	Salvador	Sánchez	Pérez	Almería	C/ Real del barrio alto	950254837	1991-03-28	H
4	17105885A	Pedro	Heller	Pagac	Almería	C/ Estrella fugaz	\N	2000-10-05	H
6	04233869Y	José	Koss	Bayer	Almería	C/ Júpiter	628349590	1998-01-28	H
7	97258166K	Ismael	Strosin	Turcotte	Almería	C/ Neptuno	\N	1999-05-24	H
9	82842571K	Ramón	Herzog	Tremblay	Almería	C/ Urano	626351429	1996-11-21	H
11	46900725E	Daniel	Herman	Pacocha	Almería	C/ Andarax	679837625	1997-04-26	H
19	11578526G	Inma	Lakin	Yundt	Almería	C/ Picos de Europa	678652431	1998-09-01	M
21	79089577Y	Juan	Gutiérrez	López	Almería	C/ Los pinos	678652431	1998-01-01	H
22	41491230N	Antonio	Domínguez	Guerrero	Almería	C/ Cabo de Gata	626652498	1999-02-11	H
23	64753215G	Irene	Hernández	Martínez	Almería	C/ Zapillo	628452384	1996-03-12	M
24	85135690V	Sonia	Gea	Ruiz	Almería	C/ Mercurio	678812017	1995-04-13	M
\.


--
-- Data for Name: alumno_se_matricula_asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) FROM stdin;
1	1	1
1	2	1
1	3	1
1	4	1
1	5	1
1	6	1
1	7	1
1	8	1
1	9	1
1	10	1
1	1	2
1	2	2
1	3	2
1	1	3
1	2	3
1	3	3
1	1	4
1	2	4
1	3	4
2	1	1
2	2	1
2	3	1
4	1	1
4	2	1
4	3	1
4	1	2
4	2	2
4	3	2
4	4	2
4	5	2
4	6	2
4	7	2
4	8	2
4	9	2
4	10	2
\.


--
-- Data for Name: asignatura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asignatura (id, nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) FROM stdin;
1	Álgegra lineal y matemática discreta	6	básica	1	1	\N	4
2	Cálculo	6	básica	1	1	\N	4
3	Física para informática	6	básica	1	1	\N	4
4	Introducción a la programación	6	básica	1	1	\N	4
5	Organización y gestión de empresas	6	básica	1	1	\N	4
6	Estadística	6	básica	1	2	\N	4
7	Estructura y tecnología de computadores	6	básica	1	2	\N	4
8	Fundamentos de electrónica	6	básica	1	2	\N	4
9	Lógica y algorítmica	6	básica	1	2	\N	4
10	Metodología de la programación	6	básica	1	2	\N	4
11	Arquitectura de Computadores	6	básica	2	1	3	4
12	Estructura de Datos y Algoritmos I	6	obligatoria	2	1	3	4
13	Ingeniería del Software	6	obligatoria	2	1	14	4
14	Sistemas Inteligentes	6	obligatoria	2	1	3	4
15	Sistemas Operativos	6	obligatoria	2	1	14	4
16	Bases de Datos	6	básica	2	2	14	4
17	Estructura de Datos y Algoritmos II	6	obligatoria	2	2	14	4
18	Fundamentos de Redes de Computadores	6	obligatoria	2	2	3	4
19	Planificación y Gestión de Proyectos Informáticos	6	obligatoria	2	2	3	4
20	Programación de Servicios Software	6	obligatoria	2	2	14	4
21	Desarrollo de interfaces de usuario	6	obligatoria	3	1	14	4
22	Ingeniería de Requisitos	6	optativa	3	1	\N	4
23	Integración de las Tecnologías de la Información en las Organizaciones	6	optativa	3	1	\N	4
24	Modelado y Diseño del Software 1	6	optativa	3	1	\N	4
25	Multiprocesadores	6	optativa	3	1	\N	4
26	Seguridad y cumplimiento normativo	6	optativa	3	1	\N	4
27	Sistema de Información para las Organizaciones	6	optativa	3	1	\N	4
28	Tecnologías web	6	optativa	3	1	\N	4
29	Teoría de códigos y criptografía	6	optativa	3	1	\N	4
30	Administración de bases de datos	6	optativa	3	2	\N	4
31	Herramientas y Métodos de Ingeniería del Software	6	optativa	3	2	\N	4
32	Informática industrial y robótica	6	optativa	3	2	\N	4
33	Ingeniería de Sistemas de Información	6	optativa	3	2	\N	4
34	Modelado y Diseño del Software 2	6	optativa	3	2	\N	4
35	Negocio Electrónico	6	optativa	3	2	\N	4
36	Periféricos e interfaces	6	optativa	3	2	\N	4
37	Sistemas de tiempo real	6	optativa	3	2	\N	4
38	Tecnologías de acceso a red	6	optativa	3	2	\N	4
39	Tratamiento digital de imágenes	6	optativa	3	2	\N	4
40	Administración de redes y sistemas operativos	6	optativa	4	1	\N	4
41	Almacenes de Datos	6	optativa	4	1	\N	4
42	Fiabilidad y Gestión de Riesgos	6	optativa	4	1	\N	4
43	Líneas de Productos Software	6	optativa	4	1	\N	4
44	Procesos de Ingeniería del Software 1	6	optativa	4	1	\N	4
45	Tecnologías multimedia	6	optativa	4	1	\N	4
46	Análisis y planificación de las TI	6	optativa	4	2	\N	4
47	Desarrollo Rápido de Aplicaciones	6	optativa	4	2	\N	4
48	Gestión de la Calidad y de la Innovación Tecnológica	6	optativa	4	2	\N	4
49	Inteligencia del Negocio	6	optativa	4	2	\N	4
50	Procesos de Ingeniería del Software 2	6	optativa	4	2	\N	4
51	Seguridad Informática	6	optativa	4	2	\N	4
52	Biologia celular	6	básica	1	1	\N	7
53	Física	6	básica	1	1	\N	7
54	Matemáticas I	6	básica	1	1	\N	7
55	Química general	6	básica	1	1	\N	7
56	Química orgánica	6	básica	1	1	\N	7
57	Biología vegetal y animal	6	básica	1	2	\N	7
58	Bioquímica	6	básica	1	2	\N	7
59	Genética	6	básica	1	2	\N	7
60	Matemáticas II	6	básica	1	2	\N	7
61	Microbiología	6	básica	1	2	\N	7
62	Botánica agrícola	6	obligatoria	2	1	\N	7
63	Fisiología vegetal	6	obligatoria	2	1	\N	7
64	Genética molecular	6	obligatoria	2	1	\N	7
65	Ingeniería bioquímica	6	obligatoria	2	1	\N	7
66	Termodinámica y cinética química aplicada	6	obligatoria	2	1	\N	7
67	Biorreactores	6	obligatoria	2	2	\N	7
68	Biotecnología microbiana	6	obligatoria	2	2	\N	7
69	Ingeniería genética	6	obligatoria	2	2	\N	7
70	Inmunología	6	obligatoria	2	2	\N	7
71	Virología	6	obligatoria	2	2	\N	7
72	Bases moleculares del desarrollo vegetal	4.5	obligatoria	3	1	\N	7
73	Fisiología animal	4.5	obligatoria	3	1	\N	7
74	Metabolismo y biosíntesis de biomoléculas	6	obligatoria	3	1	\N	7
75	Operaciones de separación	6	obligatoria	3	1	\N	7
76	Patología molecular de plantas	4.5	obligatoria	3	1	\N	7
77	Técnicas instrumentales básicas	4.5	obligatoria	3	1	\N	7
78	Bioinformática	4.5	obligatoria	3	2	\N	7
79	Biotecnología de los productos hortofrutículas	4.5	obligatoria	3	2	\N	7
80	Biotecnología vegetal	6	obligatoria	3	2	\N	7
81	Genómica y proteómica	4.5	obligatoria	3	2	\N	7
82	Procesos biotecnológicos	6	obligatoria	3	2	\N	7
83	Técnicas instrumentales avanzadas	4.5	obligatoria	3	2	\N	7
\.


--
-- Data for Name: curso_escolar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curso_escolar (id, anyo_inicio, anyo_fin) FROM stdin;
1	2014	2015
2	2015	2016
3	2016	2017
4	2017	2018
\.


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamento (id, nombre) FROM stdin;
1	Informática
2	Matemáticas
3	Economía y Empresa
4	Educación
5	Agronomía
6	Química y Física
7	Filología
8	Derecho
9	Biología y Geología
\.


--
-- Data for Name: grado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grado (id, nombre) FROM stdin;
1	Grado en Ingeniería Agrícola (Plan 2015)
2	Grado en Ingeniería Eléctrica (Plan 2014)
3	Grado en Ingeniería Electrónica Industrial (Plan 2010)
4	Grado en Ingeniería Informática (Plan 2015)
5	Grado en Ingeniería Mecánica (Plan 2010)
6	Grado en Ingeniería Química Industrial (Plan 2010)
7	Grado en Biotecnología (Plan 2015)
8	Grado en Ciencias Ambientales (Plan 2009)
9	Grado en Matemáticas (Plan 2010)
10	Grado en Química (Plan 2009)
\.


--
-- Data for Name: profesor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesor (id, nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, id_departamento) FROM stdin;
3	11105554G	Zoe	Ramirez	Gea	Almería	C/ Marte	618223876	1979-08-19	M	1
5	38223286T	David	Schmidt	Fisher	Almería	C/ Venus	678516294	1978-01-19	H	2
8	79503962T	Cristina	Lemke	Rutherford	Almería	C/ Saturno	669162534	1977-08-21	M	3
10	61142000L	Esther	Spencer	Lakin	Almería	C/ Plutón	\N	1977-05-19	M	4
12	85366986W	Carmen	Streich	Hirthe	Almería	C/ Almanzora	\N	1971-04-29	M	4
13	73571384L	Alfredo	Stiedemann	Morissette	Almería	C/ Guadalquivir	950896725	1980-02-01	H	6
14	82937751G	Manolo	Hamill	Kozey	Almería	C/ Duero	950263514	1977-01-02	H	1
15	80502866Z	Alejandro	Kohler	Schoen	Almería	C/ Tajo	668726354	1980-03-14	H	2
16	10485008K	Antonio	Fahey	Considine	Almería	C/ Sierra de los Filabres	\N	1982-03-18	H	3
17	85869555K	Guillermo	Ruecker	Upton	Almería	C/ Sierra de Gádor	\N	1973-05-05	H	4
18	04326833G	Micaela	Monahan	Murray	Almería	C/ Veleta	662765413	1976-02-25	H	5
20	79221403L	Francesca	Schowalter	Muller	Almería	C/ Quinto pino	\N	1980-10-31	H	6
21	13175769N	Pepe	Sánchez	Ruiz	Almería	C/ Quinto pino	\N	1980-10-16	H	1
22	98816696W	Juan	Guerrero	Martínez	Almería	C/ Quinto pino	\N	1980-11-21	H	1
23	77194445M	María	Domínguez	Hernández	Almería	C/ Quinto pino	\N	1980-12-13	M	2
\.


--
-- Name: alumno alumno_nif_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_nif_key UNIQUE (nif);


--
-- Name: alumno alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_pkey PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar);


--
-- Name: asignatura asignatura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_pkey PRIMARY KEY (id);


--
-- Name: curso_escolar curso_escolar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso_escolar
    ADD CONSTRAINT curso_escolar_pkey PRIMARY KEY (id);


--
-- Name: departamento departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- Name: grado grado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grado
    ADD CONSTRAINT grado_pkey PRIMARY KEY (id);


--
-- Name: profesor profesor_nif_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_nif_key UNIQUE (nif);


--
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_alumno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_alumno_fkey FOREIGN KEY (id_alumno) REFERENCES public.alumno(id);


--
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_asignatura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_asignatura_fkey FOREIGN KEY (id_asignatura) REFERENCES public.asignatura(id);


--
-- Name: alumno_se_matricula_asignatura alumno_se_matricula_asignatura_id_curso_escolar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumno_se_matricula_asignatura
    ADD CONSTRAINT alumno_se_matricula_asignatura_id_curso_escolar_fkey FOREIGN KEY (id_curso_escolar) REFERENCES public.curso_escolar(id);


--
-- Name: asignatura asignatura_id_grado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_grado_fkey FOREIGN KEY (id_grado) REFERENCES public.grado(id);


--
-- Name: asignatura asignatura_id_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignatura
    ADD CONSTRAINT asignatura_id_profesor_fkey FOREIGN KEY (id_profesor) REFERENCES public.profesor(id);


--
-- Name: profesor profesor_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamento(id);


--
-- PostgreSQL database dump complete
--

