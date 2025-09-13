use STUDENTSKA
go

--1. Kreirati funkcija fun_PredmetProsek1 koja u zavisnosti od prosleđenog naziva predmeta
--vraća prosečnu ocenu na tom predmetu.

create function fun_PredmetProsek1(@naziv nvarchar(30))
returns real
as
begin
	declare @prosecnaOcena real
	set @prosecnaOcena = (select avg(ocena)
						  from zapisnik z inner join ispit i
							   on z.id_ispita = i.id_ispita
							   inner join predmet p
							   on p.id_predmeta = i.id_predmeta
						   where p.naziv = @naziv)
	return @prosecnaOcena
end;

--2. Prikazati prosečnu ocenu za predmet Baze podataka koristeći funkciju fun_PredmetProsek.

select dbo.fun_PredmetProsek1('Baze podataka') 


--3. Prikazati ime, prezime i indeks studenta, koji na predmetu Baze podataka imaju ocenu manju
--od prosečne ocene na tom predmetu. Koristiti funkciju fun_PredmetProsek.

select concat(s.smer, '-', cast(s.broj as varchar), '/', substring(godina_upisa, 3, 2)) as indeks,
	   s.ime, s.prezime, z.ocena
from student s join zapisnik z on s.id_studenta = z.id_studenta
	 join ispit i on i.id_ispita = z.id_ispita
	 join predmet p on p.id_predmeta = i.id_predmeta
where p.naziv = 'Baze podataka' and
	  z.ocena < dbo.fun_PredmetProsek1('Baze podataka');