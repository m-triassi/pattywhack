-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: pattydb
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `authorization`
--

DROP TABLE IF EXISTS `authorization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorization` (
  `authority_id` int(11) NOT NULL AUTO_INCREMENT,
  `authority_name` varchar(50) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`authority_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorization`
--

LOCK TABLES `authorization` WRITE;
/*!40000 ALTER TABLE `authorization` DISABLE KEYS */;
INSERT INTO `authorization` VALUES (1,'basic'),(3,'anonymous'),(4,'admin');
/*!40000 ALTER TABLE `authorization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_detail` (
  `order_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `item_price` double(11,2) NOT NULL,
  PRIMARY KEY (`order_table_id`),
  KEY `product_id` (`product_id`),
  KEY `order_id` (`order_id`,`product_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,4,8,1,3.91),(4,4,8,1,3.91),(5,4,7,1,2.87),(6,4,7,1,2.87),(7,4,7,1,2.87),(8,5,8,1,3.91),(9,5,7,1,2.87),(10,6,8,1,3.91),(11,6,8,1,3.91),(12,6,7,1,2.87),(13,6,8,1,3.91),(14,6,7,1,2.87),(15,6,8,1,3.91),(16,6,8,1,3.91),(17,6,8,1,3.91),(18,7,8,1,3.91),(19,7,8,1,3.91),(20,8,7,1,2.87),(21,8,8,1,3.91),(22,9,8,1,3.91),(23,9,8,1,3.91),(24,10,8,1,3.91),(25,10,8,1,3.91),(26,11,8,1,3.91),(27,11,8,1,3.91),(28,11,8,1,3.91),(29,12,8,1,3.91),(30,12,7,1,2.87),(31,12,7,1,2.87),(32,12,8,1,3.91),(33,13,7,1,2.87),(34,13,7,1,2.87),(35,13,8,1,3.91),(36,14,8,1,3.91),(37,14,8,1,3.91),(38,15,8,1,3.91),(39,15,7,1,2.87),(40,16,8,1,3.91),(41,16,7,1,2.87),(42,19,7,1,2.87),(43,19,7,1,2.87),(44,19,7,1,2.87),(45,20,8,1,3.91),(46,20,7,1,2.87),(47,21,7,1,2.87),(48,21,8,1,3.91),(49,22,8,1,3.91),(50,22,7,1,2.87),(51,23,7,1,2.87),(52,23,8,1,3.91),(53,24,7,1,2.87),(54,24,7,1,2.87),(55,24,7,1,2.87),(56,25,8,1,3.91),(57,25,8,1,3.91),(58,26,7,1,2.87),(59,26,7,1,2.87),(60,26,8,1,3.91),(61,27,7,1,2.87),(62,27,7,1,2.87),(63,27,8,1,3.91),(64,28,7,1,2.87),(65,28,7,1,2.87),(66,28,8,1,3.91),(67,29,8,1,3.91),(68,29,8,1,3.91),(69,30,8,1,3.91),(70,30,8,1,3.91),(71,31,8,1,3.91),(72,31,8,1,3.91),(73,32,7,1,2.87),(74,32,7,1,2.87),(75,32,8,1,3.91),(76,33,7,1,2.87),(77,33,8,1,3.91),(78,33,8,1,3.91),(79,34,7,1,2.87),(80,34,8,1,3.91),(81,35,8,1,3.91),(82,35,7,1,2.87),(83,36,8,1,3.91),(84,36,8,1,3.91),(85,37,7,1,2.87),(86,37,7,1,2.87),(87,37,7,1,2.87),(88,38,8,1,3.91),(89,38,7,1,2.87),(90,39,8,1,3.91),(91,39,7,1,2.87),(92,40,7,1,2.87),(93,40,7,1,2.87),(94,40,8,1,3.91),(95,41,7,1,2.87),(96,41,8,1,3.91),(97,42,8,1,3.91),(98,42,7,1,2.87),(99,43,8,1,3.91),(100,43,7,1,2.87),(101,44,8,1,3.91),(102,44,8,1,3.91),(103,45,7,1,2.87),(104,45,7,1,2.87),(105,45,7,1,2.87),(106,46,7,1,2.87),(107,46,7,1,2.87),(108,46,7,1,2.87),(109,47,7,1,2.87),(110,47,8,1,3.91),(111,49,8,1,3.91),(112,49,7,1,2.87),(113,49,8,1,3.91),(114,49,8,1,3.91),(115,50,7,1,2.87),(116,50,8,1,3.91),(117,50,8,1,3.91),(118,50,7,1,2.87),(119,51,7,1,2.87),(120,51,7,1,2.87),(121,51,7,1,2.87),(122,51,8,1,3.91),(123,52,7,1,2.87),(124,52,8,1,3.91),(125,52,7,1,2.87),(126,52,7,1,2.87),(127,53,8,1,3.91),(128,53,8,1,3.91),(129,53,7,1,2.87),(130,53,8,1,3.91),(131,54,7,1,2.87),(132,54,7,1,2.87),(133,54,8,1,3.91),(134,54,8,1,3.91),(135,55,7,1,2.87),(136,55,7,1,2.87),(137,55,7,1,2.87),(138,55,8,1,3.91),(139,56,7,1,2.87),(140,56,8,1,3.91),(141,56,7,1,2.87),(142,56,7,1,2.87),(143,57,7,1,2.87),(144,57,8,1,3.91),(145,57,8,1,3.91),(146,57,8,1,3.91),(147,58,7,1,2.87),(148,58,7,1,2.87),(149,58,7,1,2.87),(150,58,8,1,3.91),(151,59,8,1,3.91),(152,59,7,1,2.87),(153,59,7,1,2.87),(154,59,7,1,2.87),(155,60,8,1,3.91),(156,60,8,1,3.91),(157,60,7,1,2.87),(158,60,7,1,2.87),(159,61,8,1,3.91),(160,61,7,1,2.87),(161,61,7,1,2.87),(162,61,8,1,3.91),(163,62,8,1,3.91),(164,62,8,1,3.91),(165,62,7,1,2.87),(166,62,7,1,2.87),(167,63,8,1,3.91),(168,63,7,1,2.87),(169,63,8,1,3.91),(170,63,7,1,2.87),(171,64,7,1,2.87),(172,64,8,1,3.91),(173,64,8,1,3.91),(174,64,7,1,2.87),(175,65,7,1,2.87),(176,65,7,1,2.87),(177,65,8,1,3.91),(178,65,7,1,2.87),(179,66,7,1,2.87),(180,66,7,1,2.87),(181,66,7,1,2.87),(182,66,7,1,2.87),(183,66,7,1,2.87),(184,67,7,1,2.87),(185,67,7,1,2.87),(186,67,7,1,2.87),(187,67,8,1,3.91),(188,79,9,1,19.31),(189,79,8,1,3.91),(190,79,8,1,3.91),(191,79,8,1,3.91),(192,79,7,1,2.87),(193,79,7,1,2.87),(194,79,7,1,2.87),(195,79,8,1,3.91),(196,79,8,1,3.91),(197,80,11,1,54.32),(198,80,11,1,54.32),(199,80,7,1,2.87),(200,80,8,1,3.91),(201,80,7,1,2.87),(202,80,8,1,3.91),(203,81,11,1,54.32),(204,81,9,1,19.31),(205,81,11,1,54.32),(206,81,7,1,2.87),(207,81,7,1,2.87),(208,81,8,1,3.91),(209,81,8,1,3.91),(210,81,8,1,3.91),(211,81,7,1,2.87),(212,82,11,1,54.32),(213,82,7,1,2.87),(214,82,8,1,3.91),(215,82,9,1,19.31),(216,82,9,1,19.31),(217,82,8,1,3.91),(218,82,8,1,3.91),(219,82,7,1,2.87),(220,82,8,1,3.91),(221,82,7,1,2.87),(222,82,7,1,2.87),(223,82,7,1,2.87),(224,82,7,1,2.87),(225,82,8,1,3.91),(226,82,8,1,3.91),(227,82,8,1,3.91),(228,82,7,1,2.87),(229,82,7,1,2.87),(230,82,7,1,2.87),(231,82,7,1,2.87),(232,83,3,1,32.00),(233,83,7,1,2.87),(234,83,7,1,2.87),(235,83,11,1,54.32),(236,83,11,1,54.32),(237,83,8,1,3.91),(238,84,3,1,32.00),(239,84,8,1,3.91),(240,84,9,1,19.31),(241,84,3,1,32.00),(242,84,8,1,3.91),(243,84,8,1,3.91),(244,84,7,1,2.87),(245,85,7,1,2.87),(246,85,8,1,3.91),(247,85,7,1,2.87),(248,85,9,1,19.31),(249,85,7,1,2.87),(250,85,7,1,2.87),(251,85,8,1,3.91),(252,85,8,1,3.91);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` double(11,2) DEFAULT NULL,
  `budget` double(11,2) NOT NULL,
  `shipping_address` varchar(50) COLLATE latin1_bin NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `tracking_number` int(20) DEFAULT NULL,
  `price_per_item` double(11,2) DEFAULT NULL,
  `shipping_cost` double(11,2) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`),
  KEY `username` (`username`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'test2','2016-11-22 02:07:57',NULL,10.00,'1875 rue Saint-Louis',NULL,NULL,10.00,NULL,1),(3,'test2','2016-11-22 14:45:12',NULL,20.00,'1875 rue Saint-Louis',NULL,NULL,2.00,NULL,1),(4,'test2','2016-11-22 14:47:29',NULL,20.00,'1875 rue Saint-Louis',NULL,NULL,10.00,NULL,1),(5,'test2','2016-11-23 13:40:55',7.00,10.00,'12345678',NULL,NULL,10.00,3.00,1),(6,'test2','2016-11-23 14:31:46',29.00,30.00,'12345678',NULL,NULL,16.00,12.00,1),(7,'test2','2016-11-23 14:38:28',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(8,'test2','2016-11-23 14:43:07',7.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(9,'test2','2016-11-23 14:45:59',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(10,'test2','2016-11-23 15:03:56',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(11,'test2','2016-11-23 15:08:46',12.00,15.00,'12345678',NULL,NULL,8.00,5.00,1),(12,'test2','2016-11-23 15:11:26',14.00,15.00,'12345678',NULL,NULL,8.00,6.00,1),(13,'test2','2016-11-23 15:13:32',9.65,10.00,'12345678',NULL,NULL,4.00,4.02,1),(14,'test2','2016-11-23 15:14:44',7.82,10.00,'12345678',NULL,NULL,4.00,3.26,1),(15,'test2','2016-11-23 15:41:26',6.78,10.00,'12345678',NULL,NULL,10.00,2.83,1),(16,'test2','2016-11-23 15:44:53',6.78,10.00,'12345678',NULL,NULL,4.00,2.83,1),(17,'test2','2016-11-23 16:27:31',0.00,5.00,'12345678',NULL,NULL,3.00,0.00,1),(18,'test2','2016-11-23 16:27:49',0.00,7.00,'12345678',NULL,NULL,3.00,0.00,1),(19,'test2','2016-11-23 16:29:56',8.61,10.00,'12345678',NULL,NULL,10.00,0.72,1),(20,'test2','2016-11-23 16:36:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(21,'test2','2016-11-23 16:38:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(22,'test2','2016-11-23 16:40:43',6.78,10.00,'12345678',NULL,NULL,8.00,0.56,1),(23,'test2','2016-11-23 16:43:00',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(24,'test2','2016-11-23 16:50:47',8.61,10.00,'12345678',NULL,NULL,6.00,0.72,1),(25,'test2','2016-11-23 17:19:21',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(26,'test2','2016-11-23 17:22:32',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(27,'test2','2016-11-23 17:26:59',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(28,'test2','2016-11-23 17:28:15',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(29,'test2','2016-11-23 17:29:31',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(30,'test2','2016-11-23 17:30:45',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(31,'test2','2016-11-23 17:33:42',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(32,'test2','2016-11-23 17:35:42',9.65,12.00,'12345678',NULL,NULL,7.00,0.80,1),(33,'test2','2016-11-23 17:49:00',10.69,11.00,'12345678',NULL,NULL,6.00,0.89,1),(34,'test2','2016-11-23 17:53:22',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(35,'test2','2016-11-23 18:12:58',6.78,10.00,'12345678',NULL,NULL,9.00,0.56,1),(36,'test2','2016-11-23 18:19:26',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(37,'test2','2016-11-23 18:24:00',8.61,10.00,'12345678',NULL,NULL,6.00,0.72,1),(38,'test2','2016-11-23 18:32:03',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(39,'test2','2016-11-23 18:34:21',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(40,'test2','2016-11-23 18:37:11',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(41,'test2','2016-11-23 18:38:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(42,'test2','2016-11-23 18:40:23',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(43,'test2','2016-11-23 18:42:41',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(44,'test2','2016-11-23 18:45:20',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,8),(45,'test2','2016-11-23 18:46:22',8.61,11.00,'12345678',NULL,NULL,6.00,0.72,8),(46,'test2','2016-11-23 18:49:02',8.61,12.00,'12345678',NULL,NULL,7.00,0.72,8),(47,'test2','2016-11-23 18:49:55',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,8),(48,'test2','2016-11-23 19:33:17',NULL,15.00,'12345678',NULL,NULL,6.00,NULL,1),(49,'test2','2016-11-23 19:35:11',14.60,15.00,'12345678',NULL,NULL,6.00,1.22,1),(50,'test2','2016-11-23 19:35:25',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(51,'test2','2016-11-23 19:35:57',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(52,'test2','2016-11-23 19:35:59',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(53,'test2','2016-11-23 19:36:01',14.60,15.00,'12345678',NULL,NULL,8.00,1.22,1),(54,'test2','2016-11-23 19:36:02',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(55,'test2','2016-11-23 19:36:03',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(56,'test2','2016-11-23 19:36:05',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(57,'test2','2016-11-23 19:36:06',14.60,15.00,'12345678',NULL,NULL,8.00,1.22,1),(58,'test2','2016-11-23 19:36:08',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(59,'test2','2016-11-23 19:40:20',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(60,'test2','2016-11-23 19:40:25',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(61,'test2','2016-11-23 19:40:27',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(62,'test2','2016-11-23 19:40:28',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(63,'test2','2016-11-23 19:40:30',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(64,'test2','2016-11-23 19:40:32',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(65,'test2','2016-11-23 19:40:33',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(66,'test2','2016-11-23 19:40:35',14.35,15.00,'12345678',NULL,NULL,8.00,1.20,9),(67,'test2','2016-11-23 19:44:37',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,3),(68,'test2','2016-11-23 19:54:05',NULL,1.00,'12345678',NULL,NULL,1.00,NULL,1),(69,'test2','2016-11-23 19:54:50',NULL,1.00,'12345678',NULL,NULL,1.00,NULL,1),(70,'test2','2016-11-23 19:55:03',NULL,10.00,'12345678',NULL,NULL,1.00,NULL,1),(71,'test2','2016-11-23 19:55:36',NULL,10.00,'12345678',NULL,NULL,6.00,NULL,1),(72,'test2','2016-11-23 19:58:11',NULL,10.00,'12345678',NULL,NULL,6.00,NULL,1),(73,'test2','2016-11-23 19:58:24',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(74,'test2','2016-11-23 20:03:23',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(75,'test2','2016-11-23 20:04:14',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(76,'test2','2016-11-23 20:04:29',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(77,'test2','2016-11-23 20:04:38',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(78,'test2','2016-11-23 20:04:52',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(79,'test2','2016-11-23 20:09:54',47.47,50.00,'12345678',NULL,NULL,26.00,3.96,9),(80,'asda@asd.ca','2016-11-23 20:48:47',122.20,123.00,'123',NULL,NULL,62.00,10.18,9),(81,'asdaa@asd.ca','2016-11-23 20:51:39',148.29,150.00,'123456',NULL,NULL,76.00,12.36,3),(82,'asd@asd.ca','2016-11-23 20:56:16',149.01,150.00,'342',NULL,NULL,76.00,12.42,9),(83,'anim@hot.com','2016-11-23 21:38:15',150.29,153.00,'123asd',NULL,NULL,77.00,12.52,9),(84,'test2','2016-11-24 19:36:47',97.91,100.00,'12345678',NULL,NULL,51.00,8.16,9),(85,'asd@hotmail.com','2016-11-24 19:41:33',42.52,45.00,'123as',NULL,NULL,23.00,3.54,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference`
--

DROP TABLE IF EXISTS `preference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference` (
  `preference_id` int(11) NOT NULL AUTO_INCREMENT,
  `preference_category` varchar(50) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`preference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference`
--

LOCK TABLES `preference` WRITE;
/*!40000 ALTER TABLE `preference` DISABLE KEYS */;
INSERT INTO `preference` VALUES (1,'Appliances'),(2,'Automotive'),(3,'Baby'),(4,'Electronics'),(5,'Furniture'),(6,'Beauty'),(7,'Home'),(8,'Jewellery'),(9,'Office'),(10,'Fitness'),(11,'Books'),(12,'Software'),(13,'Video Games'),(14,'Clothing'),(15,'Sports'),(17,'Cameras'),(18,'Cell Phones'),(19,'Collectibles'),(20,'Movies'),(21,'Instruments'),(22,'Toys'),(23,'Random');
/*!40000 ALTER TABLE `preference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preference_detail`
--

DROP TABLE IF EXISTS `preference_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preference_detail` (
  `pref_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE latin1_bin NOT NULL DEFAULT '',
  `preference_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pref_table_id`),
  KEY `preference_id` (`preference_id`),
  KEY `username` (`username`,`preference_id`),
  CONSTRAINT `preference_detail_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `preference_detail_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `preference` (`preference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference_detail`
--

LOCK TABLES `preference_detail` WRITE;
/*!40000 ALTER TABLE `preference_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `preference_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(50) COLLATE latin1_bin NOT NULL,
  `url` varchar(4000) COLLATE latin1_bin NOT NULL,
  `unit_price` double(11,2) NOT NULL,
  `product_size` varchar(30) COLLATE latin1_bin DEFAULT NULL,
  `item_shipping_cost` double(11,2) NOT NULL,
  `availability` int(11) NOT NULL DEFAULT '4',
  `category_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `provider_id` (`provider_id`),
  KEY `category_id` (`category_id`),
  KEY `availability` (`availability`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`availability`) REFERENCES `status` (`status_id`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `preference` (`preference_id`),
  CONSTRAINT `product_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'The Legend of Zelda: Art &amp; Artifacts','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F1506703356%2Fref%3Ds9_zwish_hd_bw_b3qQa_g14_i1%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_r%3DJGVTC5Z1GKNYAEX8EV6S%26pf_rd_t%3D101%26pf_rd_p%3D3fd3ec9d-e1cb-5f5f-86ac-9d461300eccc%26pf_rd_i%3D916520',32.00,NULL,3.00,4,11,1),(4,'ASUS F555LA 15.6\" Full-HD Laptop (Core i3, 4GB RAM','https%3A%2F%2Fwww.amazon.ca%2FF555LA-Full-HD-Laptop-500GB-Windows%2Fdp%2FB011KFQASE%2Fref%3Dlp_667823011_1_7%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479766307%26sr%3D1-7',499.99,NULL,50.00,4,4,1),(6,'Free 32G Micro Card AUTO-VOX D1 Full HD 1080P 2.7\'','https%3A%2F%2Fwww.amazon.ca%2FAUTO-VOX-Recorder-Dashboard-G-Sensor-Recording%2Fdp%2FB01AT4BF28%2Fref%3Dsr_1_1%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767701%26sr%3D1-1',148.79,NULL,12.40,4,4,1),(7,'Everydaysource White/Silver Universal In-Ear Stere','https%3A%2F%2Fwww.amazon.ca%2FEverydaysource-Silver-Universal-Stereo-Headset%2Fdp%2FB007ZYUZE0%2Fref%3Dsr_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767791%26sr%3D1-8',2.87,NULL,0.24,4,4,1),(8,'Sodial Sodial- Pink Earbud Headphone Earphone For ','https%3A%2F%2Fwww.amazon.ca%2FSodial-Sodial-Headphone-Earphone-Iphone%25C2%25AE%2Fdp%2FB009LZVIOC%2Fref%3Dsr_1_14%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767802%26sr%3D1-14',3.91,NULL,0.33,4,4,1),(9,'TI 81 Texas Instruments Scientific Graphing Calcul','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fti-81-texas-instruments-scientific-graphing-calculator-152365955.htm',19.31,NULL,1.61,4,23,3),(10,'Fujifilm Instax Mini 8 Instant Camera (Beach Blue)','https%3A%2F%2Fwww.amazon.ca%2FFujifilm-Instax-Mini-Instant-Blue%2Fdp%2FB00AWKJPOA%2Fref%3Dlp_667823011_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479927991%26sr%3D1-8',83.99,NULL,7.00,4,4,1),(11,'REVOLUTION: Uprisings that Shaped the Twentieth Ce','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F0233005005%2Fref%3Ds9_acsd_aas_bw_c_x_2_w%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-2%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_t%3D101%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_i%3D927728',54.32,NULL,4.53,4,11,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_name` varchar(30) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES (1,'Amazon'),(2,'EBAY'),(3,'EBid'),(4,'RandomProvider');
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `question` varchar(4000) COLLATE latin1_bin NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `status_id` (`status_id`),
  KEY `status_id_2` (`status_id`),
  KEY `status_id_3` (`status_id`),
  KEY `username` (`username`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(4000) COLLATE latin1_bin NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`request_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'https://www.amazon.ca/Asus-Transformer-T100HA-DH11T-CA-10-1-Inch-Laptop/dp/B0186SN2PC/ref=sr_1_1?s=pc&ie=UTF8&qid=1479486615&sr=1-1&keywords=convertible',2),(2,'https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F1506703356%2Fref%3Ds9_zwish_hd_bw_b3qQa_g14_i1%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_r%3DJGVTC5Z1GKNYAEX8EV6S%26pf_rd_t%3D101%26pf_rd_p%3D3fd3ec9d-e1cb-5f5f-86ac-9d461300eccc%26pf_rd_i%3D916520',6),(3,'https%3A%2F%2Fwww.amazon.ca%2FPlaytex-Diaper-Genie-Disposal-System%2Fdp%2FB00LCR1KZO%2Fref%3Dgbph_img_m-6_7b56_e18c27a8%3Fsmid%3DA3DWYIK6Y9EEQB%26pf_rd_p%3Def10e933-94dc-4f20-bbee-3a13e9607b56%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_t%3D101%26pf_rd_i%3D3561346011%26pf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_r%3D4YRVC6FCDDMKF52F1B5Z',7),(4,'http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fti-81-texas-instruments-scientific-graphing-calculator-152365955.htm',6),(5,'https%3A%2F%2Fwww.amazon.ca%2FFujifilm-Instax-Mini-Instant-Blue%2Fdp%2FB00AWKJPOA%2Fref%3Dlp_667823011_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479927991%26sr%3D1-8',6),(6,'https%3A%2F%2Fwww.amazon.ca%2FBosch-DDB181-02-Lithium-Ion-Batteries-Contractor%2Fdp%2FB00N8I29X2%2Fref%3Dgbps_img_s-3_2706_ae6be905%3Fsmid%3DA3DWYIK6Y9EEQB%26pf_rd_p%3D0f6e7b78-5442-4617-aef8-459755692706%26pf_rd_s%3Dslot-3%26pf_rd_t%3D701%26pf_rd_i%3Dgb_main%26pf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_r%3DX5MXMSAZBBTWZS7DRYBT',7),(7,'https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F0233005005%2Fref%3Ds9_acsd_aas_bw_c_x_2_w%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-2%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_t%3D101%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_i%3D927728',6);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `response`
--

DROP TABLE IF EXISTS `response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `response` (
  `response_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `answer` varchar(4000) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`response_id`),
  KEY `username` (`username`),
  KEY `question_id` (`question_id`),
  KEY `username_2` (`username`),
  CONSTRAINT `response_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `response_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `response`
--

LOCK TABLES `response` WRITE;
/*!40000 ALTER TABLE `response` DISABLE KEYS */;
/*!40000 ALTER TABLE `response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(30) COLLATE latin1_bin NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_name_uq` (`status_name`),
  UNIQUE KEY `status_name` (`status_name`),
  UNIQUE KEY `status_name_2` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (6,'ADDED'),(4,'AVAILABLE'),(3,'CANCELED'),(2,'COMPLETE'),(7,'DENIED'),(9,'PAYED'),(1,'PENDING'),(8,'SHIPPED'),(5,'UNAVAILABLE');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `password_hash` varchar(255) COLLATE latin1_bin NOT NULL,
  `address` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `postal_code` varchar(16) COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(70) COLLATE latin1_bin NOT NULL,
  `authority_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`),
  KEY `authority_id` (`authority_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authorization` (`authority_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Sa123154a','$2y$10$j8Bc1.kfmAINtenRRQOCseCc0lYSdyS63TPe/S99/zu9sdjQ8v7J.','123asdsa','321465','daniel.edery3@hotmail.com',1),('anim@hot.com','','123asd','as1d23','anim@hot.com',3),('asd@asd.ca','','342','1231','asd@asd.ca',1),('asd@hotmail.com','','123as','as3d2','asd@hotmail.com',3),('asda@asd.ca','','123','123','asda@asd.ca',1),('asdaa@asd.ca','','123456','123456','asdaa@asd.ca',1),('hyp','$2y$10$1Fyqh2Fu3fK/BySKE/R7JOFmdecx//pJsRmXlLhL8rYc6R2cget4.','1875','h4m1n5','daniel.edery@hotmail.com',1),('hyp1','$2y$10$U3LCJV2iXd/Yhe80.AXGC..HBwUpsH4FdByaUo9L5ToCMHigiVvNC','','','daniel.edery@hotmail.com',1),('test1','$2y$10$//2aPfg9en2FUKZUd3Pjwei91ipKxRSh6MzHYT/d4ad3DKpxDenWq','testint','12345','daniel.edery@hotmail.com',1),('test2','$2y$10$ZQ8EUMujd9dGMNpNiQX/oeEspt6VmbcmjAfiDTMY.7RdG8QJdbI8e','12345678','54321','daniel.edery@hotmail.com',4),('test3','$2y$10$IEi78UTROioUrJan/INPROYQyz2JxEzPMgoLev9q.PR7SI0hMmA7m','asd123','asd132','test@ca.ca',1),('test34','$2y$10$x1SWQOg47x8sJe1jVU47YOImo5N1fFv5l5zhWfn8ru4MCsJVJ21wC','asd123','asd132','test4@ca.ca',1);
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

-- Dump completed on 2016-11-24 14:47:43
