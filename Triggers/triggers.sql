-- Active: 1712651638936@@127.0.0.1@5432@pedidos


--Quisiéramos escribir una función de nombre contar_instituts que reciba 
--como entrada el nombre de un pueblo y devuelva el número de institutos que hay en ese pueblo
--SELECT contar_instituts('Ontinyent');

CREATE FUNCTION contar_institutos() AS $contar_institutos$
    BEGIN
    SELECT COUNT(nombre_pueblo) FROM tabla_pueblos;


    END








