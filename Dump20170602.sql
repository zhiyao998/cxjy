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
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (75,3,17),(76,3,18),(77,3,19),(88,1,9),(89,1,12),(90,1,13),(91,1,14),(92,1,15),(93,1,16),(94,1,17),(95,1,18),(96,1,19),(97,1,20),(102,2,17),(103,2,18),(104,2,19),(105,2,20);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_answer`
--

DROP TABLE IF EXISTS `tbl_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_info` varchar(45) NOT NULL,
  `answer_result` text NOT NULL,
  `answer_analysis` text NOT NULL,
  `score` varchar(45) NOT NULL,
  PRIMARY KEY (`answer_id`),
  UNIQUE KEY `answer_id_UNIQUE` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_answer`
--

LOCK TABLES `tbl_answer` WRITE;
/*!40000 ALTER TABLE `tbl_answer` DISABLE KEYS */;
INSERT INTO `tbl_answer` VALUES (324,'你以前有没有得过其他疾病','你以前有没有得过其','你以前有没有得过','1');
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
  `total_count` int(11) DEFAULT '0',
  PRIMARY KEY (`case_id`),
  UNIQUE KEY `id_case_UNIQUE` (`case_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COMMENT='病历表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_case`
--

LOCK TABLES `tbl_case` WRITE;
/*!40000 ALTER TABLE `tbl_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_menu`
--

DROP TABLE IF EXISTS `tbl_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_menu` (
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `menu_name` varchar(45) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NOT NULL COMMENT '父级菜单id',
  `perms` varchar(100) NOT NULL COMMENT '权限',
  `type` int(11) NOT NULL COMMENT '菜单类型，1为1级菜单，2为2级菜单',
  `group_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_menu`
--

LOCK TABLES `tbl_menu` WRITE;
/*!40000 ALTER TABLE `tbl_menu` DISABLE KEYS */;
INSERT INTO `tbl_menu` VALUES (1,'系统管理',0,'sys:mgmt',1,''),(2,'病例管理',0,'case:mgmt',1,''),(3,'组卷管理',0,'paperGen:mgmt',1,''),(4,'用户管理',1,'sys:user:mgmt',2,''),(5,'角色设置',1,'sys:role:mgmt',2,''),(6,'菜单设置',1,'sys:mgmt,sys:menu',2,''),(7,'病例列表',2,'case:list',2,''),(8,'普通组卷',3,'paperGen:gen',2,''),(9,'添加用户',4,'sys:mgmt,sys:user:mgmt,sys:user:add',3,'用户管理'),(10,'用户角色',4,'sys:mgmt,sys:user:mgmt,sys:user:role',3,'用户管理'),(11,'编辑用户',4,'sys:mgmt,sys:user:mgmt,sys:user:edit',3,'用户管理'),(12,'删除用户',4,'sys:mgmt,sys:user:mgmt,sys:user:delete',3,'用户管理'),(13,'添加角色',5,'sys:mgmt,sys:role:mgmt,sys:role:add',3,'角色设置'),(14,'角色权限',5,'sys:mgmt,sys:role:mgmt,sys:role:perms',3,'角色设置'),(15,'编辑角色',5,'sys:mgmt,sys:role:mgmt,sys:role:edit',3,'角色设置'),(16,'删除角色',5,'sys:mgmt,sys:role:mgmt,sys:role:delete',3,'角色设置'),(17,'添加病例',7,'case:mgmt,case:list,case:add',3,'病例管理'),(18,'编辑病例',7,'case:mgmt,case:list,case:edit',3,'病例管理'),(19,'删除病例',7,'case:mgmt,case:list,case:delete',3,'病例管理'),(20,'组卷许可',8,'paperGen:mgmt,paperGen:gen,paperGen:show',3,'普通组卷');
/*!40000 ALTER TABLE `tbl_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_paper`
--

DROP TABLE IF EXISTS `tbl_paper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_paper` (
  `paper_id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` date NOT NULL,
  `creater` varchar(45) NOT NULL,
  `case_list` varchar(45) NOT NULL,
  PRIMARY KEY (`paper_id`),
  UNIQUE KEY `paper_id_UNIQUE` (`paper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_paper`
--

LOCK TABLES `tbl_paper` WRITE;
/*!40000 ALTER TABLE `tbl_paper` DISABLE KEYS */;
INSERT INTO `tbl_paper` VALUES (1,'2017-05-11','rongyu','34,33'),(2,'2017-05-11','rongyu','26,23'),(3,'2017-05-11','rongyu','26,33,36'),(4,'2017-05-11','rongyu','33');
/*!40000 ALTER TABLE `tbl_paper` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_question`
--

LOCK TABLES `tbl_question` WRITE;
/*!40000 ALTER TABLE `tbl_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_role`
--

DROP TABLE IF EXISTS `tbl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(45) NOT NULL COMMENT '角色名字',
  `creator_id` int(11) NOT NULL COMMENT '创建者id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `role_count` int(11) NOT NULL DEFAULT '0' COMMENT '角色人数',
  `remark` varchar(45) NOT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_role`
--

LOCK TABLES `tbl_role` WRITE;
/*!40000 ALTER TABLE `tbl_role` DISABLE KEYS */;
INSERT INTO `tbl_role` VALUES (1,'系统管理员',1,'2017-05-27 11:58:01',3,'所有权限'),(2,'通用角色',1,'2017-06-01 09:36:32',2,'组卷、录题权限'),(3,'录题教师',1,'2017-06-02 09:18:11',2,'只拥有录题权限');
/*!40000 ALTER TABLE `tbl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'rongyu','123',1,0),(2,'admin','1',1,1),(3,'test2','1',1,2),(4,'admin1','1',1,1);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (2,1,18),(4,2,19);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-02 18:39:25
