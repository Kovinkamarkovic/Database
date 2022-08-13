-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 10:47 AM
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
-- Database: `auction_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

DROP TABLE IF EXISTS `auction`;
CREATE TABLE IF NOT EXISTS `auction` (
  `auction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expires_at` datetime NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `starting_price` decimal(10,2) UNSIGNED NOT NULL,
  `stopped` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`auction_id`) USING BTREE,
  KEY `fk_auction_user_id` (`user_id`) USING BTREE,
  KEY `fk_auction_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `auction`
--

INSERT INTO `auction` (`auction_id`, `created_at`, `expires_at`, `user_id`, `category_id`, `title`, `description`, `image_path`, `starting_price`, `stopped`) VALUES
(1, '2019-03-13 12:04:05', '2019-03-26 13:04:13', 2, 2, 'Lot rimskih kovanica ', 'Neka gomila rimskih kovanica', 'C:\\Users\\kovinka\\Pictures\\Camera Roll', '4500.00', 0),
(2, '2019-03-14 08:32:45', '2019-03-20 09:31:18', 3, 1, 'Srebrni cvecnjak', 'Neki srebrni cvecnak', 'C:\\Users\\kovinka\\Pictures\\Camera Roll', '1600.00', 0),
(3, '2019-03-14 09:02:35', '2019-03-25 00:01:07', 2, 3, 'Nekakva slika', 'Neka slika sa detaljnim opisom', 'C:\\Users\\kovinka\\Pictures\\Camera Roll', '7000.00', 1),
(11, '2019-03-15 17:24:18', '2019-03-18 15:52:35', 1, 2, 'Lot grckih novcica', 'Detaljan opis', 'C:\\Users\\kovinka\\Pictures\\Camera Rolls', '100.00', 0);

--
-- Triggers `auction`
--
DROP TRIGGER IF EXISTS `trigger_auction_bi`;
DELIMITER $$
CREATE TRIGGER `trigger_auction_bi` BEFORE INSERT ON `auction` FOR EACH ROW BEGIN
IF LENGTH(NEW.title) <= 10 THEN
	SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Naslov mora da bude duzi od 10 karaktera';
END IF;

	IF NEW.starting_price < 100 THEN
SIGNAL SQLSTATE '50003' SET MESSAGE_TEXT = 'Minimalna pocetna cena aukcije je 100 din.';
END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `trigger_auction_bu`;
DELIMITER $$
CREATE TRIGGER `trigger_auction_bu` AFTER UPDATE ON `auction` FOR EACH ROW BEGIN
IF LENGTH(NEW.title) <= 10 THEN
	SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Naslov mora da bude duzi od 10 karaktera';
END IF;

	IF NEW.starting_price != OLD.starting_price THEN
SIGNAL SQLSTATE '50004' SET MESSAGE_TEXT = 'Pocetna cena ne moze da se menja.';
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `auction_informattion`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `auction_informattion`;
CREATE TABLE IF NOT EXISTS `auction_informattion` (
`auction_id` int(10) unsigned
,`created_at` timestamp
,`expires_at` datetime
,`user_id` int(10) unsigned
,`category_id` int(10) unsigned
,`title` varchar(255)
,`description` text
,`image_path` varchar(255)
,`starting_price` decimal(10,2) unsigned
,`stopped` tinyint(1) unsigned
,`autioner` varchar(255)
,`category_name` varchar(255)
,`offer_count` bigint(21)
,`age_in_hours` decimal(10,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `cache_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` blob NOT NULL,
  PRIMARY KEY (`cache_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE,
  UNIQUE KEY `uq_category_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `name`) VALUES
(1, 'Antikviteti'),
(2, 'Numizmatika'),
(3, 'Slike');

-- --------------------------------------------------------

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
CREATE TABLE IF NOT EXISTS `offer` (
  `offer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) UNSIGNED NOT NULL,
  `auction_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`offer_id`) USING BTREE,
  KEY `fk_offer_user_id` (`user_id`) USING BTREE,
  KEY `fk_offer_auction_id` (`auction_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `offer`
--

INSERT INTO `offer` (`offer_id`, `created_at`, `user_id`, `auction_id`, `price`) VALUES
(1, '2019-03-13 12:09:54', 1, 1, '5600.00'),
(2, '2019-03-13 12:10:15', 3, 1, '5700.00'),
(3, '2019-03-13 12:10:33', 1, 1, '5800.00'),
(4, '2019-03-13 12:12:58', 3, 1, '6500.00'),
(5, '2019-03-13 12:13:02', 1, 1, '7000.00'),
(6, '2019-03-14 08:39:18', 1, 2, '2000.00'),
(9, '2019-03-15 14:42:34', 2, 2, '2040.00'),
(10, '2019-03-15 14:43:09', 1, 2, '2050.00'),
(11, '2019-03-15 14:43:29', 2, 2, '5000.00');

--
-- Triggers `offer`
--
DROP TRIGGER IF EXISTS `trigger_offer_bi`;
DELIMITER $$
CREATE TRIGGER `trigger_offer_bi` BEFORE INSERT ON `offer` FOR EACH ROW IF NEW.price < (SELECT MAX(price) FROM offer WHERE auction_id = NEW.auction_id) + 10 THEN
	SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = 'Nova cena mora da bude za najmanje 10 din. veca od najvece za ovu aukciju.';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `forename` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `created_at`, `username`, `password_hash`, `forename`, `surname`, `email`, `is_active`) VALUES
(5, '2019-04-01 14:57:45', 'userone', 'hdj125458djkshsdhsjdjbskjb', 'user', 'one', 'user@some-site.com', 1),
(6, '2019-04-02 15:02:09', 'usertwo', 'dgfkbn456845fbfnb1254fdvnk', 'user', 'two', 'user@some--other-site.com', 1);

--
-- Triggers `user`
--
DROP TRIGGER IF EXISTS `tigger_user_bi`;
DELIMITER $$
CREATE TRIGGER `tigger_user_bi` BEFORE INSERT ON `user` FOR EACH ROW IF NEW.username NOT RLIKE '^[a-z][a-z0-9]+$' THEN
	SIGNAL SQLSTATE '50005' SET MESSAGE_TEXT = 'Ovo nije validno korisnicko ime.';
	END IF
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `tigger_user_bu`;
DELIMITER $$
CREATE TRIGGER `tigger_user_bu` BEFORE UPDATE ON `user` FOR EACH ROW IF NEW.username NOT RLIKE '^[a-z][a-z0-9]+$' THEN
	SIGNAL SQLSTATE '50005' SET MESSAGE_TEXT = 'Ovo nije validno korisnicko ime.';
	END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure for view `auction_informattion`
--
DROP TABLE IF EXISTS `auction_informattion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `auction_informattion`  AS  select `auction`.`auction_id` AS `auction_id`,`auction`.`created_at` AS `created_at`,`auction`.`expires_at` AS `expires_at`,`auction`.`user_id` AS `user_id`,`auction`.`category_id` AS `category_id`,`auction`.`title` AS `title`,`auction`.`description` AS `description`,`auction`.`image_path` AS `image_path`,`auction`.`starting_price` AS `starting_price`,`auction`.`stopped` AS `stopped`,`user`.`username` AS `autioner`,`category`.`name` AS `category_name`,count(`offer`.`offer_id`) AS `offer_count`,round((time_to_sec(timediff(now(),`auction`.`created_at`)) / 3600),0) AS `age_in_hours` from (((`auction` join `user` on((`auction`.`auction_id` = `user`.`user_id`))) join `category` on((`auction`.`category_id` = `category`.`category_id`))) left join `offer` on((`auction`.`auction_id` = `offer`.`auction_id`))) where ((`auction`.`expires_at` > now()) and (`auction`.`stopped` = 0)) group by `auction`.`auction_id` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auction`
--
ALTER TABLE `auction`
  ADD CONSTRAINT `fk_auction_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `offer`
--
ALTER TABLE `offer`
  ADD CONSTRAINT `fk_offer_auction_id` FOREIGN KEY (`auction_id`) REFERENCES `auction` (`auction_id`) ON UPDATE CASCADE;

DELIMITER $$
--
-- Events
--
DROP EVENT `e_aukcije_zatvaranje_neaktivnih_aukcija`$$
CREATE DEFINER=`root`@`localhost` EVENT `e_aukcije_zatvaranje_neaktivnih_aukcija` ON SCHEDULE EVERY 1 MINUTE STARTS '2019-03-21 19:32:19' ON COMPLETION NOT PRESERVE DISABLE DO UPDATE
				auction
				SET 
				auction.stopped = 1
				WHERE
				auction.auction_id IN (SELECT
				auction_informattion.auction_id
				FROM
				auction_informattion
				WHERE
				auction_informattion.offer_count = 0
				AND auction_informattion.age_in_hours >113
)
;$$

DROP EVENT `e_aukcije_ciscenje_kes_tabele`$$
CREATE DEFINER=`root`@`localhost` EVENT `e_aukcije_ciscenje_kes_tabele` ON SCHEDULE EVERY 1 DAY STARTS '2019-03-28 19:44:49' ENDS '2020-03-21 19:44:49' ON COMPLETION NOT PRESERVE ENABLE DO TRUNCATE `cache`
;$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
