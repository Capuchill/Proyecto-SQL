/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET SQL_NOTES=0 */;
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

INSERT INTO aprendiz(id_aprendiz,nombre_aprendiz,apellido_aprendiz,edad,id_carrera) VALUES('1','\'Carlos\'','\'Gomez\'','26','1'),('2','\'Leyla\'','\'Delgado\'','19','1'),('3','\'Juan\'','\'Cardona\'','22','1'),('4','\'Sergio\'','\'Contreras\'','20','1'),('5','\'Ana\'','\'Velazquez\'','21','1'),('6','\'Gustavo\'','\'Noriega\'','23','2'),('7','\'Pedro\'','\'Gomez\'','23','2'),('8','\'Jairo\'','\'Castro\'','18','2'),('9','\'Henry\'','\'Vega\'','18','2'),('10','\'Antonio\'','\'Cañate\'','17','3'),('11','\'Daniel \'','\'Simancas\'','20','3');

INSERT INTO carreras(id_carrera,nombre_carrera) VALUES('1','\'Desarrollo de Software\''),('2','\'Electrónica\''),('3','\'Mecánica Automotriz\''),('4','\'Seguridad y Salud Ocupacional\''),('5','\'Soldadura\'');

INSERT INTO cursos(id_curso,nombre_curso) VALUES('1','\'Matemáticas Básicas\''),('2','\'Álgebra Computacional\''),('3','\'Programación Básica\''),('4','\'Inglés\''),('5','\'Electrónica Básica\''),('6','\'Motor de Cuatro Tiempos\''),('7','\'Enfermedades Laborales\''),('8','\'Higiene Postural en el Trabajo\''),('9','\'Ergonomía\''),('10','\'Legislación Laboral en Colombia\''),('11','\'Materiales de Soldadura\''),('12','\'Métodos de Soldadura\''),('13','\'Fusión de Metales\''),('14','\'Buceo 1\''),('15','\'Buceo 2\''),('16','\'Riesgo Eléctrico\''),('17','\'Bases de Datos Relacionales\''),('18','\'Bases de Datos NO Relacionales\''),('19','\'Electrónica Digital\''),('20','\'Microprocesadores\'');

INSERT INTO cursos_instructor(id_instructor,id_curso) VALUES('1','2'),('2','17'),('2','18'),('3','3'),('3','11'),('3','13'),('4','1'),('5','4'),('6','19'),('7','5'),('7','20');

INSERT INTO cursos_ruta(id_curso,id_ruta,duracion) VALUES('1','1','\'01:30:00\''),('4','1','\'02:00:00\''),('18','1','\'01:40:00\''),('3','1','\'01:40:00\''),('2','1','\'01:40:00\''),('17','1','\'02:40:00\''),('1','2','\'02:40:00\''),('2','2','\'02:40:00\''),('3','2','\'02:40:00\''),('4','2','\'02:40:00\''),('4','3','\'03:30:00\''),('3','3','\'03:30:00\''),('17','3','\'03:30:00\''),('5','4','\'04:00:00\''),('19','4','\'04:00:00\''),('20','4','\'04:00:00\''),('5','5','\'10:30:00\''),('19','5','\'03:49:08\''),('11','11','\'03:50:10\''),('13','11','\'06:40:46\''),('11','10','\'01:59:09\''),('14','10','\'08:00:00\'');

INSERT INTO especialidad(id_especialidad,nombre) VALUES('1','\'Sistemas\''),('2','\'Salud Ocupacional\''),('3','\'Soldadura\''),('4','\'Mecanica\''),('5','\'Ingles\''),('6','\'Electronica\'');

INSERT INTO instructores(id_instructor,nombre_instructor,especialidad,apellido_instructor,id_especialidad) VALUES('1','\'Ricardo\'','\'Sistemas\'','\'Jaimes\'','1'),('2','\'Marinela\'','\'Salud Ocupacional\'','\'Narvaez\'','2'),('3','\'Agustin\'','\'Soldadura\'','\'Parra\'','3'),('4','\'Nelson\'','\'Mecánica\'','\'Buitrago\'','4'),('5','\'Roy\'','\'Inglés\'','\'Llamas\'','5'),('6','\'Maria\'','\'Electrónica\'','\'Monsalve\'','6'),('7','\'Juan\'','\'Electronica\'','\'Cobos\'','6'),('8','\'Pedro\'','\'Sistemas\'','\'Santamaria\'','1'),('9','\'Andrea\'','\'Sistemas\'','\'Gonzales\'','1'),('10','\'Marisela\'','\'Salud Ocupacional\'','\'Sevilla\'','2');

INSERT INTO matriculas(id_aprendiz,estado_matricula,id_ruta) VALUES('1','\'Activo\'','1'),('2','\'Activo\'','1'),('3','\'Cancelado\'','2'),('4','\'Activo\'','2'),('5','\'Activo\'','3'),('6','\'Terminado\'','4'),('7','\'Terminado\'','4'),('8','\'Terminado\'','5'),('9','\'Cancelado\'','5'),('10','\'Terminado\'','11'),('11','\'Terminado\'','10');
INSERT INTO rutas(id_ruta,nombre_ruta,id_carrera) VALUES('1','\'Sistemas de Información Empresariales\'','1'),('2','\'Videojuegos\'','1'),('3','\'Machine Learning\'','1'),('4','\'Microcontroladores\'','2'),('5','\'Robótica\'','2'),('6','\'Dispositivos Bio-médicos\'','4'),('7','\'Motores Híbridos\'','3'),('8','\'Vehículos de Uso Agrícola\'','3'),('9','\'Sistemas de Gestión en Seguridad Ocupacional\'','3'),('10','\'Soldadura Atógena Industrial\'','5'),('11','\'Soldadura Eléctrica Industrial\'','5'),('12','\'Soldadura Submarina\'','5');