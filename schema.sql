DROP DATABASE IF EXISTS caso1;
CREATE DATABASE caso1;
USE caso1;

CREATE TABLE Taller
(
  comuna VARCHAR(32) NOT NULL,
  calle VARCHAR(32) NOT NULL,
  numero INT NOT NULL,
  id_taller INT NOT NULL,
  PRIMARY KEY (id_taller)
);

CREATE TABLE Tipo_a
(
  id_taller INT NOT NULL,
  PRIMARY KEY (id_taller),
  FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

CREATE TABLE Tipo_b
(
  id_taller INT NOT NULL,
  PRIMARY KEY (id_taller),
  FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

CREATE TABLE Tipo_c
(
  id_taller INT NOT NULL,
  PRIMARY KEY (id_taller),
  FOREIGN KEY (id_taller) REFERENCES Taller(id_taller)
);

CREATE TABLE Persona
(
  rut_persona VARCHAR(16) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  comuna VARCHAR(32) NOT NULL,
  calle VARCHAR(32) NOT NULL,
  numero INT NOT NULL,
  a_paterno VARCHAR(32) NOT NULL,
  a_materno VARCHAR(32) NOT NULL,
  nombre VARCHAR(32) NOT NULL,
  PRIMARY KEY (rut_persona)
);

CREATE TABLE Agente
(
  codigo_especial INT NOT NULL,
  rut_agente VARCHAR(16) NOT NULL,
  PRIMARY KEY (codigo_especial),
  FOREIGN KEY (rut_agente) REFERENCES Persona(rut_persona)
);

CREATE TABLE Cliente
(
  rut_cliente VARCHAR(16) NOT NULL,
  PRIMARY KEY (rut_cliente),
  FOREIGN KEY (rut_cliente) REFERENCES Persona(rut_persona)
);

CREATE TABLE No_autorizado
(
  rut_no_autorizado VARCHAR(16) NOT NULL,
  PRIMARY KEY (rut_no_autorizado),
  FOREIGN KEY (rut_no_autorizado) REFERENCES Cliente(rut_cliente)
);

CREATE TABLE Autorizado
(
  rut_autorizado VARCHAR(16) NOT NULL,
  PRIMARY KEY (rut_autorizado),
  FOREIGN KEY (rut_autorizado) REFERENCES Cliente(rut_cliente)
);

CREATE TABLE Cliente_telefono
(
  telefono INT NOT NULL,
  rut_cliente VARCHAR(16) NOT NULL,
  PRIMARY KEY (telefono, rut_cliente),
  FOREIGN KEY (rut_cliente) REFERENCES Cliente(rut_cliente)
);

CREATE TABLE Agente_correo
(
  correo VARCHAR(64) NOT NULL,
  codigo_especial INT NOT NULL,
  PRIMARY KEY (correo, codigo_especial),
  FOREIGN KEY (codigo_especial) REFERENCES Agente(codigo_especial)
);

CREATE TABLE Vehiculo
(
  num_chasis VARCHAR(32) NOT NULL,
  patente VARCHAR(8) NOT NULL,
  descripcion VARCHAR(512) NOT NULL,
  rut_persona VARCHAR(16) NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (rut_persona) REFERENCES Persona(rut_persona)
);

CREATE TABLE Extras
(
  nombre VARCHAR(32) NOT NULL,
  id_extra INT NOT NULL,
  num_chasis VARCHAR(32) NOT NULL,
  PRIMARY KEY (id_extra, num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis)
);

CREATE TABLE Menos_2y_antiguedad
(
  num_chasis VARCHAR(32) NOT NULL,
  id_taller INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (id_taller) REFERENCES Tipo_a(id_taller)
);

CREATE TABLE Menos_5y_antiguedad
(
  num_chasis VARCHAR(32) NOT NULL,
  id_taller INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (id_taller) REFERENCES Tipo_b(id_taller)
);

CREATE TABLE Mas_igual_5y_antiguedad
(
  num_chasis VARCHAR(32) NOT NULL,
  id_taller INT NOT NULL,
  PRIMARY KEY (num_chasis),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (id_taller) REFERENCES Tipo_c(id_taller)
);

CREATE TABLE Poliza
(
  num_poliza INT NOT NULL,
  monto_cobertura_max INT NOT NULL,
  rut_autorizado VARCHAR(16) NOT NULL,
  num_chasis VARCHAR(32) NOT NULL,
  codigo_especial INT NOT NULL,
  PRIMARY KEY (num_poliza),
  FOREIGN KEY (rut_autorizado) REFERENCES Autorizado(rut_autorizado),
  FOREIGN KEY (num_chasis) REFERENCES Vehiculo(num_chasis),
  FOREIGN KEY (codigo_especial) REFERENCES Agente(codigo_especial)
);

CREATE TABLE Seguro
(
  monto_cobertura INT NOT NULL,
  id_seguro INT NOT NULL,
  tipo VARCHAR(128) NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (id_seguro),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);

CREATE TABLE Siniestro
(
  tipo VARCHAR(128) NOT NULL,
  id_siniestro INT NOT NULL,
  info_accidente VARCHAR(512) NOT NULL,
  fecha_reparacion DATE NOT NULL,
  fecha_siniestro DATE NOT NULL,
  monto_reparacion INT NOT NULL,
  rut_autorizado VARCHAR(16) NOT NULL,
  id_taller INT NOT NULL,
  num_poliza INT NOT NULL,
  PRIMARY KEY (id_siniestro),
  FOREIGN KEY (rut_autorizado) REFERENCES Autorizado(rut_autorizado),
  FOREIGN KEY (id_taller) REFERENCES Taller(id_taller),
  FOREIGN KEY (num_poliza) REFERENCES Poliza(num_poliza)
);
