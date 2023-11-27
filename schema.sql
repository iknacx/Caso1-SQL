CREATE TABLE Taller
(
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (ubicacion_taller)
);

CREATE TABLE Tipo_a
(
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (ubicacion_taller),
  FOREIGN KEY (ubicacion_taller) REFERENCES Taller(ubicacion_taller)
);

CREATE TABLE Tipo_b
(
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (ubicacion_taller),
  FOREIGN KEY (ubicacion_taller) REFERENCES Taller(ubicacion_taller)
);

CREATE TABLE Tipo_c
(
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (ubicacion_taller),
  FOREIGN KEY (ubicacion_taller) REFERENCES Taller(ubicacion_taller)
);

CREATE TABLE Persona
(
  RUN INT NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  comuna VARCHAR(32) NOT NULL,
  calle VARCHAR(32) NOT NULL,
  numero INT NOT NULL,
  a_paterno VARCHAR(32) NOT NULL,
  a_materno VARCHAR(32) NOT NULL,
  nombre VARCHAR(32) NOT NULL,
  PRIMARY KEY (RUN)
);

CREATE TABLE Agente
(
  codigo_especial INT NOT NULL,
  RUN INT NOT NULL,
  PRIMARY KEY (codigo_especial),
  FOREIGN KEY (RUN) REFERENCES Persona(RUN)
);

CREATE TABLE Cliente
(
  RUN INT NOT NULL,
  PRIMARY KEY (RUN),
  FOREIGN KEY (RUN) REFERENCES Persona(RUN)
);

CREATE TABLE No_autorizado
(
  RUN INT NOT NULL,
  PRIMARY KEY (RUN),
  FOREIGN KEY (RUN) REFERENCES Cliente(RUN)
);

CREATE TABLE Autorizado
(
  RUN INT NOT NULL,
  PRIMARY KEY (RUN),
  FOREIGN KEY (RUN) REFERENCES Cliente(RUN)
);

CREATE TABLE Cliente_telefono
(
  telefono INT NOT NULL,
  RUN INT NOT NULL,
  PRIMARY KEY (telefono, RUN),
  FOREIGN KEY (RUN) REFERENCES Cliente(RUN)
);

CREATE TABLE Poliza
(
  num_poliza INT NOT NULL,
  monto_cobertura_max INT NOT NULL,
  RUN_cliente INT NOT NULL,
  codigo_especial INT NOT NULL,
  PRIMARY KEY (num_poliza),
  FOREIGN KEY (RUN_cliente) REFERENCES Autorizado(RUN),
  FOREIGN KEY (codigo_especial) REFERENCES Agente(codigo_especial)
);

CREATE TABLE Seguro
(
  monto_cobertura INT NOT NULL,
  id_seguro INT NOT NULL,
  tipo VARCHAR(32) NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (id_seguro),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);

CREATE TABLE Vehiculo
(
  num_chasis INT NOT NULL,
  patente INT NOT NULL,
  descripción VARCHAR(512) NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);

CREATE TABLE Extras
(
  nombre VARCHAR(32) NOT NULL,
  id_extra INT NOT NULL,
  num_chasis INT NOT NULL,
  PRIMARY KEY (id_extra, num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis)
);

CREATE TABLE Menos_2y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion_taller) REFERENCES Tipo_a(ubicacion_taller)
);

CREATE TABLE Menos_5y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion_taller) REFERENCES Tipo_b(ubicacion_taller)
);

CREATE TABLE Mas_igual_5y_antiguedad
(
  num_chasis INT NOT NULL,
  ubicacion_taller VARCHAR(256) NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (ubicacion_taller) REFERENCES Tipo_c(ubicacion_taller)
);

CREATE TABLE Historial
(
  id_historial INT NOT NULL,
  RUN INT NOT NULL,
  PRIMARY KEY (id_historial),
  FOREIGN KEY (RUN) REFERENCES Autorizado(RUN)
);

CREATE TABLE Siniestro
(
  tipo VARCHAR(32) NOT NULL,
  id_siniestro INT NOT NULL,
  info_accidente VARCHAR(512) NOT NULL,
  fecha_reparacion DATE NOT NULL,
  fecha_siniestro DATE NOT NULL,
  monto_reparacion INT NOT NULL,
  RUN INT NOT NULL,
  id_historial INT NOT NULL,
  ubicacion_taller VARCHAR(256) NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (id_siniestro),
  FOREIGN KEY (RUN) REFERENCES Autorizado(RUN),
  FOREIGN KEY (id_historial) REFERENCES Historial(id_historial),
  FOREIGN KEY (ubicacion_taller) REFERENCES Taller(ubicacion_taller),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);
