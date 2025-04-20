-- MySQL Workbench Synchronization
-- Generated: 2025-04-20 00:16
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: franc

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `car_rental` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `car_rental`.`clientes` (
  `id_Cliente` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_Cliente` VARCHAR(100) NOT NULL,
  `DNI_Cliente` VARCHAR(11) NOT NULL,
  `direccion_Cliente` VARCHAR(150) NOT NULL,
  `telefono_Cliente` INT(11) NOT NULL,
  `email_Cliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cliente`),
  UNIQUE INDEX `DNI_Cliente_UNIQUE` (`DNI_Cliente` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_rental`.`sucursales` (
  `id_Sucursal` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_Sucursal` VARCHAR(45) NOT NULL,
  `direccion_Sucursal` VARCHAR(150) NOT NULL,
  `telefono_Sucursal` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_Sucursal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_rental`.`empleados` (
  `id_Empleado` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre_Empleado` VARCHAR(100) NOT NULL,
  `cargo_Empleado` VARCHAR(45) NOT NULL,
  `id_Sucursal` INT(11) NOT NULL,
  PRIMARY KEY (`id_Empleado`),
  INDEX `fk_empleados_sucursales_idx` (`id_Sucursal` ASC) VISIBLE,
  CONSTRAINT `fk_empleados_sucursales`
    FOREIGN KEY (`id_Sucursal`)
    REFERENCES `car_rental`.`sucursales` (`id_Sucursal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_rental`.`reservas` (
  `id_Reserva` INT(11) NOT NULL AUTO_INCREMENT,
  `fecha_Inicio` DATETIME NOT NULL,
  `fecha_Fin` DATETIME NOT NULL,
  `costo_Total` DECIMAL(10,2) NOT NULL,
  `estado_Reserva` ENUM('vigente', 'finalizada', 'anulada') NOT NULL,
  `id_Cliente` INT(11) NOT NULL,
  `id_Vehiculo` INT(11) NOT NULL,
  `id_Empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id_Reserva`),
  INDEX `fk_reservas_vehiculos1_idx` (`id_Vehiculo` ASC) VISIBLE,
  INDEX `fk_reservas_clientes1_idx` (`id_Cliente` ASC) VISIBLE,
  INDEX `fk_reservas_empleados1_idx` (`id_Empleado` ASC) VISIBLE,
  CONSTRAINT `fk_reservas_vehiculos1`
    FOREIGN KEY (`id_Vehiculo`)
    REFERENCES `car_rental`.`vehiculos` (`id_Vehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_clientes1`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `car_rental`.`clientes` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservas_empleados1`
    FOREIGN KEY (`id_Empleado`)
    REFERENCES `car_rental`.`empleados` (`id_Empleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `car_rental`.`vehiculos` (
  `id_Vehiculo` INT(11) NOT NULL AUTO_INCREMENT,
  `marca_Vehiculo` VARCHAR(45) NOT NULL,
  `modelo_Vehiculo` VARCHAR(45) NOT NULL,
  `año_Vehiculo` YEAR NOT NULL,
  `matricula_Vehiculo` VARCHAR(15) NOT NULL,
  `tipo_Combustible` ENUM('gasolina', 'electrico', 'diesel', 'hibrido') NOT NULL,
  `estado_Vehiculo` ENUM('libre', 'asignado', 'revision', 'retirado') NOT NULL,
  PRIMARY KEY (`id_Vehiculo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
