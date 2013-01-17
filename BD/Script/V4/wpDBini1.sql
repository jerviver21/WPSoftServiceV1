
SET client_encoding = 'UTF8';


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

INSERT INTO administradoras VALUES ('EPS001', 'COOMEVA', 'EPS');
INSERT INTO administradoras VALUES ('EPS002', 'SALUDCOOP', 'EPS');
INSERT INTO administradoras VALUES ('EPS003', 'SALUD TOTAL', 'EPS');
INSERT INTO administradoras VALUES ('EPS004', 'CAFE SALUD', 'EPS');
INSERT INTO administradoras VALUES ('EPS005', 'CRUZ BLANCA', 'EPS');
INSERT INTO administradoras VALUES ('EPS006', 'COLMEDICA', 'EPS');
INSERT INTO administradoras VALUES ('ARP001', 'POSITIVA', 'ARP');
INSERT INTO administradoras VALUES ('ARP002', 'SURA', 'ARP');
INSERT INTO administradoras VALUES ('ARP003', 'COLPATRIA', 'ARP');
INSERT INTO administradoras VALUES ('ARP004', 'ALFA', 'ARP');


--
-- Data for Name: archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO archivo VALUES ('A1', 'P{fechaIni}.replaceAll("(\d{4})-(\d{2})-(\d{2})", "$1$2$3");P{fechaFin}.replaceAll("(\d{4})-(\d{2})-(\d{2})","$1$2$3");.PDF', 'rep1.jasper', 2, 1);


--
-- Data for Name: campos_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: campos_validacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: certificado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO certificado VALUES (1, 'Cert1', '/Proy18001_NV3/checklist/Cert1', false);
INSERT INTO certificado VALUES (4, 'Cert4', '/Proy18001_NV3/checklist/Cert4', false);
INSERT INTO certificado VALUES (5, 'Cert5', '/Proy18001_NV3/checklist/Cert5', false);


--
-- Data for Name: certificados_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: certificados_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO certificados_trabajo VALUES (1, 56, 5, NULL);
INSERT INTO certificados_trabajo VALUES (2, 53, 1, 'No usar las manos');
INSERT INTO certificados_trabajo VALUES (3, 53, 4, 'No usar los pies');
INSERT INTO certificados_trabajo VALUES (4, 54, 1, 'Sin las manos');
INSERT INTO certificados_trabajo VALUES (5, 54, 4, 'Sin los pies');
INSERT INTO certificados_trabajo VALUES (6, 32, 1, NULL);
INSERT INTO certificados_trabajo VALUES (7, 102, 4, 'Esta al toque.');
INSERT INTO certificados_trabajo VALUES (8, 104, 5, 'Restriccion 1');
INSERT INTO certificados_trabajo VALUES (9, 103, 1, NULL);
INSERT INTO certificados_trabajo VALUES (10, 87, 1, NULL);
INSERT INTO certificados_trabajo VALUES (11, 105, 1, NULL);
INSERT INTO certificados_trabajo VALUES (12, 106, 1, 'Restriccion 1');


--
-- Data for Name: contratista; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO contratista VALUES (14, 123, 'CON1', 'J', 'CON1', 'N', '1', 'N', 'C', 'C', true, '1', 'CON1');
INSERT INTO contratista VALUES (15, 234, 'CON2', 'C', 'C', 'C', 'C', 'C', 'C', 'C', true, 'C', 'CON2');
INSERT INTO contratista VALUES (16, 345, 'CON3', 'C', 'C', 'C', 'C', 'C', 'C', 'C', true, 'C', 'CON3');
INSERT INTO contratista VALUES (18, 830942249, 'VIV TECNOLOGY', 'jerviver21@hotmail.com', 'JERSON VIVEROS', 'ARP001', '990855380', 'ALTO', 'TICS', 'URB. PORTALES MF L12E', true, '990855380', 'VIVUSR');
INSERT INTO contratista VALUES (17, 555, 'CON5', 'con5@viv.com', 'CON', 'ARP001', '5555555', 'ALTO', 'Cambio Extremo', 'con5 ', true, '5555555', 'CON5');
INSERT INTO contratista VALUES (19, 830546789, 'INVERSIONES BANVIV', 'jerviver21@latinmail.com', 'JERSON VIVEROS', 'ARP002', '990855385', 'ALTO', 'INVERSIONES EN VARIOS SECTORES', 'URB. LOS PORTALES MF L12E', true, '990855380', 'INVBANVIV');


--
-- Data for Name: control; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO control VALUES (7, 'Buscar Extintor', 4, 1);
INSERT INTO control VALUES (8, 'Abrir Extintor', 4, 2);
INSERT INTO control VALUES (9, 'Darle Duro a la Llama', 4, 3);
INSERT INTO control VALUES (18, 'Limpiar la zona', 6, 1);
INSERT INTO control VALUES (19, 'Poner los retenedores', 6, 2);


--
-- Data for Name: controles_peligro_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO controles_peligro_tarea VALUES (1, 48, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (2, 48, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (3, 48, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (4, 48, 'cont1');
INSERT INTO controles_peligro_tarea VALUES (5, 49, 'Limpiar el drenaje');
INSERT INTO controles_peligro_tarea VALUES (6, 49, 'Tener listas las bombas');
INSERT INTO controles_peligro_tarea VALUES (7, 49, 'cont2');
INSERT INTO controles_peligro_tarea VALUES (103, 88, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (104, 88, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (105, 91, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (106, 91, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (107, 91, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (108, 92, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (109, 92, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (110, 93, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (111, 93, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (115, 95, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (116, 95, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (117, 96, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (23, 55, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (24, 55, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (25, 55, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (26, 56, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (27, 56, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (28, 56, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (29, 57, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (30, 57, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (31, 57, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (32, 58, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (33, 58, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (34, 58, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (118, 96, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (119, 97, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (120, 97, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (121, 98, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (122, 98, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (123, 98, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (124, 98, 'Control Final');
INSERT INTO controles_peligro_tarea VALUES (125, 99, 'Control Inicial');
INSERT INTO controles_peligro_tarea VALUES (126, 99, 'Control Final');
INSERT INTO controles_peligro_tarea VALUES (44, 62, 'c1');
INSERT INTO controles_peligro_tarea VALUES (45, 62, 'c2');
INSERT INTO controles_peligro_tarea VALUES (127, 100, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (128, 100, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (129, 101, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (130, 101, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (131, 102, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (132, 102, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (133, 102, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (53, 65, 'c1');
INSERT INTO controles_peligro_tarea VALUES (54, 65, 'c2');
INSERT INTO controles_peligro_tarea VALUES (55, 65, 'c3');
INSERT INTO controles_peligro_tarea VALUES (56, 66, 'Limpiar el drenaje');
INSERT INTO controles_peligro_tarea VALUES (57, 66, 'Tener listas las bombas');
INSERT INTO controles_peligro_tarea VALUES (58, 67, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (59, 67, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (60, 67, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (61, 68, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (62, 68, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (63, 68, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (64, 69, 'c1');
INSERT INTO controles_peligro_tarea VALUES (65, 69, 'c2');
INSERT INTO controles_peligro_tarea VALUES (66, 69, 'c3');
INSERT INTO controles_peligro_tarea VALUES (67, 70, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (68, 70, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (69, 70, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (134, 103, 'Control Final');
INSERT INTO controles_peligro_tarea VALUES (135, 104, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (136, 104, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (137, 105, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (138, 105, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (139, 105, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (140, 107, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (141, 107, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (142, 108, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (143, 108, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (144, 109, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (145, 109, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (146, 109, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (147, 110, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (148, 110, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (149, 111, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (150, 111, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (151, 111, 'Darle Duro a la Llama');
INSERT INTO controles_peligro_tarea VALUES (98, 86, 'Limpiar la zona');
INSERT INTO controles_peligro_tarea VALUES (99, 86, 'Poner los retenedores');
INSERT INTO controles_peligro_tarea VALUES (100, 87, 'Buscar Extintor');
INSERT INTO controles_peligro_tarea VALUES (101, 87, 'Abrir Extintor');
INSERT INTO controles_peligro_tarea VALUES (102, 87, 'Darle Duro a la Llama');


--
-- Data for Name: data; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO data VALUES ('TIPOS_ID', 'Representa los tipos de identificación que puede tener una persona', 1);


--
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO disciplina VALUES (1, 'Dis1', 'Dis1');
INSERT INTO disciplina VALUES (2, 'Dis2', 'Dis2');
INSERT INTO disciplina VALUES (3, 'Dis3', 'Dis3');
INSERT INTO disciplina VALUES (-1, 'Otra', 'Otra');
INSERT INTO disciplina VALUES (4, 'Dis4', 'Dis4');


--
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empleado VALUES (45, 16942249, 'JERSON VIVEROS AGUIRRE', NULL, 18, false, '990855380', NULL, 'A+', 'EPS001', '', false, false, true, '/Proy18001_NV3/certs/16942249/CM.jpg', '/Proy18001_NV3/certs/16942249/TA.png', true, NULL, 'jerviver21', 'jerviver21@gmail.com');
INSERT INTO empleado VALUES (46, 42064801, 'GABRIELA BEJAR ESQUIVEL', NULL, 18, false, '969459940', NULL, 'O+', 'EPS003', '', false, false, true, '/Proy18001_NV3/certs/42064801/CM.png', '/Proy18001_NV3/certs/42064801/TA.JPG', true, NULL, 'gabriela', 'bejar.gabriela@gmail.com');
INSERT INTO empleado VALUES (56, 159486, 'CONT VIVEROS', NULL, 19, false, '990855380', NULL, 'A+', 'EPS001', NULL, false, true, false, '/Proy18001_NV3/certs/159486/CM.jpg', NULL, true, 'COLESTEROL ALTO', 'empviv2', 'jerviver21@latinmail.com');
INSERT INTO empleado VALUES (54, 456789, 'INVBAN VIVEROS', NULL, 19, false, '990855380', NULL, 'O+', 'EPS006', NULL, false, true, false, '/Proy18001_NV3/certs/456789/CM.png', NULL, true, 'COLON IRRITABLE', 'BANVUSR2', 'jerviver21@latianmail.com');
INSERT INTO empleado VALUES (51, 58794578, 'ZAMIR PATINO', NULL, 18, false, '8547596', NULL, 'A+', 'EPS003', '', false, false, false, '/Proy18001_NV3/certs/58794578/CM.png', NULL, true, NULL, 'zamir1983', 'zamir1983@gmail.com');
INSERT INTO empleado VALUES (50, 31276374, 'LUDIVIA AGUIRRE QUINTERO', NULL, 18, false, '4381153 ext 1203', NULL, 'A+', 'EPS001', '', false, false, true, '/Proy18001_NV3/certs/31276374/CM.JPG', '/Proy18001_NV3/certs/31276374/TA.jpg', true, NULL, 'ludivia1957', 'ludivia.aguirre@gmail.com');
INSERT INTO empleado VALUES (48, 4501526, 'PATRICIA GOMEZ', NULL, 18, true, '3014320608', '2013-01-01', 'A+', 'EPS004', '', false, false, true, '/Proy18001_NV3/certs/4501526/CM.jpg', '/Proy18001_NV3/certs/4501526/TA.jpg', true, NULL, 'patricia1990', 'patricia1990@hotmail.com');
INSERT INTO empleado VALUES (42, 1555, 'JAVIER HERNANDEZ', NULL, 14, true, '4381153', '2013-01-01', 'O+', 'EPS005', '', false, false, true, '/Proy18001_NV3/certs/1555/CM.png', '/Proy18001_NV3/certs/1555/TA.jpg', true, NULL, 'EMP5', 'jhernandez@nestle.com');
INSERT INTO empleado VALUES (55, 789456, 'EMPL VIVEROS', NULL, 19, false, '990855380', NULL, 'O+', 'EPS001', 'YA QUEDO TERMINADO.', true, true, false, '/Proy18001_NV3/certs/789456/CM.pdf', NULL, true, 'COLON IRRITABLE', 'empviv1', 'jerviver21@latinamil.com');
INSERT INTO empleado VALUES (52, 16879456, 'JONATAN MUNOZ', NULL, 18, false, '689547845', NULL, 'O+', 'EPS003', '', false, false, true, '/Proy18001_NV3/certs/16879456/CM.png', '/Proy18001_NV3/certs/16879456/TA.png', true, NULL, 'jony', 'jony@gmail.com');
INSERT INTO empleado VALUES (53, 123456, 'BANVIV VIVEROS', NULL, 19, false, '990855380', NULL, 'O+', 'EPS001', 'CREO QUE SE QUEDA ASI A MENOS QUE EL CLIENTE PIDA CAMBIO.', false, true, false, '/Proy18001_NV3/certs/123456/CM.png', NULL, true, 'COLON IRRITABLE', 'BANVUSR1', 'jerviver21@latinmail.com');
INSERT INTO empleado VALUES (41, 4, 'EMP4', NULL, NULL, true, '4', '2013-01-01', '4', '4', NULL, false, false, true, '/usr/proceso1096/certs/4/CM.pdf', '/usr/proceso1096/certs/4/TA.pdf', true, NULL, 'EMP4', NULL);
INSERT INTO empleado VALUES (44, 7, 'EMP7', NULL, 15, true, '7', '2013-01-01', '7', '7', '', false, false, true, '/usr/proceso1096/certs/7/CM.pdf', '/usr/proceso1096/certs/7/TA.pdf', true, NULL, 'EMP7', NULL);
INSERT INTO empleado VALUES (43, 6, 'EMP6', NULL, 14, true, '6', '2013-01-01', '6', '6', NULL, false, false, true, '/usr/proceso1096/certs/6/CM.pdf', '/usr/proceso1096/certs/6/TA.pdf', true, NULL, 'EMP6', NULL);


--
-- Data for Name: empleados_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO empleados_permiso VALUES (13, 99, 42);
INSERT INTO empleados_permiso VALUES (14, 99, 43);
INSERT INTO empleados_permiso VALUES (16, 101, 44);
INSERT INTO empleados_permiso VALUES (17, 102, 41);
INSERT INTO empleados_permiso VALUES (18, 103, 41);
INSERT INTO empleados_permiso VALUES (19, 104, 42);
INSERT INTO empleados_permiso VALUES (20, 104, 43);
INSERT INTO empleados_permiso VALUES (21, 105, 41);
INSERT INTO empleados_permiso VALUES (22, 106, 42);
INSERT INTO empleados_permiso VALUES (23, 106, 43);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equipo VALUES (2, 'Troquelador', 3);
INSERT INTO equipo VALUES (3, 'Computador', 3);
INSERT INTO equipo VALUES (1, 'Yunque', 3);
INSERT INTO equipo VALUES (4, 'Tolva', 3);
INSERT INTO equipo VALUES (5, 'Escritorio', 5);
INSERT INTO equipo VALUES (6, 'Silla', 5);
INSERT INTO equipo VALUES (15, 'eq2', 8);
INSERT INTO equipo VALUES (16, 'eq1', 8);


--
-- Data for Name: estado_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado_permiso VALUES (0, 'VENCIDO');
INSERT INTO estado_permiso VALUES (1, 'CREADO');
INSERT INTO estado_permiso VALUES (2, 'DILIGENCIADO');
INSERT INTO estado_permiso VALUES (3, 'PREAPROBADO ');
INSERT INTO estado_permiso VALUES (4, 'NO_APROBADO');
INSERT INTO estado_permiso VALUES (5, 'APROBADO ');
INSERT INTO estado_permiso VALUES (6, 'TERMINADO ');
INSERT INTO estado_permiso VALUES (7, 'SUSPENDIDO ');
INSERT INTO estado_permiso VALUES (8, 'PRECANCELADO ');
INSERT INTO estado_permiso VALUES (9, 'APROBADA_CANCELACION ');
INSERT INTO estado_permiso VALUES (10, 'CANCELADO ');


--
-- Data for Name: estado_trazabilidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estado_trazabilidad VALUES (1, 'ASIGNADO');
INSERT INTO estado_trazabilidad VALUES (2, 'EJECUTADO');
INSERT INTO estado_trazabilidad VALUES (3, 'NO EJECUTADO');


--
-- Data for Name: estados_proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO estados_proyecto VALUES (1, 'ACTIVO');
INSERT INTO estados_proyecto VALUES (2, 'TERMINADO');
INSERT INTO estados_proyecto VALUES (3, 'CANCELADO');


--
-- Data for Name: formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: group_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO group_rol VALUES (52, 12, 16);
INSERT INTO group_rol VALUES (53, 25, 16);
INSERT INTO group_rol VALUES (54, 12, 18);
INSERT INTO group_rol VALUES (55, 26, 18);
INSERT INTO group_rol VALUES (56, 12, 23);
INSERT INTO group_rol VALUES (57, 27, 23);
INSERT INTO group_rol VALUES (58, 12, 24);
INSERT INTO group_rol VALUES (59, 28, 24);
INSERT INTO group_rol VALUES (69, 12, 25);
INSERT INTO group_rol VALUES (70, 28, 25);
INSERT INTO group_rol VALUES (71, 29, 25);
INSERT INTO group_rol VALUES (72, 12, 26);
INSERT INTO group_rol VALUES (73, 28, 26);
INSERT INTO group_rol VALUES (74, 30, 26);
INSERT INTO group_rol VALUES (78, 12, 27);
INSERT INTO group_rol VALUES (79, 28, 27);
INSERT INTO group_rol VALUES (80, 31, 27);
INSERT INTO group_rol VALUES (81, 12, 28);
INSERT INTO group_rol VALUES (82, 28, 28);
INSERT INTO group_rol VALUES (83, 32, 28);
INSERT INTO group_rol VALUES (84, 12, 29);
INSERT INTO group_rol VALUES (85, 28, 29);
INSERT INTO group_rol VALUES (86, 33, 29);
INSERT INTO group_rol VALUES (87, 12, 30);
INSERT INTO group_rol VALUES (88, 28, 30);
INSERT INTO group_rol VALUES (89, 33, 30);
INSERT INTO group_rol VALUES (98, 1, 17);
INSERT INTO group_rol VALUES (99, 12, 31);
INSERT INTO group_rol VALUES (100, 28, 31);
INSERT INTO group_rol VALUES (101, 34, 31);
INSERT INTO group_rol VALUES (102, 35, 31);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO groups VALUES (16, 'ADMINISTRADORES', '-');
INSERT INTO groups VALUES (17, 'MASTER', '-');
INSERT INTO groups VALUES (18, 'VALIDADORES', '-');
INSERT INTO groups VALUES (23, 'CONTRATISTAS', '');
INSERT INTO groups VALUES (24, 'EMPLEADOS', '');
INSERT INTO groups VALUES (25, 'JEFES DE SECTOR', '');
INSERT INTO groups VALUES (26, 'ADMINISTRADORES CALIDAD', '');
INSERT INTO groups VALUES (27, 'ADMINISTRADORES SEGURIDAD', '');
INSERT INTO groups VALUES (28, 'RECEPCIONISTAS', '');
INSERT INTO groups VALUES (29, 'INGENIEROS PROYECTO', '');
INSERT INTO groups VALUES (30, 'INGENIEROS ESPECIALISTAS', '');
INSERT INTO groups VALUES (31, 'GERENTES', '');


--
-- Data for Name: idiomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO idiomas VALUES ('es', 'ESPAÑOL');
INSERT INTO idiomas VALUES ('en', 'INGLES');


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu VALUES (1, 'RAIZ', NULL, 'es', NULL);
INSERT INTO menu VALUES (97, 'Adm. Users', 1, 'en', NULL);
INSERT INTO menu VALUES (98, 'Work Permit', 1, 'en', NULL);
INSERT INTO menu VALUES (99, 'Contractors', 1, 'en', NULL);
INSERT INTO menu VALUES (100, 'Tools', 1, 'en', NULL);
INSERT INTO menu VALUES (101, 'Generals', 1, 'en', NULL);
INSERT INTO menu VALUES (102, 'Reports', 1, 'en', NULL);
INSERT INTO menu VALUES (103, 'General', 1, 'es', NULL);
INSERT INTO menu VALUES (104, 'Reportes', 1, 'es', NULL);
INSERT INTO menu VALUES (105, 'Admin Usuarios', 1, 'es', NULL);
INSERT INTO menu VALUES (106, 'Permisos de Trabajo', 1, 'es', NULL);
INSERT INTO menu VALUES (107, 'Contratistas', 1, 'es', NULL);
INSERT INTO menu VALUES (108, 'Herramientas', 1, 'es', NULL);


--
-- Data for Name: notas_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO notas_permiso VALUES (1, 32, 'Se suspendio por inactividad.', 'VALIDADOR');
INSERT INTO notas_permiso VALUES (3, 32, 'Pongamos otra notita', 'VALIDADOR');
INSERT INTO notas_permiso VALUES (4, 29, 'El trabajo fue bien realizado', 'VALIDADOR');
INSERT INTO notas_permiso VALUES (5, 29, 'Le doy una calificaciÃ³n de 10', 'VALIDADOR');
INSERT INTO notas_permiso VALUES (6, 29, 'Se suspende por deficiente manejo.', 'VALIDADOR');


--
-- Data for Name: operacion_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO operacion_permiso VALUES (0, 'CREAR');
INSERT INTO operacion_permiso VALUES (1, 'DILIGENCIAR');
INSERT INTO operacion_permiso VALUES (2, 'APROBAR');
INSERT INTO operacion_permiso VALUES (3, 'TERMINAR');
INSERT INTO operacion_permiso VALUES (4, 'CANCELAR');
INSERT INTO operacion_permiso VALUES (5, 'SUSPENDER');
INSERT INTO operacion_permiso VALUES (6, 'NO APROBAR');


--
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO parametro VALUES (9, 'grupoEmpleado', 'EMPLEADOS', 'AU');
INSERT INTO parametro VALUES (12, 'rolMaster', 'MASTER', 'AU');
INSERT INTO parametro VALUES (13, 'rolContratista', 'CONTRATISTA', 'AU');
INSERT INTO parametro VALUES (14, 'rolAdmin', 'ADMINISTRADOR', 'AU');
INSERT INTO parametro VALUES (15, 'rolValidador', 'VALIDADOR', 'AU');
INSERT INTO parametro VALUES (16, 'rolAutArea', 'AUTORIDAD_AREA', 'AU');
INSERT INTO parametro VALUES (19, 'rolGerente', 'GERENCIA', 'AU');
INSERT INTO parametro VALUES (1, 'rutaLog', '/Proy18001_NV3/log', 'LOG1');
INSERT INTO parametro VALUES (7, 'rutaDescarga', '/Proy18001_NV3/descargas', 'FILE');
INSERT INTO parametro VALUES (8, 'rutaReporte', '/Proy18001_NV3/reportes', 'FILE');
INSERT INTO parametro VALUES (11, 'dirCertificados', '/Proy18001_NV3/certs', 'FILE');
INSERT INTO parametro VALUES (20, 'prueba1', 'valor prueba', '');
INSERT INTO parametro VALUES (21, 'prueba2', '', 'valor prueba 2');
INSERT INTO parametro VALUES (22, 'prueba3', 'Valor prueba 3', '');
INSERT INTO parametro VALUES (25, 'dirChecklist', '/Proy18001_NV3/checklist', 'FILE');
INSERT INTO parametro VALUES (17, 'rolCalidad', 'CALIDAD', 'AU');
INSERT INTO parametro VALUES (18, 'rolSeguridad', 'SEGURIDAD', 'AU');
INSERT INTO parametro VALUES (10, 'grupoContratista', 'CONTRATISTAS', 'AU');
INSERT INTO parametro VALUES (27, 'rolAprobador', 'APROBADOR', 'AU');
INSERT INTO parametro VALUES (23, 'aprueba_defecto', 'ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR', 'Gestion');
INSERT INTO parametro VALUES (24, 'cancela_defecto', 'ADMINISTRADORES CALIDAD,ADMINISTRADORES SEGURIDAD,SECTOR', 'Gestion');
INSERT INTO parametro VALUES (28, 'rolRecepcionista', 'RECEPCIONISTA', 'AU');


--
-- Data for Name: parametros_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO parametros_reporte VALUES ('fechaIni', 'P1', 3, 1, NULL, 1);
INSERT INTO parametros_reporte VALUES ('fechaFin', 'P2', 3, 2, NULL, 1);


--
-- Data for Name: peligro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO peligro VALUES (2, 'a2 riesgo');
INSERT INTO peligro VALUES (4, 'INCENDIO');
INSERT INTO peligro VALUES (5, 'INUNDACION');
INSERT INTO peligro VALUES (6, 'Derrumbe');


--
-- Data for Name: peligros_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO peligros_tarea VALUES (48, 4, 71);
INSERT INTO peligros_tarea VALUES (49, 5, 71);
INSERT INTO peligros_tarea VALUES (55, 4, 82);
INSERT INTO peligros_tarea VALUES (56, 4, 85);
INSERT INTO peligros_tarea VALUES (57, 4, 86);
INSERT INTO peligros_tarea VALUES (58, 4, 89);
INSERT INTO peligros_tarea VALUES (62, 2, 93);
INSERT INTO peligros_tarea VALUES (65, 2, 97);
INSERT INTO peligros_tarea VALUES (66, 5, 98);
INSERT INTO peligros_tarea VALUES (67, 4, 99);
INSERT INTO peligros_tarea VALUES (68, 4, 103);
INSERT INTO peligros_tarea VALUES (69, 2, 105);
INSERT INTO peligros_tarea VALUES (70, 4, 106);
INSERT INTO peligros_tarea VALUES (86, 6, 152);
INSERT INTO peligros_tarea VALUES (87, 4, 153);
INSERT INTO peligros_tarea VALUES (88, 6, 154);
INSERT INTO peligros_tarea VALUES (89, 5, 155);
INSERT INTO peligros_tarea VALUES (90, 5, 157);
INSERT INTO peligros_tarea VALUES (91, 4, 158);
INSERT INTO peligros_tarea VALUES (92, 6, 156);
INSERT INTO peligros_tarea VALUES (93, 6, 159);
INSERT INTO peligros_tarea VALUES (95, 6, 161);
INSERT INTO peligros_tarea VALUES (96, 6, 162);
INSERT INTO peligros_tarea VALUES (97, 6, 163);
INSERT INTO peligros_tarea VALUES (98, 4, 169);
INSERT INTO peligros_tarea VALUES (99, 5, 169);
INSERT INTO peligros_tarea VALUES (100, 6, 169);
INSERT INTO peligros_tarea VALUES (101, 6, 170);
INSERT INTO peligros_tarea VALUES (102, 4, 170);
INSERT INTO peligros_tarea VALUES (103, 5, 171);
INSERT INTO peligros_tarea VALUES (104, 6, 171);
INSERT INTO peligros_tarea VALUES (105, 4, 172);
INSERT INTO peligros_tarea VALUES (106, 5, 172);
INSERT INTO peligros_tarea VALUES (107, 6, 172);
INSERT INTO peligros_tarea VALUES (108, 6, 173);
INSERT INTO peligros_tarea VALUES (109, 4, 174);
INSERT INTO peligros_tarea VALUES (110, 6, 175);
INSERT INTO peligros_tarea VALUES (111, 4, 176);


--
-- Data for Name: permiso_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO permiso_trabajo VALUES (101, NULL, NULL, 1, 'PTA 23', 'ADMIN1', '2013-01-09 09:02:57.817', 15, 8, NULL, NULL, true, NULL, NULL, 7, NULL, 15);
INSERT INTO permiso_trabajo VALUES (105, 1, NULL, 9, 'PTA 1P1', 'ADMIN1', '2013-01-09 17:35:52.392', 2, 3, 68, NULL, false, '2013-01-18 14:00:00', '2013-01-12 08:00:00', 7, '', NULL);
INSERT INTO permiso_trabajo VALUES (106, 1, NULL, 5, 'PTA 2P1', 'ADMIN1', '2013-01-09 17:38:34.794', 15, 8, 68, NULL, true, '2013-01-20 00:00:00', '2013-01-12 00:00:00', 7, 'Vamos a realizar la prueba de impresion del permiso.', 14);
INSERT INTO permiso_trabajo VALUES (102, 1, NULL, 10, 'PTA 22', 'ADMIN1', '2013-01-09 09:04:35.752', 16, 8, NULL, NULL, false, NULL, NULL, 7, 'Quiero ver que se le asigne al jefe de seguridad y al gerente!', NULL);
INSERT INTO permiso_trabajo VALUES (90, 2, NULL, 10, 'cambio de estrategia grafica.', 'admin', '2012-12-20 13:09:34.566', 2, 3, NULL, 111, false, '2012-12-31 00:00:00', '2012-12-20 00:00:00', 7, '', NULL);
INSERT INTO permiso_trabajo VALUES (56, 1, NULL, 2, 'awdre', 'admin', '2012-12-11 09:49:38.369', 2, 3, NULL, NULL, false, NULL, NULL, 7, 'OK. De nuevo a que me lo aprueben!', NULL);
INSERT INTO permiso_trabajo VALUES (30, 1, NULL, 2, 'Mantenimiento preventivo', 'INGENIERIA', '2012-12-07 19:02:32.68', 3, 3, NULL, 123, false, NULL, NULL, 7, 'Realizar lavados cada 5 minutos', NULL);
INSERT INTO permiso_trabajo VALUES (80, 1, NULL, 2, 'act 1 px1', 'admin', '2012-12-13 13:20:39.115', NULL, 3, 61, NULL, false, '2012-12-31 00:00:00', '2012-12-14 00:00:00', 7, NULL, NULL);
INSERT INTO permiso_trabajo VALUES (84, 3, NULL, 2, 'a1 p234', 'admin', '2012-12-13 15:54:45.126', 2, 3, 67, NULL, false, '2012-12-23 00:00:00', '2012-12-20 00:00:00', 7, NULL, NULL);
INSERT INTO permiso_trabajo VALUES (85, 1, NULL, 4, 'a2 p234.1', 'admin', '2012-12-13 15:55:07.045', 5, 5, 67, NULL, false, '2012-12-27 18:00:00', '2012-12-25 06:00:00', 7, 'ok', NULL);
INSERT INTO permiso_trabajo VALUES (53, 1, NULL, 3, 'ffffff', 'admin', '2012-12-10 20:10:33.688', 2, 3, 42, NULL, false, NULL, NULL, 7, 'ok', NULL);
INSERT INTO permiso_trabajo VALUES (54, 1, NULL, 3, 'Como asi que Q', 'admin', '2012-12-11 09:20:34.136', 2, 3, NULL, NULL, false, NULL, NULL, 7, 'ok', NULL);
INSERT INTO permiso_trabajo VALUES (104, 1, NULL, 10, 'PTA 25', 'ADMIN1', '2013-01-09 15:23:03.537', 15, 8, NULL, 234654, true, '2013-01-20 00:00:00', '2013-01-10 00:00:00', 7, 'Consideracion1', 14);
INSERT INTO permiso_trabajo VALUES (32, 1, NULL, 2, 'Desarmar el troquelador 1.', 'admin', '2012-12-09 15:11:45.484', 2, 5, NULL, NULL, true, NULL, NULL, 7, 'No puede diligenciarlo un usuario del contratista, debe diligenciarlo el contratista.', NULL);
INSERT INTO permiso_trabajo VALUES (29, 1, NULL, 7, 'Limpiar Silla', 'INGENIERIA', '2012-12-06 11:01:37.906', 6, 5, NULL, NULL, false, NULL, NULL, 5, 'ok. corregido.', NULL);
INSERT INTO permiso_trabajo VALUES (103, 1, NULL, 2, 'PTA 24', 'ADMIN1', '2013-01-09 09:05:29.5', 15, 8, NULL, NULL, false, NULL, NULL, 7, 'ok.', NULL);
INSERT INTO permiso_trabajo VALUES (87, 1, NULL, 2, 'val 1.1', 'admin', '2012-12-13 17:32:42.705', 2, 3, NULL, 123, false, '2012-12-25 00:00:00', '2012-12-20 00:00:00', 7, '', NULL);
INSERT INTO permiso_trabajo VALUES (99, -1, NULL, 1, 'PTA 21', 'ADMIN1', '2013-01-09 08:55:25.778', 15, 8, NULL, 1245, true, '2013-01-30 00:00:00', '2013-01-15 00:00:00', 7, NULL, 14);


--
-- Data for Name: proyecto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO proyecto VALUES (42, 121212, 'proy 12', 121212, '2012-12-31', '2012-12-01', 1, NULL, '2012-12-10 20:09:34.182', 'admin');
INSERT INTO proyecto VALUES (45, 1234, 'asdf', 121313, '2012-12-31', '2012-12-01', 1, NULL, '2012-12-11 09:49:50.25', 'admin');
INSERT INTO proyecto VALUES (55, 2, 'proyecto 2', 2, '2012-12-31', '2012-12-11', 1, NULL, '2012-12-11 12:30:37.184', 'admin');
INSERT INTO proyecto VALUES (47, 2345, 'asd', 345, '2012-12-31', '2012-12-11', 1, NULL, '2012-12-11 09:59:57.372', 'admin');
INSERT INTO proyecto VALUES (62, 234, 'Proyecto y1', 233, '2012-12-31', '2012-12-11', 1, NULL, '2012-12-13 10:25:19.143', 'admin');
INSERT INTO proyecto VALUES (63, 777, 'proyecto 777', 777, '2012-12-31', '2012-12-15', 1, NULL, '2012-12-13 11:19:25.22', 'admin');
INSERT INTO proyecto VALUES (64, 1, 'p1', 1, '2012-12-27', '2012-12-17', 1, NULL, '2012-12-13 11:26:45.137', 'admin');
INSERT INTO proyecto VALUES (66, 345, 'p345', 345, '2012-12-29', '2012-12-15', 1, NULL, '2012-12-13 15:40:45.367', 'admin');
INSERT INTO proyecto VALUES (67, 234, 'p234', 234, '2012-12-30', '2012-12-20', 1, NULL, '2012-12-13 15:53:55.569', 'admin');
INSERT INTO proyecto VALUES (61, 123, 'Proyecto X123', 123, '2012-12-31', '2012-12-13', 1, NULL, '2012-12-13 10:19:39.767', 'admin');
INSERT INTO proyecto VALUES (68, 0, 'Proy PTA1', 1, '2013-01-20', '2013-01-10', 1, NULL, '2013-01-09 17:34:42.929', 'ADMIN1');


--
-- Data for Name: reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO reporte VALUES ('R1', 'ROLE_ADMIN, ROLE_USER', 1, 1);


--
-- Data for Name: resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO resource VALUES (160, 'Employee', NULL, 99, '/contratistas/empleados.xhtml', 'en');
INSERT INTO resource VALUES (161, 'Permissions', NULL, 98, '/permisostrabajo/permisos.xhtml', 'en');
INSERT INTO resource VALUES (162, 'My permission', NULL, 98, '/permisostrabajo/permisos_x_diligenciar.xhtml', 'en');
INSERT INTO resource VALUES (163, 'Change password', NULL, 101, '/general/change_password.xhtml', 'en');
INSERT INTO resource VALUES (164, 'Params', NULL, 101, '/general/parametros.xhtml', 'en');
INSERT INTO resource VALUES (165, 'Log', NULL, 101, '/general/log.xhtml', 'en');
INSERT INTO resource VALUES (166, 'DB', NULL, 101, '/general/adminBD.xhtml', 'en');
INSERT INTO resource VALUES (167, 'Reports', NULL, 101, '/reportes/reportes.xhtml', 'en');
INSERT INTO resource VALUES (168, 'Users', NULL, 97, '/usuarios/usuarios.xhtml', 'en');
INSERT INTO resource VALUES (169, 'Menus', NULL, 97, '/usuarios/menus.xhtml', 'en');
INSERT INTO resource VALUES (170, 'Groups', NULL, 97, '/usuarios/grupos.xhtml', 'en');
INSERT INTO resource VALUES (171, 'Roles', NULL, 97, '/usuarios/roles.xhtml', 'en');
INSERT INTO resource VALUES (172, 'Resources', NULL, 97, '/usuarios/recursos.xhtml', 'en');
INSERT INTO resource VALUES (173, 'Proyects', NULL, 98, '/permisostrabajo/proyecto.xhtml', 'en');
INSERT INTO resource VALUES (174, 'Contractors', NULL, 99, '/contratistas/contratistas.xhtml', 'en');
INSERT INTO resource VALUES (175, 'Sectors', NULL, 100, '/pt_tablasref/sector.xhtml', 'en');
INSERT INTO resource VALUES (176, 'Dangers', NULL, 100, '/pt_tablasref/peligro.xhtml', 'en');
INSERT INTO resource VALUES (177, 'Change Language', NULL, 101, '/general/cambiar_idioma.xhtml', 'en');
INSERT INTO resource VALUES (178, 'Empleados', NULL, 107, '/contratistas/empleados.xhtml', 'es');
INSERT INTO resource VALUES (179, 'Menus', NULL, 105, '/usuarios/menus.xhtml', 'es');
INSERT INTO resource VALUES (180, 'Grupos', NULL, 105, '/usuarios/grupos.xhtml', 'es');
INSERT INTO resource VALUES (181, 'Roles', NULL, 105, '/usuarios/roles.xhtml', 'es');
INSERT INTO resource VALUES (182, 'Recursos', NULL, 105, '/usuarios/recursos.xhtml', 'es');
INSERT INTO resource VALUES (184, 'Contratistas', NULL, 107, '/contratistas/contratistas.xhtml', 'es');
INSERT INTO resource VALUES (187, 'Cambiar Idioma', NULL, 103, '/general/cambiar_idioma.xhtml', 'es');
INSERT INTO resource VALUES (188, 'Permisos', NULL, 106, '/permisostrabajo/permisos.xhtml', 'es');
INSERT INTO resource VALUES (190, 'Cambiar Clave', NULL, 103, '/general/change_password.xhtml', 'es');
INSERT INTO resource VALUES (191, 'Parametros', NULL, 103, '/general/parametros.xhtml', 'es');
INSERT INTO resource VALUES (192, 'Log', NULL, 103, '/general/log.xhtml', 'es');
INSERT INTO resource VALUES (193, 'BD', NULL, 103, '/general/adminBD.xhtml', 'es');
INSERT INTO resource VALUES (194, 'Reportes', NULL, 103, '/reportes/reportes.xhtml', 'es');
INSERT INTO resource VALUES (195, 'Usuarios', NULL, 105, '/usuarios/usuarios.xhtml', 'es');
INSERT INTO resource VALUES (183, 'Proyectos', '', 106, '/permisostrabajo/proyectos.xhtml', 'es');
INSERT INTO resource VALUES (185, 'Sectores', '', 108, '/herramientas/sector.xhtml', 'es');
INSERT INTO resource VALUES (186, 'Peligros', '', 108, '/herramientas/peligro.xhtml', 'es');
INSERT INTO resource VALUES (200, 'Certifieds', NULL, 100, '/herramientas/certificados.xhtml', 'en');
INSERT INTO resource VALUES (201, 'Certificados', NULL, 108, '/herramientas/certificados.xhtml', 'es');
INSERT INTO resource VALUES (202, 'Mis Permisos', NULL, 106, '/permisostrabajo/mis_permisos.xhtml', 'es');


--
-- Data for Name: riesgos_peligro_tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO riesgos_peligro_tarea VALUES (57, NULL, 'risk1', 48);
INSERT INTO riesgos_peligro_tarea VALUES (58, NULL, 'risk2', 48);
INSERT INTO riesgos_peligro_tarea VALUES (59, NULL, 'risk3', 49);
INSERT INTO riesgos_peligro_tarea VALUES (69, NULL, 'r5', 66);
INSERT INTO riesgos_peligro_tarea VALUES (70, NULL, 'risk1', 70);
INSERT INTO riesgos_peligro_tarea VALUES (77, NULL, 'Riesgo 2', 88);
INSERT INTO riesgos_peligro_tarea VALUES (79, NULL, 'Riesgo 2', 95);
INSERT INTO riesgos_peligro_tarea VALUES (80, NULL, 'Riesgo 1', 98);
INSERT INTO riesgos_peligro_tarea VALUES (81, NULL, 'Riesgo 2', 98);
INSERT INTO riesgos_peligro_tarea VALUES (82, NULL, 'Riesgo 3', 98);
INSERT INTO riesgos_peligro_tarea VALUES (83, NULL, 'Riesgo 1', 99);
INSERT INTO riesgos_peligro_tarea VALUES (84, NULL, 'Riesgo 2', 99);
INSERT INTO riesgos_peligro_tarea VALUES (85, NULL, 'Riesgo Inicial', 100);
INSERT INTO riesgos_peligro_tarea VALUES (86, NULL, 'Riesgo Final', 100);
INSERT INTO riesgos_peligro_tarea VALUES (87, NULL, 'Riesgo Final', 103);


--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rol VALUES (12, 'ROLE_USER', NULL);
INSERT INTO rol VALUES (25, 'ADMINISTRADOR', '');
INSERT INTO rol VALUES (26, 'VALIDADOR', '');
INSERT INTO rol VALUES (32, 'RECEPCIONISTA', '');
INSERT INTO rol VALUES (33, 'INGENIERIA', '');
INSERT INTO rol VALUES (31, 'SEGURIDAD', '');
INSERT INTO rol VALUES (30, 'CALIDAD', '');
INSERT INTO rol VALUES (27, 'CONTRATISTA', '');
INSERT INTO rol VALUES (28, 'EMPLEADO', '');
INSERT INTO rol VALUES (29, 'AUTORIDAD_AREA', '');
INSERT INTO rol VALUES (34, 'GERENCIA', '');
INSERT INTO rol VALUES (1, 'MASTER', '');
INSERT INTO rol VALUES (35, 'APROBADOR', 'Pueden aprobar los permisos de trabajo');


--
-- Data for Name: rol_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rol_resource VALUES (724, 160, 25);
INSERT INTO rol_resource VALUES (726, 160, 32);
INSERT INTO rol_resource VALUES (727, 160, 27);
INSERT INTO rol_resource VALUES (728, 160, 34);
INSERT INTO rol_resource VALUES (729, 160, 1);
INSERT INTO rol_resource VALUES (730, 161, 25);
INSERT INTO rol_resource VALUES (731, 161, 1);
INSERT INTO rol_resource VALUES (732, 161, 34);
INSERT INTO rol_resource VALUES (733, 161, 27);
INSERT INTO rol_resource VALUES (734, 161, 33);
INSERT INTO rol_resource VALUES (735, 162, 25);
INSERT INTO rol_resource VALUES (736, 162, 1);
INSERT INTO rol_resource VALUES (737, 162, 34);
INSERT INTO rol_resource VALUES (738, 162, 27);
INSERT INTO rol_resource VALUES (739, 162, 33);
INSERT INTO rol_resource VALUES (740, 162, 29);
INSERT INTO rol_resource VALUES (741, 162, 31);
INSERT INTO rol_resource VALUES (742, 162, 30);
INSERT INTO rol_resource VALUES (743, 162, 28);
INSERT INTO rol_resource VALUES (744, 163, 29);
INSERT INTO rol_resource VALUES (745, 163, 31);
INSERT INTO rol_resource VALUES (746, 163, 34);
INSERT INTO rol_resource VALUES (747, 163, 27);
INSERT INTO rol_resource VALUES (748, 163, 12);
INSERT INTO rol_resource VALUES (749, 163, 30);
INSERT INTO rol_resource VALUES (750, 163, 28);
INSERT INTO rol_resource VALUES (751, 163, 1);
INSERT INTO rol_resource VALUES (752, 163, 32);
INSERT INTO rol_resource VALUES (753, 163, 25);
INSERT INTO rol_resource VALUES (755, 163, 33);
INSERT INTO rol_resource VALUES (756, 164, 1);
INSERT INTO rol_resource VALUES (757, 165, 1);
INSERT INTO rol_resource VALUES (758, 166, 1);
INSERT INTO rol_resource VALUES (759, 167, 1);
INSERT INTO rol_resource VALUES (760, 168, 1);
INSERT INTO rol_resource VALUES (761, 168, 25);
INSERT INTO rol_resource VALUES (762, 169, 1);
INSERT INTO rol_resource VALUES (763, 170, 1);
INSERT INTO rol_resource VALUES (764, 170, 25);
INSERT INTO rol_resource VALUES (765, 171, 1);
INSERT INTO rol_resource VALUES (766, 172, 1);
INSERT INTO rol_resource VALUES (767, 173, 25);
INSERT INTO rol_resource VALUES (768, 173, 1);
INSERT INTO rol_resource VALUES (769, 173, 34);
INSERT INTO rol_resource VALUES (770, 173, 33);
INSERT INTO rol_resource VALUES (771, 174, 25);
INSERT INTO rol_resource VALUES (772, 174, 1);
INSERT INTO rol_resource VALUES (773, 174, 34);
INSERT INTO rol_resource VALUES (775, 175, 25);
INSERT INTO rol_resource VALUES (776, 175, 1);
INSERT INTO rol_resource VALUES (777, 175, 34);
INSERT INTO rol_resource VALUES (778, 176, 25);
INSERT INTO rol_resource VALUES (779, 176, 1);
INSERT INTO rol_resource VALUES (780, 176, 34);
INSERT INTO rol_resource VALUES (781, 177, 29);
INSERT INTO rol_resource VALUES (782, 177, 31);
INSERT INTO rol_resource VALUES (783, 177, 34);
INSERT INTO rol_resource VALUES (784, 177, 27);
INSERT INTO rol_resource VALUES (785, 177, 12);
INSERT INTO rol_resource VALUES (786, 177, 30);
INSERT INTO rol_resource VALUES (787, 177, 28);
INSERT INTO rol_resource VALUES (788, 177, 1);
INSERT INTO rol_resource VALUES (789, 177, 32);
INSERT INTO rol_resource VALUES (790, 177, 25);
INSERT INTO rol_resource VALUES (792, 177, 33);
INSERT INTO rol_resource VALUES (793, 178, 25);
INSERT INTO rol_resource VALUES (794, 178, 26);
INSERT INTO rol_resource VALUES (795, 178, 32);
INSERT INTO rol_resource VALUES (796, 178, 27);
INSERT INTO rol_resource VALUES (797, 178, 34);
INSERT INTO rol_resource VALUES (798, 178, 1);
INSERT INTO rol_resource VALUES (799, 179, 1);
INSERT INTO rol_resource VALUES (800, 180, 1);
INSERT INTO rol_resource VALUES (801, 180, 25);
INSERT INTO rol_resource VALUES (802, 181, 1);
INSERT INTO rol_resource VALUES (803, 182, 1);
INSERT INTO rol_resource VALUES (804, 183, 25);
INSERT INTO rol_resource VALUES (805, 183, 1);
INSERT INTO rol_resource VALUES (806, 183, 34);
INSERT INTO rol_resource VALUES (807, 183, 33);
INSERT INTO rol_resource VALUES (808, 184, 25);
INSERT INTO rol_resource VALUES (809, 184, 1);
INSERT INTO rol_resource VALUES (810, 184, 34);
INSERT INTO rol_resource VALUES (811, 184, 26);
INSERT INTO rol_resource VALUES (812, 185, 25);
INSERT INTO rol_resource VALUES (813, 185, 1);
INSERT INTO rol_resource VALUES (814, 185, 34);
INSERT INTO rol_resource VALUES (815, 186, 25);
INSERT INTO rol_resource VALUES (816, 186, 1);
INSERT INTO rol_resource VALUES (817, 186, 34);
INSERT INTO rol_resource VALUES (818, 187, 29);
INSERT INTO rol_resource VALUES (819, 187, 31);
INSERT INTO rol_resource VALUES (820, 187, 34);
INSERT INTO rol_resource VALUES (821, 187, 27);
INSERT INTO rol_resource VALUES (822, 187, 12);
INSERT INTO rol_resource VALUES (823, 187, 30);
INSERT INTO rol_resource VALUES (824, 187, 28);
INSERT INTO rol_resource VALUES (825, 187, 1);
INSERT INTO rol_resource VALUES (826, 187, 32);
INSERT INTO rol_resource VALUES (827, 187, 25);
INSERT INTO rol_resource VALUES (828, 187, 26);
INSERT INTO rol_resource VALUES (829, 187, 33);
INSERT INTO rol_resource VALUES (830, 188, 25);
INSERT INTO rol_resource VALUES (831, 188, 1);
INSERT INTO rol_resource VALUES (832, 188, 34);
INSERT INTO rol_resource VALUES (833, 188, 27);
INSERT INTO rol_resource VALUES (834, 188, 33);
INSERT INTO rol_resource VALUES (844, 190, 29);
INSERT INTO rol_resource VALUES (845, 190, 31);
INSERT INTO rol_resource VALUES (846, 190, 34);
INSERT INTO rol_resource VALUES (847, 190, 27);
INSERT INTO rol_resource VALUES (848, 190, 12);
INSERT INTO rol_resource VALUES (849, 190, 30);
INSERT INTO rol_resource VALUES (850, 190, 28);
INSERT INTO rol_resource VALUES (851, 190, 1);
INSERT INTO rol_resource VALUES (852, 190, 32);
INSERT INTO rol_resource VALUES (853, 190, 25);
INSERT INTO rol_resource VALUES (854, 190, 26);
INSERT INTO rol_resource VALUES (855, 190, 33);
INSERT INTO rol_resource VALUES (856, 191, 1);
INSERT INTO rol_resource VALUES (857, 192, 1);
INSERT INTO rol_resource VALUES (858, 193, 1);
INSERT INTO rol_resource VALUES (859, 194, 1);
INSERT INTO rol_resource VALUES (860, 195, 1);
INSERT INTO rol_resource VALUES (861, 195, 25);
INSERT INTO rol_resource VALUES (866, 200, 25);
INSERT INTO rol_resource VALUES (867, 200, 1);
INSERT INTO rol_resource VALUES (868, 201, 25);
INSERT INTO rol_resource VALUES (869, 201, 1);
INSERT INTO rol_resource VALUES (870, 202, 25);
INSERT INTO rol_resource VALUES (871, 202, 1);
INSERT INTO rol_resource VALUES (872, 202, 34);
INSERT INTO rol_resource VALUES (873, 202, 27);
INSERT INTO rol_resource VALUES (874, 202, 33);
INSERT INTO rol_resource VALUES (875, 202, 29);
INSERT INTO rol_resource VALUES (876, 202, 31);
INSERT INTO rol_resource VALUES (877, 202, 30);
INSERT INTO rol_resource VALUES (878, 202, 28);
INSERT INTO rol_resource VALUES (879, 202, 26);


--
-- Data for Name: sector; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sector VALUES (3, 'Area1', 'JEFES DE SECTOR');
INSERT INTO sector VALUES (5, 'Area 5', 'JEFES DE SECTOR');
INSERT INTO sector VALUES (4, 'Area4', 'JEFES DE SECTOR');
INSERT INTO sector VALUES (8, 'Area 2', 'JEFES DE SECTOR');


--
-- Data for Name: sectores_afectados_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sectores_afectados_permiso VALUES (5, 3, 30);
INSERT INTO sectores_afectados_permiso VALUES (6, 4, 30);
INSERT INTO sectores_afectados_permiso VALUES (7, 3, 56);
INSERT INTO sectores_afectados_permiso VALUES (8, 3, 29);
INSERT INTO sectores_afectados_permiso VALUES (9, 3, 32);
INSERT INTO sectores_afectados_permiso VALUES (10, 4, 32);
INSERT INTO sectores_afectados_permiso VALUES (11, 4, 102);
INSERT INTO sectores_afectados_permiso VALUES (12, 3, 102);
INSERT INTO sectores_afectados_permiso VALUES (20, 3, 104);
INSERT INTO sectores_afectados_permiso VALUES (22, 3, 103);
INSERT INTO sectores_afectados_permiso VALUES (55, 3, 106);
INSERT INTO sectores_afectados_permiso VALUES (56, 5, 106);


--
-- Data for Name: tarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tarea VALUES (150, 'Paso 29', 102, 1);
INSERT INTO tarea VALUES (151, 'Paso 30', 102, 2);
INSERT INTO tarea VALUES (152, 'Paso 31', 102, 3);
INSERT INTO tarea VALUES (153, 'Paso 32', 102, 4);
INSERT INTO tarea VALUES (154, 'Paso 33', 102, 5);
INSERT INTO tarea VALUES (155, 'Paso 34', 102, 6);
INSERT INTO tarea VALUES (71, 'Paso 1', 30, 1);
INSERT INTO tarea VALUES (156, 'Paso 1', 104, 1);
INSERT INTO tarea VALUES (157, 'Paso 2', 104, 2);
INSERT INTO tarea VALUES (158, 'Paso 3', 104, 3);
INSERT INTO tarea VALUES (159, 'Paso 4', 104, 4);
INSERT INTO tarea VALUES (82, 'Paso 1', 85, 1);
INSERT INTO tarea VALUES (83, 'Paso 2', 85, 2);
INSERT INTO tarea VALUES (85, 'Paso 3', 85, 3);
INSERT INTO tarea VALUES (86, 'Paso 4', 85, 4);
INSERT INTO tarea VALUES (88, 'Paso 5', 85, 5);
INSERT INTO tarea VALUES (89, 'p1', 90, 1);
INSERT INTO tarea VALUES (161, 'Paso 2', 103, 1);
INSERT INTO tarea VALUES (162, 'Paso 3', 103, 2);
INSERT INTO tarea VALUES (93, 'p2', 90, 2);
INSERT INTO tarea VALUES (163, 'Paso 4', 103, 3);
INSERT INTO tarea VALUES (164, 'Paso 1', 87, 1);
INSERT INTO tarea VALUES (97, 'paso 8', 30, 2);
INSERT INTO tarea VALUES (98, 'paso 9', 30, 3);
INSERT INTO tarea VALUES (99, 'pa1', 53, 1);
INSERT INTO tarea VALUES (102, 'p1', 54, 1);
INSERT INTO tarea VALUES (103, 'paso 1', 80, 1);
INSERT INTO tarea VALUES (104, 'p1', 56, 1);
INSERT INTO tarea VALUES (105, 'p1', 29, 1);
INSERT INTO tarea VALUES (106, 'Terminar', 32, 1);
INSERT INTO tarea VALUES (165, 'Paso 2', 87, 2);
INSERT INTO tarea VALUES (166, 'Paso 3', 87, 3);
INSERT INTO tarea VALUES (167, 'Paso 4', 87, 4);
INSERT INTO tarea VALUES (168, 'P1', 105, 1);
INSERT INTO tarea VALUES (169, 'Paso 1', 106, 1);
INSERT INTO tarea VALUES (170, 'Paso 2', 106, 2);
INSERT INTO tarea VALUES (171, 'Paso 3', 106, 3);
INSERT INTO tarea VALUES (172, 'Paso 4', 106, 4);
INSERT INTO tarea VALUES (173, 'Paso 5', 106, 5);
INSERT INTO tarea VALUES (174, 'Paso 6', 106, 6);
INSERT INTO tarea VALUES (175, 'Paso 7', 106, 7);
INSERT INTO tarea VALUES (176, 'Paso 8', 106, 8);


--
-- Data for Name: tipo_archivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_archivo VALUES (1, 'XLS');
INSERT INTO tipo_archivo VALUES (2, 'PDF');
INSERT INTO tipo_archivo VALUES (3, 'TXT');


--
-- Data for Name: tipo_certificados_emp; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: tipo_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_id VALUES (1, 'CC');
INSERT INTO tipo_id VALUES (2, 'NIT');
INSERT INTO tipo_id VALUES (3, 'CE');


--
-- Data for Name: tipo_parametro_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_parametro_reporte VALUES ('NUMERIC', 1, 'Representa valores numéricos: int, long, double, float');
INSERT INTO tipo_parametro_reporte VALUES ('TEXT', 2, 'Representa cadenas de texto');
INSERT INTO tipo_parametro_reporte VALUES ('DATE', 3, 'Representa Fechas');
INSERT INTO tipo_parametro_reporte VALUES ('TIME', 4, 'Representa Horas');
INSERT INTO tipo_parametro_reporte VALUES ('DATA', 5, 'Representa tablas multivaluadas, como municipios, tipos de id, etc; DEBE EXISTIR UNA TABLA que las represente');


--
-- Data for Name: tipo_proceso_reporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_proceso_reporte VALUES (1, 'REPORTES');
INSERT INTO tipo_proceso_reporte VALUES (2, 'ARCHIVOS');


--
-- Data for Name: trazabilidad_activacion_emps; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO trazabilidad_activacion_emps VALUES (56, 48, '2013-01-15', 'ADMIN1', NULL, NULL, NULL, false);
INSERT INTO trazabilidad_activacion_emps VALUES (57, 48, '2013-01-15', 'ADMIN1', '2013-01-01', NULL, NULL, true);
INSERT INTO trazabilidad_activacion_emps VALUES (58, 42, '2013-01-16', 'ADMIN1', NULL, NULL, NULL, true);
INSERT INTO trazabilidad_activacion_emps VALUES (59, 42, '2013-01-16', 'ADMIN1', '2013-01-01', NULL, NULL, true);
INSERT INTO trazabilidad_activacion_emps VALUES (60, 41, '2013-01-16', 'ADMIN1', NULL, NULL, NULL, false);
INSERT INTO trazabilidad_activacion_emps VALUES (61, 41, '2013-01-16', 'ADMIN1', '2013-01-01', NULL, NULL, true);
INSERT INTO trazabilidad_activacion_emps VALUES (62, 43, '2013-01-16', 'ADMIN1', NULL, NULL, NULL, false);
INSERT INTO trazabilidad_activacion_emps VALUES (63, 44, '2013-01-16', 'ADMIN1', NULL, NULL, NULL, false);
INSERT INTO trazabilidad_activacion_emps VALUES (64, 44, '2013-01-16', 'ADMIN1', '2013-01-01', NULL, NULL, true);
INSERT INTO trazabilidad_activacion_emps VALUES (65, 43, '2013-01-16', 'ADMIN1', '2013-01-01', NULL, NULL, true);


--
-- Data for Name: trazabilidad_permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO trazabilidad_permiso VALUES (77, '2012-12-06 11:01:37.906', 2, 29, 'INGENIERIA', 0, NULL, 'INGENIERIA');
INSERT INTO trazabilidad_permiso VALUES (79, '2012-12-07 19:02:32.68', 2, 30, 'INGENIERIA', 0, NULL, 'INGENIERIA');
INSERT INTO trazabilidad_permiso VALUES (85, '2012-12-09 15:11:45.484', 2, 32, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (134, '2012-12-27 18:35:36.016', 2, 56, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (228, '2012-12-27 18:42:14.827', 2, 56, 'JEFES DE SECTOR', 2, NULL, 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (229, '2012-12-27 18:59:01.788', 2, 56, 'ADMINISTRADORES CALIDAD', 2, NULL, 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (206, '2012-12-27 19:00:20.299', 2, 90, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (235, '2012-12-27 19:01:00.35', 2, 56, 'JEFSEG', 6, NULL, 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (222, '2013-01-03 12:58:45.461', 2, 53, 'JEFES DE SECTOR', 2, 'ok.', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (78, '2012-12-27 20:09:20.164', 2, 29, 'EMP2', 1, NULL, 'EMP2');
INSERT INTO trazabilidad_permiso VALUES (239, '2012-12-27 20:09:58.12', 2, 29, 'JEFES DE SECTOR', 2, NULL, 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (237, '2012-12-27 20:26:55.359', 2, 29, 'ADMINISTRADORES CALIDAD', 2, '', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (241, '2012-12-27 20:27:24.161', 2, 29, 'GERENTE', 6, 'Esta mal diligenciado.', 'GERENTE');
INSERT INTO trazabilidad_permiso VALUES (176, '2012-12-13 13:20:39.115', 2, 80, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (242, '2012-12-27 20:27:53.66', 2, 29, 'EMP2', 1, NULL, 'EMP2');
INSERT INTO trazabilidad_permiso VALUES (238, '2012-12-27 20:28:32.196', 2, 29, 'ADMINISTRADORES SEGURIDAD', 2, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (240, '2012-12-27 20:28:57.293', 2, 29, 'GERENTES', 2, 'ahora si!', 'GERENTE');
INSERT INTO trazabilidad_permiso VALUES (243, '2012-12-27 20:28:57.317', 1, 29, 'EMP2', 3, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (234, '2012-12-31 10:20:24.054', 2, 90, 'JEFES DE SECTOR', 2, 'OK', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (233, '2012-12-31 11:16:09.75', 2, 90, 'ADMINISTRADORES SEGURIDAD', 2, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (232, '2012-12-31 11:16:35.983', 2, 90, 'ADMINISTRADORES CALIDAD', 2, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (244, '2012-12-31 11:16:54.959', 2, 90, 'GERENTE', 2, 'ok', 'GERENTE');
INSERT INTO trazabilidad_permiso VALUES (245, '2012-12-31 11:56:21.737', 2, 90, 'EMP1', 3, 'Terminado!', 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (248, '2012-12-31 11:58:20.591', 2, 90, 'JEFES DE SECTOR', 4, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (246, '2012-12-31 11:58:38.78', 2, 90, 'ADMINISTRADORES CALIDAD', 4, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (247, '2012-12-31 11:59:06.188', 2, 90, 'ADMINISTRADORES SEGURIDAD', 4, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (249, '2012-12-31 11:59:32.552', 2, 90, 'admin', 4, 'ok', 'admin');
INSERT INTO trazabilidad_permiso VALUES (236, '2013-01-02 16:44:51.601', 2, 56, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (230, '2013-01-02 16:44:51.734', 1, 56, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (231, '2013-01-02 16:44:51.734', 1, 56, 'GERENTE', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (250, '2013-01-03 12:38:16.466', 2, 54, 'JEFSEC', 6, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (225, '2013-01-03 13:05:34.718', 2, 54, 'JEFES DE SECTOR', 2, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (86, '2013-01-04 08:37:11.687', 2, 32, 'CON2', 1, NULL, 'CON2');
INSERT INTO trazabilidad_permiso VALUES (256, '2013-01-04 08:37:11.706', 1, 32, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (252, '2013-01-03 12:38:30.021', 2, 53, 'JEFSEC', 6, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (257, '2013-01-04 08:37:11.761', 1, 32, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (258, '2013-01-04 08:37:11.772', 1, 32, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (254, '2013-01-03 12:38:43.37', 2, 85, 'JEFSEC', 6, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (255, '2013-01-03 12:38:43.393', 1, 85, 'EMP1', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (219, '2012-12-26 11:50:40.716', 3, 85, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (220, '2012-12-26 11:50:40.75', 3, 85, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (221, '2012-12-26 11:50:40.761', 3, 85, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (253, '2013-01-03 12:41:03.12', 2, 53, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (223, '2013-01-03 12:41:03.156', 1, 53, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (224, '2013-01-03 12:41:03.156', 1, 53, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (251, '2013-01-03 12:41:19.05', 2, 54, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (226, '2013-01-03 12:41:19.068', 1, 54, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (227, '2013-01-03 12:41:19.068', 1, 54, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (186, '2012-12-13 15:54:45.126', 2, 84, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (188, '2012-12-13 15:55:07.045', 2, 85, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (192, '2012-12-13 17:32:42.705', 2, 87, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (127, '2012-12-10 20:10:33.688', 2, 53, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (129, '2012-12-11 09:20:34.136', 2, 54, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (133, '2012-12-11 09:49:38.369', 2, 56, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (199, '2012-12-19 08:10:25.759', 1, 80, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (200, '2012-12-19 08:10:25.872', 1, 80, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (201, '2012-12-19 08:10:25.879', 1, 80, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (177, '2012-12-19 08:10:25.758', 2, 80, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (178, '2012-12-19 08:10:25.759', 3, 80, 'EMP2', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (202, '2012-12-19 08:12:36.316', 1, 84, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (203, '2012-12-19 08:12:36.342', 1, 84, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (204, '2012-12-19 08:12:36.353', 1, 84, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (187, '2012-12-19 08:12:36.316', 2, 84, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (205, '2012-12-20 13:09:34.566', 2, 90, 'admin', 0, NULL, 'admin');
INSERT INTO trazabilidad_permiso VALUES (80, '2012-12-26 11:27:42.818', 2, 30, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (81, '2012-12-26 11:27:42.818', 3, 30, 'EMP2', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (207, '2012-12-26 11:38:39.556', 3, 30, 'JEFES DE SECTOR', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (208, '2012-12-26 11:38:39.556', 3, 30, 'ADMINISTRADORES CALIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (209, '2012-12-26 11:38:39.556', 3, 30, 'ADMINISTRADORES SEGURIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (210, '2012-12-26 11:39:34.903', 3, 30, 'JEFES DE SECTOR', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (211, '2012-12-26 11:39:34.903', 3, 30, 'ADMINISTRADORES CALIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (212, '2012-12-26 11:39:34.903', 3, 30, 'ADMINISTRADORES SEGURIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (216, '2012-12-26 11:43:42.201', 1, 30, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (217, '2012-12-26 11:43:42.237', 1, 30, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (218, '2012-12-26 11:43:42.248', 1, 30, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (213, '2012-12-26 11:43:42.201', 3, 30, 'JEFES DE SECTOR', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (214, '2012-12-26 11:43:42.201', 3, 30, 'ADMINISTRADORES CALIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (215, '2012-12-26 11:43:42.201', 3, 30, 'ADMINISTRADORES SEGURIDAD', 2, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (189, '2012-12-26 11:50:40.716', 2, 85, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (128, '2012-12-26 12:02:36.464', 2, 53, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (130, '2012-12-26 12:03:11.509', 2, 54, 'EMP1', 1, NULL, 'EMP1');
INSERT INTO trazabilidad_permiso VALUES (283, '2013-01-09 08:55:25.778', 2, 99, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (284, '2013-01-09 08:55:25.778', 1, 99, 'EMP5', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (285, '2013-01-09 08:55:25.778', 1, 99, 'EMP6', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (286, '2013-01-09 08:55:25.778', 1, 99, 'CON1', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (289, '2013-01-09 09:02:57.817', 2, 101, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (290, '2013-01-09 09:02:57.817', 1, 101, 'EMP7', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (291, '2013-01-09 09:02:57.817', 1, 101, 'CON2', 1, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (292, '2013-01-09 09:04:35.752', 2, 102, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (294, '2013-01-09 09:05:29.5', 2, 103, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (293, '2013-01-09 11:44:55.87', 2, 102, 'EMP4', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (295, '2013-01-09 15:56:18.206', 2, 103, 'EMP4', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (297, '2013-01-09 15:10:46.836', 2, 102, 'ADMINISTRADORES SEGURIDAD', 2, 'OK', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (193, '2013-01-09 16:27:21.541', 2, 87, 'EMP4', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (194, '2013-01-09 16:27:21.541', 3, 87, 'EMP2', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (298, '2013-01-09 14:31:43.657', 2, 102, 'JEFES DE SECTOR', 2, 'Se direcciona el permiso para que el gerente realice la aprobaciÃ³n.', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (296, '2013-01-09 15:03:42.261', 2, 102, 'ADMINISTRADORES CALIDAD', 2, 'Quiero ver que se haya agregado mi paso.', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (300, '2013-01-09 15:04:17.17', 2, 102, 'JEFSEG', 6, 'Solo por probar', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (301, '2013-01-09 15:07:26.775', 2, 102, 'JEFSEG', 6, 'Prueba de no aprobacion.', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (302, '2013-01-09 15:09:40.097', 2, 102, 'EMP4', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (299, '2013-01-09 15:11:26.513', 2, 102, 'GERENTE', 2, 'ok.', 'GERENTE');
INSERT INTO trazabilidad_permiso VALUES (303, '2013-01-09 15:13:11.668', 2, 102, 'EMP4', 3, 'OK.', 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (304, '2013-01-09 15:13:38.481', 2, 102, 'ADMINISTRADORES CALIDAD', 4, 'OK', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (305, '2013-01-09 15:13:54.565', 2, 102, 'ADMINISTRADORES SEGURIDAD', 4, 'OK', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (306, '2013-01-09 15:14:14.562', 2, 102, 'JEFES DE SECTOR', 4, 'OK.', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (307, '2013-01-09 15:15:11.043', 2, 102, 'ADMIN1', 4, 'OK', 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (308, '2013-01-09 15:23:03.537', 2, 104, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (309, '2013-01-09 15:24:37.579', 2, 104, 'EMP5', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (310, '2013-01-09 15:24:37.579', 3, 104, 'EMP6', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (311, '2013-01-09 15:24:37.579', 3, 104, 'CON1', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (314, '2013-01-09 15:25:42.202', 2, 104, 'JEFES DE SECTOR', 2, 'Se agrego un nuevo paso.', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (312, '2013-01-09 15:26:02.803', 2, 104, 'ADMINISTRADORES CALIDAD', 2, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (313, '2013-01-09 15:26:19.237', 2, 104, 'ADMINISTRADORES SEGURIDAD', 2, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (315, '2013-01-09 15:26:37.286', 2, 104, 'GERENTES', 2, 'ok', 'GERENTE');
INSERT INTO trazabilidad_permiso VALUES (316, '2013-01-09 15:26:55.635', 2, 104, 'EMP5', 3, 'ok', 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (317, '2013-01-09 15:26:55.635', 3, 104, 'EMP6', 3, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (318, '2013-01-09 15:26:55.635', 3, 104, 'CON1', 3, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (321, '2013-01-09 15:27:09.236', 2, 104, 'JEFES DE SECTOR', 4, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (319, '2013-01-09 15:27:32.458', 2, 104, 'ADMINISTRADORES CALIDAD', 4, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (320, '2013-01-09 15:27:47.357', 2, 104, 'ADMINISTRADORES SEGURIDAD', 4, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (322, '2013-01-09 15:27:59.881', 2, 104, 'ADMIN1', 4, 'ok', 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (323, '2013-01-09 15:56:18.237', 1, 103, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (324, '2013-01-09 15:56:18.248', 1, 103, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (325, '2013-01-09 15:56:18.259', 1, 103, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (326, '2013-01-09 16:27:21.588', 1, 87, 'ADMINISTRADORES CALIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (327, '2013-01-09 16:27:21.599', 1, 87, 'ADMINISTRADORES SEGURIDAD', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (328, '2013-01-09 16:27:21.61', 1, 87, 'JEFES DE SECTOR', 2, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (329, '2013-01-09 17:35:52.392', 2, 105, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (331, '2013-01-09 17:38:34.794', 2, 106, 'ADMIN1', 0, NULL, 'ADMIN1');
INSERT INTO trazabilidad_permiso VALUES (330, '2013-01-09 17:39:18.69', 2, 105, 'EMP4', 1, NULL, 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (337, '2013-01-09 17:39:36.618', 2, 105, 'JEFES DE SECTOR', 2, 'ok', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (335, '2013-01-09 17:39:51.932', 2, 105, 'ADMINISTRADORES CALIDAD', 2, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (336, '2013-01-09 17:40:06.622', 2, 105, 'ADMINISTRADORES SEGURIDAD', 2, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (338, '2013-01-09 17:40:20.7', 2, 105, 'EMP4', 3, 'ok', 'EMP4');
INSERT INTO trazabilidad_permiso VALUES (341, '2013-01-09 17:40:31.6', 2, 105, 'JEFES DE SECTOR', 4, '', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (339, '2013-01-09 17:40:42.982', 2, 105, 'ADMINISTRADORES CALIDAD', 4, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (340, '2013-01-09 17:40:53.89', 2, 105, 'ADMINISTRADORES SEGURIDAD', 4, '', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (342, '2013-01-09 17:40:53.926', 1, 105, 'ADMIN1', 4, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (332, '2013-01-16 11:18:06.66', 2, 106, 'EMP5', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (333, '2013-01-16 11:18:06.66', 3, 106, 'EMP6', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (334, '2013-01-16 11:18:06.66', 3, 106, 'CON1', 1, NULL, 'EMP5');
INSERT INTO trazabilidad_permiso VALUES (345, '2013-01-16 11:19:17.882', 2, 106, 'JEFES DE SECTOR', 2, 'OK', 'JEFSEC');
INSERT INTO trazabilidad_permiso VALUES (343, '2013-01-16 11:19:36.601', 2, 106, 'ADMINISTRADORES CALIDAD', 2, 'ok', 'JEFCAL');
INSERT INTO trazabilidad_permiso VALUES (344, '2013-01-16 11:19:55.854', 2, 106, 'ADMINISTRADORES SEGURIDAD', 2, 'ok', 'JEFSEG');
INSERT INTO trazabilidad_permiso VALUES (346, '2013-01-16 11:19:55.9', 1, 106, 'EMP5', 3, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (347, '2013-01-16 11:19:55.909', 1, 106, 'EMP6', 3, NULL, NULL);
INSERT INTO trazabilidad_permiso VALUES (348, '2013-01-16 11:19:55.92', 1, 106, 'CON1', 3, NULL, NULL);


--
-- Data for Name: user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO user_group VALUES (100, 1, 17);
INSERT INTO user_group VALUES (101, 14, 16);
INSERT INTO user_group VALUES (103, 16, 26);
INSERT INTO user_group VALUES (105, 18, 25);
INSERT INTO user_group VALUES (107, 17, 27);
INSERT INTO user_group VALUES (111, 15, 18);
INSERT INTO user_group VALUES (120, 21, 28);
INSERT INTO user_group VALUES (121, 22, 31);
INSERT INTO user_group VALUES (122, 23, 23);
INSERT INTO user_group VALUES (123, 24, 23);
INSERT INTO user_group VALUES (124, 25, 23);
INSERT INTO user_group VALUES (125, 26, 24);
INSERT INTO user_group VALUES (126, 27, 24);
INSERT INTO user_group VALUES (127, 29, 24);
INSERT INTO user_group VALUES (128, 30, 24);
INSERT INTO user_group VALUES (129, 31, 24);
INSERT INTO user_group VALUES (130, 32, 24);
INSERT INTO user_group VALUES (131, 34, 24);
INSERT INTO user_group VALUES (132, 35, 29);
INSERT INTO user_group VALUES (133, 36, 23);
INSERT INTO user_group VALUES (134, 37, 23);
INSERT INTO user_group VALUES (135, 40, 24);
INSERT INTO user_group VALUES (136, 43, 24);
INSERT INTO user_group VALUES (137, 44, 24);
INSERT INTO user_group VALUES (139, 42, 24);
INSERT INTO user_group VALUES (140, 45, 24);
INSERT INTO user_group VALUES (141, 46, 24);
INSERT INTO user_group VALUES (142, 47, 23);
INSERT INTO user_group VALUES (143, 48, 24);
INSERT INTO user_group VALUES (144, 49, 24);
INSERT INTO user_group VALUES (145, 50, 24);
INSERT INTO user_group VALUES (146, 51, 24);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users VALUES (21, 'RECEP', 'a7fd6b064016368ac5b3175abdba4458a0f9ffb4', NULL, NULL, false, 1);
INSERT INTO users VALUES (22, 'GERENTE', '223ef7f245391afcdedaeeb5ea6813521a801ac3', NULL, NULL, false, 1);
INSERT INTO users VALUES (24, 'CON2', '09b490ad14744f5a34dbb1450c2f14d31b9f7f5d', NULL, NULL, false, 1);
INSERT INTO users VALUES (25, 'CON3', 'c87e62d0fceb44420d8b5ac6db983923dded8908', NULL, NULL, false, 1);
INSERT INTO users VALUES (26, 'EMP1', '3470aa75126d0927ff5aa1fdc49a7e83e44c63b4', NULL, NULL, false, 1);
INSERT INTO users VALUES (29, 'EMP3', '78dd22a1a4db5e11280efe4f8e53b741c32ccab1', NULL, NULL, false, 1);
INSERT INTO users VALUES (35, 'INGENIERIA', '3aebcb4f1d30aad7f48dcac76e324fb0457325c1', NULL, NULL, false, 1);
INSERT INTO users VALUES (1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', NULL, NULL, false, 1);
INSERT INTO users VALUES (27, 'EMP2', 'e1fc5313b20c524fcb2ee98226c8b96d3e076417', NULL, NULL, false, 1);
INSERT INTO users VALUES (23, 'CON1', 'dffe7541e021c8ae8212afbe4ec0d3f88853b4d2', 'CON1', 'J', false, 1);
INSERT INTO users VALUES (16, 'JEFCAL', '6c39a58d667a1b780857908e0c4308fd06d55f28', NULL, NULL, false, 1);
INSERT INTO users VALUES (18, 'JEFSEC', '21111827dfb7fadb77670e8ec48b6436250a3d7e', NULL, NULL, false, 1);
INSERT INTO users VALUES (17, 'JEFSEG', '65b4c42c33e2d4ee6dc0ef088115c98a731a4696', NULL, NULL, false, 1);
INSERT INTO users VALUES (15, 'VALIDADOR', 'c9bc9fffc3788bef6062373a4adc5d8e93112872', NULL, NULL, false, 1);
INSERT INTO users VALUES (14, 'ADMIN1', '5b2d560b3f2640cadc2ff50ca64bdd936f77eb2d', NULL, NULL, false, 1);
INSERT INTO users VALUES (36, 'CON5', 'a0ca969db416b3c6469019dacd5026d4329dbeb8', 'CON5', 'con5@viv.com', false, 1);
INSERT INTO users VALUES (37, 'VIVUSR', 'cf457a3fb3159300d2486545600a3ea0c3825dbb', 'VIV TECNOLOGY', 'jerviver21@hotmail.com', false, 1);
INSERT INTO users VALUES (51, 'empviv2', 'f94102585c4f31e42cbd18fe6d686b67d94cd0c8', 'CONT VIVEROS', 'jerviver21@latinmail.com', false, 1);
INSERT INTO users VALUES (49, 'BANVUSR2', 'f94102585c4f31e42cbd18fe6d686b67d94cd0c8', 'INVBAN VIVEROS', 'jerviver21@latianmail.com', false, 1);
INSERT INTO users VALUES (48, 'BANVUSR1', '8095ee69d09e2787c443560959455804afc24d72', 'BANVIV VIVEROS', 'jerviver21@latinmail.com', false, 1);
INSERT INTO users VALUES (50, 'empviv1', '5dd07652a658e3bac72d56ed1d6cab1b4aabd296', 'EMPL VIVEROS', 'jerviver21@latinamil.com', true, 0);
INSERT INTO users VALUES (45, 'zamir1983', '8095ee69d09e2787c443560959455804afc24d72', 'ZAMIR PATINO', 'zamir1983@gmail.com', false, 1);
INSERT INTO users VALUES (46, 'jony', 'fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4', 'JONATAN MUNOZ', 'jony@gmail.com', false, 1);
INSERT INTO users VALUES (40, 'jerviver21', 'fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4', 'JERSON VIVEROS AGUIRRE', 'jerviver21@gmail.com', false, 1);
INSERT INTO users VALUES (44, 'gabriela', 'fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4', 'GABRIELA BEJAR ESQUIVEL', 'bejar.gabriela@gmail.com', false, 1);
INSERT INTO users VALUES (47, 'INVBANVIV', '8095ee69d09e2787c443560959455804afc24d72', 'INVERSIONES BANVIV', 'jerviver21@latinmail.com', false, 1);
INSERT INTO users VALUES (42, 'patricia1990', 'fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4', 'PATRICIA GOMEZ', 'patricia1990@hotmail.com', false, 1);
INSERT INTO users VALUES (31, 'EMP5', 'd39255ce4161832362088a39022dc7567dfdab78', 'JAVIER HERNANDEZ', 'jhernandez@nestle.com', false, 1);
INSERT INTO users VALUES (43, 'ludivia1957', 'fddecb6a9fb5324cab83d2c9d4ec6f3492ee1df4', 'LUDIVIA AGUIRRE QUINTERO', 'ludivia.aguirre@gmail.com', false, 0);
INSERT INTO users VALUES (30, 'EMP4', '8db28af088158c7a89fb78d76f0039f24be7988b', NULL, NULL, false, 1);
INSERT INTO users VALUES (34, 'EMP7', '82faa47bfdfff09e4a4dd24b3da053ed79b794cf', NULL, NULL, false, 1);
INSERT INTO users VALUES (32, 'EMP6', 'cf18d0f1d11878086a64aeec5ea68e28560e9c1e', NULL, NULL, false, 1);


--
-- Data for Name: validaciones_formulario; Type: TABLE DATA; Schema: public; Owner: postgres
--



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

