-- Active: 1715340009085@@127.0.0.1@5432@test_triggers_josejuan


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
        --Caso de INSERT Y UPDATE PORQUE HACEN LO MISMO--

            IF NEW.nota < 0
                THEN 
                    NEW.nota = 0;
                END IF;

            IF NEW.nota > 10 
                THEN 
                    NEW.nota = 10;  
                END IF; 
        
        
        --      --Caso de Update--
        -- IF TG_OP = 'UPDATE'
        -- THEN 
        --     IF NEW.nota < 0
        --         THEN 
        --             NEW.nota = 0;
        --         END IF;

        --     IF NEW.nota > 10 
        --         THEN 
        --             NEW.nota = 10;  
        --         END IF; 
        -- END IF;

           -- IF TG_OP = 'INSERT'
        -- THEN 
        --     IF NEW.nota < 0
        --         THEN 
        --             NEW.nota = 0;
        --         END IF;

        --     IF NEW.nota > 10 
        --         THEN 
        --             NEW.nota = 10;  
        --         END IF; 
        -- END IF;


   


        return new;
    END;
$body$;








