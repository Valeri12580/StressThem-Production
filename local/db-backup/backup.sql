
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `stress_them_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `stress_them_db`;
DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `id` varchar(255) NOT NULL,
  `added_on` datetime(6) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `author_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_1u2ubk1rhxer3qi2my019helb` (`title`),
  KEY `FK249i8v3gnoyqub16pfnb60352` (`author_id`),
  CONSTRAINT `FK249i8v3gnoyqub16pfnb60352` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES ('cf1b1339-ac05-4948-9867-fab46e21ef02','2021-02-04 20:02:35.399194','Our servives are down due maintance','Our services are down','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article` (
  `id` varchar(255) NOT NULL,
  `added_on` datetime(6) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` text,
  `author_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_571gx7oqo5xpmgocegaidlcu9` (`title`),
  KEY `FKmjgtny2i22jf4dqncmd436s0u` (`author_id`),
  CONSTRAINT `FKmjgtny2i22jf4dqncmd436s0u` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES ('6f978e3c-593f-44dc-8148-c89d254c7f0c','2021-02-04 21:02:35.461564','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('aa1625ca-3a00-4ef3-8faf-f0775b83c2f5','2021-02-04 20:02:35.461564','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `attack_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attack_history` (
  `id` varchar(255) NOT NULL,
  `expires_on` datetime(6) NOT NULL,
  `host` varchar(255) NOT NULL,
  `port` varchar(255) NOT NULL,
  `attacker_id` varchar(255) DEFAULT NULL,
  `method_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4vkefc931ytvgq3tsarr9lx5w` (`attacker_id`),
  KEY `FKraupirm5n3sjrncn41enhqjtl` (`method_id`),
  CONSTRAINT `FK4vkefc931ytvgq3tsarr9lx5w` FOREIGN KEY (`attacker_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKraupirm5n3sjrncn41enhqjtl` FOREIGN KEY (`method_id`) REFERENCES `methods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `attack_history` WRITE;
/*!40000 ALTER TABLE `attack_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `attack_history` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` varchar(255) NOT NULL,
  `description` varchar(100) NOT NULL,
  `rate` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqm52p1v3o13hy268he0wcngr5` (`user_id`),
  CONSTRAINT `FKqm52p1v3o13hy268he0wcngr5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('70971c20-cda2-4545-9e43-bbbee686cfad','Bypasses cloudflare!!!',4,'e103519b-6542-4c79-8ef8-16f4d136ef8a'),('9bcb1e6f-ca71-4c08-9aa1-7a2a0a60da49','The best stresser on the market with the cheapest prices...',5,'a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `cryptocurrencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cryptocurrencies` (
  `id` varchar(255) NOT NULL,
  `added_on` datetime(6) NOT NULL,
  `description` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_url` text NOT NULL,
  `author_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6ovr0xas2ttrw3vclviv0r73d` (`title`),
  KEY `FKeyxln78htryvgdsepjgr81mh0` (`author_id`),
  CONSTRAINT `FKeyxln78htryvgdsepjgr81mh0` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cryptocurrencies` WRITE;
/*!40000 ALTER TABLE `cryptocurrencies` DISABLE KEYS */;
INSERT INTO `cryptocurrencies` VALUES ('94716186-5bf6-42ab-8860-680e322000d3','2021-02-04 20:02:35.607403','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('ef1f253e-e9f1-4174-9b54-ec8edb3b9469','2021-02-04 20:02:35.607403','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `cryptocurrencies` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `logger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logger` (
  `id` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `time` datetime(6) NOT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs8mbd4342fp28hwm5sti9cf4b` (`author_id`),
  CONSTRAINT `FKs8mbd4342fp28hwm5sti9cf4b` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `logger` WRITE;
/*!40000 ALTER TABLE `logger` DISABLE KEYS */;
/*!40000 ALTER TABLE `logger` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `methods` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `methods` WRITE;
/*!40000 ALTER TABLE `methods` DISABLE KEYS */;
INSERT INTO `methods` VALUES ('167153e8-fedd-4fea-a042-472bd037496d','HTTPstormPG'),('282b20b8-c984-4ca1-8a1f-6d9de9d97df4','CFCrasher1'),('31a2566e-1ed7-48c3-8c30-5e7d91a25a2f','SpaceX'),('3239d2e2-1bf2-4f63-aaf7-2527055ebd12','httpRND'),('3305dd95-169b-4e30-8862-439c02a05cb8','xFreeze'),('4bf55065-cba9-41ca-807a-64c3638c3117','HTTPrequest'),('835ed5e2-f678-4839-afdc-208e864cb2a4','FiveM'),('8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d','UAMBypass'),('a13432ee-1aec-4fec-aad0-170f3fc92bb9','Mixed'),('a961fdf1-306d-4068-a895-f5300ae2a812','PathFinder'),('af6fcb39-eb3a-4ce0-879d-a35f9bd2c319','RandPackets'),('b3d97e02-36f4-4cd7-a117-cccbd19824e4','HTTPstormMIX'),('b687ffad-18da-44ce-8b4d-b18bdb5d2183','HTTPstormSG'),('db3878ba-571f-4750-b1f6-8a634c011db3','CFCrasher2');
/*!40000 ALTER TABLE `methods` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `payment_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_codes` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_used` bit(1) DEFAULT NULL,
  `author_id` varchar(255) DEFAULT NULL,
  `plan_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2cvebc4friqunjeixjha6kf6a` (`author_id`),
  KEY `FKrjeui7qf69fhqb2qtsn9qy7g` (`plan_id`),
  CONSTRAINT `FK2cvebc4friqunjeixjha6kf6a` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKrjeui7qf69fhqb2qtsn9qy7g` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `payment_codes` WRITE;
/*!40000 ALTER TABLE `payment_codes` DISABLE KEYS */;
INSERT INTO `payment_codes` VALUES ('037fb99f-0109-48ff-a87b-0cfac0386f07','basictest1',_binary '\0','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','bb83f7c6-2512-4549-a622-6afe0c085e8d'),('943794f7-12a8-436f-86ed-d2a9cd56b2d7','basictest2',_binary '\0','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','bb83f7c6-2512-4549-a622-6afe0c085e8d');
/*!40000 ALTER TABLE `payment_codes` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans` (
  `id` varchar(255) NOT NULL,
  `concurrent` int NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `duration_in_days` int NOT NULL,
  `max_boot_time_in_seconds` double NOT NULL,
  `max_boots_per_day` int NOT NULL,
  `payment_link` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `creator_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK21jc2hoxq4ma8gl9ranh3ikrc` (`creator_id`),
  CONSTRAINT `FK21jc2hoxq4ma8gl9ranh3ikrc` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `plans` WRITE;
/*!40000 ALTER TABLE `plans` DISABLE KEYS */;
INSERT INTO `plans` VALUES ('195c1d78-2eeb-4d6c-9e06-85fffed9f273',1,'2021-02-04 20:02:34.646603',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('29ab2369-7a89-4f5f-8369-f5891a46fac1',7,'2021-02-04 20:02:34.646603',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('531f014c-d6c5-4dae-9152-95e584a8b309',3,'2021-02-04 20:02:34.646603',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('92144112-85d4-4074-ba42-8cff19804696',4,'2021-02-04 20:02:34.646603',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('94040d65-e0f1-4a07-9292-20944c162801',2,'2021-02-04 20:02:34.646603',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('bb83f7c6-2512-4549-a622-6afe0c085e8d',1,'2021-02-04 20:02:34.646603',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('d03c6549-6404-4101-bbb9-c9a162d94b9a',2,'2021-02-04 20:02:34.646603',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `plans` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `plans_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plans_methods` (
  `plan_id` varchar(255) NOT NULL,
  `method_id` varchar(255) NOT NULL,
  KEY `FK3ehqavnd6igrm5t860qf8s3as` (`method_id`),
  KEY `FKkskrp2wwwop1d9vwchefqyj0s` (`plan_id`),
  CONSTRAINT `FK3ehqavnd6igrm5t860qf8s3as` FOREIGN KEY (`method_id`) REFERENCES `methods` (`id`),
  CONSTRAINT `FKkskrp2wwwop1d9vwchefqyj0s` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `plans_methods` WRITE;
/*!40000 ALTER TABLE `plans_methods` DISABLE KEYS */;
INSERT INTO `plans_methods` VALUES ('bb83f7c6-2512-4549-a622-6afe0c085e8d','167153e8-fedd-4fea-a042-472bd037496d'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','3305dd95-169b-4e30-8862-439c02a05cb8'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','4bf55065-cba9-41ca-807a-64c3638c3117'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','835ed5e2-f678-4839-afdc-208e864cb2a4'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','a961fdf1-306d-4068-a895-f5300ae2a812'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('bb83f7c6-2512-4549-a622-6afe0c085e8d','db3878ba-571f-4750-b1f6-8a634c011db3'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','167153e8-fedd-4fea-a042-472bd037496d'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','3305dd95-169b-4e30-8862-439c02a05cb8'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','4bf55065-cba9-41ca-807a-64c3638c3117'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','835ed5e2-f678-4839-afdc-208e864cb2a4'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','a961fdf1-306d-4068-a895-f5300ae2a812'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('d03c6549-6404-4101-bbb9-c9a162d94b9a','db3878ba-571f-4750-b1f6-8a634c011db3'),('94040d65-e0f1-4a07-9292-20944c162801','167153e8-fedd-4fea-a042-472bd037496d'),('94040d65-e0f1-4a07-9292-20944c162801','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('94040d65-e0f1-4a07-9292-20944c162801','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('94040d65-e0f1-4a07-9292-20944c162801','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('94040d65-e0f1-4a07-9292-20944c162801','3305dd95-169b-4e30-8862-439c02a05cb8'),('94040d65-e0f1-4a07-9292-20944c162801','4bf55065-cba9-41ca-807a-64c3638c3117'),('94040d65-e0f1-4a07-9292-20944c162801','835ed5e2-f678-4839-afdc-208e864cb2a4'),('94040d65-e0f1-4a07-9292-20944c162801','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('94040d65-e0f1-4a07-9292-20944c162801','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('94040d65-e0f1-4a07-9292-20944c162801','a961fdf1-306d-4068-a895-f5300ae2a812'),('94040d65-e0f1-4a07-9292-20944c162801','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('94040d65-e0f1-4a07-9292-20944c162801','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('94040d65-e0f1-4a07-9292-20944c162801','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('94040d65-e0f1-4a07-9292-20944c162801','db3878ba-571f-4750-b1f6-8a634c011db3'),('531f014c-d6c5-4dae-9152-95e584a8b309','167153e8-fedd-4fea-a042-472bd037496d'),('531f014c-d6c5-4dae-9152-95e584a8b309','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('531f014c-d6c5-4dae-9152-95e584a8b309','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('531f014c-d6c5-4dae-9152-95e584a8b309','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('531f014c-d6c5-4dae-9152-95e584a8b309','3305dd95-169b-4e30-8862-439c02a05cb8'),('531f014c-d6c5-4dae-9152-95e584a8b309','4bf55065-cba9-41ca-807a-64c3638c3117'),('531f014c-d6c5-4dae-9152-95e584a8b309','835ed5e2-f678-4839-afdc-208e864cb2a4'),('531f014c-d6c5-4dae-9152-95e584a8b309','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('531f014c-d6c5-4dae-9152-95e584a8b309','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('531f014c-d6c5-4dae-9152-95e584a8b309','a961fdf1-306d-4068-a895-f5300ae2a812'),('531f014c-d6c5-4dae-9152-95e584a8b309','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('531f014c-d6c5-4dae-9152-95e584a8b309','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('531f014c-d6c5-4dae-9152-95e584a8b309','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('531f014c-d6c5-4dae-9152-95e584a8b309','db3878ba-571f-4750-b1f6-8a634c011db3'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','167153e8-fedd-4fea-a042-472bd037496d'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','3305dd95-169b-4e30-8862-439c02a05cb8'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','4bf55065-cba9-41ca-807a-64c3638c3117'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','835ed5e2-f678-4839-afdc-208e864cb2a4'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','a961fdf1-306d-4068-a895-f5300ae2a812'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('29ab2369-7a89-4f5f-8369-f5891a46fac1','db3878ba-571f-4750-b1f6-8a634c011db3'),('92144112-85d4-4074-ba42-8cff19804696','167153e8-fedd-4fea-a042-472bd037496d'),('92144112-85d4-4074-ba42-8cff19804696','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('92144112-85d4-4074-ba42-8cff19804696','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('92144112-85d4-4074-ba42-8cff19804696','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('92144112-85d4-4074-ba42-8cff19804696','3305dd95-169b-4e30-8862-439c02a05cb8'),('92144112-85d4-4074-ba42-8cff19804696','4bf55065-cba9-41ca-807a-64c3638c3117'),('92144112-85d4-4074-ba42-8cff19804696','835ed5e2-f678-4839-afdc-208e864cb2a4'),('92144112-85d4-4074-ba42-8cff19804696','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('92144112-85d4-4074-ba42-8cff19804696','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('92144112-85d4-4074-ba42-8cff19804696','a961fdf1-306d-4068-a895-f5300ae2a812'),('92144112-85d4-4074-ba42-8cff19804696','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('92144112-85d4-4074-ba42-8cff19804696','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('92144112-85d4-4074-ba42-8cff19804696','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('92144112-85d4-4074-ba42-8cff19804696','db3878ba-571f-4750-b1f6-8a634c011db3'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','167153e8-fedd-4fea-a042-472bd037496d'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','282b20b8-c984-4ca1-8a1f-6d9de9d97df4'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','31a2566e-1ed7-48c3-8c30-5e7d91a25a2f'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','3239d2e2-1bf2-4f63-aaf7-2527055ebd12'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','3305dd95-169b-4e30-8862-439c02a05cb8'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','4bf55065-cba9-41ca-807a-64c3638c3117'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','835ed5e2-f678-4839-afdc-208e864cb2a4'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','8b2a1fc3-4ac8-46b1-8286-5e3e40ee616d'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','a13432ee-1aec-4fec-aad0-170f3fc92bb9'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','a961fdf1-306d-4068-a895-f5300ae2a812'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','af6fcb39-eb3a-4ce0-879d-a35f9bd2c319'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','b3d97e02-36f4-4cd7-a117-cccbd19824e4'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','b687ffad-18da-44ce-8b4d-b18bdb5d2183'),('195c1d78-2eeb-4d6c-9e06-85fffed9f273','db3878ba-571f-4750-b1f6-8a634c011db3');
/*!40000 ALTER TABLE `plans_methods` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES ('b715981e-f77a-4e17-957a-e933f3179bec','USER'),('c545e845-4de4-4759-9167-bc78d1c698a1','UNCONFIRMED'),('d631ed94-545a-41ce-aeeb-c010f7e2f900','ROOT'),('e41b90cc-9634-4836-8678-321184b63063','ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_resolved` bit(1) DEFAULT NULL,
  `local_date_time` datetime(6) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` varchar(255) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  `payment_code_id` varchar(255) DEFAULT NULL,
  `plan_id` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmis03nvjaipyouypcmmctgq49` (`payment_code_id`),
  KEY `FKixullyig5k4s9nsvv6hfgend5` (`plan_id`),
  KEY `FKanjpo5tiapru7an6cw4cu37y4` (`user_id`),
  CONSTRAINT `FKanjpo5tiapru7an6cw4cu37y4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKixullyig5k4s9nsvv6hfgend5` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  CONSTRAINT `FKmis03nvjaipyouypcmmctgq49` FOREIGN KEY (`payment_code_id`) REFERENCES `payment_codes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES ('4d5fc961-5e10-44dd-bd06-26f494ca778d','2021-02-04 20:02:35.204106',NULL,'92144112-85d4-4074-ba42-8cff19804696','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8'),('69e76cc7-ae46-428f-921a-503cddedf4eb','2021-02-04 20:02:35.284501',NULL,'92144112-85d4-4074-ba42-8cff19804696','e103519b-6542-4c79-8ef8-16f4d136ef8a'),('fa488de8-142b-4803-9640-9c48c1d23bbb','2021-02-04 20:02:35.351078',NULL,'195c1d78-2eeb-4d6c-9e06-85fffed9f273','31c0a647-2368-447d-a291-3ea8fc88e4c7');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_url` text,
  `is_enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `registered_on` datetime(6) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('31c0a647-2368-447d-a291-3ea8fc88e4c7','normal@gmail.com','',_binary '','$2a$10$916gLATBgmHH.Jh6zB8fJex90TKvPzsU6A0C4UJ4p/s4X/dyzXeKi','2021-02-04 20:02:34.396253','normal'),('a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$qB8pIw2Oyot9shbFD/maFuuJ.MjKdLPZbL/Cu2WpyYQmxQSZKwTQW','2021-02-04 20:02:34.053204','Pride'),('e103519b-6542-4c79-8ef8-16f4d136ef8a','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$pNYlEhaz./Kx01XWyw0x3OTPzkXp5cSuiFgiukEYqFe8knUArtbLi','2021-02-04 20:02:34.233610','Google');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users_active_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_active_plan` (
  `id` varchar(255) NOT NULL,
  `left_attacks_for_the_day` int NOT NULL,
  `left_days` int NOT NULL,
  `started_on` datetime(6) DEFAULT NULL,
  `plan_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgpielcvv8ewsa8o410p3avuqu` (`plan_id`),
  KEY `FK6rs8ufb1eytu3ykd97du6pvy5` (`user_id`),
  CONSTRAINT `FK6rs8ufb1eytu3ykd97du6pvy5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKgpielcvv8ewsa8o410p3avuqu` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users_active_plan` WRITE;
/*!40000 ALTER TABLE `users_active_plan` DISABLE KEYS */;
INSERT INTO `users_active_plan` VALUES ('245791b6-01a5-4882-871f-d322e2a1a44f',10,36500,'2021-02-04 20:02:35.328506','195c1d78-2eeb-4d6c-9e06-85fffed9f273','31c0a647-2368-447d-a291-3ea8fc88e4c7'),('a2c6a00b-b99f-4843-926c-a13d64162a6a',999,36500,'2021-02-04 20:02:35.252095','92144112-85d4-4074-ba42-8cff19804696','e103519b-6542-4c79-8ef8-16f4d136ef8a'),('c8fca30f-5bdf-466b-adfd-8292b7726035',999,36500,'2021-02-04 20:02:35.182179','92144112-85d4-4074-ba42-8cff19804696','a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8');
/*!40000 ALTER TABLE `users_active_plan` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_roles` (
  `user_id` varchar(255) NOT NULL,
  `role_id` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKj6m8fwv7oqv74fcehir1a9ffy` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES ('31c0a647-2368-447d-a291-3ea8fc88e4c7','b715981e-f77a-4e17-957a-e933f3179bec'),('a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','b715981e-f77a-4e17-957a-e933f3179bec'),('e103519b-6542-4c79-8ef8-16f4d136ef8a','b715981e-f77a-4e17-957a-e933f3179bec'),('a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','d631ed94-545a-41ce-aeeb-c010f7e2f900'),('e103519b-6542-4c79-8ef8-16f4d136ef8a','d631ed94-545a-41ce-aeeb-c010f7e2f900'),('a9ae2e7a-1c27-41af-a5dc-13b5c7d146e8','e41b90cc-9634-4836-8678-321184b63063'),('e103519b-6542-4c79-8ef8-16f4d136ef8a','e41b90cc-9634-4836-8678-321184b63063');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

