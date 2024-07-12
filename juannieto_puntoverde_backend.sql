-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: mysql-juannieto.alwaysdata.net
-- Tiempo de generación: 12-07-2024 a las 19:50:18
-- Versión del servidor: 10.11.8-MariaDB
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juannieto_puntoverde_backend`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`) VALUES
(1, 'tartas'),
(2, 'crepas'),
(3, 'ensaladas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_cliente`
--

CREATE TABLE `datos_cliente` (
  `id_datos_cliente` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `domicilio` varchar(100) NOT NULL,
  `localidad` varchar(60) NOT NULL,
  `telefono` int(10) UNSIGNED DEFAULT NULL,
  `id_usuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `datos_cliente`
--

INSERT INTO `datos_cliente` (`id_datos_cliente`, `nombre`, `apellido`, `domicilio`, `localidad`, `telefono`, `id_usuario`) VALUES
(1, 'Juan Nieto', NULL, 'marmol 1139', 'dorrego', 261523232, 1),
(2, 'Isis Press', NULL, 'las glicinas 2314', 'las heras', 2615641215, 2),
(3, 'Bandido NN', NULL, 'maipu 323 piso 1 dpto b', 'ciudad de mendoza', 2613335622, 3),
(4, 'Mora NN', NULL, 'aconcagua 66563', 'potrerillos', 261565611, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `id_categoria` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `precio`, `stock`, `id_categoria`) VALUES
(1, 'calabaza asada', 2700, 4, NULL),
(29, 'zapallito', 2700, 5, 1),
(30, 'zuccini', 2700, 3, 1),
(31, 'mix de verduras', 2700, 6, 1),
(32, 'acelga', 2700, 9, 1),
(33, 'aclega y choclo', 2700, 2, 1),
(34, 'acelga y calabaza', 2700, 1, 1),
(35, 'mediterranea', 2900, 3, 1),
(36, 'brocoli', 2900, 1, 1),
(37, 'sufle de espinaca', 3500, 2, NULL),
(38, 'acelga', 2900, 3, 2),
(39, 'zanahoria', 2900, 5, 2),
(40, 'proteica', 2100, 2, 3),
(41, 'siete colores', 1900, 5, 3),
(42, 'quinoa mix', 2300, 2, 3),
(43, 'mix verduras', 1900, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`) VALUES
(1, 'Juan Nieto', 'jn@x.com', '123456'),
(2, 'Isis Press', 'ip@x.com', '123456'),
(3, 'Bandido NN', 'bn@x.com', '123456'),
(4, 'Mora NN', 'mn@x.com', '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `datos_cliente`
--
ALTER TABLE `datos_cliente`
  ADD PRIMARY KEY (`id_datos_cliente`),
  ADD KEY `registros` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `prducts_cat_1` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `datos_cliente`
--
ALTER TABLE `datos_cliente`
  MODIFY `id_datos_cliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `datos_cliente`
--
ALTER TABLE `datos_cliente`
  ADD CONSTRAINT `registros` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `prducts_cat_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
