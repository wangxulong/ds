/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : micro_service

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-04-01 20:08:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_resource
-- ----------------------------
DROP TABLE IF EXISTS `sys_resource`;
CREATE TABLE `sys_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `order_num` int(11) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `parent_ids` varchar(255) DEFAULT NULL,
  `resource_code` varchar(255) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `script` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_resource
-- ----------------------------
INSERT INTO `sys_resource` VALUES ('1', '系统管理', '0', '1', '0', '0', '', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('2', '用户管理', '1', '1', '1', '1', '', '1', null, '/sys/user/index', null);
INSERT INTO `sys_resource` VALUES ('3', '角色管理', '1', '2', '1', '1', '', '1', null, '/sys/role/index', null);
INSERT INTO `sys_resource` VALUES ('4', '资源管理', '1', '3', '1', '1', '', '1', null, '/sys/res/index', null);
INSERT INTO `sys_resource` VALUES ('5', '添加系统账号', '2', '1', '2', '1-2', 'sysUser:add', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('10', '删除用户', '2', null, '2', '1-2', 'sysUser:delete', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('11', '添加角色', '2', null, '3', '1-3', 'sysRole:add', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('12', '删除角色', '2', null, '3', '1-3', 'sysRole:delete', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('14', '分配角色', '2', '3', '2', '1-2', 'sysUser:allotRole', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('15', '修改系统账号', '2', '1', '2', '1-2', 'sysUser:edit', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('16', '分配资源', '2', '1', '3', '1-3', 'sysRole:allotRes', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('17', '修改角色', '2', '1', '3', '1-3', 'sysRole:edit', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('18', '内容管理', '0', null, '0', '0', '', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('19', '问答管理', '1', null, '18', '18', null, '1', null, '/question/index', null);
INSERT INTO `sys_resource` VALUES ('20', '需求管理', '1', null, '18', '18', null, '1', null, '/require/index', null);
INSERT INTO `sys_resource` VALUES ('21', '服务管理', '1', null, '18', '18', null, '1', null, '', null);
INSERT INTO `sys_resource` VALUES ('22', '需求管理', '1', null, '18', '18', null, '1', null, '', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `role_code` varchar(255) DEFAULT NULL,
  `resource_ids` varchar(255) DEFAULT NULL,
  `available` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '不能删除', 'admin', '1,2,5,10,14,15,3,11,12,16,17,4,18,19,20,21,22', '1');
INSERT INTO `sys_role` VALUES ('2', '普通用户', '就是一般用户角色', 'user', '1,2,5,3,11,9', '1');
INSERT INTO `sys_role` VALUES ('3', '顾客', '有限制的访问', 'customer', '1,2,5,10', '1');
INSERT INTO `sys_role` VALUES ('4', 'ddd', 'ddd', 'ddd', '1,3,16', '1');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `role_ids` varchar(255) DEFAULT NULL,
  `locked` tinyint(4) DEFAULT NULL,
  `nick_name` varchar(255) DEFAULT NULL,
  `telephone` char(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('7', 'admin', 'ee0f01d962a9c7189c727f3a4cecbace', 'aa6cc0cc67e847db28cc173a7a03b977', '1', null, 'Yage', '15201895065', '1749362086@qq.com', '', null, null);

-- ----------------------------
-- Table structure for tb_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_category`;
CREATE TABLE `tb_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_category
-- ----------------------------
INSERT INTO `tb_category` VALUES ('1', 'root', null, '0', '1', null);
INSERT INTO `tb_category` VALUES ('2', '衣', null, '1', '1', '2016-03-01 20:42:17');
INSERT INTO `tb_category` VALUES ('3', '食', null, '1', '1', '2016-03-01 20:42:36');
INSERT INTO `tb_category` VALUES ('4', '住', null, '1', '1', '2016-03-01 20:42:51');
INSERT INTO `tb_category` VALUES ('5', '行', null, '1', '1', '2016-03-01 20:43:00');
INSERT INTO `tb_category` VALUES ('6', '其他', null, '1', '1', '2016-03-01 20:43:10');

-- ----------------------------
-- Table structure for tb_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `content_type` tinyint(4) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `degree` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_comment
-- ----------------------------
INSERT INTO `tb_comment` VALUES ('1', '7', '4', '1', '可以啊谔谔', null, '2016-02-28 19:30:45');
INSERT INTO `tb_comment` VALUES ('2', '7', '4', '1', '你说呢额', null, '2016-02-28 19:30:56');
INSERT INTO `tb_comment` VALUES ('3', '7', '4', '1', '1111', null, '2016-02-28 20:03:07');
INSERT INTO `tb_comment` VALUES ('4', '7', '4', '1', '222', null, '2016-02-28 20:03:25');
INSERT INTO `tb_comment` VALUES ('5', '7', '7', '1', '更具ListView的内容设置高度', null, '2016-02-29 20:36:53');
INSERT INTO `tb_comment` VALUES ('6', '7', '5', '1', '123', null, '2016-03-01 23:33:15');
INSERT INTO `tb_comment` VALUES ('7', '7', '5', '1', '123', null, '2016-03-01 23:33:15');
INSERT INTO `tb_comment` VALUES ('8', '7', '3', '1', 'circuit', null, '2016-03-01 23:34:24');
INSERT INTO `tb_comment` VALUES ('9', '7', '3', '1', 'Dodd', null, '2016-03-01 23:36:26');
INSERT INTO `tb_comment` VALUES ('10', '7', '2', '1', 'SAS', null, '2016-03-01 23:36:43');
INSERT INTO `tb_comment` VALUES ('11', '7', '2', '1', 'DKK', null, '2016-03-01 23:38:55');
INSERT INTO `tb_comment` VALUES ('12', '7', '4', '1', 'CSX', null, '2016-03-01 23:39:19');
INSERT INTO `tb_comment` VALUES ('13', '7', '4', '1', 'GH', null, '2016-03-01 23:43:31');
INSERT INTO `tb_comment` VALUES ('14', '7', '4', '1', '科目三', null, '2016-03-02 09:06:03');
INSERT INTO `tb_comment` VALUES ('18', '7', '11', '1', '重中之重', null, '2016-03-06 18:48:08');
INSERT INTO `tb_comment` VALUES ('19', '7', '4', '1', '谈恋爱', null, '2016-03-06 18:50:20');
INSERT INTO `tb_comment` VALUES ('20', '7', '4', '1', '贪恋吖', null, '2016-03-06 18:50:37');
INSERT INTO `tb_comment` VALUES ('21', '7', '5', '1', '畅快淋漓', null, '2016-03-10 19:36:15');
INSERT INTO `tb_comment` VALUES ('22', '7', '7', '1', '畅快淋漓慧❤', null, '2016-03-10 19:37:03');
INSERT INTO `tb_comment` VALUES ('23', '7', '7', '1', 'alert(122);', null, '2016-03-10 19:37:56');
INSERT INTO `tb_comment` VALUES ('24', '7', '7', '1', 'Z成绩出来了', null, '2016-03-10 19:38:09');
INSERT INTO `tb_comment` VALUES ('25', '7', '7', '1', 'Hhd', null, '2016-03-10 19:38:25');
INSERT INTO `tb_comment` VALUES ('26', '7', '7', '1', '吉吉吉', null, '2016-03-14 11:17:01');
INSERT INTO `tb_comment` VALUES ('27', '7', '7', '1', '喝☕☕☕☕', null, '2016-03-14 11:17:52');

-- ----------------------------
-- Table structure for tb_favorite
-- ----------------------------
DROP TABLE IF EXISTS `tb_favorite`;
CREATE TABLE `tb_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `content_type` tinyint(4) DEFAULT NULL COMMENT '0 需求 1 服务',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) DEFAULT NULL,
  `accepter_id` bigint(20) DEFAULT NULL,
  `content` varchar(1024) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `content_type` tinyint(4) DEFAULT NULL COMMENT '0 需求 1 服务',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_require
-- ----------------------------
DROP TABLE IF EXISTS `tb_require`;
CREATE TABLE `tb_require` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `good` bigint(20) DEFAULT NULL,
  `bad` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '0' COMMENT '0 有偿 1 免费',
  `create_time` datetime DEFAULT NULL,
  `begin_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_require
-- ----------------------------
INSERT INTO `tb_require` VALUES ('1', '7', 'one', null, null, null, '1', null, null, null, null, null, '0');
INSERT INTO `tb_require` VALUES ('2', '7', '重大改革', '研究生不用上课', null, null, '1', '2016-02-26 20:37:55', null, null, null, null, '3');
INSERT INTO `tb_require` VALUES ('3', '7', '为什么要上Z语言', '真的是浪费时间做没意思的事情', null, null, '1', '2016-02-27 08:53:37', null, null, null, null, '0');
INSERT INTO `tb_require` VALUES ('4', '7', '看看是不是动态', '看见一个漂亮的女孩子', null, null, '1', '2016-02-27 09:58:52', null, null, null, null, '3');
INSERT INTO `tb_require` VALUES ('5', '7', '上大要收掉技艺大', '是真的吗', null, null, '1', '2016-02-28 20:19:37', null, null, null, null, '1');
INSERT INTO `tb_require` VALUES ('6', '7', '你问我打', '你问我打', null, null, '1', '2016-02-29 20:13:44', null, null, null, null, '1');
INSERT INTO `tb_require` VALUES ('7', '7', '解决ListView高度', '解决ListView高度', null, null, '1', '2016-02-29 20:35:51', null, null, null, null, '1');
INSERT INTO `tb_require` VALUES ('8', '7', '想买个二手大衣', '想买个二手大衣', null, null, '0', '2016-03-01 20:44:20', null, null, null, null, '3');
INSERT INTO `tb_require` VALUES ('9', '7', '找人一起合租', '找人一起合租', null, null, '0', '2016-03-01 20:46:23', null, null, null, null, '3');
INSERT INTO `tb_require` VALUES ('10', '7', '一起爬上赏月', '一起爬上赏月', null, null, '0', '2016-03-01 20:47:42', null, null, null, null, '3');
INSERT INTO `tb_require` VALUES ('11', '7', '今天的测试问答', '问答出来了没有', null, null, '1', '2016-03-02 09:26:28', null, null, null, null, '3');

-- ----------------------------
-- Table structure for tb_require_attach
-- ----------------------------
DROP TABLE IF EXISTS `tb_require_attach`;
CREATE TABLE `tb_require_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `require_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_require_attach
-- ----------------------------
INSERT INTO `tb_require_attach` VALUES ('1', '8', '0', 'IMG_0434.JPG', '1456836260928.JPG');
INSERT INTO `tb_require_attach` VALUES ('2', '9', '0', 'IMG_0190.JPG', '1456836383038.JPG');
INSERT INTO `tb_require_attach` VALUES ('3', '10', '0', '1jpg.jpg', '1456836462458.jpg');

-- ----------------------------
-- Table structure for tb_service
-- ----------------------------
DROP TABLE IF EXISTS `tb_service`;
CREATE TABLE `tb_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `good` bigint(20) DEFAULT NULL,
  `bad` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `tag_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_service
-- ----------------------------

-- ----------------------------
-- Table structure for tb_service_attach
-- ----------------------------
DROP TABLE IF EXISTS `tb_service_attach`;
CREATE TABLE `tb_service_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_service_attach
-- ----------------------------

-- ----------------------------
-- Table structure for tb_tag
-- ----------------------------
DROP TABLE IF EXISTS `tb_tag`;
CREATE TABLE `tb_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_tag
-- ----------------------------
