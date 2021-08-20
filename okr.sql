/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : okr

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 20/08/2021 19:06:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `book_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '书的id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '书名',
  `img` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '书封面',
  `publisher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `price` bigint(11) NULL DEFAULT NULL COMMENT '价格',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0正常 1借走 2丢失',
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '借阅者id',
  `create_time` bigint(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`book_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, 'c', 'c', 'c', 3, 3, 3, 20210819221344, 20210819232044);
INSERT INTO `book` VALUES (3, 'a', 'c', 'c', 3, 3, 3, 20210819223154, 20210819232149);

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `book_id` bigint(11) NOT NULL COMMENT '书id',
  `tag_id` bigint(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`book_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_tag
-- ----------------------------

-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `resource_id` int(11) NOT NULL COMMENT '资源id，主键',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路径',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `type` tinyint(255) UNSIGNED NOT NULL COMMENT '类型。0为菜单，1为接口',
  PRIMARY KEY (`resource_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, '/admin/syslog', '系统管理', 0);
INSERT INTO `resource` VALUES (1001, 'POST:/api/admin/register', '注册用户', 1);
INSERT INTO `resource` VALUES (1002, 'GET:/api/admin/removeByUsername', '删除用户', 1);
INSERT INTO `resource` VALUES (1003, 'GET:/api/admin/reloadAdminRoleResource', '重载管理员资源', 1);
INSERT INTO `resource` VALUES (1004, 'GET:/api/admin/reloadUserRoleResource', '重载用户资源', 1);
INSERT INTO `resource` VALUES (1005, 'GET:/api/admin/modifySwitch', '更改接口开放状态', 1);
INSERT INTO `resource` VALUES (1010, 'POST:/api/admin/getSignUpList', '获取报名记录', 1);
INSERT INTO `resource` VALUES (1011, 'POST:/api/admin/modifySignUpList', '更新报名记录', 1);
INSERT INTO `resource` VALUES (2001, 'POST:/api/user/modifyUserInfo', '更新用户信息', 1);
INSERT INTO `resource` VALUES (2002, 'GET:/api/user/userInfoByUsername', '根据账号选择用户', 1);
INSERT INTO `resource` VALUES (2003, 'POST:/api/user/userInfoByCond', '根据情况选择用户', 1);
INSERT INTO `resource` VALUES (2004, 'POST:/api/user/upload', '上传头像文件', 1);
INSERT INTO `resource` VALUES (2005, 'POST:/api/user/modifyPassword', '修改密码', 1);
INSERT INTO `resource` VALUES (3001, 'GET:/api/user/monitor/server', '服务器监控', 1);

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
  PRIMARY KEY (`id`, `role_id`, `resource_id`) USING BTREE,
  INDEX `resource_id`(`resource_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 604 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (595, 1, 1001);
INSERT INTO `role_resource` VALUES (596, 1, 1002);
INSERT INTO `role_resource` VALUES (585, 1, 1003);
INSERT INTO `role_resource` VALUES (586, 1, 1004);
INSERT INTO `role_resource` VALUES (591, 1, 1005);
INSERT INTO `role_resource` VALUES (593, 1, 1010);
INSERT INTO `role_resource` VALUES (594, 1, 1011);
INSERT INTO `role_resource` VALUES (589, 1, 2001);
INSERT INTO `role_resource` VALUES (600, 2, 2001);
INSERT INTO `role_resource` VALUES (592, 1, 2002);
INSERT INTO `role_resource` VALUES (602, 2, 2002);
INSERT INTO `role_resource` VALUES (588, 1, 2003);
INSERT INTO `role_resource` VALUES (599, 2, 2003);
INSERT INTO `role_resource` VALUES (597, 1, 2004);
INSERT INTO `role_resource` VALUES (603, 2, 2004);
INSERT INTO `role_resource` VALUES (590, 1, 2005);
INSERT INTO `role_resource` VALUES (601, 2, 2005);
INSERT INTO `role_resource` VALUES (587, 1, 3001);
INSERT INTO `role_resource` VALUES (598, 2, 3001);

-- ----------------------------
-- Table structure for signuplist
-- ----------------------------
DROP TABLE IF EXISTS `signuplist`;
CREATE TABLE `signuplist`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学号id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名字',
  `gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '性别',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业班级',
  `profile` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '自我介绍',
  `status` tinyint(4) NOT NULL COMMENT '录取状态 0未查看 1已录取 2未录取',
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评语',
  `create_time` bigint(11) NULL DEFAULT NULL,
  `update_time` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of signuplist
-- ----------------------------
INSERT INTO `signuplist` VALUES ('1', 'shit', '男', '12334', '挖掘机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 0, NULL, 20210515123711, 20210820184148);
INSERT INTO `signuplist` VALUES ('18110571234', '程成', '男', '501966782', '信管本2002', '熟悉golang。Java。cpp。vue。熟悉开源社区。github.com/devhg。熟悉Linux   ', 0, NULL, 20210515150038, NULL);
INSERT INTO `signuplist` VALUES ('19111405056', '杨叶江', '男', '424133224', '工商1902', '目前属于基础检查，目标方向是为了能运用Python进行数据分析等，无项目经历。\n竞赛主要有省级三项，校级奖项若干', 0, NULL, 20210515204314, NULL);
INSERT INTO `signuplist` VALUES ('19111407001', '宣佳栋', '男', '1413452856', '市销1901', '       在思想方面，本人理想信念坚定，积极向党组织靠拢。\n       在工作方面，担任班级学习委员，青年服务部工作人员，课程助理，市销2001班带班，积极为老师排忧解难。\n       在学习方面，学习认真努力，成绩优异，当前学业成绩和综合测评成绩均位于专业第一位，被授予校级“优秀学生”、“优秀共青团员”等称号，并获得校级二等奖学金。\n       在比赛方面，积极参加大型比赛，曾获：\n1.全国花间校园街坊总站国家级优秀奖\n2.“尖峰时刻”全球案例大赛省级一等奖\n3.全国大学生工程训练综合能力竞赛省级二等奖\n4.全国大学生市场调查与分析大赛省级三等奖\n5.“挑战杯”大学生课外学术科技作品大赛校级三等奖\n6.淄博市“创意青春 智赢未来”营销方案设计大赛市级二等奖\n7.山东理工大学青春踏歌行合唱比赛校级特等奖\n8.第一届山东理工大学创新方法应用大赛校级三等奖\n9.山东理工大学大学生科技创新大赛校级三等奖\n10.山东理工大学青年创客挑战赛校级优秀奖\n11.第三届全国管理模拟决策大赛校级三等奖\n12.第四届全国管理模拟决策大赛校级二等奖\n13.“庆国庆 青年行”爱国寻图比赛校级一等奖\n14.全国大学生电子商务“创新 创意 创业”挑战赛校级二等奖\n       在社会实践方面，两次获得社会实践校级奖项，被授予“社会实践先进个人”称号。\n       在科研成果方面，跟随导师进行小农户与现代化衔接方面的研究，自学SPSS分析、Java和citespace，并主持校级立项一项。\n', 0, NULL, 20210516142819, NULL);
INSERT INTO `signuplist` VALUES ('19111408015', '孙淼', '男', '1873365757', '信管1901', 'JAVA浅层次内容完成\nSQL语句浅层次\n周一上午\n周二晚上\n周三晚上\n周四下午晚上\n周五晚上', 0, NULL, 20210515203145, NULL);
INSERT INTO `signuplist` VALUES ('19111408022', '杨光秋', '男', '1980820857', '信管1901', '1.现在在学java，感觉java想要深入掌握，是需要有专业老师教授。所以在专业课教学java语言和SQL Server，我希望能够通过信息技术实验室能另外掌握重要的python语言和c语言。\n\n2.我的目标是希望能够毕业掌握java语言，精通python语言和c语言，能够学到可以单人开发一些小项目小程序，能够有能力成为大项目开发团队的一员，甚至作为大项目开发经理。\n\n3.已经学完java语言基础、流程控制、数组与字符串（数据结构与算法分析学习完线性表、栈和队列）和Mysql的基础。\n接下去几周学习java语言类特性，继承、抽象类、接口和枚举，异常处理，java语言的输入输出与文件处理等，相关数据结构与算法分析，学习完mysql的基础内容。\n', 0, NULL, 20210515154402, NULL);
INSERT INTO `signuplist` VALUES ('19111408041', '曹渊博', '男', '2985958099', '信管1902', '目前java学完多线程，下一步想学一下算法，前端想再放一放在学，大二学生会也能退了之后就好好学习去了，实验室大概一个星期能去四次左右', 0, NULL, 20210515145923, NULL);
INSERT INTO `signuplist` VALUES ('19111493015', '卢玉栋', '男', '2191387440', '信管本1901', '学了java流程控制，包括分支结构，循环结构，和跳转语句。定义数组与字符串。了解类，java输入输出与文件处理，学习了使用sql语句进行数据库管理，表的管理和应用，想从事大数据开发\n每周有时间就可以去实验室，白天有课，每天晚上可以去，周末', 0, NULL, 20210515203258, NULL);
INSERT INTO `signuplist` VALUES ('19111493055', '陈建军', '男', '1727072639', '信管本1902', '了解Java、C、Python，了解SSM,SpringBoot框架，了解数据库的使用，会使用Git上传项目，会简单使用Linux操作系统，了解Docker容器，会使用ElasticSearch和Redis，了解Hadoop框架。\n目标方向是JavaWeb开发\n项目经历：1、微小型跨组织人才管理系统 2、绿色低碳出行微信小程序 3、员工管理系统\nCSDN: https://blog.csdn.net/qq_40266349?spm=1000.2115.3001.5343\nGitHub: https://github.com/JackYangyang0\n获奖：第六届节能减排社会实践与科技竞赛校二等奖且进入国赛', 0, NULL, 20210515143014, NULL);
INSERT INTO `signuplist` VALUES ('19111493063', '王金浩', '男', '1253912723', '信管本1902', '大一学期专业课学过Java，上下学期考试均90分以上。基本例题都基本掌握。对python 感兴趣，目前已经开始学习！加入实验室的目的是想跟同学们一起交流学习，做一些创新性的事情。', 0, NULL, 20210515151922, NULL);
INSERT INTO `signuplist` VALUES ('19121406076', '王若冰', '女', '872184581', '工业1902', '目前初次接触python，系统学过计算机导论，熟悉较为简单的mathematica，接触过MATLAB，目标方向数据分析、算法优化，已取得四级证书、计算机二级证，大英赛二等奖，山东省数学竞赛三等奖，参与多项创新创业类竞赛，负责大创项目一项，对计算机软件学习保有热情，希望进步', 0, NULL, 20210515202651, NULL);
INSERT INTO `signuplist` VALUES ('19121408037', '蔡春雨', '女', '1723612044', '信管1901', '获得计算机二级证书mysql数据库程序设计', 0, NULL, 20210515202047, NULL);
INSERT INTO `signuplist` VALUES ('19121408074', '唐境锶', '女', '1945938350', '信管1902', '学过一些HTMLcssjs java mysql sqlsever 不是很厉害的那种程度 周四周天', 0, NULL, 20210516124704, NULL);
INSERT INTO `signuplist` VALUES ('19121408075', '王梦瑶', '女', '1486102538', '信管1902', '目前掌握java的控制语句和方法内容，在进一步学习中，目标是能有自主开发编写程序的能力，暂无项目经历\n通过b站的java相关视频和csdn的相关知识自学', 0, NULL, 20210515201517, NULL);
INSERT INTO `signuplist` VALUES ('19121493034', '贾聪聪', '女', '1541163933', '信管本1901', '自学Java', 0, NULL, 20210515203904, NULL);
INSERT INTO `signuplist` VALUES ('2', 'shit', '男', '12334', '挖掘机', 'jfioaejfasjioheuifhgisahfoksjdkfhweuihfseifjdewjfopawijrf309wru[ojskdhuuerg', 2, NULL, 20210820184520, 20210820190532);
INSERT INTO `signuplist` VALUES ('20111405008', '刘浩伟', '男', '209478845', '工商2002', '我擅长C语言和一些基础算法，做一些算法题目，并且自学了数据结构(不过还没学完)，未来的目标是学习完数据结构和一些算法后，学习一些前端知识和计网知识，增加自己的技术面。除此之外，我也想参加一些比赛，如算法竞赛，关于计算机的比赛等，开阔自己的眼界。个人博客地址: https://blog.csdn.net/weixin_55812984。', 0, NULL, 20210515135530, NULL);
INSERT INTO `signuplist` VALUES ('20111407001', '周洪燊', '男', '2160915425', '市销2002', '自己对于编程掌握的不是很多，但是最近一直在学习python，对于python的一些基本规则和一些函数都有所了解掌握；自己目标方向就是可以全面地掌握编程，对于编程不同的种类技术都有所了解；自己没有什么项目经历，属于刚学编程的小白，但是自己可以学习，也相信自己会逐渐精通编程；自己的自学能力还算可以，对于新知识学得还算比较快，对于理科的一些知识学得会更快，理解得也会更快，因此我相信我会很快地融入到这个集体。', 0, NULL, 20210515220618, NULL);
INSERT INTO `signuplist` VALUES ('20111408012', '张义龙', '男', '568933962', '信管2002班', '个人暂时为java萌新，想学好java，暂时在刷山理工的oj和看哔站的教程，接触过citespace所以自己也想用java做出一个程序(如游戏)。对编程感兴趣，愿意去主动找到更多的资源去学习，让自己成长。去实验室的时间是周四周五下午可以去，下晚自习可以去。', 0, NULL, 20210515223002, NULL);
INSERT INTO `signuplist` VALUES ('20111408016', '马元麒', '男', '2804120991', '信管2002', '上学期学了HTML5、CSS、JS等等前端知识，已经会熟练制作静态网页，能对于一个现成的网页进行重新修改，并且学习了PHP，会对数据库进行基础操作，在寒假期间用php以及前端知识做出了自己的博客，可以实现增删改查，注册、登录、分页等等，但是还在本地保留，没有放到网站上（没有进行美化，太丑了）我也是青春在线程序部常驻志愿者，在那学习后端，laravel框架，网站构建知识，在寒假期间也参加了一个学长带队的互联网➕项目，在那里负责前端页面制作美化等等。我也学习java，前段时间刷了山东理工oj上的120多道题目，但是最近没做，最近一直在看bootstrape和js动态网页的制作，做了一个简单实时判断输入框输入内容长度的注册页面，准备再看看移动端网页适配的问题，我周一到周五晚上都可以去，周六在西校程序部培训学习，周天可能去西校做前端或者学网站搭建。', 0, NULL, 20210515145413, NULL);
INSERT INTO `signuplist` VALUES ('20111408050', '张森', '男', '1741927235', '信管2001', 'Language：Java, html, C（正在学）\nTarget：1.熟练运用Java和C,可以参加项目设计\n             2.深入学习算法和数据结构\n             3.可以独立制作，参加有水平的比赛\nTime：每天都能来实验室自习；\n           有课时如没特殊情况至少每晚都能来；\n           \n            ', 0, NULL, 20210515141707, NULL);
INSERT INTO `signuplist` VALUES ('20121408020', '万蝶依', '女', '2433215310', '信管2002', '学习JAVA语言，在acm上做一些实验题，现在做到130道题目，对于编程有非常基础的了解，比较感兴趣，想要更加深入的了解编程的应用，将其快速的应用到现实中。寒假中对数据的处理有了一点点的了解。', 0, NULL, 20210515150718, NULL);
INSERT INTO `signuplist` VALUES ('20121408022', '韩雨欣', '女', '3240261856', '信息管理与信息系统专业2002', '目标熟练掌握JAVA。学习数据库', 0, NULL, 20210515173141, NULL);
INSERT INTO `signuplist` VALUES ('20121408029', '曹雪', '女', '1369240484', '信管2002', '1.熟悉Java语言，有一定的Java基础。\n2.了解c语言，HTML，PHP，曾与伙伴合作写过一个网页。\n3.目前正在自学算法，数据结构，计算机组成原理。\n4.目标方向是web前后端开发(全栈)。\n', 0, NULL, 20210516102530, NULL);
INSERT INTO `signuplist` VALUES ('20121408039', '李贝贝', '女', '1410851521', '信管2002', '具有一定的自学能力，对制作网页及app具有较强的学习兴趣。希望自己可以独立制作出一个网页，或是app', 0, NULL, 20210515172112, NULL);
INSERT INTO `signuplist` VALUES ('20121408061', '张玉洁', '女', '2889770573', '信管2001', '现在是大一阶段，正在学习Java、C编程语言，接触了前端HTML CSS，有一定的自学能力，目前还没有比较明确的目标方向，对编程感兴趣，准备继续学习数据结构及算法方面的知识，渴望与志同道合的小伙伴一起交流学习。如果能加入实验室大家庭，我应该每天都会来实验室学习。', 0, NULL, 20210515135539, NULL);
INSERT INTO `signuplist` VALUES ('20121408071', '曹琪', '女', '1138576292', '信管2001', '对计算机方向很感兴趣，想要进一步了解前端技术。虽然目前技术还处于基础阶段，但是我会很努力的。\n(去实验室的时间:只要是我没课的时候都可以去，包括假期我也都是留校)', 0, NULL, 20210515205239, NULL);
INSERT INTO `signuplist` VALUES ('20121493080', '葛越荷', '女', '1787738998', '信管本2001', '主要学习JAVA相关知识，会不断复习学过的JAVA知识，并且开始学习一部分c语言知识。希望以后在研究生阶段进行学习软件开发的方向，所以会在大学开始就为考试做准备。', 0, NULL, 20210515224603, NULL);

-- ----------------------------
-- Table structure for switch
-- ----------------------------
DROP TABLE IF EXISTS `switch`;
CREATE TABLE `switch`  (
  `switch_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作名',
  `status` tinyint(11) NULL DEFAULT NULL COMMENT '状态 0未开启 1已开启',
  PRIMARY KEY (`switch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of switch
-- ----------------------------
INSERT INTO `switch` VALUES (1, '报名', 1);
INSERT INTO `switch` VALUES (2, '查询报名', 1);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tag_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'java');
INSERT INTO `tag` VALUES (2, 'web前端');
INSERT INTO `tag` VALUES (3, 'web后端');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id，当主键用',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(账户)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123', '202cb962ac59075b964b07152d234b70');
INSERT INTO `user` VALUES (20, 'admin', '21232f297a57a5a743894a0e4a801fc3');
INSERT INTO `user` VALUES (21, 'test', '098f6bcd4621d373cade4e832627b4f6');
INSERT INTO `user` VALUES (22, 'test1', '5a105e8b9d40e1329780d62ea2265d8a');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(11) NOT NULL COMMENT '主键id',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名(学号)',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像',
  `major` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业班级',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `weixin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学习/研究方向\r\n',
  `create_time` bigint(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(11) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (1, '123', '先辈', 'data:image/png;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEhIQEBAQEBAQEBAPDxAQEA8PDw8PFRIWFhURFRUYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OFRAPFSsdFRkrKysrKysrKy0tKy0tLSstLTc3LS0rNy03Nys3Ky0rKzctLSsrKysrKysrKysrKysrK//AABEIAOEA4QMBIgACEQEDEQH/xAAbAAABBQEBAAAAAAAAAAAAAAAEAAECAwUGB//EADsQAAICAQIDBQYEBQMEAwAAAAABAgMRBAUSITEyQVFhcRMigZGhsQYUQtEVM1JicgdzwVOSsvAkQ4L/xAAZAQADAQEBAAAAAAAAAAAAAAAAAQIDBAX/xAAdEQEBAQEAAwEBAQAAAAAAAAAAARECAxIhMUET/9oADAMBAAIRAxEAPwAireqJ4XtFFvop5i/kGxlGXNNP0YLdt0JdYxfwWQO3Y49YOdb8YSaFUNeUAezSp9Un5YyZ3sNVDsXOS8LFxZ+JKO5aiP8AMpUl4wlz+TQgbUbHTPn7NL05ActlnX/Kvth5OTkvqaEN8qzianX/AJxf/GQqGqqnzU4v4oAxY366vpKu1L+pNN/EsX4klH+dp5x84YkjZlBeRmblqKK0+KSz4ZWR6MSq3Wm+LUJ4eOy1iXyC63yOF1u8QbzGuPryTKLN/t7m0vDPJeg1Y7rVWVRWJNLJn6jR6acukXy7SwmvicVq9znZ2pMphqpf1P5gPV2/sVVF+zuksvPOXEvqSju10VniqsjjD7mcLPUSfLifzZCNj8Xj1YqJHqO071VLK4kml0z3nSVa6uS4E1n1PC42Nc02n5B+h3i2uSak/PL6iXHvOil7oSjzPZfx4lwxsxFdGzvdu3Wq2PFGSafmDSUdcweTLZyXoV4EFYzLMDSQsUgMPgWAhGZFsm0RwNNNkaTJYE4glAclwjAbinvso8rKJx844n9gqneaJfrUfKeYP5MM9hF9wPdoIS6xT9UimAiNkX0al6NMUoJ8sfYyZ7DDrHijLxi2iH5XUw7N7flZFS+wg0b6IpZfI5Xd7K4NtJZ8VyLN2322HuyUHy6rl9Dk9fuMrH4IDgqzfbUmozkl6mbbfKbzJtvzeSnIsjipE3Ig2M2JDVhNjjCGDomiCJE0ExojDgaxSNLbN8uoaUZtxX6e4yUSTAPQ9F+OpPClCPcs5Z2O2b7Xak+KKb7spnh6kG6LVSjyUnH4jOPek8iOE/Ce/wBixXa8p9G39md1GSayStERKREQIZjjC0qYRIbAJwwh8CGMcRnV1496Fi/uTi38iX8Zsi8WaeaS6zi04/ua6rISpTGwBV73p3yc3B/3xlH7gO875VXHk+JvmsdDR1mmrUW5JNYfVZPMd31ClOXCsLoPDkU7hrHbJyfTuA5MeREFzkkSwRSJjM2BkSZNQFoiCRJRJJEoxDTxUyWC+vTt9xb+Sl4C1U5oPhG4A+OjY06Rex+lZ7Q6LbKyKiPU2YdREmTQw9DR2zXOEo5b5NHsey6lWVRkn3HhseR6Z/p/q24uDeU1xR8vISo7VMQ6QwjLA2BxCBDYFkcSTYEOIYcP/CXHsW2R8FxNxXwH/wDlw6ThZ/lHh+obRuFM+zbBvw4lkJWH4Fudzm5bpdGuStrSbTw4vK+p53ZPLb8TvfxrqJQjhL3Zd5wDGqIsZDsZA0SQ5FFtcQB4xL41PA9NTfcalOmz1Jq+eQUNJ7ufkW1aPn8jY0WmXR9AqOiiuiMr06OfGCo0ySCo6VYNKnSRwWOhLoRe23PEY35WIDfp03yR0FmkyRq2/PcHud4jm47fl9OQNqNE4tr5Hax0iXLBRqNvUu5D90f4xw06miCR0es29ruMa+jDNJ1rDrxWBjo/wVubrvhFvCk8HP4G09rhOMl1jJP6lsse+xlkcA2XVK2qE0+sVn1DyTITEMwwtOIZCYEcQhBocndtdc+1CP2+wJPZUv5c7Kv9uX75J/xuK/mV2w//AC5/+IRVulEl/MSfhL3X8mU53JfivTzjX71sp8PRSXM45HXfjTXqXup5RyERxUJoYlJCwNoii6DwRSJQQBp7eu81qooyNLyWO41dO8mfVbcRpadGhVWZ1EjUpZhXXyJqgujJSgiEGSIaIcBOLSeBFlQKNKJB1hU8FNmO4AzdXSc/rdJz6HTahGdbArmp65jlLqcZBFjJ0eq0eW2u85yyOJteDN5XH5Ocr1H/AE81DlQ4t9l8jrmcT/ps17OWP6uZ2w2SLJIQgSQhCECEIQBzkq14IHt0Ncu1CPyQLHU6uPWFc14ptSYv4tL9ensXmsNfQtzuV/F2gVfOPR92OhycTufxRfTbW2uLK6pxlH7o4hIcVDkiJNDaJxiKMR4heh0/G8vplEnIt0lTZp014LK6lFYSGm8Gdro5i+qXMNWpS7zFldjmVzvz1IzW246WnU5DYSycxpN1jXyksmjpN/qfJJpi9RPJG3wCw/App10Jc8o0NM4y69PEWNee5VA8Ymi9uTxwyTyWPblDtNfMMX7MaynIDdUja11tceSfxMLU7hXnqheqfaBLazkdwhiyXqdXfrot+Rzu6pe0f93Q25c/muu7/wBNUvYS8eNnaROW/AWhdVKb/V7y+J1LKctOISECTCEIRkIWBwDnSuUV4Gattsh/LvsX+fvr5Cxqo9JQs9V7P7Fueh/xNp26pOPcufeebYfgei7trLFBwtrUc/0vKOepqb/RHh+ovZr4+L05yJYam5bU4+/FZj4GY44HurvNiRtbZDEcmJWss6DRrCRNquBUWQlDJJIIqrRnXTgWvQNv3uhqUbbTjpl+Yq4k3qoQ7UkvUW08im7Zq2+SKv4NGPPAWt80q/8AuhkOq3CizlGcXy7g2n6xl1aPh72aulbx1KppZwFUUtk6qcwRC5or1WseOrfxFZDCM66wNXjP1anPKyzJt2yx9M5OqoqyuYT7BDlZ9RxX5S2K96LYE4uU4rHPK5M7K+PMyfyvFq6IpL3mm/RMuVl1y9J2irhqgumIoNZCqPJEmU57DpD4GQzAsOJDCYGkIhkQD45uvUVz7M4y9Hkngzrtmpl1gvh7v2KZbS12Lba14Rny+pdc4P8AEbzJR9ATQafik0Xblp5xkuOTm+XvPqQqs9n73Vszrt8H4nbXwPhbTi/iYG7aRc2l0NKy6c37taSXOUu8E1ksxl6CladxjaOrLTNypYSANFDkjQgh2o5n1dFB2kjkDriaGljghtIbVaeT7MmvQzNRtM5J9ZvljL6M6CMWS4Bav0cUtk1ClFcKSTfPgXJPrnxOi1+mp4F7OEldHhSkocKeDU4H/UTjB97D2E8YTbVKVac1iabT8zRptwyufJA05kWqkwdqLVhmZN8pTzyj3eJc7Moo0cO0n0fcAcnum43Tcouc61j3FXhLOe9+hqbFpZ21zlG62Lg8Q45deXNNepq3bVXPm4L4ciVegrisJSXknyKlZ3m6ztBuE+Lgt5tcuI19pivzlTaz7k0vUoejh1Ufj3mlsMF+Yg2ukZJeWSpU9T47LIwyHRcc1SIsfIw0kIQgKwhCEBOOjvVOcSVkX51zx8y6O4Uy6WQz4OST+QRKvPJr6A9m31y6wj8kXWIbd4RlFNNPHemYFzzKPwRuWbHVzaTUvKUsfIw+y3GS5p8n4Mzrp8HTQ4OGPCuXFjJi7pHCaNCc5vm3xR+qAtdzS+pLqoHRw5B9aBqgitgiCoxDtMugFWwuqWBVrGn7PKIcJLSyyXuvyJraB0iaRZGoulGMVzJpg73hGZZZzJa/Vub4Y9F3lNVLeMgnRUeaHr5BtOh5J8S5/Qq1+kdb6r4AayuQ7ZbVWmk/Ia2truEYaZPQz4LIy8yMiCfNepXP6nqTHbpjkKei9ETN3n9T6QhCAiELAgLSEIQHji/4hqV26Iy/25/uKO94/mUWw+UvsazgiDqRblA1b5p5frafhOMo/dGXu1cJS9pXKEk+0lJNrzwbtukg+sYv1QNPaqWuxGP+KSFV89YxdPLlhg2514WQ7WbXZWnKtppc2nnPwOe1OtnZ7qXeZY7efJLE4MugC0vxDIAcoipl8WC1hMGK1crR08uhuUTXBjHxMHTM1qH7uMkWtYnAA3ib4cLvDVLBVY8kqc3VYo5T7ii/fHxcMK5NLk5Y5GxrqoS6xXr0BbKOWIYT8RxKei3WOPe5eTKrd8rlP2ecvw8C2G318nKOX3g/5KpzzwqL8UuYybG3X5yu5Gm3xRx4GdoK0lyDYvCYmkB3LBVRDilFLvkkWXBOxU8VqfdHmVz+l1fjp61hY8kTGiObPP6v0hDZGbBOpZHyiGRmUSYiORAHG+x1K7N//dBSH/MatLs1zfi/cyWV7pppdm+pvw41kLTT6NPPg0yq54A/iNq7dEn/AISUvuKG7xxmcLIesc/YOlAhw+XLzwIw63OmaaU1zWOakvucpCCjOS683hnYWaeD5OKfqc1ulKrtaisJpPkRV+Osq3lJhVILq+pbp5kuqDIourKYMujyIrWDtIzWpMfSSNWuf0IsaQ9k8c2Cu3JTuWrjFd+fBczHjurX6W/XKDFa2Zxb9e4gq2u00jEs3C6XTC/4JQq1MueV8mVIMbefBpg91fPr8gBaXUeEX8yiV10H70OXlzQ8Vja0tji/I03Pkc9pdfGXLozVps8ybAlORufh2CUHJ9ZPHwRgXy+rwb2msUYRj4IrmMvJ1jX9qhO5GXLUoi9UvE1cV/WlO9Fb1JnT1S8Qaer8wJsfmGTjcYP5zzLY63/3Iw3PaiMj86hCACzaKX1hH5IEs/D9OcqLXmnL9wqve6Jfrx/knH7hVW4VSXuzi/SSNGDHns8l2L7oeUZchflNXHs6hy/3IqX7G77RYIJiDDV+tj/0rfLDr+pl7tfdJxdtUa8ck4z4k2de4mN+Ja17LPhNCsPn9cxqFlZKqrMBIFNYZLr/AI0argmMzLqkF12E2NI09PZj5mrS89DAhI1dDdnkzOtJUraeeX8Ci+mL7jRtQHZ1FKsB+VXcgyi1RWGSH9imVpypx1EfEF1GJMt/LxFKtINVoRaKPXBoVRwvgQrZKyzBKaVS4prPRczQdgNpa8LPeyxs04/HP5b9KVj8SLsfiRkQLc+JuxkWxhsgRZG4hNkRhP2giAgwNWzSQl2op+qTKJ7RU/0RXosfYG/idq66a31WMfcm98rXaVkH5xk/simCD2Ktdnji/FTn+4y22xdnUWpeGV+wRXu1Elnj+akvuTWuqfSyL9JIADdOqj2bYNf3xy/oAbrLUezasUHHKblHl9DoYWJ9OYFvePYz+H3FRL9cnWNbUmh6y5Izru4+xlvKeC2u0Mt06l6mbZCUHzHp41dPZkOoswzDquCYasmzTldXTapIjbVnmYVGtfI1atXyIxpKeyOCPGV6nUANl3MR+0akZeJVKWTPlqG8IvqsHh+wtLA9EXOXTkil25aiubZp6evhWPmVzMR30mRZKTK2y3PaiyJIgNJEWSIyBJZGGEURCHEM23wp9cEXTHwM6P5qPWVc3/jwDLWarvqra8rHn5YBzjLNNF9Yp+qKJbbT/wBOK80kiiW6zj109rf9vC19WSW8Q/VGcPWP7AFc9kpbz76flOS/5At00PBVJq2eF+l80+Zpx3Wl/rXxTX3Rm/iDXQdfDGSllpvAqrlgQYRBgsGXwMq7uPwTGIpVKXVD1ssbJtaYyNVt76w+QGrWniXI35A2o08Z9pZKlRgGF4TVq34v5mdqdBZXzjzj4eALHVNdepXwr8dPHVLvK7J56GHDV+YRTqm+SWWL1ErQmx6tRheIOvaPux8S+ijHXqLFNvZqc5nJeSNRgW0v3fiGSGjo2SDZJshIcZIsiOxmMEM2IZgWmEIQ0kIQhk2WQkIQRigyEhCGGfunQ5fV9piEKq5RgERHEZ13cCKixiERWqLK59RCHCKRzm59piEOfqeg0DW2jvHEOojUiPEQhNG1tXZ+IZIQgZdmK5DiKZoDMQhimEIQJIZiEOBEQhDD/9k=', '下北泽1802', '1773950094', '13335158225', 'sasdf', 'web全栈，只会crud的一只很臭的臭乐色ef', NULL, 1628437249268);
INSERT INTO `user_info` VALUES (20, 'admin', '基佬', 'data:image/png;base64,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EhhZPz962AcR8NbgEmfP+7v/2gAMAwEAAgADAAAAEP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8Ad/y//DzTD/s13v8A8NNN3/8A/wD/APf/AHLNGNLJFK+PO6/LAAN//wD/APrUU/8AHNP/ANfiij/nzTgwhf8A/wD/AP8A/b38c0c88ErswP78o/8A9/8A/wD/AP6++L/3DOPP6889z/M893//AP8A/wD/AO+//wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/wD/AP8A/8QAHBEB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', '蓝翔', '123456', '654321', 'shit', '一起搞基，先生！', 1627832339081, 1628002174267);
INSERT INTO `user_info` VALUES (21, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1627832806205, 1627832806205);
INSERT INTO `user_info` VALUES (22, 'test1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1628437211233, 1628437211233);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (14, 20, 1);
INSERT INTO `user_role` VALUES (15, 21, 2);
INSERT INTO `user_role` VALUES (16, 22, 2);

SET FOREIGN_KEY_CHECKS = 1;
