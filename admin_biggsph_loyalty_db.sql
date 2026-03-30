-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 30, 2026 at 10:41 AM
-- Server version: 10.6.22-MariaDB
-- PHP Version: 8.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `admin_biggsph_loyalty_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `biggs_branches`
--

CREATE TABLE `biggs_branches` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `images` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `has_venue_hall` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `biggs_branches`
--

INSERT INTO `biggs_branches` (`id`, `title`, `code`, `description`, `images`, `created_at`, `updated_at`, `contact`, `latitude`, `longitude`, `has_venue_hall`) VALUES
(14, 'BIGGS GOA', 'GOA', '7:00AM - 8:00PM, With Function Hall, San Jose St., Goa, Camarines Sur', '66cfc35ea11a53.96310693.png', '2024-07-04 17:08:33', '2024-09-10 23:40:53', '0928-664-4114', 13.698134654934885, 123.4897009251598, 1),
(15, 'BIGGS IRIGA', 'IRIGA', '8:00AM - 9:00PM, With FoodPanda & Function Hall, San Roque, Iriga City', '66cfc377c70269.53103733.png', '2024-07-04 17:09:20', '2024-09-12 00:17:40', '0907-904-1992', 13.421369382411509, 123.4121244123936, 1),
(17, 'BIGGS SM NAGA', 'SMNAG', '10:00AM - 9:00PM, SM City Naga Triangulo', '66cfc38323d474.17095477.png', '2024-07-04 17:23:33', '2024-09-10 23:05:21', '0994-230-9660', 13.620584135135939, 123.18990514721712, 0),
(27, 'BIGGS BIA', 'BIA', '4:00AM - 7:00PM, Airport, Daraga', '66cfc38d5b1b80.27307739.png', '2024-08-02 02:18:57', '2024-09-10 23:08:17', '0935-110-1728', 13.111230687175443, 123.68198464957464, 0),
(28, 'Biggs CAMALIG', 'CAMALIG', '24HRS, Camalig', '66cfc39916bc82.93169621.png', '2024-08-02 02:19:30', '2024-09-10 23:07:59', '0917-143-0122', 13.178164157615797, 123.64360104930417, 1),
(29, 'Biggs SM SORSOGON', 'B-SMS', '8:00AM - 11:00PM, SM Sorsogon', '66cfc3a3def788.38085444.png', '2024-08-02 02:20:09', '2024-09-10 23:07:41', '0995-192-1944', 12.975703894789698, 124.01977122577422, 0),
(31, 'BIGGS BARLIN', 'BRLN', '7:00AM - 10:00PM, With FoodPanda & Function Hall, Naga City', '66cfc3b1993744.61993949.png', '2024-08-04 20:56:54', '2024-09-10 23:07:27', '0916-332-2258', 13.62714418756896, 123.18655325212642, 1),
(32, 'BIGGS Robinson', 'ROB-FRN', '10:00AM - 9:00PM, Robinsons Place Naga', '66cfc3bbad9b67.52558676.png', '2024-08-04 20:58:53', '2024-09-10 23:07:07', '0995-842-4394', 13.614724683883027, 123.19275224297968, 0),
(33, 'BIGGS Emerald', 'EME', '9AM-9PM, With FoodPanda & Function Hall, Naga City', '66cfc3c67b5e40.59990367.png', '2024-08-04 21:01:13', '2024-09-10 23:06:51', '0992 961 9982', 13.643278673717752, 123.20481463392119, 1),
(34, 'BIGGS Centro NAGA', 'CNTRO', '24HRS, With FoodPanda & Function Hall, Naga City', '66cfc3d889cd52.61111850.png', '2024-08-04 22:03:17', '2024-09-10 23:06:38', '0956-934-0799', 13.624735393757605, 123.18573540267226, 1),
(35, 'BIGGS PILI', 'SANPILI', '24HRS, With FoodPanda & Function Hall, Pili, Cam Sur', '66cfc3e3c61d31.17410180.png', '2024-08-04 22:04:56', '2024-09-10 23:06:24', '0917-172-4447', 13.570567389434569, 123.26536290376461, 1),
(36, 'Biggs Pacific Mall', 'PACML', '10AM-8PM, Legazpi', '66cfc3f25edf53.62313944.png', '2024-08-04 22:06:54', '2024-09-10 23:45:08', '0916-332-2158', 13.145523064780104, 123.74994515040025, 1),
(37, 'BIGGS Magsaysay', 'MAGS', '24HRS, With FoodPanda & Function Hall, Naga City', '66e137179edec5.34862951.png', '2024-09-10 23:22:15', '2024-09-11 02:01:33', '0993-613-7348', 13.630974473427537, 123.19669837546351, 1),
(38, 'BIGGS SM LEGAZPI', 'SMLGZ-FRN', '10AM-9PM, SM Legazpi', '66e2949022957.jpg', '2024-09-12 00:13:20', '2024-09-12 00:13:20', '0917-715-3367', 13.144111858438341, 123.74482240795365, 0),
(39, 'BIGGS AYALA MALLS', 'AYALA-FRN', '10AM-8PM, Ayala Legazpi', '66e294c99bc2a.png', '2024-09-12 00:14:17', '2024-09-12 00:14:17', '0917-165-5000', 13.147258699763764, 123.75215040283474, 0),
(40, 'BIGGS SM LIPA', 'SMLIP', '10AM-9PM, SM Lipa', '672c7801eac71.jpg', '2024-11-07 01:17:34', '2024-11-07 01:17:34', '0916-332-2017', 13.954507532912212, 121.16403834666019, 0),
(41, 'BIGGS BMC', 'BMC', '7AM-9PM, Naga', '673159eb7e645.JPG', '2024-11-10 18:12:12', '2024-11-10 18:12:12', '0970-668-1150', 13.623093832632762, 123.19949269292583, 0),
(43, 'BIGGS DAET', 'DAET', '10AM-9PM, SM Daet', '6731701c13b57.jpg', '2024-11-10 19:46:52', '2024-11-10 19:46:52', '0991-176-7214', 14.12128240255378, 122.94592373599205, 0),
(44, 'BIGGS SIPOCOT', 'SIPOCOT', '24HRS, Sipocot', '67329df07e215.jpg', '2024-11-11 17:14:42', '2024-11-11 17:14:42', '0994-757-1807', 13.747749733198745, 122.97398426118464, 1),
(45, 'BIGGS MASBATE', 'MAS', '8:30AM - 8PM, Masbate', '67329ed827ab8.jpg', '2024-11-11 17:18:32', '2024-11-11 17:18:32', '0916-332-2123', 12.360038006950026, 123.62533945034058, 1),
(46, 'BIGGS OLD ALBAY', 'OLA', '24HRS, Legazpi', '6732a223080c2.JPG', '2024-11-11 17:32:35', '2024-11-11 17:32:35', '0916-332-2177', 13.138718810373124, 123.7362143753515, 1),
(48, 'BIGGS Polangui', 'B-CPOL', '9AM-10PM, Polangui', '675819bb143bb.jpeg', '2024-12-10 03:34:00', '2024-12-10 03:34:00', '09076311821', 13.292606001050626, 123.49013962469664, 1),
(49, 'BIGGS PAGBILAO', 'BPAG', '24HRS, Quezon', '693920dfd1185.jpg', '2025-12-10 00:27:29', '2025-12-10 00:27:29', '09278854651', 13.959918822632648, 121.65252165077797, 1),
(50, 'Biggs Grande', 'BGRAN', '24HRS, Naga', '693921b9854ee.jpg', '2025-12-10 00:31:06', '2025-12-10 00:31:06', '09275852042', 13.621516627043208, 123.2172549243273, 1),
(51, 'BIGGS TABACO', 'BTAB', '24HRS, Tabaco', '6964bd068d779.jpg', '2026-01-12 02:21:11', '2026-01-12 02:21:11', '09369558498', 13.355738692596226, 123.73056753458862, 1);

-- --------------------------------------------------------

--
-- Table structure for table `btc_loyalty`
--

CREATE TABLE `btc_loyalty` (
  `loyalty_id` int(11) NOT NULL,
  `tag_uid` varchar(14) NOT NULL,
  `phone_number` text NOT NULL,
  `activated_flag` tinyint(1) NOT NULL,
  `registered_flag` tinyint(1) NOT NULL,
  `points` int(11) NOT NULL,
  `visits` int(11) NOT NULL,
  `tag_timestamp` datetime NOT NULL,
  `server_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `btc_loyalty`
--

INSERT INTO `btc_loyalty` (`loyalty_id`, `tag_uid`, `phone_number`, `activated_flag`, `registered_flag`, `points`, `visits`, `tag_timestamp`, `server_timestamp`) VALUES
(1, '04A6AD40C22A81', '09673169637', 1, 1, 20, 1, '2026-03-24 15:03:44', '2026-03-24 15:03:44');

-- --------------------------------------------------------

--
-- Table structure for table `btc_profile`
--

CREATE TABLE `btc_profile` (
  `tag_uid` text NOT NULL,
  `phone_number` text NOT NULL,
  `name` text NOT NULL,
  `birthday` date NOT NULL,
  `fave_location` text NOT NULL,
  `fave_item` text NOT NULL,
  `events_flag` tinyint(1) NOT NULL,
  `franchising_flag` tinyint(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `btc_profile`
--

INSERT INTO `btc_profile` (`tag_uid`, `phone_number`, `name`, `birthday`, `fave_location`, `fave_item`, `events_flag`, `franchising_flag`, `password`, `email`, `created_at`) VALUES
('04A6AD40C22A81', '09673169637', 'Ian Benedict B. Argote', '1999-08-19', 'BRLN', 'CHKN1', 0, 0, '', NULL, '2026-03-30 01:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `m_id` int(11) NOT NULL,
  `m_code` varchar(20) NOT NULL,
  `m_title` varchar(255) NOT NULL,
  `m_desc` varchar(200) NOT NULL,
  `m_price` varchar(200) NOT NULL,
  `m_creator` varchar(200) NOT NULL,
  `date_create` varchar(200) NOT NULL,
  `filename` varchar(200) NOT NULL,
  `position` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`m_id`, `m_code`, `m_title`, `m_desc`, `m_price`, `m_creator`, `date_create`, `filename`, `position`, `type`) VALUES
(1, 'SIZ04', 'Baby Back Ribs', '   ', '469', 'joer@gmail.com', '2024-09-10 08:38:29', '66dfe965ce14f.png', 'sizzlers', 0),
(2, 'SIZ07\n', 'Pork Kebab', '   ', '279', 'joer@gmail.com', '2024-09-10 08:38:48', '66dfe97829e53.png', 'sizzlers', 0),
(3, 'CHI12\n', 'Smoked Chicken', '   ', '309', 'joer@gmail.com', '2024-09-10 08:39:08', '66dfe98c3f5a9.png', 'sizzlers', 0),
(4, 'SIZ10', 'Ribs and Smoked Chicken', '   ', '709', 'joer@gmail.com', '2024-09-10 08:39:47', '66dfe9b31b1a0.png', 'sizzlers', 0),
(5, 'SIZ12\n', 'Beef Salpicao', '   ', '299', 'joer@gmail.com', '2024-09-10 08:40:29', '66dfe9dd479ed.png', 'sizzlers', 0),
(6, 'SIZ11\n', 'Tenderloin Tips', '   ', '279', 'joer@gmail.com', '2024-09-10 08:40:37', '66dfe9e545621.png', 'sizzlers', 0),
(7, 'SIZ05\n', 'Korean Spare Ribs', '   ', '379', 'joer@gmail.com', '2024-09-10 08:40:51', '66dfe9f34c7da.png', 'sizzlers', 0),
(8, 'SIZ08\n', 'Bicol Special', '   ', '289', 'joer@gmail.com', '2024-09-10 08:41:04', '66dfea00907e8.png', 'sizzlers', 0),
(9, 'SIZ06', 'Pork Cordon Bleu with Creamy Butter Sauce ', '   ', '289', 'joer@gmail.com', '2024-09-10 08:41:13', '66dfea0914529.png', 'sizzlers', 0),
(10, 'SIZ09\n', 'Original Salisbury Steak', '   ', '269', 'joer@gmail.com', '2024-09-10 08:41:50', '66dfea2e01535.png', 'sizzlers', 0),
(11, 'SIZ15\n', 'Chicken Salisbury Steak', '   ', '269', 'joer@gmail.com', '2024-09-10 08:41:59', '66dfea371101d.png', 'sizzlers', 0),
(12, 'SIZ01\n', 'Tuna Salpicao', '   ', '329', 'joer@gmail.com', '2024-09-10 08:42:08', '66dfea4039608.png', 'sizzlers', 0),
(13, 'SIZ16\n', 'Sizzling Tofu with Mushroom', '   ', '259', 'joer@gmail.com', '2024-09-10 08:42:20', '66dfea4c8b647.png', 'sizzlers', 0),
(14, 'SIZ02', 'Tanguigue Steak', '   ', '319', 'joer@gmail.com', '2024-09-10 08:42:45', '66dfea6532f6e.png', 'sizzlers', 0),
(15, 'BRE01\n', 'Daing na Bangus', '   ', '299', 'joer@gmail.com', '2024-09-10 08:42:54', '66dfea6e8f7a6.png', 'sizzlers', 0),
(20, 'CHI06\n', 'Chicken in a Box  (6 pcs)', '   ', ' 679 ', 'joer@gmail.com', '2024-10-29 04:05:12', '67205077d7eb7.png', 'chicken', 1),
(21, 'CHI09\n', 'Bigg Deal', '   ', '319', 'joer@gmail.com', '2024-10-29 04:06:47', '672051476bcce.png', 'chicken', 1),
(22, 'CHI10\n', 'Chicken with Kebab Meal', '   ', '279', 'joer@gmail.com', '2024-10-29 04:07:09', '6720515d0030f.png', 'chicken', 1),
(23, 'CHI01\n', 'Biggs Fried Chicken (1pc)', '   ', '139', 'joer@gmail.com', '2024-10-29 04:07:34', '67205176a19dc.png', 'chicken', 1),
(24, 'CHI03\n', 'Biggs Fried Chicken  (2 pcs)', '   ', '259', 'joer@gmail.com', '2024-10-29 04:08:11', '6720519b41f5e.png', 'chicken', 1),
(25, 'CHI02\n', 'Biggs Cajun Chicken (1 pcs)', '   ', '169', 'joer@gmail.com', '2024-10-29 04:09:15', '672051db08f94.png', 'chicken', 1),
(26, 'CHI04\n', 'Biggs Crispy Cajun (2 pcs)', '   ', '309', 'joer@gmail.com', '2024-10-29 04:09:33', '672051eda0dbb.png', 'chicken', 1),
(27, 'CHI11\n', 'Chicken with Mac Salad', '   ', '209', 'joer@gmail.com', '2024-10-29 04:10:34', '6720522a8b35c.png', 'chicken', 1),
(31, 'BEV01\n', 'Signature Iced Coffee', '   ', '119', 'joer@gmail.com', '2024-10-29 04:11:59', '6720527f2c91d.png', 'cold', 0),
(32, 'BEV03\n', 'Caramel Machiato', '   ', '169', 'joer@gmail.com', '2024-10-29 04:12:10', '6720528a2f57a.png', 'cold', 0),
(33, 'BEV02\n', 'Sweet Black Coffee', '   ', '109', 'joer@gmail.com', '2024-10-29 04:12:25', '6720529932680.png', 'cold', 0),
(34, 'BEV93\n', 'Rock N\' Roll Iced Tea', '   ', '79', 'joer@gmail.com', '2024-10-29 04:12:39', '672052a7690a9.png', 'cold', 0),
(35, 'BEV94\n', 'Pineapple Juice', '   ', '89', 'joer@gmail.com', '2024-10-29 04:12:50', '672052b2d1e96.png', 'cold', 0),
(36, 'BEV95\n', 'Mango Graham Shake', '   ', '149', 'joer@gmail.com', '2024-10-29 04:13:02', '672052be2bcf8.png', 'cold', 0),
(37, 'BEV96\n', 'Ripe Mango Shake', '   ', '149', 'joer@gmail.com', '2024-10-29 04:13:13', '672052c95c5f1.png', 'cold', 0),
(38, 'BEV97\n', 'Cookies and Cream Shake', '   ', '149', 'joer@gmail.com', '2024-10-29 04:13:34', '672052de6f1c5.png', 'cold', 0),
(41, 'BEV18\n', 'Brewed Coffee', '   ', '99', 'joer@gmail.com', '2024-10-29 04:14:03', '672052fb496ec.png', 'coffee', 1),
(42, 'BEV19\n', 'Nespresso Brewed Coffee', '   ', '149', 'joer@gmail.com', '2024-10-29 04:14:17', '67205309f2fba.png', 'coffee', 1),
(43, 'BEV20', 'Hot Choco', '   ', '79', 'joer@gmail.com', '2024-10-29 04:14:29', '6720531551163.png', 'coffee', 1),
(165, 'BRE07\n', 'Beef Tapa', '   ', '239', 'joer@gmail.com', '2024-09-10 08:43:39', '66dfea9b074cc.png', 'breakfast', 1),
(166, 'BRE05\n', 'Tocilog', '   ', '229', 'joer@gmail.com', '2024-09-10 08:43:50', '66dfeaa6db595.png', 'breakfast', 1),
(167, 'BRE04\n', 'Country Breakfast', '   ', '249', 'joer@gmail.com', '2024-09-10 08:44:11', '66dfeabbb0830.png', 'breakfast', 1),
(168, 'BRE03\n', 'Franks and Egg', '   ', '219', 'joer@gmail.com', '2024-09-10 08:44:25', '66dfeac968830.png', 'breakfast', 1),
(169, 'BRE02\n', 'American Slam', '   ', '259', 'joer@gmail.com', '2024-09-10 08:44:47', '66dfeadf00cf5.png', 'breakfast', 1),
(170, 'BRE10\n', 'Goto With Egg', '   ', '99', 'joer@gmail.com', '2024-09-10 08:45:14', '66dfeafaa5ad5.png', 'breakfast', 1),
(171, 'BRE09\n', 'Biggs Goto', '   ', '89', 'joer@gmail.com', '2024-09-10 08:45:25', '66dfeb05f070e.png', 'breakfast', 1),
(198, 'SID11\n', 'Nena\'s harvest Salad', '   ', '169', 'joer@gmail.com', '2024-11-13 01:42:09', '6733f5e1078b4.png', 'salad', 1),
(199, 'SID12\n', 'South Western Salad', '   ', '169', 'joer@gmail.com', '2024-11-13 01:42:21', '6733f5edd4015.png', 'salad', 1),
(200, 'SID13\n', 'Creamy Macaroni Salad', '   ', '109', 'joer@gmail.com', '2024-11-13 01:42:33', '6733f5f99b454.png', 'salad', 1),
(201, 'SNA13\n', 'Biggs Spaghetti with Chicken', '   ', '209', 'joer@gmail.com', '2024-11-13 01:44:18', '6733f6621b07c.png', 'pasta', 1),
(202, 'SNA09', 'Biggs Chicken, Spaghetti & Pizza Bread', '   ', '249', 'joer@gmail.com', '2024-11-13 01:44:57', '6733f689b127d.png', 'pasta', 1),
(203, 'SNA10\n', 'Biggs Chicken, Carbonara & Pizza Bread', '   ', '269', 'joer@gmail.com', '2024-11-13 01:45:11', '6733f697d40a8.png', 'pasta', 1),
(204, 'SNA14\n', 'Biggs Carbonara with Chicken', '   ', '229', 'joer@gmail.com', '2024-11-13 01:45:28', '6733f6a8e5ed6.png', 'pasta', 1),
(205, 'SNA07\n', 'Biggs Spaghetti with Pizza Bread ', '   ', '139', 'joer@gmail.com', '2024-11-13 01:45:52', '6733f6c01b162.png', 'pasta', 1),
(206, 'SNA10\n', 'Biggs Carbonara with Pizza Bread', '   ', '159', 'joer@gmail.com', '2024-11-13 01:46:54', '6733f6fe71f86.png', 'pasta', 1),
(207, 'SNA01\n', 'Biggs Spaghetti', '   ', '109', 'joer@gmail.com', '2024-11-13 01:47:17', '6733f715ad3de.png', 'pasta', 1),
(208, 'SNA03\n', 'Bacon Mac N\' Cheese', '   ', '109', 'joer@gmail.com', '2024-11-13 01:48:04', '6733f74421cf9.png', 'pasta', 1),
(209, 'SNA02\n', 'Biggs Carbonara', '   ', '124', 'joer@gmail.com', '2024-11-13 01:48:32', '6733f760d47ef.png', 'pasta', 1),
(218, 'SID02\n', 'Coleslaw (Topsider) ', '   ', '59', 'joer@gmail.com', '2024-11-13 01:50:43', '6733f7e3a09fc.png', 'siders', 1),
(219, 'SID05\n', 'Kimchi (Topsider) ', '   ', '59', 'joer@gmail.com', '2024-11-13 01:50:58', '6733f7f21c32f.png', 'siders', 1),
(220, 'SID06\n', 'Macaroni Salad (Topsider)', '   ', '59', 'joer@gmail.com', '2024-11-13 01:51:16', '6733f80454a6c.png', 'siders', 1),
(221, 'SID04\n', 'Mashed Potato (Topsider)', '   ', '59', 'joer@gmail.com', '2024-11-13 01:51:39', '6733f81b6ea54.png', 'siders', 1),
(222, 'SID14\n', 'Oriental Salad (Topsider)', '   ', '59', 'joer@gmail.com', '2024-11-13 01:51:57', '6733f82d73aec.png', 'siders', 1),
(223, 'SID03\n', 'Vegetable Medly (Topsider)', '   ', '59', 'joer@gmail.com', '2024-11-13 01:52:17', '6733f84159079.png', 'siders', 1),
(224, 'SNA22\n', 'Extreme Platter', '   ', '259', 'joer@gmail.com', '2024-11-13 01:42:55', '6733f60f5c21e.png', 'fries', 0),
(225, 'SNA30\n', 'California Tuna Sandwich', '   ', '119', 'joer@gmail.com', '2024-11-13 01:43:23', '6733f62b2c860.png', 'fries', 1),
(226, 'SNA23\n', 'French Fries', '   ', '99', 'joer@gmail.com', '2024-11-13 01:43:38', '6733f63ab6cd7.png', 'fries', 0),
(227, 'DES03\n', 'Berries Cheesecake', '   ', '179', 'joer@gmail.com', '2024-11-13 01:53:49', '6733f882b34e5.png', 'cakes', 0),
(228, 'DES01\n', 'Carrot Cake', '   ', '179', 'joer@gmail.com', '2024-11-13 01:53:37', '6733f891914cf.png', 'cakes', 0),
(229, 'DES02\n', 'Psychocolate Cake', '   ', '179', 'joer@gmail.com', '2024-11-13 01:54:06', '6733f8aebf1c3.png', 'cakes', 0),
(230, 'SNA25\n', 'Tower Burger', '   ', '439', 'joer@gmail.com', '2024-11-13 01:48:49', '6733f771e1801.png', 'burger', 0),
(231, 'SNA26\n', 'Extreme Supreme Burger', '   ', '259', 'joer@gmail.com', '2024-11-13 01:48:59', '6733f77bd9212.png', 'burger', 0),
(232, 'SNA27\n', 'Bacon Cheese Burger', '', '129', 'joer@gmail.com', '2024-11-13 01:49:30', '6733f79acb75e.png', 'burger', 0),
(233, 'SNA28\n', 'Cheesy Burger', '   ', '109', 'joer@gmail.com', '2024-11-13 01:49:45', '6733f7a9da75a.png', 'burger', 0),
(234, 'SNA29\n', 'Classic Burger', '   ', '89', 'joer@gmail.com', '2024-11-13 01:49:59', '6733f7b71e055.png', 'burger', 0),
(235, 'SID08\n', 'Cheese Burger Soup', '   ', '59', 'joer@gmail.com', '2024-10-29 04:15:53', '67205369a361b.png', 'soup', 1),
(236, 'SID09\n', 'Chicken Tomato Soup', '   ', '59', 'joer@gmail.com', '2024-10-29 04:16:07', '67205377ae404.png', 'soup', 1),
(1893, 'SID07', 'Crab N\' Corn Soup', '', '59', 'joer@gmail.com', '2024-10-29 04:17:28', '672053af565f8.png', 'soup', 1),
(1894, 'CHI07', 'Chicken in a Box  (8 pcs) ', '   ', '889', 'joer@gmail.com', '2024-10-29 04:05:12', '67205077d7eb7.png', 'chicken', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biggs_branches`
--
ALTER TABLE `biggs_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `btc_loyalty`
--
ALTER TABLE `btc_loyalty`
  ADD PRIMARY KEY (`loyalty_id`),
  ADD UNIQUE KEY `tag_uid` (`tag_uid`),
  ADD UNIQUE KEY `phone_number` (`phone_number`) USING HASH;

--
-- Indexes for table `btc_profile`
--
ALTER TABLE `btc_profile`
  ADD PRIMARY KEY (`tag_uid`(225),`phone_number`(11));

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`m_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `btc_loyalty`
--
ALTER TABLE `btc_loyalty`
  MODIFY `loyalty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1895;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
