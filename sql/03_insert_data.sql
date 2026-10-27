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

insert into partidos
	(idTemporada, fecha, idEquipoLocal, idEquipoVisitante, golesLocal, golesVisitante)
values
	(1, '2026-03-15', 2, 1, 1, 2);