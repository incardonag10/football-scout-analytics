use football_scout_analytics;

-- ==
-- insercion de datos
-- == 

insert into equipos (nombre, pais)
values
	('Lanus' , 'Argentina'),
    ('Boca Juniors', 'Argentina'),
    ('River Plate', 'Argentina'),
    ('Racing Club', 'Argentina');
    
select * from equipos;

insert into competiciones
    (nombre, region, pais, alcance, tipo, division)
values
	('Liga Profesional de Futbol', 'Sudamerica', 'Argentina', 'Nacional', 'Liga', 1),
    ('Copa Argentina', 'Sudamerica', 'Argentina', 'Nacional', 'Copa', null);
    
select * from competiciones;

insert into temporadas
	(idCompeticion, temporada, inicio, fin)
values
	(1, '2026', '2026-01-01', '2026-12-31');

-- hago dos porque me olvide agregar copa arg

insert into temporadas	
	(idCompeticion, temporada, inicio, fin)
values
	(2, '2026', '2026-01-01', '2026-12-31');
    
select * from temporadas;

insert into jugadores
	(nombre, apellido, posicion, fechaNacimiento, pais, PiernaHabil, estatura)
values
	('Giovanni', 'Incardona', 'Mediocampista', '2007-05-22', 'Argentina', 'derecha', '1.75'),
    ('Gianfranco', 'Conforti', 'Mediocampista', '2007-12-25', 'Argentina', 'derecha', '1.78');
    
select * from jugadores;

insert into jugador_equipo_pivot
    (idJugador, idEquipo, fechaInicio, fechaFinal)
values
	(1,1,'2026-01-01', null),
    (2,2,'2026-01-01', null);
    
SELECT
    j.nombre,
    j.apellido,
    j.nacionalidad,
    j.posicion,
    e.nombre AS equipo,
    je.fechaInicio
FROM jugadores j
INNER JOIN jugador_equipo_pivot je
    ON j.idJugador = je.idJugador
INNER JOIN equipos e
    ON je.idEquipo = e.idEquipo
where j.posicion = 'Mediocampista'
and e.nombre <> 'Lanus'
and je.fechaFinal is null;
    
-- modifico pais en jugadores por nacionalidad
alter table jugadores
rename column pais to nacionalidad;

describe jugadores;


-- se agrega un partido de ejemplo, lanus vs boca (2-1), disputado el 15/3/26
insert into partidos
	(idTemporada, fecha, idEquipoLocal, idEquipoVisitante, golesLocal, golesVisitante)
values
	(1, '2026-03-15', 2, 1, 1, 2);
 
-- practica inner joins 
select
	p.fecha,
    e.nombre as equipoLocal,
    p.golesLocal
from partidos p
inner join equipos e
	on p.idEquipoLocal = e.idEquipo;

select
	p.fecha,
    el.nombre as equipoLocal,
    p.golesLocal,
    p.golesVisitante,
	ev.nombre as equipoVisitante,
    
    case
		when golesLocal > golesVisitante then 'Victoria del equipo local'
		when golesLocal < golesVisitante then 'Victoria del equipo visitante'
		else 'Empate'
	end as resultado
    
from partidos p
inner join equipos el
	on p.idEquipolocal = el.idEquipo
inner join equipos ev
	on p.idEquipoVisitante = ev.idEquipo;
    
SELECT
    idEquipo,
    COUNT(*) AS partidosJugados
FROM (
    SELECT idEquipoLocal AS idEquipo
    FROM partidos

    UNION ALL

    SELECT idEquipoVisitante AS idEquipo
    FROM partidos
) AS partidosEquipos
GROUP BY idEquipo;
    
SELECT
    posicion,
    COUNT(*) AS cantidadJugadores
FROM jugadores
GROUP BY posicion;

SELECT
    e.nombre AS equipo,
    COUNT(j.idJugador) AS cantidadJugadores
FROM jugadores j
INNER JOIN jugador_equipo_pivot je
    ON j.idJugador = je.idJugador
INNER JOIN equipos e
    ON je.idEquipo = e.idEquipo
WHERE je.fechaFinal IS NULL
GROUP BY e.idEquipo, e.nombre
order by equipo asc;

SELECT * FROM estadisticas_jugador_partido;

-- ==========================================
-- NUEVOS JUGADORES FICTICIOS
-- ==========================================

INSERT INTO jugadores
    (nombre, apellido, posicion, fechaNacimiento,
     nacionalidad, piernaHabil, estatura)
VALUES
    ('Mateo', 'Roldan', 'mediocampista', '2003-04-12',
     'Argentina', 'derecha', 1.78),

    ('Nicolas', 'Sosa', 'delantero', '2002-08-21',
     'Argentina', 'izquierda', 1.82),

    ('Tomas', 'Pereyra', 'mediocampista', '2004-02-10',
     'Argentina', 'derecha', 1.76),

    ('Franco', 'Diaz', 'defensor', '2001-11-05',
     'Argentina', 'izquierda', 1.84),

    ('Lucas', 'Ferreyra', 'mediocampista', '2003-06-17',
     'Argentina', 'derecha', 1.80),

    ('Bruno', 'Acosta', 'delantero', '2002-09-03',
     'Argentina', 'derecha', 1.85),

    ('Agustin', 'Molina', 'mediocampista', '2004-01-25',
     'Argentina', 'izquierda', 1.77),

    ('Thiago', 'Benitez', 'defensor', '2003-12-14',
     'Argentina', 'derecha', 1.83);
     
select * from jugadores;

-- ==========================================
-- VINCULACION DE JUGADORES Y EQUIPOS
-- ==========================================

INSERT INTO jugador_equipo_pivot
    (idJugador, idEquipo, fechaInicio, fechaFinal)
VALUES
    (3, 1, '2026-01-01', NULL),
    (4, 1, '2026-01-01', NULL),

    (5, 2, '2026-01-01', NULL),
    (6, 2, '2026-01-01', NULL),

    (7, 3, '2026-01-01', NULL),
    (8, 3, '2026-01-01', NULL),

    (9, 4, '2026-01-01', NULL),
    (10, 4, '2026-01-01', NULL);
    
-- ==========================================
-- NUEVOS PARTIDOS FICTICIOS
-- ==========================================

INSERT INTO partidos
    (idTemporada, fecha, idEquipoLocal,
     idEquipoVisitante, golesLocal, golesVisitante)
VALUES
    (1, '2026-03-22', 1, 3, 1, 1),
    (1, '2026-03-22', 4, 2, 0, 2),
    (1, '2026-03-29', 3, 2, 2, 1),
    (1, '2026-03-29', 1, 4, 3, 1),
    (1, '2026-04-05', 2, 1, 0, 0);
    
SELECT * FROM jugadores;

SELECT * FROM jugador_equipo_pivot;

SELECT * FROM partidos;