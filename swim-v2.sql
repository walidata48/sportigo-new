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
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('746c8a706b34');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asa_booking_sessions`
--

DROP TABLE IF EXISTS `asa_booking_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_booking_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `schedule_id` int NOT NULL,
  `session_date` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `asa_booking_sessions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `asa_bookings` (`id`),
  CONSTRAINT `asa_booking_sessions_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `asa_schedules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_booking_sessions`
--

LOCK TABLES `asa_booking_sessions` WRITE;
/*!40000 ALTER TABLE `asa_booking_sessions` DISABLE KEYS */;
INSERT INTO `asa_booking_sessions` VALUES (1,25,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(2,25,2,'2025-02-06','completed','16:00:00','17:30:00',NULL),(3,25,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(4,25,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(5,25,2,'2025-02-13','completed','16:00:00','17:30:00',NULL),(6,25,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(7,25,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(8,25,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(9,25,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(10,25,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(11,25,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(12,25,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(13,26,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(14,26,2,'2025-02-06','completed','16:00:00','17:30:00',''),(15,26,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(16,26,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(17,26,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(18,26,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(19,26,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(20,26,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(21,26,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(22,26,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(23,26,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(24,26,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(25,27,4,'2025-02-03','scheduled','05:00:00','06:30:00',NULL),(26,27,5,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(27,27,6,'2025-02-05','scheduled','05:00:00','06:30:00',NULL),(28,27,7,'2025-02-06','cancelled','16:00:00','17:30:00','sick'),(29,27,8,'2025-02-07','scheduled','05:00:00','06:30:00',NULL),(30,27,9,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(31,27,4,'2025-02-10','scheduled','05:00:00','06:30:00',NULL),(32,27,5,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(33,27,6,'2025-02-12','scheduled','05:00:00','06:30:00',NULL),(34,27,7,'2025-02-13','completed','16:00:00','17:30:00',NULL),(35,27,8,'2025-02-14','scheduled','05:00:00','06:30:00',NULL),(36,27,9,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(37,27,4,'2025-02-17','scheduled','05:00:00','06:30:00',NULL),(38,27,5,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(39,27,6,'2025-02-19','scheduled','05:00:00','06:30:00',NULL),(40,27,7,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(41,27,8,'2025-02-21','scheduled','05:00:00','06:30:00',NULL),(42,27,9,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(43,27,4,'2025-02-24','scheduled','05:00:00','06:30:00',NULL),(44,27,5,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(45,27,6,'2025-02-26','scheduled','05:00:00','06:30:00',NULL),(46,27,7,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(47,27,8,'2025-02-28','scheduled','05:00:00','06:30:00',NULL),(48,27,9,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(49,28,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(50,28,2,'2025-02-06','cancelled','16:00:00','17:30:00',NULL),(51,28,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(52,28,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(53,28,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(54,28,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(55,28,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(56,28,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(57,28,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(58,28,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(59,28,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(60,28,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(61,30,4,'2025-02-03','scheduled','05:00:00','06:30:00',NULL),(62,30,5,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(63,30,6,'2025-02-05','scheduled','05:00:00','06:30:00',NULL),(64,30,7,'2025-02-06','scheduled','16:00:00','17:30:00',NULL),(65,30,8,'2025-02-07','scheduled','05:00:00','06:30:00',NULL),(66,30,9,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(67,30,4,'2025-02-10','scheduled','05:00:00','06:30:00',NULL),(68,30,5,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(69,30,6,'2025-02-12','scheduled','05:00:00','06:30:00',NULL),(70,30,7,'2025-02-13','cancelled','16:00:00','17:30:00',NULL),(71,30,8,'2025-02-14','scheduled','05:00:00','06:30:00',NULL),(72,30,9,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(73,30,4,'2025-02-17','scheduled','05:00:00','06:30:00',NULL),(74,30,5,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(75,30,6,'2025-02-19','scheduled','05:00:00','06:30:00',NULL),(76,30,7,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(77,30,8,'2025-02-21','scheduled','05:00:00','06:30:00',NULL),(78,30,9,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(79,30,4,'2025-02-24','scheduled','05:00:00','06:30:00',NULL),(80,30,5,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(81,30,6,'2025-02-26','scheduled','05:00:00','06:30:00',NULL),(82,30,7,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(83,30,8,'2025-02-28','scheduled','05:00:00','06:30:00',NULL),(84,30,9,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(85,35,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(86,35,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(87,35,2,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(88,35,3,'2025-03-08','scheduled','16:00:00','17:30:00',NULL),(89,35,1,'2025-03-11','scheduled','16:00:00','17:30:00',NULL),(90,35,2,'2025-03-13','scheduled','16:00:00','17:30:00',NULL),(91,35,3,'2025-03-15','scheduled','16:00:00','17:30:00',NULL),(92,35,1,'2025-03-18','scheduled','16:00:00','17:30:00',NULL),(93,35,2,'2025-03-20','scheduled','16:00:00','17:30:00',NULL),(94,35,3,'2025-03-22','scheduled','16:00:00','17:30:00',NULL),(95,35,1,'2025-03-25','scheduled','16:00:00','17:30:00',NULL),(96,35,2,'2025-03-27','scheduled','16:00:00','17:30:00',NULL),(97,35,3,'2025-03-29','scheduled','16:00:00','17:30:00',NULL),(98,38,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(99,38,2,'2025-02-06','scheduled','16:00:00','17:30:00',NULL),(100,38,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(101,38,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(102,38,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(103,38,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(104,38,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(105,38,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(106,38,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(107,38,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(108,38,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(109,38,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(110,38,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(111,39,8,'2025-02-14','scheduled','05:00:00','06:30:00',NULL),(112,39,9,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(113,39,4,'2025-02-17','scheduled','05:00:00','06:30:00',NULL),(114,39,5,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(115,39,6,'2025-02-19','scheduled','05:00:00','06:30:00',NULL),(116,39,7,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(117,39,8,'2025-02-21','scheduled','05:00:00','06:30:00',NULL),(118,39,9,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(119,39,4,'2025-02-24','scheduled','05:00:00','06:30:00',NULL),(120,39,5,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(121,39,6,'2025-02-26','scheduled','05:00:00','06:30:00',NULL),(122,39,7,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(123,39,8,'2025-02-28','scheduled','05:00:00','06:30:00',NULL),(124,39,9,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(125,39,4,'2025-03-03','scheduled','05:00:00','06:30:00',NULL),(126,39,5,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(127,39,6,'2025-03-05','scheduled','05:00:00','06:30:00',NULL),(128,39,7,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(129,39,8,'2025-03-07','scheduled','05:00:00','06:30:00',NULL),(130,39,9,'2025-03-08','scheduled','16:00:00','17:30:00',NULL),(131,39,4,'2025-03-10','scheduled','05:00:00','06:30:00',NULL),(132,39,5,'2025-03-11','scheduled','16:00:00','17:30:00',NULL),(133,39,6,'2025-03-12','scheduled','05:00:00','06:30:00',NULL),(134,39,7,'2025-03-13','scheduled','16:00:00','17:30:00',NULL),(135,39,8,'2025-03-14','scheduled','05:00:00','06:30:00',NULL),(136,39,9,'2025-03-15','scheduled','16:00:00','17:30:00',NULL),(137,40,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(138,40,2,'2025-02-06','completed','16:00:00','17:30:00',NULL),(139,40,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(140,40,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(141,40,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(142,40,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(143,40,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(144,40,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(145,40,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(146,40,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(147,40,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(148,40,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(149,40,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(150,44,1,'2025-03-18','scheduled','16:00:00','17:30:00',NULL),(151,44,2,'2025-03-20','scheduled','16:00:00','17:30:00',NULL),(152,44,3,'2025-03-22','scheduled','16:00:00','17:30:00',NULL),(153,44,1,'2025-03-25','scheduled','16:00:00','17:30:00',NULL),(154,44,2,'2025-03-27','scheduled','16:00:00','17:30:00',NULL),(155,44,3,'2025-03-29','scheduled','16:00:00','17:30:00',NULL),(156,44,1,'2025-04-01','scheduled','16:00:00','17:30:00',NULL),(157,44,2,'2025-04-03','scheduled','16:00:00','17:30:00',NULL),(158,44,3,'2025-04-05','scheduled','16:00:00','17:30:00',NULL),(159,44,1,'2025-04-08','scheduled','16:00:00','17:30:00',NULL),(160,44,2,'2025-04-10','scheduled','16:00:00','17:30:00',NULL),(161,44,3,'2025-04-12','scheduled','16:00:00','17:30:00',NULL),(162,46,2,'2025-02-06','completed','16:00:00','17:30:00',NULL),(163,46,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(164,46,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(165,46,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(166,46,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(167,46,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(168,46,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(169,46,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(170,46,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(171,46,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(172,46,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(173,46,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(174,46,2,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(175,47,10,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(176,48,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(177,48,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(178,48,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(179,48,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(180,48,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(181,48,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(182,48,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(183,48,2,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(184,48,3,'2025-03-08','scheduled','16:00:00','17:30:00',NULL),(185,48,1,'2025-03-11','scheduled','16:00:00','17:30:00',NULL),(186,48,2,'2025-03-13','scheduled','16:00:00','17:30:00',NULL),(187,48,3,'2025-03-15','scheduled','16:00:00','17:30:00',NULL),(188,48,1,'2025-03-18','scheduled','16:00:00','17:30:00',NULL),(189,56,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(190,56,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(191,56,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(192,56,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(193,56,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(194,56,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(195,56,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(196,56,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(197,56,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(198,56,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(199,56,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(200,56,2,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(201,56,3,'2025-03-08','scheduled','16:00:00','17:30:00',NULL),(202,59,1,'2025-02-04','scheduled','16:00:00','17:30:00',NULL),(203,59,2,'2025-02-06','scheduled','16:00:00','17:30:00',NULL),(204,59,3,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(205,59,1,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(206,59,2,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(207,59,3,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(208,59,1,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(209,59,2,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(210,59,3,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(211,59,1,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(212,59,2,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(213,59,3,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(214,59,1,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(215,60,7,'2025-02-06','scheduled','16:00:00','17:30:00',NULL),(216,60,8,'2025-02-07','scheduled','05:00:00','06:30:00',NULL),(217,60,9,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(218,60,4,'2025-02-10','scheduled','05:00:00','06:30:00',NULL),(219,60,5,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(220,60,6,'2025-02-12','scheduled','05:00:00','06:30:00',NULL),(221,60,7,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(222,60,8,'2025-02-14','scheduled','05:00:00','06:30:00',NULL),(223,60,9,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(224,60,4,'2025-02-17','scheduled','05:00:00','06:30:00',NULL),(225,60,5,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(226,60,6,'2025-02-19','scheduled','05:00:00','06:30:00',NULL),(227,60,7,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(228,60,8,'2025-02-21','scheduled','05:00:00','06:30:00',NULL),(229,60,9,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(230,60,4,'2025-02-24','scheduled','05:00:00','06:30:00',NULL),(231,60,5,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(232,60,6,'2025-02-26','scheduled','05:00:00','06:30:00',NULL),(233,60,7,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(234,60,8,'2025-02-28','scheduled','05:00:00','06:30:00',NULL),(235,60,9,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(236,60,4,'2025-03-03','scheduled','05:00:00','06:30:00',NULL),(237,60,5,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(238,60,6,'2025-03-05','scheduled','05:00:00','06:30:00',NULL),(239,60,7,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(240,60,8,'2025-03-07','scheduled','05:00:00','06:30:00',NULL),(241,62,9,'2025-02-08','scheduled','16:00:00','17:30:00',NULL),(242,62,4,'2025-02-10','scheduled','05:00:00','06:30:00',NULL),(243,62,5,'2025-02-11','scheduled','16:00:00','17:30:00',NULL),(244,62,6,'2025-02-12','scheduled','05:00:00','06:30:00',NULL),(245,62,7,'2025-02-13','scheduled','16:00:00','17:30:00',NULL),(246,62,8,'2025-02-14','scheduled','05:00:00','06:30:00',NULL),(247,62,9,'2025-02-15','scheduled','16:00:00','17:30:00',NULL),(248,62,4,'2025-02-17','scheduled','05:00:00','06:30:00',NULL),(249,62,5,'2025-02-18','scheduled','16:00:00','17:30:00',NULL),(250,62,6,'2025-02-19','scheduled','05:00:00','06:30:00',NULL),(251,62,7,'2025-02-20','scheduled','16:00:00','17:30:00',NULL),(252,62,8,'2025-02-21','scheduled','05:00:00','06:30:00',NULL),(253,62,9,'2025-02-22','scheduled','16:00:00','17:30:00',NULL),(254,62,4,'2025-02-24','scheduled','05:00:00','06:30:00',NULL),(255,62,5,'2025-02-25','scheduled','16:00:00','17:30:00',NULL),(256,62,6,'2025-02-26','scheduled','05:00:00','06:30:00',NULL),(257,62,7,'2025-02-27','scheduled','16:00:00','17:30:00',NULL),(258,62,8,'2025-02-28','scheduled','05:00:00','06:30:00',NULL),(259,62,9,'2025-03-01','scheduled','16:00:00','17:30:00',NULL),(260,62,4,'2025-03-03','scheduled','05:00:00','06:30:00',NULL),(261,62,5,'2025-03-04','scheduled','16:00:00','17:30:00',NULL),(262,62,6,'2025-03-05','scheduled','05:00:00','06:30:00',NULL),(263,62,7,'2025-03-06','scheduled','16:00:00','17:30:00',NULL),(264,62,8,'2025-03-07','scheduled','05:00:00','06:30:00',NULL),(265,62,9,'2025-03-08','scheduled','16:00:00','17:30:00',NULL),(266,64,12,'2025-02-08','scheduled','16:00:00','17:30:00',NULL);
/*!40000 ALTER TABLE `asa_booking_sessions` ENABLE KEYS */;
UNLOCK TABLES;

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
  `recurring_payment_date` int DEFAULT NULL,
  `next_payment_date` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `asa_bookings_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `asa_packages` (`id`),
  CONSTRAINT `asa_bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_bookings`
--

LOCK TABLES `asa_bookings` WRITE;
/*!40000 ALTER TABLE `asa_bookings` DISABLE KEYS */;
INSERT INTO `asa_bookings` VALUES (1,8,1,'2025-01-07 15:33:04','paid',NULL,NULL,NULL,NULL),(2,8,2,'2025-01-07 15:33:19','paid',NULL,NULL,NULL,NULL),(3,8,1,'2025-01-07 22:59:03','paid',NULL,NULL,NULL,NULL),(4,8,1,'2025-01-07 23:08:07','paid',100000,NULL,NULL,NULL),(5,8,2,'2025-01-07 23:11:16','paid',0,NULL,NULL,NULL),(6,8,1,'2025-01-07 23:19:15','pending',0,NULL,NULL,NULL),(7,8,1,'2025-01-07 23:19:58','pending',0,NULL,NULL,NULL),(8,8,1,'2025-01-07 23:20:34','paid',100000,NULL,NULL,NULL),(9,8,2,'2025-01-07 23:20:46','paid',0,NULL,NULL,NULL),(10,8,2,'2025-01-07 23:23:49','pending',0,NULL,NULL,NULL),(11,8,1,'2025-01-08 14:45:30','pending',0,NULL,NULL,NULL),(12,8,2,'2025-01-08 14:47:20','pending',0,NULL,NULL,NULL),(13,8,1,'2025-01-08 14:49:25','pending',0,NULL,NULL,NULL),(14,8,1,'2025-01-08 14:51:03','pending',0,NULL,NULL,NULL),(15,8,2,'2025-01-08 14:53:26','pending',0,NULL,NULL,NULL),(16,8,1,'2025-02-03 12:53:44','pending',0,NULL,NULL,NULL),(17,8,2,'2025-02-03 12:55:16','pending',0,NULL,NULL,NULL),(18,8,1,'2025-02-03 13:58:20','pending',0,NULL,NULL,NULL),(19,9,1,'2025-02-03 14:04:34','pending',0,NULL,NULL,NULL),(20,9,1,'2025-02-03 14:18:27','pending',0,NULL,NULL,NULL),(21,9,2,'2025-02-03 14:25:49','pending',0,NULL,NULL,NULL),(22,9,1,'2025-02-03 14:28:35','pending',0,NULL,NULL,NULL),(23,9,1,'2025-02-03 14:34:45','pending',0,NULL,NULL,NULL),(24,9,2,'2025-02-03 14:35:59','pending',0,NULL,NULL,NULL),(25,9,1,'2025-02-03 14:46:16','paid',0,NULL,NULL,NULL),(26,9,1,'2025-02-03 14:48:47','paid',0,NULL,NULL,NULL),(27,9,2,'2025-02-03 14:51:18','paid',0,NULL,NULL,NULL),(28,10,1,'2025-02-03 15:35:17','paid',0,NULL,NULL,NULL),(29,9,1,'2025-02-03 15:35:25','pending',0,NULL,NULL,NULL),(30,10,2,'2025-02-03 15:36:53','paid',0,NULL,NULL,NULL),(31,10,1,'2025-02-03 15:37:44','pending',0,NULL,NULL,NULL),(32,10,2,'2025-02-03 15:41:17','pending',0,NULL,NULL,NULL),(33,9,1,'2025-02-03 16:11:01','pending',0,NULL,NULL,NULL),(34,9,1,'2025-02-03 16:12:14','pending',0,NULL,NULL,NULL),(35,9,1,'2025-02-03 16:14:24','paid',0,NULL,NULL,NULL),(36,9,2,'2025-02-03 16:23:39','pending',0,NULL,NULL,NULL),(37,10,2,'2025-02-03 19:34:15','pending',0,NULL,NULL,NULL),(38,9,1,'2025-02-04 03:49:55','paid',100000,NULL,NULL,NULL),(39,9,2,'2025-02-04 04:18:17','paid',100000,NULL,NULL,NULL),(40,10,1,'2025-02-04 04:19:08','paid',50000,NULL,NULL,NULL),(41,10,3,'2025-02-04 04:45:59','pending',0,NULL,NULL,NULL),(42,10,3,'2025-02-04 04:46:41','pending',0,NULL,NULL,NULL),(43,10,3,'2025-02-04 04:49:38','pending',0,NULL,NULL,NULL),(44,10,1,'2025-02-04 04:49:56','paid',0,NULL,NULL,NULL),(45,10,3,'2025-02-04 04:53:30','pending',0,NULL,NULL,NULL),(46,10,1,'2025-02-04 05:02:26','paid',0,NULL,NULL,NULL),(47,10,3,'2025-02-04 05:02:56','paid',0,NULL,NULL,NULL),(48,10,1,'2025-02-04 07:56:11','paid',0,NULL,NULL,NULL),(49,11,3,'2025-02-04 13:33:56','pending',0,NULL,NULL,NULL),(50,10,1,'2025-02-06 14:48:45','pending',0,NULL,NULL,NULL),(51,10,2,'2025-02-06 14:48:49','pending',0,NULL,NULL,NULL),(52,10,2,'2025-02-06 14:49:35','pending',0,NULL,NULL,NULL),(53,10,2,'2025-02-07 02:56:51','pending',0,NULL,NULL,NULL),(54,12,2,'2025-02-07 02:57:19','pending',0,NULL,NULL,NULL),(55,11,2,'2025-02-07 03:00:50','pending',0,NULL,NULL,NULL),(56,11,1,'2025-02-07 03:01:10','paid',50000,NULL,NULL,NULL),(57,12,2,'2025-02-07 03:12:51','pending',0,NULL,NULL,NULL),(58,11,2,'2025-02-07 03:13:20','pending',0,NULL,NULL,NULL),(59,11,1,'2025-02-07 03:18:54','paid',0,NULL,NULL,NULL),(60,11,2,'2025-02-07 03:19:43','paid',0,NULL,NULL,NULL),(61,11,1,'2025-02-07 03:23:58','pending',0,NULL,NULL,NULL),(62,12,2,'2025-02-07 03:26:34','paid',0,NULL,NULL,NULL),(63,12,2,'2025-02-07 03:27:45','pending',0,NULL,NULL,NULL),(64,12,3,'2025-02-07 03:28:38','paid',0,NULL,NULL,NULL),(65,12,2,'2025-02-07 03:28:58','pending',0,NULL,NULL,NULL),(66,11,1,'2025-02-07 03:39:59','pending',0,NULL,NULL,1),(67,13,1,'2025-02-07 03:40:44','pending',0,NULL,NULL,1),(68,13,1,'2025-02-07 03:43:32','paid',50000,7,'2025-03-07',1),(69,13,1,'2025-02-07 03:44:02','pending',0,NULL,NULL,1),(70,12,2,'2025-02-07 03:44:18','paid',0,7,'2025-03-07',1),(71,13,1,'2025-02-07 03:46:36','pending',0,NULL,NULL,1),(72,13,2,'2025-02-07 03:51:33','pending',0,NULL,NULL,1),(73,14,2,'2025-02-07 04:13:24','paid',0,7,'2025-03-07',1),(74,15,1,'2025-02-07 04:25:29','paid',0,7,'2025-03-07',1),(75,16,1,'2025-02-07 04:37:02','paid',0,7,'2025-04-07',1),(76,17,1,'2025-02-07 06:22:40','pending',0,NULL,NULL,1),(77,17,2,'2025-02-07 06:23:31','paid',0,7,'2025-04-07',1),(78,16,1,'2025-02-07 07:27:53','paid',0,1,'2025-03-01',1),(79,18,1,'2025-02-07 07:31:01','paid',0,1,'2025-03-01',1),(80,18,1,'2025-02-07 08:28:52','pending',0,NULL,NULL,1),(81,11,2,'2025-02-07 10:12:33','pending',0,NULL,NULL,1);
/*!40000 ALTER TABLE `asa_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asa_packages`
--

DROP TABLE IF EXISTS `asa_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `description` text,
  `is_morning_available` tinyint(1) DEFAULT NULL,
  `sessions_per_month` int DEFAULT NULL,
  `is_trial` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_packages`
--

LOCK TABLES `asa_packages` WRITE;
/*!40000 ALTER TABLE `asa_packages` DISABLE KEYS */;
INSERT INTO `asa_packages` VALUES (1,'Reguler',350000,'3x per minggu (Selasa, Kamis, Sabtu sore)',0,12,NULL),(2,'Reguler + Pagi',400000,'6x per minggu (Senin, Rabu, Jumat pagi & Selasa, Kamis, Sabtu sore)',1,12,NULL),(3,'Trial',90000,'1x Trial Session',0,1,1);
/*!40000 ALTER TABLE `asa_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asa_schedules`
--

DROP TABLE IF EXISTS `asa_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `day_name` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `quota` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `asa_schedules_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `asa_packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_schedules`
--

LOCK TABLES `asa_schedules` WRITE;
/*!40000 ALTER TABLE `asa_schedules` DISABLE KEYS */;
INSERT INTO `asa_schedules` VALUES (1,1,'SELASA','16:00:00','17:30:00',20),(2,1,'KAMIS','16:00:00','17:30:00',20),(3,1,'SABTU','16:00:00','17:30:00',20),(4,2,'SENIN','05:00:00','06:30:00',20),(5,2,'SELASA','16:00:00','17:30:00',20),(6,2,'RABU','05:00:00','06:30:00',20),(7,2,'KAMIS','16:00:00','17:30:00',20),(8,2,'JUMAT','05:00:00','06:30:00',20),(9,2,'SABTU','16:00:00','17:30:00',20),(10,3,'SELASA','16:00:00','17:30:00',NULL),(11,3,'KAMIS','16:00:00','17:30:00',NULL),(12,3,'SABTU','16:00:00','17:30:00',NULL);
/*!40000 ALTER TABLE `asa_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int NOT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `presence_status` varchar(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,'2025-02-06','17:00:00','18:30:00',9,'paid','1738639395_9','present','good'),(2,1,'2025-02-15','16:00:00','17:30:00',9,'paid','1738639395_9',NULL,NULL),(3,1,'2025-02-22','18:00:00','19:30:00',9,'paid','1738639395_9',NULL,NULL),(4,1,'2025-03-01','18:00:00','19:30:00',9,'paid','1738639395_9',NULL,NULL),(5,3,'2025-03-08','16:15:00','17:30:00',10,'pending','1738657240_10','absent',''),(6,3,'2025-03-07','16:15:00','17:30:00',10,'pending','1738657240_10','pending',NULL),(7,3,'2025-03-22','16:15:00','17:30:00',10,'pending','1738657240_10','pending',NULL),(8,3,'2025-03-12','16:15:00','17:30:00',10,'pending','1738657240_10','pending',NULL),(9,3,'2025-02-15','07:15:00','08:30:00',11,'pending','1738665531_11','pending',NULL),(10,3,'2025-02-22','07:15:00','08:30:00',11,'pending','1738665531_11','pending',NULL),(11,3,'2025-03-01','07:15:00','08:30:00',11,'pending','1738665531_11','pending',NULL),(12,3,'2025-03-08','07:15:00','08:30:00',11,'pending','1738665531_11','pending',NULL),(13,1,'2025-02-08','16:00:00','17:30:00',11,'pending','1738897143_11','pending',NULL),(14,1,'2025-02-15','16:00:00','17:30:00',11,'pending','1738897143_11','pending',NULL),(15,1,'2025-02-22','16:00:00','17:30:00',11,'pending','1738897143_11','pending',NULL),(16,1,'2025-03-01','16:00:00','17:30:00',11,'pending','1738897143_11','pending',NULL),(17,3,'2025-02-08','07:15:00','08:30:00',12,'pending','1738897341_12','pending',NULL),(18,3,'2025-02-15','07:15:00','08:30:00',12,'pending','1738897341_12','pending',NULL),(19,3,'2025-02-22','07:15:00','08:30:00',12,'pending','1738897341_12','pending',NULL),(20,3,'2025-03-01','07:15:00','08:30:00',12,'pending','1738897341_12','pending',NULL),(21,3,'2025-02-09','16:15:00','17:30:00',12,'pending','1738899027_12','pending',NULL),(22,3,'2025-02-16','16:15:00','17:30:00',12,'pending','1738899027_12','pending',NULL),(23,3,'2025-02-23','16:15:00','17:30:00',12,'pending','1738899027_12','pending',NULL),(24,3,'2025-03-02','16:15:00','17:30:00',12,'pending','1738899027_12','pending',NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `valid_until` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `discount_amount` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'welcome5','2025-12-12',1,0,NULL),(2,'100RB','2025-12-12',1,100000,NULL),(3,'GENERAL2024','2025-12-31',1,50000,NULL),(4,'SPECIAL9','2025-12-31',1,100000,9),(5,'merdeka20','2025-04-25',1,150000,NULL),(6,'AFFI20','2028-02-10',1,200000,18),(8,'12FF','2025-02-12',1,15000,NULL),(9,'asep20','2025-02-17',1,20000,14),(10,'A123','2025-02-22',1,25000,10);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `monthly_price` int NOT NULL,
  `daily_price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'ASA',250000,90000),(2,'KCC',250000,90000),(3,'BBS',260000,90000),(4,'RAKATA',260000,90000);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quota` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location_id` int NOT NULL,
  `day_name` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `quota` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `quota_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
INSERT INTO `quota` VALUES (1,1,'Tuesday','16:00:00','17:30:00',20),(2,1,'Thursday','16:00:00','17:30:00',20),(3,1,'Saturday','16:00:00','17:30:00',20),(4,2,'Monday','15:30:00','17:00:00',20),(5,2,'Wednesday','16:00:00','17:30:00',20),(6,2,'Friday','16:00:00','17:30:00',20),(7,3,'Wednesday','16:15:00','17:30:00',20),(8,3,'Friday','14:30:00','15:45:00',20),(9,3,'Friday','16:15:00','17:30:00',20),(10,3,'Saturday','07:15:00','08:30:00',20),(11,3,'Saturday','08:30:00','09:45:00',20),(12,3,'Sunday','14:30:00','15:45:00',20),(13,3,'Sunday','16:15:00','17:30:00',20),(14,4,'Saturday','07:30:00','08:45:00',20),(15,4,'Sunday','16:15:00','17:30:00',20);
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','john@example.com','scrypt:32768:8:1$8fDhQtfuSNl5hjtI$caa943c56d5737caea7514f622d15571ffdada8238ca5ea4fddcf4ea2682e82e7d751252afaac76703c1720ad8fb30063c30a637517d484c94e577439373b0db',NULL),(2,'jane_smith','jane@example.com','scrypt:32768:8:1$JqoUr5NeinWtpSpF$546503f1fa59f8094d30df4ff0981fa7546625ad446ea15f152e7a089373173bcae4577f14e2a05c9b46d4a086f5af7bb3fc4a6f51b6198dd2c9d00982a9f368',NULL),(3,'bob_wilson','bob@example.com','scrypt:32768:8:1$lP9v76DaoJLVyby9$9053aa631eaaed5fb2866d774ee19bc8221b7485476a1cc3d6efb487eae2e925b6a069d5992add761c709b45fc1bd0a1936bfa1a8923dad49a2550fabe663ecc',NULL),(4,'gian','gian@gmail.com','scrypt:32768:8:1$LhPlAz4tTDAiC15e$47311ebf2900142faa086c31b9ac6b383819003b668e2ec055f0dff723cd733caa4c828f2a6d37d2410ca14f05134167c7474bd9e1228e625c41a89c26b5644c',NULL),(5,'atlit2','atlit1@gmail.com','scrypt:32768:8:1$7oKUxYk4eeJrGDlG$cb6128ccb741c098ee2be6c09dae57701a66ad605e40ff1cf2bfd192e5d50f0ec3e3a6d05b4ef283aeb6e4c812f38eb710551f9d75a2ae0bbbac158734d698f5',NULL),(6,'A','a@a','scrypt:32768:8:1$pnNZf5ZVrw54PBz8$a1cba24d4c84edd4f205705e075707c44d6e90da8e36f5f8dfbc4cea771e601d61a0c90b1b260f9ef9e9b9dd54d84d09c76dbdba544f46c04dd1f545eaec4020',NULL),(7,'Aaa','aaa@aaa','scrypt:32768:8:1$GWvtmoCkvCSNTUMG$536e5c34bcecb217872412a3ac0178294a05bed7fe9745b73c5faed2a0e26b094da6d80287125598825e6261989fc365a0458700a4363e553af7fe26c6f090bf',NULL),(8,'waliyudin','wali@gmail.com','scrypt:32768:8:1$8cHb98KsLOmrWk8s$93492a5d11f5d8ab866e4e4b4e70209361001c04173224efe3683590bf9f320cf25b3d157082e1f352752174567f2daa923fb5dab28e306d384ed3d195b6ad26',NULL),(9,'superatlit','super@gmail.com','scrypt:32768:8:1$TcgZ40GJUpN9ZZRQ$c321d14aedb55a465f490cbb75e78b5af5aa188d30e67f9b421f5d7e8650905e8b730df28608d2980c2df4326f88f2f6513a7af71f6db6b569344e5e79257155',NULL),(10,'123','123123@123.com','scrypt:32768:8:1$DBZURwiZ6GZdwX4Y$96936aaea311a36884808effbe00ac7acc543ba0c7d1c1ee4b7307334b47f2c1e63a17450df7b5f6df3cf7757e30d4e13ae4b61ee26e1f986b64d5981537d911',NULL),(11,'admin','admin@gmail.com','scrypt:32768:8:1$IQfaCGkX6OXuivDG$5b98a8d9155877e19bda3156e52a7b8d15ed93f37b2e9c6bc291b92d05aeace698708827f4a80bc2fa58cf2fcd9f1387d8d9a1f1434371e7b4f3ec4d4dc07a5f',1),(12,'321','32@321.321','scrypt:32768:8:1$MZIng8AXDNuXjpdw$587c7add70003912ee23aea88d82ce5c70052b4be8df514d43a69d9e3f70dfaa4492dc0199ea17e5e9ef9e62779e7d697451b9382aca7dfae2cef862df45c18f',0),(13,'abdul','abdul@gmail.com','scrypt:32768:8:1$58tPAc2ig1JFHFtb$5772dac01145698e4c3d33bbfcd9381bad94adffe63283fc18860a6a379e958143e01ddae7a4d38a4c0b068c27ef669adf6f8191f20b88aad6ef200b33c47b46',0),(14,'asep','asep@gmail.com','scrypt:32768:8:1$908cqdbAleCf1yCw$a331b6cbb7728e8fbcfdcb2f2cb8be3afa0949c49baeb3eeaf2c918eeb586d814b6351936c42492af4c25f3a67ac51b4d10b1b8853b303e5b3ee4d9d579d2434',0),(15,'sap','sap@gmail.com','scrypt:32768:8:1$lJXg6HxAMp0cUU81$bb795a17ac084a53aaf7fee7303f0a7bb3c17c3562224499f4753562ba585b5d36127a24787ea24feed5d0dcf148c0ee8cbfc547372448912599643147e71a9f',0),(16,'a1','a1@gmail.com','scrypt:32768:8:1$xXZDmUHgUkDIpSBY$89068c21000d53f447afbe2957245eeb4aa94426516952795a17cd482226bb78bdaedf23171fc43a22ed2d0c9b4005b512faa2eb136563786136402db2baaffc',0),(17,'A3','a3@gmail.com','scrypt:32768:8:1$ExpG83gKgyTvnVuH$6397dacd39354e3b002adc8b534a16b206f6547103c4f0d6d7a60c031d33643e82fb955b756845a5158d5007909a35f90f6789913a0b6cabb555d113bc447db6',0),(18,'a12','a12@gmail.com','scrypt:32768:8:1$Q3e1v3LOJ3IbeFY2$c7e3e1be2912498a0ff46e3fc8913df1bdac2c88df9f7368193dd21e3f0df0dc1070245bcad7ca1bcf8728a73daab93013a847768d32e2fe683d274275677259',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-07 17:41:06
