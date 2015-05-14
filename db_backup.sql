-- MySQL dump 10.13  Distrib 5.5.42, for Linux (x86_64)
--
-- Host: localhost    Database: tori
-- ------------------------------------------------------
-- Server version	5.5.42

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
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_6b0d3f60435cd057_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_2eb65ce306000c04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_154a8f02c3f7d67f_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add character',7,'add_character'),(20,'Can change character',7,'change_character'),(21,'Can delete character',7,'delete_character'),(22,'Can add consonant',8,'add_consonant'),(23,'Can change consonant',8,'change_consonant'),(24,'Can delete consonant',8,'delete_consonant'),(25,'Can add vowel',9,'add_vowel'),(26,'Can change vowel',9,'change_vowel'),(27,'Can delete vowel',9,'delete_vowel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_e8701ad4` (`user_id`),
  KEY `auth_user_groups_0e939a4f` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_1a49ceb8991d5ff7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_697d296490812470_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`),
  KEY `auth_user_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_74371a2a6c8ba8f6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_4435ac8ae5b47fd0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `character` (
  `char_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `key_binding` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `english` tinyint(1) NOT NULL,
  PRIMARY KEY (`char_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` VALUES (1,'open back unround','&#593;','a',1),(2,'open-mid reduced','&#592;','a',0),(3,'open back rounded','&#594;','a',0),(4,'open front unround','&#230;','a',1),(5,'vd bilabial implosive','&#595;','b',0),(6,'vd bilabial trill','&#665;','b',0),(7,'vd bilabial fricative','&#946;','b',0),(8,'open-mid back round','&#596;','o',1),(9,'vl alveopalatal fricative','&#597;','c',0),(10,'vl palatal fricative','&#231;','c',0),(11,'vd alveolar implosive','&#599;','d',0),(12,'vd retroflex stop','&#598;','d',0),(13,'vd dental fricative','&#240;','t',1),(14,'vd alveolar affricate','&#676;','j',1),(15,'schwa','&#601;','e',1),(16,'close-mid reduced','&#600;','e',0),(17,'rhotacized schwa','&#602;','e',1),(18,'open-mid front unround','&#603;','e',1),(19,'open-mid central','&#604;','e',0),(20,'rhotacized open-mid central','&#605;','e',1),(31,'open-mid central round','&#606;','e',0),(32,'vd palatal stop','&#607;','f',0),(33,'vd palatal implosive','&#644;','f',0),(34,'vd velar stop','&#609;','g',1),(35,'vd velar implosive','&#608;','g',0),(36,'vd uvular stop','&#610;','g',0),(37,'vd uvular implosive','&#667;','g',0),(38,'vd glottal fricative','&#614;','h',0),(39,'vl alveo-uvular fricative','&#615;','h',0),(40,'vl pharyngeal fricative','&#295;','h',0),(41,'labial-palatal approximant','&#613;','h',0),(42,'vl epiglottal fricative','&#668;','h',0),(43,'close central unround','&#616;','i',1),(44,'close front unround lax','&#618;','i',1),(45,'vd palatal fricative','&#669;','j',0),(46,'vd retroflex lateral','&#621;','l',0),(47,'vl alveolar lateral fricative','&#620;','l',0),(48,'velarized vd alveolar lateral','&#619;','l',1),(49,'vd alveolar lateral fricative','&#622;','l',0),(50,'vd velar lateral','&#671;','l',0),(51,'labiodental nasal','&#625;','m',0),(52,'close back unround','&#623;','m',0),(53,'velar approximant','&#624;','m',0),(54,'velar nasal','&#331;','n',1),(55,'retroflex nasal','&#627;','n',0),(56,'palatal nasal','&#626;','n',0),(57,'uvular nasal','&#628;','n',0),(58,'front close-mid round','&#248;','o',0),(59,'round schwa','&#629;','o',0),(60,'vl bilabial fricative','&#632;','o',0),(61,'vl dental fricative','&#952;','t',1),(62,'front open-mid round','&#339;','o',0),(63,'front open round','&#630;','o',0),(64,'bilabial click','&#664;','o',0),(65,'vd alveolar approximant','&#633;','r',1),(66,'vd alveolar later flap','&#634;','r',0),(67,'vd alveolar tap','&#638;','d',1),(68,'vd retroflex approximant','&#635','r',0),(69,'vd uvular trill','&#640;','r',0),(70,'vd uvular fricative','&#641;','r',0),(71,'vd retroflex flap','&#637;','r',0),(72,'vl retroflex fricative','&#642;','s',0),(73,'vl postalveolar fricative','&#643;','s',1),(74,'vl retroflex stop','&#648;','t',0),(75,'vl postalveolar affricate','&#679;','s',1),(76,'close central round','&#649;','u',0),(77,'close back round lax','&#650;','u',1),(78,'vd labiodental approximant','&#651;','v',0),(79,'vd labiodental flap','&#11377;','v',0),(80,'open-mid back unround','&#652;','u',1),(81,'vd velar fricative','&#611;','v',0),(82,'close-mid back unround','&#612;',NULL,0),(83,'vl labio-velar fricative','&#653;','w',1),(84,'vl uvular fricative','&#967;','x',0),(85,'vd palatal lateral','&#654;','y',0),(86,'close front round lax','&#655;','y',0),(87,'vd alveo-palatal fricative','&#657;','z',0),(88,'vd retroflex fricative','&#656;','z',0),(89,'vd postalveolar fricative','&#658;','j',1),(90,'vl glottal stop','&#660;','h',1),(91,'vd epiglottal stop','&#673;',NULL,0),(92,'vd pharyngeal fricative','&#661;',NULL,0),(93,'vd epiglottal fricative','&#674;',NULL,0),(94,'dental click','&#448;',NULL,0),(95,'alveolar lateral click','&#449;',NULL,0),(96,'alveolar click','&#450;',NULL,0),(97,'retroflex click','&#451;',NULL,0),(98,'stress mark - primary','&#712;','\'',1),(99,'stress mark - secondary','&#716;',',',1),(100,'length mark','&#720;',':',1),(101,'half-length mark','&#721;',':',1),(102,'aspiration','&#688;','h',1),(103,'palatalization','&#690;','j',1),(104,'labialization','&#695;','w',1),(105,'velarization','&#736;','v',1),(106,'pharyngealization','&#740;',NULL,1),(107,'rhotacized','&#734;','r',1),(108,'voiceless','&#805;',NULL,1),(109,'voiceless_above','&#778;',NULL,1),(110,'breathy voice','&#804;',NULL,1),(111,'dentalized','&#810;',NULL,1),(112,'voiced','&#812;',NULL,1),(113,'creaky voice','&#816;',NULL,1),(114,'more rounded','&#825;',NULL,1),(115,'less rounded','&#796;',NULL,1),(116,'nasalized','&#771;',NULL,1),(117,'syllabic','&#809;',NULL,1),(118,'non-syllabic','&#815;',NULL,1),(119,'tie bar below','&#860;','-',1),(120,'tie bar above','&#865;','-',1),(121,'becomes arrow','&#8594;',NULL,1),(122,'downstep','&#8595;',NULL,1),(123,'upstep','&#8593;',NULL,1),(124,'global rise','&#8599;',NULL,1),(125,'global fall','&#8600;',NULL,1),(126,'unreleased','&#794;','/',1);
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consonant`
--

DROP TABLE IF EXISTS `consonant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consonant` (
  `character_ptr_id` int(11) NOT NULL,
  `consonant_id` int(11) NOT NULL AUTO_INCREMENT,
  `place_OA` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `manner_OA` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `voiced` tinyint(1) NOT NULL,
  `nasal` tinyint(1) NOT NULL,
  PRIMARY KEY (`consonant_id`),
  UNIQUE KEY `character_ptr_id` (`character_ptr_id`),
  CONSTRAINT `character_ptr_id_refs_char_id_f3aca99f` FOREIGN KEY (`character_ptr_id`) REFERENCES `character` (`char_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consonant`
--

LOCK TABLES `consonant` WRITE;
/*!40000 ALTER TABLE `consonant` DISABLE KEYS */;
INSERT INTO `consonant` VALUES (5,1,'bilabial','implosive',1,0),(6,2,'bilabial','trill',1,0),(7,3,'bilabial','fricative',1,0),(9,4,'alveo-palatal','fricative',0,0),(10,5,'palatal','fricative',0,0),(11,6,'alveolar','implosive',1,0),(12,7,'retroflex','stop',1,0),(13,8,'dental','fricative',1,0),(14,9,'alveolar','affricate',1,0),(32,10,'palatal','stop',1,0),(33,11,'palatal','implosive',1,0),(34,12,'velar','stop',1,0),(35,13,'velar','implosive',1,0),(36,14,'uvular','stop',1,0),(37,15,'uvular','implosive',1,0),(38,16,'glottal','fricative',1,0),(39,17,'alveo-uvular','fricative',0,0),(40,18,'pharyngeal','fricative',0,0),(41,19,'labial-palatal','approximant',1,0),(42,20,'epiglottal','fricative',0,0),(45,21,'palatal','fricative',1,0),(46,22,'retroflex','approximant',1,0),(47,23,'alveolar','fricative',0,0),(48,24,'alveolar','approximant',1,0),(49,25,'alveolar','fricative',1,0),(50,26,'velar','approximant',1,0),(51,27,'labiodental','stop',1,1),(53,28,'velar','approximant',1,0),(54,29,'velar','stop',1,1),(55,30,'retroflex','stop',1,1),(56,31,'palatal','stop',1,1),(57,32,'uvular','stop',1,1),(60,33,'bilabial','fricative',0,0),(61,34,'dental','fricative',0,0),(64,35,'bilabial','click',0,0),(65,36,'alveolar','approximant',1,0),(66,37,'alveolar','flap',1,0),(67,38,'alveolar','tap',1,0),(68,39,'retroflex','approximant',1,0),(69,40,'uvular','trill',1,0),(70,41,'uvular','fricative',1,0),(71,42,'retroflex','flap',1,0),(72,43,'retroflex','fricative',0,0),(73,44,'postalbeolar','fricative',0,0),(74,45,'retroflex','stop',0,0),(75,46,'postalveolar','affricate',0,0),(78,47,'labiodental','approximant',1,0),(79,48,'labiodental','flap',1,0),(81,49,'velar','fricative',1,0),(83,50,'labio-velar','fricative',0,0),(87,51,'alveo-palatal','fricative',1,0),(88,52,'retroflex','fricative',1,0),(89,53,'postalveolar','fricative',1,0),(90,54,'glottal','stop',0,0),(91,55,'epiglottal','stop',1,0),(92,56,'pharyngeal','fricative',1,0),(93,57,'epiglottal','fricative',1,0),(94,58,'dental','click',0,0),(95,59,'alveolar','click',0,0),(96,60,'alveolar','click',0,0),(97,61,'retroflex','click',0,0),(84,71,'uvular','fricative',0,0),(85,72,'palatal','approximant',1,0);
/*!40000 ALTER TABLE `consonant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_e4a347f3c85911d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_3704d6b40b97563a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_19439a8606fa38dc_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'session','sessions','session'),(7,'character','ipa','character'),(8,'consonant','ipa','consonant'),(9,'vowel','ipa','vowel');
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
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-03-25 04:32:56'),(2,'auth','0001_initial','2015-03-25 04:32:58'),(3,'admin','0001_initial','2015-03-25 04:32:59'),(4,'sessions','0001_initial','2015-03-25 04:33:00');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vowel`
--

DROP TABLE IF EXISTS `vowel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vowel` (
  `character_ptr_id` int(11) NOT NULL,
  `vowel_id` int(11) NOT NULL AUTO_INCREMENT,
  `height` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `frontness` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `roundness` tinyint(1) NOT NULL,
  `tense` tinyint(1) NOT NULL,
  PRIMARY KEY (`vowel_id`),
  UNIQUE KEY `character_ptr_id` (`character_ptr_id`),
  CONSTRAINT `character_ptr_id_refs_char_id_f7113ff9` FOREIGN KEY (`character_ptr_id`) REFERENCES `character` (`char_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vowel`
--

LOCK TABLES `vowel` WRITE;
/*!40000 ALTER TABLE `vowel` DISABLE KEYS */;
INSERT INTO `vowel` VALUES (1,1,'open','back',0,0),(2,2,'open-mid','central',0,0),(3,3,'open','back',1,0),(4,4,'open','front',0,0),(15,5,'mid','central',0,0),(16,6,'close-mid','central',0,0),(17,7,'mid','central',0,0),(18,8,'open-mid','front',0,0),(19,9,'open-mid','central',0,0),(20,10,'open-mid','cenral',0,0),(31,11,'open-mid','central',1,0),(43,12,'close','central',0,0),(44,13,'close','front',0,0),(52,14,'close','back',0,0),(58,15,'close-mid','front',1,0),(59,16,'mid','central',1,0),(62,17,'open-mid','front',1,0),(63,18,'open','front',1,0),(76,19,'close','central',1,0),(77,20,'close','back',1,0),(80,21,'open-mid','back',0,0),(82,22,'close-mid','back',0,0),(86,23,'close','front',1,0),(8,24,'open-mid','back',1,0);
/*!40000 ALTER TABLE `vowel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 21:20:20
