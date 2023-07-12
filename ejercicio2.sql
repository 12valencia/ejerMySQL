CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE editorial (
	cod_editorial INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
     editorial VARCHAR(100)
);

CREATE TABLE pais (
	cod_pais INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(100)
);

CREATE TABLE tipoLibro (
	cod_tipoLibro INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipoLibro VARCHAR(100)
);

CREATE TABLE libro (
	cod_libro INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(50),
    titulo VARCHAR(100),
    cod_editorial INT(4) NOT NULL,
    cod_pais INT(4) NOT NULL,
    cod_tipoLibro INT(4) NOT NULL,
    fechalanzamiento INT(4),
     edicion VARCHAR(100),
     
     FOREIGN KEY (cod_editorial) REFERENCES editorial(cod_editorial),
     FOREIGN KEY (cod_pais) REFERENCES pais(cod_pais),
     FOREIGN KEY (cod_tipoLibro) REFERENCES tipoLibro(cod_tipoLibro)
);

CREATE TABLE area (
	cod_area INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	area VARCHAR(100)
);

CREATE TABLE librosPorArea (
 	cod_libro INT(4) NOT NULL,
    cod_area INT(4),

	FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro),
	FOREIGN KEY (cod_area) REFERENCES area(cod_area)
);

CREATE TABLE autor (
	cod_autor INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	autor VARCHAR(150)
);

CREATE TABLE librosPorAutor (
	cod_libro INT(4) NOT NULL,
    cod_autor INT(4) NOT NULL,
     
    FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro),
    FOREIGN KEY (cod_autor) REFERENCES autor(cod_autor)
);

CREATE TABLE librosPorExistencia (
	cod_existencia INT(7) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_libro INT(4) NOT NULL,
    
    FOREIGN KEY (cod_libro) REFERENCES libro(cod_libro)
);

CREATE TABLE estado (
 	cod_estado INT(1) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estado VARCHAR(25)
);

CREATE TABLE estadoPorExistencia (
	cod_existencia INT(7) NOT NULL,
    cod_estado INT(1) NOT NULL, 
    
    FOREIGN KEY (cod_existencia) REFERENCES librosPorExistencia(cod_existencia),
    FOREIGN KEY (cod_estado) REFERENCES estado(cod_estado)
);

CREATE TABLE afiliado (
	cod_afiliado INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(200),
    apellido1 VARCHAR(150),
    apellido2 VARCHAR(150),
    documento VARCHAR(200),
    fechaNacimiento VARCHAR(10),
    telefono VARCHAR(25),
    direccion VARCHAR(250)
);

CREATE TABLE tipoPrestamo (
	cod_tipoPrestamo INT(1) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	tipoPrestamo VARCHAR(25)
);

CREATE TABLE prestamo (
	cod_prestamo INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cod_existencia INT(7) NOT NULL,
    cod_afiliado INT(4) NOT NULL,
    fechaPrestamo VARCHAR(10),
    horaPrestamo VARCHAR(10),
    cod_tipoPrestamo INT(1) NOT NULL,
    fechaEntrega VARCHAR(10),
    horaEntrega VARCHAR(10)
);

INSERT INTO editorial (editorial) VALUES ('editorial1');
INSERT INTO editorial (editorial) VALUES ('editorial2');
INSERT INTO editorial (editorial) VALUES ('editorial3'), ('editorial4');

SELECT * FROM editorial;

INSERT INTO pais(pais) VALUES ('pais1'), ('pais2'), ('pais3'), ('pais4');

SELECT * FROM pais;

SELECT * FROM tipolibro;

INSERT INTO tipolibro (tipolibro) VALUES ('tipo 1');

INSERT INTO tipolibro (tipolibro) VALUES ('tipo 2'), ('tipo 3'), ('tipo 4');

INSERT INTO libro (isbn, titulo, cod_editorial, cod_pais, cod_tipolibro, fechalanzamiento, edicion) VALUES  ('ISBN 1', 'titulo 1', 1, 1, 1, 2020, 'edicion 1'); 
INSERT INTO libro (isbn, titulo, cod_editorial, cod_pais, cod_tipolibro, fechalanzamiento, edicion) VALUES  ('ISBN 2', 'titulo 2', 2, 2, 2, 2019, 'edicion 2');
INSERT INTO libro (isbn, titulo, cod_editorial, cod_pais, cod_tipolibro, fechalanzamiento, edicion) VALUES  ('ISBN 3', 'titulo 3', 3, 3, 3, 2018, 'edicion 3');
INSERT INTO libro (isbn, titulo, cod_editorial, cod_pais, cod_tipolibro, fechalanzamiento, edicion) VALUES  ('ISBN 4', 'titulo 4', 4, 4, 4, 2017, 'edicion 4');

INSERT INTO area (area) VALUES ('area 1'), ('area 2');
INSERT INTO area (area) VALUES ('area 3'), ('area 4');

SELECT * FROM area;

INSERT INTO autor (autor) VALUES ('autor 1'), ('autor 2'), ('autor 3'), ('autor 4');

SELECT * FROM autor;

INSERT INTO estado (estado) VALUES ('estado 1'), ('estado 2'), ('estado 3'), ('estado 4');

SELECT * FROM estado;

INSERT INTO librosporexistencia (cod_libro) VALUES (10), (11), (12), (13);

INSERT INTO estadoporexistencia (cod_existencia, cod_estado) VALUES (13, 1);
INSERT INTO estadoporexistencia (cod_existencia, cod_estado) VALUES (14, 2), (15,3), (16,4);

-- Esto fue porque al momento de crear la tabla librosporarea no puse el notnull entonces tuve que agrarselo para que me  diera la opcion de agregar datos
ALTER TABLE librosporarea DROP FOREIGN KEY librosporarea_ibfk_2;
ALTER TABLE librosporarea CHANGE COLUMN cod_area cod_area INT NOT NULL ;
ALTER TABLE librosporarea ADD CONSTRAINT librosporarea_ibfk_2 FOREIGN KEY (cod_area) REFERENCES area (cod_area);

INSERT INTO librosporautor (cod_libro, cod_autor) VALUES (10, 1);
INSERT INTO librosporautor (cod_libro, cod_autor) VALUES (11, 2), (12, 3), (13, 4);

SELECT * FROM librosporautor;

INSERT INTO afiliado (nombre, apellido1, apellido2, documento, fechaNacimiento, telefono, direccion) VALUES ('Whitney', 'Stevenson', 'sin apellido', 'documento whit', 'fecha', 'telefono whit', 'direccion whit');
INSERT INTO afiliado (nombre, apellido1, apellido2, documento, fechaNacimiento, telefono, direccion) VALUES  ('Christian', 'Toro', 'B', 'documento Chris', 'fecha', 'telefono chris', 'direccion Chris'), ('Andres Sebastian', 'Torres', 'Mesa', 'documento andres', 'fecha', 'telefono andres', 'direccion andres');
INSERT INTO afiliado (nombre, apellido1, apellido2, documento, fechaNacimiento, telefono, direccion) VALUES ('Juan Pablo', 'Gonzales', 'Makaia', 'documento Juan', 'fecha', 'telefono Juan', 'direccion Juan');

SELECT * FROM afiliado;

INSERT INTO tipoprestamo (tipoprestamo) VALUES ('prestamo 1'), ('prestamo 2'), ('prestamo 3'), ('prestamo 4');

SELECT * FROM tipoprestamo;

INSERT INTO prestamo (cod_existencia, cod_afiliado, fechaprestamo, horaprestamo, cod_tipoprestamo, fechaentrega, horaentrega) VALUES (13, 1, 'Miercoles', 'tarde', 1, 'Sabado', 'Manana');
INSERT INTO prestamo (cod_existencia, cod_afiliado, fechaprestamo, horaprestamo, cod_tipoprestamo, fechaentrega, horaentrega) VALUES (14, 2, 'Martes', 'Noche', 2, 'Domingo', 'Tarde'), (15, 3, 'Lunes', 'Manana', 3, 'Lunes', 'Noche'), (16, 4, 'Domingo', 'Manana', 4, 'Martes', 'noche');

SELECT * FROM prestamo;

INSERT INTO librosporarea (cod_libro, cod_area) VALUES (10, 1);
INSERT INTO librosporarea (cod_libro, cod_area) VALUES (11, 2), (12, 3), (13, 4);

SELECT * FROM librosporarea;

SELECT * FROM afiliado, prestamo, libro;

SELECT * FROM afiliado WHERE cod_afiliado = 4;

SELECT * FROM libro;

UPDATE libro SET cod_libro = 10, fechalanzamiento = '2016' WHERE (cod_libro = 10);

-- para eliminar la tabla area debia eliminar las tabla librosporarea para que me dejara eliminar la tabla areaclientes
DROP TABLE biblioteca.librosporarea;
DROP TABLE biblioteca.area;