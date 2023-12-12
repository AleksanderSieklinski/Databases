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
    Imie VARCHAR(100) NOT NULL CHECK (Imie <> ''),
    Nazwisko VARCHAR(100),
    Adres VARCHAR(255),
    Email VARCHAR(100),
    Numer_telefonu VARCHAR(15)
);

CREATE TABLE Produkt (
    ProduktID INT PRIMARY KEY,
    Nazwa VARCHAR(100) NOT NULL CHECK (Nazwa <> ''),
    Cena DECIMAL(10,2) CHECK (Cena > 0),
    Dostepnosc INT CHECK (Dostepnosc > 0),
    Opis TEXT
);

CREATE TABLE Rabat (
    RabatID INT PRIMARY KEY,
    Rodzaj_znizki VARCHAR(100) NOT NULL CHECK (Rodzaj_znizki <> ''),
    Wartosc_znizki DECIMAL(5,2) NOT NULL
);

CREATE TABLE Dostawa (
    DostawaID INT PRIMARY KEY,
    Sposob_dostawy VARCHAR(50) NOT NULL CHECK (Sposob_dostawy <> ''),
    Koszt_dostawy DECIMAL(10,2) NOT NULL
);

CREATE TABLE Departament (
    DepartamentID INT PRIMARY KEY,
    Nazwa_departamentu VARCHAR(100) NOT NULL CHECK (Nazwa_departamentu <> '')
);

CREATE TABLE Pracownik (
    PracownikID INT PRIMARY KEY,
    Imie VARCHAR(100) NOT NULL CHECK (Imie <> ''),
    Nazwisko VARCHAR(100) NOT NULL CHECK (Nazwisko <> ''),
    DepartamentID INT NOT NULL CHECK (DepartamentID > 0),
    FOREIGN KEY (DepartamentID) REFERENCES Departament(DepartamentID)
);

CREATE TABLE Zamowienie (
    ZamowienieID INT PRIMARY KEY,
    Data_zlozenia DATE NOT NULL,
    Status_zamowienia VARCHAR(50) NOT NULL CHECK (Status_zamowienia <> ''),
    Metoda_platnosci VARCHAR(50) NOT NULL CHECK (Metoda_platnosci <> ''),
    KlientID INT NOT NULL CHECK (KlientID > 0),
    RabatID INT NOT NULL CHECK (RabatID > 0),
    DostawaID INT NOT NULL CHECK (DostawaID > 0),
    PracownikID INT NOT NULL CHECK (PracownikID > 0),
    Koszt_calkowity DECIMAL(10,2),
    FOREIGN KEY (KlientID) REFERENCES Klient(KlientID),
    FOREIGN KEY (RabatID) REFERENCES Rabat(RabatID),
    FOREIGN KEY (DostawaID) REFERENCES Dostawa(DostawaID),
    FOREIGN KEY (PracownikID) REFERENCES Pracownik(PracownikID)
);

CREATE TABLE ZamowienieProdukt (
    ZamowienieProduktID INT PRIMARY KEY,
    ZamowienieID INT NOT NULL CHECK (ZamowienieID > 0),
    ProduktID INT NOT NULL CHECK (ProduktID > 0),
    Ilosc INT NOT NULL CHECK (Ilosc > 0),
    FOREIGN KEY (ZamowienieID) REFERENCES Zamowienie(ZamowienieID),
    FOREIGN KEY (ProduktID) REFERENCES Produkt(ProduktID)
);

CREATE OR REPLACE FUNCTION delete_order_and_connected_products()
            RETURNS TRIGGER AS $$
            BEGIN
                DELETE FROM sklep_internetowy.ZamowienieProdukt WHERE ZamowienieID = OLD.ZamowienieID;
                RETURN OLD;
            END;
            $$ LANGUAGE plpgsql;

CREATE TRIGGER delete_order_and_connected_products
            BEFORE DELETE ON sklep_internetowy.Zamowienie
            FOR EACH ROW
            EXECUTE PROCEDURE delete_order_and_connected_products();

CREATE OR REPLACE FUNCTION update_total_cost()
                        RETURNS TRIGGER AS $$
                        BEGIN
                            UPDATE sklep_internetowy.Zamowienie SET Koszt_calkowity = Koszt_calkowity + ((SELECT Cena FROM sklep_internetowy.Produkt WHERE ProduktID = NEW.ProduktID) * NEW.Ilosc)*(1 - (SELECT Wartosc_znizki FROM sklep_internetowy.Rabat WHERE RabatID = (SELECT RabatID FROM sklep_internetowy.Zamowienie WHERE ZamowienieID = NEW.ZamowienieID))/100) WHERE ZamowienieID = NEW.ZamowienieID;
                            UPDATE sklep_internetowy.zamowienie set status_zamowienia = 'Złożone' WHERE ZamowienieID = NEW.ZamowienieID;
                            RETURN NEW;
                        END;
                        $$ LANGUAGE plpgsql;

CREATE TRIGGER update_total_cost
                        AFTER INSERT ON sklep_internetowy.ZamowienieProdukt
                        FOR EACH ROW
                        EXECUTE PROCEDURE update_total_cost();

CREATE OR REPLACE FUNCTION update_order_status()
RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.data_zlozenia::date - current_date) = 1 THEN
        NEW.status_zamowienia := 'wysłano';
    ELSIF (NEW.data_zlozenia::date - current_date) > 1 THEN
        NEW.status_zamowienia := 'dostarczono';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_order_status
BEFORE UPDATE ON sklep_internetowy.Zamowienie
FOR EACH ROW
EXECUTE PROCEDURE update_order_status();

CREATE OR REPLACE FUNCTION create_view_for_client(client_id INT)
RETURNS void AS $$
BEGIN
    EXECUTE format('CREATE OR REPLACE VIEW view_client_%s AS SELECT z.ZamowienieID, z.data_zlozenia, z.status_zamowienia, z.metoda_platnosci, z.koszt_calkowity, p.nazwa, zp.ilosc FROM sklep_internetowy.Zamowienie z JOIN sklep_internetowy.ZamowienieProdukt zp ON z.ZamowienieID = zp.ZamowienieID JOIN sklep_internetowy.Produkt p ON zp.ProduktID = p.ProduktID WHERE z.KlientID = %s', client_id, client_id);
END;
$$ LANGUAGE plpgsql;
