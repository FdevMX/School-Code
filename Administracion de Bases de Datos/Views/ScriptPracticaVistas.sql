-- Active: 1696660704205@@127.0.0.1@3306@bd_productos_deportivos
/*VISTA CLIENTES REGION*/
CREATE VIEW clientes_region AS
SELECT
  c.id_cliente AS "Id cliente",
  c.nombre AS "Nombre",
  c.calle AS "Calle",
  c.colonia AS "Colonia",
  c.ciudad AS "Ciudad",
  c.id_region AS "Id_region",
  r.nombre AS "Nombre Region",
  COALESCE(COUNT(o.id_cliente), 0) AS "Numero_Ordenes"
FROM cliente c
INNER JOIN region r ON c.id_region = r.id_region
LEFT JOIN Orden o ON c.Id_Cliente = o.Id_Cliente
GROUP BY c.id_cliente, r.nombre;

SELECT * FROM clientes_region;
DROP VIEW clientes_region;





/*01. VISTA EMPLEADO DEPARTAMENTOS*/
CREATE VIEW Empleados_Deptos AS
SELECT
  e.id_empleado AS "Empleado",
  e.nombre AS "Nombre empleado",
  e.paterno AS "Paterno",
  e.materno AS "Materno",
  d.id_dep AS "Núm departamento",
  d.nombre AS "Nombre departamento",
  r.nombre AS "Región"
FROM empleado AS e
INNER JOIN departamento AS d ON e.id_dep = d.id_dep
INNER JOIN region AS r ON d.id_region = r.id_region;

SELECT * FROM Empleados_Deptos;
DROP VIEW Empleados_Deptos;





/*02. VISTA CLIENTE ORDENES*/
CREATE VIEW Cliente_Ordenes AS
SELECT
  c.Nombre AS "Nombre_Cliente",
  COUNT(o.id_cliente) AS "Numero_Ordenes"
FROM Cliente c
INNER JOIN Orden o ON c.Id_Cliente = o.Id_Cliente
GROUP BY c.Id_Cliente;

SELECT * FROM Cliente_Ordenes;
DROP VIEW Cliente_Ordenes;





/*03. VISTA REGION DEPARTAMENTOS*/
CREATE VIEW region_departamentos AS
SELECT
  r.id_region AS "Número de región",
  r.nombre AS "Región",
  COUNT(d.id_dep) AS "Número de departamentos"
FROM region r
INNER JOIN departamento d ON r.id_region = d.id_region
GROUP BY r.id_region, r.nombre;

SELECT * FROM region_departamentos;
DROP VIEW region_departamentos;





/*04. NUMERO DE PRODUCTOS*/
CREATE VIEW num_productos AS
SELECT
  dt.id_orden,
  COUNT(dt.id_orden) AS numero_productos
FROM detalle_orden dt
GROUP BY dt.id_orden;

SELECT * FROM num_productos;
DROP VIEW num_productos;
