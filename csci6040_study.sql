-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2024 at 09:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csci6040_study`
--
CREATE DATABASE IF NOT EXISTS `csci6040_study` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `csci6040_study`;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `location`) VALUES
(1, 'Computer Science', 'Building A'),
(2, 'Mathematics', 'Building B'),
(3, 'Physics', 'Building C');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `grade_point` float DEFAULT NULL,
  `grade_letter` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `subject_id`, `student_id`, `teacher_id`, `term`, `grade_point`, `grade_letter`) VALUES
(1, 1, 1, 1, 'Fall 2023', 3.5, 'B+'),
(2, 2, 1, 2, 'Fall 2023', 4, 'A'),
(3, 3, 2, 3, 'Fall 2023', 2.8, 'B-'),
(4, 4, 2, 4, 'Winter 2024', 3, 'B'),
(5, 5, 3, 5, 'Winter 2024', 3.7, 'A-'),
(6, 6, 3, 6, 'Winter 2024', 3.9, 'A'),
(7, 7, 4, 7, 'Spring 2024', 2.9, 'C+'),
(8, 8, 4, 8, 'Spring 2024', 3.4, 'B+'),
(9, 9, 5, 9, 'Spring 2024', 4, 'A'),
(10, 10, 5, 10, 'Fall 2023', 3.1, 'B'),
(11, 11, 6, 1, 'Winter 2024', 3.6, 'A-'),
(12, 12, 6, 2, 'Fall 2023', 3.8, 'A'),
(13, 13, 7, 3, 'Spring 2024', 2.7, 'B-'),
(14, 14, 7, 4, 'Winter 2024', 3.5, 'B+'),
(15, 15, 8, 5, 'Fall 2023', 4, 'A'),
(16, 1, 8, 6, 'Winter 2024', 2.9, 'C+'),
(17, 2, 9, 7, 'Spring 2024', 3.4, 'B'),
(18, 3, 9, 8, 'Spring 2024', 3.9, 'A-'),
(19, 4, 10, 9, 'Fall 2023', 2.8, 'B-'),
(20, 5, 10, 10, 'Winter 2024', 3.2, 'B'),
(21, 6, 11, 1, 'Spring 2024', 3.6, 'A-'),
(22, 7, 11, 2, 'Fall 2023', 3.9, 'A'),
(23, 8, 12, 3, 'Winter 2024', 2.7, 'B-'),
(24, 9, 12, 4, 'Fall 2023', 3.4, 'B+'),
(25, 10, 13, 5, 'Spring 2024', 4, 'A'),
(26, 11, 13, 6, 'Winter 2024', 3.1, 'B'),
(27, 12, 14, 7, 'Fall 2023', 3.6, 'A-'),
(28, 13, 14, 8, 'Spring 2024', 3.8, 'A'),
(29, 14, 15, 9, 'Winter 2024', 2.7, 'B-'),
(30, 15, 15, 10, 'Fall 2023', 3.9, 'A-'),
(31, 1, 16, 1, 'Spring 2024', 4, 'A'),
(32, 2, 16, 2, 'Winter 2024', 3, 'B'),
(33, 3, 17, 3, 'Fall 2023', 3.2, 'B'),
(34, 4, 17, 4, 'Spring 2024', 2.8, 'B-'),
(35, 5, 18, 5, 'Winter 2024', 3.7, 'A-'),
(36, 6, 18, 6, 'Fall 2023', 3.9, 'A'),
(37, 7, 19, 7, 'Spring 2024', 3.5, 'B+'),
(38, 8, 19, 8, 'Fall 2023', 4, 'A'),
(39, 9, 20, 9, 'Winter 2024', 2.9, 'C+'),
(40, 10, 20, 10, 'Spring 2024', 3.4, 'B+'),
(41, 11, 21, 1, 'Winter 2024', 3.8, 'A'),
(42, 12, 21, 2, 'Fall 2023', 2.7, 'B-'),
(43, 13, 22, 3, 'Winter 2024', 3.9, 'A-'),
(44, 14, 22, 4, 'Fall 2023', 3.1, 'B'),
(45, 15, 23, 5, 'Spring 2024', 3.6, 'A-'),
(46, 1, 23, 6, 'Winter 2024', 3.9, 'A'),
(47, 2, 24, 7, 'Fall 2023', 2.7, 'B-'),
(48, 3, 24, 8, 'Spring 2024', 3.5, 'B+'),
(49, 4, 25, 9, 'Winter 2024', 4, 'A'),
(50, 5, 25, 10, 'Fall 2023', 3, 'B'),
(51, 6, 26, 1, 'Spring 2024', 3.9, 'A'),
(52, 7, 26, 2, 'Fall 2023', 2.8, 'B-'),
(53, 8, 27, 3, 'Winter 2024', 3.5, 'B+'),
(54, 9, 27, 4, 'Fall 2023', 3.9, 'A-'),
(55, 10, 28, 5, 'Spring 2024', 4, 'A'),
(56, 11, 28, 6, 'Winter 2024', 3.3, 'B+'),
(57, 12, 29, 7, 'Fall 2023', 3.6, 'A-'),
(58, 13, 29, 8, 'Spring 2024', 3.8, 'A'),
(59, 14, 30, 9, 'Winter 2024', 3.1, 'B'),
(60, 15, 30, 10, 'Fall 2023', 4, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `email`, `address`, `dept_id`) VALUES
(1, 'Alice Johnson', 'alice.johnson@university.edu', '123 Maple St', 1),
(2, 'Bob Smith', 'bob.smith@university.edu', '456 Oak St', 1),
(3, 'Charlie Davis', 'charlie.davis@university.edu', '789 Pine St', 1),
(4, 'David Brown', 'david.brown@university.edu', '135 Elm St', 1),
(5, 'Eva Williams', 'eva.williams@university.edu', '246 Cedar St', 1),
(6, 'Frank Miller', 'frank.miller@university.edu', '357 Birch St', 1),
(7, 'Grace Lee', 'grace.lee@university.edu', '468 Walnut St', 1),
(8, 'Henry Moore', 'henry.moore@university.edu', '579 Spruce St', 1),
(9, 'Ivy Taylor', 'ivy.taylor@university.edu', '681 Willow St', 1),
(10, 'Jack Wilson', 'jack.wilson@university.edu', '792 Hickory St', 1),
(11, 'Kelly Clark', 'kelly.clark@university.edu', '153 Fir St', 2),
(12, 'Liam White', 'liam.white@university.edu', '264 Redwood St', 2),
(13, 'Mia Walker', 'mia.walker@university.edu', '375 Sequoia St', 2),
(14, 'Noah Hall', 'noah.hall@university.edu', '486 Dogwood St', 2),
(15, 'Olivia King', 'olivia.king@university.edu', '597 Cypress St', 2),
(16, 'Paul Scott', 'paul.scott@university.edu', '168 Magnolia St', 2),
(17, 'Quinn Young', 'quinn.young@university.edu', '279 Palm St', 2),
(18, 'Ruby Adams', 'ruby.adams@university.edu', '389 Chestnut St', 2),
(19, 'Sam Nelson', 'sam.nelson@university.edu', '491 Maplewood St', 2),
(20, 'Tina Parker', 'tina.parker@university.edu', '602 Juniper St', 2),
(21, 'Uma Carter', 'uma.carter@university.edu', '713 Aspen St', 3),
(22, 'Victor Perez', 'victor.perez@university.edu', '824 Poplar St', 3),
(23, 'Wendy Bailey', 'wendy.bailey@university.edu', '935 Olive St', 3),
(24, 'Xander Rivera', 'xander.rivera@university.edu', '124 Cherry St', 3),
(25, 'Yara Hughes', 'yara.hughes@university.edu', '235 Maple Ave', 3),
(26, 'Zane Ramirez', 'zane.ramirez@university.edu', '346 Sycamore St', 3),
(27, 'Bella Sanders', 'bella.sanders@university.edu', '457 Birchwood St', 3),
(28, 'Carter Flores', 'carter.flores@university.edu', '568 Alder St', 3),
(29, 'Diana Morris', 'diana.morris@university.edu', '679 Evergreen St', 3),
(30, 'Ethan Cooper', 'ethan.cooper@university.edu', '781 Hawthorn St', 3);

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credit` float DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name`, `credit`, `dept_id`) VALUES
(1, 'Data Structures', 4, 1),
(2, 'Algorithms', 3.5, 1),
(3, 'Database Systems', 4, 1),
(4, 'Linear Algebra', 3, 2),
(5, 'Calculus', 4, 2),
(6, 'Discrete Mathematics', 3.5, 2),
(7, 'Quantum Mechanics', 4, 3),
(8, 'Electrodynamics', 3.5, 3),
(9, 'Statistical Mechanics', 3.5, 3),
(10, 'Operating Systems', 4, 1),
(11, 'Machine Learning', 4, 1),
(12, 'Numerical Analysis', 3, 2),
(13, 'Topology', 3.5, 2),
(14, 'Classical Mechanics', 3, 3),
(15, 'General Relativity', 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `email`, `position`, `start_date`, `salary`, `dept_id`) VALUES
(1, 'John Doe', 'johndoe@university.edu', 'Professor', '2015-09-01', 80000, 1),
(2, 'Jane Smith', 'janesmith@university.edu', 'Assistant Professor', '2018-02-15', 65000, 1),
(3, 'Alice Brown', 'alicebrown@university.edu', 'Lecturer', '2020-08-20', 55000, 1),
(4, 'Bob Johnson', 'bobjohnson@university.edu', 'Professor', '2014-09-01', 85000, 2),
(5, 'Charlie Lee', 'charlielee@university.edu', 'Associate Professor', '2016-07-10', 72000, 2),
(6, 'David Green', 'davidgreen@university.edu', 'Lecturer', '2019-06-01', 56000, 2),
(7, 'Eva Turner', 'evaturner@university.edu', 'Professor', '2012-05-23', 88000, 3),
(8, 'Frank Harris', 'frankharris@university.edu', 'Associate Professor', '2017-01-12', 73000, 3),
(9, 'Grace White', 'gracewhite@university.edu', 'Lecturer', '2021-03-30', 57000, 3),
(10, 'Henry Martin', 'henrymartin@university.edu', 'Lecturer', '2020-10-22', 58000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'John Doe', 'john.doe@email.com', 'password123'),
(2, 'Jane Smith', 'jane.smith@email.com', 'securepass456'),
(3, 'Alice Johnson', 'alice.j@email.com', 'alicepass789'),
(4, 'Bob Brown', 'bob.brown@email.com', 'brownsafe101'),
(5, 'Charlie Davis', 'charlie.davis@email.com', 'charlie987'),
(6, 'David', 'david@aum.edu', '1234');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`),
  ADD CONSTRAINT `grades_ibfk_3` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
