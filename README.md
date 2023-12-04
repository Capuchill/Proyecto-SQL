# BASE DE DATOS `SENA`

### `PUNTOS A RESOLVER:`

**1. Agregue un campo Estado_Matrícula a la tabla Matrícula que indique si el estudiante se encuentra “En Ejecución”, “Terminado” o “Cancelado”**

~~~sql
ALTER TABLE matriculas ADD COLUMN estado_matricula VARCHAR(100); 
~~~

**2. Agregue a el campo edad a la tabla de Aprendices.**

~~~sql
ALTER TABLE aprendiz ADD COLUMN edad INT;
~~~

**3. Si suponemos que los cursos tienen una duración diferente dependiendo de la ruta que lo contenga ¿qué modificación haría a la estructura de datos ya planteada?**

~~~sql
-- Dado que, el atributo pertenece a la relacion entre ruta y curso se agrega a la tabla que las une.

ALTER TABLE cursos_ruta ADD COLUMN duracion TIME;
~~~