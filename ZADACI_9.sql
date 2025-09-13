use PREDUZECE
go

--1. Kreirati triger trig_Proјekat koji će za bilo koju promenu nad tabelom Projekat prikazati stare
--i nove podatke iz te tabele.

alter trigger trig_Projekat
on projekat
after update
as
begin
	 if exists (select 1 from deleted)
		begin
		select N'Stari podaci' as Izvor, *
		from deleted
		end

	if exists (select 1 from inserted)
		begin
		select N'Novi podaci' as Izvor, *
		from inserted
		end
end

--2. Kreirati triger trig_ProjekatNovi koji će u slučaju dodavanja novog projekta prikazati
--sve podatke o projektu u tabeli ProjekatLog koja ima ista polja kao i tabela Projekat
--plus još dva polja datumPromene i korisnik.

create table ProjekatLog(
	id_projekta int,
	ime_proj nvarchar(30),
	sredstva real,
	rok date,
	datumPromene date,
	korisnik nvarchar(30))

create trigger trig_ProjekatNovi
on projekat
after insert
as
begin
	insert into ProjekatLog (id_projekta, ime_proj, sredstva, rok, datumPromene, korisnik)
	values ((select id_projekta from inserted),(select ime_proj from inserted),
	(select sredstva from inserted),(select rok from inserted), SYSDATETIME(), USER_NAME())
end
	
--3. Kreirati triger trgProjekatBrisanje koji će u tabelu ProjekatLog upisati podatke o
--izbrisanom projektu.

create trigger trgProjekatBrisanje
on projekat
after delete
as
begin
	insert into ProjekatLog (id_projekta, ime_proj, sredstva, rok, datumPromene, korisnik)
	values ((select id_projekta from deleted),(select ime_proj from deleted),
	(select sredstva from deleted),(select rok from deleted), SYSDATETIME(), USER_NAME())
end
