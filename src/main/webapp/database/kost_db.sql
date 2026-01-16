--
-- PostgreSQL database dump
--

\restrict FnXk8uA5WUIQYu7Cl8ew4JOVpEWVS7OzkHtUcZsiKxx7Oe7tZdsQHHCHCsRHiuv

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-01-16 19:21:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 229 (class 1255 OID 16554)
-- Name: buat_pembayaran_otomatis(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.buat_pembayaran_otomatis() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Menghitung total biaya: durasi dikalikan 500.000
    INSERT INTO pembayaran (pesanan_id, total_biaya, total_dibayar)
    VALUES (NEW.id, (NEW.durasi::INTEGER * 500000), 0);
    
    -- SANGAT PENTING: Harus mengembalikan data NEW agar proses simpan pesanan berhasil
    RETURN NEW; 
END;
$$;


ALTER FUNCTION public.buat_pembayaran_otomatis() OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16517)
-- Name: kost_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kost_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16494)
-- Name: kost; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kost (
    id integer DEFAULT nextval('public.kost_id_seq'::regclass) NOT NULL,
    nama_kost character varying(100)
);


ALTER TABLE public.kost OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16500)
-- Name: lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokasi (
    id integer NOT NULL,
    nama character varying(100)
);


ALTER TABLE public.lokasi OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16519)
-- Name: lokasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lokasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lokasi_id_seq OWNER TO postgres;

--
-- TOC entry 5063 (class 0 OID 0)
-- Dependencies: 226
-- Name: lokasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lokasi_id_seq OWNED BY public.lokasi.id;


--
-- TOC entry 228 (class 1259 OID 16537)
-- Name: pembayaran; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pembayaran (
    id integer NOT NULL,
    pesanan_id integer NOT NULL,
    total_biaya numeric(12,2) NOT NULL,
    total_dibayar numeric(12,2) DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pembayaran OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16536)
-- Name: pembayaran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pembayaran_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pembayaran_id_seq OWNER TO postgres;

--
-- TOC entry 5064 (class 0 OID 0)
-- Dependencies: 227
-- Name: pembayaran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pembayaran_id_seq OWNED BY public.pembayaran.id;


--
-- TOC entry 222 (class 1259 OID 16479)
-- Name: pesanan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pesanan (
    id integer NOT NULL,
    nama character varying(100) NOT NULL,
    no_hp character varying(20) NOT NULL,
    jenis_kost character varying(50) NOT NULL,
    lokasi character varying(100) NOT NULL,
    tanggal_masuk date NOT NULL,
    durasi integer NOT NULL,
    username character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'Dibooking'::character varying
);


ALTER TABLE public.pesanan OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16478)
-- Name: pesanan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pesanan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pesanan_id_seq OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 0)
-- Dependencies: 221
-- Name: pesanan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pesanan_id_seq OWNED BY public.pesanan.id;


--
-- TOC entry 220 (class 1259 OID 16434)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    nama character varying(100),
    role character varying(20) DEFAULT 'user'::character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16433)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 5066 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4883 (class 2604 OID 16520)
-- Name: lokasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasi ALTER COLUMN id SET DEFAULT nextval('public.lokasi_id_seq'::regclass);


--
-- TOC entry 4884 (class 2604 OID 16540)
-- Name: pembayaran id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran ALTER COLUMN id SET DEFAULT nextval('public.pembayaran_id_seq'::regclass);


--
-- TOC entry 4879 (class 2604 OID 16482)
-- Name: pesanan id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesanan ALTER COLUMN id SET DEFAULT nextval('public.pesanan_id_seq'::regclass);


--
-- TOC entry 4877 (class 2604 OID 16437)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5052 (class 0 OID 16494)
-- Dependencies: 223
-- Data for Name: kost; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kost (id, nama_kost) FROM stdin;
1	Kost Putra
2	Kost Putri
\.


--
-- TOC entry 5053 (class 0 OID 16500)
-- Dependencies: 224
-- Data for Name: lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokasi (id, nama) FROM stdin;
3	Depok
4	Bandung
5	Tangerang
6	bekasi
2	jakarta
1	Bogor
\.


--
-- TOC entry 5057 (class 0 OID 16537)
-- Dependencies: 228
-- Data for Name: pembayaran; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pembayaran (id, pesanan_id, total_biaya, total_dibayar, created_at) FROM stdin;
1	1	500000.00	500000.00	2026-01-14 18:42:58.303645
2	2	2000000.00	2000000.00	2026-01-14 18:42:58.303645
4	4	2000000.00	0.00	2026-01-14 19:08:37.374508
5	10	3000000.00	0.00	2026-01-14 19:08:37.374508
10	15	1000000.00	9100000.00	2026-01-14 19:43:34.662519
7	12	4500000.00	4500000.00	2026-01-14 19:08:37.374508
6	11	4500000.00	45000000.00	2026-01-14 19:08:37.374508
11	16	4000000.00	0.00	2026-01-15 11:47:03.71118
12	17	500000.00	500000.00	2026-01-16 13:00:03.948452
13	18	2500000.00	1000000.00	2026-01-16 15:33:50.721564
\.


--
-- TOC entry 5051 (class 0 OID 16479)
-- Dependencies: 222
-- Data for Name: pesanan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pesanan (id, nama, no_hp, jenis_kost, lokasi, tanggal_masuk, durasi, username, created_at, status) FROM stdin;
1	MUHAMAD ROZI	0888898	Putra	bogor	2026-01-02	1	Guest	2026-01-02 06:34:41.721557	Dibooking
2	biyao	0888898	Putra	bekasi	2026-01-01	4	Guest	2026-01-04 11:39:34.825623	Dibooking
4	zhang	088678798	Putra	jakarta	2026-01-02	4	Guest	2026-01-04 12:41:39.106088	Dibooking
10	Dono	088978867	Putra	bandung	2026-04-13	6	Guest	2026-01-13 14:25:03.23179	DIBOOKING
11	Muhamad Danial	0899999999	Putra	bandung	2026-03-13	9	Guest	2026-01-14 18:54:48.177991	DIBOOKING
12	Dani	09989799	Putri	depok	2026-11-13	9	Guest	2026-01-14 18:59:23.565333	DIBOOKING
15	Balya	081388613711	Putra	tangerang	2026-02-03	2	Guest	2026-01-14 19:43:34.662519	\N
16	syifa zakia	08888867768	Putri	tangerang	2026-01-15	8	Guest	2026-01-15 11:47:03.71118	\N
17	bbg	0895706420101	Putra	jakarta	2026-03-15	1	Guest	2026-01-16 13:00:03.948452	\N
18	zaqia	08885678	Putri	bekasi	2026-01-16	5	Guest	2026-01-16 15:33:50.721564	\N
\.


--
-- TOC entry 5049 (class 0 OID 16434)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, nama, role) FROM stdin;
1	admin	admin123	Administrator	admin
2	user	user123	User Biasa	user
3	biyao	biyao123	biyao	user
4	lolo	lo123	lolo	user
5	syifa	syifa123	syifa	user
6	nabi 	nabi123	nabi 	user
7	zaqia	zaqia123	zaqia	user
\.


--
-- TOC entry 5067 (class 0 OID 0)
-- Dependencies: 225
-- Name: kost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kost_id_seq', 7, true);


--
-- TOC entry 5068 (class 0 OID 0)
-- Dependencies: 226
-- Name: lokasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lokasi_id_seq', 8, true);


--
-- TOC entry 5069 (class 0 OID 0)
-- Dependencies: 227
-- Name: pembayaran_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pembayaran_id_seq', 13, true);


--
-- TOC entry 5070 (class 0 OID 0)
-- Dependencies: 221
-- Name: pesanan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pesanan_id_seq', 18, true);


--
-- TOC entry 5071 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 7, true);


--
-- TOC entry 4894 (class 2606 OID 16499)
-- Name: kost kost_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kost
    ADD CONSTRAINT kost_pkey PRIMARY KEY (id);


--
-- TOC entry 4896 (class 2606 OID 16505)
-- Name: lokasi lokasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasi
    ADD CONSTRAINT lokasi_pkey PRIMARY KEY (id);


--
-- TOC entry 4898 (class 2606 OID 16547)
-- Name: pembayaran pembayaran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT pembayaran_pkey PRIMARY KEY (id);


--
-- TOC entry 4892 (class 2606 OID 16493)
-- Name: pesanan pesanan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pesanan
    ADD CONSTRAINT pesanan_pkey PRIMARY KEY (id);


--
-- TOC entry 4888 (class 2606 OID 16442)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4890 (class 2606 OID 16444)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4900 (class 2620 OID 16555)
-- Name: pesanan trg_setelah_pesan; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_setelah_pesan AFTER INSERT ON public.pesanan FOR EACH ROW EXECUTE FUNCTION public.buat_pembayaran_otomatis();


--
-- TOC entry 4899 (class 2606 OID 16548)
-- Name: pembayaran fk_pesanan; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pembayaran
    ADD CONSTRAINT fk_pesanan FOREIGN KEY (pesanan_id) REFERENCES public.pesanan(id) ON DELETE CASCADE;


-- Completed on 2026-01-16 19:21:15

--
-- PostgreSQL database dump complete
--

\unrestrict FnXk8uA5WUIQYu7Cl8ew4JOVpEWVS7OzkHtUcZsiKxx7Oe7tZdsQHHCHCsRHiuv

