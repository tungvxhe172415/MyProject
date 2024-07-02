-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: example_db
-- ------------------------------------------------------
-- Server version	8.0.37
DROP DATABASE IF EXISTS example_db;
CREATE DATABASE example_db;
USE example_db;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `category_type` smallint DEFAULT NULL,
  `category_status` smallint DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_category_category_id` (`category_id`),
  KEY `ix_category_created_date` (`created_date`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `id` varchar(50) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `capital` varchar(300) DEFAULT NULL,
  `longitude` varchar(300) DEFAULT NULL,
  `latitude` varchar(300) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `country_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` varchar(50) NOT NULL,
  `name` varchar(300) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(2) DEFAULT NULL,
  `area_code` varchar(20) DEFAULT NULL,
  `longitude` varchar(300) DEFAULT NULL,
  `latitude` varchar(300) DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customize`
--

DROP TABLE IF EXISTS `customize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customize` (
  `id` varchar(50) NOT NULL,
  `logo` varchar(1000) DEFAULT NULL,
  `favicon` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customize_color`
--

DROP TABLE IF EXISTS `customize_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customize_color` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `hex_code` varchar(100) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `customize_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_customize_color_customize_id` (`customize_id`),
  CONSTRAINT `customize_color_ibfk_1` FOREIGN KEY (`customize_id`) REFERENCES `customize` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `deal_status` smallint DEFAULT NULL,
  `start_date` int unsigned DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `interval_second_use` int DEFAULT NULL,
  `available_all_days` tinyint(1) DEFAULT NULL,
  `deal_type_id` varchar(50) DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_deal_created_date` (`created_date`),
  KEY `ix_deal_deal_type_id` (`deal_type_id`),
  KEY `ix_deal_start_date` (`start_date`),
  KEY `ix_deal_store_id` (`store_id`),
  CONSTRAINT `deal_ibfk_1` FOREIGN KEY (`deal_type_id`) REFERENCES `deal_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `deal_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deal_type`
--

DROP TABLE IF EXISTS `deal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deal_type` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `id` varchar(50) NOT NULL,
  `email_address` varchar(50) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `push_token` varchar(250) DEFAULT NULL,
  `subscribed` varchar(45) DEFAULT NULL,
  `last_activate` varchar(45) DEFAULT NULL,
  `first_session` varchar(45) DEFAULT NULL,
  `device_name` varchar(45) DEFAULT NULL,
  `sessions` varchar(45) DEFAULT NULL,
  `app_version` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `sdk_version` varchar(45) DEFAULT NULL,
  `lat` varchar(45) DEFAULT NULL,
  `long` varchar(45) DEFAULT NULL,
  `usage_duration` varchar(45) DEFAULT NULL,
  `language_code` varchar(45) DEFAULT NULL,
  `external_user_id` varchar(45) DEFAULT NULL,
  `segments` varchar(45) DEFAULT NULL,
  `tags` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `email_template`
--

DROP TABLE IF EXISTS `email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_template` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `body` text,
  `description` varchar(5000) DEFAULT NULL,
  `template_code` varchar(300) DEFAULT NULL,
  `object` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `ix_group_created_date` (`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_role_user`
--

DROP TABLE IF EXISTS `group_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_role_user` (
  `id` varchar(50) NOT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  `group_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_group_role_user_group_id` (`group_id`),
  KEY `ix_group_role_user_role_id` (`role_id`),
  KEY `ix_group_role_user_user_id` (`user_id`),
  CONSTRAINT `group_role_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_role_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_role_user_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` varchar(50) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `price` decimal(20,4) DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_menu_created_date` (`created_date`),
  KEY `ix_menu_store_id` (`store_id`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` varchar(50) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `show` tinyint(1) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `code_lang` varchar(50) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`code_lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `monitor`
--

DROP TABLE IF EXISTS `monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitor` (
  `id` varchar(50) NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `is_payment` smallint DEFAULT NULL,
  `monitor_type` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `owner_confirm_form`
--

DROP TABLE IF EXISTS `owner_confirm_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner_confirm_form` (
  `id` varchar(50) NOT NULL,
  `company_name` varchar(300) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `website` varchar(300) DEFAULT NULL,
  `phone_number` varchar(100) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `deal1` text,
  `deal2` text,
  `deal3` text,
  `deal4` text,
  `confirm_url` varchar(300) DEFAULT NULL,
  `token` varchar(300) DEFAULT NULL,
  `terms_version` varchar(10) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `confirmed_time` int unsigned DEFAULT NULL,
  `deal5` varchar(5000) DEFAULT NULL,
  `owner_id` varchar(50) DEFAULT NULL,
  `additional_infor` varchar(5000) DEFAULT NULL,
  `store_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_owner_confirm_form_created_date` (`created_date`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `owner_confirm_form_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_history` (
  `id` varchar(50) NOT NULL,
  `payment_type` int DEFAULT NULL,
  `payment_history_description` varchar(5000) DEFAULT NULL,
  `payment_value` varchar(300) DEFAULT NULL,
  `payment_total` varchar(300) DEFAULT NULL,
  `payment_info_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_payment_history_payment_info_id` (`payment_info_id`),
  CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`payment_info_id`) REFERENCES `payment_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_info` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `payment_type` int DEFAULT NULL,
  `payment_status` int DEFAULT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `time_trial` int DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `subscription_id` varchar(100) DEFAULT NULL,
  `current_period_end` int unsigned DEFAULT NULL,
  `current_period_start` int unsigned DEFAULT NULL,
  `is_valid_payment` tinyint(1) DEFAULT NULL,
  `payment_customer_id` varchar(255) DEFAULT NULL,
  `payment_method_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_payment_info_created_date` (`created_date`),
  KEY `ix_payment_info_user_id` (`user_id`),
  CONSTRAINT `payment_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `permission_type` smallint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `resource` varchar(500) NOT NULL,
  `permission_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_resource_permission_id` (`permission_id`),
  CONSTRAINT `resource_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` varchar(50) NOT NULL,
  `key` varchar(100) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `is_show` tinyint(1) DEFAULT NULL,
  `role_type` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permission_monitor`
--

DROP TABLE IF EXISTS `role_permission_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permission_monitor` (
  `id` varchar(50) NOT NULL,
  `role_id` varchar(50) DEFAULT NULL,
  `permission_id` varchar(50) DEFAULT NULL,
  `monitor_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_role_permission_monitor_monitor_id` (`monitor_id`),
  KEY `ix_role_permission_monitor_permission_id` (`permission_id`),
  KEY `ix_role_permission_monitor_role_id` (`role_id`),
  CONSTRAINT `role_permission_monitor_ibfk_1` FOREIGN KEY (`monitor_id`) REFERENCES `monitor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_monitor_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permission_monitor_ibfk_3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler_notification`
--

DROP TABLE IF EXISTS `scheduler_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduler_notification` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `body` text,
  `image` varchar(300) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `pushed_date` int DEFAULT NULL,
  `created_date` int DEFAULT NULL,
  `modified_date` int DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `store_article_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `store_article_id` (`store_article_id`),
  KEY `store_id` (`store_id`),
  CONSTRAINT `scheduler_notification_ibfk_1` FOREIGN KEY (`store_article_id`) REFERENCES `store_article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scheduler_notification_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `id` varchar(50) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `language` varchar(250) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_setting_user_id` (`user_id`),
  CONSTRAINT `setting_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `website` varchar(500) DEFAULT NULL,
  `street` varchar(300) DEFAULT NULL,
  `postcode` varchar(300) DEFAULT NULL,
  `address` text,
  `avatar_url` varchar(10000) DEFAULT NULL,
  `store_status` smallint DEFAULT NULL,
  `longitude` varchar(300) DEFAULT NULL,
  `latitude` varchar(300) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `rate_avg` decimal(3,2) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `ix_store_created_date` (`created_date`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_article`
--

DROP TABLE IF EXISTS `store_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_article` (
  `id` varchar(50) NOT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `image_url` varchar(300) DEFAULT NULL,
  `short_description` varchar(5000) DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `publish_date` int unsigned DEFAULT NULL,
  `pinned` tinyint(1) DEFAULT NULL,
  `push_notify` tinyint(1) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `created_user_id` varchar(50) DEFAULT NULL,
  `publish_now` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_store_article_created_user_id` (`created_user_id`),
  KEY `ix_store_article_store_id` (`store_id`),
  CONSTRAINT `store_article_ibfk_1` FOREIGN KEY (`created_user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `store_article_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_category`
--

DROP TABLE IF EXISTS `store_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_category` (
  `id` varchar(50) NOT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `category_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_store_category_category_id` (`category_id`),
  KEY `ix_store_category_store_id` (`store_id`),
  CONSTRAINT `store_category_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_category_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store_user`
--

DROP TABLE IF EXISTS `store_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_user` (
  `id` varchar(50) NOT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `link_type` smallint DEFAULT NULL,
  `favourite` tinyint(1) DEFAULT NULL,
  `favourite_date` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_store_user_store_id` (`store_id`),
  KEY `ix_store_user_user_id` (`user_id`),
  CONSTRAINT `store_user_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `store_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stripe_payment_transaction`
--

DROP TABLE IF EXISTS `stripe_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stripe_payment_transaction` (
  `id` varchar(50) NOT NULL,
  `stripe_session_id` varchar(50) DEFAULT NULL,
  `payment_status` varchar(50) DEFAULT NULL,
  `stripe_price_id` varchar(50) DEFAULT NULL,
  `stripe_subscription_id` varchar(100) DEFAULT NULL,
  `stripe_customer_id` varchar(100) DEFAULT NULL,
  `stripe_invoice_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `time_box`
--

DROP TABLE IF EXISTS `time_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_box` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `weekday` smallint DEFAULT NULL,
  `time_box_type` smallint DEFAULT NULL,
  `time_box_status` smallint DEFAULT NULL,
  `timestamp_begin` int unsigned DEFAULT NULL,
  `timestamp_end` int unsigned DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `time_box_id` varchar(50) DEFAULT NULL,
  `number_of_quotas` int DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `deal_id` varchar(50) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_time_box_created_date` (`created_date`),
  KEY `ix_time_box_deal_id` (`deal_id`),
  KEY `ix_time_box_store_id` (`store_id`),
  KEY `ix_time_box_time_box_id` (`time_box_id`),
  CONSTRAINT `time_box_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `time_box_ibfk_2` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `time_box_ibfk_3` FOREIGN KEY (`time_box_id`) REFERENCES `time_box` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL,
  `email` varchar(300) DEFAULT NULL,
  `country_code` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `password_hash` varchar(300) DEFAULT NULL,
  `gender` smallint DEFAULT NULL,
  `full_name` varchar(300) DEFAULT NULL,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `street` varchar(300) DEFAULT NULL,
  `city` varchar(300) DEFAULT NULL,
  `postcode` varchar(300) DEFAULT NULL,
  `address` text,
  `avatar_url` varchar(1000) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `login_failed_attempts` smallint DEFAULT NULL,
  `force_change_password` tinyint(1) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `user_type` smallint DEFAULT NULL,
  `user_index` bigint unsigned DEFAULT NULL,
  `code_extension` varchar(100) DEFAULT NULL,
  `register_status` smallint DEFAULT NULL,
  `membership_level` smallint DEFAULT NULL,
  `payment_info_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_created_date` (`created_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_deal`
--

DROP TABLE IF EXISTS `user_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_deal` (
  `id` varchar(50) NOT NULL,
  `content` text,
  `user_deal_status` int unsigned DEFAULT NULL,
  `use_date` int unsigned DEFAULT NULL,
  `interval_second_use` int DEFAULT NULL,
  `time_box_id` varchar(50) DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `modified_date` int unsigned DEFAULT NULL,
  `deal_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_deal_created_date` (`created_date`),
  KEY `ix_user_deal_deal_id` (`deal_id`),
  KEY `ix_user_deal_time_box_id` (`time_box_id`),
  KEY `ix_user_deal_use_date` (`use_date`),
  KEY `ix_user_deal_user_id` (`user_id`),
  CONSTRAINT `user_deal_ibfk_1` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_deal_ibfk_2` FOREIGN KEY (`time_box_id`) REFERENCES `time_box` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_deal_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_deal_history`
--

DROP TABLE IF EXISTS `user_deal_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_deal_history` (
  `id` varchar(50) NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) DEFAULT NULL,
  `rate` smallint DEFAULT NULL,
  `content` text,
  `comment` text,
  `use_date` int unsigned DEFAULT NULL,
  `created_date` int unsigned DEFAULT NULL,
  `store_id` varchar(50) DEFAULT NULL,
  `user_deal_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_deal_history_created_date` (`created_date`),
  KEY `ix_user_deal_history_store_id` (`store_id`),
  KEY `ix_user_deal_history_use_date` (`use_date`),
  KEY `ix_user_deal_history_user_deal_id` (`user_deal_id`),
  KEY `ix_user_deal_history_user_id` (`user_id`),
  CONSTRAINT `user_deal_history_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `store` (`id`),
  CONSTRAINT `user_deal_history_ibfk_2` FOREIGN KEY (`user_deal_id`) REFERENCES `user_deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_deal_history_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_devices`
--

DROP TABLE IF EXISTS `user_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_devices` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `device_id` varchar(50) NOT NULL,
  `device_enable` int DEFAULT NULL,
  `created_date` int DEFAULT NULL,
  `modified_date` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ix_user_devices_device_id` (`device_id`),
  KEY `ix_user_devices_user_id` (`user_id`),
  CONSTRAINT `user_devices_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_devices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_notification`
--

DROP TABLE IF EXISTS `user_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_notification` (
  `id` varchar(50) NOT NULL,
  `created_date` int NOT NULL,
  `sender_id` varchar(50) NOT NULL,
  `receiver_id` varchar(50) NOT NULL,
  `is_read` int NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `body` text,
  `image` varchar(500) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `body_json` text,
  `is_new` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `ix_user_notification_receiver_id` (`receiver_id`),
  KEY `user_notification_user_fk_idx` (`sender_id`,`receiver_id`),
  CONSTRAINT `user_notification_ibfk_1` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_notification_ibfk_2` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_report`
--

DROP TABLE IF EXISTS `user_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_report` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `saving_amount` decimal(20,5) DEFAULT NULL,
  `payment_amount` decimal(20,5) DEFAULT NULL,
  `total_redeemed` int DEFAULT NULL,
  `total_favourite` int DEFAULT NULL,
  `total_access` int DEFAULT NULL,
  `created_date` int DEFAULT NULL,
  `modified_date` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_settings`
--

DROP TABLE IF EXISTS `user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_settings` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `setting` text,
  `notify_new_store` tinyint(1) DEFAULT NULL,
  `notify_new_deal` tinyint(1) DEFAULT NULL,
  `notify_news` tinyint(1) DEFAULT NULL,
  `created_date` int DEFAULT NULL,
  `modified_date` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_user_settings_user_id` (`user_id`),
  CONSTRAINT `user_settings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-02  9:20:08
