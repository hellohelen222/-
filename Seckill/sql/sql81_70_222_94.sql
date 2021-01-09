-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2021-01-09 14:13:08
-- 服务器版本： 5.6.49-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql81_70_222_94`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` mediumint(6) unsigned NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `lastloginip`, `lastlogintime`, `email`, `mobile`, `realname`, `openid`, `status`, `updatetime`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 2130706433, 1479969414, '5552123@qq.com', '18888873646', '阿杜', '', 1, 1477623198),
(2, 'zhenxun', 'c2785bf6585103658d34413683ac36f8', 2130706433, 1476067533, '', '18888873646', '', '', 1, 1477624790),
(3, 'zhangsan', '01d7f40760960e7bd9443513f22ab9af', 0, 0, '', '', '', '', 1, 1477625400),
(4, 'test', '098f6bcd4621d373cade4e832627b4f6', 1931205092, 1610115307, '', '', '小演', '', 1, 1479969550),
(5, 'wangle', '202cb962ac59075b964b07152d234b70', 0, 0, '', '', '', '', 1, 1605442948),
(6, 'x', 'c4ca4238a0b923820dcc509a6f75849b', 1931205092, 1610116450, '', '', '', '', 1, 0),
(7, 'y', 'c4ca4238a0b923820dcc509a6f75849b', 1931205092, 1610116752, '', '', '', '', 1, 0),
(8, '', '5f02f0889301fd7be1ac972c11bf3e7d', 0, 0, 'de', 'de', 'de', '', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `admin_group`
--

CREATE TABLE IF NOT EXISTS `admin_group` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_group`
--

INSERT INTO `admin_group` (`id`, `name`, `description`, `rules`, `listorder`, `updatetime`) VALUES
(1, '高级管理员组', '管理商品信息、订单信息，分组信息，管理员信息以及日志信息', '31,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47', 0, 1477622552),
(2, '普通管理员组', '管理订单，修改增加订单信息，管理商品，修改增加商品', '31,1,23,12,13,27,32,33,34,35,40,41,42,43,44,45,46,47', 0, 1476067479),
(3, '普通用户', '查询订单信息以及商品信息，不能增删改', '31,23,32,34,40,42,47', 0, 1479969527);

-- --------------------------------------------------------

--
-- 表的结构 `admin_group_access`
--

CREATE TABLE IF NOT EXISTS `admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_group_access`
--

INSERT INTO `admin_group_access` (`uid`, `group_id`) VALUES
(8, 0),
(3, 1),
(4, 1),
(5, 1),
(2, 2),
(3, 2),
(6, 2),
(7, 3);

-- --------------------------------------------------------

--
-- 表的结构 `admin_log`
--

CREATE TABLE IF NOT EXISTS `admin_log` (
  `id` int(10) unsigned NOT NULL,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin_log`
--

INSERT INTO `admin_log` (`id`, `m`, `c`, `a`, `querystring`, `userid`, `username`, `ip`, `time`) VALUES
(1, 'admin', 'Group', 'index', '', 4, 'test', 2130706433, 0),
(2, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605344171),
(3, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605344178),
(4, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605344412),
(5, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605344529),
(6, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605409673),
(7, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605416758),
(8, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605416971),
(9, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605417203),
(10, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605418931),
(11, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605419022),
(12, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605419070),
(13, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605419804),
(14, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605420837),
(15, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205089, 1605420838),
(16, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605420890),
(17, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605420892),
(18, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605420895),
(19, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605422042),
(20, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605422046),
(21, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605422058),
(22, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605422058),
(23, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605422095),
(24, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605422523),
(25, 'admin', 'Group', 'index', '', 4, 'test', 1931205089, 1605422525),
(26, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205089, 1605422527),
(27, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205089, 1605423218),
(28, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605423219),
(29, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605423220),
(30, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605423223),
(31, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605423225),
(32, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605423964),
(33, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605423969),
(34, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605424905),
(35, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605424910),
(36, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605424912),
(37, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605424929),
(38, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605425113),
(39, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605425117),
(40, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605425124),
(41, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605425572),
(42, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605425659),
(43, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605426300),
(44, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426301),
(45, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426442),
(46, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426445),
(47, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605426448),
(48, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205089, 1605426487),
(49, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426488),
(50, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426490),
(51, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605426498),
(52, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605426514),
(53, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426518),
(54, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605426677),
(55, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605426683),
(56, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605426693),
(57, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605427500),
(58, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605427503),
(59, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605427505),
(60, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605432348),
(61, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605432355),
(62, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432387),
(63, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432398),
(64, 'admin', 'Group', 'index', '', 4, 'test', 1931205089, 1605432400),
(65, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432406),
(66, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605432581),
(67, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605432587),
(68, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432601),
(69, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432708),
(70, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605432708),
(71, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605432710),
(72, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605432716),
(73, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605432722),
(74, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605433112),
(75, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605433133),
(76, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605435361),
(77, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435361),
(78, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435364),
(79, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435365),
(80, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605435370),
(81, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605435525),
(82, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435526),
(83, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435527),
(84, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605435732),
(85, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605435733),
(86, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435734),
(87, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435735),
(88, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435741),
(89, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605435743),
(90, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605435746),
(91, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605435756),
(92, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605435761),
(93, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605435764),
(94, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605435800),
(95, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605435801),
(96, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605435829),
(97, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605436081),
(98, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605436084),
(99, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605436088),
(100, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605436091),
(101, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605436093),
(102, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605436119),
(103, 'admin', 'Admin', 'admin', '', 4, 'test', 1931205092, 1605439899),
(104, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605439927),
(105, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605439948),
(106, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605440696),
(107, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440696),
(108, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440697),
(109, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440698),
(110, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605440701),
(111, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1605440736),
(112, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605440746),
(113, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605440762),
(114, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440770),
(115, 'admin', 'Group', 'index', '', 4, 'test', 1931205092, 1605440774),
(116, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205092, 1605440786),
(117, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605440811),
(118, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605440974),
(119, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440976),
(120, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440979),
(121, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605440982),
(122, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605440985),
(123, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605441865),
(124, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605441865),
(125, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605441868),
(126, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605441871),
(127, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1605441876),
(128, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205092, 1605441914),
(129, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605442892),
(130, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605442895),
(131, 'admin', 'Admin', 'add', '', 4, 'test', 1931205092, 1605442916),
(132, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605442920),
(133, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605442939),
(134, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605442939),
(135, 'admin', 'Admin', 'edit', '', 4, 'test', 1931205092, 1605442948),
(136, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605442951),
(137, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605442957),
(138, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605444813),
(139, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605444815),
(140, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605444816),
(141, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605444818),
(142, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605444821),
(143, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1605444823),
(144, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205092, 1605444857),
(145, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605444900),
(146, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605444902),
(147, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205092, 1605449672),
(148, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449674),
(149, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449682),
(150, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449684),
(151, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449686),
(152, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1605449704),
(153, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605449938),
(154, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449940),
(155, 'admin', 'Admin', 'add', '', 4, 'test', 1931205092, 1605449953),
(156, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605449957),
(157, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605449963),
(158, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449964),
(159, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605449965),
(160, 'admin', 'Dormanage', 'dormanage', '', 6, 'x', 1931205092, 1605450148),
(161, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605450178),
(162, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1605450180),
(163, 'admin', 'Admin', 'add', '', 4, 'test', 1931205092, 1605450188),
(164, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1605450191),
(165, 'admin', 'Dormanage', 'dormanage', '', 7, 'y', 1931205092, 1605450207),
(166, 'admin', 'Admin', 'public_edit_info', '', 6, 'x', 1931205092, 1605450298),
(167, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605596659),
(168, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605596810),
(169, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605596813),
(170, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605596847),
(171, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605596858),
(172, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605596859),
(173, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605921834),
(174, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605921837),
(175, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605921860),
(176, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605921871),
(177, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605921876),
(178, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605921925),
(179, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605921931),
(180, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605922866),
(181, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605922868),
(182, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605922874),
(183, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605922880),
(184, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605922899),
(185, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605923579),
(186, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605923581),
(187, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605923582),
(188, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605923586),
(189, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605923603),
(190, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605923607),
(191, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605923624),
(192, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605923650),
(193, 'admin', 'Admin', 'add', '', 4, 'test', 1931205089, 1605923658),
(194, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1605923661),
(195, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924154),
(196, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924156),
(197, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605924186),
(198, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924190),
(199, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605924193),
(200, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924195),
(201, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924199),
(202, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605924202),
(203, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924246),
(204, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1605924251),
(205, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924255),
(206, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924618),
(207, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924619),
(208, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924621),
(209, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924624),
(210, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924627),
(211, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605924654),
(212, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924657),
(213, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924667),
(214, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924857),
(215, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924857),
(216, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924858),
(217, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924859),
(218, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924862),
(219, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924864),
(220, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924867),
(221, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924869),
(222, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924883),
(223, 'admin', 'Dormanage', 'del', '', 4, 'test', 1931205089, 1605924894),
(224, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924897),
(225, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605924991),
(226, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605924995),
(227, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605924997),
(228, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205089, 1605925015),
(229, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605925018),
(230, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605925021),
(231, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605925036),
(232, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605925732),
(233, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605925733),
(234, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605925733),
(235, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605925735),
(236, 'admin', 'Admin', 'info', '', 4, 'test', 1931205089, 1605925737),
(237, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1605925740),
(238, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205089, 1605925742),
(239, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606227353),
(240, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606227418),
(241, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205092, 1606227579),
(242, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606227615),
(243, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1606227618),
(244, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1606227623),
(245, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606227636),
(246, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606227836),
(247, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606227841),
(248, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606228104),
(249, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606228665),
(250, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606228910),
(251, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606228912),
(252, 'admin', 'Dormanage', 'add', '', 4, 'test', 1931205092, 1606228913),
(253, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1606228914),
(254, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1606228917),
(255, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606228920),
(256, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606228922),
(257, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1606229054),
(258, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1606229056),
(259, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1606229056),
(260, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1606229695),
(261, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1606229699),
(262, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1606267227),
(263, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205089, 1606267231),
(264, 'admin', 'Admin', 'index', '', 4, 'test', 1931205089, 1606267268),
(265, 'admin', 'Group', 'index', '', 4, 'test', 1931205089, 1606267971),
(266, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205089, 1606268241),
(267, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1606878208),
(268, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1606878209),
(269, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1606878212),
(270, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1608795467),
(271, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1608795476),
(272, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609146274),
(273, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609146319),
(274, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609147043),
(275, 'admin', 'Admin', 'info', '', 4, 'test', 1931205852, 1609147045),
(276, 'admin', 'Admin', 'info', '', 4, 'test', 1931205852, 1609147046),
(277, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609147055),
(278, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609147065),
(279, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609147071),
(280, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609147343),
(281, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609149197),
(282, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149202),
(283, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149265),
(284, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149303),
(285, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149404),
(286, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149505),
(287, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149531),
(288, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149743),
(289, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149780),
(290, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149872),
(291, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149883),
(292, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149895),
(293, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609149968),
(294, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609149972),
(295, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609150012),
(296, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609150063),
(297, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609150105),
(298, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609150107),
(299, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609150112),
(300, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205852, 1609150113),
(301, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609935354),
(302, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609935436),
(303, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1609935614),
(304, 'admin', 'Group', 'index', '', 4, 'test', 1931205092, 1609935628),
(305, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205092, 1609935632),
(306, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1609935633),
(307, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1609935639),
(308, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609935643),
(309, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609935660),
(310, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609936863),
(311, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609936864),
(312, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609936972),
(313, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609937462),
(314, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1609937470),
(315, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609937491),
(316, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609937496),
(317, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609937499),
(318, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609937721),
(319, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1609945048),
(320, 'admin', 'Group', 'index', '', 4, 'test', 1931205092, 1609945058),
(321, 'admin', 'Group', 'info', '', 4, 'test', 1931205092, 1609945069),
(322, 'admin', 'Group', 'info', '', 4, 'test', 1931205092, 1609945069),
(323, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609945076),
(324, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205092, 1609945082),
(325, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1609945094),
(326, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1609945102),
(327, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1609945103),
(328, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1609945790),
(329, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1609945795),
(330, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609945798),
(331, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609945829),
(332, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609948220),
(333, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609948222),
(334, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1609948225),
(335, 'admin', 'Admin', 'info', '', 4, 'test', 1931205092, 1609948354),
(336, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609984456),
(337, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609984469),
(338, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609984484),
(339, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609984486),
(340, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609984491),
(341, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609984495),
(342, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609985382),
(343, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609985402),
(344, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609985405),
(345, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609985418),
(346, 'admin', 'Order', 'lists', '', 4, 'test', 1931205852, 1609985425),
(347, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609985432),
(348, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609985438),
(349, 'admin', 'Group', 'info', '', 4, 'test', 1931205852, 1609985443),
(350, 'admin', 'Group', 'info', '', 4, 'test', 1931205852, 1609985443),
(351, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609985447),
(352, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609985459),
(353, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609985465),
(354, 'admin', 'Order', 'lists', '', 4, 'test', 1931205852, 1609985466),
(355, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609985469),
(356, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609985623),
(357, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609985628),
(358, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609985634),
(359, 'admin', 'Order', 'lists', '', 4, 'test', 1931205852, 1609985692),
(360, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609985697),
(361, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609985701),
(362, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205852, 1609985703),
(363, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609985704),
(364, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609985886),
(365, 'admin', 'Group', 'index', '', 4, 'test', 1931205852, 1609986858),
(366, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609986861),
(367, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609986865),
(368, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609986866),
(369, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205852, 1609986930),
(370, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609986932),
(371, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609986935),
(372, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609987161),
(373, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609987163),
(374, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609987165),
(375, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609987233),
(376, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609987287),
(377, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609987290),
(378, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609987292),
(379, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987295),
(380, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987326),
(381, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987344),
(382, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987389),
(383, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987390),
(384, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609987396),
(385, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987402),
(386, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609987436),
(387, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609987438),
(388, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205852, 1609987438),
(389, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205852, 1609987462),
(390, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609987522),
(391, 'admin', 'Admin', 'index', '', 4, 'test', 1931205852, 1609987549),
(392, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205852, 1609987560),
(393, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205852, 1609987562),
(394, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1610115361),
(395, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1610115422),
(396, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1610115545),
(397, 'admin', 'Dorm', 'lists', '', 4, 'test', 1931205092, 1610115547),
(398, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1610115583),
(399, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1610115587),
(400, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1610115587),
(401, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1610115615),
(402, 'admin', 'Dormanage', 'info', '', 4, 'test', 1931205092, 1610115615),
(403, 'admin', 'Dormanage', 'index', '', 4, 'test', 1931205092, 1610115619),
(404, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205092, 1610115658),
(405, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205092, 1610115668),
(406, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205092, 1610115705),
(407, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205092, 1610115709),
(408, 'admin', 'Ordermanage', 'info', '', 4, 'test', 1931205092, 1610115709),
(409, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205092, 1610115747),
(410, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205092, 1610115770),
(411, 'admin', 'Ordermanage', 'index', '', 4, 'test', 1931205092, 1610115771),
(412, 'admin', 'Order', 'lists', '', 4, 'test', 1931205092, 1610115773),
(413, 'admin', 'Admin', 'index', '', 4, 'test', 1931205092, 1610115850),
(414, 'admin', 'Group', 'index', '', 4, 'test', 1931205092, 1610115920),
(415, 'admin', 'Admin', 'public_edit_info', '', 4, 'test', 1931205092, 1610115938),
(416, 'admin', 'Dorm', 'lists', '', 6, 'x', 1931205092, 1610116455),
(417, 'admin', 'Group', 'index', '', 6, 'x', 1931205092, 1610116466),
(418, 'admin', 'Admin', 'public_edit_info', '', 6, 'x', 1931205092, 1610116468),
(419, 'admin', 'Dorm', 'lists', '', 6, 'x', 1931205092, 1610116678),
(420, 'admin', 'Ordermanage', 'index', '', 6, 'x', 1931205092, 1610116684),
(421, 'admin', 'Dorm', 'lists', '', 7, 'y', 1931205092, 1610116756),
(422, 'admin', 'Order', 'lists', '', 7, 'y', 1931205092, 1610116766);

-- --------------------------------------------------------

--
-- 表的结构 `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `id` int(11) NOT NULL,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1软件，2游戏，3付费',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '位置',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '标记说明',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '开始时间',
  `s_time` time DEFAULT NULL,
  `date_total` int(11) DEFAULT NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dormanage`
--

CREATE TABLE IF NOT EXISTS `dormanage` (
  `id` tinyint(3) unsigned NOT NULL,
  `Building` varchar(50) NOT NULL,
  `Floor` tinyint(2) NOT NULL,
  `Unit` tinyint(2) NOT NULL,
  `Bed` tinyint(2) NOT NULL,
  `sex` char(2) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有人入住(0:无人,1:有人)',
  `stuID` int(20) DEFAULT NULL,
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dormanage`
--

INSERT INTO `dormanage` (`id`, `Building`, `Floor`, `Unit`, `Bed`, `sex`, `status`, `stuID`, `updatetime`) VALUES
(1, '5', 2, 4, 2, '男', 1, 2001210666, NULL),
(2, '5', 2, 2, 2, '男', 0, 2001210444, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dorm_bed`
--

CREATE TABLE IF NOT EXISTS `dorm_bed` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL COMMENT 'room表的id',
  `bedNo` int(10) NOT NULL COMMENT '床位编号',
  `is_distributed` int(11) NOT NULL COMMENT '是否已分配',
  `student_id` int(11) NOT NULL COMMENT '学生表student的id',
  `status` int(11) NOT NULL COMMENT '是否可用,1为可用，0为不可用',
  `comments` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dorm_bed`
--

INSERT INTO `dorm_bed` (`id`, `room_id`, `bedNo`, `is_distributed`, `student_id`, `status`, `comments`) VALUES
(1, 1, 1, 1, 2001210111, 1, ''),
(2, 1, 2, 1, 2001210333, 1, ''),
(3, 1, 3, 1, 2001210444, 1, ''),
(4, 1, 4, 1, 2001210666, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `dorm_building`
--

CREATE TABLE IF NOT EXISTS `dorm_building` (
  `id` int(11) NOT NULL,
  `buildingNo` varchar(50) NOT NULL COMMENT '宿舍楼号',
  `buildingName` varchar(200) NOT NULL COMMENT '楼名称',
  `status` int(11) NOT NULL COMMENT '是否有效，0-不可见，1-有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dorm_building`
--

INSERT INTO `dorm_building` (`id`, `buildingNo`, `buildingName`, `status`) VALUES
(1, '5', '5号楼', 1),
(2, '8', '8号楼', 1),
(3, '9', '9号楼', 1),
(4, '10', '10号楼', 0),
(5, '13', '13号楼', 1),
(6, '14', '14号楼', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dorm_room`
--

CREATE TABLE IF NOT EXISTS `dorm_room` (
  `id` int(11) NOT NULL,
  `building_id` int(11) NOT NULL COMMENT '楼id,对应building表的id主键',
  `gender` int(11) NOT NULL COMMENT '性别: 1男，0女',
  `roomName` varchar(100) NOT NULL COMMENT '宿舍名称',
  `floor` varchar(100) NOT NULL COMMENT '楼层/单元',
  `status` int(11) NOT NULL COMMENT '可分配状态，1可分配，0不可分配',
  `emptyBedNum` int(11) NOT NULL COMMENT '空床数',
  `totalBenNum` int(11) NOT NULL COMMENT '总床位数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dorm_room`
--

INSERT INTO `dorm_room` (`id`, `building_id`, `gender`, `roomName`, `floor`, `status`, `emptyBedNum`, `totalBenNum`) VALUES
(1, 1, 1, '5101', '5号楼1楼', 1, 0, 4),
(2, 1, 1, '5102', '', 1, 0, 4);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` smallint(6) unsigned NOT NULL,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `name`, `parentid`, `icon`, `c`, `a`, `data`, `tip`, `group`, `listorder`, `display`, `updatetime`) VALUES
(1, '用户管理', 0, 'fa-users', 'Admin', 'admin', '', '', '', 1, 1, 1476175413),
(2, '管理员管理', 1, '', 'Admin', 'index', '', '', '', 0, 1, 1476175413),
(3, '详情', 2, '', 'Admin', 'info', '', '', '', 0, 2, 1476175413),
(4, '添加', 2, '', 'Admin', 'add', '', '', '', 0, 2, 1476175413),
(5, '修改', 2, '', 'Admin', 'edit', '', '', '', 0, 2, 1476175413),
(6, '删除', 2, '', 'Admin', 'del', '', '', '', 0, 2, 1476175413),
(7, '分组管理', 1, '', 'Group', 'index', '', '', '', 0, 1, 1476175413),
(8, '详情', 7, '', 'Group', 'info', '', '', '', 0, 2, 1476175413),
(9, '添加', 7, '', 'Group', 'add', '', '', '', 0, 2, 1476175413),
(10, '修改', 7, '', 'Group', 'edit', '', '', '', 0, 2, 1476175413),
(11, '删除', 7, '', 'Group', 'del', '', '', '', 0, 2, 1476175413),
(12, '菜单管理', 18, '', 'Menu', 'index', '', '', '', 0, 2, 1476175413),
(13, '查看', 12, '', 'Menu', 'info', '', '', '', 0, 2, 1476175413),
(14, '添加', 12, '', 'Menu', 'add', '', '', '', 0, 2, 1476175413),
(15, '修改', 12, '', 'Menu', 'edit', '', '', '', 0, 2, 1476175413),
(16, '删除', 12, '', 'Menu', 'del', '', '', '', 0, 2, 1476175413),
(18, '系统设置', 0, 'fa-cogs', 'Menu', 'index', '', '', '', 2, 1, 1476175413),
(22, '权限设置', 2, '', 'Group', 'rule', '', '', '', 999, 2, 1476175413),
(23, '个人设置', 1, '', 'Admin', 'public_edit_info', '', '', '', 999, 1, 1476175413),
(27, '日志管理', 18, '', 'Log', 'index', '', '', '', 999, 1, 1476175413),
(31, '系统首页', 0, 'fa-bank', 'Index', 'index', '', '', '', 0, 1, 1476175413),
(32, '商品管理', 0, 'fa-users', 'Dorm', 'lists', '', '', '', 0, 1, 1476175413),
(33, '详情', 37, '', 'Dormanage', 'info', '', '', '', 0, 2, 1476175413),
(34, '添加', 37, '', 'Dormanage', 'add', '', '', '', 0, 2, 1476175413),
(35, '修改', 37, '', 'Dormanage', 'edit', '', '', '', 0, 2, 1476175413),
(36, '删除', 37, '', 'Dormanage', 'del', '', '', '', 0, 2, 1476175413),
(37, '商品信息管理', 32, '', 'Dormanage', 'index', '', '', '', 0, 1, 1476175413),
(38, '商品信息统计查询', 32, '', 'Dorm', 'lists', '', '', '', 0, 1, 1476175413),
(39, '详情', 38, '', 'Dorm', 'lists', '', '', '', 0, 2, 1476175413),
(40, '订单管理', 0, 'fa-users', 'Order', 'lists', '', '', '', 0, 1, 1476175413),
(41, '订单信息管理', 40, '', 'Ordermanage', 'index', '', '', '', 0, 1, 1476175413),
(42, '订单信息统计查询', 40, '', 'Order', 'lists', '', '', '', 0, 1, NULL),
(43, '详情', 41, '', 'Ordermanage', 'info', '', '', '', 0, 2, 1476175413),
(44, '添加', 41, '', 'Ordermanage', 'add', '', '', '', 0, 2, 1476175413),
(45, '修改', 41, '', 'Ordermanage', 'edit', '', '', '', 0, 2, 1476175413),
(46, '删除', 41, '', 'Ordermanage', 'del', '', '', '', 0, 2, 1476175413),
(47, '详情', 42, '', 'Order', 'lists', '', '', '', 0, 2, 1476175413);

-- --------------------------------------------------------

--
-- 表的结构 `ms_activity`
--

CREATE TABLE IF NOT EXISTS `ms_activity` (
  `id` int(11) unsigned NOT NULL COMMENT '活动Id',
  `activity_name` varchar(50) NOT NULL DEFAULT '' COMMENT '活动名称',
  `product_name` varchar(20) NOT NULL,
  `product_id` int(11) unsigned NOT NULL COMMENT '商品Id',
  `price` int(11) NOT NULL COMMENT '单位：分',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `total` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '活动状态',
  `sec_speed` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '每秒限制多少个商品售出',
  `buy_limit` int(5) unsigned NOT NULL COMMENT '购买限制',
  `buy_rate` decimal(2,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买限制',
  `lastloginip` int(20) NOT NULL,
  `lastlogintime` int(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='@活动数据表';

--
-- 转存表中的数据 `ms_activity`
--

INSERT INTO `ms_activity` (`id`, `activity_name`, `product_name`, `product_id`, `price`, `start_time`, `end_time`, `total`, `status`, `sec_speed`, `buy_limit`, `buy_rate`, `lastloginip`, `lastlogintime`) VALUES
(1, '香蕉大甩卖', '香蕉', 1, 200, 1610114100, 1610199930, 2, 1, 1, 1, '0.20', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ms_order`
--

CREATE TABLE IF NOT EXISTS `ms_order` (
  `id` int(11) NOT NULL,
  `order_sn` varchar(32) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '购买者ID',
  `status` tinyint(1) DEFAULT '0' COMMENT '订单状态1-已下单，2-已处理，3-已发货，4-已收货,5-订单完成',
  `goods_id` int(11) DEFAULT '0' COMMENT '商品id',
  `count` int(11) DEFAULT NULL COMMENT '购买数量',
  `price` int(10) DEFAULT NULL COMMENT '价格，分',
  `created_at` int(20) DEFAULT NULL,
  `updated_at` int(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ms_order`
--

INSERT INTO `ms_order` (`id`, `order_sn`, `user_id`, `status`, `goods_id`, `count`, `price`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL),
(2, '210080000000000000000081', 1, 1, 1, 18, 0, NULL, NULL),
(3, '210080000000000000000847', 1, 1, 1, 2, 200, 0, NULL),
(4, '210080000000000000000081', 1, 1, 1, 2, 200, 0, NULL),
(5, '210080000000000000000081', 0, 1, 1, 2, 200, 0, NULL),
(6, '210080000000000000000081', 1, 1, 1, 2, 200, 0, NULL),
(7, '210080000000000000000081', 1, 1, 1, 2, 200, 0, NULL),
(8, '210080000000000000000887', 1, 1, 1, 2, 200, 0, NULL),
(9, '210090000000000000000081', 1, 1, 1, 2, 200, 0, NULL),
(10, '210090000000000000000081', 1, 1, 1, 2, 200, 0, NULL),
(11, '210090000000000000000887', 1, 1, 1, 2, 200, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `ms_order_log`
--

CREATE TABLE IF NOT EXISTS `ms_order_log` (
  `id` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- 转存表中的数据 `ms_order_log`
--

INSERT INTO `ms_order_log` (`id`, `msg`, `status`, `created_at`) VALUES
(1, 'no num redis', 0, '2020-12-28 07:54:53'),
(2, '已没有库存', 0, '2020-12-28 08:01:55'),
(3, '已没有库存', 0, '2020-12-28 08:03:01'),
(4, '已没有库存', 0, '2020-12-28 08:04:24'),
(5, '已没有库存', 0, '2020-12-28 08:04:51'),
(6, '已没有库存', 0, '2020-12-28 08:04:51'),
(7, '已没有库存', 0, '2020-12-28 08:04:52'),
(8, '已没有库存', 0, '2020-12-28 08:04:53'),
(9, '下单失败', 0, '2020-12-28 08:04:58'),
(10, '已没有库存', 0, '2020-12-28 08:06:17'),
(11, '已没有库存', 0, '2020-12-28 08:07:54'),
(12, '已没有库存', 0, '2020-12-28 08:08:42'),
(13, '下单失败', 0, '2021-01-02 01:57:55'),
(14, '下单失败', 0, '2021-01-02 02:00:34'),
(15, '已没有库存', 0, '2021-01-02 02:05:39'),
(16, '已没有库存', 0, '2021-01-02 02:06:19'),
(17, 'no num redis', 0, '2021-01-02 02:55:03'),
(18, '下单失败', 0, '2021-01-02 02:58:21'),
(19, '下单失败', 0, '2021-01-02 03:02:47'),
(20, '下单失败', 0, '2021-01-02 04:09:22'),
(21, '下单失败', 0, '2021-01-02 04:10:44'),
(22, '下单失败', 0, '2021-01-02 08:24:46'),
(23, '已没有库存', 0, '2021-01-02 09:03:01'),
(24, '已没有库存', 0, '2021-01-02 09:26:12'),
(25, '已没有库存', 0, '2021-01-02 09:29:09'),
(26, '已没有库存', 0, '2021-01-02 09:31:22'),
(27, '已没有库存', 0, '2021-01-02 09:32:19'),
(28, '已没有库存', 0, '2021-01-02 09:35:34'),
(29, '已没有库存', 0, '2021-01-02 09:36:08'),
(30, '已没有库存', 0, '2021-01-02 09:43:09'),
(31, '已没有库存', 0, '2021-01-02 09:43:15'),
(32, 'no num redis', 0, '2021-01-02 09:44:11'),
(33, '已没有库存', 0, '2021-01-02 09:44:24'),
(34, '已没有库存', 0, '2021-01-02 09:47:52'),
(35, '已没有库存', 0, '2021-01-02 10:10:31'),
(36, '已没有库存', 0, '2021-01-02 10:13:36'),
(37, '已没有库存', 0, '2021-01-02 10:16:21'),
(38, '下单失败', 0, '2021-01-02 10:18:41'),
(39, '已没有库存', 0, '2021-01-02 10:23:25'),
(40, '已没有库存', 0, '2021-01-02 11:28:05'),
(41, '已没有库存', 0, '2021-01-02 11:32:05'),
(42, '已没有库存', 0, '2021-01-02 11:32:21'),
(43, '已没有库存', 0, '2021-01-02 11:46:55'),
(44, '下单失败', 0, '2021-01-02 11:47:39'),
(45, '下单失败', 0, '2021-01-02 12:08:45'),
(46, '下单失败', 0, '2021-01-02 12:12:42'),
(47, '下单失败', 0, '2021-01-02 12:13:36'),
(48, '下单失败', 0, '2021-01-02 12:16:09'),
(49, '下单失败', 0, '2021-01-02 12:21:07'),
(50, 'no num redis', 0, '2021-01-02 15:12:05'),
(51, 'no num redis', 0, '2021-01-02 15:12:11'),
(52, '下单失败', 0, '2021-01-03 05:59:20'),
(53, 'no num redis', 0, '2021-01-03 07:57:11'),
(54, 'no num redis', 0, '2021-01-03 08:05:40'),
(55, 'no num redis', 0, '2021-01-03 08:06:26'),
(56, '下单失败', 0, '2021-01-08 08:22:30'),
(57, '下单成功', 1, '0000-00-00 00:00:00'),
(58, '下单成功', 1, '0000-00-00 00:00:00'),
(59, '下单成功', 1, '0000-00-00 00:00:00'),
(60, '下单成功', 1, '0000-00-00 00:00:00'),
(61, '下单成功', 1, '0000-00-00 00:00:00'),
(62, '下单成功', 1, '0000-00-00 00:00:00'),
(63, '下单成功', 1, '0000-00-00 00:00:00'),
(64, '下单成功', 1, '0000-00-00 00:00:00'),
(65, '下单成功', 1, '0000-00-00 00:00:00'),
(66, '下单成功', 1, '0000-00-00 00:00:00'),
(67, '下单成功', 1, '0000-00-00 00:00:00'),
(68, '下单成功', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `ms_product`
--

CREATE TABLE IF NOT EXISTS `ms_product` (
  `product_id` int(11) unsigned NOT NULL COMMENT '商品Id',
  `product_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_price` float NOT NULL,
  `total` int(5) unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商品状态'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='@商品数据表';

--
-- 转存表中的数据 `ms_product`
--

INSERT INTO `ms_product` (`product_id`, `product_name`, `product_price`, `total`, `status`) VALUES
(1, '香蕉', 2.5, 100, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ms_user`
--

CREATE TABLE IF NOT EXISTS `ms_user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) DEFAULT NULL COMMENT '密码'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `ms_user`
--

INSERT INTO `ms_user` (`id`, `username`, `password`) VALUES
(1, 'user1', 'c4ca4238a0b923820dcc');

-- --------------------------------------------------------

--
-- 表的结构 `stumanage`
--

CREATE TABLE IF NOT EXISTS `stumanage` (
  `id` mediumint(6) unsigned NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `token` varchar(50) NOT NULL DEFAULT '',
  `stuID` int(20) NOT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `sex` int(2) NOT NULL COMMENT '男：1女：0',
  `Building` varchar(5) NOT NULL DEFAULT '',
  `Floor` tinyint(2) NOT NULL DEFAULT '0',
  `Unit` tinyint(2) NOT NULL DEFAULT '0',
  `Bed` tinyint(2) NOT NULL DEFAULT '0',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `email` varchar(40) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `roomstatus` int(10) NOT NULL COMMENT '是否有房间，有为0，无为1',
  `updatetime` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `stumanage`
--

INSERT INTO `stumanage` (`id`, `username`, `password`, `token`, `stuID`, `realname`, `sex`, `Building`, `Floor`, `Unit`, `Bed`, `mobile`, `email`, `lastloginip`, `lastlogintime`, `status`, `roomstatus`, `updatetime`) VALUES
(1, '', '', '', 2001210666, '张三', 1, '5', 2, 4, 2, '18888873646', '5552123@qq.com', 2130706433, 1479969414, 1, 1, 1477623198),
(3, 'li', '', '', 2001210444, '', 1, '5', 2, 2, 2, '', '', 0, 0, 1, 1, 0),
(4, 'user2', '2', '', 2001210333, '', 1, '5', 3, 3, 3, '', '', 0, 0, 1, 1, 0),
(5, 'user1', '1', '', 2001210111, '', 1, '', 0, 0, 0, '', '', 0, 0, 1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `admin_group`
--
ALTER TABLE `admin_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`);

--
-- Indexes for table `admin_group_access`
--
ALTER TABLE `admin_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nums` (`total`) USING BTREE;

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_name` (`name`),
  ADD KEY `type` (`type`),
  ADD KEY `group` (`group`);

--
-- Indexes for table `dormanage`
--
ALTER TABLE `dormanage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dorm_bed`
--
ALTER TABLE `dorm_bed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dorm_room`
--
ALTER TABLE `dorm_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `listorder` (`listorder`),
  ADD KEY `parentid` (`parentid`);

--
-- Indexes for table `ms_activity`
--
ALTER TABLE `ms_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_order`
--
ALTER TABLE `ms_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ms_order_log`
--
ALTER TABLE `ms_order_log`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `ms_product`
--
ALTER TABLE `ms_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `ms_user`
--
ALTER TABLE `ms_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stumanage`
--
ALTER TABLE `stumanage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `stupid` (`stuID`),
  ADD KEY `username` (`username`),
  ADD KEY `status` (`status`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `admin_group`
--
ALTER TABLE `admin_group`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=423;
--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID';
--
-- AUTO_INCREMENT for table `dormanage`
--
ALTER TABLE `dormanage`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `ms_activity`
--
ALTER TABLE `ms_activity`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '活动Id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_order`
--
ALTER TABLE `ms_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `ms_order_log`
--
ALTER TABLE `ms_order_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `ms_product`
--
ALTER TABLE `ms_product`
  MODIFY `product_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品Id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ms_user`
--
ALTER TABLE `ms_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stumanage`
--
ALTER TABLE `stumanage`
  MODIFY `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
