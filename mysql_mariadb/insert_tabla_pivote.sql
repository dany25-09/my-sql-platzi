USE transmilenio_db;

-- MANERA CONVENCIONAL
-- INSERT INTO `transmilenio_troncal`(transmilenio_id, troncal_id) VALUES
("aaa000", 10),
("aaa000", 5),
("aaa000", 3),
("aaa001",6),
("aaa001",1),
("aaa002",12),
("aaa002", 5),
("aaa002",10),
("aaa002",11),
("aaa003", 12),
("aaa003", 5),
("aaa004", 4),
("aaa004", 1),
("aaa004", 9),
("aaa005", 9),
("aaa005", 8),
("aaa006", 6),
("aaa006", 10),
("aaa006", 11),
("aaa007", 7),
("aaa007", 1),
("aaa007", 4),
("aaa007", 3),
("aaa008", 7),
("aaa008", 1),
("aaa008", 4),
("aaa009", 2),
("aaa009", 1),
("aaa009", 13),
("aaa010", 8),
("aaa010", 6),
("aaa011", 9),
("aaa011", 5),
("aaa011", 12),
("aaa012", 2),
("aaa012", 1),
("aaa012", 10),
("aaa013", 2),
("aaa013", 5),
("aaa013", 9),
("aaa014", 13),
("aaa014", 1),
("aaa014", 4),
("aaa015", 9),
("aaa015", 1),
("aaa015", 10),
("aaa016", 12),
("aaa016", 5),
("aaa016", 4),
("aaa016", 2),
("aaa017", 10),
("aaa017", 5),
("aaa017", 3),
("aaa018", 2),
("aaa018", 5),
("aaa018", 9),
("aaa019", 2),
("aaa019", 5),
("aaa019", 9),
("aaa020", 9),
("aaa020", 1),
("aaa020", 7),
("aaa021", 2),
("aaa021", 5),
("aaa021", 6),
("aaa022", 5),
("aaa022", 6),
("aaa023", 6),
("aaa023", 10),
("aaa023", 11),
("aaa024", 2),
("aaa024", 4),
("aaa024", 5),
("aaa024", 12),
("aaa025", 9),
("aaa025", 1),
("aaa025", 2),
("aaa026", 9),
("aaa026", 8),
("aaa027", 2),
("aaa027", 1),
("aaa027", 5),
("aaa028", 2),
("aaa028", 1),
("aaa028", 5),
("aaa029", 6),
("aaa029", 2),
("aaa030", 6),
("aaa030", 2),
("aaa111", 9),
("aaa111", 1),
("aaa111", 10);



-- USANDO CONSULTAS ANIDADAS
INSERT INTO `transmilenio_troncal`(transmilenio_id, troncal_id) VALUES
(
    (
        SELECT placa FROM transmilenio
        WHERE placa = "aaa000"
    ),
    (
        SELECT id FROM troncal
        where nombre = "carrera decima"
    )
),

(
    (
        SELECT placa FROM transmilenio
        WHERE placa = "aaa000"
    ),
    (
        SELECT id FROM troncal
        WHERE nombre = "NQS Central"
    )
),

(
    (
        SELECT placa FROM transmilenio
        WHERE placa = "aaa000"
    ),
    (
        SELECT id FROM troncal
        WHERE nombre = "Avenida Suba"
    )
);