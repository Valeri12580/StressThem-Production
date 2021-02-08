
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
INSERT INTO `announcement` VALUES ('72cb74da-8d3d-40aa-8578-ae1d3e345101','2021-02-08 13:40:27.310303','Our servives are down due maintance','Our services are down','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e');
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
INSERT INTO `article` VALUES ('9a57657e-fa04-41a9-bdc4-30fc91ca6432','2021-02-08 14:40:27.361847','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('a47d397d-5c15-4a81-89ac-609ee1ec0c7d','2021-02-08 13:40:27.361847','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e');
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
INSERT INTO `comment` VALUES ('4bd19caf-3b7f-4e17-916b-32b14fe0cfba','The best stresser on the market with the cheapest prices...',5,'1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('91ab33e4-d17e-42e9-9dbc-384b0fddd10f','Bypasses cloudflare!!!',4,'42fb83d8-8fcf-4ec9-8dbb-76993267ee92');
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
INSERT INTO `cryptocurrencies` VALUES ('0c5fea4c-1b62-4c4e-bd3a-9b6407a5586f','2021-02-08 13:40:27.448671','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('8806c037-c3e5-4303-90eb-b62f1b2e2170','2021-02-08 13:40:27.448671','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e');
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
INSERT INTO `methods` VALUES ('16c2af1e-4cae-4930-b37c-376c6996545c','HTTPstormPG'),('474ff574-5769-44ac-a8ec-1b7c9dc611b7','HTTPrequest'),('47de7eed-ba35-4f5a-8a2c-270f2a575746','HTTPstormMIX'),('5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8','UAMBypass'),('76f3a9ac-d19a-4175-b7ce-9705e07f6f55','CFCrasher1'),('7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87','RandPackets'),('88bb5443-43cd-4332-b3b0-972aba2859cb','FiveM'),('adb06d3e-a5ef-468d-8348-4786128e70a7','Mixed'),('b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6','SpaceX'),('b2539280-215c-4033-b559-79bb61e52352','HTTPstormSG'),('c160da08-45a5-4dbf-a055-ee45f71a2f3f','xFreeze'),('dce7da09-5572-42d1-ab58-969fa67c6057','CFCrasher2'),('e6d2681f-008a-4332-8732-d6d005033a7d','PathFinder'),('f8dd3899-a9c7-45be-b8bc-f1343a049e8c','httpRND');
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
INSERT INTO `payment_codes` VALUES ('3a60d205-d260-4f7d-afc2-f0c5f23d68f6','basictest2',_binary '\0','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','1fbe5547-7ce4-4eca-bc43-33eac74b25ad'),('58a3202d-a8e0-4eaf-b672-88dcf0c2acb1','basictest1',_binary '\0','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','1fbe5547-7ce4-4eca-bc43-33eac74b25ad');
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
INSERT INTO `plans` VALUES ('1a558c93-15c5-4ca5-b08c-6f1214c37956',1,'2021-02-08 13:40:26.740468',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad',1,'2021-02-08 13:40:26.740468',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('4de9e1b0-10c7-48c2-8445-80f87728d41f',4,'2021-02-08 13:40:26.740468',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('841d6207-638a-4e4b-887b-b76b4cac7378',3,'2021-02-08 13:40:26.740468',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('c90e1901-cce4-44ee-a277-5ce335b09bf3',2,'2021-02-08 13:40:26.740468',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383',2,'2021-02-08 13:40:26.740468',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3',7,'2021-02-08 13:40:26.740468',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e');
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
INSERT INTO `plans_methods` VALUES ('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','16c2af1e-4cae-4930-b37c-376c6996545c'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','88bb5443-43cd-4332-b3b0-972aba2859cb'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','adb06d3e-a5ef-468d-8348-4786128e70a7'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','b2539280-215c-4033-b559-79bb61e52352'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','dce7da09-5572-42d1-ab58-969fa67c6057'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','e6d2681f-008a-4332-8732-d6d005033a7d'),('1fbe5547-7ce4-4eca-bc43-33eac74b25ad','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','16c2af1e-4cae-4930-b37c-376c6996545c'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','88bb5443-43cd-4332-b3b0-972aba2859cb'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','adb06d3e-a5ef-468d-8348-4786128e70a7'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','b2539280-215c-4033-b559-79bb61e52352'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','dce7da09-5572-42d1-ab58-969fa67c6057'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','e6d2681f-008a-4332-8732-d6d005033a7d'),('c90e1901-cce4-44ee-a277-5ce335b09bf3','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','16c2af1e-4cae-4930-b37c-376c6996545c'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','88bb5443-43cd-4332-b3b0-972aba2859cb'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','adb06d3e-a5ef-468d-8348-4786128e70a7'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','b2539280-215c-4033-b559-79bb61e52352'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','dce7da09-5572-42d1-ab58-969fa67c6057'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','e6d2681f-008a-4332-8732-d6d005033a7d'),('eca93ea5-3602-43cb-9f5d-1e7cbf795383','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('841d6207-638a-4e4b-887b-b76b4cac7378','16c2af1e-4cae-4930-b37c-376c6996545c'),('841d6207-638a-4e4b-887b-b76b4cac7378','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('841d6207-638a-4e4b-887b-b76b4cac7378','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('841d6207-638a-4e4b-887b-b76b4cac7378','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('841d6207-638a-4e4b-887b-b76b4cac7378','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('841d6207-638a-4e4b-887b-b76b4cac7378','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('841d6207-638a-4e4b-887b-b76b4cac7378','88bb5443-43cd-4332-b3b0-972aba2859cb'),('841d6207-638a-4e4b-887b-b76b4cac7378','adb06d3e-a5ef-468d-8348-4786128e70a7'),('841d6207-638a-4e4b-887b-b76b4cac7378','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('841d6207-638a-4e4b-887b-b76b4cac7378','b2539280-215c-4033-b559-79bb61e52352'),('841d6207-638a-4e4b-887b-b76b4cac7378','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('841d6207-638a-4e4b-887b-b76b4cac7378','dce7da09-5572-42d1-ab58-969fa67c6057'),('841d6207-638a-4e4b-887b-b76b4cac7378','e6d2681f-008a-4332-8732-d6d005033a7d'),('841d6207-638a-4e4b-887b-b76b4cac7378','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','16c2af1e-4cae-4930-b37c-376c6996545c'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','88bb5443-43cd-4332-b3b0-972aba2859cb'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','adb06d3e-a5ef-468d-8348-4786128e70a7'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','b2539280-215c-4033-b559-79bb61e52352'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','dce7da09-5572-42d1-ab58-969fa67c6057'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','e6d2681f-008a-4332-8732-d6d005033a7d'),('f2ce1684-dae2-4eed-967e-9761f16d4ce3','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','16c2af1e-4cae-4930-b37c-376c6996545c'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','88bb5443-43cd-4332-b3b0-972aba2859cb'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','adb06d3e-a5ef-468d-8348-4786128e70a7'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','b2539280-215c-4033-b559-79bb61e52352'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','dce7da09-5572-42d1-ab58-969fa67c6057'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','e6d2681f-008a-4332-8732-d6d005033a7d'),('4de9e1b0-10c7-48c2-8445-80f87728d41f','f8dd3899-a9c7-45be-b8bc-f1343a049e8c'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','16c2af1e-4cae-4930-b37c-376c6996545c'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','474ff574-5769-44ac-a8ec-1b7c9dc611b7'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','47de7eed-ba35-4f5a-8a2c-270f2a575746'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','5444d310-1a21-4c51-9f3d-9bb6f7d1d5a8'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','76f3a9ac-d19a-4175-b7ce-9705e07f6f55'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','7a5c3b4d-dbc7-44ad-8f62-c2c615f9eb87'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','88bb5443-43cd-4332-b3b0-972aba2859cb'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','adb06d3e-a5ef-468d-8348-4786128e70a7'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','b0602e7a-6fd0-4285-bf1e-dc3bb64c2de6'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','b2539280-215c-4033-b559-79bb61e52352'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','c160da08-45a5-4dbf-a055-ee45f71a2f3f'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','dce7da09-5572-42d1-ab58-969fa67c6057'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','e6d2681f-008a-4332-8732-d6d005033a7d'),('1a558c93-15c5-4ca5-b08c-6f1214c37956','f8dd3899-a9c7-45be-b8bc-f1343a049e8c');
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
INSERT INTO `roles` VALUES ('0061da28-c8d2-4ac8-929e-878f863c73e3','ADMIN'),('8fb753b2-9d39-4f64-8db9-089229f62742','USER'),('cf7d08de-82f6-4c72-9db7-55355b846c07','ROOT'),('d67153a8-a9ff-4a76-b5e6-b625798d648f','UNCONFIRMED');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` varchar(255) NOT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `is_resolved` bit(1) DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES ('920fa90a-aa98-4f7b-a049-5e4e5bb88e88','2021-02-08 13:40:27.271734','test@request.wtf',_binary '','This is a autogenerated ticket with test purposes','This is a test ticket');
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
INSERT INTO `transaction` VALUES ('3f1b1e28-6297-4ae0-922c-7bf70fda2f8c','2021-02-08 13:40:27.191570',NULL,'4de9e1b0-10c7-48c2-8445-80f87728d41f','42fb83d8-8fcf-4ec9-8dbb-76993267ee92'),('6e1899c4-6de2-4b02-a558-79d7808cc4f5','2021-02-08 13:40:27.236014',NULL,'1a558c93-15c5-4ca5-b08c-6f1214c37956','667623f8-61b5-4273-81b0-3c83f0a8706a'),('d113d1c2-b1e3-45c1-b1ad-ce18378a5858','2021-02-08 13:40:27.123130',NULL,'4de9e1b0-10c7-48c2-8445-80f87728d41f','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e');
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
INSERT INTO `users` VALUES ('1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$XivxPERNYg3A0uoclSlVq.8APJ.1aZ0xb.sYrAggTb6kry1GfQbcm','2021-02-08 13:40:26.340180','Pride'),('42fb83d8-8fcf-4ec9-8dbb-76993267ee92','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$ykgzzKaDA5JeuTE7x.8wd.cxyB0YgjyY/yl/4/6vKsddiBjQTEO/C','2021-02-08 13:40:26.445018','Google'),('667623f8-61b5-4273-81b0-3c83f0a8706a','normal@gmail.com','',_binary '','$2a$10$dyB2d8PpHf3IzbPyKpK08Oju/CiIx2BQEoP9VW0/LeAX5HblsiqxS','2021-02-08 13:40:26.540800','normal');
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
INSERT INTO `users_active_plan` VALUES ('14f1eb52-47c8-407e-9ef7-9025bb4a34cb',999,36500,'2021-02-08 13:40:27.108960','4de9e1b0-10c7-48c2-8445-80f87728d41f','1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e'),('8093515d-9901-4f61-8e5f-1ad8056855ac',10,36500,'2021-02-08 13:40:27.224163','1a558c93-15c5-4ca5-b08c-6f1214c37956','667623f8-61b5-4273-81b0-3c83f0a8706a'),('90c796e7-b254-4548-ad43-007944412d89',999,36500,'2021-02-08 13:40:27.151537','4de9e1b0-10c7-48c2-8445-80f87728d41f','42fb83d8-8fcf-4ec9-8dbb-76993267ee92');
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
INSERT INTO `users_roles` VALUES ('1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','0061da28-c8d2-4ac8-929e-878f863c73e3'),('42fb83d8-8fcf-4ec9-8dbb-76993267ee92','0061da28-c8d2-4ac8-929e-878f863c73e3'),('1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','8fb753b2-9d39-4f64-8db9-089229f62742'),('42fb83d8-8fcf-4ec9-8dbb-76993267ee92','8fb753b2-9d39-4f64-8db9-089229f62742'),('667623f8-61b5-4273-81b0-3c83f0a8706a','8fb753b2-9d39-4f64-8db9-089229f62742'),('1b5e32c4-2ef4-49f9-8ea9-8a2cfa11a22e','cf7d08de-82f6-4c72-9db7-55355b846c07'),('42fb83d8-8fcf-4ec9-8dbb-76993267ee92','cf7d08de-82f6-4c72-9db7-55355b846c07');
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

