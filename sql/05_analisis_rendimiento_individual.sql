use football_scout_analytics;

SELECT
    j.nombre,
    j.apellido,
    j.posicion,
    e.nombre AS equipo,

    SUM(ep.goles) AS golesTotales,
    SUM(ep.asistencias) AS asistenciasTotales,
    SUM(ep.pasesIntentados) AS pasesIntentados,
    SUM(ep.pasesCompletados) AS pasesCompletados,
    SUM(ep.recuperaciones) AS recuperacionesTotales,
    SUM(ep.duelosDisputados) AS duelosDisputados,
    SUM(ep.duelosGanados) AS duelosGanados,
    SUM(ep.minutosJugados) AS minutosTotales

FROM jugadores j

INNER JOIN estadisticas_jugador_partido ep
    ON ep.idJugador = j.idJugador

INNER JOIN equipos e
    ON ep.idEquipo = e.idEquipo

GROUP BY
    j.idJugador,
    j.nombre,
    j.apellido,
    j.posicion,
    e.idEquipo,
    e.nombre

ORDER BY golesTotales DESC;

