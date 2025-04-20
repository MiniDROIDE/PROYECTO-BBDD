#CONSULTA 1
SELECT c.nombre_Cliente, COUNT(r.id_Reserva) AS total_reservas
FROM clientes c
JOIN reservas r ON c.id_Cliente = r.id_Cliente
GROUP BY c.id_Cliente
HAVING COUNT(r.id_Reserva) > 1;

#CONSULTA 2
SELECT marca_Vehiculo, modelo_Vehiculo, matricula_Vehiculo, tipo_Combustible, año_Vehiculo
FROM vehiculos
WHERE estado_Vehiculo = 'libre';

#CONSULTA 3
SELECT v.id_Vehiculo, CONCAT(v.marca_Vehiculo, ' ', v.modelo_Vehiculo) AS vehiculo, COUNT(r.id_Reserva) AS veces_reservado
FROM vehiculos v
JOIN reservas r ON v.id_Vehiculo = r.id_Vehiculo
GROUP BY v.id_Vehiculo
ORDER BY veces_reservado DESC
LIMIT 5;

#CONSULTA 4
SELECT e.id_Empleado, e.nombre_Empleado, COUNT(r.id_Reserva) AS total_reservas
FROM empleados e
JOIN reservas r ON e.id_Empleado = r.id_Empleado
GROUP BY e.id_Empleado
ORDER BY total_reservas DESC;

#CONSULTA 5
SELECT v.id_Vehiculo, v.marca_Vehiculo, v.modelo_Vehiculo, COUNT(r.id_Reserva) AS veces_usado
FROM vehiculos v
JOIN reservas r ON v.id_Vehiculo = r.id_Vehiculo
WHERE r.estado_Reserva = 'finalizada'
GROUP BY v.id_Vehiculo
ORDER BY veces_usado DESC;

#CONSULTA 6
SELECT v.id_Vehiculo, v.marca_Vehiculo, v.modelo_Vehiculo, v.matricula_Vehiculo, v.estado_Vehiculo
FROM vehiculos v
LEFT JOIN reservas r ON v.id_Vehiculo = r.id_Vehiculo
WHERE r.id_Reserva IS NULL;

