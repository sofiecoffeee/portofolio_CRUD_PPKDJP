-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2026 at 12:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_crud`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(3) NOT NULL,
  `category_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`) VALUES
(3, 'All Menus'),
(1, 'Makanan'),
(2, 'Minuman');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `customer_name`, `phone`, `address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dhika', '0899999999', 'Dhika cipinang', '2026-07-06 01:22:00', '2026-07-06 01:22:11', '2026-07-06 01:22:11'),
(2, 'Akbar', '08787888909', 'Akbar matraman', '2026-07-06 01:22:54', '2026-07-06 01:23:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` smallint(5) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `level_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', '2026-07-06 01:07:05', '2026-07-06 01:07:05', NULL),
(2, 'Operator', '2026-07-06 01:07:05', '2026-07-06 01:07:05', NULL),
(3, 'Pimpinan', '2026-07-06 01:07:05', '2026-07-06 01:07:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(3) NOT NULL,
  `parent_id` int(3) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `url`, `icon`, `sort_order`, `is_active`) VALUES
(2, NULL, 'Dashboard', '?page=dashboard', 'bx-home-circle', 1, 1),
(3, NULL, 'Master Data', '', 'bx-collection', 2, 1),
(4, 3, 'Users', '?page=user', 'bx-user', 3, 1),
(5, 3, 'Roles', '?page=role', '', 1, 1),
(7, NULL, 'Category', '?page=category', 'bx-category', 3, 1),
(8, 3, 'Menu', '?page=menu', 'bx-menu', 3, 1),
(9, NULL, 'Product', '?page=product', 'bx bx-box', 4, 1),
(10, NULL, 'Transaction', '?page=transaction', 'bx bx-wallet', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_01_01_000001_create_levels_table', 1),
(5, '2024_01_01_000002_add_level_id_to_users_table', 1),
(6, '2024_01_01_000003_create_customers_table', 1),
(7, '2024_01_01_000004_create_services_table', 1),
(8, '2024_01_01_000005_create_trans_orders_table', 1),
(9, '2024_01_01_000006_create_trans_order_details_table', 1),
(10, '2024_01_01_000007_create_trans_laundry_pickups_table', 1),
(11, '2024_07_06_000008_change_qty_to_decimal_in_trans_order_details', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(3) NOT NULL,
  `order_no` varchar(50) NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `subtotal` decimal(12,2) NOT NULL,
  `tax` decimal(12,2) NOT NULL,
  `discount` decimal(12,2) NOT NULL,
  `total_bill` decimal(12,2) NOT NULL,
  `cash_received` decimal(12,2) NOT NULL,
  `cash_change` decimal(12,2) NOT NULL,
  `payment_status` enum('SUCCESS','PENDING') NOT NULL DEFAULT 'PENDING',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_no`, `customer_name`, `payment_method`, `subtotal`, `tax`, `discount`, `total_bill`, `cash_received`, `cash_change`, `payment_status`, `created_at`) VALUES
(1, 'ORD-20260602-3932', 'sasa', 'CASH', 30000.00, 3000.00, 0.00, 0.00, 0.00, 0.00, '', '2026-06-02 02:29:09'),
(2, 'ORD-20260602-4769', 'riri', 'CASH', 30000.00, 3000.00, 0.00, 0.00, 0.00, 0.00, '', '2026-06-02 02:53:31'),
(3, 'ORD-20260602-8059', 'fifi', 'CASH', 60000.00, 6000.00, 0.00, 66000.00, 0.00, 0.00, '', '2026-06-02 07:51:52'),
(4, 'ORD-20260602-5294', 'fifi', 'CASH', 60000.00, 6000.00, 0.00, 66000.00, 0.00, 0.00, '', '2026-06-02 07:52:43'),
(5, 'ORD-20260602-4594', 'fifi', 'CASH', 60000.00, 6000.00, 0.00, 66000.00, 0.00, 0.00, 'PENDING', '2026-06-02 07:53:30'),
(6, 'ORD-20260602-7558', 'fifi', 'CASH', 60000.00, 6000.00, 0.00, 66000.00, 0.00, 0.00, 'PENDING', '2026-06-02 07:55:39'),
(7, 'ORD-20260602-1024', 'fifi', 'CASH', 60000.00, 6000.00, 0.00, 66000.00, 0.00, 0.00, 'PENDING', '2026-06-02 07:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(3) NOT NULL,
  `order_id` int(50) NOT NULL,
  `product_id` int(45) NOT NULL,
  `product_name` int(45) NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `quantity` int(4) NOT NULL,
  `total_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `product_name`, `price`, `quantity`, `total_price`) VALUES
(1, 2, 1, 0, 30000.00, 1, 30000.00),
(2, 3, 2, 0, 15000.00, 1, 15000.00),
(3, 4, 2, 0, 15000.00, 1, 15000.00),
(4, 5, 2, 0, 15000.00, 1, 15000.00),
(5, 6, 2, 0, 15000.00, 1, 15000.00),
(6, 7, 2, 0, 15000.00, 1, 15000.00);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(3) NOT NULL,
  `category_id` int(3) NOT NULL,
  `product_image` varchar(150) DEFAULT NULL,
  `product_name` varchar(35) NOT NULL,
  `qty` int(3) NOT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_active` tinyint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_image`, `product_name`, `qty`, `price`, `unit`, `description`, `is_active`) VALUES
(1, 1, '1779779749_hazelnut chocloate.jpg', 'Dubai Chewy Cookie', 5, 30000, 'pcs', '', 1),
(2, 1, '1779779330_hazelnut chocloate.jpg', 'Goguma Ppang', 3, 15000, 'pcs', '', 1),
(4, 2, '1779779290_hazelnut chocloate.jpg', 'Thai Tea', 15, 18000, 'pcs', '', 1),
(5, 1, '1779779153_hazelnut chocloate.jpg', 'Misoa Ayam Bawang', 2, 45000, 'pcs', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `is_active`, `description`) VALUES
(2, 'Anton', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `price`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Cuci + Gosok', 5000, 'Layanan cuci dan gosok pakaian', '2026-07-06 01:07:06', '2026-07-06 01:33:56', NULL),
(2, 'Hanya Cuci', 4500, 'Layanan cuci pakaian saja', '2026-07-06 01:07:06', '2026-07-06 01:07:06', NULL),
(3, 'Hanya Gosok', 5000, 'Layanan gosok pakaian saja', '2026-07-06 01:07:06', '2026-07-06 01:07:06', NULL),
(4, 'Laundry Besar', 7000, 'Layanan laundry untuk barang besar seperti selimut, bed cover', '2026-07-06 01:07:06', '2026-07-06 01:07:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_laundry_pickups`
--

CREATE TABLE `trans_laundry_pickups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `pickup_date` datetime NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trans_laundry_pickups`
--

INSERT INTO `trans_laundry_pickups` (`id`, `order_id`, `customer_id`, `pickup_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2026-07-06 08:35:31', NULL, '2026-07-06 01:35:31', '2026-07-06 01:35:31');

-- --------------------------------------------------------

--
-- Table structure for table `trans_orders`
--

CREATE TABLE `trans_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `order_date` date NOT NULL,
  `order_end_date` date DEFAULT NULL,
  `order_status` tinyint(4) NOT NULL DEFAULT 0,
  `order_pay` int(11) NOT NULL DEFAULT 0,
  `order_change` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trans_orders`
--

INSERT INTO `trans_orders` (`id`, `customer_id`, `order_code`, `order_date`, `order_end_date`, `order_status`, `order_pay`, `order_change`, `total`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'INV-6A4B67ACB4411', '2026-07-06', '2026-07-06', 1, 20000, 5500, 14500, '2026-07-06 01:30:36', '2026-07-06 01:35:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `trans_order_details`
--

CREATE TABLE `trans_order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trans_order_details`
--

INSERT INTO `trans_order_details` (`id`, `order_id`, `service_id`, `qty`, `subtotal`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2.90, 14500.00, NULL, '2026-07-06 01:30:36', '2026-07-06 01:30:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(3) NOT NULL,
  `name` varchar(55) NOT NULL,
  `email` varchar(35) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(1, 'Anton', 'admin1@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(4, 'sehun', 'sehun@gmail.com', '12041994'),
(5, 'Chanyeol', 'chanyeol@gmail.com', '48058e0c99bf7d689ce71c360699a14ce2f99774'),
(6, 'Alya Fatihah', 'alyafatihah11@gmail.com', '4cc19aaff8'),
(7, 'shinb', 'shinb@gmail.com', '7ab515d12bd2cf431745511ac4ee13fed15ab578'),
(8, 'apalahwpini', 'apalahwpini@gmail.com', 'apalahwpini');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_to_order_details` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_to_categories` (`category_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `orders_to_order_details` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_to_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
