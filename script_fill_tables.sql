set search_path to zadanie6_11_autobusy ;

insert into autobus (nr_autobusu) values
(101),(102),(103);

insert into tramwaj (nr_tramwaju) values
(1),(2),(3);

insert into przystanek (nazwa_przystanku) values
('Kraków Płaszów'),('Kraków Nowa Huta'),('Kraków Bieżanów'),('Kraków Kurdwanów'),('Kraków Prokocim'),
('Kraków Nowy Kleparz'),('Kraków Krowodrza Górka');

insert into przystanek_odjazd_autobus (nr_autobusu, nazwa_przystanku, czas_odjazdu, kierunek) values
(101,'Kraków Płaszów','5:00','Krowodrza Górka'),(101,'Kraków Płaszów', '7:00','Krowodrza Górka'),(101,'Kraków Płaszów', '9:00','Krowodrza Górka'),(101,'Kraków Płaszów', '11:00','Krowodrza Górka'),
(101,'Kraków Płaszów', '13:00','Krowodrza Górka'),(101,'Kraków Płaszów', '15:00','Krowodrza Górka'),(101,'Kraków Płaszów', '17:00','Krowodrza Górka'),(101,'Kraków Płaszów', '19:00','Krowodrza Górka'),
(101,'Kraków Nowa Huta', '5:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '7:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '9:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '11:30','Krowodrza Górka'),
(101,'Kraków Nowa Huta', '13:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '15:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '17:30','Krowodrza Górka'),(101,'Kraków Nowa Huta', '19:30','Krowodrza Górka'),
(101,'Kraków Krowodrza Górka', '6:00','Płaszów'),(101,'Kraków Krowodrza Górka', '8:00','Płaszów'),(101,'Kraków Krowodrza Górka', '10:00','Płaszów'),(101,'Kraków Krowodrza Górka', '12:00','Płaszów'),
(101,'Kraków Krowodrza Górka', '14:00','Płaszów'),(101,'Kraków Krowodrza Górka', '16:00','Płaszów'),(101,'Kraków Krowodrza Górka', '18:00','Płaszów'),(101,'Kraków Krowodrza Górka', '20:00','Płaszów'),
(101,'Kraków Nowa Huta', '6:30','Płaszów'),(101,'Kraków Nowa Huta', '8:30','Płaszów'),(101,'Kraków Nowa Huta', '10:30','Płaszów'),(101,'Kraków Nowa Huta', '12:30','Płaszów'),
(101,'Kraków Nowa Huta', '14:30','Płaszów'),(101,'Kraków Nowa Huta', '16:30','Płaszów'),(101,'Kraków Nowa Huta', '18:30','Płaszów'),(101,'Kraków Nowa Huta', '20:30','Płaszów'),
(102,'Kraków Kurdwanów','6:00','Prokocim'),(102,'Kraków Kurdwanów','8:00','Prokocim'),(102,'Kraków Kurdwanów','10:00','Prokocim'),(102,'Kraków Kurdwanów','12:00','Prokocim'),
(102,'Kraków Kurdwanów','14:00','Prokocim'),(102,'Kraków Kurdwanów','16:00','Prokocim'),(102,'Kraków Kurdwanów','18:00','Prokocim'),(102,'Kraków Kurdwanów','20:00','Prokocim'),
(102,'Kraków Bieżanów','7:01','Prokocim'),(102,'Kraków Bieżanów','9:01','Prokocim'),(102,'Kraków Bieżanów','11:01','Prokocim'),(102,'Kraków Bieżanów','13:01','Prokocim'),
(102,'Kraków Bieżanów','15:01','Prokocim'),(102,'Kraków Bieżanów','17:01','Prokocim'),(102,'Kraków Bieżanów','19:01','Prokocim'),(102,'Kraków Bieżanów','21:01','Prokocim'),
(102,'Kraków Prokocim','8:00','Kurdwanów'),(102,'Kraków Prokocim','10:00','Kurdwanów'),(102,'Kraków Prokocim','12:00','Kurdwanów'),(102,'Kraków Prokocim','14:00','Kurdwanów'),
(102,'Kraków Prokocim','16:00','Kurdwanów'),(102,'Kraków Prokocim','18:00','Kurdwanów'),(102,'Kraków Prokocim','20:00','Kurdwanów'),(102,'Kraków Prokocim','22:00','Kurdwanów'),
(102,'Kraków Bieżanów','9:00','Kurdwanów'),(102,'Kraków Bieżanów','11:00','Kurdwanów'),(102,'Kraków Bieżanów','13:00','Kurdwanów'),(102,'Kraków Bieżanów','15:00','Kurdwanów'),
(102,'Kraków Bieżanów','17:00','Kurdwanów'),(102,'Kraków Bieżanów','19:00','Kurdwanów'),(102,'Kraków Bieżanów','21:00','Kurdwanów'),(102,'Kraków Bieżanów','23:00','Kurdwanów'),
(103,'Kraków Krowodrza Górka','6:30','Bieżanów'),(103,'Kraków Krowodrza Górka','8:30','Bieżanów'),(103,'Kraków Krowodrza Górka','10:30','Bieżanów'),(103,'Kraków Krowodrza Górka','12:30','Bieżanów'),
(103,'Kraków Krowodrza Górka','14:30','Bieżanów'),(103,'Kraków Krowodrza Górka','16:30','Bieżanów'),(103,'Kraków Krowodrza Górka','18:30','Bieżanów'),(103,'Kraków Krowodrza Górka','20:30','Bieżanów'),
(103,'Kraków Nowy Kleparz','7:30','Bieżanów'),(103,'Kraków Nowy Kleparz','9:30','Bieżanów'),(103,'Kraków Nowy Kleparz','11:31','Bieżanów'),(103,'Kraków Nowy Kleparz','13:31','Bieżanów'),
(103,'Kraków Nowy Kleparz','15:31','Bieżanów'),(103,'Kraków Nowy Kleparz','17:31','Bieżanów'),(103,'Kraków Nowy Kleparz','19:31','Bieżanów'),(103,'Kraków Nowy Kleparz','21:31','Bieżanów'),
(103,'Kraków Bieżanów','9:30','Krowodrza Górka'),(103,'Kraków Bieżanów','11:30','Krowodrza Górka'),(103,'Kraków Bieżanów','13:30','Krowodrza Górka'),(103,'Kraków Bieżanów','15:30','Krowodrza Górka'),
(103,'Kraków Bieżanów','17:30','Krowodrza Górka'),(103,'Kraków Bieżanów','19:30','Krowodrza Górka'),(103,'Kraków Bieżanów','21:30','Krowodrza Górka'),(103,'Kraków Bieżanów','23:30','Krowodrza Górka'),
(103,'Kraków Nowy Kleparz','11:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','13:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','15:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','17:30','Krowodrza Górka'),
(103,'Kraków Nowy Kleparz','19:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','21:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','23:30','Krowodrza Górka'),(103,'Kraków Nowy Kleparz','1:30','Krowodrza Górka');

insert into przystanek_odjazd_tramwaj (nr_tramwaju, nazwa_przystanku, czas_odjazdu, kierunek) values
(1,'Kraków Płaszów','5:00','Krowodrza Górka'),(1,'Kraków Płaszów','7:00','Krowodrza Górka'),(1,'Kraków Płaszów','9:00','Krowodrza Górka'),(1,'Kraków Płaszów','11:00','Krowodrza Górka'),
(1,'Kraków Płaszów','13:00','Krowodrza Górka'),(1,'Kraków Płaszów','15:00','Krowodrza Górka'),(1,'Kraków Płaszów','17:00','Krowodrza Górka'),(1,'Kraków Płaszów','19:00','Krowodrza Górka'),
(1,'Kraków Nowa Huta','5:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','7:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','9:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','11:30','Krowodrza Górka'),
(1,'Kraków Nowa Huta','13:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','15:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','17:30','Krowodrza Górka'),(1,'Kraków Nowa Huta','19:30','Krowodrza Górka'),
(1,'Kraków Krowodrza Górka','6:00','Płaszów'),(1,'Kraków Krowodrza Górka','8:00','Płaszów'),(1,'Kraków Krowodrza Górka','10:00','Płaszów'),(1,'Kraków Krowodrza Górka','12:00','Płaszów'),
(1,'Kraków Krowodrza Górka','14:00','Płaszów'),(1,'Kraków Krowodrza Górka','16:00','Płaszów'),(1,'Kraków Krowodrza Górka','18:00','Płaszów'),(1,'Kraków Krowodrza Górka','20:00','Płaszów'),
(1,'Kraków Nowa Huta','6:30','Płaszów'),(1,'Kraków Nowa Huta','8:30','Płaszów'),(1,'Kraków Nowa Huta','10:30','Płaszów'),(1,'Kraków Nowa Huta','12:30','Płaszów'),
(1,'Kraków Nowa Huta','14:30','Płaszów'),(1,'Kraków Nowa Huta','16:30','Płaszów'),(1,'Kraków Nowa Huta','18:30','Płaszów'),(1,'Kraków Nowa Huta','20:30','Płaszów'),
(2,'Kraków Kurdwanów','6:00','Prokocim'),(2,'Kraków Kurdwanów','8:00','Prokocim'),(2,'Kraków Kurdwanów','10:00','Prokocim'),(2,'Kraków Kurdwanów','12:00','Prokocim'),
(2,'Kraków Kurdwanów','14:00','Prokocim'),(2,'Kraków Kurdwanów','16:00','Prokocim'),(2,'Kraków Kurdwanów','18:00','Prokocim'),(2,'Kraków Kurdwanów','20:00','Prokocim'),
(2,'Kraków Bieżanów','7:01','Prokocim'),(2,'Kraków Bieżanów','9:01','Prokocim'),(2,'Kraków Bieżanów','11:01','Prokocim'),(2,'Kraków Bieżanów','13:01','Prokocim'),
(2,'Kraków Bieżanów','15:01','Prokocim'),(2,'Kraków Bieżanów','17:01','Prokocim'),(2,'Kraków Bieżanów','19:01','Prokocim'),(2,'Kraków Bieżanów','21:01','Prokocim'),
(2,'Kraków Prokocim','8:00','Kurdwanów'),(2,'Kraków Prokocim','10:00','Kurdwanów'),(2,'Kraków Prokocim','12:00','Kurdwanów'),(2,'Kraków Prokocim','14:00','Kurdwanów'),
(2,'Kraków Prokocim','16:00','Kurdwanów'),(2,'Kraków Prokocim','18:00','Kurdwanów'),(2,'Kraków Prokocim','20:00','Kurdwanów'),(2,'Kraków Prokocim','22:00','Kurdwanów'),
(2,'Kraków Bieżanów','9:00','Kurdwanów'),(2,'Kraków Bieżanów','11:00','Kurdwanów'),(2,'Kraków Bieżanów','13:00','Kurdwanów'),(2,'Kraków Bieżanów','15:00','Kurdwanów'),
(2,'Kraków Bieżanów','17:00','Kurdwanów'),(2,'Kraków Bieżanów','19:00','Kurdwanów'),(2,'Kraków Bieżanów','21:00','Kurdwanów'),(2,'Kraków Bieżanów','23:00','Kurdwanów'),
(3,'Kraków Krowodrza Górka','6:30','Bieżanów'),(3,'Kraków Krowodrza Górka','8:30','Bieżanów'),(3,'Kraków Krowodrza Górka','10:30','Bieżanów'),(3,'Kraków Krowodrza Górka','12:30','Bieżanów'),
(3,'Kraków Krowodrza Górka','14:30','Bieżanów'),(3,'Kraków Krowodrza Górka','16:30','Bieżanów'),(3,'Kraków Krowodrza Górka','18:30','Bieżanów'),(3,'Kraków Krowodrza Górka','20:30','Bieżanów'),
(3,'Kraków Nowy Kleparz','7:31','Bieżanów'),(3,'Kraków Nowy Kleparz','9:31','Bieżanów'),(3,'Kraków Nowy Kleparz','11:31','Bieżanów'),(3,'Kraków Nowy Kleparz','13:31','Bieżanów'),
(3,'Kraków Nowy Kleparz','15:31','Bieżanów'),(3,'Kraków Nowy Kleparz','17:31','Bieżanów'),(3,'Kraków Nowy Kleparz','19:31','Bieżanów'),(3,'Kraków Nowy Kleparz','21:31','Bieżanów'),
(3,'Kraków Bieżanów','9:30','Krowodrza Górka'),(3,'Kraków Bieżanów','11:30','Krowodrza Górka'),(3,'Kraków Bieżanów','13:30','Krowodrza Górka'),(3,'Kraków Bieżanów','15:30','Krowodrza Górka'),
(3,'Kraków Bieżanów','17:30','Krowodrza Górka'),(3,'Kraków Bieżanów','19:30','Krowodrza Górka'),(3,'Kraków Bieżanów','21:30','Krowodrza Górka'),(3,'Kraków Bieżanów','23:30','Krowodrza Górka'),
(3,'Kraków Nowy Kleparz','11:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','13:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','15:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','17:30','Krowodrza Górka'),
(3,'Kraków Nowy Kleparz','19:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','21:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','23:30','Krowodrza Górka'),(3,'Kraków Nowy Kleparz','1:30','Krowodrza Górka');