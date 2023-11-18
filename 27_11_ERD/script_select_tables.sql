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