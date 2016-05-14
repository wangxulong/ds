# Host: localhost  (Version: 5.1.73-community)
# Date: 2016-05-14 22:55:43
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "sys_resource"
#

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

#
# Data for table "sys_resource"
#

INSERT INTO `sys_resource` VALUES (1,'系统管理','0',1,0,'0','',1,NULL,NULL,NULL),(2,'用户管理','1',1,1,'1','',1,NULL,'/sys/user/index',NULL),(3,'角色管理','1',2,1,'1','',1,NULL,'/sys/role/index',NULL),(4,'资源管理','1',3,1,'1','',1,NULL,'/sys/res/index',NULL),(5,'添加系统账号','2',1,2,'1-2','sysUser:add',1,NULL,NULL,NULL),(10,'删除用户','2',NULL,2,'1-2','sysUser:delete',1,NULL,NULL,NULL),(11,'添加角色','2',NULL,3,'1-3','sysRole:add',1,NULL,NULL,NULL),(12,'删除角色','2',NULL,3,'1-3','sysRole:delete',1,NULL,NULL,NULL),(14,'分配角色','2',3,2,'1-2','sysUser:allotRole',1,NULL,NULL,NULL),(15,'修改系统账号','2',1,2,'1-2','sysUser:edit',1,NULL,NULL,NULL),(16,'分配资源','2',1,3,'1-3','sysRole:allotRes',1,NULL,NULL,NULL),(17,'修改角色','2',1,3,'1-3','sysRole:edit',1,NULL,NULL,NULL),(23,'课程教学管理','0',NULL,0,'0','',1,NULL,NULL,NULL),(24,'课程简介','1',NULL,23,'23',NULL,1,NULL,'/course/index',NULL),(25,'课堂教学','1',NULL,23,'23',NULL,1,NULL,'/class/index',NULL),(26,'作业管理','1',NULL,23,'23',NULL,1,NULL,'/task/index',NULL),(27,'考试管理','1',NULL,23,'23',NULL,1,NULL,'/exam/index',NULL),(29,'人员管理','0',NULL,0,'0','',1,NULL,NULL,NULL),(30,'教师管理','1',NULL,29,'29',NULL,1,NULL,'/teacher/index',NULL),(31,'学生管理','1',NULL,29,'29',NULL,1,NULL,'/student/index',NULL),(32,'课程组管理','1',NULL,29,'29',NULL,1,NULL,'/group/index',NULL);

#
# Structure for table "sys_role"
#

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

#
# Data for table "sys_role"
#

INSERT INTO `sys_role` VALUES (1,'超级管理员','不能删除','admin','1,2,5,10,14,15,3,11,12,16,17,4,23,24,25,26,27,29,30,31',1),(2,'普通用户','就是一般用户角色','user','1,2,5,3,11,9',1),(5,'教师','普通教师','teacher','23,24,25,26,27,29,30,31',1),(6,'教师助理','','zhuli','23,26,27',1);

#
# Structure for table "sys_user"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Data for table "sys_user"
#

INSERT INTO `sys_user` VALUES (7,'admin','ee0f01d962a9c7189c727f3a4cecbace','aa6cc0cc67e847db28cc173a7a03b977','1',NULL,'Yage','15201895065','1749362086@qq.com','',NULL,NULL),(8,'15721377','316198d639dfc144ba53fdebc746fe4d','e6c93efe91b0ecb9e527a6cc6f7245be','5',NULL,'王徐龙',NULL,NULL,NULL,NULL,NULL),(9,'123','8e4e5d489e930984902adb4cad6a1f43','420fb3fab064011e0a578f65cd39b91b','5',NULL,'李昌亚',NULL,NULL,NULL,NULL,NULL),(11,'12345','7fce0e1e1f0f479a144b3339cb2d0b09','b0db4809861b73797060f2a0739f11cd','6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'15721370','e6975eb10106572a5cdfd0e588f4a22c','6f4b94585faa00fb175937b31c2e416e','5',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'15721371','ab4077c0b99b61e90c8eb4692b38ed52','6de93e9b9d33a762d75ed4102ed688c9','5',NULL,'刘建军',NULL,NULL,NULL,NULL,NULL);

#
# Structure for table "t_attachment"
#

DROP TABLE IF EXISTS `t_attachment`;
CREATE TABLE `t_attachment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "t_attachment"
#

INSERT INTO `t_attachment` VALUES (7,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/','pic','application/msword'),(8,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/','pic','application/msword'),(9,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462947340839.jpg','DSC_0261.jpg','.jpg'),(10,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462948007345.lck','testlog0.log.3.lck','.lck'),(11,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462949105905.doc','论文10720919.doc','.doc'),(12,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462949180126.jpg','DSC_0261.jpg','.jpg'),(13,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1462974729911.doc','论文10720919.doc','.doc'),(14,'/D:/github/project/test/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1463032604458.txt','设计模式观看顺序.txt','.txt'),(16,'/E:/IDEA-project/ds/classes/artifacts/ds_web_Web_exploded/WEB-INF/classes/1463055274354.txt','studentHomework/1463055274354.txt','.txt'),(17,'1463056740443.txt','android服务器.txt','text/plain'),(18,'upload\\studentHomework\\1463061688805.txt','android服务器.txt','text/plain');

#
# Structure for table "t_course"
#

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

#
# Data for table "t_course"
#

INSERT INTO `t_course` VALUES (1,'数据结构','2016-05-13 23:10:18','2016-05-24 23:10:22','','课程信息的介绍啊上的风景阿里山的拉卡啦开始打飞机开了士大夫立刻',1,1,1,1,NULL);

#
# Structure for table "t_exam"
#

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

#
# Data for table "t_exam"
#

INSERT INTO `t_exam` VALUES (1,'春季考试试卷','这是一个简单的测试','2016-05-20 00:00:00','2016-05-19 00:00:00',NULL,2016,1);

#
# Structure for table "t_exam_item"
#

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

#
# Data for table "t_exam_item"
#


#
# Structure for table "t_group"
#

DROP TABLE IF EXISTS `t_group`;
CREATE TABLE `t_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "t_group"
#

INSERT INTO `t_group` VALUES (1,'数据结构课程组简介','<font size=\"3\"><span style=\"color: rgb(87, 87, 87); font-family: Arial, sans-serif; line-height: 18px;\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;该课程组，上海大学计算机工程与科学学院的前身为始建于 1988年由上海工业大学计算机工程系和上海科技大学计算机科学系联合成立的计算机学院。该学院是在钱伟长校长亲切关怀下成立的上海市高校中第一所计算机学院。1994年，随着新上海大学的诞生，联合成立的计算机学院正式命名为上海大学计算机工程与科学学院，上海科技高等专科学校计算机系和原上海大学计算机应用系也一起并入。</span>&nbsp;&nbsp;</font>','2016-05-11 23:29:02');

#
# Structure for table "t_homework"
#

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

#
# Data for table "t_homework"
#

INSERT INTO `t_homework` VALUES (4,'天外有天呀','与太容易天人合一','2016-05-27 00:00:00',NULL,NULL,9,'2016-05-11 14:15:40',NULL),(8,'数据结构中图的遍历','任务图如图一','2016-05-28 00:00:00',NULL,NULL,13,'2016-05-11 21:52:10',NULL),(9,'饭店会有人跳舞花','三个分发给回复','2016-05-20 00:00:00',NULL,NULL,11,'2016-05-11 14:45:06',NULL),(10,'有太阳雨天','体育体育体育','2016-05-27 00:00:00',NULL,NULL,NULL,'2016-05-11 14:45:41',NULL),(11,'发的广泛地','有体育他人','2016-05-07 00:00:00',NULL,NULL,12,'2016-05-11 14:46:20',NULL),(13,'第三词典词典','啊地税分局啊啥都',NULL,NULL,2,16,'2016-05-12 20:14:34',2),(14,'测试提及哦啊目录','按属地发士大夫',NULL,NULL,2,17,'2016-05-12 20:38:54',2),(15,'看看体积','看看祖业',NULL,NULL,1,NULL,'2016-05-12 21:18:15',2),(16,'123123','123123',NULL,NULL,1,NULL,'2016-05-12 21:20:41',2),(17,'坎坎坷坷','啊手动阀手动阀',NULL,NULL,1,18,'2016-05-12 22:01:24',2),(18,'第一次阿斯顿阿斯蒂芬','阿斯蒂芬阿斯蒂芬',NULL,NULL,7,NULL,'2016-05-12 23:36:10',2);

#
# Structure for table "t_material"
#

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

#
# Data for table "t_material"
#


#
# Structure for table "t_seminar"
#

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

#
# Data for table "t_seminar"
#


#
# Structure for table "t_seminar_topic"
#

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

#
# Data for table "t_seminar_topic"
#


#
# Structure for table "t_student"
#

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

#
# Data for table "t_student"
#

INSERT INTO `t_student` VALUES (2,'王旭龙',1,NULL,'2016-05-03','15721377','2016-05-04 00:00:00',NULL,'2016-05-11 14:10:52',NULL,'YWRtaW4xMjM=');

#
# Structure for table "t_note"
#

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

#
# Data for table "t_note"
#


#
# Structure for table "r_homework_student"
#

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

#
# Data for table "r_homework_student"
#


#
# Structure for table "r_course_student"
#

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

#
# Data for table "r_course_student"
#

INSERT INTO `r_course_student` VALUES (1,1,2);

#
# Structure for table "t_task"
#

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

#
# Data for table "t_task"
#

INSERT INTO `t_task` VALUES (1,'体育',' 为同一家','2016-05-12 13:57:35','2016-05-20 00:00:00',1,1,NULL),(2,'书拒绝你','爱空间的规划让','2016-05-12 13:54:36','2016-05-20 00:00:00',1,1,NULL),(4,'看清我耳机套期望i','二维图人员','2016-05-12 13:56:44','2016-05-20 00:00:00',1,1,14),(7,'再弄一次','好好学习','2016-05-12 23:35:17','2016-05-28 00:00:00',1,1,NULL);

#
# Structure for table "t_teacher"
#

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
  `grade` varchar(20) NOT NULL DEFAULT '讲师',
  `state` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_number` (`job_number`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "t_teacher"
#

INSERT INTO `t_teacher` VALUES (1,'wxl',1,'410426199004025559',NULL,'15721377','1993-07-22',NULL,NULL,'2016-05-12 14:58:59','有趣风魔','讲师',1),(2,'王徐龙',1,'410426199004025559',NULL,'15721376','2016-05-09','2016-05-26 00:00:00',NULL,'2016-05-10 21:10:25',NULL,'讲师',1),(3,'李昌亚',0,'121212',NULL,'123','1993-02-09','2016-05-17 00:00:00',NULL,'2016-05-12 13:33:15','<div style=\"text-align: center;\"><span style=\"line-height: 1.5; text-align: left;\"><font color=\"#16a765\">工作认证亲</font></span><br></div>','讲师',1),(4,'李昌亚',1,'123456789121314567',NULL,'15721370','1991-02-06','2016-05-20 00:00:00',NULL,'2016-05-14 20:21:11','我是一名教师','讲师',1),(5,'刘建军',1,'1234567895623145647894',NULL,'15721371','1992-07-02','2016-05-05 00:00:00',NULL,'2016-05-14 22:43:57','负责教学数据结构','助教',0);

#
# Structure for table "t_plan"
#

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

#
# Data for table "t_plan"
#


#
# Structure for table "tb_category"
#

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

#
# Data for table "tb_category"
#

INSERT INTO `tb_category` VALUES (1,'root',NULL,0,1,NULL),(2,'衣',NULL,1,1,'2016-03-01 20:42:17'),(3,'食',NULL,1,1,'2016-03-01 20:42:36'),(4,'住',NULL,1,1,'2016-03-01 20:42:51'),(5,'行',NULL,1,1,'2016-03-01 20:43:00'),(6,'其他',NULL,1,1,'2016-03-01 20:43:10');

#
# Structure for table "tb_comment"
#

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

#
# Data for table "tb_comment"
#

INSERT INTO `tb_comment` VALUES (1,7,4,1,'可以啊谔谔',NULL,'2016-02-28 19:30:45'),(2,7,4,1,'你说呢额',NULL,'2016-02-28 19:30:56'),(3,7,4,1,'1111',NULL,'2016-02-28 20:03:07'),(4,7,4,1,'222',NULL,'2016-02-28 20:03:25'),(5,7,7,1,'更具ListView的内容设置高度',NULL,'2016-02-29 20:36:53'),(6,7,5,1,'123',NULL,'2016-03-01 23:33:15'),(7,7,5,1,'123',NULL,'2016-03-01 23:33:15'),(8,7,3,1,'circuit',NULL,'2016-03-01 23:34:24'),(9,7,3,1,'Dodd',NULL,'2016-03-01 23:36:26'),(10,7,2,1,'SAS',NULL,'2016-03-01 23:36:43'),(11,7,2,1,'DKK',NULL,'2016-03-01 23:38:55'),(12,7,4,1,'CSX',NULL,'2016-03-01 23:39:19'),(13,7,4,1,'GH',NULL,'2016-03-01 23:43:31'),(14,7,4,1,'科目三',NULL,'2016-03-02 09:06:03'),(18,7,11,1,'重中之重',NULL,'2016-03-06 18:48:08'),(19,7,4,1,'谈恋爱',NULL,'2016-03-06 18:50:20'),(20,7,4,1,'贪恋吖',NULL,'2016-03-06 18:50:37'),(21,7,5,1,'畅快淋漓',NULL,'2016-03-10 19:36:15'),(22,7,7,1,'畅快淋漓慧❤',NULL,'2016-03-10 19:37:03'),(23,7,7,1,'alert(122);',NULL,'2016-03-10 19:37:56'),(24,7,7,1,'Z成绩出来了',NULL,'2016-03-10 19:38:09'),(25,7,7,1,'Hhd',NULL,'2016-03-10 19:38:25'),(26,7,7,1,'吉吉吉',NULL,'2016-03-14 11:17:01'),(27,7,7,1,'喝☕☕☕☕',NULL,'2016-03-14 11:17:52');

#
# Structure for table "tb_favorite"
#

DROP TABLE IF EXISTS `tb_favorite`;
CREATE TABLE `tb_favorite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `content_id` bigint(20) DEFAULT NULL,
  `content_type` tinyint(4) DEFAULT NULL COMMENT '0 需求 1 服务',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_favorite"
#


#
# Structure for table "tb_message"
#

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

#
# Data for table "tb_message"
#


#
# Structure for table "tb_require"
#

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

#
# Data for table "tb_require"
#

INSERT INTO `tb_require` VALUES (1,7,'one',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,0),(2,7,'重大改革','研究生不用上课',NULL,NULL,1,'2016-02-26 20:37:55',NULL,NULL,NULL,NULL,3),(3,7,'为什么要上Z语言','真的是浪费时间做没意思的事情',NULL,NULL,1,'2016-02-27 08:53:37',NULL,NULL,NULL,NULL,0),(4,7,'看看是不是动态','看见一个漂亮的女孩子',NULL,NULL,1,'2016-02-27 09:58:52',NULL,NULL,NULL,NULL,3),(5,7,'上大要收掉技艺大','是真的吗',NULL,NULL,1,'2016-02-28 20:19:37',NULL,NULL,NULL,NULL,1),(6,7,'你问我打','你问我打',NULL,NULL,1,'2016-02-29 20:13:44',NULL,NULL,NULL,NULL,1),(7,7,'解决ListView高度','解决ListView高度',NULL,NULL,1,'2016-02-29 20:35:51',NULL,NULL,NULL,NULL,1),(8,7,'想买个二手大衣','想买个二手大衣',NULL,NULL,0,'2016-03-01 20:44:20',NULL,NULL,NULL,NULL,3),(9,7,'找人一起合租','找人一起合租',NULL,NULL,0,'2016-03-01 20:46:23',NULL,NULL,NULL,NULL,3),(10,7,'一起爬上赏月','一起爬上赏月',NULL,NULL,0,'2016-03-01 20:47:42',NULL,NULL,NULL,NULL,3),(11,7,'今天的测试问答','问答出来了没有',NULL,NULL,1,'2016-03-02 09:26:28',NULL,NULL,NULL,NULL,3);

#
# Structure for table "tb_require_attach"
#

DROP TABLE IF EXISTS `tb_require_attach`;
CREATE TABLE `tb_require_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `require_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "tb_require_attach"
#

INSERT INTO `tb_require_attach` VALUES (1,8,0,'IMG_0434.JPG','1456836260928.JPG'),(2,9,0,'IMG_0190.JPG','1456836383038.JPG'),(3,10,0,'1jpg.jpg','1456836462458.jpg');

#
# Structure for table "tb_service"
#

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

#
# Data for table "tb_service"
#


#
# Structure for table "tb_service_attach"
#

DROP TABLE IF EXISTS `tb_service_attach`;
CREATE TABLE `tb_service_attach` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tb_service_attach"
#


#
# Structure for table "tb_tag"
#

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

#
# Data for table "tb_tag"
#

