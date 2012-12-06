--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: archivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE archivo (
    nombre character varying(100) NOT NULL,
    nombre_archivo character varying(2000) NOT NULL,
    nombre_jasper character varying(1000) NOT NULL,
    id_tipo_archivo integer,
    id_reporte integer
);


ALTER TABLE public.archivo OWNER TO postgres;

--
-- Name: sectores_afectados_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sectores_afectados_permiso (
    id bigint NOT NULL,
    id_sector integer NOT NULL,
    id_permiso bigint NOT NULL
);


ALTER TABLE public.sectores_afectados_permiso OWNER TO postgres;

--
-- Name: areas_afectadas_permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE areas_afectadas_permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_afectadas_permiso_id_seq OWNER TO postgres;

--
-- Name: areas_afectadas_permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE areas_afectadas_permiso_id_seq OWNED BY sectores_afectados_permiso.id;


--
-- Name: areas_afectadas_permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('areas_afectadas_permiso_id_seq', 4, true);


--
-- Name: sector; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sector (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    grupo character varying(500) NOT NULL
);


ALTER TABLE public.sector OWNER TO postgres;

--
-- Name: areas_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE areas_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_trabajo_id_seq OWNER TO postgres;

--
-- Name: areas_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE areas_trabajo_id_seq OWNED BY sector.id;


--
-- Name: areas_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('areas_trabajo_id_seq', 5, true);


--
-- Name: campos_formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campos_formulario (
    id integer NOT NULL,
    id_formulario integer NOT NULL
);


ALTER TABLE public.campos_formulario OWNER TO postgres;

--
-- Name: campos_formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campos_formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campos_formulario_id_seq OWNER TO postgres;

--
-- Name: campos_formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campos_formulario_id_seq OWNED BY campos_formulario.id;


--
-- Name: campos_formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campos_formulario_id_seq', 1, false);


--
-- Name: campos_validacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE campos_validacion (
    id integer NOT NULL,
    id_campo integer,
    id_validacion integer
);


ALTER TABLE public.campos_validacion OWNER TO postgres;

--
-- Name: campos_validaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE campos_validaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campos_validaciones_id_seq OWNER TO postgres;

--
-- Name: campos_validaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE campos_validaciones_id_seq OWNED BY campos_validacion.id;


--
-- Name: campos_validaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('campos_validaciones_id_seq', 1, false);


--
-- Name: certificado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE certificado (
    id integer NOT NULL,
    descripcion character varying(1500),
    ruta_check_list character varying(1500),
    activo boolean
);


ALTER TABLE public.certificado OWNER TO postgres;

--
-- Name: certificados_emp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE certificados_emp (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    ruta character varying(1000) NOT NULL,
    id_tipo integer NOT NULL,
    id_empleado bigint
);


ALTER TABLE public.certificados_emp OWNER TO postgres;

--
-- Name: certificados_emp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE certificados_emp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificados_emp_id_seq OWNER TO postgres;

--
-- Name: certificados_emp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE certificados_emp_id_seq OWNED BY certificados_emp.id;


--
-- Name: certificados_emp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('certificados_emp_id_seq', 1, false);


--
-- Name: certificados_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE certificados_trabajo (
    id bigint NOT NULL,
    id_permiso bigint NOT NULL,
    id_certificado integer NOT NULL
);


ALTER TABLE public.certificados_trabajo OWNER TO postgres;

--
-- Name: certificados_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE certificados_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificados_trabajo_id_seq OWNER TO postgres;

--
-- Name: certificados_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE certificados_trabajo_id_seq OWNED BY certificados_trabajo.id;


--
-- Name: certificados_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('certificados_trabajo_id_seq', 1, false);


--
-- Name: contratista; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratista (
    id bigint NOT NULL,
    num_id bigint,
    nombre character varying(500) NOT NULL,
    mail character varying(500) NOT NULL,
    nombre_contacto character varying(500) NOT NULL,
    arp character varying(500) NOT NULL,
    telefono character varying(15) NOT NULL,
    nivel_riesgo character varying(500),
    objeto_social character varying(1000),
    domicilio character varying(500),
    activo boolean DEFAULT true NOT NULL,
    telefono_contacto character varying(15),
    usuario character varying(300)
);


ALTER TABLE public.contratista OWNER TO postgres;

--
-- Name: contratistas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_id_seq OWNER TO postgres;

--
-- Name: contratistas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_id_seq OWNED BY contratista.id;


--
-- Name: contratistas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_id_seq', 16, true);


--
-- Name: contratistas_proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contratistas_proyecto (
    id bigint NOT NULL,
    id_proyecto bigint NOT NULL,
    id_contratista bigint,
    actividad text
);


ALTER TABLE public.contratistas_proyecto OWNER TO postgres;

--
-- Name: contratistas_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contratistas_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contratistas_proyecto_id_seq OWNER TO postgres;

--
-- Name: contratistas_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE contratistas_proyecto_id_seq OWNED BY contratistas_proyecto.id;


--
-- Name: contratistas_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('contratistas_proyecto_id_seq', 11, true);


--
-- Name: control; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE control (
    id integer NOT NULL,
    nombre text,
    id_peligro integer,
    consecutivo integer
);


ALTER TABLE public.control OWNER TO postgres;

--
-- Name: control_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE control_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.control_id_seq OWNER TO postgres;

--
-- Name: control_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE control_id_seq OWNED BY control.id;


--
-- Name: control_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('control_id_seq', 16, true);


--
-- Name: data; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE data (
    nombre character varying(100) NOT NULL,
    descripcion character varying(1000),
    id integer NOT NULL
);


ALTER TABLE public.data OWNER TO postgres;

--
-- Name: disciplina; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE disciplina (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion text
);


ALTER TABLE public.disciplina OWNER TO postgres;

--
-- Name: disciplinas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE disciplinas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.disciplinas_id_seq OWNER TO postgres;

--
-- Name: disciplinas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE disciplinas_id_seq OWNED BY disciplina.id;


--
-- Name: disciplinas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('disciplinas_id_seq', 4, true);


--
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleado (
    id bigint NOT NULL,
    num_id bigint NOT NULL,
    nombres_apellidos character varying(500) NOT NULL,
    foto character varying(1000),
    id_contratista bigint,
    activo boolean,
    telefono character varying(15),
    fecha_induccion date,
    tipo_sangre character varying(5),
    eps character varying(255),
    observaciones text,
    betado boolean DEFAULT false NOT NULL,
    restricciones_medicas boolean DEFAULT false NOT NULL,
    trabajo_alturas boolean DEFAULT false NOT NULL,
    ruta_cert_cm character varying(1000),
    ruta_cert_ta character varying(1000),
    certificado_medico boolean DEFAULT false NOT NULL,
    cual_rest_medica text,
    usuario character varying(500)
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- Name: empleados_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleados_id_seq OWNER TO postgres;

--
-- Name: empleados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleados_id_seq OWNED BY empleado.id;


--
-- Name: empleados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleados_id_seq', 44, true);


--
-- Name: empleados_proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleados_proyecto (
    id bigint NOT NULL,
    id_empleado bigint,
    id_proyecto bigint,
    actividad text
);


ALTER TABLE public.empleados_proyecto OWNER TO postgres;

--
-- Name: empleados_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleados_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleados_proyecto_id_seq OWNER TO postgres;

--
-- Name: empleados_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleados_proyecto_id_seq OWNED BY empleados_proyecto.id;


--
-- Name: empleados_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleados_proyecto_id_seq', 5, true);


--
-- Name: equipo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipo (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    id_sector integer
);


ALTER TABLE public.equipo OWNER TO postgres;

--
-- Name: equipos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipos_id_seq OWNER TO postgres;

--
-- Name: equipos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE equipos_id_seq OWNED BY equipo.id;


--
-- Name: equipos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipos_id_seq', 7, true);


--
-- Name: estado_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_permiso (
    id integer NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.estado_permiso OWNER TO postgres;

--
-- Name: estado_trazabilidad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estado_trazabilidad (
    id integer NOT NULL,
    descripcion character varying(250) NOT NULL
);


ALTER TABLE public.estado_trazabilidad OWNER TO postgres;

--
-- Name: estados_proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE estados_proyecto (
    id integer NOT NULL,
    nombre character varying(600) NOT NULL
);


ALTER TABLE public.estados_proyecto OWNER TO postgres;

--
-- Name: estados_proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE estados_proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.estados_proyecto_id_seq OWNER TO postgres;

--
-- Name: estados_proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE estados_proyecto_id_seq OWNED BY estados_proyecto.id;


--
-- Name: estados_proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('estados_proyecto_id_seq', 1, false);


--
-- Name: formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE formulario (
    id integer NOT NULL,
    nombre character varying(250) NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.formulario OWNER TO postgres;

--
-- Name: formularios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE formularios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formularios_id_seq OWNER TO postgres;

--
-- Name: formularios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE formularios_id_seq OWNED BY formulario.id;


--
-- Name: formularios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('formularios_id_seq', 1, false);


--
-- Name: group_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE group_rol (
    id integer NOT NULL,
    id_rol bigint NOT NULL,
    id_group bigint NOT NULL
);


ALTER TABLE public.group_rol OWNER TO postgres;

--
-- Name: group_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE group_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_rol_id_seq OWNER TO postgres;

--
-- Name: group_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE group_rol_id_seq OWNED BY group_rol.id;


--
-- Name: group_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('group_rol_id_seq', 98, true);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(300)
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 31, true);


--
-- Name: idiomas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE idiomas (
    id character varying(3) NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.idiomas OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menu (
    id bigint NOT NULL,
    nombre character varying(2000) NOT NULL,
    id_menu bigint,
    idioma character varying(2) DEFAULT 'es'::character varying,
    descripcion character varying(2000)
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_seq OWNED BY menu.id;


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_seq', 112, true);


--
-- Name: operacion_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE operacion_permiso (
    id integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.operacion_permiso OWNER TO postgres;

--
-- Name: parametro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametro (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL,
    valor text NOT NULL,
    tipo character varying(20)
);


ALTER TABLE public.parametro OWNER TO postgres;

--
-- Name: parametros_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE parametros_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parametros_id_seq OWNER TO postgres;

--
-- Name: parametros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE parametros_id_seq OWNED BY parametro.id;


--
-- Name: parametros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('parametros_id_seq', 22, true);


--
-- Name: parametros_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametros_reporte (
    nombre character varying(100) NOT NULL,
    etiqueta character varying(1000) NOT NULL,
    id_tipo integer NOT NULL,
    id integer NOT NULL,
    id_data integer,
    id_reporte integer
);


ALTER TABLE public.parametros_reporte OWNER TO postgres;

--
-- Name: peligro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE peligro (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE public.peligro OWNER TO postgres;

--
-- Name: peligros_tarea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE peligros_tarea (
    id bigint NOT NULL,
    id_peligro integer NOT NULL,
    id_tarea bigint NOT NULL
);


ALTER TABLE public.peligros_tarea OWNER TO postgres;

--
-- Name: permiso_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permiso_trabajo (
    id bigint NOT NULL,
    id_disciplina integer,
    otra_disciplina character varying(1000),
    usuarios_ejecutante character varying(600),
    id_estado_permiso integer,
    tarea text,
    usuario_creacion character varying(600),
    fecha_hora_creacion timestamp without time zone,
    id_equipo integer,
    id_sector integer,
    id_proyecto bigint,
    num_orden bigint,
    hora_ini time without time zone,
    fecha_fin date,
    hora_fin time without time zone,
    fecha_ini date,
    ejecutor_contratista boolean
);


ALTER TABLE public.permiso_trabajo OWNER TO postgres;

--
-- Name: permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permiso_id_seq OWNER TO postgres;

--
-- Name: permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permiso_id_seq OWNED BY permiso_trabajo.id;


--
-- Name: permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permiso_id_seq', 29, true);


--
-- Name: precaucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE precaucion (
    id integer NOT NULL,
    descripcion character varying(1500) NOT NULL,
    activo boolean NOT NULL
);


ALTER TABLE public.precaucion OWNER TO postgres;

--
-- Name: precauciones_trabajo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE precauciones_trabajo (
    id integer NOT NULL,
    otros_cual character varying(1000),
    id_permiso bigint NOT NULL,
    id_precaucion integer NOT NULL
);


ALTER TABLE public.precauciones_trabajo OWNER TO postgres;

--
-- Name: precauciones_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE precauciones_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.precauciones_trabajo_id_seq OWNER TO postgres;

--
-- Name: precauciones_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE precauciones_trabajo_id_seq OWNED BY precauciones_trabajo.id;


--
-- Name: precauciones_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('precauciones_trabajo_id_seq', 1, false);


--
-- Name: proyecto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proyecto (
    id bigint NOT NULL,
    num_cuenta_cargada bigint NOT NULL,
    nombre character varying(1000) NOT NULL,
    num_gestion_cambio bigint NOT NULL,
    fecha_fin date,
    fecha_ini date,
    id_estado integer,
    estado integer
);


ALTER TABLE public.proyecto OWNER TO postgres;

--
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proyecto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proyecto_id_seq OWNER TO postgres;

--
-- Name: proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proyecto_id_seq OWNED BY proyecto.id;


--
-- Name: proyecto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proyecto_id_seq', 31, true);


--
-- Name: reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporte (
    nombre character varying(100) NOT NULL,
    roles text DEFAULT 'ALL'::text NOT NULL,
    id_proceso integer,
    id integer NOT NULL
);


ALTER TABLE public.reporte OWNER TO postgres;

--
-- Name: resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resource (
    id bigint NOT NULL,
    nombre character varying(2000) NOT NULL,
    descripcion character varying(300),
    id_menu bigint NOT NULL,
    url character varying(500) NOT NULL,
    idioma character varying(2) DEFAULT 'es'::character varying
);


ALTER TABLE public.resource OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.resource_id_seq OWNER TO postgres;

--
-- Name: resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resource_id_seq OWNED BY resource.id;


--
-- Name: resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('resource_id_seq', 199, true);


--
-- Name: riesgo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE riesgo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.riesgo_id_seq OWNER TO postgres;

--
-- Name: riesgo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE riesgo_id_seq OWNED BY peligro.id;


--
-- Name: riesgo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('riesgo_id_seq', 5, true);


--
-- Name: riesgos_peligro_tarea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE riesgos_peligro_tarea (
    id bigint NOT NULL,
    consecutivo integer,
    nombre text,
    id_peligro_tarea bigint
);


ALTER TABLE public.riesgos_peligro_tarea OWNER TO postgres;

--
-- Name: riesgos_peligro_permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE riesgos_peligro_permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.riesgos_peligro_permiso_id_seq OWNER TO postgres;

--
-- Name: riesgos_peligro_permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE riesgos_peligro_permiso_id_seq OWNED BY riesgos_peligro_tarea.id;


--
-- Name: riesgos_peligro_permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('riesgos_peligro_permiso_id_seq', 56, true);


--
-- Name: riesgos_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE riesgos_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.riesgos_trabajo_id_seq OWNER TO postgres;

--
-- Name: riesgos_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE riesgos_trabajo_id_seq OWNED BY peligros_tarea.id;


--
-- Name: riesgos_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('riesgos_trabajo_id_seq', 47, true);


--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(2000)
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_id_seq OWNER TO postgres;

--
-- Name: rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_id_seq OWNED BY rol.id;


--
-- Name: rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_id_seq', 34, true);


--
-- Name: rol_resource; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol_resource (
    id bigint NOT NULL,
    id_resource bigint NOT NULL,
    id_rol bigint
);


ALTER TABLE public.rol_resource OWNER TO postgres;

--
-- Name: rol_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rol_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rol_resource_id_seq OWNER TO postgres;

--
-- Name: rol_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE rol_resource_id_seq OWNED BY rol_resource.id;


--
-- Name: rol_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('rol_resource_id_seq', 865, true);


--
-- Name: tarea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tarea (
    id bigint NOT NULL,
    datos text NOT NULL,
    id_permiso bigint NOT NULL,
    consecutivo integer NOT NULL
);


ALTER TABLE public.tarea OWNER TO postgres;

--
-- Name: tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarea_id_seq OWNER TO postgres;

--
-- Name: tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tarea_id_seq OWNED BY tarea.id;


--
-- Name: tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tarea_id_seq', 70, true);


--
-- Name: tipo_archivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_archivo (
    id integer NOT NULL,
    tipo character varying(100)
);


ALTER TABLE public.tipo_archivo OWNER TO postgres;

--
-- Name: tipo_certificados_emp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_certificados_emp (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL
);


ALTER TABLE public.tipo_certificados_emp OWNER TO postgres;

--
-- Name: tipo_id; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_id (
    id integer NOT NULL,
    codigo character varying(100)
);


ALTER TABLE public.tipo_id OWNER TO postgres;

--
-- Name: tipo_parametro_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_parametro_reporte (
    tipo character varying(100) NOT NULL,
    id integer NOT NULL,
    descripcion character varying(1000)
);


ALTER TABLE public.tipo_parametro_reporte OWNER TO postgres;

--
-- Name: tipo_proceso_reporte; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_proceso_reporte (
    id integer NOT NULL,
    nombre character varying(1000)
);


ALTER TABLE public.tipo_proceso_reporte OWNER TO postgres;

--
-- Name: trazabilidad_activacion_emps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trazabilidad_activacion_emps (
    id bigint NOT NULL,
    id_empleado bigint NOT NULL,
    fecha_activacion date,
    usuario_activador character varying(600)
);


ALTER TABLE public.trazabilidad_activacion_emps OWNER TO postgres;

--
-- Name: trazabilidad_activacion_emps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trazabilidad_activacion_emps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trazabilidad_activacion_emps_id_seq OWNER TO postgres;

--
-- Name: trazabilidad_activacion_emps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trazabilidad_activacion_emps_id_seq OWNED BY trazabilidad_activacion_emps.id;


--
-- Name: trazabilidad_activacion_emps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trazabilidad_activacion_emps_id_seq', 1, false);


--
-- Name: trazabilidad_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE trazabilidad_permiso (
    id bigint NOT NULL,
    fecha_hora timestamp without time zone DEFAULT now() NOT NULL,
    id_estado_trazabilidad integer NOT NULL,
    id_permiso bigint NOT NULL,
    usr_grp_asignado character varying(600),
    id_operacion integer NOT NULL,
    nota text,
    usuario character varying(500)
);


ALTER TABLE public.trazabilidad_permiso OWNER TO postgres;

--
-- Name: trazabilidad_trabajo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE trazabilidad_trabajo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trazabilidad_trabajo_id_seq OWNER TO postgres;

--
-- Name: trazabilidad_trabajo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE trazabilidad_trabajo_id_seq OWNED BY trazabilidad_permiso.id;


--
-- Name: trazabilidad_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('trazabilidad_trabajo_id_seq', 78, true);


--
-- Name: user_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE user_group (
    id integer NOT NULL,
    id_user bigint NOT NULL,
    id_group bigint NOT NULL
);


ALTER TABLE public.user_group OWNER TO postgres;

--
-- Name: user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_id_seq OWNER TO postgres;

--
-- Name: user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_group_id_seq OWNED BY user_group.id;


--
-- Name: user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_group_id_seq', 132, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    usr character varying(300) NOT NULL,
    pwd character varying(250) NOT NULL,
    estado integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 35, true);


--
-- Name: validaciones_formulario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE validaciones_formulario (
    id integer NOT NULL,
    id_campo_formulario integer NOT NULL
);


ALTER TABLE public.validaciones_formulario OWNER TO postgres;

--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE validaciones_formulario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validaciones_formulario_id_seq OWNER TO postgres;

--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE validaciones_formulario_id_seq OWNED BY validaciones_formulario.id;


--
-- Name: validaciones_formulario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('validaciones_formulario_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campos_formulario ALTER COLUMN id SET DEFAULT nextval('campos_formulario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY campos_validacion ALTER COLUMN id SET DEFAULT nextval('campos_validaciones_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_emp ALTER COLUMN id SET DEFAULT nextval('certificados_emp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_trabajo ALTER COLUMN id SET DEFAULT nextval('certificados_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratista ALTER COLUMN id SET DEFAULT nextval('contratistas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_proyecto ALTER COLUMN id SET DEFAULT nextval('contratistas_proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY control ALTER COLUMN id SET DEFAULT nextval('control_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY disciplina ALTER COLUMN id SET DEFAULT nextval('disciplinas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado ALTER COLUMN id SET DEFAULT nextval('empleados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleados_proyecto ALTER COLUMN id SET DEFAULT nextval('empleados_proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipo ALTER COLUMN id SET DEFAULT nextval('equipos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY estados_proyecto ALTER COLUMN id SET DEFAULT nextval('estados_proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY formulario ALTER COLUMN id SET DEFAULT nextval('formularios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol ALTER COLUMN id SET DEFAULT nextval('group_rol_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id SET DEFAULT nextval('menu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametro ALTER COLUMN id SET DEFAULT nextval('parametros_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peligro ALTER COLUMN id SET DEFAULT nextval('riesgo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peligros_tarea ALTER COLUMN id SET DEFAULT nextval('riesgos_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo ALTER COLUMN id SET DEFAULT nextval('permiso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precauciones_trabajo ALTER COLUMN id SET DEFAULT nextval('precauciones_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto ALTER COLUMN id SET DEFAULT nextval('proyecto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource ALTER COLUMN id SET DEFAULT nextval('resource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY riesgos_peligro_tarea ALTER COLUMN id SET DEFAULT nextval('riesgos_peligro_permiso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol ALTER COLUMN id SET DEFAULT nextval('rol_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource ALTER COLUMN id SET DEFAULT nextval('rol_resource_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sector ALTER COLUMN id SET DEFAULT nextval('areas_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sectores_afectados_permiso ALTER COLUMN id SET DEFAULT nextval('areas_afectadas_permiso_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarea ALTER COLUMN id SET DEFAULT nextval('tarea_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_activacion_emps ALTER COLUMN id SET DEFAULT nextval('trazabilidad_activacion_emps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_permiso ALTER COLUMN id SET DEFAULT nextval('trazabilidad_trabajo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group ALTER COLUMN id SET DEFAULT nextval('user_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY validaciones_formulario ALTER COLUMN id SET DEFAULT nextval('validaciones_formulario_id_seq'::regclass);


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY archivo (nombre, nombre_archivo, nombre_jasper, id_tipo_archivo, id_reporte) FROM stdin;
A1	P{fechaIni}.replaceAll("(\\d{4})-(\\d{2})-(\\d{2})", "$1$2$3");P{fechaFin}.replaceAll("(\\d{4})-(\\d{2})-(\\d{2})","$1$2$3");.PDF	rep1.jasper	2	1
\.


--
-- Data for Name: campos_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campos_formulario (id, id_formulario) FROM stdin;
\.


--
-- Data for Name: campos_validacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY campos_validacion (id, id_campo, id_validacion) FROM stdin;
\.


--
-- Data for Name: certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY certificado (id, descripcion, ruta_check_list, activo) FROM stdin;
\.


--
-- Data for Name: certificados_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY certificados_emp (id, nombre, ruta, id_tipo, id_empleado) FROM stdin;
\.


--
-- Data for Name: certificados_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY certificados_trabajo (id, id_permiso, id_certificado) FROM stdin;
\.


--
-- Data for Name: contratista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratista (id, num_id, nombre, mail, nombre_contacto, arp, telefono, nivel_riesgo, objeto_social, domicilio, activo, telefono_contacto, usuario) FROM stdin;
14	123	CON1	J	CON1	N	1	N	C	C	t	1	CON1
15	234	CON2	C	C	C	C	C	C	C	t	C	CON2
16	345	CON3	C	C	C	C	C	C	C	t	C	CON3
\.


--
-- Data for Name: contratistas_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratistas_proyecto (id, id_proyecto, id_contratista, actividad) FROM stdin;
11	31	14	
\.


--
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY control (id, nombre, id_peligro, consecutivo) FROM stdin;
7	Buscar Extintor	4	1
8	Abrir Extintor	4	2
9	Darle Duro a la Llama	4	3
10	Limpiar el drenaje	5	1
11	Tener listas las bombas	5	2
12	c1	3	1
13	c2	3	2
14	c1	2	1
15	c2	2	2
16	c3	2	3
\.


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY data (nombre, descripcion, id) FROM stdin;
TIPOS_ID	Representa los tipos de identificación que puede tener una persona	1
\.


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY disciplina (id, nombre, descripcion) FROM stdin;
1	Dis1	Dis1
2	Dis2	Dis2
3	Dis3	Dis3
-1	Otra	Otra
4	Dis4	Dis4
\.


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleado (id, num_id, nombres_apellidos, foto, id_contratista, activo, telefono, fecha_induccion, tipo_sangre, eps, observaciones, betado, restricciones_medicas, trabajo_alturas, ruta_cert_cm, ruta_cert_ta, certificado_medico, cual_rest_medica, usuario) FROM stdin;
38	1	EMP1	\N	\N	t	1	2012-11-01	1	1		f	f	t	/usr/proceso1096/certs/1/CM.pdf	/usr/proceso1096/certs/1/TA.pdf	t	\N	EMP1
39	2	EMP2	\N	\N	t	2	2012-11-01	2	2		f	f	t	/usr/proceso1096/certs/2/CM.pdf	/usr/proceso1096/certs/2/TA.pdf	t	\N	EMP2
40	3	EMP3	\N	\N	t	3	2012-11-01	3	3	\N	f	f	t	/usr/proceso1096/certs/3/CM.pdf	/usr/proceso1096/certs/3/TA.pdf	t	\N	EMP3
41	4	EMP4	\N	\N	t	4	2012-11-01	4	4	\N	f	f	t	/usr/proceso1096/certs/4/CM.pdf	/usr/proceso1096/certs/4/TA.pdf	t	\N	EMP4
42	5	EMP5	\N	14	t	5	2012-11-01	5	5	\N	f	f	t	/usr/proceso1096/certs/5/CM.pdf	/usr/proceso1096/certs/5/TA.pdf	t	\N	EMP5
43	6	EMP6	\N	14	t	6	2012-11-01	6	6	\N	f	f	t	/usr/proceso1096/certs/6/CM.pdf	/usr/proceso1096/certs/6/TA.pdf	t	\N	EMP6
44	7	EMP7	\N	15	t	7	2012-11-01	7	7		f	f	t	/usr/proceso1096/certs/7/CM.pdf	/usr/proceso1096/certs/7/TA.pdf	t	\N	EMP7
\.


--
-- Data for Name: empleados_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleados_proyecto (id, id_empleado, id_proyecto, actividad) FROM stdin;
5	38	31	
\.


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipo (id, nombre, id_sector) FROM stdin;
2	Troquelador	3
3	Computador	3
1	Yunque	3
4	Tolva	3
5	Escritorio	5
6	Silla	5
\.


--
-- Data for Name: estado_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_permiso (id, descripcion) FROM stdin;
0	VENCIDO
1	CREADO
2	DILIGENCIADO
3	APROBADO CALIDAD
4	APROBADO SEGURIDAD
5	APROBADO JEFE
6	NO APROBADO CALIDAD
7	NO APROBADO SEGURIDAD
8	NO APROBADO JEFE
9	TERMINADO
10	SUSPENDIDO
11	CANCELADO CALIDAD
12	CANCELADO SEGURIDAD
13	CANCELADO JEFE
14	CANCELADO
15	APROBADO
16	APROBADA_CANCELACION
\.


--
-- Data for Name: estado_trazabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_trazabilidad (id, descripcion) FROM stdin;
1	ASIGNADO
2	EJECUTADO
3	NO EJECUTADO
\.


--
-- Data for Name: estados_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estados_proyecto (id, nombre) FROM stdin;
1	ACTIVO
2	TERMINADO
3	CANCELADO
\.


--
-- Data for Name: formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY formulario (id, nombre, descripcion) FROM stdin;
\.


--
-- Data for Name: group_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY group_rol (id, id_rol, id_group) FROM stdin;
52	12	16
53	25	16
54	12	18
55	26	18
56	12	23
57	27	23
58	12	24
59	28	24
69	12	25
70	28	25
71	29	25
72	12	26
73	28	26
74	30	26
78	12	27
79	28	27
80	31	27
81	12	28
82	28	28
83	32	28
84	12	29
85	28	29
86	33	29
87	12	30
88	28	30
89	33	30
90	12	31
91	28	31
92	34	31
98	1	17
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, codigo, descripcion) FROM stdin;
16	ADMINISTRADORES	-
17	MASTER	-
18	VALIDADORES	-
23	CONTRATISTAS	
24	EMPLEADOS	
25	JEFES DE SECTOR	
26	ADMINISTRADORES CALIDAD	
27	ADMINISTRADORES SEGURIDAD	
28	RECEPCIONISTAS	
29	INGENIEROS PROYECTO	
30	INGENIEROS ESPECIALISTAS	
31	GERENTES	
\.


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY idiomas (id, nombre) FROM stdin;
es	ESPAÑOL
en	INGLES
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu (id, nombre, id_menu, idioma, descripcion) FROM stdin;
1	RAIZ	\N	es	\N
97	Adm. Users	1	en	\N
98	Work Permit	1	en	\N
99	Contractors	1	en	\N
100	Tools	1	en	\N
101	Generals	1	en	\N
102	Reports	1	en	\N
103	General	1	es	\N
104	Reportes	1	es	\N
105	Admin Usuarios	1	es	\N
106	Permisos de Trabajo	1	es	\N
107	Contratistas	1	es	\N
108	Herramientas	1	es	\N
111	Prueba1	1	es	\N
112	Prueba2	111	es	\N
\.


--
-- Data for Name: operacion_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operacion_permiso (id, descripcion) FROM stdin;
0	CREAR
1	DILIGENCIAR
2	APROBAR
3	TERMINAR
4	CANCELAR
5	SUSPENDER
6	NO APROBAR
\.


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametro (id, nombre, valor, tipo) FROM stdin;
9	grupoEmpleado	EMPLEADOS	AU
12	rolMaster	MASTER	AU
13	rolContratista	CONTRATISTA	AU
14	rolAdmin	ADMINISTRADOR	AU
15	rolValidador	VALIDADOR	AU
17	grupoCalidad	ADMINISTRADORES CALIDAD	Gestion
18	grupoSeguridad	ADMINISTRADORES SEGURIDAD	Gestion
16	rolAutArea	AUTORIDAD_AREA	AU
19	rolGerente	GERENCIA	AU
1	rutaLog	/Proy18001_NV3/log	LOG1
7	rutaDescarga	/Proy18001_NV3/descargas	FILE
8	rutaReporte	/Proy18001_NV3/reportes	FILE
11	dirCertificados	/Proy18001_NV3/certs	FILE
20	prueba1	valor prueba	
21	prueba2		valor prueba 2
22	prueba3	Valor prueba 3	
10	grupoContratista	CONTRATISTAS	AU1
\.


--
-- Data for Name: parametros_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY parametros_reporte (nombre, etiqueta, id_tipo, id, id_data, id_reporte) FROM stdin;
fechaIni	P1	3	1	\N	1
fechaFin	P2	3	2	\N	1
\.


--
-- Data for Name: peligro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peligro (id, nombre) FROM stdin;
2	a2 riesgo
3	a3 riesgo
4	INCENDIO
5	INUNDACION
\.


--
-- Data for Name: peligros_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peligros_tarea (id, id_peligro, id_tarea) FROM stdin;
46	5	69
47	4	70
\.


--
-- Data for Name: permiso_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permiso_trabajo (id, id_disciplina, otra_disciplina, usuarios_ejecutante, id_estado_permiso, tarea, usuario_creacion, fecha_hora_creacion, id_equipo, id_sector, id_proyecto, num_orden, hora_ini, fecha_fin, hora_fin, fecha_ini, ejecutor_contratista) FROM stdin;
26	1	\N	EMP2	14	Mantenimiento	INGENIERIA	2012-11-13 10:42:33.401	6	5	\N	\N	\N	\N	\N	\N	f
28	-1		EMP2	5	Mantenimiento	ADMIN1	2012-11-13 16:14:48.158	3	3	\N	\N	\N	\N	\N	\N	f
29	-1	\N	EMP2	1	Limpiar Silla	INGENIERIA	2012-12-06 11:01:37.906	6	5	\N	\N	\N	\N	\N	\N	f
\.


--
-- Data for Name: precaucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY precaucion (id, descripcion, activo) FROM stdin;
\.


--
-- Data for Name: precauciones_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY precauciones_trabajo (id, otros_cual, id_permiso, id_precaucion) FROM stdin;
\.


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto (id, num_cuenta_cargada, nombre, num_gestion_cambio, fecha_fin, fecha_ini, id_estado, estado) FROM stdin;
31	1	Proyecto1	1	2012-11-20	2012-11-13	1	\N
\.


--
-- Data for Name: reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporte (nombre, roles, id_proceso, id) FROM stdin;
R1	ROLE_ADMIN, ROLE_USER	1	1
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY resource (id, nombre, descripcion, id_menu, url, idioma) FROM stdin;
160	Employee	\N	99	/contratistas/empleados.xhtml	en
161	Permissions	\N	98	/permisostrabajo/permisos.xhtml	en
162	My permission	\N	98	/permisostrabajo/permisos_x_diligenciar.xhtml	en
163	Change password	\N	101	/general/change_password.xhtml	en
164	Params	\N	101	/general/parametros.xhtml	en
165	Log	\N	101	/general/log.xhtml	en
166	DB	\N	101	/general/adminBD.xhtml	en
167	Reports	\N	101	/reportes/reportes.xhtml	en
168	Users	\N	97	/usuarios/usuarios.xhtml	en
169	Menus	\N	97	/usuarios/menus.xhtml	en
170	Groups	\N	97	/usuarios/grupos.xhtml	en
171	Roles	\N	97	/usuarios/roles.xhtml	en
172	Resources	\N	97	/usuarios/recursos.xhtml	en
173	Proyects	\N	98	/permisostrabajo/proyecto.xhtml	en
174	Contractors	\N	99	/contratistas/contratistas.xhtml	en
175	Sectors	\N	100	/pt_tablasref/sector.xhtml	en
176	Dangers	\N	100	/pt_tablasref/peligro.xhtml	en
177	Change Language	\N	101	/general/cambiar_idioma.xhtml	en
178	Empleados	\N	107	/contratistas/empleados.xhtml	es
179	Menus	\N	105	/usuarios/menus.xhtml	es
180	Grupos	\N	105	/usuarios/grupos.xhtml	es
181	Roles	\N	105	/usuarios/roles.xhtml	es
182	Recursos	\N	105	/usuarios/recursos.xhtml	es
183	Proyectos	\N	106	/permisostrabajo/proyecto.xhtml	es
184	Contratistas	\N	107	/contratistas/contratistas.xhtml	es
185	Sectores	\N	108	/pt_tablasref/sector.xhtml	es
186	Peligros	\N	108	/pt_tablasref/peligro.xhtml	es
187	Cambiar Idioma	\N	103	/general/cambiar_idioma.xhtml	es
188	Permisos	\N	106	/permisostrabajo/permisos.xhtml	es
189	Mis Permisos Asignados	\N	106	/permisostrabajo/permisos_x_diligenciar.xhtml	es
190	Cambiar Clave	\N	103	/general/change_password.xhtml	es
191	Parametros	\N	103	/general/parametros.xhtml	es
192	Log	\N	103	/general/log.xhtml	es
193	BD	\N	103	/general/adminBD.xhtml	es
194	Reportes	\N	103	/reportes/reportes.xhtml	es
195	Usuarios	\N	105	/usuarios/usuarios.xhtml	es
198	R. Prueba1	\N	112	/index.xhtml	es
199	R. Prueba2	\N	112	/index.xhtml	es
\.


--
-- Data for Name: riesgos_peligro_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY riesgos_peligro_tarea (id, consecutivo, nombre, id_peligro_tarea) FROM stdin;
54	1	ahogo	46
55	1	Quemarse	47
56	2	Accidentarse	47
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol (id, codigo, descripcion) FROM stdin;
12	ROLE_USER	\N
25	ADMINISTRADOR	
26	VALIDADOR	
32	RECEPCIONISTA	
33	INGENIERIA	
31	SEGURIDAD	
30	CALIDAD	
27	CONTRATISTA	
28	EMPLEADO	
29	AUTORIDAD_AREA	
34	GERENCIA	
1	MASTER	
\.


--
-- Data for Name: rol_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol_resource (id, id_resource, id_rol) FROM stdin;
724	160	25
725	160	26
726	160	32
727	160	27
728	160	34
729	160	1
730	161	25
731	161	1
732	161	34
733	161	27
734	161	33
735	162	25
736	162	1
737	162	34
738	162	27
739	162	33
740	162	29
741	162	31
742	162	30
743	162	28
744	163	29
745	163	31
746	163	34
747	163	27
748	163	12
749	163	30
750	163	28
751	163	1
752	163	32
753	163	25
754	163	26
755	163	33
756	164	1
757	165	1
758	166	1
759	167	1
760	168	1
761	168	25
762	169	1
763	170	1
764	170	25
765	171	1
766	172	1
767	173	25
768	173	1
769	173	34
770	173	33
771	174	25
772	174	1
773	174	34
774	174	26
775	175	25
776	175	1
777	175	34
778	176	25
779	176	1
780	176	34
781	177	29
782	177	31
783	177	34
784	177	27
785	177	12
786	177	30
787	177	28
788	177	1
789	177	32
790	177	25
791	177	26
792	177	33
793	178	25
794	178	26
795	178	32
796	178	27
797	178	34
798	178	1
799	179	1
800	180	1
801	180	25
802	181	1
803	182	1
804	183	25
805	183	1
806	183	34
807	183	33
808	184	25
809	184	1
810	184	34
811	184	26
812	185	25
813	185	1
814	185	34
815	186	25
816	186	1
817	186	34
818	187	29
819	187	31
820	187	34
821	187	27
822	187	12
823	187	30
824	187	28
825	187	1
826	187	32
827	187	25
828	187	26
829	187	33
830	188	25
831	188	1
832	188	34
833	188	27
834	188	33
835	189	25
836	189	1
837	189	34
838	189	27
839	189	33
840	189	29
841	189	31
842	189	30
843	189	28
844	190	29
845	190	31
846	190	34
847	190	27
848	190	12
849	190	30
850	190	28
851	190	1
852	190	32
853	190	25
854	190	26
855	190	33
856	191	1
857	192	1
858	193	1
859	194	1
860	195	1
861	195	25
864	198	25
865	199	25
\.


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sector (id, nombre, grupo) FROM stdin;
3	Area1	JEFES DE SECTOR
5	Area 5	JEFES DE SECTOR
4	Area4	JEFES DE SECTOR
\.


--
-- Data for Name: sectores_afectados_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sectores_afectados_permiso (id, id_sector, id_permiso) FROM stdin;
4	4	26
\.


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tarea (id, datos, id_permiso, consecutivo) FROM stdin;
69	Limpiar	26	1
70	Lavar	28	1
\.


--
-- Data for Name: tipo_archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_archivo (id, tipo) FROM stdin;
1	XLS
2	PDF
3	TXT
\.


--
-- Data for Name: tipo_certificados_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_certificados_emp (id, nombre) FROM stdin;
\.


--
-- Data for Name: tipo_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_id (id, codigo) FROM stdin;
1	CC
2	NIT
3	CE
\.


--
-- Data for Name: tipo_parametro_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_parametro_reporte (tipo, id, descripcion) FROM stdin;
NUMERIC	1	Representa valores numéricos: int, long, double, float
TEXT	2	Representa cadenas de texto
DATE	3	Representa Fechas
TIME	4	Representa Horas
DATA	5	Representa tablas multivaluadas, como municipios, tipos de id, etc; DEBE EXISTIR UNA TABLA que las represente
\.


--
-- Data for Name: tipo_proceso_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipo_proceso_reporte (id, nombre) FROM stdin;
1	REPORTES
2	ARCHIVOS
\.


--
-- Data for Name: trazabilidad_activacion_emps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trazabilidad_activacion_emps (id, id_empleado, fecha_activacion, usuario_activador) FROM stdin;
\.


--
-- Data for Name: trazabilidad_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trazabilidad_permiso (id, fecha_hora, id_estado_trazabilidad, id_permiso, usr_grp_asignado, id_operacion, nota, usuario) FROM stdin;
77	2012-12-06 11:01:37.906	2	29	INGENIERIA	0	\N	INGENIERIA
78	2012-12-06 11:01:37.906	1	29	EMP2	1	\N	\N
53	2012-11-13 10:42:33.401	2	26	INGENIERIA	0	\N	INGENIERIA
54	2012-11-13 10:44:03.057	2	26	EMP2	1	\N	EMP2
60	2012-11-13 11:12:57.967	2	26	JEFES DE SECTOR	6	Falta agregar otros sectores afectados	JEFSEC
55	2012-11-13 10:44:03.057	3	26	JEFES DE SECTOR	2	\N	\N
56	2012-11-13 10:44:03.06	3	26	ADMINISTRADORES CALIDAD	2	\N	\N
57	2012-11-13 10:44:03.061	3	26	ADMINISTRADORES SEGURIDAD	2	\N	\N
61	2012-11-13 11:21:47.135	2	26	EMP2	1	\N	EMP2
62	2012-11-13 11:22:27.349	2	26	JEFES DE SECTOR	2	ok	JEFSEC
63	2012-11-13 11:28:56.634	2	26	ADMINISTRADORES CALIDAD	2	OK	JEFCAL
64	2012-11-13 11:29:15.894	2	26	ADMINISTRADORES SEGURIDAD	2	OK	JEFSEG
65	2012-11-13 11:30:03.704	2	26	EMP2	3	OK.	EMP2
66	2012-11-13 11:39:36.075	2	26	JEFES DE SECTOR	4	OK	JEFSEC
67	2012-11-13 11:42:48.719	2	26	ADMINISTRADORES CALIDAD	4	ok	JEFCAL
68	2012-11-13 11:43:01.85	2	26	ADMINISTRADORES SEGURIDAD	4	ok	JEFSEG
69	2012-11-13 11:45:57.84	2	26	INGENIERIA	4	OK	INGENIERIA
72	2012-11-13 16:14:48.158	2	28	ADMIN1	0	\N	ADMIN1
75	2012-11-13 16:17:20.711	1	28	ADMINISTRADORES CALIDAD	2	\N	\N
76	2012-11-13 16:17:20.712	1	28	ADMINISTRADORES SEGURIDAD	2	\N	\N
73	2012-11-13 16:17:20.709	2	28	EMP2	1	\N	EMP2
74	2012-11-13 16:18:04.556	2	28	JEFES DE SECTOR	2	Se aprueba con condicion de que laven bien	JEFSEC
\.


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY user_group (id, id_user, id_group) FROM stdin;
100	1	17
101	14	16
103	16	26
105	18	25
107	17	27
111	15	18
120	21	28
121	22	31
122	23	23
123	24	23
124	25	23
125	26	24
126	27	24
127	29	24
128	30	24
129	31	24
130	32	24
131	34	24
132	35	29
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, usr, pwd, estado) FROM stdin;
21	RECEP	a7fd6b064016368ac5b3175abdba4458a0f9ffb4	1
22	GERENTE	223ef7f245391afcdedaeeb5ea6813521a801ac3	1
23	CON1	dffe7541e021c8ae8212afbe4ec0d3f88853b4d2	1
24	CON2	09b490ad14744f5a34dbb1450c2f14d31b9f7f5d	1
25	CON3	c87e62d0fceb44420d8b5ac6db983923dded8908	1
26	EMP1	3470aa75126d0927ff5aa1fdc49a7e83e44c63b4	1
27	EMP2	e1fc5313b20c524fcb2ee98226c8b96d3e076417	1
29	EMP3	78dd22a1a4db5e11280efe4f8e53b741c32ccab1	1
30	EMP4	8db28af088158c7a89fb78d76f0039f24be7988b	1
31	EMP5	d39255ce4161832362088a39022dc7567dfdab78	1
32	EMP6	cf18d0f1d11878086a64aeec5ea68e28560e9c1e	1
34	EMP7	82faa47bfdfff09e4a4dd24b3da053ed79b794cf	1
35	INGENIERIA	3aebcb4f1d30aad7f48dcac76e324fb0457325c1	1
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	1
14	ADMIN1	5b2d560b3f2640cadc2ff50ca64bdd936f77eb2d	1
16	JEFCAL	6c39a58d667a1b780857908e0c4308fd06d55f28	1
18	JEFSEC	21111827dfb7fadb77670e8ec48b6436250a3d7e	1
17	JEFSEG	65b4c42c33e2d4ee6dc0ef088115c98a731a4696	1
15	VALIDADOR	c9bc9fffc3788bef6062373a4adc5d8e93112872	1
\.


--
-- Data for Name: validaciones_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY validaciones_formulario (id, id_campo_formulario) FROM stdin;
\.


--
-- Name: archivo_fk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT archivo_fk PRIMARY KEY (nombre);


--
-- Name: areas_afectadas_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sectores_afectados_permiso
    ADD CONSTRAINT areas_afectadas_permiso_pk PRIMARY KEY (id);


--
-- Name: areas_trabajo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sector
    ADD CONSTRAINT areas_trabajo_pk PRIMARY KEY (id);


--
-- Name: campos_formulario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campos_formulario
    ADD CONSTRAINT campos_formulario_pk PRIMARY KEY (id);


--
-- Name: campos_validaciones_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY campos_validacion
    ADD CONSTRAINT campos_validaciones_pk PRIMARY KEY (id);


--
-- Name: certificados_emp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificados_emp
    ADD CONSTRAINT certificados_emp_pk PRIMARY KEY (id);


--
-- Name: certificados_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificado
    ADD CONSTRAINT certificados_pk PRIMARY KEY (id);


--
-- Name: certificados_trabajo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificados_trabajo
    ADD CONSTRAINT certificados_trabajo_pk PRIMARY KEY (id);


--
-- Name: contratistas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratista
    ADD CONSTRAINT contratistas_pk PRIMARY KEY (id);


--
-- Name: contratistas_proyecto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contratistas_proyecto
    ADD CONSTRAINT contratistas_proyecto_pk PRIMARY KEY (id);


--
-- Name: control1_pks; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY control
    ADD CONSTRAINT control1_pks PRIMARY KEY (id);


--
-- Name: data_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pk PRIMARY KEY (id);


--
-- Name: disciplinas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY disciplina
    ADD CONSTRAINT disciplinas_pk PRIMARY KEY (id);


--
-- Name: empleados_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleados_pk PRIMARY KEY (id);


--
-- Name: empleados_proyectos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleados_proyecto
    ADD CONSTRAINT empleados_proyectos_pk PRIMARY KEY (id);


--
-- Name: equipos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT equipos_pk PRIMARY KEY (id);


--
-- Name: estado_trabajo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_permiso
    ADD CONSTRAINT estado_trabajo_pk PRIMARY KEY (id);


--
-- Name: estado_trazabilidad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estado_trazabilidad
    ADD CONSTRAINT estado_trazabilidad_pk PRIMARY KEY (id);


--
-- Name: estados_proyecto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY estados_proyecto
    ADD CONSTRAINT estados_proyecto_pk PRIMARY KEY (id);


--
-- Name: formularios_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY formulario
    ADD CONSTRAINT formularios_pk PRIMARY KEY (id);


--
-- Name: group_rol_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT group_rol_pk PRIMARY KEY (id);


--
-- Name: idiomas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY idiomas
    ADD CONSTRAINT idiomas_pk PRIMARY KEY (id);


--
-- Name: menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (id);


--
-- Name: operaciones_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY operacion_permiso
    ADD CONSTRAINT operaciones_permiso_pk PRIMARY KEY (id);


--
-- Name: parametro_reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT parametro_reporte_pk PRIMARY KEY (id);


--
-- Name: parametros_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametros_pk PRIMARY KEY (id);


--
-- Name: perfil_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT perfil_pk PRIMARY KEY (id);


--
-- Name: perfil_recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT perfil_recurso_pk PRIMARY KEY (id);


--
-- Name: permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT permiso_pk PRIMARY KEY (id);


--
-- Name: precaucion_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precaucion
    ADD CONSTRAINT precaucion_pk PRIMARY KEY (id);


--
-- Name: precauciones_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY precauciones_trabajo
    ADD CONSTRAINT precauciones_permiso_pk PRIMARY KEY (id);


--
-- Name: procesos_reportes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_proceso_reporte
    ADD CONSTRAINT procesos_reportes_pk PRIMARY KEY (id);


--
-- Name: proyecto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT proyecto_pk PRIMARY KEY (id);


--
-- Name: recurso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT recurso_pk PRIMARY KEY (id);


--
-- Name: reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporte
    ADD CONSTRAINT reporte_pk PRIMARY KEY (id);


--
-- Name: riesgo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY peligro
    ADD CONSTRAINT riesgo_pk PRIMARY KEY (id);


--
-- Name: riesgos_peligro_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY riesgos_peligro_tarea
    ADD CONSTRAINT riesgos_peligro_permiso_pk PRIMARY KEY (id);


--
-- Name: riesgos_trabajo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY peligros_tarea
    ADD CONSTRAINT riesgos_trabajo_pk PRIMARY KEY (id);


--
-- Name: rol_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT rol_pk PRIMARY KEY (id);


--
-- Name: tarea_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT tarea_pk PRIMARY KEY (id);


--
-- Name: tipo_archivo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_archivo
    ADD CONSTRAINT tipo_archivo_pk PRIMARY KEY (id);


--
-- Name: tipo_certificados_emp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_certificados_emp
    ADD CONSTRAINT tipo_certificados_emp_pk PRIMARY KEY (id);


--
-- Name: tipo_id_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_id
    ADD CONSTRAINT tipo_id_pk PRIMARY KEY (id);


--
-- Name: tipo_parametro_reporte_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_parametro_reporte
    ADD CONSTRAINT tipo_parametro_reporte_pk PRIMARY KEY (id);


--
-- Name: trazabilidad_activacion_emps_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trazabilidad_activacion_emps
    ADD CONSTRAINT trazabilidad_activacion_emps_pk PRIMARY KEY (id);


--
-- Name: trazabilidad_trabajo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY trazabilidad_permiso
    ADD CONSTRAINT trazabilidad_trabajo_pk PRIMARY KEY (id);


--
-- Name: user_group_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_pk PRIMARY KEY (id);


--
-- Name: usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id);


--
-- Name: validaciones_formulario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY validaciones_formulario
    ADD CONSTRAINT validaciones_formulario_pk PRIMARY KEY (id);


--
-- Name: campos_validaciones_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX campos_validaciones_ui1 ON campos_validacion USING btree (id_campo, id_validacion);


--
-- Name: contratista_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX contratista_ui1 ON contratista USING btree (num_id);


--
-- Name: contratista_ui2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX contratista_ui2 ON contratista USING btree (nombre);


--
-- Name: contratista_ui3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX contratista_ui3 ON contratista USING btree (usuario);


--
-- Name: empleado_ui2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empleado_ui2 ON empleado USING btree (usuario);


--
-- Name: empleados_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX empleados_ui1 ON empleado USING btree (num_id, id_contratista);


--
-- Name: menu_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX menu_ui1 ON menu USING btree (nombre);


--
-- Name: parametros_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX parametros_ui1 ON parametro USING btree (nombre, tipo);


--
-- Name: perfil_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX perfil_ui1 ON rol USING btree (codigo);


--
-- Name: recurso_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX recurso_ui1 ON resource USING btree (nombre, id_menu);


--
-- Name: rol_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX rol_ui1 ON groups USING btree (codigo);


--
-- Name: tarea_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tarea_ui1 ON tarea USING btree (id_permiso, consecutivo);


--
-- Name: usuario_ui1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX usuario_ui1 ON users USING btree (usr);


--
-- Name: arch_tipo_arch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT arch_tipo_arch_fk FOREIGN KEY (id_tipo_archivo) REFERENCES tipo_archivo(id);


--
-- Name: archivo_reporte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY archivo
    ADD CONSTRAINT archivo_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: area_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT area_tarea_fk FOREIGN KEY (id_sector) REFERENCES sector(id);


--
-- Name: areas_afectadas_area_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sectores_afectados_permiso
    ADD CONSTRAINT areas_afectadas_area_fk FOREIGN KEY (id_sector) REFERENCES sector(id);


--
-- Name: areas_afectadas_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sectores_afectados_permiso
    ADD CONSTRAINT areas_afectadas_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


--
-- Name: certificado_cert_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_trabajo
    ADD CONSTRAINT certificado_cert_trab_fk FOREIGN KEY (id_certificado) REFERENCES certificado(id);


--
-- Name: certificado_tipo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_emp
    ADD CONSTRAINT certificado_tipo_fk FOREIGN KEY (id_tipo) REFERENCES tipo_certificados_emp(id);


--
-- Name: contra_proy_contra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_proyecto
    ADD CONSTRAINT contra_proy_contra FOREIGN KEY (id_contratista) REFERENCES contratista(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: contra_proy_proy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contratistas_proyecto
    ADD CONSTRAINT contra_proy_proy_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: control_riesgo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY control
    ADD CONSTRAINT control_riesgo_fk FOREIGN KEY (id_peligro) REFERENCES peligro(id);


--
-- Name: data_param_rep_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT data_param_rep_fk FOREIGN KEY (id_data) REFERENCES data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emp_proy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleados_proyecto
    ADD CONSTRAINT emp_proy_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emp_traz_act_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_activacion_emps
    ADD CONSTRAINT emp_traz_act_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id);


--
-- Name: empleado_certificacion_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_emp
    ADD CONSTRAINT empleado_certificacion_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id);


--
-- Name: empleado_contratista_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleado_contratista_fk FOREIGN KEY (id_contratista) REFERENCES contratista(id);


--
-- Name: equipo_area_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipo
    ADD CONSTRAINT equipo_area_fk FOREIGN KEY (id_sector) REFERENCES sector(id);


--
-- Name: equipo_tarea; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT equipo_tarea FOREIGN KEY (id_equipo) REFERENCES equipo(id);


--
-- Name: estado_proyecto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proyecto
    ADD CONSTRAINT estado_proyecto_fk FOREIGN KEY (id_estado) REFERENCES estados_proyecto(id);


--
-- Name: estado_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT estado_tarea_fk FOREIGN KEY (id_estado_permiso) REFERENCES estado_permiso(id);


--
-- Name: estado_traz_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_permiso
    ADD CONSTRAINT estado_traz_trab_fk FOREIGN KEY (id_estado_trazabilidad) REFERENCES estado_trazabilidad(id);


--
-- Name: group_group_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT group_group_rol_fk FOREIGN KEY (id_group) REFERENCES groups(id);


--
-- Name: group_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT group_user_fk FOREIGN KEY (id_group) REFERENCES groups(id);


--
-- Name: menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: opr_traza_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_permiso
    ADD CONSTRAINT opr_traza_fk FOREIGN KEY (id_operacion) REFERENCES operacion_permiso(id);


--
-- Name: param_rep_reporte_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT param_rep_reporte_fk FOREIGN KEY (id_reporte) REFERENCES reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: param_tipo_param_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT param_tipo_param_fk FOREIGN KEY (id_tipo) REFERENCES tipo_parametro_reporte(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: peligros_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peligros_tarea
    ADD CONSTRAINT peligros_tarea_fk FOREIGN KEY (id_tarea) REFERENCES tarea(id);


--
-- Name: permiso_cert_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_trabajo
    ADD CONSTRAINT permiso_cert_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


--
-- Name: permiso_disciplina_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT permiso_disciplina_fk FOREIGN KEY (id_disciplina) REFERENCES disciplina(id);


--
-- Name: permiso_prec_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precauciones_trabajo
    ADD CONSTRAINT permiso_prec_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


--
-- Name: permiso_proyecto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT permiso_proyecto_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: permiso_trab_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT permiso_trab_tarea_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


--
-- Name: precaucion_prec_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY precauciones_trabajo
    ADD CONSTRAINT precaucion_prec_trab_fk FOREIGN KEY (id_precaucion) REFERENCES precaucion(id);


--
-- Name: proy_pory_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleados_proyecto
    ADD CONSTRAINT proy_pory_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recurso_menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resource
    ADD CONSTRAINT recurso_menu_fk FOREIGN KEY (id_menu) REFERENCES menu(id);


--
-- Name: reporte_proceso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporte
    ADD CONSTRAINT reporte_proceso_fk FOREIGN KEY (id_proceso) REFERENCES tipo_proceso_reporte(id);


--
-- Name: resource_rol_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT resource_rol_res_fk FOREIGN KEY (id_resource) REFERENCES resource(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: riesgo_tarea_riesgo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY peligros_tarea
    ADD CONSTRAINT riesgo_tarea_riesgo_fk FOREIGN KEY (id_peligro) REFERENCES peligro(id);


--
-- Name: riesgos_permiso_trabajo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY riesgos_peligro_tarea
    ADD CONSTRAINT riesgos_permiso_trabajo_fk FOREIGN KEY (id_peligro_tarea) REFERENCES peligros_tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rol_group_rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY group_rol
    ADD CONSTRAINT rol_group_rol_fk FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: rol_rol_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY rol_resource
    ADD CONSTRAINT rol_rol_res_fk FOREIGN KEY (id_rol) REFERENCES rol(id);


--
-- Name: trazabilidad_permiso_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY trazabilidad_permiso
    ADD CONSTRAINT trazabilidad_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


--
-- Name: user_group_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY user_group
    ADD CONSTRAINT user_group_fk FOREIGN KEY (id_user) REFERENCES users(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

