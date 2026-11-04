use football_scout_analytics;

SELECT * FROM jugadores ORDER BY idJugador;
SELECT * FROM partidos ORDER BY idPartido;
SELECT * FROM jugador_equipo_pivot;

-- ==========================================
-- ESTADISTICAS INDIVIDUALES POR PARTIDO
-- DATOS FICTICIOS
-- ==========================================

INSERT INTO estadisticas_jugador_partido
(
    idPartido,
    idJugador,
    idEquipo,
    goles,
    asistencias,
    pasesIntentados,
    pasesCompletados,
    recuperaciones,
    duelosDisputados,
    duelosGanados,
    minutosJugados
)
VALUES

-- PARTIDO 1: BOCA 1 - 2 LANUS

(1, 2, 2, 1, 0, 48, 40, 5, 12, 6, 90),
(1, 5, 2, 0, 0, 55, 48, 8, 14, 9, 85),
(1, 6, 2, 0, 0, 42, 36, 6, 11, 7, 90),

(1, 1, 1, 0, 1, 62, 56, 12, 15, 10, 90),
(1, 3, 1, 1, 0, 51, 45, 9, 13, 8, 88),
(1, 4, 1, 1, 0, 24, 17, 2, 10, 5, 90),

-- PARTIDO 2: LANUS 1 - 1 RIVER

(2, 1, 1, 0, 1, 67, 60, 11, 14, 9, 90),
(2, 3, 1, 1, 0, 58, 51, 10, 16, 10, 90),
(2, 4, 1, 0, 0, 21, 15, 3, 12, 6, 82),

(2, 7, 3, 0, 1, 71, 65, 13, 17, 11, 90),
(2, 8, 3, 1, 0, 27, 20, 4, 11, 6, 90),

-- PARTIDO 3: RACING 0 - 2 BOCA

(3, 9, 4, 0, 0, 63, 56, 10, 15, 9, 90),
(3, 10, 4, 0, 0, 45, 39, 8, 13, 8, 90),

(3, 2, 2, 1, 1, 52, 46, 9, 14, 9, 90),
(3, 5, 2, 1, 0, 61, 55, 11, 16, 10, 90),
(3, 6, 2, 0, 1, 49, 42, 7, 13, 8, 90),

-- PARTIDO 4: RIVER 2 - 1 BOCA

(4, 7, 3, 1, 0, 75, 68, 15, 18, 12, 90),
(4, 8, 3, 1, 1, 29, 21, 5, 12, 7, 90),

(4, 2, 2, 0, 1, 57, 50, 8, 14, 8, 90),
(4, 5, 2, 1, 0, 64, 57, 10, 15, 9, 90),
(4, 6, 2, 0, 0, 46, 40, 9, 16, 10, 90),

-- PARTIDO 5: LANUS 3 - 1 RACING

(5, 1, 1, 0, 2, 72, 66, 14, 17, 12, 90),
(5, 3, 1, 1, 1, 59, 53, 12, 15, 10, 90),
(5, 4, 1, 2, 0, 31, 23, 4, 13, 7, 90),

(5, 9, 4, 1, 0, 68, 60, 11, 16, 9, 90),
(5, 10, 4, 0, 1, 48, 42, 9, 14, 8, 90),

-- PARTIDO 6: BOCA 0 - 0 LANUS

(6, 2, 2, 0, 0, 66, 59, 13, 17, 11, 90),
(6, 5, 2, 0, 0, 70, 64, 12, 16, 10, 90),
(6, 6, 2, 0, 0, 51, 45, 8, 14, 9, 90),

(6, 1, 1, 0, 0, 74, 68, 16, 18, 13, 90),
(6, 3, 1, 0, 0, 63, 57, 14, 17, 11, 90),
(6, 4, 1, 0, 0, 26, 19, 3, 12, 6, 90);

SELECT *
FROM estadisticas_jugador_partido;