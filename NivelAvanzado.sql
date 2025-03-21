# Agrupar Filas por un Rango
  
  

-- En el siguiente ejemplo de consulta, crearemos los rangos de salario low, medium, y high. Luego contaremos cuantos empleados hay en cada rango salarial:

SELECT
  CASE
    WHEN salary <= 750000 THEN ‘low’
    WHEN salary > 750000 AND salary <= 100000 THEN ‘medium’
    WHEN salary > 100000 THEN ‘high’
  END AS salary_category,
  COUNT(*) AS number_of_employees
FROM    employee
GROUP BY
  CASE
    WHEN salary <= 750000 THEN ‘low’
    WHEN salary > 750000 AND salary <= 100000 THEN ‘medium’
    WHEN salary > 100000 THEN ‘high’
END

# Sumatoria Condicional
-- queremos obtener el total de salarios en los departamentos de Ventas y Recursos Humanos combinados y en los departamentos de IT y Soporte combinados, podemos ejecutar la siguiente consulta:

SELECT
  SUM (CASE
    WHEN dept_id IN (‘SALES’,’HUMAN RESOURCES’)
    THEN salary
    ELSE 0 END) AS total_salary_sales_and_hr,
  SUM (CASE
    WHEN dept_id IN (‘IT’,’SUPPORT’)
    THEN salary
    ELSE 0 END) AS total_salary_it_and_support
FROM employee

# Encontrar registros comunes entre tablas
  
SELECT
  last_name,
  first_name
FROM employee
INTERSECT
SELECT
  last_name,
  first_name
FROM employee_2020_jan

