USE Transmilenio_db;

CREATE TABLE `Troncal` (

        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

        `nombre` VARCHAR(20) NOT NULL,
        `color` VARCHAR(20) NOT NULL,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY (id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci; 


CREATE TABLE `Transmilenio` (

        `Placa` VARCHAR(10) NOT NULL,
        `ruta` VARCHAR(3) NOT NULL,

        `modelo_anio` INT(4) NOT NULL,
    
        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY (placa)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci; 

ALTER TABLE `Transmilenio`
MODIFY COLUMN `modelo_anio` INT(4) NOT NULL;




CREATE TABLE `Estacion` (

        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
        
        `troncal_id` BIGINT(20) UNSIGNED NOT NULL,
        `tipo_estacion_id` BIGINT(5) UNSIGNED NOT NULL,
        `nombre` VARCHAR(30) NOT NULL,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY (id),
        CONSTRAINT `troncal_estacion_id_foreign`
        FOREIGN KEY (`troncal_id`) REFERENCES `Troncal` (`id`),
        CONSTRAINT `tipo_estacion_id_foreign`
        FOREIGN KEY (`tipo_estacion_id`) REFERENCES `Tipo_estacion` (`id`)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci; 

CREATE TABLE `tipo_estacion` (

        `id` BIGINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,

        `Tipo` VARCHAR(15) NOT NULL,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;

-- SE BORRÓ CON DROP TABLE
CREATE TABLE `Stations_delete` (

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `name` VARCHAR(50) NOT NULL,

    `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;



CREATE TABLE `ubicacion`(

        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

        `estacion_id` BIGINT(20) UNSIGNED NOT NULL,
        `locacion` POINT NOT NULL,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

        PRIMARY KEY(id),
        CONSTRAINT `estacion_ubicacion_id_foreign`
        FOREIGN KEY (`estacion_id`) REFERENCES `estacion` (`id`)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `conductores` (

        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

        `nombre` VARCHAR(20),
        `status` BOOLEAN NOT NULL DEFAULT false,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

        PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `conductores_activos` (

        `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

        `conductor_id` BIGINT(20) UNSIGNED NOT NULL,

        `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

        PRIMARY KEY(id)
)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci;