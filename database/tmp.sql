CREATE DATABASE  IF NOT EXISTS `PRISMA` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `PRISMA`;
-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: PRISMA
-- ------------------------------------------------------
-- Server version	5.6.23

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
-- Table structure for table `Accion`
--

DROP TABLE IF EXISTS `Accion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PantallaElementoid` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `TipoAccionid` int(11) NOT NULL,
  `PantallaElementoidDestino` int(11) NOT NULL,
  `imagen` blob,
  `descripcion` varchar(999) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueAccion` (`PantallaElementoid`,`nombre`),
  KEY `FKAccion62036` (`PantallaElementoidDestino`),
  KEY `FKAccion918990` (`PantallaElementoid`),
  KEY `FKAccion910670` (`TipoAccionid`),
  CONSTRAINT `FKAccion62036` FOREIGN KEY (`PantallaElementoidDestino`) REFERENCES `Pantalla` (`Elementoid`),
  CONSTRAINT `FKAccion910670` FOREIGN KEY (`TipoAccionid`) REFERENCES `TipoAccion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKAccion918990` FOREIGN KEY (`PantallaElementoid`) REFERENCES `Pantalla` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accion`
--

LOCK TABLES `Accion` WRITE;
/*!40000 ALTER TABLE `Accion` DISABLE KEYS */;
INSERT INTO `Accion` VALUES (1,15,'Nuevo',2,16,NULL,'Permite registrar un registro.'),(2,15,'Ayuda',1,16,NULL,'Permite solicitar el manual del sistema.'),(3,16,'Aceptar',2,16,'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','Permite confirmar la operación.'),(4,16,'Cancelar',2,15,'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','Permite cancelar la operación.');
/*!40000 ALTER TABLE `Accion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actor`
--

DROP TABLE IF EXISTS `Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actor` (
  `otraCardinalidad` varchar(45) DEFAULT NULL,
  `Elementoid` int(11) NOT NULL,
  `Cardinalidadid` int(11) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKActor872913` (`Cardinalidadid`),
  KEY `FKActor148309` (`Elementoid`),
  CONSTRAINT `FKActor148309` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKActor872913` FOREIGN KEY (`Cardinalidadid`) REFERENCES `Cardinalidad` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actor`
--

LOCK TABLES `Actor` WRITE;
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;
INSERT INTO `Actor` VALUES (NULL,1,1),(NULL,2,1),('Uno por evento',3,3);
/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Actualizacion`
--

DROP TABLE IF EXISTS `Actualizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Actualizacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `comentario` varchar(999) NOT NULL,
  `Elementoid` int(11) NOT NULL,
  `Colaborador_Proyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKActualizac954409` (`Elementoid`),
  KEY `FKActualizac741555` (`Colaborador_Proyectoid`),
  CONSTRAINT `FKActualizac741555` FOREIGN KEY (`Colaborador_Proyectoid`) REFERENCES `Colaborador_Proyecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKActualizac954409` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actualizacion`
--

LOCK TABLES `Actualizacion` WRITE;
/*!40000 ALTER TABLE `Actualizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Actualizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Atributo`
--

DROP TABLE IF EXISTS `Atributo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Atributo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(999) NOT NULL,
  `obligatorio` tinyint(1) NOT NULL,
  `longitud` int(10) DEFAULT NULL,
  `formatoArchivo` varchar(50) DEFAULT NULL,
  `tamanioArchivo` float DEFAULT NULL,
  `UnidadTamanioid` int(10) DEFAULT NULL,
  `EntidadElementoid` int(11) NOT NULL,
  `TipoDatoid` int(10) NOT NULL,
  `otroTipoDato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueAtributo` (`nombre`,`EntidadElementoid`),
  KEY `FKAtributo234480` (`UnidadTamanioid`),
  KEY `FKAtributo539266` (`EntidadElementoid`),
  KEY `FKAtributo156815` (`TipoDatoid`),
  CONSTRAINT `FKAtributo156815` FOREIGN KEY (`TipoDatoid`) REFERENCES `TipoDato` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKAtributo234480` FOREIGN KEY (`UnidadTamanioid`) REFERENCES `UnidadTamanio` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKAtributo539266` FOREIGN KEY (`EntidadElementoid`) REFERENCES `Entidad` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Atributo`
--

LOCK TABLES `Atributo` WRITE;
/*!40000 ALTER TABLE `Atributo` DISABLE KEYS */;
INSERT INTO `Atributo` VALUES (1,'Folio','Cadena conformada por números, letras o la combinación de ambos que sirve para identificar al evento.',1,10,NULL,NULL,NULL,4,1,NULL),(2,'Observaciones','Información adicional referente al evento y a los documentos asociados.',1,999,NULL,NULL,NULL,4,1,NULL),(3,'Fecha del pago','Se utiliza como referencia temporal para identificar al evento.',1,NULL,NULL,NULL,NULL,5,4,NULL),(4,'Superficie solicitada','Superficie total solicitada para ecibir el beneficio.',1,10,NULL,NULL,NULL,5,2,NULL),(5,'Fecha de plantación','Es el día, mes y año en que se realizó la plantación.',1,NULL,NULL,NULL,NULL,5,4,NULL),(6,'Paraje','Describe al lugar o superficie relacionada al evento.',0,999,NULL,NULL,NULL,5,1,NULL);
/*!40000 ALTER TABLE `Atributo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cardinalidad`
--

DROP TABLE IF EXISTS `Cardinalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cardinalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueCardinalidad` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cardinalidad`
--

LOCK TABLES `Cardinalidad` WRITE;
/*!40000 ALTER TABLE `Cardinalidad` DISABLE KEYS */;
INSERT INTO `Cardinalidad` VALUES (2,'Muchos'),(3,'Otra'),(1,'Uno');
/*!40000 ALTER TABLE `Cardinalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasoUso`
--

DROP TABLE IF EXISTS `CasoUso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasoUso` (
  `Elementoid` int(11) NOT NULL,
  `redaccionActores` varchar(1000) DEFAULT NULL,
  `redaccionEntradas` varchar(1000) DEFAULT NULL,
  `redaccionSalidas` varchar(1000) DEFAULT NULL,
  `redaccionReglasNegocio` varchar(1000) DEFAULT NULL,
  `Moduloid` int(11) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKCasoUso589849` (`Elementoid`),
  KEY `FKCasoUso686967` (`Moduloid`),
  CONSTRAINT `FKCasoUso589849` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCasoUso686967` FOREIGN KEY (`Moduloid`) REFERENCES `Modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasoUso`
--

LOCK TABLES `CasoUso` WRITE;
/*!40000 ALTER TABLE `CasoUso` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasoUso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasoUso_Actor`
--

DROP TABLE IF EXISTS `CasoUso_Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasoUso_Actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroToken` int(11) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `ActorElementoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueRelacionActor` (`CasoUsoElementoid`,`ActorElementoid`),
  KEY `FKCasoUso_Ac644128` (`CasoUsoElementoid`),
  KEY `FKCasoUso_Ac543005` (`ActorElementoid`),
  CONSTRAINT `FKCasoUso_Ac543005` FOREIGN KEY (`ActorElementoid`) REFERENCES `Actor` (`Elementoid`) ON UPDATE CASCADE,
  CONSTRAINT `FKCasoUso_Ac644128` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasoUso_Actor`
--

LOCK TABLES `CasoUso_Actor` WRITE;
/*!40000 ALTER TABLE `CasoUso_Actor` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasoUso_Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasoUso_Pantalla`
--

DROP TABLE IF EXISTS `CasoUso_Pantalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasoUso_Pantalla` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `PantallaElementoid` int(11) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueRelacionPantalla` (`PantallaElementoid`,`CasoUsoElementoid`),
  KEY `FKCasoUso_Pa531997` (`CasoUsoElementoid`),
  KEY `FKCasoUso_Pa280704` (`PantallaElementoid`),
  CONSTRAINT `FKCasoUso_Pa280704` FOREIGN KEY (`PantallaElementoid`) REFERENCES `Pantalla` (`Elementoid`) ON UPDATE CASCADE,
  CONSTRAINT `FKCasoUso_Pa531997` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasoUso_Pantalla`
--

LOCK TABLES `CasoUso_Pantalla` WRITE;
/*!40000 ALTER TABLE `CasoUso_Pantalla` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasoUso_Pantalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CasoUso_ReglaNegocio`
--

DROP TABLE IF EXISTS `CasoUso_ReglaNegocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CasoUso_ReglaNegocio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numeroToken` int(10) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `ReglaNegocioElementoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueRelacionRN` (`CasoUsoElementoid`,`ReglaNegocioElementoid`),
  KEY `FKCasoUso_Re422554` (`CasoUsoElementoid`),
  KEY `FKCasoUso_Re477864` (`ReglaNegocioElementoid`),
  CONSTRAINT `FKCasoUso_Re422554` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKCasoUso_Re477864` FOREIGN KEY (`ReglaNegocioElementoid`) REFERENCES `ReglaNegocio` (`Elementoid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CasoUso_ReglaNegocio`
--

LOCK TABLES `CasoUso_ReglaNegocio` WRITE;
/*!40000 ALTER TABLE `CasoUso_ReglaNegocio` DISABLE KEYS */;
/*!40000 ALTER TABLE `CasoUso_ReglaNegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colaborador`
--

DROP TABLE IF EXISTS `Colaborador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Colaborador` (
  `CURP` varchar(18) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidoPaterno` varchar(45) NOT NULL,
  `apellidoMaterno` varchar(45) NOT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  `contrasenia` varchar(20) NOT NULL,
  PRIMARY KEY (`CURP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colaborador`
--

LOCK TABLES `Colaborador` WRITE;
/*!40000 ALTER TABLE `Colaborador` DISABLE KEYS */;
INSERT INTO `Colaborador` VALUES ('HESN930515MDFRNT03','Natalia','Hernández','Sánchez','hdznatali@gmail.com','password'),('RACS930702HMCMMR05','Sergio','Ramírez','Camacho','sramirezc@live.com','helloworld');
/*!40000 ALTER TABLE `Colaborador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Colaborador_Proyecto`
--

DROP TABLE IF EXISTS `Colaborador_Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Colaborador_Proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ColaboradorCURP` varchar(18) NOT NULL,
  `Rolid` int(11) NOT NULL,
  `Proyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueColaborador` (`ColaboradorCURP`,`Proyectoid`),
  KEY `FKColaborado926222` (`Proyectoid`),
  KEY `FKColaborado523143` (`ColaboradorCURP`),
  KEY `FKColaborado664150` (`Rolid`),
  CONSTRAINT `FKColaborado523143` FOREIGN KEY (`ColaboradorCURP`) REFERENCES `Colaborador` (`CURP`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKColaborado664150` FOREIGN KEY (`Rolid`) REFERENCES `Rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKColaborado926222` FOREIGN KEY (`Proyectoid`) REFERENCES `Proyecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Colaborador_Proyecto`
--

LOCK TABLES `Colaborador_Proyecto` WRITE;
/*!40000 ALTER TABLE `Colaborador_Proyecto` DISABLE KEYS */;
INSERT INTO `Colaborador_Proyecto` VALUES (1,'RACS930702HMCMMR05',1,1),(2,'HESN930515MDFRNT03',1,1);
/*!40000 ALTER TABLE `Colaborador_Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Elemento`
--

DROP TABLE IF EXISTS `Elemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Elemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(999) DEFAULT NULL,
  `EstadoElementoid` int(11) NOT NULL,
  `Proyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueElemento` (`clave`,`nombre`),
  KEY `FKElemento728649` (`Proyectoid`),
  KEY `FKElemento378533` (`EstadoElementoid`),
  CONSTRAINT `FKElemento378533` FOREIGN KEY (`EstadoElementoid`) REFERENCES `EstadoElemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKElemento728649` FOREIGN KEY (`Proyectoid`) REFERENCES `Proyecto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Elemento`
--

LOCK TABLES `Elemento` WRITE;
/*!40000 ALTER TABLE `Elemento` DISABLE KEYS */;
INSERT INTO `Elemento` VALUES (1,'ACT','1','Responsable del predio','Se refiere al personal de que administra la información asociada a los predios.',1,1),(2,'ACT','2','Cartógrafo del predio','Se refiere al personal que define la georreferencia de un predio.',1,1),(3,'ACT','3','Responsable del evento','Se refiere al personal que administra la información asociada a cada uno de los eventos.',1,1),(4,'ENT','1','Evento','Se refiere a cada una de las operaciones y programas realizados.',1,1),(5,'ENT','2','Pago por servicios ambientales hidrológicos','Programa para la conservación y aumento de los bosques.',1,1),(6,'ENT','3','Reforestación','Establecimiento inducido de vegetación forestal.',1,1),(7,'GLS','1','Anillo','Elemento geométrico que compone a los polígonos.',1,1),(8,'GLS','2','Aprobación de registro','Es el resultado de la evaluación del registro de un predio o evento, por parte del responsable.',1,1),(9,'GLS','3','Área de conocimiento','Corresponde a una subdirección o dominio de la unidad administrativa.',1,1),(10,'GLS','4','Causa del incendio','Determina el origen de un incendio forestal.',1,1),(11,'RN','1','Datos obligatorios','Esta regla se utilizará para verificar que los datos marcados como obligatorios sean ingresados.',1,1),(12,'RN','2','Formato de dato correcto','Esta regla se utilizará para verificar que el tipo de dato ingresado sea válido.',1,1),(13,'MSG','1','Coordenadas mínimas requeridas','El objetivo de este mensaje es informar al usuario que debe especificar al menos tres coordenadas para realizar la operación.',1,1),(14,'MSG','2','El archivo no cuenta con el formato solicitado','El objetivo de este mensaje es indicar al actor que no se puede ejecutar la acción solicitada debido a que el archivo no está en el formato solicitado.',1,1),(15,'IUSF','1','Administrar incendios','Esta pantalla permite al responsable del evento visualizar los incendios registrados y sirve como punto de acceso para definir nuevos, así como modificar, aprobar o consultar los ya registrados.',1,1),(16,'IUSF','2','Registrar incendio','Esta pantalla permite al actor interactuar con los componentes necesarios para registrar un evento del tipo incendio.',1,1);
/*!40000 ALTER TABLE `Elemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entidad`
--

DROP TABLE IF EXISTS `Entidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entidad` (
  `Elementoid` int(11) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKEntidad434647` (`Elementoid`),
  CONSTRAINT `FKEntidad434647` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entidad`
--

LOCK TABLES `Entidad` WRITE;
/*!40000 ALTER TABLE `Entidad` DISABLE KEYS */;
INSERT INTO `Entidad` VALUES (4),(5),(6);
/*!40000 ALTER TABLE `Entidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrada`
--

DROP TABLE IF EXISTS `Entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroToken` int(10) NOT NULL,
  `TipoParametroid` int(11) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `Atributoid` int(11) DEFAULT NULL,
  `TerminoGlosarioElementoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEntrada429579` (`Atributoid`),
  KEY `FKEntrada368636` (`TerminoGlosarioElementoid`),
  KEY `FKEntrada546756` (`CasoUsoElementoid`),
  KEY `FKEntrada610752` (`TipoParametroid`),
  CONSTRAINT `FKEntrada368636` FOREIGN KEY (`TerminoGlosarioElementoid`) REFERENCES `TerminoGlosario` (`Elementoid`) ON UPDATE CASCADE,
  CONSTRAINT `FKEntrada429579` FOREIGN KEY (`Atributoid`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKEntrada546756` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKEntrada610752` FOREIGN KEY (`TipoParametroid`) REFERENCES `TipoParametro` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrada`
--

LOCK TABLES `Entrada` WRITE;
/*!40000 ALTER TABLE `Entrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoElemento`
--

DROP TABLE IF EXISTS `EstadoElemento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoElemento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueEstadoElemento` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoElemento`
--

LOCK TABLES `EstadoElemento` WRITE;
/*!40000 ALTER TABLE `EstadoElemento` DISABLE KEYS */;
INSERT INTO `EstadoElemento` VALUES (1,'Edición'),(6,'Liberado'),(3,'Pendiente de corrección'),(5,'Por liberar'),(4,'Revisión'),(2,'Terminado');
/*!40000 ALTER TABLE `EstadoElemento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EstadoProyecto`
--

DROP TABLE IF EXISTS `EstadoProyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoProyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueEstadoProyecto` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoProyecto`
--

LOCK TABLES `EstadoProyecto` WRITE;
/*!40000 ALTER TABLE `EstadoProyecto` DISABLE KEYS */;
INSERT INTO `EstadoProyecto` VALUES (2,'Iniciado'),(1,'Negociación'),(3,'Terminado');
/*!40000 ALTER TABLE `EstadoProyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Extension`
--

DROP TABLE IF EXISTS `Extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Extension` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CasoUsoElementoid_origen` int(11) NOT NULL,
  `CasoUsoElementoid_destino` int(11) NOT NULL,
  `causa` varchar(999) NOT NULL,
  `region` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueExtension` (`CasoUsoElementoid_origen`,`CasoUsoElementoid_destino`),
  KEY `FKExtension742233` (`CasoUsoElementoid_origen`),
  KEY `FKExtension285262` (`CasoUsoElementoid_destino`),
  CONSTRAINT `FKExtension285262` FOREIGN KEY (`CasoUsoElementoid_destino`) REFERENCES `CasoUso` (`Elementoid`) ON UPDATE CASCADE,
  CONSTRAINT `FKExtension742233` FOREIGN KEY (`CasoUsoElementoid_origen`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Extension`
--

LOCK TABLES `Extension` WRITE;
/*!40000 ALTER TABLE `Extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `Extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inclusion`
--

DROP TABLE IF EXISTS `Inclusion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inclusion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `CasoUsoElementoid_origen` int(11) NOT NULL,
  `CasoUsoElementoid_destino` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueInclusion` (`CasoUsoElementoid_destino`,`CasoUsoElementoid_origen`),
  KEY `FKInclusion776033` (`CasoUsoElementoid_destino`),
  KEY `FKInclusion168061` (`CasoUsoElementoid_origen`),
  CONSTRAINT `FKInclusion168061` FOREIGN KEY (`CasoUsoElementoid_origen`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKInclusion776033` FOREIGN KEY (`CasoUsoElementoid_destino`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inclusion`
--

LOCK TABLES `Inclusion` WRITE;
/*!40000 ALTER TABLE `Inclusion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Inclusion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensaje`
--

DROP TABLE IF EXISTS `Mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mensaje` (
  `Elementoid` int(11) NOT NULL,
  `redaccion` varchar(999) NOT NULL,
  `parametrizado` tinyint(1) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKMensaje721868` (`Elementoid`),
  CONSTRAINT `FKMensaje721868` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensaje`
--

LOCK TABLES `Mensaje` WRITE;
/*!40000 ALTER TABLE `Mensaje` DISABLE KEYS */;
INSERT INTO `Mensaje` VALUES (13,'Es requerido que se especifiquen al menos tres coordenadas para realizar la operación',0),(14,'No se puede cargar el archivo seleccionado, verifique que el formato del archivo sea PDF.',0);
/*!40000 ALTER TABLE `Mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mensaje_Parametro`
--

DROP TABLE IF EXISTS `Mensaje_Parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mensaje_Parametro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `MensajeElementoid` int(11) NOT NULL,
  `Parametroid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKMensaje_Pa262782` (`MensajeElementoid`),
  KEY `FKMensaje_Pa138078` (`Parametroid`),
  CONSTRAINT `FKMensaje_Pa138078` FOREIGN KEY (`Parametroid`) REFERENCES `Parametro` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKMensaje_Pa262782` FOREIGN KEY (`MensajeElementoid`) REFERENCES `Mensaje` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mensaje_Parametro`
--

LOCK TABLES `Mensaje_Parametro` WRITE;
/*!40000 ALTER TABLE `Mensaje_Parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mensaje_Parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Modulo`
--

DROP TABLE IF EXISTS `Modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(999) NOT NULL,
  `Proyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueModulo` (`clave`,`Proyectoid`),
  KEY `FKModulo19143` (`Proyectoid`),
  CONSTRAINT `FKModulo19143` FOREIGN KEY (`Proyectoid`) REFERENCES `Proyecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Modulo`
--

LOCK TABLES `Modulo` WRITE;
/*!40000 ALTER TABLE `Modulo` DISABLE KEYS */;
INSERT INTO `Modulo` VALUES (1,'SF','Superficies Forestales','Superficies Forestales',1);
/*!40000 ALTER TABLE `Modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operador`
--

DROP TABLE IF EXISTS `Operador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operador` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `simbolo` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueOperadorSimbolo` (`simbolo`),
  UNIQUE KEY `uniqueOperador` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operador`
--

LOCK TABLES `Operador` WRITE;
/*!40000 ALTER TABLE `Operador` DISABLE KEYS */;
INSERT INTO `Operador` VALUES (1,'Igual','='),(2,'Menor que','<'),(3,'Mayor que','>'),(4,'Menor igual que','<='),(5,'Mayor igual que','>='),(6,'Diferente','!=');
/*!40000 ALTER TABLE `Operador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pantalla`
--

DROP TABLE IF EXISTS `Pantalla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pantalla` (
  `Elementoid` int(11) NOT NULL,
  `imagen` longblob,
  `Moduloid` int(11) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKPantalla491263` (`Elementoid`),
  KEY `FKPantalla768080` (`Moduloid`),
  CONSTRAINT `FKPantalla491263` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKPantalla768080` FOREIGN KEY (`Moduloid`) REFERENCES `Modulo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pantalla`
--

LOCK TABLES `Pantalla` WRITE;
/*!40000 ALTER TABLE `Pantalla` DISABLE KEYS */;
INSERT INTO `Pantalla` VALUES (15,'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',1),(16,NULL,1);
/*!40000 ALTER TABLE `Pantalla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parametro`
--

DROP TABLE IF EXISTS `Parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Parametro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `Proyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueParametro` (`nombre`,`Proyectoid`),
  KEY `FKParametro572300` (`Proyectoid`),
  CONSTRAINT `FKParametro572300` FOREIGN KEY (`Proyectoid`) REFERENCES `Proyecto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parametro`
--

LOCK TABLES `Parametro` WRITE;
/*!40000 ALTER TABLE `Parametro` DISABLE KEYS */;
INSERT INTO `Parametro` VALUES (1,'DETERMINADO','Artículo determinado.',1),(2,'INDETERMINADO','Artículo indeterminado.',1),(3,'ENTIDAD','Es una entidad del modelo conceptual.',1),(4,'VALOR','Es el valor que toma algún atributo de una entidad.',1);
/*!40000 ALTER TABLE `Parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paso`
--

DROP TABLE IF EXISTS `Paso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Paso` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numero` int(10) NOT NULL,
  `realizaActor` tinyint(1) NOT NULL,
  `redaccion` varchar(1000) NOT NULL,
  `Trayectoriaid` int(10) NOT NULL,
  `Verboid` int(10) NOT NULL,
  `otroVerbo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniquePaso` (`numero`,`Trayectoriaid`),
  KEY `FKPaso747799` (`Trayectoriaid`),
  KEY `FKPaso790455` (`Verboid`),
  CONSTRAINT `FKPaso747799` FOREIGN KEY (`Trayectoriaid`) REFERENCES `Trayectoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKPaso790455` FOREIGN KEY (`Verboid`) REFERENCES `Verbo` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paso`
--

LOCK TABLES `Paso` WRITE;
/*!40000 ALTER TABLE `Paso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PostPrecondicion`
--

DROP TABLE IF EXISTS `PostPrecondicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PostPrecondicion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `redaccion` varchar(1000) NOT NULL,
  `precondicion` tinyint(1) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKPostPrecon986728` (`CasoUsoElementoid`),
  CONSTRAINT `FKPostPrecon986728` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PostPrecondicion`
--

LOCK TABLES `PostPrecondicion` WRITE;
/*!40000 ALTER TABLE `PostPrecondicion` DISABLE KEYS */;
/*!40000 ALTER TABLE `PostPrecondicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proyecto`
--

DROP TABLE IF EXISTS `Proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `fechaInicioProgramada` date NOT NULL,
  `fechaTerminoProgramada` date NOT NULL,
  `fechaInicio` date DEFAULT NULL,
  `fechaTermino` date DEFAULT NULL,
  `descripcion` varchar(999) NOT NULL,
  `presupuesto` double DEFAULT NULL,
  `contraparte` varchar(45) NOT NULL,
  `EstadoProyectoid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clave` (`clave`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `FKProyecto676367` (`EstadoProyectoid`),
  CONSTRAINT `FKProyecto676367` FOREIGN KEY (`EstadoProyectoid`) REFERENCES `EstadoProyecto` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proyecto`
--

LOCK TABLES `Proyecto` WRITE;
/*!40000 ALTER TABLE `Proyecto` DISABLE KEYS */;
INSERT INTO `Proyecto` VALUES (1,'SIG','Sistema de Información Geográfica','2011-03-12','2012-03-12','2011-03-13','2012-03-13','Sistema para la gestión de áreas naturales protegidas y superficies forestales.',5000000,'IPN',1);
/*!40000 ALTER TABLE `Proyecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReferenciaParametro`
--

DROP TABLE IF EXISTS `ReferenciaParametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReferenciaParametro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `numeroToken` int(10) NOT NULL,
  `TipoParametroid` int(11) NOT NULL,
  `PostPrecondicionid` int(10) DEFAULT NULL,
  `Pasoid` int(10) DEFAULT NULL,
  `Extensionid` int(10) DEFAULT NULL,
  `PasoidDestino` int(10) DEFAULT NULL,
  `ElementoidDestino` int(11) DEFAULT NULL,
  `AccionidDestino` int(11) DEFAULT NULL,
  `Atributoid` int(11) DEFAULT NULL,
  `Trayectoriaid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKReferencia566006` (`Trayectoriaid`),
  KEY `FKReferencia203453` (`Atributoid`),
  KEY `FKReferencia384626` (`TipoParametroid`),
  KEY `FKReferencia209681` (`PostPrecondicionid`),
  KEY `FKReferencia233904` (`Pasoid`),
  KEY `FKReferencia97972` (`Extensionid`),
  KEY `FKReferencia564326` (`PasoidDestino`),
  KEY `FKReferencia551912` (`ElementoidDestino`),
  KEY `FKReferencia742226` (`AccionidDestino`),
  CONSTRAINT `FKReferencia203453` FOREIGN KEY (`Atributoid`) REFERENCES `Atributo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia209681` FOREIGN KEY (`PostPrecondicionid`) REFERENCES `PostPrecondicion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia233904` FOREIGN KEY (`Pasoid`) REFERENCES `Paso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia384626` FOREIGN KEY (`TipoParametroid`) REFERENCES `TipoParametro` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia551912` FOREIGN KEY (`ElementoidDestino`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia564326` FOREIGN KEY (`PasoidDestino`) REFERENCES `Paso` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia566006` FOREIGN KEY (`Trayectoriaid`) REFERENCES `Trayectoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia742226` FOREIGN KEY (`AccionidDestino`) REFERENCES `Accion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReferencia97972` FOREIGN KEY (`Extensionid`) REFERENCES `Extension` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReferenciaParametro`
--

LOCK TABLES `ReferenciaParametro` WRITE;
/*!40000 ALTER TABLE `ReferenciaParametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReferenciaParametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReglaNegocio`
--

DROP TABLE IF EXISTS `ReglaNegocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReglaNegocio` (
  `Elementoid` int(11) NOT NULL,
  `redaccion` varchar(999) NOT NULL,
  `TipoReglaNegocioid` int(10) NOT NULL,
  `Atributoid_unicidad` int(11) DEFAULT NULL,
  `Atributoid_fechaI` int(11) DEFAULT NULL,
  `Atributoid_fechaT` int(11) DEFAULT NULL,
  `TipoComparacionid` int(10) DEFAULT NULL,
  `Atributoid_comp1` int(11) DEFAULT NULL,
  `Atributoid_comp2` int(11) DEFAULT NULL,
  `Operadorid` int(10) DEFAULT NULL,
  `Atributoid_expReg` int(11) DEFAULT NULL,
  `expresionRegular` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Elementoid`),
  UNIQUE KEY `uniqueComparacion` (`TipoReglaNegocioid`,`Atributoid_comp1`,`Atributoid_comp2`,`Operadorid`),
  UNIQUE KEY `uniqueExpReg` (`TipoReglaNegocioid`,`Atributoid_expReg`),
  UNIQUE KEY `uniqueUnicidad` (`TipoReglaNegocioid`,`Atributoid_unicidad`),
  UNIQUE KEY `uniqueFechas` (`TipoReglaNegocioid`,`Atributoid_fechaI`,`Atributoid_fechaT`),
  KEY `FKReglaNegoc900841` (`Atributoid_expReg`),
  KEY `FKReglaNegoc564329` (`TipoReglaNegocioid`),
  KEY `FKReglaNegoc668056` (`Elementoid`),
  KEY `FKReglaNegoc669584` (`Atributoid_unicidad`),
  KEY `FKReglaNegoc184874` (`Atributoid_fechaI`),
  KEY `FKReglaNegoc184863` (`Atributoid_fechaT`),
  KEY `FKReglaNegoc982004` (`TipoComparacionid`),
  KEY `FKReglaNegoc263949` (`Operadorid`),
  KEY `FKReglaNegoc476000` (`Atributoid_comp1`),
  KEY `FKReglaNegoc475999` (`Atributoid_comp2`),
  CONSTRAINT `FKReglaNegoc184863` FOREIGN KEY (`Atributoid_fechaT`) REFERENCES `Atributo` (`id`),
  CONSTRAINT `FKReglaNegoc184874` FOREIGN KEY (`Atributoid_fechaI`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc263949` FOREIGN KEY (`Operadorid`) REFERENCES `Operador` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc475999` FOREIGN KEY (`Atributoid_comp2`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc476000` FOREIGN KEY (`Atributoid_comp1`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc564329` FOREIGN KEY (`TipoReglaNegocioid`) REFERENCES `TipoReglaNegocio` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc668056` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc669584` FOREIGN KEY (`Atributoid_unicidad`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc900841` FOREIGN KEY (`Atributoid_expReg`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKReglaNegoc982004` FOREIGN KEY (`TipoComparacionid`) REFERENCES `TipoComparacion` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReglaNegocio`
--

LOCK TABLES `ReglaNegocio` WRITE;
/*!40000 ALTER TABLE `ReglaNegocio` DISABLE KEYS */;
INSERT INTO `ReglaNegocio` VALUES (11,'Para realizar con éxito una operación es necesario que se ingresen todos los datos marcados como obligatorios.',4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Para realizar con éxito una operación es necesario que los datos ingresados sean del tipo de dato definido en el modelo conceptual.',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ReglaNegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Revision`
--

DROP TABLE IF EXISTS `Revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `observaciones` varchar(999) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `revisado` tinyint(1) NOT NULL,
  `Seccionid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKRevision175605` (`Seccionid`),
  KEY `FKRevision761293` (`CasoUsoElementoid`),
  CONSTRAINT `FKRevision175605` FOREIGN KEY (`Seccionid`) REFERENCES `Seccion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKRevision761293` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Revision`
--

LOCK TABLES `Revision` WRITE;
/*!40000 ALTER TABLE `Revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `Revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rol`
--

DROP TABLE IF EXISTS `Rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueRol` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rol`
--

LOCK TABLES `Rol` WRITE;
/*!40000 ALTER TABLE `Rol` DISABLE KEYS */;
INSERT INTO `Rol` VALUES (2,'Analista'),(1,'Líder');
/*!40000 ALTER TABLE `Rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salida`
--

DROP TABLE IF EXISTS `Salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroToken` int(11) NOT NULL,
  `TipoParametroid` int(11) NOT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `MensajeElementoid` int(11) DEFAULT NULL,
  `TerminoGlosarioElementoid` int(11) DEFAULT NULL,
  `Atributoid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKSalida348357` (`Atributoid`),
  KEY `FKSalida684176` (`TerminoGlosarioElementoid`),
  KEY `FKSalida506056` (`CasoUsoElementoid`),
  KEY `FKSalida666681` (`MensajeElementoid`),
  KEY `FKSalida442060` (`TipoParametroid`),
  CONSTRAINT `FKSalida348357` FOREIGN KEY (`Atributoid`) REFERENCES `Atributo` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKSalida442060` FOREIGN KEY (`TipoParametroid`) REFERENCES `TipoParametro` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `FKSalida506056` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKSalida666681` FOREIGN KEY (`MensajeElementoid`) REFERENCES `Mensaje` (`Elementoid`) ON UPDATE CASCADE,
  CONSTRAINT `FKSalida684176` FOREIGN KEY (`TerminoGlosarioElementoid`) REFERENCES `TerminoGlosario` (`Elementoid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salida`
--

LOCK TABLES `Salida` WRITE;
/*!40000 ALTER TABLE `Salida` DISABLE KEYS */;
/*!40000 ALTER TABLE `Salida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Seccion`
--

DROP TABLE IF EXISTS `Seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Seccion` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Seccion`
--

LOCK TABLES `Seccion` WRITE;
/*!40000 ALTER TABLE `Seccion` DISABLE KEYS */;
INSERT INTO `Seccion` VALUES (1,'General'),(2,'Trayectorias'),(3,'Puntos de extensión');
/*!40000 ALTER TABLE `Seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefono`
--

DROP TABLE IF EXISTS `Telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ColaboradorCURP` varchar(18) NOT NULL,
  `lada` varchar(5) NOT NULL,
  `numero` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ColaboradorCURP` (`ColaboradorCURP`),
  UNIQUE KEY `lada` (`lada`),
  UNIQUE KEY `numero` (`numero`),
  KEY `FKTelefono558597` (`ColaboradorCURP`),
  CONSTRAINT `FKTelefono558597` FOREIGN KEY (`ColaboradorCURP`) REFERENCES `Colaborador` (`CURP`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefono`
--

LOCK TABLES `Telefono` WRITE;
/*!40000 ALTER TABLE `Telefono` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TerminoGlosario`
--

DROP TABLE IF EXISTS `TerminoGlosario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TerminoGlosario` (
  `Elementoid` int(11) NOT NULL,
  PRIMARY KEY (`Elementoid`),
  KEY `FKTerminoGlo98687` (`Elementoid`),
  CONSTRAINT `FKTerminoGlo98687` FOREIGN KEY (`Elementoid`) REFERENCES `Elemento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TerminoGlosario`
--

LOCK TABLES `TerminoGlosario` WRITE;
/*!40000 ALTER TABLE `TerminoGlosario` DISABLE KEYS */;
INSERT INTO `TerminoGlosario` VALUES (7),(8),(9),(10);
/*!40000 ALTER TABLE `TerminoGlosario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoAccion`
--

DROP TABLE IF EXISTS `TipoAccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoAccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTipoAccion` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoAccion`
--

LOCK TABLES `TipoAccion` WRITE;
/*!40000 ALTER TABLE `TipoAccion` DISABLE KEYS */;
INSERT INTO `TipoAccion` VALUES (2,'Botón'),(1,'Liga'),(3,'Opción del menú'),(4,'Otro');
/*!40000 ALTER TABLE `TipoAccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoComparacion`
--

DROP TABLE IF EXISTS `TipoComparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoComparacion` (
  `id` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTipoComparacion` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoComparacion`
--

LOCK TABLES `TipoComparacion` WRITE;
/*!40000 ALTER TABLE `TipoComparacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `TipoComparacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoDato`
--

DROP TABLE IF EXISTS `TipoDato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoDato` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTipoDato` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoDato`
--

LOCK TABLES `TipoDato` WRITE;
/*!40000 ALTER TABLE `TipoDato` DISABLE KEYS */;
INSERT INTO `TipoDato` VALUES (6,'Archivo'),(4,'Booleano'),(1,'Cadena'),(3,'Entero'),(5,'Fecha'),(2,'Flotante'),(7,'Otro');
/*!40000 ALTER TABLE `TipoDato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoParametro`
--

DROP TABLE IF EXISTS `TipoParametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoParametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTipoParametro` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoParametro`
--

LOCK TABLES `TipoParametro` WRITE;
/*!40000 ALTER TABLE `TipoParametro` DISABLE KEYS */;
INSERT INTO `TipoParametro` VALUES (8,'Accion'),(4,'Actor'),(5,'Atributo'),(2,'Caso de uso'),(1,'Entidad'),(6,'Mensaje'),(9,'Pantalla'),(10,'Paso'),(3,'Regla de negocio'),(7,'Termino del glosario'),(11,'Trayectoria');
/*!40000 ALTER TABLE `TipoParametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TipoReglaNegocio`
--

DROP TABLE IF EXISTS `TipoReglaNegocio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoReglaNegocio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTipoReglaNegocio` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoReglaNegocio`
--

LOCK TABLES `TipoReglaNegocio` WRITE;
/*!40000 ALTER TABLE `TipoReglaNegocio` DISABLE KEYS */;
INSERT INTO `TipoReglaNegocio` VALUES (2,'Comparación de atributos'),(4,'Datos obligatorios'),(9,'Formato correcto'),(7,'Formato de archivos'),(5,'Longitud correcta'),(10,'Otro'),(8,'Tamaño de archivos'),(6,'Tipo de dato correcto'),(3,'Unicidad de parámetros'),(1,'Verificación de catálogos');
/*!40000 ALTER TABLE `TipoReglaNegocio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trayectoria`
--

DROP TABLE IF EXISTS `Trayectoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Trayectoria` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) NOT NULL,
  `alternativa` tinyint(1) NOT NULL,
  `condicion` varchar(500) DEFAULT NULL,
  `CasoUsoElementoid` int(11) NOT NULL,
  `finCasoUso` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueTrayectoria` (`clave`,`CasoUsoElementoid`),
  KEY `FKTrayectori243052` (`CasoUsoElementoid`),
  CONSTRAINT `FKTrayectori243052` FOREIGN KEY (`CasoUsoElementoid`) REFERENCES `CasoUso` (`Elementoid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trayectoria`
--

LOCK TABLES `Trayectoria` WRITE;
/*!40000 ALTER TABLE `Trayectoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trayectoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UnidadTamanio`
--

DROP TABLE IF EXISTS `UnidadTamanio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UnidadTamanio` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueUnidadAbreviatura` (`abreviatura`),
  UNIQUE KEY `uniqueUnidadNombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UnidadTamanio`
--

LOCK TABLES `UnidadTamanio` WRITE;
/*!40000 ALTER TABLE `UnidadTamanio` DISABLE KEYS */;
INSERT INTO `UnidadTamanio` VALUES (1,'Kilobyte','KB'),(2,'Megabyte','MB'),(3,'Gigabyte','GB'),(4,'Terabyte','TB'),(5,'Petabyte','PT');
/*!40000 ALTER TABLE `UnidadTamanio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Verbo`
--

DROP TABLE IF EXISTS `Verbo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Verbo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueVerbo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Verbo`
--

LOCK TABLES `Verbo` WRITE;
/*!40000 ALTER TABLE `Verbo` DISABLE KEYS */;
INSERT INTO `Verbo` VALUES (2,'Busca'),(8,'Calcula'),(9,'Continúa'),(11,'Elimina'),(4,'Ingresa'),(10,'Modifica'),(3,'Muestra'),(6,'Oprime'),(13,'Otro'),(7,'Registra'),(12,'Selecciona'),(1,'Solicita'),(5,'Verifica');
/*!40000 ALTER TABLE `Verbo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-08-19 11:06:46
