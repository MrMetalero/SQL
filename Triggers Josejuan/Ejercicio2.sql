-- Active: 1715340009085@@127.0.0.1@5432@test_triggers_josejuan
CREATE OR REPLACE PROCEDURE crear_email(
    nombre IN VARCHAR, 
    apellido1 IN VARCHAR, 
    apellido2 IN VARCHAR,
    dominio IN VARCHAR,
    email OUT VARCHAR )
LANGUAGE plspgsql
AS $body$
BEGIN
    email = concat(
        substring(nombre from 1 to 2),
        substring(apellido1 from 1 to 3),
        substring(apellido2 from 1 to 3),
        '@',
        substring(dominio from 1 to 3),
        


        ) 
END;
$body$;


CREATE OR REPLACE FUNCTION eliminar_acentos(cadena_acentos IN VARCHAR)
RETURNS trigger
LANGUAGE plpgsql
AS $body$
    BEGIN
        --Caso de INSERT Y UPDATE PORQUE HACEN LO MISMO--
        
            IF NEW.nota < 0
                THEN 
                    NEW.nota = 0;
                END IF;

            IF NEW.nota > 10 
                THEN 
                    NEW.nota = 10;  
                END IF; 
        
    

        return new;
    END;
$body$;
