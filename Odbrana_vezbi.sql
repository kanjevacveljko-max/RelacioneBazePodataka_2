--1. Potrebno je kreirati proizvoljnu bazu podataka koja sadrži dve tabele, postaviti primarne kljuceve 
--   i povezati tabele. 

create database 

--2. Prikazati ime i prezime studenta u jednoj koloni, indeks u drugoj, i prose?nu ocenu zaokruženu 
--   na dve decimale. Sortirati po prosecnoj oceni u opadajecem redosledu.

select concat(s.ime,' ',s.prezime) as ime_i_prezime,
	   concat(s.smer, '-', cast(s.broj as varchar), '/', substring(s.godina_upisa, 3, 2)) as indeks,
	   round(avg(z.ocena), 2) as prosecna_ocena
from student s inner join zapisnik z on s.id_studenta = z.id_studenta
where z.ocena >= 6
group by s.id_studenta, s.ime, s.prezime, s.smer, s.broj, s.godina_upisa
order by prosecna_ocena desc


--3. Prikazati indeks studenta i ocene iz predmeta Mikroprocesorski softver, dodati kolonu u kojoj 
--   ce pisati Položeno ako je ocena 6 ili više, u suprotnom Nije položeno.

select concat(s.smer, '-', cast(s.broj as varchar), '/', substring(s.godina_upisa, 3, 2)) as indeks,
	   z.ocena, 
	   case 
			when z.ocena < 6 then N'Nije polozeno'
			else N'Polozeno'
		end as Status
from student s join zapisnik z on s.id_studenta = z.id_studenta
	 join predmet p on p.id_predmeta = z.id_predmeta
where p


--4. Promeniti status predmeta Programski jezici u obavezan.

update predmet
set status = 'obavezan'
where naziv = 'Programski jezici'


--5. Koisteci pogled View_Student_Ispit koji prikazuje sve studenta smera NRT, broj ispita koje su 
--   pložili i njihovu prosecnu ocenu.

select concat(s.smer, '-', cast(s.broj as varchar), '/', substring(s.godina_upisa, 3, 2)),
	   s.ime, s.prezime, count(z.ocena) as broj_polozenih,
	   round(avg(z.ocena), 2) as prosecna_ocena
from student s join zapisnik z on s.id_studenta = z.id_studenta
where s.smer = 'NRT' and z.ocena >= 6
group by z.id_studenta, s.ime, s.prezime, s.smer, s.broj, s.godina_upisa


--6. Kreirati funkcija fun_PredmetProsek koja u zavisnosti od prosledjenog naziva predmeta vraca prosecnu
--   ocenu na tom predmetu. Prikazati prosecnu ocenu za predmet Baze podataka koristeci funkciju fun_PredmetProsek.

create function fun_PredmetProsek(@naziv nvarchar(30))
returns real
as
begin
return
(select avg(z.ocena)
from zapisnik z inner join ispit i 
	 on z.id_ispita = i.id_ispita 
	 join predmet p 
	 on p.id_predmeta = i.id_predmeta
where z.ocena >= 6
group by p.naziv
having p.naziv = N'Baze podataka'
)
end

select dbo.fun_PredmetProsek(N'Baze podataka');


--7. Kreirati funkciju fun_StudentOcena koja ce na osnovu prosledjenog identifikacionog broja studenta
--   prikazati nazive predmeta koje je student položio i ocenu koju je dobio. 

create function fun_StudentOcena(@idStudenta int)
returns table
as
return
(
select p.naziv, z.ocena
from student s inner join zapisnik z 
	 on s.id_studenta = z.id_studenta
	 join ispit i
	 on i.id_ispita = z.id_ispita
	 join predmet p
	 on p.id_predmeta = i.id_predmeta
where z.ocena >= 6 and
	  s.id_studenta = 1
)

--8. Kreirati proceduru SP_StudentiPredmeti kojoj se prosle?uje identifikacioni broj studenta.
--   Za studenta koji je izabrao manje od tri predmeta potrebno je da se vrati poruka 
--   “Nedovoljno predmeta izabrano”,u suprotnom “Dovoljno predmeta izabrano”.

--9. Kreirati uskladištenu proceduru SP_DodajProfesora sa primenom transakcije koja dodaje novog 
--   profesora, zadaje se identifikacioni broj, ime, prezime, a zatim se tom profesoru dodaje 
--   predmet Mikroracunnari. Obe aktivnosti treba da se izvrše ili ni jedna.

--10 Kreirati triger trig_Student koji ce za bilo koju promenu nad tabelom Student prikazati stare i 
--   nove podatke iz te tabele.

create trigger trig_Student 
on student
after update
as
begin
	