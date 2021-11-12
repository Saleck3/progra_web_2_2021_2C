-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2021 a las 23:29:31
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
(8, '9836c637771bc24d9a92a2ad949f787f', 3, 3, '2021-10-27 02:26:47', NULL);

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
(8, 'Leandro', 'Gomez', '1997-01-25', 'leandro.ariel.gomez1@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 2, 0, NULL);

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
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD KEY `id_cargo` (`idCargo`);

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
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
