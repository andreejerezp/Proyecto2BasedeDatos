-- =========================================================
-- CASO 1: SISTEMA DE PARQUES NATURALES Y CONSERVACION
-- Modelo relacional propuesto - MySQL 8.0.16+
-- Archivo reproducible para pruebas en MySQL Workbench.
--
-- ADVERTENCIA:
-- DROP DATABASE elimina la base parques_conservacion si existe,
-- incluyendo todos sus datos y objetos.
-- =========================================================

DROP DATABASE IF EXISTS parques_conservacion;

CREATE DATABASE parques_conservacion
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE parques_conservacion;

-- =========================================================
-- 1. TABLAS BASE
-- =========================================================

CREATE TABLE ROL (
    idRol INT NOT NULL AUTO_INCREMENT,
    nombreRol VARCHAR(80) NOT NULL,
    CONSTRAINT pk_rol PRIMARY KEY (idRol)
) ENGINE = InnoDB;

CREATE TABLE COMUNIDAD_AUTONOMA (
    codigoComunidad VARCHAR(10) NOT NULL,
    nombre VARCHAR(120) NOT NULL,
    organismoResp VARCHAR(150) NOT NULL,
    regionAdmin VARCHAR(120) NOT NULL,
    CONSTRAINT pk_comunidad PRIMARY KEY (codigoComunidad)
) ENGINE = InnoDB;

CREATE TABLE VISITANTE (
    idVisitante INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    contacto VARCHAR(150) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    CONSTRAINT pk_visitante PRIMARY KEY (idVisitante)
) ENGINE = InnoDB;

CREATE TABLE ESPECIE (
    idEspecie INT NOT NULL AUTO_INCREMENT,
    estadoConservacion VARCHAR(80) NOT NULL,
    fechaIncorporacion DATE NOT NULL,
    nombreVulgar VARCHAR(150) NOT NULL,
    denominacionCientifica VARCHAR(180) NOT NULL,
    CONSTRAINT pk_especie PRIMARY KEY (idEspecie)
) ENGINE = InnoDB;

-- =========================================================
-- 2. PARQUE Y TRABAJADOR
-- Las FK se agregan al final para resolver la referencia mutua.
-- =========================================================

CREATE TABLE PARQUE_NATURAL (
    numCorrelativo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    superficie DECIMAL(12,2) NOT NULL,
    fechaDeclaracion DATE NOT NULL,
    anioDeclaracion SMALLINT NOT NULL,
    estadoConservacion VARCHAR(80) NOT NULL,
    presupuesto DECIMAL(15,2) NOT NULL,
    idTrabajador INT NULL,
    codigoComunidadAdministradora VARCHAR(10) NOT NULL,

    CONSTRAINT pk_parque PRIMARY KEY (numCorrelativo),
    CONSTRAINT uq_parque_trabajador UNIQUE (idTrabajador),
    CONSTRAINT chk_parque_superficie CHECK (superficie > 0),
    CONSTRAINT chk_parque_presupuesto CHECK (presupuesto >= 0)
) ENGINE = InnoDB;

CREATE TABLE TRABAJADOR (
    idTrabajador INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    estadoCuenta VARCHAR(40) NOT NULL,
    idRol INT NOT NULL,
    idSupervisor INT NULL,
    numCorrelativo INT NOT NULL,
    CONSTRAINT pk_trabajador PRIMARY KEY (idTrabajador)
) ENGINE = InnoDB;

-- =========================================================
-- 3. ATRIBUTOS MULTIVALUADOS DEL TRABAJADOR
-- =========================================================

CREATE TABLE TRABAJADOR_FUNCIONES (
    idTrabajador INT NOT NULL,
    funciones VARCHAR(100) NOT NULL,
    CONSTRAINT pk_trabajador_funciones
        PRIMARY KEY (idTrabajador, funciones)
) ENGINE = InnoDB;

CREATE TABLE TRABAJADOR_CONTACTO (
    idTrabajador INT NOT NULL,
    datosContacto VARCHAR(150) NOT NULL,
    CONSTRAINT pk_trabajador_contacto
        PRIMARY KEY (idTrabajador, datosContacto)
) ENGINE = InnoDB;

-- =========================================================
-- 4. RELACION TERRITORIAL N:M
-- =========================================================

CREATE TABLE COMPARTEN (
    numCorrelativo INT NOT NULL,
    codigoComunidad VARCHAR(10) NOT NULL,
    porcentajeTerritorial DECIMAL(5,2) NOT NULL,
    CONSTRAINT pk_comparten
        PRIMARY KEY (numCorrelativo, codigoComunidad),
    CONSTRAINT chk_porcentaje_territorial
        CHECK (porcentajeTerritorial >= 0 AND porcentajeTerritorial <= 100)
) ENGINE = InnoDB;

-- =========================================================
-- 5. PROYECTOS CIENTIFICOS Y RELACIONES
-- =========================================================

CREATE TABLE PROYECTO_CIENTIFICO (
    idProyecto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    objetivo TEXT NOT NULL,
    numCorrelativo INT NOT NULL,
    CONSTRAINT pk_proyecto PRIMARY KEY (idProyecto)
) ENGINE = InnoDB;

CREATE TABLE PARTICIPA (
    idTrabajador INT NOT NULL,
    idProyecto INT NOT NULL,
    CONSTRAINT pk_participa PRIMARY KEY (idTrabajador, idProyecto)
) ENGINE = InnoDB;

CREATE TABLE INVESTIGA (
    idProyecto INT NOT NULL,
    idEspecie INT NOT NULL,
    CONSTRAINT pk_investiga PRIMARY KEY (idProyecto, idEspecie)
) ENGINE = InnoDB;

-- =========================================================
-- 6. ESPECIALIZACION DE ESPECIE
-- =========================================================

CREATE TABLE VEGETAL (
    idEspecie INT NOT NULL,
    floracion VARCHAR(120) NOT NULL,
    CONSTRAINT pk_vegetal PRIMARY KEY (idEspecie)
) ENGINE = InnoDB;

CREATE TABLE ANIMAL (
    idEspecie INT NOT NULL,
    alimentacion VARCHAR(150) NOT NULL,
    periodoCelo VARCHAR(120) NOT NULL,
    CONSTRAINT pk_animal PRIMARY KEY (idEspecie)
) ENGINE = InnoDB;

CREATE TABLE MINERAL (
    idEspecie INT NOT NULL,
    caracteristicasMineral TEXT NOT NULL,
    rocas VARCHAR(200) NOT NULL,
    cristales VARCHAR(200) NOT NULL,
    CONSTRAINT pk_mineral PRIMARY KEY (idEspecie)
) ENGINE = InnoDB;

-- =========================================================
-- 7. AREAS Y RELACION PROYECTO-AREA
-- AREA es debil: PK = (numCorrelativo, numInterno).
-- =========================================================

CREATE TABLE AREA (
    numCorrelativo INT NOT NULL,
    numInterno INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    estadoOperativo VARCHAR(60) NOT NULL,
    nivelAcceso VARCHAR(60) NOT NULL,
    extension DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_area PRIMARY KEY (numCorrelativo, numInterno),
    CONSTRAINT chk_area_extension CHECK (extension > 0)
) ENGINE = InnoDB;

CREATE TABLE SE_DESARROLLA_EN (
    idProyecto INT NOT NULL,
    numCorrelativo INT NOT NULL,
    numInterno INT NOT NULL,
    CONSTRAINT pk_se_desarrolla_en
        PRIMARY KEY (idProyecto, numCorrelativo, numInterno)
) ENGINE = InnoDB;

CREATE TABLE INVENTARIO_ESPECIE (
    codigoInventario INT NOT NULL AUTO_INCREMENT,
    cantidadInventario INT NOT NULL,
    fechaUltimoMonitoreo DATE NOT NULL,
    observaciones TEXT NULL,
    idEspecie INT NOT NULL,
    numCorrelativo INT NOT NULL,
    numInterno INT NOT NULL,
    CONSTRAINT pk_inventario PRIMARY KEY (codigoInventario),
    CONSTRAINT chk_cantidad_inventario CHECK (cantidadInventario >= 0)
) ENGINE = InnoDB;

-- =========================================================
-- 8. EXCURSIONES
-- EXCURSION es debil: PK = (numCorrelativo, numInterno,
--                           codigoExcursion).
-- =========================================================

CREATE TABLE EXCURSION (
    numCorrelativo INT NOT NULL,
    numInterno INT NOT NULL,
    codigoExcursion INT NOT NULL,
    modalidad VARCHAR(80) NOT NULL,
    horario VARCHAR(80) NOT NULL,
    fecha DATE NOT NULL,
    capacidad INT NOT NULL,
    CONSTRAINT pk_excursion
        PRIMARY KEY (numCorrelativo, numInterno, codigoExcursion),
    CONSTRAINT chk_excursion_capacidad CHECK (capacidad > 0)
) ENGINE = InnoDB;

-- =========================================================
-- 9. INSCRIPCIONES Y EVALUACIONES
-- =========================================================

CREATE TABLE INSCRIPCION (
    idInscripcion INT NOT NULL AUTO_INCREMENT,
    numCorrelativo INT NOT NULL,
    numInterno INT NOT NULL,
    codigoExcursion INT NOT NULL,
    idVisitante INT NOT NULL,
    asistencia VARCHAR(40) NOT NULL,
    observaciones TEXT NULL,
    CONSTRAINT pk_inscripcion PRIMARY KEY (idInscripcion)
) ENGINE = InnoDB;

CREATE TABLE EVALUACION (
    idInscripcion INT NOT NULL,
    numCorrelativoEval INT NOT NULL,
    fecha DATE NOT NULL,
    calificacion DECIMAL(5,2) NOT NULL,
    comentario TEXT NULL,
    CONSTRAINT pk_evaluacion PRIMARY KEY (idInscripcion)
) ENGINE = InnoDB;

-- =========================================================
-- 10. CLAVES FORANEAS
-- =========================================================

ALTER TABLE PARQUE_NATURAL
    ADD CONSTRAINT fk_parque_comunidad_admin
    FOREIGN KEY (codigoComunidadAdministradora)
    REFERENCES COMUNIDAD_AUTONOMA (codigoComunidad);

ALTER TABLE TRABAJADOR
    ADD CONSTRAINT fk_trabajador_rol
    FOREIGN KEY (idRol)
    REFERENCES ROL (idRol),
    ADD CONSTRAINT fk_trabajador_supervisor
    FOREIGN KEY (idSupervisor)
    REFERENCES TRABAJADOR (idTrabajador),
    ADD CONSTRAINT fk_trabajador_parque
    FOREIGN KEY (numCorrelativo)
    REFERENCES PARQUE_NATURAL (numCorrelativo);

ALTER TABLE PARQUE_NATURAL
    ADD CONSTRAINT fk_parque_trabajador
    FOREIGN KEY (idTrabajador)
    REFERENCES TRABAJADOR (idTrabajador);

ALTER TABLE TRABAJADOR_FUNCIONES
    ADD CONSTRAINT fk_funciones_trabajador
    FOREIGN KEY (idTrabajador)
    REFERENCES TRABAJADOR (idTrabajador);

ALTER TABLE TRABAJADOR_CONTACTO
    ADD CONSTRAINT fk_contacto_trabajador
    FOREIGN KEY (idTrabajador)
    REFERENCES TRABAJADOR (idTrabajador);

ALTER TABLE COMPARTEN
    ADD CONSTRAINT fk_comparten_parque
    FOREIGN KEY (numCorrelativo)
    REFERENCES PARQUE_NATURAL (numCorrelativo),
    ADD CONSTRAINT fk_comparten_comunidad
    FOREIGN KEY (codigoComunidad)
    REFERENCES COMUNIDAD_AUTONOMA (codigoComunidad);

ALTER TABLE PROYECTO_CIENTIFICO
    ADD CONSTRAINT fk_proyecto_parque
    FOREIGN KEY (numCorrelativo)
    REFERENCES PARQUE_NATURAL (numCorrelativo);

ALTER TABLE PARTICIPA
    ADD CONSTRAINT fk_participa_trabajador
    FOREIGN KEY (idTrabajador)
    REFERENCES TRABAJADOR (idTrabajador),
    ADD CONSTRAINT fk_participa_proyecto
    FOREIGN KEY (idProyecto)
    REFERENCES PROYECTO_CIENTIFICO (idProyecto);

ALTER TABLE INVESTIGA
    ADD CONSTRAINT fk_investiga_proyecto
    FOREIGN KEY (idProyecto)
    REFERENCES PROYECTO_CIENTIFICO (idProyecto),
    ADD CONSTRAINT fk_investiga_especie
    FOREIGN KEY (idEspecie)
    REFERENCES ESPECIE (idEspecie);

ALTER TABLE VEGETAL
    ADD CONSTRAINT fk_vegetal_especie
    FOREIGN KEY (idEspecie)
    REFERENCES ESPECIE (idEspecie);

ALTER TABLE ANIMAL
    ADD CONSTRAINT fk_animal_especie
    FOREIGN KEY (idEspecie)
    REFERENCES ESPECIE (idEspecie);

ALTER TABLE MINERAL
    ADD CONSTRAINT fk_mineral_especie
    FOREIGN KEY (idEspecie)
    REFERENCES ESPECIE (idEspecie);

ALTER TABLE AREA
    ADD CONSTRAINT fk_area_parque
    FOREIGN KEY (numCorrelativo)
    REFERENCES PARQUE_NATURAL (numCorrelativo);

ALTER TABLE SE_DESARROLLA_EN
    ADD CONSTRAINT fk_desarrolla_proyecto
    FOREIGN KEY (idProyecto)
    REFERENCES PROYECTO_CIENTIFICO (idProyecto),
    ADD CONSTRAINT fk_desarrolla_area
    FOREIGN KEY (numCorrelativo, numInterno)
    REFERENCES AREA (numCorrelativo, numInterno);

ALTER TABLE INVENTARIO_ESPECIE
    ADD CONSTRAINT fk_inventario_especie
    FOREIGN KEY (idEspecie)
    REFERENCES ESPECIE (idEspecie),
    ADD CONSTRAINT fk_inventario_area
    FOREIGN KEY (numCorrelativo, numInterno)
    REFERENCES AREA (numCorrelativo, numInterno);

ALTER TABLE EXCURSION
    ADD CONSTRAINT fk_excursion_area
    FOREIGN KEY (numCorrelativo, numInterno)
    REFERENCES AREA (numCorrelativo, numInterno);

ALTER TABLE INSCRIPCION
    ADD CONSTRAINT fk_inscripcion_excursion
    FOREIGN KEY (numCorrelativo, numInterno, codigoExcursion)
    REFERENCES EXCURSION (numCorrelativo, numInterno, codigoExcursion),
    ADD CONSTRAINT fk_inscripcion_visitante
    FOREIGN KEY (idVisitante)
    REFERENCES VISITANTE (idVisitante);

ALTER TABLE EVALUACION
    ADD CONSTRAINT fk_evaluacion_inscripcion
    FOREIGN KEY (idInscripcion)
    REFERENCES INSCRIPCION (idInscripcion);

-- =========================================================
-- 11. VERIFICACION DE LA ESTRUCTURA
-- =========================================================

SHOW TABLES;

SELECT
    COUNT(*) AS total_tablas
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'parques_conservacion'
  AND TABLE_TYPE = 'BASE TABLE';

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'parques_conservacion'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME, CONSTRAINT_NAME;

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    CHECK_CLAUSE
FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
WHERE CONSTRAINT_SCHEMA = 'parques_conservacion';

-- Fin del script.
