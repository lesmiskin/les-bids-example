--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.0

-- Started on 2023-11-28 19:28:29

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
-- TOC entry 3362 (class 1262 OID 16388)
-- Name: bid-db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "bid-db" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "bid-db" OWNER TO postgres;

\connect -reuse-previous=on "dbname='bid-db'"

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16396)
-- Name: auctions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auctions (
    id integer NOT NULL,
    description text,
    start_price numeric,
    reserve_price numeric,
    image text
);


ALTER TABLE public.auctions OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16389)
-- Name: bids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bids (
    id integer NOT NULL,
    amount numeric,
    auction_id integer
);


ALTER TABLE public.bids OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 16396)
-- Dependencies: 216
-- Data for Name: auctions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auctions (id, description, start_price, reserve_price, image) VALUES (1, 'Quake III Arena', 500, 750, 'https://upload.wikimedia.org/wikipedia/en/a/a1/Quake3Title.jpg');
INSERT INTO public.auctions (id, description, start_price, reserve_price, image) VALUES (2, 'Unreal Tournament', 100, 200.25, 'https://upload.wikimedia.org/wikipedia/en/thumb/f/f4/Unrealtournament.jpg/220px-Unrealtournament.jpg');


--
-- TOC entry 3355 (class 0 OID 16389)
-- Dependencies: 215
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.bids (id, amount, auction_id) VALUES (1, 650, 1);
INSERT INTO public.bids (id, amount, auction_id) VALUES (2, 1000, 2);
INSERT INTO public.bids (id, amount, auction_id) VALUES (3, 1025, 2);


--
-- TOC entry 3210 (class 2606 OID 16402)
-- Name: auctions auctions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auctions
    ADD CONSTRAINT auctions_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 16395)
-- Name: bids bids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 1259 OID 16408)
-- Name: fki_auctions_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_auctions_fkey ON public.bids USING btree (auction_id);


--
-- TOC entry 3211 (class 2606 OID 16403)
-- Name: bids auctions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT auctions_fkey FOREIGN KEY (auction_id) REFERENCES public.auctions(id) NOT VALID;


-- Completed on 2023-11-28 19:28:29

--
-- PostgreSQL database dump complete
--

