
/*La siguiente instrucción se ejecuta para validar elementos nativos que aún no se incorporan a MySQL 8 */
/*Recordar cambiar root por el usuario a modificar (con que se realiza el acceso a la base de datos),
y la contraseña seleccionada para el mismo*/
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'youpassword';

/*Para anular reglas establecidas de SQL*/
SET GLOBAL sql_mode='';

/*Cambiar formato de fecha*/
SELECT DATE_FORMAT(fecha, '%m-%d-%y') from servicio; 

/*Modificar campo a auto incrementable*/
ALTER TABLE servicio MODIFY idServicio int NOT NULL AUTO_INCREMENT;

/*Procedimiento almacenado utilizado para insertar datos desde el SW*/
/*Si presenta conflictos la creación, dirigirse a la DB, Stored Procedures, click derecho,
Created, copiar y pegar el siguiente código*/

CREATE DEFINER=`root`@`localhost` PROCEDURE `servicioAgregarOEditar2`(
	IN _idServicio VARCHAR(6),
    IN _tipoServicio VARCHAR(20),
    IN _duracion INT, 
    IN _cedula_Enfermero VARCHAR(15),
    IN _cedula_Paciente VARCHAR(15),
    IN _fecha DATE,
    IN _hora TIME, 
    IN _estado VARCHAR(20)
)
BEGIN
	IF _idServicio != 0 THEN
		INSERT INTO servicio(tipoServicio, duracion, cedula_Enfermero,
        cedula_Paciente, fecha, hora, estado)
        VALUES (_tipoServicio, _duracion, _cedula_Enfermero,
        _cedula_Paciente, _fecha, _hora, _estado);
        
	SET _idServicio = LAST_INSERT_ID();
    ELSE 
		UPDATE servicio
        SET 
			tipoServicio = _tipoServicio,
            duracion = _duracion,
            cedula_Enfermero = _cedula_Enfermero,
            cedula_Paciente = _cedula_Paciente, 
            fecha = _fecha, 
            hora = _hora,
            estado = _estado
			WHERE idServicio = _idServicio;
	END IF;		
	SELECT _idServicio AS idServicio;
END



