-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 04:10 PM
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
-- Database: `vesti`
--

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ucesnici` varchar(50) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `ucesnici`, `vreme`) VALUES
(1, '1,42', '2018-06-18 09:33:52'),
(2, '1,28', '2018-06-18 09:33:59');

-- --------------------------------------------------------

--
-- Table structure for table `chatporuke`
--

DROP TABLE IF EXISTS `chatporuke`;
CREATE TABLE IF NOT EXISTS `chatporuke` (
  `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `korisnikId` int(3) NOT NULL,
  `chatId` int(6) NOT NULL,
  `poruka` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `procitan` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chatporuke`
--

INSERT INTO `chatporuke` (`id`, `korisnikId`, `chatId`, `poruka`, `vreme`, `procitan`) VALUES
(1, 1, 0, 'ascaxcy', '2018-06-18 09:53:04', 0),
(2, 1, 0, 'ascaxcy', '2018-06-18 09:53:04', 0),
(3, 1, 0, 'ascaxcy', '2018-06-18 09:53:05', 0),
(4, 1, 0, 'ascaxcy', '2018-06-18 09:53:05', 0),
(5, 1, 2, 'Ovo je neka poruka', '2018-06-18 09:53:14', 0),
(6, 1, 2, 'dffgdfgf', '2018-06-18 09:55:41', 0),
(7, 1, 2, 'ghfhjghjhgj', '2018-06-18 09:55:46', 0),
(8, 1, 1, 'Pozzz', '2018-06-18 10:00:43', 0),
(9, 42, 1, 'dfgdfgdfg', '2018-06-18 10:00:54', 0),
(10, 1, 1, 'dfgdfgfdgdfg', '2018-06-18 10:01:01', 0),
(11, 42, 1, 'dfgdgdfgd', '2018-06-18 10:02:31', 0),
(12, 1, 1, 'sdfsdfsdf', '2018-06-18 10:02:37', 0),
(13, 28, 2, 'Poyyyy', '2018-06-18 10:04:07', 0),
(14, 1, 2, 'sdfsdfsdf', '2018-06-18 10:04:18', 0),
(15, 28, 2, 'Poyyyy', '2018-06-18 10:04:23', 0),
(16, 42, 1, 'Ej, bre!!!!', '2018-06-18 10:04:39', 0);

-- --------------------------------------------------------

--
-- Table structure for table `galerije`
--

DROP TABLE IF EXISTS `galerije`;
CREATE TABLE IF NOT EXISTS `galerije` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nazivGalerije` varchar(100) NOT NULL,
  `komentar` text,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `autor` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerije`
--

INSERT INTO `galerije` (`id`, `nazivGalerije`, `komentar`, `vreme`, `autor`) VALUES
(1, 'Letovanje 2016', 'Ovde je bilo super', '2018-02-23 09:29:43', 1),
(2, 'Letovanje 2017', 'Ovde je bilo još bolje', '2018-02-23 09:29:55', 1);

-- --------------------------------------------------------

--
-- Table structure for table `galerijeslike`
--

DROP TABLE IF EXISTS `galerijeslike`;
CREATE TABLE IF NOT EXISTS `galerijeslike` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idGalerije` int(2) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `komentar` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `galerijeslike`
--

INSERT INTO `galerijeslike` (`id`, `idGalerije`, `slika`, `komentar`) VALUES
(1, 1, '0.48186500 1519379612.jpg', 'sdadsada'),
(2, 1, '1519379683.6421.jpg', ''),
(3, 1, '1519379932.662.jpg', 'asdasd'),
(4, 1, '1519379932.6635.jpg', 'asdasdas'),
(5, 1, '1519379974.7513.jpg', 'Super slika'),
(6, 1, '1519379974.7523.jpg', 'Ovde sam pao'),
(7, 1, '1519379974.7529.jpg', ''),
(8, 1, '1519379974.7535.jpg', ''),
(9, 1, '1519379974.7541.jfif', ''),
(10, 2, '1519382192.2.jpg', NULL),
(11, 2, '1519382192.2012.jpeg', 'Ovde je bilo super'),
(12, 2, '1519382192.202.jpg', NULL),
(13, 2, '1519382225.9937.jpg', 'Ovde je bezveze'),
(14, 2, '1519382225.9951.jpg', NULL),
(15, 2, '1519382225.9958.jpeg', NULL),
(16, 2, '1519382225.9965.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

DROP TABLE IF EXISTS `kategorija`;
CREATE TABLE IF NOT EXISTS `kategorija` (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naziv` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kategorija`
--

INSERT INTO `kategorija` (`id`, `naziv`) VALUES
(1, 'Svet'),
(2, 'Hronika'),
(3, 'Sport'),
(4, 'Zabava'),
(5, 'Politika'),
(6, 'Kultura');

-- --------------------------------------------------------

--
-- Table structure for table `komentari`
--

DROP TABLE IF EXISTS `komentari`;
CREATE TABLE IF NOT EXISTS `komentari` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idVesti` int(3) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `tekst` text NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dozvoljen` int(1) NOT NULL DEFAULT '0',
  `volime` int(3) NOT NULL DEFAULT '0',
  `nevolime` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `komentari`
--

INSERT INTO `komentari` (`id`, `idVesti`, `autor`, `tekst`, `vreme`, `dozvoljen`, `volime`, `nevolime`) VALUES
(1, 7, 'asdad', 'asdasdasd', '2018-02-09 09:09:11', 1, 1, 1),
(2, 7, 'bbosko', 'Moj prvi komentar', '2018-02-09 09:15:06', 1, 1, 1),
(3, 7, 'tfhgfhfgh', 'gfhgfhfgh\r\nfgh\r\nfgh\r\nfg\r\nh', '2018-02-09 09:15:13', 1, 4, 3),
(4, 17, 'bbosko', 'moj prvi komentar za ovu vest', '2018-02-09 09:15:37', 1, 3, 0),
(7, 17, 'dgdfgdfg', 'dgdgdfgdfgd', '2018-02-09 10:07:25', 1, 0, 3),
(8, 17, 'dfgdgdfg', 'dfgdfgfdg', '2018-02-09 10:07:28', 1, 0, 0),
(9, 5, 'rrgfg', 'dgdfgdfgd', '2018-02-09 10:09:24', 1, 0, 0),
(10, 5, 'yxcxyc', 'yxcyxcyxc', '2018-02-09 10:39:35', 1, 0, 0),
(11, 18, 'asdasdasd', 'asdasdasd', '2018-02-09 10:54:21', 1, 1, 0),
(12, 18, 'asdsadas', 'asdasdasda', '2018-02-09 10:54:24', 1, 0, 1),
(13, 18, 'asdasdasd', 'asdasdsdasd', '2018-02-09 10:54:27', 1, 1, 0),
(14, 20, 'asdsadasas', 'asdasdasda', '2018-03-16 11:17:43', 1, 1, 1),
(15, 20, 'saadsa', 'asdsadsa', '2018-03-16 11:22:34', 1, 0, 0),
(16, 21, 'sdfsdfdsf', 'ertrterter', '2018-03-19 11:06:25', 1, 0, 0),
(17, 21, 'safdsfsd', 'fsdfsdfsd', '2018-03-19 11:08:39', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
CREATE TABLE IF NOT EXISTS `korisnici` (
  `id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `lozinka` varchar(256) NOT NULL,
  `email` varchar(20) NOT NULL,
  `adresa` varchar(250) DEFAULT NULL,
  `komentar` text,
  `status` enum('Administrator','Urednik','Korisnik') NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slika` varchar(50) DEFAULT NULL,
  `validan` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korisnici`
--

INSERT INTO `korisnici` (`id`, `ime`, `prezime`, `lozinka`, `email`, `adresa`, `komentar`, `status`, `vreme`, `slika`, `validan`) VALUES
(1, 'Бошко', 'Богојевић', 'bbosko', 'bbosko', NULL, 'Ovo je komentar dodat iz update-a', 'Administrator', '2017-12-22 09:16:53', '1.jpg', 1),
(2, 'Peradfgfdgdgd', 'Perić', 'ppera', 'ppera@www.com', NULL, 'Ovde ide neki komentar sa slikom', 'Urednik', '2017-12-22 09:17:58', '1517828953.bmp', 1),
(4, 'lazafthfghgfhfg', 'lazić', 'llaza', 'llaza@www.com', NULL, 'Evo i za lazu', 'Urednik', '2017-12-22 09:18:54', '1517829038.png', 1),
(7, 'Mile', 'Milić', 'mile', 'mmilic@www.com', NULL, NULL, 'Urednik', '2018-01-19 11:43:49', NULL, 1),
(27, 'sfgfd', 'dfgdf', 'sdfdsfs', 'gdfgdfg', NULL, NULL, 'Urednik', '2018-05-15 10:41:57', NULL, 1),
(28, 'Ivana', 'Ivanović', 'aaa', 'ivana', NULL, NULL, 'Urednik', '2018-05-15 10:42:52', NULL, 1),
(39, 'Joca', 'Karburator', 'aaa', 'aaa', 'aaa', NULL, 'Korisnik', '2018-06-01 10:02:30', NULL, 1),
(41, 'Mile', 'Dizna', 'aaa', 'miledizna@gmail.com', 'aaa', NULL, 'Korisnik', '2018-06-01 10:20:39', NULL, 1),
(42, 'milezoki', 'zoki', 'aaa', 'mz@gmail.com', 'dgsgfdgdfgd', NULL, 'Korisnik', '2018-06-08 09:29:03', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `korpa`
--

DROP TABLE IF EXISTS `korpa`;
CREATE TABLE IF NOT EXISTS `korpa` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idKupca` int(3) NOT NULL,
  `idProizvoda` int(3) NOT NULL,
  `kolicina` int(10) NOT NULL,
  `datumPorudzbine` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datumKupovine` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `kupljen` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `korpa`
--

INSERT INTO `korpa` (`id`, `idKupca`, `idProizvoda`, `kolicina`, `datumPorudzbine`, `datumKupovine`, `kupljen`) VALUES
(12, 41, 22, 6, '2018-06-04 10:34:22', '2018-06-04 10:45:16', 1),
(2, 41, 21, 4, '2018-06-04 10:02:47', '2018-06-04 10:45:17', 1),
(11, 41, 22, 5, '2018-06-04 10:31:25', '2018-06-04 10:45:18', 1),
(9, 41, 22, 4, '2018-06-04 10:29:26', '2018-06-08 10:36:15', 1),
(13, 41, 21, 5, '2018-06-04 10:34:27', '2018-06-08 10:36:17', 1),
(14, 41, 20, 4, '2018-06-04 10:34:32', '2018-06-08 10:36:04', 0),
(16, 42, 22, 4, '2018-06-08 10:01:54', '2018-06-08 10:33:33', 1),
(17, 42, 21, 4, '2018-06-08 10:01:59', '2018-06-08 10:33:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tabelavesti`
--

DROP TABLE IF EXISTS `tabelavesti`;
CREATE TABLE IF NOT EXISTS `tabelavesti` (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `naslov` varchar(50) NOT NULL,
  `sadrzaj` text NOT NULL,
  `autor` int(10) NOT NULL,
  `vreme` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `kategorija` int(2) NOT NULL,
  `obrisan` int(1) NOT NULL DEFAULT '0',
  `slikavesti` varchar(50) DEFAULT NULL,
  `kolicina` int(10) NOT NULL DEFAULT '0',
  `cena` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tabelavesti`
--

INSERT INTO `tabelavesti` (`id`, `naslov`, `sadrzaj`, `autor`, `vreme`, `kategorija`, `obrisan`, `slikavesti`, `kolicina`, `cena`) VALUES
(3, 'Xvo je treci naslov', 'Lorem ipsum vesti dolor sit bbosko amet, cu mel aperiri contentiones, id zril lucilius per, per duis habemus efficiantur an. Quo cu graeco iracundia disputationi. Ex enim gubergren theophrastus mea, te qui quodsi gloriatur, movet epicurei oporteat eum an. Per in elit epicurei appetere. Cu has qualisque percipitur, vel prima audire imperdiet ex.\r\n\r\nNisl habemus vis ex, ex eum exerci antiopam. An vis epicuri officiis quaestio, at vel reque libris meliore, an eam alii gloriatur. In mea liber eruditi equidem, has putant invidunt complectitur ad. Mea paulo scripserit at, minim legere docendi est an. In mei agam justo signiferumque, omittam platonem electram ex pro, commodo scaevola repudiandae vel ei.', 4, '2017-12-22 09:34:13', 1, 1, NULL, 0, 0),
(4, 'Ovo je cetvrti naslov', 'Semper sensibus efficiantur ne est. Id quo tation euripidis, sit et quot error senserit. Est ne nisl vocent. No quodsi sensibus concludaturque cum, mei detracto forensibus omittantur ne. Te modus paulo apeirian vim, mei assum vidisse delicata ei, duo populo invidunt ut. Autem voluptua qui cu, an deleniti volutpat vix.\r\n\r\nAd usu movet abhorreant, aliquid invenire sed at. Sed probo harum definitionem ne, luptatum invidunt vituperata te eum. Ei solum partiendo salutandi his. Te debet phaedrum has, labores verterem pertinacia pri an. Qui in partem electram, ex altera euripidis delicatissimi qui. Ut eum habeo zril fierent, ius dicunt discere copiosae an.', 2, '2017-12-22 09:34:13', 2, 0, NULL, 0, 0),
(5, 'Ovo je cetvrti naslov', 'Semper sensibus efficiantur ne est. Id quo tation euripidis, sit et quot error senserit. Est ne nisl vocent. No quodsi sensibus concludaturque cum, mei detracto forensibus omittantur ne. Te modus paulo apeirian vim, mei assum vidisse delicata ei, duo populo invidunt ut. Autem voluptua qui cu, an deleniti volutpat vix.\r\n\r\nAd usu movet abhorreant, aliquid invenire sed at. Sed probo harum definitionem ne, luptatum invidunt vituperata te eum. Ei solum partiendo salutandi his. Te debet phaedrum has, labores verterem pertinacia pri an. Qui in partem electram, ex altera euripidis delicatissimi qui. Ut eum habeo zril fierent, ius dicunt discere copiosae an.', 2, '2017-12-22 09:34:13', 2, 0, NULL, 0, 0),
(6, 'Avo je treci naslov', 'Lorem ipsum dolor sit amet, cu mel aperiri contentiones, id zril lucilius per, per duis habemus efficiantur an. Quo cu graeco iracundia disputationi. Ex enim gubergren theophrastus mea, te qui quodsi gloriatur, movet epicurei oporteat eum an. Per in elit epicurei appetere. Cu has qualisque percipitur, vel prima audire imperdiet ex.\r\n\r\nNisl habemus vis ex, ex eum exerci antiopam. An vis epicuri officiis quaestio, at vel reque libris meliore, an eam alii gloriatur. In mea liber eruditi equidem, has putant invidunt complectitur ad. Mea paulo scripserit at, minim legere docendi est an. In mei agam justo signiferumque, omittam platonem electram ex pro, commodo scaevola repudiandae vel ei.', 4, '2017-12-22 09:34:13', 1, 0, NULL, 0, 0),
(7, 'Pvo je prvi naslov', 'Lorem ipsum dolor sit amet, cu mel aperiri contentiones, id zril lucilius per, per duis habemus efficiantur an. Quo cu graeco iracundia disputationi. Ex enim gubergren theophrastus mea, te qui quodsi gloriatur, movet epicurei oporteat eum an. Per in elit epicurei appetere. Cu has qualisque percipitur, vel prima audire imperdiet ex.\r\n\r\nNisl habemus vis ex, ex eum exerci antiopam. An vis epicuri officiis quaestio, at vel reque libris meliore, an eam alii gloriatur. In mea liber eruditi equidem, has putant invidunt complectitur ad. Mea paulo scripserit at, minim legere docendi est an. In mei agam justo signiferumque, omittam platonem electram ex pro, commodo scaevola repudiandae vel ei.', 1, '2017-12-22 09:34:13', 1, 0, 'pozadina.jpg', 0, 0),
(8, 'Ovo je prvi naslov', 'Lorem ipsum dolor sit amet, bbosko cu mel aperiri contentiones, id zril lucilius per, per duis habemus efficiantur an. Quo cu graeco iracundia disputationi. Ex enim gubergren theophrastus mea, te qui quodsi gloriatur, movet epicurei oporteat eum an. Per in elit epicurei appetere. Cu has qualisque percipitur, vel prima audire imperdiet ex.\r\n\r\nNisl habemus vis ex, ex eum exerci antiopam. An vis epicuri officiis quaestio, at vel reque libris meliore, an eam alii gloriatur. In mea liber eruditi equidem, has putant invidunt complectitur ad. Mea paulo scripserit at, minim legere docendi est an. In mei agam justo signiferumque, omittam platonem electram ex pro, commodo scaevola repudiandae vel ei.', 4, '2017-12-22 09:34:13', 1, 0, NULL, 0, 0),
(9, 'Ovo je naslov sa php stranice', 'Ovo je sadržaj sa PHP stranice', 1, '2018-01-12 11:15:31', 4, 0, 'hero.jpg', 0, 0),
(10, 'Prva vest sa stranice', 'Ovo je prva vest dodata sa stranice za dodavanje vesti', 1, '2018-01-22 11:51:57', 6, 0, '', 0, 0),
(11, 'Ovo je drugi naslov', 'sadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdvvsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdsadfsdfsdfsdfsdfsd ffd sfd fs df sd fsd fsd f sdvv', 1, '2018-01-22 11:54:30', 5, 1, '1516622070.png', 0, 0),
(13, 'Prva vest za G2', 'Sadrzaj prve vesti za G2', 1, '2018-01-26 11:33:31', 3, 0, '1516966411.jpg', 0, 0),
(14, 'Druga vest za G2', 'Lorem ipsum dolor sit amet, fierent menandri eam te, eam an labores corpora. Sea at populo commodo. Atqui dolores no nec, usu an aliquid dolores percipitur. No vis homero offendit, augue tacimates ea usu, assentior sententiae scribentur eu eos. Eu eum affert praesent, vero mediocrem at eos. Ut erat repudiare has.\r\n\r\nTation decore audire pro ex. Sea postea pericula expetenda in. Graecis nominati ut duo, pri sapientem appellantur in. In ius fugit pertinax, magna numquam usu ad. An sea fastidii adolescens. At sit vero dicunt, ea quando delenit vix.', 1, '2018-01-26 11:38:05', 3, 1, '1516966685.jpg', 0, 0),
(15, 'Vest sa evidencijom aktivnosti', 'sdfsdfsdfsd\r\nfds\r\nf\r\ndsf\r\ndsfdfsdfdsfsdf\r\nsdfsd\r\nfsdfsdfsd s fd fs dfs df', 1, '2018-01-29 11:26:02', 6, 1, '', 0, 0),
(16, 'yfdfsdfsdfdfsf sd fsd fs dfd', ' fsd fsd fs fd df sd fsd fsd fsd ', 1, '2018-01-29 11:26:55', 5, 1, '', 0, 0),
(17, 'sdsdasdas', 'dasdasdasdasdsdsds\r\nd\r\nasd\r\nasdasdsa\r\nd\r\nsdasdsdsad', 1, '2018-01-29 11:27:39', 4, 0, '', 0, 0),
(18, 'Ovo je vest za datoteku', 'asdasdsadas izmenjeno sa stranice za update\r\nd\r\nsad\r\nsd\r\nasd\r\nasd', 1, '2018-02-02 11:23:01', 3, 0, '1517830352.jpg', 0, 0),
(19, 'awaeqweq', 'weqweqweqweqwe\r\nqweqweq\r\nweqwe', 1, '2018-02-02 11:23:26', 5, 1, '', 50, 20),
(21, 'sesrt', 'ertertertr', 1, '2018-03-16 11:43:31', 2, 0, '', 50, 200),
(22, 'Naslov iz servisa', 'Sadržaj iz servisa', 1, '2018-06-04 08:56:30', 1, 0, NULL, 68, 100),
(23, 'naslov grupa2', 'Sadrzaj Grupa2', 1, '2018-06-08 08:48:54', 1, 0, NULL, 100, 1000);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewvesti`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `viewvesti`;
CREATE TABLE IF NOT EXISTS `viewvesti` (
`id` int(4) unsigned
,`naslov` varchar(50)
,`sadrzaj` text
,`autor` int(10)
,`vreme` timestamp
,`kategorija` int(2)
,`obrisan` int(1)
,`slikavesti` varchar(50)
,`cena` int(10)
,`kolicina` int(10)
,`ime` varchar(20)
,`prezime` varchar(30)
,`slika` varchar(50)
,`naziv` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `viewvesti`
--
DROP TABLE IF EXISTS `viewvesti`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewvesti`  AS  select `tabelavesti`.`id` AS `id`,`tabelavesti`.`naslov` AS `naslov`,`tabelavesti`.`sadrzaj` AS `sadrzaj`,`tabelavesti`.`autor` AS `autor`,`tabelavesti`.`vreme` AS `vreme`,`tabelavesti`.`kategorija` AS `kategorija`,`tabelavesti`.`obrisan` AS `obrisan`,`tabelavesti`.`slikavesti` AS `slikavesti`,`tabelavesti`.`cena` AS `cena`,`tabelavesti`.`kolicina` AS `kolicina`,`korisnici`.`ime` AS `ime`,`korisnici`.`prezime` AS `prezime`,`korisnici`.`slika` AS `slika`,`kategorija`.`naziv` AS `naziv` from ((`tabelavesti` join `korisnici` on((`tabelavesti`.`autor` = `korisnici`.`id`))) join `kategorija` on((`tabelavesti`.`kategorija` = `kategorija`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
