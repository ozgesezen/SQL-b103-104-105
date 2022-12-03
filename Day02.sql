CREATE TABLE ogrenciler5
( 
ogrenci_no char(7), --Uzunlugunu bildigimiz stringler icin CHAR kullanilir
isim varchar(20),	--Uzunlugunu bilmedigimiz stringler icin VARCHAR kullaniriz
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir
kayit_tarihi date);

--VAR OLAN BIR TABLODAN YENI BIR TABLO OLUSTURMA
create table notlar
as
select isim, not_ort from ogrenciler5;

select * from notlar;

--INSERT -TABLO ICINE VERI EKLEME

insert into notlar values('Orhan',95.5);
insert into notlar values('Ali',95.5);
insert into notlar values('Hakan',95.5);
insert into notlar values('Adem',95.5);
insert into notlar values('Sumeyye',95.5);
insert into notlar values('Musa',95.5);

create table talebeler
(
isim varchar(10),
notlar real
	);

insert into talebeler values('Orhan',95.5);
insert into talebeler values('Ali',95.5);
insert into talebeler values('Hakan',95.5);
insert into talebeler values('Adem',95.5);
insert into talebeler values('Sumeyye',95.5);
insert into talebeler values('Musa',95.5);

select isim from notlar;

--CONSTRAINT
--UNIQUE

CREATE table ogrenciler7
(
ogrenci_no char(7) unique,
isim varchar(28) not null,
soyisim varchar(25),
not_ort real,	
kayit_tarih date
);
select * from ogrenciler7 

insert into ogrenciler7 values('1234567','Erol','Evren',75.5,now()); 
insert into ogrenciler7 values('1234568','Ali','Veli',75.5,now());
insert into ogrenciler7 (ogrenci_no,soyisim,not_ort) values ('1234569','Evren',85.5); --not null kisitlamasi oldugu icin bu veri eklenemez


--PRIMARY KEY ATAMASI

CREATE table ogrenciler8
(
ogrenci_no char(7) primary key,
isim varchar(28),
soyisim varchar(25),
not_ort real,	
kayit_tarih date
);


--PRIMARY KEY ATAMASI 2. YOL

CREATE table ogrenciler9
(
ogrenci_no char(7),
isim varchar(28),
soyisim varchar(25),
not_ort real,	
kayit_tarih date,
CONSTRAINT ogr primary key(ogrenci_no)	
);

--3. yol
CREATE table ogrenciler10
(
ogrenci_no char(7),
isim varchar(28),
soyisim varchar(25),
not_ort real,	
kayit_tarih date,
primary key(ogrenci_no)	
);

-- FOREIGN KEY 
/*
Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

create table tedarikciler3
(
tedarikci_id char(5) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);

create table urunler(
tedarikci_id char(5),
urun_id char(5),	
foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)
);

create table urunler1(
tedarikci_id char(5),
urun_id char(5),	
constraint urn_fk foreign key(tedarikci_id) references tedarikciler3(tedarikci_id)
);

select * from tedarikciler3;

/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/

create table calisanlar
(
id char(5) primary key,
isim varchar(20) unique,
maas int not null,
ise_baslama date	
);

create table adresler
(
adres_id char(5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
foreign key (adres_id) references calisanlar(id)	
);

INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14');  --unique cons oldugu icin kabul etmedi
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12');  --not null cons kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); --unique
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');--ikinci hicligi kabul etmez
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- primary key
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');--primary key

INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from calisanlar;
select * from adresler;

create table calisanlar1
(
id char(5) primary key,
isim varchar(20) unique,
maas int check (maas>1000),
ise_baslama date	
);

INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,1900, '2018-04-14');

create table calisanlar2
(
id char(5) primary key,
isim varchar(20) unique,
maas int check (maas>1000) not null,
ise_baslama date	
);

--DQL -WHERE KULLANIMI

select * from calisanlar;
select isim from calisanlar;

--calisanlar tablosundan maasi 5000 den buyuk olan isimleri listeleyiniz
select isim from calisanlar where maas>5000;

--calisanlar tablosundan ismi velihan olan tum verileri listeleyiniz
select * from calisanlar where isim='Veli Han';

-- calisanlar tablosundan maasi 5000 olan tum verileri listeleyin
select * from calisanlar where maas=5000;

--DML DELETE KOMUTU
DELETE FROM calisanlar; -- eger parent tablo baska bir child tablo ile iliskili ise silemezsiniz

--adresler tablosundan sehri Antep olan verileri silin
delete from adresler where sehir='Antep';

CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim



