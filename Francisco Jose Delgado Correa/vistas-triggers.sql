#VISTA DE RESERVAS ACTIVAS POR CLIENTE
CREATE VIEW reservas_activas_cliente AS
SELECT c.nombre_Cliente, c.DNI_Cliente, r.id_Reserva, r.fecha_Inicio, r.fecha_Fin, r.costo_Total, r.estado_Reserva,v.marca_Vehiculo,v.modelo_Vehiculo,v.matricula_Vehiculo
FROM reservas r
JOIN clientes c ON r.id_Cliente = c.id_Cliente
JOIN vehiculos v ON r.id_Vehiculo = v.id_Vehiculo
WHERE r.estado_Reserva = 'vigente';

SELECT * FROM reservas_activas_cliente;

#VISTA DE VALORACIONES PROMEDIO POR VEHICULO
CREATE VIEW valoraciones_promedio_vehiculo AS
SELECT v.id_Vehiculo, v.marca_Vehiculo, v.modelo_Vehiculo, v.matricula_Vehiculo,
AVG(vo.puntuacion) AS puntuacion_promedio
FROM vehiculos v
LEFT JOIN valoraciones_vehiculos vo ON v.id_Vehiculo = vo.id_Vehiculo
GROUP BY v.id_Vehiculo, v.marca_Vehiculo, v.modelo_Vehiculo, v.matricula_Vehiculo;

SELECT * FROM valoraciones_promedio_vehiculo;

#VISTA DE EMPLEADOS POR SUCURSAL CON NUM DE RESERVA
CREATE VIEW empleados_reservas_sucursal AS
SELECT s.nombre_Sucursal, e.nombre_Empleado, e.cargo_Empleado, COUNT(r.id_Reserva) AS numero_reservas
FROM empleados e
JOIN sucursales s ON e.id_Sucursal = s.id_Sucursal
LEFT JOIN reservas r ON e.id_Empleado = r.id_Empleado
GROUP BY s.nombre_Sucursal, e.nombre_Empleado, e.cargo_Empleado;

SELECT * FROM empleados_reservas_sucursal;

#TRIGGER DE ACTUALIZACION DE ESTADO DE VEHICULO DESPUES DE RESERVA
DELIMITER $$

CREATE TRIGGER after_insert_actualizar_estado_vehiculo_reserva
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
  IF NEW.estado_Reserva = 'vigente' THEN
    UPDATE vehiculos
    SET estado_Vehiculo = 'asignado'
    WHERE id_Vehiculo = NEW.id_Vehiculo;
  END IF;
END $$

DELIMITER ;

SELECT * FROM vehiculos;
SELECT * FROM reservas;
INSERT INTO reservas (fecha_Inicio, fecha_Fin, costo_Total, estado_Reserva, id_Cliente, id_Vehiculo, id_Empleado)
VALUES ('2025-04-20 10:00:00', '2025-04-25 10:00:00', 180.00, 'vigente', 2, 3, 1);

SELECT id_Vehiculo, estado_Vehiculo
FROM vehiculos
WHERE id_Vehiculo = 3;


#TRIGGER PARA LIBERAR EL VEHICULO AL FINALIZAR LA RESERVA
DELIMITER $$

CREATE TRIGGER after_update_liberar_vehiculo_despues_reserva
AFTER UPDATE ON reservas
FOR EACH ROW
BEGIN
  IF OLD.estado_Reserva = 'vigente' AND NEW.estado_Reserva = 'finalizada' THEN
    UPDATE vehiculos
    SET estado_Vehiculo = 'libre'
    WHERE id_Vehiculo = NEW.id_Vehiculo;
  END IF;
END$$

DELIMITER ;

SELECT * FROM reservas WHERE estado_Reserva = 'vigente';
SELECT estado_Vehiculo FROM vehiculos WHERE id_Vehiculo = 6;

UPDATE reservas
SET estado_Reserva = 'finalizada'
WHERE id_Reserva = 6;

SELECT * FROM vehiculos WHERE id_Vehiculo = 6;

#TRIGGER GUARDAR REGISTROS DE CANCELACIONES
CREATE TABLE cancelaciones_reservas (
    id_Cancelacion INT AUTO_INCREMENT PRIMARY KEY,
    id_Reserva INT NOT NULL,
    id_Cliente INT NOT NULL,
    fecha_Cancelacion DATETIME NOT NULL,
    motivo VARCHAR(255) DEFAULT 'Sin especificar'
);

DELIMITER $$

CREATE TRIGGER registrar_cancelacion
AFTER UPDATE ON reservas
FOR EACH ROW
BEGIN
    IF OLD.estado_Reserva <> 'anulada' AND NEW.estado_Reserva = 'anulada' THEN
        INSERT INTO cancelaciones_reservas (id_Reserva, id_Cliente, fecha_Cancelacion)
        VALUES (NEW.id_Reserva, NEW.id_Cliente, NOW());
    END IF;
END$$

DELIMITER ;

SELECT * FROM reservas;
SELECT * FROM cancelaciones_reservas;
