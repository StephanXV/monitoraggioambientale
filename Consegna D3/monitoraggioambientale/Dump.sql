CREATE DATABASE  IF NOT EXISTS `monitoraggio` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `monitoraggio`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: monitoraggio
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `citta`
--

DROP TABLE IF EXISTS `citta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `citta` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(16) NOT NULL,
  `ID_gestore` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `gestore_citta` (`ID_gestore`),
  CONSTRAINT `gestore_citta` FOREIGN KEY (`ID_gestore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `citta`
--

LOCK TABLES `citta` WRITE;
/*!40000 ALTER TABLE `citta` DISABLE KEYS */;
INSERT INTO `citta` VALUES (1,'L\'Aquila',25);
/*!40000 ALTER TABLE `citta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edificio`
--

DROP TABLE IF EXISTS `edificio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edificio` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `ID_gestore` int(10) unsigned NOT NULL,
  `ID_Zona` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `gestore_Edificio` (`ID_gestore`),
  KEY `zona_Edificio` (`ID_Zona`),
  CONSTRAINT `gestore_Edificio` FOREIGN KEY (`ID_gestore`) REFERENCES `utente` (`id`),
  CONSTRAINT `zona_Edificio` FOREIGN KEY (`ID_Zona`) REFERENCES `zona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edificio`
--

LOCK TABLES `edificio` WRITE;
/*!40000 ALTER TABLE `edificio` DISABLE KEYS */;
INSERT INTO `edificio` VALUES (1,'edificio1',1,1),(2,'edificio2',2,1),(3,'edificio3',3,1),(4,'edificio4',4,1),(5,'edificio5',5,1),(6,'edificio6',6,2),(7,'edificio7',7,2),(8,'edificio8',8,2),(9,'edificio9',9,2),(10,'edificio10',10,2),(11,'edificio11',11,3),(12,'edificio12',12,3),(13,'edificio13',13,3),(14,'edificio14',14,3),(15,'edificio15',15,3),(16,'edificio16',16,4),(17,'edificio17',17,4),(18,'edificio18',18,4),(19,'edificio19',19,4),(20,'edificio20',20,4);
/*!40000 ALTER TABLE `edificio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensore`
--

DROP TABLE IF EXISTS `sensore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sensore` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codice` varchar(16) NOT NULL,
  `tipo` enum('umidita','pressione','luminosita','temperatura','fumo') NOT NULL,
  `stato` int(1) unsigned NOT NULL,
  `sending_time` mediumtext NOT NULL,
  `ID_Stanza` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `codice` (`codice`),
  KEY `Stanza_sensore` (`ID_Stanza`),
  CONSTRAINT `Stanza_sensore` FOREIGN KEY (`ID_Stanza`) REFERENCES `stanza` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensore`
--

LOCK TABLES `sensore` WRITE;
/*!40000 ALTER TABLE `sensore` DISABLE KEYS */;
INSERT INTO `sensore` VALUES (1,'S1','temperatura',1,'60000',1),(2,'S2','pressione',1,'120000',1),(3,'S3','luminosita',1,'300000',1),(4,'S4','umidita',1,'90000',1),(5,'S5','temperatura',1,'60000',2),(6,'S6','pressione',1,'120000',2),(7,'S7','luminosita',1,'300000',2),(8,'S8','umidita',1,'90000',2),(9,'S9','temperatura',1,'60000',3),(10,'S10','pressione',1,'120000',3),(11,'S11','luminosita',1,'300000',3),(12,'S12','umidita',1,'90000',3),(13,'S13','temperatura',1,'60000',4),(14,'S14','pressione',1,'120000',4),(15,'S15','luminosita',1,'300000',4),(16,'S16','umidita',1,'90000',4),(17,'S17','temperatura',1,'60000',5),(18,'S18','pressione',1,'120000',5),(19,'S19','luminosita',1,'300000',5),(20,'S20','umidita',1,'90000',5),(21,'S21','temperatura',1,'60000',6),(22,'S22','pressione',1,'120000',6),(23,'S23','luminosita',1,'300000',6),(24,'S24','umidita',1,'90000',6),(25,'S25','temperatura',1,'60000',7),(26,'S26','pressione',1,'120000',7),(27,'S27','luminosita',1,'300000',7),(28,'S28','umidita',1,'90000',7),(29,'S29','temperatura',1,'60000',8),(30,'S30','pressione',1,'120000',8),(31,'S31','luminosita',1,'300000',8),(32,'S32','umidita',1,'90000',8),(33,'S33','temperatura',1,'60000',9),(34,'S34','pressione',1,'120000',9),(35,'S35','luminosita',1,'300000',9),(36,'S36','umidita',1,'90000',9),(37,'S37','temperatura',1,'60000',10),(38,'S38','pressione',1,'120000',10),(39,'S39','luminosita',1,'300000',10),(40,'S40','umidita',1,'90000',10),(41,'S41','temperatura',1,'60000',11),(42,'S42','pressione',1,'120000',11),(43,'S43','luminosita',1,'300000',11),(44,'S44','umidita',1,'90000',11),(45,'S45','temperatura',1,'60000',12),(46,'S46','pressione',1,'120000',12),(47,'S47','luminosita',1,'300000',12),(48,'S48','umidita',1,'90000',12),(49,'S49','temperatura',1,'60000',13),(50,'S50','pressione',1,'120000',13),(51,'S51','luminosita',1,'300000',13),(52,'S52','umidita',1,'90000',13),(53,'S53','temperatura',1,'60000',14),(54,'S54','pressione',1,'120000',14),(55,'S55','luminosita',1,'300000',14),(56,'S56','umidita',1,'90000',14),(57,'S57','temperatura',1,'60000',15),(58,'S58','pressione',1,'120000',15),(59,'S59','luminosita',1,'300000',15),(60,'S60','umidita',1,'90000',15),(61,'S61','temperatura',1,'60000',16),(62,'S62','pressione',1,'120000',16),(63,'S63','luminosita',1,'300000',16),(64,'S64','umidita',1,'90000',16),(65,'S65','temperatura',1,'60000',17),(66,'S66','pressione',1,'120000',17),(67,'S67','luminosita',1,'300000',17),(68,'S68','umidita',1,'90000',17),(69,'S69','temperatura',1,'60000',18),(70,'S70','pressione',1,'120000',18),(71,'S71','luminosita',1,'300000',18),(72,'S72','umidita',1,'90000',18),(73,'S73','temperatura',1,'60000',19),(74,'S74','pressione',1,'120000',19),(75,'S75','luminosita',1,'300000',19),(76,'S76','umidita',1,'90000',19),(77,'S77','temperatura',1,'60000',20),(78,'S78','pressione',1,'120000',20),(79,'S79','luminosita',1,'300000',20),(80,'S80','umidita',1,'90000',20),(81,'S81','temperatura',1,'60000',21),(82,'S82','pressione',1,'120000',21),(83,'S83','luminosita',1,'300000',21),(84,'S84','umidita',1,'90000',21),(85,'S85','temperatura',1,'60000',22),(86,'S86','pressione',1,'120000',22),(87,'S87','luminosita',1,'300000',22),(88,'S88','umidita',1,'90000',22),(89,'S89','temperatura',1,'60000',23),(90,'S90','pressione',1,'120000',23),(91,'S91','luminosita',1,'300000',23),(92,'S92','umidita',1,'90000',23),(93,'S93','temperatura',1,'60000',24),(94,'S94','pressione',1,'120000',24),(95,'S95','luminosita',1,'300000',24),(96,'S96','umidita',1,'90000',24),(97,'S97','temperatura',1,'60000',25),(98,'S98','pressione',1,'120000',25),(99,'S99','luminosita',1,'300000',25),(100,'S100','umidita',1,'90000',25),(101,'S101','temperatura',1,'60000',26),(102,'S102','pressione',1,'120000',26),(103,'S103','luminosita',1,'300000',26),(104,'S104','umidita',1,'90000',26),(105,'S105','temperatura',1,'60000',27),(106,'S106','pressione',1,'120000',27),(107,'S107','luminosita',1,'300000',27),(108,'S108','umidita',1,'90000',27),(109,'S109','temperatura',1,'60000',28),(110,'S110','pressione',1,'120000',28),(111,'S111','luminosita',1,'300000',28),(112,'S112','umidita',1,'90000',28),(113,'S113','temperatura',1,'60000',29),(114,'S114','pressione',1,'120000',29),(115,'S115','luminosita',1,'300000',29),(116,'S116','umidita',1,'90000',29),(117,'S117','temperatura',1,'60000',30),(118,'S118','pressione',1,'120000',30),(119,'S119','luminosita',1,'300000',30),(120,'S120','umidita',1,'90000',30),(121,'S121','temperatura',1,'60000',31),(122,'S122','pressione',1,'120000',31),(123,'S123','luminosita',1,'300000',31),(124,'S124','umidita',1,'90000',31),(125,'S125','temperatura',1,'60000',32),(126,'S126','pressione',1,'120000',32),(127,'S127','luminosita',1,'300000',32),(128,'S128','umidita',1,'90000',32),(129,'S129','temperatura',1,'60000',33),(130,'S130','pressione',1,'120000',33),(131,'S131','luminosita',1,'300000',33),(132,'S132','umidita',1,'90000',33),(133,'S133','temperatura',1,'60000',34),(134,'S134','pressione',1,'120000',34),(135,'S135','luminosita',1,'300000',34),(136,'S136','umidita',1,'90000',34),(137,'S137','temperatura',1,'60000',35),(138,'S138','pressione',1,'120000',35),(139,'S139','luminosita',1,'300000',35),(140,'S140','umidita',1,'90000',35),(141,'S141','temperatura',1,'60000',36),(142,'S142','pressione',1,'120000',36),(143,'S143','luminosita',1,'300000',36),(144,'S144','umidita',1,'90000',36),(145,'S145','temperatura',1,'60000',37),(146,'S146','pressione',1,'120000',37),(147,'S147','luminosita',1,'300000',37),(148,'S148','umidita',1,'90000',37),(149,'S149','temperatura',1,'60000',38),(150,'S150','pressione',1,'120000',38),(151,'S151','luminosita',1,'300000',38),(152,'S152','umidita',1,'90000',38),(153,'S153','temperatura',1,'60000',39),(154,'S154','pressione',1,'120000',39),(155,'S155','luminosita',1,'300000',39),(156,'S156','umidita',1,'90000',39),(157,'S157','temperatura',1,'60000',40),(158,'S158','pressione',1,'120000',40),(159,'S159','luminosita',1,'300000',40),(160,'S160','umidita',1,'90000',40),(161,'S161','temperatura',1,'60000',41),(162,'S162','pressione',1,'120000',41),(163,'S163','luminosita',1,'300000',41),(164,'S164','umidita',1,'90000',41),(165,'S165','temperatura',1,'60000',42),(166,'S166','pressione',1,'120000',42),(167,'S167','luminosita',1,'300000',42),(168,'S168','umidita',1,'90000',42),(169,'S169','temperatura',1,'60000',43),(170,'S170','pressione',1,'120000',43),(171,'S171','luminosita',1,'300000',43),(172,'S172','umidita',1,'90000',43),(173,'S173','temperatura',1,'60000',44),(174,'S174','pressione',1,'120000',44),(175,'S175','luminosita',1,'300000',44),(176,'S176','umidita',1,'90000',44),(177,'S177','temperatura',1,'60000',45),(178,'S178','pressione',1,'120000',45),(179,'S179','luminosita',1,'300000',45),(180,'S180','umidita',1,'90000',45),(181,'S181','temperatura',1,'60000',46),(182,'S182','pressione',1,'120000',46),(183,'S183','luminosita',1,'300000',46),(184,'S184','umidita',1,'90000',46),(185,'S185','temperatura',1,'60000',47),(186,'S186','pressione',1,'120000',47),(187,'S187','luminosita',1,'300000',47),(188,'S188','umidita',1,'90000',47),(189,'S189','temperatura',1,'60000',48),(190,'S190','pressione',1,'120000',48),(191,'S191','luminosita',1,'300000',48),(192,'S192','umidita',1,'90000',48),(193,'S193','temperatura',1,'60000',49),(194,'S194','pressione',1,'120000',49),(195,'S195','luminosita',1,'300000',49),(196,'S196','umidita',1,'90000',49),(197,'S197','temperatura',1,'60000',50),(198,'S198','pressione',1,'120000',50),(199,'S199','luminosita',1,'300000',50),(200,'S200','umidita',1,'90000',50),(201,'S201','temperatura',1,'60000',51),(202,'S202','pressione',1,'120000',51),(203,'S203','luminosita',1,'300000',51),(204,'S204','umidita',1,'90000',51),(205,'S205','temperatura',1,'60000',52),(206,'S206','pressione',1,'120000',52),(207,'S207','luminosita',1,'300000',52),(208,'S208','umidita',1,'90000',52),(209,'S209','temperatura',1,'60000',53),(210,'S210','pressione',1,'120000',53),(211,'S211','luminosita',1,'300000',53),(212,'S212','umidita',1,'90000',53),(213,'S213','temperatura',1,'60000',54),(214,'S214','pressione',1,'120000',54),(215,'S215','luminosita',1,'300000',54),(216,'S216','umidita',1,'90000',54),(217,'S217','temperatura',1,'60000',55),(218,'S218','pressione',1,'120000',55),(219,'S219','luminosita',1,'300000',55),(220,'S220','umidita',1,'90000',55),(221,'S221','temperatura',1,'60000',56),(222,'S222','pressione',1,'120000',56),(223,'S223','luminosita',1,'300000',56),(224,'S224','umidita',1,'90000',56),(225,'S225','temperatura',1,'60000',57),(226,'S226','pressione',1,'120000',57),(227,'S227','luminosita',1,'300000',57),(228,'S228','umidita',1,'90000',57),(229,'S229','temperatura',1,'60000',58),(230,'S230','pressione',1,'120000',58),(231,'S231','luminosita',1,'300000',58),(232,'S232','umidita',1,'90000',58),(233,'S233','temperatura',1,'60000',59),(234,'S234','pressione',1,'120000',59),(235,'S235','luminosita',1,'300000',59),(236,'S236','umidita',1,'90000',59),(237,'S237','temperatura',1,'60000',60),(238,'S238','pressione',1,'120000',60),(239,'S239','luminosita',1,'300000',60),(240,'S240','umidita',1,'90000',60),(241,'S241','temperatura',1,'60000',61),(242,'S242','pressione',1,'120000',61),(243,'S243','luminosita',1,'300000',61),(244,'S244','umidita',1,'90000',61),(245,'S245','temperatura',1,'60000',62),(246,'S246','pressione',1,'120000',62),(247,'S247','luminosita',1,'300000',62),(248,'S248','umidita',1,'90000',62),(249,'S249','temperatura',1,'60000',63),(250,'S250','pressione',1,'120000',63),(251,'S251','luminosita',1,'300000',63),(252,'S252','umidita',1,'90000',63),(253,'S253','temperatura',1,'60000',64),(254,'S254','pressione',1,'120000',64),(255,'S255','luminosita',1,'300000',64),(256,'S256','umidita',1,'90000',64),(257,'S257','temperatura',1,'60000',65),(258,'S258','pressione',1,'120000',65),(259,'S259','luminosita',1,'300000',65),(260,'S260','umidita',1,'90000',65),(261,'S261','temperatura',1,'60000',66),(262,'S262','pressione',1,'120000',66),(263,'S263','luminosita',1,'300000',66),(264,'S264','umidita',1,'90000',66),(265,'S265','temperatura',1,'60000',67),(266,'S266','pressione',1,'120000',67),(267,'S267','luminosita',1,'300000',67),(268,'S268','umidita',1,'90000',67),(269,'S269','temperatura',1,'60000',68),(270,'S270','pressione',1,'120000',68),(271,'S271','luminosita',1,'300000',68),(272,'S272','umidita',1,'90000',68),(273,'S273','temperatura',1,'60000',69),(274,'S274','pressione',1,'120000',69),(275,'S275','luminosita',1,'300000',69),(276,'S276','umidita',1,'90000',69),(277,'S277','temperatura',1,'60000',70),(278,'S278','pressione',1,'120000',70),(279,'S279','luminosita',1,'300000',70),(280,'S280','umidita',1,'90000',70),(281,'S281','temperatura',1,'60000',71),(282,'S282','pressione',1,'120000',71),(283,'S283','luminosita',1,'300000',71),(284,'S284','umidita',1,'90000',71),(285,'S285','temperatura',1,'60000',72),(286,'S286','pressione',1,'120000',72),(287,'S287','luminosita',1,'300000',72),(288,'S288','umidita',1,'90000',72),(289,'S289','temperatura',1,'60000',73),(290,'S290','pressione',1,'120000',73),(291,'S291','luminosita',1,'300000',73),(292,'S292','umidita',1,'90000',73),(293,'S293','temperatura',1,'60000',74),(294,'S294','pressione',1,'120000',74),(295,'S295','luminosita',1,'300000',74),(296,'S296','umidita',1,'90000',74),(297,'S297','temperatura',1,'60000',75),(298,'S298','pressione',1,'120000',75),(299,'S299','luminosita',1,'300000',75),(300,'S300','umidita',1,'90000',75),(301,'S301','temperatura',1,'60000',76),(302,'S302','pressione',1,'120000',76),(303,'S303','luminosita',1,'300000',76),(304,'S304','umidita',1,'90000',76),(305,'S305','temperatura',1,'60000',77),(306,'S306','pressione',1,'120000',77),(307,'S307','luminosita',1,'300000',77),(308,'S308','umidita',1,'90000',77),(309,'S309','temperatura',1,'60000',78),(310,'S310','pressione',1,'120000',78),(311,'S311','luminosita',1,'300000',78),(312,'S312','umidita',1,'90000',78),(313,'S313','temperatura',1,'60000',79),(314,'S314','pressione',1,'120000',79),(315,'S315','luminosita',1,'300000',79),(316,'S316','umidita',1,'90000',79),(317,'S317','temperatura',1,'60000',80),(318,'S318','pressione',1,'120000',80),(319,'S319','luminosita',1,'300000',80),(320,'S320','umidita',1,'90000',80),(321,'S321','temperatura',1,'60000',81),(322,'S322','pressione',1,'120000',81),(323,'S323','luminosita',1,'300000',81),(324,'S324','umidita',1,'90000',81),(325,'S325','temperatura',1,'60000',82),(326,'S326','pressione',1,'120000',82),(327,'S327','luminosita',1,'300000',82),(328,'S328','umidita',1,'90000',82),(329,'S329','temperatura',1,'60000',83),(330,'S330','pressione',1,'120000',83),(331,'S331','luminosita',1,'300000',83),(332,'S332','umidita',1,'90000',83),(333,'S333','temperatura',1,'60000',84),(334,'S334','pressione',1,'120000',84),(335,'S335','luminosita',1,'300000',84),(336,'S336','umidita',1,'90000',84),(337,'S337','temperatura',1,'60000',85),(338,'S338','pressione',1,'120000',85),(339,'S339','luminosita',1,'300000',85),(340,'S340','umidita',1,'90000',85),(341,'S341','temperatura',1,'60000',86),(342,'S342','pressione',1,'120000',86),(343,'S343','luminosita',1,'300000',86),(344,'S344','umidita',1,'90000',86),(345,'S345','temperatura',1,'60000',87),(346,'S346','pressione',1,'120000',87),(347,'S347','luminosita',1,'300000',87),(348,'S348','umidita',1,'90000',87),(349,'S349','temperatura',1,'60000',88),(350,'S350','pressione',1,'120000',88),(351,'S351','luminosita',1,'300000',88),(352,'S352','umidita',1,'90000',88),(353,'S353','temperatura',1,'60000',89),(354,'S354','pressione',1,'120000',89),(355,'S355','luminosita',1,'300000',89),(356,'S356','umidita',1,'90000',89),(357,'S357','temperatura',1,'60000',90),(358,'S358','pressione',1,'120000',90),(359,'S359','luminosita',1,'300000',90),(360,'S360','umidita',1,'90000',90),(361,'S361','temperatura',1,'60000',91),(362,'S362','pressione',1,'120000',91),(363,'S363','luminosita',1,'300000',91),(364,'S364','umidita',1,'90000',91),(365,'S365','temperatura',1,'60000',92),(366,'S366','pressione',1,'120000',92),(367,'S367','luminosita',1,'300000',92),(368,'S368','umidita',1,'90000',92),(369,'S369','temperatura',1,'60000',93),(370,'S370','pressione',1,'120000',93),(371,'S371','luminosita',1,'300000',93),(372,'S372','umidita',1,'90000',93),(373,'S373','temperatura',1,'60000',94),(374,'S374','pressione',1,'120000',94),(375,'S375','luminosita',1,'300000',94),(376,'S376','umidita',1,'90000',94),(377,'S377','temperatura',1,'60000',95),(378,'S378','pressione',1,'120000',95),(379,'S379','luminosita',1,'300000',95),(380,'S380','umidita',1,'90000',95),(381,'S381','temperatura',1,'60000',96),(382,'S382','pressione',1,'120000',96),(383,'S383','luminosita',1,'300000',96),(384,'S384','umidita',1,'90000',96),(385,'S385','temperatura',1,'60000',97),(386,'S386','pressione',1,'120000',97),(387,'S387','luminosita',1,'300000',97),(388,'S388','umidita',1,'90000',97),(389,'S389','temperatura',1,'60000',98),(390,'S390','pressione',1,'120000',98),(391,'S391','luminosita',1,'300000',98),(392,'S392','umidita',1,'90000',98),(393,'S393','temperatura',1,'60000',99),(394,'S394','pressione',1,'120000',99),(395,'S395','luminosita',1,'300000',99),(396,'S396','umidita',1,'90000',99),(397,'S397','temperatura',1,'60000',100),(398,'S398','pressione',1,'120000',100),(399,'S399','luminosita',1,'300000',100),(400,'S400','umidita',1,'90000',100),(401,'S401','temperatura',1,'60000',101),(402,'S402','pressione',1,'120000',101),(403,'S403','luminosita',1,'300000',101),(404,'S404','umidita',1,'90000',101),(405,'S405','temperatura',1,'60000',102),(406,'S406','pressione',1,'120000',102),(407,'S407','luminosita',1,'300000',102),(408,'S408','umidita',1,'90000',102),(409,'S409','temperatura',1,'60000',103),(410,'S410','pressione',1,'120000',103),(411,'S411','luminosita',1,'300000',103),(412,'S412','umidita',1,'90000',103),(413,'S413','temperatura',1,'60000',104),(414,'S414','pressione',1,'120000',104),(415,'S415','luminosita',1,'300000',104),(416,'S416','umidita',1,'90000',104),(417,'S417','temperatura',1,'60000',105),(418,'S418','pressione',1,'120000',105),(419,'S419','luminosita',1,'300000',105),(420,'S420','umidita',1,'90000',105),(421,'S421','temperatura',1,'60000',106),(422,'S422','pressione',1,'120000',106),(423,'S423','luminosita',1,'300000',106),(424,'S424','umidita',1,'90000',106),(425,'S425','temperatura',1,'60000',107),(426,'S426','pressione',1,'120000',107),(427,'S427','luminosita',1,'300000',107),(428,'S428','umidita',1,'90000',107),(429,'S429','temperatura',1,'60000',108),(430,'S430','pressione',1,'120000',108),(431,'S431','luminosita',1,'300000',108),(432,'S432','umidita',1,'90000',108),(433,'S433','temperatura',1,'60000',109),(434,'S434','pressione',1,'120000',109),(435,'S435','luminosita',1,'300000',109),(436,'S436','umidita',1,'90000',109),(437,'S437','temperatura',1,'60000',110),(438,'S438','pressione',1,'120000',110),(439,'S439','luminosita',1,'300000',110),(440,'S440','umidita',1,'90000',110),(441,'S441','temperatura',1,'60000',111),(442,'S442','pressione',1,'120000',111),(443,'S443','luminosita',1,'300000',111),(444,'S444','umidita',1,'90000',111),(445,'S445','temperatura',1,'60000',112),(446,'S446','pressione',1,'120000',112),(447,'S447','luminosita',1,'300000',112),(448,'S448','umidita',1,'90000',112),(449,'S449','temperatura',1,'60000',113),(450,'S450','pressione',1,'120000',113),(451,'S451','luminosita',1,'300000',113),(452,'S452','umidita',1,'90000',113),(453,'S453','temperatura',1,'60000',114),(454,'S454','pressione',1,'120000',114),(455,'S455','luminosita',1,'300000',114),(456,'S456','umidita',1,'90000',114),(457,'S457','temperatura',1,'60000',115),(458,'S458','pressione',1,'120000',115),(459,'S459','luminosita',1,'300000',115),(460,'S460','umidita',1,'90000',115),(461,'S461','temperatura',1,'60000',116),(462,'S462','pressione',1,'120000',116),(463,'S463','luminosita',1,'300000',116),(464,'S464','umidita',1,'90000',116),(465,'S465','temperatura',1,'60000',117),(466,'S466','pressione',1,'120000',117),(467,'S467','luminosita',1,'300000',117),(468,'S468','umidita',1,'90000',117),(469,'S469','temperatura',1,'60000',118),(470,'S470','pressione',1,'120000',118),(471,'S471','luminosita',1,'300000',118),(472,'S472','umidita',1,'90000',118),(473,'S473','temperatura',1,'60000',119),(474,'S474','pressione',1,'120000',119),(475,'S475','luminosita',1,'300000',119),(476,'S476','umidita',1,'90000',119),(477,'S477','temperatura',1,'60000',120),(478,'S478','pressione',1,'120000',120),(479,'S479','luminosita',1,'300000',120),(480,'S480','umidita',1,'90000',120),(481,'S481','temperatura',1,'60000',121),(482,'S482','pressione',1,'120000',121),(483,'S483','luminosita',1,'300000',121),(484,'S484','umidita',1,'90000',121),(485,'S485','temperatura',1,'60000',122),(486,'S486','pressione',1,'120000',122),(487,'S487','luminosita',1,'300000',122),(488,'S488','umidita',1,'90000',122),(489,'S489','temperatura',1,'60000',123),(490,'S490','pressione',1,'120000',123),(491,'S491','luminosita',1,'300000',123),(492,'S492','umidita',1,'90000',123),(493,'S493','temperatura',1,'60000',124),(494,'S494','pressione',1,'120000',124),(495,'S495','luminosita',1,'300000',124),(496,'S496','umidita',1,'90000',124),(497,'S497','temperatura',1,'60000',125),(498,'S498','pressione',1,'120000',125),(499,'S499','luminosita',1,'300000',125),(500,'S500','umidita',1,'90000',125),(501,'S501','temperatura',1,'60000',126),(502,'S502','pressione',1,'120000',126),(503,'S503','luminosita',1,'300000',126),(504,'S504','umidita',1,'90000',126),(505,'S505','temperatura',1,'60000',127),(506,'S506','pressione',1,'120000',127),(507,'S507','luminosita',1,'300000',127),(508,'S508','umidita',1,'90000',127),(509,'S509','temperatura',1,'60000',128),(510,'S510','pressione',1,'120000',128),(511,'S511','luminosita',1,'300000',128),(512,'S512','umidita',1,'90000',128),(513,'S513','temperatura',1,'60000',129),(514,'S514','pressione',1,'120000',129),(515,'S515','luminosita',1,'300000',129),(516,'S516','umidita',1,'90000',129),(517,'S517','temperatura',1,'60000',130),(518,'S518','pressione',1,'120000',130),(519,'S519','luminosita',1,'300000',130),(520,'S520','umidita',1,'90000',130),(521,'S521','temperatura',1,'60000',131),(522,'S522','pressione',1,'120000',131),(523,'S523','luminosita',1,'300000',131),(524,'S524','umidita',1,'90000',131),(525,'S525','temperatura',1,'60000',132),(526,'S526','pressione',1,'120000',132),(527,'S527','luminosita',1,'300000',132),(528,'S528','umidita',1,'90000',132),(529,'S529','temperatura',1,'60000',133),(530,'S530','pressione',1,'120000',133),(531,'S531','luminosita',1,'300000',133),(532,'S532','umidita',1,'90000',133),(533,'S533','temperatura',1,'60000',134),(534,'S534','pressione',1,'120000',134),(535,'S535','luminosita',1,'300000',134),(536,'S536','umidita',1,'90000',134),(537,'S537','temperatura',1,'60000',135),(538,'S538','pressione',1,'120000',135),(539,'S539','luminosita',1,'300000',135),(540,'S540','umidita',1,'90000',135),(541,'S541','temperatura',1,'60000',136),(542,'S542','pressione',1,'120000',136),(543,'S543','luminosita',1,'300000',136),(544,'S544','umidita',1,'90000',136),(545,'S545','temperatura',1,'60000',137),(546,'S546','pressione',1,'120000',137),(547,'S547','luminosita',1,'300000',137),(548,'S548','umidita',1,'90000',137),(549,'S549','temperatura',1,'60000',138),(550,'S550','pressione',1,'120000',138),(551,'S551','luminosita',1,'300000',138),(552,'S552','umidita',1,'90000',138),(553,'S553','temperatura',1,'60000',139),(554,'S554','pressione',1,'120000',139),(555,'S555','luminosita',1,'300000',139),(556,'S556','umidita',1,'90000',139),(557,'S557','temperatura',1,'60000',140),(558,'S558','pressione',1,'120000',140),(559,'S559','luminosita',1,'300000',140),(560,'S560','umidita',1,'90000',140),(561,'S561','temperatura',1,'60000',141),(562,'S562','pressione',1,'120000',141),(563,'S563','luminosita',1,'300000',141),(564,'S564','umidita',1,'90000',141),(565,'S565','temperatura',1,'60000',142),(566,'S566','pressione',1,'120000',142),(567,'S567','luminosita',1,'300000',142),(568,'S568','umidita',1,'90000',142),(569,'S569','temperatura',1,'60000',143),(570,'S570','pressione',1,'120000',143),(571,'S571','luminosita',1,'300000',143),(572,'S572','umidita',1,'90000',143),(573,'S573','temperatura',1,'60000',144),(574,'S574','pressione',1,'120000',144),(575,'S575','luminosita',1,'300000',144),(576,'S576','umidita',1,'90000',144),(577,'S577','temperatura',1,'60000',145),(578,'S578','pressione',1,'120000',145),(579,'S579','luminosita',1,'300000',145),(580,'S580','umidita',1,'90000',145),(581,'S581','temperatura',1,'60000',146),(582,'S582','pressione',1,'120000',146),(583,'S583','luminosita',1,'300000',146),(584,'S584','umidita',1,'90000',146),(585,'S585','temperatura',1,'60000',147),(586,'S586','pressione',1,'120000',147),(587,'S587','luminosita',1,'300000',147),(588,'S588','umidita',1,'90000',147),(589,'S589','temperatura',1,'60000',148),(590,'S590','pressione',1,'120000',148),(591,'S591','luminosita',1,'300000',148),(592,'S592','umidita',1,'90000',148),(593,'S593','temperatura',1,'60000',149),(594,'S594','pressione',1,'120000',149),(595,'S595','luminosita',1,'300000',149),(596,'S596','umidita',1,'90000',149),(597,'S597','temperatura',1,'60000',150),(598,'S598','pressione',1,'120000',150),(599,'S599','luminosita',1,'300000',150),(600,'S600','umidita',1,'90000',150),(601,'S601','temperatura',1,'60000',151),(602,'S602','pressione',1,'120000',151),(603,'S603','luminosita',1,'300000',151),(604,'S604','umidita',1,'90000',151),(605,'S605','temperatura',1,'60000',152),(606,'S606','pressione',1,'120000',152),(607,'S607','luminosita',1,'300000',152),(608,'S608','umidita',1,'90000',152),(609,'S609','temperatura',1,'60000',153),(610,'S610','pressione',1,'120000',153),(611,'S611','luminosita',1,'300000',153),(612,'S612','umidita',1,'90000',153),(613,'S613','temperatura',1,'60000',154),(614,'S614','pressione',1,'120000',154),(615,'S615','luminosita',1,'300000',154),(616,'S616','umidita',1,'90000',154),(617,'S617','temperatura',1,'60000',155),(618,'S618','pressione',1,'120000',155),(619,'S619','luminosita',1,'300000',155),(620,'S620','umidita',1,'90000',155),(621,'S621','temperatura',1,'60000',156),(622,'S622','pressione',1,'120000',156),(623,'S623','luminosita',1,'300000',156),(624,'S624','umidita',1,'90000',156),(625,'S625','temperatura',1,'60000',157),(626,'S626','pressione',1,'120000',157),(627,'S627','luminosita',1,'300000',157),(628,'S628','umidita',1,'90000',157),(629,'S629','temperatura',1,'60000',158),(630,'S630','pressione',1,'120000',158),(631,'S631','luminosita',1,'300000',158),(632,'S632','umidita',1,'90000',158),(633,'S633','temperatura',1,'60000',159),(634,'S634','pressione',1,'120000',159),(635,'S635','luminosita',1,'300000',159),(636,'S636','umidita',1,'90000',159),(637,'S637','temperatura',1,'60000',160),(638,'S638','pressione',1,'120000',160),(639,'S639','luminosita',1,'300000',160),(640,'S640','umidita',1,'90000',160),(641,'S641','temperatura',1,'60000',161),(642,'S642','pressione',1,'120000',161),(643,'S643','luminosita',1,'300000',161),(644,'S644','umidita',1,'90000',161),(645,'S645','temperatura',1,'60000',162),(646,'S646','pressione',1,'120000',162),(647,'S647','luminosita',1,'300000',162),(648,'S648','umidita',1,'90000',162),(649,'S649','temperatura',1,'60000',163),(650,'S650','pressione',1,'120000',163),(651,'S651','luminosita',1,'300000',163),(652,'S652','umidita',1,'90000',163),(653,'S653','temperatura',1,'60000',164),(654,'S654','pressione',1,'120000',164),(655,'S655','luminosita',1,'300000',164),(656,'S656','umidita',1,'90000',164),(657,'S657','temperatura',1,'60000',165),(658,'S658','pressione',1,'120000',165),(659,'S659','luminosita',1,'300000',165),(660,'S660','umidita',1,'90000',165),(661,'S661','temperatura',1,'60000',166),(662,'S662','pressione',1,'120000',166),(663,'S663','luminosita',1,'300000',166),(664,'S664','umidita',1,'90000',166),(665,'S665','temperatura',1,'60000',167),(666,'S666','pressione',1,'120000',167),(667,'S667','luminosita',1,'300000',167),(668,'S668','umidita',1,'90000',167),(669,'S669','temperatura',1,'60000',168),(670,'S670','pressione',1,'120000',168),(671,'S671','luminosita',1,'300000',168),(672,'S672','umidita',1,'90000',168),(673,'S673','temperatura',1,'60000',169),(674,'S674','pressione',1,'120000',169),(675,'S675','luminosita',1,'300000',169),(676,'S676','umidita',1,'90000',169),(677,'S677','temperatura',1,'60000',170),(678,'S678','pressione',1,'120000',170),(679,'S679','luminosita',1,'300000',170),(680,'S680','umidita',1,'90000',170),(681,'S681','temperatura',1,'60000',171),(682,'S682','pressione',1,'120000',171),(683,'S683','luminosita',1,'300000',171),(684,'S684','umidita',1,'90000',171),(685,'S685','temperatura',1,'60000',172),(686,'S686','pressione',1,'120000',172),(687,'S687','luminosita',1,'300000',172),(688,'S688','umidita',1,'90000',172),(689,'S689','temperatura',1,'60000',173),(690,'S690','pressione',1,'120000',173),(691,'S691','luminosita',1,'300000',173),(692,'S692','umidita',1,'90000',173),(693,'S693','temperatura',1,'60000',174),(694,'S694','pressione',1,'120000',174),(695,'S695','luminosita',1,'300000',174),(696,'S696','umidita',1,'90000',174),(697,'S697','temperatura',1,'60000',175),(698,'S698','pressione',1,'120000',175),(699,'S699','luminosita',1,'300000',175),(700,'S700','umidita',1,'90000',175),(701,'S701','temperatura',1,'60000',176),(702,'S702','pressione',1,'120000',176),(703,'S703','luminosita',1,'300000',176),(704,'S704','umidita',1,'90000',176),(705,'S705','temperatura',1,'60000',177),(706,'S706','pressione',1,'120000',177),(707,'S707','luminosita',1,'300000',177),(708,'S708','umidita',1,'90000',177),(709,'S709','temperatura',1,'60000',178),(710,'S710','pressione',1,'120000',178),(711,'S711','luminosita',1,'300000',178),(712,'S712','umidita',1,'90000',178),(713,'S713','temperatura',1,'60000',179),(714,'S714','pressione',1,'120000',179),(715,'S715','luminosita',1,'300000',179),(716,'S716','umidita',1,'90000',179),(717,'S717','temperatura',1,'60000',180),(718,'S718','pressione',1,'120000',180),(719,'S719','luminosita',1,'300000',180),(720,'S720','umidita',1,'90000',180),(721,'S721','temperatura',1,'60000',181),(722,'S722','pressione',1,'120000',181),(723,'S723','luminosita',1,'300000',181),(724,'S724','umidita',1,'90000',181),(725,'S725','temperatura',1,'60000',182),(726,'S726','pressione',1,'120000',182),(727,'S727','luminosita',1,'300000',182),(728,'S728','umidita',1,'90000',182),(729,'S729','temperatura',1,'60000',183),(730,'S730','pressione',1,'120000',183),(731,'S731','luminosita',1,'300000',183),(732,'S732','umidita',1,'90000',183),(733,'S733','temperatura',1,'60000',184),(734,'S734','pressione',1,'120000',184),(735,'S735','luminosita',1,'300000',184),(736,'S736','umidita',1,'90000',184),(737,'S737','temperatura',1,'60000',185),(738,'S738','pressione',1,'120000',185),(739,'S739','luminosita',1,'300000',185),(740,'S740','umidita',1,'90000',185),(741,'S741','temperatura',1,'60000',186),(742,'S742','pressione',1,'120000',186),(743,'S743','luminosita',1,'300000',186),(744,'S744','umidita',1,'90000',186),(745,'S745','temperatura',1,'60000',187),(746,'S746','pressione',1,'120000',187),(747,'S747','luminosita',1,'300000',187),(748,'S748','umidita',1,'90000',187),(749,'S749','temperatura',1,'60000',188),(750,'S750','pressione',1,'120000',188),(751,'S751','luminosita',1,'300000',188),(752,'S752','umidita',1,'90000',188),(753,'S753','temperatura',1,'60000',189),(754,'S754','pressione',1,'120000',189),(755,'S755','luminosita',1,'300000',189),(756,'S756','umidita',1,'90000',189),(757,'S757','temperatura',1,'60000',190),(758,'S758','pressione',1,'120000',190),(759,'S759','luminosita',1,'300000',190),(760,'S760','umidita',1,'90000',190),(761,'S761','temperatura',1,'60000',191),(762,'S762','pressione',1,'120000',191),(763,'S763','luminosita',1,'300000',191),(764,'S764','umidita',1,'90000',191),(765,'S765','temperatura',1,'60000',192),(766,'S766','pressione',1,'120000',192),(767,'S767','luminosita',1,'300000',192),(768,'S768','umidita',1,'90000',192),(769,'S769','temperatura',1,'60000',193),(770,'S770','pressione',1,'120000',193),(771,'S771','luminosita',1,'300000',193),(772,'S772','umidita',1,'90000',193),(773,'S773','temperatura',1,'60000',194),(774,'S774','pressione',1,'120000',194),(775,'S775','luminosita',1,'300000',194),(776,'S776','umidita',1,'90000',194),(777,'S777','temperatura',1,'60000',195),(778,'S778','pressione',1,'120000',195),(779,'S779','luminosita',1,'300000',195),(780,'S780','umidita',1,'90000',195),(781,'S781','temperatura',1,'60000',196),(782,'S782','pressione',1,'120000',196),(783,'S783','luminosita',1,'300000',196),(784,'S784','umidita',1,'90000',196),(785,'S785','temperatura',1,'60000',197),(786,'S786','pressione',1,'120000',197),(787,'S787','luminosita',1,'300000',197),(788,'S788','umidita',1,'90000',197),(789,'S789','temperatura',1,'60000',198),(790,'S790','pressione',1,'120000',198),(791,'S791','luminosita',1,'300000',198),(792,'S792','umidita',1,'90000',198),(793,'S793','temperatura',1,'60000',199),(794,'S794','pressione',1,'120000',199),(795,'S795','luminosita',1,'300000',199),(796,'S796','umidita',1,'90000',199),(797,'S797','temperatura',1,'60000',200),(798,'S798','pressione',1,'120000',200),(799,'S799','luminosita',1,'300000',200),(800,'S800','umidita',1,'90000',200),(801,'S801','temperatura',1,'60000',1),(802,'S802','temperatura',1,'60000',2),(803,'S803','temperatura',1,'60000',3),(804,'S804','temperatura',1,'60000',4),(805,'S805','temperatura',1,'60000',5),(806,'S806','temperatura',1,'60000',6),(807,'S807','temperatura',1,'60000',7),(808,'S808','temperatura',1,'60000',8),(809,'S809','temperatura',1,'60000',9),(810,'S810','temperatura',1,'60000',10),(811,'S811','temperatura',1,'60000',11),(812,'S812','temperatura',1,'60000',12),(813,'S813','temperatura',1,'60000',13),(814,'S814','temperatura',1,'60000',14),(815,'S815','temperatura',1,'60000',15),(816,'S816','temperatura',1,'60000',16),(817,'S817','temperatura',1,'60000',17),(818,'S818','temperatura',1,'60000',18),(819,'S819','temperatura',1,'60000',19),(820,'S820','temperatura',1,'60000',20),(821,'S821','temperatura',1,'60000',21),(822,'S822','temperatura',1,'60000',22),(823,'S823','temperatura',1,'60000',23),(824,'S824','temperatura',1,'60000',24),(825,'S825','temperatura',1,'60000',25),(826,'S826','temperatura',1,'60000',26),(827,'S827','temperatura',1,'60000',27),(828,'S828','temperatura',1,'60000',28),(829,'S829','temperatura',1,'60000',29),(830,'S830','temperatura',1,'60000',30),(831,'S831','temperatura',1,'60000',31),(832,'S832','temperatura',1,'60000',32),(833,'S833','temperatura',1,'60000',33),(834,'S834','temperatura',1,'60000',34),(835,'S835','temperatura',1,'60000',35),(836,'S836','temperatura',1,'60000',36),(837,'S837','temperatura',1,'60000',37),(838,'S838','temperatura',1,'60000',38),(839,'S839','temperatura',1,'60000',39),(840,'S840','temperatura',1,'60000',40),(841,'S841','temperatura',1,'60000',41),(842,'S842','temperatura',1,'60000',42),(843,'S843','temperatura',1,'60000',43),(844,'S844','temperatura',1,'60000',44),(845,'S845','temperatura',1,'60000',45),(846,'S846','temperatura',1,'60000',46),(847,'S847','temperatura',1,'60000',47),(848,'S848','temperatura',1,'60000',48),(849,'S849','temperatura',1,'60000',49),(850,'S850','temperatura',1,'60000',50),(851,'S851','temperatura',1,'60000',51),(852,'S852','temperatura',1,'60000',52),(853,'S853','temperatura',1,'60000',53),(854,'S854','temperatura',1,'60000',54),(855,'S855','temperatura',1,'60000',55),(856,'S856','temperatura',1,'60000',56),(857,'S857','temperatura',1,'60000',57),(858,'S858','temperatura',1,'60000',58),(859,'S859','temperatura',1,'60000',59),(860,'S860','temperatura',1,'60000',60),(861,'S861','temperatura',1,'60000',61),(862,'S862','temperatura',1,'60000',62),(863,'S863','temperatura',1,'60000',63),(864,'S864','temperatura',1,'60000',64),(865,'S865','temperatura',1,'60000',65),(866,'S866','temperatura',1,'60000',66),(867,'S867','temperatura',1,'60000',67),(868,'S868','temperatura',1,'60000',68),(869,'S869','temperatura',1,'60000',69),(870,'S870','temperatura',1,'60000',70),(871,'S871','temperatura',1,'60000',71),(872,'S872','temperatura',1,'60000',72),(873,'S873','temperatura',1,'60000',73),(874,'S874','temperatura',1,'60000',74),(875,'S875','temperatura',1,'60000',75),(876,'S876','temperatura',1,'60000',76),(877,'S877','temperatura',1,'60000',77),(878,'S878','temperatura',1,'60000',78),(879,'S879','temperatura',1,'60000',79),(880,'S880','temperatura',1,'60000',80),(881,'S881','temperatura',1,'60000',81),(882,'S882','temperatura',1,'60000',82),(883,'S883','temperatura',1,'60000',83),(884,'S884','temperatura',1,'60000',84),(885,'S885','temperatura',1,'60000',85),(886,'S886','temperatura',1,'60000',86),(887,'S887','temperatura',1,'60000',87),(888,'S888','temperatura',1,'60000',88),(889,'S889','temperatura',1,'60000',89),(890,'S890','temperatura',1,'60000',90),(891,'S891','temperatura',1,'60000',91),(892,'S892','temperatura',1,'60000',92),(893,'S893','temperatura',1,'60000',93),(894,'S894','temperatura',1,'60000',94),(895,'S895','temperatura',1,'60000',95),(896,'S896','temperatura',1,'60000',96),(897,'S897','temperatura',1,'60000',97),(898,'S898','temperatura',1,'60000',98),(899,'S899','temperatura',1,'60000',99),(900,'S900','temperatura',1,'60000',100),(901,'S901','temperatura',1,'60000',101),(902,'S902','temperatura',1,'60000',102),(903,'S903','temperatura',1,'60000',103),(904,'S904','temperatura',1,'60000',104),(905,'S905','temperatura',1,'60000',105),(906,'S906','temperatura',1,'60000',106),(907,'S907','temperatura',1,'60000',107),(908,'S908','temperatura',1,'60000',108),(909,'S909','temperatura',1,'60000',109),(910,'S910','temperatura',1,'60000',110),(911,'S911','temperatura',1,'60000',111),(912,'S912','temperatura',1,'60000',112),(913,'S913','temperatura',1,'60000',113),(914,'S914','temperatura',1,'60000',114),(915,'S915','temperatura',1,'60000',115),(916,'S916','temperatura',1,'60000',116),(917,'S917','temperatura',1,'60000',117),(918,'S918','temperatura',1,'60000',118),(919,'S919','temperatura',1,'60000',119),(920,'S920','temperatura',1,'60000',120),(921,'S921','temperatura',1,'60000',121),(922,'S922','temperatura',1,'60000',122),(923,'S923','temperatura',1,'60000',123),(924,'S924','temperatura',1,'60000',124),(925,'S925','temperatura',1,'60000',125),(926,'S926','temperatura',1,'60000',126),(927,'S927','temperatura',1,'60000',127),(928,'S928','temperatura',1,'60000',128),(929,'S929','temperatura',1,'60000',129),(930,'S930','temperatura',1,'60000',130),(931,'S931','temperatura',1,'60000',131),(932,'S932','temperatura',1,'60000',132),(933,'S933','temperatura',1,'60000',133),(934,'S934','temperatura',1,'60000',134),(935,'S935','temperatura',1,'60000',135),(936,'S936','temperatura',1,'60000',136),(937,'S937','temperatura',1,'60000',137),(938,'S938','temperatura',1,'60000',138),(939,'S939','temperatura',1,'60000',139),(940,'S940','temperatura',1,'60000',140),(941,'S941','temperatura',1,'60000',141),(942,'S942','temperatura',1,'60000',142),(943,'S943','temperatura',1,'60000',143),(944,'S944','temperatura',1,'60000',144),(945,'S945','temperatura',1,'60000',145),(946,'S946','temperatura',1,'60000',146),(947,'S947','temperatura',1,'60000',147),(948,'S948','temperatura',1,'60000',148),(949,'S949','temperatura',1,'60000',149),(950,'S950','temperatura',1,'60000',150),(951,'S954','fumo',1,'60000',4),(952,'S958','fumo',1,'60000',8),(953,'S962','fumo',1,'60000',12),(954,'S966','fumo',1,'60000',16),(955,'S970','fumo',1,'60000',20),(956,'S974','fumo',1,'60000',24),(957,'S978','fumo',1,'60000',28),(958,'S982','fumo',1,'60000',32),(959,'S986','fumo',1,'60000',36),(960,'S990','fumo',1,'60000',40),(961,'S994','fumo',1,'60000',44),(962,'S998','fumo',1,'60000',48),(963,'S1002','fumo',1,'60000',52),(964,'S1006','fumo',1,'60000',56),(965,'S1010','fumo',1,'60000',60),(966,'S1014','fumo',1,'60000',64),(967,'S1018','fumo',1,'60000',68),(968,'S1022','fumo',1,'60000',72),(969,'S1026','fumo',1,'60000',76),(970,'S1030','fumo',1,'60000',80),(971,'S1034','fumo',1,'60000',84),(972,'S1038','fumo',1,'60000',88),(973,'S1042','fumo',1,'60000',92),(974,'S1046','fumo',1,'60000',96),(975,'S1050','fumo',1,'60000',100),(976,'S1054','fumo',1,'60000',104),(977,'S1058','fumo',1,'60000',108),(978,'S1062','fumo',1,'60000',112),(979,'S1066','fumo',1,'60000',116),(980,'S1070','fumo',1,'60000',120),(981,'S1074','fumo',1,'60000',124),(982,'S1078','fumo',1,'60000',128),(983,'S1082','fumo',1,'60000',132),(984,'S1086','fumo',1,'60000',136),(985,'S1090','fumo',1,'60000',140),(986,'S1094','fumo',1,'60000',144),(987,'S1098','fumo',1,'60000',148),(988,'S1102','fumo',1,'60000',152),(989,'S1106','fumo',1,'60000',156),(990,'S1110','fumo',1,'60000',160),(991,'S1114','fumo',1,'60000',164),(992,'S1118','fumo',1,'60000',168),(993,'S1122','fumo',1,'60000',172),(994,'S1126','fumo',1,'60000',176),(995,'S1130','fumo',1,'60000',180),(996,'S1134','fumo',1,'60000',184),(997,'S1138','fumo',1,'60000',188),(998,'S1142','fumo',1,'60000',192),(999,'S1146','fumo',1,'60000',196),(1000,'S1150','fumo',1,'60000',200);
/*!40000 ALTER TABLE `sensore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stanza`
--

DROP TABLE IF EXISTS `stanza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stanza` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(16) NOT NULL,
  `piano` int(10) unsigned NOT NULL,
  `ID_ValoriAssociati` int(10) unsigned NOT NULL,
  `priorita` enum('low','medium','high') NOT NULL DEFAULT 'low',
  `ID_edificio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Stanza_Valori` (`ID_ValoriAssociati`),
  KEY `Stanza_Edificio` (`ID_edificio`),
  CONSTRAINT `Stanza_Edificio` FOREIGN KEY (`ID_edificio`) REFERENCES `edificio` (`id`),
  CONSTRAINT `Stanza_Valori` FOREIGN KEY (`ID_ValoriAssociati`) REFERENCES `valori_associati` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stanza`
--

LOCK TABLES `stanza` WRITE;
/*!40000 ALTER TABLE `stanza` DISABLE KEYS */;
INSERT INTO `stanza` VALUES (1,'stanza1',0,1,'low',1),(2,'stanza2',1,2,'low',1),(3,'stanza3',0,3,'low',1),(4,'stanza4',1,4,'high',1),(5,'stanza5',0,5,'low',1),(6,'stanza6',1,6,'low',1),(7,'stanza7',0,7,'low',1),(8,'stanza8',1,8,'high',1),(9,'stanza9',0,9,'low',1),(10,'stanza10',1,10,'low',1),(11,'stanza11',0,11,'low',2),(12,'stanza12',1,12,'high',2),(13,'stanza13',0,13,'low',2),(14,'stanza14',1,14,'low',2),(15,'stanza15',0,15,'low',2),(16,'stanza16',1,16,'high',2),(17,'stanza17',0,17,'low',2),(18,'stanza18',1,18,'low',2),(19,'stanza19',0,19,'low',2),(20,'stanza20',1,20,'high',2),(21,'stanza21',0,21,'low',3),(22,'stanza22',1,22,'low',3),(23,'stanza23',0,23,'low',3),(24,'stanza24',1,24,'high',3),(25,'stanza25',0,25,'low',3),(26,'stanza26',1,26,'low',3),(27,'stanza27',0,27,'low',3),(28,'stanza28',1,28,'high',3),(29,'stanza29',0,29,'low',3),(30,'stanza30',1,30,'low',3),(31,'stanza31',0,31,'low',4),(32,'stanza32',1,32,'high',4),(33,'stanza33',0,33,'low',4),(34,'stanza34',1,34,'low',4),(35,'stanza35',0,35,'low',4),(36,'stanza36',1,36,'high',4),(37,'stanza37',0,37,'low',4),(38,'stanza38',1,38,'low',4),(39,'stanza39',0,39,'low',4),(40,'stanza40',1,40,'high',4),(41,'stanza41',0,41,'low',5),(42,'stanza42',1,42,'low',5),(43,'stanza43',0,43,'low',5),(44,'stanza44',1,44,'high',5),(45,'stanza45',0,45,'low',5),(46,'stanza46',1,46,'low',5),(47,'stanza47',0,47,'low',5),(48,'stanza48',1,48,'high',5),(49,'stanza49',0,49,'low',5),(50,'stanza50',1,50,'low',5),(51,'stanza51',0,51,'low',6),(52,'stanza52',1,52,'high',6),(53,'stanza53',0,53,'low',6),(54,'stanza54',1,54,'low',6),(55,'stanza55',0,55,'low',6),(56,'stanza56',1,56,'high',6),(57,'stanza57',0,57,'low',6),(58,'stanza58',1,58,'low',6),(59,'stanza59',0,59,'low',6),(60,'stanza60',1,60,'high',6),(61,'stanza61',0,61,'low',7),(62,'stanza62',1,62,'low',7),(63,'stanza63',0,63,'low',7),(64,'stanza64',1,64,'high',7),(65,'stanza65',0,65,'low',7),(66,'stanza66',1,66,'low',7),(67,'stanza67',0,67,'low',7),(68,'stanza68',1,68,'high',7),(69,'stanza69',0,69,'low',7),(70,'stanza70',1,70,'low',7),(71,'stanza71',0,71,'low',8),(72,'stanza72',1,72,'high',8),(73,'stanza73',0,73,'low',8),(74,'stanza74',1,74,'low',8),(75,'stanza75',0,75,'low',8),(76,'stanza76',1,76,'high',8),(77,'stanza77',0,77,'low',8),(78,'stanza78',1,78,'low',8),(79,'stanza79',0,79,'low',8),(80,'stanza80',1,80,'high',8),(81,'stanza81',0,81,'low',9),(82,'stanza82',1,82,'low',9),(83,'stanza83',0,83,'low',9),(84,'stanza84',1,84,'high',9),(85,'stanza85',0,85,'low',9),(86,'stanza86',1,86,'low',9),(87,'stanza87',0,87,'low',9),(88,'stanza88',1,88,'high',9),(89,'stanza89',0,89,'low',9),(90,'stanza90',1,90,'low',9),(91,'stanza91',0,91,'low',10),(92,'stanza92',1,92,'high',10),(93,'stanza93',0,93,'low',10),(94,'stanza94',1,94,'low',10),(95,'stanza95',0,95,'low',10),(96,'stanza96',1,96,'high',10),(97,'stanza97',0,97,'low',10),(98,'stanza98',1,98,'low',10),(99,'stanza99',0,99,'low',10),(100,'stanza100',1,100,'high',10),(101,'stanza101',0,101,'low',11),(102,'stanza102',1,102,'low',11),(103,'stanza103',0,103,'low',11),(104,'stanza104',1,104,'high',11),(105,'stanza105',0,105,'low',11),(106,'stanza106',1,106,'low',11),(107,'stanza107',0,107,'low',11),(108,'stanza108',1,108,'high',11),(109,'stanza109',0,109,'low',11),(110,'stanza110',1,110,'low',11),(111,'stanza111',0,111,'low',12),(112,'stanza112',1,112,'high',12),(113,'stanza113',0,113,'low',12),(114,'stanza114',1,114,'low',12),(115,'stanza115',0,115,'low',12),(116,'stanza116',1,116,'high',12),(117,'stanza117',0,117,'low',12),(118,'stanza118',1,118,'low',12),(119,'stanza119',0,119,'low',12),(120,'stanza120',1,120,'high',12),(121,'stanza121',0,121,'low',13),(122,'stanza122',1,122,'low',13),(123,'stanza123',0,123,'low',13),(124,'stanza124',1,124,'high',13),(125,'stanza125',0,125,'low',13),(126,'stanza126',1,126,'low',13),(127,'stanza127',0,127,'low',13),(128,'stanza128',1,128,'high',13),(129,'stanza129',0,129,'low',13),(130,'stanza130',1,130,'low',13),(131,'stanza131',0,131,'low',14),(132,'stanza132',1,132,'high',14),(133,'stanza133',0,133,'low',14),(134,'stanza134',1,134,'low',14),(135,'stanza135',0,135,'low',14),(136,'stanza136',1,136,'high',14),(137,'stanza137',0,137,'low',14),(138,'stanza138',1,138,'low',14),(139,'stanza139',0,139,'low',14),(140,'stanza140',1,140,'high',14),(141,'stanza141',0,141,'low',15),(142,'stanza142',1,142,'low',15),(143,'stanza143',0,143,'low',15),(144,'stanza144',1,144,'high',15),(145,'stanza145',0,145,'low',15),(146,'stanza146',1,146,'low',15),(147,'stanza147',0,147,'low',15),(148,'stanza148',1,148,'high',15),(149,'stanza149',0,149,'low',15),(150,'stanza150',1,150,'low',15),(151,'stanza151',0,151,'low',16),(152,'stanza152',1,152,'high',16),(153,'stanza153',0,153,'low',16),(154,'stanza154',1,154,'low',16),(155,'stanza155',0,155,'low',16),(156,'stanza156',1,156,'high',16),(157,'stanza157',0,157,'low',16),(158,'stanza158',1,158,'low',16),(159,'stanza159',0,159,'low',16),(160,'stanza160',1,160,'high',16),(161,'stanza161',0,161,'low',17),(162,'stanza162',1,162,'low',17),(163,'stanza163',0,163,'low',17),(164,'stanza164',1,164,'high',17),(165,'stanza165',0,165,'low',17),(166,'stanza166',1,166,'low',17),(167,'stanza167',0,167,'low',17),(168,'stanza168',1,168,'high',17),(169,'stanza169',0,169,'low',17),(170,'stanza170',1,170,'low',17),(171,'stanza171',0,171,'low',18),(172,'stanza172',1,172,'high',18),(173,'stanza173',0,173,'low',18),(174,'stanza174',1,174,'low',18),(175,'stanza175',0,175,'low',18),(176,'stanza176',1,176,'high',18),(177,'stanza177',0,177,'low',18),(178,'stanza178',1,178,'low',18),(179,'stanza179',0,179,'low',18),(180,'stanza180',1,180,'high',18),(181,'stanza181',0,181,'low',19),(182,'stanza182',1,182,'low',19),(183,'stanza183',0,183,'low',19),(184,'stanza184',1,184,'high',19),(185,'stanza185',0,185,'low',19),(186,'stanza186',1,186,'low',19),(187,'stanza187',0,187,'low',19),(188,'stanza188',1,188,'high',19),(189,'stanza189',0,189,'low',19),(190,'stanza190',1,190,'low',19),(191,'stanza191',0,191,'low',20),(192,'stanza192',1,192,'high',20),(193,'stanza193',0,193,'low',20),(194,'stanza194',1,194,'low',20),(195,'stanza195',0,195,'low',20),(196,'stanza196',1,196,'high',20),(197,'stanza197',0,197,'low',20),(198,'stanza198',1,198,'low',20),(199,'stanza199',0,199,'low',20),(200,'stanza200',1,200,'high',20);
/*!40000 ALTER TABLE `stanza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `utente` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `cognome` varchar(200) NOT NULL,
  `numero_telefono` varchar(15) NOT NULL,
  `tipo` enum('Edificio','Zona','Citta','Amministratore') NOT NULL,
  `username` varchar(50) NOT NULL,
  `pass_word` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'Mario','Rossi','1','Edificio','utente1','utente'),(2,'Mario','Rossi','2','Edificio','utente2','utente'),(3,'Mario','Rossi','3','Edificio','utente3','utente'),(4,'Mario','Rossi','4','Edificio','utente4','utente'),(5,'Mario','Rossi','5','Edificio','utente5','utente'),(6,'Mario','Rossi','6','Edificio','utente6','utente'),(7,'Mario','Rossi','7','Edificio','utente7','utente'),(8,'Mario','Rossi','8','Edificio','utente8','utente'),(9,'Mario','Rossi','9','Edificio','utente9','utente'),(10,'Mario','Rossi','10','Edificio','utente10','utente'),(11,'Mario','Rossi','11','Edificio','utente11','utente'),(12,'Mario','Rossi','12','Edificio','utente12','utente'),(13,'Mario','Rossi','13','Edificio','utente13','utente'),(14,'Mario','Rossi','14','Edificio','utente14','utente'),(15,'Mario','Rossi','15','Edificio','utente15','utente'),(16,'Mario','Rossi','16','Edificio','utente16','utente'),(17,'Mario','Rossi','17','Edificio','utente17','utente'),(18,'Mario','Rossi','18','Edificio','utente18','utente'),(19,'Mario','Rossi','19','Edificio','utente19','utente'),(20,'Mario','Rossi','20','Edificio','utente20','utente'),(21,'Mario','Rossi','21','Zona','utente21','utente'),(22,'Mario','Rossi','22','Zona','utente22','utente'),(23,'Mario','Rossi','23','Zona','utente23','utente'),(24,'Mario','Rossi','24','Zona','utente24','utente'),(25,'Lillo','Brillo','324567894','Citta','utentecitta','utente'),(26,'Giuseppe','Rossi','333232424','Amministratore','admin','admin');
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valore`
--

DROP TABLE IF EXISTS `valore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `valore` (
  `ID_Sensore` int(10) unsigned NOT NULL,
  `valore_percepito` double(10,2) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Sensore`),
  CONSTRAINT `valore_sensore` FOREIGN KEY (`ID_Sensore`) REFERENCES `sensore` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valore`
--

LOCK TABLES `valore` WRITE;
/*!40000 ALTER TABLE `valore` DISABLE KEYS */;
INSERT INTO `valore` VALUES (1,7.93,'2019-01-20 20:09:15'),(2,1636.94,'2019-01-20 20:09:15'),(3,996.47,'2019-01-20 19:02:30'),(4,16.04,'2019-01-20 20:09:14'),(5,4.25,'2019-01-20 20:09:14'),(6,1444.45,'2019-01-20 19:00:09'),(7,437.26,'2019-01-20 19:02:28'),(8,31.01,'2019-01-20 19:01:25'),(9,15.52,'2019-01-20 20:09:13'),(10,1317.80,'2019-01-20 20:09:13'),(11,830.66,'2019-01-20 20:09:12'),(12,72.05,'2019-01-20 19:01:27'),(13,34.21,'2019-01-20 20:09:11'),(14,1271.29,'2019-01-20 20:09:11'),(15,257.21,'2019-01-20 20:09:11'),(16,55.14,'2019-01-20 19:00:35'),(17,39.73,'2019-01-20 20:09:10'),(18,1977.97,'2019-01-20 20:09:09'),(19,664.62,'2019-01-20 18:56:23'),(20,84.48,'2019-01-20 20:09:08'),(21,12.05,'2019-01-20 20:09:07'),(22,1372.32,'2019-01-20 20:09:07'),(23,279.86,'2019-01-20 20:09:06'),(24,85.69,'2019-01-20 20:09:05'),(25,7.06,'2019-01-20 20:09:04'),(26,956.00,'2019-01-20 20:09:03'),(27,541.51,'2019-01-20 20:09:02'),(28,61.55,'2019-01-20 20:07:59'),(29,6.84,'2019-01-20 20:09:01'),(30,1866.33,'2019-01-20 20:09:01'),(31,276.11,'2019-01-20 20:09:00'),(32,20.61,'2019-01-20 20:09:00'),(33,25.23,'2019-01-20 20:09:00'),(34,1207.87,'2019-01-20 19:01:37'),(35,127.57,'2019-01-20 20:09:00'),(36,33.73,'2019-01-20 20:07:58'),(37,12.49,'2019-01-20 20:08:59'),(38,1307.80,'2019-01-20 20:08:59'),(39,58.39,'2019-01-20 20:08:59'),(40,29.39,'2019-01-20 20:08:59'),(41,7.02,'2019-01-20 20:08:58'),(42,934.88,'2019-01-20 20:08:58'),(43,843.15,'2019-01-20 20:08:58'),(44,59.53,'2019-01-20 20:08:57'),(45,35.46,'2019-01-20 20:08:57'),(46,1789.01,'2019-01-20 20:08:57'),(47,576.54,'2019-01-20 20:08:56'),(48,52.63,'2019-01-20 20:08:56'),(49,33.28,'2019-01-20 20:09:58'),(50,1463.77,'2019-01-20 20:08:56'),(51,0.91,'2019-01-20 20:08:56'),(52,70.01,'2019-01-20 20:08:55'),(53,6.14,'2019-01-20 20:09:58'),(54,1403.58,'2019-01-20 20:08:55'),(55,209.85,'2019-01-20 20:08:55'),(56,26.63,'2019-01-20 20:07:51'),(57,31.10,'2019-01-20 20:07:51'),(58,1824.22,'2019-01-20 19:02:25'),(59,659.07,'2019-01-20 19:02:15'),(60,32.25,'2019-01-20 18:59:59'),(61,31.24,'2019-01-20 19:00:07'),(62,1724.95,'2019-01-20 19:00:15'),(63,21.33,'2019-01-20 18:58:40'),(64,35.29,'2019-01-20 19:02:08'),(65,19.16,'2019-01-20 20:09:33'),(66,1718.54,'2019-01-20 19:00:28'),(67,717.47,'2019-01-20 18:57:31'),(68,73.97,'2019-01-20 19:01:18'),(69,36.13,'2019-01-20 20:09:31'),(70,1591.51,'2019-01-20 20:09:32'),(71,983.35,'2019-01-20 20:09:32'),(72,97.43,'2019-01-20 20:09:31'),(73,11.74,'2019-01-20 19:02:07'),(74,1468.31,'2019-01-20 20:09:30'),(75,903.56,'2019-01-20 20:09:29'),(76,50.38,'2019-01-20 19:00:15'),(77,2.94,'2019-01-20 19:02:28'),(78,1077.00,'2019-01-20 20:09:28'),(79,313.14,'2019-01-20 20:09:28'),(80,39.19,'2019-01-20 20:09:26'),(81,26.73,'2019-01-20 20:09:25'),(82,1145.97,'2019-01-20 20:09:24'),(83,649.31,'2019-01-20 20:09:23'),(84,86.80,'2019-01-20 19:00:12'),(85,0.62,'2019-01-20 19:01:04'),(86,1136.38,'2019-01-20 20:07:59'),(87,633.54,'2019-01-20 19:02:25'),(88,18.27,'2019-01-20 20:09:23'),(89,13.80,'2019-01-20 20:07:58'),(90,1046.85,'2019-01-20 20:07:58'),(91,436.43,'2019-01-20 20:07:57'),(92,15.46,'2019-01-20 20:07:57'),(93,29.94,'2019-01-20 20:09:22'),(94,1562.43,'2019-01-20 20:09:22'),(95,875.40,'2019-01-20 20:07:55'),(96,26.98,'2019-01-20 20:07:55'),(97,35.01,'2019-01-20 20:09:21'),(98,1873.95,'2019-01-20 20:09:21'),(99,25.58,'2019-01-20 20:09:19'),(100,1.30,'2019-01-20 20:09:18'),(101,32.06,'2019-01-20 20:09:18'),(102,1901.03,'2019-01-20 20:09:17'),(103,321.58,'2019-01-20 20:07:51'),(104,77.69,'2019-01-20 20:07:51'),(105,30.84,'2019-01-20 20:07:51'),(106,1967.13,'2019-01-20 20:07:50'),(107,70.76,'2019-01-20 20:07:50'),(108,24.55,'2019-01-20 20:09:15'),(109,2.25,'2019-01-20 20:07:50'),(110,1586.34,'2019-01-20 20:07:50'),(111,605.16,'2019-01-20 20:07:49'),(112,98.73,'2019-01-20 20:07:49'),(113,25.08,'2019-01-20 20:09:11'),(114,1677.22,'2019-01-20 20:09:11'),(115,724.68,'2019-01-20 20:09:10'),(116,16.45,'2019-01-20 20:09:09'),(117,20.30,'2019-01-20 20:09:08'),(118,1122.88,'2019-01-20 20:09:06'),(119,410.79,'2019-01-20 20:09:05'),(120,1.37,'2019-01-20 20:08:45'),(121,20.93,'2019-01-20 20:08:53'),(122,1228.57,'2019-01-20 20:08:52'),(123,723.73,'2019-01-20 20:08:52'),(124,80.20,'2019-01-20 20:08:45'),(125,37.42,'2019-01-20 20:08:46'),(126,1093.11,'2019-01-20 20:08:46'),(127,482.78,'2019-01-20 20:08:49'),(128,87.17,'2019-01-20 20:08:48'),(129,23.50,'2019-01-20 20:10:05'),(130,1462.57,'2019-01-20 20:08:30'),(131,334.33,'2019-01-20 20:08:29'),(132,18.48,'2019-01-20 20:08:30'),(133,35.97,'2019-01-20 20:08:32'),(134,1843.29,'2019-01-20 20:08:32'),(135,774.44,'2019-01-20 20:08:32'),(136,76.45,'2019-01-20 20:08:54'),(137,9.12,'2019-01-20 20:08:32'),(138,1797.22,'2019-01-20 20:08:30'),(139,833.16,'2019-01-20 20:08:31'),(140,48.47,'2019-01-20 20:08:32'),(141,37.86,'2019-01-20 20:08:31'),(142,1856.06,'2019-01-20 20:08:32'),(143,948.09,'2019-01-20 20:08:31'),(144,2.91,'2019-01-20 20:08:31'),(145,10.51,'2019-01-20 20:08:30'),(146,1464.82,'2019-01-20 20:08:31'),(147,655.87,'2019-01-20 20:08:31'),(148,14.42,'2019-01-20 20:08:31'),(149,21.72,'2019-01-20 20:08:29'),(150,1104.63,'2019-01-20 20:08:30'),(151,905.74,'2019-01-20 20:08:30'),(152,90.26,'2019-01-20 20:08:30'),(153,6.60,'2019-01-20 19:01:25'),(154,1782.56,'2019-01-20 20:08:29'),(155,790.06,'2019-01-20 20:08:26'),(156,88.29,'2019-01-20 20:10:00'),(157,17.86,'2019-01-20 20:08:23'),(158,1220.45,'2019-01-20 20:08:23'),(159,337.07,'2019-01-20 20:08:22'),(160,0.89,'2019-01-20 20:10:05'),(161,37.38,'2019-01-20 20:09:59'),(162,1678.09,'2019-01-20 20:08:19'),(163,331.21,'2019-01-20 20:08:18'),(164,92.04,'2019-01-20 20:08:18'),(165,23.85,'2019-01-20 20:08:17'),(166,1670.07,'2019-01-20 20:08:17'),(167,229.38,'2019-01-20 20:08:16'),(168,41.27,'2019-01-20 20:08:16'),(169,2.66,'2019-01-20 20:08:16'),(170,1883.73,'2019-01-20 20:08:16'),(171,206.86,'2019-01-20 20:08:13'),(172,36.87,'2019-01-20 20:08:12'),(173,10.62,'2019-01-20 20:08:12'),(174,1106.06,'2019-01-20 20:09:54'),(175,124.73,'2019-01-20 18:57:52'),(176,73.41,'2019-01-20 20:09:53'),(177,36.33,'2019-01-20 20:10:02'),(178,1011.08,'2019-01-20 20:09:53'),(179,876.36,'2019-01-20 20:10:03'),(180,89.95,'2019-01-20 20:10:13'),(181,28.83,'2019-01-20 20:09:53'),(182,1216.60,'2019-01-20 20:10:04'),(183,600.40,'2019-01-20 20:09:53'),(184,54.46,'2019-01-20 20:09:52'),(185,14.54,'2019-01-20 20:10:04'),(186,1728.49,'2019-01-20 20:09:52'),(187,225.43,'2019-01-20 20:10:05'),(188,44.63,'2019-01-20 20:10:05'),(189,14.36,'2019-01-20 20:10:07'),(190,1646.84,'2019-01-20 20:09:52'),(191,398.48,'2019-01-20 20:10:05'),(192,22.47,'2019-01-20 20:10:06'),(193,28.44,'2019-01-20 20:09:51'),(194,1330.74,'2019-01-20 20:10:06'),(195,462.20,'2019-01-20 20:09:51'),(196,99.95,'2019-01-20 20:10:06'),(197,6.77,'2019-01-20 20:10:06'),(198,1115.38,'2019-01-20 20:09:50'),(199,457.82,'2019-01-20 20:09:50'),(200,8.50,'2019-01-20 20:10:06'),(201,23.63,'2019-01-20 19:02:13'),(202,979.06,'2019-01-20 20:09:50'),(203,130.80,'2019-01-20 20:09:50'),(204,54.70,'2019-01-20 20:10:11'),(205,26.20,'2019-01-20 20:10:07'),(206,1440.41,'2019-01-20 20:09:49'),(207,678.25,'2019-01-20 18:58:12'),(208,96.49,'2019-01-20 20:09:49'),(209,31.52,'2019-01-20 20:10:08'),(210,1316.86,'2019-01-20 20:10:08'),(211,318.00,'2019-01-20 20:09:49'),(212,64.99,'2019-01-20 20:10:08'),(213,33.80,'2019-01-20 20:10:09'),(214,1224.04,'2019-01-20 20:10:10'),(215,58.97,'2019-01-20 20:10:10'),(216,7.84,'2019-01-20 19:01:26'),(217,29.79,'2019-01-20 20:09:48'),(218,1041.66,'2019-01-20 20:10:11'),(219,950.69,'2019-01-20 18:56:57'),(220,29.50,'2019-01-20 20:09:48'),(221,6.87,'2019-01-20 20:09:47'),(222,1211.09,'2019-01-20 19:02:01'),(223,141.68,'2019-01-20 20:09:46'),(224,31.35,'2019-01-20 19:02:28'),(225,39.45,'2019-01-20 19:01:40'),(226,1636.48,'2019-01-20 20:09:43'),(227,484.48,'2019-01-20 20:09:42'),(228,87.56,'2019-01-20 18:59:58'),(229,7.76,'2019-01-20 20:09:38'),(230,1804.67,'2019-01-20 20:09:36'),(231,369.38,'2019-01-20 20:09:35'),(232,44.20,'2019-01-20 20:09:35'),(233,34.74,'2019-01-20 19:02:30'),(234,1365.52,'2019-01-20 20:09:34'),(235,947.71,'2019-01-20 20:09:34'),(236,71.27,'2019-01-20 19:01:16'),(237,22.08,'2019-01-20 19:01:32'),(238,1518.38,'2019-01-20 20:09:34'),(239,955.12,'2019-01-20 20:09:35'),(240,39.84,'2019-01-20 20:09:34'),(241,0.74,'2019-01-20 20:09:34'),(242,1119.91,'2019-01-20 20:09:34'),(243,495.56,'2019-01-20 20:09:34'),(244,59.04,'2019-01-20 19:01:05'),(245,7.41,'2019-01-20 19:00:38'),(246,914.94,'2019-01-20 18:59:23'),(247,836.48,'2019-01-20 18:57:54'),(248,71.17,'2019-01-20 18:59:41'),(249,33.39,'2019-01-20 19:02:26'),(250,903.68,'2019-01-20 20:09:33'),(251,978.59,'2019-01-20 20:09:33'),(252,87.35,'2019-01-20 19:01:06'),(253,4.10,'2019-01-20 19:02:04'),(254,1068.92,'2019-01-20 19:00:57'),(255,703.05,'2019-01-20 18:57:59'),(256,49.26,'2019-01-20 19:02:10'),(257,34.75,'2019-01-20 19:01:29'),(258,1677.48,'2019-01-20 19:01:07'),(259,250.28,'2019-01-20 18:59:14'),(260,87.79,'2019-01-20 19:00:26'),(261,2.64,'2019-01-20 19:02:26'),(262,915.65,'2019-01-20 19:01:23'),(263,426.09,'2019-01-20 20:09:33'),(264,77.83,'2019-01-20 18:59:52'),(265,8.74,'2019-01-20 19:02:02'),(266,1782.11,'2019-01-20 19:01:23'),(267,137.15,'2019-01-20 20:09:33'),(268,60.24,'2019-01-20 19:00:57'),(269,16.44,'2019-01-20 20:09:32'),(270,1383.20,'2019-01-20 20:09:32'),(271,200.66,'2019-01-20 20:09:32'),(272,20.61,'2019-01-20 19:00:42'),(273,0.04,'2019-01-20 19:02:27'),(274,1163.39,'2019-01-20 20:09:31'),(275,268.59,'2019-01-20 18:58:24'),(276,43.18,'2019-01-20 19:00:26'),(277,3.47,'2019-01-20 20:09:30'),(278,1014.45,'2019-01-20 19:02:21'),(279,195.44,'2019-01-20 20:09:30'),(280,70.57,'2019-01-20 20:09:29'),(281,22.43,'2019-01-20 20:09:29'),(282,1283.68,'2019-01-20 19:00:49'),(283,523.46,'2019-01-20 18:58:47'),(284,90.13,'2019-01-20 19:01:19'),(285,24.87,'2019-01-20 19:02:29'),(286,1518.62,'2019-01-20 20:09:28'),(287,70.27,'2019-01-20 18:58:58'),(288,68.65,'2019-01-20 20:09:28'),(289,11.71,'2019-01-20 20:09:27'),(290,1450.36,'2019-01-20 19:01:18'),(291,647.76,'2019-01-20 20:09:25'),(292,90.80,'2019-01-20 20:09:25'),(293,27.27,'2019-01-20 20:09:24'),(294,1333.95,'2019-01-20 20:09:24'),(295,40.32,'2019-01-20 20:09:24'),(296,66.35,'2019-01-20 19:01:22'),(297,9.31,'2019-01-20 19:01:48'),(298,979.32,'2019-01-20 20:08:44'),(299,79.93,'2019-01-20 20:08:52'),(300,17.91,'2019-01-20 20:08:45'),(301,14.74,'2019-01-20 20:08:51'),(302,971.37,'2019-01-20 20:08:49'),(303,873.34,'2019-01-20 20:08:49'),(304,32.88,'2019-01-20 20:08:51'),(305,1.69,'2019-01-20 20:08:39'),(306,1174.05,'2019-01-20 20:08:30'),(307,247.80,'2019-01-20 20:08:29'),(308,84.09,'2019-01-20 20:08:27'),(309,36.40,'2019-01-20 20:08:25'),(310,1946.39,'2019-01-20 20:08:55'),(311,812.71,'2019-01-20 20:08:23'),(312,68.94,'2019-01-20 20:10:04'),(313,21.27,'2019-01-20 20:08:22'),(314,1026.91,'2019-01-20 20:08:21'),(315,880.90,'2019-01-20 20:08:20'),(316,35.03,'2019-01-20 20:10:07'),(317,15.33,'2019-01-20 20:08:18'),(318,1654.74,'2019-01-20 20:08:17'),(319,708.91,'2019-01-20 20:08:13'),(320,91.75,'2019-01-20 20:09:56'),(321,34.17,'2019-01-20 20:09:59'),(322,1149.57,'2019-01-20 20:08:12'),(323,447.92,'2019-01-20 20:09:54'),(324,5.67,'2019-01-20 20:09:54'),(325,30.13,'2019-01-20 20:09:48'),(326,1324.35,'2019-01-20 20:09:48'),(327,316.87,'2019-01-20 18:57:15'),(328,23.44,'2019-01-20 20:10:14'),(329,13.64,'2019-01-20 20:10:14'),(330,1347.30,'2019-01-20 20:10:15'),(331,931.73,'2019-01-20 18:57:52'),(332,75.40,'2019-01-20 19:01:00'),(333,27.37,'2019-01-20 20:09:47'),(334,1172.69,'2019-01-20 20:09:47'),(335,27.32,'2019-01-20 20:09:47'),(336,31.56,'2019-01-20 20:09:47'),(337,32.93,'2019-01-20 19:01:53'),(338,1108.75,'2019-01-20 20:09:46'),(339,139.43,'2019-01-20 20:09:46'),(340,99.54,'2019-01-20 18:59:26'),(341,34.88,'2019-01-20 19:02:22'),(342,1596.45,'2019-01-20 20:09:45'),(343,764.77,'2019-01-20 20:09:44'),(344,98.79,'2019-01-20 20:09:43'),(345,33.37,'2019-01-20 20:09:43'),(346,1863.09,'2019-01-20 20:09:42'),(347,207.55,'2019-01-20 20:09:41'),(348,64.59,'2019-01-20 20:09:40'),(349,1.15,'2019-01-20 20:09:39'),(350,933.20,'2019-01-20 20:09:38'),(351,458.89,'2019-01-20 18:57:27'),(352,67.27,'2019-01-20 20:09:37'),(353,19.50,'2019-01-20 20:09:36'),(354,1140.64,'2019-01-20 19:00:31'),(355,383.64,'2019-01-20 18:57:30'),(356,73.15,'2019-01-20 19:01:45'),(357,34.41,'2019-01-20 20:09:35'),(358,1619.96,'2019-01-20 19:02:17'),(359,201.82,'2019-01-20 20:09:16'),(360,39.48,'2019-01-20 20:09:16'),(361,3.91,'2019-01-20 20:09:16'),(362,1464.39,'2019-01-20 20:09:16'),(363,833.76,'2019-01-20 18:56:52'),(364,17.25,'2019-01-20 19:01:18'),(365,14.05,'2019-01-20 19:00:25'),(366,1322.41,'2019-01-20 20:09:15'),(367,388.12,'2019-01-20 18:57:09'),(368,3.63,'2019-01-20 20:09:14'),(369,11.64,'2019-01-20 20:09:13'),(370,1981.12,'2019-01-20 20:09:13'),(371,948.57,'2019-01-20 18:56:50'),(372,0.15,'2019-01-20 19:01:16'),(373,18.32,'2019-01-20 20:09:12'),(374,1416.69,'2019-01-20 20:09:12'),(375,22.67,'2019-01-20 20:09:11'),(376,20.19,'2019-01-20 19:02:28'),(377,33.89,'2019-01-20 20:09:10'),(378,1229.02,'2019-01-20 20:09:10'),(379,218.19,'2019-01-20 20:09:09'),(380,39.89,'2019-01-20 20:09:09'),(381,11.90,'2019-01-20 20:09:08'),(382,1745.32,'2019-01-20 20:09:08'),(383,338.14,'2019-01-20 20:09:07'),(384,1.77,'2019-01-20 19:00:54'),(385,2.22,'2019-01-20 20:09:06'),(386,1938.91,'2019-01-20 20:09:05'),(387,24.64,'2019-01-20 20:09:04'),(388,97.95,'2019-01-20 20:09:04'),(389,36.68,'2019-01-20 20:09:03'),(390,1805.79,'2019-01-20 19:01:56'),(391,889.29,'2019-01-20 20:09:02'),(392,63.40,'2019-01-20 20:09:02'),(393,39.88,'2019-01-20 20:09:01'),(394,1403.63,'2019-01-20 20:09:01'),(395,684.15,'2019-01-20 20:09:00'),(396,60.85,'2019-01-20 20:09:00'),(397,38.80,'2019-01-20 20:09:00'),(398,949.43,'2019-01-20 20:09:00'),(399,654.70,'2019-01-20 18:56:37'),(400,79.21,'2019-01-20 20:08:59'),(401,28.87,'2019-01-20 20:08:59'),(402,1104.06,'2019-01-20 20:08:59'),(403,986.16,'2019-01-20 20:08:59'),(404,48.88,'2019-01-20 20:08:58'),(405,0.09,'2019-01-20 20:08:58'),(406,1891.78,'2019-01-20 20:08:58'),(407,530.34,'2019-01-20 20:08:57'),(408,77.27,'2019-01-20 20:08:57'),(409,11.27,'2019-01-20 20:09:57'),(410,1397.48,'2019-01-20 20:08:57'),(411,447.18,'2019-01-20 20:08:56'),(412,4.28,'2019-01-20 20:08:56'),(413,19.08,'2019-01-20 20:09:58'),(414,1868.51,'2019-01-20 20:08:56'),(415,566.19,'2019-01-20 20:08:55'),(416,31.05,'2019-01-20 20:08:55'),(417,30.12,'2019-01-20 20:09:59'),(418,1081.62,'2019-01-20 19:00:56'),(419,600.88,'2019-01-20 18:57:52'),(420,22.97,'2019-01-20 19:00:15'),(421,22.67,'2019-01-20 19:00:00'),(422,1676.39,'2019-01-20 18:59:58'),(423,22.08,'2019-01-20 18:58:25'),(424,68.29,'2019-01-20 19:00:10'),(425,27.82,'2019-01-20 20:09:23'),(426,909.53,'2019-01-20 20:09:23'),(427,803.74,'2019-01-20 18:58:04'),(428,93.76,'2019-01-20 19:01:16'),(429,36.94,'2019-01-20 19:02:02'),(430,1421.88,'2019-01-20 19:02:30'),(431,534.80,'2019-01-20 18:58:15'),(432,94.60,'2019-01-20 19:02:02'),(433,25.72,'2019-01-20 19:02:19'),(434,1802.20,'2019-01-20 19:01:15'),(435,691.99,'2019-01-20 18:58:09'),(436,94.27,'2019-01-20 19:00:03'),(437,30.24,'2019-01-20 19:02:02'),(438,1042.04,'2019-01-20 20:09:22'),(439,938.43,'2019-01-20 20:09:22'),(440,95.40,'2019-01-20 19:02:09'),(441,19.30,'2019-01-20 19:01:49'),(442,1931.25,'2019-01-20 19:00:22'),(443,512.89,'2019-01-20 18:58:08'),(444,55.88,'2019-01-20 19:00:26'),(445,17.18,'2019-01-20 20:09:21'),(446,1138.87,'2019-01-20 20:09:21'),(447,870.00,'2019-01-20 20:09:21'),(448,49.66,'2019-01-20 20:09:21'),(449,34.23,'2019-01-20 19:00:28'),(450,1747.91,'2019-01-20 20:09:20'),(451,845.42,'2019-01-20 18:58:13'),(452,10.17,'2019-01-20 19:02:18'),(453,17.12,'2019-01-20 20:09:20'),(454,1960.81,'2019-01-20 20:09:20'),(455,911.36,'2019-01-20 20:09:20'),(456,26.72,'2019-01-20 19:01:55'),(457,32.17,'2019-01-20 20:09:20'),(458,1363.65,'2019-01-20 20:09:20'),(459,983.53,'2019-01-20 18:58:16'),(460,24.42,'2019-01-20 20:09:20'),(461,25.42,'2019-01-20 20:09:20'),(462,1575.07,'2019-01-20 20:09:19'),(463,700.80,'2019-01-20 20:09:19'),(464,63.54,'2019-01-20 19:01:35'),(465,29.93,'2019-01-20 19:01:33'),(466,1503.77,'2019-01-20 20:09:19'),(467,845.35,'2019-01-20 18:58:22'),(468,87.55,'2019-01-20 20:09:19'),(469,7.25,'2019-01-20 19:02:08'),(470,1613.29,'2019-01-20 20:09:18'),(471,109.44,'2019-01-20 20:09:17'),(472,98.18,'2019-01-20 20:09:17'),(473,5.86,'2019-01-20 20:09:17'),(474,1654.47,'2019-01-20 19:02:29'),(475,40.94,'2019-01-20 18:58:23'),(476,51.27,'2019-01-20 19:02:30'),(477,30.96,'2019-01-20 19:02:04'),(478,1648.72,'2019-01-20 20:09:28'),(479,275.78,'2019-01-20 18:58:24'),(480,66.07,'2019-01-20 20:09:27'),(481,23.34,'2019-01-20 20:09:26'),(482,1422.53,'2019-01-20 20:09:25'),(483,532.94,'2019-01-20 18:56:53'),(484,35.95,'2019-01-20 20:09:24'),(485,38.80,'2019-01-20 19:01:08'),(486,933.26,'2019-01-20 19:01:43'),(487,254.12,'2019-01-20 20:09:23'),(488,6.90,'2019-01-20 19:01:19'),(489,32.87,'2019-01-20 19:01:02'),(490,1815.65,'2019-01-20 19:01:23'),(491,780.18,'2019-01-20 18:56:51'),(492,63.16,'2019-01-20 19:02:27'),(493,21.54,'2019-01-20 19:01:04'),(494,1740.31,'2019-01-20 19:00:57'),(495,80.56,'2019-01-20 18:58:31'),(496,16.71,'2019-01-20 20:09:23'),(497,25.33,'2019-01-20 19:01:08'),(498,1368.09,'2019-01-20 19:02:12'),(499,562.20,'2019-01-20 18:56:50'),(500,90.14,'2019-01-20 19:00:54'),(501,33.00,'2019-01-20 19:01:16'),(502,1373.03,'2019-01-20 19:02:08'),(503,447.09,'2019-01-20 18:59:41'),(504,88.82,'2019-01-20 19:00:52'),(505,13.38,'2019-01-20 19:01:01'),(506,1653.52,'2019-01-20 19:00:25'),(507,838.19,'2019-01-20 20:09:22'),(508,90.89,'2019-01-20 20:09:22'),(509,5.11,'2019-01-20 20:09:22'),(510,1534.70,'2019-01-20 20:09:21'),(511,176.93,'2019-01-20 18:56:45'),(512,93.27,'2019-01-20 19:01:45'),(513,16.42,'2019-01-20 19:00:40'),(514,1612.64,'2019-01-20 20:09:21'),(515,311.71,'2019-01-20 20:09:21'),(516,66.89,'2019-01-20 18:59:37'),(517,20.17,'2019-01-20 20:09:21'),(518,1911.58,'2019-01-20 20:09:19'),(519,878.48,'2019-01-20 18:56:43'),(520,12.85,'2019-01-20 20:09:18'),(521,3.28,'2019-01-20 20:09:18'),(522,1225.70,'2019-01-20 20:09:18'),(523,702.09,'2019-01-20 20:09:17'),(524,22.45,'2019-01-20 20:09:17'),(525,30.76,'2019-01-20 19:01:09'),(526,1420.85,'2019-01-20 19:00:54'),(527,878.61,'2019-01-20 18:57:31'),(528,8.41,'2019-01-20 19:01:17'),(529,33.90,'2019-01-20 19:01:51'),(530,948.33,'2019-01-20 19:00:03'),(531,779.67,'2019-01-20 20:09:16'),(532,90.14,'2019-01-20 19:01:12'),(533,3.15,'2019-01-20 19:02:31'),(534,1138.13,'2019-01-20 20:09:16'),(535,335.84,'2019-01-20 20:09:16'),(536,80.88,'2019-01-20 19:02:20'),(537,24.98,'2019-01-20 20:09:40'),(538,1007.69,'2019-01-20 20:09:40'),(539,841.77,'2019-01-20 18:58:02'),(540,29.42,'2019-01-20 20:09:38'),(541,22.48,'2019-01-20 20:09:36'),(542,1180.30,'2019-01-20 20:09:36'),(543,160.49,'2019-01-20 20:09:36'),(544,96.96,'2019-01-20 20:09:35'),(545,38.96,'2019-01-20 20:09:35'),(546,1221.48,'2019-01-20 20:09:35'),(547,986.72,'2019-01-20 20:09:35'),(548,6.29,'2019-01-20 20:09:35'),(549,28.01,'2019-01-20 20:09:34'),(550,1041.33,'2019-01-20 19:00:21'),(551,504.24,'2019-01-20 18:57:03'),(552,11.36,'2019-01-20 19:01:54'),(553,15.65,'2019-01-20 19:02:07'),(554,1768.45,'2019-01-20 18:59:52'),(555,851.29,'2019-01-20 18:58:06'),(556,6.53,'2019-01-20 19:02:29'),(557,34.04,'2019-01-20 19:02:20'),(558,985.13,'2019-01-20 19:01:04'),(559,358.06,'2019-01-20 18:58:06'),(560,25.22,'2019-01-20 20:09:33'),(561,13.90,'2019-01-20 19:01:33'),(562,1193.78,'2019-01-20 19:01:02'),(563,153.70,'2019-01-20 18:58:08'),(564,73.92,'2019-01-20 19:00:44'),(565,31.04,'2019-01-20 19:01:45'),(566,1063.60,'2019-01-20 19:00:45'),(567,903.25,'2019-01-20 18:58:11'),(568,3.78,'2019-01-20 19:00:03'),(569,4.77,'2019-01-20 19:01:07'),(570,1624.11,'2019-01-20 20:09:33'),(571,637.19,'2019-01-20 20:09:33'),(572,36.68,'2019-01-20 20:09:33'),(573,35.36,'2019-01-20 20:09:32'),(574,1752.96,'2019-01-20 19:02:09'),(575,787.34,'2019-01-20 20:09:32'),(576,9.81,'2019-01-20 20:09:32'),(577,9.17,'2019-01-20 19:01:24'),(578,1133.01,'2019-01-20 20:09:31'),(579,271.74,'2019-01-20 20:09:31'),(580,33.93,'2019-01-20 20:09:31'),(581,19.43,'2019-01-20 20:09:31'),(582,1024.37,'2019-01-20 20:09:30'),(583,853.46,'2019-01-20 20:09:30'),(584,36.01,'2019-01-20 20:09:30'),(585,39.52,'2019-01-20 20:09:30'),(586,1355.00,'2019-01-20 18:59:24'),(587,949.08,'2019-01-20 20:09:29'),(588,97.58,'2019-01-20 20:09:29'),(589,17.69,'2019-01-20 19:01:57'),(590,1261.30,'2019-01-20 19:01:58'),(591,311.32,'2019-01-20 18:58:22'),(592,88.42,'2019-01-20 19:00:57'),(593,36.22,'2019-01-20 19:00:21'),(594,1833.71,'2019-01-20 19:00:00'),(595,871.85,'2019-01-20 20:09:28'),(596,80.48,'2019-01-20 19:02:28'),(597,17.68,'2019-01-20 20:09:57'),(598,1479.61,'2019-01-20 20:08:43'),(599,553.73,'2019-01-20 20:08:53'),(600,48.04,'2019-01-20 20:07:41'),(601,38.12,'2019-01-20 20:08:45'),(602,1123.07,'2019-01-20 20:08:51'),(603,983.14,'2019-01-20 20:08:46'),(604,81.01,'2019-01-20 20:08:48'),(605,20.22,'2019-01-20 20:08:47'),(606,1747.45,'2019-01-20 20:08:32'),(607,669.49,'2019-01-20 20:08:54'),(608,55.49,'2019-01-20 20:08:36'),(609,21.53,'2019-01-20 20:08:30'),(610,1175.76,'2019-01-20 20:08:28'),(611,978.60,'2019-01-20 20:08:27'),(612,89.84,'2019-01-20 20:08:26'),(613,6.58,'2019-01-20 20:08:26'),(614,1205.08,'2019-01-20 20:08:24'),(615,417.61,'2019-01-20 20:08:24'),(616,6.05,'2019-01-20 20:10:01'),(617,6.98,'2019-01-20 20:08:23'),(618,1149.84,'2019-01-20 20:08:23'),(619,931.35,'2019-01-20 20:08:23'),(620,94.99,'2019-01-20 20:08:22'),(621,12.31,'2019-01-20 20:08:22'),(622,1673.59,'2019-01-20 20:08:21'),(623,918.70,'2019-01-20 20:08:21'),(624,75.32,'2019-01-20 20:08:20'),(625,12.57,'2019-01-20 20:08:20'),(626,1564.45,'2019-01-20 20:08:20'),(627,956.63,'2019-01-20 20:08:19'),(628,58.58,'2019-01-20 20:10:07'),(629,14.55,'2019-01-20 20:08:18'),(630,1461.33,'2019-01-20 20:08:18'),(631,865.49,'2019-01-20 20:08:18'),(632,87.76,'2019-01-20 20:08:17'),(633,13.40,'2019-01-20 20:08:17'),(634,1942.79,'2019-01-20 20:08:16'),(635,167.54,'2019-01-20 20:08:16'),(636,81.34,'2019-01-20 20:08:16'),(637,5.94,'2019-01-20 20:08:16'),(638,1728.70,'2019-01-20 20:08:15'),(639,459.82,'2019-01-20 20:08:13'),(640,46.96,'2019-01-20 20:08:12'),(641,2.30,'2019-01-20 20:09:55'),(642,1885.36,'2019-01-20 20:08:12'),(643,754.33,'2019-01-20 20:09:54'),(644,55.06,'2019-01-20 20:08:12'),(645,25.79,'2019-01-20 20:08:12'),(646,1102.37,'2019-01-20 20:08:12'),(647,822.83,'2019-01-20 20:08:11'),(648,89.23,'2019-01-20 20:08:11'),(649,27.40,'2019-01-20 20:09:31'),(650,1530.23,'2019-01-20 20:09:31'),(651,663.66,'2019-01-20 20:09:32'),(652,34.61,'2019-01-20 20:08:11'),(653,36.95,'2019-01-20 19:01:42'),(654,1381.36,'2019-01-20 20:09:33'),(655,138.33,'2019-01-20 20:08:11'),(656,61.46,'2019-01-20 20:09:54'),(657,26.23,'2019-01-20 20:09:55'),(658,1154.61,'2019-01-20 20:09:56'),(659,117.63,'2019-01-20 18:57:19'),(660,68.28,'2019-01-20 20:10:06'),(661,27.25,'2019-01-20 20:09:57'),(662,1117.72,'2019-01-20 20:09:57'),(663,641.92,'2019-01-20 20:10:03'),(664,90.79,'2019-01-20 20:09:57'),(665,11.82,'2019-01-20 20:10:06'),(666,1645.71,'2019-01-20 20:10:03'),(667,947.95,'2019-01-20 20:09:53'),(668,81.40,'2019-01-20 20:09:57'),(669,9.71,'2019-01-20 20:09:57'),(670,1562.32,'2019-01-20 20:09:56'),(671,136.10,'2019-01-20 20:10:03'),(672,43.20,'2019-01-20 20:09:49'),(673,18.37,'2019-01-20 20:09:52'),(674,979.88,'2019-01-20 20:09:49'),(675,462.67,'2019-01-20 20:10:07'),(676,76.21,'2019-01-20 20:09:58'),(677,11.68,'2019-01-20 19:00:39'),(678,1525.26,'2019-01-20 20:09:58'),(679,603.51,'2019-01-20 20:09:52'),(680,66.90,'2019-01-20 20:09:56'),(681,34.28,'2019-01-20 20:09:55'),(682,1713.69,'2019-01-20 20:09:52'),(683,36.18,'2019-01-20 20:09:55'),(684,6.25,'2019-01-20 20:09:55'),(685,26.94,'2019-01-20 20:09:59'),(686,1361.55,'2019-01-20 20:09:54'),(687,841.48,'2019-01-20 20:10:00'),(688,12.32,'2019-01-20 20:09:51'),(689,23.05,'2019-01-20 20:10:01'),(690,1619.42,'2019-01-20 20:09:54'),(691,198.17,'2019-01-20 20:10:01'),(692,14.89,'2019-01-20 19:00:21'),(693,19.01,'2019-01-20 20:09:54'),(694,1991.68,'2019-01-20 19:01:10'),(695,610.40,'2019-01-20 20:10:12'),(696,2.21,'2019-01-20 20:10:12'),(697,29.54,'2019-01-20 20:09:48'),(698,1413.87,'2019-01-20 20:10:12'),(699,359.89,'2019-01-20 20:10:15'),(700,63.26,'2019-01-20 19:00:05'),(701,29.15,'2019-01-20 19:01:08'),(702,1001.61,'2019-01-20 19:01:03'),(703,212.82,'2019-01-20 18:58:53'),(704,82.17,'2019-01-20 19:00:16'),(705,31.37,'2019-01-20 19:02:27'),(706,1950.64,'2019-01-20 20:09:46'),(707,308.30,'2019-01-20 18:57:40'),(708,47.66,'2019-01-20 20:09:46'),(709,4.77,'2019-01-20 20:09:45'),(710,1718.15,'2019-01-20 20:09:45'),(711,970.74,'2019-01-20 20:09:44'),(712,2.30,'2019-01-20 20:09:44'),(713,24.97,'2019-01-20 19:01:17'),(714,1991.88,'2019-01-20 18:59:43'),(715,107.83,'2019-01-20 20:09:42'),(716,62.85,'2019-01-20 20:09:42'),(717,35.31,'2019-01-20 19:00:04'),(718,1947.53,'2019-01-20 19:01:30'),(719,860.23,'2019-01-20 18:57:32'),(720,54.14,'2019-01-20 19:01:43'),(721,5.86,'2019-01-20 20:09:33'),(722,1528.29,'2019-01-20 19:01:45'),(723,615.34,'2019-01-20 18:57:37'),(724,59.33,'2019-01-20 20:09:31'),(725,24.39,'2019-01-20 20:09:31'),(726,1778.12,'2019-01-20 20:09:31'),(727,650.19,'2019-01-20 20:09:31'),(728,65.25,'2019-01-20 20:09:30'),(729,27.66,'2019-01-20 19:01:09'),(730,1019.29,'2019-01-20 19:00:41'),(731,307.57,'2019-01-20 18:58:54'),(732,48.09,'2019-01-20 18:59:32'),(733,3.61,'2019-01-20 20:09:28'),(734,1399.89,'2019-01-20 20:09:27'),(735,907.58,'2019-01-20 20:09:26'),(736,6.86,'2019-01-20 20:09:25'),(737,26.15,'2019-01-20 20:09:24'),(738,1776.60,'2019-01-20 19:01:46'),(739,705.22,'2019-01-20 18:57:42'),(740,37.34,'2019-01-20 19:01:57'),(741,15.72,'2019-01-20 19:01:06'),(742,1242.96,'2019-01-20 20:09:23'),(743,111.86,'2019-01-20 20:09:23'),(744,69.79,'2019-01-20 19:00:11'),(745,1.04,'2019-01-20 19:00:25'),(746,1678.58,'2019-01-20 19:00:56'),(747,330.84,'2019-01-20 18:58:38'),(748,82.92,'2019-01-20 20:09:22'),(749,35.56,'2019-01-20 20:09:21'),(750,1812.61,'2019-01-20 19:01:48'),(751,28.24,'2019-01-20 18:57:43'),(752,99.35,'2019-01-20 18:59:37'),(753,12.62,'2019-01-20 20:09:20'),(754,1272.32,'2019-01-20 20:09:18'),(755,397.09,'2019-01-20 20:09:17'),(756,0.23,'2019-01-20 19:01:59'),(757,32.43,'2019-01-20 19:01:09'),(758,1197.10,'2019-01-20 20:09:17'),(759,790.09,'2019-01-20 20:09:16'),(760,44.29,'2019-01-20 20:09:16'),(761,9.20,'2019-01-20 19:00:52'),(762,1588.57,'2019-01-20 20:09:15'),(763,257.83,'2019-01-20 18:58:56'),(764,27.23,'2019-01-20 19:00:36'),(765,37.82,'2019-01-20 20:09:13'),(766,1662.28,'2019-01-20 20:09:12'),(767,238.09,'2019-01-20 18:59:38'),(768,70.28,'2019-01-20 20:09:10'),(769,8.32,'2019-01-20 20:09:09'),(770,1625.08,'2019-01-20 20:09:08'),(771,944.55,'2019-01-20 20:09:07'),(772,34.25,'2019-01-20 20:09:06'),(773,15.39,'2019-01-20 20:09:04'),(774,1871.89,'2019-01-20 20:09:03'),(775,730.84,'2019-01-20 20:09:02'),(776,27.41,'2019-01-20 20:08:20'),(777,9.05,'2019-01-20 20:08:20'),(778,1443.86,'2019-01-20 20:08:20'),(779,27.46,'2019-01-20 20:08:19'),(780,86.21,'2019-01-20 20:10:08'),(781,15.99,'2019-01-20 20:08:18'),(782,1523.93,'2019-01-20 20:08:18'),(783,95.67,'2019-01-20 20:08:17'),(784,80.06,'2019-01-20 20:08:17'),(785,14.43,'2019-01-20 20:08:15'),(786,1043.98,'2019-01-20 20:08:15'),(787,558.09,'2019-01-20 20:08:15'),(788,23.76,'2019-01-20 20:08:14'),(789,22.43,'2019-01-20 20:08:14'),(790,1665.19,'2019-01-20 20:08:14'),(791,739.37,'2019-01-20 20:08:14'),(792,77.37,'2019-01-20 20:08:13'),(793,15.26,'2019-01-20 20:08:13'),(794,1555.68,'2019-01-20 20:08:13'),(795,132.25,'2019-01-20 20:08:12'),(796,19.14,'2019-01-20 20:08:12'),(797,6.38,'2019-01-20 20:09:55'),(798,1063.51,'2019-01-20 20:08:12'),(799,820.38,'2019-01-20 20:10:00'),(800,75.19,'2019-01-20 20:10:01'),(801,1.72,'2019-01-20 20:10:01'),(802,26.47,'2019-01-20 20:10:01'),(803,13.89,'2019-01-20 20:09:54'),(804,36.35,'2019-01-20 20:10:01'),(805,32.93,'2019-01-20 20:10:01'),(806,23.74,'2019-01-20 20:10:02'),(807,28.50,'2019-01-20 20:10:02'),(808,32.48,'2019-01-20 20:10:12'),(809,20.55,'2019-01-20 20:09:49'),(810,9.89,'2019-01-20 20:10:09'),(811,39.43,'2019-01-20 20:10:09'),(812,1.35,'2019-01-20 20:10:09'),(813,10.42,'2019-01-20 20:10:10'),(814,7.34,'2019-01-20 20:10:13'),(815,7.17,'2019-01-20 20:10:15'),(816,14.10,'2019-01-20 19:01:47'),(817,37.67,'2019-01-20 19:01:46'),(818,33.72,'2019-01-20 20:09:47'),(819,33.09,'2019-01-20 19:00:00'),(820,38.03,'2019-01-20 19:00:39'),(821,1.03,'2019-01-20 20:09:45'),(822,36.64,'2019-01-20 19:00:37'),(823,16.21,'2019-01-20 19:00:46'),(824,25.09,'2019-01-20 20:09:41'),(825,22.57,'2019-01-20 20:09:39'),(826,35.52,'2019-01-20 20:09:37'),(827,34.07,'2019-01-20 20:09:36'),(828,34.55,'2019-01-20 20:09:35'),(829,25.28,'2019-01-20 20:09:35'),(830,20.68,'2019-01-20 20:09:34'),(831,3.94,'2019-01-20 19:01:46'),(832,7.42,'2019-01-20 19:00:56'),(833,31.03,'2019-01-20 19:01:34'),(834,34.87,'2019-01-20 19:00:55'),(835,17.73,'2019-01-20 20:09:33'),(836,1.16,'2019-01-20 20:07:40'),(837,16.79,'2019-01-20 20:08:43'),(838,26.87,'2019-01-20 20:08:43'),(839,8.54,'2019-01-20 20:08:44'),(840,7.53,'2019-01-20 20:08:44'),(841,16.30,'2019-01-20 20:08:44'),(842,38.63,'2019-01-20 20:08:44'),(843,25.32,'2019-01-20 20:08:44'),(844,26.91,'2019-01-20 20:10:03'),(845,6.82,'2019-01-20 20:08:45'),(846,39.61,'2019-01-20 20:08:53'),(847,34.95,'2019-01-20 20:07:44'),(848,6.05,'2019-01-20 20:08:46'),(849,34.47,'2019-01-20 20:08:46'),(850,37.23,'2019-01-20 20:08:46'),(851,9.23,'2019-01-20 20:08:46'),(852,9.78,'2019-01-20 20:08:50'),(853,33.88,'2019-01-20 20:08:48'),(854,13.92,'2019-01-20 20:10:09'),(855,28.75,'2019-01-20 20:08:47'),(856,29.83,'2019-01-20 20:08:47'),(857,0.16,'2019-01-20 20:08:46'),(858,7.23,'2019-01-20 20:08:48'),(859,24.03,'2019-01-20 19:00:18'),(860,5.61,'2019-01-20 19:01:17'),(861,19.73,'2019-01-20 20:08:47'),(862,20.43,'2019-01-20 20:10:02'),(863,39.96,'2019-01-20 20:08:47'),(864,26.15,'2019-01-20 20:08:39'),(865,26.90,'2019-01-20 20:08:43'),(866,35.75,'2019-01-20 20:08:43'),(867,37.28,'2019-01-20 20:08:42'),(868,17.36,'2019-01-20 20:08:42'),(869,8.05,'2019-01-20 20:08:42'),(870,1.07,'2019-01-20 20:08:40'),(871,11.30,'2019-01-20 20:08:40'),(872,22.35,'2019-01-20 20:10:02'),(873,12.92,'2019-01-20 20:08:40'),(874,17.02,'2019-01-20 20:08:40'),(875,33.16,'2019-01-20 20:08:41'),(876,5.14,'2019-01-20 20:08:41'),(877,22.09,'2019-01-20 20:10:02'),(878,23.40,'2019-01-20 20:08:41'),(879,20.28,'2019-01-20 20:08:41'),(880,33.30,'2019-01-20 20:08:41'),(881,38.49,'2019-01-20 20:08:42'),(882,31.64,'2019-01-20 20:08:53'),(883,21.30,'2019-01-20 20:08:42'),(884,39.79,'2019-01-20 20:08:42'),(885,31.45,'2019-01-20 20:08:53'),(886,39.34,'2019-01-20 20:08:42'),(887,19.12,'2019-01-20 20:08:42'),(888,18.13,'2019-01-20 20:08:39'),(889,32.64,'2019-01-20 20:08:39'),(890,37.31,'2019-01-20 20:08:38'),(891,19.07,'2019-01-20 20:08:38'),(892,4.89,'2019-01-20 20:08:30'),(893,4.11,'2019-01-20 20:08:30'),(894,8.71,'2019-01-20 20:08:35'),(895,25.21,'2019-01-20 20:08:35'),(896,9.76,'2019-01-20 20:08:36'),(897,32.48,'2019-01-20 20:08:35'),(898,9.97,'2019-01-20 20:08:36'),(899,20.11,'2019-01-20 20:10:01'),(900,33.16,'2019-01-20 20:08:38'),(901,22.30,'2019-01-20 20:08:37'),(902,10.53,'2019-01-20 20:08:37'),(903,14.23,'2019-01-20 20:08:37'),(904,5.51,'2019-01-20 20:08:37'),(905,30.19,'2019-01-20 19:02:21'),(906,34.51,'2019-01-20 20:08:36'),(907,34.26,'2019-01-20 20:08:35'),(908,6.94,'2019-01-20 20:08:34'),(909,15.41,'2019-01-20 20:08:29'),(910,35.30,'2019-01-20 20:08:35'),(911,23.17,'2019-01-20 20:08:35'),(912,21.75,'2019-01-20 20:08:35'),(913,13.27,'2019-01-20 20:08:35'),(914,27.07,'2019-01-20 20:08:34'),(915,9.37,'2019-01-20 20:08:34'),(916,4.62,'2019-01-20 20:08:34'),(917,8.52,'2019-01-20 20:08:34'),(918,0.16,'2019-01-20 20:08:34'),(919,4.74,'2019-01-20 20:08:34'),(920,38.58,'2019-01-20 19:01:31'),(921,2.77,'2019-01-20 20:08:54'),(922,2.98,'2019-01-20 20:08:29'),(923,16.78,'2019-01-20 20:08:33'),(924,37.52,'2019-01-20 20:08:33'),(925,39.20,'2019-01-20 20:08:33'),(926,20.30,'2019-01-20 20:08:33'),(927,1.87,'2019-01-20 20:08:33'),(928,30.30,'2019-01-20 20:08:33'),(929,25.46,'2019-01-20 20:08:33'),(930,11.32,'2019-01-20 20:08:32'),(931,38.06,'2019-01-20 20:08:32'),(932,18.07,'2019-01-20 20:08:54'),(933,39.03,'2019-01-20 20:09:59'),(934,37.06,'2019-01-20 20:08:30'),(935,23.23,'2019-01-20 20:08:29'),(936,5.41,'2019-01-20 20:08:28'),(937,34.76,'2019-01-20 20:09:59'),(938,31.65,'2019-01-20 20:08:27'),(939,25.67,'2019-01-20 20:08:28'),(940,0.29,'2019-01-20 20:08:28'),(941,21.68,'2019-01-20 20:08:27'),(942,17.50,'2019-01-20 19:01:05'),(943,20.15,'2019-01-20 20:08:27'),(944,29.99,'2019-01-20 20:08:25'),(945,21.39,'2019-01-20 20:08:25'),(946,27.95,'2019-01-20 20:09:59'),(947,29.49,'2019-01-20 20:08:24'),(948,24.05,'2019-01-20 20:08:23'),(949,5.20,'2019-01-20 20:08:23'),(950,3.32,'2019-01-20 20:08:22'),(951,0.00,'2019-01-18 21:43:55'),(952,0.00,'2019-01-18 21:43:56'),(953,0.00,'2019-01-18 21:43:56'),(954,0.00,'2019-01-18 21:43:57'),(955,0.00,'2019-01-18 21:43:57'),(956,0.00,'2019-01-18 21:43:57'),(957,0.00,'2019-01-18 21:43:58'),(958,0.00,'2019-01-18 21:43:58'),(959,0.00,'2019-01-18 21:43:58'),(960,0.00,'2019-01-20 20:08:22'),(961,0.00,'2019-01-18 21:43:59'),(962,0.00,'2019-01-18 21:43:59'),(963,0.00,'2019-01-18 21:44:00'),(964,0.00,'2019-01-18 21:44:00'),(965,0.00,'2019-01-18 21:44:01'),(966,0.00,'2019-01-18 21:44:01'),(967,0.00,'2019-01-18 21:44:01'),(968,0.00,'2019-01-18 21:44:02'),(969,0.00,'2019-01-18 21:44:02'),(970,0.00,'2019-01-20 20:08:22'),(971,0.00,'2019-01-18 21:44:03'),(972,0.00,'2019-01-18 21:44:04'),(973,0.00,'2019-01-18 21:44:04'),(974,0.00,'2019-01-18 21:44:05'),(975,0.00,'2019-01-18 21:44:05'),(976,0.00,'2019-01-18 21:44:05'),(977,0.00,'2019-01-18 21:44:05'),(978,0.00,'2019-01-18 21:44:06'),(979,0.00,'2019-01-18 21:44:06'),(980,1.00,'2019-01-20 20:08:21'),(981,0.00,'2019-01-18 21:44:07'),(982,0.00,'2019-01-18 21:44:07'),(983,0.00,'2019-01-18 21:44:07'),(984,0.00,'2019-01-18 21:44:07'),(985,0.00,'2019-01-18 21:44:08'),(986,0.00,'2019-01-18 21:44:08'),(987,0.00,'2019-01-18 21:44:08'),(988,0.00,'2019-01-18 21:44:08'),(989,0.00,'2019-01-18 21:44:09'),(990,0.00,'2019-01-20 20:08:21'),(991,0.00,'2019-01-18 21:44:09'),(992,0.00,'2019-01-18 21:44:10'),(993,0.00,'2019-01-18 21:44:10'),(994,0.00,'2019-01-18 21:44:11'),(995,0.00,'2019-01-18 21:44:11'),(996,0.00,'2019-01-18 21:44:11'),(997,0.00,'2019-01-18 21:44:12'),(998,0.00,'2019-01-18 21:44:12'),(999,0.00,'2019-01-18 21:44:12'),(1000,0.00,'2019-01-20 20:08:21');
/*!40000 ALTER TABLE `valore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valori_associati`
--

DROP TABLE IF EXISTS `valori_associati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `valori_associati` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Min_ValueTemperatura` double unsigned NOT NULL,
  `Max_ValueTemperatura` double unsigned NOT NULL,
  `Min_ValuePressione` double unsigned NOT NULL,
  `Max_ValuePressione` double unsigned NOT NULL,
  `Min_ValueUmidita` double unsigned NOT NULL,
  `Max_ValueUmidita` double unsigned NOT NULL,
  `Min_ValueLuminosita` double unsigned NOT NULL,
  `Max_ValueLuminosita` double unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valori_associati`
--

LOCK TABLES `valori_associati` WRITE;
/*!40000 ALTER TABLE `valori_associati` DISABLE KEYS */;
INSERT INTO `valori_associati` VALUES (1,15,23,1000,1500,30,70,300,800),(2,15,23,1000,1500,30,70,300,800),(3,15,23,1000,1500,30,70,300,800),(4,15,23,1000,1500,30,70,300,800),(5,15,23,1000,1500,30,70,300,800),(6,15,23,1000,1500,30,70,300,800),(7,15,23,1000,1500,30,70,300,800),(8,15,23,1000,1500,30,70,300,800),(9,15,23,1000,1500,30,70,300,800),(10,15,23,1000,1500,30,70,300,800),(11,15,23,1000,1500,30,70,300,800),(12,15,23,1000,1500,30,70,300,800),(13,15,23,1000,1500,30,70,300,800),(14,15,23,1000,1500,30,70,300,800),(15,15,23,1000,1500,30,70,300,800),(16,15,23,1000,1500,30,70,300,800),(17,15,23,1000,1500,30,70,300,800),(18,15,23,1000,1500,30,70,300,800),(19,15,23,1000,1500,30,70,300,800),(20,15,23,1000,1500,30,70,300,800),(21,15,23,1000,1500,30,70,300,800),(22,15,23,1000,1500,30,70,300,800),(23,15,23,1000,1500,30,70,300,800),(24,15,23,1000,1500,30,70,300,800),(25,15,23,1000,1500,30,70,300,800),(26,15,23,1000,1500,30,70,300,800),(27,15,23,1000,1500,30,70,300,800),(28,15,23,1000,1500,30,70,300,800),(29,15,23,1000,1500,30,70,300,800),(30,15,23,1000,1500,30,70,300,800),(31,15,23,1000,1500,30,70,300,800),(32,15,23,1000,1500,30,70,300,800),(33,15,23,1000,1500,30,70,300,800),(34,15,23,1000,1500,30,70,300,800),(35,15,23,1000,1500,30,70,300,800),(36,15,23,1000,1500,30,70,300,800),(37,15,23,1000,1500,30,70,300,800),(38,15,23,1000,1500,30,70,300,800),(39,15,23,1000,1500,30,70,300,800),(40,15,23,1000,1500,30,70,300,800),(41,15,23,1000,1500,30,70,300,800),(42,15,23,1000,1500,30,70,300,800),(43,15,23,1000,1500,30,70,300,800),(44,15,23,1000,1500,30,70,300,800),(45,15,23,1000,1500,30,70,300,800),(46,15,23,1000,1500,30,70,300,800),(47,15,23,1000,1500,30,70,300,800),(48,15,23,1000,1500,30,70,300,800),(49,15,23,1000,1500,30,70,300,800),(50,15,23,1000,1500,30,70,300,800),(51,15,23,1000,1500,30,70,300,800),(52,15,23,1000,1500,30,70,300,800),(53,15,23,1000,1500,30,70,300,800),(54,15,23,1000,1500,30,70,300,800),(55,15,23,1000,1500,30,70,300,800),(56,15,23,1000,1500,30,70,300,800),(57,15,23,1000,1500,30,70,300,800),(58,15,23,1000,1500,30,70,300,800),(59,15,23,1000,1500,30,70,300,800),(60,15,23,1000,1500,30,70,300,800),(61,15,23,1000,1500,30,70,300,800),(62,15,23,1000,1500,30,70,300,800),(63,15,23,1000,1500,30,70,300,800),(64,15,23,1000,1500,30,70,300,800),(65,15,23,1000,1500,30,70,300,800),(66,15,23,1000,1500,30,70,300,800),(67,15,23,1000,1500,30,70,300,800),(68,15,23,1000,1500,30,70,300,800),(69,15,23,1000,1500,30,70,300,800),(70,15,23,1000,1500,30,70,300,800),(71,15,23,1000,1500,30,70,300,800),(72,15,23,1000,1500,30,70,300,800),(73,15,23,1000,1500,30,70,300,800),(74,15,23,1000,1500,30,70,300,800),(75,15,23,1000,1500,30,70,300,800),(76,15,23,1000,1500,30,70,300,800),(77,15,23,1000,1500,30,70,300,800),(78,15,23,1000,1500,30,70,300,800),(79,15,23,1000,1500,30,70,300,800),(80,15,23,1000,1500,30,70,300,800),(81,15,23,1000,1500,30,70,300,800),(82,15,23,1000,1500,30,70,300,800),(83,15,23,1000,1500,30,70,300,800),(84,15,23,1000,1500,30,70,300,800),(85,15,23,1000,1500,30,70,300,800),(86,15,23,1000,1500,30,70,300,800),(87,15,23,1000,1500,30,70,300,800),(88,15,23,1000,1500,30,70,300,800),(89,15,23,1000,1500,30,70,300,800),(90,15,23,1000,1500,30,70,300,800),(91,15,23,1000,1500,30,70,300,800),(92,15,23,1000,1500,30,70,300,800),(93,15,23,1000,1500,30,70,300,800),(94,15,23,1000,1500,30,70,300,800),(95,15,23,1000,1500,30,70,300,800),(96,15,23,1000,1500,30,70,300,800),(97,15,23,1000,1500,30,70,300,800),(98,15,23,1000,1500,30,70,300,800),(99,15,23,1000,1500,30,70,300,800),(100,15,23,1000,1500,30,70,300,800),(101,15,23,1000,1500,30,70,300,800),(102,15,23,1000,1500,30,70,300,800),(103,15,23,1000,1500,30,70,300,800),(104,15,23,1000,1500,30,70,300,800),(105,15,23,1000,1500,30,70,300,800),(106,15,23,1000,1500,30,70,300,800),(107,15,23,1000,1500,30,70,300,800),(108,15,23,1000,1500,30,70,300,800),(109,15,23,1000,1500,30,70,300,800),(110,15,23,1000,1500,30,70,300,800),(111,15,23,1000,1500,30,70,300,800),(112,15,23,1000,1500,30,70,300,800),(113,15,23,1000,1500,30,70,300,800),(114,15,23,1000,1500,30,70,300,800),(115,15,23,1000,1500,30,70,300,800),(116,15,23,1000,1500,30,70,300,800),(117,15,23,1000,1500,30,70,300,800),(118,15,23,1000,1500,30,70,300,800),(119,15,23,1000,1500,30,70,300,800),(120,15,23,1000,1500,30,70,300,800),(121,15,23,1000,1500,30,70,300,800),(122,15,23,1000,1500,30,70,300,800),(123,15,23,1000,1500,30,70,300,800),(124,15,23,1000,1500,30,70,300,800),(125,15,23,1000,1500,30,70,300,800),(126,15,23,1000,1500,30,70,300,800),(127,15,23,1000,1500,30,70,300,800),(128,15,23,1000,1500,30,70,300,800),(129,15,23,1000,1500,30,70,300,800),(130,15,23,1000,1500,30,70,300,800),(131,15,23,1000,1500,30,70,300,800),(132,15,23,1000,1500,30,70,300,800),(133,15,23,1000,1500,30,70,300,800),(134,15,23,1000,1500,30,70,300,800),(135,15,23,1000,1500,30,70,300,800),(136,15,23,1000,1500,30,70,300,800),(137,15,23,1000,1500,30,70,300,800),(138,15,23,1000,1500,30,70,300,800),(139,15,23,1000,1500,30,70,300,800),(140,15,23,1000,1500,30,70,300,800),(141,15,23,1000,1500,30,70,300,800),(142,15,23,1000,1500,30,70,300,800),(143,15,23,1000,1500,30,70,300,800),(144,15,23,1000,1500,30,70,300,800),(145,15,23,1000,1500,30,70,300,800),(146,15,23,1000,1500,30,70,300,800),(147,15,23,1000,1500,30,70,300,800),(148,15,23,1000,1500,30,70,300,800),(149,15,23,1000,1500,30,70,300,800),(150,15,23,1000,1500,30,70,300,800),(151,15,23,1000,1500,30,70,300,800),(152,15,23,1000,1500,30,70,300,800),(153,15,23,1000,1500,30,70,300,800),(154,15,23,1000,1500,30,70,300,800),(155,15,23,1000,1500,30,70,300,800),(156,15,23,1000,1500,30,70,300,800),(157,15,23,1000,1500,30,70,300,800),(158,15,23,1000,1500,30,70,300,800),(159,15,23,1000,1500,30,70,300,800),(160,15,23,1000,1500,30,70,300,800),(161,15,23,1000,1500,30,70,300,800),(162,15,23,1000,1500,30,70,300,800),(163,15,23,1000,1500,30,70,300,800),(164,15,23,1000,1500,30,70,300,800),(165,15,23,1000,1500,30,70,300,800),(166,15,23,1000,1500,30,70,300,800),(167,15,23,1000,1500,30,70,300,800),(168,15,23,1000,1500,30,70,300,800),(169,15,23,1000,1500,30,70,300,800),(170,15,23,1000,1500,30,70,300,800),(171,15,23,1000,1500,30,70,300,800),(172,15,23,1000,1500,30,70,300,800),(173,15,23,1000,1500,30,70,300,800),(174,15,23,1000,1500,30,70,300,800),(175,15,23,1000,1500,30,70,300,800),(176,15,23,1000,1500,30,70,300,800),(177,15,23,1000,1500,30,70,300,800),(178,15,23,1000,1500,30,70,300,800),(179,15,23,1000,1500,30,70,300,800),(180,15,23,1000,1500,30,70,300,800),(181,15,23,1000,1500,30,70,300,800),(182,15,23,1000,1500,30,70,300,800),(183,15,23,1000,1500,30,70,300,800),(184,15,23,1000,1500,30,70,300,800),(185,15,23,1000,1500,30,70,300,800),(186,15,23,1000,1500,30,70,300,800),(187,15,23,1000,1500,30,70,300,800),(188,15,23,1000,1500,30,70,300,800),(189,15,23,1000,1500,30,70,300,800),(190,15,23,1000,1500,30,70,300,800),(191,15,23,1000,1500,30,70,300,800),(192,15,23,1000,1500,30,70,300,800),(193,15,23,1000,1500,30,70,300,800),(194,15,23,1000,1500,30,70,300,800),(195,15,23,1000,1500,30,70,300,800),(196,15,23,1000,1500,30,70,300,800),(197,15,23,1000,1500,30,70,300,800),(198,15,23,1000,1500,30,70,300,800),(199,15,23,1000,1500,30,70,300,800),(200,15,23,1000,1500,30,70,300,800);
/*!40000 ALTER TABLE `valori_associati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `zona` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(16) NOT NULL,
  `ID_gestore` int(10) unsigned NOT NULL,
  `ID_citta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `gestore_zona` (`ID_gestore`),
  KEY `citta_zona` (`ID_citta`),
  CONSTRAINT `citta_zona` FOREIGN KEY (`ID_citta`) REFERENCES `citta` (`id`),
  CONSTRAINT `gestore_zona` FOREIGN KEY (`ID_gestore`) REFERENCES `utente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'zona1',21,1),(2,'zona2',22,1),(3,'zona3',23,1),(4,'zona4',24,1);
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'monitoraggio'
--

--
-- Dumping routines for database 'monitoraggio'
--
/*!50003 DROP PROCEDURE IF EXISTS `avg_edificio_lum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_edificio_lum`(nome_edificio varchar(100))
begin
		select avg(valore_percepito) as avg_lum from
					valore join
					edificio join
					stanza	join
					sensore where sensore.tipo='luminosita' and
								  valore.ID_Sensore = sensore.ID and
								  sensore.ID_Stanza = stanza.ID and
								  stanza.ID_edificio = edificio.ID and
								  edificio.nome = nome_edificio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_edificio_pres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_edificio_pres`(nome_edificio varchar(100))
begin
		select avg(valore_percepito) as avg_pres from
					valore join
					edificio join
					stanza	join
					sensore where sensore.tipo='pressione' and
								  valore.ID_Sensore = sensore.ID and
								  sensore.ID_Stanza = stanza.ID and
								  stanza.ID_edificio = edificio.ID and
								  edificio.nome = nome_edificio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_edificio_temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_edificio_temp`(nome_edificio varchar(100))
begin
		select avg(valore_percepito) as avg_temp from
					valore join
					edificio join
					stanza	join
					sensore where sensore.tipo='temperatura' and
								  valore.ID_Sensore = sensore.ID and
								  sensore.ID_Stanza = stanza.ID and
								  stanza.ID_edificio = edificio.ID and
								  edificio.nome = nome_edificio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_edificio_um` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_edificio_um`(nome_edificio varchar(100))
begin
		select avg(valore_percepito) as avg_um from
					valore join
					edificio join
					stanza	join
					sensore where sensore.tipo='umidita' and
								  valore.ID_Sensore = sensore.ID and
								  sensore.ID_Stanza = stanza.ID and
								  stanza.ID_edificio = edificio.ID and
								  edificio.nome = nome_edificio;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_zona_lum` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_zona_lum`(nome_zona varchar(100))
begin
		select avg(valore_percepito) as avg_lum from
							valore join
							edificio join
							zona join
							stanza	join
							sensore where sensore.tipo='luminosita' and
										  valore.ID_Sensore = sensore.ID and
										  sensore.ID_Stanza = stanza.ID and
										  stanza.ID_edificio = edificio.ID and
										  edificio.ID_Zona = zona.ID and
										  zona.nome = nome_zona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_zona_pres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_zona_pres`(nome_zona varchar(100))
begin
		select avg(valore_percepito) as avg_pres from
							valore join
							edificio join
							zona join
							stanza	join
							sensore where sensore.tipo='pressione' and
										  valore.ID_Sensore = sensore.ID and
										  sensore.ID_Stanza = stanza.ID and
										  stanza.ID_edificio = edificio.ID and
										  edificio.ID_Zona = zona.ID and
										  zona.nome = nome_zona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_zona_temp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_zona_temp`(nome_zona varchar(100))
begin
		select avg(valore_percepito) as avg_temp from
							valore join
							edificio join
							zona join
							stanza	join
							sensore where sensore.tipo='temperatura' and
										  valore.ID_Sensore = sensore.ID and
										  sensore.ID_Stanza = stanza.ID and
										  stanza.ID_edificio = edificio.ID and
										  edificio.ID_Zona = zona.ID and
										  zona.nome = nome_zona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `avg_zona_um` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `avg_zona_um`(nome_zona varchar(100))
begin
		select avg(valore_percepito) as avg_um from
							valore join
							edificio join
							zona join
							stanza	join
							sensore where sensore.tipo='umidita' and
										  valore.ID_Sensore = sensore.ID and
										  sensore.ID_Stanza = stanza.ID and
										  stanza.ID_edificio = edificio.ID and
										  edificio.ID_Zona = zona.ID and
										  zona.nome = nome_zona;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `conta_edifici` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conta_edifici`(id_zona int)
begin 

	select e.ID from Edificio as e join Zona as z on (e.ID_zona=z.ID) where z.ID=id_zona;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `conta_stanze` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conta_stanze`(id_edificio int)
begin 

	select s.ID from Stanza as s join Edificio as e on (s.ID_edificio=e.ID) where e.ID=id_edificio;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `conta_zone` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conta_zone`(id_citta int)
begin 

	select z.ID from Zona as z join Citta as c on (z.ID_citta=c.ID) where c.ID=id_citta;
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdCitta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdCitta`(usern varchar(100))
begin 

	select c.ID from (Citta as c inner join (select u.ID from Utente as u where u.username = usern) as u1 on c.ID_gestore=u1.ID);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdEdificio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdEdificio`(usern varchar(100))
begin 

	select e.ID from (Edificio as e inner join (select u.ID from Utente as u where u.username = usern) as u1 on e.ID_gestore=u1.ID);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getIdZona` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getIdZona`(usern varchar(100))
begin 

	select z.ID from (Zona as z inner join (select u.ID from Utente as u where u.username = usern) as u1 on z.ID_gestore=u1.ID);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `verifica_utente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `verifica_utente`(usern varchar (100), pass varchar(100))
begin 
    
    if pass is null or usern is null then
		signal sqlstate '45000' set message_text = 'errore: inserire tutti i dati richiesti';
	end if;	#controlla che l'utente esista
    
    if not exists (select u.ID from Utente as u where u.username like usern and u.pass_word like pass) then
	signal sqlstate '45000' set message_text='inserire email e password valide';
    end if;
    

	select tipo from Utente where (username=usern and pass_word=pass);
    
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-20 21:12:28
