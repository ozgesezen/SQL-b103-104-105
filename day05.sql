--Group by
CREATE TABLE personel1
(
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20)
);
INSERT INTO personel1 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel1 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel1 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel1 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel1 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel1 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel1 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

delete from personel1

--1)Isme gore toplam maaslari bulun
select isim,sum(maas) from personel1 
group by isim;

select isim, count(sehir) from personel1
group by isim;

--Having Kullanimi
/*
having komutu yalnizca group by ile kullanilir 
eger gruplamadan sonra bir sart varsa having kullanilir
where kullanimi ile ayni mantikla calisir
*/
--1) Her sirketin MIN maaslarini eger 4000’den buyukse goster
select sirket, min(maas) as en_dusuk_maas from personel1
group by sirket
having min(maas)>4000;

-- 2) Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi
-- ve toplam maasi gosteren sorgu yaziniz
select isim,sum(maas) as toplam_maas from personel1
group by isim
having sum(maas)>10000;

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
select sehir, count(isim) as toplam_personel_sayisi from personel1
group by sehir
having count(isim)>1;


-- 4) Eger bir sehirde alinan MAX maas 5000’den dusukse
-- sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir,max(maas) from personel1
group by sehir
having max(maas)<5000;

--UNION OPERATOR

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan
-- sehirleri gosteren sorguyu yaziniz
select isim,maas from personel1
where maas>4000
union
select sehir,maas from personel1
where maas>5000;

--Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz
select isim,maas from personel1
where isim='Mehmet Ozturk'
union
select sehir,maas from personel1
where sehir='Istanbul'
order by maas desc; --siralama

CREATE TABLE personel2
(
id int,
isim varchar(50),  
sehir varchar(50), 
maas int,  
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id))
INSERT INTO personel2 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel2 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel2 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel2 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel2 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel2 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel2 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
	
CREATE TABLE personel_bilgi  (
id int,
tel char(10) UNIQUE ,  
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY (id) REFERENCES personel2(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678', 5);  
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);	

-- id’si 123456789 olan personelin    Personel tablosundan sehir ve maasini, 
-- personel_bilgi  tablosundan da tel ve cocuk sayisini yazdirin
select sehir,maas as sehir_tel from personel2
where id=123456789
union
select tel, cocuk_sayisi from personel_bilgi
where id=123456789;
--UNION ALL
/*
Union tekrarli verileri teke düşürür ve bize o şekilde sonuç verir
Union All ise tekrarli verilerle birlikte tün sorguları getirir
*/
--Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
select isim,maas from personel2 where maas<5000
union all
select isim,maas from personel2 where maas<5000;

--INTERSECT (kesisim)
/*
Farkli iki tablodaki ortak verileri intersect komutu ile getirebiliriz
*/
-- Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
SELECT id from personel2 where sehir in('Istanbul','Ankara')
intersect
-- Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
select id from personel_bilgi where cocuk_sayisi in(2,3);

--Honda, ford ve tofasta calisan ortak isimler
select isim from personel2 where sirket='Honda'
intersect
select isim from personel2 where sirket='Ford'
intersect
select isim from personel2 where sirket='Tofas';


--EXCEPT
/*
IKI SORGUDA DA OLMAYAN VERIYI VERIR
*/
--5000 den az maas alip hondada calismayanlari
select isim,sirket from personel2 where maas<5000
except
select isim,sirket from personel2 where sirket='Honda'









