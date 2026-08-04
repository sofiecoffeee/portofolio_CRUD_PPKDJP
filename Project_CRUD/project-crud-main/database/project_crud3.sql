-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2026 at 05:03 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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
-- Table structure for table `blog_content`
--

CREATE TABLE `blog_content` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `short_description` varchar(255) DEFAULT NULL,
  `url_blog` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_content`
--

INSERT INTO `blog_content` (`id`, `date`, `title`, `image`, `short_description`, `url_blog`, `created_at`, `updated_at`) VALUES
(1, '2026-08-12', 'tets', 'Array,', '', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', '2026-08-04 14:49:22', NULL),
(2, '2027-08-12', 'aasfsaf', 'Array,', '', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', '2026-08-04 14:50:19', NULL),
(3, '2007-07-07', 'test3', 'Array,', '', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', '2026-08-04 14:52:00', NULL),
(4, '2022-02-22', 'tets', 'Array,', '', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', '2026-08-04 14:57:21', NULL);

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
-- Table structure for table `job_category`
--

CREATE TABLE `job_category` (
  `id` int(11) NOT NULL,
  `name_category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_category`
--

INSERT INTO `job_category` (`id`, `name_category`) VALUES
(1, 'Web Design'),
(2, 'UI/UX Design'),
(3, 'Branding & Identity'),
(4, 'Graphic Design'),
(5, 'Motion Graphics'),
(6, '3D Modeling & Animation'),
(7, 'Video Editing'),
(8, 'Photography & Videography'),
(9, 'Illustrator & Digital Art'),
(10, 'Front-End Web Development'),
(11, 'Back-End Web Development'),
(12, 'Full-Stack Development'),
(13, 'Mobile Apps Development'),
(14, 'Game Development'),
(15, 'Social Media Specialist'),
(16, 'Digital Marketing & SEO'),
(17, 'Copywriting & Content Writing'),
(18, 'DevOps Engineering'),
(19, 'Data Science & Analytics'),
(20, 'Cyber Security');

-- --------------------------------------------------------

--
-- Table structure for table `my_skills`
--

CREATE TABLE `my_skills` (
  `id` int(11) NOT NULL,
  `skills` varchar(50) NOT NULL,
  `percentage` int(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `my_skills`
--

INSERT INTO `my_skills` (`id`, `skills`, `percentage`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'Digital Marketing', 100, 1, '2026-08-04 11:43:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `job_category` int(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(2, '2025', '2026', 'Marketing Specialist', 'bilibili Group', 'Manage social media platforms (TikTok, Instagram, X, Facebook) with 98%+ follower growth and significant increase in engagement and impressions, Collaborate with cross-functional teams to promote platform features and culturally relevant content\r\n\r\nStrengthen community collaboration through, Japan-Anime Interested media, and community-fandom through content and campaigns', '', '2026-08-01 08:16:41', '2026-08-03 07:31:25'),
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
(4, 'test', 'fa-pixel fa-regular fa-file', 1, '2026-08-04 11:43:00', NULL);

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
(1, 'www.coba.baru', 'crayonshinchan@gmail.com', '081912189318', 'seluruh kota', 'merupakan teman bermain yang asyik', '@chocobi', '2026-07-30 03:07:43', '2026-08-04 11:14:11');

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
(19, 'Gadis gemoy', 'mencaricintasejati@gmail.com', '$2y$12$aGaXuYh5JwBV72JnQac0cOSVnWEmgAY.MgEVozKtdWy6F5wC4kWvS'),
(41, 'test', 'testaja@gmail.com', '$2y$12$cPlMp0of5VWLJj4gmZFlzOG1ZLe4Fggomyh97f.G.iRjQvZ8IlqaW');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_content`
--
ALTER TABLE `blog_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_category`
--
ALTER TABLE `job_category`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`job_category`);

--
-- Indexes for table `resume`
--
ALTER TABLE `resume`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
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
-- AUTO_INCREMENT for table `blog_content`
--
ALTER TABLE `blog_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_category`
--
ALTER TABLE `job_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `my_skills`
--
ALTER TABLE `my_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`job_category`) REFERENCES `job_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
