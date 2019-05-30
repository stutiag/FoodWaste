-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 30, 2019 at 07:21 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food-waste`
--

-- --------------------------------------------------------

--
-- Table structure for table `donateditems`
--

DROP TABLE IF EXISTS `donateditems`;
CREATE TABLE IF NOT EXISTS `donateditems` (
  `srno` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `quantity` int(10) NOT NULL,
  `type` text NOT NULL,
  `exdate` date NOT NULL,
  `dcity` varchar(20) NOT NULL,
  `demail` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donateditems`
--

INSERT INTO `donateditems` (`srno`, `name`, `quantity`, `type`, `exdate`, `dcity`, `demail`) VALUES
(1, 'roti', 8, 'Cooked', '2019-06-04', 'bareilly', 'r@gmail.com'),
(2, 'bread', 6, 'Packed', '2019-06-07', 'bareilly', 'r@gmail.com'),
(3, 'jam', 12, 'Packed', '2019-06-14', 'bareilly', 'r@gmail.com'),
(4, 'dal', 2, 'Cooked', '2019-05-31', 'Bareilly', 'agarwalstuti1097@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `donators`
--

DROP TABLE IF EXISTS `donators`;
CREATE TABLE IF NOT EXISTS `donators` (
  `businessname` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `donators`
--

INSERT INTO `donators` (`businessname`, `email`) VALUES
('ABC ltd', 'r@gmail.com'),
('agarwalcaters', 'agarwalstuti1097@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `recieveditems`
--

DROP TABLE IF EXISTS `recieveditems`;
CREATE TABLE IF NOT EXISTS `recieveditems` (
  `name` varchar(30) NOT NULL,
  `quantity` int(10) NOT NULL,
  `demail` varchar(50) NOT NULL,
  `rname` varchar(30) NOT NULL,
  `remail` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recieveditems`
--

INSERT INTO `recieveditems` (`name`, `quantity`, `demail`, `rname`, `remail`) VALUES
('jam', 12, 'r@gmail.com', 'Stuti', 'rwal97@gmail.com'),
('dal', 2, 'agarwalstuti1097@gmail.com', 'Stuti', 'rwal97@gmail.com'),
('roti', 8, 'r@gmail.com', 'Stuti', 'rwal97@gmail.com'),
('dal', 2, 'agarwalstuti1097@gmail.com', 'Stuti', 'rwal97@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `recipients`
--

DROP TABLE IF EXISTS `recipients`;
CREATE TABLE IF NOT EXISTS `recipients` (
  `orgname` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipients`
--

INSERT INTO `recipients` (`orgname`, `email`) VALUES
('fepsi', 'rwal97@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstname`, `lastname`, `email`, `contact`, `address`, `password`, `type`, `city`) VALUES
('rajeev', 'ranjan', 'r@gmail.com', '8976543212', '149 abareillyUttar Pradesh243001', 'ra123', 'donator', 'bareilly'),
('Stuti', 'Agarwal', 'rwal97@gmail.com', '8768393920', '552,Brahamapura, BareillyUttar Pradesh243005', '1234', 'recipient', 'Bareilly'),
('Stuti', 'Agarwal', 'agarwalstuti1097@gmail.com', '9837027305', '552,Brahamapura, Bareilly,, Uttar PradeshBareillyUttar Pradesh243005', '1234a', 'donator', 'Bareilly');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
