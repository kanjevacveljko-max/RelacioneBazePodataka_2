--1. Kreirati funkciju fun_StudentOcena1 koja će na osnovu prosleđenog identifikacionog broja
--studenta prikazati nazive predmeta koje je student položio i ocenu koju je dobio. Koristiti
--ITVF.

create function fun_StudentOcena1(@idStud int)
returns table
as
return (select p.naziv, z.ocena
		from zapisnik z join ispit i
			 on z.id_ispita = i.id_ispita
			 join predmet p 
			 on p.id_predmeta = i.id_predmeta
		 where z.id_studenta = @idStud and
			   z.ocena >= 6);
	


--2. Kreirati funkciju fun_StudentOcena2 koja će na osnovu prosleđenog identifikacionog broja
--studenta prikazati nazive predmeta koje je student položio i ocenu koju je dobio. Koristiti
--MSTVF.

create function fun_StudentOcena2(@idStud int)
returns @reezultat table(
				  naziv varchar(40),
				  ocena int)
as 
begin
	insert into @reezultat (naziv, ocena)
	select p.naziv, z.ocena
	from zapisnik z join ispit i
		 on z.id_ispita = i.id_ispita
		 join predmet p 
		 on p.id_predmeta = i.id_predmeta
	 where z.id_studenta = @idStud and
		   z.ocena >= 6
return
end

--3. Koristeći funkcije fun_StudentOcena1 i fun_StudentOcena2 prikazati za studenta
--identifikacionog broja 20 nazive predmeta koje je položio i ocene koje je dobio. Uporediti
--rezultate.

select * from dbo.fun_StudentOcena1(20);

select * from dbo.fun_StudentOcena2(20);
