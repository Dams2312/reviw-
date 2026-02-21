/*pacientes*/
insert into pacientes (codigo,nombre_paciente,apellido_paciente,telefono_paciente)
SELECT DISTINCT
	Paciente_ID,nombre_paciente,
    apellido_paciente,telefono_paciente
FROM datos_planos_pacientes;
	
select * from pacientes;

/*Facultad_Origen*/
INSERT INTO Facultad_Origen (facultad_origen,decano_facultad)
SELECT DISTINCT 
	Facultad_Origen,
    Decano_Facultad
FROM datos_planos_pacientes;

select * from Facultad_Origen;

/* Hospitales*/
INSERT INTO Hospitales (hospital_sede,dir_sede)
SELECT DISTINCT 
	Hospital_Sede,
    Dir_Sede
FROM datos_planos_pacientes;

select * from Hospitales;

/*Diagnosticos*/
INSERT INTO Diagnosticos (diagnostico)
SELECT DISTINCT 
	Diagnostico
FROM datos_planos_pacientes;

select * from Diagnosticos;
	
/*Medicos*/
INSERT INTO Medicos (Codigo, nombre_medico, especialidad, id_facultad)
SELECT DISTINCT
    d.Medico_ID,
    d.Nombre_Medico,
    d.Especialidad,
    f.id_facultad
FROM datos_planos_pacientes d
INNER JOIN Facultad_Origen f
    ON d.Facultad_Origen = f.facultad_origen
    AND d.Decano_Facultad = f.decano_facultad;
    
select * from Medicos;

/*Citas*/
INSERT INTO Citas(cod_cita,fecha_cita,id_hospital,id_paciente,id_medicos)
SELECT DISTINCT 
	d.Cod_Cita,
    d.Fecha_Cita,
    H.id_hospital,
    P.id_paciente,
    M.id_medico
    FROM datos_planos_pacientes d
    INNER JOIN Hospitales H ON 
		d.Dir_Sede = H.dir_sede
	INNER JOIN Pacientes P ON
		d.Paciente_ID = P.codigo
	INNER JOIN Medicos M ON
		d.Medico_ID = M.codigo;
    
    select * from Citas;
    
    /*RECETAS*/
    
    INSERT INTO Recetas(id_diagnostico,id_cita,medicamento_recetado,dosis_medicamento)
    SELECT DISTINCT
		DI.id_diagnostico,
        C.id_cita,
		d.Medicamento_Recetado,
        d.Dosis_Medicamento
	FROM  datos_planos_pacientes d
	INNER JOIN Diagnosticos DI ON
		d.Diagnostico = DI.diagnostico
	INNER JOIN Citas C ON
		d.Cod_Cita = C.cod_cita;
        
    select * from RECETAS;