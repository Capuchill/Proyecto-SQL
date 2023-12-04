## BASE DE DATOS `SENA`
**1. Agregue un campo Estado_Matrícula a la tabla Matrícula que indique si el estudiante se encuentra “En Ejecución”, “Terminado” o “Cancelado”**

~~~
ALTER TABLE matriculas ADD COLUMN estado_matricula VARCHAR(100); 
~~~
