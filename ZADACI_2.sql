use PREDUZECE
go

--1. Prikazati sve podatke o radnicima koji imaju platu manju od 1500 ili im ime završava slovom
--A. Prikazati samo prva tri zapisa.

select * 
from radnik
where plata < 1500 or ime like '%a';

--2. Prikazati za svaki posao prosečna primanja. Sortirati po primanjima opadajuće.

select posao, avg(plata + isnull(premija, 0)) as prosecna_primanja
from radnik
group by posao
order by prosecna_primanja desc;

--3. Prikazati nazive projekata na kojima rade radnici iz odeljenja 10, sortirane rastuće po imenu
--projekta, tako da se preskoči prvi zapis, a prikažu naredna dva.

select ime_proj
from projekat p, ucesce u, radnik r
where p.Id_projekta = u.Id_projekta and
	  u.Id_radnika = r.Id_radnika
group by r.id_odeljenja, p.ime_proj
having id_odeljenja = 10
order by ime_proj
offset 1 row
fetch next 2 rows only

--4. Prikazati ukupna primanja radnika po odeljenjima za ona odeljenja gde su ukupna primanja
--manja od prosečnih primanja vozača.

select id_odeljenja, sum(plata+isnull(premija,0)) as ukupna_primanja
from radnik r
group by id_odeljenja
having sum(plata+isnull(premija,0)) < (select avg(plata+isnull(premija,0))
									   from radnik 
									   where posao = 'vozač');

--5. Prikazati u jednoj koloni posao i prosečnu platu za svaki posao zaokruženu na ceo broj.

select concat(posao, '-', convert(nchar, cast(avg(plata) as int)))
from radnik
group by posao

