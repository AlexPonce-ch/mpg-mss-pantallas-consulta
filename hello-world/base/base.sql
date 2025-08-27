-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: test_db
-- ------------------------------------------------------
-- Server version	8.0.43

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adq_m_seg_rol`
--

DROP TABLE IF EXISTS `adq_m_seg_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adq_m_seg_rol` (
  `ro_id` int NOT NULL,
  `ro_nombre` varchar(50) DEFAULT NULL,
  `ro_enmascarar` tinyint DEFAULT NULL,
  PRIMARY KEY (`ro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adq_m_seg_rol`
--

LOCK TABLES `adq_m_seg_rol` WRITE;
/*!40000 ALTER TABLE `adq_m_seg_rol` DISABLE KEYS */;
INSERT INTO `adq_m_seg_rol` VALUES (1,'Administrador',0),(2,'Operador',1);
/*!40000 ALTER TABLE `adq_m_seg_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adq_m_seg_rol_usuario`
--

DROP TABLE IF EXISTS `adq_m_seg_rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adq_m_seg_rol_usuario` (
  `ru_idusuario` int NOT NULL,
  `ru_idrol` int NOT NULL,
  `ru_estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`ru_idusuario`,`ru_idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adq_m_seg_rol_usuario`
--

LOCK TABLES `adq_m_seg_rol_usuario` WRITE;
/*!40000 ALTER TABLE `adq_m_seg_rol_usuario` DISABLE KEYS */;
INSERT INTO `adq_m_seg_rol_usuario` VALUES (1,1,'A'),(2,2,'A');
/*!40000 ALTER TABLE `adq_m_seg_rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adq_m_seg_usuario`
--

DROP TABLE IF EXISTS `adq_m_seg_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adq_m_seg_usuario` (
  `us_id` int NOT NULL,
  `us_usuario` varchar(50) DEFAULT NULL,
  `us_estado` char(1) DEFAULT NULL,
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adq_m_seg_usuario`
--

LOCK TABLES `adq_m_seg_usuario` WRITE;
/*!40000 ALTER TABLE `adq_m_seg_usuario` DISABLE KEYS */;
INSERT INTO `adq_m_seg_usuario` VALUES (1,'adminUser','A'),(2,'usuario1','A');
/*!40000 ALTER TABLE `adq_m_seg_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adq_tc_m_parametros`
--

DROP TABLE IF EXISTS `adq_tc_m_parametros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adq_tc_m_parametros` (
  `pa_nombre` varchar(50) NOT NULL,
  `pa_valor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pa_nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adq_tc_m_parametros`
--

LOCK TABLES `adq_tc_m_parametros` WRITE;
/*!40000 ALTER TABLE `adq_tc_m_parametros` DISABLE KEYS */;
INSERT INTO `adq_tc_m_parametros` VALUES ('CHARMASK','X'),('NUMBIN','6'),('NUMMASK','6');
/*!40000 ALTER TABLE `adq_tc_m_parametros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emi_t_medio_pago_tarjeta`
--

DROP TABLE IF EXISTS `emi_t_medio_pago_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emi_t_medio_pago_tarjeta` (
  `mp_cuenta` varchar(12) NOT NULL,
  `mp_identcli` varchar(8) NOT NULL,
  `mp_pan` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emi_t_medio_pago_tarjeta`
--

LOCK TABLES `emi_t_medio_pago_tarjeta` WRITE;
/*!40000 ALTER TABLE `emi_t_medio_pago_tarjeta` DISABLE KEYS */;
INSERT INTO `emi_t_medio_pago_tarjeta` VALUES ('VALOR','VALOR','VALOR_9'),('411111','411111','4111111234561111'),('451234','451234','4512345678901234'),('451264','451264','4512646219444120'),('451247','451247','4512475317124042'),('451253','451253','4512534454547106');
/*!40000 ALTER TABLE `emi_t_medio_pago_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vs_t_log_autorizaciones`
--

DROP TABLE IF EXISTS `vs_t_log_autorizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vs_t_log_autorizaciones` (
  `vi_tipoFranquicia` varchar(16) NOT NULL,
  `vi_fecha_proceso` mediumtext NOT NULL,
  `vi_siaidcd` mediumtext NOT NULL,
  `vi_siaidcd2` varchar(19) DEFAULT NULL,
  `vi_fechahora` mediumtext NOT NULL,
  `vi_maquina` mediumtext NOT NULL,
  `vi_msgType` mediumtext NOT NULL,
  `vi_mapaext` mediumtext NOT NULL,
  `vi_c2_tarjeta` mediumtext NOT NULL,
  `vi_c2_tarjeta2` varchar(22) DEFAULT NULL,
  `vi_c3_proccode` mediumtext NOT NULL,
  `vi_c4_monto` mediumtext NOT NULL,
  `vi_c5_monto_settlement` mediumtext NOT NULL,
  `vi_c6_monto_cardbill` mediumtext NOT NULL,
  `vi_c7_datetime` mediumtext NOT NULL,
  `mc_c8_monto_cardbillfee` mediumtext NOT NULL,
  `mc_c9_conver_rate_settlement` mediumtext NOT NULL,
  `vi_c10_conver_rate_cardbill` mediumtext NOT NULL,
  `vi_c11_audit_number` mediumtext NOT NULL,
  `vi_c12_hora_tran` mediumtext NOT NULL,
  `vi_c13_fecha_tran` mediumtext NOT NULL,
  `vi_c14_exp_date` mediumtext NOT NULL,
  `vi_c15_date_settlement` mediumtext NOT NULL,
  `mc_c16_date_conversion` mediumtext NOT NULL,
  `vi_c18_merchant_type` mediumtext NOT NULL,
  `vi_c19_adq_inst_coutry_code` mediumtext NOT NULL,
  `vi_c20_pan_country_code` mediumtext NOT NULL,
  `vi_c22_pos_entry_mode` mediumtext NOT NULL,
  `vi_c23_card_seq_number` mediumtext NOT NULL,
  `i3_c24_network_id` varchar(3) NOT NULL,
  `vi_c25_pos_cond_code` mediumtext NOT NULL,
  `vi_c26_pos_pin_capture_code` mediumtext NOT NULL,
  `vi_c28_monto_trans_fee` mediumtext NOT NULL,
  `vi_c32_acq_inst_id` mediumtext NOT NULL,
  `vi_c33_forw_inst_id` varchar(8) DEFAULT NULL,
  `vi_c35_track2` mediumtext NOT NULL,
  `vi_c37_reference_number` mediumtext NOT NULL,
  `vi_c38_autorizacion` mediumtext NOT NULL,
  `vi_c39_resp_code` mediumtext NOT NULL,
  `vi_c39_resp_desc` varchar(100) DEFAULT NULL,
  `vi_c41_terminal_id` mediumtext NOT NULL,
  `vi_c42_card_acceptor_id` mediumtext NOT NULL,
  `vi_c43_card_acceptor_name_loc` mediumtext NOT NULL,
  `vi_c44_additional_resp_data` mediumtext NOT NULL,
  `vi_c45_track1` mediumtext NOT NULL,
  `mc_c46_additional_data_iso_use` mediumtext NOT NULL,
  `vi_c48_additional_data_priv_use` mediumtext NOT NULL,
  `vi_c49_currency_code` mediumtext NOT NULL,
  `mc_c50_currency_code_settlement` mediumtext NOT NULL,
  `vi_c51_currency_code_cardbill` mediumtext NOT NULL,
  `vi_c52_pin_data` mediumtext NOT NULL,
  `vi_c53_security_relate_inf` mediumtext NOT NULL,
  `vi_c54_additional_amounts` mediumtext NOT NULL,
  `vi_c55_icc_system` mediumtext NOT NULL,
  `vi_c56_reserved_iso` mediumtext NOT NULL,
  `i3_c57_reserved_national_use` mediumtext NOT NULL,
  `vi_c59_nat_geo_data` mediumtext NOT NULL,
  `vi_c60_advice_reason_code` mediumtext NOT NULL,
  `vi_c61_pos_data` mediumtext NOT NULL,
  `vi_c62_int_network_facility_data` mediumtext NOT NULL,
  `vi_c63_banknet_data` mediumtext NOT NULL,
  `mc_c64_message_auth_code` mediumtext NOT NULL,
  `mc_c65_bitmap_extENDed` mediumtext NOT NULL,
  `vi_c70_net_information_code` mediumtext NOT NULL,
  `vi_c73_date_action` mediumtext NOT NULL,
  `vi_c90_original_data` mediumtext NOT NULL,
  `vi_c91_file_update_code` mediumtext NOT NULL,
  `vi_c92_file_security_code` mediumtext NOT NULL,
  `mc_c94_service_indicator` mediumtext NOT NULL,
  `vi_c95_replacement_amounts` mediumtext NOT NULL,
  `mc_c96_message_security_code` mediumtext NOT NULL,
  `vi_c100_recv_inst_code` mediumtext NOT NULL,
  `vi_c101_file_name` mediumtext NOT NULL,
  `vi_c102_account_id1` mediumtext NOT NULL,
  `vi_c103_account_id2` mediumtext NOT NULL,
  `vi_c104_trans_description` mediumtext NOT NULL,
  `i3_c105_reserved_iso` mediumtext NOT NULL,
  `mc_c108_reserved_iso` mediumtext NOT NULL,
  `vi_c110_key_data` mediumtext NOT NULL,
  `mc_c112_additional_data` varchar(3) NOT NULL,
  `vi_c114_reserved_national_use` mediumtext NOT NULL,
  `vi_c115_add_trace_info` mediumtext NOT NULL,
  `vi_c116_card_iss_reference` mediumtext NOT NULL,
  `vi_c117_national_use_data` mediumtext NOT NULL,
  `vi_c118_reserved_national_use` mediumtext NOT NULL,
  `i3_c119_reserved_national_use` mediumtext NOT NULL,
  `vi_c120_record_data` mediumtext NOT NULL,
  `vi_c121_authoring_agent_id` mediumtext NOT NULL,
  `mc_c122_additional_record_data` mediumtext NOT NULL,
  `vi_c123_reserved` mediumtext NOT NULL,
  `mc_c124_reserved` mediumtext NOT NULL,
  `vi_c125_secon_info` mediumtext NOT NULL,
  `vi_c126_visa_private_data` mediumtext NOT NULL,
  `vi_c127_file_data` mediumtext NOT NULL,
  `mc_bit128` mediumtext NOT NULL,
  `vi_c130_capacity_terminal` varchar(1) NOT NULL,
  `vi_c130_desc_capacity_terminal` varchar(100) NOT NULL,
  `vi_c131_res_ver_terminal` mediumtext NOT NULL,
  `vi_c132_umprevisible_number` mediumtext NOT NULL,
  `vi_c133_serie_term_number` mediumtext NOT NULL,
  `vi_c134_visa_discre_data` mediumtext NOT NULL,
  `vi_c135_visa_discre_data` mediumtext NOT NULL,
  `vi_c136_criptogram` mediumtext NOT NULL,
  `vi_c137_app_transac_counter` mediumtext NOT NULL,
  `vi_c138_exch_transac_profile` mediumtext NOT NULL,
  `vi_c139_opt_issuers_acquiring` mediumtext NOT NULL,
  `vi_c142_sender_script` mediumtext NOT NULL,
  `vi_c143_sender_script_result` mediumtext NOT NULL,
  `vi_c144_type_crypto_transac` mediumtext NOT NULL,
  `vi_c145_terminal_country_code` mediumtext NOT NULL,
  `vi_c146_terminal_transacc_date` mediumtext NOT NULL,
  `vi_c147_crypto_import` mediumtext NOT NULL,
  `vi_c148_crypto_money` mediumtext NOT NULL,
  `vi_c149_crypto_cash_import` mediumtext NOT NULL,
  `vi_c152_new_pinlblock` mediumtext NOT NULL,
  `vi_codigo_respuesta` mediumtext NOT NULL,
  `vi_canal` mediumtext NOT NULL,
  `vi_pais_adquirente` mediumtext NOT NULL,
  `vi_cuenta` int unsigned DEFAULT NULL,
  `vi_desres` mediumtext NOT NULL,
  `vi_bit034` mediumtext NOT NULL,
  `vi_ECI` varchar(2) NOT NULL,
  `vi_desc_ECI` varchar(100) NOT NULL,
  `vi_cod_respuesta` mediumtext NOT NULL,
  `vi_nombre_comercio` varchar(23) NOT NULL,
  `vi_ciudad_comercio` varchar(9) NOT NULL,
  `vi_pais_comercio` varchar(3) NOT NULL,
  `vi_pos_entry_mode` varchar(2) NOT NULL,
  `vi_tipo_emisor` varchar(10) NOT NULL,
  `vi_desc_bin` varchar(50) DEFAULT NULL,
  `vi_desc_bin_autoriza` varchar(50) DEFAULT NULL,
  `vi_des_pos_entry_mode` varchar(100) NOT NULL,
  `vi_cod_pos_entry_mode` varchar(2) NOT NULL,
  `vi_ind_cvv` varchar(1) NOT NULL,
  `vi_codigo_tipo_producto` int DEFAULT NULL,
  `vi_tipo_producto` varchar(100) DEFAULT NULL,
  `vi_indtip_producto` varchar(44) DEFAULT NULL,
  `vi_des_merchant_type` varchar(100) NOT NULL,
  `vi_cod_tipo_transaccion` varchar(25) DEFAULT NULL,
  `vi_des_tipo_transaccion` varchar(100) DEFAULT NULL,
  `vi_cod_marca` varchar(2) NOT NULL,
  `vi_des_marca` varchar(100) DEFAULT NULL,
  `vi_indicador_recurrente` varchar(1) NOT NULL,
  `vi_chipcondition_cod` varchar(18) NOT NULL,
  `vi_secope` bigint DEFAULT NULL,
  `up_ind_tarjeta` char(0) NOT NULL,
  `up_ind_credito` char(0) NOT NULL,
  `up_ind_precio` char(0) NOT NULL,
  `up_ind_escenario` char(0) NOT NULL,
  `vi_tipo_trx` varchar(5) DEFAULT NULL,
  `vi_codtipodiferido` varchar(4) DEFAULT NULL,
  `vi_destipodiferido` varchar(30) DEFAULT NULL,
  `vi_cuotaspactadas` varchar(11) DEFAULT NULL,
  `vi_tipofactura` varchar(44) DEFAULT NULL,
  `vi_codcadena` varchar(3) DEFAULT NULL,
  `vi_descadena` varchar(30) DEFAULT NULL,
  `vi_estadoaut` varchar(2) NOT NULL,
  `vi_tipo_autorizacion` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vs_t_log_autorizaciones`
--

LOCK TABLES `vs_t_log_autorizaciones` WRITE;
/*!40000 ALTER TABLE `vs_t_log_autorizaciones` DISABLE KEYS */;
INSERT INTO `vs_t_log_autorizaciones` VALUES ('TIPO','2025-07-30 12:00:00','CODE','CODE','2025-07-30 12:00:00','VALOR_5','VALOR_6','VALOR_7','VALOR_8','VALOR_9','CODE','100.00','100.00','100.00','2025-07-30 12:00:00','100.00','VALOR_16','VALOR_17','VALOR_18','VALOR_19','VALOR_20','2025-07-30 12:00:00','VALOR_22','VALOR_23','VALOR_24','CODE','CODE','VALOR_27','VALOR_28','COD','12','OE','100.00','CODE','CODE','VALOR_35','VALOR_36','VALOR_37','CODE','Descripcin','CODE','CODE','VALOR_42','VALOR_43','VALOR_44','VALOR_45','VALOR_46','CODE','CODE','CODE','VALOR_50','VALOR_51','VALOR_52','VALOR_53','VALOR_54','VALOR_55','VALOR_56','CODE','VALOR_58','VALOR_59','VALOR_60','CODE','VALOR_62','CODE','VALOR_64','VALOR_65','CODE','CODE','S','VALOR_69','CODE','CODE','VALOR_72','CODE','CODE','Descripcin','VALOR_76','VALOR_77','VALOR_78','XYZ','VALOR_80','VALOR_81','VALOR_82','VALOR_83','VALOR_84','VALOR_85','VALOR_86','CODE','VALOR_88','VALOR_89','VALOR_90','VALOR_91','VALOR_92','VALOR_93','VALOR_94','V','-','V','VALOR_98','VALOR_99','VALOR_100','VALOR_101','VALOR_102','VALOR_103','VALOR_104','VALOR_105','106','VALOR_107','VALOR_108','CODE','2025-07-30 12:00:00','VALOR_111','VALOR_112','VALOR_113','VALOR_114','CODE','WEB','ECU',123456789,'VALOR_119','VALOR_120','05','05','CODE','COMERCIO DE PRUEBA','VALOR_125','ECU','Vy','0','a','N','VALOR_131','C','V',8,'4','2','VALOR_137','CODE','TIPO','C','VALOR_141','V','CODE',0,'','','','','TIPO','CODE','CODE','VALOR_152','TIPO','COD','Des','VA','TIP'),('VISA','2025-07-31 11:30:00','SIA1234','SIA5678','2025-07-31 11:30:00','TERMINAL01','0200','MAPX001','411111XXXXXX1111','4111111234561111','000000','150.00','150.00','150.00','2025-07-31 11:30:00','0.00','1.00','1.00','654321','113000','2025-07-31','2708','2025-08-01','2025-08-01','6011','218','218','051','01','VIS','00','12','0.00','123456','00000000','4111111234561111=2708123456789','123456789012','A65432','00','Aprobada','ATM001','MERC001','PRUEBA S.A./GUAYAQUIL/EC','RESPDATA','B4111111234561111^TEST/CLIENTE^27081200000000000000','ISO002','DATAPRIV','840','840','840','****','SEC001','++000000000000','ICC002','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK002','AUTH002','BITMAP2','0700','2025-07-31','ORIG002','FUC002','FSC002','SVC002','0000000000','MSC002','INST002','FILE002','ACC100','ACC200','Pago en lnea','ISO105','ISO108','KEY002','AD2','NAT114','TRACE02','REF002','NAT117','NAT118','NAT119','REC002','AGT002','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC002','ETP002','OPT002','SCRIPT2','RESULT2','CRYTP','218','2025-07-31','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',456789123,'Autorizado correctamente','BIT034','05','Ecommerce','00','TIENDA TEST','QUITO','ECU','05','BNF','BANCO NACIONAL','AUTORIZADOR TEST','Manual Entry','05','1',100,'CRDITO','TIPO1','RESTAURANTES','0000','Compra','VI','VISA','N','CONDCHIP',1122334455,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','002','CADENA X','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2024-09-23 20:14:44','CD00X','CD00Y','2024-09-23 20:14:44','MAQ007','0100','MAP00X','451264XXXXXX4120','4512646219444120','000000','578.00','150.00','150.00','2024-09-23 20:14:44','0.00','1.00','1.00','250196','201444','2024-09-23','2707','2024-09-23','2024-09-23','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512646219444120','182804501142','MPP538','00','Aprobada','TERM00X','MERCH00X','Ferrer-Verdejo/GYE/EC','ADDDATA','B4512646219444120^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2024-09-23','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2024-09-23','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',338632529,'Autorizacin exitosa','BIT034','05','Ecommerce','00','Ferrer-Verdejo','Albacete','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',787295328,'','','','','RET','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','05','RET'),('VISA','2025-07-05 20:14:44','CD00X','CD00Y','2025-07-05 20:14:44','MAQ002','0100','MAP00X','451247XXXXXX4042','4512475317124042','000000','781.00','150.00','150.00','2025-07-05 20:14:44','0.00','1.00','1.00','894789','201444','2025-07-05','2707','2025-07-05','2025-07-05','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512475317124042','575871467298','574S1Z','00','Aprobada','TERM00X','MERCH00X','Aragn, Carlos and Carr/GYE/EC','ADDDATA','B4512475317124042^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-05','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-05','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',507212725,'Autorizacin exitosa','BIT034','05','Ecommerce','00','Aragn, Carlos and Carr','Albacete','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',265772239,'','','','','CAN','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','01','CAN'),('VISA','2025-06-07 20:14:44','CD00X','CD00Y','2025-06-07 20:14:44','MAQ002','0100','MAP00X','451253XXXXXX7106','4512534454547106','000000','201.00','150.00','150.00','2025-06-07 20:14:44','0.00','1.00','1.00','149221','201444','2025-06-07','2707','2025-06-07','2025-06-07','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512534454547106','157371851374','X7R6ZH','00','Aprobada','TERM00X','MERCH00X','Perales LLC/GYE/EC','ADDDATA','B4512534454547106^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-06-07','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-06-07','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',500236066,'Autorizacin exitosa','BIT034','05','Ecommerce','00','Perales LLC','Tarragona','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',161158279,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT'),('VISA','2025-07-30 15:15:00','CD001','CD002','2025-07-30 15:15:00','MAQ001','0100','MAP001','451234XXXXXX1234','4512345678901234','000000','150.00','150.00','150.00','2025-07-30 15:15:00','0.00','1.00','1.00','123456','151500','2025-07-30','2707','2025-07-31','2025-07-31','5411','218','218','051','01','VIS','00','12','0.00','000001','00000000','4512345678901234','123456789012','A12345','00','Ap','TERM001','MERCH001','COMERCIO PRUEBA/GYE/EC','ADDDATA','B4512345678901234^CLIENTE/TEST^27071200000000000000','ISO001','DATAPRIV','840','840','840','************','SECDATA','++000000000000','ICC001','ISORES','NATRES','GEO001','000','POS001','NETFAC','BNK001','AUTH001','BITMAP1','0700','2025-07-30','ORIGDATA','FUC001','FSC001','SVC001','0000000000','MSC001','INST001','FILENAME1','ACC001','ACC002','Compra Comercio 1','ISO105','ISO108','KEYDATA','AD1','NAT114','TRACE01','REF116','NAT117','NAT118','NAT119','REC120','AGT001','REC122','RES123','RES124','SECINFO','VPDATA','FILE127','BIT128','1','POS Tradicional','RES131','NUM132','SER133','VDD134','VDD135','CRYPTO','ATC001','ETP001','OPT139','SCRIPT1','RESULT1','CRYTP','218','2025-07-30','CIMPORT','CMONEY','CCASH','NEWPIN','00','WEB','ECU',100200300,'Autorizacin exitosa','BIT034','05','Ecommerce','00','COMERCIO UNO','GUAYAQUI','ECU','05','BNCO','BANCO ECU','BANCO AUTORIZADOR','Manual Entry','05','1',100,'CRDITO','CREDTIP','SUPERMERCADOS','0000','Compra','VI','VISA','N','CHIPCOND',987654321,'','','','','AUT','00','SIN DIFERIDO','01','SIMPLE','001','COMERCIO LOCAL','00','AUT');
/*!40000 ALTER TABLE `vs_t_log_autorizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test_db'
--

--
-- Dumping routines for database 'test_db'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_enmascarar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_enmascarar`(
  e_enmascara INT,
  e_caracter CHAR(1),
  e_cuantos INT,
  e_bin INT,
  e_valor VARCHAR(50)
) RETURNS varchar(25) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
  RETURN IF(
    e_enmascara > 0,
    e_valor,
    CONCAT(SUBSTRING(e_valor, 1, e_bin), REPEAT(e_caracter, e_cuantos), SUBSTRING(e_valor, -4))
  );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pa_consultar_autorizaciones` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pa_consultar_autorizaciones`(
  IN p_fecha_desde DATETIME,
  IN p_fecha_hasta DATETIME,
  IN p_tipo_autorizacion VARCHAR(50),
  IN p_numero_autorizacion VARCHAR(50),
  IN p_tipo_franquicia VARCHAR(50),
  IN p_nombre_cadena VARCHAR(100),
  IN p_nombre_comercio VARCHAR(100),
  IN p_numero_tarjeta VARCHAR(22),
  IN p_cuenta VARCHAR(20),
  IN p_codigo_giro VARCHAR(10),
  IN p_codigo_marca VARCHAR(10),
  IN p_tipo_emisor VARCHAR(50),
  IN p_tipo_producto VARCHAR(100),
  IN p_tipo_diferido VARCHAR(10),
  IN p_numero_cuotas INT,
  IN p_tipo_mensaje VARCHAR(10),
  IN p_estado_autorizacion VARCHAR(20),
  IN p_offset INT,
  IN p_limit INT
)
BEGIN

  
  SELECT 
    vta.*,
    mp.mp_cuenta
  FROM vs_t_log_autorizaciones vta
  LEFT JOIN emi_t_medio_pago_tarjeta mp ON vta.vi_c2_tarjeta2 = mp.mp_pan
  WHERE 1 = 1
    AND vta.vi_fecha_proceso BETWEEN p_fecha_desde AND p_fecha_hasta
    AND (p_tipo_autorizacion IS NULL OR vta.vi_tipo_autorizacion = p_tipo_autorizacion)
    AND (p_numero_autorizacion IS NULL OR vta.vi_c38_autorizacion = p_numero_autorizacion)
    AND (p_tipo_franquicia IS NULL OR vta.vi_tipoFranquicia = p_tipo_franquicia)
    AND (p_nombre_cadena IS NULL OR vta.vi_descadena = p_nombre_cadena)
    AND (p_nombre_comercio IS NULL OR vta.vi_nombre_comercio = p_nombre_comercio)
    AND (p_numero_tarjeta IS NULL OR vta.vi_c2_tarjeta2 = p_numero_tarjeta)
    AND (p_cuenta IS NULL OR mp.mp_cuenta = p_cuenta)
    AND (p_codigo_giro IS NULL OR vta.vi_c18_merchant_type = p_codigo_giro)
    AND (p_codigo_marca IS NULL OR vta.vi_cod_marca = p_codigo_marca)
    AND (p_tipo_emisor IS NULL OR vta.vi_tipo_emisor = p_tipo_emisor)
    AND (p_tipo_producto IS NULL OR vta.vi_tipo_producto = p_tipo_producto)
    AND (p_tipo_diferido IS NULL OR vta.vi_codtipodiferido = p_tipo_diferido)
    AND (p_numero_cuotas IS NULL OR CAST(vta.vi_cuotaspactadas AS UNSIGNED) = p_numero_cuotas)
    AND (p_tipo_mensaje IS NULL OR vta.vi_msgType = p_tipo_mensaje)
    AND (p_estado_autorizacion IS NULL OR vta.vi_estadoaut = p_estado_autorizacion)
  ORDER BY vta.vi_fecha_proceso DESC
  LIMIT p_limit OFFSET p_offset;

  
  SELECT COUNT(*) AS total_registros
  FROM vs_t_log_autorizaciones vta
  LEFT JOIN emi_t_medio_pago_tarjeta mp ON vta.vi_c2_tarjeta2 = mp.mp_pan
  WHERE 1 = 1
    AND vta.vi_fecha_proceso BETWEEN p_fecha_desde AND p_fecha_hasta
    AND (p_tipo_autorizacion IS NULL OR vta.vi_tipo_autorizacion = p_tipo_autorizacion)
    AND (p_numero_autorizacion IS NULL OR vta.vi_c38_autorizacion = p_numero_autorizacion)
    AND (p_tipo_franquicia IS NULL OR vta.vi_tipoFranquicia = p_tipo_franquicia)
    AND (p_nombre_cadena IS NULL OR vta.vi_descadena = p_nombre_cadena)
    AND (p_nombre_comercio IS NULL OR vta.vi_nombre_comercio = p_nombre_comercio)
    AND (p_numero_tarjeta IS NULL OR vta.vi_c2_tarjeta2 = p_numero_tarjeta)
    AND (p_cuenta IS NULL OR mp.mp_cuenta = p_cuenta)
    AND (p_codigo_giro IS NULL OR vta.vi_c18_merchant_type = p_codigo_giro)
    AND (p_codigo_marca IS NULL OR vta.vi_cod_marca = p_codigo_marca)
    AND (p_tipo_emisor IS NULL OR vta.vi_tipo_emisor = p_tipo_emisor)
    AND (p_tipo_producto IS NULL OR vta.vi_tipo_producto = p_tipo_producto)
    AND (p_tipo_diferido IS NULL OR vta.vi_codtipodiferido = p_tipo_diferido)
    AND (p_numero_cuotas IS NULL OR CAST(vta.vi_cuotaspactadas AS UNSIGNED) = p_numero_cuotas)
    AND (p_tipo_mensaje IS NULL OR vta.vi_msgType = p_tipo_mensaje)
    AND (p_estado_autorizacion IS NULL OR vta.vi_estadoaut = p_estado_autorizacion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_enmascarar_pan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_enmascarar_pan`(
    IN e_usuario VARCHAR(50),
    IN e_pan VARCHAR(50),
    OUT o_pan VARCHAR(25)
)
BEGIN
    DECLARE v_char_mascara CHAR(1);
    DECLARE v_num_mascara INT;
    DECLARE v_num_bin INT;
    DECLARE v_si_enmask INT;

    
    SELECT pa_valor INTO v_char_mascara
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'CHARMASK';

    SELECT pa_valor INTO v_num_mascara
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'NUMMASK';

    SELECT pa_valor INTO v_num_bin
    FROM adq_tc_m_parametros
    WHERE pa_nombre = 'NUMBIN';

    
    SELECT COUNT(1) INTO v_si_enmask
    FROM adq_m_seg_usuario us
    INNER JOIN adq_m_seg_rol_usuario ru ON us.us_id = ru.ru_idusuario
    INNER JOIN adq_m_seg_rol ro ON ru.ru_idrol = ro.ro_id
    WHERE us.us_usuario = e_usuario
      AND ro.ro_enmascarar = 0
      AND ru.ru_estado = 'A'
      AND us.us_estado = 'A';

    
    SELECT fn_enmascarar(v_si_enmask, v_char_mascara, v_num_mascara, v_num_bin, e_pan)
    INTO o_pan;

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

-- Dump completed on 2025-08-07 21:49:59
