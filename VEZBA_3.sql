use PREDUZECE
go

--Zadatak 1: Prikazati za svakog radnika ime, posao, kao i broj odeljenja, 
--naziv i mesto odeljenja u kome radi.

select ime, posao, r.id_odeljenja, ime_od, mesto
from radnik r join odeljenje o
	 on r.id_odeljenja = o.id_odeljenja;

--Zadatak 2: Prikazati nazive odeljenja, ime i posao svakog radnika koji u njima rade, 
--ukljucujuci i radnike koji nisu rasporedjeni ni u jednom odeljenju.

--a) Upotrebom desnog spajanja - RIGHT JOIN 

select ime_od, ime, posao
from odeljenje o right join radnik r
	 on o.Id_odeljenja = r.Id_odeljenja;

--b) Upotrebom LEFT JOIN

select ime_od, ime, posao
from radnik r left join odeljenje o
	 on o.Id_odeljenja = r.Id_odeljenja;

--Zadatak 3: Prikazati nazive odeljenja, ime i posao svakog radnika koji u njima rade ukljucujuci i radnike
--koji nisu raspore?eni ni u jednom odeljenju, kao i odeljenja u kojima ne radi ni jedan radnik.

select ime_od, ime, posao
from radnik r full outer join odeljenje o
	 on r.id_odeljenja = o.id_odeljenja;


--Zadatak 4: Prikazati imena projekata na kojima rade i Marko i Mirjana (zajedno).

--a) Samo presek projekata

select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Marko'

intersect

select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Mirjana'


--b) Projekti na kojima radi Marko, a Mirjana ne radi.

select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Marko'

except

select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Mirjana'

--c) Prikazati projekte na kojima radi bilo ko od njh dvoje (bez ponavljanja).


select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Marko'

union

select ime_proj
from projekat p join ucesce u
	 on p.id_projekta = u.id_projekta
	 join radnik r 
	 on u.Id_radnika = r.Id_radnika
	 and ime = N'Mirjana'

--Zadatak 5: Izlistati zaposlene (id_radnika, ime i prezime u jednoj koloni), projekat (brproj i imeproj), 
--broj sati, broj radnih dana po pomenutom uslovu i funkciju za sve zaposlene koji ucestvuju na projektima. 
--Ako je broj sati veci ili jednak od 1000 radni dan je 10 sati u protivnom je 8 sati.

select r.id_radnika, rtrim(r.ime) + N' ' + rtrim(r.prezime) as 'Zaposleni',
	   p.id_projekta, p.ime_proj, u.br_sati, u.funkcija,
	   case 
			when u.br_sati >= 1000 then br_sati/10
			else br_sati/8
		end as 'Radni dani'
from radnik r join ucesce u on r.id_radnika = u.id_radnika
	 join projekat p on u.id_projekta = p.id_projekta


--Zadatak 6:Izlistati zaposlene koje rade na projektu 100 (idbr, ime i prezime), njihovu platu, premiju,
--naknadu po uslovu broja radnih sati i broj radnih sati. Ako je broj sati ve?i ili jednak 1500 naknada je
--jednaka primanjima u protivnom je jednaka plati.

select r.id_radnika, r.ime, r.prezime, r.plata, r.premija, u.br_sati,
       case when u.br_sati >= 1500 then plata + isnull(premija, 0)
	        else plata
		end as Naknada
from radnik r join ucesce u on r.Id_radnika = u.Id_radnika

--Zadatak 7: Zaposlenima u odeljenju smeštenom na Novom Beogradu povecati platu 30%.

update radnik 
set plata = plata * 1.3
where id_odeljenja = (select id_odeljenja
					  from odeljenje 
					  where mesto = N'Novi Beograd');

--Zadatak 8:Zaposlenima u odeljenju smeštenom na Dorcolu dodeliti premiju u iznosu 40% od plate, a
--platu povecati za 100, ne uzimajuci u obzir direktore i upravnike.

update radnik
set premija = plata * 0.4,
	plata = plata + 100
where posao not in ('direktor', 'upravnik')
      and id_odeljenja = (select id_odeljenja
						  from odeljenje
						  where mesto = 'Dor?ol');

--Zadatak 9: Radnicima cija je kvalifikacija KV povecati platu 10%, VKV 5% a VSS smanjiti platu 5%.

update radnik 
set plata = case kvalif 
			when 'KV' then plata * 1.1
			when 'VKV' then plata * 1.05
			when 'VSS' then plata * 0.95
			end;

--Zadatak 10: Radnicima koji nemaju premiju dodeliti premiju 150. Radnicima cija je premija manja od
--1000 povecati premiju 15% a ostalim radnicima ne menjati premiju.

update radnik 
set premija = case
			  when premija is null then 150
			  when premija between 0 and 1000 then premija * 1.15
			  else premija
			  end;

--Zadatak 11:Dodati podatke o novom odeljenju cije je ime Racunovodstvo, a broj odeljenja 60.

insert into odeljenje
values (60, N'Racunovodstvo', null, null);

--Zadatak 12:

--a)Kreirati praznu tabelu Penzionisani sa svim atributima kao tabela Radnik.

select * into Penzionisani
from radnik
where ime = '';

--b) U vec postojecu tabelu PENZIONISANI, sa svim istim atributima kao i tabela RADNIK, prebaciti sve
--podatke o zaposlenim pre 20.10.1971.

insert into Penzionisani
select *
from radnik
where Dat_zap < '1971-10-20';

--Zadatak 13:

--a) Izbrisati sve podatke iz tabele PENZIONISANI (kreirane i popunjene podacima u prethodnom
--zadatku).

delete from Penzionisani;

--b) Ukloniti tabelu PENZIONISANI iz baze.

truncate table Penzionisani;

--Zadatak 14: Zaposlene ciji je rukovodilac Pavle ukloniti sa svih projekata.

delete from ucesce
where id_radnika in (select id_radnika
					 from  radnik
					 where Rukovodilac = (select id_radnika 
										  from radnik 
										  where ime = N'Pavle'));

--*******BAZA STUDENTSKA SLUZBA******--

use STUDENTSKA
go

--Zadatak 15:
--Prikazati ime, prezime, indeks studenta (u jednoj koloni), naziv predmeta i ispitni
--rok u kome je položen za studente NRT smera.

use STUDENTSKA

select s.ime, s.prezime, concat(s.smer, '-', CONVERT(nvarchar, s.broj),'/', substring(s.godina_upisa,3,2)) as 'Indeks',
	   p.naziv, ir.naziv
from student s join zapisnik z on s.id_studenta = z.id_studenta
	 join ispit i on z.id_ispita = i.id_ispita
	 join ispitni_rok ir on i.id_roka = ir.id_roka
	 join predmet p on i.id_predmeta = p.id_predmeta 
where s.smer = N'nrt' and z.ocena > 5;

--Zadatak 16:
--Prikazati nazive predmeta koje je položio student indeksa NRT -33/20, a nije položio
--student indeksa NRT - 16 / 20.

select predmet.naziv
from predmet join ispit on predmet.id_predmeta = ispit.id_predmeta
	 join zapisnik on ispit.id_ispita = zapisnik.id_ispita
	 join student on zapisnik.id_studenta = student.id_studenta
where student.smer = N'nrt' and
	  student.broj = 33 and
	  student. godina_upisa = N'2020' and
	  ocena > 5

except

select predmet.naziv
from predmet join ispit on predmet.id_predmeta = ispit.id_predmeta
	 join zapisnik on ispit.id_ispita = zapisnik.id_ispita
	 join student on zapisnik.id_studenta = student.id_studenta
where student.smer = N'nrt' and
	  student.broj = 16 and
	  student. godina_upisa = N'2020' and
	  ocena > 5;

--Zadatak 17:
--U zavisnosti od ocene promeniti bodove u tabeli zapisnik za junski rok školske
--2019/20, tako da se za ocenu 5 upiše 45 bodova, oceanu 6 upiše 55 bodova i tako za
--svaku ocenu po 10 bodova više.

update zapisnik 
set bodovi = case ocena
			 when 5 then 45
			 when 6 then 55
			 when 6 then 65
			 when 8 then 75
			 when 9 then 85
			 when 10 then 95
			 end
where id_ispita in (select id_ispita
					from ispit
					where id_roka = (select id_roka 
									 from ispitni_rok 
									 where naziv = N'Jun' and 
										   skolska_god = N'2019/20'));