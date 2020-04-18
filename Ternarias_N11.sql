/*Se tiene un caso hipot�tico de un sistema que almacena informaci�n sobre un festival de cine, en donde esta secci�n de la base de datos
incluye las tablas que en cada una, al final, se definen las restricciones de la relaci�n, en este caso para que sea N11*/

USE FESTIVAL_CINE;
go

--PERSONAS
CREATE TABLE DBO.PERSONAS_N11
(
	COD_PERSONA INT IDENTITY(1,1) NOT NULL,
	NOMBRE NVARCHAR(25) NOT NULL,
	APELLIDO1 NVARCHAR(25) NOT NULL,
	APELLIDO2 NVARCHAR(25),
	PAIS NVARCHAR(30) NOT NULL,
	FOTO NVARCHAR(70) NOT NULL,
	ANYO SMALLINT NOT NULL,
	CONSTRAINT PERSONAS_PK PRIMARY KEY(COD_PERSONA)
);

--PEL�CULAS
CREATE TABLE DBO.PELICULAS_N11
(
	COD_PELICULA INT IDENTITY(1,1) NOT NULL,
	NOMBRE NVARCHAR(25) NOT NULL,
	CARTEL NVARCHAR(70) NOT NULL,
	PRESUPUESTO DECIMAL NOT NULL,
	SAGA_DE INT,
	CONSTRAINT PELICULAS_PK PRIMARY KEY(COD_PELICULA),
	CONSTRAINT PELICULAS_SAGA_FK FOREIGN KEY (SAGA_DE) REFERENCES DBO.PELICULAS_N11(COD_PELICULA)
);

--SALAS
CREATE TABLE DBO.SALAS_N11
(
	COD_SALA INT IDENTITY(1,1) NOT NULL,
	NOMBRE NVARCHAR(25) NOT NULL,
	AFORO SMALLINT NOT NULL,
	TIPO BIT NOT NULL,-- DETERMINA EL TIPO DE SALA
	CONSTRAINT SALAS_PK PRIMARY KEY(COD_SALA)
);

--PROYECCIONES
CREATE TABLE DBO.PROYECCIONES_N11
(
	COD_SALA INT NOT NULL,
	COD_PELICULA INT NOT NULL,
	COD_PERSONA INT NOT NULL,
	FECHA_HORA DATETIME2 NOT NULL,
	CONSTRAINT PROYECCIONES_PK PRIMARY KEY(COD_SALA,COD_PELICULA),
	CONSTRAINT PROYECCIONES_PELICULA_PERSONA_UNIQUE UNIQUE (COD_PELICULA,COD_PERSONA), --RESTRICCI�N DE UNICIDAD
	CONSTRAINT PROYECCIONES_SALA_FK FOREIGN KEY (COD_SALA) REFERENCES DBO.SALAS_N11(COD_SALA),
	CONSTRAINT PROYECCIONES_PERSONA_FK FOREIGN KEY (COD_PERSONA) REFERENCES DBO.PERSONAS_N11(COD_PERSONA),
	CONSTRAINT PROYECCIONES_PELICULA_FK FOREIGN KEY (COD_PELICULA) REFERENCES DBO.PELICULAS_N11(COD_PELICULA)
);
