-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: mysql-test01.cw3pi1ekgozo.us-east-1.rds.amazonaws.com    Database: globetrotter
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
INSERT INTO `AIRLINE` VALUES ('7C','Jeju Air Co Ltd.'),('AA','American Airlines'),('AC','Air Canada'),('AF','Air France'),('AS','Alaska Airlines'),('B6','JetBlue Airways'),('BA','British Airways'),('CA','Air China'),('CZ','China Southern'),('DL','Delta Airlines'),('HA','Hawaiian'),('HU','Hainan Airlines'),('JO','Jalways Co. Ltd.'),('LH','Lufthansa'),('MU','China Eastern'),('NK','Spirit Air Lines'),('OZ','Asiana'),('TG','Thai Airways'),('TRA','Aeromexico'),('UA','United'),('WN','Southwest');
/*!40000 ALTER TABLE `AIRLINE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DESIRED_DEST`
--

DROP TABLE IF EXISTS `DESIRED_DEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DESIRED_DEST` (
  `member_id` int NOT NULL,
  `dest_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`dest_id`),
  KEY `fk_WANT_TO_GO_DESTINATION1_idx` (`dest_id`),
  CONSTRAINT `fk_WANT_TO_GO_DESTINATION1` FOREIGN KEY (`dest_id`) REFERENCES `DESTINATION` (`dest_id`),
  CONSTRAINT `fk_WANT_TO_GO_MEMBER1` FOREIGN KEY (`member_id`) REFERENCES `MEMBER` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DESIRED_DEST`
--

LOCK TABLES `DESIRED_DEST` WRITE;
/*!40000 ALTER TABLE `DESIRED_DEST` DISABLE KEYS */;
INSERT INTO `DESIRED_DEST` VALUES (15,1),(30,1),(37,1),(38,1),(44,1),(50,1),(72,1),(75,1),(88,1),(95,1),(19,2),(25,2),(61,2),(76,2),(59,3),(67,3),(86,3),(92,3),(4,4),(27,4),(37,4),(44,4),(45,4),(95,4),(1,5),(7,5),(81,5),(32,6),(46,6),(51,6),(66,6),(69,6),(78,6),(11,7),(22,7),(25,7),(45,7),(80,7),(98,7),(4,8),(5,8),(40,8),(54,8),(71,8),(24,9),(33,9),(42,9),(49,9),(70,9),(11,10),(23,10),(29,10),(36,10),(50,10),(70,10),(95,10),(16,11),(50,11),(70,11),(80,11),(91,11),(22,12),(42,12),(51,12),(93,12),(4,13),(42,13),(58,13),(3,14),(10,14),(13,14),(44,14),(51,14),(5,15),(7,15),(20,15),(54,15),(65,15),(19,16),(22,16),(37,16),(65,16),(68,16),(70,16),(74,16),(77,16),(8,17),(18,17),(22,17),(35,17),(36,17),(45,17),(48,17),(57,17),(85,17),(86,17),(95,17),(97,17),(39,18),(45,18),(51,18),(3,19),(7,19),(16,19),(33,19),(74,19),(99,19),(6,20),(15,20),(36,20),(48,20),(53,20),(54,20),(93,20),(5,21),(52,21),(3,22),(14,22),(41,22),(47,22),(66,22),(75,22),(86,22),(2,23),(9,23),(31,23),(42,23),(45,23),(53,23),(65,23),(32,24),(37,24),(66,24),(85,24),(5,25),(14,25),(22,25),(46,25),(56,25),(58,25),(74,25),(85,25),(99,25),(2,26),(24,26),(30,26),(48,26),(52,26),(73,26),(3,27),(33,27),(45,27),(48,27),(65,27),(6,28),(22,28),(26,28),(32,28),(43,28),(44,28),(55,28),(59,28),(82,28),(16,29),(17,29),(35,29),(40,29),(56,29),(59,29),(65,29),(66,29),(90,29),(3,30),(23,30),(25,30),(42,30),(48,30),(52,30),(10,31),(16,31),(28,31),(31,31),(34,31),(48,31),(55,31),(78,31),(6,32),(66,32),(77,32),(79,32),(96,32),(2,33),(12,33),(33,33),(37,33),(55,33),(65,33),(69,33),(70,33),(71,33),(74,33),(79,33),(3,34),(15,34),(19,34),(20,34),(40,34),(43,34),(70,34),(75,34),(81,34),(12,35),(20,35),(49,35),(58,35),(83,35),(15,36),(16,36),(50,36),(52,36),(60,36),(76,36),(13,37),(52,37),(58,37),(69,37),(78,37),(84,37),(91,37),(3,38),(17,38),(18,38),(41,38),(68,38),(69,38),(77,38),(98,38),(12,39),(20,39),(50,39),(51,39),(54,39),(79,39),(80,39),(85,39),(97,39),(23,40),(33,40),(45,40),(20,41),(41,41),(63,41),(64,41),(68,41),(17,42),(26,42),(31,42),(34,42),(54,42),(61,42),(63,42),(79,42),(86,42),(96,42),(11,43),(83,43),(88,43),(89,43),(91,43),(93,43),(8,44),(10,44),(20,44),(23,44),(49,44),(75,44),(85,44),(23,45),(26,45),(35,45),(36,45),(38,45),(57,45),(4,46),(16,46),(18,46),(28,46),(30,46),(45,46),(50,46),(75,46),(88,46),(90,46),(95,46),(56,47),(6,48),(19,48),(26,48),(27,48),(53,48),(61,48),(85,48),(96,48),(2,49),(24,49),(26,49),(27,49),(67,49),(71,49),(82,49),(90,49),(93,49),(8,50),(53,50),(66,50),(70,50),(96,50),(99,50),(3,51),(16,51),(21,51),(27,51),(28,51),(37,51),(55,51),(92,51),(3,52),(22,52),(36,52),(53,52),(55,52),(92,52),(13,53),(17,53),(25,53),(63,53),(74,53),(80,53),(87,53),(91,53),(99,53),(100,53),(6,54),(10,54),(11,54),(16,54),(30,54),(39,54),(44,54),(71,54),(11,55),(15,55),(28,55),(45,55),(16,56),(29,56),(52,56),(53,56),(63,56),(92,56),(97,56),(7,57),(11,57),(26,57),(31,57),(94,57),(6,58),(8,58),(17,58),(33,58),(37,58),(39,58),(50,58),(75,58),(81,58),(85,58),(99,58),(19,59),(46,59),(47,59),(53,59),(60,59),(73,59),(76,59),(8,60),(29,60),(40,60),(92,60),(98,60);
/*!40000 ALTER TABLE `DESIRED_DEST` ENABLE KEYS */;
UNLOCK TABLES;

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
  `highlight_id` int DEFAULT NULL,
  PRIMARY KEY (`dest_id`),
  UNIQUE KEY `dest_id_UNIQUE` (`dest_id`),
  KEY `fk_DESTINATION_FOOD_TYPE1_idx` (`food_id`),
  KEY `fk_DESTINATION_HOTEL_BRAND1_idx` (`hotel_id`),
  KEY `fk_DESTINATION_AIRLINE1_idx` (`air_code`),
  KEY `DESTINATION` (`highlight_id`),
  CONSTRAINT `DESTINATION_ibfk_1` FOREIGN KEY (`highlight_id`) REFERENCES `HIGHLIGHT` (`highlight_id`) ON DELETE CASCADE,
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
INSERT INTO `DESTINATION` VALUES (1,'København',10,14,'OZ',2),(2,'Muurla',14,17,'HU',3),(3,'Starobin',3,20,'LH',4),(4,'Daxi',1,14,'OZ',5),(5,'Komsomolsk',4,1,'AS',6),(6,'Sogcho',8,4,'CZ',7),(7,'Los Rastrojos',10,11,'CZ',8),(8,'Zhuhu',2,14,'NK',9),(9,'Stuttgart',7,19,'BA',10),(10,'Nowe Warpno',12,17,'TRA',11),(11,'Río Sereno',3,15,'AC',12),(12,'Abreus',6,21,'TRA',13),(13,'Gradići',3,14,'JO',14),(14,'Lyublino',8,9,'HA',15),(15,'Champerico',11,2,'AC',16),(16,'Hanfeng',1,10,'AC',17),(17,'Lincheng',2,8,'OZ',1),(18,'Kaesŏng',12,4,'NK',2),(19,'Hanjia',4,1,'LH',3),(20,'Vorzel’',12,21,'JO',4),(21,'El Aguacate',2,10,'B6',5),(22,'Buea',4,5,'HU',6),(23,'Kebon',8,16,'TG',7),(24,'San Marcos',13,3,'AA',8),(25,'Karangsari',7,1,'UA',9),(26,'Baixo Guandu',15,12,'DL',10),(27,'Anle',4,7,'B6',11),(28,'Salaspils',12,11,'TG',12),(29,'Yanas',12,20,'HA',13),(30,'Murça',6,18,'CZ',14),(31,'Iwanuma',1,4,'BA',15),(32,'Augsburg',9,5,'JO',16),(33,'Sātkania',3,8,'TG',17),(34,'Kebonan',4,10,'DL',1),(35,'Aanislag',3,20,'AA',2),(36,'Konstantinovo',12,5,'TG',3),(37,'Peuhaq',14,9,'MU',4),(38,'Miami Beach',9,14,'TG',5),(39,'Polonne',5,17,'AF',6),(40,'Sishui',9,17,'JO',7),(41,'Duncan',11,21,'OZ',8),(42,'Västanfjärd',3,15,'HU',9),(43,'Arvidsjaur',4,7,'OZ',10),(44,'Buenos Aires',12,15,'TRA',11),(45,'Stockholm',7,2,'BA',12),(46,'Dhidhdhoo',4,6,'7C',13),(47,'Versailles',2,18,'AF',14),(48,'Yanjiang',10,8,'HU',15),(49,'Juwana',4,13,'UA',16),(50,'Xinhua',5,21,'UA',17),(51,'Marneuli',6,4,'LH',1),(52,'Ágios Spyrídon',2,13,'HU',2),(53,'Maguwon',12,5,'AF',3),(54,'Mērsrags',6,17,'HU',4),(55,'Rennes',10,7,'AC',5),(56,'Alcala',8,7,'AF',6),(57,'Inđija',12,10,'JO',7),(58,'Baizhong',2,13,'AF',8),(59,'Artur Nogueira',9,5,'AS',9),(60,'Winston Salem',13,20,'TG',10);
/*!40000 ALTER TABLE `DESTINATION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEST_ITEM`
--

DROP TABLE IF EXISTS `DEST_ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEST_ITEM` (
  `item_id` int NOT NULL,
  `dest_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`dest_id`),
  KEY `fk_DEST_ITEM_ITEM_idx` (`item_id`),
  KEY `fk_DEST_ITEM_DESTINATION1_idx` (`dest_id`),
  CONSTRAINT `fk_DEST_ITEM_DESTINATION1` FOREIGN KEY (`dest_id`) REFERENCES `DESTINATION` (`dest_id`),
  CONSTRAINT `fk_DEST_ITEM_ITEM` FOREIGN KEY (`item_id`) REFERENCES `ITEM` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEST_ITEM`
--

LOCK TABLES `DEST_ITEM` WRITE;
/*!40000 ALTER TABLE `DEST_ITEM` DISABLE KEYS */;
INSERT INTO `DEST_ITEM` VALUES (42,20),(42,27),(42,44),(42,48),(42,49),(43,1),(43,6),(43,21),(43,31),(44,10),(44,13),(44,21),(44,34),(44,52),(44,57),(45,4),(45,9),(45,10),(45,35),(45,46),(45,52),(45,55),(45,60),(46,25),(46,45),(46,52),(47,2),(47,7),(47,43),(47,50),(48,9),(48,22),(48,36),(48,40),(49,8),(49,18),(49,35),(49,56),(50,15),(50,17),(50,32),(50,33),(50,45),(50,59),(51,5),(51,26),(51,51),(51,58),(52,10),(52,19),(52,20),(52,36),(52,44),(52,49),(53,11),(53,26),(53,37),(54,54),(54,58),(55,7),(55,12),(55,38),(55,53),(55,54),(56,7),(56,22),(56,23),(56,24),(56,47),(56,52),(57,20),(57,29),(57,33),(57,37),(57,47),(57,48),(58,3),(58,14),(58,27),(58,32),(58,40),(59,30),(60,1),(60,2),(60,11),(60,14),(60,16),(60,25),(60,42),(60,47),(60,58),(61,15),(61,24),(61,28),(61,35),(61,39),(61,41),(61,46);
/*!40000 ALTER TABLE `DEST_ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOOD_TYPE`
--

DROP TABLE IF EXISTS `FOOD_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FOOD_TYPE` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  UNIQUE KEY `food_id_UNIQUE` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOOD_TYPE`
--

LOCK TABLES `FOOD_TYPE` WRITE;
/*!40000 ALTER TABLE `FOOD_TYPE` DISABLE KEYS */;
INSERT INTO `FOOD_TYPE` VALUES (1,'spicy'),(2,'soup'),(3,'noodles'),(4,'curry'),(5,'pizza'),(6,'burgers'),(7,'sausage'),(8,'beer'),(9,'wine'),(10,'vegetarian'),(11,'vegan'),(12,'beef'),(13,'seafood'),(14,'pork'),(15,'lamb');
/*!40000 ALTER TABLE `FOOD_TYPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HIGHLIGHT`
--

DROP TABLE IF EXISTS `HIGHLIGHT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HIGHLIGHT` (
  `highlight_id` int NOT NULL AUTO_INCREMENT,
  `highlight_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`highlight_id`),
  UNIQUE KEY `highlight_id_UNIQUE` (`highlight_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HIGHLIGHT`
--

LOCK TABLES `HIGHLIGHT` WRITE;
/*!40000 ALTER TABLE `HIGHLIGHT` DISABLE KEYS */;
INSERT INTO `HIGHLIGHT` VALUES (1,'beaches'),(2,'mountains'),(3,'hiking'),(4,'swimming'),(5,'music'),(6,'food'),(7,'forests'),(8,'jungles'),(9,'desert'),(10,'musicals'),(11,'coral reefs'),(12,'surfing'),(13,'skiing'),(14,'views'),(15,'art'),(16,'museums'),(17,'history');
/*!40000 ALTER TABLE `HIGHLIGHT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HOTEL_BRAND`
--

DROP TABLE IF EXISTS `HOTEL_BRAND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HOTEL_BRAND` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(45) DEFAULT NULL,
  `hotel_stars` int DEFAULT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_id_UNIQUE` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HOTEL_BRAND`
--

LOCK TABLES `HOTEL_BRAND` WRITE;
/*!40000 ALTER TABLE `HOTEL_BRAND` DISABLE KEYS */;
INSERT INTO `HOTEL_BRAND` VALUES (1,'Marriott',2),(2,'Best Western',3),(3,'Choice Hotels',4),(4,'Four Seasons',5),(5,'Hilton',2),(6,'Hyatt Hotels',3),(7,'MGM Resorts',4),(8,'Walt Disney',5),(9,'Holiday Inn',2),(10,'Westin',3),(11,'Embassy Suites',4),(12,'Shangri-La',5),(13,'Hotel Ibis',2),(14,'Novotel',3),(15,'XIV',4),(16,'Taj',5),(17,'Mandarin Or.',2),(18,'Copthome',3),(19,'Jinjiang',4),(20,'Radisson Blu',5),(21,'Waldorf',2);
/*!40000 ALTER TABLE `HOTEL_BRAND` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM`
--

DROP TABLE IF EXISTS `ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITEM` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM`
--

LOCK TABLES `ITEM` WRITE;
/*!40000 ALTER TABLE `ITEM` DISABLE KEYS */;
INSERT INTO `ITEM` VALUES (1,'Scraf '),(2,'Mosquito Repellant'),(3,'Hicking Stick'),(4,'Swimming Suit'),(5,'Binocle'),(6,'Sunglasses'),(7,'Puncho'),(8,'Camping Lantern'),(9,'Waterproof Phone Case'),(10,'Sneakers'),(11,'Rainproof Jacket'),(12,'Medicine/ First Aid Kit'),(13,'Toiletries'),(14,'Portable mini fan'),(15,'Refillable water bottle'),(16,'Slashproof Backpack'),(17,'Hand Sanitizer'),(18,'Travel Adapter'),(19,'Sun Screen'),(20,'Straw Hat'),(42,'sunscreen'),(43,'hiking boots'),(44,'umbrella'),(45,'malaria medication'),(46,'swimsuit'),(47,'parka'),(48,'binoculars'),(49,'EU power adaptor'),(50,'camera'),(51,'fancy clothes'),(52,'water filter'),(53,'money belt'),(54,'scuba gear'),(55,'first-aid kit'),(56,'bug spray'),(57,'bear mace'),(58,'warm sleeping bag'),(59,'diarrhea medication'),(60,'anti-biotics'),(61,'ice axe');
/*!40000 ALTER TABLE `ITEM` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=10014 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MEMBER`
--

LOCK TABLES `MEMBER` WRITE;
/*!40000 ALTER TABLE `MEMBER` DISABLE KEYS */;
INSERT INTO `MEMBER` VALUES (1,'Marge','Lorent','Bengtsfors','Sw'),(2,'Roi','Cosford','Bilovods\'k','Uk'),(3,'Hattie','Pittem','Kuanping','Ch'),(4,'Andrei','Stewartson','Bulasa','Ph'),(5,'Dougy','Fraczek','Targanice','Po'),(6,'Brigid','Sellner','Göteborg','Sw'),(7,'Pinchas','John','Duishan','Ch'),(8,'Haven','Cowlin','Samran','Th'),(9,'Quillan','Novic','Caridad','Ph'),(10,'Sari','Seaton','San Francisco','Co'),(11,'Valencia','Littleover','Dębica','Po'),(12,'Halsy','Markus','Wagar','Su'),(13,'Thacher','Woodward','Vyksa','Ru'),(14,'Demeter','Straniero','Žamberk','Cz'),(15,'Joe','Crust','Perpignan','Fr'),(16,'Parrnell','Sansun','Barão de São Miguel','Po'),(17,'Melodie','Greenhowe','Arcueil','Fr'),(18,'Eugen','Mapp','Saronída','Gr'),(19,'Ty','Wheelband','Puerto Berrío','Co'),(20,'Christal','Stenhouse','Kallífytos','Gr'),(21,'Merrel','Arnaudet','Nieborów','Po'),(22,'Mersey','Kilshaw','Rowokangkung','In'),(23,'Kevina','Zieme','Bulod','Ph'),(24,'Dedra','Trusler','Al Qārah','Sa'),(25,'Berte','Alfwy','Polovinnoye','Ru'),(26,'Rosmunda','Shea','Omaha','Un'),(27,'Shantee','Kendall','Haczów','Po'),(28,'Lind','Hardaker','‘Alāqahdārī Gēlān','Af'),(29,'Hebert','Ambrosi','Issy-les-Moulineaux','Fr'),(30,'Nancie','Gepheart','Aytos','Bu'),(31,'Tarrah','Dawber','Neklyudovo','Ru'),(32,'Mildrid','Hackin','Xiayang','Ch'),(33,'Marwin','Lanphier','Sadov','Cz'),(34,'Kizzee','Bygrove','Amapala','Ho'),(35,'Clara','Rafe','Tawa','Ch'),(36,'Rochella','Margiotta','Enriquillo','Do'),(37,'Hamish','Sheridan','Lingkou','Ch'),(38,'Geordie','Dandie','Andekantor','In'),(39,'Leticia','McCauley','Oslo','No'),(40,'Valerie','Filchagin','Shah Alam','Ma'),(41,'Linzy','Joney','Shabo','Uk'),(42,'Conni','Ratnege','Ţayyibat al Imām','Sy'),(43,'Jedd','Blueman','Vilyuchinsk','Ru'),(44,'Breena','Skitral','Hongos','Pe'),(45,'Helyn','Loude','Kalix','Sw'),(46,'Read','Bett','Urung','In'),(47,'Sibelle','Foggarty','Gaoling','Ch'),(48,'Conni','Sayers','Sijihong','Ch'),(49,'Charley','Impy','Mengdadazhuang','Ch'),(50,'Jany','Matteuzzi','Güiria','Ve'),(51,'Rolph','Bourdel','Hutou','Ch'),(52,'Kermy','Cullingford','Mardīān','Af'),(53,'Crawford','Fist','Rudnya','Ru'),(54,'Mathian','Camelli','Saint-Malo','Fr'),(55,'Neda','Clohessy','Basseterre','Sa'),(56,'Merla','Eatherton','Katagum','Ni'),(57,'Josy','McDonogh','Saurama','Pe'),(58,'Sascha','Canwell','El Progreso','Ho'),(59,'Aurie','Ladon','Tancheng','Ch'),(60,'Stoddard','Kupec','Choropampa','Pe'),(61,'Bent','Lochhead','San Agustin','Ph'),(62,'Cele','Truran','Dahe','Ch'),(63,'Myca','Burke','Kultuk','Ru'),(64,'Dion','Cecchi','Tsurugi-asahimachi','Ja'),(65,'Robinette','Bathow','Kota Kinabalu','Ma'),(66,'Sybyl','Futter','Tianhe','Ch'),(67,'Link','Handley','Núi Đối','Vi'),(68,'Cyndi','Shaefer','Santa María de Ipire','Ve'),(69,'Barb','Bursnell','Lübeck','Ge'),(70,'Cal','Enocksson','Tahoua','Ni'),(71,'Brigham','Flye','Lalagsan','Ph'),(72,'Ruperta','Wayland','Igarapé Miri','Br'),(73,'Joana','Wintle','Bergen','No'),(74,'Chrystel','Playfair','Muriaé','Br'),(75,'Ugo','Copnell','Telaga','In'),(76,'Prissie','Chadd','Dachun','Ch'),(77,'Raymond','McKea','Rochester','Un'),(78,'Lucille','Brightie','Karlivka','Uk'),(79,'Kiah','d\' Elboux','Campo Alegre','Br'),(80,'Corney','Lysaght','Montréal-Ouest','Ca'),(81,'Ortensia','Swindon','Huangcun','Ch'),(82,'Marijn','Vanyutin','Qinggang','Ch'),(83,'Claudius','Tocher','Misawa','Ja'),(84,'Maurits','Whorlow','Stratford','Ca'),(85,'Ally','Couttes','Keti Bandar','Pa'),(86,'Chip','Pauly','Dongping','Ch'),(87,'Walther','Giorgio','Złotniki Kujawskie','Po'),(88,'Orbadiah','Bickerton','Manzë','Al'),(89,'Francoise','Scorer','Olds','Ca'),(90,'Melania','Prescott','Kaberamaido','Ug'),(91,'Phyllys','Bradwell','Mueang Suang','Th'),(92,'Ernest','Wehden','Gotemba','Ja'),(93,'Patrizio','Ickovicz','Jāsk','Ir'),(94,'Jordan','Loveard','La Falda','Ar'),(95,'Rudolph','Trulock','Puma','Ta'),(96,'Delmar','Wellbank','Cerro','Cu'),(97,'Dalia','Stubbert','Balzar','Ec'),(98,'Jerrie','Newstead','Baklashi','Ru'),(99,'Cheri','Ladd','Aoluguya Ewenke Minzu','Ch'),(100,'Dewitt','Vedyashkin','Pasirtujuhpuluh','In'),(101,'Stirling','Kahler','Barda','Az'),(102,'Juline','Pablo','Pacaycasa','Pe'),(103,'Florian','Shipman','Vysehrad','Cz'),(104,'Wolfie','Paoletto','Citeluk','In'),(105,'Aura','Gencke','Motala','Sw'),(106,'Jehanna','Simkiss','Nowshera','Pa'),(107,'Joleen','Leverson','Millerovo','Ru'),(108,'Brice','Fieldsend','Mafa','Ni'),(109,'Devon','Biford','Notre Dame','Ma'),(110,'Pierrette','Godman','Micoud','Sa'),(111,'Kincaid','MacDermott','Haiyu','Ch'),(112,'Giacopo','Dudek','Cabugao','Ph'),(113,'Caddric','Kuhnert','Magallanes','Ph'),(114,'Diane','Crowthe','General Pinedo','Ar'),(115,'Veronika','Lockier','Ribeiro','Po'),(116,'Hollyanne','Oxberry','Wanghu','Ch'),(117,'Isidore','Carmen','Tambopata','Pe'),(118,'Alexina','Figliovanni','Iporã','Br'),(119,'Elenore','Brothwood','Bangued','Ph'),(120,'Lilly','Piscot','Kotlyarevskaya','Ru'),(121,'Cherrita','Leathem','Alto Río Senguer','Ar'),(122,'Leonerd','Loraine','Lijiapu','Ch'),(123,'Frederico','Sirkett','Saint-Quentin-en-Yvelines','Fr'),(124,'Stanly','Hayer','Eksjö','Sw'),(125,'Nikolos','Gouthier','Tbilisskaya','Ru'),(126,'Vern','Veldens','Hachiōji','Ja'),(127,'Susan','Habron','Comallo','Ar'),(128,'Bernette','Firmage','Terong','In'),(129,'Dare','Chastang','Koilás','Gr'),(130,'Renata','Pedron','Aygepat','Ar'),(131,'Noemi','Dot','Chinchiná','Co'),(132,'Alard','Blazeby','Xiache','Ch'),(133,'Nonie','Dun','Oesena','In'),(134,'Mable','Gleed','Portela','Po'),(135,'Sandie','Josifovic','Camaligan','Ph'),(136,'Arnuad','Lyons','Santa Cruz','Po'),(137,'Evonne','Pattle','Mishixiang','Ch'),(138,'Mariellen','Clemmensen','Xinbao','Ch'),(139,'Nissa','Schinetti','Stockholm','Sw'),(140,'Osmund','Ledur','Gibara','Cu'),(141,'Atalanta','Grugerr','Châu Thành','Vi'),(142,'Harmony','Martusov','Mamonovo','Ru'),(143,'Mendel','Stambridge','Lanat','Ph'),(144,'Ferdy','Keenlayside','Sidem','In'),(145,'Serge','FitzGibbon','Slobodka','Ru'),(146,'Karry','Brewett','Bzou','Mo'),(147,'Nari','Beese','Cerava','Al'),(148,'Thedric','Southcoat','Tempurejo','In'),(149,'Mortie','Roseman','Odienné','Iv'),(150,'Glen','Gout','Las Flores','Me'),(151,'Fraze','West-Frimley','Jefferson City','Un'),(152,'Cleo','Cutting','Vikhorevka','Ru'),(153,'Devin','Fellini','Strelitsa','Ru'),(154,'Annamaria','Volante','Padang','Ph'),(155,'Redford','Chastan','Valdemārpils','La'),(156,'Rodge','Hattoe','Maño','Ph'),(157,'Dianna','Cust','Santo André','Po'),(158,'Humfried','Aysik','Aleksandrovsk-Sakhalinskiy','Ru'),(159,'Irene','Vergine','Novoaltaysk','Ru'),(160,'Aubine','Ashbe','Yaguachi Nuevo','Ec'),(161,'Dur','Cowin','Bella Vista','Ar'),(162,'Dara','Renad','San Miguel','Me'),(163,'Holt','Tremblett','Kadubadak','In'),(164,'Sidnee','Brignall','Ar Rahad','Su'),(165,'Olly','Feaveer','Perepravnaya','Ru'),(166,'Emelyne','De Carteret','Nová Role','Cz'),(167,'Margaretta','Fewless','Mariquita','Co'),(168,'Harwell','Raistrick','Shirone','Ja'),(169,'Temple','Fawson','Mulyadadi','In'),(170,'Mariska','Izon','Pelym','Ru'),(171,'Hamish','Rispine','Ciervo Petiso','Ar'),(172,'Flinn','Couch','Oslo','No'),(173,'Bride','Blucher','Derventa','Bo'),(174,'Lazaro','Matterface','Évreux','Fr'),(175,'Davey','Maddox','Eastern Suburbs Mc','Au'),(176,'Dotty','Philcock','As Saddah','Ye'),(177,'Eileen','Pedwell','Sabugal','Po'),(178,'Kamilah','Salsbury','Boavista','Po'),(179,'Arleen','Castagnet','Kuantan','Ma'),(180,'Arny','Maryet','Mantampay','Ph'),(181,'Maurine','MacGeffen','Cuauhtemoc','Me'),(182,'Manolo','Millsap','Gorzów Śląski','Po'),(183,'Pattin','Baitman','Waterbury','Un'),(184,'Tobe','Klosges','Patea','Ne'),(185,'Evvie','Tivenan','San José de Comayagua','Ho'),(186,'Bord','Geindre','Ongi','Mo'),(187,'Caleb','Anstis','Bandeirantes','Br'),(188,'Cecile','MacDermand','Banjar Batuaji Kaja','In'),(189,'Todd','Tarply','Lichengdao','Ch'),(190,'Andree','Gorden','Semënovskoye','Ru'),(191,'Rolando','Hurlin','Renchaoxi','Ch'),(192,'Gunther','Veillard','Kudang','In'),(193,'Lane','Brunger','Chernivtsi','Uk'),(194,'Wendi','Handrik','Ponyri Vtoryye','Ru'),(195,'Burch','Hennemann','Falāvarjān','Ir'),(196,'Carla','Kinzel','Duboka','Se'),(197,'Taylor','Whorlow','Rawa','In'),(198,'Wallache','Rohfsen','Langsepan','In'),(199,'Rakel','Boud','Pondaguitan','Ph'),(200,'Frederic','Kastel','Caçapava','Br'),(201,'Giovanni','Hoggan','Vårdö','Al'),(202,'Joyce','Kelinge','Tembisa','So'),(203,'Conny','Gleasane','Stockholm','Sw'),(204,'Malanie','Wilkerson','Stockholm','Sw'),(205,'Keri','Stryde','Bahía Blanca','Ar'),(206,'Katuscha','Gurnell','Manosque','Fr'),(207,'Robinson','Alonso','Capalayan','Ph'),(208,'Meagan','Charity','Oslo','No'),(209,'Orv','Doni','Shuangtang','Ch'),(210,'Lissy','Langdon','Barroco','Po'),(211,'Benedetto','Rosterne','Mlonggo','In'),(212,'Mirabel','Maisey','Khorol','Uk'),(213,'Catherine','Baldoni','Kan','Ch'),(214,'Caralie','Breeton','Umeå','Sw'),(215,'Freddie','Beverley','Paradela','Po'),(216,'Shermie','Glanton','Sukmoilang','In'),(217,'Erny','Glassford','Haolaishan','Ch'),(218,'Gerick','Ghiron','Cilated','In'),(219,'Meredithe','Levi','El Ksour','Tu'),(220,'Norrie','Louch','Butuan','Ph'),(221,'Boony','Kastel','Văn Giang','Vi'),(222,'Dinny','Brotheridge','Knin','Cr'),(223,'Cassi','Josefsohn','Vlachovo Březí','Cz'),(224,'Joel','Dodamead','Akwanga','Ni'),(225,'Caro','Ryam','Spanish Wells','Ba'),(226,'Merilee','Muirden','Huayllo','Pe'),(227,'Elene','Bedo','Lameira','Po'),(228,'Isaac','Stoeckle','Kandi','Be'),(229,'Bartholomew','Scotchmer','Jetafe','Ph'),(230,'Fred','Easman','Şūrān','Sy'),(231,'Ignatius','Rasp','Jutaí','Br'),(232,'Emlynne','Macknish','Macha','Ch'),(233,'Adriaens','Croucher','Zuru','Ni'),(234,'Urban','Sibbs','Şurmān','Li'),(235,'Nial','Waddicor','Npongge','In'),(236,'Denna','Tinan','Kozel’shchyna','Uk'),(237,'Kort','Matys','Torres','Br'),(238,'Ardith','Corson','Pinggirsari','In'),(239,'Minna','Khan','San Francisco','Ph'),(240,'Wake','Ciotto','Virojoki','Fi'),(241,'Carmita','Keates','Mompós','Co'),(242,'Modestia','Balch','Cabouco','Po'),(243,'Peggi','Deane','Cigadung','In'),(244,'Imogen','Ibert','Xihuachi','Ch'),(245,'Keene','Leamon','Bailieborough','Ir'),(246,'Branden','Bowerbank','Rubizhne','Uk'),(247,'Alethea','Domonkos','Koroyo','In'),(248,'Tate','Cathrae','Na Chueak','Th'),(249,'Cacilia','Happert','Detroit','Un'),(250,'Konstanze','Josiah','Jiulong','Ch'),(251,'Jaclin','Alberti','Kafr Zībād','Pa'),(252,'Milt','Duddin','Mokolo','Ca'),(253,'Rosene','Birkbeck','Göteborg','Sw'),(254,'Dylan','Banbury','‘Alīābād-e Katūl','Ir'),(255,'Arie','Tilney','San Diego','Un'),(256,'Coraline','Ropert','Lewopao','In'),(257,'Wilie','Moodie','Miaoshou','Ch'),(258,'Jeffy','McGuire','Olympia','Un'),(259,'Weidar','MacDearmaid','Montalvo','Ec'),(260,'Farris','O\'Rafferty','Apaga','Ar'),(261,'Clarke','Menere','Cerrillos','Ar'),(262,'Hoebart','Cherrison','Fada N\'gourma','Bu'),(263,'Jenna','Gimblett','Chelopech','Bu'),(264,'Barny','Le Claire','Lleida','Sp'),(265,'Bebe','Hardesty','Camagüey','Cu'),(266,'Alva','Willetts','Kiernozia','Po'),(267,'Tomasine','Wolfer','Sanxi','Ch'),(268,'Ruprecht','Deamer','Changshu City','Ch'),(269,'Sophia','Marder','La Suiza','Co'),(270,'Stacy','Witchell','Kocēni','La'),(271,'Jeanna','Glavis','Tireman Timur','In'),(272,'Markos','McElwee','Caen','Fr'),(273,'Valaria','Mayhow','Maevatanana','Ma'),(274,'Aura','Ratcliffe','Sighnaghi','Ge'),(275,'Turner','Dedenham','Taman','In'),(276,'Franny','Jeavon','Bendan','In'),(277,'Violet','Kliemchen','Leyuan','Ch'),(278,'Teddie','Carr','Las Animas','Me'),(279,'Cosme','Domm','Shchigry','Ru'),(280,'Lola','Renne','Kasungu','Ma'),(281,'Mellisa','Denidge','Bangil','In'),(282,'Keane','Duckers','Căuşeni','Mo'),(283,'Ignace','Scarr','Versailles','Fr'),(284,'Alexi','Panter','Aurora','Ph'),(285,'Tiffy','Bloschke','Huya','Ch'),(286,'Pincas','Roberds','Shijiazhai','Ch'),(287,'Jobey','Rowdell','Banjar Pangkungtibah Selatan','In'),(288,'Antonio','Keller','Donostia-San Sebastian','Sp'),(289,'Dewain','Tidy','Kozyatyn','Uk'),(290,'Tami','Stannas','Tanjung','In'),(291,'Lizzy','Rumens','Hekou','Ch'),(292,'Niccolo','Carmont','Patimuan','In'),(293,'Sully','Peterkin','Orlando','Un'),(294,'Cate','Eicheler','Valejas','Po'),(295,'Moria','Boorn','Shchelkovo','Ru'),(296,'Corena','Carlyle','Lurugan','Ph'),(297,'Tyler','Wands','Zainsk','Ru'),(298,'Donovan','Flight','Diaowei','Ch'),(299,'Bianca','Wildin','Carmelo','Ph'),(300,'Barris','Malster','Korczew','Po'),(301,'Xinyu','Qiu','Shanghai','Ch'),(302,'Frank','Watt','Houston','US'),(303,'Jeffery','Mingo','Chiang Mai','TH'),(304,'Jeffery','Soprano','Newark','US'),(305,'chris','lee','abc','Ch'),(10000,'chris','jack','seattle','Ch'),(10001,'chris','error','seattle','Ch'),(10002,'chris','handsome','chengdu','US'),(10003,'chris','whatever','beijing','us'),(10004,'','','',''),(10005,'frank','thomas','baltimore','us'),(10006,'','','',''),(10007,'','','',''),(10008,'','','',''),(10009,'','','',''),(10010,'Jason','Peters','Seattle','US'),(10011,'Todd','Todd','Seattle','US'),(10012,'todd','todd','seattle','us'),(10013,'Kramer','Johnson','Federal Way','US');
/*!40000 ALTER TABLE `MEMBER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RATING`
--

DROP TABLE IF EXISTS `RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RATING` (
  `rat_stars` int DEFAULT NULL,
  `rat_amt_spent` int DEFAULT NULL,
  `hotel_id` int NOT NULL,
  `member_id` int NOT NULL,
  `air_code` varchar(5) NOT NULL,
  `dest_id` int NOT NULL,
  `highlight_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`dest_id`),
  KEY `fk_RATING_HOTEL_BRAND1_idx` (`hotel_id`),
  KEY `fk_RATING_MEMBER1_idx` (`member_id`),
  KEY `fk_RATING_AIRLINE1_idx` (`air_code`),
  KEY `fk_RATING_DESTINATION1_idx` (`dest_id`),
  KEY `idx_RATING_highlight_id` (`highlight_id`),
  CONSTRAINT `fk_RATING_AIRLINE1` FOREIGN KEY (`air_code`) REFERENCES `AIRLINE` (`air_code`),
  CONSTRAINT `fk_RATING_DESTINATION1` FOREIGN KEY (`dest_id`) REFERENCES `DESTINATION` (`dest_id`),
  CONSTRAINT `fk_RATING_HOTEL_BRAND1` FOREIGN KEY (`hotel_id`) REFERENCES `HOTEL_BRAND` (`hotel_id`),
  CONSTRAINT `fk_RATING_MEMBER1` FOREIGN KEY (`member_id`) REFERENCES `MEMBER` (`member_id`),
  CONSTRAINT `RATING_ibfk_1` FOREIGN KEY (`highlight_id`) REFERENCES `HIGHLIGHT` (`highlight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RATING`
--

LOCK TABLES `RATING` WRITE;
/*!40000 ALTER TABLE `RATING` DISABLE KEYS */;
INSERT INTO `RATING` VALUES (5,2323,1,1,'AA',1,1),(4,2871,19,1,'AF',3,3),(5,2789,9,1,'JO',9,3),(3,2020,9,1,'AA',17,8),(5,2081,8,1,'B6',28,4),(3,1811,8,1,'AA',34,1),(2,1944,6,1,'UA',35,12),(3,1904,14,1,'OZ',43,9),(5,2075,9,1,'AS',52,7),(4,2663,2,1,'CA',56,4),(2,2879,7,2,'7C',6,15),(3,2866,6,2,'B6',20,8),(1,2627,6,2,'AF',28,17),(5,2896,19,2,'HU',40,2),(1,2697,1,2,'CA',55,5),(4,2997,10,2,'CA',56,3),(4,2218,5,3,'JO',3,1),(1,2581,5,3,'AF',6,1),(3,2935,4,3,'AA',9,9),(5,2332,5,3,'BA',10,16),(2,1276,9,3,'AF',14,9),(1,1819,7,3,'CA',18,8),(4,2083,12,3,'NK',19,4),(5,1779,6,3,'AS',26,12),(5,2032,9,3,'B6',33,8),(2,1540,5,3,'HU',35,13),(3,1457,14,3,'DL',38,17),(3,1101,8,3,'AS',40,14),(4,1141,6,3,'CA',42,16),(3,2993,17,3,'UA',44,3),(1,2580,10,3,'BA',49,15),(1,2323,8,3,'B6',53,7),(2,2281,7,3,'AF',55,10),(5,1066,8,3,'B6',56,16),(1,2823,2,4,'B6',6,3),(5,1903,7,4,'BA',7,8),(4,2350,21,4,'AA',9,16),(3,2779,5,4,'AS',11,5),(3,2294,15,4,'UA',13,9),(1,1098,4,4,'CA',17,9),(5,2367,6,4,'B6',27,2),(1,1975,2,4,'AA',33,14),(3,1781,14,4,'DL',34,16),(3,2326,9,4,'BA',39,5),(3,1552,3,5,'B6',15,2),(5,2181,9,5,'AS',16,15),(3,1571,5,5,'BA',17,5),(1,1468,6,5,'AA',20,5),(1,1952,9,5,'7C',23,17),(5,1117,7,5,'AF',25,1),(1,2620,17,5,'AS',33,15),(3,1562,4,5,'HU',36,13),(5,2454,8,5,'CA',38,6),(5,1695,18,5,'LH',44,5),(5,1126,5,5,'CA',45,8),(3,2288,14,5,'BA',48,11),(5,2377,7,5,'B6',60,16),(4,2930,6,6,'AC',12,15),(4,2019,17,6,'LH',14,15),(5,1531,3,6,'BA',15,6),(5,2059,6,6,'7C',19,7),(2,2680,10,6,'WN',21,9),(5,1664,1,6,'CA',39,6),(2,1023,3,6,'CA',40,6),(2,2097,5,6,'B6',50,5),(5,1624,1,6,'CA',54,8),(5,2522,6,6,'BA',56,5),(3,2617,5,7,'AF',3,13),(1,1867,20,7,'AC',11,8),(5,2499,7,7,'WN',17,15),(1,2037,10,7,'UA',18,17),(4,1815,21,7,'UA',20,3),(1,2783,2,7,'AS',24,6),(3,1519,1,7,'B6',32,1),(1,1728,4,7,'7C',35,12),(1,2934,8,7,'B6',36,11),(5,2915,3,7,'AS',48,17),(4,1247,2,7,'AC',49,16),(2,1652,10,7,'AF',50,4),(3,1115,19,7,'OZ',53,17),(2,1019,10,7,'7C',54,1),(4,1618,2,7,'BA',56,11),(3,2035,1,7,'B6',59,5),(3,1282,4,8,'CA',4,2),(5,1482,11,8,'BA',10,5),(5,2352,8,8,'BA',11,10),(5,2272,3,8,'AS',17,2),(3,1518,1,8,'UA',24,13),(2,2381,10,8,'BA',26,15),(5,1054,21,8,'CA',28,3),(4,2510,7,8,'BA',31,6),(4,1038,1,8,'7C',37,3),(1,2938,3,8,'CA',55,1),(5,2238,15,8,'CZ',60,12),(5,1102,7,9,'AF',7,2),(4,2904,8,9,'AF',12,2),(3,2744,3,9,'B6',27,16),(1,1627,4,9,'AF',36,12),(3,2565,7,9,'AA',51,5),(4,1572,7,9,'B6',54,17),(4,1241,2,10,'7C',7,2),(4,1007,11,10,'MU',11,13),(5,2968,15,10,'B6',15,4),(3,2148,4,10,'AC',20,12),(1,1898,12,10,'OZ',21,17),(1,2944,9,10,'WN',23,13),(1,2808,10,10,'CA',27,4),(1,1515,1,10,'CA',29,3),(1,2462,16,10,'AF',31,13),(1,2158,7,10,'B6',41,13),(4,1407,9,10,'B6',44,16),(5,2143,10,10,'BA',46,13),(2,1216,12,10,'HU',51,9),(3,2634,7,11,'7C',2,14),(5,1955,17,11,'AC',3,11),(5,2126,7,11,'AS',25,12),(1,1122,7,11,'B6',28,1),(2,1686,1,11,'CA',31,3),(4,2823,3,11,'BA',32,2),(3,1607,3,11,'7C',34,10),(3,1967,1,11,'DL',42,4),(2,1618,14,11,'AC',46,8),(3,2045,13,11,'AF',53,14),(5,1768,1,11,'7C',60,9),(3,2356,4,12,'AF',6,10),(5,1064,18,12,'B6',7,11),(5,2942,9,12,'CA',8,5),(4,1057,4,12,'AC',16,11),(2,2884,2,12,'7C',19,1),(1,2407,15,12,'CA',21,16),(4,2478,3,12,'AC',22,2),(1,2751,10,12,'AA',32,3),(5,1068,3,12,'B6',36,1),(4,1691,8,12,'7C',41,2),(2,1211,8,12,'AF',42,9),(2,1663,8,12,'AS',43,10),(3,1784,7,12,'AF',46,8),(2,1591,5,12,'B6',52,16),(1,1114,14,12,'LH',53,16),(5,1879,9,12,'7C',54,12),(5,2866,4,12,'CA',55,14),(2,2053,4,12,'B6',56,2),(5,1093,9,13,'DL',7,8),(2,2090,3,13,'HA',14,2),(3,2785,1,13,'TRA',17,6),(2,2694,3,13,'AA',23,8),(2,2761,9,13,'AF',31,5),(4,2525,19,13,'WN',39,1),(2,2842,16,13,'UA',43,13),(4,1478,13,13,'CZ',46,17),(2,2752,11,13,'MU',49,7),(2,1637,5,13,'AF',55,5),(4,1671,8,13,'CA',59,11),(3,1171,8,13,'B6',60,8),(2,2326,9,14,'B6',1,1),(4,2688,3,14,'7C',7,2),(2,1328,2,14,'BA',19,4),(2,2654,11,14,'CA',21,9),(2,1504,1,14,'BA',32,8),(1,1514,11,14,'AA',40,6),(4,1280,1,14,'AF',44,17),(2,2092,4,14,'AS',46,3),(3,1747,16,14,'CA',50,1),(2,2804,1,14,'7C',55,16),(4,2466,5,14,'AA',60,14),(5,1757,3,15,'7C',5,10),(3,2115,11,15,'B6',6,7),(1,1822,8,15,'BA',8,15),(5,1103,3,15,'BA',9,15),(4,2265,3,15,'NK',10,13),(1,1831,10,15,'B6',12,6),(3,2160,17,15,'DL',14,17),(5,1859,4,15,'AA',15,13),(4,1093,1,15,'AS',17,14),(5,2017,3,15,'B6',23,16),(2,2947,5,15,'CA',26,12),(4,1631,3,15,'BA',28,6),(3,1009,3,15,'LH',30,12),(4,1157,17,15,'CA',32,3),(3,1338,2,15,'7C',35,13),(1,1365,5,15,'BA',42,7),(2,2121,3,15,'CA',43,12),(4,2657,9,15,'AS',52,13),(5,1295,8,15,'BA',53,11),(5,1977,1,16,'AA',4,9),(3,2926,20,16,'HU',5,9),(2,1131,1,16,'CA',6,7),(3,1486,13,16,'MU',9,7),(2,2463,9,16,'BA',12,12),(1,2154,3,16,'CZ',14,1),(5,2385,6,16,'AS',18,11),(5,2591,7,16,'7C',21,17),(4,2164,3,16,'HU',23,15),(2,2546,3,16,'7C',25,6),(1,2896,9,16,'BA',31,1),(5,1502,2,16,'AF',53,10),(4,2362,8,16,'BA',60,1),(4,2339,9,17,'AS',2,14),(1,2752,8,17,'CZ',3,15),(2,1463,9,17,'B6',6,4),(3,2797,7,17,'B6',10,15),(1,2913,1,17,'CA',17,1),(2,1662,2,17,'AF',18,6),(5,1133,13,17,'AA',21,7),(3,1040,9,17,'BA',23,15),(1,2224,1,17,'AS',39,14),(2,1602,3,17,'UA',40,7),(1,2772,13,17,'TRA',44,11),(1,1155,2,17,'HA',47,1),(3,2204,14,17,'B6',49,11),(3,1789,1,17,'AC',52,6),(4,2869,7,17,'BA',58,1),(5,1198,16,17,'CA',60,11),(5,2219,10,18,'B6',1,15),(2,2515,8,18,'AC',10,4),(5,2966,14,18,'TRA',13,2),(2,1099,1,18,'7C',14,3),(4,2049,6,18,'B6',24,6),(1,2496,9,18,'AA',25,3),(1,1419,10,18,'BA',31,14),(3,1372,17,18,'BA',41,17),(1,1372,13,18,'OZ',49,3),(2,2227,7,18,'7C',52,9),(5,1305,13,18,'AS',58,13),(2,1733,7,19,'B6',3,9),(5,1247,9,19,'BA',4,6),(4,2744,16,19,'HA',9,3),(3,1096,20,19,'OZ',10,17),(5,1476,1,19,'B6',15,3),(4,1992,5,19,'CA',16,14),(2,2198,14,19,'LH',21,16),(4,2170,21,19,'BA',22,6),(2,2304,6,19,'AF',27,10),(1,1514,8,19,'UA',30,8),(2,1432,19,19,'AS',41,4),(1,2456,18,19,'OZ',43,7),(3,1492,13,19,'TG',48,5),(3,1978,7,19,'AA',50,10),(2,2566,3,19,'BA',54,15),(5,2296,6,20,'AF',3,14),(3,2198,5,20,'B6',4,12),(5,2615,8,20,'7C',7,11),(4,2645,8,20,'CA',11,15),(1,1016,15,20,'HA',14,17),(3,1502,20,20,'AF',16,12),(3,1006,9,20,'HA',25,2),(4,1282,10,20,'AF',35,9),(3,2253,8,20,'7C',37,15),(5,1404,10,20,'AF',38,17),(2,1754,9,20,'AS',39,13),(5,2899,1,20,'AA',47,2),(1,1886,10,20,'AA',51,11),(4,2059,6,20,'B6',56,9),(1,1726,15,20,'WN',57,3),(5,1470,8,21,'CZ',5,10),(2,1504,2,21,'AS',7,9),(4,2973,1,21,'BA',9,6),(3,1144,20,21,'JO',10,16),(4,1859,10,21,'B6',12,14),(3,1902,2,21,'CA',15,3),(3,1536,7,21,'B6',17,16),(5,2688,3,21,'B6',25,1),(2,2917,13,21,'TG',28,16),(4,1203,4,21,'HA',33,6),(1,2467,8,21,'BA',38,10),(5,1609,8,21,'BA',49,10),(3,2951,9,21,'AC',53,9),(1,1265,8,21,'WN',57,11),(4,1154,18,21,'OZ',60,11),(3,1555,10,22,'CA',2,3),(2,1538,7,22,'AS',8,11),(4,2885,10,22,'BA',12,14),(4,2032,10,22,'AA',20,12),(3,2845,7,22,'AS',29,10),(1,2701,9,22,'CA',30,12),(1,1633,6,22,'7C',36,16),(4,1789,4,22,'AS',37,2),(2,1599,6,22,'AA',40,4),(4,2472,5,22,'B6',43,4),(3,2984,2,22,'CA',45,12),(3,2305,7,22,'WN',46,3),(2,2178,4,22,'7C',48,2),(2,2093,3,22,'BA',51,1),(1,1995,3,22,'AS',52,6),(5,1495,16,22,'AS',55,12),(1,1373,11,23,'HU',1,1),(5,2619,9,23,'B6',3,10),(4,2694,9,23,'AS',8,8),(1,1534,10,23,'B6',12,15),(4,1580,9,23,'NK',19,3),(4,1094,5,23,'B6',21,11),(2,2160,2,23,'B6',24,14),(5,1945,3,23,'AF',27,5),(1,2701,8,23,'AA',33,5),(3,2998,20,23,'WN',35,8),(3,2724,13,23,'AA',40,8),(2,2394,4,23,'CA',45,3),(1,2389,2,23,'BA',46,5),(4,2435,6,23,'HA',47,4),(1,1587,2,23,'MU',48,2),(2,2626,4,23,'CA',49,16),(4,2331,2,23,'B6',54,12),(1,2263,1,23,'WN',57,5),(4,2136,9,24,'BA',10,3),(4,1482,8,24,'WN',15,4),(1,2742,6,24,'AS',16,5),(1,2336,20,24,'HA',22,15),(4,2663,1,24,'BA',29,12),(1,1185,1,24,'LH',32,16),(3,2309,5,24,'AS',37,17),(1,2622,10,24,'7C',38,10),(2,2574,8,24,'AC',40,3),(3,2707,6,24,'UA',41,15),(5,1068,20,24,'DL',42,11),(2,1098,4,24,'TG',46,3),(1,2928,13,24,'NK',47,4),(4,2837,2,24,'AC',50,6),(1,2469,7,24,'AF',56,13),(5,1397,14,25,'UA',4,8),(2,2986,8,25,'AS',18,15),(2,2306,8,25,'7C',19,9),(1,1362,1,25,'7C',21,14),(2,2563,5,25,'AS',23,14),(4,2469,8,25,'AA',26,5),(5,2613,3,25,'CZ',27,1),(4,1347,4,25,'B6',28,17),(2,2234,3,25,'BA',29,13),(5,1926,3,25,'AA',36,1),(5,1566,18,25,'MU',38,7),(5,1378,10,25,'AS',39,8),(2,1303,9,25,'AA',41,13),(2,2038,15,25,'TG',50,11),(1,2005,5,25,'AC',57,1),(4,1241,9,25,'7C',59,16),(3,2480,20,26,'UA',2,6),(2,2827,9,26,'BA',17,13),(3,1869,10,26,'7C',18,15),(2,2128,15,26,'TRA',26,17),(4,1413,5,26,'AA',36,11),(1,2964,9,26,'BA',40,14),(3,1149,2,26,'AS',45,17),(4,1806,3,26,'AA',56,11),(3,1404,17,26,'CZ',58,14),(1,2305,1,27,'CA',3,8),(1,2078,16,27,'OZ',6,10),(5,1341,10,27,'AA',8,5),(3,1049,4,27,'AA',10,7),(3,1871,3,27,'AA',22,6),(4,2204,6,27,'7C',26,14),(5,1572,15,27,'CZ',37,8),(4,1933,7,27,'AA',38,14),(3,1101,1,27,'UA',42,15),(2,2330,1,27,'AA',46,9),(3,1520,9,27,'AS',49,14),(1,1327,8,27,'BA',53,15),(2,2092,3,28,'AC',2,5),(2,2981,15,28,'B6',6,8),(1,1010,4,28,'AF',17,2),(5,1954,5,28,'B6',20,2),(5,2593,14,28,'MU',30,12),(2,1301,7,28,'AS',31,9),(5,2973,8,28,'AS',32,8),(4,1902,1,28,'CZ',36,9),(4,1754,2,28,'AF',40,11),(1,1141,10,28,'B6',41,7),(1,1093,1,28,'AA',44,15),(2,2983,3,28,'AS',47,11),(3,1496,4,28,'B6',49,12),(2,1876,9,28,'7C',55,10),(5,2777,1,29,'B6',5,1),(1,1936,1,29,'B6',8,3),(5,2103,9,29,'AA',13,8),(5,2007,2,29,'AS',16,3),(4,1327,14,29,'UA',24,1),(1,2610,13,29,'CZ',26,3),(4,2198,3,29,'AC',28,15),(4,1315,3,29,'AC',44,3),(1,1328,1,29,'AF',46,2),(3,2114,6,29,'AF',47,16),(4,2174,9,29,'BA',50,14),(2,2008,16,30,'AS',2,3),(5,2030,8,30,'AS',6,8),(2,1480,7,30,'CA',8,2),(4,2451,1,30,'BA',10,1),(3,2266,4,30,'B6',17,11),(1,2527,6,30,'B6',21,11),(1,2293,9,30,'7C',22,3),(1,2775,4,30,'BA',24,10),(4,1111,21,30,'CZ',26,5),(4,1308,8,30,'AF',28,7),(4,1621,3,30,'AS',32,2),(1,2623,18,30,'AF',33,17),(4,2699,7,30,'7C',35,3),(2,2412,6,30,'B6',39,6),(2,2252,7,30,'AF',45,3),(3,1839,5,30,'OZ',49,14),(4,2753,8,30,'AA',50,11),(5,2821,5,30,'HA',51,4),(5,1850,5,30,'B6',52,7),(3,1648,5,30,'7C',55,11),(5,1584,2,30,'7C',56,8),(2,1700,7,30,'7C',58,1),(2,1627,3,30,'AA',59,8),(4,1943,1,31,'7C',7,15),(5,1194,20,31,'7C',8,13),(3,1327,1,31,'7C',10,4),(2,2534,20,31,'TRA',22,10),(3,2118,4,31,'7C',31,4),(1,2453,6,31,'AA',37,12),(5,2298,10,31,'AF',42,2),(2,2368,5,31,'7C',44,3),(1,1907,21,31,'AA',46,2),(1,2220,6,31,'7C',47,17),(1,1407,12,31,'AS',51,5),(1,1219,3,31,'NK',52,2),(2,1705,17,32,'UA',1,17),(1,2497,8,32,'AF',2,5),(5,2356,7,32,'AS',8,16),(1,2309,2,32,'B6',10,2),(2,1951,3,32,'AS',16,3),(2,1230,4,32,'AF',18,2),(4,2777,7,32,'7C',21,12),(1,1849,4,32,'BA',24,5),(2,2143,5,32,'CA',43,1),(4,2354,6,32,'BA',56,2),(4,1110,3,32,'AF',57,12),(1,2945,4,32,'B6',59,17),(2,1692,1,32,'AF',60,7),(2,1878,9,33,'AS',23,11),(1,1168,2,33,'CA',29,1),(3,1221,7,33,'7C',38,6),(2,2060,2,33,'AA',43,2),(2,1265,5,33,'AC',44,3),(2,2900,12,33,'CZ',48,3),(5,1765,10,33,'CA',49,2),(1,2514,11,33,'TRA',52,17),(3,2927,10,34,'7C',2,10),(5,2276,5,34,'B6',3,12),(4,2778,8,34,'AC',8,7),(5,1268,18,34,'AF',9,3),(3,1815,9,34,'CA',11,11),(1,1912,8,34,'B6',12,16),(4,2057,1,34,'AC',16,16),(4,2458,13,34,'TRA',20,6),(1,1448,5,34,'B6',24,10),(5,1926,19,34,'LH',36,2),(2,1895,1,34,'BA',51,7),(1,2810,5,34,'B6',53,6),(2,1406,13,34,'HA',58,9),(3,1052,6,35,'AS',2,8),(5,1356,18,35,'JO',5,12),(5,2268,9,35,'7C',6,17),(1,2331,7,35,'BA',10,3),(2,1176,10,35,'BA',13,3),(5,1889,9,35,'AF',15,5),(2,1213,3,35,'AA',16,6),(4,1097,11,35,'AC',18,17),(1,2039,2,35,'AA',31,2),(3,2383,10,35,'B6',37,5),(4,2127,9,35,'LH',38,6),(1,2673,2,35,'7C',43,7),(5,1116,3,35,'7C',48,12),(1,1442,4,35,'AF',50,14),(2,1666,4,35,'OZ',51,3),(4,1835,8,35,'NK',54,16),(2,1271,14,36,'TG',2,3),(2,1155,5,36,'B6',8,7),(3,1200,12,36,'TG',15,11),(5,1348,19,36,'AC',28,14),(4,1178,21,36,'CA',30,12),(4,2697,5,36,'AC',38,13),(3,1138,6,36,'7C',45,15),(2,1853,9,36,'BA',46,6),(2,1949,10,36,'AS',49,4),(1,2509,5,36,'AS',50,2),(3,1855,2,36,'AF',55,13),(4,2065,5,37,'BA',1,1),(1,1598,12,37,'AF',7,3),(4,1559,9,37,'AS',9,8),(2,2621,17,37,'JO',13,13),(4,1392,8,37,'B6',17,5),(3,2372,3,37,'BA',25,4),(2,2309,6,37,'AC',33,2),(5,1403,7,37,'CA',45,7),(5,1715,8,37,'MU',47,4),(3,2518,12,37,'LH',55,14),(2,2639,9,37,'CA',60,16),(5,1341,3,38,'CA',1,12),(3,2764,4,38,'CA',19,12),(4,1336,7,38,'NK',26,4),(5,1772,4,38,'AC',34,1),(3,1089,10,38,'AS',36,1),(3,2854,1,38,'BA',51,2),(4,1457,10,39,'OZ',3,4),(4,2380,3,39,'AC',5,12),(1,1370,2,39,'B6',6,2),(1,1521,9,39,'B6',7,12),(1,2647,2,39,'7C',8,6),(3,1072,3,39,'7C',12,7),(5,1299,2,39,'AF',30,7),(5,1386,4,39,'AS',31,17),(5,1327,5,39,'BA',36,9),(4,1334,2,39,'7C',42,4),(5,1518,4,39,'7C',44,10),(4,1339,10,39,'BA',46,17),(5,1706,8,39,'AA',49,2),(3,2084,16,39,'DL',50,12),(5,2385,10,39,'B6',57,4),(3,1538,14,39,'DL',58,3),(5,1363,10,40,'AC',1,6),(1,2367,5,40,'B6',3,8),(4,1069,9,40,'BA',5,16),(5,2633,1,40,'7C',7,3),(1,1824,17,40,'HA',19,10),(3,2700,9,40,'AA',20,5),(5,2672,17,40,'JO',24,1),(5,1928,9,40,'AA',32,5),(2,2572,1,40,'CA',33,3),(3,2186,7,40,'AC',45,4),(2,1418,8,40,'AC',50,5),(2,1961,4,40,'AF',51,3),(5,1227,2,40,'HU',52,11),(1,1961,10,40,'AC',54,13),(5,1109,9,40,'UA',56,8),(3,1371,18,41,'MU',3,12),(2,2584,8,41,'B6',4,10),(4,1542,7,41,'AA',8,12),(1,2090,1,41,'B6',13,13),(3,1552,1,41,'7C',31,2),(1,1710,5,41,'CZ',32,13),(4,2375,14,41,'AC',33,14),(5,1814,7,41,'UA',43,3),(1,1549,7,41,'DL',45,9),(5,1166,8,41,'7C',53,6),(4,1128,5,41,'CA',55,4),(4,1635,8,41,'AC',56,8),(3,1354,10,41,'AA',57,11),(3,1041,2,42,'CA',4,5),(1,1112,1,42,'MU',13,16),(4,1940,8,42,'AS',15,1),(2,1887,5,42,'DL',19,13),(2,2124,8,42,'BA',22,13),(3,2738,8,42,'DL',27,6),(2,2074,14,42,'AS',28,7),(1,1692,2,42,'CA',35,5),(1,1891,20,42,'WN',44,12),(1,2007,6,42,'AC',45,15),(3,2186,6,42,'WN',49,2),(1,2921,3,42,'AS',58,11),(2,2486,8,42,'DL',60,17),(5,1254,3,43,'7C',2,1),(3,2457,7,43,'CA',4,9),(5,2015,15,43,'UA',6,6),(3,1174,5,43,'B6',8,13),(3,2471,1,43,'BA',14,14),(5,1478,14,43,'HU',18,1),(3,1656,1,43,'AA',19,17),(3,2871,1,43,'AF',23,10),(5,2842,10,43,'B6',25,16),(5,2961,9,43,'CA',29,7),(4,1266,2,43,'HA',30,10),(1,2595,6,43,'B6',39,12),(5,2414,3,43,'AS',56,15),(4,1908,2,43,'B6',59,8),(3,2954,10,43,'AA',60,6),(2,1076,10,44,'BA',10,16),(5,1102,8,44,'BA',19,5),(2,1995,1,44,'OZ',20,1),(4,2291,17,44,'TRA',21,14),(3,2779,6,44,'B6',24,3),(1,1803,9,44,'AA',27,15),(3,2377,8,44,'CA',42,7),(1,2398,5,44,'BA',51,14),(4,1743,6,44,'BA',52,13),(1,2115,19,44,'7C',54,17),(2,2281,2,44,'TG',59,3),(5,1224,10,45,'OZ',7,3),(1,2975,6,45,'CA',12,13),(2,1019,18,45,'WN',17,15),(2,2864,8,45,'B6',22,5),(2,1703,6,45,'AS',24,9),(2,2675,7,45,'AF',27,9),(5,2571,21,45,'B6',31,2),(3,1940,6,45,'AF',37,12),(4,2878,5,45,'AF',41,9),(4,1795,7,45,'7C',50,9),(5,2588,1,45,'B6',53,15),(3,1107,19,45,'BA',59,16),(2,1047,5,46,'AC',3,1),(1,2545,17,46,'7C',8,16),(3,2807,3,46,'B6',9,11),(3,1618,2,46,'7C',10,14),(4,2055,7,46,'LH',12,2),(4,1602,2,46,'B6',13,12),(4,1897,1,46,'AA',15,11),(3,2251,13,46,'7C',24,2),(2,1155,8,46,'BA',26,10),(5,2015,9,46,'B6',28,14),(4,2237,10,46,'7C',32,11),(5,1940,3,46,'AS',36,16),(1,2994,17,46,'TRA',45,5),(3,2983,11,46,'B6',50,6),(4,2425,20,46,'B6',54,8),(1,2342,3,47,'WN',11,1),(4,1554,13,47,'AA',19,7),(5,1754,1,47,'CA',22,3),(3,2970,1,47,'AA',25,15),(2,2788,20,47,'UA',34,5),(5,1441,21,47,'MU',35,7),(1,2614,7,47,'B6',38,8),(4,2414,21,47,'AA',39,9),(4,1531,2,47,'B6',46,10),(4,1106,10,47,'AF',53,8),(3,1547,4,47,'AF',59,5),(4,2145,5,48,'OZ',2,15),(2,2362,5,48,'AF',4,13),(5,2887,17,48,'WN',7,5),(1,2367,21,48,'B6',12,17),(4,2503,10,48,'B6',16,11),(1,2514,8,48,'7C',17,10),(3,2314,5,48,'CA',22,13),(3,2960,3,48,'OZ',31,6),(1,1437,8,48,'AF',33,10),(4,2098,13,48,'DL',39,3),(2,1935,4,48,'AA',43,9),(3,1955,17,48,'AS',44,4),(3,1320,3,48,'AC',52,3),(3,1251,1,48,'OZ',54,9),(4,2040,6,49,'AS',2,14),(5,2937,1,49,'OZ',13,11),(5,1480,1,49,'AC',16,10),(5,2070,7,49,'AC',19,11),(1,2493,3,49,'BA',24,4),(3,1166,15,49,'TRA',31,7),(3,2864,13,49,'7C',38,12),(3,2844,8,49,'BA',40,10),(5,2972,18,49,'MU',41,7),(3,2489,3,49,'7C',47,5),(2,1633,2,49,'7C',60,2),(4,2869,1,50,'CA',9,8),(2,2985,4,50,'BA',10,8),(2,1450,8,50,'BA',17,1),(1,2384,7,50,'BA',19,6),(3,1578,4,50,'7C',22,12),(1,2270,9,50,'AF',23,8),(3,2852,15,50,'AC',25,16),(5,2429,11,50,'HA',26,1),(4,2985,19,50,'CA',31,3),(5,1849,21,50,'HA',32,11),(2,1982,2,50,'AC',34,12),(3,1085,4,50,'CA',37,3),(1,2037,10,50,'AC',40,15),(2,2021,14,50,'DL',44,13),(1,1749,4,50,'AA',55,13),(5,1267,18,50,'CZ',60,12),(5,1300,7,51,'AC',3,8),(5,2573,8,51,'BA',5,9),(4,2791,2,51,'AA',10,2),(1,1434,3,51,'AA',11,12),(1,2179,4,51,'AF',13,16),(1,2734,2,51,'BA',15,16),(1,2245,9,51,'BA',18,10),(3,2565,4,51,'HA',30,2),(2,1258,10,51,'NK',31,12),(5,1827,3,51,'7C',34,13),(3,1640,7,51,'BA',35,2),(3,1390,9,51,'DL',40,15),(1,2584,10,51,'BA',41,13),(3,2708,7,51,'AS',47,4),(4,2159,10,51,'AA',51,8),(1,1243,9,52,'BA',4,9),(2,1560,4,52,'HA',11,3),(3,2089,3,52,'AC',12,7),(5,1130,8,52,'AA',16,2),(1,2177,10,52,'B6',20,6),(3,1991,10,52,'AF',22,13),(1,1197,2,52,'CA',25,11),(1,2234,8,52,'CA',29,14),(4,2019,1,52,'UA',30,2),(2,1470,11,52,'HU',35,13),(4,2208,14,52,'CZ',36,8),(2,1400,2,52,'7C',37,8),(1,1459,5,52,'AS',44,4),(1,1346,12,52,'B6',51,13),(2,2487,10,52,'CA',52,16),(5,1897,7,52,'AS',53,10),(3,2678,9,52,'BA',56,10),(4,1911,2,53,'7C',3,2),(3,2295,6,53,'BA',5,10),(2,1932,10,53,'7C',11,4),(5,1956,6,53,'AF',13,9),(1,1759,8,53,'WN',19,12),(3,2054,12,53,'AA',24,2),(3,2527,8,53,'AS',25,9),(5,1907,10,53,'B6',27,16),(1,1733,5,53,'7C',29,7),(5,2194,2,53,'7C',34,15),(5,1267,5,53,'CA',37,15),(4,1353,9,53,'AC',41,6),(1,1859,4,53,'AF',45,2),(2,2760,9,53,'CA',50,1),(2,2639,2,53,'7C',58,6),(1,2988,6,54,'BA',17,9),(2,2354,3,54,'B6',18,8),(4,2376,10,54,'MU',25,12),(2,2357,4,54,'NK',38,15),(4,2727,21,54,'HU',44,6),(5,2807,7,54,'CZ',46,5),(2,1438,8,54,'BA',47,13),(2,1080,10,54,'7C',52,10),(5,2578,9,54,'AF',57,10),(3,1524,4,54,'AC',60,10),(4,1022,13,55,'HU',2,6),(2,2239,9,55,'CA',4,10),(5,1585,7,55,'BA',12,13),(5,2753,10,55,'AC',14,17),(2,2774,9,55,'7C',16,9),(2,2096,10,55,'WN',20,6),(1,2144,8,55,'TRA',21,15),(3,2069,20,55,'HA',22,2),(5,2980,8,55,'AA',23,2),(4,1929,2,55,'7C',27,4),(4,1363,6,55,'BA',28,1),(4,1066,7,55,'7C',29,11),(3,1800,18,55,'JO',30,13),(2,1364,7,55,'BA',32,4),(4,1617,9,55,'AF',34,6),(1,2278,2,55,'TG',42,8),(2,2931,2,55,'AA',49,5),(4,2441,1,55,'AF',53,8),(2,2340,10,55,'AA',54,1),(1,1615,6,56,'7C',10,3),(1,2605,10,56,'AS',26,3),(1,2875,7,56,'AA',27,16),(2,1751,19,56,'HA',40,9),(3,1445,5,56,'BA',43,17),(5,1869,1,56,'BA',46,12),(4,2722,16,56,'7C',48,13),(1,1910,8,56,'B6',52,2),(3,2317,21,56,'LH',55,15),(4,2395,8,56,'AA',56,12),(5,1877,1,56,'AC',59,10),(2,2066,9,56,'BA',60,2),(3,2651,10,57,'BA',12,6),(3,1797,10,57,'AS',13,16),(5,2206,16,57,'TRA',18,3),(1,2474,15,57,'JO',22,14),(2,2232,18,57,'UA',24,8),(3,2943,4,57,'UA',26,12),(3,2768,5,57,'AF',34,8),(5,1390,3,57,'BA',37,1),(2,1216,9,57,'AF',42,13),(2,1696,11,57,'TRA',44,15),(3,2397,6,57,'B6',55,13),(4,2223,5,57,'7C',56,6),(1,1128,4,58,'BA',8,15),(5,1129,10,58,'AC',14,7),(3,1349,1,58,'CA',16,12),(3,1811,6,58,'7C',19,12),(5,2685,5,58,'AC',20,12),(1,1323,4,58,'B6',32,17),(1,1913,7,58,'AA',34,15),(4,1569,5,58,'OZ',37,8),(3,2760,8,58,'AS',42,2),(4,2692,10,58,'AF',45,9),(3,2086,9,58,'AC',47,13),(3,2684,6,58,'B6',56,15),(5,1980,9,58,'CZ',58,15),(3,1135,11,59,'UA',4,10),(2,1058,10,59,'7C',9,4),(2,1991,17,59,'AC',14,5),(4,1297,7,59,'CA',18,17),(2,1459,1,59,'7C',20,6),(2,1609,4,59,'BA',23,10),(4,2383,14,59,'AC',28,16),(1,1824,4,59,'B6',44,8),(4,1677,17,59,'AF',51,16),(1,2152,4,59,'AF',55,13),(1,2488,1,59,'7C',57,14),(2,2025,10,60,'AA',7,5),(1,1853,2,60,'BA',9,10),(5,1154,1,60,'AS',11,17),(5,2929,4,60,'AC',12,5),(5,1632,3,60,'NK',14,14),(4,2050,4,60,'AF',17,13),(2,1911,6,60,'AA',21,8),(4,2944,8,60,'MU',22,12),(2,1509,14,60,'CA',31,4),(4,2957,6,60,'7C',32,7),(3,2675,4,60,'AC',37,9),(1,1385,20,60,'UA',44,12),(1,1274,1,60,'CA',46,14),(2,1213,7,60,'AF',57,15),(1,1882,6,60,'B6',58,15),(2,2221,7,60,'AF',59,12),(5,1160,1,61,'BA',3,13),(5,2736,4,61,'CA',13,13),(3,1040,2,61,'AA',16,6),(1,1399,8,61,'CA',21,4),(4,1720,5,61,'BA',24,7),(5,1493,12,61,'NK',30,3),(4,2696,7,61,'AC',38,5),(4,2018,4,61,'CZ',41,13),(5,2259,8,61,'AA',45,15),(1,1711,4,61,'HU',51,6),(2,1277,7,61,'AA',56,1),(1,1554,2,61,'CA',57,1),(5,1377,15,61,'JO',58,17),(5,2666,8,61,'CA',60,7),(2,2565,9,62,'AF',1,15),(5,2374,3,62,'B6',4,8),(5,2789,7,62,'B6',10,12),(1,1286,8,62,'AF',12,1),(5,2801,5,62,'BA',18,6),(5,1865,6,62,'AS',26,11),(3,2511,9,62,'AS',37,5),(1,1327,9,62,'BA',40,17),(2,2880,9,62,'AS',43,9),(2,1817,8,62,'AS',47,1),(3,1911,9,62,'BA',49,3),(1,2273,6,62,'AS',56,4),(2,2073,1,62,'CA',57,11),(4,2558,3,63,'CA',1,15),(1,1411,1,63,'BA',4,1),(2,1647,7,63,'AA',10,5),(4,2079,1,63,'AF',14,2),(5,2494,2,63,'AS',36,2),(4,2391,4,63,'AS',44,13),(4,1914,14,63,'B6',54,12),(5,1092,5,63,'AF',58,14),(1,1650,2,63,'AA',59,13),(2,2274,3,64,'CZ',9,11),(1,2613,18,64,'BA',13,10),(2,2766,21,64,'HU',14,10),(1,1506,10,64,'B6',20,13),(4,2183,6,64,'AC',24,14),(1,1016,17,64,'AA',27,7),(1,1760,17,64,'TG',34,5),(2,1854,6,64,'7C',39,8),(5,2702,12,64,'AS',43,8),(3,2363,3,64,'CZ',46,1),(4,2653,1,64,'B6',48,12),(4,1890,6,64,'AC',58,13),(2,1268,6,65,'7C',8,9),(5,1001,10,65,'AF',9,16),(5,1924,9,65,'AF',13,4),(2,1613,2,65,'7C',27,2),(4,1788,4,65,'BA',28,14),(3,2407,17,65,'HA',30,2),(5,2909,1,65,'WN',34,14),(1,2900,5,65,'AA',38,4),(5,2856,10,65,'B6',44,16),(4,2744,2,65,'BA',53,15),(4,2233,10,65,'CZ',54,17),(1,1285,5,66,'7C',1,7),(1,2296,6,66,'BA',3,10),(3,2146,9,66,'BA',6,13),(5,2284,12,66,'CZ',16,15),(3,2208,5,66,'AS',17,8),(4,2823,10,66,'CA',18,11),(2,2089,5,66,'B6',19,11),(3,2435,2,66,'AA',24,6),(4,1360,2,66,'AS',32,8),(1,2609,9,66,'AF',36,12),(1,2220,7,66,'TRA',39,15),(5,1717,10,66,'7C',43,4),(2,2755,10,66,'B6',52,16),(5,2774,3,66,'AS',54,2),(2,1576,8,66,'AS',58,3),(4,2795,8,66,'NK',60,2),(4,1386,4,67,'MU',11,6),(5,1839,3,67,'TRA',12,11),(4,1969,2,67,'OZ',16,14),(1,2009,5,67,'B6',17,9),(3,1019,14,67,'AC',19,1),(1,1251,5,67,'NK',23,10),(3,1084,18,67,'NK',32,8),(4,2918,7,67,'7C',35,16),(4,1373,9,67,'BA',41,1),(3,1120,5,67,'AS',42,8),(1,2704,10,67,'CA',46,11),(3,1623,3,67,'BA',48,12),(1,1904,2,67,'CA',50,14),(1,2026,12,67,'WN',53,14),(3,1558,10,68,'CA',3,15),(2,2400,1,68,'CA',7,9),(5,1652,7,68,'B6',13,3),(4,2078,2,68,'BA',14,12),(5,1582,9,68,'AS',15,7),(2,2622,10,68,'AA',22,4),(4,2862,3,68,'7C',27,15),(4,2797,4,68,'BA',40,7),(1,1404,8,68,'AC',45,13),(4,2846,17,68,'CA',46,3),(4,2857,19,68,'7C',47,1),(2,1960,6,68,'AS',50,1),(5,1670,5,68,'AC',51,9),(5,1819,3,68,'AA',57,15),(3,2214,1,68,'BA',60,16),(3,1795,9,69,'CA',19,6),(4,2125,1,69,'AS',24,16),(3,2547,9,69,'AS',33,12),(2,2183,4,69,'7C',41,11),(2,1066,14,69,'AF',44,5),(5,2815,8,69,'TRA',45,10),(2,1130,8,70,'AA',3,14),(2,2700,8,70,'CA',8,7),(4,2075,3,70,'B6',10,15),(2,2228,5,70,'AS',14,13),(5,1451,4,70,'AF',20,5),(1,2661,4,70,'LH',22,8),(3,1210,5,70,'B6',24,8),(5,2194,14,70,'HU',26,6),(4,1618,12,70,'OZ',29,9),(1,2395,9,70,'BA',35,9),(4,1176,16,70,'AS',40,7),(1,1020,8,70,'AC',45,14),(5,1516,3,70,'B6',51,1),(3,2465,20,71,'OZ',4,9),(5,1607,5,71,'DL',8,17),(2,2170,7,71,'WN',9,15),(3,2590,3,71,'AS',12,15),(5,1446,1,71,'CA',18,7),(4,1882,20,71,'HU',22,14),(4,2172,14,71,'TRA',26,10),(2,1307,4,71,'BA',27,1),(1,1718,18,71,'HA',32,12),(1,2504,17,71,'7C',33,6),(2,1096,10,71,'AS',35,9),(3,2978,5,71,'AA',45,1),(2,2110,4,72,'AF',4,1),(4,2304,3,72,'CA',5,11),(2,1237,3,72,'AC',8,11),(5,2177,9,72,'B6',12,15),(2,1958,4,72,'AA',15,11),(5,2460,3,72,'AS',17,11),(5,1416,2,72,'AS',28,2),(2,2489,20,72,'7C',32,12),(3,2532,18,72,'HA',45,12),(5,2919,8,72,'AA',52,4),(3,1021,6,72,'AC',53,9),(4,1893,11,73,'AC',3,4),(2,1006,11,73,'DL',5,7),(4,1703,7,73,'AC',9,9),(3,1364,8,73,'AC',11,14),(5,2178,10,73,'BA',13,14),(5,2986,6,73,'AC',27,5),(3,2335,10,73,'CA',33,8),(5,2316,5,73,'B6',39,2),(4,2277,4,73,'CA',42,1),(1,1218,3,73,'B6',45,3),(3,3000,3,73,'AA',47,3),(1,2790,6,73,'WN',49,1),(1,2982,21,73,'7C',59,6),(2,2021,3,74,'AF',5,1),(1,1460,4,74,'7C',10,15),(3,1258,1,74,'B6',11,4),(4,1040,7,74,'CA',14,6),(4,2575,4,74,'7C',18,8),(1,2626,10,74,'CA',23,5),(3,2602,2,74,'7C',26,14),(4,1847,5,74,'AC',32,8),(4,2451,3,74,'AF',36,8),(5,1137,21,74,'CA',37,15),(5,2424,14,74,'CA',45,13),(1,1625,8,74,'BA',47,1),(1,2195,5,74,'7C',51,10),(4,1993,1,74,'AA',55,10),(3,1908,7,75,'UA',6,5),(2,2086,12,75,'WN',7,6),(3,1044,2,75,'CZ',11,10),(2,1603,2,75,'BA',15,16),(5,2033,14,75,'AF',19,15),(1,2765,2,75,'AS',20,4),(4,2395,2,75,'BA',24,10),(2,2560,4,75,'BA',26,15),(2,2922,15,75,'HU',28,7),(1,1462,4,75,'UA',30,10),(1,2490,8,75,'B6',31,13),(3,2364,8,75,'CA',39,12),(3,1433,9,75,'AA',41,1),(4,1537,5,75,'AS',42,9),(2,2930,5,75,'BA',44,13),(1,2761,3,75,'CA',53,12),(2,2974,2,75,'AS',54,7),(1,2998,3,75,'BA',56,6),(4,1827,16,75,'CA',59,2),(4,1228,2,75,'AC',60,11),(5,2944,1,76,'AC',10,6),(1,2517,6,76,'AF',16,10),(4,2536,5,76,'AF',18,7),(5,2287,4,76,'B6',24,12),(5,1304,7,76,'7C',28,12),(3,2108,7,76,'BA',32,7),(1,1310,7,76,'AA',34,10),(2,2388,10,76,'WN',36,17),(3,2007,8,76,'AC',37,8),(2,1241,2,76,'7C',40,10),(3,1159,21,76,'HU',43,3),(4,2848,16,76,'NK',52,17),(4,1735,20,76,'WN',57,6),(3,2217,3,77,'AF',5,12),(5,1937,15,77,'CZ',12,2),(1,1918,9,77,'AA',18,12),(2,2260,8,77,'AA',22,16),(1,1973,11,77,'7C',32,15),(5,1366,16,77,'TG',37,10),(4,1936,4,77,'7C',41,12),(4,2659,6,77,'AA',43,12),(2,1897,7,77,'B6',46,8),(4,1102,6,77,'B6',55,3),(1,2316,3,77,'7C',60,9),(5,2350,18,78,'LH',1,2),(3,1223,6,78,'CA',7,15),(2,1357,5,78,'AC',11,13),(2,1450,20,78,'TRA',13,15),(5,1235,7,78,'WN',24,11),(4,1231,2,78,'AS',31,6),(1,1107,18,78,'AS',34,12),(5,2649,8,78,'AF',37,2),(5,2517,10,78,'BA',38,9),(2,1800,3,78,'7C',46,11),(5,1295,10,78,'7C',50,13),(1,1768,13,78,'TG',55,8),(2,2529,21,78,'HA',59,8),(2,1073,10,78,'B6',60,5),(5,2916,2,79,'TRA',2,5),(5,1026,7,79,'AC',14,12),(2,2284,4,79,'AF',15,10),(3,2641,5,79,'MU',16,7),(2,2076,10,79,'AA',25,7),(4,2105,1,79,'CA',32,11),(4,1048,19,79,'TG',35,17),(3,1083,18,79,'AF',49,3),(2,1263,15,79,'NK',55,10),(5,1629,4,79,'B6',59,2),(5,2482,2,80,'BA',3,9),(1,2218,3,80,'AA',13,11),(3,1955,1,80,'TG',17,1),(3,2707,18,80,'HU',26,6),(1,1769,13,80,'DL',28,15),(5,1830,2,80,'AA',33,3),(3,1846,20,80,'AC',36,11),(4,1911,10,80,'B6',40,2),(4,1403,7,80,'AA',41,13),(3,2758,21,80,'MU',48,2),(3,2444,1,80,'DL',50,10),(5,1146,12,81,'OZ',9,6),(5,1242,1,81,'7C',12,16),(1,2497,8,81,'B6',14,8),(5,2189,1,81,'AC',19,5),(2,2779,3,81,'AF',30,14),(1,2800,1,81,'AF',41,6),(3,1882,9,81,'AF',47,3),(1,1311,9,81,'AS',51,12),(4,2041,7,81,'AC',54,12),(3,1175,6,81,'CA',59,4),(1,2427,15,82,'AA',3,10),(4,1091,16,82,'B6',8,1),(3,2189,9,82,'AS',9,13),(3,2050,2,82,'7C',12,13),(4,1372,9,82,'B6',14,1),(5,1299,9,82,'HU',15,6),(4,2393,3,82,'AS',16,13),(4,1986,3,82,'7C',18,10),(4,2594,21,82,'UA',20,13),(1,1952,2,82,'7C',23,15),(3,1148,15,82,'DL',24,15),(4,2658,7,82,'AA',26,13),(1,1419,2,82,'AC',27,16),(4,2753,8,82,'BA',28,12),(4,1513,11,82,'OZ',31,8),(3,1469,1,82,'BA',44,15),(4,1348,6,82,'AF',50,13),(1,1207,10,82,'7C',52,5),(1,2341,16,82,'NK',55,15),(4,2151,10,83,'AC',1,4),(2,2654,6,83,'7C',5,10),(1,2218,4,83,'OZ',20,1),(2,2702,13,83,'B6',22,9),(3,1256,4,83,'AS',34,1),(1,2275,8,83,'AA',38,16),(3,1630,7,83,'NK',45,4),(3,1055,2,83,'AF',47,17),(3,1469,9,83,'CA',58,14),(4,2494,4,84,'AC',2,2),(2,2772,8,84,'AS',10,10),(4,2272,1,84,'AA',13,15),(3,1344,1,84,'AF',20,10),(2,1713,4,84,'7C',23,15),(4,2755,3,84,'BA',24,15),(3,1880,2,84,'AF',25,17),(5,1592,1,84,'B6',28,15),(2,2589,14,84,'LH',33,3),(4,2152,2,84,'AA',49,6),(4,2471,4,84,'AF',55,5),(1,1557,2,84,'AC',57,9),(2,2688,18,85,'WN',7,4),(5,2443,7,85,'AS',9,6),(1,1802,5,85,'AF',10,6),(4,1745,9,85,'AF',18,9),(4,1504,3,85,'BA',26,15),(3,1768,3,85,'BA',30,17),(4,1485,2,85,'CA',32,17),(5,1392,20,85,'CZ',37,8),(5,2240,20,85,'DL',40,2),(3,2349,5,85,'CA',41,6),(4,1004,9,85,'TRA',42,1),(3,1383,9,85,'AC',43,6),(2,2939,10,85,'7C',46,4),(5,1088,10,85,'7C',47,7),(4,2272,13,85,'DL',55,7),(1,2491,5,85,'AS',57,1),(2,1316,2,85,'CA',58,14),(1,1598,1,86,'AA',3,9),(3,1163,2,86,'LH',5,15),(5,1523,7,86,'AS',18,14),(4,2553,9,86,'AF',19,3),(1,1486,1,86,'AS',21,12),(1,2962,9,86,'AC',22,8),(2,2091,9,86,'7C',28,3),(2,1003,6,86,'AA',29,2),(3,2341,3,86,'AC',35,15),(3,2619,3,86,'TG',39,8),(1,1281,8,86,'AF',40,1),(1,2603,12,86,'HA',42,13),(3,2092,1,86,'AF',44,9),(2,2271,10,86,'BA',47,15),(3,1760,19,86,'NK',49,13),(3,2746,9,86,'AF',52,16),(4,1085,3,86,'AA',56,1),(2,1265,8,86,'AS',58,6),(5,2996,4,86,'BA',60,13),(2,2229,9,87,'CA',7,16),(5,2940,2,87,'B6',8,15),(3,2186,7,87,'7C',11,7),(4,2448,1,87,'CA',24,13),(3,1970,9,87,'BA',26,3),(2,2516,8,87,'DL',34,12),(5,1532,17,87,'AA',37,13),(1,2653,17,87,'CZ',38,17),(1,1278,21,87,'JO',39,3),(1,2432,10,87,'AC',46,5),(1,1273,2,87,'AC',47,7),(2,1568,1,87,'BA',51,12),(1,1364,11,87,'AA',52,7),(2,2714,18,88,'HA',4,13),(3,2041,5,88,'AS',9,11),(4,2841,1,88,'BA',14,2),(5,2971,5,88,'B6',15,7),(2,2831,3,88,'AF',25,7),(1,2198,13,88,'CZ',30,11),(3,2475,5,88,'AC',38,7),(3,1835,1,88,'BA',40,17),(3,2445,4,88,'WN',44,5),(2,2571,8,88,'7C',45,8),(2,1430,9,88,'AS',46,4),(5,1163,7,88,'AS',48,13),(5,1179,3,88,'AA',51,16),(1,2939,3,88,'B6',53,15),(5,2882,15,88,'TG',54,15),(4,2612,9,88,'BA',56,9),(1,1212,3,89,'7C',7,9),(5,2828,4,89,'7C',9,4),(3,1297,7,89,'AC',13,7),(3,2493,18,89,'AF',18,17),(1,2138,13,89,'BA',22,1),(4,1657,5,89,'AF',25,11),(5,2093,19,89,'AA',30,17),(1,2209,11,89,'CZ',31,15),(1,2564,5,89,'CA',32,5),(3,2126,16,89,'AA',38,7),(3,1515,9,89,'AA',39,1),(3,2962,10,89,'BA',44,1),(3,1402,4,89,'NK',47,8),(2,2642,8,89,'AS',52,3),(3,2238,9,89,'CA',59,10),(2,2564,7,90,'AA',1,6),(1,2915,9,90,'CA',4,8),(1,2427,5,90,'AS',8,12),(3,1922,20,90,'WN',12,15),(5,1932,4,90,'B6',18,1),(4,1070,7,90,'BA',20,6),(5,1206,3,90,'BA',22,13),(3,2930,9,90,'AC',23,2),(5,2235,4,90,'TRA',27,11),(5,2554,2,90,'AA',34,5),(4,2252,14,90,'LH',40,13),(4,2189,10,90,'BA',41,2),(3,2643,12,90,'NK',52,2),(3,1832,6,90,'OZ',56,4),(2,2334,6,91,'7C',2,14),(3,2968,10,91,'OZ',6,17),(4,1845,10,91,'B6',9,3),(5,2067,21,91,'HA',10,15),(4,1254,4,91,'CA',21,13),(2,1951,11,91,'AF',22,12),(1,1992,5,91,'AA',29,6),(2,1812,7,91,'AA',58,17),(3,1434,10,92,'7C',11,17),(3,1459,10,92,'7C',23,11),(3,1878,6,92,'B6',25,16),(2,2394,2,92,'BA',27,16),(3,2372,2,92,'AA',29,5),(5,2882,14,92,'TRA',33,11),(4,2124,3,92,'7C',37,15),(1,2641,4,92,'CA',38,4),(4,2611,14,92,'HA',45,11),(5,2566,2,92,'BA',50,10),(1,2102,17,92,'AA',58,4),(3,1955,9,92,'B6',59,11),(5,2461,1,92,'TRA',60,5),(5,1985,3,93,'AA',8,15),(5,1995,7,93,'AF',11,12),(1,2468,1,93,'AS',22,14),(5,2520,1,93,'B6',23,16),(1,2603,3,93,'AS',26,13),(2,2128,12,93,'AA',27,7),(5,2798,10,93,'AF',38,13),(5,1461,4,93,'7C',42,7),(2,1741,4,93,'TRA',43,9),(4,2226,4,93,'JO',49,17),(5,1116,7,93,'HA',50,8),(5,1437,1,93,'AS',51,11),(2,1776,2,93,'AS',58,9),(5,1133,1,93,'CA',59,11),(5,2212,17,94,'DL',1,16),(5,1539,6,94,'CZ',9,8),(2,1454,7,94,'B6',16,12),(2,2063,4,94,'JO',19,8),(3,2936,4,94,'B6',20,7),(2,1242,10,94,'LH',23,8),(3,2903,5,94,'7C',26,6),(1,2104,2,94,'BA',35,15),(1,1515,7,94,'AC',37,15),(2,1065,8,94,'B6',38,1),(5,2074,17,94,'AC',39,15),(5,1732,5,94,'BA',44,17),(3,2362,1,94,'CA',51,5),(5,1939,4,94,'TRA',59,13),(4,2003,3,95,'7C',3,14),(4,1370,8,95,'AA',4,11),(1,2940,4,95,'JO',8,2),(1,1268,7,95,'CA',9,1),(2,2352,4,95,'AC',11,6),(4,2577,9,95,'AA',13,9),(1,1183,6,95,'B6',18,16),(5,2245,11,95,'AF',19,10),(3,1608,7,95,'CA',29,7),(2,1905,7,95,'AS',33,17),(5,2231,19,95,'CZ',35,15),(2,2693,5,95,'AC',36,1),(3,1666,3,95,'7C',45,14),(5,2889,9,95,'AS',54,8),(3,2670,10,96,'AS',2,14),(1,2156,7,96,'BA',25,3),(2,1489,1,96,'WN',27,5),(5,2816,8,96,'AF',29,8),(3,2574,7,96,'HU',33,9),(1,2596,6,96,'AS',42,15),(4,1452,10,96,'B6',50,16),(4,1423,15,96,'DL',59,1),(2,2546,4,96,'AA',60,6),(5,1436,4,97,'AA',2,16),(1,1722,1,97,'7C',8,6),(2,1754,5,97,'B6',22,2),(2,1385,9,97,'BA',23,17),(5,1456,7,97,'BA',29,5),(5,2442,4,97,'BA',33,16),(2,2468,5,97,'AA',53,12),(5,1942,2,98,'BA',1,13),(5,2069,3,98,'BA',2,14),(5,1048,10,98,'AF',4,4),(1,2159,4,98,'B6',6,10),(4,1564,9,98,'B6',7,10),(2,1810,7,98,'CA',8,17),(3,1610,21,98,'NK',12,2),(2,2053,8,98,'AA',18,12),(1,2070,5,98,'AF',22,3),(5,1794,12,98,'HA',24,12),(5,1608,15,98,'BA',26,11),(5,2926,7,98,'AF',31,14),(3,2792,10,98,'AA',41,9),(3,1313,7,98,'BA',42,5),(4,1100,8,98,'AF',43,11),(2,1125,7,98,'AC',45,10),(2,1425,8,98,'7C',46,2),(2,2116,5,98,'HA',49,8),(1,1947,8,98,'NK',52,16),(3,2671,3,98,'AA',53,6),(1,2017,8,98,'AA',54,5),(4,2841,8,98,'AC',60,15),(1,1862,8,99,'TRA',11,12),(5,1048,3,99,'B6',17,11),(4,2850,7,99,'CA',18,5),(2,2895,6,99,'AF',22,13),(3,2942,17,99,'AC',23,4),(1,2513,9,99,'AS',26,3),(4,1442,6,99,'B6',29,12),(4,1730,5,99,'JO',34,17),(1,2183,6,99,'B6',36,5),(2,1001,7,99,'TRA',39,15),(2,2581,5,99,'LH',42,4),(3,2572,8,99,'AF',47,14),(3,2768,3,99,'AS',57,3),(1,2888,7,99,'CA',59,8),(2,1339,1,100,'AS',1,12),(3,2361,3,100,'AS',11,14),(3,2202,5,100,'7C',14,12),(2,2363,6,100,'BA',19,6),(1,1762,6,100,'HA',22,13),(1,1405,5,100,'BA',31,9),(3,2945,20,100,'CA',32,13),(5,1268,13,100,'AC',38,16),(3,2235,6,100,'AS',40,11),(4,1216,7,100,'DL',52,3),(3,1591,5,100,'AF',56,10),(5,2163,9,100,'7C',57,12),(5,2784,9,100,'7C',58,16),(2,1621,4,100,'B6',60,14),(2,1527,4,101,'AF',53,11),(3,2035,3,102,'AC',19,2),(5,2117,3,102,'7C',22,13),(1,2895,3,102,'AA',50,15),(2,1459,3,103,'7C',5,16),(5,2027,1,103,'AA',6,1),(4,1385,2,104,'AC',8,6),(4,2071,1,104,'7C',11,14),(1,1710,4,104,'AF',33,12),(5,1623,4,105,'AC',3,2),(4,1447,4,105,'AC',18,7),(4,2187,3,105,'AF',30,8),(5,2656,3,106,'7C',59,3),(1,2904,2,107,'AF',3,13),(1,1389,1,107,'AF',15,13),(2,1467,2,108,'AC',20,15),(4,1174,2,109,'AF',29,7),(3,2805,2,110,'AF',16,3),(5,2434,2,110,'AF',44,2),(1,2012,1,112,'7C',2,9),(5,1165,3,112,'7C',10,5),(5,1901,2,113,'AA',35,14),(3,1774,1,113,'7C',37,13),(2,1495,1,114,'AF',54,2),(3,1930,1,116,'AF',37,14),(2,2070,2,116,'7C',52,3),(5,2898,4,118,'AC',27,8),(3,2099,1,119,'AF',6,8),(3,2271,2,119,'AF',31,11),(1,1347,4,119,'AC',48,6),(5,1857,3,120,'AC',1,13),(3,1371,1,120,'AA',14,5),(2,2294,3,122,'AA',27,7),(5,2492,1,124,'7C',36,11),(4,2116,3,124,'AC',57,13),(1,2387,3,125,'7C',47,11),(3,1144,1,126,'AC',8,8),(3,2264,3,126,'AF',32,7),(3,1406,3,127,'AF',28,8),(1,1575,3,127,'AC',31,7),(4,1911,2,128,'AC',26,8),(3,2432,2,129,'AC',3,13),(4,1773,3,130,'AA',8,9),(1,2997,2,130,'7C',60,10),(1,2995,4,133,'AC',47,9),(4,2400,3,133,'AA',50,10),(3,1601,2,133,'AC',53,9),(3,2494,3,134,'AA',16,11),(1,2858,4,135,'7C',26,1),(5,1026,1,135,'AA',55,7),(3,1210,2,136,'AF',43,7),(1,1331,1,136,'7C',57,2),(4,1584,4,137,'AF',37,14),(2,1870,3,139,'AF',7,12),(3,2438,3,139,'AA',58,13),(1,1836,1,142,'AC',11,9),(2,1406,4,142,'AF',27,17),(1,2688,4,142,'AA',34,3),(2,1678,4,142,'AF',36,11),(2,2734,3,142,'AF',44,16),(3,2888,1,143,'7C',1,6),(4,1820,2,143,'AC',22,14),(4,2333,3,143,'AC',54,4),(5,2011,1,144,'AA',24,5),(1,2746,4,144,'AC',38,17),(2,2280,1,144,'7C',52,3),(1,2033,4,145,'AC',27,8),(4,2354,3,145,'AA',28,16),(1,2125,3,146,'AC',3,6),(3,1570,1,146,'AA',15,4),(1,1612,3,146,'7C',42,11),(1,2438,3,147,'AA',21,5),(2,1995,3,149,'AA',5,9),(3,2804,2,149,'AC',20,15),(1,2174,3,151,'AC',13,5),(2,1462,1,152,'7C',6,16),(5,1187,4,152,'AC',10,15),(5,1235,4,153,'AF',44,14),(5,2493,4,153,'AF',50,12),(4,2840,4,153,'7C',58,9),(1,1156,3,154,'7C',50,15),(5,2556,2,155,'AC',16,12),(5,1732,2,155,'7C',56,15),(2,1483,2,156,'7C',23,6),(3,1064,2,156,'AA',49,7),(5,1577,2,156,'7C',60,11),(5,1220,1,157,'7C',22,7),(4,2893,3,157,'7C',56,17),(2,1102,3,158,'7C',17,16),(5,1631,4,158,'7C',54,7),(5,1784,2,159,'AA',43,17),(2,2785,1,161,'AF',1,10),(1,1879,1,161,'AA',28,15),(4,1782,1,162,'AF',24,1),(5,2097,2,162,'AC',30,2),(4,2786,1,162,'AA',45,13),(2,1152,3,163,'AC',44,4),(5,2774,3,164,'AA',20,8),(3,2494,2,164,'AF',35,11),(3,2134,3,166,'AA',16,4),(1,1530,1,167,'7C',31,16),(1,2778,2,167,'AA',51,7),(4,1084,2,169,'AA',28,4),(4,2712,4,172,'AA',58,16),(2,2754,4,173,'7C',30,7),(4,1907,2,176,'7C',40,5),(3,1416,2,177,'AA',7,14),(1,2016,1,177,'AA',30,14),(1,1314,4,177,'AC',60,15),(3,2214,3,178,'AF',16,13),(2,2545,3,179,'AF',14,3),(5,2948,3,181,'AF',14,8),(1,1875,1,183,'7C',55,16),(2,2907,3,184,'AF',57,3),(3,1028,4,185,'AF',28,8),(3,1735,3,185,'AA',56,1),(2,2266,1,185,'AC',60,1),(2,1672,4,186,'7C',26,1),(5,1807,3,186,'AC',27,10),(3,1251,2,187,'AC',32,5),(3,2239,1,188,'AC',14,6),(2,1318,4,188,'AF',17,2),(5,1241,2,189,'AA',12,4),(5,1017,3,190,'AF',4,8),(2,2204,3,190,'AA',33,3),(3,1421,4,192,'7C',23,10),(1,1862,4,193,'7C',57,16),(1,1593,1,194,'7C',8,13),(1,2547,2,194,'7C',30,2),(3,1992,2,194,'AC',51,2),(4,2320,3,194,'AA',59,11),(5,2948,1,195,'AA',7,9),(4,1057,1,196,'7C',7,7),(3,1146,1,197,'AC',45,8),(3,2573,4,198,'AF',9,1),(3,2667,1,198,'AA',10,17),(1,2778,3,199,'AA',17,14),(5,2758,3,199,'AC',20,16),(3,2141,4,199,'7C',28,2),(5,2758,3,201,'AF',47,5),(1,1456,2,202,'AF',36,13),(5,2260,4,203,'7C',16,17),(2,2045,2,203,'AA',57,14),(1,2633,4,204,'AF',27,15),(4,2237,1,204,'AA',39,11),(5,1443,3,204,'AA',60,12),(4,2235,2,206,'AC',31,1),(5,1829,3,206,'7C',39,2),(3,2358,1,207,'AF',12,14),(2,2749,2,207,'AC',17,17),(5,2454,3,207,'7C',31,5),(2,1432,3,207,'7C',37,16),(2,2615,1,208,'AC',9,9),(4,1266,4,210,'AA',11,14),(5,2263,3,212,'7C',14,5),(5,2810,1,212,'AF',19,11),(5,2054,2,212,'AC',45,4),(2,2027,2,213,'AC',33,17),(1,1702,2,214,'AC',14,5),(4,1964,4,214,'AF',18,15),(1,2735,4,215,'AA',31,7),(3,1980,3,216,'7C',36,13),(1,1949,2,216,'AA',42,13),(3,1714,3,217,'AC',20,15),(1,1987,4,217,'7C',21,4),(5,2244,4,217,'AA',26,16),(1,2481,2,219,'7C',15,11),(1,1249,3,221,'AF',11,16),(2,1577,3,222,'AC',15,5),(2,1882,1,222,'AC',53,10),(1,1821,2,223,'AC',10,5),(3,1680,1,223,'AC',14,17),(4,2483,3,224,'AC',15,15),(3,2192,4,225,'AF',1,8),(4,1057,2,225,'AA',18,9),(3,2553,2,225,'AF',21,16),(1,1150,2,225,'AC',27,9),(3,1577,2,226,'AA',4,16),(2,2665,4,226,'7C',39,9),(2,2530,3,226,'AC',43,9),(5,2058,1,226,'7C',56,5),(3,1676,1,227,'AA',36,8),(2,1390,3,227,'AA',43,17),(1,1771,2,228,'AC',11,7),(5,2475,2,229,'AC',49,8),(2,1992,1,230,'AA',5,6),(5,1014,1,230,'AA',14,3),(3,1091,2,230,'AF',16,10),(5,1554,2,232,'AA',1,5),(1,1079,3,232,'AC',8,15),(1,2392,2,234,'AA',9,12),(1,1698,2,235,'AF',9,13),(1,1590,3,236,'AC',7,7),(3,1100,3,237,'7C',6,15),(4,2194,3,239,'AF',1,9),(2,2203,1,239,'7C',29,10),(5,1965,3,239,'AA',54,5),(5,2054,4,240,'AA',18,5),(2,1274,4,240,'AF',33,7),(3,2663,3,240,'7C',53,1),(4,1330,2,240,'AA',54,10),(1,2414,1,241,'AA',17,13),(3,1817,4,241,'AA',32,15),(5,2274,2,241,'7C',58,6),(1,1443,1,243,'AC',37,5),(5,1228,1,245,'7C',46,10),(4,1319,4,246,'7C',3,7),(1,2710,1,246,'AA',6,16),(3,1287,2,246,'7C',25,2),(3,2341,2,247,'7C',47,7),(3,1653,2,248,'AF',35,12),(1,2677,1,249,'AC',22,4),(4,2879,4,251,'AA',43,10),(2,1325,2,252,'AA',52,12),(1,2676,2,254,'7C',3,4),(3,1066,3,254,'AF',43,2),(2,1465,2,256,'7C',13,1),(4,1224,4,256,'AA',26,11),(5,1040,2,256,'AF',40,17),(4,2536,3,256,'AA',53,2),(3,1937,4,257,'AA',51,8),(4,1365,3,258,'AF',1,16),(3,1281,2,258,'7C',2,12),(3,2653,4,258,'AF',29,10),(5,1372,4,259,'7C',32,9),(2,1360,2,261,'7C',51,2),(1,1773,3,261,'AC',52,3),(3,1304,1,262,'AF',51,8),(2,2822,3,263,'AA',23,11),(4,2612,2,263,'AF',42,13),(3,2834,1,263,'7C',48,8),(1,2762,4,263,'7C',58,7),(2,2957,2,264,'AC',23,9),(2,1359,3,265,'AC',22,8),(5,2925,3,265,'7C',43,12),(1,2788,4,266,'7C',17,6),(2,1559,3,267,'7C',14,12),(1,1428,1,267,'AA',18,5),(5,2513,4,267,'AC',58,3),(4,2605,3,268,'AF',49,12),(2,2692,3,269,'7C',5,16),(1,1341,1,269,'AC',45,15),(1,1538,2,269,'AA',46,2),(5,2975,3,270,'AC',34,12),(4,1209,3,271,'AA',6,6),(3,1862,2,271,'7C',17,15),(3,2981,3,272,'AC',24,15),(5,1521,3,274,'7C',4,17),(4,2235,4,274,'AA',37,3),(3,1226,1,275,'AF',35,12),(2,1351,2,276,'AA',23,15),(3,2217,4,276,'AC',27,13),(4,1793,2,276,'AC',30,17),(1,2384,2,276,'AC',50,7),(3,1763,4,276,'AA',55,11),(3,1530,4,277,'7C',24,4),(2,2684,1,278,'AC',49,7),(5,1227,3,278,'AA',60,10),(1,2427,2,279,'AF',33,5),(4,2423,4,279,'AF',58,15),(3,2824,3,280,'AA',12,11),(1,2303,3,280,'7C',54,7),(5,2378,1,281,'7C',1,9),(1,2931,3,281,'AC',57,8),(1,1175,1,282,'7C',22,12),(4,2855,4,282,'AA',50,13),(5,1171,4,283,'AC',20,10),(1,2411,2,284,'AC',55,11),(2,2850,2,286,'AA',45,17),(1,2019,2,286,'AF',57,16),(1,1966,4,287,'AF',19,15),(5,1227,2,287,'AF',29,4),(1,2764,2,287,'AF',44,12),(5,1669,3,287,'7C',59,11),(2,2272,2,288,'AF',35,12),(3,2383,4,288,'AA',48,7),(1,1990,3,289,'AC',51,1),(4,2967,1,290,'AA',4,12),(5,2349,1,290,'AF',36,9),(3,2050,3,291,'AA',22,11),(1,2046,2,292,'AF',21,11),(4,1932,4,292,'7C',38,17),(4,2469,4,293,'7C',5,13),(3,1875,3,293,'AA',27,4),(5,1654,3,295,'7C',9,13),(4,1626,4,295,'AF',50,10),(2,1603,2,296,'7C',14,2),(1,2042,1,296,'AC',24,5),(4,2771,3,296,'7C',57,14),(3,1994,2,297,'7C',12,8),(4,1565,1,297,'AA',23,16),(3,2618,2,298,'AC',7,13),(4,2916,4,298,'AA',28,8),(1,2732,1,298,'AF',35,8),(2,2681,3,299,'AA',53,7),(3,1258,1,299,'AC',55,13),(5,2342,14,300,'AA',38,4);
/*!40000 ALTER TABLE `RATING` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping events for database 'globetrotter'
--

--
-- Dumping routines for database 'globetrotter'
--
/*!50003 DROP PROCEDURE IF EXISTS `addNewMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `addNewMember`(
IN m_fname VARCHAR(45),
IN m_lname VARCHAR(45),
IN m_city VARCHAR(45),
IN m_country VARCHAR(2))
BEGIN
INSERT INTO globetrotter.MEMBER (member_fname, member_lname, member_city,
member_country)
VALUES (m_fname, m_lname, m_city, m_country);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDestRating` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `getDestRating`(
IN dest_n varchar(45)
)
BEGIN
SELECT
CONCAT (MEMBER.member_fname, ' ', MEMBER.member_lname) AS User_Name,
DESTINATION.dest_name AS Destination,
RATING.rat_stars AS Rating,
RATING.rat_amt_spent AS Trip_Expense,
HIGHLIGHT.highlight_name AS Destination_Highlight,
AIRLINE.air_name AS Airline,
HOTEL_BRAND.hotel_name AS Destination_Hotel,
FOOD_TYPE.food_name AS Destination_Recommended_Food
FROM
RATING
JOIN DESTINATION on DESTINATION.dest_id = RATING.dest_id
JOIN HOTEL_BRAND on HOTEL_BRAND.hotel_id = RATING.hotel_id
JOIN AIRLINE on AIRLINE.air_code = RATING.air_code
Join HIGHLIGHT ON HIGHLIGHT.highlight_id = RATING.highlight_id
Join MEMBER on MEMBER.member_id = RATING.member_id,
DESTINATION d
Join FOOD_TYPE on FOOD_TYPE.food_id = d.food_id
WHERE DESTINATION.dest_name =
(SELECT DESTINATION.dest_name
From DESTINATION
WHERE DESTINATION.dest_name = dest_n)
GROUP BY User_Name
ORDER BY Trip_Expense DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `top3MostVisited` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`admin`@`%` PROCEDURE `top3MostVisited`()
BEGIN
SELECT
DESTINATION.dest_name AS Destination,
COUNT(RATING.dest_id) AS 'Number of Visits'
From
DESTINATION
JOIN RATING ON RATING.dest_id = DESTINATION.dest_id
GROUP BY RATING.dest_id
ORDER BY COUNT(RATING.dest_id) DESC
LIMIT 3;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-17 15:21:15
