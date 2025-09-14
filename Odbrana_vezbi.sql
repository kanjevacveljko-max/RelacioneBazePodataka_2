--1. Potrebno je kreirati proizvoljnu bazu podataka koja sadrži dve tabele, postaviti primarne kljuceve 
--   i povezati tabele. 

--2. Prikazati ime i prezime studenta u jednoj koloni, indeks u drugoj, i prose?nu ocenu zaokruženu 
--   na dve decimale. Sortirati po prosecnoj oceni u opadajecem redosledu.

select concat(s.ime,' ',s.prezime) as ime_i_prezime,
	   concat(s.smer, '-', cast(s.broj as varchar), '/', substring(s.godina_upisa, 3, 2)) as indeks,
	   round(avg(z.ocena), 2) as prosecna_ocena
from student s inner join zapisnik z on s.id_studenta = z.id_studenta
where z.ocena >= 6
group by s.id_studenta, s.ime, s.prezime, s.smer, s.broj, s.godina_upisa
order by prosecna_ocena desc

--3. Prikazati indeks studenta i ocene iz predmeta Mikroprocesorski softver, dodati kolonu u kojoj 
--   ce pisati Položeno ako je ocena 6 ili više, u suprotnom Nije položeno.

--4. Promeniti status predmeta Programski jezici u obavezan.

update predmet
set status = 'obavezan'
where naziv = 'Programski jezici'

--5. Koisteci pogled View_Student_Ispit koji prikazuje sve studenta smera NRT, broj ispita koje su 
--   pložili i njihovu prosecnu ocenu.

--6. Kreirati funkcija fun_PredmetProsek koja u zavisnosti od prosledjenog naziva predmeta vraca prosecnu
--   ocenu na tom predmetu. Prikazati prosecnu ocenu za predmet Baze podataka koristeci funkciju fun_PredmetProsek.

--7. Kreirati funkciju fun_StudentOcena koja ce na osnovu prosle?enog identifikacionog broja studenta
--   prikazati nazive predmeta koje je student položio i ocenu koju je dobio. 

--8. Kreirati proceduru SP_StudentiPredmeti kojoj se prosle?uje identifikacioni broj studenta.
--   Za studenta koji je izabrao manje od tri predmeta potrebno je da se vrati poruka 
--   “Nedovoljno predmeta izabrano”,u suprotnom “Dovoljno predmeta izabrano”.

--9. Kreirati uskladištenu proceduru SP_DodajProfesora sa primenom transakcije koja dodaje novog 
--   profesora, zadaje se identifikacioni broj, ime, prezime, a zatim se tom profesoru dodaje 
--   predmet Mikroracunnari. Obe aktivnosti treba da se izvrše ili ni jedna.

--10 Kreirati triger trig_Student koji ce za bilo koju promenu nad tabelom Student prikazati stare i 
--   nove podatke iz te tabele.