USE Transmilenio_db;

-- Procedimiento para no repetir la función de geolocalización 
DELIMITER //
CREATE PROCEDURE 
calcular_distancia_portales (
    IN estacion_uno POINT,
    IN estacion_dos POINT,
    IN meters BOOLEAN
)
BEGIN 

    IF meters THEN

    SELECT
    ST_Distance_Sphere(estacion_uno, estacion_dos) AS distancia_metros;

    ELSE 

        SELECT
        ST_Distance_Sphere(estacion_uno, estacion_dos) / 1000 AS distancia_km;

    END IF;

END //
DELIMITER ; 