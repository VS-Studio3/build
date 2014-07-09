-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 09 2014 г., 14:09
-- Версия сервера: 5.5.33-log
-- Версия PHP: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `build`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_assets`
--

CREATE TABLE IF NOT EXISTS `bzrnp_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Дамп данных таблицы `bzrnp_assets`
--

INSERT INTO `bzrnp_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 75, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 26, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 27, 28, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 29, 30, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 31, 32, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 33, 34, 1, 'com_login', 'com_login', '{}'),
(13, 1, 35, 36, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 37, 38, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 39, 40, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 41, 42, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 43, 44, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 45, 46, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 47, 50, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 51, 52, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 53, 54, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 55, 56, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 57, 58, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 59, 62, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 63, 66, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 67, 68, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 48, 49, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 64, 65, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 60, 61, 1, 'com_users.notes.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 69, 70, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(35, 1, 71, 72, 1, 'com_zoo', 'com_zoo', '{}'),
(36, 1, 73, 74, 1, 'com_nivosliderpro', 'com_nivosliderpro', '{}'),
(37, 8, 22, 25, 2, 'com_content.category.8', 'Новости', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(38, 37, 23, 24, 3, 'com_content.article.1', 'Первый материал', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(39, 27, 19, 20, 3, 'com_content.article.2', 'О компании', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_associations`
--

CREATE TABLE IF NOT EXISTS `bzrnp_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_banners`
--

CREATE TABLE IF NOT EXISTS `bzrnp_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_banner_clients`
--

CREATE TABLE IF NOT EXISTS `bzrnp_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_banner_tracks`
--

CREATE TABLE IF NOT EXISTS `bzrnp_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_categories`
--

CREATE TABLE IF NOT EXISTS `bzrnp_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `bzrnp_categories`
--

INSERT INTO `bzrnp_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`) VALUES
(1, 0, 0, 0, 15, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2009-10-18 16:07:09', 0, '0000-00-00 00:00:00', 0, '*'),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:26:37', 0, '0000-00-00 00:00:00', 0, '*'),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:35', 0, '0000-00-00 00:00:00', 0, '*'),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:27:57', 0, '0000-00-00 00:00:00', 0, '*'),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:15', 0, '0000-00-00 00:00:00', 0, '*'),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users.notes', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2010-06-28 13:28:33', 0, '0000-00-00 00:00:00', 0, '*'),
(8, 37, 1, 13, 14, 1, 'novosti', 'com_content', 'Новости', 'novosti', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"category_layout":"","image":""}', '', '', '{"author":"","robots":""}', 42, '2014-06-27 08:12:03', 0, '0000-00-00 00:00:00', 0, '*');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_contact_details`
--

CREATE TABLE IF NOT EXISTS `bzrnp_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_content`
--

CREATE TABLE IF NOT EXISTS `bzrnp_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `bzrnp_content`
--

INSERT INTO `bzrnp_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 38, 'Первый материал', 'pervyj-material', '', '<p>Не следует, однако <span style="line-height: 1.3em;">забывать, </span><span style="line-height: 1.3em;">что сложившаяся </span><span style="line-height: 1.3em;">структура организации </span><span style="line-height: 1.3em;">требуют от нас анализа </span><span style="line-height: 1.3em;">дальнейших направлений</span></p>', '', 1, 0, 0, 8, '2014-06-27 08:13:40', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-06-27 08:13:40', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 39, 'О компании', 'o-kompanii', '', '<p>Не следует, однако забывать, что реализация намеченных плановых заданий в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа форм развития. Не следует, однако забывать, что реализация намеченных плановых заданий играет важную роль в формировании существенных финансовых и административных условий.</p>\r\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа модели развития. Товарищи! реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Идейные соображения высшего порядка, а также новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании модели развития. Не следует, однако забывать, что консультация с широким активом представляет собой интересный эксперимент проверки форм развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют определения и уточнения форм развития.</p>', '', 1, 0, 0, 2, '2014-06-27 08:41:56', 42, '', '2014-06-27 08:46:25', 42, 0, '0000-00-00 00:00:00', '2014-06-27 08:41:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"0","show_article_options":"0","show_urls_images_backend":"0","show_urls_images_frontend":"0"}', 5, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `bzrnp_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_content_frontpage`
--

INSERT INTO `bzrnp_content_frontpage` (`content_id`, `ordering`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_content_rating`
--

CREATE TABLE IF NOT EXISTS `bzrnp_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `bzrnp_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_extensions`
--

CREATE TABLE IF NOT EXISTS `bzrnp_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10046 ;

--
-- Дамп данных таблицы `bzrnp_extensions`
--

INSERT INTO `bzrnp_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"legacy":false,"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"ru-RU","site":"ru-RU"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html","enable_flash":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"legacy":false,"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"legacy":false,"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"10":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"12":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","useractivation":"1","frontend_userparams":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"legacy":false,"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/","version":"5.2","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"legacy":false,"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"legacy":false,"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"11.4","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"legacy":false,"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"legacy":false,"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"legacy":false,"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"legacy":false,"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"legacy":false,"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"legacy":false,"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"legacy":false,"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(405, 'plg_content_geshi', 'plugin', 'geshi', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_geshi","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"","authorUrl":"qbnz.com\\/highlighter","version":"2.5.0","description":"PLG_CONTENT_GESHI_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 1, '{"legacy":false,"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"2.5.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2013","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.4.1","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"legacy":false,"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"legacy":false,"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"legacy":false,"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0),
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0);
INSERT INTO `bzrnp_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"legacy":false,"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"legacy":false,"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 1, '{"legacy":false,"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"legacy":false,"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"legacy":false,"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"legacy":false,"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 1, 1, 0, '{"legacy":false,"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"legacy":false,"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(500, 'atomic', 'template', 'atomic', '', 0, 1, 1, 0, '{"legacy":false,"name":"atomic","type":"template","creationDate":"10\\/10\\/09","author":"Ron Severdia","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"contact@kontentdesign.com","authorUrl":"http:\\/\\/www.kontentdesign.com","version":"2.5.0","description":"TPL_ATOMIC_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(502, 'bluestork', 'template', 'bluestork', '', 1, 1, 1, 0, '{"legacy":false,"name":"bluestork","type":"template","creationDate":"07\\/02\\/09","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"TPL_BLUESTORK_XML_DESCRIPTION","group":""}', '{"useRoundedCorners":"1","showSiteName":"0","textBig":"0","highContrast":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez_20', 'template', 'beez_20', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez_20","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ2_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"legacy":false,"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"2.5.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(505, 'beez5', 'template', 'beez5', '', 0, 1, 1, 0, '{"legacy":false,"name":"beez5","type":"template","creationDate":"21 May 2010","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2014 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"2.5.0","description":"TPL_BEEZ5_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","html5":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.19","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"legacy":false,"name":"English (United Kingdom)","type":"language","creationDate":"2008-03-15","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.19","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"files_joomla","type":"file","creationDate":"June 2014","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.22","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(800, 'PKG_JOOMLA', 'package', 'pkg_joomla', '', 0, 1, 1, 1, '{"legacy":false,"name":"PKG_JOOMLA","type":"package","creationDate":"2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"2.5.0","description":"PKG_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10000, 'Russian', 'language', 'ru-RU', '', 0, 1, 0, 0, '{"legacy":true,"name":"Russian","type":"language","creationDate":"2014-06-12","author":"Russian Translation Team","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved","authorEmail":"smart@joomlaportal.ru","authorUrl":"www.joomlaportal.ru","version":"2.5.22.1","description":"Russian language pack (site) for Joomla! 2.5","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'Russian', 'language', 'ru-RU', '', 1, 1, 0, 0, '{"legacy":true,"name":"Russian","type":"language","creationDate":"2014-06-12","author":"Russian Translation Team","copyright":"Copyright (C) 2005 - 2014 Open Source Matters. All rights reserved","authorEmail":"smart@joomlaportal.ru","authorUrl":"www.joomlaportal.ru","version":"2.5.22.1","description":"Russian language pack (administrator) for Joomla! 2.5","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'ru-RU', 'package', 'pkg_ru-RU', '', 0, 1, 1, 0, '{"legacy":false,"name":"Russian Language Pack","type":"package","creationDate":"Unknown","author":"Unknown","copyright":"","authorEmail":"","authorUrl":"","version":"2.5.22.1","description":"Joomla 2.5 Russian Language Package","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10022, 'Search - ZOO', 'plugin', 'zoosearch', 'search', 0, 1, 1, 0, '{"legacy":false,"name":"Search - ZOO","type":"plugin","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Search plugin for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{"search_fulltext":"0","search_limit":"50"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10021, 'Smart Search - ZOO', 'plugin', 'zoosmartsearch', 'finder', 0, 1, 1, 0, '{"legacy":false,"name":"Smart Search - ZOO","type":"plugin","creationDate":"Febuary 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"2.5.0","description":"Smart Search plugin for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10020, 'Content - ZOO Shortcode', 'plugin', 'zooshortcode', 'content', 0, 1, 1, 0, '{"legacy":false,"name":"Content - ZOO Shortcode","type":"plugin","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Shortcode plugin for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com) Usage: {zooitem OR zoocategory: ID OR alias} Optionally: {zooitem: ID text: MYTEXT}","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10019, 'ZOO Tag', 'module', 'mod_zootag', '', 0, 1, 0, 0, '{"legacy":false,"name":"ZOO Tag","type":"module","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Tag module for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{"theme":"","application":"","subcategories":"0","count":"10","order":"alpha","menu_item":"","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10018, 'ZOO Quick Icons', 'module', 'mod_zooquickicon', '', 1, 1, 2, 0, '{"legacy":false,"name":"ZOO Quick Icons","type":"module","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Quick Icons module for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(10014, 'com_zoo', 'component', 'com_zoo', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_zoo","type":"component","creationDate":"March 2014","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.1.6","description":"ZOO component for Joomla 2.5+ developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10015, 'ZOO Category', 'module', 'mod_zoocategory', '', 0, 1, 0, 0, '{"legacy":false,"name":"ZOO Category","type":"module","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Category module for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{"theme":"","application":"","depth":"0","add_count":"0","menu_item":"","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10016, 'ZOO Comment', 'module', 'mod_zoocomment', '', 0, 1, 0, 0, '{"legacy":false,"name":"ZOO Comment","type":"module","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Comment module for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{"theme":"","application":"","subcategories":"0","count":"10","show_avatar":"1","avatar_size":"40","show_author":"1","show_meta":"1","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10017, 'ZOO Item', 'module', 'mod_zooitem', '', 0, 1, 0, 0, '{"legacy":false,"name":"ZOO Item","type":"module","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.1","description":"Item module for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{"theme":"","layout":"","media_position":"left","application":"","subcategories":"0","count":"4","order":"_itemname","moduleclass_sfx":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.2","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10023, 'System - ZOO Event', 'plugin', 'zooevent', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - ZOO Event","type":"plugin","creationDate":"October 2012","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.0.0","description":"Event plugin for ZOO developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10024, 'zoo', 'package', 'pkg_zoo', '', 0, 1, 1, 0, '{"legacy":false,"name":"ZOO Package","type":"package","creationDate":"March 2014","author":"YOOtheme","copyright":"Copyright (C) YOOtheme GmbH","authorEmail":"info@yootheme.com","authorUrl":"http:\\/\\/www.yootheme.com","version":"3.1.6","description":"ZOO component and extensions for Joomla 2.5+ developed by YOOtheme (http:\\/\\/www.yootheme.com)","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10039, 'JBZoo App', 'file', 'file_jbuniversal', '', 0, 1, 0, 0, '{"legacy":false,"name":"JBZoo App","type":"file","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com,  All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZoo App is universal Joomla CCK, application for YooTheme Zoo component","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10040, 'System - JBZoo (events)', 'plugin', 'jbzoo', 'system', 0, 1, 1, 0, '{"legacy":false,"name":"System - JBZoo (events)","type":"plugin","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com, All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"Event plugin for JBZoo App","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10041, 'JBZoo Cart', 'module', 'mod_jbzoo_basket', '', 0, 1, 0, 0, '{"legacy":false,"name":"JBZoo Cart","type":"module","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com, All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZOO_CART_MODULE_DESCRIPTION","group":""}', '{"app_id":"0","currency":"RUR","menuitem":"0","items_show":"1","lots_show":"1","summa_show":"1","cancel_show":"1","link_show":"1","cache":"0","owncache":"0","cache_time":"0","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10042, 'JBZoo Category List', 'module', 'mod_jbzoo_category', '', 0, 1, 0, 0, '{"legacy":false,"name":"JBZoo Category List","type":"module","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com, All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZOO_CATEGORY_MODULE_DESCRIPTION","group":""}', '{"application":"0:0","type_id":"false","category_limit":"0","item_order":"priority","items_limit":"4","category_order":"priority","category_display_image":"1","category_image_width":"100","category_image_height":"100","category_image_align":"left","category_display_description":"1","display_count_items":"1","display_items":"1","items_image_align":"left","layout":"default","item_layout":"default","category_display_border":"1","moduleclass_sfx":"","cache":"","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10029, 'krovlya', 'template', 'krovlya', '', 0, 1, 1, 0, '{"legacy":false,"name":"krovlya","type":"template","creationDate":"24-09-2013","author":"krovlya","copyright":"Copyright (C) 2013","authorEmail":"asd@asd.ru","authorUrl":"","version":"1.0","description":"krovlya","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10030, 'Unite Nivo Slider Pro', 'module', 'mod_unite_nivopro', '', 0, 1, 0, 0, '{"legacy":false,"name":"Unite Nivo Slider Pro","type":"module","creationDate":"May 2012","author":"Unite CMS","copyright":"Copyright (C) 2012 UniteCMS.net, All rights reserved.","authorEmail":"support@unitecms.net","authorUrl":"http:\\/\\/www.unitecms.net","version":"3.0.4","description":"\\n\\t\\t\\t<div style=\\"font-weight:normal;\\">\\n\\t\\t\\t<p><strong>Unite Nivo Slider PRO<\\/strong> module. Put nivo slider on any page. All the sliders configuration located in Nivo Slider Pro Component.<\\/p>\\n\\t\\t\\t<p>\\n\\t\\t\\t\\tFor support please turn to <a href=\\"http:\\/\\/unitecms.net\\/free-joomla-extensions\\/unite-nivo-slider-pro\\/nivo-slider-pro-support\\" target=\\"_blank\\">Nivo Slider Support Page<\\/a>\\n\\t\\t\\t<\\/p>\\n\\t\\t\\t<small style=\\"float:right\\">ver. 3.0.4<\\/small>\\n\\t\\t\\t<\\/div>\\n     \\n\\t ","group":""}', '{"include_jquery":"true","js_load_type":"head","no_conflict_mode":"false","cache":"1","cache_time":"900","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10031, 'com_nivosliderpro', 'component', 'com_nivosliderpro', '', 1, 1, 0, 0, '{"legacy":false,"name":"com_nivosliderpro","type":"component","creationDate":"May 2012","author":"Unite CMS","copyright":"Copyright (C) 2012 UniteCMS.net, All rights reserved.","authorEmail":"support@unitecms.net","authorUrl":"http:\\/\\/www.unitecms.net","version":"3.0.5","description":"\\n\\t\\tUnite Nivo Slider Pro extension and module installation success!\\n\\t","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10032, 'MOD_JUNEWSULTRA', 'module', 'mod_junewsultra', '', 0, 1, 0, 0, '{"legacy":false,"name":"MOD_JUNEWSULTRA","type":"module","creationDate":"09.12.2012","author":"Denys Nosov","copyright":"This module is licensed under a Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 License.","authorEmail":"denys@joomla-ua.org","authorUrl":"http:\\/\\/www.joomla-ua.org","version":"4.5.5","description":"MOD_JUNEWS_XML_DESCRIPTION","group":""}', '{"display_article":"0","articleid":"","count":"5","count_skip":"0","show_featured":"","catid":"","category_filtering_type":"1","show_child_category_articles":"1","levels":"999","date_filtering":"0","date_field":"a.created","relative_date":"0","custom_days":"30","ordering":"created_desc","user_id":"0","cache":"1","cache_time":"900","cachemode":"static","jquery":"0","bootstrap_js":"0","bootstrap_css":"0","empty_mod":"0","cssstyle":"1","moduleclass_sfx":"","show_title":"1","title_limit":"0","title_limit_mode":"1","title_limit_count":"20","end_limit_title":"...","title_prepare":"0","content_prepare":"0","show_intro":"1","clear_tag":"1","allowed_intro_tags":"","li":"1","lmttext":"1","introtext_limit":"20","end_limit_introtext":"...","show_full":"0","clear_tag_full":"1","allowed_full_tags":"","li_full":"1","lmttext_full":"1","fulltext_limit":"20","end_limit_fulltext":"...","juauthor":"0","read_more":"0","rmtext":"Read more...","show_date":"1","data_format":"d.m.Y","df_d":"d","df_m":"m","df_y":"Y","showcat":"0","showcatlink":"0","showHits":"0","showRating":"0","showRatingCount":"0","all_in":"0","all_in_position":"0","item_heading":"span","class_all_in":"","custom_heading":"0","text_all_in":"","link_all_in":"","text_all_in2":"","link_menuitem":"","pik":"1","image_source":"0","imglink":"1","tips":"1","imageWidth":"70","imageHeight":"70","thumb_width":"1","source_rectangle":"0","sx":"0","sy":"0","sw":"","sh":"","Zoom_Crop":"1","thumb_filtercolor":"0","colorized":"25","colorpicker":"#0000ff","thumb_th_seting":"10","thumb_filters":"1","thumb_unsharp":"1","thumb_unsharp_amount":"80","thumb_unsharp_radius":"1","thumb_unsharp_threshold":"3","thumb_blur":"0","thumb_blur_seting":"1","thumb_brit":"0","thumb_brit_seting":"50","thumb_cont":"0","thumb_cont_seting":"50","defaultimg":"1","noimage":"","img_cache":"cache","cache_maxage_img":"30","cache_maxsize_img":"10","cache_maxfiles_img":"200","use_imagemagick":"1","imagemagick_path":"","img_ext":"jpg","link_enabled":"1","use_comments":"0","select_comments":"jcomments","youtube_img_show":"1","gallery":"1","copy":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10033, 'JUNewsUltra - List template', 'file', 'ju-ul-li-list', '', 0, 1, 0, 0, '{"legacy":false,"name":"JUNewsUltra - List template","type":"file","creationDate":"20.11.2012","author":"Joomla! Ukraine","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"denys@joomla-ua.org","authorUrl":"www.joomla-ua.org","version":"3.3","description":"List template for module JUNewsUltra","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10034, 'JUNewsUltra - Default template', 'file', 'default', '', 0, 1, 0, 0, '{"legacy":false,"name":"JUNewsUltra - Default template","type":"file","creationDate":"20.11.2012","author":"Joomla! Ukraine","copyright":"Copyright (C) 2005 - 2011 Open Source Matters. All rights reserved","authorEmail":"denys@joomla-ua.org","authorUrl":"www.joomla-ua.org","version":"3.4","description":"Default template for module JUNewsUltra","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10035, 'JUNewsUltra - Bootstrap Highly customizable template', 'file', 'bootstrap-highly-customizable', '', 0, 1, 0, 0, '{"legacy":false,"name":"JUNewsUltra - Bootstrap Highly customizable template","type":"file","creationDate":"22.11.2012","author":"Joomla! Ukraine","copyright":"Copyright (C) 2012 Joomla! Ukraine. All rights reserved","authorEmail":"denys@joomla-ua.org","authorUrl":"www.joomla-ua.org","version":"1.4","description":"Bootstrap Highly customizable template for module JUNewsUltra","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10036, 'JUNewsUltra - Bootstrap Highly customizable template', 'file', 'bootstrap-carousel', '', 0, 1, 0, 0, '{"legacy":false,"name":"JUNewsUltra - Bootstrap Highly customizable template","type":"file","creationDate":"22.11.2012","author":"Joomla! Ukraine","copyright":"Copyright (C) 2012 Joomla! Ukraine. All rights reserved","authorEmail":"denys@joomla-ua.org","authorUrl":"www.joomla-ua.org","version":"1.2","description":"Bootstrap Highly customizable template for module JUNewsUltra","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10037, 'junewsultra', 'package', 'pkg_junewsultra', '', 0, 1, 1, 0, '{"legacy":false,"name":"MOD_JUNEWSULTRA","type":"package","creationDate":"09.12.2012","author":"Denys Nosov, Joomla! Ukraine","copyright":"(C) 2009-2012 Denys Nosov, Joomla! Ukraine","authorEmail":"denys@joomla-ua.org","authorUrl":"http:\\/\\/www.joomla-ua.org","version":"4.5.5","description":"MOD_JUNEWS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10038, 'TinyMCE ru-RU', 'file', 'tinymce_ru-ru', '', 0, 1, 0, 0, '{"legacy":false,"name":"TinyMCE ru-RU","type":"file","creationDate":"2012-06-19","author":"Russian Translation Team","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved","authorEmail":"smart@joomlaportal.ru","authorUrl":"www.joomlaportal.ru","version":"3.5.2.1","description":"Russian Language Package for TinyMCE 3.5.2.1 in Joomla 2.5","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10043, 'JBZoo Search List', 'module', 'mod_jbzoo_props', '', 0, 1, 0, 0, '{"legacy":false,"name":"JBZoo Search List","type":"module","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com, All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZOO_SEARCH_LIST_MODULE_DESCRIPTION","group":""}', '{"application":"","type":"","item_layout":"default","menuitem":"0","moduleclass_sfx":"","limit":"20","depend":"1","count":"1","order":"none","cache":"1","cache_time":"900","cachemode":"safeuri"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10044, 'JBZoo Search', 'module', 'mod_jbzoo_search', '', 0, 1, 0, 0, '{"legacy":false,"name":"JBZoo Search","type":"module","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com, All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZOO_SEARCH_MODULE_DESCRIPTION","group":""}', '{"application":"","type":"","item_layout":"default","menuitem":"0","moduleclass_sfx":"","logic":"and","logic_show":"1","pages":"20","pages_show":"1","order_show":"1","order_list":"","order_mode":"s","order_default":"","button_submit_show":"1","button_reset_show":"0","autosubmit":"0","exact":"1","cache":"0","owncache":"0","cache_time":"0","cachemode":"itemid"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10045, 'jbzoo', 'package', 'pkg_jbzoo', '', 0, 1, 1, 0, '{"legacy":false,"name":"JBZoo Package","type":"package","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com,  All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZoo App is universal Joomla CCK, application for YooTheme Zoo component. Developed by JBZoo.com","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_filters`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Дамп данных таблицы `bzrnp_finder_links`
--

INSERT INTO `bzrnp_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(40, 'index.php?option=com_zoo&view=item&id=13', 'index.php?option=com_zoo&task=item&item_id=13&Itemid=149', 'Товар 4', '', '2014-07-09 13:05:32', '90b5e7e4fd28b98c02b0c18c779d4eaf', 1, 0, 1, '*', '2014-07-09 10:05:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223133223b733a353a22616c696173223b733a373a22746f7661722d34223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d30392031303a30353a3239223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d34223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a333a22343537223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a373a2250726f64756374223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2250726f64756374223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3133223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3133264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802034223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392031303a30353a3030223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(36, 'index.php?option=com_zoo&view=item&id=10', 'index.php?option=com_zoo&task=item&item_id=10&Itemid=149', 'Товар', '', '2014-07-09 12:57:10', '6304e1edcc6ed3af8d92e1fd6cf9c6a2', 1, 0, 1, '*', '2014-07-09 07:28:16', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223130223b733a353a22616c696173223b733a353a22746f766172223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d30392030393a35373a3038223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39343a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f766172223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a333a22353030223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a373a2250726f64756374223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2250726f64756374223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3130223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3130264974656d69643d313439223b733a353a227469746c65223b733a31303a22d0a2d0bed0b2d0b0d180223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392030373a32383a3136223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(38, 'index.php?option=com_zoo&view=item&id=11', 'index.php?option=com_zoo&task=item&item_id=11&Itemid=149', 'Товар 2', '', '2014-07-09 12:59:04', 'e0267ce94238f384aa0c7e2681832a87', 1, 0, 1, '*', '2014-07-09 09:57:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223131223b733a353a22616c696173223b733a373a22746f7661722d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d30392030393a35393a3032223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d32223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a343a2231303030223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a373a2250726f64756374223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2250726f64756374223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a33373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b520d18dd0bbd0b5d0bcd0b5d0bdd182d18b223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a33373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b520d18dd0bbd0b5d0bcd0b5d0bdd182d18b223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3131223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3131264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802032223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392030393a35373a3235223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(39, 'index.php?option=com_zoo&view=item&id=12', 'index.php?option=com_zoo&task=item&item_id=12&Itemid=149', 'Товар 3', '', '2014-07-09 13:02:33', '02c39eb9ee269033610dd747e73c6f3b', 1, 0, 1, '*', '2014-07-09 10:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223132223b733a353a22616c696173223b733a373a22746f7661722d33223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d30392031303a30323a3330223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d33223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a383a223433323532333435223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a373a2250726f64756374223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a373a2250726f64756374223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3132223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3132264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802033223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392031303a30323a3034223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms0`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms1`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms2`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms3`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms4`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_terms4`
--

INSERT INTO `bzrnp_finder_links_terms4` (`link_id`, `term_id`, `weight`) VALUES
(36, 580, 0.08004),
(36, 581, 1.76004),
(36, 582, 0.72),
(36, 583, 1.64004),
(36, 584, 2.16);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms5`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_terms5`
--

INSERT INTO `bzrnp_finder_links_terms5` (`link_id`, `term_id`, `weight`) VALUES
(36, 585, 0.80004),
(36, 586, 2.00004),
(36, 587, 2.07996),
(36, 589, 0.56661),
(38, 589, 0.56661),
(38, 599, 0.80004),
(38, 600, 1.95996),
(38, 601, 2.09661),
(39, 589, 0.56661),
(39, 607, 2.09661),
(40, 589, 0.56661),
(40, 612, 2.09661);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms6`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms7`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms8`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_terms8`
--

INSERT INTO `bzrnp_finder_links_terms8` (`link_id`, `term_id`, `weight`) VALUES
(36, 577, 0.6666),
(36, 578, 0.56004),
(38, 577, 0.6666),
(38, 578, 0.56004),
(38, 602, 0.63996),
(39, 577, 0.6666),
(39, 578, 0.56004),
(40, 577, 0.6666),
(40, 578, 0.56004);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_terms9`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_terms9`
--

INSERT INTO `bzrnp_finder_links_terms9` (`link_id`, `term_id`, `weight`) VALUES
(36, 588, 0.96);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termsa`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_termsa`
--

INSERT INTO `bzrnp_finder_links_termsa` (`link_id`, `term_id`, `weight`) VALUES
(39, 605, 0.96),
(40, 609, 0.37),
(40, 610, 0.36);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termsb`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termsc`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_termsc`
--

INSERT INTO `bzrnp_finder_links_termsc` (`link_id`, `term_id`, `weight`) VALUES
(36, 575, 0.34),
(38, 595, 0.48),
(38, 596, 0.34),
(38, 597, 0.37),
(39, 603, 0.34),
(40, 608, 0.34);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termsd`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termse`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_links_termse`
--

INSERT INTO `bzrnp_finder_links_termse` (`link_id`, `term_id`, `weight`) VALUES
(36, 576, 0.36),
(36, 579, 0.6666),
(38, 579, 0.6666),
(38, 598, 2.4666),
(39, 579, 0.6666),
(39, 604, 0.37),
(39, 606, 2.4666),
(40, 579, 0.6666),
(40, 611, 2.4666);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_links_termsf`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_taxonomy`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Дамп данных таблицы `bzrnp_finder_taxonomy`
--

INSERT INTO `bzrnp_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0),
(2, 1, 'Type', 1, 1, 0),
(5, 1, 'Category', 1, 1, 0),
(60, 2, 'Product', 1, 1, 0),
(61, 5, 'Кровельный иструмент и оборудование', 1, 1, 0),
(62, 5, 'Кровельные элементы', 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_taxonomy_map`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_taxonomy_map`
--

INSERT INTO `bzrnp_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(36, 60),
(36, 61),
(38, 60),
(38, 62),
(39, 60),
(40, 60);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_terms`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=613 ;

--
-- Дамп данных таблицы `bzrnp_finder_terms`
--

INSERT INTO `bzrnp_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`) VALUES
(612, 'товар 4', 'товар 4', 0, 1, 1.2333, 'т000', 1),
(611, 'tovar 4', 'tovar 4', 0, 1, 1.2333, 'T160', 1),
(610, '457', '457', 0, 0, 0.3, '', 1),
(608, '13', '13', 0, 0, 0.2, '', 1),
(609, '4', '4', 0, 0, 0.1, '', 1),
(607, 'товар 3', 'товар 3', 0, 1, 1.2333, 'т000', 1),
(606, 'tovar 3', 'tovar 3', 0, 1, 1.2333, 'T160', 1),
(605, '43252345', '43252345', 0, 0, 0.8, '', 1),
(604, '3', '3', 0, 0, 0.1, '', 1),
(603, '12', '12', 0, 0, 0.2, '', 1),
(601, 'товар 2', 'товар 2', 0, 1, 1.2333, 'т000', 1),
(602, 'элементы', 'элементы', 0, 0, 0.5333, 'э000', 1),
(600, 'кровельные элементы', 'кровельные элементы', 0, 1, 1.6333, 'к000', 1),
(587, 'кровельный иструмент и', 'кровельный иструмент и', 0, 1, 1.7333, 'к000', 1),
(588, 'оборудование', 'оборудование', 0, 0, 0.8, 'о000', 1),
(589, 'товар', 'товар', 0, 0, 0.3333, 'т000', 4),
(599, 'кровельные', 'кровельные', 0, 0, 0.6667, 'к000', 1),
(598, 'tovar 2', 'tovar 2', 0, 1, 1.2333, 'T160', 1),
(597, '2', '2', 0, 0, 0.1, '', 1),
(596, '11', '11', 0, 0, 0.2, '', 1),
(595, '1000', '1000', 0, 0, 0.4, '', 1),
(585, 'кровельный', 'кровельный', 0, 0, 0.6667, 'к000', 1),
(586, 'кровельный иструмент', 'кровельный иструмент', 0, 1, 1.6667, 'к000', 1),
(584, 'иструмент и оборудование', 'иструмент и оборудование', 0, 1, 1.8, 'и000', 1),
(583, 'иструмент и', 'иструмент и', 0, 1, 1.3667, 'и000', 1),
(582, 'иструмент', 'иструмент', 0, 0, 0.6, 'и000', 1),
(581, 'и оборудование', 'и оборудование', 0, 1, 1.4667, 'и000', 1),
(580, 'и', 'и', 0, 0, 0.0667, 'и000', 1),
(579, 'tovar', 'tovar', 0, 0, 0.3333, 'T160', 4),
(578, 'product', 'product', 0, 0, 0.4667, 'P6323', 4),
(577, 'index', 'index', 0, 0, 0.3333, 'I532', 4),
(576, '500', '500', 0, 0, 0.3, '', 1),
(575, '10', '10', 0, 0, 0.2, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_terms_common`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_finder_terms_common`
--

INSERT INTO `bzrnp_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_tokens`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_tokens_aggregate`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_finder_types`
--

CREATE TABLE IF NOT EXISTS `bzrnp_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `bzrnp_finder_types`
--

INSERT INTO `bzrnp_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'ZOO Item', ''),
(2, 'Category', ''),
(3, 'Contact', ''),
(4, 'Article', ''),
(5, 'News Feed', ''),
(6, 'Web Link', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_languages`
--

CREATE TABLE IF NOT EXISTS `bzrnp_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_ordering` (`ordering`),
  KEY `idx_access` (`access`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `bzrnp_languages`
--

INSERT INTO `bzrnp_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_menu`
--

CREATE TABLE IF NOT EXISTS `bzrnp_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(333)),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=174 ;

--
-- Дамп данных таблицы `bzrnp_menu`
--

INSERT INTO `bzrnp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 179, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 41, 42, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 33, 34, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 35, 40, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 36, 37, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 38, 39, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 31, 32, 0, '*', 1),
(101, 'mainmenu', 'О компании', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"featured_categories":[""],"layout_type":"blog","num_leading_articles":"1","num_intro_articles":"3","num_columns":"3","num_links":"0","multi_column_order":"1","orderby_pri":"","orderby_sec":"front","order_date":"","show_pagination":"2","show_pagination_results":"1","show_title":"","link_titles":"0","show_intro":"","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_vote":"0","show_readmore":"0","show_readmore_title":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_hits":"0","show_noauth":"1","show_feed_link":"1","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":0,"page_title":"\\u0421\\u0442\\u0440\\u043e\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0430\\u044f \\u043a\\u043e\\u043c\\u043f\\u0430\\u043d\\u0438\\u044f \\u043a\\u0440\\u043e\\u0432\\u043b\\u0438 \\u0438 \\u0444\\u0430\\u0441\\u0430\\u0434\\u043e\\u0432","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 29, 30, 1, '*', 0),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 41, 42, 0, '*', 1),
(106, 'main', 'com_zoo', 'com-zoo', '', 'com-zoo', 'index.php?option=com_zoo', 'component', 0, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_zoo/assets/images/zoo_16.png', 0, '', 43, 44, 0, '', 1),
(107, 'top-menu', 'Кровля', '2014-06-27-07-33-20', '', '2014-06-27-07-33-20', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"1","application":"1","menu-anchor_title":"","menu-anchor_css":"krovlya","menu_image":"images\\/krovlya.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 45, 98, 0, '*', 0),
(108, 'top-menu', 'Фасад', '2014-06-27-07-34-23', '', '2014-06-27-07-34-23', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"2","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/fasad.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 99, 116, 0, '*', 0),
(109, 'top-menu', 'Стена', '2014-06-27-07-35-03', '', '2014-06-27-07-35-03', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"3","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/stena.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 117, 122, 0, '*', 0),
(110, 'top-menu', 'Забор', '2014-06-27-07-35-48', '', '2014-06-27-07-35-48', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"4","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/zabor.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 123, 134, 0, '*', 0),
(111, 'top-menu', 'Мой любимый дом', '2014-06-27-07-36-29', '', '2014-06-27-07-36-29', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"5","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/dom.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 135, 154, 0, '*', 0),
(112, 'top-menu', 'Услуги', '2014-06-27-07-37-45', '', '2014-06-27-07-37-45', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"6","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/uslugi.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 155, 166, 0, '*', 0),
(113, 'top-menu', 'Контакты', '2014-06-27-07-39-20', '', '2014-06-27-07-39-20', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"7","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/kontakty.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 167, 168, 0, '*', 0),
(114, 'main', 'COM_NIVOSLIDERPRO', 'com-nivosliderpro', '', 'com-nivosliderpro', 'index.php?option=com_nivosliderpro', 'component', 0, 1, 1, 10031, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_nivosliderpro/assets/images/icon-16-nivopro.png', 0, '', 169, 170, 0, '', 1),
(115, 'hidden-menu', 'Смотрите все новости', 'smotrite-vse-novosti', '', 'smotrite-vse-novosti', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 171, 172, 0, '*', 0),
(116, 'footer-menu', 'О компании', 'o-kompanii', '', 'o-kompanii', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 173, 174, 0, '*', 0),
(117, 'footer-menu', 'Контакты', '2014-06-27-08-54-01', '', '2014-06-27-08-54-01', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 175, 176, 0, '*', 0),
(118, 'footer-menu', 'Объекты', '2014-06-27-08-54-23', '', '2014-06-27-08-54-23', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 177, 178, 0, '*', 0),
(119, 'top-menu', 'Замеры', '2014-06-27-10-55-44', '', '2014-06-27-07-37-45/2014-06-27-10-55-44', '', 'url', -2, 112, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 156, 157, 0, '*', 0),
(120, 'top-menu', 'Ремонт', 'remont', '', '2014-06-27-07-37-45/remont', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 112, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"28","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 158, 159, 0, '*', 0),
(121, 'top-menu', 'Монтаж', 'montazh', '', '2014-06-27-07-37-45/montazh', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 112, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"27","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 160, 161, 0, '*', 0),
(122, 'top-menu', 'Доставка', 'dostavka', '', '2014-06-27-07-37-45/dostavka', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 112, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"26","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 162, 163, 0, '*', 0),
(123, 'top-menu', 'Замеры', 'zamery', '', '2014-06-27-07-37-45/zamery', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 112, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"25","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 164, 165, 0, '*', 0),
(124, 'top-menu', 'Поликарбонат', 'polikarbonat', '', '2014-06-27-07-36-29/polikarbonat', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"37","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 136, 137, 0, '*', 0),
(125, 'top-menu', 'Теплицы', 'teplitsy', '', '2014-06-27-07-36-29/teplitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"36","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 140, 141, 0, '*', 0),
(126, 'top-menu', 'Беседки', 'besedki', '', '2014-06-27-07-36-29/besedki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"35","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 138, 139, 0, '*', 0),
(127, 'top-menu', 'Благоустройство', 'blagoustrojstvo', '', '2014-06-27-07-36-29/blagoustrojstvo', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 142, 153, 0, '*', 0),
(128, 'top-menu', 'Туалет для дачи', 'tualet-dlya-dachi', '', '2014-06-27-07-36-29/blagoustrojstvo/tualet-dlya-dachi', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 143, 144, 0, '*', 0),
(129, 'top-menu', 'Песок для песочниц', 'pesok-dlya-pesochnits', '', '2014-06-27-07-36-29/blagoustrojstvo/pesok-dlya-pesochnits', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 145, 146, 0, '*', 0),
(130, 'top-menu', 'Террасная доска', 'terrasnaya-doska', '', '2014-06-27-07-36-29/blagoustrojstvo/terrasnaya-doska', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 147, 148, 0, '*', 0),
(131, 'top-menu', 'Тротуарная плитка', 'trotuarnaya-plitka', '', '2014-06-27-07-36-29/blagoustrojstvo/trotuarnaya-plitka', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 149, 150, 0, '*', 0),
(132, 'top-menu', 'Дренажные системы', 'drenazhnye-sistemy', '', '2014-06-27-07-36-29/blagoustrojstvo/drenazhnye-sistemy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 151, 152, 0, '*', 0),
(133, 'top-menu', 'Элементы устройства забора', 'elementy-ustrojstva-zabora', '', '2014-06-27-07-35-48/elementy-ustrojstva-zabora', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"42","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 124, 125, 0, '*', 0),
(134, 'top-menu', 'Металлический штакетник', 'metallicheskij-shtaketnik', '', '2014-06-27-07-35-48/metallicheskij-shtaketnik', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"41","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 126, 127, 0, '*', 0),
(135, 'top-menu', '3D забор', '3d-zabor', '', '2014-06-27-07-35-48/3d-zabor', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"40","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 128, 129, 0, '*', 0),
(136, 'top-menu', 'Забор из сетки-рабицы', 'zabor-iz-setki-rabitsy', '', '2014-06-27-07-35-48/zabor-iz-setki-rabitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"39","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 130, 131, 0, '*', 0),
(137, 'top-menu', 'Забор из профнастила', 'zabor-iz-profnastila', '', '2014-06-27-07-35-48/zabor-iz-profnastila', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"38","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 132, 133, 0, '*', 0),
(138, 'top-menu', 'Сэндвич-панели поэлементной сборки', 'sendvich-paneli-poelementnoj-sborki', '', '2014-06-27-07-35-03/sendvich-paneli-poelementnoj-sborki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 109, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"44","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 118, 119, 0, '*', 0),
(139, 'top-menu', 'Трехслойные сэндвич-панели', 'trekhslojnye-sendvich-paneli', '', '2014-06-27-07-35-03/trekhslojnye-sendvich-paneli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 109, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"43","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 120, 121, 0, '*', 0),
(140, 'top-menu', 'Элементы несущего каркаса', 'elementy-nesushchego-karkasa', '', '2014-06-27-07-34-23/elementy-nesushchego-karkasa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"52","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 100, 101, 0, '*', 0),
(141, 'top-menu', 'Профнастил', 'profnastil', '', '2014-06-27-07-34-23/profnastil', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"51","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 103, 0, '*', 0),
(142, 'top-menu', 'Блок-хаус', 'blok-khaus', '', '2014-06-27-07-34-23/blok-khaus', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"50","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 104, 105, 0, '*', 0),
(143, 'top-menu', 'Панели стеновые', 'paneli-stenovye', '', '2014-06-27-07-34-23/paneli-stenovye', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"47","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 106, 111, 0, '*', 0),
(144, 'top-menu', 'Панели пластиковые', 'paneli-plastikovye', '', '2014-06-27-07-34-23/paneli-stenovye/paneli-plastikovye', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 143, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"49","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 107, 108, 0, '*', 0),
(145, 'top-menu', 'Панели металлические', 'paneli-metallicheskie', '', '2014-06-27-07-34-23/paneli-stenovye/paneli-metallicheskie', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 143, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"48","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 109, 110, 0, '*', 0),
(146, 'top-menu', 'Сайдинг пластиковый', 'sajding-plastikovyj', '', '2014-06-27-07-34-23/sajding-plastikovyj', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"46","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 112, 113, 0, '*', 0),
(147, 'top-menu', 'Сайдинг Металлический', 'sajding-metallicheskij', '', '2014-06-27-07-34-23/sajding-metallicheskij', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"2","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 114, 115, 0, '*', 0),
(148, 'top-menu', 'Кровельные элементы', 'krovelnye-elementy', '', '2014-06-27-07-33-20/krovelnye-elementy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"16","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 46, 67, 0, '*', 0),
(149, 'top-menu', 'Кровельный иструмент и оборудование', 'krovelnyj-istrument-i-oborudovanie', '', '2014-06-27-07-33-20/krovelnye-elementy/krovelnyj-istrument-i-oborudovanie', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"62","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(150, 'top-menu', 'OSB', 'osb', '', '2014-06-27-07-33-20/krovelnye-elementy/osb', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"61","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 0, '*', 0),
(151, 'top-menu', 'Флюгеры', 'flyugery', '', '2014-06-27-07-33-20/krovelnye-elementy/flyugery', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"60","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 52, 0, '*', 0),
(152, 'top-menu', 'Антенные выходы', 'antennye-vykhody', '', '2014-06-27-07-33-20/krovelnye-elementy/antennye-vykhody', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"59","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 54, 0, '*', 0),
(153, 'top-menu', 'Чердачные лестницы', 'cherdachnye-lestnitsy', '', '2014-06-27-07-33-20/krovelnye-elementy/cherdachnye-lestnitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"58","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(154, 'top-menu', 'Мансардные окна', 'mansardnye-okna', '', '2014-06-27-07-33-20/krovelnye-elementy/mansardnye-okna', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"57","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(155, 'top-menu', 'Уплотнители', 'uplotniteli', '', '2014-06-27-07-33-20/krovelnye-elementy/uplotniteli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"56","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(156, 'top-menu', 'Эмаль ремонтная', 'emal-remontnaya', '', '2014-06-27-07-33-20/krovelnye-elementy/emal-remontnaya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"55","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 62, 0, '*', 0),
(157, 'top-menu', 'Теплоизоляция', 'teploizolyatsiya', '', '2014-06-27-07-33-20/krovelnye-elementy/teploizolyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"54","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, '*', 0),
(158, 'top-menu', 'Кровельная вентиляция', 'krovelnaya-ventilyatsiya', '', '2014-06-27-07-33-20/krovelnye-elementy/krovelnaya-ventilyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"53","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, '*', 0),
(159, 'top-menu', 'Подшив карниза', 'podshiv-karniza', '', '2014-06-27-07-33-20/podshiv-karniza', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"15","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 68, 69, 0, '*', 0),
(160, 'top-menu', 'Снегозадержатели и элементы безопасности', 'snegozaderzhateli-i-elementy-bezopasnosti', '', '2014-06-27-07-33-20/snegozaderzhateli-i-elementy-bezopasnosti', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"14","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 70, 71, 0, '*', 0),
(161, 'top-menu', 'Гидроизоляция', 'gidroizolyatsiya', '', '2014-06-27-07-33-20/gidroizolyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"13","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 72, 73, 0, '*', 0),
(162, 'top-menu', 'Стропила и обрешетка (пиломатериал)', 'stropila-i-obreshetka-pilomaterial', '', '2014-06-27-07-33-20/stropila-i-obreshetka-pilomaterial', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"12","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 74, 75, 0, '*', 0),
(163, 'top-menu', 'Крепеж', 'krepezh', '', '2014-06-27-07-33-20/krepezh', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"11","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 76, 77, 0, '*', 0),
(164, 'top-menu', 'Водостоки', 'vodostoki', '', '2014-06-27-07-33-20/vodostoki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"10","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 78, 79, 0, '*', 0),
(165, 'top-menu', 'Отделочные элементы кровли', 'otdelochnye-elementy-krovli', '', '2014-06-27-07-33-20/otdelochnye-elementy-krovli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"9","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 80, 81, 0, '*', 0),
(166, 'top-menu', 'Материалы для кровли', 'materialy-dlya-krovli', '', '2014-06-27-07-33-20/materialy-dlya-krovli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"8","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 82, 97, 0, '*', 0),
(167, 'top-menu', 'Керамическая черепица', 'keramicheskaya-cherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/keramicheskaya-cherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"24","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 83, 84, 0, '*', 0),
(168, 'top-menu', 'Наплавляемая кровля', 'naplavlyaemaya-krovlya', '', '2014-06-27-07-33-20/materialy-dlya-krovli/naplavlyaemaya-krovlya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"23","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 85, 86, 0, '*', 0),
(169, 'top-menu', 'Шифер волновой', 'shifer-volnovoj', '', '2014-06-27-07-33-20/materialy-dlya-krovli/shifer-volnovoj', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"22","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 88, 0, '*', 0),
(170, 'top-menu', 'Ондулин', 'ondulin', '', '2014-06-27-07-33-20/materialy-dlya-krovli/ondulin', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"21","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 89, 90, 0, '*', 0),
(171, 'top-menu', 'Гибкая черепица', 'gibkaya-cherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/gibkaya-cherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"19","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 92, 0, '*', 0),
(172, 'top-menu', 'Профнастил', 'profnastil', '', '2014-06-27-07-33-20/materialy-dlya-krovli/profnastil', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"18","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(173, 'top-menu', 'Металлочерепица', 'metallocherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/metallocherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"17","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, '*', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_menu_types`
--

CREATE TABLE IF NOT EXISTS `bzrnp_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `bzrnp_menu_types`
--

INSERT INTO `bzrnp_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'top-menu', 'Верхнее меню', ''),
(3, 'hidden-menu', 'Скрытое меню', ''),
(4, 'footer-menu', 'Меню в подвале', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_messages`
--

CREATE TABLE IF NOT EXISTS `bzrnp_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `bzrnp_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_modules`
--

CREATE TABLE IF NOT EXISTS `bzrnp_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Дамп данных таблицы `bzrnp_modules`
--

INSERT INTO `bzrnp_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(94, 'ZOO Item', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_zooitem', 1, 1, '', 0, '*'),
(93, 'ZOO Comment', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_zoocomment', 1, 1, '', 0, '*'),
(92, 'ZOO Category', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_zoocategory', 1, 1, '', 0, '*'),
(95, 'ZOO Quick Icons', '', '', 2, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_zooquickicon', 1, 1, '', 1, '*'),
(96, 'ZOO Tag', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_zootag', 1, 1, '', 0, '*'),
(107, 'JBZoo Cart', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_basket', 1, 1, '', 0, '*'),
(108, 'JBZoo Category List', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_category', 1, 1, '', 0, '*'),
(100, 'Главное меню', '', '', 1, 'main_menu__module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"top-menu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(101, 'Unite Nivo Slider Pro', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_unite_nivopro', 1, 1, '', 0, '*'),
(102, 'Главный слайдер', '', '', 1, 'slider_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unite_nivopro', 1, 0, '{"sliderid":"1","include_jquery":"true","js_load_type":"head","no_conflict_mode":"false","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(103, 'JUNewsUltra Pro', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_junewsultra', 1, 1, '', 0, '*'),
(104, 'Новости компании', '', '', 1, 'all_news_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_junewsultra', 1, 0, '{"display_article":"0","articleid":"","count":"3","count_skip":"0","show_featured":"","catid":["8"],"category_filtering_type":"1","show_child_category_articles":"1","levels":"999","excluded_articles":"","date_filtering":"0","date_field":"a.created","relative_date":"0","custom_days":"30","ordering":"created_desc","user_id":"0","cache":"1","cache_time":"900","cachemode":"static","template":"_:news","jquery":"0","bootstrap_js":"0","bootstrap_css":"0","empty_mod":"0","cssstyle":"1","moduleclass_sfx":"","show_title":"1","title_limit":"0","title_limit_mode":"1","title_limit_count":"20","end_limit_title":"...","title_prepare":"0","content_prepare":"0","show_intro":"1","clear_tag":"1","allowed_intro_tags":"","li":"1","lmttext":"1","introtext_limit":"15","end_limit_introtext":"...","show_full":"0","clear_tag_full":"1","allowed_full_tags":"","li_full":"1","lmttext_full":"1","fulltext_limit":"20","end_limit_fulltext":"...","juauthor":"0","read_more":"0","rmtext":"Read more...","show_date":"1","data_format":"d.m.Y","df_d":"d","df_m":"m","df_y":"Y","showcat":"0","showcatlink":"0","showHits":"0","showRating":"0","showRatingCount":"0","all_in":"1","all_in_position":"0","item_heading":"div","class_all_in":"all_news_link","custom_heading":"0","text_all_in":"","link_all_in":"","text_all_in2":"\\u0421\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435  \\u0432\\u0441\\u0435 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438","link_menuitem":"115","pik":"1","image_source":"0","imglink":"1","tips":"1","imageWidth":"70","imageHeight":"70","thumb_width":"1","source_rectangle":"0","sx":"0","sy":"0","sw":"","sh":"","Zoom_Crop":"1","thumb_filtercolor":"0","colorized":"25","colorpicker":"#0000ff","thumb_th_seting":"10","thumb_filters":"1","thumb_unsharp":"1","thumb_unsharp_amount":"80","thumb_unsharp_radius":"1","thumb_unsharp_threshold":"3","thumb_blur":"0","thumb_blur_seting":"1","thumb_brit":"0","thumb_brit_seting":"50","thumb_cont":"0","thumb_cont_seting":"50","defaultimg":"1","noimage":"notfoundimage.png","img_cache":"cache","cache_maxage_img":"30","cache_maxsize_img":"10","cache_maxfiles_img":"200","use_imagemagick":"1","imagemagick_path":"","img_ext":"jpg","link_enabled":"1","use_comments":"0","youtube_img_show":"1","copy":"0"}', 0, '*'),
(105, 'О компании', '', '<p>Не следует, однако забывать, что реализация намеченных плановых заданий в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа форм развития. Не следует, однако забывать, что реализация намеченных плановых заданий играет важную роль в формировании существенных финансовых и административных условий.</p>\r\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа модели развития. Товарищи! реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Идейные соображения высшего порядка, а также новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании модели развития. Не следует, однако забывать, что консультация с широким активом представляет собой интересный эксперимент проверки форм развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют определения и уточнения форм развития.</p>', 1, 'about_company_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(106, 'Меню в подвале', '', '', 1, 'footer_menu_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"footer-menu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(109, 'JBZoo Search List', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_props', 1, 1, '', 0, '*'),
(110, 'JBZoo Search', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_search', 1, 1, '', 0, '*');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_modules_menu`
--

CREATE TABLE IF NOT EXISTS `bzrnp_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_modules_menu`
--

INSERT INTO `bzrnp_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(95, 0),
(100, 0),
(102, 101),
(104, 101),
(105, 101),
(106, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `bzrnp_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_nivosliderpro_sliders`
--

CREATE TABLE IF NOT EXISTS `bzrnp_nivosliderpro_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `visual` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `bzrnp_nivosliderpro_sliders`
--

INSERT INTO `bzrnp_nivosliderpro_sliders` (`id`, `title`, `alias`, `published`, `ordering`, `params`, `visual`) VALUES
(1, 'Главный слайдер', 'glavnyj-slajder', 1, 1, '{"pauseTime":"3000","animSpeed":"500","position":"center","margin_left":"0","margin_right":"0","margin_top":"0","margin_bottom":"0","clear_both":"false","directionNavHide":"true","startSlide":"0","randomStart":"false","pauseOnHover":"true","manualAdvance":"false","keyboardNav":"true","slices":"15","boxCols":"8","boxRows":"4","beforeChange":"function(){}","afterChange":"function(){}","slideshowEnd":"function(){}","lastSlide":"function(){}","afterLoad":"function(){}"}', '{"width":"1000","height":"432","has_border":"false","border_size":"2","border_color":"#ffffff","has_shadow":"false","shadow_color":"#000000","has_arrows":"false","arrows_set":"default","arrow_left_x":"10","arrow_left_y":"103","arrow_right_x":"960","arrow_right_y":"103","arrows_free_drag":"false","has_bullets":"true","bullets_set":"simple_stripe_gray","bullets_align":"center","bullets_y":"397","bullets_xleft":"446","bullets_xright":"445","bullets_spacing":"6","reverse_bullets":"true","has_caption":"false","caption_back_color":"#000000","caption_back_alpha":"80","caption_position":"bottom","text_color":"#ffffff","text_align":"left","text_padding":"8","font_size":"14"}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_nivosliderpro_slides`
--

CREATE TABLE IF NOT EXISTS `bzrnp_nivosliderpro_slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `sliderid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `bzrnp_nivosliderpro_slides`
--

INSERT INTO `bzrnp_nivosliderpro_slides` (`id`, `catid`, `sliderid`, `title`, `alias`, `image`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`) VALUES
(1, 0, 1, 'Slide1', 'slide1', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"image":"images\\/slide1.jpg","description":"","activate_link":"no","link":"","link_open_in":"new","image_alt":""}'),
(2, 0, 1, 'Slide2', 'slide2', '', '', 1, 0, '0000-00-00 00:00:00', 2, '{"image":"images\\/slide2.jpg","description":"","activate_link":"no","link":"","link_open_in":"new","image_alt":""}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_overrider`
--

CREATE TABLE IF NOT EXISTS `bzrnp_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_redirect_links`
--

CREATE TABLE IF NOT EXISTS `bzrnp_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `bzrnp_redirect_links`
--

INSERT INTO `bzrnp_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/bulid/index.php/2014-06-27-07-33-20/krovelnye-elementy/item/tovar', '', 'http://localhost/bulid/index.php/2014-06-27-07-33-20/krovelnye-elementy', '', 3, 0, '2014-07-09 07:14:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_schemas`
--

CREATE TABLE IF NOT EXISTS `bzrnp_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_schemas`
--

INSERT INTO `bzrnp_schemas` (`extension_id`, `version_id`) VALUES
(700, '2.5.22');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_session`
--

CREATE TABLE IF NOT EXISTS `bzrnp_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_session`
--

INSERT INTO `bzrnp_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`, `usertype`) VALUES
('72606861ffb708d5ad5ce6282508105e', 1, 0, '1404900336', '__default|a:8:{s:22:"session.client.browser";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36";s:15:"session.counter";i:62;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":3:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:18:"com_zooapplication";i:1;}}s:4:"user";O:5:"JUser":26:{s:9:"\0*\0isRoot";b:1;s:2:"id";s:2:"42";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:14:"admin@build.ru";s:8:"password";s:34:"$P$DVaHMrUe53xf8rND0M9IitdZBgikoE0";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"deprecated";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2014-06-27 06:56:38";s:13:"lastvisitDate";s:19:"2014-07-09 07:27:59";s:10:"activation";s:1:"0";s:6:"params";s:2:"{}";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\0*\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;s:10:"superadmin";b:1;}s:13:"session.token";s:32:"992c995e112add2624a07ffdff23ec8f";s:19:"session.timer.start";i:1404899404;s:18:"session.timer.last";i:1404900329;s:17:"session.timer.now";i:1404900332;}', 42, 'admin', ''),
('f3537647a77ba3e32529b3d24eff7d44', 0, 1, '1404900559', '__default|a:8:{s:15:"session.counter";i:16;s:19:"session.timer.start";i:1404899589;s:18:"session.timer.last";i:1404900554;s:17:"session.timer.now";i:1404900559;s:22:"session.client.browser";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":26:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;s:10:"superadmin";N;}s:13:"session.token";s:32:"cc5141f8d3b6144310101827dc770a3e";}twitter_oauth_token|N;twitter_oauth_token_secret|N;facebook_access_token|N;__jbzoo|a:1:{s:6:"jbcart";a:1:{s:5:"items";a:0:{}}}', 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_template_styles`
--

CREATE TABLE IF NOT EXISTS `bzrnp_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `bzrnp_template_styles`
--

INSERT INTO `bzrnp_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(2, 'bluestork', 1, '1', 'Bluestork - Default', '{"useRoundedCorners":"1","showSiteName":"0"}'),
(3, 'atomic', 0, '0', 'Atomic - Default', '{}'),
(4, 'beez_20', 0, '0', 'Beez2 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(6, 'beez5', 0, '0', 'Beez5 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/sampledata\\/fruitshop\\/fruits.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","html5":"0"}'),
(7, 'krovlya', 0, '1', 'krovlya - По умолчанию', '{}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_updates`
--

CREATE TABLE IF NOT EXISTS `bzrnp_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=68 ;

--
-- Дамп данных таблицы `bzrnp_updates`
--

INSERT INTO `bzrnp_updates` (`update_id`, `update_site_id`, `extension_id`, `categoryid`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 4, 0, 0, 'Armenian', '', 'pkg_hy-AM', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/hy-AM_details.xml', ''),
(2, 4, 0, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/id-ID_details.xml', ''),
(3, 4, 0, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/da-DK_details.xml', ''),
(4, 4, 0, 0, 'Khmer', '', 'pkg_km-KH', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/km-KH_details.xml', ''),
(5, 4, 0, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '2.5.10.1', '', 'http://update.joomla.org/language/details/sv-SE_details.xml', ''),
(6, 4, 0, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '2.5.14.1', '', 'http://update.joomla.org/language/details/hu-HU_details.xml', ''),
(7, 4, 0, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/bg-BG_details.xml', ''),
(8, 4, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(9, 4, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(10, 4, 0, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/es-ES_details.xml', ''),
(11, 4, 0, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/nl-NL_details.xml', ''),
(12, 4, 0, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/tr-TR_details.xml', ''),
(13, 4, 0, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '2.5.13.11', '', 'http://update.joomla.org/language/details/uk-UA_details.xml', ''),
(14, 4, 0, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/sk-SK_details.xml', ''),
(15, 4, 0, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/be-BY_details.xml', ''),
(16, 4, 0, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/lv-LV_details.xml', ''),
(17, 4, 0, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '2.5.21.1', '', 'http://update.joomla.org/language/details/et-EE_details.xml', ''),
(18, 4, 0, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ro-RO_details.xml', ''),
(19, 4, 0, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/nl-BE_details.xml', ''),
(20, 4, 0, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/mk-MK_details.xml', ''),
(21, 4, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(22, 4, 0, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/sr-YU_details.xml', ''),
(23, 4, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.21.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(24, 4, 0, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/de-DE_details.xml', ''),
(25, 4, 0, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/nb-NO_details.xml', ''),
(26, 4, 0, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/en-AU_details.xml', ''),
(27, 4, 0, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/en-US_details.xml', ''),
(28, 4, 0, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/sr-RS_details.xml', ''),
(29, 4, 0, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/lt-LT_details.xml', ''),
(30, 4, 0, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '2.5.1.5', '', 'http://update.joomla.org/language/details/sq-AL_details.xml', ''),
(31, 4, 0, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/cs-CZ_details.xml', ''),
(32, 4, 0, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/fa-IR_details.xml', ''),
(33, 4, 0, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '2.5.7.4', '', 'http://update.joomla.org/language/details/gl-ES_details.xml', ''),
(34, 4, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(35, 4, 0, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '2.5.19.1', '', 'http://update.joomla.org/language/details/sy-IQ_details.xml', ''),
(36, 4, 0, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/pt-PT_details.xml', ''),
(38, 4, 0, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/he-IL_details.xml', ''),
(39, 4, 0, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '2.5.21.1', '', 'http://update.joomla.org/language/details/ca-ES_details.xml', ''),
(40, 4, 0, 0, 'Laotian', '', 'pkg_lo-LA', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/lo-LA_details.xml', ''),
(41, 4, 0, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '2.5.16.1', '', 'http://update.joomla.org/language/details/af-ZA_details.xml', ''),
(42, 4, 0, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/zh-CN_details.xml', ''),
(43, 4, 0, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/el-GR_details.xml', ''),
(44, 4, 0, 0, 'Esperanto', '', 'pkg_eo-XX', 'package', '', 0, '2.5.19.1', '', 'http://update.joomla.org/language/details/eo-XX_details.xml', ''),
(45, 4, 0, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '2.5.20.1', '', 'http://update.joomla.org/language/details/fi-FI_details.xml', ''),
(46, 4, 0, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/pt-BR_details.xml', ''),
(47, 4, 0, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '2.5.19.1', '', 'http://update.joomla.org/language/details/zh-TW_details.xml', ''),
(48, 4, 0, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/vi-VN_details.xml', ''),
(49, 4, 0, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '2.5.9.1', '', 'http://update.joomla.org/language/details/ckb-IQ_details.xml', ''),
(50, 4, 0, 0, 'Bengali', '', 'pkg_bn-BD', 'package', '', 0, '2.5.0.1', '', 'http://update.joomla.org/language/details/bn-BD_details.xml', ''),
(51, 4, 0, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/bs-BA_details.xml', ''),
(52, 4, 0, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '2.5.13.1', '', 'http://update.joomla.org/language/details/hr-HR_details.xml', ''),
(53, 4, 0, 0, 'Azeri', '', 'pkg_az-AZ', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/az-AZ_details.xml', ''),
(54, 4, 0, 0, 'Norwegian Nynorsk', '', 'pkg_nn-NO', 'package', '', 0, '2.5.8.1', '', 'http://update.joomla.org/language/details/nn-NO_details.xml', ''),
(55, 4, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(56, 4, 0, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '2.5.7.1', '', 'http://update.joomla.org/language/details/gd-GB_details.xml', ''),
(57, 4, 0, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '2.5.21.1', '', 'http://update.joomla.org/language/details/th-TH_details.xml', ''),
(58, 4, 0, 0, 'Basque', '', 'pkg_eu-ES', 'package', '', 0, '1.7.0.1', '', 'http://update.joomla.org/language/details/eu-ES_details.xml', ''),
(59, 4, 0, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '2.5.7.2', '', 'http://update.joomla.org/language/details/ug-CN_details.xml', ''),
(60, 4, 0, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '2.5.11.1', '', 'http://update.joomla.org/language/details/ko-KR_details.xml', ''),
(61, 4, 0, 0, 'Hindi', '', 'pkg_hi-IN', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/hi-IN_details.xml', ''),
(62, 4, 0, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '2.5.6.1', '', 'http://update.joomla.org/language/details/cy-GB_details.xml', ''),
(63, 4, 0, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '2.5.21.1', '', 'http://update.joomla.org/language/details/sw-KE_details.xml', ''),
(64, 4, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(65, 4, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(66, 4, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(67, 4, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', '');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_update_categories`
--

CREATE TABLE IF NOT EXISTS `bzrnp_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Update Categories' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_update_sites`
--

CREATE TABLE IF NOT EXISTS `bzrnp_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `bzrnp_update_sites`
--

INSERT INTO `bzrnp_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1404897778),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1404897778),
(5, 'JUNewsUltra', 'extension', 'http://www.joomla-ua.org/update/mod/junewsultra.xml', 0, 1403863764),
(3, 'Joomla! Russia Updates', 'collection', 'http://joomlaportal.ru/translations.xml', 0, 0),
(4, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 1, 1404897778);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_update_sites_extensions`
--

CREATE TABLE IF NOT EXISTS `bzrnp_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Дамп данных таблицы `bzrnp_update_sites_extensions`
--

INSERT INTO `bzrnp_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 10002),
(4, 600),
(5, 10032),
(5, 10037);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_usergroups`
--

CREATE TABLE IF NOT EXISTS `bzrnp_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `bzrnp_usergroups`
--

INSERT INTO `bzrnp_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 20, 'Public'),
(2, 1, 6, 17, 'Registered'),
(3, 2, 7, 14, 'Author'),
(4, 3, 8, 11, 'Editor'),
(5, 4, 9, 10, 'Publisher'),
(6, 1, 2, 5, 'Manager'),
(7, 6, 3, 4, 'Administrator'),
(8, 1, 18, 19, 'Super Users');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_users`
--

CREATE TABLE IF NOT EXISTS `bzrnp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Дамп данных таблицы `bzrnp_users`
--

INSERT INTO `bzrnp_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(42, 'Super User', 'admin', 'admin@build.ru', '$P$DVaHMrUe53xf8rND0M9IitdZBgikoE0', 'deprecated', 0, 1, '2014-06-27 06:56:38', '2014-07-09 09:50:05', '0', '{}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_user_notes`
--

CREATE TABLE IF NOT EXISTS `bzrnp_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_user_profiles`
--

CREATE TABLE IF NOT EXISTS `bzrnp_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_user_usergroup_map`
--

CREATE TABLE IF NOT EXISTS `bzrnp_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_user_usergroup_map`
--

INSERT INTO `bzrnp_user_usergroup_map` (`user_id`, `group_id`) VALUES
(42, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_viewlevels`
--

CREATE TABLE IF NOT EXISTS `bzrnp_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `bzrnp_viewlevels`
--

INSERT INTO `bzrnp_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_weblinks`
--

CREATE TABLE IF NOT EXISTS `bzrnp_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_application`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `application_group` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `bzrnp_zoo_application`
--

INSERT INTO `bzrnp_zoo_application` (`id`, `name`, `alias`, `application_group`, `description`, `params`) VALUES
(1, 'Строительная компания', 'stroitelnaya-kompaniya-centr', 'jbuniversal', '', ' {\n	"group": "jbuniversal",\n	"template": "catalog",\n	"global.config.yoo_support": "0",\n	"global.config.rborder": "0",\n	"global.config.column_heightfix": "0",\n	"global.config.wrap_item_style": "div",\n	"global.config.category_image_height": "150",\n	"global.config.category_image_width": "150",\n	"global.config.show_feed_link": "0",\n	"global.config.feed_title": "",\n	"global.config.alternate_feed_link": "",\n	"global.config.category_teaser_image_height": "50",\n	"global.config.category_teaser_image_width": "50",\n	"global.config.items_per_page": "20",\n	"global.config.item_order":  {\n		"0": "_jbzoo_0_field__none",\n		"1": "_jbzoo_0_mode_s",\n		"2": "_jbzoo_0_order_asc"\n	},\n	"global.config.alpha_index": "0",\n	"global.config.alpha_chars": "0",\n	"global.config.layout_frontpage": "__auto__",\n	"global.config.layout_category": "__auto__",\n	"global.config.layout_subcategory": "__auto__",\n	"global.config.layout_subcategory_columns": "__auto__",\n	"global.config.layout_subcategories": "__auto__",\n	"global.config.layout_items": "__auto__",\n	"global.config.layout_item_columns": "__auto__",\n	"global.config.layout_alphaindex": "__auto__",\n	"global.config.layout_pagination": "__auto__",\n	"global.config.layout_tag": "__auto__",\n	"global.config.layout_comments": "__auto__",\n	"global.config.layout_comment": "__auto__",\n	"global.config.layout_respond": "__auto__",\n	"global.config.layout_mysubmissions": "__auto__",\n	"global.config.layout_administration": "__auto__",\n	"global.config.layout_submission": "__auto__",\n	"global.config.lastmodified": "1404900190",\n	"global.template.show_alpha_index": "0",\n	"global.template.category_title_show": "1",\n	"global.template.category_show": "1",\n	"global.template.category_subtitle": "1",\n	"global.template.category_teaser_text": "1",\n	"global.template.category_image": "1",\n	"global.template.category_image_align": "left",\n	"global.template.category_text": "1",\n	"global.template.subcategory_show": "1",\n	"global.template.subcategory_teaser_text": "1",\n	"global.template.subcategory_teaser_image": "1",\n	"global.template.subcategory_teaser_image_align": "center",\n	"global.template.subcategory_empty": "1",\n	"global.template.subcategory_cols": "3",\n	"global.template.subcategory_order": "0",\n	"global.template.subcategory_items_count_show": "0",\n	"global.template.subcategory_items_count": "100",\n	"global.template.item_cols": "3",\n	"global.template.item_order": "0",\n	"global.template.item_pagination": "0",\n	"global.template.lastmodified": "1404900190",\n	"global.template.item_full_image_align": "left",\n	"global.template.item_teaser_image_align": "left",\n	"global.template.item_related_image_align": "left",\n	"global.template.item_subcategory_item_image_align": "left",\n	"global.jbzoo_cart_config.enable": "0",\n	"global.jbzoo_cart_config.is_advance": "0",\n	"global.jbzoo_cart_config.auth": "0",\n	"global.jbzoo_cart_config.submission-id": "",\n	"global.jbzoo_cart_config.type-layout": "",\n	"global.jbzoo_cart_config.currency": "RUB",\n	"global.jbzoo_cart_config.element-image":  {\n		"0": "791f1142-2344-40f3-a136-bf3c0d00a2ae"\n	},\n	"global.jbzoo_cart_config.minimal-summa": "",\n	"global.jbzoo_cart_config.notificaction-create": "1",\n	"global.jbzoo_cart_config.notificaction-payment": "1",\n	"global.jbzoo_cart_config.admin-email": "",\n	"global.jbzoo_cart_config.element-useremail": "",\n	"global.jbzoo_cart_config.email-admin-layout": "",\n	"global.jbzoo_cart_config.email-admin-layout-payment": "",\n	"global.jbzoo_cart_config.email-user-layout": "",\n	"global.jbzoo_cart_config.email-user-layout-payment": "",\n	"global.jbzoo_cart_config.nopaid-order": "0",\n	"global.jbzoo_cart_config.payment-enabled": "0",\n	"global.jbzoo_cart_config.robox-enabled": "0",\n	"global.jbzoo_cart_config.robox-debug": "0",\n	"global.jbzoo_cart_config.robox-login": "",\n	"global.jbzoo_cart_config.robox-password1": "",\n	"global.jbzoo_cart_config.robox-password2": "",\n	"global.jbzoo_cart_config.ikassa-enabled": "0",\n	"global.jbzoo_cart_config.ikassa-shopid": "",\n	"global.jbzoo_cart_config.ikassa-key": "",\n	"global.jbzoo_cart_config.manual-enabled": "0",\n	"global.jbzoo_cart_config.manual-title": "",\n	"global.jbzoo_cart_config.manual-text": "",\n	"global.jbzoo_cart_config.manual-message": "",\n	"global.comments.enable_comments": "1",\n	"global.comments.require_name_and_mail": "1",\n	"global.comments.registered_users_only": "0",\n	"global.comments.approved": "0",\n	"global.comments.time_between_user_posts": "120",\n	"global.comments.email_notification": "",\n	"global.comments.email_reply_notification": "0",\n	"global.comments.avatar": "1",\n	"global.comments.order": "ASC",\n	"global.comments.max_depth": "5",\n	"global.comments.facebook_enable": "0",\n	"global.comments.facebook_app_id": "",\n	"global.comments.facebook_app_secret": "",\n	"global.comments.twitter_enable": "0",\n	"global.comments.twitter_consumer_key": "",\n	"global.comments.twitter_consumer_secret": "",\n	"global.comments.akismet_enable": "0",\n	"global.comments.akismet_api_key": "",\n	"global.comments.mollom_enable": "0",\n	"global.comments.mollom_public_key": "",\n	"global.comments.mollom_private_key": "",\n	"global.comments.captcha": "",\n	"global.comments.captcha_guest_only": "1",\n	"global.comments.blacklist": ""\n}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_category`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parent` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`),
  KEY `PUBLISHED_INDEX` (`published`),
  KEY `APPLICATIONID_ID_INDEX` (`application_id`,`published`,`id`),
  KEY `APPLICATIONID_ID_INDEX2` (`application_id`,`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Дамп данных таблицы `bzrnp_zoo_category`
--

INSERT INTO `bzrnp_zoo_category` (`id`, `application_id`, `name`, `alias`, `description`, `parent`, `ordering`, `published`, `params`) VALUES
(1, 1, 'Кровля', 'krovlya', '', 0, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864112",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(2, 1, 'Фасад', 'fasad', '', 0, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864178",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(3, 1, 'Стена', 'stena', '', 0, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864230",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(4, 1, 'Забор', 'zabor', '', 0, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864242",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(5, 1, 'Мой любимый дом', 'moj-lyubimyj-dom', '', 0, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864255",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(6, 1, 'Услуги', 'uslugi', '', 0, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864272",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(7, 1, 'Контакты', 'kontakty', '', 0, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864287",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(8, 1, 'Материалы для кровли', 'materialy-dlya-krovli', '', 1, 9, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864308",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(9, 1, 'Отделочные элементы кровли', 'otdelochnye-elementy-krovli', '', 1, 8, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864330",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(10, 1, 'Водостоки', 'vodostoki', '', 1, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864357",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(11, 1, 'Крепеж', 'krepezh', '', 1, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864374",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(12, 1, 'Стропила и обрешетка (пиломатериал)', 'stropila-i-obreshetka-pilomaterial', '', 1, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864392",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(13, 1, 'Гидроизоляция', 'gidroizolyaciya', '', 1, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864438",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(14, 1, 'Снегозадержатели и элементы безопасности', 'snegozaderzhateli-i-elementy-bezopasnosti', '', 1, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864455",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(15, 1, 'Подшив карниза', 'podshiv-karniza', '', 1, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/slide1.jpg",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1404196663",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(16, 1, 'Кровельные элементы', 'krovelnye-elementy', '', 1, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/karniz.png",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"config.alpha_index": "0",\n	"config.alpha_chars": "0",\n	"config.layout_frontpage": "__auto__",\n	"config.lastmodified": "1404893395",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_image_align": "left",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "0",\n	"template.lastmodified": "1404893395",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(17, 1, 'Металлочерепица', 'metallocherepica', '', 8, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864531",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(18, 1, 'Профнастил', 'profnastil', '', 8, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864627",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(19, 1, 'Гибкая черепица', 'gibkaya-cherepica', '', 8, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864643",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(24, 1, 'Керамическая черепица', 'keramicheskaya-cherepica', '', 8, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403865027",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(21, 1, 'Ондулин', 'ondulin', '', 8, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864697",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(22, 1, 'Шифер волновой', 'shifer-volnovoj', '', 8, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864723",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(23, 1, 'Наплавляемая кровля', 'naplavlyaemaya-krovlya', '', 8, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864741",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(25, 1, 'Замеры', 'zamery', '', 6, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866682",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(26, 1, 'Доставка', 'dostavka', '', 6, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866704",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(27, 1, 'Монтаж', 'montazh', '', 6, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866734",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(28, 1, 'Ремонт', 'remont', '', 6, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866748",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(29, 1, 'Благоустройство', 'blagoustrojstvo', '', 5, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866763",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(30, 1, 'Дренажные системы', 'drenazhnye-sistemy', '', 29, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866906",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(31, 1, 'Тротуарная плитка', 'trotuarnaya-plitka', '', 29, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867052",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(32, 1, 'Террасная доска', 'terrasnaya-doska', '', 29, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867075",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(33, 1, 'Песок для песочниц', 'pesok-dlya-pesochnic', '', 29, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867096",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(34, 1, 'Туалет для дачи', 'tualet-dlya-dachi', '', 29, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867117",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(35, 1, 'Беседки', 'besedki', '', 5, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867136",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(36, 1, 'Теплицы', 'teplicy', '', 5, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867161",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(37, 1, 'Поликарбонат', 'polikarbonat', '', 5, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867176",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(38, 1, 'Забор из профнастила', 'zabor-iz-profnastila', '', 4, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867196",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(39, 1, 'Забор из сетки-рабицы', 'zabor-iz-setki-rabicy', '', 4, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867246",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(40, 1, '3D забор', '3d-zabor', '', 4, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867270",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(41, 1, 'Металлический штакетник', 'metallicheskij-shtaketnik', '', 4, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867296",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(42, 1, 'Элементы устройства забора', 'elementy-ustrojstva-zabora', '', 4, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867318",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(43, 1, 'Трехслойные сэндвич-панели', 'trehslojnye-sendvich-paneli', '', 3, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867342",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(44, 1, 'Сэндвич-панели поэлементной сборки', 'sendvich-paneli-poelementnoj-sborki', '', 3, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867382",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(45, 1, 'Сайдинг Металлический', 'sajding-metallicheskij', '', 2, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867415",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(46, 1, 'Сайдинг пластиковый', 'sajding-plastokoviy', '', 2, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867450",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(47, 1, 'Панели стеновые', 'paneli-stenovye', '', 2, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867493",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(48, 1, 'Панели металлические', 'paneli-metallicheskie', '', 47, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867519",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(49, 1, 'Панели пластиковые', 'paneli-plastikovye', '', 47, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867546",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(50, 1, 'Блок-хаус', 'blok-haus', '', 2, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867570",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}');
INSERT INTO `bzrnp_zoo_category` (`id`, `application_id`, `name`, `alias`, `description`, `parent`, `ordering`, `published`, `params`) VALUES
(51, 1, 'Профнастил', 'profnastil-2', '', 2, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867598",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(52, 1, 'Элементы несущего каркаса', 'elementy-nesushhego-karkasa', '', 2, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867711",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(53, 1, 'Кровельная вентиляция', 'krovelnaya-ventilyaciya', '', 16, 10, 0, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867863",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(54, 1, 'Теплоизоляция', 'teploizolyaciya', '', 16, 9, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867892",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(55, 1, 'Эмаль ремонтная', 'emal-remontnaya', '', 16, 8, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867937",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(56, 1, 'Уплотнители', 'uplotniteli', '', 16, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867969",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(57, 1, 'Мансардные окна', 'mansardnye-okna', '', 16, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867994",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(58, 1, 'Чердачные лестницы', 'cherdachnye-lestnicy', '', 16, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403868018",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(59, 1, 'Антенные выходы', 'antennye-vyhody', '', 16, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403868054",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(60, 1, 'Флюгеры', 'flyugery', '', 16, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403868108",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(61, 1, 'OSB', 'osb', '', 16, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403868123",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(62, 1, 'Кровельный иструмент и оборудование', 'krovelnyj-istrument-i-oborudovanie', '', 16, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403868140",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_category_item`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_category_item` (
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`item_id`),
  KEY `ITEMID_INDEX` (`item_id`),
  KEY `CATEGORYID_INDEX` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_category_item`
--

INSERT INTO `bzrnp_zoo_category_item` (`category_id`, `item_id`) VALUES
(62, 10),
(62, 11),
(62, 12),
(62, 13);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_comment`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `content` text NOT NULL,
  `state` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `STATE_INDEX` (`state`),
  KEY `CREATED_INDEX` (`created`),
  KEY `ITEMID_INDEX` (`item_id`),
  KEY `AUTHOR_INDEX` (`author`),
  KEY `ITEMID_STATE_INDEX` (`item_id`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_item`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `priority` int(11) NOT NULL,
  `hits` int(11) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `access` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `searchable` int(11) NOT NULL,
  `elements` longtext NOT NULL,
  `params` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`),
  KEY `PUBLISH_INDEX` (`publish_up`,`publish_down`),
  KEY `STATE_INDEX` (`state`),
  KEY `ACCESS_INDEX` (`access`),
  KEY `CREATED_BY_INDEX` (`created_by`),
  KEY `NAME_INDEX` (`name`),
  KEY `APPLICATIONID_INDEX` (`application_id`),
  KEY `TYPE_INDEX` (`type`),
  KEY `MULTI_INDEX` (`application_id`,`access`,`state`,`publish_up`,`publish_down`),
  KEY `MULTI_INDEX2` (`id`,`access`,`state`,`publish_up`,`publish_down`),
  KEY `ID_APPLICATION_INDEX` (`id`,`application_id`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `bzrnp_zoo_item`
--

INSERT INTO `bzrnp_zoo_item` (`id`, `application_id`, `type`, `name`, `alias`, `created`, `modified`, `modified_by`, `publish_up`, `publish_down`, `priority`, `hits`, `state`, `access`, `created_by`, `created_by_alias`, `searchable`, `elements`, `params`) VALUES
(10, 1, 'product', 'Товар', 'tovar', '2014-07-09 07:28:16', '2014-07-09 09:57:08', 42, '2014-07-09 07:28:16', '0000-00-00 00:00:00', 0, 18, 1, 1, 42, '', 0, ' {\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "10",\n			"value": "500",\n			"currency": "EUR",\n			"discount": "0",\n			"discount_currency": "EUR",\n			"description": ""\n		}\n	},\n	"97b915bd-c9fd-4ec4-bad1-cc0154c0340f":  {\n		"file": "images\\/gidro.png",\n		"title": "",\n		"link": "",\n		"target": "0",\n		"rel": "",\n		"width": 320,\n		"height": 190\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(11, 1, 'product', 'Товар 2', 'tovar-2', '2014-07-09 09:57:25', '2014-07-09 09:59:02', 42, '2014-07-09 09:57:25', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "11",\n			"value": "1000",\n			"currency": "EUR",\n			"discount": "0",\n			"discount_currency": "EUR",\n			"description": ""\n		}\n	},\n	"97b915bd-c9fd-4ec4-bad1-cc0154c0340f":  {\n		"file": "images\\/powered_by.png",\n		"title": "",\n		"link": "",\n		"target": "0",\n		"rel": "",\n		"width": 150,\n		"height": 35\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(12, 1, 'product', 'Товар 3', 'tovar-3', '2014-07-09 10:02:04', '2014-07-09 10:02:30', 42, '2014-07-09 10:02:04', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "",\n			"value": "43252345",\n			"currency": "EUR",\n			"discount": "0",\n			"discount_currency": "EUR",\n			"description": ""\n		}\n	},\n	"97b915bd-c9fd-4ec4-bad1-cc0154c0340f":  {\n		"file": "images\\/shurup.png",\n		"title": "",\n		"link": "",\n		"target": "0",\n		"rel": "",\n		"width": 320,\n		"height": 190\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(13, 1, 'product', 'Товар 4', 'tovar-4', '2014-07-09 10:05:00', '2014-07-09 10:05:29', 42, '2014-07-09 10:05:00', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "",\n			"value": "457",\n			"currency": "EUR",\n			"discount": "0",\n			"discount_currency": "EUR",\n			"description": ""\n		}\n	},\n	"97b915bd-c9fd-4ec4-bad1-cc0154c0340f":  {\n		"file": "images\\/snow.png",\n		"title": "",\n		"link": "",\n		"target": "0",\n		"rel": "",\n		"width": 320,\n		"height": 190\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_favorite`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_item_id` (`user_id`,`item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_agent`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_791f1142234440f3a136bf3c0d00a2ae_s` varchar(50) DEFAULT NULL,
  `e_791f1142234440f3a136bf3c0d00a2ae_n` double DEFAULT NULL,
  `e_791f1142234440f3a136bf3c0d00a2ae_d` datetime DEFAULT NULL,
  `e_08d5c809ff7f44a29d8be421b78a97f5_s` varchar(50) DEFAULT NULL,
  `e_08d5c809ff7f44a29d8be421b78a97f5_n` double DEFAULT NULL,
  `e_08d5c809ff7f44a29d8be421b78a97f5_d` datetime DEFAULT NULL,
  `e_cf47c2b59f37491fa82dcb1c8032d682_s` varchar(50) DEFAULT NULL,
  `e_cf47c2b59f37491fa82dcb1c8032d682_n` double DEFAULT NULL,
  `e_cf47c2b59f37491fa82dcb1c8032d682_d` datetime DEFAULT NULL,
  `e_39e6911ceff449779629bfa39a1500e8_s` varchar(50) DEFAULT NULL,
  `e_39e6911ceff449779629bfa39a1500e8_n` double DEFAULT NULL,
  `e_39e6911ceff449779629bfa39a1500e8_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_791f1142234440f3a136bf3c0d00a2ae_s` (`e_791f1142234440f3a136bf3c0d00a2ae_s`),
  KEY `e_791f1142234440f3a136bf3c0d00a2ae_n` (`e_791f1142234440f3a136bf3c0d00a2ae_n`),
  KEY `e_791f1142234440f3a136bf3c0d00a2ae_d` (`e_791f1142234440f3a136bf3c0d00a2ae_d`),
  KEY `e_08d5c809ff7f44a29d8be421b78a97f5_s` (`e_08d5c809ff7f44a29d8be421b78a97f5_s`),
  KEY `e_08d5c809ff7f44a29d8be421b78a97f5_n` (`e_08d5c809ff7f44a29d8be421b78a97f5_n`),
  KEY `e_08d5c809ff7f44a29d8be421b78a97f5_d` (`e_08d5c809ff7f44a29d8be421b78a97f5_d`),
  KEY `e_cf47c2b59f37491fa82dcb1c8032d682_s` (`e_cf47c2b59f37491fa82dcb1c8032d682_s`),
  KEY `e_cf47c2b59f37491fa82dcb1c8032d682_n` (`e_cf47c2b59f37491fa82dcb1c8032d682_n`),
  KEY `e_cf47c2b59f37491fa82dcb1c8032d682_d` (`e_cf47c2b59f37491fa82dcb1c8032d682_d`),
  KEY `e_39e6911ceff449779629bfa39a1500e8_s` (`e_39e6911ceff449779629bfa39a1500e8_s`),
  KEY `e_39e6911ceff449779629bfa39a1500e8_n` (`e_39e6911ceff449779629bfa39a1500e8_n`),
  KEY `e_39e6911ceff449779629bfa39a1500e8_d` (`e_39e6911ceff449779629bfa39a1500e8_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_author`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_ffefb4ed8d5d452a8794ea82c013384e_s` varchar(50) DEFAULT NULL,
  `e_ffefb4ed8d5d452a8794ea82c013384e_n` double DEFAULT NULL,
  `e_ffefb4ed8d5d452a8794ea82c013384e_d` datetime DEFAULT NULL,
  `e_ac84af6fec564228b421ba3981399abe_s` varchar(50) DEFAULT NULL,
  `e_ac84af6fec564228b421ba3981399abe_n` double DEFAULT NULL,
  `e_ac84af6fec564228b421ba3981399abe_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_ffefb4ed8d5d452a8794ea82c013384e_s` (`e_ffefb4ed8d5d452a8794ea82c013384e_s`),
  KEY `e_ffefb4ed8d5d452a8794ea82c013384e_n` (`e_ffefb4ed8d5d452a8794ea82c013384e_n`),
  KEY `e_ffefb4ed8d5d452a8794ea82c013384e_d` (`e_ffefb4ed8d5d452a8794ea82c013384e_d`),
  KEY `e_ac84af6fec564228b421ba3981399abe_s` (`e_ac84af6fec564228b421ba3981399abe_s`),
  KEY `e_ac84af6fec564228b421ba3981399abe_n` (`e_ac84af6fec564228b421ba3981399abe_n`),
  KEY `e_ac84af6fec564228b421ba3981399abe_d` (`e_ac84af6fec564228b421ba3981399abe_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_blog`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_08795744c2dc4a6882524e21c4c4c774_s` varchar(50) DEFAULT NULL,
  `e_08795744c2dc4a6882524e21c4c4c774_n` double DEFAULT NULL,
  `e_08795744c2dc4a6882524e21c4c4c774_d` datetime DEFAULT NULL,
  `e_c26feca6b2d447eba74db067aaae5b90_s` varchar(50) DEFAULT NULL,
  `e_c26feca6b2d447eba74db067aaae5b90_n` double DEFAULT NULL,
  `e_c26feca6b2d447eba74db067aaae5b90_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_08795744c2dc4a6882524e21c4c4c774_s` (`e_08795744c2dc4a6882524e21c4c4c774_s`),
  KEY `e_08795744c2dc4a6882524e21c4c4c774_n` (`e_08795744c2dc4a6882524e21c4c4c774_n`),
  KEY `e_08795744c2dc4a6882524e21c4c4c774_d` (`e_08795744c2dc4a6882524e21c4c4c774_d`),
  KEY `e_c26feca6b2d447eba74db067aaae5b90_s` (`e_c26feca6b2d447eba74db067aaae5b90_s`),
  KEY `e_c26feca6b2d447eba74db067aaae5b90_n` (`e_c26feca6b2d447eba74db067aaae5b90_n`),
  KEY `e_c26feca6b2d447eba74db067aaae5b90_d` (`e_c26feca6b2d447eba74db067aaae5b90_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_card`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_7cef24d273ec4f66ad0bdd1505b74cc3_s` varchar(50) DEFAULT NULL,
  `e_7cef24d273ec4f66ad0bdd1505b74cc3_n` double DEFAULT NULL,
  `e_7cef24d273ec4f66ad0bdd1505b74cc3_d` datetime DEFAULT NULL,
  `e_deca412b7465486281975eede1d986a4_s` varchar(50) DEFAULT NULL,
  `e_deca412b7465486281975eede1d986a4_n` double DEFAULT NULL,
  `e_deca412b7465486281975eede1d986a4_d` datetime DEFAULT NULL,
  `e_7179929fa79b4cd09cb07665bce86fb7_s` varchar(50) DEFAULT NULL,
  `e_7179929fa79b4cd09cb07665bce86fb7_n` double DEFAULT NULL,
  `e_7179929fa79b4cd09cb07665bce86fb7_d` datetime DEFAULT NULL,
  `e_11d0762bda3047cc8cd42fd2b9304ae1_s` varchar(50) DEFAULT NULL,
  `e_11d0762bda3047cc8cd42fd2b9304ae1_n` double DEFAULT NULL,
  `e_11d0762bda3047cc8cd42fd2b9304ae1_d` datetime DEFAULT NULL,
  `e_f293d80f79d74dc58b3b5c475755da04_s` varchar(50) DEFAULT NULL,
  `e_f293d80f79d74dc58b3b5c475755da04_n` double DEFAULT NULL,
  `e_f293d80f79d74dc58b3b5c475755da04_d` datetime DEFAULT NULL,
  `e_63e105ae81ec4e4fa411a84e14d2d8b9_s` varchar(50) DEFAULT NULL,
  `e_63e105ae81ec4e4fa411a84e14d2d8b9_n` double DEFAULT NULL,
  `e_63e105ae81ec4e4fa411a84e14d2d8b9_d` datetime DEFAULT NULL,
  `e_dd9c3885576f4f26b3a94da29af97880_s` varchar(50) DEFAULT NULL,
  `e_dd9c3885576f4f26b3a94da29af97880_n` double DEFAULT NULL,
  `e_dd9c3885576f4f26b3a94da29af97880_d` datetime DEFAULT NULL,
  `e_446cfc7ae1d34d149982f9a3ba29df0f_s` varchar(50) DEFAULT NULL,
  `e_446cfc7ae1d34d149982f9a3ba29df0f_n` double DEFAULT NULL,
  `e_446cfc7ae1d34d149982f9a3ba29df0f_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_7cef24d273ec4f66ad0bdd1505b74cc3_s` (`e_7cef24d273ec4f66ad0bdd1505b74cc3_s`),
  KEY `e_7cef24d273ec4f66ad0bdd1505b74cc3_n` (`e_7cef24d273ec4f66ad0bdd1505b74cc3_n`),
  KEY `e_7cef24d273ec4f66ad0bdd1505b74cc3_d` (`e_7cef24d273ec4f66ad0bdd1505b74cc3_d`),
  KEY `e_deca412b7465486281975eede1d986a4_s` (`e_deca412b7465486281975eede1d986a4_s`),
  KEY `e_deca412b7465486281975eede1d986a4_n` (`e_deca412b7465486281975eede1d986a4_n`),
  KEY `e_deca412b7465486281975eede1d986a4_d` (`e_deca412b7465486281975eede1d986a4_d`),
  KEY `e_7179929fa79b4cd09cb07665bce86fb7_s` (`e_7179929fa79b4cd09cb07665bce86fb7_s`),
  KEY `e_7179929fa79b4cd09cb07665bce86fb7_n` (`e_7179929fa79b4cd09cb07665bce86fb7_n`),
  KEY `e_7179929fa79b4cd09cb07665bce86fb7_d` (`e_7179929fa79b4cd09cb07665bce86fb7_d`),
  KEY `e_11d0762bda3047cc8cd42fd2b9304ae1_s` (`e_11d0762bda3047cc8cd42fd2b9304ae1_s`),
  KEY `e_11d0762bda3047cc8cd42fd2b9304ae1_n` (`e_11d0762bda3047cc8cd42fd2b9304ae1_n`),
  KEY `e_11d0762bda3047cc8cd42fd2b9304ae1_d` (`e_11d0762bda3047cc8cd42fd2b9304ae1_d`),
  KEY `e_f293d80f79d74dc58b3b5c475755da04_s` (`e_f293d80f79d74dc58b3b5c475755da04_s`),
  KEY `e_f293d80f79d74dc58b3b5c475755da04_n` (`e_f293d80f79d74dc58b3b5c475755da04_n`),
  KEY `e_f293d80f79d74dc58b3b5c475755da04_d` (`e_f293d80f79d74dc58b3b5c475755da04_d`),
  KEY `e_63e105ae81ec4e4fa411a84e14d2d8b9_s` (`e_63e105ae81ec4e4fa411a84e14d2d8b9_s`),
  KEY `e_63e105ae81ec4e4fa411a84e14d2d8b9_n` (`e_63e105ae81ec4e4fa411a84e14d2d8b9_n`),
  KEY `e_63e105ae81ec4e4fa411a84e14d2d8b9_d` (`e_63e105ae81ec4e4fa411a84e14d2d8b9_d`),
  KEY `e_dd9c3885576f4f26b3a94da29af97880_s` (`e_dd9c3885576f4f26b3a94da29af97880_s`),
  KEY `e_dd9c3885576f4f26b3a94da29af97880_n` (`e_dd9c3885576f4f26b3a94da29af97880_n`),
  KEY `e_dd9c3885576f4f26b3a94da29af97880_d` (`e_dd9c3885576f4f26b3a94da29af97880_d`),
  KEY `e_446cfc7ae1d34d149982f9a3ba29df0f_s` (`e_446cfc7ae1d34d149982f9a3ba29df0f_s`),
  KEY `e_446cfc7ae1d34d149982f9a3ba29df0f_n` (`e_446cfc7ae1d34d149982f9a3ba29df0f_n`),
  KEY `e_446cfc7ae1d34d149982f9a3ba29df0f_d` (`e_446cfc7ae1d34d149982f9a3ba29df0f_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_dbrecord`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_dbrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_2fd36f726b584951ba52b2ca55341f06_s` varchar(50) DEFAULT NULL,
  `e_2fd36f726b584951ba52b2ca55341f06_n` double DEFAULT NULL,
  `e_2fd36f726b584951ba52b2ca55341f06_d` datetime DEFAULT NULL,
  `e_0abdd586846b4b1b8875091145c1ef39_s` varchar(50) DEFAULT NULL,
  `e_0abdd586846b4b1b8875091145c1ef39_n` double DEFAULT NULL,
  `e_0abdd586846b4b1b8875091145c1ef39_d` datetime DEFAULT NULL,
  `e_7fb021ba6ebd4517bef8488d0b54b662_s` varchar(50) DEFAULT NULL,
  `e_7fb021ba6ebd4517bef8488d0b54b662_n` double DEFAULT NULL,
  `e_7fb021ba6ebd4517bef8488d0b54b662_d` datetime DEFAULT NULL,
  `e_6cc8b1b5c63f49b19a6404e73ef85bfc_s` varchar(50) DEFAULT NULL,
  `e_6cc8b1b5c63f49b19a6404e73ef85bfc_n` double DEFAULT NULL,
  `e_6cc8b1b5c63f49b19a6404e73ef85bfc_d` datetime DEFAULT NULL,
  `e_df9e1a1f47d648279ed0e102215bdbf0_s` varchar(50) DEFAULT NULL,
  `e_df9e1a1f47d648279ed0e102215bdbf0_n` double DEFAULT NULL,
  `e_df9e1a1f47d648279ed0e102215bdbf0_d` datetime DEFAULT NULL,
  `e_ba7f5f1e56164aab8495ef3a269d0dc6_s` varchar(50) DEFAULT NULL,
  `e_ba7f5f1e56164aab8495ef3a269d0dc6_n` double DEFAULT NULL,
  `e_ba7f5f1e56164aab8495ef3a269d0dc6_d` datetime DEFAULT NULL,
  `e_882d1aa19b8e404d832018dd7cdae20c_s` varchar(50) DEFAULT NULL,
  `e_882d1aa19b8e404d832018dd7cdae20c_n` double DEFAULT NULL,
  `e_882d1aa19b8e404d832018dd7cdae20c_d` datetime DEFAULT NULL,
  `e_a5dcf31d27d544f1b7148a34ddeb5258_s` varchar(50) DEFAULT NULL,
  `e_a5dcf31d27d544f1b7148a34ddeb5258_n` double DEFAULT NULL,
  `e_a5dcf31d27d544f1b7148a34ddeb5258_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_2fd36f726b584951ba52b2ca55341f06_s` (`e_2fd36f726b584951ba52b2ca55341f06_s`),
  KEY `e_2fd36f726b584951ba52b2ca55341f06_n` (`e_2fd36f726b584951ba52b2ca55341f06_n`),
  KEY `e_2fd36f726b584951ba52b2ca55341f06_d` (`e_2fd36f726b584951ba52b2ca55341f06_d`),
  KEY `e_0abdd586846b4b1b8875091145c1ef39_s` (`e_0abdd586846b4b1b8875091145c1ef39_s`),
  KEY `e_0abdd586846b4b1b8875091145c1ef39_n` (`e_0abdd586846b4b1b8875091145c1ef39_n`),
  KEY `e_0abdd586846b4b1b8875091145c1ef39_d` (`e_0abdd586846b4b1b8875091145c1ef39_d`),
  KEY `e_7fb021ba6ebd4517bef8488d0b54b662_s` (`e_7fb021ba6ebd4517bef8488d0b54b662_s`),
  KEY `e_7fb021ba6ebd4517bef8488d0b54b662_n` (`e_7fb021ba6ebd4517bef8488d0b54b662_n`),
  KEY `e_7fb021ba6ebd4517bef8488d0b54b662_d` (`e_7fb021ba6ebd4517bef8488d0b54b662_d`),
  KEY `e_6cc8b1b5c63f49b19a6404e73ef85bfc_s` (`e_6cc8b1b5c63f49b19a6404e73ef85bfc_s`),
  KEY `e_6cc8b1b5c63f49b19a6404e73ef85bfc_n` (`e_6cc8b1b5c63f49b19a6404e73ef85bfc_n`),
  KEY `e_6cc8b1b5c63f49b19a6404e73ef85bfc_d` (`e_6cc8b1b5c63f49b19a6404e73ef85bfc_d`),
  KEY `e_df9e1a1f47d648279ed0e102215bdbf0_s` (`e_df9e1a1f47d648279ed0e102215bdbf0_s`),
  KEY `e_df9e1a1f47d648279ed0e102215bdbf0_n` (`e_df9e1a1f47d648279ed0e102215bdbf0_n`),
  KEY `e_df9e1a1f47d648279ed0e102215bdbf0_d` (`e_df9e1a1f47d648279ed0e102215bdbf0_d`),
  KEY `e_ba7f5f1e56164aab8495ef3a269d0dc6_s` (`e_ba7f5f1e56164aab8495ef3a269d0dc6_s`),
  KEY `e_ba7f5f1e56164aab8495ef3a269d0dc6_n` (`e_ba7f5f1e56164aab8495ef3a269d0dc6_n`),
  KEY `e_ba7f5f1e56164aab8495ef3a269d0dc6_d` (`e_ba7f5f1e56164aab8495ef3a269d0dc6_d`),
  KEY `e_882d1aa19b8e404d832018dd7cdae20c_s` (`e_882d1aa19b8e404d832018dd7cdae20c_s`),
  KEY `e_882d1aa19b8e404d832018dd7cdae20c_n` (`e_882d1aa19b8e404d832018dd7cdae20c_n`),
  KEY `e_882d1aa19b8e404d832018dd7cdae20c_d` (`e_882d1aa19b8e404d832018dd7cdae20c_d`),
  KEY `e_a5dcf31d27d544f1b7148a34ddeb5258_s` (`e_a5dcf31d27d544f1b7148a34ddeb5258_s`),
  KEY `e_a5dcf31d27d544f1b7148a34ddeb5258_n` (`e_a5dcf31d27d544f1b7148a34ddeb5258_n`),
  KEY `e_a5dcf31d27d544f1b7148a34ddeb5258_d` (`e_a5dcf31d27d544f1b7148a34ddeb5258_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_flat`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_flat` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_acf2ccac10594763a8bd30ed7c45cda8_s` varchar(50) DEFAULT NULL,
  `e_acf2ccac10594763a8bd30ed7c45cda8_n` double DEFAULT NULL,
  `e_acf2ccac10594763a8bd30ed7c45cda8_d` datetime DEFAULT NULL,
  `e_1d17b809d9054054a1dcd59cf1acf682_s` varchar(50) DEFAULT NULL,
  `e_1d17b809d9054054a1dcd59cf1acf682_n` double DEFAULT NULL,
  `e_1d17b809d9054054a1dcd59cf1acf682_d` datetime DEFAULT NULL,
  `e_7900b8fb88ca40609f24b8aa0937aa5b_s` varchar(50) DEFAULT NULL,
  `e_7900b8fb88ca40609f24b8aa0937aa5b_n` double DEFAULT NULL,
  `e_7900b8fb88ca40609f24b8aa0937aa5b_d` datetime DEFAULT NULL,
  `e_9a07ec34a8504f1c9fbf4db6d346e500_s` varchar(50) DEFAULT NULL,
  `e_9a07ec34a8504f1c9fbf4db6d346e500_n` double DEFAULT NULL,
  `e_9a07ec34a8504f1c9fbf4db6d346e500_d` datetime DEFAULT NULL,
  `e_39671c0b4f874f94aa8a5ebdbb29ffb6_s` varchar(50) DEFAULT NULL,
  `e_39671c0b4f874f94aa8a5ebdbb29ffb6_n` double DEFAULT NULL,
  `e_39671c0b4f874f94aa8a5ebdbb29ffb6_d` datetime DEFAULT NULL,
  `e_1c2ea91b0e07497b9d5603fe07689a27_s` varchar(50) DEFAULT NULL,
  `e_1c2ea91b0e07497b9d5603fe07689a27_n` double DEFAULT NULL,
  `e_1c2ea91b0e07497b9d5603fe07689a27_d` datetime DEFAULT NULL,
  `e_9fa3098a048e4d1cb8653bc862af074b_s` varchar(50) DEFAULT NULL,
  `e_9fa3098a048e4d1cb8653bc862af074b_n` double DEFAULT NULL,
  `e_9fa3098a048e4d1cb8653bc862af074b_d` datetime DEFAULT NULL,
  `e_f5b2770cd98943eab4e096b59049e016_s` varchar(50) DEFAULT NULL,
  `e_f5b2770cd98943eab4e096b59049e016_n` double DEFAULT NULL,
  `e_f5b2770cd98943eab4e096b59049e016_d` datetime DEFAULT NULL,
  `e_c12a95267d67441e998de2ffee5c9e57_s` varchar(50) DEFAULT NULL,
  `e_c12a95267d67441e998de2ffee5c9e57_n` double DEFAULT NULL,
  `e_c12a95267d67441e998de2ffee5c9e57_d` datetime DEFAULT NULL,
  `e_6a2b02403dd247838b65edbe9ed930c0_s` varchar(50) DEFAULT NULL,
  `e_6a2b02403dd247838b65edbe9ed930c0_n` double DEFAULT NULL,
  `e_6a2b02403dd247838b65edbe9ed930c0_d` datetime DEFAULT NULL,
  `e_17908dd578e349fa9c837650ebdfac31_s` varchar(50) DEFAULT NULL,
  `e_17908dd578e349fa9c837650ebdfac31_n` double DEFAULT NULL,
  `e_17908dd578e349fa9c837650ebdfac31_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_acf2ccac10594763a8bd30ed7c45cda8_s` (`e_acf2ccac10594763a8bd30ed7c45cda8_s`),
  KEY `e_acf2ccac10594763a8bd30ed7c45cda8_n` (`e_acf2ccac10594763a8bd30ed7c45cda8_n`),
  KEY `e_acf2ccac10594763a8bd30ed7c45cda8_d` (`e_acf2ccac10594763a8bd30ed7c45cda8_d`),
  KEY `e_1d17b809d9054054a1dcd59cf1acf682_s` (`e_1d17b809d9054054a1dcd59cf1acf682_s`),
  KEY `e_1d17b809d9054054a1dcd59cf1acf682_n` (`e_1d17b809d9054054a1dcd59cf1acf682_n`),
  KEY `e_1d17b809d9054054a1dcd59cf1acf682_d` (`e_1d17b809d9054054a1dcd59cf1acf682_d`),
  KEY `e_7900b8fb88ca40609f24b8aa0937aa5b_s` (`e_7900b8fb88ca40609f24b8aa0937aa5b_s`),
  KEY `e_7900b8fb88ca40609f24b8aa0937aa5b_n` (`e_7900b8fb88ca40609f24b8aa0937aa5b_n`),
  KEY `e_7900b8fb88ca40609f24b8aa0937aa5b_d` (`e_7900b8fb88ca40609f24b8aa0937aa5b_d`),
  KEY `e_9a07ec34a8504f1c9fbf4db6d346e500_s` (`e_9a07ec34a8504f1c9fbf4db6d346e500_s`),
  KEY `e_9a07ec34a8504f1c9fbf4db6d346e500_n` (`e_9a07ec34a8504f1c9fbf4db6d346e500_n`),
  KEY `e_9a07ec34a8504f1c9fbf4db6d346e500_d` (`e_9a07ec34a8504f1c9fbf4db6d346e500_d`),
  KEY `e_39671c0b4f874f94aa8a5ebdbb29ffb6_s` (`e_39671c0b4f874f94aa8a5ebdbb29ffb6_s`),
  KEY `e_39671c0b4f874f94aa8a5ebdbb29ffb6_n` (`e_39671c0b4f874f94aa8a5ebdbb29ffb6_n`),
  KEY `e_39671c0b4f874f94aa8a5ebdbb29ffb6_d` (`e_39671c0b4f874f94aa8a5ebdbb29ffb6_d`),
  KEY `e_1c2ea91b0e07497b9d5603fe07689a27_s` (`e_1c2ea91b0e07497b9d5603fe07689a27_s`),
  KEY `e_1c2ea91b0e07497b9d5603fe07689a27_n` (`e_1c2ea91b0e07497b9d5603fe07689a27_n`),
  KEY `e_1c2ea91b0e07497b9d5603fe07689a27_d` (`e_1c2ea91b0e07497b9d5603fe07689a27_d`),
  KEY `e_9fa3098a048e4d1cb8653bc862af074b_s` (`e_9fa3098a048e4d1cb8653bc862af074b_s`),
  KEY `e_9fa3098a048e4d1cb8653bc862af074b_n` (`e_9fa3098a048e4d1cb8653bc862af074b_n`),
  KEY `e_9fa3098a048e4d1cb8653bc862af074b_d` (`e_9fa3098a048e4d1cb8653bc862af074b_d`),
  KEY `e_f5b2770cd98943eab4e096b59049e016_s` (`e_f5b2770cd98943eab4e096b59049e016_s`),
  KEY `e_f5b2770cd98943eab4e096b59049e016_n` (`e_f5b2770cd98943eab4e096b59049e016_n`),
  KEY `e_f5b2770cd98943eab4e096b59049e016_d` (`e_f5b2770cd98943eab4e096b59049e016_d`),
  KEY `e_c12a95267d67441e998de2ffee5c9e57_s` (`e_c12a95267d67441e998de2ffee5c9e57_s`),
  KEY `e_c12a95267d67441e998de2ffee5c9e57_n` (`e_c12a95267d67441e998de2ffee5c9e57_n`),
  KEY `e_c12a95267d67441e998de2ffee5c9e57_d` (`e_c12a95267d67441e998de2ffee5c9e57_d`),
  KEY `e_6a2b02403dd247838b65edbe9ed930c0_s` (`e_6a2b02403dd247838b65edbe9ed930c0_s`),
  KEY `e_6a2b02403dd247838b65edbe9ed930c0_n` (`e_6a2b02403dd247838b65edbe9ed930c0_n`),
  KEY `e_6a2b02403dd247838b65edbe9ed930c0_d` (`e_6a2b02403dd247838b65edbe9ed930c0_d`),
  KEY `e_17908dd578e349fa9c837650ebdfac31_s` (`e_17908dd578e349fa9c837650ebdfac31_s`),
  KEY `e_17908dd578e349fa9c837650ebdfac31_n` (`e_17908dd578e349fa9c837650ebdfac31_n`),
  KEY `e_17908dd578e349fa9c837650ebdfac31_d` (`e_17908dd578e349fa9c837650ebdfac31_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_news`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_0535f025197445ab89e20d2038a30c8f_s` varchar(50) DEFAULT NULL,
  `e_0535f025197445ab89e20d2038a30c8f_n` double DEFAULT NULL,
  `e_0535f025197445ab89e20d2038a30c8f_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_0535f025197445ab89e20d2038a30c8f_s` (`e_0535f025197445ab89e20d2038a30c8f_s`),
  KEY `e_0535f025197445ab89e20d2038a30c8f_n` (`e_0535f025197445ab89e20d2038a30c8f_n`),
  KEY `e_0535f025197445ab89e20d2038a30c8f_d` (`e_0535f025197445ab89e20d2038a30c8f_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_order`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_dc9abe7b8bc84916b2c5d87770d08416_s` varchar(50) DEFAULT NULL,
  `e_dc9abe7b8bc84916b2c5d87770d08416_n` double DEFAULT NULL,
  `e_dc9abe7b8bc84916b2c5d87770d08416_d` datetime DEFAULT NULL,
  `e_e51aca1f39d64e2aaebb2cba5cef52fc_s` varchar(50) DEFAULT NULL,
  `e_e51aca1f39d64e2aaebb2cba5cef52fc_n` double DEFAULT NULL,
  `e_e51aca1f39d64e2aaebb2cba5cef52fc_d` datetime DEFAULT NULL,
  `e_2f4e8ec909b34c45812d08b9af568847_s` varchar(50) DEFAULT NULL,
  `e_2f4e8ec909b34c45812d08b9af568847_n` double DEFAULT NULL,
  `e_2f4e8ec909b34c45812d08b9af568847_d` datetime DEFAULT NULL,
  `e_7ced0571b1d74311acd9e4dda76a4cb6_s` varchar(50) DEFAULT NULL,
  `e_7ced0571b1d74311acd9e4dda76a4cb6_n` double DEFAULT NULL,
  `e_7ced0571b1d74311acd9e4dda76a4cb6_d` datetime DEFAULT NULL,
  `e_d99453d3f8924a05b3031ffa8d4e26df_s` varchar(50) DEFAULT NULL,
  `e_d99453d3f8924a05b3031ffa8d4e26df_n` double DEFAULT NULL,
  `e_d99453d3f8924a05b3031ffa8d4e26df_d` datetime DEFAULT NULL,
  `e_95ab68aeef294d10a82dc2bd78258227_s` varchar(50) DEFAULT NULL,
  `e_95ab68aeef294d10a82dc2bd78258227_n` double DEFAULT NULL,
  `e_95ab68aeef294d10a82dc2bd78258227_d` datetime DEFAULT NULL,
  `e_c2e23d1541c54406b7fa0db873105c78_s` varchar(50) DEFAULT NULL,
  `e_c2e23d1541c54406b7fa0db873105c78_n` double DEFAULT NULL,
  `e_c2e23d1541c54406b7fa0db873105c78_d` datetime DEFAULT NULL,
  `e_2c200017727946dba2fe2ef87b7ac23c_s` varchar(50) DEFAULT NULL,
  `e_2c200017727946dba2fe2ef87b7ac23c_n` double DEFAULT NULL,
  `e_2c200017727946dba2fe2ef87b7ac23c_d` datetime DEFAULT NULL,
  `e_1e680d82aa0940d19c836baf90ceee13_s` varchar(50) DEFAULT NULL,
  `e_1e680d82aa0940d19c836baf90ceee13_n` double DEFAULT NULL,
  `e_1e680d82aa0940d19c836baf90ceee13_d` datetime DEFAULT NULL,
  `e_c1b20e16386940db95b92c8fd0a8649f_s` varchar(50) DEFAULT NULL,
  `e_c1b20e16386940db95b92c8fd0a8649f_n` double DEFAULT NULL,
  `e_c1b20e16386940db95b92c8fd0a8649f_d` datetime DEFAULT NULL,
  `e_2be39cc61214463bb73b76b890c0d614_s` varchar(50) DEFAULT NULL,
  `e_2be39cc61214463bb73b76b890c0d614_n` double DEFAULT NULL,
  `e_2be39cc61214463bb73b76b890c0d614_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_dc9abe7b8bc84916b2c5d87770d08416_s` (`e_dc9abe7b8bc84916b2c5d87770d08416_s`),
  KEY `e_dc9abe7b8bc84916b2c5d87770d08416_n` (`e_dc9abe7b8bc84916b2c5d87770d08416_n`),
  KEY `e_dc9abe7b8bc84916b2c5d87770d08416_d` (`e_dc9abe7b8bc84916b2c5d87770d08416_d`),
  KEY `e_e51aca1f39d64e2aaebb2cba5cef52fc_s` (`e_e51aca1f39d64e2aaebb2cba5cef52fc_s`),
  KEY `e_e51aca1f39d64e2aaebb2cba5cef52fc_n` (`e_e51aca1f39d64e2aaebb2cba5cef52fc_n`),
  KEY `e_e51aca1f39d64e2aaebb2cba5cef52fc_d` (`e_e51aca1f39d64e2aaebb2cba5cef52fc_d`),
  KEY `e_2f4e8ec909b34c45812d08b9af568847_s` (`e_2f4e8ec909b34c45812d08b9af568847_s`),
  KEY `e_2f4e8ec909b34c45812d08b9af568847_n` (`e_2f4e8ec909b34c45812d08b9af568847_n`),
  KEY `e_2f4e8ec909b34c45812d08b9af568847_d` (`e_2f4e8ec909b34c45812d08b9af568847_d`),
  KEY `e_7ced0571b1d74311acd9e4dda76a4cb6_s` (`e_7ced0571b1d74311acd9e4dda76a4cb6_s`),
  KEY `e_7ced0571b1d74311acd9e4dda76a4cb6_n` (`e_7ced0571b1d74311acd9e4dda76a4cb6_n`),
  KEY `e_7ced0571b1d74311acd9e4dda76a4cb6_d` (`e_7ced0571b1d74311acd9e4dda76a4cb6_d`),
  KEY `e_d99453d3f8924a05b3031ffa8d4e26df_s` (`e_d99453d3f8924a05b3031ffa8d4e26df_s`),
  KEY `e_d99453d3f8924a05b3031ffa8d4e26df_n` (`e_d99453d3f8924a05b3031ffa8d4e26df_n`),
  KEY `e_d99453d3f8924a05b3031ffa8d4e26df_d` (`e_d99453d3f8924a05b3031ffa8d4e26df_d`),
  KEY `e_95ab68aeef294d10a82dc2bd78258227_s` (`e_95ab68aeef294d10a82dc2bd78258227_s`),
  KEY `e_95ab68aeef294d10a82dc2bd78258227_n` (`e_95ab68aeef294d10a82dc2bd78258227_n`),
  KEY `e_95ab68aeef294d10a82dc2bd78258227_d` (`e_95ab68aeef294d10a82dc2bd78258227_d`),
  KEY `e_c2e23d1541c54406b7fa0db873105c78_s` (`e_c2e23d1541c54406b7fa0db873105c78_s`),
  KEY `e_c2e23d1541c54406b7fa0db873105c78_n` (`e_c2e23d1541c54406b7fa0db873105c78_n`),
  KEY `e_c2e23d1541c54406b7fa0db873105c78_d` (`e_c2e23d1541c54406b7fa0db873105c78_d`),
  KEY `e_2c200017727946dba2fe2ef87b7ac23c_s` (`e_2c200017727946dba2fe2ef87b7ac23c_s`),
  KEY `e_2c200017727946dba2fe2ef87b7ac23c_n` (`e_2c200017727946dba2fe2ef87b7ac23c_n`),
  KEY `e_2c200017727946dba2fe2ef87b7ac23c_d` (`e_2c200017727946dba2fe2ef87b7ac23c_d`),
  KEY `e_1e680d82aa0940d19c836baf90ceee13_s` (`e_1e680d82aa0940d19c836baf90ceee13_s`),
  KEY `e_1e680d82aa0940d19c836baf90ceee13_n` (`e_1e680d82aa0940d19c836baf90ceee13_n`),
  KEY `e_1e680d82aa0940d19c836baf90ceee13_d` (`e_1e680d82aa0940d19c836baf90ceee13_d`),
  KEY `e_c1b20e16386940db95b92c8fd0a8649f_s` (`e_c1b20e16386940db95b92c8fd0a8649f_s`),
  KEY `e_c1b20e16386940db95b92c8fd0a8649f_n` (`e_c1b20e16386940db95b92c8fd0a8649f_n`),
  KEY `e_c1b20e16386940db95b92c8fd0a8649f_d` (`e_c1b20e16386940db95b92c8fd0a8649f_d`),
  KEY `e_2be39cc61214463bb73b76b890c0d614_s` (`e_2be39cc61214463bb73b76b890c0d614_s`),
  KEY `e_2be39cc61214463bb73b76b890c0d614_n` (`e_2be39cc61214463bb73b76b890c0d614_n`),
  KEY `e_2be39cc61214463bb73b76b890c0d614_d` (`e_2be39cc61214463bb73b76b890c0d614_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_page`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_product`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_a9da76ee6c084abdbdec804808de0d6b_s` varchar(50) DEFAULT NULL,
  `e_a9da76ee6c084abdbdec804808de0d6b_n` double DEFAULT NULL,
  `e_a9da76ee6c084abdbdec804808de0d6b_d` datetime DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_s` varchar(50) DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_n` double DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_d` datetime DEFAULT NULL,
  `e_97b915bdc9fd4ec4bad1cc0154c0340f_s` varchar(50) DEFAULT NULL,
  `e_97b915bdc9fd4ec4bad1cc0154c0340f_n` double DEFAULT NULL,
  `e_97b915bdc9fd4ec4bad1cc0154c0340f_d` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_s` (`e_a9da76ee6c084abdbdec804808de0d6b_s`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_n` (`e_a9da76ee6c084abdbdec804808de0d6b_n`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_d` (`e_a9da76ee6c084abdbdec804808de0d6b_d`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_s` (`e_888260d0e4b749ca949a063f17dedab1_s`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_n` (`e_888260d0e4b749ca949a063f17dedab1_n`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_d` (`e_888260d0e4b749ca949a063f17dedab1_d`),
  KEY `e_97b915bdc9fd4ec4bad1cc0154c0340f_s` (`e_97b915bdc9fd4ec4bad1cc0154c0340f_s`),
  KEY `e_97b915bdc9fd4ec4bad1cc0154c0340f_n` (`e_97b915bdc9fd4ec4bad1cc0154c0340f_n`),
  KEY `e_97b915bdc9fd4ec4bad1cc0154c0340f_d` (`e_97b915bdc9fd4ec4bad1cc0154c0340f_d`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Дамп данных таблицы `bzrnp_zoo_jbzoo_index_product`
--

INSERT INTO `bzrnp_zoo_jbzoo_index_product` (`id`, `item_id`, `e_itemcategory_s`, `e_itemcategory_n`, `e_itemtag_s`, `e_itemtag_n`, `e_itemfrontpage_n`, `e_a9da76ee6c084abdbdec804808de0d6b_s`, `e_a9da76ee6c084abdbdec804808de0d6b_n`, `e_a9da76ee6c084abdbdec804808de0d6b_d`, `e_888260d0e4b749ca949a063f17dedab1_s`, `e_888260d0e4b749ca949a063f17dedab1_n`, `e_888260d0e4b749ca949a063f17dedab1_d`, `e_97b915bdc9fd4ec4bad1cc0154c0340f_s`, `e_97b915bdc9fd4ec4bad1cc0154c0340f_n`, `e_97b915bdc9fd4ec4bad1cc0154c0340f_d`) VALUES
(15, 10, 'Кровельный иструмент и оборудование', 62, NULL, NULL, 0, NULL, NULL, NULL, '500', 500, NULL, NULL, NULL, NULL),
(17, 11, 'Кровельные элементы', 16, NULL, NULL, 0, NULL, NULL, NULL, '1000', 1000, '2014-07-09 10:00:00', NULL, NULL, NULL),
(18, 12, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, '43252345', 43252345, NULL, NULL, NULL, NULL),
(19, 13, '', NULL, NULL, NULL, 0, NULL, NULL, NULL, '457', 457, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_tovar`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_tovar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(11) unsigned NOT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) NOT NULL DEFAULT '0',
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_sku`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_sku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `element_id` varchar(50) NOT NULL,
  `sku` varchar(100) NOT NULL,
  `type` int(11) NOT NULL,
  `is_new` tinyint(4) NOT NULL DEFAULT '0',
  `is_hit` tinyint(4) NOT NULL DEFAULT '0',
  `is_sale` tinyint(4) NOT NULL DEFAULT '0',
  `price` float NOT NULL,
  `total` float NOT NULL,
  `currency` varchar(20) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT '0',
  `hash` varchar(150) DEFAULT NULL,
  `params` text,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`),
  KEY `item_id` (`item_id`),
  KEY `type` (`type`),
  KEY `element_id` (`element_id`),
  KEY `price` (`price`),
  KEY `total` (`total`),
  KEY `sku` (`sku`),
  KEY `is_new` (`is_new`),
  KEY `is_hit` (`is_hit`),
  KEY `is_sale` (`is_sale`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- Дамп данных таблицы `bzrnp_zoo_jbzoo_sku`
--

INSERT INTO `bzrnp_zoo_jbzoo_sku` (`id`, `item_id`, `element_id`, `sku`, `type`, `is_new`, `is_hit`, `is_sale`, `price`, `total`, `currency`, `balance`, `hash`, `params`) VALUES
(21, 11, '888260d0-e4b7-49ca-949a-063f17dedab1', '11', 1, 0, 0, 0, 1000, 1000, 'EUR', -1, '11', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(22, 12, '888260d0-e4b7-49ca-949a-063f17dedab1', '12', 1, 0, 0, 0, 43252300, 43252300, 'EUR', -1, '12', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(23, 13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 1, 0, 0, 0, 457, 457, 'EUR', -1, '13', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(19, 10, '888260d0-e4b7-49ca-949a-063f17dedab1', '10', 1, 0, 0, 0, 500, 500, 'EUR', -1, '10', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_rating`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `element_id` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `value` tinyint(4) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_search_index`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_search_index` (
  `item_id` int(11) NOT NULL,
  `element_id` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`item_id`,`element_id`),
  FULLTEXT KEY `SEARCH_FULLTEXT` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_search_index`
--

INSERT INTO `bzrnp_zoo_search_index` (`item_id`, `element_id`, `value`) VALUES
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '457'),
(10, '888260d0-e4b7-49ca-949a-063f17dedab1', '500'),
(11, '888260d0-e4b7-49ca-949a-063f17dedab1', '1000'),
(12, '888260d0-e4b7-49ca-949a-063f17dedab1', '43252345');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_submission`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_submission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(3) NOT NULL,
  `access` int(11) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ALIAS_INDEX` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_tag`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_tag` (
  `item_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`item_id`,`name`),
  UNIQUE KEY `NAME_ITEMID_INDEX` (`name`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_version`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_version` (
  `version` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_version`
--

INSERT INTO `bzrnp_zoo_version` (`version`) VALUES
('3.1.6');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
