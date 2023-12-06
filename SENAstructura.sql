/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;

CREATE DATABASE Sena;

USE Sena;

DROP TABLE IF EXISTS aprendiz;
CREATE TABLE `aprendiz` (
  `id_aprendiz` int NOT NULL AUTO_INCREMENT,
  `nombre_aprendiz` varchar(255) DEFAULT NULL,
  `apellido_aprendiz` varchar(50) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`id_aprendiz`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `aprendiz_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS carreras;
CREATE TABLE `carreras` (
  `id_carrera` int NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cursos;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre_curso` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cursos_instructor;
CREATE TABLE `cursos_instructor` (
  `id_instructor` int DEFAULT NULL,
  `id_curso` int DEFAULT NULL,
  KEY `id_instructor` (`id_instructor`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `cursos_instructor_ibfk_1` FOREIGN KEY (`id_instructor`) REFERENCES `instructores` (`id_instructor`),
  CONSTRAINT `cursos_instructor_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS cursos_ruta;
CREATE TABLE `cursos_ruta` (
  `id_curso` int DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  `duracion` time DEFAULT NULL,
  KEY `id_ruta` (`id_ruta`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `cursos_ruta_ibfk_1` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`),
  CONSTRAINT `cursos_ruta_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS especialidad;
CREATE TABLE `especialidad` (
  `id_especialidad` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS instructores;
CREATE TABLE `instructores` (
  `id_instructor` int NOT NULL AUTO_INCREMENT,
  `nombre_instructor` varchar(255) DEFAULT NULL,
  `especialidad` varchar(255) DEFAULT NULL,
  `apellido_instructor` varchar(50) DEFAULT NULL,
  `id_especialidad` int DEFAULT NULL,
  PRIMARY KEY (`id_instructor`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `instructores_ibfk_1` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS matriculas;
CREATE TABLE `matriculas` (
  `id_aprendiz` int DEFAULT NULL,
  `estado_matricula` varchar(100) DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  KEY `id_aprendiz` (`id_aprendiz`),
  KEY `id_ruta` (`id_ruta`),
  CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_aprendiz`) REFERENCES `aprendiz` (`id_aprendiz`),
  CONSTRAINT `matriculas_ibfk_3` FOREIGN KEY (`id_ruta`) REFERENCES `rutas` (`id_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS rutas;
CREATE TABLE `rutas` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `nombre_ruta` varchar(255) DEFAULT NULL,
  `id_carrera` int DEFAULT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `id_carrera` (`id_carrera`),
  CONSTRAINT `rutas_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `carreras` (`id_carrera`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;