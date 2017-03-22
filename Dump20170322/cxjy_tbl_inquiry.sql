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
-- Table structure for table `tbl_inquiry`
--

DROP TABLE IF EXISTS `tbl_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inquiry` (
  `inquiry_id` int(11) NOT NULL,
  `case_id` int(11) NOT NULL COMMENT '对应病例表',
  `inquiry_title` varchar(45) DEFAULT NULL COMMENT '问诊问题',
  `patient_answer` varchar(45) DEFAULT NULL COMMENT '患者回答',
  `inquiry_type` int(11) DEFAULT NULL COMMENT '问诊类型',
  `inquiry_order` int(11) DEFAULT NULL COMMENT '问诊序号',
  `score` double DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`inquiry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问诊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inquiry`
--

LOCK TABLES `tbl_inquiry` WRITE;
/*!40000 ALTER TABLE `tbl_inquiry` DISABLE KEYS */;
INSERT INTO `tbl_inquiry` VALUES (1,0,'你抽烟吗？','不，我不抽烟。',3,1,1),(2,0,'你喝酒吗？','不，我从不喝酒。',3,2,1),(3,0,'你最近常常感到疲倦吗？','我精神很好。',1,3,1),(4,0,'你失眠吗？','我睡眠质量很好。',1,4,1),(5,0,'你有什么药物过敏吗？','不知道。',1,5,1);
/*!40000 ALTER TABLE `tbl_inquiry` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-22 18:14:19
