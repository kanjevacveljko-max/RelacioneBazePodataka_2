use studentska 
go

--Zadatak 1:

--a) Kreirati proceduru sp_Promeni_platu sa primenom transakcije koja menja platu
--radnicima za zadato ime odeljenja, za zadati procenat. Ukoliko se plata menja za manje
--od 4 radnika promeniti plate, u suprotnom vratiti na staru vrednost.

create procedure sp_Promeni_platu(
	@imeOd nvarchar(30), @procenat int)
as
begin
	begin tran
		update radnik
		set plata = plata + plata * @procenat / 100
		where id_odeljenja = (select id_odeljenja from odeljenje
							 where ime_od = @imeOd)
		if @@ROWCOUNT < 4
			commit
		else
			rollback
end

--b) Uraditi isti zadatak na drugi način, koristiti i try-catch.

create procedure sp_promeni_platu_1(
@imeOd nvarchar (30), @procenat int)
as
begin
	declare @broj int
	begin try
		begin tran
			if not exists (select 1 from odeljenje where ime_od = @imeOd)
				begin
				raiserror('Odeljenje ne postoji', 16, 1);
				rollback transaction;
				return;
				end
			set @broj = (select count(*) from radnik
						where id_odeljenja in (select id_odeljenja
											   from odeljenje 
											   where ime_od = @imeOd))
			print ('Broj radnika je ' + str(@broj))

			update radnik
			set plata =  plata + plata * @procenat / 100
			where id_odeljenja = (select id_odeljenja from odeljenje
								  where ime_od = @imeOd)

			if @broj >= 4
				begin
				rollback
				print ('Nije promenjeno')
			end
			else
				begin 
				commit
				print ('Promenjeno')
			end
	end try
	
	begin catch 
		if @@TRANCOUNT > 0
		rollback transaction
		print ('Greska')
		print ERROR_MESSAGE();
	end catch
end

--c)Proveriti za nepostojeće odeljenje i za odeljenje koje ima radnike.

exec sp_promeni_platu_1 N'Finansije', 10

--Zadatak 2:

--a) Kreirati proceduru sp_PromeniSefaOdeljenja sa primenom transakcije. Ulazni
--paremetri su ime, prezime radnika i broj odeljenja u kome treba postaviti tog radnika za
--šefa. Ukoliko je zadati radnik vec šef nekog odeljenja obustaviti transakciju i poslati
--poruku “Radnik je vec šef odeljenja” u protvnom vratiti poruku “Radnik postavljen za šefa
--odeljenja”.

create procedure sp_PromeniSefaOdeljenja(
	@ime nvarchar(30), @prezime nvarchar(30),
	@idOd int)
as
begin
	declare @da_ne int
	select @da_ne = count(*) from odeljenje 
		where sef_odeljenja = (select id_radnika from radnik
							   where ime = @ime and prezime = @prezime)
	begin tran
		update odeljenje
		set sef_odeljenja = (select id_radnika from radnik
							 where ime = @ime and prezime = @prezime)
		where id_odeljenja = @idOd

	if @da_ne > 0
		begin
		rollback
		select 'Radnik je vec sef odeljenja'
		end
	else
		begin
		commit
		select 'Radnik postavljen za sefa odeljenja'
		end
end

--b) Postaviti radnika Aleksandra Marića za šefa odeljenja 10. (Dva puta pokrenuti izvršenje.)

exec sp_PromeniSefaOdeljenja N'Aleksandar', N'Marić', 10

--Zadatak 3:

--a) Kreirati uskladištenu proceduru sp_PrebaciSredstva koja svim radnicima smanjuje platu
--za 1% i tako dobijena sredstva dodeljuje kao platu radniku koga treba zaposliti. Ulazni
--parametri u proceduru su Id_radnika, ime, prezime i Id_odeljenja.

create procedure sp_PrebaciSredstva(
	@idRadnika int, @ime varchar(30), 
	@prezime varchar(30), @idOdeljenja int)
	as
	begin
		declare @suma real
		set @suma = (select sum(plata) from radnik)
		set @suma = @suma * 0.01
		begin tran 
			update radnik
			set plata = plata * 0.99
			insert into radnik(id_radnika,ime,prezime,id_odeljenja,plata)
			values(@idRadnika, @ime, @prezime, @idOdeljenja, @suma)
		if @@ERROR > 0
			begin
			rollback
			print ('Neuspesna transakcija')
			end
		else
			begin 
			commit
			print ('Uspesna transakcija')
			end
	end

--b) Uraditi isti zadatak na drugi način, koristiti i try-catch.

create procedure sp_PrebaciSredstva1(
	@idRadnika int, @ime varchar(30), 
	@prezime varchar(30), @idOdeljenja int)
	as
	begin
	begin try
		declare @suma real
		set @suma = (select sum(plata) from radnik)
		set @suma = @suma * 0.01

		update radnik
		set plata = plata * 0.99
		insert into radnik(id_radnika,ime,prezime,id_odeljenja,plata)
		values(@idRadnika, @ime, @prezime, @idOdeljenja, @suma)
	end try
	begin catch
		if @@TRANCOUNT > 0
		rollback transaction
		print ('Neuspesna transakcija')
		declare @ErrorMessage nvarchar(4000) = ERROR_MESSAGE();
		declare @ErrorSeverity int = ERROR_SEVERITY();
		declare @ErrorState int = ERROR_STATE();
		raiserror(@ErrorMessage, @ErrorSeverity, @ErrorState);
	end catch
	end


--c) Zaposliti novu radnicu Ana Marković u odeljenje 20 i dodeliti joj 1% plate svih radnika, a za
--ostale uraditi smanjenje od 1%. Dodeliti proizvoljan identifikacioni broj. (Pokrenutu isto
--izvršenje dva puta.)

exec sp_PrebaciSredstva 1111, N'Ana', N'Marković', 20;
exec sp_PrebaciSredstva1 1111, N'Ana', N'Marković', 20;