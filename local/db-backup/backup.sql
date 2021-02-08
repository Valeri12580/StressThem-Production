
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
INSERT INTO `announcement` VALUES ('93976eb4-ef25-4cde-b274-82219476e049','2021-02-08 11:48:01.427534','Our servives are down due maintance','Our services are down','c0704258-f8be-462b-b78f-964769c9cd6d');
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
INSERT INTO `article` VALUES ('7bfab298-b05d-4cd0-9b2d-43a4d7c4fca6','2021-02-08 11:48:01.461531','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','c0704258-f8be-462b-b78f-964769c9cd6d'),('f48f5088-78f9-41fe-b595-0324e0fa452a','2021-02-08 12:48:01.461531','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'c0704258-f8be-462b-b78f-964769c9cd6d');
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
INSERT INTO `comment` VALUES ('5d3128f3-0d3d-4cc0-a562-155dcf310c23','Bypasses cloudflare!!!',4,'d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3'),('b828dce3-de29-4ea6-a26e-3e7a57f4d54f','The best stresser on the market with the cheapest prices...',5,'c0704258-f8be-462b-b78f-964769c9cd6d');
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
INSERT INTO `cryptocurrencies` VALUES ('29cd7de7-b097-4785-8c3a-8a27c132e955','2021-02-08 11:48:01.543530','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','c0704258-f8be-462b-b78f-964769c9cd6d'),('5aa16e84-c0f8-4043-970d-745daed9a6cd','2021-02-08 11:48:01.543530','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','c0704258-f8be-462b-b78f-964769c9cd6d');
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
INSERT INTO `methods` VALUES ('023a72b3-cf08-44dd-80be-856cf3b1f56f','HTTPstormMIX'),('09d066b0-0e82-4a33-aafd-a08f6e088d8f','CFCrasher2'),('0d7a223c-64c1-45d1-824e-50ed0cae9fa3','Mixed'),('12bc4af4-8d9c-4276-b767-415ee91e8c85','xFreeze'),('18ff83a7-7e66-46c0-8fbc-e8f127d4af7d','FiveM'),('31f9bddc-f5e3-4497-a0f3-3e13858e8dc4','SpaceX'),('662366b8-4192-4369-98f9-021bcbd38c1e','PathFinder'),('7262f0f0-fbb0-4b32-99c6-749b033e659f','RandPackets'),('8dff82d1-c31d-4fac-9884-91d0fecc31c3','UAMBypass'),('ace5ef8d-d7ad-4634-b556-b615ea49d054','HTTPstormSG'),('af6934c8-b739-4574-92b7-fd0abbd9445a','httpRND'),('b5319382-6346-4d1e-9289-2d3a932a4ca9','CFCrasher1'),('ccf45d33-7a6d-4745-b9bf-9089b2aefc92','HTTPstormPG'),('f9f92a9d-0b08-44d2-bb58-ac7d379fb22d','HTTPrequest');
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
INSERT INTO `payment_codes` VALUES ('0022b419-826f-4138-8e08-23b82542ffb8','basictest2',_binary '\0','c0704258-f8be-462b-b78f-964769c9cd6d','593d5c6c-1c3e-42a4-a52d-028f2cb4522e'),('5f7705c4-677a-46a2-8cb2-01d4fa9c0b21','basictest1',_binary '\0','c0704258-f8be-462b-b78f-964769c9cd6d','593d5c6c-1c3e-42a4-a52d-028f2cb4522e');
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
INSERT INTO `plans` VALUES ('11a74b00-c116-4037-b65d-83a3dfb1db58',3,'2021-02-08 11:48:00.922455',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','c0704258-f8be-462b-b78f-964769c9cd6d'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413',2,'2021-02-08 11:48:00.922455',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','c0704258-f8be-462b-b78f-964769c9cd6d'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e',1,'2021-02-08 11:48:00.922455',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','c0704258-f8be-462b-b78f-964769c9cd6d'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841',1,'2021-02-08 11:48:00.922455',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','c0704258-f8be-462b-b78f-964769c9cd6d'),('9396f56e-69c5-4623-891e-a9cf3552cbd4',4,'2021-02-08 11:48:00.922455',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','c0704258-f8be-462b-b78f-964769c9cd6d'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2',2,'2021-02-08 11:48:00.922455',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','c0704258-f8be-462b-b78f-964769c9cd6d'),('e0bc9524-50f2-4674-9047-d30798d7b698',7,'2021-02-08 11:48:00.922455',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','c0704258-f8be-462b-b78f-964769c9cd6d');
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
INSERT INTO `plans_methods` VALUES ('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','662366b8-4192-4369-98f9-021bcbd38c1e'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','af6934c8-b739-4574-92b7-fd0abbd9445a'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('593d5c6c-1c3e-42a4-a52d-028f2cb4522e','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','662366b8-4192-4369-98f9-021bcbd38c1e'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','af6934c8-b739-4574-92b7-fd0abbd9445a'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('564d8e91-1478-4f8e-a1ee-81cb67f0d413','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','662366b8-4192-4369-98f9-021bcbd38c1e'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','af6934c8-b739-4574-92b7-fd0abbd9445a'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('cfd82667-9123-48f0-a13c-ae012c9fe2b2','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('11a74b00-c116-4037-b65d-83a3dfb1db58','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('11a74b00-c116-4037-b65d-83a3dfb1db58','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('11a74b00-c116-4037-b65d-83a3dfb1db58','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('11a74b00-c116-4037-b65d-83a3dfb1db58','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('11a74b00-c116-4037-b65d-83a3dfb1db58','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('11a74b00-c116-4037-b65d-83a3dfb1db58','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('11a74b00-c116-4037-b65d-83a3dfb1db58','662366b8-4192-4369-98f9-021bcbd38c1e'),('11a74b00-c116-4037-b65d-83a3dfb1db58','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('11a74b00-c116-4037-b65d-83a3dfb1db58','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('11a74b00-c116-4037-b65d-83a3dfb1db58','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('11a74b00-c116-4037-b65d-83a3dfb1db58','af6934c8-b739-4574-92b7-fd0abbd9445a'),('11a74b00-c116-4037-b65d-83a3dfb1db58','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('11a74b00-c116-4037-b65d-83a3dfb1db58','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('11a74b00-c116-4037-b65d-83a3dfb1db58','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('e0bc9524-50f2-4674-9047-d30798d7b698','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('e0bc9524-50f2-4674-9047-d30798d7b698','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('e0bc9524-50f2-4674-9047-d30798d7b698','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('e0bc9524-50f2-4674-9047-d30798d7b698','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('e0bc9524-50f2-4674-9047-d30798d7b698','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('e0bc9524-50f2-4674-9047-d30798d7b698','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('e0bc9524-50f2-4674-9047-d30798d7b698','662366b8-4192-4369-98f9-021bcbd38c1e'),('e0bc9524-50f2-4674-9047-d30798d7b698','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('e0bc9524-50f2-4674-9047-d30798d7b698','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('e0bc9524-50f2-4674-9047-d30798d7b698','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('e0bc9524-50f2-4674-9047-d30798d7b698','af6934c8-b739-4574-92b7-fd0abbd9445a'),('e0bc9524-50f2-4674-9047-d30798d7b698','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('e0bc9524-50f2-4674-9047-d30798d7b698','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('e0bc9524-50f2-4674-9047-d30798d7b698','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','662366b8-4192-4369-98f9-021bcbd38c1e'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','af6934c8-b739-4574-92b7-fd0abbd9445a'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('9396f56e-69c5-4623-891e-a9cf3552cbd4','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','023a72b3-cf08-44dd-80be-856cf3b1f56f'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','09d066b0-0e82-4a33-aafd-a08f6e088d8f'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','0d7a223c-64c1-45d1-824e-50ed0cae9fa3'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','12bc4af4-8d9c-4276-b767-415ee91e8c85'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','18ff83a7-7e66-46c0-8fbc-e8f127d4af7d'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','31f9bddc-f5e3-4497-a0f3-3e13858e8dc4'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','662366b8-4192-4369-98f9-021bcbd38c1e'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','7262f0f0-fbb0-4b32-99c6-749b033e659f'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','8dff82d1-c31d-4fac-9884-91d0fecc31c3'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','ace5ef8d-d7ad-4634-b556-b615ea49d054'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','af6934c8-b739-4574-92b7-fd0abbd9445a'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','b5319382-6346-4d1e-9289-2d3a932a4ca9'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','ccf45d33-7a6d-4745-b9bf-9089b2aefc92'),('8421bc7a-1c39-4f0e-9d96-51ad990ab841','f9f92a9d-0b08-44d2-bb58-ac7d379fb22d');
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
INSERT INTO `roles` VALUES ('46ccd654-d785-49c4-8d65-045308e0bceb','ADMIN'),('94b0d18f-df29-4cd2-8a0a-a5e5d2aed297','UNCONFIRMED'),('dc4fd729-fe1e-4a13-beaf-772861b252b2','ROOT'),('f3be3865-ba15-4642-9280-69f07ad7da92','USER');
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
INSERT INTO `ticket` VALUES ('52c3e8ec-9fb3-40b2-85da-457c5548c492','2021-02-08 11:53:01.836775','valeri125we@gmail.com',_binary '\0','sdaaaaaaaaaaaaaaaaaaaaaadsadasdsa','I tried to delete my account but im not receiving email'),('5759dc7b-010e-46e0-9cb6-3ede66129fcf','2021-02-08 11:52:32.903929','valeri125we@gmail.com',_binary '\0','тестсааааааааааадсадасдасд','I tried to delete my account but im not receiving email');
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
INSERT INTO `transaction` VALUES ('613f6766-0cb7-40d1-844d-707942c036ac','2021-02-08 11:48:01.394530',NULL,'8421bc7a-1c39-4f0e-9d96-51ad990ab841','c5f3620e-756f-43af-afee-01808a50a717'),('c434dce6-4726-4424-9e6e-2f26325396e9','2021-02-08 11:48:01.287529',NULL,'9396f56e-69c5-4623-891e-a9cf3552cbd4','c0704258-f8be-462b-b78f-964769c9cd6d'),('cf393065-1fef-448c-87c8-f8507ace94ee','2021-02-08 11:48:01.344531',NULL,'9396f56e-69c5-4623-891e-a9cf3552cbd4','d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3');
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
INSERT INTO `users` VALUES ('c0704258-f8be-462b-b78f-964769c9cd6d','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$SFSHXV7P46hba2j2n2KsTeQNTCxKGnRkCat3dITWxtBL6UHVab8ZO','2021-02-08 11:48:00.567285','Pride'),('c5f3620e-756f-43af-afee-01808a50a717','normal@gmail.com','',_binary '','$2a$10$FHEf1aRJ/pnugkQ7ZU2NX.PCjjmC1/FhlEd9wI0QFfd3DKW1NJ6py','2021-02-08 11:48:00.771303','normal'),('d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$.a65SS/TX01h0F9.JGoKruOsYcjkC28F0XviZNXTjSDhMODv7xPv2','2021-02-08 11:48:00.674298','Google');
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
INSERT INTO `users_active_plan` VALUES ('0b6fa45f-3851-4a44-8db4-df19cc3eb268',999,36500,'2021-02-08 11:48:01.329532','9396f56e-69c5-4623-891e-a9cf3552cbd4','d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3'),('4f5100f1-b419-40c8-9f60-bcff10abe3ba',999,36500,'2021-02-08 11:48:01.261554','9396f56e-69c5-4623-891e-a9cf3552cbd4','c0704258-f8be-462b-b78f-964769c9cd6d'),('814231cd-6ab6-49b5-86a2-25c9de559cb7',10,36500,'2021-02-08 11:48:01.379532','8421bc7a-1c39-4f0e-9d96-51ad990ab841','c5f3620e-756f-43af-afee-01808a50a717');
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
INSERT INTO `users_roles` VALUES ('c0704258-f8be-462b-b78f-964769c9cd6d','46ccd654-d785-49c4-8d65-045308e0bceb'),('d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3','46ccd654-d785-49c4-8d65-045308e0bceb'),('c0704258-f8be-462b-b78f-964769c9cd6d','dc4fd729-fe1e-4a13-beaf-772861b252b2'),('d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3','dc4fd729-fe1e-4a13-beaf-772861b252b2'),('c0704258-f8be-462b-b78f-964769c9cd6d','f3be3865-ba15-4642-9280-69f07ad7da92'),('c5f3620e-756f-43af-afee-01808a50a717','f3be3865-ba15-4642-9280-69f07ad7da92'),('d40cff40-ed5e-4f86-aaa3-3d9bc6df7db3','f3be3865-ba15-4642-9280-69f07ad7da92');
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

