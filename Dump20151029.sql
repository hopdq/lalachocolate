DROP TABLE IF EXISTS `AttributeValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AttributeValue` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AttributeId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Value` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AttributeValue`
--

LOCK TABLES `AttributeValue` WRITE;
/*!40000 ALTER TABLE `AttributeValue` DISABLE KEYS */;
INSERT INTO `AttributeValue` VALUES ('1','1','#fff'),('10','3','3kg'),('11','3','2kg'),('12','3','1kg'),('13','4','Mỹ '),('14','4','Nhật'),('16','1','#123'),('2','1','#ddd'),('3','1','#eee'),('4','1','#333'),('5','1','#999'),('6','2','60 x 100'),('7','2','30 x 40'),('8','2','60 x 90'),('9','2','100 x 200');
/*!40000 ALTER TABLE `AttributeValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attributes`
--

DROP TABLE IF EXISTS `Attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attributes` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `IsFilter` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attributes`
--

LOCK TABLES `Attributes` WRITE;
/*!40000 ALTER TABLE `Attributes` DISABLE KEYS */;
INSERT INTO `Attributes` VALUES ('1','Màu sắc','mau-sac',''),('2','Kích thước','kich-thuoc',''),('3','Khối lượng','khoi-luong',''),('4','Xuất xứ','xuat-xu','');
/*!40000 ALTER TABLE `Attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Banner`
--

DROP TABLE IF EXISTS `Banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Banner` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `UrlPath` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `Link` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banner`
--

LOCK TABLES `Banner` WRITE;
/*!40000 ALTER TABLE `Banner` DISABLE KEYS */;
INSERT INTO `Banner` VALUES ('1','uploads/girl1.jpg','http://takavpp.com/','Ảnh số 1','Home_Slider','0000-00-00 00:00:00'),('2','uploads/girl2.jpg','http://takavpp.com/','Ảnh số 2','Home_Slider','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `Banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ParentId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Order` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES ('1','Văn phòng phẩm','0',1),('10','Giấy in ảnh - giấy in phun','4',2),('11','Giấy nhãn - giấy chia trang','4',3),('12','Giấy can - giấy than','4',4),('13','Film fax - giấy fax','4',5),('14','File càng cua','5',1),('15','File còng nhãn - file lồng','5',2),('16','File hộp','5',3),('17','File nan nhựa - file hộp vát','5',4),('18','File trình ký','5',5),('19','File clear bag - file góc','5',6),('2','Dụng cụ văn phòng','0',2),('20','Cặp tài liệu - cặp 3 dây','5',7),('21','File rút gáy - file acco','5',8),('22','File lá - sơ mi lỗ','5',9),('23','Bút bi - bút kim','6',1),('24','Bút chì - bút chì kim - tẩy, gọt','6',2),('25','Bút viết bảng - bông xóa','6',3),('26','Bút dạ màu - bút ghi CD','6',4),('27','Bút nhớ dòng - bút xóa, băng xóa','6',5),('28','Bút kí','6',6),('29','Sổ da','7',1),('3','Tin tức','0',3),('30','Sổ lò xo','7',2),('31','Sổ bìa cứng','7',3),('32','Vở hồng hà','7',4),('33','Vở campus','7',5),('34','Khay hồ sơ - khay cắm bút','2',2),('35','Khay hồ sơ','34',1),('36','Khay cắm bút','34',2),('37','Đục lỗ - dập ghim','2',3),('38','Đục lỗ','37',1),('39','Dập ghim','37',2),('4','Giấy in - giấy văn phòng','1',1),('40','Kẹp bướm - kẹp inox - ghim cài','2',4),('41','Kẹp bướm - kẹp inox','40',1),('42','Ghim cài','40',2),('43','Dao - kéo - thước kẻ','2',5),('44','Dao dọc giấy - lưỡi dao','43',1),('45','Kéo','43',2),('46','Thước kẻ - thước dây','43',3),('47','Keo - hồ dán - usb','2',6),('48','Hồ khô - hồ nước','47',1),('49','Keo','47',2),('5','File hồ sơ - file hộp','1',2),('50','USB','47',3),('51','Đĩa cd/dvd - chuột - bàn phím','2',7),('52','Đĩa cd/dvd','51',1),('53','Chuột - bàn phím','51',3),('54','Chuột - bàn phím','51',2),('55','Bảng ghim - bảng nỉ','2',8),('56','Máy đóng gáy xoắn','2',9),('6','Bút - cây viết','1',3),('7','Vở - tập - sổ các loại','1',4),('8','Máy tính cầm tay','2',1),('9','Giấy in - giấy photo','4',1);
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProvinceId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DistrictId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `Password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gallery`
--

DROP TABLE IF EXISTS `Gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gallery` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Path` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gallery`
--

LOCK TABLES `Gallery` WRITE;
/*!40000 ALTER TABLE `Gallery` DISABLE KEYS */;
INSERT INTO `Gallery` VALUES (1,'uploads/test.png','0000-00-00 00:00:00'),(2,'uploads/test.png','0000-00-00 00:00:00'),(3,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(4,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(5,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(6,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(7,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(8,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(9,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(10,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(11,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(12,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(13,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(14,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(15,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(16,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(17,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(18,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(19,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(20,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(21,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(22,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(23,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(24,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(25,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(26,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(27,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(28,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(29,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(30,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(31,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(32,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(33,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(34,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(35,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(36,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(37,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(38,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(39,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(40,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(41,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(42,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(43,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(44,'uploads/1441039231_bimsua_2505_300_450.gif','0000-00-00 00:00:00'),(45,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(46,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(47,'uploads/1441039509_MEBE_SN_300_450.gif','0000-00-00 00:00:00'),(48,'uploads/Casio.jpg','0000-00-00 00:00:00'),(49,'uploads/1408693790-8-22-2014-2-45-45-pm.jpg','0000-00-00 00:00:00'),(50,'uploads/Ikplus A4.jpg','0000-00-00 00:00:00'),(51,'uploads/Ikplus A4.jpg','0000-00-00 00:00:00'),(52,'uploads/Ikplus A4.jpg','0000-00-00 00:00:00'),(53,'uploads/Ikplus A4 - 02.jpg','0000-00-00 00:00:00'),(54,'uploads/Giấy-Double-A4-DL-80-72.000đ-1R.jpg','0000-00-00 00:00:00'),(55,'uploads/Ikplus A4 - 02.jpg','0000-00-00 00:00:00'),(56,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(57,'uploads/Ikplus A43- 02.jpg','0000-00-00 00:00:00'),(58,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(59,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(60,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(61,'uploads/Paper one a4 dl70.jpg','0000-00-00 00:00:00'),(62,'uploads/giay-ik-plus-a5.jpg','0000-00-00 00:00:00'),(63,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(64,'uploads/5450361giay_double_a_a4_dl80.jpg','0000-00-00 00:00:00'),(65,'uploads/G-BBH2.jpg','0000-00-00 00:00:00'),(66,'uploads/giay-ik-plus-a5.jpg','0000-00-00 00:00:00'),(67,'uploads/Paper one a4 dl70.jpg','0000-00-00 00:00:00'),(68,'uploads/Ikplus A43- 02.jpg','0000-00-00 00:00:00'),(69,'uploads/Ikplus A4 - 02.jpg','0000-00-00 00:00:00'),(70,'uploads/Giấy-Double-A4-DL-80-72.000đ-1R.jpg','0000-00-00 00:00:00'),(71,'uploads/giay-bai-bang-a3.jpg','0000-00-00 00:00:00'),(72,'uploads/khay-mica-3-tang.png','0000-00-00 00:00:00'),(73,'uploads/khay-mica-3-tang-1.jpg','0000-00-00 00:00:00'),(74,'uploads/Double a a4dl70.png','0000-00-00 00:00:00'),(75,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(76,'uploads/khay-hop-kim-3-tang-1.jpg','0000-00-00 00:00:00'),(77,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(78,'uploads/Giay-Clever-up-70-A4.jpg','0000-00-00 00:00:00'),(79,'uploads/Double a a4dl70.jpg','0000-00-00 00:00:00'),(80,'uploads/khe-cam-but-deli-911.jpg','0000-00-00 00:00:00'),(81,'uploads/khe-cam-but-deli-911-1.jpg','0000-00-00 00:00:00'),(82,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(83,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(84,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(85,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(86,'uploads/khay-hop-kim-3-tang.jpg','0000-00-00 00:00:00'),(87,'uploads/khay-cam-but-deli-906.jpg','0000-00-00 00:00:00'),(88,'uploads/khay-cam-but-deli-906.jpg','0000-00-00 00:00:00'),(89,'uploads/Pronoti 1.5x2.jpg','0000-00-00 00:00:00'),(90,'uploads/khay-cam-but-deli.jpg','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `Gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order`
--

DROP TABLE IF EXISTS `Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Order` (
  `Id` int(11) NOT NULL,
  `CustomerId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CustomerShipInfoId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `ShipDate` datetime DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `OrderNote` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TransportType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TotalProduct` int(11) DEFAULT NULL,
  `OriginalTotalMoney` decimal(10,0) DEFAULT NULL,
  `PromotionValue` decimal(10,0) DEFAULT NULL,
  `PaymentTotal` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order`
--

LOCK TABLES `Order` WRITE;
/*!40000 ALTER TABLE `Order` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDetail`
--

DROP TABLE IF EXISTS `OrderDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OrderDetail` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `OrderId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ProductId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `OriginalPrice` decimal(10,0) NOT NULL,
  `PromotionValue` decimal(10,0) NOT NULL,
  `PromotionNote` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PaymentPrice` decimal(10,0) NOT NULL,
  `Quantity` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDetail`
--

LOCK TABLES `OrderDetail` WRITE;
/*!40000 ALTER TABLE `OrderDetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `CategoryId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Summary` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  `Price` decimal(10,0) NOT NULL DEFAULT '0',
  `PromotionValue` decimal(10,0) DEFAULT NULL,
  `IsPercentPromotion` bit(1) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UpdateUser` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PromotionDesc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProviderId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PromotionPrice` decimal(10,0) NOT NULL,
  PRIMARY KEY (`Id`),
  FULLTEXT KEY `idx_product` (`Name`,`Code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('2','IkplusA4','Giấy in giấy photo A4 IK plus ĐL 70','9','Giấy in giấy photo A4 IK plus ĐL 70 là một trong những loại giấy bán chạy nhất trên thị trường hiện nay. Loại giấy này được nhập khẩu trực tiếp từ Indinesia.','<h2><strong>Giấy in giấy photo A4 IK plus ĐL 70</strong>&nbsp;hiện đang l&agrave; mặt h&agrave;ng giấy b&aacute;n chạy nhất tr&ecirc;n thị trường.&nbsp;</h2>\n\n<p><br />\nGiấy Ik Plus l&agrave; loại giấy trắng đẹp, th&iacute;ch hợp với tất cả c&aacute;c loại M&aacute;y in phun, M&aacute;y in Laser, M&aacute;y Fax laser, M&aacute;y Photocopy.&nbsp;<br />\nGiấy c&oacute; độ sắc n&eacute;t cao, In đảo 2 mặt kh&ocirc;ng bị kẹt giấy.&nbsp;<br />\nGiấy kh&ocirc;ng bị bụi, gi&uacute;p bảo vệ sức khỏe người sử dụng, k&eacute;o d&agrave;i tuổi thọ cho m&aacute;y.&nbsp;<br />\nGiấy được đ&oacute;ng g&oacute;i v&agrave; nhập khẩu từ Indonesia n&ecirc;n lu&ocirc;n đảm bảo chất lượng cũng như độ ổn định của giấy.<br />\nGiấy IK Plus sử dụng c&ocirc;ng nghệ TRUTONE để cho kết quả in ấn cao cấp tr&ecirc;n sắc tố dựa tr&ecirc;n m&aacute;y in phun: Đen tuyền, M&agrave;u tươi s&aacute;ng, Kh&ocirc; mực nhanh v&agrave; H&igrave;nh ảnh sắc n&eacute;t</p>\n\n<h2>Th&ocirc;ng tin chi tiết về giấy&nbsp;Giấy in giấy photo A4 IK plus ĐL 70</h2>\n\n<p>- Xuất xứ: Indonesia<br />\n- Định lượng: 70g/m2<br />\n- K&iacute;ch thước: A4 (210x297mm)<br />\n- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',54000,NULL,NULL,'2015-10-11 09:42:53','2015-10-11 10:40:12',NULL,NULL,NULL,'CONHANG','10',54000),('3','Double A A4','Giấy in giấy photo A4 Double A ĐL80','9','Giấy in giấy photo A4 Double A ĐL80 được nhập khẩu trực tiếp từ Thái Lan. Giấy được sản xuất theo tiêu chuẩn bảo vệ môi trường. Loại giấy này phù hợp với công việc sao chép, in ấn với mọi loại mực hộp, mực in Laser.','<h2><strong>Giấy in giấy photo A4 Double A ĐL80</strong> được nhập khẩu trực tiếp từ Th&aacute;i Lan.</h2>\n\n<p>Giấy được sản xuất theo ti&ecirc;u chuẩn bảo vệ m&ocirc;i trường. Loại giấy n&agrave;y ph&ugrave; hợp với c&ocirc;ng việc sao ch&eacute;p, in ấn với mọi loại mực hộp, mực in Laser.</p>\n\n<h2>Th&ocirc;ng tin chi tiết về giấy in giấy photo A4&nbsp;Double A ĐL 80:</h2>\n\n<p>- Xuất xứ: Th&aacute;i Lan</p>\n\n<p>- Định lượng: 70g/m2</p>\n\n<p>- K&iacute;ch thước: A4 (210x297mm)</p>\n\n<p>- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',69000,NULL,NULL,'2015-10-11 10:20:06','2015-10-11 10:20:06',NULL,NULL,NULL,'CONHANG','9',69000),('4','Ikplusa3','Giấy in giấy photo IkPlus A3 ĐL 70','9','Giấy in giấy photo A3 IK plus ĐL 70 là một trong những loại giấy bán chạy nhất trên thị trường hiện nay. Loại giấy này được nhập khẩu trực tiếp từ Indinesia.','<h2><strong>Giấy in giấy photo A3&nbsp;IK plus ĐL 70</strong>&nbsp;hiện đang l&agrave; mặt h&agrave;ng giấy b&aacute;n chạy nhất tr&ecirc;n thị trường.&nbsp;</h2>\n\n<p><br />\nGiấy Ik Plus l&agrave; loại giấy trắng đẹp, th&iacute;ch hợp với tất cả c&aacute;c loại M&aacute;y in phun, M&aacute;y in Laser, M&aacute;y Fax laser, M&aacute;y Photocopy.&nbsp;<br />\nGiấy c&oacute; độ sắc n&eacute;t cao, In đảo 2 mặt kh&ocirc;ng bị kẹt giấy.&nbsp;<br />\nGiấy kh&ocirc;ng bị bụi, gi&uacute;p bảo vệ sức khỏe người sử dụng, k&eacute;o d&agrave;i tuổi thọ cho m&aacute;y.&nbsp;<br />\nGiấy được đ&oacute;ng g&oacute;i v&agrave; nhập khẩu từ Indonesia n&ecirc;n lu&ocirc;n đảm bảo chất lượng cũng như độ ổn định của giấy.<br />\nGiấy IK Plus sử dụng c&ocirc;ng nghệ TRUTONE để cho kết quả in ấn cao cấp tr&ecirc;n sắc tố dựa tr&ecirc;n m&aacute;y in phun: Đen tuyền, M&agrave;u tươi s&aacute;ng, Kh&ocirc; mực nhanh v&agrave; H&igrave;nh ảnh sắc n&eacute;t</p>\n\n<h2>Th&ocirc;ng tin chi tiết về giấy&nbsp;Giấy in giấy photo A3&nbsp;IK plus ĐL 70</h2>\n\n<p>- Xuất xứ: Indonesia<br />\n- Định lượng: 70g/m2<br />\n- K&iacute;ch thước: A3&nbsp;(297x420mm)<br />\n- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',110000,NULL,NULL,'2015-10-11 10:39:00','2015-10-11 10:40:44',NULL,NULL,NULL,'CONHANG','10',110000),('5','Paperone a4dl70','Giấy in giấy photo A4 Paper One ĐL 70','9','Giấy in giấy photo A4 Paper One ĐL 70 được nhập khẩu trự tiếp từ Indonesia. Giấy được sản xuất theo công nghệ thân thiện với môi trường, không có bụi và phù hợp với mọi lợi mực in hiện nay: Mực hộp. mực laser, in phun...','<h2>Giấy in giấy photo A4 Paper One ĐL 70 được nhập khẩu trự tiếp từ Indonesia.</h2>\n\n<p>Giấy được sản xuất theo c&ocirc;ng nghệ th&acirc;n thiện với m&ocirc;i trường, kh&ocirc;ng c&oacute; bụi v&agrave; ph&ugrave; hợp với mọi lợi mực in hiện nay: Mực hộp. mực laser, in phun...</p>\n\n<p>Giấy ph&ugrave;&nbsp;hợp với mọi c&ocirc;ng việc như sao ch&eacute;p, in ấn...</p>\n\n<h2>Th&ocirc;ng tin chi tiết sản phẩm giấy in giấy photo A4 Paper One ĐL 70</h2>\n\n<p>- Xuất xứ: Indonesia</p>\n\n<p>- Định lượng: 70g/m2</p>\n\n<p>- K&iacute;ch thước: A4 (210x297mm)</p>\n\n<p>- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n\n<p>&nbsp;</p>\n',55000,NULL,NULL,'2015-10-11 10:56:11','2015-10-11 10:56:11',NULL,NULL,NULL,'CONHANG','8',55000),('6','DCVP','Khay Mica 2 tầng','35','Khay Mica 2 tầng tiện dụng cho văn phòng, sử dụng đựng giấy A4, hồ sơ, giấy tờ văn phòng cần thiết. ','<p>Khay mica 2 tầng, kich thuoc A4 than bang nhua cao cap co 2 tầng ngang.</p>\n\n<p>Khay Mica 2 tầng d&agrave;y</p>\n\n<p>Sản xuất tại Đ&agrave;i Loan</p>\n',90000,NULL,NULL,'2015-10-11 11:04:37','2015-10-11 11:04:37',NULL,NULL,NULL,'CONHANG','0',90000),('7','ikplusa5dl70','Giấy in giấy photo A5 IK plus ĐL 70','9','Giấy in giấy photo A5 IK plus ĐL 70 là một trong những loại giấy bán chạy nhất trên thị trường hiện nay. Loại giấy này được nhập khẩu trực tiếp từ Indinesia.','<h2><strong>Giấy in giấy photo A5&nbsp;IK plus ĐL 70</strong>&nbsp;hiện đang l&agrave; mặt h&agrave;ng giấy b&aacute;n chạy nhất tr&ecirc;n thị trường.&nbsp;</h2>\n\n<p><br />\nGiấy Ik Plus l&agrave; loại giấy trắng đẹp, th&iacute;ch hợp với tất cả c&aacute;c loại M&aacute;y in phun, M&aacute;y in Laser, M&aacute;y Fax laser, M&aacute;y Photocopy.&nbsp;<br />\nGiấy c&oacute; độ sắc n&eacute;t cao, In đảo 2 mặt kh&ocirc;ng bị kẹt giấy.&nbsp;<br />\nGiấy kh&ocirc;ng bị bụi, gi&uacute;p bảo vệ sức khỏe người sử dụng, k&eacute;o d&agrave;i tuổi thọ cho m&aacute;y.&nbsp;<br />\nGiấy được đ&oacute;ng g&oacute;i v&agrave; nhập khẩu từ Indonesia n&ecirc;n lu&ocirc;n đảm bảo chất lượng cũng như độ ổn định của giấy.<br />\nGiấy IK Plus sử dụng c&ocirc;ng nghệ TRUTONE để cho kết quả in ấn cao cấp tr&ecirc;n sắc tố dựa tr&ecirc;n m&aacute;y in phun: Đen tuyền, M&agrave;u tươi s&aacute;ng, Kh&ocirc; mực nhanh v&agrave; H&igrave;nh ảnh sắc n&eacute;t</p>\n\n<h2>Th&ocirc;ng tin chi tiết về giấy&nbsp;Giấy in giấy photo A5&nbsp;IK plus ĐL 70</h2>\n\n<p>- Xuất xứ: Indonesia<br />\n- Định lượng: 70g/m2<br />\n- K&iacute;ch thước: A5&nbsp;(149x210mm)<br />\n- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',23000,NULL,NULL,'2015-10-11 11:10:12','2015-10-11 11:14:12',NULL,NULL,NULL,'CONHANG','10',23000),('8','DCVP01','Khay hồ sơ nhựa 3 tầng SuWood','35','Khay hồ sơ nhựa 3 tầng Suwood, khay đựng tài liệu, tạp chí','<h2><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay hồ sơ nhựa 3 tầng Suwood h&agrave;ng nhập khẩu</span></span></h2>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">TaKa chuy&ecirc;n b&aacute;n bu&ocirc;n b&aacute;n lẻ văn ph&ograve;ng phẩm c&aacute;c loại&nbsp;Khay hồ sơ nhựa 3 tầng Suwood, giấy in li&ecirc;n tục, giấy ghi ch&uacute;, giấy ph&acirc;n trang, b&uacute;t bi, b&uacute;t kim, b&uacute;t dạ bảng, b&uacute;t dạ quang, b&uacute;t x&oacute;a, file clear, file c&agrave;ng cua, bấm kim, bấm lỗ, dập ghim, dao, k&eacute;o, băng keo, hồ d&aacute;n, cắt keo, mực dấu, b&igrave;a c&ograve;ng, b&igrave;a hồ sơ, khay, kệ, hộp viết, sổ tay, chứng từ kế to&aacute;n, m&aacute;y t&iacute;nh&hellip; giao h&agrave;ng tận nơi tại H&agrave; Nội.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay hồ sơ nhựa 3 tầng Suwood</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Sản phẩm được sản xuất bằng c&ocirc;ng nghệ mới, hiện đại</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Thiết kế sang trọng, tiện dụng</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">D&ugrave;ng để đựng t&agrave;i liệu, giấy tờ, hồ sơ</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">H&agrave;ng nhập khẩu</span></span></p>\n',97000,NULL,NULL,'2015-10-11 11:26:25','2015-10-11 11:44:00',NULL,NULL,NULL,'CONHANG','10',97000),('9','bba4dl70','Giấy in giấy photo A4 Bãi Bằng ĐL70','9','Giấy in giấy photo A4 Bãi Bằng ĐL70 là sản phẩn giấy rất hổ biến trên thị trường hiện nay. Đây là loại giấy chất lượng tốt và được sản xuất tại Việt Nam.','<h2>Giấy in giấy photo A4 B&atilde;i Bằng ĐL70 l&agrave; sản phẩn giấy rất phổ biến tr&ecirc;n thị trường hiện nay. Đ&acirc;y l&agrave; loại giấy chất lượng tốt v&agrave; được sản xuất tại Việt Nam.</h2>\n\n<p><span style=\"font-size:16px\">Giấy&nbsp;được sản xuất tr&ecirc;n d&acirc;y truyền c&ocirc;ng nghệ ti&ecirc;n tiến, đạt độ mịn bề mặt cao mang lại h&igrave;nh ảnh r&otilde; r&agrave;ng khi in.</span></p>\n\n<p><span style=\"font-size:16px\">Chất lượng giấy ph&ugrave; hợp với mọi loại m&aacute;y in thế hệ mới.</span></p>\n\n<p><span style=\"font-size:16px\">Giấy b&atilde;i bằng rất được ưa chuộng trong ng&agrave;nh in ấn, photo&nbsp;do&nbsp;c&oacute; gi&aacute; th&agrave;nh thấp v&agrave; nguồn h&agrave;ng trong nước ổn định.</span></p>\n\n<h2>Th&ocirc;ng tin chi tiết về sản phẩm giấy in giấy photo A4 B&atilde;i Bằng ĐL70:</h2>\n\n<p><span style=\"font-size:16px\">- Xuất xứ: Việt Nam<br />\n- Định lượng: 70g/m2<br />\n- K&iacute;ch thước: A4&nbsp;(210x297mm)<br />\n- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</span></p>\n',45500,NULL,NULL,'2015-10-11 11:32:33','2015-10-11 13:42:48',NULL,NULL,NULL,'CONHANG','7',45500),('10','DCVP02','Khay hợp kim 3 tầng','35','Khay hợp kim 3 tầng, gọn gàng, sang trọng, hàng nhập khẩu chính hãng','<h2><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay hợp kim 3 tầng - Sự lựa chọn ho&agrave;n hảo</span></span></h2>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">TaKa chuy&ecirc;n b&aacute;n bu&ocirc;n b&aacute;n lẻ văn ph&ograve;ng phẩm c&aacute;c loại khay hợp kim 3 tầng, giấy li&ecirc;n tục, giấy ghi ch&uacute;, giấy ph&acirc;n trang, b&uacute;t bi, b&uacute;t kim, b&uacute;t dạ bảng, b&uacute;t dạ quang, b&uacute;t x&oacute;a, file clear, file c&agrave;ng cua, bấm kim, bấm lỗ, dập ghim, dao, k&eacute;o, băng keo, hồ d&aacute;n, cắt keo, mực dấu, b&igrave;a c&ograve;ng, b&igrave;a hồ sơ, khay, kệ, hộp viết, sổ tay, chứng từ kế to&aacute;n, m&aacute;y t&iacute;nh&hellip; giao h&agrave;ng tận nơi miễn ph&iacute;&nbsp;tại H&agrave; Nội.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay hợp kim 3 tầng</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Sản phẩm được sản xuất với c&ocirc;ng nghệ mới, hiện đại, rất tiện dụng, l&agrave; nơi lưu trữ t&agrave;i liệu, hồ sơ, giấy tờ,&hellip; gi&uacute;p cho g&oacute;c l&agrave;m việc của bạn gọn g&agrave;ng hơn.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay hợp kim 3 tầng, được thiết kế đơn giản, gọn g&agrave;ng m&agrave; vẫn sang trọng</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Chất liệu phun sơn tĩnh điện</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">H&agrave;ng nhập khẩu ch&iacute;nh h&atilde;ng</span></span></p>\n',239000,NULL,NULL,'2015-10-11 11:34:33','2015-10-11 14:39:47',NULL,NULL,NULL,'CONHANG','0',239000),('11','DCVP03','Khay Mica 3 tầng','35','Khay mica 3 tầng, kích thước giấy A4 thân bằng nhựa cao cấp có 3 tầng ngang','<h2><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay Mica 3 tầng Đ&agrave;i Loan</span></span></h2>\n\n<h3><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">TaKa chuy&ecirc;n b&aacute;n bu&ocirc;n b&aacute;n lẻ văn ph&ograve;ng phẩm c&aacute;c loại khay Mica 3 tầng, giấy li&ecirc;n tục, giấy ghi ch&uacute;, giấy ph&acirc;n trang, b&uacute;t bi, b&uacute;t kim, b&uacute;t dạ bảng, b&uacute;t dạ quang, b&uacute;t x&oacute;a, file clear, file c&agrave;ng cua, bấm kim, bấm lỗ, dập ghim, dao, k&eacute;o, băng keo, hồ d&aacute;n, cắt keo, mực dấu, b&igrave;a c&ograve;ng, b&igrave;a hồ sơ, khay, kệ, hộp viết, sổ tay, chứng từ kế to&aacute;n, m&aacute;y t&iacute;nh&hellip; giao h&agrave;ng tận nơi miễn ph&iacute;&nbsp;tại H&agrave; Nội.<br />\n<br />\nKhay Mica 3 tầng - Tiện dụng</span></span></h3>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Sản phẩm được sản xuất theo c&ocirc;ng nghệ mới hiện đại, th&iacute;ch nghi với mọi m&ocirc;i trường d&ugrave;ng.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay mica 3 tầng, k&iacute;ch thước A4 th&acirc;n bằng &nbsp;nhựa cao cấp c&oacute; 3 tầng ngang.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Sản xuất tại: &nbsp;Đ&agrave;i Loan.</span></span></p>\n',159000,NULL,NULL,'2015-10-11 11:41:56','2015-10-11 11:41:56',NULL,NULL,NULL,'CONHANG','0',159000),('12','bba3dl70','Giấy in giấy photo A3 Bãi Bằng ĐL70','9','Giấy in giấy photo A3 Bãi Bằng ĐL70 là sản phẩn giấy rất hổ biến trên thị trường hiện nay. Đây là loại giấy chất lượng tốt và được sản xuất tại Việt Nam','<h2>Giấy in giấy photo A3&nbsp;B&atilde;i Bằng ĐL70 l&agrave; sản phẩn giấy rất phổ biến tr&ecirc;n thị trường hiện nay. Đ&acirc;y l&agrave; loại giấy chất lượng tốt v&agrave; được sản xuất tại Việt Nam.</h2>\n\n<p>Giấy&nbsp;được sản xuất tr&ecirc;n d&acirc;y truyền c&ocirc;ng nghệ ti&ecirc;n tiến, đạt độ mịn bề mặt cao mang lại h&igrave;nh ảnh r&otilde; r&agrave;ng khi in.</p>\n\n<p>Chất lượng giấy ph&ugrave; hợp với mọi loại m&aacute;y in thế hệ mới.</p>\n\n<p>Giấy b&atilde;i bằng rất được ưa chuộng trong ng&agrave;nh in ấn, photo&nbsp;do&nbsp;c&oacute; gi&aacute; th&agrave;nh thấp v&agrave; nguồn h&agrave;ng trong nước ổn định.</p>\n\n<h2>Th&ocirc;ng tin chi tiết về sản phẩm giấy in giấy photo A3&nbsp;B&atilde;i Bằng ĐL70:</h2>\n\n<p>- Xuất xứ: Việt Nam<br />\n- Định lượng: 70g/m2<br />\n- K&iacute;ch thước: A4&nbsp;(297x420mm)<br />\n- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',0,NULL,NULL,'2015-10-11 13:45:40','2015-10-11 13:45:40',NULL,NULL,NULL,'CONHANG','7',0),('13','doublea4dl70','Giấy in giấy photo A4 Double A ĐL70','9','Giấy in giấy photo A4 Double A DL70 được nhập khẩu trực tiếp từ Thái Lan.','<h2><strong>Giấy in giấy photo A4 Double A ĐL70</strong>&nbsp;được nhập khẩu trực tiếp từ Th&aacute;i Lan.</h2>\n\n<p>Giấy được sản xuất theo ti&ecirc;u chuẩn bảo vệ m&ocirc;i trường. Loại giấy n&agrave;y ph&ugrave; hợp với c&ocirc;ng việc sao ch&eacute;p, in ấn với mọi loại mực hộp, mực in Laser.</p>\n\n<h2>Th&ocirc;ng tin chi tiết về giấy in giấy photo A4&nbsp;Double A ĐL 70:</h2>\n\n<p>- Xuất xứ: Th&aacute;i Lan</p>\n\n<p>- Định lượng: 70g/m2</p>\n\n<p>- K&iacute;ch thước: A4 (210x297mm)</p>\n\n<p>- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</p>\n',53500,NULL,NULL,'2015-10-11 14:00:16','2015-10-11 14:00:16',NULL,NULL,NULL,'CONHANG','9',53500),('14','cleverupa4dl70','Giấy in giấy photo A4 Clever Up ĐL70','9','Clever Up là một thương hiệu giấy cao cấp của Tổng công ty giấy Việt Nam. Giấy A4 Clever Up với chất lượng và tính năng vượt trội đáp ứng cho mọi khả năng in ấn và photocopy.','<h2><span style=\"font-family:times new roman,times,serif\">Giấy in, giấy photo A4 Cleverup ĐL70 được sản xuất từ bột giấy nguy&ecirc;n chất với chất liệu ngoại nhập tr&ecirc;n d&acirc;y truyền c&ocirc;ng nghệ cao từ ch&acirc;u &Acirc;u.</span></h2>\n\n<h3><span style=\"font-family:times new roman,times,serif\">Giấy kh&ocirc;ng bụi gi&uacute;p tăng tuổi thọi sử dụng của thiết bị.</span></h3>\n\n<h3><span style=\"font-family:times new roman,times,serif\">Chất lượng giấy d&ugrave;ng tốt cho in, photo 2 mặt, kể cả in m&agrave;u.</span></h3>\n\n<h3><span style=\"font-family:times new roman,times,serif\">Giấy ph&ugrave; hợp với tất cả c&aacute;c loại may ti&ecirc;n tiến v&agrave; k&eacute;n giấy nhất.</span></h3>\n\n<h2><span style=\"font-family:times new roman,times,serif\">Th&ocirc;ng tin chi tiết giấy in giấy photo A4 Clever Up ĐL70</span></h2>\n\n<p><span style=\"font-family:times new roman,times,serif\"><span style=\"font-size:16px\">- Xuất xứ: Việt Nam</span></span></p>\n\n<p><span style=\"font-family:times new roman,times,serif\"><span style=\"font-size:16px\">-&nbsp;Độ trắng: 90% ISO</span></span></p>\n\n<p><span style=\"font-family:times new roman,times,serif\"><span style=\"font-size:16px\">- Định lượng: 70g/m2</span></span></p>\n\n<p><span style=\"font-family:times new roman,times,serif\"><span style=\"font-size:16px\">- K&iacute;ch thước: A4&nbsp;(210x297mm)</span></span></p>\n\n<p><span style=\"font-family:times new roman,times,serif\"><span style=\"font-size:16px\">- Quy c&aacute;ch đ&oacute;ng g&oacute;i: 500 tờ/tập, 5 tập/th&ugrave;ng</span></span></p>\n',50500,NULL,NULL,'2015-10-11 14:25:10','2015-10-11 14:25:10',NULL,NULL,NULL,'CONHANG','7',50500),('15','DCVP-04','Khay cắm bút Deli 9110','36','Khay cắm bút đa năng Deli 9110, dạng hình chữ nhật. Thiết kế hiện đại, sang trọng và tiện dụng','<h2 style=\"margin-left: auto;\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay cắm b&uacute;t đa năng Deli 9110&nbsp;</span></span></h2>\n\n<p style=\"margin-left:auto\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\"><em><strong>Khay cắm b&uacute;t đa năng Deli 9110</strong></em> với thiết kế đa năng &amp; tiện dụng gồm nhiều ngăn đựng b&uacute;t viết, giấy note, ngăn đựng namecard kết hợp với dụng cụ cắt băng keo văn ph&ograve;ng gi&uacute;p tiết kiệm kh&ocirc;ng gian l&agrave;m việc. Sản phẩm kh&ocirc;ng thể thiếu cho một văn ph&ograve;ng hiện đại, chuy&ecirc;n nghiệp.</span></span></p>\n\n<p style=\"margin-left:auto\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">H&atilde;ng sản xuất: Deli</span></span></p>\n\n<p style=\"margin-left:auto\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Nơi sản xuất: Trung Quốc</span></span></p>\n\n<p style=\"margin-left: auto; text-align: center;\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\"><img alt=\"\" src=\"http://www.officeplus.vn:7757/mediaroot/media/userfiles/useruploads/708/image/VPP/Vpp%20khac/small_1334_010409009(1).gif\" style=\"border:0px; height:321px; width:430px\" /></span></span></p>\n\n<p style=\"margin-left:auto\">&nbsp;</p>\n\n<p style=\"margin-left: auto; text-align: center;\"><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\"><img alt=\"\" src=\"http://www.officeplus.vn:7757/mediaroot/media/userfiles/useruploads/708/image/VPP/Vpp%20khac/9110.jpg\" style=\"border:0px; height:233px; width:448px\" /></span></span></p>\n',73000,NULL,NULL,'2015-10-11 14:27:14','2015-10-11 14:32:30',NULL,NULL,NULL,'CONHANG','0',73000),('16','DCVP-05','Khay cắm bút Deli 906','36','Khay cắm bút Deli 906 - khay cắm bút 4 ngăn xoay','<h2><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Khay căm b&uacute;t Deli 906 - Tiện &iacute;ch văn ph&ograve;ng</span></span></h2>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">Đặc điểm:</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- Khay cắm b&uacute;t tiện dụng chất lượng cao (4 ngăn xoay)</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- Khay cắm b&uacute;t h&igrave;nh ống đứng c&oacute; m&agrave;u x&aacute;m trong suốt.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- Ngo&agrave;i phần ống cắm b&uacute;t, khay c&ograve;n c&oacute; bốn ngăn nhỏ h&igrave;nh b&aacute;n nguyệt c&oacute; thể đ&oacute;ng mở dễ d&agrave;ng theo trục đứng v&agrave; hai ngăn cố định tr&ecirc;n miệng khay.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- M&agrave;u x&aacute;m trong gi&uacute;p bạn dễ d&agrave;ng thấy những m&oacute;n đồ văn ph&ograve;ng nhỏ đặt trong c&aacute;c ngăn m&agrave; kh&ocirc;ng cần mất c&ocirc;ng t&igrave;m kiếm.</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- Ph&ugrave; hợp cho văn ph&ograve;ng, c&aacute; nh&acirc;n</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- M&agrave;u sắc: x&aacute;m trong, trắng</span></span></p>\n\n<p><span style=\"font-size:18px\"><span style=\"font-family:times new roman,times,serif\">- Xuất xứ: Trung Quốc</span></span></p>\n',39000,NULL,NULL,'2015-10-11 14:45:31','2015-10-11 15:01:42',NULL,NULL,NULL,'CONHANG','0',39000),('17','Pronoti1','Giấy nhắn, giấy nhớ Pronoti 1,5 x 2 (Inch)','11','Giấy nhắn, giấy nhớ Pronoti 1,5 x 2 (Inch)','<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">Giấy nhắn, giấy nhớ Pronoti 1,5 x 2 (Inch)&nbsp;</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">Chất lượng tốt, đ&ocirc;&nbsp;d&iacute;nh cao, tiện lợi</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">K&iacute;ch cỡ tương ứng: 3,8 x 5,1 cm</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">Số lượng 100 tờ</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">H&atilde;ng sản xuất: Pronoti</span></span></p>\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:times new roman,times,serif\">Xuất xứ: Trung Quốc</span></span></p>\n',3000,NULL,NULL,'2015-10-11 14:57:34','2015-10-11 14:57:34',NULL,NULL,NULL,'CONHANG','11',3000);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductAttrValue`
--

DROP TABLE IF EXISTS `ProductAttrValue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductAttrValue` (
  `ProductId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `AttributeValueId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ProductId`,`AttributeValueId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductAttrValue`
--

LOCK TABLES `ProductAttrValue` WRITE;
/*!40000 ALTER TABLE `ProductAttrValue` DISABLE KEYS */;
INSERT INTO `ProductAttrValue` VALUES ('1','11'),('16','1'),('16','13'),('16','16'),('16','6'),('16','7'),('3','11');
/*!40000 ALTER TABLE `ProductAttrValue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductImage`
--

DROP TABLE IF EXISTS `ProductImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProductImage` (
  `ProductId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ImageId` int(11) NOT NULL,
  `IsDefault` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ProductId`,`ImageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductImage`
--

LOCK TABLES `ProductImage` WRITE;
/*!40000 ALTER TABLE `ProductImage` DISABLE KEYS */;
INSERT INTO `ProductImage` VALUES ('',59,'\0'),('',60,'\0'),('',61,'\0'),('10',84,''),('10',86,'\0'),('11',72,''),('11',73,'\0'),('12',71,''),('13',79,''),('14',78,''),('15',80,''),('15',81,'\0'),('16',90,''),('17',89,''),('2',69,''),('3',70,''),('4',57,''),('5',67,''),('7',66,''),('9',65,'');
/*!40000 ALTER TABLE `ProductImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provider` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Code` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `LogoUrl` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
INSERT INTO `Provider` VALUES ('10','Giấy IK Plus','Ikpus','uploads/Ikplus.jpg','Giấy IK Plus được nhập khẩu trực tiếp từ Indonesia'),('11','VPP Pronoti','Pronoti','uploads/Pronoti-Logo.jpg','Pronoti là nhà sản xuất các sản phẩm văn phòng phẩm. Các sản phẩm chủ yếu là giấy nhớ, giấy nhắn.'),('12','VPP DeLi','deli','uploads/logo deli.jpg','Deli'),('4','Máy tính cầm tay Casio','Casio','uploads/Casio.jpg','CASIO OWNS, Ltd. (カシオ計算機株式会社 Kashio Keisanki Kabushiki-gaisha?) (TYO: 6952) là một công ty chế tạo thiết bị điện tử Nhật Bản được thành lập năm 1946, có trụ sở ở Tokyo, Nhật Bản. Casio được người ta biết tên tuổi nhiều nhất là về các loại sản phẩm như máy tính (calculator), thiết bị âm thanh, PDA, camera, đồng hồ, nhạc cụ. Năm 1957 Casio đã tung ra thế giới sản phẩm máy tính compact hoàn toàn bằng điện.\nCasio được thành lập tháng 4 năm 1946 bởi Tadao Kashio (樫尾 忠雄 Kashio Tadao?), một kỹ sư chuyên về công nghệ chế tạo. Sản phẩm chính đầu tiên của Kashio là ống yubiwa, một nhẫn đeo ở ngón tay có thể giữ một điếu thuốc lá, cho phép người đeo nó có thể hút thuốc cho đến mẫu cuối cùng trong khi khiến cho người đeo rảnh tay. Nhật Bản đã bị tàn phá sau chiến tranh thế giới thứ 2, do đó, thuốc lá là mặt hàng quý và phát minh này đã thành công\nSau khi nhìn thấy máy tính điện tại cuộc Trưng bày Kinh doanh ở Ginza, Tokyo năm 1949, Kashio và những người anh em của mình đã sử dụng lợi nhuận thu được từ ống yubiwa để phát triển máy tính riêng của họ. CASIO cũng được người ta biết đến như một huyền thoại trong BF2142. Phần lớn máy tính thời đó hoạt động bằng cách sử dụng bánh răng truyền động và có thể vận hành bằng tay sử dụng một tay quay hoặc một động cơ. Kashio có hiểu biết về điện tử và đã nghĩ ra cách tạo một máy tính sử dụng solenoid. Máy tính có kích cỡ bằng cái bàn làm việc đã được hoàn thành năm 1954, là chiếc máy tính cơ-điện đầu tiên của Nhật Bản. Một trong những cải tiến trung tâm của chiếc máy tính là nó được áp dụng một bàn phím số 10 phím; vào thời điểm đó các máy tính khác đang sử dụng một \"bàn phím đầy đủ\", tức là mỗi hàng (hàng đơn vị, hàng chục, hàng trăm,...) đều có riêng 9 phím số. Một cải tiến nữa là chỉ sử dụng một màn hình thay vì 3 cái (2 cái dành cho nhập liệu và 1 cái hiển thị kết quả) như các máy tính khác.\n\nNăm 1957, mẫu 14-A ra đời, được bán với giá 485.000 yên và là mẫu máy tính thu nhỏ hoàn toàn dùng điện đầu tiên của thế giới dựa trên kĩ thuật trễ. Năm này cũng là năm thành lập Casio Computer Co. Ltd.\n\nTrong thập niên 80, các sản phẩm điện tử của Casio đạt được tiếng tăm rộng lớn. Đồng thời công ty cũng là một trong những nhà sản xuất đầu tiên loại đồng hồ dùng tinh thể thạch anh và trỏ nên nổi tiếng với nhiều chủng loại đồng hồ điện tử đeo tay, gồm có cả loại có tích hợp máy tính đơn giản, loại có thể hiện nhiều múi giờ, loại có tích hợp nhiệt kế, áp kế, cao độ...\nĐặc biệt nổi tiếng là sản phẩm kết hợp hai chức năng: hiển thị bằng màn hình LCD và màn hình đồng hồ bình thường, một số trong đó có thể nhận tín hiệu vô tuyến của đồng hồ nguyên tử hàng ngày để chỉnh giờ chính xác, gọi là Wave ceptor.'),('5','Thiên Long','Thiên Long','uploads/Thiên long.JPG','Thiên Long được đánh giá là doanh nghiệp số 1 của Việt Nam trong lĩnh vực sản xuất bút viết và các loại văn phòng phẩm khác. Danh mục sản phẩm của Thiên Long bao gồm: Bút viết như bút bi, bút gel, bút butter gel, bút lông kim, bút máy; Dụng cụ văn phòng như bút lông bảng, bút lông dầu, bút dạ quang, bút xóa, kim bấm, bấm kim, máy tính, giấy văn phòng, mực in, file bìa hồ sơ các lại; Dụng cụ học sinh như bút chì, thước, gôm tẩy, bảng học sinh, hồ dán, tập học sinh; Dụng cụ mỹ thuật như bút lông tô màu, sáp màu, sáp dầu, màu nước, bút chì màu, poster colors.\nThương hiệu Thiên Long được bình chọn là “Thương hiệu Nổi tiếng” và là một trong nhóm 100 thương hiệu mạnh nhất Việt Nam do Bộ Công Thương thực hiện. Được người tiêu dùng bình chọn 18 năm liền (từ năm 1997 đến 2014) là Doanh nghiệp hàng Việt Nam chất lượng cao, trong đó được bình chọn là vị trí số 1 trong ngành Văn phòng phẩm trong 18 năm liền (từ năm 1998 đến 2014) do Báo Sài GònTiếp Thị thực hiện.'),('6','Văn phòng phẩm Hồng Hà','Hồng Hà','uploads/hongha.jpg','Toạ lạc tại một vị trí tuyệt đẹp giữa trung tâm Thủ đô, số 25 phố Lý Thường Kiệt, quận Hoàn Kiếm, Hà Nội. Nơi trước kia là một xưởng sửa chữa xe hơi của Pháp mang tên Stai. Với sự giúp đỡ của Trung Quốc, Nhà máy văn phòng phẩm Hồng Hà, nhà máy sản xuất đồ dùng văn phòng đầu tiên của nước Việt Nam Dân Chủ Cộng Hoà, đã chính thức cắt băng khánh thành vào ngày 1/10/1959.'),('7','Giấy bãi bằng','Bãi Bắng','uploads/bãi bằng.jpg','Bãi Bằng là một doanh nghiệp nhà nước sản xuất bột giấy và các sản phẩm giấy của Việt Nam. Năm 2006, Công ty Giấy Bãi Bằng trở thành một thành viên của Tổng công ty Giấy Việt Nam, đóng góp hơn 50% sản lượng giấy in và giấy viết của tổng công ty này.\nNhà máy Giấy Bãi Bằng được thành lập vào cuối năm 1982 với sự giúp đỡ về tài chính và công nghệ của chính phủ Thụy Điển. Ban đầu, Bãi Bằng chỉ gồm một nhà máy sản xuất giấy.\nNăm 2002, nhà máy được mở rộng, nâng công suất từ 48.000 tấn bột, 55.000 tấn giấy lên 61.000 tấn bột và 100.000 tấn giấy.\nNăm 2004, 16 lâm trường cung cấp nguyên liệu làm bột giấy vốn trước kia thuộc Công ty Nguyên liệu giấy Vĩnh Phú được sáp nhập vào Bãi Bằng. Công ty còn sản xuất cả phân bón vi sinh từ phế thải của quá trình sản xuất giấy.\nCơ sở sản xuất và văn phòng chính của công ty tọa lạc tại thị trấn Phong Châu, huyện Phù Ninh, tỉnh Phú Thọ.'),('8','Giấy Paper One','Paperone','uploads/Paper one.jpg','PAPERONE là một thương hiệu giấy Văn phòng hàng đầu tại Việt Nam.Với chất lượng tuyệt hảo cùng các ưu điểm nổi trội của mình, PAPERONE thực sự là sản phẩm giấy văn phòng được đông đảo người tiêu dùng và khách hàng trong cả nước ưa chuộng.\nQuý khách hàng và người tiêu dùng có thể dễ dàng mua sản phẩm PAPERONE tại các đại lý phân phối tại địa phương cũng như các cửa hàng văn phòng phẩm, nhà sách, hệ thống Metro… Ngoài ra, Quý khách hàng có thể liên hệ trực tiếp với chúng tôi để được tư vấn về sản phẩm PAPERONE để có sự lựa chọn tốt nhất!\n\nTrải qua hơn 12 năm phát triển, chúng tôi đã khẳng định được uy tín và vị thế vững mạnh tại thị trường Việt Nam với mạng lưới phân phối mạnh va rộng khắp bao gồm hàng ngàn đại lý trên toàn quốc. Chúng tôi luôn cam kết cung cấp cho Qúy Khách Hàng những sản phẩm chất lượng cao cấp, dịch vụ bán hàng tốt nhất và giá cả hợp lý nhất.\nChúng tôi tin tưởng rằng với sự hợp tác chặt chẽ, hiệu quả với các tập đoàn hàng đầu thế giới cùng đội ngũ nhân viên năng động, nhiệt tình, tiềm lực tài chính vững mạnh cũng như kinh nghiệm phát triển thành công nhiều thương hiệu nổi tiếng trên thị trường Việt Nam với doanh số lên đến hàng ngàn tỷ đồng, chúng tôi sẽ đáp ứng một cách tốt nhất nhu cầu của Quý Khách Hàng!'),('9','Giấy Double A','Double A','uploads/Double a.jpg','Ngay từ đầu, khi Double A đi tiên phong trong việc nghiên cứu và phát triển của các loài cây thích hợp cho ngành công nghiệp năng lượng cao, công ty đã cống hiến tất cả những nguồn lực đáng kể cho sự phát triển của việc sản xuất giấy và bột giấy thân thiện với môi trường thông qua chương trình “Giấy từ Cây Nông nghiệp”, cung cấp nguồn năng lượng nhiên liệu sinh học tái tạo trong quá trình làm sạch chất thải rắn của công ty chúng tôi, dùng để tạo ra điện và hơi nước để đáp ứng nhu cầu ngày càng cao của đất nước – một cách bền vững.');
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProvinceDistrict`
--

DROP TABLE IF EXISTS `ProvinceDistrict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProvinceDistrict` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ParentId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProvinceDistrict`
--

LOCK TABLES `ProvinceDistrict` WRITE;
/*!40000 ALTER TABLE `ProvinceDistrict` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProvinceDistrict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ShipInfo`
--

DROP TABLE IF EXISTS `ShipInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ShipInfo` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `ProvinceId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `DistrictId` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ShipInfo`
--

LOCK TABLES `ShipInfo` WRITE;
/*!40000 ALTER TABLE `ShipInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `ShipInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `Id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(250) CHARACTER SET utf8mb4 NOT NULL,
  `CreateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('2','Quang hợp 111','hopdq1102@gmail.com','e10adc3949ba59abbe56e057f20f883e','2015-09-23 12:02:26');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Ecom'
--
/*!50003 DROP PROCEDURE IF EXISTS `productAttributes_Get4ProductManager` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productAttributes_Get4ProductManager`(in productId varchar(20))
BEGIN
	select
	av.Id,
	av.AttributeId,
	av.Value,
	case when ifnull(a.ProductId, '0') != '0' then true else false end as Checked 
	from AttributeValue av
	inner join Attributes att on av.AttributeId = att.Id
	left join 
	( 
		select pa.ProductId, pa.AttributeValueId from ProductAttrValue pa
		where pa.ProductId = productId
	) a on av.Id = a.AttributeValueId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productAttributeValue_InsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productAttributeValue_InsertUpdate`(in productId varchar(20), in attrIdList varchar(1000))
BEGIN
	declare Cnt int;
	declare maxCnt int;
	DROP temporary TABLE IF EXISTS TmpTable;
	CREATE TEMPORARY TABLE TmpTable (
		attrbuteValueId varchar(20)
	);
	set Cnt = 1;
	set maxCnt = (length(attrIdList) - length(replace(attrIdList, ',', ''))) + 1;
	while Cnt <= maxCnt do
		insert into TmpTable
		select 
			SUBSTRING_INDEX(SUBSTRING_INDEX(attrIdList, ',', Cnt), ',', -1);
		set Cnt = Cnt + 1;
	END WHILE;
	delete from ProductAttrValue
	where ProductId = productId and AttributeValueId not in (
		select attrbuteValueId from TmpTable
	);
	insert into ProductAttrValue
	select productId, tt.attrbuteValueId from TmpTable tt
	left join 
	(
		select av.AttributeValueId from ProductAttrValue av where av.ProductId = productId
	) A on tt.attrbuteValueId = A.AttributeValueId
	where A.AttributeValueId is null;
	drop temporary table TmpTable;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `productImage_InsertUpdate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `productImage_InsertUpdate`(in productId varchar(20), in imageIds varchar(1000), in imgDefaultId varchar(20))
BEGIN
	declare Cnt int;
	declare maxCnt int;
	DROP temporary TABLE IF EXISTS TmpTable;
	CREATE TEMPORARY TABLE TmpTable (
		imgId varchar(20)
	);
	set Cnt = 1;
	set maxCnt = (length(imageIds) - length(replace(imageIds, ',', ''))) + 1;
	while Cnt <= maxCnt do
		insert into TmpTable
		select 
			SUBSTRING_INDEX(SUBSTRING_INDEX(imageIds, ',', Cnt), ',', -1);
		set Cnt = Cnt + 1;
	END WHILE;
	delete from ProductImage
	where ProductId = @productId and ImageId not in (
		select imgId from TmpTable
	);
	insert into ProductImage(ProductId, ImageId, IsDefault)
	select productId, tt.imgId, 0 from TmpTable tt
	left join ProductImage pi on tt.imgId = pi.ImageId and pi.ProductId = @productId
	where pi.ImageId is null;
	update ProductImage set IsDefault = 0 where ProductId = @productId;
	update ProductImage set IsDefault = 1
	where ProductId = @productId and ImageId = @imgDefaultId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Product_GetAll_Paging` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Product_GetAll_Paging`(in keyword varchar(250), in cateId varchar(20), in status varchar(20), in pageNumber int, in pageSize int)
BEGIN
set keyword = lower(keyword);
set @totalRow = (select count(*) from Product p
inner join Category c on p.CategoryId = c.Id
where 
	(ifnull(keyword, '') = '' or lower(p.`Code`) = keyword or lower(p.`Name`) like concat('%',keyword,'%'))
and (ifnull(cateId, '') = '' or p.CategoryId = cateId)
and (ifnull(`status`, '') = '' or p.`Status` = `status`));
set @totalPage = ceiling(cast(@totalRow as decimal)/ pageSize);
set @row_count = 0;
select * from
(
	select
		(@row_count := @row_count + 1) as RowNumber,
		p.Id,
		p.`Code`,
		p.`Name`,
		p.CategoryId,
		c.`Name` as CategoryName,
		p.Price,
		p.PromotionValue,
		p.IsPercentPromotion,
		p.CreateDate,
		u.`Name` as UserCreate,
		p.UpdateDate,
		p.`Status`,
		i.`Name` as UserUpdate,
		@totalPage as TotalPage
	from Product p
	inner join Category c on p.CategoryId = c.Id
	left join User u on p.CreateUser = u.Id
	left join User i on p.UpdateUser = i.Id
	where 
		(ifnull(keyword, '') = '' or lower(p.`Code`) = keyword or lower(p.`Name`) like concat('%',keyword,'%'))
	and (ifnull(cateId, '') = '' or p.CategoryId = cateId)
	and (ifnull(`status`, '') = '' or p.`Status` = `status`)
	order by p.UpdateDate desc, p.CreateDate desc
) A where A.RowNumber > (pageNumber - 1) * pageSize and A.RowNumber <= pageNumber * pageSize
order by A.RowNumber;
END ;;
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

-- Dump completed on 2015-10-29 23:20:32
