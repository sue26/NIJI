-- MySQL dump 10.13  Distrib 5.7.20, for macos10.12 (x86_64)
--
-- Host: localhost    Database: niji
-- ------------------------------------------------------
-- Server version	5.7.20

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
-- Current Database: `niji`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `niji` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `niji`;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `price1` varchar(50) DEFAULT NULL,
  `price2` varchar(50) DEFAULT NULL,
  `vege` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'1','Chicken Teriyaki','Grilled chicken breast with teriyaki sauce','8.95','lunch','','',0),(2,'2','Beef Teriyaki','Grilled striploin beef with teriyaki sauce','9.95','lunch',NULL,NULL,0),(3,'3','Salmon Teriyakoi','Grilled salmon steak with teriyaki sauce','9.95','lunch',NULL,NULL,0),(4,'4','Beef Bulgogi','Thinly marinated beef with special sauce','8.95','lunch',NULL,NULL,0),(5,'5','Spicy Chicken','Marinated white meat chicken with spicy sauce','9.95','lunch',NULL,NULL,0),(6,'6','B.B.Q. Galbi','Barbequed beef ribs marinated with special sauce','12.95','lunch',NULL,NULL,0),(7,'7','Don Katsu or Chicken Katsu','Deep fried pork or chicken cutlet with sauce','8.95','lunch',NULL,NULL,0),(8,'8','California Lunch','12pcs. California roll','8.95','lunch',NULL,NULL,2),(9,'9a','California + Tempura','6pcs. California roll with assorted tempura','8.95','lunch',NULL,NULL,0),(10,'9b','Veg. roll + Veg. Tempura','6pcs. vegetable roll with assorted vegetable tempura','8.95','lunch',NULL,NULL,1),(11,'10','Tempura Lunch','Deep fried shrimp tempura & assorted vegetables','8.95','lunch',NULL,NULL,2),(12,'11','Sushi Lunch','6pcs. roll & 4pcs. sushi','8.95','lunch',NULL,NULL,0),(13,'12a','Sushi + Tempura','5pcs. sushi with assorted tempura','11.95','lunch',NULL,NULL,0),(14,'12b','Sashimi + Tempura','9pcs. assorted sashimi with assorted tempura','14.95','lunch',NULL,NULL,0),(15,'13a','Assorted Sashimi Lunch','12pcs. assorted sashimi','13.95','lunch',NULL,NULL,0),(16,'13b','Salmon Sashimi Lunch','12pcs. salmon sashimi','13.95','lunch',NULL,NULL,0),(17,'15','Lunch Combination','Chicken Teriyaki, assorted tempura, 6pcs. California roll','11.95','lunch',NULL,NULL,0),(18,'1','Yaki Dumpling','Deep fried beef wontons','4.95','appetizer',NULL,NULL,0),(19,'2','Age Dashi Tofu','Deep fried bean curd with special sauce','4.95','appetizer',NULL,NULL,1),(20,'3','Assorted Tempura','Deep fried 2pcs shrimp, 2pcs yam, green bean, onion','6.95','appetizer',NULL,NULL,0),(21,'4','Vegetable Tempura','Deep fried assoted vegetables','5.95','appetizer',NULL,NULL,1),(22,'5','Ika Yaki','Barbequed squid with teriyaki sauce','6.95','appetizer',NULL,NULL,0),(23,'6','Mackerel','Grilled mackerel','8.95','appetizer',NULL,NULL,0),(24,'7','Edamame','Boiled soy beans seasoned with salt','4.95','appetizer',NULL,NULL,1),(25,'8','Calamari','Deep fried squid with Japanese sauce','6.95','appetizer',NULL,NULL,0),(26,'9','Yakitori','Chicken skewers with teriyaki sauce','7.95','appetizer',NULL,NULL,0),(27,'10','Soft Shell Crab','Deep fried soft shell crab with Japanese sauce','10.95','appetizer',NULL,NULL,0),(28,'11a','Vegetable Sushi Pizza','Crispy sushi rice topped with assoted vegetables','8.95','appetizer',NULL,NULL,1),(29,'11b','Salmon Sushi Pizza','Crispy sushi rice topped with salmon, avocado, tobiko and crabmeat','8.95','appetizer',NULL,NULL,0),(30,'11c','Tuna Sushi Pizza','Cripsy sushi rice topped with tuna, avocado, tobiko and crabmeat','10.95','appetizer',NULL,NULL,0),(31,'12','Sushi','6pcs maki & 4pcs sushi','8.95','appetizer',NULL,NULL,0),(32,'13','Salmon Sashimi','9pcs salmon','11.95','appetizer',NULL,NULL,0),(33,'14','Mixed Sashimi','9pcs assorted raw fish - salmon, tuna, snapper','11.95','appetizer',NULL,NULL,0),(34,'15','Japchae','Sweet potato noodle with vegetables','5.95','appetizer',NULL,NULL,1),(35,'16','Spring Rolls','4pcs','4.95','appetizer',NULL,NULL,1),(36,'17','Hand Roll Set','3pcs - Spicy salmon, Spicy tuna, California','11.95','appetizer',NULL,NULL,0),(37,'J1','SUSHI & MAKI','','','tray','','',NULL),(38,'J2','SUSHI, SASHIMI & MAKI','','','tray',NULL,NULL,NULL),(39,'J3','MAKI COMBO','','','tray',NULL,NULL,NULL),(40,'17','Miso Soup','Soy bean paste soup with green onions','1.50','soupNsalad',NULL,NULL,0),(41,'18','Gyoza Soup','Beef wonton soup with green onions','4.95','soupNsalad',NULL,NULL,0),(42,'19','Osumashi Soup','Clear soup with mussels, bean curds, green onions','4.95','soupNsalad',NULL,NULL,0),(43,'20','Rice Soup','','','soupNsalad','','',1),(44,'21','Green Salad','Garden fresh vegetables with Japanese dressing','4.95','soupNsalad',NULL,NULL,1),(45,'22','Avocado Salad','Avocados and garden fresh vegetables with Japanese dressing','6.95','soupNsalad',NULL,NULL,1),(46,'23','Sunomono Salad','Seafood with special dressing','5.95','soupNsalad',NULL,NULL,0),(47,'24','Wakame Salad','Leaf type seaweed with your choice of spicy or regular dressing','4.95','soupNsalad',NULL,NULL,1),(48,'25','Seasoned Seaweed Salad','Seasoned string type of seaweed salad with seasame seeds','4.95','soupNsalad',NULL,NULL,1),(49,'101','California','',NULL,'maki','4.95','3.95',0),(50,'102','Salmon','Sake',NULL,'maki','5.95','4.95',0),(51,'103','Tuna','Maguro',NULL,'maki','6.95','4.95',0),(52,'104','Spicy California','',NULL,'maki','6.95','4.95',0),(53,'105','Spicy Salmon','',NULL,'maki','6.95','4.95',0),(54,'106','Spicy Tuna','',NULL,'maki','6.95','4.95',0),(55,'107','Spicy Kani','',NULL,'maki','6.95','4.95',0),(56,'108','Spicy Scallop','',NULL,'maki','8.95','5.95',0),(57,'109','Salmon Skin','',NULL,'maki','4.95','3.95',0),(58,'110','Negi Toro','Tuna & green onions',NULL,'maki','5.95','4.95',0),(59,'111','Hamachi','Yellow Tail',NULL,'maki','6.95','4.95',0),(60,'123','Unagi','BBQ eel with avocado',NULL,'maki','8.95','4.95',0),(61,'124','BBQ Chicken','with cucumber & avocado',NULL,'maki','7.95','5.95',0),(62,'125','Kani','crabmeat',NULL,'maki','5.95','4.95',0),(63,'126','Tamago','Egg',NULL,'maki','4.95','3.95',1),(64,'127','Futo','Vegetables only, or crabmeat, vegetables, egg & tobiko','','maki','8.95','4.95',2),(65,'128','Alaska','8pcs. Salmon, tobiko, avocado, crabmeat & cucumber',NULL,'maki','8.95','4.95',0),(66,'129','Philadelphia','8pcs. Cooked salmon, cucumber, cream cheese, tobiko & avocado',NULL,'maki','9.95','4.95',0),(67,'130','Fresh Philadelphia','8pcs. Raw salmon, cucumber, cream cheese, tobiko & avocado',NULL,'maki','9.95','4.95',0),(68,'131','White Fish Tempura','8pcs. Deep fried white fish, tobiko, avocado & cucumber',NULL,'maki','9.95','4.95',0),(69,'132','Salmon Tempura','8pcs. Deep fried salmon, tobiko, avocado & cucumber',NULL,'maki','9.95','4.95',0),(70,'133','Rainbow','8pcs. Assorted fish on top of California roll',NULL,'maki','9.95','4.95',0),(71,'134','Spider','8pcs. Deep fried soft shell crab, avocado, cucumber & tobiko',NULL,'maki','12.95','5.95',0),(72,'135','Dynamite','8pcs. Shrimp tempura, avocado, cucumber & tobiko',NULL,'maki','8.95','5.95',0),(73,'136','Caterpillar','8pcs. Avocado on top of unagi roll',NULL,'maki','11.95','7.95',0),(74,'137','California Dragon','8pcs',NULL,'maki','8.95','-',0),(75,'138','Spicy Salmon Dragon','8pcs',NULL,'maki','9.95','-',0),(76,'139','Spicy Tuna Dragon','8pcs',NULL,'maki','9.95','-',0),(77,'140','Red Dragon','10pcs. Fresh salmon on top of Dynamite roll',NULL,'maki','12.95','-',0),(78,'141','Green Dragon Roll','10pcs. Avocado on top of Dynamite roll',NULL,'maki','12.95','-',0),(79,'142','Black Dragon','10pcs. Unagi on top of Dynamite roll',NULL,'maki','15.95','-',0),(80,'143','Black Dragon','Unagi on top and inside',NULL,'maki','16.95','-',0),(81,'144','Lobster Tail','',NULL,'maki','17.95','8.95',0),(82,'145','Crispy Roll','8pcs. Smoked salmon, shrimp tempura, crabmeat, avocado, cucumber & tobiko roll covered with tempura bits',NULL,'maki','14.95','-',0),(83,'146','Crunch Roll','Deep fried Dynamite roll',NULL,'maki','12.95','6.95',0),(84,'112','Cucumber','Kappa',NULL,'vegmaki','3.95','3.50',1),(85,'113','Avocado','',NULL,'vegmaki','5.95','3.95',1),(86,'114','Yam Tempura','',NULL,'vegmaki','4.95','2.95',1),(87,'115','Mushroom','',NULL,'vegmaki','4.95','2.95',1),(88,'116','Oshinko','Pickled radish',NULL,'vegmaki','3.95','2.95',1),(89,'117','Buttercup Squash','Deep fried',NULL,'vegmaki','4.95','2.95',1),(90,'118','Avocado & Cucumber','',NULL,'vegmaki','4.95','3.95',1),(91,'119','Avocado & Yam Tempura','',NULL,'vegmaki','7.95','4.95',1),(92,'120','Asparagus','with avocado and yam',NULL,'vegmaki','7.95','4.95',1),(93,'121','Spicy Vegetable','avocado & cucumber',NULL,'vegmaki','6.95','4.95',1),(94,'122','Vegetable Dragon','8pcs, Yam tempura base',NULL,'vegmaki','9.95','-',1),(112,NULL,'Salmon','Sake',NULL,'alacarte','4.95','5.95',0),(113,NULL,'Tuna','Maguro',NULL,'alacarte','5.95','6.95',0),(114,NULL,'Tai','Red Snapper',NULL,'alacarte','4.95','4.95',0),(115,NULL,'Hokigai','Surf Clam',NULL,'alacarte','4.95','5.95',0),(116,NULL,'Tako','Octopus',NULL,'alacarte','4.95','5.95',0),(117,NULL,'Ika','Squid',NULL,'alacarte','4.95','5.95',0),(118,NULL,'Ebi','Shrimp',NULL,'alacarte','4.95','5.95',0),(119,NULL,'Ama Ebi','Sweet Shrimp',NULL,'alacarte','5.95','6.95',0),(120,NULL,'Kani','Crab Meat',NULL,'alacarte','4.95','5.95',0),(121,NULL,'Hamachi','Yellow Tail',NULL,'alacarte','6.95','7.95',0),(122,NULL,'Saba','Mackerel',NULL,'alacarte','4.95','5.95',0),(123,NULL,'Unagi','Smoked Eel',NULL,'alacarte','7.00','9.00',0),(124,NULL,'Tobiko','Flying Fish Roe',NULL,'alacarte','4.95','5.95',0),(125,NULL,'Ikura','Salmon Roe',NULL,'alacarte','5.00','5.95',0),(126,NULL,'Tamago','Egg',NULL,'alacarte','4.95','5.95',1),(127,NULL,'Inari','Deep Fried Beancurd',NULL,'alacarte','4.95','5.95',1),(128,NULL,'Toro','Belly of Tuna',NULL,'alacarte','6.95','6.95',0),(129,NULL,'Unagi','Sea Urchin',NULL,'alacarte','Seasonal','',0),(130,NULL,'Only Salmon','20pcs','25.95','sashimi',NULL,NULL,0),(131,NULL,'Small','20pcs','25.95','sashimi',NULL,NULL,0),(132,NULL,'Medium','40pcs','49.95','sashimi',NULL,NULL,0),(133,NULL,'Large','60pcs','75.95','sashimi',NULL,NULL,0),(134,NULL,'X-Large','80pcs','99.95','sashimi',NULL,NULL,0),(135,'30','Chicken Teriyaki','Grilled chicken breast with teriyaki sauce','13.95','maindish',NULL,NULL,0),(136,'31','Beef Teriyaki','Grilled striploin beef with teriyaki sauce','16.95','maindish',NULL,NULL,0),(137,'32','Salmon Teriyaki','Grilled salmon steak with teriyaki sauce','15.95','maindish',NULL,NULL,0),(138,'35','Vegetable Teriyaki','Pan fried vegetables with teriyaki sauce','12.95','maindish',NULL,NULL,1),(139,'36','Spicy Chicken','Marinated spicy boneless chicken with spicy sauce','15.95','maindish',NULL,NULL,0),(140,'37','Bulgogi','Thinly sliced beef marinated with special sauce','15.95','maindish',NULL,NULL,0),(141,'38','Gal bi','Barbequed beef short ribs marinated with special sauce','25.95','maindish',NULL,NULL,0),(142,'39','Mackerel','Grilled mackerel','15.95','maindish',NULL,NULL,0),(143,'40','Don Katsu','Deep fried pork cutlet with sauce','14.95','maindish',NULL,NULL,0),(144,'41','Chicken Katsu','Deep fried chicken cutlet with sauce','14.95','maindish',NULL,NULL,0),(145,'43','Shrimp Tempura','Deep fried shrimp and vegetables','13.95','maindish',NULL,NULL,0),(146,'44','Vegetable Tempura','Lightly battered deep fried vegetables','12.95','maindish',NULL,NULL,1),(147,'46','Japchae','Sweet potato noodle with vegetables','12.95','maindish',NULL,NULL,1),(148,'48','Unagi Donburi','Barbequed eel with teriyaki sauce on white rice','16.95','maindish',NULL,NULL,0),(149,'49','Sashimi Donburi','Assorted fish & shredded garden vegetables on rice','13.95','maindish',NULL,NULL,0),(150,'50','Chirashi Sushi','Assorted sashimi on sushi rice','19.95','maindish',NULL,NULL,0),(151,'51','Stone Bowl Bibimbap','Shredded beef, assorted vegetables, fried egg, spicy sauce','12.95','maindish',NULL,NULL,2),(152,'52','Fried Rice','Pan fried rice with a choice of: Chicken, Beef, Shrimp or Vegetables','12.95','maindish',NULL,NULL,2),(153,'53','Yaki U-Dong','Pan fried thick noodle with vegetables','12.95','maindish',NULL,NULL,1),(154,'54','Wonton Soup + California Roll','Beef dumpling soup + 6pcs california roll','13.95','maindish',NULL,NULL,0),(155,'56','Nabe U-Dong + California Roll (6pcs)','Japanese style thick noodle in soup','12.95','maindish',NULL,NULL,2),(156,'57','Tempura U-Dong','Thick noodle in soup served with side of shrimp and vegetable tempura on the side','13.95','maindish',NULL,NULL,0),(157,'58','Seafood U-Dong + California Roll (6pcs)','Thick noodle soup with a variety of seafood in soup','13.95','maindish',NULL,NULL,0),(158,'59','Spicy Seafood U-Dong + California Roll (6pcs)','Spicy noodle soup with seafood and vegetables','14.95','maindish',NULL,NULL,0),(159,'72','Sapporo Sushi','7pcs sushi, 6pcs maki, 1pc handroll','15.95','sushidinner',NULL,NULL,0),(160,'73','Osaka Sushi','10pcs sushi, 3pcs cali, 3pcs sal maki','16.95','sushidinner',NULL,NULL,0),(161,'74','Maki Combo A','18pcs maki - California, Cucumber, Salmon. (substitution available for an extra charge)','14.95','sushidinner',NULL,NULL,0),(162,'76','Maki-Sashimi Combo','15pcs sashimi & 3pcs cali, 3pcs sal maki','19.95','sushidinner',NULL,NULL,0),(163,'77','Sashimi Dinner','15pcs assorted sashimi','17.95','sushidinner',NULL,NULL,0),(164,'78','Sushi-Sashimi Combo','12pcs sashimi & 8pcs sushi','24.95','sushidinner',NULL,NULL,0),(167,'88','Love Boat (For 2 people)','- 2 miso soup & 2 green salad\r\n- Assorted tempura\r\n- Beef bulgogi\r\n- 6pcs sushi, 9pcs sashimi\r\n- 6pcs california and 6pcs salmon maki','39.95','love','','',0),(168,'89','Family Boat (For 4 people)','- 4 miso soup & 4 green salad\r\n- Assorted tempura\r\n- Yaki dumplings\r\n- Beef bulgogi\r\n- 16pcs sushi, 12pcs sashimi\r\n- 24pcs maki','77.95','love','','',0),(169,'81','Bento #1','Salmon teriyaki\r\n6pcs California roll','15.95','bento','','',0),(170,'82','Bento #2','Beef bulgogi\r\n6pcs California roll\r\n6pcs Salmon roll','15.95','bento','','',0),(171,'83','Bento #3','Chicken teriyaki\r\nTempura\r\n6pcs California roll','15.95','bento','','',0),(172,'84','Bento #4','BBQ Eel on rice\r\n6pcs Salmon sashimi\r\n3pcs California roll\r\n3pcs Salmon roll','21.95','bento','','',0),(173,'85','Bento #5','Tempura\r\n10pcs sashimi\r\n3pcs California roll\r\n3pcs Salmon roll','20.95','bento','','',0),(174,'86','Bento #6','Tempura\r\n10pcs sushi\r\n3pcs California roll\r\n3pcs Salmon roll','19.95','bento','','',0),(175,'87','Bento #7','VEGETARIAN\r\n4pcs Inari sushi\r\nVegetable tempura\r\n6pcs Vegetable roll','14.95','bento','','',1),(176,'00','Speical Bento','12pcs sashimi\r\n5pcs sushi\r\n6pcs maki\r\nTempura\r\nSunomono salad','25.95','bento','','',0),(177,'100','Salad Roll','Seasoned seaweed, Avocado & cucumber',NULL,'vegmaki','6.95','4.95',1),(178,'147','Tuna Dragon','Fresh tuna on top of Dynamite roll',NULL,'maki','15.95',NULL,0),(179,'45','Tempura IroIro','5pcs shrimp, scallop, calamari, crabmeat and vegetables','17.95','maindish',NULL,NULL,0),(180,'75','Maki Combo B','Green dragon roll and Spicy salmon roll','19.95','sushidinner',NULL,NULL,0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`m_id`) REFERENCES `menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (2,'Small','2 - 3 Guests','40.00',37),(3,'Medium','5 - 6 Guests','55.00',37),(5,'Small','2 - 3 Guests','45.00',38),(6,'Medium','5 - 6 Guests','65.00',38),(7,'Large','','75.00',38),(8,'Medium','','60.00',39),(9,'Small','','3.95',43),(10,'Medium','','5.95',43),(11,'Large','','10.95',43),(13,'Large','','70.00',37);
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('nijisushi','niji111111');
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

-- Dump completed on 2018-02-20 20:54:51
