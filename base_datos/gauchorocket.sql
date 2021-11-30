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
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'administrador'),(2,'cliente');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centrosmedicos`
--

DROP TABLE IF EXISTS `centrosmedicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centrosmedicos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidadTurnos` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centrosmedicos`
--

LOCK TABLES `centrosmedicos` WRITE;
/*!40000 ALTER TABLE `centrosmedicos` DISABLE KEYS */;
INSERT INTO `centrosmedicos` VALUES (1,'Buenos Aires','buenos aires 123','buenosAires.jpg','15'),(2,'Shangai','shangai 123','shangaiCentroMedico.jpg','20'),(3,'Akara','akara 123','akaraCentroMedico.jpg','30');
/*!40000 ALTER TABLE `centrosmedicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entredestinos`
--

DROP TABLE IF EXISTS `entredestinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entredestinos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `destino` varchar(45) NOT NULL,
  `duracion` int(11) NOT NULL,
  `matricula` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entredestinos`
--

LOCK TABLES `entredestinos` WRITE;
/*!40000 ALTER TABLE `entredestinos` DISABLE KEYS */;
INSERT INTO `entredestinos` VALUES (1,'2021-12-03 12:00:00','Buenos Aires','Luna',9,'AA2'),(2,'2021-12-08 09:00:00','Ankara','europa',50,'BA4');
/*!40000 ALTER TABLE `entredestinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entredestinos_pagos`
--

DROP TABLE IF EXISTS `entredestinos_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entredestinos_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idvuelo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipoAsiento` varchar(45) NOT NULL,
  `numeroAsiento` int(5) NOT NULL,
  `servicio` varchar(45) NOT NULL,
  `id_preferencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vuelo_fk` (`idvuelo`),
  KEY `usuario_fk` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entredestinos_pagos`
--

LOCK TABLES `entredestinos_pagos` WRITE;
/*!40000 ALTER TABLE `entredestinos_pagos` DISABLE KEYS */;
INSERT INTO `entredestinos_pagos` VALUES (1,1,61,'general',1,'gourmet','186927836-21f9bcf9-6389-43bf-a2df-82edfe9c035f'),(2,1,61,'general',133,'standard','186927836-758f21bb-3683-405b-9599-366955f3cd6e'),(3,1,61,'general',1,'standard','186927836-cd26aa55-dd94-4448-a928-7b31dee0b3c7'),(4,1,59,'familiar',4,'standard','186927836-861aaaaf-0b1f-48cb-ada5-bd9c00c3e313');
/*!40000 ALTER TABLE `entredestinos_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `entredestinos_pagos_completo`
--

DROP TABLE IF EXISTS `entredestinos_pagos_completo`;
/*!50001 DROP VIEW IF EXISTS `entredestinos_pagos_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entredestinos_pagos_completo` AS SELECT 
 1 AS `id`,
 1 AS `idvuelo`,
 1 AS `fechayhora`,
 1 AS `desde`,
 1 AS `destino`,
 1 AS `matricula`,
 1 AS `duracion`,
 1 AS `idusuario`,
 1 AS `tipoAsiento`,
 1 AS `numeroAsiento`,
 1 AS `servicio`,
 1 AS `id_preferencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `entredestinos_reservas`
--

DROP TABLE IF EXISTS `entredestinos_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entredestinos_reservas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idvuelo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `tipoAsiento` varchar(45) NOT NULL,
  `numeroAsiento` int(5) NOT NULL,
  `servicio` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_fk` (`idusuario`),
  KEY `vuelo_fk_idx` (`idvuelo`),
  CONSTRAINT `usuario_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vuelo_fk` FOREIGN KEY (`idvuelo`) REFERENCES `entredestinos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entredestinos_reservas`
--

LOCK TABLES `entredestinos_reservas` WRITE;
/*!40000 ALTER TABLE `entredestinos_reservas` DISABLE KEYS */;
INSERT INTO `entredestinos_reservas` VALUES (2,1,59,'familiar',4,'standard'),(4,2,59,'general',4,'standard');
/*!40000 ALTER TABLE `entredestinos_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `entredestinos_reservas_completo`
--

DROP TABLE IF EXISTS `entredestinos_reservas_completo`;
/*!50001 DROP VIEW IF EXISTS `entredestinos_reservas_completo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `entredestinos_reservas_completo` AS SELECT 
 1 AS `id`,
 1 AS `idvuelo`,
 1 AS `fechayhora`,
 1 AS `desde`,
 1 AS `destino`,
 1 AS `matricula`,
 1 AS `duracion`,
 1 AS `idusuario`,
 1 AS `tipoAsiento`,
 1 AS `numeroAsiento`,
 1 AS `servicio`*/;
SET character_set_client = @saved_cs_client;

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
-- Temporary view structure for view `modelosynaves`
--

DROP TABLE IF EXISTS `modelosynaves`;
/*!50001 DROP VIEW IF EXISTS `modelosynaves`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `modelosynaves` AS SELECT 
 1 AS `matricula`,
 1 AS `modelo`,
 1 AS `tipo`,
 1 AS `capacidadTotal`,
 1 AS `cap_gen`,
 1 AS `cap_fam`,
 1 AS `cap_sui`*/;
SET character_set_client = @saved_cs_client;

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
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) NOT NULL,
  `centroMedico` int(10) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `realizado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2785cc2d8cc15885185a6488e44497ef',2,2,'2021-10-27 01:56:29',NULL),(2,'2c1816bd27580db7b2d4194c2a207b9f',1,2,'2021-10-27 01:58:09',NULL),(3,'619c2e51c09db097605dc1680b4ab1e9',1,3,'2021-10-27 02:13:24',1),(4,'41e0c4ac84c3efaafafa7396c9e007d4',1,3,'2021-10-27 02:19:04',1),(5,'96aecb335356e69855e98cdcef63f802',2,3,'2021-10-27 02:22:20',1),(6,'a063b5762984f61d78e7c98f567f88b0',2,3,'2021-10-27 02:22:41',1),(7,'e50f0ae5c2fc483a38e87c54e6b48678',3,3,'2021-10-27 02:23:05',1),(8,'9836c637771bc24d9a92a2ad949f787f',3,3,'2021-10-27 02:26:47',NULL),(9,'92011090c3eaecbdba0f6f82444328dd',1,58,'2021-11-26 00:00:00',1),(10,'94db17d38acc0cf8a0f2ca54763f1883',1,58,'2021-11-26 00:00:00',1),(11,'278357d360a306b5dd590b167bfab4ce',1,58,'2021-11-26 00:00:00',NULL),(12,'c984e1c5f4a7ee0b7e01452c08b6746e',1,58,'2021-11-26 00:00:00',NULL),(13,'13f01f4dba2f6ecf5de8402c74b37d50',1,58,'2021-11-26 00:00:00',NULL),(14,'f24dbe9e73f5b66b6335bebffd0e113b',1,58,'2021-11-26 00:00:00',NULL),(15,'64c61de864243a2d64f8ff020b76f88f',1,58,'2021-11-26 00:00:00',NULL),(16,'de7fd07e77a8e5120b0eaf2fa2d25886',1,58,'2021-11-26 00:00:00',NULL),(17,'723d839f5b31d6b6fa67ce00495411ff',1,58,'2021-11-26 00:00:00',NULL),(18,'ab348c859e20e4666e9eb4ee2aec0056',1,58,'2021-11-26 00:00:00',1),(19,'c7da9b052cdaed12afd7cf87a4ce3fc1',1,59,'2021-11-03 00:00:00',1),(20,'447ef2e5dbea16c221b9d5611316673a',1,59,'2021-11-03 00:00:00',1),(25,'86c8d74b9dc19019ba6df28725d1f05d',3,61,'2021-11-30 10:30:00',1);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
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
-- Table structure for table `suborbitales_pagos`
--

DROP TABLE IF EXISTS `suborbitales_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborbitales_pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `usuario` int(11) NOT NULL,
  `tipoAsiento` varchar(45) NOT NULL,
  `numeroAsiento` int(11) NOT NULL,
  `servicio` varchar(45) NOT NULL,
  `id_preferencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborbitales_pagos`
--

LOCK TABLES `suborbitales_pagos` WRITE;
/*!40000 ALTER TABLE `suborbitales_pagos` DISABLE KEYS */;
INSERT INTO `suborbitales_pagos` VALUES (13,'2021-11-29 09:00:00','Buenos aires','O9',61,'general',4,'gourmet','186927836-e0fe3ddc-1c1f-4c9d-af82-b18f9c6dc28a'),(14,'2021-11-29 09:00:00','Buenos aires','O9',61,'general',6,'gourmet','186927836-71175527-51f0-48c5-a8a8-d994460d6181'),(15,'0000-00-00 00:00:00','Buenos Aires','AA2',61,'general',226,'standard','186927836-8339f997-587d-41d2-b1fb-7e6058b58bff');
/*!40000 ALTER TABLE `suborbitales_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suborbitales_reservas`
--

DROP TABLE IF EXISTS `suborbitales_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suborbitales_reservas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `tipoAsiento` varchar(45) DEFAULT NULL,
  `numeroAsiento` int(11) DEFAULT NULL,
  `servicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `usuario_idx` (`usuario`),
  KEY `matricula_idx` (`matricula`),
  CONSTRAINT `suborbitales_reservas_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suborbitales_reservas`
--

LOCK TABLES `suborbitales_reservas` WRITE;
/*!40000 ALTER TABLE `suborbitales_reservas` DISABLE KEYS */;
INSERT INTO `suborbitales_reservas` VALUES (65,'2021-11-29 09:00:00','Buenos aires','O9',NULL,NULL,NULL,NULL),(66,'2021-11-29 09:00:00','Buenos aires','O9',59,'general',4,'gourmet'),(67,'1970-01-01 00:00:00','','O7',NULL,NULL,NULL,NULL),(68,'2021-11-29 09:00:00','Buenos aires','O9',1,'general',6,'gourmet'),(69,'2021-12-06 09:00:00','Ankara','O2',NULL,NULL,NULL,NULL),(72,'2021-12-06 09:00:00','Ankara','O2',61,'general',15,'gourmet'),(73,'2021-12-06 09:00:00','Ankara','O2',61,'general',14,'gourmet'),(74,'2021-12-06 09:00:00','Ankara','O2',61,'general',13,'gourmet'),(75,'2021-12-06 09:00:00','Ankara','O2',61,'general',12,'gourmet'),(76,'2021-12-06 09:00:00','Ankara','O2',61,'general',11,'gourmet'),(77,'2021-12-06 09:00:00','Ankara','O2',61,'general',10,'gourmet');
/*!40000 ALTER TABLE `suborbitales_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dia` varchar(10) NOT NULL,
  `duracion` int(11) NOT NULL,
  `partida` varchar(45) NOT NULL,
  `horario` time NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Domingo',35,'Buenos aires','09:00:00'),(2,'Domingo',35,'Ankara','10:00:00');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_pagos`
--

DROP TABLE IF EXISTS `tour_pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_pagos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `tipoAsiento` varchar(45) DEFAULT NULL,
  `numeroAsiento` int(11) DEFAULT NULL,
  `servicio` varchar(45) DEFAULT NULL,
  `id_preferencia` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `tour_pagos_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_pagos`
--

LOCK TABLES `tour_pagos` WRITE;
/*!40000 ALTER TABLE `tour_pagos` DISABLE KEYS */;
INSERT INTO `tour_pagos` VALUES (12,'2021-12-05 09:00:00','Buenos aires','AA4',61,'suite',5,'standard','186927836-62d6d56c-bfd2-492f-baac-31d77cded6b5');
/*!40000 ALTER TABLE `tour_pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_reservas`
--

DROP TABLE IF EXISTS `tour_reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_reservas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `tipoAsiento` varchar(45) DEFAULT NULL,
  `numeroAsiento` int(11) DEFAULT NULL,
  `servicio` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `tour_reservas_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_reservas`
--

LOCK TABLES `tour_reservas` WRITE;
/*!40000 ALTER TABLE `tour_reservas` DISABLE KEYS */;
INSERT INTO `tour_reservas` VALUES (15,'2021-12-05 09:00:00','Buenos aires','AA4',NULL,NULL,NULL,NULL),(16,'2021-12-05 09:00:00','Buenos aires','AA4',59,'suite',5,'standard'),(17,'2021-12-12 10:00:00','Ankara','AA4',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tour_reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Braian','Guzman','1988-09-04','brian_user@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',2,0,NULL),(2,'Elsie ','Vazquez','1998-08-19','elsie@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',1,0,NULL),(3,'Miguel','Vazquez','2018-12-04','miguel@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',0,0,NULL),(4,'alejandro','gonzalez','1996-12-17','saleck@saleck.com','81dc9bdb52d04dc20036dbd8313ed055',1,0,NULL),(58,'Alejandro','Gonzalez','1996-12-17','aledagonale@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',2,3,NULL),(59,'alejandro','gonzalez','1996-12-17','boldar3@gmail.com','e10adc3949ba59abbe56e057f20f883e',2,3,NULL),(61,'Leandro','Gomez','1997-01-25','leandro.ariel.gomez1@gmail.com','827ccb0eea8a706c4c34a16891f84e7b',2,2,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
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

--
-- Final view structure for view `entredestinos_pagos_completo`
--

/*!50001 DROP VIEW IF EXISTS `entredestinos_pagos_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `entredestinos_pagos_completo` AS select `edp`.`id` AS `id`,`edp`.`idvuelo` AS `idvuelo`,`ed`.`fechayhora` AS `fechayhora`,`ed`.`desde` AS `desde`,`ed`.`destino` AS `destino`,`ed`.`matricula` AS `matricula`,`ed`.`duracion` AS `duracion`,`edp`.`idusuario` AS `idusuario`,`edp`.`tipoAsiento` AS `tipoAsiento`,`edp`.`numeroAsiento` AS `numeroAsiento`,`edp`.`servicio` AS `servicio`,`edp`.`id_preferencia` AS `id_preferencia` from (`entredestinos_pagos` `edp` join `entredestinos` `ed` on((`edp`.`idvuelo` = `ed`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `entredestinos_reservas_completo`
--

/*!50001 DROP VIEW IF EXISTS `entredestinos_reservas_completo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `entredestinos_reservas_completo` AS select `edr`.`id` AS `id`,`edr`.`idvuelo` AS `idvuelo`,`ed`.`fechayhora` AS `fechayhora`,`ed`.`desde` AS `desde`,`ed`.`destino` AS `destino`,`ed`.`matricula` AS `matricula`,`ed`.`duracion` AS `duracion`,`edr`.`idusuario` AS `idusuario`,`edr`.`tipoAsiento` AS `tipoAsiento`,`edr`.`numeroAsiento` AS `numeroAsiento`,`edr`.`servicio` AS `servicio` from (`entredestinos_reservas` `edr` join `entredestinos` `ed` on((`edr`.`idvuelo` = `ed`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `modelosynaves`
--

/*!50001 DROP VIEW IF EXISTS `modelosynaves`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `modelosynaves` AS select `ne`.`matricula` AS `matricula`,`m`.`modelo` AS `modelo`,`m`.`tipo` AS `tipo`,`m`.`capacidadTotal` AS `capacidadTotal`,`m`.`cap_gen` AS `cap_gen`,`m`.`cap_fam` AS `cap_fam`,`m`.`cap_sui` AS `cap_sui` from (`nave_espacial` `ne` join `modelos` `m` on((`m`.`id` = `ne`.`modelo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 12:10:18
