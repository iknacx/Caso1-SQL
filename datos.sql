USE caso1;

-- Taller
INSERT INTO Taller (id_taller, comuna, calle, numero)
VALUES
  (1, "Providencia", "Manuel Montt", 1632),
  (2, "Macul", "Av. Marathon", 5300),
  (3, "Pudahuel", "San Pablo", 8420),
  (4, "Providencia", "Av. Andres Bello", 1670),
  (5, "La Florida", "Av. Vicuña Mackenna", 7221);

INSERT INTO Tipo_a (id_taller)
VALUES (1), (2);

INSERT INTO Tipo_b (id_taller)
VALUES (3);

INSERT INTO Tipo_c (id_taller)
VALUES (4), (5);

-- Persona
INSERT INTO Persona (rut_persona, fecha_nacimiento, comuna, calle, numero, a_paterno, a_materno, nombre)
VALUES
  ("13076213-9", "1978-06-21", "Pudahuel", "Av. El Canal", 19827, "Gonzalez", "Vidal", "Alejandro"),
  ("18329537-2", "1989-11-05", "Providencia", "Antonio Varas", 9483, "Rossel", "Pinto", "Agustin"),
  ("9322564-K", "1968-12-30", "Macul", "Castillo Urizar", 3910, "Rozas", "Abarca", "Fabian"),
  ("14321546-1", "1980-01-04", "La Florida", "Costa Rica", 22, "Miranda", "Sanchez", "Bastian"),
  ("20327539-7", "2000-10-10", "Las Condes", "Av. El Golf", 2049, "Ibarra", "Rodriguez", "Daniela");

-- Agente
INSERT INTO Agente (rut_agente, codigo_especial)
VALUES ("13076213-9", 2441), ("20327539-7", 4124);

INSERT INTO Agente_correo (codigo_especial, correo)
VALUES
  (2441, "a.vidalgonzalez@gmail.com"),
  (2441, "alejandro.vg@hotmail.com"),
  (4124, "danielaibarra.r@gmail.com");

-- Cliente
INSERT INTO Cliente (rut_cliente)
VALUES ("18329537-2"), ("9322564-K"), ("14321546-1");

INSERT INTO Cliente_telefono (rut_cliente, telefono)
VALUES
  ("18329537-2", 994275821),
  ("18329537-2", 939529683),

  ("9322564-K", 912529506),
  ("9322564-K", 943859632),
  ("9322564-K", 942954583),

  ("14321546-1", 945318953),
  ("14321546-1", 919550333),
  ("14321546-1", 955964381),
  ("14321546-1", 949640234);

INSERT INTO Autorizado (rut_autorizado)
VALUES ("18329537-2"), ("9322564-K");

INSERT INTO No_autorizado (rut_no_autorizado)
VALUES ("14321546-1");

-- Vehiculo
INSERT INTO Vehiculo (num_chasis, patente, descripcion, rut_persona)
VALUES
  ("1GNCS13Z6M0246591", "HDKJ25", "Color Rojo, Marca Toyota con 4 asientos, año 2015", "18329537-2"),
  ("3CMLA42Z3B3453212", "XD1024", "Color Negro, Marca Nissan con 6 asientos, año 2017", "9322564-K"),
  ("5TLMJ531CA6395212", "JEJE69", "Color Blanco, Marca Audi con 2 asientos, año 2012", "18329537-2"),
  ("0ANMS59A4C5391245", "ML4312", "Color Blanco, Marca Chevrolet con 4 asientos, año 2019", "18329537-2"),
  ("2BJED43C4H1342358", "XDAO31", "Color Gris, Marca Tesla con 4 asientos, año 2022", "14321546-1");

INSERT INTO Extras (id_extra, nombre, num_chasis)
VALUES
  (1, "Airbag", "1GNCS13Z6M0246591"),
  (2, "GPS", "1GNCS13Z6M0246591"),
  (1, "Airbag", "5TLMJ531CA6395212"),
  (1, "Airbag", "0ANMS59A4C5391245");

INSERT INTO Menos_2y_antiguedad (num_chasis, id_taller)
VALUES ("1GNCS13Z6M0246591", 1), ("5TLMJ531CA6395212", 2);

INSERT INTO Menos_5y_antiguedad (num_chasis, id_taller)
VALUES ("3CMLA42Z3B3453212", 3);

INSERT INTO Mas_igual_5y_antiguedad (num_chasis, id_taller)
VALUES ("0ANMS59A4C5391245", 4);

-- Poliza
INSERT INTO Poliza (num_poliza, num_chasis, monto_cobertura_max, rut_autorizado, codigo_especial)
VALUES
  (1, "1GNCS13Z6M0246591", 1250000, "18329537-2", 2441),
  (2, "3CMLA42Z3B3453212", 2480000, "9322564-K", 4124),
  (3, "5TLMJ531CA6395212", 3000000, "18329537-2", 4124),
  (4, "0ANMS59A4C5391245", 5750000, "18329537-2", 4124);

-- Seguro
INSERT INTO Seguro (id_seguro, monto_cobertura, tipo, num_poliza)
VALUES
  (1, 1849000, "Todo Riesgo", 2),
  (2, 900000, "Terceros", 1),
  (3, 2000000, "Todo Riesgo", 3),
  (4, 4800000, "Todo Riesgo", 4),
  (5, 100000, "Todo Riesgo", 1);

-- Siniestro
INSERT INTO Siniestro (id_siniestro, tipo, info_accidente, fecha_reparacion, fecha_siniestro, monto_reparacion, rut_autorizado, id_taller, num_poliza)
VALUES
  (1, "Choque", "Choque contra vehiculo",                 "2019-11-23", "2019-11-10", 4390000, "18329537-2", 1, 1),
  (2, "Robo",   "Robo de vehiculo sin daños posteriores", "2022-09-11", "2022-09-02", 200000,  "18329537-2", 2, 4),
  (3, "Choque", "Choque contra muro",                     "2023-01-05", "2022-12-27", 1840000, "9322564-K",  3, 2),
  (4, "Choque", "Choque contra vehiculo",                 "2018-06-29", "2018-06-15", 7543000, "18329537-2", 4, 3),
  (5, "Robo",   "Robo de vehiculo con daños posteriores", "2021-03-17", "2021-02-27", 1200000, "9322564-K",  3, 2);
