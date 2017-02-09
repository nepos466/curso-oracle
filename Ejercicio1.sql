set serveroutput on;


--generamos la secuencia
CREATE SEQUENCE SEC_PELICULA
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE SEQUENCE SEC_HORARIO
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

--GENERAMOS LA TABLA

CREATE TABLE PELICULA (ID_PELICULA INTEGER, TITULO VARCHAR(20), SINOPSIS VARCHAR(20), CONSTRAINT PK_ID_PELICULA PRIMARY KEY(ID_PELICULA));

CREATE TABLE SALAS (NUM_SALA INTEGER, ID_PELICULA INTEGER, CONSTRAINT PK_NUM_SALA PRIMARY KEY(NUM_SALA), CONSTRAINT FK1_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA));

CREATE TABLE HORARIO (ID_HORARIO INTEGER, ID_PELICULA INTEGER, FECHA DATE, 
CONSTRAINT PK_ID_HORARIO PRIMARY KEY(ID_HORARIO), 
CONSTRAINT FK2_ID_PELICULA FOREIGN KEY(ID_PELICULA) REFERENCES PELICULA(ID_PELICULA));




--el PK es un dato de salida porque se genera, nombre y edad son entrada porque alimentan al sistema.
--cuando se haga una inserción en oracle.
create or replace procedure guardar_pelicula(my_id_pelicula out integer,
                  my_titulo IN varchar2, my_sinopsis IN varchar2)
AS
BEGIN
-- esto es un curso, es un join desde la prespectiva de oracle, lo cual unira dos estructuras su tabla y su secuencia persona.
select sec_pelicula.nextval INTO my_id_pelicula from DUAL;
insert into pelicula values(my_id_pelicula, my_titulo, my_sinopsis);
END;
/
---------------------------
create or replace procedure guarda_salas(my_num_salas IN integer, my_id_pelicula IN integer)
AS
BEGIN
insert into salas values(my_num_salas, my_id_pelicula);
END;
/
---------------------------
create or replace procedure guardar_horario(my_id_horario OUT integer, my_id_pelicula IN integer, my_fecha IN date)
AS
BEGIN
select sec_horario.netxval INTO my_id_horario from DUAL;
insert into horario values(my_id_horario, my_id_pelicula, my_fecha);
END;
/
