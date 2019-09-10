-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-09-2019 a las 02:59:47
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_practica_1`
--

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pag21_ejercicio_1`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pag21_ejercicio_1` (
`pnro` int(11)
,`pnombre` varchar(50)
,`precio` float
,`tamaño` int(11)
,`localidad` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pag21_ejercicio_2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pag21_ejercicio_2` (
`numero` int(11)
,`nombre` varchar(20)
,`domicilio` varchar(50)
,`localidad` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pag21_ejercicio_3`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pag21_ejercicio_3` (
`numero` int(11)
,`pnro` int(11)
,`cantidad` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pag21_ejercicio_4`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pag21_ejercicio_4` (
`pnro` int(11)
,`pnombre` varchar(50)
,`precio` float
,`tamaño` int(11)
,`localidad` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `pnro` int(11) NOT NULL,
  `pnombre` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `tamaño` int(11) NOT NULL,
  `localidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`pnro`, `pnombre`, `precio`, `tamaño`, `localidad`) VALUES
(1, 'Gaseosa', 50, 10, 'CABA'),
(2, 'Jugo', 60, 10, 'CABA'),
(3, 'Agua', 75, 10, 'CORDOBA'),
(4, 'Agua Saborizada', 80, 10, 'AVELLANEDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `numero` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `domicilio` varchar(50) NOT NULL,
  `localidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`numero`, `nombre`, `domicilio`, `localidad`) VALUES
(100, 'CocaCola', 'Rivadavia 900', 'CABA'),
(101, 'Pepsi', 'Chutro 3135', 'CABA'),
(102, 'Villavicencio', 'Trote 23', 'CORDOBA'),
(103, 'Sierra de los padres', 'Cacun 58', 'AVELLANEDA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prov_prod`
--

CREATE TABLE `prov_prod` (
  `numero` int(11) NOT NULL,
  `pnro` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `prov_prod`
--

INSERT INTO `prov_prod` (`numero`, `pnro`, `cantidad`) VALUES
(100, 1, 1000),
(101, 1, 500),
(102, 3, 250),
(103, 3, 1500),
(103, 4, 100);

-- --------------------------------------------------------

--
-- Estructura para la vista `pag21_ejercicio_1`
--
DROP TABLE IF EXISTS `pag21_ejercicio_1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pag21_ejercicio_1`  AS  select `productos`.`pnro` AS `pnro`,`productos`.`pnombre` AS `pnombre`,`productos`.`precio` AS `precio`,`productos`.`tamaño` AS `tamaño`,`productos`.`localidad` AS `localidad` from `productos` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pag21_ejercicio_2`
--
DROP TABLE IF EXISTS `pag21_ejercicio_2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pag21_ejercicio_2`  AS  select `proveedores`.`numero` AS `numero`,`proveedores`.`nombre` AS `nombre`,`proveedores`.`domicilio` AS `domicilio`,`proveedores`.`localidad` AS `localidad` from `proveedores` where (`proveedores`.`localidad` like 'CABA') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pag21_ejercicio_3`
--
DROP TABLE IF EXISTS `pag21_ejercicio_3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pag21_ejercicio_3`  AS  select `prov_prod`.`numero` AS `numero`,`prov_prod`.`pnro` AS `pnro`,`prov_prod`.`cantidad` AS `cantidad` from `prov_prod` where (`prov_prod`.`cantidad` between 200 and 300) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pag21_ejercicio_4`
--
DROP TABLE IF EXISTS `pag21_ejercicio_4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pag21_ejercicio_4`  AS  select `productos`.`pnro` AS `pnro`,`productos`.`pnombre` AS `pnombre`,`productos`.`precio` AS `precio`,`productos`.`tamaño` AS `tamaño`,`productos`.`localidad` AS `localidad` from `productos` where (`productos`.`localidad` like 'AVELLANEDA') ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`pnro`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`numero`);

--
-- Indices de la tabla `prov_prod`
--
ALTER TABLE `prov_prod`
  ADD KEY `fk_prno_prov_prod` (`pnro`),
  ADD KEY `fk_numero_prov_prod` (`numero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prov_prod`
--
ALTER TABLE `prov_prod`
  ADD CONSTRAINT `fk_numero_prov_prod` FOREIGN KEY (`numero`) REFERENCES `proveedores` (`numero`),
  ADD CONSTRAINT `fk_prno_prov_prod` FOREIGN KEY (`pnro`) REFERENCES `productos` (`pnro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
