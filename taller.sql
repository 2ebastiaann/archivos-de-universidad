--juan sebastian suarez carmona 2361409-2724
--santiago cadavid 2361480-2724

CREATE TABLE ubicaciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);

CREATE TABLE proveedores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE,
    telefono VARCHAR(15) NULL,
    correo VARCHAR(100) NULL
);

CREATE TABLE tipos (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) UNIQUE
);
CREATE TABLE extintores (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    capacidad INT UNSIGNED,
    fechafabricacion DATE,
    estado VARCHAR(50),
    idtipo INT UNSIGNED,
    idubicacion INT UNSIGNED,
    idproveedor INT UNSIGNED,
    FOREIGN KEY (idtipo) REFERENCES tipos(id),
    FOREIGN KEY (idubicacion) REFERENCES ubicaciones(id),
    FOREIGN KEY (idproveedor) REFERENCES proveedores(id)
);

CREATE TABLE inspecciones (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximainspeccion DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);

CREATE TABLE recargas (
    id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    idextintor INT UNSIGNED,
    fecha DATE,
    proximarecarga DATE,
    FOREIGN KEY (idextintor) REFERENCES extintores(id)
);

--INSERTS 

--ubicaciones
INSERT INTO ubicaciones (nombre) VALUES ('Salón principal');
INSERT INTO ubicaciones (nombre) VALUES ('Salón de conferencias');
INSERT INTO ubicaciones (nombre) VALUES ('Salón A');
INSERT INTO ubicaciones (nombre) VALUES ('Salón B');
INSERT INTO ubicaciones (nombre) VALUES ('Salón de eventos');

--proveedores
INSERT INTO proveedores (nombre, telefono, correo) VALUES ('Proveedor A', '123456789', 'proveedora@example.com');
INSERT INTO proveedores (nombre, telefono, correo) VALUES ('Proveedor B', '987654321', 'proveedorb@example.com');
INSERT INTO proveedores (nombre, telefono, correo) VALUES ('Proveedor C', '283424832', 'proveedorc@example.com');

--tipos
INSERT INTO tipos (nombre) VALUES ('Blanco');
INSERT INTO tipos (nombre) VALUES ('Amarillo');
INSERT INTO tipos (nombre) VALUES ('Rojo');

--extintores
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (5, '2022-01-15', 'Bueno', 1, 1, 1);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (10, '2021-08-20', 'Bueno', 2, 2, 2);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (15, '2020-12-10', 'Regular', 3, 3, 3);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (5, '2023-02-28', 'Bueno', 1, 4, 1);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (10, '2022-11-05', 'Malo', 2, 5, 2);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (15, '2021-06-30', 'Regular', 3, 1, 3);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (5, '2020-03-25', 'Bueno', 1, 2, 1);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (10, '2022-09-12', 'Bueno', 2, 3, 2);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (15, '2023-11-18', 'Regular', 3, 4, 3);
INSERT INTO extintores (capacidad, fechafabricacion, estado, idtipo, idubicacion, idproveedor) VALUES (5, '2021-04-07', 'Malo', 1, 5, 1);

--inspecciones

INSERT INTO inspecciones (idextintor, fecha, proximainspeccion) VALUES 
    (1, '2023-07-15', '2024-01-15'),
    (2, '2023-09-20', '2024-03-20'),
    (3, '2023-11-10', '2024-05-10'),
    (4, '2023-08-28', '2024-02-28'),
    (5, '2023-05-05', '2024-11-05'),
    (6, '2022-01-15', '2023-06-30'),
    (7, '2022-03-20', '2023-04-07'),
    (8, '2022-05-10', '2023-09-12'),
    (9, '2022-02-28', '2023-11-18'),
    (10, '2022-11-05', '2023-01-15'),
    (1, '2024-03-30', '2024-07-15'),
    (2, '2024-04-20', '2024-09-20'),
    (3, '2024-06-10', '2024-11-10'),
    (4, '2024-03-28', '2024-08-28'),
    (5, '2024-01-05', '2024-05-05'),
    (6, '2023-08-15', '2024-06-30'),
    (7, '2023-10-20', '2024-01-15'),
    (8, '2023-12-10', '2024-03-20'),
    (9, '2023-09-28', '2024-05-10'),
    (10, '2023-06-05', '2024-02-28');



--recargas

INSERT INTO recargas (idextintor, fecha, proximarecarga) VALUES 
    (1, '2022-07-15', '2024-07-15'),
    (2, '2023-09-20', '2024-09-20'),
    (3, '2022-11-10', '2023-11-10'),
    (4, '2021-08-28', '2023-08-28'),
    (5, '2022-05-05', '2023-05-05'),
    (6, '2023-01-15', '2024-01-15'),
    (7, '2023-03-20', '2024-03-20'),
    (8, '2023-05-10', '2024-05-10'),
    (9, '2023-02-28', '2024-02-28'),
    (10, '2023-11-05', '2024-11-05'),
    (1, '2022-03-30', '2026-03-30'),
    (2, '2022-04-20', '2026-04-20'),
    (10, '2020-06-10', '2023-06-10'),
    (4, '2020-03-28', '2021-03-28'),
    (5, '2023-01-05', '2024-01-05'),
    (6, '2022-08-15', '2023-08-15'),
    (7, '2022-10-20', '2023-10-20'),
    (8, '2023-12-10', '2024-12-10'),
    (9, '2022-09-28', '2023-09-28'),
    (10, '2022-06-05', '2024-06-05');




--RESPUESTAS TALLER

--1)Encuentra la cantidad total de extintores por cada ubicación.
SELECT ubicaciones.nombre AS ubicacion, COUNT(extintores.id) AS cantidad_extintores
FROM ubicaciones
LEFT JOIN extintores ON ubicaciones.id = extintores.idubicacion
GROUP BY ubicaciones.nombre;



--2)Calcula la suma de las capacidades de todos los extintores por cada tipo de extintor.

SELECT tipos.nombre AS tipo_extintor, SUM(extintores.capacidad) AS suma_capacidades
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.nombre;


--3)Obtiene la fecha de fabricación más reciente de cada tipo de extintor.

SELECT tipos.nombre AS tipo_extintor, MAX(extintores.fechafabricacion) AS fecha_fabricacion_mas_reciente
FROM tipos
LEFT JOIN extintores ON tipos.id = extintores.idtipo
GROUP BY tipos.nombre;


--4)Encuentra el número de inspecciones realizadas en cada extintor.

SELECT idextintor, COUNT(*) AS numero_inspecciones
FROM inspecciones
GROUP BY idextintor;


--5) Calcula la suma de las capacidades de los extintores suministrados por cada
--proveedor en un rango de fechas (usted define las fechas).

SELECT p.nombre AS proveedor, 
       SUM(e.capacidad) AS suma_capacidades
FROM proveedores p
LEFT JOIN extintores e ON p.id = e.idproveedor
WHERE e.fechafabricacion BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY p.nombre;


--6) Encuentra la cantidad de recargas realizadas en extintores de un tipo específico en
--ubicaciones que sean salas (sala 1, sala 2, sala n, etc.).

SELECT tipos.nombre AS tipo_extintor,
       ubicaciones.nombre AS ubicacion,
       COUNT(recargas.id) AS cantidad_recargas
FROM tipos
JOIN extintores ON tipos.id = extintores.idtipo
JOIN ubicaciones ON extintores.idubicacion = ubicaciones.id
JOIN recargas ON extintores.id = recargas.idextintor
WHERE tipos.nombre = 'Blanco' 
      AND (ubicaciones.nombre = 'Salón principal' OR ubicaciones.nombre = 'Salón de conferencias') -- Ubicaciones seleccionadas
GROUP BY tipos.nombre, ubicaciones.nombre;


--7)Encuentra el número de recargas realizadas en extintores cuya última inspección fue
--hace más de seis meses.

SELECT extintores.id AS id_extintor,
       COUNT(recargas.id) AS cantidad_recargas
FROM extintores
JOIN inspecciones ON extintores.id = inspecciones.idextintor
JOIN recargas ON extintores.id = recargas.idextintor
WHERE inspecciones.proximainspeccion < DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
GROUP BY extintores.id;


--8)Encuentra la cantidad de inspecciones realizadas en extintores que tienen al menos
--dos recargas en el último año.

SELECT extintores.id AS id_extintor,
       COUNT(inspecciones.id) AS cantidad_inspecciones
FROM extintores
JOIN inspecciones ON extintores.id = inspecciones.idextintor
JOIN (
    SELECT idextintor
    FROM recargas
    WHERE fecha BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR) AND CURRENT_DATE()
    GROUP BY idextintor
    HAVING COUNT(idextintor) >= 2
) AS recargas_ultimo_anio ON extintores.id = recargas_ultimo_anio.idextintor
GROUP BY extintores.id;


--9) Determina el promedio de las capacidades de los extintores que tienen más de tres
--recargas en total.

SELECT AVG(extintores.capacidad) AS promedio_capacidad
FROM extintores
JOIN recargas ON extintores.id = recargas.idextintor
GROUP BY extintores.id
HAVING COUNT(recargas.id) > 3;


--10) Encuentra la cantidad de recargas realizadas en extintores cuya fecha de última
--inspección está entre dos fechas específicas.

SELECT extintores.id AS id_extintor,
       COUNT(recargas.id) AS cantidad_recargas
FROM extintores
JOIN (
    SELECT idextintor, MAX(proximainspeccion) AS ultima_inspeccion
    FROM inspecciones
    WHERE proximainspeccion BETWEEN '2023-01-01' AND '2024-12-31'
    GROUP BY idextintor
) AS ultimas_inspecciones ON extintores.id = ultimas_inspecciones.idextintor
JOIN recargas ON extintores.id = recargas.idextintor
GROUP BY extintores.id;


