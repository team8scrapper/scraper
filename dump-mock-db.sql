-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: mock
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `Xpath`
--

DROP TABLE IF EXISTS `Xpath`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Xpath` (
  `store_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookies` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Xpath`
--

LOCK TABLES `Xpath` WRITE;
/*!40000 ALTER TABLE `Xpath` DISABLE KEYS */;
INSERT INTO `Xpath` VALUES (1,'Auchan','\'//button[@id=\"onetrust-accept-btn-handler\"]\'','\'//div[@data-pid=\"38534\"]//span[@class=\"value\"]\'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Xpath` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` int NOT NULL,
  `harvest_year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('5601007001325','2023-11-25 11:20:30','2023-11-25 11:20:30','Esteva','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202011/12/05218716000270____2__600x600.jpg','Esteva',NULL,375,2021),('5601007002254','2023-11-25 11:18:31','2023-11-25 11:18:46','Barca Velha Douro','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202210/27/05213337311255____1__1200x1200.jpg','Casa Ferreirinha',NULL,1500,2011),('5601007476505','2023-11-25 11:44:28','2023-11-25 11:44:28','Quinta da Leda','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201904/08/05218716005592____2__600x600.jpg','Quinta da Leda',NULL,750,2019),('5601012001310','2023-10-24 20:22:31','2023-10-25 08:13:29','Mateus Sparkling Brut Rosé','https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwb34c4e57/images/col/434/4342301-frente.jpg?sw=2000&sh=2000','Mateus',NULL,750,NULL),('5601012007497','2023-11-25 11:21:45','2023-11-25 11:21:45','Gazela Sangria Branca','https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/202103/18/05218718701263____1__1200x1200.jpg','Gazela',NULL,750,NULL),('5601012011500','2023-10-24 13:13:07','2023-10-25 08:15:06','Mateus Rosé','https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwa4148cdf/images/col/205/2050174-frente.jpg?sw=2000&sh=2000','Mateus',NULL,750,NULL),('5601012011920','2023-10-24 14:08:11','2023-11-25 11:41:45','Papa Figos Branco','https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dw65f388a2/images/col/627/6274693-frente.jpg?sw=2000&sh=2000','Casa Ferreirinha','Papa Figos',750,2021),('5601096334328','2023-10-25 07:25:32','2023-10-25 08:15:37','Casal Garcia Sparkling Espumante Rosé','https://www.continente.pt/dw/image/v2/BDVS_PRD/on/demandware.static/-/Sites-col-master-catalog/default/dwff861e16/images/col/569/5694889-frente.jpg?sw=2000&sh=2000','Casal Garcia',NULL,750,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_generic` tinyint(1) NOT NULL DEFAULT '0',
  `redirected` tinyint(1) NOT NULL DEFAULT '0',
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `x_cookies` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_price` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_year` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `x_capacity` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'2023-11-25 12:45:17','2023-11-25 12:45:17','Auchan','https://www.auchan.pt/pt/pesquisa?q=','https://www.auchan-retail.pt/wp-content/uploads/sites/2/2020/10/logotype_RVB_HD-1024x439.png',0,0,'EUR','//button[@id=\"onetrust-accept-btn-handler\"]','//div[@class=\"auc-search__right-section\"]//a[@class=\"link\"]','//h1[@class=\"product-name auc-hero-title\"]','//div[@class=\"attributes\"]//span[@class=\"value\"]',NULL,'//*[@id=\"collapsible-attributes-1\"]/ul[1]/li',0),(2,'2024-05-21 11:55:42','2024-05-21 11:56:19','Wine44','https://wine44.com/en/search?type=product&options%5Bprefix%5D=last&q=','https://wine44.com/cdn/shop/files/wine-logo.png?v=1629538780',0,0,'EUR','//button[@id=\"submit_birthdate\"]','//div[@class=\"new-grid search-grid\"]//div[@class=\"grid-item__content\"]//a','//h1[@class=\"h2 product-single__title\"]/text()','//span[@class=\"product__price\"]//span[@aria-hidden=\"true\"]/text()',NULL,'//span[text()[contains(., \'ml\')]]/text()',0),(3,'2023-11-25 17:19:32','2023-12-12 11:58:02','Garrafinhas','https://garrafinhas.pt/?s=','https://garrafinhas.pt/wp-content/uploads/2023/07/garrafinhas-logotipo.png',0,0,'EUR','//button[@class=\"age-gate-submit age-gate-submit-yes\"]','//a[@class=\"more-link button primary is-outline is-smaller\"]','//h1[@class=\"product-title product_title entry-title\"]/text()','//p[@class=\"price product-page-price \"]//bdi/text()',NULL,'//div[@class=\"custom-fields-body\"]//div[text()[contains(., \'Lts.\')]]/text()',0),(4,'2024-05-21 16:16:08','2024-05-21 16:16:08','Garrafeira Nacional','https://www.garrafeiranacional.com/catalogsearch/result/?q=','https://consumertrends.pt/wp-content/uploads/2019/12/Garrafeira-vencedor-escolha-do-consumidor-2020.jpg',0,0,'EUR','//button[@class=\"icon-ok age-ok\"]','//div[@class=\"column main\"]//div[@class=\"column eql \"]//a[@class=\"product-item-link\"][@href]','//span[@itemprop=\"name\"]/text()','//div[@class=\"product-info-main col-md-6 col-sm-6 col-xs-12 right_column\"]//span[@class=\"price-container price-final_price tax weee rewards_earn\"]',NULL,'//div[@class=\"row\"]//p//a[text()[contains(., \'cl\')]]/text()',0),(5,NULL,NULL,'Asda','https://groceries.asda.com/search/','https://media.timeout.com/images/106089034/750/422/image.jpg',1,0,'EUR','//button[@id=\"onetrust-accept-btn-handler\"]','//ul[@class=\" co-product-list__main-cntr co-product-list__main-cntr--rest-in-shelf\"]//li[@class=\" co-item co-item--rest-in-shelf \"]//div[@class=\"co-item__title-container co-item__title-container--rest-in-shelf\"]//a','//h1[@class=\"pdp-main-details__title\"]/text()','//strong[@class=\"co-product__price pdp-main-details__price\"]/text()','','//div[@class=\"pdp-main-details__weight\"]/text()',1);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mock'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-02 19:33:38
