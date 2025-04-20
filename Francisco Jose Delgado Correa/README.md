# 🚗 **PROYECTO CAR RENTAL BASE DE DATOS** 📊

Bienvenido a mi proyecto de base de datos para una empresa de alquiler de renting.
Este sistema está diseñado para **gestionar de manera eficiente clientes, vehículos, empleados, reservas y mucho más**.

---

## 📌 **Objetivo del Proyecto**

El objetivo principal es diseñar una base de datos relacional que permita:
- 📁 Almacenar información estructurada de clientes, vehículos, empleados y sucursales.
- 🧾 Registrar reservas de forma detallada.
- ⚙️ Automatizar tareas comunes mediante *triggers*.
- 🔍 Facilitar la consulta y análisis de datos mediante *vistas* SQL.
- 📈 Mejorar la toma de decisiones y la organización interna de una empresa de alquiler de coches.

---

## 🗃️ **Estructura de la Base de Datos**

La base de datos contiene las siguientes tablas principales:

- 👤 **clientes**
- 🏢 **sucursales**
- 👨‍💼 **empleados**
- 🚘 **vehiculos**
- 📆 **reservas**
- ⭐ **valoraciones** (opiniones de los clientes tras las reservas)

Además, se han añadido **columnas útiles** como `tipo_Cliente` y tablas adicionales para extender su funcionalidad.

---

## ⚙️ **Funciones Especiales**

### ✅ Triggers implementados:
- 🔁 *Actualiza automáticamente el estado del vehículo al hacer una reserva.*
- 🛑 *Libera el vehículo al finalizar la reserva.*
- 📬 *Evita correos duplicados al insertar un nuevo cliente.*

### 👀 Vistas creadas:
- `vehiculos_disponibles`
- `historial_clientes`
- `empleados_reservas`

Estas vistas ayudan a acceder a la información más importante de forma rápida y clara.

---

## 💻 **Tecnologías utilizadas**
- 🐬 **MySQL** (Workbench)
- 💡 SQL (DDL, DML, Triggers, Views)
- 🛠️ Modelado relacional

---

## 📚 **Cómo probar el proyecto**
1. Crea la base de datos ejecutando el script SQL de creación.
2. Inserta los datos mediante los scripts de inserción.
3. Ejecuta consultas, vistas y *triggers* para ver cómo funciona el sistema automáticamente.

---

## 👤 **Alumno**
- Francisco José Delgado Correa
- 1º DAM
