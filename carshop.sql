-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-09-29 08:38:26
-- 服务器版本： 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `cs_admin`
--

CREATE TABLE IF NOT EXISTS `cs_admin` (
  `id` mediumint(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` char(32) NOT NULL,
  `roleid` mediumint(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_admin`
--

INSERT INTO `cs_admin` (`id`, `username`, `password`, `roleid`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(13, 'guanliyuan', 'e10adc3949ba59abbe56e057f20f883e', 1),
(12, 'tp', 'e10adc3949ba59abbe56e057f20f883e', 8),
(11, 'tongpan', 'e10adc3949ba59abbe56e057f20f883e', 7);

-- --------------------------------------------------------

--
-- 表的结构 `cs_article`
--

CREATE TABLE IF NOT EXISTS `cs_article` (
  `id` int(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  `atype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:列表 1：车型 2：招聘',
  `rizu` mediumint(6) NOT NULL COMMENT '日租价格',
  `num` varchar(3) NOT NULL COMMENT '招聘人数',
  `author` varchar(20) NOT NULL,
  `pic` varchar(60) NOT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `rem` tinyint(1) NOT NULL DEFAULT '0',
  `cateid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_article`
--

INSERT INTO `cs_article` (`id`, `title`, `atype`, `rizu`, `num`, `author`, `pic`, `content`, `keywords`, `des`, `rem`, `cateid`, `time`) VALUES
(1, '1', 0, 0, '', '2', './Public/Uploads/2016-04-07/570650c43db3b.jpg', '&lt;p&gt;123456778&lt;br/&gt;&lt;/p&gt;', '3', '4', 1, 75, 1461511847),
(12, '测试新闻资讯1', 0, 0, '', '', '', '', '', '', 0, 69, 1461727928),
(13, '测试新闻资讯2', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727944),
(7, '测试文章2', 1, 1000, '', '', '', '&lt;p&gt;测试文章2测试文章2测试文章2&lt;/p&gt;', '', '', 0, 68, 1461732611),
(8, '测试文章5', 0, 0, '', '', '', '', '', '', 0, 69, 1461511830),
(9, '测试文章6', 0, 0, '', '', './Public/Uploads/2016-05-03/5728bb5fc39d9.jpg', '&lt;p&gt;测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6测试文章6&lt;/p&gt;', '', '', 0, 70, 1462287199),
(10, '车型展示1', 1, 100, '', '1', '', '&lt;p&gt;车型展示1车型展示1车型展示1&lt;br/&gt;&lt;/p&gt;', '2', '3', 1, 68, 1461909821),
(11, 'UI设计师1', 2, 0, '21', '', '', '&lt;p&gt;1、收集和分析用户界面需求；&lt;br/&gt;2、结合用户体验及技术可行性确定线框图；&lt;br/&gt;3、将线框图设计为平面效果图；&lt;br/&gt;4、跟踪开发和测试；&lt;br/&gt;5、根据数据分析，对页面进行优化。111&lt;/p&gt;', '', '', 0, 27, 1460435581),
(14, '测试新闻资讯3', 0, 0, '', '', '', '&lt;p&gt;测试新闻资讯1测试新闻资讯1测试新闻资讯1测试新闻资讯1&lt;/p&gt;', '', '', 0, 69, 1461727959),
(15, '测试车辆展示1', 0, 0, '', '', './Public/Uploads/2016-04-27/572043b5b427e.jpg', '&lt;p&gt;测试车辆展示1测试车辆展示1测试车辆展示1测试车辆展示1&lt;/p&gt;', '', '', 0, 68, 1461732277),
(16, '测试车辆展示2', 1, 100, '', '', './Public/Uploads/2016-04-27/5720440116c2c.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 0, 68, 1461732353),
(17, '测试车辆展示3', 1, 234, '', '', './Public/Uploads/2016-04-27/5720442390d32.jpg', '&lt;p&gt;测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3测试车辆展示3&lt;/p&gt;', '', '', 1, 68, 1461732387),
(18, '测试荣誉1', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e25f1d53e.jpg', '&lt;p&gt;测试荣誉1测试荣誉1测试荣誉1&lt;/p&gt;', '', '', 0, 80, 1461772895),
(19, '测试荣誉2', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e284db8d7.jpg', '&lt;p&gt;测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2测试荣誉2&lt;/p&gt;', '', '', 0, 80, 1461772932),
(20, '荣誉3', 0, 0, '', '', './Public/Uploads/2016-04-28/5720e29cd839b.jpg', '&lt;p&gt;荣誉3荣誉3荣誉3荣誉3&lt;/p&gt;', '', '', 0, 80, 1461772956),
(21, '招聘设计师', 2, 0, '3', '', '', '', '', '01、收集和分析用户界面需求；&lt;br&gt;\r\n02、结合用户体验及技术可行性确定线框图；&lt;br&gt;\r\n03、将线框图设计为平面效果图；&lt;br&gt;\r\n04、跟踪开发和测试；&lt;br&gt;\r\n05、根据数据分析，对页面进行优化。&lt;br&gt;', 0, 85, 1461773834),
(22, 'php工程师', 2, 0, '10', '', '', '', '', '1、收集和分析用户界面需求1；\r\n2、结合用户体验及技术可行性确定线框图2；\r\n3、将线框图设计为平面效果图3；\r\n4、跟踪开发和测试4；\r\n5、根据数据分析，对页面进行优化5。', 0, 85, 1461773597),
(23, '招聘前端', 2, 0, '4', '', '', '', '', '1、收集和分析用户界面需求；\r\n2、结合用户体验及技术可行性确定线框图；\r\n3、将线框图设计为平面效果图；\r\n4、跟踪开发和测试；\r\n5、根据数据分析，对页面进行优化。', 0, 85, 1461773624),
(24, '费用说明测试文章1', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章1费用说明测试文章1&lt;/p&gt;', '', '', 0, 91, 1462463649),
(25, '费用说明测试文章2', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章2费用说明测试文章2费用说明测试文章2&lt;/p&gt;', '', '', 0, 91, 1462463677),
(26, '费用说明测试文章3', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3费用说明测试文章3&lt;/p&gt;', '', '', 0, 91, 1462463699),
(27, '费用说明测试文章4', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章4费用说明测试文章4费用说明测试文章4费用说明测试文章4&lt;/p&gt;', '', '', 0, 91, 1462463716),
(28, '费用说明测试文章5', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5费用说明测试文章5&lt;/p&gt;', '', '', 0, 91, 1462463744),
(29, '费用说明测试文章6', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6费用说明测试文章6&lt;/p&gt;', '', '', 0, 91, 1462463765),
(30, '费用说明测试文章7', 0, 0, '', '', '', '&lt;p&gt;费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7费用说明测试文章7&lt;/p&gt;', '', '', 0, 91, 1462463783),
(31, '车辆展示1', 0, 0, '', '', './Public/Uploads/2016-05-06/572c25f280ede.jpg', '&lt;p&gt;车辆展示1车辆展示1车辆展示1车辆展示1车辆展示1&lt;/p&gt;', '', '', 0, 93, 1462511090),
(32, '车辆展示2', 0, 0, '', '', './Public/Uploads/2016-05-06/572c260d27369.jpg', '&lt;p&gt;车辆展示2车辆展示2车辆展示2车辆展示2&lt;/p&gt;', '', '', 0, 93, 1462511117),
(33, '车辆展示3', 0, 0, '', '', './Public/Uploads/2016-05-06/572c262a12607.jpg', '&lt;p&gt;车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511146),
(34, '车辆展示4', 0, 0, '', '', './Public/Uploads/2016-05-06/572c2644de5d6.jpg', '&lt;p&gt;车辆展示3车辆展示3车辆展示3&lt;/p&gt;', '', '', 0, 93, 1462511172),
(35, '车辆展示5', 0, 0, '', '', './Public/Uploads/2016-05-06/572c265c62ab5.jpg', '&lt;p&gt;车辆展示5车辆展示5车辆展示5车辆展示5车辆展示5&lt;/p&gt;', '', '', 0, 93, 1462511196);

-- --------------------------------------------------------

--
-- 表的结构 `cs_attribute`
--

CREATE TABLE IF NOT EXISTS `cs_attribute` (
  `attr_id` smallint(5) unsigned NOT NULL,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `attr_name` varchar(60) NOT NULL DEFAULT '',
  `attr_input_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `attr_values` text NOT NULL,
  `attr_index` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `is_linked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `attr_group` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_attribute`
--

INSERT INTO `cs_attribute` (`attr_id`, `cat_id`, `attr_name`, `attr_input_type`, `attr_type`, `attr_values`, `attr_index`, `sort_order`, `is_linked`, `attr_group`) VALUES
(1, 1, '作者', 0, 0, '', 0, 0, 0, 0),
(2, 1, '出版社', 0, 0, '', 0, 0, 0, 0),
(3, 1, '图书书号/ISBN', 0, 0, '', 0, 0, 0, 0),
(4, 1, '出版日期', 0, 0, '', 0, 0, 0, 0),
(5, 1, '开本', 0, 0, '', 0, 0, 0, 0),
(6, 1, '图书页数', 0, 0, '', 0, 0, 0, 0),
(7, 1, '图书装订', 1, 0, '平装\r\n黑白', 0, 0, 0, 0),
(8, 1, '图书规格', 0, 0, '', 0, 0, 0, 0),
(9, 1, '版次', 0, 0, '', 0, 0, 0, 0),
(10, 1, '印张', 0, 0, '', 0, 0, 0, 0),
(11, 1, '字数', 0, 0, '', 0, 0, 0, 0),
(12, 1, '所属分类', 0, 0, '', 0, 0, 0, 0),
(13, 2, '中文片名', 0, 0, '', 0, 0, 0, 0),
(14, 2, '英文片名', 0, 0, '', 0, 0, 0, 0),
(15, 2, '商品别名', 0, 0, '', 0, 0, 0, 0),
(16, 2, '介质/格式', 1, 0, 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD\r\nCD\r\nTAPE\r\nLP', 0, 0, 0, 0),
(17, 2, '片装数', 0, 0, '', 0, 0, 0, 0),
(18, 2, '国家地区', 0, 0, '', 0, 0, 0, 0),
(19, 2, '语种', 1, 0, '中文\r\n英文\r\n法文\r\n西班牙文', 0, 0, 0, 0),
(20, 2, '导演/指挥', 0, 0, '', 0, 0, 0, 0),
(21, 2, '主唱', 0, 0, '', 0, 0, 0, 0),
(22, 2, '所属类别', 1, 0, '古典\r\n流行\r\n摇滚\r\n乡村\r\n民谣\r\n爵士\r\n蓝调\r\n电子\r\n舞曲\r\n国乐\r\n民族\r\n怀旧\r\n经典\r\n人声\r\n合唱\r\n发烧\r\n试音\r\n儿童\r\n胎教\r\n轻音乐\r\n世界音乐\r\n庆典音乐\r\n影视音乐\r\n新世纪音乐\r\n大自然音乐', 0, 0, 0, 0),
(23, 2, '长度', 0, 0, '', 0, 0, 0, 0),
(24, 2, '歌词', 1, 0, '有\r\n无', 0, 0, 0, 0),
(25, 2, '碟片代码', 0, 0, '', 0, 0, 0, 0),
(26, 2, 'ISRC码', 0, 0, '', 0, 0, 0, 0),
(27, 2, '发行公司', 0, 0, '', 0, 0, 0, 0),
(28, 2, '出版', 0, 0, '', 0, 0, 0, 0),
(29, 2, '出版号', 0, 0, '', 0, 0, 0, 0),
(30, 2, '引进号', 0, 0, '', 0, 0, 0, 0),
(31, 2, '版权号', 0, 0, '', 0, 0, 0, 0),
(32, 3, '中文片名', 0, 0, '', 0, 0, 0, 0),
(33, 3, '英文片名', 0, 0, '', 0, 0, 0, 0),
(34, 3, '商品别名', 0, 0, '', 0, 0, 0, 0),
(35, 3, '介质/格式', 1, 0, 'HDCD\r\nDTS\r\nDVD\r\nDVD9\r\nVCD', 0, 0, 0, 0),
(36, 3, '碟片类型', 1, 0, '单面\r\n双层', 0, 0, 0, 0),
(37, 3, '片装数', 0, 0, '', 0, 0, 0, 0),
(38, 3, '国家地区', 0, 0, '', 0, 0, 0, 0),
(39, 3, '语种/配音', 1, 0, '中文\r\n英文\r\n法文\r\n西班牙文', 0, 0, 0, 0),
(40, 3, '字幕', 0, 0, '', 0, 0, 0, 0),
(41, 3, '色彩', 0, 0, '', 0, 0, 0, 0),
(42, 3, '中文字幕', 1, 0, '有\r\n无', 0, 0, 0, 0),
(43, 3, '导演', 0, 0, '', 0, 0, 0, 0),
(44, 3, '表演者', 0, 0, '', 0, 0, 0, 0),
(45, 3, '所属类别', 1, 0, '爱情\r\n偶像\r\n生活\r\n社会\r\n科幻\r\n神话\r\n武侠\r\n动作\r\n惊险\r\n恐怖\r\n传奇\r\n人物\r\n侦探\r\n警匪\r\n历史\r\n军事\r\n戏剧\r\n舞台\r\n经典\r\n名著\r\n喜剧\r\n情景\r\n动漫\r\n卡通\r\n儿童\r\n伦理激情', 0, 0, 0, 0),
(46, 3, '年份', 0, 0, '', 0, 0, 0, 0),
(47, 3, '音频格式', 0, 0, '', 0, 0, 0, 0),
(48, 3, '区码', 0, 0, '', 0, 0, 0, 0),
(49, 3, '碟片代码', 0, 0, '', 0, 0, 0, 0),
(50, 3, 'ISRC码', 0, 0, '', 0, 0, 0, 0),
(51, 3, '发行公司', 0, 0, '', 0, 0, 0, 0),
(52, 3, '出版 ', 0, 0, '', 0, 0, 0, 0),
(53, 3, '出版号', 0, 0, '', 0, 0, 0, 0),
(54, 3, '引进号', 0, 0, '', 0, 0, 0, 0),
(55, 3, '版权号', 0, 0, '', 0, 0, 0, 0),
(56, 4, '网络制式', 0, 0, '', 0, 0, 0, 0),
(57, 4, '支持频率/网络频率', 0, 0, '', 0, 0, 0, 0),
(58, 4, '尺寸体积', 1, 0, '   ', 0, 0, 0, 0),
(59, 4, '外观样式/手机类型', 1, 0, '翻盖\r\n滑盖\r\n直板\r\n折叠\r\n手写', 0, 0, 0, 0),
(60, 4, '主屏参数/内屏参数', 0, 0, '', 0, 0, 0, 0),
(61, 4, '副屏参数/外屏参数', 0, 0, '', 0, 0, 0, 0),
(62, 4, '清晰度', 0, 0, '', 0, 0, 0, 0),
(63, 4, '色数/灰度', 1, 0, '   ', 0, 0, 0, 0),
(64, 4, '长度', 0, 0, '', 0, 0, 0, 0),
(65, 4, '宽度', 0, 0, '', 0, 0, 0, 0),
(66, 4, '厚度', 0, 0, '', 0, 0, 0, 0),
(67, 4, '屏幕材质', 0, 0, '', 0, 0, 0, 0),
(68, 4, '内存容量', 0, 0, '', 0, 0, 0, 0),
(69, 4, '操作系统', 0, 0, '', 0, 0, 0, 0),
(70, 4, '通话时间', 0, 0, '', 0, 0, 0, 0),
(71, 4, '待机时间', 0, 0, '', 0, 0, 0, 0),
(72, 4, '标准配置', 0, 0, '', 0, 0, 0, 0),
(73, 4, 'WAP上网', 0, 0, '', 0, 0, 0, 0),
(74, 4, '数据业务', 0, 0, '', 0, 0, 0, 0),
(75, 4, '天线位置', 1, 0, '内置\r\n外置', 0, 0, 0, 0),
(76, 4, '随机配件', 0, 0, '', 0, 0, 0, 0),
(77, 4, '铃声', 0, 0, '', 0, 0, 0, 0),
(78, 4, '摄像头', 0, 0, '', 0, 0, 0, 0),
(79, 4, '彩信/彩e', 1, 0, '支持\r\n不支持', 0, 0, 0, 0),
(80, 4, '红外/蓝牙', 0, 0, '', 0, 0, 0, 0),
(81, 4, '价格等级', 1, 0, '高价机\r\n中价机\r\n低价机', 0, 0, 0, 0),
(82, 5, '型号', 0, 0, '', 0, 0, 0, 0),
(83, 5, '详细规格', 0, 0, '', 0, 0, 0, 0),
(84, 5, '笔记本尺寸', 0, 0, '', 0, 0, 0, 0),
(85, 5, '处理器类型', 0, 0, '', 0, 0, 0, 0),
(86, 5, '处理器最高主频', 0, 0, '', 0, 0, 0, 0),
(87, 5, '二级缓存', 0, 0, '', 0, 0, 0, 0),
(88, 5, '系统总线', 0, 0, '', 0, 0, 0, 0),
(89, 5, '主板芯片组', 0, 0, '', 0, 0, 0, 0),
(90, 5, '内存容量', 0, 0, '', 0, 0, 0, 0),
(91, 5, '内存类型', 0, 0, '', 0, 0, 0, 0),
(92, 5, '硬盘', 0, 0, '', 0, 0, 0, 0),
(93, 5, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0),
(94, 5, '显示芯片', 0, 0, '', 0, 0, 0, 0),
(95, 5, '标称频率', 0, 0, '', 0, 0, 0, 0),
(96, 5, '显卡显存', 0, 0, '', 0, 0, 0, 0),
(97, 5, '显卡类型', 0, 0, '', 0, 0, 0, 0),
(98, 5, '光驱类型', 0, 0, '', 0, 0, 0, 0),
(99, 5, '电池容量', 0, 0, '', 0, 0, 0, 0),
(100, 5, '其他配置', 0, 0, '', 0, 0, 0, 0),
(101, 6, '类型', 0, 0, '', 0, 0, 0, 0),
(102, 6, '最大像素/总像素  ', 0, 0, '', 0, 0, 0, 0),
(103, 6, '有效像素', 1, 0, '  ', 0, 0, 0, 0),
(104, 6, '光学变焦倍数', 0, 0, '', 0, 0, 0, 0),
(105, 6, '数字变焦倍数', 0, 0, '', 0, 0, 0, 0),
(106, 6, '操作模式', 0, 0, '', 0, 0, 0, 0),
(107, 6, '显示屏类型', 0, 0, '', 0, 0, 0, 0),
(108, 6, '显示屏尺寸', 0, 0, '', 0, 0, 0, 0),
(109, 6, '感光器件', 0, 0, '', 0, 0, 0, 0),
(110, 6, '感光器件尺寸', 0, 0, '', 0, 0, 0, 0),
(111, 6, '最高分辨率', 0, 0, '', 0, 0, 0, 0),
(112, 6, '图像分辨率', 0, 0, '', 0, 0, 0, 0),
(113, 6, '传感器类型', 0, 0, '', 0, 0, 0, 0),
(114, 6, '传感器尺寸', 0, 0, '', 0, 0, 0, 0),
(115, 6, '镜头', 0, 0, '', 0, 0, 0, 0),
(116, 6, '光圈', 0, 0, '', 0, 0, 0, 0),
(117, 6, '焦距', 0, 0, '', 0, 0, 0, 0),
(118, 6, '旋转液晶屏', 1, 0, '支持\r\n不支持', 0, 0, 0, 0),
(119, 6, '存储介质', 0, 0, '', 0, 0, 0, 0),
(120, 6, '存储卡', 1, 0, '  记录媒体\r\n存储卡容量', 0, 0, 0, 0),
(121, 6, '影像格式', 1, 0, '    静像\r\n动画', 0, 0, 0, 0),
(122, 6, '曝光控制', 0, 0, '', 0, 0, 0, 0),
(123, 6, '曝光模式', 0, 0, '', 0, 0, 0, 0),
(124, 6, '曝光补偿', 0, 0, '', 0, 0, 0, 0),
(125, 6, '白平衡', 0, 0, '', 0, 0, 0, 0),
(126, 6, '连拍', 0, 0, '', 0, 0, 0, 0),
(127, 6, '快门速度', 0, 0, '', 0, 0, 0, 0),
(128, 6, '闪光灯', 1, 0, '内置\r\n外置', 0, 0, 0, 0),
(129, 6, '拍摄范围', 1, 0, '  ', 0, 0, 0, 0),
(130, 6, '自拍定时器', 0, 0, '', 0, 0, 0, 0),
(131, 6, 'ISO感光度', 0, 0, '', 0, 0, 0, 0),
(132, 6, '测光模式', 0, 0, '', 0, 0, 0, 0),
(133, 6, '场景模式', 0, 0, '', 0, 0, 0, 0),
(134, 6, '短片拍摄', 0, 0, '', 0, 0, 0, 0),
(135, 6, '外接接口', 0, 0, '', 0, 0, 0, 0),
(136, 6, '电源', 0, 0, '', 0, 0, 0, 0),
(137, 6, '电池使用时间', 0, 0, '', 0, 0, 0, 0),
(138, 6, '外形尺寸', 0, 0, '', 0, 0, 0, 0),
(139, 6, '标配软件', 0, 0, '', 0, 0, 0, 0),
(140, 6, '标准配件', 0, 0, '', 0, 0, 0, 0),
(141, 6, '兼容操作系统', 0, 0, '', 0, 0, 0, 0),
(142, 7, '编号', 0, 0, '', 0, 0, 0, 0),
(143, 7, '类型', 0, 0, '', 0, 0, 0, 0),
(144, 7, '外型尺寸', 0, 0, '', 0, 0, 0, 0),
(145, 7, '最大像素数', 0, 0, '', 0, 0, 0, 0),
(146, 7, '光学变焦倍数', 0, 0, '', 0, 0, 0, 0),
(147, 7, '数字变焦倍数', 0, 0, '', 0, 0, 0, 0),
(148, 7, '显示屏尺寸及类型', 0, 0, '', 0, 0, 0, 0),
(149, 7, '感光器件', 0, 0, '', 0, 0, 0, 0),
(150, 7, '感光器件尺寸', 0, 0, '', 0, 0, 0, 0),
(151, 7, '感光器件数量', 0, 0, '', 0, 0, 0, 0),
(152, 7, '像素范围', 0, 0, '', 0, 0, 0, 0),
(153, 7, '传感器数量', 0, 0, '', 0, 0, 0, 0),
(154, 7, '传感器尺寸', 0, 0, '', 0, 0, 0, 0),
(155, 7, '水平清晰度', 0, 0, '', 0, 0, 0, 0),
(156, 7, '取景器', 0, 0, '', 0, 0, 0, 0),
(157, 7, '数码效果', 0, 0, '', 0, 0, 0, 0),
(158, 7, '镜头性能', 0, 0, '', 0, 0, 0, 0),
(159, 7, '对焦方式', 0, 0, '', 0, 0, 0, 0),
(160, 7, '曝光控制', 0, 0, '', 0, 0, 0, 0),
(161, 7, '其他接口', 0, 0, '', 0, 0, 0, 0),
(162, 7, '随机存储', 0, 0, '', 0, 0, 0, 0),
(163, 7, '电池类型', 0, 0, '', 0, 0, 0, 0),
(164, 7, '电池供电时间', 0, 0, '', 0, 0, 0, 0),
(165, 8, '产地', 0, 0, '', 0, 0, 0, 0),
(166, 8, '产品规格/容量', 0, 0, '', 0, 0, 0, 0),
(167, 8, '主要原料', 0, 0, '', 0, 0, 0, 0),
(168, 8, '所属类别', 1, 0, '彩妆\r\n化妆工具\r\n护肤品\r\n香水', 0, 0, 0, 0),
(169, 8, '使用部位', 0, 0, '', 0, 0, 0, 0),
(170, 8, '适合肤质', 1, 0, '油性\r\n中性\r\n干性', 0, 0, 0, 0),
(171, 8, '适用人群', 1, 0, '女性\r\n男性', 0, 0, 0, 0),
(172, 9, '上市日期', 1, 0, '2008年01月\r\n2008年02月\r\n2008年03月\r\n2008年04月\r\n2008年05月\r\n2008年06月\r\n2008年07月\r\n2008年08月\r\n2008年09月\r\n2008年10月\r\n2008年11月\r\n2008年12月\r\n2007年01月\r\n2007年02月\r\n2007年03月\r\n2007年04月\r\n2007年05月\r\n2007年06月\r\n2007年07月\r\n2007年08月\r\n2007年09月\r\n2007年10月\r\n2007年11月\r\n2007年12月', 1, 0, 0, 0),
(173, 9, '手机制式', 1, 0, 'GSM,850,900,1800,1900\r\nGSM,900,1800,1900,2100\r\nCDMA\r\n双模（GSM,900,1800,CDMA 1X）\r\n3G(GSM,900,1800,1900,TD-SCDMA )', 1, 1, 1, 0),
(174, 9, '理论通话时间', 0, 0, '', 0, 2, 0, 0),
(175, 9, '理论待机时间', 0, 0, '', 0, 3, 0, 0),
(176, 9, '铃声', 0, 0, '', 0, 4, 0, 0),
(177, 9, '铃声格式', 0, 0, '', 0, 5, 0, 0),
(178, 9, '外观样式', 1, 0, '翻盖\r\n滑盖\r\n直板\r\n折叠', 1, 6, 1, 0),
(179, 9, '中文短消息', 0, 0, '', 0, 7, 0, 0),
(180, 9, '存储卡格式', 0, 0, '', 0, 0, 0, 0),
(181, 9, '内存容量', 0, 0, '', 2, 0, 0, 0),
(182, 9, '操作系统', 0, 0, '', 0, 0, 0, 0),
(183, 9, 'K-JAVA', 0, 0, '', 0, 0, 0, 0),
(184, 9, '尺寸体积', 0, 0, '', 0, 0, 0, 0),
(185, 9, '颜色', 1, 1, '黑色\r\n白色\r\n蓝色\r\n金色\r\n粉色\r\n银色\r\n灰色\r\n深李色\r\n黑红色\r\n黑蓝色\r\n白紫色', 1, 0, 0, 0),
(186, 9, '屏幕颜色', 1, 0, '1600万\r\n262144万', 1, 0, 1, 1),
(187, 9, '屏幕材质', 1, 0, 'TFT', 0, 0, 0, 1),
(188, 9, '屏幕分辨率', 1, 0, '320×240 像素\r\n240×400 像素\r\n240×320 像素\r\n176x220 像素', 1, 0, 0, 1),
(189, 9, '屏幕大小', 0, 0, '', 0, 0, 0, 1),
(190, 9, '中文输入法', 0, 0, '', 0, 0, 0, 2),
(191, 9, '情景模式', 0, 0, '', 0, 0, 0, 2),
(192, 9, '网络链接', 0, 0, '', 0, 0, 0, 2),
(193, 9, '蓝牙接口', 0, 0, '', 0, 0, 0, 0),
(194, 9, '数据线接口', 0, 0, '', 0, 0, 0, 2),
(195, 9, '电子邮件', 0, 0, '', 0, 0, 0, 2),
(196, 9, '闹钟', 0, 0, '', 0, 35, 0, 4),
(197, 9, '办公功能', 0, 0, '', 0, 0, 0, 4),
(198, 9, '数码相机', 0, 0, '', 1, 0, 0, 3),
(199, 9, '像素', 0, 0, '', 0, 0, 0, 3),
(200, 9, '传感器', 0, 0, '', 0, 0, 0, 0),
(201, 9, '变焦模式', 0, 0, '', 0, 0, 0, 3),
(202, 9, '视频拍摄', 0, 0, '', 0, 0, 0, 3),
(203, 9, 'MP3播放器', 0, 0, '', 0, 0, 0, 3),
(204, 9, '视频播放', 0, 0, '', 0, 0, 0, 3),
(205, 9, 'CPU频率', 0, 0, '', 0, 0, 0, 0),
(206, 9, '收音机', 0, 0, '', 0, 0, 0, 3),
(207, 9, '耳机接口', 0, 0, '', 0, 0, 0, 3),
(208, 9, '闪光灯', 0, 0, '', 0, 0, 0, 3),
(209, 9, '浏览器', 0, 0, '', 0, 0, 0, 2),
(210, 9, '配件', 1, 2, '线控耳机\r\n蓝牙耳机\r\n数据线', 0, 0, 0, 0),
(211, 10, '特色', 0, 0, '', 0, 0, 1, 0),
(212, 10, '包装规格', 0, 0, '', 0, 0, 1, 0),
(213, 10, '菜品产地', 0, 0, '', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_brand`
--

CREATE TABLE IF NOT EXISTS `cs_brand` (
  `brand_id` smallint(5) unsigned NOT NULL,
  `brand_name` varchar(60) NOT NULL DEFAULT '',
  `brand_logo` varchar(80) NOT NULL DEFAULT '',
  `brand_desc` text NOT NULL,
  `site_url` varchar(255) NOT NULL DEFAULT '',
  `sort_order` tinyint(3) unsigned NOT NULL DEFAULT '50',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_cate`
--

CREATE TABLE IF NOT EXISTS `cs_cate` (
  `id` mediumint(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是pc端栏目',
  `class` tinyint(1) NOT NULL DEFAULT '1' COMMENT '//栏目级别',
  `sort` mediumint(5) DEFAULT '50',
  `pic` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `parentid` mediumint(5) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_cate`
--

INSERT INTO `cs_cate` (`id`, `name`, `type`, `pc`, `class`, `sort`, `pic`, `content`, `keywords`, `des`, `parentid`) VALUES
(67, '关于我们', 2, 1, 1, 1, NULL, '&lt;p&gt;关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们&lt;/p&gt;&lt;p&gt;&lt;img alt=&quot;3235ac20f8f58f91831c93c0580e7a3a.jpg&quot; src=&quot;/ueditor/php/upload/image/20160428/1461858352351741.jpg&quot; title=&quot;1461858352351741.jpg&quot;/&gt;&lt;/p&gt;', '', '', 0),
(68, '车辆展示', 5, 1, 1, 2, NULL, '', '', '', 0),
(69, '新闻资讯', 1, 1, 1, 3, NULL, '', '', '', 0),
(70, '主要车型', 5, 1, 1, 4, NULL, '', '', '', 0),
(71, '热门车型', 5, 1, 2, 3, NULL, '', '', '', 68),
(72, '豪华车型', 5, 1, 2, 6, NULL, '', '', '', 68),
(73, '小车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(74, '紧凑车型', 5, 1, 2, 50, NULL, '', '', '', 68),
(75, '大众', 5, 1, 3, 4, NULL, '', '', '', 71),
(76, '寒假班', 5, 1, 3, 5, NULL, '', '', '', 71),
(77, '宝马', 5, 1, 3, 7, NULL, '', '', '', 72),
(78, '奔驰', 5, 1, 3, 50, NULL, '', '', '', 72),
(79, '测试新闻', 1, 1, 2, 50, NULL, '', '', '', 69),
(80, '资质荣誉', 6, 1, 1, 5, NULL, '', '', '', 0),
(81, '测试新闻2', 1, 1, 2, 50, NULL, '', '', '', 69),
(82, '测试三级1', 1, 1, 3, 50, NULL, '', '', '', 79),
(83, '测试三级2', 1, 1, 3, 50, NULL, '', '', '', 79),
(84, '租车须知', 2, 1, 1, 6, NULL, '&lt;p&gt;租车须知租车须知租车须知租车须知租车须知租车须知&lt;/p&gt;', '', '', 0),
(85, '人才招聘', 4, 1, 1, 7, NULL, '', '', '', 0),
(86, '在线留言', 3, 1, 1, 8, NULL, '', '', '', 0),
(87, '联系我们', 2, 1, 1, 9, NULL, '&lt;p&gt;&lt;img src=&quot;http://api.map.baidu.com/staticimage?center=116.450111,39.927669&amp;zoom=13&amp;width=530&amp;height=340&amp;markers=116.450111,39.927669&quot; height=&quot;340&quot; width=&quot;530&quot;/&gt;&lt;/p&gt;', '', '', 0),
(88, '公司简介', 2, 0, 1, 10, NULL, '&lt;p&gt;关于我们关于我们关于我们&lt;/p&gt;', '', '', 0),
(89, '如何租车', 2, 0, 1, 11, NULL, '&lt;p&gt;如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车如何租车&lt;/p&gt;', '', '', 0),
(90, '如何还车', 2, 0, 1, 12, NULL, '&lt;p&gt;如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车如何还车&lt;/p&gt;', '', '', 0),
(91, '费用说明', 1, 0, 1, 13, NULL, '', '', '', 0),
(92, '优惠活动', 5, 0, 1, 14, NULL, '', '', '', 0),
(93, '展示车辆', 5, 0, 1, 15, NULL, '', '', '', 0),
(94, '车辆保养', 1, 0, 1, 16, NULL, '', '', '', 0),
(95, '联系方式', 2, 0, 1, 17, NULL, '&lt;p&gt;联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们&lt;/p&gt;', '', '', 0),
(96, '招聘人才', 2, 0, 1, 18, NULL, '&lt;p&gt;招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘招聘&lt;/p&gt;', '', '', 0),
(97, '客户评价', 3, 0, 1, 19, NULL, '                                                                    ', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_customers`
--

CREATE TABLE IF NOT EXISTS `cs_customers` (
  `id` mediumint(5) NOT NULL,
  `image` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `cate` varchar(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_goods`
--

CREATE TABLE IF NOT EXISTS `cs_goods` (
  `goods_id` mediumint(8) unsigned NOT NULL,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_sn` varchar(60) NOT NULL DEFAULT '',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `goods_name_style` varchar(60) NOT NULL DEFAULT '+',
  `click_count` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `provider_name` varchar(100) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_weight` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `promote_start_date` int(11) unsigned NOT NULL DEFAULT '0',
  `promote_end_date` int(11) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `goods_brief` varchar(255) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `goods_thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_img` varchar(255) NOT NULL DEFAULT '',
  `original_img` varchar(255) NOT NULL DEFAULT '',
  `is_real` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `extension_code` varchar(30) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_alone_sale` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `is_shipping` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` smallint(4) unsigned NOT NULL DEFAULT '100',
  `is_delete` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_best` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_promote` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `goods_type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `seller_note` varchar(255) NOT NULL DEFAULT '',
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `rank_integral` int(11) NOT NULL DEFAULT '-1',
  `suppliers_id` smallint(5) unsigned DEFAULT NULL,
  `is_check` tinyint(1) unsigned DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `cs_goods`
--

INSERT INTO `cs_goods` (`goods_id`, `cat_id`, `goods_sn`, `goods_name`, `goods_name_style`, `click_count`, `brand_id`, `provider_name`, `goods_number`, `goods_weight`, `market_price`, `shop_price`, `promote_price`, `promote_start_date`, `promote_end_date`, `warn_number`, `keywords`, `goods_brief`, `goods_desc`, `goods_thumb`, `goods_img`, `original_img`, `is_real`, `extension_code`, `is_on_sale`, `is_alone_sale`, `is_shipping`, `integral`, `add_time`, `sort_order`, `is_delete`, `is_best`, `is_new`, `is_hot`, `is_promote`, `bonus_type_id`, `last_update`, `goods_type`, `seller_note`, `give_integral`, `rank_integral`, `suppliers_id`, `is_check`) VALUES
(1, 16, 'AWE000001', '红黄西椒250g', '+', 0, 0, '', 1001, '0.000', '9.00', '7.50', '0.00', 0, 0, 0, '', '', '<p><strong>特点：</strong>圆角果实较大，可做配菜也可做主菜，是一种高档蔬菜。<br/></p><p><br/></p><p><strong>包装规格：</strong>250g/包</p><p><br/></p><p><strong>菜品产地：</strong>云南省晋宁市</p><p><img src="/data/attached/image/20151021/1445398970583973.png" title="1445398970583973.png" alt="详情_02.png" width="100%" /><img src="/data/attached/image/20151021/1445398975737957.png" title="1445398975737957.png" alt="详情_03.png" width="100%" /><img src="/data/attached/image/20151021/1445398979809166.png" title="1445398979809166.png" alt="详情_04.png" width="100%" /></p><p><br/></p>', 'data/attached/images/201509/thumb_img/1_thumb_G_1443584708136.jpg', 'data/attached/images/201509/goods_img/1_G_1443584708969.jpg', 'data/attached/images/201509/source_img/1_G_1443584708279.jpg', 1, '', 1, 1, 0, 100, 1443496482, 20, 0, 1, 1, 1, 0, 0, 1445370180, 0, '', -1, -1, 0, NULL),
(2, 16, 'AWE000002', '粉果番茄', '+', 0, 0, '', 999, '0.000', '11.76', '9.80', '0.00', 0, 0, 0, '', '宁夏生态种植无污染粉果番茄', '<p><strong>特点：</strong>果面圆滑结实，大小匀称，粉红色，肉厚，甜度高，口感好</p><p><br/></p><p><strong>包装规格：</strong>400g/包</p><p><br/></p><p><strong>菜品产地：</strong>宁夏中卫<br/></p><p><img src="/data/attached/image/20151021/1445400194690806.png" title="1445400194690806.png" alt="详情页_02.png" width="100%" /><img src="/data/attached/image/20151021/1445400197562068.png" title="1445400197562068.png" alt="详情页_03.png" width="100%" /><img src="/data/attached/image/20151021/1445400201170842.png" title="1445400201170842.png" alt="详情页_04.png" width="100%" /></p><p><br/></p><p><br/></p>', 'data/attached/images/201509/thumb_img/2_thumb_G_1443584614601.jpg', 'data/attached/images/201509/goods_img/2_G_1443584614534.jpg', 'data/attached/images/201509/source_img/2_G_1443584614679.jpg', 1, '', 1, 1, 0, 200, 1443498938, 20, 0, 1, 1, 1, 0, 0, 1445371403, 0, '', 1, 1, 0, NULL),
(3, 16, 'AWE000003', '金银粟玉米', '+', 1, 0, '', 999, '0.000', '6.35', '5.30', '0.00', 0, 0, 0, '', '', '<p><br/></p><p><strong>特色：</strong>优良品种，具有甜，鲜，脆，嫩的特色，可以像水果一样生吃。<br/></p><p><br/></p><p><strong>包装规格：</strong>300g/包</p><p><br/></p><p><strong>菜品产地：</strong>云南大理</p><p><img src="/data/attached/image/20151021/1445408020187950.png" title="1445408020187950.png" alt="详情页_02.png" width="100%" /><img src="/data/attached/image/20151021/1445408023468850.png" title="1445408023468850.png" alt="详情页_03.png" width="100%" /><img src="/data/attached/image/20151021/1445408027718090.png" title="1445408027718090.png" alt="详情页_04.png" width="100%" /><img src="/data/attached/image/20151021/1445408031977752.png" title="1445408031977752.png" alt="详情页_05.png" width="100%" /><img src="/data/attached/image/20151021/1445408034154285.png" title="1445408034154285.png" alt="详情页_06.png" width="100%" /><img src="/data/attached/image/20151021/1445408037387080.png" title="1445408037387080.png" alt="详情页_07.png" width="100%" /><img src="/data/attached/image/20151021/1445408040591728.png" title="1445408040591728.png" alt="详情页_08.png" width="100%" /><img src="/data/attached/image/20151021/1445408043663055.png" title="1445408043663055.png" alt="详情页_09.png" width="100%" /></p>', 'data/attached/images/201509/thumb_img/3_thumb_G_1443584579303.jpg', 'data/attached/images/201509/goods_img/3_G_1443584579475.jpg', 'data/attached/images/201509/source_img/3_G_1443584579223.jpg', 1, '', 1, 1, 0, 100, 1443500148, 20, 0, 1, 1, 1, 0, 0, 1445379250, 0, '', 1, 1, 0, NULL),
(4, 16, 'AWE000004', '独子蒜200g', '+', 0, 0, '', 1001, '0.250', '11.04', '9.20', '0.00', 0, 0, 0, '', '生态种植，自然生长无污染大理独头蒜', '<p><strong>特色：</strong>果面圆滑结实，大小匀称，粉红色，肉厚，甜度高，口感好</p><p><br/></p><p><strong>包装规格：</strong>200g/包</p><p><br/></p><p><strong>菜品产地：</strong>宁夏中卫</p><p><img src="/data/attached/image/20151021/1445397983966399.jpg" title="1445397983966399.jpg" alt="生姜_02.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397987630816.jpg" title="1445397987630816.jpg" alt="生姜_03.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397990442710.jpg" title="1445397990442710.jpg" alt="生姜_04.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397993745200.jpg" title="1445397993745200.jpg" alt="生姜_05.jpg" width="100%" /></p><p><br/></p><p><br/></p>', 'data/attached/images/201509/thumb_img/4_thumb_G_1443584528166.jpg', 'data/attached/images/201509/goods_img/4_G_1443584528661.jpg', 'data/attached/images/201509/source_img/4_G_1443584528987.jpg', 1, '', 1, 1, 0, 100, 1443552094, 100, 0, 1, 1, 1, 0, 0, 1445369196, 0, '', 1, 1, 0, NULL),
(5, 16, 'AWE000005', '包装老姜180g', '+', 0, 0, '', 1001, '0.250', '5.15', '4.30', '0.00', 0, 0, 0, '', '产自四川绿色种植无污染竹根黄姜', '<p>特色：金堂“竹根黄姜”，姜味浓郁，肉质肥厚</p><p><br/></p><p>包装规格：180g/包</p><p><br/></p><p>菜品产地：四川金堂</p><p><img src="/data/attached/image/20151021/1445397718560182.jpg" title="1445397718560182.jpg" alt="生姜_02.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397722965509.jpg" title="1445397722965509.jpg" alt="生姜_03.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397725638462.jpg" title="1445397725638462.jpg" alt="生姜_04.jpg" width="100%" /><img src="/data/attached/image/20151021/1445397728425020.jpg" title="1445397728425020.jpg" alt="生姜_05.jpg" width="100%" /></p><p><br/></p>', 'data/attached/images/201509/thumb_img/5_thumb_G_1443584451975.jpg', 'data/attached/images/201509/goods_img/5_G_1443584451540.jpg', 'data/attached/images/201509/source_img/5_G_1443584451191.jpg', 1, '', 1, 1, 0, 300, 1443553985, 100, 0, 1, 1, 1, 0, 0, 1445368930, 0, '', 1, 1, 0, NULL),
(6, 16, 'AWE000006', '小青瓜仔400g', '+', 2, 0, '', 1001, '0.000', '10.20', '8.50', '0.00', 0, 0, 0, '', '宁夏生态种植无污染小青瓜', '<p><strong>特色：</strong>甜嫩爽脆，非常适宜生吃、凉拌、沙拉v</p><p><br/></p><p><strong>包装规格：</strong>400g/包</p><p><br/></p><p><strong>菜品产地：</strong>宁夏中卫</p><p><img src="/data/attached/image/20151021/1445398674985604.png" title="1445398674985604.png" alt="xiangqingye_02.png" width="100%" /><img src="/data/attached/image/20151021/1445398679209429.png" title="1445398679209429.png" alt="xiangqingye_03.png" width="100%" /></p><p><br/></p><p><br/></p>', 'data/attached/images/201509/thumb_img/6_thumb_G_1443584385358.jpg', 'data/attached/images/201509/goods_img/6_G_1443584385043.jpg', 'data/attached/images/201509/source_img/6_G_1443584385197.jpg', 1, '', 1, 1, 0, 500, 1443555424, 20, 0, 1, 1, 1, 0, 0, 1445369882, 0, '', 1, 1, 0, NULL),
(7, 16, 'AWE000007', '蟹味菇150g', '+', 3, 0, '', 1001, '0.000', '9.60', '8.00', '0.00', 0, 0, 0, '', '生态种植，自然生长无污染白玉蟹味茹', '<p><strong>特色：</strong>白玉蟹味菇是一种珍稀食用菌，通体洁白，晶莹剔透，菇体脆嫩鲜滑</p><p><br/></p><p><strong>包装规格：</strong>150g/包</p><p><br/></p><p><strong>菜品产地：</strong>广东省韶关市</p><p><img src="/data/attached/image/20151021/1445399322403183.png" title="1445399322403183.png" alt="详情页_02.png" width="100%" /><img src="/data/attached/image/20151021/1445399326526474.png" title="1445399326526474.png" alt="详情页_03.png" width="100%" /><img src="/data/attached/image/20151021/1445399330874397.png" title="1445399330874397.png" alt="详情页_04.png" width="100%" /><img src="/data/attached/image/20151021/1445399333161468.png" title="1445399333161468.png" alt="详情页_05.png" width="100%" /></p><p><br/></p><p><br/></p><p><br/></p>', 'data/attached/images/201509/thumb_img/7_thumb_G_1443584345146.jpg', 'data/attached/images/201509/goods_img/7_G_1443584345269.jpg', 'data/attached/images/201509/source_img/7_G_1443584345715.jpg', 1, '', 1, 1, 0, 1500, 1443564504, 100, 0, 1, 1, 1, 0, 0, 1445370535, 0, '', 1, 1, 0, NULL),
(8, 16, 'AWE000008', '三红胡萝卜600g', '+', 0, 0, '', 1001, '0.000', '11.76', '9.80', '0.00', 0, 0, 0, '', '福建生态无污染种植三红胡萝卜', '<p><img src="/data/attached/image/20150930/1443594833887185.jpg" title="1443594833887185.jpg" alt="详情页.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/8_thumb_G_1443584278308.jpg', 'data/attached/images/201509/goods_img/8_G_1443584278406.jpg', 'data/attached/images/201509/source_img/8_G_1443584278233.jpg', 1, '', 1, 1, 0, 0, 1443566068, 20, 0, 1, 1, 1, 0, 0, 1445366609, 0, '', 1, 1, 0, NULL),
(9, 16, 'AWE000009', '心里美萝卜', '+', 2, 0, '', 1001, '0.000', '6.24', '5.20', '0.00', 0, 0, 0, '', '出口品质 生态种植心里美萝卜', '<p><img src="/data/attached/image/20150930/1443596763381459.jpg" title="1443596763381459.jpg" alt="xiangqingye.jpg" width="100%" /></p>', 'data/attached/images/201509/thumb_img/9_thumb_G_1443584198105.jpg', 'data/attached/images/201509/goods_img/9_G_1443584198650.jpg', 'data/attached/images/201509/source_img/9_G_1443584198044.jpg', 1, '', 1, 1, 0, 0, 1443568023, 20, 0, 1, 1, 1, 0, 0, 1444961716, 0, '', 1, 1, 0, NULL),
(10, 16, 'AWE000010', '甜豆150g', '+', 0, 0, '', 1001, '0.000', '9.48', '7.90', '0.00', 0, 0, 0, '', '营养富丰食疗兼备美国甜豆', '<p><br/></p><p>特色：柔嫩味甜，纤维少，清甜爽口，营养价值高，更是美容瘦身的食材</p><p><br/></p><p>包装规格：150g/包</p><p><br/></p><p>菜品产地：云南省晋宁县</p><p><img src="/data/attached/image/20151021/1445396101342621.jpg" title="1445396101342621.jpg" alt="xiangqingye_02.jpg" width="100%" /><img src="/data/attached/image/20151021/1445396104865896.jpg" title="1445396104865896.jpg" alt="xiangqingye_03.jpg" width="100%" /><img src="/data/attached/image/20151021/1445396107613045.jpg" title="1445396107613045.jpg" alt="xiangqingye_04.jpg" width="100%" /></p><p><br/></p><p><br/></p>', 'data/attached/images/201509/thumb_img/10_thumb_G_1443584149906.jpg', 'data/attached/images/201509/goods_img/10_G_1443584149120.jpg', 'data/attached/images/201509/source_img/10_G_1443584149196.jpg', 1, '', 1, 1, 0, 0, 1443570068, 20, 0, 1, 1, 1, 0, 0, 1445367310, 0, '', 1, 1, 0, NULL),
(11, 16, 'AWE000011', '芋头1个', '+', 0, 0, '', 1001, '0.000', '13.92', '11.60', '0.00', 0, 0, 0, '', '', '<p><strong>特点：</strong>荔浦芋又叫香芋、山芋，是经过野生芋长期自然选择和人工选育而形成的一个优良品种</p><p><br/></p><p><strong>包装规格：</strong>800g/包</p><p><br/></p><p><strong>菜品产地：</strong>广西荔浦</p><p><img src="/data/attached/image/20151023/1445585098441697.png" title="1445585098441697.png" alt="xiagqingey_02.png"  width="100%" /><img src="/data/attached/image/20151023/1445585102337162.png" title="1445585102337162.png" alt="xiagqingey_03.png"  width="100%" /><img src="/data/attached/image/20151023/1445585105316413.png" title="1445585105316413.png" alt="xiagqingey_04.png"  width="100%" /><img src="/data/attached/image/20151023/1445585108850598.png" title="1445585108850598.png" alt="xiagqingey_05.png"  width="100%" /><img src="/data/attached/image/20151023/1445585112498945.png" title="1445585112498945.png" alt="xiagqingey_06.png"  width="100%" /></p><p><br/></p>', 'data/attached/images/201509/thumb_img/11_thumb_G_1443584069212.jpg', 'data/attached/images/201509/goods_img/11_G_1443584069945.jpg', 'data/attached/images/201509/source_img/11_G_1443584069941.jpg', 1, '', 1, 1, 0, 0, 1443571321, 20, 0, 1, 1, 1, 0, 0, 1445569251, 0, '', 1, 1, 0, NULL),
(12, 16, 'AWE000012', '紫椰菜', '+', 0, 0, '', 1001, '0.000', '15.48', '12.90', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20150930/1443601788943004.jpg" title="1443601788943004.jpg" alt="详情页.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/12_thumb_G_1443584004532.jpg', 'data/attached/images/201509/goods_img/12_G_1443584004516.jpg', 'data/attached/images/201509/source_img/12_G_1443584004315.jpg', 1, '', 1, 1, 0, 0, 1443573015, 1, 0, 1, 1, 1, 0, 0, 1445315714, 0, '', 1, 1, 0, NULL),
(13, 16, 'AWE000013', '青花椰菜550g', '+', 1, 0, '', 1001, '0.000', '12.60', '10.50', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20151023/1445597992329225.jpg" title="1445597992329225.jpg" alt="1444959731984138.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/13_thumb_G_1444930533495.jpg', 'data/attached/images/201510/goods_img/13_G_1444930533722.jpg', 'data/attached/images/201510/source_img/13_G_1444930533433.jpg', 1, '', 0, 1, 0, 0, 1443575362, 1, 0, 1, 1, 1, 0, 0, 1445700337, 0, '', 1, 1, 0, NULL),
(69, 16, 'AWE000069', '菜心苗300g', '+', 3, 0, '', 1001, '0.000', '11.76', '9.80', '0.00', 0, 0, 1, '', '', '<p><img title="1445393915349697.jpg" alt="详情页_01.jpg" src="/data/attached/image/20151021/1445393915349697.jpg"  width="100%" /><img title="1445393918247387.jpg" alt="详情页_02.jpg" src="/data/attached/image/20151021/1445393918247387.jpg"  width="100%" /><img title="1445393921647733.jpg" alt="详情页_03.jpg" src="/data/attached/image/20151021/1445393921647733.jpg"  width="100%" /><img title="1445393924984017.jpg" alt="详情页_04.jpg" src="/data/attached/image/20151021/1445393924984017.jpg"  width="100%" /><img title="1445393927305396.jpg" alt="详情页_05.jpg" src="/data/attached/image/20151021/1445393927305396.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/69_thumb_G_1445365141239.jpg', 'data/attached/images/201510/goods_img/69_G_1445365141449.jpg', 'data/attached/images/201510/source_img/69_G_1445365141161.jpg', 1, '', 1, 1, 0, 0, 1445365141, 1, 0, 1, 1, 1, 0, 0, 1445566156, 0, '', 1, 1, 0, NULL),
(14, 16, 'AWE000014', '甘蓝', '+', 0, 0, '', 1001, '0.000', '11.04', '9.20', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20150930/1443605703177299.jpg" title="1443605703177299.jpg" alt="详情页.jpg" width="100%" /></p>', 'data/attached/images/201509/thumb_img/14_thumb_G_1443583898509.jpg', 'data/attached/images/201509/goods_img/14_G_1443583898124.jpg', 'data/attached/images/201509/source_img/14_G_1443583898480.jpg', 1, '', 1, 1, 0, 0, 1443576917, 1, 0, 1, 1, 1, 0, 0, 1444704344, 0, '', 1, 1, 0, NULL),
(15, 16, 'AWE000015', '新西兰菠菜250g', '+', 12, 0, '', 1001, '0.000', '9.48', '7.90', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20150930/1443607114982603.jpg" title="1443607114982603.jpg" alt="详情页.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/15_thumb_G_1443583844602.jpg', 'data/attached/images/201509/goods_img/15_G_1443583844260.jpg', 'data/attached/images/201509/source_img/15_G_1443583844923.jpg', 1, '', 1, 1, 0, 0, 1443578323, 1, 0, 1, 1, 1, 0, 0, 1445702327, 0, '', 1, 1, 0, NULL),
(16, 21, 'AWE000016', '农家黄豆300g', '+', 6, 0, '', 1001, '0.000', '12.96', '10.80', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20151023/1445597659623166.jpg" title="1445597659623166.jpg" alt="xiangqinggty.jpg" width="100%" /></p>', 'data/attached/images/201509/thumb_img/16_thumb_G_1443583781385.jpg', 'data/attached/images/201509/goods_img/16_G_1443583781038.jpg', 'data/attached/images/201509/source_img/16_G_1443583781494.jpg', 1, '', 1, 1, 0, 0, 1443581676, 100, 0, 1, 1, 1, 0, 0, 1445568867, 0, '', 1, 1, 0, NULL),
(17, 19, 'AWE000017', '清远本地家鸡', '+', 0, 0, '', 0, '0.000', '216.00', '180.00', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20150930/1443611020108890.jpg" title="1443611020108890.jpg" alt="详情页1.jpg"  width="100%" /><img src="/data/attached/image/20150930/1443611026444296.jpg" title="1443611026444296.jpg" alt="详情页2.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/17_thumb_G_1443583728934.jpg', 'data/attached/images/201509/goods_img/17_G_1443583728335.jpg', 'data/attached/images/201509/source_img/17_G_1443583728028.jpg', 1, '', 1, 1, 0, 0, 1443582234, 100, 0, 1, 1, 1, 0, 0, 1445569545, 0, '', 1, 1, 0, NULL),
(18, 21, 'AWE000018', '瑶山黑豆（330g）', '+', 0, 0, '', 0, '0.000', '18.00', '15.00', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20150930/1443611551596730.jpg" title="1443611551596730.jpg" alt="xiangqingye.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/18_thumb_G_1443583650833.jpg', 'data/attached/images/201509/goods_img/18_G_1443583650354.jpg', 'data/attached/images/201509/source_img/18_G_1443583650225.jpg', 1, '', 0, 1, 0, 0, 1443582773, 100, 0, 1, 1, 1, 0, 0, 1445702276, 0, '', 1, 1, 0, NULL),
(19, 20, 'AWE000019', '农家花生油   5斤', '+', 3, 0, '', 1001, '0.000', '189.60', '158.00', '0.00', 0, 0, 0, '', '', '<p><img src="/data/attached/image/20151023/1445597466547058.jpg" title="1445597466547058.jpg" alt="详情页1.jpg" width="100%" /><img title="1443612358977552.jpg" alt="详情页2.jpg" src="/data/attached/image/20150930/1443612358977552.jpg"  width="100%" /></p>', 'data/attached/images/201509/thumb_img/19_thumb_G_1443583568942.jpg', 'data/attached/images/201509/goods_img/19_G_1443583568936.jpg', 'data/attached/images/201509/source_img/19_G_1443583568830.jpg', 1, '', 1, 1, 0, 0, 1443583568, 100, 0, 1, 1, 1, 0, 0, 1445568675, 10, '', 1, 1, 0, NULL),
(23, 21, 'AWE000023', '云南昭通小米  250g', '+', 2, 0, '', 1001, '0.000', '12.12', '10.10', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特色：</strong>营养价值很高，美味可口、颜色亮丽、含丰富的碳水化合物、养生美容佳品</p><p><br/></p><p><strong>产地：</strong>云南昭通黑顶鹤之乡大山包</p><p><br/></p><p><strong>包装规格：</strong>0.74 斤/袋</p><p><img  title="1444381050598306.jpg" alt="未标题-3_01.jpg" src="/data/attached/image/20151009/1444381050598306.jpg" width="100%" /><img  title="1444381063439850.jpg" alt="未标题-3_02.jpg" src="/data/attached/image/20151009/1444381063439850.jpg" width="100%" /><img  title="1444381066517048.jpg" alt="未标题-3_03.jpg" src="/data/attached/image/20151009/1444381066517048.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/23_thumb_G_1444352298765.jpg', 'data/attached/images/201510/goods_img/23_G_1444352298093.jpg', 'data/attached/images/201510/source_img/23_G_1444352298210.jpg', 1, '', 1, 1, 0, 0, 1444352298, 100, 0, 1, 1, 1, 0, 0, 1445449551, 0, '', 1, 1, 0, NULL),
(20, 21, 'AWE000020', '云南皂角米', '+', 0, 0, '', 1001, '0.000', '69.60', '58.00', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特 &nbsp; 色：</strong>云南梁河滇皂荚俗称皂角米或雪莲子，是皂荚的果实。含多种维生素和矿物质，具有清肝明目、祛痰之功效，能调和人体脏腑功能、提神补气的珍贵纯天然绿色滋补食品。</p><p><br/></p><p><strong>产 &nbsp; 地：</strong>云南梁河</p><p><br/></p><p><strong>包装规格：</strong>100g/袋</p><p><img  title="1444374017114399.jpg" alt="xiangqingye_01.jpg" src="/data/attached/image/20151009/1444374017114399.jpg" width="100%" /><img  title="1444374020664770.jpg" alt="xiangqingye_02.jpg" src="/data/attached/image/20151009/1444374020664770.jpg" width="100%" /><img  title="1444374026179259.jpg" alt="xiangqingye_03.jpg" src="/data/attached/image/20151009/1444374026179259.jpg" width="100%" /><img  title="1444374030958907.jpg" alt="xiangqingye_04.jpg" src="/data/attached/image/20151009/1444374030958907.jpg" width="100%" /><img  title="1444374034762360.jpg" alt="xiangqingye_05.jpg" src="/data/attached/image/20151009/1444374034762360.jpg" width="100%" /><img  title="1444374037530686.jpg" alt="xiangqingye_06.jpg" src="/data/attached/image/20151009/1444374037530686.jpg" width="100%" /><img  title="1444374041854038.jpg" alt="xiangqingye_07.jpg" src="/data/attached/image/20151009/1444374041854038.jpg" width="100%" /></p><p><br/></p>', 'data/attached/images/201510/thumb_img/20_thumb_G_1444345260637.jpg', 'data/attached/images/201510/goods_img/20_G_1444345260532.jpg', 'data/attached/images/201510/source_img/20_G_1444345260893.jpg', 1, '', 0, 1, 0, 0, 1444345260, 100, 0, 1, 1, 1, 0, 0, 1445449993, 0, '', 1, 1, 0, NULL),
(21, 21, 'AWE000021', '燕麦米  250g', '+', 0, 0, '', 1001, '0.000', '10.68', '8.90', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特 &nbsp; 色：</strong>营养价值很高，对糖尿病、脂肪肝、便秘、浮肿等有辅助，对中老年人增进体力，延年益寿大有裨益</p><p><br/></p><p><strong>产 &nbsp; 地：</strong>云南昭通黑顶鹤之乡大山包</p><p><br/></p><p><strong>包装规格：</strong>0.74 斤/袋</p><p><br/></p><p><img title="1444376013416058.jpg" alt="xiangqingye_01.jpg" src="/data/attached/image/20151009/1444376013416058.jpg"  width="100%" /><img title="1444376018456029.jpg" alt="xiangqingye_03.jpg" src="/data/attached/image/20151009/1444376018456029.jpg"  width="100%" /><img title="1444376022340697.jpg" alt="xiangqingye_04.jpg" src="/data/attached/image/20151009/1444376022340697.jpg"  width="100%" /><img title="1444376025644663.jpg" alt="xiangqingye_05.jpg" src="/data/attached/image/20151009/1444376025644663.jpg"  width="100%" /><img title="1444376029838807.jpg" alt="xiangqingye_07.jpg" src="/data/attached/image/20151009/1444376029838807.jpg"  width="100%" /><img title="1444376042726315.jpg" alt="xiangqingye_07.jpg" src="/data/attached/image/20151009/1444376042726315.jpg"  width="100%" /><img title="1444376046539980.jpg" alt="xiangqingye_08.jpg" src="/data/attached/image/20151009/1444376046539980.jpg"  width="100%" /><img title="1444376049214783.jpg" alt="xiangqingye_10.jpg" src="/data/attached/image/20151009/1444376049214783.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/21_thumb_G_1444347264561.jpg', 'data/attached/images/201510/goods_img/21_G_1444347264017.jpg', 'data/attached/images/201510/source_img/21_G_1444347264149.jpg', 1, '', 1, 1, 0, 0, 1444347264, 100, 0, 1, 1, 1, 0, 0, 1445568500, 0, '', 1, 1, 0, NULL),
(22, 21, 'AWE000022', '云南墨江黑糯米  250g', '+', 0, 0, '', 1001, '0.000', '15.23', '12.70', '0.00', 0, 0, 1, '', '', '<p><strong>特</strong><strong>色：</strong>营养价值很高，对糖尿病、脂肪肝、便秘、浮肿等有辅助，对中老年人增进体力，延年益寿大有裨益</p><p><br/></p><p><strong>产地：</strong>云南昭通黑顶鹤之乡大山包</p><p><br/></p><p><strong>包装规格：</strong>0.7 斤/袋</p><p><br/></p><p><img  title="1444379786978952.jpg" alt="未标题-3_01.jpg" src="/data/attached/image/20151009/1444379786978952.jpg" width="100%" /><img  title="1444379789836030.jpg" alt="未标题-3_02.jpg" src="/data/attached/image/20151009/1444379789836030.jpg" width="100%" /><img  title="1444379792661470.jpg" alt="未标题-3_03.jpg" src="/data/attached/image/20151009/1444379792661470.jpg" width="100%" /><img  title="1444379833257611.jpg" alt="未标题-3_04.jpg" src="/data/attached/image/20151009/1444379833257611.jpg" width="100%" /><img  title="1444379836274099.jpg" alt="未标题-3_05.jpg" src="/data/attached/image/20151009/1444379836274099.jpg" width="100%" /><img  title="1444379839128754.jpg" alt="未标题-3_06.jpg" src="/data/attached/image/20151009/1444379839128754.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/22_thumb_G_1444351055700.jpg', 'data/attached/images/201510/goods_img/22_G_1444351055231.jpg', 'data/attached/images/201510/source_img/22_G_1444351055929.jpg', 1, '', 1, 1, 0, 0, 1444351055, 100, 0, 1, 1, 1, 0, 0, 1445568534, 0, '', 1, 1, 0, NULL),
(24, 22, 'AWE000024', '英德蜂蜜  500g', '+', 0, 0, '', 1001, '0.000', '154.79', '129.00', '0.00', 0, 0, 1, '', '', '<p><strong><br/></strong></p><p><strong>特点：</strong>色泽晶莹，醇厚甘甜，比一般蜂蜜含有更多的葡萄糖、果糖、维生素、氨基酸、酶及酯类。</p><p><br/></p><p><strong>产地：</strong>英德横石水</p><p><br/></p><p><strong>包装规格：</strong>500g/瓶</p><p><br/></p><p><img title="1444382701299631.jpg" alt="未标题-3_01.jpg" src="/data/attached/image/20151009/1444382701299631.jpg"  width="100%" /><img title="1444382705714366.jpg" alt="未标题-3_02.jpg" src="/data/attached/image/20151009/1444382705714366.jpg"  width="100%" /><img title="1444382708621126.jpg" alt="未标题-3_03.jpg" src="/data/attached/image/20151009/1444382708621126.jpg"  width="100%" /><img title="1444382711125705.jpg" alt="未标题-3_04.jpg" src="/data/attached/image/20151009/1444382711125705.jpg"  width="100%" /><img title="1444382715232531.jpg" alt="未标题-3_05.jpg" src="/data/attached/image/20151009/1444382715232531.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/24_thumb_G_1444353931138.jpg', 'data/attached/images/201510/goods_img/24_G_1444353931564.jpg', 'data/attached/images/201510/source_img/24_G_1444353931077.jpg', 1, '', 1, 1, 0, 0, 1444353931, 100, 0, 1, 1, 1, 0, 0, 1445568431, 0, '', 1, 1, 0, NULL),
(25, 19, 'AWE000025', '粤北农家猪', '+', 0, 0, '', 0, '0.000', '25.20', '21.00', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特点：</strong>英德粤北农家猪生长期10个月-1年，一头有150-180斤左右，吃稻谷米糠，剩菜剩饭，酒糟长大，肉质鲜美、口感佳。无激素药物残留，安全健康</p><p><br/></p><p><strong>产地：</strong>英德桥头</p><p><br/></p><p><strong>包装规格：</strong>1 斤/盒</p><p><img src="/data/attached/image/20151009/1444384363815136.jpg" title="1444384363815136.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444384366157437.jpg" title="1444384366157437.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444384369638329.jpg" title="1444384369638329.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444384372248189.jpg" title="1444384372248189.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444384376791838.jpg" title="1444384376791838.jpg" alt="未标题-3_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/25_thumb_G_1444355591865.jpg', 'data/attached/images/201510/goods_img/25_G_1444355591548.jpg', 'data/attached/images/201510/source_img/25_G_1444355591357.jpg', 1, '', 0, 1, 0, 0, 1444355591, 100, 0, 1, 1, 1, 0, 0, 1445702245, 0, '', 1, 1, 0, NULL),
(26, 16, 'AWE000026', '望埠腐竹250g', '+', 0, 0, '', 1001, '0.000', '19.20', '16.00', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特点：</strong>望埠腐竹又称腐皮，清香爽口，别有风味、腐竹色泽黄白，油光透亮</p><p><br/></p><p><strong>产地：</strong>英德望埠</p><p><br/></p><p><strong>包装规格：</strong>250g/包</p><p><img src="/data/attached/image/20151020/1445324541882392.jpg" title="1445324541882392.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324544575218.jpg" title="1445324544575218.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324549507387.jpg" title="1445324549507387.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324553422544.jpg" title="1445324553422544.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324557486903.jpg" title="1445324557486903.jpg" alt="详情页_05.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324560540088.jpg" title="1445324560540088.jpg" alt="详情页_06.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324563764897.jpg" title="1445324563764897.jpg" alt="详情页_07.jpg"  width="100%" /><img src="/data/attached/image/20151020/1445324566552900.jpg" title="1445324566552900.jpg" alt="详情页_08.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/26_thumb_G_1445295786094.jpg', 'data/attached/images/201510/goods_img/26_G_1445295786019.jpg', 'data/attached/images/201510/source_img/26_G_1445295786109.jpg', 1, '', 1, 1, 0, 0, 1444361652, 100, 0, 1, 1, 1, 0, 0, 1445568331, 0, '', 1, 1, 0, NULL),
(68, 23, 'AWE000068', '英德红茶150g', '+', 1, 0, '', 999, '0.000', '58.80', '49.00', '0.00', 0, 0, 1, '', '', '<p><img title="1445326018916370.jpg" alt="详情页_01.jpg" src="/data/attached/image/20151020/1445326018916370.jpg"  width="100%" /><img title="1445326022680419.jpg" alt="详情页_02.jpg" src="/data/attached/image/20151020/1445326022680419.jpg"  width="100%" /><img title="1445326025500470.jpg" alt="详情页_03.jpg" src="/data/attached/image/20151020/1445326025500470.jpg"  width="100%" /><img title="1445326028519921.jpg" alt="详情页_04.jpg" src="/data/attached/image/20151020/1445326028519921.jpg"  width="100%" /><img title="1445326030799228.jpg" alt="详情页_05.jpg" src="/data/attached/image/20151020/1445326030799228.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/68_thumb_G_1445297242215.jpg', 'data/attached/images/201510/goods_img/68_G_1445297242324.jpg', 'data/attached/images/201510/source_img/68_G_1445297242039.jpg', 1, '', 1, 1, 0, 0, 1445297242, 100, 0, 1, 1, 1, 0, 0, 1445566221, 0, '', 1, 1, 0, NULL),
(27, 16, 'AWE000027', '竹山粉葛', '+', 0, 0, '', 0, '0.000', '20.27', '16.90', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>竹山粉葛性凉、味甘、细嫩、无渣、甘甜的特点</p><p><br/></p><p><strong>产地：</strong>佛山汤塘竹山</p><p><br/></p><p><strong>包装规格：</strong>斤/袋<img src="/data/attached/image/20151009/1444392124287452.jpg" title="1444392124287452.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444392128379949.jpg" title="1444392128379949.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444392133860222.jpg" title="1444392133860222.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444392136340758.jpg" title="1444392136340758.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151009/1444392140867590.jpg" title="1444392140867590.jpg" alt="未标题-3_07.jpg"  width="100%" /></p><p><img src="/data/attached/image/20151009/1444392102251514.jpg" title="1444392102251514.jpg" alt="未标题-3_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/27_thumb_G_1444363352848.jpg', 'data/attached/images/201510/goods_img/27_G_1444363352240.jpg', 'data/attached/images/201510/source_img/27_G_1444363352646.jpg', 1, '', 0, 1, 0, 0, 1444363352, 100, 0, 1, 1, 1, 0, 0, 1445702229, 0, '', -1, -1, 0, NULL),
(28, 16, 'AWE000028', '云南高山娃娃菜', '+', 0, 0, '', 1001, '0.000', '8.28', '6.90', '0.00', 0, 0, 1, '', '', '<p><strong><span style="font-size: 16px;">特色</span></strong><span style="font-size: 16px;">：长圆柱形，袖珍型小白菜、叶缩微皱，尤适合上汤</span></p><p><span style="font-size: 16px;"><br/></span></p><p><strong><span style="font-size: 16px;">菜品产地：</span></strong><span style="font-size: 16px;">云南省晋宁市</span></p><p><span style="font-size: 16px;"><br/></span></p><p><strong><span style="font-size: 16px;">包装规格：</span></strong><span style="font-size: 16px;">2条装/300g</span></p><p><span style="font-size: 16px;"><br/></span></p><p><span style="font-size: 16px;"><img src="/data/attached/image/20151010/1444444129102438.jpg" title="1444444129102438.jpg" alt="未标题-1_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444444132494423.jpg" title="1444444132494423.jpg" alt="未标题-1_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444444140316858.jpg" title="1444444140316858.jpg" alt="未标题-1_03.jpg"  width="100%" /></span></p>', 'data/attached/images/201510/thumb_img/28_thumb_G_1444415356480.jpg', 'data/attached/images/201510/goods_img/28_G_1444415356113.jpg', 'data/attached/images/201510/source_img/28_G_1444415356706.jpg', 1, '', 1, 1, 0, 0, 1444415356, 1, 0, 1, 1, 1, 0, 0, 1445366520, 0, '', 1, 1, 0, NULL),
(29, 16, 'AWE000029', '韩白玉白萝卜800g', '+', 0, 0, '', 1001, '0.000', '15.36', '12.80', '0.00', 0, 0, 1, '', '', '<p><br/></p><p><strong>特色：</strong>白萝卜是主要的蔬菜，生食熟食均可，味甘、辛辣</p><p><br/></p><p><strong>菜品产地：</strong>山东日照</p><p><br/></p><p><strong>包装规格：</strong>800g/袋</p><p><br/></p><p><img src="/data/attached/image/20151010/1444445704160223.jpg" title="1444445704160223.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444445707850295.jpg" title="1444445707850295.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444445711545868.jpg" title="1444445711545868.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444445715452893.jpg" title="1444445715452893.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444445718147954.jpg" title="1444445718147954.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444445721481226.jpg" title="1444445721481226.jpg" alt="未标题-3_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/29_thumb_G_1444416936583.jpg', 'data/attached/images/201510/goods_img/29_G_1444416936712.jpg', 'data/attached/images/201510/source_img/29_G_1444416936584.jpg', 1, '', 1, 1, 0, 0, 1444416936, 100, 0, 1, 1, 1, 0, 0, 1445366688, 0, '', 1, 1, 0, NULL),
(30, 16, 'AWE000030', '金针菇200g', '+', 0, 0, '', 1001, '0.000', '6.60', '5.50', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>人称“增智菇”，含人体所需氨基酸成份</p><p><br/></p><p><strong>菜品产地：</strong>广东省韶关市</p><p><br/></p><p><strong>包装规格：</strong>200g/包</p><p><img src="/data/attached/image/20151010/1444447350492778.jpg" title="1444447350492778.jpg" alt="详情页.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/30_thumb_G_1444418564731.jpg', 'data/attached/images/201510/goods_img/30_G_1444418564334.jpg', 'data/attached/images/201510/source_img/30_G_1444418564563.jpg', 1, '', 1, 1, 0, 0, 1444418564, 100, 0, 1, 1, 1, 0, 0, 1445370686, 0, '', 1, 1, 0, NULL),
(31, 16, 'AWE000031', '茄子2个', '+', 0, 0, '', 1001, '0.000', '10.20', '8.50', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>圆茄是茄科茄属一年生草本植物，热带为多年生</p><p><br/></p><p><strong>菜品产地：</strong>宁夏中卫</p><p><br/></p><p><strong>包装规格：</strong>500g/袋</p><p><img src="/data/attached/image/20151010/1444448762431794.jpg" title="1444448762431794.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444448765881112.jpg" title="1444448765881112.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444448769371719.jpg" title="1444448769371719.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444448771640063.jpg" title="1444448771640063.jpg" alt="未标题-3_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/31_thumb_G_1444419982297.jpg', 'data/attached/images/201510/goods_img/31_G_1444419982490.jpg', 'data/attached/images/201510/source_img/31_G_1444419982279.jpg', 1, '', 1, 1, 0, 0, 1444419982, 20, 0, 1, 1, 1, 0, 0, 1445702046, 0, '', 1, 1, 0, NULL),
(32, 16, 'AWE000032', '芋头仔500g', '+', 0, 0, '', 1001, '0.000', '4.44', '3.70', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>松滑细嫩，口感佳，老幼皆宜</p><p><br/></p><p><strong>菜品产地：</strong>山东省日照市</p><p><br/></p><p><strong>规格：</strong>0.5斤/袋</p><p><img src="/data/attached/image/20151010/1444449977856326.jpg" title="1444449977856326.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444449980760832.jpg" title="1444449980760832.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444449985444611.jpg" title="1444449985444611.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444449989894528.jpg" title="1444449989894528.jpg" alt="未标题-3_06.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444449994295697.jpg" title="1444449994295697.jpg" alt="未标题-3_08.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/32_thumb_G_1444421206091.jpg', 'data/attached/images/201510/goods_img/32_G_1444421206296.jpg', 'data/attached/images/201510/source_img/32_G_1444421206311.jpg', 1, '', 1, 1, 0, 0, 1444421206, 20, 0, 1, 1, 1, 0, 0, 1445366765, 0, '', 1, 1, 0, NULL),
(33, 16, 'AWE000033', '贝贝南瓜', '+', 0, 0, '', 1000, '0.000', '8.28', '6.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>南瓜性温，小巧玲珑，惹人喜爱，香甜可口、糯软润滑</p><p><br/></p><p><strong>菜品产地：</strong>山东日照</p><p><br/></p><p><strong>包装规格：</strong>200g/包</p><p><img src="/data/attached/image/20151010/1444458095708140.jpg" title="1444458095708140.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458098267209.jpg" title="1444458098267209.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458102436220.jpg" title="1444458102436220.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458105214585.jpg" title="1444458105214585.jpg" alt="未标题-3_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/33_thumb_G_1444429319499.jpg', 'data/attached/images/201510/goods_img/33_G_1444429319736.jpg', 'data/attached/images/201510/source_img/33_G_1444429319723.jpg', 1, '', 1, 1, 0, 0, 1444429319, 20, 0, 1, 1, 1, 0, 0, 1445370794, 0, '', 1, 1, 0, NULL),
(34, 16, 'AWE000034', '上海青苗', '+', 0, 0, '', 1001, '0.000', '9.12', '7.60', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>碧绿色，株型束腰，纤维细，味甜口感好，茎嫩茎叶</p><p><br/></p><p><strong>菜品产地：</strong>云南陆良</p><p><br/></p><p><strong>包装规格：</strong>205克/袋</p><p><img src="/data/attached/image/20151010/1444466601728838.jpg" title="1444466601728838.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444466605997523.jpg" title="1444466605997523.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444466609232871.jpg" title="1444466609232871.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444466612514924.jpg" title="1444466612514924.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444466615466127.jpg" title="1444466615466127.jpg" alt="未标题-3_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/34_thumb_G_1444437825951.jpg', 'data/attached/images/201510/goods_img/34_G_1444437825053.jpg', 'data/attached/images/201510/source_img/34_G_1444437825875.jpg', 1, '', 1, 1, 0, 0, 1444437825, 1, 0, 1, 1, 1, 0, 0, 1444704299, 0, '', 1, 1, 0, NULL),
(35, 16, 'AWE000035', '黑土豆', '+', 0, 0, '', 0, '0.000', '0.00', '0.00', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>长椭圆形，果皮呈黑紫色，果肉为深紫色</p><p><br/></p><p><strong>菜品产地：</strong>甘肃兰州</p><p><br/></p><p><strong>包装规格：</strong>0.5 斤/袋</p><p><img src="/data/attached/image/20151010/1444468102675156.jpg" title="1444468102675156.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468106597063.jpg" title="1444468106597063.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468109964095.jpg" title="1444468109964095.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468112716784.jpg" title="1444468112716784.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468117893516.jpg" title="1444468117893516.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468120846055.jpg" title="1444468120846055.jpg" alt="未标题-3_06.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468123293360.jpg" title="1444468123293360.jpg" alt="未标题-3_07.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444468126779654.jpg" title="1444468126779654.jpg" alt="未标题-3_08.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/35_thumb_G_1444439341501.jpg', 'data/attached/images/201510/goods_img/35_G_1444439341086.jpg', 'data/attached/images/201510/source_img/35_G_1444439341868.jpg', 1, '', 0, 1, 0, 0, 1444439341, 100, 0, 1, 1, 1, 0, 0, 1445701973, 0, '', 1, 1, 0, NULL),
(86, 16, 'AWE000086', '美国西生菜', '+', 11, 0, '', 2, '0.000', '11.88', '9.90', '0.00', 0, 0, 1, '西生菜', '生菜从西方引进，故名西生菜。莴苣属菊科，叶用莴苣以新鲜嫩叶供食，外销以结球为主。西生菜为直根系，分布浅，吸水肥能力弱，结球莴苣的球形有圆形、扁圆形、圆锥形、圆筒形，质地柔嫩，为主要食用部分。', '<p>西生菜为直根系，分布浅，吸水肥能力弱，结球莴苣的球形有圆形、扁圆形、圆锥形、圆筒形，质地柔嫩，为主要食用部分。 &nbsp; &nbsp;产地：宁夏银川</p><ul class=" list-paddingleft-2" style="list-style-type: disc;"><li><h1 style="text-align: right;" dir="rtl"><img src="/data/attached/image/20151027/1445935189222650.png" title="1445935189222650.png" alt="20152929152934.png"   style="width: 754px; height: 720px;" width="100%" /><img src="/data/attached/image/20151027/1445935706633817.png" title="1445935706633817.png" alt="QQ截图20151027164429.png"   style="width: 764px; height: 548px;" width="100%" /></h1></li></ul>', 'data/attached/images/201510/thumb_img/86_thumb_G_1445903490125.jpg', 'data/attached/images/201510/goods_img/86_G_1445903490512.jpg', 'data/attached/images/201510/source_img/86_G_1445903490623.jpg', 1, '', 0, 1, 0, 0, 1445903258, 100, 0, 0, 0, 0, 0, 0, 1445906965, 0, '', -1, -1, 0, NULL),
(36, 16, 'AWE000036', '菠菜300g', '+', 0, 0, '', 1001, '0.000', '9.48', '7.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>叶色浓绿，叶片肥厚，口感清甜，无渣，富含维C</p><p><br/></p><p><strong>菜品产地：</strong>新西兰菠菜</p><p><br/></p><p><strong>包装规格：</strong>300g/包</p><p><img src="/data/attached/image/20151010/1444469701495051.jpg" title="1444469701495051.jpg" alt="未标题-4_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444469704861084.jpg" title="1444469704861084.jpg" alt="未标题-4_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444469709870306.jpg" title="1444469709870306.jpg" alt="未标题-4_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444469711341090.jpg" title="1444469711341090.jpg" alt="未标题-4_04.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444469714798002.jpg" title="1444469714798002.jpg" alt="未标题-4_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/36_thumb_G_1444440929309.jpg', 'data/attached/images/201510/goods_img/36_G_1444440929161.jpg', 'data/attached/images/201510/source_img/36_G_1444440929570.jpg', 1, '', 1, 1, 0, 0, 1444440929, 1, 0, 1, 1, 1, 0, 0, 1445315208, 0, '', 1, 1, 0, NULL),
(37, 16, 'AWE000037', '黄金牛蒡', '+', 0, 0, '', 1001, '0.000', '6.00', '5.00', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>独特的香气和纯正的口味，有“东洋参”的美誉</p><p><br/></p><p><strong>菜品产地：</strong>山东省日照市</p><p><br/></p><p><strong>包装规格：</strong>0.5 斤/袋</p><p><img src="/data/attached/image/20151010/1444475551216288.jpg" title="1444475551216288.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444475554413416.jpg" title="1444475554413416.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444475557753899.jpg" title="1444475557753899.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444475560867360.jpg" title="1444475560867360.jpg" alt="未标题-3_04.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444475563768104.jpg" title="1444475563768104.jpg" alt="未标题-3_05.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444475567848102.jpg" title="1444475567848102.jpg" alt="未标题-3_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/37_thumb_G_1444446777088.jpg', 'data/attached/images/201510/goods_img/37_G_1444446777439.jpg', 'data/attached/images/201510/source_img/37_G_1444446777291.jpg', 1, '', 1, 1, 0, 0, 1444446777, 100, 0, 1, 1, 1, 0, 0, 1444693118, 0, '', 1, 1, 0, NULL),
(38, 16, 'AWE000038', '迷你黄番薯500g', '+', 0, 0, '', 1001, '0.000', '8.28', '6.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>越南双皮黄番薯为旋花科一年生植物，蔓生草本</p><p><br/></p><p><strong>菜品产地：</strong>越南</p><p><br/></p><p><strong>包装规格：</strong>500g/袋</p><p><img src="/data/attached/image/20151012/1444616813788567.jpg" title="1444616813788567.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616817239061.jpg" title="1444616817239061.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616821186992.jpg" title="1444616821186992.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616826973580.jpg" title="1444616826973580.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616829962517.jpg" title="1444616829962517.jpg" alt="详情页_05.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616833297164.jpg" title="1444616833297164.jpg" alt="详情页_06.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444616836670632.jpg" title="1444616836670632.jpg" alt="详情页_07.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/38_thumb_G_1444588051456.jpg', 'data/attached/images/201510/goods_img/38_G_1444588051358.jpg', 'data/attached/images/201510/source_img/38_G_1444588051026.jpg', 1, '', 0, 1, 0, 0, 1444588051, 100, 0, 1, 1, 1, 0, 0, 1445702206, 0, '', 1, 1, 0, NULL),
(39, 16, 'AWE000039', '西芹', '+', 2, 0, '', 1000, '0.000', '11.76', '9.80', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>腹沟浅，淡绿色，纤维含量少，口感好，适合榨汁及炒食</p><p><br/></p><p><strong>菜品产地：</strong>云南省晋宁县</p><p><br/></p><p><strong>包装规格：</strong>650g/颗</p><p><img src="/data/attached/image/20151012/1444618290982980.jpg" title="1444618290982980.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444618293907688.jpg" title="1444618293907688.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444618296861100.jpg" title="1444618296861100.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444618300478092.jpg" title="1444618300478092.jpg" alt="详情页_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/39_thumb_G_1444589522099.jpg', 'data/attached/images/201510/goods_img/39_G_1444589522163.jpg', 'data/attached/images/201510/source_img/39_G_1444589522751.jpg', 1, '', 1, 1, 0, 0, 1444589522, 1, 0, 1, 1, 1, 0, 0, 1445569453, 0, '', 1, 1, 0, NULL),
(40, 16, 'AWE000040', '板栗香薯', '+', 0, 0, '', 1001, '0.000', '6.48', '5.40', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>甜度适中，香气淡雅沁人心脾，多粉且嫩外不带筋，口感独特内无纤维，色泽迷人鲜亮有加，营养丰富有益健康。</p><p><br/></p><p><strong>菜品产地：</strong>海南</p><p><br/></p><p><strong>包装规格：</strong>0.5 斤/袋</p><p><img src="/data/attached/image/20151012/1444619522703875.jpg" title="1444619522703875.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444619526167490.jpg" title="1444619526167490.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444619530578891.jpg" title="1444619530578891.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444619533306505.jpg" title="1444619533306505.jpg" alt="详情页_05.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444619536163580.jpg" title="1444619536163580.jpg" alt="详情页_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/40_thumb_G_1444590749427.jpg', 'data/attached/images/201510/goods_img/40_G_1444590749493.jpg', 'data/attached/images/201510/source_img/40_G_1444590749402.jpg', 1, '', 0, 1, 0, 0, 1444590749, 20, 0, 1, 1, 1, 0, 0, 1445701931, 0, '', 1, 1, 0, NULL),
(41, 20, 'AWE000041', '万力山野茶油（1.8L）', '+', 0, 0, '', 1001, '0.000', '345.59', '288.00', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>山茶油本身不含胆固醇，不饱和脂肪酸丰富，能调整人体的胆固醇，预防心血管疾病</p><p><br/></p><p><strong>菜品产地：</strong>广西巴马</p><p><br/></p><p><strong>包装规格：</strong>2.88 斤/瓶</p><p><img src="/data/attached/image/20151012/1444620780419271.jpg" title="1444620780419271.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444620783621223.jpg" title="1444620783621223.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444620790842638.jpg" title="1444620790842638.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444620794437174.jpg" title="1444620794437174.jpg" alt="xiangqingye_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444620799135890.jpg" title="1444620799135890.jpg" alt="xiangqingye_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/41_thumb_G_1444592011908.jpg', 'data/attached/images/201510/goods_img/41_G_1444592011432.jpg', 'data/attached/images/201510/source_img/41_G_1444592011081.jpg', 1, '', 0, 1, 0, 0, 1444592011, 100, 0, 1, 1, 1, 0, 0, 1445701899, 0, '', 1, 1, 0, NULL),
(42, 16, 'AWE000042', '银丝旺菜300g', '+', 0, 0, '', 1001, '0.000', '9.48', '7.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>个头比娃娃菜小，味道比娃娃菜更清甜</p><p><br/></p><p><strong>菜品产地：</strong>云南陆良</p><p><br/></p><p><strong>包装规格：</strong>300g/包</p><p><img src="/data/attached/image/20151012/1444622068778263.jpg" title="1444622068778263.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444622071196699.jpg" title="1444622071196699.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444622075232040.jpg" title="1444622075232040.jpg" alt="xiangqingye_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/42_thumb_G_1444593289453.jpg', 'data/attached/images/201510/goods_img/42_G_1444593289498.jpg', 'data/attached/images/201510/source_img/42_G_1444593289761.jpg', 1, '', 1, 1, 0, 0, 1444593289, 1, 0, 1, 1, 1, 0, 0, 1445315562, 0, '', 1, 1, 0, NULL),
(43, 16, 'AWE000043', '贝贝南瓜200g', '+', 0, 0, '', 1001, '0.000', '8.28', '6.90', '0.00', 0, 0, 0, '', '', '<p><strong>特色：</strong>南瓜性温，小巧玲珑，惹人喜爱，香甜可口、糯软润滑</p><p><br/></p><p><strong>菜品产地：</strong>山东日照</p><p><br/></p><p><strong>包装规格：</strong>200g/个</p><p><img src="/data/attached/image/20151010/1444458095708140.jpg" title="1444458095708140.jpg" alt="未标题-3_01.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458098267209.jpg" title="1444458098267209.jpg" alt="未标题-3_02.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458102436220.jpg" title="1444458102436220.jpg" alt="未标题-3_03.jpg"  width="100%" /><img src="/data/attached/image/20151010/1444458105214585.jpg" title="1444458105214585.jpg" alt="未标题-3_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/43_thumb_G_1444604840160.jpg', 'data/attached/images/201510/goods_img/43_G_1444604840845.jpg', 'data/attached/images/201510/source_img/43_G_1444604840523.jpg', 1, '', 1, 1, 0, 0, 1444593326, 100, 0, 1, 1, 1, 0, 0, 1445567964, 0, '', 1, 1, 0, NULL),
(44, 22, 'AWE000044', '连山野生灵芝', '+', 0, 0, '', 0, '0.000', '0.00', '0.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>连山野生灵芝黑泽乌亮、是中国最珍贵而又稀少的野生草本植物。灵芝生于阔叶树的基部或朽木上，树木的腐朽伤痕上，有时也生于针叶树上，一年生真菌，少数多年生</p><p><br/></p><p><strong>产地：</strong>清远连山大瑶山</p><p><img src="/data/attached/image/20151012/1444630743948644.jpg" title="1444630743948644.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444630746161294.jpg" title="1444630746161294.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444630752607091.jpg" title="1444630752607091.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444630756469701.jpg" title="1444630756469701.jpg" alt="xiangqingye_04.jpg"  width="100%" /></p><p><br/></p>', 'data/attached/images/201510/thumb_img/44_thumb_G_1444601969478.jpg', 'data/attached/images/201510/goods_img/44_G_1444601969691.jpg', 'data/attached/images/201510/source_img/44_G_1444601969106.jpg', 1, '', 0, 1, 0, 0, 1444601969, 100, 0, 1, 1, 1, 0, 0, 1445701894, 0, '', 1, 1, 0, NULL);
INSERT INTO `cs_goods` (`goods_id`, `cat_id`, `goods_sn`, `goods_name`, `goods_name_style`, `click_count`, `brand_id`, `provider_name`, `goods_number`, `goods_weight`, `market_price`, `shop_price`, `promote_price`, `promote_start_date`, `promote_end_date`, `warn_number`, `keywords`, `goods_brief`, `goods_desc`, `goods_thumb`, `goods_img`, `original_img`, `is_real`, `extension_code`, `is_on_sale`, `is_alone_sale`, `is_shipping`, `integral`, `add_time`, `sort_order`, `is_delete`, `is_best`, `is_new`, `is_hot`, `is_promote`, `bonus_type_id`, `last_update`, `goods_type`, `seller_note`, `give_integral`, `rank_integral`, `suppliers_id`, `is_check`) VALUES
(45, 19, 'AWE000045', '清远家鸡蛋6个', '+', 2, 0, '', 0, '0.000', '18.00', '15.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>清远家鸡蛋外观个稍小、壳稍薄，色浅，蛋黄颜色比饲养蛋要红，一层薄薄的白色的膜、味鲜美、营养高</p><p><br/></p><p><strong>产地：</strong>清远英德</p><p><br/></p><p><strong>包装规格：</strong>6个/盒</p><p><img src="/data/attached/image/20151012/1444632024314545.jpg" title="1444632024314545.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444632028821381.jpg" title="1444632028821381.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444632031628009.jpg" title="1444632031628009.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444632035576270.jpg" title="1444632035576270.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444632039888498.jpg" title="1444632039888498.jpg" alt="详情页_05.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444632042918571.jpg" title="1444632042918571.jpg" alt="详情页_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/45_thumb_G_1444603253160.jpg', 'data/attached/images/201510/goods_img/45_G_1444603253432.jpg', 'data/attached/images/201510/source_img/45_G_1444603253778.jpg', 1, '', 0, 1, 0, 0, 1444603253, 100, 0, 1, 1, 1, 0, 0, 1445701450, 0, '', 1, 1, 0, NULL),
(46, 20, 'AWE000046', '青塘米粉', '+', 3, 0, '', 1001, '0.000', '11.76', '9.80', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>青塘米粉粉条洁白、均勻、富有彈性，口感爽滑。可炒、可汤煮，水煮不糊汤，干炒不断，香滑爽口、筋道十足</p><p><br/></p><p><strong>产地：</strong>清远英德青塘</p><p><br/></p><p><strong>包装规格：</strong>500克/袋</p><p><img  title="1444638999893941.jpg" alt="xiqngqingye_01.jpg" src="/data/attached/image/20151012/1444638999893941.jpg" width="100%" /><img  title="1444639001253104.jpg" alt="xiqngqingye_02.jpg" src="/data/attached/image/20151012/1444639001253104.jpg" width="100%" /><img  title="1444639005963449.jpg" alt="xiqngqingye_03.jpg" src="/data/attached/image/20151012/1444639005963449.jpg" width="100%" /><img  title="1444639009173422.jpg" alt="xiqngqingye_04.jpg" src="/data/attached/image/20151012/1444639009173422.jpg" width="100%" /><img  title="1444639013615469.jpg" alt="xiqngqingye_06.jpg" src="/data/attached/image/20151012/1444639013615469.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/46_thumb_G_1444610232148.jpg', 'data/attached/images/201510/goods_img/46_G_1444610232489.jpg', 'data/attached/images/201510/source_img/46_G_1444610232120.jpg', 1, '', 1, 1, 0, 0, 1444610232, 100, 0, 1, 1, 1, 0, 0, 1445567824, 0, '', 1, 1, 0, NULL),
(47, 16, 'AWE000047', '西牛麻竹笋', '+', 0, 0, '', 0, '0.000', '0.00', '0.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>竹笋就是竹类的嫩茎和嫩芽。其肉层厚实、质地细嫩、清脆爽口、笋味香浓享誉菜中珍品</p><p><br/></p><p><strong>产地：</strong>英德西牛镇</p><p><img src="/data/attached/image/20151012/1444640201879527.jpg" title="1444640201879527.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444640205985519.jpg" title="1444640205985519.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444640208961572.jpg" title="1444640208961572.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444640213742744.jpg" title="1444640213742744.jpg" alt="xiangqingye_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444640217732934.jpg" title="1444640217732934.jpg" alt="xiangqingye_06.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444640219853593.jpg" title="1444640219853593.jpg" alt="xiangqingye_07.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/47_thumb_G_1444611822461.jpg', 'data/attached/images/201510/goods_img/47_G_1444611822541.jpg', 'data/attached/images/201510/source_img/47_G_1444611822972.jpg', 1, '', 0, 1, 0, 0, 1444611822, 20, 0, 1, 1, 1, 0, 0, 1445701440, 0, '', 1, 1, 0, NULL),
(48, 16, 'AWE000048', '九龙豆腐', '+', 0, 0, '', 0, '0.000', '0.00', '0.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>英德九龙豆腐外表白而不亮，细若凝脂；摸起来嫩而不滑，以鲜、嫩、滑而著称</p><p><br/></p><p><strong>产地：</strong>英德九龙镇</p><p><img src="/data/attached/image/20151012/1444644000308257.jpg" title="1444644000308257.jpg" alt="xiangqingye.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/48_thumb_G_1444615208206.jpg', 'data/attached/images/201510/goods_img/48_G_1444615208603.jpg', 'data/attached/images/201510/source_img/48_G_1444615208297.jpg', 1, '', 0, 1, 0, 0, 1444615208, 100, 0, 1, 1, 1, 0, 0, 1445701435, 0, '', 1, 1, 0, NULL),
(49, 24, 'AWE000049', '客家纯米酒500g', '+', 1, 0, '', 1001, '0.000', '45.60', '38.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>客家米酒历史悠久，素有“南粤佳酿”美称民间的传统产品，是一种汉族传统名酒。早在唐朝客家米酒就已十分出名，唐朝名相张九龄描绘客家米酒的一首诗，《题谢公楼》，将客家米酒的色、香、味描绘入木三分。</p><p><br/></p><p><strong>产地：</strong>英德桥头</p><p><br/></p><p><strong>包装规格：</strong>500g/瓶</p><p><img src="/data/attached/image/20151012/1444649453168157.jpg" title="1444649453168157.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444649460334909.jpg" title="1444649460334909.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444649463822918.jpg" title="1444649463822918.jpg" alt="详情页_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/49_thumb_G_1444620676367.jpg', 'data/attached/images/201510/goods_img/49_G_1444620676116.jpg', 'data/attached/images/201510/source_img/49_G_1444620676159.jpg', 1, '', 1, 1, 0, 0, 1444620676, 100, 0, 1, 1, 1, 0, 0, 1445567752, 0, '', 1, 1, 0, NULL),
(50, 21, 'AWE000050', '英德生态米  5kg装', '+', 0, 0, '', 1001, '5.000', '70.80', '59.00', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>英德是国家优质米生产基地，并被农业部定为全国农业产业化试点市（县）之一。英德多山区丘陵缓坡，森林覆盖，土层深且肥沃，土壤以水稻土、赤红壤为主，年均气温达20.7℃，雨量丰富，土地肥沃、水源丰富。英德大米依赖那里独特的气候和土壤、水质、气候和人文等因素，孕育了英德大米其独特品质。米质观感晶莹光亮，富有光泽和油质感。米粒修长，无腹白，晶莹剔透、半透明，富有油质感，成饭量多，入口香滑而软硬适中。</p><p><img title="1444650330464045.jpg" alt="详情页_01.jpg" src="/data/attached/image/20151012/1444650330464045.jpg"  width="100%" /><img title="1444650334230233.jpg" alt="详情页_02.jpg" src="/data/attached/image/20151012/1444650334230233.jpg"  width="100%" /><img title="1444650337677515.jpg" alt="详情页_03.jpg" src="/data/attached/image/20151012/1444650337677515.jpg"  width="100%" /><img title="1444650340342221.jpg" alt="详情页_04.jpg" src="/data/attached/image/20151012/1444650340342221.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/50_thumb_G_1444621555089.jpg', 'data/attached/images/201510/goods_img/50_G_1444621555574.jpg', 'data/attached/images/201510/source_img/50_G_1444621555087.jpg', 1, '', 1, 1, 0, 0, 1444621555, 100, 0, 1, 1, 1, 0, 0, 1445701397, 0, '', 1, 1, 0, NULL),
(51, 16, 'AWE000051', '生菜', '+', 13, 0, '', 1001, '0.000', '7.08', '5.90', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151012/1444651517684696.jpg" title="1444651517684696.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444651520704129.jpg" title="1444651520704129.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444651523125753.jpg" title="1444651523125753.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444651526438196.jpg" title="1444651526438196.jpg" alt="xiangqingye_04.jpg"  width="100%" /><img src="/data/attached/image/20151012/1444651529316665.jpg" title="1444651529316665.jpg" alt="xiangqingye_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/51_thumb_G_1444622740233.jpg', 'data/attached/images/201510/goods_img/51_G_1444622740997.jpg', 'data/attached/images/201510/source_img/51_G_1444622740282.jpg', 1, '', 1, 1, 0, 0, 1444622740, 1, 0, 1, 1, 1, 0, 0, 1460487614, 0, '', 1, 1, 0, NULL),
(52, 16, 'AWE000052', '芥兰300g', '+', 3, 0, '', 1001, '0.000', '7.08', '5.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>菜苔柔嫩、鲜脆、清甜、味鲜，入口柔嫩爽脆之外又略具芥辣清香菜品</p><p><br/></p><p><strong>产地：</strong>云南陆良</p><p><br/></p><p><strong>包装规格：</strong>300g/包</p><p><img src="/data/attached/image/20151013/1444726346342632.jpg" title="1444726346342632.jpg" alt="未标题-1_01.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444726350557134.jpg" title="1444726350557134.jpg" alt="未标题-1_03.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444726353592071.jpg" title="1444726353592071.jpg" alt="未标题-1_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/52_thumb_G_1444698108633.jpg', 'data/attached/images/201510/goods_img/52_G_1444698108637.jpg', 'data/attached/images/201510/source_img/52_G_1444698108451.jpg', 1, '', 1, 1, 0, 0, 1444697557, 1, 0, 1, 1, 1, 0, 0, 1445315029, 0, '', 0, 0, 0, NULL),
(53, 16, 'AWE000053', '顺宝芥兰仔250g', '+', 14, 0, '', 1001, '0.000', '7.43', '6.20', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>芥蓝的嫩茎，菜苔柔嫩、鲜脆、清甜、味鲜菜品</p><p><br/></p><p><strong>产地：</strong>云南陆良</p><p><br/></p><p><strong>包装规格：</strong>0.5 斤/袋</p><p><img src="/data/attached/image/20151013/1444727924575019.jpg" title="1444727924575019.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444727927899956.jpg" title="1444727927899956.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444727930389319.jpg" title="1444727930389319.jpg" alt="xiangqingye_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/53_thumb_G_1444699141558.jpg', 'data/attached/images/201510/goods_img/53_G_1444699141483.jpg', 'data/attached/images/201510/source_img/53_G_1444699141760.jpg', 1, '', 1, 1, 0, 0, 1444699141, 1, 0, 1, 1, 1, 0, 0, 1447956161, 0, '', 1, 1, 0, NULL),
(54, 16, 'AWE000054', '白菜仔250g', '+', 2, 0, '', 1001, '0.000', '9.60', '8.00', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>白菜仔可煮食或炒食，亦可做成菜汤或者凉拌食用菜品</p><p><br/></p><p><strong>产地：</strong>云南陆良</p><p><br/></p><p><strong>包装规格：</strong>250g/包</p><p><img src="/data/attached/image/20151013/1444728572984630.jpg" title="1444728572984630.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444728575408127.jpg" title="1444728575408127.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444728578315538.jpg" title="1444728578315538.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444728582786294.jpg" title="1444728582786294.jpg" alt="xiangqingye_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/54_thumb_G_1444699790561.jpg', 'data/attached/images/201510/goods_img/54_G_1444699790510.jpg', 'data/attached/images/201510/source_img/54_G_1444699790693.jpg', 1, '', 1, 1, 0, 0, 1444699790, 1, 0, 1, 1, 1, 0, 0, 1445569664, 0, '', 1, 1, 0, NULL),
(71, 16, 'AWE000071', '日本紫心番薯', '+', 0, 0, '', 1000, '0.000', '10.56', '8.80', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>营养价值丰富，含有大量的功效奇特、药用价值较高的花青素。</p><p><br/></p><p><strong>菜品产地：</strong>云南省晋宁市</p><p><br/></p><p><strong>包装规格：</strong>500g/袋</p><p><img src="/data/attached/image/20151023/1445599362776492.jpg" title="1445599362776492.jpg" alt="问问.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/71_thumb_G_1445570574410.jpg', 'data/attached/images/201510/goods_img/71_G_1445570574690.jpg', 'data/attached/images/201510/source_img/71_G_1445570574567.jpg', 1, '', 1, 1, 0, 0, 1445570574, 101, 0, 1, 1, 1, 0, 0, 1445570983, 0, '', -1, -1, 0, NULL),
(55, 16, 'AWE000055', '黄秋葵150g', '+', 0, 0, '', 1001, '0.000', '8.28', '6.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>黄秋葵为草本植物，其脆嫩多汁，滑润不腻，香味独特，深受百姓青睐</p><p><br/></p><p><strong>菜品产地：</strong>山东日照</p><p><br/></p><p><strong>包装规格：</strong>150g/碟</p><p><img src="/data/attached/image/20151013/1444731317478407.jpg" title="1444731317478407.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444731320633702.jpg" title="1444731320633702.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444731323233229.jpg" title="1444731323233229.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444731326784315.jpg" title="1444731326784315.jpg" alt="xiangqingye_04.jpg"  width="100%" /><img src="/data/attached/image/20151013/1444731329826267.jpg" title="1444731329826267.jpg" alt="xiangqingye_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/55_thumb_G_1444702539935.jpg', 'data/attached/images/201510/goods_img/55_G_1444702539790.jpg', 'data/attached/images/201510/source_img/55_G_1444702539154.jpg', 1, '', 1, 1, 0, 0, 1444702539, 20, 0, 1, 1, 1, 0, 0, 1445567125, 0, '', 1, 1, 0, NULL),
(56, 16, 'AWE000056', '连州菜心300g', '+', 0, 0, '', 1001, '0.000', '11.76', '9.80', '0.00', 0, 0, 1, '', '', '<p><strong>菜品产地：</strong>广东连州</p><p><br/></p><p><strong>包装规格：</strong>300g/包</p><p><img src="/data/attached/image/20151013/1444732105576463.jpg" title="1444732105576463.jpg" alt="caixin.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/56_thumb_G_1444703315345.jpg', 'data/attached/images/201510/goods_img/56_G_1444703315989.jpg', 'data/attached/images/201510/source_img/56_G_1444703315559.jpg', 1, '', 1, 1, 0, 0, 1444703315, 1, 0, 1, 1, 1, 0, 0, 1445314773, 0, '', 1, 1, 0, NULL),
(57, 22, 'AWE000057', '云南大姚优质薄壳核桃300g', '+', 0, 0, '', 1001, '0.000', '26.40', '22.00', '0.00', 0, 0, 1, '', '', '<p style="margin-bottom: 5px;">特点：云南大姚优质薄壳核桃具有壳薄0.8至1.2毫米,光滑麻线浅细，果大、壳薄、仁白、高蛋白、低油脂等优点。薄壳核桃味香甜，口味极佳；含油率高达73.4% ，出仁率52%，深受国内外消费者晴睐，是中国核桃中的上品。国际贸易交易中占有很高的声誉。1983年被国家外经部评为优质出口产品并获荣誉证书，2000年通过了欧盟有机食品认证。云南大姚优质薄壳核桃产品远销欧盟、北京、上海、广州、成都、昆明等国内外，深受消费者好评。2005年4月举办了首届核桃美食大赛，营造了具有民族特色的核桃饮食文化。</p><p style="margin-bottom: 5px;"><br/></p><p style="margin-bottom: 5px;"><img src="/data/attached/image/20151014/1444792150467183.jpg" title="1444792150467183.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444792153461756.jpg" title="1444792153461756.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444792156781494.jpg" title="1444792156781494.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444792160696667.jpg" title="1444792160696667.jpg" alt="xiangqingye_04.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444792162396065.jpg" title="1444792162396065.jpg" alt="xiangqingye_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/57_thumb_G_1444763376423.jpg', 'data/attached/images/201510/goods_img/57_G_1444763376264.jpg', 'data/attached/images/201510/source_img/57_G_1444763376826.jpg', 1, '', 1, 1, 0, 0, 1444763376, 100, 0, 1, 1, 1, 0, 0, 1445379337, 0, '', 1, 1, 0, NULL),
(58, 22, 'AWE000058', '冠圣生有机野生葛根粉250g', '+', 1, 0, '', 1001, '0.000', '27.36', '22.80', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151014/1444793215403942.jpg" title="1444793215403942.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444793218700594.jpg" title="1444793218700594.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444793221845430.jpg" title="1444793221845430.jpg" alt="详情页_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/58_thumb_G_1444764433891.jpg', 'data/attached/images/201510/goods_img/58_G_1444764433915.jpg', 'data/attached/images/201510/source_img/58_G_1444764433992.jpg', 1, '', 1, 1, 0, 0, 1444764433, 100, 0, 1, 1, 1, 0, 0, 1447956987, 0, '', 1, 1, 0, NULL),
(59, 16, 'AWE000059', '美国散叶生菜250g', '+', 16, 0, '', 1001, '0.000', '7.08', '5.90', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>美国引进品种，叶色翠绿，清甜爽脆是本菜品的特色，适合清炒及火锅</p><p><br/></p><p><strong>菜品产地：</strong>云南省陆良县</p><p><br/></p><p><strong>包装规格：</strong>0.5 斤/袋</p><p><img src="/data/attached/image/20151014/1444795789757594.jpg" title="1444795789757594.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444795792177835.jpg" title="1444795792177835.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444795795301019.jpg" title="1444795795301019.jpg" alt="详情页_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/59_thumb_G_1444765321983.jpg', 'data/attached/images/201510/goods_img/59_G_1444765321494.jpg', 'data/attached/images/201510/source_img/59_G_1444765321110.jpg', 1, '', 1, 1, 0, 0, 1444765321, 1, 0, 1, 1, 1, 0, 0, 1445701211, 0, '', 1, 1, 0, NULL),
(60, 16, 'AWE000060', '青尖椒150g', '+', 0, 0, '', 1001, '0.000', '6.35', '5.30', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>香辣型的辣椒，微辣 ，油质大</p><p><br/></p><p><strong>菜品产地：</strong>宁夏贺兰县</p><p><br/></p><p><strong>包装规格：</strong>150g/包</p><p><img src="/data/attached/image/20151014/1444805070314541.jpg" title="1444805070314541.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444805082688555.jpg" title="1444805082688555.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444805109447758.jpg" title="1444805109447758.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444805113860977.jpg" title="1444805113860977.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444805125880815.jpg" title="1444805125880815.jpg" alt="详情页_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/60_thumb_G_1444776336126.jpg', 'data/attached/images/201510/goods_img/60_G_1444776336117.jpg', 'data/attached/images/201510/source_img/60_G_1444776336862.jpg', 1, '', 1, 1, 0, 0, 1444776336, 100, 0, 1, 1, 1, 0, 0, 1445566885, 0, '', 1, 1, 0, NULL),
(61, 24, 'AWE000061', '板栗500g', '+', 0, 0, '', 1001, '0.000', '21.12', '17.60', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>据史书记载，由明朝开始，广西隆安就开始板栗的种植，早有板栗之乡的美誉。隆安板栗籽粒大，果皮赤褐油亮，果肉甜，质地香糯，品质极佳</p><p><br/></p><p><strong>菜品产地：</strong>广西隆安</p><p><br/></p><p><strong>包装规格：</strong>500g/袋</p><p><img src="/data/attached/image/20151014/1444806293890371.jpg" title="1444806293890371.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444806300647935.jpg" title="1444806300647935.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444806313637366.jpg" title="1444806313637366.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444806317143838.jpg" title="1444806317143838.jpg" alt="详情页_04.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444806318461879.jpg" title="1444806318461879.jpg" alt="详情页_05.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/61_thumb_G_1444777529965.jpg', 'data/attached/images/201510/goods_img/61_G_1444777529520.jpg', 'data/attached/images/201510/source_img/61_G_1444777529857.jpg', 1, '', 1, 1, 0, 0, 1444777529, 100, 0, 1, 1, 1, 0, 0, 1445566795, 0, '', 1, 1, 0, NULL),
(62, 24, 'AWE000062', '孝感米酒400g', '+', 1, 0, '', 1001, '0.000', '7.09', '5.91', '0.00', 0, 0, 1, '', '', '<p><img title="1444808099186991.jpg" alt="xiangqingye_01.jpg" src="/data/attached/image/20151014/1444808099186991.jpg"  width="100%" /><img title="1444808102311403.jpg" alt="xiangqingye_02.jpg" src="/data/attached/image/20151014/1444808102311403.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/62_thumb_G_1444779313620.jpg', 'data/attached/images/201510/goods_img/62_G_1444779313913.jpg', 'data/attached/images/201510/source_img/62_G_1444779313640.jpg', 1, '', 1, 1, 0, 0, 1444779313, 100, 0, 1, 1, 1, 0, 0, 1447957094, 0, '', 1, 1, 0, NULL),
(63, 21, 'AWE000063', '苦荞米  250g', '+', 0, 0, '', 1001, '0.000', '12.96', '10.80', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>云荞源苦荞米采用云南海拔2500米以上高寒山区的苦荞为原料，结合彝族彝家秘方与现代科学技术，精心研制而成。闻之清香淡雅，尝之沁人心脾，看世间万象，赏红尘人生，行走于天地之间，涤尽凡尘，淡看云舒云卷，悠哉悠哉。</p><p><br/></p><p><strong>包装规格：</strong>苦荞米480克/袋，荞麦，煮食食物。整箱20袋</p><p><img title="1444808803714234.jpg" alt="xiangqingye_01.jpg" src="/data/attached/image/20151014/1444808803714234.jpg"  width="100%" /><img title="1444808815389110.jpg" alt="xiangqingye_02.jpg" src="/data/attached/image/20151014/1444808815389110.jpg"  width="100%" /><img title="1444808826723521.jpg" alt="xiangqingye_03.jpg" src="/data/attached/image/20151014/1444808826723521.jpg"  width="100%" /><img title="1444808830312701.jpg" alt="xiangqingye_04.jpg" src="/data/attached/image/20151014/1444808830312701.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/63_thumb_G_1444780069951.jpg', 'data/attached/images/201510/goods_img/63_G_1444780069830.jpg', 'data/attached/images/201510/source_img/63_G_1444780069249.jpg', 1, '', 1, 1, 0, 0, 1444780069, 100, 0, 1, 1, 1, 0, 0, 1445566599, 0, '', -1, -1, 0, NULL),
(64, 21, 'AWE000064', '云南梯田红米 250g', '+', 2, 0, '', 1001, '0.000', '15.23', '12.70', '0.00', 0, 0, 1, '', '', '<p><strong>特点：</strong>红米主要生长于世界文化遗产地核心区--元阳哈尼梯田，老品种，基因稳定不退化，采用近原始的耕种方式，施农家肥，引用山泉水灌溉，属原生态农作物，口感软糯。具有极高的营养价值，是宴请宾客和馈赠亲友的佳品。</p><p><img  title="1444809993640487.jpg" alt="xiangqingye_01.jpg" src="/data/attached/image/20151014/1444809993640487.jpg" width="100%" /><img  title="1444809996883753.jpg" alt="xiangqingye_02.jpg" src="/data/attached/image/20151014/1444809996883753.jpg" width="100%" /><img  title="1444809999735550.jpg" alt="xiangqingye_03.jpg" src="/data/attached/image/20151014/1444809999735550.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/64_thumb_G_1444781211373.jpg', 'data/attached/images/201510/goods_img/64_G_1444781211160.jpg', 'data/attached/images/201510/source_img/64_G_1444781211708.jpg', 1, '', 1, 1, 0, 0, 1444781211, 100, 0, 1, 1, 1, 0, 0, 1445566653, 0, '', 1, 1, 0, NULL),
(65, 22, 'AWE000065', '古方手工红糖  265g', '+', 1, 0, '', 1001, '0.000', '78.00', '65.00', '0.00', 0, 0, 1, '', '', '<p><img title="1444810947310187.jpg" alt="详情页_01.jpg" src="/data/attached/image/20151014/1444810947310187.jpg"  width="100%" /><img title="1444810950725159.jpg" alt="详情页_02.jpg" src="/data/attached/image/20151014/1444810950725159.jpg"  width="100%" /><img title="1444810955778194.jpg" alt="详情页_03.jpg" src="/data/attached/image/20151014/1444810955778194.jpg"  width="100%" /><img title="1444810959804489.jpg" alt="详情页_04.jpg" src="/data/attached/image/20151014/1444810959804489.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/65_thumb_G_1444782174066.jpg', 'data/attached/images/201510/goods_img/65_G_1444782174792.jpg', 'data/attached/images/201510/source_img/65_G_1444782174432.jpg', 1, '', 1, 1, 0, 0, 1444782174, 100, 0, 1, 1, 1, 0, 0, 1445972053, 0, '', 1, 1, 0, NULL),
(66, 24, 'AWE000066', '豆奶300g（黑豆/五谷）', '+', 2, 0, '', 1001, '0.000', '22.80', '19.00', '0.00', 0, 0, 1, '', '', '<p><img title="1444811680966168.jpg" alt="详情页_01.jpg" src="/data/attached/image/20151014/1444811680966168.jpg"  width="100%" /><img title="1444811683988956.jpg" alt="详情页_02.jpg" src="/data/attached/image/20151014/1444811683988956.jpg"  width="100%" /><img title="1444811686324847.jpg" alt="详情页_03.jpg" src="/data/attached/image/20151014/1444811686324847.jpg"  width="100%" /><img title="1444811689661449.jpg" alt="详情页_04.jpg" src="/data/attached/image/20151014/1444811689661449.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/66_thumb_G_1444782905286.jpg', 'data/attached/images/201510/goods_img/66_G_1444782905270.jpg', 'data/attached/images/201510/source_img/66_G_1444782905055.jpg', 1, '', 1, 1, 0, 0, 1444782905, 100, 0, 1, 1, 1, 0, 0, 1445804477, 0, '', 1, 1, 0, NULL),
(67, 24, 'AWE000067', '东湖桂花藕粉248g', '+', 1, 0, '', 1001, '0.000', '18.96', '15.80', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151014/1444812343689142.jpg" title="1444812343689142.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444812345365186.jpg" title="1444812345365186.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151014/1444812348183224.jpg" title="1444812348183224.jpg" alt="xiangqingye_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/67_thumb_G_1444783558143.jpg', 'data/attached/images/201510/goods_img/67_G_1444783558433.jpg', 'data/attached/images/201510/source_img/67_G_1444783558747.jpg', 1, '', 1, 1, 0, 0, 1444783558, 100, 0, 1, 1, 1, 0, 0, 1445806832, 0, '', 1, 1, 0, NULL),
(70, 16, 'AWE000070', '小唐菜300g', '+', 2, 0, '', 1000, '0.000', '9.48', '7.90', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151021/1445395030929518.jpg" title="1445395030929518.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151021/1445395035656766.jpg" title="1445395035656766.jpg" alt="详情页_02.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/70_thumb_G_1445366255943.jpg', 'data/attached/images/201510/goods_img/70_G_1445366255853.jpg', 'data/attached/images/201510/source_img/70_G_1445366255753.jpg', 1, '', 1, 1, 0, 0, 1445366255, 2, 0, 1, 1, 1, 0, 0, 1445366373, 0, '', 1, 1, 0, NULL),
(72, 16, 'AWE000072', '云南迷你薯仔', '+', 0, 0, '', 1001, '0.000', '7.80', '6.50', '0.00', 0, 0, 1, '', '', '<p><strong>特色：</strong>云薯皮光滑，芽眼为红色，是云南昆明的特色土豆品种。</p><p><br/></p><p><strong>菜品产地：</strong>云南省昆明市</p><p><br/></p><p><strong>包装规格：</strong>500克/袋</p><p><img src="/data/attached/image/20151023/1445599743449210.jpg" title="1445599743449210.jpg" alt="未标题-1_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445599746563558.jpg" title="1445599746563558.jpg" alt="未标题-1_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445599749846336.jpg" title="1445599749846336.jpg" alt="未标题-1_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/72_thumb_G_1445570958824.jpg', 'data/attached/images/201510/goods_img/72_G_1445570958566.jpg', 'data/attached/images/201510/source_img/72_G_1445570958787.jpg', 1, '', 1, 1, 0, 0, 1445570958, 100, 0, 1, 1, 1, 0, 0, 1445570980, 0, '', -1, -1, 0, NULL),
(73, 16, 'AWE000073', '白菜心300g', '+', 2, 0, '', 1001, '0.000', '8.28', '6.90', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445600099365196.jpg" title="1445600099365196.jpg" alt="xiangqingye_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600101454794.jpg" title="1445600101454794.jpg" alt="xiangqingye_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600104185355.jpg" title="1445600104185355.jpg" alt="xiangqingye_03.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600107199412.jpg" title="1445600107199412.jpg" alt="xiangqingye_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/73_thumb_G_1445571335446.jpg', 'data/attached/images/201510/goods_img/73_G_1445571335404.jpg', 'data/attached/images/201510/source_img/73_G_1445571335948.jpg', 1, '', 1, 1, 0, 0, 1445571317, 1, 0, 1, 1, 1, 0, 0, 1445571346, 0, '', -1, -1, 0, NULL),
(74, 16, 'AWE000074', '蒜头3粒装', '+', 2, 0, '', 0, '0.000', '6.72', '5.60', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445600742929449.jpg" title="1445600742929449.jpg" alt="未标题-1_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600745144752.jpg" title="1445600745144752.jpg" alt="未标题-1_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600748573730.jpg" title="1445600748573730.jpg" alt="未标题-1_03.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600751821693.jpg" title="1445600751821693.jpg" alt="未标题-1_04.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600754935874.jpg" title="1445600754935874.jpg" alt="未标题-1_05.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600760419937.jpg" title="1445600760419937.jpg" alt="未标题-1_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/74_thumb_G_1445571974885.jpg', 'data/attached/images/201510/goods_img/74_G_1445571974809.jpg', 'data/attached/images/201510/source_img/74_G_1445571974922.jpg', 1, '', 1, 1, 0, 0, 1445571974, 100, 0, 1, 1, 1, 0, 0, 1445700237, 0, '', -1, -1, 0, NULL),
(75, 21, 'AWE000075', '米10斤', '+', 0, 0, '', 1001, '0.000', '58.80', '49.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445600919679498.jpg" title="1445600919679498.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600923219543.jpg" title="1445600923219543.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600926293372.jpg" title="1445600926293372.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445600929928850.jpg" title="1445600929928850.jpg" alt="详情页_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/75_thumb_G_1445572141318.jpg', 'data/attached/images/201510/goods_img/75_G_1445572141289.jpg', 'data/attached/images/201510/source_img/75_G_1445572141849.jpg', 1, '', 0, 1, 0, 0, 1445572141, 100, 0, 1, 1, 1, 0, 0, 1445701026, 0, '', 1, 1, 0, NULL),
(76, 21, 'AWE000076', '米1斤', '+', 0, 0, '', 1001, '0.000', '6.96', '5.80', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445601014977430.jpg" title="1445601014977430.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445601017671385.jpg" title="1445601017671385.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445601020113247.jpg" title="1445601020113247.jpg" alt="详情页_03.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445601022307597.jpg" title="1445601022307597.jpg" alt="详情页_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/76_thumb_G_1445572232799.jpg', 'data/attached/images/201510/goods_img/76_G_1445572232601.jpg', 'data/attached/images/201510/source_img/76_G_1445572232033.jpg', 1, '', 1, 1, 0, 0, 1445572232, 100, 0, 1, 1, 1, 0, 0, 1445572253, 0, '', -1, -1, 0, NULL),
(77, 21, 'AWE000077', '糙米5斤', '+', 0, 0, '', 1001, '0.000', '38.40', '32.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445601113250534.jpg" title="1445601113250534.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445601117878742.jpg" title="1445601117878742.jpg" alt="详情页_04.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/77_thumb_G_1445572328164.jpg', 'data/attached/images/201510/goods_img/77_G_1445572328039.jpg', 'data/attached/images/201510/source_img/77_G_1445572328084.jpg', 1, '', 1, 1, 0, 0, 1445572328, 100, 0, 1, 1, 1, 0, 0, 1445700996, 0, '', -1, -1, 0, NULL),
(78, 20, 'AWE000078', '花生油10斤', '+', 0, 0, '', 1001, '0.000', '348.00', '290.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445601218124505.jpg" title="1445601218124505.jpg" alt="详情页1.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/78_thumb_G_1445572448368.jpg', 'data/attached/images/201510/goods_img/78_G_1445572448464.jpg', 'data/attached/images/201510/source_img/78_G_1445572448109.jpg', 1, '', 1, 1, 0, 0, 1445572439, 100, 0, 1, 1, 1, 0, 0, 1445575308, 0, '', -1, -1, 0, NULL),
(79, 23, 'AWE000079', '绿茶150g', '+', 0, 0, '', 1001, '0.000', '69.60', '58.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445601861398260.jpg" title="1445601861398260.jpg" alt="问问.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/79_thumb_G_1445573069266.jpg', 'data/attached/images/201510/goods_img/79_G_1445573069962.jpg', 'data/attached/images/201510/source_img/79_G_1445573069636.jpg', 1, '', 1, 1, 0, 0, 1445573069, 100, 0, 1, 1, 1, 0, 0, 1445573091, 0, '', -1, -1, 0, NULL),
(80, 24, 'AWE000080', '冠圣生有机女人葛根粉300g', '+', 0, 0, '', 1001, '0.000', '43.19', '36.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445602312482254.jpg" title="1445602312482254.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445602319657250.jpg" title="1445602319657250.jpg" alt="详情页_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/80_thumb_G_1445573534981.jpg', 'data/attached/images/201510/goods_img/80_G_1445573534187.jpg', 'data/attached/images/201510/source_img/80_G_1445573534895.jpg', 1, '', 1, 1, 0, 0, 1445573260, 100, 0, 1, 1, 1, 0, 0, 1445802773, 0, '', -1, -1, 0, NULL),
(81, 24, 'AWE000081', '冠圣生有机葛根粉450g', '+', 0, 0, '', 1001, '0.000', '42.00', '35.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445602238258416.jpg" title="1445602238258416.jpg" alt="详情页_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445602241611828.jpg" title="1445602241611828.jpg" alt="详情页_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445602245666730.jpg" title="1445602245666730.jpg" alt="详情页_03.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/81_thumb_G_1445573467124.jpg', 'data/attached/images/201510/goods_img/81_G_1445573467739.jpg', 'data/attached/images/201510/source_img/81_G_1445573467146.jpg', 1, '', 1, 1, 0, 0, 1445573467, 100, 0, 1, 1, 1, 0, 0, 1445802679, 0, '', -1, -1, 0, NULL),
(82, 24, 'AWE000082', '东湖红枣藕粉208', '+', 4, 0, '', 1001, '0.000', '16.56', '13.80', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445602409525648.jpg" title="1445602409525648.jpg" alt="xiangqingye_01.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/82_thumb_G_1445573617328.jpg', 'data/attached/images/201510/goods_img/82_G_1445573617008.jpg', 'data/attached/images/201510/source_img/82_G_1445573617325.jpg', 1, '', 1, 1, 0, 0, 1445573617, 100, 0, 1, 1, 1, 0, 0, 1445971138, 0, '', -1, -1, 0, NULL),
(83, 24, 'AWE000083', '东湖纯藕粉200g', '+', 0, 0, '', 1001, '0.000', '33.60', '28.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445602472160372.jpg" title="1445602472160372.jpg" alt="xiangqingye_01.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/83_thumb_G_1445573679247.jpg', 'data/attached/images/201510/goods_img/83_G_1445573679828.jpg', 'data/attached/images/201510/source_img/83_G_1445573679628.jpg', 1, '', 1, 1, 0, 0, 1445573679, 100, 0, 1, 1, 1, 0, 0, 1445573748, 0, '', -1, -1, 0, NULL),
(84, 22, 'AWE000084', '云南手工黑糖瓶装240g', '+', 2, 0, '', 1001, '0.000', '57.60', '48.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445603777571308.jpg" title="1445603777571308.jpg" alt="4545_01.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445603779941891.jpg" title="1445603779941891.jpg" alt="4545_02.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445603782586090.jpg" title="1445603782586090.jpg" alt="4545_04.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445603786652014.jpg" title="1445603786652014.jpg" alt="4545_05.jpg"  width="100%" /><img src="/data/attached/image/20151023/1445603790848493.jpg" title="1445603790848493.jpg" alt="4545_06.jpg"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/84_thumb_G_1445575044748.jpg', 'data/attached/images/201510/goods_img/84_G_1445575044288.jpg', 'data/attached/images/201510/source_img/84_G_1445575044776.jpg', 1, '', 1, 1, 0, 0, 1445575007, 100, 0, 1, 1, 1, 0, 0, 1445971430, 0, '', -1, -1, 0, NULL),
(85, 22, 'AWE000085', '古方红糖袋装125g', '+', 4, 0, '', 1001, '0.000', '27.59', '23.00', '0.00', 0, 0, 1, '', '', '<p><img src="/data/attached/image/20151023/1445603903694981.jpg" title="1445603903694981.jpg" alt="4545_01.jpg" width="100%" /><img src="/data/attached/image/20151023/1445603907387222.jpg" title="1445603907387222.jpg" alt="4545_02.jpg" width="100%" /><img src="/data/attached/image/20151023/1445603910451268.jpg" title="1445603910451268.jpg" alt="4545_04.jpg" width="100%" /><img src="/data/attached/image/20151023/1445603912324794.jpg" title="1445603912324794.jpg" alt="4545_05.jpg" width="100%" /><img src="/data/attached/image/20151023/1445603915394172.jpg" title="1445603915394172.jpg" alt="4545_06.jpg" width="100%" /></p>', 'data/attached/images/201510/thumb_img/85_thumb_G_1445575125099.jpg', 'data/attached/images/201510/goods_img/85_G_1445575125077.jpg', 'data/attached/images/201510/source_img/85_G_1445575125265.jpg', 1, '', 1, 1, 0, 0, 1445575125, 100, 0, 1, 1, 1, 0, 0, 1445903071, 0, '', -1, -1, 0, NULL),
(87, 16, 'AWE000087', '车厘茄', '+', 3, 0, '', 3, '200.000', '6.35', '5.30', '0.00', 0, 0, 1, '车厘茄', '', '<p>车厘茄<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">除了含有丰富的</span><a target="_blank" href="http://baike.baidu.com/view/72570.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">维他命</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">A、C之外，另外还含维他命H、P及大量的</span><a target="_blank" href="http://baike.baidu.com/view/39101.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">钙</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="http://baike.baidu.com/view/4261.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">钾</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="http://baike.baidu.com/view/4631.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">钠</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="http://baike.baidu.com/view/4779.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">镁</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">等元素。而维他命H与皮脂腺的作用有关，充足的维他命H，可以令到皮肤更光滑和幼嫩。<span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">它所含大量的</span><a target="_blank" href="http://baike.baidu.com/view/4261.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">钾</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">和</span><a target="_blank" href="http://baike.baidu.com/view/72570.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">维他命</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">P可以强化微血管壁，使营养充分供给皮肤的需要，令到肤色显得更加红润，有美容功效。同时，也可以减少黄黑色素的形成和沉积，令沉着的色素和黑斑减退及消失。</span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">产地： 宁夏中卫</span></span></p><p><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);"><img src="/data/attached/image/20151027/1445936987406753.png" title="1445936987406753.png" alt="QQ截图20151027171221.png"  width="100%" /><img src="/data/attached/image/20151027/1445936525318277.png" title="1445936525318277.png" alt="QQ截图20151027170332.png"  width="100%" /></span></span></p>', 'data/attached/images/201510/thumb_img/87_thumb_G_1445908266811.jpg', 'data/attached/images/201510/goods_img/87_G_1445908266584.jpg', 'data/attached/images/201510/source_img/87_G_1445908266873.jpg', 1, '', 0, 1, 0, 0, 1445908266, 100, 0, 0, 0, 0, 0, 0, 1445908458, 0, '', -1, -1, 0, NULL),
(88, 16, 'AWG000088', '红皮白萝卜', '+', 2, 0, '', 2, '0.400', '8.16', '6.80', '0.00', 0, 0, 1, '', '', '<p><a target="_blank" href="http://baike.baidu.com/view/96387.htm" style="color: rgb(19, 110, 194); text-decoration: none; font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">红皮白萝卜</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; line-height: 24px; text-indent: 28px; background-color: rgb(255, 255, 255);">是萝卜的一种，又被称为“大红萝卜”</span>红萝卜性微温，<span style="color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; background-color: rgb(255, 255, 255);">肉质脆嫩多汁，含有丰富的矿物质、</span><a href="http://so.39.net/cse/search?s=4195211300598999376&entry=1&q=%E7%A2%B3%E6%B0%B4%E5%8C%96%E5%90%88%E7%89%A9" class="bdcs-inlinelink" target="_blank" style="margin: 0px; padding: 0px; color: rgb(0, 150, 165); text-decoration: none; border-bottom-color: rgb(0, 150, 165); border-bottom-width: 1px; border-bottom-style: dashed; font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);">碳水化合物</a><span style="color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; background-color: rgb(255, 255, 255);">、</span><a href="http://so.39.net/cse/search?s=4195211300598999376&entry=1&q=%E7%BB%B4%E7%94%9F%E7%B4%A0B" class="bdcs-inlinelink" target="_blank" style="margin: 0px; padding: 0px; color: rgb(0, 150, 165); text-decoration: none; border-bottom-color: rgb(0, 150, 165); border-bottom-width: 1px; border-bottom-style: dashed; font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);">维生素B</a><span style="color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; background-color: rgb(255, 255, 255);">、C等，可以健胃消食，止咳化痰，顺气</span><a href="http://zzk.39.net/zz/penqiang/a7eca.html" target="_blank" keycmd="null" style="margin: 0px; padding: 0px; color: rgb(0, 150, 165); text-decoration: none; border-bottom-color: rgb(0, 150, 165); border-bottom-width: 1px; border-bottom-style: dashed; font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);">利尿</a><span style="color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; background-color: rgb(255, 255, 255);">，</span><a href="http://so.39.net/cse/search?s=4195211300598999376&entry=1&q=%E6%B8%85%E7%83%AD%E8%A7%A3%E6%AF%92" class="bdcs-inlinelink" target="_blank" style="margin: 0px; padding: 0px; color: rgb(0, 150, 165); text-decoration: none; border-bottom-color: rgb(0, 150, 165); border-bottom-width: 1px; border-bottom-style: dashed; font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; white-space: normal; background-color: rgb(255, 255, 255);">清热解毒</a><span style="color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;; line-height: 28px; background-color: rgb(255, 255, 255);">；与肉食同煮、同炖、同炒，肉香、菜甘，营养与健康同行，是再好不过的美味、营养搭配了</span></p><p><img src="/data/attached/image/20151027/1445938230218539.png" title="1445938230218539.png" alt="QQ截图20151027173255.png"  width="100%" /></p>', 'data/attached/images/201510/thumb_img/88_thumb_G_1445909521890.jpg', 'data/attached/images/201510/goods_img/88_G_1445909521145.jpg', 'data/attached/images/201510/source_img/88_G_1445909521031.png', 1, '', 0, 1, 0, 0, 1445909521, 100, 0, 0, 0, 0, 0, 0, 1445909570, 0, '', -1, -1, 0, NULL),
(89, 16, 'AWE000089', '越南红皮黄芯番薯', '+', 0, 0, '', 10, '0.500', '4.56', '3.80', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445909921, 100, 0, 0, 0, 0, 0, 0, 1445909921, 0, '', -1, -1, 0, NULL),
(90, 16, 'AWE000090', '宁夏青萝卜', '+', 0, 0, '', 2, '0.300', '7.08', '5.90', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910146, 100, 0, 0, 0, 0, 0, 0, 1445910146, 0, '', -1, -1, 0, NULL),
(91, 16, 'AWE000091', '葱', '+', 0, 0, '', 5, '0.100', '3.59', '3.00', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910209, 100, 0, 0, 0, 0, 0, 0, 1445910209, 0, '', -1, -1, 0, NULL),
(92, 16, 'AWE000092', '云南韭菜花', '+', 0, 0, '', 2, '0.300', '11.76', '9.80', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910273, 100, 0, 0, 0, 0, 0, 0, 1445910273, 0, '', -1, -1, 0, NULL),
(93, 16, 'AWE000093', '连州干葱头', '+', 0, 0, '', 2, '0.150', '4.68', '3.90', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910337, 100, 0, 0, 0, 0, 0, 0, 1447783408, 0, '', -1, -1, 0, NULL),
(94, 16, 'AWE000094', '姜+蒜头+干葱头套装', '+', 0, 0, '', 5, '0.150', '4.20', '3.50', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910408, 100, 0, 0, 0, 0, 0, 0, 1445910408, 0, '', -1, -1, 0, NULL),
(95, 16, 'AWE000095', '宁夏京葱', '+', 0, 0, '', 2, '0.200', '5.76', '4.80', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910470, 100, 0, 0, 0, 0, 0, 0, 1445910470, 0, '', -1, -1, 0, NULL),
(96, 16, 'AWE000096', '毛瓜2个装', '+', 1, 0, '', 2, '0.500', '9.48', '7.90', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910524, 100, 0, 0, 0, 0, 0, 0, 1445910524, 0, '', -1, -1, 0, NULL),
(97, 16, 'AWE000097', '指天椒', '+', 0, 0, '', 2, '0.050', '5.39', '4.50', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910592, 100, 0, 0, 0, 0, 0, 0, 1446746952, 0, '', -1, -1, 0, NULL),
(98, 16, 'AWE000098', '湘南铁线椒', '+', 3, 0, '', 2, '0.200', '9.00', '7.50', '0.00', 0, 0, 1, '', '', '', '', '', '', 1, '', 0, 1, 0, 0, 1445910646, 100, 0, 0, 0, 0, 0, 0, 1460487630, 0, '', -1, -1, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cs_job`
--

CREATE TABLE IF NOT EXISTS `cs_job` (
  `id` int(5) NOT NULL,
  `title` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sex` varchar(10) NOT NULL DEFAULT '男',
  `nation` varchar(30) NOT NULL COMMENT '民族',
  `age` varchar(15) NOT NULL COMMENT '生日',
  `marry` varchar(10) NOT NULL DEFAULT '未婚',
  `child` varchar(10) NOT NULL DEFAULT '无' COMMENT '有无子女',
  `bplace` varchar(20) NOT NULL COMMENT '籍贯',
  `address` varchar(100) NOT NULL COMMENT '户口所在地',
  `education` varchar(20) NOT NULL COMMENT '学历',
  `foreign` varchar(150) NOT NULL COMMENT '外语语种及程度',
  `mobile` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `idnums` varchar(30) NOT NULL COMMENT '身份证号',
  `address_now` varchar(255) NOT NULL COMMENT '住址',
  `slim` varchar(20) NOT NULL COMMENT '可到职日期',
  `content` text NOT NULL COMMENT '备注'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_job`
--

INSERT INTO `cs_job` (`id`, `title`, `name`, `sex`, `nation`, `age`, `marry`, `child`, `bplace`, `address`, `education`, `foreign`, `mobile`, `email`, `idnums`, `address_now`, `slim`, `content`) VALUES
(1, '招聘前端', '中国', '男', '蒙古族', '', '未婚', '', '', '', '硕士', '', '', '', '', '', '随时', ''),
(5, 'php工程师', '童攀', '男', '蒙古族', '', '', '有', '北京市', '天津市', '博士', '', '13781652589', '', '', '', '随时', ''),
(6, 'php工程师', '童攀', '男', '汉族', '1990-03-06', '未婚', '有', '天津市', '北京市', '博士', '英语', '13781652457', 'tongpan@163.com', '411425199002259159', '北京朝阳区', '1周内', '这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍\r\n这里是我的个人介绍这里是我的个人介绍');

-- --------------------------------------------------------

--
-- 表的结构 `cs_link`
--

CREATE TABLE IF NOT EXISTS `cs_link` (
  `id` smallint(5) NOT NULL,
  `title` varchar(30) NOT NULL,
  `url` varchar(60) NOT NULL,
  `des` varchar(255) NOT NULL,
  `sort` mediumint(5) NOT NULL DEFAULT '50'
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_link`
--

INSERT INTO `cs_link` (`id`, `title`, `url`, `des`, `sort`) VALUES
(5, '360', 'http://www.360.cn', 'http://www.baidu.com', 1),
(7, '百度', 'http://www.baidu.com', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `cs_message`
--

CREATE TABLE IF NOT EXISTS `cs_message` (
  `id` mediumint(5) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `checked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否通过审核',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1pc端发布0移动端发布',
  `time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_message`
--

INSERT INTO `cs_message` (`id`, `nickname`, `telephone`, `email`, `content`, `checked`, `type`, `time`) VALUES
(14, '手机留言', '', '', '手机留言手机留言手机留言手机留言手机留言手机留言', 1, 0, 0),
(15, '手机留言2', '', '', '手机留言2手机留言2手机留言2', 1, 0, 0),
(16, '手机留言3', '', '', '手机留言3手机留言3手机留言3手机留言3', 1, 0, 0),
(17, '新增留言测试', '', '', '新增留言测试新增留言测试新增留言测试', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cs_news`
--

CREATE TABLE IF NOT EXISTS `cs_news` (
  `id` int(5) NOT NULL,
  `title` varchar(40) NOT NULL,
  `author` varchar(20) DEFAULT NULL,
  `imgUrl` varchar(60) DEFAULT NULL,
  `content` text NOT NULL,
  `keywords` varchar(60) DEFAULT NULL,
  `date` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cs_privilege`
--

CREATE TABLE IF NOT EXISTS `cs_privilege` (
  `id` mediumint(5) NOT NULL,
  `pri_name` varchar(20) NOT NULL COMMENT '//权限名称',
  `mname` varchar(20) NOT NULL COMMENT '//模块名称',
  `cname` varchar(20) NOT NULL COMMENT '//控制器名称',
  `aname` varchar(20) NOT NULL COMMENT '//方法名称',
  `parentid` mediumint(5) NOT NULL DEFAULT '0' COMMENT '//上级权限的id'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_privilege`
--

INSERT INTO `cs_privilege` (`id`, `pri_name`, `mname`, `cname`, `aname`, `parentid`) VALUES
(22, '文章添加', 'Admin', 'Article', 'add', 21),
(18, '栏目管理', 'Admin', 'Cate', 'lst', 17),
(19, '栏目添加', 'Admin', 'Cate', 'add', 18),
(20, '栏目删除', 'Admin', 'Cate', 'del', 18),
(17, '常用操作', 'admin', 'cycz', 'cycz', 0),
(21, '文章管理', 'Admin', 'Article', 'lst', 17),
(23, '文章修改', 'Admin', 'Article', 'edit', 21),
(24, '友情链接管理', 'Admin', 'Link', 'lst', 17),
(25, '友情链接添加', 'Admin', 'Link', 'add', 24),
(26, '友情链接删除', 'Admin', 'Link', 'del', 24),
(27, '友情链接批量删除', 'Admin', 'Link', 'bdel', 24),
(28, '栏目批量删除', 'Admin', 'Cate', 'bdel', 18),
(29, '文章批量删除', 'Admin', 'Article', 'bdel', 21),
(30, '系统管理', 'Admin', 'Admin', 'system', 0),
(31, '系统设置', 'Admin', 'System', 'lst', 30),
(32, '管理员管理', 'Admin', 'Admin', 'lst', 30),
(33, '管理员添加', 'Admin', 'Admin', 'add', 32),
(34, '管理员删除', 'Admin', 'Admin', 'del', 32),
(35, '管理员批量删除', 'Admin', 'Admin', 'bdel', 32),
(36, '管理员修改', 'Admin', 'Admin', 'edit', 32),
(37, '链接批量更新', 'Admin', 'Link', 'sortlink', 24);

-- --------------------------------------------------------

--
-- 表的结构 `cs_reply`
--

CREATE TABLE IF NOT EXISTS `cs_reply` (
  `id` int(5) NOT NULL,
  `content` varchar(255) NOT NULL,
  `mid` mediumint(5) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_reply`
--

INSERT INTO `cs_reply` (`id`, `content`, `mid`, `time`) VALUES
(19, '谢谢留言', 14, 1462526670),
(20, '测试回复', 15, 1462526716),
(18, '感谢您的支持', 14, 1462526659);

-- --------------------------------------------------------

--
-- 表的结构 `cs_role`
--

CREATE TABLE IF NOT EXISTS `cs_role` (
  `id` mediumint(5) NOT NULL,
  `rolename` varchar(20) NOT NULL,
  `pri_id_list` varchar(60) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `cs_role`
--

INSERT INTO `cs_role` (`id`, `rolename`, `pri_id_list`) VALUES
(1, '超级管理员', '*'),
(6, '栏目管理员', '17,18,19,20'),
(7, '文章管理员', '17,21,22,23'),
(8, '友情链接管理员', '17,24,25,26,27,37'),
(9, '管理员', '17,18,19,20,21,22,23,24,25,26,27');

-- --------------------------------------------------------

--
-- 表的结构 `cs_suppliers`
--

CREATE TABLE IF NOT EXISTS `cs_suppliers` (
  `suppliers_id` smallint(5) unsigned NOT NULL,
  `suppliers_name` varchar(255) DEFAULT NULL,
  `suppliers_desc` mediumtext,
  `is_check` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `mall.cs_customers`
--

CREATE TABLE IF NOT EXISTS `mall.cs_customers` (
  `id` mediumint(5) NOT NULL,
  `image` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `category` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cs_admin`
--
ALTER TABLE `cs_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_article`
--
ALTER TABLE `cs_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_attribute`
--
ALTER TABLE `cs_attribute`
  ADD PRIMARY KEY (`attr_id`), ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `cs_brand`
--
ALTER TABLE `cs_brand`
  ADD PRIMARY KEY (`brand_id`), ADD KEY `is_show` (`is_show`);

--
-- Indexes for table `cs_cate`
--
ALTER TABLE `cs_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_customers`
--
ALTER TABLE `cs_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_goods`
--
ALTER TABLE `cs_goods`
  ADD PRIMARY KEY (`goods_id`), ADD KEY `goods_sn` (`goods_sn`), ADD KEY `cat_id` (`cat_id`), ADD KEY `last_update` (`last_update`), ADD KEY `brand_id` (`brand_id`), ADD KEY `goods_weight` (`goods_weight`), ADD KEY `promote_end_date` (`promote_end_date`), ADD KEY `promote_start_date` (`promote_start_date`), ADD KEY `goods_number` (`goods_number`), ADD KEY `sort_order` (`sort_order`);

--
-- Indexes for table `cs_job`
--
ALTER TABLE `cs_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_link`
--
ALTER TABLE `cs_link`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_message`
--
ALTER TABLE `cs_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_news`
--
ALTER TABLE `cs_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_privilege`
--
ALTER TABLE `cs_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_reply`
--
ALTER TABLE `cs_reply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_role`
--
ALTER TABLE `cs_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cs_suppliers`
--
ALTER TABLE `cs_suppliers`
  ADD PRIMARY KEY (`suppliers_id`);

--
-- Indexes for table `mall.cs_customers`
--
ALTER TABLE `mall.cs_customers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cs_admin`
--
ALTER TABLE `cs_admin`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `cs_article`
--
ALTER TABLE `cs_article`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `cs_attribute`
--
ALTER TABLE `cs_attribute`
  MODIFY `attr_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=214;
--
-- AUTO_INCREMENT for table `cs_brand`
--
ALTER TABLE `cs_brand`
  MODIFY `brand_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs_cate`
--
ALTER TABLE `cs_cate`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `cs_customers`
--
ALTER TABLE `cs_customers`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `cs_goods`
--
ALTER TABLE `cs_goods`
  MODIFY `goods_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT for table `cs_job`
--
ALTER TABLE `cs_job`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `cs_link`
--
ALTER TABLE `cs_link`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cs_message`
--
ALTER TABLE `cs_message`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `cs_news`
--
ALTER TABLE `cs_news`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cs_privilege`
--
ALTER TABLE `cs_privilege`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `cs_reply`
--
ALTER TABLE `cs_reply`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `cs_role`
--
ALTER TABLE `cs_role`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `cs_suppliers`
--
ALTER TABLE `cs_suppliers`
  MODIFY `suppliers_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mall.cs_customers`
--
ALTER TABLE `mall.cs_customers`
  MODIFY `id` mediumint(5) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
