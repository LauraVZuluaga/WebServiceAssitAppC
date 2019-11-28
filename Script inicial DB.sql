-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: assistsenior
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_servicioservicioNOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrador`
--
CREATE SCHEMA asistsenior;

DROP TABLE IF EXISTS `administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `administrador` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `fkEmailAdmin_idx` (`email`),
  CONSTRAINT `fkEmailAdmin` FOREIGN KEY (`email`) REFERENCES `cuenta_usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrador`
--

LOCK TABLES `administrador` WRITE;
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` VALUES ('10260450','Jose','Salazar',40,'Av panamericana calle 56','310990865','1979-03-20','M','jose.salazar@terceraedad.com');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cita_valoracion`
--

DROP TABLE IF EXISTS `cita_valoracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cita_valoracion` (
  `idCita` varchar(10) NOT NULL,
  `ced_paciente` varchar(15) NOT NULL,
  `ced_medico` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`idCita`),
  KEY `FkCedPacienteTM_idx` (`ced_paciente`),
  KEY `FkCedMedicoTM_idx` (`ced_medico`),
  CONSTRAINT `FkCedMedicoTM` FOREIGN KEY (`ced_medico`) REFERENCES `medico` (`cedula`),
  CONSTRAINT `FkCedPacienteTM` FOREIGN KEY (`ced_paciente`) REFERENCES `paciente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cita_valoracion`
--

LOCK TABLES `cita_valoracion` WRITE;
/*!40000 ALTER TABLE `cita_valoracion` DISABLE KEYS */;
INSERT INTO `cita_valoracion` VALUES ('1','76853451','12345678','2019-06-09','07:30:00');
/*!40000 ALTER TABLE `cita_valoracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_usuario`
--

DROP TABLE IF EXISTS `cuenta_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cuenta_usuario` (
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `tipo` char(1) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_usuario`
--

LOCK TABLES `cuenta_usuario` WRITE;
/*!40000 ALTER TABLE `cuenta_usuario` DISABLE KEYS */;
INSERT INTO `cuenta_usuario` VALUES ('albertico@gmail.com','62-A7-EB-1D-CC-9A-60-BA-42-16-11-3F-38-B9-55-F4','Inactivo','M'),('alberto123@gmail.com','62-A7-EB-1D-CC-9A-60-BA-42-16-11-3F-38-B9-55-F4','Rechazado','E'),('camilo@gmail.com','A5-61-93-1D-15-37-F9-8C-72-CD-E2-3E-91-B8-08-70','activo','E'),('carlos@gmail.com','33-86-B6-FD-C2-C9-BA-A0-AF-6A-97-F6-7B-39-7E-2A','activo','E'),('caro@ucaldas.edu.co','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Activo','M'),('CP4.1.2@ucaldas','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Rechazado','P'),('CP4.1@ucaldas.edu.co','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Pendiente','P'),('daniela123@gmail.com','BA-CE-D4-B3-D9-3F-DB-EA-FA-79-B6-E6-02-7F-14-FD','activo','E'),('djkg@gmail.com','5F-A2-85-E1-BE-BE-0A-66-23-E3-3A-FC-04-A1-FB-D5','Inactivo','E'),('enfermeroprueba@hc.co','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Rechazado','E'),('jose.salazar@terceraedad.com','C3-67-25-DE-6A-71-AF-4A-30-2B-55-C0-AB-4F-AB-CC','Activo','A'),('juan@gmail.com','4D-42-01-9E-3D-F6-06-59-6B-E0-45-F6-05-08-32-BF','Inactivo','E'),('juancho_3191@hotmail.com','C2-39-CF-A6-9B-5B-73-34-28-C2-B0-50-CA-90-FD-AD','Pendiente','P'),('lina@gmail.com','33-70-64-41-F0-33-0F-85-3A-C1-38-20-69-09-67-CE','Inactivo','E'),('lorenzo@gmail.com','7A-B2-A7-70-CA-36-9E-3F-BF-61-13-44-4C-0E-DC-CB','Inactivo','E'),('mariacasas@gmail.com','AF-62-35-6A-55-29-B6-DA-4E-A4-1C-E0-45-E7-55-BE','activo','E'),('milhouse123@gmail.com','30-C5-27-EB-54-5D-F8-A9-0B-30-2F-67-39-54-1A-C7','Rechazado','E'),('nicolas123@email.com','99-3F-2E-C8-F8-5A-D1-EC-7C-9A-C7-C1-D2-7D-DC-10','Activo','M'),('pepitoperez@gmail.com','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Inactivo','M'),('porcialgo@ucaldas.edu.co','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','Activo','P'),('prueba@hotmail.com','6E-9B-3A-76-20-AA-F7-7F-36-27-75-15-09-77-EE-B8','activo','E'),('stivenza96@gmail.com','07-1C-78-6F-55-AA-4A-3B-13-6D-46-39-91-F5-69-55','activo','P'),('valen-tina.ar@hotmail.com','D7-9D-F2-D6-7E-82-AD-6D-AE-35-24-30-F6-74-0B-80','activo','P');
/*!40000 ALTER TABLE `cuenta_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermero`
--

DROP TABLE IF EXISTS `enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `enfermero` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `apellido` varchar(35) NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `email` varchar(45) NOT NULL,
  `hojaVida` varchar(80) DEFAULT NULL,
  `certificado` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `Fkemail` (`email`),
  CONSTRAINT `Fkemail` FOREIGN KEY (`email`) REFERENCES `cuenta_usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermero`
--

LOCK TABLES `enfermero` WRITE;
/*!40000 ALTER TABLE `enfermero` DISABLE KEYS */;
INSERT INTO `enfermero` VALUES ('0192837465','enfermero','prueba',35,'casimira','3103583256','1991-12-31','M','prueba@hotmail.com',NULL,NULL),('10101010','camilo','reinosa',26,'','3153458909','1980-12-01','M','camilo@gmail.com',NULL,NULL),('1053212','Maria','Casas',30,'Cra 15 # 12-33','','1990-08-20','F','mariacasas@gmail.com',NULL,NULL),('105768909','Alberto','Vargas',40,'Cra 13 # 467','8906789','1987-03-28','M','alberto123@gmail.com','',NULL),('1224','lorenzo','vargas',22,'craaaaaa','456','1977-03-24','M','lorenzo@gmail.com',NULL,NULL),('24567890','Daniela','Zuleta',23,'','8907689','1996-07-20','F','daniela123@gmail.com',NULL,NULL),('34546','Nicolas','MillHouse',22,'chinchina','4598475834','2019-03-19','M','milhouse123@gmail.com',NULL,NULL),('3478933','Juan','Aguilar',24,'Cll 15 # 6a-67','3108941300','1990-01-01','M','juan@gmail.com',NULL,NULL),('354','fkdsfj','dd',45,'dfkgfk','45575','2019-04-17','M','djkg@gmail.com',NULL,NULL),('547890','Carlos','Marin',37,'Cra 45 # 12-78','8953489','1980-12-12','M','carlos@gmail.com',NULL,NULL),('778930','lina','acevedo',30,'Cra 12 6a-34','','1980-11-23','F','lina@gmail.com',NULL,NULL),('918273645','enfermero','prueba2',64,'fdf','9876543','1991-12-12','M','enfermeroprueba@hc.co',NULL,NULL);
/*!40000 ALTER TABLE `enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `medico` (
  `cedula` varchar(15) NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `apellido` varchar(35) NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fechaNacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `email` varchar(45) NOT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `FkEmailMedico_idx` (`email`),
  CONSTRAINT `FkEmailMedico` FOREIGN KEY (`email`) REFERENCES `cuenta_usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES ('1054997625','nicolas','quintero',22,'cra 8 #9-56','3218310156','1997-01-04','M','nicolas123@email.com','pediatria'),('12345678','caro','infante',25,'asdf','3103583256','1993-12-12','F','caro@ucaldas.edu.co','no se'),('75083770','nicolas','quintero',23,'cra 8 #9-56','3218310156','1996-01-04','M','pepitoperez@gmail.com','pediatria'),('8347384','albertico','casimiro',34,'Cra 10 # 2-45','3100000000','1980-12-24','M','albertico@gmail.com','Pediatra');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `paciente` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int(11) NOT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `genero` char(1) NOT NULL,
  `email` varchar(45) NOT NULL,
  `invalidez` varchar(5) NOT NULL,
  `alergias` varchar(100) DEFAULT NULL,
  `rh` varchar(3) DEFAULT NULL,
  `p_Coronarios` varchar(80) DEFAULT NULL,
  `descripcion_Paciente` varchar(500) NOT NULL,
  PRIMARY KEY (`cedula`),
  KEY `FkClCorreo_idx` (`email`),
  CONSTRAINT `FkClCorreo` FOREIGN KEY (`email`) REFERENCES `cuenta_usuario` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES ('1053847680','Stiven','Zamora',22,'Calle 58 f # 6 a 47','8911164','1996-01-26','M','stivenza96@gmail.com','No','No','A+','Asma','Hola como estan'),('1053866373','Valentina','Arias',20,'Calle 58 f # 6a - 47','8911264','1998-10-15','F','valen-tina.ar@hotmail.com','No','acetaminofen','Ab-','','Mama de emily'),('76853451','usuario','usuario',27,'ghsdf','3103583256','1991-12-31','M','porcialgo@ucaldas.edu.co','no','ninguna','a+','no','esta bien'),('9129465403','felipe','guevara',27,'asd','3103583256','2016-10-02','M','juancho_3191@hotmail.com','no',NULL,NULL,NULL,'KSJDHFPAIUSDJFBA'),('juan','Diaz','1053423834 ',60,'asdadddd','8765544 ','1959-12-12','M','CP4.1@ucaldas.edu.co','no',NULL,NULL,NULL,'me dio la gana'),('Nicolás ','Quintero','1054997625',70,'lkjhg','8755542 ','1949-12-12','M','CP4.1.2@ucaldas','no',NULL,NULL,NULL,'contraseña abc123\r\n');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio`
--

DROP TABLE IF EXISTS `servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `servicio` (
  `idServicio` varchar(6) NOT NULL AUTO_INCREMENT,
  `tipoServicio` varchar(20) DEFAULT NULL,
  `duracion` int(11) DEFAULT NULL,
  `cedula_Enfermero` varchar(15) DEFAULT NULL,
  `cedula_Paciente` varchar(15) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idServicio`),
  KEY `FkCedEnfermero_idx` (`cedula_Enfermero`),
  KEY `FkCedPaciente_idx` (`cedula_Paciente`),
  CONSTRAINT `FkCedEnfermero` FOREIGN KEY (`cedula_Enfermero`) REFERENCES `enfermero` (`cedula`),
  CONSTRAINT `FkCedPaciente` FOREIGN KEY (`cedula_Paciente`) REFERENCES `paciente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE servicio MODIFY idServicio int NOT NULL AUTO_INCREMENT;
--
-- Dumping data for table `servicio`
--

LOCK TABLES `servicio` WRITE;
/*!40000 ALTER TABLE `servicio` DISABLE KEYS */;
INSERT INTO `servicio` VALUES ('1','Caminar',3,'105768909','1053866373','2019-04-15','08:00:00','Cancelado'),('2','Caminar',2,'105768909','1053866373','2019-04-17','14:00:00','Cancelado'),('3','Caminar',4,'105768909','1053866373','2019-04-15','08:00:00','Cancelado'),('4','Mascota',3,'105768909','1053866373','2019-04-15','03:00:00','Pendiente'),('5','Caminar',2,'105768909','1053866373','2019-04-16','03:00:00','Cancelado'),('6','Cita',1,'105768909','76853451','2019-04-15','07:00:00','Pendiente'),('7','Caminar',3,'105768909','76853451','2019-04-15','09:00:00','Pendiente'),('8','Cita',2,'105768909','76853451','2019-04-16','03:00:00','Pendiente');
/*!40000 ALTER TABLE `servicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno_enfermero`
--

DROP TABLE IF EXISTS `turno_enfermero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `turno_enfermero` (
  `idTurno` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaInicial` time NOT NULL,
  `horaFinal` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ced_enfermero` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idTurno`),
  KEY `FkturnoECedula` (`ced_enfermero`),
  CONSTRAINT `FkturnoECedula` FOREIGN KEY (`ced_enfermero`) REFERENCES `enfermero` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno_enfermero`
--

LOCK TABLES `turno_enfermero` WRITE;
/*!40000 ALTER TABLE `turno_enfermero` DISABLE KEYS */;
INSERT INTO `turno_enfermero` VALUES (1,'2019-04-15','07:00:00','08:00:00','Pedido','105768909'),(2,'2019-04-15','08:00:00','09:00:00','Disponible','105768909'),(3,'2019-04-15','09:00:00','10:00:00','Pedido','105768909'),(4,'2019-04-15','10:00:00','11:00:00','Pedido','105768909'),(5,'2019-04-15','11:00:00','12:00:00','Pedido','105768909'),(6,'2019-04-16','14:00:00','15:00:00','Disponible','105768909'),(7,'2019-04-17','14:00:00','15:00:00','Disponible','105768909'),(8,'2019-04-17','15:00:00','16:00:00','Disponible','105768909'),(9,'2019-04-19','07:00:00','08:00:00','Disponible','105768909'),(10,'2019-04-19','08:00:00','09:00:00','Disponible','105768909'),(11,'2019-04-16','03:00:00','04:00:00','Pedido','105768909'),(12,'2019-04-16','04:00:00','05:00:00','Pedido','105768909'),(13,'2019-06-09','07:00:00','08:00:00','Disponible','0192837465'),(14,'2019-06-09','08:00:00','09:00:00','Disponible','0192837465'),(15,'2019-06-09','09:00:00','10:00:00','Disponible','0192837465'),(16,'2019-06-09','10:00:00','11:00:00','Disponible','0192837465'),(17,'2019-06-09','11:00:00','12:00:00','Disponible','0192837465'),(18,'2019-06-09','12:00:00','13:00:00','Disponible','0192837465'),(19,'2019-06-09','13:00:00','14:00:00','Disponible','0192837465'),(20,'2019-06-09','14:00:00','15:00:00','Disponible','0192837465'),(21,'2019-06-09','15:00:00','16:00:00','Disponible','0192837465'),(22,'2019-06-09','16:00:00','17:00:00','Disponible','0192837465'),(23,'2019-06-09','17:00:00','18:00:00','Disponible','0192837465'),(24,'2019-06-09','18:00:00','19:00:00','Disponible','0192837465'),(25,'2019-06-10','07:00:00','08:00:00','Disponible','0192837465'),(26,'2019-06-10','08:00:00','09:00:00','Disponible','0192837465'),(27,'2019-06-10','09:00:00','10:00:00','Disponible','0192837465'),(28,'2019-06-10','10:00:00','11:00:00','Disponible','0192837465'),(29,'2019-06-10','11:00:00','12:00:00','Disponible','0192837465'),(30,'2019-06-10','12:00:00','13:00:00','Disponible','0192837465'),(31,'2019-06-10','13:00:00','14:00:00','Disponible','0192837465'),(32,'2019-06-10','14:00:00','15:00:00','Disponible','0192837465'),(33,'2019-06-10','15:00:00','16:00:00','Disponible','0192837465'),(34,'2019-06-10','16:00:00','17:00:00','Disponible','0192837465'),(35,'2019-06-10','17:00:00','18:00:00','Disponible','0192837465'),(36,'2019-06-10','18:00:00','19:00:00','Disponible','0192837465');
/*!40000 ALTER TABLE `turno_enfermero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turno_medico`
--

DROP TABLE IF EXISTS `turno_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `turno_medico` (
  `idTurno` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaInicial` time NOT NULL,
  `horaFinal` time NOT NULL,
  `estado` varchar(20) NOT NULL,
  `ced_medico` varchar(15) NOT NULL,
  PRIMARY KEY (`idTurno`),
  KEY `FkCedturnomedico_idx` (`ced_medico`),
  CONSTRAINT `FkCedturnomedico` FOREIGN KEY (`ced_medico`) REFERENCES `medico` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turno_medico`
--

LOCK TABLES `turno_medico` WRITE;
/*!40000 ALTER TABLE `turno_medico` DISABLE KEYS */;
INSERT INTO `turno_medico` VALUES (1,'2019-04-19','07:00:00','07:30:00','Disponible','8347384'),(2,'2019-04-19','07:30:00','08:00:00','Disponible','8347384'),(3,'2019-04-19','08:00:00','08:30:00','Disponible','8347384'),(4,'2019-04-19','08:30:00','09:00:00','Disponible','8347384'),(5,'2019-04-19','09:00:00','09:30:00','Disponible','8347384'),(6,'2019-04-19','09:30:00','10:00:00','Disponible','8347384'),(7,'2019-06-09','07:00:00','07:30:00','Disponible','12345678'),(8,'2019-06-09','07:30:00','08:00:00','Ocupado','12345678'),(9,'2019-06-09','08:00:00','08:30:00','Disponible','12345678'),(10,'2019-06-09','08:30:00','09:00:00','Disponible','12345678'),(11,'2019-06-09','09:00:00','09:30:00','Disponible','12345678'),(12,'2019-06-09','09:30:00','10:00:00','Disponible','12345678'),(13,'2019-06-09','10:00:00','10:30:00','Disponible','12345678'),(14,'2019-06-09','10:30:00','11:00:00','Disponible','12345678'),(15,'2019-06-09','11:00:00','11:30:00','Disponible','12345678'),(16,'2019-06-09','11:30:00','12:00:00','Disponible','12345678');
/*!40000 ALTER TABLE `turno_medico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-06 22:49:06

DESCRIBE servicio;
SELECT * FROM servicio;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

SELECT DATE_FORMAT(fecha, '%m-%d-%y') from servicio; 
