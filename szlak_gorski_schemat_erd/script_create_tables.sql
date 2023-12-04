create schema zadanie6_11_autobusy;
set search_path to zadanie6_11_autobusy;
CREATE TABLE przystanek (
                Nazwa_przystanku VARCHAR NOT NULL,
                CONSTRAINT przystanek_pk PRIMARY KEY (Nazwa_przystanku)
);


CREATE TABLE tramwaj (
                Nr_tramwaju INTEGER NOT NULL,
                CONSTRAINT tramwaj_pk PRIMARY KEY (Nr_tramwaju)
);


CREATE TABLE przystanek_odjazd_tramwaj (
                Czas_odjazdu TIME NOT NULL,
                Nr_tramwaju INTEGER NOT NULL,
                Nazwa_przystanku VARCHAR NOT NULL,
                Kierunek VARCHAR NOT NULL,
                CONSTRAINT przystanek_odjazd_tramwaj_pk PRIMARY KEY (Czas_odjazdu, Nr_tramwaju, Nazwa_przystanku)
);


CREATE TABLE autobus (
                Nr_autobusu INTEGER NOT NULL,
                CONSTRAINT autobus_pk PRIMARY KEY (Nr_autobusu)
);


CREATE TABLE przystanek_odjazd_autobus (
                Czas_odjazdu TIME NOT NULL,
                Nr_autobusu INTEGER NOT NULL,
                Nazwa_przystanku VARCHAR NOT NULL,
                Kierunek VARCHAR NOT NULL,
                CONSTRAINT przystanek_odjazd_autobus_pk PRIMARY KEY (Czas_odjazdu, Nr_autobusu, Nazwa_przystanku)
);


ALTER TABLE przystanek_odjazd_tramwaj ADD CONSTRAINT przystanek_przystanek_odjazd_tramwaj_fk
FOREIGN KEY (Nazwa_przystanku)
REFERENCES przystanek (Nazwa_przystanku)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE przystanek_odjazd_autobus ADD CONSTRAINT przystanek_przystanek_odjazd_autobus_fk
FOREIGN KEY (Nazwa_przystanku)
REFERENCES przystanek (Nazwa_przystanku)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE przystanek_odjazd_tramwaj ADD CONSTRAINT tramwaj_przystanek_odjazd_tramwaj_fk
FOREIGN KEY (Nr_tramwaju)
REFERENCES tramwaj (Nr_tramwaju)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE przystanek_odjazd_autobus ADD CONSTRAINT autobus_przystanek_odjazd_autobus_fk
FOREIGN KEY (Nr_autobusu)
REFERENCES autobus (Nr_autobusu)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;