-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for billing
CREATE DATABASE IF NOT EXISTS `billing` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `billing`;

-- Dumping structure for table billing.audit_log
CREATE TABLE IF NOT EXISTS `audit_log` (
  `audit_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_desc` text NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `system_details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`system_details`)),
  PRIMARY KEY (`audit_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.audit_log: ~0 rows (approximately)

-- Dumping structure for table billing.billings
CREATE TABLE IF NOT EXISTS `billings` (
  `billing_id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_description` mediumtext NOT NULL,
  `company_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `overall_amt` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`billing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.billings: ~17 rows (approximately)
REPLACE INTO `billings` (`billing_id`, `billing_description`, `company_id`, `customer_id`, `overall_amt`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(1, 'Testing Billing 2', 1, 3, '528000', '2025-09-12 20:05:11', NULL, NULL, NULL),
	(2, 'Testing Billing 5', 1, 3, '1193000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(3, 'Testing Billing', 1, 3, '1352000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(4, 'Testing', 1, 2, '49000', '2025-09-13 06:31:28', NULL, NULL, NULL),
	(5, 'Testing', 1, 3, '97000', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(6, 'Testing', 1, 2, '97000', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(7, '', 1, 2, '75000', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(8, '545345', 1, 2, '2835000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(9, '545345', 1, 2, '2870000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(10, '5453455', 1, 2, '2870000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(11, '5453455', 1, 2, '2870000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(12, '5453455', 1, 2, '2870000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(13, '5453455', 1, 2, '2870000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(14, 'new motor new stator fixing in pondi union', 1, 4, '10005', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(15, 'Testing43', 1, 4, '32000', '2025-09-20 20:41:35', NULL, NULL, NULL),
	(16, 'Testing3423', 1, 4, '81400', '2025-09-20 20:42:10', NULL, NULL, NULL),
	(17, 'jhhh', 1, 4, '36400', '2025-09-20 20:42:51', NULL, NULL, NULL);

-- Dumping structure for table billing.billing_details
CREATE TABLE IF NOT EXISTS `billing_details` (
  `billing_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `prod_qty` varchar(50) NOT NULL,
  `prod_price` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `total_amt` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`billing_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.billing_details: ~126 rows (approximately)
REPLACE INTO `billing_details` (`billing_detail_id`, `prod_id`, `billing_id`, `prod_qty`, `prod_price`, `company_id`, `total_amt`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(1, 2, 1, '66', '8000', 1, '528000', '2025-09-12 20:05:11', NULL, NULL, NULL),
	(2, 2, 1, '66', '8000', 2, '528000', '2025-09-12 20:05:11', NULL, NULL, NULL),
	(3, 2, 1, '66', '555', 3, '36630', '2025-09-12 20:05:11', NULL, NULL, NULL),
	(4, 2, 2, '66', '8000', 1, '528000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(5, 2, 2, '66', '8000', 2, '528000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(6, 2, 2, '66', '555', 3, '36630', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(7, 2, 2, '7', '8000', 1, '56000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(8, 2, 2, '7', '8000', 2, '56000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(9, 2, 2, '7', '555', 3, '3885', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(10, 4, 2, '87', '7000', 1, '609000', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(11, 4, 2, '87', '500', 2, '43500', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(12, 4, 2, '87', '400', 3, '34800', '2025-09-12 20:06:37', NULL, NULL, NULL),
	(13, 4, 3, '80', '7000', 1, '560000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(14, 4, 3, '80', '500', 2, '40000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(15, 4, 3, '80', '400', 3, '32000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(16, 2, 3, '99', '8000', 1, '792000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(17, 2, 3, '99', '8000', 2, '792000', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(18, 2, 3, '99', '555', 3, '54945', '2025-09-13 05:13:31', NULL, NULL, NULL),
	(19, 4, 4, '7', '7000', 1, '49000', '2025-09-13 06:31:28', NULL, NULL, NULL),
	(20, 4, 4, '7', '500', 2, '3500', '2025-09-13 06:31:28', NULL, NULL, NULL),
	(21, 4, 4, '7', '400', 3, '2800', '2025-09-13 06:31:28', NULL, NULL, NULL),
	(22, 4, 5, '7', '7000', 1, '49000', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(23, 4, 5, '7', '500', 2, '3500', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(24, 4, 5, '7', '400', 3, '2800', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(25, 2, 5, '6', '8000', 1, '48000', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(26, 2, 5, '6', '8000', 2, '48000', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(27, 2, 5, '6', '555', 3, '3330', '2025-09-13 06:31:38', NULL, NULL, NULL),
	(28, 4, 6, '7', '7000', 1, '49000', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(29, 4, 6, '7', '500', 2, '3500', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(30, 4, 6, '7', '400', 3, '2800', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(31, 2, 6, '6', '8000', 1, '48000', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(32, 2, 6, '6', '8000', 2, '48000', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(33, 2, 6, '6', '555', 3, '3330', '2025-09-13 06:31:46', NULL, NULL, NULL),
	(34, 2, 7, '5', '8000', 1, '40000', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(35, 2, 7, '5', '8000', 2, '40000', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(36, 2, 7, '5', '555', 3, '2775', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(37, 4, 7, '5', '7000', 1, '35000', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(38, 4, 7, '5', '500', 2, '2500', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(39, 4, 7, '5', '400', 3, '2000', '2025-09-13 06:32:12', NULL, NULL, NULL),
	(40, 2, 8, '5', '8000', 1, '40000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(41, 2, 8, '5', '8000', 2, '40000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(42, 2, 8, '5', '555', 3, '2775', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(43, 4, 8, '5', '7000', 1, '35000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(44, 4, 8, '5', '500', 2, '2500', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(45, 4, 8, '5', '400', 3, '2000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(46, 2, 8, '345', '8000', 1, '2760000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(47, 2, 8, '345', '8000', 2, '2760000', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(48, 2, 8, '345', '555', 3, '191475', '2025-09-13 06:32:21', NULL, NULL, NULL),
	(49, 2, 9, '5', '8000', 1, '40000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(50, 2, 9, '5', '8000', 2, '40000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(51, 2, 9, '5', '555', 3, '2775', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(52, 4, 9, '5', '7000', 1, '35000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(53, 4, 9, '5', '500', 2, '2500', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(54, 4, 9, '5', '400', 3, '2000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(55, 2, 9, '345', '8000', 1, '2760000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(56, 2, 9, '345', '8000', 2, '2760000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(57, 2, 9, '345', '555', 3, '191475', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(58, 4, 9, '5', '7000', 1, '35000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(59, 4, 9, '5', '500', 2, '2500', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(60, 4, 9, '5', '400', 3, '2000', '2025-09-13 06:32:26', NULL, NULL, NULL),
	(61, 2, 10, '5', '8000', 1, '40000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(62, 2, 10, '5', '8000', 2, '40000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(63, 2, 10, '5', '555', 3, '2775', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(64, 4, 10, '5', '7000', 1, '35000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(65, 4, 10, '5', '500', 2, '2500', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(66, 4, 10, '5', '400', 3, '2000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(67, 2, 10, '345', '8000', 1, '2760000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(68, 2, 10, '345', '8000', 2, '2760000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(69, 2, 10, '345', '555', 3, '191475', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(70, 4, 10, '5', '7000', 1, '35000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(71, 4, 10, '5', '500', 2, '2500', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(72, 4, 10, '5', '400', 3, '2000', '2025-09-13 06:32:31', NULL, NULL, NULL),
	(73, 2, 11, '5', '8000', 1, '40000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(74, 2, 11, '5', '8000', 2, '40000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(75, 2, 11, '5', '555', 3, '2775', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(76, 4, 11, '5', '7000', 1, '35000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(77, 4, 11, '5', '500', 2, '2500', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(78, 4, 11, '5', '400', 3, '2000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(79, 2, 11, '345', '8000', 1, '2760000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(80, 2, 11, '345', '8000', 2, '2760000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(81, 2, 11, '345', '555', 3, '191475', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(82, 4, 11, '5', '7000', 1, '35000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(83, 4, 11, '5', '500', 2, '2500', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(84, 4, 11, '5', '400', 3, '2000', '2025-09-13 06:32:33', NULL, NULL, NULL),
	(85, 2, 12, '5', '8000', 1, '40000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(86, 2, 12, '5', '8000', 2, '40000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(87, 2, 12, '5', '555', 3, '2775', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(88, 4, 12, '5', '7000', 1, '35000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(89, 4, 12, '5', '500', 2, '2500', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(90, 4, 12, '5', '400', 3, '2000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(91, 2, 12, '345', '8000', 1, '2760000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(92, 2, 12, '345', '8000', 2, '2760000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(93, 2, 12, '345', '555', 3, '191475', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(94, 4, 12, '5', '7000', 1, '35000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(95, 4, 12, '5', '500', 2, '2500', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(96, 4, 12, '5', '400', 3, '2000', '2025-09-13 06:32:34', NULL, NULL, NULL),
	(97, 2, 13, '5', '8000', 1, '40000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(98, 2, 13, '5', '8000', 2, '40000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(99, 2, 13, '5', '555', 3, '2775', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(100, 4, 13, '5', '7000', 1, '35000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(101, 4, 13, '5', '500', 2, '2500', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(102, 4, 13, '5', '400', 3, '2000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(103, 2, 13, '345', '8000', 1, '2760000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(104, 2, 13, '345', '8000', 2, '2760000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(105, 2, 13, '345', '555', 3, '191475', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(106, 4, 13, '5', '7000', 1, '35000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(107, 4, 13, '5', '500', 2, '2500', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(108, 4, 13, '5', '400', 3, '2000', '2025-09-13 06:32:37', NULL, NULL, NULL),
	(109, 7, 14, '3', '635', 1, '1905', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(110, 7, 14, '3', '800', 2, '2400', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(111, 7, 14, '3', '900', 3, '2700', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(112, 5, 14, '1', '4850', 1, '4850', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(113, 5, 14, '1', '4950', 2, '4950', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(114, 5, 14, '1', '5000', 3, '5000', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(115, 6, 14, '5', '650', 1, '3250', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(116, 6, 14, '5', '760', 2, '3800', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(117, 6, 14, '5', '800', 3, '4000', '2025-09-13 10:08:17', NULL, NULL, NULL),
	(118, 2, 15, '4', '8000', 1, '32000', '2025-09-20 20:41:35', NULL, NULL, NULL),
	(119, 2, 15, '4', '8000', 2, '32000', '2025-09-20 20:41:35', NULL, NULL, NULL),
	(120, 2, 15, '4', '555', 3, '2220', '2025-09-20 20:41:35', NULL, NULL, NULL),
	(121, 8, 16, '44', '1850', 1, '81400', '2025-09-20 20:42:10', NULL, NULL, NULL),
	(122, 8, 16, '44', '2222', 2, '97768', '2025-09-20 20:42:10', NULL, NULL, NULL),
	(123, 8, 16, '44', '2525', 3, '111100', '2025-09-20 20:42:10', NULL, NULL, NULL),
	(124, 6, 17, '56', '650', 1, '36400', '2025-09-20 20:42:51', NULL, NULL, NULL),
	(125, 6, 17, '56', '760', 2, '42560', '2025-09-20 20:42:51', NULL, NULL, NULL),
	(126, 6, 17, '56', '800', 3, '44800', '2025-09-20 20:42:51', NULL, NULL, NULL);

-- Dumping structure for table billing.company
CREATE TABLE IF NOT EXISTS `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `company_email` varchar(50) NOT NULL,
  `company_mobile_number` varchar(50) NOT NULL,
  `company_address` varchar(250) NOT NULL,
  `company_gst_number` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.company: ~3 rows (approximately)
REPLACE INTO `company` (`company_id`, `company_name`, `company_email`, `company_mobile_number`, `company_address`, `company_gst_number`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
	(1, 'Sri Kumaran', 'kumaran#gamil.com', '424241412', 'chennai', '123131312312313', '2025-08-01 17:37:54', NULL, 1, 1),
	(2, 'Sri Raghavendra', 'ragava@gamil.com', '4232442', 'chennai', '123131314234', '2025-08-01 17:38:52', NULL, 1, 1),
	(3, 'Santhosh Enterprises', 'santhos@gmail.com', '8072003754', 'chennai', '9878797789789798', '2025-08-01 17:39:52', NULL, 1, 1);

-- Dumping structure for table billing.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(50) NOT NULL,
  `cust_email` varchar(50) NOT NULL,
  `cust_mobile_number` varchar(50) NOT NULL,
  `cust_address` mediumtext NOT NULL,
  `cust_gst_number` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `cust_email` (`cust_email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.customer: ~3 rows (approximately)
REPLACE INTO `customer` (`cust_id`, `cust_name`, `cust_email`, `cust_mobile_number`, `cust_address`, `cust_gst_number`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(2, 'balaji', 'balarb', '8072222222', 'chennai', '113113131231', '2025-08-01 17:19:53', NULL, NULL, NULL),
	(3, 'deva', 'balaji11@gmail.com', '87567757453', 'chennai', '4213423424', '2025-08-01 17:24:05', 1, NULL, NULL),
	(4, 'M/s special officer ,thippair ,panchayat, pondi un', 'pondi@gmail.com', '909098970', 'pondi union', '113113131231', '2025-09-13 09:58:38', 1, NULL, NULL);

-- Dumping structure for table billing.masters
CREATE TABLE IF NOT EXISTS `masters` (
  `master_id` int(11) NOT NULL AUTO_INCREMENT,
  `gst_support` tinyint(1) NOT NULL,
  `gst_value` varchar(50) NOT NULL,
  `pdf_label_support` tinyint(1) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`master_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.masters: ~0 rows (approximately)

-- Dumping structure for table billing.parent_product
CREATE TABLE IF NOT EXISTS `parent_product` (
  `parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_product_name` text NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.parent_product: ~3 rows (approximately)
REPLACE INTO `parent_product` (`parent_id`, `parent_product_name`, `createdat`, `updatedat`) VALUES
	(1, 'fan', '2025-08-02 05:48:44', '2025-08-02 05:48:44'),
	(2, 'KE1 GATEVALVE  BUST15685', '2025-08-02 05:53:56', '2025-08-02 05:53:56'),
	(4, 'motor new stator fixing', '2025-09-13 10:00:16', '2025-09-13 10:00:16');

-- Dumping structure for table billing.products
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` mediumtext NOT NULL,
  `prod_price_1` varchar(50) NOT NULL,
  `prod_price_2` varchar(50) NOT NULL,
  `prod_price_3` varchar(50) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `qty_id` int(11) NOT NULL,
  `parent_produc_id` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.products: ~8 rows (approximately)
REPLACE INTO `products` (`prod_id`, `prod_name`, `prod_price_1`, `prod_price_2`, `prod_price_3`, `created_by`, `updated_by`, `created_at`, `updated_at`, `qty_id`, `parent_produc_id`) VALUES
	(2, 'Camton FAN', '8000', '8000', '555', 1, 1, '2025-09-12 17:48:00', NULL, 2, 2),
	(4, 'Usha Fan', '7000', '500', '400', 1, 1, '2025-09-12 18:35:04', NULL, 2, 2),
	(5, 'single phass new stator ', '4850', '4950', '5000', 1, 1, '2025-09-13 10:02:45', NULL, 1, 4),
	(6, '36MFd can cap brand ', '650', '760', '800', 1, 1, '2025-09-13 10:03:38', NULL, 1, 4),
	(7, '100ams fuse carrier', '635', '800', '900', 1, 1, '2025-09-13 10:04:22', NULL, 1, 4),
	(8, '7/20 aluminium', '1850', '2222', '2525', 1, 1, '2025-09-13 10:17:17', NULL, 1, 4),
	(9, 'Testing Products', '7000', '7000', '3000', 1, 1, '2025-09-20 20:37:14', NULL, 2, 1),
	(10, 'FAN54', '323', '329', '333', 1, 1, '2025-09-20 20:59:10', NULL, 4, 2);

-- Dumping structure for table billing.quantity_type
CREATE TABLE IF NOT EXISTS `quantity_type` (
  `quantity_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_type_name` text NOT NULL,
  `createdat` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`quantity_type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.quantity_type: ~5 rows (approximately)
REPLACE INTO `quantity_type` (`quantity_type_id`, `quantity_type_name`, `createdat`, `updatedat`) VALUES
	(1, 'NO', '2025-08-02 06:09:20', '2025-08-02 06:09:20'),
	(2, 'ST', '2025-08-02 06:09:34', '2025-08-02 06:09:34'),
	(3, 'RM', '2025-08-02 06:09:43', '2025-08-02 06:09:43'),
	(4, 'No', '2025-09-12 17:32:42', '2025-09-12 17:32:42'),
	(5, 'mtr', '2025-09-13 10:00:36', '2025-09-13 10:00:36');

-- Dumping structure for table billing.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` text NOT NULL,
  `user_mobile_number` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table billing.users: ~1 rows (approximately)
REPLACE INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_mobile_number`, `created_at`, `updated_at`, `updated_by`, `created_by`) VALUES
	(1, 'admin', 'admin@gmail.com', '$2b$10$RfD.gHSWoC96iLqwCI2RQOQnQrUxGA8X1tlmeRyWZxUkl1Va2/UxW', '807200032432', '2025-09-20 19:52:04', NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
