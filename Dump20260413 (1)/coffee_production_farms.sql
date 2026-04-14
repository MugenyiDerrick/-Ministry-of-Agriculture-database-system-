-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: coffee_production
-- ------------------------------------------------------
-- Server version	8.0.45

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

LOCK TABLES `farms` WRITE;
/*!40000 ALTER TABLE `farms` DISABLE KEYS */;
INSERT INTO `farms` VALUES (1,16,'Abundace Farm',5.50,4),(2,17,'Hillside View',3.20,5),(3,17,'River Bank Estate',1.50,5),(4,18,'Coffee Haven',7.00,6),(5,19,'Golden Harvest',4.50,7),(6,20,'Western Pride',6.20,8),(7,21,'Rift Valley Gem',10.00,9),(8,22,'Tea & Coffee Mix',12.50,10),(9,23,'Uasin Gold',8.50,11),(10,24,'Machakos Sun',3.00,12),(11,25,'Mount Uganda Roots',4.00,13),(12,26,'Lakeside Bliss',2.00,14),(13,27,'Siaya Sunrise',5.00,15),(14,28,'Coastal Breeze',3.50,16),(15,29,'Kwale Tropics',4.20,17),(16,30,'Meru Peaks',9.00,18),(17,20,'Central Hub',2.50,2),(18,31,'Kirinyaga Greens',6.50,19),(19,32,'Bomet Pastures',7.50,20),(20,33,'Grain & Bean',11.00,21),(21,34,'Southern Crest',2.50,22),(22,35,'Border Fields',4.80,23),(23,16,'South Hub',3.30,4),(24,18,'Thika Road Garden',0.80,24),(25,23,'Wheat & Coffee',5.50,25),(26,30,'Upper Meru Plot',2.20,26),(27,21,'Langa Plot',1.00,9),(28,22,'Hilltop Farm',3.00,10),(29,25,'Riverside Farm',2.50,13),(30,33,'Cherangany Plot',6.00,27),(31,19,'Malaba Field',1.20,28);
/*!40000 ALTER TABLE `farms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-13 10:08:16
