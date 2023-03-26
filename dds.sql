-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Mar 26, 2023 at 04:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dds`
--

-- --------------------------------------------------------

--
-- Table structure for table `dds_customer`
--

CREATE TABLE `dds_customer` (
  `CUSTOMER_RK` int(11) NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `VALID_TO_DTTM` datetime NOT NULL,
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` char(30) DEFAULT NULL,
  `WORKING_AREA` varchar(35) NOT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` int(12) DEFAULT NULL,
  `OPENING_AMT` int(12) NOT NULL,
  `RECEIVE_AMT` int(12) NOT NULL,
  `PAYMENT_AMT` int(12) NOT NULL,
  `OUTSTANDING_AMT` int(12) NOT NULL,
  `PHONE_NO` varchar(10) NOT NULL,
  `AGENT_CODE` char(6) NOT NULL,
  `VALID_FROM_DTTM` datetime DEFAULT NULL,
  `PROCESSED_DTTM` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dds_customer`
--

INSERT INTO `dds_customer` (`CUSTOMER_RK`, `CUST_CODE`, `VALID_TO_DTTM`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`, `VALID_FROM_DTTM`, `PROCESSED_DTTM`) VALUES
(1, 'C00001', '2023-03-26 20:12:31', 'AAAA', 'New York', 'New York', 'USA', 2, 3000, 5000, 2000, 6000, 'CCCCCCC', 'A008', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(1, 'C00001', '5999-01-12 00:00:00', 'krupal', 'New York', 'New York', 'USA', 2, 3000, 5000, 2000, 6000, 'CCCCCCC', 'A008', '2023-03-26 20:12:31', '2023-03-26 20:12:31'),
(2, 'C00002', '5999-01-12 00:00:00', 'Bolt', 'New York', 'New York', 'USA', 3, 5000, 7000, 9000, 3000, 'DDNRDRH', 'A008', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(3, 'C00003', '5999-01-12 00:00:00', 'Martin', 'Torento', 'Torento', 'Canada', 2, 8000, 7000, 7000, 8000, 'MJYURFD', 'A004', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(4, 'C00004', '5999-01-12 00:00:00', 'Winston', 'Brisban', 'Brisban', 'Australia', 1, 5000, 8000, 7000, 6000, 'AAAAAAA', 'A005', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(5, 'C00005', '5999-01-12 00:00:00', 'Sasikant', 'Mumbai', 'Mumbai', 'India', 1, 7000, 11000, 7000, 11000, '147-258963', 'A002', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(6, 'C00006', '5999-01-12 00:00:00', 'Shilton', 'Torento', 'Torento', 'Canada', 1, 10000, 7000, 6000, 11000, 'DDDDDDD', 'A004', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(7, 'C00007', '5999-01-12 00:00:00', 'Ramanathan', 'Chennai', 'Chennai', 'India', 1, 7000, 11000, 9000, 9000, 'GHRDWSD', 'A010', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(8, 'C00008', '5999-01-12 00:00:00', 'Karolina', 'Torento', 'Torento', 'Canada', 1, 7000, 7000, 9000, 5000, 'HJKORED', 'A004', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(9, 'C00009', '5999-01-12 00:00:00', 'Ramesh', 'Mumbai', 'Mumbai', 'India', 3, 8000, 7000, 3000, 12000, 'Phone No', 'A002', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(10, 'C00010', '5999-01-12 00:00:00', 'Charles', 'Hampshair', 'Hampshair', 'UK', 3, 6000, 4000, 5000, 5000, 'MMMMMMM', 'A009', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(11, 'C00011', '5999-01-12 00:00:00', 'Sundariya', 'Chennai', 'Chennai', 'India', 3, 7000, 11000, 7000, 11000, 'PPHGRTS', 'A010', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(12, 'C00012', '5999-01-12 00:00:00', 'Steven', 'San Jose', 'San Jose', 'USA', 1, 5000, 7000, 9000, 3000, 'KRFYGJK', 'A012', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(13, 'C00013', '5999-01-12 00:00:00', 'Holmes', 'London', 'London', 'UK', 2, 6000, 5000, 7000, 4000, 'BBBBBBB', 'A003', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(14, 'C00014', '5999-01-12 00:00:00', 'Rangarappa', 'Bangalore', 'Bangalore', 'India', 2, 8000, 11000, 7000, 12000, 'AAAATGF', 'A001', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(15, 'C00015', '5999-01-12 00:00:00', 'Stuart', 'London', 'London', 'UK', 1, 6000, 8000, 3000, 11000, 'GFSGERS', 'A003', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(16, 'C00016', '5999-01-12 00:00:00', 'Venkatpati', 'Bangalore', 'Bangalore', 'India', 2, 8000, 11000, 7000, 12000, 'JRTVFDD', 'A007', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(17, 'C00017', '5999-01-12 00:00:00', 'Srinivas', 'Bangalore', 'Bangalore', 'India', 2, 8000, 4000, 3000, 9000, 'AAAAAAB', 'A007', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(18, 'C00018', '5999-01-12 00:00:00', 'Fleming', 'Brisban', 'Brisban', 'Australia', 2, 7000, 7000, 9000, 5000, 'NHBGVFC', 'A005', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(19, 'C00019', '5999-01-12 00:00:00', 'Yearannaidu', 'Chennai', 'Chennai', 'India', 1, 8000, 7000, 7000, 8000, 'ZZZZBFV', 'A010', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(20, 'C00020', '5999-01-12 00:00:00', 'Albert', 'New York', 'New York', 'USA', 3, 5000, 7000, 6000, 6000, 'BBBBSBB', 'A008', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(21, 'C00021', '5999-01-12 00:00:00', 'Jacks', 'Brisban', 'Brisban', 'Australia', 1, 7000, 7000, 7000, 7000, 'WERTGDF', 'A005', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(22, 'C00022', '5999-01-12 00:00:00', 'Avinash', 'Mumbai', 'Mumbai', 'India', 2, 7000, 11000, 9000, 9000, '113-123456', 'A002', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(23, 'C00023', '5999-01-12 00:00:00', 'Karl', 'London', 'London', 'UK', 0, 4000, 6000, 7000, 3000, 'AAAABAA', 'A006', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(24, 'C00024', '5999-01-12 00:00:00', 'Cook', 'London', 'London', 'UK', 2, 4000, 9000, 7000, 6000, 'FSDDSDF', 'A006', '2023-03-26 20:12:08', '2023-03-26 20:12:08'),
(25, 'C00025', '5999-01-12 00:00:00', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000, 7000, 4000, 8000, 'AVAVAVA', 'A011', '2023-03-26 20:12:08', '2023-03-26 20:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `dds_customer_inc`
--

CREATE TABLE `dds_customer_inc` (
  `CUSTOMER_RK` int(11) NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `VALID_TO_DTTM` datetime NOT NULL,
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` char(30) DEFAULT NULL,
  `WORKING_AREA` varchar(35) NOT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` int(12) DEFAULT NULL,
  `OPENING_AMT` int(12) NOT NULL,
  `RECEIVE_AMT` int(12) NOT NULL,
  `PAYMENT_AMT` int(12) NOT NULL,
  `OUTSTANDING_AMT` int(12) NOT NULL,
  `PHONE_NO` varchar(10) NOT NULL,
  `AGENT_CODE` char(6) NOT NULL,
  `VALID_FROM_DTTM` datetime DEFAULT NULL,
  `PROCESSED_DTTM` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dds_customer_inc`
--

INSERT INTO `dds_customer_inc` (`CUSTOMER_RK`, `CUST_CODE`, `VALID_TO_DTTM`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`, `VALID_FROM_DTTM`, `PROCESSED_DTTM`) VALUES
(1, 'C00013', '5999-01-01 00:00:00', 'Holmes', 'London', 'London', 'UK', 2, 6000, 5000, 7000, 4000, 'BBBBBBB', 'A003', '2023-03-26 00:00:00', '2023-03-26 14:55:56'),
(2, 'C00001', '5999-01-01 00:00:00', 'Micheal', 'New York', 'New York', 'USA', 2, 3000, 5000, 2000, 6000, 'CCCCCCC', 'A008', '2023-03-26 00:00:00', '2023-03-26 14:59:58'),
(3, 'C00020', '5999-01-01 00:00:00', 'Albert', 'New York', 'New York', 'USA', 3, 5000, 7000, 6000, 6000, 'BBBBSBB', 'A008', '2023-03-26 00:00:00', '2023-03-26 14:59:58'),
(4, 'C00025', '5999-01-01 00:00:00', 'Ravindran', 'Bangalore', 'Bangalore', 'India', 2, 5000, 7000, 4000, 8000, 'AVAVAVA', 'A011', '2023-03-26 00:00:00', '2023-03-26 14:59:58'),
(5, 'C00024', '5999-01-01 00:00:00', 'Cook', 'London', 'London', 'UK', 2, 4000, 9000, 7000, 6000, 'FSDDSDF', 'A006', '2023-03-26 00:00:00', '2023-03-26 14:59:58'),
(6, 'C00015', '5999-01-01 00:00:00', 'Stuart', 'London', 'London', 'UK', 1, 6000, 8000, 3000, 11000, 'GFSGERS', 'A003', '2023-03-26 00:00:00', '2023-03-26 14:59:58'),
(7, 'C00002', '5999-01-01 00:00:00', 'Bolt', 'New York', 'New York', 'USA', 3, 5000, 7000, 9000, 3000, 'DDNRDRH', 'A008', '2023-03-26 00:00:00', '2023-03-26 14:59:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dds_customer`
--
ALTER TABLE `dds_customer`
  ADD PRIMARY KEY (`CUSTOMER_RK`,`VALID_TO_DTTM`);

--
-- Indexes for table `dds_customer_inc`
--
ALTER TABLE `dds_customer_inc`
  ADD PRIMARY KEY (`CUSTOMER_RK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dds_customer`
--
ALTER TABLE `dds_customer`
  MODIFY `CUSTOMER_RK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `dds_customer_inc`
--
ALTER TABLE `dds_customer_inc`
  MODIFY `CUSTOMER_RK` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
