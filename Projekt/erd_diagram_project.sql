CREATE SCHEMA IF NOT EXISTS "sklep_internetowy";
set search_path to "sklep_internetowy";
CREATE SEQUENCE sklep_internetowy.klient_id_seq;
CREATE SEQUENCE sklep_internetowy.pracownik_id_seq;
CREATE SEQUENCE sklep_internetowy.departament_id_seq;
CREATE SEQUENCE sklep_internetowy.produkt_id_seq;
CREATE SEQUENCE sklep_internetowy.rabat_id_seq;
CREATE SEQUENCE sklep_internetowy.dostawa_id_seq;
CREATE SEQUENCE sklep_internetowy.zamowienie_id_seq;
CREATE SEQUENCE sklep_internetowy.zamowienie_produkt_id_seq;
CREATE TABLE Klient (
    KlientID INT PRIMARY KEY,
    Imie VARCHAR(100),
    Nazwisko VARCHAR(100),
    Adres VARCHAR(255),
    Email VARCHAR(100),
    Numer_telefonu VARCHAR(15)
);

CREATE TABLE Produkt (
    ProduktID INT PRIMARY KEY,
    Nazwa VARCHAR(100),
    Cena DECIMAL(10,2),
    Dostepnosc INT,
    Opis TEXT
);

CREATE TABLE Rabat (
    RabatID INT PRIMARY KEY,
    Rodzaj_znizki VARCHAR(100),
    Wartosc_znizki DECIMAL(5,2)
);

CREATE TABLE Dostawa (
    DostawaID INT PRIMARY KEY,
    Sposob_dostawy VARCHAR(50),
    Koszt_dostawy DECIMAL(10,2)
);

CREATE TABLE Departament (
    DepartamentID INT PRIMARY KEY,
    Nazwa_departamentu VARCHAR(100)
);

CREATE TABLE Pracownik (
    PracownikID INT PRIMARY KEY,
    Imie VARCHAR(100),
    Nazwisko VARCHAR(100),
    DepartamentID INT,
    FOREIGN KEY (DepartamentID) REFERENCES Departament(DepartamentID)
);

CREATE TABLE Zamowienie (
    ZamowienieID INT PRIMARY KEY,
    Data_zlozenia DATE,
    Status_zamowienia VARCHAR(50),
    Metoda_platnosci VARCHAR(50),
    KlientID INT,
    RabatID INT,
    DostawaID INT,
    PracownikID INT,
    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),
    FOREIGN KEY (RabatID) REFERENCES Rabat(RabatID),
    FOREIGN KEY (DostawaID) REFERENCES Dostawa(DostawaID),
    FOREIGN KEY (PracownikID) REFERENCES Pracownik(PracownikID)
);

CREATE TABLE ZamowienieProdukt (
    ZamowienieProduktID INT PRIMARY KEY,
    ZamowienieID INT,
    ProduktID INT,
    Ilosc INT,
    FOREIGN KEY (ZamowienieID) REFERENCES Zamowienie(ZamowienieID),
    FOREIGN KEY (ProduktID) REFERENCES Produkt(ProduktID)
);
ALTER TABLE Zamowienie ADD COLUMN Koszt_calkowity DECIMAL(10,2);