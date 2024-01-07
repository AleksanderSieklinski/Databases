set search_path to zadanie6_11_autobusy;

-- dla wybranego przystanku -> znaleźć linie zatrzymujące się na tym przystanku
select nr_tramwaju from przystanek_odjazd_tramwaj pot where pot.nazwa_przystanku = 'Kraków Bieżanów' group by pot.nr_tramwaju order by 1;
select nr_autobusu from przystanek_odjazd_autobus poa where poa.nazwa_przystanku = 'Kraków Bieżanów' group by poa.nr_autobusu order by 1;

-- dla wybranego przystanku i linii -> znaleźć czasy odjazdu
select czas_odjazdu,kierunek as przystanek_końcowy from przystanek_odjazd_tramwaj pot where pot.nr_tramwaju = 2 and pot.nazwa_przystanku = 'Kraków Bieżanów' order by pot.kierunek,pot.czas_odjazdu;
select czas_odjazdu,kierunek as przystanek_końcowy from przystanek_odjazd_autobus poa where poa.nr_autobusu = 102 and poa.nazwa_przystanku = 'Kraków Bieżanów' order by poa.kierunek,poa.czas_odjazdu;

-- dla wybranej linii -> znaleźć przystanki i czasy odjazdy z przystanków
select nazwa_przystanku,czas_odjazdu,kierunek as przystanek_końcowy from przystanek_odjazd_tramwaj pot where pot.nr_tramwaju = 1 order by pot.kierunek,pot.czas_odjazdu;
select nazwa_przystanku,czas_odjazdu,kierunek as przystanek_końcowy from przystanek_odjazd_autobus poa where poa.nr_autobusu = 101 order by poa.kierunek,poa.czas_odjazdu;