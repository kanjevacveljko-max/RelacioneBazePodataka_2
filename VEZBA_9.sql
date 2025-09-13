use PREDUZECE
go

--Zadatak 1:

--a) Kreirati upit koji kreira novu tabelu OdeljenjeLog sa atributima ime_od, mesto,
--datum_dodavanja i korisnik.

create table OdeljenjeLog
(ime_od nvarchar(30),
mesto nvarchar(30),
datum_dodavanja date,
korisnik nvarchar(30))

--b) Kreirati trigger trig_DodajOdeljenje koji se aktivira svaki put kada se doda novo
--odeljenje u tabelu Odeljenje. Kada se aktivira trigger u tabelu OdeljenjeLog upisati ime,
--mesto dodatog odeljenja, kao i datum dodavanja i korisničko ime korisnika koji ga je
--dodao.

create trigger trig_DodajOdeljenje
on odeljenje
after insert
as
begin
insert into OdeljenjeLog(ime_od, mesto, datum_dodavanja, korisnik)
values((select ime_od from inserted),(select mesto from inserted),
		SYSDATETIME(), USER_NAME())
end

--c) U tabelu odeljenje dodati novo odeljenje čiji je identifikacioni broj 100, smestiti ga na Dorćol pod
--imenom Kontrola kvaliteta a za šefa odeljenja postaviti Mirjanu Dimić.

insert into odeljenje(id_odeljenja, mesto, ime_od, sef_odeljenja)
values(101, N'Dorćol', N'Kontrola kvaliteta',
	   (select id_radnika from radnik
	   where ime = 'Mirjana' and prezime = 'Dimić'))


--d) Zabraniti aktiviranje trigera trig_DodajOdeljenje.

disable trigger trig_DodajOdeljenje

--e) Dodati novo odeljenje na Voždovac, Računovodstvo i proveriti da li se aktivira okidač i
--dodaje li zapis u tabelu OdeljenjeLog.

insert into odeljenje(id_odeljenja, mesto, ime_od)
values(102, N'Voždovac', N'Računovodstvo')

--f) Dozvoliti aktiviranje trigera trig_DodajOdeljenje.

enable trigger trig_DodajOdeljenje

--Zadatak 2:

--a) Kreirati upit koji kreira tabelu Listing sa atributima ime, prezime, imeprojekta, datum i
--korisnik.

create table Listing(
ime nvarchar(30),
prezime nvarchar(30),
imeprojekta nvarchar(30),
datum date,
korisnik nvarchar(30)
)

--b) Kreirati trigger trig_ObrisiSaProjekta koji se aktivira svaki put kada se iz učešća obriše
--radnik sa nekog projekta i u tabelu Listing upisuje ime, prezime, ime projekta, datum za
--kada je radnik obrisan sa projekta i ime korisnika koji je izvršio brisanje.

create trigger trig_ObrisiSaProjekta
on ucesce
after delete
as
insert into Listing(ime, prezime, imeprojekta, datum, korisnik)
values((select ime from radnik where id_radnika=(select id_radnika from deleted)),
	   (select prezime from radnik where id_radnika=(select id_radnika from deleted)),
	   (select ime_proj from projekat where id_projekta=(select id_projekta from deleted)),
	    SYSDATETIME(), SYSTEM_USER)


--c) Obrisati radnika sa identifikacionim brojem 5696 sa projekta 300.

delete
from ucesce
where id_radnika = 5696 and id_projekta = 300;

--Zadatak 3:

--a) Kreirati triger trig_Radnik_Plata koji se aktivira samo kada se promeni vrednost plate
--nekog od radnika. Triger treba da vrati ime, prezime i platu radnika kojima je plata
--promenjena.

create trigger trig_Radnik_Plata
on radnik
after update
as
if(update(plata))
begin
select ime, prezime, plata
from inserted
end

--b) Kreirati upit koji vozačima povećava premiju 15%. Da li se triger aktivira?

update radnik
set premija = premija * 1.15
where posao = N'vozač'

--c) Kreirati upit koji vozačima povećava platu 15%. Da li se triger aktivira?

update radnik
set plata = plata * 1.15
where posao = N'vozač'

--Zadatak 4:

--a) Promeniti triger trig_Radnik_Plata tako da osim novih vrednosti plata i premija, nakon
--pokretanja prikažu i stare vrednosti plata i premija. Triger se aktivira kod promene plate
--ili premije.

alter trigger trig_Radnik_Plata
on radnik
after update
as
if(update(plata) or update(premija))
begin
select ime, prezime, plata as nova_plata, premija as nova_premija
from inserted
select ime, prezime, plata as stara_plata, premija as stara_premija
from deleted
end

--b) Kreirati upit koji vozačima povećava platu 15%. Kakav je prikaz sada?

update radnik
set plata = plata * 1.15
where posao = N'vozač'
