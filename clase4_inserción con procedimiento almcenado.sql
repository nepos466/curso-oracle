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
select sec_persona.nextval INTO my_id from DUAL;
insert into persona values(my_id,my_nombre,my_edad);
END;
/
