-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2019 at 05:48 AM
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
(1, '864558040157556', 'INCOMING', '', '2019/03/01 10:33:50'),
(2, '864558040157556', 'INCOMING', '', '2019/03/01 10:33:50'),
(3, '864558040157556', 'INCOMING', '', '2019/03/01 11:01:11'),
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `child_registration`
--

INSERT INTO `child_registration` (`id`, `name`, `username`, `password`, `imei`) VALUES
(1, 'Arun Krishnan', 'rzr', 'test', '864558040157556'),
(2, 'Neethmol', 'neethu', 'neethu', '861194049834947');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `name`, `address`, `phone`, `email`, `username`, `password`) VALUES
(1, 'Arun', 'CC 8/967, RG Pai Road, Pandikudy, Kochi-2', '8086204028', 'arunkrishnan453@gmail.com', 'rzr', 'test');

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
(9, '864558040157556', 'HP-KSEBIT', '\r\n\r\nDear  ALEXANDER.D.NETTO,\r\n\r\nThe following NO POWER SUPPLY complaint from ALEXANDER.D.NETTO has been registered.\r\n\r\nComplaint Number : 33112604349\r\n\r\n 1155644018463\r\n\r\n\r\n'),
(10, '864558040157556', 'vf-vfcare', 'Hi, your complaint dated 22-Feb-2019 12:15:35 PM with Reference No.4-27537572808 has been registered. We assure resolution by 26-Feb-2019 12:21:56 PM. Happy to help!'),
(11, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(12, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.15.00 on 20-02-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 905117959190).'),
(13, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order no. #33738105623 for Rs. 190 is expected to arrive in the next 58 mins. Track your order here: http://swig.gy/4G2841'),
(14, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.500.00 on 21-02-19 and credited to razal2@ybl-RAZAL C(UPI Ref no 905213847958).'),
(15, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order no. #34093285192 for Rs. 147 is expected to arrive in the next 35 mins. Track your order here: http://swig.gy/KBYPIH'),
(16, '864558040157556', 'VT-VFCARE', 'Hi, your internet pack is valid for another 3 days and will end on 18.02.2019 23:59:59.Buy a data pack from MyVodafone App (www.vodafone.in/j3) or dial *111*2*2#'),
(17, '864558040157556', 'VK-SWIGGY', 'Payment Alert : Your payment for order #34093249439 was not completed. Any amount if debited from your bank/card account will be refunded in 2-4 days.'),
(18, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order no. #34093285192 for Rs. 147 is expected to arrive in the next 35 mins. Track your order here: http://swig.gy/KBYPIH'),
(19, '864558040157556', 'VM-SWIGGY', 'Payment Alert : Your payment for order #34093249439 was not completed. Any amount if debited from your bank/card account will be refunded in 2-4 days.'),
(20, '864558040157556', 'VK-VFCARE', 'Congratulations!Your Unlimited Pack is active.Special Offer Rs 49=1GB for 28 days or Rs98=3GB for 28 days.To know more offers Dial *121#'),
(21, '864558040157556', 'VM-VFCARE', 'Hello! Special Bonus Recharge of Rs.199 on 19/02/19 is successful.Benefits of this recharge will be sent to you shortly.'),
(22, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(23, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.129.00 on 24-02-19 and credited to SWIGGY8@ybl-SWIGGY(UPI Ref no 905576238457).'),
(24, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(25, '864558040157556', '+918606558593', 'Njn kakknad'),
(26, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order no. #33738105623 for Rs. 190 is expected to arrive in the next 58 mins. Track your order here: http://swig.gy/4G2841'),
(27, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.500.00 on 21-02-19 sent by 7025468792@ybl-NEETHU SURENDRAN(UPI Ref no 905226894467).'),
(28, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.500.00 on 21-02-19 and credited to 7025468792@ybl-NEETHU SURENDRAN(UPI Ref no 905252420206).'),
(29, '864558040157556', 'HP-KSEBIT', '\r\n\r\nDear  ALEXANDER.D.NETTO,\r\n\r\nThe following NO POWER SUPPLY complaint from ALEXANDER.D.NETTO has been registered.\r\n\r\nComplaint Number : 33112604349\r\n\r\n 1155644018463\r\n\r\n\r\n'),
(30, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.1.00 on 20-02-19 sent by 7025468792@ybl-NEETHU SURENDRAN(UPI Ref no 905144273456).'),
(31, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.500.00 on 21-02-19 and credited to razal2@ybl-RAZAL C(UPI Ref no 905213847958).'),
(32, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is debited by Rs.500.00 on 21-02-19 and credited to 7025468792@ybl-NEETHU SURENDRAN(UPI Ref no 905252420206).'),
(33, '864558040157556', 'VK-VFCARE', 'Congrats! On Rs199 offer activated, Enjoy Data 1.5GB/day +100 SMS/day + UL Calls (Loc+STD), in national roaming also,Validity-28days. Vodafone!'),
(34, '864558040157556', 'VK-SWIGGY', 'Payment Alert : Your payment for order #34093137086 was not completed. Any amount if debited from your bank/card account will be refunded in 2-4 days.'),
(35, '864558040157556', '+918606558593', '9074460875'),
(36, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order no. #34093285192 for Rs. 147 is expected to arrive in the next 35 mins. Track your order here: http://swig.gy/KBYPIH'),
(37, '864558040157556', '+918590837757', 'Da oru funla cal u bk'),
(38, '864558040157556', '+918606558593', 'Njan ivide kaanum'),
(39, '864558040157556', '+918606558593', 'Njan ivide kaanum'),
(40, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(41, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(42, '864558040157556', '+918606558593', 'Njan ivide kaanum'),
(43, '864558040157556', '+918606558593', 'Mmm'),
(44, '864558040157556', 'VM-VFCARE', 'Hello! Special Bonus Recharge of Rs.199 on 19/02/19 is successful.Benefits of this recharge will be sent to you shortly.'),
(45, '864558040157556', 'VT-VFCARE', 'Hello, the validity of your internet pack has expired. You can still browse at 4p/10Kb or buy a Datapack & Save. Dial *444# or click (www.vodafone.in/r5)'),
(46, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(47, '864558040157556', 'VL-VFCARE', 'Your UNLIMITED Free Offer have Expired! Recharge with Rs.255 to continue enjoying Unlimited Free All India Calls & 2GB Data Daily for 28Days'),
(48, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.500.00 on 19-02-19 sent by neethusure11@oksbi-NEETHU SURENDRAN(UPI Ref no 905014578774).'),
(49, '864558040157556', 'VK-FCHRGE', '0329 is your OTP to login to your FreeCharge Account'),
(50, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(51, '864558040157556', 'Vodafone', 'Hello, service validity is over for your number. Outgoing voice/data services have been discontinued. Recharge with an Unlimited/Combo pack to restore services'),
(52, '864558040157556', 'VL-VFCARE', 'Your UNLIMITED Free Offer have Expired! Recharge with Rs.255 to continue enjoying Unlimited Free All India Calls & 2GB Data Daily for 28Days'),
(53, '864558040157556', 'VM-VFCARE', 'Hello! Special Bonus Recharge of Rs.199 on 19/02/19 is successful.Benefits of this recharge will be sent to you shortly.'),
(54, '864558040157556', 'VK-ASIANT', 'Dear Customer(CN39065), Pls Pay your Asianet Broadband bill of Rs.943 NOW to avoid Late fee charges.Click goo.gl/s341ET to pay ONLINE. Pls ignore if paid.'),
(55, '864558040157556', 'VT-VFCARE', 'Hello, the validity of your internet pack has expired. You can still browse at 4p/10Kb or buy a Datapack & Save. Dial *444# or click (www.vodafone.in/r5)'),
(56, '864558040157556', 'VK-SWIGGY', 'Woah! Your Swiggy order #32602518434 was delivered lightning fast in under 30 mins! Bon Appetit! Issues? Reach out to us at swig.gy/u/help'),
(57, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(58, '864558040157556', 'MD-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.200.00 on 07-02-19 sent by neethusure11@oksbi-NEETHU SURENDRAN(UPI Ref no 903813858999).'),
(59, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(60, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(61, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order #32267741708 was delivered under 30 mins! Sign up for Swiggy SUPER & get unlimited free deliveries!'),
(62, '864558040157556', '+918606558593', 'Eppa irangum'),
(63, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(64, '864558040157556', 'VK-SWIGGY', 'Woah! Your Swiggy order #32602518434 was delivered lightning fast in under 30 mins! Bon Appetit! Issues? Reach out to us at swig.gy/u/help'),
(65, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(66, '864558040157556', 'MD-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.33.00 on 07-02-19 sent by neethusure11@oksbi-NEETHU SURENDRAN(UPI Ref no 903813872257).'),
(67, '864558040157556', 'MD-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.200.00 on 07-02-19 sent by neethusure11@oksbi-NEETHU SURENDRAN(UPI Ref no 903813858999).'),
(68, '864558040157556', 'VL-VFCARE', 'Hello, Your All India Free Call offer will expire on2019-02-19 00:00:00.Please dial *121# or log on to MyVodafone App www.vodafone.in/kl1 for more offers.'),
(69, '864558040157556', 'VK-SWIGGY', 'Your Swiggy order #32267741708 was delivered under 30 mins! Sign up for Swiggy SUPER & get unlimited free deliveries!'),
(70, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(71, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(72, '864558040157556', '+918606558593', 'Mmm'),
(73, '864558040157556', '+918606558593', 'Mmm'),
(74, '864558040157556', 'VK-ASIANT', '[Sub Code:CN39065]:Dear  subscriber, Your complaint has been resolved as per our records.Call Customer Care for further support. Your Ticket No :CN1497416'),
(75, '864558040157556', 'VK-ASIANT', '[Sub Code:CN39065], Happy Code:114932 has been generated for  Your Ticket No :CN1497416'),
(76, '864558040157556', '+918590837757', 'Da veed athy njn ipa pubg keeriiii...\nNe varumba vlk'),
(77, '864558040157556', '50351', 'Your Uber code: 5187. Reply STOP to 091675 00110 to unsubscribe.'),
(78, '864558040157556', 'BT-ALBANK', 'Your A/c XXXXXXX6753 is debited through ATM Card by Rs. 100 Total Bal : Rs. 4.68 CR  Clr Bal : Rs. 4.68 CR 31/01/2019 -- 31/01/19 16:18 - ALB '),
(79, '864558040157556', '50351', 'Your Uber code: 5187. Reply STOP to 091675 00110 to unsubscribe.'),
(80, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(81, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(82, '864558040157556', 'VK-ASIANT', '[Sub Code:CN39065]:Dear  subscriber, Your complaint has been resolved as per our records.Call Customer Care for further support. Your Ticket No :CN1497416'),
(83, '864558040157556', 'VT-VFCARE', 'Hi, your internet pack is valid for another 3 days and will end on 18.02.2019 23:59:59.Buy a data pack from MyVodafone App (www.vodafone.in/j3) or dial *111*2*2#'),
(84, '864558040157556', 'HP-LSKART', 'Hi Arun, Rs.2400 credited to your LENSKART account + Buy1Get1 for gold members.\nDownload app lenskt.in/p20 to claim, t&c apply\nStore: lenskt.in/o20'),
(85, '864558040157556', 'VK-ASIANT', 'ABB password of your subcode ( CN39065 ) has been changed successfully'),
(86, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(87, '864558040157556', 'VK-ASIANT', 'ABB password of your subcode ( CN39065 ) has been changed successfully'),
(88, '864558040157556', 'HP-ASIANT', 'Dear Asianet Broadband Customer (CN39065), Due to a network upgradation activity TODAY 12th Feb @ 11 pm, you may experience interruption in broadband services in your area. Kindly bear with us.'),
(89, '864558040157556', 'VK-ASIANT', 'ABB password of your subcode ( CN39065 ) has been changed successfully'),
(90, '864558040157556', 'VL-VFCARE', 'Congrats. Rs.35 Recharge Successful. Enjoy TT 26 & 100 MB 4G/3G/2G valid for 28 Days.'),
(91, '864558040157556', 'MD-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.100.00 on 31-01-19 sent by subrufaf2-1@okaxis-KS Subramanian(UPI Ref no 903116013743).'),
(92, '864558040157556', 'VK-SWIGGY', 'Woah! Your Swiggy order #33032465208 was delivered lightning fast in under 30 mins! Bon Appetit! Issues? Reach out to us at swig.gy/u/help'),
(93, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(94, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(95, '864558040157556', 'VK-SWIGGY', 'Woah! Your Swiggy order #33032465208 was delivered lightning fast in under 30 mins! Bon Appetit! Issues? Reach out to us at swig.gy/u/help'),
(96, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(97, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(98, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(99, '864558040157556', '50351', 'Your Uber code: 5187. Reply STOP to 091675 00110 to unsubscribe.'),
(100, '864558040157556', 'AD-LENKRT', 'Rs. 2600 credited to your LENSKART account + Buy1Get1 on REPUBLIC DAY for gold members.\nDownload app lenskt.in/p2 to claim, t&c apply\nVisit Store: lenskt.in/o2'),
(101, '864558040157556', 'VK-ASIANT', 'ABB password of your subcode ( CN39065 ) has been changed successfully'),
(102, '864558040157556', 'IL-MHACIS', 'Visit Ministry of Home Affairs twitter handle?cyberdost to get regular cybercrime safety tips.'),
(103, '864558040157556', 'VK-SWIGGY', 'Woah! Your Swiggy order #33032465208 was delivered lightning fast in under 30 mins! Bon Appetit! Issues? Reach out to us at swig.gy/u/help'),
(104, '864558040157556', 'VM-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(105, '864558040157556', 'VL-VFCARE', 'Congrats. Rs.35 Recharge Successful. Enjoy TT 26 & 100 MB 4G/3G/2G valid for 28 Days.'),
(106, '864558040157556', 'IL-MHACIS', 'Visit Ministry of Home Affairs twitter handle?cyberdost to get regular cybercrime safety tips.'),
(107, '864558040157556', '51466', 'Rs 11.00 has been added to Amazon Pay balance. Total Amazon Pay balance is Rs  37.34. View Statement - https://www.amazon.in/gp/payment/statement'),
(108, '864558040157556', 'VK-FCHRGE', '0329 is your OTP to login to your FreeCharge Account'),
(109, '864558040157556', '51466', 'Rs 11.00 has been added to Amazon Pay balance. Total Amazon Pay balance is Rs  37.34. View Statement - https://www.amazon.in/gp/payment/statement'),
(110, '864558040157556', '51466', 'Rs 11.00 has been added to Amazon Pay balance. Total Amazon Pay balance is Rs  37.34. View Statement - https://www.amazon.in/gp/payment/statement'),
(111, '864558040157556', 'VT-VFCARE', 'Hello, your 100.00 MB 3G/4G data pack is now active and valid till 18.02.2019 23:59:59 hrs. Watch movies & live TV on Vodafone Play http://bit.ly/2lR3DXQ'),
(112, '864558040157556', '+919388405305', 'Sir your vehicle work done. Pls called it. Total bill amount RS.6080-3000=balance RS.3080.'),
(113, '864558040157556', 'VL-VFCARE', 'Congrats. Rs.35 Recharge Successful. Enjoy TT 26 & 100 MB 4G/3G/2G valid for 28 Days.'),
(114, '864558040157556', '+919388405305', 'Sir your vehicle work done. Pls called it. Total bill amount RS.6080-3000=balance RS.3080.'),
(115, '864558040157556', 'VK-ASIANT', 'Dear:CN39065 ,Your TicketNo CN1477415 has been closed...By our technical team.Your feedback is valuable to us..please click https://ascl.in/KX8Mp'),
(116, '864558040157556', 'VK-FCHRGE', '0329 is your OTP to login to your FreeCharge Account'),
(117, '864558040157556', 'BT-ALBANK', 'Your A/c XXXXXXX6753 is debited through ATM by Rs. 4,100 Total Bal : Rs. 4.68 CR  Clr Bal : Rs. 4.68 CR 19/01/2019 -- 19/01/19 15:41 - ALB '),
(118, '864558040157556', '+919388405305', 'Sir your vehicle work done. Pls called it. Total bill amount RS.6080-3000=balance RS.3080.'),
(119, '864558040157556', 'BV-ALBANK', 'Your A/c XXXXXXX6753 is debited through ATM Card by Rs. 626 Total Bal : Rs. 4,104.68 CR  Clr Bal : Rs. 4,104.68 CR 19/01/2019 -- 19/01/19 15:30 - ALB '),
(120, '864558040157556', '+919388405305', 'Pls call me . Siva Automobiles 9388405305'),
(121, '864558040157556', 'BT-ALBANK', 'Your A/c XXXXXXX6753 is debited through ATM by Rs. 4,100 Total Bal : Rs. 4.68 CR  Clr Bal : Rs. 4.68 CR 19/01/2019 -- 19/01/19 15:41 - ALB '),
(122, '864558040157556', 'IL-VFCARE', 'ALWAYS follow Traffic Rules, Save Life. Good road manner marks a Good Citizen - MVD Kerala in association with Vodafone Idea'),
(123, '864558040157556', 'VT-VFCARE', 'Dear customer, as you are not active on any data pack, dial *121# to see and buy a data pack of your choice.'),
(124, '864558040157556', 'VK-VFCARE', 'Success! A Chota Credit of Rs5 is added to your balance. Rs5 plus a service charge of Rs 1 will be deducted from your next recharge. Please recharge soon.'),
(125, '864558040157556', 'AX-KSEBIT', '\r\n\r\nDear  ALEXANDER.D.NETTO,\r\n\r\nThe following NO POWER SUPPLY complaint from ALEXANDER.D.NETTO has been registered.\r\n\r\nComplaint Number : 33112594068\r\n\r\n 1155644018463\r\n\r\n\r\n'),
(126, '864558040157556', 'AX-KSEBIT', '\r\n\r\nDear  ALEXANDER.D.NETTO,\r\n\r\nThe following NO POWER SUPPLY complaint from ALEXANDER.D.NETTO has been registered.\r\n\r\nComplaint Number : 33112594068\r\n\r\n 1155644018463\r\n\r\n\r\n'),
(127, '864558040157556', 'AX-KSEBIT', '\r\n\r\nDear  ALEXANDER.D.NETTO,\r\n\r\nThe following NO POWER SUPPLY complaint from ALEXANDER.D.NETTO has been registered.\r\n\r\nComplaint Number : 33112592890\r\n\r\n 1155644018463\r\n\r\n\r\n'),
(128, '864558040157556', '51466', 'Your payment on Amazon.in for Rs. 35.00 using Amazon Pay balance is successful. Your balance is now Rs. 15.84. View Statement: https://www.amazon.in/vs'),
(129, '864558040157556', 'VK-FCHRGE', '0329 is your OTP to login to your FreeCharge Account'),
(130, '864558040157556', '56161940', 'Your Uber code: 0248. Reply STOP to 091675 00110 to unsubscribe.'),
(131, '864558040157556', 'VK-ASIANT', 'Dear:KRISHNAN EN,Your Broadband Subscription ID CN39065 reads a overdue debit balance of Rs.1830.72 in our books of account. If you agree to pay or have any grievance and need any clarification on the due amount - please click the link below.If not done we would confirm the dues as payable by you and expect you to clear the same soon.https://ascl.in/3idK7 Incase, this message has been wrongly delivered also, requesting you to please click the link and update the remarks.Please ignore, if the dues has already been cleared by you. However an update would be appreciated in the remarks column.'),
(132, '864558040157556', 'VK-ASIANT', 'Dear:KRISHNAN EN,Your Broadband Subscription ID CN39065 reads a overdue debit balance of Rs.1830.72 in our books of account. If you agree to pay or have any grievance and need any clarification on the due amount - please click the link below.If not done we would confirm the dues as payable by you and expect you to clear the same soon.https://ascl.in/3idK7 Incase, this message has been wrongly delivered also, requesting you to please click the link and update the remarks.Please ignore, if the dues has already been cleared by you. However an update would be appreciated in the remarks column.'),
(133, '864558040157556', 'VK-ASIANT', 'Dear:KRISHNAN EN,Your Broadband Subscription ID CN39065 reads a overdue debit balance of Rs.1830.72 in our books of account. If you agree to pay or have any grievance and need any clarification on the due amount - please click the link below.If not done we would confirm the dues as payable by you and expect you to clear the same soon.https://ascl.in/3idK7 Incase, this message has been wrongly delivered also, requesting you to please click the link and update the remarks.Please ignore, if the dues has already been cleared by you. However an update would be appreciated in the remarks column.'),
(134, '864558040157556', '51466', 'Your payment on Amazon.in for Rs. 35.00 using Amazon Pay balance is successful. Your balance is now Rs. 15.84. View Statement: https://www.amazon.in/vs'),
(135, '864558040157556', 'VK-ASIANT', 'Dear:KRISHNAN EN,Your Broadband Subscription ID CN39065 reads a overdue debit balance of Rs.1830.72 in our books of account. If you agree to pay or have any grievance and need any clarification on the due amount - please click the link below.If not done we would confirm the dues as payable by you and expect you to clear the same soon.https://ascl.in/3idK7 Incase, this message has been wrongly delivered also, requesting you to please click the link and update the remarks.Please ignore, if the dues has already been cleared by you. However an update would be appreciated in the remarks column.'),
(136, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(137, '864558040157556', '51466', 'Cashback of Rs 10.50 for Recharges and Bill payments offer. added to your Amazon Pay balance. Total balance: Rs 26.34. Statement: https://www.amazon.in/vs'),
(138, '864558040157556', '51466', 'Thank you for recharging 8086204028 for Rs 35.00 on Amazon.in. If eligible, cash back will be credited within 72 hours. https://amzn.in/d/f3OLoI7'),
(139, '864558040157556', 'VT-VFCARE', 'Hi,the validity of the daily 1.5GB 4G/3G pack has expired.Continue to browse @ 4p/10Kb.Buy a data pack from MyVodafoneApp(www.vodafone.in/b3) or dial *111*1*5#'),
(140, '864558040157556', '51466', 'Your payment on Amazon.in for Rs. 35.00 using Amazon Pay balance is successful. Your balance is now Rs. 15.84. View Statement: https://www.amazon.in/vs'),
(141, '864558040157556', 'Vodafone', 'Hello, service validity is over for your number. Outgoing voice/data services have been discontinued. Recharge with an Unlimited/Combo pack to restore services'),
(142, '864558040157556', 'VK-VFCARE', 'Congratulations! Mobile services have been restored for your number. To know your service validity details, dial *111# or check your MyVodafoneApp\r\n'),
(143, '864558040157556', 'Vodafone', 'Hello, service validity is over for your number. Outgoing voice/data services have been discontinued. Recharge with an Unlimited/Combo pack to restore services'),
(144, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(145, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(146, '864558040157556', 'VK-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(147, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(148, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(149, '864558040157556', 'VK-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(150, '864558040157556', 'VK-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(151, '864558040157556', 'TX-SWIGGY', 'Your Swiggy order no. #32267741708 for Rs. 116 is expected to arrive in the next 43 mins. Track your order here: http://swig.gy/302SC5'),
(152, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.17.00 on 13-01-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 901312557186).'),
(153, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.17.00 on 13-01-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 901312557186).'),
(154, '864558040157556', 'AD-LENKRT', 'Rs. 1400 credited to your LENSKART account + Buy1Get1 for gold members.\nExpires in 2 days !\nDownload app lenskt.in/p3 to claim, t&c apply\nStore: lenskt.in/o3'),
(155, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.125.00 on 13-01-19 sent by nandanamurali438@okaxis-nandana murali(UPI Ref no 901312031698).'),
(156, '864558040157556', 'VK-ASIANT', 'Dear Subscriber(CN39065), Your Asianet bill for Rs.943 is generated,Click goo.gl/s341ET to pay online & get 2% discount.T&C apply.Pls ignore if paid'),
(157, '864558040157556', 'VM-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.17.00 on 13-01-19 sent by goog-payment@okaxis-GOOGLEPAY(UPI Ref no 901312557186).'),
(158, '864558040157556', 'AD-LENKRT', 'Rs. 1400 credited to your LENSKART account + Buy1Get1 for gold members.\nExpires in 2 days !\nDownload app lenskt.in/p3 to claim, t&c apply\nStore: lenskt.in/o3'),
(159, '864558040157556', 'VK-ALBANK', 'Your a/c no. XXXXXXX6753 is credited by Rs.125.00 on 13-01-19 sent by nandanamurali438@okaxis-nandana murali(UPI Ref no 901312031698).'),
(160, '864558040157556', 'VK-FLPKRT', '[#] 122615 is your Flipkart verification code. Code valid for 10 minutes only, one time use. Happy Shopping! \nDf9YrqIZHWd'),
(161, '864558040157556', '50351', 'Your Uber code: 5593. Reply STOP to 091675 00110 to unsubscribe.'),
(162, '864558040157556', '50351', 'Your Mi Account verification code is 161814. This OTP expires in 1 day.'),
(163, '864558040157556', 'BT-GROWWO', '<#> Onetime password is : 042587. This OTP is valid for 15 minutes only & usable only once. T & C apply. hkHMMiIZPc7'),
(164, '864558040157556', 'VK-ASIANT', 'Dear:CN39065 ,Your TicketNo CN1483660 has been closed...By our technical team.Your feedback is valuable to us..please click https://ascl.in/D0034'),
(165, '864558040157556', 'VK-ASIANT', 'Thank you for calling Asianet Broadband. Our customer care executive will contact you shortly from 04844153361'),
(166, '864558040157556', 'VK-ASIANT', 'Dear:CN39065 ,Your TicketNo CN1483660 has been closed...By our technical team.Your feedback is valuable to us..please click https://ascl.in/D0034'),
(167, '864558040157556', '15155327373', 'The code to disable or move your Steam Authenticator is: 96922'),
(168, '864558040157556', 'VK-FLPKRT', '[#] 122615 is your Flipkart verification code. Code valid for 10 minutes only, one time use. Happy Shopping! \nDf9YrqIZHWd'),
(169, '864558040157556', 'VK-FLPKRT', '[#] 122615 is your Flipkart verification code. Code valid for 10 minutes only, one time use. Happy Shopping! \nDf9YrqIZHWd'),
(170, '864558040157556', '15155327373', 'The code to disable or move your Steam Authenticator is: 96922'),
(171, '864558040157556', '15155327373', 'The code to disable or move your Steam Authenticator is: 96922'),
(172, '864558040157556', '15155327373', 'The code to disable or move your Steam Authenticator is: 96922'),
(173, '864558040157556', '56161940', 'Your Uber code: 6198. Reply STOP to 091675 00110 to unsubscribe.'),
(174, '864558040157556', 'VK-FLPKRT', '[#] 122615 is your Flipkart verification code. Code valid for 10 minutes only, one time use. Happy Shopping! \nDf9YrqIZHWd'),
(175, '864558040157556', '15155327373', 'The code to disable or move your Steam Authenticator is: 96922'),
(176, '864558040157556', 'VM-SWIGGY', 'Your order #29239845672 was delivered earlier than expected! Thanks for using Swiggy. Now use your Food Card to pay on Swiggy!'),
(177, '864558040157556', '+919847464626', 'Infront of desi cuppa'),
(178, '864558040157556', 'VM-SWIGGY', 'Your order #29239845672 was delivered earlier than expected! Thanks for using Swiggy. Now use your Food Card to pay on Swiggy!'),
(179, '864558040157556', 'VM-SWIGGY', 'Your order #29239845672 was delivered earlier than expected! Thanks for using Swiggy. Now use your Food Card to pay on Swiggy!'),
(180, '864558040157556', 'VM-SWIGGY', 'Your order #29239845672 was delivered earlier than expected! Thanks for using Swiggy. Now use your Food Card to pay on Swiggy!'),
(181, '864558040157556', 'VT-VFCARE', 'Hello, your 100.00 MB 3G/4G data pack is now active and valid till 18.02.2019 23:59:59 hrs. Watch movies & live TV on Vodafone Play http://bit.ly/2lR3DXQ'),
(182, '864558040157556', 'VT-VFCARE', 'Hello, your 100.00 MB 3G/4G data pack is now active and valid till 18.02.2019 23:59:59 hrs. Watch movies & live TV on Vodafone Play http://bit.ly/2lR3DXQ'),
(183, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(184, '864558040157556', 'VT-VFCARE', 'Hello! Recharge of Rs.35 on 22/01/19 is successful. Talktime recd Rs.26. GST chgd Rs.5.34, Access Fee Rs.29.31. New bal Rs.27.07. Additional benefits to follow.'),
(185, '864558040157556', 'VM-SWIGGY', 'Your Swiggy order #31061582538 was delivered under 30 mins! Thanks for using Swiggy. Now use your Food Card to pay on Swiggy!'),
(186, '864558040157556', 'VT-VFCARE', 'Rchrg of MRP Rs 1 on 22/01/19 successful.Tlktime rcvd Rs 1,GST Rs 0,AccessFee Rs 0,New Bal Rs 1.07.TransID KRH1901221902280077..'),
(187, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(188, '864558040157556', 'TM-PHONPE', '25680 is your one time password to proceed on PhonePe. It is valid for 10 minutes. Do not share your OTP with anyone.'),
(189, '864558040157556', 'VT-VFCARE', 'Rchrg of MRP Rs 1 on 22/01/19 successful.Tlktime rcvd Rs 1,GST Rs 0,AccessFee Rs 0,New Bal Rs 1.07.TransID KRH1901221902280077..'),
(190, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(191, '864558040157556', 'VT-VFCARE', 'Rchrg of MRP Rs 1 on 22/01/19 successful.Tlktime rcvd Rs 1,GST Rs 0,AccessFee Rs 0,New Bal Rs 1.07.TransID KRH1901221902280077..'),
(192, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(193, '864558040157556', 'TM-PHONPE', '25680 is your one time password to proceed on PhonePe. It is valid for 10 minutes. Do not share your OTP with anyone.'),
(194, '864558040157556', 'VT-VFCARE', 'Rchrg of MRP Rs 1 on 22/01/19 successful.Tlktime rcvd Rs 1,GST Rs 0,AccessFee Rs 0,New Bal Rs 1.07.TransID KRH1901221902280077..'),
(195, '864558040157556', 'VK-ASIANT', '[Sub Code:CN39065]:Dear  subscriber, Your complaint has been resolved as per our records.Call Customer Care for further support. Your Ticket No :CN1477415'),
(196, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)'),
(197, '864558040157556', 'VK-ALBANK', 'You have successfully added your BHIM ALLBANK UPI account with Axis Bank Ltd. app. In case if it is not you, please contact your bank or register a complaint on Banks helpline no. (1800 5722 000)');

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
