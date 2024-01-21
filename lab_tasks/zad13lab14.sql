set search_path to kurs;
-- zad1
(SELECT imie, nazwisko, 'W' as role
FROM wykladowca
ORDER BY imie, nazwisko)
UNION
(SELECT imie, nazwisko, 'U' as role
FROM uczestnik
ORDER BY imie, nazwisko)
ORDER BY role, imie, nazwisko;
-- zad2
SELECT uczestnik.imie, uczestnik.nazwisko, SUM(uczest_kurs.oplata) as total_payment
FROM uczestnik
JOIN uczest_kurs ON uczestnik.id_uczestnik = uczest_kurs.id_uczest
GROUP BY uczestnik.id_uczestnik
HAVING SUM(uczest_kurs.oplata) > 3200
ORDER BY total_payment DESC;
-- zad3
SELECT kurs_opis.opis, AVG(uczest_kurs.oplata) as average_payment
FROM kurs
JOIN uczest_kurs ON kurs.id_kurs = uczest_kurs.id_kurs
JOIN kurs_opis ON kurs.id_nazwa = kurs_opis.id_nazwa
GROUP BY kurs_opis.opis
ORDER BY average_payment desc;
-- zad4
select kurs_opis.opis, 
       (SELECT SUM(oplata) FROM uczest_kurs WHERE id_kurs = kurs.id_kurs) as total_payment
FROM kurs
JOIN kurs_opis ON kurs.id_nazwa = kurs_opis.id_nazwa
ORDER BY total_payment DESC;
-- zad5
SELECT uczestnik.imie, uczestnik.nazwisko
FROM uczestnik
JOIN uczest_kurs ON uczestnik.id_uczestnik = uczest_kurs.id_uczest
WHERE uczest_kurs.ocena >= 4.5
GROUP BY uczestnik.imie, uczestnik.nazwisko
ORDER BY uczestnik.nazwisko, uczestnik.imie;
-- zad6
SELECT uczestnik.imie, uczestnik.nazwisko,
       CASE 
           WHEN COUNT(uczest_kurs.id_kurs) < 4 THEN 'liczba kursów poniżej 4'
           ELSE 'liczba kursów co najmniej 4 lub więcej'
       END as liczba_kursow
FROM uczestnik
JOIN uczest_kurs ON uczestnik.id_uczestnik = uczest_kurs.id_uczest
GROUP BY uczestnik.imie, uczestnik.nazwisko
ORDER BY uczestnik.nazwisko, uczestnik.imie;
-- zad7
SELECT wykladowca.imie, wykladowca.nazwisko
FROM wykladowca
WHERE NOT EXISTS (
    SELECT 1
    FROM uczestnik
    WHERE uczestnik.id_uczestnik IN (1, 2, 3)
    AND NOT EXISTS (
        SELECT 1
        FROM wykl_kurs
        JOIN uczest_zaj ON wykl_kurs.id_kurs = uczest_zaj.id_kurs
        WHERE wykl_kurs.id_wykl = wykladowca.id_wykladowca
        AND uczest_zaj.id_uczest = uczestnik.id_uczestnik
    )
)
ORDER BY wykladowca.nazwisko, wykladowca.imie;
-- zad8
WITH Sum_Oplat AS (
    SELECT uczestnik.imie, uczestnik.nazwisko, SUM(uczest_kurs.oplata) AS suma_oplat
    FROM uczestnik
    JOIN uczest_kurs ON uczestnik.id_uczestnik = uczest_kurs.id_uczest
    GROUP BY uczestnik.imie, uczestnik.nazwisko
)
SELECT * FROM Sum_Oplat
ORDER BY suma_oplat DESC;
-- zad9
CREATE OR REPLACE FUNCTION get_zajecia(id_wykladowca int)
RETURNS varchar AS $$
DECLARE
    zajecia_list varchar;
BEGIN
    SELECT STRING_AGG(DISTINCT kurs_opis.opis::varchar, '; ') INTO zajecia_list
    FROM zajecia
    JOIN wykl_kurs ON zajecia.id_kurs = wykl_kurs.id_kurs
    JOIN kurs ON zajecia.id_kurs = kurs.id_kurs
    JOIN kurs_opis ON kurs.id_nazwa = kurs_opis.id_nazwa
    WHERE wykl_kurs.id_wykl = id_wykladowca;
    
    RETURN zajecia_list;
END; $$
LANGUAGE plpgsql;

SELECT wykladowca.imie, wykladowca.nazwisko, get_zajecia(wykladowca.id_wykladowca) AS zajecia
FROM wykladowca
ORDER BY wykladowca.nazwisko, wykladowca.imie;