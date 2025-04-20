#CREACION DE NUEVA COLUMNA tipo_Cliente.
ALTER TABLE clientes
ADD COLUMN tipo_Cliente ENUM('particular', 'empresa') NOT NULL DEFAULT 'particular';

#CREACION DE NUEVA COLUMNA kilometraje_Actual.
ALTER TABLE vehiculos
ADD COLUMN kilometraje_Actual INT DEFAULT 0;

#NUEVA TABLA (VALORACIONES)
CREATE TABLE IF NOT EXISTS valoraciones_vehiculos (
    id_Valoracion INT(11) NOT NULL AUTO_INCREMENT,
    id_Vehiculo INT(11) NOT NULL,
    id_Cliente INT(11) NOT NULL,
    fecha_Valoracion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    puntuacion INT(1) NOT NULL CHECK (puntuacion >= 1 AND puntuacion <= 5),  -- Puntuación de 1 a 5
    comentario TEXT,
    PRIMARY KEY (id_Valoracion),
    FOREIGN KEY (id_Vehiculo) REFERENCES vehiculos(id_Vehiculo),
    FOREIGN KEY (id_Cliente) REFERENCES clientes(id_Cliente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#INSERTAR DATOS EN LA NUEVA TABLA VALORACIONES
INSERT INTO valoraciones_vehiculos (id_Vehiculo, id_Cliente, puntuacion, comentario)
VALUES
(1, 1, 4, 'El coche estuvo muy bien, aunque el aire acondicionado no enfriaba demasiado. En general, buena experiencia.'),
(2, 2, 5, 'Excelente vehículo, muy cómodo y con buena autonomía. Perfecto para moverse por la isla.'),
(3, 3, 3, 'El coche tenía algunos problemas de suspensión. No fue tan cómodo como esperaba, pero en general bien.'),
(4, 4, 2, 'El coche estaba en malas condiciones, el motor hacía ruidos extraños. No volvería a alquilarlo hasta que se repare.'),
(5, 5, 4, 'Buen coche, pero me gustaría que fuera un poco más potente para las subidas de la isla. Aparte de eso, perfecto.'),
(6, 6, 5, 'Increíble coche. Perfecto estado y tecnología avanzada. Fue una gran experiencia, lo recomendaría sin duda.'),
(1, 7, 4, 'Vehículo en buen estado, aunque la gasolina se acabó un poco rápido. Aun así, muy cómodo y práctico.'),
(2, 8, 5, 'Gran coche eléctrico. Cargó rápido y me permitió recorrer la isla sin problemas. Muy recomendado.'),
(3, 9, 3, 'El coche era aceptable, pero tenía algunos problemas de frenos. No lo recomendaría para viajes largos.'),
(4, 10, 1, 'El coche estaba en malas condiciones. Se apagó varias veces durante el viaje y tuve que pedir un cambio de vehículo. Muy mala experiencia.');