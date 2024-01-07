set search_path to szlaki_gorskie;
INSERT INTO Szczyt (nazwa, wysokosc_wzgledna, wysokosc_bezwzgledna) VALUES
('Szczyt 1', 1000, 2000),
('Szczyt 2', 1500, 2500),
('Szczyt 3', 2000, 3000);

INSERT INTO Schronisko (opis, typ, wysokosc_wzgledna, wysokosc_bezwzgledna) VALUES
('Schronisko 1', 'Typ 1', 500, 1500),
('Schronisko 2', 'Typ 2', 1000, 2000),
('Schronisko 3', 'Typ 3', 1500, 2500);

INSERT INTO Wejscie (miejsce, wysokosc_wzgledna, wysokosc_bezwzgledna) VALUES
('Wejscie 1', 0, 1000),
('Wejscie 2', 500, 1500),
('Wejscie 3', 1000, 2000);

INSERT INTO Szlak (punkt_startowy, punkt_koncowy, kolor, czas_wejscia, czas_zejscia) VALUES
(1, 2, 'Czerwony', '02:00:00', '01:30:00'),
(2, 3, 'Niebieski', '03:00:00', '02:30:00'),
(3, 1, 'Zielony', '04:00:00', '03:30:00');