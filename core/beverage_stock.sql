--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-05 19:29:04

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
-- TOC entry 216 (class 1259 OID 16465)
-- Name: beverage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beverage (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    price double precision NOT NULL,
    picture character varying(200) NOT NULL,
    qtd integer NOT NULL,
    category character varying(30) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.beverage OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16464)
-- Name: beverage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beverage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beverage_id_seq OWNER TO postgres;

--
-- TOC entry 4794 (class 0 OID 0)
-- Dependencies: 215
-- Name: beverage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.beverage_id_seq OWNED BY public.beverage.id;


--
-- TOC entry 218 (class 1259 OID 16471)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(15) NOT NULL,
    password character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16470)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 4795 (class 0 OID 0)
-- Dependencies: 217
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 4639 (class 2604 OID 16468)
-- Name: beverage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverage ALTER COLUMN id SET DEFAULT nextval('public.beverage_id_seq'::regclass);


--
-- TOC entry 4641 (class 2604 OID 16474)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 4643 (class 2606 OID 16476)
-- Name: beverage beverage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverage
    ADD CONSTRAINT beverage_pkey PRIMARY KEY (id);


--
-- TOC entry 4645 (class 2606 OID 16478)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


-- Completed on 2024-01-05 19:29:04

--
-- PostgreSQL database dump complete
--

