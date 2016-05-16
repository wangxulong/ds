/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : ds

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-05-13 20:02:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for r_course_student
-- ----------------------------
DROP TABLE IF EXISTS `r_course_student`;
CREATE TABLE `r_course_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_r_course` (`course_id`),
  KEY `pk_r_student` (`student_id`),
  CONSTRAINT `pk_r_course` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pk_r_student` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_course_student
-- ----------------------------
INSERT INTO `r_course_student` VALUES ('1', '1', '2');

-- ----------------------------
-- Table structure for r_homework_student
-- ----------------------------
DROP TABLE IF EXISTS `r_homework_student`;
CREATE TABLE `r_homework_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `homework_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_cs_homework` (`homework_id`),
  KEY `pk_cs_student` (`student_id`),
  CONSTRAINT `pk_cs_homework` FOREIGN KEY (`homework_id`) REFERENCES `t_homework` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pk_cs_student` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of r_homework_student
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

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
INSERT INTO `sys_resource` VALUES ('23', '课程教学管理', '0', null, '0', '0', '', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('24', '课程简介', '1', null, '23', '23', null, '1', null, '/course/index', null);
INSERT INTO `sys_resource` VALUES ('25', '课堂教学', '1', null, '23', '23', null, '1', null, '/class/index', null);
INSERT INTO `sys_resource` VALUES ('26', '作业管理', '1', null, '23', '23', null, '1', null, '/task/index', null);
INSERT INTO `sys_resource` VALUES ('27', '考试管理', '1', null, '23', '23', null, '1', null, '/exam/index', null);
INSERT INTO `sys_resource` VALUES ('29', '人员管理', '0', null, '0', '0', '', '1', null, null, null);
INSERT INTO `sys_resource` VALUES ('30', '教师管理', '1', null, '29', '29', null, '1', null, '/teacher/index', null);
INSERT INTO `sys_resource` VALUES ('31', '学生管理', '1', null, '29', '29', null, '1', null, '/student/index', null);
INSERT INTO `sys_resource` VALUES ('32', '课程组管理', '1', null, '29', '29', null, '1', null, '/group/index', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', '不能删除', 'admin', '1,2,5,10,14,15,3,11,12,16,17,4,23,24,25,26,27,29,30,31', '1');
INSERT INTO `sys_role` VALUES ('2', '普通用户', '就是一般用户角色', 'user', '1,2,5,3,11,9', '1');
INSERT INTO `sys_role` VALUES ('5', '教师', '普通教师', 'teacher', '23,24,25,26,27,29,30,31', '1');
INSERT INTO `sys_role` VALUES ('6', '教师助理', '', 'zhuli', '23,26,27', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('7', 'admin', 'ee0f01d962a9c7189c727f3a4cecbace', 'aa6cc0cc67e847db28cc173a7a03b977', '1', null, 'Yage', '15201895065', '1749362086@qq.com', '', null, null);
INSERT INTO `sys_user` VALUES ('8', '15721377', '316198d639dfc144ba53fdebc746fe4d', 'e6c93efe91b0ecb9e527a6cc6f7245be', '5', null, '王徐龙', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('9', '123', '8e4e5d489e930984902adb4cad6a1f43', '420fb3fab064011e0a578f65cd39b91b', '5', null, '李昌亚', null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('11', '12345', '7fce0e1e1f0f479a144b3339cb2d0b09', 'b0db4809861b73797060f2a0739f11cd', '6', null, null, null, null, null, null, null);

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

-- ----------------------------
-- Table structure for t_attachment
-- ----------------------------
DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attachment
-- ----------------------------
INSERT INTO `t_attachment` VALUES ('7', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/', 'pic', 'application/msword');
INSERT INTO `t_attachment` VALUES ('8', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/', 'pic', 'application/msword');
INSERT INTO `t_attachment` VALUES ('9', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462947340839.jpg', 'DSC_0261.jpg', '.jpg');
INSERT INTO `t_attachment` VALUES ('10', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462948007345.lck', 'testlog0.log.3.lck', '.lck');
INSERT INTO `t_attachment` VALUES ('11', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462949105905.doc', '论文10720919.doc', '.doc');
INSERT INTO `t_attachment` VALUES ('12', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462949180126.jpg', 'DSC_0261.jpg', '.jpg');
INSERT INTO `t_attachment` VALUES ('13', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462974729911.doc', '论文10720919.doc', '.doc');
INSERT INTO `t_attachment` VALUES ('14', '/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1463032604458.txt', '设计模式观看顺序.txt', '.txt');
INSERT INTO `t_attachment` VALUES ('16', '/E:/IDEA-project/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1463055274354.txt', 'studentHomework/1463055274354.txt', '.txt');
INSERT INTO `t_attachment` VALUES ('17', '1463056740443.txt', 'android服务器.txt', 'text/plain');
INSERT INTO `t_attachment` VALUES ('18', 'upload\\studentHomework\\1463061688805.txt', 'android服务器.txt', 'text/plain');

-- ----------------------------
-- Table structure for t_course
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `schedule` varchar(255) DEFAULT NULL,
  `outline` varchar(1000) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `available` int(1) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('1', '数据结构', '2016-05-13 23:10:18', '2016-05-24 23:10:22', '', '课程信息的介绍啊上的风景阿里山的拉卡啦开始打飞机开了士大夫立刻', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for t_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_exam`;
CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `score` varchar(11) DEFAULT NULL,
  `year` int(1) DEFAULT NULL,
  `term` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam
-- ----------------------------
INSERT INTO `t_exam` VALUES ('1', '春季考试试卷', '这是一个简单的测试', '2016-05-20 00:00:00', '2016-05-19 00:00:00', null, '2016', '1');

-- ----------------------------
-- Table structure for t_exam_item
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_item`;
CREATE TABLE `t_exam_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `exam_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_exam_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_group
-- ----------------------------
DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_group
-- ----------------------------
INSERT INTO `t_group` VALUES ('1', '数据结构课程组简介', '<font size=\"3\">数据结构是计算机学科的算法理论基础和软件设计的技术基础，主要研究信息的逻辑结构及其基本操作在计算机中的表示和实现。 它不仅是计算机学科各专业的核心课程，而且已成为其它理工科专业的热门选修课。&nbsp;\r\n</font><div><font size=\"3\" color=\"#7bd148\"><b><br></b></font></div><div><font size=\"3\" color=\"#444444\"><b>本课程的先修课程：高级语言程序设计，离散数学， 后续课程：操作系统、编译原理、数据库系统等课程。</b></font></div>', '2016-05-11 23:29:02');

-- ----------------------------
-- Table structure for t_homework
-- ----------------------------
DROP TABLE IF EXISTS `t_homework`;
CREATE TABLE `t_homework` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `finsh_time` datetime DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `task_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `student_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_homework
-- ----------------------------
INSERT INTO `t_homework` VALUES ('4', '天外有天呀', '与太容易天人合一', '2016-05-27 00:00:00', null, null, '9', '2016-05-11 14:15:40', null);
INSERT INTO `t_homework` VALUES ('8', '数据结构中图的遍历', '任务图如图一', '2016-05-28 00:00:00', null, null, '13', '2016-05-11 21:52:10', null);
INSERT INTO `t_homework` VALUES ('9', '饭店会有人跳舞花', '三个分发给回复', '2016-05-20 00:00:00', null, null, '11', '2016-05-11 14:45:06', null);
INSERT INTO `t_homework` VALUES ('10', '有太阳雨天', '体育体育体育', '2016-05-27 00:00:00', null, null, null, '2016-05-11 14:45:41', null);
INSERT INTO `t_homework` VALUES ('11', '发的广泛地', '有体育他人', '2016-05-07 00:00:00', null, null, '12', '2016-05-11 14:46:20', null);
INSERT INTO `t_homework` VALUES ('13', '第三词典词典', '啊地税分局啊啥都', null, null, '2', '16', '2016-05-12 20:14:34', '2');
INSERT INTO `t_homework` VALUES ('14', '测试提及哦啊目录', '按属地发士大夫', null, null, '2', '17', '2016-05-12 20:38:54', '2');
INSERT INTO `t_homework` VALUES ('15', '看看体积', '看看祖业', null, null, '1', null, '2016-05-12 21:18:15', '2');
INSERT INTO `t_homework` VALUES ('16', '123123', '123123', null, null, '1', null, '2016-05-12 21:20:41', '2');
INSERT INTO `t_homework` VALUES ('17', '坎坎坷坷', '啊手动阀手动阀', null, null, '1', '18', '2016-05-12 22:01:24', '2');
INSERT INTO `t_homework` VALUES ('18', '第一次阿斯顿阿斯蒂芬', '阿斯蒂芬阿斯蒂芬', null, null, '7', null, '2016-05-12 23:36:10', '2');

-- ----------------------------
-- Table structure for t_material
-- ----------------------------
DROP TABLE IF EXISTS `t_material`;
CREATE TABLE `t_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_material_course` (`course_id`),
  CONSTRAINT `pk_material_course` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_material
-- ----------------------------

-- ----------------------------
-- Table structure for t_note
-- ----------------------------
DROP TABLE IF EXISTS `t_note`;
CREATE TABLE `t_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_note_student` (`student_id`),
  KEY `fk_note_course` (`course_id`),
  CONSTRAINT `fk_note_course` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_note_student` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_note
-- ----------------------------

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `desc` varchar(1000) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_plan_teacher` (`teacher_id`),
  CONSTRAINT `pk_plan_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------

-- ----------------------------
-- Table structure for t_seminar
-- ----------------------------
DROP TABLE IF EXISTS `t_seminar`;
CREATE TABLE `t_seminar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_seminar_course` (`course_id`),
  CONSTRAINT `pk_seminar_course` FOREIGN KEY (`course_id`) REFERENCES `t_course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seminar
-- ----------------------------

-- ----------------------------
-- Table structure for t_seminar_topic
-- ----------------------------
DROP TABLE IF EXISTS `t_seminar_topic`;
CREATE TABLE `t_seminar_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `demand` varchar(255) DEFAULT NULL,
  `seminar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_seminar_siminar_topic` (`seminar_id`),
  CONSTRAINT `pk_seminar_siminar_topic` FOREIGN KEY (`seminar_id`) REFERENCES `t_seminar` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_seminar_topic
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `student_number` varchar(255) DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `seminar_topic_id` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_student_seminar_topic` (`seminar_topic_id`),
  CONSTRAINT `pk_student_seminar_topic` FOREIGN KEY (`seminar_topic_id`) REFERENCES `t_seminar_topic` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('2', '王旭龙', '1', null, '2016-05-03', '15721377', '2016-05-04 00:00:00', null, '2016-05-11 14:10:52', null, 'YWRtaW4xMjM=');

-- ----------------------------
-- Table structure for t_task
-- ----------------------------
DROP TABLE IF EXISTS `t_task`;
CREATE TABLE `t_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `attachment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pk_task_teacher` (`teacher_id`),
  KEY `pk_task_course` (`course_id`),
  KEY `pk_task_attachment` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_task
-- ----------------------------
INSERT INTO `t_task` VALUES ('1', '体育', ' 为同一家', '2016-05-12 13:57:35', '2016-05-20 00:00:00', '1', '1', null);
INSERT INTO `t_task` VALUES ('2', '书拒绝你', '爱空间的规划让', '2016-05-12 13:54:36', '2016-05-20 00:00:00', '1', '1', null);
INSERT INTO `t_task` VALUES ('4', '看清我耳机套期望i', '二维图人员', '2016-05-12 13:56:44', '2016-05-20 00:00:00', '1', '1', '14');
INSERT INTO `t_task` VALUES ('6', '提交论文', '提及哦啊论', '2016-05-12 23:30:55', '2016-05-14 00:00:00', '1', '1', null);
INSERT INTO `t_task` VALUES ('7', '再弄一次', '好好学习', '2016-05-12 23:35:17', '2016-05-28 00:00:00', '1', '1', null);

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `job_number` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `join_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_number` (`job_number`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', 'wxl', '1', '410426199004025559', null, '15721377', '2016-05-12', null, null, '2016-05-12 14:58:59', '有趣风魔');
INSERT INTO `t_teacher` VALUES ('2', '王徐龙', '1', '410426199004025559', null, '15721376', '2016-05-09', '2016-05-26 00:00:00', null, '2016-05-10 21:10:25', null);
INSERT INTO `t_teacher` VALUES ('3', '李昌亚', '0', '121212', null, '123', '2016-05-05', '2016-05-17 00:00:00', null, '2016-05-12 13:33:15', '<div style=\"text-align: center;\"><span style=\"line-height: 1.5; text-align: left;\"><font color=\"#16a765\">工作认证亲</font></span><br></div>');
