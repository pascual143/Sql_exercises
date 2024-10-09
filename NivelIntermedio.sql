-- Contar el número total de libros.
SELECT COUNT(*) AS total_libros
FROM libros;

-- Contar libros por géneros.
SELECT genero, COUNT(*) AS libros_por_genero
FROM libros
GROUP BY genero;

-- Calcular el promedio de la fecha de publicación
SELECT AVG(DATEDIFF(DAY, '2000-01-01', fecha_publicacion)) AS promedio_dias_publicacion --
FROM libros;

-- Encontrar el libro con el título más largo
SELECT titulo
FROM libros
ORDER BY LEN(titulo) DESC
LIMIT 1

--Mostrar libros con autor que ha escrito otro libro con fecha posterior
SELECT libros1.titulo, libros1.autor
FROM libros libros1
WHERE libros1.autor_id IN (
  SELECT autor_id
  FROM libros libros2
  WHERE libros2.fecha_publicacion > libros1.fecha_publicacion
);

-- Encontrar autor con más libros publicados en un año determinado:
SELECT autores.nombre, COUNT(*) AS libros_publicados_en_anio
FROM libros
JOIN autores ON libros.autor_id = autores.id
WHERE libros.fecha_publicacion >= '2020'
GROUP BY autores.nombre
ORDER BY libros_publicados_en_anio DESC
LIMIT 1;
