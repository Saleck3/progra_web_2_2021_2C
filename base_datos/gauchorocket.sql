-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: GauchoRocket
-- ------------------------------------------------------
-- Server version	5.6.51

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Cargo`
--

DROP TABLE IF EXISTS `Cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cargo`
--

LOCK TABLES `Cargo` WRITE;
/*!40000 ALTER TABLE `Cargo` DISABLE KEYS */;
INSERT INTO `Cargo` VALUES (1,'administrador'),(2,'cliente');
/*!40000 ALTER TABLE `Cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CentrosMedicos`
--

DROP TABLE IF EXISTS `CentrosMedicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CentrosMedicos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidadTurnos` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CentrosMedicos`
--

LOCK TABLES `CentrosMedicos` WRITE;
/*!40000 ALTER TABLE `CentrosMedicos` DISABLE KEYS */;
INSERT INTO `CentrosMedicos` VALUES (1,'Buenos Aires','buenos aires 123','buenosAires.jpg','15'),(2,'Shangai','shangai 123','shangaiCentroMedico.jpg','20'),(3,'Akara','akara 123','akaraCentroMedico.jpg','30');
/*!40000 ALTER TABLE `CentrosMedicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservas`
--

DROP TABLE IF EXISTS `Reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `centroMedico` int(10) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservas`
--

LOCK TABLES `Reservas` WRITE;
/*!40000 ALTER TABLE `Reservas` DISABLE KEYS */;
INSERT INTO `Reservas` VALUES (1,'2785cc2d8cc15885185a6488e44497ef',2,2,'2021-10-27 01:56:29',NULL),(2,'2c1816bd27580db7b2d4194c2a207b9f',1,2,'2021-10-27 01:58:09',NULL),(3,'619c2e51c09db097605dc1680b4ab1e9',1,3,'2021-10-27 02:13:24',1),(4,'41e0c4ac84c3efaafafa7396c9e007d4',1,3,'2021-10-27 02:19:04',1),(5,'96aecb335356e69855e98cdcef63f802',2,3,'2021-10-27 02:22:20',1),(6,'a063b5762984f61d78e7c98f567f88b0',2,3,'2021-10-27 02:22:41',1),(7,'e50f0ae5c2fc483a38e87c54e6b48678',3,3,'2021-10-27 02:23:05',1),(8,'9836c637771bc24d9a92a2ad949f787f',3,3,'2021-10-27 02:26:47',NULL);
/*!40000 ALTER TABLE `Reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `tipo` tinyint(1) unsigned DEFAULT NULL,
  `codigoValidacion` varchar(45) DEFAULT 'validacionManual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `id_cargo` (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Braian','Guzman','1988-09-04','brian_user@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',2,0,NULL),(2,'Elsie ','Vazquez','1998-08-19','elsie@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',1,0,NULL),(3,'Miguel','Vazquez','2018-12-04','miguel@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',0,0,NULL),(4,'alejandro','gonzalez','1996-12-17','saleck@saleck.com','81dc9bdb52d04dc20036dbd8313ed055',1,0,NULL),(58,'Alejandro','Gonzalez','1996-12-17','aledagonale@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',2,NULL,NULL);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelos`
--

DROP TABLE IF EXISTS `modelos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelos` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(15) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `capacidadTotal` int(10) NOT NULL,
  `pasajeros` text CHARACTER SET utf8 NOT NULL,
  `cap_gen` int(11) NOT NULL DEFAULT '0',
  `cap_fam` int(11) NOT NULL DEFAULT '0',
  `cap_sui` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelos`
--

LOCK TABLES `modelos` WRITE;
/*!40000 ALTER TABLE `modelos` DISABLE KEYS */;
INSERT INTO `modelos` VALUES (2,'Calandria','Orbital',300,'1,2,3',200,75,25),(3,'Colibri','Orbital',120,'1,2,3',100,18,2),(4,'Zorzal','BA',100,'2,3',50,0,50),(5,'Carancho','BA',110,'2,3',110,0,0),(6,'Aguilucho','BA',60,'2,3',0,50,10),(7,'Canario','BA',80,'2,3',0,70,10),(8,'Aguila','AA',300,'2,3',200,75,25),(9,'Condor','AA',350,'2,3',300,10,40),(10,'Halcon','AA',200,'3',150,25,25),(11,'Guanaco','AA',100,'3',0,0,100);
/*!40000 ALTER TABLE `modelos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nave_espacial`
--

DROP TABLE IF EXISTS `nave_espacial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nave_espacial` (
  `matricula` varchar(10) CHARACTER SET utf8 NOT NULL,
  `modelo` int(10) NOT NULL,
  PRIMARY KEY (`matricula`),
  KEY `fk_modelo` (`modelo`),
  CONSTRAINT `fk_modelo` FOREIGN KEY (`modelo`) REFERENCES `modelos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nave_espacial`
--

LOCK TABLES `nave_espacial` WRITE;
/*!40000 ALTER TABLE `nave_espacial` DISABLE KEYS */;
INSERT INTO `nave_espacial` VALUES ('O1',2),('O2',2),('O6',2),('O7',2),('O3',3),('O4',3),('O5',3),('O8',3),('O9',3),('BA1',4),('BA2',4),('BA3',4),('BA4',5),('BA5',5),('BA6',5),('BA7',5),('BA10',6),('BA11',6),('BA12',6),('BA8',6),('BA9',6),('BA13',7),('BA14',7),('BA15',7),('BA16',7),('BA17',7),('AA1',8),('AA13',8),('AA17',8),('AA5',8),('AA9',8),('AA10',9),('AA14',9),('AA18',9),('AA2',9),('AA6',9),('AA11',10),('AA15',10),('AA19',10),('AA3',10),('AA7',10),('AA12',11),('AA16',11),('AA4',11),('AA8',11);
/*!40000 ALTER TABLE `nave_espacial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suborbitales`
--

DROP TABLE IF EXISTS `suborbitales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborbitales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dia` varchar(10) NOT NULL,
  `duracion` int(11) NOT NULL,
  `partida` varchar(45) NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborbitales`
--

LOCK TABLES `suborbitales` WRITE;
/*!40000 ALTER TABLE `suborbitales` DISABLE KEYS */;
INSERT INTO `suborbitales` VALUES (1,'Lunes',8,'Buenos aires','09:00:00'),(2,'Lunes',8,'Buenos aires','13:00:00'),(3,'Lunes',8,'Buenos aires','18:00:00'),(4,'Lunes',8,'Ankara','09:00:00'),(5,'Lunes',8,'Ankara','13:00:00'),(6,'Martes',8,'Buenos aires','09:00:00'),(7,'Martes',8,'Buenos aires','13:00:00'),(8,'Martes',8,'Buenos aires','18:00:00'),(9,'Martes',8,'Ankara','09:00:00'),(10,'Martes',8,'Ankara','13:00:00'),(11,'Miercoles',8,'Buenos aires','09:00:00'),(12,'Miercoles',8,'Buenos aires','13:00:00'),(13,'Miercoles',8,'Buenos aires','18:00:00'),(14,'Miercoles',8,'Ankara','09:00:00'),(15,'Miercoles',8,'Ankara','13:00:00'),(16,'Jueves',8,'Buenos aires','09:00:00'),(17,'Jueves',8,'Buenos aires','13:00:00'),(18,'Jueves',8,'Buenos aires','18:00:00'),(19,'Jueves',8,'Ankara','09:00:00'),(20,'Jueves',8,'Ankara','13:00:00'),(21,'Viernes',8,'Buenos aires','09:00:00'),(22,'Viernes',8,'Buenos aires','13:00:00'),(23,'Viernes',8,'Buenos aires','18:00:00'),(24,'Viernes',8,'Ankara','09:00:00'),(25,'Viernes',8,'Ankara','13:00:00'),(26,'Sabado',8,'Buenos aires','09:00:00'),(27,'Sabado',8,'Buenos aires','13:00:00'),(28,'Sabado',8,'Buenos aires','18:00:00'),(29,'Sabado',8,'Buenos aires','21:00:00'),(30,'Sabado',8,'Ankara','09:00:00'),(31,'Sabado',8,'Ankara','13:00:00'),(32,'Sabado',8,'Ankara','18:00:00'),(33,'Sabado',8,'Ankara','21:00:00'),(34,'Domingo',8,'Buenos aires','09:00:00'),(35,'Domingo',8,'Buenos aires','13:00:00'),(36,'Domingo',8,'Buenos aires','18:00:00'),(37,'Domingo',8,'Buenos aires','21:00:00'),(38,'Domingo',8,'Buenos aires','00:00:00'),(39,'Domingo',8,'Ankara','09:00:00'),(40,'Domingo',8,'Ankara','13:00:00'),(41,'Domingo',8,'Ankara','18:00:00'),(42,'Domingo',8,'Ankara','21:00:00'),(43,'Domingo',8,'Ankara','00:00:00');
/*!40000 ALTER TABLE `suborbitales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suborbitales_reservas`
--

DROP TABLE IF EXISTS `suborbitales_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborbitales_reservas` (
  `id` int(10) unsigned NOT NULL,
  `fechayhora` datetime NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `asiento` varchar(10) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `usuario_idx` (`usuario`),
  KEY `matricula_idx` (`matricula`),
  CONSTRAINT `suborbitales_reservas_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `Usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborbitales_reservas`
--

LOCK TABLES `suborbitales_reservas` WRITE;
/*!40000 ALTER TABLE `suborbitales_reservas` DISABLE KEYS */;
/*!40000 ALTER TABLE `suborbitales_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `dia` datetime DEFAULT NULL,
  `duracion` varchar(11) CHARACTER SET utf8 NOT NULL,
  `equipo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `partida` varchar(40) CHARACTER SET utf8 NOT NULL,
  `destino` varchar(40) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_equipo` (`equipo`),
  CONSTRAINT `fk_equipo` FOREIGN KEY (`equipo`) REFERENCES `nave_espacial` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TABLE `tour` (
                                `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
                                `dia` varchar(10) NOT NULL,
                                `duracion` int(11) NOT NULL,
                                `partida` varchar(45) NOT NULL,
                                `horario` time NOT NULL,
                                PRIMARY KEY (`id`),
                                UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Domingo',35,'Buenos aires','09:00:00'),(2,'Domingo',35,'Ankara','10:00:00');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;
-- Dump completed on 2021-11-14 20:05:50
