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

 Date: 15/12/2021 01:25:58
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
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '你是杰哥', 'data:image/png;base64,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', '我是杰哥', 0, NULL, '2021-12-15 00:44:30', 0);
INSERT INTO `book` VALUES (2, '哼哼哼啊啊啊啊啊', 'data:image/png;base64,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', '下北沢', 0, NULL, '2021-12-15 00:44:25', 0);
INSERT INTO `book` VALUES (3, '阿伟', 'data:image/png;base64,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', '我超勇的', 0, '2021-12-13 21:57:21', '2021-12-15 00:44:28', 0);

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_id` int(11) NOT NULL COMMENT '书id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_tag
-- ----------------------------
INSERT INTO `book_tag` VALUES (20, 1, 5);
INSERT INTO `book_tag` VALUES (21, 1, 6);
INSERT INTO `book_tag` VALUES (22, 1, 10);
INSERT INTO `book_tag` VALUES (23, 1, 16);
INSERT INTO `book_tag` VALUES (24, 2, 7);
INSERT INTO `book_tag` VALUES (25, 2, 5);
INSERT INTO `book_tag` VALUES (26, 2, 8);
INSERT INTO `book_tag` VALUES (27, 2, 9);
INSERT INTO `book_tag` VALUES (28, 2, 15);
INSERT INTO `book_tag` VALUES (29, 3, 12);
INSERT INTO `book_tag` VALUES (30, 3, 5);
INSERT INTO `book_tag` VALUES (31, 3, 13);

-- ----------------------------
-- Table structure for book_user
-- ----------------------------
DROP TABLE IF EXISTS `book_user`;
CREATE TABLE `book_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` int(11) NOT NULL COMMENT '书籍id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0未归还 1已归还',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_user
-- ----------------------------
INSERT INTO `book_user` VALUES (11, 1, 20, 1, '2021-12-15 00:44:30');
INSERT INTO `book_user` VALUES (12, 3, 20, 1, '2021-12-15 00:44:28');
INSERT INTO `book_user` VALUES (13, 2, 20, 1, '2021-12-15 00:44:25');

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
  `key_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ' 钥匙id',
  `key_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钥匙名称',
  `status` tinyint(1) NOT NULL COMMENT '状态 0未借走 1已借走 2已丢失',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_flag` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`key_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key
-- ----------------------------
INSERT INTO `key` VALUES (11, '四教115', 0, '2021-12-05 23:09:27', '2021-12-15 01:21:01', 0);
INSERT INTO `key` VALUES (12, '四教110', 0, '2021-12-05 23:21:49', '2021-12-15 00:44:57', 0);
INSERT INTO `key` VALUES (13, '哇塞', 0, '2021-12-15 01:18:33', '2021-12-15 01:18:33', 1);

-- ----------------------------
-- Table structure for key_user
-- ----------------------------
DROP TABLE IF EXISTS `key_user`;
CREATE TABLE `key_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `key_id` int(11) NOT NULL COMMENT '钥匙id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '状态 0暂保管 1已归还',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of key_user
-- ----------------------------
INSERT INTO `key_user` VALUES (22, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (23, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (24, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (25, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (26, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (27, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (28, 11, 20, 1, '2021-12-06 00:24:24');
INSERT INTO `key_user` VALUES (29, 11, 20, 1, '2021-12-06 00:25:58');
INSERT INTO `key_user` VALUES (30, 11, 20, 1, '2021-12-06 00:28:02');
INSERT INTO `key_user` VALUES (31, 11, 20, 1, '2021-12-06 00:29:51');
INSERT INTO `key_user` VALUES (32, 11, 20, 1, '2021-12-06 00:30:07');
INSERT INTO `key_user` VALUES (33, 11, 20, 1, '2021-12-06 00:34:48');
INSERT INTO `key_user` VALUES (34, 12, 20, 1, '2021-12-06 22:25:32');
INSERT INTO `key_user` VALUES (35, 12, 20, 1, '2021-12-06 23:05:39');
INSERT INTO `key_user` VALUES (36, 11, 20, 1, '2021-12-15 00:44:55');
INSERT INTO `key_user` VALUES (37, 12, 20, 1, '2021-12-15 00:44:57');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` int(11) NOT NULL COMMENT '主键',
  `parent_id` int(11) NOT NULL COMMENT '父路径id，id为0代表为父路径',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `text` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本内容',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'icon类型',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'icon大小',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `external` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链',
  `hidden` tinyint(2) NULL DEFAULT NULL COMMENT '隐藏0 不隐藏1',
  `role_id` tinyint(2) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1001, 0, '/home', 'home', '主页', 'md-home', '18', '/Home', NULL, NULL, 3);
INSERT INTO `menu` VALUES (1002, 0, '/userinfo', 'userinfo', '用户信息', 'ios-time', '18', '/UserInfo', NULL, NULL, 3);
INSERT INTO `menu` VALUES (1003, 0, '/member', 'member', '成员管理', 'md-person', '18', '/Member', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2000, 0, '/book', 'book', '书籍管理', 'ios-book-outline', '18', '', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2001, 2000, '/booklist', 'booklist', '书籍列表', 'ios-book', '18', '/Book', NULL, NULL, 3);
INSERT INTO `menu` VALUES (2002, 2000, '/bookuser', 'bookuser', '借阅记录', 'md-book', '18', '/BookUser', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3000, 0, '/key', 'key', '钥匙管理', 'ios-key-outline', '18', '', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3001, 3000, '/keylist', 'keylist', '钥匙列表', 'ios-key', '18', '/Key', NULL, NULL, 3);
INSERT INTO `menu` VALUES (3002, 3000, '/keyuser', 'keyuser', '借阅记录', 'md-key', '18', '/KeyUser', NULL, NULL, 3);
INSERT INTO `menu` VALUES (4000, 0, '/okr', 'okr', 'okr管理', 'ios-egg-outline', '18', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4001, 4000, '/okrlist', 'okrlist', 'okr列表', 'ios-egg', '18', '/Okr', NULL, NULL, 3);
INSERT INTO `menu` VALUES (5000, 0, '/admin', 'admin', '系统管理', 'ios-lock', '18', '', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5001, 5000, '/sysrecord', 'sysrecord', '操作记录', 'ios-time', '18', '/SysRecord', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5002, 5000, '/signup', 'signup', '报名管理', 'md-bookmark', '18', '/SignUp', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5003, 5000, '/resource', 'resource', '接口管理', 'logo-buffer', '18', '/Resource', NULL, NULL, 2);
INSERT INTO `menu` VALUES (5004, 5000, '/tag', 'tag', '标签管理', 'md-card', '18', '/Tag', NULL, NULL, 2);

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `resource_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路径',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色',
  `status` tinyint(1) NOT NULL COMMENT '接口状态 0关闭 1开启',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1467896460384769305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1467896460384769246, '删除书籍', 'GET', '/api/okr/book/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769247, '书籍列表', 'POST', '/api/okr/book/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769248, '请求书籍', 'GET', '/api/okr/book/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769249, '借书', 'GET', '/api/okr/book/borrow', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769250, '还书', 'GET', '/api/okr/book/return', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769251, '上传书籍照片', 'POST', '/api/okr/book/changeImg', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769252, '修改书籍', 'POST', '/api/okr/book/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769253, '添加书籍', 'GET', '/api/okr/book/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769254, '查询借阅记录', 'POST', '/api/okr/bookUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769255, '认证测试', 'GET', '/api/okr/common/test', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769256, '用户退出', 'GET', '/api/okr/common/logout', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769257, '用户登录', 'POST', '/api/okr/common/login', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769258, '模糊查询角色', 'GET', '/api/okr/enum/role', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769259, '模糊查询钥匙', 'GET', '/api/okr/enum/key', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769260, '模糊查询用户名列表', 'GET', '/api/okr/enum/username', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769261, '模糊查询姓名列表', 'GET', '/api/okr/enum/name', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769262, '模糊查询专业列表', 'GET', '/api/okr/enum/major', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769263, '模糊查询成员状态', 'GET', '/api/okr/enum/userStatus', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769264, '模糊查询书籍状态', 'GET', '/api/okr/enum/book', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769265, '模糊查询标签', 'GET', '/api/okr/enum/tag', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769266, '模糊查询报名状态', 'GET', '/api/okr/enum/signUpStatus', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769267, '根据id查询钥匙', 'GET', '/api/okr/key/queryById', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769268, '增加钥匙', 'GET', '/api/okr/key/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769269, '修改钥匙', 'POST', '/api/okr/key/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769270, '钥匙列表', 'POST', '/api/okr/key/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769271, '删除钥匙', 'GET', '/api/okr/key/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769272, '借钥匙', 'GET', '/api/okr/key/borrow', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769273, '还钥匙', 'GET', '/api/okr/key/return', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769274, '增加钥匙持有人', 'GET', '/api/okr/keyUser/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769275, '删除钥匙持有人', 'GET', '/api/okr/keyUser/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769276, '钥匙记录列表', 'POST', '/api/okr/keyUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769277, '获取路径', 'GET', '/api/okr/menu/fetch', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769278, '服务器监控', 'GET', '/api/okr/monitor/server', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769279, 'csdn实时展示', 'GET', '/api/okr/rank/csdn', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769280, '获取资源名称', 'GET', '/api/okr/resource/queryName', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769281, '更改接口开放状态', 'GET', '/api/okr/resource/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769282, '获取资源接口', 'POST', '/api/okr/resource/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769283, '获取报名记录', 'POST', '/api/okr/signup/queryList', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769284, '纳新报名', 'POST', '/api/okr/signup/add', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769285, '更新报名记录', 'POST', '/api/okr/signup/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769286, '报名结果查询', 'GET', '/api/okr/signup/query', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384769287, '导出报名单', 'GET', '/api/okr/signup/export', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769288, '操作记录列表', 'POST', '/api/okr/sysRecord/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769289, '获取标签列表', 'POST', '/api/okr/tag/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769290, '增加标签', 'POST', '/api/okr/tag/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769291, '更新标签', 'POST', '/api/okr/tag/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769292, '获取标签', 'GET', '/api/okr/tag/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769293, '删除标签', 'GET', '/api/okr/tag/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769294, '根据用户名选择用户', 'GET', '/api/okr/user/queryByUsername', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769295, '注册用户', 'POST', '/api/okr/user/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769296, '查询用户列表', 'POST', '/api/okr/user/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769297, '修改密码', 'POST', '/api/okr/user/changePassword', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769298, '获取用户信息', 'GET', '/api/okr/user/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769299, '上传头像文件', 'POST', '/api/okr/user/changeImg', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769300, '获取用户权限信息', 'GET', '/api/okr/user/queryRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769301, '删除用户', 'GET', '/api/okr/user/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384769302, '更新用户信息', 'POST', '/api/okr/user/change', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769303, '更新用户权限', 'POST', '/api/okr/user/changeRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384769304, '修改成员的角色权限', 'POST', '/api/okr/userRole/grant', 'superAdmin', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL COMMENT '角色id，主键，越高权限越少',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'superAdmin', '超级管理');
INSERT INTO `role` VALUES (2, 'admin', '管理员');
INSERT INTO `role` VALUES (3, 'user', '普通用户');
INSERT INTO `role` VALUES (4, 'common', '任何请求');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6751 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (6708, 3, 1001);
INSERT INTO `role_menu` VALUES (6709, 3, 1002);
INSERT INTO `role_menu` VALUES (6710, 3, 1003);
INSERT INTO `role_menu` VALUES (6711, 3, 2000);
INSERT INTO `role_menu` VALUES (6712, 3, 2001);
INSERT INTO `role_menu` VALUES (6713, 3, 2002);
INSERT INTO `role_menu` VALUES (6714, 3, 3000);
INSERT INTO `role_menu` VALUES (6715, 3, 3001);
INSERT INTO `role_menu` VALUES (6716, 3, 3002);
INSERT INTO `role_menu` VALUES (6717, 3, 4000);
INSERT INTO `role_menu` VALUES (6718, 3, 4001);
INSERT INTO `role_menu` VALUES (6719, 2, 1001);
INSERT INTO `role_menu` VALUES (6720, 2, 1002);
INSERT INTO `role_menu` VALUES (6721, 2, 1003);
INSERT INTO `role_menu` VALUES (6722, 2, 2000);
INSERT INTO `role_menu` VALUES (6723, 2, 2001);
INSERT INTO `role_menu` VALUES (6724, 2, 2002);
INSERT INTO `role_menu` VALUES (6725, 2, 3000);
INSERT INTO `role_menu` VALUES (6726, 2, 3001);
INSERT INTO `role_menu` VALUES (6727, 2, 3002);
INSERT INTO `role_menu` VALUES (6728, 2, 4000);
INSERT INTO `role_menu` VALUES (6729, 2, 4001);
INSERT INTO `role_menu` VALUES (6730, 2, 5000);
INSERT INTO `role_menu` VALUES (6731, 2, 5001);
INSERT INTO `role_menu` VALUES (6732, 2, 5002);
INSERT INTO `role_menu` VALUES (6733, 2, 5003);
INSERT INTO `role_menu` VALUES (6734, 2, 5004);
INSERT INTO `role_menu` VALUES (6735, 1, 1001);
INSERT INTO `role_menu` VALUES (6736, 1, 1002);
INSERT INTO `role_menu` VALUES (6737, 1, 1003);
INSERT INTO `role_menu` VALUES (6738, 1, 2000);
INSERT INTO `role_menu` VALUES (6739, 1, 2001);
INSERT INTO `role_menu` VALUES (6740, 1, 2002);
INSERT INTO `role_menu` VALUES (6741, 1, 3000);
INSERT INTO `role_menu` VALUES (6742, 1, 3001);
INSERT INTO `role_menu` VALUES (6743, 1, 3002);
INSERT INTO `role_menu` VALUES (6744, 1, 4000);
INSERT INTO `role_menu` VALUES (6745, 1, 4001);
INSERT INTO `role_menu` VALUES (6746, 1, 5000);
INSERT INTO `role_menu` VALUES (6747, 1, 5001);
INSERT INTO `role_menu` VALUES (6748, 1, 5002);
INSERT INTO `role_menu` VALUES (6749, 1, 5003);
INSERT INTO `role_menu` VALUES (6750, 1, 5004);

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `resource_id` bigint(11) NOT NULL COMMENT '资源id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43810 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (43657, 4, 1467896460384769257);
INSERT INTO `role_resource` VALUES (43658, 4, 1467896460384769256);
INSERT INTO `role_resource` VALUES (43659, 4, 1467896460384769279);
INSERT INTO `role_resource` VALUES (43660, 4, 1467896460384769255);
INSERT INTO `role_resource` VALUES (43661, 4, 1467896460384769286);
INSERT INTO `role_resource` VALUES (43662, 4, 1467896460384769284);
INSERT INTO `role_resource` VALUES (43663, 3, 1467896460384769247);
INSERT INTO `role_resource` VALUES (43664, 3, 1467896460384769299);
INSERT INTO `role_resource` VALUES (43665, 3, 1467896460384769298);
INSERT INTO `role_resource` VALUES (43666, 3, 1467896460384769297);
INSERT INTO `role_resource` VALUES (43667, 3, 1467896460384769296);
INSERT INTO `role_resource` VALUES (43668, 3, 1467896460384769303);
INSERT INTO `role_resource` VALUES (43669, 3, 1467896460384769302);
INSERT INTO `role_resource` VALUES (43670, 3, 1467896460384769300);
INSERT INTO `role_resource` VALUES (43671, 3, 1467896460384769289);
INSERT INTO `role_resource` VALUES (43672, 3, 1467896460384769294);
INSERT INTO `role_resource` VALUES (43673, 3, 1467896460384769286);
INSERT INTO `role_resource` VALUES (43674, 3, 1467896460384769284);
INSERT INTO `role_resource` VALUES (43675, 3, 1467896460384769273);
INSERT INTO `role_resource` VALUES (43676, 3, 1467896460384769272);
INSERT INTO `role_resource` VALUES (43677, 3, 1467896460384769279);
INSERT INTO `role_resource` VALUES (43678, 3, 1467896460384769278);
INSERT INTO `role_resource` VALUES (43679, 3, 1467896460384769277);
INSERT INTO `role_resource` VALUES (43680, 3, 1467896460384769276);
INSERT INTO `role_resource` VALUES (43681, 3, 1467896460384769270);
INSERT INTO `role_resource` VALUES (43682, 3, 1467896460384769259);
INSERT INTO `role_resource` VALUES (43683, 3, 1467896460384769258);
INSERT INTO `role_resource` VALUES (43684, 3, 1467896460384769257);
INSERT INTO `role_resource` VALUES (43685, 3, 1467896460384769256);
INSERT INTO `role_resource` VALUES (43686, 3, 1467896460384769263);
INSERT INTO `role_resource` VALUES (43687, 3, 1467896460384769262);
INSERT INTO `role_resource` VALUES (43688, 3, 1467896460384769261);
INSERT INTO `role_resource` VALUES (43689, 3, 1467896460384769260);
INSERT INTO `role_resource` VALUES (43690, 3, 1467896460384769248);
INSERT INTO `role_resource` VALUES (43691, 3, 1467896460384769255);
INSERT INTO `role_resource` VALUES (43692, 3, 1467896460384769254);
INSERT INTO `role_resource` VALUES (43693, 2, 1467896460384769299);
INSERT INTO `role_resource` VALUES (43694, 2, 1467896460384769298);
INSERT INTO `role_resource` VALUES (43695, 2, 1467896460384769297);
INSERT INTO `role_resource` VALUES (43696, 2, 1467896460384769296);
INSERT INTO `role_resource` VALUES (43697, 2, 1467896460384769303);
INSERT INTO `role_resource` VALUES (43698, 2, 1467896460384769302);
INSERT INTO `role_resource` VALUES (43699, 2, 1467896460384769301);
INSERT INTO `role_resource` VALUES (43700, 2, 1467896460384769300);
INSERT INTO `role_resource` VALUES (43701, 2, 1467896460384769291);
INSERT INTO `role_resource` VALUES (43702, 2, 1467896460384769290);
INSERT INTO `role_resource` VALUES (43703, 2, 1467896460384769289);
INSERT INTO `role_resource` VALUES (43704, 2, 1467896460384769288);
INSERT INTO `role_resource` VALUES (43705, 2, 1467896460384769295);
INSERT INTO `role_resource` VALUES (43706, 2, 1467896460384769294);
INSERT INTO `role_resource` VALUES (43707, 2, 1467896460384769293);
INSERT INTO `role_resource` VALUES (43708, 2, 1467896460384769292);
INSERT INTO `role_resource` VALUES (43709, 2, 1467896460384769283);
INSERT INTO `role_resource` VALUES (43710, 2, 1467896460384769282);
INSERT INTO `role_resource` VALUES (43711, 2, 1467896460384769281);
INSERT INTO `role_resource` VALUES (43712, 2, 1467896460384769280);
INSERT INTO `role_resource` VALUES (43713, 2, 1467896460384769287);
INSERT INTO `role_resource` VALUES (43714, 2, 1467896460384769286);
INSERT INTO `role_resource` VALUES (43715, 2, 1467896460384769285);
INSERT INTO `role_resource` VALUES (43716, 2, 1467896460384769284);
INSERT INTO `role_resource` VALUES (43717, 2, 1467896460384769247);
INSERT INTO `role_resource` VALUES (43718, 2, 1467896460384769246);
INSERT INTO `role_resource` VALUES (43719, 2, 1467896460384769275);
INSERT INTO `role_resource` VALUES (43720, 2, 1467896460384769274);
INSERT INTO `role_resource` VALUES (43721, 2, 1467896460384769273);
INSERT INTO `role_resource` VALUES (43722, 2, 1467896460384769272);
INSERT INTO `role_resource` VALUES (43723, 2, 1467896460384769279);
INSERT INTO `role_resource` VALUES (43724, 2, 1467896460384769278);
INSERT INTO `role_resource` VALUES (43725, 2, 1467896460384769277);
INSERT INTO `role_resource` VALUES (43726, 2, 1467896460384769276);
INSERT INTO `role_resource` VALUES (43727, 2, 1467896460384769267);
INSERT INTO `role_resource` VALUES (43728, 2, 1467896460384769266);
INSERT INTO `role_resource` VALUES (43729, 2, 1467896460384769265);
INSERT INTO `role_resource` VALUES (43730, 2, 1467896460384769264);
INSERT INTO `role_resource` VALUES (43731, 2, 1467896460384769271);
INSERT INTO `role_resource` VALUES (43732, 2, 1467896460384769270);
INSERT INTO `role_resource` VALUES (43733, 2, 1467896460384769269);
INSERT INTO `role_resource` VALUES (43734, 2, 1467896460384769268);
INSERT INTO `role_resource` VALUES (43735, 2, 1467896460384769259);
INSERT INTO `role_resource` VALUES (43736, 2, 1467896460384769258);
INSERT INTO `role_resource` VALUES (43737, 2, 1467896460384769257);
INSERT INTO `role_resource` VALUES (43738, 2, 1467896460384769256);
INSERT INTO `role_resource` VALUES (43739, 2, 1467896460384769263);
INSERT INTO `role_resource` VALUES (43740, 2, 1467896460384769262);
INSERT INTO `role_resource` VALUES (43741, 2, 1467896460384769261);
INSERT INTO `role_resource` VALUES (43742, 2, 1467896460384769260);
INSERT INTO `role_resource` VALUES (43743, 2, 1467896460384769251);
INSERT INTO `role_resource` VALUES (43744, 2, 1467896460384769250);
INSERT INTO `role_resource` VALUES (43745, 2, 1467896460384769249);
INSERT INTO `role_resource` VALUES (43746, 2, 1467896460384769248);
INSERT INTO `role_resource` VALUES (43747, 2, 1467896460384769255);
INSERT INTO `role_resource` VALUES (43748, 2, 1467896460384769254);
INSERT INTO `role_resource` VALUES (43749, 2, 1467896460384769253);
INSERT INTO `role_resource` VALUES (43750, 2, 1467896460384769252);
INSERT INTO `role_resource` VALUES (43751, 1, 1467896460384769304);
INSERT INTO `role_resource` VALUES (43752, 1, 1467896460384769299);
INSERT INTO `role_resource` VALUES (43753, 1, 1467896460384769298);
INSERT INTO `role_resource` VALUES (43754, 1, 1467896460384769297);
INSERT INTO `role_resource` VALUES (43755, 1, 1467896460384769296);
INSERT INTO `role_resource` VALUES (43756, 1, 1467896460384769303);
INSERT INTO `role_resource` VALUES (43757, 1, 1467896460384769302);
INSERT INTO `role_resource` VALUES (43758, 1, 1467896460384769301);
INSERT INTO `role_resource` VALUES (43759, 1, 1467896460384769300);
INSERT INTO `role_resource` VALUES (43760, 1, 1467896460384769291);
INSERT INTO `role_resource` VALUES (43761, 1, 1467896460384769290);
INSERT INTO `role_resource` VALUES (43762, 1, 1467896460384769289);
INSERT INTO `role_resource` VALUES (43763, 1, 1467896460384769288);
INSERT INTO `role_resource` VALUES (43764, 1, 1467896460384769295);
INSERT INTO `role_resource` VALUES (43765, 1, 1467896460384769294);
INSERT INTO `role_resource` VALUES (43766, 1, 1467896460384769293);
INSERT INTO `role_resource` VALUES (43767, 1, 1467896460384769292);
INSERT INTO `role_resource` VALUES (43768, 1, 1467896460384769283);
INSERT INTO `role_resource` VALUES (43769, 1, 1467896460384769282);
INSERT INTO `role_resource` VALUES (43770, 1, 1467896460384769281);
INSERT INTO `role_resource` VALUES (43771, 1, 1467896460384769280);
INSERT INTO `role_resource` VALUES (43772, 1, 1467896460384769287);
INSERT INTO `role_resource` VALUES (43773, 1, 1467896460384769286);
INSERT INTO `role_resource` VALUES (43774, 1, 1467896460384769285);
INSERT INTO `role_resource` VALUES (43775, 1, 1467896460384769284);
INSERT INTO `role_resource` VALUES (43776, 1, 1467896460384769247);
INSERT INTO `role_resource` VALUES (43777, 1, 1467896460384769246);
INSERT INTO `role_resource` VALUES (43778, 1, 1467896460384769275);
INSERT INTO `role_resource` VALUES (43779, 1, 1467896460384769274);
INSERT INTO `role_resource` VALUES (43780, 1, 1467896460384769273);
INSERT INTO `role_resource` VALUES (43781, 1, 1467896460384769272);
INSERT INTO `role_resource` VALUES (43782, 1, 1467896460384769279);
INSERT INTO `role_resource` VALUES (43783, 1, 1467896460384769278);
INSERT INTO `role_resource` VALUES (43784, 1, 1467896460384769277);
INSERT INTO `role_resource` VALUES (43785, 1, 1467896460384769276);
INSERT INTO `role_resource` VALUES (43786, 1, 1467896460384769267);
INSERT INTO `role_resource` VALUES (43787, 1, 1467896460384769266);
INSERT INTO `role_resource` VALUES (43788, 1, 1467896460384769265);
INSERT INTO `role_resource` VALUES (43789, 1, 1467896460384769264);
INSERT INTO `role_resource` VALUES (43790, 1, 1467896460384769271);
INSERT INTO `role_resource` VALUES (43791, 1, 1467896460384769270);
INSERT INTO `role_resource` VALUES (43792, 1, 1467896460384769269);
INSERT INTO `role_resource` VALUES (43793, 1, 1467896460384769268);
INSERT INTO `role_resource` VALUES (43794, 1, 1467896460384769259);
INSERT INTO `role_resource` VALUES (43795, 1, 1467896460384769258);
INSERT INTO `role_resource` VALUES (43796, 1, 1467896460384769257);
INSERT INTO `role_resource` VALUES (43797, 1, 1467896460384769256);
INSERT INTO `role_resource` VALUES (43798, 1, 1467896460384769263);
INSERT INTO `role_resource` VALUES (43799, 1, 1467896460384769262);
INSERT INTO `role_resource` VALUES (43800, 1, 1467896460384769261);
INSERT INTO `role_resource` VALUES (43801, 1, 1467896460384769260);
INSERT INTO `role_resource` VALUES (43802, 1, 1467896460384769251);
INSERT INTO `role_resource` VALUES (43803, 1, 1467896460384769250);
INSERT INTO `role_resource` VALUES (43804, 1, 1467896460384769249);
INSERT INTO `role_resource` VALUES (43805, 1, 1467896460384769248);
INSERT INTO `role_resource` VALUES (43806, 1, 1467896460384769255);
INSERT INTO `role_resource` VALUES (43807, 1, 1467896460384769254);
INSERT INTO `role_resource` VALUES (43808, 1, 1467896460384769253);
INSERT INTO `role_resource` VALUES (43809, 1, 1467896460384769252);

-- ----------------------------
-- Table structure for sign_up
-- ----------------------------
DROP TABLE IF EXISTS `sign_up`;
CREATE TABLE `sign_up`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign_up
-- ----------------------------
INSERT INTO `sign_up` VALUES (2, '18110571234', '程成', '男', '501966782', '信管本2002', '熟悉golang。Java。cpp。vue。熟悉开源社区。github.com/devhg。熟悉Linux   ', 1, '你太牛逼啦', NULL, '2021-12-12 22:01:39');
INSERT INTO `sign_up` VALUES (3, '19111405056', '杨叶江', '男', '424133224', '工商1902', '目前属于基础检查，目标方向是为了能运用Python进行数据分析等，无项目经历。\n竞赛主要有省级三项，校级奖项若干', 1, '是的先生', NULL, '2021-12-12 22:02:04');
INSERT INTO `sign_up` VALUES (4, '19111407001', '宣佳栋', '男', '1413452856', '市销1901', '       在思想方面，本人理想信念坚定，积极向党组织靠拢。\n       在工作方面，担任班级学习委员，青年服务部工作人员，课程助理，市销2001班带班，积极为老师排忧解难。\n       在学习方面，学习认真努力，成绩优异，当前学业成绩和综合测评成绩均位于专业第一位，被授予校级“优秀学生”、“优秀共青团员”等称号，并获得校级二等奖学金。\n       在比赛方面，积极参加大型比赛，曾获：\n1.全国花间校园街坊总站国家级优秀奖\n2.“尖峰时刻”全球案例大赛省级一等奖\n3.全国大学生工程训练综合能力竞赛省级二等奖\n4.全国大学生市场调查与分析大赛省级三等奖\n5.“挑战杯”大学生课外学术科技作品大赛校级三等奖\n6.淄博市“创意青春 智赢未来”营销方案设计大赛市级二等奖\n7.山东理工大学青春踏歌行合唱比赛校级特等奖\n8.第一届山东理工大学创新方法应用大赛校级三等奖\n9.山东理工大学大学生科技创新大赛校级三等奖\n10.山东理工大学青年创客挑战赛校级优秀奖\n11.第三届全国管理模拟决策大赛校级三等奖\n12.第四届全国管理模拟决策大赛校级二等奖\n13.“庆国庆 青年行”爱国寻图比赛校级一等奖\n14.全国大学生电子商务“创新 创意 创业”挑战赛校级二等奖\n       在社会实践方面，两次获得社会实践校级奖项，被授予“社会实践先进个人”称号。\n       在科研成果方面，跟随导师进行小农户与现代化衔接方面的研究，自学SPSS分析、Java和citespace，并主持校级立项一项。\n', 2, '小庙难容大佛', NULL, '2021-12-12 22:02:20');
INSERT INTO `sign_up` VALUES (5, '19111408015', '孙淼', '男', '1873365757', '信管1901', 'JAVA浅层次内容完成\nSQL语句浅层次\n周一上午\n周二晚上\n周三晚上\n周四下午晚上\n周五晚上', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (6, '19111408022', '杨光秋', '男', '1980820857', '信管1901', '1.现在在学java，感觉java想要深入掌握，是需要有专业老师教授。所以在专业课教学java语言和SQL Server，我希望能够通过信息技术实验室能另外掌握重要的python语言和c语言。\n\n2.我的目标是希望能够毕业掌握java语言，精通python语言和c语言，能够学到可以单人开发一些小项目小程序，能够有能力成为大项目开发团队的一员，甚至作为大项目开发经理。\n\n3.已经学完java语言基础、流程控制、数组与字符串（数据结构与算法分析学习完线性表、栈和队列）和Mysql的基础。\n接下去几周学习java语言类特性，继承、抽象类、接口和枚举，异常处理，java语言的输入输出与文件处理等，相关数据结构与算法分析，学习完mysql的基础内容。\n', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (7, '19111408041', '曹渊博', '男', '2985958099', '信管1902', '目前java学完多线程，下一步想学一下算法，前端想再放一放在学，大二学生会也能退了之后就好好学习去了，实验室大概一个星期能去四次左右', 1, '是的先生', NULL, '2021-12-13 00:36:28');
INSERT INTO `sign_up` VALUES (8, '19111493015', '卢玉栋', '男', '2191387440', '信管本1901', '学了java流程控制，包括分支结构，循环结构，和跳转语句。定义数组与字符串。了解类，java输入输出与文件处理，学习了使用sql语句进行数据库管理，表的管理和应用，想从事大数据开发\n每周有时间就可以去实验室，白天有课，每天晚上可以去，周末', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (9, '19111493055', '陈建军', '男', '1727072639', '信管本1902', '了解Java、C、Python，了解SSM,SpringBoot框架，了解数据库的使用，会使用Git上传项目，会简单使用Linux操作系统，了解Docker容器，会使用ElasticSearch和Redis，了解Hadoop框架。\n目标方向是JavaWeb开发\n项目经历：1、微小型跨组织人才管理系统 2、绿色低碳出行微信小程序 3、员工管理系统\nCSDN: https://blog.csdn.net/qq_40266349?spm=1000.2115.3001.5343\nGitHub: https://github.com/JackYangyang0\n获奖：第六届节能减排社会实践与科技竞赛校二等奖且进入国赛', 1, '叽里咕噜', NULL, '2021-12-15 01:22:53');
INSERT INTO `sign_up` VALUES (10, '19111493063', '王金浩', '男', '1253912723', '信管本1902', '大一学期专业课学过Java，上下学期考试均90分以上。基本例题都基本掌握。对python 感兴趣，目前已经开始学习！加入实验室的目的是想跟同学们一起交流学习，做一些创新性的事情。', 2, '综合很好', NULL, '2021-12-15 00:46:36');
INSERT INTO `sign_up` VALUES (11, '19121406076', '王若冰', '女', '872184581', '工业1902', '目前初次接触python，系统学过计算机导论，熟悉较为简单的mathematica，接触过MATLAB，目标方向数据分析、算法优化，已取得四级证书、计算机二级证，大英赛二等奖，山东省数学竞赛三等奖，参与多项创新创业类竞赛，负责大创项目一项，对计算机软件学习保有热情，希望进步', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (12, '19121408037', '蔡春雨', '女', '1723612044', '信管1901', '获得计算机二级证书mysql数据库程序设计', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (13, '19121408074', '唐境锶', '女', '1945938350', '信管1902', '学过一些HTMLcssjs java mysql sqlsever 不是很厉害的那种程度 周四周天', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (14, '19121408075', '王梦瑶', '女', '1486102538', '信管1902', '目前掌握java的控制语句和方法内容，在进一步学习中，目标是能有自主开发编写程序的能力，暂无项目经历\n通过b站的java相关视频和csdn的相关知识自学', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (15, '19121493034', '贾聪聪', '女', '1541163933', '信管本1901', '自学Java', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (17, '20111405008', '刘浩伟', '男', '209478845', '工商2002', '我擅长C语言和一些基础算法，做一些算法题目，并且自学了数据结构(不过还没学完)，未来的目标是学习完数据结构和一些算法后，学习一些前端知识和计网知识，增加自己的技术面。除此之外，我也想参加一些比赛，如算法竞赛，关于计算机的比赛等，开阔自己的眼界。个人博客地址: https://blog.csdn.net/weixin_55812984。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (18, '20111407001', '周洪燊', '男', '2160915425', '市销2002', '自己对于编程掌握的不是很多，但是最近一直在学习python，对于python的一些基本规则和一些函数都有所了解掌握；自己目标方向就是可以全面地掌握编程，对于编程不同的种类技术都有所了解；自己没有什么项目经历，属于刚学编程的小白，但是自己可以学习，也相信自己会逐渐精通编程；自己的自学能力还算可以，对于新知识学得还算比较快，对于理科的一些知识学得会更快，理解得也会更快，因此我相信我会很快地融入到这个集体。', 2, '咚咚恰', NULL, '2021-12-13 00:42:40');
INSERT INTO `sign_up` VALUES (19, '20111408012', '张义龙', '男', '568933962', '信管2002班', '个人暂时为java萌新，想学好java，暂时在刷山理工的oj和看哔站的教程，接触过citespace所以自己也想用java做出一个程序(如游戏)。对编程感兴趣，愿意去主动找到更多的资源去学习，让自己成长。去实验室的时间是周四周五下午可以去，下晚自习可以去。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (20, '20111408016', '马元麒', '男', '2804120991', '信管2002', '上学期学了HTML5、CSS、JS等等前端知识，已经会熟练制作静态网页，能对于一个现成的网页进行重新修改，并且学习了PHP，会对数据库进行基础操作，在寒假期间用php以及前端知识做出了自己的博客，可以实现增删改查，注册、登录、分页等等，但是还在本地保留，没有放到网站上（没有进行美化，太丑了）我也是青春在线程序部常驻志愿者，在那学习后端，laravel框架，网站构建知识，在寒假期间也参加了一个学长带队的互联网➕项目，在那里负责前端页面制作美化等等。我也学习java，前段时间刷了山东理工oj上的120多道题目，但是最近没做，最近一直在看bootstrape和js动态网页的制作，做了一个简单实时判断输入框输入内容长度的注册页面，准备再看看移动端网页适配的问题，我周一到周五晚上都可以去，周六在西校程序部培训学习，周天可能去西校做前端或者学网站搭建。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (21, '20111408050', '张森', '男', '1741927235', '信管2001', 'Language：Java, html, C（正在学）\nTarget：1.熟练运用Java和C,可以参加项目设计\n             2.深入学习算法和数据结构\n             3.可以独立制作，参加有水平的比赛\nTime：每天都能来实验室自习；\n           有课时如没特殊情况至少每晚都能来；\n           \n            ', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (22, '20121408020', '万蝶依', '女', '2433215310', '信管2002', '学习JAVA语言，在acm上做一些实验题，现在做到130道题目，对于编程有非常基础的了解，比较感兴趣，想要更加深入的了解编程的应用，将其快速的应用到现实中。寒假中对数据的处理有了一点点的了解。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (23, '20121408022', '韩雨欣', '女', '3240261856', '信息管理与信息系统专业2002', '目标熟练掌握JAVA。学习数据库', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (24, '20121408029', '曹雪', '女', '1369240484', '信管2002', '1.熟悉Java语言，有一定的Java基础。\n2.了解c语言，HTML，PHP，曾与伙伴合作写过一个网页。\n3.目前正在自学算法，数据结构，计算机组成原理。\n4.目标方向是web前后端开发(全栈)。\n', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (25, '20121408039', '李贝贝', '女', '1410851521', '信管2002', '具有一定的自学能力，对制作网页及app具有较强的学习兴趣。希望自己可以独立制作出一个网页，或是app', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (26, '20121408061', '张玉洁', '女', '2889770573', '信管2001', '现在是大一阶段，正在学习Java、C编程语言，接触了前端HTML CSS，有一定的自学能力，目前还没有比较明确的目标方向，对编程感兴趣，准备继续学习数据结构及算法方面的知识，渴望与志同道合的小伙伴一起交流学习。如果能加入实验室大家庭，我应该每天都会来实验室学习。', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (27, '20121408071', '曹琪', '女', '1138576292', '信管2001', '对计算机方向很感兴趣，想要进一步了解前端技术。虽然目前技术还处于基础阶段，但是我会很努力的。\n(去实验室的时间:只要是我没课的时候都可以去，包括假期我也都是留校)', 0, NULL, NULL, NULL);
INSERT INTO `sign_up` VALUES (28, '20121493080', '葛越荷', '女', '1787738998', '信管本2001', '主要学习JAVA相关知识，会不断复习学过的JAVA知识，并且开始学习一部分c语言知识。希望以后在研究生阶段进行学习软件开发的方向，所以会在大学开始就为考试做准备。', 0, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_record`;
CREATE TABLE `sys_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问资源路径',
  `username` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `duration` int(11) NULL DEFAULT NULL COMMENT '用时 单位ms',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5848 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES (4440, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-07 01:34:04', 20);
INSERT INTO `sys_record` VALUES (4441, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-07 01:34:07', 18);
INSERT INTO `sys_record` VALUES (4442, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:34:22', 4);
INSERT INTO `sys_record` VALUES (4443, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:35:20', 11);
INSERT INTO `sys_record` VALUES (4444, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:38:30', 6);
INSERT INTO `sys_record` VALUES (4445, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:40:08', 3);
INSERT INTO `sys_record` VALUES (4446, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:40:35', 2);
INSERT INTO `sys_record` VALUES (4447, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:44:04', 8);
INSERT INTO `sys_record` VALUES (4448, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:06', 10);
INSERT INTO `sys_record` VALUES (4449, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:39', 9);
INSERT INTO `sys_record` VALUES (4450, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:45:45', 4);
INSERT INTO `sys_record` VALUES (4451, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 01:48:02', 4);
INSERT INTO `sys_record` VALUES (4452, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-07 23:11:32', 1951);
INSERT INTO `sys_record` VALUES (4453, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-07 23:56:23', 172);
INSERT INTO `sys_record` VALUES (4454, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-07 23:57:46', 9);
INSERT INTO `sys_record` VALUES (4455, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:01:11', 2);
INSERT INTO `sys_record` VALUES (4456, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 00:01:11', 9);
INSERT INTO `sys_record` VALUES (4457, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 00:01:34', 2);
INSERT INTO `sys_record` VALUES (4458, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 00:01:34', 2);
INSERT INTO `sys_record` VALUES (4459, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-08 00:01:50', 7066);
INSERT INTO `sys_record` VALUES (4460, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 00:01:50', 7);
INSERT INTO `sys_record` VALUES (4461, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:02:59', 1556);
INSERT INTO `sys_record` VALUES (4462, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:05:20', 9039);
INSERT INTO `sys_record` VALUES (4463, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:09:26', 6932);
INSERT INTO `sys_record` VALUES (4464, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:14:43', 7);
INSERT INTO `sys_record` VALUES (4465, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:14:56', 4);
INSERT INTO `sys_record` VALUES (4466, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:16:33', 4);
INSERT INTO `sys_record` VALUES (4467, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:16:42', 5);
INSERT INTO `sys_record` VALUES (4468, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:18:41', 12);
INSERT INTO `sys_record` VALUES (4469, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:19:55', 10);
INSERT INTO `sys_record` VALUES (4470, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:20:00', 2);
INSERT INTO `sys_record` VALUES (4471, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:21:53', 6);
INSERT INTO `sys_record` VALUES (4472, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:23:56', 12);
INSERT INTO `sys_record` VALUES (4473, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:24:57', 1);
INSERT INTO `sys_record` VALUES (4474, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:26:28', 2);
INSERT INTO `sys_record` VALUES (4475, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:26:56', 1);
INSERT INTO `sys_record` VALUES (4476, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:27:27', 1);
INSERT INTO `sys_record` VALUES (4477, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:28:05', 4);
INSERT INTO `sys_record` VALUES (4478, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:28:05', 5);
INSERT INTO `sys_record` VALUES (4479, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:29:02', 3);
INSERT INTO `sys_record` VALUES (4480, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:29:02', 5);
INSERT INTO `sys_record` VALUES (4481, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:29:15', 4);
INSERT INTO `sys_record` VALUES (4482, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:31:30', 51);
INSERT INTO `sys_record` VALUES (4483, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:30', 35);
INSERT INTO `sys_record` VALUES (4484, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:32', 7);
INSERT INTO `sys_record` VALUES (4485, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:33', 4);
INSERT INTO `sys_record` VALUES (4486, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:36', 3);
INSERT INTO `sys_record` VALUES (4487, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:38', 4);
INSERT INTO `sys_record` VALUES (4488, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:40', 4);
INSERT INTO `sys_record` VALUES (4489, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:31:42', 3);
INSERT INTO `sys_record` VALUES (4490, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:33:37', 4);
INSERT INTO `sys_record` VALUES (4491, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:34:46', 2);
INSERT INTO `sys_record` VALUES (4492, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:34:46', 5);
INSERT INTO `sys_record` VALUES (4493, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:36:02', 2);
INSERT INTO `sys_record` VALUES (4494, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:36:02', 4);
INSERT INTO `sys_record` VALUES (4495, '模糊查询专业列表', '/api/okr/enum/major', 'admin', '127.0.0.1', '2021-12-08 00:37:26', 6);
INSERT INTO `sys_record` VALUES (4496, '模糊查询姓名列表', '/api/okr/enum/name', 'admin', '127.0.0.1', '2021-12-08 00:37:28', 2);
INSERT INTO `sys_record` VALUES (4497, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:40:20', 7);
INSERT INTO `sys_record` VALUES (4498, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:42:35', 5);
INSERT INTO `sys_record` VALUES (4499, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:45:04', 5);
INSERT INTO `sys_record` VALUES (4500, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:01', 2);
INSERT INTO `sys_record` VALUES (4501, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:09', 2);
INSERT INTO `sys_record` VALUES (4502, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:53:11', 2);
INSERT INTO `sys_record` VALUES (4503, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:53:11', 2);
INSERT INTO `sys_record` VALUES (4504, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:54:57', 11);
INSERT INTO `sys_record` VALUES (4505, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 00:55:16', 2);
INSERT INTO `sys_record` VALUES (4506, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:55:16', 6);
INSERT INTO `sys_record` VALUES (4507, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:03', 6);
INSERT INTO `sys_record` VALUES (4508, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:21', 1);
INSERT INTO `sys_record` VALUES (4509, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:23', 2);
INSERT INTO `sys_record` VALUES (4510, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:23', 2);
INSERT INTO `sys_record` VALUES (4511, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:24', 4);
INSERT INTO `sys_record` VALUES (4512, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 00:56:50', 3);
INSERT INTO `sys_record` VALUES (4513, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:56:57', 4);
INSERT INTO `sys_record` VALUES (4514, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:03', 2);
INSERT INTO `sys_record` VALUES (4515, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:06', 4);
INSERT INTO `sys_record` VALUES (4516, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:57:10', 4);
INSERT INTO `sys_record` VALUES (4517, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:58:26', 10);
INSERT INTO `sys_record` VALUES (4518, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 00:58:30', 3);
INSERT INTO `sys_record` VALUES (4519, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:15', 4);
INSERT INTO `sys_record` VALUES (4520, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:28', 3);
INSERT INTO `sys_record` VALUES (4521, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:29', 6);
INSERT INTO `sys_record` VALUES (4522, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 01:15:33', 1);
INSERT INTO `sys_record` VALUES (4523, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-08 01:15:35', 1);
INSERT INTO `sys_record` VALUES (4524, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:36', 4);
INSERT INTO `sys_record` VALUES (4525, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:15:44', 2);
INSERT INTO `sys_record` VALUES (4526, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-08 01:16:03', 5);
INSERT INTO `sys_record` VALUES (4527, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:27:42', 29);
INSERT INTO `sys_record` VALUES (4528, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:46', 2);
INSERT INTO `sys_record` VALUES (4529, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:27:47', 0);
INSERT INTO `sys_record` VALUES (4530, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:50', 1);
INSERT INTO `sys_record` VALUES (4531, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:52', 1);
INSERT INTO `sys_record` VALUES (4532, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:27:53', 0);
INSERT INTO `sys_record` VALUES (4533, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:53', 1);
INSERT INTO `sys_record` VALUES (4534, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:27:56', 1);
INSERT INTO `sys_record` VALUES (4535, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:28:05', 1);
INSERT INTO `sys_record` VALUES (4536, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:32:33', 1);
INSERT INTO `sys_record` VALUES (4537, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:32:33', 10);
INSERT INTO `sys_record` VALUES (4538, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:32:35', 2);
INSERT INTO `sys_record` VALUES (4539, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:32:36', 0);
INSERT INTO `sys_record` VALUES (4540, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:33:45', 1);
INSERT INTO `sys_record` VALUES (4541, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:33:45', 8);
INSERT INTO `sys_record` VALUES (4542, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:14', 1);
INSERT INTO `sys_record` VALUES (4543, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:15', 0);
INSERT INTO `sys_record` VALUES (4544, '根据账号选择用户', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 01:34:17', 1);
INSERT INTO `sys_record` VALUES (4545, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 01:34:17', 6);
INSERT INTO `sys_record` VALUES (4546, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:19', 2);
INSERT INTO `sys_record` VALUES (4547, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:19', 0);
INSERT INTO `sys_record` VALUES (4548, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:22', 2);
INSERT INTO `sys_record` VALUES (4549, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:27', 2);
INSERT INTO `sys_record` VALUES (4550, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:30', 1);
INSERT INTO `sys_record` VALUES (4551, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:34:36', 1);
INSERT INTO `sys_record` VALUES (4552, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:34:37', 0);
INSERT INTO `sys_record` VALUES (4553, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-08 01:35:33', 1);
INSERT INTO `sys_record` VALUES (4554, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 01:35:33', 0);
INSERT INTO `sys_record` VALUES (4555, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-08 23:55:17', 112);
INSERT INTO `sys_record` VALUES (4556, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-08 23:55:19', 2176);
INSERT INTO `sys_record` VALUES (4557, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-08 23:55:25', 258);
INSERT INTO `sys_record` VALUES (4558, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-08 23:55:26', 14);
INSERT INTO `sys_record` VALUES (4559, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:27', 4);
INSERT INTO `sys_record` VALUES (4560, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-08 23:55:31', 2);
INSERT INTO `sys_record` VALUES (4561, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:32', 0);
INSERT INTO `sys_record` VALUES (4562, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-08 23:55:36', 0);
INSERT INTO `sys_record` VALUES (4563, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 00:01:53', 32);
INSERT INTO `sys_record` VALUES (4564, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 00:01:53', 45);
INSERT INTO `sys_record` VALUES (4565, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:01:55', 16);
INSERT INTO `sys_record` VALUES (4566, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:01:55', 2);
INSERT INTO `sys_record` VALUES (4567, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 00:03:52', 26);
INSERT INTO `sys_record` VALUES (4568, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:54', 12);
INSERT INTO `sys_record` VALUES (4569, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:03:54', 1);
INSERT INTO `sys_record` VALUES (4570, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:56', 2);
INSERT INTO `sys_record` VALUES (4571, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 00:03:57', 0);
INSERT INTO `sys_record` VALUES (4572, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 00:03:58', 1);
INSERT INTO `sys_record` VALUES (4573, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 22:37:11', 178);
INSERT INTO `sys_record` VALUES (4574, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-09 22:37:13', 2271);
INSERT INTO `sys_record` VALUES (4575, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:39:19', 87);
INSERT INTO `sys_record` VALUES (4576, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:21', 15);
INSERT INTO `sys_record` VALUES (4577, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:39:22', 3);
INSERT INTO `sys_record` VALUES (4578, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:25', 2);
INSERT INTO `sys_record` VALUES (4579, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:39:26', 0);
INSERT INTO `sys_record` VALUES (4580, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:39:49', 489);
INSERT INTO `sys_record` VALUES (4581, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:39:49', 8);
INSERT INTO `sys_record` VALUES (4582, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:39:52', 2);
INSERT INTO `sys_record` VALUES (4583, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:40:01', 1);
INSERT INTO `sys_record` VALUES (4584, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:02', 0);
INSERT INTO `sys_record` VALUES (4585, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:07', 1);
INSERT INTO `sys_record` VALUES (4586, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:40:08', 360);
INSERT INTO `sys_record` VALUES (4587, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:40:08', 6);
INSERT INTO `sys_record` VALUES (4588, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:40:50', 3);
INSERT INTO `sys_record` VALUES (4589, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:40:54', 1);
INSERT INTO `sys_record` VALUES (4590, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-09 22:40:56', 105);
INSERT INTO `sys_record` VALUES (4591, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:40:56', 8);
INSERT INTO `sys_record` VALUES (4592, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:21', 12);
INSERT INTO `sys_record` VALUES (4593, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:43', 5);
INSERT INTO `sys_record` VALUES (4594, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:52', 5);
INSERT INTO `sys_record` VALUES (4595, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:41:56', 4);
INSERT INTO `sys_record` VALUES (4596, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:45:30', 4);
INSERT INTO `sys_record` VALUES (4597, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:45:37', 3);
INSERT INTO `sys_record` VALUES (4598, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:52:53', 6);
INSERT INTO `sys_record` VALUES (4599, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:52:55', 2);
INSERT INTO `sys_record` VALUES (4600, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:53:15', 132);
INSERT INTO `sys_record` VALUES (4601, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:53:15', 9);
INSERT INTO `sys_record` VALUES (4602, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:53:20', 3);
INSERT INTO `sys_record` VALUES (4603, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:54:12', 1);
INSERT INTO `sys_record` VALUES (4604, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:25', 9867);
INSERT INTO `sys_record` VALUES (4605, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:37', 8293);
INSERT INTO `sys_record` VALUES (4606, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:55:51', 1);
INSERT INTO `sys_record` VALUES (4607, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:56:15', 19561);
INSERT INTO `sys_record` VALUES (4608, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:56:15', 4);
INSERT INTO `sys_record` VALUES (4609, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-09 22:59:13', 33);
INSERT INTO `sys_record` VALUES (4610, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-09 22:59:14', 37);
INSERT INTO `sys_record` VALUES (4611, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-09 22:59:15', 2);
INSERT INTO `sys_record` VALUES (4612, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-09 22:59:21', 2014);
INSERT INTO `sys_record` VALUES (4613, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-09 22:59:21', 7);
INSERT INTO `sys_record` VALUES (4614, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-09 22:59:42', 7);
INSERT INTO `sys_record` VALUES (4615, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-09 23:04:19', 2);
INSERT INTO `sys_record` VALUES (4616, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-09 23:04:19', 18);
INSERT INTO `sys_record` VALUES (4617, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:16:50', 10);
INSERT INTO `sys_record` VALUES (4618, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-10 00:17:04', 9);
INSERT INTO `sys_record` VALUES (4619, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-10 00:17:05', 21);
INSERT INTO `sys_record` VALUES (4620, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-10 00:17:06', 9);
INSERT INTO `sys_record` VALUES (4621, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:17:13', 4);
INSERT INTO `sys_record` VALUES (4622, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 00:18:40', 2);
INSERT INTO `sys_record` VALUES (4623, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 00:18:40', 4);
INSERT INTO `sys_record` VALUES (4624, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 01:12:47', 3);
INSERT INTO `sys_record` VALUES (4625, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-10 01:12:49', 1283);
INSERT INTO `sys_record` VALUES (4626, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:12:50', 27);
INSERT INTO `sys_record` VALUES (4627, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:13:40', 3070);
INSERT INTO `sys_record` VALUES (4628, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:14:23', 10789);
INSERT INTO `sys_record` VALUES (4629, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:15:10', 3469);
INSERT INTO `sys_record` VALUES (4630, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 01:15:10', 26);
INSERT INTO `sys_record` VALUES (4631, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 01:15:26', 9);
INSERT INTO `sys_record` VALUES (4632, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 01:15:32', 2845);
INSERT INTO `sys_record` VALUES (4633, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 23:50:17', 121);
INSERT INTO `sys_record` VALUES (4634, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-10 23:50:19', 2042);
INSERT INTO `sys_record` VALUES (4635, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-10 23:50:23', 77);
INSERT INTO `sys_record` VALUES (4636, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:50:38', 26);
INSERT INTO `sys_record` VALUES (4637, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-10 23:50:53', 3);
INSERT INTO `sys_record` VALUES (4638, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:50:53', 11);
INSERT INTO `sys_record` VALUES (4639, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-10 23:51:26', 3);
INSERT INTO `sys_record` VALUES (4640, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:51:10', 4);
INSERT INTO `sys_record` VALUES (4641, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:51:14', 3);
INSERT INTO `sys_record` VALUES (4642, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:52:15', 4);
INSERT INTO `sys_record` VALUES (4643, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 00:54:41', 2);
INSERT INTO `sys_record` VALUES (4644, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 00:54:41', 5);
INSERT INTO `sys_record` VALUES (4645, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:06:35', 1);
INSERT INTO `sys_record` VALUES (4646, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:35', 5);
INSERT INTO `sys_record` VALUES (4647, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:37', 4);
INSERT INTO `sys_record` VALUES (4648, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:38', 4);
INSERT INTO `sys_record` VALUES (4649, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:38', 5);
INSERT INTO `sys_record` VALUES (4650, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:40', 4);
INSERT INTO `sys_record` VALUES (4651, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:06:41', 4);
INSERT INTO `sys_record` VALUES (4652, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:11:54', 3);
INSERT INTO `sys_record` VALUES (4653, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:11:54', 5);
INSERT INTO `sys_record` VALUES (4654, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:21:33', 15);
INSERT INTO `sys_record` VALUES (4655, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 01:21:36', 6);
INSERT INTO `sys_record` VALUES (4656, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:21:38', 15);
INSERT INTO `sys_record` VALUES (4657, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:21:54', 4);
INSERT INTO `sys_record` VALUES (4658, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:23:57', 9);
INSERT INTO `sys_record` VALUES (4659, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:23:57', 3);
INSERT INTO `sys_record` VALUES (4660, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 01:24:52', 12);
INSERT INTO `sys_record` VALUES (4661, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-11 01:25:20', 26475);
INSERT INTO `sys_record` VALUES (4662, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:27:19', 20629);
INSERT INTO `sys_record` VALUES (4663, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:27:53', 2);
INSERT INTO `sys_record` VALUES (4664, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:29:42', 50);
INSERT INTO `sys_record` VALUES (4665, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:29:42', 15);
INSERT INTO `sys_record` VALUES (4666, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:29:51', 4);
INSERT INTO `sys_record` VALUES (4667, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:29:59', 3);
INSERT INTO `sys_record` VALUES (4668, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:29:59', 8);
INSERT INTO `sys_record` VALUES (4669, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:30:01', 3);
INSERT INTO `sys_record` VALUES (4670, '获取资源名称', '/api/okr/resource/queryName', 'admin', '127.0.0.1', '2021-12-11 01:30:10', 2);
INSERT INTO `sys_record` VALUES (4671, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:30:56', 6);
INSERT INTO `sys_record` VALUES (4672, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:31:06', 4);
INSERT INTO `sys_record` VALUES (4673, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:31:24', 5);
INSERT INTO `sys_record` VALUES (4674, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:33:24', 2);
INSERT INTO `sys_record` VALUES (4675, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:33:24', 8);
INSERT INTO `sys_record` VALUES (4676, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:33:57', 4);
INSERT INTO `sys_record` VALUES (4677, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:03', 3);
INSERT INTO `sys_record` VALUES (4678, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:20', 4);
INSERT INTO `sys_record` VALUES (4679, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:24', 4);
INSERT INTO `sys_record` VALUES (4680, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:25', 3);
INSERT INTO `sys_record` VALUES (4681, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:36', 2);
INSERT INTO `sys_record` VALUES (4682, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:37', 3);
INSERT INTO `sys_record` VALUES (4683, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:39', 3);
INSERT INTO `sys_record` VALUES (4684, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:34:41', 3);
INSERT INTO `sys_record` VALUES (4685, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:37:25', 3770);
INSERT INTO `sys_record` VALUES (4686, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 01:37:36', 11);
INSERT INTO `sys_record` VALUES (4687, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 01:37:36', 20);
INSERT INTO `sys_record` VALUES (4688, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:38:00', 10589);
INSERT INTO `sys_record` VALUES (4689, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:39:02', 6874);
INSERT INTO `sys_record` VALUES (4690, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:39:14', 4906);
INSERT INTO `sys_record` VALUES (4691, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 01:40:13', 50516);
INSERT INTO `sys_record` VALUES (4692, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 11:44:26', 112);
INSERT INTO `sys_record` VALUES (4693, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 11:44:28', 2005);
INSERT INTO `sys_record` VALUES (4694, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:26', 76);
INSERT INTO `sys_record` VALUES (4695, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:37', 9);
INSERT INTO `sys_record` VALUES (4696, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 11:45:39', 5);
INSERT INTO `sys_record` VALUES (4697, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 12:46:10', 4896);
INSERT INTO `sys_record` VALUES (4698, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 12:46:57', 6);
INSERT INTO `sys_record` VALUES (4699, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 12:48:02', 3);
INSERT INTO `sys_record` VALUES (4700, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 12:48:02', 10922);
INSERT INTO `sys_record` VALUES (4701, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:28:42', 15);
INSERT INTO `sys_record` VALUES (4702, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:28:42', 23);
INSERT INTO `sys_record` VALUES (4703, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:02', 6);
INSERT INTO `sys_record` VALUES (4704, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:31:18', 129);
INSERT INTO `sys_record` VALUES (4705, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:31:24', 2);
INSERT INTO `sys_record` VALUES (4706, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:24', 4);
INSERT INTO `sys_record` VALUES (4707, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:31:32', 126);
INSERT INTO `sys_record` VALUES (4708, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:31:37', 3);
INSERT INTO `sys_record` VALUES (4709, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:37', 6);
INSERT INTO `sys_record` VALUES (4710, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:31:53', 5);
INSERT INTO `sys_record` VALUES (4711, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:05', 5);
INSERT INTO `sys_record` VALUES (4712, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:32:06', 2);
INSERT INTO `sys_record` VALUES (4713, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:06', 5);
INSERT INTO `sys_record` VALUES (4714, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:11', 5);
INSERT INTO `sys_record` VALUES (4715, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:16', 4);
INSERT INTO `sys_record` VALUES (4716, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:18', 3);
INSERT INTO `sys_record` VALUES (4717, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:32:29', 68);
INSERT INTO `sys_record` VALUES (4718, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:32:29', 5);
INSERT INTO `sys_record` VALUES (4719, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 13:32:37', 21);
INSERT INTO `sys_record` VALUES (4720, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 13:56:16', 13);
INSERT INTO `sys_record` VALUES (4721, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 13:56:16', 10);
INSERT INTO `sys_record` VALUES (4722, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 13:56:27', 10);
INSERT INTO `sys_record` VALUES (4723, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:28', 19);
INSERT INTO `sys_record` VALUES (4724, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:33', 7);
INSERT INTO `sys_record` VALUES (4725, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 13:56:51', 128);
INSERT INTO `sys_record` VALUES (4726, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 13:56:51', 3);
INSERT INTO `sys_record` VALUES (4727, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:04:46', 7);
INSERT INTO `sys_record` VALUES (4728, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:05:19', 2);
INSERT INTO `sys_record` VALUES (4729, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:05:19', 5);
INSERT INTO `sys_record` VALUES (4730, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:05:54', 3);
INSERT INTO `sys_record` VALUES (4731, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:05:54', 5);
INSERT INTO `sys_record` VALUES (4732, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:07:05', 2);
INSERT INTO `sys_record` VALUES (4733, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:07:05', 5);
INSERT INTO `sys_record` VALUES (4734, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:17:33', 5);
INSERT INTO `sys_record` VALUES (4735, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:17:33', 1);
INSERT INTO `sys_record` VALUES (4736, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:42:11', 1);
INSERT INTO `sys_record` VALUES (4737, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-11 14:42:11', 3);
INSERT INTO `sys_record` VALUES (4738, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:43:03', 2);
INSERT INTO `sys_record` VALUES (4739, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:43:08', 1282);
INSERT INTO `sys_record` VALUES (4740, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:43:18', 1);
INSERT INTO `sys_record` VALUES (4741, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:43:19', 1233);
INSERT INTO `sys_record` VALUES (4742, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:03', 4);
INSERT INTO `sys_record` VALUES (4743, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:05', 3);
INSERT INTO `sys_record` VALUES (4744, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:08', 2);
INSERT INTO `sys_record` VALUES (4745, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:45:27', 1);
INSERT INTO `sys_record` VALUES (4746, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:45:27', 4);
INSERT INTO `sys_record` VALUES (4747, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 14:45:36', 1175);
INSERT INTO `sys_record` VALUES (4748, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:45:40', 4);
INSERT INTO `sys_record` VALUES (4749, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:03', 14);
INSERT INTO `sys_record` VALUES (4750, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:04', 57);
INSERT INTO `sys_record` VALUES (4751, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:04', 4);
INSERT INTO `sys_record` VALUES (4752, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:06', 55);
INSERT INTO `sys_record` VALUES (4753, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:06', 2);
INSERT INTO `sys_record` VALUES (4754, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:07', 99);
INSERT INTO `sys_record` VALUES (4755, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:07', 3);
INSERT INTO `sys_record` VALUES (4756, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:09', 45);
INSERT INTO `sys_record` VALUES (4757, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:09', 3);
INSERT INTO `sys_record` VALUES (4758, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:11', 3);
INSERT INTO `sys_record` VALUES (4759, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:48:19', 4);
INSERT INTO `sys_record` VALUES (4760, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:24', 5);
INSERT INTO `sys_record` VALUES (4761, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:26', 4);
INSERT INTO `sys_record` VALUES (4762, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:27', 2);
INSERT INTO `sys_record` VALUES (4763, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:30', 2);
INSERT INTO `sys_record` VALUES (4764, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:48:35', 54);
INSERT INTO `sys_record` VALUES (4765, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:35', 3);
INSERT INTO `sys_record` VALUES (4766, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 14:48:42', 2);
INSERT INTO `sys_record` VALUES (4767, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:48:43', 2);
INSERT INTO `sys_record` VALUES (4768, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:52:58', 16);
INSERT INTO `sys_record` VALUES (4769, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:52:58', 47);
INSERT INTO `sys_record` VALUES (4770, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:05', 53);
INSERT INTO `sys_record` VALUES (4771, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:05', 4);
INSERT INTO `sys_record` VALUES (4772, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 14:53:13', 2);
INSERT INTO `sys_record` VALUES (4773, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:13', 4);
INSERT INTO `sys_record` VALUES (4774, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:29', 140);
INSERT INTO `sys_record` VALUES (4775, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:29', 7);
INSERT INTO `sys_record` VALUES (4776, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:34', 42);
INSERT INTO `sys_record` VALUES (4777, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:34', 3);
INSERT INTO `sys_record` VALUES (4778, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:39', 2);
INSERT INTO `sys_record` VALUES (4779, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:53:47', 145);
INSERT INTO `sys_record` VALUES (4780, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:47', 3);
INSERT INTO `sys_record` VALUES (4781, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:53:50', 2);
INSERT INTO `sys_record` VALUES (4782, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:54:01', 4);
INSERT INTO `sys_record` VALUES (4783, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:55:37', 3);
INSERT INTO `sys_record` VALUES (4784, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:56:04', 4);
INSERT INTO `sys_record` VALUES (4785, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:57:41', 3);
INSERT INTO `sys_record` VALUES (4786, '更改接口开放状态', '/api/okr/resource/change', 'admin', '127.0.0.1', '2021-12-11 14:57:59', 68);
INSERT INTO `sys_record` VALUES (4787, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:57:59', 3);
INSERT INTO `sys_record` VALUES (4788, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:04', 3);
INSERT INTO `sys_record` VALUES (4789, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:22', 6);
INSERT INTO `sys_record` VALUES (4790, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:58:31', 5);
INSERT INTO `sys_record` VALUES (4791, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 14:59:57', 4);
INSERT INTO `sys_record` VALUES (4792, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 15:01:11', 5);
INSERT INTO `sys_record` VALUES (4793, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:01:22', 4);
INSERT INTO `sys_record` VALUES (4794, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:03:00', 6);
INSERT INTO `sys_record` VALUES (4795, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-11 15:03:01', 1161);
INSERT INTO `sys_record` VALUES (4796, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:20', 8);
INSERT INTO `sys_record` VALUES (4797, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-11 15:03:39', 3);
INSERT INTO `sys_record` VALUES (4798, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:44', 5);
INSERT INTO `sys_record` VALUES (4799, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:03:48', 6);
INSERT INTO `sys_record` VALUES (4800, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:05:12', 19);
INSERT INTO `sys_record` VALUES (4801, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:13', 4);
INSERT INTO `sys_record` VALUES (4802, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 0);
INSERT INTO `sys_record` VALUES (4803, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 71);
INSERT INTO `sys_record` VALUES (4804, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:05:16', 5);
INSERT INTO `sys_record` VALUES (4805, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-11 15:05:40', 2);
INSERT INTO `sys_record` VALUES (4806, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:05:43', 1);
INSERT INTO `sys_record` VALUES (4807, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:05:48', 0);
INSERT INTO `sys_record` VALUES (4808, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:06:19', 0);
INSERT INTO `sys_record` VALUES (4809, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:06:26', 16789);
INSERT INTO `sys_record` VALUES (4810, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:06:26', 4);
INSERT INTO `sys_record` VALUES (4811, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:07:15', 1);
INSERT INTO `sys_record` VALUES (4812, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:07:15', 5);
INSERT INTO `sys_record` VALUES (4813, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:07:31', 2);
INSERT INTO `sys_record` VALUES (4814, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:07:33', 0);
INSERT INTO `sys_record` VALUES (4815, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 0);
INSERT INTO `sys_record` VALUES (4816, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 15930);
INSERT INTO `sys_record` VALUES (4817, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:07:50', 4);
INSERT INTO `sys_record` VALUES (4818, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:08:10', 1);
INSERT INTO `sys_record` VALUES (4819, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:08:10', 6);
INSERT INTO `sys_record` VALUES (4820, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:08:43', 1);
INSERT INTO `sys_record` VALUES (4821, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:08:45', 0);
INSERT INTO `sys_record` VALUES (4822, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 0);
INSERT INTO `sys_record` VALUES (4823, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 7215);
INSERT INTO `sys_record` VALUES (4824, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:08:54', 4);
INSERT INTO `sys_record` VALUES (4825, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-11 15:10:45', 1);
INSERT INTO `sys_record` VALUES (4826, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:45', 5);
INSERT INTO `sys_record` VALUES (4827, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:46', 1);
INSERT INTO `sys_record` VALUES (4828, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:48', 0);
INSERT INTO `sys_record` VALUES (4829, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:50', 0);
INSERT INTO `sys_record` VALUES (4830, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:10:51', 50);
INSERT INTO `sys_record` VALUES (4831, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:51', 3);
INSERT INTO `sys_record` VALUES (4832, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:53', 2);
INSERT INTO `sys_record` VALUES (4833, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:54', 0);
INSERT INTO `sys_record` VALUES (4834, '获取用户权限信息', '/api/okr/user/queryRole', 'admin', '127.0.0.1', '2021-12-11 15:10:54', 2);
INSERT INTO `sys_record` VALUES (4835, '模糊查询成员状态', '/api/okr/enum/userStatus', 'admin', '127.0.0.1', '2021-12-11 15:10:56', 0);
INSERT INTO `sys_record` VALUES (4836, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:57', 0);
INSERT INTO `sys_record` VALUES (4837, '模糊查询角色', '/api/okr/enum/role', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 0);
INSERT INTO `sys_record` VALUES (4838, '更新用户权限', '/api/okr/user/changeRole', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 63);
INSERT INTO `sys_record` VALUES (4839, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-11 15:10:58', 4);
INSERT INTO `sys_record` VALUES (4840, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-11 15:11:51', 6);
INSERT INTO `sys_record` VALUES (4841, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 14:16:15', 102);
INSERT INTO `sys_record` VALUES (4842, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-12 14:16:17', 2047);
INSERT INTO `sys_record` VALUES (4843, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-12 14:19:35', 1193);
INSERT INTO `sys_record` VALUES (4844, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-12 14:21:21', 64);
INSERT INTO `sys_record` VALUES (4845, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 17:39:39', 23);
INSERT INTO `sys_record` VALUES (4846, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-12 17:39:41', 15);
INSERT INTO `sys_record` VALUES (4847, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 17:39:45', 2);
INSERT INTO `sys_record` VALUES (4848, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-12 17:39:45', 12);
INSERT INTO `sys_record` VALUES (4849, '根据id查询钥匙', '/api/okr/key/queryById', 'admin', '127.0.0.1', '2021-12-12 17:39:51', 18);
INSERT INTO `sys_record` VALUES (4850, '模糊查询钥匙', '/api/okr/enum/key', 'admin', '127.0.0.1', '2021-12-12 17:39:52', 2);
INSERT INTO `sys_record` VALUES (4851, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 17:39:54', 8);
INSERT INTO `sys_record` VALUES (4852, '根据用户名选择用户', '/api/okr/user/queryByUsername', 'admin', '127.0.0.1', '2021-12-12 17:39:55', 2);
INSERT INTO `sys_record` VALUES (4853, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:42:24', 3);
INSERT INTO `sys_record` VALUES (4854, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:42:24', 8);
INSERT INTO `sys_record` VALUES (4855, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:42:41', 3);
INSERT INTO `sys_record` VALUES (4856, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:42:41', 8);
INSERT INTO `sys_record` VALUES (4857, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 19:43:28', 2);
INSERT INTO `sys_record` VALUES (4858, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 19:43:28', 10);
INSERT INTO `sys_record` VALUES (4859, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 20:30:03', 2);
INSERT INTO `sys_record` VALUES (4860, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-12 20:30:03', 8);
INSERT INTO `sys_record` VALUES (4861, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:03', 213);
INSERT INTO `sys_record` VALUES (4862, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:40', 16);
INSERT INTO `sys_record` VALUES (4863, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:58:49', 3);
INSERT INTO `sys_record` VALUES (4864, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:59:31', 3);
INSERT INTO `sys_record` VALUES (4865, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 20:59:38', 2);
INSERT INTO `sys_record` VALUES (4866, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:03:18', 22);
INSERT INTO `sys_record` VALUES (4867, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:10', 13);
INSERT INTO `sys_record` VALUES (4868, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:15', 6);
INSERT INTO `sys_record` VALUES (4869, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:39', 6);
INSERT INTO `sys_record` VALUES (4870, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:04:43', 8);
INSERT INTO `sys_record` VALUES (4871, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:04:43', 13);
INSERT INTO `sys_record` VALUES (4872, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:01', 6);
INSERT INTO `sys_record` VALUES (4873, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:13', 5);
INSERT INTO `sys_record` VALUES (4874, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:16', 6);
INSERT INTO `sys_record` VALUES (4875, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:05:34', 7);
INSERT INTO `sys_record` VALUES (4876, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:15:25', 29);
INSERT INTO `sys_record` VALUES (4877, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:15:27', 11);
INSERT INTO `sys_record` VALUES (4878, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:06', 6);
INSERT INTO `sys_record` VALUES (4879, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:35', 7);
INSERT INTO `sys_record` VALUES (4880, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:37', 4);
INSERT INTO `sys_record` VALUES (4881, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:16:44', 6);
INSERT INTO `sys_record` VALUES (4882, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:17:17', 7);
INSERT INTO `sys_record` VALUES (4883, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:17:19', 4);
INSERT INTO `sys_record` VALUES (4884, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:20:43', 8);
INSERT INTO `sys_record` VALUES (4885, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:20:43', 14);
INSERT INTO `sys_record` VALUES (4886, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:21:49', 5);
INSERT INTO `sys_record` VALUES (4887, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 21:22:31', 416);
INSERT INTO `sys_record` VALUES (4888, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:23:41', 4);
INSERT INTO `sys_record` VALUES (4889, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:23:53', 4);
INSERT INTO `sys_record` VALUES (4890, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:23:56', 2);
INSERT INTO `sys_record` VALUES (4891, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 21:24:36', 3);
INSERT INTO `sys_record` VALUES (4892, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:24:36', 6);
INSERT INTO `sys_record` VALUES (4893, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:24:43', 1);
INSERT INTO `sys_record` VALUES (4894, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:00', 2);
INSERT INTO `sys_record` VALUES (4895, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:00', 2);
INSERT INTO `sys_record` VALUES (4896, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:30:02', 3);
INSERT INTO `sys_record` VALUES (4897, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:03', 2);
INSERT INTO `sys_record` VALUES (4898, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:04', 0);
INSERT INTO `sys_record` VALUES (4899, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:30:43', 4);
INSERT INTO `sys_record` VALUES (4900, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:44', 1);
INSERT INTO `sys_record` VALUES (4901, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:30:44', 0);
INSERT INTO `sys_record` VALUES (4902, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:30:49', 2);
INSERT INTO `sys_record` VALUES (4903, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:32:08', 4);
INSERT INTO `sys_record` VALUES (4904, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:32:09', 1);
INSERT INTO `sys_record` VALUES (4905, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:32:10', 0);
INSERT INTO `sys_record` VALUES (4906, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:37:09', 1);
INSERT INTO `sys_record` VALUES (4907, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:37:31', 0);
INSERT INTO `sys_record` VALUES (4908, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:37:34', 0);
INSERT INTO `sys_record` VALUES (4909, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:28', 2);
INSERT INTO `sys_record` VALUES (4910, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:29', 0);
INSERT INTO `sys_record` VALUES (4911, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:29', 1);
INSERT INTO `sys_record` VALUES (4912, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:38:31', 4);
INSERT INTO `sys_record` VALUES (4913, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:38:32', 1);
INSERT INTO `sys_record` VALUES (4914, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:33', 0);
INSERT INTO `sys_record` VALUES (4915, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:34', 0);
INSERT INTO `sys_record` VALUES (4916, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:38:35', 0);
INSERT INTO `sys_record` VALUES (4917, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:38:40', 1);
INSERT INTO `sys_record` VALUES (4918, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:41:10', 18);
INSERT INTO `sys_record` VALUES (4919, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:41:11', 4);
INSERT INTO `sys_record` VALUES (4920, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:51:40', 21);
INSERT INTO `sys_record` VALUES (4921, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:51:44', 1);
INSERT INTO `sys_record` VALUES (4922, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 21:55:38', 25);
INSERT INTO `sys_record` VALUES (4923, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:55:40', 3);
INSERT INTO `sys_record` VALUES (4924, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 21:55:41', 0);
INSERT INTO `sys_record` VALUES (4925, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 21:56:05', 18133);
INSERT INTO `sys_record` VALUES (4926, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 21:57:47', 62);
INSERT INTO `sys_record` VALUES (4927, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:01:25', 23);
INSERT INTO `sys_record` VALUES (4928, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:01:35', 4);
INSERT INTO `sys_record` VALUES (4929, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:35', 11);
INSERT INTO `sys_record` VALUES (4930, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:01:40', 137);
INSERT INTO `sys_record` VALUES (4931, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:01:40', 9);
INSERT INTO `sys_record` VALUES (4932, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:01:51', 3);
INSERT INTO `sys_record` VALUES (4933, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:52', 0);
INSERT INTO `sys_record` VALUES (4934, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:53', 0);
INSERT INTO `sys_record` VALUES (4935, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:01:54', 0);
INSERT INTO `sys_record` VALUES (4936, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:02:04', 44);
INSERT INTO `sys_record` VALUES (4937, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:02:04', 5);
INSERT INTO `sys_record` VALUES (4938, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-12 22:02:05', 1);
INSERT INTO `sys_record` VALUES (4939, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:06', 0);
INSERT INTO `sys_record` VALUES (4940, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:07', 0);
INSERT INTO `sys_record` VALUES (4941, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:10', 0);
INSERT INTO `sys_record` VALUES (4942, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:11', 0);
INSERT INTO `sys_record` VALUES (4943, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-12 22:02:12', 0);
INSERT INTO `sys_record` VALUES (4944, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-12 22:02:21', 100);
INSERT INTO `sys_record` VALUES (4945, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 22:02:21', 6);
INSERT INTO `sys_record` VALUES (4946, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 22:02:58', 174);
INSERT INTO `sys_record` VALUES (4947, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:09:27', 20);
INSERT INTO `sys_record` VALUES (4948, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:09:31', 12);
INSERT INTO `sys_record` VALUES (4949, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:10:20', 7);
INSERT INTO `sys_record` VALUES (4950, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 23:10:20', 15);
INSERT INTO `sys_record` VALUES (4951, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:11:04', 7);
INSERT INTO `sys_record` VALUES (4952, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:11:05', 9);
INSERT INTO `sys_record` VALUES (4953, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:11:07', 9);
INSERT INTO `sys_record` VALUES (4954, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:12:03', 28108);
INSERT INTO `sys_record` VALUES (4955, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:12:14', 7449);
INSERT INTO `sys_record` VALUES (4956, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-12 23:13:38', 1);
INSERT INTO `sys_record` VALUES (4957, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-12 23:13:38', 6);
INSERT INTO `sys_record` VALUES (4958, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-12 23:13:41', 5);
INSERT INTO `sys_record` VALUES (4959, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:11:34', 27);
INSERT INTO `sys_record` VALUES (4960, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-13 00:11:41', 8);
INSERT INTO `sys_record` VALUES (4961, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:12:31', 10);
INSERT INTO `sys_record` VALUES (4962, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:12:34', 1695);
INSERT INTO `sys_record` VALUES (4963, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:13:16', 32184);
INSERT INTO `sys_record` VALUES (4964, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:14:28', 14);
INSERT INTO `sys_record` VALUES (4965, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:14:29', 1211);
INSERT INTO `sys_record` VALUES (4966, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:14:30', 4);
INSERT INTO `sys_record` VALUES (4967, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:14:35', 2944);
INSERT INTO `sys_record` VALUES (4968, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:15:56', 4);
INSERT INTO `sys_record` VALUES (4969, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:16:19', 1);
INSERT INTO `sys_record` VALUES (4970, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:16:20', 1166);
INSERT INTO `sys_record` VALUES (4971, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:16:23', 5);
INSERT INTO `sys_record` VALUES (4972, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:16:24', 6);
INSERT INTO `sys_record` VALUES (4973, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:17:45', 5);
INSERT INTO `sys_record` VALUES (4974, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:18:42', 6);
INSERT INTO `sys_record` VALUES (4975, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:19:44', 3);
INSERT INTO `sys_record` VALUES (4976, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 00:19:45', 1164);
INSERT INTO `sys_record` VALUES (4977, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:19:57', 5);
INSERT INTO `sys_record` VALUES (4978, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:20:02', 8);
INSERT INTO `sys_record` VALUES (4979, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:24:37', 1);
INSERT INTO `sys_record` VALUES (4980, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:24:37', 6);
INSERT INTO `sys_record` VALUES (4981, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 00:24:39', 6);
INSERT INTO `sys_record` VALUES (4982, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 00:33:50', 24);
INSERT INTO `sys_record` VALUES (4983, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:33:50', 121);
INSERT INTO `sys_record` VALUES (4984, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:34:00', 9);
INSERT INTO `sys_record` VALUES (4985, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:03', 4);
INSERT INTO `sys_record` VALUES (4986, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:35', 4);
INSERT INTO `sys_record` VALUES (4987, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:39', 7);
INSERT INTO `sys_record` VALUES (4988, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:43', 3);
INSERT INTO `sys_record` VALUES (4989, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:50', 3);
INSERT INTO `sys_record` VALUES (4990, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:35:58', 2);
INSERT INTO `sys_record` VALUES (4991, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:00', 3);
INSERT INTO `sys_record` VALUES (4992, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:05', 4);
INSERT INTO `sys_record` VALUES (4993, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:08', 3);
INSERT INTO `sys_record` VALUES (4994, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:36:20', 1);
INSERT INTO `sys_record` VALUES (4995, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:21', 4);
INSERT INTO `sys_record` VALUES (4996, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:22', 0);
INSERT INTO `sys_record` VALUES (4997, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:36:24', 0);
INSERT INTO `sys_record` VALUES (4998, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:36:29', 404);
INSERT INTO `sys_record` VALUES (4999, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:29', 3);
INSERT INTO `sys_record` VALUES (5000, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:32', 3);
INSERT INTO `sys_record` VALUES (5001, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:36:47', 2);
INSERT INTO `sys_record` VALUES (5002, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:00', 2);
INSERT INTO `sys_record` VALUES (5003, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:00', 0);
INSERT INTO `sys_record` VALUES (5004, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:03', 1);
INSERT INTO `sys_record` VALUES (5005, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:05', 0);
INSERT INTO `sys_record` VALUES (5006, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:07', 0);
INSERT INTO `sys_record` VALUES (5007, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:42:15', 33);
INSERT INTO `sys_record` VALUES (5008, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:15', 4);
INSERT INTO `sys_record` VALUES (5009, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:17', 2);
INSERT INTO `sys_record` VALUES (5010, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:23', 2);
INSERT INTO `sys_record` VALUES (5011, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-13 00:42:31', 2);
INSERT INTO `sys_record` VALUES (5012, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:31', 0);
INSERT INTO `sys_record` VALUES (5013, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:33', 0);
INSERT INTO `sys_record` VALUES (5014, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-13 00:42:34', 0);
INSERT INTO `sys_record` VALUES (5015, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-13 00:42:40', 133);
INSERT INTO `sys_record` VALUES (5016, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:40', 2);
INSERT INTO `sys_record` VALUES (5017, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:42:43', 3);
INSERT INTO `sys_record` VALUES (5018, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 00:43:11', 2);
INSERT INTO `sys_record` VALUES (5019, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:03:49', 13);
INSERT INTO `sys_record` VALUES (5020, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:03:50', 1701);
INSERT INTO `sys_record` VALUES (5021, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-13 01:04:07', 50);
INSERT INTO `sys_record` VALUES (5022, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:04:11', 1187);
INSERT INTO `sys_record` VALUES (5023, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-13 01:06:17', 10);
INSERT INTO `sys_record` VALUES (5024, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 01:06:21', 62);
INSERT INTO `sys_record` VALUES (5025, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:22', 18);
INSERT INTO `sys_record` VALUES (5026, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:26', 4);
INSERT INTO `sys_record` VALUES (5027, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:27', 4);
INSERT INTO `sys_record` VALUES (5028, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:06:29', 5);
INSERT INTO `sys_record` VALUES (5029, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:32', 32);
INSERT INTO `sys_record` VALUES (5030, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:37', 5);
INSERT INTO `sys_record` VALUES (5031, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:41', 2);
INSERT INTO `sys_record` VALUES (5032, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:44', 5);
INSERT INTO `sys_record` VALUES (5033, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:47', 3);
INSERT INTO `sys_record` VALUES (5034, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:50', 6);
INSERT INTO `sys_record` VALUES (5035, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:08:52', 3);
INSERT INTO `sys_record` VALUES (5036, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-13 01:09:00', 2);
INSERT INTO `sys_record` VALUES (5037, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:09:30', 1183);
INSERT INTO `sys_record` VALUES (5038, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:12:39', 11);
INSERT INTO `sys_record` VALUES (5039, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:12:39', 17);
INSERT INTO `sys_record` VALUES (5040, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:16:04', 1);
INSERT INTO `sys_record` VALUES (5041, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:16:04', 4);
INSERT INTO `sys_record` VALUES (5042, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 01:17:32', 1);
INSERT INTO `sys_record` VALUES (5043, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:17:32', 6);
INSERT INTO `sys_record` VALUES (5044, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 01:24:38', 1158);
INSERT INTO `sys_record` VALUES (5045, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 01:24:40', 4);
INSERT INTO `sys_record` VALUES (5046, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:12:48', 200);
INSERT INTO `sys_record` VALUES (5047, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 11:12:49', 2162);
INSERT INTO `sys_record` VALUES (5048, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 11:16:08', 1176);
INSERT INTO `sys_record` VALUES (5049, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:17:33', 122);
INSERT INTO `sys_record` VALUES (5050, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:23:05', 2);
INSERT INTO `sys_record` VALUES (5051, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:23:05', 10);
INSERT INTO `sys_record` VALUES (5052, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:55:26', 14);
INSERT INTO `sys_record` VALUES (5053, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:55:26', 18);
INSERT INTO `sys_record` VALUES (5054, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:57:28', 3);
INSERT INTO `sys_record` VALUES (5055, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:57:28', 7);
INSERT INTO `sys_record` VALUES (5056, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:57:57', 3);
INSERT INTO `sys_record` VALUES (5057, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:57:57', 9);
INSERT INTO `sys_record` VALUES (5058, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 11:58:31', 6);
INSERT INTO `sys_record` VALUES (5059, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 11:58:31', 10);
INSERT INTO `sys_record` VALUES (5060, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:01:38', 24);
INSERT INTO `sys_record` VALUES (5061, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:05:14', 4);
INSERT INTO `sys_record` VALUES (5062, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:11:06', 6);
INSERT INTO `sys_record` VALUES (5063, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 12:27:43', 7);
INSERT INTO `sys_record` VALUES (5064, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:34:29', 137);
INSERT INTO `sys_record` VALUES (5065, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:34:52', 3);
INSERT INTO `sys_record` VALUES (5066, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:36:03', 3);
INSERT INTO `sys_record` VALUES (5067, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:38:19', 18);
INSERT INTO `sys_record` VALUES (5068, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:46:04', 10);
INSERT INTO `sys_record` VALUES (5069, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:46:40', 6);
INSERT INTO `sys_record` VALUES (5070, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:46:40', 17);
INSERT INTO `sys_record` VALUES (5071, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:50:01', 13);
INSERT INTO `sys_record` VALUES (5072, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:50:02', 42);
INSERT INTO `sys_record` VALUES (5073, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:51:12', 1);
INSERT INTO `sys_record` VALUES (5074, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:51:12', 5);
INSERT INTO `sys_record` VALUES (5075, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:52:32', 5);
INSERT INTO `sys_record` VALUES (5076, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:54:12', 11);
INSERT INTO `sys_record` VALUES (5077, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:56:49', 20);
INSERT INTO `sys_record` VALUES (5078, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:36', 15);
INSERT INTO `sys_record` VALUES (5079, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 12:57:43', 175);
INSERT INTO `sys_record` VALUES (5080, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:43', 4);
INSERT INTO `sys_record` VALUES (5081, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 12:57:55', 393);
INSERT INTO `sys_record` VALUES (5082, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 12:57:55', 2);
INSERT INTO `sys_record` VALUES (5083, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 12:59:26', 14);
INSERT INTO `sys_record` VALUES (5084, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-13 12:59:28', 1836);
INSERT INTO `sys_record` VALUES (5085, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 12:59:30', 35);
INSERT INTO `sys_record` VALUES (5086, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:09', 10);
INSERT INTO `sys_record` VALUES (5087, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:26', 4);
INSERT INTO `sys_record` VALUES (5088, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:30', 5);
INSERT INTO `sys_record` VALUES (5089, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:00:36', 4);
INSERT INTO `sys_record` VALUES (5090, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:00:50', 478);
INSERT INTO `sys_record` VALUES (5091, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 1);
INSERT INTO `sys_record` VALUES (5092, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 5);
INSERT INTO `sys_record` VALUES (5093, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 1);
INSERT INTO `sys_record` VALUES (5094, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:02:44', 5);
INSERT INTO `sys_record` VALUES (5095, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:03:14', 15);
INSERT INTO `sys_record` VALUES (5096, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 9);
INSERT INTO `sys_record` VALUES (5097, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 1);
INSERT INTO `sys_record` VALUES (5098, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 1);
INSERT INTO `sys_record` VALUES (5099, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-13 13:03:47', 8);
INSERT INTO `sys_record` VALUES (5100, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-13 13:03:54', 15);
INSERT INTO `sys_record` VALUES (5101, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:04:42', 1);
INSERT INTO `sys_record` VALUES (5102, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:04:42', 4);
INSERT INTO `sys_record` VALUES (5103, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:04:59', 156);
INSERT INTO `sys_record` VALUES (5104, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:04:59', 2);
INSERT INTO `sys_record` VALUES (5105, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:05:08', 50);
INSERT INTO `sys_record` VALUES (5106, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:05:08', 4);
INSERT INTO `sys_record` VALUES (5107, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:05:35', 1);
INSERT INTO `sys_record` VALUES (5108, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:05:35', 4);
INSERT INTO `sys_record` VALUES (5109, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:06:42', 9);
INSERT INTO `sys_record` VALUES (5110, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:06:55', 48);
INSERT INTO `sys_record` VALUES (5111, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:06:55', 5);
INSERT INTO `sys_record` VALUES (5112, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:07:00', 0);
INSERT INTO `sys_record` VALUES (5113, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:07:04', 43);
INSERT INTO `sys_record` VALUES (5114, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:07:04', 3);
INSERT INTO `sys_record` VALUES (5115, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:12:36', 1);
INSERT INTO `sys_record` VALUES (5116, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:12:42', 129);
INSERT INTO `sys_record` VALUES (5117, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:12:42', 2);
INSERT INTO `sys_record` VALUES (5118, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:12:53', 150);
INSERT INTO `sys_record` VALUES (5119, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:12:53', 3);
INSERT INTO `sys_record` VALUES (5120, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:12:56', 1);
INSERT INTO `sys_record` VALUES (5121, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:13:12', 132);
INSERT INTO `sys_record` VALUES (5122, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:13:12', 2);
INSERT INTO `sys_record` VALUES (5123, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:13:58', 3);
INSERT INTO `sys_record` VALUES (5124, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:18:29', 13);
INSERT INTO `sys_record` VALUES (5125, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:18:57', 3);
INSERT INTO `sys_record` VALUES (5126, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:19:00', 164);
INSERT INTO `sys_record` VALUES (5127, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:00', 4);
INSERT INTO `sys_record` VALUES (5128, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:19:02', 48);
INSERT INTO `sys_record` VALUES (5129, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:02', 2);
INSERT INTO `sys_record` VALUES (5130, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:13', 3);
INSERT INTO `sys_record` VALUES (5131, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 126);
INSERT INTO `sys_record` VALUES (5132, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 2);
INSERT INTO `sys_record` VALUES (5133, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:28', 1);
INSERT INTO `sys_record` VALUES (5134, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:32', 60);
INSERT INTO `sys_record` VALUES (5135, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:32', 2);
INSERT INTO `sys_record` VALUES (5136, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:33', 1);
INSERT INTO `sys_record` VALUES (5137, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:38', 55);
INSERT INTO `sys_record` VALUES (5138, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:38', 4);
INSERT INTO `sys_record` VALUES (5139, '获取标签', '/api/okr/tag/query', 'admin', '127.0.0.1', '2021-12-13 13:19:42', 1);
INSERT INTO `sys_record` VALUES (5140, '更新标签', '/api/okr/tag/change', 'admin', '127.0.0.1', '2021-12-13 13:19:48', 172);
INSERT INTO `sys_record` VALUES (5141, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:48', 3);
INSERT INTO `sys_record` VALUES (5142, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:19:55', 42);
INSERT INTO `sys_record` VALUES (5143, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:19:56', 2);
INSERT INTO `sys_record` VALUES (5144, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:18', 73);
INSERT INTO `sys_record` VALUES (5145, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:18', 2);
INSERT INTO `sys_record` VALUES (5146, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:27', 49);
INSERT INTO `sys_record` VALUES (5147, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:27', 2);
INSERT INTO `sys_record` VALUES (5148, '增加标签', '/api/okr/tag/add', 'admin', '127.0.0.1', '2021-12-13 13:20:44', 43);
INSERT INTO `sys_record` VALUES (5149, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:44', 3);
INSERT INTO `sys_record` VALUES (5150, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:20:52', 3);
INSERT INTO `sys_record` VALUES (5151, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:14', 3);
INSERT INTO `sys_record` VALUES (5152, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:15', 4);
INSERT INTO `sys_record` VALUES (5153, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:18', 3);
INSERT INTO `sys_record` VALUES (5154, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:25', 2);
INSERT INTO `sys_record` VALUES (5155, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:21:32', 134);
INSERT INTO `sys_record` VALUES (5156, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:32', 3);
INSERT INTO `sys_record` VALUES (5157, '删除标签', '/api/okr/tag/cancel', 'admin', '127.0.0.1', '2021-12-13 13:21:34', 123);
INSERT INTO `sys_record` VALUES (5158, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:34', 1);
INSERT INTO `sys_record` VALUES (5159, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:37', 3);
INSERT INTO `sys_record` VALUES (5160, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:21:55', 4);
INSERT INTO `sys_record` VALUES (5161, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:23:51', 10);
INSERT INTO `sys_record` VALUES (5162, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-13 13:23:51', 42);
INSERT INTO `sys_record` VALUES (5163, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-13 13:31:35', 9);
INSERT INTO `sys_record` VALUES (5164, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-13 13:47:00', 17);
INSERT INTO `sys_record` VALUES (5165, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 13:47:00', 13);
INSERT INTO `sys_record` VALUES (5166, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 19:45:24', 77);
INSERT INTO `sys_record` VALUES (5167, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 19:49:01', 5);
INSERT INTO `sys_record` VALUES (5168, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 19:52:15', 41);
INSERT INTO `sys_record` VALUES (5169, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 19:53:21', 5);
INSERT INTO `sys_record` VALUES (5170, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:37:49', 50);
INSERT INTO `sys_record` VALUES (5171, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:38:41', 9);
INSERT INTO `sys_record` VALUES (5172, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:38:57', 10);
INSERT INTO `sys_record` VALUES (5173, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 21:38:57', 17);
INSERT INTO `sys_record` VALUES (5174, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:46:33', 11);
INSERT INTO `sys_record` VALUES (5175, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:47:38', 9);
INSERT INTO `sys_record` VALUES (5176, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 21:56:06', 3);
INSERT INTO `sys_record` VALUES (5177, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:56:06', 10);
INSERT INTO `sys_record` VALUES (5178, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:57:18', 6);
INSERT INTO `sys_record` VALUES (5179, '添加书籍', '/api/okr/book/add', 'admin', '127.0.0.1', '2021-12-13 21:57:21', 94);
INSERT INTO `sys_record` VALUES (5180, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:57:21', 8);
INSERT INTO `sys_record` VALUES (5181, '添加书籍', '/api/okr/book/add', 'admin', '127.0.0.1', '2021-12-13 21:57:39', 134);
INSERT INTO `sys_record` VALUES (5182, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 21:57:39', 4);
INSERT INTO `sys_record` VALUES (5183, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:21:40', 12);
INSERT INTO `sys_record` VALUES (5184, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:21:41', 2);
INSERT INTO `sys_record` VALUES (5185, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 22:44:42', 28);
INSERT INTO `sys_record` VALUES (5186, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-13 22:45:23', 19);
INSERT INTO `sys_record` VALUES (5187, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:45:24', 8);
INSERT INTO `sys_record` VALUES (5188, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:45:25', 2);
INSERT INTO `sys_record` VALUES (5189, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:45:26', 0);
INSERT INTO `sys_record` VALUES (5190, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 22:46:24', 1);
INSERT INTO `sys_record` VALUES (5191, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:46:24', 10);
INSERT INTO `sys_record` VALUES (5192, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:46:25', 2);
INSERT INTO `sys_record` VALUES (5193, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:46:26', 0);
INSERT INTO `sys_record` VALUES (5194, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 22:49:08', 2);
INSERT INTO `sys_record` VALUES (5195, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:49:08', 10);
INSERT INTO `sys_record` VALUES (5196, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:49:09', 4);
INSERT INTO `sys_record` VALUES (5197, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:49:10', 0);
INSERT INTO `sys_record` VALUES (5198, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:49:11', 2);
INSERT INTO `sys_record` VALUES (5199, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:49:12', 0);
INSERT INTO `sys_record` VALUES (5200, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 22:50:08', 1);
INSERT INTO `sys_record` VALUES (5201, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:50:08', 10);
INSERT INTO `sys_record` VALUES (5202, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:50:10', 1);
INSERT INTO `sys_record` VALUES (5203, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:50:11', 0);
INSERT INTO `sys_record` VALUES (5204, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:51:02', 2);
INSERT INTO `sys_record` VALUES (5205, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:51:38', 7);
INSERT INTO `sys_record` VALUES (5206, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 22:52:30', 2);
INSERT INTO `sys_record` VALUES (5207, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 22:52:30', 0);
INSERT INTO `sys_record` VALUES (5208, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 22:59:42', 2);
INSERT INTO `sys_record` VALUES (5209, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 22:59:42', 8);
INSERT INTO `sys_record` VALUES (5210, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:00:16', 2);
INSERT INTO `sys_record` VALUES (5211, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:00:16', 8);
INSERT INTO `sys_record` VALUES (5212, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:00:24', 2);
INSERT INTO `sys_record` VALUES (5213, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:00:25', 0);
INSERT INTO `sys_record` VALUES (5214, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:04:07', 18);
INSERT INTO `sys_record` VALUES (5215, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:04:07', 29);
INSERT INTO `sys_record` VALUES (5216, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:04:09', 2);
INSERT INTO `sys_record` VALUES (5217, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:04:10', 1);
INSERT INTO `sys_record` VALUES (5218, '上传书籍照片', '/api/okr/book/changeImg', 'admin', '127.0.0.1', '2021-12-13 23:04:12', 58);
INSERT INTO `sys_record` VALUES (5219, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-13 23:04:27', 0);
INSERT INTO `sys_record` VALUES (5220, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:04:27', 6);
INSERT INTO `sys_record` VALUES (5221, '添加书籍', '/api/okr/book/add', 'admin', '127.0.0.1', '2021-12-13 23:07:01', 52);
INSERT INTO `sys_record` VALUES (5222, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:07:01', 120);
INSERT INTO `sys_record` VALUES (5223, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:07:08', 2);
INSERT INTO `sys_record` VALUES (5224, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:07:21', 3);
INSERT INTO `sys_record` VALUES (5225, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:07:24', 0);
INSERT INTO `sys_record` VALUES (5226, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-13 23:07:25', 0);
INSERT INTO `sys_record` VALUES (5227, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:07:25', 7);
INSERT INTO `sys_record` VALUES (5228, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:07:33', 7);
INSERT INTO `sys_record` VALUES (5229, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:08:35', 3);
INSERT INTO `sys_record` VALUES (5230, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:08:36', 1);
INSERT INTO `sys_record` VALUES (5231, '上传书籍照片', '/api/okr/book/changeImg', 'admin', '127.0.0.1', '2021-12-13 23:08:39', 51);
INSERT INTO `sys_record` VALUES (5232, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:09:02', 8);
INSERT INTO `sys_record` VALUES (5233, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:09:02', 16);
INSERT INTO `sys_record` VALUES (5234, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:10:24', 2);
INSERT INTO `sys_record` VALUES (5235, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:10:25', 0);
INSERT INTO `sys_record` VALUES (5236, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:18:24', 15);
INSERT INTO `sys_record` VALUES (5237, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:18:24', 24);
INSERT INTO `sys_record` VALUES (5238, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:23:54', 18);
INSERT INTO `sys_record` VALUES (5239, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:23:54', 155);
INSERT INTO `sys_record` VALUES (5240, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:25:02', 10);
INSERT INTO `sys_record` VALUES (5241, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:25:02', 18);
INSERT INTO `sys_record` VALUES (5242, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:25:08', 2);
INSERT INTO `sys_record` VALUES (5243, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:25:08', 7);
INSERT INTO `sys_record` VALUES (5244, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:25:33', 1);
INSERT INTO `sys_record` VALUES (5245, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:25:34', 0);
INSERT INTO `sys_record` VALUES (5246, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:28:17', 1);
INSERT INTO `sys_record` VALUES (5247, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:28:23', 1);
INSERT INTO `sys_record` VALUES (5248, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:28:23', 10);
INSERT INTO `sys_record` VALUES (5249, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:28:23', 12);
INSERT INTO `sys_record` VALUES (5250, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:28:46', 3);
INSERT INTO `sys_record` VALUES (5251, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:28:47', 0);
INSERT INTO `sys_record` VALUES (5252, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:28:56', 1);
INSERT INTO `sys_record` VALUES (5253, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:28:57', 0);
INSERT INTO `sys_record` VALUES (5254, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:31:48', 0);
INSERT INTO `sys_record` VALUES (5255, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:31:51', 2);
INSERT INTO `sys_record` VALUES (5256, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:31:51', 1);
INSERT INTO `sys_record` VALUES (5257, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:31:51', 7);
INSERT INTO `sys_record` VALUES (5258, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:31:53', 2);
INSERT INTO `sys_record` VALUES (5259, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:31:54', 0);
INSERT INTO `sys_record` VALUES (5260, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:43:38', 2);
INSERT INTO `sys_record` VALUES (5261, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:43:44', 1);
INSERT INTO `sys_record` VALUES (5262, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:43:44', 1);
INSERT INTO `sys_record` VALUES (5263, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:43:44', 9);
INSERT INTO `sys_record` VALUES (5264, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:43:45', 1);
INSERT INTO `sys_record` VALUES (5265, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:43:46', 0);
INSERT INTO `sys_record` VALUES (5266, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:44:34', 1);
INSERT INTO `sys_record` VALUES (5267, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:01', 0);
INSERT INTO `sys_record` VALUES (5268, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:01', 1);
INSERT INTO `sys_record` VALUES (5269, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:03', 2);
INSERT INTO `sys_record` VALUES (5270, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:47:03', 1);
INSERT INTO `sys_record` VALUES (5271, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:47:03', 6);
INSERT INTO `sys_record` VALUES (5272, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:47:05', 1);
INSERT INTO `sys_record` VALUES (5273, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:47:06', 0);
INSERT INTO `sys_record` VALUES (5274, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:42', 1);
INSERT INTO `sys_record` VALUES (5275, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:43', 2);
INSERT INTO `sys_record` VALUES (5276, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:47:45', 1);
INSERT INTO `sys_record` VALUES (5277, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:47:45', 1);
INSERT INTO `sys_record` VALUES (5278, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:47:45', 6);
INSERT INTO `sys_record` VALUES (5279, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:47:46', 1);
INSERT INTO `sys_record` VALUES (5280, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:47:47', 0);
INSERT INTO `sys_record` VALUES (5281, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:48:20', 1);
INSERT INTO `sys_record` VALUES (5282, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:48:44', 0);
INSERT INTO `sys_record` VALUES (5283, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:48:54', 1);
INSERT INTO `sys_record` VALUES (5284, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:48:55', 1);
INSERT INTO `sys_record` VALUES (5285, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:48:57', 1);
INSERT INTO `sys_record` VALUES (5286, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:48:57', 1);
INSERT INTO `sys_record` VALUES (5287, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:48:57', 6);
INSERT INTO `sys_record` VALUES (5288, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:48:59', 1);
INSERT INTO `sys_record` VALUES (5289, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:49:00', 0);
INSERT INTO `sys_record` VALUES (5290, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:49:54', 1);
INSERT INTO `sys_record` VALUES (5291, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:49:59', 1);
INSERT INTO `sys_record` VALUES (5292, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:50:00', 0);
INSERT INTO `sys_record` VALUES (5293, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:50:03', 1);
INSERT INTO `sys_record` VALUES (5294, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:50:03', 1);
INSERT INTO `sys_record` VALUES (5295, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:50:03', 6);
INSERT INTO `sys_record` VALUES (5296, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:50:04', 1);
INSERT INTO `sys_record` VALUES (5297, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:50:05', 0);
INSERT INTO `sys_record` VALUES (5298, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:52:09', 1);
INSERT INTO `sys_record` VALUES (5299, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:53:27', 1);
INSERT INTO `sys_record` VALUES (5300, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:53:27', 1);
INSERT INTO `sys_record` VALUES (5301, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:53:27', 7);
INSERT INTO `sys_record` VALUES (5302, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:53:29', 1);
INSERT INTO `sys_record` VALUES (5303, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:53:30', 0);
INSERT INTO `sys_record` VALUES (5304, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:55:03', 2);
INSERT INTO `sys_record` VALUES (5305, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:55:06', 1);
INSERT INTO `sys_record` VALUES (5306, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:55:06', 1);
INSERT INTO `sys_record` VALUES (5307, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:55:06', 8);
INSERT INTO `sys_record` VALUES (5308, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:55:08', 2);
INSERT INTO `sys_record` VALUES (5309, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:55:09', 0);
INSERT INTO `sys_record` VALUES (5310, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:55:20', 1);
INSERT INTO `sys_record` VALUES (5311, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:55:20', 1);
INSERT INTO `sys_record` VALUES (5312, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:55:20', 7);
INSERT INTO `sys_record` VALUES (5313, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:58:22', 1);
INSERT INTO `sys_record` VALUES (5314, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:59:31', 1);
INSERT INTO `sys_record` VALUES (5315, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-13 23:59:31', 1);
INSERT INTO `sys_record` VALUES (5316, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-13 23:59:31', 8);
INSERT INTO `sys_record` VALUES (5317, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-13 23:59:33', 1);
INSERT INTO `sys_record` VALUES (5318, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-13 23:59:34', 0);
INSERT INTO `sys_record` VALUES (5319, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:59:57', 1);
INSERT INTO `sys_record` VALUES (5320, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-13 23:59:58', 1);
INSERT INTO `sys_record` VALUES (5321, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:00:01', 1);
INSERT INTO `sys_record` VALUES (5322, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:00:01', 1);
INSERT INTO `sys_record` VALUES (5323, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:00:01', 7);
INSERT INTO `sys_record` VALUES (5324, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:00:02', 1);
INSERT INTO `sys_record` VALUES (5325, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:00:03', 0);
INSERT INTO `sys_record` VALUES (5326, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:02:01', 1);
INSERT INTO `sys_record` VALUES (5327, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:02:06', 1);
INSERT INTO `sys_record` VALUES (5328, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:02:06', 1);
INSERT INTO `sys_record` VALUES (5329, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:02:06', 7);
INSERT INTO `sys_record` VALUES (5330, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:02:06', 1);
INSERT INTO `sys_record` VALUES (5331, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:02:07', 0);
INSERT INTO `sys_record` VALUES (5332, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:02:42', 1);
INSERT INTO `sys_record` VALUES (5333, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:02:48', 1);
INSERT INTO `sys_record` VALUES (5334, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:02:48', 1);
INSERT INTO `sys_record` VALUES (5335, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:02:48', 7);
INSERT INTO `sys_record` VALUES (5336, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:02:49', 3);
INSERT INTO `sys_record` VALUES (5337, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:02:50', 0);
INSERT INTO `sys_record` VALUES (5338, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:03:12', 0);
INSERT INTO `sys_record` VALUES (5339, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:03:14', 0);
INSERT INTO `sys_record` VALUES (5340, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:03:14', 5);
INSERT INTO `sys_record` VALUES (5341, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:03:25', 1);
INSERT INTO `sys_record` VALUES (5342, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:03:25', 2);
INSERT INTO `sys_record` VALUES (5343, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:03:26', 10);
INSERT INTO `sys_record` VALUES (5344, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:05:15', 10);
INSERT INTO `sys_record` VALUES (5345, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:05:16', 1);
INSERT INTO `sys_record` VALUES (5346, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:05:30', 9595);
INSERT INTO `sys_record` VALUES (5347, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:05:30', 11);
INSERT INTO `sys_record` VALUES (5348, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:23:34', 15);
INSERT INTO `sys_record` VALUES (5349, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:23:34', 15);
INSERT INTO `sys_record` VALUES (5350, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:23:34', 40);
INSERT INTO `sys_record` VALUES (5351, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:23:35', 1);
INSERT INTO `sys_record` VALUES (5352, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:23:36', 0);
INSERT INTO `sys_record` VALUES (5353, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:23:43', 158);
INSERT INTO `sys_record` VALUES (5354, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:23:43', 3);
INSERT INTO `sys_record` VALUES (5355, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:23:49', 1);
INSERT INTO `sys_record` VALUES (5356, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:23:50', 0);
INSERT INTO `sys_record` VALUES (5357, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:23:59', 97);
INSERT INTO `sys_record` VALUES (5358, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:25:22', 9);
INSERT INTO `sys_record` VALUES (5359, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:25:30', 56);
INSERT INTO `sys_record` VALUES (5360, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:25:30', 8);
INSERT INTO `sys_record` VALUES (5361, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:25:36', 1);
INSERT INTO `sys_record` VALUES (5362, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:25:37', 2);
INSERT INTO `sys_record` VALUES (5363, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:25:44', 3);
INSERT INTO `sys_record` VALUES (5364, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:25:44', 8);
INSERT INTO `sys_record` VALUES (5365, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:25:45', 16);
INSERT INTO `sys_record` VALUES (5366, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:25:46', 1);
INSERT INTO `sys_record` VALUES (5367, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:25:47', 0);
INSERT INTO `sys_record` VALUES (5368, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:35:05', 12);
INSERT INTO `sys_record` VALUES (5369, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:35:05', 12);
INSERT INTO `sys_record` VALUES (5370, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:35:05', 24);
INSERT INTO `sys_record` VALUES (5371, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:35:07', 1);
INSERT INTO `sys_record` VALUES (5372, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:35:07', 0);
INSERT INTO `sys_record` VALUES (5373, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:37:21', 117817);
INSERT INTO `sys_record` VALUES (5374, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:37:21', 10);
INSERT INTO `sys_record` VALUES (5375, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:37:30', 0);
INSERT INTO `sys_record` VALUES (5376, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:37:30', 2);
INSERT INTO `sys_record` VALUES (5377, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:37:30', 9);
INSERT INTO `sys_record` VALUES (5378, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:43:15', 8);
INSERT INTO `sys_record` VALUES (5379, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:43:16', 1);
INSERT INTO `sys_record` VALUES (5380, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:43:34', 14781);
INSERT INTO `sys_record` VALUES (5381, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:43:34', 7);
INSERT INTO `sys_record` VALUES (5382, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:44:25', 1);
INSERT INTO `sys_record` VALUES (5383, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:44:41', 5);
INSERT INTO `sys_record` VALUES (5384, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:44:41', 10);
INSERT INTO `sys_record` VALUES (5385, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:44:41', 17);
INSERT INTO `sys_record` VALUES (5386, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:47:13', 13);
INSERT INTO `sys_record` VALUES (5387, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:47:13', 13);
INSERT INTO `sys_record` VALUES (5388, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:47:13', 28);
INSERT INTO `sys_record` VALUES (5389, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 00:47:14', 1);
INSERT INTO `sys_record` VALUES (5390, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 00:47:15', 0);
INSERT INTO `sys_record` VALUES (5391, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 00:47:26', 160);
INSERT INTO `sys_record` VALUES (5392, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:47:26', 5);
INSERT INTO `sys_record` VALUES (5393, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:47:36', 1);
INSERT INTO `sys_record` VALUES (5394, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:47:36', 1);
INSERT INTO `sys_record` VALUES (5395, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:47:36', 36);
INSERT INTO `sys_record` VALUES (5396, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 00:47:44', 1);
INSERT INTO `sys_record` VALUES (5397, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 00:47:44', 1);
INSERT INTO `sys_record` VALUES (5398, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 00:47:44', 8);
INSERT INTO `sys_record` VALUES (5399, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:19:21', 1);
INSERT INTO `sys_record` VALUES (5400, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:19:21', 6);
INSERT INTO `sys_record` VALUES (5401, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:20:28', 1);
INSERT INTO `sys_record` VALUES (5402, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:20:28', 8);
INSERT INTO `sys_record` VALUES (5403, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:21:04', 5);
INSERT INTO `sys_record` VALUES (5404, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:21:04', 9);
INSERT INTO `sys_record` VALUES (5405, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:24:11', 1);
INSERT INTO `sys_record` VALUES (5406, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:24:11', 7);
INSERT INTO `sys_record` VALUES (5407, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:26:22', 1);
INSERT INTO `sys_record` VALUES (5408, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:26:22', 6);
INSERT INTO `sys_record` VALUES (5409, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:27:46', 1);
INSERT INTO `sys_record` VALUES (5410, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:27:46', 6);
INSERT INTO `sys_record` VALUES (5411, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:28:29', 1);
INSERT INTO `sys_record` VALUES (5412, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:28:29', 7);
INSERT INTO `sys_record` VALUES (5413, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:29:01', 1);
INSERT INTO `sys_record` VALUES (5414, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:29:01', 8);
INSERT INTO `sys_record` VALUES (5415, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:29:09', 1);
INSERT INTO `sys_record` VALUES (5416, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:29:09', 9);
INSERT INTO `sys_record` VALUES (5417, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:29:53', 1);
INSERT INTO `sys_record` VALUES (5418, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:29:53', 6);
INSERT INTO `sys_record` VALUES (5419, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:30:46', 1);
INSERT INTO `sys_record` VALUES (5420, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:30:46', 7);
INSERT INTO `sys_record` VALUES (5421, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:32:01', 1);
INSERT INTO `sys_record` VALUES (5422, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:32:01', 7);
INSERT INTO `sys_record` VALUES (5423, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:32:04', 0);
INSERT INTO `sys_record` VALUES (5424, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 01:32:04', 2);
INSERT INTO `sys_record` VALUES (5425, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:32:04', 8);
INSERT INTO `sys_record` VALUES (5426, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:32:38', 1);
INSERT INTO `sys_record` VALUES (5427, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:32:38', 7);
INSERT INTO `sys_record` VALUES (5428, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:32:41', 2);
INSERT INTO `sys_record` VALUES (5429, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:32:41', 7);
INSERT INTO `sys_record` VALUES (5430, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:33:06', 2);
INSERT INTO `sys_record` VALUES (5431, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:33:06', 8);
INSERT INTO `sys_record` VALUES (5432, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:33:07', 1);
INSERT INTO `sys_record` VALUES (5433, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:33:07', 7);
INSERT INTO `sys_record` VALUES (5434, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:33:42', 1);
INSERT INTO `sys_record` VALUES (5435, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:33:42', 7);
INSERT INTO `sys_record` VALUES (5436, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:33:44', 2);
INSERT INTO `sys_record` VALUES (5437, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:33:44', 7);
INSERT INTO `sys_record` VALUES (5438, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:34:21', 1);
INSERT INTO `sys_record` VALUES (5439, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:34:21', 8);
INSERT INTO `sys_record` VALUES (5440, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:34:22', 1);
INSERT INTO `sys_record` VALUES (5441, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:34:22', 7);
INSERT INTO `sys_record` VALUES (5442, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:34:28', 1);
INSERT INTO `sys_record` VALUES (5443, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:34:28', 7);
INSERT INTO `sys_record` VALUES (5444, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:35:59', 1);
INSERT INTO `sys_record` VALUES (5445, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:35:59', 9);
INSERT INTO `sys_record` VALUES (5446, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:36:01', 1);
INSERT INTO `sys_record` VALUES (5447, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:36:01', 6);
INSERT INTO `sys_record` VALUES (5448, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:36:09', 1);
INSERT INTO `sys_record` VALUES (5449, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:36:09', 6);
INSERT INTO `sys_record` VALUES (5450, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 01:36:38', 1);
INSERT INTO `sys_record` VALUES (5451, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 01:36:38', 0);
INSERT INTO `sys_record` VALUES (5452, '上传书籍照片', '/api/okr/book/changeImg', 'admin', '127.0.0.1', '2021-12-14 01:36:46', 308);
INSERT INTO `sys_record` VALUES (5453, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 01:36:52', 190);
INSERT INTO `sys_record` VALUES (5454, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:36:52', 13);
INSERT INTO `sys_record` VALUES (5455, '删除书籍', '/api/okr/book/cancel', 'admin', '127.0.0.1', '2021-12-14 01:39:00', 51);
INSERT INTO `sys_record` VALUES (5456, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:39:00', 4);
INSERT INTO `sys_record` VALUES (5457, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:39:08', 1);
INSERT INTO `sys_record` VALUES (5458, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:39:08', 7);
INSERT INTO `sys_record` VALUES (5459, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-14 01:39:51', 14);
INSERT INTO `sys_record` VALUES (5460, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:40:42', 12);
INSERT INTO `sys_record` VALUES (5461, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:40:42', 19);
INSERT INTO `sys_record` VALUES (5462, '删除书籍', '/api/okr/book/cancel', 'admin', '127.0.0.1', '2021-12-14 01:40:49', 55);
INSERT INTO `sys_record` VALUES (5463, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:40:49', 5);
INSERT INTO `sys_record` VALUES (5464, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:40:59', 2);
INSERT INTO `sys_record` VALUES (5465, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:40:59', 6);
INSERT INTO `sys_record` VALUES (5466, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-14 01:42:14', 16);
INSERT INTO `sys_record` VALUES (5467, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-14 01:42:15', 11);
INSERT INTO `sys_record` VALUES (5468, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 01:42:22', 1);
INSERT INTO `sys_record` VALUES (5469, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 01:42:22', 7);
INSERT INTO `sys_record` VALUES (5470, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 22:25:26', 39);
INSERT INTO `sys_record` VALUES (5471, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-14 22:25:28', 1948);
INSERT INTO `sys_record` VALUES (5472, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 22:26:56', 12);
INSERT INTO `sys_record` VALUES (5473, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:26:56', 84);
INSERT INTO `sys_record` VALUES (5474, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 22:27:07', 116);
INSERT INTO `sys_record` VALUES (5475, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:27:07', 10);
INSERT INTO `sys_record` VALUES (5476, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 22:27:18', 54);
INSERT INTO `sys_record` VALUES (5477, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:27:18', 6);
INSERT INTO `sys_record` VALUES (5478, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 22:27:57', 88);
INSERT INTO `sys_record` VALUES (5479, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:27:57', 9);
INSERT INTO `sys_record` VALUES (5480, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 22:27:59', 91);
INSERT INTO `sys_record` VALUES (5481, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:27:59', 9);
INSERT INTO `sys_record` VALUES (5482, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 22:28:02', 63);
INSERT INTO `sys_record` VALUES (5483, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:02', 5);
INSERT INTO `sys_record` VALUES (5484, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 22:28:04', 125);
INSERT INTO `sys_record` VALUES (5485, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:04', 6);
INSERT INTO `sys_record` VALUES (5486, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 22:28:06', 499);
INSERT INTO `sys_record` VALUES (5487, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:06', 15);
INSERT INTO `sys_record` VALUES (5488, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 22:28:08', 112);
INSERT INTO `sys_record` VALUES (5489, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:08', 8);
INSERT INTO `sys_record` VALUES (5490, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 22:28:37', 188);
INSERT INTO `sys_record` VALUES (5491, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:37', 5);
INSERT INTO `sys_record` VALUES (5492, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 22:28:45', 46);
INSERT INTO `sys_record` VALUES (5493, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:28:46', 8);
INSERT INTO `sys_record` VALUES (5494, '请求书籍', '/api/okr/book/query', 'admin', '127.0.0.1', '2021-12-14 22:35:29', 2);
INSERT INTO `sys_record` VALUES (5495, '模糊查询书籍状态', '/api/okr/enum/book', 'admin', '127.0.0.1', '2021-12-14 22:35:30', 0);
INSERT INTO `sys_record` VALUES (5496, '修改书籍', '/api/okr/book/change', 'admin', '127.0.0.1', '2021-12-14 22:35:51', 86);
INSERT INTO `sys_record` VALUES (5497, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:35:51', 6);
INSERT INTO `sys_record` VALUES (5498, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 22:36:20', 1);
INSERT INTO `sys_record` VALUES (5499, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 22:36:20', 7);
INSERT INTO `sys_record` VALUES (5500, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-14 22:37:13', 9);
INSERT INTO `sys_record` VALUES (5501, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-14 22:37:15', 15);
INSERT INTO `sys_record` VALUES (5502, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-14 22:37:22', 1234);
INSERT INTO `sys_record` VALUES (5503, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-14 22:39:10', 9);
INSERT INTO `sys_record` VALUES (5504, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 22:59:39', 18);
INSERT INTO `sys_record` VALUES (5505, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 22:59:44', 3);
INSERT INTO `sys_record` VALUES (5506, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 23:00:20', 12);
INSERT INTO `sys_record` VALUES (5507, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:00:20', 21);
INSERT INTO `sys_record` VALUES (5508, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:01:29', 16);
INSERT INTO `sys_record` VALUES (5509, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 23:01:32', 12);
INSERT INTO `sys_record` VALUES (5510, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:01:32', 24);
INSERT INTO `sys_record` VALUES (5511, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:01:33', 6);
INSERT INTO `sys_record` VALUES (5512, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-14 23:01:37', 18);
INSERT INTO `sys_record` VALUES (5513, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-14 23:01:39', 17);
INSERT INTO `sys_record` VALUES (5514, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:02:04', 4);
INSERT INTO `sys_record` VALUES (5515, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:02:18', 3);
INSERT INTO `sys_record` VALUES (5516, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:02:21', 5);
INSERT INTO `sys_record` VALUES (5517, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 23:02:21', 1);
INSERT INTO `sys_record` VALUES (5518, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:05:49', 44);
INSERT INTO `sys_record` VALUES (5519, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 23:05:52', 10);
INSERT INTO `sys_record` VALUES (5520, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:05:52', 17);
INSERT INTO `sys_record` VALUES (5521, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 23:05:55', 50);
INSERT INTO `sys_record` VALUES (5522, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:05:55', 7);
INSERT INTO `sys_record` VALUES (5523, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 23:05:59', 94);
INSERT INTO `sys_record` VALUES (5524, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:05:59', 5);
INSERT INTO `sys_record` VALUES (5525, '借书', '/api/okr/book/borrow', 'admin', '127.0.0.1', '2021-12-14 23:06:01', 46);
INSERT INTO `sys_record` VALUES (5526, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:01', 6);
INSERT INTO `sys_record` VALUES (5527, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 23:06:06', 146);
INSERT INTO `sys_record` VALUES (5528, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:06', 4);
INSERT INTO `sys_record` VALUES (5529, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 23:06:07', 121);
INSERT INTO `sys_record` VALUES (5530, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:07', 5);
INSERT INTO `sys_record` VALUES (5531, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:10', 6);
INSERT INTO `sys_record` VALUES (5532, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 23:06:10', 1662);
INSERT INTO `sys_record` VALUES (5533, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 23:06:12', 2);
INSERT INTO `sys_record` VALUES (5534, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:12', 6);
INSERT INTO `sys_record` VALUES (5535, '还书', '/api/okr/book/return', 'admin', '127.0.0.1', '2021-12-14 23:06:15', 118);
INSERT INTO `sys_record` VALUES (5536, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:15', 4);
INSERT INTO `sys_record` VALUES (5537, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:06:17', 4);
INSERT INTO `sys_record` VALUES (5538, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-14 23:06:26', 2);
INSERT INTO `sys_record` VALUES (5539, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:26', 7);
INSERT INTO `sys_record` VALUES (5540, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-14 23:06:28', 6);
INSERT INTO `sys_record` VALUES (5541, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-14 23:06:45', 13);
INSERT INTO `sys_record` VALUES (5542, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-14 23:15:52', 11);
INSERT INTO `sys_record` VALUES (5543, '获取路径', '/api/okr/menu/fetch', 'admin', '127.0.0.1', '2021-12-14 23:15:52', 13);
INSERT INTO `sys_record` VALUES (5544, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 23:15:53', 2);
INSERT INTO `sys_record` VALUES (5545, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-14 23:15:54', 1182);
INSERT INTO `sys_record` VALUES (5546, '上传头像文件', '/api/okr/user/changeImg', 'admin', '127.0.0.1', '2021-12-14 23:18:15', 64);
INSERT INTO `sys_record` VALUES (5547, '上传头像文件', '/api/okr/user/changeImg', 'admin', '127.0.0.1', '2021-12-14 23:19:09', 89);
INSERT INTO `sys_record` VALUES (5548, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-14 23:20:56', 3);
INSERT INTO `sys_record` VALUES (5549, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-14 23:21:33', 4);
INSERT INTO `sys_record` VALUES (5550, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-14 23:51:24', 14);
INSERT INTO `sys_record` VALUES (5551, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-14 23:51:25', 1700);
INSERT INTO `sys_record` VALUES (5552, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-15 00:10:57', 9118);
INSERT INTO `sys_record` VALUES (5553, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-15 00:13:17', 65);
INSERT INTO `sys_record` VALUES (5554, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-15 00:13:19', 107);
INSERT INTO `sys_record` VALUES (5555, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-15 00:13:29', 2057);
INSERT INTO `sys_record` VALUES (5556, '更新用户信息', '/api/okr/user/change', 'admin', '127.0.0.1', '2021-12-15 00:15:11', 160);
INSERT INTO `sys_record` VALUES (5557, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-15 00:18:16', 2);
INSERT INTO `sys_record` VALUES (5558, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 00:20:37', 5);
INSERT INTO `sys_record` VALUES (5559, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 00:21:16', 4147);
INSERT INTO `sys_record` VALUES (5560, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 00:24:32', 174675);
INSERT INTO `sys_record` VALUES (5561, '获取路径', '/api/okr/menu/fetch', '18111493050', '127.0.0.1', '2021-12-15 00:24:32', 16);
INSERT INTO `sys_record` VALUES (5562, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:24:32', 2);
INSERT INTO `sys_record` VALUES (5563, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:24:34', 1298);
INSERT INTO `sys_record` VALUES (5564, '修改密码', '/api/okr/user/changePassword', '18111493050', '127.0.0.1', '2021-12-15 00:25:19', 57);
INSERT INTO `sys_record` VALUES (5565, '修改密码', '/api/okr/user/changePassword', '18111493050', '127.0.0.1', '2021-12-15 00:26:02', 53);
INSERT INTO `sys_record` VALUES (5566, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 00:30:59', 3);
INSERT INTO `sys_record` VALUES (5567, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 00:31:20', 2162);
INSERT INTO `sys_record` VALUES (5568, '获取路径', '/api/okr/menu/fetch', '18111493050', '127.0.0.1', '2021-12-15 00:31:20', 4);
INSERT INTO `sys_record` VALUES (5569, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:31:20', 1);
INSERT INTO `sys_record` VALUES (5570, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:31:21', 1232);
INSERT INTO `sys_record` VALUES (5571, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:31:36', 45);
INSERT INTO `sys_record` VALUES (5572, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:31:49', 16);
INSERT INTO `sys_record` VALUES (5573, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:31:49', 21);
INSERT INTO `sys_record` VALUES (5574, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:32:07', 1197);
INSERT INTO `sys_record` VALUES (5575, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:32:09', 5);
INSERT INTO `sys_record` VALUES (5576, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:32:10', 2);
INSERT INTO `sys_record` VALUES (5577, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:32:10', 7);
INSERT INTO `sys_record` VALUES (5578, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:32:12', 10);
INSERT INTO `sys_record` VALUES (5579, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:32:14', 3);
INSERT INTO `sys_record` VALUES (5580, '注册用户', '/api/okr/user/add', '18111493050', '127.0.0.1', '2021-12-15 00:33:15', 166);
INSERT INTO `sys_record` VALUES (5581, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:33:15', 4);
INSERT INTO `sys_record` VALUES (5582, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 00:33:24', 13);
INSERT INTO `sys_record` VALUES (5583, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:33:26', 0);
INSERT INTO `sys_record` VALUES (5584, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:33:36', 0);
INSERT INTO `sys_record` VALUES (5585, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:34:52', 0);
INSERT INTO `sys_record` VALUES (5586, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:36:13', 3);
INSERT INTO `sys_record` VALUES (5587, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 00:36:17', 17);
INSERT INTO `sys_record` VALUES (5588, '模糊查询成员状态', '/api/okr/enum/userStatus', '18111493050', '127.0.0.1', '2021-12-15 00:36:19', 0);
INSERT INTO `sys_record` VALUES (5589, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:36:23', 0);
INSERT INTO `sys_record` VALUES (5590, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:36:26', 0);
INSERT INTO `sys_record` VALUES (5591, '更新用户权限', '/api/okr/user/changeRole', '18111493050', '127.0.0.1', '2021-12-15 00:36:49', 97);
INSERT INTO `sys_record` VALUES (5592, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:36:50', 6);
INSERT INTO `sys_record` VALUES (5593, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:38:15', 3);
INSERT INTO `sys_record` VALUES (5594, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:38:15', 5);
INSERT INTO `sys_record` VALUES (5595, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:38:20', 1182);
INSERT INTO `sys_record` VALUES (5596, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:38:24', 3);
INSERT INTO `sys_record` VALUES (5597, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:38:30', 1);
INSERT INTO `sys_record` VALUES (5598, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:38:30', 6);
INSERT INTO `sys_record` VALUES (5599, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:39:56', 33576);
INSERT INTO `sys_record` VALUES (5600, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:39:56', 7);
INSERT INTO `sys_record` VALUES (5601, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:40:02', 2554);
INSERT INTO `sys_record` VALUES (5602, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:40:02', 2563);
INSERT INTO `sys_record` VALUES (5603, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:40:06', 3);
INSERT INTO `sys_record` VALUES (5604, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 00:40:12', 2);
INSERT INTO `sys_record` VALUES (5605, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:40:13', 0);
INSERT INTO `sys_record` VALUES (5606, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:40:32', 2);
INSERT INTO `sys_record` VALUES (5607, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:40:32', 5);
INSERT INTO `sys_record` VALUES (5608, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:40:37', 5);
INSERT INTO `sys_record` VALUES (5609, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 00:40:39', 1);
INSERT INTO `sys_record` VALUES (5610, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:40:40', 0);
INSERT INTO `sys_record` VALUES (5611, '根据用户名选择用户', '/api/okr/user/queryByUsername', '18111493050', '127.0.0.1', '2021-12-15 00:40:47', 1);
INSERT INTO `sys_record` VALUES (5612, '更新用户信息', '/api/okr/user/change', '18111493050', '127.0.0.1', '2021-12-15 00:41:40', 56);
INSERT INTO `sys_record` VALUES (5613, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:41:40', 3);
INSERT INTO `sys_record` VALUES (5614, '根据用户名选择用户', '/api/okr/user/queryByUsername', '18111493050', '127.0.0.1', '2021-12-15 00:41:44', 1);
INSERT INTO `sys_record` VALUES (5615, '更新用户信息', '/api/okr/user/change', '18111493050', '127.0.0.1', '2021-12-15 00:41:50', 58);
INSERT INTO `sys_record` VALUES (5616, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:41:50', 3);
INSERT INTO `sys_record` VALUES (5617, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 00:42:05', 1);
INSERT INTO `sys_record` VALUES (5618, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:42:06', 0);
INSERT INTO `sys_record` VALUES (5619, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 00:42:07', 0);
INSERT INTO `sys_record` VALUES (5620, '更新用户权限', '/api/okr/user/changeRole', '18111493050', '127.0.0.1', '2021-12-15 00:42:08', 49);
INSERT INTO `sys_record` VALUES (5621, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:42:08', 4);
INSERT INTO `sys_record` VALUES (5622, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:42:21', 9);
INSERT INTO `sys_record` VALUES (5623, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:42:21', 141);
INSERT INTO `sys_record` VALUES (5624, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:42:24', 12);
INSERT INTO `sys_record` VALUES (5625, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:42:26', 3);
INSERT INTO `sys_record` VALUES (5626, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:42:26', 8);
INSERT INTO `sys_record` VALUES (5627, '请求书籍', '/api/okr/book/query', '18111493050', '127.0.0.1', '2021-12-15 00:42:38', 1);
INSERT INTO `sys_record` VALUES (5628, '模糊查询书籍状态', '/api/okr/enum/book', '18111493050', '127.0.0.1', '2021-12-15 00:42:39', 0);
INSERT INTO `sys_record` VALUES (5629, '模糊查询书籍状态', '/api/okr/enum/book', '18111493050', '127.0.0.1', '2021-12-15 00:42:49', 1);
INSERT INTO `sys_record` VALUES (5630, '修改书籍', '/api/okr/book/change', '18111493050', '127.0.0.1', '2021-12-15 00:42:50', 93);
INSERT INTO `sys_record` VALUES (5631, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:42:50', 38);
INSERT INTO `sys_record` VALUES (5632, '请求书籍', '/api/okr/book/query', '18111493050', '127.0.0.1', '2021-12-15 00:42:55', 1);
INSERT INTO `sys_record` VALUES (5633, '修改书籍', '/api/okr/book/change', '18111493050', '127.0.0.1', '2021-12-15 00:43:12', 231);
INSERT INTO `sys_record` VALUES (5634, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:43:12', 8);
INSERT INTO `sys_record` VALUES (5635, '请求书籍', '/api/okr/book/query', '18111493050', '127.0.0.1', '2021-12-15 00:43:57', 1);
INSERT INTO `sys_record` VALUES (5636, '修改书籍', '/api/okr/book/change', '18111493050', '127.0.0.1', '2021-12-15 00:44:01', 192);
INSERT INTO `sys_record` VALUES (5637, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:01', 6);
INSERT INTO `sys_record` VALUES (5638, '借书', '/api/okr/book/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:03', 206);
INSERT INTO `sys_record` VALUES (5639, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:03', 5);
INSERT INTO `sys_record` VALUES (5640, '借书', '/api/okr/book/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:05', 46);
INSERT INTO `sys_record` VALUES (5641, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:05', 6);
INSERT INTO `sys_record` VALUES (5642, '借书', '/api/okr/book/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:06', 61);
INSERT INTO `sys_record` VALUES (5643, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:06', 4);
INSERT INTO `sys_record` VALUES (5644, '借书', '/api/okr/book/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:10', 54);
INSERT INTO `sys_record` VALUES (5645, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:10', 6);
INSERT INTO `sys_record` VALUES (5646, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:11', 4);
INSERT INTO `sys_record` VALUES (5647, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:44:21', 1);
INSERT INTO `sys_record` VALUES (5648, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:21', 8);
INSERT INTO `sys_record` VALUES (5649, '还书', '/api/okr/book/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:24', 143);
INSERT INTO `sys_record` VALUES (5650, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:24', 6);
INSERT INTO `sys_record` VALUES (5651, '还书', '/api/okr/book/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:25', 100);
INSERT INTO `sys_record` VALUES (5652, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:25', 5);
INSERT INTO `sys_record` VALUES (5653, '还书', '/api/okr/book/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:28', 93);
INSERT INTO `sys_record` VALUES (5654, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:28', 5);
INSERT INTO `sys_record` VALUES (5655, '还书', '/api/okr/book/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:31', 623);
INSERT INTO `sys_record` VALUES (5656, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:44:31', 4);
INSERT INTO `sys_record` VALUES (5657, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:32', 4);
INSERT INTO `sys_record` VALUES (5658, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:35', 13);
INSERT INTO `sys_record` VALUES (5659, '根据id查询钥匙', '/api/okr/key/queryById', '18111493050', '127.0.0.1', '2021-12-15 00:44:37', 9);
INSERT INTO `sys_record` VALUES (5660, '模糊查询钥匙', '/api/okr/enum/key', '18111493050', '127.0.0.1', '2021-12-15 00:44:37', 0);
INSERT INTO `sys_record` VALUES (5661, '修改钥匙', '/api/okr/key/change', '18111493050', '127.0.0.1', '2021-12-15 00:44:40', 105);
INSERT INTO `sys_record` VALUES (5662, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:40', 5);
INSERT INTO `sys_record` VALUES (5663, '借钥匙', '/api/okr/key/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:43', 247);
INSERT INTO `sys_record` VALUES (5664, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:43', 2);
INSERT INTO `sys_record` VALUES (5665, '借钥匙', '/api/okr/key/borrow', '18111493050', '127.0.0.1', '2021-12-15 00:44:45', 1261);
INSERT INTO `sys_record` VALUES (5666, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:45', 7);
INSERT INTO `sys_record` VALUES (5667, '钥匙记录列表', '/api/okr/keyUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:46', 8);
INSERT INTO `sys_record` VALUES (5668, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:50', 3);
INSERT INTO `sys_record` VALUES (5669, '根据id查询钥匙', '/api/okr/key/queryById', '18111493050', '127.0.0.1', '2021-12-15 00:44:51', 1);
INSERT INTO `sys_record` VALUES (5670, '模糊查询钥匙', '/api/okr/enum/key', '18111493050', '127.0.0.1', '2021-12-15 00:44:52', 0);
INSERT INTO `sys_record` VALUES (5671, '修改钥匙', '/api/okr/key/change', '18111493050', '127.0.0.1', '2021-12-15 00:44:52', 47);
INSERT INTO `sys_record` VALUES (5672, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:52', 3);
INSERT INTO `sys_record` VALUES (5673, '还钥匙', '/api/okr/key/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:55', 47);
INSERT INTO `sys_record` VALUES (5674, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:55', 5);
INSERT INTO `sys_record` VALUES (5675, '还钥匙', '/api/okr/key/return', '18111493050', '127.0.0.1', '2021-12-15 00:44:57', 160);
INSERT INTO `sys_record` VALUES (5676, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:44:57', 2);
INSERT INTO `sys_record` VALUES (5677, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:00', 3);
INSERT INTO `sys_record` VALUES (5678, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:45:02', 1165);
INSERT INTO `sys_record` VALUES (5679, '钥匙记录列表', '/api/okr/keyUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:03', 6);
INSERT INTO `sys_record` VALUES (5680, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:07', 3);
INSERT INTO `sys_record` VALUES (5681, '钥匙记录列表', '/api/okr/keyUser/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:09', 5);
INSERT INTO `sys_record` VALUES (5682, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:11', 9);
INSERT INTO `sys_record` VALUES (5683, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:18', 5);
INSERT INTO `sys_record` VALUES (5684, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:19', 4);
INSERT INTO `sys_record` VALUES (5685, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:22', 3);
INSERT INTO `sys_record` VALUES (5686, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:22', 2);
INSERT INTO `sys_record` VALUES (5687, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:30', 3);
INSERT INTO `sys_record` VALUES (5688, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:45:33', 44);
INSERT INTO `sys_record` VALUES (5689, '操作记录列表', '/api/okr/sysRecord/query', '18111493050', '127.0.0.1', '2021-12-15 00:45:34', 4);
INSERT INTO `sys_record` VALUES (5690, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:45:37', 1);
INSERT INTO `sys_record` VALUES (5691, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:45:37', 5);
INSERT INTO `sys_record` VALUES (5692, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:45:42', 3);
INSERT INTO `sys_record` VALUES (5693, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:45:55', 8);
INSERT INTO `sys_record` VALUES (5694, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:04', 6);
INSERT INTO `sys_record` VALUES (5695, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:08', 3);
INSERT INTO `sys_record` VALUES (5696, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 00:46:16', 1180);
INSERT INTO `sys_record` VALUES (5697, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:18', 3);
INSERT INTO `sys_record` VALUES (5698, '报名结果查询', '/api/okr/signup/query', '18111493050', '127.0.0.1', '2021-12-15 00:46:27', 1);
INSERT INTO `sys_record` VALUES (5699, '模糊查询报名状态', '/api/okr/enum/signUpStatus', '18111493050', '127.0.0.1', '2021-12-15 00:46:28', 0);
INSERT INTO `sys_record` VALUES (5700, '模糊查询报名状态', '/api/okr/enum/signUpStatus', '18111493050', '127.0.0.1', '2021-12-15 00:46:29', 1);
INSERT INTO `sys_record` VALUES (5701, '模糊查询报名状态', '/api/okr/enum/signUpStatus', '18111493050', '127.0.0.1', '2021-12-15 00:46:31', 0);
INSERT INTO `sys_record` VALUES (5702, '更新报名记录', '/api/okr/signup/change', '18111493050', '127.0.0.1', '2021-12-15 00:46:36', 57);
INSERT INTO `sys_record` VALUES (5703, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:36', 137);
INSERT INTO `sys_record` VALUES (5704, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:38', 2);
INSERT INTO `sys_record` VALUES (5705, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:46:56', 2);
INSERT INTO `sys_record` VALUES (5706, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:47:08', 2);
INSERT INTO `sys_record` VALUES (5707, '获取报名记录', '/api/okr/signup/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:47:10', 3);
INSERT INTO `sys_record` VALUES (5708, '获取资源接口', '/api/okr/resource/query', '18111493050', '127.0.0.1', '2021-12-15 00:47:12', 19);
INSERT INTO `sys_record` VALUES (5709, '更改接口开放状态', '/api/okr/resource/change', '18111493050', '127.0.0.1', '2021-12-15 00:47:18', 48);
INSERT INTO `sys_record` VALUES (5710, '获取资源接口', '/api/okr/resource/query', '18111493050', '127.0.0.1', '2021-12-15 00:47:18', 3);
INSERT INTO `sys_record` VALUES (5711, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:47:21', 1);
INSERT INTO `sys_record` VALUES (5712, '获取资源接口', '/api/okr/resource/query', '18111493050', '127.0.0.1', '2021-12-15 00:47:25', 3);
INSERT INTO `sys_record` VALUES (5713, '更改接口开放状态', '/api/okr/resource/change', '18111493050', '127.0.0.1', '2021-12-15 00:47:27', 52);
INSERT INTO `sys_record` VALUES (5714, '获取资源接口', '/api/okr/resource/query', '18111493050', '127.0.0.1', '2021-12-15 00:47:27', 1);
INSERT INTO `sys_record` VALUES (5715, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:47:30', 1);
INSERT INTO `sys_record` VALUES (5716, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:47:30', 7);
INSERT INTO `sys_record` VALUES (5717, '获取标签列表', '/api/okr/tag/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:47:33', 6);
INSERT INTO `sys_record` VALUES (5718, '获取标签', '/api/okr/tag/query', '18111493050', '127.0.0.1', '2021-12-15 00:47:39', 1);
INSERT INTO `sys_record` VALUES (5719, '更新标签', '/api/okr/tag/change', '18111493050', '127.0.0.1', '2021-12-15 00:47:43', 52);
INSERT INTO `sys_record` VALUES (5720, '获取标签列表', '/api/okr/tag/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:47:43', 2);
INSERT INTO `sys_record` VALUES (5721, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:53:46', 1);
INSERT INTO `sys_record` VALUES (5722, '获取标签列表', '/api/okr/tag/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:53:46', 4);
INSERT INTO `sys_record` VALUES (5723, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:53:48', 2);
INSERT INTO `sys_record` VALUES (5724, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:53:48', 7);
INSERT INTO `sys_record` VALUES (5725, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 00:56:59', 1);
INSERT INTO `sys_record` VALUES (5726, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 00:56:59', 3);
INSERT INTO `sys_record` VALUES (5727, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:56:59', 9);
INSERT INTO `sys_record` VALUES (5728, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:58:13', 9);
INSERT INTO `sys_record` VALUES (5729, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 00:59:15', 9454);
INSERT INTO `sys_record` VALUES (5730, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:01:43', 1589);
INSERT INTO `sys_record` VALUES (5731, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:04:48', 1492);
INSERT INTO `sys_record` VALUES (5732, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:05:00', 5);
INSERT INTO `sys_record` VALUES (5733, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:05:09', 3);
INSERT INTO `sys_record` VALUES (5734, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:05:10', 4);
INSERT INTO `sys_record` VALUES (5735, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:05:36', 14);
INSERT INTO `sys_record` VALUES (5736, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:07:37', 10);
INSERT INTO `sys_record` VALUES (5737, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 01:07:37', 2);
INSERT INTO `sys_record` VALUES (5738, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 01:07:37', 4);
INSERT INTO `sys_record` VALUES (5739, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:07:37', 6);
INSERT INTO `sys_record` VALUES (5740, '注册用户', '/api/okr/user/add', '18111493050', '127.0.0.1', '2021-12-15 01:08:11', 93);
INSERT INTO `sys_record` VALUES (5741, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:08:11', 2);
INSERT INTO `sys_record` VALUES (5742, '获取用户权限信息', '/api/okr/user/queryRole', '18111493050', '127.0.0.1', '2021-12-15 01:08:14', 10);
INSERT INTO `sys_record` VALUES (5743, '模糊查询角色', '/api/okr/enum/role', '18111493050', '127.0.0.1', '2021-12-15 01:08:15', 5);
INSERT INTO `sys_record` VALUES (5744, '模糊查询成员状态', '/api/okr/enum/userStatus', '18111493050', '127.0.0.1', '2021-12-15 01:08:26', 1);
INSERT INTO `sys_record` VALUES (5745, '模糊查询成员状态', '/api/okr/enum/userStatus', '18111493050', '127.0.0.1', '2021-12-15 01:08:28', 0);
INSERT INTO `sys_record` VALUES (5746, '更新用户权限', '/api/okr/user/changeRole', '18111493050', '127.0.0.1', '2021-12-15 01:08:28', 51);
INSERT INTO `sys_record` VALUES (5747, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:08:28', 2);
INSERT INTO `sys_record` VALUES (5748, '根据用户名选择用户', '/api/okr/user/queryByUsername', '18111493050', '127.0.0.1', '2021-12-15 01:08:32', 1);
INSERT INTO `sys_record` VALUES (5749, '更新用户信息', '/api/okr/user/change', '18111493050', '127.0.0.1', '2021-12-15 01:08:52', 86);
INSERT INTO `sys_record` VALUES (5750, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:08:52', 3);
INSERT INTO `sys_record` VALUES (5751, '模糊查询用户名列表', '/api/okr/enum/username', '18111493050', '127.0.0.1', '2021-12-15 01:09:02', 2);
INSERT INTO `sys_record` VALUES (5752, '模糊查询用户名列表', '/api/okr/enum/username', '18111493050', '127.0.0.1', '2021-12-15 01:09:03', 2);
INSERT INTO `sys_record` VALUES (5753, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:09:03', 2);
INSERT INTO `sys_record` VALUES (5754, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:09:05', 3);
INSERT INTO `sys_record` VALUES (5755, '模糊查询姓名列表', '/api/okr/enum/name', '18111493050', '127.0.0.1', '2021-12-15 01:10:03', 3);
INSERT INTO `sys_record` VALUES (5756, '根据用户名选择用户', '/api/okr/user/queryByUsername', '18111493050', '127.0.0.1', '2021-12-15 01:10:08', 0);
INSERT INTO `sys_record` VALUES (5757, '更新用户信息', '/api/okr/user/change', '18111493050', '127.0.0.1', '2021-12-15 01:10:16', 136);
INSERT INTO `sys_record` VALUES (5758, '查询用户列表', '/api/okr/user/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:10:16', 4);
INSERT INTO `sys_record` VALUES (5759, '模糊查询姓名列表', '/api/okr/enum/name', '18111493050', '127.0.0.1', '2021-12-15 01:10:18', 2);
INSERT INTO `sys_record` VALUES (5760, '模糊查询专业列表', '/api/okr/enum/major', '18111493050', '127.0.0.1', '2021-12-15 01:10:21', 2);
INSERT INTO `sys_record` VALUES (5761, '模糊查询用户名列表', '/api/okr/enum/username', '18111493050', '127.0.0.1', '2021-12-15 01:10:42', 1);
INSERT INTO `sys_record` VALUES (5762, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 01:10:48', 1198);
INSERT INTO `sys_record` VALUES (5763, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 01:10:48', 3);
INSERT INTO `sys_record` VALUES (5764, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:10:48', 6);
INSERT INTO `sys_record` VALUES (5765, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 01:10:49', 8);
INSERT INTO `sys_record` VALUES (5766, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 01:10:52', 11);
INSERT INTO `sys_record` VALUES (5767, '钥匙记录列表', '/api/okr/keyUser/query', '18111493050', '127.0.0.1', '2021-12-15 01:10:53', 11);
INSERT INTO `sys_record` VALUES (5768, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 01:11:04', 4);
INSERT INTO `sys_record` VALUES (5769, '获取路径', '/api/okr/menu/fetch', 'test', '127.0.0.1', '2021-12-15 01:11:04', 12);
INSERT INTO `sys_record` VALUES (5770, '获取用户信息', '/api/okr/user/query', 'test', '127.0.0.1', '2021-12-15 01:11:04', 1);
INSERT INTO `sys_record` VALUES (5771, '服务器监控', '/api/okr/monitor/server', 'test', '127.0.0.1', '2021-12-15 01:11:05', 1186);
INSERT INTO `sys_record` VALUES (5772, '服务器监控', '/api/okr/monitor/server', 'test', '127.0.0.1', '2021-12-15 01:11:11', 1177);
INSERT INTO `sys_record` VALUES (5773, '查询用户列表', '/api/okr/user/queryList', 'test', '127.0.0.1', '2021-12-15 01:11:15', 3);
INSERT INTO `sys_record` VALUES (5774, '书籍列表', '/api/okr/book/queryList', 'test', '127.0.0.1', '2021-12-15 01:11:23', 7);
INSERT INTO `sys_record` VALUES (5775, '钥匙列表', '/api/okr/key/query', 'test', '127.0.0.1', '2021-12-15 01:11:32', 3);
INSERT INTO `sys_record` VALUES (5776, '钥匙记录列表', '/api/okr/keyUser/query', 'test', '127.0.0.1', '2021-12-15 01:11:33', 5);
INSERT INTO `sys_record` VALUES (5777, '书籍列表', '/api/okr/book/queryList', 'test', '127.0.0.1', '2021-12-15 01:11:36', 7);
INSERT INTO `sys_record` VALUES (5778, '书籍列表', '/api/okr/book/queryList', 'test', '127.0.0.1', '2021-12-15 01:15:37', 8);
INSERT INTO `sys_record` VALUES (5779, '获取用户信息', '/api/okr/user/query', 'test', '127.0.0.1', '2021-12-15 01:17:19', 3);
INSERT INTO `sys_record` VALUES (5780, '书籍列表', '/api/okr/book/queryList', 'test', '127.0.0.1', '2021-12-15 01:17:19', 11);
INSERT INTO `sys_record` VALUES (5781, '钥匙列表', '/api/okr/key/query', 'test', '127.0.0.1', '2021-12-15 01:17:29', 5);
INSERT INTO `sys_record` VALUES (5782, '钥匙记录列表', '/api/okr/keyUser/query', 'test', '127.0.0.1', '2021-12-15 01:17:32', 4);
INSERT INTO `sys_record` VALUES (5783, '钥匙列表', '/api/okr/key/query', 'test', '127.0.0.1', '2021-12-15 01:17:34', 5);
INSERT INTO `sys_record` VALUES (5784, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 01:18:09', 1);
INSERT INTO `sys_record` VALUES (5785, '获取路径', '/api/okr/menu/fetch', '18111493050', '127.0.0.1', '2021-12-15 01:18:09', 5);
INSERT INTO `sys_record` VALUES (5786, '获取用户信息', '/api/okr/user/query', '18111493050', '127.0.0.1', '2021-12-15 01:18:09', 1);
INSERT INTO `sys_record` VALUES (5787, '服务器监控', '/api/okr/monitor/server', '18111493050', '127.0.0.1', '2021-12-15 01:18:10', 1145);
INSERT INTO `sys_record` VALUES (5788, '模糊查询标签', '/api/okr/enum/tag', '18111493050', '127.0.0.1', '2021-12-15 01:18:14', 2);
INSERT INTO `sys_record` VALUES (5789, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:18:14', 7);
INSERT INTO `sys_record` VALUES (5790, '添加书籍', '/api/okr/book/add', '18111493050', '127.0.0.1', '2021-12-15 01:18:23', 39);
INSERT INTO `sys_record` VALUES (5791, '书籍列表', '/api/okr/book/queryList', '18111493050', '127.0.0.1', '2021-12-15 01:18:23', 5);
INSERT INTO `sys_record` VALUES (5792, '查询借阅记录', '/api/okr/bookUser/query', '18111493050', '127.0.0.1', '2021-12-15 01:18:27', 3);
INSERT INTO `sys_record` VALUES (5793, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 01:18:29', 4);
INSERT INTO `sys_record` VALUES (5794, '增加钥匙', '/api/okr/key/add', '18111493050', '127.0.0.1', '2021-12-15 01:18:33', 53);
INSERT INTO `sys_record` VALUES (5795, '钥匙列表', '/api/okr/key/query', '18111493050', '127.0.0.1', '2021-12-15 01:18:33', 3);
INSERT INTO `sys_record` VALUES (5796, '用户登录', '/api/okr/common/login', NULL, '127.0.0.1', '2021-12-15 01:20:26', 1);
INSERT INTO `sys_record` VALUES (5797, '获取路径', '/api/okr/menu/fetch', 'admin', '127.0.0.1', '2021-12-15 01:20:26', 1);
INSERT INTO `sys_record` VALUES (5798, '获取用户信息', '/api/okr/user/query', 'admin', '127.0.0.1', '2021-12-15 01:20:26', 3);
INSERT INTO `sys_record` VALUES (5799, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-15 01:20:27', 1168);
INSERT INTO `sys_record` VALUES (5800, '查询用户列表', '/api/okr/user/queryList', 'admin', '127.0.0.1', '2021-12-15 01:20:33', 2);
INSERT INTO `sys_record` VALUES (5801, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-15 01:20:39', 1152);
INSERT INTO `sys_record` VALUES (5802, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-15 01:20:40', 1);
INSERT INTO `sys_record` VALUES (5803, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-15 01:20:40', 4);
INSERT INTO `sys_record` VALUES (5804, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-15 01:20:43', 2);
INSERT INTO `sys_record` VALUES (5805, '模糊查询标签', '/api/okr/enum/tag', 'admin', '127.0.0.1', '2021-12-15 01:20:44', 1);
INSERT INTO `sys_record` VALUES (5806, '书籍列表', '/api/okr/book/queryList', 'admin', '127.0.0.1', '2021-12-15 01:20:44', 5);
INSERT INTO `sys_record` VALUES (5807, '查询借阅记录', '/api/okr/bookUser/query', 'admin', '127.0.0.1', '2021-12-15 01:20:50', 3);
INSERT INTO `sys_record` VALUES (5808, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-15 01:20:55', 3);
INSERT INTO `sys_record` VALUES (5809, '删除钥匙', '/api/okr/key/cancel', 'admin', '127.0.0.1', '2021-12-15 01:20:58', 129);
INSERT INTO `sys_record` VALUES (5810, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-15 01:20:58', 2);
INSERT INTO `sys_record` VALUES (5811, '根据id查询钥匙', '/api/okr/key/queryById', 'admin', '127.0.0.1', '2021-12-15 01:20:59', 9);
INSERT INTO `sys_record` VALUES (5812, '模糊查询钥匙', '/api/okr/enum/key', 'admin', '127.0.0.1', '2021-12-15 01:21:00', 0);
INSERT INTO `sys_record` VALUES (5813, '修改钥匙', '/api/okr/key/change', 'admin', '127.0.0.1', '2021-12-15 01:21:02', 48);
INSERT INTO `sys_record` VALUES (5814, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-15 01:21:02', 3);
INSERT INTO `sys_record` VALUES (5815, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:03', 3);
INSERT INTO `sys_record` VALUES (5816, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:07', 2);
INSERT INTO `sys_record` VALUES (5817, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:08', 4);
INSERT INTO `sys_record` VALUES (5818, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:11', 3);
INSERT INTO `sys_record` VALUES (5819, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:14', 2);
INSERT INTO `sys_record` VALUES (5820, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:21:24', 5);
INSERT INTO `sys_record` VALUES (5821, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-15 01:21:26', 17);
INSERT INTO `sys_record` VALUES (5822, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-15 01:21:28', 12);
INSERT INTO `sys_record` VALUES (5823, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-15 01:21:31', 5);
INSERT INTO `sys_record` VALUES (5824, '钥匙列表', '/api/okr/key/query', 'admin', '127.0.0.1', '2021-12-15 01:21:36', 2);
INSERT INTO `sys_record` VALUES (5825, '钥匙记录列表', '/api/okr/keyUser/query', 'admin', '127.0.0.1', '2021-12-15 01:21:38', 4);
INSERT INTO `sys_record` VALUES (5826, '获取标签列表', '/api/okr/tag/queryList', 'admin', '127.0.0.1', '2021-12-15 01:21:40', 3);
INSERT INTO `sys_record` VALUES (5827, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-15 01:21:41', 5);
INSERT INTO `sys_record` VALUES (5828, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-15 01:21:44', 5);
INSERT INTO `sys_record` VALUES (5829, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:21:47', 4);
INSERT INTO `sys_record` VALUES (5830, '服务器监控', '/api/okr/monitor/server', 'admin', '127.0.0.1', '2021-12-15 01:21:56', 1155);
INSERT INTO `sys_record` VALUES (5831, '获取资源接口', '/api/okr/resource/query', 'admin', '127.0.0.1', '2021-12-15 01:21:56', 3);
INSERT INTO `sys_record` VALUES (5832, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-15 01:21:58', 187);
INSERT INTO `sys_record` VALUES (5833, '导出报名单', '/api/okr/signup/export', 'admin', '127.0.0.1', '2021-12-15 01:21:59', 485);
INSERT INTO `sys_record` VALUES (5834, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-15 01:22:43', 3);
INSERT INTO `sys_record` VALUES (5835, '报名结果查询', '/api/okr/signup/query', 'admin', '127.0.0.1', '2021-12-15 01:22:46', 2);
INSERT INTO `sys_record` VALUES (5836, '模糊查询报名状态', '/api/okr/enum/signUpStatus', 'admin', '127.0.0.1', '2021-12-15 01:22:47', 0);
INSERT INTO `sys_record` VALUES (5837, '更新报名记录', '/api/okr/signup/change', 'admin', '127.0.0.1', '2021-12-15 01:22:53', 39);
INSERT INTO `sys_record` VALUES (5838, '获取报名记录', '/api/okr/signup/queryList', 'admin', '127.0.0.1', '2021-12-15 01:22:53', 3);
INSERT INTO `sys_record` VALUES (5839, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:23:04', 5);
INSERT INTO `sys_record` VALUES (5840, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-15 01:23:08', 1);
INSERT INTO `sys_record` VALUES (5841, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-15 01:23:12', 2);
INSERT INTO `sys_record` VALUES (5842, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:23:12', 3);
INSERT INTO `sys_record` VALUES (5843, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-15 01:23:15', 3);
INSERT INTO `sys_record` VALUES (5844, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-15 01:23:17', 1);
INSERT INTO `sys_record` VALUES (5845, '模糊查询用户名列表', '/api/okr/enum/username', 'admin', '127.0.0.1', '2021-12-15 01:23:19', 1);
INSERT INTO `sys_record` VALUES (5846, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:23:19', 4);
INSERT INTO `sys_record` VALUES (5847, '操作记录列表', '/api/okr/sysRecord/query', 'admin', '127.0.0.1', '2021-12-15 01:23:21', 3);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  `weight` int(11) NOT NULL COMMENT '排序权重',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (5, 'spring全家桶', 1, 0);
INSERT INTO `tag` VALUES (6, 'java天下第一', 2, 0);
INSERT INTO `tag` VALUES (7, '人生苦短，你用python', 3, 0);
INSERT INTO `tag` VALUES (8, 'c++', 2, 0);
INSERT INTO `tag` VALUES (9, '大数据技术', 1, 0);
INSERT INTO `tag` VALUES (10, '网络空间安全', 1, 0);
INSERT INTO `tag` VALUES (11, 'php是世界上最好的语言', 5, 0);
INSERT INTO `tag` VALUES (12, '区块链技术', 0, 0);
INSERT INTO `tag` VALUES (13, '数据挖掘', 3, 0);
INSERT INTO `tag` VALUES (14, '前端三剑客', 2, 0);
INSERT INTO `tag` VALUES (15, 'vue框架', 1, 0);
INSERT INTO `tag` VALUES (16, 'linux操作系统', 1, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1033 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1030, 'T1', 'csdn爬虫', 'com.softlab.okr.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (1031, 'T2', '二号测试任务', 'com.softlab.okr.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (1032, 'T3', '三号测试任务', 'com.softlab.okr.job.testTask3', '测试用的,输出数字');

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

-- ----------------------------
-- Table structure for user_entity
-- ----------------------------
DROP TABLE IF EXISTS `user_entity`;
CREATE TABLE `user_entity`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id，当主键用',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(账户)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志 ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_entity
-- ----------------------------
INSERT INTO `user_entity` VALUES (20, '18111493050', '8a6022890a8d4f35d1bce3ce9fa08f6e', NULL, '2021-12-15 00:26:02', 0);
INSERT INTO `user_entity` VALUES (23, 'test', '098f6bcd4621d373cade4e832627b4f6', '2021-12-15 00:33:15', '2021-12-15 00:33:15', 0);
INSERT INTO `user_entity` VALUES (24, 'admin', '21232f297a57a5a743894a0e4a801fc3', '2021-12-15 01:08:11', '2021-12-15 01:08:11', 0);

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` int(11) NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(学号)',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业班级',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `profile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我简介\r\n',
  `status` tinyint(2) NULL DEFAULT NULL COMMENT '用户状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL DEFAULT 0 COMMENT '删除标志 ',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (20, '18111493050', '路林梓', 'data:image/png;base64,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EhhZPz962AcR8NbgEmfP+7v/2gAMAwEAAgADAAAAEP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8Ad/y//DzTD/s13v8A8NNN3/8A/wD/APf/AHLNGNLJFK+PO6/LAAN//wD/APrUU/8AHNP/ANfiij/nzTgwhf8A/wD/AP8A/b38c0c88ErswP78o/8A9/8A/wD/AP6++L/3DOPP6889z/M893//AP8A/wD/AO+//wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/8QAHBEB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', '信管本1802', '1773950094', '133****8225', 'llz20161030', '全栈开发&&混子', 1, NULL, '2021-12-15 00:15:11', 0);
INSERT INTO `user_info` VALUES (23, 'test', '测试用户', NULL, '测试班级', '测试qq', '测试手机', '123', '测试用，( ╯□╰ )', 0, '2021-12-15 00:33:15', '2021-12-15 00:42:08', 0);
INSERT INTO `user_info` VALUES (24, 'admin', ' 测试管理员', NULL, '全是测试', '全是测试', '全是测试', '全是测试', 'OvO!', 2, '2021-12-15 01:08:11', '2021-12-15 01:10:15', 0);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `expire_time` datetime(0) NULL DEFAULT NULL COMMENT '过期时间',
  `delete_flag` tinyint(2) NULL DEFAULT 0,
  PRIMARY KEY (`id`, `user_id`, `role_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (14, 20, 1, '2100-01-01 00:00:00', 0);
INSERT INTO `user_role` VALUES (17, 23, 3, '2021-12-25 00:00:00', 0);
INSERT INTO `user_role` VALUES (18, 24, 2, '2021-12-30 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
