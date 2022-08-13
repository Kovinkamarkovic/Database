-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 16, 2018 at 06:30 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biser`
--

-- --------------------------------------------------------

--
-- Table structure for table `galerije`
--

DROP TABLE IF EXISTS `galerije`;
CREATE TABLE IF NOT EXISTS `galerije` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazivGalerije` varchar(50) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kategorija-proizvoda` varchar(50) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerije`
--

INSERT INTO `galerije` (`id`, `nazivGalerije`, `vreme`, `kategorija-proizvoda`, `obrisan`) VALUES
(1, 'Odezde', '2018-07-10 11:56:51', 'svestenstvo', 0),
(2, 'Svestenstvo', '2018-07-15 12:12:07', 'svestenstvo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `galerijeslike`
--

DROP TABLE IF EXISTS `galerijeslike`;
CREATE TABLE IF NOT EXISTS `galerijeslike` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idgalerije` int(2) NOT NULL,
  `slika` varchar(50) NOT NULL,
  `komentar` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerijeslike`
--

INSERT INTO `galerijeslike` (`id`, `idgalerije`, `slika`, `komentar`) VALUES
(1, 1, '2.jpg', NULL),
(2, 1, '4.jpg', NULL),
(3, 1, '5.jpg', NULL),
(4, 1, '7.jpg', NULL),
(5, 1, '9.jpg', NULL),
(6, 1, '12.jpg', NULL),
(7, 1, '16.jpg', NULL),
(8, 1, '17.jpg', NULL),
(9, 2, '1.jpg', NULL),
(10, 2, '3.jpg', NULL),
(11, 2, '6.jpg', NULL),
(12, 2, '8.jpg', NULL),
(13, 2, '10.jpg', NULL),
(14, 2, '11.jpg', NULL),
(15, 2, '13.jpg', NULL),
(16, 2, '14.jpg', NULL),
(17, 2, '15.jpg', NULL),
(18, 2, '18.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
CREATE TABLE IF NOT EXISTS `kategorija` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `naziv`, `obrisan`) VALUES
(1, 'Svestenstvo', 0),
(2, 'Narodne nosnje', 0),
(6, 'Modna konfekcija', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kontakt-firme`
--

DROP TABLE IF EXISTS `kontakt-firme`;
CREATE TABLE IF NOT EXISTS `kontakt-firme` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv-firme` varchar(50) NOT NULL,
  `adresa-firme` varchar(50) NOT NULL,
  `maticni-broj-firme` int(3) NOT NULL,
  `pib` int(3) NOT NULL,
  `telefon` int(3) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

DROP TABLE IF EXISTS `proizvodi`;
CREATE TABLE IF NOT EXISTS `proizvodi` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `kategorija` varchar(50) NOT NULL,
  `slikaproizvoda` varchar(50) DEFAULT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  `opisproizvoda` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`id`, `naziv`, `kategorija`, `slikaproizvoda`, `obrisan`, `opisproizvoda`) VALUES
(1, 'Odezde za vladike', 'svestenstvo', '4.jpg', 0, 'odezde su sivene od najkvalitetnijeg materijala vez je uradjen rucno'),
(2, 'Odezde za svestenike', 'svestenstvo', '16.jpg', 0, 'odezde su sivene od najkvalitetnijeg materijala vez je uradjen rucno'),
(3, 'Odezde za djakone', 'svestenstvo', NULL, 0, 'odezde su sivene od najkvalitetnijeg materijala vez je uradjen rucno'),
(4, 'Mantije ruski kroj(letnja,zimska)', 'svestenstvo', NULL, 0, 'mantije su sivene od najfinijih materijala '),
(5, 'Mantije grcki kroj(letnja,zimska)', 'svestenstvo', '7.jpg', 0, 'mantije su sivene od najfinijih materijala '),
(6, 'Mantije srpski kroj(letnja,zimska)', 'svestenstvo', NULL, 0, 'mantije su sivene od najfinijih materijala '),
(7, 'Barjak', 'svestenstvo', '13.jpg', 0, 'barjaci su  siveni od najkvalitetnijeg materijala vez je radjen rucno'),
(8, 'Komplet Vranjske  narodne nosnje za muskarce', 'Narodne nosnje', NULL, 0, 'U komplet  Vranjske narodne nosnje spada jelek,caksire,dolama,tkanica(pojas i kosulja) sve je siveno od najkvalitetnijih vrsta materijala'),
(9, 'Komplet Vranjske narodne nosnje za zene', 'Narodne nosnje', NULL, 0, 'U komplet  Vranjske narodne nosnje spada libada,salvare,anterije,kosulja,marama,mintani i tkanica(pojas)'),
(10, 'Komplet Sumadijske narodne nosnje za muskarce', 'Narodne nosnje', NULL, 0, 'U komplet  Sumadijske narodne nosnje spada sajkaca,jelek,gunj,tkaninica(pojas),cojane-pantalone i kosulja sa vezom'),
(11, 'Komplet Sumadijske  narodne nosnje za zene', 'Narodne nosnje', NULL, 0, 'U komplet  Sumadijske narodne nosnje spada marama,jelek,suknja,tkaninica(pojas),kusulja sa vezom i kecelja sa punim vezom'),
(12, 'Program za muskarce', 'Modna konfekcija', NULL, 0, 'U program  za muskarce spada kosulje, majce, pantalone, jakne, sakoi, komplet odela i salovi'),
(13, 'Program za zene', 'Modna konfekcija', NULL, 0, 'U program za zene spada kosulje, majce, pantalone, jakne, sakoi, komplet odela, suknje, letnje haljine, svecane haljine, maturske haljine, blejzeri i esarpe');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
CREATE TABLE IF NOT EXISTS `zaposleni` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(50) NOT NULL,
  `prezime` varchar(50) NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `telefon` int(3) NOT NULL,
  `pozicija` varchar(50) NOT NULL,
  `plata` int(3) NOT NULL,
  `staz` int(3) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
