-- Active: 1715340009085@@127.0.0.1@5432@pedidos


--Quisiéramos escribir una función de nombre contar_instituts que reciba 
--como entrada el nombre de un pueblo y devuelva el número de institutos que hay en ese pueblo
--SELECT contar_instituts('Ontinyent');

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







