--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 13.2

-- Started on 2021-05-10 03:35:08

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

DROP DATABASE "anthony.fernandes_yugi";
--
-- TOC entry 2161 (class 1262 OID 113798)
-- Name: anthony.fernandes_yugi; Type: DATABASE; Schema: -; Owner: anthony.fernandes
--

CREATE DATABASE "anthony.fernandes_yugi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'fr_BE.UTF-8';


ALTER DATABASE "anthony.fernandes_yugi" OWNER TO "anthony.fernandes";

\connect "anthony.fernandes_yugi"

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

--
-- TOC entry 188 (class 1259 OID 113860)
-- Name: compte; Type: TABLE; Schema: public; Owner: anthony.fernandes
--

CREATE TABLE public.compte (
    id_compte integer NOT NULL,
    login text,
    password text
);


ALTER TABLE public.compte OWNER TO "anthony.fernandes";

--
-- TOC entry 189 (class 1259 OID 113868)
-- Name: deck; Type: TABLE; Schema: public; Owner: anthony.fernandes
--

CREATE TABLE public.deck (
    id_deck integer NOT NULL,
    nom_deck text,
    "num-compte" integer
);


ALTER TABLE public.deck OWNER TO "anthony.fernandes";

--
-- TOC entry 186 (class 1259 OID 113805)
-- Name: yg_carte_m; Type: TABLE; Schema: public; Owner: anthony.fernandes
--

CREATE TABLE public.yg_carte_m (
    id_cm integer NOT NULL,
    nom_cm text,
    attribut text,
    etoiles integer,
    categorie text,
    eff_desc text,
    atk integer,
    def integer
);


ALTER TABLE public.yg_carte_m OWNER TO "anthony.fernandes";

--
-- TOC entry 187 (class 1259 OID 113813)
-- Name: yg_carte_ma; Type: TABLE; Schema: public; Owner: anthony.fernandes
--

CREATE TABLE public.yg_carte_ma (
    id_cma integer NOT NULL,
    nom_cma text,
    attribut text,
    effet_m text
);


ALTER TABLE public.yg_carte_ma OWNER TO "anthony.fernandes";

--
-- TOC entry 185 (class 1259 OID 113800)
-- Name: yg_carte_p; Type: TABLE; Schema: public; Owner: anthony.fernandes
--

CREATE TABLE public.yg_carte_p (
    id_cp integer NOT NULL,
    nom_cp text,
    attribut_p text,
    effet_p text
);


ALTER TABLE public.yg_carte_p OWNER TO "anthony.fernandes";

--
-- TOC entry 2154 (class 0 OID 113860)
-- Dependencies: 188
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: anthony.fernandes
--

INSERT INTO public.compte (id_compte, login, password) VALUES (1, 'tony', 'tony');
INSERT INTO public.compte (id_compte, login, password) VALUES (2, 'c1', 'c1');
INSERT INTO public.compte (id_compte, login, password) VALUES (3, 'c3', 'c3');
INSERT INTO public.compte (id_compte, login, password) VALUES (4, 'f', 'f');
INSERT INTO public.compte (id_compte, login, password) VALUES (5, 'C5', 'C5');
INSERT INTO public.compte (id_compte, login, password) VALUES (6, 'C6', 'C6');
INSERT INTO public.compte (id_compte, login, password) VALUES (7, 'C6', 'C6');
INSERT INTO public.compte (id_compte, login, password) VALUES (8, 'newcompte', 'newcompte');
INSERT INTO public.compte (id_compte, login, password) VALUES (9, 'd', 'd');
INSERT INTO public.compte (id_compte, login, password) VALUES (10, 'd', 'd');
INSERT INTO public.compte (id_compte, login, password) VALUES (11, 'randaz', 'randaz');
INSERT INTO public.compte (id_compte, login, password) VALUES (12, 'goat', 'goat');
INSERT INTO public.compte (id_compte, login, password) VALUES (13, 'le', 'le');


--
-- TOC entry 2155 (class 0 OID 113868)
-- Dependencies: 189
-- Data for Name: deck; Type: TABLE DATA; Schema: public; Owner: anthony.fernandes
--



--
-- TOC entry 2152 (class 0 OID 113805)
-- Dependencies: 186
-- Data for Name: yg_carte_m; Type: TABLE DATA; Schema: public; Owner: anthony.fernandes
--

INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (1, 'Animal Féérique', 'Lumiere', 4, 'Magicien', 'Vous pouvez invoquer Spécialement 1 monstre. Lorsque votre adversaire active une Carte Magie Normale/Piège : vous pouvez sacrifier 1 autre monstre.', 1850, 1000);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (2, 'Algiedi de la constellée', 'Lumiere', 4, 'Magicien', 'Lorsque cette carte est Invoquée Normalement : vous pouvez Invoquer Spécialement 1 monstre "Constellée" de niveau 4 depuis votre main.', 1600, 1400);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (3, 'Samouraï de la Barriere de glace', 'Eau', 4, 'Guerrier', 'Lorsque cette carte en position d''attaque face recto est changée en position de défense face recto: détruisez cette carte, et si vous le faites, piochez 1 carte.', 1800, 1500);


--
-- TOC entry 2153 (class 0 OID 113813)
-- Dependencies: 187
-- Data for Name: yg_carte_ma; Type: TABLE DATA; Schema: public; Owner: anthony.fernandes
--

INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (1, 'Polymerisation', 'Normal', 'Invoquez par Fusion 1 Monstre de fusion depuis votre extra deck, en utilisant des monstres depuis votre main ou terrain comme des matériels de fusion.');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (2, 'Monster Reborn', 'Normal', 'Ciblez 1 monstre dans l''un des cimetières : invoquez-le spécialement.');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (3, 'Piège Supprimé', 'Normal', 'Détruit 1 carte piège face recto sur le terrain');


--
-- TOC entry 2151 (class 0 OID 113800)
-- Dependencies: 185
-- Data for Name: yg_carte_p; Type: TABLE DATA; Schema: public; Owner: anthony.fernandes
--

INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (1, 'Force de Miroir', 'Normal', 'Lorsqu''un monstre de votre adversaire déclare une attaque : détruisez tous les monstres en Position d''Attaque de votre adversaire.');
INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (2, 'Armure de Sakuretsu', 'Normal', 'Activable uniquement lorsque votre adversaire déclare une attaque. Détruisez le monstre attaquant.');
INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (3, 'Trappe', 'Normal', 'lorsque votre adversaire Invoque Normalement ou par Flip 1 monstre avec min. 1000 Atk : ciblez le monstre ; détruisez la cible.');


--
-- TOC entry 2031 (class 2606 OID 113867)
-- Name: compte compte_pkey; Type: CONSTRAINT; Schema: public; Owner: anthony.fernandes
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pkey PRIMARY KEY (id_compte);


--
-- TOC entry 2033 (class 2606 OID 113872)
-- Name: deck deck_pkey; Type: CONSTRAINT; Schema: public; Owner: anthony.fernandes
--

ALTER TABLE ONLY public.deck
    ADD CONSTRAINT deck_pkey PRIMARY KEY (id_deck);


--
-- TOC entry 2025 (class 2606 OID 113804)
-- Name: yg_carte_p id_carte_p_pkey; Type: CONSTRAINT; Schema: public; Owner: anthony.fernandes
--

ALTER TABLE ONLY public.yg_carte_p
    ADD CONSTRAINT id_carte_p_pkey PRIMARY KEY (id_cp);


--
-- TOC entry 2027 (class 2606 OID 113812)
-- Name: yg_carte_m yg_carte_m_pkey; Type: CONSTRAINT; Schema: public; Owner: anthony.fernandes
--

ALTER TABLE ONLY public.yg_carte_m
    ADD CONSTRAINT yg_carte_m_pkey PRIMARY KEY (id_cm);


--
-- TOC entry 2029 (class 2606 OID 113820)
-- Name: yg_carte_ma yg_carte_ma_pkey; Type: CONSTRAINT; Schema: public; Owner: anthony.fernandes
--

ALTER TABLE ONLY public.yg_carte_ma
    ADD CONSTRAINT yg_carte_ma_pkey PRIMARY KEY (id_cma);


-- Completed on 2021-05-10 03:35:11

--
-- PostgreSQL database dump complete
--

