--4.1 POGLEDI – CREATE VIEW

--Zadatak 1:

--a) Kreirati pogled View_Penzioneri koji prikazuje imena i prezimena radnika koji imaju više
--od 40 godina staža.

create view View_Penzioneri 
as
select ime, prezime
from radnik
where datediff(yy, dat_zap, getdate()) >= 40;

--b) Prikazati imena i prezimena radnika koji imaju više od 40 godina staža.

select * from View_Penzioneri;

--Zadatak 2: Kreirati pogled View_Sefovi_Projekti koji prikazuje imena i prezime šefova odeljenja i
--broj projekata na kojima rade.

create view View_Sefovi_Projekti
as
select ime, prezime, count(ucesce.id_projekta) as broj_projekata
from ucesce, radnik
where ucesce.Id_radnika = radnik.Id_radnika
	  and radnik.id_radnika in (select sef_odeljenja
								from odeljenje)
group by radnik.Id_radnika, ime, prezime;

--Zadatak 3:

--a) Kreirati pogled View_Rukovodioci_Sefovi koji prikazuje imena i prezimena rukovodilaca,
--kao imena i prezimena šefova odeljenja (duplo prikazati ako je radnik i rukovodilac i šef).

create view View_Rukovodioci_Sefovi
as
select ime, prezime
from radnik
where radnik.id_radnika in (select sef_odeljenja 
							from odeljenje)
union all
select ime, prezime
from radnik
where radnik.id_radnika in (select id_radnika 
							from ucesce where funkcija = N'šef');

--b) Pomoću kreirang pogleda View_Rukovodioci_Sefovi prikazati ime i prezime radnika
--i broj koji prikazuje koliko rukovodećih pozicija (šef, rukovodilac) ima radnik.

select ime, prezime, count(*) as broj
from View_Rukovodioci_Sefovi
group by ime, prezime;

--4.2 POGLEDI – ALTER VIEW I DROP VIEW

--Zadatak 4:

--a) Kreirati pogled View_Plata_Naknada koji prikazuje ime,osnovnu platu radnika i
--naknadu za tekući mesec ako se zna da se vozačima plata povećava 15% a



--b) Izmeniti pogled View_Plata_Naknada tako da se u pogledu prikazuje i identifikacioni
--broj odeljenja.



--Zadatak 5:

--a) Kreirati pogled View_UkupnaSredstva koji prikazuje identifikacioni broj odeljenja, ime
--odeljenja i ukupna sredstva za plate i premije u odeljenju u kome je Janko Mančić šef
--odeljenja.



--b) Izmeniti pogled View_UkupnaSredstva tako da se ukupna sredstva prikazuju na
--dve decimale.



--c) Izbrisati pogled View_UkupnaSredstva.



--4.3 POGLEDI – ENKRIPCIJA

--Zadatak 6:

--a) Kreirati pogled View_NRT koji prikazuje identifikacioni broj studenta, ime, prezime i
--indeks u jednoj koloni za studente smera NRT.



--b) Korišćenjem sistemske procedure sp_helptext prikazati definiciju pogleda
--View_NRT.



--c) Izmeniti pogled View_NRT tako da mu se doda enkripcija.



--4.4 POGLEDI – Unos podataka

--Zadatak 7:

--a) Kreirati pogled View_Profesori koji prikazuje sve podatke o profesorima.



--b) Dodati podatke o profesoru Marku Markoviću, zvanje dr, datum zaposlenja 15.3.2020.
--koristeći pogled View_Profesori.


