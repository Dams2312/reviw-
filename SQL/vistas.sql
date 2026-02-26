create view medicos_caracteristicas AS
SELECT 
	M.nombre_medico,
    M.especialidad,
    F.id_facultad 
    FROM  medicos M INNER JOIN
    facultad_origen F on M.id_medico = F.id_facultad;
    
select * from medicos_caracteristicas;


CREATE VIEW medicamentos as
SELECT 
    count(id_cita),
    medicamento_recetado
    FROM recetas group by medicamento_recetado;
        
 select * FROM medicamentos;