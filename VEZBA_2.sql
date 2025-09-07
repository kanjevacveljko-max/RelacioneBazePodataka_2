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



--Zadatak 6. Prikazati ime, datum zaposlenja, platu, premiju i broj odeljenja za zaposlene
--koji imaju platu izmedju 1000 i 2000 ukljucujuci i te vrednosti.



--Zadatak 7. Prikazati ime odeljenja cije ime pocinje slovom P.



--Zadatak 8. Prikazati ime i posao zaposlenih cije ime ne pocinje slovom P, a plata im je
--razlicita od 2000. Rezultate urediti po plati u opadajucem redosledu.


--Zadatak 9a. Prikazati ime, kvalifikaciju, platu i premiju zaposlenih koji imaju premiju.


--Zadatak 9b. Prikazati ime, kvalifikaciju, platu i premiju zaposlenih koji nemaju premiju.



--Zadatak 10. Prikazati brojeve odeljenja i srednju platu u svakom od njih.



--Zadatak 11. Prikazati za svaki posao ukupnu platu radnika koji ga obavljaju. Rezultate
--urediti po ukupnoj plati u rastucem redosledu.



--Zadatak 12. Prikazati brojeve odeljenja i srednju platu u svakom od njih, samo za odeljenja
--u kojima je srednja plata manja od 2000. Srednju vrednost plate zaokruziti na dve decimale.
--Sortirati po srednjoj vrednosti plate u opadajucem redosledu.



--Zadatak 13a. Za svako odeljenje prikazati ukupan broj radnika koji primaju premiju. 



--Zadatak 13b. Za svako odeljenje prikazati ukupan broj radnika koji primaju premiju, 
--samo ako je taj ukupan broj radnika veći od 3.



--Zadatak 14. Za svako odeljenje prikazati broj radnika i ukupna primanja. 
--Ne prikazivati ukupna primanja neraspoređenih radnika. Sortirati po ukupnim primanjima rastuće.



--Zadatak 15. Upisati u jednom polju “Zarada radnika (ime) je (plata)”. 



--***SKALARNI I VISEVREDNOSNI UPITI***--


--Zadatak 16. Prikazati ime i posao svih radnika koji rade na Novom Beogradu. 



--Zadatak 17. Prikazati ime, posao i kvalifikaciju svih radnika koji imaju istu
--kvalifikaciju kao Mitar. 



--Zadatak 18. Izlistaj ime, posao i platu zaposlenih u odeljenju 10, koji imaju isti posao kao zaposleni u
--odeljenju Plan. 



--Zadatak 19:Prikazati ime i primanja svih zaposlenih čija su primanja veća od prosečnog primanja u
--preduzeću. 



--Zadatak 20: Prikazati ime, datum zaposlenja i primanja zaposlenih koji su angažovani na dva projekta.
--Rezultate urediti po datumu zaposlenja u opadajućem redosledu.



--***TABELARNI PODUPITI***--

--Zadatak 21: Prikazati ime, id odeljenja, prosečnu platu za odeljenje. Koristiti izedenu tabelu



--Zadatak 22: Prikazati ime i posao radnika koji rade na više od dva projekta. Koristiti CTE (Common Table
--Expression).

