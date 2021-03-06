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
-- Table structure for table `RECOMMENDED_DEST`
--

DROP TABLE IF EXISTS `RECOMMENDED_DEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECOMMENDED_DEST` (
  `member_id` int NOT NULL,
  `dest_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`dest_id`),
  KEY `fk_REC_DEST_DESTINATION1_idx` (`dest_id`),
  CONSTRAINT `fk_REC_DEST_DESTINATION1` FOREIGN KEY (`dest_id`) REFERENCES `DESTINATION` (`dest_id`),
  CONSTRAINT `fk_REC_DEST_MEMBER1` FOREIGN KEY (`member_id`) REFERENCES `MEMBER` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECOMMENDED_DEST`
--

LOCK TABLES `RECOMMENDED_DEST` WRITE;
/*!40000 ALTER TABLE `RECOMMENDED_DEST` DISABLE KEYS */;
INSERT INTO `RECOMMENDED_DEST` VALUES (58,1),(71,1),(97,1),(13,3),(17,3),(21,3),(34,3),(58,3),(59,3),(83,3),(1,4),(17,4),(54,4),(79,4),(80,4),(96,4),(12,5),(42,5),(47,5),(87,5),(94,5),(5,6),(11,6),(37,6),(48,6),(14,7),(15,7),(20,7),(57,7),(7,8),(13,8),(20,8),(42,8),(48,8),(63,8),(65,8),(54,9),(75,9),(17,10),(69,10),(93,10),(18,11),(91,11),(15,12),(40,12),(54,12),(42,13),(67,13),(93,13),(5,14),(20,14),(43,14),(66,14),(20,15),(55,15),(52,16),(86,16),(5,17),(60,17),(73,17),(79,17),(81,17),(52,18),(17,19),(26,19),(99,19),(15,20),(21,20),(88,20),(48,21),(56,22),(57,22),(68,22),(12,23),(26,23),(31,23),(49,23),(80,23),(5,24),(9,24),(11,24),(10,25),(21,25),(46,25),(100,25),(72,26),(80,26),(12,27),(99,27),(29,28),(32,28),(48,28),(57,28),(84,28),(87,28),(44,29),(34,30),(58,30),(83,30),(86,30),(43,31),(96,31),(12,32),(14,32),(13,33),(23,33),(30,33),(34,33),(45,33),(53,33),(15,34),(18,34),(23,34),(97,34),(98,34),(31,35),(1,36),(67,36),(75,36),(93,36),(14,37),(24,37),(58,37),(69,37),(72,37),(76,37),(10,38),(17,38),(17,39),(21,39),(30,39),(91,39),(17,40),(55,40),(67,40),(75,40),(91,41),(19,42),(37,42),(53,42),(60,42),(73,42),(46,43),(5,44),(56,44),(17,45),(46,45),(84,46),(47,47),(52,47),(66,48),(78,48),(91,48),(97,48),(13,49),(15,49),(34,49),(36,49),(44,49),(88,49),(91,49),(3,50),(10,50),(61,50),(100,50),(13,51),(49,51),(56,51),(63,51),(13,52),(95,52),(23,53),(47,53),(53,53),(68,53),(76,53),(79,53),(18,54),(73,54),(11,55),(31,55),(50,55),(27,57),(48,57),(61,57),(89,57),(28,58),(39,58),(54,58),(19,59),(25,59),(78,59),(79,59),(86,59),(23,60),(34,60),(35,60);
/*!40000 ALTER TABLE `RECOMMENDED_DEST` ENABLE KEYS */;
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

-- Dump completed on 2020-10-28 21:28:41
