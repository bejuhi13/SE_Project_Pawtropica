-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 07:26 AM
-- Server version: 10.11.0-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pawtropica`
--

create database pawtropica;

use pawtropica;

--
-- Table structure for table `bookings`
--



CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `cust_name` varchar(30) DEFAULT NULL,
  `pet_name` varchar(30) DEFAULT NULL,
  `booking_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `date_created`, `cust_name`, `pet_name`, `booking_time`) VALUES
(1, '2022-11-28 00:00:00', 'navya1', 'miles', '2022-12-03 14:30:00'),
(2, '2022-11-28 00:00:00', 'diya anne', 'herbert', '2022-12-03 16:00:00'),
(3, '2022-11-28 21:29:12', 'navya1', 'timothy', '2022-12-05 16:00:00'),
(4, '2022-11-28 21:33:59', 'navya1', 'catisson', '2022-12-09 15:30:00'),
(5, '2022-11-28 22:58:34', 'bhavani', 'asterix', '2022-12-09 11:00:00'),
(7, '2022-11-29 09:19:56', 'athira', 'casper', '2022-11-30 12:30:00'),
(8, '2022-11-29 10:25:57', 'elizabeth maria', 'pochita', '2022-11-30 12:30:00'),
(9, '2022-11-29 10:28:13', 'admin1', 'dog', '2022-12-09 10:28:00'),
(10, '2022-11-29 10:44:35', 'haria_mehkhad', 'marble', '2022-11-29 09:00:00'),
(11, '2022-11-29 10:54:29', 'Isha A', 'Greyie', '2022-12-01 13:57:00'),
(12, '2022-11-29 13:28:00', 'Isha A', 'wolfie', '2022-12-07 17:30:00'),
(13, '2022-11-29 13:53:52', 'gagan', 'blu', '2022-11-30 07:00:00'),
(14, '2022-11-29 14:07:21', 'dhriti', 'loki', '2022-12-08 14:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(30) NOT NULL,
  `user_pwd` varchar(30) DEFAULT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `user_pwd`, `email_id`, `user_type`) VALUES
('admin1', 'admin123', 'admin1@gmail.com', 'admin'),
('admin2', 'admin123', 'admin2@gmail.com', 'admin'),
('admin3', 'admin123', 'admin3@gmail.com', 'admin'),
('admin4', 'admin123', 'admin4@gmail.com', 'admin'),
('anusha', 'pes', 'anusha@gmail.com', NULL),
('athira', 'athira', 'athira@gmail.com', NULL),
('bhavani', 'iloveorchids', 'bhavani@gmail.com', NULL),
('cyno mahamatra', 'iamfunny', 'cynomatra@gmail.com', 'volunteer'),
('dhriti', '4321', 'dhriti@gmail.com', NULL),
('diya anne', 'jarofdirt', 'diyaanne7@gmail.com', 'owner'),
('elizabeth maria', 'maria1711', 'maria2001@gmail.com', 'owner'),
('gagan', 'password', 'gagan@gmail.com', NULL),
('haria_mehkhad', 'harumaru', 'haria@gmail.com', NULL),
('Isha A', 'ishaa', 'ishaa@gmail.com', NULL),
('navya1', 'navya123', 'navya@gmail.com', NULL),
('navya`', 'navya123', 'navya@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
