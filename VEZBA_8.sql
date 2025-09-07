--8.1 Transakcije

--Zadatak 1:

--a) Kreirati proceduru sp_Promeni_platu sa primenom transakcije koja menja platu
--radnicima za zadato ime odeljenja, za zadati procenat. Ukoliko se plata menja za manje



--b) Uraditi isti zadatak na drugi način, koristiti i try-catch.



--c)Proveriti za nepostojeće odeljenje i za odeljenje koje ima radnike.

--Zadatak 2:

--a) Kreirati proceduru sp_PromeniSefaOdeljenja sa primenom transakcije. Ulazni
--paremetri su ime, prezime radnika i broj odeljenja u kome treba postaviti tog radnika za
--šefa. Ukoliko je zadati radnik vec šef nekog odeljenja obustaviti transakciju i poslati
--poruku “Radnik je vec šef odeljenja” u protvnom vratiti poruku “Radnik postavljen za šefa
--odeljenja”.



--b) Postaviti radnika Aleksandra Marića za šefa odeljenja 10. (Dva puta pokrenuti izvršenje.)



--Zadatak 3:

--a) Kreirati uskladištenu proceduru sp_PrebaciSredstva koja svim radnicima smanjuje platu
--za 1% i tako dobijena sredstva dodeljuje kao platu radniku koga treba zaposliti. Ulazni
--parametri u proceduru su Id_radnika, ime, prezime i Id_odeljenja.



--b) Uraditi isti zadatak na drugi način, koristiti i try-catch.



--c) Zaposliti novu radnicu Ana Marković u odeljenje 20 i dodeliti joj 1% plate svih radnika, a za
--ostale uraditi smanjenje od 1%. Dodeliti proizvoljan identifikacioni broj. (Pokrenutu isto
--izvršenje dva puta.)
