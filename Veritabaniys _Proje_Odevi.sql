--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: envanterden_satilanlari_dus(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.envanterden_satilanlari_dus() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update envanter_yonetim set envanterdeki_toplam_urun_sayisi=envanterdeki_toplam_urun_sayisi-1;
return new;
end;
$$;


ALTER FUNCTION public.envanterden_satilanlari_dus() OWNER TO postgres;

--
-- Name: nakliyeci_primi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nakliyeci_primi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update personel set prim_ucreti=prim_ucreti+150;
return new;
end;
$$;


ALTER FUNCTION public.nakliyeci_primi() OWNER TO postgres;

--
-- Name: nekadaryakarbenzin(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nekadaryakarbenzin(yakit_tuketimi double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
declare
sonuc float;
begin
sonuc=(10.26)*yakit_tuketimi;
return sonuc;
end;
$$;


ALTER FUNCTION public.nekadaryakarbenzin(yakit_tuketimi double precision) OWNER TO postgres;

--
-- Name: nekadaryakarmazot(double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.nekadaryakarmazot(yakit_tuketimi double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
declare
sonuc float;
begin
sonuc=(10.50)*yakit_tuketimi;
return sonuc;
end;
$$;


ALTER FUNCTION public.nekadaryakarmazot(yakit_tuketimi double precision) OWNER TO postgres;

--
-- Name: satis_calisani_prim(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.satis_calisani_prim() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
if exists (select * from personel where calistigi_bolum = 'satis')
then
update personel set prim_ucreti=prim_ucreti+120;
end if;
return new;
end;
$$;


ALTER FUNCTION public.satis_calisani_prim() OWNER TO postgres;

--
-- Name: satistaki_kar(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.satistaki_kar(uretim_maliyeti integer, ucret integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
sonuc integer;
begin
sonuc=ucret-uretim_maliyeti;
return sonuc;
end;
$$;


ALTER FUNCTION public.satistaki_kar(uretim_maliyeti integer, ucret integer) OWNER TO postgres;

--
-- Name: siparissayisi(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.siparissayisi() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update envanter_yonetim set toplam_siparis_sayisi=toplam_siparis_sayisi+1;
return new;
end;
$$;


ALTER FUNCTION public.siparissayisi() OWNER TO postgres;

--
-- Name: verimlilik(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.verimlilik(uretim_maliyeti double precision, uretim_suresi double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
declare
sonuc float;
begin
sonuc=uretim_maliyeti/uretim_suresi;
return sonuc;
end;
$$;


ALTER FUNCTION public.verimlilik(uretim_maliyeti double precision, uretim_suresi double precision) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: adres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adres (
    adres character varying NOT NULL,
    adres2 character varying,
    telefon character varying NOT NULL,
    e_posta character varying,
    posta_kodu character varying NOT NULL,
    adres_id integer NOT NULL,
    telefon_2 character varying
);


ALTER TABLE public.adres OWNER TO postgres;

--
-- Name: arac_modeli; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arac_modeli (
    arac_adi character varying NOT NULL,
    arac_uretim_yili integer NOT NULL,
    arac_modeli_id integer NOT NULL,
    uretilen_id integer NOT NULL,
    "arac turu" character varying NOT NULL
);


ALTER TABLE public.arac_modeli OWNER TO postgres;

--
-- Name: envanter_yonetim; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.envanter_yonetim (
    envanter_yonetim_id integer NOT NULL,
    envanterdeki_toplam_urun_sayisi integer NOT NULL,
    toplam_siparis_sayisi integer NOT NULL,
    paket_envanteri_id integer NOT NULL,
    parca_envanteri_id integer NOT NULL,
    depo_adi character varying NOT NULL
);


ALTER TABLE public.envanter_yonetim OWNER TO postgres;

--
-- Name: fabrika; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fabrika (
    fabrika_adi character varying NOT NULL,
    fabrika_id integer NOT NULL,
    yonetim_id integer NOT NULL,
    adres_id integer NOT NULL
);


ALTER TABLE public.fabrika OWNER TO postgres;

--
-- Name: musteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.musteri (
    ad character varying NOT NULL,
    soyad character varying NOT NULL,
    musteri_id integer NOT NULL,
    adres_id integer NOT NULL
);


ALTER TABLE public.musteri OWNER TO postgres;

--
-- Name: nakliye; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nakliye (
    nakliye_sekli character varying NOT NULL,
    adres_id integer NOT NULL,
    nakliye_turu character varying NOT NULL,
    " personel_id" integer NOT NULL
);


ALTER TABLE public.nakliye OWNER TO postgres;

--
-- Name: paket_envanteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paket_envanteri (
    paket_adedi integer NOT NULL,
    paket_envanteri_id integer NOT NULL,
    paket_id integer NOT NULL
);


ALTER TABLE public.paket_envanteri OWNER TO postgres;

--
-- Name: paket_ozellikleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paket_ozellikleri (
    arac_rengi character varying NOT NULL,
    azami_hiz character varying NOT NULL,
    beygir_gucu integer NOT NULL,
    motor_hacmi integer NOT NULL,
    olculeri character varying NOT NULL,
    paket character varying NOT NULL,
    sanziman character varying NOT NULL,
    yakit_turu character varying NOT NULL,
    yakit_tuketimi integer NOT NULL,
    paket_ozellikleri_id integer NOT NULL,
    arac_modeli_id integer NOT NULL
);


ALTER TABLE public.paket_ozellikleri OWNER TO postgres;

--
-- Name: parca_envanteri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parca_envanteri (
    parca_envanteri_id integer NOT NULL,
    parca_adedi integer NOT NULL,
    parca_id integer NOT NULL
);


ALTER TABLE public.parca_envanteri OWNER TO postgres;

--
-- Name: parca_uretimi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parca_uretimi (
    parca character varying NOT NULL,
    arac_modeli_id integer NOT NULL,
    parca_id integer NOT NULL
);


ALTER TABLE public.parca_uretimi OWNER TO postgres;

--
-- Name: personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personel (
    calistigi_bolum character varying NOT NULL,
    ad character varying NOT NULL,
    soyad character varying NOT NULL,
    adres_id integer NOT NULL,
    personel_id integer NOT NULL,
    prim_ucreti integer NOT NULL
);


ALTER TABLE public.personel OWNER TO postgres;

--
-- Name: satis_bayii; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.satis_bayii (
    bayii_adi character varying NOT NULL,
    envanter_yonetim_id integer NOT NULL,
    adres_id integer NOT NULL
);


ALTER TABLE public.satis_bayii OWNER TO postgres;

--
-- Name: servis_bayii; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servis_bayii (
    servis_adi character varying NOT NULL,
    adres_id integer NOT NULL,
    "envanter yonetim_id" integer NOT NULL
);


ALTER TABLE public.servis_bayii OWNER TO postgres;

--
-- Name: siparis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.siparis (
    teslim_tarihi date NOT NULL,
    teslim_turu character varying NOT NULL,
    odeme_sekli character varying NOT NULL,
    musteri_id integer NOT NULL,
    adres_id integer NOT NULL,
    siparis_id integer NOT NULL,
    alinan_urun character varying NOT NULL,
    ucret integer NOT NULL,
    personel_id integer NOT NULL,
    uretim_maliyeti integer NOT NULL
);


ALTER TABLE public.siparis OWNER TO postgres;

--
-- Name: uretilen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uretilen (
    uretim_tarihi date NOT NULL,
    uretim_suresi integer NOT NULL,
    uretim_maliyeti integer NOT NULL,
    uretilen_id integer NOT NULL,
    fabrika_id integer NOT NULL
);


ALTER TABLE public.uretilen OWNER TO postgres;

--
-- Data for Name: adres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.adres VALUES
	('ataturk mahallesi ataturk caddesi ataturk apartmanı no:5 daire:2 Adana/Turkiye', NULL, '05654867592', NULL, '01001', 100001, NULL),
	('guvenlik mahallesi guvenlik sokak apartman no:3 daire:4 Ankara/peypazarı', NULL, '05398647594', NULL, '06006', 100002, NULL),
	('kemalpaşa mahallesi medeniyet caddesi ısık apartmanı no:8 daire:2 Sakarya/Serdivan', NULL, '05468497624', NULL, '05454', 100003, NULL),
	('herhangibi bir adres 1', NULL, 'herhangibi bir telefon numarası 1', NULL, 'postakodu1', 100004, NULL),
	('herhangibi bir adres 2', NULL, 'herhangibi bir telefon numarası 2', NULL, 'postakodu2', 100005, NULL),
	('herhangibi bir adres 3', NULL, 'herhangibi bir telefon numarası 3', NULL, 'postakodu3', 100006, NULL),
	('herhangibi bir adres 4', NULL, 'herhangibi bir telefon numarası 4', NULL, 'postakodu4', 100007, NULL),
	('herhangibi bir adres 5', NULL, 'herhangibi bir telefon numarası 5', NULL, 'postakodu5', 100008, NULL),
	('herhangibi bir adres 6', NULL, 'herhangibi bir telefon numarası 6', NULL, 'postakodu6', 100009, NULL),
	('herhangibi bir adres 7', NULL, 'herhangibi bir telefon numarası 7', NULL, 'postakodu7', 100010, NULL),
	('herhangibi bir adres 8', NULL, 'herhangibi bir telefon numarası 8', NULL, 'postakodu8', 100011, NULL),
	('herhangibi bir adres 12', 'adres2', 'herhangibi bir telefon numarası 11', 'asdasd@gmail.com', 'postakodu11', 100015, ''),
	('herhangibi bir adres 9', NULL, 'herhangibi bir telefon numarası 9', NULL, 'postakodu9', 100012, NULL),
	('herhangibi bir adres 10', NULL, 'herhangibi bir telefon numarası 10', NULL, 'postakodu10', 100013, NULL),
	('herhangibi bir adres 12', NULL, 'herhangibi bir telefon numarası 11', NULL, 'postakodu11', 100014, NULL),
	('guncellendi', 'guncellendi', '05395468565', 'asdasd@gmail.com', '08010', 12345, '');


--
-- Data for Name: arac_modeli; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.arac_modeli VALUES
	('M5', 2021, 400001, 300001, 'Sedan'),
	('S1000RR', 2021, 400002, 300002, 'motorsiklet');


--
-- Data for Name: envanter_yonetim; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.envanter_yonetim VALUES
	(900001, 203, 88, 800001, 700001, 'adana depo');


--
-- Data for Name: fabrika; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fabrika VALUES
	('Bmw a ', 200001, 700001, 100010),
	('Bmw b', 200002, 700001, 100011);


--
-- Data for Name: musteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.musteri VALUES
	('cuneyt', 'arkın', 1200001, 100007),
	('kemal ', 'sunal', 1200002, 100008),
	('serdar', 'ortac', 1200003, 100009);


--
-- Data for Name: nakliye; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.nakliye VALUES
	('kıtalar arası', 100001, 'tır', 1100001);


--
-- Data for Name: paket_envanteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paket_envanteri VALUES
	(3, 800001, 600001),
	(2, 800002, 600001);


--
-- Data for Name: paket_ozellikleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.paket_ozellikleri VALUES
	('beyaz', '280km/h', 635, 4395, '4900,1903,1490', 'CS', 'otomatik', 'benzin', 12, 600001, 400001),
	('beyaz,mavi,kırmızı', '330km/h', 210, 999, '2056,826,1138', 'RR Sport', 'manuel', 'benzin', 18, 600002, 400002);


--
-- Data for Name: parca_envanteri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parca_envanteri VALUES
	(700001, 4, 500001),
	(700002, 2, 500001);


--
-- Data for Name: parca_uretimi; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parca_uretimi VALUES
	('Sol ön far', 400001, 500001),
	('Karbon gidon', 400002, 500002);


--
-- Data for Name: personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personel VALUES
	('nakliye', 'serdar', 'adak', 100004, 1100001, 630),
	('satis', 'armağan', 'demir', 100005, 1100002, 480);


--
-- Data for Name: satis_bayii; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.satis_bayii VALUES
	('istanbulbmw', 900001, 100001),
	('adanabmw', 900001, 100013);


--
-- Data for Name: servis_bayii; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.servis_bayii VALUES
	('adana servis', 100002, 900001),
	('istanbul servis', 100003, 900001);


--
-- Data for Name: siparis; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.siparis VALUES
	('2021-12-18', 'Kendi', 'kredi kartı', 1200001, 100007, 1300001, 'BMW M5', 1250000, 1100002, 350000),
	('2021-12-18', 'Nakliye', 'nakit', 1200002, 100008, 1300002, 'S1000RR', 360000, 1100002, 120000);


--
-- Data for Name: uretilen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.uretilen VALUES
	('2021-12-17', 678, 130000, 300001, 200001),
	('2021-12-17', 584, 115000, 300002, 200001),
	('2021-12-17', 450, 100000, 300003, 200001);


--
-- Name: envanter_yonetim envanter yonetim_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter_yonetim
    ADD CONSTRAINT "envanter yonetim_pkey" PRIMARY KEY (envanter_yonetim_id);


--
-- Name: fabrika fabrika_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabrika
    ADD CONSTRAINT fabrika_pkey PRIMARY KEY (fabrika_id);


--
-- Name: musteri musteri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT musteri_pkey PRIMARY KEY (musteri_id);


--
-- Name: personel unique_ personel_ personel_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "unique_ personel_ personel_id" UNIQUE (personel_id);


--
-- Name: adres unique_adres_adres_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adres
    ADD CONSTRAINT unique_adres_adres_id UNIQUE (adres_id);


--
-- Name: arac_modeli unique_arac_modeli_arac_modeli_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac_modeli
    ADD CONSTRAINT unique_arac_modeli_arac_modeli_id UNIQUE (arac_modeli_id);


--
-- Name: fabrika unique_fabrika_fabrika_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabrika
    ADD CONSTRAINT unique_fabrika_fabrika_id UNIQUE (fabrika_id);


--
-- Name: musteri unique_musteri_musteri_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT unique_musteri_musteri_id UNIQUE (musteri_id);


--
-- Name: paket_envanteri unique_paket_envanteri_paket_envanteri_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_envanteri
    ADD CONSTRAINT unique_paket_envanteri_paket_envanteri_id UNIQUE (paket_envanteri_id);


--
-- Name: paket_ozellikleri unique_paket_ozellikleri_paket_ozellikleri_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_ozellikleri
    ADD CONSTRAINT unique_paket_ozellikleri_paket_ozellikleri_id UNIQUE (paket_ozellikleri_id);


--
-- Name: parca_envanteri unique_parca_envanteri_parca_envanteri_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parca_envanteri
    ADD CONSTRAINT unique_parca_envanteri_parca_envanteri_id UNIQUE (parca_envanteri_id);


--
-- Name: parca_uretimi unique_parca_uretimi_parca_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parca_uretimi
    ADD CONSTRAINT unique_parca_uretimi_parca_id UNIQUE (parca_id);


--
-- Name: uretilen unique_uretilen_uretilen_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uretilen
    ADD CONSTRAINT unique_uretilen_uretilen_id UNIQUE (uretilen_id);


--
-- Name: envanter_yonetim unique_yonetim_yonetim_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter_yonetim
    ADD CONSTRAINT unique_yonetim_yonetim_id UNIQUE (envanter_yonetim_id);


--
-- Name: index_adres_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id ON public.fabrika USING btree (adres_id);


--
-- Name: index_adres_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id1 ON public.servis_bayii USING btree (adres_id);


--
-- Name: index_adres_id2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id2 ON public.personel USING btree (adres_id);


--
-- Name: index_adres_id3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id3 ON public.siparis USING btree (adres_id);


--
-- Name: index_adres_id4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id4 ON public.musteri USING btree (adres_id);


--
-- Name: index_adres_id5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_adres_id5 ON public.satis_bayii USING btree (adres_id);


--
-- Name: index_arac_modeli_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_arac_modeli_id ON public.parca_uretimi USING btree (arac_modeli_id);


--
-- Name: index_arac_modeli_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_arac_modeli_id1 ON public.paket_ozellikleri USING btree (arac_modeli_id);


--
-- Name: index_envanter yonetim_id1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "index_envanter yonetim_id1" ON public.servis_bayii USING btree ("envanter yonetim_id");


--
-- Name: index_fabrika_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_fabrika_id ON public.uretilen USING btree (fabrika_id);


--
-- Name: index_musteri_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_musteri_id ON public.siparis USING btree (musteri_id);


--
-- Name: index_paket_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_paket_id ON public.paket_envanteri USING btree (paket_id);


--
-- Name: index_personel_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_personel_id ON public.siparis USING btree (personel_id);


--
-- Name: index_uretilen_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_uretilen_id ON public.arac_modeli USING btree (uretilen_id);


--
-- Name: index_yonetim_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_yonetim_id ON public.satis_bayii USING btree (envanter_yonetim_id);


--
-- Name: index_yonetim_id2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_yonetim_id2 ON public.fabrika USING btree (yonetim_id);


--
-- Name: siparis depoyu_guncelle; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER depoyu_guncelle AFTER INSERT ON public.siparis FOR EACH ROW EXECUTE FUNCTION public.siparissayisi();


--
-- Name: siparis envanterden_düs; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER "envanterden_düs" AFTER INSERT ON public.siparis FOR EACH ROW EXECUTE FUNCTION public.envanterden_satilanlari_dus();


--
-- Name: nakliye nakliyeci_eklenirse_primver; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER nakliyeci_eklenirse_primver AFTER INSERT ON public.nakliye FOR EACH ROW EXECUTE FUNCTION public.nakliyeci_primi();


--
-- Name: siparis satis__eklenirse_primver; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER satis__eklenirse_primver AFTER INSERT ON public.siparis FOR EACH ROW EXECUTE FUNCTION public.satis_calisani_prim();


--
-- Name: nakliye lnk_ personel_nakliye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nakliye
    ADD CONSTRAINT "lnk_ personel_nakliye" FOREIGN KEY (" personel_id") REFERENCES public.personel(personel_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personel lnk_adres_ personel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personel
    ADD CONSTRAINT "lnk_adres_ personel" FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fabrika lnk_adres_fabrika; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fabrika
    ADD CONSTRAINT lnk_adres_fabrika FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: musteri lnk_adres_musteri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.musteri
    ADD CONSTRAINT lnk_adres_musteri FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: nakliye lnk_adres_nakliye; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nakliye
    ADD CONSTRAINT lnk_adres_nakliye FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: satis_bayii lnk_adres_satis_bayii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis_bayii
    ADD CONSTRAINT lnk_adres_satis_bayii FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: satis_bayii lnk_adres_satis_bayii_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis_bayii
    ADD CONSTRAINT lnk_adres_satis_bayii_2 FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: servis_bayii lnk_adres_servis_bayii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servis_bayii
    ADD CONSTRAINT lnk_adres_servis_bayii FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: siparis lnk_adres_siparis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparis
    ADD CONSTRAINT lnk_adres_siparis FOREIGN KEY (adres_id) REFERENCES public.adres(adres_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paket_ozellikleri lnk_arac_modeli_paket_ozellikleri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_ozellikleri
    ADD CONSTRAINT lnk_arac_modeli_paket_ozellikleri FOREIGN KEY (arac_modeli_id) REFERENCES public.arac_modeli(arac_modeli_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parca_uretimi lnk_arac_modeli_parca_uretimi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parca_uretimi
    ADD CONSTRAINT lnk_arac_modeli_parca_uretimi FOREIGN KEY (arac_modeli_id) REFERENCES public.arac_modeli(arac_modeli_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: servis_bayii lnk_envanter yonetim_servis_bayii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servis_bayii
    ADD CONSTRAINT "lnk_envanter yonetim_servis_bayii" FOREIGN KEY ("envanter yonetim_id") REFERENCES public.envanter_yonetim(envanter_yonetim_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: uretilen lnk_fabrika_uretilen; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uretilen
    ADD CONSTRAINT lnk_fabrika_uretilen FOREIGN KEY (fabrika_id) REFERENCES public.fabrika(fabrika_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: siparis lnk_musteri_siparis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparis
    ADD CONSTRAINT lnk_musteri_siparis FOREIGN KEY (musteri_id) REFERENCES public.musteri(musteri_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: envanter_yonetim lnk_paket_envanteri_envanter_yonetim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter_yonetim
    ADD CONSTRAINT lnk_paket_envanteri_envanter_yonetim FOREIGN KEY (paket_envanteri_id) REFERENCES public.paket_envanteri(paket_envanteri_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: paket_envanteri lnk_paket_ozellikleri_paket_envanteri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_envanteri
    ADD CONSTRAINT lnk_paket_ozellikleri_paket_envanteri FOREIGN KEY (paket_id) REFERENCES public.paket_ozellikleri(paket_ozellikleri_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: envanter_yonetim lnk_parca_envanteri_envanter_yonetim; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.envanter_yonetim
    ADD CONSTRAINT lnk_parca_envanteri_envanter_yonetim FOREIGN KEY (parca_envanteri_id) REFERENCES public.parca_envanteri(parca_envanteri_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: parca_envanteri lnk_parca_uretimi_parca_envanteri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parca_envanteri
    ADD CONSTRAINT lnk_parca_uretimi_parca_envanteri FOREIGN KEY (parca_id) REFERENCES public.parca_uretimi(parca_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: siparis lnk_personel_siparis; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.siparis
    ADD CONSTRAINT lnk_personel_siparis FOREIGN KEY (personel_id) REFERENCES public.personel(personel_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: arac_modeli lnk_uretilen_arac_modeli; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.arac_modeli
    ADD CONSTRAINT lnk_uretilen_arac_modeli FOREIGN KEY (uretilen_id) REFERENCES public.uretilen(uretilen_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: satis_bayii lnk_yonetim_satis_bayii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.satis_bayii
    ADD CONSTRAINT lnk_yonetim_satis_bayii FOREIGN KEY (envanter_yonetim_id) REFERENCES public.envanter_yonetim(envanter_yonetim_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

