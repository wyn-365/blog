/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2020-03-19 18:52:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `int` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'wang', '123456');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` varchar(255) NOT NULL,
  `cid` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `bimage` varchar(255) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `is_hot` int(11) DEFAULT NULL,
  `bflag` int(11) DEFAULT NULL,
  `bcomment` int(11) DEFAULT NULL,
  `browse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('25F357B053114A978D67A6B2D8351616', '02994BB8870C416E89262F77C74E47AF', 'ceshi', '<p>hahahahah</p>', 'images/blog/a/e/4/5/c/d/c/a/D68D276201904424B2BC77D3BD8C768B.png', '2020-02-13', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` varchar(255) NOT NULL,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('02994BB8870C416E89262F77C74E47AF', 'MySql');
INSERT INTO `category` VALUES ('069179909CFE4B84A0D4E02345C5759C', '大数据');
INSERT INTO `category` VALUES ('1', '前端技术');
INSERT INTO `category` VALUES ('10A2A0530DA8499CA6F579983F7480BB', 'Python');
INSERT INTO `category` VALUES ('2', 'SSM');
INSERT INTO `category` VALUES ('3', 'SSH');
INSERT INTO `category` VALUES ('4', '后端语言');
INSERT INTO `category` VALUES ('52B51207DF2C44048243D3B3E40E03F1', 'SpringBoot');
INSERT INTO `category` VALUES ('7A6025B7085347D9826BDFD911103354', '网盘资料');
INSERT INTO `category` VALUES ('7AE544B2FA6045908197A1462B53BCBA', '人工智能');
INSERT INTO `category` VALUES ('BF3AE4551303422695D7A1F620A9F059', 'maven');
INSERT INTO `category` VALUES ('D7C8A471F2BA4100B99B7A6BEEA502B4', '测试');
INSERT INTO `category` VALUES ('D9B71B8113C0450E99FCF6F14ACB5771', 'NoSql');
INSERT INTO `category` VALUES ('F023F486831E486CAF3474599BF363A6', 'Dubbo');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `blog_id` varchar(255) DEFAULT NULL,
  `rcomment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `blog_id` (`blog_id`),
  CONSTRAINT `blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for everyday
-- ----------------------------
DROP TABLE IF EXISTS `everyday`;
CREATE TABLE `everyday` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `etitle` varchar(255) DEFAULT NULL,
  `econtent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of everyday
-- ----------------------------
INSERT INTO `everyday` VALUES ('1', '阿里巴巴的Druid连接池', 'DRUID是阿里巴巴开源平台上一个数据库连接池实现，它结合了C3P0、DBCP、PROXOOL等DB池的优点，同时加入了日志监控，可以很好的监控DB池连接和SQL的执行情况，可以说是针对监控而生的DB连接池，据说是目前最好的连接池。', 'Druid', 'Druid provides fast analytical queries, at high concurrency, on event-driven data. Druid can instantaneously ingest streaming data and provide sub-second queries to power interactive UIs.');

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2925 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES ('3', '华电', '192班');
INSERT INTO `gonggao` VALUES ('536', '推送bug', '欢迎联系站长推送本站bug');
INSERT INTO `gonggao` VALUES ('856', '评论权限', '本站未登录状态可进行评论哦');
INSERT INTO `gonggao` VALUES ('859', '兼容性', '本站对于IE8以下的浏览器是不兼容的。');
INSERT INTO `gonggao` VALUES ('2924', '敏感词汇', '本站已经屏蔽敏感评论词汇');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `state` int(11) DEFAULT '0',
  `code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
