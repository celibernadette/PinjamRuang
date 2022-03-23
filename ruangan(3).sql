-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2022 at 03:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruangan`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_ruangan`
--

CREATE TABLE `jadwal_ruangan` (
  `jadruang_id` bigint(20) NOT NULL,
  `jadruang_ruang_id` bigint(20) DEFAULT NULL,
  `jadruang_user_id` bigint(11) UNSIGNED DEFAULT NULL,
  `jadruang_keterangan` text DEFAULT NULL,
  `jadruang_tanggal_mulai` datetime DEFAULT NULL,
  `jadruang_tanggal_selesai` datetime DEFAULT NULL,
  `jadruang_status` enum('menunggu','setuju','tolak') DEFAULT 'menunggu',
  `jadruang_created_at` timestamp NULL DEFAULT current_timestamp(),
  `jadruang_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jadwal_ruangan`
--

INSERT INTO `jadwal_ruangan` (`jadruang_id`, `jadruang_ruang_id`, `jadruang_user_id`, `jadruang_keterangan`, `jadruang_tanggal_mulai`, `jadruang_tanggal_selesai`, `jadruang_status`, `jadruang_created_at`, `jadruang_updated_at`) VALUES
(1, 1, 10, 'Pinjam Untuk acara X', '2022-02-18 13:42:00', '2022-02-18 15:42:02', 'setuju', '2022-02-18 06:42:20', NULL),
(2, 3, 10, 'trial', '2022-02-21 07:30:00', '2022-02-21 14:30:00', 'tolak', '2022-02-18 08:18:36', NULL),
(4, 1, 10, 'HAHAHAHA', '2022-02-21 08:07:00', '2022-02-21 12:00:00', 'setuju', '2022-02-18 09:09:14', NULL),
(12, 2, 10, 'zzzzzzzzzzzzzzzzz', '2022-03-25 16:18:00', '2022-03-25 18:16:00', 'setuju', '2022-03-23 07:16:26', NULL),
(13, 3, 10, 'qqqqqqqqqqq', '2022-03-25 19:17:00', '2022-03-26 20:17:00', 'tolak', '2022-03-23 07:18:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `master_ruang`
--

CREATE TABLE `master_ruang` (
  `ruang_id` bigint(20) NOT NULL,
  `ruang_nama` varchar(255) DEFAULT NULL,
  `ruang_lokasi` varchar(255) DEFAULT NULL,
  `ruang_created_at` timestamp NULL DEFAULT current_timestamp(),
  `ruang_updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_ruang`
--

INSERT INTO `master_ruang` (`ruang_id`, `ruang_nama`, `ruang_lokasi`, `ruang_created_at`, `ruang_updated_at`) VALUES
(1, 'Ruang A', 'Kampus 1', '2022-02-18 03:52:43', '2022-02-18 03:52:43'),
(2, 'Ruang B', 'Kampus 1', '2022-02-18 03:52:43', '2022-02-18 03:52:43'),
(3, 'Ruang C', 'Kampus 2', '2022-02-18 03:52:43', '2022-02-18 03:52:43'),
(4, 'Ruang D', 'Kampus 2', '2022-02-18 03:52:44', '2022-02-18 03:52:44'),
(5, 'Ruang E', 'Kampus 3', '2022-02-18 03:52:44', '2022-02-18 03:52:44');

-- --------------------------------------------------------

--
-- Table structure for table `master_ruang_approver`
--

CREATE TABLE `master_ruang_approver` (
  `approver_id` bigint(20) NOT NULL,
  `approver_ruang_id` bigint(20) DEFAULT NULL,
  `approver_user_id` bigint(11) UNSIGNED DEFAULT NULL,
  `approver_created_at` timestamp NULL DEFAULT current_timestamp(),
  `approver_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `master_ruang_approver`
--

INSERT INTO `master_ruang_approver` (`approver_id`, `approver_ruang_id`, `approver_user_id`, `approver_created_at`, `approver_updated_at`) VALUES
(1, 1, 10, '2022-02-18 03:59:51', NULL),
(2, 1, 3, '2022-02-18 03:59:51', NULL),
(3, 2, 10, '2022-02-18 03:59:51', NULL),
(4, 3, 10, '2022-02-18 03:59:51', NULL),
(5, 4, 4, '2022-02-18 03:59:51', NULL),
(6, 5, 2, '2022-02-18 03:59:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_level`
--

CREATE TABLE `sys_level` (
  `level_id` int(11) NOT NULL,
  `level_nama` varchar(255) NOT NULL,
  `level_created_at` timestamp NULL DEFAULT current_timestamp(),
  `level_updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_level`
--

INSERT INTO `sys_level` (`level_id`, `level_nama`, `level_created_at`, `level_updated_at`) VALUES
(1, 'Kapala Lab', '2022-02-17 04:47:18', NULL),
(2, 'Mahasiswa', '2022-02-17 04:47:18', NULL),
(3, 'Admin', '2022-02-17 04:47:18', NULL),
(4, 'Root', '2022-02-17 04:47:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sys_notif`
--

CREATE TABLE `sys_notif` (
  `notif_id` bigint(20) NOT NULL,
  `notif_user_id` bigint(11) UNSIGNED DEFAULT NULL,
  `notif_title` varchar(255) DEFAULT NULL,
  `notif_message` text DEFAULT NULL,
  `notif_updated_at` timestamp NULL DEFAULT NULL,
  `notif_created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sys_user`
--

CREATE TABLE `sys_user` (
  `user_id` bigint(11) UNSIGNED NOT NULL,
  `user_level_id` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_last_login` timestamp NULL DEFAULT NULL,
  `user_created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_updated_at` timestamp NULL DEFAULT NULL,
  `user_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` (`user_id`, `user_level_id`, `user_email`, `user_password`, `user_last_login`, `user_created_at`, `user_updated_at`, `user_token`) VALUES
(1, 3, 'aldinokemal2104@gmail.com', '$2y$10$nxIHMxSvSDUHV8aq55.k0.kNFyvTG0O/pp2zsPGyz8dqMl/vNHMke', NULL, '2022-02-17 07:17:55', NULL, NULL),
(2, 1, 'kemal@google.com', '1234', NULL, '2022-02-18 03:50:51', NULL, NULL),
(3, 1, 'toni@google.com', 'asd', NULL, '2022-02-18 03:50:51', NULL, NULL),
(4, 1, 'luqni@google.com', 'asd', NULL, '2022-02-18 03:50:51', NULL, NULL),
(5, 1, 'rahmad@google.com', 'asd', NULL, '2022-02-18 03:50:51', NULL, NULL),
(10, 1, 'marcelina.widyastuti@atmi.ac.id', '1234', NULL, '2022-02-18 04:04:03', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal_ruangan`
--
ALTER TABLE `jadwal_ruangan`
  ADD PRIMARY KEY (`jadruang_id`),
  ADD KEY `jadwal_ruangan_sys_user_user_id_fk` (`jadruang_user_id`),
  ADD KEY `jadwal_ruangan_master_ruang_ruang_id_fk` (`jadruang_ruang_id`);

--
-- Indexes for table `master_ruang`
--
ALTER TABLE `master_ruang`
  ADD PRIMARY KEY (`ruang_id`);

--
-- Indexes for table `master_ruang_approver`
--
ALTER TABLE `master_ruang_approver`
  ADD PRIMARY KEY (`approver_id`),
  ADD KEY `master_ruang_approver_master_ruang_ruang_id_fk` (`approver_ruang_id`),
  ADD KEY `master_ruang_approver_sys_user_user_id_fk` (`approver_user_id`);

--
-- Indexes for table `sys_level`
--
ALTER TABLE `sys_level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `sys_notif`
--
ALTER TABLE `sys_notif`
  ADD PRIMARY KEY (`notif_id`),
  ADD KEY `sys_notif_sys_user_user_id_fk` (`notif_user_id`);

--
-- Indexes for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_level_id` (`user_level_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal_ruangan`
--
ALTER TABLE `jadwal_ruangan`
  MODIFY `jadruang_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `master_ruang`
--
ALTER TABLE `master_ruang`
  MODIFY `ruang_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `master_ruang_approver`
--
ALTER TABLE `master_ruang_approver`
  MODIFY `approver_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sys_level`
--
ALTER TABLE `sys_level`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sys_notif`
--
ALTER TABLE `sys_notif`
  MODIFY `notif_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sys_user`
--
ALTER TABLE `sys_user`
  MODIFY `user_id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal_ruangan`
--
ALTER TABLE `jadwal_ruangan`
  ADD CONSTRAINT `jadwal_ruangan_master_ruang_ruang_id_fk` FOREIGN KEY (`jadruang_ruang_id`) REFERENCES `master_ruang` (`ruang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `jadwal_ruangan_sys_user_user_id_fk` FOREIGN KEY (`jadruang_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `master_ruang_approver`
--
ALTER TABLE `master_ruang_approver`
  ADD CONSTRAINT `master_ruang_approver_master_ruang_ruang_id_fk` FOREIGN KEY (`approver_ruang_id`) REFERENCES `master_ruang` (`ruang_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `master_ruang_approver_sys_user_user_id_fk` FOREIGN KEY (`approver_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sys_notif`
--
ALTER TABLE `sys_notif`
  ADD CONSTRAINT `sys_notif_sys_user_user_id_fk` FOREIGN KEY (`notif_user_id`) REFERENCES `sys_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sys_user`
--
ALTER TABLE `sys_user`
  ADD CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`user_level_id`) REFERENCES `sys_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
