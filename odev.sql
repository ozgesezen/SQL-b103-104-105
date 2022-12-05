-- Ankara’da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz
select * from markalar
select * from calisanlar2

select marka_id, calisan_Sayisi from markalar 
where marka_isim in (select isyeri from calisanlar2 where sehir='Ankara');

