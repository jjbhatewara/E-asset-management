-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 25, 2022 at 03:27 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easset`
--

-- --------------------------------------------------------

--
-- Table structure for table `allocation`
--

CREATE TABLE `allocation` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assed_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `allocation`
--

INSERT INTO `allocation` (`id`, `user_id`, `assed_id`) VALUES
(7, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE `asset` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `Description` text NOT NULL,
  `Date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`id`, `Name`, `type`, `Description`, `Date_added`, `isAvailable`) VALUES
(1, 'Dell inspiron', 1, 'A very good pc having i5 processor and Nvidia graphics card with 512 gb ssd,1 TB HDD and 16 gigs of ram.', '2022-09-20 23:39:06', 1),
(2, 'hp', 1, 'Good', '2022-09-22 20:13:30', 0),
(3, 'Song of fire', 2, 'Good quality', '2022-09-22 21:04:45', 0),
(4, '3 point something', 2, 'Chetan Bhagat', '2022-09-25 16:38:28', 1),
(5, 'Lenevo T14', 1, 'No SSD Present', '2022-09-25 18:02:08', 1),
(6, 'Book -2', 2, 'PaperBack,rr tolkien', '2022-09-25 18:27:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `asset_type`
--

CREATE TABLE `asset_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `period` int(5) NOT NULL,
  `fee` int(5) NOT NULL,
  `ban_days` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `asset_type`
--

INSERT INTO `asset_type` (`id`, `type`, `period`, `fee`, `ban_days`) VALUES
(1, 'Laptop', 10, 100, 14),
(2, 'Books', 7, 15, -1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `Message` text NOT NULL,
  `time_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `Message`, `time_added`) VALUES
(1, 2, 'Dell PC Overdue Please return before your next century', '2022-09-20 23:40:17');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(5) NOT NULL,
  `Role` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `Role`) VALUES
(1, 'Admin'),
(2, 'Borrowers');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(5) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Role_id` int(5) NOT NULL,
  `Telephone` varchar(12) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `FirstLogin` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Name`, `Role_id`, `Telephone`, `Email`, `Username`, `Password`, `LastLogin`, `FirstLogin`) VALUES
(1, 'Administator', 1, '9876543210', 'admin@gmail.com', 'Admin', 'admin@123', '2022-09-20 20:03:39', '2022-09-20 23:35:08'),
(2, 'Virat Kohli', 2, '9638527410', 'virat@bcci.in', 'virat', 'virat@123', '2022-09-20 20:03:39', '2022-09-20 23:35:08'),
(3, 'jinesh', 2, '8275734930', 'jjbhatewara@gmail.com', 'jinesh', 'user@123', '2022-09-23 15:29:50', '2022-09-23 19:00:49'),
(6, 'Yash', 2, '8845214782', 'yash@viit.ac.in', 'yash', 'user@123', '2022-09-23 19:15:45', '2022-09-23 19:15:45'),
(7, 'Bobby', 2, '8845214782', 'bobby@viit.ac.in', 'bobby', 'user@123', '2022-09-24 23:29:28', '2022-09-24 23:29:28'),
(8, 'Shrikar Kulkarni', 2, '8563214789', 'shrikar@viit.ac.in', 'shrikar', 'user@123', '2022-09-24 23:31:54', '2022-09-24 23:31:54'),
(9, 'test', 2, '985774215', 'test@test.com', 'test', '1', '2022-09-25 00:37:46', '2022-09-25 00:37:46'),
(10, 'Laskhmi', 2, '8753210145', 'lakshmi@vit.in', 'lakshmi', '123456', '2022-09-25 18:23:11', '2022-09-25 18:23:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allocation`
--
ALTER TABLE `allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `allocation_user_fk` (`user_id`),
  ADD KEY `allocation_asset_fk` (`assed_id`);

--
-- Indexes for table `asset`
--
ALTER TABLE `asset`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_fk` (`type`);

--
-- Indexes for table `asset_type`
--
ALTER TABLE `asset_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`Role_id`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `role_fk` (`Role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allocation`
--
ALTER TABLE `allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `asset`
--
ALTER TABLE `asset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `asset_type`
--
ALTER TABLE `asset_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allocation`
--
ALTER TABLE `allocation`
  ADD CONSTRAINT `allocation_asset_fk` FOREIGN KEY (`assed_id`) REFERENCES `asset` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `allocation_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `type_fk` FOREIGN KEY (`type`) REFERENCES `asset_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `role_fk` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
