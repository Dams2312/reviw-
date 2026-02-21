DELIMITER $$

CREATE FUNCTION Doctores_Especialidad(p_especialidad VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Medicos', v_codigo, v_mensaje);

        RETURN 0;
    END;

    SELECT COUNT(*)
    INTO v_total
    FROM Medicos
    WHERE especialidad = p_especialidad;

    RETURN v_total;
END$$

DELIMITER ;


DELIMITER $$

CREATE FUNCTION Pacientes_Atendidos(p_id_medico INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);

        RETURN 0;
    END;

    SELECT COUNT(DISTINCT id_paciente)
    INTO v_total
    FROM Citas
    WHERE id_medicos = p_id_medico;

    RETURN v_total;
END$$

DELIMITER ;

DELIMITER $$

CREATE FUNCTION total_pacientes_sede(p_id_hospital INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_total INT DEFAULT 0;
    DECLARE v_codigo INT;
    DECLARE v_mensaje TEXT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1
            v_codigo = MYSQL_ERRNO,
            v_mensaje = MESSAGE_TEXT;

        INSERT INTO Log_Errores(nombre_tabla, codigo_error, mensaje_error)
        VALUES('Citas', v_codigo, v_mensaje);

        RETURN 0;
    END;

    SELECT COUNT(DISTINCT id_paciente)
    INTO v_total
    FROM Citas
    WHERE id_hospital = p_id_hospital;

    RETURN v_total;
END$$

DELIMITER ;