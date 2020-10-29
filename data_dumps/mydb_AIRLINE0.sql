-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: mysql-test01.cw3pi1ekgozo.us-east-1.rds.amazonaws.com    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.20

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `AIRLINE`
--

DROP TABLE IF EXISTS `AIRLINE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AIRLINE` (
  `air_code` varchar(5) NOT NULL,
  `air_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`air_code`),
  UNIQUE KEY `air_id_UNIQUE` (`air_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AIRLINE`
--

LOCK TABLES `AIRLINE` WRITE;
/*!40000 ALTER TABLE `AIRLINE` DISABLE KEYS */;
INSERT INTO `AIRLINE` VALUES ('7C','Jeju Air Co Ltd.'),('AA','American Airlines Inc.'),('AC','Air Canada'),('AF','Compagnie Natl Air France'),('AS','Alaska Airlines Inc.'),('B6','JetBlue Airways'),('BA','British Airways Plc'),('CA','Air China'),('CZ','China Southern Airlines'),('DL','Delta Air Lines Inc.'),('HA','Hawaiian Airlines Inc.'),('HU','Hainan Airlines Company Limited'),('JO','Jalways Co. Ltd.'),('LH','Lufthansa German Airlines'),('MU','China Eastern Airlines'),('NK','Spirit Air Lines'),('OZ','Asiana Airlines Inc.'),('TG','Thai Airways International Ltd.'),('TRA','Aeromexico Travel'),('UA','United Air Lines Inc.'),('WN','Southwest Airlines Co.');
/*!40000 ALTER TABLE `AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-28 21:28:34
