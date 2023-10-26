set search_path to zadanie6_11_autobusy ;

insert into autobus (nr_autobusu) values
(101),(102),(103);

insert into tramwaj (nr_tramwaju) values
(1),(2),(3);

insert into przystanek (nazwa_przystanku) values
('Kraków Płaszów'),('Kraków Nowa Huta'),('Kraków Bieżanów'),('Kraków Kurdwanów'),('Kraków Prokocim'),
('Kraków Nowy Kleparz'),('Kraków Krowodrza Górka');

insert into przystanek_odjazd_autobus (nr_autobusu, nazwa_przystanku, czas_odjazdu) values
(101,'Kraków Płaszów','5:00'),(101,'Kraków Płaszów', '7:00'),(101,'Kraków Płaszów', '9:00'),(101,'Kraków Płaszów', '11:00'),
(101,'Kraków Płaszów', '13:00'),(101,'Kraków Płaszów', '15:00'),(101,'Kraków Płaszów', '17:00'),(101,'Kraków Płaszów', '19:00'),
(101,'Kraków Nowa Huta', '5:30'),(101,'Kraków Nowa Huta', '7:30'),(101,'Kraków Nowa Huta', '9:30'),(101,'Kraków Nowa Huta', '11:30'),
(101,'Kraków Nowa Huta', '13:30'),(101,'Kraków Nowa Huta', '15:30'),(101,'Kraków Nowa Huta', '17:30'),(101,'Kraków Nowa Huta', '19:30'),
(101,'Kraków Krowodrza Górka', '6:00'),(101,'Kraków Krowodrza Górka', '8:00'),(101,'Kraków Krowodrza Górka', '10:00'),(101,'Kraków Krowodrza Górka', '12:00'),
(101,'Kraków Krowodrza Górka', '14:00'),(101,'Kraków Krowodrza Górka', '16:00'),(101,'Kraków Krowodrza Górka', '18:00'),(101,'Kraków Krowodrza Górka', '20:00'),
(102,'Kraków Kurdwanów','6:00'),(102,'Kraków Kurdwanów','8:00'),(102,'Kraków Kurdwanów','10:00'),(102,'Kraków Kurdwanów','12:00'),
(102,'Kraków Kurdwanów','14:00'),(102,'Kraków Kurdwanów','16:00'),(102,'Kraków Kurdwanów','18:00'),(102,'Kraków Kurdwanów','20:00'),
(102,'Kraków Bieżanów','7:00'),(102,'Kraków Bieżanów','9:00'),(102,'Kraków Bieżanów','11:00'),(102,'Kraków Bieżanów','13:00'),
(102,'Kraków Bieżanów','15:00'),(102,'Kraków Bieżanów','17:00'),(102,'Kraków Bieżanów','19:00'),(102,'Kraków Bieżanów','21:00'),
(102,'Kraków Prokocim','8:00'),(102,'Kraków Prokocim','10:00'),(102,'Kraków Prokocim','12:00'),(102,'Kraków Prokocim','14:00'),
(102,'Kraków Prokocim','16:00'),(102,'Kraków Prokocim','18:00'),(102,'Kraków Prokocim','20:00'),(102,'Kraków Prokocim','22:00'),
(103,'Kraków Krowodrza Górka','6:30'),(103,'Kraków Krowodrza Górka','8:30'),(103,'Kraków Krowodrza Górka','10:30'),(103,'Kraków Krowodrza Górka','12:30'),
(103,'Kraków Krowodrza Górka','14:30'),(103,'Kraków Krowodrza Górka','16:30'),(103,'Kraków Krowodrza Górka','18:30'),(103,'Kraków Krowodrza Górka','20:30'),
(103,'Kraków Nowy Kleparz','7:30'),(103,'Kraków Nowy Kleparz','9:30'),(103,'Kraków Nowy Kleparz','11:30'),(103,'Kraków Nowy Kleparz','13:30'),
(103,'Kraków Nowy Kleparz','15:30'),(103,'Kraków Nowy Kleparz','17:30'),(103,'Kraków Nowy Kleparz','19:30'),(103,'Kraków Nowy Kleparz','21:30'),
(103,'Kraków Bieżanów','9:30'),(103,'Kraków Bieżanów','11:30'),(103,'Kraków Bieżanów','13:30'),(103,'Kraków Bieżanów','15:30'),
(103,'Kraków Bieżanów','17:30'),(103,'Kraków Bieżanów','19:30'),(103,'Kraków Bieżanów','21:30'),(103,'Kraków Bieżanów','23:30');

insert into przystanek_odjazd_tramwaj (nr_tramwaju, nazwa_przystanku, czas_odjazdu) values
(1,'Kraków Płaszów','5:00'),(1,'Kraków Płaszów', '5:30'),(1,'Kraków Płaszów', '6:00'),(1,'Kraków Płaszów', '6:30'),
(1,'Kraków Płaszów', '7:00'),(1,'Kraków Płaszów', '7:30'),(1,'Kraków Płaszów', '8:00'),(1,'Kraków Płaszów', '8:30'),
(1,'Kraków Nowa Huta', '5:30'),(1,'Kraków Nowa Huta', '6:00'),(1,'Kraków Nowa Huta', '6:30'),(1,'Kraków Nowa Huta', '7:00'),
(1,'Kraków Nowa Huta', '7:30'),(1,'Kraków Nowa Huta', '8:00'),(1,'Kraków Nowa Huta', '8:30'),(1,'Kraków Nowa Huta', '9:00'),
(1,'Kraków Krowodrza Górka', '6:00'),(1,'Kraków Krowodrza Górka', '6:30'),(1,'Kraków Krowodrza Górka', '7:00'),(1,'Kraków Krowodrza Górka', '7:30'),
(1,'Kraków Krowodrza Górka', '8:00'),(1,'Kraków Krowodrza Górka', '8:30'),(1,'Kraków Krowodrza Górka', '9:00'),(1,'Kraków Krowodrza Górka', '9:30'),
(2,'Kraków Kurdwanów','6:00'),(2,'Kraków Kurdwanów','6:30'),(2,'Kraków Kurdwanów','7:00'),(2,'Kraków Kurdwanów','7:30'),
(2,'Kraków Kurdwanów','8:00'),(2,'Kraków Kurdwanów','8:30'),(2,'Kraków Kurdwanów','9:00'),(2,'Kraków Kurdwanów','9:30'),
(2,'Kraków Bieżanów','6:30'),(2,'Kraków Bieżanów','7:00'),(2,'Kraków Bieżanów','7:30'),(2,'Kraków Bieżanów','8:00'),
(2,'Kraków Bieżanów','8:30'),(2,'Kraków Bieżanów','9:00'),(2,'Kraków Bieżanów','9:30'),(2,'Kraków Bieżanów','10:00'),
(2,'Kraków Prokocim','7:00'),(2,'Kraków Prokocim','7:30'),(2,'Kraków Prokocim','8:00'),(2,'Kraków Prokocim','8:30'),
(2,'Kraków Prokocim','9:00'),(2,'Kraków Prokocim','9:30'),(2,'Kraków Prokocim','10:00'),(2,'Kraków Prokocim','10:30'),
(3,'Kraków Krowodrza Górka','6:30'),(3,'Kraków Krowodrza Górka','7:00'),(3,'Kraków Krowodrza Górka','7:30'),(3,'Kraków Krowodrza Górka','8:00'),
(3,'Kraków Krowodrza Górka','8:30'),(3,'Kraków Krowodrza Górka','9:00'),(3,'Kraków Krowodrza Górka','9:30'),(3,'Kraków Krowodrza Górka','10:00'),
(3,'Kraków Nowy Kleparz','7:30'),(3,'Kraków Nowy Kleparz','8:00'),(3,'Kraków Nowy Kleparz','8:30'),(3,'Kraków Nowy Kleparz','9:00'),
(3,'Kraków Nowy Kleparz','9:30'),(3,'Kraków Nowy Kleparz','10:00'),(3,'Kraków Nowy Kleparz','10:30'),(3,'Kraków Nowy Kleparz','11:00'),
(3,'Kraków Bieżanów','8:00'),(3,'Kraków Bieżanów','8:30'),(3,'Kraków Bieżanów','9:00'),(3,'Kraków Bieżanów','9:30'),
(3,'Kraków Bieżanów','10:00'),(3,'Kraków Bieżanów','10:30'),(3,'Kraków Bieżanów','11:00'),(3,'Kraków Bieżanów','11:30');