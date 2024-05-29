
SELECT * FROM alumnos

SELECT * FROM cursos

SELECT * FROM matricula

SELECT COUNT(apto) numero_aptos FROM matricula

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

















