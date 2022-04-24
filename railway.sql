-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2018 at 05:55 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `autoDecrementer` (IN `trainNo` INT)  BEGIN
update train set available_seats = available_seats-1 where train_no=trainNo;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `userid` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`userid`, `pass`) VALUES
('admin', 'pass'),
('sdlc', 'sdlc'),
('hello123', 'hello123'),
('hello', 'kitty'),
('devil', 'race'),
('ghost', 'rider'),
('root', 'root'),
('thanks', 'welcome');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `p_id` int(11) NOT NULL,
  `p_name` varchar(20) DEFAULT NULL,
  `p_gen` varchar(6) DEFAULT NULL,
  `p_age` int(11) DEFAULT NULL,
  `p_contactNo` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`p_id`, `p_name`, `p_gen`, `p_age`, `p_contactNo`) VALUES
(1001, 'Prath Bagul', 'male', 20, 9456647895),
(1002, 'Tejas Pagare', 'male', 20, 9546456569),
(1003, 'Atharva Tupe', 'male', 24, 8564848458),
(1004, 'Ninad Wagh', 'male', 37, 6464645639),
(1005, 'Hrishikesh Deshpande', 'male', 30, 9456544258),
(1006, 'Suraj Hadavle', 'male', 20, 8486464866),
(1007, 'Prasanna Salunkhe', 'male', 29, 9876997846),
(1008, 'Rani Kapoor', 'female', 26, 9546454895),
(1009, 'Pintu', 'male', 23, 8513315128),
(1010, 'Disha Adani', 'female', 20, 8748648742),
(1011, 'Illeana Dsouza', 'female', 56, 8467866124),
(1012, 'Payal Singh', 'female', 20, 95464564125),
(1013, 'Tanmay Singh', 'male', 28, 9789788423),
(1014, 'Mavi Harman', 'male', 32, 8994516412);

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `uniq_pass_id` int(11) NOT NULL,
  `pnr_no` int(11) NOT NULL,
  `train_no` int(11) DEFAULT NULL,
  `traveller_name` varchar(20) DEFAULT NULL,
  `traveller_idproof` varchar(15) DEFAULT NULL,
  `traveller_age` int(11) DEFAULT NULL,
  `final_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`uniq_pass_id`, `pnr_no`, `train_no`, `traveller_name`, `traveller_idproof`, `traveller_age`, `final_price`) VALUES
(1052, 1511530866, 200001, 'Rahul', '1256512213', 24, 1150),
(1064, 1511534397, 100001, 'Rohan', '3122134566', 32, 2300),
(1065, 1511534397, 100001, 'Shubham', '6449514654', 20, 2300),
(1066, 1511534397, 100001, 'Ishan', '1398131312', 23, 2300),
(1067, 1511534565, 600001, 'Sakshi', '6547895656', 23, 2300),
(1068, 1511534565, 600001, 'Prerna', '7186373181', 20, 2300),
(1069, 1511534614, 600002, 'Rohit', '8979878965', 23, 2645),
(1070, 1511534681, 500002, 'Rishab', '1398019077', 45, 1725),
(1071, 1511534757, 700001, 'Janhvi', '7989466009', 40, 575),
(1072, 1511534757, 700001, 'Sarah', '1389713783', 20, 575),
(1073, 1511534932, 800001, 'Aamir', '6217636668', 23, 3450),
(1074, 1511534932, 800001, 'Joy', '1378138379', 20, 3450),
(1075, 1511535020, 300001, 'Muhammad', '6878620001', 54, 3450),
(1076, 1511535076, 200001, 'Munawar', '6437286855', 20, 1150),
(1077, 1511535230, 500001, 'Rehan', '1738819379', 20, 2875),
(1078, 1511535230, 500001, 'Ben', '1327987555', 20, 2875),
(1079, 1511535230, 500001, 'Payal', '6762873744', 21, 2875),
(1080, 1511535310, 600001, 'Gogi', '1398787378', 20, 2300),
(1081, 1511535310, 600001, 'Goli', '3161873831', 45, 2300),
(1082, 1511535441, 100002, 'Tapu', '1673818355', 56, 3795),
(1083, 1511535441, 100002, 'Pinku', '4526984769', 24, 3795),
(1085, 1512464851, 100002, 'Sonu', '123245286', 22, 3795);

--
-- Triggers `ticket`
--
DELIMITER $$
CREATE TRIGGER `autoIncTrigg` AFTER DELETE ON `ticket` FOR EACH ROW BEGIN
update train set available_seats = available_seats+1 where train_no=OLD.train_no;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `train_no` int(11) NOT NULL,
  `train_name` varchar(20) DEFAULT NULL,
  `total_Seats` int(11) DEFAULT NULL,
  `available_seats` int(11) DEFAULT NULL,
  `baseFare` int(11) DEFAULT NULL,
  `arriv_time` time DEFAULT NULL,
  `depr_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`train_no`, `train_name`, `total_Seats`, `available_seats`, `baseFare`, `arriv_time`, `depr_time`) VALUES
(100001, 'Rajdhani Express', 60, 57, 2000, '04:00:00', '04:05:00'),
(100002, 'Maharaja Express', 60, 57, 3300, '06:30:00', '09:00:00'),
(200001, 'Himsagar Express', 60, 58, 1000, '05:30:00', '04:05:00'),
(300001, 'Avantika Express', 60, 58, 3000, '14:10:00', '14:50:00'),
(400001, 'Bangalore Express', 60, 60, 5000, '12:45:00', '13:15:00'),
(500001, 'Golden Chariot', 60, 57, 2500, '09:22:00', '09:28:00'),
(500002, 'Deccan Odyssey', 60, 59, 1500, '12:30:00', '13:05:00'),
(600001, 'Maitree Express', 60, 56, 2000, '19:40:00', '04:05:00'),
(600002, 'Island Express', 60, 59, 2300, '15:27:00', '18:12:00'),
(700001, 'Sealdah Express', 60, 58, 500, '22:20:00', '22:40:00'),
(800001, 'Howrah Rajdhani', 60, 58, 3000, '00:00:00', '01:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `train_betwn_stations`
--

CREATE TABLE `train_betwn_stations` (
  `train_no` int(11) NOT NULL,
  `source_st` varchar(10) NOT NULL,
  `dest_st` varchar(10) NOT NULL,
  `train_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `train_betwn_stations`
--

INSERT INTO `train_betwn_stations` (`train_no`, `source_st`, `dest_st`, `train_name`) VALUES
(100001, 'BLR', 'NZM', 'Rajdhani Express'),
(100002, 'blr', 'nzm', 'Avantika Express'),
(200001, 'NZM', 'GUJ', 'Maharaja Express'),
(300001, 'cstm', 'blr', 'Golden Chariot'),
(400001, 'blr', 'maa', 'Bangalore Expressp'),
(500001, 'nzm', 'lko', 'Himsagar Express'),
(500002, 'lko', 'nzm', 'Maitree Express'),
(600001, 'jat', 'cape', 'Deccan Odyssey'),
(600002, 'cape', 'jat', 'Island Rajdhani'),
(700001, 'hwh', 'jp', 'Sealdah Express'),
(800001, 'guj', 'hwh', 'Howrah Rajdhani');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`uniq_pass_id`),
  ADD KEY `train_no` (`train_no`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`train_no`);

--
-- Indexes for table `train_betwn_stations`
--
ALTER TABLE `train_betwn_stations`
  ADD PRIMARY KEY (`train_no`,`train_name`),
  ADD KEY `train_no` (`train_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `uniq_pass_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1086;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `train_betwn_stations`
--
ALTER TABLE `train_betwn_stations`
  ADD CONSTRAINT `train_betwn_stations_ibfk_1` FOREIGN KEY (`train_no`) REFERENCES `train` (`train_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
