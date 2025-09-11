--1. Kreirati uskladištenu procedure SP_ProjekatSredstva sa primenom transakcije koja kao
--ulazni parameter dobija ime projekta. Ako su sredstva za taj projekat veća od prosečnih
--sredstava za sve projekte smanjiti sredstva na prosečna, a ako su manja ne raditi promene.

create procedure SP_ProjekatSredstva(@idProjekta int)
as
begin
	declare @prosekSredstva real
	select @prosekSredstva =  avg(sredstva)
	from projekat

	declare @projekatSredstva real
	select @projekatSredstva = sredstva
	from projekat
	where id_projekta = @idProjekta

	begin tran
		update projekat
		set sredstva = @prosekSredstva
	
	if @projekatSredstva > @prosekSredstva
		begin
		commit
		select 'Sredstva za projekat su promenjena'
		end
	else
		begin
		rollback
		select 'Sredstva za projekat nisu promenjena'
		end
end


--2. Kreirati uskladištenu proceduru SP_DodajRadnika sa primenom transakcije koja
--dodaje novog radnika, zadaje se id_radnika, ime, prezime (proizvoljan id_radnika), a
--zatim se taj radnik dodaje na projekat izvoz. Obe aktivnosti treba da se izvrše ili ni
--jedna.

create procedure SP_DodajRadnika(@idRadnika int,
			@ime varchar(30), @prezime varchar(30))
as
begin
	begin try

		declare @idProjekta int
		select @idProjekta = id_projekta
		from projekat
		where ime_proj = N'izvoz'

		begin tran
			if exists (select 1 from radnik where id_radnika = @idRadnika)
				begin
				raiserror (N'Radnik sa ovim id brojem vec postoji', 11, 1);
				return;
				end
			insert into radnik (id_radnika, ime, prezime)
			values (@idRadnika, @ime, @prezime)
			insert into ucesce (id_radnika, id_projekta)
			values (@idRadnika, @idProjekta)
			commit transaction
			print ('Uspesna transakcija')
		end try
		begin catch
			if @@TRANCOUNT > 0
			rollback transaction
			declare @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
			declare @ErrorSeverity int = ERROR_SEVERITY();
			declare @ErrorState int = ERROR_STATE();
			raiserror(@ErrorMessage, @ErrorSeverity, @ErrorState);
		end catch
end

--3. Za oba zadatka navesti primer izvršenja procedure.

exec SP_DodajRadnika 5367, 'Milan', 'Kojić' --transakcija nije izvrsena

exec SP_DodajRadnika 1234, 'Milan', 'Kojić' --transakcija izvrsena

exec SP_ProjekatSredstva 300 --transakcija izvrsena

exec SP_ProjekatSredstva 200 --transakcija nije izvrsena
