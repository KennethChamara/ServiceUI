-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2020 at 10:46 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `scheduleID` int(11) NOT NULL,
  `doctorID` int(11) NOT NULL,
  `hospitalID` int(11) NOT NULL,
  `st_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_wk` varchar(10) NOT NULL,
  `status` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`scheduleID`, `doctorID`, `hospitalID`, `st_time`, `end_time`, `day_of_wk`, `status`) VALUES
(7, 10, 1, '02:30:00', '04:30:00', 'Monday', 'AV'),
(8, 3, 12, '23:59:00', '12:59:00', 'Tuesday', 'AV'),
(9, 55, 32, '01:00:00', '03:00:00', 'Friday', 'AV');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `amount` double NOT NULL,
  `payment_date` date NOT NULL,
  `refunded` tinyint(1) DEFAULT NULL,
  `refunded_date` date DEFAULT NULL,
  `refund_amount` double DEFAULT NULL,
  `card_number` varchar(50) DEFAULT NULL,
  `exp_year` int(11) DEFAULT NULL,
  `exp_month` int(11) DEFAULT NULL,
  `security_code` int(11) DEFAULT NULL,
  `card_holders_name` varchar(100) DEFAULT NULL,
  `online_payment_refarance` varchar(250) DEFAULT NULL,
  `paypal_payment_refarance` varchar(250) DEFAULT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_payments`
--

INSERT INTO `tbl_payments` (`id`, `appointment_id`, `amount`, `payment_date`, `refunded`, `refunded_date`, `refund_amount`, `card_number`, `exp_year`, `exp_month`, `security_code`, `card_holders_name`, `online_payment_refarance`, `paypal_payment_refarance`, `type`) VALUES
(4, 3, 100, '2020-04-11', NULL, NULL, NULL, '123', 2020, 12, 254, 'test', NULL, NULL, 'CreditCard'),
(6, 5, 100, '2020-04-12', 1, '2020-04-12', 5000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OnlineBanking'),
(40, 19, 1200, '2020-04-21', NULL, NULL, NULL, '345112525', 2022, 12, 984, 'Shire', NULL, NULL, 'CreditCard'),
(8, 9, 1200, '2020-04-15', 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PayPal'),
(37, 11, 1550, '2020-04-21', 1, '2020-04-21', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PayPal'),
(38, 50, 2550, '2020-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PayPal'),
(39, 14, 2560, '2020-04-21', 1, '2020-04-21', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OnlineBanking'),
(23, 29, 2200, '2020-04-17', 1, '2020-04-21', 1000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OnlineBanking'),
(24, 31, 2300, '2020-04-17', NULL, NULL, NULL, '123008525', 2023, 12, 967, 'Teh', NULL, NULL, 'CreditCard'),
(33, 9, 1200, '2020-04-21', 0, NULL, 0, '123548525', 2022, 12, 184, 'test', NULL, NULL, 'CreditCard'),
(35, 34, 2900, '2020-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'OnlineBanking'),
(36, 40, 1550, '2020-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'PayPal');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `roll` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `roll`) VALUES
(1, 'admin', 'admin', 'admin'),
(2, 'chamara', 'chamara', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`scheduleID`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
