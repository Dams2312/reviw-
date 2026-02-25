/*trigger de el telefono y nombre de pasiente*/
DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_NOMBREPASIENTE 
BEFORE INSERT ON pacientes FOR EACH ROW
BEGIN
	IF  NEW.nombre_paciente = ''THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre no puede estar vasio';
	END IF;
    IF NEW.telefono_paciente = ''THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El telefono no puede estar vasio';
	END IF;
END $$
    
DELIMITER ;

/*trigger de fechas cita*/
DELIMITER $$
CREATE TRIGGER BEFORE_INSERT_FECHAS_CITAS
BEFORE INSERT ON citas FOR EACH ROW
BEGIN
	IF NEW.fecha_cita > curdate() THEN
		SIGNAL SQLSTATE '50000'
        SET MESSAGE_TEXT = 'No se permiten fechas futuras';
    END IF;
END $$

DELIMITER ;

/*tabla de informe*/
DELIMITER $$

CREATE EVENT Informe_Diario
ON SCHEDULE EVERY 1 DAY
DO
BEGIN

    INSERT INTO Informes (
        fecha_informe,
        id_hospital,
        id_medico,
        total_pacientes
    )
    SELECT 
        fecha_cita,
        id_hospital,
        id_medicos,
        COUNT(id_paciente) AS total_pacientes
    FROM Citas
    WHERE fecha_cita = CURDATE()
    GROUP BY fecha_cita, id_hospital, id_medicos;

END$$

DELIMITER ;