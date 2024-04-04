-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: hoc_ba_dien_tu
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `giaovien`
--

DROP TABLE IF EXISTS `giaovien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giaovien` (
  `giaovien_id` int NOT NULL AUTO_INCREMENT,
  `user_tendangnhap` varchar(20) NOT NULL,
  PRIMARY KEY (`giaovien_id`),
  KEY `fk_GiaoVien_User1_idx` (`user_tendangnhap`),
  CONSTRAINT `fk_GiaoVien_User1` FOREIGN KEY (`user_tendangnhap`) REFERENCES `user` (`user_tendangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giaovien`
--

LOCK TABLES `giaovien` WRITE;
/*!40000 ALTER TABLE `giaovien` DISABLE KEYS */;
INSERT INTO `giaovien` VALUES (1,'giaovien1'),(2,'giaovien2'),(3,'giaovien3'),(4,'hoanganhtu'),(5,'hoangvankha'),(6,'ngotruongcong'),(7,'nguyenthixuan'),(8,'vuhuyhoa');
/*!40000 ALTER TABLE `giaovien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocsinh`
--

DROP TABLE IF EXISTS `hocsinh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocsinh` (
  `hocsinh_id` int NOT NULL AUTO_INCREMENT,
  `lop_id` varchar(10) NOT NULL,
  `phuhuynh_id` int NOT NULL,
  `user_tendangnhap` varchar(20) NOT NULL,
  PRIMARY KEY (`hocsinh_id`),
  KEY `fk_HocSinh_Lop1_idx` (`lop_id`),
  KEY `fk_HocSinh_PhuHuynh1_idx` (`phuhuynh_id`),
  KEY `fk_HocSinh_User1_idx` (`user_tendangnhap`),
  CONSTRAINT `fk_HocSinh_Lop1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`lop_id`),
  CONSTRAINT `fk_HocSinh_PhuHuynh1` FOREIGN KEY (`phuhuynh_id`) REFERENCES `phuhuynh` (`phuhuynh_id`),
  CONSTRAINT `fk_HocSinh_User1` FOREIGN KEY (`user_tendangnhap`) REFERENCES `user` (`user_tendangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocsinh`
--

LOCK TABLES `hocsinh` WRITE;
/*!40000 ALTER TABLE `hocsinh` DISABLE KEYS */;
INSERT INTO `hocsinh` VALUES (1,'2020L5',1,'hocsinh1'),(2,'2023L2',2,'hoangvietlong'),(3,'2020L5',1,'nguyenvantuan'),(4,'2020L5',3,'buyduyvan'),(5,'2020L5',2,'hoangvanvuong'),(6,'2020L5',2,'hoangvantuyen'),(7,'2020L5',3,'phamquocanh'),(8,'2020L5',3,'phamvantu'),(9,'2020L5',3,'buyhuybao'),(10,'2020L5',1,'nguyendangloi'),(11,'2021L1',1,'nguyenhongquan');
/*!40000 ALTER TABLE `hocsinh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ketquahoctap`
--

DROP TABLE IF EXISTS `ketquahoctap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ketquahoctap` (
  `hocki` int NOT NULL,
  `lop_id` varchar(10) NOT NULL,
  `hocsinh_id` int NOT NULL,
  `monhoc_id` varchar(45) NOT NULL,
  `diemgiuaki` double DEFAULT NULL,
  `diemcuoiki` double DEFAULT NULL,
  `nhanxetcuagv` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `xeploai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hocki`,`lop_id`,`hocsinh_id`,`monhoc_id`),
  KEY `fk_HocSinh_has_MonHoc_MonHoc1_idx` (`monhoc_id`),
  KEY `fk_HocSinh_has_MonHoc_HocSinh1_idx` (`hocsinh_id`),
  KEY `fk_KetQuaHocTap_Lop1_idx` (`lop_id`),
  CONSTRAINT `fk_HocSinh_has_MonHoc_HocSinh1` FOREIGN KEY (`hocsinh_id`) REFERENCES `hocsinh` (`hocsinh_id`),
  CONSTRAINT `fk_HocSinh_has_MonHoc_MonHoc1` FOREIGN KEY (`monhoc_id`) REFERENCES `monhoc` (`monhoc_id`),
  CONSTRAINT `fk_KetQuaHocTap_Lop1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`lop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ketquahoctap`
--

LOCK TABLES `ketquahoctap` WRITE;
/*!40000 ALTER TABLE `ketquahoctap` DISABLE KEYS */;
INSERT INTO `ketquahoctap` VALUES (1,'2020L1',1,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',1,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',1,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',1,'VAN11',9,10,'Xuất sắc','giỏi'),(1,'2020L1',2,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',2,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',2,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',2,'VAN11',9,10,'Xuất sắc','giỏi'),(1,'2020L1',3,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',3,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',3,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',3,'VAN11',9,10,'Xuất sắc','giỏi'),(1,'2020L1',4,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',4,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',4,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',4,'VAN11',9,10,'Xuất sắc','giỏi'),(1,'2020L1',5,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',5,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',5,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',5,'VAN11',9,10,'Xuất sắc','giỏi'),(1,'2020L1',6,'DD11',5,6,'Học chưa tốt','Trung bình'),(1,'2020L1',6,'TNXH11',10,10,'Xuất sắc','giỏi'),(1,'2020L1',6,'TOAN11',8,7,'Có tiến bộ','Khá'),(1,'2020L1',6,'VAN11',9,10,'Xuất sắc','giỏi'),(2,'2020L1',1,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',1,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',1,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',1,'VAN12',7,4,'Học còn yếu','Yếu'),(2,'2020L1',2,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',2,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',2,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',2,'VAN12',7,4,'Học còn yếu','Yếu'),(2,'2020L1',3,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',3,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',3,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',3,'VAN12',7,4,'Học còn yếu','Yếu'),(2,'2020L1',4,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',4,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',4,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',4,'VAN12',7,4,'Học còn yếu','Yếu'),(2,'2020L1',5,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',5,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',5,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',5,'VAN12',7,4,'Học còn yếu','Yếu'),(2,'2020L1',6,'DD12',8,8,'Học khá giỏi','Khá'),(2,'2020L1',6,'TNXH12',9,9,'Học tốt chăm chỉ','Tốt'),(2,'2020L1',6,'TOAN12',7,8,'Tốt có tiến bộ','Khá'),(2,'2020L1',6,'VAN12',7,4,'Học còn yếu','Yếu'),(3,'2020L2',1,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',1,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',1,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',1,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',2,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',2,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',2,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',2,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',3,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',3,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',3,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',3,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',4,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',4,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',4,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',4,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',5,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',5,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',5,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',5,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',6,'DD21',9,9,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',6,'TNXH21',3,3,'Học tốt chăm chỉ','Giỏi'),(3,'2020L2',6,'TOAN21',10,10,'Học tốt','giỏi'),(3,'2020L2',6,'VAN21',9,7,'Học tốt chăm chỉ','Giỏi'),(4,'2020L2',1,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',1,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',1,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',1,'VAN22',8,8,'Học tốt','Giỏi'),(4,'2020L2',2,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',2,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',2,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',2,'VAN22',8,8,'Học tốt','Giỏi'),(4,'2020L2',3,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',3,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',3,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',3,'VAN22',8,8,'Học tốt','Giỏi'),(4,'2020L2',4,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',4,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',4,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',4,'VAN22',8,8,'Học tốt','Giỏi'),(4,'2020L2',5,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',5,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',5,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',5,'VAN22',8,8,'Học tốt','Giỏi'),(4,'2020L2',6,'DD22',9,9,'Học tốt chăm chỉ','Xuất sắc'),(4,'2020L2',6,'TNXH22',8,8,'Học tốt','Giỏi'),(4,'2020L2',6,'TOAN22',7,7,'Học khá giỏi','Khá'),(4,'2020L2',6,'VAN22',8,8,'Học tốt','Giỏi'),(5,'2020L3',1,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',1,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',1,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',1,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',1,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',1,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(5,'2020L3',2,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',2,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',2,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',2,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',2,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',2,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(5,'2020L3',3,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',3,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',3,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',3,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',3,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',3,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(5,'2020L3',4,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',4,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',4,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',4,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',4,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',4,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(5,'2020L3',5,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',5,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',5,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',5,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',5,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',5,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(5,'2020L3',6,'DD31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',6,'TA31',7,6,'Cần cải thiện nhiều','Trung bình'),(5,'2020L3',6,'TC31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',6,'TNXH31',7,8,'Tốt có tiến bộ','Khá'),(5,'2020L3',6,'TOAN31',9,7,'Tốt có tiến bộ','Khá'),(5,'2020L3',6,'VAN31',9,9,'Tốt có tiến bộ','Trung bình'),(6,'2020L3',1,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',1,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',1,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',1,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',1,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',1,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(6,'2020L3',2,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',2,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',2,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',2,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',2,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',2,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(6,'2020L3',3,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',3,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',3,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',3,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',3,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',3,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(6,'2020L3',4,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',4,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',4,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',4,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',4,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',4,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(6,'2020L3',5,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',5,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',5,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',5,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',5,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',5,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(6,'2020L3',6,'DD32',9,7,'Tốt có tiến bộ','Khá'),(6,'2020L3',6,'TA32',7,5,'Cần cải thiện nhiều','Trung bình'),(6,'2020L3',6,'TC32',8,6,'Cần cải thiện nhiều','Kém'),(6,'2020L3',6,'TNXH32',8,9,'Tốt có tiến bộ','giỏi'),(6,'2020L3',6,'TOAN32',8,8,'Tốt có tiến bộ','Kém'),(6,'2020L3',6,'VAN32',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',1,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',1,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',1,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',1,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',1,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',1,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',1,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(7,'2020L4',2,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',2,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',2,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',2,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',2,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',2,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',2,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(7,'2020L4',3,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',3,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',3,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',3,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',3,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',3,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',3,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(7,'2020L4',4,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',4,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',4,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',4,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',4,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',4,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',4,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(7,'2020L4',5,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',5,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',5,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',5,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',5,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',5,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',5,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(7,'2020L4',6,'DD41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',6,'MT41',8,8,'Tốt có tiến bộ','Đạt'),(7,'2020L4',6,'TA41',7,6,'Cần cải thiện nhiều','Trung bình'),(7,'2020L4',6,'TC41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',6,'TNXH41',7,8,'Tốt có tiến bộ','Khá'),(7,'2020L4',6,'TOAN41',9,7,'Tốt có tiến bộ','Khá'),(7,'2020L4',6,'VAN41',9,9,'Tốt có tiến bộ','Trung bình'),(8,'2020L4',1,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',1,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',1,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',1,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',1,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',1,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',1,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(8,'2020L4',2,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',2,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',2,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',2,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',2,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',2,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',2,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(8,'2020L4',3,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',3,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',3,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',3,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',3,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',3,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',3,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(8,'2020L4',4,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',4,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',4,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',4,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',4,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',4,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',4,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(8,'2020L4',5,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',5,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',5,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',5,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',5,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',5,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',5,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(8,'2020L4',6,'DD42',9,7,'Tốt có tiến bộ','Khá'),(8,'2020L4',6,'MT42',9,9,'Tốt có tiến bộ','Đạt'),(8,'2020L4',6,'TA42',7,5,'Cần cải thiện nhiều','Trung bình'),(8,'2020L4',6,'TC42',8,6,'Cần cải thiện nhiều','Kém'),(8,'2020L4',6,'TNXH42',8,9,'Tốt có tiến bộ','giỏi'),(8,'2020L4',6,'TOAN42',8,8,'Tốt có tiến bộ','Kém'),(8,'2020L4',6,'VAN42',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',1,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',1,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',1,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',1,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',1,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',1,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',1,'TOAN51',9,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',1,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',2,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',2,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',2,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',2,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',2,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',2,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',2,'TOAN51',9,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',2,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',3,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',3,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',3,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',3,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',3,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',3,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',3,'TOAN51',9,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',3,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',4,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',4,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',4,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',4,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',4,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',4,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',4,'TOAN51',9,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',4,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',5,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',5,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',5,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',5,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',5,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',5,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',5,'TOAN51',9,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',5,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',6,'DD51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',6,'MT51',8,8,'Tốt có tiến bộ','Đạt'),(9,'2020L5',6,'TA51',7,6,'Cần cải thiện nhiều','Trung bình'),(9,'2020L5',6,'TC51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',6,'TIN51',9,9,'Tot can phat huy','Gioi'),(9,'2020L5',6,'TNXH51',7,8,'Tốt có tiến bộ','Khá'),(9,'2020L5',6,'TOAN51',7,7,'Tốt có tiến bộ','Khá'),(9,'2020L5',6,'VAN51',9,9,'Tốt có tiến bộ','Trung bình'),(9,'2020L5',8,'TOAN51',8,8,'học ok','Tốt'),(9,'2020L5',10,'TOAN51',7,7,'tốt','Khá'),(10,'2020L5',1,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',1,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',1,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',1,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',1,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',1,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',1,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',1,'VAN52',7,8,'Tốt có tiến bộ','Khá'),(10,'2020L5',2,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',2,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',2,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',2,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',2,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',2,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',2,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',2,'VAN52',7,8,'Tốt có tiến bộ','Khá'),(10,'2020L5',3,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',3,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',3,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',3,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',3,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',3,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',3,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',3,'VAN52',7,8,'Tốt có tiến bộ','Khá'),(10,'2020L5',4,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',4,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',4,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',4,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',4,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',4,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',4,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',4,'VAN52',7,8,'Tốt có tiến bộ','Khá'),(10,'2020L5',5,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',5,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',5,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',5,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',5,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',5,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',5,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',5,'VAN52',7,8,'Tốt có tiến bộ','Khá'),(10,'2020L5',6,'DD52',9,7,'Tốt có tiến bộ','Khá'),(10,'2020L5',6,'MT52',9,9,'Tốt có tiến bộ','Đạt'),(10,'2020L5',6,'TA52',7,5,'Cần cải thiện nhiều','Trung bình'),(10,'2020L5',6,'TC52',8,6,'Cần cải thiện nhiều','Kém'),(10,'2020L5',6,'TIN52',9,9,'Tot can phat huy','Gioi'),(10,'2020L5',6,'TNXH52',8,9,'Tốt có tiến bộ','giỏi'),(10,'2020L5',6,'TOAN52',8,8,'Tốt có tiến bộ','Kém'),(10,'2020L5',6,'VAN52',7,8,'Tốt có tiến bộ','Khá');
/*!40000 ALTER TABLE `ketquahoctap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lichgiangday`
--

DROP TABLE IF EXISTS `lichgiangday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichgiangday` (
  `thoigian` int NOT NULL,
  `tiethoc` int NOT NULL,
  `lop_id` varchar(10) NOT NULL,
  `giaovien_id` int DEFAULT NULL,
  `monhoc_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`thoigian`,`tiethoc`,`lop_id`),
  KEY `fk_PhanCongGiangDay_has_Lop_Lop1_idx` (`lop_id`),
  KEY `fk_lichgiangday_monhoc1_idx` (`monhoc_id`),
  KEY `fk_lichgiangday_giaovien1_idx` (`giaovien_id`),
  CONSTRAINT `fk_lichgiangday_giaovien1` FOREIGN KEY (`giaovien_id`) REFERENCES `giaovien` (`giaovien_id`),
  CONSTRAINT `fk_lichgiangday_monhoc1` FOREIGN KEY (`monhoc_id`) REFERENCES `monhoc` (`monhoc_id`),
  CONSTRAINT `fk_PhanCongGiangDay_has_Lop_Lop1` FOREIGN KEY (`lop_id`) REFERENCES `lop` (`lop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichgiangday`
--

LOCK TABLES `lichgiangday` WRITE;
/*!40000 ALTER TABLE `lichgiangday` DISABLE KEYS */;
INSERT INTO `lichgiangday` VALUES (2,1,'2020L5',1,'TOAN51'),(2,2,'2020L5',1,'TOAN51'),(2,3,'2020L5',1,'VAN51'),(2,4,'2020L5',2,'MT51'),(2,5,'2020L5',3,'TIN51'),(2,6,'2020L5',1,'TC51'),(3,1,'2020L5',4,'TA51'),(3,2,'2020L5',4,'TA51'),(3,3,'2020L5',1,'DD51'),(3,4,'2020L5',1,'VAN51'),(3,5,'2020L5',1,'VAN51'),(3,6,'2020L5',1,'TNXH51'),(4,1,'2020L5',3,'TIN51'),(4,2,'2020L5',2,'MT51'),(4,3,'2020L5',1,'VAN51'),(4,4,'2020L5',1,'TOAN51'),(4,5,'2020L5',1,'TOAN51'),(4,6,'2020L5',1,'DD51'),(5,1,'2020L5',1,'TOAN51'),(5,2,'2020L5',1,'VAN51'),(5,3,'2020L5',1,'VAN51'),(5,4,'2020L5',1,'TNXH51'),(5,5,'2020L5',3,'TIN51'),(5,6,'2020L5',4,'TA51'),(6,1,'2020L5',1,'TOAN51'),(6,2,'2020L5',1,'TOAN51'),(6,3,'2020L5',1,'VAN51'),(6,4,'2020L5',2,'MT51'),(6,5,'2020L5',3,'TIN51'),(6,6,'2020L5',1,'TC51'),(7,1,'2021L1',1,'TOAN41');
/*!40000 ALTER TABLE `lichgiangday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `lop_id` varchar(10) NOT NULL,
  `lop_name` varchar(45) NOT NULL,
  `giaovien_id` int DEFAULT NULL,
  PRIMARY KEY (`lop_id`),
  KEY `fk_lop_giaovien1_idx` (`giaovien_id`),
  CONSTRAINT `fk_lop_giaovien1` FOREIGN KEY (`giaovien_id`) REFERENCES `giaovien` (`giaovien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES ('2020L1','5A',1),('2020L2','5B',2),('2020L3','5C',3),('2020L4','5D',4),('2020L5','5E',1),('2021L1','4A',1),('2021L2','4B',2),('2021L3','4C',3),('2021L4','4D',4),('2022L1','3A',1),('2022L2','3B',2),('2022L3','3C',3),('2023L1','2A',1),('2023L2','2B',2),('2024L1','1A',1);
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `monhoc_id` varchar(45) NOT NULL,
  `monhoc_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `hocki` int DEFAULT NULL,
  PRIMARY KEY (`monhoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES ('DD11','ĐẠO ĐỨC 1',1),('DD12','ĐẠO ĐỨC 1',2),('DD21','ĐẠO ĐỨC 2',3),('DD22','ĐẠO ĐỨC 2',4),('DD31','ĐẠO ĐỨC 3',5),('DD32','ĐẠO ĐỨC 3',6),('DD41','ĐẠO ĐỨC 4',7),('DD42','ĐẠO ĐỨC 4',8),('DD51','ĐẠO ĐỨC 5',9),('DD52','ĐẠO ĐỨC 5',10),('MT11','MỸ THUẬT 1',1),('MT12','MỸ THUẬT 1',2),('MT21','MỸ THUẬT 2',3),('MT22','MỸ THUẬT 2',4),('MT31','MỸ THUẬT 3',5),('MT32','MỸ THUẬT 3',6),('MT41','MỸ THUẬT 4',7),('MT42','MỸ THUẬT 4',8),('MT51','MỸ THUẬT 5',9),('MT52','MỸ THUẬT 5',10),('TA31','TIẾNG ANH 3',5),('TA32','TIẾNG ANH 3',6),('TA41','TIẾNG ANH 4',7),('TA42','TIẾNG ANH 4',8),('TA51','TIẾNG ANH 5',9),('TA52','TIẾNG ANH 5',10),('TC31','THỂ DỤC 3',5),('TC32','THỂ DỤC 3',6),('TC41','THỂ DỤC 4',7),('TC42','THỂ DỤC 4',8),('TC51','THỂ DỤC 5',9),('TC52','THỂ DỤC 5',10),('TIN51','TIN HỌC 5',9),('TIN52','TIN HỌC 5',10),('TNXH11','TỰ NHIÊN VÀ XÃ HỘI 1',1),('TNXH12','TỰ NHIÊN VÀ XÃ HỘI 1',2),('TNXH21','TỰ NHIÊN VÀ XÃ HỘI 2',3),('TNXH22','TỰ NHIÊN VÀ XÃ HỘI 2',4),('TNXH31','TỰ NHIÊN VÀ XÃ HỘI 3',5),('TNXH32','TỰ NHIÊN VÀ XÃ HỘI 3',6),('TNXH41','TỰ NHIÊN VÀ XÃ HỘI 4',7),('TNXH42','TỰ NHIÊN VÀ XÃ HỘI 4',8),('TNXH51','TỰ NHIÊN VÀ XÃ HỘI 5',9),('TNXH52','TỰ NHIÊN VÀ XÃ HỘI 5',10),('TOAN11','TOÁN 1',1),('TOAN12','TOÁN 1',2),('TOAN21','TOÁN 2',3),('TOAN22','TOÁN 2',4),('TOAN31','TOÁN 3',5),('TOAN32','TOÁN 3',6),('TOAN41','TOÁN 4',7),('TOAN42','TOÁN 4',8),('TOAN51','TOÁN 5',9),('TOAN52','TOÁN 5',10),('VAN11','TIẾNG VIỆT 1',1),('VAN12','TIẾNG VIỆT 1',2),('VAN21','TIẾNG VIỆT 2',3),('VAN22','TIẾNG VIỆT 2',4),('VAN31','TIẾNG VIỆT 3',5),('VAN32','TIẾNG VIỆT 3',6),('VAN41','TIẾNG VIỆT 4',7),('VAN42','TIẾNG VIỆT 4',8),('VAN51','TIẾNG VIỆT 5',9),('VAN52','TIẾNG VIỆT 5',10);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phuhuynh`
--

DROP TABLE IF EXISTS `phuhuynh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phuhuynh` (
  `phuhuynh_id` int NOT NULL AUTO_INCREMENT,
  `user_tendangnhap` varchar(20) NOT NULL,
  PRIMARY KEY (`phuhuynh_id`),
  KEY `fk_PhuHuynh_User1_idx` (`user_tendangnhap`),
  CONSTRAINT `fk_PhuHuynh_User1` FOREIGN KEY (`user_tendangnhap`) REFERENCES `user` (`user_tendangnhap`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phuhuynh`
--

LOCK TABLES `phuhuynh` WRITE;
/*!40000 ALTER TABLE `phuhuynh` DISABLE KEYS */;
INSERT INTO `phuhuynh` VALUES (3,'nguyenvanhung'),(1,'phuhuynh1'),(2,'phuhuynh2');
/*!40000 ALTER TABLE `phuhuynh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_tendangnhap` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_password` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_ho` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_ten` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_sdt` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_email` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_diachi` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `user_ngaysinh` date DEFAULT NULL,
  `user_gioitinh` int DEFAULT NULL,
  `user_loaitk` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`user_tendangnhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('buyduyvan','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Bùy Duy','Văn',NULL,NULL,NULL,NULL,NULL,'hs'),('buyhuybao','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Bùi Huy','Bảo',NULL,NULL,NULL,NULL,NULL,'hs'),('giaovien1','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Hoàng Văn','Tuấn','01234','gv1@gmail.com','Hà nội','1978-08-09',1,'gv'),('giaovien2','$2a$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','GiaoVien2','Văn','0987','gv2@gmail.com','Hà nội','1978-08-09',1,'gv'),('giaovien3','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','GiaoVien3','Thảo','0987','gv3@gmail.com','Bắc Giang','1978-08-09',2,'gv'),('hoanganhtu','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Hoàng Anh Tú','Đức',NULL,NULL,NULL,NULL,1,'gv'),('hoangvankha','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Hoàng Văn Kha','B',NULL,NULL,NULL,NULL,1,'gv'),('hoangvantuyen','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Hoàng Văn','Tuyến',NULL,NULL,NULL,NULL,NULL,'hs'),('hoangvanvuong','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Hoàng Văn','Vương',NULL,NULL,NULL,NULL,NULL,'hs'),('hoangvietlong','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Hoàng Việt','Long',NULL,NULL,NULL,NULL,NULL,'hs'),('hocsinh1','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Bùi Duy1','Văn','012345689','bduyvan2k2@gmail.com','Hà Nội','2017-03-17',2,'hs'),('hocsinh2','$2a$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','HocSinh2','D','0898','hs2@gmail.com','Hà nội','2017-09-30',2,'hs'),('hocsinh3','$2a$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Văn Vũ','E','012345689','van@gmail.com','Thái Bình','2017-09-30',1,'hs'),('lequoctuan','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Lê Quốc','Tuấn',NULL,NULL,NULL,NULL,NULL,'hs'),('ngotruongcong','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Ngô Trương Công','F',NULL,NULL,NULL,NULL,1,'gv'),('nguyenchamhoc','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Giang','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc1','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Hải','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc2','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Yến','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc3','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Hưng','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc4','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','An','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc5','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Văn','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc6','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Huy','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc7','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Tuấn','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc8','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Tùng','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenchamhoc9','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Tú','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyendangloi','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Nguyễn Đăng','Lợi',NULL,NULL,NULL,NULL,NULL,'hs'),('nguyenhongquan','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Nguyễn Hồng','Quân',NULL,NULL,NULL,NULL,NULL,'hs'),('nguyenhuuhung','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Tú','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Ân','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang1','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Dương','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang2','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Anh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang3','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Vũ','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang4','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Việt','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang5','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Trọng','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang6','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Vân','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang7','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Khánh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang8','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Lương','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhang9','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Hương','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh4','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Hùng','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh5','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Vỹ','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh6','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Khanh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh7','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Khánh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh8','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Anh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenhuukhanh9','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Hữu Hùng','Cảnh','097867754','nhhung@gmail.com','Hà nội','1990-08-09',1,'ph'),('nguyenluoihoc','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Bình','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc1','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Thảo','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc2','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Trang','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc3','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Trang','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc4','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Tâm','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc5','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Hằng','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenluoihoc6','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Chăm Học','Phương','097867754','nhhung@gmail.com','Hà nội','2017-08-09',1,'hs'),('nguyenthixuan','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Nguyễn Thị Xuân','Phượng',NULL,NULL,NULL,NULL,2,'gv'),('nguyenvanhung','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Nguyễn Văn Hùng','Hòa','01234','nvhung@gmail.com','Hà nội','1996-07-29',1,'ph'),('nguyenvantuan','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Nguyễn Văn','Tuấn',NULL,NULL,NULL,NULL,NULL,'hs'),('nguyenvanvy','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Nguyễn Văn','Vỹ','03754865','nvv1@gmail.com',NULL,NULL,NULL,'hs'),('phamquocanh','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Phạm Quốc','Anh',NULL,NULL,NULL,NULL,NULL,'hs'),('phamvantu','$2a$12$G5unSOffoANAfOQIa8GT4.sY7Q7HrOtQU5JgY78yDDfDMbwEDI/Di','Phạm Văn','Tú',NULL,NULL,NULL,NULL,NULL,'hs'),('phuhuynh1','$2a$10$9HZqRdDoeBcMULCiQgiDJOk5cYj3D/VcWvc8tiT4sunZOO2WPm.mG','Phạm Đình Sơn','Tùng','0898','ph1@gamil.com','Bắc Ninh','1978-08-09',2,'ph'),('phuhuynh2','$2a$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','PhuHuynh2','Công','0898','ph2@gmail.com','Hà nội','1978-08-09',1,'ph'),('vuhuyhoa','$12$xMahyaW2svHlr3/VRizALOIgpYiTnR0AUIgZDq7vWL37ecwKF0Sdy','Vũ Huy Hòa','Duy',NULL,NULL,NULL,NULL,1,'gv');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-05  9:11:47
