/*Pacientes*/
DELIMITER $$

CREATE PROCEDURE crear_paciente(
    IN p_codigo VARCHAR(10),
    IN p_nombre VARCHAR(60),
    IN p_apellido VARCHAR(60),
    IN p_telefono VARCHAR(20)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Pacientes', v_codigo, v_mensaje);
    END;

    INSERT INTO Pacientes(codigo, nombre_paciente, apellido_paciente, telefono_paciente)
    VALUES(p_codigo, p_nombre, p_apellido, p_telefono);
END$$

DELIMITER ;

CALL crear_paciente('P-504','Juan','Perez','600-888');

DELIMITER $$

CREATE PROCEDURE buscar_paciente(
    IN p_id INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Pacientes', v_codigo, v_mensaje);
    END;

    SELECT * 
    FROM Pacientes
    WHERE id_paciente = p_id;

END$$

DELIMITER ;

CALL buscar_paciente(1);

DELIMITER $$

CREATE PROCEDURE actualizar_paciente(
    IN p_id INT,
    IN p_codigo VARCHAR(10),
    IN p_nombre VARCHAR(60),
    IN p_apellido VARCHAR(60),
    IN p_telefono VARCHAR(20)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Pacientes', v_codigo, v_mensaje);
    END;

    UPDATE Pacientes
    SET codigo = p_codigo,
		nombre_paciente = p_nombre,
        apellido_paciente = p_apellido,
        telefono_paciente = p_telefono
    WHERE id_paciente = p_id;
END$$

DELIMITER ;

CALL actualizar_paciente(4,'P-504','Javier','Perez','600-888');

DELIMITER $$

CREATE PROCEDURE eliminar_paciente(
    IN p_id INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Pacientes', v_codigo, v_mensaje);
    END;

    DELETE FROM Pacientes
    WHERE id_paciente = p_id;
END$$

DELIMITER ;

CALL eliminar_paciente(4);

/*Facultad_Origen*/

DELIMITER $$

CREATE PROCEDURE crear_facultad(
    IN p_facultad VARCHAR(100),
    IN p_decano VARCHAR(100)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Facultad_Origen', v_codigo, v_mensaje);
    END;

    INSERT INTO Facultad_Origen(facultad_origen, decano_facultad)
    VALUES(p_facultad, p_decano);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE listar_facultad(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Facultad_Origen', v_codigo, v_mensaje);
    END;

    SELECT * FROM Facultad_Origen
    WHERE id_facultad = p_id OR p_id IS NULL;
END$$
DELIMITER ;


DELIMITER $$

CREATE PROCEDURE actualizar_facultad(
    IN p_id INT,
    IN p_facultad VARCHAR(100),
    IN p_decano VARCHAR(100)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Facultad_Origen', v_codigo, v_mensaje);
    END;

    UPDATE Facultad_Origen
    SET facultad_origen = p_facultad,
        decano_facultad = p_decano
    WHERE id_facultad = p_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe la facultad';
    END IF;

END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_facultad(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Facultad_Origen', v_codigo, v_mensaje);
    END;

    DELETE FROM Facultad_Origen
    WHERE id_facultad = p_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe la facultad';
    END IF;

END$$
DELIMITER ;

/*Hospitales*/

DELIMITER $$

CREATE PROCEDURE crear_hospital(
    IN p_sede VARCHAR(150),
    IN p_dir VARCHAR(150)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Hospitales', v_codigo, v_mensaje);
    END;

    INSERT INTO Hospitales(hospital_sede, dir_sede)
    VALUES(p_sede, p_dir);
END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE listar_hospital(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Hospitales', v_codigo, v_mensaje);
    END;

    SELECT *
    FROM Hospitales
    WHERE id_hospital = p_id OR p_id IS NULL;

END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE actualizar_hospital(
    IN p_id INT,
    IN p_sede VARCHAR(150),
    IN p_dir VARCHAR(150)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Hospitales', v_codigo, v_mensaje);
    END;

    UPDATE Hospitales
    SET hospital_sede = p_sede,
        dir_sede = p_dir
    WHERE id_hospital = p_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe el hospital';
    END IF;

END$$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_hospital(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Hospitales', v_codigo, v_mensaje);
    END;

    DELETE FROM Hospitales
    WHERE id_hospital = p_id;

    IF ROW_COUNT() = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe el hospital';
    END IF;

END$$
DELIMITER ;

/*Diagnosticos*/

DELIMITER $$

CREATE PROCEDURE crear_diagnostico(
    IN p_diagnostico VARCHAR(150)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Diagnosticos', v_codigo, v_mensaje);
    END;

    INSERT INTO Diagnosticos(diagnostico)
    VALUES(p_diagnostico);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE listar_diagnostico(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Diagnosticos', v_codigo, v_mensaje);
    END;

    SELECT *
    FROM Diagnosticos
    WHERE id_diagnostico = p_id OR p_id IS NULL;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE actualizar_diagnostico(
    IN p_id INT,
    IN p_diagnostico VARCHAR(150)
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Diagnosticos', v_codigo, v_mensaje);
    END;

    UPDATE Diagnosticos
    SET diagnostico = p_diagnostico
    WHERE id_diagnostico = p_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_diagnostico(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Diagnosticos', v_codigo, v_mensaje);
    END;

    DELETE FROM Diagnosticos
    WHERE id_diagnostico = p_id;
END$$

DELIMITER ;

/*Medicos*/

DELIMITER $$

CREATE PROCEDURE crear_medico(
    IN p_codigo VARCHAR(10),
    IN p_nombre VARCHAR(100),
    IN p_especialidad VARCHAR(100),
    IN p_id_facultad INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Medicos', v_codigo, v_mensaje);
    END;

    INSERT INTO Medicos(Codigo, nombre_medico, especialidad, id_facultad)
    VALUES(p_codigo, p_nombre, p_especialidad, p_id_facultad);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE listar_medico(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Medicos', v_codigo, v_mensaje);
    END;

    SELECT *
    FROM Medicos
    WHERE id_medico = p_id OR p_id IS NULL;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE actualizar_medico(
    IN p_id INT,
    IN p_codigo VARCHAR(10),
    IN p_nombre VARCHAR(100),
    IN p_especialidad VARCHAR(100),
    IN p_id_facultad INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Medicos', v_codigo, v_mensaje);
    END;

    UPDATE Medicos
    SET Codigo = p_codigo,
        nombre_medico = p_nombre,
        especialidad = p_especialidad,
        id_facultad = p_id_facultad
    WHERE id_medico = p_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_medico(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Medicos', v_codigo, v_mensaje);
    END;

    DELETE FROM Medicos
    WHERE id_medico = p_id;
END$$

DELIMITER ;

/*Citas*/

DELIMITER $$

CREATE PROCEDURE crear_cita(
    IN p_codigo VARCHAR(10),
    IN p_fecha DATE,
    IN p_id_hospital INT,
    IN p_id_paciente INT,
    IN p_id_medico INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);
    END;

    INSERT INTO Citas(cod_cita, fecha_cita, id_hospital, id_paciente, id_medicos)
    VALUES(p_codigo, p_fecha, p_id_hospital, p_id_paciente, p_id_medico);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE listar_cita(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);
    END;

    SELECT *
    FROM Citas
    WHERE id_cita = p_id OR p_id IS NULL;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE actualizar_cita(
    IN p_id INT,
    IN p_codigo VARCHAR(10),
    IN p_fecha DATE,
    IN p_id_hospital INT,
    IN p_id_paciente INT,
    IN p_id_medico INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);
    END;

    UPDATE Citas
    SET cod_cita = p_codigo,
        fecha_cita = p_fecha,
        id_hospital = p_id_hospital,
        id_paciente = p_id_paciente,
        id_medicos = p_id_medico
    WHERE id_cita = p_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_cita(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);
    END;

    DELETE FROM Citas
    WHERE id_cita = p_id;
END$$

DELIMITER ;

/*Recetas*/

DELIMITER $$

CREATE PROCEDURE crear_receta(
    IN p_id_diagnostico INT,
    IN p_medicamento VARCHAR(150),
    IN p_dosis VARCHAR(50),
    IN p_id_cita INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Recetas', v_codigo, v_mensaje);
    END;

    INSERT INTO Recetas(id_diagnostico, medicamento_recetado, dosis_medicamento, id_cita)
    VALUES(p_id_diagnostico, p_medicamento, p_dosis, p_id_cita);
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE listar_receta(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Recetas', v_codigo, v_mensaje);
    END;

    SELECT *
    FROM Recetas
    WHERE id_solucion = p_id OR p_id IS NULL;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE actualizar_receta(
    IN p_id INT,
    IN p_id_diagnostico INT,
    IN p_medicamento VARCHAR(150),
    IN p_dosis VARCHAR(50),
    IN p_id_cita INT
)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Recetas', v_codigo, v_mensaje);
    END;

    UPDATE Recetas
    SET id_diagnostico = p_id_diagnostico,
        medicamento_recetado = p_medicamento,
        dosis_medicamento = p_dosis,
        id_cita = p_id_cita
    WHERE id_solucion = p_id;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminar_receta(IN p_id INT)
BEGIN
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Recetas', v_codigo, v_mensaje);
    END;

    DELETE FROM Recetas
    WHERE id_solucion = p_id;
END$$

DELIMITER ;