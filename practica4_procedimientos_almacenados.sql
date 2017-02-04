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
guardar_persona(valor,'ivan',23);
END;
/

select * from persona;
-- Tarea
-- Investigar la inyección SQL y porque no es bueno usar SELECT,INSERT, UPDATE, DELETE.
-- Y subirlo al wiki en GitHub.
----------------------Practica 4------------------------------
--4 feb 17
--creamos la tabla trabajador..
CREATE TABLE TRABAJADOR(SEGURO_SOCIAL INTEGER, NOMBRE VARCHAR2(80), PATERNO VARCHAR2(80),
--RESTRICCION ES EL NOMBRE UNICO Y NO SE DEBE REPETIR, Y RECAE SOBRE EL CMAPO SEGURO SOCIAL.
                        CONSTRAINT PK_TRABAJADOR PRIMARY KEY(SEGURO_SOCIAL));
                
-- CREAMOS LA SECUANCIA PARA LA NOMINA.
CREATE SEQUENCE SEC_NOMINA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--CREAMOS LA SEGUNDA TABLA--
CREATE TABLE NOMINA(ID_NOMINA INTEGER, SEGURO_SOCIAL INTEGER, HORAS_LABORADAS INTEGER, FECHA_PAGO DATE, SALDO FLOAT,
                        CONSTRAINT PK_ID_NOMINA PRIMARY KEY(ID_NOMINA), CONSTRAINT FK1_SEGURO_SOCIAL FOREIGN KEY(SEGURO_SOCIAL)
                        REFERENCES TRABAJADOR(SEGURO_SOCIAL) );
                        
--PROCEDIMIENTO PARA GUARDAR TRABAJADOR
CREATE OR REPLACE PROCEDURE GUARDAR_TRABAJADOR(MY_ID IN INTEGER,
                                               MY_NOMBRE IN VARCHAR2, MY_PATERNO IN VARCHAR2) AS
                                               BEGIN
                                               INSERT INTO TRABAJADOR VALUES(MY_ID, MY_NOMBRE, MY_PATERNO);
                                               END;
                                               /
CREATE OR REPLACE PROCEDURE GUARDAR_NOMINA(MY_ID_NOMINA OUT INTEGER,
MY_SEGURO_SOCIAL IN INTEGER) AS
BEGIN
SELECT SEC_NOMINA.NEXTVAL INTO MY_ID_NOMINA FROM DUAL;
INSERT INTO NOMINA(ID_NOMINA, SEGURO_SOCIAL) VALUES(MY_ID_NOMINA, MY_SEGURO_SOCIAL);
END;
/
