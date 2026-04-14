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

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','Male','0700111222'),(2,'Jane','Smith','Female','0700333444'),(3,'Robert','Mugabe','Male','0700555666'),(4,'Sarah','Wanjiku','Female','0700777888'),(5,'Peter','Kamau','Male','0700999000'),(6,'Alice','Zanda','Female','0711111222'),(7,'Bob','Okelo','Male','0711222333'),(8,'Charlie','Mutua','Male','0711333444'),(9,'David','Lwanga','Male','0711444555'),(10,'Eve','Atieno','Female','0711555666'),(11,'Frank','Githua','Male','0711666777'),(12,'Grace','Namono','Female','0711777888'),(13,'Henry','Okori','Male','0711888999'),(14,'Irene','Naisula','Female','0711999000'),(15,'Jack','Ma','Male','0711000111'),(16,'Kevin','Kiprotich','Male','0722000001'),(17,'Lydia','Cherono','Female','0722000002'),(18,'Mike','Ondiek','Male','0722000003'),(19,'Nancy','Akoth','Female','0722000004'),(20,'Oscar','Wamalwa','Male','0722000005'),(21,'Pamela','Anyango','Female','0722000006'),(22,'Quincy','Jones','Male','0722000007'),(23,'Rose','Chebet','Female','0722000008'),(24,'Sam','Otieno','Male','0722000009'),(25,'Teresa','May','Female','0722000010'),(26,'Ulysses','Grant','Male','0722000011'),(27,'Victoria','Beckham','Female','0722000012'),(28,'William','Ruto','Male','0722000013'),(29,'Xavier','Hernandez','Male','0722000014'),(30,'Yvonne','Chaka','Female','0722000015'),(31,'Zack','Snyder','Male','0722000016'),(32,'Arthur','Morgan','Male','0722000017'),(33,'Beatrice','Kuria','Female','0722000018'),(34,'Catherine','Nduta','Female','0722000019'),(35,'Daniel','Wanyama','Male','0722000020');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
