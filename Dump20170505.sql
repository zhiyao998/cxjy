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
-- Table structure for table `tbl_answer`
--

DROP TABLE IF EXISTS `tbl_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_info` varchar(45) DEFAULT NULL,
  `answer_analysis` varchar(45) DEFAULT NULL,
  `score` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_answer`
--

LOCK TABLES `tbl_answer` WRITE;
/*!40000 ALTER TABLE `tbl_answer` DISABLE KEYS */;
INSERT INTO `tbl_answer` VALUES (15,'E.饮食控制与行胰岛','A.单纯饮食控制','5'),(144,'1','4','-1'),(145,'2','5','-1'),(146,'3','6','0');
/*!40000 ALTER TABLE `tbl_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_case`
--

DROP TABLE IF EXISTS `tbl_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '病历表主键',
  `chief_complain` text NOT NULL COMMENT '主诉',
  `create_time` date NOT NULL COMMENT '创建时间',
  `creater` varchar(45) NOT NULL COMMENT '创建人',
  `case_type` varchar(45) NOT NULL COMMENT '病例类型',
  `title_type` varchar(45) NOT NULL,
  `case_title` varchar(45) NOT NULL,
  `phy_exam_count` int(11) NOT NULL DEFAULT '0',
  `fst_visit_count` int(11) NOT NULL DEFAULT '0',
  `ary_exam_count` int(11) NOT NULL DEFAULT '0',
  `diagnose_count` int(11) NOT NULL DEFAULT '0',
  `treatment_count` int(11) NOT NULL DEFAULT '0',
  `pat_man_count` int(11) NOT NULL DEFAULT '0',
  `inquiry_count` int(11) NOT NULL DEFAULT '0',
  `panswer_total` int(11) NOT NULL DEFAULT '0',
  `nanswer_total` int(11) NOT NULL DEFAULT '0',
  `zanswer_total` int(11) NOT NULL DEFAULT '0',
  `answer_total` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `id_case_UNIQUE` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case`
--

LOCK TABLES `tbl_case` WRITE;
/*!40000 ALTER TABLE `tbl_case` DISABLE KEYS */;
INSERT INTO `tbl_case` VALUES (22,'<h2 style=\"font-style:italic;\"><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">2.有关糖尿病代谢紊乱,下列哪一项描述最正确?</span></span></h2>\r\n','2017-05-05','rongyu','外科','A3','23',0,0,0,0,0,1,0,0,2,1,3);
/*!40000 ALTER TABLE `tbl_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_question`
--

DROP TABLE IF EXISTS `tbl_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `answers` varchar(45) DEFAULT NULL,
  `ftheme` varchar(45) NOT NULL,
  `pscore_count` int(11) NOT NULL DEFAULT '0' COMMENT '正确选项数目',
  `pscore_total` int(11) NOT NULL DEFAULT '0' COMMENT '正确选项总分',
  `nscore_count` int(11) NOT NULL DEFAULT '0' COMMENT '错误选项数目',
  `nscore_total` int(11) NOT NULL DEFAULT '0' COMMENT '错误选项总分',
  `zscore_count` int(11) NOT NULL DEFAULT '0' COMMENT '干扰选项数目',
  `answers_total` int(11) NOT NULL DEFAULT '0' COMMENT '选项总分',
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question`
--

LOCK TABLES `tbl_question` WRITE;
/*!40000 ALTER TABLE `tbl_question` DISABLE KEYS */;
INSERT INTO `tbl_question` VALUES (59,22,'%3Cp%3E%u4F01%u9E45%u738B%3C/p%3E%0A','144,145,146','病人管理',0,0,2,-2,1,3);
/*!40000 ALTER TABLE `tbl_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 18:43:06
