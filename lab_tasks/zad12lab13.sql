-- Zad1
set search_path to kurs;
SELECT id_kurs, id_zaj, COUNT(*) AS sum
FROM (
    SELECT id_kurs, id_zaj
    FROM uczest_zaj
    WHERE obec = 1
) AS subquery
GROUP BY ROLLUP (id_kurs, id_zaj)
ORDER BY id_kurs, id_zaj;
-- Zad2
set search_path to kurs;
CREATE EXTENSION IF NOT EXISTS tablefunc;
CREATE TEMP TABLE IF NOT exists temp1 AS
SELECT id_kurs, id_zaj, COUNT(*) as count
FROM uczest_zaj
WHERE obec = 1
GROUP BY id_kurs, id_zaj;
SELECT * FROM (
  SELECT * FROM crosstab(
    'SELECT kz.id_kurs, kz.id_zaj, COALESCE(COUNT(u.obec), 0)
     FROM (SELECT k.id_kurs, z.id_zaj
           FROM (SELECT DISTINCT id_kurs FROM uczest_zaj) k
           CROSS JOIN (SELECT generate_series(1, 10) AS id_zaj) z) kz
     LEFT JOIN uczest_zaj u ON u.id_kurs = kz.id_kurs AND u.id_zaj = kz.id_zaj AND u.obec = 1
     GROUP BY kz.id_kurs, kz.id_zaj
     ORDER BY kz.id_kurs, kz.id_zaj',
    'SELECT generate_series(1, 10) AS id_zaj'
  ) AS ct (grupa INT, z1 INT, z2 INT, z3 INT, z4 INT, z5 INT, z6 INT, z7 INT, z8 INT, z9 INT, z10 INT)
  UNION ALL
  SELECT NULL, SUM(z1), SUM(z2), SUM(z3), SUM(z4), SUM(z5), SUM(z6), SUM(z7), SUM(z8), SUM(z9), SUM(z10)
  FROM crosstab(
    'SELECT kz.id_kurs, kz.id_zaj, COALESCE(COUNT(u.obec), 0)
     FROM (SELECT k.id_kurs, z.id_zaj
           FROM (SELECT DISTINCT id_kurs FROM uczest_zaj) k
           CROSS JOIN (SELECT generate_series(1, 10) AS id_zaj) z) kz
     LEFT JOIN uczest_zaj u ON u.id_kurs = kz.id_kurs AND u.id_zaj = kz.id_zaj AND u.obec = 1
     GROUP BY kz.id_kurs, kz.id_zaj
     ORDER BY kz.id_kurs, kz.id_zaj',
    'SELECT generate_series(1, 10) AS id_zaj'
  ) AS ct (grupa INT, z1 INT, z2 INT, z3 INT, z4 INT, z5 INT, z6 INT, z7 INT, z8 INT, z9 INT, z10 INT)
) AS final
ORDER BY grupa;
--Zad3
set search_path to kurs;
SELECT id_kurs, id_zaj,
       ROW_NUMBER() OVER(PARTITION BY id_kurs ORDER BY COUNT(*) DESC) AS row_number,
       COUNT(*) AS sum,
       SUM(COUNT(*)) OVER(PARTITION BY id_kurs) AS total_sum
FROM (
    SELECT id_kurs, id_zaj
    FROM uczest_zaj
    WHERE obec = 1
) AS subquery
GROUP BY id_kurs, id_zaj
ORDER BY id_kurs, row_number;