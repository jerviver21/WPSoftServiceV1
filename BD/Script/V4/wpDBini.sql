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
-- Name: administradoras; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE administradoras (
    codigo character varying(10) NOT NULL,
    nombre character varying(1500) NOT NULL,
    tipo character varying(200) DEFAULT 'EPS'::character varying NOT NULL
);


ALTER TABLE public.administradoras OWNER TO postgres;

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

SELECT pg_catalog.setval('areas_afectadas_permiso_id_seq', 56, true);


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

SELECT pg_catalog.setval('areas_trabajo_id_seq', 8, true);


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
    nombre character varying(1500) NOT NULL,
    ruta_check_list character varying(1500) NOT NULL,
    cl_cargado boolean
);


ALTER TABLE public.certificado OWNER TO postgres;

--
-- Name: certificado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE certificado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.certificado_id_seq OWNER TO postgres;

--
-- Name: certificado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE certificado_id_seq OWNED BY certificado.id;


--
-- Name: certificado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('certificado_id_seq', 5, true);


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
    id_certificado integer NOT NULL,
    restriccion character varying(1500)
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

SELECT pg_catalog.setval('certificados_trabajo_id_seq', 12, true);


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

SELECT pg_catalog.setval('contratistas_id_seq', 19, true);


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

SELECT pg_catalog.setval('control_id_seq', 20, true);


--
-- Name: controles_peligro_tarea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controles_peligro_tarea (
    id bigint NOT NULL,
    id_peligro_tarea bigint NOT NULL,
    control text NOT NULL
);


ALTER TABLE public.controles_peligro_tarea OWNER TO postgres;

--
-- Name: controles_peligro_tarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE controles_peligro_tarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.controles_peligro_tarea_id_seq OWNER TO postgres;

--
-- Name: controles_peligro_tarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE controles_peligro_tarea_id_seq OWNED BY controles_peligro_tarea.id;


--
-- Name: controles_peligro_tarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('controles_peligro_tarea_id_seq', 151, true);


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

SELECT pg_catalog.setval('disciplinas_id_seq', 5, true);


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
    telefono character varying(150),
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
    usuario character varying(500),
    mail character varying(500)
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

SELECT pg_catalog.setval('empleados_id_seq', 56, true);


--
-- Name: empleados_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE empleados_permiso (
    id bigint NOT NULL,
    id_permiso bigint NOT NULL,
    id_empleado bigint NOT NULL
);


ALTER TABLE public.empleados_permiso OWNER TO postgres;

--
-- Name: empleados_permiso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE empleados_permiso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.empleados_permiso_id_seq OWNER TO postgres;

--
-- Name: empleados_permiso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE empleados_permiso_id_seq OWNED BY empleados_permiso.id;


--
-- Name: empleados_permiso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('empleados_permiso_id_seq', 23, true);


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

SELECT pg_catalog.setval('equipos_id_seq', 16, true);


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

SELECT pg_catalog.setval('group_rol_id_seq', 102, true);


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
-- Name: notas_permiso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notas_permiso (
    id integer NOT NULL,
    id_permiso bigint NOT NULL,
    nota character varying(2500) NOT NULL,
    usr character varying(255) DEFAULT 'VALIDADOR'::character varying NOT NULL
);


ALTER TABLE public.notas_permiso OWNER TO postgres;

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

SELECT pg_catalog.setval('parametros_id_seq', 28, true);


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
    id_estado_permiso integer,
    tarea text,
    usuario_creacion character varying(600),
    fecha_hora_creacion timestamp without time zone,
    id_equipo integer,
    id_sector integer,
    id_proyecto bigint,
    num_orden bigint,
    ejecutor_contratista boolean,
    fecha_hora_fin timestamp without time zone,
    fecha_hora_ini timestamp without time zone,
    id_estado_anterior integer,
    consideraciones text,
    id_contratista bigint
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

SELECT pg_catalog.setval('permiso_id_seq', 106, true);


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

ALTER SEQUENCE precauciones_trabajo_id_seq OWNED BY notas_permiso.id;


--
-- Name: precauciones_trabajo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('precauciones_trabajo_id_seq', 6, true);


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
    estado integer,
    fecha_hora_creacion timestamp without time zone DEFAULT now() NOT NULL,
    usuario_creacion character varying(300) NOT NULL
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

SELECT pg_catalog.setval('proyecto_id_seq', 68, true);


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

SELECT pg_catalog.setval('resource_id_seq', 202, true);


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

SELECT pg_catalog.setval('riesgo_id_seq', 7, true);


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

SELECT pg_catalog.setval('riesgos_peligro_permiso_id_seq', 87, true);


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

SELECT pg_catalog.setval('riesgos_trabajo_id_seq', 111, true);


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

SELECT pg_catalog.setval('rol_id_seq', 35, true);


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

SELECT pg_catalog.setval('rol_resource_id_seq', 879, true);


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

SELECT pg_catalog.setval('tarea_id_seq', 176, true);


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
    usuario_activador character varying(600),
    fecha_induccion date,
    fecha_vetacion date,
    vetar boolean,
    activar boolean
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

SELECT pg_catalog.setval('trazabilidad_activacion_emps_id_seq', 65, true);


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

SELECT pg_catalog.setval('trazabilidad_trabajo_id_seq', 348, true);


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

SELECT pg_catalog.setval('user_group_id_seq', 146, true);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    usr character varying(300) NOT NULL,
    pwd character varying(250) NOT NULL,
    nombre character varying(1500),
    mail character varying(1500),
    vetado boolean DEFAULT false,
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

SELECT pg_catalog.setval('users_id_seq', 51, true);


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

ALTER TABLE ONLY certificado ALTER COLUMN id SET DEFAULT nextval('certificado_id_seq'::regclass);


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

ALTER TABLE ONLY control ALTER COLUMN id SET DEFAULT nextval('control_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY controles_peligro_tarea ALTER COLUMN id SET DEFAULT nextval('controles_peligro_tarea_id_seq'::regclass);


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

ALTER TABLE ONLY empleados_permiso ALTER COLUMN id SET DEFAULT nextval('empleados_permiso_id_seq'::regclass);


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

ALTER TABLE ONLY notas_permiso ALTER COLUMN id SET DEFAULT nextval('precauciones_trabajo_id_seq'::regclass);


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
-- Data for Name: administradoras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY administradoras (codigo, nombre, tipo) FROM stdin;
EPS001	COOMEVA	EPS
EPS002	SALUDCOOP	EPS
EPS003	SALUD TOTAL	EPS
EPS004	CAFE SALUD	EPS
EPS005	CRUZ BLANCA	EPS
EPS006	COLMEDICA	EPS
ARP001	POSITIVA	ARP
ARP002	SURA	ARP
ARP003	COLPATRIA	ARP
ARP004	ALFA	ARP
\.


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

COPY certificado (id, nombre, ruta_check_list, cl_cargado) FROM stdin;
1	Cert1	/Proy18001_NV3/checklist/Cert1	f
4	Cert4	/Proy18001_NV3/checklist/Cert4	f
5	Cert5	/Proy18001_NV3/checklist/Cert5	f
\.


--
-- Data for Name: certificados_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY certificados_emp (id, nombre, ruta, id_tipo, id_empleado) FROM stdin;
\.


--
-- Data for Name: certificados_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY certificados_trabajo (id, id_permiso, id_certificado, restriccion) FROM stdin;
1	56	5	\N
2	53	1	No usar las manos
3	53	4	No usar los pies
4	54	1	Sin las manos
5	54	4	Sin los pies
6	32	1	\N
7	102	4	Esta al toque.
8	104	5	Restriccion 1
9	103	1	\N
10	87	1	\N
11	105	1	\N
12	106	1	Restriccion 1
\.


--
-- Data for Name: contratista; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY contratista (id, num_id, nombre, mail, nombre_contacto, arp, telefono, nivel_riesgo, objeto_social, domicilio, activo, telefono_contacto, usuario) FROM stdin;
14	123	CON1	J	CON1	N	1	N	C	C	t	1	CON1
15	234	CON2	C	C	C	C	C	C	C	t	C	CON2
16	345	CON3	C	C	C	C	C	C	C	t	C	CON3
18	830942249	VIV TECNOLOGY	jerviver21@hotmail.com	JERSON VIVEROS	ARP001	990855380	ALTO	TICS	URB. PORTALES MF L12E	t	990855380	VIVUSR
17	555	CON5	con5@viv.com	CON	ARP001	5555555	ALTO	Cambio Extremo	con5 	t	5555555	CON5
19	830546789	INVERSIONES BANVIV	jerviver21@latinmail.com	JERSON VIVEROS	ARP002	990855385	ALTO	INVERSIONES EN VARIOS SECTORES	URB. LOS PORTALES MF L12E	t	990855380	INVBANVIV
\.


--
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY control (id, nombre, id_peligro, consecutivo) FROM stdin;
7	Buscar Extintor	4	1
8	Abrir Extintor	4	2
9	Darle Duro a la Llama	4	3
18	Limpiar la zona	6	1
19	Poner los retenedores	6	2
\.


--
-- Data for Name: controles_peligro_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controles_peligro_tarea (id, id_peligro_tarea, control) FROM stdin;
1	48	Buscar Extintor
2	48	Abrir Extintor
3	48	Darle Duro a la Llama
4	48	cont1
5	49	Limpiar el drenaje
6	49	Tener listas las bombas
7	49	cont2
103	88	Limpiar la zona
104	88	Poner los retenedores
105	91	Buscar Extintor
106	91	Abrir Extintor
107	91	Darle Duro a la Llama
108	92	Limpiar la zona
109	92	Poner los retenedores
110	93	Limpiar la zona
111	93	Poner los retenedores
115	95	Limpiar la zona
116	95	Poner los retenedores
117	96	Limpiar la zona
23	55	Buscar Extintor
24	55	Abrir Extintor
25	55	Darle Duro a la Llama
26	56	Buscar Extintor
27	56	Abrir Extintor
28	56	Darle Duro a la Llama
29	57	Buscar Extintor
30	57	Abrir Extintor
31	57	Darle Duro a la Llama
32	58	Buscar Extintor
33	58	Abrir Extintor
34	58	Darle Duro a la Llama
118	96	Poner los retenedores
119	97	Limpiar la zona
120	97	Poner los retenedores
121	98	Buscar Extintor
122	98	Abrir Extintor
123	98	Darle Duro a la Llama
124	98	Control Final
125	99	Control Inicial
126	99	Control Final
44	62	c1
45	62	c2
127	100	Limpiar la zona
128	100	Poner los retenedores
129	101	Limpiar la zona
130	101	Poner los retenedores
131	102	Buscar Extintor
132	102	Abrir Extintor
133	102	Darle Duro a la Llama
53	65	c1
54	65	c2
55	65	c3
56	66	Limpiar el drenaje
57	66	Tener listas las bombas
58	67	Buscar Extintor
59	67	Abrir Extintor
60	67	Darle Duro a la Llama
61	68	Buscar Extintor
62	68	Abrir Extintor
63	68	Darle Duro a la Llama
64	69	c1
65	69	c2
66	69	c3
67	70	Buscar Extintor
68	70	Abrir Extintor
69	70	Darle Duro a la Llama
134	103	Control Final
135	104	Limpiar la zona
136	104	Poner los retenedores
137	105	Buscar Extintor
138	105	Abrir Extintor
139	105	Darle Duro a la Llama
140	107	Limpiar la zona
141	107	Poner los retenedores
142	108	Limpiar la zona
143	108	Poner los retenedores
144	109	Buscar Extintor
145	109	Abrir Extintor
146	109	Darle Duro a la Llama
147	110	Limpiar la zona
148	110	Poner los retenedores
149	111	Buscar Extintor
150	111	Abrir Extintor
151	111	Darle Duro a la Llama
98	86	Limpiar la zona
99	86	Poner los retenedores
100	87	Buscar Extintor
101	87	Abrir Extintor
102	87	Darle Duro a la Llama
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

COPY empleado (id, num_id, nombres_apellidos, foto, id_contratista, activo, telefono, fecha_induccion, tipo_sangre, eps, observaciones, betado, restricciones_medicas, trabajo_alturas, ruta_cert_cm, ruta_cert_ta, certificado_medico, cual_rest_medica, usuario, mail) FROM stdin;
45	16942249	JERSON VIVEROS AGUIRRE	\N	18	f	990855380	\N	A+	EPS001		f	f	t	/Proy18001_NV3/certs/16942249/CM.jpg	/Proy18001_NV3/certs/16942249/TA.png	t	\N	jerviver21	jerviver21@gmail.com
46	42064801	GABRIELA BEJAR ESQUIVEL	\N	18	f	969459940	\N	O+	EPS003		f	f	t	/Proy18001_NV3/certs/42064801/CM.png	/Proy18001_NV3/certs/42064801/TA.JPG	t	\N	gabriela	bejar.gabriela@gmail.com
56	159486	CONT VIVEROS	\N	19	f	990855380	\N	A+	EPS001	\N	f	t	f	/Proy18001_NV3/certs/159486/CM.jpg	\N	t	COLESTEROL ALTO	empviv2	jerviver21@latinmail.com
54	456789	INVBAN VIVEROS	\N	19	f	990855380	\N	O+	EPS006	\N	f	t	f	/Proy18001_NV3/certs/456789/CM.png	\N	t	COLON IRRITABLE	BANVUSR2	jerviver21@latianmail.com
51	58794578	ZAMIR PATINO	\N	18	f	8547596	\N	A+	EPS003		f	f	f	/Proy18001_NV3/certs/58794578/CM.png	\N	t	\N	zamir1983	zamir1983@gmail.com
50	31276374	LUDIVIA AGUIRRE QUINTERO	\N	18	f	4381153 ext 1203	\N	A+	EPS001		f	f	t	/Proy18001_NV3/certs/31276374/CM.JPG	/Proy18001_NV3/certs/31276374/TA.jpg	t	\N	ludivia1957	ludivia.aguirre@gmail.com
48	4501526	PATRICIA GOMEZ	\N	18	t	3014320608	2013-01-01	A+	EPS004		f	f	t	/Proy18001_NV3/certs/4501526/CM.jpg	/Proy18001_NV3/certs/4501526/TA.jpg	t	\N	patricia1990	patricia1990@hotmail.com
42	1555	JAVIER HERNANDEZ	\N	14	t	4381153	2013-01-01	O+	EPS005		f	f	t	/Proy18001_NV3/certs/1555/CM.png	/Proy18001_NV3/certs/1555/TA.jpg	t	\N	EMP5	jhernandez@nestle.com
55	789456	EMPL VIVEROS	\N	19	f	990855380	\N	O+	EPS001	YA QUEDO TERMINADO.	t	t	f	/Proy18001_NV3/certs/789456/CM.pdf	\N	t	COLON IRRITABLE	empviv1	jerviver21@latinamil.com
52	16879456	JONATAN MUNOZ	\N	18	f	689547845	\N	O+	EPS003		f	f	t	/Proy18001_NV3/certs/16879456/CM.png	/Proy18001_NV3/certs/16879456/TA.png	t	\N	jony	jony@gmail.com
53	123456	BANVIV VIVEROS	\N	19	f	990855380	\N	O+	EPS001	CREO QUE SE QUEDA ASI A MENOS QUE EL CLIENTE PIDA CAMBIO.	f	t	f	/Proy18001_NV3/certs/123456/CM.png	\N	t	COLON IRRITABLE	BANVUSR1	jerviver21@latinmail.com
41	4	EMP4	\N	\N	t	4	2013-01-01	4	4	\N	f	f	t	/usr/proceso1096/certs/4/CM.pdf	/usr/proceso1096/certs/4/TA.pdf	t	\N	EMP4	\N
44	7	EMP7	\N	15	t	7	2013-01-01	7	7		f	f	t	/usr/proceso1096/certs/7/CM.pdf	/usr/proceso1096/certs/7/TA.pdf	t	\N	EMP7	\N
43	6	EMP6	\N	14	t	6	2013-01-01	6	6	\N	f	f	t	/usr/proceso1096/certs/6/CM.pdf	/usr/proceso1096/certs/6/TA.pdf	t	\N	EMP6	\N
\.


--
-- Data for Name: empleados_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY empleados_permiso (id, id_permiso, id_empleado) FROM stdin;
13	99	42
14	99	43
16	101	44
17	102	41
18	103	41
19	104	42
20	104	43
21	105	41
22	106	42
23	106	43
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
15	eq2	8
16	eq1	8
\.


--
-- Data for Name: estado_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY estado_permiso (id, descripcion) FROM stdin;
0	VENCIDO
1	CREADO
2	DILIGENCIADO
3	PREAPROBADO 
4	NO_APROBADO
5	APROBADO 
6	TERMINADO 
7	SUSPENDIDO 
8	PRECANCELADO 
9	APROBADA_CANCELACION 
10	CANCELADO 
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
98	1	17
99	12	31
100	28	31
101	34	31
102	35	31
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
\.


--
-- Data for Name: notas_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notas_permiso (id, id_permiso, nota, usr) FROM stdin;
1	32	Se suspendio por inactividad.	VALIDADOR
3	32	Pongamos otra notita	VALIDADOR
4	29	El trabajo fue bien realizado	VALIDADOR
5	29	Le doy una calificaciÃ³n de 10	VALIDADOR
6	29	Se suspende por deficiente manejo.	VALIDADOR
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
16	rolAutArea	AUTORIDAD_AREA	AU
19	rolGerente	GERENCIA	AU
1	rutaLog	/Proy18001_NV3/log	LOG1
7	rutaDescarga	/Proy18001_NV3/descargas	FILE
8	rutaReporte	/Proy18001_NV3/reportes	FILE
11	dirCertificados	/Proy18001_NV3/certs	FILE
20	prueba1	valor prueba	
21	prueba2		valor prueba 2
22	prueba3	Valor prueba 3	
25	dirChecklist	/Proy18001_NV3/checklist	FILE
17	rolCalidad	CALIDAD	AU
18	rolSeguridad	SEGURIDAD	AU
10	grupoContratista	CONTRATISTAS	AU
27	rolAprobador	APROBADOR	AU
23	aprueba_defecto	ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR	Gestion
24	cancela_defecto	ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR	Gestion
28	rolRecepcionista	RECEPCIONISTA	AU
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
4	INCENDIO
5	INUNDACION
6	Derrumbe
\.


--
-- Data for Name: peligros_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY peligros_tarea (id, id_peligro, id_tarea) FROM stdin;
48	4	71
49	5	71
55	4	82
56	4	85
57	4	86
58	4	89
62	2	93
65	2	97
66	5	98
67	4	99
68	4	103
69	2	105
70	4	106
86	6	152
87	4	153
88	6	154
89	5	155
90	5	157
91	4	158
92	6	156
93	6	159
95	6	161
96	6	162
97	6	163
98	4	169
99	5	169
100	6	169
101	6	170
102	4	170
103	5	171
104	6	171
105	4	172
106	5	172
107	6	172
108	6	173
109	4	174
110	6	175
111	4	176
\.


--
-- Data for Name: permiso_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permiso_trabajo (id, id_disciplina, otra_disciplina, id_estado_permiso, tarea, usuario_creacion, fecha_hora_creacion, id_equipo, id_sector, id_proyecto, num_orden, ejecutor_contratista, fecha_hora_fin, fecha_hora_ini, id_estado_anterior, consideraciones, id_contratista) FROM stdin;
101	\N	\N	1	PTA 23	ADMIN1	2013-01-09 09:02:57.817	15	8	\N	\N	t	\N	\N	7	\N	15
105	1	\N	9	PTA 1P1	ADMIN1	2013-01-09 17:35:52.392	2	3	68	\N	f	2013-01-18 14:00:00	2013-01-12 08:00:00	7		\N
106	1	\N	5	PTA 2P1	ADMIN1	2013-01-09 17:38:34.794	15	8	68	\N	t	2013-01-20 00:00:00	2013-01-12 00:00:00	7	Vamos a realizar la prueba de impresion del permiso.	14
102	1	\N	10	PTA 22	ADMIN1	2013-01-09 09:04:35.752	16	8	\N	\N	f	\N	\N	7	Quiero ver que se le asigne al jefe de seguridad y al gerente!	\N
90	2	\N	10	cambio de estrategia grafica.	admin	2012-12-20 13:09:34.566	2	3	\N	111	f	2012-12-31 00:00:00	2012-12-20 00:00:00	7		\N
56	1	\N	2	awdre	admin	2012-12-11 09:49:38.369	2	3	\N	\N	f	\N	\N	7	OK. De nuevo a que me lo aprueben!	\N
30	1	\N	2	Mantenimiento preventivo	INGENIERIA	2012-12-07 19:02:32.68	3	3	\N	123	f	\N	\N	7	Realizar lavados cada 5 minutos	\N
80	1	\N	2	act 1 px1	admin	2012-12-13 13:20:39.115	\N	3	61	\N	f	2012-12-31 00:00:00	2012-12-14 00:00:00	7	\N	\N
84	3	\N	2	a1 p234	admin	2012-12-13 15:54:45.126	2	3	67	\N	f	2012-12-23 00:00:00	2012-12-20 00:00:00	7	\N	\N
85	1	\N	4	a2 p234.1	admin	2012-12-13 15:55:07.045	5	5	67	\N	f	2012-12-27 18:00:00	2012-12-25 06:00:00	7	ok	\N
53	1	\N	3	ffffff	admin	2012-12-10 20:10:33.688	2	3	42	\N	f	\N	\N	7	ok	\N
54	1	\N	3	Como asi que Q	admin	2012-12-11 09:20:34.136	2	3	\N	\N	f	\N	\N	7	ok	\N
104	1	\N	10	PTA 25	ADMIN1	2013-01-09 15:23:03.537	15	8	\N	234654	t	2013-01-20 00:00:00	2013-01-10 00:00:00	7	Consideracion1	14
32	1	\N	2	Desarmar el troquelador 1.	admin	2012-12-09 15:11:45.484	2	5	\N	\N	t	\N	\N	7	No puede diligenciarlo un usuario del contratista, debe diligenciarlo el contratista.	\N
29	1	\N	7	Limpiar Silla	INGENIERIA	2012-12-06 11:01:37.906	6	5	\N	\N	f	\N	\N	5	ok. corregido.	\N
103	1	\N	2	PTA 24	ADMIN1	2013-01-09 09:05:29.5	15	8	\N	\N	f	\N	\N	7	ok.	\N
87	1	\N	2	val 1.1	admin	2012-12-13 17:32:42.705	2	3	\N	123	f	2012-12-25 00:00:00	2012-12-20 00:00:00	7		\N
99	-1	\N	1	PTA 21	ADMIN1	2013-01-09 08:55:25.778	15	8	\N	1245	t	2013-01-30 00:00:00	2013-01-15 00:00:00	7	\N	14
\.


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proyecto (id, num_cuenta_cargada, nombre, num_gestion_cambio, fecha_fin, fecha_ini, id_estado, estado, fecha_hora_creacion, usuario_creacion) FROM stdin;
42	121212	proy 12	121212	2012-12-31	2012-12-01	1	\N	2012-12-10 20:09:34.182	admin
45	1234	asdf	121313	2012-12-31	2012-12-01	1	\N	2012-12-11 09:49:50.25	admin
55	2	proyecto 2	2	2012-12-31	2012-12-11	1	\N	2012-12-11 12:30:37.184	admin
47	2345	asd	345	2012-12-31	2012-12-11	1	\N	2012-12-11 09:59:57.372	admin
62	234	Proyecto y1	233	2012-12-31	2012-12-11	1	\N	2012-12-13 10:25:19.143	admin
63	777	proyecto 777	777	2012-12-31	2012-12-15	1	\N	2012-12-13 11:19:25.22	admin
64	1	p1	1	2012-12-27	2012-12-17	1	\N	2012-12-13 11:26:45.137	admin
66	345	p345	345	2012-12-29	2012-12-15	1	\N	2012-12-13 15:40:45.367	admin
67	234	p234	234	2012-12-30	2012-12-20	1	\N	2012-12-13 15:53:55.569	admin
61	123	Proyecto X123	123	2012-12-31	2012-12-13	1	\N	2012-12-13 10:19:39.767	admin
68	0	Proy PTA1	1	2013-01-20	2013-01-10	1	\N	2013-01-09 17:34:42.929	ADMIN1
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
184	Contratistas	\N	107	/contratistas/contratistas.xhtml	es
187	Cambiar Idioma	\N	103	/general/cambiar_idioma.xhtml	es
188	Permisos	\N	106	/permisostrabajo/permisos.xhtml	es
190	Cambiar Clave	\N	103	/general/change_password.xhtml	es
191	Parametros	\N	103	/general/parametros.xhtml	es
192	Log	\N	103	/general/log.xhtml	es
193	BD	\N	103	/general/adminBD.xhtml	es
194	Reportes	\N	103	/reportes/reportes.xhtml	es
195	Usuarios	\N	105	/usuarios/usuarios.xhtml	es
183	Proyectos		106	/permisostrabajo/proyectos.xhtml	es
185	Sectores		108	/herramientas/sector.xhtml	es
186	Peligros		108	/herramientas/peligro.xhtml	es
200	Certifieds	\N	100	/herramientas/certificados.xhtml	en
201	Certificados	\N	108	/herramientas/certificados.xhtml	es
202	Mis Permisos	\N	106	/permisostrabajo/mis_permisos.xhtml	es
\.


--
-- Data for Name: riesgos_peligro_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY riesgos_peligro_tarea (id, consecutivo, nombre, id_peligro_tarea) FROM stdin;
57	\N	risk1	48
58	\N	risk2	48
59	\N	risk3	49
69	\N	r5	66
70	\N	risk1	70
77	\N	Riesgo 2	88
79	\N	Riesgo 2	95
80	\N	Riesgo 1	98
81	\N	Riesgo 2	98
82	\N	Riesgo 3	98
83	\N	Riesgo 1	99
84	\N	Riesgo 2	99
85	\N	Riesgo Inicial	100
86	\N	Riesgo Final	100
87	\N	Riesgo Final	103
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
35	APROBADOR	Pueden aprobar los permisos de trabajo
\.


--
-- Data for Name: rol_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY rol_resource (id, id_resource, id_rol) FROM stdin;
724	160	25
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
866	200	25
867	200	1
868	201	25
869	201	1
870	202	25
871	202	1
872	202	34
873	202	27
874	202	33
875	202	29
876	202	31
877	202	30
878	202	28
879	202	26
\.


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sector (id, nombre, grupo) FROM stdin;
3	Area1	JEFES DE SECTOR
5	Area 5	JEFES DE SECTOR
4	Area4	JEFES DE SECTOR
8	Area 2	JEFES DE SECTOR
\.


--
-- Data for Name: sectores_afectados_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sectores_afectados_permiso (id, id_sector, id_permiso) FROM stdin;
5	3	30
6	4	30
7	3	56
8	3	29
9	3	32
10	4	32
11	4	102
12	3	102
20	3	104
22	3	103
55	3	106
56	5	106
\.


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tarea (id, datos, id_permiso, consecutivo) FROM stdin;
150	Paso 29	102	1
151	Paso 30	102	2
152	Paso 31	102	3
153	Paso 32	102	4
154	Paso 33	102	5
155	Paso 34	102	6
71	Paso 1	30	1
156	Paso 1	104	1
157	Paso 2	104	2
158	Paso 3	104	3
159	Paso 4	104	4
82	Paso 1	85	1
83	Paso 2	85	2
85	Paso 3	85	3
86	Paso 4	85	4
88	Paso 5	85	5
89	p1	90	1
161	Paso 2	103	1
162	Paso 3	103	2
93	p2	90	2
163	Paso 4	103	3
164	Paso 1	87	1
97	paso 8	30	2
98	paso 9	30	3
99	pa1	53	1
102	p1	54	1
103	paso 1	80	1
104	p1	56	1
105	p1	29	1
106	Terminar	32	1
165	Paso 2	87	2
166	Paso 3	87	3
167	Paso 4	87	4
168	P1	105	1
169	Paso 1	106	1
170	Paso 2	106	2
171	Paso 3	106	3
172	Paso 4	106	4
173	Paso 5	106	5
174	Paso 6	106	6
175	Paso 7	106	7
176	Paso 8	106	8
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

COPY trazabilidad_activacion_emps (id, id_empleado, fecha_activacion, usuario_activador, fecha_induccion, fecha_vetacion, vetar, activar) FROM stdin;
56	48	2013-01-15	ADMIN1	\N	\N	\N	f
57	48	2013-01-15	ADMIN1	2013-01-01	\N	\N	t
58	42	2013-01-16	ADMIN1	\N	\N	\N	t
59	42	2013-01-16	ADMIN1	2013-01-01	\N	\N	t
60	41	2013-01-16	ADMIN1	\N	\N	\N	f
61	41	2013-01-16	ADMIN1	2013-01-01	\N	\N	t
62	43	2013-01-16	ADMIN1	\N	\N	\N	f
63	44	2013-01-16	ADMIN1	\N	\N	\N	f
64	44	2013-01-16	ADMIN1	2013-01-01	\N	\N	t
65	43	2013-01-16	ADMIN1	2013-01-01	\N	\N	t
\.


--
-- Data for Name: trazabilidad_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trazabilidad_permiso (id, fecha_hora, id_estado_trazabilidad, id_permiso, usr_grp_asignado, id_operacion, nota, usuario) FROM stdin;
77	2012-12-06 11:01:37.906	2	29	INGENIERIA	0	\N	INGENIERIA
79	2012-12-07 19:02:32.68	2	30	INGENIERIA	0	\N	INGENIERIA
85	2012-12-09 15:11:45.484	2	32	admin	0	\N	admin
134	2012-12-27 18:35:36.016	2	56	EMP1	1	\N	EMP1
228	2012-12-27 18:42:14.827	2	56	JEFES DE SECTOR	2	\N	JEFSEC
229	2012-12-27 18:59:01.788	2	56	ADMINISTRADORES CALIDAD	2	\N	JEFCAL
206	2012-12-27 19:00:20.299	2	90	EMP1	1	\N	EMP1
235	2012-12-27 19:01:00.35	2	56	JEFSEG	6	\N	JEFSEG
222	2013-01-03 12:58:45.461	2	53	JEFES DE SECTOR	2	ok.	JEFSEC
78	2012-12-27 20:09:20.164	2	29	EMP2	1	\N	EMP2
239	2012-12-27 20:09:58.12	2	29	JEFES DE SECTOR	2	\N	JEFSEC
237	2012-12-27 20:26:55.359	2	29	ADMINISTRADORES CALIDAD	2		JEFCAL
241	2012-12-27 20:27:24.161	2	29	GERENTE	6	Esta mal diligenciado.	GERENTE
176	2012-12-13 13:20:39.115	2	80	admin	0	\N	admin
242	2012-12-27 20:27:53.66	2	29	EMP2	1	\N	EMP2
238	2012-12-27 20:28:32.196	2	29	ADMINISTRADORES SEGURIDAD	2	ok	JEFSEG
240	2012-12-27 20:28:57.293	2	29	GERENTES	2	ahora si!	GERENTE
243	2012-12-27 20:28:57.317	1	29	EMP2	3	\N	\N
234	2012-12-31 10:20:24.054	2	90	JEFES DE SECTOR	2	OK	JEFSEC
233	2012-12-31 11:16:09.75	2	90	ADMINISTRADORES SEGURIDAD	2	ok	JEFSEG
232	2012-12-31 11:16:35.983	2	90	ADMINISTRADORES CALIDAD	2	ok	JEFCAL
244	2012-12-31 11:16:54.959	2	90	GERENTE	2	ok	GERENTE
245	2012-12-31 11:56:21.737	2	90	EMP1	3	Terminado!	EMP1
248	2012-12-31 11:58:20.591	2	90	JEFES DE SECTOR	4	ok	JEFSEC
246	2012-12-31 11:58:38.78	2	90	ADMINISTRADORES CALIDAD	4	ok	JEFCAL
247	2012-12-31 11:59:06.188	2	90	ADMINISTRADORES SEGURIDAD	4	ok	JEFSEG
249	2012-12-31 11:59:32.552	2	90	admin	4	ok	admin
236	2013-01-02 16:44:51.601	2	56	EMP1	1	\N	EMP1
230	2013-01-02 16:44:51.734	1	56	ADMINISTRADORES SEGURIDAD	2	\N	\N
231	2013-01-02 16:44:51.734	1	56	GERENTE	2	\N	\N
250	2013-01-03 12:38:16.466	2	54	JEFSEC	6	ok	JEFSEC
225	2013-01-03 13:05:34.718	2	54	JEFES DE SECTOR	2	ok	JEFSEC
86	2013-01-04 08:37:11.687	2	32	CON2	1	\N	CON2
256	2013-01-04 08:37:11.706	1	32	ADMINISTRADORES CALIDAD	2	\N	\N
252	2013-01-03 12:38:30.021	2	53	JEFSEC	6	ok	JEFSEC
257	2013-01-04 08:37:11.761	1	32	ADMINISTRADORES SEGURIDAD	2	\N	\N
258	2013-01-04 08:37:11.772	1	32	JEFES DE SECTOR	2	\N	\N
254	2013-01-03 12:38:43.37	2	85	JEFSEC	6	ok	JEFSEC
255	2013-01-03 12:38:43.393	1	85	EMP1	1	\N	\N
219	2012-12-26 11:50:40.716	3	85	JEFES DE SECTOR	2	\N	\N
220	2012-12-26 11:50:40.75	3	85	ADMINISTRADORES CALIDAD	2	\N	\N
221	2012-12-26 11:50:40.761	3	85	ADMINISTRADORES SEGURIDAD	2	\N	\N
253	2013-01-03 12:41:03.12	2	53	EMP1	1	\N	EMP1
223	2013-01-03 12:41:03.156	1	53	ADMINISTRADORES CALIDAD	2	\N	\N
224	2013-01-03 12:41:03.156	1	53	ADMINISTRADORES SEGURIDAD	2	\N	\N
251	2013-01-03 12:41:19.05	2	54	EMP1	1	\N	EMP1
226	2013-01-03 12:41:19.068	1	54	ADMINISTRADORES CALIDAD	2	\N	\N
227	2013-01-03 12:41:19.068	1	54	ADMINISTRADORES SEGURIDAD	2	\N	\N
186	2012-12-13 15:54:45.126	2	84	admin	0	\N	admin
188	2012-12-13 15:55:07.045	2	85	admin	0	\N	admin
192	2012-12-13 17:32:42.705	2	87	admin	0	\N	admin
127	2012-12-10 20:10:33.688	2	53	admin	0	\N	admin
129	2012-12-11 09:20:34.136	2	54	admin	0	\N	admin
133	2012-12-11 09:49:38.369	2	56	admin	0	\N	admin
199	2012-12-19 08:10:25.759	1	80	JEFES DE SECTOR	2	\N	\N
200	2012-12-19 08:10:25.872	1	80	ADMINISTRADORES CALIDAD	2	\N	\N
201	2012-12-19 08:10:25.879	1	80	ADMINISTRADORES SEGURIDAD	2	\N	\N
177	2012-12-19 08:10:25.758	2	80	EMP1	1	\N	EMP1
178	2012-12-19 08:10:25.759	3	80	EMP2	1	\N	EMP1
202	2012-12-19 08:12:36.316	1	84	JEFES DE SECTOR	2	\N	\N
203	2012-12-19 08:12:36.342	1	84	ADMINISTRADORES CALIDAD	2	\N	\N
204	2012-12-19 08:12:36.353	1	84	ADMINISTRADORES SEGURIDAD	2	\N	\N
187	2012-12-19 08:12:36.316	2	84	EMP1	1	\N	EMP1
205	2012-12-20 13:09:34.566	2	90	admin	0	\N	admin
80	2012-12-26 11:27:42.818	2	30	EMP1	1	\N	EMP1
81	2012-12-26 11:27:42.818	3	30	EMP2	1	\N	EMP1
207	2012-12-26 11:38:39.556	3	30	JEFES DE SECTOR	2	\N	EMP1
208	2012-12-26 11:38:39.556	3	30	ADMINISTRADORES CALIDAD	2	\N	EMP1
209	2012-12-26 11:38:39.556	3	30	ADMINISTRADORES SEGURIDAD	2	\N	EMP1
210	2012-12-26 11:39:34.903	3	30	JEFES DE SECTOR	2	\N	EMP1
211	2012-12-26 11:39:34.903	3	30	ADMINISTRADORES CALIDAD	2	\N	EMP1
212	2012-12-26 11:39:34.903	3	30	ADMINISTRADORES SEGURIDAD	2	\N	EMP1
216	2012-12-26 11:43:42.201	1	30	JEFES DE SECTOR	2	\N	\N
217	2012-12-26 11:43:42.237	1	30	ADMINISTRADORES CALIDAD	2	\N	\N
218	2012-12-26 11:43:42.248	1	30	ADMINISTRADORES SEGURIDAD	2	\N	\N
213	2012-12-26 11:43:42.201	3	30	JEFES DE SECTOR	2	\N	EMP1
214	2012-12-26 11:43:42.201	3	30	ADMINISTRADORES CALIDAD	2	\N	EMP1
215	2012-12-26 11:43:42.201	3	30	ADMINISTRADORES SEGURIDAD	2	\N	EMP1
189	2012-12-26 11:50:40.716	2	85	EMP1	1	\N	EMP1
128	2012-12-26 12:02:36.464	2	53	EMP1	1	\N	EMP1
130	2012-12-26 12:03:11.509	2	54	EMP1	1	\N	EMP1
283	2013-01-09 08:55:25.778	2	99	ADMIN1	0	\N	ADMIN1
284	2013-01-09 08:55:25.778	1	99	EMP5	1	\N	\N
285	2013-01-09 08:55:25.778	1	99	EMP6	1	\N	\N
286	2013-01-09 08:55:25.778	1	99	CON1	1	\N	\N
289	2013-01-09 09:02:57.817	2	101	ADMIN1	0	\N	ADMIN1
290	2013-01-09 09:02:57.817	1	101	EMP7	1	\N	\N
291	2013-01-09 09:02:57.817	1	101	CON2	1	\N	\N
292	2013-01-09 09:04:35.752	2	102	ADMIN1	0	\N	ADMIN1
294	2013-01-09 09:05:29.5	2	103	ADMIN1	0	\N	ADMIN1
293	2013-01-09 11:44:55.87	2	102	EMP4	1	\N	EMP4
295	2013-01-09 15:56:18.206	2	103	EMP4	1	\N	EMP4
297	2013-01-09 15:10:46.836	2	102	ADMINISTRADORES SEGURIDAD	2	OK	JEFSEG
193	2013-01-09 16:27:21.541	2	87	EMP4	1	\N	EMP4
194	2013-01-09 16:27:21.541	3	87	EMP2	1	\N	EMP4
298	2013-01-09 14:31:43.657	2	102	JEFES DE SECTOR	2	Se direcciona el permiso para que el gerente realice la aprobaciÃ³n.	JEFSEC
296	2013-01-09 15:03:42.261	2	102	ADMINISTRADORES CALIDAD	2	Quiero ver que se haya agregado mi paso.	JEFCAL
300	2013-01-09 15:04:17.17	2	102	JEFSEG	6	Solo por probar	JEFSEG
301	2013-01-09 15:07:26.775	2	102	JEFSEG	6	Prueba de no aprobacion.	JEFSEG
302	2013-01-09 15:09:40.097	2	102	EMP4	1	\N	EMP4
299	2013-01-09 15:11:26.513	2	102	GERENTE	2	ok.	GERENTE
303	2013-01-09 15:13:11.668	2	102	EMP4	3	OK.	EMP4
304	2013-01-09 15:13:38.481	2	102	ADMINISTRADORES CALIDAD	4	OK	JEFCAL
305	2013-01-09 15:13:54.565	2	102	ADMINISTRADORES SEGURIDAD	4	OK	JEFSEG
306	2013-01-09 15:14:14.562	2	102	JEFES DE SECTOR	4	OK.	JEFSEC
307	2013-01-09 15:15:11.043	2	102	ADMIN1	4	OK	ADMIN1
308	2013-01-09 15:23:03.537	2	104	ADMIN1	0	\N	ADMIN1
309	2013-01-09 15:24:37.579	2	104	EMP5	1	\N	EMP5
310	2013-01-09 15:24:37.579	3	104	EMP6	1	\N	EMP5
311	2013-01-09 15:24:37.579	3	104	CON1	1	\N	EMP5
314	2013-01-09 15:25:42.202	2	104	JEFES DE SECTOR	2	Se agrego un nuevo paso.	JEFSEC
312	2013-01-09 15:26:02.803	2	104	ADMINISTRADORES CALIDAD	2	ok	JEFCAL
313	2013-01-09 15:26:19.237	2	104	ADMINISTRADORES SEGURIDAD	2	ok	JEFSEG
315	2013-01-09 15:26:37.286	2	104	GERENTES	2	ok	GERENTE
316	2013-01-09 15:26:55.635	2	104	EMP5	3	ok	EMP5
317	2013-01-09 15:26:55.635	3	104	EMP6	3	\N	EMP5
318	2013-01-09 15:26:55.635	3	104	CON1	3	\N	EMP5
321	2013-01-09 15:27:09.236	2	104	JEFES DE SECTOR	4	ok	JEFSEC
319	2013-01-09 15:27:32.458	2	104	ADMINISTRADORES CALIDAD	4	ok	JEFCAL
320	2013-01-09 15:27:47.357	2	104	ADMINISTRADORES SEGURIDAD	4	ok	JEFSEG
322	2013-01-09 15:27:59.881	2	104	ADMIN1	4	ok	ADMIN1
323	2013-01-09 15:56:18.237	1	103	ADMINISTRADORES CALIDAD	2	\N	\N
324	2013-01-09 15:56:18.248	1	103	ADMINISTRADORES SEGURIDAD	2	\N	\N
325	2013-01-09 15:56:18.259	1	103	JEFES DE SECTOR	2	\N	\N
326	2013-01-09 16:27:21.588	1	87	ADMINISTRADORES CALIDAD	2	\N	\N
327	2013-01-09 16:27:21.599	1	87	ADMINISTRADORES SEGURIDAD	2	\N	\N
328	2013-01-09 16:27:21.61	1	87	JEFES DE SECTOR	2	\N	\N
329	2013-01-09 17:35:52.392	2	105	ADMIN1	0	\N	ADMIN1
331	2013-01-09 17:38:34.794	2	106	ADMIN1	0	\N	ADMIN1
330	2013-01-09 17:39:18.69	2	105	EMP4	1	\N	EMP4
337	2013-01-09 17:39:36.618	2	105	JEFES DE SECTOR	2	ok	JEFSEC
335	2013-01-09 17:39:51.932	2	105	ADMINISTRADORES CALIDAD	2	ok	JEFCAL
336	2013-01-09 17:40:06.622	2	105	ADMINISTRADORES SEGURIDAD	2	ok	JEFSEG
338	2013-01-09 17:40:20.7	2	105	EMP4	3	ok	EMP4
341	2013-01-09 17:40:31.6	2	105	JEFES DE SECTOR	4		JEFSEC
339	2013-01-09 17:40:42.982	2	105	ADMINISTRADORES CALIDAD	4	ok	JEFCAL
340	2013-01-09 17:40:53.89	2	105	ADMINISTRADORES SEGURIDAD	4		JEFSEG
342	2013-01-09 17:40:53.926	1	105	ADMIN1	4	\N	\N
332	2013-01-16 11:18:06.66	2	106	EMP5	1	\N	EMP5
333	2013-01-16 11:18:06.66	3	106	EMP6	1	\N	EMP5
334	2013-01-16 11:18:06.66	3	106	CON1	1	\N	EMP5
345	2013-01-16 11:19:17.882	2	106	JEFES DE SECTOR	2	OK	JEFSEC
343	2013-01-16 11:19:36.601	2	106	ADMINISTRADORES CALIDAD	2	ok	JEFCAL
344	2013-01-16 11:19:55.854	2	106	ADMINISTRADORES SEGURIDAD	2	ok	JEFSEG
346	2013-01-16 11:19:55.9	1	106	EMP5	3	\N	\N
347	2013-01-16 11:19:55.909	1	106	EMP6	3	\N	\N
348	2013-01-16 11:19:55.92	1	106	CON1	3	\N	\N
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
133	36	23
134	37	23
135	40	24
136	43	24
137	44	24
139	42	24
140	45	24
141	46	24
142	47	23
143	48	24
144	49	24
145	50	24
146	51	24
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, usr, pwd, nombre, mail, vetado, estado) FROM stdin;
21	RECEP	a7fd6b064016368ac5b3175abdba4458a0f9ffb4	\N	\N	f	1
22	GERENTE	223ef7f245391afcdedaeeb5ea6813521a801ac3	\N	\N	f	1
24	CON2	09b490ad14744f5a34dbb1450c2f14d31b9f7f5d	\N	\N	f	1
25	CON3	c87e62d0fceb44420d8b5ac6db983923dded8908	\N	\N	f	1
26	EMP1	3470aa75126d0927ff5aa1fdc49a7e83e44c63b4	\N	\N	f	1
29	EMP3	78dd22a1a4db5e11280efe4f8e53b741c32ccab1	\N	\N	f	1
35	INGENIERIA	3aebcb4f1d30aad7f48dcac76e324fb0457325c1	\N	\N	f	1
1	admin	d033e22ae348aeb5660fc2140aec35850c4da997	\N	\N	f	1
27	EMP2	e1fc5313b20c524fcb2ee98226c8b96d3e076417	\N	\N	f	1
23	CON1	dffe7541e021c8ae8212afbe4ec0d3f88853b4d2	CON1	J	f	1
16	JEFCAL	6c39a58d667a1b780857908e0c4308fd06d55f28	\N	\N	f	1
18	JEFSEC	21111827dfb7fadb77670e8ec48b6436250a3d7e	\N	\N	f	1
17	JEFSEG	65b4c42c33e2d4ee6dc0ef088115c98a731a4696	\N	\N	f	1
15	VALIDADOR	c9bc9fffc3788bef6062373a4adc5d8e93112872	\N	\N	f	1
14	ADMIN1	5b2d560b3f2640cadc2ff50ca64bdd936f77eb2d	\N	\N	f	1
36	CON5	a0ca969db416b3c6469019dacd5026d4329dbeb8	CON5	con5@viv.com	f	1
37	VIVUSR	cf457a3fb3159300d2486545600a3ea0c3825dbb	VIV TECNOLOGY	jerviver21@hotmail.com	f	1
51	empviv2	f94102585c4f31e42cbd18fe6d686b67d94cd0c8	CONT VIVEROS	jerviver21@latinmail.com	f	1
49	BANVUSR2	f94102585c4f31e42cbd18fe6d686b67d94cd0c8	INVBAN VIVEROS	jerviver21@latianmail.com	f	1
48	BANVUSR1	8095ee69d09e2787c443560959455804afc24d72	BANVIV VIVEROS	jerviver21@latinmail.com	f	1
50	empviv1	5dd07652a658e3bac72d56ed1d6cab1b4aabd296	EMPL VIVEROS	jerviver21@latinamil.com	t	0
45	zamir1983	8095ee69d09e2787c443560959455804afc24d72	ZAMIR PATINO	zamir1983@gmail.com	f	1
46	jony	fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4	JONATAN MUNOZ	jony@gmail.com	f	1
40	jerviver21	fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4	JERSON VIVEROS AGUIRRE	jerviver21@gmail.com	f	1
44	gabriela	fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4	GABRIELA BEJAR ESQUIVEL	bejar.gabriela@gmail.com	f	1
47	INVBANVIV	8095ee69d09e2787c443560959455804afc24d72	INVERSIONES BANVIV	jerviver21@latinmail.com	f	1
42	patricia1990	fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4	PATRICIA GOMEZ	patricia1990@hotmail.com	f	1
31	EMP5	d39255ce4161832362088a39022dc7567dfdab78	JAVIER HERNANDEZ	jhernandez@nestle.com	f	1
43	ludivia1957	fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4	LUDIVIA AGUIRRE QUINTERO	ludivia.aguirre@gmail.com	f	0
30	EMP4	8db28af088158c7a89fb78d76f0039f24be7988b	\N	\N	f	1
34	EMP7	82faa47bfdfff09e4a4dd24b3da053ed79b794cf	\N	\N	f	1
32	EMP6	cf18d0f1d11878086a64aeec5ea68e28560e9c1e	\N	\N	f	1
\.


--
-- Data for Name: validaciones_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY validaciones_formulario (id, id_campo_formulario) FROM stdin;
\.


--
-- Name: administradoras_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY administradoras
    ADD CONSTRAINT administradoras_pk PRIMARY KEY (codigo);


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
-- Name: certificado_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificado
    ADD CONSTRAINT certificado_pk PRIMARY KEY (id);


--
-- Name: certificados_emp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY certificados_emp
    ADD CONSTRAINT certificados_emp_pk PRIMARY KEY (id);


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
-- Name: control1_pks; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY control
    ADD CONSTRAINT control1_pks PRIMARY KEY (id);


--
-- Name: controles_peligro_tarea_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controles_peligro_tarea
    ADD CONSTRAINT controles_peligro_tarea_pk PRIMARY KEY (id);


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
-- Name: empleados_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleados_permiso
    ADD CONSTRAINT empleados_permiso_pk PRIMARY KEY (id);


--
-- Name: empleados_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY empleado
    ADD CONSTRAINT empleados_pk PRIMARY KEY (id);


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
-- Name: precauciones_permiso_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notas_permiso
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
    ADD CONSTRAINT areas_afectadas_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: cert_cert_trabajo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_trabajo
    ADD CONSTRAINT cert_cert_trabajo_fk FOREIGN KEY (id_certificado) REFERENCES certificado(id);


--
-- Name: certificado_tipo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_emp
    ADD CONSTRAINT certificado_tipo_fk FOREIGN KEY (id_tipo) REFERENCES tipo_certificados_emp(id);


--
-- Name: cont_peligro_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY controles_peligro_tarea
    ADD CONSTRAINT cont_peligro_tarea_fk FOREIGN KEY (id_peligro_tarea) REFERENCES peligros_tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: control_riesgo_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY control
    ADD CONSTRAINT control_riesgo_fk FOREIGN KEY (id_peligro) REFERENCES peligro(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: data_param_rep_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY parametros_reporte
    ADD CONSTRAINT data_param_rep_fk FOREIGN KEY (id_data) REFERENCES data(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: emp_ep_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleados_permiso
    ADD CONSTRAINT emp_ep_fk FOREIGN KEY (id_empleado) REFERENCES empleado(id);


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
-- Name: estado_anterior_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT estado_anterior_fk FOREIGN KEY (id_estado_anterior) REFERENCES estado_permiso(id);


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
    ADD CONSTRAINT peligros_tarea_fk FOREIGN KEY (id_tarea) REFERENCES tarea(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permiso_cert_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY certificados_trabajo
    ADD CONSTRAINT permiso_cert_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permiso_disciplina_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT permiso_disciplina_fk FOREIGN KEY (id_disciplina) REFERENCES disciplina(id);


--
-- Name: permiso_prec_trab_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notas_permiso
    ADD CONSTRAINT permiso_prec_trab_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: permiso_proyecto_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT permiso_proyecto_fk FOREIGN KEY (id_proyecto) REFERENCES proyecto(id);


--
-- Name: permiso_trab_tarea_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tarea
    ADD CONSTRAINT permiso_trab_tarea_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: pt_cont_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permiso_trabajo
    ADD CONSTRAINT pt_cont_fk FOREIGN KEY (id_contratista) REFERENCES contratista(id);


--
-- Name: pt_emp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY empleados_permiso
    ADD CONSTRAINT pt_emp_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id);


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
    ADD CONSTRAINT trazabilidad_permiso_fk FOREIGN KEY (id_permiso) REFERENCES permiso_trabajo(id) ON UPDATE CASCADE ON DELETE CASCADE;


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

