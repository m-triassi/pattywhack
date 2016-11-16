-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2016 at 03:30 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pattydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorization`
--

CREATE TABLE IF NOT EXISTS `authorization` (
  `authority_id` int(11) NOT NULL,
  `authority_name` varchar(50) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `authorization`
--

INSERT INTO `authorization` (`authority_id`, `authority_name`) VALUES
(1, 'basic'),
(3, 'anonymous'),
(4, 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `date` date NOT NULL,
  `total` int(11) DEFAULT NULL,
  `budget` int(11) NOT NULL,
  `shipping_address` varchar(50) COLLATE latin1_bin NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `tracking_number` int(20) DEFAULT NULL,
  `price_per_item` int(11) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `order_table_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `item_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE IF NOT EXISTS `preference` (
  `preference_id` int(11) NOT NULL,
  `preference_category` varchar(50) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `preference_detail`
--

CREATE TABLE IF NOT EXISTS `preference_detail` (
  `pref_table_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE latin1_bin NOT NULL DEFAULT '',
  `preference_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE latin1_bin NOT NULL,
  `url` varchar(4000) COLLATE latin1_bin NOT NULL,
  `unit_price` int(11) NOT NULL,
  `product_size` varchar(30) COLLATE latin1_bin NOT NULL,
  `item_shipping_cost` int(11) NOT NULL,
  `availability` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE IF NOT EXISTS `provider` (
  `provider_id` int(11) NOT NULL,
  `provider_name` varchar(30) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `question_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `question` varchar(4000) COLLATE latin1_bin NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int(11) NOT NULL,
  `url` varchar(4000) COLLATE latin1_bin NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `response`
--

CREATE TABLE IF NOT EXISTS `response` (
  `response_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `answer` varchar(4000) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(30) COLLATE latin1_bin NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `username` varchar(30) COLLATE latin1_bin NOT NULL,
  `password_hash` varchar(255) COLLATE latin1_bin NOT NULL,
  `address` varchar(50) COLLATE latin1_bin DEFAULT NULL,
  `postal_code` varchar(16) COLLATE latin1_bin DEFAULT NULL,
  `email` varchar(70) COLLATE latin1_bin NOT NULL,
  `authority_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password_hash`, `address`, `postal_code`, `email`, `authority_id`) VALUES
('hyp', '$2y$10$1Fyqh2Fu3fK/BySKE/R7JOFmdecx//pJsRmXlLhL8rYc6R2cget4.', '1875', 'h4m1n5', 'daniel.edery@hotmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authorization`
--
ALTER TABLE `authorization`
  ADD PRIMARY KEY (`authority_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`), ADD KEY `username` (`username`), ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_table_id`), ADD KEY `product_id` (`product_id`), ADD KEY `order_id` (`order_id`,`product_id`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`preference_id`);

--
-- Indexes for table `preference_detail`
--
ALTER TABLE `preference_detail`
  ADD PRIMARY KEY (`pref_table_id`), ADD KEY `preference_id` (`preference_id`), ADD KEY `username` (`username`,`preference_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`), ADD KEY `provider_id` (`provider_id`), ADD KEY `category_id` (`category_id`), ADD KEY `availability` (`availability`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`), ADD KEY `status_id` (`status_id`), ADD KEY `status_id_2` (`status_id`), ADD KEY `status_id_3` (`status_id`), ADD KEY `username` (`username`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`), ADD KEY `status_id` (`status_id`);

--
-- Indexes for table `response`
--
ALTER TABLE `response`
  ADD PRIMARY KEY (`response_id`), ADD KEY `username` (`username`), ADD KEY `question_id` (`question_id`), ADD KEY `username_2` (`username`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`), ADD UNIQUE KEY `status_name_uq` (`status_name`), ADD UNIQUE KEY `status_name` (`status_name`), ADD UNIQUE KEY `status_name_2` (`status_name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`), ADD KEY `authority_id` (`authority_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authorization`
--
ALTER TABLE `authorization`
  MODIFY `authority_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `preference`
--
ALTER TABLE `preference`
  MODIFY `preference_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `response`
--
ALTER TABLE `response`
  MODIFY `response_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `preference_detail`
--
ALTER TABLE `preference_detail`
ADD CONSTRAINT `preference_detail_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
ADD CONSTRAINT `preference_detail_ibfk_2` FOREIGN KEY (`preference_id`) REFERENCES `preference` (`preference_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`availability`) REFERENCES `status` (`status_id`),
ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `preference` (`preference_id`),
ADD CONSTRAINT `product_ibfk_3` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
ADD CONSTRAINT `question_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`);

--
-- Constraints for table `response`
--
ALTER TABLE `response`
ADD CONSTRAINT `response_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
ADD CONSTRAINT `response_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`authority_id`) REFERENCES `authorization` (`authority_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
