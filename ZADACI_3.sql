--1. Prikazati ime, prezime i indeks studenta (u jednoj koloni), kao i naziv predmeta za sve predmete
--koje su student položili u roku Februar, 2018/19.

select s.ime, s.prezime, 
	   concat(s.smer,'-',cast(s.broj as nvarchar),'/',substring(s.godina_upisa,3,2)) as indeks,
	   p.naziv
from student s join zapisnik z on s.id_studenta = z.id_studenta
	 join ispit i on z.id_ispita = i.id_ispita 
	 join predmet p on p.id_predmeta = i.id_predmeta
	 join ispitni_rok as ir on ir.id_roka = i.id_roka
where z.ocena >= 6 and ir.naziv = 'februar' and
	  ir.skolska_god = '2018/19'

--2. Prikazati samo nazive predmeta koje je izabrao student indeksa IS-13/19 i student IS-7/20.

select p.naziv
from predmet p join student_predmet sp on p.id_predmeta = sp.id_predmeta
	 join student s on s.id_studenta = sp.id_studenta
where s.smer = 'is' and s.broj = 13 and s.godina_upisa = '2019'

intersect

select p.naziv
from predmet p join student_predmet sp on p.id_predmeta = sp.id_predmeta
	 join student s on s.id_studenta = sp.id_studenta
where s.smer = 'is' and s.broj = 7 and s.godina_upisa = '2020'


--3. Prikazati indeks studenta i ocene iz predmeta Mikroprocesorski softver, dodati kolonu u kojoj
--će pisati Položeno ako je ocena 6 ili više, u suprotnom Nije položeno.

select concat(s.smer,'-',cast(s.broj as nvarchar),'/',substring(s.godina_upisa,3,2)) as indeks,
	   z.ocena,
	   case
	   when z.ocena>=6 then 'polozeno'
	   else 'nije polozeno'
	   end as Status
from student s join zapisnik z on s.id_studenta = z.id_studenta
	 join ispit i on i.id_ispita = z.id_ispita
	 join predmet p on p.id_predmeta = i.id_predmeta
where p.naziv = 'Mikroprocesorski softver'

--4. Promeniti zvanje profesora Bojana Mikića na dr.

update profesor
set zvanje = 'dr'
where ime = 'Bojan' and prezime = 'Mikić'
