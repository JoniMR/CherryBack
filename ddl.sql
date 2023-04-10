--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-21 10:38:54

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
-- TOC entry 3337 (class 1262 OID 16464)
-- Name: crypto; Type: DATABASE; Schema: -; Owner: Admin
--
-- COMENTADO PARA HACER PRUEBAS (DESCOMENTAR AL IMPLANTAR DOCKER)
-- CREATE DATABASE crypto WITH TEMPLATE = template0 ENCODING = 'UTF8';
--
-- CREATE ROLE admin WITH
--  LOGIN
--  SUPERUSER
--  INHERIT
--  CREATEDB
--  CREATEROLE
--  REPLICATION
--  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:LHcQUFjhQwf27lOJjluILg==$7HEOtl27HY9EkQFPBbBbeFsGDl7aNOpBgbiWBC4aiFI=:hTvC8H7SGnIGhe03b22UDvwN5SoJP5J0CrmDY+/cLTE=';
--
--GRANT pg_read_all_data, pg_write_all_data TO admin WITH ADMIN OPTION;
--

ALTER DATABASE crypto OWNER TO admin;

-- \connect crypto

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

CREATE SCHEMA "cherrytrade";

ALTER SCHEMA "cherrytrade" OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16471)
-- Name: crypto; Type: TABLE; Schema: cherrytrade; Owner: Admin
--

CREATE TABLE cherrytrade.cryptos (
    crypto_id uuid NOT NULL,
    name character varying(50) NOT NULL,
    value numeric(50,2) NOT NULL,
    icon character varying(255),
    asset character varying(10) NOT NULL,
    stock numeric(50,0) NOT NULL,
    category character varying(50) NOT NULL
);


ALTER TABLE cherrytrade.cryptos OWNER TO admin;

--
-- TOC entry 214 (class 1259 OID 16465)
-- Name: users; Type: TABLE; Schema: cherrytrade; Owner: Admin
--

CREATE TABLE cherrytrade.users (
    user_id uuid NOT NULL,
    password character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    name character varying(50) NOT NULL,
    surname1 character varying(50) NOT NULL,
    surname2 character varying(50),
    birthdate date NOT NULL,
    img character varying DEFAULT 'https://res.cloudinary.com/datafgjir/image/upload/v1681165490/user_r37oxf.png' NOT NULL,
    funds numeric(10,0) DEFAULT '0'::numeric
);


ALTER TABLE cherrytrade.users OWNER TO admin;

--
-- TOC entry 216 (class 1259 OID 16476)
-- Name: users_cryptos; Type: TABLE; Schema: cherrytrade; Owner: Admin
--

CREATE TABLE cherrytrade.users_cryptos (
    user_id uuid NOT NULL,
    crypto_id uuid NOT NULL,
    amount numeric(50,2) NOT NULL
);


ALTER TABLE cherrytrade.users_cryptos OWNER TO admin;

--
-- TOC entry 3330 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: crypto; Type: TABLE DATA; Schema: cherrytrade; Owner: Admin
--



--
-- TOC entry 3329 (class 0 OID 16465)
-- Dependencies: 214
-- Data for Name: users; Type: TABLE DATA; Schema: cherrytrade; Owner: Admin
--



--
-- TOC entry 3331 (class 0 OID 16476)
-- Dependencies: 216
-- Data for Name: users_cryptos; Type: TABLE DATA; Schema: cherrytrade; Owner: Admin
--



--
-- TOC entry 3184 (class 2606 OID 16475)
-- Name: crypto crypto_pkey; Type: CONSTRAINT; Schema: cherrytrade; Owner: Admin
--

ALTER TABLE ONLY cherrytrade.cryptos
    ADD CONSTRAINT crypto_pkey PRIMARY KEY (crypto_id);


--
-- TOC entry 3182 (class 2606 OID 16470)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: cherrytrade; Owner: Admin
--

ALTER TABLE ONLY cherrytrade.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3186 (class 2606 OID 16480)
-- Name: users_cryptos usr_crpt; Type: CONSTRAINT; Schema: cherrytrade; Owner: Admin
--

ALTER TABLE ONLY cherrytrade.users_cryptos
    ADD CONSTRAINT usr_crpt PRIMARY KEY (user_id, crypto_id);


-- Completed on 2023-03-21 10:38:54

--
-- PostgreSQL database dump complete
--

INSERT INTO cherrytrade.users (user_id, password, email, name, surname1, surname2, birthdate, funds) OVERRIDING SYSTEM VALUE VALUES ('236e9cb4-d8a8-47d0-819d-3d7de3e7b5ee', 'admin', 'admin@cherrytrade.com', 'Jonathan', 'Martín', 'Rodríguez', '31/01/1991', 1000);
INSERT INTO cherrytrade.users (user_id, password, email, name, surname1, surname2, birthdate, img, funds) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', 'elon', 'elon@tesla.com', 'Elon', 'Reeve', 'Musk', '28/06/1971', 'https://res.cloudinary.com/datafgjir/image/upload/v1681166126/Elon_Musk_Royal_Society__crop2_h0gfnc.jpg' , 50000);
INSERT INTO cherrytrade.users (user_id, password, email, name, surname1, surname2, birthdate, img, funds) OVERRIDING SYSTEM VALUE VALUES ('9efedc91-dae2-4e7f-a12a-0ac7d83175ff', 'trump', 'trump@america.com', 'Donald', 'John', 'Trump', '14/06/1946', 'https://res.cloudinary.com/datafgjir/image/upload/v1681166283/Donald_Trump_official_portrait_gfr2qz.jpg' , 100);

INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('18a60c12-2358-49ae-a1c1-986e2f299e25', 'Bitcoin', 29645.90, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166705/btc_g0kl8m.png', 'BTC', 296, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('f1aad756-90a9-467a-acdc-50cac85d385c', 'Ethereum', 1906.76, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166804/eth_xobeou.png', 'ETH', 190, 'NFT');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('b7d9782e-4f31-4d57-85b5-8815f6c485ed', 'Tether', 1, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166839/usdt_gzhdlo.png', 'USDT', 10000000, 'Stablecoin');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('936474b3-844e-4688-81d6-c2a7feee52a4', 'Binance Coin', 315.86, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166811/bnb_ulucyn.png', 'BNB', 31586, 'Metaverse');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('4eebc127-b2f5-4ef0-98ae-c1d5eaba16b2', 'USD Coin', 0.99, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166853/usdc_jrgsaw.png', 'USDC', 10000000, 'Stablecoin');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('57e1ae20-9c35-483e-8935-78e5f79c9997', 'Ripple', 0.52, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166867/xrp_kwpwk5.png', 'XRP', 20000000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('ae1b9094-a1e7-4ce1-b685-3a49f2aaedff', 'Cardano', 0.39, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166887/ada_tb3gqv.png', 'ADA', 24000000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('9565e265-f93a-4584-a4ad-2d9f7feed4c5', 'Dogecoin', 0.09, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166891/doge_du8lnp.png', 'DOGE', 300000000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('a350c205-b424-417f-b844-7067497b0af3', 'Polygon', 1.12, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166910/matic_wna4ix.png', 'MATIC', 9100000, 'NFT');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('215839d4-816f-49c9-b7e4-7842617b83be', 'Solana', 20.93, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166914/sol_xeysjb.png', 'SOL', 450000, 'Metaverse');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('9a772844-252d-49cc-924d-99a93d830837', 'Polkadot', 6.31, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166918/dot_ab4oew.png', 'DOT', 1500000, 'NFT');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('9417ee5c-6aa5-460a-b305-6a19f88541be', 'Litecoin', 94.18, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166960/ltc_zips6w.png', 'LTC', 95000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('d46ddb99-d133-462d-ac60-74ec4273670d', 'TRON', 0.07, 'https://res.cloudinary.com/datafgjir/image/upload/v1681166987/trx_m0apfw.png', 'TRX', 13000000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('cf3d48c3-5931-43c6-bd70-152725e7ea0f', 'Avalanche', 17.94, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167001/avax_udpfrw.png', 'AVAX', 500000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('33778185-6be0-4684-a895-29045d6d6416', 'Dai', 1, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167004/dai_kixuye.png', 'DAI', 10000000, 'Stablecoin');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('34152bb2-956b-44c0-a922-67a1580100aa', 'Wrapped Bitcoin', 29645.90, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167010/wbtc_aqftz5.png', 'WBTC', 296, 'NFT');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('8ddd3584-1995-454c-8771-083a156da918', 'Chainlink', 7.35, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167022/link_bfn0zy.png', 'LINK', 1300000, 'Popular');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('fb3b408c-af05-4f1f-854b-fdbc3d11b78a', 'Uniswap', 6.03, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167026/uni_u6b0cm.png', 'UNI', 1700000, 'Metaverse');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('35b438df-ae9c-4cb7-a71d-bc5ff0696239', 'UNUS SED LEO', 3.39, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167031/leo_hml47e.png', 'LEO', 3100000, 'NFT');
INSERT INTO cherrytrade.cryptos (crypto_id, name, value, icon, asset, stock, category) OVERRIDING SYSTEM VALUE VALUES ('6742c233-0722-4e67-861c-a112844820d2', 'Cosmos', 11.19, 'https://res.cloudinary.com/datafgjir/image/upload/v1681167034/atom_t1pcvl.png', 'ATOM', 850000, 'Popular');

INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('236e9cb4-d8a8-47d0-819d-3d7de3e7b5ee', '18a60c12-2358-49ae-a1c1-986e2f299e25', 0.57);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('236e9cb4-d8a8-47d0-819d-3d7de3e7b5ee', 'f1aad756-90a9-467a-acdc-50cac85d385c', 3.14);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('236e9cb4-d8a8-47d0-819d-3d7de3e7b5ee', 'cf3d48c3-5931-43c6-bd70-152725e7ea0f', 140);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('236e9cb4-d8a8-47d0-819d-3d7de3e7b5ee', '33778185-6be0-4684-a895-29045d6d6416', 1000);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', '18a60c12-2358-49ae-a1c1-986e2f299e25', 50);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', '9565e265-f93a-4584-a4ad-2d9f7feed4c5', 9000000000);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', 'b7d9782e-4f31-4d57-85b5-8815f6c485ed', 450000);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', 'd46ddb99-d133-462d-ac60-74ec4273670d', 10000);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('06582fd1-e18a-4e76-8a1c-68f0eb4b151b', 'f1aad756-90a9-467a-acdc-50cac85d385c', 500.5);
INSERT INTO cherrytrade.users_cryptos (user_id, crypto_id, amount) OVERRIDING SYSTEM VALUE VALUES ('9efedc91-dae2-4e7f-a12a-0ac7d83175ff', '4eebc127-b2f5-4ef0-98ae-c1d5eaba16b2', 20000);
