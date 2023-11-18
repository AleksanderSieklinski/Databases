set search_path to zadanie27_11_drzewo_genealogiczne;
-- informacje o danej osobie
SELECT * FROM osoba where id = 8;
-- informacje o rodzicach danej osoby
SELECT o.* FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_rodzica = o.ID
WHERE p.ID_osoby = 8;
-- informacje o dzieciach danej osoby
SELECT o.* FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_osoby = o.ID
WHERE p.ID_rodzica = 8;
-- informacje o dziadkach danej osoby
SELECT o.Imię, o.Nazwisko
FROM Pokrewieństwo p
JOIN Pokrewieństwo gp ON p.ID_rodzica = gp.ID_osoby
JOIN Osoba o ON gp.ID_rodzica = o.ID
WHERE p.ID_osoby = 7;
-- informacje o rodzeństwie danej osoby
SELECT o.Imię, o.Nazwisko
FROM Pokrewieństwo p
JOIN Osoba o ON p.ID_osoby = o.ID
WHERE p.ID_rodzica IN (
    SELECT ID_rodzica
    FROM Pokrewieństwo
    WHERE ID_osoby = 7
) AND p.ID_osoby != 7;