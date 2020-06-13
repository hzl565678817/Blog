/*
Navicat MySQL Data Transfer

Source Server         : ppll
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : yuublog

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-06-13 16:13:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `dowhat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('4', '123', '2020-06-13 15:43:34', '注册');
INSERT INTO `log` VALUES ('5', 'a', '2020-06-13 15:44:46', '登陆');
