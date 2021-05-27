-- MySQL dump 10.13  Distrib 5.7.32, for osx10.12 (x86_64)
--
-- Host: localhost    Database: chatweb
-- ------------------------------------------------------
-- Server version	5.7.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `a_d_clients`
--

DROP TABLE IF EXISTS `a_d_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_d_clients` (
  `id` bigint(20) unsigned NOT NULL,
  `ad_client` int(11) NOT NULL,
  `merchant` int(11) NOT NULL,
  `client_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_identity` int(11) NOT NULL,
  `reference_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` int(11) NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_d_clients`
--

LOCK TABLES `a_d_clients` WRITE;
/*!40000 ALTER TABLE `a_d_clients` DISABLE KEYS */;
INSERT INTO `a_d_clients` VALUES (1,8607,50790,'Dolor sed amet nulla sunt odit ea ipsa.',17,'Unde cum enim ab et laboriosam.',941,'Ea fugit sunt earum quis ipsum inventore rerum.','Possimus tempore quam qui odit eos.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(2,4480,61308,'Aliquam asperiores dolorem ex non.',3967148,'Ea et quibusdam perferendis delectus.',81294836,'Eos hic neque nulla eos.','Dolorem iure iste quis molestias cum est.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(3,270,832,'Nam labore atque quidem numquam.',44630,'Asperiores vel voluptas alias eligendi.',565,'Corrupti tempora et sit in rem rem voluptatum.','Incidunt ducimus ab illum pariatur accusamus.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(4,732,363490,'Perferendis rem sed eos nesciunt ut iusto dolor.',62,'Debitis aperiam consequuntur est sequi qui.',33649087,'Illo quia laborum alias dicta iste.','Alias et rem nostrum ea tempore.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(5,62,956521127,'Est ut sed nihil.',55,'Quibusdam assumenda asperiores mollitia veniam.',988,'Rem rerum commodi ad voluptatem nulla explicabo.','Ea aut aperiam asperiores tempora.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(6,1003608,843,'At consequatur enim similique sunt.',4269,'Qui velit at dolores et consequatur.',190609,'Odit dolores est quo et dolorem quam.','Iusto ipsum ipsa fuga.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(7,4,1,'Cupiditate unde tenetur eum.',36203444,'Dicta voluptas voluptatum quia commodi quia iste.',58536,'Quo qui voluptatem hic.','Fugiat odio hic ex laudantium aliquam.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(8,5,972335,'Odio ut et rerum voluptatem est.',888771,'Quia et magnam consequatur tempora.',328,'Minus omnis molestiae qui et qui distinctio.','Doloremque est eius quidem beatae et rem natus.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(9,78618,2920,'Quia quia accusantium laboriosam voluptate et.',94,'Quae eveniet adipisci nesciunt quia et.',29,'Aut esse beatae et enim nesciunt quis tempora.','Error omnis vel architecto aspernatur hic eos a.','2021-05-21 22:04:53','2021-05-21 22:04:53'),(10,134,6,'Enim voluptates sit beatae qui qui.',348990,'Est cupiditate repudiandae a dolor.',276686,'Iste qui voluptas ipsum repellendus.','Aut error minima non dolore ab quia.','2021-05-21 22:04:53','2021-05-21 22:04:53');
/*!40000 ALTER TABLE `a_d_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `a_d_schedules`
--

DROP TABLE IF EXISTS `a_d_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `a_d_schedules` (
  `id` bigint(20) unsigned NOT NULL,
  `created_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_ID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_no` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visual_identity` int(11) NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seconds` double NOT NULL,
  `rate` double NOT NULL,
  `number_of_week` int(11) NOT NULL,
  `slot` int(11) NOT NULL,
  `cost` double NOT NULL,
  `discount` double NOT NULL,
  `tax` double NOT NULL,
  `total` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `a_d_schedules`
--

LOCK TABLES `a_d_schedules` WRITE;
/*!40000 ALTER TABLE `a_d_schedules` DISABLE KEYS */;
INSERT INTO `a_d_schedules` VALUES (1,'Qui dolorum totam illo repellendus odio.','Et sed sit qui molestiae sed ut architecto.','Sit sint non minima dolorum accusantium non quia.','Ratione dolorem quia maxime corporis totam.',7773418,'Animi ut commodi aut aut aliquam eius.',1301367,'Quia vero magni quis nesciunt.','Quo cum qui possimus sint.','Modi est qui veritatis sint distinctio.',22.2,12.2,8,15,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(2,'Quod sunt quia temporibus alias.','Eligendi ad incidunt fuga voluptates ad eaque.','Esse ipsam veniam cumque enim.','Officiis in beatae optio assumenda aut.',3,'Iusto corrupti totam qui facere iste ea.',706,'Facere iste nesciunt unde.','Doloremque sit saepe dolore est.','Alias consectetur tempora quia nostrum nostrum.',22.2,12.2,5937237,76387,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(3,'Doloremque libero vero labore earum.','At et voluptatem explicabo rem.','Expedita iusto saepe nisi accusantium et et vel.','Natus et eos consequuntur est magnam expedita.',27540378,'Deserunt culpa sit aspernatur enim atque.',152411,'Facere neque ducimus vel veritatis.','Est dolores corporis non esse.','Vel pariatur illum repellendus optio.',22.2,12.2,70756,203040,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(4,'Dolorem fuga dolores quisquam dolorum.','Numquam voluptatem sint quidem.','Voluptas veniam quaerat sit nisi voluptate.','Quod ut quia ad facilis.',99334,'Et laudantium itaque et labore et.',746569497,'Eaque quasi velit atque consectetur.','Quia qui provident ea magni amet in.','Rerum laborum nihil rem qui.',22.2,12.2,7109,1579622,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(5,'Optio quia qui facere id aut ex.','Architecto mollitia minus est.','Adipisci quis non et nulla natus aspernatur.','Nemo placeat at repellendus non est.',8882,'Iste esse sunt omnis perspiciatis corrupti.',297032719,'Autem et error repellendus accusamus.','Delectus est rem commodi soluta.','Rerum distinctio recusandae impedit eum unde.',22.2,12.2,7558887,87413083,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(6,'Fuga explicabo maiores pariatur nostrum mollitia.','Temporibus deleniti voluptatem maxime nihil.','Rerum rerum consequatur hic nemo.','Minus omnis tempore rerum dolorem quo.',36258570,'Quibusdam iure et ut voluptatem.',70765,'Iste nihil non ea quis.','Voluptatem eum nesciunt at nisi excepturi quos.','Soluta nam velit qui praesentium.',22.2,12.2,453509,31096,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(7,'Consequuntur alias quia aut voluptatem et.','Omnis aut enim fuga dolores praesentium.','Unde omnis ut totam voluptas.','Tempore ipsum suscipit fugit qui.',9,'Perferendis eum tempora quia et optio esse quas.',80626487,'Quaerat autem veritatis et unde culpa.','Quas repellat est asperiores ut quae delectus.','Consequuntur modi cupiditate cum.',22.2,12.2,2366898,37977,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(8,'Amet ab laborum unde.','Repellendus molestias rerum officiis eveniet.','Enim praesentium dolor totam exercitationem.','Exercitationem mollitia molestiae et repellat.',7733881,'Molestias qui enim quia sequi.',2793851,'Modi quis distinctio assumenda.','Fugit nemo voluptatibus est minus.','Impedit autem quam voluptatum corporis aut aut.',22.2,12.2,7802112,974343,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(9,'Quia ea laudantium odit non maxime inventore.','Sint perspiciatis at non quia blanditiis amet.','Aut et libero iusto debitis iure non.','Molestiae a soluta deserunt dicta consectetur.',341938949,'Modi vel aut unde sit sunt id hic nemo.',6369557,'Eos quisquam alias nisi officiis.','Nulla voluptatem aut ipsa aliquid amet explicabo.','Doloremque et enim in numquam reiciendis.',22.2,12.2,982,332,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(10,'Vitae tenetur sed sapiente quos.','Aut voluptatem nobis veritatis.','Et ut doloribus cumque dignissimos harum.','Ut nemo beatae et ducimus.',801430634,'Hic voluptas voluptas rem error enim.',854601,'Est atque vitae et nostrum.','Quia dolores et labore aut quidem quas.','Nam aperiam sunt blanditiis eligendi.',22.2,12.2,8,79604721,10.2,122.2,1222.2,2222.2,'2021-05-21 22:04:53','2021-05-21 22:04:53');
/*!40000 ALTER TABLE `a_d_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AccessLevel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Authentication` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dashboard` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `merchant` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `customer` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `voucher` int(11) NOT NULL,
  `advertisement` int(11) NOT NULL,
  `promotion` int(11) NOT NULL,
  `manage_admin` int(11) NOT NULL,
  `setting` int(11) NOT NULL,
  `mall` int(11) NOT NULL,
  `sales` int(11) NOT NULL,
  `transaction` int(11) NOT NULL,
  `reports` int(11) NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'Cumque soluta omnis veniam ad.','Riyal',775616,'riyalhasan@yahoo.com','gdyg6732e872h2indue7y27d7d22d222d2d832dhhbj23ndby3ebdybyby3b2ybiubid',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,'2021-05-21 22:04:53','2021-05-22 04:49:16'),(2,'Voluptatibus culpa odio qui labore.','Eius mollitia rerum quibusdam id temporibus.',52,'Perferendis magnam facere sit sed.','Ex dolores numquam in similique.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(3,'Totam consectetur magni repellendus natus.','Eos adipisci qui quibusdam enim.',620,'Dolorem rerum sunt sunt ex autem ratione.','Harum ut minima rerum perspiciatis iure.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(4,'Quae dolore repudiandae optio.','Eum et vero itaque molestias recusandae fuga.',392,'Vitae eveniet quidem eligendi id illum adipisci.','Soluta ducimus hic velit quam tempora est.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(5,'Iure accusantium consequatur nostrum magnam.','Ducimus est a aliquam et tempora consequuntur.',356,'Ut aliquid modi eaque.','Incidunt blanditiis magnam velit qui.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(6,'Nobis laborum quidem atque.','Laboriosam cumque et ratione ut.',116564,'Molestias enim et nostrum minima perferendis.','Eligendi ut nemo quaerat ut vel sint.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(7,'Voluptates voluptatem laboriosam optio.','Nemo culpa eos occaecati.',687762,'At fugiat omnis quia quibusdam quidem fugiat qui.','Doloremque et vitae aliquam commodi aut porro.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(8,'Doloremque in voluptas ipsam est id ducimus.','Pariatur cumque at quisquam.',3874264,'Libero qui doloremque nobis fuga non qui nulla.','Explicabo ea sint id sit alias et.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(9,'Tempora quae dolorem non blanditiis.','Sint earum aut cumque sed ad.',420795226,'Ullam sint beatae architecto est dolor aliquam.','Nisi aut consequatur aliquam et porro.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(10,'Enim voluptatem sed sapiente maiores.','Aspernatur mollitia pariatur debitis nesciunt ut.',6386126,'Molestiae impedit sit et odio ex reprehenderit.','Et incidunt aliquam qui.',1,1,1,1,0,1,1,0,1,1,1,1,1,1,1,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(11,'admin_images/Hhjj6yKoYYaNKzFu5MtFlO7yziBNaQKNgqoqGW2h.jpg','Riyal',775616,'riyalhasan@yahoo.com','gdyg6732e872h2indue7y27d7d22d222d2d832dhhbj23ndby3ebdybyby3b2ybiubid',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,'2021-05-22 04:49:00','2021-05-22 04:49:00');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brand` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProductGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MarchantGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BrandName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant` int(11) NOT NULL,
  `shop` int(11) NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,'',4,7,'Laboriosam vero architecto ea incidunt et.',973667963,20809367,965109,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(2,'',644536,69438509,'Rem est aut et consectetur sapiente quia.',820,817458394,2788726,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(3,'',8402215,6274,'Voluptas voluptas pariatur mollitia iusto et.',4914,81045654,9192,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(4,'',1,1,'brand name',1,1,1,'2021-05-09 22:29:35','2021-05-09 22:55:50'),(5,'',68201,802672301,'Sunt nihil in earum id sunt asperiores.',578,7808810,9796,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(6,'',3,77758723,'Reprehenderit rerum at porro.',247209,7457,90654896,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(7,'',7,7827,'Perspiciatis corrupti ea rem modi.',4,93109645,3,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(8,'',64,35795,'Exercitationem ullam sunt deleniti sed.',74586031,46786426,707,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(9,'',9960,26978108,'Corporis culpa enim expedita consequuntur.',364394,6,553957511,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(10,'',1036,10,'Et id et nulla quasi repudiandae consectetur.',730,79317,6921406,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(11,'',1,1,'brand name',1,1,1,'2021-05-09 22:55:39','2021-05-09 22:55:39'),(12,'',23,1724967,'Error nostrum laborum dolor voluptatem.',256550833,0,975676546,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(13,'',8284,53791900,'Est soluta natus qui autem non repellendus.',9,75218,720004,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(14,'',1214,251298,'Sit ut dolorem sint sapiente omnis delectus rem.',7,9982072,2534,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(15,'',30737622,5,'Facilis fugiat expedita cumque mollitia dolore.',4332,79219,1052,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(16,'',188006,8,'Suscipit et eos odit voluptate omnis esse ullam.',2,186683,588,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(17,'',46625,937,'Magnam est quam earum incidunt.',27093549,98450635,3406817,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(18,'',7517,4873153,'Distinctio pariatur et fugit maiores et.',918336,19,2230,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(19,'',875285302,84,'Et repellat et eius et doloremque.',775304562,470149772,3015540,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(20,'',27259908,92094,'Consequatur corrupti maiores enim porro maxime.',467,2905704,281054,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(21,'',823041905,3052,'Ut aut quae dolores aperiam.',6748,91,2858,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(22,'',0,960543621,'Et quidem nihil voluptatibus cum.',683370,16342581,1,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(23,'',94,883468787,'Aut sit et ullam at dolores quis.',25113806,45,598,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(24,'',331,0,'Aut autem a consequatur pariatur ipsum.',686291,13,70485811,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(25,'',23186276,85,'Consequatur velit quia quod in ipsam est quia.',5,5825,293,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(26,'',7853,78898,'Totam veritatis placeat velit vitae ut.',1384505,9876,92628556,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(27,'',615207770,29,'Velit ut ullam et tempore repellat consequuntur.',960,3099968,2392,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(28,'',5,6,'Ut dolorem architecto non dignissimos sit.',0,0,504236,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(29,'',3321,106,'Perferendis rerum qui quia iste enim.',519372542,520369679,362439,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(30,'',44860,819521079,'Consequatur magni id eum illum.',299178,1,163,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(31,'',96778,94076,'Veniam itaque sed nostrum inventore.',59761,1574888,7522784,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(32,'',9,604780,'Est et qui consequatur labore et et maxime.',9718,212863,5928,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(33,'',28311996,176690,'In aspernatur cum qui omnis sit provident eum.',41,24433114,925808,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(34,'',46619843,828593371,'At qui aspernatur sed ut ad.',0,56237747,31,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(35,'',93,42299,'Quibusdam sint tempore earum ipsa.',2985,92711,6,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(36,'',982208,1387273,'Sequi molestias dolores est magnam aut.',5,90,4385,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(37,'',90,176475717,'Sit aut cumque molestiae qui sit.',121225,943186186,4,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(38,'',480484,45,'Corporis est repellendus ex minus in facilis ea.',7946,463377798,9906,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(39,'',38998353,32,'Ex voluptas nihil quia odio.',2728333,2310,8780,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(40,'',36854821,82,'Natus temporibus et et laborum accusamus vitae.',46,490,6889,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(41,'',9137687,2806537,'Nulla aliquid consequatur inventore.',143909865,75,642311,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(42,'',59,7792,'Est inventore totam minima adipisci consequatur.',55403,7535,997114841,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(43,'',7069,6319044,'Sit hic aut magni voluptatibus.',1,79,69765643,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(44,'',825,989600,'Ex ad cum dicta aut et eos suscipit ducimus.',4119,295509753,724,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(45,'',492,7472,'Ut eveniet repudiandae illo occaecati.',379473,896273,4765,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(46,'',236796,29898353,'Distinctio debitis facilis consequuntur rerum ea.',41800,96280349,273,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(47,'',313084,9179144,'Unde voluptatibus quis saepe minus nostrum.',44486,500,9025,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(48,'',6,831,'Impedit totam ea maiores quia.',605,1141,105784522,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(49,'',265011786,6580,'Ab dolores veniam ea consequuntur modi.',476,572,4,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(50,'',42,8,'Voluptatem nemo et vero tempora.',5,6269425,160878,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(51,'',85954,435,'Vel voluptatem reprehenderit iure aut.',2918,466,5513,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(52,'',495445501,920953,'Veritatis sit quia facere ut explicabo.',8594,294950134,135510407,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(53,'',88556113,2,'Numquam et nesciunt voluptas sed aut.',0,8,34243,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(54,'',41386,605,'Eum fugit et aliquid adipisci et et.',19247,4,488521,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(55,'',7059,9,'Sit voluptas eaque quia magnam voluptatem at.',6,958,327923,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(56,'',2987,6,'Sunt omnis fugiat repudiandae et.',267665125,19913444,81536648,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(57,'',7280651,96,'Qui inventore sunt repellat rerum nostrum ad est.',54248,901571,411372,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(58,'',304070233,43,'Unde voluptas qui magnam ad autem.',788181835,9339,4332,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(59,'',3726,910418729,'Quisquam incidunt ea nam.',76,26100,61,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(60,'',9849,3048,'Cumque officiis esse et illo non.',824,3723255,6397,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(61,'',4,7354,'Eaque laboriosam voluptatem dolorem aut sit.',7,621623,11684923,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(62,'',378367601,50,'Perspiciatis qui qui a doloremque.',97945798,62,89029933,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(63,'',5,974,'Occaecati a est rerum vel.',1,992,702,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(64,'',6858,8,'Veniam aspernatur in esse nostrum.',40943401,646,91265,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(65,'',233,645551,'Error nisi ad ea.',80,760683121,254452286,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(66,'',6370,60672,'Vel et deleniti asperiores id.',514114,77,9035,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(67,'',52,4764,'Qui vel ab quisquam earum eos.',26564,9,60938879,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(68,'',5703946,11332040,'Fuga nemo repellat ut odio aut.',342281744,4897,348178,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(69,'',322,9375689,'Ex omnis saepe rem omnis.',561232,3,345119976,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(70,'',4,235614,'Fugiat dolor sed perferendis nobis quasi.',860957,2998018,312746,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(71,'',25,56501091,'Et omnis nemo iste consequuntur in.',8243,676461,663329907,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(72,'',9,9494860,'Quo nostrum est dolores temporibus aut.',387,40733381,620932799,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(73,'',9415,77778,'Dolorem est voluptas sapiente commodi commodi.',8714,35191277,663,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(74,'',706129,5813,'Dolor similique sed et eligendi quaerat.',64995,3690916,73,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(75,'',281798,333830618,'Nihil nulla reprehenderit blanditiis enim quia.',52,218,285468,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(76,'',871,34947,'Repellendus quas incidunt ipsam molestiae soluta.',745555,73,543,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(77,'',39,308676,'Vel qui autem quae vitae.',24735,313,9620148,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(78,'',0,4,'Aut fugiat dignissimos qui rerum aut.',1964,594,727,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(79,'',820296715,83567343,'Eveniet non nobis dolor neque.',260,88682731,32405,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(80,'',72508096,32362696,'Nam omnis magnam corporis voluptas reprehenderit.',967447876,1000550,456,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(81,'',50625861,5,'Architecto et aliquid est deserunt mollitia.',701122655,139133,791663,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(82,'',141,57,'Quae reiciendis possimus eaque.',4387,224341,80911,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(83,'',48361,8,'Vel fugit ut et eius. Et quia quaerat autem ut.',2054512,2,9571386,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(84,'',26500186,13422,'Velit aut quo est quia mollitia.',893666515,306038751,89,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(85,'',4444158,4988,'Dicta omnis omnis quam doloribus non illum.',8863,279,618,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(86,'',1219,5306927,'Quibusdam ut nostrum quia unde.',27,149875809,5312,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(87,'',70,50476560,'Reprehenderit dolorem voluptate error libero.',55147005,5030750,986973101,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(88,'',741337,898380297,'Et deserunt alias modi.',573170581,4357,95626709,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(89,'',9543182,981,'Atque perferendis ut ut officiis.',7,226138713,3,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(90,'',433627749,3100,'Ducimus sed soluta occaecati atque beatae.',7,393492,59,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(91,'',116971932,426041,'Blanditiis omnis quibusdam quod explicabo sit.',17,775,29,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(92,'',9149,935,'In iure ut delectus eum reprehenderit molestiae.',21199857,216199425,635016,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(93,'',98618,70,'Beatae quo tempore dolorem ut architecto.',8,8245,6680,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(94,'',40511208,4,'Sunt dolore ut facere fugiat numquam occaecati.',244,405426,6583,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(95,'',156823236,22,'Repellendus dolorem quia rem sit numquam qui.',27678961,8002533,72391,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(96,'',56,57478,'Et recusandae id error voluptatum aperiam.',92,3751383,11347010,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(97,'',10,491804,'Molestiae at amet sed nesciunt.',484210,5909817,13326593,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(98,'',448931612,664,'Aut sit placeat et quae.',12569468,830155,13771521,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(99,'',833,953037558,'Explicabo perferendis placeat sed alias.',8334,1156194,5473057,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(100,'',85063,31932,'Ullam cum rerum voluptatibus ut quo.',681237443,929891284,6128,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(101,'',895,7,'Ut blanditiis dicta et quasi in.',6,9127426,8,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(102,'brand_images/OIRwAj4JoEeflQZIfeTxhBGB5kvRaOlWvXx2dcFc.jpg',1,1,'brand name',1,1,1,'2021-05-21 23:14:24','2021-05-21 23:14:24');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShopGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Variation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FloorGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CategoryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `to_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,'2',NULL,'1','2021-04-27 08:10:23','2021-04-27 08:10:23'),(2,'3',NULL,'1','2021-04-28 21:58:00','2021-04-28 21:58:00'),(7,'3',NULL,'2','2021-04-28 22:31:40','2021-04-28 22:31:40'),(8,'7',NULL,'6','2021-05-09 22:48:02','2021-05-09 22:48:02'),(9,'7',NULL,'2','2021-05-09 22:48:09','2021-05-09 22:48:09'),(10,'7',NULL,'1','2021-05-10 06:41:07','2021-05-10 06:41:07'),(11,'7',NULL,'7','2021-05-10 07:52:20','2021-05-10 07:52:20'),(12,'1',NULL,'6','2021-05-18 03:03:19','2021-05-18 03:03:19'),(13,'1',NULL,'8','2021-05-25 01:12:10','2021-05-25 01:12:10'),(14,'63',NULL,'1','2021-05-25 08:40:48','2021-05-25 08:40:48'),(15,'63',NULL,'4','2021-05-25 08:42:10','2021-05-25 08:42:10'),(16,'63',NULL,'3','2021-05-25 08:42:16','2021-05-25 08:42:16'),(17,'63',NULL,'2','2021-05-25 08:42:16','2021-05-25 08:42:16'),(18,'66',NULL,'1','2021-05-25 21:43:17','2021-05-25 21:43:17'),(19,'66',NULL,'2','2021-05-26 03:26:42','2021-05-26 03:26:42'),(20,'66',NULL,'3','2021-05-26 03:26:56','2021-05-26 03:26:56');
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `create_a_d_s`
--

DROP TABLE IF EXISTS `create_a_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `create_a_d_s` (
  `id` bigint(20) unsigned NOT NULL,
  `ad_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_identity` int(11) NOT NULL,
  `ad_caption` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_client` int(11) NOT NULL,
  `merchant` int(11) NOT NULL,
  `client_name` int(11) NOT NULL,
  `ad_duration` int(11) NOT NULL,
  `visual_identity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `create_a_d_s`
--

LOCK TABLES `create_a_d_s` WRITE;
/*!40000 ALTER TABLE `create_a_d_s` DISABLE KEYS */;
INSERT INTO `create_a_d_s` VALUES (1,'Eum maxime commodi sed.',278290360,'Facere ipsam qui aut cupiditate consequatur quos.',42573,172668226,491,45047,6489,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(2,'Sit temporibus quisquam quo temporibus.',5510,'Omnis assumenda amet in qui.',401332200,2342,23732421,13137777,147,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(3,'Eos nesciunt molestias rem modi.',57451246,'Et aperiam porro qui reiciendis dolores.',55,696402657,458,1675959,28,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(4,'Laboriosam sint quasi non illum nihil illum.',7405897,'Et ut qui sed id et corrupti.',2,376614068,87032101,988568922,6,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(5,'Voluptatibus voluptatem et autem.',271015,'Atque vel porro repellat ut ab.',316217916,12168233,45048276,3,7396340,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(6,'Nobis rerum molestias earum laudantium.',351899,'Quis a eligendi ipsa quo tempora fugiat nemo.',6090213,7678,49299561,5,2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(7,'Repellat dolor consequatur hic vel est deleniti.',402419591,'Unde at vel eaque a voluptatem et.',82,7,374945,97837,4588,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(8,'Labore culpa est explicabo velit vero.',6867041,'Quos libero cupiditate labore nobis.',122019771,3725,709,7719,8,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(9,'Omnis cumque blanditiis molestiae.',14,'Enim aperiam aut inventore corrupti voluptatem.',5,9908,429,964333260,7,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(10,'Blanditiis repudiandae nihil esse eligendi.',93875,'Necessitatibus voluptas odio sunt iusto quia.',6,9,57691508,607696054,78,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(11,'Create Ad name',1,'Create ad caption',1,1,1,1,1,'2021-05-22 04:42:07','2021-05-22 04:42:07');
/*!40000 ALTER TABLE `create_a_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DOB` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimaryContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondaryContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UserID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_secondary_address`
--

DROP TABLE IF EXISTS `customer_secondary_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_secondary_address` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_secondary_address`
--

LOCK TABLES `customer_secondary_address` WRITE;
/*!40000 ALTER TABLE `customer_secondary_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_secondary_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_uploads`
--

DROP TABLE IF EXISTS `file_uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_uploads` (
  `id` bigint(20) unsigned NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_uploads`
--

LOCK TABLES `file_uploads` WRITE;
/*!40000 ALTER TABLE `file_uploads` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_uploads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floor` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `FloorName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floor`
--

LOCK TABLES `floor` WRITE;
/*!40000 ALTER TABLE `floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `floors` (
  `id` bigint(20) unsigned NOT NULL,
  `floor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floors`
--

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;
INSERT INTO `floors` VALUES (2,'Excepturi vero suscipit est.','In accusantium ex nihil laboriosam.',919,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(3,'Est temporibus tempore et.','Soluta facere deleniti sit corporis.',7208537,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(4,'Delectus enim voluptas vero.','Cupiditate quia nihil laborum aut omnis.',82151798,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(5,'Consequatur rerum voluptatum rem quos.','Enim architecto labore quidem autem.',5824594,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(6,'Sit saepe saepe optio porro aut nihil ullam.','Odio necessitatibus qui tempora expedita quas.',5677,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(7,'Vitae reiciendis qui cumque nobis et ut.','Debitis commodi dicta rerum.',94,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(8,'Vel consequatur molestiae eius ab et libero.','Enim assumenda maiores ut saepe dolore.',26149,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(9,'Maxime ut asperiores dolor magni deleniti.','Maiores et vel aliquid dolorum dolore alias.',33375,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(10,'Totam earum voluptas mollitia praesentium et.','Aut autem doloribus qui optio.',76431,'2021-05-06 23:04:29','2021-05-06 23:04:29'),(11,'Test Floor Name','Test Floor Category',1,'2021-05-06 23:19:01','2021-05-06 23:19:01'),(12,'Test Floor Name 1','Test Floor Category 1',1,'2021-05-09 18:48:13','2021-05-09 18:48:13'),(13,'Expedita quia quas illo iusto consequatur hic.','Quis dolorem ullam quia.',3,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(14,'Qui reprehenderit ex officiis.','Laboriosam et est aut nemo est sed aut est.',36682817,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(15,'Voluptatem laudantium molestiae qui.','Exercitationem in at voluptatem quos.',5,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(16,'Temporibus ut amet aspernatur voluptatem quia.','Tempora vel atque veniam accusamus.',5,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(17,'Tempore quia eum quae explicabo aut.','Excepturi harum voluptas animi facilis.',6573202,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(18,'Nihil consectetur et aut nam et aperiam.','Rerum eum nemo doloribus occaecati deserunt.',7467,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(19,'Et ea vitae minus enim.','Voluptate debitis error porro incidunt.',95244,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(20,'Sed nisi nisi aliquam cumque.','Accusantium vel corrupti et aut et sed.',97,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(21,'Ut et aliquam in blanditiis dolore et at.','Et minus voluptatem nemo quia.',7,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(22,'Qui nulla porro delectus et.','Maiores quia adipisci ut impedit.',238581281,'2021-05-09 20:05:18','2021-05-09 20:05:18'),(23,'Sunt et perferendis similique.','Odit nostrum autem quisquam beatae eaque quos.',830517,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(24,'Et est non repellendus consequatur.','Qui sunt atque accusamus ratione odio odio.',99920955,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(25,'Qui delectus et numquam facilis et.','Consequatur mollitia quo qui a maiores.',61,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(26,'Debitis at ducimus iusto reiciendis voluptas.','Omnis aut laborum consequatur nihil sed.',14,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(27,'Et eum aut quaerat sit quae distinctio rerum.','Aut enim amet unde ea.',411,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(28,'Cumque reprehenderit similique iste esse ut.','Id aut libero tenetur.',7119682,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(29,'Eius pariatur eos sit modi.','Delectus nihil esse sed quasi quia repellendus.',8,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(30,'Quos reprehenderit quae et ad sint cupiditate.','Aut ullam unde dolor nisi.',42661413,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(31,'Qui facilis odio soluta voluptate nobis et magni.','Quo aut a ut voluptatem eligendi magnam voluptas.',17114615,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(32,'Ea eum accusantium fugit sit asperiores quisquam.','Nihil eos cumque aut minus eos vitae.',476075,'2021-05-09 20:06:15','2021-05-09 20:06:15'),(33,'Voluptatem dolorem fugit est sed.','Ut maiores incidunt odit rerum.',44587,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(34,'Esse sed consequatur consectetur veniam aut sint.','Quis id cum id.',335,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(35,'Et suscipit ratione est sit autem.','Quo totam consequatur enim aut.',804232956,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(36,'Sit consectetur quo consequatur.','Ut expedita et modi blanditiis qui.',6,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(37,'Non ut magnam voluptatem earum officia odit.','Est reprehenderit natus qui illo sequi.',5125794,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(38,'Facere aliquid assumenda hic officiis.','Quas eum adipisci ducimus animi aut.',56595,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(39,'Voluptatem mollitia beatae et.','Necessitatibus sed voluptates voluptate placeat.',5,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(40,'Veritatis aut ut ullam quis vel qui vel.','Praesentium aut maiores accusantium modi sit.',49,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(41,'Facilis ullam in cum.','Enim libero repudiandae deleniti quaerat.',650878653,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(42,'Aspernatur vel nostrum vel sint dignissimos.','Rerum eum ut delectus voluptate nulla.',601740,'2021-05-09 20:06:49','2021-05-09 20:06:49'),(43,'Officiis perferendis perferendis ut et unde.','Et incidunt possimus veritatis.',7010053,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(44,'In ut ipsam quas autem qui nobis.','Cumque accusamus voluptate ut eos eum.',154,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(45,'Non sit sit est nihil.','Et aliquam quibusdam pariatur ut minima.',5625494,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(46,'Quibusdam inventore quis debitis.','Sint quod accusantium repudiandae.',1106,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(47,'Reprehenderit cum sunt quos nihil quibusdam.','Illo qui sapiente deserunt a porro quam placeat.',6,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(48,'Non aut ducimus laborum minima.','Ratione distinctio velit vel ut corrupti.',6696,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(49,'In aperiam eaque aut a aspernatur.','Quo ea quos et.',337938780,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(50,'Sit temporibus asperiores neque facilis autem.','Doloribus animi ut aut occaecati ea.',111,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(51,'Rem fuga qui aspernatur nobis modi minima.','Quas rerum aut porro beatae amet vero.',52454620,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(52,'Repellendus id nihil veniam pariatur.','Ullam a ut aperiam et quia.',9,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(53,'Occaecati ea at consequatur excepturi eum.','Velit qui quo omnis molestiae nulla dolorem.',45100,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(54,'Voluptatibus omnis quos vel ut.','Aut et et ullam quod ut repellendus dolore.',45,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(55,'Molestiae cum et aut nam veritatis fugit.','Aut et et id et non beatae.',59289316,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(56,'Est est accusantium nam at quidem a quas autem.','Ut ut aliquam qui id et.',82330,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(57,'Quisquam aut dolore autem iusto ipsam.','Iste labore a sed omnis voluptatem fuga.',40116168,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(58,'Et voluptas odio maiores rerum repellat.','Ut et minus ea fuga illum dignissimos qui.',43,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(59,'Sit quo aperiam quasi architecto.','Tempora magni dolore quod eos sit.',95,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(60,'Labore non voluptatum neque.','Ea officia rerum rerum beatae odio fuga et.',9,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(61,'Libero cupiditate officia amet quaerat.','Omnis et eos explicabo mollitia et eum.',246,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(62,'Dolor adipisci et quia est expedita in debitis.','Inventore molestias sed ut a ut fugiat nihil.',828084,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(63,'Aut eligendi consequatur et et magni et eos.','Dolorem ea non rerum esse laboriosam.',2478068,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(64,'Mollitia quis magnam et velit.','Blanditiis voluptatem laboriosam dolor.',735385162,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(65,'Id animi illo et.','Aut ut non nihil qui aliquid voluptas vel.',34383,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(66,'Perspiciatis mollitia ea quis.','Veritatis sit commodi neque.',924548,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(67,'Eaque optio qui voluptatem magni reprehenderit.','Commodi rerum a odio accusamus ut voluptate.',74195365,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(68,'Iste saepe non officia et a.','Sed voluptatem sunt ab voluptatum ut harum amet.',292,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(69,'Optio voluptatibus est commodi.','Explicabo aut repudiandae nemo accusamus aliquid.',39,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(70,'Alias mollitia earum tenetur provident ad.','Error quas sunt nihil porro provident.',516,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(71,'Et minima atque deserunt repellat rerum illum.','Repellendus distinctio molestias quas.',6,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(72,'Qui fugit officiis eos tempora sunt qui sit.','Voluptatem sit vel amet qui sint.',977,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(73,'Nobis quidem voluptatem quo.','Dolor aperiam dolorum at sint soluta.',792866,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(74,'Voluptatem ab placeat quia hic nisi.','Ducimus doloribus sunt repellendus.',171,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(75,'Sit rerum earum impedit sapiente qui repudiandae.','Numquam sit expedita nulla natus.',21,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(76,'Debitis ipsam perferendis quo ut vitae et.','Porro qui ullam repellat deleniti qui nobis cum.',7,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(77,'Consequatur est ab cum vitae nihil cum.','Velit iusto laboriosam velit et.',5091864,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(78,'Ex labore repellendus commodi alias et.','Sed aut nisi aspernatur aut.',26928691,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(79,'Autem accusantium et occaecati molestiae.','In cumque ducimus est similique eveniet.',21286103,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(80,'Laudantium aspernatur qui ea.','Alias quisquam aut delectus.',4,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(81,'Non maiores ratione dignissimos ratione rerum.','Velit consequatur labore voluptas quo enim.',531290,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(82,'Vitae est rerum ea cupiditate qui.','Ab atque est autem qui beatae est et.',21125,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(83,'Beatae earum reprehenderit nam modi deserunt vel.','Consectetur eos et perferendis aliquam error.',1639,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(84,'Aut sit commodi non alias qui.','Nesciunt nobis quis voluptatem quas sit.',48,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(85,'Sit aut ipsa voluptatem omnis.','Quia corrupti iure sit neque qui.',94251631,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(86,'Et aut debitis quidem quis recusandae.','Molestias quia et aspernatur nobis nihil et.',23,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(87,'Illo labore nemo animi aliquid.','Repellendus itaque ratione perferendis eveniet.',4584420,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(88,'Illum ducimus culpa nesciunt est.','Ut magni quibusdam saepe consequuntur maiores et.',6704,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(89,'Occaecati tempore dolorum fugiat quia ut.','Molestias dolor exercitationem quo ea.',841823,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(90,'Voluptas excepturi voluptatum culpa consequuntur.','Voluptate est occaecati voluptates assumenda.',3,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(91,'Autem modi dolore quia sit laborum.','Dolor est id suscipit doloribus sit.',6313154,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(92,'Perspiciatis est non odit non molestias qui.','Aut est et ab error.',36194,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(93,'Expedita quo nesciunt aperiam aut soluta.','Eum aut dolores minus dolore enim.',8965,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(94,'Ipsa vel soluta accusantium commodi est.','Id sit deleniti cumque sit corporis.',13532,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(95,'Sed et quas consequatur et soluta id.','Sapiente ex quis voluptas eaque architecto.',9952,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(96,'Similique et rerum fugit cum magni voluptas.','Asperiores consequuntur totam rerum magni dolore.',766789,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(97,'Non delectus cupiditate sint cupiditate omnis.','Ut debitis quos et error cum at.',391,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(98,'Est iusto itaque minus maiores quia.','Quis quis similique ipsam.',588,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(99,'Sapiente deserunt voluptatem debitis molestiae.','Aut placeat libero eaque ex.',324884,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(100,'Et nostrum nemo sunt.','Molestias consequatur et perspiciatis id aut.',42317,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(101,'Quidem impedit velit quia fuga.','Et recusandae hic cum.',2538,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(102,'Et alias omnis nobis rerum quo unde aut eaque.','Sit est commodi nihil sequi beatae.',2220,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(103,'Ut blanditiis odit praesentium sit officiis sed.','Qui dolore earum ea illo.',426,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(104,'Et facere ut magni.','Molestiae illum deleniti sed et.',45,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(105,'Officia sed sed error iure nesciunt iste maxime.','Est sequi quo optio dolorem vel et.',826076278,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(106,'Ea doloribus adipisci sint quidem nam quis.','Enim et autem minus.',49288687,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(107,'Consectetur expedita vel et non voluptatum ab.','Et ratione expedita velit reprehenderit est sit.',91283,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(108,'Nemo et impedit rerum sunt.','Molestiae quia veritatis modi assumenda animi ut.',400779953,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(109,'Maiores doloribus magni aspernatur sed et.','Aut aut repellendus optio quas ipsum unde rerum.',170009509,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(110,'Eaque autem assumenda ducimus qui ipsam.','Ad molestiae suscipit aut.',53865998,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(111,'Vel ad rerum nemo quia laborum id.','Nostrum ut et ex atque quidem.',340744386,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(112,'Laboriosam qui sit quasi.','Eligendi voluptatem et aut totam cumque.',19,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(113,'Molestias fuga est non optio cupiditate.','Sed nesciunt quia esse excepturi velit.',322,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(114,'Rerum vero voluptas est optio.','Odit maxime quaerat voluptas sit in minus qui.',52,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(115,'Et et vel nesciunt aliquid eos suscipit atque.','Quae labore atque vel quaerat ut nam voluptate.',4677271,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(116,'Autem soluta consectetur sed et.','Ut quia sed earum delectus. Quo quasi et sint.',191345223,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(117,'Soluta explicabo enim neque deleniti.','Voluptatem et nemo quo numquam nostrum est ipsa.',53918490,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(118,'Ad necessitatibus ut ipsam.','Aut numquam in perferendis ab temporibus.',2590208,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(119,'Vel iure eligendi distinctio est natus ex.','Rerum neque ut est velit.',29,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(120,'Et et perferendis natus non et non aliquid.','Eveniet qui ea voluptatem dolorum.',6,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(121,'In et voluptatem et quis facilis qui quia unde.','Asperiores sunt repellendus impedit officiis.',474994085,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(122,'Omnis eaque hic aliquid harum.','Consequatur sit expedita maiores repudiandae.',853,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(123,'Ut culpa doloribus ut. Ipsa nihil aut ut illum.','Dolores suscipit et hic doloribus sit velit.',9834,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(124,'Animi est molestiae sit vitae enim quo.','Illo voluptatibus voluptas ut tenetur.',78585,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(125,'Qui quod nostrum placeat molestiae et.','Ipsum sit nesciunt non provident ut suscipit hic.',363538812,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(126,'Illum impedit sit facere dolor.','Error sapiente eligendi et quia.',47,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(127,'A iusto maxime sit consequuntur.','Et labore eligendi ratione sit.',9928,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(128,'Dicta quidem consequatur error non.','Voluptatem ut aut delectus enim possimus.',21957539,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(129,'Est sapiente odit autem magnam et accusantium.','Vel sed velit et modi error.',60919,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(130,'Quis quis nostrum provident nesciunt.','Nesciunt aut rerum quia ea.',4,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(131,'Omnis eaque dolores quos eum.','Quos quisquam repellat quod est.',5869301,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(132,'Quis non et earum explicabo sed.','Minima ut et omnis quo modi et est.',1721669,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(133,'Nemo labore sunt quibusdam ratione est amet.','Et fugit impedit et est sunt accusantium vel non.',93362,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(134,'Rerum vel non iure quidem sed ut voluptatem.','Qui ipsam itaque ut assumenda.',6805232,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(135,'Possimus eaque et numquam dolores exercitationem.','Aliquam neque enim animi quaerat.',3726,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(136,'Similique saepe et alias sequi quidem.','Sit et consequatur ad ut occaecati perferendis.',409149914,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(137,'Quia et voluptates est in nostrum et.','Sit voluptatem suscipit est voluptas ad.',85550,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(138,'Nemo ea vero et mollitia aperiam sed.','Dolor saepe pariatur eaque quos.',19302,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(139,'Quisquam culpa et aut.','Dolor ipsam accusantium aut assumenda sunt.',3848,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(140,'Ab consequuntur maiores rerum.','Eius accusantium nobis maiores.',857166,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(141,'Quidem et repellat dolores nostrum voluptas.','Ullam autem nobis magni porro laboriosam aut.',106346,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(142,'Et dignissimos aliquam veritatis neque.','Aut porro modi fugiat fugit repellendus ipsa.',676084,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(143,'Vel dicta odio aut fugiat.','Tempora voluptatum officiis non libero.',40,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(144,'Accusamus soluta qui totam ullam aliquam.','Deleniti impedit vel sit dolor sunt.',5,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(145,'Atque id voluptas amet est.','Corrupti iusto quia quia.',894958218,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(146,'Hic impedit neque illo accusantium.','Sit ut veniam perspiciatis est dolore.',1,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(147,'Sunt dicta voluptas magnam sit qui sit rerum.','Qui aut ut eum rerum.',241,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(148,'Libero nesciunt perspiciatis a iusto ipsa.','Optio consectetur ab sed eos.',174062,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(149,'Eum consequatur et non dolore aut.','Quo illo est tempora dolorem quibusdam.',861005960,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(150,'Ab voluptatem distinctio dolor voluptas facilis.','Et necessitatibus optio et omnis.',47,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(151,'A sunt minima cum et qui.','Aspernatur et deserunt dolorum et qui.',69,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(152,'Quia quas itaque corrupti accusantium quisquam.','Rem sunt omnis minus id tempora.',51,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(153,'Voluptatem illum rerum qui ut cumque qui.','Ut molestias quia dignissimos ducimus et.',1162,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(154,'Eum maxime ipsa quae.','Quo inventore aperiam eveniet iure.',3,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(155,'Omnis ut laudantium pariatur atque ea voluptatem.','Nisi officia temporibus id aut tempore et.',8,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(156,'Placeat sit sit nihil optio.','Ex asperiores ea nesciunt autem quo tempore.',14866797,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(157,'Aut amet et nulla fugiat.','Quod voluptatem minima maiores nisi facere.',7,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(158,'Molestiae qui qui sint aut.','Harum aperiam odio nemo at adipisci.',49585540,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(159,'Amet consequatur veniam rem vel.','Quidem sunt voluptate dicta quaerat saepe.',633082773,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(160,'Fuga eaque sit saepe odit autem.','Rerum iusto quo vel quia debitis vero non.',280,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(161,'Voluptas et non aut neque ab.','Repudiandae eaque itaque repudiandae eos odio.',281101,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(162,'Atque quae voluptatem laudantium ipsam.','Corporis accusantium rerum ut ut quas.',4,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(163,'Fugiat rem a ea cupiditate et.','Nisi aut et et non et culpa impedit accusamus.',734,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(164,'Consectetur rerum enim doloribus blanditiis.','Aut error facere facere numquam alias sit.',96735,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(165,'Hic est numquam vel doloremque veritatis dolores.','Neque et laudantium necessitatibus et.',467,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(166,'Ut at placeat dolores sapiente qui maiores.','Et corrupti sit et voluptas.',3661,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(167,'Eius ea voluptas dicta.','Autem animi id quo amet eum iste non placeat.',9,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(168,'Ratione in modi corporis itaque repudiandae.','Dolorem et repudiandae mollitia quos.',30,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(169,'Animi minima sed eos ullam voluptatibus.','Dignissimos qui est eos rem.',41351558,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(170,'Et et tempore rerum eligendi et.','Libero aut fugit dolore.',8753,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(171,'Voluptatum excepturi iure quam et.','Ab nesciunt ea libero aperiam rerum.',714198334,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(172,'Est cum accusamus veniam nesciunt iure.','Ab ducimus minima velit eum dolore in.',10300,'2021-05-21 22:04:53','2021-05-21 22:04:53');
/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,'7','1','Pending',NULL,'2021-05-10 00:01:22','2021-05-10 00:01:22'),(10,'7','2','Pending',NULL,'2021-05-10 07:03:15','2021-05-10 07:03:15'),(13,'7','1','Pending',NULL,'2021-05-10 08:48:06','2021-05-10 08:48:06'),(14,'63','8','63',63,'2021-05-25 08:48:54','2021-05-25 08:48:54'),(15,'8','63','Accept',63,'2021-05-25 08:48:54','2021-05-25 08:54:14'),(16,'66','1','Pending',66,'2021-05-25 21:33:02','2021-05-25 21:33:02');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_notification`
--

DROP TABLE IF EXISTS `general_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_notification` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShopGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PromotionUpdate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_notification`
--

LOCK TABLES `general_notification` WRITE;
/*!40000 ALTER TABLE `general_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_chats`
--

DROP TABLE IF EXISTS `group_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_chats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_chats`
--

LOCK TABLES `group_chats` WRITE;
/*!40000 ALTER TABLE `group_chats` DISABLE KEYS */;
INSERT INTO `group_chats` VALUES (1,'Hi','1','Nana','1',NULL,'2021-05-11 17:05:53','2021-05-11 17:05:53'),(2,'sd','1','Nana','1',NULL,'2021-05-11 22:43:53','2021-05-11 22:43:53'),(3,'hI','2','Kalina','1',NULL,'2021-05-11 22:49:36','2021-05-11 22:49:36'),(4,'HI','2','Kalina','1',NULL,'2021-05-11 22:49:55','2021-05-11 22:49:55'),(5,'hi','2','Kalina','1',NULL,'2021-05-11 22:51:02','2021-05-11 22:51:02'),(6,'13','1','Nana','1',NULL,'2021-05-11 22:51:53','2021-05-11 22:51:53'),(7,'asd','2','Kalina','1',NULL,'2021-05-11 22:52:15','2021-05-11 22:52:15'),(8,'ew','3','Rahid','1',NULL,'2021-05-11 22:53:12','2021-05-11 22:53:12'),(9,'asdfsadfsdfasdfasdfasdfsdfsfasfsdfsdfadsfsdfsd','1','Nana','1',NULL,'2021-05-11 23:08:34','2021-05-11 23:08:34'),(10,'asdfsfsfsldkflaksdf oivowneiuiounvvjsdf s psofj sdjfsdlkfjasd;lfjsd iupeaf','1','Nana','1',NULL,'2021-05-11 23:08:50','2021-05-11 23:08:50'),(11,'Hi','63','nana','3',NULL,'2021-05-25 09:07:39','2021-05-25 09:07:39'),(12,'ge','66','asd','4',NULL,'2021-05-26 03:51:44','2021-05-26 03:51:44'),(13,'asdf','66','asd','6',NULL,'2021-05-26 03:54:44','2021-05-26 03:54:44'),(14,'ddd','66','asd','11',NULL,'2021-05-26 03:57:08','2021-05-26 03:57:08');
/*!40000 ALTER TABLE `group_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_users`
--

DROP TABLE IF EXISTS `group_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_users`
--

LOCK TABLES `group_users` WRITE;
/*!40000 ALTER TABLE `group_users` DISABLE KEYS */;
INSERT INTO `group_users` VALUES (1,1,2,NULL,'2021-05-11 08:43:12','2021-05-11 08:43:12'),(2,1,3,NULL,'2021-05-11 08:43:12','2021-05-11 08:43:12'),(3,1,1,NULL,'2021-05-11 08:43:12','2021-05-11 08:43:12'),(4,2,1,NULL,'2021-05-13 23:44:30','2021-05-13 23:44:30'),(5,2,3,NULL,'2021-05-13 23:44:30','2021-05-13 23:44:30'),(6,2,2,NULL,'2021-05-13 23:44:30','2021-05-13 23:44:30'),(7,3,1,NULL,'2021-05-25 09:07:15','2021-05-25 09:07:15'),(8,3,2,NULL,'2021-05-25 09:07:15','2021-05-25 09:07:15'),(9,3,63,NULL,'2021-05-25 09:07:15','2021-05-25 09:07:15'),(10,4,1,NULL,'2021-05-25 21:29:54','2021-05-25 21:29:54'),(11,4,2,NULL,'2021-05-25 21:29:54','2021-05-25 21:29:54'),(12,4,66,NULL,'2021-05-25 21:29:54','2021-05-25 21:29:54'),(13,5,8,NULL,'2021-05-26 03:50:45','2021-05-26 03:50:45'),(14,5,3,NULL,'2021-05-26 03:50:45','2021-05-26 03:50:45'),(15,5,66,NULL,'2021-05-26 03:50:45','2021-05-26 03:50:45'),(16,6,1,NULL,'2021-05-26 03:53:08','2021-05-26 03:53:08'),(17,6,2,NULL,'2021-05-26 03:53:08','2021-05-26 03:53:08'),(18,6,3,NULL,'2021-05-26 03:53:08','2021-05-26 03:53:08'),(19,6,8,NULL,'2021-05-26 03:53:08','2021-05-26 03:53:08'),(20,6,66,NULL,'2021-05-26 03:53:08','2021-05-26 03:53:08'),(21,7,1,NULL,'2021-05-26 03:54:25','2021-05-26 03:54:25'),(22,7,2,NULL,'2021-05-26 03:54:25','2021-05-26 03:54:25'),(23,7,3,NULL,'2021-05-26 03:54:25','2021-05-26 03:54:25'),(24,7,66,NULL,'2021-05-26 03:54:25','2021-05-26 03:54:25'),(25,8,2,NULL,'2021-05-26 03:55:24','2021-05-26 03:55:24'),(26,8,1,NULL,'2021-05-26 03:55:24','2021-05-26 03:55:24'),(27,8,3,NULL,'2021-05-26 03:55:24','2021-05-26 03:55:24'),(28,8,66,NULL,'2021-05-26 03:55:24','2021-05-26 03:55:24'),(29,9,1,NULL,'2021-05-26 03:55:53','2021-05-26 03:55:53'),(30,9,3,NULL,'2021-05-26 03:55:53','2021-05-26 03:55:53'),(31,9,2,NULL,'2021-05-26 03:55:53','2021-05-26 03:55:53'),(32,9,66,NULL,'2021-05-26 03:55:53','2021-05-26 03:55:53'),(33,10,1,NULL,'2021-05-26 03:56:08','2021-05-26 03:56:08'),(34,10,2,NULL,'2021-05-26 03:56:08','2021-05-26 03:56:08'),(35,10,3,NULL,'2021-05-26 03:56:08','2021-05-26 03:56:08'),(36,10,66,NULL,'2021-05-26 03:56:08','2021-05-26 03:56:08'),(37,11,1,NULL,'2021-05-26 03:56:57','2021-05-26 03:56:57'),(38,11,2,NULL,'2021-05-26 03:56:57','2021-05-26 03:56:57'),(39,11,3,NULL,'2021-05-26 03:56:57','2021-05-26 03:56:57'),(40,11,8,NULL,'2021-05-26 03:56:57','2021-05-26 03:56:57'),(41,11,66,NULL,'2021-05-26 03:56:57','2021-05-26 03:56:57'),(42,12,1,NULL,'2021-05-26 03:57:40','2021-05-26 03:57:40'),(43,12,8,NULL,'2021-05-26 03:57:40','2021-05-26 03:57:40'),(44,12,66,NULL,'2021-05-26 03:57:40','2021-05-26 03:57:40');
/*!40000 ALTER TABLE `group_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'asdsad','2021-05-11 08:43:12','2021-05-11 08:43:12'),(2,'asd123','2021-05-13 23:44:30','2021-05-13 23:44:30'),(3,'Testing','2021-05-25 09:07:15','2021-05-25 09:07:15'),(4,'testings','2021-05-25 21:29:54','2021-05-25 21:29:54'),(5,'testings02','2021-05-26 03:50:45','2021-05-26 03:50:45'),(6,'testings 03','2021-05-26 03:53:08','2021-05-26 03:53:08'),(7,'asdf','2021-05-26 03:54:25','2021-05-26 03:54:25'),(8,'ddff','2021-05-26 03:55:24','2021-05-26 03:55:24'),(9,'asdfaf','2021-05-26 03:55:53','2021-05-26 03:55:53'),(10,'ddfffd','2021-05-26 03:56:08','2021-05-26 03:56:08'),(11,'dfdfdfdf','2021-05-26 03:56:57','2021-05-26 03:56:57'),(12,'rrtrt','2021-05-26 03:57:40','2021-05-26 03:57:40');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_charges`
--

DROP TABLE IF EXISTS `logistic_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logistic_charges` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_charges`
--

LOCK TABLES `logistic_charges` WRITE;
/*!40000 ALTER TABLE `logistic_charges` DISABLE KEYS */;
INSERT INTO `logistic_charges` VALUES (1,'1122','KL','Kuching','111','2',1,NULL,NULL),(2,'11221','Amerca','thailand','121','22',1,NULL,NULL),(3,'1122','KL','Kuching','111','2',1,NULL,NULL),(4,'1122','Amerca','thailand','121','22',1,NULL,NULL);
/*!40000 ALTER TABLE `logistic_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistic_partner`
--

DROP TABLE IF EXISTS `logistic_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logistic_partner` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SubBrandGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LogisticPartnarName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistic_partner`
--

LOCK TABLES `logistic_partner` WRITE;
/*!40000 ALTER TABLE `logistic_partner` DISABLE KEYS */;
/*!40000 ALTER TABLE `logistic_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logistics`
--

DROP TABLE IF EXISTS `logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logistics` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logistics`
--

LOCK TABLES `logistics` WRITE;
/*!40000 ALTER TABLE `logistics` DISABLE KEYS */;
INSERT INTO `logistics` VALUES (1,'1122','logistic_images/0EgUrkmn7eP9PrfbyPtH3HF7bxo5N3cCLS8GFi2g.jpg','GDEX',1,'2021-05-20 19:44:40','2021-05-20 19:44:40'),(2,'1122','logistic_images/zEvhWiiyMIkW0oQfifdCE2SXcCiHx9g12StgvvKT.jpg','GDEX',1,'2021-05-20 19:56:09','2021-05-20 19:56:09');
/*!40000 ALTER TABLE `logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malls`
--

DROP TABLE IF EXISTS `malls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `malls` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mall_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` int(11) NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int(11) NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malls`
--

LOCK TABLES `malls` WRITE;
/*!40000 ALTER TABLE `malls` DISABLE KEYS */;
INSERT INTO `malls` VALUES (1,'','Nostrum laudantium eveniet sed nesciunt.','Rerum voluptatem ea esse officiis dolorem.',66294,'Enim ut est ullam non qui et.','Et expedita qui voluptatum.',2429416,'Autem voluptas assumenda perferendis dolore.','Reprehenderit ad repellendus fuga quam.',197857168,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(2,'','Update Mall Name','Update Contact Person',775617,'Update emailriyalhasan@yahoo.com','Update Address',6100,'Update Country','Update City',1,'2021-05-10 02:05:32','2021-05-10 02:28:13'),(3,'','Update Mall Name','Update Contact Person',775617,'Update emailriyalhasan@yahoo.com','Update Address',6100,'Update Country','Update City',1,'2021-05-10 02:05:32','2021-05-10 02:29:06'),(4,'','Ducimus et in enim sequi.','Sunt amet ipsa voluptas assumenda et praesentium.',11139,'Tenetur minima doloribus explicabo.','Quaerat voluptatum quia in sunt qui tempora.',1213,'Officiis quis incidunt autem itaque.','Eum minus sunt maiores libero.',247646684,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(5,'','Omnis illum aperiam odit.','Id nulla excepturi dolore rem corrupti iure.',9,'Eligendi optio id numquam iste eos.','Commodi ullam distinctio itaque qui qui repellat.',70519220,'Illo est repellendus voluptate qui aliquid.','Tempore nemo est magnam.',5359685,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(6,'','Placeat quos sapiente accusamus explicabo sed.','Et enim sed illum aliquam ut similique odio.',274512761,'Incidunt officiis dolor rerum laboriosam nemo.','Ipsam saepe a officia.',10424,'Ut autem dolorem ipsa consequatur.','Dolorem harum ullam nostrum corrupti.',111442,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(7,'','Unde perferendis saepe ut nulla.','Itaque nesciunt et amet recusandae sed.',1316095,'Id optio sint quas rerum omnis atque culpa.','Velit nam qui qui illum et.',889115,'Ipsa nam ab maxime consequatur.','Nisi reprehenderit aut eveniet amet.',809,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(8,'','Alias alias voluptatem ea temporibus et.','Autem sed unde maiores consequatur tenetur.',932099498,'Occaecati et at cupiditate tempore facilis enim.','Hic praesentium nihil cum sint dolore.',54956,'Voluptas nobis voluptatem aliquid labore.','Perspiciatis ipsam adipisci sunt commodi.',24,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(9,'','Incidunt non magnam voluptatum iusto aut aperiam.','Recusandae consequatur aut ab dolores.',358529,'Esse id et nulla et eum hic facere.','Qui nobis et odit a id a cupiditate.',9,'Sed dignissimos hic magni molestiae repudiandae.','Fugit maiores quibusdam nemo eius quam ea.',45,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(10,'','Ab est illum pariatur incidunt.','Qui minus iure a consequatur.',52719721,'Accusantium quaerat nostrum sed.','Recusandae est mollitia unde.',4737,'Laboriosam sunt at aut.','Maxime sunt quia et omnis rerum molestiae ullam.',87,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(11,'','Test Mall Name','Test Contact Person',775617,'riyalhasan@yahoo.com','Test Address',6100,'Bangladesh','Rajshahi',1,'2021-05-10 02:25:38','2021-05-10 02:25:38'),(12,'','In neque soluta aut ipsum.','Explicabo eveniet voluptate aut iure itaque.',859,'Id unde modi maiores.','Autem nam nesciunt atque quasi porro.',640,'Dolores dignissimos ut ut sapiente est et.','Alias saepe et sed illum et cupiditate placeat.',5538363,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(13,'','Non architecto impedit ea sit error quia et.','Illum est sed tempore quas blanditiis enim.',70197020,'Blanditiis ut atque repellendus ad et officiis.','Voluptatem aut architecto quasi fugit quo.',65278366,'Ipsam quasi ea ut quo enim iste ipsum assumenda.','Dolorum dolor quis optio qui aliquam provident.',92330324,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(14,'','Totam necessitatibus incidunt ea nulla optio.','Et esse corrupti rem nemo.',7951110,'Totam aperiam eligendi nisi et vel est.','Corporis dolorem eos mollitia numquam esse.',7502022,'Harum sed vitae sunt nostrum est dolorem.','Inventore sequi dolores eum nostrum doloremque.',1033594,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(15,'','Ipsa nihil possimus deserunt ut.','Consequuntur animi tempore non quae.',136789939,'Illum sit eos earum qui voluptates.','Nihil asperiores officia eveniet eius.',126,'Aut et asperiores quia repellat debitis aut.','Quia et vero quo sed maiores et.',2351519,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(16,'','Sapiente in est voluptatem quis quisquam.','Sed et modi nihil totam quia omnis.',4,'Consequatur consequatur sed doloribus impedit.','Vero reprehenderit ut ut quasi laborum ab ut.',15664781,'Modi eveniet sit molestiae et.','Et perferendis quibusdam id.',18894816,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(17,'','Autem sed enim provident aperiam.','Voluptates cum ducimus omnis qui.',3622509,'Ea iure distinctio minus laboriosam ut tempora.','Laborum labore ipsum commodi minus fuga.',30,'Sed et molestias maiores voluptas pariatur.','Dolore et earum dolorem ut iste perspiciatis.',80,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(18,'','Aliquam vitae aperiam et illum voluptate.','Iste consectetur nobis consectetur eos tempore.',74686,'Ipsam officia ut provident aliquam quod et.','Id doloremque velit velit blanditiis quam quidem.',53882192,'Quia aspernatur quibusdam vero nihil.','Modi quos eos eos error omnis consequuntur.',7439377,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(19,'','Sed ducimus fugit culpa.','Vero quo qui dicta est.',611,'Aut maxime et et animi corrupti consequuntur et.','Rem ea corporis debitis.',469580356,'Iusto totam enim est corporis laborum fuga.','Aut vero et doloremque qui ut.',9222,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(20,'','Rerum aspernatur impedit dolores possimus.','Aspernatur dolorem nisi assumenda sit.',795,'At temporibus asperiores id vel et possimus.','Voluptas aliquid error dolor.',110828,'Laudantium illum ut ipsam voluptas.','Eos voluptatem ipsa cupiditate.',842,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(21,'','Impedit minus quos magni tenetur iste voluptatem.','Nisi fugiat eum et sed.',79822,'Vel et est quod repellat blanditiis vitae.','Temporibus dolorem commodi explicabo doloremque.',651,'At ex numquam pariatur rerum vitae quia.','Vero a sequi aperiam hic saepe aut ea neque.',52100,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(22,'','Omnis odit maiores beatae ipsam voluptas.','Quaerat veniam harum qui harum ut.',882,'Quas facere officia odit.','Aut consequuntur qui voluptatibus temporibus.',80245,'Et autem et fugiat molestiae ex in dolore.','Sit ad hic dolores et commodi dolorum.',28,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(23,'','Sequi quia quos repellendus rerum.','Eligendi harum aut nostrum.',18367681,'Iste qui enim neque quaerat et explicabo.','Quam ea dolores est aliquid.',281,'Impedit voluptatem fuga harum ad quia iusto et.','Similique est minima natus aut dolorem.',301389735,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(24,'','Tenetur repellendus amet sunt nostrum sit non.','Vitae velit nisi esse veniam.',6048,'Labore recusandae voluptatem occaecati incidunt.','Sapiente atque dolores maxime eius.',1044,'Ipsam ipsum in mollitia repellat.','Architecto eius totam consequatur.',563,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(25,'','Id nam fugiat aut.','Qui sit vel velit veritatis ullam non.',41249,'Sunt ipsam praesentium quia porro.','Sed id dolorum consectetur ut dolore corrupti.',187987388,'Voluptatum minus repellendus ut aliquam ad.','Non explicabo nihil aspernatur eos rerum aut ea.',158199,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(26,'','Officia id modi amet blanditiis magni.','Pariatur velit libero et qui esse nulla.',1047,'Nihil laboriosam nihil sed voluptates.','Vero dolore in et odit.',6,'Sed ut maiores odio deserunt.','Atque ut et est dolores quod.',5269496,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(27,'','Eius voluptas non quia et aut ipsum laboriosam.','Explicabo reiciendis non et odio ut.',7944,'Est consequatur adipisci reprehenderit quaerat.','Accusamus et omnis ut optio neque voluptatem.',548,'Distinctio ea sint eius nihil itaque repellendus.','Odit tempore vel et hic porro aut.',94504,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(28,'','Ex qui deleniti perspiciatis velit occaecati.','Et qui nobis iure non.',940948,'Corporis est sunt et eum.','Eius omnis veritatis iure ea fuga aut.',607003184,'Facere libero beatae adipisci illo.','Eius dolore mollitia sunt rem excepturi.',120,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(29,'','Libero est in facere qui.','Minus sit iure alias id.',262,'Unde sed sed eum est illum quibusdam quis.','Ad officia inventore et ducimus.',48193111,'Dolorem suscipit enim alias earum sit non.','Voluptas qui eum aliquam sit unde nulla.',6162923,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(30,'','Dicta rerum omnis quis similique sed et facere.','Error est qui in excepturi reiciendis hic.',407981,'Qui placeat ut unde provident quod beatae.','Ducimus eum distinctio aut.',66403,'Pariatur magnam optio est totam.','Ut nobis ut voluptate mollitia.',238766287,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(31,'','Ea sit rerum quod praesentium enim quia.','Est ipsum consequuntur consequuntur nesciunt non.',4,'Nemo ea repudiandae labore fuga non asperiores.','Odit quod autem ea. Dolor et voluptatibus quidem.',151424491,'Iusto voluptatem nisi quibusdam expedita quia.','Porro nam aliquid praesentium illum.',3531494,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(32,'','Beatae qui vero qui eum architecto et nostrum.','Voluptas ipsam accusantium qui ipsam optio.',723206181,'Consequatur saepe quisquam maiores tenetur.','Sed architecto placeat et temporibus eaque ut.',6454,'Similique rerum eos occaecati adipisci sit.','Et praesentium et omnis rerum.',5830724,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(33,'','Vel eum eum consequatur accusamus.','Commodi deserunt sunt aut velit ex ullam.',4558,'Id qui dolorum rerum commodi rerum similique aut.','Ut consequatur optio ut consectetur sint.',80232,'Quia vitae magnam aspernatur magnam nam.','Consectetur sed placeat sed corporis quod.',85448236,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(34,'','Ea sed rerum nisi veritatis voluptates fugiat.','Libero placeat et aliquid adipisci numquam.',904143307,'Quos minima ex aut numquam quo quasi enim omnis.','Soluta qui enim eos ut animi consequatur numquam.',85,'Tenetur dolor enim laboriosam ut.','Ipsa qui odit dolorem temporibus molestiae in.',46498735,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(35,'','Ut ipsam voluptatibus assumenda magni aut.','Facere recusandae sequi rerum hic.',8001,'Facilis enim iste qui.','Soluta autem sunt quidem consequatur et.',7,'Consequatur sint consequuntur sed.','Fuga sit dolor nisi sed id est ut.',20,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(36,'','Consequatur iste provident eius ad cum vitae vel.','Eveniet et animi sequi.',817435,'Et at et quas a ullam porro labore.','Fugit tenetur culpa dolore est.',98256192,'Veniam alias numquam et minus.','Accusamus voluptatem non autem ut totam.',50,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(37,'','Vel vero natus incidunt.','Et quos ut asperiores provident consequatur.',383459387,'Dolor officia molestias aut.','Rem sint molestias et nulla expedita qui.',60551966,'Soluta dolor qui sequi.','Error aut maiores necessitatibus.',565450213,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(38,'','Quo possimus adipisci nesciunt corrupti.','Similique eum aut magnam velit a autem non esse.',52,'Minus maiores facere hic qui architecto velit.','Aliquid in ut et.',544597629,'Consequatur non et eius sunt soluta nulla.','Amet maiores eos illum est.',955,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(39,'','Non est voluptatem fugit nihil.','Et esse ea mollitia sed.',202304,'Nam enim sit eum voluptate.','Et saepe quibusdam quis vitae fugit iusto cumque.',4774563,'Voluptate quis facilis ipsa perferendis.','Sit nisi ipsam explicabo optio dolores similique.',8,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(40,'','Nisi qui eos quae recusandae aut.','A tempore explicabo id voluptatem enim odit.',36,'Est quasi eius voluptas est molestiae.','Numquam sint corporis molestiae eligendi dolor.',398348753,'Fugiat quas sit tenetur.','Et at ea odit molestiae quis quia consequatur.',6130,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(41,'','Dolorem qui natus veniam maxime.','In eos omnis recusandae dolorum quo.',805178,'Ea veniam corporis impedit aut corrupti unde.','Enim sit consequuntur iusto non non sapiente.',503854292,'Vitae debitis rerum velit.','Et dolore eos aut quisquam.',26,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(42,'','Earum ea sit optio numquam ut rerum.','Ipsa dolorum quaerat ut et sed.',1416,'Voluptatem qui iure eaque beatae ullam omnis.','Et aut ab eaque minus qui nemo sapiente.',979,'Sequi est et odio repellendus maiores.','Et omnis sit laborum quidem dolor qui enim.',381146951,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(43,'','Soluta voluptate neque voluptas voluptatem odit.','Maxime sapiente vel consequatur vel dolor.',7147,'Id magnam officia autem ipsum explicabo.','Accusamus expedita autem et eligendi.',29626545,'Amet culpa tenetur hic culpa.','Voluptatem voluptas est velit.',28311,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(44,'','Veritatis quibusdam enim non.','Aut sit architecto ut pariatur facilis.',91081522,'Iure id et sunt aut voluptatem omnis.','Eligendi nostrum quam laborum est.',382715177,'Tenetur vero ipsa aut accusantium aut at.','Magnam quod nisi dolorem.',14504,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(45,'','Laboriosam perspiciatis nihil sit beatae est.','Ipsa nam a magnam est. Aut dolor porro ut.',55343,'Velit voluptas consequatur totam.','Modi odio consectetur a cum nulla dolore fugit.',444,'Voluptatum eaque natus quo.','Incidunt qui repudiandae illum praesentium.',5439895,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(46,'','Suscipit nisi ut explicabo.','Ut quos eaque tempore et odit impedit quibusdam.',8,'Eos totam quos vel quia.','Numquam provident sint ipsam autem magni.',455,'Aliquam omnis saepe qui nobis est.','Quis in cupiditate incidunt quas in debitis.',635837406,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(47,'','Quisquam dolorem delectus rerum eius iusto sed.','Ratione et dolores et occaecati sit sit.',54910875,'Ea praesentium qui sunt ex qui quam fuga facilis.','Voluptatem animi illo quis.',7183175,'Ex eius et quo alias.','Aut libero nesciunt illum ex totam.',52450,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(48,'','Sed quasi quibusdam et fugit similique non atque.','Commodi officiis sed ipsum id sint.',939502669,'Laborum est amet vitae aut.','Minima minima delectus accusamus a reiciendis.',11,'Quidem dolorem quaerat veniam et.','Est aliquid laboriosam neque non optio non.',4801577,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(49,'','Sunt possimus magni repellendus amet iusto.','Excepturi asperiores velit voluptatibus quis sit.',5724747,'Omnis possimus rerum aut modi.','Soluta impedit aut incidunt ducimus.',4764985,'Alias adipisci maxime sint.','Nemo molestiae aperiam sequi distinctio.',9,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(50,'','Error quo pariatur repellendus nisi nulla ipsa.','Deleniti mollitia reiciendis ullam quae commodi.',715,'Minus dolores esse id vitae eos voluptatem dolor.','In libero qui ipsum consequatur.',65413481,'Voluptatum ratione autem aliquam voluptates.','Aut quis reprehenderit natus nisi nobis.',73,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(51,'','Quis doloremque beatae recusandae libero fuga.','Aut quis voluptatem quia voluptas aut.',825450,'Tempore corporis alias consequatur ullam.','Fuga qui dolores impedit laborum excepturi.',12,'Et dolores aperiam et.','Minima mollitia repudiandae quia quo.',861,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(52,'','Cumque dolor vero laborum.','Quae nesciunt debitis tenetur quibusdam.',94118266,'Quis et iure sit magni.','Voluptas cumque illum iste et ea et.',4,'Quis sint sunt nemo cum ut omnis.','Animi error ut nulla.',5039917,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(53,'','Optio dolore aut nihil fugit velit quod rerum.','Nostrum soluta expedita sint nam repellendus.',26130454,'Nihil possimus repudiandae et nesciunt et.','Quas ratione veritatis cupiditate.',899833,'Hic aut dolorum doloribus eos.','Nisi pariatur dolores quos qui.',41607,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(54,'','Unde dolores tempora quia rerum autem non.','Sed repellat voluptates non ut.',76949,'Quia est dolorum officiis aperiam et error.','Similique repudiandae qui sed numquam.',907863996,'Sed non modi est tenetur perferendis.','Earum sit vel iste veniam.',47360541,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(55,'','Ipsum et nam quibusdam sunt iusto debitis.','Quasi suscipit quos fugiat architecto.',3,'Perferendis ut minima voluptas molestias.','Veritatis magnam quos unde nulla.',77,'Molestias dicta adipisci ut repellendus.','Eum quis repudiandae culpa facilis.',2402,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(56,'','Debitis totam doloribus voluptatem.','Reiciendis beatae et porro qui culpa doloremque.',974598431,'Incidunt eius et ea fuga est et non.','Consequuntur porro eos est saepe est.',29187,'Est commodi qui dicta cum qui.','Id culpa eum eos possimus nisi.',621,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(57,'','Occaecati facilis molestiae vel sed est voluptas.','Voluptas modi dolore neque id alias beatae nisi.',6942,'Odio et quia incidunt quo porro qui nesciunt.','Incidunt quia expedita voluptatem nam.',5225161,'Doloremque ducimus ipsa aut.','Eligendi aut labore maxime.',5516899,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(58,'','Culpa labore eaque voluptatem.','Laborum beatae vero quisquam eius sint.',16,'Aliquam sed qui nihil et quo eligendi non.','Cupiditate doloremque qui labore eligendi.',288007860,'Aut ipsum est culpa ut aspernatur.','Quam dolorum omnis est magnam vitae ex quis.',63118273,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(59,'','Est itaque et eveniet.','Animi rerum illo ratione quis adipisci.',3,'Nostrum adipisci deleniti voluptatem aliquid.','Ipsa id veniam et ut consectetur.',32335,'Sunt numquam sed pariatur quo.','Quae nesciunt animi commodi minus sapiente.',98025,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(60,'','Voluptatem fuga sed aut corrupti et officia.','Consequuntur ipsam qui qui eveniet.',27414002,'Earum voluptate amet recusandae non voluptas.','Et ut quod ut.',77145808,'Et aspernatur dolores qui ipsam.','Quia ipsam vitae quae perferendis.',7,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(61,'','Et illum beatae in et sint.','Modi fugiat sunt pariatur voluptas rem quia vel.',655140239,'Itaque numquam minima iste.','Dolorem ea aliquid non doloribus et est.',85490584,'Et fugit ut quia rerum molestiae quibusdam neque.','Quod at dolorem repellendus qui et.',33,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(62,'','Consequatur et delectus expedita.','Repudiandae doloribus perspiciatis animi eum.',47,'Qui unde non alias odit.','Atque voluptas facilis sed aut nihil rem.',159,'Aliquam aut qui fugiat.','Sed molestiae rem voluptas aut dolor autem.',515,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(63,'','In id sit voluptatibus vero.','Laboriosam laboriosam sint nulla sint.',321862877,'Iusto ipsum voluptate est.','Et et rerum iure architecto veritatis.',898,'Consectetur non a architecto neque id.','Qui est qui quasi cupiditate veniam quia ea sed.',57337408,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(64,'','Et dolorum dolore vero eveniet eaque vel quae.','Itaque ut ut eligendi alias possimus quos.',75070975,'Eos et reprehenderit qui ea et veniam nostrum.','Numquam quia et id qui et tempora.',3243314,'Harum vero laboriosam sint quisquam culpa hic.','Sed hic non assumenda alias.',2,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(65,'','Rerum maxime odio in dolorum.','Fugiat debitis quaerat porro illum dolores.',793,'Eos sunt non commodi autem voluptatibus odit.','Et ab aut autem cumque impedit.',183348,'Ex voluptas aut quis voluptatem.','Earum deserunt magnam nihil velit cumque.',7815863,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(66,'','Ratione amet sunt sunt quia inventore blanditiis.','Eum ut placeat praesentium a laudantium officiis.',380720,'Cumque quos aliquam reiciendis omnis deleniti.','Facere doloribus soluta at explicabo delectus.',47700,'Ex labore aut ut quam similique modi facere.','Ea quibusdam ut provident rerum.',376312,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(67,'','Fugit aut et omnis molestiae.','Amet et qui a adipisci.',663,'Vel eius tempore voluptas id.','Quaerat reprehenderit quia quia animi esse.',390242799,'Rerum sit aut sit mollitia quia.','Natus autem cum omnis voluptatem.',9631,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(68,'','Doloribus qui expedita vero labore explicabo est.','Blanditiis sunt et rerum quo reprehenderit.',99614,'Ab laborum voluptatem molestiae sed numquam.','In iste voluptas et dolores voluptas saepe.',211459066,'Et consectetur adipisci non eaque.','Pariatur est autem et ducimus.',119,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(69,'','Nemo voluptates numquam fugit.','Excepturi et explicabo nihil in aut ipsa amet.',3405,'Vel incidunt dicta molestiae.','Laboriosam nisi id placeat est ex.',91394,'Et est aperiam harum sed.','Veniam ut quia minus perferendis autem facere.',4892,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(70,'','Asperiores nemo aut officia soluta maxime.','Sit et quae in quia quaerat suscipit.',21,'Aut molestiae qui quas sed perspiciatis.','Excepturi autem vitae minima et.',3,'Dolor aut impedit doloremque dolores perferendis.','Sed nulla debitis est eius.',9730,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(71,'','Nemo facere consequuntur alias provident.','Vel sint quos impedit similique aliquid ipsa ut.',322490475,'Non minima culpa ea quisquam.','Voluptatibus distinctio magnam debitis.',5485,'Sint non quae est nemo tempore.','Voluptate facere repellendus et voluptatum.',847146,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(72,'','Odit omnis accusantium est occaecati ut eveniet.','Ullam voluptatem velit magnam.',7156,'Consequatur minima nulla est officia fugiat.','Cum voluptas quia minima illo in.',57229,'Eius asperiores suscipit sint eligendi.','Qui veniam tempora et quo in nulla adipisci.',62,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(73,'','Debitis qui dolores vel eius atque.','Provident hic ullam voluptates ratione illum sit.',427,'Ut et et consectetur ullam.','Autem pariatur quia fuga velit dolorem rerum a.',890418,'Aut similique et earum qui ut qui.','Cumque voluptates totam placeat ipsum sit.',298,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(74,'','Aperiam consectetur asperiores est libero.','Occaecati ea quo est ex repudiandae.',17,'Amet hic velit facere occaecati.','Quis sint ea adipisci aut.',61,'Et provident vel voluptas iure ea.','Id eum laudantium ut et rem quo aut.',127295,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(75,'','Soluta numquam quis porro aperiam.','Voluptatibus et quibusdam debitis.',39955,'Voluptas dolores dolorum non dolor.','Et ut exercitationem eum est magni voluptates.',85236,'Non deleniti et sint totam ut aliquam laborum.','Quia hic impedit provident reiciendis.',724,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(76,'','Voluptates nihil maiores consectetur sit.','Nulla corporis laudantium ullam enim sit sed.',4899,'Earum quaerat dolores occaecati.','Id natus et dolores eius rem.',545444485,'Enim corporis tenetur vitae qui.','Cumque distinctio eius voluptas.',485809241,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(77,'','Et facilis blanditiis in aliquam.','Consequatur eveniet qui quibusdam ea.',138392695,'Natus est et non laudantium qui numquam.','Corrupti incidunt est excepturi omnis.',5,'Corrupti qui qui fugiat et ducimus qui quasi.','Velit hic voluptatem et nihil placeat qui.',8690,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(78,'','Accusantium molestias at cum debitis.','Dolores facilis eos rerum aut.',4,'Quisquam atque quia impedit quod occaecati eum.','Dolor ratione ipsum iusto.',490542,'Voluptatem recusandae omnis placeat repellendus.','Et molestias sit cumque eaque et et et.',1433,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(79,'','Harum sequi tempore laborum fuga.','Cupiditate libero suscipit possimus incidunt.',511515465,'Pariatur est voluptas temporibus.','Odio quaerat illum perspiciatis.',38130,'Et unde qui incidunt minima.','Officiis repellat maiores maiores.',764948951,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(80,'','Sunt esse quisquam atque quos.','Dolor suscipit facilis itaque amet in.',0,'Error voluptatem culpa eum consequatur ipsum.','Odit hic rerum ipsa ut qui deserunt nostrum.',1642750,'Ab id omnis aut consequatur.','Optio autem saepe eveniet.',3721,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(81,'','Iste suscipit voluptas et totam.','Atque autem non et dolor error est ad.',5873,'Dolor totam quam neque in reprehenderit.','Molestiae enim repudiandae dolor.',1636917,'Omnis quae aut autem vel.','Vitae corporis necessitatibus labore nostrum.',446859,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(82,'mall_images/iguHuPcwXxPGt7mUUlAfnjBc06JFSFcm3etqrdm2.jpg','Riyal','RIyal',11160,'riyalhasan@yahoo.com','academia lane',6400,'malaysia','kuching',1,'2021-05-22 02:57:43','2021-05-22 02:57:43');
/*!40000 ALTER TABLE `malls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchant`
--

DROP TABLE IF EXISTS `merchant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchant` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MerchantGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MerchantName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrimaryContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SecondaryContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `SSMRegisterNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `BankName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `AccountNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UnitNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `City` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `State` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PostCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchant`
--

LOCK TABLES `merchant` WRITE;
/*!40000 ALTER TABLE `merchant` DISABLE KEYS */;
/*!40000 ALTER TABLE `merchant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `merchants`
--

DROP TABLE IF EXISTS `merchants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `merchants` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ssm_no` int(11) DEFAULT NULL,
  `primary_contact_no` int(11) DEFAULT NULL,
  `secondary_contact_no` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_acc_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `belongs_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activation` int(11) DEFAULT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `merchants`
--

LOCK TABLES `merchants` WRITE;
/*!40000 ALTER TABLE `merchants` DISABLE KEYS */;
INSERT INTO `merchants` VALUES (1,'','Molestiae cum sit eos nam adipisci.',87474,519,75075150,'Et ut libero beatae sit recusandae.','Et vel temporibus quia sapiente quaerat.',32050013,'Quia vel nobis eaque sunt.','Rerum provident vitae enim aut voluptas.','Doloribus ut aut nesciunt expedita aut.','Voluptatem beatae velit nisi cupiditate magnam.','Reprehenderit ea sint quo qui amet quam.','',89,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(2,'','Update Merchant Name',1515445,775617,7756147,'riyalhasan@yahoo.com','Test Address',6100,'kuching','Sarawak','Malaysia','RHB BAnk','15615849','GSM',1,'','2021-05-10 02:45:19','2021-05-22 03:18:49'),(3,'','In doloremque perferendis tempora corrupti enim.',782684799,24,1799,'Magnam mollitia assumenda et.','Sint et animi consequuntur corrupti.',4,'Quisquam eaque eligendi et delectus numquam.','Distinctio doloribus rerum maiores.','Enim magnam voluptas qui.','Inventore odio et rerum itaque qui.','Optio porro quo ipsum ab.','',29111005,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(4,'','Temporibus quas impedit aut nisi qui ut vitae.',57624,4796144,2586,'Delectus quia illo ut non.','Aut nostrum ad dignissimos voluptatem aut.',827,'Temporibus vel unde qui harum optio.','Est omnis molestiae consequatur corporis.','Quasi totam tempore aut eaque.','Atque quia labore cum odio non incidunt soluta.','Unde eveniet vero adipisci aut eos voluptate.','',347079,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(5,'','Quae unde ut ea. Culpa vero dolores sequi.',10265280,12999517,88,'Commodi sequi eum est ea et voluptates nulla.','Voluptas voluptatum aut provident rerum.',338497514,'Rerum voluptatem quia a aliquid non.','Id reprehenderit tempora quos.','Asperiores veniam iusto optio minima.','Sit magnam a qui et mollitia molestiae.','Nihil corrupti eum aut cum a eum ullam tenetur.','',79774945,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(6,'','Repellendus et eum aut fuga numquam.',518293764,7,0,'Veniam voluptas enim quidem.','Nulla non deleniti esse in.',81359,'Non soluta totam assumenda repellat voluptatem.','Totam rerum accusamus adipisci modi.','Dolor labore quo id aut ipsum optio quisquam.','Repellendus sunt rerum recusandae facilis in.','Unde ab ea nulla sed nemo sapiente qui maxime.','',3,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(7,'','Voluptate qui explicabo vel cumque adipisci.',161083760,2344,69902295,'Voluptas eum veniam est aliquid.','Id voluptas earum eos molestiae illo.',1,'Quos quis earum et dolorum.','Illo voluptatem iusto laborum odit sequi vel.','Est ut id voluptatem quia.','Esse sunt vero similique quasi nulla cumque.','Qui esse dolor provident ut.','',8,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(8,'','Alias aut occaecati quo molestias.',46978064,47539557,600709,'Laudantium odio veritatis repellat.','Amet incidunt consequatur ipsum sint nesciunt.',1359425,'Qui necessitatibus beatae et excepturi porro.','Illo illo id ut nostrum.','Sed odit aut quia nihil eos.','Occaecati ea eius aut quia.','Occaecati deleniti quia et quae minima debitis.','',211,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(9,'','Corporis consectetur iste labore.',1,168997612,9,'Sit voluptatibus modi est dolor in fuga.','Facere debitis deleniti saepe.',263,'Et nisi enim dolorem quaerat voluptas ut et.','Dicta et et eveniet deserunt omnis nam quia.','Atque deleniti debitis sed blanditiis et animi.','Veritatis dolor soluta tenetur et cupiditate.','Repellendus voluptate quia quo.','',3,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(10,'','Quasi aliquid nam et voluptatibus.',71881932,7179184,285627,'Atque sunt voluptatem qui explicabo.','Aut tempora fugit eum. Impedit ut molestiae sit.',93548572,'Voluptas ut architecto nihil inventore aut rerum.','Vero animi laudantium ea.','Quia veniam sed qui enim eaque placeat hic et.','Modi dicta aut magni molestiae.','Ipsam et qui qui quia necessitatibus dolorem ut.','',4,'','2021-05-10 02:45:19','2021-05-10 02:45:19'),(11,'','Test Merchant Name',1515445,775617,7756147,'riyalhasan@yahoo.com','Test Address',6100,'kuching','Sarawak','Malaysia','RHB BAnk','15615849','',1,'','2021-05-10 19:44:01','2021-05-10 19:44:01'),(12,'','Aliquam dolore cupiditate voluptatem minus.',3,246714,43618112,'Saepe adipisci amet ut rerum a veritatis alias.','Magnam et dolor est animi iure.',537,'Quia neque ut natus culpa.','Enim architecto ipsam enim sit ad aut.','Nobis error in enim dignissimos.','Dolor voluptatem earum architecto ab ut.','Voluptatum molestias sit quod et mollitia porro.','',880904236,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(13,'','Nisi accusamus voluptatum aut molestias.',747825,83574804,1248,'Et aliquam consequatur et et quibusdam.','Perferendis veritatis quaerat doloremque maxime.',5,'Et enim veritatis aut ullam inventore.','Optio magnam est dolorem modi quae corporis est.','Magnam sunt odio accusantium impedit sed sint.','Aliquam sapiente harum deleniti et.','Quibusdam similique voluptas nihil labore.','',203554989,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(14,'','Earum dicta unde in non voluptatem vel aliquam.',717096336,501078,94,'Voluptatibus possimus laborum maxime ut.','Possimus odio sit animi veniam et et aperiam.',814,'Aut aliquid temporibus reprehenderit.','Et itaque animi qui sit sit magni.','Itaque aut quisquam veniam nemo.','Consequatur ut ducimus eius dolor.','Consectetur officia incidunt omnis.','',22244,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(15,'','Alias ex et maiores dolorem ut.',13,413,8139882,'Explicabo quidem provident dolores.','In et laudantium distinctio.',213,'Iure mollitia assumenda quae sunt.','Qui sint dolor aut qui dignissimos incidunt.','Labore et ea rem natus quis laboriosam assumenda.','Quas sequi officia consectetur ipsum sed ipsam.','Ex rerum et quia labore ut cum laudantium.','',15502,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(16,'','In quia qui vero quia corporis quod autem.',203645214,36787,5,'A eligendi voluptas est doloremque.','Autem numquam ullam alias placeat aut.',894035,'Facilis iusto fugiat ut iste voluptate.','Excepturi distinctio tenetur sit laboriosam.','Doloribus possimus molestiae provident at.','Ad quae nobis qui.','Illum vero quia rem quo.','',3330315,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(17,'','Ut et est quo iure modi.',466550,3783,4,'Qui nam accusantium quia harum autem.','Qui quaerat earum ut voluptas quam dolore.',15,'Ea sit nostrum praesentium.','Sit velit ut praesentium numquam.','Dolore corrupti qui officia sint.','Nihil vel quis quae non.','Rerum quia officiis sit voluptate id.','',6077,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(18,'','Molestias dolorem illum quaerat in.',64541508,20,8845,'Magnam eos veniam et delectus quia sit.','Voluptatem delectus molestias quo.',940508833,'Debitis et officia ad.','Vel ut officia et maiores autem exercitationem.','Officiis repellat nesciunt excepturi ipsam.','Magni aut vel et esse non et impedit.','Et adipisci omnis laborum et.','',469179,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(19,'','Nulla fugit porro omnis harum at sed impedit.',551192,35256,243525521,'Sed minus eum dolores.','Provident quae mollitia commodi aut.',830,'Soluta maxime amet vitae et.','Reprehenderit optio sed quidem id in vel non.','Nostrum incidunt voluptatibus deleniti non.','Neque iste ea vitae optio quaerat.','Dolore quis ab cum atque qui occaecati.','',404,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(20,'','Qui sint enim tempora enim.',25335569,9104,870020,'Reprehenderit enim velit similique sint vero eos.','Commodi et quos quasi omnis.',893369,'Tempore odio minima nobis eius tenetur molestiae.','Aspernatur ut dolorem numquam.','Ea architecto exercitationem nisi consequatur.','Maiores et dolor qui rerum quaerat amet quidem.','Rerum earum et voluptas sapiente quam odit illo.','',29763236,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(21,'','Quo sapiente eligendi dignissimos beatae.',6759801,8,68821,'Eveniet voluptatum perferendis optio.','Nulla rerum rerum accusamus ea vel ut aut.',6358,'Ipsa qui sunt et est aut voluptas sint.','Iste in consectetur quo.','Voluptatem omnis aspernatur quos voluptates.','Quia sunt voluptatum et quibusdam.','Quod rem sed officiis id.','',7878589,'','2021-05-10 20:05:50','2021-05-10 20:05:50'),(22,'','Voluptatem harum quia sed alias aut quo.',8,89241,85668399,'Qui quia saepe sed ut minima laborum.','Modi neque ut dignissimos saepe est consectetur.',86488,'Et porro eos quibusdam ab qui et.','Repellat voluptas expedita perferendis.','Soluta rerum necessitatibus iure ea nulla.','Inventore qui et quia repellat alias iusto iusto.','Reiciendis est sint magnam eveniet suscipit eum.','',5137901,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(23,'','Excepturi aut doloremque minus a occaecati.',8,8093,1296088,'Ut debitis enim omnis officiis et ab.','Quis labore molestiae omnis nemo veniam.',511091498,'Vel explicabo quos eius quia dolore ipsum minima.','Sit cupiditate et corrupti vel necessitatibus.','Ut nam ex et labore est in dolorum.','Aut temporibus fugiat et error.','Quo at nisi optio cum aperiam vitae.','',501413,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(24,'','Iure aliquam quis quis qui impedit repellendus.',53356458,475908,166443,'Earum nulla repellendus consequuntur sit.','Dolore vero nihil at accusantium ab et.',82812,'Sit nesciunt voluptate ipsum aut doloremque.','Placeat voluptatem et qui aliquam.','Voluptatem reiciendis quia sunt autem et.','Error est ea perferendis similique qui expedita.','Qui illum corporis neque id quis.','',2486,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(25,'','Vel aspernatur earum iusto ea natus.',98,737,77257,'Sint et molestiae quis perferendis harum.','Quia ea deserunt iusto voluptas dolores aperiam.',30,'Magnam quaerat sint adipisci.','Placeat quas expedita quis vero aut quam.','Sunt et sit voluptatem blanditiis laboriosam non.','Dolor et hic voluptate hic ex commodi.','Et aliquam quis aliquid voluptatibus.','',326020466,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(26,'','Laudantium aut beatae similique eaque.',80625,33381,10335182,'Et voluptatem et sit quis dicta nemo rerum est.','Maiores eos quis et exercitationem.',56,'Odio non et fugit. Totam et est id molestias.','Quibusdam commodi possimus in fugit.','Impedit ut quis minima et.','Fugit ea consequuntur repellendus temporibus.','Labore quidem ducimus qui nihil.','',7238247,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(27,'','Rerum ratione et placeat distinctio.',7850,4675,826974,'Hic vitae in sequi deserunt ex.','Mollitia quam omnis at sunt quo tempora sint est.',585958,'Accusamus numquam cumque ipsa explicabo.','Optio maiores possimus totam qui.','Saepe eum praesentium provident quis temporibus.','Quas eligendi enim eum ducimus.','Nulla veritatis accusantium fuga.','',756938801,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(28,'','Libero est qui nisi.',25,8,85105,'Fuga neque quo autem.','Autem reprehenderit aliquid maxime.',182,'Mollitia placeat eum porro quos perspiciatis.','Sed est iure cum optio in eos.','Deserunt adipisci sapiente eveniet.','Architecto et numquam est id sint dignissimos.','Ipsa nihil quia reprehenderit voluptatem quia.','',55436019,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(29,'','Voluptates qui repellat optio fugiat.',8,36243330,919287774,'Repellat dolorem dolorum sequi sunt.','Ullam dolor incidunt sit hic laudantium dolor.',2,'Doloremque debitis nostrum quis et voluptatum.','Distinctio tempore atque recusandae placeat.','Aliquam suscipit numquam aliquid sed unde non in.','Rem sunt provident enim magnam.','Totam et vel architecto corporis a qui.','',5320,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(30,'','Facere earum et quo quos.',1,889165,886087,'Adipisci et iusto et qui et sint.','Ut placeat veniam voluptatem in.',88183,'Voluptas iure sed et.','Deleniti molestiae ut ipsa alias vel.','Vel error et et ipsum.','Aut numquam aliquid aspernatur non neque ut.','Vel recusandae sit aut voluptatem deleniti ut.','',8441805,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(31,'','Minima et rerum quasi.',873945190,475,598153272,'Vitae numquam facilis est doloremque nemo.','Ducimus adipisci ipsam et quisquam.',12668,'Minus repellat neque praesentium sequi dolorem.','Qui ea alias et quia voluptatem voluptatem.','Et nobis dolore facilis architecto.','Eveniet quam animi enim ratione.','Distinctio aliquam qui doloremque.','',956675,'','2021-05-10 23:59:19','2021-05-10 23:59:19'),(32,'','Unde vero consequatur optio.',758,2431,278910376,'Omnis quo ut doloremque aliquam et.','Ut rerum quis quam qui.',94630,'Aut necessitatibus quia eveniet ea.','Earum ut laboriosam veniam porro vel eos vel.','Labore amet aut molestias est et et ducimus.','Vitae autem modi autem id.','Debitis eligendi rerum aut delectus ut saepe.','',4,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(33,'','Qui iste eveniet officiis distinctio aliquid ut.',25145,94496,91820496,'Eos odio sit modi et aliquid.','Non at sed impedit labore minima eum nobis.',35548,'Hic quia nesciunt libero laboriosam velit quidem.','Veritatis exercitationem omnis non a rerum.','Fuga odit et velit similique.','Aut consequatur a culpa atque.','Incidunt veniam porro quae molestiae ab.','',1,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(34,'','Et labore et iusto quam excepturi reiciendis ea.',777421869,9127638,7,'Velit id et et accusamus aut aut.','In qui ullam qui vel enim nulla.',63,'Aut suscipit aut id necessitatibus praesentium.','Sapiente voluptate magni culpa ea eos eum.','Itaque voluptas voluptas minima ut dolores qui.','Consequatur unde dignissimos quia eos.','Aut cumque quam voluptas assumenda et cupiditate.','',934851050,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(35,'','Beatae autem nulla minima culpa rerum.',5692,5615,637334,'Molestias cum et eum qui autem.','Tempore placeat repellat deserunt assumenda.',3063,'Aut occaecati illum est et quibusdam.','Ducimus architecto et ratione ut sit atque hic.','Nihil quia ut eos optio.','Sit architecto hic veniam dicta aut.','Est optio temporibus quasi.','',615,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(36,'','Aut maxime nobis cupiditate vero id.',790924,27246093,8983147,'Accusantium iure tempore culpa est ea vel.','Debitis perspiciatis quis est dolor.',3565853,'Illo quia aut est architecto est rerum.','Qui saepe est in maxime.','Aspernatur est ut exercitationem fuga.','Commodi incidunt nisi quod recusandae.','Quo veniam et id eum. Ea provident non quod aut.','',321,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(37,'','Deserunt reprehenderit sit et illo.',65336456,81,718902085,'Facere at voluptatem necessitatibus nihil.','Sit ut nulla assumenda sapiente blanditiis eum.',91748,'Rerum nulla quibusdam aperiam ab.','Quia corporis enim quisquam quis.','Sunt officiis totam voluptas corporis ut.','Minus totam unde eius et animi et.','Amet ad fugiat error id voluptatum.','',829,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(38,'','Dolor fugiat asperiores est ut nulla maxime ipsa.',821958,388,19893,'Libero et ipsum soluta deleniti ab.','Eaque rerum repellendus enim omnis quia aut ea.',9491,'Sunt distinctio nihil consequatur harum.','Et explicabo voluptatum autem eveniet.','Fugiat iure dolorem id vero.','Qui est id voluptas qui.','Et aut dolores est mollitia.','',7892309,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(39,'','Unde ex maiores veniam rem omnis eius.',79154321,389,4180873,'Voluptas ipsum hic et ut aliquam quis velit.','Laudantium omnis sed saepe quis autem cumque.',81129428,'Quia commodi repudiandae incidunt voluptas.','Veritatis aliquid facilis doloremque quo qui.','Quia porro omnis nihil et impedit.','Tempora laudantium voluptatem et enim.','Accusantium dolore ipsum ducimus commodi.','',673,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(40,'','Libero eos et et libero mollitia non a.',53866,3457643,5922,'Amet est et voluptatem neque.','Sunt sit ut amet totam nihil vel aut est.',677674,'Nobis enim nisi veniam ut cum nulla.','Sit nesciunt accusamus nesciunt et et.','Fugiat eaque officiis quis.','Rerum esse magni vel nisi natus doloribus.','Exercitationem ullam numquam voluptatem eligendi.','',1803,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(41,'','Illo quia iure quisquam harum natus iure.',39839,29829697,699502,'Dolorem voluptas in explicabo minus.','Sit eum rerum alias blanditiis autem unde.',25360,'Officia maiores dolore aut minima.','Neque magni eveniet qui.','Ab optio velit repudiandae.','Assumenda ut ea illum sed ea occaecati.','Totam praesentium tempore ratione ut nemo qui.','',602,'','2021-05-11 00:00:06','2021-05-11 00:00:06'),(42,'','In quia animi fugit et.',284674126,26166197,18,'Iste error amet veritatis officiis sapiente.','Aliquid nobis velit molestiae non.',41,'Deserunt quo dolorem et eos a ut.','Animi adipisci ratione qui quis id.','Consequuntur ipsum rerum dolores est eos.','Eaque incidunt hic aspernatur vel molestiae esse.','Vitae molestiae dolores rem modi.','',3,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(43,'','Voluptas dicta consectetur hic aut.',556989771,7648902,45196,'Omnis nulla suscipit nobis ut vel.','Ut perferendis id nihil quis molestiae aut.',1008,'Corrupti iusto ut ducimus.','Nam non excepturi earum iusto alias velit.','Reiciendis omnis asperiores expedita eveniet qui.','Illum praesentium nostrum voluptate quo.','Harum quae dolor animi deserunt qui.','',25170425,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(44,'','Nemo est velit et qui maiores illum in.',93963,7274661,14634425,'Autem ducimus corrupti aut suscipit ea voluptas.','Recusandae deserunt et eaque reiciendis et.',3604,'Similique vel sunt sit.','Optio non eveniet ea qui ipsum.','Corporis sit ut excepturi quasi voluptate qui.','Et ea quo vitae voluptas eaque quis odit.','Qui enim quae vel tempora.','',96462462,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(45,'','Cum id sit vero magnam delectus.',212645,393684,2484,'Iusto magnam nulla ut ratione.','Debitis sit ipsum ut facilis suscipit.',82336358,'Et ratione et dolore cumque in. Et ut et quasi.','Aliquid quo eos esse possimus.','Earum sed quasi quia eos harum vel odio quia.','Accusamus accusamus itaque aperiam quis.','Optio dolore qui quibusdam soluta et.','',93546,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(46,'','Similique fuga accusantium molestiae in.',996,8230,2,'In saepe qui ut saepe ut incidunt qui.','Sit eum hic aut quos temporibus sapiente.',84,'Sit dolor illo adipisci et deserunt.','Minima et cupiditate fugit praesentium.','Et cum amet distinctio laborum est.','Quia ipsa et laborum quis.','Reiciendis impedit tenetur et sed itaque cum.','',474655,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(47,'','Quaerat repellat placeat explicabo enim.',599147551,12900,2238847,'Architecto quis quia rem repellat quod repellat.','Ut consequatur dolores aut ut ex.',95227604,'Laborum inventore culpa adipisci quasi et.','Laudantium dignissimos et aut soluta dolores non.','Qui optio repellendus saepe quis ex officiis.','Ipsa quia ea sed. Est quia ea ea rerum.','Molestias sapiente aut assumenda ex consectetur.','',71,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(48,'','Sed consequatur quam recusandae.',194695112,61641,2009953,'Eos repellendus iste culpa.','Ea voluptatem ipsam quasi.',36045951,'Id recusandae ut et hic.','Est repellendus dolorem neque qui.','Consectetur qui autem porro velit.','Nostrum nam quisquam soluta magni beatae.','Id inventore reprehenderit et.','',753,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(49,'','Hic quas qui officia harum explicabo.',300146136,76,69152,'Inventore quis eligendi laboriosam expedita.','Est nihil dolorum nesciunt.',67760729,'Qui quo ut aut quia. Aut ut et est vero.','Ut nemo magnam repellendus in eaque odit tenetur.','Amet optio aut doloribus eos debitis.','Et aut officiis nesciunt.','Natus eos nihil incidunt voluptatibus sint et et.','',7,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(50,'','Autem quis illo magni.',51875,2058,5,'Qui molestias molestiae adipisci.','Cum eligendi voluptatem voluptas ullam ipsa.',50578182,'Quos repellat hic dolor debitis.','Quos vel non voluptates consequatur.','Doloremque quaerat nam totam odit.','Architecto adipisci placeat aliquam corrupti.','Ab culpa minus provident nihil iure sit.','',814923,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(51,'','Consequuntur omnis id temporibus non omnis.',549576026,18382,5834,'Non exercitationem enim minima accusantium autem.','Soluta iure sequi mollitia.',33,'Id quibusdam ex optio corrupti.','Ullam eveniet minima minima amet.','Dolor labore aperiam dolor dolorem quia.','Fuga omnis in dolorem voluptatem odit quo quod.','Quasi quae iste incidunt.','',687080,'','2021-05-11 00:54:58','2021-05-11 00:54:58'),(52,'','Itaque molestiae labore laborum accusantium.',78814069,86493,260478162,'Voluptas voluptates quia voluptatem aspernatur.','Nihil aut adipisci ipsum accusamus.',4780,'Consequatur enim doloribus quia.','Occaecati eligendi sed molestiae iste.','Dolor quas distinctio vel quo.','Laudantium doloribus est quia minima.','Dolorem quisquam maxime dolor ea sapiente labore.','',6871237,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(53,'','Laudantium natus quae veniam necessitatibus.',27242016,274586,7066178,'Recusandae rerum repellendus animi.','Ut sed ut provident iure esse.',1323829,'Deleniti nesciunt ipsum dolorum eos.','Et et doloremque adipisci voluptates eveniet.','Rerum et odio ut deserunt sit consectetur ipsum.','Nobis nam ratione voluptatem.','Voluptate modi voluptatibus qui expedita tempora.','',63,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(54,'','Ut dolorem est nemo laudantium.',786,266,887127744,'Tempore et ea totam odit veniam eius laudantium.','Non esse amet consequatur labore.',70480741,'Similique omnis sit maxime laborum aspernatur.','Natus est esse qui fugiat est corrupti.','Et cum saepe velit quibusdam.','Ut quas sed itaque consequuntur.','Beatae sed fugiat est.','',76,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(55,'','Nulla minima ducimus repellendus magni tempore.',14291266,12471342,75254498,'Tempora commodi ab culpa voluptas non omnis.','Ut velit aperiam est reiciendis totam quasi.',12730470,'Aspernatur aut saepe itaque itaque quo.','Sapiente ducimus laborum rerum recusandae.','Temporibus vel architecto aut architecto eos.','Beatae eveniet vitae rem et iusto tempora veniam.','Et molestiae ut autem corporis itaque ut non.','',71,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(56,'','Ea aliquid non nesciunt et.',221440568,489187329,3843232,'Sit enim at aut.','Qui itaque aliquam excepturi quibusdam.',77063,'Ad eos voluptates ducimus alias soluta.','Est ut sint dolores nesciunt deserunt sint.','Exercitationem et voluptatem dolor id iusto.','Sunt deleniti laudantium est ipsa.','Officia minima harum voluptas nobis sit eos.','',119032258,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(57,'','Vel tempora ipsa modi amet et consequatur.',70402,356,24980,'Quod quo aut velit magnam quas qui laudantium.','Qui voluptas et ut omnis.',178950,'Dolor similique non quos non dolore et facere.','Et libero quo amet amet eius molestiae.','Ut velit consequatur dolorem rerum dolorem.','Consequuntur maxime nesciunt labore nesciunt.','Ratione earum reiciendis ut incidunt.','',40,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(58,'','Dolore cumque molestiae aut ipsam eum id.',373,13561225,3304828,'Aut a fuga laudantium cum aliquam corrupti nam.','Fuga recusandae et optio beatae.',21214228,'In nihil rem numquam molestiae et porro officiis.','Dolorem est repellendus aut.','Tempore rerum ex rerum quisquam accusamus.','Est sequi explicabo esse nostrum.','Non nam optio et repudiandae ut omnis velit.','',2533166,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(59,'','Voluptate ipsam sed sit occaecati.',9337828,543,33535,'Sunt temporibus dolorem voluptatum non maxime.','Eum consequuntur nihil architecto.',498062558,'Magni at molestiae ut dolor.','Saepe ducimus ipsum laborum sed et.','Reiciendis eaque a id laboriosam sit aut commodi.','Fugit modi dolor aperiam ratione.','Numquam quae et atque nostrum atque.','',10649083,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(60,'','Velit laboriosam qui nulla non eum aut.',9822,28937068,448079,'Consequuntur numquam esse rerum.','Eum dolorem quia quasi facere dolore ut non nam.',24270,'Occaecati aut molestiae quia est.','Exercitationem labore id ea cumque.','Harum eligendi dolores qui at quaerat eveniet.','Sapiente ut minus eveniet.','Laboriosam consequatur illum quo ipsa quas.','',80799,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(61,'','Labore eum optio est ut.',0,9622797,8557887,'Quod similique quae maiores.','Vero et sit qui consectetur est maiores enim.',697744,'Possimus sunt vitae minima vel ipsum error eum.','Quia voluptates commodi minus.','Doloremque maiores minima quia.','Ipsam repellat quia qui aut voluptatem aut sunt.','Asperiores et beatae qui.','',2846928,'','2021-05-21 22:04:53','2021-05-21 22:04:53'),(62,'merchant_images/LQmANeWvQn2UIDD5p3YBGzkEYjNFzcpizIA2MBF3.jpg','Riyal',222,21133213,1221,'riyalhasan@yahoo.com','academia lane',61444,'kuching','sarawak','malaysia','RHB','11255484332326','1',1,'','2021-05-22 03:18:04','2021-05-22 03:18:04'),(66,NULL,'asd',123,1234,1234,'rahid1@example.com','asfadfaf',1233,'asdf','asdf','asdf','asdf','1234','asfasf',12312,'$2y$10$6vKE9ra1XH9J2MNkkvzAaehPJmSRllVOffO.77IpkS9puLmc4YbMm','2021-05-25 21:21:08','2021-05-25 21:21:08'),(67,NULL,'asdf',13123,123123123,123213,'asd@example.com','sdfsdaf',13123,'dsfasdf','asdfafd','asdf','asdf','1234','adsf',123,'$2y$10$5Mj6NX11ZnWvgOLQUiZlbOXysjAVxmihGV4Iufwzo.4Meek61QYAm','2021-05-26 02:37:05','2021-05-26 02:37:05');
/*!40000 ALTER TABLE `merchants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `chat_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (25,'1',2,'asd',NULL,'2021-04-27 22:06:33','2021-04-27 22:06:33'),(57,'2',3,'Hi',NULL,'2021-04-28 21:58:19','2021-04-28 21:58:19'),(58,'2',3,'Hi',NULL,'2021-04-28 21:58:44','2021-04-28 21:58:44'),(59,'7',3,'hi',NULL,'2021-04-28 23:10:26','2021-04-28 23:10:26'),(62,'2',1,'Hi Rahid',NULL,'2021-05-07 20:24:46','2021-05-07 20:24:46'),(63,'2',1,'ads',NULL,'2021-05-07 20:29:25','2021-05-07 20:29:25'),(64,'10',7,'Hi',NULL,'2021-05-10 07:05:01','2021-05-10 07:05:01'),(65,'10',7,'hi',NULL,'2021-05-10 07:07:15','2021-05-10 07:07:15'),(66,'10',7,'fi',NULL,'2021-05-10 07:07:57','2021-05-10 07:07:57'),(67,'10',7,'Testing',NULL,'2021-05-10 07:09:14','2021-05-10 07:09:14'),(76,'1',2,'Hi',NULL,'2021-05-11 06:28:21','2021-05-11 06:28:21'),(77,'1',2,'Hi',NULL,'2021-05-11 06:28:48','2021-05-11 06:28:48'),(78,'1',1,'asd',NULL,'2021-05-11 06:28:53','2021-05-11 06:28:53'),(79,'1',2,'hi',NULL,'2021-05-11 06:30:10','2021-05-11 06:30:10'),(80,'2',1,'Hi',NULL,'2021-05-18 02:46:54','2021-05-18 02:46:54'),(81,'2',1,'df',NULL,'2021-05-18 02:50:08','2021-05-18 02:50:08'),(82,'2',1,'wq',NULL,'2021-05-18 02:52:42','2021-05-18 02:52:42'),(83,'14',63,'fu',63,'2021-05-25 09:06:56','2021-05-25 09:06:56'),(84,'18',66,'Hi',66,'2021-05-25 21:43:22','2021-05-25 21:43:22'),(85,'7',3,'Hi Kalina',NULL,'2021-05-26 05:54:47','2021-05-26 05:54:47'),(86,'7',2,'Hi Rahid',NULL,'2021-05-26 05:54:59','2021-05-26 05:54:59');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0000_00_00_000000_create_websockets_statistics_entries_table',1),(3,'2014_10_12_100000_create_password_resets_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2021_04_27_151337_create_messages_table',2),(6,'2021_04_27_151424_create_conversations_table',2),(7,'2021_05_04_053638_create_groups_table',3),(8,'2021_05_04_053720_create_group_chats_table',3),(9,'2021_05_04_053832_create_group_users_table',3),(10,'2021_05_09_132523_create_merchants_table',4),(11,'2021_05_10_055007_create_merchants_table',5),(12,'2021_05_10_055729_create_merchant_conversations_table',5),(13,'2021_05_10_055743_create_merchant_messages_table',5),(14,'2021_05_10_074218_create_friends_table',6),(15,'2021_05_12_165611_create_video_confiqs_table',7),(16,'2014_10_12_000000_create_users_table',8);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_shops`
--

DROP TABLE IF EXISTS `new_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_shops` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `mall` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_identity` int(11) NOT NULL,
  `free_shipping_min_amount` int(11) NOT NULL,
  `free_shipping_for_all` int(11) NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_shops`
--

LOCK TABLES `new_shops` WRITE;
/*!40000 ALTER TABLE `new_shops` DISABLE KEYS */;
INSERT INTO `new_shops` VALUES (1,'','Update New Shop',12,12,12,12,22,'Rajshahi-1',11,200,200,1,'2021-05-11 00:00:06','2021-05-22 03:49:14'),(2,'','Sit eaque aliquid accusantium eos ipsa quam.',222492,2230,96147,64,263,'Commodi dolorem eius aliquam ex ipsum non.',3456,206246375,862,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(3,'','Eos ab et exercitationem ullam.',751,10393449,65,5648,7,'Qui est corrupti exercitationem omnis nemo totam.',29687982,871,0,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(4,'','Consequuntur nihil placeat ipsa sint.',30,88642657,9594382,724272,3,'Voluptatem corrupti rerum ea.',5,3081815,337,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(5,'','Quasi omnis optio quia rem enim harum.',893664611,37,3700,5327817,12598,'Quas non sunt esse.',2194,47,6366,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(6,'','Quis voluptatum dolorem debitis enim magnam.',69663055,785,487794,2339286,519,'Architecto dolores officia eveniet ut.',9,31415402,79594,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(7,'','Fugiat incidunt ipsam consequatur corporis aut.',45962,371269,609,8115,628065702,'Ad et aut vel est dolore.',69299,941933,2384,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(8,'','Nisi illo qui ipsa.',971,36906,819562468,1030,95,'Animi vel aut quia quae minus adipisci.',115340,449040372,252,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(9,'','Velit consequuntur placeat cumque minus.',245,1409678,9,41804,0,'Tenetur architecto sit qui non vel.',54348,220,60220,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(10,'','Omnis est minima expedita eos repellat vel.',192456,40,26371,4,379542,'Velit fugiat magni aliquid ut molestiae.',4063,1,8063501,0,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(11,'','Create New Shop',1,1,1,1,2,'Rajshahi',1,100,100,0,'2021-05-11 00:16:09','2021-05-11 00:16:09'),(12,'','Ducimus omnis quaerat sequi exercitationem.',0,3838083,56121846,2550,9,'Ullam reiciendis quas quae voluptatum animi.',59,2736,264489,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(13,'','Sed hic est quis odio autem eos ex.',820805,7,78054,53138283,37171,'Sunt error inventore totam rerum rem explicabo.',976,5,115093481,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(14,'','Minima voluptatum vel minus aut ipsa modi.',9,9591790,763373691,3262908,12172238,'Cum sit tempore et eos et enim unde.',99044,275,648,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(15,'','Ut eum expedita quia.',512532,822550457,793172438,934409,13,'Voluptatem distinctio aut molestiae nemo.',8901584,9676829,67490,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(16,'','Modi earum delectus itaque aut.',6727,535571,6880754,436,7,'Non cum ad illum natus.',61,230,455620143,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(17,'','Dolore et fuga voluptates enim.',92364248,2845215,224,672158,139361,'Numquam rerum quasi distinctio quos perferendis.',2744343,96272,8,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(18,'','Enim dolor eaque a vitae dolore aspernatur.',54943,1608680,137632458,894430920,140,'Suscipit deserunt sed exercitationem est.',4,596251983,1,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(19,'','Atque et eius quidem corrupti et.',210,49475,6895762,751895,62899852,'Rerum voluptas veniam natus ut.',9,7667,962,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(20,'','Quis voluptatem in fuga est odit.',5,599963,7995794,66225,55972629,'Sed fugiat quam dolores.',8,514164,0,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(21,'','Voluptatem est cupiditate dolor libero ut.',0,924121265,15343,64317,5287649,'Cupiditate sed odit aut consequatur natus.',12828,86,6,0,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(22,'','Incidunt officia ut ut ut.',8420080,81,92,45,208162606,'Id impedit rem debitis autem cupiditate.',110900,907200,24884309,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(23,'','Est aut est dolorum numquam eos.',90,9553850,92496905,640054997,13921122,'Assumenda reprehenderit quae ut unde.',5193901,1341802,0,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(24,'','Ducimus sunt et nihil unde quo et aut.',4,205068343,829,72279,786023,'Aspernatur numquam voluptates vero a quasi ullam.',7168766,85031,5272295,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(25,'','Repellat eos veniam est sed quae qui.',46,7036888,9619128,85,1,'Illo dolorum quaerat quis ducimus iste.',318951991,94019,52921,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(26,'','Optio quas temporibus non ut.',1074,702041285,99956392,27975303,26,'Alias quasi voluptatem quia repudiandae officiis.',1,553,6246,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(27,'','Corporis ea rerum omnis repellat rem.',48,585970,61,87,221556,'Nesciunt veniam ducimus voluptas consequatur.',95592,38629778,90895,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(28,'','Illum cupiditate fugiat nostrum ea.',25526346,392,17954101,129445856,9016659,'Tempora dolor sit ut non consequatur earum.',797940,547829,63,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(29,'','Fugiat earum corporis eos vel sed vitae.',277292141,46332,3,527189647,662059,'Minus labore ut doloribus et.',54,52610,364996,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(30,'','Voluptas at illum et officiis minima perferendis.',8,2127,87993595,268016,2,'Aut quisquam aut magni doloremque nostrum.',2,8,9,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(31,'','Nemo nobis porro ut rem quas soluta eum est.',7,37,42,6354274,165,'Impedit deserunt explicabo rerum sit.',918,92,76,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(32,'new_shop_images/a2V0o0xkDRDoTcRWAQp2lxOmULKccJLg3YpVoPIB.jpg','uniqlo',1,1,1,1,1,'rajshai',2,12,1,1,'2021-05-22 03:48:45','2021-05-22 03:48:45');
/*!40000 ALTER TABLE `new_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShippingCost` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `DeliveryDate` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ShippingAddress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerPrimaryContact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CustomerEmail` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_return`
--

DROP TABLE IF EXISTS `order_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_return` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `OrderGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reason` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_return`
--

LOCK TABLES `order_return` WRITE;
/*!40000 ALTER TABLE `order_return` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_malls`
--

DROP TABLE IF EXISTS `other_malls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_malls` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shop_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `merchant` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `floor` int(11) NOT NULL,
  `mall` int(11) NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selling_identity` int(11) NOT NULL,
  `free_shipping_min_amount` int(11) NOT NULL,
  `free_shipping_for_all` int(11) NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_malls`
--

LOCK TABLES `other_malls` WRITE;
/*!40000 ALTER TABLE `other_malls` DISABLE KEYS */;
INSERT INTO `other_malls` VALUES (1,'','Update shop Name',1,1,1,1,2,'Rajshahi',1,100,100,0,'2021-05-21 22:04:53','2021-05-22 04:19:13'),(2,'','Similique ipsa adipisci rerum omnis voluptatem.',70512830,360462,19255,841,4404682,'Vero hic voluptates soluta.',4366,44617287,9502,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(3,'','Numquam est tempora error odio saepe beatae.',33393349,29,769027061,4116840,3,'Quia eligendi totam assumenda.',53525,92002061,106529889,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(4,'','Repudiandae deserunt fuga laborum fugiat.',488589837,10586,587412,68,25862,'Alias eius unde ea eum qui.',8328792,15680480,61247,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(5,'','Eius officia non similique sapiente.',997,70446,74026465,245460004,7,'Dolor quasi doloribus qui non.',3,23300943,4,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(6,'','Exercitationem dolores et et.',19,8520,14751,9469533,37775,'Ut sunt et a nihil nostrum.',70035,6,78689010,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(7,'','Rerum voluptas sed earum.',443035,9,95,25166,875476,'Ut rerum iste aut harum ut quis quidem molestias.',774,6351,34471946,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(8,'','Quia consequatur qui quaerat molestiae enim.',8,3956300,0,4,578,'Perferendis rem cumque alias doloremque.',873030,48,37956649,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(9,'','Corporis occaecati quia maiores cumque rem.',66141974,37212944,7460696,40063123,14966621,'Et omnis aspernatur eos exercitationem.',396,522857075,77106770,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(10,'','Voluptatem mollitia ea itaque sint nulla.',809597,6988287,94894969,80,718794,'Quasi dolores dicta libero aut voluptas.',628675,0,379,0,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(11,'other_mall/ge3HApBGrlTFcwP6eeChKiqAN31PujqUkGOA4tw7.jpg','Riyal',1,1,1,1,1,'1',1,1,1,1,'2021-05-22 04:18:56','2021-05-22 04:18:56');
/*!40000 ALTER TABLE `other_malls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) unsigned NOT NULL,
  `GUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CategoryGUID` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ProductTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Activation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int(11) NOT NULL,
  `activation` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'','Update Product Name',2,2,'2021-05-09 21:59:22','2021-05-09 22:52:10'),(2,'','Vel architecto magnam quas ipsum magni ut.',15045,181,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(3,'','Doloribus ut alias quo assumenda molestias.',1820990,8,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(4,'','Eos temporibus dignissimos quibusdam voluptas.',781,3,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(5,'','Id repudiandae nesciunt sunt accusamus eos nihil.',3,8281,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(6,'','Dolor et voluptatem et dolorem.',864681333,35286906,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(7,'','Sint molestias similique et amet.',91,493,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(8,'','Sit repellat et sit unde ea.',95908,94457320,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(9,'','Et sequi voluptates sunt.',2097977,427285392,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(10,'','Deleniti cupiditate et qui architecto.',4402,87,'2021-05-09 21:59:22','2021-05-09 21:59:22'),(11,'','Test Product Name',1,1,'2021-05-09 22:11:10','2021-05-09 22:11:10'),(12,'','Ut fugit unde similique explicabo dolores.',253332,9708,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(13,'','Distinctio sunt eius at quo nihil ut.',792,254,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(14,'','Nam est ut eaque id facilis pariatur quidem.',9744041,6,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(15,'','Voluptatibus consequatur est ratione inventore.',80732128,911302726,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(16,'','Laudantium velit quia aut porro.',993787,2816924,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(17,'','Nisi porro vel consequuntur beatae deserunt.',59141,7002970,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(18,'','Consequatur eum et omnis officiis rem.',641,588,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(19,'','Porro velit quo quia sint eveniet.',39,9857899,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(20,'','Aperiam consequatur voluptatibus et nobis ad.',8,93,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(21,'','Sed est maiores itaque laborum doloribus hic aut.',62053182,42,'2021-05-09 22:28:45','2021-05-09 22:28:45'),(22,'','Blanditiis non quis numquam hic est maxime.',786328,895,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(23,'','Et esse maxime fuga impedit similique.',8780160,63518494,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(24,'','Facilis iste id magni vel ut adipisci et ipsum.',6321,71,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(25,'','Sapiente nihil aspernatur facilis.',67,24120135,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(26,'','Quo aut vel voluptas ut cumque ut.',852,7,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(27,'','Illo ullam quis ipsam harum quis quam et.',466,71269013,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(28,'','Commodi ad id tenetur voluptatem.',4345,475209988,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(29,'','Sit quisquam expedita pariatur laudantium.',99219052,32128,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(30,'','Est hic aut voluptatum quas.',0,3072272,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(31,'','Sed enim quia corporis ut.',80090238,2,'2021-05-09 22:29:11','2021-05-09 22:29:11'),(32,'','Fugit excepturi veritatis mollitia aut.',4407940,324578,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(33,'','Error itaque in suscipit voluptates inventore.',5995501,57638403,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(34,'','At aut porro in.',9134,188422020,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(35,'','Velit voluptatem deserunt unde.',6,788672,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(36,'','Pariatur et est adipisci.',4484,3725206,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(37,'','Doloremque rerum nam odit nobis.',928,176740,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(38,'','Nihil velit eaque earum eius enim qui.',1810978,4,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(39,'','Ut aut esse eos non molestiae et.',62930,3143283,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(40,'','Nobis culpa dolore sunt.',7114203,7932690,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(41,'','Vel ipsam rem est quas nam in tempora corporis.',152,34298,'2021-05-09 22:29:35','2021-05-09 22:29:35'),(42,'','Officia officia reprehenderit sit voluptas quos.',25982720,839798,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(43,'','Aut sunt aut sint eos quibusdam optio vel sunt.',846035438,6569,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(44,'','Ab hic maxime amet quos praesentium sit.',2,934,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(45,'','Est quaerat velit sed animi illum est.',14947454,5,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(46,'','Et ut quidem autem commodi.',2,568,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(47,'','Magnam quo ut libero sunt vero ut culpa.',91,4201675,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(48,'','A laboriosam et aliquid necessitatibus.',22246,378,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(49,'','Distinctio eveniet suscipit tenetur quos ab.',307829,5,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(50,'','Accusamus dignissimos autem et ut.',9,6562736,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(51,'','Dolorem eaque doloribus quia.',98759,7807,'2021-05-10 00:24:07','2021-05-10 00:24:07'),(52,'','Aut qui quaerat nisi unde repudiandae iusto.',9028109,78,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(53,'','Porro vero facere iusto dolore.',4017029,965,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(54,'','Harum nihil quia laboriosam pariatur maxime.',183232763,68630,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(55,'','Nemo fugiat eveniet aut.',8458132,8,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(56,'','Modi rerum eligendi quia doloremque et aut.',486616266,2,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(57,'','Aspernatur enim eos dolorum quisquam.',280,92568745,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(58,'','Dolorem exercitationem doloribus saepe.',207941,3108517,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(59,'','Quos deleniti temporibus quibusdam autem sunt in.',6,9,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(60,'','Eos voluptas voluptas voluptatibus voluptatem.',5902117,526986,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(61,'','Consequatur voluptate dolorum voluptas et id.',98254972,1101,'2021-05-10 02:05:32','2021-05-10 02:05:32'),(62,'','Officia voluptatem ratione qui iusto repellat.',650172514,1277994,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(63,'','Dolorem ratione ullam qui delectus suscipit.',133684240,3,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(64,'','Quod a ab est vel corporis nihil molestias.',8820547,2,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(65,'','Provident reprehenderit adipisci quisquam est.',5304129,331729829,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(66,'','Praesentium molestiae sed amet porro consectetur.',17359897,174486,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(67,'','Ipsa est cum debitis qui possimus eos earum.',281,97,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(68,'','Sit odit corporis quas et.',68766,198371226,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(69,'','Omnis qui tempora qui.',844,2177715,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(70,'','Perspiciatis eaque tempora nobis dolorum.',32848881,630,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(71,'','Ut assumenda blanditiis nulla incidunt pariatur.',72,2,'2021-05-10 02:44:35','2021-05-10 02:44:35'),(72,'','Similique aut vel alias autem optio quo unde.',4971637,18943,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(73,'','Qui nihil nobis velit.',41,4197958,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(74,'','Laudantium beatae et eaque.',69,5,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(75,'','Ab natus voluptatem ullam eum error.',929434,179,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(76,'','Velit voluptate temporibus eum.',91309,43592942,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(77,'','Omnis aspernatur ipsam laudantium.',420003,9135042,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(78,'','Modi praesentium culpa vel ducimus provident.',654440,4834668,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(79,'','Dolor eos aliquam eos est ea architecto est.',6095134,522348,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(80,'','Tenetur voluptate perspiciatis rerum minus iure.',565076032,693,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(81,'','Totam numquam et ad quis laboriosam optio facere.',4,118,'2021-05-10 02:45:19','2021-05-10 02:45:19'),(82,'','Vitae iste veritatis consequatur molestiae ullam.',4237,328,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(83,'','Nihil consequuntur ea ut tempora.',55348948,30337172,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(84,'','Esse modi quia eos voluptatem exercitationem ut.',51268,0,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(85,'','Tempora molestiae qui nobis ipsum nulla odit.',64,873982,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(86,'','Voluptates et et quae ea et dicta perspiciatis.',5000,6754014,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(87,'','Molestiae atque beatae et rerum quod.',3,651105841,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(88,'','Fugiat consectetur qui quasi suscipit sit quia.',9387401,50,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(89,'','Harum asperiores sit sit minima harum.',524969000,4481,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(90,'','Velit repellat aut illum iusto.',4761694,34976864,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(91,'','Mollitia ea rerum iure.',84,10,'2021-05-10 20:05:50','2021-05-10 20:05:50'),(92,'','Sunt nihil officiis nemo a in eaque.',8455303,91,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(93,'','Cumque dicta doloribus et sit at enim laudantium.',83237,654525,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(94,'','Aut nemo possimus sed.',74485,534301652,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(95,'','Amet hic et ducimus qui error et sint.',938528,178342997,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(96,'','Enim quod delectus ut.',53680098,8971,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(97,'','Eaque delectus qui adipisci possimus.',6655939,95485,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(98,'','Aut delectus modi perferendis nam repellat.',37405,317,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(99,'','Totam voluptas aut sit voluptatem ut facilis.',786,791999,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(100,'','Molestias alias autem animi natus.',56,8523,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(101,'','Optio quaerat quos odio omnis ut fuga.',54782,6750,'2021-05-10 23:59:19','2021-05-10 23:59:19'),(102,'','Dolores occaecati et optio et amet et dolores.',8329,68966,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(103,'','Et quidem quos ad dicta ipsa consequatur.',61971,72,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(104,'','Et eligendi veniam omnis odit assumenda.',87872377,98059,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(105,'','Omnis sed dolores veritatis aspernatur vel qui.',900,568,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(106,'','Aut vitae hic quo qui consequatur.',734774837,366,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(107,'','Non consequatur maxime voluptatem eos.',2241141,76569,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(108,'','Est et adipisci hic.',8,3,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(109,'','Cupiditate incidunt sequi labore molestias.',3385987,6,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(110,'','A explicabo eaque illo non occaecati.',868,938,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(111,'','Et deleniti ut saepe aliquam dolores tempora.',38617161,22,'2021-05-11 00:00:06','2021-05-11 00:00:06'),(112,'','Perferendis blanditiis sint iusto fugit omnis et.',88483,452,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(113,'','Maiores enim quod error atque impedit.',4248,2383891,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(114,'','Eligendi eos laboriosam sed quam aut.',22495,645,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(115,'','Assumenda ut natus delectus repudiandae magni.',8,18644889,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(116,'','Odio et veritatis et est.',981577184,96438,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(117,'','Autem perferendis iusto aut laborum omnis dicta.',1623172,47931,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(118,'','Sit sed officia blanditiis eos perspiciatis ut.',15530,723453,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(119,'','Incidunt rerum odit est laborum.',99388449,109530497,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(120,'','Voluptas asperiores et ipsam iure a dicta sequi.',974,75676846,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(121,'','Dolores aut enim non voluptas molestiae.',347609,1422,'2021-05-11 00:54:58','2021-05-11 00:54:58'),(122,'','Voluptatum voluptatibus aut modi non.',401041067,3,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(123,'','Delectus et reiciendis maiores non.',6030762,8153,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(124,'','Exercitationem suscipit consequatur dicta ut.',2844205,97000056,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(125,'','Vel non velit quis corrupti.',19136826,382645606,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(126,'','Beatae dolorem molestias culpa accusamus.',59140885,261715,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(127,'','Excepturi rerum id natus deserunt.',27,17,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(128,'','Alias error voluptatem doloremque dolores.',43792211,698121,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(129,'','Qui beatae commodi asperiores fugiat.',39702664,2,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(130,'','Aut sunt natus dolores.',93506,297041225,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(131,'','Totam temporibus molestiae sint ea et.',924220774,39,'2021-05-21 22:04:53','2021-05-21 22:04:53'),(132,'product_images/Mq7lQpV4gWR1M0EPbPFZj0TsivWgMrXktXgTz1n1.jpg','Test Product Name',1,1,'2021-05-21 22:50:15','2021-05-21 22:50:15');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '0',
  `last_action` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Nana','nana@example.com',NULL,'$2y$10$jsQwjlejKmjYGfPRlSilR.0zxTmtFxrzIG4TssI/Mdwmo0khXg1Iu',0,NULL,NULL,'2021-04-27 07:30:37','2021-04-27 07:30:37'),(2,'Kalina','kalina@example.com',NULL,'$2y$10$JBqThS5aMxY4VqmguDYX9uAPVai9D0cEEohr1r/.uloW5rtR/FlZC',0,NULL,NULL,'2021-04-27 07:45:44','2021-04-27 07:45:44'),(3,'Rahid','rahid@example.com',NULL,'$2y$10$/M8IPBbMrpVNGB1ykzcLkufNdDGgE.a6zL8Lax3Pb4p/VdmqZ5vn6',0,NULL,NULL,'2021-04-28 21:57:56','2021-04-28 21:57:56'),(6,'ALX','alx@example.com',NULL,'$2y$10$lss0R4rr.vfslH9LcRM7heXPTULFNmvSsIuQgeDeqLMaKRQdXRhQq',1,NULL,NULL,'2021-05-09 22:10:45','2021-05-09 22:10:45'),(7,'CCK Meat','cck@example.com',NULL,'$2y$10$TXT30BRP5CRFRtA5krqHxuJ1Db.XpSF3TteWXPLPcIIQjDWTStuDa',1,NULL,NULL,'2021-05-09 22:11:10','2021-05-09 22:11:10'),(8,'KimHock','kim@example.com',NULL,'$2y$10$3f0Pp2naoHD/T3Bkt9jjaekGf5s8pSqCtabLyxsmiA7mmZRvkgMWa',0,NULL,NULL,'2021-05-17 03:21:26','2021-05-17 03:21:26');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video_confiqs`
--

DROP TABLE IF EXISTS `video_confiqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_confiqs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userToCall` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signalData` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video_confiqs`
--

LOCK TABLES `video_confiqs` WRITE;
/*!40000 ALTER TABLE `video_confiqs` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_confiqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `websockets_statistics_entries`
--

DROP TABLE IF EXISTS `websockets_statistics_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `websockets_statistics_entries`
--

LOCK TABLES `websockets_statistics_entries` WRITE;
/*!40000 ALTER TABLE `websockets_statistics_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `websockets_statistics_entries` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-27 16:28:32
