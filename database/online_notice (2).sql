-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2023 at 05:55 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_notice`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `user`, `pass`) VALUES
(1, 'joy@gmail.com', '1stloveMJ');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `personName` mediumtext NOT NULL,
  `commentDetails` mediumtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `notice_id`, `personName`, `commentDetails`, `date`) VALUES
(15, 40, 'Ajoy Bhowmik', 'thank you', '2023-01-15 06:04:44'),
(16, 40, 'joy  Bhowmik', 'thank you', '2023-01-15 06:09:16'),
(17, 40, 'joy  Bhowmik', 'thank you', '2023-01-15 06:09:31'),
(18, 41, 'joy  Bhowmik', 'end', '2023-01-15 06:54:06');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `notice_id`, `email`) VALUES
(21, 40, 'ajoy@nstu.edu.bd'),
(24, 41, 'joy2514@student.nstu.edu.bd');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `noticeIssuer` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `userType` varchar(50) DEFAULT 'All',
  `Description` mediumtext NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `likeCount` int(255) DEFAULT '0',
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`notice_id`, `noticeIssuer`, `name`, `userType`, `Description`, `FileName`, `likeCount`, `Date`) VALUES
(39, 'admin', 'Section office', 'All', 'design pattern', '6 design pattern.docx', 0, '2023-01-15 06:02:03'),
(40, 'admin', 'Section office', 'All', 'ai', 'AI scenarios.docx', 2, '2023-01-15 06:09:08'),
(41, 'Lecturer', 'Ajoy Bhowmik', 'All', 'aI pdf', 'AI scenarios.pdf', 1, '2023-01-15 06:55:38'),
(42, 'admin', 'Section office', 'Faculty member', 'facultu member', 'ASH1925012_Software architecture presentation.pptx', 0, '2023-01-15 06:57:16');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `Student_Id` text,
  `designation` varchar(30) DEFAULT 'student',
  `name` char(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `verifyStatus` int(30) NOT NULL DEFAULT '0',
  `Vcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `Student_Id`, `designation`, `name`, `email`, `pass`, `verifyStatus`, `Vcode`) VALUES
(11, NULL, 'Lecturer', 'Ajoy Bhowmik', 'ajoy@nstu.edu.bd', 'cf4a61ea12af1ec421e526584547342a', 1, NULL),
(19, NULL, 'admin', 'Section officer', 'joybhowmik67@gmail.com', 'cf4a61ea12af1ec421e526584547342a', 1, NULL),
(22, 'ash1925012m', 'Student', 'joy  Bhowmik', 'joy2514@student.nstu.edu.bd', 'cf4a61ea12af1ec421e526584547342a', 1, '74752cc574e3b544');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notice_id` (`notice_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);
ALTER TABLE `user` ADD FULLTEXT KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`) ON DELETE CASCADE;

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`notice_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
