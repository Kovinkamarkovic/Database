-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 10:52 AM
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
-- Database: `db_2008213514`
--

-- --------------------------------------------------------

--
-- Table structure for table `departman`
--

DROP TABLE IF EXISTS `departman`;
CREATE TABLE IF NOT EXISTS `departman` (
  `departman_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`departman_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `departman`
--

INSERT INTO `departman` (`departman_id`, `naziv`) VALUES
(1, 'NIJE U UPOTREBI'),
(2, 'Menadzment'),
(3, 'NIJE U UPOTREBI'),
(4, 'Prodaja'),
(5, 'NIJE U UPOTREBI');

-- --------------------------------------------------------

--
-- Table structure for table `kartica`
--

DROP TABLE IF EXISTS `kartica`;
CREATE TABLE IF NOT EXISTS `kartica` (
  `kartica_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `broj` bigint(11) UNSIGNED NOT NULL,
  `zaposleni_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`kartica_id`) USING BTREE,
  UNIQUE KEY `uq_kartica_broj` (`broj`) USING BTREE,
  KEY `fk_kartica_zaposleni_id` (`zaposleni_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `kartica`
--

INSERT INTO `kartica` (`kartica_id`, `created_at`, `broj`, `zaposleni_id`, `is_active`) VALUES
(6, '2019-03-16 12:36:23', 50125078001, 1, 0),
(7, '2019-03-16 12:36:23', 70128075521, 1, 1),
(8, '2019-03-16 12:36:23', 33117720029, 2, 1),
(9, '2019-03-16 12:36:23', 11378820054, 3, 0),
(10, '2019-03-16 12:36:23', 555031182739, 3, 1);

--
-- Triggers `kartica`
--
DROP TRIGGER IF EXISTS `trigger_kartica_bi`;
DELIMITER $$
CREATE TRIGGER `trigger_kartica_bi` BEFORE INSERT ON `kartica` FOR EACH ROW BEGIN
 IF NEW.broj < 10000000000 THEN
 SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Broj kartice ne sme da bude manji od 10000000000.';
END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_kartica_bu`;
DELIMITER $$
CREATE TRIGGER `trigger_kartica_bu` BEFORE UPDATE ON `kartica` FOR EACH ROW BEGIN
 IF NEW.broj < 10000000000 THEN
 SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Broj kartice ne sme da bude manji od 10000000000.';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mesto`
--

DROP TABLE IF EXISTS `mesto`;
CREATE TABLE IF NOT EXISTS `mesto` (
  `mesto_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`mesto_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `mesto`
--

INSERT INTO `mesto` (`mesto_id`, `naziv`) VALUES
(1, 'Glavni ulaz'),
(2, 'Sporedni ulaz'),
(3, 'Sprat A'),
(4, 'Sprat B'),
(5, 'Parking');

-- --------------------------------------------------------

--
-- Table structure for table `ocitavanje`
--

DROP TABLE IF EXISTS `ocitavanje`;
CREATE TABLE IF NOT EXISTS `ocitavanje` (
  `ocitavanje_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mesto_id` int(10) UNSIGNED NOT NULL,
  `kartica_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`ocitavanje_id`) USING BTREE,
  KEY `fk_ocitavanje_mesto_id` (`mesto_id`) USING BTREE,
  KEY `fk_ocitavanje_kartica_id` (`kartica_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ocitavanje`
--

INSERT INTO `ocitavanje` (`ocitavanje_id`, `created_at`, `mesto_id`, `kartica_id`) VALUES
(1, '2019-03-13 14:56:17', 1, 6),
(2, '2019-03-14 14:56:34', 1, 6),
(4, '2019-03-14 14:57:05', 2, 6),
(5, '2019-03-15 14:57:49', 4, 6),
(8, '2019-03-16 15:59:33', 3, 8),
(9, '2019-03-16 14:59:53', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `stepen_strucne_spreme`
--

DROP TABLE IF EXISTS `stepen_strucne_spreme`;
CREATE TABLE IF NOT EXISTS `stepen_strucne_spreme` (
  `stepen_strucne_spreme_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `oznaka` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`stepen_strucne_spreme_id`) USING BTREE,
  UNIQUE KEY `uq_stepen_strucne_spreme_oznaka` (`oznaka`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stepen_strucne_spreme`
--

INSERT INTO `stepen_strucne_spreme` (`stepen_strucne_spreme_id`, `naziv`, `oznaka`) VALUES
(1, 'cetvorogodisnja skola', 'IV'),
(2, 'trogodisnja visa skola', 'VI/2'),
(3, 'osnovne akademske studije', 'VII/1'),
(4, 'master studije', 'VII/2'),
(5, 'doktorat', 'VIII');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_departmani`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_departmani`;
CREATE TABLE IF NOT EXISTS `view_departmani` (
`departman_id` int(10) unsigned
,`naziv` varchar(64)
,`broj_zaposlenih` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_prijave`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_prijave`;
CREATE TABLE IF NOT EXISTS `view_prijave` (
`ocitavanje_id` int(10) unsigned
,`created_at` timestamp
,`mesto_id` int(10) unsigned
,`kartica_id` int(10) unsigned
,`zaposleni_id` int(10) unsigned
,`ime` varchar(64)
,`prezime` varchar(64)
,`jmbg` varchar(13)
,`departman_id` int(10) unsigned
,`stepen_strucne_spreme_id` int(10) unsigned
,`departman_naziv` varchar(64)
,`naziv_sss` varchar(64)
,`oznaka_sss` varchar(5)
,`naziv_mesta_otkucavanja` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_zaposleni`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_zaposleni`;
CREATE TABLE IF NOT EXISTS `view_zaposleni` (
`zaposleni_id` int(10) unsigned
,`created_at` timestamp
,`ime` varchar(64)
,`prezime` varchar(64)
,`jmbg` varchar(13)
,`born_at` date
,`departman_id` int(10) unsigned
,`stepen_strucne_spreme_id` int(10) unsigned
,`departman_naziv` varchar(64)
,`naziv_sss` varchar(64)
,`oznaka_sss` varchar(5)
);

-- --------------------------------------------------------

--
-- Table structure for table `zaposleni`
--

DROP TABLE IF EXISTS `zaposleni`;
CREATE TABLE IF NOT EXISTS `zaposleni` (
  `zaposleni_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ime` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `prezime` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `jmbg` varchar(13) COLLATE utf8_unicode_ci NOT NULL,
  `born_at` date NOT NULL,
  `departman_id` int(10) UNSIGNED NOT NULL,
  `stepen_strucne_spreme_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`zaposleni_id`) USING BTREE,
  UNIQUE KEY `uq_zaposlleni_jmbg` (`jmbg`) USING BTREE,
  KEY `fk_zaposleni_departman_id` (`departman_id`) USING BTREE,
  KEY `fkstepen_strucne_spreme_id` (`stepen_strucne_spreme_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `zaposleni`
--

INSERT INTO `zaposleni` (`zaposleni_id`, `created_at`, `ime`, `prezime`, `jmbg`, `born_at`, `departman_id`, `stepen_strucne_spreme_id`) VALUES
(1, '2019-03-16 12:27:51', 'Petar', 'Peric', '0112984710022', '1984-01-01', 4, 4),
(2, '2019-03-16 12:27:51', 'Ivana', 'Ivanic', '3001199071520', '1990-01-30', 2, 3),
(3, '2019-03-16 12:27:51', 'Jovana', 'Jovanovic', '2402972815012', '1972-02-24', 2, 2);

--
-- Triggers `zaposleni`
--
DROP TRIGGER IF EXISTS `trigger_zaposleni_bi`;
DELIMITER $$
CREATE TRIGGER `trigger_zaposleni_bi` BEFORE INSERT ON `zaposleni` FOR EACH ROW BEGIN
 IF CHAR_LENGTH(NEW.ime) < 2 OR CHAR_LENGTH(NEW.prezime) < 2 THEN
 SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Ime i prezime ne smeju da budu kraci od dva karaktera.';
 END IF;
 
 IF CHAR_LENGTH(NEW.jmbg) != 13  THEN
 SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'JMBG mora da ima tacko 13 karaktera.';
 END IF;

END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_zaposleni_bu`;
DELIMITER $$
CREATE TRIGGER `trigger_zaposleni_bu` BEFORE UPDATE ON `zaposleni` FOR EACH ROW BEGIN
 IF CHAR_LENGTH(NEW.ime) < 2 OR CHAR_LENGTH(NEW.prezime) < 2 THEN
 SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Ime i prezime ne smeju da budu kraci od dva karaktera.';
 END IF;
 
IF CHAR_LENGTH(NEW.jmbg) != 13  THEN
 SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'JMBG mora da ima tacko 13 karaktera.';
 END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `view_departmani`
--
DROP TABLE IF EXISTS `view_departmani`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_departmani`  AS  select `departman`.`departman_id` AS `departman_id`,`departman`.`naziv` AS `naziv`,count(`zaposleni`.`zaposleni_id`) AS `broj_zaposlenih` from (`departman` left join `zaposleni` on((`departman`.`departman_id` = `zaposleni`.`departman_id`))) group by `departman`.`departman_id` order by `broj_zaposlenih` ;

-- --------------------------------------------------------

--
-- Structure for view `view_prijave`
--
DROP TABLE IF EXISTS `view_prijave`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_prijave`  AS  select `ocitavanje`.`ocitavanje_id` AS `ocitavanje_id`,`ocitavanje`.`created_at` AS `created_at`,`ocitavanje`.`mesto_id` AS `mesto_id`,`ocitavanje`.`kartica_id` AS `kartica_id`,`kartica`.`zaposleni_id` AS `zaposleni_id`,`zaposleni`.`ime` AS `ime`,`zaposleni`.`prezime` AS `prezime`,`zaposleni`.`jmbg` AS `jmbg`,`zaposleni`.`departman_id` AS `departman_id`,`zaposleni`.`stepen_strucne_spreme_id` AS `stepen_strucne_spreme_id`,`departman`.`naziv` AS `departman_naziv`,`stepen_strucne_spreme`.`naziv` AS `naziv_sss`,`stepen_strucne_spreme`.`oznaka` AS `oznaka_sss`,`mesto`.`naziv` AS `naziv_mesta_otkucavanja` from (((((`ocitavanje` join `kartica` on((`ocitavanje`.`kartica_id` = `kartica`.`kartica_id`))) join `zaposleni` on((`kartica`.`zaposleni_id` = `zaposleni`.`zaposleni_id`))) join `departman` on((`zaposleni`.`departman_id` = `departman`.`departman_id`))) join `stepen_strucne_spreme` on((`zaposleni`.`stepen_strucne_spreme_id` = `stepen_strucne_spreme`.`stepen_strucne_spreme_id`))) join `mesto` on((`ocitavanje`.`mesto_id` = `mesto`.`mesto_id`))) order by `ocitavanje`.`created_at` desc ;

-- --------------------------------------------------------

--
-- Structure for view `view_zaposleni`
--
DROP TABLE IF EXISTS `view_zaposleni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_zaposleni`  AS  select `zaposleni`.`zaposleni_id` AS `zaposleni_id`,`zaposleni`.`created_at` AS `created_at`,`zaposleni`.`ime` AS `ime`,`zaposleni`.`prezime` AS `prezime`,`zaposleni`.`jmbg` AS `jmbg`,`zaposleni`.`born_at` AS `born_at`,`zaposleni`.`departman_id` AS `departman_id`,`zaposleni`.`stepen_strucne_spreme_id` AS `stepen_strucne_spreme_id`,`departman`.`naziv` AS `departman_naziv`,`stepen_strucne_spreme`.`naziv` AS `naziv_sss`,`stepen_strucne_spreme`.`oznaka` AS `oznaka_sss` from ((`zaposleni` join `departman` on((`zaposleni`.`departman_id` = `departman`.`departman_id`))) join `stepen_strucne_spreme` on((`zaposleni`.`stepen_strucne_spreme_id` = `stepen_strucne_spreme`.`stepen_strucne_spreme_id`))) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kartica`
--
ALTER TABLE `kartica`
  ADD CONSTRAINT `fk_kartica_zaposleni_id` FOREIGN KEY (`zaposleni_id`) REFERENCES `zaposleni` (`zaposleni_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ocitavanje`
--
ALTER TABLE `ocitavanje`
  ADD CONSTRAINT `fk_ocitavanje_kartica_id` FOREIGN KEY (`kartica_id`) REFERENCES `kartica` (`kartica_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ocitavanje_mesto_id` FOREIGN KEY (`mesto_id`) REFERENCES `mesto` (`mesto_id`) ON UPDATE CASCADE;

--
-- Constraints for table `zaposleni`
--
ALTER TABLE `zaposleni`
  ADD CONSTRAINT `fk_zaposleni_departman_id` FOREIGN KEY (`departman_id`) REFERENCES `departman` (`departman_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkstepen_strucne_spreme_id` FOREIGN KEY (`stepen_strucne_spreme_id`) REFERENCES `stepen_strucne_spreme` (`stepen_strucne_spreme_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
