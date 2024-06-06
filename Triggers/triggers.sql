<<<<<<< HEAD
-- Active: 1712651638936@@127.0.0.1@5432@cursos2019
=======
-- Active: 1715340009085@@127.0.0.1@5432@pedidos
>>>>>>> d742f814777975c25f4de4df57af71ec540375fb


CREATE OR REPLACE PROCEDURE funcion_eliminar(codigo_curso VARCHAR)
LANGUAGE plpgsql
AS $body$
BEGIN
    IF (SELECT especialidad FROM docentes WHERE DNIProf IN (SELECT Profe FROM docencia WHERE Curso = codigo_curso)) != (SELECT especialidad FROM cursos WHERE CodigoCurso = codigo_curso) THEN
        RAISE EXCEPTION 'Docente no tiene la especialidad del curso';
    END IF;

<<<<<<< HEAD
    DELETE FROM matricula WHERE CodigoCurso = codigo_curso;


    DELETE FROM docencia WHERE Curso = codigo_curso;

    DELETE FROM cursos WHERE CodigoCurso = codigo_curso;
END;
$body$;

=======
CREATE FUNCTION contar_institutos(nombre_pueblo character varying) 

RETURNS integer AS
$$                          --Este es el indicador del cuerpo de la función
    DECLARE
        numero_instituts integer; --Hay que poner el tipo al declarar la variable--
    BEGIN
        SELECT COUNT(nombre_pueblo) INTO numero_instituts
        FROM instituts INNER JOIN poblacions ON instituts.cod_m = poblacions.cod_m
        WHERE 
        ;    
    END
$$
LANGUAGE plpgsql            --Este es el lenguage que utiliza la función.
>>>>>>> d742f814777975c25f4de4df57af71ec540375fb




3.- Escribir un procedimiento que compruebe y devuelva ‘verdadero’ 
si al pesarle el código de un curso este ya está completo. Es decir tiene ya 20 alumnos

CREATE OR REPLACE FUNCTION funcion_primera_completo(codigo_curso VARCHAR)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $body$
DECLARE
    numero_alumnos INT;
BEGIN
    SELECT COUNT(*) INTO numero_alumnos
    FROM matricula
    WHERE CodigoCurso = codigo_curso;

    IF numero_alumnos >= 20 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;
$body$;





