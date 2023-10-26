set search_path to zadanie6_11_autobusy;

select distinct nr_tramwaju from przystanek_odjazd_tramwaj where nazwa_przystanku = 'Kraków Bieżanów';

select distinct nr_autobusu from przystanek_odjazd_autobus where nazwa_przystanku = 'Kraków Bieżanów';

select czas_odjazdu from przystanek_odjazd_tramwaj where przystanek_odjazd_tramwaj.nr_tramwaju = 2 and przystanek_odjazd_tramwaj.nazwa_przystanku = 'Kraków Bieżanów';

select czas_odjazdu from przystanek_odjazd_autobus where przystanek_odjazd_autobus.nr_autobusu = 102 and przystanek_odjazd_autobus.nazwa_przystanku = 'Kraków Bieżanów';

select nazwa_przystanku,czas_odjazdu from przystanek_odjazd_tramwaj where przystanek_odjazd_tramwaj.nr_tramwaju = 1;

select nazwa_przystanku,czas_odjazdu from przystanek_odjazd_autobus where przystanek_odjazd_autobus.nr_autobusu = 101;

