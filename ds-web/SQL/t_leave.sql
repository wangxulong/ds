/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : ds

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-05-19 22:02:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `attach_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave
-- ----------------------------
