/* 2023-11-18 19:04:50 [15 ms] */ 
use sena;
show tables;
/* 2023-11-18 19:28:11 [4 ms] */ 
show tables;
show COLUMNS from aprendiz;       

-- Agregar estado de matricula

alter TABLE matriculas add COLUMN estado_matricula VARCHAR(100); 

-- Agregar el campo edad a aprendiz

alter table aprendiz add COLUMN edad INT;

-- Agregar el campo de duración de los cursos

alter Table cursos_ruta ADD COLUMN duracion TIME;

-- Ingresar los datos

INSERT INTO aprendiz (nombre_aprendiz, apellido_aprendiz,edad) VALUES ('Rut','Ortega',18);
INSERT INTO carreras(nombre_carrera) VALUES ('Soldadura');

INSERT INTO cursos (nombre_curso) VALUES ('Microprocesadores')

INSERT INTO instructores (nombre_instructor,apellido_instructor,especialidad) VALUES ('Maria','Monsalve','Electrónica')

INSERT INTO rutas (nombre_ruta) VALUES ('Soldadura Submarina');

INSERT INTO cursos_ruta(id_ruta,id_curso,duracion) VALUES (10,16,'04:00:00')

INSERT INTO cursos_instructor(id_instructor,id_curso) VALUES (6,20)

INSERT INTO matriculas (id_aprendiz,id_ruta,estado_matricula) VALUES (12,7,'En Ejecución')

-- mostrar los datos (verificar)

SELECT * from matriculas;
SHOW COLUMNS FROM matriculas;

show CREATE TABLE matriculas;

SELECT * from rutas;



alter table aprendiz ADD COLUMN apellido_aprendiz VARCHAR(50);
ALTER Table instructores ADD COLUMN apellido_instructor VARCHAR(50);

-- Añadir el campo edad a aprendices

ALTER Table aprendiz DROP COLUMN edad;

ALTER TABLE matriculas DROP FOREIGN KEY matriculas_ibfk_1;

alter TABLE matriculas DROP COLUMN id_curso;
alter TABLE matriculas ADD COLUMN id_ruta INT;
ALTER TABLE matriculas ADD FOREIGN KEY (id_ruta) REFERENCES rutas(id_ruta);
update aprendiz set edad = 26 where id_aprendiz = 1;

ALTER Table rutas ADD COLUMN id_carrera int;
ALTER Table rutas add FOREIGN key (id_carrera) REFERENCES carreras(id_carrera);

UPDATE rutas set id_carrera = 2 where id_ruta = 12;

SELECT * FROM matriculas;
SELECT * FROM aprendiz;

SELECT id_ruta FROM rutas where id_carrera = 2 

-- CONSULTAS

-- Aprendices que cursan la carrera de electronica

SELECT aprendiz.nombre_aprendiz,aprendiz.edad 
from aprendiz 
INNER JOIN matriculas on aprendiz.id_aprendiz = matriculas.id_aprendiz 
where id_ruta in (SELECT id_ruta 
FROM rutas 
where id_carrera = (SELECT id_carrera from carreras where lower(nombre_carrera) = 'electrónica'));
 
-- Cursos que no tienen instructor asignado

SELECT nombre_curso,id_curso 
from cursos 
where id_curso not in (SELECT id_curso FROM cursos_instructor)

-- instructores que dictan la ruta de 'Sistemas de Información Empresariales'

SELECT nombre_instructor 
from instructores 
where id_instructor in 
(SELECT id_instructor FROM cursos_instructor where id_curso in 
(SELECT id_curso from cursos_ruta where id_ruta = (SELECT id_ruta from rutas where nombre_ruta = 'Sistemas de Información Empresariales')));

-- Nombre de los aprendices que cancelaron ruta de aprendizaje

SELECT aprendiz.nombre_aprendiz AS NombreAprendiz, aprendiz.apellido_aprendiz as ApellidoAprendiz, rutas.nombre_ruta as NombreRuta
FROM matriculas
JOIN rutas ON matriculas.id_ruta = rutas.id_ruta
JOIN aprendiz ON matriculas.id_aprendiz = aprendiz.id_aprendiz 
where estado_matricula = 'Cancelado';


-- estudiantes que finalizaron la carrera

SELECT aprendiz.nombre_aprendiz AS NombreAprendiz, aprendiz.apellido_aprendiz as ApellidoAprendiz, rutas.nombre_ruta as NombreRuta, carreras.nombre_carrera as NombreCarrera
FROM matriculas
JOIN rutas ON matriculas.id_ruta = rutas.id_ruta
JOIN aprendiz ON matriculas.id_aprendiz = aprendiz.id_aprendiz 
JOIN carreras ON rutas.id_carrera = carreras.id_carrera
where estado_matricula = 'Terminado'

-- Listar nombre y duracion de cursos que pertenecen a la ruta de "Videojuegos"

SELECT cursos.nombre_curso,duracion from cursos_ruta JOIN  cursos on cursos_ruta.id_curso
= cursos.id_curso
WHERE id_ruta = (SELECT id_ruta from rutas where nombre_ruta = 'Videojuegos');

SELECT aprendiz.nombre_aprendiz, aprendiz.edad
FROM aprendiz 
JOIN matriculas ON matriculas.id_aprendiz = aprendiz.id_aprendiz
JOIN rutas ON rutas.id_ruta = matriculas.id_ruta
JOIN carreras ON carreras.id_carrera = rutas.id_carrera
WHERE carreras.id_carrera = 2;

show COLUMNS from matriculas




SELECT * from rutas;

---- proyecto

use sena;

TRUNCATE TABLE cursos_instructor;

DESCRIBE cursos_ruta;
INSERT INTO cursos_instructor ();

show create table cursos_ruta;

ALTER TABLE aprendiz add COLUMN id_carrera INT;

ALTER Table aprendiz ADD FOREIGN KEY (id_carrera)
REFERENCES carreras(id_carrera);

UPDATE aprendiz Set id_carrera = 1 WHERE id_aprendiz in (1,2,3,4,5);
UPDATE aprendiz Set id_carrera = 3 WHERE id_aprendiz in (10,11);
UPDATE aprendiz Set id_carrera = 2 WHERE id_aprendiz in (6,7,8,9);

CREATE Table especialidad (
    id_especialidad int AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY (id_especialidad)
);

ALTER Table instructores ADD COLUMN id_especialidad int;

ALTER TABLE instructores 
ADD FOREIGN KEY (id_especialidad)
REFERENCES especialidad(id_especialidad);

INSERT INTO especialidad (nombre) VALUES ('')

---------------- CONSULTAS AGAIN ----------------

-- Agregar estado de matricula

alter TABLE matriculas add COLUMN estado_matricula VARCHAR(100); 

-- Agregar el campo edad a aprendiz

alter table aprendiz add COLUMN edad INT;

-- Agregar el campo de duración de los cursos

alter Table cursos_ruta ADD COLUMN duracion TIME;

SELECT nombre_aprendiz , apellido_aprendiz, edad
FROM aprendiz
WHERE id_carrera = 2;

SELECT a.nombre_aprendiz, a.apellido_aprendiz, r.nombre_ruta FROM matriculas
INNER JOIN aprendiz a ON a.id_aprendiz = matriculas.id_aprendiz
INNER JOIN rutas r ON r.id_ruta = matriculas.id_ruta 
WHERE estado_matricula = 'Cancelado';

SELECT nombre_curso FROM cursos where id_curso NOT IN (SELECT id_curso from cursos_instructor);

SELECT DISTINCT i.nombre_instructor, i.apellido_instructor
FROM instructores i 
INNER JOIN cursos_instructor ci ON ci.id_instructor = i.id_instructor
INNER JOIN cursos c ON c.id_curso = ci.id_curso
INNER JOIN cursos_ruta cr ON cr.id_curso = c.id_curso
WHERE cr.id_ruta = 1;

SELECT a.nombre_aprendiz, a.apellido_aprendiz, c.nombre_carrera,r.nombre_ruta FROM matriculas
INNER JOIN aprendiz a ON a.id_aprendiz = matriculas.id_aprendiz
INNER JOIN rutas r ON r.id_ruta = matriculas.id_ruta 
INNER JOIN carreras c ON c.id_carrera = a.id_carrera
WHERE matriculas.estado_matricula = 'Terminado';

SELECT a.nombre_aprendiz, a.apellido_aprendiz 
FROM aprendiz a 
INNER JOIN matriculas m ON m.id_aprendiz = a.id_aprendiz
INNER JOIN rutas r on r.id_ruta = m.id_ruta
INNER JOIN cursos_ruta ON cursos_ruta.id_ruta = r.id_ruta
WHERE cursos_ruta.id_curso = 17;

SELECT nombre_instructor,apellido_instructor FROM instructores where id_instructor NOT IN (SELECT id_instructor from cursos_instructor);


