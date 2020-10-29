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
-- Table structure for table `DESTINATION`
--

DROP TABLE IF EXISTS `DESTINATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DESTINATION` (
  `dest_id` int NOT NULL AUTO_INCREMENT,
  `dest_name` varchar(45) DEFAULT NULL,
  `food_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `air_code` varchar(5) NOT NULL,
  PRIMARY KEY (`dest_id`),
  UNIQUE KEY `dest_id_UNIQUE` (`dest_id`),
  KEY `fk_DESTINATION_FOOD_TYPE1_idx` (`food_id`),
  KEY `fk_DESTINATION_HOTEL_BRAND1_idx` (`hotel_id`),
  KEY `fk_DESTINATION_AIRLINE1_idx` (`air_code`),
  CONSTRAINT `fk_DESTINATION_AIRLINE1` FOREIGN KEY (`air_code`) REFERENCES `AIRLINE` (`air_code`),
  CONSTRAINT `fk_DESTINATION_FOOD_TYPE1` FOREIGN KEY (`food_id`) REFERENCES `FOOD_TYPE` (`food_id`),
  CONSTRAINT `fk_DESTINATION_HOTEL_BRAND1` FOREIGN KEY (`hotel_id`) REFERENCES `HOTEL_BRAND` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESTINATION`
--

LOCK TABLES `DESTINATION` WRITE;
/*!40000 ALTER TABLE `DESTINATION` DISABLE KEYS */;
INSERT INTO `DESTINATION` VALUES (1,'København',10,14,'OZ'),(2,'Muurla',14,17,'HU'),(3,'Starobin',3,20,'LH'),(4,'Daxi',1,14,'OZ'),(5,'Komsomolsk',4,1,'AS'),(6,'Sogcho',8,4,'CZ'),(7,'Los Rastrojos',10,11,'CZ'),(8,'Zhuhu',2,14,'NK'),(9,'Stuttgart',7,19,'BA'),(10,'Nowe Warpno',12,17,'TRA'),(11,'Río Sereno',3,15,'AC'),(12,'Abreus',6,21,'TRA'),(13,'Gradići',3,14,'JO'),(14,'Lyublino',8,9,'HA'),(15,'Champerico',11,2,'AC'),(16,'Hanfeng',1,10,'AC'),(17,'Lincheng',2,8,'OZ'),(18,'Kaesŏng',12,4,'NK'),(19,'Hanjia',4,1,'LH'),(20,'Vorzel’',12,21,'JO'),(21,'El Aguacate',2,10,'B6'),(22,'Buea',4,5,'HU'),(23,'Kebon',8,16,'TG'),(24,'San Marcos',13,3,'AA'),(25,'Karangsari',7,1,'UA'),(26,'Baixo Guandu',15,12,'DL'),(27,'Anle',4,7,'B6'),(28,'Salaspils',12,11,'TG'),(29,'Yanas',12,20,'HA'),(30,'Murça',6,18,'CZ'),(31,'Iwanuma',1,4,'BA'),(32,'Augsburg',9,5,'JO'),(33,'Sātkania',3,8,'TG'),(34,'Kebonan',4,10,'DL'),(35,'Aanislag',3,20,'AA'),(36,'Konstantinovo',12,5,'TG'),(37,'Peuhaq',14,9,'MU'),(38,'Miami Beach',9,14,'TG'),(39,'Polonne',5,17,'AF'),(40,'Sishui',9,17,'JO'),(41,'Duncan',11,21,'OZ'),(42,'Västanfjärd',3,15,'HU'),(43,'Arvidsjaur',4,7,'OZ'),(44,'Buenos Aires',12,15,'TRA'),(45,'Stockholm',7,2,'BA'),(46,'Dhidhdhoo',4,6,'7C'),(47,'Versailles',2,18,'AF'),(48,'Yanjiang',10,8,'HU'),(49,'Juwana',4,13,'UA'),(50,'Xinhua',5,21,'UA'),(51,'Marneuli',6,4,'LH'),(52,'Ágios Spyrídon',2,13,'HU'),(53,'Maguwon',12,5,'AF'),(54,'Mērsrags',6,17,'HU'),(55,'Rennes',10,7,'AC'),(56,'Alcala',8,7,'AF'),(57,'Inđija',12,10,'JO'),(58,'Baizhong',2,13,'AF'),(59,'Artur Nogueira',9,5,'AS'),(60,'Winston Salem',13,20,'TG');
/*!40000 ALTER TABLE `DESTINATION` ENABLE KEYS */;
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

-- Dump completed on 2020-10-28 21:28:20
