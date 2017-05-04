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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_answer`
--

LOCK TABLES `tbl_answer` WRITE;
/*!40000 ALTER TABLE `tbl_answer` DISABLE KEYS */;
INSERT INTO `tbl_answer` VALUES (11,'A.单纯饮食控制','A.单纯饮食控制','4'),(12,'B.长期口服磺脲类降糖药','A.单纯饮食控制','5'),(13,'C.优降糖与二甲双胍联用','A.单纯饮食控制','2'),(15,'E.饮食控制与行胰岛','A.单纯饮食控制','5'),(16,'A.血栓性静脉炎 ','应考虑','3'),(17,'B.深静脉血栓形成','应考虑','4'),(18,'C.血栓闭塞性脉管炎(局部缺血期) ','应考虑','5'),(19,'D.血栓闭塞性脉管炎(营养障碍期)','应考虑','2'),(20,'E.动脉粥样硬化症','应考虑','1'),(21,'95.蚕豆病','95.蚕豆病','3'),(22,'95.蚕豆病','95.蚕豆病','5'),(23,'95.蚕豆病','95.蚕豆病','4'),(24,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','4'),(25,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','2'),(26,'96.免疫性溶血性贫血','96.免疫性溶血性贫血','4'),(27,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','4'),(28,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','3'),(29,'97.阵发性睡眠性血红蛋白尿','97.阵发性睡眠性血红蛋白尿','2'),(30,'98.急症手术： ','98.急症手术： ','2'),(31,'98.急症手术： ','98.急症手术： ','3'),(32,'98.急症手术： ','98.急症手术： ','4'),(33,'99.择期手术： ','99.择期手术： ','4'),(34,'99.择期手术： ','99.择期手术： ','4'),(35,'99.择期手术： ','99.择期手术： ','2'),(36,'100.限期手术：','100.限期手术：','3'),(37,'100.限期手术：','100.限期手术：','3'),(38,'100.限期手术：','100.限期手术：','2'),(39,'1','1','1'),(40,'1','1','1'),(41,'1','1','1'),(51,'1','1','1'),(52,'1','1','1'),(53,'1','1','1'),(54,'1','1','1'),(55,'1','1','1'),(56,'1','1','1'),(57,'1','1','1'),(58,'1','1','1'),(59,'1','1','1'),(60,'1','1','1'),(61,'E.错构痛','E.错构痛','2'),(62,'E.错构痛','E.错构痛','1'),(63,'E.错构痛','E.错构痛','2'),(64,'B.肺包虫病 ','B.肺包虫病 ','4'),(65,'B.肺包虫病 ','B.肺包虫病 ','1'),(66,'B.肺包虫病 ','B.肺包虫病 ','10'),(76,'A.全身使用抗菌素治疗，继续观察','A.全身使用抗菌素治疗，继续观察','2'),(77,'A.全身使用抗菌素治疗，继续观察','A.全身使用抗菌素治疗，继续观察','1'),(78,'A.全身使用抗菌素治疗，继续观察','A.全身使用抗菌素治疗，继续观察','2'),(79,'A.压力性尿失禁','A.压力性尿失禁','2'),(80,'A.压力性尿失禁','A.压力性尿失禁','1'),(81,'A.压力性尿失禁','A.压力性尿失禁','2'),(82,'C.肾胚胎瘤','C.肾胚胎瘤','2'),(83,'C.肾胚胎瘤','C.肾胚胎瘤','1'),(84,'C.肾胚胎瘤','C.肾胚胎瘤','2'),(85,'B.肾皮质脓肿 ','B.肾皮质脓肿 ','3'),(86,'B.肾皮质脓肿 ','B.肾皮质脓肿 ','2'),(87,'B.肾皮质脓肿 ','B.肾皮质脓肿 ','3'),(88,'E.肾裂伤并有输尿管损伤','E.肾裂伤并有输尿管损伤','1'),(89,'E.肾裂伤并有输尿管损伤','E.肾裂伤并有输尿管损伤','2'),(90,'E.肾裂伤并有输尿管损伤','E.肾裂伤并有输尿管损伤','1'),(91,'C.试放导尿管并注入液体','C.试放导尿管并注入液体','2'),(92,'C.试放导尿管并注入液体','C.试放导尿管并注入液体','1'),(93,'C.试放导尿管并注入液体','C.试放导尿管并注入液体','2'),(94,'C.急性肾盂肾炎','C.急性肾盂肾炎','2'),(95,'C.急性肾盂肾炎','C.急性肾盂肾炎','1'),(96,'C.急性肾盂肾炎','C.急性肾盂肾炎','3'),(97,'E.肾上腺瘤','E.肾上腺瘤','3'),(98,'E.肾上腺瘤','E.肾上腺瘤','2'),(99,'E.肾上腺瘤','E.肾上腺瘤','1'),(100,'E.肾上腺瘤','E.肾上腺瘤','2'),(101,'105.第一期乳癌是：','105.第一期乳癌是：','1'),(102,'105.第一期乳癌是：','105.第一期乳癌是：','2'),(103,'105.第一期乳癌是：','105.第一期乳癌是：','3'),(104,'现膝关节功能发生障碍，其原因是','现膝关节功能发生障碍，其原因是','1'),(105,'现膝关节功能发生障碍，其原因是','现膝关节功能发生障碍，其原因是','2'),(106,'现膝关节功能发生障碍，其原因是','现膝关节功能发生障碍，其原因是','3'),(107,'sda','das','1'),(108,'11','11','1');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case`
--

LOCK TABLES `tbl_case` WRITE;
/*!40000 ALTER TABLE `tbl_case` DISABLE KEYS */;
INSERT INTO `tbl_case` VALUES (3,'<p><span style=\"font-size:20px\">一例18岁男性患者,近一个月突然出现多尿,多饮,多食,体重下降5kg,空腹血糖13mmol/L(230mg/dl),血清胰岛细胞抗体阳性.</span></p>\r\n\r\n<p>&nbsp;</p>\r\n','2017-05-04','rongyu','胸外科','A3','高血压',0,0,0,0,1,1,0),(4,'<p>男性，35岁，稍长距离步行后感右小腿疼痛，肌肉抽搐跛行，稍休息后症状消失，平时感右足反凉，怕冷，有麻木感。右足背动脉搏动减弱</p>\r\n','2017-05-03','rongyu','皮肤科','A2','右小腿疼痛',0,1,0,0,0,0,0),(5,'<h3 style=\"color: rgb(170, 170, 170); font-style: italic;\">A.血红蛋白电泳</h3>\r\n\r\n<h3 style=\"color: rgb(170, 170, 170); font-style: italic;\">B.高铁血红蛋白还原试验</h3>\r\n\r\n<h3 style=\"color: rgb(170, 170, 170); font-style: italic;\">C.红细胞脆性试验</h3>\r\n\r\n<h3 style=\"color: rgb(170, 170, 170); font-style: italic;\">D.抗人球蛋白试验</h3>\r\n\r\n<h3 style=\"color: rgb(170, 170, 170); font-style: italic;\">E.酸溶血试验</h3>\r\n','2017-05-04','rongyu','内科','A2','血红蛋白电泳 ',1,1,2,0,0,0,0),(6,'<h2 style=\"font-style:italic\">A.胃、十二指肠溃疡胃大部切除术&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">B.闭合性腹部创伤，腹腔穿刺有不凝血<br />\r\n<br />\r\nC.早期胃癌 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</h2>\r\n\r\n<h2 style=\"font-style:italic\">D.急性胆囊炎<br />\r\n<br />\r\nE.单纯性急性胰腺炎</h2>\r\n','2017-05-04','rongyu','口腔科','A3','十二指肠溃疡胃大部切除术 ',1,0,0,0,3,0,1),(14,'<p><small><span style=\"font-size:12pt\"><span style=\"font-family:宋体\"><span style=\"font-family:宋体\">男性，</span>40岁。发热、咳嗽、咳黄色痰2个月，胸片示：右肺脓疡。白细胞 24&times;10</span></span><span style=\"font-size:12pt\"><span style=\"font-family:宋体\">9</span></span><span style=\"font-size:12pt\"><span style=\"font-family:宋体\">/L，血红蛋白 80g/L，血小板 290&times;10</span></span><span style=\"font-size:12pt\"><span style=\"font-family:宋体\">9</span></span><span style=\"font-size:12pt\"><span style=\"font-family:宋体\">/L，确认贫血是慢性感染引起。下列哪项不是该例贫血铁代谢特点？ </span></span></small></p>\r\n','2017-05-04','rongyu','普通科','A3','贫血铁代谢',0,0,0,0,0,0,1),(15,'<p><span style=\"font-size:12pt\"><span style=\"font-family:宋体\"><span style=\"font-family:宋体\">有一老年男性病人，主诉反复刺激性咳嗽</span>3个月，查体发现杆状指，男性乳房肥大，胸片示右上肺段长有毛刺</span></span></p>\r\n','2017-05-04','rongyu','内科','A3','反复刺激性咳嗽',0,0,0,1,1,0,1),(16,'<p><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\"><span style=\"font-family:宋体\">对</span>45岁以上男性，吸烟已超过400年支，以何措施早期发现肺癌</span></span></p>\r\n','2017-05-04','rongyu','外科','A3','肺癌',2,1,0,1,0,0,1),(17,'<p><span style=\"font-size:12pt\"><span style=\"font-family:宋体\"><span style=\"font-family:宋体\">男性患者，近一周反复发烧，左腰轻度疼痛，叩痛明显，近</span>2天出现右髋关节不能伸展，胸透左膈肌抬高，活动受限，KUB腰大肌影消失尿常规（-）。</span></span></p>\r\n','2017-05-04','rongyu','内科','A3','肾积脓 ',0,0,3,0,1,0,0),(18,'<p><span style=\"font-size:12.0000pt\"><span style=\"font-family:宋体\">88.一老年病人出现高血压肌肉萎缩和明显软弱无力，并出现向心性肥胖，应考虑下述哪种疾病</span></span></p>\r\n','2017-05-04','rongyu','内科','A3','重症肌无力',0,0,0,1,1,0,0);
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
  `stheme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question`
--

LOCK TABLES `tbl_question` WRITE;
/*!40000 ALTER TABLE `tbl_question` DISABLE KEYS */;
INSERT INTO `tbl_question` VALUES (3,3,'%3Cp%3E%u6B64%u60A3%u8005%u5E94%u91C7%u7528%u7684%u6700%u4F73%u6CBB%u7597%u63AA%u65BD%u662F%3C/p%3E%0A%0A%3Cp%3Edqwdasd%3C/p%3E%0A','11,12,13,107,108','治疗方案','0'),(4,4,'应考虑','16,17,18,19,20','初步诊断','0'),(5,5,'95.蚕豆病','21,22,23','辅助检查','0'),(6,5,'96.免疫性溶血性贫血','24,25,26','初步诊断','0'),(7,5,'97.阵发性睡眠性血红蛋白尿','27,28,29','体格检查','0'),(8,6,'98.急症手术： ','30,31,32','治疗方案','0'),(9,6,'99.择期手术： ','33,34,35','治疗方案','0'),(10,6,'100.限期手术：','36,37,38','治疗方案','0'),(11,5,'2','39,40,41','辅助检查','0'),(16,6,'%3Cp%3E1%3C/p%3E%0A','51,52,53','体格检查','0'),(17,6,'%3Cp%3E1%3C/p%3E%0A','54,55,56,57','问诊','0'),(18,14,'%3Cp%3E1%3C/p%3E%0A','58,59,60','问诊','0'),(19,15,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u6709%u4E00%u8001%u5E74%u7537%u6027%u75C5%u4EBA%uFF0C%u4E3B%u8BC9%u53CD%u590D%u523A%u6FC0%u6027%u54B3%u55FD%3C/span%3E3%u4E2A%u6708%uFF0C%u67E5%u4F53%u53D1%u73B0%u6746%u72B6%u6307%uFF0C%u7537%u6027%u4E73%u623F%u80A5%u5927%uFF0C%u80F8%u7247%u793A%u53F3%u4E0A%u80BA%u6BB5%u957F%u6709%u6BDB%u523A%uFF0C%u9996%u5148%u8003%u8651%u8BCA%u65AD%u4E3A%3C/span%3E%3C/span%3E%3C/p%3E%0A','61,62,63','问诊',NULL),(20,15,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u6709%u4E00%u8001%u5E74%u7537%u6027%u75C5%u4EBA%uFF0C%u4E3B%u8BC9%u53CD%u590D%u523A%u6FC0%u6027%u54B3%u55FD%3C/span%3E3%u4E2A%u6708%uFF0C%u67E5%u4F53%u53D1%u73B0%u6746%u72B6%u6307%uFF0C%u7537%u6027%u4E73%u623F%u80A5%u5927%uFF0C%u80F8%u7247%u793A%u53F3%u4E0A%u80BA%u6BB5%u957F%u6709%u6BDB%u523A%uFF0C%3C/span%3E%3C/span%3E%3C/p%3E%0A','64,65,66','治疗方案',NULL),(40,16,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E.%u6025%u8BCA%u4F4F%u9662%u7684%u6025%u6027%u8113%u80F8%u7537%u6027%u60A3%u8005%uFF0C%u75C5%u671F%u4E24%u5468%uFF0C%u7591%u4E3A%u80BA%u8113%u80BF%u7A7F%u7834%uFF0C%u62BD%u51FA%u8113%u6DB2%u7A00%u8584%u8150%u81ED%uFF0C%u80F8%u900F%u6DB2%u5E73%u5728%u53F3%u7B2C%u4E09%u524D%u808B%u3002%u76EE%u524D%u5E94%u4F5C%u4EE5%u4E0B%u4F55%u79CD%u5904%u7406%u4E3A%u9002%u5B9C%3C/span%3E%3C/span%3E%3C/p%3E%0A','76,77,78','体格检查',NULL),(41,16,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u4E00%u7403%u90E8%u5C3F%u9053%u635F%u4F24%u60A3%u8005%uFF0C%u6392%u5C3F%u56F0%u96BE%u9010%u6E10%u52A0%u91CD%uFF0C%u6700%u540E%u51FA%u73B0%u5C3F%u5931%u7981%uFF0C%u8FD9%u79CD%u5C3F%u5931%u7981%u5C5E%u4E8E%3C/span%3E%3C/span%3E%3C/span%3E%3C/p%3E%0A','79,80,81','确诊',NULL),(42,16,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u7537%uFF0C%3C/span%3E55%u5C81%uFF0C%u53CD%u590D%u53D1%u4F5C%u65E0%u75DB%u6027%u8089%u773C%u8840%u5C3F%u4E00%u5E74%uFF0CIVU%u793A%u53F3%u80BE%u76C2%u6709%u4E00%u5145%u76C8%u7F3A%u635F%3C/span%3E%3C/span%3E%3C/p%3E%0A','82,83,84','初步诊断',NULL),(43,17,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3EB.%u80BE%u76AE%u8D28%u8113%u80BF%20%3C/span%3E%3C/span%3E%3C/p%3E%0A','85,86,87','辅助检查',NULL),(44,17,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u4E00%3C/span%3E30%u5C81%u7537%u6027%u5DE5%u4EBA%uFF0C%u4E8E3%u5C0F%u65F6%u524D%u4ECE5%u7C73%u9AD8%u5904%u8DCC%u4E0B%uFF0C%u5DE6%u8170%u90E8%u649E%u4E8E%u77F3%u5757%u4E0A%uFF0C%u4E8B%u540E%u660F%u8FF7%uFF0C%u8840%u538B%u6B63%u5E38%uFF0C%u89C9%u5DE6%u8170%u90E8%u75BC%u75DB%uFF0C%u8F7B%u538B%3C/span%3E%3C/span%3E%3C/p%3E%0A','88,89,90','辅助检查',NULL),(45,17,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E20%u5C81%u7537%u6027%u60A3%u8005%uFF0C%u6392%u5C3F%u56DB%u5C0F%u65F6%u540E%uFF0C%u4E0B%u8179%u90E8%u632B%u4F24%uFF0C%u5C0F%u8179%u75DB%u3001%u8179%u808C%u7565%u5448%u7D27%u5F20%uFF0C%u5C0F%u4FBF%u4E0D%u80FD%u6392%u51FA%uFF0C%3C/span%3E%3C/span%3E%3C/p%3E%0A','91,92,93','治疗方案',NULL),(46,17,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E%u5973%u6027%uFF0C%3C/span%3E26%u5C81%uFF0C%u4EA7%u540E%u7B2C%u56DB%u5929%u5BD2%u6218%u3001%u9AD8%u70ED%u3001%u8170%u75DB%u3001%u5C3F%u75DB%u3001%u4E0B%u8179%u75DB%u3002%u4F53%u68C0%uFF1A%u80BE%u533A%u53E9%u75DB%28+%29%u803B%u9AA8%u8054%u5408%u4E0A%u538B%u75DB%28+%29%u3002%u767D%u7EC6%u80DE18000/%u7ACB%u65B9%u6BEB%u7C73%uFF0C%u5C3F%u5E38%u89C4%uFF1A%u86CB%u767D%28+%29%uFF0C%u767D%u7EC6%u80DE20-30%u4E2A/%u9AD8%u500D%u89C6%u91CE%uFF0CRBC.3-5%u4E2A/%u9AD8%u500D%u89C6%u91CE%u3002%u5E94%u8003%u8651%u4EA7%u540E%u5E76%u53D1%3C/span%3E%3C/span%3E%3C/p%3E%0A','94,95,96','辅助检查',NULL),(47,18,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3EA.%u539F%u53D1%u6027%u919B%u56FA%u916E%u589E%u591A%u75C7%20B.%u76AE%u8D28%u9187%u589E%u591A%u75C7%3C/span%3E%3C/span%3E%3Cbr%20/%3E%0A%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3EC.%u7CD6%u5C3F%u75C5%20D.%u91CD%u75C7%u808C%u65E0%u529B%3C/span%3E%3C/span%3E%3Cbr%20/%3E%0A%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3EE.%u80BE%u4E0A%u817A%u7624%3C/span%3E%3C/span%3E%3C/p%3E%0A','97,98,99,100','确诊',NULL),(48,18,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3EA.T1%uFF5ET2%uFF0CN0%uFF0CM0%20B.T1%uFF0CN1%uFF0CM0%20C.T2%uFF0CN1%uFF0CM2%3C/span%3E%3C/span%3E%3Cbr%20/%3E%0A%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3ED.T1%uFF0CN0%uFF0CM1%20E.T3%uFF0CN0%uFF0CM0%3C/span%3E%3C/span%3E%3C/p%3E%0A','101,102,103','治疗方案',NULL),(49,3,'%3Cp%3E%3Cspan%20style%3D%22font-size%3A12.0000pt%22%3E%3Cspan%20style%3D%22font-family%3A%u5B8B%u4F53%22%3E90.%u80EB%u8153%u9AA8%u4E2D1/3%u9AA8%u6298%u60A3%u8005%uFF0C%u590D%u4F4D%u540E%uFF0C%u7528%u957F%u817F%u77F3%u818F%u56FA%u5B9A%uFF0C4%u4E2A%u6708%u9AA8%u6298%u6108%u5408%u62C6%u9664%u77F3%u818F%u540E%uFF0C%u53D1%u73B0%u819D%u5173%u8282%u529F%u80FD%u53D1%u751F%u969C%u788D%uFF0C%u5176%u539F%u56E0%u662F%20%3C/span%3E%3C/span%3E%3C/p%3E%0A','104,105,106','病人管理',NULL);
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

-- Dump completed on 2017-05-04 18:55:56
