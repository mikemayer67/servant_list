CREATE DATABASE  IF NOT EXISTS `ctsServantList` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ctsServantList`;
-- MySQL dump 10.13  Distrib 5.6.11, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: ctsServantList
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers` (
  `userid` varchar(12) NOT NULL,
  `list` varchar(12) NOT NULL,
  PRIMARY KEY (`userid`,`list`),
  KEY `fk_volunteers_list_idx` (`list`),
  CONSTRAINT `fk_volunteers_list` FOREIGN KEY (`list`) REFERENCES `lists` (`list`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fl_volunteers_userid` FOREIGN KEY (`userid`) REFERENCES `people` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
INSERT INTO `volunteers` VALUES ('amayer','acolyte'),('bharner','acolyte'),('dlarrabee','acolyte'),('ffoge','acolyte'),('jeater','acolyte'),('jmartin','acolyte'),('kkersey','acolyte'),('mmayer','acolyte'),('mmcclain','acolyte'),('pbender','acolyte'),('pbrody','acolyte'),('pmayer','acolyte'),('rpalmer','acolyte'),('rrasnake','acolyte'),('sbastien','acolyte'),('sbender','acolyte'),('teastlack','acolyte'),('tlipe','acolyte'),('vtoelle','acolyte'),('wjgarvey','acolyte'),('amayer','altar'),('bharner','altar'),('eshannon','altar'),('jeastlack','altar'),('jeater','altar'),('kpalmer','altar'),('sdangelo','altar'),('tlipe','altar'),('aalfano','bread'),('amayer','bread'),('ceater','bread'),('dlarrabee','bread'),('fndumbalo','bread'),('iharman','bread'),('jaseverynse','bread'),('jbackus','bread'),('jeastlack','bread'),('jeater','bread'),('joseverynse','bread'),('kkersey','bread'),('pandersen','bread'),('rpalmer','bread'),('vmayer','bread'),('wjgarvey','bread'),('akeller','communion'),('bharner','communion'),('ceater','communion'),('egraf','communion'),('ekeller','communion'),('eshannon','communion'),('jeater','communion'),('jperry','communion'),('kkersey','communion'),('llacross','communion'),('mmayer','communion'),('rpalmer','communion'),('sbastien','communion'),('sjgarvey','communion'),('tkerlavage','communion'),('aalfano','greeter'),('akeller','greeter'),('bmcMichael','greeter'),('cGraf','greeter'),('ckuchinsky','greeter'),('dlarrabee','greeter'),('egraf','greeter'),('ekeller','greeter'),('eshannon','greeter'),('fndumbalo','greeter'),('iharman','greeter'),('jbackus','greeter'),('jeastlack','greeter'),('lpool','greeter'),('mmayer','greeter'),('rrasnake','greeter'),('sbastien','greeter'),('teastlack','greeter'),('tkerlavage','greeter'),('bduru','hospitality'),('ceater','hospitality'),('dlarrabee','hospitality'),('eshannon','hospitality'),('fndumbalo','hospitality'),('iharman','hospitality'),('jbackus','hospitality'),('jeastlack','hospitality'),('jeater','hospitality'),('kkersey','hospitality'),('majasper','hospitality'),('mmcMichael','hospitality'),('teastlack','hospitality'),('vmayer','hospitality'),('wjgarvey','hospitality'),('bharner','linens'),('eshannon','linens'),('jeastlack','linens'),('pandersen','linens'),('sdangelo','linens'),('wjgarvey','linens'),('amayer','nursery'),('amcMichael','nursery'),('bduru','nursery'),('ckuchinsky','nursery'),('jbackus','nursery'),('jeastlack','nursery'),('lpool','nursery'),('mmcMichael','nursery'),('sbastien','nursery'),('apressley','prayer'),('dlarrabee','prayer'),('egraf','prayer'),('ffoge','prayer'),('iharman','prayer'),('jbackus','prayer'),('jeater','prayer'),('pandersen','prayer'),('pbrody','prayer'),('rrasnake','prayer'),('sbastien','prayer'),('teastlack','prayer'),('tkerlavage','prayer'),('vtoelle','prayer'),('akeller','reader'),('apressley','reader'),('bharner','reader'),('ceater','reader'),('eadams','reader'),('egraf','reader'),('eshannon','reader'),('ffoge','reader'),('iharman','reader'),('jbackus','reader'),('jeastlack','reader'),('jeater','reader'),('jmartin','reader'),('joseverynse','reader'),('jperry','reader'),('mmayer','reader'),('mmcClain','reader'),('mmcMichael','reader'),('pandersen','reader'),('pbrody','reader'),('rbackus','reader'),('rpalmer','reader'),('rrasnake','reader'),('sbastien','reader'),('teastlack','reader'),('tkerlavage','reader'),('vtoelle','reader'),('akeller','usher'),('apressley','usher'),('ceater','usher'),('dfoge','usher'),('dlarrabee','usher'),('joseverynse','usher'),('mmayer','usher'),('rbackus','usher'),('rrasnake','usher'),('sbastien','usher'),('sjgarvey','usher'),('teastlack','usher'),('tkerlavage','usher'),('vtoelle','usher');
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-01 17:21:13
