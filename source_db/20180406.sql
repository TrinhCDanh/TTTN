/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : localhost:3306
 Source Schema         : db_hotel

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 06/04/2018 04:37:19
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `product_id` int(10) UNSIGNED NOT NULL,
  `delivery_notes_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delivery_note_details_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `delivery_note_details_delivery_notes_id_foreign`(`delivery_notes_id`) USING BTREE,
  CONSTRAINT `delivery_note_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `delivery_note_details_ibfk_1` FOREIGN KEY (`delivery_notes_id`) REFERENCES `delivery_notes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delivery_notes_created_by_foreign`(`created_by`) USING BTREE,
  INDEX `delivery_notes_bill_id_foreign`(`bill_id`) USING BTREE,
  CONSTRAINT `delivery_notes_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `delivery_notes_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `level` tinyint(4) NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (11, 'Thanh Duong 7', 'dmt7@gmail.com', '$2y$10$dAeoRFV7vZInoZQJVTNKsuizkJs.rgm5qeOj076HyzgBFh2wCvBaG', NULL, 'LveHLzmCQNnCGVJhQFk3oicUPlGLYK9HgMV2zBKL', '2018-04-05 20:46:34', '2018-04-05 21:09:36');
INSERT INTO `users` VALUES (12, 'sdfs', 'dmt242623@gmail.com', '$2y$10$I1bIXMctSNKrM7cwp1/d9ucGAqd2fr0HlQeKo7liDbnFfjacDMwKm', NULL, 'LveHLzmCQNnCGVJhQFk3oicUPlGLYK9HgMV2zBKL', '2018-04-05 21:20:21', '2018-04-05 21:20:48');

SET FOREIGN_KEY_CHECKS = 1;
