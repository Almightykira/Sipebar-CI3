-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2023 at 04:21 PM
-- Server version: 10.3.38-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jagodig1_inventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_aplikasi`
--

CREATE TABLE `tb_aplikasi` (
  `id` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `telp` varchar(16) NOT NULL,
  `email` varchar(256) NOT NULL,
  `alamat` text NOT NULL,
  `logo` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_aplikasi`
--

INSERT INTO `tb_aplikasi` (`id`, `nama`, `telp`, `email`, `alamat`, `logo`) VALUES
(1, 'Aplikasi stok barang', '085296860888', 'limlisa185@gmail.com', 'jln R Jakarta', '');

-- --------------------------------------------------------

--
-- Table structure for table `tb_brand`
--

CREATE TABLE `tb_brand` (
  `id` int(11) NOT NULL,
  `brand` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_brand`
--

INSERT INTO `tb_brand` (`id`, `brand`) VALUES
(1, 'Thosiba'),
(3, 'Acer');

-- --------------------------------------------------------

--
-- Table structure for table `tb_category`
--

CREATE TABLE `tb_category` (
  `id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_category`
--

INSERT INTO `tb_category` (`id`, `category`) VALUES
(1, 'Komputer'),
(3, 'Acc Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `tb_iprouter`
--

CREATE TABLE `tb_iprouter` (
  `id` int(10) NOT NULL,
  `router` varchar(25) NOT NULL,
  `ip_router` varchar(25) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `status` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_iprouter`
--

INSERT INTO `tb_iprouter` (`id`, `router`, `ip_router`, `nama`, `alamat`, `status`) VALUES
(123, 'huawei', '192.168.100.1', 'adi', 'kudu', 'aktif'),
(125, 'orbitkk', '192.168.100.100kk', 'dedikk', 'jln sukajadikk', 'Tidak Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tb_issuing`
--

CREATE TABLE `tb_issuing` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `no_issuing` varchar(128) NOT NULL,
  `picker` varchar(128) NOT NULL,
  `remarks` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_issuing`
--

INSERT INTO `tb_issuing` (`id`, `date`, `no_issuing`, `picker`, `remarks`) VALUES
(1, '2023-01-09', 'BL.2020/IB-0901', 'heri', 'SiCepat-2431412'),
(2, '2023-01-10', '34657', 'Heri', 'On The W');

-- --------------------------------------------------------

--
-- Table structure for table `tb_log`
--

CREATE TABLE `tb_log` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `ipAddress` varchar(32) NOT NULL,
  `device` text NOT NULL,
  `status` varchar(16) NOT NULL,
  `terdaftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_log`
--

INSERT INTO `tb_log` (`id`, `idUser`, `ipAddress`, `device`, `status`, `terdaftar`) VALUES
(1, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'Login', '2022-09-06 21:47:00'),
(2, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36', 'Login', '2022-09-10 11:58:53'),
(3, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'Login', '2022-09-11 10:42:02'),
(4, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36', 'Login', '2022-09-11 18:20:26'),
(5, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Login', '2022-11-09 20:52:24'),
(6, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Logout', '2022-11-09 20:57:06'),
(7, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Login', '2022-11-09 20:57:14'),
(8, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36', 'Logout', '2022-11-09 20:57:37'),
(12, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Login', '2022-11-12 21:05:14'),
(13, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-12 21:05:51'),
(15, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Login', '2022-11-14 20:31:08'),
(16, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-14 20:31:20'),
(19, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Login', '2022-11-14 21:04:05'),
(20, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-14 21:07:49'),
(22, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Login', '2022-11-18 21:25:22'),
(23, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-18 21:25:29'),
(26, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Login', '2022-11-19 21:46:58'),
(27, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-19 21:47:06'),
(30, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-20 16:51:23'),
(33, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-20 22:02:31'),
(37, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-21 20:35:18'),
(47, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Safari/537.36', 'Logout', '2022-11-23 06:56:50'),
(58, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-01 20:04:42'),
(59, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-01 20:04:54'),
(62, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-02 16:45:38'),
(72, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-07 21:55:44'),
(73, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-07 21:55:50'),
(76, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-09 21:22:02'),
(77, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-09 21:22:08'),
(82, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-18 20:52:06'),
(83, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-18 20:52:16'),
(87, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-20 20:33:38'),
(90, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-21 20:14:09'),
(91, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-21 20:14:16'),
(93, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-21 21:19:23'),
(96, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-22 20:56:06'),
(98, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-22 21:28:37'),
(102, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-27 21:43:33'),
(104, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-28 20:29:49'),
(105, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-28 20:29:55'),
(106, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-28 20:30:00'),
(107, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-28 20:30:05'),
(108, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2022-12-28 20:30:12'),
(109, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2022-12-28 20:30:21'),
(114, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2023-01-09 20:55:45'),
(115, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2023-01-09 20:55:52'),
(118, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Login', '2023-01-13 10:32:06'),
(119, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2023-01-13 10:32:14'),
(121, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'Logout', '2023-01-13 22:42:20'),
(123, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-01-25 21:36:46'),
(124, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-01-25 21:37:07'),
(125, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-01-25 21:38:40'),
(128, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-01-28 13:25:35'),
(129, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-01-28 13:26:49'),
(136, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-04 11:42:11'),
(137, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-04 11:47:06'),
(149, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-04 11:57:54'),
(150, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-04 12:00:05'),
(155, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-04 12:19:58'),
(156, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-04 12:33:51'),
(162, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-04 15:19:15'),
(163, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-04 15:23:38'),
(166, 1, '182.3.69.184', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-10 22:17:54'),
(167, 1, '103.147.9.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-12 16:13:59'),
(168, 1, '103.147.9.141', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Logout', '2023-02-12 16:14:43'),
(170, 1, '36.71.85.217', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-12 20:51:03'),
(172, 1, '36.71.85.217', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 06:13:16'),
(173, 1, '36.71.85.217', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-13 06:15:43'),
(177, 1, '103.153.187.2', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-13 11:04:26'),
(178, 1, '36.71.85.34', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 11:11:05'),
(179, 1, '180.252.127.103', 'Mozilla/5.0 (Linux; Android 12; M2103K19G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 12:10:59'),
(180, 1, '140.213.71.108', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 12:25:36'),
(181, 1, '114.125.230.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-13 17:53:04'),
(182, 1, '114.125.230.74', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-13 17:53:29'),
(184, 1, '140.213.71.108', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 22:27:45'),
(185, 1, '140.213.71.108', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-13 22:27:56'),
(186, 1, '140.213.71.108', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-13 22:28:15'),
(187, 1, '140.213.71.108', 'Mozilla/5.0 (Linux; Android 7.0; Redmi Note 4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-13 22:28:32'),
(189, 1, '36.71.85.217', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-14 06:52:20'),
(190, 1, '36.71.85.217', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-14 06:53:24'),
(195, 1, '36.71.85.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.41', 'Login', '2023-02-14 10:42:14'),
(196, 1, '36.71.85.34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.41', 'Logout', '2023-02-14 10:42:36'),
(198, 1, '118.99.106.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-14 14:30:34'),
(199, 1, '118.99.106.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-14 14:39:07'),
(200, 1, '118.99.106.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-14 18:25:44'),
(201, 1, '118.99.106.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Logout', '2023-02-14 18:32:19'),
(202, 1, '118.99.106.125', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-14 19:44:56'),
(203, 5, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-14 20:12:27'),
(204, 5, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-14 20:19:39'),
(205, 7, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-14 20:20:07'),
(206, 7, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-14 20:20:20'),
(207, 6, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-14 20:20:41'),
(208, 6, '140.213.64.54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-14 20:22:25'),
(209, 6, '182.253.13.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-15 09:22:30'),
(210, 1, '118.99.106.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-15 14:15:13'),
(211, 1, '118.99.106.17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36 OPR/95.0.0.0', 'Login', '2023-02-15 18:02:09'),
(212, 6, '139.192.195.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-16 11:41:49'),
(213, 6, '139.192.195.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-16 11:44:09'),
(214, 5, '139.192.195.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-16 11:44:15'),
(215, 5, '139.192.195.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Logout', '2023-02-16 11:45:00'),
(216, 7, '139.192.195.179', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36', 'Login', '2023-02-16 11:45:05'),
(217, 6, '114.122.107.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.46', 'Login', '2023-02-17 15:14:02'),
(218, 6, '114.122.107.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.46', 'Logout', '2023-02-17 15:15:10'),
(219, 5, '114.122.107.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.46', 'Login', '2023-02-17 15:17:09'),
(220, 5, '114.122.107.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.46', 'Logout', '2023-02-17 15:17:36'),
(221, 6, '114.122.107.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36 Edg/110.0.1587.46', 'Login', '2023-02-17 15:18:53'),
(222, 6, '125.166.0.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0', 'Login', '2023-02-17 20:10:53'),
(223, 6, '36.71.140.239', 'Mozilla/5.0 (Linux; Android 11; CPH1937) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-18 08:38:37'),
(224, 6, '182.3.44.4', 'Mozilla/5.0 (Linux; Android 8.0.0; AUM-AL20) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-18 08:39:28'),
(225, 6, '114.122.103.102', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-18 13:03:58'),
(226, 6, '110.138.87.5', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-18 19:59:54'),
(227, 5, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-19 17:49:40'),
(228, 5, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-19 17:49:51'),
(229, 6, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-19 17:53:52'),
(230, 6, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-19 17:54:54'),
(231, 9, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-19 17:55:01'),
(232, 9, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-19 17:55:26'),
(233, 5, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-19 17:55:34'),
(234, 5, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-19 17:56:01'),
(235, 7, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Login', '2023-02-19 17:56:20'),
(236, 7, '36.71.82.33', 'Mozilla/5.0 (Linux; Android 12; 2201117TY) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Mobile Safari/537.36', 'Logout', '2023-02-19 17:57:09'),
(237, 6, '182.3.36.230', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-19 20:57:25'),
(238, 6, '182.3.36.230', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Logout', '2023-02-19 20:58:49'),
(241, 6, '182.3.36.230', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-19 21:00:16'),
(242, 6, '182.3.36.230', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Logout', '2023-02-19 21:00:33'),
(243, 5, '114.125.235.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-19 21:05:55'),
(244, 5, '114.125.235.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Logout', '2023-02-19 21:06:02'),
(245, 7, '114.125.235.14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-19 21:06:13'),
(246, 5, '182.23.86.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Login', '2023-02-20 14:22:36'),
(247, 5, '182.23.86.195', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'Logout', '2023-02-20 14:24:25'),
(248, 6, '125.165.109.47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'Login', '2023-02-20 21:20:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_data_barang`
--

CREATE TABLE `tb_master_data_barang` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `part_number` varchar(25) NOT NULL,
  `description` varchar(125) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL,
  `id_uom` int(11) NOT NULL,
  `move_type` varchar(50) NOT NULL,
  `price` varchar(50) NOT NULL,
  `img` varchar(25) NOT NULL,
  `remarks` varchar(50) NOT NULL,
  `stock` int(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_master_data_barang`
--

INSERT INTO `tb_master_data_barang` (`id`, `date`, `part_number`, `description`, `id_category`, `id_brand`, `id_uom`, `move_type`, `price`, `img`, `remarks`, `stock`) VALUES
(5, '2023-01-26', '0045', 'Keyboard', 1, 1, 1, 'slow moving', '3000', '', 'oke', 0),
(6, '2023-01-26', '45345', 'Laptop', 1, 1, 3, 'fast Moving', '3423', '', 'sadsda', 0),
(7, '2023-01-26', '1213', 'Mouse', 1, 1, 1, 'fast Moving', '60000', '', 'PO', 50),
(8, '2023-01-26', '1234567', 'Kabel HDMI', 3, 3, 3, 'fast Moving', '500000', '', 'PO', 15),
(12, '2023-02-14', '0031', 'Speaker', 1, 1, 1, 'fast Moving', '500000', '', 'fddgfg', 50);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `telp` varchar(256) NOT NULL,
  `alamat` varchar(256) NOT NULL,
  `tgltagihan` int(11) NOT NULL,
  `nominal` int(11) NOT NULL,
  `status` varchar(32) NOT NULL,
  `terdaftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id`, `nama`, `telp`, `alamat`, `tgltagihan`, `nominal`, `status`, `terdaftar`) VALUES
(1, 'anis', '23234234', 'jl melati', 8, 200000, 'Aktif', '2022-09-11 11:33:00'),
(2, 'heri', '23234234', 'belimbing', 9, 30000, 'Tidak Aktif', '2022-09-11 11:36:24');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `idPelanggan` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` int(11) NOT NULL,
  `terdaftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id`, `idUser`, `idPelanggan`, `tanggal`, `nominal`, `terdaftar`) VALUES
(1, 1, 2, '2022-09-11', 30000, '2022-09-11 11:37:05');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL,
  `id_receiving` int(11) NOT NULL,
  `product` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_productissuing`
--

CREATE TABLE `tb_productissuing` (
  `id` int(11) NOT NULL,
  `idissuing` int(128) NOT NULL,
  `id_master_data_barang` int(129) NOT NULL,
  `id_uom` int(128) NOT NULL,
  `jumlah` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_productissuing`
--

INSERT INTO `tb_productissuing` (`id`, `idissuing`, `id_master_data_barang`, `id_uom`, `jumlah`) VALUES
(2, 5, 5, 3, 3),
(7, 2, 7, 3, 2),
(8, 2, 7, 3, 45);

--
-- Triggers `tb_productissuing`
--
DELIMITER $$
CREATE TRIGGER `Tambah Stok dari delete issuing` AFTER DELETE ON `tb_productissuing` FOR EACH ROW BEGIN
UPDATE tb_master_data_barang SET stock = stock + OLD.jumlah
WHERE id= OLD.id_master_data_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `kurang Stock Issuing` AFTER INSERT ON `tb_productissuing` FOR EACH ROW BEGIN 
UPDATE tb_master_data_barang SET stock = stock - NEW.jumlah
WHERE id = NEW.id_master_data_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_productreceiving`
--

CREATE TABLE `tb_productreceiving` (
  `id` int(11) NOT NULL,
  `idReceiving` int(11) NOT NULL,
  `id_master_data_barang` int(11) NOT NULL,
  `id_uom` int(50) NOT NULL,
  `jumlah` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_productreceiving`
--

INSERT INTO `tb_productreceiving` (`id`, `idReceiving`, `id_master_data_barang`, `id_uom`, `jumlah`) VALUES
(1, 5, 5, 0, 5),
(2, 5, 0, 0, 7),
(3, 5, 0, 0, 9),
(4, 7, 0, 0, 6),
(5, 7, 0, 0, 5),
(6, 7, 0, 0, 5),
(7, 7, 0, 0, 12),
(11, 10, 5, 1, 6),
(17, 10, 6, 3, 3),
(18, 10, 6, 3, 3),
(19, 10, 6, 1, 50),
(20, 2, 6, 3, 12),
(21, 10, 8, 1, 50);

--
-- Triggers `tb_productreceiving`
--
DELIMITER $$
CREATE TRIGGER `hapus stok dari product receiving` AFTER DELETE ON `tb_productreceiving` FOR EACH ROW BEGIN
UPDATE tb_master_data_barang SET stock = stock - OLD.jumlah
WHERE id= OLD.id_master_data_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `otomatis menambah jumlah stok dari receiving` AFTER INSERT ON `tb_productreceiving` FOR EACH ROW BEGIN 
UPDATE tb_master_data_barang SET stock = stock + NEW.jumlah
WHERE id = NEW.id_master_data_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_receiving`
--

CREATE TABLE `tb_receiving` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `no_receiving` varchar(30) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `remarks` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_receiving`
--

INSERT INTO `tb_receiving` (`id`, `date`, `no_receiving`, `supplier`, `remarks`) VALUES
(9, '2022-12-27', '001', 'thosiba', 'PO'),
(10, '2022-12-28', '0012', 'PT. Duta', 'On PO');

-- --------------------------------------------------------

--
-- Table structure for table `tb_uom`
--

CREATE TABLE `tb_uom` (
  `id` int(11) NOT NULL,
  `nama_satuan` varchar(50) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_uom`
--

INSERT INTO `tb_uom` (`id`, `nama_satuan`, `keterangan`) VALUES
(1, 'Lsn', 'Lusin'),
(3, 'Pcs ', 'Pcs ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(256) NOT NULL,
  `telp` varchar(16) NOT NULL,
  `email` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `skin` varchar(8) NOT NULL,
  `level` varchar(16) NOT NULL,
  `terdaftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `telp`, `email`, `username`, `password`, `foto`, `skin`, `level`, `terdaftar`) VALUES
(1, 'lisa lim', '085296860888', 'limlisa185@gmail.com', 'lisalim', '$2y$10$E5eHF8DULIqazQMY/7/r6OvVqGQ8M/L5nNgy.zk4WgTOMtQ4jRB1u', 'Profil-1662908905.jpg', 'purple', 'Administrator', '2022-09-06 18:57:59'),
(5, 'heri', '085697197792', 'lisalim612@gmail.com', 'heri', '$2y$10$N8ewTN5Y3sZRCKsIc29Rl.rcQBoujb4KwclvWniIgjM9i7ntY4dIS', 'no-image.png', 'blue', 'Administrator', '2023-02-14 18:31:48'),
(6, 'admin', '083190781585', 'admin@admin.com', 'admin', '$2y$10$t6a9lTM2f.1H6Y5kZVi8/..6OkUhcM3/PXe.IMiBW0HMxVAYF4as6', 'no-image.png', 'blue', 'Administrator', '2023-02-14 20:13:17'),
(7, 'operator', '0831907816585', 'operator@gmail.com', 'operator', '$2y$10$BP3Uph/I6fnvMHM13/Ls0OeXjJ2l6Mvp.AT0Qp3lxFtGC3lfMzPh.', 'no-image.png', 'blue', 'Operator', '2023-02-14 20:15:16'),
(8, 'manager', '08319078', 'manager@gmail.com', 'manager', '$2y$10$14Fp05X5Qus0apcnhlGdT.hYF5b1jQCl6rjfPVdbbSAVymO0i9.Xa', 'no-image.png', 'blue', 'Manager', '2023-02-14 20:16:26'),
(9, 'Deni', '6', 'jd@s.com', 'deni', '$2y$10$p4m8sAkaFWbxNRfSKsj7f.j63SzlYv6fdXp48BcJjcbXzZJofWqw6', 'no-image.png', 'blue', 'Manager', '2023-02-19 17:54:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_aplikasi`
--
ALTER TABLE `tb_aplikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_brand`
--
ALTER TABLE `tb_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_category`
--
ALTER TABLE `tb_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_iprouter`
--
ALTER TABLE `tb_iprouter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_issuing`
--
ALTER TABLE `tb_issuing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK04` (`idUser`);

--
-- Indexes for table `tb_master_data_barang`
--
ALTER TABLE `tb_master_data_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_productissuing`
--
ALTER TABLE `tb_productissuing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_productreceiving`
--
ALTER TABLE `tb_productreceiving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_receiving`
--
ALTER TABLE `tb_receiving`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_uom`
--
ALTER TABLE `tb_uom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_aplikasi`
--
ALTER TABLE `tb_aplikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_brand`
--
ALTER TABLE `tb_brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_category`
--
ALTER TABLE `tb_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_iprouter`
--
ALTER TABLE `tb_iprouter`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `tb_issuing`
--
ALTER TABLE `tb_issuing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_log`
--
ALTER TABLE `tb_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `tb_master_data_barang`
--
ALTER TABLE `tb_master_data_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_productissuing`
--
ALTER TABLE `tb_productissuing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_productreceiving`
--
ALTER TABLE `tb_productreceiving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_receiving`
--
ALTER TABLE `tb_receiving`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_uom`
--
ALTER TABLE `tb_uom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_log`
--
ALTER TABLE `tb_log`
  ADD CONSTRAINT `FK01` FOREIGN KEY (`idUser`) REFERENCES `tb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
