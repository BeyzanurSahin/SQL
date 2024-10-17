--select * from Musteriler
--select MusteriAdi from Musteriler
--select Musteriadi,sehir from Musteriler
--select * from Satislar

--select distinct * from Satislar  -- distinct: verilen tabloyu uniqueleþtirir, tekilleþtirir
--select sevkulkesi from Satislar -- bu þekilde 830 rows var
--select distinct sevkulkesi from Satislar -- distinct ile sevuklesi sorgusu atarsak 21 rows var, uniquleþtirdi

--select * from Satislar where sevkulkesi = 'France'   -- sevkulkesi france olanlarý getiren sorgumuzda "where" kullan
                                                       --france yazsan da sorgu çalýþýyor
--select sevkadi, sevkadresi, sevkulkesi from Satislar where sevkulkesi = 'France' 

-- IN YAPISI
--select sevkadi, sevkadresi, sevksehri from Satislar where sevkulkesi = 'Brazil' and SevkSehri = 'Resende'

--select sevkadi, sevksehri, sevkulkesi from Satislar where  SevkUlkesi = 'Brazil' or SevkUlkesi = 'France' 
-- yukarýdaki sorrguyu daha kýsa ve az veri tüketecek þekilde "IN" kullanarak da yazabiliriz.

--select sevkadi, sevksehri, sevkulkesi from Satislar where  SevkUlkesi in ('Brazil','France', 'Germany')


--BETWEEN AND SORGUSU
 --select* from Satislar where NakliyeUcreti between 50 and 100 


--LIKE YAPISI VE JOKER KARAKTERLER
-- "%" sembolü SQL'de joker çardýr
--select* from Satislar where sevkadi like 'a%'    -- a ile baþlasýn sorasý ne olursa olsun önemsiz
--select* from Satislar where sevkadi like '%a'   -- % sembolü a'nýn önünde olursa, ne olduðu önemli deðil sonunda a olsun demek oluyor
--select SevkAdi from Satislar where sevkadi like '%a'
--select sevkadi from Satislar where SevkAdi like '%Wellington%'   --neyle baþladýðý ya da neyle bittiði önemli deðil içinde "Wellington" olmasý yeterli
--select sevkadi from Satislar where SevkAdi like 'w%a'  --w ile baþlasýn arada ne olduðu önemli deðil joker karaktr kullandým a ile bitsin
--select sevkadi from Satislar where SevkAdi like '_a%'    -- 2. harfi a olan ve sonrasýnýn ne olduðu önemli deðil bunlar gelsin sorgusu
                                                         -- "_" iþareti direkt olara 1karakter yerine geçerken "%" karakter sayýsýndan baðýmsýz ne kadar karakter gelirse gelsin bunlarý önemseme

-- ORDER BY SORGUSU
-- istediðimiz kolonlara göre sýralama yapmamýzý saðlar
--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by nakliyeucreti asc -- nakliye ucretini artan sýraya göre sýralar
--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by nakliyeucreti desc  -- nakliye ucretini azalan sýraya göre sýralar

--select  MusteriID, nakliyeucreti, sevkulkesi from Satislar order by SevkUlkesi asc,      
-- önce sevkulkesine göre sýrala daha sonra da nakliye ücretine göre sýralanakliyeucreti desc   
-- mesela arjantileri sýralamýs sonra nakliyeye göre sýralamýs, austriaya geçince artmýs nakliye ucreti çünkü önce sevkulkesine göre sonra nakliyeucretine göre


-- GROUP BY SORGUSU
 --Elimizdek tabloyu belli metriklere göre gruplayan fonkdur, toplam, saydýrma gibi þeyler yaptýrabiliyoruz
 --select sevkulkesi, sum(nakliyeucreti) from Satislar group by SevkUlkesi  -- sevkulkesine göre gruplayacak ve nakliye ucretlerini toplayacak
 --select sevkulkesi, sum(nakliyeucreti) as TOPLAM from Satislar group by SevkUlkesi  -- kolon ismi vermemiþti önceki sorguda, kolon ismi "TOPLAM" olsun dedik
 --select sevkulkesi,sevksehri, sum(nakliyeucreti) as TOPLAM from Satislar group by SevkUlkesi, SevkSehri order by SevkUlkesi asc

 -- COUNT YAPISI
 --select sevkulkesi, count(*) as Say from Satislar group by SevkUlkesi   -- count(*) dediðimizde tüm tabloyu saydýrmýþ oluyoruz
 -- finland'a ait 22 satýr varmýs

 -- MÝN / MAX YAPISI
 --select sevkulkesi, min(nakliyeucreti) as Say from Satislar group by SevkUlkesi  -- ülkelere ait minimum nakliye ucretlerini veren sorgu
 --select sevkulkesi, max(nakliyeucreti) as Say from Satislar group by SevkUlkesi

--COUNT SORGUSU
--select count (*) from Satislar where SevkUlkesi = 'germany' -- satýrlarý sayýyor
--select count (*) from Satislar where NakliyeUcreti >=150
--select * from Satislar

--SUM VE AVG SORGUSU
--select sum(nakliyeucreti) from Satislar 
--select sum(nakliyeucreti) from Satislar where sevkulkesi = 'brazil'
--select avg(nakliyeucreti) from Satislar 
--select avg(nakliyeucreti) from Satislar where sevkulkesi = 'germany' --çeþitli where osularýna göre satýrlarýn ortalamasýný alýyor

--HAVING YAPISI (WHERE ÝLE FARKI) GROUP BY ÝLE ÝLÝÞKÝLÝ
--select sevkulkesi, avg(nakliyeucreti) from Satislar where PersonelID = 5 group by SevkUlkesi
--içeriden satýr bazlý personelid 5 olanlara göre bir filtreleme yapýyor daha sonra bunlarýn ortalamasýný alarak sevkulkesine göre grupluyor
-- where yapýsý data üzerinden bir filtreleme yapýyor bunun üzerinden çalýþýyor, having souç üzerinden yani group by ile grupluyor daha sonra averagý 50den büyük olanlarý alýyor.
--select sevkulkesi, avg(nakliyeucreti) from Satislar group by SevkUlkesi having avg(nakliyeucreti) > 50
--gruplanmýþ çýktý üzerinden filtreleme yapýyor having yapýsý

--CREATE TABLE VE DROP TABLE KOMUTLARI
--create table kullanicilar(
--ID int, -- her bir sütunu eklerken virgül ile ayýrmayý unutma
--Ad varchar(255),
--Soyad varchar(250));
--Drop table kullanicilar
 
--TRUNCATE TABLE KOMUTU
--tablo içerisindeki deðerleri siler
--select * from KushaTable
--truncate table KushaTable 

--INSERT INTO KOMUTU
--insert into KushaTable(Name,Age) -- name ve age alanalarýný gösterelim burlara da name berke age 25 olan ver gir
--values('Berke',25)
--values('Ahmet',30)
--select * from KushaTable -- her insert into'dan sonra select fromatarsak tabloya eklenen deðeri tablo açýlmýs bir þekilde görmüþ oluruz.

--UPDATE KOMUTU
--update KushaTable set Age = 31 where ID = 5
--select * from KushaTable
-- deðiþtirilecek kolon ismi yazýlýr set ifadesinden sonra yazýlýr, daha sonra age'ini 31 yapmak istediðimiz ifade nedir onu yazýcaz
-- int verileri týrnak içinde('') yazmaya gerek yok 

--update KushaTable set Name = 'Esra', Age = 37 where ID = 4 select * from KushaTable

--DELETE KOMUTU
-- satýr siler

--delete from KushaTable where ID = 2
--select *from KushaTable

--insert into KushaTable(ID,Name,Age) values(2,'Ýrem',27) --set identity_insert tabloadý on; yapýsý ile insert ifadesini aktifleþtirdik
--select *from KushaTable
--set identity_insert KushaTable ON;

--INNER JOIN KOMUTU
--alýnacak tabloyu inner joinden sonra yaz
--on yapýsý hangi kolonu hangi kolona eþleyeceðimizi gösteriyor ürünler tablosunun tedarikçi id kolonuyla ayný þekilde tedarilçiler tablosunun tedarilçiler id kolununu eþledik
--select * from Urunler
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;

--bana sadece ürün adlarý ve ülke sayýsý lazým
--select UrunAdi from Urunler --tedarilciid istersek sql error verir çünkü tedarikçi ayrý 2 tablodada var bu nedenle unique yapýsýný bozuyor
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;

--tedarikciid 2 tabloada da yani 2kolonda daolduðu için uniqe deðil bu nedenle þu þekilde çaðýrýrýz
--select UrunAdi, Tedarikciler.TedarikciID from Urunler --urunadi zaten unique kolon ismi olduðu için urunler veyatedarilciler tablosundan çaðýrmaya gerek yok yapý ile
--inner join Tedarikciler on Urunler.TedarikciID = Tedarikciler.TedarikciID;
--bu sorgu le 77 satýr ürün adlarý ve onlarýn hangi ülkelerden geldiklerini listemiþ olduk

--PRIMARYKEY VE FOREIGN KEY YAPISI
--select * from employees --kushatable

--LEFT JOIN KOMUTU
-- hangi çalýsan hangi departmanda çalýþýyor isim olarak yazdýr
--select employees.employee_name, departments.department_name from employees
--departments tablosuna left join yapacaðýmýzý söylüyoruz 
--daha sonra employees tablosundaki department_id ile departments tablosundaki department_id kolonunu eþliyoruz
--left join departments on employees.department_id = departments.department_id

--select employees.employee_name from employees -- böyleyaparsak sadee employee_name kolonu gelir ama biz bu kolonun yanýnda çalýslanlarýn departman ismi e yazsýn istiyorsak yukarýdaki gibi depmartments tablosundan department_name kolonunu da çaðýrýrýz.
--left join departments on employees.department_id = departments.department_id 
-- departmnets tablosunun primary kye'i olan department_id, employees tablosunda foreign key'dir

--select * from employees
--select * from departments
--soldaki tabloda yani employees tablosunda olan þeyler sabit kalýr yanýna joinlenecek tablo yani departments tablosundaki eþleþen deðerler gelir, eþleþmeyenler için null gelir










