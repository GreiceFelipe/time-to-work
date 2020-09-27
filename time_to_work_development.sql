-- MySQL dump 10.13  Distrib 5.7.29, for osx10.14 (x86_64)
--
-- Host: localhost    Database: time_to_work_development
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-09-26 21:22:34.016198','2020-09-26 21:22:34.016198');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20200925145741'),('20200925213158');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'text@exemple.com','$2a$12$aj4CFlXelYH5oIV8FyYFmOMy6OTHhYEiaoSP3u6sWR.SoAv/Usna2',NULL,NULL,NULL,'2020-09-26 21:22:44.829760','2020-09-26 21:22:44.829760');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_histories`
--

DROP TABLE IF EXISTS `work_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_histories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `starts_at` datetime NOT NULL,
  `ends_at` datetime DEFAULT NULL,
  `lunch_starts` datetime DEFAULT NULL,
  `lunch_ends` datetime DEFAULT NULL,
  `worked_hours` float DEFAULT NULL,
  `user_id` bigint NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_histories_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_65c0fc12b6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_histories`
--

LOCK TABLES `work_histories` WRITE;
/*!40000 ALTER TABLE `work_histories` DISABLE KEYS */;
INSERT INTO `work_histories` VALUES (1,'2020-09-16 21:22:44','2020-09-17 06:22:44','2020-09-17 01:22:44','2020-09-17 02:22:44',8,1,'2020-09-26 21:22:44.916416','2020-09-26 21:22:44.916416'),(2,'2020-09-17 21:22:44','2020-09-18 06:22:44','2020-09-18 01:22:44','2020-09-18 02:22:44',8,1,'2020-09-26 21:22:44.950080','2020-09-26 21:22:44.950080'),(3,'2020-09-18 21:22:44','2020-09-19 06:22:44','2020-09-19 01:22:44','2020-09-19 02:22:44',8,1,'2020-09-26 21:22:44.960996','2020-09-26 21:22:44.960996'),(4,'2020-09-19 21:22:44','2020-09-20 06:22:44','2020-09-20 01:22:44','2020-09-20 02:22:44',8,1,'2020-09-26 21:22:44.970952','2020-09-26 21:22:44.970952'),(5,'2020-09-20 21:22:44','2020-09-21 06:22:44','2020-09-21 01:22:44','2020-09-21 02:22:44',8,1,'2020-09-26 21:22:44.983614','2020-09-26 21:22:44.983614'),(6,'2020-09-21 21:22:44','2020-09-22 06:22:44','2020-09-22 01:22:44','2020-09-22 02:22:44',8,1,'2020-09-26 21:22:44.993666','2020-09-26 21:22:44.993666'),(7,'2020-09-22 21:22:44','2020-09-23 06:22:44','2020-09-23 01:22:44','2020-09-23 02:22:44',8,1,'2020-09-26 21:22:45.004317','2020-09-26 21:22:45.004317'),(8,'2020-09-23 21:22:45','2020-09-24 06:22:45','2020-09-24 01:22:45','2020-09-24 02:22:45',8,1,'2020-09-26 21:22:45.014682','2020-09-26 21:22:45.014682'),(9,'2020-09-24 21:22:45','2020-09-25 06:22:45','2020-09-25 01:22:45','2020-09-25 02:22:45',8,1,'2020-09-26 21:22:45.023741','2020-09-26 21:22:45.023741'),(10,'2020-09-25 21:22:45','2020-09-26 06:22:45','2020-09-26 01:22:45','2020-09-26 02:22:45',8,1,'2020-09-26 21:22:45.035499','2020-09-26 21:22:45.035499'),(11,'2020-09-26 21:22:45','2020-09-27 06:22:45','2020-09-27 01:22:45','2020-09-27 02:22:45',8,1,'2020-09-26 21:22:45.043524','2020-09-26 21:22:45.043524');
/*!40000 ALTER TABLE `work_histories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-26 21:34:58
