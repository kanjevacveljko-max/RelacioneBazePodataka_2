--7.1 Uskladištene procedure

--Zadatak 1:

--a) Kreirati proceduru SP_PrikazRadnikaNaPpojektima koja prikazuje ime, prezime
--radnika, nazive projekata na kojima rade i broj sati angažovanja na svakom projektu.



--b) Pozvati kreiranu proceduru, bez ulaznih parametara.



--Zadatak 2:

--a) Kreirati uskladištenu proceduru sp_novo_odeljenje posredstvom koje se u tabelu
--odeljenje dodaje novo odeljenje. Proceduri se prosleđuju ime odeljenja, mesto, kao i
--ime i prezime šefa odeljenja.



--b) Posredstvom uskladištene procedure sp_novo_odeljenje u tabelu odeljenje dodati
--novo odeljenje Magacin u Obrenovcu a za šefa odeljenja postaviti Mirjanu Dimić.



--Zadatak 3:

--a) Kreirati uskladištenu proceduru sp_promeni_platu koja menja platu radnika. Zadaje se
--ime, prezime radnika i procenat za koji se plata menja.



--b) Smanjiti platu Vanji Kondić za 5%.



--Zadatak 4:

--a) Modifikovati uskladištenu proceduru sp_promeni_platu tako da nakon promene plate
--procedura vrati staru i novu vrednost plate.



--b) Posredstvom uskladištene procedure sp_promeni_platu Janku Mančiću povećati platu
--10%



--Zadatak 5: 

--Kreirati uskladištenu proceduru sp_otpusti koja iz tabele radnika briše radnika.
--Ukoliko je radnik otpušten (izbrisan) vratiti poruku “Otpušten” u protivnom vratiti “Ne može se
--otpustiti”.



--Zadatak 6:

--a) Kreirati uskladištenu proceduru sp_Ukloni koja radnika čiji se identifikacioni broj zadaje
--uklanja sa projekta jedino ako zadati radnik radi samo na jednom projektu. U slucaju
--uspesnog uklanjanja radnika sa projekta vratiti poruku “RADNIK UKLONJEN SA
--PROJEKTA” u protivnom vratiti poruku “RADNIK NIJE UKLONJEN SA PROJEKTA”.



--b) Proceduri sp_Ukloni proslediti identifikacione brojeve radnika (5497 i 5652) da odradi
--uklanjanje sa projekta. Uporediti i proveriti šta procedura vraća.



--Zadatak 7;

--a) Kreirati proceduru sp_sredstvaProjekti, kojoj se prosleđuje ime projekta i vrednost za
--kojuje potrebno promeniti sredstva za taj projekat. Ako zadati projekat ne postoji vratiti
--poruku “Projekat ne postoji”, a ako postoji poruku „Promenjeno.“



--b) Pozvati procedure sp_sredstvaProjekti i proslediti joj da promeni sredstva za 100
--projektu uvoz.



--c) Pozvati procedure sp_sredstvaProjekti i proslediti joj da promeni sredstva za 100
--projektu koji ne postoji npr. Kreiranje.
