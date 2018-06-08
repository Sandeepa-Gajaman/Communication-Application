-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2018 at 07:49 AM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `javaeeproject`
--
CREATE DATABASE IF NOT EXISTS `javaeeproject` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `javaeeproject`;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--
-- Creation: May 14, 2018 at 06:15 AM
--

CREATE TABLE `message` (
  `messageId` int(10) NOT NULL,
  `threadId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `image` mediumblob,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `project`
--
-- Creation: May 14, 2018 at 06:15 AM
--

CREATE TABLE `project` (
  `projectId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `city` varchar(25) NOT NULL,
  `budget` int(10) DEFAULT NULL,
  `startDate` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains projects.';

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--
-- Creation: May 14, 2018 at 06:15 AM
--

CREATE TABLE `thread` (
  `threadId` int(10) NOT NULL,
  `projectId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `receiverId` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contains message threads.';

-- --------------------------------------------------------

--
-- Table structure for table `user`
--
-- Creation: May 14, 2018 at 06:15 AM
-- Last update: May 14, 2018 at 07:15 AM
--

CREATE TABLE `user` (
  `userId` int(10) NOT NULL,
  `userName` varchar(25) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(25) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephoneNumber` varchar(13) NOT NULL,
  `password` char(40) NOT NULL,
  `userType` varchar(10) NOT NULL DEFAULT 'client',
  `city` varchar(25) DEFAULT NULL,
  `supplierCategory` varchar(50) DEFAULT NULL,
  `supplierDescription` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='The user table.';

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `userName`, `firstName`, `lastName`, `email`, `address`, `telephoneNumber`, `password`, `userType`, `city`, `supplierCategory`, `supplierDescription`) VALUES
(1, 'gehan', 'Gehan', 'Hettiarachchi', 'gehanmutti@gmail.com', 'No. 10, Gala Uda, Delkanda.', '0776453215', '5e6973616fb4b6dec0634c1bb65f82c78e4fb95a', 'client', 'Colombo', '', ''),
(2, 'dean', 'Dean', 'Winchester', 'dean.winchester@spn.com', '250, Kansas, FL.', '0715689872', 'e1bac5f8cb2b728addad6ca8a5c0142f43ddba', 'supplier', 'Colombo', 'Carpentry', 'I make quality woodwork.'),
(3, 'shamal', 'Shamal', 'Manawadu', 'manawaduge.manawaduge@gmail.com', 'Wickramasinghepura, Kotte.', '0725468253', '93ace842be6396233db5b9e1181a250958aeae', 'supplier', 'Colombo', 'Building Materials', 'I provide building materials such as sand, cement, nails etc. wholesale and retail at affordable prices.'),
(4, 'udara', 'Udara', 'Gamage', 'gamage.udara@gmail.com', '15, Main road, Kandy.', '0112547846', 'f679b4a0294acb4fd6cdf20f998ada4520d08b', 'client', 'Kandy', '', ''),
(5, 'lahiru', 'Lahiru', 'Ranasinghe', 'ruwanwellesuduweli@gmail.com', 'Sand city, Ruwanwella.', '0112563245', '5110b6b1a8f267f6e79d33eb5b89e68a91d58', 'supplier', 'Ruwanwella', '', 'I provide all types of sand legally and illegally, at black market prices.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageId`),
  ADD KEY `THREADID_FOREIGNKEY` (`threadId`),
  ADD KEY `USERID_FOREIGNKEY` (`userId`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectId`),
  ADD KEY `USERID_FOREIGNKEY` (`userId`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`threadId`),
  ADD KEY `PROJECTID_FOREIGNKEY` (`projectId`) USING BTREE,
  ADD KEY `USERID_FOREIGNKEY` (`userId`),
  ADD KEY `RECEIVERID_FOREIGNKEY` (`receiverId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `thread`
--
ALTER TABLE `thread`
  MODIFY `threadId` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `fk_message_thread` FOREIGN KEY (`threadId`) REFERENCES `thread` (`threadId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_message_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `fk_project_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;

--
-- Constraints for table `thread`
--
ALTER TABLE `thread`
  ADD CONSTRAINT `fk_thread_project` FOREIGN KEY (`projectId`) REFERENCES `project` (`projectId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_thread_receiver` FOREIGN KEY (`receiverId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_thread_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
