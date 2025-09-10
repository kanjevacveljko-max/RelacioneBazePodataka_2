--1. Kreirati pogled View_Student_Prosek koji prikazuje indeks, ime, prezime i prosecnu ocenui smer
--svih studenata.

create view View_Student_Prosek
as
select concat(s.smer,'-',cast(s.broj as nvarchar),'/',substring(s.godina_upisa,3,2)) as indeks,
	   s.ime, s.prezime, s.smer, round(avg(ocena),2) as prosecna_ocena
from student s, zapisnik z
where s.id_studenta = z.id_studenta
group by z.id_studenta, s.ime, s.prezime, s.broj, s.smer, s.godina_upisa


--2. Koristeci pogled View_Student_Prosek prikazati prosecne ocene studenata RT smera.

select *
from View_Student_Prosek
where smer = 'rt'

--3. Dodati enkripciju pogledu View_Student_Prosek.

alter view View_Student_Prosek
with encryption
as
select concat(s.smer,'-',cast(s.broj as nvarchar),'/',substring(s.godina_upisa,3,2)) as indeks,
	   s.ime, s.prezime, s.smer, round(avg(ocena),2) as prosecna_ocena
from student s, zapisnik z
where s.id_studenta = z.id_studenta
group by z.id_studenta, s.ime, s.prezime, s.broj, s.smer, s.godina_upisa

--4. Izbrisati pogled View_Student_Prosek

drop view View_Student_Prosek;