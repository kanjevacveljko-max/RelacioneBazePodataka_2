--Zadatak 1a. Prikazati sve podatke iz tabele radnik.

select *
from radnik

--Zadatak 1b. Prikazati prva 4 reda iz tabele radnik.

select top 4 *
from radnik

--Zadatak 2. Prikazati 5 zapisa iz tabele radnik, tako sto ce se preskociti
--prikaz prva tri reda. Potrebno je da se uradi sortiranje po imenu u rastucem redosledu.

select *
from radnik
order by ime
offset 3 rows
fetch next 5 rows only;


--Zadatak 3. Prikazati ime, posao, platu i kvalifikaciju zaposlenih cijji je posao 
--savetnik i plata veca od 2000.

select ime, posao, plata, kvalif
from radnik
where posao = N'savetnik' and plata > 2000;

--Zadatak 4. Prikazati ime, posao i kvalifikaciju zaposlenih koji imaju kvalifikaciju
--VSS ili VKV.

select ime, posao, kvalif
from radnik
where kvalif in ('VSS', 'VKV');

--Zadatak 5. Prikazati ime i broj odeljenja zaposlenih koji rade u odeljenju 10 ili 20,
--a kvalifikacija imje VKV.

select ime, id_odeljenja 
from radnik
where id_odeljenja in (10, 20) and
      kvalif = N'VKV';


--Zadatak 6. Prikazati ime, datum zaposlenja, platu, premiju i broj odeljenja za zaposlene
--koji imaju platu izmedju 1000 i 2000 ukljucujuci i te vrednosti.

select ime, dat_zap, plata, premija, id_odeljenja
from radnik
where plata between 1000 and 2000;

--Zadatak 7. Prikazati ime odeljenja cije ime pocinje slovom P.

select ime_od 
from odeljenje
where ime_od like 'p%';

--Zadatak 8. Prikazati ime i posao zaposlenih cije ime ne pocinje slovom P, a plata im je
--razlicita od 2000. Rezultate urediti po plati u opadajucem redosledu.

select ime, posao
from radnik
where ime not like 'p%' 
      and plata != 2000;

--Zadatak 9a. Prikazati ime, kvalifikaciju, platu i premiju zaposlenih koji imaju premiju.

select ime, kvalif, plata, premija
from radnik 
where premija is not null and premija != 0;

--Zadatak 9b. Prikazati ime, kvalifikaciju, platu i premiju zaposlenih koji nemaju premiju.

select ime, kvalif, plata, premija
from radnik
where premija is null or premija = 0;


--Zadatak 10. Prikazati brojeve odeljenja i srednju platu u svakom od njih.

select id_odeljenja, avg(plata) as [Prosecna plata]
from radnik
group by id_odeljenja;

--Zadatak 11. Prikazati za svaki posao ukupnu platu radnika koji ga obavljaju. Rezultate
--urediti po ukupnoj plati u rastucem redosledu.

select posao, sum(plata) as [Ukupna plata]
from radnik
group by posao
order by [Ukupna plata];

--Zadatak 12. Prikazati brojeve odeljenja i srednju platu u svakom od njih, samo za odeljenja
--u kojima je srednja plata manja od 2000. Srednju vrednost plate zaokruziti na dve decimale.
--Sortirati po srednjoj vrednosti plate u opadajucem redosledu.

select id_odeljenja, round(avg(plata),2) as [Prosecna plata]
from radnik
group by id_odeljenja
having avg(plata) < 2000
order by avg(plata) desc;

--Zadatak 13a. Za svako odeljenje prikazati ukupan broj radnika koji primaju premiju. 

select id_odeljenja, count(*) as [Broj radnika]
from radnik
where premija is not null
group by id_odeljenja;

--Zadatak 13b. Za svako odeljenje prikazati ukupan broj radnika koji primaju premiju, 
--samo ako je taj ukupan broj radnika veći od 3.

select id_odeljenja, count(*) as [Broj radnika]
from radnik
where premija is not null
group by id_odeljenja
having count(*) > 3;

--Zadatak 14. Za svako odeljenje prikazati broj radnika i ukupna primanja. 
--Ne prikazivati ukupna primanja neraspoređenih radnika. Sortirati po ukupnim primanjima rastuće.

select id_odeljenja, count(*) as [Broj radnika], 
       sum(plata + isnull(premija, 0)) as [Ukupna primanja]
from radnik
where id_odeljenja is not null
group by id_odeljenja
order by [Ukupna primanja];

--Zadatak 15. Upisati u jednom polju “Zarada radnika (ime) je (plata)”. 

select 'Zarada radnika ' + ime + ' je ' + CONVERT(nchar, plata)
from radnik;

--***SKALARNI I VISEVREDNOSNI UPITI***--


--Zadatak 16. Prikazati ime i posao svih radnika koji rade na Novom Beogradu. 

select ime, posao
from radnik
where id_odeljenja = (select id_odeljenja 
                      from odeljenje
                      where mesto = N'Novi Beograd');

--Zadatak 17. Prikazati ime, posao i kvalifikaciju svih radnika koji imaju istu
--kvalifikaciju kao Mitar. 

select ime, posao, kvalif 
from radnik 
where kvalif = (select kvalif
                from radnik
                where ime = N'Mitar');

--Zadatak 18. Izlistaj ime, posao i platu zaposlenih u odeljenju 10, koji imaju isti posao kao zaposleni u
--odeljenju Plan. 

select ime, posao, plata
from radnik
where id_odeljenja = 10 and posao in (select posao
                                      from radnik
                                      where id_odeljenja = (select id_odeljenja
                                                            from odeljenje
                                                            where ime_od = N'Plan'));

--Zadatak 19:Prikazati ime i primanja svih zaposlenih čija su primanja veća od prosečnog primanja u
--preduzeću. 

select ime, (plata + isnull(premija, 0)) as [Ukupna primanja]
from radnik
where (plata + isnull(premija, 0)) > (select avg(plata + isnull(premija, 0))
                                      from radnik);

--Zadatak 20: Prikazati ime, datum zaposlenja i primanja zaposlenih koji su angažovani na dva projekta.
--Rezultate urediti po datumu zaposlenja u opadajućem redosledu.

select ime, dat_zap, (plata + isnull(premija, 0)) as [primanja]
from radnik
where id_radnika in (select id_radnika
                     from ucesce
                     group by id_radnika
                     having count(*) > 2);

--***TABELARNI PODUPITI***--

--Zadatak 21: Prikazati ime, id odeljenja, prosečnu platu za odeljenje. Koristiti izedenu tabelu

select ime, r.id_odeljenja, [Prosek plate]
from (select id_odeljenja, round(avg(plata),2) as [Prosek plate]
      from radnik
      group by id_odeljenja) as prosek, radnik r
where r.id_odeljenja = prosek.id_odeljenja

--Zadatak 22: Prikazati ime i posao radnika koji rade na više od dva projekta. Koristiti CTE (Common Table
--Expression).

with BrojProjekata as (select id_radnika, count(*) as 'broj'
                       from ucesce 
                       group by id_radnika)
select ime, posao
from radnik r, BrojProjekata bp
where r.Id_radnika = bp.Id_radnika 
      and bp.broj > 2;