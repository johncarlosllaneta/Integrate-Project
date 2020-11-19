-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2020 at 12:58 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `integratives`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `Username`, `Password`) VALUES
(1, 'Admin', 'HelloWorld12345');

-- --------------------------------------------------------

--
-- Table structure for table `english_table`
--

CREATE TABLE `english_table` (
  `user_fk` int(50) NOT NULL,
  `id` int(50) NOT NULL,
  `Lesson_Name` varchar(50) NOT NULL,
  `Score` varchar(50) NOT NULL,
  `Passing_Score` varchar(50) NOT NULL,
  `No_Items` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `filipino_table`
--

CREATE TABLE `filipino_table` (
  `user_fk` int(50) NOT NULL,
  `id` int(50) NOT NULL,
  `Lesson_Name` varchar(50) NOT NULL,
  `Score` varchar(50) NOT NULL,
  `Passing_Score` varchar(50) NOT NULL,
  `No_Items` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `math_table`
--

CREATE TABLE `math_table` (
  `id` int(50) NOT NULL,
  `user_fk` int(50) NOT NULL,
  `Lesson_Name` varchar(50) NOT NULL,
  `Score` varchar(50) NOT NULL,
  `Passing_Score` varchar(50) NOT NULL,
  `No_Items` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `progress_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(10) NOT NULL,
  `done` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reg_stud`
--

CREATE TABLE `reg_stud` (
  `id` int(11) NOT NULL,
  `Last_Name` varchar(255) NOT NULL,
  `First_Name` varchar(255) NOT NULL,
  `Birthday` varchar(255) NOT NULL,
  `Age` int(255) NOT NULL,
  `Guard_Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Phone_Num` varchar(50) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `science_table`
--

CREATE TABLE `science_table` (
  `user_fk` int(50) NOT NULL,
  `id` int(50) NOT NULL,
  `Lesson_Name` varchar(50) NOT NULL,
  `Score` varchar(50) NOT NULL,
  `Passing_Score` varchar(50) NOT NULL,
  `No_Items` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `english_table`
--
ALTER TABLE `english_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EnglishResult_StudFK` (`user_fk`);

--
-- Indexes for table `filipino_table`
--
ALTER TABLE `filipino_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FilipinoResult_StudFK` (`user_fk`);

--
-- Indexes for table `math_table`
--
ALTER TABLE `math_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progress_id`),
  ADD KEY `stud_progress_FK` (`user_id`);

--
-- Indexes for table `reg_stud`
--
ALTER TABLE `reg_stud`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `science_table`
--
ALTER TABLE `science_table`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_fk` (`user_fk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `english_table`
--
ALTER TABLE `english_table`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `filipino_table`
--
ALTER TABLE `filipino_table`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `math_table`
--
ALTER TABLE `math_table`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `progress_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reg_stud`
--
ALTER TABLE `reg_stud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `science_table`
--
ALTER TABLE `science_table`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `english_table`
--
ALTER TABLE `english_table`
  ADD CONSTRAINT `EnglishResult_StudFK` FOREIGN KEY (`user_fk`) REFERENCES `reg_stud` (`id`);

--
-- Constraints for table `filipino_table`
--
ALTER TABLE `filipino_table`
  ADD CONSTRAINT `FilipinoResult_StudFK` FOREIGN KEY (`user_fk`) REFERENCES `reg_stud` (`id`);

--
-- Constraints for table `math_table`
--
ALTER TABLE `math_table`
  ADD CONSTRAINT `MathResult_StudFK` FOREIGN KEY (`user_fk`) REFERENCES `reg_stud` (`id`);

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `stud_progress_FK` FOREIGN KEY (`user_id`) REFERENCES `reg_stud` (`id`);

--
-- Constraints for table `science_table`
--
ALTER TABLE `science_table`
  ADD CONSTRAINT `ScienceResult_StudFK` FOREIGN KEY (`user_fk`) REFERENCES `reg_stud` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
