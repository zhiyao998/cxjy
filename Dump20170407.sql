CREATE DATABASE  IF NOT EXISTS `cxjy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cxjy`;
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
-- Table structure for table `case_inquiry`
--

DROP TABLE IF EXISTS `case_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_inquiry` (
  `case_type` int(11) NOT NULL COMMENT '病例类型',
  `inquiry_id` int(11) NOT NULL COMMENT '问诊id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_inquiry`
--

LOCK TABLES `case_inquiry` WRITE;
/*!40000 ALTER TABLE `case_inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_accessory_exam`
--

DROP TABLE IF EXISTS `tbl_accessory_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_accessory_exam` (
  `accessory_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `accessory_exam_name` varchar(45) DEFAULT NULL COMMENT '辅助体检项目',
  `accessory_exam_result` varchar(200) DEFAULT NULL COMMENT '辅助体检结果',
  `accessory_exam_type` varchar(45) DEFAULT NULL COMMENT '辅助体检类型',
  `accessory_exam_order` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL COMMENT '分值',
  `result_type` int(11) DEFAULT NULL COMMENT '结果类型（文本、图像）',
  PRIMARY KEY (`accessory_exam_id`),
  KEY `ind_ae` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='辅助体检表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_accessory_exam`
--

LOCK TABLES `tbl_accessory_exam` WRITE;
/*!40000 ALTER TABLE `tbl_accessory_exam` DISABLE KEYS */;
INSERT INTO `tbl_accessory_exam` VALUES (1,0,'大脑扫描','正常','1',1,0,1),(2,0,'小脑扫描','正常','1',2,0,1),(3,0,'腿部扫描','正常','2',1,0,1),(4,0,'心电图',NULL,'3',1,0,2);
/*!40000 ALTER TABLE `tbl_accessory_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_case`
--

DROP TABLE IF EXISTS `tbl_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_case` (
  `case_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '病历表主键',
  `case_title` varchar(45) DEFAULT NULL COMMENT '病历标题',
  `patient_Info` varchar(200) DEFAULT NULL COMMENT '患者信息',
  `chief_complain` varchar(45) DEFAULT NULL COMMENT '主诉',
  `create_time` date DEFAULT NULL COMMENT '创建时间',
  `creater` varchar(45) DEFAULT NULL COMMENT '创建人',
  `case_type` int(11) DEFAULT NULL COMMENT '病例类型',
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `id_case_UNIQUE` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case`
--

LOCK TABLES `tbl_case` WRITE;
/*!40000 ALTER TABLE `tbl_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnose`
--

DROP TABLE IF EXISTS `tbl_diagnose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_diagnose` (
  `diagnose_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `diagnose_resultA` varchar(200) DEFAULT NULL,
  `diagnose_resultB` varchar(200) DEFAULT NULL,
  `diagnose_resultC` varchar(200) DEFAULT NULL,
  `diagnose_resultD` varchar(200) DEFAULT NULL,
  `diagnose_resultE` varchar(200) DEFAULT NULL,
  `diagnose_answer` varchar(200) DEFAULT NULL,
  `score` double DEFAULT NULL,
  PRIMARY KEY (`diagnose_id`),
  KEY `ind_diagnose` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='确诊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnose`
--

LOCK TABLES `tbl_diagnose` WRITE;
/*!40000 ALTER TABLE `tbl_diagnose` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_diagnose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_first_visit`
--

DROP TABLE IF EXISTS `tbl_first_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_first_visit` (
  `first_visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `fv_resultA` varchar(200) DEFAULT NULL COMMENT '答案A',
  `fv_resultB` varchar(200) DEFAULT NULL COMMENT '答案B',
  `fv_resultC` varchar(200) DEFAULT NULL COMMENT '答案C',
  `fv_resultD` varchar(200) DEFAULT NULL COMMENT '答案D',
  `fv_resultE` varchar(200) DEFAULT NULL COMMENT '答案E',
  `score` double DEFAULT NULL COMMENT '分值',
  `analysis` varchar(200) DEFAULT NULL COMMENT '答案分析',
  PRIMARY KEY (`first_visit_id`),
  KEY `ind_fv` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='初诊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_first_visit`
--

LOCK TABLES `tbl_first_visit` WRITE;
/*!40000 ALTER TABLE `tbl_first_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_first_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_inquiry`
--

DROP TABLE IF EXISTS `tbl_inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_inquiry` (
  `inquiry_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL COMMENT '对应病例表',
  `inquiry_title` varchar(45) DEFAULT NULL COMMENT '问诊问题',
  `patient_answer` varchar(45) DEFAULT NULL COMMENT '患者回答',
  `inquiry_type` int(11) DEFAULT NULL COMMENT '问诊类型',
  `inquiry_order` int(11) DEFAULT NULL COMMENT '问诊序号',
  `score` double DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`inquiry_id`),
  KEY `ind_inquiry` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='问诊表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_inquiry`
--

LOCK TABLES `tbl_inquiry` WRITE;
/*!40000 ALTER TABLE `tbl_inquiry` DISABLE KEYS */;
INSERT INTO `tbl_inquiry` VALUES (1,0,'你抽烟吗？','不，我不抽烟。',3,1,0),(2,0,'你喝酒吗？','不，我从不喝酒。',3,2,0),(3,0,'你最近常常感到疲倦吗？','我精神很好。',1,1,0),(5,0,'你有什么药物过敏吗？','不知道。',1,3,0),(6,0,'请问您主要是哪里不舒服？','腿脚不便',1,4,0),(7,0,'请问您有高血压、糖尿病、冠心病等慢性疾病吗？','应该没有',2,1,0),(8,0,'您以前有外伤、手术史吗？','我没有外伤病史，也没有做过手术。',2,2,0),(9,0,'您有没有对什么食物或者药物过敏吗？','目前没有过敏史',2,3,0);
/*!40000 ALTER TABLE `tbl_inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_management`
--

DROP TABLE IF EXISTS `tbl_patient_management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_patient_management` (
  `patient_management_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `management_plan` varchar(45) DEFAULT NULL COMMENT '管理方法',
  `score` double DEFAULT NULL COMMENT '分值',
  `patient_management_type` varchar(45) DEFAULT NULL COMMENT '管理类型',
  PRIMARY KEY (`patient_management_id`),
  KEY `ind_pm` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='患者管理表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_management`
--

LOCK TABLES `tbl_patient_management` WRITE;
/*!40000 ALTER TABLE `tbl_patient_management` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_patient_management` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_physical_exam`
--

DROP TABLE IF EXISTS `tbl_physical_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_physical_exam` (
  `physical_exam_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) NOT NULL,
  `physical_exam_name` varchar(45) DEFAULT NULL COMMENT '体检项目',
  `physical_exam_part` varchar(45) DEFAULT NULL COMMENT '体检部位',
  `physical_exam_result` varchar(45) DEFAULT NULL COMMENT '体检结果',
  `physical_exam_type` varchar(45) DEFAULT NULL COMMENT '体检类型（区分文本、图片、音视频）',
  `physical_exam_order` varchar(45) DEFAULT NULL COMMENT '序号',
  `score` double DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`physical_exam_id`),
  KEY `ind_pe` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='体检表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_physical_exam`
--

LOCK TABLES `tbl_physical_exam` WRITE;
/*!40000 ALTER TABLE `tbl_physical_exam` DISABLE KEYS */;
INSERT INTO `tbl_physical_exam` VALUES (1,0,'脉率(次/分)','生命体征','71','1','1',0),(2,0,'血压(mmHg)','生命体征','131/68','1','2',0),(3,0,'体温(℃)','生命体征','36.9','1','3',0),(4,0,'呼吸频率(次/分)','生命体征','23','1','4',0),(5,0,'步态','一般情况','步态正常','2','5',0),(6,0,'面容','一般情况','面容正常','2','6',0),(7,0,'发育状况','一般情况','正常','2','7',0),(8,0,'体型','一般情况','正力型','2','8',0),(9,0,'浮肿状况','皮肤粘膜','无浮肿','3','9',0),(10,0,'肝掌标志','皮肤粘膜','无肝掌','3','10',0),(11,0,'溃疡','皮肤粘膜','无溃疡','3','11',0),(12,0,'皮肤检查','皮肤粘膜','正常','3','12',0),(13,0,'淋巴结检查','淋巴结','正常','4','13',0),(14,0,'浅表淋巴结检查','淋巴结','浅表淋巴结为触及肿大','4','14',0),(15,0,'头颅大小','头颈部','正常','5','15',0),(16,0,'头颅形态','头颈部','正常','5','16',0),(17,0,'桶状胸','胸','否','6','17',0),(18,0,'胸骨叩痛','胸','否','6','18',0),(19,0,'呼吸运动','肺','正常','7','19',0),(20,0,'语颤状况','肺','正常','7','20',0),(21,0,'胸膜摩擦感','肺','否','7','21',0),(22,0,'皮下捻发感','肺','否','7','22',0),(23,0,'肺部叩诊','肺','双肺叩诊呈清音','7','23',0),(24,0,'肺下界','肺','正常','7','24',0);
/*!40000 ALTER TABLE `tbl_physical_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_treatment`
--

DROP TABLE IF EXISTS `tbl_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_treatment` (
  `treatment_id` int(11) NOT NULL AUTO_INCREMENT,
  `case_id` int(11) DEFAULT NULL,
  `treatment_type` varchar(45) DEFAULT NULL COMMENT '治疗类型（提供默认值）',
  `treatment_plan` varchar(45) DEFAULT NULL COMMENT '具体治疗方法',
  `score` double DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`treatment_id`),
  KEY `ind_treat` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='治疗表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_treatment`
--

LOCK TABLES `tbl_treatment` WRITE;
/*!40000 ALTER TABLE `tbl_treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_treatment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-07 19:13:58
