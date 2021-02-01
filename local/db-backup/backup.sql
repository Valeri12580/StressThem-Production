
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
INSERT INTO `announcement` VALUES ('fcc04116-ea68-4241-b7cb-653ff2b97137','2021-02-01 18:49:37.808593','Our servives are down due maintance','Our services are down','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `article` VALUES ('1082e102-cb03-4f04-a115-6f1e3e9acb95','2021-02-01 19:49:37.863590','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'eb717366-136d-48e7-bb51-c014a42922a4'),('8cb176a1-56ea-4da9-bdb9-312f4c545ba4','2021-02-01 18:49:37.863590','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `comment` VALUES ('3ba7168c-22f3-4850-82c6-206afd0b29aa','Bypasses cloudflare!!!',4,'1acd0806-1385-43d4-98a3-43091875bf0c'),('f4098ee7-a311-43ef-b9f2-f230c87abfc4','The best stresser on the market with the cheapest prices...',5,'eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `cryptocurrencies` VALUES ('7134aa16-9f19-409e-97a0-6ca9e4814d73','2021-02-01 18:49:38.102594','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','eb717366-136d-48e7-bb51-c014a42922a4'),('f5ef8ec2-28d8-4beb-ab7c-1674df68bb89','2021-02-01 18:49:38.102594','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `methods` VALUES ('09ad4240-1861-4b39-9e93-fa32932f273f','CFCrasher2'),('1377dab5-d29d-4ed1-b31a-7d3495181b52','RandPackets'),('34afe500-001c-4e5f-b98c-22a2402ae6cd','HTTPrequest'),('3a893b88-a9e0-4490-8f67-12907a52d3a7','CFCrasher1'),('3fa2e63d-69a0-4dc0-9e36-581a86e7a272','xFreeze'),('439933b3-8801-43e0-b527-5259ac3bc0d3','SpaceX'),('4f319201-0cba-43a3-9ce0-d7f05ee13354','HTTPstormPG'),('5daaf343-4c77-4a90-a97f-36c6e4f17f45','UAMBypass'),('86abff16-30e0-47ab-87ba-d42c09d8f528','FiveM'),('8cbf00dc-25f2-44dc-a70d-ecebf608bf36','httpRND'),('a2eff2c2-be27-479d-bd4d-26be4d054a7e','HTTPstormSG'),('bb23d342-de1d-4a98-bafd-2932929a25c3','Mixed'),('df9aa541-3742-4247-9958-d8d6a6ca7a2c','HTTPstormMIX'),('e86c2927-49e2-4cc5-8b84-8923cab9bf66','PathFinder');
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
INSERT INTO `payment_codes` VALUES ('b4263c55-f45c-4dc9-9b05-5547a812033e','basictest1',_binary '\0','eb717366-136d-48e7-bb51-c014a42922a4','f4438a3c-1f4d-4d68-ad3a-550bfd9eefef'),('b868e172-8936-4c3b-ba2a-f2892809f07a','basictest2',_binary '\0','eb717366-136d-48e7-bb51-c014a42922a4','f4438a3c-1f4d-4d68-ad3a-550bfd9eefef');
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
INSERT INTO `plans` VALUES ('066697ba-55ca-4a95-9d99-0810176a3246',4,'2021-02-01 18:49:36.882510',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','eb717366-136d-48e7-bb51-c014a42922a4'),('0974bafa-d003-4198-a827-1fcb18f00e2b',1,'2021-02-01 18:49:36.882510',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','eb717366-136d-48e7-bb51-c014a42922a4'),('13d995c5-e88f-4d0f-b1d7-6e0620372426',3,'2021-02-01 18:49:36.882510',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','eb717366-136d-48e7-bb51-c014a42922a4'),('86d3629f-461c-46f6-87f0-9d168476b8ed',2,'2021-02-01 18:49:36.882510',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','eb717366-136d-48e7-bb51-c014a42922a4'),('942e9420-57a0-49d3-832e-b75cbedba587',2,'2021-02-01 18:49:36.882510',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','eb717366-136d-48e7-bb51-c014a42922a4'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef',1,'2021-02-01 18:49:36.882510',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','eb717366-136d-48e7-bb51-c014a42922a4'),('fba7a208-edf3-4d78-a5a9-be597575192f',7,'2021-02-01 18:49:36.882510',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `plans_methods` VALUES ('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','09ad4240-1861-4b39-9e93-fa32932f273f'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','439933b3-8801-43e0-b527-5259ac3bc0d3'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','86abff16-30e0-47ab-87ba-d42c09d8f528'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','bb23d342-de1d-4a98-bafd-2932929a25c3'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('f4438a3c-1f4d-4d68-ad3a-550bfd9eefef','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('86d3629f-461c-46f6-87f0-9d168476b8ed','09ad4240-1861-4b39-9e93-fa32932f273f'),('86d3629f-461c-46f6-87f0-9d168476b8ed','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('86d3629f-461c-46f6-87f0-9d168476b8ed','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('86d3629f-461c-46f6-87f0-9d168476b8ed','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('86d3629f-461c-46f6-87f0-9d168476b8ed','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('86d3629f-461c-46f6-87f0-9d168476b8ed','439933b3-8801-43e0-b527-5259ac3bc0d3'),('86d3629f-461c-46f6-87f0-9d168476b8ed','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('86d3629f-461c-46f6-87f0-9d168476b8ed','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('86d3629f-461c-46f6-87f0-9d168476b8ed','86abff16-30e0-47ab-87ba-d42c09d8f528'),('86d3629f-461c-46f6-87f0-9d168476b8ed','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('86d3629f-461c-46f6-87f0-9d168476b8ed','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('86d3629f-461c-46f6-87f0-9d168476b8ed','bb23d342-de1d-4a98-bafd-2932929a25c3'),('86d3629f-461c-46f6-87f0-9d168476b8ed','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('86d3629f-461c-46f6-87f0-9d168476b8ed','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('942e9420-57a0-49d3-832e-b75cbedba587','09ad4240-1861-4b39-9e93-fa32932f273f'),('942e9420-57a0-49d3-832e-b75cbedba587','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('942e9420-57a0-49d3-832e-b75cbedba587','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('942e9420-57a0-49d3-832e-b75cbedba587','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('942e9420-57a0-49d3-832e-b75cbedba587','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('942e9420-57a0-49d3-832e-b75cbedba587','439933b3-8801-43e0-b527-5259ac3bc0d3'),('942e9420-57a0-49d3-832e-b75cbedba587','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('942e9420-57a0-49d3-832e-b75cbedba587','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('942e9420-57a0-49d3-832e-b75cbedba587','86abff16-30e0-47ab-87ba-d42c09d8f528'),('942e9420-57a0-49d3-832e-b75cbedba587','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('942e9420-57a0-49d3-832e-b75cbedba587','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('942e9420-57a0-49d3-832e-b75cbedba587','bb23d342-de1d-4a98-bafd-2932929a25c3'),('942e9420-57a0-49d3-832e-b75cbedba587','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('942e9420-57a0-49d3-832e-b75cbedba587','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','09ad4240-1861-4b39-9e93-fa32932f273f'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','439933b3-8801-43e0-b527-5259ac3bc0d3'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','86abff16-30e0-47ab-87ba-d42c09d8f528'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','bb23d342-de1d-4a98-bafd-2932929a25c3'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('13d995c5-e88f-4d0f-b1d7-6e0620372426','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('fba7a208-edf3-4d78-a5a9-be597575192f','09ad4240-1861-4b39-9e93-fa32932f273f'),('fba7a208-edf3-4d78-a5a9-be597575192f','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('fba7a208-edf3-4d78-a5a9-be597575192f','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('fba7a208-edf3-4d78-a5a9-be597575192f','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('fba7a208-edf3-4d78-a5a9-be597575192f','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('fba7a208-edf3-4d78-a5a9-be597575192f','439933b3-8801-43e0-b527-5259ac3bc0d3'),('fba7a208-edf3-4d78-a5a9-be597575192f','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('fba7a208-edf3-4d78-a5a9-be597575192f','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('fba7a208-edf3-4d78-a5a9-be597575192f','86abff16-30e0-47ab-87ba-d42c09d8f528'),('fba7a208-edf3-4d78-a5a9-be597575192f','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('fba7a208-edf3-4d78-a5a9-be597575192f','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('fba7a208-edf3-4d78-a5a9-be597575192f','bb23d342-de1d-4a98-bafd-2932929a25c3'),('fba7a208-edf3-4d78-a5a9-be597575192f','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('fba7a208-edf3-4d78-a5a9-be597575192f','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('066697ba-55ca-4a95-9d99-0810176a3246','09ad4240-1861-4b39-9e93-fa32932f273f'),('066697ba-55ca-4a95-9d99-0810176a3246','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('066697ba-55ca-4a95-9d99-0810176a3246','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('066697ba-55ca-4a95-9d99-0810176a3246','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('066697ba-55ca-4a95-9d99-0810176a3246','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('066697ba-55ca-4a95-9d99-0810176a3246','439933b3-8801-43e0-b527-5259ac3bc0d3'),('066697ba-55ca-4a95-9d99-0810176a3246','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('066697ba-55ca-4a95-9d99-0810176a3246','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('066697ba-55ca-4a95-9d99-0810176a3246','86abff16-30e0-47ab-87ba-d42c09d8f528'),('066697ba-55ca-4a95-9d99-0810176a3246','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('066697ba-55ca-4a95-9d99-0810176a3246','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('066697ba-55ca-4a95-9d99-0810176a3246','bb23d342-de1d-4a98-bafd-2932929a25c3'),('066697ba-55ca-4a95-9d99-0810176a3246','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('066697ba-55ca-4a95-9d99-0810176a3246','e86c2927-49e2-4cc5-8b84-8923cab9bf66'),('0974bafa-d003-4198-a827-1fcb18f00e2b','09ad4240-1861-4b39-9e93-fa32932f273f'),('0974bafa-d003-4198-a827-1fcb18f00e2b','1377dab5-d29d-4ed1-b31a-7d3495181b52'),('0974bafa-d003-4198-a827-1fcb18f00e2b','34afe500-001c-4e5f-b98c-22a2402ae6cd'),('0974bafa-d003-4198-a827-1fcb18f00e2b','3a893b88-a9e0-4490-8f67-12907a52d3a7'),('0974bafa-d003-4198-a827-1fcb18f00e2b','3fa2e63d-69a0-4dc0-9e36-581a86e7a272'),('0974bafa-d003-4198-a827-1fcb18f00e2b','439933b3-8801-43e0-b527-5259ac3bc0d3'),('0974bafa-d003-4198-a827-1fcb18f00e2b','4f319201-0cba-43a3-9ce0-d7f05ee13354'),('0974bafa-d003-4198-a827-1fcb18f00e2b','5daaf343-4c77-4a90-a97f-36c6e4f17f45'),('0974bafa-d003-4198-a827-1fcb18f00e2b','86abff16-30e0-47ab-87ba-d42c09d8f528'),('0974bafa-d003-4198-a827-1fcb18f00e2b','8cbf00dc-25f2-44dc-a70d-ecebf608bf36'),('0974bafa-d003-4198-a827-1fcb18f00e2b','a2eff2c2-be27-479d-bd4d-26be4d054a7e'),('0974bafa-d003-4198-a827-1fcb18f00e2b','bb23d342-de1d-4a98-bafd-2932929a25c3'),('0974bafa-d003-4198-a827-1fcb18f00e2b','df9aa541-3742-4247-9958-d8d6a6ca7a2c'),('0974bafa-d003-4198-a827-1fcb18f00e2b','e86c2927-49e2-4cc5-8b84-8923cab9bf66');
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
INSERT INTO `roles` VALUES ('1c11fdd1-995f-47ca-ac71-c89ff1714e17','ADMIN'),('49319964-bf11-4653-af16-056ff6e04c43','ROOT'),('5e75d799-e0fa-4512-8b21-26c32ec29657','USER'),('e9785ff4-ddd2-4fc4-a05a-e7011b2b8a09','UNCONFIRMED');
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
INSERT INTO `ticket` VALUES ('081bf722-eae7-4f2a-a511-17db8c6f0078','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.965429','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('08d0dfed-326f-4f80-9c0c-4df0c84f2316','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.222525','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('0e9959e4-1f0a-4b13-8dd4-1b22fa94268e','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.061725','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('113a4347-2cc9-4ef5-b208-5e5efd5526e8','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.678667','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('1eca93b3-2ab9-4de4-bb22-38d3078e8ccb','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.829418','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('207e6431-78d0-47cb-b0ba-0f43bd6106aa','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.473327','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('2aa4e4ae-aa4f-490e-83b9-544dacea90b4','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:48.037002','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('3e7431e8-42ab-452b-a00b-6737f91e9ade','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.327317','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('3f48f09a-9883-42df-b4a6-b9959ef2109e','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.505973','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('4a61f818-07eb-4a66-9393-6a5749c01860','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.431315','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('57420462-4286-46d1-b90a-4f3b39bd1d6a','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.936422','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('5e5b449a-4bf0-4575-a92b-b7415af296e7','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.298015','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('6105160d-0ac9-4a6e-8ccd-3ee9fc0088c7','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.252490','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('72087c69-baa3-407f-85dc-b10b460c9596','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.149123','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('8bf5acb2-c429-4264-8c82-bc2053f58af9','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.604229','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('a3d1cd35-abaa-4d75-86ac-54d2346f541a','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.750481','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('a408de4c-5c6c-4f84-8669-491469c85073','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.721493','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('a5082b0a-879a-464a-8e45-6418a2e85c71','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.174976','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('ad56f6c4-cb4b-4b6a-b3bc-8dd4fa6f7bf6','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.091689','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('bc150143-89de-439c-a82b-cd2d0065be43','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.355324','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('bc251705-c0ec-461c-8eae-822975ac85cb','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.111688','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('be7a08c3-ffc7-4ff7-b0a8-79e1c646057e','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.780862','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('c6efbb98-0014-4da9-b7fa-d896ba998928','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.400315','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('c9ec08d0-5c53-46fb-97ac-506d20817b15','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:48.008785','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('d73d3c5a-7b97-4996-a8b9-121aabbaf5d2','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.649998','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('de0dd11c-bc7f-4f45-b765-4e4ad94b202e','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.906422','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('e0cb7370-7782-4150-8c02-768cf16cd287','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.577233','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('e261107c-69ec-49dd-bee8-b53a69c1b895','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:48.077044','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('e46b2c53-11ea-47aa-8907-13052ba9ba8c','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.874419','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa'),('e54832f1-2fd1-46c1-ace1-c2c99690363c','valeri125we@gmail.com',_binary '\0','2021-02-01 18:50:47.535670','dsadsaiodsadjsaldksalkdljsljdaskldlsakd','sadsadsadsadsadsa');
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
INSERT INTO `transaction` VALUES ('0a754d54-91e8-4f95-b987-0815dbf4a09e','2021-02-01 18:49:37.745591',NULL,'0974bafa-d003-4198-a827-1fcb18f00e2b','489ba0b7-34e1-4b52-8233-c0c5f4d04377'),('25616c97-e768-45b9-b54e-dd6c44d11aa1','2021-02-01 18:49:37.627602',NULL,'066697ba-55ca-4a95-9d99-0810176a3246','1acd0806-1385-43d4-98a3-43091875bf0c'),('eaf84d4d-ac95-4b0c-b42e-57906671cfe2','2021-02-01 18:49:37.518598',NULL,'066697ba-55ca-4a95-9d99-0810176a3246','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `users` VALUES ('1acd0806-1385-43d4-98a3-43091875bf0c','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$sR43Qwcnvw.DAwXdPFnMxO2QZ1p2DAJ9vsPqhUbSQ/g.Yw2SGW3mW','2021-02-01 18:49:36.375586','Google'),('489ba0b7-34e1-4b52-8233-c0c5f4d04377','normal@gmail.com','',_binary '','$2a$10$fxNVYVffosa9zIZ35Gvgc.CAD4OGPcjlsTTW7eSsaFiepekmq51bW','2021-02-01 18:49:36.591508','normal'),('eb717366-136d-48e7-bb51-c014a42922a4','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$BAUsxvTznsTj8eQAfpv81OlUN5oZjRx1qIIEc9rVmvbXaksrmyMsS','2021-02-01 18:49:36.132599','Pride');
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
INSERT INTO `users_active_plan` VALUES ('0656c735-810c-4d2d-9b8b-737e7533b7cf',10,36500,'2021-02-01 18:49:37.702595','0974bafa-d003-4198-a827-1fcb18f00e2b','489ba0b7-34e1-4b52-8233-c0c5f4d04377'),('48e9f95e-0cd2-4fb1-9d6e-cdf3a29b20a0',999,36500,'2021-02-01 18:49:37.597641','066697ba-55ca-4a95-9d99-0810176a3246','1acd0806-1385-43d4-98a3-43091875bf0c'),('87052b08-18ce-4fea-ae81-ad1b65de5af9',999,36500,'2021-02-01 18:49:37.477646','066697ba-55ca-4a95-9d99-0810176a3246','eb717366-136d-48e7-bb51-c014a42922a4');
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
INSERT INTO `users_roles` VALUES ('1acd0806-1385-43d4-98a3-43091875bf0c','1c11fdd1-995f-47ca-ac71-c89ff1714e17'),('eb717366-136d-48e7-bb51-c014a42922a4','1c11fdd1-995f-47ca-ac71-c89ff1714e17'),('1acd0806-1385-43d4-98a3-43091875bf0c','49319964-bf11-4653-af16-056ff6e04c43'),('eb717366-136d-48e7-bb51-c014a42922a4','49319964-bf11-4653-af16-056ff6e04c43'),('1acd0806-1385-43d4-98a3-43091875bf0c','5e75d799-e0fa-4512-8b21-26c32ec29657'),('489ba0b7-34e1-4b52-8233-c0c5f4d04377','5e75d799-e0fa-4512-8b21-26c32ec29657'),('eb717366-136d-48e7-bb51-c014a42922a4','5e75d799-e0fa-4512-8b21-26c32ec29657');
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

