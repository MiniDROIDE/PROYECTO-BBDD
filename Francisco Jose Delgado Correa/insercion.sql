USE car_rental;

## INSERCIÓN DE DATOS EN TABLA CLIENTES
INSERT INTO clientes (nombre_Cliente, DNI_Cliente, direccion_Cliente, telefono_Cliente, email_Cliente)
VALUES
('Jorge Pérez', '12345678Z', 'Calle El Pilar, La Laguna, Tenerife', 632178965, 'jorge.perez@gmail.com'),
('Antonio González', '87654321Y', 'Av. Trinidad, Santa Cruz de Tenerife', 634987321, 'antonio.gonzalez@hotmail.com'),
('María Rodríguez', '11223344X', 'Calle El Rosario, La Orotava, Tenerife', 675223411, 'maria.rodriguez@outlook.es'),
('Raúl García', '44332211W', 'Calle Real, La Laguna, Tenerife', 655223311, 'raul.garcia@gmail.com'),
('Ana Torres', '55667788V', 'Av. Los Majuelos, La Laguna, Tenerife', 611449977, 'ana.torres@hotmail.com'),
('Pedro Martín', '99887766U', 'Calle La Arena, Puerto de la Cruz, Tenerife', 622889911, 'pedro.martin@outlook.es'),
('Dailo Herrera', '66778899T', 'Calle Barranco Grande, Santa Cruz de Tenerife', 699887766, 'dailo.herrera@gmail.com'),
('Isabel Morales', '22113344S', 'Calle San Agustín, Icod de los Vinos, Tenerife', 677554433, 'isabel.morales@gmail.com'),
('Echedey Díaz', '44332211R', 'Calle Real, La Orotava, Tenerife', 654223311, 'echedey.diaz@yahoo.com'),
('Poleth Santana', '77889900Q', 'Camino El Chorrillo, Arona, Tenerife', 633221199, 'poleth.santana@outlook.es'),
('Guacimara Díaz', '44778899P', 'Calle Las Candelarias, La Orotava, Tenerife', 699112233, 'guacimara.diaz@gmail.com'),
('Samuel López', '55667788Q', 'Calle La Luz, Tacoronte, Tenerife', 634576602, 'samuel.lopez@hotmail.com');

SELECT * FROM clientes;

## INSERCIÓN DE DATOS EN TABLA SUCURSALES
INSERT INTO sucursales (nombre_Sucursal, direccion_Sucursal, telefono_Sucursal)
VALUES
('Sucursal Norte', 'Av. Los Menceyes, La Laguna, Tenerife', '922737192'),
('Sucursal Sur', 'Calle Suecia, Playa de las Américas, Arona, Tenerife', '922274109'),
('Sucursal Capital', 'Rambla de Santa Cruz, Santa Cruz de Tenerife', '922273911');

SELECT * FROM sucursales;

## INSERCIÓN DE DATOS EN TABLA EMPLEADOS
INSERT INTO empleados (nombre_Empleado, cargo_Empleado, id_Sucursal)
VALUES
('Ayoze Delgado', 'Agente de Reservas', 1),
('Naira Morales', 'Encargada', 1),
('Yeray Cabrera', 'Recepcionista', 2),
('Carmen Falcón', 'Agente de Reservas', 2),
('Luis Dávila', 'Encargado', 3),
('Candelaria Suárez', 'Recepcionista', 3);

SELECT * FROM empleados;

## INSERCIÓN DE DATOS EN TABLA VEHICULOS
INSERT INTO vehiculos (marca_Vehiculo, modelo_Vehiculo, año_Vehiculo, matricula_Vehiculo, tipo_Combustible, estado_Vehiculo)
VALUES
('Toyota', 'Yaris', 2021, '1234KLM', 'gasolina', 'libre'),
('Renault', 'ZOE', 2022, '5678ABC', 'electrico', 'asignado'),
('Ford', 'Ram', 2024, '9012XYZ', 'diesel', 'libre'),
('Hyundai', 'Kona', 2023, '3456DEF', 'hibrido', 'revision'),
('BMW', 'Serie 3', 2022, '4321POI', 'diesel', 'libre'),
('Mercedes-Benz', 'Clase A', 2023, '7890QWE', 'hibrido', 'asignado'),
('Hummer', 'H1 ALPHA', 2012, '9351FYW', 'gasolina', 'libre');

SELECT * FROM vehiculos;

## INSERCIÓN DE DATOS EN TABLA RESERVAS
INSERT INTO reservas (fecha_Inicio, fecha_Fin, costo_Total, estado_Reserva, id_Cliente, id_Vehiculo, id_Empleado)
VALUES
('2025-04-10 10:00:00', '2025-04-15 10:00:00', 250.00, 'vigente', 1, 2, 1),
('2025-03-01 12:00:00', '2025-03-05 12:00:00', 350.00, 'finalizada', 2, 1, 2),
('2025-04-01 09:30:00', '2025-04-10 09:30:00', 500.00, 'finalizada', 3, 1, 3),
('2025-02-15 14:00:00', '2025-02-20 14:00:00', 300.00, 'finalizada', 4, 5, 4),
('2025-04-18 11:00:00', '2025-04-25 11:00:00', 600.00, 'finalizada', 5, 6, 5),
('2025-03-20 08:00:00', '2025-03-23 08:00:00', 150.00, 'anulada', 6, 3, 6),
('2025-04-12 16:00:00', '2025-04-18 16:00:00', 420.00, 'finalizada', 7, 1, 1),
('2025-04-20 09:00:00', '2025-04-25 09:00:00', 375.00, 'vigente', 8, 6, 2),
('2025-03-25 10:30:00', '2025-03-30 10:30:00', 250.00, 'finalizada', 9, 2, 3),
('2025-04-15 13:00:00', '2025-04-22 13:00:00', 420.00, 'anulada', 10, 1, 4),
('2025-03-01 10:00:00', '2025-03-05 10:00:00', 180.00, 'finalizada', 11, 4, 3),
('2025-03-10 14:00:00', '2025-03-15 14:00:00', 220.00, 'finalizada', 11, 3, 2),
('2025-04-05 12:00:00', '2025-04-10 12:00:00', 250.00, 'finalizada', 11, 5, 1),
('2025-03-05 09:00:00', '2025-03-10 09:00:00', 200.00, 'finalizada', 12, 5, 4),
('2025-04-12 15:00:00', '2025-04-16 15:00:00', 210.00, 'finalizada', 12, 1, 5);

SELECT * FROM reservas;