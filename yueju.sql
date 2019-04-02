/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost
 Source Database       : yueju

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : utf-8

 Date: 04/02/2019 17:07:20 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码（需要md5加密）',
  `tel` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `level` int(1) DEFAULT NULL COMMENT '权限',
  `img_src` varchar(255) DEFAULT NULL,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信open_id',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

-- ----------------------------
--  Records of `t_admin`
-- ----------------------------
BEGIN;
INSERT INTO `t_admin` VALUES ('21', 'admin', '管理员test', '21232f297a57a5a743894a0e4a801fc3', '15004653965', '1', 'images/photos/user1.png', '2017-02-15 22:53:20', null), ('38', 'zhangsan', '张三', '21232f297a57a5a743894a0e4a801fc3', '13012362374', '3', 'images/photos/user2.png', '2017-02-15 23:34:02', null), ('47', 'lisi', '李四', '21232f297a57a5a743894a0e4a801fc3', '13904514567', '3', 'images/photos/user3.png', '2017-02-27 16:27:46', null), ('49', 'admin1', 'admin1', 'd41d8cd98f00b204e9800998ecf8427e', '13123456788', '1', null, '2017-05-26 10:07:09', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_cancel`
-- ----------------------------
DROP TABLE IF EXISTS `t_cancel`;
CREATE TABLE `t_cancel` (
  `cancel_id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` text COMMENT '取消原因',
  `order_id` int(11) DEFAULT NULL COMMENT '订单编号',
  `cancel_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cancel_status` varchar(10) DEFAULT '未处理' COMMENT '取消状态（同意|拒绝|未处理）',
  PRIMARY KEY (`cancel_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_cancel_fk` FOREIGN KEY (`order_id`) REFERENCES `t_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单取消记录表';

-- ----------------------------
--  Table structure for `t_checkin`
-- ----------------------------
DROP TABLE IF EXISTS `t_checkin`;
CREATE TABLE `t_checkin` (
  `checkin_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '入住人姓名',
  `id_card` varchar(255) DEFAULT NULL COMMENT '入住人身份证',
  `tel` varchar(255) DEFAULT NULL COMMENT '入住人电话',
  `checkin_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '入住时间',
  `order_id` int(11) DEFAULT NULL COMMENT '关联订单id',
  PRIMARY KEY (`checkin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='入住信息记录表';

-- ----------------------------
--  Records of `t_checkin`
-- ----------------------------
BEGIN;
INSERT INTO `t_checkin` VALUES ('1', 'asd ', 'qweqwe', 'qweqwe', '2017-02-22 20:08:50', '4'), ('2', 'qqq', 'qqq', 'qqq', '2017-02-22 20:09:44', '1'), ('3', 'dfafefefe', '1333333333333333333', '13232323232', '2017-03-07 11:36:46', '4'), ('4', 'fdafdafdsafd', '3333333333333333', '11111111111111', '2017-03-07 11:38:27', '4'), ('5', '', '', '', '2017-03-10 18:56:11', '8'), ('6', 'zs', '1234', '123', '2017-03-12 10:13:08', '8'), ('7', 'lisi', '2345', '234', '2017-03-12 10:13:08', '8'), ('8', 'wwww', '123', '123', '2017-03-12 11:43:10', '8'), ('9', 'aaa', '234', '234', '2017-03-12 11:43:10', '8'), ('10', '123', '123', '123', '2017-03-12 11:45:13', '8'), ('11', '456', '456', '456', '2017-03-12 11:45:13', '8'), ('16', '发疯', '234545678908765645', '13232323232', '2017-04-23 09:44:24', '100'), ('17', '123', '234545678908765645', '13232323232', '2017-04-23 09:44:24', '100'), ('18', '发发的撒', '234545678908765645', '13232323232', '2017-04-23 10:11:27', '100'), ('19', '放大放大', '234545678908765645', '13232323232', '2017-04-23 10:11:27', '100'), ('30', 'bb', '124', '124', '2017-05-28 23:27:01', '109'), ('31', 'cc', '125', '125', '2017-05-28 23:27:01', '109'), ('32', 'dd', '127', '127', '2017-05-28 23:27:01', '109');
COMMIT;

-- ----------------------------
--  Table structure for `t_collect`
-- ----------------------------
DROP TABLE IF EXISTS `t_collect`;
CREATE TABLE `t_collect` (
  `collect_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  `collect_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`collect_id`),
  KEY `user_id` (`user_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_collect_fk` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_collect_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='收藏房源记录表';

-- ----------------------------
--  Records of `t_collect`
-- ----------------------------
BEGIN;
INSERT INTO `t_collect` VALUES ('2', '2', '2', '2017-02-05 16:05:39'), ('3', '3', '3', '2017-02-05 16:05:45'), ('4', '1', '2', '2017-02-05 16:06:02'), ('7', '1', '3', '2017-02-05 23:33:03'), ('8', '37', '2', '2017-03-17 15:46:15'), ('10', '37', '24', '2017-03-19 23:49:19'), ('11', '37', '1', '2017-04-11 13:50:24'), ('12', '52', '1', '2017-04-14 16:28:33');
COMMIT;

-- ----------------------------
--  Table structure for `t_combo`
-- ----------------------------
DROP TABLE IF EXISTS `t_combo`;
CREATE TABLE `t_combo` (
  `combo_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '套餐名称',
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  `start_time` date DEFAULT NULL COMMENT '套餐开始时间',
  `end_time` date DEFAULT NULL COMMENT '套餐结束时间',
  `price` float(6,0) DEFAULT NULL COMMENT '价格',
  `days` int(11) DEFAULT NULL COMMENT '起订天数',
  `combo_type_id` int(11) DEFAULT NULL COMMENT '套餐类型id',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='房源套餐信息表';

-- ----------------------------
--  Records of `t_combo`
-- ----------------------------
BEGIN;
INSERT INTO `t_combo` VALUES ('1', '冰雪大世界门票', '1', '2017-03-01', '2017-03-16', '100', '3', '1', null), ('5', '', '0', '0000-00-00', '0000-00-00', '0', '0', '0', null), ('6', 'bbbbbbbb', '1', '2017-02-28', '2017-04-06', '300', '2', '2', null), ('7', '太阳岛', '10', '2017-03-06', '2017-03-23', '400', '3', '1', 'http://www.taiyangdao.com.cn/index.html'), ('8', 'hhhh', '23', '2017-03-13', '2017-03-24', '300', '20', '2', ''), ('9', '群办家园一周+冰雪大世界门票', '26', '2017-03-01', '2017-03-08', '1500', '7', '1', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_combo_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_combo_type`;
CREATE TABLE `t_combo_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL COMMENT '套餐类型名称',
  `description` varchar(255) DEFAULT NULL COMMENT '套餐说明',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='房源套餐类型表';

-- ----------------------------
--  Records of `t_combo_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_combo_type` VALUES ('1', '门票', '各种门票'), ('2', '礼品', '各种礼品'), ('3', '天数', '多订优惠');
COMMIT;

-- ----------------------------
--  Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `comm_id` int(11) NOT NULL AUTO_INCREMENT,
  `comm_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `content` text COMMENT '评论内容',
  `score` varchar(255) DEFAULT NULL COMMENT '综合评分满分5分(整洁卫生5 分|交通位置5分|管理服务5 分|设施装修5分)',
  `clean_score` varchar(255) DEFAULT NULL,
  `traffic_score` varchar(255) DEFAULT NULL,
  `manage_score` varchar(255) DEFAULT NULL,
  `facility_score` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单',
  PRIMARY KEY (`comm_id`),
  KEY `user_id` (`user_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_comment_fk` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`),
  CONSTRAINT `user_comment_fk` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='房源评论信息表';

-- ----------------------------
--  Records of `t_comment`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment` VALUES ('1', '2017-03-19 20:38:28', '这是我的新评论', '3.5', '5', '4', '3', '2', '40', '23', '1'), ('2', '2017-03-19 21:04:28', '这是新评论', '3.5', '2', '3', '4', '5', '40', '23', '1'), ('3', '2017-03-19 21:04:59', '啊啊啊啊', '5', '5', '5', '5', '5', '40', '23', '1'), ('4', '2017-03-20 09:29:59', '环境真好', '4.25', '4', '4', '5', '4', '37', '24', '11'), ('5', '2017-03-20 13:03:54', '真不错', '4.75', '5', '4', '5', '5', '39', '2', '14'), ('6', '2017-04-11 14:37:16', 'fdfdfdfd', '4', '5', '3', '5', '3', '37', '1', '2'), ('7', '2017-04-11 14:45:51', 'fdafdafda', '4', '5', '4', '4', '3', '37', '1', '63'), ('8', '2017-04-14 19:48:52', '太好了', '4', '4', '4', '4', '4', '37', '24', '11'), ('9', '2017-04-14 20:08:35', 'fdfdf', '4', '4', '4', '4', '4', '37', '1', '66');
COMMIT;

-- ----------------------------
--  Table structure for `t_comment_img`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_img`;
CREATE TABLE `t_comment_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `img_thumb_src` varchar(255) DEFAULT NULL COMMENT '图片缩略图',
  `img_src` varchar(255) DEFAULT NULL COMMENT '评论原图',
  `comm_id` int(11) DEFAULT NULL COMMENT '评论id',
  PRIMARY KEY (`img_id`),
  KEY `comm_id` (`comm_id`),
  CONSTRAINT `comm_img_fk` FOREIGN KEY (`comm_id`) REFERENCES `t_comment` (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='评论图片信息表';

-- ----------------------------
--  Records of `t_comment_img`
-- ----------------------------
BEGIN;
INSERT INTO `t_comment_img` VALUES ('1', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '1'), ('2', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '1'), ('3', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '1'), ('4', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '4'), ('5', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '4'), ('6', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', null, '3'), ('7', 'uploads/comment/148863576176691.png', null, '6'), ('8', 'uploads/comment/148863595361849.png', null, '7'), ('9', 'uploads/comment/148863615940870.png', null, '9'), ('10', 'uploads/comment/148863622613242.png', null, '10'), ('11', 'uploads/comment/148863675661762.png', null, '12'), ('12', 'uploads/comment/149217030810164.png', null, '8'), ('13', 'uploads/comment/149217030853760.png', null, '8'), ('14', 'uploads/comment/149217171417118.png', null, '9');
COMMIT;

-- ----------------------------
--  Table structure for `t_developer`
-- ----------------------------
DROP TABLE IF EXISTS `t_developer`;
CREATE TABLE `t_developer` (
  `developer_id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_name` varchar(40) DEFAULT NULL COMMENT '开发商名称',
  `description` text COMMENT '开发商描述',
  `telephone` varchar(20) DEFAULT NULL COMMENT '开发商电话',
  `address` varchar(255) DEFAULT NULL COMMENT '开发商地址',
  `logo` varchar(255) DEFAULT NULL COMMENT '开发商logo',
  `is_delete` int(2) DEFAULT '0' COMMENT '0表示未删除 1表示已删除',
  `founding_time` date DEFAULT NULL COMMENT '公司成立时间',
  PRIMARY KEY (`developer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_developer`
-- ----------------------------
BEGIN;
INSERT INTO `t_developer` VALUES ('1', '恒大集团', '恒大集团是集地产、金融、健康、旅游及体育为一体的世界500强企业集团，总资产达万亿，年销售规模超4000亿，员工8万多人，解决就业170多万人，在全国200多个城市拥有地产项目600多个，已成为全球第一房企。到2020年，恒大将实现总资产超3万亿、房地产年销售规模超6000亿。', '4008893333', '广州市天河区', 'images/head-default.png', '1', null), ('2', 'test', '', '0451-12345678', '士大夫士大夫撒旦飞洒地方', 'uploads/developer/20170227141527_73513.png', '1', '2017-02-09'), ('3', '11', '&lt;p&gt;二分法撒旦飞洒地方撒发生阿斯顿发生的发生暗示法大是大非&lt;/p&gt;', '1111', '1111', 'uploads/developer/20170227142913_96575.png', '1', '2017-02-17'), ('4', '小宝房建公司', '<p>公司太牛逼</p>', '13456533556', '群力花园3栋301', 'images/head-default.png', '1', '2017-03-07'), ('5', '小小建筑有限公司', '<p>飞飞飞</p>', '13245678543', '群力花园3栋301', 'uploads/developer/盒模型css.png', '1', '2017-03-01'), ('6', '啊啊啊啊啊啊啊啊啊', '<p>嘎嘎而过</p>', '21212121', '群力花园3栋301', 'uploads/developer/盒模型.png', '1', '2017-03-06'), ('7', '哈尔滨万家好地产', '<p>哈尔滨万家好地产</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('8', '哈尔滨天渤万嘉地产', '<p>哈尔滨天渤万嘉地产</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('9', '哈尔滨综合开发建设有限公司', '<p>哈尔滨综合开发建设有限公司</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('10', '哈尔滨好民居建设投资发展有限公司', '<p>哈尔滨好民居建设投资发展有限公司</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('11', '哈尔滨市河松房地产开发有限责任公司', '<p>哈尔滨市河松房地产开发有限责任公司</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('12', '哈尔滨市新阳开发建设指挥部', '<p>哈尔滨市新阳开发建设指挥部</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('13', '哈尔滨市天昊房地产开发建设有限公司', '<p>哈尔滨市天昊房地产开发建设有限公司</p>', '', '', 'images/head-default.png', '0', '0000-00-00'), ('14', '放大放大', '<p>发发的撒aaddcc</p>', '13456533556', '群力花园3栋301', 'uploads/headImg/149553259727460.png', '0', '2017-04-04');
COMMIT;

-- ----------------------------
--  Table structure for `t_enter`
-- ----------------------------
DROP TABLE IF EXISTS `t_enter`;
CREATE TABLE `t_enter` (
  `enter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `id_card` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `enter_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`enter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_facility`
-- ----------------------------
DROP TABLE IF EXISTS `t_facility`;
CREATE TABLE `t_facility` (
  `facility_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '设备类型id',
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  PRIMARY KEY (`facility_id`),
  KEY `house_id` (`house_id`),
  KEY `facility_type_id` (`type_id`),
  CONSTRAINT `facility_type_fk` FOREIGN KEY (`type_id`) REFERENCES `t_facility_type` (`type_id`),
  CONSTRAINT `fk_house_facility` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='房源设备信息表';

-- ----------------------------
--  Records of `t_facility`
-- ----------------------------
BEGIN;
INSERT INTO `t_facility` VALUES ('1', '1', '1'), ('2', '2', '1'), ('3', '3', '1'), ('4', '4', '1'), ('5', '5', '1'), ('6', '6', '1'), ('7', '7', '1'), ('8', '8', '1'), ('9', '9', '1'), ('14', '1', '12'), ('15', '2', '12'), ('16', '8', '12'), ('23', '1', '16'), ('24', '2', '12'), ('25', '3', '16'), ('26', '3', '17'), ('27', '4', '17'), ('28', '1', '18'), ('29', '8', '18'), ('30', '1', '20'), ('31', '2', '20'), ('38', '1', '21'), ('39', '8', '21'), ('40', '1', '22'), ('41', '2', '22'), ('42', '3', '23'), ('43', '4', '23'), ('44', '1', '24'), ('45', '2', '24'), ('46', '1', '25'), ('47', '2', '25'), ('48', '1', '26'), ('49', '2', '26'), ('50', '3', '26'), ('51', '4', '26'), ('52', '5', '26'), ('53', '6', '26'), ('54', '7', '26'), ('55', '8', '26'), ('56', '9', '26'), ('59', '2', '28'), ('60', '3', '28'), ('61', '5', '28'), ('62', '6', '28'), ('63', '2', '29'), ('64', '3', '29'), ('67', '2', '27'), ('68', '3', '27'), ('71', '2', '30'), ('72', '3', '30');
COMMIT;

-- ----------------------------
--  Table structure for `t_facility_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_facility_type`;
CREATE TABLE `t_facility_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '设备名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '设备图标',
  `is_free` int(255) DEFAULT '0' COMMENT '是否付费（0免费|1收费）',
  `price` float(6,1) DEFAULT NULL COMMENT '收费价格',
  `remark` varchar(255) DEFAULT NULL COMMENT '设备备注',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='设备类型信息表';

-- ----------------------------
--  Records of `t_facility_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_facility_type` VALUES ('1', '冰箱', 'uploads/facilities/phone.png', '0', null, null), ('2', '洗衣机', 'uploads/facilities/TV.png', '0', null, null), ('3', '电视', 'uploads/facilities/pliers.png', '0', null, null), ('4', '电脑', 'uploads/facilities/shop.png', '0', null, null), ('5', '空调', 'uploads/facilities/hook.png', '0', null, null), ('6', '彩电', 'uploads/facilities/phone.png', '0', null, null), ('7', '床', 'uploads/facilities/phone.png', '1', '100.0', null), ('8', '沙发', 'uploads/facilities/phone.png', '1', '200.0', null), ('9', 'wifi', 'uploads/facilities/phone.png', '1', '300.0', null), ('10', 'aaa', 'uploads/149257370977544.png', '0', '0.0', '&lt;p&gt;fefe&lt;/p&gt;');
COMMIT;

-- ----------------------------
--  Table structure for `t_house`
-- ----------------------------
DROP TABLE IF EXISTS `t_house`;
CREATE TABLE `t_house` (
  `house_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '房源名称',
  `province` varchar(255) DEFAULT NULL COMMENT '省',
  `city` varchar(255) DEFAULT NULL COMMENT '市',
  `region` varchar(255) DEFAULT NULL COMMENT '区',
  `street` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `price` decimal(10,2) DEFAULT NULL COMMENT '基础价格',
  `structure_area` float(6,2) DEFAULT NULL,
  `area` float(6,2) DEFAULT NULL COMMENT '房源面积',
  `bedroom` int(11) DEFAULT NULL COMMENT '室',
  `livingroom` int(11) DEFAULT NULL COMMENT '厅',
  `lavatory` int(11) DEFAULT NULL COMMENT '卫',
  `notice` varchar(255) DEFAULT NULL COMMENT '入住须知',
  `traffic` varchar(255) DEFAULT NULL COMMENT '交通情况',
  `description` text,
  `plot_id` int(11) DEFAULT NULL COMMENT '小区编号',
  `is_sale` int(11) DEFAULT '0' COMMENT '是否出售',
  `sale_price` decimal(10,0) DEFAULT NULL COMMENT '出售价格',
  `floor` int(11) DEFAULT NULL COMMENT '楼层',
  `total_floors` int(11) DEFAULT NULL COMMENT '总楼层',
  `developer_id` int(11) DEFAULT NULL COMMENT '开发商',
  `video` text COMMENT '视频',
  `manager_id` int(11) DEFAULT NULL COMMENT '房屋管理员',
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='房源信息表';

-- ----------------------------
--  Records of `t_house`
-- ----------------------------
BEGIN;
INSERT INTO `t_house` VALUES ('1', '哈尔滨梧桐树公寓观景大床房', '黑龙江', '哈尔滨市', '道里区', '文化路', '0.01', '100.00', '25.00', '2', '1', '1', '啊飞洒发发的顺丰的飞洒发大水发是飞洒发的说法大厦法定是范德萨发生飞洒发的说法的说法方式方法是否', '这寒冷的冬天来套煎饼果子，这香香的味道让你神魂颠倒，火腿肠要不要，鸡蛋要不要，我说鸡蛋你说要，鸡蛋，要，鸡蛋，要，鸡蛋鸡蛋鸡蛋，要要要。。。。。78块5', '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '1', '1', '500000', '4', '7', '1', null, '21', '0'), ('2', '群力哈尔滨故事公寓一室一厅阳光套房', '黑龙江', '哈尔滨市', '南岸区', '劳务费', '1000.00', '100.00', '45.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '1', '0', null, null, null, null, null, '21', '0'), ('3', '哈西万达禧龙公寓地中海大床房', '黑龙江', '哈尔滨市', '道里区', '二和', '2000.00', '100.00', '55.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '1', '0', null, null, null, null, null, '21', '0'), ('4', '中央大街荣耀宝宇时尚索菲亚双大床四人', '黑龙江', '哈尔滨市', '道里区', '电话v个', '1800.00', '100.00', '30.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '2', '0', null, null, null, null, null, '21', '0'), ('5', '中央大街旁 索菲亚附近地中海风情大床房', '黑龙江', '哈尔滨市', '道里区', '都不', '1700.00', '100.00', '10.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '3', '0', null, null, null, null, null, '21', '0'), ('6', '哈西万达大盛公寓欧式大床房', '黑龙江', '哈尔滨市', '道里区', '度过', '1650.00', '100.00', '20.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '2', '0', null, null, null, null, null, '21', '0'), ('7', '中央大街82平复式《北北游子居》可做饭', '黑龙江', '哈尔滨市', '道里区', '安委会', '800.00', '100.00', '33.00', '2', '2', '1', null, null, '百度贴吧是以兴趣主题聚合志同道合者的互动平台，同好网友聚集在这里交流话题、展示自我、结交朋友。贴吧主题涵盖了娱乐、游戏、小说、地区、生活等各方面', '2', '0', null, null, null, null, null, '21', '0'), ('8', '乐松商圈凯旋广场温馨舒适的两居室', '黑龙江', '哈尔滨市', '道里区', ' sebv', '55.00', '100.00', '33.00', '2', '2', '1', null, null, null, '1', '0', null, null, null, null, null, '21', '0'), ('9', '学府四道街 复式豪宅', '黑龙江', '哈尔滨市', '道里区', '号v电话', '8888.00', '100.00', '33.00', '2', '2', '1', null, null, null, '2', '0', null, null, null, null, null, '21', '0'), ('10', '好的GV更待何时v喝点水', '黑龙江', '哈尔滨市', '道里区', '文化路', '12541.00', '100.00', '33.00', '2', '2', '1', null, null, null, '2', '0', null, null, null, null, null, '38', '0'), ('11', '哈尔滨哈西万达豪华家庭房 ', '黑龙江', '哈尔滨市', '道里区', 'sss', '333.00', '100.00', '33.00', '2', '2', '1', null, null, null, '3', '0', null, null, null, null, null, '21', '0'), ('12', '哈尔滨斯维登凯旋广场高级市景大床房', '黑龙江', '哈尔滨市', '南岗区', '凯旋广场', '315.00', '100.00', '33.00', '2', '1', '1', null, null, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">◆公寓位于香坊区乐松商圈，马路对面即是乐松购物广场，松雷商场和家乐福超市都伴其左右，在这里，无论是想购物、娱乐，或是美食，都可以一次性满足你，还有万达影城，酒足饭饱后还可以看场电影，感受好莱坞大片的震撼，在这里万达陪你度过一个美好的周末；</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">◆房间温馨舒适，家具家电一应俱全、配备全自动滚筒洗衣机、热水器、空调、42LED液晶电视（中央频道齐全）、高速WIFI，所有房间均为明窗，房间采用高星级酒店配备标准，干净、舒适、便捷的居住体验是您商务出差、旅游度假的首选。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">◆公寓近小吃街，步行可达，一路边逛边吃，小吃香气扑鼻，走进去，你变迈不动腿，在这里你可以满足自己吃货的心。交通便利，公交线路齐全，机场巴士二号线乐松广场站，距离哈西火车站、客运站二十分钟车程；周边餐饮、咖啡厅，娱乐场所齐全。</span></p>', '1', '0', null, null, null, null, '<embed src=\'http://player.youku.com/player.php/Type/Folder/Fid//Ob//sid/XMjYzNzYyMTM4MA==/v.swf\' quality=\'high\'  align=\'middle\' allowScriptAccess=\'always\' allowFullScreen=\'true\' mode=\'transparent\' type=\'application/x-shockwave-flash\'></embed>', '21', '0'), ('13', '哈尔滨斯维登凯旋广场高级市景大床房aaaaaaaaaaa', '黑龙江', '哈尔滨市', '道里区', 'bbbbbbbbbb', '4000.00', '100.00', '33.00', '3', '2', '2', null, null, '', '3', '0', null, null, null, null, null, '21', '0'), ('14', '哈尔滨斯维登凯旋广场高级市景大床房', '黑龙江', '哈尔滨市', '道里区', '凯旋广场', '0.01', '100.00', '33.00', '2', '2', '2', null, null, null, '1', '0', null, null, null, null, null, '21', '0'), ('15', '哈尔滨斯维登凯旋广场高级市景大床房vvvvvv', '黑龙江', '哈尔滨市', '市辖区', 'vvvvvvv', '11111.00', '100.00', '33.00', '1', '1', '1', null, null, '', '1', '0', null, null, null, null, null, '21', '0'), ('16', '观江国际豪华房', '黑龙江', '哈尔滨市', '道外区', '23445667号', '4500.00', '100.00', '33.00', '2', '1', '1', null, null, '<p>房子好的不得了啊</p>', '2', '0', null, null, null, null, null, '21', '0'), ('17', '群力花园豪华型', '黑龙江', '哈尔滨市', '市辖区', '群力花园3栋301', '5000.00', '100.00', '33.00', '3', '2', '2', '', '', '<p>放大放大</p>', '1', '0', null, null, null, null, null, '21', '0'), ('18', '方法反反复复反复', '黑龙江', '哈尔滨市', '市辖区', 'vvvvvvvvvvv', '5000.00', '100.00', '33.00', '3', '2', '2', '<p>噶哥哥哥哥</p>', '<p>嘎嘎个个</p>', '<p>刚发给人</p>', '2', '0', null, null, null, null, null, '21', '0'), ('19', '哈尔滨斯维登凯旋广场高级市景大床房', '黑龙江', '哈尔滨市', '道里区', 'faefeafef', '3000.00', '100.00', '33.00', '2', '1', '1', '', '', '', '1', '1', '500000', '4', '7', '2', '', '21', '0'), ('20', '去去去去去去去去去去', '黑龙江', '哈尔滨市', '市辖区', '发发的撒案发', '2222.00', '100.00', '33.00', '2', '1', '1', '&lt;p&gt;啊啊啊啊啊啊啊啊&lt;/p&gt;', '&lt;p&gt;啊啊啊啊啊啊啊啊&lt;/p&gt;', '&lt;p&gt;啊啊啊啊啊啊啊&lt;/p&gt;', '1', '0', '0', '0', '0', '1', '', '21', '1'), ('21', 'aaaaaaa', '黑龙江', '哈尔滨市', '市辖区', 'aaaaaaaa', '1111.00', '100.00', '33.00', '2', '1', '1', '&lt;p&gt;gagdsagd&lt;/p&gt;', '&lt;p&gt;gasgds&lt;/p&gt;', '&lt;p&gt;gagdagad&lt;/p&gt;', '1', '0', '0', '0', '0', '1', '', '21', '0'), ('22', 'testee', '黑龙江', '哈尔滨市', '市辖区', 'feeeeeeeeee', '3333.00', '100.00', '33.00', '2', '2', '2', '', '', '<p>fafe</p>', '1', '0', '0', '0', '0', '1', '', '21', '0'), ('23', '中央大街荣耀宝宇时尚索菲亚双大床四人间', '黑龙江', '哈尔滨市', '市辖区', '哈尔滨道里区宝宇荣耀上城温莎国际公寓 ', '1800.00', '100.00', '33.00', '3', '2', '1', 'qweqew', 'qweqweqwe', '<p>qweqweqwe</p>', '1', '1', '900000', '5', '12', '5', '', '21', '1'), ('24', '哈西浪漫公寓温馨大床房', '黑龙江', '哈尔滨市', '南岗区', '哈尔滨南岗区哈西万达公寓', '1200.00', '9999.99', '33.00', '2', '1', '1', '押金¥100.00银联标识信用卡外卡信用卡13:00之后入住12:00之前退房允许吸烟提供发票接待外宾允许带宠物\r\n24:00~24:00接待', '周边五百米服务：超市、菜市场、提款机、药店、餐厅、儿童乐园', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">哈尔滨素有东方小巴黎的美誉，中西合璧的城市风貌，粗犷豪放的民族风情令人沉醉。公寓坐落在美丽的哈尔滨西站旁，紧邻万达广场，步行15分钟便可到达哈尔滨西站。公寓主楼32层，开阔的视野让您一览北国冰城美景。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">公寓装修温馨整洁，房间宽敞明亮，舒适感极强。屋内摆放着有精美大雕花的欧式家具，以及梦幻的水晶吊灯，尽显奢华及典雅。整洁的卧床、柔软的床品，能带给您良好的休息与睡眠体验，让疲惫的身心得到及时的舒展和放松。公寓内24小时热水、液晶电视、十兆光纤、WiFi无线上网、冰箱、洗衣机等一应俱全，电磁炉、齐备的厨具餐具更是让身在异乡的您也能亲自下厨为家人朋友做上一顿可口的饭菜，卫生间内各种洗浴用品也很齐全。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">下楼过个马路就是繁华的万达商场，吃货们有许多美食可以选择，购物狂们也可以尽情享受买买买的快乐，广场上还会不定期举办夏日音乐会等各类活动。公寓周边有电影院，结束一天的行程再去悠闲地看场电影也是极好的，附近的超市也可为您的日常采买提供无限便利。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">距离哈西万达、西客站商圈3.9公里，约8分钟车程；</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">距离哈尔滨太平国际机场33.2公里，约5分钟车程。</span></p>', '1', '1', '500000', '2', '3', '4', '', '21', '1'), ('25', '近冰雪大世界百纳度假别墅', '黑龙江', '哈尔滨市', '松北区', '哈尔滨江北报达雅苑', '1200.00', '100.00', '33.00', '2', '1', '1', '押金¥1000.0014:00之后入住11:00之前退房提供发票银联标识信用卡外卡信用卡接待外宾允许吸烟允许带宠物\r\n00:00~24:00接待', '交通特方便', '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">致力于打造哈尔滨高B格聚会场地，我们不山寨，只做自己的独特风格。凯芙团队经营多家聚会别墅，多家情侣日租，聚会房，多种房源，多种选择，经营多年，经验丰富！别墅位于报达雅苑别墅区，安保严格，全程您无须担忧小伙伴的安全问题！24小时管家服务，随时随地为您解忧。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">1.KTV区域：海量曲库尽情下载，专业音响，喊破您的喉咙！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">2.台球区域：标准品牌台球桌，没事儿来一杆，管家小哥球技不错，可以一起约起来！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">3.就餐区：餐桌长度3.6米，容纳多人用餐。并可加桌！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">4.游戏区：配备Xbox&nbsp;360、街机（拳皇对打，五百合一，玩到手抖）多台游戏电脑，一起开LOL！别墅WiFI覆盖。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">5.厨艺区：我们将免费为您提供厨具餐具，天然气，电磁炉，带好您的食材，一展厨艺！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">6.全自动麻将机，嗨一晚赢到手软。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">7.独家大型桌上足球，另有桌上冰球，多人PK!</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">8.睡眠空间：纯实木上下铺，超长榻榻米，两张欧式大床，配备空调！</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">9.另有专业厨师可为您定制私家菜品，并免费提供烧烤炉具！&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, &quot;Hiragino Sans GB&quot;, &quot;Segoe UI&quot;, &quot;Microsoft Yahei&quot;, 微软雅黑, Tahoma, Arial, STHeiti, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">一切Ready，等您来！</span></p>', '4', '1', '80000', '3', '6', '7', '', '21', '0'), ('26', '群力家园新装修，拎包即住', '黑龙江', '哈尔滨市', '道里区', '机场路融江路', '220.00', '100.00', '33.00', '2', '1', '1', '提供发票，押金¥400，银联标识，信用卡，外卡，信用卡，12:00之后入住，14:00之前退房，允许吸烟，允许带宠物，接待外宾', '17路：滇池路站，龙章路公交首末站 71路：新三中站 32路：新三中站 95路：新三中站 218路：新三中站 59路：穆斯林小区站 113路：新三中站 125路：龙章路公交首末站 65路：群力家园A区站 66路：群力家园A区站', '<p>群力家园项目位于道里区规划伊春路，龙章路，东湖路周边地段，占地面积61.22万平方米，规划总面积约为210.37万平方米，规划住宅共95栋，住宅总建筑面积约166.47万平方米，商服总建筑面积约为9.34万平方米，其中可售商服面积为8.01万平方米，配建公共用房1.33万平方米。地下车库总建筑面积34.55万平方米。投资额约105.32亿元。项目划分为A区、B区、C区、D区、E区、F区、G区、K区、Q区和S区等10个独立封闭区域。分一期、二期建设。</p><p>小区容积率2.76，绿化面积19万平方米，绿化率30%，小区配建有1.2万平方米大型超市，有医疗中心，老少活动中心，体育健身中心，幼儿园和托儿所，中小学。为方便居民交通建设了公交枢纽站，目前经停小区的有65路、66路、33路、117路、124路和125路等6条公交线路。</p><p>指标：</p><p>用地面积：61.22万平方米</p><p>幢数：95栋</p><p>&nbsp;</p><p>楼层数：8、11、18、22、26层</p><p>&nbsp;</p><p>总建筑面积：210.37万平方米</p><p>&nbsp;</p><p>商铺面积：8.01万平方米</p><p>&nbsp;</p><p>住宅建筑面积：166.47万平方米</p><p>&nbsp;</p><p>地下车场建筑面积：34.55万平方米</p><p>&nbsp;</p><p>总户数：14124户</p><p>&nbsp;</p><p>小区车位：9219个</p><p><br/></p>', '9', '0', '0', '0', '0', '7', '', '21', '0'), ('27', 'fdafdafds', '黑龙江', '哈尔滨市', '市辖区', 'fdafdafa', '129.00', '70.00', '50.00', '2', '1', '1', 'fdafds', 'fdafdsa', '<p>fdafdasfdas</p>', '1', '0', '0', '0', '0', '7', '', '21', '0'), ('28', 'fdafdsa', '黑龙江', '哈尔滨市', '市辖区', 'fdasfd', '300.00', '70.00', '90.00', '2', '1', '1', 'fdsafdsa', 'fdsafds', '<p>fdasfdsa</p>', '1', '0', '0', '0', '0', '7', '', '21', '0'), ('29', 'fdasfdsafdsa', '黑龙江', '哈尔滨市', '市辖区', 'fdasfdsafdsaf', '198.00', '70.00', '90.00', '2', '1', '1', 'fdsafdsa', 'fdsafdsa', '<p>fdsafdsaf</p>', '1', '0', '0', '0', '0', '7', '', '21', '0'), ('30', 'aaaaaaaaaaaa', '黑龙江', '哈尔滨市', '市辖区', 'fdafdsafdsa', '176.00', '78.00', '98.00', '2', '1', '1', 'fdsafdsa', 'fdsafads', '<p>fdsafdsa</p>', '1', '0', '0', '0', '0', '7', '', '21', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_house_img`
-- ----------------------------
DROP TABLE IF EXISTS `t_house_img`;
CREATE TABLE `t_house_img` (
  `img_id` int(11) NOT NULL AUTO_INCREMENT,
  `is_main` int(1) DEFAULT NULL COMMENT '是否主图',
  `img_thumb_src` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `img_src` varchar(255) DEFAULT NULL COMMENT '源图',
  `description` varchar(255) DEFAULT NULL COMMENT '图片说明',
  `house_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_img_fk` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='房源图片信息表';

-- ----------------------------
--  Records of `t_house_img`
-- ----------------------------
BEGIN;
INSERT INTO `t_house_img` VALUES ('1', '0', 'uploads\\houseImg\\houseSmall\\housePic6.jpg', 'uploads\\houseImg\\houseBig\\housePic6.jpg', null, '1'), ('2', '0', 'uploads\\houseImg\\houseSmall\\housePic1.jpg', 'uploads\\houseImg\\houseBig\\housePic1.jpg', null, '1'), ('3', '1', 'uploads\\houseImg\\houseSmall\\housePic2.jpg', 'uploads\\houseImg\\houseBig\\housePic2.jpg', null, '1'), ('4', '0', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic3.jpg', null, '1'), ('5', '0', 'uploads\\houseImg\\houseSmall\\housePic4.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '1'), ('6', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '9'), ('7', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '10'), ('8', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '4'), ('9', '1', 'uploads\\houseImg\\houseSmall\\housePic4.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '2'), ('10', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '3'), ('11', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic3.jpg', null, '16'), ('12', '0', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic3.jpg', null, '16'), ('13', '1', 'uploads\\houseImg\\houseSmall\\housePic3.jpg', 'uploads\\houseImg\\houseBig\\housePic3.jpg', null, '12'), ('14', '0', 'uploads/houseImg/houseSmall/housePic4.jpg', 'uploads\\houseImg\\houseBig\\housePic4.jpg', null, '12'), ('17', '1', 'uploads/houseImg/houseSmall/148855513929687.png', 'uploads/houseImg/houseBig/148855513929687.png', null, '21'), ('18', '1', 'uploads/houseImg/houseSmall/148876674937239.png', 'uploads/houseImg/houseBig/148876674937239.png', null, '22'), ('19', '0', 'uploads/houseImg/houseSmall/148876675389333.png', 'uploads/houseImg/houseBig/148876675389333.png', null, '22'), ('20', '1', 'uploads/houseImg/houseSmall/148983832965751.jpg', 'uploads/houseImg/houseBig/148983832965751.jpg', null, '23'), ('21', '1', 'uploads/houseImg/houseSmall/148993832988953.jpg', 'uploads/houseImg/houseBig/148993832988953.jpg', null, '24'), ('22', '0', 'uploads/houseImg/houseSmall/148993833692026.jpg', 'uploads/houseImg/houseBig/148993833692026.jpg', null, '24'), ('23', '1', 'uploads/houseImg/houseSmall/148994236536344.jpg', 'uploads/houseImg/houseBig/148994236536344.jpg', null, '25'), ('24', '0', 'uploads/houseImg/houseSmall/148994237119614.jpg', 'uploads/houseImg/houseBig/148994237119614.jpg', null, '25'), ('25', '1', 'uploads/houseImg/houseSmall/148998164017572.jpg', 'uploads/houseImg/houseBig/148998164017572.jpg', null, '26'), ('26', '0', 'uploads/houseImg/houseSmall/148998166452610.jpg', 'uploads/houseImg/houseBig/148998166452610.jpg', null, '26'), ('27', '0', 'uploads/houseImg/houseSmall/148998170229360.jpg', 'uploads/houseImg/houseBig/148998170229360.jpg', null, '26'), ('28', '0', 'uploads/houseImg/houseSmall/148998170690022.jpg', 'uploads/houseImg/houseBig/148998170690022.jpg', null, '26'), ('29', '0', 'uploads/houseImg/houseSmall/148998172050130.jpg', 'uploads/houseImg/houseBig/148998172050130.jpg', null, '26'), ('30', '0', 'uploads/houseImg/houseSmall/148998172631871.jpg', 'uploads/houseImg/houseBig/148998172631871.jpg', null, '26'), ('31', '1', 'uploads/houseImg/houseSmall/149291548034091.png', 'uploads/houseImg/houseBig/149291548034091.png', null, '29'), ('34', '1', 'uploads/houseImg/houseSmall/149663487523360.png', 'uploads/houseImg/houseBig/149663487523360.png', null, '30'), ('35', '0', 'uploads/houseImg/houseSmall/149663487888966.png', 'uploads/houseImg/houseBig/149663487888966.png', null, '30');
COMMIT;

-- ----------------------------
--  Table structure for `t_house_rent_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_house_rent_type`;
CREATE TABLE `t_house_rent_type` (
  `rent_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rent_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_house_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_house_type`;
CREATE TABLE `t_house_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_house_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_house_type` VALUES ('1', '一室一厅'), ('2', '二室一厅'), ('3', '三室一厅'), ('4', '四室一厅');
COMMIT;

-- ----------------------------
--  Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '操作人员id',
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `log_content` varchar(255) DEFAULT NULL COMMENT '操作的功能',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8 COMMENT='管理员操作日志表';

-- ----------------------------
--  Records of `t_log`
-- ----------------------------
BEGIN;
INSERT INTO `t_log` VALUES ('1', '21', '2017-02-27 15:00:02', '进行了管理员管理的列表查询操作'), ('2', '21', '2017-02-27 15:00:16', '进行了管理员管理的列表查询操作'), ('3', '21', '2017-02-27 15:12:37', '进行了管理员管理的列表查询操作'), ('4', '21', '2017-02-27 15:36:25', '进行了管理员管理的列表查询操作'), ('5', '38', '2017-02-27 15:40:34', '进行了 管理员管理的列表查询 操作'), ('6', '38', '2017-02-27 15:50:00', '进行了 管理员管理的列表查询 操作'), ('7', '38', '2017-02-27 16:05:28', '进行了 管理员管理的列表查询 操作'), ('8', '38', '2017-02-27 16:09:59', '进行了 管理员管理的列表查询 操作'), ('9', '38', '2017-02-27 16:11:34', '进行了 管理员管理的列表查询 操作'), ('10', '38', '2017-02-27 16:11:55', '进行了 管理员管理的列表查询 操作'), ('11', '38', '2017-02-27 16:12:56', '进行了 管理员管理的列表查询 操作'), ('12', '38', '2017-02-27 16:12:58', '进行了 管理员管理的列表查询 操作'), ('13', '38', '2017-02-27 16:13:26', '进行了 管理员管理的列表查询 操作'), ('14', '38', '2017-02-27 16:23:23', '进行了 管理员管理的列表查询 操作'), ('15', '38', '2017-02-27 16:25:02', '进行了 管理员管理的列表查询 操作'), ('16', '38', '2017-02-27 16:25:46', '进行了 管理员管理的列表查询 操作'), ('17', '38', '2017-02-27 16:25:55', '进行了 管理员管理的列表查询 操作'), ('18', '38', '2017-02-27 16:25:58', '进行了 管理员管理的列表查询 操作'), ('19', '38', '2017-02-27 16:26:16', '进行了 管理员管理的列表查询 操作'), ('20', '38', '2017-02-27 16:26:18', '进行了 管理员管理的列表查询 操作'), ('21', '38', '2017-02-27 16:27:55', '进行了 管理员管理的列表查询 操作'), ('22', '38', '2017-02-27 16:29:27', '进行了 管理员管理的列表查询 操作'), ('23', '38', '2017-02-27 16:31:44', '进行了 管理员管理的列表查询 操作'), ('24', '38', '2017-02-27 16:33:14', '进行了 管理员管理的列表查询 操作'), ('25', '38', '2017-02-27 16:33:20', '进行了 管理员管理的列表查询 操作'), ('26', '38', '2017-02-27 16:34:03', '进行了 管理员管理的列表查询 操作'), ('27', '38', '2017-02-27 16:40:32', '进行了 管理员管理的列表查询 操作'), ('28', '38', '2017-02-27 16:41:18', '进行了 管理员管理的列表查询 操作'), ('29', '38', '2017-02-27 16:41:38', '进行了 管理员管理的列表查询 操作'), ('30', '38', '2017-02-27 16:41:43', '进行了 管理员管理的列表查询 操作'), ('31', '38', '2017-02-27 16:42:08', '进行了 管理员管理的列表查询 操作'), ('32', '38', '2017-02-27 16:42:18', '进行了 管理员管理的列表查询 操作'), ('33', '38', '2017-02-27 16:43:07', '进行了 管理员管理的列表查询 操作'), ('34', '38', '2017-02-27 16:49:10', '进行了 管理员管理的列表查询 操作'), ('35', '38', '2017-02-27 17:27:18', '进行了 管理员管理的列表查询 操作'), ('36', '38', '2017-02-27 17:27:40', '进行了 管理员管理的列表查询 操作'), ('37', '21', '2017-02-28 09:20:14', '进行了 设备管理列表查询 操作'), ('38', '21', '2017-02-28 09:20:17', '进行了 设备管理列表查询 操作'), ('39', '21', '2017-02-28 09:20:19', '进行了 用户管理的列表查询 操作'), ('40', '21', '2017-02-28 09:20:20', '进行了 用户管理 操作'), ('41', '21', '2017-02-28 09:20:21', '进行了 用户管理的列表查询 操作'), ('42', '21', '2017-02-28 09:20:21', '进行了 用户管理 操作'), ('43', '21', '2017-02-28 09:20:44', '进行了 用户管理的列表查询 操作'), ('44', '21', '2017-02-28 09:20:44', '进行了 用户管理 操作'), ('45', '21', '2017-02-28 09:21:06', '进行了 用户管理的列表查询 操作'), ('46', '21', '2017-02-28 09:21:06', '进行了 用户管理 操作'), ('47', '21', '2017-02-28 09:21:09', '进行了 用户管理的列表查询 操作'), ('48', '21', '2017-02-28 09:21:10', '进行了 用户管理 操作'), ('49', '21', '2017-02-28 09:21:31', '进行了 用户管理的列表查询 操作'), ('50', '21', '2017-02-28 09:21:31', '进行了 用户管理 操作'), ('51', '21', '2017-02-28 09:22:00', '进行了 用户管理的列表查询 操作'), ('52', '21', '2017-02-28 09:22:00', '进行了 用户管理 操作'), ('53', '21', '2017-02-28 09:22:19', '进行了 查询套餐类型 操作'), ('54', '21', '2017-02-28 09:24:03', '进行了 查询套餐列表 操作'), ('55', '21', '2017-02-28 09:24:24', '进行了 查询套餐列表 操作'), ('56', '21', '2017-02-28 09:24:59', '进行了 查询套餐列表 操作'), ('57', '21', '2017-02-28 09:56:08', '进行了 用户管理的列表查询 操作'), ('58', '21', '2017-02-28 09:56:08', '进行了 用户管理 操作'), ('59', '21', '2017-02-28 09:56:10', '进行了 用户详情查询 操作'), ('60', '21', '2017-02-28 10:29:00', '进行了 用户管理的列表查询 操作'), ('61', '21', '2017-02-28 10:29:00', '进行了 用户管理 操作'), ('62', '21', '2017-02-28 10:29:06', '进行了 查询套餐列表 操作'), ('63', '21', '2017-02-28 10:29:16', '进行了 查询套餐类型 操作'), ('64', '21', '2017-02-28 10:30:01', '进行了 查询套餐列表 操作'), ('65', '21', '2017-02-28 10:30:07', '进行了 删除套餐 操作'), ('66', '21', '2017-02-28 10:30:07', '进行了 查询套餐列表 操作'), ('67', '21', '2017-02-28 10:31:29', '进行了 查询套餐列表 操作'), ('68', '21', '2017-02-28 10:31:33', '进行了 查询套餐列表 操作'), ('69', '21', '2017-02-28 10:32:25', '进行了 查询套餐列表 操作'), ('70', '21', '2017-02-28 10:38:22', '进行了 查询套餐列表 操作'), ('71', '21', '2017-02-28 10:38:33', '进行了 查询套餐列表 操作'), ('72', '21', '2017-02-28 10:39:07', '进行了 查询套餐列表 操作'), ('73', '21', '2017-02-28 10:39:10', '进行了 查询套餐列表 操作'), ('74', '21', '2017-02-28 10:40:20', '进行了 查询套餐列表 操作'), ('75', '21', '2017-02-28 10:41:19', '进行了 查询套餐列表 操作'), ('76', '21', '2017-02-28 10:42:27', '进行了 查询套餐列表 操作'), ('77', '21', '2017-02-28 10:45:30', '进行了 查询套餐列表 操作'), ('78', '21', '2017-02-28 10:59:28', '进行了 查询套餐列表 操作'), ('79', '21', '2017-02-28 10:59:40', '进行了 查询套餐列表 操作'), ('80', '21', '2017-02-28 10:59:41', '进行了 查询套餐列表 操作'), ('81', '21', '2017-02-28 10:59:42', '进行了 查询套餐列表 操作'), ('82', '21', '2017-02-28 10:59:43', '进行了 查询套餐列表 操作'), ('83', '21', '2017-02-28 10:59:43', '进行了 查询套餐列表 操作'), ('84', '21', '2017-02-28 10:59:44', '进行了 查询套餐列表 操作'), ('85', '21', '2017-02-28 10:59:44', '进行了 查询套餐列表 操作'), ('86', '21', '2017-02-28 10:59:44', '进行了 查询套餐列表 操作'), ('87', '21', '2017-02-28 10:59:45', '进行了 查询套餐列表 操作'), ('88', '21', '2017-02-28 10:59:53', '进行了 删除套餐 操作'), ('89', '21', '2017-02-28 10:59:53', '进行了 查询套餐列表 操作'), ('90', '21', '2017-02-28 10:59:58', '进行了 删除套餐 操作'), ('91', '21', '2017-02-28 10:59:58', '进行了 查询套餐列表 操作'), ('92', '21', '2017-02-28 11:14:32', '进行了 查询套餐列表 操作'), ('93', '21', '2017-02-28 11:16:02', '进行了 查询套餐列表 操作'), ('94', '21', '2017-02-28 11:16:23', '进行了 查询套餐列表 操作'), ('95', '21', '2017-02-28 11:17:06', '进行了 查询套餐列表 操作'), ('96', '21', '2017-02-28 11:17:33', '进行了 查询套餐列表 操作'), ('97', '21', '2017-02-28 11:18:14', '进行了 查询套餐列表 操作'), ('98', '21', '2017-02-28 11:18:47', '进行了 查询套餐列表 操作'), ('99', '21', '2017-02-28 11:18:51', '进行了 修改套餐 操作'), ('100', '21', '2017-02-28 11:18:56', '进行了 查询套餐列表 操作'), ('101', '21', '2017-02-28 11:19:07', '进行了 查询套餐列表 操作'), ('102', '21', '2017-02-28 11:19:21', '进行了 查询套餐列表 操作'), ('103', '21', '2017-02-28 11:19:25', '进行了 修改套餐 操作'), ('104', '21', '2017-02-28 11:19:26', '进行了 查询套餐列表 操作'), ('105', '21', '2017-02-28 11:19:55', '进行了 查询套餐列表 操作'), ('106', '21', '2017-02-28 11:20:11', '进行了 查询套餐列表 操作'), ('107', '21', '2017-02-28 11:20:15', '进行了 修改套餐 操作'), ('108', '21', '2017-02-28 11:20:16', '进行了 查询套餐列表 操作'), ('109', '21', '2017-02-28 11:21:44', '进行了 查询套餐列表 操作'), ('110', '21', '2017-02-28 11:22:02', '进行了 查询套餐列表 操作'), ('111', '21', '2017-02-28 11:22:54', '进行了 查询套餐列表 操作'), ('112', '21', '2017-02-28 11:23:07', '进行了 修改套餐 操作'), ('113', '21', '2017-02-28 11:23:07', '进行了 查询套餐列表 操作'), ('114', '21', '2017-02-28 11:24:06', '进行了 查询套餐列表 操作'), ('115', '21', '2017-02-28 11:24:21', '进行了 查询套餐列表 操作'), ('116', '21', '2017-02-28 11:24:27', '进行了 修改套餐 操作'), ('117', '21', '2017-02-28 11:24:28', '进行了 查询套餐列表 操作'), ('118', '21', '2017-02-28 11:24:42', '进行了 修改套餐 操作'), ('119', '21', '2017-02-28 11:24:42', '进行了 查询套餐列表 操作'), ('120', '21', '2017-02-28 11:26:22', '进行了 查询套餐列表 操作'), ('121', '21', '2017-02-28 14:01:38', '进行了 用户管理的列表查询 操作'), ('122', '21', '2017-02-28 14:01:38', '进行了 用户管理 操作'), ('123', '21', '2017-02-28 14:01:47', '进行了 用户管理的列表查询 操作'), ('124', '21', '2017-02-28 14:01:48', '进行了 用户管理 操作'), ('125', '21', '2017-02-28 14:19:10', '进行了 添加套餐 操作'), ('126', '21', '2017-02-28 14:19:10', '进行了 查询套餐列表 操作'), ('127', '21', '2017-02-28 14:20:02', '进行了 添加套餐 操作'), ('128', '21', '2017-02-28 14:20:13', '进行了 查询套餐列表 操作'), ('129', '21', '2017-02-28 20:34:03', '进行了 开发商管理的列表查询 操作'), ('130', '21', '2017-02-28 20:34:04', '进行了 开发商管理 操作'), ('131', '21', '2017-02-28 21:34:17', '进行了 用户管理的列表查询 操作'), ('132', '21', '2017-02-28 21:34:17', '进行了 用户管理 操作'), ('133', '21', '2017-02-28 21:34:21', '进行了 设备管理列表查询 操作'), ('134', '21', '2017-03-01 10:10:45', '进行了 设备管理列表查询 操作'), ('135', '21', '2017-03-01 11:17:19', '进行了 用户管理的列表查询 操作'), ('136', '21', '2017-03-01 11:17:19', '进行了 用户管理 操作'), ('137', '21', '2017-03-01 11:17:21', '进行了 用户详情查询 操作'), ('138', '21', '2017-03-01 11:17:25', '进行了 用户详情查询 操作'), ('139', '21', '2017-03-01 11:17:39', '进行了 设备管理列表查询 操作'), ('140', '21', '2017-03-01 11:19:03', '进行了 用户管理的列表查询 操作'), ('141', '21', '2017-03-01 11:19:03', '进行了 用户管理 操作'), ('142', '21', '2017-03-01 11:19:04', '进行了 用户管理的列表查询 操作'), ('143', '21', '2017-03-01 11:19:04', '进行了 用户管理 操作'), ('144', '21', '2017-03-01 11:23:32', '进行了 开发商管理的列表查询 操作'), ('145', '21', '2017-03-01 11:23:33', '进行了 开发商管理 操作'), ('146', '21', '2017-03-01 11:23:38', '进行了 开发商详情查询 操作'), ('147', '21', '2017-03-01 11:23:39', '进行了 开发商详情查询 操作'), ('148', '21', '2017-03-01 11:23:39', '进行了 开发商详情查询 操作'), ('149', '21', '2017-03-01 11:23:43', '进行了 开发商修改查询 操作'), ('150', '21', '2017-03-01 11:25:04', '进行了 开发商管理的列表查询 操作'), ('151', '21', '2017-03-01 11:25:04', '进行了 开发商管理 操作'), ('152', '21', '2017-03-01 11:34:22', '进行了 开发商管理的列表查询 操作'), ('153', '21', '2017-03-01 11:34:23', '进行了 开发商管理 操作'), ('154', '21', '2017-03-01 11:34:29', '进行了 开发商管理的列表查询 操作'), ('155', '21', '2017-03-01 11:34:29', '进行了 开发商管理 操作'), ('156', '21', '2017-03-01 11:41:21', '进行了 开发商管理的列表查询 操作'), ('157', '21', '2017-03-01 11:41:21', '进行了 开发商管理 操作'), ('158', '21', '2017-03-01 13:36:01', '进行了 用户管理的列表查询 操作'), ('159', '21', '2017-03-01 13:36:01', '进行了 用户管理 操作'), ('160', '21', '2017-03-01 13:41:02', '进行了 用户管理的列表查询 操作'), ('161', '21', '2017-03-01 13:41:02', '进行了 用户管理 操作'), ('162', '21', '2017-03-01 16:41:47', '进行了 查询评论列表 操作'), ('163', '21', '2017-03-01 16:42:20', '进行了 查询评论列表 操作'), ('164', '21', '2017-03-01 16:44:43', '进行了 查询评论列表 操作'), ('165', '21', '2017-03-01 16:45:29', '进行了 查询评论列表 操作'), ('166', '21', '2017-03-01 16:45:38', '进行了 查询评论列表 操作'), ('167', '21', '2017-03-01 22:13:19', '进行了 查询评论列表 操作'), ('168', '21', '2017-03-01 22:15:13', '进行了 查询评论列表 操作'), ('169', '21', '2017-03-01 22:15:34', '进行了 查询评论列表 操作'), ('170', '21', '2017-03-01 22:16:14', '进行了 查询评论列表 操作'), ('171', '21', '2017-03-01 22:19:23', '进行了 查询评论列表 操作'), ('172', '21', '2017-03-04 23:14:36', '进行了 开发商管理的列表查询 操作'), ('173', '21', '2017-03-04 23:14:36', '进行了 开发商管理 操作'), ('174', '21', '2017-03-04 23:17:47', '进行了 开发商管理的列表查询 操作'), ('175', '21', '2017-03-04 23:17:47', '进行了 开发商管理 操作'), ('176', '21', '2017-03-05 11:29:04', '进行了 设备管理列表查询 操作'), ('177', '21', '2017-03-05 13:12:39', '进行了 设备管理列表查询 操作'), ('178', '21', '2017-03-05 13:14:10', '进行了 设备管理列表查询 操作'), ('179', '21', '2017-03-05 13:15:18', '进行了 设备管理列表查询 操作'), ('180', '21', '2017-03-05 13:52:21', '进行了 设备管理列表查询 操作'), ('181', '21', '2017-03-05 21:14:06', '进行了 开发商管理的列表查询 操作'), ('182', '21', '2017-03-05 21:14:07', '进行了 开发商管理 操作'), ('183', '21', '2017-03-05 21:23:26', '进行了 设备管理列表查询 操作'), ('184', '21', '2017-03-05 21:23:39', '进行了 设备管理列表查询 操作'), ('185', '21', '2017-03-05 21:23:51', '进行了 设备管理列表查询 操作'), ('186', '21', '2017-03-05 21:53:09', '进行了 设备管理列表查询 操作'), ('187', '21', '2017-03-05 21:53:21', '进行了 设备管理添加设备 操作'), ('188', '21', '2017-03-05 21:53:21', '进行了 设备管理列表查询 操作'), ('189', '21', '2017-03-05 21:53:25', '进行了 设备管理列表查询 操作'), ('190', '21', '2017-03-05 21:53:34', '进行了 设备管理列表查询 操作'), ('191', '21', '2017-03-05 21:53:43', '进行了 设备管理列表查询 操作'), ('192', '21', '2017-03-05 21:54:28', '进行了 设备管理列表查询 操作'), ('193', '21', '2017-03-05 21:54:35', '进行了 设备管理添加设备 操作'), ('194', '21', '2017-03-05 21:57:00', '进行了 设备管理添加设备 操作'), ('195', '21', '2017-03-05 21:57:01', '进行了 设备管理列表查询 操作'), ('196', '21', '2017-03-05 21:57:02', '进行了 设备管理列表查询 操作'), ('197', '21', '2017-03-05 21:57:07', '进行了 设备管理添加设备 操作'), ('198', '21', '2017-03-05 21:57:17', '进行了 设备管理添加设备 操作'), ('199', '21', '2017-03-05 21:57:18', '进行了 设备管理列表查询 操作'), ('200', '21', '2017-03-05 21:57:23', '进行了 设备管理列表查询 操作'), ('201', '21', '2017-03-05 21:57:31', '进行了 设备管理添加设备 操作'), ('202', '21', '2017-03-05 21:58:07', '进行了 设备管理列表查询 操作'), ('203', '21', '2017-03-05 21:58:09', '进行了 设备管理列表查询 操作'), ('204', '21', '2017-03-05 22:00:21', '进行了 设备管理列表查询 操作'), ('205', '21', '2017-03-05 22:00:34', '进行了 设备管理添加设备 操作'), ('206', '21', '2017-03-05 22:00:40', '进行了 设备管理添加设备 操作'), ('207', '21', '2017-03-05 22:00:42', '进行了 设备管理列表查询 操作'), ('208', '21', '2017-03-05 22:00:46', '进行了 设备管理列表查询 操作'), ('209', '21', '2017-03-05 22:01:00', '进行了 设备管理添加设备 操作'), ('210', '21', '2017-03-05 22:01:34', '进行了 设备管理添加设备 操作'), ('211', '21', '2017-03-05 22:01:36', '进行了 设备管理列表查询 操作'), ('212', '21', '2017-03-05 22:01:40', '进行了 设备管理列表查询 操作'), ('213', '21', '2017-03-05 22:01:45', '进行了 设备管理添加设备 操作'), ('214', '21', '2017-03-05 22:02:10', '进行了 设备管理列表查询 操作'), ('215', '21', '2017-03-05 22:02:11', '进行了 设备管理列表查询 操作'), ('216', '21', '2017-03-05 22:02:32', '进行了 设备管理列表查询 操作'), ('217', '21', '2017-03-05 22:02:46', '进行了 设备管理列表查询 操作'), ('218', '21', '2017-03-05 22:02:52', '进行了 设备管理添加设备 操作'), ('219', '21', '2017-03-05 22:03:29', '进行了 设备管理列表查询 操作'), ('220', '21', '2017-03-05 22:03:33', '进行了 设备管理列表查询 操作'), ('221', '21', '2017-03-05 22:03:41', '进行了 设备管理添加设备 操作'), ('222', '21', '2017-03-05 22:03:41', '进行了 设备管理列表查询 操作'), ('223', '21', '2017-03-06 10:06:30', '进行了 用户管理的列表查询 操作'), ('224', '21', '2017-03-06 10:06:30', '进行了 用户管理 操作'), ('225', '21', '2017-03-06 14:07:21', '进行了 管理员删除房源 操作'), ('226', '21', '2017-03-06 14:12:46', '进行了 管理员删除房源 操作'), ('227', '21', '2017-03-06 14:13:03', '进行了 管理员删除房源 操作'), ('228', '21', '2017-03-06 14:20:49', '进行了 管理员删除房源 操作'), ('229', '21', '2017-03-06 14:22:45', '进行了 管理员删除房源 操作'), ('230', '21', '2017-03-06 14:23:25', '进行了 管理员删除房源 操作'), ('231', '21', '2017-03-06 14:23:28', '进行了 管理员删除房源 操作'), ('232', '21', '2017-03-06 14:23:32', '进行了 管理员删除房源 操作'), ('233', '21', '2017-03-06 14:23:52', '进行了 管理员删除房源 操作'), ('234', '21', '2017-03-06 14:24:29', '进行了 管理员删除房源 操作'), ('235', '21', '2017-03-06 14:28:04', '进行了 管理员删除房源 操作'), ('236', '21', '2017-03-06 14:28:08', '进行了 管理员删除房源 操作'), ('237', '21', '2017-03-06 15:41:34', '进行了 查询套餐列表 操作'), ('238', '21', '2017-03-06 15:44:17', '进行了 添加套餐 操作'), ('239', '21', '2017-03-06 15:44:58', '进行了 查询套餐列表 操作'), ('240', '21', '2017-03-06 15:46:43', '进行了 查询套餐列表 操作'), ('241', '21', '2017-03-06 22:42:31', '进行了 管理员管理的列表查询 操作'), ('242', '21', '2017-03-06 22:52:18', '进行了 管理员管理的列表查询 操作'), ('243', '21', '2017-03-07 09:36:58', '进行了 查询评论列表 操作'), ('244', '21', '2017-03-07 10:37:20', '进行了 管理员管理的列表查询 操作'), ('245', '21', '2017-03-07 10:49:17', '进行了 管理员管理的列表查询 操作'), ('246', '21', '2017-03-07 10:51:38', '进行了 管理员管理的列表查询 操作'), ('247', '21', '2017-03-08 11:19:14', '进行了 开发商管理的列表查询 操作'), ('248', '21', '2017-03-08 11:19:14', '进行了 开发商管理 操作'), ('249', '21', '2017-03-08 11:19:41', '进行了 开发商管理的列表查询 操作'), ('250', '21', '2017-03-08 11:19:41', '进行了 开发商管理 操作'), ('251', '21', '2017-03-08 11:20:29', '进行了 开发商添加 操作'), ('252', '21', '2017-03-08 11:20:30', '进行了 开发商管理的列表查询 操作'), ('253', '21', '2017-03-08 11:20:30', '进行了 开发商管理 操作'), ('254', '21', '2017-03-08 11:22:11', '进行了 开发商添加 操作'), ('255', '21', '2017-03-08 11:22:11', '进行了 开发商管理的列表查询 操作'), ('256', '21', '2017-03-08 11:22:12', '进行了 开发商管理 操作'), ('257', '21', '2017-03-08 11:56:21', '进行了 开发商详情查询 操作'), ('258', '21', '2017-03-08 11:56:26', '进行了 开发商管理的列表查询 操作'), ('259', '21', '2017-03-08 11:56:26', '进行了 开发商管理 操作'), ('260', '21', '2017-03-08 11:57:39', '进行了 开发商添加 操作'), ('261', '21', '2017-03-08 11:57:39', '进行了 开发商管理的列表查询 操作'), ('262', '21', '2017-03-08 11:57:40', '进行了 开发商管理 操作'), ('263', '21', '2017-03-08 12:53:39', '进行了 用户管理的列表查询 操作'), ('264', '21', '2017-03-08 12:53:40', '进行了 用户管理 操作'), ('265', '21', '2017-03-08 12:53:41', '进行了 用户详情查询 操作'), ('266', '21', '2017-03-08 12:53:47', '进行了 用户管理 操作'), ('267', '21', '2017-03-08 12:54:25', '进行了 用户管理的列表查询 操作'), ('268', '21', '2017-03-08 12:54:25', '进行了 用户管理 操作'), ('269', '21', '2017-03-08 12:54:31', '进行了 用户管理的列表查询 操作'), ('270', '21', '2017-03-08 12:54:31', '进行了 用户管理 操作'), ('271', '21', '2017-03-08 12:54:39', '进行了 用户管理的列表查询 操作'), ('272', '21', '2017-03-08 12:54:39', '进行了 用户管理 操作'), ('273', '21', '2017-03-08 16:05:54', '进行了 管理员管理的列表查询 操作'), ('274', '21', '2017-03-16 23:25:48', '进行了 用户管理的列表查询 操作'), ('275', '21', '2017-03-16 23:25:48', '进行了 用户管理 操作'), ('276', '21', '2017-03-16 23:26:36', '进行了 查询评论列表 操作'), ('277', '21', '2017-03-16 23:26:39', '进行了 查询套餐列表 操作'), ('278', '21', '2017-03-16 23:26:42', '进行了 开发商管理的列表查询 操作'), ('279', '21', '2017-03-16 23:26:42', '进行了 开发商管理 操作'), ('280', '21', '2017-03-17 16:23:39', '进行了 用户管理的列表查询 操作'), ('281', '21', '2017-03-17 16:23:39', '进行了 用户管理 操作'), ('282', '21', '2017-03-17 16:23:41', '进行了 用户管理的列表查询 操作'), ('283', '21', '2017-03-17 16:23:41', '进行了 用户管理 操作'), ('284', '21', '2017-03-17 16:23:41', '进行了 用户管理的列表查询 操作'), ('285', '21', '2017-03-17 16:23:42', '进行了 用户管理 操作'), ('286', '21', '2017-03-17 16:24:43', '进行了 用户添加 操作'), ('287', '21', '2017-03-17 16:24:43', '进行了 用户管理的列表查询 操作'), ('288', '21', '2017-03-17 16:24:43', '进行了 用户管理 操作'), ('289', '21', '2017-03-18 19:55:15', '进行了 用户管理的列表查询 操作'), ('290', '21', '2017-03-18 19:55:15', '进行了 用户管理 操作'), ('291', '21', '2017-03-18 20:00:22', '进行了 添加套餐 操作'), ('292', '21', '2017-03-18 20:28:22', '进行了 开发商管理的列表查询 操作'), ('293', '21', '2017-03-18 20:28:22', '进行了 开发商管理 操作'), ('294', '21', '2017-03-18 20:52:20', '进行了 用户管理的列表查询 操作'), ('295', '21', '2017-03-18 20:52:20', '进行了 用户管理 操作'), ('296', '21', '2017-03-18 21:00:01', '进行了 查询评论列表 操作'), ('297', '21', '2017-03-18 21:00:10', '进行了 查询套餐类型 操作'), ('298', '21', '2017-03-18 21:23:07', '进行了 用户管理的列表查询 操作'), ('299', '21', '2017-03-18 21:23:08', '进行了 用户管理 操作'), ('300', '21', '2017-03-18 21:23:17', '进行了 设备管理列表查询 操作'), ('301', '21', '2017-03-19 22:05:14', '进行了 用户管理的列表查询 操作'), ('302', '21', '2017-03-19 22:05:23', '进行了 用户管理的列表查询 操作'), ('303', '21', '2017-03-19 22:07:11', '进行了 用户管理的列表查询 操作'), ('304', '21', '2017-03-19 22:07:13', '进行了 用户管理的列表查询 操作'), ('305', '21', '2017-03-19 22:23:00', '进行了 用户管理的列表查询 操作'), ('306', '21', '2017-03-19 22:23:03', '进行了 用户管理的列表查询 操作'), ('307', '21', '2017-03-19 22:23:10', '进行了 用户管理的列表查询 操作'), ('308', '21', '2017-03-19 22:23:26', '进行了 用户管理的列表查询 操作'), ('309', '21', '2017-03-19 22:23:29', '进行了 用户管理的列表查询 操作'), ('310', '21', '2017-03-19 22:23:35', '进行了 用户管理的列表查询 操作'), ('311', '21', '2017-03-19 22:31:09', '进行了 用户管理的列表查询 操作'), ('312', '21', '2017-03-19 22:31:54', '进行了 用户管理的列表查询 操作'), ('313', '21', '2017-03-19 23:06:46', '进行了 用户管理的列表查询 操作'), ('314', '21', '2017-03-19 23:07:39', '进行了 用户管理的列表查询 操作'), ('315', '21', '2017-03-19 23:08:42', '进行了 用户管理的列表查询 操作'), ('316', '21', '2017-03-19 23:09:56', '进行了 用户管理的列表查询 操作'), ('317', '21', '2017-03-19 23:10:26', '进行了 用户管理的列表查询 操作'), ('318', '21', '2017-03-19 23:10:37', '进行了 用户管理的列表查询 操作'), ('319', '21', '2017-03-19 23:12:01', '进行了 用户管理的列表查询 操作'), ('320', '21', '2017-03-19 23:12:01', '进行了 用户管理 操作'), ('321', '21', '2017-03-19 23:23:08', '进行了 设备管理列表查询 操作'), ('322', '21', '2017-03-19 23:27:30', '进行了 设备管理列表查询 操作'), ('323', '21', '2017-03-19 23:29:27', '进行了 设备管理列表查询 操作'), ('324', '21', '2017-03-19 23:29:34', '进行了 设备管理列表查询 操作'), ('325', '21', '2017-03-19 23:42:25', '进行了 管理员管理的列表查询 操作'), ('326', '21', '2017-03-20 00:08:55', '进行了 用户管理的列表查询 操作'), ('327', '21', '2017-03-20 00:08:56', '进行了 用户管理 操作'), ('328', '21', '2017-03-20 00:17:00', '进行了 用户管理的列表查询 操作'), ('329', '21', '2017-03-20 00:17:01', '进行了 用户管理 操作'), ('330', '21', '2017-03-20 00:17:03', '进行了 用户管理 操作'), ('331', '21', '2017-03-20 00:17:05', '进行了 用户管理 操作'), ('332', '21', '2017-03-20 00:17:06', '进行了 用户管理 操作'), ('333', '21', '2017-03-20 00:17:07', '进行了 用户管理 操作'), ('334', '21', '2017-03-20 00:17:07', '进行了 用户管理 操作'), ('335', '21', '2017-03-20 00:17:08', '进行了 用户管理 操作'), ('336', '21', '2017-03-20 00:17:10', '进行了 用户管理的列表查询 操作'), ('337', '21', '2017-03-20 00:17:11', '进行了 用户管理 操作'), ('338', '21', '2017-03-20 00:17:14', '进行了 用户管理 操作'), ('339', '21', '2017-03-20 00:19:09', '进行了 管理员管理的列表查询 操作'), ('340', '21', '2017-03-20 00:19:14', '进行了 用户管理的列表查询 操作'), ('341', '21', '2017-03-20 00:19:14', '进行了 用户管理 操作'), ('342', '21', '2017-03-20 00:19:58', '进行了 用户管理的列表查询 操作'), ('343', '21', '2017-03-20 00:19:59', '进行了 用户管理 操作'), ('344', '21', '2017-03-20 00:20:01', '进行了 用户管理 操作'), ('345', '21', '2017-03-20 00:21:50', '进行了 用户管理的列表查询 操作'), ('346', '21', '2017-03-20 00:21:50', '进行了 用户管理 操作'), ('347', '21', '2017-03-20 00:21:53', '进行了 用户管理 操作'), ('348', '21', '2017-03-20 00:23:05', '进行了 用户管理的列表查询 操作'), ('349', '21', '2017-03-20 00:23:06', '进行了 用户管理 操作'), ('350', '21', '2017-03-20 00:23:11', '进行了 用户管理 操作'), ('351', '21', '2017-03-20 00:23:40', '进行了 用户管理的列表查询 操作'), ('352', '21', '2017-03-20 00:23:41', '进行了 用户管理 操作'), ('353', '21', '2017-03-20 00:26:55', '进行了 管理员管理的列表查询 操作'), ('354', '21', '2017-03-20 00:27:03', '进行了 用户管理的列表查询 操作'), ('355', '21', '2017-03-20 00:27:03', '进行了 用户管理 操作'), ('356', '21', '2017-03-20 00:27:15', '进行了 用户发送消息 操作'), ('357', '21', '2017-03-20 00:27:20', '进行了 用户管理 操作'), ('358', '21', '2017-03-20 00:27:22', '进行了 用户发送消息 操作'), ('359', '21', '2017-03-20 00:38:58', '进行了 开发商管理的列表查询 操作'), ('360', '21', '2017-03-20 00:38:59', '进行了 开发商管理 操作'), ('361', '21', '2017-03-20 00:39:05', '进行了 开发商删除 操作'), ('362', '21', '2017-03-20 00:39:05', '进行了 开发商管理 操作'), ('363', '21', '2017-03-20 00:40:05', '进行了 开发商添加 操作'), ('364', '21', '2017-03-20 00:40:05', '进行了 开发商管理的列表查询 操作'), ('365', '21', '2017-03-20 00:40:06', '进行了 开发商管理 操作'), ('366', '21', '2017-03-20 00:40:32', '进行了 开发商添加 操作'), ('367', '21', '2017-03-20 00:40:32', '进行了 开发商管理的列表查询 操作'), ('368', '21', '2017-03-20 00:40:32', '进行了 开发商管理 操作'), ('369', '21', '2017-03-20 00:40:47', '进行了 开发商添加 操作'), ('370', '21', '2017-03-20 00:40:47', '进行了 开发商管理的列表查询 操作'), ('371', '21', '2017-03-20 00:40:47', '进行了 开发商管理 操作'), ('372', '21', '2017-03-20 00:41:04', '进行了 开发商添加 操作'), ('373', '21', '2017-03-20 00:41:04', '进行了 开发商管理的列表查询 操作'), ('374', '21', '2017-03-20 00:41:05', '进行了 开发商管理 操作'), ('375', '21', '2017-03-20 00:41:21', '进行了 开发商添加 操作'), ('376', '21', '2017-03-20 00:41:21', '进行了 开发商管理的列表查询 操作'), ('377', '21', '2017-03-20 00:41:22', '进行了 开发商管理 操作'), ('378', '21', '2017-03-20 00:41:31', '进行了 开发商添加 操作'), ('379', '21', '2017-03-20 00:41:31', '进行了 开发商管理的列表查询 操作'), ('380', '21', '2017-03-20 00:41:31', '进行了 开发商管理 操作'), ('381', '21', '2017-03-20 00:41:42', '进行了 开发商添加 操作'), ('382', '21', '2017-03-20 00:41:42', '进行了 开发商管理的列表查询 操作'), ('383', '21', '2017-03-20 00:41:42', '进行了 开发商管理 操作'), ('384', '21', '2017-03-20 11:59:42', '进行了 添加套餐 操作'), ('385', '21', '2017-03-20 12:01:46', '进行了 查询套餐类型 操作'), ('386', '21', '2017-03-20 12:01:51', '进行了 开发商管理的列表查询 操作'), ('387', '21', '2017-03-20 12:01:52', '进行了 开发商管理 操作'), ('388', '21', '2017-03-20 14:27:33', '进行了 用户管理的列表查询 操作'), ('389', '21', '2017-03-20 14:27:33', '进行了 用户管理 操作'), ('390', '21', '2017-03-20 14:36:25', '进行了 设备管理列表查询 操作'), ('391', '21', '2017-03-26 11:26:52', '进行了 查询套餐列表 操作'), ('392', '21', '2017-03-27 11:30:41', '进行了 用户添加--订单管理 操作'), ('393', '21', '2017-03-27 11:47:52', '进行了 管理员管理的列表查询 操作'), ('394', '21', '2017-03-27 12:03:46', '进行了 用户管理的列表查询 操作'), ('395', '21', '2017-03-27 12:03:47', '进行了 用户管理 操作'), ('396', '21', '2017-04-11 11:09:33', '进行了 用户管理的列表查询 操作'), ('397', '21', '2017-04-11 11:09:33', '进行了 用户管理 操作'), ('398', '21', '2017-04-15 19:01:10', '进行了 用户管理的列表查询 操作'), ('399', '21', '2017-04-15 19:01:10', '进行了 用户管理 操作'), ('400', '21', '2017-04-15 19:01:48', '进行了 用户添加 操作'), ('401', '21', '2017-04-15 19:01:48', '进行了 用户管理的列表查询 操作'), ('402', '21', '2017-04-15 19:01:48', '进行了 用户管理 操作'), ('403', '21', '2017-04-15 19:01:52', '进行了 用户管理 操作'), ('404', '21', '2017-04-15 19:01:55', '进行了 用户详情查询 操作'), ('405', null, '2017-04-16 09:19:04', '进行了 用户管理的列表查询 操作'), ('406', '21', '2017-04-16 14:14:04', '进行了 管理员删除房源 操作'), ('407', '21', '2017-04-16 14:16:07', '进行了 管理员删除房源 操作'), ('408', '21', '2017-04-16 14:26:53', '进行了 管理员删除房源 操作'), ('409', '21', '2017-04-16 14:27:06', '进行了 管理员删除房源 操作'), ('410', '21', '2017-04-16 14:28:15', '进行了 管理员删除房源 操作'), ('411', '21', '2017-04-16 14:41:38', '进行了 查询评论列表 操作'), ('412', '21', '2017-04-16 14:41:43', '进行了 查询套餐列表 操作'), ('413', '21', '2017-04-16 14:42:31', '进行了 设备管理列表查询 操作'), ('414', '21', '2017-04-16 14:44:06', '进行了 开发商管理的列表查询 操作'), ('415', '21', '2017-04-16 14:44:06', '进行了 开发商管理 操作'), ('416', '21', '2017-04-19 11:48:04', '进行了 设备管理列表查询 操作'), ('417', '21', '2017-04-19 11:48:32', '进行了 设备管理添加设备 操作'), ('418', '21', '2017-04-19 11:48:33', '进行了 设备管理列表查询 操作'), ('419', '21', '2017-04-19 11:48:35', '进行了 设备管理列表查询 操作'), ('420', '21', '2017-04-19 11:48:45', '进行了 用户管理的列表查询 操作'), ('421', '21', '2017-04-19 11:48:46', '进行了 用户管理 操作'), ('422', '21', '2017-04-19 11:49:43', '进行了 用户添加 操作'), ('423', '21', '2017-04-19 11:49:43', '进行了 用户管理的列表查询 操作'), ('424', '21', '2017-04-19 11:49:43', '进行了 用户管理 操作'), ('425', '21', '2017-04-19 11:49:46', '进行了 用户管理 操作'), ('426', '21', '2017-04-19 11:50:29', '进行了 用户详情查询 操作'), ('427', '21', '2017-04-19 16:55:17', '进行了 用户管理的列表查询 操作'), ('428', '21', '2017-04-19 16:55:17', '进行了 用户管理 操作'), ('429', '21', '2017-04-19 16:55:26', '进行了 用户管理的列表查询 操作'), ('430', '21', '2017-04-19 16:55:26', '进行了 用户管理 操作'), ('431', '21', '2017-04-21 17:33:13', '进行了 用户管理的列表查询 操作'), ('432', '21', '2017-04-21 17:33:13', '进行了 用户管理 操作'), ('433', '21', '2017-04-21 17:33:58', '进行了 用户管理的列表查询 操作'), ('434', '21', '2017-04-21 17:33:59', '进行了 用户管理 操作'), ('435', '21', '2017-04-21 17:36:43', '进行了 用户管理的列表查询 操作'), ('436', '21', '2017-04-21 17:36:44', '进行了 用户管理 操作'), ('437', '21', '2017-04-21 17:40:35', '进行了 用户管理的列表查询 操作'), ('438', '21', '2017-04-21 17:40:36', '进行了 用户管理 操作'), ('439', '21', '2017-04-21 17:46:10', '进行了 用户管理的列表查询 操作'), ('440', '21', '2017-04-21 17:46:10', '进行了 用户管理 操作'), ('441', '21', '2017-04-21 17:51:17', '进行了 用户管理的列表查询 操作'), ('442', '21', '2017-04-21 17:51:17', '进行了 用户管理 操作'), ('443', '21', '2017-04-21 18:06:28', '进行了 用户管理的列表查询 操作'), ('444', '21', '2017-04-21 18:06:28', '进行了 用户管理 操作'), ('445', null, '2017-04-21 18:43:51', '进行了 用户管理的列表查询 操作'), ('446', '21', '2017-04-21 18:43:54', '进行了 用户管理的列表查询 操作'), ('447', '21', '2017-04-21 18:43:55', '进行了 用户管理 操作'), ('448', '21', '2017-04-21 18:44:25', '进行了 用户添加 操作'), ('449', '21', '2017-04-21 18:44:25', '进行了 用户管理的列表查询 操作'), ('450', '21', '2017-04-21 18:44:25', '进行了 用户管理 操作'), ('451', '21', '2017-04-21 18:44:32', '进行了 用户管理 操作'), ('452', '21', '2017-04-21 18:50:06', '进行了 用户管理的列表查询 操作'), ('453', '21', '2017-04-21 18:50:06', '进行了 用户管理 操作'), ('454', '21', '2017-04-21 18:50:15', '进行了 用户管理的列表查询 操作'), ('455', '21', '2017-04-21 18:50:15', '进行了 用户管理 操作'), ('456', '21', '2017-04-21 18:50:17', '进行了 用户管理 操作'), ('457', '21', '2017-04-21 18:57:00', '进行了 用户管理的列表查询 操作'), ('458', '21', '2017-04-21 18:57:01', '进行了 用户管理 操作'), ('459', '21', '2017-04-21 18:57:56', '进行了 用户管理的列表查询 操作'), ('460', '21', '2017-04-21 18:57:57', '进行了 用户管理 操作'), ('461', '21', '2017-04-21 18:58:34', '进行了 用户添加 操作'), ('462', '21', '2017-04-21 18:58:34', '进行了 用户管理的列表查询 操作'), ('463', '21', '2017-04-21 18:58:34', '进行了 用户管理 操作'), ('464', '21', '2017-04-21 18:59:02', '进行了 用户管理 操作'), ('465', '21', '2017-04-21 19:02:59', '进行了 用户管理的列表查询 操作'), ('466', '21', '2017-04-21 19:02:59', '进行了 用户管理 操作'), ('467', '21', '2017-04-21 19:03:01', '进行了 用户管理 操作'), ('468', '21', '2017-04-21 19:07:33', '进行了 用户管理的列表查询 操作'), ('469', '21', '2017-04-21 19:07:34', '进行了 用户管理 操作'), ('470', '21', '2017-04-21 19:40:12', '进行了 用户管理的列表查询 操作'), ('471', '21', '2017-04-21 19:40:12', '进行了 用户管理 操作'), ('472', '21', '2017-04-21 19:40:14', '进行了 用户管理的列表查询 操作'), ('473', '21', '2017-04-21 19:40:15', '进行了 用户管理 操作'), ('474', '21', '2017-04-21 19:40:47', '进行了 用户管理的列表查询 操作'), ('475', '21', '2017-04-21 19:40:47', '进行了 用户管理 操作'), ('476', null, '2017-04-22 14:24:37', '进行了 用户管理的列表查询 操作'), ('477', '21', '2017-04-22 14:24:48', '进行了 开发商管理的列表查询 操作'), ('478', '21', '2017-04-22 14:24:48', '进行了 开发商管理 操作'), ('479', '21', '2017-04-22 14:24:51', '进行了 开发商管理 操作'), ('480', '21', '2017-04-22 14:25:27', '进行了 开发商管理的列表查询 操作'), ('481', '21', '2017-04-22 14:25:27', '进行了 开发商管理 操作'), ('482', '21', '2017-04-22 14:26:01', '进行了 开发商添加 操作'), ('483', '21', '2017-04-22 14:26:01', '进行了 开发商管理的列表查询 操作'), ('484', '21', '2017-04-22 14:26:01', '进行了 开发商管理 操作'), ('485', '21', '2017-04-22 14:26:03', '进行了 开发商管理 操作'), ('486', '21', '2017-04-22 14:26:07', '进行了 开发商修改查询 操作'), ('487', '21', '2017-04-23 10:19:13', '进行了 用户管理的列表查询 操作'), ('488', '21', '2017-04-23 10:19:14', '进行了 用户管理 操作'), ('489', '21', '2017-04-23 14:15:40', '进行了 用户管理的列表查询 操作'), ('490', '21', '2017-04-23 14:15:41', '进行了 用户管理 操作'), ('491', '21', '2017-04-23 14:15:47', '进行了 查询评论列表 操作'), ('492', '21', '2017-05-12 21:21:27', '进行了 用户管理的列表查询 操作'), ('493', '21', '2017-05-12 21:21:28', '进行了 用户管理 操作'), ('494', '21', '2017-05-12 23:17:29', '进行了 用户管理的列表查询 操作'), ('495', '21', '2017-05-12 23:17:30', '进行了 用户管理 操作'), ('496', '21', '2017-05-12 23:17:34', '进行了 用户管理的列表查询 操作'), ('497', '21', '2017-05-12 23:17:34', '进行了 用户管理 操作'), ('498', '21', '2017-05-13 09:15:52', '进行了 用户管理的列表查询 操作'), ('499', '21', '2017-05-13 09:15:53', '进行了 用户管理 操作'), ('500', '21', '2017-05-22 20:16:24', '进行了 新闻管理的列表查询 操作'), ('501', '21', '2017-05-22 20:16:25', '进行了 用户管理 操作'), ('502', '21', '2017-05-22 20:16:43', '进行了 用户管理 操作'), ('503', '21', '2017-05-22 20:16:44', '进行了 用户管理 操作'), ('504', '21', '2017-05-22 20:16:48', '进行了 用户管理 操作'), ('505', '21', '2017-05-22 20:17:21', '进行了 新闻管理的列表查询 操作'), ('506', '21', '2017-05-22 20:17:21', '进行了 用户管理 操作'), ('507', '21', '2017-05-22 20:27:18', '进行了 新闻管理的列表查询 操作'), ('508', '21', '2017-05-22 20:27:18', '进行了 用户管理 操作'), ('509', '21', '2017-05-22 20:28:03', '进行了 新闻管理的列表查询 操作'), ('510', '21', '2017-05-22 20:28:03', '进行了 用户管理 操作'), ('511', '21', '2017-05-22 20:31:59', '进行了 新闻管理的列表查询 操作'), ('512', '21', '2017-05-22 20:31:59', '进行了 用户管理 操作'), ('513', '21', '2017-05-22 20:32:05', '进行了 新闻管理的列表查询 操作'), ('514', '21', '2017-05-22 20:32:06', '进行了 用户管理 操作'), ('515', '21', '2017-05-22 20:35:24', '进行了 新闻管理的列表查询 操作'), ('516', '21', '2017-05-22 20:35:24', '进行了 用户管理 操作'), ('517', '21', '2017-05-22 20:35:28', '进行了 新闻管理的列表查询 操作'), ('518', '21', '2017-05-22 20:35:28', '进行了 用户管理 操作'), ('519', '21', '2017-05-22 20:36:06', '进行了 用户管理 操作'), ('520', '21', '2017-05-22 20:36:07', '进行了 用户管理 操作'), ('521', '21', '2017-05-22 20:36:07', '进行了 用户管理 操作'), ('522', '21', '2017-05-22 20:36:09', '进行了 用户管理 操作'), ('523', '21', '2017-05-22 20:36:09', '进行了 用户管理 操作'), ('524', '21', '2017-05-22 20:59:38', '进行了 新闻管理的列表查询 操作'), ('525', '21', '2017-05-22 20:59:39', '进行了 用户管理 操作'), ('526', '21', '2017-05-22 20:59:40', '进行了 新闻详情查询 操作'), ('527', '21', '2017-05-22 21:00:14', '进行了 新闻管理的列表查询 操作'), ('528', '21', '2017-05-22 21:00:14', '进行了 用户管理 操作'), ('529', '21', '2017-05-22 21:00:15', '进行了 新闻详情查询 操作'), ('530', '21', '2017-05-22 21:00:21', '进行了 新闻详情查询 操作'), ('531', '21', '2017-05-22 21:09:46', '进行了 新闻管理的列表查询 操作'), ('532', '21', '2017-05-22 21:09:46', '进行了 用户管理 操作'), ('533', '21', '2017-05-22 21:09:47', '进行了 新闻详情查询 操作'), ('534', '21', '2017-05-22 21:09:57', '进行了 新闻管理的列表查询 操作'), ('535', '21', '2017-05-22 21:09:58', '进行了 用户管理 操作'), ('536', '21', '2017-05-22 21:10:00', '进行了 新闻详情查询 操作'), ('537', '21', '2017-05-22 21:10:08', '进行了 新闻详情查询 操作'), ('538', '21', '2017-05-22 21:10:12', '进行了 新闻管理的列表查询 操作'), ('539', '21', '2017-05-22 21:10:12', '进行了 用户管理 操作'), ('540', '21', '2017-05-22 21:10:13', '进行了 新闻详情查询 操作'), ('541', '21', '2017-05-22 21:15:13', '进行了 新闻管理的列表查询 操作'), ('542', '21', '2017-05-22 21:15:13', '进行了 用户管理 操作'), ('543', '21', '2017-05-22 21:15:17', '进行了 用户删除 操作'), ('544', '21', '2017-05-22 21:15:17', '进行了 新闻管理的列表查询 操作'), ('545', '21', '2017-05-22 21:15:20', '进行了 新闻管理的列表查询 操作'), ('546', '21', '2017-05-22 21:15:20', '进行了 用户管理 操作'), ('547', '21', '2017-05-22 21:16:21', '进行了 新闻管理的列表查询 操作'), ('548', '21', '2017-05-22 21:16:21', '进行了 用户管理 操作'), ('549', '21', '2017-05-22 21:16:24', '进行了 新闻删除 操作'), ('550', '21', '2017-05-22 21:16:37', '进行了 新闻管理的列表查询 操作'), ('551', '21', '2017-05-22 21:16:38', '进行了 用户管理 操作'), ('552', '21', '2017-05-22 21:17:03', '进行了 新闻管理的列表查询 操作'), ('553', '21', '2017-05-22 21:17:03', '进行了 用户管理 操作'), ('554', '21', '2017-05-22 21:17:06', '进行了 新闻删除 操作'), ('555', '21', '2017-05-22 21:17:06', '进行了 用户管理 操作'), ('556', '21', '2017-05-22 21:17:23', '进行了 新闻管理的列表查询 操作'), ('557', '21', '2017-05-22 21:17:24', '进行了 用户管理 操作'), ('558', '21', '2017-05-22 21:17:26', '进行了 新闻详情查询 操作'), ('559', '21', '2017-05-22 21:17:30', '进行了 新闻管理的列表查询 操作'), ('560', '21', '2017-05-22 21:17:30', '进行了 用户管理 操作'), ('561', '21', '2017-05-22 21:17:31', '进行了 新闻详情查询 操作'), ('562', '21', '2017-05-22 21:17:36', '进行了 新闻删除 操作'), ('563', '21', '2017-05-22 21:17:36', '进行了 用户管理 操作'), ('564', '21', '2017-05-22 21:18:13', '进行了 新闻管理的列表查询 操作'), ('565', '21', '2017-05-22 21:18:13', '进行了 用户管理 操作'), ('566', '21', '2017-05-22 21:19:53', '进行了 新闻管理的列表查询 操作'), ('567', '21', '2017-05-22 21:19:53', '进行了 用户管理 操作'), ('568', '21', '2017-05-22 21:20:18', '进行了 新闻管理的列表查询 操作'), ('569', '21', '2017-05-22 21:20:18', '进行了 用户管理 操作'), ('570', '21', '2017-05-22 21:20:20', '进行了 新闻管理的列表查询 操作'), ('571', '21', '2017-05-22 21:20:21', '进行了 用户管理 操作'), ('572', '21', '2017-05-22 21:21:12', '进行了 新闻管理的列表查询 操作'), ('573', '21', '2017-05-22 21:21:12', '进行了 用户管理 操作'), ('574', null, '2017-05-23 09:34:38', '进行了 新闻管理的列表查询 操作'), ('575', '21', '2017-05-23 09:34:41', '进行了 新闻管理的列表查询 操作'), ('576', '21', '2017-05-23 09:34:42', '进行了 用户管理 操作'), ('577', '21', '2017-05-23 09:34:43', '进行了 新闻详情查询 操作'), ('578', '21', '2017-05-23 09:35:19', '进行了 新闻管理的列表查询 操作'), ('579', '21', '2017-05-23 09:35:20', '进行了 用户管理 操作'), ('580', '21', '2017-05-23 09:35:20', '进行了 新闻详情查询 操作'), ('581', '21', '2017-05-23 09:37:10', '进行了 新闻管理的列表查询 操作'), ('582', '21', '2017-05-23 09:37:10', '进行了 用户管理 操作'), ('583', '21', '2017-05-23 09:37:11', '进行了 新闻详情查询 操作'), ('584', '21', '2017-05-23 09:37:15', '进行了 新闻详情查询 操作'), ('585', '21', '2017-05-23 09:37:18', '进行了 新闻详情查询 操作'), ('586', '21', '2017-05-23 09:37:58', '进行了 新闻管理的列表查询 操作'), ('587', '21', '2017-05-23 09:37:58', '进行了 用户管理 操作'), ('588', '21', '2017-05-23 09:38:03', '进行了 新闻管理的列表查询 操作'), ('589', '21', '2017-05-23 09:38:03', '进行了 用户管理 操作'), ('590', '21', '2017-05-23 09:38:04', '进行了 新闻详情查询 操作'), ('591', '21', '2017-05-23 09:38:08', '进行了 新闻详情查询 操作'), ('592', '21', '2017-05-23 09:38:11', '进行了 新闻管理的列表查询 操作'), ('593', '21', '2017-05-23 09:38:11', '进行了 用户管理 操作'), ('594', '21', '2017-05-23 09:38:36', '进行了 新闻管理的列表查询 操作'), ('595', '21', '2017-05-23 09:38:37', '进行了 用户管理 操作'), ('596', '21', '2017-05-23 09:38:41', '进行了 新闻管理的列表查询 操作'), ('597', '21', '2017-05-23 09:38:41', '进行了 用户管理 操作'), ('598', '21', '2017-05-23 09:38:42', '进行了 新闻详情查询 操作'), ('599', null, '2017-05-23 15:54:14', '进行了 开发商管理的列表查询 操作'), ('600', '21', '2017-05-23 15:54:19', '进行了 开发商管理的列表查询 操作'), ('601', '21', '2017-05-23 15:54:19', '进行了 开发商管理 操作'), ('602', '21', '2017-05-23 15:54:20', '进行了 开发商修改查询 操作'), ('603', '21', '2017-05-23 15:54:26', '进行了 开发商管理 操作'), ('604', '21', '2017-05-23 15:54:28', '进行了 开发商详情查询 操作'), ('605', '21', '2017-05-23 15:54:33', '进行了 开发商修改查询 操作'), ('606', '21', '2017-05-23 15:59:34', '进行了 开发商管理的列表查询 操作'), ('607', '21', '2017-05-23 15:59:34', '进行了 开发商管理 操作'), ('608', '21', '2017-05-23 15:59:35', '进行了 开发商管理 操作'), ('609', '21', '2017-05-23 15:59:37', '进行了 开发商修改查询 操作'), ('610', '21', '2017-05-23 16:01:30', '进行了 开发商管理的列表查询 操作'), ('611', '21', '2017-05-23 16:01:30', '进行了 开发商管理 操作'), ('612', '21', '2017-05-23 16:01:32', '进行了 开发商管理 操作'), ('613', '21', '2017-05-23 16:01:34', '进行了 开发商修改查询 操作'), ('614', '21', '2017-05-23 16:02:20', '进行了 开发商管理的列表查询 操作'), ('615', '21', '2017-05-23 16:02:20', '进行了 开发商管理 操作'), ('616', '21', '2017-05-23 16:02:21', '进行了 开发商管理 操作'), ('617', '21', '2017-05-23 16:02:23', '进行了 开发商修改查询 操作'), ('618', '21', '2017-05-23 16:03:21', '进行了 开发商管理的列表查询 操作'), ('619', '21', '2017-05-23 16:03:21', '进行了 开发商管理 操作'), ('620', '21', '2017-05-23 16:03:23', '进行了 开发商管理 操作'), ('621', '21', '2017-05-23 16:03:24', '进行了 开发商修改查询 操作'), ('622', '21', '2017-05-23 16:04:49', '进行了 开发商管理的列表查询 操作'), ('623', '21', '2017-05-23 16:04:50', '进行了 开发商管理 操作'), ('624', '21', '2017-05-23 16:04:53', '进行了 开发商管理 操作'), ('625', '21', '2017-05-23 16:04:54', '进行了 开发商修改查询 操作'), ('626', '21', '2017-05-23 16:05:28', '进行了 开发商管理的列表查询 操作'), ('627', '21', '2017-05-23 16:05:29', '进行了 开发商管理 操作'), ('628', '21', '2017-05-23 16:05:30', '进行了 开发商管理 操作'), ('629', '21', '2017-05-23 16:05:32', '进行了 开发商修改查询 操作'), ('630', '21', '2017-05-23 16:07:20', '进行了 开发商管理的列表查询 操作'), ('631', '21', '2017-05-23 16:07:20', '进行了 开发商管理 操作'), ('632', '21', '2017-05-23 16:07:22', '进行了 开发商管理 操作'), ('633', '21', '2017-05-23 16:07:24', '进行了 开发商修改查询 操作'), ('634', '21', '2017-05-23 16:07:33', '进行了 开发商修改 操作'), ('635', '21', '2017-05-23 16:07:33', '进行了 开发商管理的列表查询 操作'), ('636', '21', '2017-05-23 16:07:34', '进行了 开发商管理 操作'), ('637', '21', '2017-05-23 16:07:37', '进行了 开发商管理 操作'), ('638', '21', '2017-05-23 16:07:39', '进行了 开发商修改查询 操作'), ('639', '21', '2017-05-23 16:49:12', '进行了 开发商管理的列表查询 操作'), ('640', '21', '2017-05-23 16:49:13', '进行了 开发商管理 操作'), ('641', '21', '2017-05-23 17:42:18', '进行了 开发商管理的列表查询 操作'), ('642', '21', '2017-05-23 17:42:19', '进行了 开发商管理 操作'), ('643', '21', '2017-05-23 17:42:22', '进行了 开发商管理的列表查询 操作'), ('644', '21', '2017-05-23 17:42:23', '进行了 开发商管理 操作'), ('645', '21', '2017-05-23 17:42:25', '进行了 开发商修改查询 操作'), ('646', '21', '2017-05-23 17:42:39', '进行了 开发商管理的列表查询 操作'), ('647', '21', '2017-05-23 17:42:39', '进行了 开发商管理 操作'), ('648', '21', '2017-05-23 17:42:41', '进行了 开发商管理 操作'), ('649', '21', '2017-05-23 17:42:42', '进行了 开发商修改查询 操作'), ('650', '21', '2017-05-23 17:42:48', '进行了 开发商修改 操作'), ('651', '21', '2017-05-23 17:42:48', '进行了 开发商管理的列表查询 操作'), ('652', '21', '2017-05-23 17:42:48', '进行了 开发商管理 操作'), ('653', '21', '2017-05-23 17:42:51', '进行了 开发商管理 操作'), ('654', '21', '2017-05-23 17:42:53', '进行了 开发商修改查询 操作'), ('655', '21', '2017-05-23 17:42:59', '进行了 开发商修改 操作'), ('656', '21', '2017-05-23 17:42:59', '进行了 开发商管理的列表查询 操作'), ('657', '21', '2017-05-23 17:43:00', '进行了 开发商管理 操作'), ('658', '21', '2017-05-23 17:43:02', '进行了 开发商修改查询 操作'), ('659', '21', '2017-05-23 17:43:05', '进行了 开发商管理 操作'), ('660', '21', '2017-05-23 17:43:06', '进行了 开发商详情查询 操作'), ('661', '21', '2017-05-23 17:43:10', '进行了 开发商修改查询 操作'), ('662', '21', '2017-05-23 17:43:22', '进行了 开发商修改 操作'), ('663', '21', '2017-05-23 17:43:22', '进行了 开发商管理的列表查询 操作'), ('664', '21', '2017-05-23 17:43:22', '进行了 开发商管理 操作'), ('665', '21', '2017-05-23 17:43:24', '进行了 开发商管理 操作'), ('666', '21', '2017-05-23 17:43:26', '进行了 开发商修改查询 操作'), ('667', null, '2017-05-24 11:51:02', '进行了 开发商管理的列表查询 操作'), ('668', null, '2017-05-24 22:19:56', '进行了 开发商管理的列表查询 操作'), ('669', '21', '2017-05-24 22:20:02', '进行了 新闻管理的列表查询 操作'), ('670', '21', '2017-05-24 22:20:03', '进行了 用户管理 操作'), ('671', '21', '2017-05-24 22:20:17', '进行了 新闻管理的列表查询 操作'), ('672', '21', '2017-05-24 22:20:18', '进行了 用户管理 操作'), ('673', '21', '2017-05-24 22:20:55', '进行了 新闻管理的列表查询 操作'), ('674', '21', '2017-05-24 22:20:55', '进行了 用户管理 操作'), ('675', '21', '2017-05-24 22:20:57', '进行了 新闻详情查询 操作'), ('676', '21', '2017-05-24 22:21:00', '进行了 新闻删除 操作'), ('677', '21', '2017-05-24 22:21:01', '进行了 用户管理 操作'), ('678', null, '2017-05-26 09:14:27', '进行了 开发商管理的列表查询 操作'), ('679', '21', '2017-05-26 09:14:41', '进行了 管理员管理的列表查询 操作'), ('680', '21', '2017-05-26 09:17:51', '进行了 管理员管理的列表查询 操作'), ('681', '21', '2017-05-26 09:20:37', '进行了 管理员管理的列表查询 操作'), ('682', '21', '2017-05-26 09:24:16', '进行了 管理员管理的列表查询 操作'), ('683', '21', '2017-05-26 09:26:30', '进行了 管理员管理的列表查询 操作'), ('684', '21', '2017-05-26 09:27:01', '进行了 管理员管理的列表查询 操作'), ('685', '21', '2017-05-26 09:58:03', '进行了 管理员管理的列表查询 操作'), ('686', '21', '2017-05-26 09:58:07', '进行了 管理员管理的列表查询 操作'), ('687', '21', '2017-05-26 09:58:22', '进行了 管理员管理的列表查询 操作'), ('688', '21', '2017-05-26 09:59:45', '进行了 管理员管理的列表查询 操作'), ('689', '21', '2017-05-26 10:00:12', '进行了 管理员管理的列表查询 操作'), ('690', '21', '2017-05-26 10:01:36', '进行了 管理员管理的列表查询 操作'), ('691', '21', '2017-05-26 10:02:06', '进行了 管理员管理的列表查询 操作'), ('692', '21', '2017-05-26 10:02:42', '进行了 管理员管理的列表查询 操作'), ('693', '21', '2017-05-26 10:04:03', '进行了 管理员管理的列表查询 操作'), ('694', '21', '2017-05-26 10:04:36', '进行了 管理员管理的列表查询 操作'), ('695', '21', '2017-05-26 10:04:49', '进行了 管理员管理的列表查询 操作'), ('696', '21', '2017-05-26 10:04:58', '进行了 管理员管理的列表查询 操作'), ('697', '21', '2017-05-26 10:05:25', '进行了 管理员管理的列表查询 操作'), ('698', '21', '2017-05-26 10:06:31', '进行了 管理员管理的列表查询 操作'), ('699', '21', '2017-05-26 10:07:09', '进行了 管理员管理的列表查询 操作'), ('700', '21', '2017-05-26 10:19:46', '进行了 管理员管理的列表查询 操作'), ('701', '21', '2017-05-27 14:38:10', '进行了 用户管理的列表查询 操作'), ('702', '21', '2017-05-27 14:38:10', '进行了 用户管理 操作'), ('703', '21', '2017-05-27 14:38:15', '进行了 用户详情查询 操作'), ('704', '21', '2017-05-27 14:38:20', '进行了 用户详情查询 操作'), ('705', '21', '2017-05-27 14:38:49', '进行了 用户详情查询 操作'), ('706', '21', '2017-05-27 14:40:41', '进行了 用户详情查询 操作'), ('707', '21', '2017-05-27 14:40:47', '进行了 用户修改 操作'), ('708', '21', '2017-05-27 14:40:47', '进行了 用户管理的列表查询 操作'), ('709', '21', '2017-05-27 14:40:48', '进行了 用户管理 操作'), ('710', '21', '2017-05-27 14:41:40', '进行了 用户详情查询 操作'), ('711', '21', '2017-05-27 14:42:11', '进行了 用户修改 操作'), ('712', '21', '2017-05-27 14:42:11', '进行了 用户管理的列表查询 操作'), ('713', '21', '2017-05-27 14:42:11', '进行了 用户管理 操作'), ('714', '21', '2017-05-27 14:45:03', '进行了 用户管理的列表查询 操作'), ('715', '21', '2017-05-27 14:45:03', '进行了 用户管理 操作'), ('716', '21', '2017-05-27 14:45:06', '进行了 用户详情查询 操作'), ('717', '21', '2017-05-27 14:45:11', '进行了 用户详情查询 操作'), ('718', '21', '2017-05-27 14:45:54', '进行了 用户管理的列表查询 操作'), ('719', '21', '2017-05-27 14:45:54', '进行了 用户管理 操作'), ('720', '21', '2017-05-27 14:45:56', '进行了 用户详情查询 操作'), ('721', '21', '2017-05-27 14:46:00', '进行了 用户详情查询 操作'), ('722', '21', '2017-05-27 14:46:03', '进行了 用户详情查询 操作'), ('723', '21', '2017-05-27 14:46:06', '进行了 用户详情查询 操作'), ('724', '21', '2017-05-27 14:47:28', '进行了 用户管理的列表查询 操作'), ('725', '21', '2017-05-27 14:47:29', '进行了 用户管理 操作'), ('726', '21', '2017-05-27 14:47:30', '进行了 用户详情查询 操作'), ('727', '21', '2017-05-27 14:47:35', '进行了 用户详情查询 操作'), ('728', '21', '2017-05-27 14:47:38', '进行了 用户详情查询 操作'), ('729', '21', '2017-05-27 14:47:42', '进行了 用户详情查询 操作'), ('730', '21', '2017-05-27 14:49:04', '进行了 用户管理的列表查询 操作'), ('731', '21', '2017-05-27 14:49:04', '进行了 用户管理 操作'), ('732', '21', '2017-05-27 14:49:06', '进行了 用户详情查询 操作'), ('733', '21', '2017-05-27 14:49:10', '进行了 用户详情查询 操作'), ('734', '21', '2017-05-27 14:49:23', '进行了 用户详情查询 操作'), ('735', '21', '2017-05-27 14:51:24', '进行了 用户管理的列表查询 操作'), ('736', '21', '2017-05-27 14:51:24', '进行了 用户管理 操作'), ('737', '21', '2017-05-27 14:51:27', '进行了 用户详情查询 操作'), ('738', '21', '2017-05-27 14:53:40', '进行了 用户管理的列表查询 操作'), ('739', '21', '2017-05-27 14:53:41', '进行了 用户管理 操作'), ('740', '21', '2017-05-27 14:54:02', '进行了 用户管理的列表查询 操作'), ('741', '21', '2017-05-27 14:54:02', '进行了 用户管理 操作'), ('742', '21', '2017-05-27 14:54:04', '进行了 用户详情查询 操作'), ('743', '21', '2017-05-27 14:54:27', '进行了 用户详情查询 操作'), ('744', '21', '2017-05-27 14:55:00', '进行了 用户管理的列表查询 操作'), ('745', '21', '2017-05-27 14:55:01', '进行了 用户管理 操作'), ('746', '21', '2017-05-27 14:55:08', '进行了 开发商管理的列表查询 操作'), ('747', '21', '2017-05-27 14:55:08', '进行了 开发商管理 操作'), ('748', '21', '2017-05-27 14:59:10', '进行了 用户管理的列表查询 操作'), ('749', '21', '2017-05-27 14:59:10', '进行了 用户管理 操作'), ('750', '21', '2017-05-27 14:59:16', '进行了 用户管理的列表查询 操作'), ('751', '21', '2017-05-27 14:59:16', '进行了 用户管理 操作'), ('752', '21', '2017-05-27 14:59:19', '进行了 用户管理的列表查询 操作'), ('753', '21', '2017-05-27 14:59:19', '进行了 用户管理 操作'), ('754', '21', '2017-05-27 14:59:21', '进行了 用户详情查询 操作'), ('755', '21', '2017-05-27 14:59:30', '进行了 用户修改 操作'), ('756', '21', '2017-05-27 14:59:30', '进行了 用户管理的列表查询 操作'), ('757', '21', '2017-05-27 14:59:31', '进行了 用户管理 操作'), ('758', '21', '2017-05-27 14:59:59', '进行了 用户详情查询 操作'), ('759', '21', '2017-05-27 15:00:56', '进行了 用户修改 操作'), ('760', '21', '2017-05-27 15:00:56', '进行了 用户管理的列表查询 操作'), ('761', '21', '2017-05-27 15:00:56', '进行了 用户管理 操作'), ('762', '21', '2017-05-27 15:02:18', '进行了 用户详情查询 操作'), ('763', '21', '2017-05-27 15:02:37', '进行了 用户修改 操作'), ('764', '21', '2017-05-27 15:02:37', '进行了 用户管理的列表查询 操作'), ('765', '21', '2017-05-27 15:02:37', '进行了 用户管理 操作'), ('766', '21', '2017-05-27 15:02:39', '进行了 用户详情查询 操作'), ('767', '21', '2017-05-27 15:02:42', '进行了 用户修改 操作'), ('768', '21', '2017-05-27 15:02:42', '进行了 用户管理的列表查询 操作'), ('769', '21', '2017-05-27 15:02:42', '进行了 用户管理 操作'), ('770', '21', '2017-05-27 15:02:44', '进行了 用户详情查询 操作'), ('771', '21', '2017-05-27 15:07:39', '进行了 开发商管理的列表查询 操作'), ('772', '21', '2017-05-27 15:07:40', '进行了 开发商管理 操作'), ('773', '21', '2017-05-27 15:08:22', '进行了 用户管理的列表查询 操作'), ('774', '21', '2017-05-27 15:08:22', '进行了 用户管理 操作'), ('775', '21', '2017-05-27 15:08:34', '进行了 用户管理的列表查询 操作'), ('776', '21', '2017-05-27 15:08:35', '进行了 用户管理 操作'), ('777', '21', '2017-05-27 15:13:08', '进行了 用户管理的列表查询 操作'), ('778', '21', '2017-05-27 15:13:09', '进行了 用户管理 操作'), ('779', '21', '2017-05-27 15:13:13', '进行了 用户管理的列表查询 操作'), ('780', '21', '2017-05-27 15:13:14', '进行了 用户管理 操作'), ('781', '21', '2017-05-27 15:13:32', '进行了 用户管理的列表查询 操作'), ('782', '21', '2017-05-27 15:13:32', '进行了 用户管理 操作'), ('783', '21', '2017-05-27 15:13:39', '进行了 用户管理的列表查询 操作'), ('784', '21', '2017-05-27 15:13:40', '进行了 用户管理 操作'), ('785', '21', '2017-05-27 15:17:22', '进行了 用户管理 操作'), ('786', '21', '2017-05-27 15:17:22', '进行了 用户管理 操作'), ('787', '21', '2017-05-27 15:17:24', '进行了 用户管理 操作'), ('788', '21', '2017-05-27 15:17:24', '进行了 用户管理 操作'), ('789', '21', '2017-05-27 15:17:25', '进行了 用户管理 操作'), ('790', '21', '2017-05-27 15:17:45', '进行了 用户管理 操作'), ('791', '21', '2017-05-27 21:44:36', '进行了 用户添加--订单管理 操作'), ('792', '21', '2017-05-28 11:15:59', '进行了 用户管理的列表查询 操作'), ('793', '21', '2017-05-28 11:15:59', '进行了 用户管理 操作'), ('794', '21', '2017-05-28 11:33:06', '进行了 用户管理的列表查询 操作'), ('795', '21', '2017-05-28 11:33:06', '进行了 用户管理 操作'), ('796', '21', '2017-05-28 11:33:09', '进行了 用户管理的列表查询 操作'), ('797', '21', '2017-05-28 11:33:09', '进行了 用户管理 操作'), ('798', '21', '2017-05-30 22:21:48', '进行了 用户管理的列表查询 操作'), ('799', '21', '2017-05-30 22:21:49', '进行了 用户管理 操作'), ('800', '21', '2017-07-06 23:19:07', '进行了 用户管理的列表查询 操作'), ('801', '21', '2017-07-06 23:19:07', '进行了 用户管理 操作'), ('802', '21', '2017-07-06 23:19:33', '进行了 开发商管理的列表查询 操作'), ('803', '21', '2017-07-06 23:19:33', '进行了 开发商管理 操作'), ('804', '21', '2017-07-06 23:19:34', '进行了 开发商详情查询 操作'), ('805', '21', '2017-07-06 23:19:40', '进行了 开发商修改查询 操作'), ('806', '21', '2017-07-14 21:56:22', '进行了 查询小区信息 操作'), ('807', '21', '2017-07-14 21:56:22', '进行了 房源管理-查询房源 操作'), ('808', '21', '2017-07-14 21:56:27', '进行了 小区管理列表查询 操作'), ('809', '21', '2017-07-14 21:56:29', '进行了 获取小区1详细信息 操作'), ('810', '21', '2017-07-14 21:56:32', '进行了 获取小区3详细信息 操作'), ('811', null, '2017-07-15 22:24:04', '进行了 获取小区1详细信息 操作'), ('812', '21', '2019-04-01 20:27:44', '进行了 用户管理的列表查询 操作'), ('813', '21', '2019-04-01 20:27:45', '进行了 用户管理 操作'), ('814', '21', '2019-04-01 20:27:50', '进行了 用户详情查询 操作'), ('815', '21', '2019-04-01 20:27:50', '进行了 查询用户1的订单 操作'), ('816', '21', '2019-04-01 20:27:50', '进行了 查询用户1的留言 操作'), ('817', '21', '2019-04-01 20:28:05', '进行了 查询房源 操作'), ('818', '21', '2019-04-01 20:28:08', '进行了 查询房源 操作'), ('819', '21', '2019-04-01 20:28:14', '进行了 查询房源 操作'), ('820', '21', '2019-04-01 20:28:14', '进行了 查询房源 操作'), ('821', '21', '2019-04-01 20:28:14', '进行了 查询房源 操作'), ('822', '21', '2019-04-01 20:28:14', '进行了 查询房源 操作'), ('823', '21', '2019-04-01 20:28:15', '进行了 查询房源 操作'), ('824', '21', '2019-04-01 20:28:15', '进行了 查询房源 操作'), ('825', '21', '2019-04-01 20:28:16', '进行了 查询房源 操作'), ('826', '21', '2019-04-01 20:28:16', '进行了 查询房源 操作'), ('827', '21', '2019-04-01 20:28:25', '进行了 用户管理的列表查询 操作'), ('828', '21', '2019-04-01 20:28:26', '进行了 用户管理 操作'), ('829', '21', '2019-04-01 20:28:28', '进行了 查询小区信息 操作'), ('830', '21', '2019-04-01 20:28:28', '进行了 房源管理-查询房源 操作'), ('831', '21', '2019-04-01 20:28:33', '进行了 取消房源推荐29 操作'), ('832', '21', '2019-04-01 20:28:33', '进行了 房源管理-查询房源 操作'), ('833', '21', '2019-04-01 20:28:40', '进行了 添加房源推荐29 操作'), ('834', '21', '2019-04-01 20:28:40', '进行了 房源管理-查询房源 操作'), ('835', '21', '2019-04-01 20:29:01', '进行了 查看房源30详细信息 操作'), ('836', '21', '2019-04-01 20:29:21', '进行了 查询发票信息 操作'), ('837', '21', '2019-04-01 20:29:25', '进行了 设备管理列表查询 操作'), ('838', '21', '2019-04-01 20:29:30', '进行了 设备管理列表查询 操作'), ('839', '21', '2019-04-01 20:29:47', '进行了 查询评论列表 操作'), ('840', '21', '2019-04-01 20:29:51', '进行了 查询评论7详细信息 操作'), ('841', '21', '2019-04-01 20:30:00', '进行了 生成发票 操作'), ('842', '21', '2019-04-01 20:30:07', '进行了 生成发票 操作'), ('843', '21', '2019-04-01 20:30:12', '进行了 入住管理 操作'), ('844', '21', '2019-04-01 20:30:19', '进行了 订单管理 操作'), ('845', '21', '2019-04-01 20:30:25', '进行了 订单管理 操作'), ('846', '21', '2019-04-01 20:30:25', '进行了 订单管理 操作'), ('847', '21', '2019-04-01 20:30:29', '进行了 订单管理 操作'), ('848', '21', '2019-04-01 20:30:29', '进行了 订单管理 操作'), ('849', '21', '2019-04-01 20:30:30', '进行了 订单管理 操作'), ('850', '21', '2019-04-01 20:30:30', '进行了 订单管理 操作');
COMMIT;

-- ----------------------------
--  Table structure for `t_message`
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` int(11) DEFAULT NULL COMMENT '回复的留言的id',
  `sender` int(11) DEFAULT NULL COMMENT '发送人id',
  `receiver` int(11) DEFAULT NULL COMMENT '接收人id',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  `content` text COMMENT '留言内容',
  `is_delete` int(11) DEFAULT '0' COMMENT '是否删除（0未删除|1删除）',
  `is_read` int(255) DEFAULT '0' COMMENT '是否已读（0未读|1已读）',
  PRIMARY KEY (`message_id`),
  KEY `sender` (`sender`),
  KEY `receiver` (`receiver`),
  CONSTRAINT `fk_user_receiver` FOREIGN KEY (`receiver`) REFERENCES `t_user` (`user_id`),
  CONSTRAINT `fk_user_sender` FOREIGN KEY (`sender`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='留言信息表';

-- ----------------------------
--  Records of `t_message`
-- ----------------------------
BEGIN;
INSERT INTO `t_message` VALUES ('27', '35', '-1', '2', '2017-02-16 17:51:45', '得得', '0', '0'), ('29', null, '3', '-1', '2017-02-16 17:55:58', '不但花费话费的reeir', '0', '1'), ('30', null, '2', '-1', '2017-02-16 17:55:54', '给发', '0', '1'), ('32', null, '2', '-1', '2017-02-16 17:55:23', '户给发', '0', '1'), ('33', null, '3', '-1', '2017-02-16 17:54:30', '愤愤愤愤', '0', '1'), ('35', null, '2', '-1', '2017-02-16 17:54:36', '你的就是那就', '0', '1'), ('36', null, '3', '-1', '2017-02-16 17:54:32', '额分分', '0', '1'), ('39', '29', '-1', '1', '2017-02-16 17:54:10', '哈哈哈', '0', '0'), ('40', '30', '-1', '1', '2017-02-16 17:54:11', '123123', '0', '0'), ('41', '29', '-1', '37', '2017-02-16 17:54:11', '哈哈哈', '0', '0'), ('42', '29', '-1', '37', '2017-02-16 17:54:14', '123', '0', '0'), ('43', null, '1', '-1', '2017-02-23 22:07:02', '123123\n', '0', null), ('44', null, '37', '-1', '2017-02-23 22:09:19', '123123\n', '0', null), ('45', null, '1', '-1', '2017-02-24 14:33:01', '请问请问', '0', '1'), ('46', null, '-1', '39', '2017-03-20 00:27:29', '你好，有什么 问题吗', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `news_content` text CHARACTER SET utf8,
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_delete` int(1) DEFAULT '0',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `t_news`
-- ----------------------------
BEGIN;
INSERT INTO `t_news` VALUES ('1', 'fdafdsafdsa', '', '2017-05-22 20:32:05', '0'), ('2', 'aaaaaaaaaaaaaaa', '&lt;p&gt;bbbbbbbbbbb&lt;/p&gt;', '2017-05-22 20:35:28', '0'), ('3', 'bbbbbbbb', '&lt;p&gt;cccccccccccc&lt;/p&gt;', '2017-05-22 21:17:23', '0'), ('4', 'fdafd', '&lt;p&gt;fdafdsa&lt;/p&gt;', '2017-05-23 09:38:02', '0'), ('5', 'fdafdsaf', '<p>fdsafdsafdsa</p>', '2017-05-23 09:38:41', '0'), ('6', '?????', '<p>?????</p>', '2017-05-24 22:20:17', '1'), ('7', '公司新动态', '<p>公司新动态</p>', '2017-05-24 22:20:55', '0');
COMMIT;

-- ----------------------------
--  Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(100) DEFAULT NULL COMMENT '订单号（规则：20170214122815+5位随机数）',
  `start_time` date DEFAULT NULL COMMENT '入住时间',
  `end_time` date DEFAULT NULL COMMENT '离开时间',
  `price` decimal(10,2) DEFAULT NULL COMMENT '订单价格',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '订单状态',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  `is_invoice` int(11) DEFAULT NULL COMMENT '是否需要发票（0不需要|1需要）',
  `invoice_no` int(11) DEFAULT NULL COMMENT '发票号',
  `invoice_title` varchar(255) DEFAULT NULL COMMENT '发票抬头',
  `invoice_posted` int(11) DEFAULT NULL COMMENT '发票是否邮寄（0未邮寄|1邮寄）',
  `invoice_created` int(11) DEFAULT '0' COMMENT '是否已开发票',
  `invoice_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发票邮寄时间',
  `invoice_address` text,
  `invoice_person_name` varchar(50) DEFAULT NULL COMMENT '发票联系人姓名',
  `invoice_person_tel` varchar(255) DEFAULT NULL COMMENT '发票联系人手机',
  `order_type` varchar(255) DEFAULT NULL COMMENT '订单类型？？？',
  `trade_no` varchar(100) DEFAULT NULL COMMENT '交易号',
  `order_memo` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `checkin_memo` varchar(255) DEFAULT NULL COMMENT '入驻备注',
  `checkout_mark` varchar(255) DEFAULT NULL COMMENT '退房备注',
  `checkout_has_problem` varchar(10) DEFAULT '无问题' COMMENT '退房时是否有问题（有问题|无问题）',
  `urgency_concat` varchar(20) DEFAULT NULL COMMENT '紧急联系人',
  `urgency_contact_tel` varchar(20) DEFAULT NULL COMMENT '紧急联系人电话',
  `cash_pledge` int(11) DEFAULT NULL COMMENT '押金',
  `cash_pledge_pay_way` varchar(10) DEFAULT NULL COMMENT '支付方式（支付宝|微信|银行卡|现金）',
  `return_cash_pledge` int(11) DEFAULT NULL COMMENT '退还押金',
  `checkin_charge` int(11) DEFAULT NULL,
  `return_way` varchar(10) DEFAULT NULL COMMENT '退还方式（支付宝|微信|银行卡|现金）',
  `checkout_charge` int(11) DEFAULT NULL COMMENT '结账负责人',
  `is_delete` int(11) DEFAULT '0',
  `facility` varchar(50) DEFAULT NULL COMMENT '付费设备id集合',
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `fk_house_order` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`),
  CONSTRAINT `fk_user_order` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='订单信息表';

-- ----------------------------
--  Records of `t_order`
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES ('100', '2017042004290385064', '2017-04-20', '2017-04-21', '0.01', '2017-04-20 10:29:03', '入住中', '37', '1', null, null, null, null, '0', '2017-05-27 21:05:08', null, 'ww', '15004653965', null, null, null, '发发的撒', null, '无问题', null, '15004653965', '100', null, null, null, '现金', null, '1', ''), ('101', '2017042109064800977', '2017-04-22', '2017-04-23', '1.00', '2017-04-21 15:06:48', '未支付', '37', '1', null, null, null, null, '0', null, null, 'ww', '15004653965', null, null, null, null, null, '无问题', null, '15004653965', null, null, null, null, null, null, '0', ''), ('102', '2017052405520425237', '2017-05-25', '2017-05-26', '1.00', '2017-05-24 11:52:04', '已支付', '52', '1', null, null, null, null, '0', null, null, null, null, null, null, null, null, null, '无问题', null, null, null, '现金', null, null, null, null, '0', null), ('103', '2017052405522377993', '2017-05-25', '2017-05-25', '0.00', '2017-05-24 11:52:23', '已支付', '52', '1', null, null, null, null, '0', null, null, null, null, null, null, null, null, null, '无问题', null, null, null, null, null, null, null, null, '0', null), ('104', '2017052406122025710', '2017-05-25', '2017-05-26', '1.00', '2017-05-24 12:12:20', '已支付', '52', '1', null, null, null, null, '0', null, null, null, null, null, null, null, null, null, '无问题', null, null, null, '现金', null, null, null, null, '0', null), ('105', '2017052406132648313', '2017-05-25', '2017-05-26', '1.00', '2017-05-24 12:13:26', '已支付', '52', '1', null, null, null, null, '0', '2017-05-27 21:35:41', null, null, null, null, null, null, null, null, '无问题', null, null, null, '支付宝', null, null, null, null, '0', null), ('106', '2017052406332768097', '2017-06-09', '2017-06-10', '1.00', '2017-05-24 12:33:27', '已支付', '52', '1', null, null, null, null, '0', '2017-05-27 21:35:44', null, null, null, null, null, null, null, null, '无问题', null, null, null, '微信', null, null, null, null, '0', null), ('107', '2017052406344263421', '2017-06-10', '2017-06-11', '5.00', '2017-05-24 12:34:42', '已支付', '-1', '1', null, null, null, null, '0', '2017-05-28 10:32:33', null, null, null, 'fadsssssssss', null, 'req', 'fd', 'fda', '有问题', '发顺丰的', '123', '123', '微信', '23', null, null, '0', '0', null), ('108', '2017052406361532294', '2017-05-30', '2017-05-31', '3.00', '2017-05-24 12:36:15', '已支付', '-1', '2', null, null, null, null, '0', '2017-05-28 23:35:08', null, null, null, '', null, '', 'fdsafdsa', '', '无问题', '', '', '3', '支付宝', '1', null, null, '0', '0', null), ('109', '2017052804120032081', '2017-06-08', '2017-06-09', '1.00', '2017-05-28 10:12:00', '入住中', '-1', '1', null, null, null, null, '0', '2017-05-28 23:24:50', null, null, null, '', null, '', '', '', '无问题', '', '', '1234', '现金', '0', null, '现金', null, '0', null), ('110', '2017071908135942216', '2017-07-20', '2017-07-21', '0.01', '2017-07-19 14:13:59', '未支付', '37', '1', null, null, null, null, '0', null, null, 'aaa', '15004653965', null, null, null, null, null, '无问题', null, '15004653962', null, null, null, null, null, null, '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `t_plot`
-- ----------------------------
DROP TABLE IF EXISTS `t_plot`;
CREATE TABLE `t_plot` (
  `plot_id` int(11) NOT NULL AUTO_INCREMENT,
  `plot_name` varchar(100) DEFAULT NULL COMMENT '小区名称',
  `plot_delete` int(11) DEFAULT '0',
  `developer_id` int(11) DEFAULT NULL COMMENT '开发商',
  `description` text COMMENT '小区描述',
  `video` varchar(255) DEFAULT NULL COMMENT '视频链接',
  `plot_pos` varchar(30) DEFAULT '126.639003,45.76703' COMMENT '小区坐标',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`plot_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='房源小区信息表';

-- ----------------------------
--  Records of `t_plot`
-- ----------------------------
BEGIN;
INSERT INTO `t_plot` VALUES ('1', '康泰嘉园', '0', '7', '<p>fsafsafsa</p>', '', '126.639003,45.76703', '1'), ('2', '熙俊印象', '0', '8', '<p>熙俊印象<p>', '', '126.639003,45.76703', '2'), ('3', '欣欣怡园', '0', '9', '&lt;p&gt;欣欣怡园&lt;/p&gt;', '', '126.639003,45.76703', '6'), ('4', '玫瑰湾', '0', '10', '&lt;p&gt;玫瑰湾&lt;/p&gt;', '', '126.639003,45.76703', '5'), ('5', '雨阳名居', '0', '11', '&lt;p&gt;雨阳名居&lt;/p&gt;', '', '126.639003,45.76703', '4'), ('6', '群力家园', '0', '7', '&lt;p&gt;群力家园&lt;/p&gt;', '', '126.639003,45.76703', '3');
COMMIT;

-- ----------------------------
--  Table structure for `t_recommend`
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `house_id` int(11) DEFAULT NULL COMMENT '房源id',
  `rec_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '推荐时间',
  `rec_reason` varchar(255) DEFAULT NULL COMMENT '推荐理由',
  `rec_status` varchar(10) DEFAULT '未结束' COMMENT '推荐状态(已结束|未结束)',
  PRIMARY KEY (`rec_id`),
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_recommend` FOREIGN KEY (`house_id`) REFERENCES `t_house` (`house_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8 COMMENT='房源推荐记录表';

-- ----------------------------
--  Records of `t_recommend`
-- ----------------------------
BEGIN;
INSERT INTO `t_recommend` VALUES ('1', '1', '2017-02-07 15:46:06', null, '未结束'), ('2', '12', '2017-03-14 11:49:04', 'qwfghjk', '未结束'), ('3', '10', '2017-04-23 16:04:23', 'aaaaa', '已结束'), ('6', '7', '2017-04-23 22:06:40', 'adfdfd', '已结束'), ('10', '6', '2017-03-14 11:50:17', 'fdfdfdf', '未结束'), ('221', '30', '2017-04-24 04:02:32', '', '未结束'), ('222', '29', '2019-04-01 20:28:33', '', '已结束'), ('223', '29', '2019-04-01 02:28:40', 'haohaohao', '未结束');
COMMIT;

-- ----------------------------
--  Table structure for `t_service`
-- ----------------------------
DROP TABLE IF EXISTS `t_service`;
CREATE TABLE `t_service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `plot_name` varchar(255) DEFAULT NULL,
  `house_name` varchar(255) DEFAULT NULL,
  `facility_name` varchar(255) DEFAULT NULL,
  `question_dec` varchar(255) DEFAULT NULL,
  `service_time` date DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_service`
-- ----------------------------
BEGIN;
INSERT INTO `t_service` VALUES ('5', '2', '啊啊啊', '事实上', '对对对啊啊啊', '0000-00-00'), ('6', '2', '啊啊啊', '事实上', '对对对啊啊啊', '0000-00-00'), ('7', '2', '啊啊啊', '事实上', '对对对啊啊啊', '0000-00-00');
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '登录用户名',
  `rel_name` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(32) NOT NULL COMMENT '密码（需md5加密）',
  `tel` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `sex` varchar(2) DEFAULT NULL COMMENT '性别（男|女）',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `hometown` varchar(10) DEFAULT NULL COMMENT '家乡',
  `city` varchar(10) DEFAULT NULL,
  `portrait` varchar(255) DEFAULT 'uploads/portraits/head-default.png' COMMENT '头像',
  `reg_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `is_delete` varchar(1) DEFAULT '0' COMMENT '是否删除',
  `qq_id` varchar(50) DEFAULT NULL,
  `wechat_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='注册用户信息表';

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('-1', '123123123', null, '123123', '123456', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-02-22 21:09:57', '0', null, null), ('1', '123', null, '123', '123123', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-02-23 22:52:01', '0', null, null), ('2', '2341', '2341', 'a2d3de4bf33c9bea37f74833ad395246', '13123456788', 'wuy_123@126.com', null, '1', '1996-12-18', null, null, 'uploads/headImg/149586855259946.png', '2017-02-23 23:26:29', '0', null, null), ('3', '345', null, '345', '88888888', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-02-23 23:26:34', '0', null, null), ('37', '123qwe', '李逵', '46f94c8de14fb36680850768ff1b7f2a', '15004653962', '123@126.com', '130921187638475822', null, '0000-00-00', null, null, 'uploads/headImg/149586836785487.png', '2017-03-02 23:29:08', '0', null, null), ('38', 'lisi', '李四', 'admin', '1234567', 'lisi@163.com', null, '1', '2017-03-17', null, null, 'uploads/portraits/head-default.png', '2017-03-17 16:24:43', '0', null, null), ('39', 'qq123', null, '21232f297a57a5a743894a0e4a801fc3', 'admin', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-03-20 00:16:54', '0', null, null), ('40', 'aa', null, 'admin', '123456789', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-03-27 11:30:41', '0', null, null), ('44', '哈尔滨悦居', null, '', '', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-04-07 22:31:28', '0', 'C5E4B840D82B0B7333597BACEE687A46', null), ('46', '吴迎', null, '', '', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-04-07 22:53:35', '0', null, 'oZDBCxDLhKjQqMRHb8mBB9MSI6K0'), ('52', '15004653965', null, '', '15004653965', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-04-12 13:23:41', '0', null, null), ('53', '15590863658', null, '', '15590863658', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-04-13 10:13:20', '0', null, null), ('54', '111111', '111111', '111111', '13123456789', '123@126.com', null, '1', '2017-04-04', null, null, 'images/head-default.png', '2017-04-15 19:01:48', '0', null, null), ('55', 'lisi12', '李四', 'lisi12', '13123456789', '123@126.com', null, '1', '2017-04-11', null, null, 'images/head-default.png', '2017-04-19 11:49:43', '0', null, null), ('56', 'aaaa', 'aaa', 'aaaaaa', '13123456789', '123@126.com', null, '1', '2017-04-05', null, null, 'uploads/head/149277146043313.png', '2017-04-21 18:44:25', '0', null, null), ('57', '111', '111', '222222', '13123456788', '123@126.com', null, '1', '2017-04-04', null, null, 'uploads/head/149277231050650.png', '2017-04-21 18:58:34', '0', null, null), ('58', '1111111', null, '7fa8282ad93047a4d6fe6111c93b308a', '11111111111', null, null, null, null, null, null, 'uploads/portraits/head-default.png', '2017-05-27 21:44:36', '0', null, null);
COMMIT;

-- ----------------------------
--  Event structure for `upload_overtime_order`
-- ----------------------------
DROP EVENT IF EXISTS `upload_overtime_order`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` EVENT `upload_overtime_order` ON SCHEDULE EVERY 1 MINUTE STARTS '2017-04-14 01:09:54' ON COMPLETION NOT PRESERVE ENABLE DO begin

update t_order set STATUS = '用户取消' where status = '未支付' and is_delete = 0 and TIMESTAMPDIFF(MINUTE,t_order.add_time,now())>=45;

end
 ;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
