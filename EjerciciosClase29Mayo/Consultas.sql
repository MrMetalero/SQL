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
















