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
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `orderid` bigint DEFAULT NULL,
  `menuid` bigint DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `subtotal` int DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (7,8,20,'Schezwan Chicken Fried Rice',2,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(8,8,13,'Chicken Burger',2,3000,'https://food-images.files.bbci.co.uk/food/recipes/air_fryer_cblt_burger_03517_16x9.jpg'),(9,9,15,'Pepperoni Pizza',1,5000,'https://cdn.tasteatlas.com/images/dishes/b05a0af72ad845f3a6abe16143d7853a.jpg'),(10,9,7,'Turiky Sandwich',2,2000,'https://assets.kraftfoods.com/recipe_images/opendeploy/63133_640x428.jpg'),(11,9,21,'New Sandwich',2,3000,'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/club-sandwich.jpg'),(12,9,17,'Latte',2,3000,'https://www.foodandwine.com/thmb/CCe2JUHfjCQ44L0YTbCu97ukUzA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Partners-Latte-FT-BLOG0523-09569880de524fe487831d95184495cc.jpg'),(13,9,10,'Kiwi Juice',2,3000,'https://tandobeverage.com/wp-content/uploads/2021/02/Picture33.png'),(14,9,18,'Americano',1,2000,'https://izzycooking.com/wp-content/uploads/2022/09/Americano-Coffee-thmbnail.jpg'),(15,10,1,'Hamburger',1,2000,'https://mapleleafhh.com/wp-content/uploads/Broiled-Beef-Burger-e1556647638183.jpg'),(16,10,13,'Chicken Burger',1,3000,'https://food-images.files.bbci.co.uk/food/recipes/air_fryer_cblt_burger_03517_16x9.jpg'),(17,10,16,'Seafood Sandwich',1,5000,'https://www.cameronsseafood.com/wp-content/uploads/2019/08/lobsterroll.jpg'),(18,10,21,'New Sandwich',1,3000,'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/club-sandwich.jpg'),(19,10,17,'Latte',2,3000,'https://www.foodandwine.com/thmb/CCe2JUHfjCQ44L0YTbCu97ukUzA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Partners-Latte-FT-BLOG0523-09569880de524fe487831d95184495cc.jpg'),(20,10,18,'Americano',1,2000,'https://izzycooking.com/wp-content/uploads/2022/09/Americano-Coffee-thmbnail.jpg'),(21,10,12,'Honey Lemon Juice',1,3000,'https://www.cleaneatingkitchen.com/wp-content/uploads/2023/04/glass-of-honey-lemon-tea-origina.jpg'),(22,11,20,'Schezwan Chicken Fried Rice',1,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(23,11,19,'Indo Chinese Fried Rice',1,2000,'https://www.cookwithmanali.com/wp-content/uploads/2017/04/Indo-Chinese-Fried-Rice-500x375.jpg'),(24,12,8,'Double Cheese Burger',1,4000,'https://images.wral.com/asset/5oys/smartshopper/2023/09/13/21047544/BurgerFi_Double_Cheeseburger_from_PR_e-mail-DMID1-6093g9p71-986x874.jpg'),(25,12,19,'Indo Chinese Fried Rice',1,2000,'https://www.cookwithmanali.com/wp-content/uploads/2017/04/Indo-Chinese-Fried-Rice-500x375.jpg'),(26,13,20,'Schezwan Chicken Fried Rice',2,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(27,13,19,'Indo Chinese Fried Rice',1,2000,'https://www.cookwithmanali.com/wp-content/uploads/2017/04/Indo-Chinese-Fried-Rice-500x375.jpg'),(28,13,10,'Kiwi Juice',2,3000,'https://tandobeverage.com/wp-content/uploads/2021/02/Picture33.png'),(29,13,17,'Latte',1,3000,'https://www.foodandwine.com/thmb/CCe2JUHfjCQ44L0YTbCu97ukUzA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Partners-Latte-FT-BLOG0523-09569880de524fe487831d95184495cc.jpg'),(30,14,20,'Schezwan Chicken Fried Rice',1,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(31,15,21,'New Sandwich',2,3000,'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/club-sandwich.jpg'),(32,16,1,'Hamburger',1,2000,'https://mapleleafhh.com/wp-content/uploads/Broiled-Beef-Burger-e1556647638183.jpg'),(33,17,19,'Indo Chinese Fried Rice',1,2000,'https://www.cookwithmanali.com/wp-content/uploads/2017/04/Indo-Chinese-Fried-Rice-500x375.jpg'),(34,18,8,'Double Cheese Burger',1,5000,'https://www.dennys.ca/wp-content/uploads/2019/10/images2.jpg'),(35,19,20,'Schezwan Chicken Fried Rice',1,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(36,20,20,'Schezwan Chicken Fried Rice',1,3000,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg');
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
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
