/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : okr

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 08/10/2021 00:58:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '书的id',
  `book_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `img` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '书封面',
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `price` bigint(11) NULL DEFAULT NULL COMMENT '价格',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '借阅者id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '谢特', 'data:image/png;base64,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', 'jisdf', 114514, 0, 20, NULL, '2021-09-08 22:34:11');

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_id` int(11) NOT NULL COMMENT '书id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_tag
-- ----------------------------
INSERT INTO `book_tag` VALUES (1, 1, 5);
INSERT INTO `book_tag` VALUES (2, 1, 6);
INSERT INTO `book_tag` VALUES (3, 1, 8);

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0未归还 1已归还',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for csdn_spider
-- ----------------------------
DROP TABLE IF EXISTS `csdn_spider`;
CREATE TABLE `csdn_spider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `article_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `view_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击量',
  `article_detail_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csdn_spider
-- ----------------------------
INSERT INTO `csdn_spider` VALUES (76, '❤️爆肝十二万字《python从零到精通教程》，从零教你变大佬❤️（建议收藏）', '3697', 'https://blog.csdn.net/weixin_46211269/article/details/120076709');
INSERT INTO `csdn_spider` VALUES (77, '❤️13万字《C语言动漫对话教程(入门篇)》❤️(建议收藏)', '8751', 'https://blog.csdn.net/WhereIsHeroFrom/article/details/120050238');
INSERT INTO `csdn_spider` VALUES (78, 'Python爬虫实战之爬淘宝商品并做数据分析，现在赚钱没点技术还真不行！', '3660', 'https://blog.csdn.net/zhiguigu/article/details/120061978');
INSERT INTO `csdn_spider` VALUES (79, '⭐超详细图解Linux安装⭐', '1155', 'https://blog.csdn.net/weixin_45766180/article/details/120082128');
INSERT INTO `csdn_spider` VALUES (80, '详解linux中rsync的妙用', '125', 'https://blog.csdn.net/weixin_53488443/article/details/120085223');
INSERT INTO `csdn_spider` VALUES (81, '❤ CSDN精心打造一款插件，让你的浏览器：解锁黑科技、个性十足、沉浸式体验 ❤', '1082', 'https://blog.csdn.net/weixin_39032019/article/details/120066606');
INSERT INTO `csdn_spider` VALUES (82, '如何管理你下载的一大堆Python包【❤️win环境及linux环境下创建虚拟环境详解❤️】', '692', 'https://blog.csdn.net/qq_44907926/article/details/120082981');
INSERT INTO `csdn_spider` VALUES (83, '【❗划重点！C语言函数参数传递只有两种方式（值传递，地址传递），不支持“引用传递”！❗】', '1488', 'https://blog.csdn.net/zcc1229936385/article/details/120028154');
INSERT INTO `csdn_spider` VALUES (84, 'TCP协议为什么需要三次握手？', '957', 'https://blog.csdn.net/u014427391/article/details/120064699');
INSERT INTO `csdn_spider` VALUES (85, '项目配置不当引发了数据泄露，人已裂开！！（建议收藏）', '2841', 'https://blog.csdn.net/l1028386804/article/details/120052914');
INSERT INTO `csdn_spider` VALUES (86, 'JavaScript数组常用的方法总结', '2830', 'https://blog.csdn.net/weixin_41937552/article/details/120050650');
INSERT INTO `csdn_spider` VALUES (87, '哔哩哔哩面试官：你可以手写Vue2的响应式原理吗？', '986', 'https://blog.csdn.net/MrWeb/article/details/120064225');
INSERT INTO `csdn_spider` VALUES (88, 'JavaScript教程带你快速入门', '316', 'https://blog.csdn.net/weixin_53790347/article/details/120058457');
INSERT INTO `csdn_spider` VALUES (89, '【 JavaSe 】 程序逻辑控制', '255', 'https://blog.csdn.net/CS_z_jun/article/details/120088597');
INSERT INTO `csdn_spider` VALUES (90, '❤️只用一个脚本做一个 刮刮乐 案例，一不小心刮出来一个女朋友！❤️【学习娱乐一下】', '3298', 'https://blog.csdn.net/zhangay1998/article/details/120047305');
INSERT INTO `csdn_spider` VALUES (91, '【Python】一文弄懂python装饰器（附源码例子）', '466', 'https://blog.csdn.net/zhh763984017/article/details/120072425');
INSERT INTO `csdn_spider` VALUES (92, '⚡每日肥学⚡——算法&面试题2️⃣', '109', 'https://blog.csdn.net/jiahuiandxuehui/article/details/119763830');
INSERT INTO `csdn_spider` VALUES (93, '熬夜爆肝！C++核心STL容器知识点汇总整理【3W字干货预警 建议收藏】', '723', 'https://blog.csdn.net/hhladminhhl/article/details/120073394');
INSERT INTO `csdn_spider` VALUES (94, 'Python介绍', '137', 'https://blog.csdn.net/weixin_52632755/article/details/119957164');
INSERT INTO `csdn_spider` VALUES (95, '爬取淘宝上4000条月饼数据，制作了一个酷炫的可视化大屏！', '1236', 'https://blog.csdn.net/weixin_41261833/article/details/120061974');
INSERT INTO `csdn_spider` VALUES (96, '❤️吐血总结《Mysql从入门到入魔》，图文并茂（建议收藏）❤️', '110', 'https://blog.csdn.net/qq_43965708/article/details/120037528');
INSERT INTO `csdn_spider` VALUES (97, '深度学习基础之numpy，小白轻松入门numpy，送书了！！！', '660', 'https://blog.csdn.net/perfect2011/article/details/120073767');
INSERT INTO `csdn_spider` VALUES (98, '程序员需要达到什么水平才能顺利拿到 20k 无压力？', '2612', 'https://blog.csdn.net/weixin_52710450/article/details/120066139');
INSERT INTO `csdn_spider` VALUES (99, 'Java文件上传实例并解决跨域问题', '158', 'https://blog.csdn.net/promsing/article/details/120089365');
INSERT INTO `csdn_spider` VALUES (100, 'VirtualBox打开虚拟机失败，Not in a hypervisor partition(HPV=0)(VERR_NEM_NOT_AVAILABLE) ，但是没有virtualization选项', '284', 'https://blog.csdn.net/qq_41798899/article/details/120072017');

-- ----------------------------
-- Table structure for key
-- ----------------------------
DROP TABLE IF EXISTS `key`;
CREATE TABLE `key`  (
  `key_id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 钥匙id',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钥匙名称',
  `status` tinyint(1) NOT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key
-- ----------------------------
INSERT INTO `key` VALUES (8, '四教111 撤硕', 1);
INSERT INTO `key` VALUES (10, '四教112 大便', 1);

-- ----------------------------
-- Table structure for key_user
-- ----------------------------
DROP TABLE IF EXISTS `key_user`;
CREATE TABLE `key_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key_id` int(11) NOT NULL COMMENT '钥匙id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0暂保管 1已归还',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key_user
-- ----------------------------
INSERT INTO `key_user` VALUES (8, 8, 22, 1, '2021-10-08 00:45:17', '2021-10-08 00:45:17');
INSERT INTO `key_user` VALUES (9, 10, 22, 1, '2021-10-08 00:46:02', '2021-10-08 00:46:02');
INSERT INTO `key_user` VALUES (10, 8, 22, 1, '2021-10-08 00:48:28', '2021-10-08 00:48:28');
INSERT INTO `key_user` VALUES (11, 10, 22, 1, '2021-10-08 00:49:19', '2021-10-08 00:49:19');
INSERT INTO `key_user` VALUES (12, 10, 22, 1, '2021-10-08 00:56:12', '2021-10-08 00:56:12');
INSERT INTO `key_user` VALUES (13, 8, 22, 1, '2021-10-08 00:56:21', '2021-10-08 00:56:21');
INSERT INTO `key_user` VALUES (14, 8, 22, 0, '2021-10-08 00:56:43', '2021-10-08 00:56:43');
INSERT INTO `key_user` VALUES (15, 10, 20, 0, '2021-10-08 00:57:22', '2021-10-08 00:57:22');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `login_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '请求时间点',
  `duration` int(11) NULL DEFAULT NULL COMMENT '用时 单位ms',
  PRIMARY KEY (`login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1712 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (2, '0:0:0:0:0:0:0:1', NULL, 'anonymousUser', '2021-09-01 09:43:49', 560);
INSERT INTO `login_log` VALUES (3, '0:0:0:0:0:0:0:1', NULL, 'admin', '2021-09-01 09:43:57', 103);
INSERT INTO `login_log` VALUES (4, '0:0:0:0:0:0:0:1', NULL, 'anonymousUser', '2021-09-04 15:38:30', 24);
INSERT INTO `login_log` VALUES (5, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 11:32:35', 1008);
INSERT INTO `login_log` VALUES (6, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 11:34:39', 758);
INSERT INTO `login_log` VALUES (7, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 11:47:56', 757);
INSERT INTO `login_log` VALUES (8, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 11:53:17', 1214);
INSERT INTO `login_log` VALUES (9, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 12:10:04', 654);
INSERT INTO `login_log` VALUES (10, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 12:54:30', 698);
INSERT INTO `login_log` VALUES (11, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 12:54:52', 11);
INSERT INTO `login_log` VALUES (12, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 12:55:09', 13);
INSERT INTO `login_log` VALUES (13, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 12:57:36', 1060);
INSERT INTO `login_log` VALUES (14, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 13:02:25', 758);
INSERT INTO `login_log` VALUES (15, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 13:04:19', 817);
INSERT INTO `login_log` VALUES (16, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 13:57:43', 637);
INSERT INTO `login_log` VALUES (17, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 14:01:30', 657);
INSERT INTO `login_log` VALUES (18, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-06 14:02:04', 180);
INSERT INTO `login_log` VALUES (19, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 14:03:18', 19585);
INSERT INTO `login_log` VALUES (20, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-06 14:05:36', 625);
INSERT INTO `login_log` VALUES (21, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-06 14:05:46', 82);
INSERT INTO `login_log` VALUES (22, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 00:27:04', 6);
INSERT INTO `login_log` VALUES (23, '0:0:0:0:0:0:0:1', '/api/admin/register', 'admin', '2021-09-08 00:27:54', 71);
INSERT INTO `login_log` VALUES (24, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 00:30:53', 3);
INSERT INTO `login_log` VALUES (25, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 01:25:31', 12);
INSERT INTO `login_log` VALUES (26, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 01:25:35', 2);
INSERT INTO `login_log` VALUES (27, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 01:31:44', 8);
INSERT INTO `login_log` VALUES (28, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 11:22:13', 167);
INSERT INTO `login_log` VALUES (29, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 14:09:33', 103);
INSERT INTO `login_log` VALUES (30, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 14:30:42', 151);
INSERT INTO `login_log` VALUES (31, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 14:30:42', 151);
INSERT INTO `login_log` VALUES (32, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 14:37:02', 8);
INSERT INTO `login_log` VALUES (33, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 14:46:30', 18344);
INSERT INTO `login_log` VALUES (34, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 14:50:50', 23);
INSERT INTO `login_log` VALUES (35, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 14:58:40', 19284);
INSERT INTO `login_log` VALUES (36, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 14:59:56', 698);
INSERT INTO `login_log` VALUES (37, '0:0:0:0:0:0:0:1', '/api/admin/register', 'admin', '2021-09-08 16:01:19', 32);
INSERT INTO `login_log` VALUES (38, '0:0:0:0:0:0:0:1', '/api/admin/register', 'admin', '2021-09-08 16:03:15', 112);
INSERT INTO `login_log` VALUES (39, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-08 16:04:02', 38);
INSERT INTO `login_log` VALUES (40, '0:0:0:0:0:0:0:1', '/api/admin/getSignUpList', 'admin', '2021-09-08 16:06:04', 20);
INSERT INTO `login_log` VALUES (41, '0:0:0:0:0:0:0:1', '/api/admin/getSignUp', 'admin', '2021-09-08 16:11:25', 27);
INSERT INTO `login_log` VALUES (42, '0:0:0:0:0:0:0:1', '/api/admin/modifySignUp', 'admin', '2021-09-08 16:12:42', 4);
INSERT INTO `login_log` VALUES (43, '0:0:0:0:0:0:0:1', '/api/admin/modifySignUp', 'admin', '2021-09-08 16:15:08', 90);
INSERT INTO `login_log` VALUES (44, '0:0:0:0:0:0:0:1', '/api/admin/modifySignUp', 'admin', '2021-09-08 16:16:40', 68);
INSERT INTO `login_log` VALUES (45, '0:0:0:0:0:0:0:1', '/api/admin/modifySignUp', 'admin', '2021-09-08 16:17:09', 53);
INSERT INTO `login_log` VALUES (46, '0:0:0:0:0:0:0:1', '/api/admin/exportSignUp', 'admin', '2021-09-08 16:22:12', 359);
INSERT INTO `login_log` VALUES (47, '0:0:0:0:0:0:0:1', '/api/admin/getTagByCond', 'admin', '2021-09-08 16:30:47', 66);
INSERT INTO `login_log` VALUES (48, '0:0:0:0:0:0:0:1', '/api/admin/getTagByCond', 'admin', '2021-09-08 16:30:55', 8);
INSERT INTO `login_log` VALUES (49, '0:0:0:0:0:0:0:1', '/api/admin/getTagByCond', 'admin', '2021-09-08 16:45:15', 69);
INSERT INTO `login_log` VALUES (50, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-08 17:43:36', 23);
INSERT INTO `login_log` VALUES (51, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-08 17:44:20', 7);
INSERT INTO `login_log` VALUES (52, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-08 17:45:46', 7408);
INSERT INTO `login_log` VALUES (53, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-08 17:49:46', 55);
INSERT INTO `login_log` VALUES (54, '0:0:0:0:0:0:0:1', '/api/user/public/getBookByCond', 'admin', '2021-09-08 17:51:30', 56);
INSERT INTO `login_log` VALUES (55, '0:0:0:0:0:0:0:1', '/api/admin/modifyBook', 'admin', '2021-09-08 18:03:01', 212);
INSERT INTO `login_log` VALUES (56, '0:0:0:0:0:0:0:1', '/api/admin/modifyBook', 'admin', '2021-09-08 20:38:13', 178);
INSERT INTO `login_log` VALUES (57, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-08 20:39:13', 4947);
INSERT INTO `login_log` VALUES (58, '0:0:0:0:0:0:0:1', '/api/admin/saveBook', 'admin', '2021-09-08 20:39:46', 14850);
INSERT INTO `login_log` VALUES (59, '0:0:0:0:0:0:0:1', '/api/admin/modifyBook', 'admin', '2021-09-08 22:34:11', 289);
INSERT INTO `login_log` VALUES (60, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-08 23:48:26', 80);
INSERT INTO `login_log` VALUES (61, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-08 23:49:54', 20);
INSERT INTO `login_log` VALUES (62, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-08 23:53:01', 21);
INSERT INTO `login_log` VALUES (63, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-08 23:58:35', 17);
INSERT INTO `login_log` VALUES (64, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 00:00:17', 17);
INSERT INTO `login_log` VALUES (65, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 00:03:25', 52);
INSERT INTO `login_log` VALUES (66, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 00:04:34', 27720);
INSERT INTO `login_log` VALUES (67, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 00:09:36', 52);
INSERT INTO `login_log` VALUES (68, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 00:10:45', 9);
INSERT INTO `login_log` VALUES (69, '0:0:0:0:0:0:0:1', '/api/user/public/borrowBook', 'admin', '2021-09-09 00:30:05', 71);
INSERT INTO `login_log` VALUES (70, '0:0:0:0:0:0:0:1', '/api/user/public/borrowBook', 'admin', '2021-09-09 00:39:46', 164);
INSERT INTO `login_log` VALUES (71, '0:0:0:0:0:0:0:1', '/api/user/public/borrowBook', 'admin', '2021-09-09 00:44:28', 66);
INSERT INTO `login_log` VALUES (72, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-09 00:45:07', 11);
INSERT INTO `login_log` VALUES (73, '0:0:0:0:0:0:0:1', '/api/user/public/returnBook', 'admin', '2021-09-09 00:46:05', 50);
INSERT INTO `login_log` VALUES (74, '0:0:0:0:0:0:0:1', '/api/user/public/borrowBook', 'admin', '2021-09-09 00:46:11', 43);
INSERT INTO `login_log` VALUES (75, '0:0:0:0:0:0:0:1', '/api/user/public/returnBook', 'admin', '2021-09-09 00:46:14', 69);
INSERT INTO `login_log` VALUES (76, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:01:57', 8);
INSERT INTO `login_log` VALUES (77, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:18:47', 6);
INSERT INTO `login_log` VALUES (78, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:19:40', 66);
INSERT INTO `login_log` VALUES (79, '0:0:0:0:0:0:0:1', '/api/common/querySignUp', 'anonymousUser', '2021-09-09 01:21:57', 5);
INSERT INTO `login_log` VALUES (80, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:25:07', 4);
INSERT INTO `login_log` VALUES (81, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:26:57', 144);
INSERT INTO `login_log` VALUES (82, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-09 01:30:26', 86);
INSERT INTO `login_log` VALUES (83, '0:0:0:0:0:0:0:1', '/api/common/querySignUp', 'anonymousUser', '2021-09-09 01:52:56', 18);
INSERT INTO `login_log` VALUES (84, '0:0:0:0:0:0:0:1', '/api/admin/getResourceByCond', 'admin', '2021-09-09 01:54:08', 62);
INSERT INTO `login_log` VALUES (85, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-09 01:54:22', 13);
INSERT INTO `login_log` VALUES (86, '0:0:0:0:0:0:0:1', '/api/common/querySignUp', 'anonymousUser', '2021-09-09 01:54:32', 9);
INSERT INTO `login_log` VALUES (87, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 00:42:48', 140);
INSERT INTO `login_log` VALUES (88, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 00:42:52', 9);
INSERT INTO `login_log` VALUES (89, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 00:44:46', 4);
INSERT INTO `login_log` VALUES (90, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 00:45:17', 6);
INSERT INTO `login_log` VALUES (91, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 00:45:29', 5);
INSERT INTO `login_log` VALUES (92, '0:0:0:0:0:0:0:1', '/api/admin/getLoginLogByCond', 'admin', '2021-09-10 01:41:44', 57);
INSERT INTO `login_log` VALUES (93, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 01:40:53', 8);
INSERT INTO `login_log` VALUES (94, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 01:50:53', 6);
INSERT INTO `login_log` VALUES (95, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 01:53:28', 11);
INSERT INTO `login_log` VALUES (96, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 01:55:30', 9);
INSERT INTO `login_log` VALUES (97, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:20:19', 10);
INSERT INTO `login_log` VALUES (98, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:23:25', 9124);
INSERT INTO `login_log` VALUES (99, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:33:09', 24424);
INSERT INTO `login_log` VALUES (100, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:35:38', 2045);
INSERT INTO `login_log` VALUES (101, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:36:02', 19524);
INSERT INTO `login_log` VALUES (102, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:40:21', 42315);
INSERT INTO `login_log` VALUES (103, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:43:24', 8399);
INSERT INTO `login_log` VALUES (104, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:43:50', 7823);
INSERT INTO `login_log` VALUES (105, '0:0:0:0:0:0:0:1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:52:16', 3142);
INSERT INTO `login_log` VALUES (106, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:54:00', 1854);
INSERT INTO `login_log` VALUES (107, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:57:41', 114);
INSERT INTO `login_log` VALUES (108, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:59:32', 145);
INSERT INTO `login_log` VALUES (109, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 22:59:40', 129);
INSERT INTO `login_log` VALUES (110, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 23:00:25', 64);
INSERT INTO `login_log` VALUES (111, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 23:00:33', 136);
INSERT INTO `login_log` VALUES (112, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 23:01:38', 135);
INSERT INTO `login_log` VALUES (113, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-18 23:02:00', 178);
INSERT INTO `login_log` VALUES (114, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-19 01:38:22', 587);
INSERT INTO `login_log` VALUES (115, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 01:13:29', 116);
INSERT INTO `login_log` VALUES (116, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 01:35:45', 136);
INSERT INTO `login_log` VALUES (117, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 17:50:53', 202);
INSERT INTO `login_log` VALUES (118, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 18:00:27', 5);
INSERT INTO `login_log` VALUES (119, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 18:01:35', 4);
INSERT INTO `login_log` VALUES (120, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 18:03:19', 61);
INSERT INTO `login_log` VALUES (121, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 18:04:45', 135);
INSERT INTO `login_log` VALUES (122, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:04:54', 18052);
INSERT INTO `login_log` VALUES (123, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:05:52', 53);
INSERT INTO `login_log` VALUES (124, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:10:43', 23931);
INSERT INTO `login_log` VALUES (125, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:12:48', 6093);
INSERT INTO `login_log` VALUES (126, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:13:48', 156);
INSERT INTO `login_log` VALUES (127, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:13:57', 129);
INSERT INTO `login_log` VALUES (128, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:14:06', 136);
INSERT INTO `login_log` VALUES (129, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 19:14:13', 139);
INSERT INTO `login_log` VALUES (130, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 20:32:06', 14);
INSERT INTO `login_log` VALUES (131, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 20:32:22', 2);
INSERT INTO `login_log` VALUES (132, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 20:32:31', 2);
INSERT INTO `login_log` VALUES (133, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:03:53', 9);
INSERT INTO `login_log` VALUES (134, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:03:58', 4);
INSERT INTO `login_log` VALUES (135, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:04:33', 2);
INSERT INTO `login_log` VALUES (136, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:04:54', 3);
INSERT INTO `login_log` VALUES (137, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:05:25', 1);
INSERT INTO `login_log` VALUES (138, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:10:33', 7);
INSERT INTO `login_log` VALUES (139, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:12:40', 3);
INSERT INTO `login_log` VALUES (140, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:13:00', 4);
INSERT INTO `login_log` VALUES (141, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:13:03', 1);
INSERT INTO `login_log` VALUES (142, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:13:24', 2);
INSERT INTO `login_log` VALUES (143, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:13:27', 2);
INSERT INTO `login_log` VALUES (144, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:13:29', 2);
INSERT INTO `login_log` VALUES (145, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:14:33', 3);
INSERT INTO `login_log` VALUES (146, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:16:50', 3);
INSERT INTO `login_log` VALUES (147, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:17:27', 2);
INSERT INTO `login_log` VALUES (148, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:19:51', 4);
INSERT INTO `login_log` VALUES (149, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:20:06', 4);
INSERT INTO `login_log` VALUES (150, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:20:24', 3);
INSERT INTO `login_log` VALUES (151, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:20:37', 2);
INSERT INTO `login_log` VALUES (152, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:22:23', 2);
INSERT INTO `login_log` VALUES (153, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:22:37', 3);
INSERT INTO `login_log` VALUES (154, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:24:51', 2);
INSERT INTO `login_log` VALUES (155, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:25:01', 1);
INSERT INTO `login_log` VALUES (156, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:25:24', 1);
INSERT INTO `login_log` VALUES (157, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:25:39', 1);
INSERT INTO `login_log` VALUES (158, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:41:40', 2);
INSERT INTO `login_log` VALUES (159, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:42:23', 1);
INSERT INTO `login_log` VALUES (160, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:43:18', 1);
INSERT INTO `login_log` VALUES (161, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:47:51', 17);
INSERT INTO `login_log` VALUES (162, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-20 21:48:50', 67);
INSERT INTO `login_log` VALUES (163, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-20 21:49:14', 1);
INSERT INTO `login_log` VALUES (164, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:28:50', 29);
INSERT INTO `login_log` VALUES (165, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:29:34', 3);
INSERT INTO `login_log` VALUES (166, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:31:43', 3);
INSERT INTO `login_log` VALUES (167, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:41:42', 3);
INSERT INTO `login_log` VALUES (168, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:45:09', 11590);
INSERT INTO `login_log` VALUES (169, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:46:09', 5375);
INSERT INTO `login_log` VALUES (170, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:48:44', 16523);
INSERT INTO `login_log` VALUES (171, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:52:02', 177951);
INSERT INTO `login_log` VALUES (172, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 00:53:16', 5516);
INSERT INTO `login_log` VALUES (173, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:06:17', 757687);
INSERT INTO `login_log` VALUES (174, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:06:17', 8);
INSERT INTO `login_log` VALUES (175, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:08:53', 16);
INSERT INTO `login_log` VALUES (176, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:09:26', 3);
INSERT INTO `login_log` VALUES (177, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:09:47', 3);
INSERT INTO `login_log` VALUES (178, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:10:40', 2);
INSERT INTO `login_log` VALUES (179, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:10:58', 3);
INSERT INTO `login_log` VALUES (180, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:11:03', 1);
INSERT INTO `login_log` VALUES (181, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:11:05', 3);
INSERT INTO `login_log` VALUES (182, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:11:15', 3);
INSERT INTO `login_log` VALUES (183, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:11:17', 2);
INSERT INTO `login_log` VALUES (184, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:14:12', 5);
INSERT INTO `login_log` VALUES (185, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:16:28', 4);
INSERT INTO `login_log` VALUES (186, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:17:10', 4);
INSERT INTO `login_log` VALUES (187, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:17:20', 2);
INSERT INTO `login_log` VALUES (188, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:19:38', 11);
INSERT INTO `login_log` VALUES (189, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:19:44', 6);
INSERT INTO `login_log` VALUES (190, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:19:48', 10);
INSERT INTO `login_log` VALUES (191, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:19:53', 4);
INSERT INTO `login_log` VALUES (192, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:20:01', 2);
INSERT INTO `login_log` VALUES (193, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:20:02', 2);
INSERT INTO `login_log` VALUES (194, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:20:04', 2);
INSERT INTO `login_log` VALUES (195, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:20:11', 2);
INSERT INTO `login_log` VALUES (196, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:01', 2);
INSERT INTO `login_log` VALUES (197, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:08', 2);
INSERT INTO `login_log` VALUES (198, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:12', 2);
INSERT INTO `login_log` VALUES (199, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:13', 1);
INSERT INTO `login_log` VALUES (200, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:24', 2);
INSERT INTO `login_log` VALUES (201, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:27', 2);
INSERT INTO `login_log` VALUES (202, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:30', 1);
INSERT INTO `login_log` VALUES (203, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:32', 2);
INSERT INTO `login_log` VALUES (204, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:34', 2);
INSERT INTO `login_log` VALUES (205, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:35', 2);
INSERT INTO `login_log` VALUES (206, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:37', 1);
INSERT INTO `login_log` VALUES (207, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:43', 1);
INSERT INTO `login_log` VALUES (208, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:22:53', 3);
INSERT INTO `login_log` VALUES (209, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:00', 2);
INSERT INTO `login_log` VALUES (210, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:01', 1);
INSERT INTO `login_log` VALUES (211, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:07', 2);
INSERT INTO `login_log` VALUES (212, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:17', 2);
INSERT INTO `login_log` VALUES (213, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:18', 1);
INSERT INTO `login_log` VALUES (214, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:20', 2);
INSERT INTO `login_log` VALUES (215, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:47', 1);
INSERT INTO `login_log` VALUES (216, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:48', 1);
INSERT INTO `login_log` VALUES (217, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:50', 1);
INSERT INTO `login_log` VALUES (218, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:52', 1);
INSERT INTO `login_log` VALUES (219, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:55', 1);
INSERT INTO `login_log` VALUES (220, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:23:56', 2);
INSERT INTO `login_log` VALUES (221, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:24:14', 2);
INSERT INTO `login_log` VALUES (222, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:24:17', 2);
INSERT INTO `login_log` VALUES (223, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:24:40', 2);
INSERT INTO `login_log` VALUES (224, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-21 01:28:20', 153);
INSERT INTO `login_log` VALUES (225, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-21 01:29:37', 139);
INSERT INTO `login_log` VALUES (226, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-21 01:29:38', 194);
INSERT INTO `login_log` VALUES (227, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-21 01:39:01', 71);
INSERT INTO `login_log` VALUES (228, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:39:10', 4);
INSERT INTO `login_log` VALUES (229, '127.0.0.1', '/api/common/signUp', 'anonymousUser', '2021-09-21 01:39:55', 39);
INSERT INTO `login_log` VALUES (230, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:39:59', 2);
INSERT INTO `login_log` VALUES (231, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:40:04', 2);
INSERT INTO `login_log` VALUES (232, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:40:28', 2);
INSERT INTO `login_log` VALUES (233, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:40:54', 3);
INSERT INTO `login_log` VALUES (234, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-09-21 01:44:27', 19);
INSERT INTO `login_log` VALUES (235, '0:0:0:0:0:0:0:1', '/api/admin/modifyResourceStatus', 'admin', '2021-09-21 01:44:39', 156);
INSERT INTO `login_log` VALUES (236, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:57:14', 15);
INSERT INTO `login_log` VALUES (237, '0:0:0:0:0:0:0:1', '/api/admin/modifyResourceStatus', 'admin', '2021-09-21 01:57:23', 359);
INSERT INTO `login_log` VALUES (238, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 01:58:39', 12);
INSERT INTO `login_log` VALUES (239, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:22:58', 42);
INSERT INTO `login_log` VALUES (240, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:02', 3);
INSERT INTO `login_log` VALUES (241, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:19', 2);
INSERT INTO `login_log` VALUES (242, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:21', 2);
INSERT INTO `login_log` VALUES (243, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:33', 2);
INSERT INTO `login_log` VALUES (244, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:36', 2);
INSERT INTO `login_log` VALUES (245, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:44', 2);
INSERT INTO `login_log` VALUES (246, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:46', 2);
INSERT INTO `login_log` VALUES (247, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:48', 2);
INSERT INTO `login_log` VALUES (248, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:23:49', 1);
INSERT INTO `login_log` VALUES (249, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:27:47', 2);
INSERT INTO `login_log` VALUES (250, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:27:49', 4);
INSERT INTO `login_log` VALUES (251, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:27:51', 2);
INSERT INTO `login_log` VALUES (252, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:27:52', 2);
INSERT INTO `login_log` VALUES (253, '127.0.0.1', '/api/common/querySignUp', 'anonymousUser', '2021-09-21 16:28:05', 3);
INSERT INTO `login_log` VALUES (254, '0:0:0:0:0:0:0:1', '/api/common/csdnRecord', 'anonymousUser', '2021-09-22 01:01:12', 253);
INSERT INTO `login_log` VALUES (255, '0:0:0:0:0:0:0:1', '/api/common/csdnRecord', 'anonymousUser', '2021-09-22 01:04:39', 16);
INSERT INTO `login_log` VALUES (256, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-23 00:04:12', 61);
INSERT INTO `login_log` VALUES (257, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:04:12', 63);
INSERT INTO `login_log` VALUES (258, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:04:14', 2135);
INSERT INTO `login_log` VALUES (259, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:04:33', 1169);
INSERT INTO `login_log` VALUES (260, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:04:53', 1168);
INSERT INTO `login_log` VALUES (261, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:05:13', 1161);
INSERT INTO `login_log` VALUES (262, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:05:33', 1171);
INSERT INTO `login_log` VALUES (263, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:05:53', 1164);
INSERT INTO `login_log` VALUES (264, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:06:13', 1163);
INSERT INTO `login_log` VALUES (265, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:06:33', 1204);
INSERT INTO `login_log` VALUES (266, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:06:53', 1150);
INSERT INTO `login_log` VALUES (267, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:07:13', 1159);
INSERT INTO `login_log` VALUES (268, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:07:33', 1158);
INSERT INTO `login_log` VALUES (269, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:07:53', 1152);
INSERT INTO `login_log` VALUES (270, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:08:13', 1155);
INSERT INTO `login_log` VALUES (271, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:08:33', 1174);
INSERT INTO `login_log` VALUES (272, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:08:53', 1192);
INSERT INTO `login_log` VALUES (273, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:09:13', 1174);
INSERT INTO `login_log` VALUES (274, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:09:33', 1186);
INSERT INTO `login_log` VALUES (275, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:09:53', 1161);
INSERT INTO `login_log` VALUES (276, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:10:13', 1155);
INSERT INTO `login_log` VALUES (277, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:10:33', 1158);
INSERT INTO `login_log` VALUES (278, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:10:53', 1161);
INSERT INTO `login_log` VALUES (279, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:11:13', 1152);
INSERT INTO `login_log` VALUES (280, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:11:33', 1183);
INSERT INTO `login_log` VALUES (281, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:11:53', 1155);
INSERT INTO `login_log` VALUES (282, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:12:13', 1165);
INSERT INTO `login_log` VALUES (283, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:12:33', 1195);
INSERT INTO `login_log` VALUES (284, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:12:53', 1149);
INSERT INTO `login_log` VALUES (285, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:13:13', 1149);
INSERT INTO `login_log` VALUES (286, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:13:33', 1173);
INSERT INTO `login_log` VALUES (287, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:13:53', 1154);
INSERT INTO `login_log` VALUES (288, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:14:13', 1171);
INSERT INTO `login_log` VALUES (289, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:14:33', 1155);
INSERT INTO `login_log` VALUES (290, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:14:53', 1167);
INSERT INTO `login_log` VALUES (291, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:15:13', 1149);
INSERT INTO `login_log` VALUES (292, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:15:33', 1153);
INSERT INTO `login_log` VALUES (293, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:15:53', 1151);
INSERT INTO `login_log` VALUES (294, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:16:13', 1158);
INSERT INTO `login_log` VALUES (295, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:16:33', 1158);
INSERT INTO `login_log` VALUES (296, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:16:53', 1149);
INSERT INTO `login_log` VALUES (297, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:17:13', 1174);
INSERT INTO `login_log` VALUES (298, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:17:33', 1164);
INSERT INTO `login_log` VALUES (299, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:17:53', 1160);
INSERT INTO `login_log` VALUES (300, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:18:13', 1195);
INSERT INTO `login_log` VALUES (301, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:18:33', 1160);
INSERT INTO `login_log` VALUES (302, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:18:53', 1188);
INSERT INTO `login_log` VALUES (303, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:19:13', 1178);
INSERT INTO `login_log` VALUES (304, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:19:33', 1179);
INSERT INTO `login_log` VALUES (305, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:19:53', 1142);
INSERT INTO `login_log` VALUES (306, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:20:13', 1160);
INSERT INTO `login_log` VALUES (307, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:20:33', 1169);
INSERT INTO `login_log` VALUES (308, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:20:53', 1194);
INSERT INTO `login_log` VALUES (309, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:21:13', 1159);
INSERT INTO `login_log` VALUES (310, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:21:33', 1193);
INSERT INTO `login_log` VALUES (311, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:21:45', 5);
INSERT INTO `login_log` VALUES (312, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:21:46', 1175);
INSERT INTO `login_log` VALUES (313, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:22:06', 1170);
INSERT INTO `login_log` VALUES (314, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:22:26', 1191);
INSERT INTO `login_log` VALUES (315, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:22:46', 1161);
INSERT INTO `login_log` VALUES (316, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:23:06', 1162);
INSERT INTO `login_log` VALUES (317, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:23:26', 1186);
INSERT INTO `login_log` VALUES (318, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:23:46', 1166);
INSERT INTO `login_log` VALUES (319, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:24:06', 1164);
INSERT INTO `login_log` VALUES (320, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:24:26', 1192);
INSERT INTO `login_log` VALUES (321, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:24:46', 1213);
INSERT INTO `login_log` VALUES (322, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:25:06', 1190);
INSERT INTO `login_log` VALUES (323, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:25:20', 2);
INSERT INTO `login_log` VALUES (324, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:25:21', 1181);
INSERT INTO `login_log` VALUES (325, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:25:32', 2);
INSERT INTO `login_log` VALUES (326, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:25:33', 1174);
INSERT INTO `login_log` VALUES (327, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:25:53', 1169);
INSERT INTO `login_log` VALUES (328, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:26:13', 1163);
INSERT INTO `login_log` VALUES (329, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:26:33', 1188);
INSERT INTO `login_log` VALUES (330, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:26:53', 1194);
INSERT INTO `login_log` VALUES (331, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:27:13', 1187);
INSERT INTO `login_log` VALUES (332, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:27:33', 1169);
INSERT INTO `login_log` VALUES (333, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:27:53', 1195);
INSERT INTO `login_log` VALUES (334, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:28:13', 1197);
INSERT INTO `login_log` VALUES (335, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:28:33', 1199);
INSERT INTO `login_log` VALUES (336, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:28:53', 1165);
INSERT INTO `login_log` VALUES (337, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:29:13', 1155);
INSERT INTO `login_log` VALUES (338, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:29:33', 1156);
INSERT INTO `login_log` VALUES (339, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:29:53', 1189);
INSERT INTO `login_log` VALUES (340, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:30:13', 1154);
INSERT INTO `login_log` VALUES (341, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:30:33', 1165);
INSERT INTO `login_log` VALUES (342, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:30:53', 1202);
INSERT INTO `login_log` VALUES (343, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:31:13', 1165);
INSERT INTO `login_log` VALUES (344, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:31:33', 1155);
INSERT INTO `login_log` VALUES (345, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:31:53', 1153);
INSERT INTO `login_log` VALUES (346, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:32:41', 1182);
INSERT INTO `login_log` VALUES (347, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-23 00:34:37', 3);
INSERT INTO `login_log` VALUES (348, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:36:04', 1237);
INSERT INTO `login_log` VALUES (349, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:36:24', 1170);
INSERT INTO `login_log` VALUES (350, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:36:44', 1201);
INSERT INTO `login_log` VALUES (351, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:37:04', 1253);
INSERT INTO `login_log` VALUES (352, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:37:24', 1207);
INSERT INTO `login_log` VALUES (353, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:37:44', 1174);
INSERT INTO `login_log` VALUES (354, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:38:04', 1154);
INSERT INTO `login_log` VALUES (355, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:38:24', 1186);
INSERT INTO `login_log` VALUES (356, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:38:44', 1187);
INSERT INTO `login_log` VALUES (357, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:39:04', 1216);
INSERT INTO `login_log` VALUES (358, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:39:24', 1163);
INSERT INTO `login_log` VALUES (359, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:39:44', 1156);
INSERT INTO `login_log` VALUES (360, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:40:04', 1248);
INSERT INTO `login_log` VALUES (361, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:40:25', 1183);
INSERT INTO `login_log` VALUES (362, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:40:44', 1169);
INSERT INTO `login_log` VALUES (363, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:40:55', 66);
INSERT INTO `login_log` VALUES (364, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:41:04', 5);
INSERT INTO `login_log` VALUES (365, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:43:54', 1184);
INSERT INTO `login_log` VALUES (366, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:44:14', 1228);
INSERT INTO `login_log` VALUES (367, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-23 00:44:35', 3);
INSERT INTO `login_log` VALUES (368, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:44:36', 1173);
INSERT INTO `login_log` VALUES (369, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:44:56', 1179);
INSERT INTO `login_log` VALUES (370, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:45:16', 1166);
INSERT INTO `login_log` VALUES (371, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:45:35', 4);
INSERT INTO `login_log` VALUES (372, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:45:37', 1184);
INSERT INTO `login_log` VALUES (373, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:45:57', 1176);
INSERT INTO `login_log` VALUES (374, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:46:40', 3);
INSERT INTO `login_log` VALUES (375, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:46:41', 160);
INSERT INTO `login_log` VALUES (376, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:46:56', 137);
INSERT INTO `login_log` VALUES (377, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:47:01', 142);
INSERT INTO `login_log` VALUES (378, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:47:14', 3);
INSERT INTO `login_log` VALUES (379, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:47:16', 6);
INSERT INTO `login_log` VALUES (380, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:47:18', 6);
INSERT INTO `login_log` VALUES (381, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:47:19', 3);
INSERT INTO `login_log` VALUES (382, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-23 00:47:25', 4);
INSERT INTO `login_log` VALUES (383, '127.0.0.1', '/api/admin/reloadAdminRoleResource', 'admin', '2021-09-23 00:47:28', 301);
INSERT INTO `login_log` VALUES (384, '127.0.0.1', '/api/admin/reloadAdminRoleResource', 'admin', '2021-09-23 00:47:33', 51);
INSERT INTO `login_log` VALUES (385, '127.0.0.1', '/api/admin/reloadAdminRoleResource', 'admin', '2021-09-23 00:47:39', 46);
INSERT INTO `login_log` VALUES (386, '127.0.0.1', '/api/admin/reloadUserRoleResource', 'admin', '2021-09-23 00:47:45', 56);
INSERT INTO `login_log` VALUES (387, '127.0.0.1', '/api/admin/reloadUserRoleResource', 'admin', '2021-09-23 00:47:47', 55);
INSERT INTO `login_log` VALUES (388, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:47:53', 1176);
INSERT INTO `login_log` VALUES (389, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:47:56', 51);
INSERT INTO `login_log` VALUES (390, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:48:23', 40);
INSERT INTO `login_log` VALUES (391, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:49:21', 2);
INSERT INTO `login_log` VALUES (392, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:49:23', 49);
INSERT INTO `login_log` VALUES (393, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:50:17', 4);
INSERT INTO `login_log` VALUES (394, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:50:35', 130);
INSERT INTO `login_log` VALUES (395, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:51:17', 3);
INSERT INTO `login_log` VALUES (396, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:51:19', 60);
INSERT INTO `login_log` VALUES (397, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:51:36', 60);
INSERT INTO `login_log` VALUES (398, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:53:25', 2);
INSERT INTO `login_log` VALUES (399, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:53:34', 132);
INSERT INTO `login_log` VALUES (400, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:55:45', 1);
INSERT INTO `login_log` VALUES (401, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:55:58', 3);
INSERT INTO `login_log` VALUES (402, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-23 00:56:04', 2);
INSERT INTO `login_log` VALUES (403, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:56:04', 2);
INSERT INTO `login_log` VALUES (404, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:56:06', 1202);
INSERT INTO `login_log` VALUES (405, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:56:26', 1185);
INSERT INTO `login_log` VALUES (406, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:56:30', 2);
INSERT INTO `login_log` VALUES (407, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:56:31', 1174);
INSERT INTO `login_log` VALUES (408, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-23 00:56:51', 1184);
INSERT INTO `login_log` VALUES (409, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:56:58', 138);
INSERT INTO `login_log` VALUES (410, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:57:12', 55);
INSERT INTO `login_log` VALUES (411, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-23 00:57:42', 2);
INSERT INTO `login_log` VALUES (412, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-23 00:58:21', 39);
INSERT INTO `login_log` VALUES (413, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-24 00:34:47', 87);
INSERT INTO `login_log` VALUES (414, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:34:49', 2289);
INSERT INTO `login_log` VALUES (415, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:35:07', 1195);
INSERT INTO `login_log` VALUES (416, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:35:27', 1145);
INSERT INTO `login_log` VALUES (417, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-09-24 00:35:46', 53);
INSERT INTO `login_log` VALUES (418, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:36:49', 1164);
INSERT INTO `login_log` VALUES (419, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:37:09', 1165);
INSERT INTO `login_log` VALUES (420, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:37:29', 1174);
INSERT INTO `login_log` VALUES (421, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:37:49', 1212);
INSERT INTO `login_log` VALUES (422, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:38:09', 1207);
INSERT INTO `login_log` VALUES (423, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:38:29', 1175);
INSERT INTO `login_log` VALUES (424, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:38:49', 1191);
INSERT INTO `login_log` VALUES (425, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:39:09', 1177);
INSERT INTO `login_log` VALUES (426, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:39:29', 1204);
INSERT INTO `login_log` VALUES (427, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:39:49', 1174);
INSERT INTO `login_log` VALUES (428, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:40:09', 1169);
INSERT INTO `login_log` VALUES (429, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:40:29', 1173);
INSERT INTO `login_log` VALUES (430, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:40:49', 1154);
INSERT INTO `login_log` VALUES (431, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:41:09', 1159);
INSERT INTO `login_log` VALUES (432, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:41:29', 1223);
INSERT INTO `login_log` VALUES (433, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:41:49', 1162);
INSERT INTO `login_log` VALUES (434, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:42:09', 1184);
INSERT INTO `login_log` VALUES (435, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:42:29', 1148);
INSERT INTO `login_log` VALUES (436, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:42:49', 1157);
INSERT INTO `login_log` VALUES (437, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:43:09', 1165);
INSERT INTO `login_log` VALUES (438, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:43:29', 1233);
INSERT INTO `login_log` VALUES (439, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:43:49', 1184);
INSERT INTO `login_log` VALUES (440, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:44:09', 1165);
INSERT INTO `login_log` VALUES (441, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:44:29', 1166);
INSERT INTO `login_log` VALUES (442, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:44:49', 1156);
INSERT INTO `login_log` VALUES (443, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:45:09', 1173);
INSERT INTO `login_log` VALUES (444, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:45:29', 1184);
INSERT INTO `login_log` VALUES (445, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:45:49', 1227);
INSERT INTO `login_log` VALUES (446, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:46:09', 1169);
INSERT INTO `login_log` VALUES (447, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:46:29', 1149);
INSERT INTO `login_log` VALUES (448, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:46:49', 1177);
INSERT INTO `login_log` VALUES (449, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:47:09', 1159);
INSERT INTO `login_log` VALUES (450, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-24 00:47:18', 5);
INSERT INTO `login_log` VALUES (451, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:47:19', 1175);
INSERT INTO `login_log` VALUES (452, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-09-24 00:47:23', 230);
INSERT INTO `login_log` VALUES (453, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:47:56', 1168);
INSERT INTO `login_log` VALUES (454, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:48:16', 1173);
INSERT INTO `login_log` VALUES (455, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:48:36', 1158);
INSERT INTO `login_log` VALUES (456, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:48:56', 1197);
INSERT INTO `login_log` VALUES (457, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:49:16', 1168);
INSERT INTO `login_log` VALUES (458, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:49:36', 1170);
INSERT INTO `login_log` VALUES (459, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:49:56', 1155);
INSERT INTO `login_log` VALUES (460, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:50:16', 1165);
INSERT INTO `login_log` VALUES (461, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:50:36', 1167);
INSERT INTO `login_log` VALUES (462, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:50:56', 1170);
INSERT INTO `login_log` VALUES (463, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:51:16', 1161);
INSERT INTO `login_log` VALUES (464, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:51:36', 1154);
INSERT INTO `login_log` VALUES (465, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:51:57', 1257);
INSERT INTO `login_log` VALUES (466, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:52:16', 1167);
INSERT INTO `login_log` VALUES (467, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:52:36', 1214);
INSERT INTO `login_log` VALUES (468, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:52:56', 1207);
INSERT INTO `login_log` VALUES (469, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:53:16', 1185);
INSERT INTO `login_log` VALUES (470, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:53:36', 1171);
INSERT INTO `login_log` VALUES (471, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:53:56', 1165);
INSERT INTO `login_log` VALUES (472, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:54:16', 1202);
INSERT INTO `login_log` VALUES (473, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:54:36', 1219);
INSERT INTO `login_log` VALUES (474, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:54:56', 1157);
INSERT INTO `login_log` VALUES (475, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:55:16', 1164);
INSERT INTO `login_log` VALUES (476, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:55:36', 1153);
INSERT INTO `login_log` VALUES (477, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:55:56', 1166);
INSERT INTO `login_log` VALUES (478, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:56:16', 1166);
INSERT INTO `login_log` VALUES (479, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:56:36', 1190);
INSERT INTO `login_log` VALUES (480, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:56:56', 1176);
INSERT INTO `login_log` VALUES (481, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:57:16', 1176);
INSERT INTO `login_log` VALUES (482, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:57:36', 1196);
INSERT INTO `login_log` VALUES (483, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:57:56', 1161);
INSERT INTO `login_log` VALUES (484, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:58:16', 1180);
INSERT INTO `login_log` VALUES (485, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-24 00:58:19', 3);
INSERT INTO `login_log` VALUES (486, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:58:20', 1190);
INSERT INTO `login_log` VALUES (487, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:58:40', 1207);
INSERT INTO `login_log` VALUES (488, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:59:00', 1164);
INSERT INTO `login_log` VALUES (489, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:59:20', 1202);
INSERT INTO `login_log` VALUES (490, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 00:59:40', 1176);
INSERT INTO `login_log` VALUES (491, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:00:00', 1192);
INSERT INTO `login_log` VALUES (492, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:00:20', 1198);
INSERT INTO `login_log` VALUES (493, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:00:40', 1181);
INSERT INTO `login_log` VALUES (494, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:01:00', 1163);
INSERT INTO `login_log` VALUES (495, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:01:20', 1172);
INSERT INTO `login_log` VALUES (496, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:01:40', 1187);
INSERT INTO `login_log` VALUES (497, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:02:00', 1155);
INSERT INTO `login_log` VALUES (498, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:02:20', 1231);
INSERT INTO `login_log` VALUES (499, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:02:40', 1212);
INSERT INTO `login_log` VALUES (500, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:03:00', 1172);
INSERT INTO `login_log` VALUES (501, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:03:20', 1171);
INSERT INTO `login_log` VALUES (502, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:03:40', 1187);
INSERT INTO `login_log` VALUES (503, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:04:00', 1187);
INSERT INTO `login_log` VALUES (504, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:04:20', 1193);
INSERT INTO `login_log` VALUES (505, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:04:40', 1188);
INSERT INTO `login_log` VALUES (506, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:05:00', 1192);
INSERT INTO `login_log` VALUES (507, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:05:20', 1183);
INSERT INTO `login_log` VALUES (508, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:05:40', 1177);
INSERT INTO `login_log` VALUES (509, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:06:00', 1170);
INSERT INTO `login_log` VALUES (510, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:06:20', 1169);
INSERT INTO `login_log` VALUES (511, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:06:40', 1163);
INSERT INTO `login_log` VALUES (512, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:07:00', 1177);
INSERT INTO `login_log` VALUES (513, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:07:20', 1165);
INSERT INTO `login_log` VALUES (514, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:07:40', 1171);
INSERT INTO `login_log` VALUES (515, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:08:00', 1183);
INSERT INTO `login_log` VALUES (516, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:08:20', 1159);
INSERT INTO `login_log` VALUES (517, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:08:40', 1176);
INSERT INTO `login_log` VALUES (518, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:09:00', 1158);
INSERT INTO `login_log` VALUES (519, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:09:20', 1185);
INSERT INTO `login_log` VALUES (520, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:09:40', 1172);
INSERT INTO `login_log` VALUES (521, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:10:00', 1157);
INSERT INTO `login_log` VALUES (522, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:10:20', 1176);
INSERT INTO `login_log` VALUES (523, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:10:40', 1194);
INSERT INTO `login_log` VALUES (524, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:11:00', 1169);
INSERT INTO `login_log` VALUES (525, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:11:20', 1156);
INSERT INTO `login_log` VALUES (526, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:11:40', 1180);
INSERT INTO `login_log` VALUES (527, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:12:00', 1156);
INSERT INTO `login_log` VALUES (528, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:12:20', 1185);
INSERT INTO `login_log` VALUES (529, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:12:40', 1157);
INSERT INTO `login_log` VALUES (530, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:13:00', 1223);
INSERT INTO `login_log` VALUES (531, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:13:20', 1158);
INSERT INTO `login_log` VALUES (532, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:13:40', 1154);
INSERT INTO `login_log` VALUES (533, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:14:00', 1162);
INSERT INTO `login_log` VALUES (534, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:14:20', 1163);
INSERT INTO `login_log` VALUES (535, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:14:40', 1175);
INSERT INTO `login_log` VALUES (536, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:15:00', 1169);
INSERT INTO `login_log` VALUES (537, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:15:20', 1175);
INSERT INTO `login_log` VALUES (538, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:15:40', 1164);
INSERT INTO `login_log` VALUES (539, '127.0.0.1', '/api/user/info/userInfoByUsername', 'admin', '2021-09-24 01:15:44', 3);
INSERT INTO `login_log` VALUES (540, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:15:45', 1195);
INSERT INTO `login_log` VALUES (541, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:16:05', 1178);
INSERT INTO `login_log` VALUES (542, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:16:25', 1167);
INSERT INTO `login_log` VALUES (543, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:16:45', 1174);
INSERT INTO `login_log` VALUES (544, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:17:05', 1147);
INSERT INTO `login_log` VALUES (545, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:17:24', 1169);
INSERT INTO `login_log` VALUES (546, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:17:44', 1171);
INSERT INTO `login_log` VALUES (547, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:18:04', 1178);
INSERT INTO `login_log` VALUES (548, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:18:24', 1174);
INSERT INTO `login_log` VALUES (549, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:18:44', 1158);
INSERT INTO `login_log` VALUES (550, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:19:04', 1157);
INSERT INTO `login_log` VALUES (551, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:19:24', 1186);
INSERT INTO `login_log` VALUES (552, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:19:44', 1182);
INSERT INTO `login_log` VALUES (553, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:20:04', 1176);
INSERT INTO `login_log` VALUES (554, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:20:24', 1172);
INSERT INTO `login_log` VALUES (555, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:20:44', 1192);
INSERT INTO `login_log` VALUES (556, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:21:04', 1163);
INSERT INTO `login_log` VALUES (557, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:21:24', 1158);
INSERT INTO `login_log` VALUES (558, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:21:44', 1163);
INSERT INTO `login_log` VALUES (559, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:22:04', 1160);
INSERT INTO `login_log` VALUES (560, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:22:24', 1197);
INSERT INTO `login_log` VALUES (561, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:22:44', 1198);
INSERT INTO `login_log` VALUES (562, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-24 01:32:48', 15);
INSERT INTO `login_log` VALUES (563, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:32:50', 1189);
INSERT INTO `login_log` VALUES (564, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:33:10', 1219);
INSERT INTO `login_log` VALUES (565, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:33:30', 1157);
INSERT INTO `login_log` VALUES (566, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:33:50', 1195);
INSERT INTO `login_log` VALUES (567, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:34:10', 1156);
INSERT INTO `login_log` VALUES (568, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:34:30', 1188);
INSERT INTO `login_log` VALUES (569, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:34:50', 1170);
INSERT INTO `login_log` VALUES (570, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:35:10', 1168);
INSERT INTO `login_log` VALUES (571, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:35:30', 1169);
INSERT INTO `login_log` VALUES (572, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:35:50', 1157);
INSERT INTO `login_log` VALUES (573, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:36:10', 1181);
INSERT INTO `login_log` VALUES (574, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:36:30', 1156);
INSERT INTO `login_log` VALUES (575, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:36:50', 1170);
INSERT INTO `login_log` VALUES (576, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:37:10', 1211);
INSERT INTO `login_log` VALUES (577, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:37:30', 1172);
INSERT INTO `login_log` VALUES (578, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:37:50', 1172);
INSERT INTO `login_log` VALUES (579, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:38:10', 1174);
INSERT INTO `login_log` VALUES (580, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:38:30', 1186);
INSERT INTO `login_log` VALUES (581, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:38:50', 1169);
INSERT INTO `login_log` VALUES (582, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-24 01:39:10', 1166);
INSERT INTO `login_log` VALUES (583, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-09-24 01:39:25', 2);
INSERT INTO `login_log` VALUES (584, '127.0.0.1', '/api/common/login', 'admin', '2021-09-24 01:39:29', 2);
INSERT INTO `login_log` VALUES (585, '127.0.0.1', '/api/common/login', 'admin', '2021-09-24 01:40:15', 4);
INSERT INTO `login_log` VALUES (586, '127.0.0.1', '/api/common/login', 'admin', '2021-09-24 01:41:20', 2);
INSERT INTO `login_log` VALUES (587, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-30 02:14:43', 1964);
INSERT INTO `login_log` VALUES (588, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-30 02:15:03', 1153);
INSERT INTO `login_log` VALUES (589, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-30 02:15:23', 1148);
INSERT INTO `login_log` VALUES (590, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-09-30 02:15:42', 1199);
INSERT INTO `login_log` VALUES (591, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-10-01 00:49:35', 564);
INSERT INTO `login_log` VALUES (592, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-01 03:44:04', 824);
INSERT INTO `login_log` VALUES (593, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:44:06', 1984);
INSERT INTO `login_log` VALUES (594, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:44:26', 1170);
INSERT INTO `login_log` VALUES (595, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:44:46', 1167);
INSERT INTO `login_log` VALUES (596, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:45:06', 1247);
INSERT INTO `login_log` VALUES (597, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:45:26', 1275);
INSERT INTO `login_log` VALUES (598, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:45:46', 1164);
INSERT INTO `login_log` VALUES (599, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:46:06', 1158);
INSERT INTO `login_log` VALUES (600, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:46:26', 1174);
INSERT INTO `login_log` VALUES (601, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:46:46', 1185);
INSERT INTO `login_log` VALUES (602, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:46:56', 1187);
INSERT INTO `login_log` VALUES (603, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:47:16', 1156);
INSERT INTO `login_log` VALUES (604, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:47:36', 1156);
INSERT INTO `login_log` VALUES (605, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:47:56', 1171);
INSERT INTO `login_log` VALUES (606, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:48:16', 1505);
INSERT INTO `login_log` VALUES (607, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:48:36', 1166);
INSERT INTO `login_log` VALUES (608, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:48:56', 1219);
INSERT INTO `login_log` VALUES (609, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:49:16', 1194);
INSERT INTO `login_log` VALUES (610, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:49:36', 1244);
INSERT INTO `login_log` VALUES (611, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:49:56', 1131);
INSERT INTO `login_log` VALUES (612, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:50:16', 1139);
INSERT INTO `login_log` VALUES (613, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:50:36', 1137);
INSERT INTO `login_log` VALUES (614, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:50:56', 1161);
INSERT INTO `login_log` VALUES (615, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:51:16', 1151);
INSERT INTO `login_log` VALUES (616, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:51:27', 1143);
INSERT INTO `login_log` VALUES (617, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 03:52:28', 159);
INSERT INTO `login_log` VALUES (618, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:52:29', 1137);
INSERT INTO `login_log` VALUES (619, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:55:50', 1118);
INSERT INTO `login_log` VALUES (620, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 03:59:10', 1155);
INSERT INTO `login_log` VALUES (621, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:00:38', 13);
INSERT INTO `login_log` VALUES (622, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:00:39', 1157);
INSERT INTO `login_log` VALUES (623, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:03:59', 1140);
INSERT INTO `login_log` VALUES (624, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:07:19', 1124);
INSERT INTO `login_log` VALUES (625, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:07:43', 12);
INSERT INTO `login_log` VALUES (626, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:07:44', 1133);
INSERT INTO `login_log` VALUES (627, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:09:27', 14);
INSERT INTO `login_log` VALUES (628, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:09:28', 1149);
INSERT INTO `login_log` VALUES (629, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:10:36', 14);
INSERT INTO `login_log` VALUES (630, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:10:37', 1143);
INSERT INTO `login_log` VALUES (631, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:13:43', 13);
INSERT INTO `login_log` VALUES (632, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:13:44', 1165);
INSERT INTO `login_log` VALUES (633, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:17:04', 1165);
INSERT INTO `login_log` VALUES (634, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 04:17:25', 15);
INSERT INTO `login_log` VALUES (635, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:17:26', 1157);
INSERT INTO `login_log` VALUES (636, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:20:46', 1156);
INSERT INTO `login_log` VALUES (637, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:24:06', 1131);
INSERT INTO `login_log` VALUES (638, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:27:26', 1137);
INSERT INTO `login_log` VALUES (639, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:30:46', 1140);
INSERT INTO `login_log` VALUES (640, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:47:37', 1143);
INSERT INTO `login_log` VALUES (641, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:51:37', 1186);
INSERT INTO `login_log` VALUES (642, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:54:37', 1153);
INSERT INTO `login_log` VALUES (643, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 04:57:37', 1188);
INSERT INTO `login_log` VALUES (644, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:01:37', 1132);
INSERT INTO `login_log` VALUES (645, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:04:16', 1152);
INSERT INTO `login_log` VALUES (646, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:07:26', 1152);
INSERT INTO `login_log` VALUES (647, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:09:39', 12);
INSERT INTO `login_log` VALUES (648, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:09:40', 1154);
INSERT INTO `login_log` VALUES (649, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:13:00', 1152);
INSERT INTO `login_log` VALUES (650, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:16:20', 1132);
INSERT INTO `login_log` VALUES (651, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:19:40', 1136);
INSERT INTO `login_log` VALUES (652, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:20:36', 7);
INSERT INTO `login_log` VALUES (653, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:20:37', 1157);
INSERT INTO `login_log` VALUES (654, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:22:07', 21);
INSERT INTO `login_log` VALUES (655, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:22:08', 1158);
INSERT INTO `login_log` VALUES (656, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:25:28', 1261);
INSERT INTO `login_log` VALUES (657, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:25:30', 3);
INSERT INTO `login_log` VALUES (658, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:25:31', 1172);
INSERT INTO `login_log` VALUES (659, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:28:51', 1126);
INSERT INTO `login_log` VALUES (660, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:30:02', 4);
INSERT INTO `login_log` VALUES (661, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:30:03', 4);
INSERT INTO `login_log` VALUES (662, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:30:04', 1198);
INSERT INTO `login_log` VALUES (663, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:30:04', 1186);
INSERT INTO `login_log` VALUES (664, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:31:53', 3);
INSERT INTO `login_log` VALUES (665, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:31:58', 3);
INSERT INTO `login_log` VALUES (666, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:31:59', 1199);
INSERT INTO `login_log` VALUES (667, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 05:32:21', 2);
INSERT INTO `login_log` VALUES (668, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 05:32:22', 1150);
INSERT INTO `login_log` VALUES (669, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 20:56:52', 124);
INSERT INTO `login_log` VALUES (670, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 20:56:54', 2311);
INSERT INTO `login_log` VALUES (671, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:00:12', 1173);
INSERT INTO `login_log` VALUES (672, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:03:32', 1187);
INSERT INTO `login_log` VALUES (673, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:06:52', 1176);
INSERT INTO `login_log` VALUES (674, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:10:12', 1190);
INSERT INTO `login_log` VALUES (675, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:13:38', 1190);
INSERT INTO `login_log` VALUES (676, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:16:52', 1180);
INSERT INTO `login_log` VALUES (677, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:20:12', 1170);
INSERT INTO `login_log` VALUES (678, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:23:38', 1159);
INSERT INTO `login_log` VALUES (679, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:27:38', 1205);
INSERT INTO `login_log` VALUES (680, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:30:38', 1175);
INSERT INTO `login_log` VALUES (681, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:33:38', 1170);
INSERT INTO `login_log` VALUES (682, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:37:38', 1165);
INSERT INTO `login_log` VALUES (683, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 21:37:49', 5);
INSERT INTO `login_log` VALUES (684, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:37:50', 1155);
INSERT INTO `login_log` VALUES (685, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 21:38:42', 6);
INSERT INTO `login_log` VALUES (686, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:38:43', 1193);
INSERT INTO `login_log` VALUES (687, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 21:39:07', 5);
INSERT INTO `login_log` VALUES (688, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:39:08', 1180);
INSERT INTO `login_log` VALUES (689, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:42:28', 1185);
INSERT INTO `login_log` VALUES (690, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:45:48', 1183);
INSERT INTO `login_log` VALUES (691, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:49:08', 1199);
INSERT INTO `login_log` VALUES (692, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:52:28', 1235);
INSERT INTO `login_log` VALUES (693, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:56:38', 1193);
INSERT INTO `login_log` VALUES (694, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 21:59:38', 1193);
INSERT INTO `login_log` VALUES (695, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:02:38', 1197);
INSERT INTO `login_log` VALUES (696, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:06:38', 1193);
INSERT INTO `login_log` VALUES (697, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:09:38', 1186);
INSERT INTO `login_log` VALUES (698, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:12:38', 1186);
INSERT INTO `login_log` VALUES (699, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:16:38', 1172);
INSERT INTO `login_log` VALUES (700, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:19:38', 1182);
INSERT INTO `login_log` VALUES (701, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-01 22:22:01', 6);
INSERT INTO `login_log` VALUES (702, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:22:02', 1236);
INSERT INTO `login_log` VALUES (703, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:25:22', 1262);
INSERT INTO `login_log` VALUES (704, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:28:42', 1289);
INSERT INTO `login_log` VALUES (705, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:32:02', 1222);
INSERT INTO `login_log` VALUES (706, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:35:22', 1214);
INSERT INTO `login_log` VALUES (707, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:39:38', 1176);
INSERT INTO `login_log` VALUES (708, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:42:38', 1177);
INSERT INTO `login_log` VALUES (709, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:45:38', 1197);
INSERT INTO `login_log` VALUES (710, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:49:38', 1189);
INSERT INTO `login_log` VALUES (711, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:52:38', 1184);
INSERT INTO `login_log` VALUES (712, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:55:38', 1209);
INSERT INTO `login_log` VALUES (713, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 22:59:38', 1213);
INSERT INTO `login_log` VALUES (714, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:02:38', 1211);
INSERT INTO `login_log` VALUES (715, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:05:38', 1184);
INSERT INTO `login_log` VALUES (716, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:09:38', 1165);
INSERT INTO `login_log` VALUES (717, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:12:38', 1180);
INSERT INTO `login_log` VALUES (718, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:15:38', 1206);
INSERT INTO `login_log` VALUES (719, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:19:38', 1158);
INSERT INTO `login_log` VALUES (720, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:22:38', 1198);
INSERT INTO `login_log` VALUES (721, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:25:38', 1183);
INSERT INTO `login_log` VALUES (722, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:29:38', 1194);
INSERT INTO `login_log` VALUES (723, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:32:38', 1191);
INSERT INTO `login_log` VALUES (724, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:35:38', 1156);
INSERT INTO `login_log` VALUES (725, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:39:38', 1220);
INSERT INTO `login_log` VALUES (726, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:42:38', 1175);
INSERT INTO `login_log` VALUES (727, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:45:38', 1183);
INSERT INTO `login_log` VALUES (728, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:49:38', 1170);
INSERT INTO `login_log` VALUES (729, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:52:38', 1226);
INSERT INTO `login_log` VALUES (730, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:55:38', 1304);
INSERT INTO `login_log` VALUES (731, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-01 23:59:38', 1252);
INSERT INTO `login_log` VALUES (732, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:02:38', 1249);
INSERT INTO `login_log` VALUES (733, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:05:38', 1247);
INSERT INTO `login_log` VALUES (734, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:09:38', 1262);
INSERT INTO `login_log` VALUES (735, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:12:38', 1174);
INSERT INTO `login_log` VALUES (736, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:15:38', 1218);
INSERT INTO `login_log` VALUES (737, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:19:38', 1200);
INSERT INTO `login_log` VALUES (738, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:22:38', 1160);
INSERT INTO `login_log` VALUES (739, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:25:38', 1260);
INSERT INTO `login_log` VALUES (740, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:29:38', 1177);
INSERT INTO `login_log` VALUES (741, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:32:38', 1196);
INSERT INTO `login_log` VALUES (742, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:35:38', 1175);
INSERT INTO `login_log` VALUES (743, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:39:38', 1192);
INSERT INTO `login_log` VALUES (744, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:42:38', 1164);
INSERT INTO `login_log` VALUES (745, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:45:38', 1154);
INSERT INTO `login_log` VALUES (746, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:49:38', 1184);
INSERT INTO `login_log` VALUES (747, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:52:38', 1164);
INSERT INTO `login_log` VALUES (748, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:55:38', 1179);
INSERT INTO `login_log` VALUES (749, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 00:59:38', 1172);
INSERT INTO `login_log` VALUES (750, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:02:38', 1205);
INSERT INTO `login_log` VALUES (751, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:05:38', 1178);
INSERT INTO `login_log` VALUES (752, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:09:38', 1168);
INSERT INTO `login_log` VALUES (753, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:12:38', 1162);
INSERT INTO `login_log` VALUES (754, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:15:38', 1174);
INSERT INTO `login_log` VALUES (755, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:19:38', 1167);
INSERT INTO `login_log` VALUES (756, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:22:38', 1168);
INSERT INTO `login_log` VALUES (757, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:25:38', 1165);
INSERT INTO `login_log` VALUES (758, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:29:38', 1262);
INSERT INTO `login_log` VALUES (759, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:32:38', 1226);
INSERT INTO `login_log` VALUES (760, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:35:38', 1169);
INSERT INTO `login_log` VALUES (761, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:39:38', 1154);
INSERT INTO `login_log` VALUES (762, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:42:38', 1212);
INSERT INTO `login_log` VALUES (763, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:45:38', 1176);
INSERT INTO `login_log` VALUES (764, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:49:38', 1255);
INSERT INTO `login_log` VALUES (765, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:52:38', 1205);
INSERT INTO `login_log` VALUES (766, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:55:38', 1156);
INSERT INTO `login_log` VALUES (767, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 01:59:38', 1207);
INSERT INTO `login_log` VALUES (768, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:02:38', 1214);
INSERT INTO `login_log` VALUES (769, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:05:38', 1227);
INSERT INTO `login_log` VALUES (770, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:09:38', 1187);
INSERT INTO `login_log` VALUES (771, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:12:38', 1191);
INSERT INTO `login_log` VALUES (772, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:15:38', 1177);
INSERT INTO `login_log` VALUES (773, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:19:38', 1248);
INSERT INTO `login_log` VALUES (774, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:22:38', 1170);
INSERT INTO `login_log` VALUES (775, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:25:38', 1200);
INSERT INTO `login_log` VALUES (776, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:29:38', 1175);
INSERT INTO `login_log` VALUES (777, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:32:38', 1179);
INSERT INTO `login_log` VALUES (778, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:35:38', 1240);
INSERT INTO `login_log` VALUES (779, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:39:38', 1282);
INSERT INTO `login_log` VALUES (780, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:42:38', 1201);
INSERT INTO `login_log` VALUES (781, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:45:38', 1170);
INSERT INTO `login_log` VALUES (782, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:49:38', 1190);
INSERT INTO `login_log` VALUES (783, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:52:38', 1191);
INSERT INTO `login_log` VALUES (784, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:55:38', 1175);
INSERT INTO `login_log` VALUES (785, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 02:59:38', 1245);
INSERT INTO `login_log` VALUES (786, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:02:38', 1192);
INSERT INTO `login_log` VALUES (787, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:05:38', 1269);
INSERT INTO `login_log` VALUES (788, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:09:38', 1167);
INSERT INTO `login_log` VALUES (789, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:12:38', 1194);
INSERT INTO `login_log` VALUES (790, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:15:38', 1163);
INSERT INTO `login_log` VALUES (791, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:19:38', 1226);
INSERT INTO `login_log` VALUES (792, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:22:38', 1190);
INSERT INTO `login_log` VALUES (793, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:25:38', 1174);
INSERT INTO `login_log` VALUES (794, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:29:38', 1172);
INSERT INTO `login_log` VALUES (795, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:32:38', 1195);
INSERT INTO `login_log` VALUES (796, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:35:38', 1167);
INSERT INTO `login_log` VALUES (797, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:39:38', 1183);
INSERT INTO `login_log` VALUES (798, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:42:38', 1167);
INSERT INTO `login_log` VALUES (799, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:45:38', 1163);
INSERT INTO `login_log` VALUES (800, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:49:38', 1183);
INSERT INTO `login_log` VALUES (801, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:52:38', 1198);
INSERT INTO `login_log` VALUES (802, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:55:38', 1162);
INSERT INTO `login_log` VALUES (803, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 03:59:38', 1255);
INSERT INTO `login_log` VALUES (804, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 04:02:38', 1186);
INSERT INTO `login_log` VALUES (805, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 04:05:38', 1165);
INSERT INTO `login_log` VALUES (806, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 04:09:38', 1177);
INSERT INTO `login_log` VALUES (807, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 04:12:38', 1184);
INSERT INTO `login_log` VALUES (808, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 16:24:21', 78);
INSERT INTO `login_log` VALUES (809, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:24:23', 2101);
INSERT INTO `login_log` VALUES (810, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 16:26:46', 7);
INSERT INTO `login_log` VALUES (811, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:26:47', 1204);
INSERT INTO `login_log` VALUES (812, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 16:26:59', 4);
INSERT INTO `login_log` VALUES (813, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:27:01', 1184);
INSERT INTO `login_log` VALUES (814, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:30:21', 1222);
INSERT INTO `login_log` VALUES (815, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:33:41', 1167);
INSERT INTO `login_log` VALUES (816, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:37:01', 1159);
INSERT INTO `login_log` VALUES (817, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:40:21', 1174);
INSERT INTO `login_log` VALUES (818, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 16:43:32', 7);
INSERT INTO `login_log` VALUES (819, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:43:33', 1197);
INSERT INTO `login_log` VALUES (820, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 16:45:52', 4);
INSERT INTO `login_log` VALUES (821, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:46:54', 1170);
INSERT INTO `login_log` VALUES (822, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:50:14', 1162);
INSERT INTO `login_log` VALUES (823, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:53:34', 1205);
INSERT INTO `login_log` VALUES (824, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 16:56:54', 1217);
INSERT INTO `login_log` VALUES (825, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:00:14', 1151);
INSERT INTO `login_log` VALUES (826, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:04:11', 1209);
INSERT INTO `login_log` VALUES (827, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 17:05:21', 5);
INSERT INTO `login_log` VALUES (828, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:05:22', 1238);
INSERT INTO `login_log` VALUES (829, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 17:06:26', 6);
INSERT INTO `login_log` VALUES (830, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:06:27', 1191);
INSERT INTO `login_log` VALUES (831, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 17:06:41', 4);
INSERT INTO `login_log` VALUES (832, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:07:43', 1191);
INSERT INTO `login_log` VALUES (833, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 17:07:53', 1163);
INSERT INTO `login_log` VALUES (834, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 19:55:37', 4195);
INSERT INTO `login_log` VALUES (835, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 19:57:55', 1189);
INSERT INTO `login_log` VALUES (836, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:01:15', 1167);
INSERT INTO `login_log` VALUES (837, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:04:35', 1183);
INSERT INTO `login_log` VALUES (838, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:08:11', 1186);
INSERT INTO `login_log` VALUES (839, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:12:11', 1174);
INSERT INTO `login_log` VALUES (840, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:15:11', 1168);
INSERT INTO `login_log` VALUES (841, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:18:11', 1265);
INSERT INTO `login_log` VALUES (842, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:22:11', 1168);
INSERT INTO `login_log` VALUES (843, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:25:11', 1175);
INSERT INTO `login_log` VALUES (844, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:28:11', 1190);
INSERT INTO `login_log` VALUES (845, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:32:11', 1175);
INSERT INTO `login_log` VALUES (846, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:35:11', 1155);
INSERT INTO `login_log` VALUES (847, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:38:11', 1196);
INSERT INTO `login_log` VALUES (848, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:42:11', 1180);
INSERT INTO `login_log` VALUES (849, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:45:11', 1215);
INSERT INTO `login_log` VALUES (850, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:48:11', 1162);
INSERT INTO `login_log` VALUES (851, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:52:11', 1195);
INSERT INTO `login_log` VALUES (852, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:55:11', 1174);
INSERT INTO `login_log` VALUES (853, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 20:57:54', 1198);
INSERT INTO `login_log` VALUES (854, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:01:14', 1168);
INSERT INTO `login_log` VALUES (855, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:04:34', 1193);
INSERT INTO `login_log` VALUES (856, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:07:55', 1169);
INSERT INTO `login_log` VALUES (857, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:11:15', 1186);
INSERT INTO `login_log` VALUES (858, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:15:11', 1176);
INSERT INTO `login_log` VALUES (859, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:18:11', 1166);
INSERT INTO `login_log` VALUES (860, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:22:11', 1160);
INSERT INTO `login_log` VALUES (861, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:25:11', 1171);
INSERT INTO `login_log` VALUES (862, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:28:11', 1202);
INSERT INTO `login_log` VALUES (863, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 21:29:14', 4);
INSERT INTO `login_log` VALUES (864, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-02 21:29:15', 1170);
INSERT INTO `login_log` VALUES (865, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 22:27:13', 4);
INSERT INTO `login_log` VALUES (866, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 22:27:32', 3);
INSERT INTO `login_log` VALUES (867, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-02 22:28:31', 4);
INSERT INTO `login_log` VALUES (868, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:31:37', 4);
INSERT INTO `login_log` VALUES (869, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 02:39:26', 123);
INSERT INTO `login_log` VALUES (870, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:39:31', 4);
INSERT INTO `login_log` VALUES (871, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:43:36', 3);
INSERT INTO `login_log` VALUES (872, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:45:26', 2);
INSERT INTO `login_log` VALUES (873, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:45:34', 3);
INSERT INTO `login_log` VALUES (874, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 02:45:46', 13);
INSERT INTO `login_log` VALUES (875, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:45:46', 3);
INSERT INTO `login_log` VALUES (876, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 02:45:47', 1193);
INSERT INTO `login_log` VALUES (877, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:46:54', 4);
INSERT INTO `login_log` VALUES (878, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 02:46:55', 1171);
INSERT INTO `login_log` VALUES (879, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:47:44', 3);
INSERT INTO `login_log` VALUES (880, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 02:47:45', 1147);
INSERT INTO `login_log` VALUES (881, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:48:45', 3);
INSERT INTO `login_log` VALUES (882, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:48:49', 3);
INSERT INTO `login_log` VALUES (883, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 02:48:51', 1141);
INSERT INTO `login_log` VALUES (884, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 02:49:50', 136);
INSERT INTO `login_log` VALUES (885, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 02:52:10', 3);
INSERT INTO `login_log` VALUES (886, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 02:52:17', 53);
INSERT INTO `login_log` VALUES (887, '127.0.0.1', '/api/user/info/modifyPassword', 'admin', '2021-10-03 02:55:20', 1);
INSERT INTO `login_log` VALUES (888, '127.0.0.1', '/api/user/info/modifyPassword', 'admin', '2021-10-03 02:57:06', 19491);
INSERT INTO `login_log` VALUES (889, '127.0.0.1', '/api/user/info/modifyPassword', 'admin', '2021-10-03 03:01:59', 5201);
INSERT INTO `login_log` VALUES (890, '127.0.0.1', '/api/user/info/modifyPassword', 'admin', '2021-10-03 03:02:42', 4);
INSERT INTO `login_log` VALUES (891, '127.0.0.1', '/api/user/info/modifyPassword', 'admin', '2021-10-03 03:02:52', 54);
INSERT INTO `login_log` VALUES (892, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 03:03:00', 10);
INSERT INTO `login_log` VALUES (893, '127.0.0.1', '/api/user/info/upload', 'admin', '2021-10-03 03:06:59', 64);
INSERT INTO `login_log` VALUES (894, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 03:07:11', 5);
INSERT INTO `login_log` VALUES (895, '127.0.0.1', '/api/user/info/upload', 'admin', '2021-10-03 03:13:39', 360);
INSERT INTO `login_log` VALUES (896, '127.0.0.1', '/api/user/info/upload', 'admin', '2021-10-03 03:14:55', 238);
INSERT INTO `login_log` VALUES (897, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 03:16:41', 3);
INSERT INTO `login_log` VALUES (898, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 03:16:53', 163);
INSERT INTO `login_log` VALUES (899, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 03:19:46', 3);
INSERT INTO `login_log` VALUES (900, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 03:19:55', 136);
INSERT INTO `login_log` VALUES (901, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 03:21:34', 11981);
INSERT INTO `login_log` VALUES (902, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-03 03:31:07', 73);
INSERT INTO `login_log` VALUES (903, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 03:31:19', 1672);
INSERT INTO `login_log` VALUES (904, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 03:31:27', 163);
INSERT INTO `login_log` VALUES (905, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 15:47:33', 88);
INSERT INTO `login_log` VALUES (906, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 15:47:35', 2042);
INSERT INTO `login_log` VALUES (907, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 15:47:53', 1199);
INSERT INTO `login_log` VALUES (908, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 15:48:48', 4);
INSERT INTO `login_log` VALUES (909, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 15:49:49', 61);
INSERT INTO `login_log` VALUES (910, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 15:56:23', 7);
INSERT INTO `login_log` VALUES (911, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 15:56:23', 4);
INSERT INTO `login_log` VALUES (912, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 15:57:08', 3);
INSERT INTO `login_log` VALUES (913, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 15:57:24', 2);
INSERT INTO `login_log` VALUES (914, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 15:58:19', 2);
INSERT INTO `login_log` VALUES (915, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 16:00:54', 20346);
INSERT INTO `login_log` VALUES (916, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 16:13:45', 10445);
INSERT INTO `login_log` VALUES (917, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 16:16:11', 568);
INSERT INTO `login_log` VALUES (918, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 16:16:12', 13);
INSERT INTO `login_log` VALUES (919, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 16:16:14', 1659);
INSERT INTO `login_log` VALUES (920, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:16:48', 32);
INSERT INTO `login_log` VALUES (921, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:28:21', 6);
INSERT INTO `login_log` VALUES (922, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:50:38', 5);
INSERT INTO `login_log` VALUES (923, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 16:57:12', 14);
INSERT INTO `login_log` VALUES (924, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:57:40', 27978);
INSERT INTO `login_log` VALUES (925, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 16:58:15', 21329);
INSERT INTO `login_log` VALUES (926, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:58:31', 37243);
INSERT INTO `login_log` VALUES (927, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 16:59:17', 4);
INSERT INTO `login_log` VALUES (928, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 16:59:39', 21337);
INSERT INTO `login_log` VALUES (929, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:12:44', 11);
INSERT INTO `login_log` VALUES (930, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:12:44', 30);
INSERT INTO `login_log` VALUES (931, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:13:23', 6);
INSERT INTO `login_log` VALUES (932, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:13:54', 8);
INSERT INTO `login_log` VALUES (933, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:13:54', 5);
INSERT INTO `login_log` VALUES (934, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:16:45', 4);
INSERT INTO `login_log` VALUES (935, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:27:55', 5);
INSERT INTO `login_log` VALUES (936, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:27:55', 7);
INSERT INTO `login_log` VALUES (937, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:28:33', 7);
INSERT INTO `login_log` VALUES (938, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:28:53', 5);
INSERT INTO `login_log` VALUES (939, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:28:53', 7);
INSERT INTO `login_log` VALUES (940, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:31:02', 3);
INSERT INTO `login_log` VALUES (941, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:31:02', 7);
INSERT INTO `login_log` VALUES (942, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:57:58', 4);
INSERT INTO `login_log` VALUES (943, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:57:58', 7);
INSERT INTO `login_log` VALUES (944, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 17:58:20', 6);
INSERT INTO `login_log` VALUES (945, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 17:58:20', 6);
INSERT INTO `login_log` VALUES (946, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:00:03', 4);
INSERT INTO `login_log` VALUES (947, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:00:03', 5);
INSERT INTO `login_log` VALUES (948, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:00:59', 4);
INSERT INTO `login_log` VALUES (949, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:00:59', 7);
INSERT INTO `login_log` VALUES (950, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:01:25', 4);
INSERT INTO `login_log` VALUES (951, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:01:25', 6);
INSERT INTO `login_log` VALUES (952, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:01:59', 4);
INSERT INTO `login_log` VALUES (953, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:01:59', 7);
INSERT INTO `login_log` VALUES (954, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 18:04:17', 15);
INSERT INTO `login_log` VALUES (955, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:04:17', 4);
INSERT INTO `login_log` VALUES (956, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 18:04:18', 1658);
INSERT INTO `login_log` VALUES (957, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:04:20', 4);
INSERT INTO `login_log` VALUES (958, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:04:30', 4);
INSERT INTO `login_log` VALUES (959, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:09:16', 102);
INSERT INTO `login_log` VALUES (960, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:12:41', 2);
INSERT INTO `login_log` VALUES (961, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:14:22', 3);
INSERT INTO `login_log` VALUES (962, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:14:24', 2);
INSERT INTO `login_log` VALUES (963, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:14:26', 2);
INSERT INTO `login_log` VALUES (964, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:16:01', 4);
INSERT INTO `login_log` VALUES (965, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:16:11', 5);
INSERT INTO `login_log` VALUES (966, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:16:14', 2);
INSERT INTO `login_log` VALUES (967, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:21:05', 23);
INSERT INTO `login_log` VALUES (968, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:23:03', 3805);
INSERT INTO `login_log` VALUES (969, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:26:14', 2842);
INSERT INTO `login_log` VALUES (970, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:26:22', 3);
INSERT INTO `login_log` VALUES (971, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:27:20', 1002);
INSERT INTO `login_log` VALUES (972, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:27:45', 4);
INSERT INTO `login_log` VALUES (973, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:41:07', 4);
INSERT INTO `login_log` VALUES (974, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:41:19', 21);
INSERT INTO `login_log` VALUES (975, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:41:29', 4890);
INSERT INTO `login_log` VALUES (976, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:41:37', 3079);
INSERT INTO `login_log` VALUES (977, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 18:41:56', 13);
INSERT INTO `login_log` VALUES (978, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:41:56', 47);
INSERT INTO `login_log` VALUES (979, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 18:51:21', 6);
INSERT INTO `login_log` VALUES (980, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 18:52:00', 3970);
INSERT INTO `login_log` VALUES (981, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:03:20', 9);
INSERT INTO `login_log` VALUES (982, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 23:17:15', 2020);
INSERT INTO `login_log` VALUES (983, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:31:05', 4);
INSERT INTO `login_log` VALUES (984, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:31:05', 5);
INSERT INTO `login_log` VALUES (985, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:42:33', 5);
INSERT INTO `login_log` VALUES (986, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:42:53', 5);
INSERT INTO `login_log` VALUES (987, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:42:59', 4);
INSERT INTO `login_log` VALUES (988, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:42:59', 5);
INSERT INTO `login_log` VALUES (989, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:43:50', 6);
INSERT INTO `login_log` VALUES (990, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-03 23:43:54', 88);
INSERT INTO `login_log` VALUES (991, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:45:06', 3);
INSERT INTO `login_log` VALUES (992, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:45:06', 7);
INSERT INTO `login_log` VALUES (993, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:45:15', 4);
INSERT INTO `login_log` VALUES (994, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:45:15', 5);
INSERT INTO `login_log` VALUES (995, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-03 23:46:50', 16);
INSERT INTO `login_log` VALUES (996, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:46:50', 4);
INSERT INTO `login_log` VALUES (997, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-03 23:46:52', 1731);
INSERT INTO `login_log` VALUES (998, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:46:56', 3);
INSERT INTO `login_log` VALUES (999, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:47:00', 6);
INSERT INTO `login_log` VALUES (1000, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:47:00', 3);
INSERT INTO `login_log` VALUES (1001, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:49:05', 4);
INSERT INTO `login_log` VALUES (1002, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:49:05', 6);
INSERT INTO `login_log` VALUES (1003, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:49:30', 3);
INSERT INTO `login_log` VALUES (1004, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:49:30', 5);
INSERT INTO `login_log` VALUES (1005, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-03 23:50:13', 4);
INSERT INTO `login_log` VALUES (1006, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-03 23:50:13', 5);
INSERT INTO `login_log` VALUES (1007, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-10-04 02:16:15', 18);
INSERT INTO `login_log` VALUES (1008, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-10-04 02:20:44', 12);
INSERT INTO `login_log` VALUES (1009, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-10-04 02:21:42', 7472);
INSERT INTO `login_log` VALUES (1010, '0:0:0:0:0:0:0:1', '/api/common/login', 'anonymousUser', '2021-10-04 02:26:40', 548);
INSERT INTO `login_log` VALUES (1011, '0:0:0:0:0:0:0:1', '/api/user/enum/status', 'admin', '2021-10-04 02:56:17', 3068);
INSERT INTO `login_log` VALUES (1012, '0:0:0:0:0:0:0:1', '/api/user/enum/status', 'admin', '2021-10-04 02:56:48', 20811);
INSERT INTO `login_log` VALUES (1013, '0:0:0:0:0:0:0:1', '/api/user/enum/status', 'admin', '2021-10-04 02:57:28', 6747);
INSERT INTO `login_log` VALUES (1014, '0:0:0:0:0:0:0:1', '/api/user/enum/status', 'admin', '2021-10-04 03:04:38', 4);
INSERT INTO `login_log` VALUES (1015, '0:0:0:0:0:0:0:1', '/api/user/enum/status', 'admin', '2021-10-04 20:28:13', 4);
INSERT INTO `login_log` VALUES (1016, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-04 23:31:41', 86);
INSERT INTO `login_log` VALUES (1017, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-04 23:31:43', 2272);
INSERT INTO `login_log` VALUES (1018, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-04 23:31:45', 100);
INSERT INTO `login_log` VALUES (1019, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-04 23:56:09', 3);
INSERT INTO `login_log` VALUES (1020, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-04 23:56:09', 6);
INSERT INTO `login_log` VALUES (1021, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 00:01:13', 4);
INSERT INTO `login_log` VALUES (1022, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 00:01:13', 7);
INSERT INTO `login_log` VALUES (1023, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 00:01:42', 3);
INSERT INTO `login_log` VALUES (1024, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 00:01:42', 6);
INSERT INTO `login_log` VALUES (1025, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 00:04:34', 5);
INSERT INTO `login_log` VALUES (1026, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 00:04:34', 8);
INSERT INTO `login_log` VALUES (1027, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 00:17:39', 4);
INSERT INTO `login_log` VALUES (1028, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 00:17:39', 7);
INSERT INTO `login_log` VALUES (1029, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:19:20', 16);
INSERT INTO `login_log` VALUES (1030, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:19:35', 2);
INSERT INTO `login_log` VALUES (1031, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:21:23', 3);
INSERT INTO `login_log` VALUES (1032, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:21:25', 2);
INSERT INTO `login_log` VALUES (1033, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 02:29:37', 7);
INSERT INTO `login_log` VALUES (1034, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 02:29:37', 7);
INSERT INTO `login_log` VALUES (1035, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:31:03', 1);
INSERT INTO `login_log` VALUES (1036, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:33:51', 2);
INSERT INTO `login_log` VALUES (1037, '127.0.0.1', '/api/user/enum/role', 'admin', '2021-10-05 02:33:54', 1);
INSERT INTO `login_log` VALUES (1038, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 02:55:24', 98);
INSERT INTO `login_log` VALUES (1039, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 02:55:24', 5);
INSERT INTO `login_log` VALUES (1040, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 02:56:09', 189);
INSERT INTO `login_log` VALUES (1041, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 02:56:09', 5);
INSERT INTO `login_log` VALUES (1042, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:05:27', 38);
INSERT INTO `login_log` VALUES (1043, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:05:30', 4);
INSERT INTO `login_log` VALUES (1044, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:05:53', 2);
INSERT INTO `login_log` VALUES (1045, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:15:35', 3);
INSERT INTO `login_log` VALUES (1046, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:15:36', 5);
INSERT INTO `login_log` VALUES (1047, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:15:39', 2);
INSERT INTO `login_log` VALUES (1048, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:15:39', 7);
INSERT INTO `login_log` VALUES (1049, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:15:41', 3);
INSERT INTO `login_log` VALUES (1050, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:15:43', 3);
INSERT INTO `login_log` VALUES (1051, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:16:56', 3);
INSERT INTO `login_log` VALUES (1052, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:16:56', 4);
INSERT INTO `login_log` VALUES (1053, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:16:57', 3);
INSERT INTO `login_log` VALUES (1054, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-05 04:17:15', 151);
INSERT INTO `login_log` VALUES (1055, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:17:15', 5);
INSERT INTO `login_log` VALUES (1056, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 04:25:37', 6);
INSERT INTO `login_log` VALUES (1057, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:27:44', 4);
INSERT INTO `login_log` VALUES (1058, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:27:44', 6);
INSERT INTO `login_log` VALUES (1059, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 04:30:48', 33828);
INSERT INTO `login_log` VALUES (1060, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:30:57', 16);
INSERT INTO `login_log` VALUES (1061, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:30:57', 47);
INSERT INTO `login_log` VALUES (1062, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 04:31:32', 3017);
INSERT INTO `login_log` VALUES (1063, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:43:04', 14);
INSERT INTO `login_log` VALUES (1064, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:43:04', 39);
INSERT INTO `login_log` VALUES (1065, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 04:43:18', 5772);
INSERT INTO `login_log` VALUES (1066, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:43:18', 5);
INSERT INTO `login_log` VALUES (1067, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:43:29', 5);
INSERT INTO `login_log` VALUES (1068, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 04:43:38', 2728);
INSERT INTO `login_log` VALUES (1069, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:43:38', 6);
INSERT INTO `login_log` VALUES (1070, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 04:43:46', 2222);
INSERT INTO `login_log` VALUES (1071, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:50:20', 15);
INSERT INTO `login_log` VALUES (1072, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:50:20', 17);
INSERT INTO `login_log` VALUES (1073, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 04:50:23', 69);
INSERT INTO `login_log` VALUES (1074, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 04:51:18', 104);
INSERT INTO `login_log` VALUES (1075, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:51:19', 4);
INSERT INTO `login_log` VALUES (1076, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 04:53:59', 4);
INSERT INTO `login_log` VALUES (1077, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 04:58:06', 3);
INSERT INTO `login_log` VALUES (1078, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:14:17', 4);
INSERT INTO `login_log` VALUES (1079, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 05:14:20', 48);
INSERT INTO `login_log` VALUES (1080, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:15:15', 7);
INSERT INTO `login_log` VALUES (1081, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 05:15:23', 109);
INSERT INTO `login_log` VALUES (1082, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:15:23', 4);
INSERT INTO `login_log` VALUES (1083, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:15:47', 4);
INSERT INTO `login_log` VALUES (1084, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:15:47', 6);
INSERT INTO `login_log` VALUES (1085, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:16:16', 6);
INSERT INTO `login_log` VALUES (1086, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:16:28', 5);
INSERT INTO `login_log` VALUES (1087, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:16:32', 3);
INSERT INTO `login_log` VALUES (1088, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:16:32', 3);
INSERT INTO `login_log` VALUES (1089, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:16:56', 3);
INSERT INTO `login_log` VALUES (1090, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:17:00', 7);
INSERT INTO `login_log` VALUES (1091, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:17:00', 3);
INSERT INTO `login_log` VALUES (1092, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:20:16', 3);
INSERT INTO `login_log` VALUES (1093, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:20:16', 4);
INSERT INTO `login_log` VALUES (1094, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:21:49', 4);
INSERT INTO `login_log` VALUES (1095, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:22:05', 3);
INSERT INTO `login_log` VALUES (1096, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:27:42', 4);
INSERT INTO `login_log` VALUES (1097, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:27:42', 3);
INSERT INTO `login_log` VALUES (1098, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:27:59', 3);
INSERT INTO `login_log` VALUES (1099, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:29:20', 2);
INSERT INTO `login_log` VALUES (1100, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:29:20', 4);
INSERT INTO `login_log` VALUES (1101, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:29:24', 2);
INSERT INTO `login_log` VALUES (1102, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:29:24', 5);
INSERT INTO `login_log` VALUES (1103, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:30:03', 3);
INSERT INTO `login_log` VALUES (1104, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:30:03', 5);
INSERT INTO `login_log` VALUES (1105, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:30:53', 3);
INSERT INTO `login_log` VALUES (1106, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:30:53', 5);
INSERT INTO `login_log` VALUES (1107, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 05:31:02', 133);
INSERT INTO `login_log` VALUES (1108, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 05:34:34', 980);
INSERT INTO `login_log` VALUES (1109, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:34:35', 4);
INSERT INTO `login_log` VALUES (1110, '127.0.0.1', '/api/admin/removeByUsername', 'admin', '2021-10-05 05:34:39', 670);
INSERT INTO `login_log` VALUES (1111, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:38:51', 4);
INSERT INTO `login_log` VALUES (1112, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:38:51', 9);
INSERT INTO `login_log` VALUES (1113, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:41:31', 5);
INSERT INTO `login_log` VALUES (1114, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 05:41:44', 3);
INSERT INTO `login_log` VALUES (1115, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 05:41:44', 5);
INSERT INTO `login_log` VALUES (1116, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 05:41:50', 9);
INSERT INTO `login_log` VALUES (1117, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 05:41:52', 2);
INSERT INTO `login_log` VALUES (1118, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 15:32:12', 41);
INSERT INTO `login_log` VALUES (1119, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 15:32:14', 2031);
INSERT INTO `login_log` VALUES (1120, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:32:17', 75);
INSERT INTO `login_log` VALUES (1121, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 15:33:37', 6);
INSERT INTO `login_log` VALUES (1122, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:33:37', 7);
INSERT INTO `login_log` VALUES (1123, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 15:36:30', 4);
INSERT INTO `login_log` VALUES (1124, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:36:30', 8);
INSERT INTO `login_log` VALUES (1125, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 15:38:08', 4);
INSERT INTO `login_log` VALUES (1126, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:38:08', 6);
INSERT INTO `login_log` VALUES (1127, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 15:56:36', 4);
INSERT INTO `login_log` VALUES (1128, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:56:36', 6);
INSERT INTO `login_log` VALUES (1129, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:57:19', 7);
INSERT INTO `login_log` VALUES (1130, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 15:57:46', 8);
INSERT INTO `login_log` VALUES (1131, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:08:52', 8);
INSERT INTO `login_log` VALUES (1132, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:15:44', 12);
INSERT INTO `login_log` VALUES (1133, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:15:44', 33);
INSERT INTO `login_log` VALUES (1134, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:15:55', 5);
INSERT INTO `login_log` VALUES (1135, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:15:58', 2);
INSERT INTO `login_log` VALUES (1136, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:16:05', 2);
INSERT INTO `login_log` VALUES (1137, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:17:43', 2);
INSERT INTO `login_log` VALUES (1138, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:18:01', 2);
INSERT INTO `login_log` VALUES (1139, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:18:04', 23);
INSERT INTO `login_log` VALUES (1140, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:18:29', 4);
INSERT INTO `login_log` VALUES (1141, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:18:32', 2);
INSERT INTO `login_log` VALUES (1142, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:18:33', 2);
INSERT INTO `login_log` VALUES (1143, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:19:10', 3);
INSERT INTO `login_log` VALUES (1144, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:19:13', 1);
INSERT INTO `login_log` VALUES (1145, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:22', 2);
INSERT INTO `login_log` VALUES (1146, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:24', 1);
INSERT INTO `login_log` VALUES (1147, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:25', 3);
INSERT INTO `login_log` VALUES (1148, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:27', 2);
INSERT INTO `login_log` VALUES (1149, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:31', 3);
INSERT INTO `login_log` VALUES (1150, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:34', 2);
INSERT INTO `login_log` VALUES (1151, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:35', 2);
INSERT INTO `login_log` VALUES (1152, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:19:38', 2);
INSERT INTO `login_log` VALUES (1153, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:20:12', 4);
INSERT INTO `login_log` VALUES (1154, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:20:12', 6);
INSERT INTO `login_log` VALUES (1155, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:09', 3);
INSERT INTO `login_log` VALUES (1156, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:10', 1);
INSERT INTO `login_log` VALUES (1157, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:14', 3);
INSERT INTO `login_log` VALUES (1158, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:15', 1);
INSERT INTO `login_log` VALUES (1159, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:18', 1);
INSERT INTO `login_log` VALUES (1160, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:19', 1);
INSERT INTO `login_log` VALUES (1161, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:22', 1);
INSERT INTO `login_log` VALUES (1162, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:25', 1);
INSERT INTO `login_log` VALUES (1163, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-05 16:22:27', 1);
INSERT INTO `login_log` VALUES (1164, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:24:06', 3);
INSERT INTO `login_log` VALUES (1165, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:24:06', 9);
INSERT INTO `login_log` VALUES (1166, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:12', 1);
INSERT INTO `login_log` VALUES (1167, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:15', 1);
INSERT INTO `login_log` VALUES (1168, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:19', 1);
INSERT INTO `login_log` VALUES (1169, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:21', 1);
INSERT INTO `login_log` VALUES (1170, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:23', 2);
INSERT INTO `login_log` VALUES (1171, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 16:24:25', 1);
INSERT INTO `login_log` VALUES (1172, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:29:58', 12);
INSERT INTO `login_log` VALUES (1173, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:30:27', 6);
INSERT INTO `login_log` VALUES (1174, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-05 16:30:32', 6);
INSERT INTO `login_log` VALUES (1175, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:30:47', 4);
INSERT INTO `login_log` VALUES (1176, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-05 16:30:50', 2);
INSERT INTO `login_log` VALUES (1177, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-05 16:30:52', 1);
INSERT INTO `login_log` VALUES (1178, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:33:25', 81);
INSERT INTO `login_log` VALUES (1179, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:33:25', 2);
INSERT INTO `login_log` VALUES (1180, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:33:29', 95);
INSERT INTO `login_log` VALUES (1181, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:33:29', 5);
INSERT INTO `login_log` VALUES (1182, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:33:32', 61);
INSERT INTO `login_log` VALUES (1183, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:33:32', 3);
INSERT INTO `login_log` VALUES (1184, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:33:36', 90);
INSERT INTO `login_log` VALUES (1185, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:33:36', 4);
INSERT INTO `login_log` VALUES (1186, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:33:41', 1312);
INSERT INTO `login_log` VALUES (1187, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:33:41', 6);
INSERT INTO `login_log` VALUES (1188, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:34:03', 128);
INSERT INTO `login_log` VALUES (1189, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:34:03', 7);
INSERT INTO `login_log` VALUES (1190, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:34:24', 98);
INSERT INTO `login_log` VALUES (1191, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:34:24', 4);
INSERT INTO `login_log` VALUES (1192, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:34:27', 98);
INSERT INTO `login_log` VALUES (1193, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:34:27', 4);
INSERT INTO `login_log` VALUES (1194, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:34:33', 79);
INSERT INTO `login_log` VALUES (1195, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:34:33', 5);
INSERT INTO `login_log` VALUES (1196, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 16:34:38', 100);
INSERT INTO `login_log` VALUES (1197, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:34:38', 8);
INSERT INTO `login_log` VALUES (1198, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:35:35', 5);
INSERT INTO `login_log` VALUES (1199, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:35:38', 3);
INSERT INTO `login_log` VALUES (1200, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:36:43', 4);
INSERT INTO `login_log` VALUES (1201, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:37:13', 3);
INSERT INTO `login_log` VALUES (1202, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:37:27', 5);
INSERT INTO `login_log` VALUES (1203, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:37:28', 6);
INSERT INTO `login_log` VALUES (1204, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:38:05', 2);
INSERT INTO `login_log` VALUES (1205, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:38:07', 5);
INSERT INTO `login_log` VALUES (1206, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:38:19', 2);
INSERT INTO `login_log` VALUES (1207, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:38:19', 6);
INSERT INTO `login_log` VALUES (1208, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:42:38', 3);
INSERT INTO `login_log` VALUES (1209, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:42:39', 6);
INSERT INTO `login_log` VALUES (1210, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 16:43:04', 3);
INSERT INTO `login_log` VALUES (1211, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:43:04', 5);
INSERT INTO `login_log` VALUES (1212, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:43:16', 3);
INSERT INTO `login_log` VALUES (1213, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:43:20', 4);
INSERT INTO `login_log` VALUES (1214, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:43:24', 4);
INSERT INTO `login_log` VALUES (1215, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:43:30', 2);
INSERT INTO `login_log` VALUES (1216, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 16:45:33', 6);
INSERT INTO `login_log` VALUES (1217, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:03:37', 5);
INSERT INTO `login_log` VALUES (1218, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:04:06', 4);
INSERT INTO `login_log` VALUES (1219, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:04:40', 4589);
INSERT INTO `login_log` VALUES (1220, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:04:45', 1883);
INSERT INTO `login_log` VALUES (1221, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:04:50', 1735);
INSERT INTO `login_log` VALUES (1222, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:04:57', 3);
INSERT INTO `login_log` VALUES (1223, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:06:33', 3);
INSERT INTO `login_log` VALUES (1224, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:06:37', 4);
INSERT INTO `login_log` VALUES (1225, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:06:37', 4);
INSERT INTO `login_log` VALUES (1226, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:06:48', 6);
INSERT INTO `login_log` VALUES (1227, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:07:29', 3);
INSERT INTO `login_log` VALUES (1228, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:08:46', 5);
INSERT INTO `login_log` VALUES (1229, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:09:25', 5);
INSERT INTO `login_log` VALUES (1230, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:09:29', 3);
INSERT INTO `login_log` VALUES (1231, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:09:32', 2);
INSERT INTO `login_log` VALUES (1232, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:09:52', 4);
INSERT INTO `login_log` VALUES (1233, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:09:54', 3);
INSERT INTO `login_log` VALUES (1234, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:11:26', 2);
INSERT INTO `login_log` VALUES (1235, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:11:26', 5);
INSERT INTO `login_log` VALUES (1236, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:11:29', 3);
INSERT INTO `login_log` VALUES (1237, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:11:33', 4);
INSERT INTO `login_log` VALUES (1238, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:12:19', 4);
INSERT INTO `login_log` VALUES (1239, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:12:31', 5);
INSERT INTO `login_log` VALUES (1240, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:12:34', 3);
INSERT INTO `login_log` VALUES (1241, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:12:49', 3);
INSERT INTO `login_log` VALUES (1242, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:15:54', 3);
INSERT INTO `login_log` VALUES (1243, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:18:04', 83341);
INSERT INTO `login_log` VALUES (1244, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:18:09', 2);
INSERT INTO `login_log` VALUES (1245, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:18:09', 4);
INSERT INTO `login_log` VALUES (1246, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:18:55', 4);
INSERT INTO `login_log` VALUES (1247, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:19:01', 3);
INSERT INTO `login_log` VALUES (1248, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:19:03', 4);
INSERT INTO `login_log` VALUES (1249, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:19:12', 4);
INSERT INTO `login_log` VALUES (1250, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-05 17:20:05', 2);
INSERT INTO `login_log` VALUES (1251, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:20:06', 9);
INSERT INTO `login_log` VALUES (1252, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:20:12', 3);
INSERT INTO `login_log` VALUES (1253, '127.0.0.1', '/api/admin/register', 'admin', '2021-10-05 17:20:31', 135);
INSERT INTO `login_log` VALUES (1254, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:20:31', 2);
INSERT INTO `login_log` VALUES (1255, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:20:33', 5);
INSERT INTO `login_log` VALUES (1256, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:20:34', 3);
INSERT INTO `login_log` VALUES (1257, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:22:35', 1685);
INSERT INTO `login_log` VALUES (1258, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:22:37', 4);
INSERT INTO `login_log` VALUES (1259, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:22:41', 1173);
INSERT INTO `login_log` VALUES (1260, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:22:43', 3);
INSERT INTO `login_log` VALUES (1261, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:22:57', 1227);
INSERT INTO `login_log` VALUES (1262, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:22:58', 4);
INSERT INTO `login_log` VALUES (1263, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:23:01', 1211);
INSERT INTO `login_log` VALUES (1264, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:23:03', 4);
INSERT INTO `login_log` VALUES (1265, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:23:07', 1176);
INSERT INTO `login_log` VALUES (1266, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:23:14', 4);
INSERT INTO `login_log` VALUES (1267, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:23:32', 1203);
INSERT INTO `login_log` VALUES (1268, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:23:35', 3);
INSERT INTO `login_log` VALUES (1269, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:23:54', 4);
INSERT INTO `login_log` VALUES (1270, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:23:57', 1172);
INSERT INTO `login_log` VALUES (1271, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:24:02', 4);
INSERT INTO `login_log` VALUES (1272, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:24:05', 1163);
INSERT INTO `login_log` VALUES (1273, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:24:22', 1190);
INSERT INTO `login_log` VALUES (1274, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:24:39', 5);
INSERT INTO `login_log` VALUES (1275, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 17:24:41', 1166);
INSERT INTO `login_log` VALUES (1276, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:24:44', 4);
INSERT INTO `login_log` VALUES (1277, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:24:49', 2);
INSERT INTO `login_log` VALUES (1278, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:29:09', 3);
INSERT INTO `login_log` VALUES (1279, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:29:09', 5);
INSERT INTO `login_log` VALUES (1280, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:29:56', 4);
INSERT INTO `login_log` VALUES (1281, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:30:03', 3);
INSERT INTO `login_log` VALUES (1282, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:30:05', 1);
INSERT INTO `login_log` VALUES (1283, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:31:14', 2);
INSERT INTO `login_log` VALUES (1284, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:31:22', 2);
INSERT INTO `login_log` VALUES (1285, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:32:38', 2);
INSERT INTO `login_log` VALUES (1286, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:32:52', 5758);
INSERT INTO `login_log` VALUES (1287, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:56:22', 13);
INSERT INTO `login_log` VALUES (1288, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:56:22', 12);
INSERT INTO `login_log` VALUES (1289, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:56:26', 2);
INSERT INTO `login_log` VALUES (1290, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:56:26', 5);
INSERT INTO `login_log` VALUES (1291, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:56:41', 2);
INSERT INTO `login_log` VALUES (1292, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:56:41', 4);
INSERT INTO `login_log` VALUES (1293, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 17:57:04', 2);
INSERT INTO `login_log` VALUES (1294, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 17:57:04', 4);
INSERT INTO `login_log` VALUES (1295, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 17:57:15', 2);
INSERT INTO `login_log` VALUES (1296, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 17:57:19', 1);
INSERT INTO `login_log` VALUES (1297, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 17:57:22', 2);
INSERT INTO `login_log` VALUES (1298, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 17:57:28', 2);
INSERT INTO `login_log` VALUES (1299, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 18:01:24', 2);
INSERT INTO `login_log` VALUES (1300, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 18:03:29', 1);
INSERT INTO `login_log` VALUES (1301, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-05 18:03:39', 1172);
INSERT INTO `login_log` VALUES (1302, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 18:03:55', 3);
INSERT INTO `login_log` VALUES (1303, '127.0.0.1', '/api/user/info/getUserInfoByUsername', 'admin', '2021-10-05 18:04:33', 2);
INSERT INTO `login_log` VALUES (1304, '127.0.0.1', '/api/user/info/modifyUserInfo', 'admin', '2021-10-05 18:04:44', 158);
INSERT INTO `login_log` VALUES (1305, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 18:04:44', 3);
INSERT INTO `login_log` VALUES (1306, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 18:07:41', 2);
INSERT INTO `login_log` VALUES (1307, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 18:07:41', 3);
INSERT INTO `login_log` VALUES (1308, '127.0.0.1', '/api/user/info/getUserInfo', 'admin', '2021-10-05 18:11:24', 4);
INSERT INTO `login_log` VALUES (1309, '127.0.0.1', '/api/user/info/userInfoByCond', 'admin', '2021-10-05 18:11:24', 4);
INSERT INTO `login_log` VALUES (1310, '127.0.0.1', '/api/admin/reloadRoleResource', 'admin', '2021-10-05 18:11:27', 542);
INSERT INTO `login_log` VALUES (1311, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 00:06:26', 1230);
INSERT INTO `login_log` VALUES (1312, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:06:33', 18);
INSERT INTO `login_log` VALUES (1313, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:06:38', 5);
INSERT INTO `login_log` VALUES (1314, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:06:40', 5);
INSERT INTO `login_log` VALUES (1315, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:06:44', 5);
INSERT INTO `login_log` VALUES (1316, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 00:06:51', 6);
INSERT INTO `login_log` VALUES (1317, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 00:06:53', 2);
INSERT INTO `login_log` VALUES (1318, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 00:07:01', 2);
INSERT INTO `login_log` VALUES (1319, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:07:02', 8);
INSERT INTO `login_log` VALUES (1320, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 00:07:06', 7);
INSERT INTO `login_log` VALUES (1321, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:02:58', 1735);
INSERT INTO `login_log` VALUES (1322, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-07 01:10:38', 18);
INSERT INTO `login_log` VALUES (1323, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:10:39', 17);
INSERT INTO `login_log` VALUES (1324, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:10:40', 1239);
INSERT INTO `login_log` VALUES (1325, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:14:00', 1207);
INSERT INTO `login_log` VALUES (1326, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:16:24', 4);
INSERT INTO `login_log` VALUES (1327, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:16:25', 1219);
INSERT INTO `login_log` VALUES (1328, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:19:07', 6);
INSERT INTO `login_log` VALUES (1329, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:19:08', 1233);
INSERT INTO `login_log` VALUES (1330, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:19:47', 5);
INSERT INTO `login_log` VALUES (1331, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:19:49', 1234);
INSERT INTO `login_log` VALUES (1332, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:22:32', 4);
INSERT INTO `login_log` VALUES (1333, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:22:38', 5);
INSERT INTO `login_log` VALUES (1334, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:23:22', 4);
INSERT INTO `login_log` VALUES (1335, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:23:31', 4);
INSERT INTO `login_log` VALUES (1336, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:23:51', 4);
INSERT INTO `login_log` VALUES (1337, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:24:10', 2);
INSERT INTO `login_log` VALUES (1338, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:24:33', 3);
INSERT INTO `login_log` VALUES (1339, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 01:25:52', 44);
INSERT INTO `login_log` VALUES (1340, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 01:25:55', 7);
INSERT INTO `login_log` VALUES (1341, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:26:02', 1198);
INSERT INTO `login_log` VALUES (1342, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:29:22', 1226);
INSERT INTO `login_log` VALUES (1343, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:31:35', 1232);
INSERT INTO `login_log` VALUES (1344, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:33:39', 6);
INSERT INTO `login_log` VALUES (1345, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:33:41', 1272);
INSERT INTO `login_log` VALUES (1346, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:37:00', 1192);
INSERT INTO `login_log` VALUES (1347, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:39:29', 4);
INSERT INTO `login_log` VALUES (1348, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:39:30', 1243);
INSERT INTO `login_log` VALUES (1349, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:39:37', 5);
INSERT INTO `login_log` VALUES (1350, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:39:38', 1197);
INSERT INTO `login_log` VALUES (1351, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-07 01:40:31', 4);
INSERT INTO `login_log` VALUES (1352, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:40:32', 3);
INSERT INTO `login_log` VALUES (1353, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:40:33', 1202);
INSERT INTO `login_log` VALUES (1354, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:40:36', 4);
INSERT INTO `login_log` VALUES (1355, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:40:37', 1221);
INSERT INTO `login_log` VALUES (1356, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:41:12', 1189);
INSERT INTO `login_log` VALUES (1357, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:41:15', 3);
INSERT INTO `login_log` VALUES (1358, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 01:41:29', 4);
INSERT INTO `login_log` VALUES (1359, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:42:12', 5);
INSERT INTO `login_log` VALUES (1360, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:42:13', 1232);
INSERT INTO `login_log` VALUES (1361, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:42:52', 3);
INSERT INTO `login_log` VALUES (1362, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:42:54', 1210);
INSERT INTO `login_log` VALUES (1363, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:42:55', 3);
INSERT INTO `login_log` VALUES (1364, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:42:56', 1193);
INSERT INTO `login_log` VALUES (1365, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:43:06', 4);
INSERT INTO `login_log` VALUES (1366, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:43:07', 1226);
INSERT INTO `login_log` VALUES (1367, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:43:10', 3);
INSERT INTO `login_log` VALUES (1368, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:43:12', 1210);
INSERT INTO `login_log` VALUES (1369, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:44:03', 3);
INSERT INTO `login_log` VALUES (1370, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:44:04', 1237);
INSERT INTO `login_log` VALUES (1371, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:45:09', 4);
INSERT INTO `login_log` VALUES (1372, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:45:10', 1224);
INSERT INTO `login_log` VALUES (1373, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:45:56', 4);
INSERT INTO `login_log` VALUES (1374, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:45:57', 1209);
INSERT INTO `login_log` VALUES (1375, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:47:30', 2);
INSERT INTO `login_log` VALUES (1376, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:47:31', 1196);
INSERT INTO `login_log` VALUES (1377, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:48:15', 1223);
INSERT INTO `login_log` VALUES (1378, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:48:26', 3);
INSERT INTO `login_log` VALUES (1379, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:48:27', 1208);
INSERT INTO `login_log` VALUES (1380, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:50:56', 3);
INSERT INTO `login_log` VALUES (1381, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:50:57', 1262);
INSERT INTO `login_log` VALUES (1382, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-07 01:51:10', 2);
INSERT INTO `login_log` VALUES (1383, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:51:10', 4);
INSERT INTO `login_log` VALUES (1384, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 01:51:11', 1202);
INSERT INTO `login_log` VALUES (1385, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 01:51:18', 3);
INSERT INTO `login_log` VALUES (1386, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 01:56:35', 4);
INSERT INTO `login_log` VALUES (1387, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 01:57:43', 5);
INSERT INTO `login_log` VALUES (1388, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:01:22', 6);
INSERT INTO `login_log` VALUES (1389, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:09:42', 8);
INSERT INTO `login_log` VALUES (1390, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 02:11:43', 12796);
INSERT INTO `login_log` VALUES (1391, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 02:12:24', 2);
INSERT INTO `login_log` VALUES (1392, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 02:12:26', 2);
INSERT INTO `login_log` VALUES (1393, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:12:28', 13);
INSERT INTO `login_log` VALUES (1394, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:12:30', 4);
INSERT INTO `login_log` VALUES (1395, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:14:02', 1);
INSERT INTO `login_log` VALUES (1396, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:14:23', 1);
INSERT INTO `login_log` VALUES (1397, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:14:26', 2);
INSERT INTO `login_log` VALUES (1398, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:14:29', 2);
INSERT INTO `login_log` VALUES (1399, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:14:30', 1);
INSERT INTO `login_log` VALUES (1400, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:17:13', 7);
INSERT INTO `login_log` VALUES (1401, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:18:05', 7);
INSERT INTO `login_log` VALUES (1402, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:18:05', 10);
INSERT INTO `login_log` VALUES (1403, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-07 02:18:10', 2);
INSERT INTO `login_log` VALUES (1404, '127.0.0.1', '/api/user/enum/name', 'admin', '2021-10-07 02:18:21', 2);
INSERT INTO `login_log` VALUES (1405, '127.0.0.1', '/api/user/enum/major', 'admin', '2021-10-07 02:18:26', 2);
INSERT INTO `login_log` VALUES (1406, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:19:09', 5);
INSERT INTO `login_log` VALUES (1407, '127.0.0.1', '/api/user/enum/username', 'admin', '2021-10-07 02:19:14', 2);
INSERT INTO `login_log` VALUES (1408, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:19:17', 6);
INSERT INTO `login_log` VALUES (1409, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:19:19', 4);
INSERT INTO `login_log` VALUES (1410, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:22:46', 4);
INSERT INTO `login_log` VALUES (1411, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:22:46', 7);
INSERT INTO `login_log` VALUES (1412, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:23:28', 4);
INSERT INTO `login_log` VALUES (1413, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:28:46', 3);
INSERT INTO `login_log` VALUES (1414, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:28:46', 6);
INSERT INTO `login_log` VALUES (1415, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:39:39', 5);
INSERT INTO `login_log` VALUES (1416, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:39:57', 6);
INSERT INTO `login_log` VALUES (1417, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:40:30', 6);
INSERT INTO `login_log` VALUES (1418, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:40:41', 9);
INSERT INTO `login_log` VALUES (1419, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:41:39', 5);
INSERT INTO `login_log` VALUES (1420, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:41:49', 6);
INSERT INTO `login_log` VALUES (1421, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:42:30', 6);
INSERT INTO `login_log` VALUES (1422, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:43:55', 6);
INSERT INTO `login_log` VALUES (1423, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:44:12', 7);
INSERT INTO `login_log` VALUES (1424, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:44:23', 6);
INSERT INTO `login_log` VALUES (1425, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:44:54', 6);
INSERT INTO `login_log` VALUES (1426, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:45:06', 4);
INSERT INTO `login_log` VALUES (1427, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:45:13', 6);
INSERT INTO `login_log` VALUES (1428, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:51:52', 3);
INSERT INTO `login_log` VALUES (1429, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:51:52', 4);
INSERT INTO `login_log` VALUES (1430, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:51:55', 4);
INSERT INTO `login_log` VALUES (1431, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:51:58', 5);
INSERT INTO `login_log` VALUES (1432, '127.0.0.1', '/api/admin/user/cancel', 'admin', '2021-10-07 02:52:00', 57);
INSERT INTO `login_log` VALUES (1433, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:52:08', 3);
INSERT INTO `login_log` VALUES (1434, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:52:08', 5);
INSERT INTO `login_log` VALUES (1435, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:52:10', 3);
INSERT INTO `login_log` VALUES (1436, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:52:12', 3);
INSERT INTO `login_log` VALUES (1437, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:58:01', 4);
INSERT INTO `login_log` VALUES (1438, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 02:59:21', 3);
INSERT INTO `login_log` VALUES (1439, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:59:21', 6);
INSERT INTO `login_log` VALUES (1440, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 02:59:29', 3);
INSERT INTO `login_log` VALUES (1441, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:02:01', 3);
INSERT INTO `login_log` VALUES (1442, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 03:02:03', 1244);
INSERT INTO `login_log` VALUES (1443, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:02:04', 4);
INSERT INTO `login_log` VALUES (1444, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:02:06', 4);
INSERT INTO `login_log` VALUES (1445, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:03:24', 3);
INSERT INTO `login_log` VALUES (1446, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:03:29', 5);
INSERT INTO `login_log` VALUES (1447, '127.0.0.1', '/api/admin/user/cancel', 'admin', '2021-10-07 03:03:33', 88);
INSERT INTO `login_log` VALUES (1448, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:03:38', 4);
INSERT INTO `login_log` VALUES (1449, '127.0.0.1', '/api/admin/user/cancel', 'admin', '2021-10-07 03:03:46', 165);
INSERT INTO `login_log` VALUES (1450, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:04:27', 4);
INSERT INTO `login_log` VALUES (1451, '127.0.0.1', '/api/admin/user/cancel', 'admin', '2021-10-07 03:04:30', 54);
INSERT INTO `login_log` VALUES (1452, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:07:10', 4);
INSERT INTO `login_log` VALUES (1453, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:07:10', 6);
INSERT INTO `login_log` VALUES (1454, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:08:57', 3);
INSERT INTO `login_log` VALUES (1455, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:08:57', 6);
INSERT INTO `login_log` VALUES (1456, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-07 03:11:27', 4);
INSERT INTO `login_log` VALUES (1457, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:13:45', 35);
INSERT INTO `login_log` VALUES (1458, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:14:13', 3);
INSERT INTO `login_log` VALUES (1459, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:14:18', 2);
INSERT INTO `login_log` VALUES (1460, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:14:18', 2);
INSERT INTO `login_log` VALUES (1461, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:15:47', 2);
INSERT INTO `login_log` VALUES (1462, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:15:58', 3);
INSERT INTO `login_log` VALUES (1463, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:16:12', 2);
INSERT INTO `login_log` VALUES (1464, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:16:12', 7);
INSERT INTO `login_log` VALUES (1465, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 03:17:46', 3);
INSERT INTO `login_log` VALUES (1466, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 03:17:46', 2);
INSERT INTO `login_log` VALUES (1467, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 15:12:17', 42);
INSERT INTO `login_log` VALUES (1468, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 15:12:19', 2147);
INSERT INTO `login_log` VALUES (1469, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 15:12:51', 117);
INSERT INTO `login_log` VALUES (1470, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:32:03', 16);
INSERT INTO `login_log` VALUES (1471, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:32:03', 11);
INSERT INTO `login_log` VALUES (1472, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:33:01', 32);
INSERT INTO `login_log` VALUES (1473, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:33:01', 34);
INSERT INTO `login_log` VALUES (1474, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:36:39', 13);
INSERT INTO `login_log` VALUES (1475, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:36:39', 17);
INSERT INTO `login_log` VALUES (1476, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:38:34', 4);
INSERT INTO `login_log` VALUES (1477, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:41:35', 4);
INSERT INTO `login_log` VALUES (1478, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:42:15', 6);
INSERT INTO `login_log` VALUES (1479, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:42:15', 5);
INSERT INTO `login_log` VALUES (1480, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:46:50', 3);
INSERT INTO `login_log` VALUES (1481, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:46:50', 3);
INSERT INTO `login_log` VALUES (1482, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 16:47:44', 3);
INSERT INTO `login_log` VALUES (1483, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:47:44', 4);
INSERT INTO `login_log` VALUES (1484, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:51:31', 4);
INSERT INTO `login_log` VALUES (1485, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 16:58:18', 5);
INSERT INTO `login_log` VALUES (1486, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 17:01:59', 2);
INSERT INTO `login_log` VALUES (1487, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 18:49:45', 4);
INSERT INTO `login_log` VALUES (1488, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 18:49:45', 10);
INSERT INTO `login_log` VALUES (1489, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 18:50:39', 14);
INSERT INTO `login_log` VALUES (1490, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 18:50:39', 20);
INSERT INTO `login_log` VALUES (1491, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 18:53:51', 3);
INSERT INTO `login_log` VALUES (1492, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 18:53:51', 4);
INSERT INTO `login_log` VALUES (1493, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:08:23', 4);
INSERT INTO `login_log` VALUES (1494, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:08:23', 4);
INSERT INTO `login_log` VALUES (1495, '127.0.0.1', '/api/admin/key/add', 'admin', '2021-10-07 19:16:27', 135);
INSERT INTO `login_log` VALUES (1496, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:16:27', 2);
INSERT INTO `login_log` VALUES (1497, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:20:29', 3);
INSERT INTO `login_log` VALUES (1498, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:20:29', 21);
INSERT INTO `login_log` VALUES (1499, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:21:18', 3);
INSERT INTO `login_log` VALUES (1500, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:21:20', 2);
INSERT INTO `login_log` VALUES (1501, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:30:11', 3);
INSERT INTO `login_log` VALUES (1502, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:30:11', 5);
INSERT INTO `login_log` VALUES (1503, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:30:14', 2);
INSERT INTO `login_log` VALUES (1504, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:32:04', 13);
INSERT INTO `login_log` VALUES (1505, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:32:08', 10);
INSERT INTO `login_log` VALUES (1506, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:32:08', 15);
INSERT INTO `login_log` VALUES (1507, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:32:12', 2);
INSERT INTO `login_log` VALUES (1508, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:32:41', 3);
INSERT INTO `login_log` VALUES (1509, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:32:41', 5);
INSERT INTO `login_log` VALUES (1510, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:32:42', 1);
INSERT INTO `login_log` VALUES (1511, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:18', 1);
INSERT INTO `login_log` VALUES (1512, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:19', 1);
INSERT INTO `login_log` VALUES (1513, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:34:22', 2);
INSERT INTO `login_log` VALUES (1514, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:34:22', 7);
INSERT INTO `login_log` VALUES (1515, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:23', 2);
INSERT INTO `login_log` VALUES (1516, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:27', 2);
INSERT INTO `login_log` VALUES (1517, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:29', 1);
INSERT INTO `login_log` VALUES (1518, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 19:34:33', 1);
INSERT INTO `login_log` VALUES (1519, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:40:50', 5);
INSERT INTO `login_log` VALUES (1520, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:40:50', 5);
INSERT INTO `login_log` VALUES (1521, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:41:55', 3);
INSERT INTO `login_log` VALUES (1522, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:41:55', 5);
INSERT INTO `login_log` VALUES (1523, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:42:25', 3);
INSERT INTO `login_log` VALUES (1524, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:42:25', 4);
INSERT INTO `login_log` VALUES (1525, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 19:42:28', 180);
INSERT INTO `login_log` VALUES (1526, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:42:50', 2);
INSERT INTO `login_log` VALUES (1527, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:42:50', 3);
INSERT INTO `login_log` VALUES (1528, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 19:48:25', 14);
INSERT INTO `login_log` VALUES (1529, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 19:48:25', 23);
INSERT INTO `login_log` VALUES (1530, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 19:49:08', 92);
INSERT INTO `login_log` VALUES (1531, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 20:16:00', 12);
INSERT INTO `login_log` VALUES (1532, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 20:16:07', 15);
INSERT INTO `login_log` VALUES (1533, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:16:07', 19);
INSERT INTO `login_log` VALUES (1534, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 20:17:53', 14);
INSERT INTO `login_log` VALUES (1535, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:17:53', 23);
INSERT INTO `login_log` VALUES (1536, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 20:18:18', 13);
INSERT INTO `login_log` VALUES (1537, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 20:18:30', 3667);
INSERT INTO `login_log` VALUES (1538, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 20:18:40', 1742);
INSERT INTO `login_log` VALUES (1539, '127.0.0.1', '/api/admin/key/add', 'admin', '2021-10-07 20:18:47', 137);
INSERT INTO `login_log` VALUES (1540, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:18:47', 58);
INSERT INTO `login_log` VALUES (1541, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 20:20:03', 3196);
INSERT INTO `login_log` VALUES (1542, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:20:39', 4);
INSERT INTO `login_log` VALUES (1543, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 20:20:39', 1718);
INSERT INTO `login_log` VALUES (1544, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-07 20:20:48', 1186);
INSERT INTO `login_log` VALUES (1545, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:20:49', 2);
INSERT INTO `login_log` VALUES (1546, '127.0.0.1', '/api/admin/key/add', 'admin', '2021-10-07 20:20:55', 44);
INSERT INTO `login_log` VALUES (1547, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:20:56', 3);
INSERT INTO `login_log` VALUES (1548, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 20:20:57', 1);
INSERT INTO `login_log` VALUES (1549, '127.0.0.1', '/api/admin/key/change', 'admin', '2021-10-07 20:21:08', 72);
INSERT INTO `login_log` VALUES (1550, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 20:21:08', 3);
INSERT INTO `login_log` VALUES (1551, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 21:41:18', 3);
INSERT INTO `login_log` VALUES (1552, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 21:41:18', 14);
INSERT INTO `login_log` VALUES (1553, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 21:41:26', 1);
INSERT INTO `login_log` VALUES (1554, '127.0.0.1', '/api/admin/key/change', 'admin', '2021-10-07 21:41:28', 58);
INSERT INTO `login_log` VALUES (1555, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 21:41:28', 2);
INSERT INTO `login_log` VALUES (1556, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 21:41:58', 1);
INSERT INTO `login_log` VALUES (1557, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 21:42:01', 1);
INSERT INTO `login_log` VALUES (1558, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 21:42:10', 2);
INSERT INTO `login_log` VALUES (1559, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 21:42:10', 3);
INSERT INTO `login_log` VALUES (1560, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 21:42:12', 1);
INSERT INTO `login_log` VALUES (1561, '127.0.0.1', '/api/admin/key/change', 'admin', '2021-10-07 21:42:13', 57);
INSERT INTO `login_log` VALUES (1562, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 21:42:13', 3);
INSERT INTO `login_log` VALUES (1563, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:03:22', 2);
INSERT INTO `login_log` VALUES (1564, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:03:35', 1);
INSERT INTO `login_log` VALUES (1565, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:03:41', 4);
INSERT INTO `login_log` VALUES (1566, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:03:41', 6);
INSERT INTO `login_log` VALUES (1567, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:03:44', 1);
INSERT INTO `login_log` VALUES (1568, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:03:47', 1);
INSERT INTO `login_log` VALUES (1569, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:12:35', 10);
INSERT INTO `login_log` VALUES (1570, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:12:35', 16);
INSERT INTO `login_log` VALUES (1571, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:14:13', 4);
INSERT INTO `login_log` VALUES (1572, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:14:13', 4);
INSERT INTO `login_log` VALUES (1573, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:17:35', 3);
INSERT INTO `login_log` VALUES (1574, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:17:35', 4);
INSERT INTO `login_log` VALUES (1575, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:20:34', 4);
INSERT INTO `login_log` VALUES (1576, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:20:35', 6);
INSERT INTO `login_log` VALUES (1577, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:20:36', 4);
INSERT INTO `login_log` VALUES (1578, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:20:44', 1);
INSERT INTO `login_log` VALUES (1579, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:21:46', 4);
INSERT INTO `login_log` VALUES (1580, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:21:46', 5);
INSERT INTO `login_log` VALUES (1581, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:21:50', 1);
INSERT INTO `login_log` VALUES (1582, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:21:50', 3);
INSERT INTO `login_log` VALUES (1583, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:22:13', 5);
INSERT INTO `login_log` VALUES (1584, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:22:13', 4);
INSERT INTO `login_log` VALUES (1585, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:22:15', 1);
INSERT INTO `login_log` VALUES (1586, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:22:15', 0);
INSERT INTO `login_log` VALUES (1587, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:22:56', 3);
INSERT INTO `login_log` VALUES (1588, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:22:56', 3);
INSERT INTO `login_log` VALUES (1589, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:22:59', 1);
INSERT INTO `login_log` VALUES (1590, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:22:59', 0);
INSERT INTO `login_log` VALUES (1591, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:29:19', 1);
INSERT INTO `login_log` VALUES (1592, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:30:48', 84114);
INSERT INTO `login_log` VALUES (1593, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:33:09', 14);
INSERT INTO `login_log` VALUES (1594, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:33:09', 2);
INSERT INTO `login_log` VALUES (1595, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:38:53', 8);
INSERT INTO `login_log` VALUES (1596, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:38:53', 13);
INSERT INTO `login_log` VALUES (1597, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 22:40:31', 4);
INSERT INTO `login_log` VALUES (1598, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:40:31', 4);
INSERT INTO `login_log` VALUES (1599, '127.0.0.1', '/api/admin/key/add', 'admin', '2021-10-07 22:40:37', 136);
INSERT INTO `login_log` VALUES (1600, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:40:37', 3);
INSERT INTO `login_log` VALUES (1601, '127.0.0.1', '/api/admin/key/queryById', 'admin', '2021-10-07 22:41:03', 1);
INSERT INTO `login_log` VALUES (1602, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:41:03', 0);
INSERT INTO `login_log` VALUES (1603, '127.0.0.1', '/api/user/enum/key', 'admin', '2021-10-07 22:41:08', 0);
INSERT INTO `login_log` VALUES (1604, '127.0.0.1', '/api/admin/key/change', 'admin', '2021-10-07 22:41:09', 42);
INSERT INTO `login_log` VALUES (1605, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 22:41:09', 2);
INSERT INTO `login_log` VALUES (1606, '127.0.0.1', '/api/admin/key/cancel', 'admin', '2021-10-07 22:49:26', 2741);
INSERT INTO `login_log` VALUES (1607, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 23:11:07', 2);
INSERT INTO `login_log` VALUES (1608, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:11:07', 4);
INSERT INTO `login_log` VALUES (1609, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:23:06', 3);
INSERT INTO `login_log` VALUES (1610, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 23:23:33', 3);
INSERT INTO `login_log` VALUES (1611, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:23:33', 4);
INSERT INTO `login_log` VALUES (1612, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 23:24:04', 3);
INSERT INTO `login_log` VALUES (1613, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:24:04', 4);
INSERT INTO `login_log` VALUES (1614, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:24:37', 16);
INSERT INTO `login_log` VALUES (1615, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:24:47', 4);
INSERT INTO `login_log` VALUES (1616, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:28:40', 3);
INSERT INTO `login_log` VALUES (1617, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:30:52', 5);
INSERT INTO `login_log` VALUES (1618, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:31:14', 3);
INSERT INTO `login_log` VALUES (1619, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-07 23:56:24', 13);
INSERT INTO `login_log` VALUES (1620, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:56:24', 51);
INSERT INTO `login_log` VALUES (1621, '127.0.0.1', '/api/admin/key/add', 'admin', '2021-10-07 23:57:00', 38);
INSERT INTO `login_log` VALUES (1622, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-07 23:57:00', 3);
INSERT INTO `login_log` VALUES (1623, '0:0:0:0:0:0:0:1', '/api/user/key/borrow', 'admin', '2021-10-07 23:57:07', 106);
INSERT INTO `login_log` VALUES (1624, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:16:23', 16);
INSERT INTO `login_log` VALUES (1625, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:16:23', 193);
INSERT INTO `login_log` VALUES (1626, '0:0:0:0:0:0:0:1', '/api/user/key/return', 'admin', '2021-10-08 00:16:41', 395);
INSERT INTO `login_log` VALUES (1627, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:16:49', 4);
INSERT INTO `login_log` VALUES (1628, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:16:49', 6);
INSERT INTO `login_log` VALUES (1629, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:18:54', 5);
INSERT INTO `login_log` VALUES (1630, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:18:54', 6);
INSERT INTO `login_log` VALUES (1631, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:22:02', 3);
INSERT INTO `login_log` VALUES (1632, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:22:35', 5);
INSERT INTO `login_log` VALUES (1633, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:22:35', 6);
INSERT INTO `login_log` VALUES (1634, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:23:53', 4);
INSERT INTO `login_log` VALUES (1635, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:27:03', 6);
INSERT INTO `login_log` VALUES (1636, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:28:28', 9);
INSERT INTO `login_log` VALUES (1637, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:31:32', 6);
INSERT INTO `login_log` VALUES (1638, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:31:36', 19);
INSERT INTO `login_log` VALUES (1639, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:31:36', 3);
INSERT INTO `login_log` VALUES (1640, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:32:13', 3);
INSERT INTO `login_log` VALUES (1641, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-08 00:34:52', 8);
INSERT INTO `login_log` VALUES (1642, '127.0.0.1', '/api/user/user/queryByUsername', 'admin', '2021-10-08 00:34:56', 3);
INSERT INTO `login_log` VALUES (1643, '127.0.0.1', '/api/user/user/change', 'admin', '2021-10-08 00:35:19', 95);
INSERT INTO `login_log` VALUES (1644, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-08 00:35:19', 4);
INSERT INTO `login_log` VALUES (1645, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-08 00:35:30', 44);
INSERT INTO `login_log` VALUES (1646, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:35:30', 7);
INSERT INTO `login_log` VALUES (1647, '127.0.0.1', '/api/user/monitor/server', 'test', '2021-10-08 00:35:33', 2210);
INSERT INTO `login_log` VALUES (1648, '127.0.0.1', '/api/user/user/queryList', 'test', '2021-10-08 00:35:39', 4);
INSERT INTO `login_log` VALUES (1649, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:40:33', 3);
INSERT INTO `login_log` VALUES (1650, '127.0.0.1', '/api/user/user/queryList', 'test', '2021-10-08 00:40:33', 7);
INSERT INTO `login_log` VALUES (1651, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:40:36', 5);
INSERT INTO `login_log` VALUES (1652, '127.0.0.1', '/api/user/user/changeImg', 'test', '2021-10-08 00:40:58', 133);
INSERT INTO `login_log` VALUES (1653, '127.0.0.1', '/api/user/user/queryList', 'test', '2021-10-08 00:41:03', 6);
INSERT INTO `login_log` VALUES (1654, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:41:17', 3);
INSERT INTO `login_log` VALUES (1655, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:41:25', 37);
INSERT INTO `login_log` VALUES (1656, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:41:25', 4);
INSERT INTO `login_log` VALUES (1657, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:43:45', 116);
INSERT INTO `login_log` VALUES (1658, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:43:45', 2);
INSERT INTO `login_log` VALUES (1659, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:44:10', 3);
INSERT INTO `login_log` VALUES (1660, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:44:10', 5);
INSERT INTO `login_log` VALUES (1661, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:45:00', 4);
INSERT INTO `login_log` VALUES (1662, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:45:00', 5);
INSERT INTO `login_log` VALUES (1663, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:45:16', 188);
INSERT INTO `login_log` VALUES (1664, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:45:17', 4);
INSERT INTO `login_log` VALUES (1665, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:45:24', 53);
INSERT INTO `login_log` VALUES (1666, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:45:24', 2);
INSERT INTO `login_log` VALUES (1667, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:45:26', 3);
INSERT INTO `login_log` VALUES (1668, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:45:26', 2);
INSERT INTO `login_log` VALUES (1669, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:46:01', 50);
INSERT INTO `login_log` VALUES (1670, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:46:01', 4);
INSERT INTO `login_log` VALUES (1671, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:46:25', 137);
INSERT INTO `login_log` VALUES (1672, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:46:25', 3);
INSERT INTO `login_log` VALUES (1673, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:46:29', 3);
INSERT INTO `login_log` VALUES (1674, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:46:29', 2);
INSERT INTO `login_log` VALUES (1675, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:48:27', 94);
INSERT INTO `login_log` VALUES (1676, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:48:27', 3);
INSERT INTO `login_log` VALUES (1677, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:49:18', 88);
INSERT INTO `login_log` VALUES (1678, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:49:19', 2);
INSERT INTO `login_log` VALUES (1679, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:51:11', 11);
INSERT INTO `login_log` VALUES (1680, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:51:11', 16);
INSERT INTO `login_log` VALUES (1681, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:51:16', 58);
INSERT INTO `login_log` VALUES (1682, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:51:51', 4);
INSERT INTO `login_log` VALUES (1683, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:51:51', 5);
INSERT INTO `login_log` VALUES (1684, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:55:28', 15);
INSERT INTO `login_log` VALUES (1685, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:55:28', 18);
INSERT INTO `login_log` VALUES (1686, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:55:31', 97);
INSERT INTO `login_log` VALUES (1687, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:55:31', 4);
INSERT INTO `login_log` VALUES (1688, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:55:36', 2);
INSERT INTO `login_log` VALUES (1689, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:55:36', 3);
INSERT INTO `login_log` VALUES (1690, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:56:11', 116);
INSERT INTO `login_log` VALUES (1691, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:56:12', 3);
INSERT INTO `login_log` VALUES (1692, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:56:21', 61);
INSERT INTO `login_log` VALUES (1693, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:56:21', 3);
INSERT INTO `login_log` VALUES (1694, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:56:26', 55);
INSERT INTO `login_log` VALUES (1695, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:56:26', 3);
INSERT INTO `login_log` VALUES (1696, '127.0.0.1', '/api/user/key/return', 'test', '2021-10-08 00:56:33', 58);
INSERT INTO `login_log` VALUES (1697, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:56:33', 4);
INSERT INTO `login_log` VALUES (1698, '127.0.0.1', '/api/user/key/borrow', 'test', '2021-10-08 00:56:42', 99);
INSERT INTO `login_log` VALUES (1699, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:56:42', 4);
INSERT INTO `login_log` VALUES (1700, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-08 00:56:48', 5);
INSERT INTO `login_log` VALUES (1701, '127.0.0.1', '/api/user/user/query', 'admin', '2021-10-08 00:56:48', 3);
INSERT INTO `login_log` VALUES (1702, '127.0.0.1', '/api/user/monitor/server', 'admin', '2021-10-08 00:56:49', 1237);
INSERT INTO `login_log` VALUES (1703, '127.0.0.1', '/api/user/user/queryList', 'admin', '2021-10-08 00:56:55', 4);
INSERT INTO `login_log` VALUES (1704, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:56:59', 3);
INSERT INTO `login_log` VALUES (1705, '127.0.0.1', '/api/user/key/borrow', 'admin', '2021-10-08 00:57:22', 47);
INSERT INTO `login_log` VALUES (1706, '127.0.0.1', '/api/user/key/query', 'admin', '2021-10-08 00:57:22', 3);
INSERT INTO `login_log` VALUES (1707, '127.0.0.1', '/api/common/login', 'anonymousUser', '2021-10-08 00:57:35', 2);
INSERT INTO `login_log` VALUES (1708, '127.0.0.1', '/api/user/user/query', 'test', '2021-10-08 00:57:35', 6);
INSERT INTO `login_log` VALUES (1709, '127.0.0.1', '/api/user/monitor/server', 'test', '2021-10-08 00:57:36', 1190);
INSERT INTO `login_log` VALUES (1710, '127.0.0.1', '/api/user/user/queryList', 'test', '2021-10-08 00:57:38', 3);
INSERT INTO `login_log` VALUES (1711, '127.0.0.1', '/api/user/key/query', 'test', '2021-10-08 00:57:42', 2);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `status` tinyint(1) NOT NULL COMMENT '接口状态 0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2271 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (2224, 2502, '/api/admin/book/changeImg', '上传书籍照片', 'GET', 1);
INSERT INTO `resource` VALUES (2225, 2503, '/api/admin/book/change', '修改书籍', 'POST', 1);
INSERT INTO `resource` VALUES (2226, 2504, '/api/admin/book/cancel', '删除书籍', 'GET', 1);
INSERT INTO `resource` VALUES (2227, 2501, '/api/admin/book/add', '添加书籍', 'POST', 1);
INSERT INTO `resource` VALUES (2228, 2601, '/api/admin/key/add', '增加钥匙', 'GET', 1);
INSERT INTO `resource` VALUES (2229, 2602, '/api/admin/key/change', '修改钥匙', 'POST', 1);
INSERT INTO `resource` VALUES (2230, 2604, '/api/admin/key/queryById', '根据id查询钥匙', 'GET', 1);
INSERT INTO `resource` VALUES (2231, 2603, '/api/admin/key/cancel', '删除钥匙', 'GET', 1);
INSERT INTO `resource` VALUES (2232, 2801, '/api/admin/keyUser/add', '增加钥匙持有人', 'GET', 1);
INSERT INTO `resource` VALUES (2233, 2802, '/api/admin/keyUser/cancel', '删除钥匙持有人', 'GET', 1);
INSERT INTO `resource` VALUES (2234, 2701, '/api/admin/loginLog/query', '登录日志列表', 'POST', 1);
INSERT INTO `resource` VALUES (2235, 2201, '/api/admin/resource/reload', '重载角色资源', 'GET', 1);
INSERT INTO `resource` VALUES (2236, 2202, '/api/admin/resource/change', '更改接口开放状态', 'GET', 1);
INSERT INTO `resource` VALUES (2237, 2203, '/api/admin/resource/query', '获取资源接口', 'POST', 1);
INSERT INTO `resource` VALUES (2238, 2303, '/api/admin/signup/export', '导出报名单', 'GET', 1);
INSERT INTO `resource` VALUES (2239, 2302, '/api/admin/signup/change', '更新报名记录', 'POST', 1);
INSERT INTO `resource` VALUES (2240, 2301, '/api/admin/signup/query', '获取报名记录', 'POST', 1);
INSERT INTO `resource` VALUES (2241, 2402, '/api/admin/tag/change', '更新标签', 'GET', 1);
INSERT INTO `resource` VALUES (2242, 2401, '/api/admin/tag/add', '增加标签', 'GET', 1);
INSERT INTO `resource` VALUES (2243, 2404, '/api/admin/tag/query', '获取标签列表', 'POST', 1);
INSERT INTO `resource` VALUES (2244, 2403, '/api/admin/tag/cancel', '删除标签', 'GET', 1);
INSERT INTO `resource` VALUES (2245, 2101, '/api/admin/user/add', '注册用户', 'POST', 1);
INSERT INTO `resource` VALUES (2246, 2102, '/api/admin/user/cancel', '删除用户', 'GET', 1);
INSERT INTO `resource` VALUES (2247, 1102, '/api/common/test', '认证测试', 'GET', 1);
INSERT INTO `resource` VALUES (2248, 1103, '/api/common/logout', '用户退出', 'GET', 1);
INSERT INTO `resource` VALUES (2249, 1101, '/api/common/login', '用户登录', 'POST', 1);
INSERT INTO `resource` VALUES (2250, 1301, '/api/common/rank/csdn', 'csdn实时展示', 'GET', 1);
INSERT INTO `resource` VALUES (2251, 1202, '/api/common/signUp/query', '报名结果查询', 'GET', 1);
INSERT INTO `resource` VALUES (2252, 1201, '/api/common/signUp/add', '纳新报名', 'POST', 1);
INSERT INTO `resource` VALUES (2253, 3310, '/api/user/enum/username', '模糊查询用户名列表', 'GET', 1);
INSERT INTO `resource` VALUES (2254, 3301, '/api/user/enum/key', '模糊查询钥匙状态', 'GET', 1);
INSERT INTO `resource` VALUES (2255, 3311, '/api/user/enum/name', '模糊查询姓名列表', 'GET', 1);
INSERT INTO `resource` VALUES (2256, 3312, '/api/user/enum/major', '模糊查询专业列表', 'GET', 1);
INSERT INTO `resource` VALUES (2257, 3502, '/api/user/book/borrow', '借书', 'GET', 1);
INSERT INTO `resource` VALUES (2258, 3501, '/api/user/book/query', '书籍列表', 'POST', 1);
INSERT INTO `resource` VALUES (2259, 3503, '/api/user/book/return', '还书', 'GET', 1);
INSERT INTO `resource` VALUES (2260, 3402, '/api/user/key/borrow', '借钥匙', 'GET', 1);
INSERT INTO `resource` VALUES (2261, 3403, '/api/user/key/return', '还钥匙', 'GET', 1);
INSERT INTO `resource` VALUES (2262, 3401, '/api/user/key/query', '钥匙列表', 'POST', 1);
INSERT INTO `resource` VALUES (2263, 3601, '/api/user/keyUser/query', '钥匙记录列表', 'POST', 1);
INSERT INTO `resource` VALUES (2264, 3201, '/api/user/monitor/server', '服务器监控', 'GET', 1);
INSERT INTO `resource` VALUES (2265, 3106, '/api/user/user/queryByUsername', '根据用户名选择用户', 'GET', 1);
INSERT INTO `resource` VALUES (2266, 3102, '/api/user/user/query', '根据账号选择用户', 'GET', 1);
INSERT INTO `resource` VALUES (2267, 3101, '/api/user/user/change', '更新用户信息', 'POST', 1);
INSERT INTO `resource` VALUES (2268, 3103, '/api/user/user/queryList', '根据情况选择用户', 'POST', 1);
INSERT INTO `resource` VALUES (2269, 3104, '/api/user/user/changeImg', '上传头像文件', 'POST', 1);
INSERT INTO `resource` VALUES (2270, 3105, '/api/user/user/changePassword', '修改密码', 'POST', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL COMMENT '角色id，主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (2, '普通用户');
INSERT INTO `role` VALUES (1, '管理员');

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` int(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15652 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (15593, 2, 3104);
INSERT INTO `role_resource` VALUES (15594, 2, 3201);
INSERT INTO `role_resource` VALUES (15595, 2, 3105);
INSERT INTO `role_resource` VALUES (15596, 2, 3106);
INSERT INTO `role_resource` VALUES (15597, 2, 3301);
INSERT INTO `role_resource` VALUES (15598, 2, 3401);
INSERT INTO `role_resource` VALUES (15599, 2, 3402);
INSERT INTO `role_resource` VALUES (15600, 2, 3403);
INSERT INTO `role_resource` VALUES (15601, 2, 3501);
INSERT INTO `role_resource` VALUES (15602, 2, 3502);
INSERT INTO `role_resource` VALUES (15603, 2, 3310);
INSERT INTO `role_resource` VALUES (15604, 2, 3503);
INSERT INTO `role_resource` VALUES (15605, 2, 3311);
INSERT INTO `role_resource` VALUES (15606, 2, 3312);
INSERT INTO `role_resource` VALUES (15607, 2, 3601);
INSERT INTO `role_resource` VALUES (15608, 2, 3101);
INSERT INTO `role_resource` VALUES (15609, 2, 3102);
INSERT INTO `role_resource` VALUES (15610, 2, 3103);
INSERT INTO `role_resource` VALUES (15611, 1, 3201);
INSERT INTO `role_resource` VALUES (15612, 1, 2501);
INSERT INTO `role_resource` VALUES (15613, 1, 2502);
INSERT INTO `role_resource` VALUES (15614, 1, 2503);
INSERT INTO `role_resource` VALUES (15615, 1, 2504);
INSERT INTO `role_resource` VALUES (15616, 1, 3401);
INSERT INTO `role_resource` VALUES (15617, 1, 3402);
INSERT INTO `role_resource` VALUES (15618, 1, 3403);
INSERT INTO `role_resource` VALUES (15619, 1, 2701);
INSERT INTO `role_resource` VALUES (15620, 1, 3601);
INSERT INTO `role_resource` VALUES (15621, 1, 2201);
INSERT INTO `role_resource` VALUES (15622, 1, 2202);
INSERT INTO `role_resource` VALUES (15623, 1, 2203);
INSERT INTO `role_resource` VALUES (15624, 1, 3101);
INSERT INTO `role_resource` VALUES (15625, 1, 3102);
INSERT INTO `role_resource` VALUES (15626, 1, 3103);
INSERT INTO `role_resource` VALUES (15627, 1, 3104);
INSERT INTO `role_resource` VALUES (15628, 1, 2401);
INSERT INTO `role_resource` VALUES (15629, 1, 3105);
INSERT INTO `role_resource` VALUES (15630, 1, 2402);
INSERT INTO `role_resource` VALUES (15631, 1, 3106);
INSERT INTO `role_resource` VALUES (15632, 1, 2403);
INSERT INTO `role_resource` VALUES (15633, 1, 2404);
INSERT INTO `role_resource` VALUES (15634, 1, 3301);
INSERT INTO `role_resource` VALUES (15635, 1, 2601);
INSERT INTO `role_resource` VALUES (15636, 1, 2602);
INSERT INTO `role_resource` VALUES (15637, 1, 2603);
INSERT INTO `role_resource` VALUES (15638, 1, 2604);
INSERT INTO `role_resource` VALUES (15639, 1, 3501);
INSERT INTO `role_resource` VALUES (15640, 1, 3310);
INSERT INTO `role_resource` VALUES (15641, 1, 3502);
INSERT INTO `role_resource` VALUES (15642, 1, 3503);
INSERT INTO `role_resource` VALUES (15643, 1, 3311);
INSERT INTO `role_resource` VALUES (15644, 1, 3312);
INSERT INTO `role_resource` VALUES (15645, 1, 2801);
INSERT INTO `role_resource` VALUES (15646, 1, 2802);
INSERT INTO `role_resource` VALUES (15647, 1, 2101);
INSERT INTO `role_resource` VALUES (15648, 1, 2102);
INSERT INTO `role_resource` VALUES (15649, 1, 2301);
INSERT INTO `role_resource` VALUES (15650, 1, 2302);
INSERT INTO `role_resource` VALUES (15651, 1, 2303);

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `route_id` int(11) NOT NULL COMMENT '主键',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `status` tinyint(1) NOT NULL COMMENT '路径状态 0关闭 1开启',
  PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for signup
-- ----------------------------
DROP TABLE IF EXISTS `signup`;
CREATE TABLE `signup`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 主键',
  `student_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业班级',
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自我介绍',
  `status` tinyint(4) NOT NULL COMMENT '录取状态 0未查看 1已录取 2未录取',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评语',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signup
-- ----------------------------
INSERT INTO `signup` VALUES (1, '1', 'shit', '男', '12334', '挖掘机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 0, '团长 你就是个zipper', NULL, '2021-09-20 21:42:15');
INSERT INTO `signup` VALUES (2, '18110571234', '程成', '男', '501966782', '信管本2002', '熟悉golang。Java。cpp。vue。熟悉开源社区。github.com/devhg。熟悉Linux   ', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (3, '19111405056', '杨叶江', '男', '424133224', '工商1902', '目前属于基础检查，目标方向是为了能运用Python进行数据分析等，无项目经历。\n竞赛主要有省级三项，校级奖项若干', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (4, '19111407001', '宣佳栋', '男', '1413452856', '市销1901', '       在思想方面，本人理想信念坚定，积极向党组织靠拢。\n       在工作方面，担任班级学习委员，青年服务部工作人员，课程助理，市销2001班带班，积极为老师排忧解难。\n       在学习方面，学习认真努力，成绩优异，当前学业成绩和综合测评成绩均位于专业第一位，被授予校级“优秀学生”、“优秀共青团员”等称号，并获得校级二等奖学金。\n       在比赛方面，积极参加大型比赛，曾获：\n1.全国花间校园街坊总站国家级优秀奖\n2.“尖峰时刻”全球案例大赛省级一等奖\n3.全国大学生工程训练综合能力竞赛省级二等奖\n4.全国大学生市场调查与分析大赛省级三等奖\n5.“挑战杯”大学生课外学术科技作品大赛校级三等奖\n6.淄博市“创意青春 智赢未来”营销方案设计大赛市级二等奖\n7.山东理工大学青春踏歌行合唱比赛校级特等奖\n8.第一届山东理工大学创新方法应用大赛校级三等奖\n9.山东理工大学大学生科技创新大赛校级三等奖\n10.山东理工大学青年创客挑战赛校级优秀奖\n11.第三届全国管理模拟决策大赛校级三等奖\n12.第四届全国管理模拟决策大赛校级二等奖\n13.“庆国庆 青年行”爱国寻图比赛校级一等奖\n14.全国大学生电子商务“创新 创意 创业”挑战赛校级二等奖\n       在社会实践方面，两次获得社会实践校级奖项，被授予“社会实践先进个人”称号。\n       在科研成果方面，跟随导师进行小农户与现代化衔接方面的研究，自学SPSS分析、Java和citespace，并主持校级立项一项。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (5, '19111408015', '孙淼', '男', '1873365757', '信管1901', 'JAVA浅层次内容完成\nSQL语句浅层次\n周一上午\n周二晚上\n周三晚上\n周四下午晚上\n周五晚上', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (6, '19111408022', '杨光秋', '男', '1980820857', '信管1901', '1.现在在学java，感觉java想要深入掌握，是需要有专业老师教授。所以在专业课教学java语言和SQL Server，我希望能够通过信息技术实验室能另外掌握重要的python语言和c语言。\n\n2.我的目标是希望能够毕业掌握java语言，精通python语言和c语言，能够学到可以单人开发一些小项目小程序，能够有能力成为大项目开发团队的一员，甚至作为大项目开发经理。\n\n3.已经学完java语言基础、流程控制、数组与字符串（数据结构与算法分析学习完线性表、栈和队列）和Mysql的基础。\n接下去几周学习java语言类特性，继承、抽象类、接口和枚举，异常处理，java语言的输入输出与文件处理等，相关数据结构与算法分析，学习完mysql的基础内容。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (7, '19111408041', '曹渊博', '男', '2985958099', '信管1902', '目前java学完多线程，下一步想学一下算法，前端想再放一放在学，大二学生会也能退了之后就好好学习去了，实验室大概一个星期能去四次左右', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (8, '19111493015', '卢玉栋', '男', '2191387440', '信管本1901', '学了java流程控制，包括分支结构，循环结构，和跳转语句。定义数组与字符串。了解类，java输入输出与文件处理，学习了使用sql语句进行数据库管理，表的管理和应用，想从事大数据开发\n每周有时间就可以去实验室，白天有课，每天晚上可以去，周末', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (9, '19111493055', '陈建军', '男', '1727072639', '信管本1902', '了解Java、C、Python，了解SSM,SpringBoot框架，了解数据库的使用，会使用Git上传项目，会简单使用Linux操作系统，了解Docker容器，会使用ElasticSearch和Redis，了解Hadoop框架。\n目标方向是JavaWeb开发\n项目经历：1、微小型跨组织人才管理系统 2、绿色低碳出行微信小程序 3、员工管理系统\nCSDN: https://blog.csdn.net/qq_40266349?spm=1000.2115.3001.5343\nGitHub: https://github.com/JackYangyang0\n获奖：第六届节能减排社会实践与科技竞赛校二等奖且进入国赛', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (10, '19111493063', '王金浩', '男', '1253912723', '信管本1902', '大一学期专业课学过Java，上下学期考试均90分以上。基本例题都基本掌握。对python 感兴趣，目前已经开始学习！加入实验室的目的是想跟同学们一起交流学习，做一些创新性的事情。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (11, '19121406076', '王若冰', '女', '872184581', '工业1902', '目前初次接触python，系统学过计算机导论，熟悉较为简单的mathematica，接触过MATLAB，目标方向数据分析、算法优化，已取得四级证书、计算机二级证，大英赛二等奖，山东省数学竞赛三等奖，参与多项创新创业类竞赛，负责大创项目一项，对计算机软件学习保有热情，希望进步', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (12, '19121408037', '蔡春雨', '女', '1723612044', '信管1901', '获得计算机二级证书mysql数据库程序设计', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (13, '19121408074', '唐境锶', '女', '1945938350', '信管1902', '学过一些HTMLcssjs java mysql sqlsever 不是很厉害的那种程度 周四周天', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (14, '19121408075', '王梦瑶', '女', '1486102538', '信管1902', '目前掌握java的控制语句和方法内容，在进一步学习中，目标是能有自主开发编写程序的能力，暂无项目经历\n通过b站的java相关视频和csdn的相关知识自学', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (15, '19121493034', '贾聪聪', '女', '1541163933', '信管本1901', '自学Java', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (16, '2', 'shit', '男', '12333434', '挖掘机咕噜咕噜', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 2, NULL, NULL, '2021-09-08 16:17:09');
INSERT INTO `signup` VALUES (17, '20111405008', '刘浩伟', '男', '209478845', '工商2002', '我擅长C语言和一些基础算法，做一些算法题目，并且自学了数据结构(不过还没学完)，未来的目标是学习完数据结构和一些算法后，学习一些前端知识和计网知识，增加自己的技术面。除此之外，我也想参加一些比赛，如算法竞赛，关于计算机的比赛等，开阔自己的眼界。个人博客地址: https://blog.csdn.net/weixin_55812984。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (18, '20111407001', '周洪燊', '男', '2160915425', '市销2002', '自己对于编程掌握的不是很多，但是最近一直在学习python，对于python的一些基本规则和一些函数都有所了解掌握；自己目标方向就是可以全面地掌握编程，对于编程不同的种类技术都有所了解；自己没有什么项目经历，属于刚学编程的小白，但是自己可以学习，也相信自己会逐渐精通编程；自己的自学能力还算可以，对于新知识学得还算比较快，对于理科的一些知识学得会更快，理解得也会更快，因此我相信我会很快地融入到这个集体。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (19, '20111408012', '张义龙', '男', '568933962', '信管2002班', '个人暂时为java萌新，想学好java，暂时在刷山理工的oj和看哔站的教程，接触过citespace所以自己也想用java做出一个程序(如游戏)。对编程感兴趣，愿意去主动找到更多的资源去学习，让自己成长。去实验室的时间是周四周五下午可以去，下晚自习可以去。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (20, '20111408016', '马元麒', '男', '2804120991', '信管2002', '上学期学了HTML5、CSS、JS等等前端知识，已经会熟练制作静态网页，能对于一个现成的网页进行重新修改，并且学习了PHP，会对数据库进行基础操作，在寒假期间用php以及前端知识做出了自己的博客，可以实现增删改查，注册、登录、分页等等，但是还在本地保留，没有放到网站上（没有进行美化，太丑了）我也是青春在线程序部常驻志愿者，在那学习后端，laravel框架，网站构建知识，在寒假期间也参加了一个学长带队的互联网➕项目，在那里负责前端页面制作美化等等。我也学习java，前段时间刷了山东理工oj上的120多道题目，但是最近没做，最近一直在看bootstrape和js动态网页的制作，做了一个简单实时判断输入框输入内容长度的注册页面，准备再看看移动端网页适配的问题，我周一到周五晚上都可以去，周六在西校程序部培训学习，周天可能去西校做前端或者学网站搭建。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (21, '20111408050', '张森', '男', '1741927235', '信管2001', 'Language：Java, html, C（正在学）\nTarget：1.熟练运用Java和C,可以参加项目设计\n             2.深入学习算法和数据结构\n             3.可以独立制作，参加有水平的比赛\nTime：每天都能来实验室自习；\n           有课时如没特殊情况至少每晚都能来；\n           \n            ', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (22, '20121408020', '万蝶依', '女', '2433215310', '信管2002', '学习JAVA语言，在acm上做一些实验题，现在做到130道题目，对于编程有非常基础的了解，比较感兴趣，想要更加深入的了解编程的应用，将其快速的应用到现实中。寒假中对数据的处理有了一点点的了解。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (23, '20121408022', '韩雨欣', '女', '3240261856', '信息管理与信息系统专业2002', '目标熟练掌握JAVA。学习数据库', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (24, '20121408029', '曹雪', '女', '1369240484', '信管2002', '1.熟悉Java语言，有一定的Java基础。\n2.了解c语言，HTML，PHP，曾与伙伴合作写过一个网页。\n3.目前正在自学算法，数据结构，计算机组成原理。\n4.目标方向是web前后端开发(全栈)。\n', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (25, '20121408039', '李贝贝', '女', '1410851521', '信管2002', '具有一定的自学能力，对制作网页及app具有较强的学习兴趣。希望自己可以独立制作出一个网页，或是app', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (26, '20121408061', '张玉洁', '女', '2889770573', '信管2001', '现在是大一阶段，正在学习Java、C编程语言，接触了前端HTML CSS，有一定的自学能力，目前还没有比较明确的目标方向，对编程感兴趣，准备继续学习数据结构及算法方面的知识，渴望与志同道合的小伙伴一起交流学习。如果能加入实验室大家庭，我应该每天都会来实验室学习。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (27, '20121408071', '曹琪', '女', '1138576292', '信管2001', '对计算机方向很感兴趣，想要进一步了解前端技术。虽然目前技术还处于基础阶段，但是我会很努力的。\n(去实验室的时间:只要是我没课的时候都可以去，包括假期我也都是留校)', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (28, '20121493080', '葛越荷', '女', '1787738998', '信管本2001', '主要学习JAVA相关知识，会不断复习学过的JAVA知识，并且开始学习一部分c语言知识。希望以后在研究生阶段进行学习软件开发的方向，所以会在大学开始就为考试做准备。', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (29, '3', 'ass', '男', '12233334', '挖掘22机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 0, NULL, NULL, NULL);
INSERT INTO `signup` VALUES (30, '114514', 'asefesf', '女', 'asefsefes', 'asefseaf', 'asefsef', 0, NULL, '2021-09-09 01:19:39', '2021-09-20 19:14:13');
INSERT INTO `signup` VALUES (49, '1145144', 'asefesf', '女', 'asefsefes', 'asefseaf', 'asefsef', 0, NULL, '2021-09-20 19:13:57', '2021-09-20 19:14:06');
INSERT INTO `signup` VALUES (50, '18111493050', 'lulinzi', '男', '1773950094', '信管本', 'asfjuiasefhiusehfwuoejrfiwjhfopasehfiposaehfiohsfkhiueahfiuasehfiuh哈覅u合肥欧服哈怂i返回覅u水分后期完结飞鸟无回复i啊瓦活佛i合法哦i是覅和', 0, NULL, '2021-09-20 21:48:50', '2021-09-21 01:39:55');
INSERT INTO `signup` VALUES (51, '123123', '1231231', '男', '123123', '123123', '', 0, NULL, '2021-09-21 01:28:20', '2021-09-21 01:28:20');
INSERT INTO `signup` VALUES (52, '123', '123', '男', '123', '123', '', 0, NULL, '2021-09-21 01:29:37', '2021-09-21 01:29:38');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `order` int(11) NOT NULL COMMENT '排序权重',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (5, 'web', 1);
INSERT INTO `tag` VALUES (6, 'java', 2);

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `task_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名',
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类',
  `function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务功能',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (2, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (3, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (4, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (5, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (6, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (7, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (8, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (9, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (10, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (11, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (12, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (13, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (14, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (15, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (16, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (17, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (18, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (19, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (20, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (21, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (22, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (23, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (24, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (25, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (26, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (27, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (28, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (29, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (30, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (31, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (32, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (33, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (34, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (35, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (36, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (37, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (38, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (39, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (40, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (41, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (42, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (43, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (44, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (45, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (46, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (47, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (48, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (49, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (50, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (51, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (52, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (53, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (54, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (55, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (56, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (57, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (58, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (59, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (60, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (61, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (62, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (63, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (64, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (65, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (66, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (67, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (68, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (69, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (70, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (71, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (72, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (73, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (74, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (75, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (76, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (77, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (78, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (79, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (80, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (81, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (82, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (83, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (84, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (85, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (86, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (87, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (88, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (89, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (90, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (91, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (92, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (93, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (94, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (95, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (96, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (97, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (98, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (99, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (100, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (101, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (102, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (103, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (104, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (105, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (106, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (107, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (108, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (109, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (110, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (111, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (112, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (113, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (114, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (115, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (116, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (117, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (118, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (119, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (120, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (121, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (122, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (123, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (124, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (125, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (126, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (127, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (128, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (129, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (130, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (131, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (132, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (133, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (134, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (135, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (136, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (137, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (138, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (139, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (140, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (141, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (142, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (143, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (144, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (145, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (146, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (147, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');
INSERT INTO `task` VALUES (148, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (149, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (150, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');

-- ----------------------------
-- Table structure for task_trigger
-- ----------------------------
DROP TABLE IF EXISTS `task_trigger`;
CREATE TABLE `task_trigger`  (
  `trigger_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `task_id` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务描述',
  `cron` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `status` tinyint(4) NOT NULL COMMENT '定时任务状态 0 停用,1启用',
  PRIMARY KEY (`trigger_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_trigger
-- ----------------------------
INSERT INTO `task_trigger` VALUES (1, 'T1', '爬虫', '*/10 * * * * ?', 1);

-- ----------------------------
-- Table structure for user_entity
-- ----------------------------
DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE `user_entity`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id，当主键用',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(账户)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_entity
-- ----------------------------
INSERT INTO `user_entity` VALUES (20, 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `user_entity` VALUES (21, 'test1', '5a105e8b9d40e1329780d62ea2265d8a');
INSERT INTO `user_entity` VALUES (22, 'test', '098f6bcd4621d373cade4e832627b4f6');
INSERT INTO `user_entity` VALUES (23, 'test2', 'ad0234829205b9033196ba818f7a872b');
INSERT INTO `user_entity` VALUES (24, 'test3', '8ad8757baa8564dc136c1e07507f4a98');
INSERT INTO `user_entity` VALUES (25, 'test5', 'e3d704f3542b44a621ebed70dc0efe13');
INSERT INTO `user_entity` VALUES (26, 'test6', '4cfad7076129962ee70c36839a1e3e15');
INSERT INTO `user_entity` VALUES (27, 'test7', 'b04083e53e242626595e2b8ea327e525');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(学号)',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业班级',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `research` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学习/研究方向\r\n',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (20, 'admin', '你是基佬', 'data:image/png;base64,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', '我是蓝翔', '123456', '654312', 'shit12312', '一起搞基，先生！先谢谢你，哦是的先生', NULL, NULL);
INSERT INTO `user_info` VALUES (21, 'test1', '大便', NULL, '阿斯蒂芬撒地方', '撒分色', '瑟夫', '费萨尔费', '你说的附属恶化覅色回复i色回复i规格和', NULL, NULL);
INSERT INTO `user_info` VALUES (22, 'test', '撤硕', 'data:image/png;base64,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', '奥里给', '123', '321', '1234567', '扒鸭屁股是块宝', NULL, '2021-10-08 00:35:19');
INSERT INTO `user_info` VALUES (23, 'test2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (24, 'test3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (25, 'test5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (26, 'test6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user_info` VALUES (27, 'test7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`, `user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (14, 20, 1);
INSERT INTO `user_role` VALUES (15, 21, 2);
INSERT INTO `user_role` VALUES (16, 22, 2);
INSERT INTO `user_role` VALUES (17, 23, 2);
INSERT INTO `user_role` VALUES (18, 24, 2);
INSERT INTO `user_role` VALUES (19, 25, 2);
INSERT INTO `user_role` VALUES (20, 26, 2);
INSERT INTO `user_role` VALUES (21, 27, 2);

SET FOREIGN_KEY_CHECKS = 1;
