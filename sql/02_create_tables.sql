create database football_scout_analytics;
use football_scout_analytics;

-- ===
-- tabla equipos
-- ===

create table equipos (
	idEquipo int unsigned not null auto_increment primary key,
    nombre varchar(75) not null,
    pais varchar(50) not null
);

-- ===
-- tabla jugadores 
-- == 

create table jugadores (
	idJugador int unsigned not null auto_increment primary key,
    nombre varchar(40) not null,
    apellido varchar(40) not null,
    posicion enum ('arquero', 'defensor', 'mediocampista', 'delantero') not null,
    fechaNacimiento date not null,
    pais varchar(40) not null,
    piernaHabil enum('derecha', 'izquierda', 'ambas') not null,
    estatura decimal(3,2) not null
);

-- == 
-- tabla competiciones
-- == 

create table competiciones (
	idCompeticion int unsigned not null auto_increment primary key,
    nombre varchar(40) not null,
    region varchar(40) not null,
    pais varchar(40) null,
    alcance enum ('nacional', 'internacional') not null,
    tipo enum('liga', 'copa') not null,
    division tinyint unsigned null
);

-- == 
-- tabla temporadas 
-- == 

create table temporadas (
	idTemporada int unsigned not null auto_increment primary key,
    idCompeticion int unsigned not null,
    
    foreign key (idCompeticion)
    references competiciones(idCompeticion),
    
    temporada varchar(40) not null,
    inicio date not null,
    fin date not null,
    
    unique (idCompeticion, temporada)
);

-- == 
-- tabla pivot 
-- registrar al mismo jugador en equipos distintos
-- ==

create table jugador_equipo_pivot (
	idJugadorEquipo int unsigned not null auto_increment primary key,
    fechaInicio date not null,
    fechaFinal date null,

	CHECK (fechaFinal IS NULL OR fechaFinal >= fechaInicio),

	idJugador int unsigned not null,
    idEquipo int unsigned not null,
    
    foreign key (idJugador)
    references jugadores(idJugador),
    
    foreign key (idEquipo)
    references equipos(idEquipo)
);

-- == 
-- tabla partidos
-- ==

create table partidos (
	idPartido int unsigned not null auto_increment primary key,
    idTemporada int unsigned not null,
    fecha date not null,
   
	idEquipoLocal int unsigned not null,
    idEquipoVisitante int unsigned not null,
    
	CHECK (idEquipoLocal <> idEquipoVisitante),
   
    -- resultado
    golesLocal tinyint unsigned null,
    golesVisitante tinyint unsigned null, 
    
	CHECK (
    (golesLocal IS NULL AND golesVisitante IS NULL)
    OR
    (golesLocal IS NOT NULL AND golesVisitante IS NOT NULL)
	),
    
	foreign key (idEquipoLocal)
    references equipos(idEquipo),
    
	foreign key (idEquipoVisitante)
    references equipos(idEquipo),
    
	foreign key (idTemporada)
    references temporadas(idTemporada)
);

create table estadisticas_jugador_partido (
	idEstadisticasJugador int unsigned not null auto_increment primary key,
    idPartido int unsigned not null,
    idJugador int unsigned not null,
    idEquipo int unsigned not null,
    
    unique (idPartido, idJugador),
    
    goles tinyint unsigned not null,
    asistencias tinyint unsigned not null,
    pasesIntentados smallint unsigned not null,
    pasesCompletados smallint unsigned not null,
    recuperaciones tinyint unsigned not null,
    duelosDisputados tinyint unsigned not null,
    duelosGanados tinyint unsigned not null,
    minutosJugados smallint unsigned not null,
    
    check (pasesIntentados >= pasesCompletados),
    check (duelosDisputados >= duelosGanados),
    check (minutosJugados > 0),
    
    foreign key (idPartido)
    references partidos(idPartido),
    
    foreign key (idJugador)
    references jugadores(idJugador),
    
    foreign key (idEquipo)
    references equipos(idEquipo)
    
);
describe estadisticas_jugador_partido;