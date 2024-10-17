--select * from Musteriler
--select MusteriAdi from Musteriler
--select Musteriadi,sehir from Musteriler
--select * from Satislar

--select distinct * from Satislar  -- distinct: verilen tabloyu uniquele�tirir, tekille�tirir
--select sevkulkesi from Satislar -- bu �ekilde 830 rows var
--select distinct sevkulkesi from Satislar -- distinct ile sevuklesi sorgusu atarsak 21 rows var, uniqule�tirdi

--select * from Satislar where sevkulkesi = 'France'   -- sevkulkesi france olanlar� getiren sorgumuzda "where" kullan
                                                       --france yazsan da sorgu �al���yor
--select sevkadi, sevkadresi, sevkulkesi from Satislar where sevkulkesi = 'France' 

-- IN YAPISI
--select sevkadi, sevkadresi, sevksehri from Satislar where sevkulkesi = 'Brazil' and SevkSehri = 'Resende'

--select sevkadi, sevksehri, sevkulkesi from Satislar where  SevkUlkesi = 'Brazil' or SevkUlkesi = 'France' 
-- yukar�daki sorrguyu daha k�sa ve az veri t�ketecek �ekilde "IN" kullanarak da yazabiliriz.

--select sevkadi, sevksehri, sevkulkesi from Satislar where  SevkUlkesi in ('Brazil','France', 'Germany')


--BETWEEN AND SORGUSU
 --select* from Satislar where NakliyeUcreti between 50 and 100 


--LIKE YAPISI VE JOKER KARAKTERLER
-- "%" sembol� SQL'de joker �ard�r
--select* from Satislar where sevkadi like 'a%'    -- a ile ba�las�n soras� ne olursa olsun �nemsiz
--select* from Satislar where sevkadi like '%a'   -- % sembol� a'n�n �n�nde olursa, ne oldu�u �nemli de�il sonunda a olsun demek oluyor
--select SevkAdi from Satislar where sevkadi like '%a'
--select sevkadi from Satislar where SevkAdi like '%Wellington%'   --neyle ba�lad��� ya da neyle bitti�i �nemli de�il i�inde "Wellington" olmas� yeterli
--select sevkadi from Satislar where SevkAdi like 'w%a'  --w ile ba�las�n arada ne oldu�u �nemli de�il joker karaktr kulland�m a ile bitsin
--select sevkadi from Satislar where SevkAdi like '_a%'    -- 2. harfi a olan ve sonras�n�n ne oldu�u �nemli de�il bunlar gelsin sorgusu
                                                         -- "_" i�areti direkt olara 1karakter yerine ge�erken "%" karakter say�s�ndan ba��ms�z ne kadar karakter gelirse gelsin bunlar� �nemseme

-- ORDER BY SORGUSU
-- istedi�imiz kolonlara g�re s�ralama yapmam�z� sa�lar
--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by nakliyeucreti asc -- nakliye ucretini artan s�raya g�re s�ralar
--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by nakliyeucreti desc  -- nakliye ucretini azalan s�raya g�re s�ralar

--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by SevkUlkesi asc,      
-- �nce sevkulkesine g�re s�rala daha sonra da nakliye �cretine g�re s�ralanakliyeucreti desc   
-- mesela arjantileri s�ralam�s sonra nakliyeye g�re s�ralam�s, austriaya ge�ince artm�s nakliye ucreti ��nk� �nce sevkulkesine g�re sonra nakliyeucretine g�re


-- GROUP BY SORGUSU
 --Elimizdek tabloyu belli metriklere g�re gruplayan fonkdur, toplam, sayd�rma gibi �eyler yapt�rabiliyoruz
 --select sevkulkesi, sum(nakliyeucreti) from Satislar group by SevkUlkesi  -- sevkulkesine g�re gruplayacak ve nakliye ucretlerini toplayacak
 --select sevkulkesi, sum(nakliyeucreti) as TOPLAM from Satislar group by SevkUlkesi  -- kolon ismi vermemi�ti �nceki sorguda, kolon ismi "TOPLAM" olsun dedik
 --select sevkulkesi,sevksehri, sum(nakliyeucreti) as TOPLAM from Satislar group by SevkUlkesi, SevkSehri order by SevkUlkesi asc

 -- COUNT YAPISI
 --select sevkulkesi, count(*) as Say from Satislar group by SevkUlkesi   -- count(*) dedi�imizde t�m tabloyu sayd�rm�� oluyoruz
 -- finland'a ait 22 sat�r varm�s

 -- M�N / MAX YAPISI
 --select sevkulkesi, min(nakliyeucreti) as Say from Satislar group by SevkUlkesi  -- �lkelere ait minimum nakliye ucretlerini veren sorgu
 --select sevkulkesi, max(nakliyeucreti) as Say from Satislar group by SevkUlkesi

--COUNT SORGUSU
--select count (*) from Satislar where SevkUlkesi = 'germany' -- sat�rlar� say�yor
--select count (*) from Satislar where NakliyeUcreti >=150
--select * from Satislar

--SUM VE AVG SORGUSU
--select sum(nakliyeucreti) from Satislar 
--select sum(nakliyeucreti) from Satislar where sevkulkesi = 'brazil'
--select avg(nakliyeucreti) from Satislar 
--select avg(nakliyeucreti) from Satislar where sevkulkesi = 'germany' --�e�itli where osular�na g�re sat�rlar�n ortalamas�n� al�yor

--HAVING YAPISI (WHERE �LE FARKI) GROUP BY �LE �L��K�L�
--select sevkulkesi, avg(nakliyeucreti) from Satislar where PersonelID = 5 group by SevkUlkesi
--i�eriden sat�r bazl� personelid 5 olanlara g�re bir filtreleme yap�yor daha sonra bunlar�n ortalamas�n� alarak sevkulkesine g�re grupluyor
-- where yap�s� data �zerinden bir filtreleme yap�yor bunun �zerinden �al���yor, having sou� �zerinden yani group by ile grupluyor daha sonra averag� 50den b�y�k olanlar� al�yor.
--select sevkulkesi, avg(nakliyeucreti) from Satislar group by SevkUlkesi having avg(nakliyeucreti) > 50
--gruplanm�� ��kt� �zerinden filtreleme yap�yor having yap�s�

--CREATE TABLE VE DROP TABLE KOMUTLARI
--create table kullanicilar(
--ID int, -- her bir s�tunu eklerken virg�l ile ay�rmay� unutma
--Ad varchar(255),
--Soyad varchar(250));
--Drop table kullanicilar
 
--TRUNCATE TABLE KOMUTU
--tablo i�erisindeki de�erleri siler
--select * from KushaTable
--truncate table KushaTable 

--INSERT INTO KOMUTU
--insert into KushaTable(Name,Age) -- name ve age alanalar�n� g�sterelim burlara da name berke age 25 olan ver gir
--values('Berke',25)
--values('Ahmet',30)
--select * from KushaTable -- her insert into'dan sonra select fromatarsak tabloya eklenen de�eri tablo a��lm�s bir �ekilde g�rm�� oluruz.

--UPDATE KOMUTU
--update KushaTable set Age = 31 where ID = 5
--select * from KushaTable
-- de�i�tirilecek kolon ismi yaz�l�r set ifadesinden sonra yaz�l�r, daha sonra age'ini 31 yapmak istedi�imiz ifade nedir onu yaz�caz
-- int verileri t�rnak i�inde('') yazmaya gerek yok 

--update KushaTable set Name = 'Esra', Age = 37 where ID = 4 select * from KushaTable

--DELETE KOMUTU
-- sat�r siler

--delete from KushaTable where ID = 2
--select *from KushaTable

--insert into KushaTable(ID,Name,Age) values(2,'�rem',27) --set identity_insert tabload� on; yap�s� ile insert ifadesini aktifle�tirdik
--select *from KushaTable
--set identity_insert KushaTable ON;

--INNER JOIN KOMUTU
--al�nacak tabloyu inner joinden sonra yaz
--on yap�s� hangi kolonu hangi kolona e�leyece�imizi g�steriyor �r�nler tablosunun tedarik�i id kolonuyla ayn� �ekilde tedaril�iler tablosunun tedaril�iler id kolununu e�ledik
--select * from Urunler
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;

--bana sadece �r�n adlar� ve �lke say�s� laz�m
--select UrunAdi from Urunler --tedarilciid istersek sql error verir ��nk� tedarik�i ayr� 2 tablodada var bu nedenle unique yap�s�n� bozuyor
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;

--tedarikciid 2 tabloada da yani 2kolonda daoldu�u i�in uniqe de�il bu nedenle �u �ekilde �a��r�r�z
--select UrunAdi, Tedarikciler.TedarikciID from Urunler --urunadi zaten unique kolon ismi oldu�u i�in urunler veyatedarilciler tablosundan �a��rmaya gerek yok yap� ile
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;
--bu sorgu le 77 sat�r �r�n adlar� ve onlar�n hangi �lkelerden geldiklerini listemi� olduk

--PRIMARYKEY VE FOREIGN KEY YAPISI
--select * from employees --kushatable

--LEFT JOIN KOMUTU
-- hangi �al�san hangi departmanda �al���yor isim olarak yazd�r
--select employees.employee_name, departments.department_name from employees
--departments tablosuna left join yapaca��m�z� s�yl�yoruz 
--daha sonra employees tablosundaki department_id ile departments tablosundaki department_id kolonunu e�liyoruz
--left join departments on employees.department_id = departments.department_id

--select employees.employee_name from employees -- b�yleyaparsak sadee employee_name kolonu gelir ama biz bu kolonun yan�nda �al�slanlar�n departman ismi e yazs�n istiyorsak yukar�daki gibi depmartments tablosundan department_name kolonunu da �a��r�r�z.
--left join departments on employees.department_id = departments.department_id 
-- departmnets tablosunun primary kye'i olan department_id, employees tablosunda foreign key'dir

--select * from employees
--select * from departments
--soldaki tabloda yani employees tablosunda olan �eyler sabit kal�r yan�na joinlenecek tablo yani departments tablosundaki e�le�en de�erler gelir, e�le�meyenler i�in null gelir










