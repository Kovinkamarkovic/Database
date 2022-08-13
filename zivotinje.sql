-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2022 at 07:49 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zivotinje`
--

-- --------------------------------------------------------

--
-- Table structure for table `zivotinja`
--

CREATE TABLE `zivotinja` (
  `zivotinja_id` int(10) UNSIGNED NOT NULL,
  `ime` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `vrsta` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rasa` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tezina` double UNSIGNED NOT NULL,
  `starost` int(10) UNSIGNED NOT NULL,
  `pol` enum('muski','zenski') COLLATE utf8_unicode_ci NOT NULL,
  `is_vakcinisan` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `zivotinja`
--

INSERT INTO `zivotinja` (`zivotinja_id`, `ime`, `vrsta`, `rasa`, `tezina`, `starost`, `pol`, `is_vakcinisan`) VALUES
(1, 'Eko', 'Canis lupus familijaris', 'Sibirski haski', 23.4, 96, 'muski', 1),
(2, 'Maza', 'Canis lupus familijaris', 'Zlatni retriver ', 28.1, 102, 'zenski', 1),
(3, 'Dzimi', 'Canis lupus familijaris', 'Bigl', 10.5, 43, 'muski', 1),
(4, 'Oskar', 'Felis silvestris catus', 'Sijamska macka', 4.3, 7, 'muski', 0),
(5, 'Ladv', 'Felis silvestris catus', 'Egipatska Mau macka', 4.1, 11, 'zenski', 1),
(6, 'Meda', 'Felis silvestris catus', 'Norveska sumska macka', 5.1, 7, 'muski', 0),
(7, 'Sdok', 'Felis silvestris catus', 'Abisinska macka', 3.1, 4, 'muski', 1),
(8, 'Lara', 'Nvmdhicus holandicus', 'Nimfa', 0.087, 6, 'zenski', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `zivotinja`
--
ALTER TABLE `zivotinja`
  ADD PRIMARY KEY (`zivotinja_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `zivotinja`
--
ALTER TABLE `zivotinja`
  MODIFY `zivotinja_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
