-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 21, 2022 at 06:36 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gas`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gas` int(11) NOT NULL,
  `temp` int(11) NOT NULL,
  `hum` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`id`, `gas`, `temp`, `hum`, `date`) VALUES
(1, 0, 0, 0, '2022-05-17'),
(2, 135, 28, 47, '2022-05-17'),
(3, 135, 28, 47, '2022-05-18'),
(4, 135, 28, 47, '2022-05-18'),
(5, 135, 28, 47, '2022-05-18'),
(6, 135, 28, 47, '2022-05-19'),
(7, 135, 28, 47, '2022-05-21'),
(8, 135, 28, 47, '2022-05-21'),
(9, 135, 28, 47, '2022-05-21'),
(10, 135, 28, 47, '2022-05-21'),
(11, 135, 28, 47, '2022-05-21'),
(12, 135, 28, 47, '2022-05-21'),
(13, 135, 28, 47, '2022-05-21');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `role`) VALUES
('manu@m.com', 'manu', 'user'),
('admin@gmail.com', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `dob` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `email`, `location`, `phone`, `dob`) VALUES
(1, 'manu', 'manu@m.com', 'ERNAKULAM', '997458125', '2000-02-02');
