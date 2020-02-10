-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 10, 2020 at 10:06 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Sycle_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order`
--

CREATE TABLE `invoice_order` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `order_receiver_name` varchar(250) NOT NULL,
  `order_receiver_address` text NOT NULL,
  `order_total_before_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_total_tax` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_tax_per` varchar(250) NOT NULL DEFAULT '0',
  `order_total_after_tax` double(10,2) NOT NULL DEFAULT 0.00,
  `order_amount_paid` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_total_amount_due` decimal(10,2) NOT NULL DEFAULT 0.00,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order`
--

INSERT INTO `invoice_order` (`order_id`, `user_id`, `order_date`, `order_receiver_name`, `order_receiver_address`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `note`) VALUES
(1, 1, '2020-02-09 08:29:15', 'Sycle.Net', 'Seymour str, Vancouver, BC ', '8780.00', '1053.60', '12', 9833.60, '10000.00', '-166.40', 'For It Department'),
(14, 1, '2020-02-10 08:50:47', 'Hearing Center, Vancouver', '555 Seymour str, Vancouver, BC', '900.50', '108.06', '12', 1008.56, '1000.00', '8.56', 'For Reception'),
(15, 1, '2020-02-10 08:53:00', 'Hearing Center, Calgary', '656 Georgia str, Calgary', '2300.00', '230.00', '10', 2530.00, '2530.00', '0.00', 'For IT Department'),
(17, 1, '2020-02-10 20:23:28', 'Hearing Center', 'Vancouver, BC', '1170.00', '140.40', '12', 1310.40, '0.00', '1310.40', ''),
(18, 1, '2020-02-10 20:25:20', 'Hearing Center, Regina', 'Regina, Canada', '120.00', '12.00', '10', 132.00, '90.00', '42.00', 'For IT Department'),
(19, 1, '2020-02-10 20:54:27', 'Testing Company', '555 Seymour str, Vancouver, BC', '40.00', '4.80', '12', 44.80, '0.00', '44.80', 'For everybody');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_order_item`
--

CREATE TABLE `invoice_order_item` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_code` varchar(250) NOT NULL,
  `item_name` varchar(250) NOT NULL,
  `order_item_quantity` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_item_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `order_item_final_amount` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_order_item`
--

INSERT INTO `invoice_order_item` (`order_item_id`, `order_id`, `item_code`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(6, 1, '1', 'MacBook Pro', '3.00', '1650.50', '4951.50'),
(7, 1, '2', 'PC', '5.00', '765.70', '3828.50'),
(31, 15, '1', 'Computer Table', '10.00', '230.00', '2300.00'),
(33, 17, '1', 'Monitor', '5.00', '234.00', '1170.00'),
(38, 19, '1', 'Pencil', '50.00', '0.20', '10.00'),
(39, 19, '2', 'Pen', '100.00', '0.30', '30.00'),
(40, 14, '1', 'Desktop Table', '3.00', '155.00', '465.00'),
(41, 14, '2', 'Chair', '6.50', '67.00', '435.50'),
(42, 18, '1', 'Keyboard', '10.00', '5.00', '50.00'),
(43, 18, '2', 'Mouse', '10.00', '7.00', '70.00');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_user`
--

CREATE TABLE `invoice_user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice_user`
--

INSERT INTO `invoice_user` (`id`, `email`, `password`, `first_name`, `last_name`, `mobile`, `address`) VALUES
(1, 'test@mlarin.ca', '1234567', 'Michael', 'Larin', 604777777, 'Coquitlam, BC');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invoice_order`
--
ALTER TABLE `invoice_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `invoice_user`
--
ALTER TABLE `invoice_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invoice_order`
--
ALTER TABLE `invoice_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `invoice_order_item`
--
ALTER TABLE `invoice_order_item`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `invoice_user`
--
ALTER TABLE `invoice_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
