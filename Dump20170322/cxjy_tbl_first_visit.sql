-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: cxjy
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `tbl_first_visit`
--

DROP TABLE IF EXISTS `tbl_first_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_first_visit` (
  `first_visit_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL,
  `fv_resultA` varchar(45) DEFAULT NULL COMMENT '答案A',
  `fv_resultB` varchar(45) DEFAULT NULL COMMENT '答案B',
  `fv_resultC` varchar(45) DEFAULT NULL COMMENT '答案C',
  `fv_resultD` varchar(45) DEFAULT NULL COMMENT '答案D',
  `fv_resultE` varchar(45) DEFAULT NULL COMMENT '答案E',
  `score` double DEFAULT NULL COMMENT '分值',
  `analysis` varchar(45) DEFAULT NULL COMMENT '答案分析',
  PRIMARY KEY (`first_visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='初诊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_first_visit`
--

LOCK TABLES `tbl_first_visit` WRITE;
/*!40000 ALTER TABLE `tbl_first_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_first_visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22 18:14:18
