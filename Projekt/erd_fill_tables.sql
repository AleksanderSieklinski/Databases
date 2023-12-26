    SET SEARCH_PATH TO sklep_internetowy;

    INSERT INTO Klient (KlientID, Imie, Nazwisko, Adres, Email, Numer_telefonu)
    VALUES
    (nextval('klient_id_seq'), 'admin', '', 'ul. Admina 1, 00-000 Warszawa', 'admin@gmail.com', '111111111'),
    (nextval('klient_id_seq'), 'Jan', 'Kowalski', 'ul. Kowalskiego 1, 00-000 Warszawa', 'jankowalski@gmail.com', '222222222'),
    (nextval('klient_id_seq'), 'Anna', 'Nowak', 'ul. Nowaka 1, 00-000 Warszawa', 'annanowak@gmail.com', '333333333'),
    (nextval('klient_id_seq'), 'Jan', 'Nowak', 'ul. Nowaka 1, 00-000 Warszawa', 'jannowak@gmail.com', '444444444'),
    (nextval('klient_id_seq'), 'Anna', 'Kowalska', 'ul. Kowalska 1, 00-000 Warszawa', 'annakowalska@gmail.com', '555555555');

    INSERT INTO Departament (DepartamentID, Nazwa_departamentu)
    VALUES
    (nextval('departament_id_seq'), 'Departament 1 ds. ogrodu'),
    (nextval('departament_id_seq'), 'Departament 2 ds. elektroniki'),
    (nextval('departament_id_seq'), 'Departament 3 ds. AGD'),
    (nextval('departament_id_seq'), 'Departament 4 ds. RTV');

    INSERT INTO RodzajProduktu (RodzajProduktuID, Nazwa, DepartamentID)
    VALUES
    (nextval('rodzaj_produktu_id_seq'), 'Ogrod', 1),
    (nextval('rodzaj_produktu_id_seq'), 'Elektronika', 2),
    (nextval('rodzaj_produktu_id_seq'), 'AGD', 3),
    (nextval('rodzaj_produktu_id_seq'), 'RTV', 4);

    INSERT INTO Produkt (ProduktID, Nazwa, Cena, Dostepnosc, Opis, RodzajProduktuID)
    VALUES
    (nextval('produkt_id_seq'), 'Kosiarka', 100.00, 10, 'Świeżo skoszony trawnik to wizytówka każdego domu.', 1),
    (nextval('produkt_id_seq'), 'Łopata', 200.00, 20, 'Łopata do kopania dziur.', 1),
    (nextval('produkt_id_seq'), 'Siekiera', 300.00, 30, 'Siekiera do siekania drzew.', 1),
    (nextval('produkt_id_seq'), 'Saperka', 400.00, 40, 'Saperka do kopania rowów.', 1),
    (nextval('produkt_id_seq'), 'Grabie', 500.00, 50, 'Grabie do grabienia liści.', 1),
    (nextval('produkt_id_seq'), 'Sekator', 600.00, 60, 'Sekator do przycinania krzewów.', 1),
    (nextval('produkt_id_seq'), 'Nożyce do żywopłotu', 700.00, 70, 'Nożyce do przycinania żywopłotu.', 1),
    (nextval('produkt_id_seq'), 'Iphone 12', 800.00, 80, 'Iphone 12 to najnowszy smartfon firmy Apple.', 2),
    (nextval('produkt_id_seq'), 'Samsung Galaxy S21', 900.00, 90, 'Samsung Galaxy S21 to najnowszy smartfon firmy Samsung.', 2),
    (nextval('produkt_id_seq'), 'Xiaomi Mi 11', 1000.00, 100, 'Xiaomi Mi 11 to najnowszy smartfon firmy Xiaomi.', 2),
    (nextval('produkt_id_seq'), 'Huawei P40', 1100.00, 110, 'Huawei P40 to najnowszy smartfon firmy Huawei.', 2),
    (nextval('produkt_id_seq'), 'OnePlus 9', 1200.00, 120, 'OnePlus 9 to najnowszy smartfon firmy OnePlus.', 2),
    (nextval('produkt_id_seq'), 'Odkurzacz', 1300.00, 130, 'Odkurzacz do odkurzania podłóg.', 2),
    (nextval('produkt_id_seq'), 'Lodówka', 1400.00, 140, 'Lodówka do przechowywania jedzenia.', 3),
    (nextval('produkt_id_seq'), 'Zmywarka', 1500.00, 150, 'Zmywarka do zmywania naczyń.', 3),
    (nextval('produkt_id_seq'), 'Pralka', 1600.00, 160, 'Pralka do prania ubrań.', 3),
    (nextval('produkt_id_seq'), 'Kuchenka', 1700.00, 170, 'Kuchenka do gotowania jedzenia.', 3),
    (nextval('produkt_id_seq'), 'Mikrofalówka', 1800.00, 180, 'Mikrofalówka do podgrzewania jedzenia.', 3),
    (nextval('produkt_id_seq'), 'Telewizor', 1900.00, 190, 'Telewizor do oglądania filmów.', 4),
    (nextval('produkt_id_seq'), 'Laptop', 2000.00, 200, 'Laptop do pracy.', 4),
    (nextval('produkt_id_seq'), 'Monitor', 2100.00, 210, 'Monitor do pracy.', 4),
    (nextval('produkt_id_seq'), 'Klawiatura', 2200.00, 220, 'Klawiatura do pracy.', 4),
    (nextval('produkt_id_seq'), 'Myszka', 2300.00, 230, 'Myszka do pracy.', 4),
    (nextval('produkt_id_seq'), 'Słuchawki', 2400.00, 240, 'Słuchawki do słuchania muzyki.', 2);

    INSERT INTO Rabat (RabatID, Rodzaj_znizki, Wartosc_znizki)
    VALUES
    (nextval('rabat_id_seq'), 'brak', 0.00),
    (nextval('rabat_id_seq'), 'stalego klienta', 15.00),
    (nextval('rabat_id_seq'), 'pracownicza', 40.00),
    (nextval('rabat_id_seq'), 'pierwsze zamowienie', 10.00);

    INSERT INTO Dostawa (DostawaID, Sposob_dostawy, Koszt_dostawy)
    VALUES
    (nextval('dostawa_id_seq'), 'paczkomat', 10.00),
    (nextval('dostawa_id_seq'), 'kurier', 20.00),
    (nextval('dostawa_id_seq'), 'odbior osobisty', 0.00);

    INSERT INTO Pracownik (PracownikID, Imie, Nazwisko, DepartamentID)
    VALUES
    (nextval('pracownik_id_seq'), 'Adrian', 'Abacki', 1),
    (nextval('pracownik_id_seq'), 'Bartosz', 'Babacki', 2),
    (nextval('pracownik_id_seq'), 'Cezary', 'Cabacki', 3),
    (nextval('pracownik_id_seq'), 'Dariusz', 'Dabacki', 4),
    (nextval('pracownik_id_seq'), 'Eryk', 'Ebacki', 1),
    (nextval('pracownik_id_seq'), 'Filip', 'Fbacki', 2),
    (nextval('pracownik_id_seq'), 'Grzegorz', 'Gbacki', 3),
    (nextval('pracownik_id_seq'), 'Henryk', 'Hbacki', 4),
    (nextval('pracownik_id_seq'), 'Igor', 'Ibacki', 1),
    (nextval('pracownik_id_seq'), 'Jan', 'Jbacki', 2),
    (nextval('pracownik_id_seq'), 'Kamil', 'Kbacki', 3),
    (nextval('pracownik_id_seq'), 'Lukasz', 'Lbacki', 4),
    (nextval('pracownik_id_seq'), 'Mariusz', 'Mbacki', 1),
    (nextval('pracownik_id_seq'), 'Norbert', 'Nbacki', 2),
    (nextval('pracownik_id_seq'), 'Oskar', 'Obacki', 3),
    (nextval('pracownik_id_seq'), 'Piotr', 'Pbacki', 4),
    (nextval('pracownik_id_seq'), 'Rafal', 'Rbacki', 1),
    (nextval('pracownik_id_seq'), 'Sebastian', 'Sbacki', 2),
    (nextval('pracownik_id_seq'), 'Tomasz', 'Tbacki', 3),
    (nextval('pracownik_id_seq'), 'Urszula', 'Ubacka', 4),
    (nextval('pracownik_id_seq'), 'Wojciech', 'Wbacki', 1),
    (nextval('pracownik_id_seq'), 'Xawery', 'Xbacki', 2),
    (nextval('pracownik_id_seq'), 'Yan', 'Ybacki', 3),
    (nextval('pracownik_id_seq'), 'Zbigniew', 'Zbacki', 4);

    INSERT INTO Zamowienie (ZamowienieID, Data_zlozenia, Status_zamowienia, Metoda_platnosci, KlientID, RabatID, DostawaID, PracownikID, Koszt_calkowity)
    VALUES
    (nextval('zamowienie_id_seq'), '2022-01-01', 'Zlozone', 'Karta', 1, 1, 1, 1, 100.00),
    (nextval('zamowienie_id_seq'), '2022-01-02', 'Zlozone', 'Gotowka', 2, 2, 2, 2, 200.00);

    INSERT INTO ZamowienieProdukt (ZamowienieProduktID, ZamowienieID, ProduktID, Ilosc)
    VALUES
    (nextval('zamowienie_produkt_id_seq'), 1, 1, 1),
    (nextval('zamowienie_produkt_id_seq'), 2, 2, 2);