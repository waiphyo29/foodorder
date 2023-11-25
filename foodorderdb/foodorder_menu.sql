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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `ingredients` text,
  `veg` tinyint(1) DEFAULT NULL,
  `description` text,
  `calorie` double DEFAULT NULL,
  `fat` double DEFAULT NULL,
  `protein` double DEFAULT NULL,
  `image` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Hamburger','BURGER',2000,'bread-meat-onion-tomato-sause-salad',0,'Best Burger in the world.Try it your self',272,9.77,10,'https://mapleleafhh.com/wp-content/uploads/Broiled-Beef-Burger-e1556647638183.jpg'),(2,'Hawaiian Pizza','PIZZA',6000,'wheat-souce-onion-cheese-tomato-pok',0,' Did you know Hawaiian pizza is the most popular pizza in Australia, accounting for a full 15% of all pizza sales? And it\'s a popular choice in this country, as well; though far from ousting pepperoni from the top spot, this ham-pineapple concoction has been making steady inroads, particularly among kids.',266,10,11,'https://www.kingarthurbaking.com/sites/default/files/styles/featured_image/public/2020-03/hawaiian-pizza.jpg'),(3,'Black Coffee','COFFEE',2000,'coffee powder-sugar-hotwater',1,'Taste good coffee',2,0,0,'https://imgeng.jagran.com/images/2023/mar/benefits-of-black-coffee1678781587577.jpg'),(4,'BLT Sandwich','SANDWICH',3000,'ToastedBread-mayannaise-bacon-lettuce-tomatoes',0,'Taste good sandwich',400,17.5,17.6,'https://www.add1tbsp.com/wp-content/uploads/2016/09/MG_5584.jpg'),(5,'Apple Juice','JUICE',1500,'fresh apple-apple juice-water-sugar',1,' The American Heart Association recommend women limit their sugar intake to 25g per day and men, 36 g.) �If you like apple juice and want to include up to one cup a day in an otherwise healthy diet, that would be more than okay.',46,0.1,0.1,'https://images.onlymyhealth.com/imported/images/2022/November/19_Nov_2022/main-applejuicebenefits.jpg'),(7,'Turiky Sandwich','SANDWICH',2000,'baby swiss cheese-turkey-black pepper-salami-tomatoes-cojack cheese-lettuce',0,' Turkey is low in fat and lower in calories than many other meats. Three ounces has about 90 calories and three grams of fat. It provides a variety of B-vitamins and the antioxidant selenium. ',329,11,28,'https://assets.kraftfoods.com/recipe_images/opendeploy/63133_640x428.jpg'),(8,'Double Cheese Burger','BURGER',5000,'bread-salad-tangy pickle-chopped onions-ketchup-mustard-slice of melty American cheese',0,' There are 450 calories in a McDonald\'s Double Cheeseburger. It contains no artificial flavors, preservatives or added colors from artificial sources ',282,16,16,'https://www.dennys.ca/wp-content/uploads/2019/10/images2.jpg'),(9,'Veggie Burger','BURGER',1500,'bread-salad-vegetables-whole grains-legumes (like beans or lentils)',1,'These veggie burgers are packed with vegetables! See how to make homemade veggie burgers that are hearty, flavorful and full of vegetables.',177,6,16,'https://www.thespruceeats.com/thmb/2sj6ZpGq382Pd06huTs6jLKLt5c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/vegan-chickpea-veggie-burger-recipe-3378618-hero-01-de6818ae7cd34695bc5931d9bc9a2ff3.jpg'),(10,'Kiwi Juice','JUICE',3000,'kiwi-sugar-water-ice cubes',1,'Juicy kiwifruit can be mixed with any other fresh fruit to make healthy and tempting juice',122,0.6,1.14,'https://tandobeverage.com/wp-content/uploads/2021/02/Picture33.png'),(11,'Blue Lemonated','JUICE',2500,'blue syrup-lemon-water-ice cubes',1,'Rich in antioxidants and increases metabolic function. Contains spirulina which is a powerful type of algae rich in protein, vitamins, minerals, iron, carotenoids and antioxidants that can help protect cells from damage',142,0.5,2,'https://cdn.ngnw.ph/images/blog/images/negosyo-now-recipe-blue-lemonade.jpg'),(12,'Honey Lemon Juice','JUICE',3000,'horney-lemon-water-ice cubes',1,'Citrus fruit juices are popular in detoxifying liquid diets. Lemon water mixed with honey is a gentle, yet powerful detoxification agent. It is a liver tonic, improving its function of neutralizing toxins. Its diuretic effect helps in flushing out the toxins through urine.',76,0,2,'https://www.cleaneatingkitchen.com/wp-content/uploads/2023/04/glass-of-honey-lemon-tea-origina.jpg'),(13,'Chicken Burger','BURGER',3000,'bread-fried chicken-onion-tomato-sause-salad',0,'Ground chicken burgers are healthier than beef burgers since they are lower in calories and saturated fats and have plenty of protein.',283,16,13,'https://food-images.files.bbci.co.uk/food/recipes/air_fryer_cblt_burger_03517_16x9.jpg'),(14,'Veggie','PIZZA',7000,'tomatoes-onions-arugula-kale-eggplants-bell peppers-spinach-zucchini-mushrooms',1,'The first reason why vegetarian pizza is a healthier choice than a meat pizza is that vegetarian pizza is richer in nutrients.',330,15,23,'https://i0.wp.com/www.thursdaynightpizza.com/wp-content/uploads/2022/06/veggie-pizza-side-view-out-of-oven.png'),(15,'Pepperoni Pizza','PIZZA',5000,'ground pork-beef mixed with spices-flavorings',0,' Pepperoni is a variety of spicy salami made from cured pork and beef seasoned with paprika or other chili pepper. Prior to cooking, pepperoni is characteristically soft, slightly smoky, and bright red. Sliced pepperoni is one of the most popular pizza toppings in American pizzerias ',494,44,23,'https://img.livestrong.com/640/clsd/getty/44371d4826fc4a119f2b150a8d4f3eee.jpg'),(16,'Seafood Sandwich','SANDWICH',5000,'shrimp-mackerel-catfish-crab-oysters',0,'Depending on the fast-food restaurant, a fish sandwich is sometimes one of the healthiest menu items—but not always. Fish may be one of the leanest protein sources around, but fast food fish sandwiches tend to be fried, which can add on empty calories.',619,21,38,'https://www.cameronsseafood.com/wp-content/uploads/2019/08/lobsterroll.jpg'),(17,'Latte','COFFEE',3000,'one or two shots of espresso-steamed milk-thin layer of frothed milk on top',1,'Caffee latte often shortened to just latte in English, is a coffee drink of Italian origin made with espresso and steamed milk.',103,3.9,6.7,'https://www.foodandwine.com/thmb/CCe2JUHfjCQ44L0YTbCu97ukUzA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Partners-Latte-FT-BLOG0523-09569880de524fe487831d95184495cc.jpg'),(18,'Americano','COFFEE',2000,'water-espresso',1,'The Americano is a low-calorie drink that is free of saturated fat and cholesterol, making it a healthy choice for those who want to maintain a healthy heart. The caffeine in the espresso can also help to improve blood flow, which can help to prevent heart disease and stroke',8.9,0.2,3.5,'https://izzycooking.com/wp-content/uploads/2022/09/Americano-Coffee-thmbnail.jpg'),(19,'Indo Chinese Fried Rice','RICE',2000,'rice-green beans-carrot-onion-sesame oil-garlic-chilli',1,'For a Chinese fried rice, it is best when it is just made of old cooked rice, eggs, green onion, and oil; fry the eggs first, set aside. fry the previously cooked rice with some oil and some green onion.',289,6,25,'https://www.cookwithmanali.com/wp-content/uploads/2017/04/Indo-Chinese-Fried-Rice-500x375.jpg'),(20,'Schezwan Chicken Fried Rice','RICE',3000,'chicken-sesame oil-cloves garlic-red chilli flakes-green onion',0,'A big bowl of Chicken Fried Rice never lets you down, because it is tasty, healthy and super-quick',530,21,43,'https://images.aws.nestle.recipes/original/fbc58b823a59316090bebdd7affd85c4_A42I2439-min.jpg'),(21,'ClubHouse Sandwich','SANDWICH',3000,'bread-mayonnaise-turkey-cheddar cheese-sliced ham-salad-tomato',0,'A club sandwich, also called a clubhouse sandwich, is a sandwich consisting of bread, sliced cooked poultry, ham, fried bacon, lettuce, tomato, and mayonnaise. \r\nIt is often cut into quarters or halves and held together by cocktail sticks. ',220,8,17,'https://staticcookist.akamaized.net/wp-content/uploads/sites/22/2022/06/club-sandwich.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
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
