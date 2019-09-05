--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pswd` varchar(32) DEFAULT NULL,
  `admin_role` int(4) DEFAULT NULL,
  `full_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(60) DEFAULT NULL,
  `state` int(3) DEFAULT NULL,
  `country` int(3) DEFAULT NULL,
  `postal` varchar(9) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `password` varchar(256) DEFAULT NULL,
  `firstname` varchar(60) DEFAULT NULL,
  `lastname` varchar(60) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `updates_via_email` tinyint(1) NOT NULL DEFAULT 1,
  `updates_via_sms` tinyint(1) NOT NULL DEFAULT 0,
  `opt_in_newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `opt_in_third_party` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_addresses` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `customers_id` int(12) DEFAULT 0,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `street2` varchar(60) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(4) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `postal` varchar(10) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `email_cc` varchar(60) DEFAULT NULL,
  `tax_rate` int(4) DEFAULT 1,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `billing_addresses`
--

DROP TABLE IF EXISTS `billing_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_addresses` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `customers_id` int(12) DEFAULT 0,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `company` varchar(60) DEFAULT NULL,
  `street` varchar(60) DEFAULT NULL,
  `street2` varchar(60) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `province` varchar(4) DEFAULT NULL,
  `country` varchar(2) DEFAULT NULL,
  `postal` varchar(10) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `email_cc` varchar(60) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `billing_address` int(11) DEFAULT NULL,
  `shipping_address` int(11) DEFAULT NULL,
  `order_status` int(2) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `closed` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `css_class` varchar(24) DEFAULT NULL,
  `help_text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES 
(1,'New','info',NULL),
(2,'In Production','info',NULL),
(3,'Packaged','info',NULL),
(4,'Shipped','info',NULL),
(5,'On Hold','info',NULL),
(6,'Cancelled','info',NULL),
(7,'Returned','info',NULL),
(8,'Refunded','info',NULL);
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Table structure for table `tax_rate`
--

DROP TABLE IF EXISTS `tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tax_rate` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `province` varchar(4) DEFAULT NULL,
  `tax_identifier` varchar(7) DEFAULT NULL,
  `provincial_rate` float(6,3) DEFAULT 0,
  `federal_rate` float(6,3) DEFAULT 0,
  `total_rate` float(6,3) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('none','n/a',0,0,0);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('AB','GST',0,0.05,0.05);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('BC','GST+PST',0.07,0.05,0.12);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('MB','GST+PST',0.07,0.05,0.12);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('NB','HST',0.10,0.05,0.15);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('NL','HST',0.10,0.05,0.15);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('NS','HST',0.10,0.05,0.15);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('NT','GST',0,0.05,0.05);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('NU','GST',0,0.05,0.05);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('ON','HST',0.08,0.05,0.13);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('PE','HST',0.10,0.05,0.15);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('QC','GST+QST',9.975,0.05,0.14975);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('SK','GST+PST',0.06,0.05,0.11);
INSERT INTO tax_rate (province,tax_identifier,provincial_rate,federal_rate,total_rate) VALUES ('YT','GST',0,0.05,0.05);



