create schema zadanie27_11_drzewo_genealogiczne;
set search_path to zadanie27_11_drzewo_genealogiczne;

CREATE TABLE Osoba (
    ID SERIAL PRIMARY KEY,
    Imię VARCHAR(50),
    Nazwisko VARCHAR(50),
    Data_urodzenia DATE,
    Miejsce_urodzenia VARCHAR(100),
    Data_zgonu DATE
);

CREATE TABLE Małżeństwo (
    ID SERIAL PRIMARY KEY,
    ID_Męża INT,
    ID_Żony INT,
    Data_ślubu DATE,
    FOREIGN KEY (ID_Męża) REFERENCES Osoba(ID),
    FOREIGN KEY (ID_Żony) REFERENCES Osoba(ID)
);

CREATE TABLE Pokrewieństwo (
    ID SERIAL PRIMARY KEY,
    ID_osoby INT,
    ID_rodzica INT,
    ID_małżeństwa INT,
    FOREIGN KEY (ID_osoby) REFERENCES Osoba(ID),
    FOREIGN KEY (ID_rodzica) REFERENCES Osoba(ID),
    FOREIGN KEY (ID_małżeństwa) REFERENCES Małżeństwo(ID)
);