-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2026 at 07:34 AM
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
-- Database: `project_crud3`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog-content`
--

CREATE TABLE `blog-content` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `url_blog` varchar(100) NOT NULL,
  `comment_count` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog-content`
--

INSERT INTO `blog-content` (`id`, `date`, `title`, `image`, `short_description`, `url_blog`, `comment_count`, `created_at`, `updated_at`) VALUES
(1, '2006-02-10', 'asfasfasa', '6a72e6492b6fe_images.jfif', 'sfafasfasf', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', 2, '2026-08-05 07:29:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `my_skills`
--

CREATE TABLE `my_skills` (
  `id` int(11) NOT NULL,
  `skills` varchar(50) NOT NULL,
  `percentage` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `my_skills`
--

INSERT INTO `my_skills` (`id`, `skills`, `percentage`, `created_at`, `updated_at`) VALUES
(1, 'flying in the air', 100, '2026-08-04 07:58:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `job_category` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `article_url` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `title`, `job_category`, `image`, `article_url`, `created_at`, `updated_at`) VALUES
(6, 'sdfasfas', 'fasdfafaf', '6a72c8a588d8b_images.jfif', 'https://github.com/sofiecoffeee?tab=repositories', '2026-08-05 05:22:45', '2026-08-05 05:22:45');

-- --------------------------------------------------------

--
-- Table structure for table `resume`
--

CREATE TABLE `resume` (
  `id` int(11) NOT NULL,
  `year_start` year(4) NOT NULL,
  `year_end` year(4) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `submit_cv` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resume`
--

INSERT INTO `resume` (`id`, `year_start`, `year_end`, `title`, `subtitle`, `description`, `submit_cv`, `created_at`, `update_at`) VALUES
(1, '2020', '2025', 'Product Marketing Operation Lead', 'KAKAO ENTERTAINMENT (KAKAO WEBTOON ID)', 'Plan & set budget monthly webtoon update seasons/end seasons events, new Release webtoon promotions, webtoon to-drama/movie promotion, and thematic theme campaign promotions, Align the communication between the Indonesia Operation Team (Designers, Social Media Specialist, Performance Marketing) and the Korean Business Team for running day-to-day business operations', '', '2026-08-01 07:59:09', '2026-08-03 07:33:09'),
(3, '2019', '2019', 'Internal Communications Officer', 'tiket.com', 'Facilitate to deliver the information or event from various HR divisions ', '', '2026-08-03 07:36:41', NULL),
(4, '2018', '2019', 'Customer Service: Outreach Service', 'Bukalapak', 'Facilitate the internal BukaBantuan’s development offline events (Townhall, Developing Trainings, Fun Music/Movie Nights, Hari Konsumen Nasional Projects), and Internal customer service divisions.', '', '2026-08-03 07:41:31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `service_name` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_name`, `icon`, `is_active`, `created_at`, `update_at`) VALUES
(0, 'Digital Marketing', 'fa-envelope-open', 1, '2026-08-05 01:14:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `website_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ig` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `website_name`, `email`, `phone`, `address`, `description`, `ig`, `created_at`, `update_at`) VALUES
(1, 'www.coba.baru', 'crayonshinchan@gmail.com', '081912189318', 'seluruh kota', 'merupakan teman bermain yang asyik', 'chocobi', '2026-07-30 03:07:43', '2026-07-30 03:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `subtitle` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `button1_text` varchar(30) NOT NULL,
  `button1_link` varchar(50) NOT NULL,
  `button2_text` varchar(30) NOT NULL,
  `button2_link` varchar(50) NOT NULL,
  `image` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `title`, `subtitle`, `description`, `button1_text`, `button1_link`, `button2_text`, `button2_link`, `image`, `is_active`, `created_at`, `updated_at`) VALUES
(30, 'I am Copi', 'Hello! Thanks for visiting my page.', 'Experienced in social media and growth marketing positions, in addition to customer service in a tech company, ', 'Hire Me', 'mailto:sofiecoffe@email.com', 'See My Profile', 'https://linkedin.com/in/sofiecoffe', '6a703a678b6db_banner-3.jpg', 1, '2026-08-03 06:50:10', '2026-08-03 07:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(9) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(56, 'Admin', 'admin@gmail.com', '$2y$12$3PQZDJU98N8vKYlt4wUn6e6B5QyGBeuYjJCkkSPMIdcLg.R6xlGNK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog-content`
--
ALTER TABLE `blog-content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_skills`
--
ALTER TABLE `my_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
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
-- AUTO_INCREMENT for table `blog-content`
--
ALTER TABLE `blog-content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `my_skills`
--
ALTER TABLE `my_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
