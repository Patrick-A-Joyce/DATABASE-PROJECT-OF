-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2016 at 01:47 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `schooldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills_table`
--

CREATE TABLE IF NOT EXISTS `bills_table` (
  `bill_id` int(32) NOT NULL AUTO_INCREMENT,
  `bill_status_code` int(32) NOT NULL,
  `parent_id` int(32) NOT NULL,
  `date_issued` date NOT NULL,
  `amount_due` float(5,2) NOT NULL,
  `date_of _payment` date NOT NULL,
  `amount_paid` float(5,2) NOT NULL,
  `amount_outstanding` float(5,2) NOT NULL,
  `orher_details` varchar(50) NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `parent_id_idx` (`parent_id`),
  KEY `bill_status_code_idx` (`bill_status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `bills_table`
--

INSERT INTO `bills_table` (`bill_id`, `bill_status_code`, `parent_id`, `date_issued`, `amount_due`, `date_of _payment`, `amount_paid`, `amount_outstanding`, `orher_details`) VALUES
(1, 1, 1001, '2016-02-07', 105.00, '2016-03-23', 0.00, 105.00, 'N/A'),
(2, 2, 1002, '2016-02-07', 105.00, '2016-03-15', 55.00, 50.00, 'N/A'),
(3, 3, 1003, '2016-02-29', 105.00, '2016-03-01', 105.00, 0.00, 'N/A'),
(4, 3, 1004, '2016-02-02', 105.00, '2016-03-02', 105.00, 0.00, 'N/A'),
(5, 3, 1005, '2016-02-15', 100.00, '2016-03-15', 100.00, 0.00, '5.00 Discount'),
(6, 3, 1006, '2016-02-03', 105.00, '2016-03-03', 105.00, 0.00, 'N/A'),
(7, 2, 1007, '2016-03-05', 105.00, '2016-03-31', 0.00, 105.00, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `children_table`
--

CREATE TABLE IF NOT EXISTS `children_table` (
  `child_id` int(32) NOT NULL AUTO_INCREMENT,
  `parent_id` int(32) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `age` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `other_detils` varchar(50) NOT NULL,
  PRIMARY KEY (`child_id`),
  KEY `parent_id_idx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `children_table`
--

INSERT INTO `children_table` (`child_id`, `parent_id`, `gender`, `first_name`, `last_name`, `nickname`, `age`, `dob`, `other_detils`) VALUES
(101, 1001, 'F', 'Molly', 'Watts', 'Drama Queen', '12', '2004-03-10', 'Peanut Alergy'),
(102, 1002, 'M', 'Joe', 'Walsh', 'Joey', '10', '2006-05-09', ''),
(103, 1003, 'F', 'Sarah', 'Kelly', 'Poppy', '13', '2003-01-18', 'Learning disability'),
(104, 1004, 'M', 'James', 'Philips', 'Philly', '13', '2003-04-20', 'N/A'),
(105, 1005, 'F', 'Nicola', 'Conway', 'Nikki', '11', '2005-05-21', 'N/A'),
(106, 1006, 'F', 'Jessie', 'Jennings', 'JJ', '14', '2002-09-15', 'Celiac'),
(107, 1007, 'F', 'Claire', 'Roberts', 'Bobby', '12', '2004-07-19', 'N/A'),
(108, 1008, 'aaaaaaaaaa', 'aaaaaaaa', 'aaaaaaaa', 'aaaaaaaaaa', '5', '2001-02-23', 'aaaaaaaaa');

-- --------------------------------------------------------

--
-- Table structure for table `parents_table`
--

CREATE TABLE IF NOT EXISTS `parents_table` (
  `parent_id` int(32) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address_line1` varchar(50) NOT NULL,
  `address_line2` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `mobile_phone` varchar(50) NOT NULL,
  `other_details` varchar(50) NOT NULL,
  PRIMARY KEY (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `parents_table`
--

INSERT INTO `parents_table` (`parent_id`, `first_name`, `last_name`, `gender`, `address_line1`, `address_line2`, `city`, `state`, `home_phone`, `mobile_phone`, `other_details`) VALUES
(1001, 'Mary', 'Watts', 'F', '12 Ashville house', 'Lambay View', 'Galway', 'Connacht', '0914689746', '0876215562', 'Single Parent'),
(1002, 'Kate', 'Walsh', 'F', '34 chestnut grove', 'Willow drive', 'Galway', 'Connacht', '0916598756', '0876311584', 'N/A'),
(1003, 'Rachel', 'Kelly', 'F', 'Aircourt House', '12 Terrace Avenue', 'Galway', 'Connacht', '0918972355', '08696574123', 'Jahova''s Religion'),
(1004, 'John', 'Philips', 'M', '12 Sailsbury house', 'Kirwin Rd', 'Galway', 'Connacht', '0917836478', '0869874556', 'N/A'),
(1005, 'Micheal', 'Conway', 'M', '12 Millview House', 'Riverend Place', 'Galway', 'Connacht', '091897546', '085897458', 'N/A'),
(1006, 'Sarah', 'Jennings', 'F', '3 Ashleave place', 'Waycourt Avenue', 'Galway', 'Connacht', '091872354', '083852963', 'Single Parent'),
(1007, 'Jane', 'Roberts', 'F', '12 Waneward Grove', 'Hazelwood Drive', 'Galway', 'Connacht', '091785214', '085749963', 'N/A'),
(1008, 'Ivor', 'Jones', 'M', 'Shantalla', 'Westside', 'Galway', 'Connacht', '0918965698', '0838987979', 'Has no Children');

-- --------------------------------------------------------

--
-- Table structure for table `payments_table`
--

CREATE TABLE IF NOT EXISTS `payments_table` (
  `payment_id` int(32) NOT NULL AUTO_INCREMENT,
  `bill_id` int(32) NOT NULL,
  `date_of_payment` date NOT NULL,
  `amount_paid` float(5,2) NOT NULL,
  `amount_outstanding` float(5,2) NOT NULL,
  `other_details` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id_idx` (`bill_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1109 ;

--
-- Dumping data for table `payments_table`
--

INSERT INTO `payments_table` (`payment_id`, `bill_id`, `date_of_payment`, `amount_paid`, `amount_outstanding`, `other_details`) VALUES
(1101, 1, '2016-03-23', 0.00, 105.00, 'N/A'),
(1102, 2, '2016-03-15', 55.00, 50.00, 'N/A'),
(1103, 3, '2016-03-01', 105.00, 0.00, 'N/A'),
(1104, 4, '2016-03-02', 105.00, 0.00, 'N/A'),
(1105, 5, '2016-03-15', 100.00, 0.00, '5.00 Discount'),
(1106, 6, '2016-03-03', 105.00, 0.00, 'N/A'),
(1107, 7, '2016-03-31', 0.00, 105.00, 'N/A'),
(1108, 7, '2016-03-16', 0.00, 105.00, 'N/A');

-- --------------------------------------------------------

--
-- Table structure for table `ref_bill_status_table`
--

CREATE TABLE IF NOT EXISTS `ref_bill_status_table` (
  `bill_ststus_code` int(32) NOT NULL AUTO_INCREMENT,
  `bill_status_name` varchar(50) NOT NULL,
  `bill_status_discription` varchar(50) NOT NULL,
  PRIMARY KEY (`bill_ststus_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ref_bill_status_table`
--

INSERT INTO `ref_bill_status_table` (`bill_ststus_code`, `bill_status_name`, `bill_status_discription`) VALUES
(1, 'Unpaid', 'Unpaid Bill'),
(2, 'Issued', 'Issued Bill'),
(3, 'Paid', 'Paid Bill');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills_table`
--
ALTER TABLE `bills_table`
  ADD CONSTRAINT `bills_table_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parents_table` (`parent_id`),
  ADD CONSTRAINT `bill_status_code` FOREIGN KEY (`bill_status_code`) REFERENCES `ref_bill_status_table` (`bill_ststus_code`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `children_table`
--
ALTER TABLE `children_table`
  ADD CONSTRAINT `parent_id` FOREIGN KEY (`parent_id`) REFERENCES `parents_table` (`parent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments_table`
--
ALTER TABLE `payments_table`
  ADD CONSTRAINT `bill_id` FOREIGN KEY (`bill_id`) REFERENCES `bills_table` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
