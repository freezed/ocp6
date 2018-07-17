-- MySQL dump 10.15  Distrib 10.0.35-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ocp6
-- ------------------------------------------------------
-- Server version	10.0.35-MariaDB-0+deb8u1

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `line1` varchar(30) NOT NULL,
  `line2` varchar(20) DEFAULT NULL,
  `zip` varchar(5) NOT NULL,
  `city` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'luke','lucky luke','grand rue','saloon','1000','Bourg-en-Bresse'),(2,'cachette','tintin','51, rue de la discretion','chut','2000','Laons'),(3,'moulinsart','Capitaine Haddock','Chateau','Moulinsart','3000','Moulins'),(4,'maison','Largo Winch','1, boulevard de la bourse','bat. B','4000','Dignes-les-bains'),(5,'hiver','Largo Winch','23, rue des Écrins','3ème étage','5000','Gap'),(6,'bureau','Gaston Lagaffe','72, rue du Puit','','6000','Nice'),(7,'village','Astérix','Centre village','','7000','Privas'),(8,'domicile','jesse custer','3, rue des prés','','8000','Charleville-Mézière'),(9,'domicile','claudia cristiani','51, place de la gare','','9000','Foix'),(10,'domicile','litteul kevin','82, rue du pont','','10000','Troyes'),(11,'domicile','bronsky proko','69, rue tabaga','','11000','Carcassonne'),(12,'napoli','napoli','16, rue fondriest','','12000','Rodez'),(13,'milano','milano','12, av, st jacques','','13000','Marseille'),(14,'torino','torino','105, avenue de geole','','14000','Caen'),(15,'roma','roma','65, bld de l\'hôtel de ville','','15000','Aurillac');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` mediumint(8) unsigned NOT NULL,
  `client_id` mediumint(8) unsigned NOT NULL,
  `restaurant_id` tinyint(3) unsigned NOT NULL,
  `invoice_num` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_basket_employee` (`employee_id`),
  KEY `fk_basket_client` (`client_id`),
  KEY `fk_basket_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_basket_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_basket_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_basket_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` VALUES (1,4,1,2,'18000001','2018-01-29','archive'),(2,2,2,1,'18000002','2028-01-30','archive'),(3,3,3,1,'18000003','2018-01-31','cancel'),(4,4,1,2,'18000004','2018-02-01','deliver'),(5,1,5,3,'18000005','2018-02-01','deliver'),(6,2,4,1,'18000006','2018-02-01','draft');
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_address_id` mediumint(8) unsigned NOT NULL,
  `billing_address_id` mediumint(8) unsigned NOT NULL,
  `phone_id` mediumint(8) unsigned NOT NULL,
  `1st_name` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password_sha2bin` binary(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_delivery_address` (`delivery_address_id`),
  KEY `fk_client_billing_address` (`billing_address_id`),
  KEY `fk_client_phone` (`phone_id`),
  CONSTRAINT `fk_client_billing_address` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_client_delivery_address` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_client_phone` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,1,1,1,'lucky','luke','luke@mail.fr','LuckyLuke',0xBBD263C97B74E91562E0610086B990919376394ACF9DE6A45D0247D213FAC3C4),(2,3,2,2,'tin','tin','tin@mail.fr','reporter',0x209315DBF4D49311750FE09C1453B10068C736A8102A7A7524DDE3AF910FE045),(3,5,4,3,'largo','winch','winch@mail.fr','superlargo',0xDD170EC6951EB724926951FA53A8EEDDB6B155F2FBE7A0547AED212F59461D5A),(4,6,6,4,'gaston','lagaffe','agaffe@mail.fr','menfin',0xEB340EABDB5006CA9FBE81EF8609AAA131FB436009C084045BB352377CEC2E96),(5,7,7,5,'ast','érix','asterix@mail.fr','asterixlegaulois',0xD93462C097F829ED7CC3469F4DCE513DB7E129540ACA8BC8F1709C9FFF08986E);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composition`
--

DROP TABLE IF EXISTS `composition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composition` (
  `pizza_id` tinyint(3) unsigned NOT NULL,
  `ingredient_id` tinyint(3) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`pizza_id`,`ingredient_id`),
  KEY `fk_composition_ingredient` (`ingredient_id`),
  CONSTRAINT `fk_composition_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_composition_pizza` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composition`
--

LOCK TABLES `composition` WRITE;
/*!40000 ALTER TABLE `composition` DISABLE KEYS */;
INSERT INTO `composition` VALUES (1,2,70),(1,3,40),(1,4,70),(1,11,60),(2,5,40),(2,6,1),(2,7,40),(2,11,60),(3,8,50),(3,9,70),(3,10,60),(3,11,60),(4,1,40),(4,11,60),(4,12,70),(4,13,60),(5,2,50),(5,3,60),(5,4,50),(5,11,60),(6,5,50),(6,6,1),(6,7,1),(6,11,60);
/*!40000 ALTER TABLE `composition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` mediumint(8) unsigned NOT NULL,
  `phone_id` mediumint(8) unsigned NOT NULL,
  `1st_name` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password_sha2bin` binary(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_employee_address` (`address_id`),
  KEY `fk_phone_employee` (`phone_id`),
  CONSTRAINT `fk_employee_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_phone_employee` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,8,9,'jesse','custer','custer@mail.fr','jcuster',0x00D8DE63CC119BB4FADA5735838955F2ED2ECFC6C1E46FA2EF32BF7FEDFD932D),(2,9,10,'claudia','cristiani','cristiani@mail.fr','ccristiani',0x7CBB1A8E4E8722B6530FCD5DD221A3AB1790AD3B3F6604F85AAB0D7B0B4B15FF),(3,10,11,'litteul','kevin','kevin@mail.fr','lkevin',0x8D787F4D4C5C51DD206A9BCAADDD00C4CCBDCA951FB249C8214EE0E9ED6122E8),(4,11,12,'bronsky','proko','proko@mail.fr','bproko',0xCB2D912B34FE7C74FCFF1E33A8ED0BB0850803492089AADD48DBBB21DF4B025A);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) NOT NULL,
  `unit` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'bœuf','g'),(2,'champigon','g'),(3,'emmental','g'),(4,'jambon','g'),(5,'mozzarella','g'),(6,'œuf','unité'),(7,'oignon','g'),(8,'parmesan','g'),(9,'olive','g'),(10,'origan','g'),(11,'pate','g'),(12,'poivrons','g'),(13,'tomate','g');
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `line_basket`
--

DROP TABLE IF EXISTS `line_basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `line_basket` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `basket_id` mediumint(8) unsigned NOT NULL,
  `pizza_id` tinyint(3) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL,
  `tax_rate100` decimal(6,2) NOT NULL,
  `unit_price_ex_tax` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_line_basket_basket` (`basket_id`),
  KEY `fk_line_basket_pizza` (`pizza_id`),
  CONSTRAINT `fk_line_basket_basket` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_line_basket_pizza` FOREIGN KEY (`pizza_id`) REFERENCES `pizza` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `line_basket`
--

LOCK TABLES `line_basket` WRITE;
/*!40000 ALTER TABLE `line_basket` DISABLE KEYS */;
INSERT INTO `line_basket` VALUES (1,1,5,2,5.50,8.50),(2,1,6,2,5.50,8.00),(3,2,5,1,5.50,8.50),(4,3,1,3,5.50,6.50),(5,4,2,1,5.50,7.00),(6,5,4,2,5.50,8.00),(7,5,3,2,5.50,7.50),(8,6,2,1,5.50,7.00),(9,6,5,3,5.50,8.50);
/*!40000 ALTER TABLE `line_basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_history`
--

DROP TABLE IF EXISTS `payment_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_history` (
  `payment_solution_id` tinyint(3) unsigned NOT NULL,
  `basket_id` mediumint(8) unsigned NOT NULL,
  `amount` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`payment_solution_id`,`basket_id`),
  KEY `fk_payment_history_basket` (`basket_id`),
  CONSTRAINT `fk_payment_history_basket` FOREIGN KEY (`basket_id`) REFERENCES `basket` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payment_history_payment_solution` FOREIGN KEY (`payment_solution_id`) REFERENCES `payment_solution` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_history`
--

LOCK TABLES `payment_history` WRITE;
/*!40000 ALTER TABLE `payment_history` DISABLE KEYS */;
INSERT INTO `payment_history` VALUES (1,1,33.00,'2018-01-29'),(1,2,8.50,'2028-01-30'),(1,3,19.50,'2018-01-31'),(1,4,7.00,'2018-02-01'),(1,5,31.00,'2018-02-01'),(1,6,32.50,'2018-02-01');
/*!40000 ALTER TABLE `payment_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_solution`
--

DROP TABLE IF EXISTS `payment_solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_solution` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_solution`
--

LOCK TABLES `payment_solution` WRITE;
/*!40000 ALTER TABLE `payment_solution` DISABLE KEYS */;
INSERT INTO `payment_solution` VALUES (1,'paypal');
/*!40000 ALTER TABLE `payment_solution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--

LOCK TABLES `phone` WRITE;
/*!40000 ALTER TABLE `phone` DISABLE KEYS */;
INSERT INTO `phone` VALUES (1,'0102030401'),(2,'0102030402'),(3,'0102030403'),(4,'0102030404'),(5,'0102030405'),(6,'0102030406'),(7,'0102030407'),(8,'0102030408'),(9,'0102030409'),(10,'0102030410'),(11,'0102030411'),(12,'0102030412');
/*!40000 ALTER TABLE `phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pizza` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `unit_price_ex_tax` decimal(6,2) DEFAULT NULL,
  `tax_rate100` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,'calzone',6.50,5.50),(2,'caprese',7.00,5.50),(3,'margarita',7.50,5.50),(4,'pino',8.00,5.50),(5,'reine',8.50,5.50),(6,'sorrentina',8.00,5.50);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `address_id` mediumint(8) unsigned NOT NULL,
  `phone_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_restaurant_address` (`address_id`),
  KEY `fk_restaurant_hone` (`phone_id`),
  CONSTRAINT `fk_restaurant_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_restaurant_hone` FOREIGN KEY (`phone_id`) REFERENCES `phone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,12,6,'napoli'),(2,13,7,'milano'),(3,14,8,'torino');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `ingredient_id` tinyint(3) unsigned NOT NULL,
  `restaurant_id` tinyint(3) unsigned NOT NULL,
  `quantity` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ingredient_id`,`restaurant_id`),
  KEY `fk_stock_restaurant` (`restaurant_id`),
  CONSTRAINT `fk_stock_ingredient` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredient` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_stock_restaurant` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES (1,1,255),(1,2,255),(1,3,255),(2,1,255),(2,2,0),(2,3,255),(3,1,255),(3,2,255),(3,3,255),(4,1,255),(4,2,255),(4,3,255),(5,1,255),(5,2,255),(5,3,255),(6,1,24),(6,2,16),(6,3,52),(7,1,255),(7,2,255),(7,3,255),(8,1,255),(8,2,255),(8,3,255),(9,1,255),(9,2,255),(9,3,255),(10,1,255),(10,2,255),(10,3,255),(11,1,255),(11,2,255),(11,3,255),(12,1,255),(12,2,255),(12,3,255),(13,1,255),(13,2,255),(13,3,255);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-17  1:47:04
