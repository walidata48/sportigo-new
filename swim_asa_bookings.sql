-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (arm64)
--
-- Host: localhost    Database: swim
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `asa_bookings`
--

DROP TABLE IF EXISTS `asa_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `package_id` int NOT NULL,
  `booking_date` datetime DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `applied_discount` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `asa_bookings_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `asa_packages` (`id`),
  CONSTRAINT `asa_bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_bookings`
--

LOCK TABLES `asa_bookings` WRITE;
/*!40000 ALTER TABLE `asa_bookings` DISABLE KEYS */;
INSERT INTO `asa_bookings` VALUES (1,8,1,'2025-01-07 15:33:04','paid',NULL),(2,8,2,'2025-01-07 15:33:19','paid',NULL),(3,8,1,'2025-01-07 22:59:03','paid',NULL),(4,8,1,'2025-01-07 23:08:07','paid',100000),(5,8,2,'2025-01-07 23:11:16','paid',0),(6,8,1,'2025-01-07 23:19:15','pending',0),(7,8,1,'2025-01-07 23:19:58','pending',0),(8,8,1,'2025-01-07 23:20:34','paid',100000),(9,8,2,'2025-01-07 23:20:46','paid',0),(10,8,2,'2025-01-07 23:23:49','pending',0),(11,8,1,'2025-01-08 14:45:30','pending',0),(12,8,2,'2025-01-08 14:47:20','pending',0),(13,8,1,'2025-01-08 14:49:25','pending',0),(14,8,1,'2025-01-08 14:51:03','pending',0),(15,8,2,'2025-01-08 14:53:26','pending',0),(16,8,1,'2025-02-03 12:53:44','pending',0),(17,8,2,'2025-02-03 12:55:16','pending',0),(18,8,1,'2025-02-03 13:58:20','pending',0),(19,9,1,'2025-02-03 14:04:34','pending',0),(20,9,1,'2025-02-03 14:18:27','pending',0),(21,9,2,'2025-02-03 14:25:49','pending',0),(22,9,1,'2025-02-03 14:28:35','pending',0),(23,9,1,'2025-02-03 14:34:45','pending',0),(24,9,2,'2025-02-03 14:35:59','pending',0),(25,9,1,'2025-02-03 14:46:16','paid',0),(26,9,1,'2025-02-03 14:48:47','paid',0),(27,9,2,'2025-02-03 14:51:18','paid',0),(28,10,1,'2025-02-03 15:35:17','paid',0),(29,9,1,'2025-02-03 15:35:25','pending',0),(30,10,2,'2025-02-03 15:36:53','paid',0),(31,10,1,'2025-02-03 15:37:44','pending',0),(32,10,2,'2025-02-03 15:41:17','pending',0),(33,9,1,'2025-02-03 16:11:01','pending',0),(34,9,1,'2025-02-03 16:12:14','pending',0),(35,9,1,'2025-02-03 16:14:24','paid',0),(36,9,2,'2025-02-03 16:23:39','pending',0),(37,10,2,'2025-02-03 19:34:15','pending',0),(38,9,1,'2025-02-04 03:49:55','paid',100000);
/*!40000 ALTER TABLE `asa_bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-04 11:13:20
