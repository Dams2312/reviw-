
	use reviw;
	drop table if exists datos_planos_pacientes;
	drop table if exists Medicos;
	CREATE TABLE datos_planos_pacientes (
		id_datos int auto_increment primary key,
		
		Paciente_ID VARCHAR(10),
		Nombre_Paciente VARCHAR(60),
		Apellido_Paciente VARCHAR(60),
		Telefono_Paciente VARCHAR(20),

		Medico_ID VARCHAR(10),
		Nombre_Medico VARCHAR(100),
		Especialidad VARCHAR(100),
		Facultad_Origen VARCHAR(100),

		Decano_Facultad VARCHAR(100),
		Cod_Cita VARCHAR(10),
		Fecha_Cita DATE,
		Diagnostico VARCHAR(150),

		Medicamento_Recetado VARCHAR(150),
		Dosis_Medicamento VARCHAR(50),

		Hospital_Sede VARCHAR(150),
		Dir_Sede VARCHAR(150)
	);

	INSERT INTO datos_planos_pacientes (
		Paciente_ID,
		Nombre_Paciente,
		Apellido_Paciente,
		Telefono_Paciente,
		Medico_ID,
		Nombre_Medico,
		Especialidad,
		Facultad_Origen,
		Decano_Facultad,
		Cod_Cita,
		Fecha_Cita,
		Diagnostico,
		Medicamento_Recetado,
		Dosis_Medicamento,
		Hospital_Sede,
		Dir_Sede
	) VALUES
	('P-501','Juan','Rivas','600-111','M-10','Dr. House','Infectología','Medicina','Dr. Wilson','C-001','2024-05-10','Gripe Fuerte','Paracetamol','500mg','Centro Médico','Calle 5 #10'),

	('P-501','Juan','Rivas','600-111','M-10','Dr. House','Infectología','Medicina','Dr. Wilson','C-001','2024-05-10','Gripe Fuerte','Ibuprofeno','400mg','Centro Médico','Calle 5 #10'),

	('P-502','Ana','Soto','600-222','M-10','Dr. House','Infectología','Medicina','Dr. Wilson','C-002','2024-05-11','Infección','Amoxicilina','875mg','Centro Médico','Calle 5 #10'),

	('P-501','Juan','Rivas','600-111','M-22','Dra. Grey','Cardiología','Medicina','Dr. Wilson','C-003','2024-05-12','Arritmia','Aspirina','100mg','Clínica Norte','Av. Libertador'),

	('P-503','Luis','Paz','600-333','M-30','Dr. Strange','Neurología','Ciencias','Dr. Palmer','C-004','2024-05-15','Migraña','Ergotamina','1mg','Clínica Norte','Av. Libertador');

	select * from datos_planos_pacientes;

	CREATE TABLE Pacientes (
		id_paciente INT auto_increment primary key ,
		codigo VARCHAR(10) UNIQUE NOT NULL,
		nombre_paciente VARCHAR(60) NOT NULL,
		apellido_paciente VARCHAR(60) NOT NULL,
		telefono_paciente varchar(20) UNIQUE
	);

	CREATE TABLE Facultad_Origen (
		id_facultad INT auto_increment PRIMARY KEY,
		facultad_origen VARCHAR(100) NOT NULL,
		decano_facultad VARCHAR(100) NOT NULL
	);

	CREATE TABLE Hospitales (
		id_hospital INT auto_increment PRIMARY KEY,
		hospital_sede VARCHAR(150) NOT NULL,
		dir_sede VARCHAR(150) NOT NULL UNIQUE
	);


	CREATE TABLE Diagnosticos (
		id_diagnostico INT auto_increment PRIMARY KEY,
		diagnostico VARCHAR(150) NOT NULL UNIQUE
	);

	CREATE TABLE Medicos (
		id_medico  INT auto_increment PRIMARY KEY,
		Codigo VARCHAR(10) UNIQUE NOT NULL,
		nombre_medico VARCHAR(100) NOT NULL,
		especialidad VARCHAR(100) NOT NULL,
		id_facultad INT,
		FOREIGN KEY (id_facultad) REFERENCES Facultad_Origen(id_facultad)
	);

	CREATE TABLE Citas (
		id_cita INT auto_increment PRIMARY KEY,
		cod_cita VARCHAR(10) UNIQUE NOT NULL,
		fecha_cita DATE NOT NULL,
		id_hospital INT,
		id_paciente INT,
		id_medicos INT,
		FOREIGN KEY (id_hospital) REFERENCES Hospitales(id_hospital),
		FOREIGN KEY (id_paciente) REFERENCES Pacientes(id_paciente),
		FOREIGN KEY (id_medicos) REFERENCES Medicos(id_medico)
	);

CREATE TABLE Recetas(
    id_solucion INT auto_increment PRIMARY KEY,
    id_diagnostico INT,
    medicamento_recetado VARCHAR(150) NOT NULL,
    dosis_medicamento VARCHAR(50) NOT NULL,
    id_cita INT,
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnosticos(id_diagnostico),
    FOREIGN KEY (id_cita) REFERENCES Citas(id_cita)
);  

CREATE TABLE Log_Errores (
    id_error INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tabla VARCHAR(100),
    codigo_error INT,
    mensaje_error TEXT,
    fecha_hora DATETIME DEFAULT CURRENT_TIMESTAMP
);