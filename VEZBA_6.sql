use PREDUZECE
go






--6.2 Tabelarne funkcije (MULTISTATEMENT TABLE-VALUED FUNKCIJE (MSTVF))



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