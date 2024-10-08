-- 1. CREAR Y POBLAR UNA TABLA.
-- Crear una base de datos llamada "biblioteca":
CREATE DATABASE biblioteca;

-- Usar la base de datos "biblioteca":
USE biblioteca;

-- Insertar al menos 10 libros diferentes en la tabla "libros". Puedes utilizar el siguiente código como ejemplo:
CREATE TABLE libros (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(255) NOT NULL,
  autor VARCHAR(255) NOT NULL,
  fecha_publicacion DATE NOT NULL,
  genero VARCHAR(255) NOT NULL
);

-- Insertar al menos 10 libros diferentes en la tabla "libros". Puedes utilizar el siguiente código como ejemplo:
INSERT INTO libros (titulo, autor, fecha_publicacion, genero) VALUES
  ('El Señor de los Anillos', 'J.R.R. Tolkien', '1954-07-29', 'Fantasía'),
  ('Orgullo y Prejuicio', 'Jane Austen', '1813-01-28', 'Romance'),
  ('Cien años de soledad', 'Gabriel García Márquez', '1967-05-30', 'Realismo mágico'),
  ('El Quijote', 'Miguel de Cervantes', '1605-01-16', 'Novela picaresca'),
  ('Hamlet', 'William Shakespeare', '1603', 'Tragedia'),
  ('1984', 'George Orwell', '1949', 'Ciencia ficción distópica'),
  ('El guardián entre el centeno', 'J.D. Salinger', '1951', 'Novela de iniciación'),
  ('El retrato de Dorian Gray', 'Oscar Wilde', '1891', 'Novela gótica'),
  ('El Gran Gatsby', 'F. Scott Fitzgerald', '1925', 'Novela de la Era del Jazz'),
  ('Ana Karenina', 'León Tolstói', '1878', 'Novela realista');

-- 2. CONSULTAR DATOS EN UNA TABLA
-- Seleccionar todos los libros de la tabla "libros"
SELECT * FROM libros;

-- Seleccionar todos los libros de un autor especificos
SELECT * FROM libros WHERE autor = "J.K. Rowling";

-- Seleccionar todos los libros publicados en un año determinado:
SELECT * FROM libros WHERE fecha_publicacion = '1925';

-- Seleccionar los títulos y autores de todos los libros de un género específico:
SELECT titulos, autor FROM libros WHERE genero = 'Romance'

-- Ordenar los libros por fecha de publicación de forma ascendente:
SELECT * FROM libros ORDER BY fecha_publicacion ASC

-- Ordenar los libros por título de forma descendente:
SELECT * FROM libros ORDER BY fecha_publicacion DESC

-- 3. FILTRAR DATOS CON LA CLAUSULA WHERE
-- Mostrar todos los libros con un titulo que contenga la palabra "aventura"
SELECT * FROM libros WHERE titulo LIKE '%retrato%';

-- Mostrar todos los libros publicados antes del año 2000
SELECT * FROM libros WHERE fecha_publicacion < '2000';

-- Mostrar todos los libros escritos por autores cuyo nombre empiece por la letra "A":
SELECT * FROM libros WHERE autor LIKE 'A%';

-- Mostrar todos los libros de un género que no sea "ficción":
SELECT * FROM libros WHERE genero != 'Ficción';

-- 4. COMBINAR DATOS DE VARIAS TABLAS
-- Objetivo: Crear una tabla "autores" y relacionarla con la tabla "libros" para obtener información conjunta de autores y libros.
-- Crea una tabla llamada "autores" con los siguientes campos
CREATE TABLE autores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  nacionalidad VARCHAR(255) NOT NULL
);
-- Relacionar las tablas "libros" y "autores" mediante una clave foránea:
ALTER TABLE libros
ADD FOREIGN KEY (autor_id)
REFERENCES autores(id);
-- Seleccionar todos los libros junto con el nombre del autor correspondiente

