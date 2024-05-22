-- Active: 1715340009085@@127.0.0.1@5432@cursos2019

CREATE OR REPLACE PROCEDURE eliminar_curso_matricula(codigo_curso varchar)
LANGUAGE plpgsql AS 
$$

BEGIN
    DELETE from cursos
    WHERE cursos.codigocurso = codigo_curso;


    --Estos son las nuevas tablas que se solicitan en el ejercicio 2--
    --Y la tabla que surge de la relación--
    CREATE OR REPLACE TABLE categoria (
        cod_cat int PRIMARY KEY,
        descripcion varchar(255)
    )

    CREATE OR REPLACE TABLE especialidad (
        cod_espac int PRIMARY KEY,
        descripcion varchar(255)
    )

    CREATE OR REPLACE TABLE categoria_especialidad (
        cod_espac int,
        cod_cat int,
    
        ADD CONSTRAINT pk_categoria_especialidad PRIMARY KEY (cod_espac, cod_cat)
        ADD CONSTRAINT fk_categoria FOREIGN KEY (cod_cat) REFERENCES categoria(cod_cat)
    );


END;
$$;




--Procedimiento de el 3er apartado--

CREATE OR REPLACE PROCEDURE comprobar_max_alumnos(codigo_curso varchar)
LANGUAGE plpgsql AS 
$$
DECLARE
    numero_alumnos int;
    var_codigo_curso varchar = codigo_curso;

BEGIN
    SELECT @numero_alumnos = COUNT(DISTINCT codigoalumno),codigocurso
    FROM matricula
    WHERE codigocurso = @var_codigo_curso
    GROUP BY codigocurso;


    IF @numero_alumnos >= 20 THEN 
    RAISE NOTICE 'Se han superado los alumnos VERDADERO';
    END IF;

END;
$$;



SELECT * FROM matricula

--Selecciona la cuenta de los codigoalumno de aquellos que están en un curso concreto
SELECT COUNT(DISTINCT codigoalumno),codigocurso
FROM matricula
WHERE codigocurso = 'AE96IN015'
GROUP BY  codigocurso

CALL comprobar_max_alumnos()



