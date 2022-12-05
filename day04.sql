--ALIASES

CREATE TABLE calisanlar3  (
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar3

--eger iki sutunun verilerini birlestirmek istersek concat || kullaniriz
select calisan_id as id, calisan_isim ||''||calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3

--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar

CREATE TABLE insanlar
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar;

--Name sutununda null olan degerleri listeleyelim
select name from insanlar where name is null;
select name from insanlar where name is not null; --null olayan degerleri getirir

--insanlar tablosunda null deger almis verileri no name olarak degistiriniz
update insanlar
set name ='No name'
where name is null;

--ORDER BY KOMUTU
/*
tablolardaki verileri siralamak icin order by kullaniriz 
buyukten kucuge yada kucukten buyuge siralama yapabiliriz
default olarak kucukten buyuge siralama yapar 
eger buyukten kucuge siralamak istersen order by komutundan sonra DESC komutunu kullaniriz
*/

CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--insanlar tablosundaki datalari adrese gore siralayin
select * from insanlar1 order by adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
select * from insanlar1 where isim='Mine' order by ssn;


--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

select * from insanlar1 where soyisim='Bulut' order by 1;

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

select * from insanlar1 order by ssn desc;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
select * from insanlar1 order by isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
select isim,soyisim from insanlar1 order by length(soyisim);
/* 
eger sutun uzunluguna gore siralamak istersek length komutunu kullaniriz
ve yine uzunlugu buyukten kucuge siralamak istersek sonuna desc komutu ekleriz

*/
select isim,soyisim from insanlar1 order by length(soyisim) desc;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
select isim ||' '||soyisim as isim_soyisim from insanlar1
order by length(isim||soyisim);

SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar ORDER BY LENGTH (concat(isim,soyisim))


--GROUP BY KULLANIMI
CREATE TABLE manav
(
isim varchar(50),  
Urun_adi varchar(50),  
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav;

--isme gore alinan toplam urunleri bulun ve bu urunleri buyukten kucuge siralayin
select isim, sum(Urun_miktar) as alinan_toplam_urun from manav
group by isim
order by alinan_toplam_urun desc;


--Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi, count(isim) from manav
group by urun_adi;

select isim, count(urun_adi) from manav
group by isim;