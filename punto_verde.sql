-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2024 at 06:21 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `punto_verde`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id` int UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `fecha`) VALUES
(1, 'tartas', '2024-07-11 02:44:15'),
(2, 'crepas', '2024-07-11 02:44:15'),
(3, 'ensaladas', '2024-07-11 02:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `datos_cliente`
--

CREATE TABLE `datos_cliente` (
  `id` int UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `domicilio` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `localidad` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` int UNSIGNED DEFAULT NULL,
  `usuario_id` int UNSIGNED DEFAULT NULL,
  `fecha` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `datos_cliente`
--

INSERT INTO `datos_cliente` (`id`, `nombre`, `domicilio`, `localidad`, `telefono`, `usuario_id`, `fecha`) VALUES
(1, 'Juan Nieto', 'marmol 1139', 'dorrego', 261523232, 1, '2024-07-11 06:15:10'),
(2, 'Isis Press', 'las glicinas 2314', 'las heras', 2615641215, 2, '2024-07-11 06:15:10'),
(3, 'Bandido NN', 'maipu 323 piso 1 dpto b', 'ciudad de mendoza', 2613335622, 3, '2024-07-11 06:15:10'),
(4, 'Mora NN', 'aconcagua 66563', 'potrerillos', 261565611, 4, '2024-07-11 06:15:10');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` double NOT NULL,
  `stock` int NOT NULL,
  `categoria_id` int UNSIGNED DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`, `stock`, `categoria_id`, `fecha`) VALUES
(1, 'calabaza asada', 2700, 4, NULL, '2024-07-11 02:49:11'),
(29, 'zapallito', 2700, 5, 1, '2024-07-11 02:59:39'),
(30, 'zuccini', 2700, 3, 1, '2024-07-11 02:59:39'),
(31, 'mix de verduras', 2700, 6, 1, '2024-07-11 02:59:39'),
(32, 'acelga', 2700, 9, 1, '2024-07-11 02:59:39'),
(33, 'aclega y choclo', 2700, 2, 1, '2024-07-11 02:59:39'),
(34, 'acelga y calabaza', 2700, 1, 1, '2024-07-11 02:59:39'),
(35, 'mediterranea', 2900, 3, 1, '2024-07-11 02:59:39'),
(36, 'brocoli', 2900, 1, 1, '2024-07-11 02:59:39'),
(37, 'sufle de espinaca', 3500, 2, NULL, '2024-07-11 02:59:39'),
(38, 'acelga', 2900, 3, 2, '2024-07-11 03:08:52'),
(39, 'zanahoria', 2900, 5, 2, '2024-07-11 03:08:52'),
(40, 'proteica', 2100, 2, 3, '2024-07-11 03:12:55'),
(41, 'siete colores', 1900, 5, 3, '2024-07-11 03:12:55'),
(42, 'quinoa mix', 2300, 2, 3, '2024-07-11 03:12:55'),
(43, 'mix verduras', 1900, 4, 3, '2024-07-11 03:12:55');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int UNSIGNED NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` int UNSIGNED DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `role`, `fecha_registro`) VALUES
(1, 'Juan Nieto', 'jn@x.com', '123456', 1, '2024-07-11 02:34:04'),
(2, 'Isis Press', 'ip@x.com', '123456', NULL, '2024-07-11 02:34:04'),
(3, 'Bandido NN', 'bn@x.com', '123456', NULL, '2024-07-11 02:34:04'),
(4, 'Mora NN', 'mn@x.com', '123456', NULL, '2024-07-11 02:34:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `datos_cliente`
--
ALTER TABLE `datos_cliente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `registros` (`usuario_id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prducts_cat_1` (`categoria_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `datos_cliente`
--
ALTER TABLE `datos_cliente`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `datos_cliente`
--
ALTER TABLE `datos_cliente`
  ADD CONSTRAINT `registros` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `prducts_cat_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
