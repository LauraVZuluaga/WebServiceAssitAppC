--Asignacion de lenguage de la sesion de base de datos
SET LANGUAGE SPANISH

--Fecha inicial desde la cual se va a crear la tabla con los dias festivos
DECLARE @fecha AS DATETIME
SET @fecha = '2005-01-01 00:00:00.000'

--Se eliminan datos de la tabla de Fechas
TRUNCATE TABLE Tiempo

IF EXISTS(SELECT name FROM sysobjects WHERE name = N'Fechas' AND xtype='U')
	DROP TABLE Fechas
create table Fechas
( fecha datetime )

-- Se inserta las fechas desde 2005-01-01 hasta 2018-01-01
while (@fecha < '2019-01-01 00:00:00.000')
begin
	INSERT	INTO fechas
	SELECT	@fecha
	SELECT	@fecha = @fecha +1
END

--Se declara cursor para generar la insercion de datos en la tabla tiempo
DECLARE fechas_cursor CURSOR FOR 
SELECT	Fecha  
FROM	Fechas

OPEN fechas_cursor

FETCH NEXT FROM fechas_cursor
INTO @fecha

WHILE @@FETCH_STATUS = 0
BEGIN
	INSERT	INTO tiempo
	SELECT	@fecha Fecha,
			YEAR(@fecha) as Año,
			month(@fecha) as Mes,
			day(@fecha) as Dia,
			DATENAME(mm, @FECHA) MesNombre,
			DATENAME(dw, @FECHA) DiaNombre,
			datepart(dy,@fecha) as DiaAño,
			convert(varchar(10),datepart(wk,@fecha)) SemanaAño,
			CASE WHEN MONTH(@fecha)<= 6  THEN '1' ELSE '2' END Semestre,
			CASE WHEN MONTH(@fecha)<= 3  THEN '1'
				 WHEN MONTH(@fecha)<= 6  THEN '2'
				 WHEN MONTH(@fecha)<= 9  THEN '3'
				 WHEN MONTH(@fecha)<= 12 THEN '4' END Trimestre,
			case WHEN MONTH(@fecha)<= 4  THEN '1'
				 WHEN MONTH(@fecha)<= 8  THEN '2'
				 WHEN MONTH(@fecha)<= 12  THEN '3'END Cuatrimestre,
			CASE WHEN DATEPART(DW, @fecha) = 6 THEN 0 -- Se marca el dia sabado como dia no habil
				 WHEN DATEPART(DW, @fecha) = 7 THEN 0 -- Se marca el dia domingo como dia no habil
				 ELSE 1 END DiaHabil

	FETCH NEXT FROM fechas_cursor
	INTO @fecha
END
CLOSE fechas_cursor;
DEALLOCATE fechas_cursor;


-- Se marcan los dias festivos como dias no habiles
UPDATE	tiempo SET diahabil = 0
FROM	TIEMPO T 
		INNER JOIN FESTIVOS F ON Convert(varchar(10),T.fecha,101) = Convert(varchar(10),F.[Fecha],101)


--Eliminar tabla temporal
IF EXISTS(SELECT name FROM sysobjects WHERE name = N'Fechas' AND xtype='U')
	DROP TABLE Fechas


--Resultado final
select * from tiempo