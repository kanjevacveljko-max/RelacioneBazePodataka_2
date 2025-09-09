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
select r.ime, r.prezime, count(u.id_projekta) as broj_projekata
from radnik r, ucesce u
where r.Id_radnika = u.Id_radnika and
	  r.id_radnika in (select sef_odeljenja from odeljenje)
group by r.Id_radnika, r.ime, r.prezime

--Zadatak 3:

--a) Kreirati pogled View_Rukovodioci_Sefovi koji prikazuje imena i prezimena rukovodilaca,
--kao imena i prezimena šefova odeljenja (duplo prikazati ako je radnik i rukovodilac i šef).

create view View_Rukovodioci_Sefovi
as

select ime, prezime
from radnik
where id_radnika in (select id_radnika
					 from ucesce 
					 where funkcija = 'šef')

union all

select ime, prezime 
from radnik
where id_radnika in (select sef_odeljenja
					 from odeljenje);

--b) Pomoću kreirang pogleda View_Rukovodioci_Sefovi prikazati ime i prezime radnika
--i broj koji prikazuje koliko rukovodećih pozicija (šef, rukovodilac) ima radnik.

	select ime, prezime, count(*) as broj_pozicija
	from View_Rukovodioci_Sefovi
	group by ime, prezime

--4.2 POGLEDI – ALTER VIEW I DROP VIEW

--Zadatak 4:

--a) Kreirati pogled View_Plata_Naknada koji prikazuje ime,osnovnu platu radnika i
--naknadu za tekući mesec ako se zna da se vozačima plata povećava 15% a elektricarima 30%. 
--ne prikazivati radnike koji ne dobijaju naknadu.

create view View_Plata_Naknada 
as
select * from	
(
	select ime, plata,
	   case posao
	   when N'Vozač' then plata * 1.15
	   when N'Eleketričar' then plata * 1.30
	   else plata
	   end as Naknada
	   from radnik) as TabNaknade
where plata <> Naknada

--b) Izmeniti pogled View_Plata_Naknada tako da se u pogledu prikazuje i identifikacioni
--broj odeljenja.

alter view View_Plata_Naknada
as
select * from	
(
	select ime, plata,
	   case posao
	   when N'Vozač' then plata * 1.15
	   when N'Eleketričar' then plata * 1.30
	   else plata
	   end as Naknada, id_odeljenja
	   from radnik) as TabNaknade
where plata <> Naknada

--Zadatak 5:

--a) Kreirati pogled View_UkupnaSredstva koji prikazuje identifikacioni broj odeljenja, ime
--odeljenja i ukupna sredstva za plate i premije u odeljenju u kome je Janko Mančić šef
--odeljenja.

create view View_UkupnaSredstva 
as
select o.id_odeljenja, o.ime_od, sum(r.plata+isnull(r.premija,0)) as sredstva
from odeljenje o, radnik r
where o.id_odeljenja = r.id_odeljenja 
	  and sef_odeljenja = (select id_radnika 
						   from radnik
						   where ime = N'Janko' and prezime = N'Mančić')
group by o.Id_odeljenja, o.Ime_od

--b) Izmeniti pogled View_UkupnaSredstva tako da se ukupna sredstva prikazuju na
--dve decimale.

alter view View_UkupnaSredstva
as
select o.id_odeljenja, o.ime_od, round(sum(r.plata+isnull(r.premija,0)), 2) as sredstva
from odeljenje o, radnik r
where o.id_odeljenja = r.id_odeljenja 
	  and sef_odeljenja = (select id_radnika 
						   from radnik
						   where ime = N'Janko' and prezime = N'Mančić')
group by o.Id_odeljenja, o.Ime_od

--c) Izbrisati pogled View_UkupnaSredstva.

drop view View_UkupnaSredstva

--4.3 POGLEDI – ENKRIPCIJA

--Zadatak 6:

--a) Kreirati pogled View_NRT koji prikazuje identifikacioni broj studenta, ime, prezime i
--indeks u jednoj koloni za studente smera NRT.
use STUDENTSKA
go

create view View_NRT 
as
select id_studenta, ime, prezime, 
	   concat(rtrim(smer), '-', rtrim(convert(nchar, broj)),'/', substring(godina_upisa, 3, 2)) as indeks
from student
where smer = N'nrt';

--b) Korišćenjem sistemske procedure sp_helptext prikazati definiciju pogleda
--View_NRT.

exec sp_helptext 'View_NRT';

--c) Izmeniti pogled View_NRT tako da mu se doda enkripcija.

alter view View_NRT
with encryption
as
select id_studenta, ime, prezime, 
	   concat(rtrim(smer), '-', rtrim(convert(nchar, broj)),'/', substring(godina_upisa, 3, 2)) as indeks
from student
where smer = N'nrt';

--4.4 POGLEDI – Unos podataka

--Zadatak 7:

--a) Kreirati pogled View_Profesori koji prikazuje sve podatke o profesorima.

create view View_Profesori
as
select *
from profesor

--b) Dodati podatke o profesoru Marku Markoviću, zvanje dr, datum zaposlenja 15.3.2020.
--koristeći pogled View_Profesori.

insert into View_Profesori
values (1000, N'Marko', N'Markovic', N'dr', '2020-03-15')
