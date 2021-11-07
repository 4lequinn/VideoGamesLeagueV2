-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2021 a las 07:34:09
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `liga_videojuegos`
--
CREATE DATABASE IF NOT EXISTS `liga_videojuegos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `liga_videojuegos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_equipo`
--

CREATE TABLE `detalle_equipo` (
  `id` int(11) NOT NULL,
  `id_inscripcion` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `detalle_equipo`
--
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_EQUIPO_DELETE` AFTER DELETE ON `detalle_equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_jugador into v_cantidad from equipo where id = old.id_equipo;
	UPDATE equipo SET cantidad_jugador = cantidad_jugador - 1 WHERE id = old.id_equipo;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_EQUIPO_INSERT` BEFORE INSERT ON `detalle_equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_jugador into v_cantidad from equipo where id = new.id_equipo;
    IF v_cantidad < 8 THEN
		UPDATE equipo set cantidad_jugador = cantidad_jugador + 1 where id = new.id_equipo;
    else
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERROR EL EQUIPO ESTÁ COMPLETO';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_EQUIPO_UPDATE` BEFORE UPDATE ON `detalle_equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_jugador into v_cantidad from equipo where id = new.id_equipo;
    IF v_cantidad < 8 THEN
		UPDATE equipo set cantidad_jugador = cantidad_jugador + 1 where id = new.id_equipo;
        UPDATE equipo set cantidad_jugador = cantidad_jugador - 1 WHERE id = old.id_equipo;
    else
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'ERROR EL EQUIPO ESTÁ COMPLETO';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_partido`
--

CREATE TABLE `detalle_partido` (
  `id` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL,
  `id_resultado` int(11) NOT NULL,
  `id_partido` int(11) NOT NULL,
  `id_localidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `cantidad_jugador` int(11) NOT NULL DEFAULT 1,
  `id_liga` int(11) NOT NULL,
  `id_perfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`id`, `nombre`, `cantidad_jugador`, `id_liga`, `id_perfil`) VALUES
(1, 'Colo Colo', 1, 1, 8),
(2, 'Santiago Wanderers', 1, 1, 13),
(3, 'Santiago Warder', 1, 1, 10),
(4, 'calo calo', 1, 1, 12),
(5, 'Team Queso', 1, 1, 9),
(6, 'Macacos', 1, 1, 11),
(7, 'Sin Skill', 1, 1, 6),
(8, 'Tuki Team', 1, 1, 5);

--
-- Disparadores `equipo`
--
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_LIGA_DELETE` AFTER DELETE ON `equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_equipo into v_cantidad from liga where id = old.id_liga;
	UPDATE liga SET cantidad_equipo = cantidad_equipo - 1 WHERE id = old.id_liga;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_LIGA_INSERT` BEFORE INSERT ON `equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_equipo into v_cantidad from liga where id = new.id_liga;
    IF v_cantidad < 8 THEN
		UPDATE liga set cantidad_equipo = cantidad_equipo + 1 where id = new.id_liga;
    else
		SIGNAL SQLSTATE '45004' SET MESSAGE_TEXT = 'ERROR LA LIGA ESTÁ COMPLETA';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TRG_VALIDAR_LIGA_UPDATE` BEFORE UPDATE ON `equipo` FOR EACH ROW BEGIN
    declare v_cantidad int;
	SELECT cantidad_equipo into v_cantidad from liga where id = new.id_liga;
    IF v_cantidad < 16 THEN
		UPDATE liga set cantidad_equipo = cantidad_equipo + 1 where id = new.id_liga;
        UPDATE liga set cantidad_equipo = cantidad_equipo - 1 WHERE id = old.id_liga;
    else
		SIGNAL SQLSTATE '45005' SET MESSAGE_TEXT = 'ERROR LA LIGA ESTÁ COMPLETA';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_solicitud`
--

CREATE TABLE `estado_solicitud` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_solicitud`
--

INSERT INTO `estado_solicitud` (`id`, `descripcion`) VALUES
(1, 'PENDIENTE'),
(2, 'ACEPTADA'),
(3, 'RECHAZADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fase`
--

CREATE TABLE `fase` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `fase`
--

INSERT INTO `fase` (`id`, `descripcion`) VALUES
(1, '4tos de Final'),
(2, 'Semifinal'),
(3, 'Tercer y Cuarto'),
(4, 'Final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incripcion`
--

CREATE TABLE `incripcion` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_estado` int(11) NOT NULL,
  `id_jugador` int(11) NOT NULL,
  `id_equipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Disparadores `incripcion`
--
DELIMITER $$
CREATE TRIGGER `TRG_DETALLE_EQUIPO` AFTER UPDATE ON `incripcion` FOR EACH ROW BEGIN
	IF new.id_estado = 2 THEN
    -- Solicitud Aceptada
    insert into detalle_equipo (id_equipo, id_inscripcion) VALUES (new.id_equipo, new.id);

   	END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liga`
--

CREATE TABLE `liga` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `cantidad_equipo` int(11) NOT NULL DEFAULT 0,
  `id_juego` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `liga`
--

INSERT INTO `liga` (`id`, `descripcion`, `cantidad_equipo`, `id_juego`) VALUES
(1, 'LIGA DE LOS MUCAS', 8, 1),
(2, 'LIGA DE LOL', 0, 1),
(3, 'LIGA DE Apex', 0, 2),
(4, 'LIGA DE Brazukas', 0, 3),
(5, 'LIGA DE Pelota', 0, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

INSERT INTO `localidad` (`id`, `descripcion`) VALUES
(1, 'Local'),
(2, 'Visitante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id` int(11) NOT NULL,
  `fecha` varchar(15) NOT NULL,
  `hora_inicio` varchar(5) NOT NULL,
  `hora_termino` varchar(5) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_liga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_jugador`
--

CREATE TABLE `perfil_jugador` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `habilidad` varchar(80) NOT NULL,
  `id_tipo_jugador` int(11) NOT NULL,
  `id_usuario` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `perfil_jugador`
--

INSERT INTO `perfil_jugador` (`id`, `nombre`, `apellido`, `correo`, `habilidad`, `id_tipo_jugador`, `id_usuario`) VALUES
(1, 'Admin', '', 'Admin@admin.cl', 'Banear', 2, 'admin'),
(5, 'Francisco', 'Juillet', 'panshoots11@gmail.com', 'Jugador bueno para banear a la gente', 3, 'panshoots'),
(6, 'Jorge', 'Quintui', 'jorge@gmail.com', 'Trolear al Ãºltimo minuto', 1, 'x4leqxinn'),
(8, 'JoaquÃ­n', 'Reyes', 'joaco@gmail.com', 'Experto en mainear Teemo', 1, 'MainTeemo'),
(9, 'SebastiÃ¡n', 'Rojas', 'seba@gmail.com', 'Experto en usar Yasuo', 1, 'yasuolover'),
(10, 'JosÃ©', 'Luis', 'jose@gmail.com', 'Ninguna por el momento', 1, 'Joshelui'),
(11, 'Tomas', 'Campos', 'tomasito@gmail.com', 'Experto en el counter', 1, 'tomasito11'),
(12, 'Piperuano', 'Torres', 'peruano@gmail.com', 'Comer palomitas', 1, 'PeruanoMain'),
(13, 'Fabrizio', 'Copano', 'fab.co@gmail.com', 'Comediante', 1, 'fabiiioCop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultado`
--

CREATE TABLE `resultado` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `resultado`
--

INSERT INTO `resultado` (`id`, `descripcion`) VALUES
(1, 'PENDIENTE'),
(2, 'GANADO'),
(3, 'PERDIDO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_jugador`
--

CREATE TABLE `tipo_jugador` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_jugador`
--

INSERT INTO `tipo_jugador` (`id`, `descripcion`) VALUES
(1, 'ESTRATEGIA'),
(2, 'FUTBOLERO'),
(3, 'DISPAROS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `descripcion`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'USUARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(50) NOT NULL,
  `contrasenia` varchar(50) NOT NULL,
  `id_tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `contrasenia`, `id_tipo`) VALUES
('admin', 'admin', 1),
('fabiiioCop', 'fabiiioCop', 2),
('Joshelui', 'Joshelui', 2),
('MainTeemo', 'MainTeemo', 2),
('panshoots', 'panshoots', 2),
('PeruanoMain', 'PeruanoMain', 2),
('tomasito11', 'tomasito11', 2),
('x4leqxinn', 'x4leqxinn', 2),
('yasuolover', 'yasuolover', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `video_juego`
--

CREATE TABLE `video_juego` (
  `id` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `tipo_juego` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `video_juego`
--

INSERT INTO `video_juego` (`id`, `nombre`, `tipo_juego`) VALUES
(1, 'LEAGUE OF LEGENDS', 'MOBA BATTLE ARENA'),
(2, 'APEX LEGENDS', 'BATTLE ROYALE'),
(3, 'COUNTER STRIKE GLOBAL OFFENSIVE', 'SHOOTER'),
(4, 'FIFA 22', 'EA SPORTS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_equipo`
--
ALTER TABLE `detalle_equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_inscripcion` (`id_inscripcion`);

--
-- Indices de la tabla `detalle_partido`
--
ALTER TABLE `detalle_partido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_equipo` (`id_equipo`),
  ADD KEY `id_resultado` (`id_resultado`),
  ADD KEY `id_partido` (`id_partido`),
  ADD KEY `id_localidad` (`id_localidad`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_liga` (`id_liga`),
  ADD KEY `id_perfil` (`id_perfil`);

--
-- Indices de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `incripcion`
--
ALTER TABLE `incripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_jugador` (`id_jugador`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_equipo` (`id_equipo`);

--
-- Indices de la tabla `liga`
--
ALTER TABLE `liga`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_juego` (`id_juego`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_liga` (`id_liga`);

--
-- Indices de la tabla `perfil_jugador`
--
ALTER TABLE `perfil_jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_jugador` (`id_tipo_jugador`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `resultado`
--
ALTER TABLE `resultado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_jugador`
--
ALTER TABLE `tipo_jugador`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `video_juego`
--
ALTER TABLE `video_juego`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_equipo`
--
ALTER TABLE `detalle_equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_partido`
--
ALTER TABLE `detalle_partido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estado_solicitud`
--
ALTER TABLE `estado_solicitud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `fase`
--
ALTER TABLE `fase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `incripcion`
--
ALTER TABLE `incripcion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `liga`
--
ALTER TABLE `liga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `perfil_jugador`
--
ALTER TABLE `perfil_jugador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `resultado`
--
ALTER TABLE `resultado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_jugador`
--
ALTER TABLE `tipo_jugador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `video_juego`
--
ALTER TABLE `video_juego`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_equipo`
--
ALTER TABLE `detalle_equipo`
  ADD CONSTRAINT `detalle_equipo_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `detalle_equipo_ibfk_2` FOREIGN KEY (`id_inscripcion`) REFERENCES `incripcion` (`id`);

--
-- Filtros para la tabla `detalle_partido`
--
ALTER TABLE `detalle_partido`
  ADD CONSTRAINT `detalle_partido_ibfk_1` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `detalle_partido_ibfk_2` FOREIGN KEY (`id_resultado`) REFERENCES `resultado` (`id`),
  ADD CONSTRAINT `detalle_partido_ibfk_3` FOREIGN KEY (`id_partido`) REFERENCES `partido` (`id`),
  ADD CONSTRAINT `detalle_partido_ibfk_4` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_2` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id`),
  ADD CONSTRAINT `equipo_ibfk_3` FOREIGN KEY (`id_perfil`) REFERENCES `perfil_jugador` (`id`);

--
-- Filtros para la tabla `incripcion`
--
ALTER TABLE `incripcion`
  ADD CONSTRAINT `incripcion_ibfk_1` FOREIGN KEY (`id_jugador`) REFERENCES `perfil_jugador` (`id`),
  ADD CONSTRAINT `incripcion_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estado_solicitud` (`id`),
  ADD CONSTRAINT `incripcion_ibfk_3` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `liga`
--
ALTER TABLE `liga`
  ADD CONSTRAINT `liga_ibfk_1` FOREIGN KEY (`id_juego`) REFERENCES `video_juego` (`id`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`id_fase`) REFERENCES `fase` (`id`),
  ADD CONSTRAINT `partido_ibfk_3` FOREIGN KEY (`id_liga`) REFERENCES `liga` (`id`);

--
-- Filtros para la tabla `perfil_jugador`
--
ALTER TABLE `perfil_jugador`
  ADD CONSTRAINT `perfil_jugador_ibfk_2` FOREIGN KEY (`id_tipo_jugador`) REFERENCES `tipo_jugador` (`id`),
  ADD CONSTRAINT `perfil_jugador_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
