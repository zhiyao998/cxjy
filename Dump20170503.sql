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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_answer`
--

LOCK TABLES `tbl_answer` WRITE;
/*!40000 ALTER TABLE `tbl_answer` DISABLE KEYS */;
INSERT INTO `tbl_answer` VALUES (11,'A.单纯饮食控制','A.单纯饮食控制','4'),(12,'B.长期口服磺脲类降糖药','A.单纯饮食控制','5'),(13,'C.优降糖与二甲双胍联用','A.单纯饮食控制','2'),(14,'D.中效胰岛素每日注射一次','A.单纯饮食控制','3'),(15,'E.饮食控制与行胰岛','A.单纯饮食控制','5'),(16,'A.血栓性静脉炎 ','应考虑','3'),(17,'B.深静脉血栓形成','应考虑','4'),(18,'C.血栓闭塞性脉管炎(局部缺血期) ','应考虑','5'),(19,'D.血栓闭塞性脉管炎(营养障碍期)','应考虑','2'),(20,'E.动脉粥样硬化症','应考虑','1'),(21,'95.蚕豆病','95.蚕豆病','3'),(22,'95.蚕豆病','95.蚕豆病','5'),(23,'95.蚕豆病','95.蚕豆病','4'),(24,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','4'),(25,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','2'),(26,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','4'),(27,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','4'),(28,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','3'),(29,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','2'),(30,'98.急症手术： ','98.急症手术： ','2'),(31,'98.急症手术： ','98.急症手术： ','3'),(32,'98.急症手术： ','98.急症手术： ','4'),(33,'99.择期手术： ','99.择期手术： ','4'),(34,'99.择期手术： ','99.择期手术： ','4'),(35,'99.择期手术： ','99.择期手术： ','2'),(36,'100.限期手术：','100.限期手术：','3'),(37,'100.限期手术：','100.限期手术：','3'),(38,'100.限期手术：','100.限期手术：','2'),(39,'1','1','1'),(40,'1','1','1'),(41,'1','1','1'),(51,'1','1','1'),(52,'1','1','1'),(53,'1','1','1'),(54,'1','1','1'),(55,'1','1','1'),(56,'1','1','1'),(57,'1','1','1'),(58,'1','1','1'),(59,'1','1','1'),(60,'1','1','1');
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
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `id_case_UNIQUE` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case`
--

LOCK TABLES `tbl_case` WRITE;
/*!40000 ALTER TABLE `tbl_case` DISABLE KEYS */;
INSERT INTO `tbl_case` VALUES (3,'<p><span style=\"font-size:20px\">一例18岁男性患者,近一个月突然出现多尿,多饮,多食,体重下降5kg,空腹<br />\r\n<br />\r\n血糖13mmol/L(230mg/dl),血清胰岛细胞抗体阳性.</span></p>\r\n\r\n<p><span style=\"font-size:20px\">dqw</span></p>\r\n','2017-05-03','rongyu','胸外科','A2','高血压',0,0,0,0,1,0,0),(4,'<p>男性，35岁，稍长距离步行后感右小腿疼痛，肌肉抽搐跛行，稍休息后症状消失，平时感右足反凉，怕冷，有麻木感。右足背动脉搏动减弱</p>\r\n','2017-05-03','rongyu','皮肤科','A2','右小腿疼痛',0,1,0,0,0,0,0),(5,'<h2 style=\"font-style:italic\">A.血红蛋白电泳&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">B.高铁血红蛋白还原试验</h2>\r\n\r\n<h2 style=\"font-style:italic\">C.红细胞脆性试验 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">D.抗人球蛋白试验<br />\r\n<br />\r\nE.酸溶血试验</h2>\r\n','2017-05-03','rongyu','内科','A2','血红蛋白电泳 ',1,1,2,0,0,0,0),(6,'<h2 style=\"font-style:italic\">A.胃、十二指肠溃疡胃大部切除术&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">B.闭合性腹部创伤，腹腔穿刺有不凝血<br />\r\n<br />\r\nC.早期胃癌 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">D.急性胆囊炎<br />\r\n<br />\r\nE.单纯性急性胰腺炎</h2>\r\n','2017-05-03','rongyu','口腔科','A3','十二指肠溃疡胃大部切除术 ',1,0,0,0,3,0,1),(14,'<p><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\"><span style=\"font-family:宋体\">男性，</span>40岁。发热、咳嗽、咳黄色痰2个月，胸片示：右肺脓疡。白细胞 24&times;10</span></span><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">9</span></span><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">/L，血红蛋白 80g/L，血小板 290&times;10</span></span><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">9</span></span><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">/L，确认贫血是慢性感染引起。下列哪项不是该例贫血铁代谢特点？ </span></span></p>\r\n','2017-05-03','rongyu','普通科','A3','贫血铁代谢',0,0,0,0,0,0,1);
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
  `ftheme` varchar(45) DEFAULT NULL,
  `stheme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question`
--

LOCK TABLES `tbl_question` WRITE;
/*!40000 ALTER TABLE `tbl_question` DISABLE KEYS */;
INSERT INTO `tbl_question` VALUES (3,3,'%3Cp%3E%u6B64%u60A3%u8005%u5E94%u91C7%u7528%u7684%u6700%u4F73%u6CBB%u7597%u63AA%u65BD%u662F%3C/p%3E%0A%0A%3Cp%3Edqwdasd%3C/p%3E%0A','11,12,13,14,15','治疗方案','0'),(4,4,'应考虑','16,17,18,19,20','初步诊断','0'),(5,5,'95.蚕豆病','21,22,23','辅助检查','0'),(6,5,'96.免疫性溶血性贫血','24,25,26','初步诊断','0'),(7,5,'97.阵发性睡眠性血红蛋白尿','27,28,29','体格检查','0'),(8,6,'98.急症手术： ','30,31,32','治疗方案','0'),(9,6,'99.择期手术： ','33,34,35','治疗方案','0'),(10,6,'100.限期手术：','36,37,38','治疗方案','0'),(11,5,'2','39,40,41','辅助检查','0'),(16,6,'%3Cp%3E1%3C/p%3E%0A','51,52,53','体格检查','0'),(17,6,'%3Cp%3E1%3C/p%3E%0A','54,55,56,57','问诊','0'),(18,14,'%3Cp%3E1%3C/p%3E%0A','58,59,60','问诊','0');
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

-- Dump completed on 2017-05-03 18:11:48
