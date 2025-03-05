-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sportigo_windows
-- ------------------------------------------------------
-- Server version	8.0.40

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
INSERT INTO `alembic_version` VALUES ('7097e360717b');
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
  `booking_id` varchar(36) NOT NULL,
  `schedule_id` int NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `asa_booking_sessions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `asa_bookings` (`id`),
  CONSTRAINT `asa_booking_sessions_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `asa_schedules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_booking_sessions`
--

LOCK TABLES `asa_booking_sessions` WRITE;
/*!40000 ALTER TABLE `asa_booking_sessions` DISABLE KEYS */;
INSERT INTO `asa_booking_sessions` VALUES (1,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',1,'2025-03-04','16:00:00','17:30:00','cancelled','sick'),(2,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(3,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(4,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(5,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(6,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(7,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(8,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(9,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(10,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(11,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(12,'f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL),(13,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-04','16:00:00','17:30:00','scheduled',NULL),(14,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(15,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(16,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(17,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(18,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(19,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(20,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(21,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(22,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(23,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(24,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL),(25,'444b76fe-6523-427f-a2e5-e83d75430c6d',1,'2025-03-04','16:00:00','17:30:00','scheduled',NULL),(26,'444b76fe-6523-427f-a2e5-e83d75430c6d',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(27,'444b76fe-6523-427f-a2e5-e83d75430c6d',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(28,'444b76fe-6523-427f-a2e5-e83d75430c6d',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(29,'444b76fe-6523-427f-a2e5-e83d75430c6d',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(30,'444b76fe-6523-427f-a2e5-e83d75430c6d',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(31,'444b76fe-6523-427f-a2e5-e83d75430c6d',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(32,'444b76fe-6523-427f-a2e5-e83d75430c6d',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(33,'444b76fe-6523-427f-a2e5-e83d75430c6d',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(34,'444b76fe-6523-427f-a2e5-e83d75430c6d',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(35,'444b76fe-6523-427f-a2e5-e83d75430c6d',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(36,'444b76fe-6523-427f-a2e5-e83d75430c6d',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL),(37,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-04','16:00:00','17:30:00','scheduled',NULL),(38,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(39,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(40,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(41,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(42,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(43,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(44,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(45,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(46,'f35dc986-882b-428b-aa03-4b4133b39762',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(47,'f35dc986-882b-428b-aa03-4b4133b39762',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(48,'f35dc986-882b-428b-aa03-4b4133b39762',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL),(49,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',3,'2025-03-01','16:00:00','17:30:00','scheduled',NULL),(50,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',1,'2025-03-04','16:00:00','17:30:00','scheduled',NULL),(51,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(52,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(53,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(54,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(55,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(56,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(57,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(58,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(59,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(60,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(61,'0b2a6f08-995e-403a-92f9-5f90f251b0bb',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL),(62,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',3,'2025-03-01','16:00:00','17:30:00','scheduled',NULL),(63,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',1,'2025-03-04','16:00:00','17:30:00','scheduled',NULL),(64,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',2,'2025-03-06','16:00:00','17:30:00','scheduled',NULL),(65,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',3,'2025-03-08','16:00:00','17:30:00','scheduled',NULL),(66,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',1,'2025-03-11','16:00:00','17:30:00','scheduled',NULL),(67,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',2,'2025-03-13','16:00:00','17:30:00','scheduled',NULL),(68,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',3,'2025-03-15','16:00:00','17:30:00','scheduled',NULL),(69,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',1,'2025-03-18','16:00:00','17:30:00','scheduled',NULL),(70,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',2,'2025-03-20','16:00:00','17:30:00','scheduled',NULL),(71,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',3,'2025-03-22','16:00:00','17:30:00','scheduled',NULL),(72,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',1,'2025-03-25','16:00:00','17:30:00','scheduled',NULL),(73,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',2,'2025-03-27','16:00:00','17:30:00','scheduled',NULL),(74,'03f1ae0b-09be-4274-b6e1-285b8d4e9b65',3,'2025-03-29','16:00:00','17:30:00','scheduled',NULL);
/*!40000 ALTER TABLE `asa_booking_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asa_bookings`
--

DROP TABLE IF EXISTS `asa_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asa_bookings` (
  `id` varchar(36) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asa_bookings`
--

LOCK TABLES `asa_bookings` WRITE;
/*!40000 ALTER TABLE `asa_bookings` DISABLE KEYS */;
INSERT INTO `asa_bookings` VALUES ('03f1ae0b-09be-4274-b6e1-285b8d4e9b65',10,1,'2025-03-05 11:54:36','paid',0,1,'2025-04-01',1),('0b2a6f08-995e-403a-92f9-5f90f251b0bb',9,1,'2025-03-05 11:40:46','paid',0,1,'2025-04-01',1),('1b47adf1-c05a-40a5-b0c9-81dfb4394d3a',3,1,'2025-03-02 04:34:43','paid',0,1,'2025-04-01',1),('444b76fe-6523-427f-a2e5-e83d75430c6d',5,1,'2025-03-02 06:09:14','paid',0,1,'2025-04-01',1),('78ecbb73-0475-45e1-91a6-2167ba9f396e',1,1,'2025-03-01 21:20:41','paid',0,1,'2025-04-01',1),('d20ec4de-6c04-495c-b328-e695c35a93a8',3,2,'2025-03-01 22:02:35','paid',0,1,'2025-04-01',1),('f35dc986-882b-428b-aa03-4b4133b39762',5,1,'2025-03-02 06:08:56','paid',0,1,'2025-04-01',1),('f9d33bd2-f5f0-4e83-8bc0-26c8153d110c',4,1,'2025-03-02 04:43:30','paid',0,1,'2025-04-01',1);
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
INSERT INTO `asa_packages` VALUES (1,'Reguler',350000,'3x per minggu (Selasa, Kamis, Sabtu sore)',0,12,NULL),(2,'Reguler + Pagi',400000,'6x per minggu (Senin, Rabu, Jumat pagi & Selasa, Kamis, Sabtu sore)',1,12,NULL),(3,'Trial',90000,'1x Trial Session',0,1,NULL);
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
  `id` varchar(36) NOT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `location_id` int NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int NOT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `presence_status` varchar(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `location_id` (`location_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('03a4bd6d-1c6c-44bd-8725-103b33d8bfe3','1740866778_3',2,'2025-03-28','16:00:00','17:30:00',3,'pending','pending',NULL),('2c933c23-2ee2-40a3-baaf-e1f316c83bbb','1740894647_5',3,'2025-03-12','16:15:00','17:30:00',5,'pending','pending',NULL),('33320096-318c-41b8-89dc-73af4d381c11','1740894467_5',1,'2025-03-04','16:00:00','17:30:00',5,'pending','pending',NULL),('42f4cdc7-ffa3-4014-9e5e-c6cfe865f445','1740866778_3',2,'2025-03-07','16:00:00','17:30:00',3,'pending','pending',NULL),('468e2e7d-dc41-4dca-bc2d-4cbcadd28f6a','1740827312_1',1,'2025-03-29','16:00:00','17:30:00',1,'pending','pending',NULL),('5b569b3d-084c-4280-8667-1bc5e07e9e25','1740827312_1',1,'2025-03-11','16:00:00','17:30:00',1,'pending','pending',NULL),('710826d2-1c58-426d-a92f-650f62977207','1740894467_5',1,'2025-03-11','16:00:00','17:30:00',5,'pending','pending',NULL),('810a4ffd-37fd-4eb2-9b90-2aea0e0b41c7','1740827312_1',1,'2025-03-18','16:00:00','17:30:00',1,'pending','pending',NULL),('8dc07918-3433-49d4-afca-6cdb41276fd8','1740827312_1',1,'2025-03-04','16:00:00','17:30:00',1,'pending','pending',NULL),('972e0a5a-a69a-4cab-863b-52805a43e197','1740866778_3',2,'2025-03-21','16:00:00','17:30:00',3,'pending','pending',NULL),('b0252985-8416-46cc-979f-6fe72ae39a04','1740866778_3',2,'2025-03-14','16:00:00','17:30:00',3,'pending','pending',NULL),('b5805c27-7163-4417-ab88-70d7e014ae3e','1740894647_5',3,'2025-03-26','16:15:00','17:30:00',5,'pending','pending',NULL),('c841ac3a-c3a5-4f8c-96eb-344e114ffe24','1740894647_5',3,'2025-03-05','16:15:00','17:30:00',5,'pending','pending',NULL),('cb807c1a-7ba0-4ee0-8e74-cae477da78ba','1740894647_5',3,'2025-03-19','16:15:00','17:30:00',5,'pending','pending',NULL),('de615441-b6fd-4c6d-990c-1c4ef6e65f52','1740894467_5',1,'2025-03-18','16:00:00','17:30:00',5,'pending','pending',NULL),('e72fdfb3-c322-4a12-ba8f-12abd44f64cb','1740894467_5',1,'2025-03-25','16:00:00','17:30:00',5,'pending','pending',NULL);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coach` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `experience_years` int DEFAULT NULL,
  `bio` text,
  `certifications` text,
  `achievements` text,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
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
  `discount_amount` int NOT NULL,
  `valid_until` date DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (1,'GENERAL2024',15000,'2025-03-31',1,NULL),(2,'A4',20000,'2025-03-03',1,5);
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kcc_booking_sessions`
--

DROP TABLE IF EXISTS `kcc_booking_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kcc_booking_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` varchar(36) NOT NULL,
  `schedule_id` int NOT NULL,
  `session_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `kcc_booking_sessions_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `kcc_bookings` (`id`),
  CONSTRAINT `kcc_booking_sessions_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `kcc_schedules` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kcc_booking_sessions`
--

LOCK TABLES `kcc_booking_sessions` WRITE;
/*!40000 ALTER TABLE `kcc_booking_sessions` DISABLE KEYS */;
INSERT INTO `kcc_booking_sessions` VALUES (1,'6c374a69-83c3-4eab-a379-00dd8348c355',1,'2025-03-03','15:30:00','17:00:00','completed',''),(2,'6c374a69-83c3-4eab-a379-00dd8348c355',2,'2025-03-05','16:00:00','17:30:00','scheduled',NULL),(3,'6c374a69-83c3-4eab-a379-00dd8348c355',3,'2025-03-07','16:00:00','17:30:00','scheduled',NULL),(4,'6c374a69-83c3-4eab-a379-00dd8348c355',1,'2025-03-10','15:30:00','17:00:00','scheduled',NULL),(5,'6c374a69-83c3-4eab-a379-00dd8348c355',2,'2025-03-12','16:00:00','17:30:00','scheduled',NULL),(6,'6c374a69-83c3-4eab-a379-00dd8348c355',3,'2025-03-14','16:00:00','17:30:00','scheduled',NULL),(7,'6c374a69-83c3-4eab-a379-00dd8348c355',1,'2025-03-17','15:30:00','17:00:00','scheduled',NULL),(8,'6c374a69-83c3-4eab-a379-00dd8348c355',2,'2025-03-19','16:00:00','17:30:00','scheduled',NULL),(9,'6c374a69-83c3-4eab-a379-00dd8348c355',3,'2025-03-21','16:00:00','17:30:00','scheduled',NULL),(10,'6c374a69-83c3-4eab-a379-00dd8348c355',1,'2025-03-24','15:30:00','17:00:00','scheduled',NULL),(11,'6c374a69-83c3-4eab-a379-00dd8348c355',2,'2025-03-26','16:00:00','17:30:00','scheduled',NULL),(12,'6c374a69-83c3-4eab-a379-00dd8348c355',3,'2025-03-28','16:00:00','17:30:00','scheduled',NULL),(13,'6c374a69-83c3-4eab-a379-00dd8348c355',1,'2025-03-31','15:30:00','17:00:00','scheduled',NULL),(14,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',1,'2025-03-03','15:30:00','17:00:00','scheduled',NULL),(15,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',2,'2025-03-05','16:00:00','17:30:00','scheduled',NULL),(16,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',3,'2025-03-07','16:00:00','17:30:00','scheduled',NULL),(17,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',1,'2025-03-10','15:30:00','17:00:00','scheduled',NULL),(18,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',2,'2025-03-12','16:00:00','17:30:00','scheduled',NULL),(19,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',3,'2025-03-14','16:00:00','17:30:00','scheduled',NULL),(20,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',1,'2025-03-17','15:30:00','17:00:00','scheduled',NULL),(21,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',2,'2025-03-19','16:00:00','17:30:00','scheduled',NULL),(22,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',3,'2025-03-21','16:00:00','17:30:00','scheduled',NULL),(23,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',1,'2025-03-24','15:30:00','17:00:00','scheduled',NULL),(24,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',2,'2025-03-26','16:00:00','17:30:00','scheduled',NULL),(25,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',3,'2025-03-28','16:00:00','17:30:00','scheduled',NULL),(26,'d8a40c07-cc8b-487a-9b19-7e3ffa149bed',1,'2025-03-31','15:30:00','17:00:00','scheduled',NULL),(27,'988bc880-e903-4ec3-89d0-3402d0f8a801',1,'2025-03-03','15:30:00','17:00:00','scheduled',NULL),(28,'988bc880-e903-4ec3-89d0-3402d0f8a801',2,'2025-03-05','16:00:00','17:30:00','scheduled',NULL),(29,'988bc880-e903-4ec3-89d0-3402d0f8a801',3,'2025-03-07','16:00:00','17:30:00','scheduled',NULL),(30,'988bc880-e903-4ec3-89d0-3402d0f8a801',1,'2025-03-10','15:30:00','17:00:00','scheduled',NULL),(31,'988bc880-e903-4ec3-89d0-3402d0f8a801',2,'2025-03-12','16:00:00','17:30:00','scheduled',NULL),(32,'988bc880-e903-4ec3-89d0-3402d0f8a801',3,'2025-03-14','16:00:00','17:30:00','scheduled',NULL),(33,'988bc880-e903-4ec3-89d0-3402d0f8a801',1,'2025-03-17','15:30:00','17:00:00','scheduled',NULL),(34,'988bc880-e903-4ec3-89d0-3402d0f8a801',2,'2025-03-19','16:00:00','17:30:00','scheduled',NULL),(35,'988bc880-e903-4ec3-89d0-3402d0f8a801',3,'2025-03-21','16:00:00','17:30:00','scheduled',NULL),(36,'988bc880-e903-4ec3-89d0-3402d0f8a801',1,'2025-03-24','15:30:00','17:00:00','scheduled',NULL),(37,'988bc880-e903-4ec3-89d0-3402d0f8a801',2,'2025-03-26','16:00:00','17:30:00','scheduled',NULL),(38,'988bc880-e903-4ec3-89d0-3402d0f8a801',3,'2025-03-28','16:00:00','17:30:00','scheduled',NULL),(39,'988bc880-e903-4ec3-89d0-3402d0f8a801',1,'2025-03-31','15:30:00','17:00:00','scheduled',NULL),(40,'22f54025-b4b0-495b-8181-eed663b677b6',1,'2025-03-03','15:30:00','17:00:00','scheduled',NULL),(41,'22f54025-b4b0-495b-8181-eed663b677b6',2,'2025-03-05','16:00:00','17:30:00','scheduled',NULL),(42,'22f54025-b4b0-495b-8181-eed663b677b6',3,'2025-03-07','16:00:00','17:30:00','scheduled',NULL),(43,'22f54025-b4b0-495b-8181-eed663b677b6',1,'2025-03-10','15:30:00','17:00:00','scheduled',NULL),(44,'22f54025-b4b0-495b-8181-eed663b677b6',2,'2025-03-12','16:00:00','17:30:00','scheduled',NULL),(45,'22f54025-b4b0-495b-8181-eed663b677b6',3,'2025-03-14','16:00:00','17:30:00','scheduled',NULL),(46,'22f54025-b4b0-495b-8181-eed663b677b6',1,'2025-03-17','15:30:00','17:00:00','scheduled',NULL),(47,'22f54025-b4b0-495b-8181-eed663b677b6',2,'2025-03-19','16:00:00','17:30:00','scheduled',NULL),(48,'22f54025-b4b0-495b-8181-eed663b677b6',3,'2025-03-21','16:00:00','17:30:00','scheduled',NULL),(49,'22f54025-b4b0-495b-8181-eed663b677b6',1,'2025-03-24','15:30:00','17:00:00','scheduled',NULL),(50,'22f54025-b4b0-495b-8181-eed663b677b6',2,'2025-03-26','16:00:00','17:30:00','scheduled',NULL),(51,'22f54025-b4b0-495b-8181-eed663b677b6',3,'2025-03-28','16:00:00','17:30:00','scheduled',NULL),(52,'22f54025-b4b0-495b-8181-eed663b677b6',1,'2025-03-31','15:30:00','17:00:00','scheduled',NULL),(53,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',1,'2025-03-03','15:30:00','17:00:00','scheduled',NULL),(54,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',2,'2025-03-05','16:00:00','17:30:00','scheduled',NULL),(55,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',3,'2025-03-07','16:00:00','17:30:00','scheduled',NULL),(56,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',1,'2025-03-10','15:30:00','17:00:00','scheduled',NULL),(57,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',2,'2025-03-12','16:00:00','17:30:00','scheduled',NULL),(58,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',3,'2025-03-14','16:00:00','17:30:00','scheduled',NULL),(59,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',1,'2025-03-17','15:30:00','17:00:00','scheduled',NULL),(60,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',2,'2025-03-19','16:00:00','17:30:00','scheduled',NULL),(61,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',3,'2025-03-21','16:00:00','17:30:00','scheduled',NULL),(62,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',1,'2025-03-24','15:30:00','17:00:00','scheduled',NULL),(63,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',2,'2025-03-26','16:00:00','17:30:00','scheduled',NULL),(64,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',3,'2025-03-28','16:00:00','17:30:00','scheduled',NULL),(65,'f0d06026-e5c9-43a2-8504-f4928e6c97e7',1,'2025-03-31','15:30:00','17:00:00','scheduled',NULL);
/*!40000 ALTER TABLE `kcc_booking_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kcc_bookings`
--

DROP TABLE IF EXISTS `kcc_bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kcc_bookings` (
  `id` varchar(36) NOT NULL,
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
  CONSTRAINT `kcc_bookings_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `kcc_packages` (`id`),
  CONSTRAINT `kcc_bookings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kcc_bookings`
--

LOCK TABLES `kcc_bookings` WRITE;
/*!40000 ALTER TABLE `kcc_bookings` DISABLE KEYS */;
INSERT INTO `kcc_bookings` VALUES ('22f54025-b4b0-495b-8181-eed663b677b6',8,1,'2025-03-02 07:39:14','pending',0,1,'2025-04-01',1),('4008bde5-24ec-46b7-8bc5-3c7467e8a207',3,1,'2025-03-02 04:29:54','paid',0,1,'2025-04-01',1),('6c374a69-83c3-4eab-a379-00dd8348c355',4,1,'2025-03-02 04:49:03','paid',0,1,'2025-04-01',1),('94574e8a-9e1b-4f6c-b1fb-5c63c0036658',1,1,'2025-03-01 21:32:09','paid',0,1,'2025-04-01',1),('988bc880-e903-4ec3-89d0-3402d0f8a801',7,1,'2025-03-02 07:26:46','paid',0,1,'2025-04-01',1),('ac5a42ac-b7f6-49b1-942d-5bf005b2ecad',6,1,'2025-03-02 07:00:39','pending',0,NULL,NULL,1),('d8a40c07-cc8b-487a-9b19-7e3ffa149bed',5,1,'2025-03-02 06:46:07','paid',0,1,'2025-04-01',1),('f0d06026-e5c9-43a2-8504-f4928e6c97e7',9,1,'2025-03-05 11:52:20','paid',0,1,'2025-04-01',1);
/*!40000 ALTER TABLE `kcc_bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kcc_packages`
--

DROP TABLE IF EXISTS `kcc_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kcc_packages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_name` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `description` text,
  `sessions_per_month` int DEFAULT NULL,
  `is_trial` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kcc_packages`
--

LOCK TABLES `kcc_packages` WRITE;
/*!40000 ALTER TABLE `kcc_packages` DISABLE KEYS */;
INSERT INTO `kcc_packages` VALUES (1,'Reguler',450000,'3x per minggu (Senin, Rabu, Jumat)',12,0),(2,'Trial',90000,'1x Trial Session',1,1);
/*!40000 ALTER TABLE `kcc_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kcc_schedules`
--

DROP TABLE IF EXISTS `kcc_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kcc_schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `package_id` int NOT NULL,
  `day_name` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `quota` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `kcc_schedules_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `kcc_packages` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kcc_schedules`
--

LOCK TABLES `kcc_schedules` WRITE;
/*!40000 ALTER TABLE `kcc_schedules` DISABLE KEYS */;
INSERT INTO `kcc_schedules` VALUES (1,1,'SENIN','15:30:00','17:00:00',NULL),(2,1,'RABU','16:00:00','17:30:00',NULL),(3,1,'JUMAT','16:00:00','17:30:00',NULL),(4,2,'SENIN','15:30:00','17:00:00',NULL),(5,2,'RABU','16:00:00','17:30:00',NULL),(6,2,'JUMAT','16:00:00','17:30:00',NULL);
/*!40000 ALTER TABLE `kcc_schedules` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `pool`
--

DROP TABLE IF EXISTS `pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pool` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `description` text,
  `features` text,
  `main_image` varchar(255) DEFAULT NULL,
  `gallery_images` text,
  `opening_hours` text,
  `contact_info` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pool`
--

LOCK TABLES `pool` WRITE;
/*!40000 ALTER TABLE `pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `pool` ENABLE KEYS */;
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
  `full_name` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `parent_name` varchar(100) DEFAULT NULL,
  `address` text,
  `mobile_phone` varchar(20) DEFAULT NULL,
  `school` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_token_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `reset_token` (`reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'atlit1','atlit1@gmail.com','scrypt:32768:8:1$dUbvLM8D8mK5SwFm$e3e4425b6d473a8df84fdf4b33af938a324e6eb737334c2b308fa4058890d5dc6e3fadbc86369a7666fee06a0b33077922be3807ef65e4fa9ddb3ae9dadb05a1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'admin1','admin1@gmail.com','scrypt:32768:8:1$iULtubrBXBbNsokP$f5c9f1176400baba9ef4dade275c4be90fc618cd87a1437b90af49b01a51e26e39f6b72687aac9d4b0381f3e1b53aaad08cfeb38e86b91faa31d26a6fef08d9f',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'atlit2','atlit2@gmail.com','scrypt:32768:8:1$14PiN8viL5t0cIK5$e1591ab7ce2b8d04c66dc5ba84a36397d301788d82c1a35775b2253a734af7619f82115eb6075d16ca4002254ff105336da8cf3d783f24642f8afa4f0e24a501',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'atlit3','atlit3@gmail.com','scrypt:32768:8:1$OHTRbCw4WLE0EksU$b43abac871573d6fd027d7b6352825b222d13ebb3e0ea001823cb5b93af7cd3e30a132764d7c1a823ebb40ffc798c1fca7143b8470691a7b3515586c7aae8821',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'fatih_alay 4o','fatih@gmail.com','scrypt:32768:8:1$VztkeuCGbCpfi9ls$4a0a02a5d9123ce412208a696744899b4667c77d1a514f67c06c9832a45d3cc849ac38ea0e9db9b1bb8d977078fe52624c474bb271c203e2db392af542c6a526',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'atlit5','atlit5@gmail.com','scrypt:32768:8:1$yFe5E4jdjxU9vO1o$276799ef117eba508d267fe2730dbaf0a5f78ea1c3218a2c580889d92d5c252cf753e7fa7a51f641656a27980b5078411ca20918aeeee3d8f509170180fd64ad',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'atlit4','atlit4@gmail.com','scrypt:32768:8:1$QONdjP8CNNB9wsQr$1ca18f73944cf0892367114f304af2a832711a78188977de511e1d26ab291c709c8499bae7d2de0677e236faac73ca7022cadbe9217d8ba94d187591123383fe',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'atlitserang','srang@gmail.com','scrypt:32768:8:1$rG48sp9jdfwHRepR$569212cfaacbd57b84fb17cc3fa8e54866dbb7ca086fccf8d798f4ab3f2287942ec904f7bdbb799de25523bfe76dc83fe136df3975b3ad0fbfd6c8914e165c44',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'test','test@gmail.com','scrypt:32768:8:1$jCkSEzw4jpLIs490$d88aef21d42f0c3a60733edac39029c1f06a12fd86d0bdefd9a9d22d939074c49cc249270448924e8d59599a5d3ff5260bdda707e17a16e6992478a0c43efad1',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'test2','test2@gmail.com','scrypt:32768:8:1$Jhqtl94CMEpDk46b$d34035bd59a9464c86199d30e809008bb00711643ee46c15023590382a537c5e76b56462007c12c091560244611fd780368308e1292d07f16f899ca066820a94',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'waliy','waliyudin7@gmail.com','scrypt:32768:8:1$FcAMsDIKHgXDFGh8$2aa7d5f15a4511b5293572929b82fa68eb6a960ae860577551952d725d4b071a006feb5f2de7e7bf5ab0a142b39dca4fc3db444f2abc53096fcf09857110b0de',0,'Waliyuddin Sammadikun SSS','2025-02-28','asasas','Hj Manyur Street No 117','085217147753','asas','male','2025-03-05 13:21:27',NULL,NULL);
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

-- Dump completed on 2025-03-05 21:28:10
