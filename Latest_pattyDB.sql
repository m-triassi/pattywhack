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
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (3,4,8,1,3.91),(4,4,8,1,3.91),(5,4,7,1,2.87),(6,4,7,1,2.87),(7,4,7,1,2.87),(8,5,8,1,3.91),(9,5,7,1,2.87),(10,6,8,1,3.91),(11,6,8,1,3.91),(12,6,7,1,2.87),(13,6,8,1,3.91),(14,6,7,1,2.87),(15,6,8,1,3.91),(16,6,8,1,3.91),(17,6,8,1,3.91),(18,7,8,1,3.91),(19,7,8,1,3.91),(20,8,7,1,2.87),(21,8,8,1,3.91),(22,9,8,1,3.91),(23,9,8,1,3.91),(24,10,8,1,3.91),(25,10,8,1,3.91),(26,11,8,1,3.91),(27,11,8,1,3.91),(28,11,8,1,3.91),(29,12,8,1,3.91),(30,12,7,1,2.87),(31,12,7,1,2.87),(32,12,8,1,3.91),(33,13,7,1,2.87),(34,13,7,1,2.87),(35,13,8,1,3.91),(36,14,8,1,3.91),(37,14,8,1,3.91),(38,15,8,1,3.91),(39,15,7,1,2.87),(40,16,8,1,3.91),(41,16,7,1,2.87),(42,19,7,1,2.87),(43,19,7,1,2.87),(44,19,7,1,2.87),(45,20,8,1,3.91),(46,20,7,1,2.87),(47,21,7,1,2.87),(48,21,8,1,3.91),(49,22,8,1,3.91),(50,22,7,1,2.87),(51,23,7,1,2.87),(52,23,8,1,3.91),(53,24,7,1,2.87),(54,24,7,1,2.87),(55,24,7,1,2.87),(56,25,8,1,3.91),(57,25,8,1,3.91),(58,26,7,1,2.87),(59,26,7,1,2.87),(60,26,8,1,3.91),(61,27,7,1,2.87),(62,27,7,1,2.87),(63,27,8,1,3.91),(64,28,7,1,2.87),(65,28,7,1,2.87),(66,28,8,1,3.91),(67,29,8,1,3.91),(68,29,8,1,3.91),(69,30,8,1,3.91),(70,30,8,1,3.91),(71,31,8,1,3.91),(72,31,8,1,3.91),(73,32,7,1,2.87),(74,32,7,1,2.87),(75,32,8,1,3.91),(76,33,7,1,2.87),(77,33,8,1,3.91),(78,33,8,1,3.91),(79,34,7,1,2.87),(80,34,8,1,3.91),(81,35,8,1,3.91),(82,35,7,1,2.87),(83,36,8,1,3.91),(84,36,8,1,3.91),(85,37,7,1,2.87),(86,37,7,1,2.87),(87,37,7,1,2.87),(88,38,8,1,3.91),(89,38,7,1,2.87),(90,39,8,1,3.91),(91,39,7,1,2.87),(92,40,7,1,2.87),(93,40,7,1,2.87),(94,40,8,1,3.91),(95,41,7,1,2.87),(96,41,8,1,3.91),(97,42,8,1,3.91),(98,42,7,1,2.87),(99,43,8,1,3.91),(100,43,7,1,2.87),(101,44,8,1,3.91),(102,44,8,1,3.91),(103,45,7,1,2.87),(104,45,7,1,2.87),(105,45,7,1,2.87),(106,46,7,1,2.87),(107,46,7,1,2.87),(108,46,7,1,2.87),(109,47,7,1,2.87),(110,47,8,1,3.91),(111,49,8,1,3.91),(112,49,7,1,2.87),(113,49,8,1,3.91),(114,49,8,1,3.91),(115,50,7,1,2.87),(116,50,8,1,3.91),(117,50,8,1,3.91),(118,50,7,1,2.87),(119,51,7,1,2.87),(120,51,7,1,2.87),(121,51,7,1,2.87),(122,51,8,1,3.91),(123,52,7,1,2.87),(124,52,8,1,3.91),(125,52,7,1,2.87),(126,52,7,1,2.87),(127,53,8,1,3.91),(128,53,8,1,3.91),(129,53,7,1,2.87),(130,53,8,1,3.91),(131,54,7,1,2.87),(132,54,7,1,2.87),(133,54,8,1,3.91),(134,54,8,1,3.91),(135,55,7,1,2.87),(136,55,7,1,2.87),(137,55,7,1,2.87),(138,55,8,1,3.91),(139,56,7,1,2.87),(140,56,8,1,3.91),(141,56,7,1,2.87),(142,56,7,1,2.87),(143,57,7,1,2.87),(144,57,8,1,3.91),(145,57,8,1,3.91),(146,57,8,1,3.91),(147,58,7,1,2.87),(148,58,7,1,2.87),(149,58,7,1,2.87),(150,58,8,1,3.91),(151,59,8,1,3.91),(152,59,7,1,2.87),(153,59,7,1,2.87),(154,59,7,1,2.87),(155,60,8,1,3.91),(156,60,8,1,3.91),(157,60,7,1,2.87),(158,60,7,1,2.87),(159,61,8,1,3.91),(160,61,7,1,2.87),(161,61,7,1,2.87),(162,61,8,1,3.91),(163,62,8,1,3.91),(164,62,8,1,3.91),(165,62,7,1,2.87),(166,62,7,1,2.87),(167,63,8,1,3.91),(168,63,7,1,2.87),(169,63,8,1,3.91),(170,63,7,1,2.87),(171,64,7,1,2.87),(172,64,8,1,3.91),(173,64,8,1,3.91),(174,64,7,1,2.87),(175,65,7,1,2.87),(176,65,7,1,2.87),(177,65,8,1,3.91),(178,65,7,1,2.87),(179,66,7,1,2.87),(180,66,7,1,2.87),(181,66,7,1,2.87),(182,66,7,1,2.87),(183,66,7,1,2.87),(184,67,7,1,2.87),(185,67,7,1,2.87),(186,67,7,1,2.87),(187,67,8,1,3.91),(188,79,9,1,19.31),(189,79,8,1,3.91),(190,79,8,1,3.91),(191,79,8,1,3.91),(192,79,7,1,2.87),(193,79,7,1,2.87),(194,79,7,1,2.87),(195,79,8,1,3.91),(196,79,8,1,3.91),(197,80,11,1,54.32),(198,80,11,1,54.32),(199,80,7,1,2.87),(200,80,8,1,3.91),(201,80,7,1,2.87),(202,80,8,1,3.91),(203,81,11,1,54.32),(204,81,9,1,19.31),(205,81,11,1,54.32),(206,81,7,1,2.87),(207,81,7,1,2.87),(208,81,8,1,3.91),(209,81,8,1,3.91),(210,81,8,1,3.91),(211,81,7,1,2.87),(212,82,11,1,54.32),(213,82,7,1,2.87),(214,82,8,1,3.91),(215,82,9,1,19.31),(216,82,9,1,19.31),(217,82,8,1,3.91),(218,82,8,1,3.91),(219,82,7,1,2.87),(220,82,8,1,3.91),(221,82,7,1,2.87),(222,82,7,1,2.87),(223,82,7,1,2.87),(224,82,7,1,2.87),(225,82,8,1,3.91),(226,82,8,1,3.91),(227,82,8,1,3.91),(228,82,7,1,2.87),(229,82,7,1,2.87),(230,82,7,1,2.87),(231,82,7,1,2.87),(232,83,3,1,32.00),(233,83,7,1,2.87),(234,83,7,1,2.87),(235,83,11,1,54.32),(236,83,11,1,54.32),(237,83,8,1,3.91),(238,84,3,1,32.00),(239,84,8,1,3.91),(240,84,9,1,19.31),(241,84,3,1,32.00),(242,84,8,1,3.91),(243,84,8,1,3.91),(244,84,7,1,2.87),(245,85,7,1,2.87),(246,85,8,1,3.91),(247,85,7,1,2.87),(248,85,9,1,19.31),(249,85,7,1,2.87),(250,85,7,1,2.87),(251,85,8,1,3.91),(252,85,8,1,3.91),(253,86,9,1,19.31),(254,86,3,1,32.00),(255,86,7,1,2.87),(256,86,3,1,32.00),(257,86,7,1,2.87),(258,86,7,1,2.87),(259,86,7,1,2.87),(260,86,7,1,2.87),(261,94,8,1,3.91),(262,94,8,1,3.91),(263,94,8,1,3.91),(264,94,8,1,3.91),(265,94,8,1,3.91),(266,94,8,1,3.91),(267,94,8,1,3.91),(268,94,8,1,3.91),(269,94,8,1,3.91),(270,94,8,1,3.91),(271,94,8,1,3.91),(272,94,8,1,3.91),(273,95,8,1,3.91),(274,95,8,1,3.91),(275,95,8,1,3.91),(276,95,8,1,3.91),(277,95,8,1,3.91);
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
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,'test2','2016-11-22 02:07:57',NULL,10.00,'1875 rue Saint-Louis',NULL,NULL,10.00,NULL,1),(3,'test2','2016-11-22 14:45:12',NULL,20.00,'1875 rue Saint-Louis',NULL,NULL,2.00,NULL,1),(4,'test2','2016-11-22 14:47:29',NULL,20.00,'1875 rue Saint-Louis',NULL,NULL,10.00,NULL,1),(5,'test2','2016-11-23 13:40:55',7.00,10.00,'12345678',NULL,NULL,10.00,3.00,1),(6,'test2','2016-11-23 14:31:46',29.00,30.00,'12345678',NULL,NULL,16.00,12.00,1),(7,'test2','2016-11-23 14:38:28',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(8,'test2','2016-11-23 14:43:07',7.00,10.00,'12345678',NULL,NULL,6.00,3.00,3),(9,'test2','2016-11-23 14:45:59',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(10,'test2','2016-11-23 15:03:56',8.00,10.00,'12345678',NULL,NULL,6.00,3.00,1),(11,'test2','2016-11-23 15:08:46',12.00,15.00,'12345678',NULL,NULL,8.00,5.00,1),(12,'test2','2016-11-23 15:11:26',14.00,15.00,'12345678',NULL,NULL,8.00,6.00,1),(13,'test2','2016-11-23 15:13:32',9.65,10.00,'12345678',NULL,NULL,4.00,4.02,1),(14,'test2','2016-11-23 15:14:44',7.82,10.00,'12345678',NULL,NULL,4.00,3.26,1),(15,'test2','2016-11-23 15:41:26',6.78,10.00,'12345678',NULL,NULL,10.00,2.83,1),(16,'test2','2016-11-23 15:44:53',6.78,10.00,'12345678',NULL,NULL,4.00,2.83,1),(17,'test2','2016-11-23 16:27:31',0.00,5.00,'12345678',NULL,NULL,3.00,0.00,1),(18,'test2','2016-11-23 16:27:49',0.00,7.00,'12345678',NULL,NULL,3.00,0.00,1),(19,'test2','2016-11-23 16:29:56',8.61,10.00,'12345678',NULL,NULL,10.00,0.72,1),(20,'test2','2016-11-23 16:36:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(21,'test2','2016-11-23 16:38:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(22,'test2','2016-11-23 16:40:43',6.78,10.00,'12345678',NULL,NULL,8.00,0.56,1),(23,'test2','2016-11-23 16:43:00',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(24,'test2','2016-11-23 16:50:47',8.61,10.00,'12345678',NULL,NULL,6.00,0.72,1),(25,'test2','2016-11-23 17:19:21',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(26,'test2','2016-11-23 17:22:32',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(27,'test2','2016-11-23 17:26:59',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(28,'test2','2016-11-23 17:28:15',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(29,'test2','2016-11-23 17:29:31',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(30,'test2','2016-11-23 17:30:45',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(31,'test2','2016-11-23 17:33:42',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(32,'test2','2016-11-23 17:35:42',9.65,12.00,'12345678',NULL,NULL,7.00,0.80,1),(33,'test2','2016-11-23 17:49:00',10.69,11.00,'12345678',NULL,NULL,6.00,0.89,1),(34,'test2','2016-11-23 17:53:22',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(35,'test2','2016-11-23 18:12:58',6.78,10.00,'12345678',NULL,NULL,9.00,0.56,1),(36,'test2','2016-11-23 18:19:26',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,1),(37,'test2','2016-11-23 18:24:00',8.61,10.00,'12345678',NULL,NULL,6.00,0.72,1),(38,'test2','2016-11-23 18:32:03',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(39,'test2','2016-11-23 18:34:21',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(40,'test2','2016-11-23 18:37:11',9.65,10.00,'12345678',NULL,NULL,6.00,0.80,1),(41,'test2','2016-11-23 18:38:25',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(42,'test2','2016-11-23 18:40:23',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(43,'test2','2016-11-23 18:42:41',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,1),(44,'test2','2016-11-23 18:45:20',7.82,10.00,'12345678',NULL,NULL,6.00,0.65,8),(45,'test2','2016-11-23 18:46:22',8.61,11.00,'12345678',NULL,NULL,6.00,0.72,8),(46,'test2','2016-11-23 18:49:02',8.61,12.00,'12345678',NULL,NULL,7.00,0.72,8),(47,'test2','2016-11-23 18:49:55',6.78,10.00,'12345678',NULL,NULL,6.00,0.56,8),(48,'test2','2016-11-23 19:33:17',NULL,15.00,'12345678',NULL,NULL,6.00,NULL,1),(49,'test2','2016-11-23 19:35:11',14.60,15.00,'12345678',NULL,NULL,6.00,1.22,1),(50,'test2','2016-11-23 19:35:25',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(51,'test2','2016-11-23 19:35:57',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(52,'test2','2016-11-23 19:35:59',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(53,'test2','2016-11-23 19:36:01',14.60,15.00,'12345678',NULL,NULL,8.00,1.22,1),(54,'test2','2016-11-23 19:36:02',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(55,'test2','2016-11-23 19:36:03',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(56,'test2','2016-11-23 19:36:05',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(57,'test2','2016-11-23 19:36:06',14.60,15.00,'12345678',NULL,NULL,8.00,1.22,1),(58,'test2','2016-11-23 19:36:08',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(59,'test2','2016-11-23 19:40:20',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(60,'test2','2016-11-23 19:40:25',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(61,'test2','2016-11-23 19:40:27',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(62,'test2','2016-11-23 19:40:28',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(63,'test2','2016-11-23 19:40:30',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(64,'test2','2016-11-23 19:40:32',13.56,15.00,'12345678',NULL,NULL,8.00,1.13,1),(65,'test2','2016-11-23 19:40:33',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,1),(66,'test2','2016-11-23 19:40:35',14.35,15.00,'12345678',NULL,NULL,8.00,1.20,9),(67,'test2','2016-11-23 19:44:37',12.52,15.00,'12345678',NULL,NULL,8.00,1.04,3),(68,'test2','2016-11-23 19:54:05',NULL,1.00,'12345678',NULL,NULL,1.00,NULL,1),(69,'test2','2016-11-23 19:54:50',NULL,1.00,'12345678',NULL,NULL,1.00,NULL,1),(70,'test2','2016-11-23 19:55:03',NULL,10.00,'12345678',NULL,NULL,1.00,NULL,1),(71,'test2','2016-11-23 19:55:36',NULL,10.00,'12345678',NULL,NULL,6.00,NULL,1),(72,'test2','2016-11-23 19:58:11',NULL,10.00,'12345678',NULL,NULL,6.00,NULL,1),(73,'test2','2016-11-23 19:58:24',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(74,'test2','2016-11-23 20:03:23',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(75,'test2','2016-11-23 20:04:14',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(76,'test2','2016-11-23 20:04:29',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(77,'test2','2016-11-23 20:04:38',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(78,'test2','2016-11-23 20:04:52',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(79,'test2','2016-11-23 20:09:54',47.47,50.00,'12345678',NULL,NULL,26.00,3.96,9),(80,'asda@asd.ca','2016-11-23 20:48:47',122.20,123.00,'123',NULL,NULL,62.00,10.18,9),(81,'asdaa@asd.ca','2016-11-23 20:51:39',148.29,150.00,'123456',NULL,NULL,76.00,12.36,3),(82,'asd@asd.ca','2016-11-23 20:56:16',149.01,150.00,'342',NULL,NULL,76.00,12.42,9),(83,'anim@hot.com','2016-11-23 21:38:15',150.29,153.00,'123asd',NULL,NULL,77.00,12.52,9),(84,'test2','2016-11-24 19:36:47',97.91,100.00,'12345678',NULL,NULL,51.00,8.16,9),(85,'asd@hotmail.com','2016-11-24 19:41:33',42.52,45.00,'123as',NULL,NULL,23.00,3.54,1),(86,'anim@hot.com','2016-11-24 19:52:04',97.66,100.00,'123',NULL,NULL,51.00,8.14,1),(87,'test2','2016-11-24 22:09:33',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(88,'test2','2016-11-24 22:16:40',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(89,'test2','2016-11-24 22:18:33',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(90,'test2','2016-11-24 22:19:46',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(91,'test2','2016-11-24 22:20:15',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(92,'test2','2016-11-24 22:29:08',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(93,'test2','2016-11-24 22:29:19',NULL,50.00,'12345678',NULL,NULL,26.00,NULL,1),(94,'test2','2016-11-24 22:30:35',46.92,50.00,'12345678',NULL,NULL,26.00,3.91,9),(95,'test2','2016-11-24 22:32:39',19.55,20.00,'12345678',NULL,NULL,11.00,1.63,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference_detail`
--

LOCK TABLES `preference_detail` WRITE;
/*!40000 ALTER TABLE `preference_detail` DISABLE KEYS */;
INSERT INTO `preference_detail` VALUES (1,'test2',5);
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
  `product_name` varchar(255) COLLATE latin1_bin NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'DP to HDMI, Rankie Gold Plated DisplayPort to HDTV HDMI Cable 6ft (Black) - R1102','https%3A%2F%2Fwww.amazon.ca%2FRankie-Plated-DisplayPort-Cable-Black%2Fdp%2FB00Z05JMKO%2Fref%3Dsr_1_2%3Fs%3Dhi%26ie%3DUTF8%26qid%3D1480024957%26sr%3D1-2',11.04,NULL,1.10,5,11,1),(4,'ASUS F555LA 15.6\" Full-HD Laptop (Core i3, 4GB RAM','https%3A%2F%2Fwww.amazon.ca%2FF555LA-Full-HD-Laptop-500GB-Windows%2Fdp%2FB011KFQASE%2Fref%3Dlp_667823011_1_7%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479766307%26sr%3D1-7',499.99,NULL,50.00,4,4,1),(6,'Free 32G Micro Card AUTO-VOX D1 Full HD 1080P 2.7\'','https%3A%2F%2Fwww.amazon.ca%2FAUTO-VOX-Recorder-Dashboard-G-Sensor-Recording%2Fdp%2FB01AT4BF28%2Fref%3Dsr_1_1%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767701%26sr%3D1-1',148.79,NULL,12.40,4,4,1),(7,'Everydaysource White/Silver Universal In-Ear Stere','https%3A%2F%2Fwww.amazon.ca%2FEverydaysource-Silver-Universal-Stereo-Headset%2Fdp%2FB007ZYUZE0%2Fref%3Dsr_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767791%26sr%3D1-8',2.87,NULL,0.24,5,4,1),(8,'Sodial Sodial- Pink Earbud Headphone Earphone For ','https%3A%2F%2Fwww.amazon.ca%2FSodial-Sodial-Headphone-Earphone-Iphone%25C2%25AE%2Fdp%2FB009LZVIOC%2Fref%3Dsr_1_14%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767802%26sr%3D1-14',3.91,NULL,0.33,4,4,1),(9,'TI 81 Texas Instruments Scientific Graphing Calcul','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fti-81-texas-instruments-scientific-graphing-calculator-152365955.htm',19.31,NULL,1.61,5,5,3),(10,'Fujifilm Instax Mini 8 Instant Camera (Beach Blue)','https%3A%2F%2Fwww.amazon.ca%2FFujifilm-Instax-Mini-Instant-Blue%2Fdp%2FB00AWKJPOA%2Fref%3Dlp_667823011_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479927991%26sr%3D1-8',83.99,NULL,7.00,4,4,1),(11,'REVOLUTION: Uprisings that Shaped the Twentieth Ce','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F0233005005%2Fref%3Ds9_acsd_aas_bw_c_x_2_w%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-2%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_t%3D101%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_i%3D927728',54.32,NULL,4.53,4,11,1),(12,'ENFAMIL INFANT BABY FORMULA Milk-Based Powder w/Iron PACKETS Box(1-12-months)','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fenfamil-infant-baby-formula-milk-based-powder-w-iron-packets-box-1-12-months-147920894.htm',3.23,NULL,0.27,4,3,3),(13,'Dr Who talk whimey to me bib','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdr-who-talk-whimey-to-me-bib-152584880.htm',16.75,NULL,1.40,4,3,3),(14,'Hunter Boots Girls&#039; Original Young Rain Boot','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FHunter-Boots-Girls-Original-Young-Rain-Boot-%2F152304720556%3Fvar%3D451507905435%26_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',91.79,NULL,7.65,4,14,2),(15,'Brand New Cobra Portable Power JumPack 6000mAh 2.4 Amp USB Port CPP8000','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBrand-New-Cobra-Portable-Power-JumPack-6000mAh-2-4-Amp-USB-Port-CPP8000-%2F272454408312%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',95.99,NULL,8.00,4,2,2),(16,'KitchenAid K45SSOB Classic Series 4.5-Quart 10-Speed Onyx Black Stand Mixer','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FKitchenAid-K45SSOB-Classic-Series-4-5-Quart-10-Speed-Onyx-Black-Stand-Mixer-%2F111929609316%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',274.80,NULL,22.90,4,7,2),(17,'Apple 13.3&#034; MacBook Notebook Computer MC516LL/A 2GB RAM','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FApple-13-3-MacBook-Notebook-Computer-MC516LL-A-2GB-RAM-%2F272435671794%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',419.99,NULL,35.00,4,23,2),(18,'ASUS ROG GL702VM-DB74 Gaming Laptop Intel Core i7 6700HQ (2.6 GHz) 16 GB Memory','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FASUS-ROG-GL702VM-DB74-Gaming-Laptop-Intel-Core-i7-6700HQ-2-6-GHz-16-GB-Memory-%2F201678270145%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',815.99,NULL,68.00,4,23,2),(19,'Nest T3007EF Learning Thermostat, 3rd Generation','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNest-T3007EF-Learning-Thermostat-3rd-Generation-%2F121917949330%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',310.80,NULL,25.90,4,7,2),(20,'CALVIN KLEIN Euphoria For Women 100ml Eau De Parfum Spray BRAND NEW IN BOX','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FCALVIN-KLEIN-Euphoria-For-Women-100ml-Eau-De-Parfum-Spray-BRAND-NEW-IN-BOX-%2F252605653607%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',65.99,NULL,5.50,4,6,2),(21,'CALVIN KLEIN Euphoria For Women 100ml Eau De Parfum Spray BRAND NEW IN BOX','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FCALVIN-KLEIN-Euphoria-For-Women-100ml-Eau-De-Parfum-Spray-BRAND-NEW-IN-BOX-%2F252605653607%3F_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',65.99,NULL,5.50,4,6,2),(22,'Chilly Dog 100% Wool Black Bear Dog Sweater','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FChilly-Dog-100-Wool-Black-Bear-Dog-Sweater-%2F152225133795%3Fvar%3D451414395960%26_trkparms%3D%2526rpp_cid%253D5833359ee4b03cb24c7fa457%2526rpp_icid%253D58332f0ee4b01cae304a2a0a',72.00,NULL,6.00,4,1,2),(26,'Fast Lane - Radio Control B-Furious - Red &amp; Blue','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FFast-Lane-Radio-Control-B-Furious-Red-Blue-%2F371726006191%3F',28.76,NULL,2.40,4,22,2),(27,'Thomas &amp; Friends - Wooden Railway - Talking Spencer - English Edition','http%3A%2F%2Fwww.ebay.ca%2Fitm%2Fws%2FeBayISAPI.dll%3FViewItem%26item%3D371797836782',35.99,NULL,3.00,4,22,2),(28,'Star Wars Darth Vader ABS Action Figure w/ Light&amp;Sound Keychain Keyring Gift','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FStar-Wars-Darth-Vader-ABS-Action-Figure-w-Light-Sound-Keychain-Keyring-Gift-%2F291945713713%3Fhash%3Ditem43f9521031',1.42,NULL,0.12,4,22,2),(29,' Luigi Super Mario Bros Cosplay Adult Size Hat Cap Baseball Costume New CAF','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FLuigi-Super-Mario-Bros-Cosplay-Adult-Size-Hat-Cap-Baseball-Costume-New-CAF-%2F331667734593%3Fhash%3Ditem4d38f00041',4.51,NULL,0.38,4,22,2),(30,'New Quality 6Pcs Teenage Mutant Ninja Turtles TMNT Figures Toy Chlid Classic Hot','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNew-Quality-6Pcs-Teenage-Mutant-Ninja-Turtles-TMNT-Figures-Toy-Chlid-Classic-Hot-%2F222307155215%3Fhash%3Ditem33c289fd0f',4.25,NULL,0.35,4,22,2),(33,'ENFAMIL INFANT BABY FORMULA Milk-Based Powder w/Iron PACKETS Box(1-12-months)','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fenfamil-infant-baby-formula-milk-based-powder-w-iron-packets-box-1-12-months-147920894.htm',3.23,NULL,0.27,4,3,3),(34,'Dr Who talk whimey to me bib','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdr-who-talk-whimey-to-me-bib-152584880.htm',16.75,NULL,1.40,4,3,3),(35,'Dr Who talk whimey to me bib','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdr-who-talk-whimey-to-me-bib-152584880.htm',16.75,NULL,1.40,4,3,3),(36,'Detective Comics #552. Vol1. DC July 1985. Batman. Green Arrow. Moench. VFN-/VFN','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdetective-comics-552-vol1-dc-july-1985-batman-green-arrow-moench-vfn-vfn-152755397.htm',6.05,NULL,0.50,4,7,3),(37,'Undine by Fr. Baron de la Motte Fouqu&eacute;. German 1895 Hardback Book','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fundine-by-fr-baron-de-la-motte-fouqu%25C3%25A9-german-1895-hardback-book-151197576.htm',18.13,NULL,1.51,4,7,3),(38,'Vintage Tootsie toy Jaguar:purple','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fvintage-tootsie-toy-jaguar-purple-151695362.htm',12.17,NULL,1.01,4,3,3),(39,'RARE KEY CHAIN 2001/2002/2003/2004 SILVER CHEVY CORVETTE C5 NEW CUSTOM KEY RING','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Frare-key-chain-2001-2002-2003-2004-silver-chevy-corvette-c5-new-custom-key-ring-152749236.htm',24.24,NULL,2.02,4,3,3),(40,'Mosiso - Envelope Nylon Fabric Shoulder Bag Case Pouch Sleeve for 11-11.6 Inch Laptop / Notebook Computer / MacBook Air / HP / Acer, Black','https%3A%2F%2Fwww.amazon.ca%2FMosiso-Envelope-Shoulder-Notebook-Computer%2Fdp%2FB00U639CLY%2Fref%3Dsr_1_1%3Fie%3DUTF8%26qid%3D1480029559%26sr%3D8-1%26keywords%3Dmosiso%2Benvelope',25.19,NULL,2.10,4,4,4),(41,'Palalula Men\'s Boxing Fight Joe Frazier vs Muhammad Ali Cassius Clay T-Shirt','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fpalalula-men-s-boxing-fight-joe-frazier-vs-muhammad-ali-cassius-clay-t-shirt-151580286.htm',25.93,NULL,2.16,4,23,3),(42,'Dimebag Darrell - PanterA - T-Shirt - Damageplan PanterA CFH','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdimebag-darrell-pantera-t-shirt-damageplan-pantera-cfh-152608143.htm',72.97,NULL,6.08,4,23,3),(43,'1982 Ghana 2 Cedis.. pfx BL .. School girl .. P-18d .. Ch UNC','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F1982-ghana-2-cedis-pfx-bl-school-girl-p-18d-ch-unc-152108937.htm',11.27,NULL,0.94,4,7,3),(44,'Dell Desktop Computer Windows XP Pentium 4 GHz Unknown Dimension 8250','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdell-desktop-computer-windows-xp-pentium-4-ghz-unknown-dimension-8250-131786253.htm',64.67,NULL,5.39,4,7,3),(45,'Dell Desktop Computer Windows XP Celeron 80546 Optiplex 170L A','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdell-desktop-computer-windows-xp-celeron-80546-optiplex-170l-a-140515279.htm',56.57,NULL,4.71,4,7,3),(46,'CLEO 2 Round BATH FIZZERS BALLS inside Tube-Soften Skin while Making Fun BUBBLES','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fcleo-2-round-bath-fizzers-balls-inside-tube-soften-skin-while-making-fun-bubbles-145253328.htm',1.06,NULL,0.09,4,7,3),(47,'Balinese Style Handmade 925 Sterling Silver Bracelet/Cuff Semi-precious Stone','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fbalinese-style-handmade-925-sterling-silver-bracelet-cuff-semi-precious-stone-152706483.htm',107.92,NULL,8.99,4,7,3),(48,'Silver Arm Cuff Bracelet-Upper Arm Band Handmade Sterling Silver 925 Armlet','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fsilver-arm-cuff-bracelet-upper-arm-band-handmade-sterling-silver-925-armlet-152747448.htm',56.20,NULL,4.68,4,7,3),(49,'Custom Natural &amp; Green Wood Anklet Hippie Boho Surfer','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fcustom-natural-green-wood-anklet-hippie-boho-surfer-151480019.htm',11.34,NULL,0.94,4,7,3),(50,'Charm Bracelet Goldstone Moonstone 16543','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fcharm-bracelet-goldstone-moonstone-16543-148164700.htm',20.16,NULL,1.68,4,7,3),(51,'Ernesto Bitetti - Sevilla / Spanish Guitar Recital EMI CD','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F077774997324-ernesto-bitetti-sevilla-spanish-guitar-recital-emi-cd-152616997.htm',1.99,NULL,0.17,4,23,3),(52,'Charlie Parker BIRD IN BOSTON &middot; LIVE AT THE HI-HAT 1953-1954 (2-CD)','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F8427328609111-charlie-parker-bird-in-boston-live-at-the-hi-hat-1953-1954-2-cd-152740320.htm',34.18,NULL,2.85,4,23,3),(53,'Best of the Musicals 5CD Collector Edition boxed set','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fbest-of-the-musicals-5cd-collector-edition-boxed-set-151229861.htm',16.15,NULL,1.35,4,23,3),(54,'Stardust - Music Sounds Better With You 3 Track CD (Roule, 1998)','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F724389531220-stardust-music-sounds-better-with-you-3-track-cd-roule-1998-151634246.htm',2.22,NULL,0.18,4,23,3),(55,'Backpack Rugtas Rugzak Real Madrid Sac &agrave; Dos White/wit 44x32x16 cm New!!','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F8412688201433-backpack-rugtas-rugzak-real-madrid-sac-%25C3%25A0-dos-white-wit-44x32x16-cm-new-142649730.htm',68.36,NULL,5.70,4,23,3),(56,'Portemonnee Minions Wallet Bleu/Yellow New!','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F5036278055669-portemonnee-minions-wallet-bleu-yellow-new-142770692.htm',15.37,NULL,1.28,4,23,3),(57,'ZWEMTAS FROZEN BLUE GYMTAS DISNEY TAS SWIM/GYM BAG NEW!','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F1000000081138-zwemtas-frozen-blue-gymtas-disney-tas-swim-gym-bag-new-136702680.htm',17.08,NULL,1.42,4,23,3),(58,'Rugzak Met Drinksysteem Rugtas Backpack with Hydration System Red/Grey!','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2F8716404154615-rugzak-met-drinksysteem-rugtas-backpack-with-hydration-system-red-grey-121788546.htm',42.72,NULL,3.56,4,23,3),(59,'Colorado Rockies April 1999 Official Scorecard Magazine Jim Leyland Poster','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fcolorado-rockies-april-1999-official-scorecard-magazine-jim-leyland-poster-142341695.htm',3.24,NULL,0.27,4,23,3),(60,'Modified Original Microsoft Xbox 500GB 40000+ XBMC NES SNES N64 ATARI Amiga','http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fmodified-original-microsoft-xbox-500gb-40000-xbmc-nes-snes-n64-atari-amiga-150858553.htm',283.72,NULL,23.64,4,23,3),(61,'PIPE TOBACCO Fragrance Oil Candle/Soap Making,Oil Burner,Diffuse<wbr/>r','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FPIPE-TOBACCO-Fragrance-Oil-Candle-Soap-Making-Oil-Burner-Diffuser-%2F361107864324',5.99,NULL,0.50,4,17,2),(62,'NEW V2 Silhouette CAMEO Digital Cutting Machine FREE Spatula Scraper Hook Tools','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNEW-V2-Silhouette-CAMEO-Digital-Cutting-Machine-%2F331821037176',293.99,NULL,24.50,4,17,2),(63,'Gumstyle® Fashion Men\'s Leather Cross Body Daypacks Chest Pack Bag Deep Blue','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB00V3ALSDO%2Fref%3Dwl_it_dp_o_pd_S_ttl%3F_encoding%3DUTF8%26colid%3DOJ1OG3PDWBFF%26coliid%3DI2XEH28OPSQA0G%26psc%3D1',47.99,NULL,4.00,4,15,1),(64,'TR.OD Dragons Dungeons Dice Opaque Multi Sides Dice D4-D20 Black','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB0192OVVKW%2Fref%3Dwl_it_dp_o_pd_nS_img%3F_encoding%3DUTF8%26colid%3D1D54YNP7P11GI%26coliid%3DI2FFOEXHVNZKD9%26psc%3D1',4.62,NULL,0.38,4,13,1),(65,'Chessex Manufacturing Chessex: Gemini D10 Purple-Teal W/ Gold (10)','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB00806VAH8%2Fref%3Dwl_it_dp_o_pC_nS_img%3F_encoding%3DUTF8%26colid%3D1D54YNP7P11GI%26coliid%3DI29WF4JXN2A8TK',48.80,NULL,4.07,4,13,1),(66,'SODIAL(R) Delicate Cool Classic Vintage Leather Bound Blank Pages Journal Diary Notebook','https%3A%2F%2Fwww.amazon.ca%2FSODIAL-Delicate-Classic-Vintage-Notebook%2Fdp%2FB00OPNYEM8%2Fref%3Dpd_sim_sbs_201_5%3F_encoding%3DUTF8%26psc%3D1%26refRID%3DZCQHN6282H8987KXK0HT',9.14,NULL,0.76,4,7,1),(67,'SanDisk Cruzer Fit 32GB USB 2.0 Low-Profile Flash Drive- SDCZ33-032G-B35','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB00812F7O8%2Fref%3Dwl_it_dp_o_pd_nS_ttl%3F_encoding%3DUTF8%26colid%3D15KKU6SHQ5KXK%26coliid%3DI3TYMD1ALC84JQ%26psc%3D1',17.32,NULL,1.44,4,17,1),(68,'Monoprice 6-Feet USB 2.0 A Male to A Female Extension 28/24AWG Cable (Gold Plated) (105433)','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB002BR6DF6%2Fref%3Dwl_it_dp_o_pd_S_ttl%3F_encoding%3DUTF8%26colid%3D15KKU6SHQ5KXK%26coliid%3DI2FG2JT6ZCSQVW',4.79,NULL,0.40,4,17,1),(69,'Spigen Thin Fit iPhone 6 Plus Case with Premium Matte Finish Coating Thin Case for Apple iPhone 6 Plus - Smooth Black','https%3A%2F%2Fwww.amazon.ca%2Fdp%2FB00MAWSV0M%2Fref%3Dwl_it_dp_o_pd_nS_ttl%3F_encoding%3DUTF8%26colid%3D15KKU6SHQ5KXK%26coliid%3DI2PJGFAS49Y2JZ%26psc%3D1',16.79,NULL,1.40,4,18,1),(70,'Igloo FR465 4.6-cu-ft Freestanding Compact Refrigerator (Stainless Steel)','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FIgloo-FR465-4-6-cu-ft-Freestanding-Compact-Refrigerator-Stainless-Steel-%2F121823522100%3F',201.60,NULL,16.80,4,7,2),(71,'GOTHAM STEEL 9.5 inches Non stick Titanium Frying Pan Daniel Green Ceramic ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FGOTHAM-STEEL-9-5-inches-Non-stick-Titanium-Frying-Pan-Daniel-Green-Ceramic-%2F172151217145%3Fhash%3Ditem2815031bf9%253Ag%253AelAAAOSwOfxXBIM4',40.79,NULL,3.40,4,7,2),(72,'Taiyaki Fish-Shaped Cake Maker ED','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FTaiyaki-Fish-Shaped-Cake-Maker-ED-%2F131681947962%3Fhash%3Ditem1ea8db113a%253Ag%253A5tEAAOSwCQNWeE7J',19.48,NULL,1.62,4,7,2),(75,'Telebrands Orgreenic 10-Piece Anodized Non Stick Kitchen Cookware Set Pans Pots','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FTelebrands-Orgreenic-10-Piece-Anodized-Non-Stick-Kitchen-Cookware-Set-Pans-Pots-%2F350666158648%3Fhash%3Ditem51a554f238%253Ag%253A7MAAAOSwGYVXBaGT',89.98,NULL,7.50,4,7,2),(76,'2 SUGAR SPOONS / JELLY SPOONS Reed &amp; Barton ENGLISH CROWN Silverplate tableware','http%3A%2F%2Fwww.ebay.ca%2Fitm%2F2-SUGAR-SPOONS-JELLY-SPOONS-Reed-Barton-ENGLISH-CROWN-Silverplate-tableware-%2F162223280259%3Fhash%3Ditem25c542d083%3Ag%3Ar6oAAOSwknJX2ALm',12.00,NULL,1.00,4,19,2),(77,'Rawlings PRO303-6CFS 12.75&#034; Heart Of The Hide Outfield Baseball Glove New!','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FRawlings-PRO303-6CFS-12-75-Heart-Of-The-Hide-Outfield-Baseball-Glove-New-%2F381799633829%3F',299.94,NULL,25.00,4,15,2),(78,'TORONTO MAPLE LEAFS AUTHENTIC 2014 WINTER CLASSIC REEBOK EDGE 2.0 7287 JERSEY','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FTORONTO-MAPLE-LEAFS-AUTHENTIC-2014-WINTER-CLASSIC-REEBOK-EDGE-2-0-7287-JERSEY-%2F301441283119%3Fvar%3D%26hash%3Ditem462f4cf42f%253Am%253Ammxdnnr3WK1pmbMs3Kcgt-w',209.99,NULL,17.50,4,15,2),(81,'Youth MONTREAL CANADIENS NHL S Small Reebok CCM Hockey Jersey + FREE NFL+MLB+NBA','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FYouth-MONTREAL-CANADIENS-NHL-S-Small-Reebok-CCM-Hockey-Jersey-FREE-NFL-MLB-NBA-%2F302144183207%3Fhash%3Ditem4659325ba7%3Ag%3Ae%7EYAAOSwcLxYMkfB',15.72,NULL,1.31,4,23,2),(83,' Blitzball Plastic Baseball (2 Pack) ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBlitzball-Plastic-Baseball-2-Pack-%2F262547480210%3Fhash%3Ditem3d210c9e92%253Ag%253ApFkAAOSwQaJXRRXr',14.88,NULL,1.24,4,15,2),(88,' Blitzball Plastic Baseball (2 Pack) ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBlitzball-Plastic-Baseball-2-Pack-%2F262547480210%3Fhash%3Ditem3d210c9e92%253Ag%253ApFkAAOSwQaJXRRXr',14.88,NULL,1.24,4,15,2),(89,'UNLOCKED Apple iPhone 6 16GB Fido Bell Rogers Telus Wind Mobilicity - Warranty','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUNLOCKED-Apple-iPhone-6-16GB-Fido-Bell-Rogers-Telus-Wind-Mobilicity-Warranty-%2F331989501799%3Fhash%3Ditem4d4c1dc767%253Ag%253A60UAAOSwYIxYACJH',502.80,NULL,41.90,4,18,2),(90,'Apple iPhone 5C - 16GB White (Bell / Virgin) Good Condition Smartphone','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FApple-iPhone-5C-16GB-White-Bell-Virgin-Good-Condition-Smartphone-%2F122106525340%3Fhash%3Ditem1c6e1db69c%253Ag%253AHv0AAOSwo0JWNtp9',150.00,NULL,12.50,4,18,2),(91,'Samsung Galaxy S5 in Black or White Unlocked 16gb G900P','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FSamsung-Galaxy-S5-in-Black-or-White-Unlocked-16gb-G900P-%2F272183722598%3Fvar%3D%26hash%3Ditem3f5f6a0266%253Am%253AmHg7yGSF3OJRZwpAGFcxCXQ',227.99,NULL,19.00,4,18,2),(92,'Samsung Galaxy Note 4 SM-N910V Unlocked Smartphone 32gb','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FSamsung-Galaxy-Note-4-SM-N910V-Unlocked-Smartphone-32gb-%2F272225176891%3Fvar%3D%26hash%3Ditem3f61e28d3b%253Am%253Am_AD_SehVqT8C9nVfFqEHRA',299.99,NULL,25.00,4,18,2),(93,'New LG Optimus L90 D415 - 8GB - 4G - Black (T-Mobile GSM  Unlocked) Smartphone ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNew-LG-Optimus-L90-D415-8GB-4G-Black-T-Mobile-GSM-Unlocked-Smartphone-%2F381753656947%3Fhash%3Ditem58e24a8673%253Ag%253AUFUAAOxyrx5TjnDR',77.99,NULL,6.50,4,18,2),(94,'LG G3 D852 32GB Black - (Bell Mobility) - Good Condition Smartphone','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FLG-G3-D852-32GB-Black-Bell-Mobility-Good-Condition-Smartphone-%2F112152926686%3Fhash%3Ditem1a1cd5d9de%253Ag%253ABkQAAOSwDNdV56rU',178.80,NULL,14.90,4,18,2),(95,'HTC One M8 32GB Gray 4G LTE GSM (AT&amp;T, ... OEM Unlocked) Smartphone Android - FR','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FHTC-One-M8-32GB-Gray-4G-LTE-GSM-AT-T-OEM-Unlocked-Smartphone-Android-FR-%2F191869029731%3Fhash%3Ditem2cac490d63%253Ag%253AXO0AAOSwGvhT37mo',143.99,NULL,12.00,4,18,2),(96,'Unlocked HTC One M7 32GB/64GB Quad-core Mobile Smartphone GOLD SILVER BLACK','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUnlocked-HTC-One-M7-32GB-64GB-Quad-core-Mobile-Smartphone-GOLD-SILVER-BLACK-%2F291865223756%3Fvar%3D%26hash%3Ditem43f485e24c%253Am%253AmBNbVwmkJDrIPBLtCyJsIoA',101.98,NULL,8.50,4,18,2),(97,'Unlocked HTC ONE M7 3G Smartphone 2GB+32GB Android Quad-core GPS WIFI Gold EU','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUnlocked-HTC-ONE-M7-3G-Smartphone-2GB-32GB-Android-Quad-core-GPS-WIFI-Gold-EU-%2F311629236982%3Fhash%3Ditem488e8ccaf6%253Ag%253A864AAOSwal5YHuQo',107.98,NULL,9.00,4,18,2),(98,'Unlocked HTC DESIRE 626S 4G LTE Android 5.0&#034; 8GB GSM SmartPhone White','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUnlocked-HTC-DESIRE-626S-4G-LTE-Android-5-0-8GB-GSM-SmartPhone-White-%2F232137934597%3Fhash%3Ditem360c7fc705%253Ag%253A0X8AAOSwcUBYIk5y',101.99,NULL,8.50,4,18,2),(99,'HTC EVO Design 4G, 4GB - Black - (Boost Mobile) Clean ESN','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FHTC-EVO-Design-4G-4GB-Black-Boost-Mobile-Clean-ESN-%2F172415495039%3Fhash%3Ditem2824c3ab7f%253Ag%253AtawAAOSwHMJYMfgO',32.50,NULL,2.71,4,18,2),(100,'Rolex Submariner Black Dial Ceramic Bezel Steel Mens Watch 116610LN','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FRolex-Submariner-Black-Dial-Ceramic-Bezel-Steel-Mens-Watch-116610LN-%2F151354090138%3Fhash%3Ditem233d68229a%253Ag%253A3aAAAOSwv-NWXL32',539.99,NULL,45.00,4,8,2),(101,'Fossil Men&#039;s CH2573 Decker Chronograph Black Dial Black Silicone Watch','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FFossil-Mens-CH2573-Decker-Chronograph-Black-Dial-Black-Silicone-Watch-%2F271966757246%3Fhash%3Ditem3f527b617e%253Ag%253AhAwAAOSwYIhWlWV9',69.54,NULL,5.80,4,8,2),(102,'Fossil Grant Chronograph Egg Shell Dial Brown Leather Mens Watch FS4735','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FFossil-Grant-Chronograph-Egg-Shell-Dial-Brown-Leather-Mens-Watch-FS4735-%2F151361929752%3Fhash%3Ditem233ddfc218%253Ag%253AYjcAAOSw3xJVbe7A',76.79,NULL,6.40,4,8,2),(103,'Fossil Men&#039;s Machine FS4656 Brown Leather Analog Quartz Watch','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FFossil-Mens-Machine-FS4656-Brown-Leather-Analog-Quartz-Watch-%2F151804595084%3Fhash%3Ditem2358424b8c%253Ag%253A0fMAAOSwYaFWe8qP',88.80,NULL,7.40,4,8,2),(104,'Timex Men&#039;s Classics Digital Dress | Silver-Tone Case w Indiglo | Watch T78587','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FTimex-Mens-Classics-Digital-Dress-Silver-Tone-Case-w-Indiglo-Watch-T78587-%2F262485235344%3F',53.99,NULL,4.50,4,8,2),(105,'POTBELLY STOVE MINIATURE DIECAST 1:24 SCALE G SCALE DIORAMA ACCESSORY ITEM','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FPOTBELLY-STOVE-MINIATURE-DIECAST-1-24-SCALE-G-SCALE-DIORAMA-ACCESSORY-ITEM-%2F162252790707',13.14,NULL,1.09,4,22,2),(106,'HTC EVO Design 4G, 4GB - Black - (Boost Mobile) Clean ESN','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FHTC-EVO-Design-4G-4GB-Black-Boost-Mobile-Clean-ESN-%2F172415495039%3Fhash%3Ditem2824c3ab7f%253Ag%253AtawAAOSwHMJYMfgO',32.50,NULL,2.71,4,18,2),(107,'1959 Retro Euro Bus  - O Scale - Metal - Kovap - Railroad Vehicles','http%3A%2F%2Fwww.ebay.ca%2Fitm%2F1959-Retro-Euro-Bus-O-Scale-Metal-Kovap-Railroad-Vehicles-%2F112045906356',11.94,NULL,1.00,4,22,2),(108,'GARAGE SHOP/ROAD WORK ACCESSORY PACK BY GREENLIGHT 1:64 SCALE MIP!','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FGARAGE-SHOP-ROAD-WORK-ACCESSORY-PACK-BY-GREENLIGHT-1-64-SCALE-MIP-%2F151631482298',29.94,NULL,2.50,4,22,2),(109,'BUILDING &amp; STRUCTURE CO S SCALE GATO SECTION HOUSE / DEPOT  CSM 4104S ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBUILDING-STRUCTURE-CO-S-SCALE-GATO-SECTION-HOUSE-DEPOT-CSM-4104S-%2F131960380836',107.99,NULL,9.00,4,22,2),(110,'10 pcs G Scale 1:24 Unpainted Figure People passenger 10 poses LGB #F','http%3A%2F%2Fwww.ebay.ca%2Fitm%2F10-pcs-G-Scale-1-24-Unpainted-Figure-People-passenger-10-poses-LGB-F-%2F260760965265',10.79,NULL,0.90,4,22,2),(111,'Forklift w 10 Premium Custom Dual Slat Pallets 1/24 Scale G Diorama Accessories','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FForklift-w-10-Premium-Custom-Dual-Slat-Pallets-1-24-Scale-G-Diorama-Accessories-%2F161259592216',41.94,NULL,3.50,4,22,2),(112,'Victoria&#039;s Secret 34C unlined demi bra black sheer floral lace $48 retail','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FVictorias-Secret-34C-unlined-demi-bra-black-sheer-floral-lace-48-retail-%2F282261674233%3F_trkparms%3D%2526rpp_cid%253D5419ae60e4b0c142e9c1f77b%2526rpp_icid%253D5419ab25e4b0ee7b395399ee%26rpp_cat_id%3D5419ac61e4b038b0b46456f1',19.14,NULL,1.60,4,14,2),(113,'Victoria&#039;s Secret Bra Dream Angels Lined Lace Bows Rhinestones Bling Vs New Nwt','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FVictorias-Secret-Bra-Dream-Angels-Lined-Lace-Bows-Rhinestones-Bling-Vs-New-Nwt-%2F231934768201%3Fvar%3D531147286437%26_trkparms%3D%2526rpp_cid%253D5419ae60e4b0c142e9c1f77b%2526rpp_icid%253D5419ab25e4b0ee7b395399ee%26rpp_cat_id%3D5419ac61e4b038b0b46456f1',35.96,NULL,3.00,4,14,2),(114,'Body by Victorias Secret RACERBACK DEMI Bra 34DD Black NWT!','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBody-by-Victorias-Secret-RACERBACK-DEMI-Bra-34DD-Black-NWT-%2F272449613470%3F_trkparms%3D%2526rpp_cid%253D5419ae60e4b0c142e9c1f77b%2526rpp_icid%253D5419ab25e4b0ee7b395399ee%26rpp_cat_id%3D5419ac61e4b038b0b46456f1',35.99,NULL,3.00,4,14,2),(115,'Victorias Secret 34B magenta rhinestone bling unlined bra','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FVictorias-Secret-34B-magenta-rhinestone-bling-unlined-bra-%2F282255931996%3F_trkparms%3D%2526rpp_cid%253D5419ae60e4b0c142e9c1f77b%2526rpp_icid%253D5419ab25e4b0ee7b395399ee%26rpp_cat_id%3D5419ac61e4b038b0b46456f1',15.54,NULL,1.29,4,14,2),(116,'AMC: Eagle','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FAMC-Eagle-%2F162229102919%3Fhash%3Ditem25c59ba947%253Ag%253AIasAAOSw-CpX9XDs',1050.00,NULL,87.50,4,2,2),(119,'Nike Dri-Fit Slim Fit Capri Workout Pants 472352 010 Black Womens Size Medium','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNike-Dri-Fit-Slim-Fit-Capri-Workout-Pants-472352-010-Black-Womens-Size-Medium-%2F282244514129%3Fhash%3Ditem41b7158151%3Ag%3ALRUAAOSwImRYHPV6',29.94,NULL,2.50,4,14,2),(120,'FABLETICS Salar Capri Workout, Yoga, Gym Pant Black -Choose Size ','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FFABLETICS-Salar-Capri-Workout-Yoga-Gym-Pant-Black-Choose-Size-%2F371777776926%3Fvar%3D%26hash%3Ditem568faead1e%3Am%3AmmfHANGcWNA7G1300pl_VyA',29.94,NULL,2.50,4,14,2),(121,'Black Yoga Legging Lift Shape Workout Pant Colombian','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FBlack-Yoga-Legging-Lift-Shape-Workout-Pant-Colombian-%2F322217966052%3Fhash%3Ditem4b05aff9e4%3Ag%3AKfcAAOSw65FXwm1e',94.20,NULL,7.85,4,14,2),(122,'Nike Men&#039;s Pro Cool Compression Shirt Tee Dri-Fit','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNike-Mens-Pro-Cool-Compression-Shirt-Tee-Dri-Fit-%2F381573416937%3Fvar%3D650683373403%26_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',33.59,NULL,2.80,4,14,2),(123,'Under Armour 1228539 Men&#039;s Black UA Tech Ultra-Soft Short Sleeve T-Shirt','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUnder-Armour-1228539-Mens-Black-UA-Tech-Ultra-Soft-Short-Sleeve-T-Shirt-%2F381848999558%3Fvar%3D650847407725%26_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',24.16,NULL,2.01,4,14,2),(124,'Under Armour Mens Red HeatGear Golf/Polo Shirt M New','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUnder-Armour-Mens-Red-HeatGear-Golf-Polo-Shirt-M-New-%2F252645398799%3F_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',29.99,NULL,2.50,4,14,2),(125,'New Men&#039;s Under Armour HeatGear Navy Blue Loose Fit Long Sleeve Shirt XXXL 3XL','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNew-Mens-Under-Armour-HeatGear-Navy-Blue-Loose-Fit-Long-Sleeve-Shirt-XXXL-3XL-%2F361688097022%3F_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',28.78,NULL,2.40,4,14,2),(126,'UNDER ARMOUR MENS INFRARED COLDGEAR 1/4-ZIP PULLOVER SHIRT BLACK #1259677-NWT','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FUNDER-ARMOUR-MENS-INFRARED-COLDGEAR-1-4-ZIP-PULLOVER-SHIRT-BLACK-1259677-NWT-%2F121889687778%3Fvar%3D420881282912%26_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',63.59,NULL,5.30,4,14,2),(127,'11pcs Professional Makeup Cosmetic Brush Set Eyebrow Eyeliner Foundation Powder Bamboo Brush with Free Bag','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2FB015MZAU66%2Fref%3Ds9_top_hd_bw_b6vNROl_g194_i2%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-5%26pf_rd_r%3DXA31DXDE8A8BT57JDPSD%26pf_rd_t%3D101%26pf_rd_p%3D5b3ce3ef-a329-52f7-a9e8-a94f69c7a420%26pf_rd_i%3D6344635011',10.31,NULL,0.86,4,6,1),(128,'11pcs Professional Makeup Cosmetic Brush Set Eyebrow Eyeliner Foundation Powder Bamboo Brush with Free Bag','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2FB015MZAU66%2Fref%3Ds9_top_hd_bw_b6vNROl_g194_i2%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-5%26pf_rd_r%3DXA31DXDE8A8BT57JDPSD%26pf_rd_t%3D101%26pf_rd_p%3D5b3ce3ef-a329-52f7-a9e8-a94f69c7a420%26pf_rd_i%3D6344635011',10.31,NULL,0.86,4,6,1),(129,'11pcs Professional Makeup Cosmetic Brush Set Eyebrow Eyeliner Foundation Powder Bamboo Brush with Free Bag','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2FB015MZAU66%2Fref%3Ds9_top_hd_bw_b6vNROl_g194_i2%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-5%26pf_rd_r%3DXA31DXDE8A8BT57JDPSD%26pf_rd_t%3D101%26pf_rd_p%3D5b3ce3ef-a329-52f7-a9e8-a94f69c7a420%26pf_rd_i%3D6344635011',10.31,NULL,0.86,4,6,1),(130,'New Men&#039;s Under Armour HeatGear Navy Blue Loose Fit Long Sleeve Shirt XXXL 3XL','http%3A%2F%2Fwww.ebay.ca%2Fitm%2FNew-Mens-Under-Armour-HeatGear-Navy-Blue-Loose-Fit-Long-Sleeve-Shirt-XXXL-3XL-%2F361688097022%3F_trkparms%3D%2526rpp_cid%253D5356cbd5e98ee8036c857305%2526rpp_icid%253D5357c86ce95726bb21aa76cd',28.78,NULL,2.40,4,14,2),(131,'NIVEA MEN Active Lip Care 4.8g','https%3A%2F%2Fwww.amazon.ca%2FNIVEA-MEN-Active-Care-4-8g%2Fdp%2FB003QZXZQC%2Fref%3Dsr_1_1%3Fs%3Dbeauty%26ie%3DUTF8%26qid%3D1480032847%26sr%3D1-1',2.51,NULL,0.21,4,6,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'https://www.amazon.ca/Asus-Transformer-T100HA-DH11T-CA-10-1-Inch-Laptop/dp/B0186SN2PC/ref=sr_1_1?s=pc&ie=UTF8&qid=1479486615&sr=1-1&keywords=convertible',2),(2,'https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F1506703356%2Fref%3Ds9_zwish_hd_bw_b3qQa_g14_i1%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_r%3DJGVTC5Z1GKNYAEX8EV6S%26pf_rd_t%3D101%26pf_rd_p%3D3fd3ec9d-e1cb-5f5f-86ac-9d461300eccc%26pf_rd_i%3D916520',6),(3,'https%3A%2F%2Fwww.amazon.ca%2FPlaytex-Diaper-Genie-Disposal-System%2Fdp%2FB00LCR1KZO%2Fref%3Dgbph_img_m-6_7b56_e18c27a8%3Fsmid%3DA3DWYIK6Y9EEQB%26pf_rd_p%3Def10e933-94dc-4f20-bbee-3a13e9607b56%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_t%3D101%26pf_rd_i%3D3561346011%26pf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_r%3D4YRVC6FCDDMKF52F1B5Z',7),(4,'http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fti-81-texas-instruments-scientific-graphing-calculator-152365955.htm',6),(5,'https%3A%2F%2Fwww.amazon.ca%2FFujifilm-Instax-Mini-Instant-Blue%2Fdp%2FB00AWKJPOA%2Fref%3Dlp_667823011_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479927991%26sr%3D1-8',6),(6,'https%3A%2F%2Fwww.amazon.ca%2FBosch-DDB181-02-Lithium-Ion-Batteries-Contractor%2Fdp%2FB00N8I29X2%2Fref%3Dgbps_img_s-3_2706_ae6be905%3Fsmid%3DA3DWYIK6Y9EEQB%26pf_rd_p%3D0f6e7b78-5442-4617-aef8-459755692706%26pf_rd_s%3Dslot-3%26pf_rd_t%3D701%26pf_rd_i%3Dgb_main%26pf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_r%3DX5MXMSAZBBTWZS7DRYBT',7),(7,'https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F0233005005%2Fref%3Ds9_acsd_aas_bw_c_x_2_w%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-2%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_r%3DT4QBFR79850RN82S93QR%26pf_rd_t%3D101%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_p%3Db6059a6e-c9b4-4049-b7b2-d3f9cb8b1c2d%26pf_rd_i%3D927728',6),(8,'http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fdr-who-talk-whimey-to-me-bib-152584880.htm',6),(9,'http%3A%2F%2Fwww.ebid.net%2Fca%2Ffor-sale%2Fenfamil-infant-baby-formula-milk-based-powder-w-iron-packets-box-1-12-months-147920894.htm',6);
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
INSERT INTO `user` VALUES ('Sa123154a','$2y$10$j8Bc1.kfmAINtenRRQOCseCc0lYSdyS63TPe/S99/zu9sdjQ8v7J.','123asdsa','321465','daniel.edery3@hotmail.com',1),('admin','$2y$10$OOwxaASPbxRAZUieDrdm/e5TsL1qCTQdJI9idR7F8zqI3SoJob6dW','123 Admin Str','A1b2c3','admin@admin.com',4),('anim@hot.com','$2y$10$3.Gmnl5uAuIJCzDZUgFi6epeFA/UVxvyyurmlEqikVAK3WI6UZRi2','sad123','asd3211','anim@hot.com',1),('asd@asd.ca','','342','1231','asd@asd.ca',1),('asd@hotmail.com','','123as','as3d2','asd@hotmail.com',3),('asda@asd.ca','','123','123','asda@asd.ca',1),('asdaa@asd.ca','','123456','123456','asdaa@asd.ca',1),('hyp','$2y$10$1Fyqh2Fu3fK/BySKE/R7JOFmdecx//pJsRmXlLhL8rYc6R2cget4.','1875','h4m1n5','daniel.edery@hotmail.com',1),('hyp1','$2y$10$U3LCJV2iXd/Yhe80.AXGC..HBwUpsH4FdByaUo9L5ToCMHigiVvNC','','','daniel.edery@hotmail.com',1),('test1','$2y$10$//2aPfg9en2FUKZUd3Pjwei91ipKxRSh6MzHYT/d4ad3DKpxDenWq','testint','12345','daniel.edery@hotmail.com',1),('test2','$2y$10$ZQ8EUMujd9dGMNpNiQX/oeEspt6VmbcmjAfiDTMY.7RdG8QJdbI8e','12345678','54321','daniel.edery@hotmail.com',4),('test3','$2y$10$IEi78UTROioUrJan/INPROYQyz2JxEzPMgoLev9q.PR7SI0hMmA7m','asd123','asd132','test@ca.ca',1),('test34','$2y$10$x1SWQOg47x8sJe1jVU47YOImo5N1fFv5l5zhWfn8ru4MCsJVJ21wC','asd123','asd132','test4@ca.ca',1);
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

-- Dump completed on 2016-11-24 19:17:06
