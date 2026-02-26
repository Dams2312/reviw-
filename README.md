# 📚 Documentación Base de Datos - Sistema Clínico

## 1. Descripción General

Esta base de datos gestiona la información de un sistema clínico.\
Permite administrar:

-   Pacientes
-   Médicos
-   Hospitales
-   Facultades de origen
-   Diagnósticos
-   Citas médicas
-   Recetas
-   Informes diarios

El modelo está normalizado y utiliza claves primarias y foráneas para
mantener integridad referencial.

------------------------------------------------------------------------

## 2. Estructura de Tablas

### 🧑 Pacientes

Almacena la información personal del paciente. - id_paciente (PK) -
codigo (único) - nombre_paciente - apellido_paciente - telefono_paciente
(único)

------------------------------------------------------------------------

### 🎓 Facultad_Origen

Información académica del médico. - id_facultad (PK) - facultad_origen -
decano_facultad

------------------------------------------------------------------------

### 🏥 Hospitales

Sedes hospitalarias. - id_hospital (PK) - hospital_sede - dir_sede
(único)

------------------------------------------------------------------------

### 🩺 Diagnosticos

Lista de diagnósticos disponibles. - id_diagnostico (PK) - diagnostico
(único)

------------------------------------------------------------------------

### 👨‍⚕️ Medicos

Información de médicos. - id_medico (PK) - codigo (único) -
nombre_medico - especialidad - id_facultad (FK)

------------------------------------------------------------------------

### 📅 Citas

Registro de atenciones médicas. - id_cita (PK) - cod_cita (único) -
fecha_cita - id_hospital (FK) - id_paciente (FK) - id_medicos (FK)

Relaciona paciente, médico y hospital.

------------------------------------------------------------------------

### 💊 Recetas

Medicamentos formulados en cada cita. - id_solucion (PK) -
id_diagnostico (FK) - medicamento_recetado - dosis_medicamento - id_cita
(FK)

Permite múltiples medicamentos por cita.

------------------------------------------------------------------------

### 📊 Informes

Resumen diario de atención. - id_informe (PK) - fecha_informe -
id_hospital (FK) - id_medico (FK) - total_pacientes - fecha_registro

Generado automáticamente mediante EVENT.

------------------------------------------------------------------------

## 3. Funcionamiento del Sistema

1.  Se registra un paciente.
2.  Se registra un médico y su facultad.
3.  Se agenda una cita vinculando:
    -   Paciente
    -   Médico
    -   Hospital
4.  Se registra diagnóstico.
5.  Se registran recetas asociadas a la cita.
6.  Un EVENT diario genera informe de pacientes atendidos.

------------------------------------------------------------------------

## 4. Seguridad y Control

-   Uso de claves únicas para evitar duplicados.
-   Foreign Keys para mantener integridad.
-   Procedimientos almacenados para CRUD.
-   Manejo de errores con tabla Log_Errores.
-   Triggers para validación de datos.
-   Eventos programados para informes automáticos.
-   Uso de roles 

------------------------------------------------------------------------

## 5. Ventajas del Diseño

✔ Base normalizada\
✔ Integridad referencial\
✔ Automatización de informes\
✔ Manejo centralizado de errores\
✔ Separación clara de responsabilidades

------------------------------------------------------------------------
## 6. Permisos:

Pacientes: tine permisos para editar eliminar agregar y seleccionar en la tabla de de pacientes devido a que es necesesario que elos pacientes puedan editar agregar y revisar sus datos y si lo quiren eliminarlos tambientiene permisos para seleccionar la tabla de citas, diagnosticos y hospitales  recetas para que el paciente pueda ver su cita la cedes los diagnosticos y su receta.

Doctores: tiene permisas para agregar, editar ,eliminar y seleccionar en diagnostico y recetas devido a que es el doctor encargado de diagnosticar al paciente y darle sus recetas y trataminto tambien tiene permisos para ver las tablas de citas, pacientes y hospitales para que el doctor pueda ver las citas que tiene,los datos de su paciente y la sede en la que esta.

Gefe Doctor: tiene permisos para ver medicos , facultad de origen del medico, recetas ,diagnostico  citas pasientes y hospitales tiene etos permiss para que pueda aserse una idea de la productividad de sus medicos, el como estan atendindo,diagnosticando y recetando asemas de que puede saber su facultad necesaria para saber que es un medico sertificado

secretario: tiene permisos para insertar, editar eliminar y seleccionar medicos y citas deviso que para esta persona dependiendo del trabajo que ponga el gefe agregara eliminara y medicos y podra cancelar agregar o editar una cita o datos de medico

## Optimisacion

Cuenta con dos vistas :
- vista de medicos en la que se relaciona su facultad y especialidad
- vista de el numero de pacientes por medicamento

Cuenta con particiones a distintas tablas para mejorar su optimizacion:
- en la tabla informes para mejorar la optimizacion de consultas que se agan por fechas.
- en la tabla Log_Errores para mejorar la optimizacion de consultas que se agan en una determinada fecha.
- en la tabla de citas para mejorar la optimizacion de consultas que se agan en una determinada fecha.

## Autor : Danny Julian Velasco Olarte 

Sistema desarrollado con enfoque académico para práctica de
normalización, procedimientos almacenados, triggers y eventos en MySQL.