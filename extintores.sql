
CREATE TABLE proveedor(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20),
    numero_tel INTEGER(10)
);


CREATE TABLE salon(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20)
);


CREATE TABLE extintor(
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(10),
    capacidad_ml INTEGER,
    idproveedor INTEGER,
    idsalon INTEGER,
    FOREIGN KEY (idproveedor) REFERENCES proveedor(id),
    FOREIGN KEY (idsalon) REFERENCES salon(id)
);


CREATE TABLE historial_extintor_salon (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    id_extintor INTEGER,
    id_salon INTEGER,
    fecha_ingreso DATETIME,
    FOREIGN KEY (id_extintor) REFERENCES extintor(id),
    FOREIGN KEY (id_salon) REFERENCES salon(id)
);

-- Trigger para registrar ingreso de extintores
DELIMITER //
CREATE TRIGGER extintor_move_trigger AFTER INSERT ON extintor
FOR EACH ROW
BEGIN
    INSERT INTO historial_extintor_salon (id_extintor, id_salon, fecha_ingreso)
    VALUES (NEW.id, NEW.idsalon, NOW());
END;
//
DELIMITER ;



-- Inserts

-- Tabla proveedor
INSERT INTO proveedor (nombre, numero_tel) VALUES ('Proveedor A', 1234567890);
INSERT INTO proveedor (nombre, numero_tel) VALUES ('Proveedor B', 9876543210);
INSERT INTO proveedor (nombre, numero_tel) VALUES ('Proveedor c', 5555555555);
INSERT INTO proveedor (nombre, numero_tel) VALUES ('Proveedor D', 9998887776);

-- Tabla salon
INSERT INTO salon (nombre) VALUES ('Salón A');
INSERT INTO salon (nombre) VALUES ('Salón B');
INSERT INTO salon (nombre) VALUES ('Salón C');

-- Tabla extintores
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('rojo', 9000, 1, 1);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('rojo', 9000, 2, 2);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('amarillo', 9000, 3, 3);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('amarillo', 9000, 1, 1);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('blanco', 9000, 2, 3);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('blanco', 9000, 3, 2);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('rojo', 9000, 1, 2);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('amarillo', 9000, 2, 3);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('amarillo', 9000, 4, 1);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('blanco', 9000, 4, 3);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('rojo', 9000, 4, 1);
INSERT INTO extintor (tipo, capacidad_ml, idproveedor, idsalon) VALUES ('amarillo', 9000, 4, 2);


-- Selects

-- Consulta para ver las fechas de ingreso de los extintores organizadas por salón
SELECT 
    salon.id AS id_salon, 
    salon.nombre AS nombre_salon,
    GROUP_CONCAT(
        CONCAT(
            'Extintor ID: ', historial_extintor_salon.id_extintor, 
            ', Fecha de ingreso: ', historial_extintor_salon.fecha_ingreso
        ) 
        SEPARATOR '\n'
    ) AS historial_extintor
FROM 
    salon 
JOIN 
    historial_extintor_salon 
ON 
    salon.id = historial_extintor_salon.id_salon
GROUP BY 
    salon.id;
