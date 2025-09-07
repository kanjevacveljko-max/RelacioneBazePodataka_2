--6.1 Tabelarne funkcije (INLINE TABLE-VALUED FUNKCIJE (ITVF))

--Zadatak 1:

--a) Kreirati funkciju fun_Posao, koja za zadato ime i prezime radnika vraća posao,
--kvalifikaciju i primanja.



--b) Prikazati posao koji obavlja radnik Petar Vasić , njegovu kvalifikaciju i primanja koristeći
--funkciju fun_Posao.



--Zadatak 2:

--a) Kreirati funkciju fun_OdeljenjeProsek koja vraća imena odeljenja i prosečna primanja u
--njima samo za odeljenja u kojima su prosečna primanja veća od zadatih. Prikaz
--primanja zaokružiti na dve decimale.



--b) Napisati upit koji vraća imena odeljena i prosečna primanja u njima za odeljenja u kojima su
--prosečna primanja veća od 2000 koristeći funkciju fun_OdeljenjeProsek . Sortirati po imenu
--odeljenja rastuće.



--Zadatak 3:

--a) Kreirati funkciju fun_RadnikOdeljenje koja u zavisnosti od prosleđenog mesta odeljenja
--prikazuje ime, prezime i posao radnika kao i ime odlejenja u kome radi.



--b) Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu. Koristiti
--funkciju fun_RadnikOdeljenje.



--c) Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu, a imaju
--posao analitičara. Koristiti funkciju fun_RadnikOdeljenje.



--6.2 Tabelarne funkcije (MULTISTATEMENT TABLE-VALUED FUNKCIJE (MSTVF))

--Zadatak 4:

--a) Uraditi zadatak korišćenjem MSTVF.
--Kreirati funkciju fun_RadnikOdeljenje1 koja u zavisnosti od prosleđenog mesta odeljenja
--prikazuje ime, prezime i posao radnika kao i ime odeljenja u kome radi.



--b)Prikazati ime, prezime, posao i naziv odeljenja za radnike koji rade na Dorćolu.
--Koristiti funkciju fun_RadnikOdeljenje1.



--Zadatak 5:

--a) Kreirati funkciju fun_ProfesorPredmet koja u zavisnosti od prosleđenog
--identifikacionog broja profesora prikazuje ime i prezime profesora i nazive predmeta koje
--predaje. Uraditi zadatak korišćenjem MSTVF.



--b) Prikazati ime, prezime profesora i nazive predmeta koje predaje za profesora čiji je
--identifikacioni broj 106.
