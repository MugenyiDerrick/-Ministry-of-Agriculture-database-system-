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

LOCK TABLES `extension_workers` WRITE;
/*!40000 ALTER TABLE `extension_workers` DISABLE KEYS */;
INSERT INTO `extension_workers` VALUES (6,1,'Central Region'),(7,1,'Western Region'),(8,2,'Rift Valley'),(9,2,'Eastern Region'),(10,3,'Nyanza Region'),(11,3,'Coast Region'),(12,4,'North Eastern'),(13,4,'Upper Central'),(14,5,'Lower Eastern'),(15,5,'Lake Basin');
/*!40000 ALTER TABLE `extension_workers` ENABLE KEYS */;
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
