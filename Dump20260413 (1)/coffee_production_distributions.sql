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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributions`
--

LOCK TABLES `distributions` WRITE;
/*!40000 ALTER TABLE `distributions` DISABLE KEYS */;
INSERT INTO `distributions` VALUES (1,1,1,1,200,'2025-10-01'),(2,2,1,1,150,'2025-10-02'),(3,3,2,2,100,'2025-10-03'),(4,4,2,2,500,'2025-10-04'),(5,5,3,3,300,'2025-10-05'),(6,6,3,3,400,'2025-10-06'),(7,7,4,1,1000,'2025-10-07'),(8,8,4,1,1200,'2025-10-08'),(9,9,5,2,600,'2025-10-09'),(10,10,5,2,200,'2025-10-10'),(11,11,1,4,5,'2025-11-01'),(12,12,1,4,2,'2025-11-02'),(13,13,2,5,3,'2025-11-03'),(14,14,2,5,2,'2025-11-04'),(15,15,3,6,1,'2025-11-05'),(16,16,3,6,4,'2025-11-06'),(17,17,4,7,20,'2025-11-07'),(18,18,4,7,15,'2025-11-08'),(19,19,5,8,10,'2025-11-09'),(20,20,5,8,5,'2025-11-10'),(21,21,1,9,2,'2026-01-01'),(22,22,1,9,3,'2026-01-02'),(23,23,2,10,100,'2026-01-03'),(24,24,2,10,50,'2026-01-04'),(25,25,3,11,2,'2026-01-05'),(26,26,3,11,1,'2026-01-06'),(27,27,4,12,10,'2026-01-07'),(28,28,4,12,8,'2026-01-08'),(29,29,5,13,1,'2026-01-09'),(30,30,5,13,2,'2026-01-10'),(31,1,1,7,10,'2026-02-01'),(32,4,2,7,25,'2026-02-02'),(33,7,3,7,30,'2026-02-03'),(34,8,4,7,40,'2026-02-04'),(35,16,5,1,500,'2026-02-05'),(36,19,1,2,800,'2026-02-06'),(37,21,2,4,5,'2026-02-07'),(38,23,3,5,2,'2026-02-08'),(39,30,4,14,10,'2026-02-09'),(40,31,5,15,50,'2026-02-10'),(41,1,1,1,100,'2026-04-13'),(42,1,1,1,100,'2026-04-13');
/*!40000 ALTER TABLE `distributions` ENABLE KEYS */;
UNLOCK TABLES;
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-13 10:08:17
