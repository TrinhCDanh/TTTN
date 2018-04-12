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

 Date: 06/04/2018 00:43:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of delivery_notes
-- ----------------------------
INSERT INTO `delivery_notes` VALUES (1, '194 cao lo', 'hieu truong', '09876543123', 'note', 1, 1, '0000-00-00 00:00:00', NULL);
INSERT INTO `delivery_notes` VALUES (2, '999 nguyen tri phuong', 'giam doc', '00443434334', NULL, 2, 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
