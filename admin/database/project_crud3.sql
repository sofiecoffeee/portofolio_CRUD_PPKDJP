-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2026 at 09:10 PM
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
  `uploader` varchar(50) NOT NULL,
  `url_blog` varchar(100) NOT NULL,
  `comment_count` int(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_content`
--

INSERT INTO `blog_content` (`id`, `date`, `title`, `image`, `short_description`, `uploader`, `url_blog`, `comment_count`, `created_at`, `updated_at`) VALUES
(1, '2021-05-05', 'Being Woman in Tech Industry: A Journey on Bukalapak Hack-a-Fun 2018', '6a74c4c5a27d8_Hack-a-fun.jpg', 'I never imagined winning a competition in the field of technology, especially with my conventional economics-management background...', 'Sofia', 'https://github.com/sofiecoffeee/portofolio_CRUD_PPKDJP', 1000, '2026-08-05 07:29:13', '2026-08-06 17:58:06'),
(3, '2024-12-17', 'Being Women in Tech Industry Part 2: Discovering Communities.', '6a749e8ee5f48__MG_4095.JPG', 'I started to look for the womens communities to see the STEM perspective without any awkward approach, which is better for deep discussions of women by women. Randomly, @generationgirl Instagram, organized by Yayasan Generasi Maju Berkarya', 'Sofia', 'https://www.linkedin.com/feed/update/urn:li:activity:7257291087902322688/', 100, '2026-08-06 14:47:42', '2026-08-06 17:58:01'),
(4, '2025-07-06', 'Traveling Alone: A Story of Growth', '6a749f41332ea_1755703133883.jpg', 'Sharing with the biggest english community in Jakarta, Britzone. From a heartbreak, pandemic loneliness to standing as a class conductors, who would have thought?', 'Sofia', 'https://www.linkedin.com/posts/sofiecoffe_sharing-community-britzone-ugcPost-7363952705796526080-CBH', 120, '2026-08-06 14:50:41', '2026-08-06 17:57:53');

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

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `update_at`) VALUES
(1, 'test', 'sofiecoffe@gmail.com', 'asasd', 'DadAADAdad', '2026-08-06 18:56:52', NULL),
(2, 'hello', 'sofiecoffe@gmail.com', 'ini test', 'test bsia ga', '2026-08-06 18:59:57', NULL);

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
(1, 'Meta Ads Manager', 70, '2026-08-04 07:58:55', '2026-08-05 11:49:54'),
(7, 'TikTok Ads Manager', 70, '2026-08-05 11:50:04', NULL),
(8, 'HTML/CSS', 60, '2026-08-05 11:50:19', NULL),
(9, 'PHP', 50, '2026-08-05 11:50:26', NULL);

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
(6, 'BukaPuasa', 'Web Development', '6a749706b6b3e_BukaPuasa.jpg', 'https://www.linkedin.com/posts/sofiecoffe_womanintech-techinnovation-hackathon-share-690753808392798', '2026-08-05 05:22:45', '2026-08-06 14:15:34'),
(7, 'BukaBantuan e-Learning', 'Web Development', '6a732683d0510_csm_inovation.jpeg', 'https://dribbble.com/shots/11099158-BukaBantuan-e-Learning', '2026-08-05 12:03:15', '2026-08-05 12:03:15'),
(8, 'KAKAO WEBTOON App Gamification', 'Product Growth', '6a7326ffb585d_project_ramalan.png', 'https://webtoon.kakao.com/', '2026-08-05 12:05:19', '2026-08-05 12:05:19'),
(9, 'UMKM Branding', 'Branding Design', '6a73276a8a6aa_Branding.webp', 'https://dribbble.com/shots/15111404-Promotion-Material-Design', '2026-08-05 12:07:06', '2026-08-05 12:07:06'),
(10, 'Ganteng-Ganteng Iblis: App Gamification', 'Product Growth', '6a7327ade6a42_Project_ganteng-ganteng-iblis.png', 'https://webtoon.kakao.com/', '2026-08-05 12:08:13', '2026-08-05 12:09:13'),
(11, 'SunMoRi: App Gamification', 'Product Growth', '6a7327dd76c20_project-sunmori.png', 'https://webtoon.kakao.com/', '2026-08-05 12:09:01', '2026-08-05 12:09:17');

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
(3, '2019', '2020', 'Internal Communications Officer', 'tiket.com', 'Managed all internal announcements, events, and quarterly plans for all employees through various internal communication channels. Managed the career site in collaboration with the Talent Acquisition and Employer Branding teams.', '', '2026-08-03 07:36:41', '2026-08-06 14:54:56'),
(4, '2018', '2019', 'Customer Service: Outreach Service', 'Bukalapak', 'Managed Bukalapak Customer Service internal Instagram account (@csmheroes), creating engagement-driven content that strengthened employee participation and internal branding initiatives. Coordinated employee engagement events, including town halls, training programs, and company activities, while supporting marketing campaigns and brand promotions across TV and social media.', '', '2026-08-03 07:41:31', '2026-08-06 14:58:37'),
(5, '2025', '2026', 'Marketing Specialist', 'BiliBili (Bstation Indonesia', 'Developed and executed localized social media strategies for Facebook and Instagram to increase brand awareness, audience engagement, and follower growth in Indonesia. Planned integrated marketing campaigns, collaborated with business partners on co-branded activations, and analyzed campaign performance to optimize content strategies based on data insights.', '', '2026-08-05 11:35:24', '2026-08-06 14:57:10');

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
(1, 'Research & Data Analysis', 'flaticon-flasks', 1, '2026-08-05 01:14:06', '2026-08-06 16:27:18'),
(2, 'Campaign Planner', 'flaticon-ideas', 1, '2026-08-05 11:38:29', '2026-08-06 16:34:36'),
(3, 'Growth Marketing', 'flaticon-analysis', 1, '2026-08-05 11:41:41', '2026-08-06 16:32:33'),
(4, 'Product Management', 'flaticon-ux-design', 1, '2026-08-05 11:43:37', '2026-08-06 16:13:16'),
(5, 'Digital Marketing', 'flaticon-idea', 1, '2026-08-05 11:44:22', '2026-08-06 16:42:44'),
(6, 'Social Media Management', 'flaticon-web-design', 1, '2026-08-05 11:45:43', '2026-08-06 16:02:26');

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
(1, 'www.sofiecoffe.com', 'sofiecoffe@gmail.com', '081912189318', 'Jakarta, Indonesia', 'Passionate about creating impactful digital experiences through creativity, innovation, and continuous learning.', '@sofiecoffe', '2026-07-30 03:07:43', '2026-08-06 14:50:59');

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
(30, 'Growth Marketer', 'HELLO I AM SOFIA', 'Based in Jakarta', 'Explore Projects', 'https://dribbble.com/sofiecoffe', 'My Work', 'https://linkedin.com/in/sofiecoffe', '6a73622b2451d_project-sunmori.png', 1, '2026-08-03 06:50:10', '2026-08-05 16:56:43'),
(34, 'Growth Marketer', 'HELLO I AM SOFIA', ' Based in Jakarta', 'Explore Projects', 'https://id.linkedin.com/in/sofiecoffe', 'My Work', 'https://dribbble.com/sofiecoffe', '6a73621e893fd_project_ramalan.png', 1, '2026-08-05 07:41:08', '2026-08-05 16:55:00'),
(35, 'Growth Marketer', 'HELLO I AM SOFIA', 'Based in Jakarta', 'Explore Projects', 'https://id.linkedin.com/in/sofiecoffe', 'My Work', 'https://dribbble.com/sofiecoffe', '6a736c1c3710c_img.jpg.png', 1, '2026-08-05 16:57:31', '2026-08-05 17:00:12'),
(36, 'Growth Marketers', 'HELLO I AM SOFIA', 'Based in Jakarta', 'Explore Projects', 'https://id.linkedin.com/in/sofiecoffe', 'My Work', 'https://id.linkedin.com/in/sofiecoffe', '6a736bec9d0d2_project-tirck_or_read.png', 1, '2026-08-05 16:59:24', NULL);

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
(56, 'Admin', 'admin@gmail.com', '$2y$12$3PQZDJU98N8vKYlt4wUn6e6B5QyGBeuYjJCkkSPMIdcLg.R6xlGNK'),
(59, 'Sofia Han', 'sofiecoffe@gmail.com', '$2y$10$VESIbKSlpY7TzVV9p1e6CeFq5mehKVWbooGrAkMS/2ZAFSRkqIEqS');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `my_skills`
--
ALTER TABLE `my_skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `resume`
--
ALTER TABLE `resume`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
