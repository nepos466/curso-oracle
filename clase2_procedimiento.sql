set serveroutput on;

--Recapitulando lo que es un bloque..

DECLARE 
nombre varchar2(20):='IVAN';
BEGIN
DBMS_OUTPUT.PUT_LINE('BUENAS NOCHES '||nombre);
END;
/
-- los tipos de variables siempre van debajo declare.
DECLARE
edad integer:=23;
dias integer;
estatus varchar2(12);
BEGIN
dias:=edad*365;

-- ESTRUTURA DE CONTROL.
      IF dias > 10000 THEN
          estatus:='Viejo';
          ELSE 
            estatus:='Joven';
      END IF;

DBMS_OUTPUT.PUT_LINE('TU EDAD EN DIAS ES '||dias||' ESTATUS: '||estatus);
END;
/

--Verremos nuestro primer procedimeinto almacenado.
--OR REPLACE, SOLO SI QUEREMOS ALIMENTARLO VA ENTRE PARENTESIS

CREATE OR REPLACE PROCEDURE saludar(mensaje IN varchar2)
--AS ES EL DECLEARE 
AS


BEGIN
DBMS_OUTPUT.PUT_LINE('HOLA BUENAS NOCHES '||mensaje);
END;
/

--EJECUTAMOS EL PROCEDIMIENTO....

exec saludar('Ivancito');

--generamos la secuencia
CREATE SEQUENCE SEC_PERSONA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--GENERAMOS LA TABLA
CREATE TABLE PERSONA (ID_PERSONA INTEGER, NOMBRE VARCHAR2(20), EDAD INTEGER, CONSTRAINT PK_ID_PERSONA PRIMARY KEY (ID_PERSONA));
