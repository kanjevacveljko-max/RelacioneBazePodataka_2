--7.1 Uskladištene procedure

--Zadatak 1:

--a) Kreirati proceduru SP_PrikazRadnikaNaPpojektima koja prikazuje ime, prezime
--radnika, nazive projekata na kojima rade i broj sati angažovanja na svakom projektu.

create procedure SP_PrikazRadnikaNaProjektima
as
begin
select r.ime, r.prezime, p.ime_proj, u.br_sati
from radnik r inner join ucesce u
	 on r.Id_radnika = u.Id_radnika
	 inner join projekat p
	 on u.Id_projekta = p.Id_projekta
end

--b) Pozvati kreiranu proceduru, bez ulaznih parametara.

exec SP_PrikazRadnikaNaProjektima

--Zadatak 2:

--a) Kreirati uskladištenu proceduru sp_novo_odeljenje posredstvom koje se u tabelu
--odeljenje dodaje novo odeljenje. Proceduri se prosleđuju ime odeljenja, mesto, kao i
--ime i prezime šefa odeljenja.

create procedure sp_novo_odeljenje(
	@imeod nvarchar(30), @mesto nvarchar(30),
	@ime nvarchar(30), @prezime nvarchar(30))
as
begin
	declare @idOdeljenja int
	select @idOdeljenja = max(id_odeljenja) from odeljenje
	set @idOdeljenja = @idOdeljenja	+ 10

	insert into Odeljenje (id_odeljenja, ime_od, mesto, sef_odeljenja)
	values (@idOdeljenja, @imeod, @mesto, (select id_radnika from radnik
										   where ime = @ime and
										   @prezime = prezime))
end;


--b) Posredstvom uskladištene procedure sp_novo_odeljenje u tabelu odeljenje dodati
--novo odeljenje Magacin u Obrenovcu a za šefa odeljenja postaviti Mirjanu Dimić.

exec  sp_novo_odeljenje N'Magacin', N'Obrenovac', N'Mirjana', N'Dimić';

--Zadatak 3:

--a) Kreirati uskladištenu proceduru sp_promeni_platu koja menja platu radnika. Zadaje se
--ime, prezime radnika i procenat za koji se plata menja.

create procedure sp_promeni_platu(
	@ime nvarchar(30), @prezime nvarchar(30),
	@procenat float)
as
begin 
	update radnik
	set plata = plata + plata * @procenat / 100
	where ime = @ime and prezime = @prezime
end;

--b) Smanjiti platu Vanji Kondić za 5%.

exec sp_promeni_platu N'Vanja', N'Kondić', -5

--Zadatak 4:

--a) Modifikovati uskladištenu proceduru sp_promeni_platu tako da nakon promene plate
--procedura vrati staru i novu vrednost plate.

alter procedure sp_promeni_platu(
	@ime nvarchar(30), @prezime nvarchar(30),
	@procenat float)
as
begin 
	declare @staraPlata real
	declare @novaPlata real

	select @staraPlata = plata from radnik
	where ime = @ime and prezime = @prezime
	
	update radnik
	set plata = plata + plata * @procenat / 100
	where ime = @ime and prezime = @prezime

	select @novaPlata = plata from radnik
	where ime = @ime and prezime = @prezime

	print 'Stara plata = ' +str(@staraPlata) + ' Nova plata = ' + str(@novaPlata)
end;


--b) Posredstvom uskladištene procedure sp_promeni_platu Janku Mančiću povećati platu
--10%

exec sp_promeni_platu N'Janko', N'Mančić', 10;

--Zadatak 5: 

--Kreirati uskladištenu proceduru sp_otpusti koja iz tabele radnika briše radnika.
--Ukoliko je radnik otpušten (izbrisan) vratiti poruku “Otpušten” u protivnom vratiti “Ne može se
--otpustiti”.

create procedure sp_otpusti 
	@id_radnika int
as
begin
	delete from radnik
	where id_radnika = @id_radnika
	
	if @@ERROR > 0
	select 'NE MOZE SE OTPUSTITI'
	else
	select 'OTPUSTEN'
end;

--Zadatak 6:

--a) Kreirati uskladištenu proceduru sp_Ukloni koja radnika čiji se identifikacioni broj zadaje
--uklanja sa projekta jedino ako zadati radnik radi samo na jednom projektu. U slucaju
--uspesnog uklanjanja radnika sa projekta vratiti poruku “RADNIK UKLONJEN SA
--PROJEKTA” u protivnom vratiti poruku “RADNIK NIJE UKLONJEN SA PROJEKTA”.

create procedure sp_ukloni
	@id_radnika int
as
begin
	declare @brojProjekata int
	select @brojProjekata = count(*)
		from ucesce
		where id_radnika = @id_radnika

	if @brojProjekata = 1
	begin
		delete from ucesce
		where Id_radnika = @id_radnika
		if @@ERROR = 0
		print 'Radnik uklonjen sa projekta'
	end
	else
		print 'Radnik nije uklonjen sa projekta'
end;

--b) Proceduri sp_Ukloni proslediti identifikacione brojeve radnika (5497 i 5652) da odradi
--uklanjanje sa projekta. Uporediti i proveriti šta procedura vraća.

exec sp_ukloni 5652

--Zadatak 7;

--a) Kreirati proceduru sp_sredstvaProjekti, kojoj se prosleđuje ime projekta i vrednost za
--kojuje potrebno promeniti sredstva za taj projekat. Ako zadati projekat ne postoji vratiti
--poruku “Projekat ne postoji”, a ako postoji poruku „Promenjeno.“

create procedure sp_sredstvaProjekti(
	@ime_proj nvarchar(30), @vrednost int)
as
begin
	if not exists 
		(select 1 from projekat where ime_proj = @ime_proj)
	return -1

	begin try
		update projekat
		set sredstva = sredstva + @vrednost
		where ime_proj = @ime_proj
		return 0
	end try

	begin catch
		return ERROR_NUMBER();
	end catch

end

--b) Pozvati procedure sp_sredstvaProjekti i proslediti joj da promeni sredstva za 100
--projektu uvoz.

declare @status int
exec @status = sp_sredstvaProjekti N'Uvoz', 1000
if @status = -1
	print 'Greska: Projekat ne postoji'
else if @status = 0
	print 'Promenjeno'
else
	print 'SQL greska, kod: ' + cast (@status as varchar)


--c) Pozvati procedure sp_sredstvaProjekti i proslediti joj da promeni sredstva za 100
--projektu koji ne postoji npr. Kreiranje.

declare @status int
exec @status = sp_sredstvaProjekti N'Kreiranje', 1000
if @status = -1
	print 'Greska: Projekat ne postoji'
else if @status = 0
	print 'Promenjeno'
else
	print 'SQL greska, kod: ' + cast (@status as varchar)
