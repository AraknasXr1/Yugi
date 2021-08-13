--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 13.2

-- Started on 2021-08-13 23:04:35

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
-- TOC entry 212 (class 1255 OID 114163)
-- Name: ajout_compte(integer, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_compte(integer, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_index alias for $1;
	declare f_login alias for $2;
	declare f_password alias for $3;
	declare id integer;
	declare retour integer;
	begin
	select into id id_compte from compte where login = f_login and password = f_password;
	if not found
	then
	insert into compte(id_compte,login,password) VALUES (f_index,f_login,f_password);
	retour=1;
	else
	retour =0;
	end if;
	
	return retour;
	end;
';


--
-- TOC entry 196 (class 1255 OID 114148)
-- Name: ajout_deck(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_deck(text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_deck alias for $1;
	declare id integer;
	declare retour integer;
	
	begin
	select into id nom_deck from deck where nom_deck = f_nom_deck;
	if not found
	then
		insert into deck (nom_deck) values(f_nom_deck);
		retour = 1;
	else
		retour = 0 ;
	end if;
	return retour;
	end;
';


--
-- TOC entry 197 (class 1255 OID 114149)
-- Name: ajout_deck(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_deck(text, integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_nom_deck alias for $1;
	declare f_numero_compte alias for $2;
	declare id integer;
	declare retour integer;
	
	begin
	select into id nom_deck from deck where nom_deck = f_nom_deck;
	if not found
	then
		insert into deck (nom_deck,num_compte) values(f_nom_deck,f_numero_compte);
		retour = 1;
	else
		retour = 0 ;
	end if;
	return retour;
	end;
';


--
-- TOC entry 211 (class 1255 OID 114150)
-- Name: ajout_deck(integer, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_deck(integer, text, integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_id_deck alias for $1;
	declare f_nom_deck alias for $2;
	declare f_numero_compte alias for $3;
	declare id integer;
	declare retour integer;
	
	begin
	select into id id_deck from deck where nom_deck = f_nom_deck;
	if not found
	then
		insert into deck (id_deck,nom_deck,num_compte) values(f_id_deck,f_nom_deck,f_numero_compte);
		retour = 1;
	else
		retour = 0 ;
	end if;
	return retour;
	end;
';


--
-- TOC entry 214 (class 1255 OID 114159)
-- Name: is_admin(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
declare f_login alias for $1;
	declare f_password alias for $2;
	declare id integer;
	declare retour integer;
	begin
	select into id id_admin from yg_admin where login = f_login and password = f_password;
	if not found
	then
	retour =0;
	else
	retour =1;
	end if;
	
	return retour;
	end;
';


--
-- TOC entry 210 (class 1255 OID 114160)
-- Name: is_compte(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.is_compte(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS '
	declare f_login alias for $1;
	declare f_password alias for $2;
	declare id integer;
	declare retour integer;
	begin
	select into id id_compte from compte where login = f_login and password = f_password;
	if not found
	then
	retour =0;
	else
	retour =1;
	end if;
	
	return retour;
	end;
';


--
-- TOC entry 213 (class 1255 OID 114167)
-- Name: rechercheid(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.rechercheid(text) RETURNS integer
    LANGUAGE plpgsql
    AS '

declare f_login alias for $1;
declare id integer;
declare retour integer;
begin
	select into id id_compte from compte where login = f_login;
	if not found
	then 
	retour = -1;
	else
	retour = id ;
	end if;
	return retour;
end;

';


SET default_tablespace = '';

--
-- TOC entry 191 (class 1259 OID 114176)
-- Name: attribut; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.attribut (
    id_attr integer NOT NULL,
    attr text
);


--
-- TOC entry 188 (class 1259 OID 113860)
-- Name: compte; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.compte (
    id_compte integer NOT NULL,
    login text,
    password text
);


--
-- TOC entry 189 (class 1259 OID 113868)
-- Name: deck; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.deck (
    id_deck integer NOT NULL,
    nom_deck text,
    num_compte integer
);


--
-- TOC entry 190 (class 1259 OID 114078)
-- Name: lien_deck; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lien_deck (
    id_lien integer NOT NULL,
    fk_deck integer NOT NULL,
    fk_carte integer NOT NULL
);


--
-- TOC entry 192 (class 1259 OID 114184)
-- Name: type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.type (
    id_type integer NOT NULL,
    cat_type text
);


--
-- TOC entry 186 (class 1259 OID 113805)
-- Name: yg_carte_m; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 195 (class 1259 OID 114272)
-- Name: vue_carte_m; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_carte_m AS
 SELECT yg_carte_m.id_cm,
    yg_carte_m.nom_cm,
    yg_carte_m.attribut,
    yg_carte_m.etoiles,
    yg_carte_m.categorie,
    yg_carte_m.eff_desc,
    yg_carte_m.atk,
    yg_carte_m.def
   FROM public.yg_carte_m;


--
-- TOC entry 194 (class 1259 OID 114194)
-- Name: yg_admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.yg_admin (
    id_admin integer NOT NULL,
    login text,
    password text
);


--
-- TOC entry 193 (class 1259 OID 114192)
-- Name: yg_admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.yg_admin_id_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2208 (class 0 OID 0)
-- Dependencies: 193
-- Name: yg_admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.yg_admin_id_admin_seq OWNED BY public.yg_admin.id_admin;


--
-- TOC entry 187 (class 1259 OID 113813)
-- Name: yg_carte_ma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.yg_carte_ma (
    id_cma integer NOT NULL,
    nom_cma text,
    attribut text,
    effet_m text
);


--
-- TOC entry 185 (class 1259 OID 113800)
-- Name: yg_carte_p; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.yg_carte_p (
    id_cp integer NOT NULL,
    nom_cp text,
    attribut_p text,
    effet_p text
);


--
-- TOC entry 2056 (class 2604 OID 114197)
-- Name: yg_admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yg_admin ALTER COLUMN id_admin SET DEFAULT nextval('public.yg_admin_id_admin_seq'::regclass);


--
-- TOC entry 2199 (class 0 OID 114176)
-- Dependencies: 191
-- Data for Name: attribut; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.attribut (id_attr, attr) VALUES (0, 'Ténèbres');
INSERT INTO public.attribut (id_attr, attr) VALUES (1, 'Lumière');
INSERT INTO public.attribut (id_attr, attr) VALUES (2, 'Terre');
INSERT INTO public.attribut (id_attr, attr) VALUES (3, 'Eau');
INSERT INTO public.attribut (id_attr, attr) VALUES (4, 'Feu');
INSERT INTO public.attribut (id_attr, attr) VALUES (5, 'Vent');
INSERT INTO public.attribut (id_attr, attr) VALUES (6, 'Divin');


--
-- TOC entry 2196 (class 0 OID 113860)
-- Dependencies: 188
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.compte (id_compte, login, password) VALUES (1, 'tony', 'ddc5f5e86d2f85e1b1ff763aff13ce0a');
INSERT INTO public.compte (id_compte, login, password) VALUES (2, 'c1', 'a9f7e97965d6cf799a529102a973b8b9');
INSERT INTO public.compte (id_compte, login, password) VALUES (3, 'c3', '0a3d72134fb3d6c024db4c510bc1605b');
INSERT INTO public.compte (id_compte, login, password) VALUES (4, 'f', '8fa14cdd754f91cc6554c9e71929cce7');
INSERT INTO public.compte (id_compte, login, password) VALUES (5, 'C5', 'fea813d4ddba3c46cf8b8e664b92cdaa');
INSERT INTO public.compte (id_compte, login, password) VALUES (6, 'C6', '7e8b9f5cab4a8fe24fad9fe4b7452702');
INSERT INTO public.compte (id_compte, login, password) VALUES (7, 'C6', '7e8b9f5cab4a8fe24fad9fe4b7452702');
INSERT INTO public.compte (id_compte, login, password) VALUES (8, 'newcompte', '8317a4feb736fc50b1be3c6486979fbf');
INSERT INTO public.compte (id_compte, login, password) VALUES (9, 'd', '8277e0910d750195b448797616e091ad');
INSERT INTO public.compte (id_compte, login, password) VALUES (10, 'd', '8277e0910d750195b448797616e091ad');
INSERT INTO public.compte (id_compte, login, password) VALUES (11, 'randaz', '82e5ec29bd3dd5bff43264df559b9d7c');
INSERT INTO public.compte (id_compte, login, password) VALUES (12, 'goat', 'a94aa000f9a94cc51775bd5eac97c926');
INSERT INTO public.compte (id_compte, login, password) VALUES (13, 'le', 'd9180594744f870aeefb086982e980bb');
INSERT INTO public.compte (id_compte, login, password) VALUES (14, 'Marie', '879eb8aa505a968b831812aeb836c2a9');
INSERT INTO public.compte (id_compte, login, password) VALUES (15, 'Yugi', '71742fc9418f95a750f4617455d3863a');
INSERT INTO public.compte (id_compte, login, password) VALUES (16, 'Yugi2', '49caafdf8ef6eb2e9c09e00142bff066');
INSERT INTO public.compte (id_compte, login, password) VALUES (17, 'Coca', '9853c553365d9b261256fc48e8b67073');


--
-- TOC entry 2197 (class 0 OID 113868)
-- Dependencies: 189
-- Data for Name: deck; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (2, 'Dur comme le fer', 2);
INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (6, 'hola
', 6);
INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (8, 'Ragnarok', 1);
INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (9, 'Rengar', 15);
INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (10, 'Ran', 15);
INSERT INTO public.deck (id_deck, nom_deck, num_compte) VALUES (11, 'Fernandes', 14);


--
-- TOC entry 2198 (class 0 OID 114078)
-- Dependencies: 190
-- Data for Name: lien_deck; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2200 (class 0 OID 114184)
-- Dependencies: 192
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.type (id_type, cat_type) VALUES (0, 'Magicien');
INSERT INTO public.type (id_type, cat_type) VALUES (1, 'Dragon');
INSERT INTO public.type (id_type, cat_type) VALUES (2, 'Zombie');
INSERT INTO public.type (id_type, cat_type) VALUES (3, 'Guerrier');
INSERT INTO public.type (id_type, cat_type) VALUES (4, 'Bête-Guerrier');
INSERT INTO public.type (id_type, cat_type) VALUES (5, 'Bête');
INSERT INTO public.type (id_type, cat_type) VALUES (6, 'Bête Ailée');
INSERT INTO public.type (id_type, cat_type) VALUES (7, 'Démon');
INSERT INTO public.type (id_type, cat_type) VALUES (8, 'Elfe');
INSERT INTO public.type (id_type, cat_type) VALUES (9, 'Insecte');
INSERT INTO public.type (id_type, cat_type) VALUES (10, 'Dinosaure');
INSERT INTO public.type (id_type, cat_type) VALUES (11, 'Reptile');
INSERT INTO public.type (id_type, cat_type) VALUES (12, 'Poisson');
INSERT INTO public.type (id_type, cat_type) VALUES (13, 'Serpent de Mer');
INSERT INTO public.type (id_type, cat_type) VALUES (14, 'Aqua');
INSERT INTO public.type (id_type, cat_type) VALUES (15, 'Pyro');
INSERT INTO public.type (id_type, cat_type) VALUES (16, 'Tonnerre');
INSERT INTO public.type (id_type, cat_type) VALUES (17, 'Rocher');
INSERT INTO public.type (id_type, cat_type) VALUES (18, 'Plante');
INSERT INTO public.type (id_type, cat_type) VALUES (19, 'Machine');
INSERT INTO public.type (id_type, cat_type) VALUES (20, 'Psychique');
INSERT INTO public.type (id_type, cat_type) VALUES (21, 'Bête Divine');
INSERT INTO public.type (id_type, cat_type) VALUES (22, 'Wyrm');
INSERT INTO public.type (id_type, cat_type) VALUES (23, 'Cyberse');


--
-- TOC entry 2202 (class 0 OID 114194)
-- Dependencies: 194
-- Data for Name: yg_admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.yg_admin (id_admin, login, password) VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3');


--
-- TOC entry 2194 (class 0 OID 113805)
-- Dependencies: 186
-- Data for Name: yg_carte_m; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (3, 'Samouraï de la Barriere de glace', 'Eau', 4, 'Guerrier', 'Lorsque cette carte en position d''attaque face recto est changée en position de défense face recto: détruisez cette carte, et si vous le faites, piochez 1 carte.', 1800, 1500);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (4, 'Alchimio', 'Lumière', 6, 'Guerrier', 'Guerrier de lumière, il peut attaquer 2 fois a chaque tour.', 2000, 2000);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (10, 'Campion', 'Ténèbres', 3, 'Magicien', 'trop beau et fort', 2100, 1000);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (13, 'Victor le bg', 'Ténèbres', 6, 'Guerrier', 'Trop fort', 3000, 1500);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (1, 'Animal Féérique', 'Lumière', 4, 'Magicien', 'Vous pouvez invoquer Spécialement 1 monstre. Lorsque votre adversaire active une Carte Magie Normale/Piège : vous pouvez sacrifier 1 autre monstre.', 1850, 1000);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (2, 'Algiedi de la constellée', 'Lumière', 4, 'Magicien', 'Lorsque cette carte est Invoquée Normalement : vous pouvez Invoquer Spécialement 1 monstre "Constellée" de niveau 4 depuis votre main.', 1600, 1400);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (11, 'El dragon de corleone', 'Ténèbres', 1, 'Magicien', 'trop beau mais pas fort', 350, 300);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (6, 'Albator', 'Ténèbres', 1, 'Magicien', 'Monstre', 150, 100);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (7, 'Moka', 'Ténèbres', 1, 'Magicien', 'Guerrier ', 350, 200);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (8, 'Dragon', 'Ténèbres', 1, 'Magicien', 'Ionia', 50, 50);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (9, 'dr', 'Ténèbres', 1, 'Magicien', 'Dessert', 500, 50);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (5, 'Rulio', 'Ténèbres', 6, 'Magicien', 'yessir', 200, 200);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (14, 'Tony', 'Feu', 8, 'Dragon', 'Il est trop canon!', 1100, 2000);
INSERT INTO public.yg_carte_m (id_cm, nom_cm, attribut, etoiles, categorie, eff_desc, atk, def) VALUES (12, 'Chico del passo', 'Terre', 5, 'Elfe', '2 Attaques par tours', 1750, 350);


--
-- TOC entry 2195 (class 0 OID 113813)
-- Dependencies: 187
-- Data for Name: yg_carte_ma; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (1, 'Polymerisation', 'Normal', 'Invoquez par Fusion 1 Monstre de fusion depuis votre extra deck, en utilisant des monstres depuis votre main ou terrain comme des matériels de fusion.');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (2, 'Monster Reborn', 'Normal', 'Ciblez 1 monstre dans l''un des cimetières : invoquez-le spécialement.');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (3, 'Piège Supprimé', 'Normal', 'Détruit 1 carte piège face recto sur le terrain');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (4, 'Luminus', 'Terrain', 'monstre lumière +1000 atk.');
INSERT INTO public.yg_carte_ma (id_cma, nom_cma, attribut, effet_m) VALUES (5, 'Rayon de lumiere', 'Normal', 'donne 200lp');


--
-- TOC entry 2193 (class 0 OID 113800)
-- Dependencies: 185
-- Data for Name: yg_carte_p; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (1, 'Force de Miroir', 'Normal', 'Lorsqu''un monstre de votre adversaire déclare une attaque : détruisez tous les monstres en Position d''Attaque de votre adversaire.');
INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (2, 'Armure de Sakuretsu', 'Normal', 'Activable uniquement lorsque votre adversaire déclare une attaque. Détruisez le monstre attaquant.');
INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (3, 'Trappe', 'Normal', 'lorsque votre adversaire Invoque Normalement ou par Flip 1 monstre avec min. 1000 Atk : ciblez le monstre ; détruisez la cible.');
INSERT INTO public.yg_carte_p (id_cp, nom_cp, attribut_p, effet_p) VALUES (4, 'NomdeCarte', 'Normal', '');


--
-- TOC entry 2209 (class 0 OID 0)
-- Dependencies: 193
-- Name: yg_admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.yg_admin_id_admin_seq', 1, true);


--
-- TOC entry 2070 (class 2606 OID 114183)
-- Name: attribut Attribut_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.attribut
    ADD CONSTRAINT "Attribut_pkey" PRIMARY KEY (id_attr);


--
-- TOC entry 2064 (class 2606 OID 113867)
-- Name: compte compte_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pkey PRIMARY KEY (id_compte);


--
-- TOC entry 2066 (class 2606 OID 113872)
-- Name: deck deck_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.deck
    ADD CONSTRAINT deck_pkey PRIMARY KEY (id_deck);


--
-- TOC entry 2058 (class 2606 OID 113804)
-- Name: yg_carte_p id_carte_p_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yg_carte_p
    ADD CONSTRAINT id_carte_p_pkey PRIMARY KEY (id_cp);


--
-- TOC entry 2068 (class 2606 OID 114082)
-- Name: lien_deck lien_deck_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lien_deck
    ADD CONSTRAINT lien_deck_pkey PRIMARY KEY (id_lien);


--
-- TOC entry 2072 (class 2606 OID 114191)
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (id_type);


--
-- TOC entry 2074 (class 2606 OID 114202)
-- Name: yg_admin yg_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yg_admin
    ADD CONSTRAINT yg_admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 2060 (class 2606 OID 113812)
-- Name: yg_carte_m yg_carte_m_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yg_carte_m
    ADD CONSTRAINT yg_carte_m_pkey PRIMARY KEY (id_cm);


--
-- TOC entry 2062 (class 2606 OID 113820)
-- Name: yg_carte_ma yg_carte_ma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.yg_carte_ma
    ADD CONSTRAINT yg_carte_ma_pkey PRIMARY KEY (id_cma);


-- Completed on 2021-08-13 23:04:39

--
-- PostgreSQL database dump complete
--

