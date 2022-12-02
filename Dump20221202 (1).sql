-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: keliones
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

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
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `season` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Ispanija','Pavasario',NULL,NULL),(2,'Gruzija','Rudens',NULL,NULL);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `durationofjourny` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hotels_countries_id_foreign` (`countries_id`),
  CONSTRAINT `hotels_countries_id_foreign` FOREIGN KEY (`countries_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Best Western',500.00,'','5 val.',1,NULL,NULL),(2,'Marion',600.00,'','10 val.',2,NULL,NULL),(6,'testingInn',300.00,'images/hotel1.jpg','5 val.',1,'2022-11-22 19:25:57','2022-11-22 19:25:57'),(7,'HolidayInn',900.00,'images/hotel2.jpg','9 val.',2,'2022-11-22 19:29:25','2022-11-22 19:29:25');
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels_user`
--

DROP TABLE IF EXISTS `hotels_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotels_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hotels_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotels_user_hotels_id_foreign` (`hotels_id`),
  KEY `hotels_user_user_id_foreign` (`user_id`),
  CONSTRAINT `hotels_user_hotels_id_foreign` FOREIGN KEY (`hotels_id`) REFERENCES `hotels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hotels_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels_user`
--

LOCK TABLES `hotels_user` WRITE;
/*!40000 ALTER TABLE `hotels_user` DISABLE KEYS */;
INSERT INTO `hotels_user` VALUES (3,'2022-11-22 13:52:37','2022-11-22 14:27:24',1,3,1),(4,'2022-11-22 14:48:59','2022-11-22 15:02:18',2,3,1),(5,'2022-11-22 20:00:59','2022-11-22 20:00:59',6,3,0),(7,'2022-11-23 15:44:48','2022-11-23 16:41:55',7,1,1),(9,'2022-11-23 15:49:51','2022-11-23 16:43:02',1,1,1),(10,'2022-11-23 19:58:31','2022-11-23 19:58:31',7,6,0),(11,'2022-11-23 20:21:15','2022-11-23 20:21:15',1,6,0);
/*!40000 ALTER TABLE `hotels_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (58,'2014_10_12_000000_create_users_table',1),(59,'2014_10_12_100000_create_password_resets_table',1),(60,'2019_08_19_000000_create_failed_jobs_table',1),(61,'2019_12_14_000001_create_personal_access_tokens_table',1),(62,'2022_11_17_131853_create_countries_table',1),(63,'2022_11_17_132007_create_hotels_table',1),(71,'2022_11_17_132051_create_orders_table',2),(72,'2022_11_17_143441_add_roles_field_to_user_table',2),(73,'2022_11_22_152337_add_confirmed_field_to__hotels_users_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',3,'appToken','c01b0a4c79f3d4b8de0a2888667f742dca84b2e7b0b822a504fe6e659ca1d1a6','[\"user-abilities\"]',NULL,NULL,'2022-11-23 13:34:54','2022-11-23 13:34:54'),(2,'App\\Models\\User',3,'appToken','ca1ebe5e75994f4e9549eeebbaa87bad541bdd77c7e605044fe8c64772682a43','[\"user-abilities\"]',NULL,NULL,'2022-11-23 13:35:18','2022-11-23 13:35:18'),(3,'App\\Models\\User',1,'appToken','81d44708af4a262becb9d8cce5c7c36ba1f7ba22359bcb120081e7fdbd4effc9','[\"user-abilities\"]',NULL,NULL,'2022-11-23 13:35:35','2022-11-23 13:35:35'),(4,'App\\Models\\User',3,'appToken','46bc49c419039b6904d53dbf0ce88fe44cac782e87cf187f3f9ace26b95ae808','[\"user-abilities\"]',NULL,NULL,'2022-11-23 15:52:55','2022-11-23 15:52:55'),(5,'App\\Models\\User',2,'appToken','ee65c912619a8e6d017fcf9462e71d1913317bea411fd55c34a1781e8f66708c','[\"user-abilities\"]',NULL,NULL,'2022-11-23 15:53:51','2022-11-23 15:53:51'),(6,'App\\Models\\User',1,'appToken','4dc1ac4e81cc8b8a198df39286aca8e6a5a1457db7c92e9cfa47d007114ff3f9','[\"user-abilities\"]','2022-11-23 15:57:54',NULL,'2022-11-23 15:57:46','2022-11-23 15:57:54'),(7,'App\\Models\\User',2,'appToken','ef491d06963ff20b0c311beaee600642ddd815511fb50ed08cda4929bdb7605c','[\"user-abilities\"]','2022-11-23 19:00:44',NULL,'2022-11-23 16:41:45','2022-11-23 19:00:44'),(8,'App\\Models\\User',2,'appToken','a41e75aadc96f1a6fb785b75729abda96b0574b62d3d09eb3534241a8eadcf16','[\"user-abilities\"]','2022-11-23 19:05:08',NULL,'2022-11-23 19:00:48','2022-11-23 19:05:08'),(9,'App\\Models\\User',6,'appToken','8934877fe1156b6515c1992b3431c29c4b458fd8ff5d66810304f8568bf5e8d9','[\"user-abilities\"]','2022-11-23 19:46:23',NULL,'2022-11-23 19:07:18','2022-11-23 19:46:23'),(14,'App\\Models\\User',3,'appToken','6cce0b9a2fd0a255613a3e90f100c7e07f4a1be931a7ff2b0f57455415dd6290','[\"user-abilities\"]',NULL,NULL,'2022-11-23 20:09:04','2022-11-23 20:09:04'),(15,'App\\Models\\User',2,'appToken','4c6f61a66ed6e5074a8a9911e644f508aa28fb0b0312a0ddb7fa20bd5bb155bd','[\"admin-abilities\"]',NULL,NULL,'2022-11-23 20:09:38','2022-11-23 20:09:38'),(16,'App\\Models\\User',6,'appToken','8e7aa4b56d07af4252259801ed40d2bc5fb53bbdf7f326ec7d6852462e0ba7a3','[\"user-abilities\"]',NULL,NULL,'2022-11-23 20:12:13','2022-11-23 20:12:13'),(17,'App\\Models\\User',6,'appToken','19ec1431dfd16e527b503ef33bb431fefc5afae503ac3ee62bfc3838834cd44b','[\"user-abilities\"]','2022-11-23 20:21:15',NULL,'2022-11-23 20:12:34','2022-11-23 20:21:15');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aaa','aaa@gmail.com',NULL,'bbb',NULL,NULL,NULL,'user'),(2,'test','test@gmail.com',NULL,'test',NULL,NULL,NULL,'admin'),(3,'joebiden','joebiden@gmail.com',NULL,'darkbrandon',NULL,NULL,NULL,'user'),(6,'Tom','user@gmail.com',NULL,'$2y$10$HXiuchw3gUzD4Cf4Qo52nOTHjkmUir8BM246stSa/g.iVPWDmilja',NULL,'2022-11-23 19:06:44','2022-11-23 19:06:44','user');
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

-- Dump completed on 2022-12-02 22:14:37
