use PREDUZECE
go

--Zadatak 1:

--a) Kreirati funkciju fun_Posao, koja za zadato ime i prezime radnika vraća posao,
--kvalifikaciju i primanja.

create function fun_Posao
(@ime nchar(20),
@prezime nchar(20))
returns table
as
return
(
	select  posao, kvalif, plata + isnull(premija, 0) as primanja
	from radnik
	where ime = @ime and prezime = @prezime
);

--b) Prikazati posao koji obavlja radnik Petar Vasić , njegovu kvalifikaciju i primanja koristeći
--funkciju fun_Posao.

select * 
from dbo.fun_Posao(N'Petar', N'Vasić');

--Zadatak 2:

--a) Kreirati funkciju fun_OdeljenjeProsek koja vraća imena odeljenja i prosečna primanja u
--njima samo za odeljenja u kojima su prosečna primanja veća od zadatih. Prikaz
--primanja zaokružiti na dve decimale.

create function fun_OdeljenjeProsek(@primanja float)
returns table
as
return
(
	select ime_od, round(avg(plata + isnull(premija, 0)), 2) as prosecna_primanja
	from radnik, odeljenje
	where radnik.Id_odeljenja = odeljenje.Id_odeljenja
	group by odeljenje.id_odeljenja, ime_od
	having avg(plata+isnull(premija,0))  > @primanja
);

--b) Napisati upit koji vraća imena odeljena i prosečna primanja u njima za odeljenja u kojima su
--prosečna primanja veća od 2000 koristeći funkciju fun_OdeljenjeProsek . Sortirati po imenu
--odeljenja rastuće.

select *
from dbo.fun_OdeljenjeProsek(2000)
order by Ime_od

--Zadatak 3:

--a) Kreirati funkciju fun_RadnikOdeljenje koja u zavisnosti od prosleđenog mesta odeljenja
--prikazuje ime, prezime i posao radnika kao i ime odlejenja u kome radi.

create function fun_RadnikOdeljenje
(@mestoOd nchar(50))
returns table
as
return
(
	select r.ime, r.prezime, r.posao, o.ime_od
	from radnik r join odeljenje o
		 on r.id_odeljenja = o.Id_odeljenja
	where mesto = @mestoOd
);

--b) Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu. Koristiti
--funkciju fun_RadnikOdeljenje.

select *
from dbo.fun_RadnikOdeljenje(N'Dorćol');

--c) Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu, a imaju
--posao analitičara. Koristiti funkciju fun_RadnikOdeljenje.

select *
from dbo.fun_RadnikOdeljenje(N'Dorćol')
where posao = N'analitičar';

--6.2 Tabelarne funkcije (MULTISTATEMENT TABLE-VALUED FUNKCIJE (MSTVF))

--Zadatak 4:

--a) Uraditi zadatak korišćenjem MSTVF.
--Kreirati funkciju fun_RadnikOdeljenje1 koja u zavisnosti od prosleđenog mesta odeljenja
--prikazuje ime, prezime i posao radnika kao i ime odeljenja u kome radi.

create function fun_RadnikOdeljenje1(@mesto nchar(30))
returns @Rezultat table 
		(ime nchar(20),
		prezime nchar(20),
		posao nchar(20),
		ime_od nchar(20))
as
begin
	insert into @Rezultat
	select r.ime, r.prezime, r.posao, o.ime_od
	from radnik r inner join odeljenje o
		 on r.Id_odeljenja = o.Id_odeljenja
	where mesto = @mesto
return
end;


--b)Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu.
--Koristiti funkciju fun_RadnikOdeljenje1.

select * 
from dbo.fun_RadnikOdeljenje1(N'Dorćol');

--Zadatak 5:

--a) Kreirati funkciju fun_ProfesorPredmet koja u zavisnosti od prosleđenog
--identifikacionog broja profesora prikazuje ime i prezime profesora i nazive predmeta koje
--predaje. Uraditi zadatak korišćenjem MSTVF.

use STUDENTSKA
go

create function fun_ProfesorPredmet(@idProf int)
returns @Rezultat table
		(ime nchar(30),
		prezime nchar(30),
		naziv nchar(50))
as
begin
	insert into @Rezultat
	select ime, prezime, naziv
	from profesor inner join predmet
		 on profesor.Id_profesora = predmet.id_profesora
	where profesor.id_profesora = @idProf
return
end;


--b) Prikazati ime, prezime profesora i nazive predmeta koje predaje za profesora čiji je
--identifikacioni broj 106.

select *
from dbo.fun_ProfesorPredmet(106);