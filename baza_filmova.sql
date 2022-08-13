-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 10:49 AM
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
-- Database: `baza_filmova`
--

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
CREATE TABLE IF NOT EXISTS `actor` (
  `actor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `forename` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`actor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `actor`
--

INSERT INTO `actor` (`actor_id`, `forename`, `surname`) VALUES
(1, 'Bernard ', '  Hill'),
(2, ' Billy ', ' Zane'),
(3, ' Cate', '  Blanchett'),
(4, ' Dakota', 'Blue Richard'),
(5, ' Daniel', 'Craig'),
(6, 'Elijah ', 'Wood'),
(7, 'Kate ', ' Winslet'),
(8, 'Kathy ', '  Bates'),
(9, 'Lan ', '    McKellen'),
(10, ' Leonardo ', ' DiCaprio'),
(11, 'Liv ', ' Tyler'),
(12, 'Michelle ', 'Rodriguez'),
(13, 'Nicole', ' Kidman'),
(14, ' Orlando ', 'Bloom'),
(15, 'Sam ', ' Worthington'),
(16, 'Sean ', '   Astin'),
(17, 'Sigourney ', ' Weaver'),
(18, 'Stephen ', '   Lang'),
(19, 'Zoe ', ' Saldana'),
(20, 'Pera  ', ' Peric '),
(21, 'Ivana  ', ' Ivanovic ');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` text NOT NULL,
  `film_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
CREATE TABLE IF NOT EXISTS `director` (
  `director_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `director_forename` varchar(255) NOT NULL,
  `director_surname` varchar(255) NOT NULL,
  PRIMARY KEY (`director_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
CREATE TABLE IF NOT EXISTS `film` (
  `film_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year` smallint(4) UNSIGNED NOT NULL,
  `director_id` int(10) NOT NULL,
  `director_forename` varchar(255) NOT NULL,
  `director_surname` varchar(255) NOT NULL,
  `actor_count` int(10) NOT NULL,
  PRIMARY KEY (`film_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`film_id`, `title`, `description`, `year`, `director_id`, `director_forename`, `director_surname`, `actor_count`) VALUES
(1, 'Titanik', 'The Titanic was a luxury British steamship that sank in the early hours of April 15, 1912 after striking an iceberg, leading to the deaths of more than 1,500 passengers and crew.', 1997, 1, 'James', 'Cameron', 5),
(2, 'The Lord of the Rings the fellowship of the ring (2001)', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 2001, 2, 'Peter', 'Jackson', 6),
(3, 'The golden compass', 'In a parallel universe, young Lyra Belacqua journeys to the far North to save her best friend and other kidnapped children from terrible experiments by a mysterious organization.', 2007, 3, 'Christoper', 'Weitz', 5),
(4, 'Avatar', 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.', 2009, 1, 'James', 'Cameron', 5);

-- --------------------------------------------------------

--
-- Table structure for table `fim_actor`
--

DROP TABLE IF EXISTS `fim_actor`;
CREATE TABLE IF NOT EXISTS `fim_actor` (
  `fim_actor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `film_id` int(10) UNSIGNED NOT NULL,
  `actor_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`fim_actor_id`) USING BTREE,
  KEY `fk_film_actor_film_id_idx` (`film_id`) USING BTREE,
  KEY `fk_film_actor_actor_id_idx` (`actor_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `fim_actor`
--

INSERT INTO `fim_actor` (`fim_actor_id`, `film_id`, `actor_id`, `role`) VALUES
(1, 1, 8, 'Rose Dewint Bukater'),
(2, 1, 10, 'Jack Dawson'),
(3, 1, 2, 'Cal Hockley'),
(4, 1, 9, 'Molly Brown'),
(5, 1, 1, 'Captain Smith'),
(6, 2, 6, 'Frodo'),
(7, 2, 3, 'Galandrie'),
(8, 2, 7, 'Gandalf'),
(9, 2, 11, 'Arwen'),
(10, 2, 14, 'Legolas'),
(11, 2, 16, 'Sam'),
(12, 3, 13, 'Mrs. Coulter'),
(13, 3, 5, 'Lord Asriel'),
(14, 3, 4, 'Lyra'),
(15, 3, 7, 'Lorek Byrnison'),
(16, 3, 9, 'Hester'),
(17, 4, 15, 'Jake Sully'),
(18, 4, 19, 'Neytiri'),
(19, 4, 17, 'Dr.Grace Augustine'),
(20, 4, 18, 'Colonel Miles Quaritch'),
(21, 4, 12, 'Trudy Chation');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `validated_at` timestamp NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `created_at`, `username`, `email`, `validated_at`) VALUES
(1, '2019-03-15 12:52:20', 'pperic', 'pperic@pera.info', '2019-03-16 12:52:39'),
(2, '2019-03-14 12:53:14', 'mmilic', 'mmilic@milos.info', '2019-03-15 12:53:42');

-- --------------------------------------------------------

--
-- Table structure for table `user_login`
--

DROP TABLE IF EXISTS `user_login`;
CREATE TABLE IF NOT EXISTS `user_login` (
  `user_login_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_id` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(10) NOT NULL,
  `ip` varchar(32) NOT NULL,
  PRIMARY KEY (`user_login_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user_login`
--

INSERT INTO `user_login` (`user_login_id`, `created_id`, `user_id`, `ip`) VALUES
(1, '2019-03-15 13:16:30', 1, '87.116.178.153'),
(2, '2019-03-15 13:16:41', 2, '87.116.178.153');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fim_actor`
--
ALTER TABLE `fim_actor`
  ADD CONSTRAINT `fk_film_actor_actor_id` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`actor_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_film_actor_film_id` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
