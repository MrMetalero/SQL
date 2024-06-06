-- Active: 1712942338837@@127.0.0.1@5432@test


CREATE TABLE alumnos(
id INTEGER,
nombre VARCHAR(255),
apellido1 VARCHAR(255),
apellido2 VARCHAR(255),
nota REAL
)


-- TRIGGER 1$$
CREATE OR REPLACE TRIGGER check_nota
BEFORE INSERT OR UPDATE ON alumnos
FOR EACH ROW EXECUTE FUNCTION funcion_check_nota();




CREATE OR REPLACE FUNCTION funcion_check_nota()
RETURNS trigger
LANGUAGE plpgsql
AS $body$
    BEGIN
        --Caso de INSERT--
        IF TG_OP = 'INSERT' 
        THEN 
            IF NEW.nota > 10 OR NEW.nota < 0
                THEN 
                    NEW.nota = 0;
                END IF;
        END IF;

        --Caso de Update--
        IF TG_OP = 'UPDATE'
        THEN 
            IF NEW.nota > 10 
            THEN 
                NEW.nota = 10;  
            END IF; 
        END IF;


        return new;
    END;
$body$;








