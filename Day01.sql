--DATABASE(Veritabani) Olusturma
--Create database evren;

--create database erol;

--DQL - DATA DEFINITION LANG
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler2
( 
ogrenci_no char(7),
isim varchar(20),	
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir
kayit_tarihi date	
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
as -- Benzer tablodaki basliklarla ve data tipleriyle yeni bir tablo olusturmak icin normal tablo olustururken ki parantezler yerine as kullanip Select komutuyla almak istediğimiz verileri alırız
select isim, soyisim, not_ort from ogrenciler2;

--DML - DATA MANIPULATION LANGUAGE
-- INSERT (Database'e veri ekleme)

insert into ogrenciler2 values('1234567','Said','ILHAN',85.5,now());
insert into ogrenciler2 values('1234567','Said','ILHAN',85.5,'2020-12-11');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK

insert into ogrenciler2(isim,soyisim) values ('Erol','Evren');

--DQL - DATA QUERY LANG.
--SELECT

select * from ogrenciler2; --Burdaki *sembolu herseyi anlamindadir