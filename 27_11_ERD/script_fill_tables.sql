set search_path to zadanie27_11_drzewo_genealogiczne;
-- osoby zmarłe
INSERT INTO Osoba (Imię, Nazwisko, Data_urodzenia, Miejsce_urodzenia, Data_zgonu)
VALUES ('Jan', 'Kowalski', '1980-01-01', 'Warszawa', '2020-01-01'),
       ('Anna', 'Nowak', '1982-02-02', 'Kraków', '2019-02-22');
-- osoby żyjące
INSERT INTO Osoba (Imię, Nazwisko, Data_urodzenia, Miejsce_urodzenia)
VALUES ('Piotr', 'Kowalski', '2010-03-03', 'Warszawa'),
       ('Maria', 'Kowalska', '2012-04-04', 'Warszawa'),
       ('Józef', 'Nowak', '1975-05-05', 'Kraków'),
       ('Barbara', 'Nowak', '1977-06-06', 'Kraków'),
       ('Krzysztof', 'Kowalski', '2019-07-07', 'Kraków'),
       ('Adam', 'Kowalski', '2002-01-01', 'Warszawa'),
       ('Ewa', 'Kowalska', '2003-02-02', 'Warszawa');
-- wprowadzanie relacji małżeństw
INSERT INTO Małżeństwo (ID_Męża, ID_Żony, Data_ślubu)
VALUES (1, 2, '2005-05-05'),  -- Jan i Anna są małżeństwem
       (5, 6, '1999-09-09'),  -- Józef i Barbara są małżeństwem
       (8, 9, '2000-01-01');  -- Adam i Ewa są małżeństwem

-- wprowadzanie relacji dzieci i rodziców
INSERT INTO Pokrewieństwo (ID_osoby, ID_rodzica, ID_małżeństwa)
VALUES (8, 1, 1),  -- Adam jest synem Jana z małżeństwa Jana i Anny
       (8, 2, 1),  -- Adam jest synem Anny z małżeństwa Jana i Anny
       (9, 5, 2),  -- Ewa jest córką Józefa z małżeństwa Józefa i Barbary
       (9, 6, 2),  -- Ewa jest córką Barbary z małżeństwa Józefa i Barbary
       (7, 8, 3),  -- Krzysztof jest synem Adama z małżeństwa Adama i Ewy
       (7, 9, 3);  -- Krzysztof jest synem Ewy z małżeństwa Adama i Ewy