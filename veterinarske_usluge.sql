-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 10:54 AM
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
-- Database: `domace_zivotinje`
--

-- --------------------------------------------------------

--
-- Table structure for table `rasa`
--

DROP TABLE IF EXISTS `rasa`;
CREATE TABLE IF NOT EXISTS `rasa` (
  `rasa_id` int(10) UNSIGNED NOT NULL,
  `naziv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vrsta_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`rasa_id`) USING BTREE,
  UNIQUE KEY `naziv_UNIQUE` (`naziv`) USING BTREE,
  KEY `fk_rasa_vrsta_id_idx` (`vrsta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `rasa`
--

INSERT INTO `rasa` (`rasa_id`, `naziv`, `vrsta_id`) VALUES
(1, 'Sibirski haski', 1),
(2, 'latni retriver', 1),
(3, 'Bigl', 1),
(4, 'Sijamska macka', 2),
(5, 'Egipatska Mau macka', 2),
(6, 'Norveska sumska macka', 2),
(7, 'Abisinska macka', 2),
(8, 'Nimfa', 3);

-- --------------------------------------------------------

--
-- Table structure for table `vakcinacija`
--

DROP TABLE IF EXISTS `vakcinacija`;
CREATE TABLE IF NOT EXISTS `vakcinacija` (
  `vakcinacija_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `zivotinja_id` int(10) UNSIGNED NOT NULL,
  `vakcinisan_at` datetime NOT NULL,
  `naziv_vakcine` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vakcinacija_id`) USING BTREE,
  KEY `fk_vakcinacija_zivotinja_id_idx` (`zivotinja_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `vakcinacija`
--

INSERT INTO `vakcinacija` (`vakcinacija_id`, `zivotinja_id`, `vakcinisan_at`, `naziv_vakcine`) VALUES
(1, 1, '2017-10-01 10:00:00', 'vakcina01'),
(2, 2, '2017-10-02 11:02:00', 'vakcina01'),
(3, 3, '2017-10-03 09:30:00', 'vakcina01'),
(4, 5, '2017-10-03 11:00:00', 'vakcina02'),
(5, 7, '2017-10-11 13:45:00', 'vakcina12');

-- --------------------------------------------------------

--
-- Table structure for table `vrsta`
--

DROP TABLE IF EXISTS `vrsta`;
CREATE TABLE IF NOT EXISTS `vrsta` (
  `vrsta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`vrsta_id`) USING BTREE,
  UNIQUE KEY `naziv_UNIQUE` (`naziv`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `vrsta`
--

INSERT INTO `vrsta` (`vrsta_id`, `naziv`) VALUES
(1, 'Canis lupus familijaris'),
(2, 'Felis silvestris catus'),
(3, 'Nvmdhicus hollandicus');

-- --------------------------------------------------------

--
-- Table structure for table `zivotinje`
--

DROP TABLE IF EXISTS `zivotinje`;
CREATE TABLE IF NOT EXISTS `zivotinje` (
  `zivotinja_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rasa_id` int(10) UNSIGNED NOT NULL,
  `tezina` double UNSIGNED NOT NULL,
  `starost` int(10) UNSIGNED NOT NULL,
  `pol` enum('muski','zenski') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`zivotinja_id`) USING BTREE,
  KEY `fk_zivotinja_rasa_id_idx` (`rasa_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `zivotinje`
--

INSERT INTO `zivotinje` (`zivotinja_id`, `ime`, `rasa_id`, `tezina`, `starost`, `pol`) VALUES
(1, 'Eko', 1, 23.4, 96, 'muski'),
(2, 'Maza', 2, 28.1, 102, 'zenski'),
(3, 'Dzimi', 3, 10.5, 43, 'muski'),
(4, 'Oskar', 4, 4.3, 7, 'muski'),
(5, 'Lady', 5, 4.1, 11, 'zenski'),
(6, 'Meda', 6, 5.1, 7, 'muski'),
(7, 'Sdok', 7, 3.1, 4, 'muski'),
(8, 'Lara', 8, 0.087, 6, 'zenski');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rasa`
--
ALTER TABLE `rasa`
  ADD CONSTRAINT `fk_rasa_vrsta_id` FOREIGN KEY (`vrsta_id`) REFERENCES `vrsta` (`vrsta_id`) ON UPDATE CASCADE;

--
-- Constraints for table `vakcinacija`
--
ALTER TABLE `vakcinacija`
  ADD CONSTRAINT `fk_vakcinacija_zivotinja_id` FOREIGN KEY (`zivotinja_id`) REFERENCES `zivotinje` (`zivotinja_id`) ON UPDATE CASCADE;

--
-- Constraints for table `zivotinje`
--
ALTER TABLE `zivotinje`
  ADD CONSTRAINT `fk_zivotinja_rasa_id` FOREIGN KEY (`rasa_id`) REFERENCES `rasa` (`rasa_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
