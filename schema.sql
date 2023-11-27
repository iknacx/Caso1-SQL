CREATE TABLE Agente
(
  codigo_especial INT NOT NULL,
  RUT INT NOT NULL,
  a_paterno INT NOT NULL,
  a_materno INT NOT NULL,
  nombre INT NOT NULL,
  PRIMARY KEY (codigo_especial)
);

CREATE TABLE Cliente
(
  sexo INT NOT NULL,
  RUT INT NOT NULL,
  nombre INT NOT NULL,
  calle INT NOT NULL,
  comuna INT NOT NULL,
  numero INT NOT NULL,
  PRIMARY KEY (RUT)
);

CREATE TABLE Autorizado
(
  RUT INT NOT NULL,
  PRIMARY KEY (RUT),
  FOREIGN KEY (RUT) REFERENCES Cliente(RUT)
);

CREATE TABLE No_autorizado
(
  RUT INT NOT NULL,
  PRIMARY KEY (RUT),
  FOREIGN KEY (RUT) REFERENCES Cliente(RUT)
);

CREATE TABLE Historial
(
  id_historial INT NOT NULL,
  RUT INT NOT NULL,
  PRIMARY KEY (id_historial),
  FOREIGN KEY (RUT) REFERENCES Autorizado(RUT)
);

CREATE TABLE Taller
(
  ubicacion INT NOT NULL,
  PRIMARY KEY (ubicacion)
);

CREATE TABLE Tipo_a
(
  ubicacion INT NOT NULL,
  PRIMARY KEY (ubicacion),
  FOREIGN KEY (ubicacion) REFERENCES Taller(ubicacion)
);

CREATE TABLE Tipo_b
(
  ubicacion INT NOT NULL,
  PRIMARY KEY (ubicacion),
  FOREIGN KEY (ubicacion) REFERENCES Taller(ubicacion)
);

CREATE TABLE Tipo_c
(
  ubicacion INT NOT NULL,
  PRIMARY KEY (ubicacion),
  FOREIGN KEY (ubicacion) REFERENCES Taller(ubicacion)
);

CREATE TABLE Agente_telefono
(
  telefono INT NOT NULL,
  codigo_especial INT NOT NULL,
  PRIMARY KEY (telefono, codigo_especial),
  FOREIGN KEY (codigo_especial) REFERENCES Agente(codigo_especial)
);

CREATE TABLE Cliente_telefono
(
  telefono INT NOT NULL,
  RUT INT NOT NULL,
  PRIMARY KEY (telefono, RUT),
  FOREIGN KEY (RUT) REFERENCES Cliente(RUT)
);

CREATE TABLE Poliza
(
  num_poliza INT NOT NULL,
  monto_cobertura_max INT NOT NULL,
  codigo_especial INT NOT NULL,
  RUT INT NOT NULL,
  PRIMARY KEY (num_poliza),
  FOREIGN KEY (codigo_especial) REFERENCES Agente(codigo_especial),
  FOREIGN KEY (RUT) REFERENCES Autorizado(RUT)
);

CREATE TABLE Seguro
(
  monto_cobertura INT NOT NULL,
  id_seguro INT NOT NULL,
  tipo INT NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (id_seguro),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);

CREATE TABLE Vehiculo
(
  num_chasis INT NOT NULL,
  patente INT NOT NULL,
  descripción INT NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);

CREATE TABLE extras
(
  nombre INT NOT NULL,
  id_extra INT NOT NULL,
  num_chasis INT NOT NULL,
  PRIMARY KEY (id_extra, num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis)
);

CREATE TABLE Menos_2y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion) REFERENCES Tipo_a(ubicacion)
);

CREATE TABLE Menos_5y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion) REFERENCES Tipo_b(ubicacion)
);

CREATE TABLE Mas_igual_5y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion) REFERENCES Tipo_c(ubicacion)
);

CREATE TABLE Siniestro
(
  tipo INT NOT NULL,
  id_siniestro INT NOT NULL,
  info_accidente INT NOT NULL,
  fecha_reparacion INT NOT NULL,
  fecha_siniestro INT NOT NULL,
  monto_reparacion INT NOT NULL,
  RUT INT NOT NULL,
  id_historial INT NOT NULL,
  PRIMARY KEY (id_siniestro),
  FOREIGN KEY (RUT) REFERENCES Autorizado(RUT),
  FOREIGN KEY (id_historial) REFERENCES Historial(id_historial)
);
