USE Transmilenio_db;

-- Se dispara antes de que se actualice en la tabla troncal
-- Por cada fila actualizada el nueo valor de la columna updated_at va a ser ahora
CREATE TRIGGER actualizar_updated_ad
BEFORE UPDATE
ON `troncal`
FOR EACH ROW 
SET NEW.updated_ad = NOW();

CREATE TRIGGER actualizar_updated_ad_estacion
BEFORE UPDATE
ON `estacion`
FOR EACH ROW 
SET NEW.updated_ad = NOW();

CREATE TRIGGER actualizar_updated_ad_tipo_estacion
BEFORE UPDATE
ON `tipo_estacion`
FOR EACH ROW 
SET NEW.updated_ad = NOW();

CREATE TRIGGER actualizar_updated_ad_transmilenio
BEFORE UPDATE
ON `transmilenio`
FOR EACH ROW 
SET NEW.updated_ad = NOW();

CREATE TRIGGER actualizar_updated_ad_transmilenio_troncal
BEFORE UPDATE
ON `transmilenio_troncal`
FOR EACH ROW 
SET NEW.updated_ad = NOW();


CREATE TRIGGER actualizar_updated_ad_ubicacion
BEFORE UPDATE
ON `ubicacion`
FOR EACH ROW 
SET NEW.updated_ad = NOW();



-- Triggers compuestos 
-- Insertar conductores a la tabla conductores_activos
-- cada vez que el valor en la tabla conductores se cambie a true 
-- y elminiarlos de la tabla conductores_activos cuando vuelva a false.

DELIMITER //

CREATE TRIGGER actualizar_conductores
AFTER UPDATE
ON `conductores`
FOR EACH ROW
BEGIN

    IF NEW.status = 1 THEN
        INSERT INTO `conductores_activos` (conductor_id) VALUES (NEW.id );

    ELSE
        DELETE FROM `conductores_activos` WHERE conductor_id = NEW.id;
    END IF;
END; //

DELIMITER //