-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 29, 2018 at 08:57 PM
-- Server version: 5.6.37
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE IF NOT EXISTS `bills` (
  `id` int(10) unsigned NOT NULL,
  `date_order` date NOT NULL,
  `total` char(20) NOT NULL,
  `note` longtext NOT NULL,
  `check_order` int(1) DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `date_order`, `total`, `note`, `check_order`, `customer_id`, `created_at`, `updated_at`) VALUES
(1, '2018-03-14', '1,007,930.00', ' ', 0, 1, '2018-03-13 21:08:37', '2018-03-13 21:08:37'),
(2, '2018-03-14', '7,744,000.00', 'abc', 0, 2, '2018-03-13 21:29:47', '2018-03-13 21:29:47'),
(3, '2018-03-14', '9,868,760.00', 'dfasdfasdfasdf', 1, 3, '2018-03-13 23:50:57', '2018-03-13 23:58:36');

-- --------------------------------------------------------

--
-- Table structure for table `bill_details`
--

CREATE TABLE IF NOT EXISTS `bill_details` (
  `id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `bill_id` int(10) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bill_details`
--

INSERT INTO `bill_details` (`id`, `product_id`, `bill_id`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 21, 1, 1, 833000, '2018-03-13 21:08:37', '2018-03-13 21:08:37'),
(3, 25, 2, 1, 4000000, '2018-03-13 21:29:47', '2018-03-13 21:29:47'),
(4, 21, 3, 2, 1666000, '2018-03-13 23:50:57', '2018-03-13 23:50:57'),
(5, 25, 3, 1, 4000000, '2018-03-13 23:50:57', '2018-03-13 23:50:57'),
(6, 23, 3, 1, 2490000, '2018-03-13 23:50:57', '2018-03-13 23:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `cates`
--

CREATE TABLE IF NOT EXISTS `cates` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `order` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cates`
--

INSERT INTO `cates` (`id`, `name`, `alias`, `order`, `parent_id`, `keywords`, `description`, `created_at`, `updated_at`) VALUES
(12, 'Giày sneakers', 'giay-sneakers', 10, 0, 'Giày sneakers', 'Giày sneakers', '2018-03-06 09:43:48', '2018-03-06 09:43:48'),
(13, 'Giày sneakers nam', 'giay-sneakers-nam', 10, 12, 'Giày sneakers nam', 'Giày sneakers nam', '2018-03-06 09:44:10', '2018-03-06 09:44:10'),
(14, 'Giày sneakers nữ', 'giay-sneakers-nu', 10, 12, 'Giày sneakers nữ', 'Giày sneakers nữ', '2018-03-06 09:44:54', '2018-03-06 09:44:54'),
(15, 'Giày sandal', 'giay-sandal', 10, 0, 'Giày Sandal', 'Giày Sandal', '2018-03-06 09:47:47', '2018-03-06 09:48:30'),
(16, 'Giày sandal nam', 'giay-sandal-nam', 10, 15, 'Giày sandal nam', 'Giày sandal nam', '2018-03-06 09:48:21', '2018-03-06 09:48:21'),
(17, 'Giày sandal nữ', 'giay-sandal-nu', 10, 15, 'Giày sandal nữ', 'Giày sandal nữ', '2018-03-06 09:48:52', '2018-03-06 09:48:52'),
(18, 'Giày boot', 'giay-boot', 10, 0, 'Giày boot', 'Giày boot', '2018-03-06 09:49:58', '2018-03-06 09:49:58'),
(19, 'Giày boot nam', 'giay-boot-nam', 10, 18, 'Giày boot nam', 'Giày boot nam', '2018-03-06 09:50:17', '2018-03-06 09:50:49'),
(20, 'Giày boot nữ', 'giay-boot-nu', 11, 18, 'Giày boot nữ', 'Giày boot nữ', '2018-03-06 09:50:38', '2018-03-06 09:50:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `email`, `address`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'test', 0, 'trinhdanh@gmail.com', '123', '123', '2018-03-13 21:08:37', '2018-03-13 21:08:37'),
(2, 'test2', 1, 'trinhdanh123@gmail.com', 'abc', 'abc', '2018-03-13 21:29:46', '2018-03-13 21:29:46'),
(3, 'takeshi', 1, 'trinhdanh31@gmail.com', 'afadsff', 'fasdfadsfadsf', '2018-03-13 23:50:57', '2018-03-13 23:50:57');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_01_27_120524_create_cates_table', 1),
(4, '2018_01_27_121529_create_products_table', 2),
(5, '2018_01_27_145543_create_product_images_table', 3),
(6, '2018_03_12_115223_create_customers_table', 4),
(7, '2018_03_12_120343_create_bills_table', 4),
(8, '2018_03_12_122831_create_bill_details_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `intro` text,
  `content` longtext,
  `image` varchar(255) NOT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `cate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `alias`, `unit`, `price`, `intro`, `content`, `image`, `keywords`, `description`, `user_id`, `cate_id`, `created_at`, `updated_at`) VALUES
(19, 'Kappa Giày Nữ K0725MM21-882', 'kappa-giay-nu-k0725mm21-882', '', 1800000, '<p>Kappa Gi&agrave;y Nữ K0725MM21-882</p>', '<p>N&acirc;ng cấp từ gi&agrave;y thể thao phong c&aacute;ch cổ điển</p>\r\n\r\n<p>Được thiết kế n&acirc;ng cấp từ d&ograve;ng gi&agrave;y thể thao b&aacute;n chạy nhất, form &ocirc;m trong d&ograve;ng K đặc điểm thương hiệu duy nhất, phong c&aacute;ch đơn giản v&agrave; cổ điển. Trọng lượng nhẹ v&agrave; thoải m&aacute;i, phần đế được thiết kế bằng chất liệu cao su EVA, chống trơn trượt, chịu m&agrave;i m&ograve;n nhẹ, ph&ugrave; hợp với t&iacute;nh linh hoạt.</p>\r\n\r\n<p>M&ugrave;a n&agrave;y sử dụng mũ gi&agrave;y t&iacute;ch hợp, để giảm trọng lượng gi&agrave;y , tăng t&iacute;nh linh hoạt trong c&aacute;c hoạt động. Vẫn giữ phong c&aacute;ch thiết kế m&agrave;u tương phản, m&agrave;u tươi phản &aacute;nh m&agrave;u s&aacute;ng l&agrave; ph&ugrave; hợp hơn cho m&ugrave;a xu&acirc;n v&agrave; m&ugrave;a h&egrave;.</p>', 'sneaker-1-01.jpg', 'Kappa Giày Nữ K0725MM21-882', 'Nâng cấp từ giày thể thao phong cách cổ điển', 1, 14, '2018-03-06 10:08:01', '2018-03-06 10:15:01'),
(20, 'Superga Giày Sneaker 2750 Fashion S0001L0-X6R', 'superga-giay-sneaker-2750-fashion-s0001l0-x6r', '', 952000, '<p>Superga Gi&agrave;y Sneaker si&ecirc;u đẹp, si&ecirc;u bền</p>', '<p>Superga Gi&agrave;y Sneaker si&ecirc;u đẹp, si&ecirc;u bền</p>', 'sneaker-2-01.jpg', 'Superga Giày Sneaker 2750 Fashion S0001L0-X6R', 'Superga Giày Sneaker siêu đẹp, siêu bền', 2, 14, '2018-03-06 10:14:49', '2018-03-06 10:14:49'),
(21, 'Ecko Unltd Giày Sneaker Unisex OF17-28127 M.GLORY', 'ecko-unltd-giay-sneaker-unisex-of17-28127-m-glory', '', 833000, '<p>Ecko Unltd Gi&agrave;y Sneaker Unisex OF17-28127 M.GLORY</p>', '<p>Ecko Unltd cho ra mắt d&ograve;ng gi&agrave;y vải canvas chất lượng, đ&aacute;p ứng được t&iacute;nh ứng dụng v&agrave; thời trang cho cả nam lẫn nữ. Thiết kế trẻ trung, năng động, dễ phối đồ l&agrave; ưu điểm tuyệt vời của d&ograve;ng sneaker n&agrave;y</p>', 'sneaker-3-01.jpg', 'Ecko Unltd Giày Sneaker Unisex OF17-28127 M.GLORY', 'Ecko Unltd cho ra mắt dòng giày vải canvas chất lượng, đáp ứng được tính ứng dụng và thời trang cho cả nam lẫn nữ. Thiết kế trẻ trung, năng động, dễ phối đồ là ưu điểm tuyệt vời của dòng sneaker này', 2, 14, '2018-03-06 10:18:23', '2018-03-06 10:18:23'),
(22, 'Dr. Martens Giày Sneaker Nam Solaris CDR BB55-22752001 BLACK', 'dr-martens-giay-sneaker-nam-solaris-cdr-bb55-22752001-black', '', 3000000, '<p>D&ograve;ng Solaris CDR m&agrave;u đen l&agrave; phi&ecirc;n bản hiện đại của 1461. D&ograve;ng gi&agrave;y 3 lỗ kh&ocirc;ng đường chỉ, mang d&aacute;ng vẻ trẽ trung năng động với thiết kế xỏ đơn giản, th&iacute;ch hợp với những c&aacute; nh&acirc;n năng động nơi phố thị. Đế ngo&agrave;i cực s&agrave;nh điệu với m&agrave;u sắc neon nổi bật đồng m&agrave;u với chữ tr&ecirc;n dải logo gắn tr&ecirc;n lưỡi g&agrave;. Th&acirc;n tr&ecirc;n kết hợp da Temperley mềm mại hơi b&oacute;ng với chất liệu Codura c&oacute; độ bền cao, chịu m&agrave;i m&ograve;n, chống r&aacute;ch, chống xước, chống nước.</p>', '<p>D&ograve;ng Solaris CDR m&agrave;u đen l&agrave; phi&ecirc;n bản hiện đại của 1461. D&ograve;ng gi&agrave;y 3 lỗ kh&ocirc;ng đường chỉ, mang d&aacute;ng vẻ trẽ trung năng động với thiết kế xỏ đơn giản, th&iacute;ch hợp với những c&aacute; nh&acirc;n năng động nơi phố thị. Đế ngo&agrave;i cực s&agrave;nh điệu với m&agrave;u sắc neon nổi bật đồng m&agrave;u với chữ tr&ecirc;n dải logo gắn tr&ecirc;n lưỡi g&agrave;. Th&acirc;n tr&ecirc;n kết hợp da Temperley mềm mại hơi b&oacute;ng với chất liệu Codura c&oacute; độ bền cao, chịu m&agrave;i m&ograve;n, chống r&aacute;ch, chống xước, chống nước.</p>', 'sneaker-n1-01.jpg', 'Dr. Martens Giày Sneaker Nam Solaris CDR BB55-22752001 BLACK', 'Dòng Solaris CDR màu đen là phiên bản hiện đại của 1461. Dòng giày 3 lỗ không đường chỉ, mang dáng vẻ trẽ trung năng động với thiết kế xỏ đơn giản.', 2, 13, '2018-03-06 10:23:54', '2018-03-06 10:23:54'),
(23, 'Dr. Martens Giày Sneaker Nam Pressler CC33-22776001 BLACK', 'dr-martens-giay-sneaker-nam-pressler-cc33-22776001-black', '', 2490000, '<p>D&ograve;ng Pressler 4 lỗ mang d&aacute;ng thể thao cực trẻ trung v&agrave; bụi bặm khi kết hợp th&ecirc;m những đặc điểm của gi&agrave;y leo n&uacute;i như đế cao su c&oacute; răng cưa, lỗ xỏ tr&ecirc;n c&ugrave;ng dạng m&oacute;c bằng sắt chắc chắn. sử dụng vải canvas m&agrave;u đen cho th&acirc;n tr&ecirc;n. Đế m&agrave;u đen với đường viền chạy dọc 2 b&ecirc;n ở gần cuối g&oacute;t gi&agrave;y. Logo Dr. Martens gắn ở phần cổ gi&agrave;y ph&iacute;a sau .</p>', '<p>D&ograve;ng Pressler 4 lỗ mang d&aacute;ng thể thao cực trẻ trung v&agrave; bụi bặm khi kết hợp th&ecirc;m những đặc điểm của gi&agrave;y leo n&uacute;i như đế cao su c&oacute; răng cưa, lỗ xỏ tr&ecirc;n c&ugrave;ng dạng m&oacute;c bằng sắt chắc chắn. sử dụng vải canvas m&agrave;u đen cho th&acirc;n tr&ecirc;n. Đế m&agrave;u đen với đường viền chạy dọc 2 b&ecirc;n ở gần cuối g&oacute;t gi&agrave;y. Logo Dr. Martens gắn ở phần cổ gi&agrave;y ph&iacute;a sau .</p>', 'sneaker-n2-01.jpg', 'Dr. Martens Giày Sneaker Nam Pressler CC33-22776001 BLACK', 'Dòng Pressler 4 lỗ mang dáng thể thao cực trẻ trung và bụi bặm khi kết hợp thêm những đặc điểm của giày leo núi như đế cao su có răng cưa, lỗ xỏ trên cùng dạng móc bằng sắt chắc chắn. sử dụng vải canvas màu đen cho thân trên.', 2, 13, '2018-03-06 10:27:42', '2018-03-06 10:27:42'),
(24, 'Dr. Martens Giày Bốt Nữ Pascal Met 1F66 23551690 BLK.PINK', 'dr-martens-giay-bot-nu-pascal-met-1f66-23551690-blk-pink', '', 3500000, '<p>Dr. Martens Gi&agrave;y Bốt Nữ Pascal Met 1F66 23551690 BLK.PINK</p>', '<p>Thương hiệu Anh</p>', 'boot-1-01.jpg', 'Thương hiệu Anh', 'Thương hiệu Anh', 2, 20, '2018-03-06 10:34:08', '2018-03-06 10:34:08'),
(25, 'Dr. Martens Giày Bốt Nam Newton BTS BB51-23093001 BLACK.2', 'dr-martens-giay-bot-nam-newton-bts-bb51-23093001-black-2', '', 4000000, '<p>Dr. Martens Gi&agrave;y Bốt Nam Newton BTS BB51-23093001 BLACK.2</p>', '<p>Thương hiệu Anh</p>', 'boot-n1-01.jpg', 'Dr. Martens Giày Bốt Nam Newton BTS BB51-23093001 BLACK.2', 'Thương hiệu Anh', 2, 19, '2018-03-06 10:36:57', '2018-03-06 10:36:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE IF NOT EXISTS `product_images` (
  `id` int(10) unsigned NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(30, 'sneaker-1-02.jpg', 19, NULL, NULL),
(31, 'sneaker-1-03.jpg', 19, NULL, NULL),
(32, 'sneaker-2-02.jpg', 20, NULL, NULL),
(33, 'sneaker-2-03.jpg', 20, NULL, NULL),
(34, 'sneaker-3-02.jpg', 21, NULL, NULL),
(35, 'sneaker-3-03.jpg', 21, NULL, NULL),
(36, 'sneaker-n1-02.jpg', 22, NULL, NULL),
(37, 'sneaker-n1-03.jpg', 22, NULL, NULL),
(38, 'sneaker-n2-02.jpg', 23, NULL, NULL),
(39, 'sneaker-n2-03.jpg', 23, NULL, NULL),
(40, 'boot-1-02.jpg', 24, NULL, NULL),
(41, 'boot-1-03.jpg', 24, NULL, NULL),
(42, 'boot-n1-02.jpg', 25, NULL, NULL),
(43, 'boot-n1-03.jpg', 25, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `level`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'trinhdanh04@gmail.com', '$2y$10$uvFyLkIAwc3Hg2NXxaQ/x.L5eUXlgxLDjL/WVIo9TF19t3C5Tvr2i', 1, NULL, NULL, NULL),
(2, 'Admin_Two', 'admin@gmail.com', '$2y$10$6WvhDOduJER8cQ7srLfeqeWRnMcfsCxzsEFVEoTfWA9EvKodC.A.S', 1, '2Xjo9LUo1GyUJRbtJZ49wPogKflPSfrKrm2U7rQUgh3sX7WE0F48D0F91Bpy', '2018-02-06 21:13:41', '2018-02-06 21:13:41'),
(4, 'member', 'membeabcr@gmail.com', '$2y$10$sKdAP..Nj7orGqK5tKWhfus1xeUmKFgWZmZtiktvIrtSrWiamnGvG', 2, 'y6T2lRbqvtWFJgOhvM5PyLq8fGJ6lKwQQbc2EaExLIXLW8KIFF5E860LFdyg', '2018-02-09 09:27:00', '2018-02-09 09:44:31'),
(5, 'Thanh Duong', 'dmt2426@gmail.com', '$2y$10$W6sWbUBsONZfMTgClCc/Ju/AFn2vZCEQAFep.b5RmVnSqQebDixEa', 1, NULL, '2018-03-29 09:47:02', '2018-03-29 09:47:02'),
(7, 'Thanh Duong 1', 'test@gmail.com', '$2y$10$KhdvdbjvYPO53AvPnVN12O5kDrQu.O.qKBZo.mnaZ6OpB60tJX2dO', 1, NULL, '2018-03-29 10:47:41', '2018-03-29 10:47:41'),
(8, 'a', 'test1@gmail.com', '$2y$10$.w8dZ4uxB32YqddZ1gVwB.cuHw/f1U8ExByfy67ZoRDp64371QiXa', 1, 'qENORa00hR7xaJ0Mf3ZSbT0FbQggmyf2Hgc3wztFk6Wl7Ebd5FHqpNpM1RNt', '2018-03-29 12:24:29', '2018-03-29 12:24:29'),
(9, 'Thanh Duong 2', 'test2@gmail.com', '$2y$10$i5XRcyIMuZiCYmnohunqxeNjp6sJpX1YmiwWuiVs9ZiPdt0s3dPSK', 1, 'wFdg51agwpnRGmp04aafq2WmSvyhJPMtzfRMGMQCdGMtS4xAbKzVmjOHARLV', '2018-03-29 13:10:43', '2018-03-29 13:10:43'),
(10, 'Thanh Duong 3', 'test3@gmail.com', '123456', 1, '21DufmcAzNQs6aEk7ubtTv35xqfviQsQcMXxuxQIVTOLGBOdmWhaQFWs7lgJ', '2018-03-29 13:16:39', '2018-03-29 13:16:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_details_product_id_foreign` (`product_id`),
  ADD KEY `bill_details_bill_id_foreign` (`bill_id`);

--
-- Indexes for table `cates`
--
ALTER TABLE `cates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cates_name_unique` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_cate_id_foreign` (`cate_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bill_details`
--
ALTER TABLE `bill_details`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cates`
--
ALTER TABLE `cates`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `bill_details_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bill_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `cates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
