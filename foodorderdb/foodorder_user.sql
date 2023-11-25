-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: foodorder
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` text,
  `phone` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payment` varchar(45) DEFAULT NULL,
  `card` varchar(45) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'Kyaw Kyaw','kyawkyaw@gmail.com','1000:b5c0bfd58775e666e505df978cef533d:712fcfbff5ba717b419d8305d8de332b541fc4c71179567dacfd6536d5e8ae42de30d6f112e379c39ff7ba7a93e4e497f26878821ed7091f2cb4f98b1245c9a1','698753421',NULL,NULL,NULL,NULL,'2023-09-26',1,'admin'),(3,'Mg Mg','mgmg@gmail.com','1000:95e95dcd885614a0d0a56ce6d02caec7:dc2cdac80f5612df394a7ab32bd39142deaae8f46715e2067588216ec6031a86e3905c7c4850cf5a47e404f9a013c8ec9be27f52aafef4042683a6113a7c420c','09808056732','Mandalay','73-A 119-120','AYA','999678345','2023-09-26',1,'user'),(4,'MawMaw','mawmaw@gmail.com','1000:ca9c9d06a682b178c2880dcd1bce1b97:feb81b1cf304c3e1da86a6732f0475356a725cea999c39ebc4305bb7eba97cc29975537e817d7f0350f9ec0b6ccb8d56d1a8ad5692038e05c9af3235c095145e','456789321','Mandalay','68-A 101-102','AYA','123456789','2023-09-26',1,'user'),(5,'ZawZaw','zaw@gmail.com','1000:0771b70787911f6cfa4105f32b3c678c:a9ed492fdfc1b3e511dab052c7c96fba8b96dda1e904ccb00dae7c04efe9b666d6add5afa16b8a9fd699fb49b1bf975468f2af5ba91ac3c513e83d7b4b3f6ee8','0987654321','Sagaing','73-A 119-120','AYA','4446573210','2023-10-06',1,'user'),(7,'MaSapal','masapal@gmail.com','1000:e274f3dcbf67e5d719805957498fb81d:f703394e7f0be97ddeb474eaf30870d334326f35e7d58abade1770d1ed6e5a1704bd57d59c9df589bb60f110ed3b1cf791d51c0b4bd71861e2e4fdfc957625a6','09888564732','Yangon','68-A 101-102','KBZ','7773345621','2023-10-07',1,'user'),(8,'Archi','mg@gmail.com','1000:f1d21d9006d260807786e414c40afdb8:8997e9702c66e8315043020cfcee7393945345aadfa1a7dfe507c6cb597f7b774e01936092d96b5d36bbd50228cbe5d252b8e46bc6932ba86fa659f7d8152771','123456789',NULL,NULL,NULL,NULL,'2023-10-08',1,'user'),(9,'NanDaKyaw','nanda@gmail.com','1000:487dd0f27d24442c804cdc7aee5d7930:285175e82bef2827744f1ec227e2a3a4056d4f769a0a3e9008ff0fcab13e009abb2a51b086e7ba40f7232b661b53c46b244a982298e66cca89c6cff63d8d7343','0987654321','Yangon','71-C 109-120','KBZ','90078099','2023-10-17',1,'user');
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

-- Dump completed on 2023-10-18 10:02:16
