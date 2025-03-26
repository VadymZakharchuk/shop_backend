-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: node-shop
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('4930dfd2-d7ce-4f3c-ab50-120970c36ef5','d405f159faa1984c93f22335273834a7b4575bdb11cd5e2a44b40b6b08dba34a','2025-03-14 11:43:49.374','20250313141555_users_add_enum',NULL,NULL,'2025-03-14 11:43:49.286',1),('674ba501-8347-4994-bc6d-e807a7a5c589','3ff00775f786d87a5cec724cc6cf6bd8b0ee9db954fb1708d61a7f8428621ef5','2025-03-14 11:43:51.167','20250314114351_model_products',NULL,NULL,'2025-03-14 11:43:51.130',1),('6764e40f-6660-4900-96ec-6e849f088045','d9666dacfa8cec9629e27b9e78a572edc2291246b705eea9ba4613783c595ba1','2025-03-14 11:43:49.128','20250312093246_indexes_added',NULL,NULL,'2025-03-14 11:43:49.073',1),('dab8bf44-86a9-421f-8622-a6d8cb3fb6ea','89def1fe8cebf361a9b696a03dee934035189dd70c5422227e47a83d09f7aab8','2025-03-14 11:43:49.283','20250313132437_model_changes',NULL,NULL,'2025-03-14 11:43:49.133',1),('f0b3a47e-5708-4223-847e-7afc16a840a3','48f8532982e38d5c2861258a2a588f4609cb17e42985379b85cddb7622c08d53','2025-03-14 11:43:49.069','20250312092012_init',NULL,NULL,'2025-03-14 11:43:48.442',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Categories`
--

DROP TABLE IF EXISTS `Categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `level` varchar(45) DEFAULT 'A',
  `name_uk` varchar(191) DEFAULT NULL,
  `description_uk` text,
  `name_en` varchar(191) DEFAULT NULL,
  `description_en` text,
  `imageUrl` varchar(191) DEFAULT 'none',
  `level_len` int GENERATED ALWAYS AS (length(`level`)) VIRTUAL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categories`
--

LOCK TABLES `Categories` WRITE;
/*!40000 ALTER TABLE `Categories` DISABLE KEYS */;
INSERT INTO `Categories` (`id`, `level`, `name_uk`, `description_uk`, `name_en`, `description_en`, `imageUrl`) VALUES (1,'A','Одяг','Пропозиції одягу від нашого магазину','Closing','Clothing offers from our store','none'),(2,'AA','Футболки','Колекція футболок від нашого магазину','T-Shirts','Collection of t-shirts from our store','none'),(3,'AB','Шорти','Колекція шортів від нашого магазину','Shorts','Collection of shorts from our store','none'),(4,'AC','Кепки','Колекція кепок від нашого магазину','Caps','Collection of caps from our store','none'),(5,'B','Взуття','Пропозиції взуття від нашого магазину','Footwear','Footwear offers from our store','none'),(6,'BA','Жіноче','Колекція жіночого взуття від нашого магазину','Women','Women\'s shoe collection from our store','none'),(7,'BB','Чоловіче','Колекція чоловічого взуття від нашого магазину','Men','Men\'s shoe collection from our store','none'),(8,'BC','Дитяче','Колекція дитячого взуття від нашого магазину','Children','Collection of children\'s shoes from our store','none'),(9,'C','Сумки','Пропозиції сумок від нашого магазину','Bags','Bags offers from our store','none'),(10,'CA','Жіночі сумки','Колекція жіночих сумок від нашого магазину','Woman bags','Collection of woman\'s bags from our store','none'),(11,'CC','Юнісекс сумки','Колекція юнісекс сумок від нашого магазину','Unisex bags','Collection of unisex bags from our store','none'),(13,'Z','none','none','none','none','none');
/*!40000 ALTER TABLE `Categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colors`
--

DROP TABLE IF EXISTS `Colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_uk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'white',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colors`
--

LOCK TABLES `Colors` WRITE;
/*!40000 ALTER TABLE `Colors` DISABLE KEYS */;
INSERT INTO `Colors` VALUES (1,'немає','none','none'),(2,'бежевий','beige','/colors/Beige.png'),(3,'чорний','black','/colors/Black.png'),(4,'коричневий','brown','/colors/Brown.png'),(5,'бірюзовий','cyan','/colors/Cyan.png'),(6,'зелений','green','/colors/Green.png'),(7,'сірий','grey','/colors/Grey.png'),(8,'індиго','indigo','/colors/Indigo.png'),(9,'магента','magenta','/colors/Magenta.png'),(10,'оранжевий','orange','/colors/Orange.png'),(11,'рожевий','pink','/colors/Pink.png'),(12,'фіолетовий','purple','/colors/Purple.png'),(13,'червоний','red','/colors/Red.png'),(14,'фіалковий','violet','/colors/Violet.png'),(15,'білий','white','/colors/White.png'),(16,'жовтий','yellow','/colors/Yellow.png'),(17,'синій','blue','/colors/Blue.png');
/*!40000 ALTER TABLE `Colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderNo` varchar(45) DEFAULT NULL,
  `orderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `stockRef` int NOT NULL DEFAULT '1',
  `quantity` int DEFAULT NULL,
  `operStatus` enum('STOCK','SHOP','ORDERED','SOLD') DEFAULT 'STOCK',
  `operDate` datetime DEFAULT NULL,
  `userRef` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stockFK` (`stockRef`),
  KEY `userFK` (`userRef`),
  CONSTRAINT `stockFK` FOREIGN KEY (`stockRef`) REFERENCES `Stock` (`id`),
  CONSTRAINT `userFK` FOREIGN KEY (`userRef`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (2,'1','2025-03-19 10:40:33',1,1,'STOCK',NULL,NULL),(3,'2','2025-03-20 10:40:33',2,1,'ORDERED','2025-03-20 11:40:33',3),(4,'2','2025-03-20 10:40:33',3,1,'ORDERED','2025-03-20 11:40:33',3),(5,'2','2025-03-20 10:40:33',4,2,'ORDERED','2025-03-20 11:40:33',3),(6,'2','2025-03-20 10:40:33',5,2,'ORDERED','2025-03-20 11:40:33',3),(10,'3','2025-03-24 12:55:58',10,2,'ORDERED','2025-03-24 12:55:58',3),(11,'3','2025-03-24 12:55:58',11,2,'ORDERED','2025-03-24 12:55:58',3),(12,'3','2025-03-24 12:55:58',12,2,'ORDERED','2025-03-24 12:55:58',3);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_uk` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `name_en` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `description_uk` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_en` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `discount` double NOT NULL DEFAULT '0',
  `isNew` tinyint(1) NOT NULL DEFAULT '0',
  `isArchived` tinyint(1) NOT NULL DEFAULT '0',
  `colorRef` int NOT NULL,
  `categoryRef` int NOT NULL,
  `size` enum('XS','S','M','L','XL','XXL','XXXL') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'L',
  `sex` enum('MAN','WOMAN','UNISEX') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNISEX',
  `options` json NOT NULL,
  `imageUrl` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `indexNameUk` (`name_uk`,`name_en`),
  KEY `nameUk_idx` (`name_uk`) /*!80000 INVISIBLE */,
  KEY `colorFK_idx` (`colorRef`),
  KEY `categoryFK_idx` (`categoryRef`),
  CONSTRAINT `categoryFK` FOREIGN KEY (`categoryRef`) REFERENCES `Categories` (`id`),
  CONSTRAINT `colorFK` FOREIGN KEY (`colorRef`) REFERENCES `Colors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Products`
--

LOCK TABLES `Products` WRITE;
/*!40000 ALTER TABLE `Products` DISABLE KEYS */;
INSERT INTO `Products` VALUES (1,'футболка чорна','black t-shirt','футболка чорна','black t-shirt',500,80,1,0,3,2,'M','UNISEX','{}',NULL),(2,'футболка біла','white t-shirt','футболка біла','white t-shirt',550,80,0,0,15,2,'M','UNISEX','{}',NULL),(3,'футболка жовта','yellow t-shirt','футболка жовта','yellow t-shirt',600,80,0,0,16,2,'M','UNISEX','{}',NULL),(4,'футболка червона','red t-shirt','футболка червона','red t-shirt',550,50,0,0,13,2,'M','UNISEX','{}',NULL),(5,'none','none','none','none',0,0,0,1,1,13,'S','UNISEX','{}',NULL),(6,'футболка чорна','black t-shirt','футболка чорна','black t-shirt',500,80,1,0,3,2,'L','UNISEX','{}',NULL),(7,'футболка чорна','black t-shirt','футболка чорна','black t-shirt',500,80,1,0,3,2,'M','UNISEX','{}',NULL),(8,'футболка біла','white t-shirt','футболка біла','white t-shirt',550,80,0,0,15,2,'L','UNISEX','{}',NULL),(9,'футболка біла','white t-shirt','футболка біла','white t-shirt',550,80,0,0,15,2,'XL','UNISEX','{}',NULL),(10,'футболка жовта','yellow t-shirt','футболка жовта','yellow t-shirt',600,80,0,0,16,2,'L','UNISEX','{}',NULL),(11,'футболка жовта','yellow t-shirt','футболка жовта','yellow t-shirt',600,80,0,0,16,2,'XL','UNISEX','{}',NULL),(13,'футболка червона','red t-shirt','футболка червона','red t-shirt',550,50,0,0,13,2,'XL','UNISEX','{}',NULL),(14,'футболка синя','blue t-shirt','футболка синя','blue t-shirt',500,0,0,0,17,2,'L','UNISEX','{}',NULL),(15,'футболка синя','blue t-shirt','футболка синя','blue t-shirt',500,0,0,0,17,2,'XL','UNISEX','{}',NULL),(16,'футболка бежева','beige t-shirt','футболка бежева','beige t-shirt',550,80,1,0,2,2,'M','UNISEX','{}',NULL),(17,'футболка бежева','beige t-shirt','футболка бежева','beige t-shirt',550,80,0,0,2,2,'M','UNISEX','{}',NULL),(18,'футболка бежева','beige t-shirt','футболка бежева','beige t-shirt',550,80,0,0,2,2,'M','UNISEX','{}',NULL),(19,'футболка бежева','beige t-shirt','футболка бежева','beige t-shirt',550,50,0,0,2,2,'M','UNISEX','{}',NULL),(20,'футболка оранжева','orange t-shirt','футболка оранжева','orange t-shirt',500,0,0,0,10,2,'L','UNISEX','{}',NULL),(21,'футболка оранжева','orange t-shirt','футболка оранжева','orange t-shirt',500,80,1,0,10,2,'L','UNISEX','{}',NULL),(22,'футболка оранжева','orange t-shirt','футболка оранжева','orange t-shirt',500,80,1,0,10,2,'L','UNISEX','{}',NULL),(23,'футболка оранжева','orange t-shirt','футболка оранжева','orange t-shirt',550,80,0,0,10,2,'L','UNISEX','{}',NULL),(24,'футболка бірюзова','cyan t-shirt','футболка бірюзова','cyan t-shirt',600,80,0,0,5,2,'M','UNISEX','{}',NULL),(25,'футболка бірюзова','cyan t-shirt','футболка бірюзова','cyan t-shirt',600,80,0,0,5,2,'M','UNISEX','{}',NULL),(26,'футболка бірюзова','cyan t-shirt','футболка бірюзова','cyan t-shirt',550,80,0,0,5,2,'S','UNISEX','{}',NULL),(27,'футболка бірюзова','cyan t-shirt','футболка бірюзова','cyan t-shirt',550,50,0,0,5,2,'S','UNISEX','{}',NULL),(28,'футболка сіра','grey t-shirt','футболка сіра','grey t-shirt',550,50,0,0,7,2,'XL','UNISEX','{}',NULL),(29,'футболка сіра','grey t-shirt','футболка сіра','grey t-shirt',500,0,0,0,7,2,'L','UNISEX','{}',NULL),(30,'футболка сіра','grey t-shirt','футболка сіра','grey t-shirt',550,0,0,0,7,2,'XL','UNISEX','{}',NULL),(31,'кепка чорна Сучій пес','black cap Sychiy pes','кепка чорна Сучій пес','black cap Sychiy pes',590,90,1,0,3,4,'XL','UNISEX','{}','null');
/*!40000 ALTER TABLE `Products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stock`
--

DROP TABLE IF EXISTS `Stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productRef` int NOT NULL DEFAULT '5',
  `supplierRef` int NOT NULL DEFAULT '1',
  `docName` varchar(45) DEFAULT 'Видаткова накладна',
  `docNo` varchar(45) DEFAULT '1',
  `docDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countStock` int NOT NULL DEFAULT '0',
  `docPrice` float NOT NULL DEFAULT '0',
  `docTotal` float GENERATED ALWAYS AS ((`countStock` * `docPrice`)) VIRTUAL,
  `countShop` int DEFAULT '0',
  `countOrdered` int DEFAULT '0',
  `countSold` int DEFAULT '0',
  `lastUpdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `primaryNDX` (`productRef`),
  KEY `fkSupplier_idx` (`supplierRef`),
  CONSTRAINT `fkProduct` FOREIGN KEY (`productRef`) REFERENCES `Products` (`id`),
  CONSTRAINT `fkSupplier` FOREIGN KEY (`supplierRef`) REFERENCES `Suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stock`
--

LOCK TABLES `Stock` WRITE;
/*!40000 ALTER TABLE `Stock` DISABLE KEYS */;
INSERT INTO `Stock` (`id`, `productRef`, `supplierRef`, `docName`, `docNo`, `docDate`, `countStock`, `docPrice`, `countShop`, `countOrdered`, `countSold`, `lastUpdated`) VALUES (1,5,1,'empty','empty','2025-03-19 09:40:27',5,10,0,0,0,'2025-03-19 09:40:27'),(2,1,1,'Видаткова накладна','АВ-1','2025-03-20 00:00:00',4,500,1,0,0,'2025-03-20 07:27:25'),(3,2,2,'Видаткова накладна','PUMA-11','2025-03-20 00:00:00',4,1000,1,0,0,'2025-03-20 08:32:02'),(4,3,2,'Видаткова накладна','PUMA-11','2025-03-20 00:00:00',3,1000,2,0,0,'2025-03-20 08:32:02'),(5,4,2,'Видаткова накладна','PUMA-11','2025-03-20 00:00:00',5,1000,4,0,0,'2025-03-20 08:32:02'),(6,11,2,'Видаткова накладна','PUMA-11','2025-03-20 00:00:00',5,1000,0,0,0,'2025-03-20 08:32:02'),(7,10,2,'Видаткова накладна','PUMA-11','2025-03-20 09:20:19',5,1000,0,0,0,'2025-03-20 09:20:19'),(8,13,2,'Видаткова накладна','PUMA-12','2025-03-20 09:20:27',5,1000,0,0,0,'2025-03-20 09:20:27'),(9,14,2,'Видаткова накладна','PUMA-12','2025-03-20 09:20:32',5,1000,0,0,0,'2025-03-20 09:20:32'),(10,20,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',3,1000,0,2,0,'2025-03-24 08:58:59'),(11,21,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',3,1000,0,2,0,'2025-03-24 08:58:59'),(12,22,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',3,1000,0,2,0,'2025-03-24 08:58:59'),(13,23,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',5,1000,0,0,0,'2025-03-24 08:58:59'),(14,24,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',5,1000,0,0,0,'2025-03-24 08:58:59'),(15,25,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',5,1000,0,0,0,'2025-03-24 08:58:59'),(16,26,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',5,1000,0,0,0,'2025-03-24 08:58:59'),(17,27,3,'Видаткова накладна','KAPPA-1','2025-03-24 09:20:32',5,1000,0,0,0,'2025-03-24 08:58:59');
/*!40000 ALTER TABLE `Stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Suppliers`
--

DROP TABLE IF EXISTS `Suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `contact` varchar(45) DEFAULT NULL,
  `eMail` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `messenger` enum('VIBER','WHATSAPP','TELEGRAM','OTHER') DEFAULT NULL,
  `messengerId` varchar(45) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Suppliers`
--

LOCK TABLES `Suppliers` WRITE;
/*!40000 ALTER TABLE `Suppliers` DISABLE KEYS */;
INSERT INTO `Suppliers` VALUES (1,'empty','empty','empty','empty','empty','OTHER','empty','empty'),(2,'PUMA SE','PUMA WAY 1\n91074 Herzogenaurach, GERMANY',NULL,'info@puma.com','+49 - 9132 - 81 - 0','OTHER','empty','empty'),(3,'KAPPA S.r.l.','Largo Maurizio Vitale 1 - 10152 Torino ITALY','empty','info@kappa.com','+39  01126171 ','OTHER','empty','empty');
/*!40000 ALTER TABLE `Suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `countOrders` int NOT NULL DEFAULT '0',
  `countVisits` int NOT NULL DEFAULT '0',
  `role` enum('ADMIN','CLIENT','GUEST','SELLER') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'GUEST',
  `address` json NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Users_email_key` (`email`),
  UNIQUE KEY `Users_phone_key` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Vadym Zakharchuk','vadym.zakharchuk@gmail.com','380502438030','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,0,'ADMIN','{\"city\": \"Kyiv\", \"region\": \"Kyiv\", \"street\": \"0.Balsaque Str.\", \"country\": \"Ukraine\", \"building\": \"77\", \"apartment\": \"171\", \"newPostNo\": \"221\"}'),(2,'Artem Zakharchuk','artem.zakharchuk@gmail.com','380501112233','',0,0,'SELLER','{\"city\": \"Kyiv\", \"region\": \"Kyiv\", \"street\": \"Liskivska Str.\", \"country\": \"Ukraine\", \"building\": \"14\", \"apartment\": \"117\", \"newPostNo\": \"221\"}'),(3,'Daryna Stadnik','daryna.stadnik@gmail.com','380504445566','',0,0,'CLIENT','{\"city\": \"Kyiv\", \"region\": \"Kyiv\", \"street\": \"Vygovskogo Blv.\", \"country\": \"Ukraine\", \"building\": \"24-B\", \"apartment\": \"32\", \"newPostNo\": \"117\"}'),(5,'','v@z.ua','381112223344','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',0,0,'CLIENT','{\"country\": \"Ukraine\"}');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'node-shop'
--
/*!50003 DROP FUNCTION IF EXISTS `nextOrderNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `nextOrderNo`() RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE maxOrderNo INT;
SELECT max(orderNo) FROM `node-shop`.orders into maxOrderNo;
RETURN maxOrderNo + 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `updateStock` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `updateStock`(idStock INT, quantity INT, statusItem VARCHAR(10)) RETURNS tinyint(1)
    READS SQL DATA
    DETERMINISTIC
BEGIN

SELECT id, countStock, countShop, countSold, countOrdered 
	FROM `node-shop`.`Stock` 
	WHERE id=idStock 
	INTO @id, @stock, @shop, @sold, @ordered;
CASE statusItem
	WHEN 'STOCK' THEN
		UPDATE `node-shop`.`Stock` SET countStock = @stock + quantity WHERE id=idStock;
	WHEN 'SHOP' THEN
		IF @stock - quantity >= 0 THEN UPDATE `node-shop`.`Stock` SET countStock = @stock - quantity, countShop= @shop + quantity WHERE id=idStock;
        END IF;
	WHEN 'ORDERED' THEN
		IF @shop - quantity > 0 THEN UPDATE `node-shop`.`Stock` SET countOrdered = @shop - quantity, countOrdered= @ordered + quantity WHERE id=idStock;
        END IF;
	WHEN 'SOLD' THEN
		IF @ordered - quantity > 0 THEN UPDATE `node-shop`.`Stock` SET countOrdered = @ordered - quantity, countSold= @sold + quantity WHERE id=idStock;
        END IF;
END CASE;        
RETURN true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verifyItemUpdateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `verifyItemUpdateStatus`(
	itemStockId INT, 
	itemsCount INT, 
	newStatus VARCHAR(10),
    operMode INT
) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE procMode BOOLEAN DEFAULT TRUE;
    DECLARE isValid INT DEFAULT 1;
        
	SELECT productRef, countStock, countShop, countOrdered, countSold 
		FROM `node-shop`.Stock 
		WHERE id = itemStockId
		INTO @stockProduct, @countStock, @countShop, @countOrdered, @countSold;
    
	IF operMode = 1 THEN 
			CASE newStatus
				WHEN 'SHOP' THEN
					IF itemsCount > @countStock THEN
						SET isValid = 0;
					END IF;
				WHEN 'ORDERED' THEN
					IF itemsCount > @countStock THEN
						SET isValid = 0;
					END IF;
				WHEN 'SOLD' THEN
					IF itemsCount > @countOrdere THEN
						SET isValid = 0;
					END IF;
				ELSE BEGIN END;
			END CASE;
     ELSE
			CASE newStatus
				WHEN 'SHOP' THEN
					IF itemsCount > @countShop THEN
						SET isValid = 0;
					END IF;
				WHEN 'ORDERED' THEN
					IF itemsCount > @countOrdered THEN
						SET isValid = 0;
					END IF;
				WHEN 'SOLD' THEN
					IF itemsCount > @countSold THEN
						SET isValid = 0;
					END IF;
				ELSE BEGIN END;
			END CASE;		
	  END IF;	
	RETURN isValid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verifyOrderUpdateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `verifyOrderUpdateStatus`(orderNumber INT, newStatus VARCHAR(10)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
 DECLARE Tid INT;
    DECLARE TorderNo INT;
    DECLARE TorderDate DATETIME;
    DECLARE TstockRef INT;
    DECLARE Tquantity INT;
    DECLARE ToperStatus VARCHAR(10);
    DECLARE ToperDate DATETIME;
    DECLARE TuserRef INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE verified INT DEFAULT 0;
    
	DECLARE cursor1 CURSOR FOR SELECT * FROM `node-shop`.Orders WHERE orderNo = orderNumber;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cursor1;
    read_loop1: LOOP
		FETCH cursor1 INTO Tid, TorderNo, TorderDate, TstockRef, Tquantity, ToperStatus, ToperDate, TuserRef;
        IF done THEN
		  LEAVE read_loop1;
		END IF;
        SELECT id, countStock, countShop, countSold, countOrdered, productRef 
			FROM `node-shop`.`Stock` 
			WHERE id=TstockRef 
			INTO @id, @stock, @shop, @sold, @ordered, @productRef;
		CASE newStatus
			WHEN 'SHOP' THEN
				IF Tquantity >= @stock THEN 
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
			WHEN 'ORDERED' THEN
				IF Tquantity >= @shop THEN 			
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
			WHEN 'SOLD' THEN
				IF Tquantity >= @ordered THEN 
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
		END CASE;
	END LOOP;
    
	CLOSE cursor1;
RETURN verified;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `verifyUpdateStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `verifyUpdateStatus`(orderNumber INT, newStatus VARCHAR(10)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
 DECLARE Tid INT;
    DECLARE TorderNo INT;
    DECLARE TorderDate DATETIME;
    DECLARE TstockRef INT;
    DECLARE Tquantity INT;
    DECLARE ToperStatus VARCHAR(10);
    DECLARE ToperDate DATETIME;
    DECLARE TuserRef INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE verified INT DEFAULT 0;
    
	DECLARE cursor1 CURSOR FOR SELECT * FROM `node-shop`.Orders WHERE orderNo = orderNumber;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cursor1;
    read_loop1: LOOP
		FETCH cursor1 INTO Tid, TorderNo, TorderDate, TstockRef, Tquantity, ToperStatus, ToperDate, TuserRef;
        IF done THEN
		  LEAVE read_loop1;
		END IF;
        SELECT id, countStock, countShop, countSold, countOrdered, productRef 
			FROM `node-shop`.`Stock` 
			WHERE id=TstockRef 
			INTO @id, @stock, @shop, @sold, @ordered, @productRef;
		CASE newStatus
			WHEN 'SHOP' THEN
				IF Tquantity >= @stock THEN 
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
			WHEN 'ORDERED' THEN
				IF Tquantity >= @shop THEN 			
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
			WHEN 'SOLD' THEN
				IF Tquantity >= @ordered THEN 
					BEGIN
						SET verified = @productRef;
                        LEAVE read_loop1;
                    END;
				END IF;
		END CASE;
	END LOOP;
    
	CLOSE cursor1;
RETURN verified;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `debug_msg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `debug_msg`(msg VARCHAR(255))
BEGIN
    select concat('** ', msg) AS '** ERROR:';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nextOrderNo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `nextOrderNo`()
BEGIN
	DECLARE maxOrderNo INT;
	SELECT max(orderNo) FROM `node-shop`.orders into maxOrderNo;
	SELECT concat(maxOrderNo) AS 'order_no';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `test-json` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `test-json`(json TEXT)
BEGIN
	DECLARE products VARCHAR(4000);
	SET @i = 0;
	SET @res = 0;
	  
	SELECT json INTO products;

	WHILE @i < JSON_LENGTH(products) DO
		SELECT JSON_EXTRACT(products,CONCAT('$[',@i,']')) INTO @product;
		SELECT @product.quantity INTO @q;
        SET @res = @res + @q;
		SELECT @i + 1 INTO @i;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testJson` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `testJson`(jsonSource TEXT, procedureMode BOOLEAN)
BEGIN
	DECLARE items, item VARCHAR(4000);
    DECLARE procMode BOOLEAN DEFAULT TRUE;
    DECLARE result VARCHAR(200) DEFAULT '';
	SET @i = 0;
	SET @isValid = TRUE;
	SET procMode = IFNULL(procedureMode, TRUE);
    
	SELECT jsonSource INTO items;
	WHILE @i < JSON_LENGTH(items) DO
		SELECT JSON_EXTRACT(items,CONCAT('$[',@i,']')) INTO item;
        SELECT JSON_EXTRACT(item, '$.stockRef') INTO @stockId;
        SELECT JSON_EXTRACT(item, '$.quantity') INTO @quantity;
        SELECT JSON_EXTRACT(item, '$.status') INTO @newStatus;

		SET @isValid = verifyItemUpdateStatus(@stockId, @quantity, @newStatus, procMode);
        SET result = CONCAT(result, ',', @isValid);
        
		SELECT @i + 1 INTO @i;
	END WHILE;
    SELECT SUBSTRING(result, 2);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateItemStockStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `updateItemStockStatus`(
	itemOrderId INT,
	itemStockId INT, 
	itemsCount INT, 
	newStatus VARCHAR(10), 
	procedureMode BOOLEAN)
MAIN_LABEL:BEGIN
	DECLARE procMode BOOLEAN DEFAULT TRUE;
	DECLARE isValid BOOLEAN DEFAULT TRUE;
    
    SET procMode = IFNULL(procedureMode, TRUE);
    IF procMode = TRUE THEN 
		SET isValid = verifyItemUpdateStatus(itemStockId, itemsCount, newStatus, procMode);
		IF isValid = FALSE THEN
			BEGIN
				CALL debug_msg(CONCAT('Can\'t change status. Quantity of stock ID:: ', itemStockId, ' :: isn\'t enought to complete operation')); 
				LEAVE MAIN_LABEL;
			END;
		END IF;
    END IF;    
    
    SELECT id, orderNo, stockRef, quantity, operStatus
		FROM `node-shop`.Orders
        WHERE id = itemOrderId
        INTO @id, @orderNo, @orderStockRef, @orderQuantity, @orderStatus;
        
	SELECT productRef, countStock, countShop, countOrdered, countSold 
		FROM `node-shop`.Stock 
		WHERE id = itemStockId
		INTO @product, @stock, @shop, @ordered, @sold;
    
    IF procMode = TRUE THEN
			CASE newStatus
				WHEN 'SHOP' THEN
					UPDATE `node-shop`.`Stock` 
					SET countShop = @shop + itemsCount, countStock = @stock - itemsCount 
					WHERE id = itemStockId;
				WHEN 'ORDERED' THEN
					UPDATE `node-shop`.`Stock` 
					SET countOrdered = @ordered + itemsCount, countShop = @shop - itemsCount 
					WHERE id = itemStockId;   
					UPDATE `node-shop`.`Orders` 
					SET quantity = @orderQuantity + itemsCount 
					WHERE id = @id;
				ELSE
                    BEGIN
                    END;
			END CASE;
    ELSE
			CASE newStatus
				WHEN 'SHOP' THEN
					UPDATE `node-shop`.`Stock` 
					SET countShop = @shop - itemsCount, countStock = @stick + itemsCount 
					WHERE id = itemStockId;
				WHEN 'ORDERED' THEN
					UPDATE `node-shop`.`Stock` 
					SET countOrdered = @ordered - itemsCount, countShop = @shop + itemsCount 
					WHERE id = itemStockId;
                    IF @orderQuantity - itemsCount > 0 THEN
						UPDATE `node-shop`.`Orders` 
						SET quantity = @orderQuantity - itemsCount 
						WHERE id = @id;
                    ELSE
						DELETE FROM `node-shop`.`Orders`
                        WHERE id = @id
                        LIMIT 1;
                    END IF;
				ELSE
                    BEGIN
                    END;                    
			END CASE;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateOrderStockStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `updateOrderStockStatus`(orderNumber INT, newStatus VARCHAR(10), procedureMode BOOLEAN)
MAIN_LABEL:BEGIN
    DECLARE Tid INT;
    DECLARE TorderNo INT;
    DECLARE TorderDate DATETIME;
    DECLARE TstockRef INT;
    DECLARE Tquantity INT;
    DECLARE ToperStatus VARCHAR(10);
    DECLARE ToperDate DATETIME;
    DECLARE TuserRef INT;
	DECLARE done INT DEFAULT FALSE;
	DECLARE verified INT DEFAULT TRUE;
    DECLARE procMode BOOLEAN DEFAULT TRUE;
	DECLARE cursor1 CURSOR FOR SELECT * FROM `node-shop`.Orders WHERE orderNo = orderNumber;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    SET procMode = IFNULL(procedureMode, TRUE);
    IF procMode = TRUE THEN 
		SET verified = verifyOrderUpdateStatus(orderNumber, newStatus);
		IF verified > 0 THEN
			BEGIN
				CALL debug_msg(CONCAT('Can\'t change status. Quantity of product ID:: ', verified, ' :: isn\'t enought to complete operation'));
				LEAVE MAIN_LABEL;
			END;
		END IF;
    END IF;
    
	OPEN cursor1;
    read_loop: LOOP
		FETCH cursor1 INTO Tid, TorderNo, TorderDate, TstockRef, Tquantity, ToperStatus, ToperDate, TuserRef;
        IF done THEN
		  LEAVE read_loop;
		END IF;
        
        SELECT id, countStock, countShop, countSold, countOrdered, productRef 
			FROM `node-shop`.`Stock` 
			WHERE id=TstockRef 
			INTO @id, @stock, @shop, @sold, @ordered, @productRef;
        IF procMode = TRUE THEN     
			CASE newStatus
				WHEN 'STOCK' THEN
					UPDATE `node-shop`.`Stock` 
					SET countStock = @stock + Tquantity 
					WHERE id=TstockRef;
				WHEN 'SHOP' THEN
					UPDATE `node-shop`.`Stock` 
					SET countStock = @stock - Tquantity, countShop= @shop + Tquantity 
					WHERE id=TstockRef;
				WHEN 'ORDERED' THEN
					UPDATE `node-shop`.`Stock` 
					SET countShop = @shop - Tquantity, countOrdered= @ordered + Tquantity 
					WHERE id=TstockRef;
				WHEN 'SOLD' THEN
					UPDATE `node-shop`.`Stock` 
					SET countOrdered = @ordered - Tquantity, countSold= @sold + Tquantity 
					WHERE id=TstockRef;
			END CASE;
            UPDATE `node-shop`.`Orders` 
			SET operStatus = newStatus 
			WHERE id = Tid;
        ELSE
			CASE newStatus
				WHEN 'SHOP' THEN
					UPDATE `node-shop`.`Stock` 
					SET countShop = @shop - Tquantity, countStock= @stock + Tquantity 
					WHERE id=TstockRef;
				WHEN 'ORDERED' THEN
					UPDATE `node-shop`.`Stock` 
					SET countOrdered = @ordered - Tquantity, countShop= @shop + Tquantity 
					WHERE id=TstockRef;
				WHEN 'SOLD' THEN
					UPDATE `node-shop`.`Stock` 
					SET countSoldp = @sold - Tquantity, countShop= @shop + Tquantity 
					WHERE id=TstockRef;  
				ELSE
					BEGIN
						CALL debug_msg(CONCAT('Status is missed in case list'));
						LEAVE read_loop;
                    END;
            END CASE;
            IF newStatus = 'SHOP' THEN
				UPDATE `node-shop`.`Orders` SET operStatus = 'STOCK' WHERE id = Tid;
            ELSE
				UPDATE `node-shop`.`Orders` SET operStatus = 'SHOP' WHERE id = Tid;
			END IF;
        END IF;

	END LOOP;
    
	CLOSE cursor1;
    CALL debug_msg('Success');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifyStockUpdates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `verifyStockUpdates`(jsonSource TEXT, procedureMode INT)
BEGIN
	DECLARE items, item VARCHAR(4000);
    DECLARE result VARCHAR(200) DEFAULT '';
    DECLARE isValid BOOLEAN DEFAULT TRUE;
	SET @i = 0;
    SET @isValid = 1;
    
	SELECT jsonSource INTO items;
	WHILE @i < JSON_LENGTH(items) DO
		SELECT JSON_EXTRACT(items,CONCAT('$[',@i,']')) INTO item;
        SELECT JSON_EXTRACT(item, '$.stockRef') INTO @stockId;
        SELECT JSON_EXTRACT(item, '$.quantity') INTO @quantity;
        SELECT JSON_EXTRACT(item, '$.operStatus') INTO @statusRaw;
	
		SET @newStatus = REGEXP_REPLACE(@statusRaw, '\\"', '');
		
		SELECT countStock, countShop, countOrdered, countSold 
			FROM `node-shop`.Stock 
			WHERE id = @stockId
			INTO @countStock, @countShop, @countOrdered, @countSold;  
            
		IF procedureMode = 1 THEN
			CASE @newStatus
				WHEN 'SHOP' THEN
					IF @quantity > @countStock THEN
						SET @isValid = 0;
					END IF;
				WHEN 'ORDERED' THEN
					IF @quantity > @countStock THEN
						SET @isValid = 0;
					END IF;
				WHEN 'SOLD' THEN
					IF @quantity > @countOrdere THEN
						SET @isValid = 0;
					END IF;
				ELSE 
					BEGIN 
						SELECT "MODE:1 ELSE WORKS";
					END;
			END CASE;
		ELSE
			CASE @newStatus
				WHEN 'SHOP' THEN
					IF @quantity > @countShop THEN
						SET @isValid = 0;
					END IF;
				WHEN 'ORDERED' THEN
					IF @quantity > @countOrdered THEN
						SET @isValid = 0;
					END IF;
				WHEN 'SOLD' THEN
					IF @quantity > @countSold THEN
						SET @isValid = 0;
					END IF;
				ELSE 
					BEGIN 
						SELECT "MODE:0 ELSE WORKS";
					END;
			END CASE;		
		END IF;     
        SET result = CONCAT(result, ',', @isValid);
		SELECT @i + 1 INTO @i;
	END WHILE;
    SELECT SUBSTRING(result, 2) is_valid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-26 15:40:15
