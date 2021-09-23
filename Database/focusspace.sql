-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 04:58 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `focusspace`
--

-- --------------------------------------------------------

--
-- Table structure for table `abhijeet`
--

CREATE TABLE `abhijeet` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `abhijeet`
--

INSERT INTO `abhijeet` (`sid`, `sname`, `frequest`, `Accept_denial`) VALUES
(1, 'abhijeet', 'dev12', 0),
(2, 'abhijeet', 'raj12', 1),
(3, 'abhijeet', 'rit678', 1),
(4, 'abhijeet', 'ku234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ak678`
--

CREATE TABLE `ak678` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `dev12`
--

CREATE TABLE `dev12` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dev12`
--

INSERT INTO `dev12` (`sid`, `sname`, `frequest`, `Accept_denial`) VALUES
(1, 'dev12', 'abhijeet', 0),
(2, 'dev12', 'ak678', 1),
(3, 'dev12', 'kamli245', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kamli245`
--

CREATE TABLE `kamli245` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamli245`
--

INSERT INTO `kamli245` (`sid`, `sname`, `frequest`, `Accept_denial`) VALUES
(1, 'kamli245', 'dev12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ku234`
--

CREATE TABLE `ku234` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `uname` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`uname`, `pass`) VALUES
('dev12', 'ka1234'),
('raj12', 'rj298'),
('abhijeet', '12345'),
('nand98', '9887'),
('neesh23', '12098'),
('ak678', '12021'),
('kamli245', '98765'),
('san123', 'yu765t'),
('ku234', 'mnbvc'),
('rit678', 'asewqa');

-- --------------------------------------------------------

--
-- Table structure for table `nand98`
--

CREATE TABLE `nand98` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nand98`
--

INSERT INTO `nand98` (`sid`, `sname`, `frequest`, `Accept_denial`) VALUES
(1, 'nand98', 'neesh23', 0);

-- --------------------------------------------------------

--
-- Table structure for table `neesh23`
--

CREATE TABLE `neesh23` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `neesh23`
--

INSERT INTO `neesh23` (`sid`, `sname`, `frequest`, `Accept_denial`) VALUES
(1, 'neesh23', 'nand98', 0);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `sid` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `request_from` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`sid`, `username`, `request_from`) VALUES
(5, 'rit678', 'abhijeet'),
(6, 'ku234', 'abhijeet');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `new_post` varchar(100) DEFAULT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`fname`, `lname`, `uname`, `new_post`, `post_id`) VALUES
('abhijeet', 'singh', 'abhijeet', 'You can choose courage or you can choose comfort,but you can\'t choose both...', 2),
('devesh', 'kumar', 'dev12', 'Its high time to show your zeal to reach what you want', 5),
('Rajneesh', 'rajan', 'neesh23', 'Wo karo jo satya hai duniya se mat daro', 6),
('abhijeet', 'singh', 'abhijeet', 'mein hu gumsum to bhi khamosh hai sach hai samaye ka he sub dosh hai', 7),
('devesh', 'kumar', 'dev12', 'TIday i have a sandwich as my breakfast', 9);

-- --------------------------------------------------------

--
-- Table structure for table `raj12`
--

CREATE TABLE `raj12` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rit678`
--

CREATE TABLE `rit678` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `san123`
--

CREATE TABLE `san123` (
  `sid` int(11) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `frequest` varchar(20) DEFAULT NULL,
  `Accept_denial` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `firstname` varchar(20) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `uname` varchar(20) DEFAULT NULL,
  `passwd` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`firstname`, `lastname`, `uname`, `passwd`) VALUES
('abhijeet', 'singh', 'abhijeet', '12345'),
('devesh', 'kumar', 'dev12', 'ka1234'),
('rajesh', 'karam', 'raj12', 'rj298'),
('Anand', 'Kumar', 'nand98', '9887'),
('Rajneesh', 'rajan', 'neesh23', '12098'),
('akaran', 'singh', 'ak678', '12021'),
('Kamlesh', 'tyagi', 'kamli245', '98765'),
('Roshan', 'Bharadwaj', 'san123', 'yu765t'),
('Kabir', 'kushal', 'ku234', 'mnbvc'),
('Hritik', 'Iarani', 'rit678', 'asewqa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abhijeet`
--
ALTER TABLE `abhijeet`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `ak678`
--
ALTER TABLE `ak678`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `dev12`
--
ALTER TABLE `dev12`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `kamli245`
--
ALTER TABLE `kamli245`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `ku234`
--
ALTER TABLE `ku234`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `nand98`
--
ALTER TABLE `nand98`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `neesh23`
--
ALTER TABLE `neesh23`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `raj12`
--
ALTER TABLE `raj12`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `rit678`
--
ALTER TABLE `rit678`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `san123`
--
ALTER TABLE `san123`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abhijeet`
--
ALTER TABLE `abhijeet`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ak678`
--
ALTER TABLE `ak678`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dev12`
--
ALTER TABLE `dev12`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kamli245`
--
ALTER TABLE `kamli245`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ku234`
--
ALTER TABLE `ku234`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nand98`
--
ALTER TABLE `nand98`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `neesh23`
--
ALTER TABLE `neesh23`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `raj12`
--
ALTER TABLE `raj12`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rit678`
--
ALTER TABLE `rit678`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `san123`
--
ALTER TABLE `san123`
  MODIFY `sid` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
