-- Contar el número total de libros
SELECT COUNT(*) AS total_libros
FROM libros;

-- Contar libros por género
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
