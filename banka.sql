-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 17, 2019 at 10:48 AM
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
-- Database: `banka`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `deposit`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `deposit` (IN `account_number` VARCHAR(64), IN `amount` DECIMAL(10,2), OUT `error` TINYINT(1))  BEGIN
DECLARE account_id INT (10);

IF amount > 0 THEN
	SET account_id = get_active_account_id(account_number);
	
	IF account_id IS NOT NULL THEN
	INSERT INTO `transaction` (transaction_type_id, account_id, amount) VALUES (1, account_id, amount);
	SET error = 0;
	ELSE
	SET error= 2;
	END IF;
	ELSE
	SET error = 1;
	END IF;
	END$$

DROP PROCEDURE IF EXISTS `withdraw`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `withdraw` (IN `account_number` VARCHAR(64), IN `amount` DECIMAL(10,2), OUT `error` TINYINT(1))  BEGIN
DECLARE account_id INT(10);

IF amount > 0 THEN
	SET account_id = get_active_account_id(account_number);
	
	IF account_id IS NOT NULL THEN
		INSERT INTO `transaction` (transaction_type_id, account_id, amount) VALUES (2, account_id, amount);
		SET error = 0;
		ELSE
		SET error = 2;
		END IF;
		ELSE
		SET error = 1;
		END IF;
END$$

--
-- Functions
--
DROP FUNCTION IF EXISTS `get_active_account_id`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_active_account_id` (`account_number` VARCHAR(64)) RETURNS INT(10) BEGIN
	RETURN(SELECT account.account_id FROM account WHERE account.account_number = account_number AND account.active = 1);
END$$

DROP FUNCTION IF EXISTS `get_transaction_sum`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `get_transaction_sum` (`transaction_type_id` INT(10), `account_id` INT(10)) RETURNS DECIMAL(10,2) BEGIN
RETURN(
	SELECT
	SUM(`transaction`.amount)
	FROM
	`transaction`
	WHERE
	transaction_type_id = transaction_type_id = transaction_type_id AND
	`transaction`.account_id = account_id

);
END$$

DROP FUNCTION IF EXISTS `saldo`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `saldo` (`account_number` VARCHAR(64)) RETURNS DECIMAL(10,2) BEGIN
	DECLARE account_id INT(10);
	DECLARE sum_deposits DECIMAL(10,2);
	DECLARE sum_withdrawals DECIMAL(10,2);
	
	SET account_id = get_active_account_id(account_number);
	
	IF account_id IS NOT NULL THEN
	SET sum_deposits = (
	SELECT
	SUM(`transaction`.amount) 
	FROM 
	`transaction`
	WHERE 
	transaction_type_id = 1 AND `transaction`.account_id = account_id
	);
	
	SET sum_withdrawals = (
	SELECT
	SUM(`transaction`.amount) 
	FROM 
	`transaction`
	WHERE 
	transaction_type_id = 2 AND `transaction`.account_id = account_id
	);
	
	RETURN sum_deposits - sum_withdrawals;
	ELSE
	RETURN NULL;
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `account_number` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  PRIMARY KEY (`account_id`) USING BTREE,
  UNIQUE KEY `uq_account_account_number` (`account_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `created_at`, `account_number`, `active`) VALUES
(1, '2019-03-16 17:58:24', '123456', 1),
(2, '2019-03-16 17:58:49', '234567', 1),
(3, '2019-03-19 13:30:22', '345678', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `transaction_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_type_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10,2) UNSIGNED NOT NULL,
  PRIMARY KEY (`transaction_id`) USING BTREE,
  KEY `fk_transaction_transaction_type_id` (`transaction_type_id`) USING BTREE,
  KEY `fk_transaction__account_id` (`account_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `created_at`, `transaction_type_id`, `account_id`, `amount`) VALUES
(1, '2019-03-18 12:29:06', 1, 1, '105.33'),
(2, '2019-03-18 12:30:21', 1, 2, '105.33'),
(3, '2019-03-18 12:30:51', 1, 2, '32.19'),
(4, '2019-03-18 16:26:41', 1, 1, '105.33'),
(5, '2019-03-18 16:27:55', 1, 2, '32.19'),
(6, '2019-03-18 16:34:38', 1, 1, '132.19'),
(7, '2019-03-19 12:30:04', 2, 1, '60.34');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

DROP TABLE IF EXISTS `transaction_type`;
CREATE TABLE IF NOT EXISTS `transaction_type` (
  `transaction_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`transaction_type_id`) USING BTREE,
  UNIQUE KEY `uq_transaction_type_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`transaction_type_id`, `name`) VALUES
(1, 'Deposit'),
(2, 'Withdraw');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_transaction__account_id` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transaction_transaction_type_id` FOREIGN KEY (`transaction_type_id`) REFERENCES `transaction_type` (`transaction_type_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
