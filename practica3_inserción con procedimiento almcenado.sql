set serveroutput on;

--generamos la secuencia
CREATE SEQUENCE SEC_PERSONA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--GENERAMOS LA TABLA
CREATE TABLE PERSONA (ID_PERSONA INTEGER, NOMBRE VARCHAR2(20), EDAD INTEGER, CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));

--el PK es un dato de salida porque se genera, nombre y edad son entrada porque alimentan al sistema.
--cuando se haga una inserción en oracle.
create or replace procedure guardar_persona(my_id OUT integer,
                  my_nombre IN varchar2, my_edad IN integer)
AS
BEGIN
-- esto es un curso, es un join desde la prespectiva de oracle, lo cual unira dos estructuras su tabla y su secuencia persona.
select sec_persona.nextval INTO my_id from DUAL;
insert into persona values(my_id,my_nombre,my_edad);
END;
/
-- declarando dentro de una estructura PL/sql para guardar los valores,valor es donde se almacena el PK.
DECLARE
valor integer;
BEGIN 
guardar_persona(valor,'javier',23);
END;
/

select * from persona;

-- Tarea
-- porque no es bueno usar SELECT,INSERT, UPDATE, DELETE.
-- Y subirlo al wiki en GitHub.



