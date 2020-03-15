CREATE DEFINER=`root`@`localhost` FUNCTION `disponibilidad`(enfermero INT, fecha DATE) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE res VARCHAR(2000);

DECLARE bDone INT;

  DECLARE var1 TIME;
  DECLARE var2 INT;
  DECLARE var3 INT;
  DECLARE contador INT;
  DECLARE festivo BOOL;
  DECLARE dia DATE;

  DECLARE curs CURSOR FOR  SELECT hora, duracion FROM servicio s WHERE s.cedula_Enfermero = enfermero and s.fecha = fecha and estado = 'Pendiente';
  DECLARE curs2 CURSOR FOR  SELECT Fecha FROM DiasFestivos D where D.Fecha = fecha;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET bDone = 1;
  


  OPEN curs2;
  SET bDone = 0;
  SET festivo := false;
  REPEAT
	FETCH curs2 INTO dia;
    IF (bDone != 1) THEN
		SET festivo := true;
    END IF;
  UNTIL bDone END REPEAT;
  
  IF (festivo) THEN
	SET res := '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23';
	RETURN res;
  END IF;
  
  
  OPEN curs;
  
  SET res := '';
  SET bDone = 0;
  REPEAT
    FETCH curs INTO var1, var3;
    SET var2 := HOUR(var1);
		
	IF (bDone != 1) THEN
		SET contador := 0;
        loop_label:  LOOP
			SET  contador = contador + 1;
			IF  contador > var3 THEN 
				LEAVE  loop_label;
			END  IF;
			IF (res != '') THEN
				set res := concat(res, ',');
			END IF;
			set res := concat(res, var2);
            SET var2 := var2 + 1;
		END LOOP;
		
	END IF;
  UNTIL bDone END REPEAT;

  CLOSE curs;

RETURN res;
END