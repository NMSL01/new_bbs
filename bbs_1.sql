-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: bbs_1
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add country',7,'add_country'),(20,'Can change country',7,'change_country'),(21,'Can delete country',7,'delete_country'),(22,'Can add article',8,'add_article'),(23,'Can change article',8,'change_article'),(24,'Can delete article',8,'delete_article'),(25,'Can add category',9,'add_category'),(26,'Can change category',9,'change_category'),(27,'Can delete category',9,'delete_category'),(28,'Can add collection',10,'add_collection'),(29,'Can change collection',10,'change_collection'),(30,'Can delete collection',10,'delete_collection'),(31,'Can add comment',11,'add_comment'),(32,'Can change comment',11,'change_comment'),(33,'Can delete comment',11,'delete_comment'),(34,'Can add good',12,'add_good'),(35,'Can change good',12,'change_good'),(36,'Can delete good',12,'delete_good'),(37,'Can add like',13,'add_like'),(38,'Can change like',13,'change_like'),(39,'Can delete like',13,'delete_like'),(40,'Can add to_ comment',14,'add_to_comment'),(41,'Can change to_ comment',14,'change_to_comment'),(42,'Can delete to_ comment',14,'delete_to_comment'),(43,'Can add captcha store',15,'add_captchastore'),(44,'Can change captcha store',15,'change_captchastore'),(45,'Can delete captcha store',15,'delete_captchastore'),(46,'Can add history',16,'add_history'),(47,'Can change history',16,'change_history'),(48,'Can delete history',16,'delete_history');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_article`
--

DROP TABLE IF EXISTS `bbsapp_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `startime` datetime(6) DEFAULT NULL,
  `dengji` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `click_count` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_article_category_id_84042790_fk_bbsapp_category_id` (`category_id`),
  KEY `bbsapp_article_user_id_ffcef150_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `bbsapp_article_category_id_84042790_fk_bbsapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `bbsapp_category` (`id`),
  CONSTRAINT `bbsapp_article_user_id_ffcef150_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_article`
--

LOCK TABLES `bbsapp_article` WRITE;
/*!40000 ALTER TABLE `bbsapp_article` DISABLE KEYS */;
INSERT INTO `bbsapp_article` VALUES (1,'全明星','dsadasdsadsadas<img src=\"/media/2018120822561544281011nv_a.png\" alt=\"\" />选手已集合 出发前往洛杉矶Uzi<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />与Meiko全明星双排，<img src=\"/media/2018120900541544288067beijing.jpg\" alt=\"\" />Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.317875',10,1,2,0),(2,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.335659',10,1,2,0),(3,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.339084',10,1,2,0),(4,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.342343',10,1,2,0),(5,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.345938',10,1,2,0),(6,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.350576',10,1,2,0),(7,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.354809',10,1,2,0),(8,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.361186',10,1,2,0),(9,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.364544',10,1,2,0),(10,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.370570',10,1,2,0),(11,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.373566',10,1,2,0),(12,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.375402',10,1,2,0),(13,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.377923',10,1,2,0),(14,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.381754',10,1,2,0),(15,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.384455',10,1,2,0),(16,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.387160',10,1,2,0),(17,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.389512',10,1,2,0),(18,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.391044',10,1,2,0),(19,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.393803',10,1,2,0),(20,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.395599',10,1,2,0),(21,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.397894',10,1,2,0),(22,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.399412',10,1,2,0),(23,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.403469',10,1,2,0),(24,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.406069',10,1,2,0),(25,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.408414',10,1,2,0),(26,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.410230',10,1,2,0),(27,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.412660',10,1,2,0),(28,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.414235',10,1,2,0),(29,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.416430',10,1,2,0),(30,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.418130',10,1,2,0),(31,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.420894',10,1,2,0),(32,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.422510',10,1,2,0),(33,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.424868',10,1,2,0),(34,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.426388',10,1,2,0),(35,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.428930',10,1,2,0),(36,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.430532',10,1,2,0),(37,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.432828',10,1,2,0),(38,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.434424',10,1,2,0),(39,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.436873',10,1,2,0),(40,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.438501',10,1,2,0),(41,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.440615',10,1,2,0),(42,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.442243',10,1,2,0),(43,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.443753',10,1,2,0),(44,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.446014',10,1,2,0),(45,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.447606',10,1,2,0),(46,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.449713',10,1,2,0),(47,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.451299',10,1,2,0),(48,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.453576',10,1,2,0),(49,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.455477',10,1,2,0),(50,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.457747',10,1,2,0),(51,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.459297',10,1,2,0),(52,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.461314',10,1,2,0),(53,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.462896',10,1,2,0),(54,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.465165',10,1,2,0),(55,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.466717',10,1,2,0),(56,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.468829',10,1,2,0),(57,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.470375',10,1,2,0),(58,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.472638',10,1,2,0),(59,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.474345',10,1,2,0),(60,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.476691',10,1,2,0),(61,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.478193',10,1,2,0),(62,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.480400',10,1,2,0),(63,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.481893',10,1,2,0),(64,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.483325',10,1,2,0),(65,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.485490',10,1,2,0),(66,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.487194',10,1,2,0),(67,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.489172',10,1,2,0),(68,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.493125',10,1,2,0),(69,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.494641',10,1,2,0),(70,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.496623',10,1,2,0),(71,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.498338',10,1,2,0),(72,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.500630',10,1,2,0),(73,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.502260',10,1,2,0),(74,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.504322',10,1,2,0),(75,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.505879',10,1,2,0),(76,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.507551',10,1,2,0),(77,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.509536',10,1,2,0),(78,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.511059',10,1,2,0),(79,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.512936',10,1,2,0),(80,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.514402',10,1,2,0),(81,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.520919',10,1,2,0),(82,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.523165',10,1,2,0),(83,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.528954',10,1,2,0),(84,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.530651',10,1,2,0),(85,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.532670',10,1,2,0),(86,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.534221',10,1,2,0),(87,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.538908',10,1,2,0),(88,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.540948',10,1,2,0),(89,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.542562',10,1,2,0),(90,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.545070',10,1,2,0),(91,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.546721',10,1,2,0),(92,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.549007',10,1,2,0),(93,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.550856',10,1,2,0),(94,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.553075',10,1,2,0),(95,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.554666',10,1,2,0),(96,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.556730',10,1,2,0),(97,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.558304',10,1,2,0),(98,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.560273',10,1,2,0),(99,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.561774',10,1,2,0),(100,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.563398',10,1,2,0),(101,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.565443',10,1,2,0),(102,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.566922',10,1,2,0),(103,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.568933',10,1,2,0),(104,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.570489',10,1,2,0),(105,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.571929',10,1,2,0),(106,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.573852',10,1,2,0),(107,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.575302',10,1,2,0),(108,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.577025',10,1,2,0),(109,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.578640',10,1,2,0),(110,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.580097',10,1,2,0),(111,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.582038',10,1,2,0),(112,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.583568',10,1,2,0),(113,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.586970',10,1,2,0),(114,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.589056',10,1,2,0),(115,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.590607',10,1,2,0),(116,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.592079',10,1,2,0),(117,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.594048',10,1,2,0),(118,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.595593',10,1,2,0),(119,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.597048',10,1,2,0),(120,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.598622',10,1,2,0),(121,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.600622',10,1,2,0),(122,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.602331',10,1,2,0),(123,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.604457',10,1,2,0),(124,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.605998',10,1,2,0),(125,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.607414',10,1,2,0),(126,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.609305',10,1,2,0),(127,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.611136',10,1,2,0),(128,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.613276',10,1,2,0),(129,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.614831',10,1,2,0),(130,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.616817',10,1,2,0),(131,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.618411',10,1,2,0),(132,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.620481',10,1,2,0),(133,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.622102',10,1,2,0),(134,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.623581',10,1,2,0),(135,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.625494',10,1,2,0),(136,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.627170',10,1,2,0),(137,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.629347',10,1,2,0),(138,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.630997',10,1,2,0),(139,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.632937',10,1,2,0),(140,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.634384',10,1,2,0),(141,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.636239',10,1,2,0),(142,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.637620',10,1,2,0),(143,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.639134',10,1,2,0),(144,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.640950',10,1,2,0),(145,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.642462',10,1,2,0),(146,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.644300',10,1,2,0),(147,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.645680',10,1,2,0),(148,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.647241',10,1,2,0),(149,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.649662',10,1,2,0),(150,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.651245',10,1,2,0),(151,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.653226',10,1,2,0),(152,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.654895',10,1,2,0),(153,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.657025',10,1,2,0),(154,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.658623',10,1,2,0),(155,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.660451',10,1,2,0),(156,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.661943',10,1,2,0),(157,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.663372',10,1,2,0),(158,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.665172',10,1,2,0),(159,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.666677',10,1,2,0),(160,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.668459',10,1,2,0),(161,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.669858',10,1,2,0),(162,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.671400',10,1,2,0),(163,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.673133',10,1,2,0),(164,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.674589',10,1,2,0),(165,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.676143',10,1,2,0),(166,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.678445',10,1,2,0),(167,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.680082',10,1,2,0),(168,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.682042',10,1,2,0),(169,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.683698',10,1,2,0),(170,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.685600',10,1,2,0),(171,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.687522',10,1,2,0),(172,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.690021',10,1,2,0),(173,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.691797',10,1,2,0),(174,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.693982',10,1,2,0),(175,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.695566',10,1,2,0),(176,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.697474',10,1,2,0),(177,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.698909',10,1,2,0),(178,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.700739',10,1,2,0),(179,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.702112',10,1,2,0),(180,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.703572',10,1,2,0),(181,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.705480',10,1,2,0),(182,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.707170',10,1,2,0),(183,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.709544',10,1,2,0),(184,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.711148',10,1,2,0),(185,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.713430',10,1,2,0),(186,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.715053',10,1,2,0),(187,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.717750',10,1,2,0),(188,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.719228',10,1,2,0),(189,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.721132',10,1,2,0),(190,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.722760',10,1,2,0),(191,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.724939',10,1,2,0),(192,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.726378',10,1,2,0),(193,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.728279',10,1,2,0),(194,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.729812',10,1,2,0),(195,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.731293',10,1,2,0),(196,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.733574',10,1,2,0),(197,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.735732',10,1,2,0),(198,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.738627',10,1,2,0),(199,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.740947',10,1,2,0),(200,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.742559',10,1,2,0),(201,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.744846',10,1,2,0),(202,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.746383',10,1,2,0),(203,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.748599',10,1,2,0),(204,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.750120',10,1,2,0),(205,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.751595',10,1,2,0),(206,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.753565',10,1,2,0),(207,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.755155',10,1,2,0),(208,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.757664',10,1,2,0),(209,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.759353',10,1,2,0),(210,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.761606',10,1,2,0),(211,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.763303',10,1,2,0),(212,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.765587',10,1,2,0),(213,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.767161',10,1,2,0),(214,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.769448',10,1,2,0),(215,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.771092',10,1,2,0),(216,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.773160',10,1,2,0),(217,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.775411',10,1,2,0),(218,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.777814',10,1,2,0),(219,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.779401',10,1,2,0),(220,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.781583',10,1,2,0),(221,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.783177',10,1,2,0),(222,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.785844',10,1,2,0),(223,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.787648',10,1,2,0),(224,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.789931',10,1,2,0),(225,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.791533',10,1,2,0),(226,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.793648',10,1,2,0),(227,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.795325',10,1,2,0),(228,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.797527',10,1,2,0),(229,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.799087',10,1,2,0),(230,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.801599',10,1,2,0),(231,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.803131',10,1,2,0),(232,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.805654',10,1,2,0),(233,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.807269',10,1,2,0),(234,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.809247',10,1,2,0),(235,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.810913',10,1,2,0),(236,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.812940',10,1,2,0),(237,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.814725',10,1,2,0),(238,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.816581',10,1,2,0),(239,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.818631',10,1,2,0),(240,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.820107',10,1,2,0),(241,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.822105',10,1,2,0),(242,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.823669',10,1,2,0),(243,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.825598',10,1,2,0),(244,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.827061',10,1,2,0),(245,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.829017',10,1,2,0),(246,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.830523',10,1,2,0),(247,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.832372',10,1,2,0),(248,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.834211',10,1,2,0),(249,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.838159',10,1,2,0),(250,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.840303',10,1,2,0),(251,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.841829',10,1,2,0),(252,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.843380',10,1,2,0),(253,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.845379',10,1,2,0),(254,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.847004',10,1,2,0),(255,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.848823',10,1,2,0),(256,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.850249',10,1,2,0),(257,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.852043',10,1,2,0),(258,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.853495',10,1,2,0),(259,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.854992',10,1,2,0),(260,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.856783',10,1,2,0),(261,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.859064',10,1,2,0),(262,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.860906',10,1,2,0),(263,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.862409',10,1,2,0),(264,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.864638',10,1,2,0),(265,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.866436',10,1,2,0),(266,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.868476',10,1,2,0),(267,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.870004',10,1,2,0),(268,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.871525',10,1,2,0),(269,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.873526',10,1,2,0),(270,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.875008',10,1,2,0),(271,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.876736',10,1,2,0),(272,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.878165',10,1,2,0),(273,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.879543',10,1,2,0),(274,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.881317',10,1,2,0),(275,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.882658',10,1,2,0),(276,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.884514',10,1,2,0),(277,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.886002',10,1,2,0),(278,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.887523',10,1,2,0),(279,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.889568',10,1,2,0),(280,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.891104',10,1,2,0),(281,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.892866',10,1,2,0),(282,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.894300',10,1,2,0),(283,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.895743',10,1,2,0),(284,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.897936',10,1,2,0),(285,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.899587',10,1,2,0),(286,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.901641',10,1,2,0),(287,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.903189',10,1,2,0),(288,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.905058',10,1,2,0),(289,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.910197',10,1,2,0),(290,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.912511',10,1,2,0),(291,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.914595',10,1,2,0),(292,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.916302',10,1,2,0),(293,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.918465',10,1,2,0),(294,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.919992',10,1,2,0),(295,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.922099',10,1,2,0),(296,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.923684',10,1,2,0),(297,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.925902',10,1,2,0),(298,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.927703',10,1,2,0),(299,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.930036',10,1,2,1),(300,'全明星','·LPL全明星选手已集合 出发前往洛杉矶Uzi与Meiko全明星双排，Meiko天秀锤石辅LPL全明星队1v1参赛选手公布：Uzi与Meiko','2018-12-08 08:05:27.931664',10,1,2,0),(301,'英雄联盟','<img src=\"/media/2018120817501544262646images.jpeg\" alt=\"\" /><img src=\"/media/2018120817501544262646lol_logo.png\" alt=\"\" /><img src=\"/media/2018120817501544262646nv.png\" alt=\"\" /><img src=\"/media/2018120817501544262646nv_a.png\" alt=\"\" /><img src=\"/media/2018120817501544262646u=2592312334,268648929&fm=26&gp=0.jpg\" alt=\"\" /><img src=\"/media/2018120817501544262646u=3588760101,220437767&fm=26&gp=0.jpg\" alt=\"\" />','2018-12-08 09:51:12.577801',10,1,2,0),(302,'第一次法别','dasdas<img src=\"/media/2018120914571544338645beijing.jpg\" alt=\"\" />','2018-12-09 06:57:30.620175',10,1,2,2),(303,'第一次法别','dasdas<img src=\"/media/2018120914571544338645beijing.jpg\" alt=\"\" />','2018-12-09 07:00:45.611491',10,1,2,1),(304,'第一次发帖。','<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2018-12-09 07:02:24.935140',10,1,2,0),(305,'第一次发帖。','<img src=\"/media/2018120915021544338975lol_logo.png\" alt=\"\" /><img src=\"/media/2018120915021544338975nv.png\" alt=\"\" /><img src=\"/media/2018120915021544338975nv_a.png\" alt=\"\" /><img src=\"/media/2018120915021544338975u=2592312334,268648929&fm=26&gp=0.jpg\" alt=\"\" /><img src=\"/media/2018120915021544338976u=3588760101,220437767&fm=26&gp=0.jpg\" alt=\"\" />','2018-12-09 07:03:14.908770',10,1,2,20),(306,'123','hhh','2018-12-10 10:31:18.253164',10,1,3,0),(307,'qwewqe','dasd','2018-12-10 10:38:42.193738',10,1,2,1),(308,'aaaaaa','<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2018-12-10 10:39:04.116768',10,1,2,9),(309,'ssas','asdasd','2018-12-10 11:43:59.420052',10,1,8,4),(310,'杨超越02测试','哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈皇后&nbsp;&nbsp;','2018-12-11 01:35:34.464809',10,1,11,3),(311,'回复评论测试2','','2018-12-11 02:01:05.765992',10,1,9,1),(312,'python 模块的是使用','class single03(object):<br />\r\n<span> </span>def __init__(self,cls):<br />\r\n<span> </span>self._cls = cls<br />\r\n<span> </span>self._instances = None;<br />\r\n<span> </span>def __call__(self,*args):<br />\r\n<span> </span>if not self._instances:<br />\r\n<span> </span>self._instances = self._cls(*args)<br />\r\n<span> </span>return self._instances<br />\r\n&nbsp;<br />\r\n//一样调用<br />\r\n@single03<br />\r\nclass A(object):<br />\r\n<span> </span>def __init__(self,name):<br />\r\n<span> </span>self.name = name<br />','2018-12-11 02:01:40.092706',10,1,9,2),(313,'最冲测试','<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" /><img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/0.gif\" border=\"0\" alt=\"\" />','2018-12-11 02:21:19.378847',10,1,2,19),(314,'第一次发帖。','打扫打扫得','2018-12-11 07:19:10.153860',10,1,11,18);
/*!40000 ALTER TABLE `bbsapp_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_category`
--

DROP TABLE IF EXISTS `bbsapp_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_category`
--

LOCK TABLES `bbsapp_category` WRITE;
/*!40000 ALTER TABLE `bbsapp_category` DISABLE KEYS */;
INSERT INTO `bbsapp_category` VALUES (1,'英雄联盟'),(2,'炉石传说'),(3,'绝地求生'),(4,'DNF'),(5,'DATA2'),(6,'堡垒之夜'),(7,'守望先锋'),(8,'步行街');
/*!40000 ALTER TABLE `bbsapp_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_collection`
--

DROP TABLE IF EXISTS `bbsapp_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collection` tinyint(1) NOT NULL,
  `startime` datetime(6) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_collection_article_id_98637892_fk_bbsapp_article_id` (`article_id`),
  KEY `bbsapp_collection_user_id_004e885f_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `bbsapp_collection_article_id_98637892_fk_bbsapp_article_id` FOREIGN KEY (`article_id`) REFERENCES `bbsapp_article` (`id`),
  CONSTRAINT `bbsapp_collection_user_id_004e885f_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_collection`
--

LOCK TABLES `bbsapp_collection` WRITE;
/*!40000 ALTER TABLE `bbsapp_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbsapp_collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_comment`
--

DROP TABLE IF EXISTS `bbsapp_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startime` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `father_id` varchar(80) DEFAULT NULL,
  `floor_id` varchar(80) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_comment_article_id_d12773c7_fk_bbsapp_article_id` (`article_id`),
  KEY `bbsapp_comment_user_id_55f549f1_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `bbsapp_comment_article_id_d12773c7_fk_bbsapp_article_id` FOREIGN KEY (`article_id`) REFERENCES `bbsapp_article` (`id`),
  CONSTRAINT `bbsapp_comment_user_id_55f549f1_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_comment`
--

LOCK TABLES `bbsapp_comment` WRITE;
/*!40000 ALTER TABLE `bbsapp_comment` DISABLE KEYS */;
INSERT INTO `bbsapp_comment` VALUES (55,'2018-12-10 09:42:29.938015','asdsadas<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/10.gif\" border=\"0\" alt=\"\" />','None','None',305,2),(56,'2018-12-10 10:28:36.236744','666','55','55',305,3),(57,'2018-12-10 10:29:12.392061','45','56','55',305,3),(58,'2018-12-10 10:29:18.137915','45','56','55',305,3),(59,'2018-12-10 10:29:19.229979','45','56','55',305,3),(60,'2018-12-10 10:29:20.450639','45','56','55',305,3),(61,'2018-12-10 10:29:22.337688','45','56','55',305,3),(62,'2018-12-10 10:29:31.206544','45','56','55',305,3),(63,'2018-12-10 10:29:32.082339','45','56','55',305,3),(64,'2018-12-10 10:29:32.947278','45','56','55',305,3),(65,'2018-12-10 10:29:35.250750','45','56','55',305,3),(66,'2018-12-10 10:29:36.246881','45','56','55',305,3),(67,'2018-12-10 10:41:26.821527','呵呵','None','None',302,2),(68,'2018-12-10 10:54:26.206963','第一个评论','None','None',308,2),(69,'2018-12-10 10:54:31.847703','<span>第2个评论</span>','None','None',308,2),(70,'2018-12-10 11:04:31.289381','<span>第一个评论</span>','None','None',308,2),(71,'2018-12-10 11:24:34.034934','撒旦飞洒','None','None',305,4),(72,'2018-12-10 11:24:41.883625','是的范德萨','55','55',305,4),(73,'2018-12-11 01:16:01.040780','AAAAAAAAAAAA','None','None',308,2),(74,'2018-12-11 01:36:05.794692','回复评论测试！！！！！！','None','None',310,9),(75,'2018-12-11 02:03:46.411656','<img src=\"http://127.0.0.1:8000/static/text/js/kindeditor/plugins/emoticons/images/51.gif\" border=\"0\" alt=\"\" />','None','None',312,2),(76,'2018-12-11 02:21:44.665638','鲁本为牛逼','None','None',313,9),(77,'2018-12-11 02:59:06.369292','<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;\">鲁本为牛逼</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:14px;\"><br />\r\n</span>\r\n</p>','None','None',313,9),(78,'2018-12-11 03:14:30.768980','<br class=\"Apple-interchange-newline\" />\r\n<span style=\"color:#333333;font-family:&quot;font-size:15px;\">鲁本为牛逼222</span>','None','None',313,9),(79,'2018-12-11 03:14:43.302266','<br class=\"Apple-interchange-newline\" />\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:15px;\">鲁本为牛逼</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:15px;\"><br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"color:#333333;font-family:&quot;font-size:15px;\">554654<br class=\"Apple-interchange-newline\" />\r\n<span style=\"color:#333333;font-family:&quot;font-size:15px;\">鲁本为牛逼54456<br class=\"Apple-interchange-newline\" />\r\n<span style=\"color:#333333;font-family:&quot;font-size:15px;\">鲁本为牛逼</span></span></span>\r\n</p>','None','None',313,9),(80,'2018-12-11 07:17:05.360959','和和和和黄河','None','None',313,9),(81,'2018-12-11 07:19:44.771641','和和五五开','None','None',314,2),(82,'2018-12-11 07:31:25.390413','杨超越','81','81',314,9),(83,'2018-12-11 07:37:38.988554','杨超越','81','81',314,9);
/*!40000 ALTER TABLE `bbsapp_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_good`
--

DROP TABLE IF EXISTS `bbsapp_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `click_good` tinyint(1) NOT NULL,
  `startime` datetime(6) DEFAULT NULL,
  `article_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_good_article_id_3edb5034_fk_bbsapp_article_id` (`article_id`),
  KEY `bbsapp_good_user_id_6a38cd98_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `bbsapp_good_article_id_3edb5034_fk_bbsapp_article_id` FOREIGN KEY (`article_id`) REFERENCES `bbsapp_article` (`id`),
  CONSTRAINT `bbsapp_good_user_id_6a38cd98_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_good`
--

LOCK TABLES `bbsapp_good` WRITE;
/*!40000 ALTER TABLE `bbsapp_good` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbsapp_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_like`
--

DROP TABLE IF EXISTS `bbsapp_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `like` varchar(20) DEFAULT NULL,
  `to_like` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_like_user_id_a2f6baaa_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `bbsapp_like_user_id_a2f6baaa_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_like`
--

LOCK TABLES `bbsapp_like` WRITE;
/*!40000 ALTER TABLE `bbsapp_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `bbsapp_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bbsapp_to_comment`
--

DROP TABLE IF EXISTS `bbsapp_to_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbsapp_to_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(20) DEFAULT NULL,
  `to_comment` varchar(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `startime` datetime(6),
  `to_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bbsapp_to_comment_user_id_96569c90_fk_login_in_user_id` (`user_id`),
  KEY `bbsapp_to_comment_to_user_id_99b4e7d7_fk_login_in_user_id` (`to_user_id`),
  CONSTRAINT `bbsapp_to_comment_to_user_id_99b4e7d7_fk_login_in_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `login_in_user` (`id`),
  CONSTRAINT `bbsapp_to_comment_user_id_96569c90_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbsapp_to_comment`
--

LOCK TABLES `bbsapp_to_comment` WRITE;
/*!40000 ALTER TABLE `bbsapp_to_comment` DISABLE KEYS */;
INSERT INTO `bbsapp_to_comment` VALUES (37,'','80',2,'2018-12-11 07:17:05.388963',9),(39,'','81',11,'2018-12-11 07:19:44.792157',2),(40,'81','',9,'2018-12-11 07:37:39.010373',2),(41,'','83',2,'2018-12-11 07:37:39.015243',9);
/*!40000 ALTER TABLE `bbsapp_to_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-12-08 08:03:39.442736','1','Category object',1,'[{\"added\": {}}]',9,1),(2,'2018-12-08 08:55:57.709958','1','Comment object',1,'[{\"added\": {}}]',11,1),(3,'2018-12-08 09:51:12.704399','301','301',1,'[{\"added\": {}}]',8,1),(4,'2018-12-08 10:15:53.479539','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(5,'2018-12-08 13:04:22.293275','2','Category object',1,'[{\"added\": {}}]',9,1),(6,'2018-12-08 13:04:43.553940','3','Category object',1,'[{\"added\": {}}]',9,1),(7,'2018-12-08 13:04:50.886020','4','Category object',1,'[{\"added\": {}}]',9,1),(8,'2018-12-08 13:05:03.775742','5','Category object',1,'[{\"added\": {}}]',9,1),(9,'2018-12-08 13:05:32.435843','6','Category object',1,'[{\"added\": {}}]',9,1),(10,'2018-12-08 13:05:43.159998','7','Category object',1,'[{\"added\": {}}]',9,1),(11,'2018-12-08 13:05:56.595714','8','Category object',1,'[{\"added\": {}}]',9,1),(12,'2018-12-08 14:27:55.173327','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(13,'2018-12-08 14:29:17.306882','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(14,'2018-12-08 14:57:00.970310','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(15,'2018-12-08 15:01:45.840629','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(16,'2018-12-08 16:54:36.907728','1','1',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',8,1),(17,'2018-12-09 12:14:18.021378','2','Comment object',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',11,1),(18,'2018-12-09 12:15:11.776584','2','Comment object',2,'[{\"changed\": {\"fields\": [\"content\", \"father_id\", \"floor_id\"]}}]',11,1),(19,'2018-12-09 12:20:15.058985','2','Comment object',2,'[{\"changed\": {\"fields\": [\"father_id\", \"floor_id\"]}}]',11,1),(20,'2018-12-09 13:08:05.617803','309','309',3,'',8,1),(21,'2018-12-09 13:08:05.640597','308','308',3,'',8,1),(22,'2018-12-09 13:08:05.645451','307','307',3,'',8,1),(23,'2018-12-09 13:08:05.652387','306','306',3,'',8,1),(24,'2018-12-10 09:07:55.135804','1','1',2,'[{\"changed\": {\"fields\": [\"click_count\"]}}]',8,1),(25,'2018-12-10 09:15:39.903791','1','1',2,'[{\"changed\": {\"fields\": [\"click_count\"]}}]',8,1),(26,'2018-12-10 09:32:17.582308','54','Comment object',3,'',11,1),(27,'2018-12-10 09:32:17.640809','53','Comment object',3,'',11,1),(28,'2018-12-10 09:32:17.649527','52','Comment object',3,'',11,1),(29,'2018-12-10 09:32:17.652519','51','Comment object',3,'',11,1),(30,'2018-12-10 09:32:17.654343','50','Comment object',3,'',11,1),(31,'2018-12-10 09:32:17.656507','49','Comment object',3,'',11,1),(32,'2018-12-10 09:32:17.659810','48','Comment object',3,'',11,1),(33,'2018-12-10 09:32:17.662205','47','Comment object',3,'',11,1),(34,'2018-12-10 09:32:17.664453','46','Comment object',3,'',11,1),(35,'2018-12-10 09:32:17.666050','45','Comment object',3,'',11,1),(36,'2018-12-10 09:32:17.669560','44','Comment object',3,'',11,1),(37,'2018-12-10 09:32:17.672274','43','Comment object',3,'',11,1),(38,'2018-12-10 09:32:17.673746','42','Comment object',3,'',11,1),(39,'2018-12-10 09:32:17.680300','41','Comment object',3,'',11,1),(40,'2018-12-10 09:32:17.684040','40','Comment object',3,'',11,1),(41,'2018-12-10 09:32:17.686239','39','Comment object',3,'',11,1),(42,'2018-12-10 09:32:17.691643','38','Comment object',3,'',11,1),(43,'2018-12-10 09:32:17.694653','37','Comment object',3,'',11,1),(44,'2018-12-10 09:32:17.699104','36','Comment object',3,'',11,1),(45,'2018-12-10 09:32:17.701695','35','Comment object',3,'',11,1),(46,'2018-12-10 09:32:17.703786','34','Comment object',3,'',11,1),(47,'2018-12-10 09:32:17.705277','33','Comment object',3,'',11,1),(48,'2018-12-10 09:32:17.711432','32','Comment object',3,'',11,1),(49,'2018-12-10 09:32:17.714530','31','Comment object',3,'',11,1),(50,'2018-12-10 09:32:17.718695','30','Comment object',3,'',11,1),(51,'2018-12-10 09:32:17.722967','29','Comment object',3,'',11,1),(52,'2018-12-10 09:32:17.726679','28','Comment object',3,'',11,1),(53,'2018-12-10 09:32:17.730875','27','Comment object',3,'',11,1),(54,'2018-12-10 09:32:17.733402','26','Comment object',3,'',11,1),(55,'2018-12-10 09:32:17.734847','25','Comment object',3,'',11,1),(56,'2018-12-10 09:32:17.736739','24','Comment object',3,'',11,1),(57,'2018-12-10 09:32:17.740193','23','Comment object',3,'',11,1),(58,'2018-12-10 09:32:17.742640','22','Comment object',3,'',11,1),(59,'2018-12-10 09:32:17.748605','21','Comment object',3,'',11,1),(60,'2018-12-10 09:32:17.751168','20','Comment object',3,'',11,1),(61,'2018-12-10 09:32:17.753199','19','Comment object',3,'',11,1),(62,'2018-12-10 09:32:17.759069','18','Comment object',3,'',11,1),(63,'2018-12-10 09:32:17.761722','17','Comment object',3,'',11,1),(64,'2018-12-10 09:32:17.763830','16','Comment object',3,'',11,1),(65,'2018-12-10 09:32:17.765317','15','Comment object',3,'',11,1),(66,'2018-12-10 09:32:17.766715','14','Comment object',3,'',11,1),(67,'2018-12-10 09:32:17.771395','13','Comment object',3,'',11,1),(68,'2018-12-10 09:32:17.777275','12','Comment object',3,'',11,1),(69,'2018-12-10 09:32:17.781546','11','Comment object',3,'',11,1),(70,'2018-12-10 09:32:17.783481','10','Comment object',3,'',11,1),(71,'2018-12-10 09:32:17.787292','9','Comment object',3,'',11,1),(72,'2018-12-10 09:32:17.789543','8','Comment object',3,'',11,1),(73,'2018-12-10 09:32:17.790948','7','Comment object',3,'',11,1),(74,'2018-12-10 09:32:17.792637','6','Comment object',3,'',11,1),(75,'2018-12-10 09:32:17.797426','5','Comment object',3,'',11,1),(76,'2018-12-10 09:32:17.799867','4','Comment object',3,'',11,1),(77,'2018-12-10 09:32:17.801321','3','Comment object',3,'',11,1),(78,'2018-12-10 09:32:17.805665','2','Comment object',3,'',11,1),(79,'2018-12-10 09:32:17.807136','1','Comment object',3,'',11,1),(80,'2018-12-11 06:54:49.108311','35','to_Comment object',3,'',14,1),(81,'2018-12-11 06:54:49.115142','34','to_Comment object',3,'',14,1),(82,'2018-12-11 06:54:49.117072','33','to_Comment object',3,'',14,1),(83,'2018-12-11 06:54:49.119824','32','to_Comment object',3,'',14,1),(84,'2018-12-11 06:54:49.122421','30','to_Comment object',3,'',14,1),(85,'2018-12-11 06:54:49.125500','28','to_Comment object',3,'',14,1),(86,'2018-12-11 06:54:49.127554','27','to_Comment object',3,'',14,1),(87,'2018-12-11 06:54:49.140058','24','to_Comment object',3,'',14,1),(88,'2018-12-11 06:54:49.142566','23','to_Comment object',3,'',14,1),(89,'2018-12-11 06:54:49.144970','22','to_Comment object',3,'',14,1),(90,'2018-12-11 06:54:49.154475','21','to_Comment object',3,'',14,1),(91,'2018-12-11 06:54:49.164798','20','to_Comment object',3,'',14,1),(92,'2018-12-11 06:54:49.166522','19','to_Comment object',3,'',14,1),(93,'2018-12-11 06:54:49.168268','18','to_Comment object',3,'',14,1),(94,'2018-12-11 06:54:49.170429','17','to_Comment object',3,'',14,1),(95,'2018-12-11 06:54:49.172708','16','to_Comment object',3,'',14,1),(96,'2018-12-11 06:54:49.177358','15','to_Comment object',3,'',14,1),(97,'2018-12-11 06:54:49.181962','14','to_Comment object',3,'',14,1),(98,'2018-12-11 06:54:49.188452','13','to_Comment object',3,'',14,1),(99,'2018-12-11 06:54:49.192457','12','to_Comment object',3,'',14,1),(100,'2018-12-11 06:54:49.195104','11','to_Comment object',3,'',14,1),(101,'2018-12-11 06:54:49.199769','10','to_Comment object',3,'',14,1),(102,'2018-12-11 06:54:49.206744','9','to_Comment object',3,'',14,1),(103,'2018-12-11 06:54:49.212708','8','to_Comment object',3,'',14,1),(104,'2018-12-11 06:54:49.215550','7','to_Comment object',3,'',14,1),(105,'2018-12-11 06:54:49.218178','6','to_Comment object',3,'',14,1),(106,'2018-12-11 06:54:49.219869','5','to_Comment object',3,'',14,1),(107,'2018-12-11 06:54:49.223494','3','to_Comment object',3,'',14,1),(108,'2018-12-11 06:54:49.225937','2','to_Comment object',3,'',14,1),(109,'2018-12-11 08:08:49.067389','38','to_Comment object',3,'',14,1),(110,'2018-12-11 08:08:49.076589','36','to_Comment object',3,'',14,1),(111,'2018-12-11 09:28:50.342115','2','history object',3,'',16,1),(112,'2018-12-11 09:28:50.350316','1','history object',3,'',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(8,'bbsapp','article'),(9,'bbsapp','category'),(10,'bbsapp','collection'),(11,'bbsapp','comment'),(12,'bbsapp','good'),(13,'bbsapp','like'),(14,'bbsapp','to_comment'),(15,'captcha','captchastore'),(4,'contenttypes','contenttype'),(7,'login_in','country'),(16,'login_in','history'),(6,'login_in','user'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-12-08 08:02:15.563562'),(2,'contenttypes','0002_remove_content_type_name','2018-12-08 08:02:15.621716'),(3,'auth','0001_initial','2018-12-08 08:02:15.798918'),(4,'auth','0002_alter_permission_name_max_length','2018-12-08 08:02:15.847661'),(5,'auth','0003_alter_user_email_max_length','2018-12-08 08:02:15.860510'),(6,'auth','0004_alter_user_username_opts','2018-12-08 08:02:15.881503'),(7,'auth','0005_alter_user_last_login_null','2018-12-08 08:02:15.898063'),(8,'auth','0006_require_contenttypes_0002','2018-12-08 08:02:15.901249'),(9,'auth','0007_alter_validators_add_error_messages','2018-12-08 08:02:15.919184'),(10,'auth','0008_alter_user_username_max_length','2018-12-08 08:02:15.940818'),(11,'login_in','0001_initial','2018-12-08 08:02:16.175875'),(12,'admin','0001_initial','2018-12-08 08:02:16.267454'),(13,'admin','0002_logentry_remove_auto_add','2018-12-08 08:02:16.299009'),(14,'bbsapp','0001_initial','2018-12-08 08:02:16.747398'),(15,'bbsapp','0002_auto_20181206_1605','2018-12-08 08:02:16.788412'),(16,'bbsapp','0003_auto_20181208_1536','2018-12-08 08:02:16.857673'),(17,'captcha','0001_initial','2018-12-08 08:02:16.880269'),(18,'login_in','0002_auto_20181123_1844','2018-12-08 08:02:16.980511'),(19,'login_in','0003_auto_20181125_1945','2018-12-08 08:02:17.068616'),(20,'login_in','0004_user_to_comment','2018-12-08 08:02:17.156719'),(21,'login_in','0005_remove_user_to_comment','2018-12-08 08:02:17.230711'),(22,'sessions','0001_initial','2018-12-08 08:02:17.257793'),(23,'bbsapp','0004_article_click_count','2018-12-10 08:35:02.976631'),(24,'bbsapp','0005_auto_20181210_1757','2018-12-10 09:57:07.030980'),(25,'bbsapp','0006_auto_20181211_1015','2018-12-11 02:15:18.384781'),(26,'login_in','0006_auto_20181211_1659','2018-12-11 08:59:16.979021'),(27,'login_in','0007_history','2018-12-11 09:06:45.805203'),(28,'login_in','0008_history_startime','2018-12-11 09:28:25.697126');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0fysqf7cqwyqcj262x58mibi2jjlww5h','YzU5MTFmMWY2ZjRmZDc3OGViZmE0NTkyMmEwMzRlNDVjNDg5MGY0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWIzYTcxZjdmZGZjYWFlNTVkMzIyMDgzY2NkMTA4MWQ2YzE2ZmMyIn0=','2018-12-22 10:15:21.017995'),('1g9wpy3mfxryckgw8g4d45h01x0ld31f','MjgwOTUzNDA2ZjEyOGUyMjMwZjNmODZmYWI2MGM5NDE5NTE1YjhkNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWIzYTcxZjdmZGZjYWFlNTVkMzIyMDgzY2NkMTA4MWQ2YzE2ZmMyIiwibG9naW4iOnsidXNlcm5hbWUiOiJ3dXd1a2FpMDIiLCJpZCI6Mn19','2018-12-25 08:43:55.163586'),('7pxf2qugm2h36wz41387lgx5u99jmulc','ODZiY2U4YmYxYzkyOWY2YjA2NWYzMjE1N2YyNTY5M2VhYjlhMWVlOTp7ImxvZ2luIjp7InVzZXJuYW1lIjoibGlnYW5nMTIzIiwiaWQiOjd9fQ==','2018-12-24 11:37:43.543171'),('897zci4b3i10a865p3gciz4ompyp9ggw','ZWYyYTU1YjlhMDkxZDA5MDNjMmY3OTA2YjgwZmJkZWMzN2M2Zjg2YTp7ImxvZ2luIjp7InVzZXJuYW1lIjoienhjdiIsImlkIjozfX0=','2018-12-24 10:26:26.606426'),('cx994ec55ev8o4jm0gu4js2dw8mutz23','NDQwNGVlZTg2YTc1NzdlYTUzMjI3M2Q3Nzk4MTMxZjQ1ODk3YjA1Nzp7ImxvZ2luIjp7InVzZXJuYW1lIjoiMTU1NjU1NTU2MzIiLCJpZCI6NH19','2018-12-24 11:23:56.075514'),('qxwja0293p3h7jxspr135x7c8u0ua4o5','MzBiYTVhYmQ2NjNhNWUzMDJkZmY1NzZjNTRkYzY5NmU3Y2E2ZmZlMDp7ImxvZ2luIjp7InVzZXJuYW1lIjoiMTgzMTAwMTIwMDExMCIsImlkIjo4fX0=','2018-12-24 11:37:18.043737'),('tf1hrz8k1gk20x5lcchsgtd14r90wrsh','MjgwOTUzNDA2ZjEyOGUyMjMwZjNmODZmYWI2MGM5NDE5NTE1YjhkNTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWIzYTcxZjdmZGZjYWFlNTVkMzIyMDgzY2NkMTA4MWQ2YzE2ZmMyIiwibG9naW4iOnsidXNlcm5hbWUiOiJ3dXd1a2FpMDIiLCJpZCI6Mn19','2018-12-25 09:57:50.532594'),('y7ribivgejgi2rcgffslcbbj1ocx42gc','YzU5MTFmMWY2ZjRmZDc3OGViZmE0NTkyMmEwMzRlNDVjNDg5MGY0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxOWIzYTcxZjdmZGZjYWFlNTVkMzIyMDgzY2NkMTA4MWQ2YzE2ZmMyIn0=','2018-12-25 01:33:30.957791');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_in_country`
--

DROP TABLE IF EXISTS `login_in_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_in_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_in_country`
--

LOCK TABLES `login_in_country` WRITE;
/*!40000 ALTER TABLE `login_in_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_in_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_in_history`
--

DROP TABLE IF EXISTS `login_in_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_in_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_history` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `startime` datetime(6),
  PRIMARY KEY (`id`),
  KEY `login_in_history_user_id_715321a5_fk_login_in_user_id` (`user_id`),
  CONSTRAINT `login_in_history_user_id_715321a5_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_in_history`
--

LOCK TABLES `login_in_history` WRITE;
/*!40000 ALTER TABLE `login_in_history` DISABLE KEYS */;
INSERT INTO `login_in_history` VALUES (3,314,9,'2018-12-11 09:29:02.934743'),(4,314,9,'2018-12-11 09:29:08.380413'),(5,313,9,'2018-12-11 09:37:38.835143'),(6,313,9,'2018-12-11 09:39:35.896730'),(7,314,2,'2018-12-11 10:11:49.617288');
/*!40000 ALTER TABLE `login_in_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_in_user`
--

DROP TABLE IF EXISTS `login_in_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_in_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `login_time` datetime(6),
  `register_time` datetime(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `login_in_user_country_id_612709e2_fk_login_in_country_id` (`country_id`),
  CONSTRAINT `login_in_user_country_id_612709e2_fk_login_in_country_id` FOREIGN KEY (`country_id`) REFERENCES `login_in_country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_in_user`
--

LOCK TABLES `login_in_user` WRITE;
/*!40000 ALTER TABLE `login_in_user` DISABLE KEYS */;
INSERT INTO `login_in_user` VALUES (1,'pbkdf2_sha256$36000$LDadcJbO3Z26$8okwaTyz1b5cbkEevJDrqFXfkxyi2blaWJw4RVbzajs=','2018-12-11 08:02:36.500639',1,'wuwukai','','',1,1,'2018-12-08 08:02:56.823666','','dadsa@da.com',NULL,NULL,NULL),(2,'w463313603',NULL,0,'wuwukai02','','',0,1,'2018-12-08 08:10:59.132968','','dada@das.com',NULL,NULL,NULL),(3,'123456',NULL,0,'zxcv','','',0,1,'2018-12-10 10:26:03.383027','','ds@qwe.com',NULL,NULL,NULL),(4,'12345',NULL,0,'15565555632','','',0,1,'2018-12-10 11:22:44.987254','','2272218544@qq.com',NULL,NULL,NULL),(5,'123456789',NULL,0,'123456','','',0,1,'2018-12-10 11:25:42.687035','','123@163.com',NULL,NULL,NULL),(7,'123456',NULL,0,'ligang123','','',0,1,'2018-12-10 11:31:18.138477','','806334810@qq.com',NULL,NULL,NULL),(8,'123456',NULL,0,'1831001200110','','',0,1,'2018-12-10 11:37:08.985099','','18390927206@163.com',NULL,NULL,NULL),(9,'w463313603',NULL,0,'杨超越','','',0,1,'2018-12-11 01:28:14.368611','','1286345540@qq.com',NULL,NULL,NULL),(10,'w463313603',NULL,0,'杨超越01','','',0,1,'2018-12-11 01:33:04.209835','','dasds@dsa.com',NULL,NULL,NULL),(11,'w463313603',NULL,0,'杨超越02','','',0,1,'2018-12-11 01:34:20.910536','','dasasdas@asdsa.com',NULL,NULL,NULL);
/*!40000 ALTER TABLE `login_in_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_in_user_groups`
--

DROP TABLE IF EXISTS `login_in_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_in_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_in_user_groups_user_id_group_id_453edb16_uniq` (`user_id`,`group_id`),
  KEY `login_in_user_groups_group_id_255d8eb2_fk_auth_group_id` (`group_id`),
  CONSTRAINT `login_in_user_groups_group_id_255d8eb2_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `login_in_user_groups_user_id_8b819634_fk_login_in_user_id` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_in_user_groups`
--

LOCK TABLES `login_in_user_groups` WRITE;
/*!40000 ALTER TABLE `login_in_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_in_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_in_user_user_permissions`
--

DROP TABLE IF EXISTS `login_in_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_in_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_in_user_user_permi_user_id_permission_id_f3bba9bc_uniq` (`user_id`,`permission_id`),
  KEY `login_in_user_user_p_permission_id_4635e8c9_fk_auth_perm` (`permission_id`),
  CONSTRAINT `login_in_user_user_p_permission_id_4635e8c9_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `login_in_user_user_p_user_id_416aa381_fk_login_in_` FOREIGN KEY (`user_id`) REFERENCES `login_in_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_in_user_user_permissions`
--

LOCK TABLES `login_in_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `login_in_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_in_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-11 20:52:19
