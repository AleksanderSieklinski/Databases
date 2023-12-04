CREATE SCHEMA IF NOT EXISTS szlaki_gorskie;
set search_path to szlaki_gorskie;

CREATE TABLE Szczyt (
    id_szczytu SERIAL PRIMARY KEY,
    nazwa VARCHAR(100) NOT NULL,
    wysokosc_wzgledna INTEGER NOT NULL,
    wysokosc_bezwzgledna INTEGER NOT NULL
);

CREATE TABLE Schronisko (
    id_schroniska SERIAL PRIMARY KEY,
    opis TEXT,
    typ VARCHAR(100) NOT NULL,
    wysokosc_wzgledna INTEGER NOT NULL,
    wysokosc_bezwzgledna INTEGER NOT NULL
);

CREATE TABLE Wejscie (
    id_wejscia SERIAL PRIMARY KEY,
    miejsce VARCHAR(100) NOT NULL,
    wysokosc_wzgledna INTEGER NOT NULL,
    wysokosc_bezwzgledna INTEGER NOT NULL
);

CREATE TABLE Szlak (
    id_szlaku SERIAL PRIMARY KEY,
    punkt_startowy INTEGER NOT NULL,
    punkt_koncowy INTEGER NOT NULL,
    kolor VARCHAR(50) NOT NULL,
    czas_wejscia TIME NOT NULL,
    czas_zejscia TIME NOT NULL,
    FOREIGN KEY (punkt_startowy) REFERENCES Wejscie(id_wejscia),
    FOREIGN KEY (punkt_koncowy) REFERENCES Wejscie(id_wejscia)
);