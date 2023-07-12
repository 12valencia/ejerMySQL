CREATE DATABASE ejercicio_crud;
USE ejercicio_crud;
CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50),
  apellido VARCHAR(50),
  email VARCHAR(100),
  telefono VARCHAR(20)
);

INSERT INTO clientes (nombre, apellido, email, telefono) VALUES
  ('Sara', 'Pérez', 'sara@example.com', '1234567890'),
  ('María', 'García', 'maria@example.com', '6666666666'),
  ('Carlos', 'López', 'carlos@example.com', '5555555555'),
  ('Ana', 'Martínez', 'ana@example.com', '9999999999'),
 
  ('Pedro', 'Rodríguez', 'pedro@example.com', '7777787777'),
  ('Laura', 'Hernández', 'laura@example.com', '8888888888');

SELECT * FROM clientes ORDER BY id DESC LIMIT 2;

UPDATE clientes SET telefono = '1111111111' WHERE id = 1;
DELETE FROM clientes WHERE id IN (3, 5, 10);

SELECT * FROM clientes;



