-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: basededatostv2
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.22.04.1

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  `programa_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `palabra` (`categoria`),
  KEY `fk_categoria_programa1_idx` (`programa_id`),
  CONSTRAINT `fk_categoria_programa1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'talk-show',1),(2,'informativo',2),(3,'humor-politico',3),(4,'comedia-streaming',4),(5,'entrevistas',5);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarioId` int NOT NULL,
  `programaId` int NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  KEY `programaId` (`programaId`),
  CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`programaId`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat`
--

LOCK TABLES `chat` WRITE;
/*!40000 ALTER TABLE `chat` DISABLE KEYS */;
INSERT INTO `chat` VALUES (1,1,1,'¡Qué buen invitado hoy!','2024-10-09 14:30:00'),(2,2,2,'Excelente cobertura de las noticias','2024-10-09 20:15:00'),(3,3,3,'Me muero de risa con este programa','2024-10-09 22:00:00'),(4,4,4,'Nadie Dice Nada es lo mejor del streaming argentino','2024-10-09 16:30:00'),(5,5,5,'Tremenda entrevista en Gelatina','2024-10-09 18:20:00');
/*!40000 ALTER TABLE `chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `encuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `programaId` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `fechaFin` datetime DEFAULT NULL,
  `activa` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `programaId` (`programaId`),
  CONSTRAINT `encuesta_ibfk_1` FOREIGN KEY (`programaId`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
INSERT INTO `encuesta` VALUES (1,1,'¿Cuál fue tu segmento favorito de hoy?','2024-10-09 13:00:00','2024-10-09 23:59:59',1),(2,2,'¿Qué noticia te pareció más importante?','2024-10-09 19:30:00','2024-10-09 23:59:59',1),(3,3,'¿Quién tuvo la mejor frase de la noche?','2024-10-09 21:00:00','2024-10-10 02:00:00',1),(4,4,'¿Qué invitado querés ver en el programa?','2024-10-09 14:00:00','2024-10-16 23:59:59',1),(5,5,'¿Qué músico te gustaría que vaya a Gelatina?','2024-10-09 16:00:00','2024-10-16 23:59:59',1),(6,1,'¿Cuál fue tu segmento favorito de hoy?','2024-10-09 13:00:00','2024-10-09 23:59:59',1),(7,2,'¿Qué noticia te pareció más importante?','2024-10-09 19:30:00','2024-10-09 23:59:59',1),(8,3,'¿Quién tuvo la mejor frase de la noche?','2024-10-09 21:00:00','2024-10-10 02:00:00',1),(9,4,'¿Qué invitado querés ver en el programa?','2024-10-09 14:00:00','2024-10-16 23:59:59',1),(10,5,'¿Qué músico te gustaría que vaya a Gelatina?','2024-10-09 16:00:00','2024-10-16 23:59:59',1);
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarioId` int NOT NULL,
  `programaId` int NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarioId` (`usuarioId`,`programaId`),
  KEY `programaId` (`programaId`),
  CONSTRAINT `favorito_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `favorito_ibfk_2` FOREIGN KEY (`programaId`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES (1,1,1,'2024-06-15 10:30:00'),(2,2,2,'2024-07-20 14:20:00'),(3,3,3,'2024-08-10 09:15:00'),(4,4,4,'2024-09-05 16:45:00'),(5,5,5,'2024-10-01 11:00:00');
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuarioId` int NOT NULL,
  `mensaje` text NOT NULL,
  `fechaEnvio` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
INSERT INTO `notificacion` VALUES (1,1,'Tu programa favorito Cortá por Lozano comienza en 15 minutos','2024-10-09 13:30:00'),(2,2,'Nueva encuesta disponible en Telefe Noticias','2024-10-09 19:30:00'),(3,3,'Bendita TV está por comenzar. ¡No te lo pierdas!','2024-10-09 21:15:00'),(4,4,'Nueva trivia disponible en Nadie Dice Nada','2024-10-09 14:45:00'),(5,5,'Tu suscripción VIP a Gelatina ha sido renovada','2024-10-09 10:00:00'),(6,1,'Tu programa favorito Cortá por Lozano comienza en 15 minutos','2024-10-09 13:30:00'),(7,2,'Nueva encuesta disponible en Telefe Noticias','2024-10-09 19:30:00'),(8,3,'Bendita TV está por comenzar. ¡No te lo pierdas!','2024-10-09 21:15:00'),(9,4,'Nueva trivia disponible en Nadie Dice Nada','2024-10-09 14:45:00'),(10,5,'Tu suscripción VIP a Gelatina ha sido renovada','2024-10-09 10:00:00');
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encuestaId` int NOT NULL,
  `opcion` varchar(255) NOT NULL,
  `trivia_id` int NOT NULL,
  PRIMARY KEY (`id`,`trivia_id`),
  KEY `encuestaId` (`encuestaId`),
  KEY `fk_opciones_trivia1_idx` (`trivia_id`),
  CONSTRAINT `fk_opciones_trivia1` FOREIGN KEY (`trivia_id`) REFERENCES `trivia` (`id`),
  CONSTRAINT `opcionencuesta_ibfk_1` FOREIGN KEY (`encuestaId`) REFERENCES `encuesta` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
INSERT INTO `opciones` VALUES (6,1,'Cocina',1),(7,1,'Entrevistas',1),(8,2,'Política',2),(9,2,'Economía',2),(10,3,'Beto Casella',3),(11,1,'Cocina',1),(12,1,'Entrevistas',1),(13,2,'Política',2),(14,2,'Economía',2),(15,3,'Beto Casella',3);
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palabraprohibida`
--

DROP TABLE IF EXISTS `palabraprohibida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palabraprohibida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `palabra` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `palabra` (`palabra`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palabraprohibida`
--

LOCK TABLES `palabraprohibida` WRITE;
/*!40000 ALTER TABLE `palabraprohibida` DISABLE KEYS */;
INSERT INTO `palabraprohibida` VALUES (4,'groseria1'),(2,'insulto1'),(3,'insulto2'),(5,'ofensa1'),(1,'spam');
/*!40000 ALTER TABLE `palabraprohibida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programa`
--

DROP TABLE IF EXISTS `programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `categoria` enum('Noticias','Entretenimiento','Deportes','Tecnologia','Cultura','Lifestyle') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `duracion_minutos` int NOT NULL,
  `especial` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programa`
--

LOCK TABLES `programa` WRITE;
/*!40000 ALTER TABLE `programa` DISABLE KEYS */;
INSERT INTO `programa` VALUES (1,'Cortá por Lozano','Programa de entretenimiento conducido por Verónica Lozano con invitados, juegos y actualidad','Entretenimiento','2020-03-01',NULL,120,0),(2,'Telefe Noticias','Noticiero central de Telefe con Rodolfo Barili','Noticias','2015-01-01',NULL,60,0),(3,'Bendita TV','Programa de humor y actualidad conducido por Beto Casella','Entretenimiento','2005-03-14',NULL,90,0),(4,'Nadie Dice Nada','Streaming de humor con Nico Occhiato en Luzu TV','Entretenimiento','2022-06-01',NULL,180,0),(5,'Gelatina','Programa de streaming conducido por Migue Granados en Olga','Cultura','2021-09-15',NULL,120,0),(6,'Cortá por Lozano','Programa de entretenimiento conducido por Verónica Lozano con invitados, juegos y actualidad','Entretenimiento','2020-03-01',NULL,120,0),(7,'Telefe Noticias','Noticiero central de Telefe con Rodolfo Barili','Noticias','2015-01-01',NULL,60,0),(8,'Bendita TV','Programa de humor y actualidad conducido por Beto Casella','Entretenimiento','2005-03-14',NULL,90,0),(9,'Nadie Dice Nada','Streaming de humor con Nico Occhiato en Luzu TV','Entretenimiento','2022-06-01',NULL,180,0),(10,'Gelatina','Programa de streaming conducido por Migue Granados en Olga','Cultura','2021-09-15',NULL,120,0),(11,'Cortá por Lozano','Programa de entretenimiento conducido por Verónica Lozano con invitados, juegos y actualidad','Entretenimiento','2020-03-01',NULL,120,0),(12,'Telefe Noticias','Noticiero central de Telefe con Rodolfo Barili','Noticias','2015-01-01',NULL,60,0),(13,'Bendita TV','Programa de humor y actualidad conducido por Beto Casella','Entretenimiento','2005-03-14',NULL,90,0),(14,'Nadie Dice Nada','Streaming de humor con Nico Occhiato en Luzu TV','Entretenimiento','2022-06-01',NULL,180,0),(15,'Gelatina','Programa de streaming conducido por Migue Granados en Olga','Cultura','2021-09-15',NULL,120,0),(16,'Cortá por Lozano','Programa de entretenimiento conducido por Verónica Lozano con invitados, juegos y actualidad','Entretenimiento','2020-03-01',NULL,120,0),(17,'Telefe Noticias','Noticiero central de Telefe con Rodolfo Barili','Noticias','2015-01-01',NULL,60,0),(18,'Bendita TV','Programa de humor y actualidad conducido por Beto Casella','Entretenimiento','2005-03-14',NULL,90,0),(19,'Nadie Dice Nada','Streaming de humor con Nico Occhiato en Luzu TV','Entretenimiento','2022-06-01',NULL,180,0),(20,'Gelatina','Programa de streaming conducido por Migue Granados en Olga','Cultura','2021-09-15',NULL,120,0);
/*!40000 ALTER TABLE `programa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programacion`
--

DROP TABLE IF EXISTS `programacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `programa_id` int NOT NULL,
  `fecha` date NOT NULL,
  `franja` enum('MANANIA','TARDE','NOCHE','TRASNOCHE') NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `dia` enum('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `programaId` (`programa_id`),
  CONSTRAINT `programacion_ibfk_1` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programacion`
--

LOCK TABLES `programacion` WRITE;
/*!40000 ALTER TABLE `programacion` DISABLE KEYS */;
INSERT INTO `programacion` VALUES (1,1,'2024-10-09','TARDE','13:45:00','15:45:00','MIERCOLES'),(2,2,'2024-10-09','NOCHE','20:00:00','21:00:00','MIERCOLES'),(3,3,'2024-10-09','NOCHE','21:30:00','23:00:00','MIERCOLES'),(4,4,'2024-10-09','TARDE','15:00:00','18:00:00','MIERCOLES'),(5,5,'2024-10-09','TARDE','17:00:00','19:00:00','MIERCOLES'),(6,1,'2024-10-09','TARDE','13:45:00','15:45:00','MIERCOLES'),(7,2,'2024-10-09','NOCHE','20:00:00','21:00:00','MIERCOLES'),(8,3,'2024-10-09','NOCHE','21:30:00','23:00:00','MIERCOLES'),(9,4,'2024-10-09','TARDE','15:00:00','18:00:00','MIERCOLES'),(10,5,'2024-10-09','TARDE','17:00:00','19:00:00','MIERCOLES'),(11,1,'2024-10-09','TARDE','13:45:00','15:45:00','MIERCOLES'),(12,2,'2024-10-09','NOCHE','20:00:00','21:00:00','MIERCOLES'),(13,3,'2024-10-09','NOCHE','21:30:00','23:00:00','MIERCOLES'),(14,4,'2024-10-09','TARDE','15:00:00','18:00:00','MIERCOLES'),(15,5,'2024-10-09','TARDE','17:00:00','19:00:00','MIERCOLES'),(16,1,'2024-10-09','TARDE','13:45:00','15:45:00','MIERCOLES'),(17,2,'2024-10-09','NOCHE','20:00:00','21:00:00','MIERCOLES'),(18,3,'2024-10-09','NOCHE','21:30:00','23:00:00','MIERCOLES'),(19,4,'2024-10-09','TARDE','15:00:00','18:00:00','MIERCOLES'),(20,5,'2024-10-09','TARDE','17:00:00','19:00:00','MIERCOLES');
/*!40000 ALTER TABLE `programacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programastaff`
--

DROP TABLE IF EXISTS `programastaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programastaff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `programaId` int NOT NULL,
  `staffId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `programaId` (`programaId`),
  KEY `staffId` (`staffId`),
  CONSTRAINT `programastaff_ibfk_1` FOREIGN KEY (`programaId`) REFERENCES `programa` (`id`) ON DELETE CASCADE,
  CONSTRAINT `programastaff_ibfk_2` FOREIGN KEY (`staffId`) REFERENCES `staff` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programastaff`
--

LOCK TABLES `programastaff` WRITE;
/*!40000 ALTER TABLE `programastaff` DISABLE KEYS */;
INSERT INTO `programastaff` VALUES (6,1,1),(7,2,2),(8,3,3),(9,4,4),(10,5,5);
/*!40000 ALTER TABLE `programastaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `programa_id` int NOT NULL,
  `contenido` text NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_publicacion` enum('PUBLICADO','PENDIENTE_REVISION') DEFAULT 'PUBLICADO',
  `url_imagen` blob,
  `likes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarioId` (`usuario_id`),
  KEY `programaId` (`programa_id`),
  CONSTRAINT `comentario_ibfk_10` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `comentario_ibfk_20` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (31,1,1,'Verónica estuvo increíble en el programa de hoy. Me encantó el segmento de cocina.','2024-10-09 15:50:00','PUBLICADO',NULL,2),(32,2,2,'Las noticias de hoy fueron muy importantes. Gracias por mantener informada a la gente.','2024-10-09 21:05:00','PUBLICADO',NULL,0),(33,3,3,'Beto y el equipo siempre tan afilados con el humor político. Genios!','2024-10-09 22:45:00','PUBLICADO',NULL,0),(34,4,4,'El streaming argentino llegó para quedarse. Nadie Dice Nada rompe todo.','2024-10-09 17:15:00','PENDIENTE_REVISION',NULL,0),(35,5,5,'Migue Granados es un genio entrevistando. Olga es la mejor plataforma.','2024-10-09 19:00:00','PUBLICADO',NULL,0);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuestatrivia`
--

DROP TABLE IF EXISTS `respuestatrivia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestatrivia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `triviaId` int NOT NULL,
  `usuarioId` int NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `opciones_id` int NOT NULL,
  `opciones_trivia_id` int NOT NULL,
  PRIMARY KEY (`id`,`opciones_id`,`opciones_trivia_id`),
  UNIQUE KEY `triviaId` (`triviaId`,`usuarioId`),
  KEY `usuarioId` (`usuarioId`),
  KEY `fk_respuestatrivia_opciones1_idx` (`opciones_id`,`opciones_trivia_id`),
  CONSTRAINT `fk_respuestatrivia_opciones1` FOREIGN KEY (`opciones_id`, `opciones_trivia_id`) REFERENCES `opciones` (`id`, `trivia_id`),
  CONSTRAINT `respuestatrivia_ibfk_1` FOREIGN KEY (`triviaId`) REFERENCES `trivia` (`id`),
  CONSTRAINT `respuestatrivia_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuestatrivia`
--

LOCK TABLES `respuestatrivia` WRITE;
/*!40000 ALTER TABLE `respuestatrivia` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuestatrivia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rol` enum('Conductor','Productor','Columnista','Operador','CommunityManager') NOT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `redSocial` varchar(45) DEFAULT NULL,
  `biografia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Verónica','Conductor','Lozano','@verolozanoOK','Conductora y actriz argentina'),(2,'Rodolfo','Conductor','Barili','@rbarili','Periodista y conductor de noticias'),(3,'Beto','Conductor','Casella','@betocasella','Conductor y locutor humorístico'),(4,'Nico','Conductor','Occhiato','@nicoocchiato','Conductor y empresario de streaming'),(5,'Migue','Conductor','Granados','@miguegranados','Conductor y comediante'),(6,'Verónica','Conductor','Lozano','@verolozanoOK','Conductora y actriz argentina'),(7,'Rodolfo','Conductor','Barili','@rbarili','Periodista y conductor de noticias'),(8,'Beto','Conductor','Casella','@betocasella','Conductor y locutor humorístico'),(9,'Nico','Conductor','Occhiato','@nicoocchiato','Conductor y empresario de streaming'),(10,'Migue','Conductor','Granados','@miguegranados','Conductor y comediante');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suscripcionvip`
--

DROP TABLE IF EXISTS `suscripcionvip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suscripcionvip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `programa_id` int NOT NULL,
  `fecha_inicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `fecha_fin` datetime DEFAULT NULL,
  `activa` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarioId` (`usuario_id`,`programa_id`),
  KEY `programaId` (`programa_id`),
  CONSTRAINT `suscripcionvip_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  CONSTRAINT `suscripcionvip_ibfk_2` FOREIGN KEY (`programa_id`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suscripcionvip`
--

LOCK TABLES `suscripcionvip` WRITE;
/*!40000 ALTER TABLE `suscripcionvip` DISABLE KEYS */;
/*!40000 ALTER TABLE `suscripcionvip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trivia`
--

DROP TABLE IF EXISTS `trivia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trivia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `programaId` int NOT NULL,
  `pregunta` text NOT NULL,
  `respuestaCorrecta` varchar(255) NOT NULL,
  `fechaCreacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `programaId` (`programaId`),
  CONSTRAINT `trivia_ibfk_1` FOREIGN KEY (`programaId`) REFERENCES `programa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trivia`
--

LOCK TABLES `trivia` WRITE;
/*!40000 ALTER TABLE `trivia` DISABLE KEYS */;
INSERT INTO `trivia` VALUES (1,1,'¿En qué año comenzó Cortá por Lozano?','2020','2024-10-09 13:30:00'),(2,2,'¿Quién conduce Telefe Noticias?','Rodolfo Barili','2024-10-09 19:45:00'),(3,3,'¿En qué año arrancó Bendita TV?','2005','2024-10-09 21:15:00'),(4,4,'¿En qué plataforma se transmite Nadie Dice Nada?','Luzu TV','2024-10-09 15:00:00'),(5,5,'¿Quién conduce Gelatina?','Migue Granados','2024-10-09 17:00:00'),(6,1,'¿En qué año comenzó Cortá por Lozano?','2020','2024-10-09 13:30:00'),(7,2,'¿Quién conduce Telefe Noticias?','Rodolfo Barili','2024-10-09 19:45:00'),(8,3,'¿En qué año arrancó Bendita TV?','2005','2024-10-09 21:15:00'),(9,4,'¿En qué plataforma se transmite Nadie Dice Nada?','Luzu TV','2024-10-09 15:00:00'),(10,5,'¿Quién conduce Gelatina?','Migue Granados','2024-10-09 17:00:00'),(11,1,'¿En qué año comenzó Cortá por Lozano?','2020','2024-10-09 13:30:00'),(12,2,'¿Quién conduce Telefe Noticias?','Rodolfo Barili','2024-10-09 19:45:00'),(13,3,'¿En qué año arrancó Bendita TV?','2005','2024-10-09 21:15:00'),(14,4,'¿En qué plataforma se transmite Nadie Dice Nada?','Luzu TV','2024-10-09 15:00:00'),(15,5,'¿Quién conduce Gelatina?','Migue Granados','2024-10-09 17:00:00'),(16,1,'¿En qué año comenzó Cortá por Lozano?','2020','2024-10-09 13:30:00'),(17,2,'¿Quién conduce Telefe Noticias?','Rodolfo Barili','2024-10-09 19:45:00'),(18,3,'¿En qué año arrancó Bendita TV?','2005','2024-10-09 21:15:00'),(19,4,'¿En qué plataforma se transmite Nadie Dice Nada?','Luzu TV','2024-10-09 15:00:00'),(20,5,'¿Quién conduce Gelatina?','Migue Granados','2024-10-09 17:00:00');
/*!40000 ALTER TABLE `trivia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contrasena` varchar(255) NOT NULL,
  `fechaRegistro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'martin_2024','martin.gomez@gmail.com','1145678901','$2a$10$hashedpassword1','2024-01-15 10:30:00'),(2,'laura_tv','laura.fernandez@outlook.com','1156789012','$2a$10$hashedpassword2','2024-02-20 14:20:00'),(3,'carlos_fan','carlos.rodriguez@hotmail.com','1167890123','$2a$10$hashedpassword3','2024-03-10 09:15:00'),(4,'ana_streaming','ana.martinez@yahoo.com','1178901234','$2a$10$hashedpassword4','2024-04-05 16:45:00'),(5,'jorge_vip','jorge.lopez@gmail.com','1189012345','$2a$10$hashedpassword5','2024-05-12 11:00:00');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votoencuesta`
--

DROP TABLE IF EXISTS `votoencuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votoencuesta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encuestaId` int NOT NULL,
  `usuarioId` int NOT NULL,
  `opcionId` int NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuarioId` (`usuarioId`,`encuestaId`),
  KEY `encuestaId` (`encuestaId`),
  KEY `opcionId` (`opcionId`),
  CONSTRAINT `votoencuesta_ibfk_1` FOREIGN KEY (`encuestaId`) REFERENCES `encuesta` (`id`),
  CONSTRAINT `votoencuesta_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`id`),
  CONSTRAINT `votoencuesta_ibfk_3` FOREIGN KEY (`opcionId`) REFERENCES `opciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votoencuesta`
--

LOCK TABLES `votoencuesta` WRITE;
/*!40000 ALTER TABLE `votoencuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `votoencuesta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-16  9:31:56
