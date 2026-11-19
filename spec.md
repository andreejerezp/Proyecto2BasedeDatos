# SPEC.md — Borrador de Especificación Técnica (Fase 2)

**Asignatura:** TDFI103 - Bases de Datos[cite: 1, 19]  
**Proyecto:** Fase 2: Implementación de Base de Datos y Producto Mínimo Viable asistido por IA[cite: 1]  
**Caso:** Caso 1 - Sistema Integral de Gestión de Parques Naturales y Conservación Ambiental[cite: 1, 10]  
**Grupo:** Grupo 1 — Agustín Medina Zuñiga, Agustín Jerez Prado, Cristóbal Pastrian Garrido[cite: 10]  
**Estado de decisiones de diseño:** Todas las decisiones (`DD-01` a `DD-09`) figuran como **Pendiente** en `DECISIONES_DISENO.md`[cite: 30].

---

## 1. Objetivo y alcance

* **Propósito de Fase 2:** Continuar el trabajo de la Fase 1 corrigiendo el Modelo Entidad-Relación Extendido (MERE) y el modelo relacional, implementando la base de datos en MySQL 8.x, poblarla con datos sintéticos coherentes y suficientes, resolver 12 requerimientos de información mediante 6 vistas y 6 procedimientos almacenados, construir un Producto Mínimo Viable (PMV) integrado en Python/Streamlit sobre la misma base de datos y desplegarlo mediante Docker y Docker Compose[cite: 1, 2].
* **Uso de IA y validación:** La Inteligencia Artificial (OpenCode) se utiliza como herramienta de apoyo al desarrollo, pero cada estudiante debe comprender, revisar, ejecutar y validar todas las decisiones de modelamiento, sentencias SQL, código Python, reglas de negocio, resultados y configuraciones de cara a la disertación y defensa individual[cite: 1, 2, 7, 9].
* **Entregables en Canvas:** Informe final (con las 13 secciones obligatorias), Script integral SQL, Script de generación de datos, Código fuente PMV (Python/Streamlit y archivos requeridos), Docker (`Dockerfile` y `docker-compose.yml`) y Documento de disertación[cite: 1, 8, 9].
* **Alcance de esta especificación:** Establece el marco técnico y funcional de Fase 2 para el Caso 1, respetando que ninguna decisión de diseño (`DD-01` a `DD-09`) ha sido aprobada aún en `DECISIONES_DISENO.md`[cite: 1, 2, 30].

---

## 2. Requisitos obligatorios y su origen

* **Herramientas obligatorias:** ERDPlus o equivalente (MERE), MySQL 8.x, MySQL Workbench, Python 3.12+, SQLAlchemy + PyMySQL, Faker, Pandas, Plotly, Streamlit, OpenCode y Docker + Docker Compose[cite: 2]. *(Origen: Enunciado Fase 2, Sec. 3)*[cite: 2]
* **Corrección del MERE y modelo relacional:** Incorporar observaciones y correcciones de Fase 1, mantener coherencia entre reglas de negocio, MERE, especializaciones/generalizaciones y modelo relacional, y construir en MySQL Workbench tablas, atributos, tipos de datos, PK, FK, `NOT NULL`, `UNIQUE`, `CHECK` y otras restricciones justificadas[cite: 3, 19]. *(Origen: Enunciado Fase 2, Sec. 2, 4, 5, 13; Rúbrica, Crit. 1)*[cite: 2, 3, 8, 19]
* **Script integral ejecutable:** Script ejecutable de principio a fin que reconstruya la BD desde cero (creación de BD, tablas, restricciones/claves/relaciones, inserción o carga de datos, 6 vistas y 6 procedimientos almacenados), sin depender de objetos creados manualmente en Workbench sin respaldar[cite: 1, 2, 6, 19]. *(Origen: Enunciado Fase 2, Sec. 1, 2, 8; Rúbrica, Crit. 1, 2, 3)*[cite: 1, 2, 6, 19]
* **Poblamiento sintético coherente y reproducible:** Generar datos suficientes, variados, coherentes y reproducibles para validar los 12 requerimientos y las visualizaciones[cite: 1, 2, 3, 4, 19]. *(Origen: Enunciado Fase 2, Sec. 1, 2, 4, 6; Rúbrica, Crit. 2)*[cite: 1, 2, 3, 4, 19]
* **12 Requerimientos de información (SQL avanzado):** Resolver R1–R12 mediante 6 vistas y 6 procedimientos almacenados con parámetros `IN` útiles, documentados en el informe con pregunta, código, sentencia de consulta/ejecución, captura en Workbench e interpretación de 2 a 4 líneas; no sustituyen las 4 funcionalidades del PMV[cite: 2, 5, 6, 19]. *(Origen: Enunciado Fase 2, Sec. 2, 7, 9; Rúbrica, Crit. 3)*[cite: 2, 5, 6, 19]
* **Cuatro funcionalidades obligatorias del PMV:** Formulario transaccional, CRUD de al menos 2 tablas maestras/básicas, control de usuarios con inicio de sesión y al menos 2 roles con permisos diferenciados, y dashboard con las 3 preguntas de Fase 1 más una 4ª pregunta propuesta y justificada por el equipo, conectadas a la misma BD[cite: 2, 6, 7, 19]. *(Origen: Enunciado Fase 2, Sec. 2, 10, 10.1; Rúbrica, Crit. 4)*[cite: 2, 6, 7, 19]
* **Arquitectura y trazabilidad del PMV:** Separación entre interfaz/presentación, lógica y acceso a datos (DAO o capa equivalente), conexión centralizada, consultas parametrizadas, manejo básico de errores y gestión/cierre de recursos, y dependencias en `requirements.txt`[cite: 20]. *(Origen: Rúbrica, Crit. 5)*[cite: 20]
* **Despliegue con Docker:** Incluir `Dockerfile` (instalando dependencias desde `requirements.txt`) y `docker-compose.yml` (servicios `app` y `db`, MySQL 8.x versionada, volumen persistente, puertos, variables de entorno, gestión de disponibilidad de BD e inicialización con scripts), ejecutables con `docker compose up --build` y con instrucciones mínimas documentadas[cite: 1, 2, 7, 20]. *(Origen: Enunciado Fase 2, Sec. 1, 2, 12; Rúbrica, Crit. 6)*[cite: 1, 2, 7, 20]
* **Gestión, bitácoras y uso de IA:** Evidenciar uso de OpenCode y validación; completar matriz de responsabilidades (cada integrante con responsabilidad principal en más de una etapa; las 4 funcionalidades del PMV con responsables principales distintos; distribución equilibrada) y bitácoras individuales con síntesis final[cite: 1, 2, 7, 8, 9, 20]. *(Origen: Enunciado Fase 2, Sec. 1, 2, 11, 14, 15; Rúbrica, Crit. 7, 10, 11)*[cite: 1, 2, 7, 8, 9, 20, 21]
* **Informe y disertación/defensa:** Entregar informe de 13 secciones y realizar exposición de 10 minutos + 5 minutos de preguntas de defensa, con participación de todos los integrantes, diapositivas requeridas y demostración del PMV funcionando[cite: 1, 8, 9, 20, 21]. *(Origen: Enunciado Fase 2, Sec. 1, 13, 16; Rúbrica, Crit. 8, 9, 10, 11)*[cite: 1, 8, 9, 20, 21]

---

## 3. Actores y casos de uso

* **Actores:**
  * **Comunidad autónoma:** Vinculada a la administración y compartición territorial de parques naturales[cite: 11, 13, 14].
  * **Personal / Trabajador (incluyendo supervisores e investigadores):** Desempeña funciones (gestión, vigilancia, conservación, investigación), participa en proyectos científicos, se vincula a parques/áreas y puede tener supervisión o cuenta de usuario asociada[cite: 4, 5, 11, 13, 14].
  * **Visitante:** Realiza inscripciones a excursiones y genera evaluaciones asociadas a sus inscripciones[cite: 12, 13, 16].
  * **Usuarios del PMV (al menos 2 roles diferenciados):** Cuentas asociadas al personal con permisos diferenciados sobre funcionalidades del PMV *(roles y permisos **Pendientes — DD-06**)*[cite: 4, 6, 30].
  * **Integrantes del Grupo 1 (Agustín Medina Zuñiga, Agustín Jerez Prado, Cristóbal Pastrian Garrido):** Ejecutan el diseño, implementación, poblamiento, validación, documentación y defensa del proyecto[cite: 1, 9, 10, 21].
  * **Docente / Evaluador:** Evalúa el proyecto grupal, la disertación (10 min) y la defensa individual (5 min)[cite: 9, 19, 21].
* **Casos de uso:**
  * **CU-01 Reconstruir y poblar la base de datos:** Ejecutar la creación de estructura y la carga sintética coherente y reproducible en MySQL 8.x[cite: 1, 2, 4, 6].
  * **CU-02 Consultar requerimientos SQL (R1–R12):** Ejecutar las 6 vistas y 6 procedimientos almacenados en MySQL y registrar sus evidencias en el informe[cite: 5, 6].
  * **CU-03 Autenticarse y operar según rol en el PMV:** Iniciar sesión y acceder a funcionalidades restringidas según el rol asignado *(**Pendiente — DD-02, DD-06**)*[cite: 6, 30].
  * **CU-04 Registrar operación mediante formulario transaccional:** Ejecutar una transacción real validando datos existentes, campos, capacidad e integridad referencial *(flujo específico **Pendiente — DD-04**)*[cite: 6, 30].
  * **CU-05 Gestionar CRUD de tablas maestras/básicas:** Crear, consultar, modificar y eliminar o desactivar registros en al menos 2 tablas maestras/básicas *(tablas y política de desactivación **Pendiente — DD-05**)*[cite: 6, 30].
  * **CU-06 Consultar el dashboard en Streamlit:** Visualizar las 3 preguntas de Fase 1 y la 4ª pregunta propuesta por el equipo con Plotly *(4ª pregunta **Pendiente — DD-07**)*[cite: 2, 7, 30].
  * **CU-07 Desplegar con Docker:** Levantar y operar la aplicación y la base de datos mediante `Dockerfile` y `docker-compose.yml`[cite: 2, 7, 20].

---

## 4. Reglas de negocio

### Reglas de negocio de Fase 1 (sujetas a revisión y corrección en Fase 2)
* **RN-01:** Una comunidad autónoma administra de 0 a muchos parques naturales, y un parque natural es administrado por una comunidad *(en tensión con RN-02 y la estructura de Fase 1; **Pendiente — DD-01**)*[cite: 11, 13, 14, 30].
* **RN-02:** Un parque natural puede ser compartido por 0 a muchas comunidades autónomas, y una comunidad puede compartir de 0 a muchos parques, registrando el porcentaje territorial correspondiente a cada comunidad *(**Pendiente — DD-01**)*[cite: 11, 13, 15, 30].
* **RN-03:** Un trabajador puede supervisar de 0 a muchos trabajadores, y un trabajador puede tener de 0 a 1 supervisor *(relación recursiva 1:N, participaciones (0,N) y (0,1))*[cite: 11, 13, 14].
* **RN-04:** No todas las especies tienen que estar clasificadas y una especie categorizada pertenece únicamente a uno de los subtipos `Vegetal`, `Animal` o `Mineral` *(jerarquía parcial y disjunta `d`; Fase 2 también considera especies sin clasificar si el modelo lo contempla)*[cite: 4, 11, 13].
* **RN-05:** Un trabajador que ejerce como investigador puede participar de 0 a muchos proyectos científicos, y un proyecto puede estar compuesto de 1 a muchos investigadores[cite: 11, 13, 15].
* **RN-06:** Una inscripción genera una y solo una evaluación por parte del visitante, y cada evaluación proviene exclusivamente de una inscripción válida *(relación 1:1, participación (0,1) en inscripción y (1,1) en evaluación; estructura de claves y restricciones **Pendiente — DD-03**)*[cite: 12, 13, 16, 30].
* **RN-07:** Un visitante puede realizar 1 o muchas inscripciones a excursiones, y una excursión puede tener 0 o muchas inscripciones de visitantes[cite: 12, 13, 16].
* **RN-08:** Evaluación puede presentar comentarios, pero no es obligatorio[cite: 12, 13].
* **RN-09:** Un parque natural se divide obligatoriamente en una o más áreas y cada área pertenece exclusivamente a un solo parque natural *(participación total (1,1) de área y (1,N) de parque)*[cite: 12, 13, 15].
* **RN-10:** En un área del parque se pueden realizar de 0 a muchas excursiones, y las excursiones se pueden realizar en un área del parque a la vez *(participación (0,N) de área y (1,1) de excursión)*[cite: 12, 13, 16].

### Condiciones y reglas de Fase 2 / pendientes
* Las correcciones a las reglas de negocio de Fase 1 deben incorporarse en el informe final (Sección 13, punto 3) y mantenerse coherentes con el MERE y el modelo relacional[cite: 3, 8].
* Los aspectos en **DD-01, DD-02, DD-03 y DD-05** permanecen **Pendientes** de resolución por el equipo[cite: 30].

---

## 5. Entidades, atributos, PK, FK y relaciones

*(Basado en el Informe de Fase 1, Secciones 3 y 4[cite: 13, 14, 15, 16]; sujeto a las correcciones del MERE y modelo relacional final en MySQL Workbench[cite: 3] y a las decisiones **Pendientes — DD-01, DD-02, DD-03, DD-05**[cite: 30]).*

* **`ROL`:** Atributos `idRol`, `nombreRol`. PK: `idRol`[cite: 14].
* **`TRABAJADOR`:** Atributos `idTrabajador`, `nombre`, `direccion`, `fechaNacimiento`, `estadoCuenta`, `idRol`, `idSupervisor`, `numCorrelativo`. PK: `idTrabajador`. FKs: `idRol` -> `ROL`, `idSupervisor` -> `TRABAJADOR`, `numCorrelativo` -> `PARQUE_NATURAL`. `Edad` no se almacena (atributo derivado)[cite: 14].
* **`TRABAJADOR_FUNCIONES`:** Atributos `idTrabajador`, `funciones`. PK: `(idTrabajador, funciones)`. FK: `idTrabajador` -> `TRABAJADOR`[cite: 14].
* **`TRABAJADOR_CONTACTO`:** Atributos `idTrabajador`, `datosContacto`. PK: `(idTrabajador, datosContacto)`. FK: `idTrabajador` -> `TRABAJADOR`[cite: 14].
* **`COMUNIDAD_AUTONOMA`:** Atributos `codigoComunidad` (`codigo Comunidad` en tabla relacional de Fase 1), `nombre`, `organismoResp`, `regionAdmin`. PK: `codigoComunidad`[cite: 14].
* **`PARQUE_NATURAL`:** Atributos `numCorrelativo`, `nombre`, `superficie`, `fechaDeclaracion`, `añoDeclaracion`, `estadoConservacion`, `presupuesto`, `idTrabajador`. PK: `numCorrelativo`. FK: `idTrabajador` -> `TRABAJADOR` *(**Pendiente — DD-01**)*[cite: 14, 30].
* **`COMPARTEN`:** Atributos `numCorrelativo`, `codigoComunidad`, `porcentajeTerritorial`. PK: `(numCorrelativo, codigoComunidad)`. FKs: `numCorrelativo` -> `PARQUE_NATURAL`, `codigoComunidad` -> `COMUNIDAD_AUTONOMA` *(**Pendiente — DD-01**)*[cite: 15, 30].
* **`PROYECTO_CIENTIFICO`:** Atributos `idProyecto`, `nombre`, `objetivo`, `numCorrelativo`. PK: `idProyecto`. FK: `numCorrelativo` -> `PARQUE_NATURAL`[cite: 15].
* **`PARTICIPA`:** Atributos `idTrabajador`, `idProyecto`. PK: `(idTrabajador, idProyecto)`. FKs: `idTrabajador` -> `TRABAJADOR`, `idProyecto` -> `PROYECTO_CIENTIFICO`[cite: 15].
* **`ESPECIE`:** Atributos `idEspecie`, `estadoConservacion`, `fechaIncorporacion`, `nombreVulgar`, `denominacionCientifica`. PK: `idEspecie`. Superclase de especialización disjunta `{d}` en `VEGETAL`, `ANIMAL` y `MINERAL` (además de especies sin clasificar si aplica)[cite: 4, 13, 15].
* **`VEGETAL`:** Atributos `idEspecie`, `floracion`. PK/FK: `idEspecie` -> `ESPECIE`[cite: 15].
* **`ANIMAL`:** Atributos `idEspecie`, `alimentacion`, `periodoCelo`. PK/FK: `idEspecie` -> `ESPECIE`[cite: 15].
* **`MINERAL`:** Atributos `idEspecie`, `caracteristicasMineral`, `rocas`, `cristales`. PK/FK: `idEspecie` -> `ESPECIE`[cite: 15].
* **`INVESTIGA`:** Atributos `idProyecto`, `idEspecie`. PK: `(idProyecto, idEspecie)`. FKs: `idProyecto` -> `PROYECTO_CIENTIFICO`, `idEspecie` -> `ESPECIE`[cite: 15].
* **`AREA`:** Atributos `numCorrelativo`, `numInterno`, `nombre`, `estadoOperativo`, `nivelAcceso`, `extension`. PK: `(numCorrelativo, numInterno)`. FK: `numCorrelativo` -> `PARQUE_NATURAL`[cite: 15].
* **`SE_DESARROLLA_EN`:** Atributos `idProyecto`, `numCorrelativo`, `numInterno`. PK: `(idProyecto, numCorrelativo, numInterno)`. FKs: `idProyecto` -> `PROYECTO_CIENTIFICO`, `(numCorrelativo, numInterno)` -> `AREA`[cite: 15].
* **`INVENTARIO_ESPECIE`:** Atributos `codigoInventario`, `cantidadInventario`, `fechaUltimoMonitoreo`, `observaciones`, `idEspecie`, `numCorrelativo`, `numInterno`. PK: `codigoInventario`. FKs: `idEspecie` -> `ESPECIE`, `(numCorrelativo, numInterno)` -> `AREA`[cite: 16].
* **`EXCURSION`:** Atributos `numCorrelativo`, `numInterno`, `codigoExcursion`, `modalidad`, `horario`, `fecha`, `capacidad`. PK: `(numCorrelativo, numInterno, codigoExcursion)`. FK: `(numCorrelativo, numInterno)` -> `AREA`[cite: 16].
* **`VISITANTE`:** Atributos `idVisitante`, `nombre`, `contacto`, `fechaNacimiento`. PK: `idVisitante`. `Edad` no se almacena (atributo derivado)[cite: 16].
* **`INSCRIPCION`:** Atributos `idInscripcion`, `numCorrelativo`, `numInterno`, `codigoExcursion`, `idVisitante`, `asistencia`, `observaciones`. PK: `idInscripcion`. FKs: `(numCorrelativo, numInterno, codigoExcursion)` -> `EXCURSION`, `idVisitante` -> `VISITANTE` *(**Pendiente — DD-03**)*[cite: 16, 30].
* **`EVALUACION`:** Atributos `idInscripcion`, `numCorrelativoEval`, `fecha`, `calificacion`, `comentario`. PK: `idInscripcion`. FK: `idInscripcion` -> `INSCRIPCION` *(**Pendiente — DD-03**)*[cite: 16, 30].

---

## 6. Requerimientos SQL

Se requieren **6 vistas** y **6 procedimientos almacenados** (con parámetros `IN` útiles) en el script integral SQL, sin integrarlos al PMV como reemplazo de sus 4 funcionalidades[cite: 5, 6, 19]:

| ID | Objeto SQL | Requerimiento y condición |
| :--- | :--- | :--- |
| **R1** | `procedure` | ¿Cuáles son las áreas con mayor cantidad de visitantes mediante excursiones durante un período determinado? Parámetros: fecha inicio y fecha término; integrar parque, área, excursión e inscripción[cite: 5]. |
| **R2** | `view` | ¿Cómo se distribuyen las especies inventariadas entre vegetales, animales y minerales, considerando parque y área? Integrar especie, especialización/tipo, inventario y área/parque[cite: 5]. |
| **R3** | `view` | ¿Existe relación entre la cantidad de visitantes de una excursión y su evaluación promedio? Integrar excursión, inscripción y evaluación; incluir cantidad de participantes y promedio de evaluación[cite: 5]. |
| **R4** | `procedure` | ¿Qué parques concentran la mayor cantidad de excursiones y visitantes en un período determinado? Parámetros de fechas; integrar parque, área, excursión e inscripción[cite: 5]. |
| **R5** | `view` | ¿Qué áreas presentan mayor tasa de asistencia respecto de las inscripciones realizadas? Integrar parque, área, excursión e inscripción; calcular porcentaje de asistencia[cite: 5]. |
| **R6** | `view` | ¿Qué especies presentan mayor cantidad inventariada por parque y área? Integrar parque, área, inventario y especie[cite: 5]. |
| **R7** | `view` | ¿Qué proyectos de investigación concentran mayor participación de investigadores y especies estudiadas? Integrar proyecto, investigadores/personal y especies; usar funciones de grupo y `HAVING`[cite: 5]. |
| **R8** | `view` | ¿Qué trabajadores desempeñan más de una función y en qué parques o áreas desarrollan sus actividades? Integrar personal, función/asignación y parque o área; usar funciones de grupo[cite: 5]. |
| **R9** | `procedure` | ¿Qué excursiones superan el promedio de visitantes de las excursiones realizadas en el mismo parque? Parámetros: parque y período; usar subconsulta correlacionada e integrar parque, área, excursión e inscripción[cite: 5]. |
| **R10** | `procedure` | ¿Qué especies poseen una cantidad inventariada superior al promedio de las especies de su mismo tipo? Parámetro: tipo de especie; integrar especie, inventario, área y parque; usar subconsulta[cite: 5]. |
| **R11** | `procedure` | ¿Qué visitantes han participado en más excursiones que el promedio y además poseen una evaluación promedio superior al promedio general? Parámetros: rango de fechas; integrar visitante, inscripción, excursión y evaluación[cite: 5]. |
| **R12** | `procedure` | ¿Qué parques presentan un promedio de visitantes por excursión superior al promedio general de los parques durante un período? Parámetros: fecha inicio y fecha término; integrar parque, área, excursión e inscripción; usar subconsulta y agrupación[cite: 5]. |

---

## 7. Las cuatro funcionalidades del PMV

El PMV debe funcionar como una única aplicación integrada en Python/Streamlit conectada a la misma base de datos MySQL del proyecto[cite: 2, 6, 19]:

1. **Formulario transaccional:** Registrar una operación real (como inscripción de visitante a excursión u otra equivalente justificada), seleccionando datos existentes, validando campos y capacidad cuando corresponda, registrando estado de asistencia y respetando claves foráneas *(operación exacta y flujo **Pendientes — DD-04**)*[cite: 6, 30].
2. **CRUD de tablas básicas:** Crear, consultar, modificar y eliminar o desactivar registros en al menos 2 tablas maestras o básicas (ej. Parque y Especie), utilizando desactivación lógica si la eliminación física viola integridad referencial *(tablas y política **Pendientes — DD-05**)*[cite: 6, 30].
3. **Control de usuarios:** Inicio de sesión y al menos 2 roles con permisos diferenciados que controlen el acceso real a funcionalidades del PMV *(roles y matriz de permisos **Pendientes — DD-06**)*[cite: 6, 30].
4. **Panel de información / dashboard:** Basado en las 3 preguntas de Fase 1 (áreas con mayor cantidad de visitantes mediante excursiones en un período con filtros de fecha y parque; distribución de especies inventariadas entre vegetal, animal y mineral con filtros por parque/área; relación entre cantidad de visitantes por excursión y evaluación promedio con gráfico de dispersión y tabla de detalle) más una 4ª pregunta propuesta y justificada por el equipo, resuelta mediante consulta SQL, con visualización adecuada y decisión de negocio asociada *(4ª pregunta **Pendiente — DD-07**)*[cite: 2, 6, 7, 30].

---

## 8. Arquitectura tecnológica

* **Stack obligatorio:** ERDPlus o equivalente (MERE), MySQL 8.x, MySQL Workbench, Python 3.12+, SQLAlchemy + PyMySQL, Faker, Pandas, Plotly, Streamlit, OpenCode y Docker + Docker Compose[cite: 2].
* **Estructura y acceso a datos:** Separación entre interfaz/presentación, lógica y acceso a datos (DAO o capa equivalente), conexión centralizada, consultas parametrizadas, manejo básico de errores y gestión/cierre de recursos, `requirements.txt` y trazabilidad directa con tablas/atributos del modelo[cite: 20].
* **Contenedores:** `Dockerfile` para Streamlit (instalando desde `requirements.txt`) y `docker-compose.yml` con servicios `app` y `db` (MySQL 8.x versionada, volumen persistente, puertos, variables de entorno, gestión de disponibilidad de BD e inicialización con scripts del proyecto), ejecutables con `docker compose up --build`[cite: 2, 7, 20].

---

## 9. Plan de implementación y pruebas

* **Etapa 0 — Decisiones y matriz de responsabilidades:** Resolver `DD-01` a `DD-09` y completar la matriz de responsabilidades antes de iniciar la implementación[cite: 8, 30].
* **Etapa 1 — MERE y modelo relacional:** Corregir el MERE, documentar cambios respecto a Fase 1 y construir el modelo relacional final en MySQL Workbench[cite: 3].
* **Etapa 2 — DDL y poblamiento:** Escribir y ejecutar el tramo DDL del script integral y poblar con datos sintéticos coherentes y reproducibles (rangos orientativos: comunidades 5–10, parques 12–20, áreas 35–60, especies 60–120, inventarios 250–500, personal 40–80, proyectos 20–40, visitantes 150–300, excursiones 120–250, inscripciones 800–1500, evaluaciones 400–900, usuarios/roles 40–80) *(estrategia y volúmenes exactos **Pendientes — DD-08**)*[cite: 2, 3, 4, 6, 30].
* **Etapa 3 — SQL avanzado (R1–R12):** Implementar las 6 vistas y 6 procedimientos almacenados en el script integral, ejecutarlos y documentar evidencias en el informe[cite: 3, 5, 6].
* **Etapa 4 — PMV en Python/Streamlit:** Implementar formulario transaccional, CRUD, control de usuarios y dashboard con separación de capas/DAO y consultas parametrizadas[cite: 2, 3, 6, 7, 20].
* **Etapa 5 — Pruebas e integración y Docker:** Verificar restricciones, consultas, navegación, roles y funcionamiento global, y desplegar con `docker compose up --build`[cite: 3, 7, 19, 20].
* **Etapa 6 — Informe final, bitácoras y defensa:** Redactar el informe de 13 secciones, bitácoras individuales con síntesis, presentación de 10 minutos y preparación de defensa individual de 5 minutos[cite: 8, 9, 20, 21].

---

## 10. Criterios de aceptación

El proyecto se ajusta al nivel **Excelente** de la rúbrica cuando[cite: 19, 20, 21]:
* El MERE corregido, el modelo relacional en Workbench, el script integral y la BD implementada son consistentes entre sí, con restricciones y justificaciones documentadas[cite: 3, 19].
* El script de creación y el archivo de inserciones se ejecutan desde cero y pueblan las tablas con datos suficientes, variados, coherentes y relacionados mediante FK[cite: 4, 6, 19].
* Se desarrollan los 12 requerimientos (6 vistas + 6 procedimientos con parámetros `IN` útiles) en el script y se evidencian en el informe sin sustituir las 4 funcionalidades del PMV[cite: 5, 6, 19].
* Las 4 funcionalidades del PMV operan sobre la misma BD del proyecto (sin sustituirlas ni simularlas), con arquitectura clara (interfaz, lógica, DAO/acceso a datos, conexión centralizada, consultas parametrizadas, manejo de errores/recursos y `requirements.txt`)[cite: 6, 7, 19, 20].
* El despliegue con `Dockerfile` y `docker-compose.yml` (`app` y `db` con MySQL 8.x versionada, volumen persistente, puertos, variables de entorno, disponibilidad de BD e inicialización con scripts) funciona con `docker compose up --build`[cite: 7, 20].
* La matriz de responsabilidades y las bitácoras individuales son coherentes entre sí y con el producto, el informe incluye las 13 secciones sin contradicciones, la exposición se ajusta a 10 minutos y todos demuestran dominio técnico en la defensa individual de 5 minutos[cite: 8, 9, 20, 21].

---

## 11. Decisiones pendientes

Todas las decisiones de `DECISIONES_DISENO.md` están **Pendientes** de confirmación por parte del equipo[cite: 30]:

* **DD-01 (Requiere aclaración docente):** Resolución de reglas de administración y compartición territorial de parques[cite: 30].
* **DD-02 (Requiere aclaración docente):** Modelamiento de roles, funciones del personal y cuentas de usuario del PMV[cite: 30].
* **DD-03:** Estructura de claves e integridad en inscripciones, asistencia y evaluaciones[cite: 30].
* **DD-04:** Selección y flujo de la operación del Formulario Transaccional del PMV[cite: 30].
* **DD-05:** Selección de tablas maestras/básicas y política de eliminación/desactivación del CRUD[cite: 30].
* **DD-06:** Definición de roles y matriz de permisos del Control de Usuarios del PMV[cite: 30].
* **DD-07:** Formulación y justificación de la cuarta pregunta de negocio del Dashboard[cite: 30].
* **DD-08:** Estrategia de poblamiento sintético y volúmenes exactos por tabla[cite: 30].
* **DD-09:** Distribución de responsabilidades en la Matriz del Equipo[cite: 30].