-- phpMyAdmin SQL Dump
-- version 3.5.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 03 月 11 日 21:50
-- 服务器版本: 5.1.62
-- PHP 版本: 5.4.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--
CREATE DATABASE `test` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test`;

-- --------------------------------------------------------

--
-- 表的结构 `ComPost`
--

CREATE TABLE IF NOT EXISTS `ComPost` (
  `PoId` int(11) NOT NULL AUTO_INCREMENT,
  `CId` int(11) NOT NULL,
  `PoUId` int(11) NOT NULL,
  `CType` varchar(45) NOT NULL,
  `Content` text NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`PoId`,`CId`),
  KEY `CId_idx` (`CId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `Community`
--

CREATE TABLE IF NOT EXISTS `Community` (
  `CId` int(11) NOT NULL AUTO_INCREMENT,
  `CType` varchar(45) NOT NULL,
  PRIMARY KEY (`CId`,`CType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `Project`
--

CREATE TABLE IF NOT EXISTS `Project` (
  `PId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Desc` varchar(5000) NOT NULL,
  `ComType` varchar(30) NOT NULL,
  `ComId` int(11) NOT NULL,
  `AmountReq` double NOT NULL,
  `AmountGot` double NOT NULL,
  `PRep` int(11) NOT NULL,
  PRIMARY KEY (`PId`),
  KEY `ComType_idx` (`ComType`),
  KEY `ComId_idx` (`ComId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ProjectRev`
--

CREATE TABLE IF NOT EXISTS `ProjectRev` (
  `PRId` int(11) NOT NULL,
  `PId` int(11) NOT NULL,
  `UId` int(11) NOT NULL,
  `Review` text NOT NULL,
  PRIMARY KEY (`PRId`,`PId`),
  KEY `PId_idx` (`PId`),
  KEY `UId_idx` (`UId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `UId` int(11) NOT NULL AUTO_INCREMENT,
  `UClass` int(11) NOT NULL DEFAULT '0',
  `IRep` int(11) DEFAULT NULL,
  `RRep` int(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Pwd` varchar(100) NOT NULL,
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Skill` text,
  `Interested` text,
  PRIMARY KEY (`UId`),
  UNIQUE KEY `UId_UNIQUE` (`UId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `UserFP`
--

CREATE TABLE IF NOT EXISTS `UserFP` (
  `FId` int(11) NOT NULL,
  `UId` int(11) NOT NULL,
  `PId` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Amount` double NOT NULL,
  PRIMARY KEY (`FId`,`UId`,`PId`),
  KEY `UId_idx` (`UId`),
  KEY `PId_idx` (`PId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `UserSP`
--

CREATE TABLE IF NOT EXISTS `UserSP` (
  `UId` int(11) NOT NULL,
  `PId` int(11) NOT NULL,
  `SDate` date NOT NULL,
  PRIMARY KEY (`UId`,`PId`),
  UNIQUE KEY `UId_UNIQUE` (`UId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
