-- Active: 1712942338837@@127.0.0.1@5432@test

-- UPDATE OF (Puede ser necesario?)

CREATE OR REPLACE TABLE registro_oficinas (
    cod_empleado int,
    cod_oficina varchar(10),
    nombre_empleado varchar(50),
    ciudad_oficina varchar(50),
    pais_oficina varchar(50),
    fecha_cambio date,
    CONSTRAINT nvk PRIMARY KEY (cod_empleado, cod_oficina, fecha_cambio)
);




CREATE OR REPLACE TRIGGER registrar_cambio_oficina
AFTER UPDATE OF codigo_oficina ON oficina 
FOR EACH ROW
EXECUTE FUNCTION funcion_registrar_cambio_oficina();



CREATE OR REPLACE FUNCTION funcion_registrar_cambio_oficina()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $body$
    BEGIN
    INSERT INTO registro_oficinas values (OLD.codigo_empleado, OLD.codigo_oficina, NEW.codigo_oficina,)
    return new;
    END;
$body$;