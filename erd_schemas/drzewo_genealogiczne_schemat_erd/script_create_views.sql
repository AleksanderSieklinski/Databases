set search_path to zadanie27_11_drzewo_genealogiczne;
-- informacje o danej osobie
CREATE VIEW OsobaView AS
SELECT * FROM Osoba;

-- informacje o rodzicach danej osoby
CREATE VIEW RodziceView AS
SELECT p.ID_osoby, o.*
FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_rodzica = o.ID;

-- informacje o dzieciach danej osoby
CREATE VIEW DzieciView AS
SELECT p.ID_rodzica, o.*
FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_osoby = o.ID;

-- informacje o dziadkach danej osoby
CREATE VIEW DziadkowieView AS
SELECT p.ID_osoby, gp.ID_rodzica AS Dziadek_ID, o.Imię, o.Nazwisko
FROM Pokrewieństwo p
JOIN Pokrewieństwo gp ON p.ID_rodzica = gp.ID_osoby
JOIN Osoba o ON gp.ID_rodzica = o.ID;

-- informacje o rodzeństwie danej osoby
CREATE VIEW RodzeństwoView AS
SELECT p.ID_rodzica, o.ID AS Rodzeństwo_ID, o.Imię, o.Nazwisko
FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_osoby = o.ID;
