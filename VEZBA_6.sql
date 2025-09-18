use PREDUZECE
go






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