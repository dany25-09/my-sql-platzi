USE transmilenio_db;

DELIMITER //
CREATE PROCEDURE obtener_troncales_estaciones(
    IN nombre_troncal VARCHAR(20)
)
BEGIN


    -- esta es una forma de guardar valores de una consulta
    -- dentro de una variable
    DECLARE troncal_id BIGINT(20);

    -- Guardo el id del nombre dado en la variable troncal_id
    SELECT id 
    INTO troncal_id
    FROM `troncal`
    WHERE nombre = nombre_troncal
    --COLLATE=utf8mb4_unicode_ci;

    -- esta es otra forma de guardar valores de una consulta
    -- dentro de una variable


    -- Guardo la consulta para saber las estaciones de la troncal
    -- en la variable @mysql y comparo con el id de troncal_id
    SET @sql = CONCAT("
        SELECT  t.nombre AS nombre_troncal,
                e.nombre AS nombre_estacion
        FROM troncal t, estacion e
        WHERE t.id = e.troncal_id
        AND e.troncal_id =", troncal_id);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;






DELIMITER //
CREATE PROCEDURE obtener_troncales_estaciones(
    IN nombre_troncal VARCHAR(20)
)
BEGIN

    -- esta es una forma de guardar valores de una consulta
    -- dentro de una variable
    DECLARE troncal_id BIGINT(20);

    -- Guardo el id del nombre dado en la variable troncal_id
    SELECT id 
    INTO troncal_id
    FROM `troncal`
    WHERE nombre = nombre_troncal;


    -- esta es otra forma de guardar valores de una consulta
    -- dentro de una variable


    -- Guardo la consulta para saber las estaciones de la troncal
    -- en la variable @mysql y comparo con el id de troncal_id

    SET @sql = CONCAT("
        SELECT  t.nombre AS nombre_troncal,
                e.nombre AS nombre_estacion
        FROM troncal t, estacion e
        WHERE t.id = e.troncal_id
        AND e.troncal_id =", troncal_id);

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;