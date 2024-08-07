-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 23, 2021 at 04:09 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `pbms_mas_department`
--

CREATE TABLE `pbms_mas_department` (
  `DEPARTMENT_ID` int(11) NOT NULL,
  `DIVISION_ID` int(11) NOT NULL,
  `GOAL_ID` int(11) NOT NULL,
  `COSTCENTER` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'รหัสศูนย์ต้นทุน',
  `DEPARTMENT_INITIAL` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อย่อ',
  `DEPARTMENT_NAME` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'กลุ่มงาน',
  `YEARS` int(11) NOT NULL COMMENT 'ปีงบประมาณ',
  `CREATE_BY` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'สร้างโดยใคร',
  `CREATE_DATE` datetime NOT NULL COMMENT 'วันเวลาที่สร้าง',
  `UPDATE_BY` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'อัพเดทโดยใคร',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT 'วันเวลาที่อัพเดท'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pbms_mas_department`
--
ALTER TABLE `pbms_mas_department`
  ADD PRIMARY KEY (`DEPARTMENT_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
