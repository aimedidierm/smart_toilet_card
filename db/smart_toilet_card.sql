-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 02, 2023 at 01:18 AM
-- Server version: 8.0.29-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smart_toilet_card`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `names`, `phone`, `address`, `password`, `time`) VALUES
(1, 'admin@gmail.com', 'Aime DIdier ', '0788750979', 'Huye, Rwanda', '3b081fd5426c134088a9b1466ff4c224', '2022-06-17 13:58:07');

-- --------------------------------------------------------

--
-- Table structure for table `pending_withdraw`
--

CREATE TABLE `pending_withdraw` (
  `id` int NOT NULL,
  `seller` int NOT NULL,
  `amount` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pending_withdraw`
--

INSERT INTO `pending_withdraw` (`id`, `seller`, `amount`, `time`) VALUES
(1, 1, 500, '2022-06-25 21:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `balance` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`id`, `email`, `names`, `phone`, `address`, `balance`, `password`, `time`) VALUES
(1, 'seller@gmail.com', 'Aime Didier', '0788750979', 'Huye, Rwanda', '100', '3b081fd5426c134088a9b1466ff4c224', '2022-06-17 13:17:29');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `debit` int NOT NULL DEFAULT '0',
  `credit` int NOT NULL DEFAULT '0',
  `seller` int DEFAULT NULL,
  `user` int DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `debit`, `credit`, `seller`, `user`, `time`) VALUES
(1, 1000, 0, 1, NULL, '2022-06-24 15:20:03'),
(2, 10, 0, NULL, 1, '2022-06-25 22:21:05'),
(3, 1000, 0, NULL, 1, '2022-07-01 15:39:13'),
(4, 0, 1000, NULL, 1, '2022-07-01 15:45:39'),
(5, 0, 1, NULL, 1, '2022-07-29 08:43:22'),
(6, 0, 100, 1, NULL, '2022-08-07 03:31:06'),
(7, 0, 1000, 1, NULL, '2022-08-07 03:32:14'),
(8, 0, 100, 1, NULL, '2022-08-27 16:56:18'),
(9, 0, 100, NULL, NULL, '2022-09-10 22:02:05'),
(10, 0, 100, NULL, 1, '2022-09-10 22:02:20'),
(11, 0, 200, NULL, 1, '2022-10-10 23:16:38'),
(12, 0, 100, NULL, 1, '2022-12-02 18:47:02'),
(13, 0, 100, NULL, 1, '2022-12-02 22:48:16'),
(14, 0, 100, NULL, 1, '2022-12-02 22:48:17'),
(15, 0, 100, NULL, 1, '2022-12-02 22:48:19'),
(16, 0, 100, NULL, 1, '2022-12-02 22:48:20'),
(17, 0, 100, NULL, 1, '2022-12-02 22:48:22'),
(18, 0, 100, NULL, 1, '2022-12-02 22:48:23'),
(19, 0, 100, NULL, 1, '2022-12-02 22:48:24'),
(20, 0, 100, NULL, 1, '2022-12-02 22:48:26'),
(21, 0, 100, NULL, 1, '2022-12-02 22:48:27'),
(22, 0, 100, NULL, 1, '2022-12-02 22:48:29'),
(23, 0, 100, NULL, 1, '2022-12-02 22:48:30'),
(24, 0, 100, NULL, 1, '2022-12-02 22:48:31'),
(25, 0, 100, NULL, 1, '2022-12-02 22:48:33'),
(26, 0, 100, NULL, 1, '2022-12-02 22:48:34'),
(27, 0, 100, NULL, 1, '2022-12-02 22:48:35'),
(28, 0, 100, NULL, 1, '2022-12-02 22:48:37'),
(29, 0, 100, NULL, 1, '2022-12-02 22:48:38'),
(30, 0, 100, NULL, 1, '2022-12-02 22:48:40'),
(31, 0, 100, NULL, 1, '2022-12-03 00:25:33'),
(32, 0, 100, NULL, 1, '2022-12-03 11:46:15'),
(33, 0, 100, NULL, 1, '2022-12-03 11:46:21'),
(34, 0, 100, NULL, 1, '2022-12-03 11:46:27'),
(35, 0, 100, NULL, 1, '2022-12-03 11:46:33'),
(36, 0, 100, NULL, 1, '2022-12-03 11:46:34'),
(37, 0, 100, NULL, 1, '2022-12-03 11:46:35'),
(38, 0, 100, NULL, 1, '2022-12-03 11:46:36'),
(39, 0, 100, NULL, 1, '2022-12-03 11:46:37'),
(40, 0, 100, NULL, 1, '2022-12-03 11:46:39'),
(41, 0, 100, NULL, 1, '2022-12-03 11:46:40'),
(42, 0, 100, NULL, 1, '2022-12-03 11:46:41'),
(43, 0, 100, NULL, 1, '2022-12-03 11:46:42'),
(44, 0, 100, NULL, 1, '2022-12-03 11:46:44'),
(45, 0, 100, NULL, 1, '2022-12-03 11:46:45'),
(46, 0, 100, NULL, 1, '2022-12-03 11:51:02'),
(47, 0, 100, NULL, 1, '2022-12-03 11:51:11'),
(48, 0, 100, NULL, 1, '2022-12-03 11:51:17'),
(49, 0, 100, NULL, 1, '2022-12-03 11:51:23'),
(50, 0, 100, NULL, 1, '2022-12-03 11:51:32'),
(51, 0, 100, NULL, 1, '2022-12-03 11:53:00'),
(52, 0, 100, NULL, 1, '2022-12-03 11:53:09'),
(53, 0, 100, NULL, 1, '2022-12-03 11:53:15'),
(54, 0, 100, NULL, 1, '2022-12-03 11:53:24'),
(55, 0, 100, NULL, 1, '2022-12-03 11:53:31'),
(56, 0, 100, NULL, 1, '2022-12-03 15:22:39'),
(57, 0, 100, NULL, 1, '2022-12-03 15:22:41'),
(58, 0, 100, NULL, 1, '2022-12-03 15:22:42'),
(59, 0, 100, NULL, 1, '2022-12-03 15:22:43'),
(60, 0, 100, NULL, 1, '2022-12-03 15:22:45'),
(61, 0, 100, NULL, 1, '2022-12-03 15:22:46'),
(62, 0, 100, NULL, 1, '2022-12-03 15:22:48'),
(63, 0, 100, NULL, 1, '2022-12-03 15:23:38'),
(64, 0, 100, NULL, 1, '2022-12-03 15:23:40'),
(65, 0, 100, NULL, 1, '2022-12-03 15:23:41'),
(66, 0, 100, NULL, 1, '2022-12-03 15:24:56'),
(67, 0, 100, NULL, 1, '2022-12-03 15:24:58'),
(68, 0, 100, NULL, 1, '2022-12-03 15:24:59'),
(69, 0, 100, NULL, 1, '2022-12-03 15:25:01'),
(70, 0, 100, NULL, 1, '2022-12-03 15:25:02'),
(71, 0, 100, NULL, 1, '2022-12-03 15:25:02'),
(72, 0, 100, NULL, 1, '2022-12-03 15:25:04'),
(73, 0, 100, NULL, 1, '2022-12-03 15:25:05'),
(74, 0, 100, NULL, 1, '2022-12-03 15:25:06'),
(75, 0, 100, NULL, 1, '2022-12-03 15:25:08'),
(76, 0, 100, NULL, 1, '2022-12-03 15:25:09'),
(77, 0, 100, NULL, 1, '2022-12-03 15:26:23'),
(78, 0, 100, NULL, 1, '2022-12-03 15:26:25'),
(79, 0, 100, NULL, 1, '2022-12-03 15:26:26'),
(80, 0, 100, NULL, 1, '2022-12-03 15:26:27'),
(81, 0, 100, NULL, 1, '2022-12-03 15:26:29'),
(82, 0, 100, NULL, 1, '2022-12-03 15:26:30'),
(83, 0, 100, NULL, 1, '2022-12-03 15:26:32'),
(84, 0, 100, NULL, 1, '2022-12-03 15:26:33'),
(85, 0, 100, NULL, 1, '2022-12-03 15:26:34'),
(86, 0, 100, NULL, 1, '2022-12-03 15:26:36'),
(87, 0, 100, NULL, 1, '2022-12-03 15:26:37'),
(88, 0, 100, NULL, 1, '2022-12-03 15:26:38'),
(89, 0, 100, NULL, 1, '2022-12-03 15:26:40'),
(90, 0, 100, NULL, 1, '2022-12-03 15:26:41'),
(91, 0, 100, NULL, 1, '2022-12-03 15:26:43'),
(92, 0, 100, NULL, 1, '2022-12-03 15:26:44'),
(93, 0, 100, NULL, 1, '2022-12-03 15:26:45'),
(94, 0, 100, NULL, 1, '2022-12-03 15:26:46'),
(95, 0, 100, NULL, 1, '2022-12-03 15:26:47'),
(96, 0, 100, NULL, 1, '2022-12-03 15:26:48'),
(97, 0, 100, NULL, 1, '2022-12-03 15:26:50'),
(98, 0, 100, NULL, 1, '2022-12-03 15:26:51'),
(99, 0, 100, NULL, 1, '2022-12-03 15:26:52'),
(100, 0, 100, NULL, 1, '2022-12-03 15:26:53'),
(101, 0, 100, NULL, 1, '2022-12-03 15:26:54'),
(102, 0, 100, NULL, 1, '2022-12-03 15:26:56'),
(103, 0, 100, NULL, 1, '2022-12-03 15:26:57'),
(104, 0, 100, NULL, 1, '2022-12-03 15:26:59'),
(105, 0, 100, NULL, 1, '2022-12-03 15:27:00'),
(106, 0, 100, NULL, 1, '2022-12-03 15:27:02'),
(107, 0, 100, NULL, 1, '2022-12-03 15:27:03'),
(108, 0, 100, NULL, 1, '2022-12-03 15:27:04'),
(109, 0, 100, NULL, 1, '2022-12-03 15:27:06'),
(110, 0, 100, NULL, 1, '2022-12-03 15:27:07'),
(111, 0, 100, NULL, 1, '2022-12-03 15:27:08'),
(112, 0, 100, NULL, 1, '2022-12-03 15:27:10'),
(113, 0, 100, NULL, 1, '2022-12-03 15:27:11'),
(114, 0, 100, NULL, 1, '2022-12-03 15:27:12'),
(115, 0, 100, NULL, 1, '2022-12-03 15:27:14'),
(116, 0, 100, NULL, 1, '2022-12-03 15:27:14'),
(117, 0, 100, NULL, 1, '2022-12-03 16:14:42'),
(118, 0, 100, NULL, 1, '2022-12-03 16:14:43'),
(119, 0, 100, NULL, 1, '2022-12-03 16:14:45'),
(120, 0, 100, NULL, 1, '2022-12-03 16:14:46'),
(121, 0, 100, NULL, 1, '2022-12-03 16:14:47'),
(122, 0, 100, NULL, 1, '2022-12-03 16:14:49'),
(123, 0, 100, NULL, 1, '2022-12-03 16:14:50'),
(124, 0, 100, NULL, 1, '2022-12-03 16:14:56'),
(125, 0, 100, NULL, 1, '2022-12-03 16:15:03'),
(126, 0, 100, NULL, 1, '2022-12-03 16:15:06'),
(127, 0, 100, NULL, 1, '2022-12-03 16:24:31'),
(128, 0, 100, NULL, 1, '2022-12-03 16:24:33'),
(129, 0, 100, NULL, 1, '2022-12-03 16:24:34'),
(130, 0, 100, NULL, 1, '2022-12-03 16:24:35'),
(131, 0, 100, NULL, 1, '2022-12-03 16:24:37'),
(132, 0, 100, NULL, 1, '2022-12-03 16:24:38'),
(133, 0, 100, NULL, 1, '2022-12-03 16:24:40'),
(134, 0, 100, NULL, 1, '2022-12-03 16:24:41'),
(135, 0, 100, NULL, 1, '2022-12-03 16:24:43'),
(136, 0, 100, NULL, 1, '2022-12-03 16:24:44'),
(137, 0, 100, NULL, 1, '2022-12-03 17:18:30'),
(138, 0, 100, NULL, 1, '2022-12-03 17:18:32'),
(139, 0, 100, NULL, 1, '2022-12-03 17:18:39'),
(140, 0, 100, NULL, 1, '2022-12-03 17:18:45'),
(141, 0, 100, NULL, 1, '2022-12-03 17:18:51'),
(142, 0, 100, NULL, 1, '2022-12-03 17:18:57'),
(143, 0, 100, NULL, 1, '2022-12-03 17:19:04'),
(144, 0, 100, NULL, 1, '2022-12-03 17:19:07'),
(145, 0, 100, NULL, 1, '2022-12-03 17:19:14'),
(146, 0, 100, NULL, 1, '2022-12-03 17:19:17'),
(147, 0, 100, NULL, 1, '2022-12-03 17:33:34'),
(148, 0, 100, NULL, 1, '2022-12-03 17:34:03'),
(149, 0, 100, NULL, 1, '2022-12-03 17:35:32'),
(150, 0, 100, NULL, 1, '2022-12-03 17:35:58'),
(151, 200, 0, NULL, 1, '2022-12-03 17:45:11'),
(152, 100, 0, NULL, 1, '2022-12-03 17:48:07'),
(153, 200, 0, NULL, 1, '2022-12-03 17:50:16'),
(154, 300, 0, NULL, 1, '2022-12-03 17:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `names` varchar(255) NOT NULL,
  `card` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL DEFAULT '0',
  `balance` int NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `names`, `card`, `email`, `phone`, `balance`, `time`) VALUES
(1, 'Didier', '123', 'aimedidiermugisha@gmail.com', '0788750979', 2200, '2022-06-25 22:23:06'),
(7, 'Aime', '3379BEAB', 'aimedidier@gmail.com', '07888758666666', 500, '2022-12-03 11:41:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `pending_withdraw`
--
ALTER TABLE `pending_withdraw`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller` (`seller`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `seller` (`seller`),
  ADD KEY `student` (`user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `card` (`card`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pending_withdraw`
--
ALTER TABLE `pending_withdraw`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
