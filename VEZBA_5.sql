--Zadatak 1: Implementirati funkciju fun_PreduzeceMaxPlata koja vraća najveću platu u zadatom
--odeljenju.

--a) Prvi način

create function fun_PreduzeceMaxPlata (@imeOdeljenja nchar(20))
returns float
as
begin
	return (select max(plata) 
			from radnik
			where id_odeljenja = (select id_odeljenja
								  from odeljenje
								  where ime_od = @imeOdeljenja));
end

--b) Drugi način

create function fun_PreduzeceMaxPlata (@imeOdeljenja nchar(20))
returns float
as
begin 
	declare @maxPlata float
	select @maxPlata = max(plata)
	from radnik
	where id_odeljenja = (select id_odeljenja
						  from odeljenje
						  where ime_od = @imeOdeljenja)
return @maxPlata
end

--c) Treći način

create function fun_PreduzeceMaxPlata (@imeOdeljenja nchar(20))
returns float
as
begin 
	declare @maxPlata float
	set @maxPlata = (select max(plata) 
					 from radnik
					 where id_odeljenja = (select id_odeljenja
										   from odeljenje
										   where ime_od = @imeOdeljenja))
return @maxPlata
end;


--Zadatak 2:

--a) Koristeći funkciju fun_PreduzeceMaxPlata prikazati najveću platu u odeljenju Plan.

select dbo.fun_PreduzeceMaxPlata(N'Plan')

--b) Prikazati ime odeljenja u kome radi radnik sa najvećom platom primenom funkcije
--funkciju fun_PreduzeceMaxPlata.

select ime_od
from odeljenje
where dbo.fun_PreduzeceMaxPlata(ime_od) =
	  (select max(plata) from radnik)

--c) Prikazati imena i prezimena radnika koji imaju platu veću od maksimalne
--plate u odeljenju Derekcija.

select ime, prezime
from radnik
where plata > dbo.fun_PreduzeceMaxPlata(N'Direkcija')


--Zadatak 3:

--a) Kreirati funkciju fun_Radnik_Staz koja vraća godine staza radnika čije se ime i prezime
--zadaju.

create function fun_Radnik_Staz
(@imeRadnika nchar(20), 
@prezimeRadnika nchar(20))
returns int
as
begin
	declare @godineStaza int
	set @godineStaza = (select datediff(yy,dat_zap,getdate())
						from radnik
						where ime = @imeRadnika		
							  and prezime = @prezimeRadnika)
return @godineStaza
end


--b) Koristeći funkciju fun_Radnik_Staz prikazati godine staža za radnika Luku Boškovića.

select dbo.fun_Radnik_Staz(N'Luka', N'Bošković');

--c) Koristeći funkciju fun_Radnik_Staz prikazati godine staža za radnika Luku Bojića.

select dbo.fun_Radnik_Staz(N'Luka', N'Bojić');


--Zadatak 4: Modifikovati funkciju fun_Radnik_Staz, tako da za nepostojećeg radnika prikaže broj
--nula za godine radnog staža, a ne NULL vrednost i uraditi proveru prikaza.

alter function fun_Radnik_Staz
(@imeRadnika nchar(20), 
@prezimeRadnika nchar(20))
returns int
as
begin
	declare @godineStaza int = 0
	set @godineStaza = (select datediff(yy,dat_zap,getdate())
						from radnik
						where ime = @imeRadnika		
							  and prezime = @prezimeRadnika)
return @godineStaza
end


--Zadatak 5:

--a) Kreirati upit koji prikazuje ime, prezime i godine staža svih radnika u preduzeću
--primenom funkcije fun_Radnik_Staz .

select ime, prezime, dbo.fun_Radnik_Staz(ime, prezime) as godine_staza
from radnik


--b) Kreirati upit koji prikazuje ime i prezime i nazive projekata na kojima rade samo za
--radnike koji imaju od 20 do 30 godina staža. Koristiti funkcije fun_Radnik_Staz .

select r.ime, r.prezime, p.ime_proj
from radnik r, ucesce u, projekat p
where r.Id_radnika = u.Id_radnika and
	  u.Id_projekta = p.Id_projekta and
	  dbo.fun_Radnik_Staz(r.ime, r.prezime) between 20 and 30;

--Zadatak 6: Kreirati funkciju fun_StudentBrojIspita koja za prosleđeni identifikacioni broj
--studenta vraća broj položenih ispita.

use STUDENTSKA

create function fun_StudentBrojIspita(@id int)
returns int
as
begin
	declare @brojPolozenih int
	set @brojPolozenih = (select count(*)
						  from zapisnik 
						  where id_studenta = @id)
	return @brojPolozenih
end



--Zadatak 7:

--a) Proveriti koliko ispita je položio student identifikacionog broja 10 koristeći funkciju
--fun_StudentBrojIspita.

select dbo.fun_StudentBrojIspita(10)

--b) Prikazati imena i prezimena studenata i broj ispita koje su položili za studente koji su položili
--više od 6 ispita. Koristiti funkciju fun_StudentBrojIspita.

select ime, prezime, dbo.fun_StudentBrojIspita(id_studenta) as broj_polozenih
from student
where dbo.fun_StudentBrojIspita(id_studenta) > 6;