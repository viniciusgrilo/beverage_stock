--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-01-04 14:03:43

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
-- TOC entry 4792 (class 1262 OID 16400)
-- Name: beverage_stock; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE beverage_stock WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE beverage_stock OWNER TO postgres;

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
-- TOC entry 215 (class 1259 OID 16401)
-- Name: beverage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beverage (
    id SERIAL,
    name character varying(30) NOT NULL,
    price double precision NOT NULL,
    picture character varying(200) NOT NULL,
    qtd integer NOT NULL,
    category character varying(30) NOT NULL,
    is_active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.beverage OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16406)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id SERIAL,
    username character varying(15) NOT NULL,
    password character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    is_staff boolean NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 4785 (class 0 OID 16401)
-- Dependencies: 215
-- Data for Name: beverage; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beverage VALUES (DEFAULT,'Conhaque Presidente', 10, '-', 9, 'Destilado', true);
INSERT INTO public.beverage VALUES (DEFAULT,'Skol', 2.99, '-', 86, 'Cerveja', true);
INSERT INTO public.beverage VALUES (DEFAULT,'Tial Maracujá', 5.99, '-', 54, 'Suco', true);


--
-- TOC entry 4786 (class 0 OID 16406)
-- Dependencies: 216
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES (DEFAULT,'grilo', '1234', true, true);
INSERT INTO public."user" VALUES (DEFAULT,'Roberto', '12345', true, false);


--
-- TOC entry 4639 (class 2606 OID 16405)
-- Name: beverage beverage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beverage
    ADD CONSTRAINT beverage_pkey PRIMARY KEY (id);


--
-- TOC entry 4641 (class 2606 OID 16410)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


-- Completed on 2024-01-04 14:03:43

--
-- PostgreSQL database dump complete
--

