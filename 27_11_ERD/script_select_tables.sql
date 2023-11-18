set search_path to zadanie27_11_drzewo_genealogiczne;

-- informacje o danej osobie
SELECT * FROM OsobaView WHERE id = 8;
-- informacje o rodzicach danej osoby
SELECT * FROM RodziceView WHERE ID_osoby = 8;
-- informacje o dzieciach danej osoby
SELECT * FROM DzieciView WHERE ID_rodzica = 8;
-- informacje o dziadkach danej osoby
SELECT * FROM DziadkowieView WHERE ID_osoby = 7;
-- informacje o rodzeństwie danej osoby
SELECT * FROM RodzeństwoView WHERE ID_rodzica IN (
    SELECT ID_rodzica
    FROM Pokrewieństwo
    WHERE ID_osoby = 7
) AND Rodzeństwo_ID != 7;