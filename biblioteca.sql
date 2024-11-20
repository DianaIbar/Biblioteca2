-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2024 a las 02:50:32
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `ID_Autores` int(11) NOT NULL,
  `Nombre_Autor` varchar(100) NOT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `Fecha_Nacimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`ID_Autores`, `Nombre_Autor`, `Nacionalidad`, `Fecha_Nacimiento`) VALUES
(1, 'Gabriel Garcia Marquez', 'Colombiana', 1927),
(2, 'J.K. Rowling', 'Británica', 1965),
(6, 'George Orwell', 'Británica', 1903),
(7, 'Ana Maria Matute', 'Española', 1925),
(8, 'Nicanor Parra', 'Chilena', 1914),
(9, 'Juan Gelma', 'Argentina', 1930);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_Categoria` int(11) NOT NULL,
  `Nombre_Categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_Categoria`, `Nombre_Categoria`) VALUES
(1, 'Novela'),
(2, 'Ciencia Ficcion'),
(3, 'Fantasia'),
(4, 'Ensayo'),
(5, 'Romance'),
(6, 'Autobiograficas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_Libro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `ID_Autor` int(11) DEFAULT NULL,
  `ID_Categoria` int(11) DEFAULT NULL,
  `Año_publicacion` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_Libro`, `Titulo`, `ID_Autor`, `ID_Categoria`, `Año_publicacion`, `Disponible`) VALUES
(1, 'Cien años de soledad', NULL, NULL, 1967, 1),
(2, 'Harry Poter y la Piedra Filosofal', NULL, NULL, 1997, 1),
(3, 'La era de 1984', NULL, NULL, 1949, 1),
(4, 'Violin y otras Cuestiones', NULL, NULL, 1956, 1),
(5, 'Cancioneros sin nombre', NULL, NULL, 1937, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamos` int(11) NOT NULL,
  `ID_Usuarios` int(11) DEFAULT NULL,
  `ID_Libros` int(11) DEFAULT NULL,
  `Fecha_Prestamo` date DEFAULT NULL,
  `Fecha_Devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_Prestamos`, `ID_Usuarios`, `ID_Libros`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, NULL, NULL, '2024-01-01', '2024-01-08'),
(2, NULL, NULL, '2024-02-02', '2024-02-08'),
(3, NULL, NULL, '2024-08-01', '2024-08-15'),
(4, NULL, NULL, '2024-08-02', '2024-08-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_usuarios`
--

CREATE TABLE `prestamos_usuarios` (
  `ID_Relacion` int(11) NOT NULL,
  `ID_Prestamos` int(11) NOT NULL,
  `ID_Usuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuarios` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_Usuarios`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'Carlos Martinez', 'Calle Luna 123', '123456789'),
(2, 'Lucia Fernandez', 'Avenida Sol 456', '987654321');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`ID_Autores`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_Categoria`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_Libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamos`);

--
-- Indices de la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD PRIMARY KEY (`ID_Relacion`),
  ADD KEY `ID_Prestamos` (`ID_Prestamos`),
  ADD KEY `ID_Usuarios` (`ID_Usuarios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuarios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `ID_Autores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_Categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  MODIFY `ID_Relacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD CONSTRAINT `prestamos_usuarios_ibfk_1` FOREIGN KEY (`ID_Prestamos`) REFERENCES `prestamos` (`ID_Prestamos`),
  ADD CONSTRAINT `prestamos_usuarios_ibfk_2` FOREIGN KEY (`ID_Usuarios`) REFERENCES `usuarios` (`ID_Usuarios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
