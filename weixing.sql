/*
Navicat MySQL Data Transfer

Source Server         : 3306
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : weixing

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2017-06-04 00:27:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `chat`
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `ids` varchar(255) NOT NULL,
  `chat_value` varchar(255) DEFAULT NULL,
  `has_send` char(1) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `show_time` char(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ids`),
  KEY `FKiefb0n9dfqybjpmddu4bikwrj` (`from_user_id`),
  CONSTRAINT `FKiefb0n9dfqybjpmddu4bikwrj` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat
-- ----------------------------
INSERT INTO `chat` VALUES ('1496484252287', '1234343', 'F', '2017-06-03 18:04:16', 'F', '123456', '1');
INSERT INTO `chat` VALUES ('1496484295778', '1234343', 'F', '2017-06-03 18:04:55', 'F', '123456', '1');
INSERT INTO `chat` VALUES ('1496484383026', 'dfgdfdgdfgfdgd', 'T', '2017-06-03 18:06:23', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496484385966', 'dfgdfgfd', 'T', '2017-06-03 18:06:25', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496495330792', 'dgfdgfhgfh', 'T', '2017-06-03 21:08:50', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497743672', 'dfgdgdfgdfh', 'T', '2017-06-03 21:49:03', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497747833', '<img class=\"qqemoji qqemoji62\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji77\" src=\"/static/images/spacer.gif\">', 'T', '2017-06-03 21:49:07', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497753183', '<img class=\"qqemoji qqemoji93\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji94\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji97\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji100\" src=\"/static/images/spacer.gif\">', 'T', '2017-06-03 21:49:13', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497758256', 'jhjhhjjhjh', 'T', '2017-06-03 21:49:18', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497761129', 'jhjhjhhjjh', 'T', '2017-06-03 21:49:21', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497764188', 'jhjhjhjhjh', 'T', '2017-06-03 21:49:24', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497766206', 'jhjhjhjh', 'T', '2017-06-03 21:49:26', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496497768299', 'jhjhjhjh', 'T', '2017-06-03 21:49:28', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496498004111', 'dgdfgdfgdf', 'T', '2017-06-03 21:53:24', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496498405577', 'gfhfghgfhg', 'T', '2017-06-03 22:00:05', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496498463655', 'retreretrerte', 'T', '2017-06-03 22:01:03', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496498805890', '<img class=\"qqemoji qqemoji62\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji62\" src=\"/static/images/spacer.gif\">', 'T', '2017-06-03 22:06:45', 'T', 'WORD_TYPE', '2');
INSERT INTO `chat` VALUES ('1496498811977', 'cvxgfdgfd', 'T', '2017-06-03 22:06:51', 'F', 'WORD_TYPE', '2');
INSERT INTO `chat` VALUES ('1496498838849', 'fgfgfg', 'T', '2017-06-03 22:07:18', 'F', 'WORD_TYPE', '2');
INSERT INTO `chat` VALUES ('1496500617905', 'cxgdfgf', 'T', '2017-06-03 22:36:57', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496500619906', 'dsfsdfds', 'T', '2017-06-03 22:36:59', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496500621127', 'dfsds', 'T', '2017-06-03 22:37:01', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496506956828', '<div>gdfdfgfd</div>', 'T', '2017-06-04 00:22:36', 'T', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496506960104', 'gfdgfdgf', 'T', '2017-06-04 00:22:40', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496506964152', '<img class=\"qqemoji qqemoji48\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji49\" src=\"/static/images/spacer.gif\"><img class=\"qqemoji qqemoji51\" src=\"/static/images/spacer.gif\">', 'T', '2017-06-04 00:22:44', 'F', 'WORD_TYPE', '1');
INSERT INTO `chat` VALUES ('1496507032613', 'dfgfdgdf', 'T', '2017-06-04 00:23:52', 'F', 'WORD_TYPE', '2');
INSERT INTO `chat` VALUES ('1496507038715', '<div>fdgfd</div>', 'T', '2017-06-04 00:23:58', 'F', 'WORD_TYPE', '1');

-- ----------------------------
-- Table structure for `chat_user`
-- ----------------------------
DROP TABLE IF EXISTS `chat_user`;
CREATE TABLE `chat_user` (
  `from_user` varchar(255) NOT NULL,
  `to_user` int(11) NOT NULL,
  PRIMARY KEY (`from_user`,`to_user`),
  KEY `FKqiy3mufr2ur4jaegxxid64lv2` (`to_user`),
  CONSTRAINT `FKl5tbb0ijr92dlxvdfnfv4951n` FOREIGN KEY (`from_user`) REFERENCES `chat` (`ids`),
  CONSTRAINT `FKqiy3mufr2ur4jaegxxid64lv2` FOREIGN KEY (`to_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_user
-- ----------------------------
INSERT INTO `chat_user` VALUES ('1496498838849', '1');
INSERT INTO `chat_user` VALUES ('1496507032613', '1');
INSERT INTO `chat_user` VALUES ('1496484252287', '2');
INSERT INTO `chat_user` VALUES ('1496484295778', '2');
INSERT INTO `chat_user` VALUES ('1496484383026', '2');
INSERT INTO `chat_user` VALUES ('1496484385966', '2');
INSERT INTO `chat_user` VALUES ('1496495330792', '2');
INSERT INTO `chat_user` VALUES ('1496497743672', '2');
INSERT INTO `chat_user` VALUES ('1496497747833', '2');
INSERT INTO `chat_user` VALUES ('1496497753183', '2');
INSERT INTO `chat_user` VALUES ('1496497758256', '2');
INSERT INTO `chat_user` VALUES ('1496497761129', '2');
INSERT INTO `chat_user` VALUES ('1496497764188', '2');
INSERT INTO `chat_user` VALUES ('1496497766206', '2');
INSERT INTO `chat_user` VALUES ('1496497768299', '2');
INSERT INTO `chat_user` VALUES ('1496498004111', '2');
INSERT INTO `chat_user` VALUES ('1496498405577', '2');
INSERT INTO `chat_user` VALUES ('1496498463655', '2');
INSERT INTO `chat_user` VALUES ('1496498805890', '2');
INSERT INTO `chat_user` VALUES ('1496498811977', '2');
INSERT INTO `chat_user` VALUES ('1496500617905', '2');
INSERT INTO `chat_user` VALUES ('1496500619906', '2');
INSERT INTO `chat_user` VALUES ('1496500621127', '2');
INSERT INTO `chat_user` VALUES ('1496506956828', '2');
INSERT INTO `chat_user` VALUES ('1496506960104', '2');
INSERT INTO `chat_user` VALUES ('1496506964152', '2');
INSERT INTO `chat_user` VALUES ('1496507038715', '2');

-- ----------------------------
-- Table structure for `file`
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('1', '1494062370635webwxgeticon.jpg', '舒莉的头像');
INSERT INTO `file` VALUES ('2', '1494062404804webwxgeticon2.jpg', '刘杰的头像');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `head_portrait_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4nhkpsa4bkooiwprsqtb83w4u` (`head_portrait_id`),
  CONSTRAINT `FK4nhkpsa4bkooiwprsqtb83w4u` FOREIGN KEY (`head_portrait_id`) REFERENCES `file` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sl', '1');
INSERT INTO `user` VALUES ('2', 'iuie', '2');
