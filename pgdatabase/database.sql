--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2 (Debian 12.2-2.pgdg100+1)
-- Dumped by pg_dump version 12.2 (Debian 12.2-2.pgdg100+1)

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
-- Name: adresy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adresy (
    adres_id integer NOT NULL,
    adres_ulica character varying(100) NOT NULL,
    adres_nr_domu integer NOT NULL,
    adres_kod_poczt character varying(6) NOT NULL,
    adres_miasto character varying(50) NOT NULL
);


ALTER TABLE public.adresy OWNER TO postgres;

--
-- Name: adresy_adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adresy_adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.adresy_adres_id_seq OWNER TO postgres;

--
-- Name: adresy_adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adresy_adres_id_seq OWNED BY public.adresy.adres_id;


--
-- Name: goscie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goscie (
    gosc_id integer NOT NULL,
    adres_id integer NOT NULL,
    gosc_imie character varying(20) NOT NULL,
    gosc_nazwisko character varying(40) NOT NULL,
    gosc_tel character varying(20) NOT NULL,
    gosc_karta_kred character varying(19) NOT NULL
);


ALTER TABLE public.goscie OWNER TO postgres;

--
-- Name: goscie_adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goscie_adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goscie_adres_id_seq OWNER TO postgres;

--
-- Name: goscie_adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goscie_adres_id_seq OWNED BY public.goscie.adres_id;


--
-- Name: goscie_gosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goscie_gosc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goscie_gosc_id_seq OWNER TO postgres;

--
-- Name: goscie_gosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goscie_gosc_id_seq OWNED BY public.goscie.gosc_id;


--
-- Name: hotele; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotele (
    hotel_id integer NOT NULL,
    adres_id integer NOT NULL,
    ocena_id integer,
    hotel_nazwa character varying(100) NOT NULL,
    hotel_tel character varying(20) NOT NULL,
    hotel_ilosc_pieter integer NOT NULL,
    hotel_ilosc_pokoi integer NOT NULL,
    hotel_czas_zameld character varying(11) NOT NULL,
    hotel_czas_wymeld character varying(11) NOT NULL
);


ALTER TABLE public.hotele OWNER TO postgres;

--
-- Name: hotele_adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotele_adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotele_adres_id_seq OWNER TO postgres;

--
-- Name: hotele_adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotele_adres_id_seq OWNED BY public.hotele.adres_id;


--
-- Name: hotele_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotele_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotele_hotel_id_seq OWNER TO postgres;

--
-- Name: hotele_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotele_hotel_id_seq OWNED BY public.hotele.hotel_id;


--
-- Name: hotele_ocena_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotele_ocena_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotele_ocena_id_seq OWNER TO postgres;

--
-- Name: hotele_ocena_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotele_ocena_id_seq OWNED BY public.hotele.ocena_id;


--
-- Name: ocena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ocena (
    ocena_id integer NOT NULL,
    ocena_wartosc character varying(10) NOT NULL
);


ALTER TABLE public.ocena OWNER TO postgres;

--
-- Name: ocena_ocena_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ocena_ocena_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ocena_ocena_id_seq OWNER TO postgres;

--
-- Name: ocena_ocena_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ocena_ocena_id_seq OWNED BY public.ocena.ocena_id;


--
-- Name: pokoje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokoje (
    pok_id integer NOT NULL,
    hotel_id integer NOT NULL,
    typ_pok_id integer NOT NULL,
    pok_nr integer NOT NULL
);


ALTER TABLE public.pokoje OWNER TO postgres;

--
-- Name: pokoje_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokoje_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokoje_hotel_id_seq OWNER TO postgres;

--
-- Name: pokoje_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokoje_hotel_id_seq OWNED BY public.pokoje.hotel_id;


--
-- Name: pokoje_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokoje_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokoje_pok_id_seq OWNER TO postgres;

--
-- Name: pokoje_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokoje_pok_id_seq OWNED BY public.pokoje.pok_id;


--
-- Name: pokoje_typ_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokoje_typ_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pokoje_typ_pok_id_seq OWNER TO postgres;

--
-- Name: pokoje_typ_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokoje_typ_pok_id_seq OWNED BY public.pokoje.typ_pok_id;


--
-- Name: pracownicy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pracownicy (
    prac_id integer NOT NULL,
    stan_id integer NOT NULL,
    adres_id integer NOT NULL,
    hotel_id integer NOT NULL,
    prac_imie character varying(20) NOT NULL,
    prac_nazwisko character varying(40) NOT NULL,
    prac_tel character varying(20) NOT NULL
);


ALTER TABLE public.pracownicy OWNER TO postgres;

--
-- Name: pracownicy_adres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pracownicy_adres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pracownicy_adres_id_seq OWNER TO postgres;

--
-- Name: pracownicy_adres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pracownicy_adres_id_seq OWNED BY public.pracownicy.adres_id;


--
-- Name: pracownicy_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pracownicy_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pracownicy_hotel_id_seq OWNER TO postgres;

--
-- Name: pracownicy_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pracownicy_hotel_id_seq OWNED BY public.pracownicy.hotel_id;


--
-- Name: pracownicy_prac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pracownicy_prac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pracownicy_prac_id_seq OWNER TO postgres;

--
-- Name: pracownicy_prac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pracownicy_prac_id_seq OWNED BY public.pracownicy.prac_id;


--
-- Name: pracownicy_stan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pracownicy_stan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pracownicy_stan_id_seq OWNER TO postgres;

--
-- Name: pracownicy_stan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pracownicy_stan_id_seq OWNED BY public.pracownicy.stan_id;


--
-- Name: rezerwacje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rezerwacje (
    rez_id integer NOT NULL,
    hotel_id integer NOT NULL,
    gosc_id integer NOT NULL,
    prac_id integer NOT NULL,
    rez_data date NOT NULL,
    rez_zameld date NOT NULL,
    rez_wymeld date NOT NULL,
    rez_typ_platnosci character varying(20) NOT NULL,
    rez_koszt real NOT NULL
);


ALTER TABLE public.rezerwacje OWNER TO postgres;

--
-- Name: rezerwacje_gosc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_gosc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_gosc_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_gosc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_gosc_id_seq OWNED BY public.rezerwacje.gosc_id;


--
-- Name: rezerwacje_hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_hotel_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_hotel_id_seq OWNED BY public.rezerwacje.hotel_id;


--
-- Name: rezerwacje_pokoi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rezerwacje_pokoi (
    pok_rez_id integer NOT NULL,
    pok_id integer NOT NULL,
    rez_id integer NOT NULL
);


ALTER TABLE public.rezerwacje_pokoi OWNER TO postgres;

--
-- Name: rezerwacje_pokoi_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_pokoi_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_pokoi_pok_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_pokoi_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_pokoi_pok_id_seq OWNED BY public.rezerwacje_pokoi.pok_id;


--
-- Name: rezerwacje_pokoi_pok_rez_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_pokoi_pok_rez_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_pokoi_pok_rez_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_pokoi_pok_rez_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_pokoi_pok_rez_id_seq OWNED BY public.rezerwacje_pokoi.pok_rez_id;


--
-- Name: rezerwacje_pokoi_rez_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_pokoi_rez_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_pokoi_rez_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_pokoi_rez_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_pokoi_rez_id_seq OWNED BY public.rezerwacje_pokoi.rez_id;


--
-- Name: rezerwacje_prac_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_prac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_prac_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_prac_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_prac_id_seq OWNED BY public.rezerwacje.prac_id;


--
-- Name: rezerwacje_rez_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rezerwacje_rez_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rezerwacje_rez_id_seq OWNER TO postgres;

--
-- Name: rezerwacje_rez_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rezerwacje_rez_id_seq OWNED BY public.rezerwacje.rez_id;


--
-- Name: stanowisko; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stanowisko (
    stan_id integer NOT NULL,
    stan_nazwa character varying(20) NOT NULL,
    stan_opis character varying(50) NOT NULL
);


ALTER TABLE public.stanowisko OWNER TO postgres;

--
-- Name: stanowisko_stan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stanowisko_stan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stanowisko_stan_id_seq OWNER TO postgres;

--
-- Name: stanowisko_stan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stanowisko_stan_id_seq OWNED BY public.stanowisko.stan_id;


--
-- Name: uslugi_hotelowe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uslugi_hotelowe (
    uslug_id numeric NOT NULL,
    uslug_nazwa character varying(50) NOT NULL,
    uslug_koszt real NOT NULL
);


ALTER TABLE public.uslugi_hotelowe OWNER TO postgres;

--
-- Name: uzyte_uslugi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uzyte_uslugi (
    uzyt_id integer NOT NULL,
    uslug_id integer NOT NULL,
    rez_id integer NOT NULL
);


ALTER TABLE public.uzyte_uslugi OWNER TO postgres;

--
-- Name: trans; Type: MATERIALIZED VIEW; Schema: public; Owner: postgres
--

CREATE MATERIALIZED VIEW public.trans AS
 SELECT uu.rez_id,
    uh.uslug_nazwa
   FROM (((public.uslugi_hotelowe uh
     JOIN public.uzyte_uslugi uu ON ((uh.uslug_id = (uu.uslug_id)::numeric)))
     JOIN public.rezerwacje r ON ((uu.rez_id = r.rez_id)))
     JOIN public.goscie g ON ((r.gosc_id = g.gosc_id)))
  GROUP BY uh.uslug_nazwa, uu.rez_id
  ORDER BY uu.rez_id
  WITH NO DATA;


ALTER TABLE public.trans OWNER TO postgres;

--
-- Name: typ_pokoju; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.typ_pokoju (
    typ_pok_id integer NOT NULL,
    typ_pok_nazwa character varying(50) NOT NULL,
    typ_pok_koszt real NOT NULL,
    typ_pok_opis character varying(100) NOT NULL,
    typ_pok_palenie boolean NOT NULL,
    typ_pok_zwierzeta boolean NOT NULL
);


ALTER TABLE public.typ_pokoju OWNER TO postgres;

--
-- Name: typ_pokoju_typ_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.typ_pokoju_typ_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.typ_pokoju_typ_pok_id_seq OWNER TO postgres;

--
-- Name: typ_pokoju_typ_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.typ_pokoju_typ_pok_id_seq OWNED BY public.typ_pokoju.typ_pok_id;


--
-- Name: uslugi_hotelowe_uslug_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uslugi_hotelowe_uslug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uslugi_hotelowe_uslug_id_seq OWNER TO postgres;

--
-- Name: uslugi_hotelowe_uslug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uslugi_hotelowe_uslug_id_seq OWNED BY public.uslugi_hotelowe.uslug_id;


--
-- Name: uzyte_uslugi_rez_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uzyte_uslugi_rez_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzyte_uslugi_rez_id_seq OWNER TO postgres;

--
-- Name: uzyte_uslugi_rez_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uzyte_uslugi_rez_id_seq OWNED BY public.uzyte_uslugi.rez_id;


--
-- Name: uzyte_uslugi_uslug_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uzyte_uslugi_uslug_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzyte_uslugi_uslug_id_seq OWNER TO postgres;

--
-- Name: uzyte_uslugi_uslug_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uzyte_uslugi_uslug_id_seq OWNED BY public.uzyte_uslugi.uslug_id;


--
-- Name: uzyte_uslugi_uzyt_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uzyte_uslugi_uzyt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.uzyte_uslugi_uzyt_id_seq OWNER TO postgres;

--
-- Name: uzyte_uslugi_uzyt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uzyte_uslugi_uzyt_id_seq OWNED BY public.uzyte_uslugi.uzyt_id;


--
-- Name: znizka_pokoju; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.znizka_pokoju (
    znizka_pok_id integer NOT NULL,
    typ_pok_id integer NOT NULL,
    znizka_pok_ilosc real NOT NULL
);


ALTER TABLE public.znizka_pokoju OWNER TO postgres;

--
-- Name: znizka_pokoju_typ_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.znizka_pokoju_typ_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.znizka_pokoju_typ_pok_id_seq OWNER TO postgres;

--
-- Name: znizka_pokoju_typ_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.znizka_pokoju_typ_pok_id_seq OWNED BY public.znizka_pokoju.typ_pok_id;


--
-- Name: znizka_pokoju_znizka_pok_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.znizka_pokoju_znizka_pok_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.znizka_pokoju_znizka_pok_id_seq OWNER TO postgres;

--
-- Name: znizka_pokoju_znizka_pok_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.znizka_pokoju_znizka_pok_id_seq OWNED BY public.znizka_pokoju.znizka_pok_id;


--
-- Name: adresy adres_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresy ALTER COLUMN adres_id SET DEFAULT nextval('public.adresy_adres_id_seq'::regclass);


--
-- Name: goscie gosc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goscie ALTER COLUMN gosc_id SET DEFAULT nextval('public.goscie_gosc_id_seq'::regclass);


--
-- Name: goscie adres_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goscie ALTER COLUMN adres_id SET DEFAULT nextval('public.goscie_adres_id_seq'::regclass);


--
-- Name: hotele hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele ALTER COLUMN hotel_id SET DEFAULT nextval('public.hotele_hotel_id_seq'::regclass);


--
-- Name: hotele adres_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele ALTER COLUMN adres_id SET DEFAULT nextval('public.hotele_adres_id_seq'::regclass);


--
-- Name: hotele ocena_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele ALTER COLUMN ocena_id SET DEFAULT nextval('public.hotele_ocena_id_seq'::regclass);


--
-- Name: ocena ocena_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocena ALTER COLUMN ocena_id SET DEFAULT nextval('public.ocena_ocena_id_seq'::regclass);


--
-- Name: pokoje pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje ALTER COLUMN pok_id SET DEFAULT nextval('public.pokoje_pok_id_seq'::regclass);


--
-- Name: pokoje hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje ALTER COLUMN hotel_id SET DEFAULT nextval('public.pokoje_hotel_id_seq'::regclass);


--
-- Name: pokoje typ_pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje ALTER COLUMN typ_pok_id SET DEFAULT nextval('public.pokoje_typ_pok_id_seq'::regclass);


--
-- Name: pracownicy prac_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy ALTER COLUMN prac_id SET DEFAULT nextval('public.pracownicy_prac_id_seq'::regclass);


--
-- Name: pracownicy stan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy ALTER COLUMN stan_id SET DEFAULT nextval('public.pracownicy_stan_id_seq'::regclass);


--
-- Name: pracownicy adres_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy ALTER COLUMN adres_id SET DEFAULT nextval('public.pracownicy_adres_id_seq'::regclass);


--
-- Name: pracownicy hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy ALTER COLUMN hotel_id SET DEFAULT nextval('public.pracownicy_hotel_id_seq'::regclass);


--
-- Name: rezerwacje rez_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje ALTER COLUMN rez_id SET DEFAULT nextval('public.rezerwacje_rez_id_seq'::regclass);


--
-- Name: rezerwacje hotel_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje ALTER COLUMN hotel_id SET DEFAULT nextval('public.rezerwacje_hotel_id_seq'::regclass);


--
-- Name: rezerwacje gosc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje ALTER COLUMN gosc_id SET DEFAULT nextval('public.rezerwacje_gosc_id_seq'::regclass);


--
-- Name: rezerwacje prac_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje ALTER COLUMN prac_id SET DEFAULT nextval('public.rezerwacje_prac_id_seq'::regclass);


--
-- Name: rezerwacje_pokoi pok_rez_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi ALTER COLUMN pok_rez_id SET DEFAULT nextval('public.rezerwacje_pokoi_pok_rez_id_seq'::regclass);


--
-- Name: rezerwacje_pokoi pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi ALTER COLUMN pok_id SET DEFAULT nextval('public.rezerwacje_pokoi_pok_id_seq'::regclass);


--
-- Name: rezerwacje_pokoi rez_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi ALTER COLUMN rez_id SET DEFAULT nextval('public.rezerwacje_pokoi_rez_id_seq'::regclass);


--
-- Name: stanowisko stan_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanowisko ALTER COLUMN stan_id SET DEFAULT nextval('public.stanowisko_stan_id_seq'::regclass);


--
-- Name: typ_pokoju typ_pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typ_pokoju ALTER COLUMN typ_pok_id SET DEFAULT nextval('public.typ_pokoju_typ_pok_id_seq'::regclass);


--
-- Name: uslugi_hotelowe uslug_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi_hotelowe ALTER COLUMN uslug_id SET DEFAULT nextval('public.uslugi_hotelowe_uslug_id_seq'::regclass);


--
-- Name: uzyte_uslugi uzyt_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi ALTER COLUMN uzyt_id SET DEFAULT nextval('public.uzyte_uslugi_uzyt_id_seq'::regclass);


--
-- Name: uzyte_uslugi uslug_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi ALTER COLUMN uslug_id SET DEFAULT nextval('public.uzyte_uslugi_uslug_id_seq'::regclass);


--
-- Name: uzyte_uslugi rez_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi ALTER COLUMN rez_id SET DEFAULT nextval('public.uzyte_uslugi_rez_id_seq'::regclass);


--
-- Name: znizka_pokoju znizka_pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizka_pokoju ALTER COLUMN znizka_pok_id SET DEFAULT nextval('public.znizka_pokoju_znizka_pok_id_seq'::regclass);


--
-- Name: znizka_pokoju typ_pok_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizka_pokoju ALTER COLUMN typ_pok_id SET DEFAULT nextval('public.znizka_pokoju_typ_pok_id_seq'::regclass);


--
-- Data for Name: adresy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adresy (adres_id, adres_ulica, adres_nr_domu, adres_kod_poczt, adres_miasto) FROM stdin;
1	aleja Józefa Piłsudskiego	44	35-001	Rzeszów
2	Floriańska	28	31-021	Kraków
3	Powstańców Warszawy	10	81-718	Sopot
4	aleje Jerozolimskie	65	00-697	Warszawa
5	plac Niepodległośc	7	34-500	Zakopane
6	Żwirowa	37	35-230	Rzeszów
7	Kurpiowska	69	35-620	Rzeszów
8	Bohaterów	126	35-124	Rzeszów
9	Nadbrzeżna	131	35-321	Rzeszów
10	Tulipanowa	117	35-604	Rzeszów
11	Arciszewskiego Tomasza	125	30-138	Kraków
12	Sereno Fenn`a	147	31-143	Kraków
13	Aleja Adama Mickiewicza	33	31-120	Kraków
14	Szparagowa	108	30-739	Kraków
15	Goplana	134	30-411	Kraków
16	3 Maja	65	81-728	Sopot
17	Książąt Pomorskich	1	81-773	Sopot
18	Leśna Polana	51	81-875	Sopot
19	Króla Jana Kazimierza	118	81-742	Sopot
20	Księżycowa	95	81-821	Sopot
21	Widokowa	50	01-941	Warszawa
22	Lubuska	59	04-898	Warszawa
23	Żelazna	143	00-806	Warszawa
24	Canaletta	74	01-664	Warszawa
25	Kajetańska	96	00-099	Warszawa
26	Lipkowska	46	02-495	Warszawa
27	Zakroczymska	116	04-805	Warszawa
28	Puławska	118	00-225	Warszawa
29	Księżycowa	79	02-508	Warszawa
30	Grabowskiego Antoniego	107	00-519	Warszawa
31	Krupówki	20	34-500	Zakopane
32	Krupówki	145	34-500	Zakopane
33	Skibówki	65	34-505	Zakopane
34	Krupówki	49	34-500	Zakopane
35	Chramcówki	141	34-503	Zakopane
36	Kotsisa Aleksandra	211	52-506	Chodzież
37	Drewlańska	623	41-140	Stąporków
38	Owidiusza	622	71-821	Ciechocinek
39	Lipnicka	1304	26-194	Gorzów Śląski
40	Zamojska	470	59-695	Polanica-Zdrój
41	Podgórski Rynek	540	40-256	Niemcza
42	Jurajska	897	09-847	Skoczów
43	Ehrenberga Gustawa	354	13-070	Bydgoszcz
44	Jana Kazimierza	65	41-533	Środa Wielkopolska
45	Mgielna	742	59-002	Bychawa
46	Baziaka Eugeniusza	1372	44-446	Modliborzyce
47	Pasłęcka	946	84-443	Lipsk
48	Koszykarska	1306	83-416	Biała
49	Błotna	1001	81-442	Cybinka
50	Laudańska	64	18-641	Siemiatycze
51	Knolla-Kownackiego Edmunda	332	83-770	Lubraniec
52	Skalna	31	47-434	Głogówek
53	Staffa Leopolda	766	46-345	Jutrosin
54	Rodła Bulw.	1167	57-764	Lubawka
55	Podole	597	40-191	Pyskowice
56	Pod Sikornikiem	365	37-981	Płock
57	Stokrotek	402	37-663	Okonek
58	Górnicza	100	45-071	Pruszków
59	Zagórowska	620	86-401	Kartuzy
60	Mirowska	1388	30-724	Pasym
61	Szelągowska	1182	00-044	Kościerzyna
62	Ciasna	1255	88-104	Golczewo
63	Kazimierza Waltera	135	28-473	Pruszków
64	Pruska	841	64-589	Małomice
65	Czekoladowa	453	03-104	Iwonicz-Zdrój
66	Cedrowa	745	89-154	Miłakowo
67	Pokutyńskiego Filipa	785	88-783	Czerniejewo
68	Jana Heweliusza	1162	94-215	Libiąż
69	Stroma	52	04-324	Maków Podhalański
70	Gadomskiego Walerego	1062	34-367	Kędzierzyn-Koźle
71	Zgody	256	97-077	Kazimierz Dolny
72	Suwalska	1320	84-445	Kłecko
73	Podedworze	1278	65-664	Kobylin
74	Jeziorko	1330	93-865	Poniec
75	Michałowo	164	22-446	Wysokie Mazowieckie
76	Działowa	1369	72-640	Świebodzin
77	Wrobela Feliksa	75	77-271	Radzionków
78	Granitowa	214	28-403	Golub-Dobrzyń
79	Ziarkowa	195	81-694	Wielichowo
80	Kaplickiego Mieczysława	1400	90-360	Miłosław
81	Starowiejska	456	54-951	Dolsk
82	Madalińskiego Antoniego Józefa	390	51-146	Żarki
83	Wykopy	857	86-805	Brańsk
84	Pychowicka	982	39-667	Dębno
85	Baśniowa	1244	81-800	Wolbrom
86	Knolla-Kownackiego Edmunda	768	44-658	Konstantynów Łódzki
87	Nowohucka	772	06-681	Górowo Iławeckie
88	Myśliborska	635	44-186	Torzym
89	Spadochronowa	35	75-079	Pakość
90	Koronkarska	251	68-215	Sejny
91	Bulwarowa	941	74-088	Annopol
92	Kluczborska	1024	68-113	Sośnicowice
93	Wańkowicza Melchiora	39	47-970	Mielec
94	Tomkowicza Stanisława	797	26-195	Międzyrzecz
95	Balickiego Stanisława	1026	68-411	Miejska Górka
96	Basztowa	226	81-141	Tuczno
97	Semperitowców	471	18-216	Radzymin
98	Bolesława Śmiałego	1006	55-160	Opole Lubelskie
99	Przełajowa	298	10-367	Kalisz
100	Jastrzębia	1359	85-172	Suchań
101	Świętego Marka	999	54-028	Kłodzko
102	Górnickiego Łukasza	63	76-425	Słupca
103	Kazimierza Wielkiego	426	99-175	Sława
104	Zmartwychwstańców	362	48-490	Barlinek
105	Koźlarska	1236	98-298	Drezdenko
106	Stwosza Wita	1134	60-527	Brześć Kujawski
107	Na Zjeździe	197	98-042	Warszawa
108	Malwowa	1090	32-492	Biskupiec
109	Ukryta	1197	17-216	Koniecpol
110	Promienista	137	62-034	Pruszków
111	Glinik	615	35-366	Działoszyce
112	Wachholza Leona	380	27-980	Andrychów
113	Pobielska	1048	04-335	Koronowo
114	Pionierów	771	39-152	Ścinawa
115	Mateckiego Teofila	1177	51-719	Tyszowce
116	Włodarska	1011	59-649	Dukla
117	Makowa	329	22-172	Wyszków
118	Pankiewicza Józefa	1084	86-143	Drezdenko
119	Krygowskiego Władysława	1143	02-090	Praszka
120	Przełęcz	607	18-753	Malbork
121	Sianowska	650	00-448	Legionowo
122	Raka	1241	49-073	Puck
123	Będzińska	997	37-115	Jastarnia
124	Na Pokusie	1361	32-361	Moryń
125	Rogozińskiego Stefana	77	05-437	Piastów
126	Jana Pawła II	29	84-069	Lubin
127	Jaśminowa	876	78-459	Świnoujście
128	Wojnowicka	358	62-714	Myślibórz
129	Turonia	59	86-463	Rumia
130	Nadolnik	845	72-322	Ciechocinek
131	Kotsisa Aleksandra	443	05-415	Złocieniec
132	Ptaszyckiego Tadeusza	614	94-375	Trzcianka
133	Rozdroże	754	91-163	Hajnówka
134	Mogilska	662	30-519	Kościerzyna
135	Budryka Witolda	1263	85-616	Bochnia
136	Kulinowskiej Zofii	550	34-417	Murowana Goślina
137	Imbramowska	440	14-197	Łapy
138	Witkiewicza Stanisława Ignacego	1123	22-327	Jabłonowo Pomorskie
139	Dzierżonia Jana	348	94-125	Gostyń
140	Dymarek	35	55-970	Wschowa
141	Darasza Wojciecha	1348	72-610	Łazy
142	Garczyńskiego Stefana	889	72-225	Skórcz
143	Agatowa	998	50-026	Zamość
144	Braterstwa Broni	37	89-191	Sępopol
145	Okulickiego Leopolda	443	77-432	Łochów
146	Karpacka	42	48-770	Katowice
147	Kotsisa Aleksandra	435	28-105	Sieniawa
148	Brodatego Henryka	20	03-405	Łomża
149	Natansona Władysława	1153	63-728	Błażowa
150	Człopska	317	90-854	Szczyrk
151	Zaporoska	318	14-717	Błażowa
152	Hiacyntowa	1343	84-510	Nowy Wiśnicz
153	Astronautów	439	84-713	Węgrów
154	Gdowska	1006	70-498	Jabłonowo Pomorskie
155	Templińska	867	15-413	Lędziny
156	Akacjowa	623	79-457	Kościan
157	Cetniewska	155	40-755	Jedwabne
158	Malczewskiego Jacka	1317	47-338	Mysłowice
159	Królowej Jadwigi Boczna	467	17-581	Częstochowa
160	Bogusza Józefa	205	95-064	Czchów
161	Żołnierska	833	19-776	Witnica
162	Gąsiorowskiego Wacława	955	53-998	Żukowo
163	Parandowskiego Jana	850	92-191	Dzierżoniów
164	Promienna	476	99-762	Kępice
165	Pagórkowa	512	46-025	Drohiczyn
166	Wirska	365	93-018	Siemianowice Śląskie
167	Żółwia	385	44-773	Skępe
168	Fabryczna	884	26-591	Bochnia
169	Czapskich	1026	64-851	Mszana Dolna
170	Janowa Wola	577	65-746	Karpacz
171	Gorczycowa	1302	47-612	Barlinek
172	Sasankowa	1363	74-897	Oława
173	Rycerska	1308	69-992	Sulechów
174	Podłącze	166	91-113	Sędziszów
175	Glinno	316	62-722	Tuchola
176	Uboczna	953	77-675	Zakliczyn
177	Rozrywka	431	52-780	Kolonowskie
178	Peipera Tadeusza	1006	65-504	Aleksandrów Kujawski
179	Płaska	782	41-056	Świdwin
180	Podbiałowa	10	77-016	Skała
181	Mościckiego Ignacego	1325	54-360	Złoczew
182	Loretańska	267	41-379	Biała Podlaska
183	Obrońców Krzyża	472	79-309	Radzyń Chełmiński
184	Harcerska	1147	82-865	Rakoniewice
185	Rudzicka	558	61-476	Rymanów
186	Kącik	294	33-848	Wolbórz
187	Białobrzeska	521	16-537	Aleksandrów Kujawski
188	Mandarynkowa	287	03-006	Częstochowa
189	Aragońska	1077	70-593	Miłosław
190	Fałęcka	148	95-944	Brzeziny
191	Nadolnik	324	07-694	Biecz
192	Weigla Ferdynanda	1008	43-653	Recz
193	Dzierżonia Jana	180	82-531	Dzierżoniów
194	Dereniowa	875	91-273	Wadowice
195	Sołtysia	1137	99-823	Sucha Beskidzka
196	Falowa	572	00-719	Zagórów
197	Granatowa	566	91-317	Solec Kujawski
198	Dolna Wilda	1012	49-675	Małomice
199	Glebowa	695	41-971	Brzeg
200	Przystań	538	93-859	Lędziny
201	Słomiana	673	61-993	Czempiń
202	Przybosia Juliana	943	07-922	Bytom
203	Bacewicz Grażyny	976	71-917	Raszków
204	Świętego Floriana	173	07-507	Pisz
205	Śmiełowska	971	62-162	Pilawa
206	Za Lipkami	186	74-939	Łuków
207	Rojna	840	74-978	Mosina
208	Ballenstedta Lucjana	913	81-988	Biłgoraj
209	Galaktyczna	399	17-678	Drzewica
210	Żaków Krakowskich	737	84-934	Głuchołazy
211	Betonowa	738	74-389	Gniezno
212	Małeckiego Antoniego	1069	23-063	Radzymin
213	Drożyna	1272	32-537	Warsaw
214	Reja Mikołaja	82	40-632	Nasielsk
215	Murawa	180	56-559	Trzciel
216	Łuszczkiewicza Władysława	468	87-120	Brusy
217	Błońska	318	05-421	Wiązów
218	Skarżyńskiego Stanisława	565	13-403	Ślesin
219	Piłsudskiego Józefa Kopiec	653	33-328	Szadek
220	Regionalna	1098	96-900	Lipno
221	Chorzowska	508	43-596	Wyszogród
222	Magnoliowa	460	31-098	Błaszki
223	Ludygi-Laskowskiego Jana	255	82-205	Tuchola
224	Piaskowa	516	04-245	Oświęcim
225	Obrońców Modlina	178	44-935	Międzyrzecz
226	Śródecki Rynek	532	78-420	Nowogard
227	Potoczek	1224	28-403	Rydzyna
228	Ossowskiego Michała	1031	17-512	Mielec
229	Juranda Ze Spychowa	1171	65-684	Brześć Kujawski
230	Barwinkowa	12	08-179	Strzelno
231	Cesarza Benedykta	1123	16-852	Gozdnica
232	Owcza	884	89-832	Krosno Odrzańskie
233	Kątowa	202	10-723	Kowal
234	Warzywna	567	35-266	Ruciane-Nida
235	Bartnicza	64	45-322	Stawiszyn
236	Pastelowa	405	79-475	Blachownia
237	Mydlarska	768	96-931	Wieluń
238	Świętej Marii Magdaleny	379	05-147	Rzgów
239	Bronowicka	1013	04-272	Namysłów
240	Jaracza Stefana	792	00-766	Czersk
241	Zdrowa	385	86-913	Stęszew
242	Kórnicka	928	48-734	Marki
243	Bakałarzy	831	62-605	Sopot
244	Okulickiego Leopolda	227	01-296	Leszno
245	Puszczyków	1390	49-119	Świdwin
246	Ochlewskiego Tadeusza	1116	37-694	Łeba
247	Daniłowskiego Gustawa	768	80-701	Gniewkowo
248	Kochmańskiego Tadeusza	792	22-985	Tomaszów Lubelski
249	Kozienicka	184	73-142	Annopol
250	Filtrowa	1265	74-592	Piastów
251	Eisenberga Filipa	838	04-797	Szepietowo
252	Dolnomłyńska	1337	43-453	Starogard Gdański
253	Ogrodowa	367	62-650	Przeworsk
254	Żołnierzy Lenino	551	27-861	Tarnobrzeg
255	Szkunerowa	728	35-824	Tyszowce
256	Kotsisa Aleksandra	1379	27-874	Zakroczym
257	Woźnicka	43	34-610	Łęknica
258	Rozewska	1014	25-951	Ostróda
259	Żurawinowa	21	62-131	Dąbrowa Górnicza
260	Płoszczyny	734	59-525	Skaryszew
261	Kotowskiego Floriana	1063	63-682	Mysłowice
262	Spławie	222	78-963	Chrzanów
263	Borowa	1235	75-563	Lubniewice
264	Korbielowska	1242	25-798	Skwierzyna
265	Wrony Mieczysława	1004	42-134	Siedlce
266	Czajkowskiego Józefa	564	04-066	Ruda Śląska
267	Zarudawie	526	98-688	Jelcz-Laskowice
268	Trębacka	363	44-689	Resko
269	Grabowska	1278	12-404	Wyszogród
270	Nasturcjowa	313	66-104	Tarnobrzeg
271	Polanowska	1266	40-424	Złoty Stok
272	Pałacowa	1374	83-137	Świerzawa
273	Rydzowa	502	95-985	Ryglice
274	Piłsudskiego Józefa	1039	24-914	Warka
275	Gryfity Jaxy	973	91-699	Sopot
276	Gwarna	994	60-440	Włodawa
277	Kołodziejska	809	02-385	Myszków
278	Regatowa	614	67-287	Cieszanów
279	Młodej Polski	443	56-946	Łomianki
280	Mrówczana	53	75-766	Chmielnik
281	Łomnicka	1369	44-885	Brańsk
282	Białych Brzóz	971	56-989	Zduńska Wola
283	Elbląska	239	40-822	Przedbórz
284	Pod Stokiem	704	09-534	Gniewkowo
285	Łanowa	225	47-910	Choroszcz
286	Bolesława Krzywoustego	1128	41-246	Ryglice
287	Kapitańska	780	80-309	Mikołajki
288	Staromorzysławska	1197	86-497	Kraśnik
289	Świętego Szczepana	680	64-318	Pisz
290	Węgorzewska	407	69-247	Gniewkowo
291	Buska	1285	39-432	Sobótka
292	Kosocicka	1017	46-834	Łask
293	Krzewowa	681	94-552	Chojna
294	Wiosny Ludów	471	87-750	Krosno
295	Pigonia Stanisława	912	86-621	Rypin
296	Normandzka	607	02-403	Lubycza Królewska
297	Frycza Karola	1393	39-396	Libiąż
298	Kwiatkowskiego Eugeniusza	253	20-628	Radom
299	Zajęcza	32	77-752	Węgrów
300	Raszyńska	327	26-430	Ostrołęka
301	Baranowska	852	80-986	Tuchów
302	Świętego Rocha	77	96-412	Mielec
303	Sapalskiego Franciszka	594	38-973	Słubice
304	Żaglowa	169	29-894	Jastrzębie-Zdrój
305	Mireckiego Józefa Montwiłła	509	60-404	Szadek
306	Betlejemska	3	02-019	Kobyłka
307	Spichrzowa	499	03-505	Głogów Małopolski
308	Radlińska	800	35-783	Czerwieńsk
309	Potrzebowskiego Jerzego	56	59-495	Wodzisław Śląski
310	Wildecki Rynek	1239	50-506	Lidzbark Warmiński
311	Zegadłowicza Emila	585	08-333	Bełchatów
312	Żółtej Ciżemki	380	57-991	Sianów
313	Pasternik	720	95-304	Przasnysz
314	Obronna	1211	36-345	Pogorzela
315	Trzcianecka	1085	87-319	Garwolin
316	Węgorzewska	1187	83-029	Kołaczyce
317	Świętego Wojciecha	765	98-343	Mikstat
318	Zdrojowa	130	99-420	Zawiercie
319	Młynowa	817	36-596	Garwolin
320	Straży Ludowej	802	95-392	Ełk
321	Wojnowicka	1111	37-650	Daleszyce
322	Pylna	893	07-710	Knurów
323	Zaczarowane Koło	763	85-987	Władysławowo
324	Drewlańska	449	23-462	Staszów
325	Tymotkowa	357	95-476	Narol
326	Marcowa	745	11-986	Wasilków
327	Reymonta Władysława Stanisława	1399	17-262	Błonie
328	Burszty Józefa	844	54-655	Małogoszcz
329	Grzecha Jana	735	24-106	Stalowa Wola
330	Konwisarzy	171	92-161	Odolanów
331	Maklakiewicza Jana	303	62-026	Knyszyn
332	Żytnia	1102	07-320	Łobżenica
333	Fiszera Stanisława	595	93-242	Sępopol
334	Żelazna	863	41-940	Sompolno
335	Opoczyńska	703	92-761	Sulęcin
336	Świętej Marii Magdaleny	99	88-938	Tychy
337	Zygmunta Starego	513	77-728	Wyszogród
338	Porucznika Halszki	89	89-590	Mszczonów
339	Orląt Lwowskich	189	84-063	Sośnicowice
340	Lelewela Joachima	270	95-725	Zbąszyń
341	Rudnickiego Mikołaja	1049	86-556	Żelechów
342	Żywocicka	1032	94-579	Rzgów
343	Do Sanktuarium Bożego Miłosierdzia	1033	16-605	Gorzów Śląski
344	Serafitek	907	59-584	Bartoszyce
345	Tulipanowa	868	09-371	Prudnik
346	Śliczna	556	34-535	Dąbrowa Tarnowska
347	Proszowicka	843	18-637	Golina
348	Kmieca	1124	89-185	Dobrzyca
349	Łuszczkiewicza Władysława	773	21-593	Kępno
350	Tańskiego Czesława	1029	20-350	Lwówek Śląski
351	Fałata Juliana	402	18-364	Szczecinek
352	Zamiejska	1378	20-062	Wołomin
353	Stawisko	65	90-945	Bobowa
354	Pod Dębami	374	53-837	Radłów
355	Łobzowska	134	09-440	Cybinka
356	Libertowska	249	79-374	Przasnysz
357	Seiferta Zbigniewa	509	36-534	Jelenia Góra
358	Książęca	1331	45-485	Trzebiatów
359	Wieluńska	1149	13-610	Sianów
360	Wieruszewska	426	89-341	Kolno
361	Łuczkowska	549	37-677	Ostrzeszów
362	Pleszewska	748	82-708	Ostrów Wielkopolski
363	Barycka	770	61-406	Biała
364	Lidzka	769	17-085	Kosów Lacki
365	Herzoga Józefa	412	64-632	Brzeg Dolny
366	Szparagowa	892	52-909	Ruda Śląska
367	Sycha Marka	927	51-368	Łeba
368	Kotlarczyków Jana I Józefa	909	98-671	Skalbmierz
369	Tarnowska	134	90-116	Miłosław
370	Pionierów	177	17-857	Bierutów
371	Szparagowa	1053	75-016	Zaklików
372	Jurandota Jerzego	809	00-520	Gozdnica
373	Świdzińskiego Henryka	1271	27-909	Małogoszcz
374	Teokryta	490	65-418	Kwidzyn
375	Dróżka	856	06-549	Nowy Tomyśl
376	Przy Młynówce	1168	15-859	Mikołów
377	Nadwiślańska	312	69-081	Chocz
378	Fedrusa	1225	78-356	Wolbrom
379	Badurskiego Andrzeja	123	57-584	Tarnobrzeg
380	Wawrzyniaka Piotra	5	43-468	Pasłęk
381	Lubostroń	186	98-087	Krzyż Wielkopolski
382	Łuczkowska	673	92-641	Skała
383	Ingardena Romana	14	67-828	Ryn
384	Młodości	1014	91-656	Nowy Dwór Mazowiecki
385	Bożego Ciała	615	65-955	Stęszew
386	Konfederacka	180	52-732	Chojna
387	Siewna	1203	43-934	Słupsk
388	Wapowskiego Bernarda	662	19-290	Węgliniec
389	Skrajna	312	16-862	Szydłowiec
390	Czeladnicza	1342	32-112	Łęczna
391	Inicjatywy Lokalnej	1098	66-588	Kietrz
392	Przymiarki	1029	87-739	Jaworzno
393	Medweckiego Mieczysława	408	98-500	Kowalewo Pomorskie
394	Gadomskiego Walerego	160	81-285	Ostróda
395	Bazyliowa	240	69-609	Grabów nad Prosną
396	Do Luboni	593	90-279	Lądek-Zdrój
397	Jadźwingów	508	27-930	Kołobrzeg
398	Wojnicka	576	03-875	Tyczyn
399	Strzelców	943	16-647	Wielichowo
400	Gorczyna Jana Aleksandra	767	86-897	Muszyna
401	Baczyńskiego Krzysztofa	1010	86-328	Pilawa
402	Wąwozowa	989	99-868	Warsaw
403	Łącka	1270	93-725	Międzychód
404	Oboźna	907	30-454	Suchedniów
405	Pększyca-Grudzińskiego Franciszka	1227	83-487	Myślibórz
406	Mitkowskiego Władysława	931	75-895	Włodawa
407	Drużynowa	119	20-333	Kcynia
408	Zbąszyńska	1262	16-918	Piława Górna
409	Grochowiaka Stanisława	699	45-977	Piastów
410	Michałowskiego Piotra	70	26-274	Szczawnica
411	Czechowska	132	84-675	Drezdenko
412	Oleandry	242	12-219	Głuszyca
413	Chocimska	1327	54-944	Rawa Mazowiecka
414	Stefanowicza Kajetana	963	23-055	Paczków
415	Szenwalda Lucjana	257	69-341	Reszel
416	Ćwikłowa	108	47-914	Chmielnik
417	Strażewicza Wacława	236	25-974	Chociwel
418	Pasternik	569	60-102	Świebodzin
419	Goetla Walerego	288	68-517	Polkowice
420	Na Nowinach	1071	12-325	Zbąszyń
421	Porazińskiej Janiny	813	53-453	Wojnicz
422	Pileckiego Witolda	1211	08-982	Olesno
423	Syreńskiego Szymona	420	28-247	Czarna Woda
424	Seiferta Zbigniewa	137	65-600	Knyszyn
425	Ostrówek	77	86-471	Rejowiec Fabryczny
426	Nowa	240	33-627	Piotrków Trybunalski
427	Święciechowska	535	62-912	Warszawa
428	Lubniewicka	633	32-055	Jędrzejów
429	Urwista	816	74-072	Ryglice
430	Niemena Czesława	1302	62-456	Babimost
431	Niedbalskiego Stanisława	675	06-372	Międzyrzecz
432	Wachholza Leona	407	01-690	Rakoniewice
433	Pękowicka	1154	23-213	Konin
434	Zielińska	185	63-361	Ciężkowice
435	Birkuta Mateusza	989	93-576	Drawsko Pomorskie
436	Augustiańska	613	22-482	Przemków
437	Światowida	808	16-535	Stoczek Łukowski
438	Siwka	1111	46-383	Wałcz
439	Miodońskiego Jana	111	72-037	Koniecpol
440	Mikołowska	1155	72-721	Krzywiń
441	Bogdanowskiego Wincentego	1389	61-493	Bytom
442	Urzędnicza	347	26-625	Sandomierz
443	Wójcickiego Michała	787	66-271	Bielsko-Biała
444	Słoneczna	238	14-164	Krosno
445	Karpińskiej Aleksandry	339	79-667	Dębica
446	Monterska	1305	87-819	Oleszyce
447	Zbrojarzy	1145	32-978	Chojnice
448	Teligi Leonida	46	66-658	Chęciny
449	Żyzna	588	03-397	Tarczyn
450	Podłużna	1090	79-085	Przasnysz
451	Farmaceutów	367	87-910	Brzesko
452	Łazienna	761	02-902	Bojanowo
453	Czyżyńska	639	22-374	Kargowa
454	Rozewska	1159	32-898	Ozorków
455	Rudnicze	222	86-392	Dzierżoniów
456	Halki	530	59-766	Pyrzyce
457	Podłącze	1136	82-724	Lidzbark Warmiński
458	Do Wilgi	839	89-080	Złoczew
459	Kredowa	1184	11-969	Złoty Stok
460	Olszewskiego Karola	196	02-720	Ząbkowice Śląskie
461	Krakowska	123	98-484	Czempiń
462	Radzikowskiego Walerego Eliasza	98	28-209	Nowe
463	Plonowa	1239	54-585	Jarosław
464	Brzóski Stanisława	441	42-519	Reszel
465	Angielska	578	72-989	Rypin
466	Balicka	772	22-387	Jutrosin
467	Kostaneckiego Kazimierza	781	49-065	Jaraczewo
468	Zdrowa	889	63-661	Kamień Pomorski
469	Felkowo	205	42-853	Ciechocinek
470	Zielonogórska	863	91-091	Przemyśl
471	Chodowieckiego Daniela	1263	54-131	Lewin Brzeski
472	Strzeszyńska	1142	91-569	Ostrołęka
473	Barska	29	49-403	Tomaszów Lubelski
474	Podbipięty Longinusa	1288	91-995	Grybów
475	Halna	435	32-522	Jordanów
476	Pronia Stanisława	143	42-082	Dzierzgoń
477	Sępoleńska	1153	69-042	Koziegłowy
478	Szybowcowa	564	89-147	Lubartów
479	Gwiaździsta	213	95-414	Kazimierz Dolny
480	Kresowa	1269	69-416	Gniezno
481	Wejherowska	104	11-725	Sieniawa
482	Lubiatowska	709	14-393	Strzelno
483	Nidziańska	695	69-095	Pajęczno
484	Latwisa Stanisława	57	09-065	Radków
485	Naczelna	251	39-258	Przasnysz
486	Ostrów	81	03-279	Bobolice
487	Weigla Ferdynanda	883	36-479	Ustroń
488	Łowiecka	1289	91-985	Sulmierzyce
489	Połaniecka	629	48-154	Żory
490	Nenko Julii	1301	84-250	Głubczyce
491	Okocimska	515	02-100	Warka
492	Hubalczyków	739	68-448	Sławno
493	Wioślarska	128	82-407	Końskie
494	Barska	850	88-499	Stepnica
495	Podbagnie	493	54-548	Wysokie Mazowieckie
496	Promienna	1207	11-794	Zdzieszowice
497	Dąbrowskiej Marii	1281	11-901	Janowiec Wielkopolski
498	Świętokrzyska	1209	16-889	Modliborzyce
499	Jezierskiego Jacka	205	38-317	Niemodlin
500	Miłosławska	777	01-599	Ożarów Mazowiecki
501	Krzyżówka	293	82-955	Nowe Miasto Lubawskie
502	Chociebora	217	59-725	Gostyń
503	Sławskiego Rogera	723	88-672	Brzeg Dolny
504	Bartnicza	707	54-301	Warszawa
505	Węglarska	930	10-357	Łaszczów
506	Zarzecze	253	66-674	Sanok
507	Siemomysła	1243	94-144	Złoty Stok
508	Władysława Łokietka	127	07-131	Łapy
509	Pawłowicka	267	33-408	Modliborzyce
510	Felczaka Wacława	156	09-631	Piwniczna-Zdrój
511	Bogdanowicza Karola	185	17-580	Mogielnica
512	Rylskiego Maksyma	941	75-460	Proszowice
513	Bohaterów Westerplatte	1275	37-698	Gryfino
514	Piwnika Ponurego Jana	1046	89-840	Kołaczyce
515	Nowokramska	795	78-305	Murowana Goślina
516	Mielecka	640	02-529	Będzin
517	Śmiałego Bolesława	1093	17-699	Rejowiec Fabryczny
518	Bojki Jakuba	850	12-763	Chrzanów
519	Augustiańska	171	15-510	Kock
520	Braci Polskich	1349	57-792	Dobrzany
521	Gołaśka	612	74-536	Oświęcim
522	Petuniowa	124	74-091	Strzelno
523	Smoka Wawelskiego	462	60-375	Koprzywnica
524	Zamoyskiego Jana	1354	18-202	Czarna Woda
525	Ternicka	377	40-284	Lubartów
526	Ujastek Mogilski	934	08-568	Chrzanów
527	Orląt Lwowskich	1095	15-506	Trzebiatów
528	Lekarska	613	85-286	Koźmin Wielkopolski
529	Jasna Rola	40	18-348	Połczyn-Zdrój
530	Wiedeńska	1244	28-049	Jastrowie
531	Błękitna	1361	72-284	Trzemeszno
532	Firlika Franciszka	842	85-418	Kraśnik
533	Stokrotek	135	26-448	Police
534	Bluszczowa	318	34-046	Żarki
535	Jaromińska	68	86-782	Czarna Białostocka
\.


--
-- Data for Name: goscie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goscie (gosc_id, adres_id, gosc_imie, gosc_nazwisko, gosc_tel, gosc_karta_kred) FROM stdin;
1	36	Teresa	Świętochowska	+48 995 855 480	5574840156771317
2	37	Fryderyk	Kaczorowska	+48 747 405 023	5372071426451266
3	38	Liliana	Pawlak	+48 893 111 209	5372077560836758
4	39	Fatima	Jabłonowski	+48 095 611 749	5372076470526632
5	40	Danka	Kaczorowska	+48 172 720 033	5372077783821108
6	41	Ludwik	Karaś	+48 070 929 667	5372071365627280
7	42	Zenobiusz	Smolińska	+48 580 431 574	5574840464327307
8	43	Lidka	Grochowski	+48 509 567 195	5372077347323302
9	44	Florian	Duchnowski	+48 125 829 079	5372071468025606
10	45	Feliks	Lipińska	+48 935 521 302	5372079548630543
11	46	Tytus	Drewnowicz	+48 270 859 555	5372076416063674
12	47	Lila	Ślusarska	+48 490 977 782	5574843340420270
13	48	Berta	Kaczor	+48 458 708 538	5574724768562365
14	49	Maciek	Frątczak	+48 809 287 801	5574843060251574
15	50	Dagna	Remiszewski	+48 874 336 027	5574231205423482
16	51	Szczepan	Kot	+48 339 463 506	5372071758516868
17	52	Emilian	Olekszyk	+48 771 320 956	5372074386753457
18	53	Maurycja	Łazarczyk	+48 959 766 215	5372076567653315
19	54	Ilza	Kaczmarek	+48 459 840 908	5372070864843166
20	55	Gienek	Armińska	+48 009 745 684	5372076470208751
21	56	Mieszko	Kotowicz	+48 427 357 659	5574236271258670
22	57	Mela	Waśkowski	+48 901 504 449	5372071458621356
23	58	Filip	Dudek	+48 495 068 086	5574727528813150
24	59	Darek	Kozubowski	+48 247 130 475	5574231472005863
25	60	Jacek	Romanowicz	+48 258 972 570	5372076005731772
26	61	Krzysztof	Jabłczyńska	+48 223 189 218	5372075127103837
27	62	Grzegorz	Sochacka	+48 800 432 521	5574298075816673
28	63	Martyna	Moskal	+48 423 867 872	5574840020044057
29	64	Irek	Dołęga-Zakrzewska	+48 425 361 226	5372076032083171
30	65	Leon	Otyś	+48 932 199 953	5372079873841202
31	66	Maciej	Moskal	+48 773 880 827	5574237267361544
32	67	Leona	Kurtyka	+48 696 189 142	5574232378241545
33	68	Wiktor	Firląg	+48 971 553 930	5372071641027123
34	69	Marcin	Sowa	+48 361 069 234	5574231824487686
35	70	Lena	Kołodziejski	+48 123 750 306	5372070738643305
36	71	Darek	Józefowicz	+48 719 168 739	5372079051328238
37	72	Elena	Waszkiewicz	+48 833 335 285	5574729968364066
38	73	Blanka	Jabłczyńska	+48 178 630 208	5574724362157364
39	74	Stanisław	Cholewczyńska	+48 925 178 332	5574725921127707
40	75	Mela	Moraczewska	+48 988 072 735	5372070868733884
41	76	Idzia	Pląskowscy	+48 340 986 032	5372071125511733
42	77	Iwonka	Siczek	+48 603 062 937	5372076931250616
43	78	Jacenty	Orzyłowski	+48 142 562 333	5372073507618821
44	79	Gertruda	Jastrzębski	+48 134 668 510	5574841762757856
45	80	Sędzimir	Lutosławski	+48 251 537 641	5574297516706204
46	81	Zdzisław	Bagiński	+48 178 206 368	5574296908251308
47	82	Otylia	Frykowski	+48 128 168 258	5372078757072728
48	83	Jędrek	Regulska	+48 092 763 750	5372076381887750
49	84	Bartek	Żmuda	+48 115 328 470	5372072061702351
50	85	Bartłomiej	Jarmakowska	+48 210 056 636	5372079981314308
51	86	Wiktoria	Hernik	+48 309 119 964	5574727480184608
52	87	Adelina	Kurtyka	+48 701 124 040	5372077174160173
53	88	Edyta	Dąbkowski	+48 722 338 382	5574231971445180
54	89	Mariusz	Borawska	+48 704 983 172	5574728048827043
55	90	Lucyna	Dobrzański	+48 361 665 109	5372079246246568
56	91	Agaton	Uryga	+48 287 493 753	5574724784825580
57	92	Marta	Paszkiewicz	+48 440 215 532	5372079617650257
58	93	Greta	Skoczylas	+48 799 849 998	5372077622648225
59	94	Oliwia	Wruk	+48 490 159 565	5574297971581480
60	95	Hania	Baran	+48 750 477 460	5372075530660134
61	96	Augustyn	Kaczorowska	+48 633 900 849	5574728104786810
62	97	Alicja	Ignatowicz	+48 468 941 772	5574724602368185
63	98	Horacy	Staniewska	+48 295 841 863	5372079073838412
64	99	Grażyna	Józefowicz	+48 962 021 808	5574297077241062
65	100	Albina	Krauze	+48 138 824 648	5372075216338641
66	101	Bogumił	Samsonowicz	+48 148 919 123	5574295854777480
67	102	Kaja	Sadowska	+48 316 552 706	5372073980542266
68	103	Klaudia	Czekalska	+48 691 088 830	5574724761511302
69	104	Daniel	Tarczyński	+48 588 289 051	5574236472687032
70	105	Alina	Paszkiewicz	+48 807 591 138	5574237276232850
71	106	Marianna	Olejniczak	+48 463 670 100	5372075107620172
72	107	Emil	Kaczanowski	+48 029 133 811	5372079828520224
73	108	Zbigniewa	Rubinowicz	+48 878 518 435	5574235278301046
74	109	Leopold	Gawlik	+48 456 743 221	5574235666432585
75	110	Mela	Teodorowicz	+48 962 016 680	5372077433170716
76	111	Fatima	Zawada	+48 722 132 073	5574727124720601
77	112	Aleksander	Grabiński	+48 791 245 756	5372075810532110
78	113	Radek	Olekszyk	+48 849 053 378	5372071913771283
79	114	Alberta	Siciński	+48 093 992 381	5372070816162855
80	115	Maria	Samsonowicz	+48 160 465 416	5372075841120422
81	116	Pelagiusz	Pląskowscy	+48 998 584 786	5372073282177613
82	117	Gwidon	Glinka	+48 337 441 043	5574237214862818
83	118	Bernadeta	Muszyński	+48 037 776 893	5372070628435564
84	119	Michał	Nowakowski	+48 618 651 105	5574728180518335
85	120	Olgierd	Orzyłowski	+48 991 340 313	5372079345453883
86	121	Ewelina	Lipska	+48 371 333 399	5372079932186037
87	122	Radek	Szcześniak	+48 260 642 760	5372074836158646
88	123	Celina	Gardocka	+48 563 260 770	5372074572370314
89	124	Izolda	Gierymski	+48 909 041 415	5574297622460217
90	125	Amadeusz	Cholewczyński	+48 616 464 721	5372070532551373
91	126	Milena	Przeździecki	+48 313 020 838	5372073820553218
92	127	Abel	Karpiński	+48 900 494 397	5372071012340188
93	128	Kinga	Skubiszyńska	+48 544 173 485	5372076258530806
94	129	Laura	Wodzyńska	+48 990 245 743	5372077746431474
95	130	Jeremiasz	Chomicka	+48 308 387 948	5574296907032113
96	131	Kryspian	Drzewiecki	+48 490 975 005	5574729882763062
97	132	Gerard	Olechowska	+48 440 982 659	5372072382368312
98	133	Inga	Tarkowska	+48 080 480 547	5372076163217242
99	134	Filipina	Kuraś	+48 139 869 287	5574235061806276
100	135	Justyna	Jankowski	+48 939 991 760	5574724555180314
101	136	Julian	Korczyński	+48 456 577 496	5574236846123771
102	137	Kołodziej	Szczepanowski	+48 974 231 808	5372073282533716
103	138	Sobiesław	Małachowski	+48 838 174 773	5372073776613735
104	139	Wyszomir	Borawska	+48 510 825 444	5574232356517072
105	140	Korneliusz	Witkowski	+48 200 009 999	5372076752014588
106	141	Bogusław	Pazura	+48 108 289 028	5372071473108124
107	142	Martyna	Klimaszewska	+48 469 234 555	5574296828203207
108	143	Kryspian	Ciechanowska	+48 012 068 390	5372077860785861
109	144	Bogusław	Mackiewicz	+48 116 327 322	5574727365681447
110	145	Tadeusz	Wąsiel	+48 824 160 594	5574296637348375
111	146	Henryk	Krupski	+48 724 653 773	5372074466761107
112	147	Józefina	Bogusz	+48 356 291 776	5574234966632564
113	148	Oskar	Gucwa	+48 015 115 297	5574725621754503
114	149	Ignacy	Gałecka	+48 435 824 402	5372072038266787
115	150	Romuald	Rybicka	+48 915 816 322	5574729807387658
116	151	Jeremi	Nowacka	+48 327 646 474	5574726204028711
117	152	Fatima	Gucwa	+48 708 054 578	5372071920337524
118	153	Daniela	Krauze	+48 144 676 934	5372070827737414
119	154	Kazimierz	Malinowski	+48 173 228 126	5372070412053136
120	155	Renia	Kurtyka	+48 325 170 118	5372074288144326
121	156	Witek	Mleczko	+48 561 486 158	5574724656445806
122	157	Klara	Śmiarowski	+48 941 004 382	5574724905353173
123	158	Natan	Jerzmanowski	+48 311 025 043	5372075957480602
124	159	Wioletta	Rutowicz	+48 173 798 502	5372077137668353
125	160	Helena	Strzemecki	+48 944 764 767	5574729474380721
126	161	Darek	Grzesiuk	+48 457 763 899	5574297287405556
127	162	Alfred	Lutostański	+48 273 833 296	5574725135800008
128	163	Ignacy	Brzana	+48 985 685 606	5372075185272151
129	164	Andżelika	Zieliński	+48 575 292 833	5372070558465862
130	165	Oliwier	Kasprzyk	+48 659 391 268	5574231435465501
131	166	Daniel	Wesołowska	+48 877 069 919	5372079711717655
132	167	Tadeusz	Raczyńska	+48 027 352 338	5574729285732672
133	168	Maciek	Boguska	+48 320 670 154	5372078237271288
134	169	Cecylia	Staniewski	+48 331 140 318	5372075345145453
135	170	Emanuela	Bielecki	+48 180 885 331	5574729385617336
136	171	Michalina	Firląg	+48 611 341 210	5372076815507321
137	172	Seweryn	Partyka	+48 168 251 209	5372078123357027
138	173	Franciszek	Krasińska	+48 558 323 109	5372077466703318
139	174	Przemek	Stępkowski	+48 139 614 718	5372077444728726
140	175	Antoniusz	Suwart	+48 137 030 181	5574841354434724
141	176	Izabela	Bareja	+48 092 195 442	5372072370246181
142	177	Pankracy	Samsonowicz	+48 875 345 124	5372072911345831
143	178	Ferdynand	Jabłońska	+48 392 936 692	5372071408504025
144	179	Stanisława	Dancewicz	+48 546 424 018	5372075632450178
145	180	Jaromir	Wilkoszewska	+48 612 808 423	5372071923575203
146	181	Tadeusz	Porowski	+48 353 896 376	5372074128753120
147	182	Mela	Górski	+48 834 821 741	5372078307204730
148	183	Martyna	Andrzejak	+48 577 580 867	5372072252708753
149	184	Angela	Topolska	+48 920 895 925	5574728278330106
150	185	Łucjan	Walewski	+48 663 660 985	5574724657586178
151	186	Telesfor	Krawczyk	+48 008 954 102	5574841211557782
152	187	Wacława	Przypkowska	+48 379 261 434	5372071463753871
153	188	Eustachy	Wójcik	+48 450 595 362	5574726131181823
154	189	Danusia	Murawska	+48 177 242 377	5574842052533874
155	190	Hugo	Łagowski	+48 206 972 094	5574295872210431
156	191	Gaja	Sygietyński	+48 597 959 320	5372071078585387
157	192	Rachela	Olszowska	+48 254 254 395	5574727976360001
158	193	Hipolit	Gawron	+48 681 900 081	5574725926450260
159	194	Lech	Glinka	+48 811 280 042	5372074866865631
160	195	Krystian	Grabińska	+48 552 693 396	5574842702176546
161	196	Kalina	Brodowicz	+48 805 250 663	5574235044301627
162	197	Dioniza	Milewski	+48 845 230 165	5372078302220368
163	198	Zosia	Chmiel	+48 935 576 997	5372073623266067
164	199	Sławomira	Krasuski	+48 497 061 820	5372076327376033
165	200	Danka	Dobrzyńska	+48 780 327 892	5574727467260421
166	201	Andrzej	Michałowski	+48 662 046 677	5574842704613140
167	202	Zygfryda	Młynarczyk	+48 076 244 897	5574235914820813
168	203	Maciej	Kijański	+48 350 353 360	5574840113708634
169	204	Dobiesława	Wójczyk	+48 037 508 786	5372079522884538
170	205	Krystyna	Dutkiewicz	+48 946 742 355	5372070533634202
171	206	Sławomira	Zych	+48 371 146 590	5574296250855300
172	207	Sylwia	Gombrowicz	+48 868 053 157	5574729578375320
173	208	Ernest	Bohosiewicz	+48 807 489 455	5574297131808625
174	209	Bogumił	Kłosiński	+48 102 417 488	5574295856062188
175	210	Przemysława	Mąkosza	+48 126 655 685	5574728758055876
176	211	Magdalena	Teodorowicz	+48 281 166 439	5372076411113714
177	212	Anatol	Błaszczykowski	+48 649 237 685	5372076885372721
178	213	Aleksander	Pietrzak	+48 792 502 557	5372072723547517
179	214	Nika	Kubicz	+48 686 525 254	5574841140851561
180	215	Bronisława	Rudnicki	+48 335 055 502	5372075862004737
181	216	Aleksa	Drewnowicz	+48 185 552 456	5372070745463457
182	217	Rajmund	Matkowski	+48 215 563 181	5574728460763734
183	218	Anita	Lutosławska	+48 407 649 963	5574729756272265
184	219	Hanka	Sikorska	+48 656 315 335	5372076873452600
185	220	Bohdan	Szabelska	+48 841 559 008	5574841948587623
186	221	Jarek	Dobrzyńska	+48 532 835 256	5574232842435202
187	222	Otylia	Kotecka	+48 369 035 821	5574724963658406
188	223	Hanna	Ambroziak	+48 733 776 175	5372073615247414
189	224	Ziemowit	Opasińska	+48 640 410 148	5372073370812717
190	225	Dagmara	Bielicka	+48 960 772 350	5372076147583651
191	226	Lubomir	Kmiecik	+48 804 172 440	5372075173142002
192	227	Alberta	Golka	+48 103 733 313	5372075106248140
193	228	Zbigniew	Wojciechowski	+48 914 343 331	5372079558072800
194	229	Cezary	Zajączkowska	+48 236 455 413	5574297574078173
195	230	Marleta	Słaby	+48 393 608 622	5372078172441854
196	231	Bonifacy	Otyś	+48 396 519 814	5372073486082767
197	232	Ignacy	Brzozowski	+48 429 983 775	5574729350640743
198	233	Pola	Rutowicz	+48 009 527 456	5574727221758637
199	234	Abel	Smolik	+48 792 343 855	5372079308564676
200	235	Teodezja	Onufrowicz	+48 664 882 181	5372073203672841
201	236	Tomasz	Wisowaty	+48 560 044 296	5372070824806154
202	237	Hipolita	Wójtowicz	+48 143 316 145	5372078123576766
203	238	Stanisława	Marciniak	+48 453 532 903	5574728443844684
204	239	Oliwier	Lipińska	+48 740 028 339	5574843328016363
205	240	Tytus	Roszkowska	+48 138 500 556	5372071462037102
206	241	Stefan	Szołtysek	+48 423 513 600	5574231932827047
207	242	Klara	Dziubiński	+48 558 977 657	5574297342662100
208	243	Radek	Dunajewska	+48 899 882 300	5372073462142163
209	244	Bronisław	Kaczorowska	+48 905 965 934	5372072347647636
210	245	Antonina	Szczutowska	+48 615 402 985	5372074157518550
211	246	Arnold	Lipska	+48 302 914 365	5574297325016548
212	247	Józefa	Muszyńska	+48 002 510 353	5574726760887450
213	248	Lilka	Białas	+48 279 866 831	5574236587654034
214	249	Bogdan	Wieczorkowska	+48 846 037 714	5372078410233352
215	250	Danuta	Butkiewicz	+48 812 256 658	5574297062106577
216	251	Grzegorz	Jastrzębska	+48 378 791 722	5372072688624038
217	252	Gracja	Nowicki	+48 053 323 692	5574841187557063
218	253	Wanda	Kaczorowska	+48 150 868 154	5372075538787517
219	254	Nina	Bizoń	+48 478 109 144	5574236987652018
220	255	Julianna	Buczyńska	+48 637 127 512	5574296261668213
221	256	Lena	Słabowski	+48 430 175 014	5574235782471863
222	257	Angelika	Majdecka	+48 935 523 299	5372074640111443
223	258	Joachim	Kononowicz	+48 299 309 133	5372076963442644
224	259	Łucjan	Gąsienica	+48 552 331 665	5372071480241751
225	260	Artur	Smolińska	+48 545 025 838	5574841503806376
226	261	Emanuela	Szymańska	+48 474 598 336	5372075880772752
227	262	Agnieszka	Wiśniewska	+48 386 102 505	5372075087710324
228	263	Wiesława	Rybicka	+48 455 504 197	5574297116448546
229	264	Maniek	Andrzejewski	+48 572 393 675	5372072948383417
230	265	Daria	Kuźniar	+48 074 738 663	5372076031772220
231	266	Sława	Majewski	+48 244 879 708	5574840754775744
232	267	Celestyn	Świetlicka	+48 269 597 297	5372074851480875
233	268	Sylwester	Nowak	+48 146 858 096	5574726276876575
234	269	Daria	Piechota	+48 630 490 260	5574729951864767
235	270	Oliwia	Żyborska	+48 368 528 634	5372074247327335
236	271	Maciek	Szojda	+48 233 645 815	5574843248457408
237	272	Jędrek	Mioduszewska	+48 059 385 387	5574236932741411
238	273	Pola	Gardocki	+48 106 723 818	5574841440013086
239	274	Leopolda	Galewicz	+48 917 055 045	5372074105833622
240	275	Brunon	Zawada	+48 419 192 519	5372072951771706
241	276	Maryna	Sutowicz	+48 865 078 205	5372070481726216
242	277	Bogumiła	Lewandowski	+48 443 246 588	5574296060375721
243	278	Adrianna	Przewalska	+48 209 193 968	5372075775737803
244	279	Inga	Kaznowska	+48 452 758 728	5372079213865325
245	280	Nina	Gutowska	+48 351 548 879	5574296502545170
246	281	Mirek	Orzyłowska	+48 073 586 955	5574236082764650
247	282	Flawia	Parandowski	+48 626 013 140	5372078076333603
248	283	Adolf	Kasprzyk	+48 086 840 672	5574236600278084
249	284	Alfreda	Jagodziński	+48 146 715 503	5372079945243205
250	285	Hanna	Nowacka	+48 707 237 388	5372077377003865
251	286	Hanna	Drewnowski	+48 514 162 269	5372074000806277
252	287	Olimpia	Olekszyk	+48 929 434 557	5574840367217530
253	288	Anita	Hrycyk	+48 002 101 075	5574297946501506
254	289	Darzybór	Murawski	+48 776 659 847	5574840337241222
255	290	Maks	Sikorski	+48 541 904 420	5372078435228445
256	291	Gniewko	Pawlak	+48 668 822 221	5372072146852510
257	292	Konrad	Świętochowski	+48 947 592 347	5574840746406580
258	293	Olgierd	Ignatowicz	+48 733 303 106	5372077760331618
259	294	Liliana	Mołdrzyk	+48 761 153 210	5372077443742777
260	295	Jaśmina	Gondz	+48 673 600 477	5574842152431383
261	296	Elżbieta	Karwowska	+48 506 483 978	5574725883088020
262	297	Agata	Waniek	+48 778 589 063	5574231471156766
263	298	Eugenia	Boguski	+48 106 236 597	5574296885130624
264	299	Bogdan	Brzana	+48 806 938 638	5372076164807553
265	300	Ariela	Klimaszewska	+48 266 542 925	5372071782415830
266	301	Cezary	Grabarz	+48 381 295 668	5574232531670572
267	302	Olaf	Narkiewicz	+48 310 435 896	5372075217431700
268	303	Aneta	Komornicka	+48 008 849 788	5574725312402842
269	304	Bożysław	Żurawicka	+48 720 293 957	5372072822454680
270	305	Honorat	Marcinkiewicz	+48 076 570 045	5574232175505266
271	306	Agata	Mołdrzyk	+48 746 956 340	5574725243151021
272	307	Magdalena	Bieniasz	+48 670 136 233	5372072247017237
273	308	Tekla	Białas	+48 600 681 034	5574236661832076
274	309	Karolina	Słaby	+48 086 340 416	5372071825170624
275	310	Zosia	Tworzewski	+48 263 330 427	5574298122336832
276	311	Jadwiga	Pańczyk	+48 950 272 437	5372071054736137
277	312	Hektor	Odrzywolski	+48 169 725 175	5372077643658328
278	313	Łucjan	Niewiadomski	+48 484 894 652	5574297124246130
279	314	Ambroży	Polański	+48 363 402 786	5372070554605651
280	315	Wyszomir	Glinka	+48 885 195 724	5372078775807261
281	316	Diana	Kasprowicz	+48 079 772 232	5574841110281203
282	317	Mateusz	Jabłczyński	+48 372 607 781	5372071856371018
283	318	Kazimierz	Jabłczyński	+48 061 633 616	5372076942778308
284	319	Aleksy	Duchnowski	+48 822 892 184	5372071186784245
285	320	Bogumiła	Kraszewska	+48 269 561 709	5574841716802642
286	321	Nikola	Orłowska	+48 631 468 919	5574729180057878
287	322	Pamela	Wojtaczka	+48 089 810 337	5372078315264056
288	323	Jowita	Rybińska	+48 910 759 233	5574725980537010
289	324	Radziwił	Sieradzan	+48 257 335 782	5372071741565626
290	325	Tamara	Gałczyńska	+48 090 154 480	5574296341252855
291	326	Majka	Szajda	+48 648 275 056	5574725157328136
292	327	Mirka	Szojda	+48 006 852 977	5574297061808884
293	328	Eliza	Szczepanowska	+48 074 735 313	5574728955270054
294	329	Zbyszek	Wąsiel	+48 284 611 377	5372079541020650
295	330	Jana	Dębicki	+48 135 929 665	5574235857237165
296	331	Gerald	Zielonko	+48 547 165 817	5574840603313036
297	332	Iza	Strużyna	+48 201 218 254	5372075804813872
298	333	Jula	Orski	+48 949 310 941	5574728931184643
299	334	Darek	Dziubdziela	+48 157 568 451	5574843165717461
300	335	Wiola	Sieradzan	+48 607 575 228	5372074846826224
301	336	Kostek	Gryga	+48 674 278 730	5574724374382844
302	337	Ilona	Wojnar	+48 953 647 778	5574728382121086
303	338	Leonard	Janicka	+48 807 856 029	5574297762581186
304	339	Teofil	Malczewska	+48 069 983 650	5574727304638268
305	340	Bogusława	Parandowski	+48 121 151 564	5574729772786140
306	341	Leoncjusz	Orzyłowska	+48 894 600 824	5372075032153638
307	342	Zygfryd	Strzemecka	+48 505 998 669	5372076760013168
308	343	Zbyszko	Leśniewski	+48 805 638 244	5574231844682720
309	344	Dagmara	Walewski	+48 942 701 985	5372079566165588
310	345	Pamela	Galewicz	+48 138 111 265	5574841568343745
311	346	Tobiasz	Rutowicz	+48 382 103 092	5372075652604381
312	347	Kunegunda	Puchała	+48 018 930 254	5574729037643557
313	348	Przemysława	Żalińska	+48 647 216 126	5372077440486444
314	349	Kamil	Dunajewski	+48 511 123 645	5574725485148404
315	350	Lidia	Ochab	+48 845 346 866	5372073082612231
316	351	Bogusław	Wojnowski	+48 809 068 203	5574231410348847
317	352	Hektor	Tarkowski	+48 188 363 930	5574728408586544
318	353	Blanka	Maliński	+48 906 005 999	5372073378331330
319	354	Gerwazy	Żądło	+48 032 237 642	5372075763628568
320	355	Cezary	Majdecki	+48 475 921 315	5574728173133308
321	356	Danuta	Dobrzańska	+48 444 177 617	5574727530471617
322	357	Alek	Filipowicz	+48 226 816 452	5372070258681008
323	358	Marcin	Grabarz	+48 251 795 952	5574841885070625
324	359	Rudolf	Czachowska	+48 050 600 321	5574841500234770
325	360	Adelajda	Wnorowski	+48 648 939 720	5574728947510302
326	361	Jowita	Szymański	+48 145 083 676	5372072936311776
327	362	Ligia	Mazur	+48 168 381 675	5574840966048831
328	363	Penelopa	Kotowska	+48 704 241 793	5574231072143007
329	364	Adrianna	Zarzecka	+48 357 554 106	5372070330851660
330	365	Lucjan	Boguszewska	+48 900 077 186	5574728750706666
331	366	Olaf	Kmiecik	+48 993 688 784	5372076748256376
332	367	Józef	Krzyżanowska	+48 328 585 541	5574728658486718
333	368	Tymon	Romańska	+48 608 103 440	5574840901310643
334	369	Zdzisława	Romańska	+48 470 292 815	5372071327507521
335	370	Adela	Obrębska	+48 495 866 850	5372071663261766
336	371	Paulina	Krawczyk	+48 166 687 627	5372071852764158
337	372	Genowefa	Szczutowski	+48 741 205 195	5372072733265514
338	373	Maurycja	Gąsiorowski	+48 249 742 192	5574843318416805
339	374	Gerald	Surma	+48 703 836 455	5372073010342885
340	375	Marta	Surdykowska	+48 212 875 279	5372075107382757
341	376	Jeremiasz	Lewandowski	+48 678 525 187	5372077846463351
342	377	Manuel	Staszewska	+48 328 616 454	5574727614375627
343	378	Jurek	Pietrzykowska	+48 621 543 509	5574725950211224
344	379	Marian	Majdecki	+48 501 737 462	5574726913055823
345	380	Stefania	Kubicz	+48 137 096 739	5574235401174260
346	381	Dalia	Tomankiewicz	+48 519 691 780	5372072275012100
347	382	Kaja	Ochab	+48 193 799 910	5372075755128726
348	383	Anastazja	Kaczorowska	+48 839 642 579	5574727106667283
349	384	Józef	Olechnowicz	+48 623 658 322	5574726354326808
350	385	Stanisława	Żmuda	+48 710 084 173	5574729455072040
351	386	Augustyn	Kurowski	+48 434 375 523	5372079055634060
352	387	Wiola	Sikora	+48 059 387 396	5372079981263653
353	388	Darzybór	Szpanowski	+48 290 983 450	5574840218420804
354	389	Bernarda	Jarczyńska	+48 504 190 290	5372071710617853
355	390	Leopold	Młynarczyk	+48 736 008 730	5372072813766167
356	391	Olaf	Andrzejak	+48 476 626 935	5372077550033077
357	392	Maryla	Gajda	+48 885 248 789	5574231068054341
358	393	Janina	Olechnowicz	+48 183 674 605	5372073864107574
359	394	Radomir	Lipiński	+48 083 774 060	5372073625372152
360	395	Antoniusz	Tarnowski	+48 452 615 118	5372074875342622
361	396	Nina	Jabłonowska	+48 226 230 372	5372077501584574
362	397	Kleofas	Ochocka	+48 698 533 653	5372076866585648
363	398	Judyta	Firląg	+48 858 669 167	5372073756074122
364	399	Tymoteusz	Zarzecka	+48 892 453 121	5574232135865115
365	400	Irena	Skubiszyński	+48 645 917 967	5372075588064403
366	401	Kołodziej	Nowak	+48 870 554 498	5574236413114500
367	402	Celina	Bieniasz	+48 406 043 678	5574725475685324
368	403	Marcin	Więcek	+48 948 511 803	5574297118337788
369	404	Bonifacy	Sulej	+48 016 024 385	5574843003872403
370	405	Alojzy	Gałecki	+48 137 807 081	5372076411835522
371	406	Agata	Rutowicz	+48 446 303 169	5574236320038743
372	407	Aleksander	Grabska	+48 555 933 402	5372073935866182
373	408	Radosława	Paprocki	+48 401 124 006	5372073430080537
374	409	Dionizy	Malczewski	+48 891 131 963	5372071188665160
375	410	Mirka	Borys	+48 145 666 348	5574727882107256
376	411	Joachim	Purcelewski	+48 801 590 876	5574235551040600
377	412	Włodzimierz	Czechowski	+48 558 372 292	5574236043162481
378	413	Jakub	Raniszewski	+48 055 242 161	5574232003328733
379	414	Czarek	Obrębski	+48 852 833 945	5574728371630287
380	415	Eugenia	Karaś	+48 489 322 549	5574725753226213
381	416	Tymoteusz	Kłosowska	+48 854 521 678	5372074653262307
382	417	Marysia	Roszkowski	+48 889 813 796	5372073866012657
383	418	Bożydar	Narkiewicz	+48 872 500 789	5574729777440404
384	419	Ryszard	Maculewicz	+48 324 282 114	5574727836388572
385	420	Wawrzyn	Abakanowicz	+48 795 195 774	5574842507223030
386	421	Włodzimierz	Grzesiuk	+48 669 216 883	5372079654752552
387	422	Matylda	Szymczyk	+48 641 297 799	5574843457123220
388	423	Klara	Bużeński	+48 001 168 010	5372078656313173
389	424	Teofil	Łagodzki	+48 556 670 976	5372071443771522
390	425	Maria	Kasprowicz	+48 145 431 130	5372073634451641
391	426	Alicja	Damboń	+48 759 584 100	5574842270007172
392	427	Przemysława	Zagumny	+48 559 211 388	5574726966475712
393	428	Melchior	Tomaszewska	+48 986 160 220	5574235232537222
394	429	Daniela	Kasprowicz	+48 129 278 252	5574235160441645
395	430	Eleonora	Pospieszalska	+48 485 480 536	5574236587528717
396	431	Kinga	Wojtaczka	+48 614 764 047	5574726137071564
397	432	Dobiesława	Narkiewicz	+48 769 536 370	5574726272228805
398	433	Gerald	Święcicka	+48 384 207 077	5372078656427353
399	434	Jarosław	Firląg	+48 181 325 738	5574297630121322
400	435	Julian	Cholewczyńska	+48 870 198 559	5372071145043634
401	436	Aniela	Święcicka	+48 184 372 395	5574297751325652
402	437	Radomir	Karaś	+48 131 899 264	5372075055714852
403	438	Hermenegilda	Dąbkowska	+48 092 827 261	5372079482636050
404	439	Gertruda	Galewicz	+48 418 632 496	5372074274236326
405	440	Zygmund	Żukowski	+48 384 482 876	5574726240608765
406	441	Pelagiusz	Adamiec	+48 578 052 746	5574841948403516
407	442	Bożydar	Kossowska	+48 394 623 587	5574232012727644
408	443	Maurycja	Maliński	+48 464 338 994	5574236506548606
409	444	Otylia	Marciniak	+48 694 723 772	5372074862435876
410	445	Jan	Karaś	+48 151 951 956	5372075917668650
411	446	Zofia	Maniura	+48 138 083 182	5372072656631478
412	447	Sylwester	Wójcicki	+48 570 135 605	5372079728273684
413	448	Daromir	Morawski	+48 074 384 268	5574296538100263
414	449	Stefan	Kownacki	+48 396 493 855	5574840322377668
415	450	Witold	Kozakiewicz	+48 787 257 220	5574295834214257
416	451	Radomił	Kurtyka	+48 740 537 127	5574232838677510
417	452	Katarzyna	Sikora	+48 121 178 033	5372072288214552
418	453	Lila	Kaczanowska	+48 354 343 076	5372078857504646
419	454	Dawid	Glinka	+48 444 109 524	5574232170214328
420	455	Adria	Nowacka	+48 195 335 194	5574296551250037
421	456	Stanisław	Jurczyk	+48 476 557 156	5372073073161164
422	457	Ildefonsa	Raniszewski	+48 228 352 626	5372077882423657
423	458	Antonina	Pazura	+48 540 873 533	5372070966402564
424	459	Matylda	Hernik	+48 479 820 273	5372076527365125
425	460	Emil	Krawczyk	+48 553 284 798	5574297885462108
426	461	Rudolf	Koszewski	+48 841 642 250	5372078057763315
427	462	Matylda	Warzager	+48 686 571 898	5574231772520751
428	463	Nikola	Horodecka	+48 688 347 590	5372070222887384
429	464	Anatol	Waniek	+48 374 978 261	5574725934125722
430	465	Aurelia	Karwowski	+48 286 455 168	5372078274355168
431	466	Pola	Jabłczyński	+48 321 898 885	5574726041218384
432	467	Dagmar	Zatorska	+48 427 354 713	5574725116150100
433	468	Ewelina	Grabińska	+48 813 530 157	5372071854233400
434	469	Anastazja	Kaznowska	+48 271 364 202	5574729413286278
435	470	Augustyn	Mrozowski	+48 994 106 209	5574296518581375
436	471	Jowita	Bużeńska	+48 272 310 673	5372072357252566
437	472	Ariadna	Gąsienica	+48 018 804 521	5574726862114233
438	473	Hania	Sieradzki	+48 117 229 597	5574729451825110
439	474	Leopold	Brzozowski	+48 144 941 835	5372071138514203
440	475	Liwia	Kurtyka	+48 441 895 651	5574231377586454
441	476	Antonia	Fornalska	+48 088 980 145	5372072987046156
442	477	Krzesimir	Żochowski	+48 385 915 845	5372078845786685
443	478	Czesław	Jakimowicz	+48 078 061 367	5574295913220381
444	479	Aga	Rogalski	+48 240 342 502	5574725971741530
445	480	Kunegunda	Marcinkowska	+48 831 904 297	5372079555777716
446	481	Antoni	Jałoszyński	+48 664 518 903	5372078517304437
447	482	Amanda	Gancarczyk	+48 659 859 917	5372074808532414
448	483	Włodzimierz	Pardecki	+48 899 909 374	5372077874300285
449	484	Anastazja	Jarmakowski	+48 591 472 262	5574727726770574
450	485	Ariela	Wolański	+48 252 920 626	5372073642122101
451	486	Benedykta	Drewniowska	+48 068 569 154	5372079427743235
452	487	Lucjusz	Rączkowski	+48 525 209 542	5574727031758025
453	488	Rajmund	Frątczak	+48 844 204 627	5574727664332445
454	489	Jarosław	Młynarczyk	+48 435 614 907	5574296713357555
455	490	Nina	Purcelewski	+48 257 282 076	5372076376485164
456	491	Leokadia	Wiszowaty	+48 181 302 307	5574298133354055
457	492	Leon	Wawrzyniak	+48 588 052 781	5574726657643388
458	493	Brunon	Rybiński	+48 144 007 834	5372073886856182
459	494	Michalina	Drzewiecka	+48 717 997 966	5574235081820760
460	495	Mieszko	Brodowicz	+48 289 997 408	5574729908155046
461	496	Julita	Bielecka	+48 499 868 493	5574729471354018
462	497	Zygfryd	Włodarczyk	+48 596 714 432	5574840868888227
463	498	Kamil	Sztwiertnia	+48 473 693 503	5372078010664618
464	499	Janusz	Czachor	+48 293 104 710	5372075432203520
465	500	Bona	Kuźniar	+48 100 977 892	5372073125706255
466	501	Marleta	Janowski	+48 204 497 520	5372079114364725
467	502	Konrad	Krakowiak	+48 818 562 601	5574296030724230
468	503	Daniela	Buczyński	+48 614 673 466	5574231208703435
469	504	Janek	Gąsiorowska	+48 619 950 726	5372071288148406
470	505	Kalina	Moraczewska	+48 291 778 464	5372078905868845
471	506	Agaton	Moraczewski	+48 661 487 084	5574231264881000
472	507	Emil	Lewandowski	+48 549 500 720	5574726336776880
473	508	Maksym	Wnorowska	+48 660 682 604	5372073027583323
474	509	Fabiana	Wójtowicz	+48 823 434 369	5372079852284754
475	510	Bożena	Łagowska	+48 910 586 512	5574725952747712
476	511	Szymon	Badowski	+48 859 815 635	5574842668081375
477	512	Lilia	Dobiecki	+48 403 843 316	5574297812472147
478	513	Rysiek	Leśniewska	+48 775 136 619	5574724980427363
479	514	Amadeusz	Maćkowiak	+48 140 700 514	5372074955208362
480	515	Maks	Adamiec	+48 130 834 338	5372077632237670
481	516	Aniela	Leja	+48 083 655 955	5372071384001707
482	517	Eryka	Orzyłowska	+48 685 795 536	5574725841457416
483	518	Antoniusz	Ryś	+48 795 292 180	5574841986088815
484	519	Dobiesław	Topolska	+48 252 649 736	5574297731643687
485	520	Fabian	Kraszewski	+48 498 776 605	5574724954736120
486	521	Wojtek	Siudek	+48 034 360 226	5372076545251752
487	522	Tomek	Sopoćko	+48 502 096 535	5372074145742783
488	523	Aleksandra	Wojtaczka	+48 711 826 606	5372078070445528
489	524	Kaja	Adamiec	+48 020 122 124	5372076757838874
490	525	Władysława	Mazurek	+48 120 238 881	5372072584383838
491	526	Julita	Maćkowiak	+48 680 141 665	5574728862607463
492	527	Karol	Szojda	+48 859 407 415	5372073775422146
493	528	Irka	Bartyzel	+48 491 133 471	5372071621030204
494	529	Miron	Wróblewski	+48 438 510 889	5372076246014400
495	530	Emilia	Hejmo	+48 112 037 346	5372072662050234
496	531	Cyprian	Skrok	+48 498 387 857	5574231002613061
497	532	Katarzyna	Maciejowski	+48 061 535 318	5574231361661271
498	533	Bożenna	Okulska	+48 731 287 678	5372079416440850
499	534	Leszek	Walewska	+48 792 531 032	5574236326055048
500	535	Lech	Jabłońska	+48 752 315 186	5574235878102372
\.


--
-- Data for Name: hotele; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotele (hotel_id, adres_id, ocena_id, hotel_nazwa, hotel_tel, hotel_ilosc_pieter, hotel_ilosc_pokoi, hotel_czas_zameld, hotel_czas_wymeld) FROM stdin;
1	1	4	Mercury	17 777 10 10	2	20	10:00-12:00	15:00-22:00
2	2	4	Venus	12 201 01 01	2	20	10:00-12:00	15:00-22:00
3	3	5	Mars	58 767 10 00	2	20	10:00-12:00	15:00-22:00
4	4	5	Jupiter	22 630 63 06	6	60	10:00-12:00	15:00-22:00
5	5	4	Saturn	18 200 01 62	4	40	10:00-12:00	15:00-22:00
\.


--
-- Data for Name: ocena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ocena (ocena_id, ocena_wartosc) FROM stdin;
5	*****
4	****
1	*
2	**
3	***
\.


--
-- Data for Name: pokoje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokoje (pok_id, hotel_id, typ_pok_id, pok_nr) FROM stdin;
1	1	1	1
2	1	1	2
3	1	1	3
4	1	1	4
5	1	2	5
6	1	2	6
7	1	2	7
8	1	2	8
9	1	2	9
10	1	2	10
11	1	2	11
12	1	2	12
13	1	3	13
14	1	3	14
15	1	3	15
16	1	3	16
17	1	4	17
18	1	4	18
19	1	4	19
20	1	4	20
21	2	1	1
22	2	1	2
23	2	1	3
24	2	1	4
25	2	2	5
26	2	2	6
27	2	2	7
28	2	2	8
29	2	2	9
30	2	2	10
31	2	2	11
32	2	2	12
33	2	3	13
34	2	3	14
35	2	3	15
36	2	3	16
37	2	4	17
38	2	4	18
39	2	4	19
40	2	4	20
41	3	1	1
42	3	1	2
43	3	1	3
44	3	1	4
45	3	2	5
46	3	2	6
47	3	2	7
48	3	2	8
49	3	2	9
50	3	2	10
51	3	2	11
52	3	2	12
53	3	3	13
54	3	3	14
55	3	3	15
56	3	3	16
57	3	4	17
58	3	4	18
59	3	4	19
60	3	4	20
61	4	1	1
62	4	1	2
63	4	1	3
64	4	1	4
65	4	1	5
66	4	1	6
67	4	1	7
68	4	1	8
69	4	1	9
70	4	1	10
71	4	1	11
72	4	1	12
73	4	2	13
74	4	2	14
75	4	2	15
76	4	2	16
77	4	2	17
78	4	2	18
79	4	2	19
80	4	2	20
81	4	2	21
82	4	2	22
83	4	2	23
84	4	2	24
85	4	2	25
86	4	2	26
87	4	2	27
88	4	2	28
89	4	2	29
90	4	2	30
91	4	2	31
92	4	2	32
93	4	2	33
94	4	2	34
95	4	2	35
96	4	2	36
97	4	3	37
98	4	3	38
99	4	3	39
100	4	3	40
101	4	3	41
102	4	3	42
103	4	3	43
104	4	3	44
105	4	3	45
106	4	3	46
107	4	3	47
108	4	3	48
109	4	4	49
110	4	4	50
111	4	4	51
112	4	4	52
113	4	4	53
114	4	4	54
115	4	4	55
116	4	4	56
117	4	4	57
118	4	4	58
119	4	4	59
120	4	4	60
121	5	1	1
122	5	1	2
123	5	1	3
124	5	1	4
125	5	1	5
126	5	1	6
127	5	1	7
128	5	1	8
129	5	2	9
130	5	2	10
131	5	2	11
132	5	2	12
133	5	2	13
134	5	2	14
135	5	2	15
136	5	2	16
137	5	2	17
138	5	2	18
139	5	2	19
140	5	2	20
141	5	2	21
142	5	2	22
143	5	2	23
144	5	2	24
145	5	3	25
146	5	3	26
147	5	3	27
148	5	3	28
149	5	3	29
150	5	3	30
151	5	3	31
152	5	3	32
153	5	4	33
154	5	4	34
155	5	4	35
156	5	4	36
157	5	4	37
158	5	4	38
159	5	4	39
160	5	4	40
\.


--
-- Data for Name: pracownicy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pracownicy (prac_id, stan_id, adres_id, hotel_id, prac_imie, prac_nazwisko, prac_tel) FROM stdin;
1	1	1	1	Nina	Rataj	+48 965 115 152
2	2	2	1	Natasza	Korczyński	+48 342 580 398
3	2	3	1	Jolanta	Dębski	+48 560 363 140
4	3	4	1	Agata	Ostrowski	+48 744 912 422
5	4	5	1	Wojciech	Przypkowska	+48 301 713 346
6	1	6	2	Eryka	Golka	+48 850 390 443
7	2	7	2	Jarosław	Remiszewska	+48 897 030 460
8	2	8	2	Elena	Waniek	+48 776 238 828
9	3	9	2	Józef	Imieliński	+48 784 378 090
10	4	10	2	Gracja	Jaśkiewicz	+48 998 023 340
11	1	11	3	Gienek	Jabłoński	+48 253 093 087
12	2	12	3	Pola	Kasprowicz	+48 841 330 680
13	2	13	3	Bogumiła	Brzana	+48 278 031 359
14	3	14	3	Waldek	Wasiak	+48 362 275 621
15	4	15	3	Bożydar	Wodzińska	+48 089 673 734
16	1	16	4	Zofia	Maliński	+48 290 879 938
17	1	17	4	Robert	Kotowicz	+48 772 931 406
18	2	18	4	Cyprian	Turczyński	+48 766 080 930
19	2	19	4	Bogusława	Śmiarowska	+48 717 520 134
20	2	20	4	Maryla	Staniewska	+48 501 559 971
21	2	21	4	Jeremiasz	Gościniak	+48 701 961 687
22	2	22	4	Teofil	Białas	+48 876 010 300
23	3	23	4	Janina	Redlicki	+48 856 222 201
24	3	24	4	Dagna	Siudek	+48 550 773 946
25	4	25	4	Bartek	Kurowski	+48 859 980 899
26	1	26	5	Ula	Wałach	+48 623 336 271
27	1	27	5	Władysława	Wolny	+48 860 622 955
28	2	28	5	Jędrzej	Stępień	+48 282 575 889
29	2	29	5	Bazyli	Przewalski	+48 350 769 478
30	2	30	5	Leopolda	Galińska	+48 485 208 462
31	2	31	5	Iga	Staniewski	+48 559 833 401
32	2	32	5	Gloria	Gawron	+48 208 503 980
33	3	33	5	Rafał	Rychlewski	+48 086 719 663
34	3	34	5	Pankracy	Górska	+48 032 153 422
35	4	35	5	Ligia	Morawska	+48 696 756 250
\.


--
-- Data for Name: rezerwacje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rezerwacje (rez_id, hotel_id, gosc_id, prac_id, rez_data, rez_zameld, rez_wymeld, rez_typ_platnosci, rez_koszt) FROM stdin;
1	1	1	3	2019-01-10	2019-01-13	2019-01-19	karta	1500
2	1	2	3	2019-01-15	2019-01-16	2019-01-18	karta	1000
3	1	3	3	2019-02-04	2019-02-08	2019-02-15	gotowka	700
4	1	4	3	2019-02-11	2019-02-12	2019-02-14	gotowka	1000
5	1	5	3	2019-02-12	2019-02-13	2019-02-20	karta	1750
6	1	6	3	2019-02-12	2019-02-17	2019-02-22	karta	1250
7	1	7	3	2019-03-01	2019-03-02	2019-03-07	gotowka	1250
8	1	8	3	2019-03-04	2019-03-07	2019-03-12	karta	2500
9	1	9	3	2019-03-16	2019-03-17	2019-03-24	gotowka	1750
10	1	10	3	2019-04-02	2019-04-03	2019-04-04	gotowka	100
11	1	11	3	2019-04-04	2019-04-06	2019-04-09	gotowka	300
12	1	12	3	2019-04-11	2019-04-14	2019-04-15	karta	1000
13	1	13	3	2019-05-15	2019-05-17	2019-05-22	gotowka	2500
14	1	14	3	2019-05-04	2019-05-09	2019-05-10	karta	250
15	1	15	3	2019-05-14	2019-05-16	2019-05-23	gotowka	3500
16	1	16	3	2019-05-09	2019-05-14	2019-05-21	karta	7000
17	1	17	3	2019-06-10	2019-06-11	2019-06-18	karta	700
18	1	18	3	2019-06-08	2019-06-11	2019-06-13	karta	200
19	1	19	3	2019-06-15	2019-06-18	2019-06-23	karta	5000
20	1	20	3	2019-06-12	2019-06-14	2019-06-19	gotowka	500
21	1	21	3	2019-07-05	2019-07-08	2019-07-11	karta	300
22	1	22	3	2019-07-13	2019-07-17	2019-07-19	karta	500
23	1	23	3	2019-07-09	2019-07-13	2019-07-15	karta	500
24	1	24	3	2019-07-14	2019-07-17	2019-07-20	gotowka	750
25	1	25	3	2019-07-03	2019-07-05	2019-07-08	gotowka	750
26	1	26	3	2019-08-08	2019-08-11	2019-08-18	karta	1750
27	1	27	3	2019-08-11	2019-08-12	2019-08-13	karta	500
28	1	28	3	2019-08-10	2019-08-15	2019-08-20	gotowka	1250
29	1	29	3	2019-08-13	2019-08-17	2019-08-23	gotowka	1500
30	1	30	3	2019-08-08	2019-08-11	2019-08-16	gotowka	1250
31	1	31	3	2019-09-13	2019-09-15	2019-09-21	gotowka	600
32	1	32	3	2019-10-03	2019-10-07	2019-10-12	gotowka	5000
33	1	33	3	2019-11-13	2019-11-14	2019-11-17	gotowka	300
34	1	34	3	2019-12-04	2019-12-08	2019-12-10	karta	1000
35	1	35	3	2019-12-03	2019-12-05	2019-12-07	karta	200
36	2	100	9	2019-01-10	2019-01-15	2019-01-22	gotowka	1750
37	2	101	9	2019-01-15	2019-01-17	2019-01-20	gotowka	750
38	2	102	9	2019-02-04	2019-02-08	2019-02-11	karta	3000
39	2	103	9	2019-02-11	2019-02-16	2019-02-21	karta	500
40	2	104	9	2019-02-12	2019-02-16	2019-02-17	karta	250
41	2	105	9	2019-02-12	2019-02-14	2019-02-19	karta	1250
42	2	106	9	2019-03-01	2019-03-03	2019-03-10	gotowka	700
43	2	107	9	2019-03-04	2019-03-06	2019-03-10	karta	400
44	2	108	9	2019-03-16	2019-03-21	2019-03-23	gotowka	500
45	2	109	9	2019-04-02	2019-04-05	2019-04-10	gotowka	1250
46	2	110	9	2019-04-04	2019-04-05	2019-04-12	gotowka	1750
47	2	111	9	2019-04-11	2019-04-13	2019-04-15	karta	1000
48	2	112	9	2019-05-15	2019-05-20	2019-05-24	karta	1000
49	2	113	9	2019-05-04	2019-05-07	2019-05-09	gotowka	2000
50	2	114	9	2019-05-14	2019-05-16	2019-05-18	karta	500
51	2	115	9	2019-05-09	2019-05-12	2019-05-16	karta	1000
52	2	116	9	2019-06-10	2019-06-12	2019-06-17	karta	5000
53	2	117	9	2019-06-08	2019-06-13	2019-06-18	gotowka	1250
54	2	118	9	2019-06-15	2019-06-17	2019-06-24	karta	1750
55	2	119	9	2019-06-12	2019-06-14	2019-06-15	gotowka	250
56	2	120	9	2019-07-05	2019-07-09	2019-07-16	gotowka	3500
57	2	121	9	2019-07-13	2019-07-17	2019-07-24	karta	700
58	2	122	9	2019-07-09	2019-07-12	2019-07-16	gotowka	400
59	2	123	9	2019-07-14	2019-07-15	2019-07-17	gotowka	1000
60	2	124	9	2019-07-03	2019-07-06	2019-07-09	gotowka	3000
61	2	125	9	2019-08-08	2019-08-10	2019-08-15	karta	2500
62	2	126	9	2019-08-11	2019-08-12	2019-08-17	karta	5000
63	2	127	9	2019-08-10	2019-08-12	2019-08-17	gotowka	2500
64	2	128	9	2019-08-13	2019-08-15	2019-08-22	gotowka	7000
65	2	129	9	2019-08-08	2019-08-11	2019-08-18	karta	700
66	2	130	9	2019-09-13	2019-09-16	2019-09-18	karta	500
67	2	131	9	2019-10-03	2019-10-07	2019-10-10	karta	750
68	2	132	9	2019-11-13	2019-11-15	2019-11-17	karta	2000
69	2	133	9	2019-12-04	2019-12-09	2019-12-10	gotowka	500
70	2	134	9	2019-12-03	2019-12-05	2019-12-12	gotowka	700
71	2	135	9	2019-12-05	2019-12-10	2019-12-15	karta	500
72	2	136	9	2019-12-09	2019-12-14	2019-12-19	karta	500
73	2	137	9	2019-12-10	2019-12-15	2019-12-17	karta	2000
74	2	138	9	2019-12-12	2019-12-15	2019-12-19	karta	4000
75	3	200	14	2019-01-10	2019-01-12	2019-01-19	gotowka	1750
76	3	201	14	2019-01-15	2019-01-16	2019-01-21	gotowka	5000
77	3	202	14	2019-02-04	2019-02-09	2019-02-15	karta	600
78	3	203	14	2019-02-11	2019-02-13	2019-02-20	karta	7000
79	3	204	14	2019-02-12	2019-02-15	2019-02-17	gotowka	500
80	3	205	14	2019-02-12	2019-02-14	2019-02-19	gotowka	1250
81	3	206	14	2019-03-01	2019-03-05	2019-03-09	karta	2000
82	3	207	14	2019-03-04	2019-03-07	2019-03-11	gotowka	1000
83	3	208	14	2019-03-16	2019-03-19	2019-03-21	karta	200
84	3	209	14	2019-04-02	2019-04-03	2019-04-07	karta	1000
85	3	210	14	2019-04-04	2019-04-06	2019-04-11	gotowka	1250
86	3	211	14	2019-04-11	2019-04-12	2019-04-13	karta	1000
87	3	212	14	2019-05-15	2019-05-17	2019-05-24	gotowka	1750
88	3	213	14	2019-05-04	2019-05-08	2019-05-14	gotowka	600
89	3	214	14	2019-05-14	2019-05-17	2019-05-21	gotowka	4000
90	3	215	14	2019-05-09	2019-05-12	2019-05-13	karta	250
91	3	216	14	2019-06-10	2019-06-12	2019-06-17	gotowka	1250
92	3	217	14	2019-06-08	2019-06-10	2019-06-13	karta	300
93	3	218	14	2019-06-15	2019-06-19	2019-06-25	gotowka	1500
94	3	219	14	2019-06-12	2019-06-13	2019-06-20	karta	1750
95	3	220	14	2019-07-05	2019-07-06	2019-07-09	karta	300
96	3	221	14	2019-07-13	2019-07-16	2019-07-23	karta	1750
97	3	222	14	2019-07-09	2019-07-10	2019-07-12	karta	1000
98	3	223	14	2019-07-14	2019-07-16	2019-07-18	gotowka	1000
99	3	224	14	2019-07-03	2019-07-05	2019-07-06	karta	500
100	3	225	14	2019-08-08	2019-08-09	2019-08-16	gotowka	1750
101	3	226	14	2019-08-11	2019-08-12	2019-08-19	karta	7000
102	3	227	14	2019-08-10	2019-08-11	2019-08-14	gotowka	1500
103	3	228	14	2019-08-13	2019-08-18	2019-08-21	gotowka	3000
104	3	229	14	2019-08-08	2019-08-11	2019-08-15	gotowka	400
105	3	230	14	2019-09-13	2019-09-18	2019-09-21	gotowka	300
106	3	231	14	2019-10-03	2019-10-08	2019-10-14	karta	600
107	3	232	14	2019-11-13	2019-11-18	2019-11-23	gotowka	1250
108	3	233	14	2019-12-04	2019-12-06	2019-12-10	gotowka	2000
109	3	234	14	2019-12-03	2019-12-06	2019-12-09	karta	750
110	4	300	24	2019-01-08	2019-01-09	2019-01-11	karta	500
111	4	301	24	2019-01-07	2019-01-12	2019-01-14	karta	500
112	4	302	23	2019-01-02	2019-01-03	2019-01-09	karta	3000
113	4	303	23	2019-01-04	2019-01-06	2019-01-12	karta	600
114	4	304	24	2019-01-04	2019-01-06	2019-01-09	karta	1500
115	4	305	23	2019-01-12	2019-01-13	2019-01-20	karta	3500
116	4	306	23	2019-01-12	2019-01-15	2019-01-17	karta	2000
117	4	307	23	2019-01-04	2019-01-07	2019-01-14	karta	1750
118	4	308	24	2019-01-03	2019-01-08	2019-01-11	gotowka	750
119	4	309	23	2019-01-11	2019-01-16	2019-01-23	gotowka	1750
120	4	310	24	2019-02-09	2019-02-14	2019-02-16	gotowka	1000
121	4	311	24	2019-02-01	2019-02-05	2019-02-06	gotowka	250
122	4	312	24	2019-02-09	2019-02-10	2019-02-16	karta	3000
123	4	313	24	2019-02-09	2019-02-12	2019-02-16	gotowka	1000
124	4	314	23	2019-02-08	2019-02-13	2019-02-16	gotowka	750
125	4	315	24	2019-02-01	2019-02-02	2019-02-04	gotowka	500
126	4	316	23	2019-03-02	2019-03-03	2019-03-09	gotowka	6000
127	4	317	24	2019-03-10	2019-03-14	2019-03-19	karta	1250
128	4	318	23	2019-03-12	2019-03-13	2019-03-16	karta	750
129	4	319	24	2019-03-07	2019-03-11	2019-03-17	karta	1500
130	4	320	24	2019-03-07	2019-03-11	2019-03-13	gotowka	1000
131	4	321	23	2019-03-03	2019-03-06	2019-03-08	gotowka	500
132	4	322	23	2019-03-07	2019-03-10	2019-03-14	gotowka	1000
133	4	323	24	2019-04-12	2019-04-15	2019-04-18	karta	1500
134	4	324	23	2019-04-01	2019-04-02	2019-04-03	karta	100
135	4	325	24	2019-04-06	2019-04-08	2019-04-15	karta	1750
136	4	326	23	2019-04-05	2019-04-10	2019-04-12	gotowka	500
137	4	327	23	2019-04-09	2019-04-13	2019-04-19	karta	6000
138	4	328	24	2019-04-02	2019-04-05	2019-04-06	gotowka	250
139	4	329	24	2019-04-02	2019-04-05	2019-04-10	gotowka	1250
140	4	330	23	2019-04-09	2019-04-12	2019-04-15	karta	750
141	4	331	23	2019-05-11	2019-05-15	2019-05-21	karta	1500
142	4	332	24	2019-05-10	2019-05-14	2019-05-20	gotowka	1500
143	4	333	23	2019-05-01	2019-05-05	2019-05-12	karta	1750
144	4	334	24	2019-05-08	2019-05-11	2019-05-13	karta	500
145	4	335	24	2019-05-06	2019-05-07	2019-05-10	gotowka	3000
146	4	336	24	2019-05-06	2019-05-10	2019-05-14	gotowka	2000
147	4	337	24	2019-05-01	2019-05-03	2019-05-08	karta	2500
148	4	338	24	2019-06-10	2019-06-12	2019-06-14	gotowka	500
149	4	339	23	2019-06-11	2019-06-12	2019-06-17	karta	500
150	4	340	24	2019-06-07	2019-06-09	2019-06-16	karta	1750
151	4	341	23	2019-06-03	2019-06-04	2019-06-09	karta	1250
152	4	342	23	2019-06-08	2019-06-13	2019-06-15	karta	1000
153	4	343	23	2019-06-12	2019-06-14	2019-06-17	gotowka	300
154	4	344	24	2019-06-06	2019-06-08	2019-06-14	karta	600
155	4	345	23	2019-06-10	2019-06-15	2019-06-16	karta	1000
156	4	346	23	2019-06-04	2019-06-05	2019-06-08	karta	750
157	4	347	23	2019-06-08	2019-06-09	2019-06-14	gotowka	1250
158	4	348	23	2019-07-01	2019-07-03	2019-07-09	karta	1500
159	4	349	23	2019-07-08	2019-07-09	2019-07-15	gotowka	3000
160	4	350	23	2019-07-11	2019-07-13	2019-07-18	karta	500
161	4	351	23	2019-07-09	2019-07-13	2019-07-17	karta	400
162	4	352	24	2019-07-06	2019-07-10	2019-07-16	gotowka	600
163	4	353	23	2019-07-02	2019-07-07	2019-07-11	karta	400
164	4	354	24	2019-07-09	2019-07-12	2019-07-18	karta	6000
165	4	355	24	2019-07-02	2019-07-03	2019-07-05	gotowka	200
166	4	356	23	2019-07-07	2019-07-10	2019-07-12	karta	200
167	4	357	23	2019-07-04	2019-07-06	2019-07-07	gotowka	250
168	4	358	23	2019-07-04	2019-07-05	2019-07-06	gotowka	250
169	4	359	24	2019-07-07	2019-07-08	2019-07-13	gotowka	2500
170	4	360	23	2019-08-02	2019-08-04	2019-08-07	gotowka	750
171	4	361	23	2019-08-03	2019-08-04	2019-08-06	karta	2000
172	4	362	23	2019-08-09	2019-08-12	2019-08-18	gotowka	6000
173	4	363	23	2019-08-11	2019-08-12	2019-08-18	karta	1500
174	4	364	24	2019-08-11	2019-08-12	2019-08-13	karta	500
175	4	365	24	2019-08-05	2019-08-07	2019-08-11	karta	400
176	4	366	24	2019-08-05	2019-08-10	2019-08-12	gotowka	500
177	4	367	23	2019-08-03	2019-08-05	2019-08-09	karta	4000
178	4	368	23	2019-08-06	2019-08-09	2019-08-16	karta	1750
179	4	369	23	2019-08-11	2019-08-15	2019-08-19	karta	4000
180	4	370	23	2019-08-05	2019-08-07	2019-08-11	gotowka	400
181	4	371	23	2019-08-01	2019-08-03	2019-08-08	karta	5000
182	4	372	24	2019-08-01	2019-08-03	2019-08-08	karta	1250
183	4	373	24	2019-08-09	2019-08-14	2019-08-19	gotowka	5000
184	4	374	23	2019-08-02	2019-08-03	2019-08-09	karta	1500
185	4	375	23	2019-09-05	2019-09-09	2019-09-16	karta	7000
186	4	376	24	2019-09-12	2019-09-15	2019-09-18	karta	750
187	4	377	24	2019-09-05	2019-09-07	2019-09-10	karta	750
188	4	378	24	2019-09-02	2019-09-03	2019-09-09	karta	6000
189	4	379	23	2019-10-06	2019-10-08	2019-10-14	karta	3000
190	4	380	24	2019-10-12	2019-10-13	2019-10-19	gotowka	1500
191	4	381	23	2019-10-02	2019-10-06	2019-10-11	karta	5000
192	4	382	24	2019-11-05	2019-11-10	2019-11-13	gotowka	750
193	4	383	23	2019-11-01	2019-11-03	2019-11-07	karta	1000
194	4	384	24	2019-11-07	2019-11-08	2019-11-12	karta	1000
195	4	385	24	2019-11-07	2019-11-10	2019-11-14	karta	2000
196	4	386	23	2019-11-01	2019-11-04	2019-11-11	gotowka	1750
197	4	387	23	2019-11-07	2019-11-09	2019-11-12	gotowka	750
198	4	388	23	2019-11-11	2019-11-12	2019-11-17	karta	500
199	4	389	23	2019-11-04	2019-11-08	2019-11-11	gotowka	750
200	4	390	24	2019-12-09	2019-12-11	2019-12-17	karta	1500
201	4	391	24	2019-12-07	2019-12-11	2019-12-12	gotowka	250
202	4	392	23	2019-12-12	2019-12-16	2019-12-19	gotowka	750
203	4	393	24	2019-12-12	2019-12-15	2019-12-21	karta	6000
204	4	394	24	2019-12-02	2019-12-03	2019-12-09	gotowka	600
205	4	395	24	2019-12-09	2019-12-13	2019-12-15	gotowka	1000
206	4	396	24	2019-12-12	2019-12-13	2019-12-17	gotowka	1000
207	4	397	24	2019-12-05	2019-12-08	2019-12-09	gotowka	1000
208	4	398	23	2019-12-08	2019-12-11	2019-12-14	gotowka	750
209	4	399	23	2019-12-10	2019-12-11	2019-12-17	gotowka	600
210	5	400	34	2019-01-01	2019-01-03	2019-01-08	karta	1250
211	5	401	34	2019-01-08	2019-01-10	2019-01-11	karta	100
212	5	402	34	2019-01-12	2019-01-17	2019-01-24	karta	1750
213	5	403	34	2019-01-09	2019-01-10	2019-01-13	gotowka	300
214	5	404	33	2019-02-03	2019-02-06	2019-02-10	karta	1000
215	5	405	34	2019-02-01	2019-02-04	2019-02-07	gotowka	750
216	5	406	34	2019-02-11	2019-02-15	2019-02-16	karta	1000
217	5	407	33	2019-02-06	2019-02-11	2019-02-13	karta	1000
218	5	408	34	2019-02-12	2019-02-17	2019-02-22	karta	5000
219	5	409	34	2019-03-11	2019-03-12	2019-03-16	karta	400
220	5	410	33	2019-03-06	2019-03-10	2019-03-15	karta	1250
221	5	411	33	2019-03-11	2019-03-13	2019-03-16	karta	300
222	5	412	34	2019-03-03	2019-03-04	2019-03-07	karta	1500
223	5	413	33	2019-03-06	2019-03-08	2019-03-13	karta	5000
224	5	414	34	2019-04-10	2019-04-12	2019-04-15	karta	1500
225	5	415	33	2019-04-12	2019-04-14	2019-04-17	gotowka	750
226	5	416	33	2019-04-08	2019-04-11	2019-04-14	karta	750
227	5	417	33	2019-05-06	2019-05-09	2019-05-14	karta	1250
228	5	418	34	2019-05-04	2019-05-08	2019-05-12	gotowka	4000
229	5	419	34	2019-05-11	2019-05-15	2019-05-18	karta	750
230	5	420	33	2019-05-06	2019-05-07	2019-05-14	karta	3500
231	5	421	33	2019-05-06	2019-05-08	2019-05-09	karta	500
232	5	422	33	2019-05-10	2019-05-11	2019-05-18	karta	3500
233	5	423	34	2019-06-10	2019-06-15	2019-06-19	gotowka	4000
234	5	424	33	2019-06-08	2019-06-10	2019-06-11	gotowka	250
235	5	425	33	2019-06-05	2019-06-09	2019-06-15	karta	600
236	5	426	33	2019-06-07	2019-06-10	2019-06-13	gotowka	750
237	5	427	34	2019-06-10	2019-06-14	2019-06-19	gotowka	1250
238	5	428	33	2019-07-06	2019-07-11	2019-07-12	gotowka	500
239	5	429	33	2019-07-05	2019-07-09	2019-07-14	karta	5000
240	5	430	33	2019-07-12	2019-07-17	2019-07-18	gotowka	1000
241	5	431	33	2019-07-06	2019-07-09	2019-07-10	gotowka	500
242	5	432	33	2019-07-10	2019-07-14	2019-07-17	gotowka	3000
243	5	433	34	2019-08-12	2019-08-15	2019-08-16	karta	500
244	5	434	33	2019-08-06	2019-08-10	2019-08-14	karta	1000
245	5	435	33	2019-08-05	2019-08-06	2019-08-11	gotowka	1250
246	5	436	34	2019-08-08	2019-08-10	2019-08-15	gotowka	1250
247	5	437	34	2019-08-08	2019-08-10	2019-08-11	gotowka	250
248	5	438	33	2019-08-03	2019-08-07	2019-08-10	karta	750
249	5	439	33	2019-09-07	2019-09-12	2019-09-14	gotowka	500
250	5	440	34	2019-09-04	2019-09-05	2019-09-11	karta	600
251	5	441	33	2019-09-10	2019-09-15	2019-09-19	karta	1000
252	5	442	34	2019-10-05	2019-10-06	2019-10-12	gotowka	1500
253	5	443	34	2019-11-08	2019-11-10	2019-11-12	gotowka	2000
254	5	444	34	2019-12-07	2019-12-12	2019-12-15	karta	750
255	5	445	33	2019-12-07	2019-12-09	2019-12-15	gotowka	1500
256	5	446	34	2019-12-06	2019-12-11	2019-12-12	karta	1000
257	5	447	33	2019-12-05	2019-12-10	2019-12-16	karta	6000
258	5	448	34	2019-12-04	2019-12-08	2019-12-13	gotowka	5000
259	5	449	33	2019-12-09	2019-12-10	2019-12-14	karta	1000
260	5	450	34	2019-12-10	2019-12-15	2019-12-16	gotowka	1000
\.


--
-- Data for Name: rezerwacje_pokoi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rezerwacje_pokoi (pok_rez_id, pok_id, rez_id) FROM stdin;
1	10	1
2	16	2
3	3	3
4	13	4
5	8	5
6	10	6
7	8	7
8	14	8
9	6	9
10	2	10
11	4	11
12	19	12
13	13	13
14	6	14
15	16	15
16	18	16
17	3	17
18	4	18
19	17	19
20	2	20
21	3	21
22	10	22
23	6	23
24	8	24
25	7	25
26	8	26
27	14	27
28	11	28
29	12	29
30	7	30
31	1	31
32	18	32
33	1	33
34	14	34
35	3	35
38	30	36
39	31	37
40	39	38
41	22	39
42	30	40
43	29	41
44	21	42
45	22	43
46	26	44
47	28	45
48	29	46
49	36	47
50	31	48
51	37	49
52	28	50
53	27	51
54	40	52
55	30	53
56	26	54
57	26	55
58	36	56
59	23	57
60	21	58
61	36	59
62	37	60
63	35	61
64	37	62
65	33	63
66	39	64
67	24	65
68	31	66
69	26	67
70	39	68
71	34	69
72	22	70
73	22	71
74	23	72
75	40	73
76	38	74
77	45	75
78	59	76
79	43	77
80	57	78
81	51	79
82	46	80
83	56	81
84	45	82
85	44	83
86	51	84
87	46	85
88	60	86
89	49	87
90	44	88
91	57	89
92	48	90
93	45	91
94	44	92
95	50	93
96	51	94
97	44	95
98	47	96
99	56	97
100	56	98
101	56	99
102	45	100
103	59	101
104	54	102
105	60	103
106	44	104
107	42	105
108	42	106
109	47	107
110	54	108
111	48	109
112	76	110
113	74	111
114	97	112
115	71	113
116	99	114
117	100	115
118	117	116
119	93	117
120	79	118
121	85	119
122	106	120
123	89	121
124	103	122
125	94	123
126	81	124
127	88	125
128	114	126
129	73	127
130	90	128
131	74	129
132	105	130
133	84	131
134	94	132
135	107	133
136	63	134
137	87	135
138	76	136
139	113	137
140	79	138
141	73	139
142	82	140
143	81	141
144	91	142
145	75	143
146	82	144
147	112	145
148	107	146
149	105	147
150	73	148
151	67	149
152	75	150
153	79	151
154	100	152
155	64	153
156	63	154
157	111	155
158	91	156
159	91	157
160	90	158
161	107	159
162	71	160
163	62	161
164	62	162
165	66	163
166	114	164
167	70	165
168	68	166
169	85	167
170	73	168
171	106	169
172	81	170
173	119	171
174	119	172
175	86	173
176	102	174
177	70	175
178	94	176
179	112	177
180	91	178
181	113	179
182	72	180
183	111	181
184	73	182
185	119	183
186	77	184
187	111	185
188	85	186
189	94	187
190	111	188
191	107	189
192	95	190
193	109	191
194	84	192
195	89	193
196	76	194
197	97	195
198	87	196
199	75	197
200	61	198
201	91	199
202	84	200
203	85	201
204	78	202
205	116	203
206	61	204
207	102	205
208	73	206
209	113	207
210	87	208
211	63	209
212	134	210
213	126	211
214	135	212
215	125	213
216	142	214
217	143	215
218	158	216
219	147	217
220	153	218
221	122	219
222	130	220
223	123	221
224	147	222
225	157	223
226	145	224
227	129	225
228	135	226
229	136	227
230	155	228
231	137	229
232	148	230
233	147	231
234	149	232
235	154	233
236	130	234
237	128	235
238	129	236
239	134	237
240	149	238
241	158	239
242	159	240
243	147	241
244	153	242
245	148	243
246	134	244
247	142	245
248	137	246
249	140	247
250	130	248
251	137	249
252	123	250
253	142	251
254	144	252
255	159	253
256	144	254
257	143	255
258	156	256
259	153	257
260	156	258
261	129	259
262	154	260
\.


--
-- Data for Name: stanowisko; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stanowisko (stan_id, stan_nazwa, stan_opis) FROM stdin;
1	Portier	Portier pomaga gościom, parkuje samochody.
2	Pokojówka	Jest odpowiedzialny za utrzymanie czystości.
3	Recepcjonista	Pracuje z reguły na dwie zmiany: 6-15, 15-23. 
4	Dyrektor	Kierownik hotelu
\.


--
-- Data for Name: typ_pokoju; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.typ_pokoju (typ_pok_id, typ_pok_nazwa, typ_pok_koszt, typ_pok_opis, typ_pok_palenie, typ_pok_zwierzeta) FROM stdin;
1	1-osobowy	100	Sypialnia, łazienka	f	f
2	2-osobowy	250	Sypialnia, kuchnia, łazienka	f	f
3	3-osobowy	500	Dwie Sypialnie, kuchnia, łazienka	f	t
4	Apartament	1000	Trzy Sypialnie, salon, kuchnia, łazienka	t	t
\.


--
-- Data for Name: uslugi_hotelowe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uslugi_hotelowe (uslug_id, uslug_nazwa, uslug_koszt) FROM stdin;
1	Podziemny parking strzeżony	25
2	Wypożyczanie roweru	40
3	Dodatkowe śniadanie	30
5	Korzystanie z jacuzzi	50
6	Taksówka hotelowa	100
7	Dodatkowego sejf	100
8	Kort tenisowy	50
9	Bilard	10
10	Sauna	50
11	Basen	30
4	Dodatkowe łóżko w pokoju	120
\.


--
-- Data for Name: uzyte_uslugi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.uzyte_uslugi (uzyt_id, uslug_id, rez_id) FROM stdin;
1	11	2
2	5	2
3	1	2
4	6	2
5	7	4
6	7	4
7	9	5
8	11	5
9	4	6
10	2	7
11	1	10
12	3	11
13	3	11
14	5	11
15	1	12
16	5	13
17	11	13
18	1	13
19	8	13
20	1	14
21	7	14
22	10	14
23	8	16
24	8	16
25	11	18
26	10	18
27	8	18
28	10	18
29	10	19
30	7	19
31	9	19
32	1	19
33	5	21
34	3	21
35	4	21
36	9	22
37	1	22
38	6	22
39	9	23
40	11	23
41	2	25
42	5	25
43	9	26
44	6	27
45	5	27
46	9	28
47	5	28
48	8	28
49	5	29
50	3	30
51	1	30
52	4	30
53	11	32
54	1	32
55	9	33
56	2	33
57	9	33
58	10	34
59	7	34
60	8	34
61	9	35
62	9	37
63	2	37
64	11	37
65	4	39
66	10	39
67	11	41
68	4	43
69	8	43
70	7	44
71	10	44
72	5	44
73	2	45
74	6	45
75	11	45
76	7	46
77	1	46
78	10	46
79	4	46
80	1	49
81	5	49
82	4	49
83	1	49
84	5	50
85	3	50
86	3	50
87	6	52
88	5	54
89	6	54
90	9	54
91	3	54
92	2	55
93	6	55
94	6	55
95	5	56
96	6	56
97	11	57
98	11	57
99	10	57
100	6	58
101	11	58
102	3	60
103	3	60
104	5	61
105	8	61
106	4	61
107	5	61
108	4	62
109	2	62
110	9	62
111	2	62
112	5	63
113	8	64
114	8	65
115	10	65
116	7	65
117	7	67
118	1	67
119	11	69
120	4	69
121	11	69
122	10	70
123	4	70
124	10	70
125	4	73
126	1	73
127	9	73
128	8	74
129	3	75
130	7	75
131	9	75
132	4	75
133	4	76
134	2	77
135	11	77
136	4	77
137	5	78
138	11	78
139	10	78
140	5	79
141	3	79
142	3	79
143	1	79
144	11	80
145	4	80
146	9	80
147	6	81
148	10	82
149	11	82
150	9	82
151	4	83
152	9	84
153	7	84
154	9	84
155	2	84
156	1	86
157	6	86
158	2	86
159	1	86
160	9	87
161	10	87
162	4	87
163	4	88
164	2	88
165	10	88
166	11	89
167	8	89
168	1	91
169	9	91
170	5	91
171	6	91
172	9	92
173	10	92
174	1	92
175	3	93
176	11	94
177	11	94
178	9	94
179	10	94
180	9	95
181	5	95
182	6	95
183	10	95
184	2	96
185	10	97
186	2	97
187	4	98
188	10	99
189	11	99
190	8	100
191	11	101
192	5	101
193	5	101
194	3	101
195	10	102
196	8	102
197	10	102
198	1	102
199	11	103
200	10	103
201	11	103
202	3	104
203	4	104
204	11	104
205	7	104
206	5	105
207	7	105
208	11	107
209	5	107
210	3	107
211	7	107
212	8	108
213	9	108
214	6	108
215	10	108
216	3	109
217	2	109
218	11	109
219	3	109
220	10	110
221	11	110
222	1	110
223	10	111
224	11	111
225	3	111
226	10	111
227	11	113
228	7	113
229	9	113
230	6	113
231	9	114
232	5	114
233	1	114
234	11	115
235	8	115
236	5	116
237	11	116
238	7	116
239	9	116
240	7	117
241	2	117
242	9	117
243	2	117
244	1	118
245	4	118
246	10	119
247	1	122
248	9	122
249	3	122
250	5	126
251	11	126
252	10	127
253	6	128
254	4	130
255	7	130
256	2	130
257	7	131
258	8	131
259	10	131
260	8	133
261	6	133
262	6	134
263	7	135
264	7	135
265	2	135
266	3	135
267	5	136
268	9	136
269	2	136
270	9	137
271	6	137
272	9	138
273	8	138
274	3	138
275	1	139
276	5	139
277	7	140
278	7	140
279	9	140
280	8	140
281	11	141
282	1	141
283	4	141
284	7	142
285	10	142
286	10	142
287	9	143
288	4	143
289	1	143
290	3	143
291	6	144
292	5	145
293	4	146
294	7	146
295	11	146
296	2	146
297	10	147
298	9	147
299	11	147
300	11	149
301	7	149
302	5	149
303	2	149
304	6	150
305	6	150
306	6	150
307	4	150
308	5	151
309	8	151
310	10	151
311	5	152
312	9	153
313	10	153
314	4	153
315	6	153
316	1	154
317	8	154
318	10	154
319	8	154
320	8	155
321	9	155
322	4	155
323	2	156
324	2	156
325	9	157
326	5	157
327	4	157
328	2	157
329	4	158
330	10	159
331	1	160
332	7	160
333	11	160
334	1	161
335	9	162
336	10	163
337	9	163
338	7	164
339	9	164
340	11	164
341	8	164
342	8	167
343	5	167
344	7	167
345	5	168
346	3	169
347	10	169
348	4	169
349	4	169
350	4	170
351	8	170
352	11	170
353	10	170
354	4	171
355	9	171
356	6	172
357	3	173
358	1	173
359	10	173
360	4	174
361	7	175
362	5	176
363	5	176
364	1	176
365	2	176
366	7	177
367	8	177
368	11	177
369	7	179
370	10	179
371	9	179
372	3	179
373	3	180
374	11	180
375	8	182
376	10	182
377	5	182
378	1	182
379	11	183
380	5	183
381	9	183
382	8	183
383	1	184
384	6	184
385	10	185
386	1	185
387	8	185
388	10	185
389	10	186
390	8	186
391	6	187
392	10	187
393	10	189
394	6	189
395	5	190
396	6	190
397	1	190
398	11	191
399	2	192
400	1	193
401	9	193
402	6	196
403	7	196
404	4	197
405	10	197
406	8	197
407	5	198
408	6	198
409	7	199
410	10	199
411	11	201
412	8	201
413	8	201
414	4	201
415	5	202
416	1	202
417	4	202
418	9	202
419	7	203
420	10	203
421	10	203
422	10	204
423	8	204
424	11	205
425	2	206
426	9	206
427	11	207
428	10	209
429	11	209
430	9	209
431	9	210
432	7	210
433	8	210
434	4	210
435	11	211
436	7	211
437	3	212
438	9	212
439	3	212
440	11	212
441	5	213
442	3	213
443	2	213
444	10	213
445	5	214
446	7	214
447	1	214
448	1	215
449	5	215
450	6	215
451	5	216
452	5	216
453	8	216
454	8	217
455	8	217
456	8	217
457	8	217
458	2	218
459	5	219
460	3	219
461	9	219
462	9	219
463	9	220
464	7	220
465	1	221
466	7	221
467	11	221
468	11	221
469	9	222
470	8	222
471	2	222
472	3	223
473	3	223
474	11	225
475	3	225
476	5	225
477	9	225
478	5	226
479	6	226
480	5	228
481	3	229
482	9	229
483	6	229
484	4	230
485	7	231
486	1	232
487	2	232
488	10	233
489	6	236
490	4	238
491	1	238
492	5	238
493	4	238
494	11	239
495	9	240
496	6	240
497	6	241
498	3	242
499	6	242
500	10	243
501	4	244
502	6	244
503	10	244
504	11	244
505	11	245
506	9	245
507	2	245
508	1	245
509	9	246
510	4	246
511	7	247
512	9	251
513	6	251
514	1	253
515	10	254
516	11	254
517	5	254
518	10	254
519	11	255
520	5	255
521	4	255
522	5	256
523	9	257
524	8	257
525	1	257
526	6	258
527	4	258
528	3	259
529	7	259
530	6	259
531	8	259
532	5	260
\.


--
-- Data for Name: znizka_pokoju; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.znizka_pokoju (znizka_pok_id, typ_pok_id, znizka_pok_ilosc) FROM stdin;
1	1	0
2	2	0
3	3	20
4	4	20
\.


--
-- Name: adresy_adres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adresy_adres_id_seq', 1, false);


--
-- Name: goscie_adres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goscie_adres_id_seq', 1, false);


--
-- Name: goscie_gosc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goscie_gosc_id_seq', 1, false);


--
-- Name: hotele_adres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotele_adres_id_seq', 1, false);


--
-- Name: hotele_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotele_hotel_id_seq', 1, false);


--
-- Name: hotele_ocena_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotele_ocena_id_seq', 1, false);


--
-- Name: ocena_ocena_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ocena_ocena_id_seq', 1, false);


--
-- Name: pokoje_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokoje_hotel_id_seq', 1, false);


--
-- Name: pokoje_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokoje_pok_id_seq', 1, false);


--
-- Name: pokoje_typ_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokoje_typ_pok_id_seq', 1, false);


--
-- Name: pracownicy_adres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pracownicy_adres_id_seq', 1, false);


--
-- Name: pracownicy_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pracownicy_hotel_id_seq', 1, false);


--
-- Name: pracownicy_prac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pracownicy_prac_id_seq', 1, false);


--
-- Name: pracownicy_stan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pracownicy_stan_id_seq', 1, false);


--
-- Name: rezerwacje_gosc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_gosc_id_seq', 1, false);


--
-- Name: rezerwacje_hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_hotel_id_seq', 1, false);


--
-- Name: rezerwacje_pokoi_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_pokoi_pok_id_seq', 1, false);


--
-- Name: rezerwacje_pokoi_pok_rez_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_pokoi_pok_rez_id_seq', 1, false);


--
-- Name: rezerwacje_pokoi_rez_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_pokoi_rez_id_seq', 1, false);


--
-- Name: rezerwacje_prac_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_prac_id_seq', 1, false);


--
-- Name: rezerwacje_rez_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rezerwacje_rez_id_seq', 1, false);


--
-- Name: stanowisko_stan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stanowisko_stan_id_seq', 1, false);


--
-- Name: typ_pokoju_typ_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.typ_pokoju_typ_pok_id_seq', 1, false);


--
-- Name: uslugi_hotelowe_uslug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uslugi_hotelowe_uslug_id_seq', 1, false);


--
-- Name: uzyte_uslugi_rez_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uzyte_uslugi_rez_id_seq', 1, false);


--
-- Name: uzyte_uslugi_uslug_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uzyte_uslugi_uslug_id_seq', 1, false);


--
-- Name: uzyte_uslugi_uzyt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uzyte_uslugi_uzyt_id_seq', 1, false);


--
-- Name: znizka_pokoju_typ_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.znizka_pokoju_typ_pok_id_seq', 1, false);


--
-- Name: znizka_pokoju_znizka_pok_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.znizka_pokoju_znizka_pok_id_seq', 1, false);


--
-- Name: adresy adresy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adresy
    ADD CONSTRAINT adresy_pkey PRIMARY KEY (adres_id);


--
-- Name: goscie goscie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goscie
    ADD CONSTRAINT goscie_pkey PRIMARY KEY (gosc_id);


--
-- Name: hotele hotele_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele
    ADD CONSTRAINT hotele_pkey PRIMARY KEY (hotel_id);


--
-- Name: ocena ocena_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ocena
    ADD CONSTRAINT ocena_pkey PRIMARY KEY (ocena_id);


--
-- Name: pokoje pokoje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT pokoje_pkey PRIMARY KEY (pok_id);


--
-- Name: pracownicy pracownicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT pracownicy_pkey PRIMARY KEY (prac_id);


--
-- Name: rezerwacje rezerwacje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_pkey PRIMARY KEY (rez_id);


--
-- Name: rezerwacje_pokoi rezerwacje_pokoi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi
    ADD CONSTRAINT rezerwacje_pokoi_pkey PRIMARY KEY (pok_rez_id);


--
-- Name: stanowisko stanowisko_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stanowisko
    ADD CONSTRAINT stanowisko_pkey PRIMARY KEY (stan_id);


--
-- Name: typ_pokoju typ_pokoju_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.typ_pokoju
    ADD CONSTRAINT typ_pokoju_pkey PRIMARY KEY (typ_pok_id);


--
-- Name: uslugi_hotelowe uslugi_hotelowe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uslugi_hotelowe
    ADD CONSTRAINT uslugi_hotelowe_pkey PRIMARY KEY (uslug_id);


--
-- Name: uzyte_uslugi uzyte_uslugi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi
    ADD CONSTRAINT uzyte_uslugi_pkey PRIMARY KEY (uzyt_id);


--
-- Name: znizka_pokoju znizka_pokoju_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizka_pokoju
    ADD CONSTRAINT znizka_pokoju_pkey PRIMARY KEY (znizka_pok_id);


--
-- Name: goscie gosc_adres_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goscie
    ADD CONSTRAINT gosc_adres_fk FOREIGN KEY (adres_id) REFERENCES public.adresy(adres_id);


--
-- Name: hotele hotele_adres_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele
    ADD CONSTRAINT hotele_adres_fk FOREIGN KEY (adres_id) REFERENCES public.adresy(adres_id);


--
-- Name: hotele hotele_ocena_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotele
    ADD CONSTRAINT hotele_ocena_fk FOREIGN KEY (ocena_id) REFERENCES public.ocena(ocena_id);


--
-- Name: pokoje pokoje_hotel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT pokoje_hotel_fk FOREIGN KEY (hotel_id) REFERENCES public.hotele(hotel_id);


--
-- Name: pokoje pokoje_typ_pok_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT pokoje_typ_pok_fk FOREIGN KEY (typ_pok_id) REFERENCES public.typ_pokoju(typ_pok_id);


--
-- Name: pracownicy prac_adres_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT prac_adres_fk FOREIGN KEY (adres_id) REFERENCES public.adresy(adres_id);


--
-- Name: pracownicy prac_hotel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT prac_hotel_fk FOREIGN KEY (hotel_id) REFERENCES public.hotele(hotel_id);


--
-- Name: pracownicy prac_stano_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pracownicy
    ADD CONSTRAINT prac_stano_fk FOREIGN KEY (stan_id) REFERENCES public.stanowisko(stan_id);


--
-- Name: rezerwacje rezerwacje_gosc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_gosc_fk FOREIGN KEY (gosc_id) REFERENCES public.goscie(gosc_id);


--
-- Name: rezerwacje rezerwacje_hotel_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_hotel_fk FOREIGN KEY (hotel_id) REFERENCES public.hotele(hotel_id);


--
-- Name: rezerwacje_pokoi rezerwacje_pokoi_pok_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi
    ADD CONSTRAINT rezerwacje_pokoi_pok_fk FOREIGN KEY (pok_id) REFERENCES public.pokoje(pok_id);


--
-- Name: rezerwacje_pokoi rezerwacje_pokoi_rez_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje_pokoi
    ADD CONSTRAINT rezerwacje_pokoi_rez_fk FOREIGN KEY (rez_id) REFERENCES public.rezerwacje(rez_id);


--
-- Name: rezerwacje rezerwacje_prac_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_prac_fk FOREIGN KEY (prac_id) REFERENCES public.pracownicy(prac_id);


--
-- Name: uzyte_uslugi uzyte_uslugi_rez_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi
    ADD CONSTRAINT uzyte_uslugi_rez_fk FOREIGN KEY (rez_id) REFERENCES public.rezerwacje(rez_id);


--
-- Name: uzyte_uslugi uzyte_uslugi_uslug_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uzyte_uslugi
    ADD CONSTRAINT uzyte_uslugi_uslug_fk FOREIGN KEY (uslug_id) REFERENCES public.uslugi_hotelowe(uslug_id);


--
-- Name: znizka_pokoju znizka_pokoju_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.znizka_pokoju
    ADD CONSTRAINT znizka_pokoju_fk FOREIGN KEY (typ_pok_id) REFERENCES public.typ_pokoju(typ_pok_id);


--
-- Name: trans; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: postgres
--

REFRESH MATERIALIZED VIEW public.trans;


--
-- PostgreSQL database dump complete
--

