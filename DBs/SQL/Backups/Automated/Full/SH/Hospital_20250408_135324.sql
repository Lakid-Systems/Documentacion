-- MySQL dump 10.13  Distrib 9.1.0, for macos14 (arm64)
--
-- Host: localhost    Database: Hospital
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `tbb_personas`
--

DROP TABLE IF EXISTS `tbb_personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_personas` (
  `ID` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\nnaturaleza: Cualitativo\\nComposicion: Caracteres hexadecimales 0-E\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `Titulo_Cortesia` varchar(20) DEFAULT NULL COMMENT 'Descripcion: titulo de cortesia rferencia a la persona, puede ser de profesion o de referencia (e. Sr, SSra, Dr, ect),\\nNaturaleza: Cualitativo\\nDominio: Caracteres alfabeticos\\nComposicion: 0(a-z|A-Z)20',
  `Nombre` varchar(80) NOT NULL COMMENT 'Descripción del campo: Nombre de la persona registrada en el sistema.\\nNaturaleza: Cualitativo\\nComposición: Caracteres alfabéticos y espacios\\nDominio: 80(A-Z, a-z, '' '')',
  `Primer_Apellido` varchar(80) NOT NULL COMMENT 'Descripcion: valor asociado a la persona dentro de su registro civil generalmente conocido como apellido paterno\\\\\\\\nNaturaleza: Cualitativa\\\\\\\\nDominio: Caracteres alfabeticos, vocales con tilde, espacio separador\\\\\\\\nComposicion: 0{A-Z|a-z|.}80',
  `Segundo_Apellido` varchar(80) DEFAULT NULL COMMENT 'Descripcion: valor asociado a la persona dentro de su registro civil generalmente conocido como apellido materno\\\\\\\\nNaturaleza: Cualitativa\\\\\\\\nDominio: Caracteres alfabeticos, vocales con tilde, espacio separador\\\\\\\\nComposicion: 0{A-Z|a-z|.}80',
  `CURP` varchar(18) NOT NULL COMMENT ' \\nDescripción: Clave Única de Registro de Población asignada a cada ciudadano mexicano.  \\nNaturaleza: Cualitativa  \\nDominio: Caracteres alfanuméricos de longitud fija (18 caracteres).  \\nComposición:  \\n\\nCURP = 4{A-Z} + 6{0-9} + 1{H|M} + 2{A-Z} + 3{A-Z} + 2{A-Z | 0-9}  ',
  `Correo_Electronico` varchar(100) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Fecha_Nacimiento` date NOT NULL COMMENT 'Descripcion: Fecha que definira la edad de una persona, indicando el dia, mes y año de nacimiento\\\\nNaturaleza: Cuantitativa\\\\nDominio: Numeros enteros positivos delimitados por el calendario\\\\nComposicion: \\\\n\\\\naño = 4{0-9}4\\\\nmes = [01|02|...|12]\\\\ndia = [01|02|...|31]\\\\nfecha_nacimiento',
  `Fotografia` varchar(100) DEFAULT NULL,
  `Genero` enum('Masculino','Femenino','Otro') NOT NULL COMMENT 'Descipcion: Dato alusivo al genero biologico de una persona\\\\nNaturaleza: Cualitativo\\\\nDominio: Conjunto de valores permitidos\\\\nComposicion: \\\\n\\\\ngenero=[''M'',''F'',''N/B'']',
  `Tipo_Sangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL COMMENT 'Descipcion: Dato alusivo al grupo sanguineo que pertenece a una persona.\\\\nNaturaleza: Cualitativo\\\\nDominio: Conjunto de valores permitidos\\\\nComposicion:\\\\ntipo_sangre=[''A+'',''A-'',''B+'',''B-'',''AB+'',''AB-'',''O+'',''O-'']',
  `Estatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Descripcion: Atributo que valida el estado activo o inactivo de la persona\\\\nNaturaleza: Cualitativo\\\\nDominio: valores 0 y 1\\\\nComposicion: {0|1}',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Descripcion: Fecha que indica el momento de registro de una persona a la base de datos\\\\\\\\nNaturaleza: Cuantitativa\\\\\\\\nDominio: Numeros enteros positivos delimitados por el calendario\\\\\\\\nComposicion: \\\\\\\\n\\\\\\\\naño = 4{0-9}4\\\\\\\\nmes = [01|02|...|12]\\\\\\\\ndia = [01|02|...|31]\\\\\\\\nfecha_Registro = año+''-''+mes+''-''+di',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Fecha que indica el momento de actualizacion de los datos de una persona en la  base de datos\\\\\\\\nNaturaleza: Cuantitativa\\\\\\\\nDominio: Numeros enteros positivos delimitados por el calendario\\\\\\\\nComposicion: \\\\\\\\n\\\\\\\\naño = 4{0-9}4\\\\\\\\nmes = [01|02|...|12]\\\\\\\\ndia = [01|02|...|31]\\\\\\\\nfecha_Registro = año+''-''+mes+''-''+dia\\n',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CURP` (`CURP`),
  UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  KEY `ix_tbb_personas_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que contendrá la información de las PERSONAS que interactuan con el sistema en alguno de los procesos, esta es una superentidad por lo que sus datos seran heredados por las subentidades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_personas`
--

LOCK TABLES `tbb_personas` WRITE;
/*!40000 ALTER TABLE `tbb_personas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbb_usuarios`
--

DROP TABLE IF EXISTS `tbb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbb_usuarios` (
  `ID` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `Persona_ID` varchar(36) NOT NULL,
  `Nombre_Usuario` varchar(60) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Numero_Telefonico_Movil` varchar(20) DEFAULT NULL,
  `Estatus` enum('Activo','Inactivo','Bloqueado','Suspendido') NOT NULL DEFAULT 'Activo',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Nombre_Usuario` (`Nombre_Usuario`),
  UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  KEY `Persona_ID` (`Persona_ID`),
  KEY `ix_tbb_usuarios_ID` (`ID`),
  CONSTRAINT `tbb_usuarios_ibfk_1` FOREIGN KEY (`Persona_ID`) REFERENCES `tbb_personas` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla que gestiona las credenciales y acceso al sistema para cada persona. Relacionada con tbb_personas mediante Persona_ID. Incluye nombre de usuario, contraseña y estatus de la cuenta.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbb_usuarios`
--

LOCK TABLES `tbb_usuarios` WRITE;
/*!40000 ALTER TABLE `tbb_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_areas_medicas`
--

DROP TABLE IF EXISTS `tbc_areas_medicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_areas_medicas` (
  `ID` varchar(36) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_areas_medicas`
--

LOCK TABLES `tbc_areas_medicas` WRITE;
/*!40000 ALTER TABLE `tbc_areas_medicas` DISABLE KEYS */;
INSERT INTO `tbc_areas_medicas` VALUES ('2b18a900-14b2-11f0-9de5-24b82ebf33c2','Servicios Medicos','Por definir',1,'2024-01-21 16:00:41','2025-04-08 13:46:30'),('2b18f7ca-14b2-11f0-9de5-24b82ebf33c2','Servicios de Apoyo','Por definir',1,'2024-01-21 16:06:31','2025-04-08 13:46:30'),('2b18f9f0-14b2-11f0-9de5-24b82ebf33c2','Servicios Medico - Administrativos','Por definir',1,'2024-01-21 16:06:31','2025-04-08 13:46:30'),('2b18fb1c-14b2-11f0-9de5-24b82ebf33c2','Servicios de Enfermeria','Por definir',1,'2024-01-21 16:06:31','2025-04-08 13:46:30'),('2b18fc20-14b2-11f0-9de5-24b82ebf33c2','Departamentos Administrativos','Por definir',1,'2024-01-21 16:06:31','2025-04-08 13:46:30');
/*!40000 ALTER TABLE `tbc_areas_medicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_consumibles`
--

DROP TABLE IF EXISTS `tbc_consumibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_consumibles` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `departamento` varchar(50) NOT NULL,
  `cantidad_existencia` int NOT NULL DEFAULT '0',
  `detalle` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `observaciones` text,
  `espacio_medico` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_tbc_consumibles_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de insumos médicos y materiales consumibles. Lleva control de existencias y ubicación en el hospital.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_consumibles`
--

LOCK TABLES `tbc_consumibles` WRITE;
/*!40000 ALTER TABLE `tbc_consumibles` DISABLE KEYS */;
INSERT INTO `tbc_consumibles` VALUES ('8c2a28ac-14af-11f0-9de5-24b82ebf33c2','Guantes','Guantes latex','Proteccion','Almacen',500,'Caja de 100 guantes','2025-04-08 13:27:45','2025-04-08 13:27:45',1,'Revisar antes de entrar','Emergencias'),('8c2ab93e-14af-11f0-9de5-24b82ebf33c2','Gasas','Gasas estériles','Material Médico','Almacen',1000,'Paquete de 50 gasas','2025-04-08 13:27:45','2025-04-08 13:27:45',1,'Mantener en ambiente seco','Urgencias'),('8c2abc4a-14af-11f0-9de5-24b82ebf33c2','Jeringas','Jeringas desechables','Material Médico','Almacen',800,'Caja de 100 jeringas','2025-04-08 13:27:45','2025-04-08 13:27:45',1,'Manipular con cuidado','Consultas Externas'),('8c2abde4-14af-11f0-9de5-24b82ebf33c2','Vendas','Vendas elásticas','Material Médico','Almacen',1200,'Rollo de 10 metros','2025-04-08 13:27:45','2025-04-08 13:27:45',1,'Utilizar para vendajes compresivos','Emergencias'),('8c2ac604-14af-11f0-9de5-24b82ebf33c2','Analgésico','Medicamento','Farmacia','Estantería A',500,'Tabletas para alivio del dolor moderado a severo','2025-04-08 13:27:45','2025-04-08 13:27:45',1,'Mantener en lugar fresco y seco','Consultas Externas'),('f306affa-14af-11f0-9de5-24b82ebf33c2','Guantes','Guantes latex','Proteccion','Almacen',600,'Caja de 100 guantes','2025-04-08 13:30:37','2025-04-08 13:30:37',1,'Revisar antes de entrar','Emergencias'),('f306b89c-14af-11f0-9de5-24b82ebf33c2','Gasas','Gasas estériles','Material Médico','Almacen',1000,'Paquete de 50 gasas','2025-04-08 13:30:37','2025-04-08 13:30:37',1,'Mantener en ambiente seco','Urgencias'),('f306ba0e-14af-11f0-9de5-24b82ebf33c2','Jeringas','Jeringas desechables','Material Médico','Almacen',800,'Caja de 100 jeringas','2025-04-08 13:30:37','2025-04-08 13:30:37',1,'Manipular con cuidado','Consultas Externas'),('f306bae0-14af-11f0-9de5-24b82ebf33c2','Vendas','Vendas elásticas','Material Médico','Almacen',1200,'Rollo de 10 metros','2025-04-08 13:30:37','2025-04-08 13:30:37',1,'Utilizar para vendajes compresivos','Emergencias');
/*!40000 ALTER TABLE `tbc_consumibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_departamentos`
--

DROP TABLE IF EXISTS `tbc_departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_departamentos` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `nombre` varchar(100) NOT NULL,
  `area_medica_id` varchar(36) DEFAULT NULL,
  `departamento_superior_id` varchar(36) DEFAULT NULL,
  `responsable_id` varchar(36) DEFAULT NULL,
  `estatus` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_tbc_departamentos_id` (`id`),
  KEY `tbc_departamentos_ibfk_1` (`area_medica_id`),
  KEY `tbc_departamentos_ibfk_2` (`departamento_superior_id`),
  KEY `tbc_departamentos_ibfk_3` (`responsable_id`),
  CONSTRAINT `tbc_departamentos_ibfk_1` FOREIGN KEY (`area_medica_id`) REFERENCES `tbc_areas_medicas` (`ID`),
  CONSTRAINT `tbc_departamentos_ibfk_2` FOREIGN KEY (`departamento_superior_id`) REFERENCES `tbc_departamentos` (`id`),
  CONSTRAINT `tbc_departamentos_ibfk_3` FOREIGN KEY (`responsable_id`) REFERENCES `tbb_personas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Estructura organizacional del hospital. Puede estar relacionada con áreas médicas y tener jerarquías (departamentos superiores).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_departamentos`
--

LOCK TABLES `tbc_departamentos` WRITE;
/*!40000 ALTER TABLE `tbc_departamentos` DISABLE KEYS */;
INSERT INTO `tbc_departamentos` VALUES ('31483f51-1430-488c-9749-d695f6506d50','Medicina General',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL),('6f272049-ccd9-49b6-bbc3-37ad5c98467c','Laboratorio Clínico',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL),('8548c9d4-4711-4696-ba41-1e4fe7db3933','Quirófanos',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL),('adb98eb1-a5b2-446e-8dfe-ac481568449e','Consulta Externa',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL),('b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Mantenimiento',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL),('b8bb6b00-14b0-11f0-9de5-24b82ebf33c2','Administración',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('b8bb6b1e-14b0-11f0-9de5-24b82ebf33c2','Medicina General',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('b8bb6b32-14b0-11f0-9de5-24b82ebf33c2','Quirófanos',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('b8bb6b3c-14b0-11f0-9de5-24b82ebf33c2','Consulta Externa',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('b8bb6b46-14b0-11f0-9de5-24b82ebf33c2','Laboratorio Clínico',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('b8bb6b5a-14b0-11f0-9de5-24b82ebf33c2','Mantenimiento',NULL,NULL,NULL,1,'2025-04-08 13:36:09',NULL),('d16f3dd5-e741-4d13-9160-43b6e82318ba','Administración',NULL,NULL,NULL,1,'2025-04-08 13:39:07',NULL);
/*!40000 ALTER TABLE `tbc_departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_espacios`
--

DROP TABLE IF EXISTS `tbc_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_espacios` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `tipo` enum('Consultorio','Laboratorio','Quirófano','Sala_de_Espera','Edificio','Estacionamiento','Habitación','Cama','Sala_Maternidad','Cunero','Anfiteatro','Oficina','Sala_de_Juntas','Auditorio','Cafeteria','Capilla','Farmacia','Ventanilla','Recepción','Piso') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento_id` varchar(36) DEFAULT NULL,
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `capacidad` int DEFAULT NULL,
  `espacio_superior_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `espacio_superior_id` (`espacio_superior_id`),
  KEY `ix_tbc_espacios_departamento_id` (`departamento_id`),
  KEY `ix_tbc_espacios_id` (`id`),
  CONSTRAINT `tbc_espacios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `tbc_departamentos` (`id`) ON DELETE SET NULL,
  CONSTRAINT `tbc_espacios_ibfk_2` FOREIGN KEY (`espacio_superior_id`) REFERENCES `tbc_espacios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Inventario de los espacios físicos del hospital (consultorios, quirófanos, habitaciones). Incluye tipo, capacidad y relación con departamentos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_espacios`
--

LOCK TABLES `tbc_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_espacios` DISABLE KEYS */;
INSERT INTO `tbc_espacios` VALUES ('23039960-14b1-11f0-9de5-24b82ebf33c2','Edificio','Medicina General','31483f51-1430-488c-9749-d695f6506d50','Activo','2025-04-08 13:39:07',NULL,NULL,NULL),('2303b724-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Baja','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:39:07',NULL,NULL,'23039960-14b1-11f0-9de5-24b82ebf33c2'),('2303c99e-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-101','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303cdae-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-102','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303d204-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-103','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303d4c0-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-104','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303d6f0-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-105','8548c9d4-4711-4696-ba41-1e4fe7db3933','Inactivo','2025-04-08 13:39:07','2025-04-08 13:42:48',NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303d916-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-106','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303db64-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-107','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303dd8a-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-108','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:39:07',NULL,NULL,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303dfc4-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-109','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:39:07','2025-04-08 13:42:48',80,'2303b724-14b1-11f0-9de5-24b82ebf33c2'),('2303ef5a-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Alta','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:39:07',NULL,NULL,'23039960-14b1-11f0-9de5-24b82ebf33c2'),('23040224-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-201','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('2304067a-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-202','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('23040922-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-203','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('23040bc0-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-204','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('23040e72-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-205','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('23041110-14b1-11f0-9de5-24b82ebf33c2','Laboratorio','A206','6f272049-ccd9-49b6-bbc3-37ad5c98467c','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('23041584-14b1-11f0-9de5-24b82ebf33c2','Recepción','A-208','d16f3dd5-e741-4d13-9160-43b6e82318ba','Activo','2025-04-08 13:39:07',NULL,NULL,'2303ef5a-14b1-11f0-9de5-24b82ebf33c2'),('63615b82-14b1-11f0-9de5-24b82ebf33c2','Edificio','Medicina General','31483f51-1430-488c-9749-d695f6506d50','Activo','2025-04-08 13:40:55',NULL,NULL,NULL),('63616eba-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Baja','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:40:55',NULL,NULL,'63615b82-14b1-11f0-9de5-24b82ebf33c2'),('63617a4a-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-101','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63617ca2-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-102','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63617e82-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-103','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63617fe0-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-104','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('636181ac-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-105','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63618300-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-106','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63618436-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-107','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('6361856c-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-108','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('636186b6-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-109','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:40:55',NULL,NULL,'63616eba-14b1-11f0-9de5-24b82ebf33c2'),('63619ba6-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Alta','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:40:55',NULL,NULL,'63615b82-14b1-11f0-9de5-24b82ebf33c2'),('6361a7cc-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-201','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361aa10-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-202','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361ab82-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-203','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361accc-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-204','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361ae66-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-205','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361afce-14b1-11f0-9de5-24b82ebf33c2','Laboratorio','A206','6f272049-ccd9-49b6-bbc3-37ad5c98467c','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361b0dc-14b1-11f0-9de5-24b82ebf33c2','Capilla','A-207','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('6361b208-14b1-11f0-9de5-24b82ebf33c2','Recepción','A-208','d16f3dd5-e741-4d13-9160-43b6e82318ba','Activo','2025-04-08 13:40:55',NULL,NULL,'63619ba6-14b1-11f0-9de5-24b82ebf33c2'),('a6d3e380-14b1-11f0-9de5-24b82ebf33c2','Edificio','Medicina General','31483f51-1430-488c-9749-d695f6506d50','Activo','2025-04-08 13:42:48',NULL,NULL,NULL),('a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Baja','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3e380-14b1-11f0-9de5-24b82ebf33c2'),('a6d4020c-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-101','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d40478-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-102','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d405d6-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-103','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d40798-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-104','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d4098c-14b1-11f0-9de5-24b82ebf33c2','Consultorio','A-105','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d40ad6-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-106','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d40c2a-14b1-11f0-9de5-24b82ebf33c2','Quirófano','A-107','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d40fc2-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-108','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d41102-14b1-11f0-9de5-24b82ebf33c2','Sala_de_Espera','A-109','8548c9d4-4711-4696-ba41-1e4fe7db3933','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3f5aa-14b1-11f0-9de5-24b82ebf33c2'),('a6d41a3a-14b1-11f0-9de5-24b82ebf33c2','Piso','Planta Alta','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d3e380-14b1-11f0-9de5-24b82ebf33c2'),('a6d42ed0-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-201','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d43178-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-202','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d432fe-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-203','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d43452-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-204','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d435b0-14b1-11f0-9de5-24b82ebf33c2','Habitación','A-205','adb98eb1-a5b2-446e-8dfe-ac481568449e','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d4370e-14b1-11f0-9de5-24b82ebf33c2','Laboratorio','A206','6f272049-ccd9-49b6-bbc3-37ad5c98467c','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d43830-14b1-11f0-9de5-24b82ebf33c2','Capilla','A-207','b5db8ab1-7c3f-494b-85b2-ab9a9d3f1021','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2'),('a6d43966-14b1-11f0-9de5-24b82ebf33c2','Recepción','A-208','d16f3dd5-e741-4d13-9160-43b6e82318ba','Activo','2025-04-08 13:42:48',NULL,NULL,'a6d41a3a-14b1-11f0-9de5-24b82ebf33c2');
/*!40000 ALTER TABLE `tbc_espacios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_roles`
--

DROP TABLE IF EXISTS `tbc_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_roles` (
  `ID` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `Nombre` varchar(60) NOT NULL,
  `Descripcion` text,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ix_tbc_roles_ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo que define los diferentes roles o perfiles de usuarios en el sistema (Administrador, Médico, Paciente, etc.). Determina los permisos y acceso a funcionalidades.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_roles`
--

LOCK TABLES `tbc_roles` WRITE;
/*!40000 ALTER TABLE `tbc_roles` DISABLE KEYS */;
INSERT INTO `tbc_roles` VALUES ('f103ca72-0c1b-11f0-8387-04dc44beee6e','Administrador','Usuario con acceso completo a todos los módulos del sistema',1,'2025-03-28 15:30:59',NULL),('f103fae2-0c1b-11f0-8387-04dc44beee6e','Director Médico','Usuario con acceso a reportes y estadísticas del hospital',1,'2025-03-28 15:30:59',NULL),('f103fbbe-0c1b-11f0-8387-04dc44beee6e','Médico','Personal médico con acceso a historiales clínicos y agenda de citas',1,'2025-03-28 15:30:59',NULL),('f103fc0e-0c1b-11f0-8387-04dc44beee6e','Enfermero','Personal de enfermería con acceso a registros médicos básicos',1,'2025-03-28 15:30:59',NULL),('f103fc4a-0c1b-11f0-8387-04dc44beee6e','Recepcionista','Personal administrativo con acceso a agenda de citas y registros',1,'2025-03-28 15:30:59',NULL),('f103fc86-0c1b-11f0-8387-04dc44beee6e','Paciente','Usuario con acceso limitado a su propia información médica',1,'2025-03-28 15:30:59',NULL),('f103fcb8-0c1b-11f0-8387-04dc44beee6e','Familiar Autorizado','Usuario con acceso limitado a información de un paciente específico',0,'2025-03-28 15:30:59',NULL),('f103fcea-0c1b-11f0-8387-04dc44beee6e','Inventarios','Personal responsable de gestionar inventario médico',1,'2025-03-28 15:30:59',NULL),('f103fd1c-0c1b-11f0-8387-04dc44beee6e','Sistemas','Personal técnico con acceso a configuración del sistema',1,'2025-03-28 15:30:59',NULL),('f103fd58-0c1b-11f0-8387-04dc44beee6e','Prueba','Rol temporal para pruebas del sistema',1,'2025-03-28 15:30:59',NULL);
/*!40000 ALTER TABLE `tbc_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios_medicos`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `observaciones` text,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `ix_tbc_servicios_medicos_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Catálogo de los servicios médicos ofrecidos por el hospital. Describe cada servicio y sus características.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios_medicos`
--

LOCK TABLES `tbc_servicios_medicos` WRITE;
/*!40000 ALTER TABLE `tbc_servicios_medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios_medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbc_servicios_medicos_espacios`
--

DROP TABLE IF EXISTS `tbc_servicios_medicos_espacios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_servicios_medicos_espacios` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\\\\\nnaturaleza: Cualitativo\\\\\\\\nComposicion: Caracteres hexadecimales 0-E\\\\\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `fk_servicio` varchar(36) NOT NULL,
  `fk_espacio` varchar(36) NOT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estatus_aprobacion` enum('Pendiente','Aprobado','Rechazado') NOT NULL DEFAULT 'Pendiente',
  `estatus` enum('Activo','Inactivo') NOT NULL DEFAULT 'Activo',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_termino` datetime DEFAULT NULL,
  `fecha_ultima_actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ix_tbc_servicios_medicos_espacios_fk_espacio` (`fk_espacio`),
  KEY `ix_tbc_servicios_medicos_espacios_fk_servicio` (`fk_servicio`),
  KEY `ix_tbc_servicios_medicos_espacios_id` (`id`),
  CONSTRAINT `tbc_servicios_medicos_espacios_ibfk_1` FOREIGN KEY (`fk_servicio`) REFERENCES `tbc_servicios_medicos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbc_servicios_medicos_espacios_ibfk_2` FOREIGN KEY (`fk_espacio`) REFERENCES `tbc_espacios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla puente que relaciona servicios médicos con los espacios donde se prestan. Gestiona horarios y disponibilidad.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_servicios_medicos_espacios`
--

LOCK TABLES `tbc_servicios_medicos_espacios` WRITE;
/*!40000 ALTER TABLE `tbc_servicios_medicos_espacios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbc_servicios_medicos_espacios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_servicios_medicos_consumibles`
--

DROP TABLE IF EXISTS `tbd_servicios_medicos_consumibles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_servicios_medicos_consumibles` (
  `id` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `id_servicio` varchar(36) NOT NULL,
  `id_consumible` varchar(36) NOT NULL,
  `cantidad_usada` int NOT NULL DEFAULT '1',
  `fecha_uso` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  PRIMARY KEY (`id`),
  KEY `id_servicio` (`id_servicio`),
  KEY `id_consumible` (`id_consumible`),
  KEY `ix_tbd_servicios_medicos_consumibles_id` (`id`),
  CONSTRAINT `tbd_servicios_medicos_consumibles_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `tbc_servicios_medicos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tbd_servicios_medicos_consumibles_ibfk_2` FOREIGN KEY (`id_consumible`) REFERENCES `tbc_consumibles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registro del consumo de materiales por servicio médico. Permite llevar control de los insumos utilizados en cada procedimiento.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_servicios_medicos_consumibles`
--

LOCK TABLES `tbd_servicios_medicos_consumibles` WRITE;
/*!40000 ALTER TABLE `tbd_servicios_medicos_consumibles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_servicios_medicos_consumibles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbd_usuarios_roles`
--

DROP TABLE IF EXISTS `tbd_usuarios_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbd_usuarios_roles` (
  `Usuario_ID` varchar(36) NOT NULL COMMENT 'Descripción del campo: Identificador principal del cojunto de registros.\\\\nnaturaleza: Cualitativo\\\\nComposicion: Caracteres hexadecimales 0-E\\\\nDominio 36[8(0-f)8+''-''+4(0-f)4+''-''+4(0-f)4+''-''+4(0-f)4+''-''+''-''+12(0-f)11',
  `Rol_ID` varchar(36) NOT NULL,
  `Estatus` tinyint(1) NOT NULL DEFAULT '1',
  `Fecha_Registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha_Actualizacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Usuario_ID`,`Rol_ID`),
  KEY `Rol_ID` (`Rol_ID`),
  CONSTRAINT `tbd_usuarios_roles_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `tbb_usuarios` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `tbd_usuarios_roles_ibfk_2` FOREIGN KEY (`Rol_ID`) REFERENCES `tbc_roles` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla puente que asigna roles a los usuarios. Establece relaciones muchos-a-muchos entre usuarios y roles, permitiendo que un usuario tenga múltiples roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbd_usuarios_roles`
--

LOCK TABLES `tbd_usuarios_roles` WRITE;
/*!40000 ALTER TABLE `tbd_usuarios_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbd_usuarios_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-08 13:53:24
