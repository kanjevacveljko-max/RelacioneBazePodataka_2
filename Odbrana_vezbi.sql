--1. Potrebno je kreirati proizvoljnu bazu podataka koja sadrži dve tabele, postaviti primarne klju?eve 
--   i povezati tabele. 

--2. Prikazati ime i prezime studenta u jednoj koloni, indeks u drugoj, i prose?nu ocenu zaokruženu 
--   na dve decimale. Sortirati po prose?noj oceni u opadaje?em redosledu.

--3. Prikazati indeks studenta i ocene iz predmeta Mikroprocesorski softver, dodati kolonu u kojoj 
--   ?e pisati Položeno ako je ocena 6 ili više, u suprotnom Nije položeno.

--4. Promeniti ststus predmeta Programski jezici u obavezan.

--5. Koiste?i pogled View_Student_Ispit koji prikazuje sve studenta smera NRT, broj ispita koje su 
--   pložili i njihovu prose?nu ocenu.

--6. Kreirati funkcija fun_PredmetProsek koja u zavisnosti od prosle?enog naziva predmeta vra?a prose?nu
--ocenu na tom predmetu. Prikazati prose?nu ocenu za predmet Baze podataka koriste?i funkciju fun_PredmetProsek.

--7. Kreirati funkciju fun_StudentOcena koja ?e na osnovu prosle?enog identifikacionog broja studenta
--   prikazati nazive predmeta koje je student položio i ocenu koju je dobio. 

--8. Kreirati proceduru SP_StudentiPredmeti kojoj se prosle?uje identifikacioni broj studenta.
--   Za studenta koji je izabrao manje od tri predmeta potrebno je da se vrati poruka 
--   “Nedovoljno predmeta izabrano”,u suprotnom “Dovoljno predmeta izabrano”.

--9. Kreirati uskladištenu proceduru SP_DodajProfesora sa primenom transakcije koja dodaje novog 
--   profesora, zadaje se identifikacioni broj, ime, prezime, a zatim se tom profesoru dodaje 
--   predmet Mikrora?unnari. Obe aktivnosti treba da se izvrše ili ni jedna.

--10 Kreirati triger trig_Student koji ?e za bilo koju promenu nad tabelom Student prikazati stare i 
--   nove podatke iz te tabele.