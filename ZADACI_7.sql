use STUDENTSKA
go

--1. Kreirati uskladištenu proceduru SP_NoviPredmet koja dodaje podatke o novom predmetu, a
--kojoj se prosleđuje naziv predmeta, broj ESPB bodova, status, kao ime i prezime profesora
--koji ga predaje.

alter procedure SP_NoviPredmet(@naziv nvarchar(30), @espb smallint,
@status nvarchar(30), @imeProf nvarchar(30), @prezimeProf nvarchar(30))
as
begin
	declare @idPredmeta int = (select max(id_predmeta) from predmet)
	set @idPredmeta = @idPredmeta + 1

	declare @idProf int
	set @idProf = (select id_profesora
				   from profesor
				   where ime = @imeProf and 
						 prezime = @prezimeProf)

	if @IdProf IS NULL
    begin
        raiserror (N'Profesor %s %s ne postoji.', 11, 1, @ImeProf, @PrezimeProf);
        return;
    end

	if (@Status NOT IN (N'obavezan', N'izborni'))
    begin
        raiserror (N'Status mora biti "obavezan" ili "izborni".', 11, 1);
        return;
    end


	insert into predmet (id_predmeta, naziv, espb, status, id_profesora)
	values (@idPredmeta, @naziv, @espb, @status, @idProf)

end

--2. Dodati podatke o novom predmetu koristeći proceduru SP_NoviPredmet. Naziv predmeta je
--Veštačka inteligencija, 6 ESPB bodova, obavezan i predaje ga Radnila Lekić.

exec dbo.SP_NoviPredmet 'Veštačka inteligencija', 6, 'obavezan', 'Radmila', 'Lekić'

--3. Kreirati proceduru SP_StudentiPredmeti2 kojoj se prosleđuje identifikacioni broj studenta. Za
--studenta koji je izabrao manje od tri predmeta potrebno je da se vrati poruka “Nedovoljno
--predmeta izabrano”, u suprotnom “Dovoljno predmeta izabrano”.

create procedure SP_StudentiPredmeti2(@idStudenta int)
as
begin
	if not exists (select 1 from student where id_studenta = @idStudenta)
		begin
			raiserror(N'Ne postoji student sa unetim id brojem.', 11, 1)
			return;
		end

	declare @brojPredmeta int
	select @brojPredmeta = count(*)
	from student_predmet
	where id_studenta = @idStudenta

	if @brojPredmeta < 3
		select 'Nedovoljno predmeta izabrano'
	else
		select 'Dovoljno predmeta izabrano'
end