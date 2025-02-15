-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 15, 2025 at 10:42 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'เครื่องดื่ม'),
(3, 'บุหรี่'),
(4, 'แอลกอฮอล์ล'),
(5, 'น้ำยาทำความสะอาด'),
(6, 'ขนม'),
(7, 'อุปกรณ์ทำความสะอาดร่างกาย'),
(8, 'เครื่องดื่มชูกำลัง');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tel` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `tel`, `email`) VALUES
(1, 'อมรินทร์', 'นุดมะหะมัต', '09658335', 'amarin00@gmail.com'),
(2, 'Bob', 'The Noob', '55533366998', 'bob@mail.com'),
(3, 'hi', 'by', '565656555655', 'hiby@mail.com'),
(4, 'aaa', 'ccc', '888 555 7777 2222', 'jjvkgv@mqfif.com'),
(5, 'cc', 'mm', '00113322556644', 'c-m-c-m@mail.com'),
(6, 'akaka2', 'rororor2', '226322222', '22-hhaaha@mail.com'),
(8, 'a', 'b', '5555555 555555', 'ab@fFf.com'),
(9, 'srg srn', 'frbad', '5511521 5515666', 'zddv@asdg.com'),
(13, 'aha', 'eyeye', '993 88856 555756', 'ahahah@mail.com'),
(16, 'thfn', 'thln', '753 159 258 381', 'ddccdd@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `total_order_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `total_order_amount`) VALUES
(1, 2, NULL, 314.98),
(2, 5, NULL, 1328.92),
(3, 1, NULL, NULL),
(4, NULL, NULL, NULL),
(5, 4, NULL, 20009.3),
(6, 3, '2023-06-14', 3110),
(7, 5, '2023-06-14', 191.99),
(8, 2, '2023-06-14', 122.99),
(9, 4, '2023-06-14', 10751.44),
(11, 3, '2023-06-15', 13062),
(14, 6, '2023-06-15', 6220),
(17, 13, '2023-07-07', 12360),
(18, 9, '2023-07-07', 702531),
(19, 5, '2023-07-07', 1321),
(20, 8, '2023-07-09', 74842),
(24, 5, '2023-07-11', 2238),
(25, 8, '2023-07-12', 110010.95),
(27, 3, '2023-07-12', 5595),
(28, 1, '2025-01-14', 13),
(29, 1, '2025-02-14', 83),
(30, 1, '2025-02-14', 120),
(31, 2, '2025-02-14', 30);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double(10,2) DEFAULT NULL,
  `price_x_quantity` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity`, `price`, `price_x_quantity`) VALUES
(29, 2, 1, 30.00, 30.00),
(29, 4, 1, 38.00, 38.00),
(29, 5, 1, 15.00, 15.00),
(30, 23, 1, 50.00, 50.00),
(30, 24, 1, 70.00, 70.00),
(31, 2, 1, 30.00, 30.00);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `category` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `picture` text NOT NULL,
  `low_stock_threshold` int NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `quantity`, `price`, `description`, `picture`, `low_stock_threshold`) VALUES
(2, 'Coke', 1, 38, 30, '1 L', 'images/products/pic_676532e5bb790.jpg', 5),
(4, 'เบียร์ช้างกระป๋อง', 4, 29, 38, 'เบียร์ช้างกระป๋อง', 'images/products/pic_677fe966be4e5.png', 5),
(5, 'ยาสีฟันคอลเกต', 7, 29, 15, 'ยาสีฟันหลอดเล็ก', 'images/products/pic_677fe92474ec0.jpg', 5),
(6, 'แปรงสีฟัน', 7, 30, 20, 'แปรงสีฟัน', 'images/products/pic_677fe94f7e05a.jpg', 5),
(7, 'ยาสีฟันซอล', 7, 40, 50, 'ยาสีฟันหลอดกลาง', 'images/products/pic_677fe9a2ae90e.jpg', 5),
(8, 'ยาสระผมซัลซิล', 7, 20, 29, 'ยาสระผมซัลซิลสีเขียว', 'images/products/pic_677fe9e7d2255.jpg', 5),
(9, 'ยาสระผมซัลซิล', 7, 20, 29, 'ยาสระผมซัลซิลสีชมพู', 'images/products/pic_677fea2180508.jpg', 5),
(11, 'ยาสระผมซัลซิล', 7, 30, 29, 'สีม่วง', 'images/products/pic_677fea4464b5e.jpg', 5),
(18, 'เบียร์ช้าง', 4, 10, 60, '', 'images/products/pic_676c35cb3f7de.png', 5),
(19, 'เบียร์ลีโอ', 4, 10, 65, 'เบียร์ลีโอขวด', 'images/products/pic_676c39c64eaeb.jpg', 5),
(20, 'เบียร์ลีโอกระป๋อง', 4, 10, 40, 'เบียร์ลีโอกระป๋อง', 'images/products/pic_677c0def6da23.jpg', 5),
(21, 'เบียร์สิงฆ์', 4, 10, 65, 'เบียร์สิงฆ์ขวด', 'images/products/pic_677c11fddf94c.jpg', 5),
(22, 'น้ำล้างจาน', 5, 10, 12, 'ขวดเล็ก', 'images/products/pic_677c1948856c7.jpg', 5),
(23, 'น้ำยาจาน', 5, 9, 50, 'แบบถุง', 'images/products/pic_677c197b23229.jpg', 5),
(24, 'น้ำยาล้างห้องน้ำ', 5, 9, 70, 'เป็ดโปรสีม่วง', 'images/products/pic_677c19bac0c46.jpg', 5),
(25, 'น้ำยาล้างห้องน้ำ', 5, 10, 48, 'วิคซอลสีม่วง', 'images/products/pic_677c19ea803ab.jpg', 5),
(26, 'น้ำยาล้างห้องน้ำ', 5, 10, 48, 'วิคซอลสีทอง', 'images/products/pic_677c1a04a6054.jpg', 5),
(27, 'น้ำยาล้างห้องน้ำ', 5, 10, 48, 'วิคซอลสีชมพู', 'images/products/pic_677c1a27366b2.jpg', 5),
(28, 'โลตัส', 6, 24, 10, 'ขนมขาไก่', 'images/products/pic_677cdfadd870e.jpg', 5),
(29, 'เบนโตะ', 6, 24, 10, 'เบนโตะห่อสีแดง', 'images/products/pic_677cdfd3de14e.jpg', 5),
(30, 'เบนโตะ', 6, 24, 10, 'เบนโตะห่อสีน้ำเงิน', 'images/products/pic_677cdff67b963.jpg', 5),
(31, 'เบน 285', 4, 10, 300, '700 ml', 'images/products/pic_677cfa5232bad.jpg', 5),
(32, 'หงษ์ทอง', 4, 10, 235, '700 ml', 'images/products/pic_677cfa8d1d1af.jpg', 5),
(33, 'หงษ์ทอง', 4, 10, 135, '350 ml', 'images/products/pic_677cfaad5d260.jpg', 5),
(34, 'แสงโสม', 4, 10, 285, '700 ml', 'images/products/pic_677cfad746317.jpg', 5),
(35, 'แสงโสมแบน', 4, 10, 160, '350 ml', 'images/products/pic_677cfafe901dd.jpg', 5),
(36, 'อาชา', 4, 10, 45, 'เบียร์', 'images/products/pic_677cfb289c194.jpg', 5),
(37, 'ยาสระผมซัลซิล', 7, 30, 29, 'สีส้ม', 'images/products/pic_677fea61111c8.jpg', 5),
(38, 'ครีมนวดผมซัลซิล', 7, 30, 29, 'สีเขียว', 'images/products/pic_677fea805edb6.jpg', 5),
(39, 'ครีมนวดผมซัลซิล', 7, 30, 29, 'สีชมพู', 'images/products/pic_677feaa8cbe95.jpg', 5),
(40, 'ครีมนวดผมซัลซิล', 7, 30, 29, 'สีส้ม', 'images/products/pic_677feac585b27.jpg', 5),
(41, 'ครีมนวดผมซัลซิล', 7, 30, 29, 'สีม่วง', 'images/products/pic_677feadd755e3.jpg', 5),
(42, 'ยาสระผมรีจอย', 7, 20, 29, 'สีส้ม', 'images/products/pic_677feb043c9dd.jpg', 5),
(43, 'ยาสระผมรีจอย', 7, 40, 29, 'สีชมพู', 'images/products/pic_677feb24a5eda.jpg', 5),
(44, 'บิ๊กโคล่า', 1, 10, 10, 'บิ็กโคล่าขวด', 'images/products/pic_678613a851690.jpg', 5),
(45, 'สไปร์ท', 1, 10, 13, 'ขวดแก้ว', 'images/products/pic_6786149dd8389.jpg', 5),
(46, 'อิชิตันออแกนิกรีนทีนผสมจมูกข้าวญี่ปุ่น', 1, 10, 20, 'อิชิตัน', 'images/products/pic_6786152218738.jpg', 5),
(47, 'อิชิตันกรีนที', 1, 10, 20, 'อิชิตันกรีนที', 'images/products/pic_678615649c90c.jpg', 5),
(48, 'อิชิตันน้ำผึ้งมะนาว', 1, 10, 20, 'อิชิตันน้ำผึ้งมะนาว', 'images/products/pic_678615b7a3c9a.jpg', 5),
(49, 'โสมพลัส', 8, 10, 12, 'โสมขวดแก้ว', 'images/products/pic_67861a07c5dff.jpg', 5),
(50, 'M150', 8, 10, 12, 'M150', 'images/products/pic_67861b1171a58.jpg', 5),
(51, 'คาราบาว', 8, 10, 12, 'คาราบาว', 'images/products/pic_67861b5f98004.jpg', 5),
(52, 'ลิโพ', 8, 10, 12, 'ลิโพ', 'images/products/pic_67861b84785b8.jpg', 5),
(53, 'กระทิงแดง', 8, 10, 12, 'กระทิงแดง', 'images/products/pic_67861b9d1f9fb.jpg', 5),
(54, 'โสมอินซัม', 8, 10, 12, 'โสมอินซัม', 'images/products/pic_67861bd083c67.jpg', 5),
(56, 'ยาเส้น', 3, 2, 10, 'ยาเส้น', 'images/products/pic_67861c2422ccd.jpg', 5);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `tel` varchar(100) NOT NULL,
  `user_role` varchar(100) NOT NULL,
  `user_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `password`, `tel`, `user_role`, `user_image`) VALUES
(1, 'ceojay', 'supntzx@mail.com', '$2y$10$OGuK0f30YnniGWKmkVHuf.CfsBqCd8QChBohoVCujhXm2mdXXogdS', '0642766987', 'admin', 'images/users/pic_676528d7ee28b.jpg'),
(2, 'wavedev', 'wavedev@mail.com', '$2y$10$UZIfGjEQ/BGMEOU15BtZGepf5KhfUYvvbxR84jyaOX1JJCAWh1NKC', '096-369-6936', 'admin', 'images/users/pic_67652476e38be.jpg'),
(3, 'amarin', 'rystaff@mail.com', '$2y$10$awsnn5KGP0HhcXQI7kVAeu91NHZMD8YWkDR84sy0x2UHg/Qw0dwbG', '099-899-8998', 'employee', 'images/users/pic_676522deb827e.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
