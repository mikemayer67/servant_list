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
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `userid` varchar(12) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `admin` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES ('aalfano','-','Arlene Alfano',0,'arlenepalfano@verizon.net','301-740-5862'),('akeller','-','Amos Keller',0,'akeller2002b@yahoo.com','240-620-7734'),('alipe','-','Anne Lipe',0,'awtelipe@earthlink.net','301-253-2408'),('amayer','-','Anna Mayer',0,'dancingdolphin2000@vmwishes.com','301-869-7127'),('amcmichael','-','Andrew McMichael',0,'bobnmel@netzero.net','301-869-1484'),('anorfolk','-','Ann Norfolk',0,'amnorf@yahoo.com','240-477-8382'),('apressley','-','Annie Pressley',0,'pressley.annie@yahoo.com','240-454-1830'),('asmith','-','Asya Smith',0,'atanaskag@yahoo.com','301-869-7684'),('aspoehr','-','Andy Spoehr-Labutta',0,'a.spoehr@yahoo.com','240-205-9509'),('aticona','-','Albert Ticona',0,'albert.elboliviano@gmail.com','301-987-7973'),('badams','-','Bob Adams',0,'Adams7952@comcast.net','301-987-6936'),('bandersen','-','Bob Andersen',0,'reandersen0306@verizon.net','301-253-1726'),('baustin','-','Brenden Austin',0,'brendenaustin@verizon.net','301-515-9990'),('bduru','-','Bridget Duru',0,'ndumbalo@gmail.com','301-527-6317'),('bharner','-','Barbara Harner',0,'barbaraharner@me.com','301-963-6236'),('bhozapfel','-','Barbara Holzapfel',0,'','301-977-4091'),('bkeller','-','Beatrice Keller',0,'','240-620-7734'),('bmcmichael','-','Bob McMichael',0,'bobnmel@netzero.net','301-869-1484'),('bminnier','-','Barbara Minnier',0,'barbminnier@verizon.net','301-869-5374'),('ccasson','-','Chris Casson',0,'','240-263-8539'),('ceater','-','Chuck Eater',0,'ceater@comcast.net','301-926-4446'),('cgraf','-','Connie Graf',0,'cqgraf@yahoo.com','301-253-5180'),('ckuchinsky','-','Cathy Kuchinsky',0,'mckuchinsky@gmail.com','301-519-2343'),('clepolu','-','Clara Lepolu',0,'','301-793-1955'),('cstern','-','Cristina Stern',0,'stercri@verizon.net','301-461-4388'),('devans','-','Don Evans',0,'dlevans67@yahoo.com','352-870-6072'),('dfoge','-','Doreen Foge',0,'dffoge@gmail.com','301-977-4082'),('dgearing','-','Dave Gearing',0,'bravedave1@verizon.net','301-869-5796'),('dgerald','-','Dorothy Gerald',0,'','301-977-4250'),('dlarrabee','-','Dave Larrabee',0,'larrabeedv@comcast.net','703-963-7496'),('dsmith','-','Darren Smith',0,'','301-869-7684'),('dwalker','-','Dick Walker',0,'rwalker@path.org','240-477-8866'),('eadams','-','Erica Adams',0,'Adams7952@comcast.net','301-987-6936'),('edodge','-','Erin Dodge',0,'Erin_H_Dodge@mcpsmd.org','240-338-2940'),('eelinewinga','-','Edima Elinewinga',0,'eelinewinga@unfoundation.org','301-527-6317'),('egraf','-','Ernie Graf',0,'ebills1960@yahoo.com','301-253-5180'),('ekeller','-','Esther Keller',0,'ebjdaboi@yahoo.com','240-620-7734'),('emcmichael','-','Ellie McMichael',0,'bobnmel@netzero.net','301-869-1484'),('eshannon','-','Elizabeth Shannon',0,'elizabethbshannon@gmail.com','516-680-2511'),('ffoge','-','Frank Foge',0,'fmf925@yahoo.com','301-977-4082'),('fndumbalo','-','Frank Ndumbaloi',0,'ndumbalo@gmail.com','301-527-6317'),('glepolu','-','Garmai Lepolu',0,'garmai12@yahoo.com','240-413-1114'),('hwalker','-','Hope Walker',0,'hopewalk04@hotmail.com','240-477-8866'),('iharman','-','Inge Harman',0,'ingeharman@gmail.com','301-838-0360'),('imartin','-','Isaiah Martin',0,'','301-977-4250'),('imyles','-','Ian Myles',0,'','301-933-3024'),('jaarons','-','Joanne Aarons',0,'snicklefuss@verizon.net','301-598-6448'),('jabu','-','Joyce Abu',0,'joycemaige@yahoo.com','240-751-3183'),('jaseverynse','-','Jackie Severynse',0,'JacquelineSeverynse@westat.com','301-251-0639'),('jaustin','-','Jim Austin',0,'canine3@verizon.net','301-515-9990'),('jbackus','-','Joyce Backus',0,'jebbackus@comcast.net','301-963-0438'),('jdirks','-','John Dirks',0,'jdirks50@verizon.net','301-528-4612'),('jeastlack','-','Joann Eastlack',0,'JDeastlackE@yahoo.com','301-926-2088'),('jeater','-','Joanne Eater',0,'ceater@comcast.net','301-926-4446'),('jgabe','-','Jeff Gabe',0,'','240-413-1114'),('jgarner','-','Jerry Garner',0,'geraldgarner17@comcast.net','240-731-9026'),('jjohnson','-','Jo Johnson',0,'jospiano@verizon.net','301-253-2077'),('jkeller','-','Jerry Keller',0,'','240-620-7734'),('jlessen','-','Joe Lessen',0,'jlessen@verizon.net','301-916-1838'),('jmartin','-','Jericho Martin',0,'','301-977-4250'),('jmyles','-','Jennifer Myles',0,'jgraf@cc.nih.gov','301-933-3024'),('jndumbalo','-','Joel Ndumbaloi',0,'ndumbalo@gmail.com','301-527-6317'),('joseverynse','-','John Severynse',0,'JS@usp.org','301-251-0639'),('jperry','-','Jan Perry',0,'janmp@verizon.net','301-253-5507'),('jsaxton','-','June Saxton',0,'jdsaxton@verizon.net','240-676-9173'),('kaustin','-','Kayleigh Austin',0,'kayleighaustin@verizon.net','301-515-9990'),('kkersey','-','Kathy Kersey',0,'kkerz1@gmail.com','240-252-9085'),('kkoehler','-','Kwan Koehler',0,'kwanmk@yahoo.com','301-208-0256'),('klawson','-','Karin Lawson',0,'Karin_Lawson@hotmail.com','301-424-3039'),('kpainter','-','Kim Painter',0,'painterkm@comcast.net','301-948-0195'),('kpalmer','-','Kasia Palmer',0,'kpal123@verizon.net','240-631-9180'),('llacross','-','Leon LaCross',0,'scott.l.lacross@gmail.com','240-277-0162'),('llepolu','-','Lorpu Lepolu',0,'','240-413-1114'),('lpool','-','Lorna Pool',0,'lcpool24@yahoo.com','301-916-7060'),('majasper','-','MaryAnn Jasper',0,'maryannjasper@verizon.net','301-540-5173'),('malfano','-','Matthew Alfano',0,'majalfano@comcast.net','301-926-8679'),('maustin','-','Michelle Austin',0,'mlaustin1@verizon.net','301-515-9990'),('mevans','-','Melissa Evans',0,'dmevans97@yahoo.com','352-870-6072'),('mievans','-','Michael Evans',0,'evans.michael.p@gmail.com','520-603-4349'),('mkabemba','-','Marcy Kabemba',0,'MarcyKabemba@gmail.com','301-963-2322'),('mkuchinsky','-','Mike Kuchinsky',0,'mckuchinsky@gmail.com','301-519-2343'),('mmayer','-','Mike Mayer',1,'mikemayer67@vmwishes.com','301-869-7127'),('mmcclain','-','Marjorie McClain',0,'marjorie.mcclain@nist.gov','301-869-3354'),('mmcmichael','-','Melanie McMichael',0,'bobnmel@netzero.net','301-869-1484'),('nlang','-','Nancy Lang',0,'nansoise@gmail.com','301-990-0869'),('nmeyer','-','Nathan Meyer',0,'kaokaousa@gmail.com','301-972-2799'),('pandersen','-','Bob Andersen',0,'patsdeeds@verizon.net','301-253-1726'),('pbender','-','Paul Bender',0,'pgbender@verizon.net','301-540-5173'),('pbrody','-','Polly Brody',0,'smplpol@hotmail.com','301-717-0480'),('pferry','-','Patty Ferry',0,'pferry@natgeotv.com','301-977-9636'),('phuson','-','Patsy Huson',0,'PatHuson220@gmail.com','301-987-6883'),('pmayer','-','Paul Mayer',0,'paul@vmwishes.com','301-869-7127'),('rbackus','-','Ron Backus',0,'rbackus@comcast.net','301-963-0438'),('rlessen','-','Romona Lessen',0,'Ramona.lessen@outlook.com','301-916-1838'),('rlurix','-','Richard Lurix',0,'rich_lurix@yahoo.com','240-552-0915'),('rpalmer','-','Rob Palmer',0,'rjpjr@verizon.net','240-631-9180'),('rpeterson','-','Robin Peterson',0,'rpeterson@llinvestmentsllc.com','240-672-5671'),('rrasnake','-','Roger Rasnake',0,'rrasnake@gmail.com','301-838-0360'),('rshannon','-','Randy Shannon',0,'randyshannon@comcast.net','516-680-2511'),('sbastien','-','Sarah Bastien',0,'sarah.w.bastien@gmail.com','301-704-1499'),('sbender','-','Sarah Bender',0,'maryannjasper@verizon.net','301-540-5173'),('sdangelo','-','Sandy D\'Angelo',0,'sandy@quilt.net','301-977-5052'),('sdelmage','-','Shirley Delmage',0,'','301-216-5908'),('sjgarvey','-','Steve Garvey',0,'sjgarvey@comcast.net','301-740-2665'),('skuester','-','Scott Kuester',0,'scott_kuester@hotmail.com','301-802-4687'),('slake','-','Sylvia Lake',0,'slakefpe@aol.com','240-477-4730'),('sstern','-','Saul Stern',0,'stercri@verizon.net','301-461-4388'),('szazanis','-','Stephanie Zazanis',0,'szazanis11@simons-rock.edu','240-720-4280'),('teastlack','-','Tom Eastlack',0,'tom.eastlack@gmail.com','301-926-2088'),('tfehner_xx','-','Terry Fehner (him)',0,'terryfe@verizon.net','301-540-3497'),('tfehner_xy','-','Terry Fehner (her)',0,'terryfe@verizon.net','301-540-3497'),('tkerlavage','-','Tony Kerlavage',0,'arkerlav@me.com','301-963-6236'),('tlawson','-','Tom Lawson',0,'','301-424-3039'),('tlipe','-','Tom Lipe',0,'awtelipe@verizon.net','301-253-2408'),('ularrabee','-','Uschi Larrabee',0,'larrabeeu@yahoo.com','240-632-2495'),('vmayer','-','Valerie Mayer',0,'valerie@vmwishes.com','301-869-7127'),('vtoelle','-','Vern Toelle',0,'vernt@rcn.com','301-977-8334'),('wjgarvey','-','Wilma Garvey',0,'wcgarvey@comcast.net','301-740-2665'),('zlabutta','-','Zach Spoehr-Labutta',0,'zach.labutta@my.wheaton.edu','301-452-2189');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-09-01 17:21:12
