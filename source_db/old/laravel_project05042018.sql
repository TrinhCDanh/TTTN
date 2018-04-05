/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : laravel_project_db_hotel

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 05/04/2018 22:09:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill_details
-- ----------------------------
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bill_details_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `bill_details_bill_id_foreign`(`bill_id`) USING BTREE,
  CONSTRAINT `bill_details_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `bill_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill_details
-- ----------------------------
INSERT INTO `bill_details` VALUES (1, 21, 1, 1, 833000, '2018-03-13 21:08:37', '2018-03-13 21:08:37');
INSERT INTO `bill_details` VALUES (3, 25, 2, 1, 4000000, '2018-03-13 21:29:47', '2018-03-13 21:29:47');
INSERT INTO `bill_details` VALUES (4, 21, 3, 2, 1666000, '2018-03-13 23:50:57', '2018-03-13 23:50:57');
INSERT INTO `bill_details` VALUES (5, 25, 3, 1, 4000000, '2018-03-13 23:50:57', '2018-03-13 23:50:57');
INSERT INTO `bill_details` VALUES (6, 23, 3, 1, 2490000, '2018-03-13 23:50:57', '2018-03-13 23:50:57');

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS `bills`;
CREATE TABLE `bills`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date_order` date NOT NULL,
  `total` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `check_order` int(1) NULL DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bills_customer_id_foreign`(`customer_id`) USING BTREE,
  CONSTRAINT `bills_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO `bills` VALUES (1, '2018-03-14', '1,007,930.00', ' ', 0, 1, '2018-03-13 21:08:37', '2018-03-13 21:08:37');
INSERT INTO `bills` VALUES (2, '2018-03-14', '7,744,000.00', 'abc', 0, 2, '2018-03-13 21:29:47', '2018-03-13 21:29:47');
INSERT INTO `bills` VALUES (3, '2018-03-14', '9,868,760.00', 'dfasdfasdfasdf', 1, 3, '2018-03-13 23:50:57', '2018-03-13 23:58:36');

-- ----------------------------
-- Table structure for cates
-- ----------------------------
DROP TABLE IF EXISTS `cates`;
CREATE TABLE `cates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cates_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cates
-- ----------------------------
INSERT INTO `cates` VALUES (12, 'Giày sneakers', 'giay-sneakers', 10, 0, 'Giày sneakers', 'Giày sneakers', '2018-03-06 09:43:48', '2018-03-06 09:43:48');
INSERT INTO `cates` VALUES (13, 'Giày sneakers nam', 'giay-sneakers-nam', 10, 12, 'Giày sneakers nam', 'Giày sneakers nam', '2018-03-06 09:44:10', '2018-03-06 09:44:10');
INSERT INTO `cates` VALUES (14, 'Giày sneakers nữ', 'giay-sneakers-nu', 10, 12, 'Giày sneakers nữ', 'Giày sneakers nữ', '2018-03-06 09:44:54', '2018-03-06 09:44:54');
INSERT INTO `cates` VALUES (15, 'Giày sandal', 'giay-sandal', 10, 0, 'Giày Sandal', 'Giày Sandal', '2018-03-06 09:47:47', '2018-03-06 09:48:30');
INSERT INTO `cates` VALUES (16, 'Giày sandal nam', 'giay-sandal-nam', 10, 15, 'Giày sandal nam', 'Giày sandal nam', '2018-03-06 09:48:21', '2018-03-06 09:48:21');
INSERT INTO `cates` VALUES (17, 'Giày sandal nữ', 'giay-sandal-nu', 10, 15, 'Giày sandal nữ', 'Giày sandal nữ', '2018-03-06 09:48:52', '2018-03-06 09:48:52');
INSERT INTO `cates` VALUES (18, 'Giày boot', 'giay-boot', 10, 0, 'Giày boot', 'Giày boot', '2018-03-06 09:49:58', '2018-03-06 09:49:58');
INSERT INTO `cates` VALUES (19, 'Giày boot nam', 'giay-boot-nam', 10, 18, 'Giày boot nam', 'Giày boot nam', '2018-03-06 09:50:17', '2018-03-06 09:50:49');
INSERT INTO `cates` VALUES (20, 'Giày boot nữ', 'giay-boot-nu', 11, 18, 'Giày boot nữ', 'Giày boot nữ', '2018-03-06 09:50:38', '2018-03-06 09:50:38');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES (1, 'test', 0, 'trinhdanh@gmail.com', '123', '123', '2018-03-13 21:08:37', '2018-03-13 21:08:37');
INSERT INTO `customers` VALUES (2, 'test2', 1, 'trinhdanh123@gmail.com', 'abc', 'abc', '2018-03-13 21:29:46', '2018-03-13 21:29:46');
INSERT INTO `customers` VALUES (3, 'takeshi', 1, 'trinhdanh31@gmail.com', 'afadsff', 'fasdfadsfadsf', '2018-03-13 23:50:57', '2018-03-13 23:50:57');

-- ----------------------------
-- Table structure for delivery_note_details
-- ----------------------------
DROP TABLE IF EXISTS `delivery_note_details`;
CREATE TABLE `delivery_note_details`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `delivery_notes_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delivery_note_details_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `delivery_note_details_delivery_notes_id_foreign`(`delivery_notes_id`) USING BTREE,
  CONSTRAINT `delivery_note_details_delivery_notes_id_foreign` FOREIGN KEY (`delivery_notes_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `delivery_note_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for delivery_notes
-- ----------------------------
DROP TABLE IF EXISTS `delivery_notes`;
CREATE TABLE `delivery_notes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `recipient_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `recipient_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `bill_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delivery_notes_created_by_foreign`(`created_by`) USING BTREE,
  INDEX `delivery_notes_bill_id_foreign`(`bill_id`) USING BTREE,
  INDEX `delivery_notes_customer_id_foreign`(`customer_id`) USING BTREE,
  CONSTRAINT `delivery_notes_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `delivery_notes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `delivery_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manufacturers
-- ----------------------------
DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE `manufacturers`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2018_01_27_120524_create_cates_table', 1);
INSERT INTO `migrations` VALUES (4, '2018_01_27_121529_create_products_table', 2);
INSERT INTO `migrations` VALUES (5, '2018_01_27_145543_create_product_images_table', 3);
INSERT INTO `migrations` VALUES (6, '2018_03_12_115223_create_customers_table', 4);
INSERT INTO `migrations` VALUES (7, '2018_03_12_120343_create_bills_table', 4);
INSERT INTO `migrations` VALUES (8, '2018_03_12_122831_create_bill_details_table', 4);
INSERT INTO `migrations` VALUES (9, '2018_04_05_125726_create_manufacturers_table', 5);
INSERT INTO `migrations` VALUES (10, '2018_04_05_130557_add_manufactorers_to_products_table', 5);
INSERT INTO `migrations` VALUES (11, '2018_04_05_131710_create_delivery_notes_table', 5);
INSERT INTO `migrations` VALUES (12, '2018_04_05_142606_create_delivery_note_details_table', 5);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_images_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES (30, 'sneaker-1-02.jpg', 19, NULL, NULL);
INSERT INTO `product_images` VALUES (31, 'sneaker-1-03.jpg', 19, NULL, NULL);
INSERT INTO `product_images` VALUES (32, 'sneaker-2-02.jpg', 20, NULL, NULL);
INSERT INTO `product_images` VALUES (33, 'sneaker-2-03.jpg', 20, NULL, NULL);
INSERT INTO `product_images` VALUES (34, 'sneaker-3-02.jpg', 21, NULL, NULL);
INSERT INTO `product_images` VALUES (35, 'sneaker-3-03.jpg', 21, NULL, NULL);
INSERT INTO `product_images` VALUES (36, 'sneaker-n1-02.jpg', 22, NULL, NULL);
INSERT INTO `product_images` VALUES (37, 'sneaker-n1-03.jpg', 22, NULL, NULL);
INSERT INTO `product_images` VALUES (38, 'sneaker-n2-02.jpg', 23, NULL, NULL);
INSERT INTO `product_images` VALUES (39, 'sneaker-n2-03.jpg', 23, NULL, NULL);
INSERT INTO `product_images` VALUES (40, 'boot-1-02.jpg', 24, NULL, NULL);
INSERT INTO `product_images` VALUES (41, 'boot-1-03.jpg', 24, NULL, NULL);
INSERT INTO `product_images` VALUES (42, 'boot-n1-02.jpg', 25, NULL, NULL);
INSERT INTO `product_images` VALUES (43, 'boot-n1-03.jpg', 25, NULL, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(11) NOT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `cate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `manufacturer_id` int(10) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `products_name_unique`(`name`) USING BTREE,
  INDEX `products_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `products_cate_id_foreign`(`cate_id`) USING BTREE,
  INDEX `products_manufacturer_id_foreign`(`manufacturer_id`) USING BTREE,
  CONSTRAINT `products_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `cates` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (19, 'Kappa Giày Nữ K0725MM21-882', 'kappa-giay-nu-k0725mm21-882', '', 1800000, '<p>Kappa Gi&agrave;y Nữ K0725MM21-882</p>', '<p>N&acirc;ng cấp từ gi&agrave;y thể thao phong c&aacute;ch cổ điển</p>\r\n\r\n<p>Được thiết kế n&acirc;ng cấp từ d&ograve;ng gi&agrave;y thể thao b&aacute;n chạy nhất, form &ocirc;m trong d&ograve;ng K đặc điểm thương hiệu duy nhất, phong c&aacute;ch đơn giản v&agrave; cổ điển. Trọng lượng nhẹ v&agrave; thoải m&aacute;i, phần đế được thiết kế bằng chất liệu cao su EVA, chống trơn trượt, chịu m&agrave;i m&ograve;n nhẹ, ph&ugrave; hợp với t&iacute;nh linh hoạt.</p>\r\n\r\n<p>M&ugrave;a n&agrave;y sử dụng mũ gi&agrave;y t&iacute;ch hợp, để giảm trọng lượng gi&agrave;y , tăng t&iacute;nh linh hoạt trong c&aacute;c hoạt động. Vẫn giữ phong c&aacute;ch thiết kế m&agrave;u tương phản, m&agrave;u tươi phản &aacute;nh m&agrave;u s&aacute;ng l&agrave; ph&ugrave; hợp hơn cho m&ugrave;a xu&acirc;n v&agrave; m&ugrave;a h&egrave;.</p>', 'sneaker-1-01.jpg', 'Kappa Giày Nữ K0725MM21-882', 'Nâng cấp từ giày thể thao phong cách cổ điển', 1, 14, '2018-03-06 10:08:01', '2018-03-06 10:15:01', NULL);
INSERT INTO `products` VALUES (20, 'Superga Giày Sneaker 2750 Fashion S0001L0-X6R', 'superga-giay-sneaker-2750-fashion-s0001l0-x6r', '', 952000, '<p>Superga Gi&agrave;y Sneaker si&ecirc;u đẹp, si&ecirc;u bền</p>', '<p>Superga Gi&agrave;y Sneaker si&ecirc;u đẹp, si&ecirc;u bền</p>', 'sneaker-2-01.jpg', 'Superga Giày Sneaker 2750 Fashion S0001L0-X6R', 'Superga Giày Sneaker siêu đẹp, siêu bền', 2, 14, '2018-03-06 10:14:49', '2018-03-06 10:14:49', NULL);
INSERT INTO `products` VALUES (21, 'Ecko Unltd Giày Sneaker Unisex OF17-28127 M.GLORY', 'ecko-unltd-giay-sneaker-unisex-of17-28127-m-glory', '', 833000, '<p>Ecko Unltd Gi&agrave;y Sneaker Unisex OF17-28127 M.GLORY</p>', '<p>Ecko Unltd cho ra mắt d&ograve;ng gi&agrave;y vải canvas chất lượng, đ&aacute;p ứng được t&iacute;nh ứng dụng v&agrave; thời trang cho cả nam lẫn nữ. Thiết kế trẻ trung, năng động, dễ phối đồ l&agrave; ưu điểm tuyệt vời của d&ograve;ng sneaker n&agrave;y</p>', 'sneaker-3-01.jpg', 'Ecko Unltd Giày Sneaker Unisex OF17-28127 M.GLORY', 'Ecko Unltd cho ra mắt dòng giày vải canvas chất lượng, đáp ứng được tính ứng dụng và thời trang cho cả nam lẫn nữ. Thiết kế trẻ trung, năng động, dễ phối đồ là ưu điểm tuyệt vời của dòng sneaker này', 2, 14, '2018-03-06 10:18:23', '2018-03-06 10:18:23', NULL);
INSERT INTO `products` VALUES (22, 'Dr. Martens Giày Sneaker Nam Solaris CDR BB55-22752001 BLACK', 'dr-martens-giay-sneaker-nam-solaris-cdr-bb55-22752001-black', '', 3000000, '<p>D&ograve;ng Solaris CDR m&agrave;u đen l&agrave; phi&ecirc;n bản hiện đại của 1461. D&ograve;ng gi&agrave;y 3 lỗ kh&ocirc;ng đường chỉ, mang d&aacute;ng vẻ trẽ trung năng động với thiết kế xỏ đơn giản, th&iacute;ch hợp với những c&aacute; nh&acirc;n năng động nơi phố thị. Đế ngo&agrave;i cực s&agrave;nh điệu với m&agrave;u sắc neon nổi bật đồng m&agrave;u với chữ tr&ecirc;n dải logo gắn tr&ecirc;n lưỡi g&agrave;. Th&acirc;n tr&ecirc;n kết hợp da Temperley mềm mại hơi b&oacute;ng với chất liệu Codura c&oacute; độ bền cao, chịu m&agrave;i m&ograve;n, chống r&aacute;ch, chống xước, chống nước.</p>', '<p>D&ograve;ng Solaris CDR m&agrave;u đen l&agrave; phi&ecirc;n bản hiện đại của 1461. D&ograve;ng gi&agrave;y 3 lỗ kh&ocirc;ng đường chỉ, mang d&aacute;ng vẻ trẽ trung năng động với thiết kế xỏ đơn giản, th&iacute;ch hợp với những c&aacute; nh&acirc;n năng động nơi phố thị. Đế ngo&agrave;i cực s&agrave;nh điệu với m&agrave;u sắc neon nổi bật đồng m&agrave;u với chữ tr&ecirc;n dải logo gắn tr&ecirc;n lưỡi g&agrave;. Th&acirc;n tr&ecirc;n kết hợp da Temperley mềm mại hơi b&oacute;ng với chất liệu Codura c&oacute; độ bền cao, chịu m&agrave;i m&ograve;n, chống r&aacute;ch, chống xước, chống nước.</p>', 'sneaker-n1-01.jpg', 'Dr. Martens Giày Sneaker Nam Solaris CDR BB55-22752001 BLACK', 'Dòng Solaris CDR màu đen là phiên bản hiện đại của 1461. Dòng giày 3 lỗ không đường chỉ, mang dáng vẻ trẽ trung năng động với thiết kế xỏ đơn giản.', 2, 13, '2018-03-06 10:23:54', '2018-03-06 10:23:54', NULL);
INSERT INTO `products` VALUES (23, 'Dr. Martens Giày Sneaker Nam Pressler CC33-22776001 BLACK', 'dr-martens-giay-sneaker-nam-pressler-cc33-22776001-black', '', 2490000, '<p>D&ograve;ng Pressler 4 lỗ mang d&aacute;ng thể thao cực trẻ trung v&agrave; bụi bặm khi kết hợp th&ecirc;m những đặc điểm của gi&agrave;y leo n&uacute;i như đế cao su c&oacute; răng cưa, lỗ xỏ tr&ecirc;n c&ugrave;ng dạng m&oacute;c bằng sắt chắc chắn. sử dụng vải canvas m&agrave;u đen cho th&acirc;n tr&ecirc;n. Đế m&agrave;u đen với đường viền chạy dọc 2 b&ecirc;n ở gần cuối g&oacute;t gi&agrave;y. Logo Dr. Martens gắn ở phần cổ gi&agrave;y ph&iacute;a sau .</p>', '<p>D&ograve;ng Pressler 4 lỗ mang d&aacute;ng thể thao cực trẻ trung v&agrave; bụi bặm khi kết hợp th&ecirc;m những đặc điểm của gi&agrave;y leo n&uacute;i như đế cao su c&oacute; răng cưa, lỗ xỏ tr&ecirc;n c&ugrave;ng dạng m&oacute;c bằng sắt chắc chắn. sử dụng vải canvas m&agrave;u đen cho th&acirc;n tr&ecirc;n. Đế m&agrave;u đen với đường viền chạy dọc 2 b&ecirc;n ở gần cuối g&oacute;t gi&agrave;y. Logo Dr. Martens gắn ở phần cổ gi&agrave;y ph&iacute;a sau .</p>', 'sneaker-n2-01.jpg', 'Dr. Martens Giày Sneaker Nam Pressler CC33-22776001 BLACK', 'Dòng Pressler 4 lỗ mang dáng thể thao cực trẻ trung và bụi bặm khi kết hợp thêm những đặc điểm của giày leo núi như đế cao su có răng cưa, lỗ xỏ trên cùng dạng móc bằng sắt chắc chắn. sử dụng vải canvas màu đen cho thân trên.', 2, 13, '2018-03-06 10:27:42', '2018-03-06 10:27:42', NULL);
INSERT INTO `products` VALUES (24, 'Dr. Martens Giày Bốt Nữ Pascal Met 1F66 23551690 BLK.PINK', 'dr-martens-giay-bot-nu-pascal-met-1f66-23551690-blk-pink', '', 3500000, '<p>Dr. Martens Gi&agrave;y Bốt Nữ Pascal Met 1F66 23551690 BLK.PINK</p>', '<p>Thương hiệu Anh</p>', 'boot-1-01.jpg', 'Thương hiệu Anh', 'Thương hiệu Anh', 2, 20, '2018-03-06 10:34:08', '2018-03-06 10:34:08', NULL);
INSERT INTO `products` VALUES (25, 'Dr. Martens Giày Bốt Nam Newton BTS BB51-23093001 BLACK.2', 'dr-martens-giay-bot-nam-newton-bts-bb51-23093001-black-2', '', 4000000, '<p>Dr. Martens Gi&agrave;y Bốt Nam Newton BTS BB51-23093001 BLACK.2</p>', '<p>Thương hiệu Anh</p>', 'boot-n1-01.jpg', 'Dr. Martens Giày Bốt Nam Newton BTS BB51-23093001 BLACK.2', 'Thương hiệu Anh', 2, 19, '2018-03-06 10:36:57', '2018-03-06 10:36:57', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint(4) NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'trinhdanh04@gmail.com', '$2y$10$uvFyLkIAwc3Hg2NXxaQ/x.L5eUXlgxLDjL/WVIo9TF19t3C5Tvr2i', 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'Admin_Two', 'admin@gmail.com', '$2y$10$6WvhDOduJER8cQ7srLfeqeWRnMcfsCxzsEFVEoTfWA9EvKodC.A.S', 1, '2Xjo9LUo1GyUJRbtJZ49wPogKflPSfrKrm2U7rQUgh3sX7WE0F48D0F91Bpy', '2018-02-06 21:13:41', '2018-02-06 21:13:41');
INSERT INTO `users` VALUES (4, 'member', 'membeabcr@gmail.com', '$2y$10$sKdAP..Nj7orGqK5tKWhfus1xeUmKFgWZmZtiktvIrtSrWiamnGvG', 2, 'y6T2lRbqvtWFJgOhvM5PyLq8fGJ6lKwQQbc2EaExLIXLW8KIFF5E860LFdyg', '2018-02-09 09:27:00', '2018-02-09 09:44:31');
INSERT INTO `users` VALUES (5, 'Thanh Duong', 'dmt2426@gmail.com', '$2y$10$W6sWbUBsONZfMTgClCc/Ju/AFn2vZCEQAFep.b5RmVnSqQebDixEa', 1, NULL, '2018-03-29 09:47:02', '2018-03-29 09:47:02');
INSERT INTO `users` VALUES (7, 'Thanh Duong 1', 'test@gmail.com', '$2y$10$KhdvdbjvYPO53AvPnVN12O5kDrQu.O.qKBZo.mnaZ6OpB60tJX2dO', 1, NULL, '2018-03-29 10:47:41', '2018-03-29 10:47:41');
INSERT INTO `users` VALUES (8, 'a', 'test1@gmail.com', '$2y$10$.w8dZ4uxB32YqddZ1gVwB.cuHw/f1U8ExByfy67ZoRDp64371QiXa', 1, 'qENORa00hR7xaJ0Mf3ZSbT0FbQggmyf2Hgc3wztFk6Wl7Ebd5FHqpNpM1RNt', '2018-03-29 12:24:29', '2018-03-29 12:24:29');
INSERT INTO `users` VALUES (9, 'Thanh Duong 2', 'test2@gmail.com', '$2y$10$i5XRcyIMuZiCYmnohunqxeNjp6sJpX1YmiwWuiVs9ZiPdt0s3dPSK', 1, 'wFdg51agwpnRGmp04aafq2WmSvyhJPMtzfRMGMQCdGMtS4xAbKzVmjOHARLV', '2018-03-29 13:10:43', '2018-03-29 13:10:43');
INSERT INTO `users` VALUES (10, 'Thanh Duong 3', 'test3@gmail.com', '123456', 1, '21DufmcAzNQs6aEk7ubtTv35xqfviQsQcMXxuxQIVTOLGBOdmWhaQFWs7lgJ', '2018-03-29 13:16:39', '2018-03-29 13:16:39');

SET FOREIGN_KEY_CHECKS = 1;
