set search_path to kurs;

--Attendance
WITH attendance AS (
  SELECT
    uz.id_uczest,
    uz.id_zaj,
    uz.obec AS attended
  FROM uczest_zaj uz
  JOIN uczest_kurs uk ON uz.id_uczest = uk.id_uczest
  GROUP BY uz.id_uczest, uz.id_zaj, uz.obec
)
SELECT
    nazwisko,
    imie,
    SUM(CASE WHEN id_zaj = 1 THEN attended ELSE 0 END) AS z1,
    SUM(CASE WHEN id_zaj = 2 THEN attended ELSE 0 END) AS z2,
    SUM(CASE WHEN id_zaj = 3 THEN attended ELSE 0 END) AS z3,
    SUM(CASE WHEN id_zaj = 4 THEN attended ELSE 0 END) AS z4,
    SUM(CASE WHEN id_zaj = 5 THEN attended ELSE 0 END) AS z5,
    SUM(CASE WHEN id_zaj = 6 THEN attended ELSE 0 END) AS z6,
    SUM(CASE WHEN id_zaj = 7 THEN attended ELSE 0 END) AS z7,
    SUM(CASE WHEN id_zaj = 8 THEN attended ELSE 0 END) AS z8,
    SUM(CASE WHEN id_zaj = 9 THEN attended ELSE 0 END) AS z9,
    SUM(CASE WHEN id_zaj = 10 THEN attended ELSE 0 END) AS z10,
    SUM(attended) AS sum
FROM attendance a
JOIN uczestnik u ON u.id_uczestnik = a.id_uczest
GROUP BY imie, nazwisko;
--Course participation
WITH course_participation AS (
    SELECT
        ko.opis as kurs,
        k.id_grupa as grupa,
        COUNT(distinct case when uz.obec = 1 then uz.id_uczest end) AS participants,
        uz.id_zaj
    FROM uczest_zaj uz
    JOIN kurs k ON uz.id_kurs = k.id_kurs
    JOIN kurs_opis ko ON ko.id_nazwa = k.id_nazwa
    GROUP BY ko.opis, k.id_grupa, uz.id_zaj
)
SELECT
    kurs,
    SUM(CASE WHEN id_zaj = 1 THEN participants ELSE 0 END) AS z1,
    SUM(CASE WHEN id_zaj = 2 THEN participants ELSE 0 END) AS z2,
    SUM(CASE WHEN id_zaj = 3 THEN participants ELSE 0 END) AS z3,
    SUM(CASE WHEN id_zaj = 4 THEN participants ELSE 0 END) AS z4,
    SUM(CASE WHEN id_zaj = 5 THEN participants ELSE 0 END) AS z5,
    SUM(CASE WHEN id_zaj = 6 THEN participants ELSE 0 END) AS z6,
    SUM(CASE WHEN id_zaj = 7 THEN participants ELSE 0 END) AS z7,
    SUM(CASE WHEN id_zaj = 8 THEN participants ELSE 0 END) AS z8,
    SUM(CASE WHEN id_zaj = 9 THEN participants ELSE 0 END) AS z9,
    SUM(CASE WHEN id_zaj = 10 THEN participants ELSE 0 END) AS z10,
    SUM(participants) AS sum
FROM course_participation
GROUP BY kurs,grupa;
-- Teachers and courses
WITH teachers AS (
  SELECT
    id_wykl,
    id_kurs
  FROM wykl_kurs wk
)
SELECT
    nazwisko,
    imie,
    SUM(CASE WHEN id_kurs = 1 THEN 1 ELSE 0 END) AS k1,
    SUM(CASE WHEN id_kurs = 2 THEN 1 ELSE 0 END) AS k2,
    SUM(CASE WHEN id_kurs = 3 THEN 1 ELSE 0 END) AS k3,
    SUM(CASE WHEN id_kurs = 4 THEN 1 ELSE 0 END) AS k4,
    SUM(CASE WHEN id_kurs = 5 THEN 1 ELSE 0 END) AS k5,
    SUM(CASE WHEN id_kurs = 6 THEN 1 ELSE 0 END) AS k6,
    SUM(CASE WHEN id_kurs = 7 THEN 1 ELSE 0 END) AS k7,
    SUM(CASE WHEN id_kurs = 8 THEN 1 ELSE 0 END) AS k8,
    SUM(CASE WHEN id_kurs = 9 THEN 1 ELSE 0 END) AS k9,
    SUM(CASE WHEN id_kurs = 10 THEN 1 ELSE 0 END) AS k10,
    SUM(CASE WHEN id_kurs = 11 THEN 1 ELSE 0 END) AS k11,
    SUM(1) AS sum
FROM teachers t
JOIN wykladowca w ON t.id_wykl = w.id_wykladowca
GROUP BY imie, nazwisko;