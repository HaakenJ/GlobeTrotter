CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
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
-- Table structure for table `MEMBER`
--

DROP TABLE IF EXISTS `MEMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MEMBER` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `member_fname` varchar(45) DEFAULT NULL,
  `member_lname` varchar(45) DEFAULT NULL,
  `member_city` varchar(45) DEFAULT NULL,
  `member_country` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `member_id_UNIQUE` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'Marge','Lorent','Bengtsfors','Sw'),(2,'Roi','Cosford','Bilovods\'k','Uk'),(3,'Hattie','Pittem','Kuanping','Ch'),(4,'Andrei','Stewartson','Bulasa','Ph'),(5,'Dougy','Fraczek','Targanice','Po'),(6,'Brigid','Sellner','Göteborg','Sw'),(7,'Pinchas','John','Duishan','Ch'),(8,'Haven','Cowlin','Samran','Th'),(9,'Quillan','Novic','Caridad','Ph'),(10,'Sari','Seaton','San Francisco','Co'),(11,'Valencia','Littleover','Dębica','Po'),(12,'Halsy','Markus','Wagar','Su'),(13,'Thacher','Woodward','Vyksa','Ru'),(14,'Demeter','Straniero','Žamberk','Cz'),(15,'Joe','Crust','Perpignan','Fr'),(16,'Parrnell','Sansun','Barão de São Miguel','Po'),(17,'Melodie','Greenhowe','Arcueil','Fr'),(18,'Eugen','Mapp','Saronída','Gr'),(19,'Ty','Wheelband','Puerto Berrío','Co'),(20,'Christal','Stenhouse','Kallífytos','Gr'),(21,'Merrel','Arnaudet','Nieborów','Po'),(22,'Mersey','Kilshaw','Rowokangkung','In'),(23,'Kevina','Zieme','Bulod','Ph'),(24,'Dedra','Trusler','Al Qārah','Sa'),(25,'Berte','Alfwy','Polovinnoye','Ru'),(26,'Rosmunda','Shea','Omaha','Un'),(27,'Shantee','Kendall','Haczów','Po'),(28,'Lind','Hardaker','‘Alāqahdārī Gēlān','Af'),(29,'Hebert','Ambrosi','Issy-les-Moulineaux','Fr'),(30,'Nancie','Gepheart','Aytos','Bu'),(31,'Tarrah','Dawber','Neklyudovo','Ru'),(32,'Mildrid','Hackin','Xiayang','Ch'),(33,'Marwin','Lanphier','Sadov','Cz'),(34,'Kizzee','Bygrove','Amapala','Ho'),(35,'Clara','Rafe','Tawa','Ch'),(36,'Rochella','Margiotta','Enriquillo','Do'),(37,'Hamish','Sheridan','Lingkou','Ch'),(38,'Geordie','Dandie','Andekantor','In'),(39,'Leticia','McCauley','Oslo','No'),(40,'Valerie','Filchagin','Shah Alam','Ma'),(41,'Linzy','Joney','Shabo','Uk'),(42,'Conni','Ratnege','Ţayyibat al Imām','Sy'),(43,'Jedd','Blueman','Vilyuchinsk','Ru'),(44,'Breena','Skitral','Hongos','Pe'),(45,'Helyn','Loude','Kalix','Sw'),(46,'Read','Bett','Urung','In'),(47,'Sibelle','Foggarty','Gaoling','Ch'),(48,'Conni','Sayers','Sijihong','Ch'),(49,'Charley','Impy','Mengdadazhuang','Ch'),(50,'Jany','Matteuzzi','Güiria','Ve'),(51,'Rolph','Bourdel','Hutou','Ch'),(52,'Kermy','Cullingford','Mardīān','Af'),(53,'Crawford','Fist','Rudnya','Ru'),(54,'Mathian','Camelli','Saint-Malo','Fr'),(55,'Neda','Clohessy','Basseterre','Sa'),(56,'Merla','Eatherton','Katagum','Ni'),(57,'Josy','McDonogh','Saurama','Pe'),(58,'Sascha','Canwell','El Progreso','Ho'),(59,'Aurie','Ladon','Tancheng','Ch'),(60,'Stoddard','Kupec','Choropampa','Pe'),(61,'Bent','Lochhead','San Agustin','Ph'),(62,'Cele','Truran','Dahe','Ch'),(63,'Myca','Burke','Kultuk','Ru'),(64,'Dion','Cecchi','Tsurugi-asahimachi','Ja'),(65,'Robinette','Bathow','Kota Kinabalu','Ma'),(66,'Sybyl','Futter','Tianhe','Ch'),(67,'Link','Handley','Núi Đối','Vi'),(68,'Cyndi','Shaefer','Santa María de Ipire','Ve'),(69,'Barb','Bursnell','Lübeck','Ge'),(70,'Cal','Enocksson','Tahoua','Ni'),(71,'Brigham','Flye','Lalagsan','Ph'),(72,'Ruperta','Wayland','Igarapé Miri','Br'),(73,'Joana','Wintle','Bergen','No'),(74,'Chrystel','Playfair','Muriaé','Br'),(75,'Ugo','Copnell','Telaga','In'),(76,'Prissie','Chadd','Dachun','Ch'),(77,'Raymond','McKea','Rochester','Un'),(78,'Lucille','Brightie','Karlivka','Uk'),(79,'Kiah','d\' Elboux','Campo Alegre','Br'),(80,'Corney','Lysaght','Montréal-Ouest','Ca'),(81,'Ortensia','Swindon','Huangcun','Ch'),(82,'Marijn','Vanyutin','Qinggang','Ch'),(83,'Claudius','Tocher','Misawa','Ja'),(84,'Maurits','Whorlow','Stratford','Ca'),(85,'Ally','Couttes','Keti Bandar','Pa'),(86,'Chip','Pauly','Dongping','Ch'),(87,'Walther','Giorgio','Złotniki Kujawskie','Po'),(88,'Orbadiah','Bickerton','Manzë','Al'),(89,'Francoise','Scorer','Olds','Ca'),(90,'Melania','Prescott','Kaberamaido','Ug'),(91,'Phyllys','Bradwell','Mueang Suang','Th'),(92,'Ernest','Wehden','Gotemba','Ja'),(93,'Patrizio','Ickovicz','Jāsk','Ir'),(94,'Jordan','Loveard','La Falda','Ar'),(95,'Rudolph','Trulock','Puma','Ta'),(96,'Delmar','Wellbank','Cerro','Cu'),(97,'Dalia','Stubbert','Balzar','Ec'),(98,'Jerrie','Newstead','Baklashi','Ru'),(99,'Cheri','Ladd','Aoluguya Ewenke Minzu','Ch'),(100,'Dewitt','Vedyashkin','Pasirtujuhpuluh','In');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
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

-- Dump completed on 2020-10-27 16:01:42
