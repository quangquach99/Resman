CREATE DATABASE  IF NOT EXISTS `resman` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `resman`;
-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: resman
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer_fullname` varchar(30) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_password` varchar(256) NOT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `customer_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dish` (
  `dish_id` int unsigned NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(30) NOT NULL,
  `dish_image` varchar(50) NOT NULL,
  `dish_type` int unsigned NOT NULL,
  `dish_price` decimal(10,2) NOT NULL,
  `manager_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Beef Steak','beefSteak.jpg',2,14.99,'2020-11-06 13:12:25'),(2,'Brownie','brownie.jpg',3,4.99,'2020-11-06 13:12:25'),(3,'Buttery Respberry','butteryRaspberry.jpg',1,6.99,'2020-11-06 13:12:25'),(4,'Coke','coke.jpg',4,3.99,'2020-11-06 13:12:25'),(5,'Fries','fries.jpg',1,4.99,'2020-11-06 13:12:25'),(6,'Fruits Cake','fruitsCake.jpg',3,7.99,'2020-11-06 13:12:25'),(7,'Olive','olive.jpg',3,4.99,'2020-11-06 13:12:25'),(8,'Orange Juice','orangeJuice.jpg',4,4.99,'2020-11-06 13:12:25'),(9,'Oreo Cake','oreoCake.jpg',3,5.99,'2020-11-06 13:12:25'),(10,'Pizzea','pizza.jpg',2,14.99,'2020-11-06 13:12:25'),(11,'Red Wine','redWine.jpg',4,24.99,'2020-11-06 13:12:25'),(12,'Salmon','salmon.jpg',2,24.99,'2020-11-06 13:12:25'),(13,'Sausage','sausage.jpg',1,5.99,'2020-11-06 13:12:25'),(14,'Shrimp','shrimp.jpg',2,19.99,'2020-11-06 13:12:25'),(15,'Snack','snack.jpg',1,4.99,'2020-11-06 13:12:25'),(16,'Sushi','sushi.jpg',2,18.99,'2020-11-07 02:54:18'),(17,'Latte','latte.jpg',4,4.99,'2020-11-06 13:12:25');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_id` int unsigned NOT NULL AUTO_INCREMENT,
  `manager_fullname` varchar(30) NOT NULL,
  `manager_email` varchar(50) NOT NULL,
  `manager_password` varchar(256) NOT NULL,
  `manager_address` varchar(50) DEFAULT NULL,
  `manager_phone` varchar(10) NOT NULL,
  `manager_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Quach Dinh Quang','dinhquang@gmail.com','AI}Q}I~\\r9[]5JLeypKV','Hoang Mai, Ha Noi','0355764662','2020-11-08 03:26:14');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `reservation_id` int unsigned NOT NULL,
  `dish_id` int unsigned NOT NULL,
  `dish_quantity` int NOT NULL,
  `order_price` decimal(10,2) NOT NULL,
  `ordered_at` time NOT NULL,
  `order_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `dish_id` (`dish_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`reservation_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (15,20,1,12,179.88,'05:04:28','2020-11-19 10:04:28'),(16,20,2,12,59.88,'05:04:28','2020-11-19 10:04:28'),(17,20,4,12,47.88,'05:04:28','2020-11-19 10:04:28'),(18,20,7,12,59.88,'05:04:28','2020-11-19 10:04:28'),(19,21,17,4,19.96,'05:13:46','2020-11-19 10:13:46'),(20,21,15,4,19.96,'05:13:46','2020-11-19 10:13:46'),(21,21,10,4,59.96,'05:13:46','2020-11-19 10:13:46'),(22,21,3,4,27.96,'05:13:46','2020-11-19 10:13:46'),(23,21,1,4,59.96,'05:13:46','2020-11-19 10:13:46'),(24,21,4,4,15.96,'05:13:46','2020-11-19 10:13:46');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `reservation_id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_id` int unsigned NOT NULL,
  `number_of_people` int DEFAULT NULL,
  `customer_fullname` varchar(30) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_address` varchar(50) DEFAULT NULL,
  `customer_phone` varchar(10) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `reservation_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reservation_id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `table` (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,4,'Jimmy Fallon','jimmyfallon@gmail.com','America','0000000000','2020-11-10','20:00:00','2020-11-04 14:35:51'),(2,2,5,'Jimmy Kimmel','jimmykimmel@gmail.com','America','0000000001','2020-11-10','10:00:00','2020-11-04 14:35:51'),(3,3,6,'Nicole Kidman','nicolekidman@gmail.com','America','0000000002','2020-11-10','08:00:00','2020-11-04 14:35:51'),(4,4,7,'Bradley Cooper','bradleycooper@gmail.com','America','0000000003','2020-11-09','19:00:00','2020-11-04 14:35:51'),(5,5,8,'Ellen Degeneres','ellendegeneres@gmail.com','America','0000000004','2020-11-09','09:00:00','2020-11-04 14:35:51'),(6,6,9,'Stefani Joanne','stefanijoanne@gmail.com','America','0000000005','2020-11-09','07:00:00','2020-11-04 14:35:51'),(7,7,10,'Tom Cruise','tomcruise@gmail.com','America','0000000006','2020-11-08','18:00:00','2020-11-04 14:35:51'),(8,8,11,'Will Smith','willsmith@gmail.com','America','0000000007','2020-11-08','20:00:00','2020-11-04 14:35:51'),(9,9,12,'Cris Evan','crisevan@gmail.com','America','0000000009','2020-11-08','14:00:00','2020-11-04 14:35:51'),(10,10,13,'Cardi B','cardib@gmail.com','America','0000000010','2020-11-06','20:00:00','2020-11-04 14:35:51'),(11,5,14,'Brack Obama','brackobama@gmail.com','America','0000000011','2020-11-06','12:00:00','2020-11-04 14:35:51'),(12,3,9,'Dean Winchester','deanwinchester@gmail.com','Kansas, America','0000000111','2020-11-09','08:00:00','2020-11-05 11:04:01'),(13,2,9,'Sam Winchester','samwinchester@gmail.com','Kansas, America','0000000112','2020-11-06','09:00:00','2020-11-05 13:51:35'),(14,2,9,'John Legend','johnlegend@gmail.com','America','0000000115','2020-11-06','09:00:00','2020-11-05 13:53:32'),(15,3,11,'Lisa Kudrow','lisakudrow@gmail.com','Center Park,  America','0000000118','2020-11-11','11:00:00','2020-11-05 13:59:06'),(16,4,11,'David Schwimmer','davidschwimmer@gmail.com','Center Park, America','0000000116','2020-11-11','11:00:00','2020-11-05 14:00:09'),(17,3,12,'Jimmy Kimmel','jimmykimmel@gmail.com','America','0000000001','2020-11-12','12:00:00','2020-11-06 11:23:56'),(18,5,9,'Nhat Meng','nhatmeng@gmail.com','Nghe An Viet Nam','0231112222','2020-11-11','11:00:00','2020-11-09 05:32:16'),(19,5,16,'Dinh Quang','dinhquang@gmail.com','Hoang Mai, Ha Noi','0121213456','2020-11-12','12:00:00','2020-11-09 09:36:40'),(20,4,12,'Quach Dinh Quang','dinhquang@gmail.com','Vinh Hung, Hoang Mai, Ha Noi','0355764662','2020-11-24','09:00:00','2020-11-19 09:27:56'),(21,6,15,'Nguyen Vu Anh Tuan','nguyenvuanhtuan@gmail.com','Vinh Hung, Hoang Mai, Ha Noi','0355764663','2020-11-25','19:00:00','2020-11-19 10:12:59');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `table_id` int unsigned NOT NULL AUTO_INCREMENT,
  `maximum_of_people` int NOT NULL,
  `table_image` varchar(50) NOT NULL,
  `near_window` tinyint(1) NOT NULL,
  `table_price` decimal(10,2) DEFAULT NULL,
  `table_reg_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES (1,6,'table.jpg',1,9.99,'2020-11-04 14:18:30'),(2,9,'table1.jpg',0,8.99,'2020-11-04 14:18:30'),(3,12,'table2.jpg',1,9.99,'2020-11-04 14:18:30'),(4,15,'table3.jpg',0,8.99,'2020-11-04 14:18:30'),(5,18,'table4.jpg',1,9.99,'2020-11-04 14:18:30'),(6,15,'table3.jpg',0,8.99,'2020-11-04 14:18:30'),(7,12,'table2.jpg',1,9.99,'2020-11-04 14:18:30'),(8,9,'table1.jpg',0,8.99,'2020-11-04 14:18:30'),(9,6,'table.jpg',1,9.99,'2020-11-04 14:18:30'),(10,6,'table1.jpg',0,8.99,'2020-11-04 14:18:30');
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-25 15:44:46
