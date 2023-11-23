set search_path to kurs;
CREATE OR REPLACE FUNCTION equ_tables(a INT, b INT, c INT, x_start INT, x_increment INT, num_records INT)
RETURNS TABLE(i INT, x INT, y INT) AS $$
DECLARE
  counter INT;
BEGIN
  FOR counter IN 1..num_records LOOP
    i := counter;
    x := x_start + (counter - 1) * x_increment;
    y := a * x * x + b * x + c;
    RETURN NEXT;
  END LOOP;
END; $$
LANGUAGE plpgsql;
-- equ_tables(1,2,1,1,1,10);
select * from equ_tables(1,2,1,1,1,10);

CREATE OR REPLACE FUNCTION equ_solve(a INT, b INT, c INT)
RETURNS TEXT AS $$
DECLARE
  delta INT;
  x1 DOUBLE PRECISION;
  x2 DOUBLE PRECISION;
BEGIN
  delta := b * b - 4 * a * c;
  IF delta < 0 THEN
    RAISE INFO 'DELTA = %', delta;
    RAISE INFO 'Rozwiązanie w dziedzinie liczb zespolonych';
    x1 := -b / (2.0 * a);
    x2 := SQRT(-delta) / (2.0 * a);
    RAISE INFO 'x1 = % + %i ', x1,x2;
    RAISE INFO 'x2 = % - %i ', x1,x2;
    RETURN FORMAT('(x1 = %s + %si ),(x2 = %s - %si )', x1, x2, x1, x2);
  ELSE
    RAISE INFO 'DELTA = %', delta;
    RAISE INFO 'Rozwiązanie posiada dwa rzeczywiste pierwiastki';
    x1 := (-b + SQRT(delta)) / (2.0 * a);
    x2 := (-b - SQRT(delta)) / (2.0 * a);
    RAISE INFO 'x1 = %s', x1;
    RAISE INFO 'x2 = %s', x2;
    RETURN FORMAT('(x1 = %s ),(x2 = %s )', x1, x2);
  END IF;
END; $$
LANGUAGE plpgsql;
-- equ_solve(1,10,1);
select equ_solve(1,10,1);
-- equ_solve(10,5,1);
select equ_solve(10,5,1);

CREATE OR REPLACE FUNCTION uczest_wykladowca(id_uczestn int)
RETURNS TABLE(w_nazwisko text, w_imie text) AS $$
BEGIN
RETURN QUERY
SELECT distinct w.nazwisko::text, w.imie::text
FROM wykladowca w
JOIN wykl_kurs wk ON wk.id_wykl = w.id_wykladowca
JOIN kurs k ON k.id_kurs = wk.id_kurs
JOIN uczest_kurs uk ON uk.id_kurs = k.id_kurs
WHERE uk.id_uczest = id_uczestn;
END; $$
LANGUAGE 'plpgsql';
-- uczest_wykladowca(1);
select * from  uczest_wykladowca(1);

CREATE OR REPLACE FUNCTION uczest_kurs(id_uczestn int)
RETURNS TABLE(z_opis text) AS $$
BEGIN
RETURN QUERY
SELECT ko.opis::text
FROM kurs_opis ko
JOIN kurs k ON ko.id_nazwa = k.id_nazwa
JOIN uczest_kurs uk ON uk.id_kurs = k.id_kurs
WHERE uk.id_uczest = id_uczestn;
END; $$
LANGUAGE 'plpgsql';
-- uczest_kurs(1);
select * from  uczest_kurs(1);

CREATE OR REPLACE FUNCTION lista_obec(kurs_id_param INT)
RETURNS TABLE(s_nazwisko character varying(30), s_imie character varying(30), z1 bigint, z2 bigint, z3 bigint, z4 bigint, z5 bigint, z6 bigint, z7 bigint, z8 bigint, z9 bigint, z10 bigint, sum bigint) AS $$
BEGIN
  RETURN QUERY
  WITH attendance AS (
    SELECT
      uz.id_uczest,
      uz.id_zaj,
      uz.obec AS attended
    FROM uczest_zaj uz
    WHERE uz.id_kurs = kurs_id_param
  )
  SELECT
    u.nazwisko,
    u.imie,
    SUM(CASE WHEN a.id_zaj = 1 THEN a.attended ELSE 0 END) AS z1,
    SUM(CASE WHEN a.id_zaj = 2 THEN a.attended ELSE 0 END) AS z2,
    SUM(CASE WHEN a.id_zaj = 3 THEN a.attended ELSE 0 END) AS z3,
    SUM(CASE WHEN a.id_zaj = 4 THEN a.attended ELSE 0 END) AS z4,
    SUM(CASE WHEN a.id_zaj = 5 THEN a.attended ELSE 0 END) AS z5,
    SUM(CASE WHEN a.id_zaj = 6 THEN a.attended ELSE 0 END) AS z6,
    SUM(CASE WHEN a.id_zaj = 7 THEN a.attended ELSE 0 END) AS z7,
    SUM(CASE WHEN a.id_zaj = 8 THEN a.attended ELSE 0 END) AS z8,
    SUM(CASE WHEN a.id_zaj = 9 THEN a.attended ELSE 0 END) AS z9,
    SUM(CASE WHEN a.id_zaj = 10 THEN a.attended ELSE 0 END) AS z10,
    SUM(a.attended) AS sum
  FROM
    uczestnik u
  JOIN
    attendance a on a.id_uczest = u.id_uczestnik
  GROUP BY
    u.nazwisko, u.imie;
END; $$
LANGUAGE plpgsql;
-- lista_obec(1);
select * from lista_obec(1);