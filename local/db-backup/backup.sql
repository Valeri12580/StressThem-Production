
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
INSERT INTO `announcement` VALUES ('9da6dd39-a434-4d01-b0cf-744a97d9c952','2021-01-31 13:54:44.855825','Our servives are down due maintance','Our services are down','57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `article` VALUES ('07858bb4-d343-4080-9e75-3e14a83d0c45','2021-01-31 13:54:44.919825','Welcome to our website.Here you can find various services that will help you test your resources or something else ;)','Our website is launched!','https://images.idgesg.net/images/article/2020/05/server_racks_close-up_perspective_shot_by_monsitj_gettyimages-918951042_cso_nw_2400x1600-100841600-large.jpg','57c6949b-984e-467b-b4cb-2f226c843682'),('53bc302b-8e26-487c-861f-30fb22ace763','2021-01-31 14:54:44.919825','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sed enim eu nunc dignissim pretium. Vivamus eu blandit sem. Vivamus elit ipsum, vehicula id augue in, rhoncus volutpat odio. Nulla hendrerit sem a purus condimentum, id tincidunt tortor sagittis. Nulla auctor posuere lacus, sit amet condimentum magna imperdiet a. Pellentesque ultricies ac sapien sed semper. Mauris blandit enim auctor nibh facilisis, sed bibendum tellus imperdiet. Donec odio est, pharetra ut interdum in, commodo eu velit. Praesent sem eros, tempus nec laoreet a, semper eu arcu. Duis sagittis fringilla sapien a rhoncus. Maecenas at sapien id orci feugiat rhoncus eu vel nibh. Nulla suscipit ultrices est. Nullam diam ipsum, viverra eget turpis eget, dignissim sollicitudin odio.','Lorem Ipsum',NULL,'57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `comment` VALUES ('6fb97330-8ca9-4878-acb6-15c342526812','Bypasses cloudflare!!!',4,'d12ff92e-ed26-48ba-b213-c7ee015bb181'),('821b4228-74df-4d2e-8ee0-475e3a3f5f2e','The best stresser on the market with the cheapest prices...',5,'57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `cryptocurrencies` VALUES ('a3d977a6-f7b5-4a2b-95b6-496849888219','2021-01-31 13:54:45.001826','Bitcoin was the first cryptocurrency to successfully record transactions on a secure, decentralized blockchain-based network. Launched in early 2009 by its pseudonymous creator Satoshi Nakamoto, Bitcoin is the largest cryptocurrency measured by market capitalization and amount of data stored on its blockchain.','Bitcoin','https://static.coindesk.com/wp-content/uploads/2018/11/dark-bitcoin-scaled.jpg','57c6949b-984e-467b-b4cb-2f226c843682'),('b0b956be-d05a-48f6-bb18-37b99d1ada4d','2021-01-31 13:54:45.001826','Ethereum is open access to digital money and data-friendly services for everyone – no matter your background or location. It\'s a community-built technology behind the cryptocurrency Ether (ETH) and thousands of applications you can use today.','Ethereum','https://www.investopedia.com/thmb/eLkTSBXs8esM5-XGr2IdhEI5pi8=/735x0/shutterstock_1030451626-5bfc30d646e0fb0026026b76.jpg','57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `methods` VALUES ('05f409e7-6028-4d18-9366-df7b323a19e3','PathFinder'),('0f5e612b-deae-4211-bdd5-60a33145bb24','UAMBypass'),('1135cfee-a741-49a1-9003-88494b5a7413','HTTPstormSG'),('24487a79-e255-4841-8b2c-aa92a492b46b','httpRND'),('2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f','HTTPstormPG'),('30cc59b6-fa95-40de-8365-52c429055f8a','CFCrasher2'),('8550ff68-8f60-4c26-b7af-fc84b6fddfdb','SpaceX'),('bac791d5-e0f0-4870-8ddc-8075089daaf7','CFCrasher1'),('bf792b38-1d8b-4691-b004-c0ed808b5664','RandPackets'),('c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6','HTTPstormMIX'),('ec072fe9-46e6-433b-b830-8e67e5fa99b5','Mixed'),('ed058be0-a49b-41e7-9d27-a177756e6aca','FiveM'),('ed4a57f6-f8ea-4e36-b9bb-dbb573a53083','HTTPrequest'),('f6a0591d-1215-4308-94d1-3471eb3f4629','xFreeze');
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
INSERT INTO `payment_codes` VALUES ('204348af-6541-420b-a7eb-97b58aba70e9','basictest2',_binary '\0','57c6949b-984e-467b-b4cb-2f226c843682','5775af15-2b15-4c59-a8d8-183aa66c510a'),('277eff38-ac23-4e98-a629-4a05fc94ca22','basictest1',_binary '\0','57c6949b-984e-467b-b4cb-2f226c843682','5775af15-2b15-4c59-a8d8-183aa66c510a');
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
INSERT INTO `plans` VALUES ('08000f3e-f981-4ca7-ab7b-6486780cc03d',2,'2021-01-31 13:54:44.304708',30,300,999,'https://shoppy.gg/product/Ar1b1YT',12.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC PLUS','57c6949b-984e-467b-b4cb-2f226c843682'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87',3,'2021-01-31 13:54:44.304708',30,900,999,'https://shoppy.gg/product/smw90oF',30.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM PLUS','57c6949b-984e-467b-b4cb-2f226c843682'),('5775af15-2b15-4c59-a8d8-183aa66c510a',1,'2021-01-31 13:54:44.304708',30,300,999,'https://shoppy.gg/product/YDzYBvf',8.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','BASIC','57c6949b-984e-467b-b4cb-2f226c843682'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483',4,'2021-01-31 13:54:44.304708',36500,3500,999,'https://shoppy.gg/product/W0o5HiM',170.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','LIFETIME','57c6949b-984e-467b-b4cb-2f226c843682'),('9d4738c7-f605-45f3-8759-45f9c265fd05',1,'2021-01-31 13:54:44.304708',36500,120,10,NULL,0.00,'DoxyAss-aS4xHudmadqpnR9jUeZBweXd','FREE','57c6949b-984e-467b-b4cb-2f226c843682'),('e07ffae3-018f-42ac-80b9-b2aafa386686',2,'2021-01-31 13:54:44.304708',30,900,999,'https://shoppy.gg/product/ol3VpJO',25.00,'DoxyAss-EESTYR8QEg9EkGnYgFh5TGEe','PREMIUM','57c6949b-984e-467b-b4cb-2f226c843682'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1',7,'2021-01-31 13:54:44.304708',30,3500,999,'https://shoppy.gg/product/2uYDrUS',70.00,'DoxyAss-Jdtk3GDZcTaQ96Kgasdasdasd','BOOSTED','57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `plans_methods` VALUES ('5775af15-2b15-4c59-a8d8-183aa66c510a','05f409e7-6028-4d18-9366-df7b323a19e3'),('5775af15-2b15-4c59-a8d8-183aa66c510a','0f5e612b-deae-4211-bdd5-60a33145bb24'),('5775af15-2b15-4c59-a8d8-183aa66c510a','1135cfee-a741-49a1-9003-88494b5a7413'),('5775af15-2b15-4c59-a8d8-183aa66c510a','24487a79-e255-4841-8b2c-aa92a492b46b'),('5775af15-2b15-4c59-a8d8-183aa66c510a','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('5775af15-2b15-4c59-a8d8-183aa66c510a','30cc59b6-fa95-40de-8365-52c429055f8a'),('5775af15-2b15-4c59-a8d8-183aa66c510a','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('5775af15-2b15-4c59-a8d8-183aa66c510a','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('5775af15-2b15-4c59-a8d8-183aa66c510a','bf792b38-1d8b-4691-b004-c0ed808b5664'),('5775af15-2b15-4c59-a8d8-183aa66c510a','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('5775af15-2b15-4c59-a8d8-183aa66c510a','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('5775af15-2b15-4c59-a8d8-183aa66c510a','ed058be0-a49b-41e7-9d27-a177756e6aca'),('5775af15-2b15-4c59-a8d8-183aa66c510a','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('5775af15-2b15-4c59-a8d8-183aa66c510a','f6a0591d-1215-4308-94d1-3471eb3f4629'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','05f409e7-6028-4d18-9366-df7b323a19e3'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','0f5e612b-deae-4211-bdd5-60a33145bb24'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','1135cfee-a741-49a1-9003-88494b5a7413'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','24487a79-e255-4841-8b2c-aa92a492b46b'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','30cc59b6-fa95-40de-8365-52c429055f8a'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','bf792b38-1d8b-4691-b004-c0ed808b5664'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','ed058be0-a49b-41e7-9d27-a177756e6aca'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('08000f3e-f981-4ca7-ab7b-6486780cc03d','f6a0591d-1215-4308-94d1-3471eb3f4629'),('e07ffae3-018f-42ac-80b9-b2aafa386686','05f409e7-6028-4d18-9366-df7b323a19e3'),('e07ffae3-018f-42ac-80b9-b2aafa386686','0f5e612b-deae-4211-bdd5-60a33145bb24'),('e07ffae3-018f-42ac-80b9-b2aafa386686','1135cfee-a741-49a1-9003-88494b5a7413'),('e07ffae3-018f-42ac-80b9-b2aafa386686','24487a79-e255-4841-8b2c-aa92a492b46b'),('e07ffae3-018f-42ac-80b9-b2aafa386686','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('e07ffae3-018f-42ac-80b9-b2aafa386686','30cc59b6-fa95-40de-8365-52c429055f8a'),('e07ffae3-018f-42ac-80b9-b2aafa386686','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('e07ffae3-018f-42ac-80b9-b2aafa386686','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('e07ffae3-018f-42ac-80b9-b2aafa386686','bf792b38-1d8b-4691-b004-c0ed808b5664'),('e07ffae3-018f-42ac-80b9-b2aafa386686','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('e07ffae3-018f-42ac-80b9-b2aafa386686','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('e07ffae3-018f-42ac-80b9-b2aafa386686','ed058be0-a49b-41e7-9d27-a177756e6aca'),('e07ffae3-018f-42ac-80b9-b2aafa386686','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('e07ffae3-018f-42ac-80b9-b2aafa386686','f6a0591d-1215-4308-94d1-3471eb3f4629'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','05f409e7-6028-4d18-9366-df7b323a19e3'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','0f5e612b-deae-4211-bdd5-60a33145bb24'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','1135cfee-a741-49a1-9003-88494b5a7413'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','24487a79-e255-4841-8b2c-aa92a492b46b'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','30cc59b6-fa95-40de-8365-52c429055f8a'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','bf792b38-1d8b-4691-b004-c0ed808b5664'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','ed058be0-a49b-41e7-9d27-a177756e6aca'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('2d8adeab-9668-4cb5-a746-5ee0c0923f87','f6a0591d-1215-4308-94d1-3471eb3f4629'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','05f409e7-6028-4d18-9366-df7b323a19e3'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','0f5e612b-deae-4211-bdd5-60a33145bb24'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','1135cfee-a741-49a1-9003-88494b5a7413'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','24487a79-e255-4841-8b2c-aa92a492b46b'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','30cc59b6-fa95-40de-8365-52c429055f8a'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','bf792b38-1d8b-4691-b004-c0ed808b5664'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','ed058be0-a49b-41e7-9d27-a177756e6aca'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('e9d4f439-6270-4665-a1a9-96fb6330d4c1','f6a0591d-1215-4308-94d1-3471eb3f4629'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','05f409e7-6028-4d18-9366-df7b323a19e3'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','0f5e612b-deae-4211-bdd5-60a33145bb24'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','1135cfee-a741-49a1-9003-88494b5a7413'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','24487a79-e255-4841-8b2c-aa92a492b46b'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','30cc59b6-fa95-40de-8365-52c429055f8a'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','bf792b38-1d8b-4691-b004-c0ed808b5664'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','ed058be0-a49b-41e7-9d27-a177756e6aca'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('7c1f4732-f256-4aaf-ad73-3634fd3e0483','f6a0591d-1215-4308-94d1-3471eb3f4629'),('9d4738c7-f605-45f3-8759-45f9c265fd05','05f409e7-6028-4d18-9366-df7b323a19e3'),('9d4738c7-f605-45f3-8759-45f9c265fd05','0f5e612b-deae-4211-bdd5-60a33145bb24'),('9d4738c7-f605-45f3-8759-45f9c265fd05','1135cfee-a741-49a1-9003-88494b5a7413'),('9d4738c7-f605-45f3-8759-45f9c265fd05','24487a79-e255-4841-8b2c-aa92a492b46b'),('9d4738c7-f605-45f3-8759-45f9c265fd05','2d40b3ff-4a5a-40e8-9f7e-9e4352b4af8f'),('9d4738c7-f605-45f3-8759-45f9c265fd05','30cc59b6-fa95-40de-8365-52c429055f8a'),('9d4738c7-f605-45f3-8759-45f9c265fd05','8550ff68-8f60-4c26-b7af-fc84b6fddfdb'),('9d4738c7-f605-45f3-8759-45f9c265fd05','bac791d5-e0f0-4870-8ddc-8075089daaf7'),('9d4738c7-f605-45f3-8759-45f9c265fd05','bf792b38-1d8b-4691-b004-c0ed808b5664'),('9d4738c7-f605-45f3-8759-45f9c265fd05','c7bf69c8-edc6-40e2-8b9e-1a5b3642f9b6'),('9d4738c7-f605-45f3-8759-45f9c265fd05','ec072fe9-46e6-433b-b830-8e67e5fa99b5'),('9d4738c7-f605-45f3-8759-45f9c265fd05','ed058be0-a49b-41e7-9d27-a177756e6aca'),('9d4738c7-f605-45f3-8759-45f9c265fd05','ed4a57f6-f8ea-4e36-b9bb-dbb573a53083'),('9d4738c7-f605-45f3-8759-45f9c265fd05','f6a0591d-1215-4308-94d1-3471eb3f4629');
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
INSERT INTO `roles` VALUES ('4f8a2f8d-f6fd-4830-b536-01d45982d3c7','ADMIN'),('6a4be00d-5365-4029-826d-eb72741ef82f','UNCONFIRMED'),('84eabbe0-a9f3-42f8-a66d-ce104cc55c14','ROOT'),('b888dadc-3796-4524-856b-48b27907e2fe','USER');
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
INSERT INTO `transaction` VALUES ('b6fd1853-dedc-40d5-b903-dca84e77af64','2021-01-31 13:54:44.762825',NULL,'7c1f4732-f256-4aaf-ad73-3634fd3e0483','d12ff92e-ed26-48ba-b213-c7ee015bb181'),('cdfe1cd6-9252-4b74-a924-0a5dbd7774aa','2021-01-31 13:54:44.811824',NULL,'9d4738c7-f605-45f3-8759-45f9c265fd05','6a6e9cde-419b-4e9c-83bd-ab5e429cdc51'),('dfc9b4c6-632a-45a4-beee-672a7c0d4f5f','2021-01-31 13:54:44.688263',NULL,'7c1f4732-f256-4aaf-ad73-3634fd3e0483','57c6949b-984e-467b-b4cb-2f226c843682');
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
INSERT INTO `users` VALUES ('57c6949b-984e-467b-b4cb-2f226c843682','pride@gmail.com','https://i.ytimg.com/vi/WhIrvsbEJ6Q/maxresdefault.jpg',_binary '','$2a$10$mSapH6ZDoCRpRVta4RM9oeGiQKbYBBNEVtPUhAX0GzzlJWS7.tJOS','2021-01-31 13:54:43.912000','Pride'),('6a6e9cde-419b-4e9c-83bd-ab5e429cdc51','normal@gmail.com','',_binary '','$2a$10$iaj1th8zMD.kGEb5cuNkqeyGLTG.EgxVqqF8c5yTBYIMhbpAu9rQS','2021-01-31 13:54:44.107992','normal'),('d12ff92e-ed26-48ba-b213-c7ee015bb181','google@gmail.com','https://i.pinimg.com/564x/f8/a1/e9/f8a1e948ae5109629e4dd84c2ce1cf55.jpg',_binary '','$2a$10$.DdXwrG8axyKt/jjyjuQYui9OzxDmBWv.iwsjtydGWR5BMfHIYA0O','2021-01-31 13:54:44.014957','Google');
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
INSERT INTO `users_active_plan` VALUES ('1634d4e6-35c7-4b54-9e20-1d25ac9e5163',999,36500,'2021-01-31 13:54:44.668269','7c1f4732-f256-4aaf-ad73-3634fd3e0483','57c6949b-984e-467b-b4cb-2f226c843682'),('9082f242-b276-416c-b8b8-b49cc91b2a88',10,36500,'2021-01-31 13:54:44.792826','9d4738c7-f605-45f3-8759-45f9c265fd05','6a6e9cde-419b-4e9c-83bd-ab5e429cdc51'),('e55bea4f-2d5e-4fac-96cc-2bc8c9edfce9',999,36500,'2021-01-31 13:54:44.748824','7c1f4732-f256-4aaf-ad73-3634fd3e0483','d12ff92e-ed26-48ba-b213-c7ee015bb181');
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
INSERT INTO `users_roles` VALUES ('57c6949b-984e-467b-b4cb-2f226c843682','4f8a2f8d-f6fd-4830-b536-01d45982d3c7'),('d12ff92e-ed26-48ba-b213-c7ee015bb181','4f8a2f8d-f6fd-4830-b536-01d45982d3c7'),('57c6949b-984e-467b-b4cb-2f226c843682','84eabbe0-a9f3-42f8-a66d-ce104cc55c14'),('d12ff92e-ed26-48ba-b213-c7ee015bb181','84eabbe0-a9f3-42f8-a66d-ce104cc55c14'),('57c6949b-984e-467b-b4cb-2f226c843682','b888dadc-3796-4524-856b-48b27907e2fe'),('6a6e9cde-419b-4e9c-83bd-ab5e429cdc51','b888dadc-3796-4524-856b-48b27907e2fe'),('d12ff92e-ed26-48ba-b213-c7ee015bb181','b888dadc-3796-4524-856b-48b27907e2fe');
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

