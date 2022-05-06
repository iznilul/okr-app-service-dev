/*
 Navicat Premium Data Transfer

 Source Server         : mysql5.7
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 06/05/2022 14:37:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `blog_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '博客内容',
  `click_count` int(11) NULL DEFAULT NULL COMMENT '博客点击数',
  `publish_is_or_not` tinyint(2) NULL DEFAULT NULL COMMENT '是否对外展示',
  `original_is_or_not` tinyint(2) NULL DEFAULT NULL COMMENT '是否原创',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者账号',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类id',
  `origin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章原出处',
  `status` int(11) NULL DEFAULT NULL COMMENT '评分  0：未评分 1：不及格  2：及格  3：良好  4：优秀',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_flag` tinyint(2) NOT NULL COMMENT '删除标志',
  PRIMARY KEY (`blog_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (21, '123', '<hr />\n<p>title: itlab主页开发\ndate: 2021-05-11\ntags:</p>\n<ul>\n<li>vue</li>\n</ul>\n<hr />\n<h1>itlab主页开发</h1>\n<p>[TOC]</p>\n<h2>0x01 简介及开发技术栈</h2>\n<p>因为实验室之前的主页有点年头了，而且由于多人开发所以功能也有点重叠，所以重新整合了一下</p>\n<p>开发框架：vue3</p>\n<p>构建工具：vite</p>\n<p>UI框架：element-plus</p>\n<p>动画库：aos，particles.vue3</p>\n<p>其他还用到了诸如less等</p>\n<p>github：https://github.com/iznilul/itlab_home</p>\n<h2>0x02 整体布局</h2>\n<pre><code class=\"language-vue\">&lt;AHeader @gotoPage=&quot;gotoPage&quot;&gt;&lt;/AHeader&gt;\n&lt;AContent&gt;&lt;/AContent&gt;\n&lt;AFooter&gt;&lt;/AFooter&gt;\n</code></pre>\n<p>封装BasicLayout组件，由页头内容页脚三部分组成</p>\n<p>AHeader页头就是菜单，点击，调用父组件注册的跳转方法，实现路由</p>\n<p>AFooter页脚就是一段话( ╯□╰ )</p>\n<p>AContent包含了当前路由内容和粒子动画效果</p>\n<p>三个部分都采取了position:fixed 相对定位</p>\n<pre><code class=\"language-less\">#baseLayout{\n  height: 100%;\n  color: #000000;\n  position: relative;// 关键\n  box-sizing: border-box;\n  min-height:100%; // 关键\n  #header {\n    z-index: 2;\n    height: 60px;\n    position: fixed;// 关键\n    background: black;\n    top: 0;\n    left: 0;\n    right: 0;\n  }\n  #content{\n    height: 100%;\n    width: 100%;\n    //z-index: 0;\n    //background: black;\n    position: absolute;// 关键\n    top: 50px;\n    left: -8px;\n    right: 0;\n  }\n  #footer {\n    text-align: center;\n    overflow: auto;\n    background: black; //背景颜色，可以防止被覆盖\n    z-index: 1;\n    height: 30px;\n    position: fixed;// 关键\n    bottom: 0;\n    left: 0;\n    right: 0;\n  }\n}\n</code></pre>\n<p>这样保证页面滚动时位置相对锁定，时刻能呈现这三个组件</p>\n<p>预览效果</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457002233.gif\" alt=\"\" /></p>\n<h2>0x03 页内导航和步骤条</h2>\n<p>导航栏可以用a标签页内定位元素，实现导航</p>\n<pre><code class=\"language-vue\">&lt;el-tab-pane name=&quot;0&quot; label=&quot;实验室介绍&quot;&gt;&lt;a href=&quot;#first&quot;&gt;实验室介绍&lt;/a&gt;&lt;/el-tab-pane&gt;\n&lt;el-tab-pane name=&quot;1&quot; label=&quot;欢迎加入&quot;&gt;&lt;a href=&quot;#second&quot;&gt;欢迎加入&lt;/a&gt;&lt;/el-tab-pane&gt;\n&lt;el-tab-pane name=&quot;2&quot; label=&quot;学习方向&quot;&gt;&lt;a href=&quot;#third&quot;&gt;学习方向&lt;/a&gt;&lt;/el-tab-pane&gt;\n</code></pre>\n<p>步骤栏要麻烦一些</p>\n<pre><code class=\"language-vue\">&lt;el-steps id=&quot;step&quot; direction=&quot;vertical&quot; :active=&quot;active-0&quot;&gt;\n    &lt;el-step title=&quot;实验室介绍&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;欢迎加入&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;学习方向&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;主要比赛&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;实验室照片&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;友情链接&quot;&gt;&lt;/el-step&gt;\n&lt;/el-steps&gt;\n</code></pre>\n<p>首先在步骤栏的组件上绑定一个active属性，代表当前激活的是哪一个步骤</p>\n<pre><code class=\"language-javascript\">const active=ref(&quot;&quot;);\nlet actives=reactive({\n    &quot;first&quot;:&quot;0&quot;,\n    &quot;second&quot;:&quot;1&quot;,\n    &quot;third&quot;:&quot;2&quot;,\n    &quot;fourth&quot;:&quot;3&quot;,\n    &quot;fifth&quot;:&quot;4&quot;,\n    &quot;sixth&quot;:&quot;5&quot;});\n</code></pre>\n<p>在setup函数里设置变量和id的对应关系</p>\n<pre><code class=\"language-javascript\">let list=reactive([&quot;first&quot;,&quot;second&quot;,&quot;third&quot;,&quot;fourth&quot;,&quot;fifth&quot;,&quot;sixth&quot;]);\nconst scrollHandle=(e)=&gt;{\n                // 获取视窗高度\n                let domHeight = document.body.offsetHeight;\n                // dom滚动位置\n                let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;\n                // 获取监听元素\n                let id=null;\n                // 获取监听元素本身高度\n                let scrollHeight=null;\n                // 获取监听元素距离视窗顶部距离\n                let offsetTop=null;\n                // 获取监听元素距离顶部高度-窗口高度\n                let top=null;\n                // 元素距离底部的高度+元素本身高度\n                let bottom=null;\n                list.map((i) =&gt; {\n                    id = document.getElementById(i);\n                    scrollHeight = id.scrollHeight;\n                    // console.log(&quot;元素高度:&quot;+scrollHeight)\n                    offsetTop = id.offsetTop;\n                    // console.log(&quot;元素绝对位置:&quot;+offsetTop)\n                    top = offsetTop - domHeight &gt; 0 ? offsetTop - domHeight : 0;\n                    // console.log(&quot;元素顶部:&quot;+top)\n                    bottom = scrollHeight + offsetTop;\n                    // console.log(&quot;元素底部:&quot;+bottom)\n                    // 页面滚动位置 &gt; 元素距离顶部高度-窗口高度 &amp;&amp; 页面滚动位置 &lt; 元素距离顶部高度+元素本身高度\n                    if (scrollTop &gt;= top &amp;&amp; scrollTop &lt;= bottom) {\n                        // console.log(\'元素出现在可视区: \' + i);\n                        active.value=actives[i]\n                    }\n                });\n            };\n            onMounted(()=&gt;{\n                window.addEventListener(&quot;scroll&quot;,scrollHandle)\n            });\n            return{\n                active\n            }\n</code></pre>\n<p>编写一个判断当前可视页面处于哪个位置的函数，来计算active变量</p>\n<p>把这个函数注册到浏览器，监听到事件即可执行</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457001003.gif\" alt=\"\" /></p>\n<h2>0x04 移动端拒绝</h2>\n<p>由于时间有限只开发完了web版本，移动端访问的话样式会有很大问题，所以干脆直接惯了移动端</p>\n<p>在app.vue中</p>\n<pre><code class=\"language-javascript\">const isMobile=()=&gt;{\n   let flag = navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)\n   return flag;\n}\nonMounted(()=&gt;{\n   // console.log(&quot;isMobile&quot;,isMobile())\n   if(isMobile()){\n      ElMessageBox({\n         title:&quot;设备错误&quot;,\n         message:&quot;请在电脑网页版访问，手机移动端暂不支持&quot;,\n         showClose:false,\n         showConfirmButton:false,\n         closeOnClickModal:false,\n         closeOnPressEscape:false\n      });\n   }\n})\n</code></pre>\n<p>先判断用户是不是移动端访问，是的话直接返回一个不能关闭的提示框，让用户乖乖去web端</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457001920.png\" alt=\"\" /></p>\n<h2>0x05防抖</h2>\n<p>如果用户持续点击访问后端资源的按钮会给服务器和数据库带来很大压力，这里给axios加全局防抖功能，控制恶意访问</p>\n<pre><code class=\"language-javascript\">// 正在进行中的请求列表\nlet reqList = []\n/**\n * 阻止重复请求\n * @param {array} reqList - 请求缓存列表\n * @param {string} url - 当前请求地址\n * @param {function} cancel - 请求中断函数\n * @param {string} errorMessage - 请求中断时需要显示的错误信息\n */\nconst stopRepeatRequest = function (reqList, url, cancel, errorMessage) {\n    const errorMsg = errorMessage || \'\'\n    for (let i = 0; i &lt; reqList.length; i++) {\n        if (reqList[i] === url) {\n            console.log(&quot;重复请求,请求被中断&quot;)\n            cancel(errorMsg)\n            return\n        }\n    }\n    reqList.push(url)\n}\n\n/**\n * 允许某个请求可以继续进行\n * @param {array} reqList 全部请求列表\n * @param {string} url 请求地址\n */\nconst allowRequest = function (reqList, url) {\n    for (let i = 0; i &lt; reqList.length; i++) {\n        if (reqList[i] === url) {\n            reqList.splice(i, 1)\n            break\n        }\n    }\n}\n\nconst service = axios.create({\n  baseURL: baseURL,\n  timeout: 6000,\n})\n\nservice.interceptors.request.use(\n  (config) =&gt; {\n      let cancel\n      // 设置cancelToken对象\n      config.cancelToken = new axios.CancelToken((config)=&gt; {\n          cancel = config\n      })\n      // 阻止重复请求。当上个请求未完成时，相同的请求不会进行\n      stopRepeatRequest(reqList, config.url, cancel, `已有相同请求，${config.url} 请求被中断`)\n    return config\n  },\n  (error) =&gt; {\n    return Promise.reject(error)\n  }\n)\n\nservice.interceptors.response.use(\n  (response) =&gt; {\n      // 增加延迟，相同请求不得在短时间内重复发送,在延迟时间内，由于请求列表还没有清除，相同的请求会在请求拦截器被拦截\n      setTimeout(() =&gt; {\n          allowRequest(reqList, response.config.url)\n      }, 1000)\n    // 正常，直接返回数据\n    return res\n  },\n  (error) =&gt; {\n      // 增加延迟，相同请求不得在短时间内重复发送,在延迟时间内，由于请求列表还没有清除，相同的请求会在请求拦截器被拦截\n      setTimeout(() =&gt; {\n          allowRequest(reqList, error.config.url)\n      }, 1000)\n    return Promise.reject(error)\n  }\n)\n</code></pre>\n<p>这样，发出去的请求会在全局请求队列中暂时保存，等到请求返回1000ms之后才可以再次发起请求，控制请求频率</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457002118.gif\" alt=\"\" /></p>\n<h2>0x06参考资料</h2>\n<p>https://juejin.cn/post/6844903921706614791</p>\n<p>https://blog.csdn.net/weixin_48255917/article/details/110041031</p>\n', 0, 0, 0, '18111493050', 7, '', 0, NULL, '2022-05-04 15:51:23', '2022-05-04 15:51:23', 0);
INSERT INTO `blog` VALUES (22, '1234', '<hr />\n<p>title: itlab主页开发\ndate: 2021-05-11\ntags:</p>\n<ul>\n<li>vue</li>\n</ul>\n<hr />\n<h1>itlab主页开发</h1>\n<p>[TOC]</p>\n<h2>0x01 简介及开发技术栈</h2>\n<p>因为实验室之前的主页有点年头了，而且由于多人开发所以功能也有点重叠，所以重新整合了一下</p>\n<p>开发框架：vue3</p>\n<p>构建工具：vite</p>\n<p>UI框架：element-plus</p>\n<p>动画库：aos，particles.vue3</p>\n<p>其他还用到了诸如less等</p>\n<p>github：https://github.com/iznilul/itlab_home</p>\n<h2>0x02 整体布局</h2>\n<pre><code class=\"language-vue\">&lt;AHeader @gotoPage=&quot;gotoPage&quot;&gt;&lt;/AHeader&gt;\n&lt;AContent&gt;&lt;/AContent&gt;\n&lt;AFooter&gt;&lt;/AFooter&gt;\n</code></pre>\n<p>封装BasicLayout组件，由页头内容页脚三部分组成</p>\n<p>AHeader页头就是菜单，点击，调用父组件注册的跳转方法，实现路由</p>\n<p>AFooter页脚就是一段话( ╯□╰ )</p>\n<p>AContent包含了当前路由内容和粒子动画效果</p>\n<p>三个部分都采取了position:fixed 相对定位</p>\n<pre><code class=\"language-less\">#baseLayout{\n  height: 100%;\n  color: #000000;\n  position: relative;// 关键\n  box-sizing: border-box;\n  min-height:100%; // 关键\n  #header {\n    z-index: 2;\n    height: 60px;\n    position: fixed;// 关键\n    background: black;\n    top: 0;\n    left: 0;\n    right: 0;\n  }\n  #content{\n    height: 100%;\n    width: 100%;\n    //z-index: 0;\n    //background: black;\n    position: absolute;// 关键\n    top: 50px;\n    left: -8px;\n    right: 0;\n  }\n  #footer {\n    text-align: center;\n    overflow: auto;\n    background: black; //背景颜色，可以防止被覆盖\n    z-index: 1;\n    height: 30px;\n    position: fixed;// 关键\n    bottom: 0;\n    left: 0;\n    right: 0;\n  }\n}\n</code></pre>\n<p>这样保证页面滚动时位置相对锁定，时刻能呈现这三个组件</p>\n<p>预览效果</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457002233.gif\" alt=\"\" /></p>\n<h2>0x03 页内导航和步骤条</h2>\n<p>导航栏可以用a标签页内定位元素，实现导航</p>\n<pre><code class=\"language-vue\">&lt;el-tab-pane name=&quot;0&quot; label=&quot;实验室介绍&quot;&gt;&lt;a href=&quot;#first&quot;&gt;实验室介绍&lt;/a&gt;&lt;/el-tab-pane&gt;\n&lt;el-tab-pane name=&quot;1&quot; label=&quot;欢迎加入&quot;&gt;&lt;a href=&quot;#second&quot;&gt;欢迎加入&lt;/a&gt;&lt;/el-tab-pane&gt;\n&lt;el-tab-pane name=&quot;2&quot; label=&quot;学习方向&quot;&gt;&lt;a href=&quot;#third&quot;&gt;学习方向&lt;/a&gt;&lt;/el-tab-pane&gt;\n</code></pre>\n<p>步骤栏要麻烦一些</p>\n<pre><code class=\"language-vue\">&lt;el-steps id=&quot;step&quot; direction=&quot;vertical&quot; :active=&quot;active-0&quot;&gt;\n    &lt;el-step title=&quot;实验室介绍&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;欢迎加入&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;学习方向&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;主要比赛&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;实验室照片&quot;&gt;&lt;/el-step&gt;\n    &lt;el-step title=&quot;友情链接&quot;&gt;&lt;/el-step&gt;\n&lt;/el-steps&gt;\n</code></pre>\n<p>首先在步骤栏的组件上绑定一个active属性，代表当前激活的是哪一个步骤</p>\n<pre><code class=\"language-javascript\">const active=ref(&quot;&quot;);\nlet actives=reactive({\n    &quot;first&quot;:&quot;0&quot;,\n    &quot;second&quot;:&quot;1&quot;,\n    &quot;third&quot;:&quot;2&quot;,\n    &quot;fourth&quot;:&quot;3&quot;,\n    &quot;fifth&quot;:&quot;4&quot;,\n    &quot;sixth&quot;:&quot;5&quot;});\n</code></pre>\n<p>在setup函数里设置变量和id的对应关系</p>\n<pre><code class=\"language-javascript\">let list=reactive([&quot;first&quot;,&quot;second&quot;,&quot;third&quot;,&quot;fourth&quot;,&quot;fifth&quot;,&quot;sixth&quot;]);\nconst scrollHandle=(e)=&gt;{\n                // 获取视窗高度\n                let domHeight = document.body.offsetHeight;\n                // dom滚动位置\n                let scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop;\n                // 获取监听元素\n                let id=null;\n                // 获取监听元素本身高度\n                let scrollHeight=null;\n                // 获取监听元素距离视窗顶部距离\n                let offsetTop=null;\n                // 获取监听元素距离顶部高度-窗口高度\n                let top=null;\n                // 元素距离底部的高度+元素本身高度\n                let bottom=null;\n                list.map((i) =&gt; {\n                    id = document.getElementById(i);\n                    scrollHeight = id.scrollHeight;\n                    // console.log(&quot;元素高度:&quot;+scrollHeight)\n                    offsetTop = id.offsetTop;\n                    // console.log(&quot;元素绝对位置:&quot;+offsetTop)\n                    top = offsetTop - domHeight &gt; 0 ? offsetTop - domHeight : 0;\n                    // console.log(&quot;元素顶部:&quot;+top)\n                    bottom = scrollHeight + offsetTop;\n                    // console.log(&quot;元素底部:&quot;+bottom)\n                    // 页面滚动位置 &gt; 元素距离顶部高度-窗口高度 &amp;&amp; 页面滚动位置 &lt; 元素距离顶部高度+元素本身高度\n                    if (scrollTop &gt;= top &amp;&amp; scrollTop &lt;= bottom) {\n                        // console.log(\'元素出现在可视区: \' + i);\n                        active.value=actives[i]\n                    }\n                });\n            };\n            onMounted(()=&gt;{\n                window.addEventListener(&quot;scroll&quot;,scrollHandle)\n            });\n            return{\n                active\n            }\n</code></pre>\n<p>编写一个判断当前可视页面处于哪个位置的函数，来计算active变量</p>\n<p>把这个函数注册到浏览器，监听到事件即可执行</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457001003.gif\" alt=\"\" /></p>\n<h2>0x04 移动端拒绝</h2>\n<p>由于时间有限只开发完了web版本，移动端访问的话样式会有很大问题，所以干脆直接惯了移动端</p>\n<p>在app.vue中</p>\n<pre><code class=\"language-javascript\">const isMobile=()=&gt;{\n   let flag = navigator.userAgent.match(/(phone|pad|pod|iPhone|iPod|ios|iPad|Android|Mobile|BlackBerry|IEMobile|MQQBrowser|JUC|Fennec|wOSBrowser|BrowserNG|WebOS|Symbian|Windows Phone)/i)\n   return flag;\n}\nonMounted(()=&gt;{\n   // console.log(&quot;isMobile&quot;,isMobile())\n   if(isMobile()){\n      ElMessageBox({\n         title:&quot;设备错误&quot;,\n         message:&quot;请在电脑网页版访问，手机移动端暂不支持&quot;,\n         showClose:false,\n         showConfirmButton:false,\n         closeOnClickModal:false,\n         closeOnPressEscape:false\n      });\n   }\n})\n</code></pre>\n<p>先判断用户是不是移动端访问，是的话直接返回一个不能关闭的提示框，让用户乖乖去web端</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457001920.png\" alt=\"\" /></p>\n<h2>0x05防抖</h2>\n<p>如果用户持续点击访问后端资源的按钮会给服务器和数据库带来很大压力，这里给axios加全局防抖功能，控制恶意访问</p>\n<pre><code class=\"language-javascript\">// 正在进行中的请求列表\nlet reqList = []\n/**\n * 阻止重复请求\n * @param {array} reqList - 请求缓存列表\n * @param {string} url - 当前请求地址\n * @param {function} cancel - 请求中断函数\n * @param {string} errorMessage - 请求中断时需要显示的错误信息\n */\nconst stopRepeatRequest = function (reqList, url, cancel, errorMessage) {\n    const errorMsg = errorMessage || \'\'\n    for (let i = 0; i &lt; reqList.length; i++) {\n        if (reqList[i] === url) {\n            console.log(&quot;重复请求,请求被中断&quot;)\n            cancel(errorMsg)\n            return\n        }\n    }\n    reqList.push(url)\n}\n\n/**\n * 允许某个请求可以继续进行\n * @param {array} reqList 全部请求列表\n * @param {string} url 请求地址\n */\nconst allowRequest = function (reqList, url) {\n    for (let i = 0; i &lt; reqList.length; i++) {\n        if (reqList[i] === url) {\n            reqList.splice(i, 1)\n            break\n        }\n    }\n}\n\nconst service = axios.create({\n  baseURL: baseURL,\n  timeout: 6000,\n})\n\nservice.interceptors.request.use(\n  (config) =&gt; {\n      let cancel\n      // 设置cancelToken对象\n      config.cancelToken = new axios.CancelToken((config)=&gt; {\n          cancel = config\n      })\n      // 阻止重复请求。当上个请求未完成时，相同的请求不会进行\n      stopRepeatRequest(reqList, config.url, cancel, `已有相同请求，${config.url} 请求被中断`)\n    return config\n  },\n  (error) =&gt; {\n    return Promise.reject(error)\n  }\n)\n\nservice.interceptors.response.use(\n  (response) =&gt; {\n      // 增加延迟，相同请求不得在短时间内重复发送,在延迟时间内，由于请求列表还没有清除，相同的请求会在请求拦截器被拦截\n      setTimeout(() =&gt; {\n          allowRequest(reqList, response.config.url)\n      }, 1000)\n    // 正常，直接返回数据\n    return res\n  },\n  (error) =&gt; {\n      // 增加延迟，相同请求不得在短时间内重复发送,在延迟时间内，由于请求列表还没有清除，相同的请求会在请求拦截器被拦截\n      setTimeout(() =&gt; {\n          allowRequest(reqList, error.config.url)\n      }, 1000)\n    return Promise.reject(error)\n  }\n)\n</code></pre>\n<p>这样，发出去的请求会在全局请求队列中暂时保存，等到请求返回1000ms之后才可以再次发起请求，控制请求频率</p>\n<p><img src=\"https://cdn.jsdelivr.net/gh/iznilul/img/1645457002118.gif\" alt=\"\" /></p>\n<h2>0x06参考资料</h2>\n<p>https://juejin.cn/post/6844903921706614791</p>\n<p>https://blog.csdn.net/weixin_48255917/article/details/110041031</p>\n', 0, 0, 1, 'test', 8, '', 0, NULL, '2022-05-04 15:54:51', '2022-05-04 15:54:51', 0);

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NULL DEFAULT NULL,
  `tag_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (24, 21, 15);
INSERT INTO `blog_tag` VALUES (25, 22, 14);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '你是杰哥', 'data:image/png;base64,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', '我是杰哥', 0, NULL, '2021-12-15 00:44:30', 0);
INSERT INTO `book` VALUES (2, '下北沢的野兽', 'data:image/png;base64,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', '114514', 0, NULL, '2021-12-15 22:27:49', 0);
INSERT INTO `book` VALUES (3, '阿伟', 'data:image/png;base64,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', '我超勇的', 0, '2021-12-13 21:57:21', '2022-04-25 20:10:30', 0);

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `book_id` int(11) NOT NULL COMMENT '书id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_tag
-- ----------------------------
INSERT INTO `book_tag` VALUES (20, 1, 5);
INSERT INTO `book_tag` VALUES (21, 1, 6);
INSERT INTO `book_tag` VALUES (22, 1, 10);
INSERT INTO `book_tag` VALUES (23, 1, 16);
INSERT INTO `book_tag` VALUES (32, 2, 7);
INSERT INTO `book_tag` VALUES (33, 2, 5);
INSERT INTO `book_tag` VALUES (34, 2, 8);
INSERT INTO `book_tag` VALUES (35, 2, 9);
INSERT INTO `book_tag` VALUES (36, 2, 15);
INSERT INTO `book_tag` VALUES (37, 3, 12);
INSERT INTO `book_tag` VALUES (38, 3, 5);
INSERT INTO `book_tag` VALUES (39, 3, 13);

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
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `weight` int(11) NULL DEFAULT NULL COMMENT '排序权重',
  `delete_flag` tinyint(2) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (7, 'web', 0, 0);
INSERT INTO `category` VALUES (8, 'java', 0, 0);
INSERT INTO `category` VALUES (9, 'python', 0, 0);

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
  `external` tinyint(2) NULL DEFAULT NULL COMMENT '无外链0 有外联1',
  `hidden` tinyint(2) NULL DEFAULT NULL COMMENT '不隐藏0 隐藏1',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外链地址',
  `role_id` tinyint(2) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1001, 0, '/home', 'home', '主页', 'md-home', '18', '/Home', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (1002, 0, '/userinfo', 'userinfo', '用户信息', 'ios-time', '18', '/UserInfo', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (1003, 0, '/member', 'member', '成员管理', 'md-person', '18', '/Member', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (2000, 0, '/book', 'book', '书籍管理', 'ios-book-outline', '18', '', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (2001, 2000, '/booklist', 'booklist', '书籍列表', 'ios-book', '18', '/Book', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (2002, 2000, '/bookuser', 'bookuser', '书籍记录', 'md-book', '18', '/BookUser', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (3000, 0, '/key', 'key', '钥匙管理', 'ios-key-outline', '18', '', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (3001, 3000, '/keylist', 'keylist', '钥匙列表', 'ios-key', '18', '/Key', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (3002, 3000, '/keyuser', 'keyuser', '钥匙记录', 'md-key', '18', '/KeyUser', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4000, 0, '/blog', 'blog', '博客管理', 'ios-egg-outline', '18', NULL, NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4001, 4000, '/blogList', 'blogList', '博客列表', 'ios-egg', '18', '/BlogList', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4002, 4000, '/blogList/:blogId', 'blog', '博客页', 'md-briefcase', '18', '/Blog', NULL, 1, NULL, 3);
INSERT INTO `menu` VALUES (4003, 4000, '/userBlog', 'userBlog', '博客统计', 'md-beaker', '18', '/UserBlog', NULL, NULL, NULL, 3);
INSERT INTO `menu` VALUES (4004, 4000, NULL, NULL, '博客主页', 'logo-buffer', '18', NULL, 1, NULL, 'https://sdutitlab.github.io/', 3);
INSERT INTO `menu` VALUES (5000, 0, '/admin', 'admin', '系统管理', 'ios-lock', '18', '', NULL, NULL, NULL, 2);
INSERT INTO `menu` VALUES (5001, 5000, '/sysrecord', 'sysrecord', '操作记录', 'ios-time', '18', '/SysRecord', NULL, NULL, NULL, 2);
INSERT INTO `menu` VALUES (5002, 5000, '/signup', 'signup', '报名管理', 'md-bookmark', '18', '/SignUp', NULL, NULL, NULL, 2);
INSERT INTO `menu` VALUES (5003, 5000, '/resource', 'resource', '接口管理', 'logo-buffer', '18', '/Resource', NULL, NULL, NULL, 2);
INSERT INTO `menu` VALUES (5004, 5000, '/tag', 'tag', '标签管理', 'md-card', '18', '/Tag', NULL, NULL, NULL, 2);
INSERT INTO `menu` VALUES (5005, 5000, '/category', 'category', '分类管理', 'md-albums', '18', '/Category', NULL, NULL, NULL, 2);

-- ----------------------------
-- Table structure for recruit_group
-- ----------------------------
DROP TABLE IF EXISTS `recruit_group`;
CREATE TABLE `recruit_group`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `group_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruit_group
-- ----------------------------
INSERT INTO `recruit_group` VALUES (1, '114514');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1467896460384775901 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '资源' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1467896460384775827, '修改博客信息', 'POST', '/blog/blog/change', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775828, '查看博客', 'GET', '/blog/blog/query', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775829, '回显博客信息', 'GET', '/blog/blog/detail', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775830, '删除博客', 'GET', '/blog/blog/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775831, '查看博客', 'POST', '/blog/blog/queryList', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775832, '上传博客文件', 'POST', '/blog/blog/add', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775833, '查看博客', 'POST', '/blog/blog/queryUserBlogList', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775834, '删除书籍', 'GET', '/blog/book/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775835, '上传书籍照片', 'POST', '/blog/book/changeImg', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775836, '书籍列表', 'POST', '/blog/book/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775837, '添加书籍', 'GET', '/blog/book/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775838, '借书', 'GET', '/blog/book/borrow', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775839, '请求书籍', 'GET', '/blog/book/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775840, '还书', 'GET', '/blog/book/return', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775841, '修改书籍', 'POST', '/blog/book/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775842, '查询借阅记录', 'POST', '/blog/bookUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775843, '获取分类列表', 'POST', '/blog/category/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775844, '增加分类', 'POST', '/blog/category/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775845, '删除分类', 'GET', '/blog/category/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775846, '获取分类', 'GET', '/blog/category/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775847, '更新分类', 'POST', '/blog/category/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775848, '认证测试', 'GET', '/blog/common/test', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775849, '用户退出', 'GET', '/blog/common/logout', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775850, '用户登录', 'POST', '/blog/common/login', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775851, '模糊查询博客状态', 'GET', '/blog/enum/blog', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775852, '模糊查询成员状态', 'GET', '/blog/enum/userStatus', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775853, '模糊查询博客发布状态', 'GET', '/blog/enum/publish', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775854, '模糊查询报名状态', 'GET', '/blog/enum/signUpStatus', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775855, '模糊查询钥匙', 'GET', '/blog/enum/key', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775856, '模糊查询角色', 'GET', '/blog/enum/role', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775857, '模糊查询分类', 'GET', '/blog/enum/category', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775858, '模糊查询用户名列表', 'GET', '/blog/enum/username', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775859, '模糊查询标签', 'GET', '/blog/enum/tag', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775860, '模糊查询专业列表', 'GET', '/blog/enum/major', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775861, '模糊查询姓名列表', 'GET', '/blog/enum/name', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775862, '模糊查询书籍状态', 'GET', '/blog/enum/book', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775863, '模糊查询博客原创状态', 'GET', '/blog/enum/original', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775864, '借钥匙', 'GET', '/blog/key/borrow', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775865, '增加钥匙', 'GET', '/blog/key/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775866, '钥匙列表', 'POST', '/blog/key/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775867, '根据id查询钥匙', 'GET', '/blog/key/queryById', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775868, '还钥匙', 'GET', '/blog/key/return', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775869, '修改钥匙', 'POST', '/blog/key/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775870, '删除钥匙', 'GET', '/blog/key/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775871, '增加钥匙持有人', 'GET', '/blog/keyUser/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775872, '删除钥匙持有人', 'GET', '/blog/keyUser/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775873, '钥匙记录列表', 'POST', '/blog/keyUser/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775874, '获取路径', 'GET', '/blog/menu/fetch', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775875, '服务器监控', 'GET', '/blog/monitor/server', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775876, 'csdn实时展示', 'GET', '/blog/rank/csdn', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775877, '获取资源接口', 'POST', '/blog/resource/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775878, '更改接口开放状态', 'GET', '/blog/resource/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775879, '报名结果查询', 'GET', '/blog/signup/query', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775880, '纳新报名', 'POST', '/blog/signup/add', 'common', 1);
INSERT INTO `resource` VALUES (1467896460384775881, '导出报名单', 'GET', '/blog/signup/export', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775882, '获取报名记录', 'POST', '/blog/signup/queryList', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775883, '更新报名记录', 'POST', '/blog/signup/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775884, '操作记录列表', 'POST', '/blog/sysRecord/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775885, '获取标签列表', 'POST', '/blog/tag/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775886, '删除标签', 'GET', '/blog/tag/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775887, '更新标签', 'POST', '/blog/tag/change', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775888, '增加标签', 'POST', '/blog/tag/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775889, '获取标签', 'GET', '/blog/tag/query', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775890, '注册用户', 'POST', '/blog/user/add', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775891, '获取用户信息', 'GET', '/blog/user/query', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775892, '获取用户权限信息', 'GET', '/blog/user/queryRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775893, '删除用户', 'GET', '/blog/user/cancel', 'admin', 1);
INSERT INTO `resource` VALUES (1467896460384775894, '更新用户权限', 'POST', '/blog/user/changeRole', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775895, '更新用户信息', 'POST', '/blog/user/change', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775896, '查询用户列表', 'POST', '/blog/user/queryList', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775897, '上传头像文件', 'POST', '/blog/user/changeImg', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775898, '修改密码', 'POST', '/blog/user/changePassword', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775899, '根据用户名选择用户', 'GET', '/blog/user/queryByUsername', 'user', 1);
INSERT INTO `resource` VALUES (1467896460384775900, '修改成员的角色权限', 'POST', '/blog/userRole/grant', 'superAdmin', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11485 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (11431, 3, 1001);
INSERT INTO `role_menu` VALUES (11432, 3, 1002);
INSERT INTO `role_menu` VALUES (11433, 3, 1003);
INSERT INTO `role_menu` VALUES (11434, 3, 2000);
INSERT INTO `role_menu` VALUES (11435, 3, 2001);
INSERT INTO `role_menu` VALUES (11436, 3, 2002);
INSERT INTO `role_menu` VALUES (11437, 3, 3000);
INSERT INTO `role_menu` VALUES (11438, 3, 3001);
INSERT INTO `role_menu` VALUES (11439, 3, 3002);
INSERT INTO `role_menu` VALUES (11440, 3, 4000);
INSERT INTO `role_menu` VALUES (11441, 3, 4001);
INSERT INTO `role_menu` VALUES (11442, 3, 4002);
INSERT INTO `role_menu` VALUES (11443, 3, 4003);
INSERT INTO `role_menu` VALUES (11444, 3, 4004);
INSERT INTO `role_menu` VALUES (11445, 2, 1001);
INSERT INTO `role_menu` VALUES (11446, 2, 1002);
INSERT INTO `role_menu` VALUES (11447, 2, 1003);
INSERT INTO `role_menu` VALUES (11448, 2, 2000);
INSERT INTO `role_menu` VALUES (11449, 2, 2001);
INSERT INTO `role_menu` VALUES (11450, 2, 2002);
INSERT INTO `role_menu` VALUES (11451, 2, 3000);
INSERT INTO `role_menu` VALUES (11452, 2, 3001);
INSERT INTO `role_menu` VALUES (11453, 2, 3002);
INSERT INTO `role_menu` VALUES (11454, 2, 4000);
INSERT INTO `role_menu` VALUES (11455, 2, 4001);
INSERT INTO `role_menu` VALUES (11456, 2, 4002);
INSERT INTO `role_menu` VALUES (11457, 2, 4003);
INSERT INTO `role_menu` VALUES (11458, 2, 4004);
INSERT INTO `role_menu` VALUES (11459, 2, 5000);
INSERT INTO `role_menu` VALUES (11460, 2, 5001);
INSERT INTO `role_menu` VALUES (11461, 2, 5002);
INSERT INTO `role_menu` VALUES (11462, 2, 5003);
INSERT INTO `role_menu` VALUES (11463, 2, 5004);
INSERT INTO `role_menu` VALUES (11464, 2, 5005);
INSERT INTO `role_menu` VALUES (11465, 1, 1001);
INSERT INTO `role_menu` VALUES (11466, 1, 1002);
INSERT INTO `role_menu` VALUES (11467, 1, 1003);
INSERT INTO `role_menu` VALUES (11468, 1, 2000);
INSERT INTO `role_menu` VALUES (11469, 1, 2001);
INSERT INTO `role_menu` VALUES (11470, 1, 2002);
INSERT INTO `role_menu` VALUES (11471, 1, 3000);
INSERT INTO `role_menu` VALUES (11472, 1, 3001);
INSERT INTO `role_menu` VALUES (11473, 1, 3002);
INSERT INTO `role_menu` VALUES (11474, 1, 4000);
INSERT INTO `role_menu` VALUES (11475, 1, 4001);
INSERT INTO `role_menu` VALUES (11476, 1, 4002);
INSERT INTO `role_menu` VALUES (11477, 1, 4003);
INSERT INTO `role_menu` VALUES (11478, 1, 4004);
INSERT INTO `role_menu` VALUES (11479, 1, 5000);
INSERT INTO `role_menu` VALUES (11480, 1, 5001);
INSERT INTO `role_menu` VALUES (11481, 1, 5002);
INSERT INTO `role_menu` VALUES (11482, 1, 5003);
INSERT INTO `role_menu` VALUES (11483, 1, 5004);
INSERT INTO `role_menu` VALUES (11484, 1, 5005);

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
) ENGINE = InnoDB AUTO_INCREMENT = 61029 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-权限关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_resource
-- ----------------------------
INSERT INTO `role_resource` VALUES (60833, 4, 1467896460384775850);
INSERT INTO `role_resource` VALUES (60834, 4, 1467896460384775833);
INSERT INTO `role_resource` VALUES (60835, 4, 1467896460384775849);
INSERT INTO `role_resource` VALUES (60836, 4, 1467896460384775832);
INSERT INTO `role_resource` VALUES (60837, 4, 1467896460384775848);
INSERT INTO `role_resource` VALUES (60838, 4, 1467896460384775880);
INSERT INTO `role_resource` VALUES (60839, 4, 1467896460384775827);
INSERT INTO `role_resource` VALUES (60840, 4, 1467896460384775831);
INSERT INTO `role_resource` VALUES (60841, 4, 1467896460384775879);
INSERT INTO `role_resource` VALUES (60842, 4, 1467896460384775829);
INSERT INTO `role_resource` VALUES (60843, 4, 1467896460384775828);
INSERT INTO `role_resource` VALUES (60844, 4, 1467896460384775876);
INSERT INTO `role_resource` VALUES (60845, 3, 1467896460384775899);
INSERT INTO `role_resource` VALUES (60846, 3, 1467896460384775898);
INSERT INTO `role_resource` VALUES (60847, 3, 1467896460384775833);
INSERT INTO `role_resource` VALUES (60848, 3, 1467896460384775897);
INSERT INTO `role_resource` VALUES (60849, 3, 1467896460384775832);
INSERT INTO `role_resource` VALUES (60850, 3, 1467896460384775896);
INSERT INTO `role_resource` VALUES (60851, 3, 1467896460384775839);
INSERT INTO `role_resource` VALUES (60852, 3, 1467896460384775836);
INSERT INTO `role_resource` VALUES (60853, 3, 1467896460384775827);
INSERT INTO `role_resource` VALUES (60854, 3, 1467896460384775891);
INSERT INTO `role_resource` VALUES (60855, 3, 1467896460384775831);
INSERT INTO `role_resource` VALUES (60856, 3, 1467896460384775895);
INSERT INTO `role_resource` VALUES (60857, 3, 1467896460384775894);
INSERT INTO `role_resource` VALUES (60858, 3, 1467896460384775829);
INSERT INTO `role_resource` VALUES (60859, 3, 1467896460384775828);
INSERT INTO `role_resource` VALUES (60860, 3, 1467896460384775892);
INSERT INTO `role_resource` VALUES (60861, 3, 1467896460384775880);
INSERT INTO `role_resource` VALUES (60862, 3, 1467896460384775885);
INSERT INTO `role_resource` VALUES (60863, 3, 1467896460384775875);
INSERT INTO `role_resource` VALUES (60864, 3, 1467896460384775874);
INSERT INTO `role_resource` VALUES (60865, 3, 1467896460384775873);
INSERT INTO `role_resource` VALUES (60866, 3, 1467896460384775879);
INSERT INTO `role_resource` VALUES (60867, 3, 1467896460384775876);
INSERT INTO `role_resource` VALUES (60868, 3, 1467896460384775866);
INSERT INTO `role_resource` VALUES (60869, 3, 1467896460384775864);
INSERT INTO `role_resource` VALUES (60870, 3, 1467896460384775868);
INSERT INTO `role_resource` VALUES (60871, 3, 1467896460384775858);
INSERT INTO `role_resource` VALUES (60872, 3, 1467896460384775856);
INSERT INTO `role_resource` VALUES (60873, 3, 1467896460384775861);
INSERT INTO `role_resource` VALUES (60874, 3, 1467896460384775860);
INSERT INTO `role_resource` VALUES (60875, 3, 1467896460384775850);
INSERT INTO `role_resource` VALUES (60876, 3, 1467896460384775849);
INSERT INTO `role_resource` VALUES (60877, 3, 1467896460384775848);
INSERT INTO `role_resource` VALUES (60878, 3, 1467896460384775855);
INSERT INTO `role_resource` VALUES (60879, 3, 1467896460384775852);
INSERT INTO `role_resource` VALUES (60880, 3, 1467896460384775843);
INSERT INTO `role_resource` VALUES (60881, 3, 1467896460384775842);
INSERT INTO `role_resource` VALUES (60882, 2, 1467896460384775835);
INSERT INTO `role_resource` VALUES (60883, 2, 1467896460384775834);
INSERT INTO `role_resource` VALUES (60884, 2, 1467896460384775833);
INSERT INTO `role_resource` VALUES (60885, 2, 1467896460384775832);
INSERT INTO `role_resource` VALUES (60886, 2, 1467896460384775839);
INSERT INTO `role_resource` VALUES (60887, 2, 1467896460384775838);
INSERT INTO `role_resource` VALUES (60888, 2, 1467896460384775837);
INSERT INTO `role_resource` VALUES (60889, 2, 1467896460384775836);
INSERT INTO `role_resource` VALUES (60890, 2, 1467896460384775827);
INSERT INTO `role_resource` VALUES (60891, 2, 1467896460384775831);
INSERT INTO `role_resource` VALUES (60892, 2, 1467896460384775830);
INSERT INTO `role_resource` VALUES (60893, 2, 1467896460384775829);
INSERT INTO `role_resource` VALUES (60894, 2, 1467896460384775828);
INSERT INTO `role_resource` VALUES (60895, 2, 1467896460384775867);
INSERT INTO `role_resource` VALUES (60896, 2, 1467896460384775866);
INSERT INTO `role_resource` VALUES (60897, 2, 1467896460384775865);
INSERT INTO `role_resource` VALUES (60898, 2, 1467896460384775864);
INSERT INTO `role_resource` VALUES (60899, 2, 1467896460384775871);
INSERT INTO `role_resource` VALUES (60900, 2, 1467896460384775870);
INSERT INTO `role_resource` VALUES (60901, 2, 1467896460384775869);
INSERT INTO `role_resource` VALUES (60902, 2, 1467896460384775868);
INSERT INTO `role_resource` VALUES (60903, 2, 1467896460384775859);
INSERT INTO `role_resource` VALUES (60904, 2, 1467896460384775858);
INSERT INTO `role_resource` VALUES (60905, 2, 1467896460384775857);
INSERT INTO `role_resource` VALUES (60906, 2, 1467896460384775856);
INSERT INTO `role_resource` VALUES (60907, 2, 1467896460384775863);
INSERT INTO `role_resource` VALUES (60908, 2, 1467896460384775862);
INSERT INTO `role_resource` VALUES (60909, 2, 1467896460384775861);
INSERT INTO `role_resource` VALUES (60910, 2, 1467896460384775860);
INSERT INTO `role_resource` VALUES (60911, 2, 1467896460384775851);
INSERT INTO `role_resource` VALUES (60912, 2, 1467896460384775850);
INSERT INTO `role_resource` VALUES (60913, 2, 1467896460384775849);
INSERT INTO `role_resource` VALUES (60914, 2, 1467896460384775848);
INSERT INTO `role_resource` VALUES (60915, 2, 1467896460384775855);
INSERT INTO `role_resource` VALUES (60916, 2, 1467896460384775854);
INSERT INTO `role_resource` VALUES (60917, 2, 1467896460384775853);
INSERT INTO `role_resource` VALUES (60918, 2, 1467896460384775852);
INSERT INTO `role_resource` VALUES (60919, 2, 1467896460384775843);
INSERT INTO `role_resource` VALUES (60920, 2, 1467896460384775842);
INSERT INTO `role_resource` VALUES (60921, 2, 1467896460384775841);
INSERT INTO `role_resource` VALUES (60922, 2, 1467896460384775840);
INSERT INTO `role_resource` VALUES (60923, 2, 1467896460384775847);
INSERT INTO `role_resource` VALUES (60924, 2, 1467896460384775846);
INSERT INTO `role_resource` VALUES (60925, 2, 1467896460384775845);
INSERT INTO `role_resource` VALUES (60926, 2, 1467896460384775844);
INSERT INTO `role_resource` VALUES (60927, 2, 1467896460384775899);
INSERT INTO `role_resource` VALUES (60928, 2, 1467896460384775898);
INSERT INTO `role_resource` VALUES (60929, 2, 1467896460384775897);
INSERT INTO `role_resource` VALUES (60930, 2, 1467896460384775896);
INSERT INTO `role_resource` VALUES (60931, 2, 1467896460384775891);
INSERT INTO `role_resource` VALUES (60932, 2, 1467896460384775890);
INSERT INTO `role_resource` VALUES (60933, 2, 1467896460384775889);
INSERT INTO `role_resource` VALUES (60934, 2, 1467896460384775888);
INSERT INTO `role_resource` VALUES (60935, 2, 1467896460384775895);
INSERT INTO `role_resource` VALUES (60936, 2, 1467896460384775894);
INSERT INTO `role_resource` VALUES (60937, 2, 1467896460384775893);
INSERT INTO `role_resource` VALUES (60938, 2, 1467896460384775892);
INSERT INTO `role_resource` VALUES (60939, 2, 1467896460384775883);
INSERT INTO `role_resource` VALUES (60940, 2, 1467896460384775882);
INSERT INTO `role_resource` VALUES (60941, 2, 1467896460384775881);
INSERT INTO `role_resource` VALUES (60942, 2, 1467896460384775880);
INSERT INTO `role_resource` VALUES (60943, 2, 1467896460384775887);
INSERT INTO `role_resource` VALUES (60944, 2, 1467896460384775886);
INSERT INTO `role_resource` VALUES (60945, 2, 1467896460384775885);
INSERT INTO `role_resource` VALUES (60946, 2, 1467896460384775884);
INSERT INTO `role_resource` VALUES (60947, 2, 1467896460384775875);
INSERT INTO `role_resource` VALUES (60948, 2, 1467896460384775874);
INSERT INTO `role_resource` VALUES (60949, 2, 1467896460384775873);
INSERT INTO `role_resource` VALUES (60950, 2, 1467896460384775872);
INSERT INTO `role_resource` VALUES (60951, 2, 1467896460384775879);
INSERT INTO `role_resource` VALUES (60952, 2, 1467896460384775878);
INSERT INTO `role_resource` VALUES (60953, 2, 1467896460384775877);
INSERT INTO `role_resource` VALUES (60954, 2, 1467896460384775876);
INSERT INTO `role_resource` VALUES (60955, 1, 1467896460384775835);
INSERT INTO `role_resource` VALUES (60956, 1, 1467896460384775834);
INSERT INTO `role_resource` VALUES (60957, 1, 1467896460384775833);
INSERT INTO `role_resource` VALUES (60958, 1, 1467896460384775832);
INSERT INTO `role_resource` VALUES (60959, 1, 1467896460384775839);
INSERT INTO `role_resource` VALUES (60960, 1, 1467896460384775838);
INSERT INTO `role_resource` VALUES (60961, 1, 1467896460384775837);
INSERT INTO `role_resource` VALUES (60962, 1, 1467896460384775836);
INSERT INTO `role_resource` VALUES (60963, 1, 1467896460384775827);
INSERT INTO `role_resource` VALUES (60964, 1, 1467896460384775831);
INSERT INTO `role_resource` VALUES (60965, 1, 1467896460384775830);
INSERT INTO `role_resource` VALUES (60966, 1, 1467896460384775829);
INSERT INTO `role_resource` VALUES (60967, 1, 1467896460384775828);
INSERT INTO `role_resource` VALUES (60968, 1, 1467896460384775867);
INSERT INTO `role_resource` VALUES (60969, 1, 1467896460384775866);
INSERT INTO `role_resource` VALUES (60970, 1, 1467896460384775865);
INSERT INTO `role_resource` VALUES (60971, 1, 1467896460384775864);
INSERT INTO `role_resource` VALUES (60972, 1, 1467896460384775871);
INSERT INTO `role_resource` VALUES (60973, 1, 1467896460384775870);
INSERT INTO `role_resource` VALUES (60974, 1, 1467896460384775869);
INSERT INTO `role_resource` VALUES (60975, 1, 1467896460384775868);
INSERT INTO `role_resource` VALUES (60976, 1, 1467896460384775859);
INSERT INTO `role_resource` VALUES (60977, 1, 1467896460384775858);
INSERT INTO `role_resource` VALUES (60978, 1, 1467896460384775857);
INSERT INTO `role_resource` VALUES (60979, 1, 1467896460384775856);
INSERT INTO `role_resource` VALUES (60980, 1, 1467896460384775863);
INSERT INTO `role_resource` VALUES (60981, 1, 1467896460384775862);
INSERT INTO `role_resource` VALUES (60982, 1, 1467896460384775861);
INSERT INTO `role_resource` VALUES (60983, 1, 1467896460384775860);
INSERT INTO `role_resource` VALUES (60984, 1, 1467896460384775851);
INSERT INTO `role_resource` VALUES (60985, 1, 1467896460384775850);
INSERT INTO `role_resource` VALUES (60986, 1, 1467896460384775849);
INSERT INTO `role_resource` VALUES (60987, 1, 1467896460384775848);
INSERT INTO `role_resource` VALUES (60988, 1, 1467896460384775855);
INSERT INTO `role_resource` VALUES (60989, 1, 1467896460384775854);
INSERT INTO `role_resource` VALUES (60990, 1, 1467896460384775853);
INSERT INTO `role_resource` VALUES (60991, 1, 1467896460384775852);
INSERT INTO `role_resource` VALUES (60992, 1, 1467896460384775843);
INSERT INTO `role_resource` VALUES (60993, 1, 1467896460384775842);
INSERT INTO `role_resource` VALUES (60994, 1, 1467896460384775841);
INSERT INTO `role_resource` VALUES (60995, 1, 1467896460384775840);
INSERT INTO `role_resource` VALUES (60996, 1, 1467896460384775847);
INSERT INTO `role_resource` VALUES (60997, 1, 1467896460384775846);
INSERT INTO `role_resource` VALUES (60998, 1, 1467896460384775845);
INSERT INTO `role_resource` VALUES (60999, 1, 1467896460384775844);
INSERT INTO `role_resource` VALUES (61000, 1, 1467896460384775899);
INSERT INTO `role_resource` VALUES (61001, 1, 1467896460384775898);
INSERT INTO `role_resource` VALUES (61002, 1, 1467896460384775897);
INSERT INTO `role_resource` VALUES (61003, 1, 1467896460384775896);
INSERT INTO `role_resource` VALUES (61004, 1, 1467896460384775900);
INSERT INTO `role_resource` VALUES (61005, 1, 1467896460384775891);
INSERT INTO `role_resource` VALUES (61006, 1, 1467896460384775890);
INSERT INTO `role_resource` VALUES (61007, 1, 1467896460384775889);
INSERT INTO `role_resource` VALUES (61008, 1, 1467896460384775888);
INSERT INTO `role_resource` VALUES (61009, 1, 1467896460384775895);
INSERT INTO `role_resource` VALUES (61010, 1, 1467896460384775894);
INSERT INTO `role_resource` VALUES (61011, 1, 1467896460384775893);
INSERT INTO `role_resource` VALUES (61012, 1, 1467896460384775892);
INSERT INTO `role_resource` VALUES (61013, 1, 1467896460384775883);
INSERT INTO `role_resource` VALUES (61014, 1, 1467896460384775882);
INSERT INTO `role_resource` VALUES (61015, 1, 1467896460384775881);
INSERT INTO `role_resource` VALUES (61016, 1, 1467896460384775880);
INSERT INTO `role_resource` VALUES (61017, 1, 1467896460384775887);
INSERT INTO `role_resource` VALUES (61018, 1, 1467896460384775886);
INSERT INTO `role_resource` VALUES (61019, 1, 1467896460384775885);
INSERT INTO `role_resource` VALUES (61020, 1, 1467896460384775884);
INSERT INTO `role_resource` VALUES (61021, 1, 1467896460384775875);
INSERT INTO `role_resource` VALUES (61022, 1, 1467896460384775874);
INSERT INTO `role_resource` VALUES (61023, 1, 1467896460384775873);
INSERT INTO `role_resource` VALUES (61024, 1, 1467896460384775872);
INSERT INTO `role_resource` VALUES (61025, 1, 1467896460384775879);
INSERT INTO `role_resource` VALUES (61026, 1, 1467896460384775878);
INSERT INTO `role_resource` VALUES (61027, 1, 1467896460384775877);
INSERT INTO `role_resource` VALUES (61028, 1, 1467896460384775876);

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
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sign_up
-- ----------------------------
INSERT INTO `sign_up` VALUES (30, '21111493027', '刘豪男', '男', '3071627396', '信管本2101', '技术栈发展方向目前是Java和python，对HTML和js也感兴趣但是目前还未学习。兴趣方向是人工智能，对编程比赛也感兴趣。实验室学习时间上如果没有其它工作或课程的时候都可以去学习。', 0, NULL, '2022-04-07 01:13:45', '2022-04-07 01:13:45');
INSERT INTO `sign_up` VALUES (31, '21121408027', '张艺涵', '女', '981886410', '信管2102', '自己对于实验室所学习的软件开发、系统设计、大数据分析有浓厚的兴趣，对于这些内容与自己所学的内容息息相关，一方面希望可以通过加入实验室来接触学习新的知识，另一方面也是对于自身能力的一种提高。自己没有参加较多的学生会部门，进入实验室进行学习的时间很自由。非常希望能够进入实验室近有关的实际操作进行学习。', 0, NULL, '2022-04-07 01:19:47', '2022-04-07 01:19:47');
INSERT INTO `sign_up` VALUES (32, '21121408025', '肖畅', '女', '2330547131', '信管2102', '课程少的时候，我会尽我最大的能力在实验室学习，现在有好多的大赛我由于懂得太少而没有信心参加，希望通过多学习能够多参加一些大赛而汲取更多的知识经验。', 0, NULL, '2022-04-07 02:02:27', '2022-04-07 02:02:27');
INSERT INTO `sign_up` VALUES (33, '21111493010', '韩剑青', '男', '1937528652', '信管本2101', '目前大一阶段只学习了Java，时间由于本人未参加任何社团任何部门，所以除去正常上课的时间，剩下的时间都可以去实验室', 0, NULL, '2022-04-07 03:28:44', '2022-04-07 03:29:20');
INSERT INTO `sign_up` VALUES (34, '201114080999', 'myq', '男', '206666666', 'ssss', 's s s', 2, NULL, '2022-04-07 03:43:10', '2022-04-07 07:50:29');
INSERT INTO `sign_up` VALUES (35, '2011140809999', 'myq', '男', '206666666', 'ssss', 's s s', 2, NULL, '2022-04-07 03:52:03', '2022-04-07 07:50:17');
INSERT INTO `sign_up` VALUES (36, '21111407011', '师怡晨', '男', '506554036', '市销2102', '兴趣方向：网络安全与维护\n对于计算机没有基础，但作为一个理科生热爱这方面。如果可以成功加入的话一定努力学习。', 0, NULL, '2022-04-07 04:20:28', '2022-04-07 04:20:28');
INSERT INTO `sign_up` VALUES (37, '21111408043', '王俊尧', '男', '695542673', '信管2101', '为人严谨认真，诚实守信，公私分明，具有良好的思想品德和操守，无获奖记录，有一定的上进心，学习时间每个周末可以有一定保证，但平时时间不能确定，想加入实验室的主要原因是想要一个优良的学习环境，二是想要在技术方面的学习上有一定的提升。', 0, NULL, '2022-04-07 07:55:19', '2022-05-05 07:17:11');
INSERT INTO `sign_up` VALUES (38, '21121493037', '陈洁', '女', '3482782605', '信管本2101', '我更向往的是软件开发等计算机技术，同时对web前端，网络安全等保持热忱。目前没有参加过大赛，但是在努力学习idea和eclipse等语言工具的使用。有了解其他语言，例如go语言，C语言，并且有在哔哩哔哩上学习千锋教育的网课，也在学习blender,希望以后可以更好地去学习。上学期进入实验室时间不长，很喜欢实验室学习氛围，但不太好意思去学习。若有幸进入实验室，在网课期间，我可以全天在实验室学习；线下上课，我可以在晚自习后去学习。在班内无任职，在院学生会也没有任职，仅在国旗护卫队任职，会参加部分到梦空间活动。', 0, NULL, '2022-04-07 08:12:03', '2022-04-07 08:12:03');
INSERT INTO `sign_up` VALUES (39, '21121404073', '路欣悦', '女', '3307212408', '会计2101', '我们所处的时代是信息时代，我一直坚信信息技术是一件很迷人的一件艺术。我的目标是能够更进一步的了解这件艺术，在现实中能够自己开发出我想要的艺术，进而认识世界，改造世界。我能够在实验室的学习时长平均可以每天4小时', 0, NULL, '2022-04-07 08:23:47', '2022-04-07 08:23:47');
INSERT INTO `sign_up` VALUES (42, '21111493001', '邵立国', '男', '2036910627', '信管本2101', '', 0, NULL, '2022-04-07 10:03:29', '2022-04-07 10:03:29');
INSERT INTO `sign_up` VALUES (43, '21111404048', '孙伟泰', '男', '1783725955', '会计2101', '我是大一学习python才接触计算机的一个小萌新，因为学习python的过程中对计算机产生了很大的兴趣，当初报专业的时候也报了计算机的专业，但是几个学校都是没有过线，这个山理工的会计学也挡住了后面过了线的其他学校的计算机专业，所以我在这方面有遗憾，我的几个朋友在别的学校计算机专业学习，他们会自己编写答题软件之类，我也很是羡慕，想要尝试。我希望在实验室学到更多有关计算机的知识，虽然我现在只会python，但是我可以慢慢学习更多其它的知识。我平常的学习时间很多，加上在图书馆勤工助学，除了周一周三晚上，基本其他晚上都呆在图书馆。如果加入了实验室，我也会有很多时间去实验室学习，就不需要在三教找教室，也不用忍受图书馆安静没有插座的“痛苦”。我对这方面很感兴趣，也希望能学到更多这方面的知识，认识更多厉害的人。', 0, NULL, '2022-04-07 10:19:02', '2022-05-03 11:04:22');
INSERT INTO `sign_up` VALUES (44, '21111404046', '仲浩', '男', '1420537732', '会计', '', 0, NULL, '2022-04-07 10:19:33', '2022-04-07 10:19:33');
INSERT INTO `sign_up` VALUES (45, '2011140801000', '马元麒', '男', '111111111', '11111', '11111', 0, 'sssssssssssssssssssssssssssssssssssssss', '2022-04-07 11:23:22', '2022-04-11 13:31:29');
INSERT INTO `sign_up` VALUES (46, '20111408010001', '马元麒', '男', '206024536', '信管2002', '信管2002', 0, '哈哈哈', '2022-04-07 11:23:56', '2022-04-22 12:45:47');
INSERT INTO `sign_up` VALUES (47, '21121408024', '竺银莉', '女', '1074801461', '信管2102', '乐观开朗，善于探究，有热情，能坚持', 0, NULL, '2022-04-08 02:59:45', '2022-04-08 02:59:45');
INSERT INTO `sign_up` VALUES (48, '21111493023', '毛向阳', '男', '2948447382', '信管本2101', '', 0, NULL, '2022-04-08 08:23:44', '2022-04-08 08:23:44');
INSERT INTO `sign_up` VALUES (49, '21111493020', '李松林', '男', '481294671', '信管本2101', '', 0, NULL, '2022-04-08 08:27:57', '2022-04-08 08:27:57');
INSERT INTO `sign_up` VALUES (50, '21111493021', '李世龙', '男', '846029878', '信管本2101', '', 0, NULL, '2022-04-08 08:33:17', '2022-04-08 08:33:17');
INSERT INTO `sign_up` VALUES (51, '21111408052', '朱文强', '男', '1172170338', '信管2101班', '我本人爱好数学以及与数学有关的具有挑战性的科目，也对计算机编程有着浓厚的兴趣，我相信自己可以在实验室中提升自己的能力，在学有余力时拿出足够的时间放在实验室中去，去充实自己的生活，望实验室能够接纳不完美的我。', 0, NULL, '2022-04-15 08:35:07', '2022-04-15 08:35:07');
INSERT INTO `sign_up` VALUES (52, '20111408016', '马元麒', '男', '2804120991@qq.com', '信管2002', '阿士大夫给发上阿斯顿发刷大刷单', 0, NULL, '2022-04-22 12:47:29', '2022-05-02 12:38:04');
INSERT INTO `sign_up` VALUES (53, '21111408047', '丁翔宇', '男', '2517244837', '信管2101', '丁翔宇   男，共青团员，山东理工大学管理学院信息管理与信息系统2101班班长。\n本人性格乐观开朗，思维活跃，擅长社交、管理，既利于平时同老师交流沟通，又可与大家协作配合。爱好科技创新，可组织带领未来实验室的同学们利用已有技术能力参加到科创比赛中。并且作为未来的带班学长以及在21级信管系的影响力可充分对实验室宣传，利于实验室未来的发展壮大。“重振实验室荣光，我辈义不容辞！”\n曾拿过以下荣誉：\n第八届山东省大学生科技创新大赛校一等奖\n全国大学生创新方法应用大赛校三等奖\n青岛市青少年科技创新大赛青少年科技创新成果三等奖\n2019年青岛西海岸新区青少年科创大赛青少年科创成果一等奖\n2020年度青岛西海岸新区“优秀科技小创客”\n2019年青岛西海岸新区普通高中物理竞赛三等奖\n青岛西海岸新区“优秀共青团员”\n2013年黄岛区“优秀学生”\n青岛西海岸新区志高杯比赛一等奖', 0, NULL, '2022-04-29 15:27:11', '2022-05-03 05:07:33');
INSERT INTO `sign_up` VALUES (54, '21111408055', '陈令鑫', '男', '3250657035', '信管2101', '信管210班学委', 0, NULL, '2022-05-03 10:37:18', '2022-05-03 10:37:18');
INSERT INTO `sign_up` VALUES (55, '21121408038', '王新聪', '女', '2300577461', '信管2102班', '本人乐于探索和钻研，积极乐观，虽然目前编程能力有所欠缺，对技术方向还有些模糊，但希望并且有信心在后面的学习中有所提高，对人工智能、航天信息管理方面比较感兴趣，希望能在实验室中学习到更多。在去年的校级三位数字创新化大赛中获三等奖，本学期跟随学长学姐的队伍参与首届创祎杯全国大学生机械创新设计大赛获国家铜奖，同时在寒假社会实践中，积极配合社团队伍，取得了较为优异的成绩，具有极强的团队意识和合作精神。此外，我并未参加学生会组织，只任职于两个社团中，工作量并不繁重，若当日课程未满，无其他安排可在实验室学习2-4小时或更长时间。', 0, NULL, '2022-05-03 11:45:39', '2022-05-03 12:00:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_record
-- ----------------------------
INSERT INTO `sys_record` VALUES (1, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 12:17:38', 66);
INSERT INTO `sys_record` VALUES (2, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:17:40', 2625);
INSERT INTO `sys_record` VALUES (3, '用户登录', '/okr/common/login', NULL, '127.0.0.1', '2022-05-06 12:17:55', 29);
INSERT INTO `sys_record` VALUES (4, '获取路径', '/okr/menu/fetch', '18111493050', '127.0.0.1', '2022-05-06 12:17:56', 28);
INSERT INTO `sys_record` VALUES (5, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 12:17:56', 7);
INSERT INTO `sys_record` VALUES (6, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:17:57', 1231);
INSERT INTO `sys_record` VALUES (7, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:18:04', 1239);
INSERT INTO `sys_record` VALUES (8, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:21:25', 1245);
INSERT INTO `sys_record` VALUES (9, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:24:45', 1246);
INSERT INTO `sys_record` VALUES (10, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:28:05', 1233);
INSERT INTO `sys_record` VALUES (11, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:31:25', 1280);
INSERT INTO `sys_record` VALUES (12, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:35:28', 1224);
INSERT INTO `sys_record` VALUES (13, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:38:28', 1221);
INSERT INTO `sys_record` VALUES (14, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:41:25', 1202);
INSERT INTO `sys_record` VALUES (15, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:44:45', 1237);
INSERT INTO `sys_record` VALUES (16, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 12:44:53', 6);
INSERT INTO `sys_record` VALUES (17, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:44:54', 1342);
INSERT INTO `sys_record` VALUES (18, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:48:14', 1326);
INSERT INTO `sys_record` VALUES (19, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:51:34', 1276);
INSERT INTO `sys_record` VALUES (20, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:54:54', 1261);
INSERT INTO `sys_record` VALUES (21, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 12:58:14', 1252);
INSERT INTO `sys_record` VALUES (22, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:01:34', 1252);
INSERT INTO `sys_record` VALUES (23, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:05:28', 1203);
INSERT INTO `sys_record` VALUES (24, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:08:28', 1225);
INSERT INTO `sys_record` VALUES (25, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:12:28', 1221);
INSERT INTO `sys_record` VALUES (26, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:14:54', 1238);
INSERT INTO `sys_record` VALUES (27, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:18:16', 1962);
INSERT INTO `sys_record` VALUES (28, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:22:28', 1266);
INSERT INTO `sys_record` VALUES (29, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:25:28', 1279);
INSERT INTO `sys_record` VALUES (30, '用户登录', '/okr/common/login', NULL, '127.0.0.1', '2022-05-06 13:27:21', 17);
INSERT INTO `sys_record` VALUES (31, '获取路径', '/okr/menu/fetch', '18111493050', '127.0.0.1', '2022-05-06 13:27:21', 29);
INSERT INTO `sys_record` VALUES (32, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:27:22', 45);
INSERT INTO `sys_record` VALUES (33, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:27:23', 1278);
INSERT INTO `sys_record` VALUES (34, '查看博客', '/okr/blog/queryUserBlogList', '18111493050', '127.0.0.1', '2022-05-06 13:27:27', 349);
INSERT INTO `sys_record` VALUES (35, '用户登录', '/okr/common/login', NULL, '127.0.0.1', '2022-05-06 13:32:23', 530);
INSERT INTO `sys_record` VALUES (36, '获取路径', '/okr/menu/fetch', '18111493050', '127.0.0.1', '2022-05-06 13:32:39', 15746);
INSERT INTO `sys_record` VALUES (37, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:32:40', 53);
INSERT INTO `sys_record` VALUES (38, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:32:41', 1955);
INSERT INTO `sys_record` VALUES (39, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:32:56', 1282);
INSERT INTO `sys_record` VALUES (40, '查看博客', '/okr/blog/queryUserBlogList', '18111493050', '127.0.0.1', '2022-05-06 13:32:56', 195);
INSERT INTO `sys_record` VALUES (41, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:35:23', 8);
INSERT INTO `sys_record` VALUES (42, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:35:25', 1259);
INSERT INTO `sys_record` VALUES (43, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:36:17', 3);
INSERT INTO `sys_record` VALUES (44, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:36:20', 1245);
INSERT INTO `sys_record` VALUES (45, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:36:21', 2);
INSERT INTO `sys_record` VALUES (46, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:36:22', 1231);
INSERT INTO `sys_record` VALUES (47, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:36:25', 1216);
INSERT INTO `sys_record` VALUES (48, '用户登录', '/okr/common/login', NULL, '127.0.0.1', '2022-05-06 13:41:21', 4);
INSERT INTO `sys_record` VALUES (49, '获取路径', '/okr/menu/fetch', '18111493050', '127.0.0.1', '2022-05-06 13:41:21', 3);
INSERT INTO `sys_record` VALUES (50, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:41:21', 6);
INSERT INTO `sys_record` VALUES (51, '服务器监控', '/okr/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 13:41:23', 1241);
INSERT INTO `sys_record` VALUES (52, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:43:09', 6);
INSERT INTO `sys_record` VALUES (53, '获取用户信息', '/okr/user/query', '18111493050', '127.0.0.1', '2022-05-06 13:43:57', 4);
INSERT INTO `sys_record` VALUES (54, '查看博客', '/okr/blog/queryUserBlogList', '18111493050', '127.0.0.1', '2022-05-06 13:44:07', 8);
INSERT INTO `sys_record` VALUES (55, '获取用户信息', '/blog/user/query', '18111493050', '127.0.0.1', '2022-05-06 14:25:15', 63);
INSERT INTO `sys_record` VALUES (56, '服务器监控', '/blog/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 14:25:17', 2081);
INSERT INTO `sys_record` VALUES (57, '查询用户列表', '/blog/user/queryList', '18111493050', '127.0.0.1', '2022-05-06 14:25:35', 222);
INSERT INTO `sys_record` VALUES (58, '模糊查询标签', '/blog/enum/tag', '18111493050', '127.0.0.1', '2022-05-06 14:25:37', 43);
INSERT INTO `sys_record` VALUES (59, '书籍列表', '/blog/book/queryList', '18111493050', '127.0.0.1', '2022-05-06 14:25:37', 83);
INSERT INTO `sys_record` VALUES (60, '查询借阅记录', '/blog/bookUser/query', '18111493050', '127.0.0.1', '2022-05-06 14:25:38', 63);
INSERT INTO `sys_record` VALUES (61, '钥匙列表', '/blog/key/query', '18111493050', '127.0.0.1', '2022-05-06 14:25:39', 35);
INSERT INTO `sys_record` VALUES (62, '钥匙记录列表', '/blog/keyUser/query', '18111493050', '127.0.0.1', '2022-05-06 14:25:40', 48);
INSERT INTO `sys_record` VALUES (63, '查看博客', '/blog/blog/queryUserBlogList', '18111493050', '127.0.0.1', '2022-05-06 14:25:41', 106);
INSERT INTO `sys_record` VALUES (64, '用户登录', '/blog/common/login', NULL, '127.0.0.1', '2022-05-06 14:26:27', 19);
INSERT INTO `sys_record` VALUES (65, '获取路径', '/blog/menu/fetch', '18111493050', '127.0.0.1', '2022-05-06 14:26:28', 65);
INSERT INTO `sys_record` VALUES (66, '获取用户信息', '/blog/user/query', '18111493050', '127.0.0.1', '2022-05-06 14:26:28', 7);
INSERT INTO `sys_record` VALUES (67, '模糊查询标签', '/blog/enum/tag', '18111493050', '127.0.0.1', '2022-05-06 14:26:29', 1);
INSERT INTO `sys_record` VALUES (68, '服务器监控', '/blog/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 14:26:30', 1378);
INSERT INTO `sys_record` VALUES (69, '查看博客', '/blog/blog/queryList', '18111493050', '127.0.0.1', '2022-05-06 14:26:30', 81);
INSERT INTO `sys_record` VALUES (70, '查看博客', '/blog/blog/queryUserBlogList', '18111493050', '127.0.0.1', '2022-05-06 14:26:32', 8);
INSERT INTO `sys_record` VALUES (71, '查询用户列表', '/blog/user/queryList', '18111493050', '127.0.0.1', '2022-05-06 14:26:41', 35);
INSERT INTO `sys_record` VALUES (72, '服务器监控', '/blog/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 14:26:41', 1393);
INSERT INTO `sys_record` VALUES (73, '获取用户信息', '/blog/user/query', '18111493050', '127.0.0.1', '2022-05-06 14:36:26', 89);
INSERT INTO `sys_record` VALUES (74, '服务器监控', '/blog/monitor/server', '18111493050', '127.0.0.1', '2022-05-06 14:36:28', 2010);
INSERT INTO `sys_record` VALUES (75, '获取报名记录', '/blog/signup/queryList', '18111493050', '127.0.0.1', '2022-05-06 14:36:31', 147);

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
INSERT INTO `tag` VALUES (11, 'php是最好的语言', 5, 0);
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
) ENGINE = InnoDB AUTO_INCREMENT = 1351 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1348, 'T1', 'csdn爬虫', 'com.itlab.blog.job.testTask1', '测试cdsn爬虫');
INSERT INTO `task` VALUES (1349, 'T2', '二号测试任务', 'com.itlab.blog.job.testTask2', '测试用的,输出名字');
INSERT INTO `task` VALUES (1350, 'T3', '三号测试任务', 'com.itlab.blog.job.testTask3', '测试用的,输出数字');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `user_entity` VALUES (20, '18111493050', 'e10adc3949ba59abbe56e057f20f883e', NULL, '2021-12-15 00:26:02', 0);
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
INSERT INTO `user_info` VALUES (23, 'test', '测试用户', NULL, '测试班级', '测试qq', '测试手机', '123', '测试用，( ╯□╰ )', 0, '2021-12-15 00:33:15', '2022-04-11 17:50:13', 0);
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
INSERT INTO `user_role` VALUES (17, 23, 2, '2100-01-01 00:00:00', 0);
INSERT INTO `user_role` VALUES (18, 24, 3, '2100-01-01 00:00:00', 0);

SET FOREIGN_KEY_CHECKS = 1;
