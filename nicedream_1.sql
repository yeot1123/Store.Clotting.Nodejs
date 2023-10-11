-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 20, 2023 at 06:29 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nicedream_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `accountID` int(255) NOT NULL,
  `userName` varchar(200) NOT NULL,
  `passWord` varchar(200) NOT NULL,
  `types` varchar(75) NOT NULL,
  `customerID` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`accountID`, `userName`, `passWord`, `types`, `customerID`) VALUES
(2, 'Jirat1123', '1123', 'customer', 6),
(3, 'boon', '123', 'admin', 7),
(4, 'Chin', 'password112', 'customer', 9),
(5, 'newza', '123', 'customer', 10),
(6, 'mild111', '123', 'admin', 11),
(7, 'donutz', '123', 'customer', 12),
(8, 'shiba', '123', 'customer', 13),
(9, 'shiba2', '123', 'admin', 14),
(10, 'doo', '123', 'customer', 15);

-- --------------------------------------------------------

--
-- Table structure for table `customerdetail`
--

CREATE TABLE `customerdetail` (
  `customerID` int(255) NOT NULL,
  `customerName` varchar(200) NOT NULL,
  `customerLastName` varchar(200) NOT NULL,
  `customerAddress` varchar(100) NOT NULL,
  `customerTel` int(10) NOT NULL,
  `customerEmail` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customerdetail`
--

INSERT INTO `customerdetail` (`customerID`, `customerName`, `customerLastName`, `customerAddress`, `customerTel`, `customerEmail`) VALUES
(6, 'Mild', 'Jirat', 'Lopburi', 936735173, '1164109060015@mail.rmutt.ac.th'),
(7, 'boon', 'toey', 'Lopburi', 984876101, 'leylee123@hotmail.com'),
(9, 'ชิน', 'เทียม', 'วัด', 981764111, 'aasdaa@gmail.com'),
(10, 'new', 'sang', 'home', 191, 'new@hotmail.com'),
(11, 'Mild', 'Thubloy', 'Lopburi', 936735173, 'noomzalove111@gmail.com'),
(12, 'do', 'nut', 'london', 999999998, 'doza999@gmail.com'),
(13, 'shiba', 'kiki', 'NEWYORK', 391237113, 'shiba888@gmail.com'),
(14, 'shiba2', 'kiki', 'NEWYORK', 123123123, 'shiba888@gmail.com'),
(15, 'doo', 'roo', 'NEWYORK', 293992212, 'doo888@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logadmin`
--

CREATE TABLE `logadmin` (
  `logUserName` varchar(150) NOT NULL,
  `logPassWord` varchar(150) NOT NULL,
  `logID` int(200) NOT NULL,
  `logTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logadmin`
--

INSERT INTO `logadmin` (`logUserName`, `logPassWord`, `logID`, `logTime`) VALUES
('boon', '123', 1, '2023-08-13 08:00:40'),
('boon', '123', 2, '2023-08-13 08:01:15'),
('boon', '123', 3, '2023-08-15 10:03:55'),
('boon', '123', 4, '2023-08-16 12:22:02'),
('boon', '123', 5, '2023-08-16 12:25:52'),
('boon', '123', 6, '2023-08-16 12:38:09'),
('boon', '123', 7, '2023-08-16 12:43:16'),
('boon', '123', 8, '2023-08-16 12:56:01'),
('boon', '123', 9, '2023-08-16 13:16:50'),
('mild111', '123', 10, '2023-08-16 13:38:02'),
('boon', '123', 11, '2023-08-16 13:56:38'),
('boon', '123', 12, '2023-08-19 16:35:23'),
('boon', '123', 13, '2023-08-21 12:45:01'),
('boon', '123', 14, '2023-08-21 12:51:41'),
('boon', '123', 15, '2023-08-21 13:33:53'),
('boon', '123', 16, '2023-08-21 13:49:00'),
('boon', '123', 17, '2023-08-21 17:01:05'),
('boon', '123', 18, '2023-08-22 12:58:48'),
('boon', '123', 19, '2023-08-22 15:01:44'),
('boon', '123', 20, '2023-08-22 16:21:48'),
('boon', '123', 21, '2023-08-23 04:02:57'),
('boon', '123', 22, '2023-08-23 04:09:04'),
('boon', '123', 23, '2023-08-23 04:40:52'),
('boon', '123', 24, '2023-08-23 04:49:26'),
('boon', '123', 25, '2023-08-23 05:03:36'),
('boon', '123', 26, '2023-08-23 05:05:20'),
('boon', '123', 27, '2023-08-23 05:21:04'),
('boon', '123', 28, '2023-08-23 05:48:33'),
('shiba2', '123', 29, '2023-08-23 05:50:36'),
('boon', '123', 30, '2023-08-23 07:06:43'),
('boon', '123', 31, '2023-08-23 07:07:56'),
('shiba2', '123', 32, '2023-08-23 07:08:30'),
('boon', '123', 33, '2023-08-23 07:10:01'),
('boon', '123', 34, '2023-08-23 07:15:50'),
('shiba2', '123', 35, '2023-08-23 07:20:16'),
('boon', '123', 36, '2023-08-23 07:21:50'),
('boon', '123', 37, '2023-09-17 14:24:20'),
('boon', '123', 38, '2023-09-17 15:08:48'),
('boon', '123', 39, '2023-09-17 15:09:55'),
('boon', '123', 40, '2023-09-17 15:19:14'),
('boon', '123', 41, '2023-09-17 15:19:41'),
('boon', '123', 42, '2023-09-17 00:00:00'),
('boon', '123', 43, '2023-09-17 15:20:56'),
('boon', '123', 44, '2023-09-17 15:21:34'),
('boon', '123', 45, '2023-09-17 15:22:02'),
('boon', '123', 46, '2023-09-17 22:26:45'),
('boon', '123', 47, '2023-09-18 00:05:48'),
('boon', '123', 48, '2023-09-18 22:01:11'),
('boon', '123', 49, '2023-09-20 10:03:00'),
('boon', '123', 50, '2023-09-20 11:20:19');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `ProductID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `SubTotalPrice` double NOT NULL,
  `TotalAll` int(11) NOT NULL,
  `orderDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ProductID`, `customerID`, `Quantity`, `SubTotalPrice`, `TotalAll`, `orderDate`) VALUES
(3, 10, 3, 3, 1290, '2023-09-19 16:43:58'),
(3, 10, 2, 2580, 2580, '2023-09-20 10:11:31'),
(4, 10, 8, 10320, 2580, '2023-09-20 10:11:31'),
(4, 10, 2, 2, 2580, '2023-09-20 10:40:41'),
(4, 10, 1, 1, 1290, '2023-09-20 10:43:42'),
(4, 10, 3, 3, 3870, '2023-09-20 10:56:43'),
(4, 10, 3, 3, 3870, '2023-09-20 10:59:21'),
(4, 10, 3, 3, 3870, '2023-09-20 11:01:50'),
(4, 10, 3, 3, 3870, '2023-09-20 11:01:53'),
(9, 10, 1, 1, 1490, '2023-09-20 11:04:31'),
(9, 10, 2, 2, 2980, '2023-09-20 11:04:42'),
(9, 10, 4, 4, 5960, '2023-09-20 11:05:30'),
(9, 10, 4, 4, 5960, '2023-09-20 11:07:04'),
(9, 10, 4, 4, 5960, '2023-09-20 11:07:23'),
(1, 10, 1, 8, 890, '2023-09-20 11:07:31'),
(1, 10, 1, 8, 890, '2023-09-20 11:07:42'),
(1, 10, 1, 8, 890, '2023-09-20 11:07:59'),
(1, 10, 4, 4, 5160, '2023-09-20 11:12:14'),
(1, 10, 4, 4, 5160, '2023-09-20 11:13:49'),
(1, 10, 4, 4, 5160, '2023-09-20 11:13:50'),
(6, 10, 2, 4, 500, '2023-09-20 11:14:21'),
(9, 10, 1, 1, 1490, '2023-09-20 11:15:58'),
(3, 10, 3, 3, 3870, '2023-09-20 11:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `PaymentID` int(20) NOT NULL,
  `TotalAll` int(11) NOT NULL,
  `PayName` varchar(20) NOT NULL,
  `SlipPayment` varchar(20) NOT NULL,
  `PayAddress` text NOT NULL,
  `customerID` int(11) NOT NULL,
  `PayTel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`PaymentID`, `TotalAll`, `PayName`, `SlipPayment`, `PayAddress`, `customerID`, `PayTel`) VALUES
(5, 6604, 'วิภารัตน์', 'S__91455491.jpg', 'กรุงเทพ', 2, '0891321600'),
(6, 6604, 'วิภารัตน์', 'S__91455491.jpg', 'กรุงเทพ', 2, '0891321600'),
(7, 1351, 'วิภารัตน์', 'S__91455491.jpg', 'กรุงเทพ', 2, '0891321600'),
(8, 1351, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(9, 601, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(10, 601, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(11, 601, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(12, 601, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(13, 601, 'วิภารัตน์', '', 'กรุงเทพ', 2, '0891321600'),
(14, 2701, 'วิภารัตน์', '', 'กรุงเทพ', 36, '0891321600'),
(15, 2701, 'วิภารัตน์', 'S__91455491.jpg', 'กรุงเทพ', 36, '0891321600'),
(16, 1951, 'วิภารัตน์', 'S__91455491.jpg', 'กรุงเทพ', 2, '0891321600'),
(17, 3870, 'ธนบูลย์', 'licensed-image.jpg', '5/351', 10, '0984876101');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` int(255) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `CategoryID` int(11) DEFAULT NULL,
  `productPrice` int(10) NOT NULL,
  `UnitsInStock` int(5) DEFAULT NULL,
  `productDetail` varchar(200) NOT NULL,
  `ManufactureYear` smallint(5) NOT NULL,
  `image` text NOT NULL,
  `ProductSlug` varchar(50) NOT NULL,
  `Feature` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productName`, `CategoryID`, `productPrice`, `UnitsInStock`, `productDetail`, `ManufactureYear`, `image`, `ProductSlug`, `Feature`) VALUES
(1, 'Blue Boyz T-Shirt', NULL, 3000, 35, 'T-Shirt Form Blue Boyz', 0, '1.jpeg', '', 0),
(3, 'Den - Kung fu Cap (Black)', NULL, 1290, 45, 'Art by Leo 6 panel unconstruct cotton cap Leather strap closure', 0, '3.jpeg', '', 0),
(4, 'Teenage Daydream - Injected With A Poison S/S T-Shirt (Black)', NULL, 1290, 85, 'Teenage Daydream, a Bangkok-based clothing brand born from the creative collaboration', 0, '4.jpeg', '', 0),
(5, 'Tee shirts original', NULL, 3500, 24, 'original by NICEDREAM', 0, '5.jpeg', '', 0),
(6, 'Wimp - Logo Keychain', NULL, 250, 3, 'Rubber keychain', 0, '6.jpeg', '', 0),
(7, 'RWCHE - Arrow Socks', NULL, 790, 12, 'RWCHE \"ARROW\" Socks  Color : CREAM ,SAX , BLACK (from the left of the photo)  Size : FREE (Approximate 24~28)  Made in Japan', 0, '7.jpeg', '', 0),
(8, 'Rwche - Feeling Up Cap', NULL, 2690, 10, 'RWCHE \"FEELIN UP\" Cap  Color : Navy , Beige , Orange  Size: One Size  Material: 100% polyester  Made in Japan  Made of mesh fabric that feels good on the skin, it is a \"FEELIN UP\" cap that is comforta', 0, '8.jpeg', '', 0),
(9, 'Den - Nanzo Women Crop T-Shirt', NULL, 1490, 9, 'Artwork by Nanzo 100% cotton short sleeve cropped graphic t-shirt  One size: 16\"x18\"', 0, '9.jpeg', '', 0),
(10, 'Tyezine - Embrio Candle by Goose Hag', NULL, 1290, 6, 'EMBRIO CANDLE BY @GOOSE_HAG  Magic message : light up the youth in you／若さに火を灯したい時に Scent：Eden(sandalwood base)  Edition of 50', 0, '10.jpeg', '', 0),
(11, 'Fifth - Arctic Snow Camouflage Trousers (Queen Blue)', NULL, 3703, 13, 'Arctic Snow Camouflage Trousers (Queen Blue)  The trousers have pass through side hand openings with flaps and a right hip pocket with flap (all having snap fastener closures), suspender loops, inside', 0, '11.jpeg', '', 0),
(12, 'Easy Go! - \"EasyGoSelects\" 85G AllCity Performance Spec Socks', NULL, 890, 30, 'AllCity Performance cotton athletic sock.  Designed by EasyGo and Selects in New York City for sport and comfort.  85G Moderate weather gauge weight.  Breathable mesh upper with reinforced body for du', 0, '12.jpeg', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `customerdetail`
--
ALTER TABLE `customerdetail`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `logadmin`
--
ALTER TABLE `logadmin`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `customerID` (`customerID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`PaymentID`),
  ADD KEY `cmID` (`customerID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accountID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `customerdetail`
--
ALTER TABLE `customerdetail`
  MODIFY `customerID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `logadmin`
--
ALTER TABLE `logadmin`
  MODIFY `logID` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `PaymentID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productID` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customerdetail` (`customerID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`productID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `customerdetail` (`customerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
