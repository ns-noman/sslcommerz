-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 17, 2025 at 08:19 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tools_sslcommerz`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_09_17_052857_create_orders_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `currency` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `email`, `phone`, `amount`, `address`, `status`, `transaction_id`, `currency`) VALUES
(1, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Processing', '68ca5166ca126', 'BDT'),
(2, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '68ca5313615d2', 'BDT'),
(3, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '68ca53cef27c1', 'BDT'),
(4, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 1200, 'Customer Address', 'Pending', '68ca53d650db2', 'BDT'),
(5, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Processing', '68ca56bcafa1b', 'BDT'),
(6, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 1200, 'Customer Address', 'Processing', '68ca571760897', 'BDT'),
(7, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 1200, 'Customer Address', 'Pending', '68ca5984d0ddc', 'BDT'),
(8, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Pending', '68ca59a4a14a5', 'BDT'),
(9, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 10, 'Customer Address', 'Processing', '68ca59b28125e', 'BDT'),
(10, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 1200, 'Customer Address', 'Pending', '68ca5a8eace05', 'BDT'),
(11, 'Customer Name', 'customer@mail.com', '8801XXXXXXXXX', 1200, 'Customer Address', 'Processing', '68ca5d61eb71d', 'BDT');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` bigint UNSIGNED NOT NULL,
  `tran_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `currency` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `cus_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_add1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_add2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cus_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_add1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_add2` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_profile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_a` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_b` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_c` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value_d` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `tran_id`, `total_amount`, `currency`, `status`, `cus_name`, `cus_email`, `cus_add1`, `cus_add2`, `cus_city`, `cus_state`, `cus_postcode`, `cus_country`, `cus_phone`, `cus_fax`, `ship_name`, `ship_add1`, `ship_add2`, `ship_city`, `ship_state`, `ship_postcode`, `ship_phone`, `ship_country`, `shipping_method`, `product_name`, `product_category`, `product_profile`, `value_a`, `value_b`, `value_c`, `value_d`, `created_at`, `updated_at`) VALUES
(1, '68ca4e67a3333', '0.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL),
(2, '68ca4e9aad28d', '10.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL),
(3, '68ca4ea387b62', '10.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL),
(4, '68ca4f04c31d6', '10.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL),
(5, '68ca507437c02', '10.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL),
(6, '68ca508aa375d', '10.00', 'BDT', 'Pending', 'John Doe', 'you@example.com', '93 B, New Eskaton Road', '', '', '', '', 'Bangladesh', '01711xxxxxx', '', 'Store Test', 'Dhaka', 'Dhaka', 'Dhaka', 'Dhaka', '1000', '', 'Bangladesh', 'NO', 'Computer', 'Goods', 'physical-goods', 'ref001', 'ref002', 'ref003', 'ref004', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_transaction_id_unique` (`tran_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
