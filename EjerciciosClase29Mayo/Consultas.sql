-- Active: 1715340009085@@127.0.0.1@5432@cursos2019


--RESULTADO EJERCICIO 1--
SELECT cursos.titulo, cursos.codigocurso, COUNT(apto) FROM matricula
INNER JOIN cursos ON cursos.codigocurso = matricula.codigocurso
WHERE matricula.apto = 'NO APTO'
GROUP BY cursos.codigocurso;

-- SELECT COUNT(apto), cursos.codigocurso, cursos.titulo FROM matricula
-- INNER JOIN cursos ON cursos.codigocurso = matricula.codigocurso
-- WHERE matricula.apto = 'APTO'
-- GROUP BY cursos.codigocurso;



--SEGUNDO EJERCICIO--
SELECT cursos.codigocurso, docentes.*, cursos.horas FROM docentes
INNER JOIN docencia ON docencia.profe = docentes.dniprof
INNER JOIN cursos ON cursos.codigocurso = docencia.curso
WHERE cursos.horas = (SELECT MAX(cursos.horas) FROM cursos)


--TERCER EJERCICIO--
SELECT alumnos.nombre, alumnos.telefono FROM alumnos
INNER JOIN matricula ON matricula.codigoalumno = alumnos.codigoalumno
INNER JOIN cursos ON cursos.codigocurso = matricula.codigocurso
WHERE cursos.titulo = 'Programación Android'

--CUARTO EJERCICIO--
SELECT cursos.titulo, cursos.categoria FROM cursos
WHERE cursos.categoria ='BBDD y Big Data' AND cursos.fechaini < '2019-05-01'


--QUINTO EJERCICIO--
CREATE OR REPLACE VIEW v_categorias
AS (SELECT cursos.titulo, cursos.categoria 
FROM cursos 
WHERE cursos.horas > '30' 
AND cursos.categoria !='Administración de Redes' AND cursos.categoria !='Internet' AND cursos.categoria != 'Ciberseguridad'
)


--SEXTO EJERCICIO--
        --Recordar en este ejercicio que necesito en el where una asociación con la tabla fuera
        --de la subconsulta para poder relacionarla con ella. Si no, EXISTS retorna true siempre en este ejemplo --
CREATE OR REPLACE VIEW con_no_aptos
AS 
(
    SELECT cursos.* 
    FROM cursos 
    WHERE EXISTS (
        SELECT apto FROM matricula 
        WHERE matricula.codigocurso = cursos.codigocurso
        AND matricula.apto LIKE 'NO APTO'
    )
)



--SÉPTIMO EJERCICIO--

CREATE OR REPLACE FUNCTION AS funcionX()
RETURNS trigger
LANGUAGE plpgsql AS 
$body$
    DECLARE 
    num_alumnos integer;

    BEGIN
        SELECT COUNT(codigoalumno) INTO num_alumnos
        FROM matricula
        WHERE codigocurso = NEW.codigocurso

    
    END
$body$


CREATE OR REPLACE CONSTRAINT TRIGGER nombre_trigger
BEFORE INSERT ON matricula
FOR EACH ROW
EXECUTE FUNCTION funcionX();









