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
INSERT INTO `alembic_version` VALUES ('4b728d4823f8');
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
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `asa_booking_sessions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `asa_bookings` (`id`),
  CONSTRAINT `asa_booking_sessions_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `asa_schedules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_booking_sessions`
--

LOCK TABLES `asa_booking_sessions` WRITE;
/*!40000 ALTER TABLE `asa_booking_sessions` DISABLE KEYS */;
INSERT INTO `asa_booking_sessions` VALUES (1,25,1,'2025-02-04','scheduled','16:00:00','17:30:00'),(2,25,2,'2025-02-06','scheduled','16:00:00','17:30:00'),(3,25,3,'2025-02-08','scheduled','16:00:00','17:30:00'),(4,25,1,'2025-02-11','scheduled','16:00:00','17:30:00'),(5,25,2,'2025-02-13','scheduled','16:00:00','17:30:00'),(6,25,3,'2025-02-15','scheduled','16:00:00','17:30:00'),(7,25,1,'2025-02-18','scheduled','16:00:00','17:30:00'),(8,25,2,'2025-02-20','scheduled','16:00:00','17:30:00'),(9,25,3,'2025-02-22','scheduled','16:00:00','17:30:00'),(10,25,1,'2025-02-25','scheduled','16:00:00','17:30:00'),(11,25,2,'2025-02-27','scheduled','16:00:00','17:30:00'),(12,25,3,'2025-03-01','scheduled','16:00:00','17:30:00'),(13,26,1,'2025-02-04','scheduled','16:00:00','17:30:00'),(14,26,2,'2025-02-06','scheduled','16:00:00','17:30:00'),(15,26,3,'2025-02-08','scheduled','16:00:00','17:30:00'),(16,26,1,'2025-02-11','scheduled','16:00:00','17:30:00'),(17,26,2,'2025-02-13','scheduled','16:00:00','17:30:00'),(18,26,3,'2025-02-15','scheduled','16:00:00','17:30:00'),(19,26,1,'2025-02-18','scheduled','16:00:00','17:30:00'),(20,26,2,'2025-02-20','scheduled','16:00:00','17:30:00'),(21,26,3,'2025-02-22','scheduled','16:00:00','17:30:00'),(22,26,1,'2025-02-25','scheduled','16:00:00','17:30:00'),(23,26,2,'2025-02-27','scheduled','16:00:00','17:30:00'),(24,26,3,'2025-03-01','scheduled','16:00:00','17:30:00'),(25,27,4,'2025-02-03','scheduled','05:00:00','06:30:00'),(26,27,5,'2025-02-04','scheduled','16:00:00','17:30:00'),(27,27,6,'2025-02-05','scheduled','05:00:00','06:30:00'),(28,27,7,'2025-02-06','scheduled','16:00:00','17:30:00'),(29,27,8,'2025-02-07','scheduled','05:00:00','06:30:00'),(30,27,9,'2025-02-08','scheduled','16:00:00','17:30:00'),(31,27,4,'2025-02-10','scheduled','05:00:00','06:30:00'),(32,27,5,'2025-02-11','scheduled','16:00:00','17:30:00'),(33,27,6,'2025-02-12','scheduled','05:00:00','06:30:00'),(34,27,7,'2025-02-13','scheduled','16:00:00','17:30:00'),(35,27,8,'2025-02-14','scheduled','05:00:00','06:30:00'),(36,27,9,'2025-02-15','scheduled','16:00:00','17:30:00'),(37,27,4,'2025-02-17','scheduled','05:00:00','06:30:00'),(38,27,5,'2025-02-18','scheduled','16:00:00','17:30:00'),(39,27,6,'2025-02-19','scheduled','05:00:00','06:30:00'),(40,27,7,'2025-02-20','scheduled','16:00:00','17:30:00'),(41,27,8,'2025-02-21','scheduled','05:00:00','06:30:00'),(42,27,9,'2025-02-22','scheduled','16:00:00','17:30:00'),(43,27,4,'2025-02-24','scheduled','05:00:00','06:30:00'),(44,27,5,'2025-02-25','scheduled','16:00:00','17:30:00'),(45,27,6,'2025-02-26','scheduled','05:00:00','06:30:00'),(46,27,7,'2025-02-27','scheduled','16:00:00','17:30:00'),(47,27,8,'2025-02-28','scheduled','05:00:00','06:30:00'),(48,27,9,'2025-03-01','scheduled','16:00:00','17:30:00'),(49,28,1,'2025-02-04','scheduled','16:00:00','17:30:00'),(50,28,2,'2025-02-06','scheduled','16:00:00','17:30:00'),(51,28,3,'2025-02-08','scheduled','16:00:00','17:30:00'),(52,28,1,'2025-02-11','scheduled','16:00:00','17:30:00'),(53,28,2,'2025-02-13','scheduled','16:00:00','17:30:00'),(54,28,3,'2025-02-15','scheduled','16:00:00','17:30:00'),(55,28,1,'2025-02-18','scheduled','16:00:00','17:30:00'),(56,28,2,'2025-02-20','scheduled','16:00:00','17:30:00'),(57,28,3,'2025-02-22','scheduled','16:00:00','17:30:00'),(58,28,1,'2025-02-25','scheduled','16:00:00','17:30:00'),(59,28,2,'2025-02-27','scheduled','16:00:00','17:30:00'),(60,28,3,'2025-03-01','scheduled','16:00:00','17:30:00'),(61,30,4,'2025-02-03','scheduled','05:00:00','06:30:00'),(62,30,5,'2025-02-04','scheduled','16:00:00','17:30:00'),(63,30,6,'2025-02-05','scheduled','05:00:00','06:30:00'),(64,30,7,'2025-02-06','scheduled','16:00:00','17:30:00'),(65,30,8,'2025-02-07','scheduled','05:00:00','06:30:00'),(66,30,9,'2025-02-08','scheduled','16:00:00','17:30:00'),(67,30,4,'2025-02-10','scheduled','05:00:00','06:30:00'),(68,30,5,'2025-02-11','scheduled','16:00:00','17:30:00'),(69,30,6,'2025-02-12','scheduled','05:00:00','06:30:00'),(70,30,7,'2025-02-13','scheduled','16:00:00','17:30:00'),(71,30,8,'2025-02-14','scheduled','05:00:00','06:30:00'),(72,30,9,'2025-02-15','scheduled','16:00:00','17:30:00'),(73,30,4,'2025-02-17','scheduled','05:00:00','06:30:00'),(74,30,5,'2025-02-18','scheduled','16:00:00','17:30:00'),(75,30,6,'2025-02-19','scheduled','05:00:00','06:30:00'),(76,30,7,'2025-02-20','scheduled','16:00:00','17:30:00'),(77,30,8,'2025-02-21','scheduled','05:00:00','06:30:00'),(78,30,9,'2025-02-22','scheduled','16:00:00','17:30:00'),(79,30,4,'2025-02-24','scheduled','05:00:00','06:30:00'),(80,30,5,'2025-02-25','scheduled','16:00:00','17:30:00'),(81,30,6,'2025-02-26','scheduled','05:00:00','06:30:00'),(82,30,7,'2025-02-27','scheduled','16:00:00','17:30:00'),(83,30,8,'2025-02-28','scheduled','05:00:00','06:30:00'),(84,30,9,'2025-03-01','scheduled','16:00:00','17:30:00'),(85,35,3,'2025-03-01','scheduled','16:00:00','17:30:00'),(86,35,1,'2025-03-04','scheduled','16:00:00','17:30:00'),(87,35,2,'2025-03-06','scheduled','16:00:00','17:30:00'),(88,35,3,'2025-03-08','scheduled','16:00:00','17:30:00'),(89,35,1,'2025-03-11','scheduled','16:00:00','17:30:00'),(90,35,2,'2025-03-13','scheduled','16:00:00','17:30:00'),(91,35,3,'2025-03-15','scheduled','16:00:00','17:30:00'),(92,35,1,'2025-03-18','scheduled','16:00:00','17:30:00'),(93,35,2,'2025-03-20','scheduled','16:00:00','17:30:00'),(94,35,3,'2025-03-22','scheduled','16:00:00','17:30:00'),(95,35,1,'2025-03-25','scheduled','16:00:00','17:30:00'),(96,35,2,'2025-03-27','scheduled','16:00:00','17:30:00'),(97,35,3,'2025-03-29','scheduled','16:00:00','17:30:00'),(98,38,1,'2025-02-04','scheduled','16:00:00','17:30:00'),(99,38,2,'2025-02-06','scheduled','16:00:00','17:30:00'),(100,38,3,'2025-02-08','scheduled','16:00:00','17:30:00'),(101,38,1,'2025-02-11','scheduled','16:00:00','17:30:00'),(102,38,2,'2025-02-13','scheduled','16:00:00','17:30:00'),(103,38,3,'2025-02-15','scheduled','16:00:00','17:30:00'),(104,38,1,'2025-02-18','scheduled','16:00:00','17:30:00'),(105,38,2,'2025-02-20','scheduled','16:00:00','17:30:00'),(106,38,3,'2025-02-22','scheduled','16:00:00','17:30:00'),(107,38,1,'2025-02-25','scheduled','16:00:00','17:30:00'),(108,38,2,'2025-02-27','scheduled','16:00:00','17:30:00'),(109,38,3,'2025-03-01','scheduled','16:00:00','17:30:00'),(110,38,1,'2025-03-04','scheduled','16:00:00','17:30:00');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_packages`
--

LOCK TABLES `asa_packages` WRITE;
/*!40000 ALTER TABLE `asa_packages` DISABLE KEYS */;
INSERT INTO `asa_packages` VALUES (1,'Reguler',350000,'3x per minggu (Selasa, Kamis, Sabtu sore)',0,12),(2,'Reguler + Pagi',400000,'6x per minggu (Senin, Rabu, Jumat pagi & Selasa, Kamis, Sabtu sore)',1,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_schedules`
--

LOCK TABLES `asa_schedules` WRITE;
/*!40000 ALTER TABLE `asa_schedules` DISABLE KEYS */;
INSERT INTO `asa_schedules` VALUES (1,1,'SELASA','16:00:00','17:30:00',20),(2,1,'KAMIS','16:00:00','17:30:00',20),(3,1,'SABTU','16:00:00','17:30:00',20),(4,2,'SENIN','05:00:00','06:30:00',20),(5,2,'SELASA','16:00:00','17:30:00',20),(6,2,'RABU','05:00:00','06:30:00',20),(7,2,'KAMIS','16:00:00','17:30:00',20),(8,2,'JUMAT','05:00:00','06:30:00',20),(9,2,'SABTU','16:00:00','17:30:00',20);
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
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,'2025-02-06','17:00:00','18:30:00',9,'paid','1738639395_9'),(2,1,'2025-02-13','17:00:00','18:30:00',9,'paid','1738639395_9'),(3,1,'2025-02-20','17:00:00','18:30:00',9,'paid','1738639395_9'),(4,1,'2025-02-27','17:00:00','18:30:00',9,'paid','1738639395_9');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'welcome5','2025-12-12',1,0),(2,'100RB','2025-12-12',1,100000);
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
INSERT INTO `location` VALUES (1,'ASA',400000,90000),(2,'KCC',450000,90000),(3,'BBS',260000,90000),(4,'RAKATA',260000,90000);
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
INSERT INTO `quota` VALUES (1,1,'Tuesday','16:00:00','17:30:00',20),(2,1,'Thursday','17:00:00','18:30:00',20),(3,1,'Saturday','18:00:00','19:30:00',20),(4,2,'Monday','15:30:00','17:00:00',20),(5,2,'Wednesday','16:00:00','17:30:00',20),(6,2,'Friday','16:00:00','17:30:00',20),(7,3,'Wednesday','16:15:00','17:30:00',20),(8,3,'Friday','14:30:00','15:45:00',20),(9,3,'Friday','16:15:00','17:30:00',20),(10,3,'Saturday','07:15:00','08:30:00',20),(11,3,'Saturday','08:30:00','09:45:00',20),(12,3,'Sunday','14:30:00','15:45:00',20),(13,3,'Sunday','16:15:00','17:30:00',20),(14,4,'Saturday','07:30:00','08:45:00',20),(15,4,'Sunday','16:15:00','17:30:00',20);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john_doe','john@example.com','scrypt:32768:8:1$8fDhQtfuSNl5hjtI$caa943c56d5737caea7514f622d15571ffdada8238ca5ea4fddcf4ea2682e82e7d751252afaac76703c1720ad8fb30063c30a637517d484c94e577439373b0db'),(2,'jane_smith','jane@example.com','scrypt:32768:8:1$JqoUr5NeinWtpSpF$546503f1fa59f8094d30df4ff0981fa7546625ad446ea15f152e7a089373173bcae4577f14e2a05c9b46d4a086f5af7bb3fc4a6f51b6198dd2c9d00982a9f368'),(3,'bob_wilson','bob@example.com','scrypt:32768:8:1$lP9v76DaoJLVyby9$9053aa631eaaed5fb2866d774ee19bc8221b7485476a1cc3d6efb487eae2e925b6a069d5992add761c709b45fc1bd0a1936bfa1a8923dad49a2550fabe663ecc'),(4,'gian','gian@gmail.com','scrypt:32768:8:1$LhPlAz4tTDAiC15e$47311ebf2900142faa086c31b9ac6b383819003b668e2ec055f0dff723cd733caa4c828f2a6d37d2410ca14f05134167c7474bd9e1228e625c41a89c26b5644c'),(5,'atlit2','atlit1@gmail.com','scrypt:32768:8:1$7oKUxYk4eeJrGDlG$cb6128ccb741c098ee2be6c09dae57701a66ad605e40ff1cf2bfd192e5d50f0ec3e3a6d05b4ef283aeb6e4c812f38eb710551f9d75a2ae0bbbac158734d698f5'),(6,'A','a@a','scrypt:32768:8:1$pnNZf5ZVrw54PBz8$a1cba24d4c84edd4f205705e075707c44d6e90da8e36f5f8dfbc4cea771e601d61a0c90b1b260f9ef9e9b9dd54d84d09c76dbdba544f46c04dd1f545eaec4020'),(7,'Aaa','aaa@aaa','scrypt:32768:8:1$GWvtmoCkvCSNTUMG$536e5c34bcecb217872412a3ac0178294a05bed7fe9745b73c5faed2a0e26b094da6d80287125598825e6261989fc365a0458700a4363e553af7fe26c6f090bf'),(8,'waliyudin','wali@gmail.com','scrypt:32768:8:1$8cHb98KsLOmrWk8s$93492a5d11f5d8ab866e4e4b4e70209361001c04173224efe3683590bf9f320cf25b3d157082e1f352752174567f2daa923fb5dab28e306d384ed3d195b6ad26'),(9,'superatlit','super@gmail.com','scrypt:32768:8:1$TcgZ40GJUpN9ZZRQ$c321d14aedb55a465f490cbb75e78b5af5aa188d30e67f9b421f5d7e8650905e8b730df28608d2980c2df4326f88f2f6513a7af71f6db6b569344e5e79257155'),(10,'123','123123@123.com','scrypt:32768:8:1$DBZURwiZ6GZdwX4Y$96936aaea311a36884808effbe00ac7acc543ba0c7d1c1ee4b7307334b47f2c1e63a17450df7b5f6df3cf7757e30d4e13ae4b61ee26e1f986b64d5981537d911');
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

-- Dump completed on 2025-02-04 11:12:51
