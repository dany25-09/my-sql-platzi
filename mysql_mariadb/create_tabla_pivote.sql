USE Transmilenio_db;

CREATE TABLE `transmilenio_troncal`(

    `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,

    `transmilenio_id` VARCHAR(10) NOT NULL,
    `troncal_id` BIGINT(20) UNSIGNED NOT NULL,

    `created_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_ad` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    CONSTRAINT `transmilenio_id_foreign`
    FOREIGN KEY (`transmilenio_id`) REFERENCES `transmilenio` (`Placa`),

    CONSTRAINT `troncal_id_foreign`
    FOREIGN KEY (`troncal_id`) REFERENCES `troncal` (`id`)

)
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_unicode_ci; 
