-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2019 at 03:25 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restoran`
--

-- --------------------------------------------------------

--
-- Table structure for table `galerije`
--

DROP TABLE IF EXISTS `galerije`;
CREATE TABLE IF NOT EXISTS `galerije` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazivGalerije` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerije`
--

INSERT INTO `galerije` (`id`, `nazivGalerije`) VALUES
(1, 'Predjela'),
(2, 'Glavna jela'),
(3, 'Desert'),
(4, 'Morski plodovi'),
(5, 'Salate'),
(6, 'Jela sa rostilja');

-- --------------------------------------------------------

--
-- Table structure for table `galerijsike`
--

DROP TABLE IF EXISTS `galerijsike`;
CREATE TABLE IF NOT EXISTS `galerijsike` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idGalerije` int(2) NOT NULL,
  `slika` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerijsike`
--

INSERT INTO `galerijsike` (`id`, `idGalerije`, `slika`) VALUES
(1, 1, '1.jpg'),
(2, 1, '2.jpg'),
(3, 1, '3.jpg'),
(4, 1, '4.jpg'),
(5, 1, '5.jpg'),
(6, 2, '11.jpg'),
(7, 2, '12.jpg'),
(8, 2, '13.jpg'),
(9, 2, '14.jpg'),
(10, 2, '15.jpg'),
(11, 3, '21.jpg'),
(12, 3, '22.jpg'),
(13, 3, '23.jpg'),
(14, 3, '24.jpg'),
(15, 3, '25.jpg'),
(16, 4, '30.jpg'),
(17, 4, '29.jpg'),
(18, 4, '26.jpg'),
(19, 4, '27.jpg'),
(20, 4, '28.jpg'),
(21, 5, '6.jpg'),
(22, 5, '7.jpg'),
(23, 5, '8.jpg'),
(24, 5, '9.jpg'),
(25, 5, '10.jpg'),
(26, 6, '16.jpg'),
(27, 6, '17.jpg'),
(28, 6, '18.jpg'),
(29, 6, '19.jpg'),
(30, 6, '20.jpg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
