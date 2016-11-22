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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
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
  `total` int(11) DEFAULT NULL,
  `budget` int(11) NOT NULL,
  `shipping_address` varchar(50) COLLATE latin1_bin NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `tracking_number` int(20) DEFAULT NULL,
  `price_per_item` int(11) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`order_id`),
  KEY `username` (`username`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
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
INSERT INTO `preference` VALUES (1,'Appliances'),(2,'Automotive'),(3,'Baby'),(4,'Electronics'),(5,'Furniture'),(6,'Beauty'),(7,'Home'),(8,'Jewellery'),(9,'Office'),(10,'Fitness'),(11,'Books'),(12,'Software'),(13,'Video Games'),(14,'Clothing'),(15,'Sports'),(16,'Automotive'),(17,'Cameras'),(18,'Cell Phones'),(19,'Collectibles'),(20,'Movies'),(21,'Instruments'),(22,'Toys'),(23,'Random');
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
  `preference_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pref_table_id`),
  KEY `preference_id` (`preference_id`),
  KEY `username` (`username`,`preference_id`),
  CONSTRAINT `preference_detail_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  CONSTRAINT `preference_detail_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `preference` (`preference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preference_detail`
--

LOCK TABLES `preference_detail` WRITE;
/*!40000 ALTER TABLE `preference_detail` DISABLE KEYS */;
INSERT INTO `preference_detail` VALUES (1,'test2',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (3,'The Legend of Zelda: Art &amp; Artifacts','https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F1506703356%2Fref%3Ds9_zwish_hd_bw_b3qQa_g14_i1%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_r%3DJGVTC5Z1GKNYAEX8EV6S%26pf_rd_t%3D101%26pf_rd_p%3D3fd3ec9d-e1cb-5f5f-86ac-9d461300eccc%26pf_rd_i%3D916520',32.00,NULL,3.00,4,11,1),(4,'ASUS F555LA 15.6\" Full-HD Laptop (Core i3, 4GB RAM','https%3A%2F%2Fwww.amazon.ca%2FF555LA-Full-HD-Laptop-500GB-Windows%2Fdp%2FB011KFQASE%2Fref%3Dlp_667823011_1_7%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479766307%26sr%3D1-7',499.99,NULL,50.00,4,4,1),(6,'Free 32G Micro Card AUTO-VOX D1 Full HD 1080P 2.7\'','https%3A%2F%2Fwww.amazon.ca%2FAUTO-VOX-Recorder-Dashboard-G-Sensor-Recording%2Fdp%2FB01AT4BF28%2Fref%3Dsr_1_1%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767701%26sr%3D1-1',148.79,NULL,12.40,4,4,1),(7,'Everydaysource White/Silver Universal In-Ear Stere','https%3A%2F%2Fwww.amazon.ca%2FEverydaysource-Silver-Universal-Stereo-Headset%2Fdp%2FB007ZYUZE0%2Fref%3Dsr_1_8%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767791%26sr%3D1-8',2.87,NULL,0.24,4,4,1),(8,'Sodial Sodial- Pink Earbud Headphone Earphone For ','https%3A%2F%2Fwww.amazon.ca%2FSodial-Sodial-Headphone-Earphone-Iphone%25C2%25AE%2Fdp%2FB009LZVIOC%2Fref%3Dsr_1_14%3Fs%3Delectronics%26ie%3DUTF8%26qid%3D1479767802%26sr%3D1-14',3.91,NULL,0.33,4,4,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'https://www.amazon.ca/Asus-Transformer-T100HA-DH11T-CA-10-1-Inch-Laptop/dp/B0186SN2PC/ref=sr_1_1?s=pc&ie=UTF8&qid=1479486615&sr=1-1&keywords=convertible',2),(2,'https%3A%2F%2Fwww.amazon.ca%2Fgp%2Fproduct%2F1506703356%2Fref%3Ds9_zwish_hd_bw_b3qQa_g14_i1%3Fpf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_r%3DJGVTC5Z1GKNYAEX8EV6S%26pf_rd_t%3D101%26pf_rd_p%3D3fd3ec9d-e1cb-5f5f-86ac-9d461300eccc%26pf_rd_i%3D916520',6),(3,'https%3A%2F%2Fwww.amazon.ca%2FPlaytex-Diaper-Genie-Disposal-System%2Fdp%2FB00LCR1KZO%2Fref%3Dgbph_img_m-6_7b56_e18c27a8%3Fsmid%3DA3DWYIK6Y9EEQB%26pf_rd_p%3Def10e933-94dc-4f20-bbee-3a13e9607b56%26pf_rd_s%3Dmerchandised-search-6%26pf_rd_t%3D101%26pf_rd_i%3D3561346011%26pf_rd_m%3DA3DWYIK6Y9EEQB%26pf_rd_r%3D4YRVC6FCDDMKF52F1B5Z',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (6,'ADDED'),(4,'AVAILABLE'),(2,'COMPLETE'),(7,'DENIED'),(1,'PENDING'),(5,'UNAVAILABLE');
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
INSERT INTO `user` VALUES ('hyp','$2y$10$1Fyqh2Fu3fK/BySKE/R7JOFmdecx//pJsRmXlLhL8rYc6R2cget4.','1875','h4m1n5','daniel.edery@hotmail.com',1),('hyp1','$2y$10$U3LCJV2iXd/Yhe80.AXGC..HBwUpsH4FdByaUo9L5ToCMHigiVvNC','','','daniel.edery@hotmail.com',1),('test1','$2y$10$//2aPfg9en2FUKZUd3Pjwei91ipKxRSh6MzHYT/d4ad3DKpxDenWq','testint','12345','daniel.edery@hotmail.com',1),('test2','$2y$10$ZQ8EUMujd9dGMNpNiQX/oeEspt6VmbcmjAfiDTMY.7RdG8QJdbI8e','12345678','54321','daniel.edery@hotmail.com',4);
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

-- Dump completed on 2016-11-21 19:08:42
