
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
INSERT INTO `announcement` VALUES ('123e97e8-15a7-4cd0-99c2-88451d83c20f','2021-01-29 14:09:29.373103','Our servives are down due maintance','Our services are down','151afc13-883f-4eff-ae16-d9d83bc3e0e2');
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
INSERT INTO `article` VALUES ('bb6faa1b-cdcc-4b7e-a374-765f94fafac4','2021-01-29 15:09:29.405161','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('c2511428-a329-4ba5-89e2-0ff65ed96f53','2021-01-29 14:09:29.405161','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','151afc13-883f-4eff-ae16-d9d83bc3e0e2');
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
INSERT INTO `comment` VALUES ('8aa2ea93-b08f-4816-a3b9-8a70a68b41e0','The best stresser on the market with the cheapest prices...',5,'151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('8cf7c2e7-fe73-4b43-97d7-1481d5a2a6b5','Bypasses cloudflare!!!',4,'a9978eaf-e235-4141-8e26-614d8ce96f85');
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
INSERT INTO `cryptocurrencies` VALUES ('8f01bd62-2728-4f3e-9fb7-08dba679ed6e','2021-01-29 14:09:29.497644','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('c497f571-6404-4ddd-9719-010ea61fe34b','2021-01-29 14:09:29.497644','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','151afc13-883f-4eff-ae16-d9d83bc3e0e2');
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
INSERT INTO `methods` VALUES ('189c9913-0d27-4b6f-83bd-d4df70842442','HTTPrequest'),('2405a450-9676-4fe9-a538-e568e1e2b9e1','HTTPstormSG'),('317b3f3f-8774-47d5-b109-0ee20788631c','HTTPstormPG'),('32ed7639-0a08-4bc3-830f-e61e968cf142','SpaceX'),('377870fb-8283-411c-a39e-75b08c611e5f','PathFinder'),('77078ce2-f37e-44d0-ab47-d5ee786358a0','xFreeze'),('77555746-d902-42b7-9b22-50b234804f41','FiveM'),('7ae5c158-4f6e-45b7-8678-c3251a8b418e','HTTPstormMIX'),('883401a9-340d-40c6-841e-f48109a820be','RandPackets'),('886be69b-1521-4b5e-9f11-dff8e149fdf9','CFCrasher2'),('94f94066-f6d9-4fcb-93e6-e016c46de5cd','UAMBypass'),('9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c','Mixed'),('bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9','CFCrasher1'),('cc4ed2f2-301e-485e-9132-1510704453cb','httpRND');
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
INSERT INTO `payment_codes` VALUES ('160728b5-aab1-4c53-accf-c3da3f564bf7','basictest1',_binary '\0','151afc13-883f-4eff-ae16-d9d83bc3e0e2','b1f795f6-1f04-452c-b9b7-fdc7ea94039b'),('fd6890ae-f969-4029-b520-406cdeedbe38','basictest2',_binary '\0','151afc13-883f-4eff-ae16-d9d83bc3e0e2','b1f795f6-1f04-452c-b9b7-fdc7ea94039b');
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
INSERT INTO `plans` VALUES ('21ac3d33-d165-41f5-9db8-204f91edcef0',4,'2021-01-29 14:09:28.895917',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2',1,'2021-01-29 14:09:28.895917',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c',7,'2021-01-29 14:09:28.895917',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('62427e21-351d-40df-87db-bc47ea59bc8e',2,'2021-01-29 14:09:28.895917',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b',1,'2021-01-29 14:09:28.895917',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('be7ac9b1-7893-400f-9412-705cfed2a7c6',2,'2021-01-29 14:09:28.895917',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd',3,'2021-01-29 14:09:28.895917',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','151afc13-883f-4eff-ae16-d9d83bc3e0e2');
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
INSERT INTO `plans_methods` VALUES ('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','189c9913-0d27-4b6f-83bd-d4df70842442'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','317b3f3f-8774-47d5-b109-0ee20788631c'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','32ed7639-0a08-4bc3-830f-e61e968cf142'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','377870fb-8283-411c-a39e-75b08c611e5f'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','77555746-d902-42b7-9b22-50b234804f41'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','883401a9-340d-40c6-841e-f48109a820be'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('b1f795f6-1f04-452c-b9b7-fdc7ea94039b','cc4ed2f2-301e-485e-9132-1510704453cb'),('62427e21-351d-40df-87db-bc47ea59bc8e','189c9913-0d27-4b6f-83bd-d4df70842442'),('62427e21-351d-40df-87db-bc47ea59bc8e','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('62427e21-351d-40df-87db-bc47ea59bc8e','317b3f3f-8774-47d5-b109-0ee20788631c'),('62427e21-351d-40df-87db-bc47ea59bc8e','32ed7639-0a08-4bc3-830f-e61e968cf142'),('62427e21-351d-40df-87db-bc47ea59bc8e','377870fb-8283-411c-a39e-75b08c611e5f'),('62427e21-351d-40df-87db-bc47ea59bc8e','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('62427e21-351d-40df-87db-bc47ea59bc8e','77555746-d902-42b7-9b22-50b234804f41'),('62427e21-351d-40df-87db-bc47ea59bc8e','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('62427e21-351d-40df-87db-bc47ea59bc8e','883401a9-340d-40c6-841e-f48109a820be'),('62427e21-351d-40df-87db-bc47ea59bc8e','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('62427e21-351d-40df-87db-bc47ea59bc8e','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('62427e21-351d-40df-87db-bc47ea59bc8e','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('62427e21-351d-40df-87db-bc47ea59bc8e','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('62427e21-351d-40df-87db-bc47ea59bc8e','cc4ed2f2-301e-485e-9132-1510704453cb'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','189c9913-0d27-4b6f-83bd-d4df70842442'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','317b3f3f-8774-47d5-b109-0ee20788631c'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','32ed7639-0a08-4bc3-830f-e61e968cf142'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','377870fb-8283-411c-a39e-75b08c611e5f'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','77555746-d902-42b7-9b22-50b234804f41'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','883401a9-340d-40c6-841e-f48109a820be'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('be7ac9b1-7893-400f-9412-705cfed2a7c6','cc4ed2f2-301e-485e-9132-1510704453cb'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','189c9913-0d27-4b6f-83bd-d4df70842442'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','317b3f3f-8774-47d5-b109-0ee20788631c'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','32ed7639-0a08-4bc3-830f-e61e968cf142'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','377870fb-8283-411c-a39e-75b08c611e5f'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','77555746-d902-42b7-9b22-50b234804f41'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','883401a9-340d-40c6-841e-f48109a820be'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('fadef321-0081-4d21-8c76-18c0ce1cc9dd','cc4ed2f2-301e-485e-9132-1510704453cb'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','189c9913-0d27-4b6f-83bd-d4df70842442'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','317b3f3f-8774-47d5-b109-0ee20788631c'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','32ed7639-0a08-4bc3-830f-e61e968cf142'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','377870fb-8283-411c-a39e-75b08c611e5f'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','77555746-d902-42b7-9b22-50b234804f41'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','883401a9-340d-40c6-841e-f48109a820be'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('5a74c2e8-9e2f-4c51-85d0-de1af1ab141c','cc4ed2f2-301e-485e-9132-1510704453cb'),('21ac3d33-d165-41f5-9db8-204f91edcef0','189c9913-0d27-4b6f-83bd-d4df70842442'),('21ac3d33-d165-41f5-9db8-204f91edcef0','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('21ac3d33-d165-41f5-9db8-204f91edcef0','317b3f3f-8774-47d5-b109-0ee20788631c'),('21ac3d33-d165-41f5-9db8-204f91edcef0','32ed7639-0a08-4bc3-830f-e61e968cf142'),('21ac3d33-d165-41f5-9db8-204f91edcef0','377870fb-8283-411c-a39e-75b08c611e5f'),('21ac3d33-d165-41f5-9db8-204f91edcef0','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('21ac3d33-d165-41f5-9db8-204f91edcef0','77555746-d902-42b7-9b22-50b234804f41'),('21ac3d33-d165-41f5-9db8-204f91edcef0','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('21ac3d33-d165-41f5-9db8-204f91edcef0','883401a9-340d-40c6-841e-f48109a820be'),('21ac3d33-d165-41f5-9db8-204f91edcef0','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('21ac3d33-d165-41f5-9db8-204f91edcef0','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('21ac3d33-d165-41f5-9db8-204f91edcef0','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('21ac3d33-d165-41f5-9db8-204f91edcef0','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('21ac3d33-d165-41f5-9db8-204f91edcef0','cc4ed2f2-301e-485e-9132-1510704453cb'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','189c9913-0d27-4b6f-83bd-d4df70842442'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','2405a450-9676-4fe9-a538-e568e1e2b9e1'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','317b3f3f-8774-47d5-b109-0ee20788631c'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','32ed7639-0a08-4bc3-830f-e61e968cf142'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','377870fb-8283-411c-a39e-75b08c611e5f'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','77078ce2-f37e-44d0-ab47-d5ee786358a0'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','77555746-d902-42b7-9b22-50b234804f41'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','7ae5c158-4f6e-45b7-8678-c3251a8b418e'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','883401a9-340d-40c6-841e-f48109a820be'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','886be69b-1521-4b5e-9f11-dff8e149fdf9'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','94f94066-f6d9-4fcb-93e6-e016c46de5cd'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','9e339a9c-2629-4dd5-bcdc-8ca2c560ff9c'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','bbbb9ee1-1468-49e0-b71c-cd3e893cb2f9'),('55a08ecf-88d3-4f80-af52-f9d91eb02cc2','cc4ed2f2-301e-485e-9132-1510704453cb');
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
INSERT INTO `roles` VALUES ('11f8ccc0-fb4e-47cf-9e69-e4f797c389e0','ADMIN'),('517d6fbd-5f94-42fd-a885-08972a49fb62','ROOT'),('7eec2f6a-c930-4936-adb5-aaa49ff83485','UNCONFIRMED'),('ff4cf056-cdc2-47c5-adca-1abba27e6097','USER');
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
INSERT INTO `transaction` VALUES ('05f9efdd-db4d-410a-8612-512d8be45db3','2021-01-29 14:09:29.252907',NULL,'21ac3d33-d165-41f5-9db8-204f91edcef0','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('3bcce843-e519-480d-a5dc-79dfed7d4b67','2021-01-29 14:09:29.296657',NULL,'21ac3d33-d165-41f5-9db8-204f91edcef0','a9978eaf-e235-4141-8e26-614d8ce96f85'),('51fa935e-0f80-4f84-96d6-4eb2a3a9cd60','2021-01-29 14:09:29.339829',NULL,'55a08ecf-88d3-4f80-af52-f9d91eb02cc2','93e2e955-7b4e-4db4-8370-b6a5b2875770');
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
INSERT INTO `users` VALUES ('151afc13-883f-4eff-ae16-d9d83bc3e0e2','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$wEasrgKeFYHvMH0s6S8cqu8t88yvLBtnmNECMe2YDNK6BfYHvSJgm','2021-01-29 14:09:28.558143','Pride'),('93e2e955-7b4e-4db4-8370-b6a5b2875770','normal@gmail.com','',_binary '','$2a$10$nXyc5qES5b93tqVkqiKenedmN7sOzhih0OMb/YYK5CHnU.702mTYi','2021-01-29 14:09:28.756246','normal'),('a9978eaf-e235-4141-8e26-614d8ce96f85','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$BRxex3vqsNftJ.D/jdlT2O7K4.WIBLOgsL2adrDOmteICYD8Jqmpe','2021-01-29 14:09:28.663382','Google');
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
INSERT INTO `users_active_plan` VALUES ('11c1c472-786b-4ae4-a22a-ceda9c45680e',999,36500,'2021-01-29 14:09:29.284382','21ac3d33-d165-41f5-9db8-204f91edcef0','a9978eaf-e235-4141-8e26-614d8ce96f85'),('aa009db4-177c-42bb-8374-f4ef17d28213',999,36500,'2021-01-29 14:09:29.238431','21ac3d33-d165-41f5-9db8-204f91edcef0','151afc13-883f-4eff-ae16-d9d83bc3e0e2'),('c74993e2-5df2-4a9a-8d7e-cd6dfa7a8e5c',10,36500,'2021-01-29 14:09:29.327032','55a08ecf-88d3-4f80-af52-f9d91eb02cc2','93e2e955-7b4e-4db4-8370-b6a5b2875770');
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
INSERT INTO `users_roles` VALUES ('151afc13-883f-4eff-ae16-d9d83bc3e0e2','11f8ccc0-fb4e-47cf-9e69-e4f797c389e0'),('a9978eaf-e235-4141-8e26-614d8ce96f85','11f8ccc0-fb4e-47cf-9e69-e4f797c389e0'),('151afc13-883f-4eff-ae16-d9d83bc3e0e2','517d6fbd-5f94-42fd-a885-08972a49fb62'),('a9978eaf-e235-4141-8e26-614d8ce96f85','517d6fbd-5f94-42fd-a885-08972a49fb62'),('151afc13-883f-4eff-ae16-d9d83bc3e0e2','ff4cf056-cdc2-47c5-adca-1abba27e6097'),('93e2e955-7b4e-4db4-8370-b6a5b2875770','ff4cf056-cdc2-47c5-adca-1abba27e6097'),('a9978eaf-e235-4141-8e26-614d8ce96f85','ff4cf056-cdc2-47c5-adca-1abba27e6097');
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

