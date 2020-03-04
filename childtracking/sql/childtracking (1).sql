-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2019 at 09:28 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `childtracking`
--

-- --------------------------------------------------------

--
-- Table structure for table `call_data`
--

CREATE TABLE IF NOT EXISTS `call_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) NOT NULL,
  `calltype` varchar(20) NOT NULL,
  `number` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `call_data`
--

INSERT INTO `call_data` (`id`, `imei`, `calltype`, `number`, `date`) VALUES
(4, '864558040157556', 'OUTGOING', '+917025468792', '2019/03/01 11:46:35'),
(5, '861194049834947', 'INCOMING', '+918086204028', '2019/03/01 11:46:41'),
(6, '861194049834947', 'INCOMING', '+918086204028', '2019/03/01 11:46:41');

-- --------------------------------------------------------

--
-- Table structure for table `child_registration`
--

CREATE TABLE IF NOT EXISTS `child_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `imei` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `child_registration`
--

INSERT INTO `child_registration` (`id`, `name`, `username`, `password`, `imei`) VALUES
(1, 'Arun Krishnan', 'rzr', 'test', '864558040157556'),
(2, 'Neethmol', 'neethu', 'neethu', '861194049834947'),
(3, 'Manuja S', 'smanuja', 'manuja', 'ut65hg67hg65g'),
(4, 'Vishnu', 'student1', 'vishnu', 'jyt65jhg87jh78'),
(5, 'anu', 'anu', 'anu', '876rd4224dgt'),
(6, 'jhgjfhgbf', 'anu', '123', 'ut65hg67hg65g'),
(7, 'Vishnu', 'student1', '123', '5jh76d427g4'),
(8, 'Vishnu', 'student1', '1234', 'jyt65jhg87jh78');

-- --------------------------------------------------------

--
-- Table structure for table `location_tracking`
--

CREATE TABLE IF NOT EXISTS `location_tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `area` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `location_tracking`
--

INSERT INTO `location_tracking` (`id`, `imei`, `latitude`, `longitude`, `area`) VALUES
(1, '864558040157556', '10.0049324', '76.3062536', 'Palarivattom'),
(2, '861194049834947', '10.0049238', '76.3062308', 'Palarivattom');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) NOT NULL,
  `message` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `imei`, `message`) VALUES
(1, '864558040157556', 'aaaaaaaaaa'),
(2, '864558040157556', 'aaaaaabbbb'),
(3, '864558040157556', 'aaaaaaaaaassssssss'),
(4, '864558040157556', 'aaaaaabbbbccc');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `address`, `phone`, `email`, `username`, `password`) VALUES
(1, 'Arun', 'CC 8/967, RG Pai Road, Pandikudy, Kochi-2', '8086204028', 'arunkrishnan453@gmail.com', 'rzr', 'test'),
(3, 'Manuja S', 'pathanamthitta', '8139003825', 'smanuja898@gmail.com', 'admin', 'gdf'),
(4, 'Vishnu', 'adoor', '8139003825', 'abhijithvishnu648@gmail.com', 'student1', 's'),
(5, 'jhgjfhgbf', 'adoor', '8139003825', 'abhijithvishnu648@gmail.com', 'admin', 'gdf'),
(6, 'jhgjfhgbf', 'adoor', '8139003825', 'abhijithvishnu648@gmail.com', 'admin', 'gdf'),
(7, 'jhgjfhgbf', 'adoor', '8139003825', 'abhijithvishnu648@gmail.com', 'admin', 'gdf'),
(9, 'Vishnu', 'adoor', '8139003825', 'abhijithvishnu648@gmail.com', 'admin', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `sms_data`
--

CREATE TABLE IF NOT EXISTS `sms_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=198 ;

--
-- Dumping data for table `sms_data`
--

INSERT INTO `sms_data` (`id`, `imei`, `number`, `body`) VALUES
(1, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.129.00 on 24-02-19 and credited to SWIGGY8@ybl-SWIGGY(UPI Ref no 905576238457).'),
(2, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.25.00 on 24-02-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 905514546117).'),
(3, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.129.00 on 24-02-19 and credited to SWIGGY8@ybl-SWIGGY(UPI Ref no 905576238457).'),
(4, '864558040157556', 'HP-KSEBIT', 'Dear ALEXANDER.D.NETTO,\r\n\r\nyour complaint with complaint id : 33112604349 has been Rectified.\r\n\r\nComplaint Number : 33112604349\r\n\r\n\r\nInformation To Consumer : Thank you for using KSEB Customer Care Services.\r\n\r\n\r\n\r\n\r\n'),
(5, '864558040157556', '+918590837757', 'Da oru funla cal u bk'),
(6, '864558040157556', 'VT-VFCARE', 'Data Alert! You have used 50% of your 3G/4G internet pack and have 767.63 MB left. Check your usage on MyVodafone App (www.vodafone.in/j1) or dial *111*2*2#'),
(7, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.25.00 on 24-02-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 905514546117).'),
(8, '864558040157556', 'VT-VFCARE', 'Data Alert! You have used 50% of your 3G/4G internet pack and have 767.63 MB left. Check your usage on MyVodafone App (www.vodafone.in/j1) or dial *111*2*2#'),
(10, '864558040157556', 'vf-vfcare', 'Hi, your complaint dated 22-Feb-2019 12:15:35 PM with Reference No.4-27537572808 has been registered. We assure resolution by 26-Feb-2019 12:21:56 PM. Happy to help!');

-- --------------------------------------------------------

--
-- Table structure for table `sound_profile`
--

CREATE TABLE IF NOT EXISTS `sound_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(50) NOT NULL,
  `profile` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sound_profile`
--

INSERT INTO `sound_profile` (`id`, `imei`, `profile`) VALUES
(1, '864558040157556', 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
