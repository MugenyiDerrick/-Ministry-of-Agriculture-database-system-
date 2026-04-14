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

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Mukono','Central'),(2,'Wakiso','Central'),(3,'Kampala','Central'),(4,'Murang','Central Kenya'),(5,'Nyeri','Central Kenya'),(6,'Kiambu','Central Kenya'),(7,'Bungoma','Western Kenya'),(8,'Kakamega','Western Kenya'),(9,'Nakuru','Rift Valley'),(10,'Kericho','Rift Valley'),(11,'Uasin Gishu','Rift Valley'),(12,'Machakos','Eastern Kenya'),(13,'Embu','Eastern Kenya'),(14,'Kisumu','Nyanza'),(15,'Siaya','Nyanza'),(16,'Kilifi','Coast'),(17,'Kwale','Coast'),(18,'Meru','Eastern Kenya'),(19,'Kirinyaga','Central Kenya'),(20,'Bomet','Rift Valley'),(21,'Trans Nzoia','Rift Valley'),(22,'Taita Taveta','Coast'),(23,'Busia','Western Kenya'),(24,'Thika','Central Kenya'),(25,'Turbo','Rift Valley'),(26,'Maua','Eastern Kenya'),(27,'Cherangany','Rift Valley'),(28,'Malaba','Western Kenya'),(29,'Mukono','Central'),(30,'Wakiso','Central'),(31,'Kampala','Central'),(32,'Murang','Central Uganda'),(33,'Nyeri','Central Uganda'),(34,'Kiambu','Central Uganda'),(35,'Bungoma','Western Uganda'),(36,'Kakamega','Western Uganda'),(37,'Nakuru','Rift Valley'),(38,'Kericho','Rift Valley'),(39,'Uasin Gishu','Rift Valley'),(40,'Machakos','Eastern Uganda'),(41,'Embu','Eastern Uganda'),(42,'Kisumu','Nyanza'),(43,'Siaya','Nyanza'),(44,'Kilifi','Coast'),(45,'Kwale','Coast'),(46,'Meru','Eastern Uganda'),(47,'Kirinyaga','Central Uganda'),(48,'Bomet','Rift Valley'),(49,'Trans Nzoia','Rift Valley'),(50,'Taita Taveta','Coast'),(51,'Busia','Western Uganda'),(52,'Thika','Central Uganda'),(53,'Turbo','Rift Valley'),(54,'Maua','Eastern Uganda'),(55,'Cherangany','Rift Valley'),(56,'Malaba','Western Uganda');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
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
