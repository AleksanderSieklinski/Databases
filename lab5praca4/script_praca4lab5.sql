set search_path to kurs;
-- Statystyka kursów 1.
select opis,
    cast(round(100.0 * count(*) / (select count(*) from uczest_kurs),1) as numeric(4,1)) as stat_osob,
    cast(round(100.0 * (select count(*) from uczest_kurs as uk where uk.id_kurs = kurs.id_kurs and ocena >= 4) / count(*),1) as numeric(4,1)) as stat_ocena
from kurs left join  uczest_kurs on kurs.id_kurs = uczest_kurs.id_kurs natural join kurs_opis
group by opis, kurs.id_kurs
order by opis;
-- Statystyka kursów 2.
select imie, nazwisko,
    case when exists (select * from uczest_kurs where id_kurs = 1 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k1,
    case when exists (select * from uczest_kurs where id_kurs = 2 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k2,
    case when exists (select * from uczest_kurs where id_kurs = 3 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k3,
    case when exists (select * from uczest_kurs where id_kurs = 4 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k4,
    case when exists (select * from uczest_kurs where id_kurs = 5 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k5,
    case when exists (select * from uczest_kurs where id_kurs = 6 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k6,
    case when exists (select * from uczest_kurs where id_kurs = 7 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k7,
    case when exists (select * from uczest_kurs where id_kurs = 8 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k8,
    case when exists (select * from uczest_kurs where id_kurs = 9 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k9,
    case when exists (select * from uczest_kurs where id_kurs = 10 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k10,
    case when exists (select * from uczest_kurs where id_kurs = 11 and id_uczest = uczestnik.id_uczestnik) then 'x' else '' end as k11
from uczestnik
order by nazwisko, imie;
-- Statystyka kursów 3.
select opis,
    (select count(*) from uczest_kurs as uk where uk.id_kurs = kurs.id_kurs and ocena = 3) as ocena_3,
    (select count(*) from uczest_kurs as uk where uk.id_kurs = kurs.id_kurs and ocena = 4) as ocena_4,
    (select count(*) from uczest_kurs as uk where uk.id_kurs = kurs.id_kurs and ocena = 5) as ocena_5,
    (select count(*) from uczest_kurs as uk where uk.id_kurs = kurs.id_kurs and ocena is null) as ocena_null
from kurs natural join kurs_opis
order by opis;