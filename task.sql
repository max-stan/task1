-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: task1
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Electronics'),(2,'Home Appliances'),(3,'Fashion'),(4,'Toys & Games'),(5,'Outdoor & Sports');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_product_relations`
--

DROP TABLE IF EXISTS `category_product_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_product_relations` (
  `category_id` int NOT NULL,
  `product_id` int NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `category_product_relations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `category_product_relations_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_product_relations`
--

LOCK TABLES `category_product_relations` WRITE;
/*!40000 ALTER TABLE `category_product_relations` DISABLE KEYS */;
INSERT INTO `category_product_relations` VALUES (1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(4,19),(4,20),(5,21),(5,22),(5,23),(5,24),(5,25);
/*!40000 ALTER TABLE `category_product_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `description` text,
  `price` decimal(10,0) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'Smartphone X20','Experience lightning-fast performance with the Smartphone X20, featuring a stunning display and advanced camera for capturing life’s best moments.',100,'2024-11-11 12:24:22'),(3,'Wireless Earbuds Pro','Enjoy crystal-clear sound on the go with Wireless Earbuds Pro. These lightweight, comfortable earbuds are perfect for travel, workouts, and everyday use.',56,'2024-11-04 12:24:22'),(4,'4K Ultra HD TV 55\"','Transform your entertainment experience with this 55” 4K Ultra HD TV, delivering vibrant colors and immersive clarity for movies, games, and more',500,'2024-11-10 12:24:22'),(5,'Smartwatch Alpha','Stay connected and monitor your health with the Smartwatch Alpha, featuring a sleek design, customizable faces, and fitness tracking',50,'2024-11-10 12:24:22'),(6,'Bluetooth Speaker Max','Bring the party anywhere with Bluetooth Speaker Max. This portable speaker offers deep bass, high clarity, and long battery life.',15,'2024-11-10 12:24:22'),(7,'Vacuum Cleaner 360','Keep your home spotless with the Vacuum Cleaner 360, designed for powerful suction, ease of use, and tackling all floor types.',55,'2024-11-01 12:27:46'),(8,'Microwave Oven Compact','Save space without sacrificing functionality. The Microwave Oven Compact is perfect for quick meals with multiple preset options.',89,'2024-11-01 12:27:46'),(9,'Air Purifier Pro','Breathe easier with Air Purifier Pro, which removes allergens, dust, and odors to create a cleaner, healthier living space.',145,'2024-11-01 12:27:46'),(10,'Espresso Coffee Machine','Start every morning with café-quality espresso at home. This machine combines convenience with rich, barista-quality brews.',98,'2024-11-10 12:27:46'),(11,'Smart Fridge 450L','Keep your food fresh and organized with the Smart Fridge 450L, featuring energy efficiency, smart technology, and ample storage.',678,'2024-11-10 12:27:46'),(12,'Men\'s Leather Jacket','Add a touch of timeless style with this Men\'s Leather Jacket, crafted from premium materials for durability and classic appeal.',44,'2024-11-10 12:27:46'),(13,'Women\'s Summer Dress','Stay cool and chic in the Women\'s Summer Dress, featuring a light, airy design with floral patterns perfect for warm weather.',5,'2024-11-10 12:27:46'),(14,'Unisex Sports Sneakers','Step up your game with these Unisex Sports Sneakers, offering comfort, style, and support for both active days and casual wear.',23,'2024-06-10 11:27:46'),(15,'Wool Scarf','Wrap up in warmth and style with this classic Wool Scarf, available in versatile colors for any outfit.',56,'2024-06-10 11:27:46'),(16,'Sunglasses Aviator','Stay stylish and protect your eyes with these classic Aviator Sunglasses, featuring UV protection and a timeless look.',89,'2024-06-10 11:27:46'),(17,'Building Blocks Set','Inspire creativity and fun with this colorful Building Blocks Set, perfect for developing motor skills and imaginative play.',78,'2024-06-10 11:27:46'),(18,'Remote Control Car','Enjoy high-speed thrills with this Remote Control Car, featuring responsive controls and a durable design for all-terrain play.',56,'2024-06-10 11:27:46'),(19,'Puzzle Game 500 Pieces','Challenge yourself with this 500-piece puzzle game, featuring a beautiful landscape scene for hours of relaxing fun.',55,'2024-11-10 12:27:46'),(20,'Kids\' Art Set','Encourage creativity with the Kids\' Art Set, complete with crayons, markers, and watercolors for hours of artistic expression.',55,'2024-08-10 11:27:46'),(21,'Board Game Classic','Gather friends and family for timeless fun with this Classic Board Game, ideal for game nights and hours of enjoyment.',89,'2024-08-10 11:27:46'),(22,'Mountain Bike Pro','Take on any trail with the Mountain Bike Pro, built for durability, comfort, and performance on rugged terrain.',125,'2024-08-10 11:27:46'),(23,'Camping Tent 4-Person','Sleep under the stars in comfort with this spacious Camping Tent, designed for quick setup and protection from the elements.',78,'2024-08-10 11:27:46'),(24,'Yoga Mat with Strap','Enjoy your yoga sessions with this high-quality Yoga Mat, offering cushioning and grip along with an easy-carry strap.',98,'2024-08-10 11:27:46'),(25,'Running Shoes','Achieve peak performance with these Running Shoes, designed for lightweight support, breathability, and style.',17,'2024-08-10 11:27:46'),(26,'Water Bottle Stainless Steel','Stay hydrated with this sleek, eco-friendly Stainless Steel Water Bottle, designed to keep drinks cold or hot for hours.',88,'2024-11-10 12:27:46');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-10 23:23:27
