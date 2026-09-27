CREATE DATABASE  IF NOT EXISTS `db_112408009` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_112408009`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_112408009
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1

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
-- Table structure for table `tbl_Credential`
--

DROP TABLE IF EXISTS `tbl_Credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Credential` (
  `credential_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `salt` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`credential_id`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `credential_id_UNIQUE` (`credential_id`),
  CONSTRAINT `email_fk` FOREIGN KEY (`email`) REFERENCES `tbl_Employee` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Credential`
--

LOCK TABLES `tbl_Credential` WRITE;
/*!40000 ALTER TABLE `tbl_Credential` DISABLE KEYS */;
INSERT INTO `tbl_Credential` VALUES (1,'Amy5613@gmail.com','789','123'),(2,'Josh923@outlook.com','7FD46E7ABFA88C8AC4A7A8630B363E52A222B0320671D2241D64047402CD6111','d98dbaa77e1560f692a69bcb6edb52321901d2745796afa76703b3a3257a42cb'),(3,'Irene7598@hotmail.com','7FD46E7ABFA88C8AC4A7A8630B363E52A222B0320671D2241D64047402CD6111','0969578e4b73f41accef304c291febe861eb6db151c0b578e92bb83201a18d55'),(4,'Amber2032@gmail.com','90A59FA8ECD9D39DB07F289EB7652736B52730BBBF97524674436AC33760A2EE','c341bb2c910f60f1415ac3c39487872b87d25874de8c0841c40f6709cd1b4090'),(9,'2','1','1');
/*!40000 ALTER TABLE `tbl_Credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Employee`
--

DROP TABLE IF EXISTS `tbl_Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `phone` varchar(9) NOT NULL,
  `report_to` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Employee`
--

LOCK TABLES `tbl_Employee` WRITE;
/*!40000 ALTER TABLE `tbl_Employee` DISABLE KEYS */;
INSERT INTO `tbl_Employee` VALUES (1,'Amy','Amy5613@gmail.com','Address 1','Managing Director','972900384',NULL),(2,'Josh','Josh923@outlook.com','Address 2','Manager','932808498',1),(3,'Irene','Irene7598@hotmail.com','Address 3','Staff','943583056',2),(4,'Amber','Amber2032@gmail.com','Address 4','Staff','926015800',5),(9,'1','2','1','1','1',NULL);
/*!40000 ALTER TABLE `tbl_Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Material`
--

DROP TABLE IF EXISTS `tbl_Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Material` (
  `material_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `material_name` varchar(100) NOT NULL,
  `reorder_level` int NOT NULL,
  `material_created_at` datetime NOT NULL,
  `material_updated_at` datetime NOT NULL,
  PRIMARY KEY (`material_id`),
  UNIQUE KEY `material_id_UNIQUE` (`material_id`),
  KEY `supplier_pk_idx` (`supplier_id`),
  CONSTRAINT `supplier_pk` FOREIGN KEY (`supplier_id`) REFERENCES `tbl_Supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Material`
--

LOCK TABLES `tbl_Material` WRITE;
/*!40000 ALTER TABLE `tbl_Material` DISABLE KEYS */;
INSERT INTO `tbl_Material` VALUES (1,2,90.40,'銅基板 PCB',1,'2023-10-13 13:15:29','2024-01-05 10:52:00'),(2,1,33.00,'智慧溫感器',1,'2024-02-25 09:48:13','2024-02-28 15:35:00'),(3,2,43.20,'鋁合金外殼',-10,'2023-05-31 15:59:53','2023-12-09 12:24:00'),(4,2,35.00,'工業級電容',11,'2023-05-09 14:56:33','2023-10-14 11:28:00'),(5,2,93.00,'RFID 讀取模組',24,'2023-05-17 11:12:46','2023-10-13 17:56:00'),(6,1,280.00,'低功耗IoT專用晶圓',50,'2023-06-01 09:55:23','2023-12-15 09:58:00'),(7,3,165.00,'環境光感測鏡頭模組',60,'2023-07-19 10:26:56','2023-11-30 15:47:00'),(8,1,230.00,'先進封裝微控制器',40,'2023-09-12 16:18:22','2024-01-02 11:33:00'),(9,3,190.00,'紅外線影像感測模組',55,'2023-10-05 14:15:47','2024-02-18 14:20:00');
/*!40000 ALTER TABLE `tbl_Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Procurement_Order`
--

DROP TABLE IF EXISTS `tbl_Procurement_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Procurement_Order` (
  `procurement_order_id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `status` int NOT NULL,
  `order_created_at` datetime NOT NULL,
  PRIMARY KEY (`procurement_order_id`),
  UNIQUE KEY `procurement_order_id_UNIQUE` (`procurement_order_id`),
  KEY `supplier_pk_idx` (`supplier_id`),
  KEY `employee_pk_idx` (`employee_id`),
  CONSTRAINT `employee_id_pk` FOREIGN KEY (`employee_id`) REFERENCES `tbl_Employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `supplier_id_pk` FOREIGN KEY (`supplier_id`) REFERENCES `tbl_Supplier` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Procurement_Order`
--

LOCK TABLES `tbl_Procurement_Order` WRITE;
/*!40000 ALTER TABLE `tbl_Procurement_Order` DISABLE KEYS */;
INSERT INTO `tbl_Procurement_Order` VALUES (1,2,1,3,'2023-10-31 16:26:59'),(2,3,2,3,'2024-02-28 14:08:03'),(3,3,1,3,'2023-07-17 09:42:06'),(4,1,2,3,'2023-09-11 12:13:19'),(5,2,1,3,'2023-08-18 14:55:20'),(6,1,4,0,'2023-11-02 11:58:36'),(7,3,3,1,'2024-05-27 13:36:36'),(8,1,2,0,'2023-06-30 10:24:29'),(9,2,1,3,'2023-05-22 08:30:02'),(10,2,1,2,'2023-05-25 10:45:49'),(11,2,4,0,'2023-02-27 15:23:24'),(12,1,3,3,'2023-03-19 15:40:20'),(13,3,2,3,'2023-01-05 13:45:26'),(17,2,1,1,'2025-06-10 12:00:00'),(18,2,1,1,'2025-06-10 12:00:00'),(19,1,1,1,'2025-06-11 13:57:32'),(20,1,1,1,'2025-06-11 13:58:20'),(21,1,1,1,'2025-06-12 01:24:25'),(22,1,1,1,'2025-06-12 11:47:55');
/*!40000 ALTER TABLE `tbl_Procurement_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Procurement_Order_Detail`
--

DROP TABLE IF EXISTS `tbl_Procurement_Order_Detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Procurement_Order_Detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `material_id` int NOT NULL,
  `procurement_order_id` int NOT NULL,
  `purchase_volume` int NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`,`procurement_order_id`),
  UNIQUE KEY `order_detail_id_UNIQUE` (`order_detail_id`),
  KEY `material_pk_idx` (`material_id`),
  KEY `procurement_order_pk_idx` (`procurement_order_id`),
  CONSTRAINT `material_id_pk` FOREIGN KEY (`material_id`) REFERENCES `tbl_Material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `procurement_order_pk` FOREIGN KEY (`procurement_order_id`) REFERENCES `tbl_Procurement_Order` (`procurement_order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Procurement_Order_Detail`
--

LOCK TABLES `tbl_Procurement_Order_Detail` WRITE;
/*!40000 ALTER TABLE `tbl_Procurement_Order_Detail` DISABLE KEYS */;
INSERT INTO `tbl_Procurement_Order_Detail` VALUES (1,4,1,14,35.00),(2,4,5,11,35.00),(3,7,3,9,165.00),(4,3,5,43,43.20),(5,9,3,27,190.00),(6,8,4,36,230.00),(7,1,1,1,90.40),(8,1,5,22,90.40),(9,2,4,14,33.00),(10,6,4,38,280.00),(11,6,6,25,280.00),(12,8,6,12,230.00),(13,7,7,30,165.00),(14,8,8,17,230.00),(15,1,9,20,90.40),(16,3,9,10,43.20),(17,5,9,35,93.00),(18,3,10,28,43.20),(19,4,11,15,35.00),(20,5,11,22,93.00),(21,6,12,18,280.00),(22,2,12,31,33.00),(23,9,13,8,190.00),(24,7,2,5,165.00),(28,3,17,50,43.20),(29,3,18,50,43.20),(30,1,19,1,90.40),(31,1,20,1,90.40),(32,1,21,1,90.40),(33,1,22,1,90.40);
/*!40000 ALTER TABLE `tbl_Procurement_Order_Detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Product`
--

DROP TABLE IF EXISTS `tbl_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Product`
--

LOCK TABLES `tbl_Product` WRITE;
/*!40000 ALTER TABLE `tbl_Product` DISABLE KEYS */;
INSERT INTO `tbl_Product` VALUES (1,'智慧電機規格表','包含電機功率、轉速、電壓等技術參數'),(2,'溫度感測器技術文件','支援 I2C & SPI，測量範圍 -40°C ~ 125°C'),(3,'高頻電路板規格','適用於 5G 通訊設備，低延遲高穩定性'),(4,'智能倉儲 RFID 配置表','詳細列出 RFID 標籤讀取距離與數據傳輸速率'),(5,'倉儲安防監控標籤','智慧倉儲防盜標籤'),(6,'test','test');
/*!40000 ALTER TABLE `tbl_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Product_Order`
--

DROP TABLE IF EXISTS `tbl_Product_Order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Product_Order` (
  `product_order_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `order_created_at` datetime NOT NULL,
  `product_quantity` int NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`product_order_id`),
  UNIQUE KEY `product_order_id_UNIQUE` (`product_order_id`),
  KEY `employee_fk_idx` (`employee_id`),
  KEY `product_fk_idx` (`product_id`),
  CONSTRAINT `employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `tbl_Employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_fk` FOREIGN KEY (`product_id`) REFERENCES `tbl_Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Product_Order`
--

LOCK TABLES `tbl_Product_Order` WRITE;
/*!40000 ALTER TABLE `tbl_Product_Order` DISABLE KEYS */;
INSERT INTO `tbl_Product_Order` VALUES (1,3,4,'2023-08-07 09:22:00',10,'alex.chen@gmail.com',3),(2,4,3,'2022-04-14 16:10:00',5,'ivy.wang@yahoo.com',3),(3,1,3,'2022-11-15 15:23:50',3,'tony.liu@outlook.com',2),(4,5,1,'2022-11-24 13:58:00',4,'rachel.hsu@icloud.com',1),(5,1,2,'2023-07-24 09:54:00',2,'kevin.lin@gmail.com',0),(8,1,1,'2025-06-11 14:00:42',1,NULL,1),(9,1,1,'2025-06-11 14:03:23',1,NULL,1),(10,2,1,'2025-06-11 15:40:40',1,NULL,1);
/*!40000 ALTER TABLE `tbl_Product_Order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Product_m2m_Material`
--

DROP TABLE IF EXISTS `tbl_Product_m2m_Material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Product_m2m_Material` (
  `product_id` int NOT NULL,
  `material_id` int NOT NULL,
  `material_quantity` int NOT NULL,
  PRIMARY KEY (`product_id`,`material_id`),
  KEY `fk_tbl_material_material_id_idx` (`material_id`),
  CONSTRAINT `fk_tbl_material_material_id` FOREIGN KEY (`material_id`) REFERENCES `tbl_Material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tbl_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `tbl_Product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Product_m2m_Material`
--

LOCK TABLES `tbl_Product_m2m_Material` WRITE;
/*!40000 ALTER TABLE `tbl_Product_m2m_Material` DISABLE KEYS */;
INSERT INTO `tbl_Product_m2m_Material` VALUES (1,3,3),(1,4,5),(2,1,2),(2,2,1),(2,3,1),(3,1,2),(3,3,2),(3,4,3),(3,5,2),(4,3,5),(4,4,4),(4,5,2),(5,5,1),(5,8,1),(5,9,1);
/*!40000 ALTER TABLE `tbl_Product_m2m_Material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Supplier`
--

DROP TABLE IF EXISTS `tbl_Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Supplier` (
  `supplier_id` int NOT NULL AUTO_INCREMENT,
  `supplier_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `supplier_id_UNIQUE` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Supplier`
--

LOCK TABLES `tbl_Supplier` WRITE;
/*!40000 ALTER TABLE `tbl_Supplier` DISABLE KEYS */;
INSERT INTO `tbl_Supplier` VALUES (1,'台矽電','mullally9914@gmail.com','提供高品質半導體材料，專注於微電子製造'),(2,'聯發料','andy4367@icloud.com','生產高效能工業用晶片與智慧製造設備'),(3,'大立光能','katie586@hotmail.com','提供高精度光學元件，適用於監控與自動化');
/*!40000 ALTER TABLE `tbl_Supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_112408009'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_CheckInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_CheckInventory`(
    IN in_product_order_id INT
)
BEGIN
    DECLARE v_product_id INT;
    DECLARE v_product_quantity INT;
    DECLARE v_count INT;

    
    CREATE TEMPORARY TABLE IF NOT EXISTS tmp_inventory_result (
        product_order_id INT,
        material_id INT,
        material_name VARCHAR(100),
        overall_quantity INT,
        reorder_level INT
    );

    
    SELECT product_id, product_quantity
    INTO v_product_id, v_product_quantity
    FROM tbl_Product_Order
    WHERE product_order_id = in_product_order_id;

    
    INSERT INTO tmp_inventory_result
    SELECT 
        in_product_order_id AS product_order_id,
        m.material_id,
        m.material_name,
        (
            IFNULL((
                SELECT SUM(pod.purchase_volume)
                FROM tbl_Procurement_Order_Detail pod
                JOIN tbl_Procurement_Order po ON pod.procurement_order_id = po.procurement_order_id
                WHERE pod.material_id = m.material_id AND po.status = 3
            ), 0)
            -
            IFNULL((
                SELECT SUM(po2.product_quantity * pm.material_quantity)
                FROM tbl_Product_Order po2
                JOIN tbl_Product_m2m_Material pm ON po2.product_id = pm.product_id
                WHERE po2.status IN (1,2,3) AND pm.material_id = m.material_id
            ), 0)
        ) AS overall_quantity,
        m.reorder_level
    FROM tbl_Product_m2m_Material pm
    JOIN tbl_Material m ON pm.material_id = m.material_id
    WHERE pm.product_id = v_product_id
    HAVING overall_quantity < reorder_level;

    
    SELECT COUNT(*) INTO v_count FROM tmp_inventory_result;

    IF v_count = 0 THEN
        SELECT ' ' as '該商品的零件庫存充足';
    ELSE
        SELECT * FROM tmp_inventory_result;
    END IF;

    DROP TEMPORARY TABLE IF EXISTS tmp_inventory_result;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ComputeInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_ComputeInventory`(
    IN in_material_id INT
)
BEGIN
    DECLARE in_name VARCHAR(100);
    DECLARE in_stock INT DEFAULT 0;
    DECLARE out_usage INT DEFAULT 0;

    
    SELECT material_name INTO in_name
    FROM tbl_Material
    WHERE material_id = in_material_id;

    
    SELECT IFNULL(SUM(pod.purchase_volume), 0)
    INTO in_stock
    FROM tbl_Procurement_Order po
    JOIN tbl_Procurement_Order_Detail pod ON po.procurement_order_id = pod.procurement_order_id
    WHERE pod.material_id = in_material_id
    AND po.status = 3;


    SELECT IFNULL(SUM(pom.material_quantity * po.product_quantity), 0)
    INTO out_usage
    FROM tbl_Product_Order po
    JOIN tbl_Product_m2m_Material pom ON po.product_id = pom.product_id
    WHERE pom.material_id = in_material_id
      AND po.status IN (1 , 2, 3);

    
    SELECT 
        in_material_id AS material_id,
        in_name AS material_name,
        in_stock - out_usage AS overall_quantity;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ConfirmSupervisor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_ConfirmSupervisor`(
    IN in_employee_id INT
)
BEGIN
    DECLARE v_current_id INT;
    DECLARE v_level INT DEFAULT 0;
    DECLARE v_manager_id INT;
    DECLARE done INT DEFAULT FALSE;

    
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_supervisors (
        employee_id INT,
        position VARCHAR(100),
        name VARCHAR(100)
    );

    SET v_current_id = in_employee_id;

    supervisor_loop: LOOP
        
        SELECT report_to INTO v_manager_id
        FROM tbl_Employee
        WHERE employee_id = v_current_id;

        
        IF v_manager_id IS NULL OR v_level >= 3 THEN
            LEAVE supervisor_loop;
        END IF;

        
        INSERT INTO temp_supervisors (employee_id, position, name)
        SELECT employee_id, position, name
        FROM tbl_Employee
        WHERE employee_id = v_manager_id;

        
        SET v_current_id = v_manager_id;
        SET v_level = v_level + 1;
    END LOOP;

    
    SELECT * FROM temp_supervisors ORDER BY employee_id;

    
    DROP TEMPORARY TABLE IF EXISTS temp_supervisors;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProcurementOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_CreateProcurementOrder`(
    IN in_supplier_id INT,
    IN in_employee_id  INT,
    IN in_purchase_volume INT,
    IN in_material_id  INT
    
)
BEGIN
	DECLARE affected_row_num INT;
    DECLARE v_order_id INT;
    DECLARE v_unit_price DECIMAL(10,2);

    START TRANSACTION;

    
    INSERT INTO tbl_Procurement_Order (
        supplier_id,
        employee_id,
        status,
        order_created_at
    ) VALUES (
        in_supplier_id,
        in_employee_id,
        1,
        NOW()
    );

    
    SET affected_row_num = ROW_COUNT();

    
    SET v_order_id = LAST_INSERT_ID();

    
    SELECT unit_price
    INTO v_unit_price
    FROM tbl_Material
    WHERE material_id = in_material_id;

    
    INSERT INTO tbl_Procurement_Order_Detail (
        material_id,
        procurement_order_id,
        purchase_volume,
        unit_price
    ) VALUES (
        in_material_id,
        v_order_id,
        in_purchase_volume,
        v_unit_price
    );

    COMMIT;
    
    SELECT affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_CreateProductOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_CreateProductOrder`(
    IN in_product_id INT,
    IN in_product_quantity INT,
    IN in_employee_id INT
)
BEGIN
    DECLARE affected_row_num INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        
        SET affected_row_num = 0;
        ROLLBACK;
    END;

    START TRANSACTION;

    INSERT INTO tbl_Product_Order (
        product_id,
        employee_id,
        order_created_at,
        product_quantity,
        status
    )
    VALUES (
        in_product_id,
        in_employee_id,
        NOW(),
        in_product_quantity,
        1
    );

    SET affected_row_num = ROW_COUNT();

    COMMIT;
    
    SELECT affected_row_num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_DeleteEmployee`(
    IN in_employee_id INT
)
BEGIN
    DECLARE v_manager_id INT;
    DECLARE v_name VARCHAR(100);
    DECLARE v_email VARCHAR(100);
    DECLARE v_employee_exists INT DEFAULT 0;

    -- 檢查是否存在
    SELECT COUNT(*) INTO v_employee_exists
    FROM tbl_Employee
    WHERE employee_id = in_employee_id;

    IF v_employee_exists = 0 THEN
        SELECT 2 AS status_code, in_employee_id AS employee_id, '查無此員工' AS name;
    ELSE
        -- 取得該員工資料
        SELECT report_to, name, email
        INTO v_manager_id, v_name, v_email
        FROM tbl_Employee
        WHERE employee_id = in_employee_id;

        IF v_manager_id IS NULL THEN
            SELECT 2 AS status_code, in_employee_id AS employee_id, CONCAT(v_name, ' 無上級主管，無法刪除') AS name;
        ELSE
            -- 第 1 段交易：轉移下游資料
            BEGIN
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                BEGIN
                    ROLLBACK;
                    SELECT 2 AS status_code, in_employee_id AS employee_id, '轉移訂單或下屬失敗' AS name;
                END;

                START TRANSACTION;

                UPDATE tbl_Procurement_Order
                SET employee_id = v_manager_id
                WHERE employee_id = in_employee_id;

                UPDATE tbl_Product_Order
                SET employee_id = v_manager_id
                WHERE employee_id = in_employee_id;

                UPDATE tbl_Employee
                SET report_to = v_manager_id
                WHERE report_to = in_employee_id;

                COMMIT;
            END;

            -- 第 2 段交易：刪除 Credential 
            BEGIN
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                BEGIN
                    ROLLBACK;
                    SELECT 2 AS status_code, in_employee_id AS employee_id, '刪除 Credential 失敗' AS name;
                END;

                START TRANSACTION;

                DELETE FROM tbl_Credential
                WHERE email = v_email;

                COMMIT;
            END;

            -- 第 3 段交易：刪除員工
            BEGIN
                DECLARE EXIT HANDLER FOR SQLEXCEPTION
                BEGIN
                    ROLLBACK;
                    SELECT 2 AS status_code, in_employee_id AS employee_id, '刪除員工失敗' AS name;
                END;

                START TRANSACTION;

                DELETE FROM tbl_Employee
                WHERE employee_id = in_employee_id;

                COMMIT;
            END;

            -- 成功
            SELECT 1 AS status_code, in_employee_id AS employee_id, v_name AS name;
        END IF;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetRecentOrdersBySupplier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_GetRecentOrdersBySupplier`(
    IN in_supplier_id INT,
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    SELECT 
        po.supplier_id,
        po.procurement_order_id,
        po.employee_id,
        po.status,
        po.order_created_at,
        ROUND(SUM(pod.purchase_volume * pod.unit_price), 4) AS total_order_price
    FROM 
        tbl_Procurement_Order po
    JOIN 
        tbl_Procurement_Order_Detail pod 
        ON po.procurement_order_id = pod.procurement_order_id
    WHERE 
        po.supplier_id = in_supplier_id
        AND po.order_created_at BETWEEN in_start_date AND in_end_date
        AND po.status = 3
    GROUP BY 
        po.procurement_order_id
    ORDER BY 
        po.order_created_at;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetSupplierPerformanceReport` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_GetSupplierPerformanceReport`(
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    SELECT 
        s.supplier_id,
        s.supplier_name,
        COUNT(po.procurement_order_id) AS total_orders,
        ROUND(
            SUM(CASE WHEN po.status = 3 THEN 1 ELSE 0 END) / 
            NULLIF(SUM(CASE WHEN po.status IN (0,3) THEN 1 ELSE 0 END), 0) * 100,
            2
        ) AS `complete_rate(%)`
    FROM tbl_Procurement_Order po
    JOIN tbl_Supplier s ON po.supplier_id = s.supplier_id
    WHERE po.order_created_at BETWEEN in_start_date AND in_end_date
    GROUP BY s.supplier_id, s.supplier_name
    ORDER BY 4 ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetUnreceivedOrders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_GetUnreceivedOrders`(
    IN in_start_date DATETIME,
    IN in_end_date DATETIME
)
BEGIN
    SELECT 
        po.procurement_order_id,
        po.supplier_id,
        s.supplier_name,
        pod.material_id,
        m.material_name,
        CASE 
            WHEN po.status = 3 THEN 0
            ELSE pod.purchase_volume
        END AS unreceived_amount,
        po.order_created_at,
        CASE 
            WHEN po.status = 3 THEN 1
            WHEN po.status IN (1, 2) THEN 2
            ELSE NULL
        END AS delivery_status
    FROM tbl_Procurement_Order po
    JOIN tbl_Procurement_Order_Detail pod ON po.procurement_order_id = pod.procurement_order_id
    JOIN tbl_Supplier s ON po.supplier_id = s.supplier_id
    JOIN tbl_Material m ON pod.material_id = m.material_id
    WHERE po.order_created_at BETWEEN in_start_date AND in_end_date
    AND po.status IN (1,2,3)
    ORDER BY unreceived_amount DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_Login`(
    IN in_email VARCHAR(100),
    IN in_hashPwd CHAR(64)
    
)
BEGIN
	DECLARE status_code INT;
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_password CHAR(64);

    
    SELECT COUNT(*) INTO v_count
    FROM tbl_Credential
    WHERE email = in_email;

    IF v_count = 0 THEN
        
        SET status_code = 3;
    ELSE
        
        SELECT c.password INTO v_password
        FROM tbl_Credential c
		WHERE c.email = in_email;

        IF v_password = in_hashPwd THEN
            
            SET status_code = 1;
        ELSE
            
            SET status_code = 2;
        END IF;
    END IF;
    
    SELECT status_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterEmployee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_RegisterEmployee`(
    IN in_email VARCHAR(100),
    IN in_hashedPwd CHAR(64),
    IN in_salt CHAR(64),
    IN in_name VARCHAR(100),
    IN in_address VARCHAR(100),
    IN in_phone VARCHAR(9),
    IN in_position VARCHAR(100)
)
BEGIN
    DECLARE status_code INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET status_code = 3;
        SELECT status_code;
    END;

    START TRANSACTION;

    IF EXISTS (SELECT 1 FROM tbl_Employee WHERE email = in_email) THEN
        SET status_code = 2;
        ROLLBACK;
    ELSE
        INSERT INTO tbl_Employee (email, name, address, phone, position)
        VALUES (in_email, in_name, in_address, in_phone, in_position);

        INSERT INTO tbl_Credential (email, salt,password)
        VALUES (in_email, in_salt,in_hashedPwd);

        COMMIT;
        SET status_code = 1;
    END IF;

    SELECT status_code;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateOrderStatus` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_UpdateOrderStatus`(
    IN in_order_id INT,
    IN in_status INT,
    IN in_order_type VARCHAR(20)
)
BEGIN
    DECLARE current_status INT;
    DECLARE affected_row_num INT DEFAULT 0;

    
    IF in_order_type = 'procurement' THEN
        SELECT status INTO current_status
        FROM tbl_Procurement_Order
        WHERE procurement_order_id = in_order_id;

        
        IF (current_status IS NOT NULL AND (
                (current_status = 1 AND (in_status = 2 OR in_status = 0)) OR
                (current_status = 2 AND (in_status = 3 OR in_status = 0)) OR
                (current_status = 1 AND in_status = 0) OR
                (current_status = 2 AND in_status = 0)
            )) THEN

            UPDATE tbl_Procurement_Order
            SET status = in_status
            WHERE procurement_order_id = in_order_id;

            SET affected_row_num = ROW_COUNT();
        END IF;

    ELSEIF in_order_type = 'product' THEN
        SELECT status INTO current_status
        FROM tbl_Product_Order
        WHERE product_order_id = in_order_id;

        IF (current_status IS NOT NULL AND (
                (current_status = 1 AND (in_status = 2 OR in_status = 0)) OR
                (current_status = 2 AND (in_status = 3 OR in_status = 0)) OR
                (current_status = 1 AND in_status = 0) OR
                (current_status = 2 AND in_status = 0)
            )) THEN

            UPDATE tbl_Product_Order
            SET status = in_status
            WHERE product_order_id = in_order_id;

            SET affected_row_num = ROW_COUNT();
        END IF;

    END IF;

    
    SELECT affected_row_num AS affected_row_num;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdatePwd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`112408009`@`%` PROCEDURE `sp_UpdatePwd`(
    IN in_email VARCHAR(100),
    IN in_original_hashPwd CHAR(64),
    IN in_hashedPwd CHAR(64),
    IN in_salt CHAR(64)
    
)
BEGIN
	DECLARE status_code INT ;
    DECLARE v_cred_id INT;
    DECLARE v_current_hashPwd CHAR(64);
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET status_code = 3; 
    END;

    
    SET status_code = 3;

    
    SELECT c.credential_id, c.password
    INTO v_cred_id, v_current_hashPwd
    FROM tbl_Credential c
    WHERE c.email = in_email;

    
    IF v_current_hashPwd <> in_original_hashPwd THEN
        SET status_code = 2;
    ELSEIF v_current_hashPwd = in_hashedPwd THEN
        
        SET status_code = 3;
    ELSE
        
        START TRANSACTION;

        UPDATE tbl_Credential
        SET salt = in_salt ,password = in_hashedPwd
        WHERE credential_id = v_cred_id;


        COMMIT;
        SET status_code = 1; 
    END IF;
	
    SELECT status_code;

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

-- Dump completed on 2025-06-12 14:21:19
