CREATE DATABASE  IF NOT EXISTS `GauchoRocket` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `GauchoRocket`;
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `id_cargo` (`idCargo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` VALUES (1,'Braian','Guzman','1988-09-04','brian_user@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',2,0),(2,'Elsie ','Vazquez','1998-08-19','elsie@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',1,0),(3,'Miguel','Vazquez','2018-12-04','miguel@hotmail.com','81dc9bdb52d04dc20036dbd8313ed055',0,0),(4,'alejandro','gonzalez','1996-12-17','saleck@saleck.com','81dc9bdb52d04dc20036dbd8313ed055',1,0);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-26 23:59:48
