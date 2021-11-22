-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2021 a las 21:08:30
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gauchorocket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE `cargo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`id`, `descripcion`) VALUES
(1, 'administrador'),
(2, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centrosmedicos`
--

CREATE TABLE `centrosmedicos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `imagen` varchar(45) NOT NULL,
  `cantidadTurnos` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `centrosmedicos`
--

INSERT INTO `centrosmedicos` (`id`, `nombre`, `direccion`, `imagen`, `cantidadTurnos`) VALUES
(1, 'Buenos Aires', 'buenos aires 123', 'buenosAires.jpg', '15'),
(2, 'Shangai', 'shangai 123', 'shangaiCentroMedico.jpg', '20'),
(3, 'Akara', 'akara 123', 'akaraCentroMedico.jpg', '30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `id` int(8) NOT NULL,
  `modelo` varchar(15) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `capacidadTotal` int(10) NOT NULL,
  `pasajeros` text CHARACTER SET utf8 NOT NULL,
  `cap_gen` int(11) NOT NULL DEFAULT 0,
  `cap_fam` int(11) NOT NULL DEFAULT 0,
  `cap_sui` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`id`, `modelo`, `tipo`, `capacidadTotal`, `pasajeros`, `cap_gen`, `cap_fam`, `cap_sui`) VALUES
(2, 'Calandria', 'Orbital', 300, '1,2,3', 200, 75, 25),
(3, 'Colibri', 'Orbital', 120, '1,2,3', 100, 18, 2),
(4, 'Zorzal', 'BA', 100, '2,3', 50, 0, 50),
(5, 'Carancho', 'BA', 110, '2,3', 110, 0, 0),
(6, 'Aguilucho', 'BA', 60, '2,3', 0, 50, 10),
(7, 'Canario', 'BA', 80, '2,3', 0, 70, 10),
(8, 'Aguila', 'AA', 300, '2,3', 200, 75, 25),
(9, 'Condor', 'AA', 350, '2,3', 300, 10, 40),
(10, 'Halcon', 'AA', 200, '3', 150, 25, 25),
(11, 'Guanaco', 'AA', 100, '3', 0, 0, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nave_espacial`
--

CREATE TABLE `nave_espacial` (
  `matricula` varchar(10) CHARACTER SET utf8 NOT NULL,
  `modelo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nave_espacial`
--

INSERT INTO `nave_espacial` (`matricula`, `modelo`) VALUES
('O1', 2),
('O2', 2),
('O6', 2),
('O7', 2),
('O3', 3),
('O4', 3),
('O5', 3),
('O8', 3),
('O9', 3),
('BA1', 4),
('BA2', 4),
('BA3', 4),
('BA4', 5),
('BA5', 5),
('BA6', 5),
('BA7', 5),
('BA10', 6),
('BA11', 6),
('BA12', 6),
('BA8', 6),
('BA9', 6),
('BA13', 7),
('BA14', 7),
('BA15', 7),
('BA16', 7),
('BA17', 7),
('AA1', 8),
('AA13', 8),
('AA17', 8),
('AA5', 8),
('AA9', 8),
('AA10', 9),
('AA14', 9),
('AA18', 9),
('AA2', 9),
('AA6', 9),
('AA11', 10),
('AA15', 10),
('AA19', 10),
('AA3', 10),
('AA7', 10),
('AA12', 11),
('AA16', 11),
('AA4', 11),
('AA8', 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(45) NOT NULL,
  `centroMedico` int(10) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL,
  `realizado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `codigo`, `centroMedico`, `idUsuario`, `fechaHora`, `realizado`) VALUES
(1, '2785cc2d8cc15885185a6488e44497ef', 2, 2, '2021-10-27 01:56:29', NULL),
(2, '2c1816bd27580db7b2d4194c2a207b9f', 1, 2, '2021-10-27 01:58:09', NULL),
(3, '619c2e51c09db097605dc1680b4ab1e9', 1, 3, '2021-10-27 02:13:24', 1),
(4, '41e0c4ac84c3efaafafa7396c9e007d4', 1, 3, '2021-10-27 02:19:04', 1),
(5, '96aecb335356e69855e98cdcef63f802', 2, 3, '2021-10-27 02:22:20', 1),
(6, 'a063b5762984f61d78e7c98f567f88b0', 2, 3, '2021-10-27 02:22:41', 1),
(7, 'e50f0ae5c2fc483a38e87c54e6b48678', 3, 3, '2021-10-27 02:23:05', 1),
(8, '9836c637771bc24d9a92a2ad949f787f', 3, 3, '2021-10-27 02:26:47', NULL),
(10, '015c4717dfece22c1164da1f205e0eb3', 1, 62, '2021-11-19 00:00:00', 1),
(11, '31b0681ca068445dde5a0aeda55d2eb7', 1, 58, '2021-11-26 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suborbitales`
--

CREATE TABLE `suborbitales` (
  `id` int(10) UNSIGNED NOT NULL,
  `dia` varchar(10) NOT NULL,
  `duracion` int(11) NOT NULL,
  `partida` varchar(45) NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `suborbitales`
--

INSERT INTO `suborbitales` (`id`, `dia`, `duracion`, `partida`, `horario`) VALUES
(1, 'Lunes', 8, 'Buenos aires', '09:00:00'),
(2, 'Lunes', 8, 'Buenos aires', '13:00:00'),
(3, 'Lunes', 8, 'Buenos aires', '18:00:00'),
(4, 'Lunes', 8, 'Ankara', '09:00:00'),
(5, 'Lunes', 8, 'Ankara', '13:00:00'),
(6, 'Martes', 8, 'Buenos aires', '09:00:00'),
(7, 'Martes', 8, 'Buenos aires', '13:00:00'),
(8, 'Martes', 8, 'Buenos aires', '18:00:00'),
(9, 'Martes', 8, 'Ankara', '09:00:00'),
(10, 'Martes', 8, 'Ankara', '13:00:00'),
(11, 'Miercoles', 8, 'Buenos aires', '09:00:00'),
(12, 'Miercoles', 8, 'Buenos aires', '13:00:00'),
(13, 'Miercoles', 8, 'Buenos aires', '18:00:00'),
(14, 'Miercoles', 8, 'Ankara', '09:00:00'),
(15, 'Miercoles', 8, 'Ankara', '13:00:00'),
(16, 'Jueves', 8, 'Buenos aires', '09:00:00'),
(17, 'Jueves', 8, 'Buenos aires', '13:00:00'),
(18, 'Jueves', 8, 'Buenos aires', '18:00:00'),
(19, 'Jueves', 8, 'Ankara', '09:00:00'),
(20, 'Jueves', 8, 'Ankara', '13:00:00'),
(21, 'Viernes', 8, 'Buenos aires', '09:00:00'),
(22, 'Viernes', 8, 'Buenos aires', '13:00:00'),
(23, 'Viernes', 8, 'Buenos aires', '18:00:00'),
(24, 'Viernes', 8, 'Ankara', '09:00:00'),
(25, 'Viernes', 8, 'Ankara', '13:00:00'),
(26, 'Sabado', 8, 'Buenos aires', '09:00:00'),
(27, 'Sabado', 8, 'Buenos aires', '13:00:00'),
(28, 'Sabado', 8, 'Buenos aires', '18:00:00'),
(29, 'Sabado', 8, 'Buenos aires', '21:00:00'),
(30, 'Sabado', 8, 'Ankara', '09:00:00'),
(31, 'Sabado', 8, 'Ankara', '13:00:00'),
(32, 'Sabado', 8, 'Ankara', '18:00:00'),
(33, 'Sabado', 8, 'Ankara', '21:00:00'),
(34, 'Domingo', 8, 'Buenos aires', '09:00:00'),
(35, 'Domingo', 8, 'Buenos aires', '13:00:00'),
(36, 'Domingo', 8, 'Buenos aires', '18:00:00'),
(37, 'Domingo', 8, 'Buenos aires', '21:00:00'),
(38, 'Domingo', 8, 'Buenos aires', '00:00:00'),
(39, 'Domingo', 8, 'Ankara', '09:00:00'),
(40, 'Domingo', 8, 'Ankara', '13:00:00'),
(41, 'Domingo', 8, 'Ankara', '18:00:00'),
(42, 'Domingo', 8, 'Ankara', '21:00:00'),
(43, 'Domingo', 8, 'Ankara', '00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suborbitales_reservas`
--

CREATE TABLE `suborbitales_reservas` (
  `id` int(10) UNSIGNED NOT NULL,
  `fechayhora` datetime NOT NULL,
  `desde` varchar(45) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  `usuario` int(11) DEFAULT NULL,
  `tipoAsiento` varchar(45) DEFAULT NULL,
  `numeroAsiento` int(11) DEFAULT NULL,
  `servicio` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `suborbitales_reservas`
--

INSERT INTO `suborbitales_reservas` (`id`, `fechayhora`, `desde`, `matricula`, `usuario`, `tipoAsiento`, `numeroAsiento`, `servicio`) VALUES
(39, '2021-11-22 09:00:00', 'Buenos aires', 'O1', NULL, NULL, NULL, NULL),
(40, '2021-11-22 09:00:00', 'Buenos aires', 'O1', 62, 'familiar', 51, 'gourmet'),
(41, '2021-11-22 13:00:00', 'Buenos aires', 'O5', NULL, NULL, NULL, NULL),
(42, '2021-11-22 09:00:00', 'Buenos aires', 'O1', 58, 'familiar', 51, 'gourmet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tour`
--

CREATE TABLE `tour` (
  `id` int(11) NOT NULL,
  `dia` varchar(10) NOT NULL,
  `duracion` int(11) NOT NULL,
  `partida` varchar(45) NOT NULL,
  `horario` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tour`
--

INSERT INTO `tour` (`id`, `dia`, `duracion`, `partida`, `horario`) VALUES
(1, 'Domingo', 840, 'Buenos Aires', '09:00:00'),
(2, 'Domingo', 840, 'Buenos Aires', '09:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `tipo` tinyint(1) UNSIGNED DEFAULT NULL,
  `codigoValidacion` varchar(45) DEFAULT 'validacionManual'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `fechaNacimiento`, `email`, `password`, `idCargo`, `tipo`, `codigoValidacion`) VALUES
(1, 'Braian', 'Guzman', '1988-09-04', 'brian_user@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 0, NULL),
(2, 'Elsie ', 'Vazquez', '1998-08-19', 'elsie@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 0, NULL),
(3, 'Miguel', 'Vazquez', '2018-12-04', 'miguel@hotmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 0, NULL),
(4, 'alejandro', 'gonzalez', '1996-12-17', 'saleck@saleck.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 0, NULL),
(58, 'Alejandro', 'Gonzalez', '1996-12-17', 'aledagonale@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 2, 1, NULL),
(62, 'Leandro', 'Gomez', '1997-01-25', 'leandro.ariel.gomez1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vuelo`
--

CREATE TABLE `vuelo` (
  `id` int(8) NOT NULL,
  `dia` datetime DEFAULT NULL,
  `duracion` varchar(11) CHARACTER SET utf8 NOT NULL,
  `equipo` varchar(10) CHARACTER SET utf8 NOT NULL,
  `partida` varchar(40) CHARACTER SET utf8 NOT NULL,
  `destino` varchar(40) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `centrosmedicos`
--
ALTER TABLE `centrosmedicos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nave_espacial`
--
ALTER TABLE `nave_espacial`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `fk_modelo` (`modelo`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `suborbitales`
--
ALTER TABLE `suborbitales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `suborbitales_reservas`
--
ALTER TABLE `suborbitales_reservas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `usuario_idx` (`usuario`),
  ADD KEY `matricula_idx` (`matricula`);

--
-- Indices de la tabla `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `id_cargo` (`idCargo`);

--
-- Indices de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_equipo` (`equipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cargo`
--
ALTER TABLE `cargo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `centrosmedicos`
--
ALTER TABLE `centrosmedicos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `suborbitales`
--
ALTER TABLE `suborbitales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `suborbitales_reservas`
--
ALTER TABLE `suborbitales_reservas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `tour`
--
ALTER TABLE `tour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `vuelo`
--
ALTER TABLE `vuelo`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `nave_espacial`
--
ALTER TABLE `nave_espacial`
  ADD CONSTRAINT `fk_modelo` FOREIGN KEY (`modelo`) REFERENCES `modelos` (`id`);

--
-- Filtros para la tabla `suborbitales_reservas`
--
ALTER TABLE `suborbitales_reservas`
  ADD CONSTRAINT `suborbitales_reservas_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `vuelo`
--
ALTER TABLE `vuelo`
  ADD CONSTRAINT `fk_equipo` FOREIGN KEY (`equipo`) REFERENCES `nave_espacial` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
