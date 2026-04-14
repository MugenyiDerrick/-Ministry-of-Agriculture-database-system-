-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: coffee_production
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advice_sessions`
--

DROP TABLE IF EXISTS `advice_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advice_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `farm_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `session_date` date NOT NULL,
  `notes_topics` text,
  PRIMARY KEY (`session_id`),
  KEY `farm_id` (`farm_id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `advice_sessions_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`) ON DELETE CASCADE,
  CONSTRAINT `advice_sessions_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `extension_workers` (`worker_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advice_sessions`
--

/*!40000 ALTER TABLE `advice_sessions` DISABLE KEYS */;
INSERT INTO `advice_sessions` VALUES (1,4,7,'2025-09-03','Soil testing and fertilization'),(2,5,7,'2025-09-04','Post-harvest handling best practices'),(3,6,8,'2025-09-05','Climate-smart agricultural techniques');
/*!40000 ALTER TABLE `advice_sessions` ENABLE KEYS */;

--
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) DEFAULT NULL,
  `action_performed` varchar(50) DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `action_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `details` text,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;

--
-- Table structure for table `distributions`
--

DROP TABLE IF EXISTS `distributions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributions` (
  `distribution_id` int NOT NULL AUTO_INCREMENT,
  `farm_id` int NOT NULL,
  `official_id` int NOT NULL,
  `resource_id` int NOT NULL,
  `quantity_distributed` int NOT NULL,
  `distribution_date` date NOT NULL,
  PRIMARY KEY (`distribution_id`),
  KEY `farm_id` (`farm_id`),
  KEY `official_id` (`official_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `distributions_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`) ON DELETE CASCADE,
  CONSTRAINT `distributions_ibfk_2` FOREIGN KEY (`official_id`) REFERENCES `ministry_officials` (`official_id`) ON DELETE CASCADE,
  CONSTRAINT `distributions_ibfk_3` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `distributions_chk_1` CHECK ((`quantity_distributed` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
INSERT INTO `distributions` VALUES (1,1,1,1,200,'2025-10-01'),(2,2,1,1,150,'2025-10-02'),(3,3,2,2,100,'2025-10-03'),(4,4,2,2,500,'2025-10-04'),(5,5,3,3,300,'2025-10-05'),(6,6,3,3,400,'2025-10-06'),(7,7,4,1,1000,'2025-10-07'),(8,8,4,1,1200,'2025-10-08'),(9,9,5,2,600,'2025-10-09'),(10,10,5,2,200,'2025-10-10'),(11,11,1,4,5,'2025-11-01'),(12,12,1,4,2,'2025-11-02'),(13,13,2,5,3,'2025-11-03'),(14,14,2,5,2,'2025-11-04'),(15,15,3,6,1,'2025-11-05'),(16,16,3,6,4,'2025-11-06'),(17,17,4,7,20,'2025-11-07'),(18,18,4,7,15,'2025-11-08'),(19,19,5,8,10,'2025-11-09'),(20,20,5,8,5,'2025-11-10'),(21,21,1,9,2,'2026-01-01'),(22,22,1,9,3,'2026-01-02'),(23,23,2,10,100,'2026-01-03'),(24,24,2,10,50,'2026-01-04'),(25,25,3,11,2,'2026-01-05'),(26,26,3,11,1,'2026-01-06'),(27,27,4,12,10,'2026-01-07'),(28,28,4,12,8,'2026-01-08'),(29,29,5,13,1,'2026-01-09'),(30,30,5,13,2,'2026-01-10'),(31,1,1,7,10,'2026-02-01'),(32,4,2,7,25,'2026-02-02'),(33,7,3,7,30,'2026-02-03'),(34,8,4,7,40,'2026-02-04'),(35,16,5,1,500,'2026-02-05'),(36,19,1,2,800,'2026-02-06'),(37,21,2,4,5,'2026-02-07'),(38,23,3,5,2,'2026-02-08'),(39,30,4,14,10,'2026-02-09'),(40,31,5,15,50,'2026-02-10'),(41,1,1,1,100,'2026-04-13');
/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_UpdateResourceStock` AFTER INSERT ON `distributions` FOR EACH ROW BEGIN
    UPDATE resources
    SET stock_quantity = stock_quantity - NEW.quantity_distributed
    WHERE resource_id = NEW.resource_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `extension_workers`
--

DROP TABLE IF EXISTS `extension_workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_workers` (
  `worker_id` int NOT NULL,
  `supervisor_id` int DEFAULT NULL,
  `field_area` varchar(100) NOT NULL,
  PRIMARY KEY (`worker_id`),
  KEY `supervisor_id` (`supervisor_id`),
  CONSTRAINT `extension_workers_ibfk_1` FOREIGN KEY (`worker_id`) REFERENCES `users` (`person_id`) ON DELETE CASCADE,
  CONSTRAINT `extension_workers_ibfk_2` FOREIGN KEY (`supervisor_id`) REFERENCES `ministry_officials` (`official_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_workers`
--

/*!40000 ALTER TABLE `extension_workers` DISABLE KEYS */;
INSERT INTO `extension_workers` VALUES (6,1,'Central Region'),(7,1,'Western Region'),(8,2,'Rift Valley'),(9,2,'Eastern Region'),(10,3,'Nyanza Region'),(11,3,'Coast Region'),(12,4,'North Eastern'),(13,4,'Upper Central'),(14,5,'Lower Eastern'),(15,5,'Lake Basin');
/*!40000 ALTER TABLE `extension_workers` ENABLE KEYS */;

--
-- Table structure for table `farmers`
--

DROP TABLE IF EXISTS `farmers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farmers` (
  `farmer_id` int NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`farmer_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `farmers_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `users` (`person_id`) ON DELETE CASCADE,
  CONSTRAINT `farmers_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farmers`
--

/*!40000 ALTER TABLE `farmers` DISABLE KEYS */;
INSERT INTO `farmers` VALUES (16,4),(17,5),(18,6),(19,7),(20,8),(21,9),(22,10),(23,11),(24,12),(25,13),(26,14),(27,15),(28,16),(29,17),(30,18),(31,19),(32,20),(33,21),(34,22),(35,23);
/*!40000 ALTER TABLE `farmers` ENABLE KEYS */;

--
-- Table structure for table `farms`
--

DROP TABLE IF EXISTS `farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farms` (
  `farm_id` int NOT NULL AUTO_INCREMENT,
  `farmer_id` int NOT NULL,
  `farm_name` varchar(100) NOT NULL,
  `size_hectares` decimal(10,2) NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`farm_id`),
  KEY `farmer_id` (`farmer_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `farms_ibfk_1` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`farmer_id`) ON DELETE CASCADE,
  CONSTRAINT `farms_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE RESTRICT,
  CONSTRAINT `farms_chk_1` CHECK ((`size_hectares` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farms`
--

/*!40000 ALTER TABLE `farms` DISABLE KEYS */;
INSERT INTO `farms` VALUES (1,16,'Abundace Farm',5.50,4),(2,17,'Hillside View',3.20,5),(3,17,'River Bank Estate',1.50,5),(4,18,'Coffee Haven',7.00,6),(5,19,'Golden Harvest',4.50,7),(6,20,'Western Pride',6.20,8),(7,21,'Rift Valley Gem',10.00,9),(8,22,'Tea & Coffee Mix',12.50,10),(9,23,'Uasin Gold',8.50,11),(10,24,'Machakos Sun',3.00,12),(11,25,'Mount Uganda Roots',4.00,13),(12,26,'Lakeside Bliss',2.00,14),(13,27,'Siaya Sunrise',5.00,15),(14,28,'Coastal Breeze',3.50,16),(15,29,'Kwale Tropics',4.20,17),(16,30,'Meru Peaks',9.00,18),(17,20,'Central Hub',2.50,2),(18,31,'Kirinyaga Greens',6.50,19),(19,32,'Bomet Pastures',7.50,20),(20,33,'Grain & Bean',11.00,21),(21,34,'Southern Crest',2.50,22),(22,35,'Border Fields',4.80,23),(23,16,'South Hub',3.30,4),(24,18,'Thika Road Garden',0.80,24),(25,23,'Wheat & Coffee',5.50,25),(26,30,'Upper Meru Plot',2.20,26),(27,21,'Langa Plot',1.00,9),(28,22,'Hilltop Farm',3.00,10),(29,25,'Riverside Farm',2.50,13),(30,33,'Cherangany Plot',6.00,27),(31,19,'Malaba Field',1.20,28);
/*!40000 ALTER TABLE `farms` ENABLE KEYS */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `district` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Mukono','Central'),(2,'Wakiso','Central'),(3,'Kampala','Central'),(4,'Murang','Central Kenya'),(5,'Nyeri','Central Kenya'),(6,'Kiambu','Central Kenya'),(7,'Bungoma','Western Kenya'),(8,'Kakamega','Western Kenya'),(9,'Nakuru','Rift Valley'),(10,'Kericho','Rift Valley'),(11,'Uasin Gishu','Rift Valley'),(12,'Machakos','Eastern Kenya'),(13,'Embu','Eastern Kenya'),(14,'Kisumu','Nyanza'),(15,'Siaya','Nyanza'),(16,'Kilifi','Coast'),(17,'Kwale','Coast'),(18,'Meru','Eastern Kenya'),(19,'Kirinyaga','Central Kenya'),(20,'Bomet','Rift Valley'),(21,'Trans Nzoia','Rift Valley'),(22,'Taita Taveta','Coast'),(23,'Busia','Western Kenya'),(24,'Thika','Central Kenya'),(25,'Turbo','Rift Valley'),(26,'Maua','Eastern Kenya'),(27,'Cherangany','Rift Valley'),(28,'Malaba','Western Kenya'),(29,'Mukono','Central'),(30,'Wakiso','Central'),(31,'Kampala','Central'),(32,'Murang','Central Uganda'),(33,'Nyeri','Central Uganda'),(34,'Kiambu','Central Uganda'),(35,'Bungoma','Western Uganda'),(36,'Kakamega','Western Uganda'),(37,'Nakuru','Rift Valley'),(38,'Kericho','Rift Valley'),(39,'Uasin Gishu','Rift Valley'),(40,'Machakos','Eastern Uganda'),(41,'Embu','Eastern Uganda'),(42,'Kisumu','Nyanza'),(43,'Siaya','Nyanza'),(44,'Kilifi','Coast'),(45,'Kwale','Coast'),(46,'Meru','Eastern Uganda'),(47,'Kirinyaga','Central Uganda'),(48,'Bomet','Rift Valley'),(49,'Trans Nzoia','Rift Valley'),(50,'Taita Taveta','Coast'),(51,'Busia','Western Uganda'),(52,'Thika','Central Uganda'),(53,'Turbo','Rift Valley'),(54,'Maua','Eastern Uganda'),(55,'Cherangany','Rift Valley'),(56,'Malaba','Western Uganda');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

--
-- Table structure for table `ministry_officials`
--

DROP TABLE IF EXISTS `ministry_officials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ministry_officials` (
  `official_id` int NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`official_id`),
  CONSTRAINT `ministry_officials_ibfk_1` FOREIGN KEY (`official_id`) REFERENCES `users` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ministry_officials`
--

/*!40000 ALTER TABLE `ministry_officials` DISABLE KEYS */;
INSERT INTO `ministry_officials` VALUES (1,'Director of Agriculture'),(2,'Chief Extension Liaison'),(3,'Operations Manager'),(4,'Supply Chain Coordinator'),(5,'Financial Auditor');
/*!40000 ALTER TABLE `ministry_officials` ENABLE KEYS */;

--
-- Table structure for table `productions`
--

DROP TABLE IF EXISTS `productions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productions` (
  `production_id` int NOT NULL AUTO_INCREMENT,
  `farm_id` int NOT NULL,
  `coffee_type` enum('Arabica','Robusta','Liberica') NOT NULL,
  `quantity_kg` decimal(10,2) NOT NULL,
  `quality_grade` varchar(10) NOT NULL,
  `harvest_date` date NOT NULL,
  PRIMARY KEY (`production_id`),
  KEY `farm_id` (`farm_id`),
  CONSTRAINT `productions_ibfk_1` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`) ON DELETE CASCADE,
  CONSTRAINT `productions_chk_1` CHECK ((`quantity_kg` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productions`
--

/*!40000 ALTER TABLE `productions` DISABLE KEYS */;
INSERT INTO `productions` VALUES (1,1,'Arabica',1200.50,'AA','2025-11-10'),(2,2,'Robusta',850.00,'AB','2025-11-15'),(3,3,'Liberica',400.00,'PB','2025-11-20'),(4,4,'Arabica',2500.00,'AA','2025-12-01'),(5,5,'Robusta',1100.00,'C','2025-12-05'),(6,6,'Liberica',1500.00,'AB','2025-12-10');
/*!40000 ALTER TABLE `productions` ENABLE KEYS */;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `resource_id` int NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(100) NOT NULL,
  `category` enum('Seedlings','Tool','Equipment','Material') NOT NULL,
  `stock_quantity` int NOT NULL,
  PRIMARY KEY (`resource_id`),
  CONSTRAINT `resources_chk_1` CHECK ((`stock_quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Arabica SL28 Seedlings','Seedlings',5000),(2,'Ruiru 11 Seedlings','Seedlings',8000),(3,'Batian Seedlings','Seedlings',3000),(4,'Pruning Saws','Tool',150),(5,'Knapsack Sprayers','Equipment',100),(6,'Solar Dryers','Equipment',20),(7,'NPK Fertilizer','Material',500),(8,'Compost Starter','Material',200),(9,'Protective Gear Sets','Equipment',300),(10,'Hessian Coffee Bags','Material',2000),(11,'Grading Tables','Equipment',50),(12,'Secateurs','Tool',400),(13,'Hose Pipes','Tool',80),(14,'Organic Pesticides','Material',150),(15,'Seedling Trays','Material',1000);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` enum('Male','Female','Other') NOT NULL,
  `contact` varchar(20) NOT NULL,
  PRIMARY KEY (`person_id`),
  UNIQUE KEY `contact` (`contact`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','Male','0700111222'),(2,'Jane','Smith','Female','0700333444'),(3,'Robert','Mugabe','Male','0700555666'),(4,'Sarah','Wanjiku','Female','0700777888'),(5,'Peter','Kamau','Male','0700999000'),(6,'Alice','Zanda','Female','0711111222'),(7,'Bob','Okelo','Male','0711222333'),(8,'Charlie','Mutua','Male','0711333444'),(9,'David','Lwanga','Male','0711444555'),(10,'Eve','Atieno','Female','0711555666'),(11,'Frank','Githua','Male','0711666777'),(12,'Grace','Namono','Female','0711777888'),(13,'Henry','Okori','Male','0711888999'),(14,'Irene','Naisula','Female','0711999000'),(15,'Jack','Ma','Male','0711000111'),(16,'Kevin','Kiprotich','Male','0722000001'),(17,'Lydia','Cherono','Female','0722000002'),(18,'Mike','Ondiek','Male','0722000003'),(19,'Nancy','Akoth','Female','0722000004'),(20,'Oscar','Wamalwa','Male','0722000005'),(21,'Pamela','Anyango','Female','0722000006'),(22,'Quincy','Jones','Male','0722000007'),(23,'Rose','Chebet','Female','0722000008'),(24,'Sam','Otieno','Male','0722000009'),(25,'Teresa','May','Female','0722000010'),(26,'Ulysses','Grant','Male','0722000011'),(27,'Victoria','Beckham','Female','0722000012'),(28,'William','Ruto','Male','0722000013'),(29,'Xavier','Hernandez','Male','0722000014'),(30,'Yvonne','Chaka','Female','0722000015'),(31,'Zack','Snyder','Male','0722000016'),(32,'Arthur','Morgan','Male','0722000017'),(33,'Beatrice','Kuria','Female','0722000018'),(34,'Catherine','Nduta','Female','0722000019'),(35,'Daniel','Wanyama','Male','0722000020');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Temporary view structure for view `vw_extension_activity`
--

DROP TABLE IF EXISTS `vw_extension_activity`;
/*!50001 DROP VIEW IF EXISTS `vw_extension_activity`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_extension_activity` AS SELECT 
 1 AS `field_area`,
 1 AS `worker_name`,
 1 AS `total_sessions`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_farm_inventory`
--

DROP TABLE IF EXISTS `vw_farm_inventory`;
