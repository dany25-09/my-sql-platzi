USE transmilenio_db;

-- calcular la distancia entre dos metros

-- Distancia entre portal norte y portal suba en metros de manera quemada
SELECT
ST_Distance_Sphere(
    POINT(-74.04604, 4.75455),
    POINT(-74.0954589, 4.7559383)
) AS distancia_metros;



-- Distancia entre portal norte y portal suba en km de manera quemada.
SELECT
ST_Distance_Sphere(
    POINT(-74.04604, 4.75455),
    POINT(-74.0954589, 4.7559383)
) /1000 AS distancia_km;

-- reto hacer el point con consulta anidada
-- Distancia entre portal norte y portal suba en km con consulta anidada.
SELECT
ST_Distance_Sphere(
    (
        SELECT DISTINCT u.locacion FROM estacion e, ubicacion u
            WHERE e.nombre = "Portal Norte"
            AND E.id = u.estacion_id
    ),
    (
        SELECT DISTINCT u.locacion FROM estacion e, ubicacion u
            WHERE e.nombre = "Portal Suba"
            AND E.id = u.estacion_id
 )
) /1000 AS distancia_km;



 
