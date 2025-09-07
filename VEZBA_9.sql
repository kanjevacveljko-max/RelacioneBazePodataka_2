--Zadatak 1:

--a) Kreirati upit koji kreira novu tabelu OdeljenjeLog sa atributima ime_od, mesto,
--datum_dodavanja i korisnik.



--b) Kreirati trigger trig_DodajOdeljenje koji se aktivira svaki put kada se doda novo
--odeljenje u tabelu Odeljenje. Kada se aktivira trigger u tabelu OdeljenjeLog upisati ime,
--mesto dodatog odeljenja, kao i datum dodavanja i korisničko ime korisnika koji ga je
--dodao.



--c) U tabelu odeljenje dodati novo odeljenje čiji je identifikacioni broj 100, smestiti ga na Dorćol pod
--imenom Kontrola kvaliteta a za šefa odeljenja postaviti Mirjanu Dimić.



--d) Zabraniti aktiviranje trigera trig_DodajOdeljenje.



--e) Dodati novo odeljenje na Voždovac, Računovodstvo i proveriti da li se aktivira okidač i
--dodaje li zapis u tabelu OdeljenjeLog.



--f) Dozvoliti aktiviranje trigera trig_DodajOdeljenje.



--Zadatak 2:

--a) Kreirati upit koji kreira tabelu Listing sa atributima ime, prezime, imeprojekta, datum i
--korisnik.



--b) Kreirati trigger trig_ObrisiSaProjekta koji se aktivira svaki put kada se iz učešća obriše
--radnik sa nekog projekta i u tabelu Listing upisuje ime, prezime, ime projekta, datum za
--kada je radnik obrisan sa projekta i ime korisnika koji je izvršio brisanje.



--c) Obrisati radnika sa identifikacionim brojem 5696 sa projekta 300.



--Zadatak 3:

--a) Kreirati triger trig_Radnik_Plata koji se aktivira samo kada se promeni vrednost plate
--nekog od radnika. Triger treba da vrati ime, prezime i platu radnika kojima je plata
--promenjena.



--b) Kreirati upit koji vozačima povećava premiju 15%. Da li se triger aktivira?



--c) Kreirati upit koji vozačima povećava platu 15%. Da li se triger aktivira?



--Zadatak 4:

--a) Promeniti triger trig_Radnik_Plata tako da osim novih vrednosti plata i premija, nakon
--pokretanja prikažu i stare vrednosti plata i premija. Triger se aktivira kod promene plate
--ili premije.



--b) Kreirati upit koji vozačima povećava platu 15%. Kakav je prikaz sada?
