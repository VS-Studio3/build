-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 25 2014 г., 09:57
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `bzrnp_assets`
--

INSERT INTO `bzrnp_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 1, 85, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 34, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 35, 36, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 37, 38, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 39, 40, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 41, 42, 1, 'com_login', 'com_login', '{}'),
(13, 1, 43, 44, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 45, 46, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 47, 48, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 49, 50, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 51, 52, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 53, 54, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 55, 58, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 59, 60, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 61, 62, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 63, 64, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 65, 66, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 67, 70, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 71, 74, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 75, 76, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 29, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 56, 57, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 72, 73, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 68, 69, 1, 'com_users.notes.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 77, 78, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(35, 1, 79, 80, 1, 'com_zoo', 'com_zoo', '{}'),
(36, 1, 81, 82, 1, 'com_nivosliderpro', 'com_nivosliderpro', '{}'),
(37, 8, 30, 33, 2, 'com_content.category.8', 'Новости', '{"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(38, 37, 31, 32, 3, 'com_content.article.1', 'Первый материал', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(39, 27, 19, 20, 3, 'com_content.article.2', 'О компании', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(40, 1, 83, 84, 1, 'com_foxcontact', 'com_foxcontact', '{}'),
(41, 27, 21, 22, 3, 'com_content.article.3', 'Ремонт', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(42, 27, 23, 24, 3, 'com_content.article.4', 'Монтаж', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(43, 27, 25, 26, 3, 'com_content.article.5', 'Доставка', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}'),
(44, 27, 27, 28, 3, 'com_content.article.6', 'Замеры', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `bzrnp_content`
--

INSERT INTO `bzrnp_content` (`id`, `asset_id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 38, 'Первый материал', 'pervyj-material', '', '<p>Не следует, однако <span style="line-height: 1.3em;">забывать, </span><span style="line-height: 1.3em;">что сложившаяся </span><span style="line-height: 1.3em;">структура организации </span><span style="line-height: 1.3em;">требуют от нас анализа </span><span style="line-height: 1.3em;">дальнейших направлений</span></p>', '', 1, 0, 0, 8, '2014-06-27 08:13:40', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-06-27 08:13:40', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(2, 39, 'О компании', 'o-kompanii', '', '<p>Не следует, однако забывать, что реализация намеченных плановых заданий в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа форм развития. Не следует, однако забывать, что реализация намеченных плановых заданий играет важную роль в формировании существенных финансовых и административных условий.</p>\r\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа модели развития. Товарищи! реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Идейные соображения высшего порядка, а также новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании модели развития. Не следует, однако забывать, что консультация с широким активом представляет собой интересный эксперимент проверки форм развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют определения и уточнения форм развития.</p>', '', 1, 0, 0, 2, '2014-06-27 08:41:56', 42, '', '2014-06-27 08:46:25', 42, 0, '0000-00-00 00:00:00', '2014-06-27 08:41:56', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"0","link_titles":"0","show_intro":"0","show_category":"0","link_category":"0","show_parent_category":"0","link_parent_category":"0","show_author":"0","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"0","show_item_navigation":"0","show_icons":"0","show_print_icon":"0","show_email_icon":"0","show_vote":"0","show_hits":"0","show_noauth":"0","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"0","show_article_options":"0","show_urls_images_backend":"0","show_urls_images_frontend":"0"}', 5, 0, 4, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', ''),
(3, 41, 'Ремонт', 'remont', '', '<p>Ремонт</p>', '', 1, 0, 0, 2, '2014-07-24 06:50:06', 42, '', '2014-07-24 06:50:15', 42, 0, '0000-00-00 00:00:00', '2014-07-24 06:50:06', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 2, 0, 3, '', '', 1, 3, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(4, 42, 'Монтаж', 'montazh', '', '<p>Монтаж</p>', '', 1, 0, 0, 2, '2014-07-24 06:50:39', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-07-24 06:50:39', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 2, '', '', 1, 1, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(5, 43, 'Доставка', 'dostavka', '', '<p>Доставка</p>', '', 1, 0, 0, 2, '2014-07-24 06:50:59', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-07-24 06:50:59', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 1, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', ''),
(6, 44, 'Замеры', 'zamery', '', '<p>Замеры</p>', '', 1, 0, 0, 2, '2014-07-24 06:51:13', 42, '', '0000-00-00 00:00:00', 0, 0, '0000-00-00 00:00:00', '2014-07-24 06:51:13', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 1, 0, 0, '', '', 1, 0, '{"robots":"","author":"","rights":"","xreference":""}', 0, '*', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10048 ;

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
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"legacy":false,"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2014 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"2.5.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
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
(10045, 'jbzoo', 'package', 'pkg_jbzoo', '', 0, 1, 1, 0, '{"legacy":false,"name":"JBZoo Package","type":"package","creationDate":"2013 12","author":"JBZoo.com","copyright":"Copyright (C) JBZoo.com,  All rights reserved.","authorEmail":"admin@jbzoo.com","authorUrl":"http:\\/\\/jbzoo.com","version":"2.1.1 Pro","description":"JBZoo App is universal Joomla CCK, application for YooTheme Zoo component. Developed by JBZoo.com","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10046, 'Fox Contact', 'module', 'mod_foxcontact', '', 0, 1, 0, 0, '{"legacy":false,"name":"Fox Contact","type":"module","creationDate":"Unknown","author":"Demis Palma","copyright":"Demis Palma","authorEmail":"demis@fox.ra.it","authorUrl":"http:\\/\\/www.fox.ra.it\\/","version":"2.0.19","description":"MOD_FOXCONTACT_DESCRIPTION","group":""}', '{"form_width":"100","form_unit":"%","customhtml0display":"1","customhtml0order":"-1000","customhtml1display":"1","customhtml1order":"1000","labelsdisplay":"0","labelswidth":"230","labelsunit":"px","sender0display":"2","sender0order":"5","sender1display":"2","sender1order":"10","sender1isemail":"1","senderwidth":"85","senderunit":"%","text0display":"1","text0order":"15","text1display":"0","text1order":"20","text2display":"0","text2order":"25","text3display":"0","text3order":"30","text4display":"0","text4order":"35","text5display":"0","text5order":"40","text6display":"0","text6order":"45","text7display":"0","text7order":"50","text8display":"0","text8order":"55","text9display":"0","text9order":"60","textwidth":"85","textunit":"%","dropdown0display":"1","dropdown0order":"65","dropdown1display":"0","dropdown1order":"70","dropdown2display":"0","dropdown2order":"75","dropdownwidth":"85","dropdownunit":"%","textarea0display":"1","textarea0order":"80","textarea1display":"0","textarea1order":"85","textarea2display":"0","textarea2order":"90","textareawidth":"85","textareaheight":"180","textareaunit":"%","checkbox0display":"1","checkbox0order":"95","checkbox1display":"0","checkbox1order":"100","checkbox2display":"0","checkbox2order":"105","checkbox3display":"0","checkbox3order":"110","checkbox4display":"0","checkbox4order":"115","uploaddisplay":"0","uploadmethod":"1","uploadmax_file_size":"10000","upload_filter":"1","upload_audio":"0","upload_video":"0","upload_images":"1","upload_documents":"1","upload_archives":"1","submittype":"0","submiticon":"","resetbutton":"0","resettype":"0","reseticon":"","email_sent_action":"0","email_sent_textdisplay":"1","copy_to_submitter":"1","email_copy_summary":"0","spam_check":"1","spam_detected_textdisplay":"1","stdcaptchadisplay":"0","stdcaptchatype":"0","stdcaptcha_length":"5","stdcaptchawidth":"150","stdcaptchaheight":"75","stdcaptchafont":"","stdcaptchafontmin":"14","stdcaptchafontmax":"20","stdcaptchaangle":"20","stdcaptcha_backgroundcolor":"#ffffff","stdcaptcha_textcolor":"#191919","stdcaptcha_disturbcolor":"#c8c8c8","stylesheet":"neon.css","acymailing":"0","acymailing_checkboxes":"hidden|hidden","acymailing_auto_checked":"0","jnews":"0","jnews_checkboxes":"hidden|hidden","jnews_auto_checked":"0","othernewsletters":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10047, 'com_foxcontact', 'component', 'com_foxcontact', '', 1, 1, 0, 0, '{"legacy":false,"name":"COM_FOXCONTACT","type":"component","creationDate":"Unknown","author":"Demis Palma","copyright":"Demis Palma","authorEmail":"demis@fox.ra.it","authorUrl":"http:\\/\\/www.fox.ra.it\\/","version":"2.0.19","description":"COM_FOXCONTACT_DESCRIPTION","group":""}', '{"adminemailfrom":{"select":"admin"},"adminemailreplyto":{"select":"submitter"},"submitteremailfrom":{"select":"admin"},"submitteremailreplyto":{"select":"admin"}}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=148 ;

--
-- Дамп данных таблицы `bzrnp_finder_links`
--

INSERT INTO `bzrnp_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(79, 'index.php?option=com_zoo&view=item&id=27', 'index.php?option=com_zoo&task=item&item_id=27', 'Лобня', '', '2014-07-20 09:12:57', '496785ee9e0e271286c8ba249eba2407', 1, 1, 1, '*', '2014-07-20 06:11:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223237223b733a353a22616c696173223b733a373a226c7975626e7961223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32302030363a31323a3535223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a33363a22696e6465782e7068702f636f6d706f6e656e742f7a6f6f2f6974656d2f6c7975626e7961223b733a31323a22656c656d656e745f64617461223b613a303a7b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31303a22d093d0bed180d0bed0b4223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d093d0bed180d0bed0b4223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a33353a22d0a2d0b0d0bcd0b1d0bed0b2d181d0bad0b0d18f20d0bed0b1d0bbd0b0d181d182d18c223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a33353a22d0a2d0b0d0bcd0b1d0bed0b2d181d0bad0b0d18f20d0bed0b1d0bbd0b0d181d182d18c223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3237223b733a353a22726f757465223b733a34353a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3237223b733a353a227469746c65223b733a31303a22d09bd0bed0b1d0bdd18f223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32302030363a31313a3233223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(147, 'index.php?option=com_zoo&view=item&id=12', 'index.php?option=com_zoo&task=item&item_id=12&Itemid=149', 'Товар 3', '', '2014-07-24 15:45:54', '83214788399d77132fe9ee41c35bfdbc', 1, 1, 1, '*', '2014-07-09 10:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223132223b733a353a22616c696173223b733a373a22746f7661722d33223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342031323a34353a3532223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d33223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a31323a22d09fd180d0b8d0b2d0b5d182223b693a313b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a323b733a323a223132223b693a333b733a31343a22d091d0b5d0b6d0b5d0b2d18bd0b9223b693a343b733a343a22d188d182223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3132223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3132264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802033223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392031303a30323a3034223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(50, 'index.php?option=com_zoo&view=item&id=15', 'index.php?option=com_zoo&task=item&item_id=15&Itemid=107', 'Заказ #15 / 2014-07-11 09:51:01 (GMT 2)', '', '2014-07-11 12:51:01', '8303093f2f2c5675bf6f6153756bb67e', 1, 0, 1, '*', '2014-07-11 09:51:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223135223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31312d3039353130312d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31312030393a35313a3030223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31312d3039353130312d676d742d32223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a343a22d094d0b0223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3135223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3135264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233135202f20323031342d30372d31312030393a35313a30312028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31312030393a35313a3030223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(52, 'index.php?option=com_zoo&view=item&id=16', 'index.php?option=com_zoo&task=item&item_id=16&Itemid=107', 'Заказ #16 / 2014-07-11 10:03:17 (GMT 2)', '', '2014-07-11 13:03:17', '96053949ec70cef2a97d463edd83540f', 1, 0, 1, '*', '2014-07-11 10:03:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223136223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31312d3130303331372d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31312031303a30333a3137223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31312d3130303331372d676d742d32223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a363a22d09dd0b5d182223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3136223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3136264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233136202f20323031342d30372d31312031303a30333a31372028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31312031303a30333a3137223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(54, 'index.php?option=com_zoo&view=item&id=17', 'index.php?option=com_zoo&task=item&item_id=17&Itemid=107', 'Заказ #17 / 2014-07-11 10:30:48 (GMT 2)', '', '2014-07-11 13:30:49', 'c0909dcf3eabbfd6536fd94a302c2b6f', 1, 0, 1, '*', '2014-07-11 10:30:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223137223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31312d3130333034382d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31312031303a33303a3438223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31312d3130333034382d676d742d32223b733a31323a22656c656d656e745f64617461223b613a313a7b693a303b733a34363a22d09ed0bfd0bbd0b0d182d0b020d0b1d0b0d0bdd0bad0bed0b2d181d0bad0bed0b920d0bad0b0d180d182d0bed0b9223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3137223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3137264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233137202f20323031342d30372d31312031303a33303a34382028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31312031303a33303a3438223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(56, 'index.php?option=com_zoo&view=item&id=18', 'index.php?option=com_zoo&task=item&item_id=18&Itemid=107', 'Заказ #18 / 2014-07-11 10:34:42 (GMT 2)', '', '2014-07-11 13:34:42', 'eb1c82c60627fb23a965d467de12fdcd', 1, 0, 1, '*', '2014-07-11 10:34:42', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223138223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31312d3130333434322d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31312031303a33343a3432223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31312d3130333434322d676d742d32223b733a31323a22656c656d656e745f64617461223b613a323a7b693a303b733a33333a22d094d0bed181d182d0b0d0b2d0bad0b020d0bad183d180d18cd0b5d180d0bed0bc223b693a313b733a35393a22d09ed0bfd0bbd0b0d182d0b020d0bfd0be20d181d187d0b5d182d18320d187d0b5d180d0b5d0b720d0bbd18ed0b1d0bed0b920d0b1d0b0d0bdd0ba223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3138223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3138264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233138202f20323031342d30372d31312031303a33343a34322028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31312031303a33343a3432223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(58, 'index.php?option=com_zoo&view=item&id=19', 'index.php?option=com_zoo&task=item&item_id=19&Itemid=107', 'Заказ #19 / 2014-07-11 10:44:40 (GMT 2)', '', '2014-07-11 13:44:41', '18ba21c8392b95a1f4b0071117edb06f', 1, 0, 1, '*', '2014-07-11 10:44:40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223139223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31312d3130343434302d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31312031303a34343a3430223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a303a7b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31312d3130343434302d676d742d32223b733a31323a22656c656d656e745f64617461223b613a303a7b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3139223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3139264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233139202f20323031342d30372d31312031303a34343a34302028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31312031303a34343a3430223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(62, 'index.php?option=com_zoo&view=item&id=21', 'index.php?option=com_zoo&task=item&item_id=21', 'Тамбов', '', '2014-07-14 11:09:32', '9fae4b239926b05217e27e68cddfc8bd', 1, 0, 1, '*', '2014-07-14 08:09:03', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223231223b733a353a22616c696173223b733a363a2274616d626f76223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31342030383a30393a3330223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a33353a22696e6465782e7068702f636f6d706f6e656e742f7a6f6f2f6974656d2f74616d626f76223b733a31323a22656c656d656e745f64617461223b613a323a7b693a303b733a32313a22313334313233340a31323334313233340a31323334223b693a313b733a31303a22d0b0d0b4d180d0b5d181223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d093d0bed180d0bed0b4223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d093d0bed180d0bed0b4223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3231223b733a353a22726f757465223b733a34353a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3231223b733a353a227469746c65223b733a31323a22d0a2d0b0d0bcd0b1d0bed0b2223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31342030383a30393a3033223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(63, 'index.php?option=com_zoo&view=item&id=22', 'index.php?option=com_zoo&task=item&item_id=22', 'город а', '', '2014-07-14 11:39:14', 'e197bc21bb781168c7a3030ff8249bbf', 1, 0, 1, '*', '2014-07-14 08:38:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223232223b733a353a22616c696173223b733a373a22676f726f642d61223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31342030383a33393a3132223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a33363a22696e6465782e7068702f636f6d706f6e656e742f7a6f6f2f6974656d2f676f726f642d61223b733a31323a22656c656d656e745f64617461223b613a323a7b693a303b733a32303a22d184d184d184d184d184d184d184d184d184d184223b693a313b733a32363a22d0b0d0b4d180d0b5d18120d0b3d0bed180d0bed0b4d0b020d0b0223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d093d0bed180d0bed0b4223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d093d0bed180d0bed0b4223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3232223b733a353a22726f757465223b733a34353a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3232223b733a353a227469746c65223b733a31333a22d0b3d0bed180d0bed0b420d0b0223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31342030383a33383a3431223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(64, 'index.php?option=com_zoo&view=item&id=23', 'index.php?option=com_zoo&task=item&item_id=23', 'Москва', '', '2014-07-14 13:29:08', '69fe998acc833c394d08a2151c6cd33c', 1, 0, 1, '*', '2014-07-14 10:28:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223233223b733a353a22616c696173223b733a363a226d6f736b7661223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31342031303a32393a3037223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a33353a22696e6465782e7068702f636f6d706f6e656e742f7a6f6f2f6974656d2f6d6f736b7661223b733a31323a22656c656d656e745f64617461223b613a323a7b693a303b733a32363a226669727473206e756d6265720a7365636f6e64206e756d626572223b693a313b733a31363a22d182d0b2d0b5d180d181d0bad0b0d18f223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d093d0bed180d0bed0b4223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d093d0bed180d0bed0b4223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3233223b733a353a22726f757465223b733a34353a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3233223b733a353a227469746c65223b733a31323a22d09cd0bed181d0bad0b2d0b0223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31342031303a32383a3233223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(65, 'index.php?option=com_zoo&view=item&id=24', 'index.php?option=com_zoo&task=item&item_id=24', 'Другой город', '', '2014-07-14 13:29:42', '473e4f9067eb7735c1118cb8c9ff9a16', 1, 0, 1, '*', '2014-07-14 10:29:15', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223234223b733a353a22616c696173223b733a31323a22647275676f6a2d676f726f64223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31342031303a32393a3430223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a34313a22696e6465782e7068702f636f6d706f6e656e742f7a6f6f2f6974656d2f647275676f6a2d676f726f64223b733a31323a22656c656d656e745f64617461223b613a323a7b693a303b733a31393a2235363334363533343536333436333633343635223b693a313b733a33303a22d0b2d18bd184d0b0d184d18bd0b2d0b0d18bd184d0b2d0b020d18bd18420223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d093d0bed180d0bed0b4223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d093d0bed180d0bed0b4223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3234223b733a353a22726f757465223b733a34353a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3234223b733a353a227469746c65223b733a32333a22d094d180d183d0b3d0bed0b920d0b3d0bed180d0bed0b4223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31342031303a32393a3135223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(67, 'index.php?option=com_zoo&view=item&id=25', 'index.php?option=com_zoo&task=item&item_id=25&Itemid=107', 'Заказ #25 / 2014-07-15 12:24:14 (GMT 2)', '', '2014-07-15 15:24:15', '4827c785385deebfe1933ea3d8f0688e', 1, 0, 1, '*', '2014-07-15 12:24:14', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223235223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31352d3132323431342d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31352031323a32343a3134223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a313a7b733a363a22726f626f7473223b733a31373a226e6f696e6465782c206e6f666f6c6c6f77223b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31352d3132323431342d676d742d32223b733a31323a22656c656d656e745f64617461223b613a343a7b693a303b733a31333a2231303a3030202d2031343a3030223b693a313b733a33393a22d0a1d0b0d0bcd0bed0b2d18bd0b2d0bed0b72028d0b1d0b5d181d0bfd0bbd0b0d182d0bdd0be29223b693a323b733a34363a22d09ed0bfd0bbd0b0d182d0b020d0b1d0b0d0bdd0bad0bed0b2d181d0bad0bed0b920d0bad0b0d180d182d0bed0b9223b693a333b733a31323a22d09cd0bed181d0bad0b2d0b0223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3235223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3235264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233235202f20323031342d30372d31352031323a32343a31342028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31352031323a32343a3134223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(69, 'index.php?option=com_zoo&view=item&id=26', 'index.php?option=com_zoo&task=item&item_id=26&Itemid=107', 'Заказ #26 / 2014-07-15 12:27:10 (GMT 2)', '', '2014-07-15 15:27:11', '821c8dad8dfea4f0884876c30febb9da', 1, 0, 1, '*', '2014-07-15 12:27:10', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223236223b733a353a22616c696173223b733a33323a227a616b617a2d69642d323031342d30372d31352d3132323731302d676d742d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d31352031323a32373a3130223b733a31313a226d6f6469666965645f6279223b733a313a2230223b733a31303a2273656172636861626c65223b733a313a2230223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a313a7b733a363a22726f626f7473223b733a31373a226e6f696e6465782c206e6f666f6c6c6f77223b7d7d733a31303a226d657461617574686f72223b4e3b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a36343a22696e6465782e706870323031342d30362d32372d30372d33332d32306974656d7a616b617a2d69642d323031342d30372d31352d3132323731302d676d742d32223b733a31323a22656c656d656e745f64617461223b613a343a7b693a303b733a31333a2231303a3030202d2031343a3030223b693a313b733a33393a22d0a1d0b0d0bcd0bed0b2d18bd0b2d0bed0b72028d0b1d0b5d181d0bfd0bbd0b0d182d0bdd0be29223b693a323b733a34363a22d09ed0bfd0bbd0b0d182d0b020d0b1d0b0d0bdd0bad0bed0b2d181d0bad0bed0b920d0bad0b0d180d182d0bed0b9223b693a333b733a31323a22d09cd0bed181d0bad0b2d0b0223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a313a7b733a343a2254797065223b613a313a7b733a31303a22d097d0b0d0bad0b0d0b7223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31303a22d097d0b0d0bad0b0d0b7223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3236223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3236264974656d69643d313037223b733a353a227469746c65223b733a34343a22d097d0b0d0bad0b0d0b720233236202f20323031342d30372d31352031323a32373a31302028474d54203229223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a303b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d31352031323a32373a3130223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d);
INSERT INTO `bzrnp_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(136, 'index.php?option=com_zoo&view=item&id=13', 'index.php?option=com_zoo&task=item&item_id=13&Itemid=149', 'Товар 4', '', '2014-07-24 12:21:14', '9efc1925498a029e43df2e6daf0a9617', 1, 1, 1, '*', '2014-07-09 10:05:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223133223b733a353a22616c696173223b733a373a22746f7661722d34223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342030393a32313a3132223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d34223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a31323a22d09cd0bed181d0bad0b2d0b0223b693a313b733a343a22d0b4d0b0223b693a323b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a333b733a323a223133223b693a343b733a343a22d188d182223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3133223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3133264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802034223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392031303a30353a3030223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(128, 'index.php?option=com_zoo&view=item&id=28', 'index.php?option=com_zoo&task=item&item_id=28&Itemid=149', 'Плитка Эвро2', '', '2014-07-24 08:35:40', '6417a63f1a649b84b9216c1c6cbf02cb', 1, 1, 1, '*', '2014-07-23 10:58:23', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223238223b733a353a22616c696173223b733a31323a22706c69746b612d6576726f32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342030353a33353a3339223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a3130313a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f706c69746b612d6576726f32223b733a31323a22656c656d656e745f64617461223b613a343a7b693a303b733a343a22d0b4d0b0223b693a313b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a323b733a323a223238223b693a333b733a333a22d0bc32223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3238223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3238264974656d69643d313439223b733a353a227469746c65223b733a32323a22d09fd0bbd0b8d182d0bad0b020d0add0b2d180d0be32223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32332031303a35383a3233223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(143, 'index.php?option=com_zoo&view=item&id=31', 'index.php?option=com_zoo&task=item&item_id=31&Itemid=149', 'Тестовый товар', '', '2014-07-24 14:44:42', '2978f9e9e95c98f4517f3515d5b76e5a', 1, 1, 1, '*', '2014-07-23 11:33:17', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223331223b733a353a22616c696173223b733a31343a22746573746f76796a2d746f766172223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342031313a34343a3430223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a3130333a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746573746f76796a2d746f766172223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a343a22d094d0b0223b693a313b733a313035363a224c6f72656d20497073756d202d20d186d0b520d182d0b5d0bad181d1822d22d180d0b8d0b1d0b0222c20d189d0be20d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d194d182d18cd181d18f20d0b220d0b4d180d183d0bad0b0d180d181d182d0b2d19620d182d0b020d0b4d0b8d0b7d0b0d0b9d0bdd1962e204c6f72656d20497073756d20d1942c20d184d0b0d0bad182d0b8d187d0bdd0be2c20d181d182d0b0d0bdd0b4d0b0d180d182d0bdd0bed18e2022d180d0b8d0b1d0bed18e2220d0b0d0b620d0b72058564920d181d182d0bed180d196d187d187d18f2c20d0bad0bed0bbd0b820d0bdd0b5d0b2d196d0b4d0bed0bcd0b8d0b920d0b4d180d183d0bad0b0d18020d0b2d0b7d18fd0b220d188d180d0b8d184d182d0bed0b2d18320d0b3d180d0b0d0bdd0bad18320d182d0b020d181d0bad0bbd0b0d0b220d0bdd0b020d0bdd196d0b920d0bfd196d0b4d0b1d196d180d0bad18320d0b7d180d0b0d0b7d0bad196d0b220d188d180d0b8d184d182d196d0b22e0d0a22d0a0d0b8d0b1d0b02220d0bdd0b520d182d196d0bbd18cd0bad0b820d183d181d0bfd196d188d0bdd0be20d0bfd0b5d180d0b5d0b6d0b8d0bbd0b020d0bf27d18fd182d18c20d181d182d0bed0bbd196d182d18c2c20d0b0d0bbd0b520d0b920d0bfd180d0b8d0b6d0b8d0bbd0b0d181d18f20d0b220d0b5d0bbd0b5d0bad182d180d0bed0bdd0bdd0bed0bcd18320d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd1962c20d0b7d0b0d0bbd0b8d188d0b0d18ed187d0b8d181d18c20d0bfd0be20d181d183d182d19620d0bdd0b5d0b7d0bcd196d0bdd0bdd0bed18e2e0d0ad092d0bed0bdd0b020d0bfd0bed0bfd183d0bbd18fd180d0b8d0b7d183d0b2d0b0d0bbd0b0d181d18c20d0b22036302dd0b8d18520d180d0bed0bad0b0d18520d0bcd0b8d0bdd183d0bbd0bed0b3d0be20d181d182d0bed180d196d187d187d18f20d0b7d0b0d0b2d0b4d18fd0bad0b820d0b2d0b8d0b4d0b0d0bdd0bdd18e20d0b7d180d0b0d0b7d0bad196d0b220d188d180d0b8d184d182d196d0b2204c657472617365742c20d18fd0bad19620d0bcd196d181d182d0b8d0bbd0b820d183d180d0b8d0b2d0bad0b820d0b7204c6f72656d20497073756d2c20d19620d0b2d0b4d180d183d0b3d0b5202d20d0bdd0b5d189d0bed0b4d0b0d0b2d0bdd0be20d0b7d0b0d0b2d0b4d18fd0bad0b820d0bfd180d0bed0b3d180d0b0d0bcd0b0d0bc20d0bad0bed0bcd0bf27d18ed182d0b5d180d0bdd0bed0b3d0be20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d0bdd0b020d0bad188d182d0b0d0bbd18220416c64757320506167656d616b65722c20d18fd0bad19620d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d0b2d0b0d0bbd0b820d180d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d2e223b693a323b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a333b733a323a223331223b693a343b733a313a2234223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3331223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3331264974656d69643d313439223b733a353a227469746c65223b733a32373a22d0a2d0b5d181d182d0bed0b2d18bd0b920d182d0bed0b2d0b0d180223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32332031313a33333a3137223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(144, 'index.php?option=com_zoo&view=item&id=29', 'index.php?option=com_zoo&task=item&item_id=29&Itemid=149', 'Пинопласт Росия2', '', '2014-07-24 14:45:53', 'd6e4bb0d58a717e0844afd2fe9329ecb', 1, 1, 1, '*', '2014-07-23 11:04:02', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223239223b733a353a22616c696173223b733a31373a2270696e6f706c6173742d726f7369796132223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342031313a34353a3531223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a3130363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f70696e6f706c6173742d726f7369796132223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a343a22d094d0b0223b693a313b733a3438353a22d186d0b520d182d0b5d0bad181d1822d22d180d0b8d0b1d0b0222c20d189d0be20d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d194d182d18cd181d18f20d0b220d0b4d180d183d0bad0b0d180d181d182d0b2d19620d182d0b020d0b4d0b8d0b7d0b0d0b9d0bdd1962e204c6f72656d20497073756d20d1942c20d184d0b0d0bad182d0b8d187d0bdd0be2c20d181d182d0b0d0bdd0b4d0b0d180d182d0bdd0bed18e2022d180d0b8d0b1d0bed18e2220d0b0d0b620d0b72058564920d181d182d0bed180d196d187d187d18f2c20d0bad0bed0bbd0b820d0bdd0b5d0b2d196d0b4d0bed0bcd0b8d0b920d0b4d180d183d0bad0b0d18020d0b2d0b7d18fd0b220d188d180d0b8d184d182d0bed0b2d18320d0b3d180d0b0d0bdd0bad18320d182d0b020d181d0bad0bbd0b0d0b220d0bdd0b020d0bdd196d0b920d0bfd196d0b4d0b1d196d180d0bad18320d0b7d180d0b0d0b7d0bad196d0b220d188d180d0b8d184d182d196d0b22e2022d0a0d0b8d0b1d0b02220d0bdd0b520d182d196d0bbd18cd0bad0b820d183d181d0bfd196d188d0bdd0be20d0bfd0b5d180d0b5d0b6d0b8d0bbd0b020d0bf27d18fd182d18c20d181d182d0bed0bbd196d182d18c2c20d0b0d0bbd0b520d0b920d0bfd180d0b8d0b6d0b8d0bbd0b0d181d18f20d0b2223b693a323b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a333b733a323a223239223b693a343b733a323a22d0bc223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3239223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3239264974656d69643d313439223b733a353a227469746c65223b733a33303a22d09fd0b8d0bdd0bed0bfd0bbd0b0d181d18220d0a0d0bed181d0b8d18f32223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32332031313a30343a3032223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(134, 'index.php?option=com_zoo&view=item&id=30', 'index.php?option=com_zoo&task=item&item_id=30&Itemid=149', 'Плинтус Греция', '', '2014-07-24 10:33:46', '908158fc4bb66989966aca39da8ae4f6', 1, 1, 1, '*', '2014-07-23 11:10:48', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223330223b733a353a22616c696173223b733a31353a22706c696e7475732d67726563697961223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342030373a33333a3433223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a3130343a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f706c696e7475732d67726563697961223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a313035363a22d092d0b6d0b520d0b4d0b0d0b2d0bdd0be20d0b2d196d0b4d0bed0bcd0be2c20d189d0be20d187d0b8d182d0b0d0b1d0b5d0bbd18cd0bdd0b8d0b920d0b7d0bcd196d181d18220d0b1d183d0b4d0b520d0b7d0b0d0b2d0b0d0b6d0b0d182d0b820d0b7d0bed181d0b5d180d0b5d0b4d0b8d182d0b8d181d18c20d0bbd18ed0b4d0b8d0bdd1962c20d18fd0bad0b020d0bed186d196d0bdd18ed19420d0bad0bed0bcd0bfd0bed0b7d0b8d186d196d18e20d181d182d0bed180d196d0bdd0bad0b82e20d0a1d0b5d0bdd18120d0b2d0b8d0bad0bed180d0b8d181d182d0b0d0bdd0bdd18f204c6f72656d20497073756d20d0bfd0bed0bbd18fd0b3d0b0d19420d0b220d182d0bed0bcd1832c20d189d0be20d186d0b5d0b920d182d0b5d0bad181d18220d0bcd0b0d19420d0b1d196d0bbd18cd1882dd0bcd0b5d0bdd18820d0bdd0bed180d0bcd0b0d0bbd18cd0bdd0b520d180d0bed0b7d0bfd0bed0b4d196d0bbd0b5d0bdd0bdd18f20d0bbd196d182d0b5d18020d0bdd0b020d0b2d196d0b4d0bcd196d0bdd18320d0b2d196d0b42c20d0bdd0b0d0bfd180d0b8d0bad0bbd0b0d0b42c2022d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e20d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e2220d0a6d0b520d180d0bed0b1d0b8d182d18c20d182d0b5d0bad181d18220d181d185d0bed0b6d0b8d0bc20d0bdd0b020d0bed0bfd0bed0b2d196d0b4d0bdd0b8d0b92e20d091d0b0d0b3d0b0d182d0be20d0bfd180d0bed0b3d180d0b0d0bc20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d182d0b020d0b2d0b5d0b12dd0b4d0b8d0b7d0b0d0b9d0bdd18320d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d18ed182d18c204c6f72656d20497073756d20d18fd0ba20d0b7d180d0b0d0b7d0bed0ba20d19620d0bfd0bed188d183d0ba20d0b7d0b020d182d0b5d180d0bcd196d0bdd0bed0bc20226c6f72656d20697073756d2220d0b2d196d0b4d0bad180d0b8d19420d0b1d0b0d0b3d0b0d182d0be20d0b2d0b5d0b12dd181d0b0d0b9d182d196d0b22c20d18fd0bad19620d0b7d0bdd0b0d185d0bed0b4d18fd182d18cd181d18f20d189d0b520d0b220d0b7d0b0d180d0bed0b4d0bad0bed0b2d0bed0bcd18320d181d182d0b0d0bdd1962e20d0a0d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d20d0b727d18fd0b2d0b8d0bbd0b8d181d18c20d0b7d0b020d0bcd0b8d0bdd183d0bbd19620d180d0bed0bad0b82c20d0b4d0b5d18fd0bad19620d0b2d0b8d0bfd0b0d0b4d0bad0bed0b2d0be2c20d0b4d0b5d18fd0bad19620d0b1d183d0bbd0be20d181d182d0b2d0bed180d0b5d0bdd0be20d0b7d183d0bcd0b8d181d0bdd0be2028d0b7d0bed0bad180d0b5d0bcd0b02c20d0b6d0b0d180d182d196d0b2d0bbd0b8d0b2d196292e223b693a313b733a343a22d0b4d0b0223b693a323b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a333b733a323a223330223b693a343b733a323a22d0bc223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3330223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3330264974656d69643d313439223b733a353a227469746c65223b733a32373a22d09fd0bbd0b8d0bdd182d183d18120d093d180d0b5d186d0b8d18f223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32332031313a31303a3438223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(135, 'index.php?option=com_zoo&view=item&id=32', 'index.php?option=com_zoo&task=item&item_id=32&Itemid=149', 'Труба водосточная Италия', '', '2014-07-24 11:59:14', '36fe9dd338b27d31651994082b7c357f', 1, 1, 1, '*', '2014-07-23 12:03:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223332223b733a353a22616c696173223b733a32373a2274727562612d766f646f73746f63686e6179612d6974616c697961223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342030383a35393a3132223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a3131363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f74727562612d766f646f73746f63686e6179612d6974616c697961223b733a31323a22656c656d656e745f64617461223b613a353a7b693a303b733a343a22d094d0b0223b693a313b733a343233303a22d092d0b6d0b520d0b4d0b0d0b2d0bdd0be20d0b2d196d0b4d0bed0bcd0be2c20d189d0be20d187d0b8d182d0b0d0b1d0b5d0bbd18cd0bdd0b8d0b920d0b7d0bcd196d181d18220d0b1d183d0b4d0b520d0b7d0b0d0b2d0b0d0b6d0b0d182d0b820d0b7d0bed181d0b5d180d0b5d0b4d0b8d182d0b8d181d18c20d0bbd18ed0b4d0b8d0bdd1962c20d18fd0bad0b020d0bed186d196d0bdd18ed19420d0bad0bed0bcd0bfd0bed0b7d0b8d186d196d18e20d181d182d0bed180d196d0bdd0bad0b82e20d0a1d0b5d0bdd18120d0b2d0b8d0bad0bed180d0b8d181d182d0b0d0bdd0bdd18f204c6f72656d20497073756d20d0bfd0bed0bbd18fd0b3d0b0d19420d0b220d182d0bed0bcd1832c20d189d0be20d186d0b5d0b920d182d0b5d0bad181d18220d0bcd0b0d19420d0b1d196d0bbd18cd1882dd0bcd0b5d0bdd18820d0bdd0bed180d0bcd0b0d0bbd18cd0bdd0b520d180d0bed0b7d0bfd0bed0b4d196d0bbd0b5d0bdd0bdd18f20d0bbd196d182d0b5d18020d0bdd0b020d0b2d196d0b4d0bcd196d0bdd18320d0b2d196d0b42c20d0bdd0b0d0bfd180d0b8d0bad0bbd0b0d0b42c2022d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e20d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e220d0ad0a6d0b520d180d0bed0b1d0b8d182d18c20d182d0b5d0bad181d18220d181d185d0bed0b6d0b8d0bc20d0bdd0b020d0bed0bfd0bed0b2d196d0b4d0bdd0b8d0b92e20d091d0b0d0b3d0b0d182d0be20d0bfd180d0bed0b3d180d0b0d0bc20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d182d0b020d0b2d0b5d0b12dd0b4d0b8d0b7d0b0d0b9d0bdd18320d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d18ed182d18c204c6f72656d20497073756d20d18fd0ba20d0b7d180d0b0d0b7d0bed0ba20d19620d0bfd0bed188d183d0ba20d0b7d0b020d182d0b5d180d0bcd196d0bdd0bed0bc20226c6f72656d20697073756d2220d0b2d196d0b4d0bad180d0b8d19420d0b1d0b0d0b3d0b0d182d0be20d0b2d0b5d0b12dd181d0b0d0b9d182d196d0b22c20d18fd0bad19620d0b7d0bdd0b0d185d0bed0b4d18fd182d18cd181d18f20d189d0b520d0b220d0b7d0b0d180d0bed0b4d0bad0bed0b2d0bed0bcd18320d181d182d0b0d0bdd1962e20d0a0d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d20d0b727d18fd0b2d0b8d0bbd0b8d181d18c20d0b7d0b020d0bcd0b8d0bdd183d0bbd19620d180d0bed0bad0b82c20d0b4d0b5d18fd0bad19620d0b2d0b8d0bfd0b0d0b4d0bad0bed0b2d0be2c20d0b4d0b5d18fd0bad19620d0b1d183d0bbd0be20d181d182d0b2d0bed180d0b5d0bdd0be20d0b7d183d0bcd0b8d181d0bdd0be2028d0b7d0bed0bad180d0b5d0bcd0b02c20d0b6d0b0d180d182d196d0b2d0bbd0b8d0b2d196292e20d092d0b6d0b520d0b4d0b0d0b2d0bdd0be20d0b2d196d0b4d0bed0bcd0be2c20d189d0be20d187d0b8d182d0b0d0b1d0b5d0bbd18cd0bdd0b8d0b920d0b7d0bcd196d181d18220d0b1d183d0b4d0b520d0b7d0b0d0b2d0b0d0b6d0b0d182d0b820d0b7d0bed181d0b5d180d0b5d0b4d0b8d182d0b8d181d18c20d0bbd18ed0b4d0b8d0bdd1962c20d18fd0bad0b020d0bed186d196d0bdd18ed19420d0bad0bed0bcd0bfd0bed0b7d0b8d186d196d18e20d181d182d0bed180d196d0bdd0bad0b82e20d0a1d0b5d0bdd18120d0b2d0b8d0bad0bed180d0b8d181d182d0b0d0bdd0bdd18f204c6f72656d20497073756d20d0bfd0bed0bbd18fd0b3d0b0d19420d0b220d182d0bed0bcd1832c20d189d0be20d186d0b5d0b920d182d0b5d0bad181d18220d0bcd0b0d19420d0b1d196d0bbd18cd1882dd0bcd0b5d0bdd18820d0bdd0bed180d0bcd0b0d0bbd18cd0bdd0b520d180d0bed0b7d0bfd0bed0b4d196d0bbd0b5d0bdd0bdd18f20d0bbd196d182d0b5d18020d0bdd0b020d0b2d196d0b4d0bcd196d0bdd18320d0b2d196d0b42c20d0bdd0b0d0bfd180d0b8d0bad0bbd0b0d0b42c2022d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e20d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e2220d0a6d0b520d180d0bed0b1d0b8d182d18c20d182d0b5d0bad181d18220d181d185d0bed0b6d0b8d0bc20d0bdd0b020d0bed0bfd0bed0b2d196d0b4d0bdd0b8d0b92e20d091d0b0d0b3d0b0d182d0be20d0bfd180d0bed0b3d180d0b0d0bc20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d182d0b020d0b2d0b5d0b12dd0b4d0b8d0b7d0b0d0b9d0bdd18320d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d18ed182d18c204c6f72656d20497073756d20d18fd0ba20d0b7d180d0b0d0b7d0bed0ba20d19620d0bfd0bed188d183d0ba20d0b7d0b020d182d0b5d180d0bcd196d0bdd0bed0bc20226c6f72656d20697073756d2220d0b2d196d0b4d0bad180d0b8d19420d0b1d0b0d0b3d0b0d182d0be20d0b2d0b5d0b12dd181d0b0d0b9d182d196d0b22c20d18fd0bad19620d0b7d0bdd0b0d185d0bed0b4d18fd182d18cd181d18f20d189d0b520d0b220d0b7d0b0d180d0bed0b4d0bad0bed0b2d0bed0bcd18320d181d182d0b0d0bdd1962e20d0a0d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d20d0b727d18fd0b2d0b8d0bbd0b8d181d18c20d0b7d0b020d0bcd0b8d0bdd183d0bbd19620d180d0bed0bad0b82c20d0b4d0b5d18fd0bad19620d0b2d0b8d0bfd0b0d0b4d0bad0bed0b2d0be2c20d0b4d0b5d18fd0bad19620d0b1d183d0bbd0be20d181d182d0b2d0bed180d0b5d0bdd0be20d0b7d183d0bcd0b8d181d0bdd0be2028d0b7d0bed0bad180d0b5d0bcd0b02c20d0b6d0b0d180d182d196d0b2d0bbd0b8d0b2d196292e20d092d0b6d0b520d0b4d0b0d0b2d0bdd0be20d0b2d196d0b4d0bed0bcd0be2c20d189d0be20d187d0b8d182d0b0d0b1d0b5d0bbd18cd0bdd0b8d0b920d0b7d0bcd196d181d18220d0b1d183d0b4d0b520d0b7d0b0d0b2d0b0d0b6d0b0d182d0b820d0b7d0bed181d0b5d180d0b5d0b4d0b8d182d0b8d181d18c20d0bbd18ed0b4d0b8d0bdd1962c20d18fd0bad0b020d0bed186d196d0bdd18ed19420d0bad0bed0bcd0bfd0bed0b7d0b8d186d196d18e20d181d182d0bed180d196d0bdd0bad0b82e20d0a1d0b5d0bdd18120d0b2d0b8d0bad0bed180d0b8d181d182d0b0d0bdd0bdd18f204c6f72656d20497073756d20d0bfd0bed0bbd18fd0b3d0b0d19420d0b220d182d0bed0bcd1832c20d189d0be20d186d0b5d0b920d182d0b5d0bad181d18220d0bcd0b0d19420d0b1d196d0bbd18cd1882dd0bcd0b5d0bdd18820d0bdd0bed180d0bcd0b0d0bbd18cd0bdd0b520d180d0bed0b7d0bfd0bed0b4d196d0bbd0b5d0bdd0bdd18f20d0bbd196d182d0b5d18020d0bdd0b020d0b2d196d0b4d0bcd196d0bdd18320d0b2d196d0b42c20d0bdd0b0d0bfd180d0b8d0bad0bbd0b0d0b42c2022d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e20d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e2220d0a6d0b520d180d0bed0b1d0b8d182d18c20d182d0b5d0bad181d18220d181d185d0bed0b6d0b8d0bc20d0bdd0b020d0bed0bfd0bed0b2d196d0b4d0bdd0b8d0b92e20d091d0b0d0b3d0b0d182d0be20d0bfd180d0bed0b3d180d0b0d0bc20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d182d0b020d0b2d0b5d0b12dd0b4d0b8d0b7d0b0d0b9d0bdd18320d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d18ed182d18c204c6f72656d20497073756d20d18fd0ba20d0b7d180d0b0d0b7d0bed0ba20d19620d0bfd0bed188d183d0ba20d0b7d0b020d182d0b5d180d0bcd196d0bdd0bed0bc20226c6f72656d20697073756d2220d0b2d196d0b4d0bad180d0b8d19420d0b1d0b0d0b3d0b0d182d0be20d0b2d0b5d0b12dd181d0b0d0b9d182d196d0b22c20d18fd0bad19620d0b7d0bdd0b0d185d0bed0b4d18fd182d18cd181d18f20d189d0b520d0b220d0b7d0b0d180d0bed0b4d0bad0bed0b2d0bed0bcd18320d181d182d0b0d0bdd1962e20d0a0d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d20d0b727d18fd0b2d0b8d0bbd0b8d181d18c20d0b7d0b020d0bcd0b8d0bdd183d0bbd19620d180d0bed0bad0b82c20d0b4d0b5d18fd0bad19620d0b2d0b8d0bfd0b0d0b4d0bad0bed0b2d0be2c20d0b4d0b5d18fd0bad19620d0b1d183d0bbd0be20d181d182d0b2d0bed180d0b5d0bdd0be20d0b7d183d0bcd0b8d181d0bdd0be2028d0b7d0bed0bad180d0b5d0bcd0b02c20d0b6d0b0d180d182d196d0b2d0bbd0b8d0b2d196292e0d0ad092d0b6d0b520d0b4d0b0d0b2d0bdd0be20d0b2d196d0b4d0bed0bcd0be2c20d189d0be20d187d0b8d182d0b0d0b1d0b5d0bbd18cd0bdd0b8d0b920d0b7d0bcd196d181d18220d0b1d183d0b4d0b520d0b7d0b0d0b2d0b0d0b6d0b0d182d0b820d0b7d0bed181d0b5d180d0b5d0b4d0b8d182d0b8d181d18c20d0bbd18ed0b4d0b8d0bdd1962c20d18fd0bad0b020d0bed186d196d0bdd18ed19420d0bad0bed0bcd0bfd0bed0b7d0b8d186d196d18e20d181d182d0bed180d196d0bdd0bad0b82e20d0a1d0b5d0bdd18120d0b2d0b8d0bad0bed180d0b8d181d182d0b0d0bdd0bdd18f204c6f72656d20497073756d20d0bfd0bed0bbd18fd0b3d0b0d19420d0b220d182d0bed0bcd1832c20d189d0be20d186d0b5d0b920d182d0b5d0bad181d18220d0bcd0b0d19420d0b1d196d0bbd18cd1882dd0bcd0b5d0bdd18820d0bdd0bed180d0bcd0b0d0bbd18cd0bdd0b520d180d0bed0b7d0bfd0bed0b4d196d0bbd0b5d0bdd0bdd18f20d0bbd196d182d0b5d18020d0bdd0b020d0b2d196d0b4d0bcd196d0bdd18320d0b2d196d0b42c20d0bdd0b0d0bfd180d0b8d0bad0bbd0b0d0b42c2022d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e20d0a2d183d18220d196d0b4d0b520d182d0b5d0bad181d1822e220d0ad0a6d0b520d180d0bed0b1d0b8d182d18c20d182d0b5d0bad181d18220d181d185d0bed0b6d0b8d0bc20d0bdd0b020d0bed0bfd0bed0b2d196d0b4d0bdd0b8d0b92e20d091d0b0d0b3d0b0d182d0be20d0bfd180d0bed0b3d180d0b0d0bc20d0b2d0b5d180d181d182d183d0b2d0b0d0bdd0bdd18f20d182d0b020d0b2d0b5d0b12dd0b4d0b8d0b7d0b0d0b9d0bdd18320d0b2d0b8d0bad0bed180d0b8d181d182d0bed0b2d183d18ed182d18c204c6f72656d20497073756d20d18fd0ba20d0b7d180d0b0d0b7d0bed0ba20d19620d0bfd0bed188d183d0ba20d0b7d0b020d182d0b5d180d0bcd196d0bdd0bed0bc20226c6f72656d20697073756d2220d0b2d196d0b4d0bad180d0b8d19420d0b1d0b0d0b3d0b0d182d0be20d0b2d0b5d0b12dd181d0b0d0b9d182d196d0b22c20d18fd0bad19620d0b7d0bdd0b0d185d0bed0b4d18fd182d18cd181d18f20d189d0b520d0b220d0b7d0b0d180d0bed0b4d0bad0bed0b2d0bed0bcd18320d181d182d0b0d0bdd1962e20d0a0d196d0b7d0bdd19620d0b2d0b5d180d181d196d197204c6f72656d20497073756d20d0b727d18fd0b2d0b8d0bbd0b8d181d18c20d0b7d0b020d0bcd0b8d0bdd183d0bbd19620d180d0bed0bad0b82c20d0b4d0b5d18fd0bad19620d0b2d0b8d0bfd0b0d0b4d0bad0bed0b2d0be2c20d0b4d0b5d18fd0bad19620d0b1d183d0bbd0be20d181d182d0b2d0bed180d0b5d0bdd0be20d0b7d183d0bcd0b8d181d0bdd0be2028d0b7d0bed0bad180d0b5d0bcd0b02c20d0b6d0b0d180d182d196d0b2d0bbd0b8d0b2d196292e223b693a323b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a333b733a323a223332223b693a343b733a323a22d0bc223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3332223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3332264974656d69643d313439223b733a353a227469746c65223b733a34363a22d0a2d180d183d0b1d0b020d0b2d0bed0b4d0bed181d182d0bed187d0bdd0b0d18f20d098d182d0b0d0bbd0b8d18f223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d32332031323a30333a3230223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d),
(146, 'index.php?option=com_zoo&view=item&id=11', 'index.php?option=com_zoo&task=item&item_id=11&Itemid=149', 'Товар 2', '', '2014-07-24 15:45:16', '4a74c9fdb1caf8876936426735b03707', 1, 1, 1, '*', '2014-07-09 09:57:25', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 1, 0x4f3a31393a2246696e646572496e6465786572526573756c74223a31383a7b733a31313a22002a00656c656d656e7473223b613a31323a7b733a323a226964223b733a323a223131223b733a353a22616c696173223b733a373a22746f7661722d32223b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323031342d30372d32342031323a34353a3134223b733a31313a226d6f6469666965645f6279223b733a323a223432223b733a31303a2273656172636861626c65223b733a313a2231223b733a363a226c61796f7574223b733a343a226974656d223b733a383a226d65746164617461223b4f3a393a224a5265676973747279223a313a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a353a7b733a353a227469746c65223b733a303a22223b733a31313a226465736372697074696f6e223b733a303a22223b733a383a226b6579776f726473223b733a303a22223b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b7d7d733a31303a226d657461617574686f72223b733a303a22223b733a373a2273756d6d617279223b733a303a22223b733a343a2270617468223b733a39363a22696e6465782e7068702f323031342d30362d32372d30372d33332d32302f6b726f76656c6e79652d656c656d656e74792f6b726f76656c6e796a2d69737472756d656e742d692d6f626f7275646f76616e69652f6974656d2f746f7661722d32223b733a31323a22656c656d656e745f64617461223b613a343a7b693a303b733a343a22d094d0b0223b693a313b733a31373a220a5f5f494d4147455f4558495354535f5f223b693a323b733a323a223131223b693a333b733a333a22d0bc32223b7d7d733a31353a22002a00696e737472756374696f6e73223b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a31303a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b693a383b733a31363a22637265617465645f62795f616c696173223b693a393b733a31323a22656c656d656e745f64617461223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d733a31313a22002a007461786f6e6f6d79223b613a323a7b733a343a2254797065223b613a313a7b733a31343a22d09fd180d0bed0b4d183d0bad182223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a31343a22d09fd180d0bed0b4d183d0bad182223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d733a383a2243617465676f7279223b613a313a7b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b4f3a373a224a4f626a656374223a343a7b733a31303a22002a005f6572726f7273223b613a303a7b7d733a353a227469746c65223b733a36373a22d09ad180d0bed0b2d0b5d0bbd18cd0bdd18bd0b920d0b8d181d182d180d183d0bcd0b5d0bdd18220d0b820d0bed0b1d0bed180d183d0b4d0bed0b2d0b0d0bdd0b8d0b5223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b7d7d7d733a333a2275726c223b733a34303a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f26766965773d6974656d2669643d3131223b733a353a22726f757465223b733a35363a22696e6465782e7068703f6f7074696f6e3d636f6d5f7a6f6f267461736b3d6974656d266974656d5f69643d3131264974656d69643d313439223b733a353a227469746c65223b733a31323a22d0a2d0bed0b2d0b0d1802032223b733a31313a226465736372697074696f6e223b733a303a22223b733a393a227075626c6973686564223b4e3b733a353a227374617465223b623a313b733a363a22616363657373223b733a313a2231223b733a383a226c616e6775616765223b733a313a222a223b733a31383a227075626c6973685f73746172745f64617465223b733a31393a22323031342d30372d30392030393a35373a3235223b733a31363a227075626c6973685f656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a2273746172745f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a383a22656e645f64617465223b733a31393a22303030302d30302d30302030303a30303a3030223b733a31303a226c6973745f7072696365223b4e3b733a31303a2273616c655f7072696365223b4e3b733a373a22747970655f6964223b693a313b7d);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_terms0`
--

INSERT INTO `bzrnp_finder_links_terms0` (`link_id`, `term_id`, `weight`) VALUES
(56, 973, 0.39996),
(56, 974, 1.64004),
(56, 975, 1.83996),
(63, 1049, 0.1334),
(64, 1067, 0.48),
(64, 1068, 1.71996),
(134, 2406, 0.87996),
(134, 2407, 1.88004),
(134, 2408, 2.07996),
(135, 2406, 3.51984),
(135, 2407, 7.52016),
(135, 2408, 8.31984),
(143, 3500, 0.39996),
(143, 3501, 1.8),
(143, 3502, 1.95996);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_terms1`
--

INSERT INTO `bzrnp_finder_links_terms1` (`link_id`, `term_id`, `weight`) VALUES
(56, 963, 0.39996),
(56, 964, 1.59996),
(79, 1249, 0.56661),
(134, 2316, 0.39996),
(134, 2317, 1.52004),
(134, 2318, 1.83996),
(134, 2319, 0.48),
(134, 2320, 1.59996),
(134, 2321, 1.88004),
(135, 2316, 1.59984),
(135, 2317, 6.08016),
(135, 2318, 7.35984),
(135, 2319, 1.92),
(135, 2320, 6.39984),
(135, 2321, 7.52016),
(143, 3497, 0.39996),
(143, 3498, 1.64004),
(143, 3499, 2.00004);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_terms2`
--

INSERT INTO `bzrnp_finder_links_terms2` (`link_id`, `term_id`, `weight`) VALUES
(50, 804, 0.15996),
(56, 958, 0.63996),
(56, 959, 1.88004),
(63, 1058, 0.80004),
(65, 1077, 0.68),
(65, 1078, 2.38),
(79, 1248, 0.9334),
(128, 804, 0.15996),
(134, 804, 0.15996),
(134, 1611, 1.59984),
(134, 1612, 6.56016),
(134, 2205, 1.95996),
(134, 2206, 2.04),
(134, 2207, 1.95996),
(134, 2208, 1.76004),
(134, 2273, 0.39996),
(134, 2274, 1.68),
(134, 2275, 1.8),
(134, 2276, 0.79992),
(134, 2277, 1.59996),
(134, 2278, 1.95996),
(134, 2279, 1.8),
(134, 2280, 2.04),
(135, 804, 0.15996),
(135, 1611, 6.39936),
(135, 1612, 26.2406),
(135, 2205, 7.83984),
(135, 2206, 8.16),
(135, 2207, 7.83984),
(135, 2208, 7.04016),
(135, 2273, 1.59984),
(135, 2274, 6.72),
(135, 2275, 7.2),
(135, 2276, 3.19968),
(135, 2277, 6.39984),
(135, 2278, 5.87988),
(135, 2279, 7.2),
(135, 2280, 8.16),
(136, 804, 0.15996),
(143, 804, 0.15996),
(143, 1611, 1.59984),
(143, 1612, 6.56016),
(143, 2565, 1.71996),
(143, 2592, 0.56004),
(143, 2593, 1.71996),
(143, 2594, 1.95996),
(143, 2595, 0.48),
(143, 2596, 1.64004),
(143, 2597, 2.00004),
(143, 2598, 0.80004),
(143, 2599, 1.71996),
(143, 2600, 2.04),
(143, 2667, 0.56004),
(143, 2668, 1.83996),
(143, 2669, 2.07996),
(143, 2670, 0.63996),
(143, 2671, 2.00004),
(143, 2672, 2.24004),
(143, 3507, 0.63996),
(143, 3508, 1.68),
(143, 3509, 2.00004),
(143, 3510, 1.71996),
(143, 3511, 1.76004),
(143, 3593, 0.48),
(143, 3594, 1.52004),
(143, 3595, 1.76004),
(144, 804, 0.15996),
(144, 1611, 0.39996),
(144, 1612, 1.64004),
(144, 2565, 1.71996),
(144, 2592, 0.56004),
(144, 2593, 1.71996),
(144, 2594, 1.95996),
(144, 2595, 0.48),
(144, 2596, 1.64004),
(144, 2597, 2.00004),
(144, 2598, 0.80004),
(144, 2599, 1.71996),
(144, 2600, 2.04),
(144, 2667, 0.56004),
(144, 2668, 1.83996),
(144, 2669, 2.07996),
(144, 2670, 0.63996),
(144, 2671, 2.00004),
(144, 2672, 2.24004),
(146, 804, 0.15996);

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
(54, 894, 0.80004),
(54, 895, 1.88004),
(56, 957, 0.32004),
(67, 894, 0.80004),
(67, 895, 1.88004),
(67, 1139, 0.72),
(69, 894, 0.80004),
(69, 895, 1.88004),
(69, 1139, 0.72),
(128, 615, 0.08004),
(128, 616, 1.76004),
(128, 617, 0.72),
(128, 618, 1.64004),
(128, 619, 2.16),
(134, 615, 0.08004),
(134, 616, 1.76004),
(134, 617, 0.72),
(134, 618, 1.64004),
(134, 619, 2.16),
(134, 1726, 0.15996),
(134, 2218, 0.80004),
(134, 2219, 2.00004),
(134, 2220, 2.4),
(134, 2221, 0.96),
(134, 2222, 1.88004),
(134, 2223, 2.04),
(134, 2224, 1.76004),
(134, 2225, 2.24004),
(134, 2226, 0.32004),
(134, 2227, 1.71996),
(134, 2228, 2.24004),
(134, 2229, 0.32004),
(134, 2230, 1.71996),
(134, 2231, 2.04),
(134, 2401, 1.56),
(134, 2402, 1.8),
(134, 2403, 0.24),
(134, 2404, 1.56),
(134, 2405, 1.71996),
(135, 615, 0.08004),
(135, 616, 1.76004),
(135, 617, 0.72),
(135, 618, 1.64004),
(135, 619, 2.16),
(135, 1726, 0.63984),
(135, 2218, 3.20016),
(135, 2219, 8.00016),
(135, 2220, 9.6),
(135, 2221, 3.84),
(135, 2222, 7.52016),
(135, 2223, 8.16),
(135, 2224, 7.04016),
(135, 2225, 8.96016),
(135, 2226, 1.28016),
(135, 2227, 6.87984),
(135, 2228, 8.96016),
(135, 2229, 1.28016),
(135, 2230, 5.15988),
(135, 2231, 6.12),
(135, 2401, 6.24),
(135, 2402, 7.2),
(135, 2403, 0.96),
(135, 2404, 6.24),
(135, 2405, 6.87984),
(135, 2851, 0.68),
(136, 615, 0.08004),
(136, 616, 1.76004),
(136, 617, 0.72),
(136, 618, 1.64004),
(136, 619, 2.16),
(143, 615, 0.08004),
(143, 616, 1.76004),
(143, 617, 0.72),
(143, 618, 1.64004),
(143, 619, 2.16),
(143, 1726, 0.15996),
(143, 2673, 1.52004),
(143, 2674, 1.71996),
(144, 615, 0.08004),
(144, 616, 1.76004),
(144, 617, 0.72),
(144, 618, 1.64004),
(144, 619, 2.16),
(144, 1726, 0.15996),
(144, 2673, 1.52004),
(144, 2674, 1.71996),
(144, 3605, 0.9334),
(146, 615, 0.08004),
(146, 616, 1.76004),
(146, 617, 0.72),
(146, 618, 1.64004),
(146, 619, 2.16),
(147, 615, 0.08004),
(147, 616, 1.76004),
(147, 617, 0.72),
(147, 618, 1.64004),
(147, 619, 2.16),
(147, 3615, 0.56004);

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
(54, 898, 0.48),
(56, 962, 0.63996),
(62, 1047, 0.68),
(64, 1070, 0.63996),
(67, 898, 0.48),
(69, 898, 0.48),
(79, 1251, 0.80004),
(79, 1252, 1.92),
(128, 620, 0.80004),
(128, 621, 2.00004),
(128, 622, 2.07996),
(134, 620, 0.80004),
(134, 621, 2.00004),
(134, 622, 2.07996),
(134, 1712, 0.15996),
(134, 1717, 1.59984),
(134, 2313, 0.80004),
(134, 2314, 1.95996),
(134, 2315, 2.16),
(134, 2382, 1.76004),
(134, 2383, 2.36004),
(134, 2384, 1.56),
(134, 2385, 2.00004),
(134, 2386, 1.68),
(134, 2387, 1.8),
(134, 2388, 1.56),
(134, 2389, 1.71996),
(134, 2390, 1.52004),
(134, 2391, 1.8),
(134, 2392, 0.63996),
(134, 2393, 1.76004),
(134, 2394, 2.00004),
(134, 2395, 0.32004),
(134, 2396, 1.47996),
(134, 2397, 1.64004),
(134, 2398, 0.48),
(134, 2399, 2.95992),
(134, 2400, 3.43992),
(135, 620, 0.80004),
(135, 621, 2.00004),
(135, 622, 2.07996),
(135, 1712, 0.63984),
(135, 1717, 6.39936),
(135, 2313, 3.20016),
(135, 2314, 7.83984),
(135, 2315, 8.64),
(135, 2382, 7.04016),
(135, 2383, 9.44016),
(135, 2384, 6.24),
(135, 2385, 8.00016),
(135, 2386, 6.72),
(135, 2387, 7.2),
(135, 2388, 6.24),
(135, 2389, 6.87984),
(135, 2390, 6.08016),
(135, 2391, 7.2),
(135, 2392, 2.55984),
(135, 2393, 7.04016),
(135, 2394, 8.00016),
(135, 2395, 1.28016),
(135, 2396, 5.91984),
(135, 2397, 6.56016),
(135, 2398, 1.92),
(135, 2399, 11.8397),
(135, 2400, 13.7597),
(135, 2852, 0.56661),
(135, 2853, 2.66339),
(135, 2854, 3.06),
(136, 589, 0.56661),
(136, 620, 0.80004),
(136, 621, 2.00004),
(136, 622, 2.07996),
(136, 2858, 2.09661),
(143, 589, 0.56661),
(143, 620, 0.80004),
(143, 621, 2.00004),
(143, 622, 2.07996),
(143, 1712, 0.31992),
(143, 1717, 0.39996),
(143, 2572, 0.08004),
(143, 2573, 1.59996),
(143, 2574, 2.07996),
(143, 2607, 0.08004),
(143, 2608, 1.64004),
(143, 2609, 1.71996),
(143, 2610, 0.32004),
(143, 2611, 1.76004),
(143, 2612, 2.04),
(143, 2658, 0.48),
(143, 2659, 1.76004),
(143, 2660, 2.12004),
(143, 2661, 1.59996),
(143, 2662, 1.83996),
(143, 2663, 1.52004),
(143, 2664, 1.64004),
(143, 2665, 1.59996),
(143, 2666, 1.71996),
(143, 3554, 1.04004),
(143, 3555, 2.19996),
(143, 3556, 2.31996),
(143, 3557, 0.48),
(143, 3558, 1.68),
(143, 3559, 2.07996),
(143, 3591, 0.90661),
(143, 3592, 2.49339),
(144, 620, 0.80004),
(144, 621, 2.00004),
(144, 622, 2.07996),
(144, 1712, 0.31992),
(144, 1717, 0.39996),
(144, 2572, 0.08004),
(144, 2573, 1.59996),
(144, 2574, 2.07996),
(144, 2607, 0.08004),
(144, 2608, 1.64004),
(144, 2609, 1.71996),
(144, 2610, 0.32004),
(144, 2611, 1.76004),
(144, 2612, 2.04),
(144, 2658, 0.48),
(144, 2659, 1.76004),
(144, 2660, 2.12004),
(144, 2661, 1.59996),
(144, 2662, 1.83996),
(144, 2663, 1.52004),
(144, 2664, 1.64004),
(144, 2665, 1.59996),
(144, 2666, 1.71996),
(146, 589, 0.56661),
(146, 620, 0.80004),
(146, 621, 2.00004),
(146, 622, 2.07996),
(146, 3612, 2.09661),
(147, 589, 0.56661),
(147, 620, 0.80004),
(147, 621, 2.00004),
(147, 622, 2.07996),
(147, 3617, 2.09661);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_terms6`
--

INSERT INTO `bzrnp_finder_links_terms6` (`link_id`, `term_id`, `weight`) VALUES
(64, 1063, 0.8),
(136, 1452, 0.15996),
(143, 2675, 1.12008),
(143, 2676, 1.68),
(143, 2677, 1.8),
(143, 2678, 0.63996),
(143, 2679, 1.8),
(143, 2680, 1.92),
(143, 3596, 1.83996),
(143, 3597, 2.00004),
(144, 2675, 0.56004),
(144, 2676, 1.68),
(144, 2677, 1.8),
(144, 2678, 0.63996),
(144, 2679, 1.8),
(144, 2680, 1.92),
(147, 1452, 0.15996);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_terms7`
--

INSERT INTO `bzrnp_finder_links_terms7` (`link_id`, `term_id`, `weight`) VALUES
(56, 967, 0.15996),
(56, 968, 1.52004),
(56, 969, 1.76004),
(64, 1064, 0.96),
(64, 1065, 1.71996),
(64, 1066, 2.00004),
(65, 1079, 0.15996),
(128, 1406, 0.56004),
(128, 2693, 0.68),
(128, 2694, 2.38),
(134, 1406, 0.56004),
(134, 2346, 0.56004),
(134, 2347, 1.56),
(134, 2348, 1.76004),
(134, 2349, 0.39996),
(134, 2350, 1.52004),
(134, 2351, 1.88004),
(134, 2352, 0.56004),
(134, 2353, 1.95996),
(134, 2354, 2.07996),
(134, 2837, 0.79339),
(134, 2838, 2.49339),
(135, 1406, 0.56004),
(135, 2346, 2.24016),
(135, 2347, 6.24),
(135, 2348, 7.04016),
(135, 2349, 1.59984),
(135, 2350, 6.08016),
(135, 2351, 7.52016),
(135, 2352, 2.24016),
(135, 2353, 7.83984),
(135, 2354, 8.31984),
(136, 1406, 0.56004),
(143, 967, 0.15996),
(143, 1406, 0.56004),
(143, 2624, 0.39996),
(143, 2625, 1.71996),
(143, 2626, 1.88004),
(143, 2627, 0.63996),
(143, 2628, 1.83996),
(143, 2629, 2.16),
(143, 2630, 0.63996),
(143, 2631, 1.76004),
(143, 2632, 2.07996),
(143, 2635, 0.72),
(143, 2636, 1.64004),
(143, 3574, 1.47996),
(143, 3575, 1.88004),
(143, 3576, 1.2),
(143, 3577, 1.92),
(143, 3578, 2.16),
(143, 3579, 2.16),
(143, 3580, 0.72),
(143, 3581, 2.12004),
(143, 3582, 2.4),
(144, 1406, 0.56004),
(144, 2624, 0.39996),
(144, 2625, 1.71996),
(144, 2626, 1.88004),
(144, 2627, 0.63996),
(144, 2628, 1.83996),
(144, 2629, 2.16),
(144, 2630, 0.63996),
(144, 2631, 1.76004),
(144, 2632, 2.07996),
(144, 2635, 0.72),
(144, 2636, 1.64004),
(144, 3606, 1.02),
(144, 3607, 2.60661),
(146, 1406, 0.56004),
(147, 1406, 0.56004),
(147, 3616, 0.48);

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
(50, 577, 0.6666),
(50, 798, 0.2666),
(50, 799, 2.4666),
(50, 800, 2.6666),
(52, 577, 0.6666),
(52, 798, 0.2666),
(52, 799, 2.4666),
(52, 800, 2.6666),
(54, 577, 0.6666),
(54, 798, 0.2666),
(54, 799, 2.4666),
(54, 800, 2.6666),
(56, 577, 0.6666),
(56, 798, 0.2666),
(56, 799, 2.4666),
(56, 800, 2.6666),
(58, 577, 0.6666),
(58, 798, 0.2666),
(58, 799, 2.4666),
(58, 800, 2.6666),
(62, 577, 0.6666),
(63, 577, 0.6666),
(64, 577, 0.6666),
(64, 1060, 0.39996),
(64, 1061, 1.68),
(64, 1062, 1.95996),
(65, 577, 0.6666),
(65, 1073, 0.8),
(65, 1074, 2.8),
(67, 577, 0.6666),
(67, 798, 0.2666),
(67, 799, 2.4666),
(67, 800, 2.6666),
(69, 577, 0.6666),
(69, 798, 0.2666),
(69, 799, 2.4666),
(69, 800, 2.6666),
(79, 577, 0.6666),
(128, 577, 0.6666),
(128, 1403, 0.39996),
(128, 1419, 1.68),
(128, 2691, 0.8),
(128, 2692, 2.8),
(128, 2695, 0.56661),
(134, 577, 0.6666),
(134, 1403, 0.39996),
(134, 1419, 1.68),
(134, 1608, 1.59984),
(134, 2197, 1.71996),
(134, 2198, 2.00004),
(134, 2199, 1.8),
(134, 2200, 1.92),
(134, 2201, 1.71996),
(134, 2202, 1.8),
(134, 2203, 1.52004),
(134, 2204, 1.8),
(134, 2834, 0.9334),
(134, 2835, 3),
(135, 577, 0.6666),
(135, 1403, 0.39996),
(135, 1419, 1.68),
(135, 1608, 6.39936),
(135, 2197, 6.87984),
(135, 2198, 8.00016),
(135, 2199, 7.2),
(135, 2200, 7.68),
(135, 2201, 6.87984),
(135, 2202, 7.2),
(135, 2203, 6.08016),
(135, 2204, 7.2),
(135, 2840, 0.9334),
(136, 577, 0.6666),
(136, 1403, 0.39996),
(136, 1419, 1.68),
(143, 577, 0.6666),
(143, 1403, 0.39996),
(143, 1419, 1.68),
(143, 1608, 1.59984),
(143, 2563, 1.47996),
(143, 2564, 1.83996),
(143, 3503, 1.47996),
(143, 3504, 1.76004),
(143, 3505, 1.52004),
(143, 3506, 1.76004),
(143, 3512, 0.72),
(143, 3513, 1.71996),
(143, 3514, 2.36004),
(143, 3540, 0.96),
(143, 3541, 2.16),
(143, 3542, 2.4),
(144, 577, 0.6666),
(144, 1403, 0.39996),
(144, 1419, 1.68),
(144, 1608, 0.39996),
(144, 2563, 1.47996),
(144, 2564, 1.83996),
(144, 3603, 1.2),
(144, 3604, 3.1334),
(146, 577, 0.6666),
(146, 1403, 0.39996),
(146, 1419, 1.68),
(147, 577, 0.6666),
(147, 1403, 0.39996),
(147, 1419, 1.68);

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
(54, 899, 0.48),
(54, 900, 1.88004),
(54, 901, 2.16),
(56, 899, 0.48),
(56, 965, 1.56),
(56, 966, 1.8),
(56, 970, 0.39996),
(56, 971, 1.64004),
(56, 972, 1.88004),
(62, 1046, 0.39996),
(63, 1046, 0.96657),
(63, 1055, 2.09661),
(63, 1056, 0.48),
(63, 1057, 1.52004),
(64, 1046, 0.39996),
(65, 1046, 0.96657),
(67, 899, 0.48),
(67, 900, 1.88004),
(67, 901, 2.16),
(67, 1142, 0.72),
(67, 1143, 1.95996),
(69, 899, 0.48),
(69, 900, 1.88004),
(69, 901, 2.16),
(69, 1142, 0.72),
(69, 1143, 1.95996),
(79, 1046, 0.39996),
(79, 1250, 0.56004),
(128, 623, 0.96),
(134, 623, 0.96),
(134, 2338, 0.72),
(134, 2339, 1.83996),
(134, 2340, 2.16),
(134, 2341, 0.48),
(134, 2342, 1.88004),
(134, 2343, 2.24004),
(134, 2367, 0.32004),
(134, 2368, 1.88004),
(134, 2369, 2.12004),
(134, 2370, 0.39996),
(134, 2371, 1.64004),
(134, 2372, 1.92),
(134, 2373, 0.63996),
(134, 2374, 1.83996),
(134, 2375, 2.16),
(134, 2376, 0.63996),
(134, 2377, 1.71996),
(134, 2378, 2.24004),
(134, 2379, 0.48),
(134, 2380, 1.56),
(134, 2381, 1.95996),
(134, 2836, 0.68),
(135, 623, 0.96),
(135, 2338, 2.88),
(135, 2339, 7.35984),
(135, 2340, 8.64),
(135, 2341, 1.92),
(135, 2342, 7.52016),
(135, 2343, 8.96016),
(135, 2367, 1.28016),
(135, 2368, 7.52016),
(135, 2369, 8.48016),
(135, 2370, 1.59984),
(135, 2371, 6.56016),
(135, 2372, 7.68),
(135, 2373, 2.55984),
(135, 2374, 7.35984),
(135, 2375, 8.64),
(135, 2376, 2.55984),
(135, 2377, 6.87984),
(135, 2378, 8.96016),
(135, 2379, 1.92),
(135, 2380, 6.24),
(135, 2381, 7.83984),
(135, 2844, 1.7334),
(135, 2845, 3.4),
(136, 623, 0.96),
(143, 623, 0.96),
(143, 2569, 0.24),
(143, 2570, 1.68),
(143, 2571, 1.88004),
(143, 2589, 0.48),
(143, 2590, 1.56),
(143, 2591, 1.8),
(143, 2646, 0.39996),
(143, 2647, 1.52004),
(143, 2648, 1.68),
(143, 2649, 0.87996),
(143, 2650, 1.88004),
(143, 2651, 2.00004),
(143, 2652, 0.56004),
(143, 2653, 1.64004),
(143, 2654, 1.71996),
(143, 2655, 1.27992),
(143, 2656, 1.71996),
(143, 2657, 2.12004),
(143, 3586, 1.83996),
(143, 3587, 2.16),
(143, 3588, 0.32004),
(143, 3589, 1.76004),
(143, 3590, 1.95996),
(144, 623, 0.96),
(144, 2569, 0.24),
(144, 2570, 1.68),
(144, 2571, 1.88004),
(144, 2589, 0.48),
(144, 2590, 1.56),
(144, 2591, 1.8),
(144, 2646, 0.39996),
(144, 2647, 1.52004),
(144, 2648, 1.68),
(144, 2649, 0.87996),
(144, 2650, 1.88004),
(144, 2651, 2.00004),
(144, 2652, 0.56004),
(144, 2653, 1.64004),
(144, 2654, 1.71996),
(144, 2655, 0.63996),
(144, 2656, 1.71996),
(144, 2657, 2.12004),
(146, 623, 0.96),
(147, 623, 0.96);

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
(54, 891, 0.34),
(54, 892, 2.04),
(54, 893, 2.15339),
(56, 954, 0.34),
(56, 955, 2.04),
(56, 956, 2.15339),
(58, 1008, 0.34),
(58, 1009, 2.04),
(58, 1010, 2.15339),
(58, 1011, 0.34),
(58, 1012, 1.98339),
(58, 1013, 2.21),
(64, 1069, 0.68),
(67, 1069, 0.48),
(69, 1069, 0.48),
(128, 1421, 0.15996),
(134, 1662, 0.08004),
(134, 2322, 0.24),
(134, 2323, 1.76004),
(134, 2324, 2.16),
(134, 2325, 0.48),
(134, 2326, 1.64004),
(134, 2327, 1.88004),
(134, 2416, 0.15996),
(134, 2417, 1.56),
(134, 2418, 1.64004),
(134, 2419, 0.24),
(134, 2420, 1.8),
(134, 2421, 1.92),
(134, 2422, 0.24),
(134, 2423, 1.59996),
(134, 2424, 2.04),
(135, 1662, 0.08004),
(135, 2322, 0.96),
(135, 2323, 7.04016),
(135, 2324, 8.64),
(135, 2325, 1.92),
(135, 2326, 6.56016),
(135, 2327, 7.52016),
(135, 2416, 0.63984),
(135, 2417, 6.24),
(135, 2418, 6.56016),
(135, 2419, 0.96),
(135, 2420, 7.2),
(135, 2421, 7.68),
(135, 2422, 0.96),
(135, 2423, 6.39984),
(135, 2424, 8.16),
(136, 1069, 0.48),
(136, 2856, 0.37),
(143, 2419, 0.48),
(143, 2856, 0.12),
(143, 3560, 0.56004),
(143, 3561, 1.76004),
(143, 3562, 1.83996),
(143, 3563, 0.63996),
(143, 3564, 1.88004),
(143, 3565, 2.19996),
(143, 3598, 1.95996),
(143, 3599, 2.19996),
(143, 3600, 1.64004),
(143, 3601, 1.92),
(144, 1662, 0.08004),
(146, 1421, 0.15996);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_termsb`
--

INSERT INTO `bzrnp_finder_links_termsb` (`link_id`, `term_id`, `weight`) VALUES
(50, 796, 0.74),
(50, 797, 4.31679),
(52, 796, 0.74),
(52, 797, 4.31679),
(54, 796, 0.74),
(54, 797, 4.31679),
(56, 796, 0.74),
(56, 797, 4.31679),
(58, 796, 0.74),
(58, 797, 4.31679),
(63, 1050, 0.6666),
(63, 1051, 2.4666),
(65, 1050, 0.6666),
(65, 1075, 0.96),
(65, 1076, 1.8),
(67, 796, 0.74),
(67, 797, 4.31679),
(69, 796, 0.74),
(69, 797, 4.31679),
(134, 1629, 0.16008),
(134, 2211, 0.08004),
(134, 2212, 1.47996),
(134, 2213, 1.59996),
(134, 2214, 0.48),
(134, 2215, 3.12),
(134, 2216, 1.71996),
(134, 2217, 1.68),
(134, 2232, 1.71996),
(134, 2233, 1.95996),
(134, 2234, 1.44),
(134, 2235, 1.56),
(134, 2236, 0.24),
(134, 2237, 1.71996),
(134, 2238, 1.88004),
(134, 2239, 0.56004),
(134, 2240, 1.76004),
(134, 2241, 2.19996),
(134, 2242, 0.56004),
(134, 2243, 1.64004),
(134, 2244, 2.04),
(134, 2245, 0.48),
(134, 2246, 1.56),
(134, 2247, 2.04),
(134, 2248, 0.87996),
(134, 2249, 2.24004),
(134, 2250, 2.4),
(134, 2251, 0.80004),
(134, 2252, 1.76004),
(134, 2253, 2.24004),
(134, 2254, 0.48),
(134, 2255, 1.68),
(134, 2256, 1.92),
(134, 2257, 0.87996),
(134, 2258, 1.76004),
(134, 2259, 2.24004),
(134, 2260, 0.24),
(134, 2261, 1.56),
(134, 2262, 1.83996),
(134, 2263, 0.96),
(134, 2264, 1.92),
(134, 2265, 2.16),
(134, 2266, 1.11996),
(134, 2267, 2.00004),
(134, 2268, 2.24004),
(134, 2269, 0.72),
(134, 2270, 1.8),
(134, 2271, 2.00004),
(134, 2833, 0.9334),
(135, 1629, 0.64032),
(135, 2211, 0.32016),
(135, 2212, 5.91984),
(135, 2213, 6.39984),
(135, 2214, 1.92),
(135, 2215, 12.48),
(135, 2216, 6.87984),
(135, 2217, 6.72),
(135, 2232, 6.87984),
(135, 2233, 7.83984),
(135, 2234, 5.76),
(135, 2235, 6.24),
(135, 2236, 0.96),
(135, 2237, 6.87984),
(135, 2238, 7.52016),
(135, 2239, 2.24016),
(135, 2240, 7.04016),
(135, 2241, 8.79984),
(135, 2242, 2.24016),
(135, 2243, 6.56016),
(135, 2244, 8.16),
(135, 2245, 1.92),
(135, 2246, 6.24),
(135, 2247, 8.16),
(135, 2248, 3.51984),
(135, 2249, 8.96016),
(135, 2250, 9.6),
(135, 2251, 3.20016),
(135, 2252, 7.04016),
(135, 2253, 8.96016),
(135, 2254, 1.92),
(135, 2255, 6.72),
(135, 2256, 7.68),
(135, 2257, 3.51984),
(135, 2258, 7.04016),
(135, 2259, 8.96016),
(135, 2260, 0.96),
(135, 2261, 6.24),
(135, 2262, 7.35984),
(135, 2263, 3.84),
(135, 2264, 7.68),
(135, 2265, 8.64),
(135, 2266, 4.47984),
(135, 2267, 8.00016),
(135, 2268, 8.96016),
(135, 2269, 2.88),
(135, 2270, 7.2),
(135, 2271, 8.00016),
(135, 2846, 1.24661),
(135, 2847, 2.72),
(143, 1629, 0.24012),
(143, 2211, 0.08004),
(143, 2254, 0.48),
(143, 2255, 1.68),
(143, 2256, 1.92),
(143, 2257, 0.87996),
(143, 2581, 1.68),
(143, 2582, 1.8),
(143, 2583, 0.32004),
(143, 2584, 1.71996),
(143, 2585, 2.00004),
(143, 2586, 1.2),
(143, 2587, 1.92),
(143, 2588, 2.36004),
(143, 3517, 1.52004),
(143, 3518, 1.92),
(143, 3519, 1.47996),
(143, 3520, 1.71996),
(143, 3521, 1.76004),
(143, 3522, 2.24004),
(143, 3523, 0.48),
(143, 3524, 1.83996),
(143, 3525, 2.16),
(143, 3526, 0.87996),
(143, 3527, 2.12004),
(143, 3528, 2.24004),
(143, 3529, 1.76004),
(143, 3530, 2.04),
(143, 3531, 0.56004),
(143, 3532, 1.8),
(143, 3533, 2.12004),
(143, 3534, 1.2),
(143, 3535, 2.04),
(143, 3536, 2.31996),
(143, 3537, 0.32004),
(143, 3538, 2.04),
(143, 3539, 2.12004),
(144, 1629, 0.16008),
(144, 2581, 1.68),
(144, 2582, 1.8),
(144, 2583, 0.32004),
(144, 2584, 1.71996),
(144, 2585, 2.00004),
(144, 2586, 1.2),
(144, 2587, 1.92),
(144, 2588, 2.36004);

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
(50, 596, 0.4),
(50, 597, 0.37),
(50, 770, 0.34),
(50, 771, 2.04),
(50, 772, 2.15339),
(50, 773, 0.4),
(50, 774, 2.3334),
(50, 775, 2.8),
(50, 776, 0.34),
(50, 777, 1.98339),
(50, 778, 2.15339),
(50, 779, 1.2),
(50, 780, 2.6666),
(50, 781, 2.8),
(50, 782, 2.6),
(50, 783, 2.8666),
(50, 784, 0.68),
(50, 785, 2.43661),
(50, 786, 2.60661),
(50, 787, 0.8),
(50, 788, 2.4666),
(50, 789, 2.6666),
(50, 790, 1.7),
(50, 791, 2.43661),
(50, 792, 2.60661),
(52, 596, 0.4),
(52, 597, 0.37),
(52, 613, 0.34),
(52, 773, 0.4),
(52, 774, 2.3334),
(52, 787, 0.8),
(52, 788, 2.4666),
(52, 789, 2.6666),
(52, 790, 1.7),
(52, 830, 0.34),
(52, 831, 1.98339),
(52, 832, 2.21),
(52, 833, 2.8),
(52, 834, 1.98339),
(52, 835, 2.15339),
(52, 836, 1.2),
(52, 837, 2.6666),
(52, 838, 2.8),
(52, 839, 2.6),
(52, 840, 2.8666),
(52, 841, 0.68),
(52, 842, 2.43661),
(52, 843, 2.60661),
(52, 844, 0.34),
(52, 845, 2.04),
(52, 846, 2.15339),
(52, 847, 2.43661),
(52, 848, 2.60661),
(54, 596, 0.4),
(54, 597, 0.37),
(54, 613, 0.34),
(54, 773, 0.4),
(54, 774, 2.3334),
(54, 787, 0.8),
(54, 788, 2.4666),
(54, 789, 2.6666),
(54, 790, 1.7),
(54, 844, 0.68),
(54, 847, 2.43661),
(54, 877, 2.8),
(54, 878, 1.98339),
(54, 879, 2.15339),
(54, 880, 1.2),
(54, 881, 2.6666),
(54, 882, 2.8),
(54, 883, 2.6),
(54, 884, 2.8666),
(54, 885, 2.43661),
(54, 886, 2.60661),
(54, 887, 2.60661),
(56, 596, 0.4),
(56, 597, 0.37),
(56, 613, 0.34),
(56, 773, 0.4),
(56, 774, 2.3334),
(56, 787, 0.8),
(56, 788, 2.4666),
(56, 789, 2.6666),
(56, 790, 1.7),
(56, 847, 2.43661),
(56, 939, 2.8),
(56, 940, 1.98339),
(56, 941, 2.15339),
(56, 942, 1.2),
(56, 943, 2.6666),
(56, 944, 2.8),
(56, 945, 2.6),
(56, 946, 2.8666),
(56, 947, 0.68),
(56, 948, 2.43661),
(56, 949, 2.60661),
(56, 950, 2.60661),
(58, 596, 0.4),
(58, 597, 0.37),
(58, 613, 0.34),
(58, 773, 0.4),
(58, 774, 2.3334),
(58, 787, 0.8),
(58, 788, 2.4666),
(58, 789, 2.6666),
(58, 790, 1.7),
(58, 847, 2.43661),
(58, 996, 2.8),
(58, 997, 1.98339),
(58, 998, 2.15339),
(58, 999, 1.2),
(58, 1000, 2.6666),
(58, 1001, 2.8),
(58, 1002, 2.6),
(58, 1003, 2.8666),
(58, 1004, 0.68),
(58, 1005, 2.43661),
(58, 1006, 2.60661),
(58, 1007, 2.60661),
(62, 1037, 0.48),
(62, 1038, 0.96),
(62, 1039, 1.71996),
(62, 1040, 0.84),
(62, 1041, 1.83996),
(62, 1042, 2.04),
(62, 1043, 0.34),
(62, 1045, 0.39996),
(63, 1045, 0.39996),
(63, 1048, 0.34),
(63, 1052, 0.19343),
(63, 1053, 1.68),
(63, 1054, 1.76004),
(64, 1059, 0.34),
(65, 1071, 0.34),
(67, 597, 0.37),
(67, 613, 0.24),
(67, 645, 0.34),
(67, 773, 0.4),
(67, 784, 0.4),
(67, 787, 0.8),
(67, 788, 2.4666),
(67, 1071, 0.34),
(67, 1112, 0.48),
(67, 1113, 1.40004),
(67, 1114, 1.52004),
(67, 1115, 2.3334),
(67, 1116, 2.8),
(67, 1117, 1.40004),
(67, 1118, 1.52004),
(67, 1119, 1.98339),
(67, 1120, 2.15339),
(67, 1121, 1.2),
(67, 1122, 2.6666),
(67, 1123, 2.8),
(67, 1124, 0.58),
(67, 1125, 1.40004),
(67, 1126, 2.04),
(67, 1127, 2.15339),
(67, 1128, 2.6),
(67, 1129, 2.8666),
(67, 1130, 2.6666),
(67, 1131, 1.7),
(67, 1132, 2.43661),
(67, 1133, 2.60661),
(67, 1134, 1.98339),
(67, 1135, 2.21),
(67, 1136, 0.68),
(67, 1137, 2.43661),
(67, 1138, 2.60661),
(69, 597, 0.37),
(69, 613, 0.58),
(69, 645, 0.34),
(69, 773, 0.4),
(69, 784, 0.4),
(69, 787, 0.8),
(69, 788, 2.4666),
(69, 1112, 0.48),
(69, 1113, 1.40004),
(69, 1114, 1.52004),
(69, 1115, 2.3334),
(69, 1117, 1.40004),
(69, 1118, 1.52004),
(69, 1124, 0.24),
(69, 1125, 1.40004),
(69, 1130, 2.6666),
(69, 1131, 1.7),
(69, 1132, 2.43661),
(69, 1163, 2.8),
(69, 1164, 2.04),
(69, 1165, 2.15339),
(69, 1166, 1.98339),
(69, 1167, 2.15339),
(69, 1168, 1.2),
(69, 1169, 2.6666),
(69, 1170, 2.8),
(69, 1171, 2.6),
(69, 1172, 2.8666),
(69, 1173, 2.60661),
(69, 1174, 0.68),
(69, 1175, 2.43661),
(69, 1176, 2.60661),
(69, 1177, 0.34),
(69, 1178, 1.98339),
(69, 1179, 2.21),
(79, 1177, 0.34),
(128, 2689, 0.58),
(136, 2855, 0.58),
(143, 2575, 0.15996),
(143, 2576, 1.35996),
(143, 2577, 1.52004),
(143, 2578, 0.24),
(143, 2579, 1.40004),
(143, 2580, 1.8),
(144, 2575, 0.15996),
(144, 2576, 1.35996),
(144, 2577, 1.52004),
(144, 2578, 0.24),
(144, 2579, 1.40004),
(144, 2580, 1.8),
(144, 3602, 0.58),
(146, 596, 0.58),
(146, 597, 0.37),
(147, 645, 0.58);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_termsd`
--

INSERT INTO `bzrnp_finder_links_termsd` (`link_id`, `term_id`, `weight`) VALUES
(52, 851, 0.24),
(134, 1666, 0.31992),
(134, 1735, 0.31992),
(134, 2281, 0.80004),
(134, 2328, 1.59996),
(134, 2329, 1.76004),
(134, 2330, 1.68),
(134, 2331, 1.95996),
(134, 2332, 0.72),
(134, 2333, 1.71996),
(134, 2334, 1.88004),
(134, 2335, 0.72),
(134, 2336, 2.07996),
(134, 2337, 2.31996),
(134, 2409, 0.15996),
(134, 2410, 1.35996),
(134, 2411, 1.83996),
(134, 2412, 1.44),
(134, 2413, 1.68),
(134, 2414, 1.76004),
(134, 2415, 2.00004),
(135, 1666, 1.27968),
(135, 1735, 1.27968),
(135, 2281, 3.20016),
(135, 2328, 6.39984),
(135, 2329, 7.04016),
(135, 2330, 6.72),
(135, 2331, 7.83984),
(135, 2332, 2.88),
(135, 2333, 6.87984),
(135, 2334, 7.52016),
(135, 2335, 2.88),
(135, 2336, 8.31984),
(135, 2337, 9.27984),
(135, 2409, 0.63984),
(135, 2410, 5.43984),
(135, 2411, 7.35984),
(135, 2412, 5.76),
(135, 2413, 6.72),
(135, 2414, 7.04016),
(135, 2415, 8.00016),
(135, 2848, 5.28012),
(135, 2849, 6.00012),
(143, 1666, 0.31992),
(143, 1735, 0.15996),
(143, 2613, 0.24),
(143, 2614, 1.68),
(143, 2615, 2.00004),
(143, 2616, 1.44),
(143, 2617, 1.8),
(143, 2618, 0.15996),
(143, 2619, 1.56),
(143, 2620, 1.88004),
(143, 2621, 0.72),
(143, 2622, 1.83996),
(143, 2623, 2.04),
(143, 2681, 1.95996),
(143, 2682, 2.04),
(143, 3566, 1.56),
(143, 3567, 1.8),
(143, 3568, 0.72),
(143, 3569, 1.76004),
(143, 3570, 2.4),
(143, 3571, 0.72),
(143, 3572, 1.88004),
(143, 3573, 2.28),
(144, 1666, 0.15996),
(144, 1735, 0.15996),
(144, 2613, 0.24),
(144, 2614, 1.68),
(144, 2615, 2.00004),
(144, 2616, 1.44),
(144, 2617, 1.8),
(144, 2618, 0.15996),
(144, 2619, 1.56),
(144, 2620, 1.88004),
(144, 2621, 0.72),
(144, 2622, 1.83996),
(144, 2623, 2.04),
(144, 2681, 1.95996),
(144, 2682, 2.04);

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
(50, 793, 0.34),
(50, 794, 1.98339),
(50, 795, 2.21),
(50, 805, 0.96657),
(50, 806, 2.15339),
(50, 807, 2.77661),
(52, 805, 0.96657),
(52, 849, 2.15339),
(52, 850, 2.77661),
(54, 805, 0.96657),
(54, 888, 0.34),
(54, 889, 1.98339),
(54, 890, 2.21),
(54, 896, 2.15339),
(54, 897, 2.77661),
(56, 805, 0.96657),
(56, 951, 0.34),
(56, 952, 1.98339),
(56, 953, 2.21),
(56, 960, 2.15339),
(56, 961, 2.77661),
(58, 805, 0.96657),
(58, 1014, 2.15339),
(58, 1015, 2.77661),
(62, 1044, 0.8),
(65, 1072, 1.8),
(67, 805, 0.96657),
(67, 1140, 2.15339),
(67, 1141, 2.77661),
(69, 805, 0.96657),
(69, 1180, 2.15339),
(69, 1181, 2.77661),
(128, 1402, 0.48),
(128, 2690, 0.6666),
(134, 888, 0.58),
(134, 1402, 0.48),
(134, 2282, 0.72),
(134, 2283, 1.68),
(134, 2284, 1.95996),
(134, 2285, 0.31992),
(134, 2286, 1.56),
(134, 2287, 1.76004),
(134, 2288, 1.64004),
(134, 2289, 1.88004),
(134, 2290, 0.63996),
(134, 2291, 2.04),
(134, 2292, 2.31996),
(134, 2293, 0.87996),
(134, 2294, 1.88004),
(134, 2295, 2.12004),
(134, 2296, 0.39996),
(134, 2297, 1.59996),
(134, 2298, 1.95996),
(134, 2299, 0.87996),
(134, 2300, 1.76004),
(134, 2301, 1.83996),
(134, 2302, 0.56004),
(134, 2303, 1.92),
(134, 2304, 0.96),
(134, 2305, 1.95996),
(134, 2306, 2.12004),
(134, 2307, 0.48),
(134, 2308, 1.52004),
(134, 2309, 1.76004),
(134, 2310, 0.56004),
(134, 2311, 1.8),
(134, 2312, 2.24004),
(134, 2355, 0.39996),
(134, 2356, 1.68),
(134, 2357, 1.92),
(134, 2358, 0.48),
(134, 2359, 1.68),
(134, 2360, 1.95996),
(134, 2361, 0.96),
(134, 2362, 1.92),
(134, 2363, 2.04),
(134, 2364, 0.32004),
(134, 2365, 1.59996),
(134, 2366, 2.00004),
(135, 1402, 0.48),
(135, 2282, 2.88),
(135, 2283, 6.72),
(135, 2284, 5.87988),
(135, 2285, 1.27968),
(135, 2286, 4.68),
(135, 2287, 5.28012),
(135, 2288, 6.56016),
(135, 2289, 7.52016),
(135, 2290, 2.55984),
(135, 2291, 8.16),
(135, 2292, 9.27984),
(135, 2293, 3.51984),
(135, 2294, 7.52016),
(135, 2295, 8.48016),
(135, 2296, 1.59984),
(135, 2297, 6.39984),
(135, 2298, 7.83984),
(135, 2299, 3.51984),
(135, 2300, 7.04016),
(135, 2301, 7.35984),
(135, 2302, 2.24016),
(135, 2303, 7.68),
(135, 2304, 3.84),
(135, 2305, 7.83984),
(135, 2306, 8.48016),
(135, 2307, 1.92),
(135, 2308, 6.08016),
(135, 2309, 7.04016),
(135, 2310, 2.24016),
(135, 2311, 7.2),
(135, 2312, 8.96016),
(135, 2355, 1.59984),
(135, 2356, 6.72),
(135, 2357, 7.68),
(135, 2358, 1.92),
(135, 2359, 6.72),
(135, 2360, 7.83984),
(135, 2361, 3.84),
(135, 2362, 7.68),
(135, 2363, 8.16),
(135, 2364, 1.28016),
(135, 2365, 6.39984),
(135, 2366, 8.00016),
(135, 2839, 0.58),
(135, 2841, 0.6666),
(135, 2842, 3.2666),
(135, 2843, 3.8),
(135, 2850, 6.23988),
(136, 579, 0.6666),
(136, 1402, 0.48),
(136, 2857, 2.4666),
(143, 579, 0.6666),
(143, 1402, 0.48),
(143, 2355, 0.39996),
(143, 2356, 1.68),
(143, 2357, 1.92),
(143, 2601, 0.16008),
(143, 2602, 1.40004),
(143, 2603, 1.76004),
(143, 2604, 1.12008),
(143, 2605, 3.6),
(143, 2606, 2.00004),
(143, 2637, 0.64008),
(143, 2638, 1.47996),
(143, 2639, 1.76004),
(143, 2640, 1.47996),
(143, 2641, 2.16),
(143, 2642, 0.39996),
(143, 2643, 1.52004),
(143, 2644, 1.59996),
(143, 3496, 0.58),
(143, 3515, 1.0666),
(143, 3516, 2.9334),
(143, 3543, 1.47996),
(143, 3544, 1.71996),
(143, 3545, 1.12008),
(143, 3546, 1.8),
(143, 3547, 2.12004),
(143, 3548, 1.88004),
(143, 3549, 2.4),
(143, 3550, 0.87996),
(143, 3551, 1.76004),
(143, 3552, 1.95996),
(143, 3553, 2.16),
(143, 3583, 0.39996),
(143, 3584, 1.76004),
(143, 3585, 2.12004),
(144, 1402, 0.48),
(144, 2601, 0.08004),
(144, 2602, 1.40004),
(144, 2603, 1.76004),
(144, 2604, 0.56004),
(144, 2605, 1.8),
(144, 2606, 2.00004),
(144, 2637, 0.64008),
(144, 2638, 1.47996),
(144, 2639, 1.76004),
(144, 2640, 1.47996),
(144, 2641, 2.16),
(144, 2642, 0.39996),
(144, 2643, 1.52004),
(144, 2644, 1.59996),
(144, 3608, 0.68),
(146, 579, 0.6666),
(146, 1402, 0.48),
(146, 3611, 2.4666),
(147, 579, 0.6666),
(147, 1402, 0.48),
(147, 3613, 0.37),
(147, 3614, 2.4666);

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

--
-- Дамп данных таблицы `bzrnp_finder_links_termsf`
--

INSERT INTO `bzrnp_finder_links_termsf` (`link_id`, `term_id`, `weight`) VALUES
(50, 801, 0.6666),
(50, 802, 2.5334),
(50, 803, 2.8666),
(52, 801, 0.6666),
(52, 802, 2.5334),
(52, 803, 2.8666),
(54, 801, 0.6666),
(54, 802, 2.5334),
(54, 803, 2.8666),
(56, 801, 0.6666),
(56, 802, 2.5334),
(56, 803, 2.8666),
(58, 801, 0.6666),
(58, 802, 2.5334),
(58, 803, 2.8666),
(67, 801, 0.6666),
(67, 802, 2.5334),
(67, 803, 2.8666),
(69, 801, 0.6666),
(69, 802, 2.5334),
(69, 803, 2.8666);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=106 ;

--
-- Дамп данных таблицы `bzrnp_finder_taxonomy`
--

INSERT INTO `bzrnp_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0),
(2, 1, 'Type', 1, 1, 0),
(63, 5, 'Кровельный иструмент и оборудование', 1, 1, 0),
(5, 1, 'Category', 1, 1, 0),
(105, 2, 'Продукт', 1, 1, 0),
(74, 2, 'Город', 1, 1, 0),
(85, 5, 'Тамбовская область', 1, 1, 0);

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
(50, 66),
(52, 67),
(54, 68),
(56, 69),
(58, 70),
(62, 74),
(63, 74),
(64, 74),
(65, 74),
(67, 75),
(69, 76),
(79, 74),
(79, 85),
(128, 63),
(128, 105),
(134, 63),
(134, 105),
(135, 63),
(135, 105),
(136, 63),
(136, 105),
(143, 63),
(143, 105),
(144, 63),
(144, 105),
(146, 63),
(146, 105),
(147, 63),
(147, 105);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3618 ;

--
-- Дамп данных таблицы `bzrnp_finder_terms`
--

INSERT INTO `bzrnp_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`) VALUES
(1452, 'шт', 'шт', 0, 0, 0.1333, 'ш000', 2),
(3617, 'товар 3', 'товар 3', 0, 1, 1.2333, 'т000', 1),
(3616, 'привет', 'привет', 0, 0, 0.4, 'п000', 1),
(3615, 'бежевый', 'бежевый', 0, 0, 0.4667, 'б000', 1),
(645, '12', '12', 0, 0, 0.2, '', 3),
(623, 'оборудование', 'оборудование', 0, 0, 0.8, 'о000', 8),
(622, 'кровельный иструмент и', 'кровельный иструмент и', 0, 1, 1.7333, 'к000', 8),
(589, 'товар', 'товар', 0, 0, 0.3333, 'т000', 4),
(597, '2', '2', 0, 0, 0.1, '', 8),
(596, '11', '11', 0, 0, 0.2, '', 6),
(3612, 'товар 2', 'товар 2', 0, 1, 1.2333, 'т000', 1),
(620, 'кровельный', 'кровельный', 0, 0, 0.6667, 'к000', 8),
(621, 'кровельный иструмент', 'кровельный иструмент', 0, 1, 1.6667, 'к000', 8),
(619, 'иструмент и оборудование', 'иструмент и оборудование', 0, 1, 1.8, 'и000', 8),
(618, 'иструмент и', 'иструмент и', 0, 1, 1.3667, 'и000', 8),
(616, 'и оборудование', 'и оборудование', 0, 1, 1.4667, 'и000', 8),
(617, 'иструмент', 'иструмент', 0, 0, 0.6, 'и000', 8),
(615, 'и', 'и', 0, 0, 0.0667, 'и000', 8),
(579, 'tovar', 'tovar', 0, 0, 0.3333, 'T160', 4),
(3611, 'tovar 2', 'tovar 2', 0, 1, 1.2333, 'T160', 1),
(577, 'index', 'index', 0, 0, 0.3333, 'I532', 20),
(613, '10', '10', 0, 0, 0.2, '', 6),
(1249, 'лобня', 'лобня', 0, 0, 0.3333, 'л000', 1),
(807, 'заказ 15 2014-07-11', 'заказ 15 2014-07-11', 0, 1, 1.6333, 'з000', 1),
(806, 'заказ 15', 'заказ 15', 0, 1, 1.2667, 'з000', 1),
(804, 'да', 'да', 0, 0, 0.1333, 'д000', 8),
(805, 'заказ', 'заказ', 0, 0, 0.3333, 'з000', 7),
(802, 'zakaz id', 'zakaz id', 0, 1, 1.2667, 'Z300', 7),
(803, 'zakaz id 2014', 'zakaz id 2014', 0, 1, 1.4333, 'Z300', 7),
(801, 'zakaz', 'zakaz', 0, 0, 0.3333, 'Z000', 7),
(800, 'id 2014 07', 'id 2014 07', 0, 1, 1.3333, 'I300', 7),
(799, 'id 2014', 'id 2014', 0, 1, 1.2333, 'I300', 7),
(797, 'gmt 2', 'gmt 2', 0, 1, 1.1667, 'G530', 7),
(798, 'id', 'id', 0, 0, 0.1333, 'I300', 7),
(796, 'gmt', 'gmt', 0, 0, 0.2, 'G530', 7),
(794, '51 01', '51 01', 0, 1, 1.1667, '', 1),
(795, '51 01 gmt', '51 01 gmt', 0, 1, 1.3, 'G530', 1),
(793, '51', '51', 0, 0, 0.2, '', 1),
(792, '2014-07-11 09 51', '2014-07-11 09 51', 0, 1, 1.5333, '', 1),
(791, '2014-07-11 09', '2014-07-11 09', 0, 1, 1.4333, '', 1),
(790, '2014-07-11', '2014-07-11', 0, 0, 1, '', 5),
(788, '2014 07', '2014 07', 0, 1, 1.2333, '', 7),
(789, '2014 07 11', '2014 07 11', 0, 1, 1.3333, '', 5),
(787, '2014', '2014', 0, 0, 0.4, '', 7),
(786, '15 2014-07-11 09', '15 2014-07-11 09', 0, 1, 1.5333, '', 1),
(785, '15 2014-07-11', '15 2014-07-11', 0, 1, 1.4333, '', 1),
(784, '15', '15', 0, 0, 0.2, '', 3),
(783, '11 095101 gmt', '11 095101 gmt', 0, 1, 1.4333, 'G530', 1),
(782, '11 095101', '11 095101', 0, 1, 1.3, '', 1),
(781, '095101 gmt 2', '095101 gmt 2', 0, 1, 1.4, 'G530', 1),
(779, '095101', '095101', 0, 0, 0.6, '', 1),
(780, '095101 gmt', '095101 gmt', 0, 1, 1.3333, 'G530', 1),
(778, '09 51 01', '09 51 01', 0, 1, 1.2667, '', 1),
(777, '09 51', '09 51', 0, 1, 1.1667, '', 1),
(776, '09', '09', 0, 0, 0.2, '', 1),
(775, '07 11 095101', '07 11 095101', 0, 1, 1.4, '', 1),
(774, '07 11', '07 11', 0, 1, 1.1667, '', 5),
(773, '07', '07', 0, 0, 0.2, '', 7),
(770, '01', '01', 0, 0, 0.2, '', 1),
(771, '01 gmt', '01 gmt', 0, 1, 1.2, 'G530', 1),
(772, '01 gmt 2', '01 gmt 2', 0, 1, 1.2667, 'G530', 1),
(851, 'нет', 'нет', 0, 0, 0.2, 'н000', 1),
(850, 'заказ 16 2014-07-11', 'заказ 16 2014-07-11', 0, 1, 1.6333, 'з000', 1),
(849, 'заказ 16', 'заказ 16', 0, 1, 1.2667, 'з000', 1),
(848, '2014-07-11 10 03', '2014-07-11 10 03', 0, 1, 1.5333, '', 1),
(847, '2014-07-11 10', '2014-07-11 10', 0, 1, 1.4333, '', 4),
(846, '17 gmt 2', '17 gmt 2', 0, 1, 1.2667, 'G530', 1),
(845, '17 gmt', '17 gmt', 0, 1, 1.2, 'G530', 1),
(844, '17', '17', 0, 0, 0.2, '', 2),
(843, '16 2014-07-11 10', '16 2014-07-11 10', 0, 1, 1.5333, '', 1),
(842, '16 2014-07-11', '16 2014-07-11', 0, 1, 1.4333, '', 1),
(841, '16', '16', 0, 0, 0.2, '', 1),
(840, '11 100317 gmt', '11 100317 gmt', 0, 1, 1.4333, 'G530', 1),
(830, '03', '03', 0, 0, 0.2, '', 1),
(831, '03 17', '03 17', 0, 1, 1.1667, '', 1),
(832, '03 17 gmt', '03 17 gmt', 0, 1, 1.3, 'G530', 1),
(833, '07 11 100317', '07 11 100317', 0, 1, 1.4, '', 1),
(834, '10 03', '10 03', 0, 1, 1.1667, '', 1),
(835, '10 03 17', '10 03 17', 0, 1, 1.2667, '', 1),
(836, '100317', '100317', 0, 0, 0.6, '', 1),
(837, '100317 gmt', '100317 gmt', 0, 1, 1.3333, 'G530', 1),
(838, '100317 gmt 2', '100317 gmt 2', 0, 1, 1.4, 'G530', 1),
(839, '11 100317', '11 100317', 0, 1, 1.3, '', 1),
(901, 'оплата банковской картой', 'оплата банковской картой', 0, 1, 1.8, 'о000', 3),
(900, 'оплата банковской', 'оплата банковской', 0, 1, 1.5667, 'о000', 3),
(899, 'оплата', 'оплата', 0, 0, 0.4, 'о000', 4),
(898, 'картой', 'картой', 0, 0, 0.4, 'к000', 3),
(897, 'заказ 17 2014-07-11', 'заказ 17 2014-07-11', 0, 1, 1.6333, 'з000', 1),
(896, 'заказ 17', 'заказ 17', 0, 1, 1.2667, 'з000', 1),
(895, 'банковской картой', 'банковской картой', 0, 1, 1.5667, 'б000', 3),
(894, 'банковской', 'банковской', 0, 0, 0.6667, 'б000', 3),
(893, '48 gmt 2', '48 gmt 2', 0, 1, 1.2667, 'G530', 1),
(892, '48 gmt', '48 gmt', 0, 1, 1.2, 'G530', 1),
(891, '48', '48', 0, 0, 0.2, '', 1),
(890, '30 48 gmt', '30 48 gmt', 0, 1, 1.3, 'G530', 1),
(888, '30', '30', 0, 0, 0.2, '', 2),
(889, '30 48', '30 48', 0, 1, 1.1667, '', 1),
(877, '07 11 103048', '07 11 103048', 0, 1, 1.4, '', 1),
(878, '10 30', '10 30', 0, 1, 1.1667, '', 1),
(879, '10 30 48', '10 30 48', 0, 1, 1.2667, '', 1),
(880, '103048', '103048', 0, 0, 0.6, '', 1),
(881, '103048 gmt', '103048 gmt', 0, 1, 1.3333, 'G530', 1),
(882, '103048 gmt 2', '103048 gmt 2', 0, 1, 1.4, 'G530', 1),
(883, '11 103048', '11 103048', 0, 1, 1.3, '', 1),
(884, '11 103048 gmt', '11 103048 gmt', 0, 1, 1.4333, 'G530', 1),
(885, '17 2014-07-11', '17 2014-07-11', 0, 1, 1.4333, '', 1),
(886, '17 2014-07-11 10', '17 2014-07-11 10', 0, 1, 1.5333, '', 1),
(887, '2014-07-11 10 30', '2014-07-11 10 30', 0, 1, 1.5333, '', 1),
(975, 'через любой банк', 'через любой банк', 0, 1, 1.5333, 'ч000', 1),
(974, 'через любой', 'через любой', 0, 1, 1.3667, 'ч000', 1),
(973, 'через', 'через', 0, 0, 0.3333, 'ч000', 1),
(972, 'счету через любой', 'счету через любой', 0, 1, 1.5667, 'с000', 1),
(971, 'счету через', 'счету через', 0, 1, 1.3667, 'с000', 1),
(970, 'счету', 'счету', 0, 0, 0.3333, 'с000', 1),
(969, 'по счету через', 'по счету через', 0, 1, 1.4667, 'п000', 1),
(968, 'по счету', 'по счету', 0, 1, 1.2667, 'п000', 1),
(967, 'по', 'по', 0, 0, 0.1333, 'п000', 2),
(966, 'оплата по счету', 'оплата по счету', 0, 1, 1.5, 'о000', 1),
(965, 'оплата по', 'оплата по', 0, 1, 1.3, 'о000', 1),
(964, 'любой банк', 'любой банк', 0, 1, 1.3333, 'л000', 1),
(963, 'любой', 'любой', 0, 0, 0.3333, 'л000', 1),
(962, 'курьером', 'курьером', 0, 0, 0.5333, 'к000', 1),
(961, 'заказ 18 2014-07-11', 'заказ 18 2014-07-11', 0, 1, 1.6333, 'з000', 1),
(960, 'заказ 18', 'заказ 18', 0, 1, 1.2667, 'з000', 1),
(959, 'доставка курьером', 'доставка курьером', 0, 1, 1.5667, 'д000', 1),
(957, 'банк', 'банк', 0, 0, 0.2667, 'б000', 1),
(958, 'доставка', 'доставка', 0, 0, 0.5333, 'д000', 1),
(956, '42 gmt 2', '42 gmt 2', 0, 1, 1.2667, 'G530', 1),
(955, '42 gmt', '42 gmt', 0, 1, 1.2, 'G530', 1),
(939, '07 11 103442', '07 11 103442', 0, 1, 1.4, '', 1),
(940, '10 34', '10 34', 0, 1, 1.1667, '', 1),
(941, '10 34 42', '10 34 42', 0, 1, 1.2667, '', 1),
(942, '103442', '103442', 0, 0, 0.6, '', 1),
(943, '103442 gmt', '103442 gmt', 0, 1, 1.3333, 'G530', 1),
(944, '103442 gmt 2', '103442 gmt 2', 0, 1, 1.4, 'G530', 1),
(945, '11 103442', '11 103442', 0, 1, 1.3, '', 1),
(946, '11 103442 gmt', '11 103442 gmt', 0, 1, 1.4333, 'G530', 1),
(947, '18', '18', 0, 0, 0.2, '', 1),
(948, '18 2014-07-11', '18 2014-07-11', 0, 1, 1.4333, '', 1),
(949, '18 2014-07-11 10', '18 2014-07-11 10', 0, 1, 1.5333, '', 1),
(950, '2014-07-11 10 34', '2014-07-11 10 34', 0, 1, 1.5333, '', 1),
(951, '34', '34', 0, 0, 0.2, '', 1),
(952, '34 42', '34 42', 0, 1, 1.1667, '', 1),
(953, '34 42 gmt', '34 42 gmt', 0, 1, 1.3, 'G530', 1),
(954, '42', '42', 0, 0, 0.2, '', 1),
(1015, 'заказ 19 2014-07-11', 'заказ 19 2014-07-11', 0, 1, 1.6333, 'з000', 1),
(1014, 'заказ 19', 'заказ 19', 0, 1, 1.2667, 'з000', 1),
(1013, '44 40 gmt', '44 40 gmt', 0, 1, 1.3, 'G530', 1),
(1012, '44 40', '44 40', 0, 1, 1.1667, '', 1),
(1011, '44', '44', 0, 0, 0.2, '', 1),
(1010, '40 gmt 2', '40 gmt 2', 0, 1, 1.2667, 'G530', 1),
(1009, '40 gmt', '40 gmt', 0, 1, 1.2, 'G530', 1),
(1008, '40', '40', 0, 0, 0.2, '', 1),
(1007, '2014-07-11 10 44', '2014-07-11 10 44', 0, 1, 1.5333, '', 1),
(1006, '19 2014-07-11 10', '19 2014-07-11 10', 0, 1, 1.5333, '', 1),
(1005, '19 2014-07-11', '19 2014-07-11', 0, 1, 1.4333, '', 1),
(996, '07 11 104440', '07 11 104440', 0, 1, 1.4, '', 1),
(997, '10 44', '10 44', 0, 1, 1.1667, '', 1),
(998, '10 44 40', '10 44 40', 0, 1, 1.2667, '', 1),
(999, '104440', '104440', 0, 0, 0.6, '', 1),
(1000, '104440 gmt', '104440 gmt', 0, 1, 1.3333, 'G530', 1),
(1001, '104440 gmt 2', '104440 gmt 2', 0, 1, 1.4, 'G530', 1),
(1002, '11 104440', '11 104440', 0, 1, 1.3, '', 1),
(1003, '11 104440 gmt', '11 104440 gmt', 0, 1, 1.4333, 'G530', 1),
(1004, '19', '19', 0, 0, 0.2, '', 1),
(1047, 'тамбов', 'тамбов', 0, 0, 0.4, 'т000', 1),
(1045, 'адрес', 'адрес', 0, 0, 0.3333, 'а000', 2),
(1046, 'город', 'город', 0, 0, 0.3333, 'г000', 5),
(1043, '21', '21', 0, 0, 0.2, '', 1),
(1044, 'tambov', 'tambov', 0, 0, 0.4, 'T510', 1),
(1042, '1341234 12341234 1234', '1341234 12341234 1234', 0, 1, 1.7, '', 1),
(1041, '1341234 12341234', '1341234 12341234', 0, 1, 1.5333, '', 1),
(1038, '12341234', '12341234', 0, 0, 0.8, '', 1),
(1039, '12341234 1234', '12341234 1234', 0, 1, 1.4333, '', 1),
(1040, '1341234', '1341234', 0, 0, 0.7, '', 1),
(1037, '1234', '1234', 0, 0, 0.4, '', 1),
(1048, '22', '22', 0, 0, 0.2, '', 1),
(1049, 'a', 'a', 0, 0, 0.0667, 'A000', 1),
(1050, 'gorod', 'gorod', 0, 0, 0.3333, 'G630', 2),
(1051, 'gorod a', 'gorod a', 0, 1, 1.2333, 'G630', 1),
(1052, 'а', 'а', 0, 0, 0.0667, 'а000', 1),
(1053, 'адрес города', 'адрес города', 0, 1, 1.4, 'а000', 1),
(1054, 'адрес города а', 'адрес города а', 0, 1, 1.4667, 'а000', 1),
(1055, 'город а', 'город а', 0, 1, 1.2333, 'г000', 1),
(1056, 'города', 'города', 0, 0, 0.4, 'г000', 1),
(1057, 'города а', 'города а', 0, 1, 1.2667, 'г000', 1),
(1058, 'фффффффффф', 'фффффффффф', 0, 0, 0.6667, 'ф000', 1),
(1059, '23', '23', 0, 0, 0.2, '', 1),
(1060, 'firts', 'firts', 0, 0, 0.3333, 'F632', 1),
(1061, 'firts number', 'firts number', 0, 1, 1.4, 'F632516', 1),
(1062, 'firts number second', 'firts number second', 0, 1, 1.6333, 'F632516253', 1),
(1063, 'moskva', 'moskva', 0, 0, 0.4, 'M210', 1),
(1064, 'number', 'number', 0, 0, 0.4, 'N160', 1),
(1065, 'number second', 'number second', 0, 1, 1.4333, 'N16253', 1),
(1066, 'number second number', 'number second number', 0, 1, 1.6667, 'N16253516', 1),
(1067, 'second', 'second', 0, 0, 0.4, 'S530', 1),
(1068, 'second number', 'second number', 0, 1, 1.4333, 'S53516', 1),
(1069, 'москва', 'москва', 0, 0, 0.4, 'м000', 4),
(1070, 'тверская', 'тверская', 0, 0, 0.5333, 'т000', 1),
(1071, '24', '24', 0, 0, 0.2, '', 2),
(1072, '5634653456346363465', '5634653456346363465', 0, 0, 1.5, '', 1),
(1073, 'drugoj', 'drugoj', 0, 0, 0.4, 'D620', 1),
(1074, 'drugoj gorod', 'drugoj gorod', 0, 1, 1.4, 'D6263', 1),
(1075, 'выфафываыфва', 'выфафываыфва', 0, 0, 0.8, 'в000', 1),
(1076, 'выфафываыфва ыф', 'выфафываыфва ыф', 0, 1, 1.5, 'в000', 1),
(1077, 'другой', 'другой', 0, 0, 0.4, 'д000', 1),
(1078, 'другой город', 'другой город', 0, 1, 1.4, 'д000', 1),
(1079, 'ыф', 'ыф', 0, 0, 0.1333, 'ы000', 1),
(1143, 'самовывоз бесплатно', 'самовывоз бесплатно', 0, 1, 1.6333, 'с000', 2),
(1142, 'самовывоз', 'самовывоз', 0, 0, 0.6, 'с000', 2),
(1141, 'заказ 25 2014-07-15', 'заказ 25 2014-07-15', 0, 1, 1.6333, 'з000', 1),
(1140, 'заказ 25', 'заказ 25', 0, 1, 1.2667, 'з000', 1),
(1139, 'бесплатно', 'бесплатно', 0, 0, 0.6, 'б000', 2),
(1138, '25 2014-07-15 12', '25 2014-07-15 12', 0, 1, 1.5333, '', 1),
(1137, '25 2014-07-15', '25 2014-07-15', 0, 1, 1.4333, '', 1),
(1136, '25', '25', 0, 0, 0.2, '', 1),
(1135, '24 14 gmt', '24 14 gmt', 0, 1, 1.3, 'G530', 1),
(1134, '24 14', '24 14', 0, 1, 1.1667, '', 1),
(1133, '2014-07-15 12 24', '2014-07-15 12 24', 0, 1, 1.5333, '', 1),
(1132, '2014-07-15 12', '2014-07-15 12', 0, 1, 1.4333, '', 2),
(1131, '2014-07-15', '2014-07-15', 0, 0, 1, '', 2),
(1130, '2014 07 15', '2014 07 15', 0, 1, 1.3333, '', 2),
(1129, '15 122414 gmt', '15 122414 gmt', 0, 1, 1.4333, 'G530', 1),
(1128, '15 122414', '15 122414', 0, 1, 1.3, '', 1),
(1112, '00', '00', 0, 0, 0.2, '', 2),
(1113, '00 14', '00 14', 0, 1, 1.1667, '', 2),
(1114, '00 14 00', '00 14 00', 0, 1, 1.2667, '', 2),
(1115, '07 15', '07 15', 0, 1, 1.1667, '', 2),
(1116, '07 15 122414', '07 15 122414', 0, 1, 1.4, '', 1),
(1117, '10 00', '10 00', 0, 1, 1.1667, '', 2),
(1118, '10 00 14', '10 00 14', 0, 1, 1.2667, '', 2),
(1119, '12 24', '12 24', 0, 1, 1.1667, '', 1),
(1120, '12 24 14', '12 24 14', 0, 1, 1.2667, '', 1),
(1121, '122414', '122414', 0, 0, 0.6, '', 1),
(1122, '122414 gmt', '122414 gmt', 0, 1, 1.3333, 'G530', 1),
(1123, '122414 gmt 2', '122414 gmt 2', 0, 1, 1.4, 'G530', 1),
(1124, '14', '14', 0, 0, 0.2, '', 2),
(1125, '14 00', '14 00', 0, 1, 1.1667, '', 2),
(1126, '14 gmt', '14 gmt', 0, 1, 1.2, 'G530', 1),
(1127, '14 gmt 2', '14 gmt 2', 0, 1, 1.2667, 'G530', 1),
(1181, 'заказ 26 2014-07-15', 'заказ 26 2014-07-15', 0, 1, 1.6333, 'з000', 1),
(1180, 'заказ 26', 'заказ 26', 0, 1, 1.2667, 'з000', 1),
(1179, '27 10 gmt', '27 10 gmt', 0, 1, 1.3, 'G530', 1),
(1178, '27 10', '27 10', 0, 1, 1.1667, '', 1),
(1177, '27', '27', 0, 0, 0.2, '', 2),
(1176, '26 2014-07-15 12', '26 2014-07-15 12', 0, 1, 1.5333, '', 1),
(1175, '26 2014-07-15', '26 2014-07-15', 0, 1, 1.4333, '', 1),
(1174, '26', '26', 0, 0, 0.2, '', 1),
(1173, '2014-07-15 12 27', '2014-07-15 12 27', 0, 1, 1.5333, '', 1),
(1172, '15 122710 gmt', '15 122710 gmt', 0, 1, 1.4333, 'G530', 1),
(1163, '07 15 122710', '07 15 122710', 0, 1, 1.4, '', 1),
(1164, '10 gmt', '10 gmt', 0, 1, 1.2, 'G530', 1),
(1165, '10 gmt 2', '10 gmt 2', 0, 1, 1.2667, 'G530', 1),
(1166, '12 27', '12 27', 0, 1, 1.1667, '', 1),
(1167, '12 27 10', '12 27 10', 0, 1, 1.2667, '', 1),
(1168, '122710', '122710', 0, 0, 0.6, '', 1),
(1169, '122710 gmt', '122710 gmt', 0, 1, 1.3333, 'G530', 1),
(1170, '122710 gmt 2', '122710 gmt 2', 0, 1, 1.4, 'G530', 1),
(1171, '15 122710', '15 122710', 0, 1, 1.3, '', 1),
(1248, 'lyubnya', 'lyubnya', 0, 0, 0.4667, 'L150', 1),
(1250, 'область', 'область', 0, 0, 0.4667, 'о000', 1),
(1251, 'тамбовская', 'тамбовская', 0, 0, 0.6667, 'т000', 1),
(1252, 'тамбовская область', 'тамбовская область', 0, 1, 1.6, 'т000', 1),
(3614, 'tovar 3', 'tovar 3', 0, 1, 1.2333, 'T160', 1),
(3613, '3', '3', 0, 0, 0.1, '', 1),
(1421, 'м2', 'м2', 0, 0, 0.1333, 'м000', 2),
(2858, 'товар 4', 'товар 4', 0, 1, 1.2333, 'т000', 1),
(1406, 'продукт', 'продукт', 0, 0, 0.4667, 'п000', 8),
(2857, 'tovar 4', 'tovar 4', 0, 1, 1.2333, 'T160', 1),
(1419, 'image exists', 'image exists', 0, 1, 1.4, 'I5232', 8),
(1403, 'image', 'image', 0, 0, 0.3333, 'I520', 8),
(1402, 'exists', 'exists', 0, 0, 0.4, 'E232', 8),
(2856, '4', '4', 0, 0, 0.1, '', 2),
(2855, '13', '13', 0, 0, 0.2, '', 1),
(2695, 'эвро2', 'эвро2', 0, 0, 0.3333, 'э000', 1),
(2693, 'плитка', 'плитка', 0, 0, 0.4, 'п000', 1),
(2694, 'плитка эвро2', 'плитка эвро2', 0, 1, 1.4, 'п000', 1),
(2692, 'plitka evro2', 'plitka evro2', 0, 1, 1.4, 'P43216', 1),
(2691, 'plitka', 'plitka', 0, 0, 0.4, 'P432', 1),
(2689, '28', '28', 0, 0, 0.2, '', 1),
(2690, 'evro2', 'evro2', 0, 0, 0.3333, 'E160', 1),
(2682, 'що використовується в', 'що використовується в', 0, 1, 1.7, 'щ000', 2),
(2681, 'що використовується', 'що використовується', 0, 1, 1.6333, 'щ000', 2),
(2680, 'шрифтову гранку та', 'шрифтову гранку та', 0, 1, 1.6, 'ш000', 2),
(1726, 'це', 'це', 0, 0, 0.1333, 'ц000', 4),
(2678, 'шрифтову', 'шрифтову', 0, 0, 0.5333, 'ш000', 2),
(2679, 'шрифтову гранку', 'шрифтову гранку', 0, 1, 1.5, 'ш000', 2),
(2676, 'шрифтів риба', 'шрифтів риба', 0, 1, 1.4, 'ш000', 2),
(2677, 'шрифтів риба не', 'шрифтів риба не', 0, 1, 1.5, 'ш000', 2),
(2675, 'шрифтів', 'шрифтів', 0, 0, 0.4667, 'ш000', 2),
(2673, 'це текст', 'це текст', 0, 1, 1.2667, 'ц000', 2),
(2674, 'це текст риба', 'це текст риба', 0, 1, 1.4333, 'ц000', 2),
(2672, 'фактично стандартною рибою', 'фактично стандартною рибою', 0, 1, 1.8667, 'ф000', 2),
(2671, 'фактично стандартною', 'фактично стандартною', 0, 1, 1.6667, 'ф000', 2),
(2670, 'фактично', 'фактично', 0, 0, 0.5333, 'ф000', 2),
(1717, 'текст', 'текст', 0, 0, 0.3333, 'т000', 4),
(2669, 'успішно пережила п''ять', 'успішно пережила п', 0, 1, 1.7333, 'у000', 2),
(2667, 'успішно', 'успішно', 0, 0, 0.4667, 'у000', 2),
(2668, 'успішно пережила', 'успішно пережила', 0, 1, 1.5333, 'у000', 2),
(1712, 'та', 'та', 0, 0, 0.1333, 'т000', 4),
(2666, 'текст риба що', 'текст риба що', 0, 1, 1.4333, 'т000', 2),
(2664, 'та склав на', 'та склав на', 0, 1, 1.3667, 'т000', 2),
(2665, 'текст риба', 'текст риба', 0, 1, 1.3333, 'т000', 2),
(2663, 'та склав', 'та склав', 0, 1, 1.2667, 'т000', 2),
(2661, 'та дизайні', 'та дизайні', 0, 1, 1.3333, 'т000', 2),
(2662, 'та дизайні lorem', 'та дизайні lorem', 0, 1, 1.5333, 'т465', 2),
(2659, 'тільки успішно', 'тільки успішно', 0, 1, 1.4667, 'т000', 2),
(2660, 'тільки успішно пережила', 'тільки успішно пережила', 0, 1, 1.7667, 'т000', 2),
(2658, 'тільки', 'тільки', 0, 0, 0.4, 'т000', 2),
(2655, 'сторіччя', 'сторіччя', 0, 0, 0.5333, 'с000', 2),
(2656, 'сторіччя коли', 'сторіччя коли', 0, 1, 1.4333, 'с000', 2),
(2657, 'сторіччя коли невідомий', 'сторіччя коли невідомий', 0, 1, 1.7667, 'с000', 2),
(2654, 'століть але й', 'століть але й', 0, 1, 1.4333, 'с000', 2),
(2652, 'століть', 'століть', 0, 0, 0.4667, 'с000', 2),
(2653, 'століть але', 'століть але', 0, 1, 1.3667, 'с000', 2),
(2650, 'стандартною рибою', 'стандартною рибою', 0, 1, 1.5667, 'с000', 2),
(2651, 'стандартною рибою аж', 'стандартною рибою аж', 0, 1, 1.6667, 'с000', 2),
(2648, 'склав на ній', 'склав на ній', 0, 1, 1.4, 'с000', 2),
(2649, 'стандартною', 'стандартною', 0, 0, 0.7333, 'с000', 2),
(2646, 'склав', 'склав', 0, 0, 0.3333, 'с000', 2),
(2647, 'склав на', 'склав на', 0, 1, 1.2667, 'с000', 2),
(2644, 'рибою аж з', 'рибою аж з', 0, 1, 1.3333, 'р000', 2),
(3608, 'росия2', 'росия2', 0, 0, 0.4, 'р000', 1),
(2642, 'рибою', 'рибою', 0, 0, 0.3333, 'р000', 2),
(2643, 'рибою аж', 'рибою аж', 0, 1, 1.2667, 'р000', 2),
(2641, 'риба що використовується', 'риба що використовується', 0, 1, 1.8, 'р000', 2),
(2640, 'риба що', 'риба що', 0, 1, 1.2333, 'р000', 2),
(2637, 'риба', 'риба', 0, 0, 0.2667, 'р000', 2),
(2638, 'риба не', 'риба не', 0, 1, 1.2333, 'р000', 2),
(2639, 'риба не тільки', 'риба не тільки', 0, 1, 1.4667, 'р000', 2),
(2636, 'прижилася в', 'прижилася в', 0, 1, 1.3667, 'п000', 2),
(3607, 'пинопласт росия2', 'пинопласт росия2', 0, 1, 1.5333, 'п000', 1),
(2635, 'прижилася', 'прижилася', 0, 0, 0.6, 'п000', 2),
(3606, 'пинопласт', 'пинопласт', 0, 0, 0.6, 'п000', 1),
(2631, 'пережила п''ять', 'пережила п', 0, 1, 1.4667, 'п000', 2),
(2632, 'пережила п''ять століть', 'пережила п століть', 0, 1, 1.7333, 'п000', 2),
(2630, 'пережила', 'пережила', 0, 0, 0.5333, 'п000', 2),
(2629, 'підбірку зразків шрифтів', 'підбірку зразків шрифтів', 0, 1, 1.8, 'п000', 2),
(2627, 'підбірку', 'підбірку', 0, 0, 0.5333, 'п000', 2),
(2628, 'підбірку зразків', 'підбірку зразків', 0, 1, 1.5333, 'п000', 2),
(2626, 'п''ять століть але', 'п століть але', 0, 1, 1.5667, 'п000', 2),
(2624, 'п''ять', 'п', 0, 0, 0.3333, 'п000', 2),
(2625, 'п''ять століть', 'п століть', 0, 1, 1.4333, 'п000', 2),
(2623, 'невідомий друкар взяв', 'невідомий друкар взяв', 0, 1, 1.7, 'н000', 2),
(2622, 'невідомий друкар', 'невідомий друкар', 0, 1, 1.5333, 'н000', 2),
(2621, 'невідомий', 'невідомий', 0, 0, 0.6, 'н000', 2),
(1666, 'на', 'на', 0, 0, 0.1333, 'н000', 4),
(2620, 'не тільки успішно', 'не тільки успішно', 0, 1, 1.5667, 'н000', 2),
(2619, 'не тільки', 'не тільки', 0, 1, 1.3, 'н000', 2),
(1662, 'м', 'м', 0, 0, 0.0667, 'м000', 3),
(2618, 'не', 'не', 0, 0, 0.1333, 'н000', 2),
(2617, 'на ній підбірку', 'на ній підбірку', 0, 1, 1.5, 'н000', 2),
(2616, 'на ній', 'на ній', 0, 1, 1.2, 'н000', 2),
(2615, 'ній підбірку зразків', 'ній підбірку зразків', 0, 1, 1.6667, 'н000', 2),
(2613, 'ній', 'ній', 0, 0, 0.2, 'н000', 2),
(2614, 'ній підбірку', 'ній підбірку', 0, 1, 1.4, 'н000', 2),
(2612, 'коли невідомий друкар', 'коли невідомий друкар', 0, 1, 1.7, 'к000', 2),
(2610, 'коли', 'коли', 0, 0, 0.2667, 'к000', 2),
(2611, 'коли невідомий', 'коли невідомий', 0, 1, 1.4667, 'к000', 2),
(2607, 'й', 'й', 0, 0, 0.0667, 'й000', 2),
(2608, 'й прижилася', 'й прижилася', 0, 1, 1.3667, 'й000', 2),
(2609, 'й прижилася в', 'й прижилася в', 0, 1, 1.4333, 'й000', 2),
(2606, 'зразків шрифтів риба', 'зразків шрифтів риба', 0, 1, 1.6667, 'з000', 2),
(2604, 'зразків', 'зразків', 0, 0, 0.4667, 'з000', 2),
(2605, 'зразків шрифтів', 'зразків шрифтів', 0, 1, 1.5, 'з000', 2),
(2601, 'з', 'з', 0, 0, 0.0667, 'з000', 2),
(2602, 'з xvi', 'з xvi', 0, 1, 1.1667, 'з210', 2),
(2603, 'з xvi сторіччя', 'з xvi сторіччя', 0, 1, 1.4667, 'з210', 2),
(2599, 'друкарстві та', 'друкарстві та', 0, 1, 1.4333, 'д000', 2),
(2600, 'друкарстві та дизайні', 'друкарстві та дизайні', 0, 1, 1.7, 'д000', 2),
(2598, 'друкарстві', 'друкарстві', 0, 0, 0.6667, 'д000', 2),
(2597, 'друкар взяв шрифтову', 'друкар взяв шрифтову', 0, 1, 1.6667, 'д000', 2),
(2596, 'друкар взяв', 'друкар взяв', 0, 1, 1.3667, 'д000', 2),
(1608, 'ipsum', 'ipsum', 0, 0, 0.3333, 'I125', 4),
(2595, 'друкар', 'друкар', 0, 0, 0.4, 'д000', 2),
(2594, 'дизайні lorem ipsum', 'дизайні lorem ipsum', 0, 1, 1.6333, 'д465125', 2),
(1611, 'lorem', 'lorem', 0, 0, 0.3333, 'L650', 4),
(1612, 'lorem ipsum', 'lorem ipsum', 0, 1, 1.3667, 'L65125', 4),
(2593, 'дизайні lorem', 'дизайні lorem', 0, 1, 1.4333, 'д465', 2),
(2592, 'дизайні', 'дизайні', 0, 0, 0.4667, 'д000', 2),
(2591, 'гранку та склав', 'гранку та склав', 0, 1, 1.5, 'г000', 2),
(2590, 'гранку та', 'гранку та', 0, 1, 1.3, 'г000', 2),
(2589, 'гранку', 'гранку', 0, 0, 0.4, 'г000', 2),
(2588, 'використовується в друкарстві', 'використовується в друкарстві', 0, 1, 1.9667, 'в000', 2),
(2587, 'використовується в', 'використовується в', 0, 1, 1.6, 'в000', 2),
(2586, 'використовується', 'використовується', 0, 0, 1, 'в000', 2),
(2585, 'взяв шрифтову гранку', 'взяв шрифтову гранку', 0, 1, 1.6667, 'в000', 2),
(1629, 'в', 'в', 0, 0, 0.0667, 'в000', 4),
(2583, 'взяв', 'взяв', 0, 0, 0.2667, 'в000', 2),
(2584, 'взяв шрифтову', 'взяв шрифтову', 0, 1, 1.4333, 'в000', 2),
(2582, 'в друкарстві та', 'в друкарстві та', 0, 1, 1.5, 'в000', 2),
(2581, 'в друкарстві', 'в друкарстві', 0, 1, 1.4, 'в000', 2),
(2579, 'але й', 'але й', 0, 1, 1.1667, 'а000', 2),
(2580, 'але й прижилася', 'але й прижилася', 0, 1, 1.5, 'а000', 2),
(2577, 'аж з xvi', 'аж з xvi', 0, 1, 1.2667, 'а210', 2),
(2578, 'але', 'але', 0, 0, 0.2, 'а000', 2),
(2575, 'аж', 'аж', 0, 0, 0.1333, 'а000', 2),
(2576, 'аж з', 'аж з', 0, 1, 1.1333, 'а000', 2),
(2574, 'є фактично стандартною', 'є фактично стандартною', 0, 1, 1.7333, 'є000', 2),
(2572, 'є', 'є', 0, 0, 0.0667, 'є000', 2),
(2573, 'є фактично', 'є фактично', 0, 1, 1.3333, 'є000', 2),
(2571, 'xvi сторіччя коли', 'xvi сторіччя коли', 0, 1, 1.5667, 'X100', 2),
(2570, 'xvi сторіччя', 'xvi сторіччя', 0, 1, 1.4, 'X100', 2),
(3605, 'rosiya2', 'rosiya2', 0, 0, 0.4667, 'R200', 1),
(2569, 'xvi', 'xvi', 0, 0, 0.2, 'X100', 2),
(3604, 'pinoplast rosiya2', 'pinoplast rosiya2', 0, 1, 1.5667, 'P5142362', 1),
(1735, 'що', 'що', 0, 0, 0.1333, 'щ000', 4),
(2565, 'lorem ipsum є', 'lorem ipsum є', 0, 1, 1.4333, 'L65125', 2),
(3603, 'pinoplast', 'pinoplast', 0, 0, 0.6, 'P51423', 1),
(3602, '29', '29', 0, 0, 0.2, '', 1),
(2563, 'ipsum є', 'ipsum є', 0, 1, 1.2333, 'I125', 2),
(2564, 'ipsum є фактично', 'ipsum є фактично', 0, 1, 1.5333, 'I125', 2),
(2422, 'яка', 'яка', 0, 0, 0.2, 'я000', 2),
(2423, 'яка оцінює', 'яка оцінює', 0, 1, 1.3333, 'я000', 2),
(2424, 'яка оцінює композицію', 'яка оцінює композицію', 0, 1, 1.7, 'я000', 2),
(2421, 'які знаходяться ще', 'які знаходяться ще', 0, 1, 1.6, 'я000', 2),
(2420, 'які знаходяться', 'які знаходяться', 0, 1, 1.5, 'я000', 2),
(2419, 'які', 'які', 0, 0, 0.2, 'я000', 3),
(2418, 'як зразок і', 'як зразок і', 0, 1, 1.3667, 'я000', 2),
(2416, 'як', 'як', 0, 0, 0.1333, 'я000', 2),
(2417, 'як зразок', 'як зразок', 0, 1, 1.3, 'я000', 2),
(2415, 'що читабельний зміст', 'що читабельний зміст', 0, 1, 1.6667, 'щ000', 2),
(2414, 'що читабельний', 'що читабельний', 0, 1, 1.4667, 'щ000', 2),
(2412, 'що цей', 'що цей', 0, 1, 1.2, 'щ000', 2),
(2413, 'що цей текст', 'що цей текст', 0, 1, 1.4, 'щ000', 2),
(2410, 'ще в', 'ще в', 0, 1, 1.1333, 'щ000', 2),
(2411, 'ще в зародковому', 'ще в зародковому', 0, 1, 1.5333, 'щ000', 2),
(2409, 'ще', 'ще', 0, 0, 0.1333, 'щ000', 2),
(2408, 'читабельний зміст буде', 'читабельний зміст буде', 0, 1, 1.7333, 'ч000', 2),
(2407, 'читабельний зміст', 'читабельний зміст', 0, 1, 1.5667, 'ч000', 2),
(2406, 'читабельний', 'читабельний', 0, 0, 0.7333, 'ч000', 2),
(2405, 'цей текст має', 'цей текст має', 0, 1, 1.4333, 'ц000', 2),
(2404, 'цей текст', 'цей текст', 0, 1, 1.3, 'ц000', 2),
(2402, 'це робить текст', 'це робить текст', 0, 1, 1.5, 'ц000', 2),
(2403, 'цей', 'цей', 0, 0, 0.2, 'ц000', 2),
(2401, 'це робить', 'це робить', 0, 1, 1.3, 'ц000', 2),
(2400, 'тут іде текст', 'тут іде текст', 0, 1, 1.4333, 'т000', 2),
(2397, 'тому що цей', 'тому що цей', 0, 1, 1.3667, 'т000', 2),
(2398, 'тут', 'тут', 0, 0, 0.2, 'т000', 2),
(2399, 'тут іде', 'тут іде', 0, 1, 1.2333, 'т000', 2),
(2395, 'тому', 'тому', 0, 0, 0.2667, 'т000', 2),
(2396, 'тому що', 'тому що', 0, 1, 1.2333, 'т000', 2),
(2394, 'терміном lorem ipsum', 'терміном lorem ipsum', 0, 1, 1.6667, 'т465125', 2),
(2393, 'терміном lorem', 'терміном lorem', 0, 1, 1.4667, 'т465', 2),
(2392, 'терміном', 'терміном', 0, 0, 0.5333, 'т000', 2),
(2390, 'текст це', 'текст це', 0, 1, 1.2667, 'т000', 2),
(2391, 'текст це робить', 'текст це робить', 0, 1, 1.5, 'т000', 2),
(2388, 'текст тут', 'текст тут', 0, 1, 1.3, 'т000', 2),
(2389, 'текст тут іде', 'текст тут іде', 0, 1, 1.4333, 'т000', 2),
(2386, 'текст схожим', 'текст схожим', 0, 1, 1.4, 'т000', 2),
(2387, 'текст схожим на', 'текст схожим на', 0, 1, 1.5, 'т000', 2),
(2384, 'текст має', 'текст має', 0, 1, 1.3, 'т000', 2),
(2385, 'текст має більш-менш', 'текст має більш-менш', 0, 1, 1.6667, 'т000', 2),
(2383, 'та веб-дизайну використовують', 'та веб-дизайну використовують', 0, 1, 1.9667, 'т000', 2),
(2382, 'та веб-дизайну', 'та веб-дизайну', 0, 1, 1.4667, 'т000', 2),
(2381, 'схожим на оповідний', 'схожим на оповідний', 0, 1, 1.6333, 'с000', 2),
(2379, 'схожим', 'схожим', 0, 0, 0.4, 'с000', 2),
(2380, 'схожим на', 'схожим на', 0, 1, 1.3, 'с000', 2),
(2378, 'сторінки сенс використання', 'сторінки сенс використання', 0, 1, 1.8667, 'с000', 2),
(2376, 'сторінки', 'сторінки', 0, 0, 0.5333, 'с000', 2),
(2377, 'сторінки сенс', 'сторінки сенс', 0, 1, 1.4333, 'с000', 2),
(2375, 'створено зумисно зокрема', 'створено зумисно зокрема', 0, 1, 1.8, 'с000', 2),
(2374, 'створено зумисно', 'створено зумисно', 0, 1, 1.5333, 'с000', 2),
(2373, 'створено', 'створено', 0, 0, 0.5333, 'с000', 2),
(2372, 'стані різні версії', 'стані різні версії', 0, 1, 1.6, 'с000', 2),
(2370, 'стані', 'стані', 0, 0, 0.3333, 'с000', 2),
(2371, 'стані різні', 'стані різні', 0, 1, 1.3667, 'с000', 2),
(2369, 'сенс використання lorem', 'сенс використання lorem', 0, 1, 1.7667, 'с465', 2),
(2367, 'сенс', 'сенс', 0, 0, 0.2667, 'с000', 2),
(2368, 'сенс використання', 'сенс використання', 0, 1, 1.5667, 'с000', 2),
(2365, 'роки деякі', 'роки деякі', 0, 1, 1.3333, 'р000', 2),
(2366, 'роки деякі випадково', 'роки деякі випадково', 0, 1, 1.6667, 'р000', 2),
(2364, 'роки', 'роки', 0, 0, 0.2667, 'р000', 2),
(2363, 'розподілення літер на', 'розподілення літер на', 0, 1, 1.7, 'р000', 2),
(2362, 'розподілення літер', 'розподілення літер', 0, 1, 1.6, 'р000', 2),
(2360, 'робить текст схожим', 'робить текст схожим', 0, 1, 1.6333, 'р000', 2),
(2361, 'розподілення', 'розподілення', 0, 0, 0.8, 'р000', 2),
(2359, 'робить текст', 'робить текст', 0, 1, 1.4, 'р000', 2),
(2358, 'робить', 'робить', 0, 0, 0.4, 'р000', 2),
(2357, 'різні версії lorem', 'різні версії lorem', 0, 1, 1.6, 'р465', 3),
(2356, 'різні версії', 'різні версії', 0, 1, 1.4, 'р000', 3),
(2354, 'програм верстування та', 'програм верстування та', 0, 1, 1.7333, 'п000', 2),
(2355, 'різні', 'різні', 0, 0, 0.3333, 'р000', 3),
(2351, 'пошук за терміном', 'пошук за терміном', 0, 1, 1.5667, 'п000', 2),
(2352, 'програм', 'програм', 0, 0, 0.4667, 'п000', 2),
(2353, 'програм верстування', 'програм верстування', 0, 1, 1.6333, 'п000', 2),
(2350, 'пошук за', 'пошук за', 0, 1, 1.2667, 'п000', 2),
(2348, 'полягає в тому', 'полягає в тому', 0, 1, 1.4667, 'п000', 2),
(2349, 'пошук', 'пошук', 0, 0, 0.3333, 'п000', 2),
(2346, 'полягає', 'полягає', 0, 0, 0.4667, 'п000', 2),
(2347, 'полягає в', 'полягає в', 0, 1, 1.3, 'п000', 2),
(2838, 'плинтус греция', 'плинтус греция', 0, 1, 1.4667, 'п000', 1),
(2837, 'плинтус', 'плинтус', 0, 0, 0.4667, 'п000', 1),
(2343, 'оцінює композицію сторінки', 'оцінює композицію сторінки', 0, 1, 1.8667, 'о000', 2),
(2341, 'оцінює', 'оцінює', 0, 0, 0.4, 'о000', 2),
(2342, 'оцінює композицію', 'оцінює композицію', 0, 1, 1.5667, 'о000', 2),
(2340, 'оповідний багато програм', 'оповідний багато програм', 0, 1, 1.8, 'о000', 2),
(2338, 'оповідний', 'оповідний', 0, 0, 0.6, 'о000', 2),
(2339, 'оповідний багато', 'оповідний багато', 0, 1, 1.5333, 'о000', 2),
(2337, 'нормальне розподілення літер', 'нормальне розподілення літер', 0, 1, 1.9333, 'н000', 2),
(2335, 'нормальне', 'нормальне', 0, 0, 0.6, 'н000', 2),
(2336, 'нормальне розподілення', 'нормальне розподілення', 0, 1, 1.7333, 'н000', 2),
(2334, 'наприклад тут іде', 'наприклад тут іде', 0, 1, 1.5667, 'н000', 2),
(2332, 'наприклад', 'наприклад', 0, 0, 0.6, 'н000', 2),
(2333, 'наприклад тут', 'наприклад тут', 0, 1, 1.4333, 'н000', 2),
(2330, 'на оповідний', 'на оповідний', 0, 1, 1.4, 'н000', 2),
(2331, 'на оповідний багато', 'на оповідний багато', 0, 1, 1.6333, 'н000', 2),
(2328, 'на відміну', 'на відміну', 0, 1, 1.3333, 'н000', 2),
(2329, 'на відміну від', 'на відміну від', 0, 1, 1.4667, 'н000', 2),
(2327, 'минулі роки деякі', 'минулі роки деякі', 0, 1, 1.5667, 'м000', 2),
(2325, 'минулі', 'минулі', 0, 0, 0.4, 'м000', 2),
(2326, 'минулі роки', 'минулі роки', 0, 1, 1.3667, 'м000', 2),
(2324, 'має більш-менш нормальне', 'має більш-менш нормальне', 0, 1, 1.8, 'м000', 2),
(2323, 'має більш-менш', 'має більш-менш', 0, 1, 1.4667, 'м000', 2),
(2322, 'має', 'має', 0, 0, 0.2, 'м000', 2),
(2320, 'людині яка', 'людині яка', 0, 1, 1.3333, 'л000', 2),
(2321, 'людині яка оцінює', 'людині яка оцінює', 0, 1, 1.5667, 'л000', 2),
(2317, 'літер на', 'літер на', 0, 1, 1.2667, 'л000', 2),
(2318, 'літер на відміну', 'літер на відміну', 0, 1, 1.5333, 'л000', 2),
(2319, 'людині', 'людині', 0, 0, 0.4, 'л000', 2),
(2316, 'літер', 'літер', 0, 0, 0.3333, 'л000', 2),
(2315, 'композицію сторінки сенс', 'композицію сторінки сенс', 0, 1, 1.8, 'к000', 2),
(2314, 'композицію сторінки', 'композицію сторінки', 0, 1, 1.6333, 'к000', 2),
(2312, 'зумисно зокрема жартівливі', 'зумисно зокрема жартівливі', 0, 1, 1.8667, 'з000', 2),
(2313, 'композицію', 'композицію', 0, 0, 0.6667, 'к000', 2),
(2310, 'зумисно', 'зумисно', 0, 0, 0.4667, 'з000', 2),
(2311, 'зумисно зокрема', 'зумисно зокрема', 0, 1, 1.5, 'з000', 2),
(2309, 'зразок і пошук', 'зразок і пошук', 0, 1, 1.4667, 'з000', 2),
(2307, 'зразок', 'зразок', 0, 0, 0.4, 'з000', 2),
(2308, 'зразок і', 'зразок і', 0, 1, 1.2667, 'з000', 2),
(2306, 'зосередитись людині яка', 'зосередитись людині яка', 0, 1, 1.7667, 'з000', 2),
(2304, 'зосередитись', 'зосередитись', 0, 0, 0.8, 'з000', 2),
(2305, 'зосередитись людині', 'зосередитись людині', 0, 1, 1.6333, 'з000', 2),
(2303, 'зокрема жартівливі', 'зокрема жартівливі', 0, 1, 1.6, 'з000', 2),
(2302, 'зокрема', 'зокрема', 0, 0, 0.4667, 'з000', 2),
(2301, 'знаходяться ще в', 'знаходяться ще в', 0, 1, 1.5333, 'з000', 2),
(2300, 'знаходяться ще', 'знаходяться ще', 0, 1, 1.4667, 'з000', 2),
(2298, 'зміст буде заважати', 'зміст буде заважати', 0, 1, 1.6333, 'з000', 2),
(2299, 'знаходяться', 'знаходяться', 0, 0, 0.7333, 'з000', 2),
(2296, 'зміст', 'зміст', 0, 0, 0.3333, 'з000', 2),
(2297, 'зміст буде', 'зміст буде', 0, 1, 1.3333, 'з000', 2),
(2295, 'зародковому стані різні', 'зародковому стані різні', 0, 1, 1.7667, 'з000', 2),
(2294, 'зародковому стані', 'зародковому стані', 0, 1, 1.5667, 'з000', 2),
(2293, 'зародковому', 'зародковому', 0, 0, 0.7333, 'з000', 2),
(2292, 'заважати зосередитись людині', 'заважати зосередитись людині', 0, 1, 1.9333, 'з000', 2),
(2290, 'заважати', 'заважати', 0, 0, 0.5333, 'з000', 2),
(2291, 'заважати зосередитись', 'заважати зосередитись', 0, 1, 1.7, 'з000', 2),
(2289, 'за терміном lorem', 'за терміном lorem', 0, 1, 1.5667, 'з465', 2),
(2288, 'за терміном', 'за терміном', 0, 1, 1.3667, 'з000', 2),
(2285, 'за', 'за', 0, 0, 0.1333, 'з000', 2),
(2286, 'за минулі', 'за минулі', 0, 1, 1.3, 'з000', 2),
(2287, 'за минулі роки', 'за минулі роки', 0, 1, 1.4667, 'з000', 2),
(2282, 'з''явились', 'з', 0, 0, 0.6, 'з000', 2),
(2283, 'з''явились за', 'з за', 0, 1, 1.4, 'з000', 2),
(2284, 'з''явились за минулі', 'з за минулі', 0, 1, 1.6333, 'з000', 2),
(2281, 'жартівливі', 'жартівливі', 0, 0, 0.6667, 'ж000', 2),
(2279, 'деякі випадково', 'деякі випадково', 0, 1, 1.5, 'д000', 2),
(2280, 'деякі випадково деякі', 'деякі випадково деякі', 0, 1, 1.7, 'д000', 2),
(2277, 'деякі було', 'деякі було', 0, 1, 1.3333, 'д000', 2),
(2278, 'деякі було створено', 'деякі було створено', 0, 1, 1.6333, 'д000', 2),
(2275, 'давно відомо що', 'давно відомо що', 0, 1, 1.5, 'д000', 2),
(2276, 'деякі', 'деякі', 0, 0, 0.3333, 'д000', 2),
(2274, 'давно відомо', 'давно відомо', 0, 1, 1.4, 'д000', 2),
(2835, 'plintus greciya', 'plintus greciya', 0, 1, 1.5, 'P453262', 1),
(2273, 'давно', 'давно', 0, 0, 0.3333, 'д000', 2),
(2271, 'випадково деякі було', 'випадково деякі було', 0, 1, 1.6667, 'в000', 2),
(2270, 'випадково деякі', 'випадково деякі', 0, 1, 1.5, 'в000', 2),
(2269, 'випадково', 'випадково', 0, 0, 0.6, 'в000', 2),
(2268, 'використовують lorem ipsum', 'використовують lorem ipsum', 0, 1, 1.8667, 'в465125', 2),
(2266, 'використовують', 'використовують', 0, 0, 0.9333, 'в000', 2),
(2267, 'використовують lorem', 'використовують lorem', 0, 1, 1.6667, 'в465', 2),
(2265, 'використання lorem ipsum', 'використання lorem ipsum', 0, 1, 1.8, 'в465125', 2),
(2264, 'використання lorem', 'використання lorem', 0, 1, 1.6, 'в465', 2),
(2263, 'використання', 'використання', 0, 0, 0.8, 'в000', 2),
(2262, 'вже давно відомо', 'вже давно відомо', 0, 1, 1.5333, 'в000', 2),
(2260, 'вже', 'вже', 0, 0, 0.2, 'в000', 2),
(2261, 'вже давно', 'вже давно', 0, 1, 1.3, 'в000', 2),
(2259, 'верстування та веб-дизайну', 'верстування та веб-дизайну', 0, 1, 1.8667, 'в000', 2),
(2257, 'верстування', 'верстування', 0, 0, 0.7333, 'в000', 3),
(2258, 'верстування та', 'верстування та', 0, 1, 1.4667, 'в000', 2),
(2256, 'версії lorem ipsum', 'версії lorem ipsum', 0, 1, 1.6, 'в465125', 3),
(2254, 'версії', 'версії', 0, 0, 0.4, 'в000', 3),
(2255, 'версії lorem', 'версії lorem', 0, 1, 1.4, 'в465', 3),
(2253, 'веб-сайтів які знаходяться', 'веб-сайтів які знаходяться', 0, 1, 1.8667, 'в000', 2),
(2252, 'веб-сайтів які', 'веб-сайтів які', 0, 1, 1.4667, 'в000', 2),
(2251, 'веб-сайтів', 'веб-сайтів', 0, 0, 0.6667, 'в000', 2),
(2250, 'веб-дизайну використовують lorem', 'веб-дизайну використовують lorem', 0, 1, 2, 'в465', 2),
(2249, 'веб-дизайну використовують', 'веб-дизайну використовують', 0, 1, 1.8667, 'в000', 2),
(2248, 'веб-дизайну', 'веб-дизайну', 0, 0, 0.7333, 'в000', 2),
(2247, 'відомо що читабельний', 'відомо що читабельний', 0, 1, 1.7, 'в000', 2),
(2246, 'відомо що', 'відомо що', 0, 1, 1.3, 'в000', 2),
(2245, 'відомо', 'відомо', 0, 0, 0.4, 'в000', 2),
(2244, 'відміну від наприклад', 'відміну від наприклад', 0, 1, 1.7, 'в000', 2),
(2243, 'відміну від', 'відміну від', 0, 1, 1.3667, 'в000', 2),
(2242, 'відміну', 'відміну', 0, 0, 0.4667, 'в000', 2),
(2241, 'відкриє багато веб-сайтів', 'відкриє багато веб-сайтів', 0, 1, 1.8333, 'в000', 2),
(2239, 'відкриє', 'відкриє', 0, 0, 0.4667, 'в000', 2),
(2240, 'відкриє багато', 'відкриє багато', 0, 1, 1.4667, 'в000', 2),
(2238, 'від наприклад тут', 'від наприклад тут', 0, 1, 1.5667, 'в000', 2),
(2236, 'від', 'від', 0, 0, 0.2, 'в000', 2),
(2237, 'від наприклад', 'від наприклад', 0, 1, 1.4333, 'в000', 2),
(2235, 'в тому що', 'в тому що', 0, 1, 1.3, 'в000', 2),
(2234, 'в тому', 'в тому', 0, 1, 1.2, 'в000', 2),
(2233, 'в зародковому стані', 'в зародковому стані', 0, 1, 1.6333, 'в000', 2),
(2232, 'в зародковому', 'в зародковому', 0, 1, 1.4333, 'в000', 2),
(2231, 'було створено зумисно', 'було створено зумисно', 0, 1, 1.7, 'б000', 2),
(2229, 'було', 'було', 0, 0, 0.2667, 'б000', 2),
(2230, 'було створено', 'було створено', 0, 1, 1.4333, 'б000', 2),
(2228, 'буде заважати зосередитись', 'буде заважати зосередитись', 0, 1, 1.8667, 'б000', 2),
(2226, 'буде', 'буде', 0, 0, 0.2667, 'б000', 2),
(2227, 'буде заважати', 'буде заважати', 0, 1, 1.4333, 'б000', 2),
(2225, 'багато програм верстування', 'багато програм верстування', 0, 1, 1.8667, 'б000', 2),
(2224, 'багато програм', 'багато програм', 0, 1, 1.4667, 'б000', 2),
(2223, 'багато веб-сайтів які', 'багато веб-сайтів які', 0, 1, 1.7, 'б000', 2),
(2222, 'багато веб-сайтів', 'багато веб-сайтів', 0, 1, 1.5667, 'б000', 2),
(2221, 'багато', 'багато', 0, 0, 0.4, 'б000', 2),
(2220, 'більш-менш нормальне розподілення', 'більш-менш нормальне розподілення', 0, 1, 2, 'б000', 2),
(2219, 'більш-менш нормальне', 'більш-менш нормальне', 0, 1, 1.6667, 'б000', 2),
(2218, 'більш-менш', 'більш-менш', 0, 0, 0.6667, 'б000', 2),
(2216, 'іде текст тут', 'іде текст тут', 0, 1, 1.4333, 'і000', 2),
(2217, 'іде текст це', 'іде текст це', 0, 1, 1.4, 'і000', 2),
(2215, 'іде текст', 'іде текст', 0, 1, 1.3, 'і000', 2),
(2213, 'і пошук за', 'і пошук за', 0, 1, 1.3333, 'і000', 2),
(2214, 'іде', 'іде', 0, 0, 0.2, 'і000', 2),
(2836, 'греция', 'греция', 0, 0, 0.4, 'г000', 1),
(2834, 'plintus', 'plintus', 0, 0, 0.4667, 'P4532', 1),
(2211, 'і', 'і', 0, 0, 0.0667, 'і000', 3),
(2212, 'і пошук', 'і пошук', 0, 1, 1.2333, 'і000', 2),
(2208, 'lorem ipsum як', 'lorem ipsum як', 0, 1, 1.4667, 'L65125', 2),
(2207, 'lorem ipsum полягає', 'lorem ipsum полягає', 0, 1, 1.6333, 'L65125', 2),
(2206, 'lorem ipsum з''явились', 'lorem ipsum з', 0, 1, 1.7, 'L65125', 2),
(2205, 'lorem ipsum відкриє', 'lorem ipsum відкриє', 0, 1, 1.6333, 'L65125', 2),
(2204, 'ipsum як зразок', 'ipsum як зразок', 0, 1, 1.5, 'I125', 2),
(2203, 'ipsum як', 'ipsum як', 0, 1, 1.2667, 'I125', 2),
(2833, 'greciya', 'greciya', 0, 0, 0.4667, 'G620', 1),
(2197, 'ipsum відкриє', 'ipsum відкриє', 0, 1, 1.4333, 'I125', 2),
(2198, 'ipsum відкриє багато', 'ipsum відкриє багато', 0, 1, 1.6667, 'I125', 2),
(2199, 'ipsum з''явились', 'ipsum з', 0, 1, 1.5, 'I125', 2),
(2200, 'ipsum з''явились за', 'ipsum з за', 0, 1, 1.6, 'I125', 2),
(2201, 'ipsum полягає', 'ipsum полягає', 0, 1, 1.4333, 'I125', 2),
(2202, 'ipsum полягає в', 'ipsum полягає в', 0, 1, 1.5, 'I125', 2),
(2851, 'италия', 'италия', 0, 0, 0.4, 'и000', 1),
(2850, 'зокрема жартівливі вже', 'зокрема жартівливі вже', 0, 1, 1.7333, 'з000', 1),
(2849, 'жартівливі вже давно', 'жартівливі вже давно', 0, 1, 1.6667, 'ж000', 1),
(2848, 'жартівливі вже', 'жартівливі вже', 0, 1, 1.4667, 'ж000', 1),
(2847, 'водосточная италия', 'водосточная италия', 0, 1, 1.6, 'в000', 1),
(2846, 'водосточная', 'водосточная', 0, 0, 0.7333, 'в000', 1),
(2845, 'vodostochnaya italiya', 'vodostochnaya italiya', 0, 1, 1.7, 'V3232534', 1),
(2844, 'vodostochnaya', 'vodostochnaya', 0, 0, 0.8667, 'V32325', 1),
(2843, 'truba vodostochnaya italiya', 'truba vodostochnaya italiya', 0, 1, 1.9, 'T613232534', 1),
(2842, 'truba vodostochnaya', 'truba vodostochnaya', 0, 1, 1.6333, 'T6132325', 1),
(2841, 'truba', 'truba', 0, 0, 0.3333, 'T610', 1),
(2840, 'italiya', 'italiya', 0, 0, 0.4667, 'I340', 1),
(2839, '32', '32', 0, 0, 0.2, '', 1),
(3601, 'які містили уривки', 'які містили уривки', 0, 1, 1.6, 'я000', 1),
(3598, 'які використовували', 'які використовували', 0, 1, 1.6333, 'я000', 1),
(3600, 'які містили', 'які містили', 0, 1, 1.3667, 'я000', 1),
(3599, 'які використовували різні', 'які використовували різні', 0, 1, 1.8333, 'я000', 1),
(3595, 'уривки з lorem', 'уривки з lorem', 0, 1, 1.4667, 'у465', 1),
(3596, 'шрифтів letraset', 'шрифтів letraset', 0, 1, 1.5333, 'ш43623', 1),
(3597, 'шрифтів letraset які', 'шрифтів letraset які', 0, 1, 1.6667, 'ш43623', 1),
(3593, 'уривки', 'уривки', 0, 0, 0.4, 'у000', 1),
(3594, 'уривки з', 'уривки з', 0, 1, 1.2667, 'у000', 1),
(3588, 'суті', 'суті', 0, 0, 0.2667, 'с000', 1),
(3589, 'суті незмінною', 'суті незмінною', 0, 1, 1.4667, 'с000', 1),
(3590, 'суті незмінною вона', 'суті незмінною вона', 0, 1, 1.6333, 'с000', 1),
(3591, 'тестовый', 'тестовый', 0, 0, 0.5333, 'т000', 1),
(3592, 'тестовый товар', 'тестовый товар', 0, 1, 1.4667, 'т000', 1),
(3587, 'сторіччя завдяки виданню', 'сторіччя завдяки виданню', 0, 1, 1.8, 'с000', 1),
(3586, 'сторіччя завдяки', 'сторіччя завдяки', 0, 1, 1.5333, 'с000', 1),
(3583, 'роках', 'роках', 0, 0, 0.3333, 'р000', 1),
(3584, 'роках минулого', 'роках минулого', 0, 1, 1.4667, 'р000', 1);
INSERT INTO `bzrnp_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`) VALUES
(3585, 'роках минулого сторіччя', 'роках минулого сторіччя', 0, 1, 1.7667, 'р000', 1),
(3577, 'популяризувалась в', 'популяризувалась в', 0, 1, 1.6, 'п000', 1),
(3578, 'популяризувалась в 60-их', 'популяризувалась в 60-их', 0, 1, 1.8, 'п000', 1),
(3579, 'прижилася в електронному', 'прижилася в електронному', 0, 1, 1.8, 'п000', 1),
(3582, 'програмам комп''ютерного верстування', 'програмам комп верстування', 0, 1, 2, 'п000', 1),
(3580, 'програмам', 'програмам', 0, 0, 0.6, 'п000', 1),
(3581, 'програмам комп''ютерного', 'програмам комп', 0, 1, 1.7667, 'п000', 1),
(3576, 'популяризувалась', 'популяризувалась', 0, 0, 1, 'п000', 1),
(3574, 'по суті', 'по суті', 0, 1, 1.2333, 'п000', 1),
(3575, 'по суті незмінною', 'по суті незмінною', 0, 1, 1.5667, 'п000', 1),
(3572, 'нещодавно завдяки', 'нещодавно завдяки', 0, 1, 1.5667, 'н000', 1),
(3573, 'нещодавно завдяки програмам', 'нещодавно завдяки програмам', 0, 1, 1.9, 'н000', 1),
(3570, 'незмінною вона популяризувалась', 'незмінною вона популяризувалась', 0, 1, 2, 'н000', 1),
(3571, 'нещодавно', 'нещодавно', 0, 0, 0.6, 'н000', 1),
(3568, 'незмінною', 'незмінною', 0, 0, 0.6, 'н000', 1),
(3569, 'незмінною вона', 'незмінною вона', 0, 1, 1.4667, 'н000', 1),
(3565, 'минулого сторіччя завдяки', 'минулого сторіччя завдяки', 0, 1, 1.8333, 'м000', 1),
(3566, 'на кшталт', 'на кшталт', 0, 1, 1.3, 'н000', 1),
(3567, 'на кшталт aldus', 'на кшталт aldus', 0, 1, 1.5, 'н432', 1),
(3564, 'минулого сторіччя', 'минулого сторіччя', 0, 1, 1.5667, 'м000', 1),
(3563, 'минулого', 'минулого', 0, 0, 0.5333, 'м000', 1),
(3561, 'містили уривки', 'містили уривки', 0, 1, 1.4667, 'м000', 1),
(3562, 'містили уривки з', 'містили уривки з', 0, 1, 1.5333, 'м000', 1),
(3560, 'містили', 'містили', 0, 0, 0.4667, 'м000', 1),
(3559, 'кшталт aldus pagemaker', 'кшталт aldus pagemaker', 0, 1, 1.7333, 'к43212526', 1),
(3555, 'комп''ютерного верстування', 'комп верстування', 0, 1, 1.8333, 'к000', 1),
(3557, 'кшталт', 'кшталт', 0, 0, 0.4, 'к000', 1),
(3558, 'кшталт aldus', 'кшталт aldus', 0, 1, 1.4, 'к432', 1),
(3556, 'комп''ютерного верстування на', 'комп верстування на', 0, 1, 1.9333, 'к000', 1),
(3554, 'комп''ютерного', 'комп', 0, 0, 0.8667, 'к000', 1),
(3553, 'зразків шрифтів letraset', 'зразків шрифтів letraset', 0, 1, 1.8, 'з43623', 1),
(3551, 'залишаючись по', 'залишаючись по', 0, 1, 1.4667, 'з000', 1),
(3552, 'залишаючись по суті', 'залишаючись по суті', 0, 1, 1.6333, 'з000', 1),
(3549, 'завдяки програмам комп''ютерного', 'завдяки програмам комп', 0, 1, 2, 'з000', 1),
(3550, 'залишаючись', 'залишаючись', 0, 0, 0.7333, 'з000', 1),
(3548, 'завдяки програмам', 'завдяки програмам', 0, 1, 1.5667, 'з000', 1),
(3547, 'завдяки виданню зразків', 'завдяки виданню зразків', 0, 1, 1.7667, 'з000', 1),
(3540, 'електронному', 'електронному', 0, 0, 0.8, 'е000', 1),
(3541, 'електронному верстуванні', 'електронному верстуванні', 0, 1, 1.8, 'е000', 1),
(3542, 'електронному верстуванні залишаючись', 'електронному верстуванні залишаючись', 0, 1, 2, 'е000', 1),
(3544, 'з lorem ipsum', 'з lorem ipsum', 0, 1, 1.4333, 'з465125', 1),
(3545, 'завдяки', 'завдяки', 0, 0, 0.4667, 'з000', 1),
(3546, 'завдяки виданню', 'завдяки виданню', 0, 1, 1.5, 'з000', 1),
(3537, 'вона', 'вона', 0, 0, 0.2667, 'в000', 1),
(3538, 'вона популяризувалась', 'вона популяризувалась', 0, 1, 1.7, 'в000', 1),
(2852, 'труба', 'труба', 0, 0, 0.3333, 'т000', 1),
(2853, 'труба водосточная', 'труба водосточная', 0, 1, 1.5667, 'т000', 1),
(2854, 'труба водосточная италия', 'труба водосточная италия', 0, 1, 1.8, 'т000', 1),
(3543, 'з lorem', 'з lorem', 0, 1, 1.2333, 'з465', 1),
(3539, 'вона популяризувалась в', 'вона популяризувалась в', 0, 1, 1.7667, 'в000', 1),
(3535, 'використовували різні', 'використовували різні', 0, 1, 1.7, 'в000', 1),
(3536, 'використовували різні версії', 'використовували різні версії', 0, 1, 1.9333, 'в000', 1),
(3532, 'виданню зразків', 'виданню зразків', 0, 1, 1.5, 'в000', 1),
(3533, 'виданню зразків шрифтів', 'виданню зразків шрифтів', 0, 1, 1.7667, 'в000', 1),
(3534, 'використовували', 'використовували', 0, 0, 1, 'в000', 1),
(3527, 'верстуванні залишаючись', 'верстуванні залишаючись', 0, 1, 1.7667, 'в000', 1),
(3528, 'верстуванні залишаючись по', 'верстуванні залишаючись по', 0, 1, 1.8667, 'в000', 1),
(3531, 'виданню', 'виданню', 0, 0, 0.4667, 'в000', 1),
(3530, 'верстування на кшталт', 'верстування на кшталт', 0, 1, 1.7, 'в000', 1),
(3529, 'верстування на', 'верстування на', 0, 1, 1.4667, 'в000', 1),
(3526, 'верстуванні', 'верстуванні', 0, 0, 0.7333, 'в000', 1),
(3522, 'в електронному верстуванні', 'в електронному верстуванні', 0, 1, 1.8667, 'в000', 1),
(3525, 'вдруге нещодавно завдяки', 'вдруге нещодавно завдяки', 0, 1, 1.8, 'в000', 1),
(3524, 'вдруге нещодавно', 'вдруге нещодавно', 0, 1, 1.5333, 'в000', 1),
(3523, 'вдруге', 'вдруге', 0, 0, 0.4, 'в000', 1),
(3521, 'в електронному', 'в електронному', 0, 1, 1.4667, 'в000', 1),
(3520, 'в 60-их роках', 'в 60-их роках', 0, 1, 1.4333, 'в000', 1),
(3519, 'в 60-их', 'в 60-их', 0, 1, 1.2333, 'в000', 1),
(3517, 'і вдруге', 'і вдруге', 0, 1, 1.2667, 'і000', 1),
(3518, 'і вдруге нещодавно', 'і вдруге нещодавно', 0, 1, 1.6, 'і000', 1),
(3515, 'testovyj', 'testovyj', 0, 0, 0.5333, 'T2312', 1),
(3516, 'testovyj tovar', 'testovyj tovar', 0, 1, 1.4667, 'T2312316', 1),
(3514, 'pagemaker які використовували', 'pagemaker які використовували', 0, 1, 1.9667, 'P2526', 1),
(3513, 'pagemaker які', 'pagemaker які', 0, 1, 1.4333, 'P2526', 1),
(3512, 'pagemaker', 'pagemaker', 0, 0, 0.6, 'P2526', 1),
(3511, 'lorem ipsum це', 'lorem ipsum це', 0, 1, 1.4667, 'L65125', 1),
(3510, 'lorem ipsum і', 'lorem ipsum і', 0, 1, 1.4333, 'L65125', 1),
(3509, 'letraset які містили', 'letraset які містили', 0, 1, 1.6667, 'L3623', 1),
(3508, 'letraset які', 'letraset які', 0, 1, 1.4, 'L3623', 1),
(3507, 'letraset', 'letraset', 0, 0, 0.5333, 'L3623', 1),
(3506, 'ipsum це текст', 'ipsum це текст', 0, 1, 1.4667, 'I125', 1),
(3505, 'ipsum це', 'ipsum це', 0, 1, 1.2667, 'I125', 1),
(3503, 'ipsum і', 'ipsum і', 0, 1, 1.2333, 'I125', 1),
(3504, 'ipsum і вдруге', 'ipsum і вдруге', 0, 1, 1.4667, 'I125', 1),
(3502, 'aldus pagemaker які', 'aldus pagemaker які', 0, 1, 1.6333, 'A43212526', 1),
(3501, 'aldus pagemaker', 'aldus pagemaker', 0, 1, 1.5, 'A43212526', 1),
(3500, 'aldus', 'aldus', 0, 0, 0.3333, 'A432', 1),
(3498, '60-их роках', '60-их роках', 0, 1, 1.3667, 'и000', 1),
(3499, '60-их роках минулого', '60-их роках минулого', 0, 1, 1.6667, 'и000', 1),
(3497, '60-их', '60-их', 0, 0, 0.3333, 'и000', 1),
(3496, '31', '31', 0, 0, 0.2, '', 1);

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
-- Структура таблицы `bzrnp_foxcontact_sessions`
--

CREATE TABLE IF NOT EXISTS `bzrnp_foxcontact_sessions` (
  `id` varchar(32) NOT NULL,
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `keyword` varchar(32) NOT NULL,
  `birth` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data` text,
  UNIQUE KEY `index` (`id`,`cid`,`mid`,`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_foxcontact_settings`
--

CREATE TABLE IF NOT EXISTS `bzrnp_foxcontact_settings` (
  `name` varchar(32) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_foxcontact_settings`
--

INSERT INTO `bzrnp_foxcontact_settings` (`name`, `value`) VALUES
('captchadrawer', 'use_gd'),
('dns', 'dns_check'),
('mimefilter', 'disabled');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=177 ;

--
-- Дамп данных таблицы `bzrnp_menu`
--

INSERT INTO `bzrnp_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `ordering`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 185, 0, '*', 0),
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
(107, 'top-menu', 'Кровля', '2014-06-27-07-33-20', '', '2014-06-27-07-33-20', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"1","application":"1","menu-anchor_title":"","menu-anchor_css":"krovlya","menu_image":"images\\/krovlya.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 45, 100, 0, '*', 0),
(108, 'top-menu', 'Фасад', '2014-06-27-07-34-23', '', '2014-06-27-07-34-23', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"2","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/fasad.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 101, 118, 0, '*', 0),
(109, 'top-menu', 'Стена', '2014-06-27-07-35-03', '', '2014-06-27-07-35-03', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"3","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/stena.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 119, 124, 0, '*', 0),
(110, 'top-menu', 'Забор', '2014-06-27-07-35-48', '', '2014-06-27-07-35-48', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"4","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/zabor.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 125, 136, 0, '*', 0),
(111, 'top-menu', 'Мой любимый дом', '2014-06-27-07-36-29', '', '2014-06-27-07-36-29', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"5","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/dom.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 137, 156, 0, '*', 0),
(112, 'top-menu', 'Услуги', '2014-06-27-07-37-45', '', '2014-06-27-07-37-45', '#', 'url', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/uslugi.png","menu_text":1}', 157, 168, 0, '*', 0),
(113, 'top-menu', 'Контакты', '2014-06-27-07-39-20', '', '2014-06-27-07-39-20', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"7","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"images\\/kontakty.png","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 169, 170, 0, '*', 0),
(114, 'main', 'COM_NIVOSLIDERPRO', 'com-nivosliderpro', '', 'com-nivosliderpro', 'index.php?option=com_nivosliderpro', 'component', 0, 1, 1, 10031, 0, 0, '0000-00-00 00:00:00', 0, 1, 'components/com_nivosliderpro/assets/images/icon-16-nivopro.png', 0, '', 171, 172, 0, '', 1),
(115, 'hidden-menu', 'Смотрите все новости', 'smotrite-vse-novosti', '', 'smotrite-vse-novosti', 'index.php?option=com_content&view=category&layout=blog&id=8', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"layout_type":"blog","show_category_heading_title_text":"","show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_no_articles":"","show_subcat_desc":"","show_cat_num_articles":"","page_subheading":"","num_leading_articles":"","num_intro_articles":"","num_columns":"","num_links":"","multi_column_order":"","show_subcategory_content":"","orderby_pri":"","orderby_sec":"","order_date":"","show_pagination":"","show_pagination_results":"","show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_readmore":"","show_readmore_title":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","show_feed_link":"","feed_summary":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 173, 174, 0, '*', 0),
(116, 'footer-menu', 'О компании', 'o-kompanii', '', 'o-kompanii', 'index.php?option=com_content&view=article&id=2', 'component', 1, 1, 1, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 175, 176, 0, '*', 0),
(117, 'footer-menu', 'Контакты', '2014-06-27-08-54-01', '', '2014-06-27-08-54-01', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 177, 178, 0, '*', 0),
(118, 'footer-menu', 'Объекты', '2014-06-27-08-54-23', '', '2014-06-27-08-54-23', '', 'url', 1, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 179, 180, 0, '*', 0),
(119, 'top-menu', 'Замеры', '2014-06-27-10-55-44', '', '2014-06-27-07-37-45/2014-06-27-10-55-44', '', 'url', -2, 112, 2, 0, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}', 158, 159, 0, '*', 0),
(120, 'top-menu', 'Ремонт', 'remont', '', '2014-06-27-07-37-45/remont', 'index.php?option=com_content&view=article&id=3', 'component', 1, 112, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 160, 161, 0, '*', 0),
(121, 'top-menu', 'Монтаж', 'montazh', '', '2014-06-27-07-37-45/montazh', 'index.php?option=com_content&view=article&id=4', 'component', 1, 112, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 162, 163, 0, '*', 0),
(122, 'top-menu', 'Доставка', 'dostavka', '', '2014-06-27-07-37-45/dostavka', 'index.php?option=com_content&view=article&id=5', 'component', 1, 112, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 164, 165, 0, '*', 0),
(123, 'top-menu', 'Замеры', 'zamery', '', '2014-06-27-07-37-45/zamery', 'index.php?option=com_content&view=article&id=6', 'component', 1, 112, 2, 22, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_title":"","link_titles":"","show_intro":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_vote":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_hits":"","show_noauth":"","urls_position":"","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 166, 167, 0, '*', 0),
(124, 'top-menu', 'Поликарбонат', 'polikarbonat', '', '2014-06-27-07-36-29/polikarbonat', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"37","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 138, 139, 0, '*', 0),
(125, 'top-menu', 'Теплицы', 'teplitsy', '', '2014-06-27-07-36-29/teplitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"36","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 142, 143, 0, '*', 0),
(126, 'top-menu', 'Беседки', 'besedki', '', '2014-06-27-07-36-29/besedki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"35","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 140, 141, 0, '*', 0),
(127, 'top-menu', 'Благоустройство', 'blagoustrojstvo', '', '2014-06-27-07-36-29/blagoustrojstvo', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 111, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 144, 155, 0, '*', 0),
(128, 'top-menu', 'Туалет для дачи', 'tualet-dlya-dachi', '', '2014-06-27-07-36-29/blagoustrojstvo/tualet-dlya-dachi', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 145, 146, 0, '*', 0),
(129, 'top-menu', 'Песок для песочниц', 'pesok-dlya-pesochnits', '', '2014-06-27-07-36-29/blagoustrojstvo/pesok-dlya-pesochnits', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 147, 148, 0, '*', 0),
(130, 'top-menu', 'Террасная доска', 'terrasnaya-doska', '', '2014-06-27-07-36-29/blagoustrojstvo/terrasnaya-doska', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 149, 150, 0, '*', 0),
(131, 'top-menu', 'Тротуарная плитка', 'trotuarnaya-plitka', '', '2014-06-27-07-36-29/blagoustrojstvo/trotuarnaya-plitka', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 151, 152, 0, '*', 0),
(132, 'top-menu', 'Дренажные системы', 'drenazhnye-sistemy', '', '2014-06-27-07-36-29/blagoustrojstvo/drenazhnye-sistemy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 127, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"29","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 153, 154, 0, '*', 0),
(133, 'top-menu', 'Элементы устройства забора', 'elementy-ustrojstva-zabora', '', '2014-06-27-07-35-48/elementy-ustrojstva-zabora', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"42","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 126, 127, 0, '*', 0),
(134, 'top-menu', 'Металлический штакетник', 'metallicheskij-shtaketnik', '', '2014-06-27-07-35-48/metallicheskij-shtaketnik', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"41","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 128, 129, 0, '*', 0),
(135, 'top-menu', '3D забор', '3d-zabor', '', '2014-06-27-07-35-48/3d-zabor', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"40","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 130, 131, 0, '*', 0),
(136, 'top-menu', 'Забор из сетки-рабицы', 'zabor-iz-setki-rabitsy', '', '2014-06-27-07-35-48/zabor-iz-setki-rabitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"39","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 132, 133, 0, '*', 0),
(137, 'top-menu', 'Забор из профнастила', 'zabor-iz-profnastila', '', '2014-06-27-07-35-48/zabor-iz-profnastila', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 110, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"38","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 134, 135, 0, '*', 0),
(138, 'top-menu', 'Сэндвич-панели поэлементной сборки', 'sendvich-paneli-poelementnoj-sborki', '', '2014-06-27-07-35-03/sendvich-paneli-poelementnoj-sborki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 109, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"44","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 120, 121, 0, '*', 0),
(139, 'top-menu', 'Трехслойные сэндвич-панели', 'trekhslojnye-sendvich-paneli', '', '2014-06-27-07-35-03/trekhslojnye-sendvich-paneli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 109, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"43","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 122, 123, 0, '*', 0),
(140, 'top-menu', 'Элементы несущего каркаса', 'elementy-nesushchego-karkasa', '', '2014-06-27-07-34-23/elementy-nesushchego-karkasa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"52","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 102, 103, 0, '*', 0),
(141, 'top-menu', 'Профнастил', 'profnastil', '', '2014-06-27-07-34-23/profnastil', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"51","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 104, 105, 0, '*', 0),
(142, 'top-menu', 'Блок-хаус', 'blok-khaus', '', '2014-06-27-07-34-23/blok-khaus', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"50","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 106, 107, 0, '*', 0),
(143, 'top-menu', 'Панели стеновые', 'paneli-stenovye', '', '2014-06-27-07-34-23/paneli-stenovye', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"47","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 108, 113, 0, '*', 0),
(144, 'top-menu', 'Панели пластиковые', 'paneli-plastikovye', '', '2014-06-27-07-34-23/paneli-stenovye/paneli-plastikovye', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 143, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"49","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 109, 110, 0, '*', 0),
(145, 'top-menu', 'Панели металлические', 'paneli-metallicheskie', '', '2014-06-27-07-34-23/paneli-stenovye/paneli-metallicheskie', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 143, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"48","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 111, 112, 0, '*', 0),
(146, 'top-menu', 'Сайдинг пластиковый', 'sajding-plastikovyj', '', '2014-06-27-07-34-23/sajding-plastikovyj', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"46","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 114, 115, 0, '*', 0),
(147, 'top-menu', 'Сайдинг Металлический', 'sajding-metallicheskij', '', '2014-06-27-07-34-23/sajding-metallicheskij', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 108, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"2","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 116, 117, 0, '*', 0),
(148, 'top-menu', 'Кровельные элементы', 'krovelnye-elementy', '', '2014-06-27-07-33-20/krovelnye-elementy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"16","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 46, 69, 0, '*', 0),
(149, 'top-menu', 'Кровельный иструмент и оборудование', 'krovelnyj-istrument-i-oborudovanie', '', '2014-06-27-07-33-20/krovelnye-elementy/krovelnyj-istrument-i-oborudovanie', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"62","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 47, 48, 0, '*', 0),
(150, 'top-menu', 'OSB', 'osb', '', '2014-06-27-07-33-20/krovelnye-elementy/osb', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"61","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 49, 50, 0, '*', 0),
(151, 'top-menu', 'Флюгеры', 'flyugery', '', '2014-06-27-07-33-20/krovelnye-elementy/flyugery', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"60","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 51, 52, 0, '*', 0),
(152, 'top-menu', 'Антенные выходы', 'antennye-vykhody', '', '2014-06-27-07-33-20/krovelnye-elementy/antennye-vykhody', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"59","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 53, 54, 0, '*', 0),
(153, 'top-menu', 'Чердачные лестницы', 'cherdachnye-lestnitsy', '', '2014-06-27-07-33-20/krovelnye-elementy/cherdachnye-lestnitsy', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"58","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 55, 56, 0, '*', 0),
(154, 'top-menu', 'Мансардные окна', 'mansardnye-okna', '', '2014-06-27-07-33-20/krovelnye-elementy/mansardnye-okna', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"57","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 57, 58, 0, '*', 0),
(155, 'top-menu', 'Уплотнители', 'uplotniteli', '', '2014-06-27-07-33-20/krovelnye-elementy/uplotniteli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"56","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 59, 60, 0, '*', 0),
(156, 'top-menu', 'Эмаль ремонтная', 'emal-remontnaya', '', '2014-06-27-07-33-20/krovelnye-elementy/emal-remontnaya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"55","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 61, 62, 0, '*', 0),
(157, 'top-menu', 'Теплоизоляция', 'teploizolyatsiya', '', '2014-06-27-07-33-20/krovelnye-elementy/teploizolyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"54","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 63, 64, 0, '*', 0),
(158, 'top-menu', 'Кровельная вентиляция', 'krovelnaya-ventilyatsiya', '', '2014-06-27-07-33-20/krovelnye-elementy/krovelnaya-ventilyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"53","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 67, 68, 0, '*', 0),
(159, 'top-menu', 'Подшив карниза', 'podshiv-karniza', '', '2014-06-27-07-33-20/podshiv-karniza', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"15","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 70, 71, 0, '*', 0),
(160, 'top-menu', 'Снегозадержатели и элементы безопасности', 'snegozaderzhateli-i-elementy-bezopasnosti', '', '2014-06-27-07-33-20/snegozaderzhateli-i-elementy-bezopasnosti', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"14","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 72, 73, 0, '*', 0),
(161, 'top-menu', 'Гидроизоляция', 'gidroizolyatsiya', '', '2014-06-27-07-33-20/gidroizolyatsiya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"13","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 74, 75, 0, '*', 0),
(162, 'top-menu', 'Стропила и обрешетка (пиломатериал)', 'stropila-i-obreshetka-pilomaterial', '', '2014-06-27-07-33-20/stropila-i-obreshetka-pilomaterial', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"12","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 76, 77, 0, '*', 0),
(163, 'top-menu', 'Крепеж', 'krepezh', '', '2014-06-27-07-33-20/krepezh', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"11","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 78, 79, 0, '*', 0),
(164, 'top-menu', 'Водостоки', 'vodostoki', '', '2014-06-27-07-33-20/vodostoki', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"10","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 80, 81, 0, '*', 0),
(165, 'top-menu', 'Отделочные элементы кровли', 'otdelochnye-elementy-krovli', '', '2014-06-27-07-33-20/otdelochnye-elementy-krovli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"9","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 82, 83, 0, '*', 0),
(166, 'top-menu', 'Материалы для кровли', 'materialy-dlya-krovli', '', '2014-06-27-07-33-20/materialy-dlya-krovli', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 107, 2, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"8","application":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 84, 99, 0, '*', 0),
(167, 'top-menu', 'Керамическая черепица', 'keramicheskaya-cherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/keramicheskaya-cherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"24","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 85, 86, 0, '*', 0),
(168, 'top-menu', 'Наплавляемая кровля', 'naplavlyaemaya-krovlya', '', '2014-06-27-07-33-20/materialy-dlya-krovli/naplavlyaemaya-krovlya', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"23","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 87, 88, 0, '*', 0),
(169, 'top-menu', 'Шифер волновой', 'shifer-volnovoj', '', '2014-06-27-07-33-20/materialy-dlya-krovli/shifer-volnovoj', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"22","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 89, 90, 0, '*', 0),
(170, 'top-menu', 'Ондулин', 'ondulin', '', '2014-06-27-07-33-20/materialy-dlya-krovli/ondulin', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"21","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 91, 92, 0, '*', 0),
(171, 'top-menu', 'Гибкая черепица', 'gibkaya-cherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/gibkaya-cherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"19","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 93, 94, 0, '*', 0),
(172, 'top-menu', 'Профнастил', 'profnastil', '', '2014-06-27-07-33-20/materialy-dlya-krovli/profnastil', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"18","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 95, 96, 0, '*', 0),
(173, 'top-menu', 'Металлочерепица', 'metallocherepitsa', '', '2014-06-27-07-33-20/materialy-dlya-krovli/metallocherepitsa', 'index.php?option=com_zoo&view=category&layout=category', 'component', 1, 166, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"17","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 97, 98, 0, '*', 0),
(174, 'main', 'COM_FOXCONTACT_MENU', 'com-foxcontact-menu', '', 'com-foxcontact-menu', 'index.php?option=com_foxcontact', 'component', 0, 1, 1, 10047, 0, 0, '0000-00-00 00:00:00', 0, 1, '../media/com_foxcontact/images/email-16.png', 0, '', 181, 182, 0, '', 1),
(175, 'top-menu', 'Теплоизоляция (2)', 'teploizolyatsiya-2', '', '2014-06-27-07-33-20/krovelnye-elementy/teploizolyatsiya-2', 'index.php?option=com_zoo&view=category&layout=category', 'component', -2, 148, 3, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"category":"54","application":"1","menu-anchor_title":"","menu-anchor_css":"gray","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 65, 66, 0, '*', 0),
(176, 'hidden-menu', 'Корзина', 'korzina', '', 'korzina', 'index.php?option=com_zoo&view=submission&layout=submission', 'component', 1, 1, 1, 10014, 0, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"type":"order","submission":"2","application":"2","redirect":"101","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":0,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0}', 183, 184, 0, '*', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=116 ;

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
(107, 'JBZoo Cart', '', '', 2, 'search_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jbzoo_basket', 1, 0, '{"app_id":"2","currency":"RUB","menuitem":"107","items_show":"1","lots_show":"0","summa_show":"0","cancel_show":"1","link_show":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","owncache":"0","cache_time":"0","cachemode":"itemid"}', 0, '*'),
(108, 'JBZoo Category List', '', '', 1, 'cities_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jbzoo_category', 1, 0, '{"application":"3:0","type_id":["gorod"],"category_limit":"0","item_order":"priority","items_limit":"4","category_order":"alpha","category_display_image":"0","category_image_width":"100","category_image_height":"100","category_image_align":"left","category_display_description":"1","display_count_items":"1","menu_item":"","display_items":"1","items_image_align":"none","layout":"default","item_layout":"default","category_display_border":"0","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(100, 'Главное меню', '', '', 1, 'main_menu__module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"top-menu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(101, 'Unite Nivo Slider Pro', '', '', 0, '', 42, '2014-07-25 05:51:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_unite_nivopro', 1, 1, '', 0, '*'),
(102, 'Главный слайдер', '', '', 1, 'slider_module', 42, '2014-07-25 05:51:20', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_unite_nivopro', 1, 0, '{"sliderid":"1","include_jquery":"true","js_load_type":"head","no_conflict_mode":"false","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(103, 'JUNewsUltra Pro', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_junewsultra', 1, 1, '', 0, '*'),
(104, 'Новости компании', '', '', 1, 'all_news_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_junewsultra', 1, 0, '{"display_article":"0","articleid":"","count":"3","count_skip":"0","show_featured":"","catid":["8"],"category_filtering_type":"1","show_child_category_articles":"1","levels":"999","excluded_articles":"","date_filtering":"0","date_field":"a.created","relative_date":"0","custom_days":"30","ordering":"created_desc","user_id":"0","cache":"1","cache_time":"900","cachemode":"static","template":"_:news","jquery":"0","bootstrap_js":"0","bootstrap_css":"0","empty_mod":"0","cssstyle":"1","moduleclass_sfx":"","show_title":"1","title_limit":"0","title_limit_mode":"1","title_limit_count":"20","end_limit_title":"...","title_prepare":"0","content_prepare":"0","show_intro":"1","clear_tag":"1","allowed_intro_tags":"","li":"1","lmttext":"1","introtext_limit":"15","end_limit_introtext":"...","show_full":"0","clear_tag_full":"1","allowed_full_tags":"","li_full":"1","lmttext_full":"1","fulltext_limit":"20","end_limit_fulltext":"...","juauthor":"0","read_more":"0","rmtext":"Read more...","show_date":"1","data_format":"d.m.Y","df_d":"d","df_m":"m","df_y":"Y","showcat":"0","showcatlink":"0","showHits":"0","showRating":"0","showRatingCount":"0","all_in":"1","all_in_position":"0","item_heading":"div","class_all_in":"all_news_link","custom_heading":"0","text_all_in":"","link_all_in":"","text_all_in2":"\\u0421\\u043c\\u043e\\u0442\\u0440\\u0438\\u0442\\u0435  \\u0432\\u0441\\u0435 \\u043d\\u043e\\u0432\\u043e\\u0441\\u0442\\u0438","link_menuitem":"115","pik":"1","image_source":"0","imglink":"1","tips":"1","imageWidth":"70","imageHeight":"70","thumb_width":"1","source_rectangle":"0","sx":"0","sy":"0","sw":"","sh":"","Zoom_Crop":"1","thumb_filtercolor":"0","colorized":"25","colorpicker":"#0000ff","thumb_th_seting":"10","thumb_filters":"1","thumb_unsharp":"1","thumb_unsharp_amount":"80","thumb_unsharp_radius":"1","thumb_unsharp_threshold":"3","thumb_blur":"0","thumb_blur_seting":"1","thumb_brit":"0","thumb_brit_seting":"50","thumb_cont":"0","thumb_cont_seting":"50","defaultimg":"1","noimage":"notfoundimage.png","img_cache":"cache","cache_maxage_img":"30","cache_maxsize_img":"10","cache_maxfiles_img":"200","use_imagemagick":"1","imagemagick_path":"","img_ext":"jpg","link_enabled":"1","use_comments":"0","youtube_img_show":"1","copy":"0"}', 0, '*'),
(105, 'О компании', '', '<p>Не следует, однако забывать, что реализация намеченных плановых заданий в значительной степени обуславливает создание систем массового участия. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа форм развития. Не следует, однако забывать, что реализация намеченных плановых заданий играет важную роль в формировании существенных финансовых и административных условий.</p>\r\n<p>Значимость этих проблем настолько очевидна, что укрепление и развитие структуры влечет за собой процесс внедрения и модернизации системы обучения кадров, соответствует насущным потребностям. Таким образом постоянное информационно-пропагандистское обеспечение нашей деятельности требуют от нас анализа модели развития. Товарищи! реализация намеченных плановых заданий обеспечивает широкому кругу (специалистов) участие в формировании новых предложений. Идейные соображения высшего порядка, а также новая модель организационной деятельности обеспечивает широкому кругу (специалистов) участие в формировании модели развития. Не следует, однако забывать, что консультация с широким активом представляет собой интересный эксперимент проверки форм развития. Значимость этих проблем настолько очевидна, что укрепление и развитие структуры требуют определения и уточнения форм развития.</p>', 1, 'about_company_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', -2, 'mod_custom', 1, 1, '{"prepare_content":"0","backgroundimage":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"static"}', 0, '*'),
(106, 'Меню в подвале', '', '', 1, 'footer_menu_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 1, 0, '{"menutype":"footer-menu","startLevel":"1","endLevel":"0","showAllChildren":"1","tag_id":"","class_sfx":"","window_open":"","layout":"_:default","moduleclass_sfx":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(109, 'JBZoo Search List', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_props', 1, 1, '', 0, '*'),
(110, 'JBZoo Search', '', '', 0, '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_jbzoo_search', 1, 1, '', 0, '*'),
(112, 'ON-LINE Заявка', '', '', 1, 'zayavka_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_foxcontact', 1, 0, '{"to_address":"dummy@address.com, another@address.com","cc_address":"","bcc_address":"","email_subject":"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0430 \\u0441 \\u0432\\u0430\\u0448\\u0435\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430","jmessenger_user":"0","page_subheading":"","form_width":"620","form_unit":"px","customhtml0":"","customhtml0display":"1","customhtml0order":"-1000","customhtml1":"","customhtml1display":"1","customhtml1order":"1000","labelsdisplay":"1","labelswidth":"100","labelsunit":"%","sender0":"\\u0424\\u0418\\u041e","sender0display":"2","sender0order":"5","sender1":"\\u0410\\u0434\\u0440\\u0435\\u0441 \\u044d\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u043d\\u043e\\u0439 \\u043f\\u043e\\u0447\\u0442\\u044b","sender1display":"1","sender1order":"15","sender1isemail":"1","senderwidth":"100","senderunit":"%","text0":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d","text0display":"2","text0order":"10","text1":"","text1display":"0","text1order":"20","text2":"","text2display":"0","text2order":"25","text3":"","text3display":"0","text3order":"30","text4":"","text4display":"0","text4order":"35","text5":"","text5display":"0","text5order":"40","text6":"","text6display":"0","text6order":"45","text7":"","text7display":"0","text7order":"50","text8":"","text8display":"0","text8order":"55","text9":"","text9display":"0","text9order":"60","textwidth":"100","textunit":"%","dropdown0":"\\u041a\\u0430\\u043a \\u0432\\u044b \\u0443\\u0437\\u043d\\u0430\\u043b\\u0438 \\u043e \\u043d\\u0430\\u0441?","dropdown0display":"0","dropdown0values":"\\u041f\\u043e\\u0438\\u0441\\u043a \\u0432 \\u0438\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\\u0435,\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u0434\\u0440\\u0443\\u0433\\u0430,\\u041f\\u043e\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043e\\u0442\\u0437\\u044b\\u0432 \\u0432 \\u0421\\u041c\\u0418","dropdown0order":"65","dropdown1":"","dropdown1display":"0","dropdown1values":"","dropdown1order":"70","dropdown2":"","dropdown2display":"0","dropdown2values":"","dropdown2order":"75","dropdownwidth":"100","dropdownunit":"%","textarea0":"\\u041d\\u0430\\u043f\\u0438\\u0448\\u0438\\u0442\\u0435 \\u043a\\u0430\\u043a\\u0443\\u044e \\u043f\\u0440\\u043e\\u0434\\u0443\\u043a\\u0446\\u0438\\u044e \\u0412\\u044b \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u0437\\u0430\\u043a\\u0430\\u0437\\u0430\\u0442\\u044c.  \\u0423\\u043a\\u0430\\u0436\\u0438\\u0442\\u0435 \\u0440\\u0430\\u0437\\u043c\\u0435\\u0440\\u044b, \\u043a\\u043e\\u043b\\u0438\\u0447\\u0435\\u0441\\u0442\\u0432\\u043e, \\u0446\\u0432\\u0435\\u0442.","textarea0display":"1","textarea0order":"80","textarea1":"","textarea1display":"0","textarea1order":"85","textarea2":"","textarea2display":"0","textarea2order":"90","textareawidth":"100","textareaheight":"180","textareaunit":"%","checkbox0":"\\u042f \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u0435\\u043d \\u0441 \\u0432\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430\\u043c\\u0438 \\u0438 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f\\u043c\\u0438","checkbox0display":"0","checkbox0order":"95","checkbox1":"","checkbox1display":"0","checkbox1order":"100","checkbox2":"","checkbox2display":"0","checkbox2order":"105","checkbox3":"","checkbox3display":"0","checkbox3order":"110","checkbox4":"","checkbox4display":"0","checkbox4order":"115","uploaddisplay":"1","uploadmethod":"1","upload":"\\u0422\\u0430\\u043a \\u0436\\u0435 \\u0412\\u044b \\u043c\\u043e\\u0436\\u0435\\u0442\\u0435 \\u043e\\u0442\\u043f\\u0440\\u0430\\u0432\\u0438\\u0442\\u044c \\u043d\\u0430\\u043c \\u0444\\u0430\\u0439\\u043b\\u044b \\u0441 \\u0447\\u0435\\u0440\\u0442\\u0435\\u0436\\u0430\\u043c\\u0438, \\u043c\\u0435\\u0441\\u0442\\u043e\\u043c \\u043c\\u043e\\u043d\\u0442\\u0430\\u0436\\u0430 \\u0438\\u043b\\u0438 \\u0434\\u0440. \\u0444\\u043e\\u0442\\u043e .ai, .cdr, .eps, .jpg, .png, .psd \\u0438 \\u043c\\u044b \\u0441\\u043c\\u043e\\u0436\\u0435\\u043c  \\u043f\\u043e\\u0434\\u043e\\u0431\\u0440\\u0430\\u0442\\u044c \\u0434\\u043b\\u044f \\u0412\\u0430\\u0441 \\u043b\\u0443\\u0447\\u0448\\u0438\\u0435 \\u043c\\u0430\\u0442\\u0435\\u0440\\u0438\\u0430\\u043b\\u044b.","uploadmax_file_size":"10000","submittext":"\\u041e\\u0442\\u043f\\u0440\\u0430\\u0432\\u0438\\u0442\\u044c \\u0437\\u0430\\u044f\\u0432\\u043a\\u0443","submittype":"0","submiticon":"-1","resetbutton":"1","resettext":"\\u041e\\u0447\\u0438\\u0441\\u0442\\u0438\\u0442\\u044c","resettype":"0","reseticon":"-1","email_sent_action":"0","email_sent_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_sent_textdisplay":"1","email_sent_page":"101","copy_to_submitter":"1","email_copy_subject":"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0432\\u0430\\u0448\\u0435 \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u043d\\u0430\\u043c","email_copy_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_copy_summary":"0","spam_check":"1","spam_words":"www,http,url=,href=,link=,.txt,shit,fuck","spam_detected_text":"\\u0418\\u0437\\u0432\\u0438\\u043d\\u0438\\u0442\\u0435, \\u043d\\u043e \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430 \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442, \\u0447\\u0442\\u043e \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u0442 \\u043d\\u0435\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u0440\\u0435\\u043a\\u043b\\u0430\\u043c\\u0443, \\u043f\\u043e\\u044d\\u0442\\u043e\\u043c\\u0443 \\u043e\\u043d\\u043e <b>\\u0431\\u044b\\u043b\\u043e \\u0437\\u0430\\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043e<\\/b>.<br \\/>\\u0415\\u0441\\u043b\\u0438 \\u0432\\u044b \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u044d\\u0442\\u043e \\u043e\\u0448\\u0438\\u0431\\u043a\\u0430, \\u0442\\u043e, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0432\\u0435\\u0440\\u043d\\u0438\\u0442\\u0435\\u0441\\u044c \\u0438 \\u043f\\u043e\\u043f\\u0440\\u043e\\u0431\\u0443\\u0439\\u0442\\u0435 \\u0435\\u0449\\u0451 \\u0440\\u0430\\u0437, \\u0438\\u0437\\u0431\\u0435\\u0433\\u0430\\u044f \\u0442\\u0430\\u043a\\u0438\\u0445 \\u0441\\u043b\\u043e\\u0432 \\u043a\\u0430\\u043a <i>www, http,<\\/i> \\u0438 \\u0442\\u0430\\u043a \\u0434\\u0430\\u043b\\u0435\\u0435.","spam_detected_textdisplay":"1","stdcaptchadisplay":"0","stdcaptcha":"\\u041a\\u043b\\u044e\\u0447 \\u0437\\u0430\\u0449\\u0438\\u0442\\u044b","stdcaptchatype":"0","stdcaptcha_length":"5","stdcaptchawidth":"150","stdcaptchaheight":"75","stdcaptchafont":"-1","stdcaptchafontmin":"14","stdcaptchafontmax":"20","stdcaptchaangle":"20","stdcaptcha_backgroundcolor":"#ffffff","stdcaptcha_textcolor":"#191919","stdcaptcha_disturbcolor":"#c8c8c8","layout":"_:default","stylesheet":"neon.css","moduleclass_sfx":"_zayavka","acymailing":"0","acymailing_checkboxes":"hidden|hidden","acymailing_auto_checked":"0","jnews":"0","jnews_checkboxes":"hidden|hidden","jnews_auto_checked":"0","othernewsletters":"1"}', 0, '*'),
(113, 'Заказать звонок', '', '', 1, 'zvonok_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_foxcontact', 1, 0, '{"to_address":"dummy@address.com, another@address.com","cc_address":"","bcc_address":"","email_subject":"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0430 \\u0441 \\u0432\\u0430\\u0448\\u0435\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430","jmessenger_user":"0","page_subheading":"","form_width":"100","form_unit":"%","customhtml0":"","customhtml0display":"1","customhtml0order":"-1000","customhtml1":"","customhtml1display":"1","customhtml1order":"1000","labelsdisplay":"1","labelswidth":"100","labelsunit":"%","sender0":"\\u0418\\u041c\\u042f","sender0display":"1","sender0order":"5","sender1":"\\u0412\\u0430\\u0448 e-mail","sender1display":"0","sender1order":"10","sender1isemail":"1","senderwidth":"100","senderunit":"%","text0":"\\u0442\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d","text0display":"2","text0order":"15","text1":"\\u0423\\u0434\\u043e\\u0431\\u043d\\u043e\\u0435 \\u0432\\u0440\\u0435\\u043c\\u044f \\u0437\\u0432\\u043e\\u043d\\u043a\\u0430","text1display":"1","text1order":"20","text2":"","text2display":"0","text2order":"25","text3":"","text3display":"0","text3order":"30","text4":"","text4display":"0","text4order":"35","text5":"","text5display":"0","text5order":"40","text6":"","text6display":"0","text6order":"45","text7":"","text7display":"0","text7order":"50","text8":"","text8display":"0","text8order":"55","text9":"","text9display":"0","text9order":"60","textwidth":"100","textunit":"%","dropdown0":"\\u041a\\u0430\\u043a \\u0432\\u044b \\u0443\\u0437\\u043d\\u0430\\u043b\\u0438 \\u043e \\u043d\\u0430\\u0441?","dropdown0display":"0","dropdown0values":"\\u041f\\u043e\\u0438\\u0441\\u043a \\u0432 \\u0438\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\\u0435,\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u0434\\u0440\\u0443\\u0433\\u0430,\\u041f\\u043e\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043e\\u0442\\u0437\\u044b\\u0432 \\u0432 \\u0421\\u041c\\u0418","dropdown0order":"65","dropdown1":"","dropdown1display":"0","dropdown1values":"","dropdown1order":"70","dropdown2":"","dropdown2display":"0","dropdown2values":"","dropdown2order":"75","dropdownwidth":"85","dropdownunit":"%","textarea0":"\\u041e\\u043f\\u0438\\u0448\\u0438\\u0442\\u0435 \\u0432\\u0430\\u0448 \\u0437\\u0430\\u043f\\u0440\\u043e\\u0441","textarea0display":"0","textarea0order":"80","textarea1":"","textarea1display":"0","textarea1order":"85","textarea2":"","textarea2display":"0","textarea2order":"90","textareawidth":"85","textareaheight":"180","textareaunit":"%","checkbox0":"\\u042f \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u0435\\u043d \\u0441 \\u0432\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430\\u043c\\u0438 \\u0438 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f\\u043c\\u0438","checkbox0display":"0","checkbox0order":"95","checkbox1":"","checkbox1display":"0","checkbox1order":"100","checkbox2":"","checkbox2display":"0","checkbox2order":"105","checkbox3":"","checkbox3display":"0","checkbox3order":"110","checkbox4":"","checkbox4display":"0","checkbox4order":"115","uploaddisplay":"0","uploadmethod":"1","upload":"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0435\\u0442\\u0435 \\u0444\\u0430\\u0439\\u043b\\u044b \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f","uploadmax_file_size":"10000","submittext":"\\u0417\\u0410\\u041a\\u0410\\u0417\\u0410\\u0422\\u042c \\u0417\\u0412\\u041e\\u041d\\u041e\\u041a","submittype":"0","submiticon":"-1","resetbutton":"0","resettext":"\\u0421\\u0431\\u0440\\u043e\\u0441","resettype":"0","reseticon":"-1","email_sent_action":"0","email_sent_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_sent_textdisplay":"1","email_sent_page":"101","copy_to_submitter":"1","email_copy_subject":"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0432\\u0430\\u0448\\u0435 \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u043d\\u0430\\u043c","email_copy_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_copy_summary":"0","spam_check":"1","spam_words":"www,http,url=,href=,link=,.txt,shit,fuck","spam_detected_text":"\\u0418\\u0437\\u0432\\u0438\\u043d\\u0438\\u0442\\u0435, \\u043d\\u043e \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430 \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442, \\u0447\\u0442\\u043e \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u0442 \\u043d\\u0435\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u0440\\u0435\\u043a\\u043b\\u0430\\u043c\\u0443, \\u043f\\u043e\\u044d\\u0442\\u043e\\u043c\\u0443 \\u043e\\u043d\\u043e <b>\\u0431\\u044b\\u043b\\u043e \\u0437\\u0430\\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043e<\\/b>.<br \\/>\\u0415\\u0441\\u043b\\u0438 \\u0432\\u044b \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u044d\\u0442\\u043e \\u043e\\u0448\\u0438\\u0431\\u043a\\u0430, \\u0442\\u043e, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0432\\u0435\\u0440\\u043d\\u0438\\u0442\\u0435\\u0441\\u044c \\u0438 \\u043f\\u043e\\u043f\\u0440\\u043e\\u0431\\u0443\\u0439\\u0442\\u0435 \\u0435\\u0449\\u0451 \\u0440\\u0430\\u0437, \\u0438\\u0437\\u0431\\u0435\\u0433\\u0430\\u044f \\u0442\\u0430\\u043a\\u0438\\u0445 \\u0441\\u043b\\u043e\\u0432 \\u043a\\u0430\\u043a <i>www, http,<\\/i> \\u0438 \\u0442\\u0430\\u043a \\u0434\\u0430\\u043b\\u0435\\u0435.","spam_detected_textdisplay":"1","stdcaptchadisplay":"0","stdcaptcha":"\\u041a\\u043b\\u044e\\u0447 \\u0437\\u0430\\u0449\\u0438\\u0442\\u044b","stdcaptchatype":"0","stdcaptcha_length":"5","stdcaptchawidth":"150","stdcaptchaheight":"75","stdcaptchafont":"-1","stdcaptchafontmin":"14","stdcaptchafontmax":"20","stdcaptchaangle":"20","stdcaptcha_backgroundcolor":"#ffffff","stdcaptcha_textcolor":"#191919","stdcaptcha_disturbcolor":"#c8c8c8","layout":"_:default","stylesheet":"neon.css","moduleclass_sfx":"","acymailing":"0","acymailing_checkboxes":"hidden|hidden","acymailing_auto_checked":"0","jnews":"0","jnews_checkboxes":"hidden|hidden","jnews_auto_checked":"0","othernewsletters":"1"}', 0, '*'),
(114, 'ProductSearch', '', '', 1, 'search_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_jbzoo_search', 1, 0, '{"application":"1","type":"product","item_layout":"default","menuitem":"107","moduleclass_sfx":"","layout":"_:default","logic":"and","logic_show":"0","pages":"20","pages_show":"0","order_show":"0","order_list":["corecreated"],"order_mode":"d","order_default":{"field":"_none","mode":"s","order":"asc"},"button_submit_show":"1","button_reset_show":"0","autosubmit":"1","exact":"0","cache":"0","owncache":"0","cache_time":"0","cachemode":"itemid"}', 0, '*'),
(115, 'Нашли дешевле? Поторгуемся!', '', '', 1, 'less_price_wrapper_module', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_foxcontact', 1, 0, '{"to_address":"dummy@address.com, another@address.com","cc_address":"","bcc_address":"","email_subject":"\\u0417\\u0430\\u044f\\u0432\\u043a\\u0430 \\u0441 \\u0432\\u0430\\u0448\\u0435\\u0433\\u043e \\u0441\\u0430\\u0439\\u0442\\u0430","jmessenger_user":"0","page_subheading":"","form_width":"620","form_unit":"px","customhtml0":"\\u041d\\u0430\\u0448\\u0430 \\u0446\\u0435\\u043d\\u0430 \\u043d\\u0430 \\u0422\\u043e\\u0432\\u0430\\u0440 \\u043a\\u0430\\u0436\\u0435\\u0442\\u0441\\u044f \\u0412\\u0430\\u043c \\u0432\\u044b\\u0441\\u043e\\u043a\\u043e\\u0439 \\u0438 \\u0412\\u044b \\u0445\\u043e\\u0442\\u0438\\u0442\\u0435 \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u0442\\u044c \\u0434\\u043e\\u043f\\u043e\\u043b\\u043d\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u0441\\u043a\\u0438\\u0434\\u043a\\u0443?\\r\\n\\r\\n\\u0421\\u043e\\u043e\\u0431\\u0449\\u0438\\u0442\\u0435 \\u043d\\u0430\\u043c \\u043e \\u0436\\u0435\\u043b\\u0430\\u0435\\u043c\\u043e\\u0439 \\u0446\\u0435\\u043d\\u0435 \\u043d\\u0430 \\u0422\\u043e\\u0432\\u0430\\u0440 \\u0438 \\u043c\\u044b \\u043e\\u0431\\u0441\\u0443\\u0434\\u0438\\u043c \\u043b\\u044e\\u0431\\u043e\\u0435 \\u043e\\u0431\\u043e\\u0441\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u0435 \\u0412\\u0430\\u0448\\u0435\\u0439 \\u0446\\u0435\\u043d\\u044b.","customhtml0display":"1","customhtml0order":"-1000","customhtml1":"","customhtml1display":"1","customhtml1order":"1000","labelsdisplay":"1","labelswidth":"100","labelsunit":"%","sender0":"\\u0412\\u0430\\u0448\\u0435 \\u0438\\u043c\\u044f","sender0display":"0","sender0order":"5","sender1":"\\u0412\\u0430\\u0448 e-mail","sender1display":"0","sender1order":"10","sender1isemail":"1","senderwidth":"100","senderunit":"%","text0":"\\u041a\\u043e\\u043d\\u0442\\u0430\\u043a\\u0442\\u043d\\u044b\\u0439 \\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d","text0display":"2","text0order":"15","text1":"\\u0416\\u0435\\u043b\\u0430\\u0435\\u043c\\u0430\\u044f \\u0446\\u0435\\u043d\\u0430","text1display":"1","text1order":"20","text2":"\\u041d\\u0430\\u0438\\u043c\\u0435\\u043d\\u043e\\u0432\\u0430\\u043d\\u0438\\u044f \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430","text2display":"1","text2order":"25","text3":"","text3display":"0","text3order":"30","text4":"","text4display":"0","text4order":"35","text5":"","text5display":"0","text5order":"40","text6":"","text6display":"0","text6order":"45","text7":"","text7display":"0","text7order":"50","text8":"","text8display":"0","text8order":"55","text9":"","text9display":"0","text9order":"60","textwidth":"100","textunit":"%","dropdown0":"\\u041a\\u0430\\u043a \\u0432\\u044b \\u0443\\u0437\\u043d\\u0430\\u043b\\u0438 \\u043e \\u043d\\u0430\\u0441?","dropdown0display":"0","dropdown0values":"\\u041f\\u043e\\u0438\\u0441\\u043a \\u0432 \\u0438\\u043d\\u0442\\u0435\\u0440\\u043d\\u0435\\u0442\\u0435,\\u0420\\u0435\\u043a\\u043e\\u043c\\u0435\\u043d\\u0434\\u0430\\u0446\\u0438\\u0438 \\u0434\\u0440\\u0443\\u0433\\u0430,\\u041f\\u043e\\u043b\\u043e\\u0436\\u0438\\u0442\\u0435\\u043b\\u044c\\u043d\\u044b\\u0439 \\u043e\\u0442\\u0437\\u044b\\u0432 \\u0432 \\u0421\\u041c\\u0418","dropdown0order":"65","dropdown1":"","dropdown1display":"0","dropdown1values":"","dropdown1order":"70","dropdown2":"","dropdown2display":"0","dropdown2values":"","dropdown2order":"75","dropdownwidth":"100","dropdownunit":"%","textarea0":"\\u041e\\u043f\\u0438\\u0448\\u0438\\u0442\\u0435 \\u0432\\u0430\\u0448 \\u0437\\u0430\\u043f\\u0440\\u043e\\u0441","textarea0display":"0","textarea0order":"80","textarea1":"","textarea1display":"0","textarea1order":"85","textarea2":"","textarea2display":"0","textarea2order":"90","textareawidth":"85","textareaheight":"100","textareaunit":"%","checkbox0":"\\u042f \\u0441\\u043e\\u0433\\u043b\\u0430\\u0441\\u0435\\u043d \\u0441 \\u0432\\u0430\\u0448\\u0438\\u043c\\u0438 \\u043f\\u0440\\u0430\\u0432\\u0438\\u043b\\u0430\\u043c\\u0438 \\u0438 \\u0443\\u0441\\u043b\\u043e\\u0432\\u0438\\u044f\\u043c\\u0438","checkbox0display":"0","checkbox0order":"95","checkbox1":"","checkbox1display":"0","checkbox1order":"100","checkbox2":"","checkbox2display":"0","checkbox2order":"105","checkbox3":"","checkbox3display":"0","checkbox3order":"110","checkbox4":"","checkbox4display":"0","checkbox4order":"115","uploaddisplay":"0","uploadmethod":"1","upload":"\\u0412\\u044b\\u0431\\u0435\\u0440\\u0435\\u0442\\u0435 \\u0444\\u0430\\u0439\\u043b\\u044b \\u0434\\u043b\\u044f \\u043f\\u0440\\u0438\\u043a\\u0440\\u0435\\u043f\\u043b\\u0435\\u043d\\u0438\\u044f","uploadmax_file_size":"10000","submittext":"\\u041a\\u0443\\u043f\\u0438\\u0442\\u044c \\u0434\\u0435\\u0448\\u0435\\u0432\\u043b\\u0435","submittype":"0","submiticon":"-1","resetbutton":"0","resettext":"\\u0421\\u0431\\u0440\\u043e\\u0441","resettype":"0","reseticon":"-1","email_sent_action":"0","email_sent_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_sent_textdisplay":"1","email_sent_page":"101","copy_to_submitter":"1","email_copy_subject":"\\u0421\\u043f\\u0430\\u0441\\u0438\\u0431\\u043e \\u0437\\u0430 \\u0432\\u0430\\u0448\\u0435 \\u043e\\u0431\\u0440\\u0430\\u0449\\u0435\\u043d\\u0438\\u0435 \\u043a \\u043d\\u0430\\u043c","email_copy_text":"\\u041c\\u044b \\u043f\\u043e\\u043b\\u0443\\u0447\\u0438\\u043b\\u0438 \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435. \\u041c\\u044b \\u0441\\u0432\\u044f\\u0436\\u0435\\u043c\\u0441\\u044f \\u0441 \\u0432\\u0430\\u043c\\u0438 \\u0432 \\u0442\\u0435\\u0447\\u0435\\u043d\\u0438\\u0435 \\u043d\\u0435\\u0441\\u043a\\u043e\\u043b\\u044c\\u043a\\u0438\\u0445 \\u0434\\u043d\\u0435\\u0439.","email_copy_summary":"0","spam_check":"1","spam_words":"www,http,url=,href=,link=,.txt,shit,fuck","spam_detected_text":"\\u0418\\u0437\\u0432\\u0438\\u043d\\u0438\\u0442\\u0435, \\u043d\\u043e \\u0441\\u0438\\u0441\\u0442\\u0435\\u043c\\u0430 \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442, \\u0447\\u0442\\u043e \\u0432\\u0430\\u0448\\u0435 \\u0441\\u043e\\u043e\\u0431\\u0449\\u0435\\u043d\\u0438\\u0435 \\u0441\\u043e\\u0434\\u0435\\u0440\\u0436\\u0438\\u0442 \\u043d\\u0435\\u0436\\u0435\\u043b\\u0430\\u0442\\u0435\\u043b\\u044c\\u043d\\u0443\\u044e \\u0440\\u0435\\u043a\\u043b\\u0430\\u043c\\u0443, \\u043f\\u043e\\u044d\\u0442\\u043e\\u043c\\u0443 \\u043e\\u043d\\u043e <b>\\u0431\\u044b\\u043b\\u043e \\u0437\\u0430\\u0431\\u043b\\u043e\\u043a\\u0438\\u0440\\u043e\\u0432\\u0430\\u043d\\u043e<\\/b>.<br \\/>\\u0415\\u0441\\u043b\\u0438 \\u0432\\u044b \\u0441\\u0447\\u0438\\u0442\\u0430\\u0435\\u0442\\u0435, \\u0447\\u0442\\u043e \\u044d\\u0442\\u043e \\u043e\\u0448\\u0438\\u0431\\u043a\\u0430, \\u0442\\u043e, \\u043f\\u043e\\u0436\\u0430\\u043b\\u0443\\u0439\\u0441\\u0442\\u0430, \\u0432\\u0435\\u0440\\u043d\\u0438\\u0442\\u0435\\u0441\\u044c \\u0438 \\u043f\\u043e\\u043f\\u0440\\u043e\\u0431\\u0443\\u0439\\u0442\\u0435 \\u0435\\u0449\\u0451 \\u0440\\u0430\\u0437, \\u0438\\u0437\\u0431\\u0435\\u0433\\u0430\\u044f \\u0442\\u0430\\u043a\\u0438\\u0445 \\u0441\\u043b\\u043e\\u0432 \\u043a\\u0430\\u043a <i>www, http,<\\/i> \\u0438 \\u0442\\u0430\\u043a \\u0434\\u0430\\u043b\\u0435\\u0435.","spam_detected_textdisplay":"1","stdcaptchadisplay":"0","stdcaptcha":"\\u041a\\u043b\\u044e\\u0447 \\u0437\\u0430\\u0449\\u0438\\u0442\\u044b","stdcaptchatype":"0","stdcaptcha_length":"5","stdcaptchawidth":"150","stdcaptchaheight":"75","stdcaptchafont":"-1","stdcaptchafontmin":"14","stdcaptchafontmax":"20","stdcaptchaangle":"20","stdcaptcha_backgroundcolor":"#ffffff","stdcaptcha_textcolor":"#191919","stdcaptcha_disturbcolor":"#c8c8c8","layout":"_:default","stylesheet":"neon.css","moduleclass_sfx":"","acymailing":"0","acymailing_checkboxes":"hidden|hidden","acymailing_auto_checked":"0","jnews":"0","jnews_checkboxes":"hidden|hidden","jnews_auto_checked":"0","othernewsletters":"1"}', 0, '*');

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
(106, 0),
(107, 0),
(108, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `bzrnp_redirect_links`
--

INSERT INTO `bzrnp_redirect_links` (`id`, `old_url`, `new_url`, `referer`, `comment`, `hits`, `published`, `created_date`, `modified_date`) VALUES
(1, 'http://localhost/bulid/index.php/2014-06-27-07-33-20/krovelnye-elementy/item/tovar', '', 'http://localhost/bulid/index.php/2014-06-27-07-33-20/krovelnye-elementy', '', 3, 0, '2014-07-09 07:14:37', '0000-00-00 00:00:00'),
(2, 'http://localhost/index.php/index.php?format=raw&tmpl=component', '', 'http://localhost/index.php/2014-06-27-07-33-20?e%5B_itemname%5D=%D0%A2%D0%BE%D0%B2%D0%B0%D1%80+4&limit=20&order%5Bfield%5D=_none&order%5Bmode%5D=s&ord', '', 5, 0, '2014-07-11 07:44:40', '0000-00-00 00:00:00'),
(3, 'http://localhost/index.php/generatingPDF.php', '', 'http://localhost/index.php/2014-06-27-07-33-20?controller=basket&task=index&app_id=2&nocache=851233452', '', 4, 0, '2014-07-15 10:47:15', '0000-00-00 00:00:00'),
(4, 'http://localhost/index.php/printPDF.php', '', 'http://localhost/index.php/2014-06-27-07-33-20?controller=basket&task=index&app_id=2&nocache=792696277', '', 1, 0, '2014-07-15 11:37:44', '0000-00-00 00:00:00'),
(5, 'http://localhost/index.php/component/zoo/?controller=basket&task=index&app_id=0&Itemid=0&nocache=917751005', '', '', '', 1, 0, '2014-07-21 13:37:36', '0000-00-00 00:00:00'),
(6, 'http://localhost/build2/index.php/2014-06-27-07-33-20/krovelnye-elementy/expressInstall.swf', '', 'http://localhost/build2/index.php/2014-06-27-07-33-20/krovelnye-elementy/krovelnyj-istrument-i-oborudovanie', '', 1, 0, '2014-07-24 06:30:01', '0000-00-00 00:00:00'),
(7, 'http://localhost/build2/index.php/2014-06-27-07-33-20/krovelnye-elementy/templates/krovlya/images/price.png', '', '', '', 1, 0, '2014-07-24 13:55:44', '0000-00-00 00:00:00'),
(8, 'http://localhost/build2/index.php/2014-06-27-07-33-20/krovelnye-elementy/http:/http:/localhost/build2/templates/krovlya/images/price.png', '', '', '', 1, 0, '2014-07-24 14:04:09', '0000-00-00 00:00:00'),
(9, 'http://localhost/build2/index.php/2014-06-27-07-39-20', '', 'http://localhost/build2/', '', 1, 0, '2014-07-25 05:34:14', '0000-00-00 00:00:00');

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
(700, '2.5.22'),
(10047, '1.9.0');

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
('kgvguaniiru41e66mgb2ionrb7', 1, 0, '1406267753', '__default|a:8:{s:15:"session.counter";i:73;s:19:"session.timer.start";i:1406265349;s:18:"session.timer.last";i:1406267751;s:17:"session.timer.now";i:1406267753;s:22:"session.client.browser";s:102:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":5:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:11:"com_modules";O:8:"stdClass":3:{s:7:"modules";O:8:"stdClass":4:{s:6:"filter";O:8:"stdClass":8:{s:18:"client_id_previous";i:0;s:6:"search";s:0:"";s:6:"access";i:0;s:5:"state";s:0:"";s:8:"position";s:0:"";s:6:"module";s:0:"";s:9:"client_id";i:0;s:8:"language";s:0:"";}s:10:"limitstart";s:1:"0";s:8:"ordercol";s:8:"position";s:9:"orderdirn";s:3:"asc";}s:4:"edit";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:2:"id";a:2:{i:0;i:101;i:1;i:102;}s:4:"data";N;}}s:3:"add";O:8:"stdClass":1:{s:6:"module";O:8:"stdClass":2:{s:12:"extension_id";N;s:6:"params";N;}}}s:6:"global";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:0;}}s:17:"com_nivosliderpro";O:8:"stdClass":1:{s:4:"edit";O:8:"stdClass":1:{s:4:"item";O:8:"stdClass":2:{s:2:"id";a:0:{}s:4:"data";N;}}}}}s:4:"user";O:5:"JUser":25:{s:9:"\0*\0isRoot";b:1;s:2:"id";s:2:"42";s:4:"name";s:10:"Super User";s:8:"username";s:5:"admin";s:5:"email";s:14:"admin@build.ru";s:8:"password";s:34:"$P$DVaHMrUe53xf8rND0M9IitdZBgikoE0";s:14:"password_clear";s:0:"";s:8:"usertype";s:10:"deprecated";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2014-06-27 06:56:38";s:13:"lastvisitDate";s:19:"2014-07-24 11:26:00";s:10:"activation";s:1:"0";s:6:"params";s:2:"{}";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\0*\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"e728122f1e95d72f667b27e127974856";}', 42, 'admin', ''),
('76893945d9354fc558b3d71c296d039b', 0, 1, '1406267769', '__default|a:7:{s:22:"session.client.browser";s:102:"Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36";s:15:"session.counter";i:6;s:8:"registry";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:4:"user";O:5:"JUser":26:{s:9:"\0*\0isRoot";b:0;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:0:{}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\0*\0_params";O:9:"JRegistry":1:{s:7:"\0*\0data";O:8:"stdClass":0:{}}s:14:"\0*\0_authGroups";a:1:{i:0;i:1;}s:14:"\0*\0_authLevels";a:2:{i:0;i:1;i:1;i:1;}s:15:"\0*\0_authActions";N;s:12:"\0*\0_errorMsg";N;s:10:"\0*\0_errors";a:0:{}s:3:"aid";i:0;s:10:"superadmin";N;}s:19:"session.timer.start";i:1406267447;s:18:"session.timer.last";i:1406267767;s:17:"session.timer.now";i:1406267769;}', 0, '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=80 ;

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
(67, 4, 0, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '2.5.22.1', '', 'http://update.joomla.org/language/details/ru-RU_details.xml', ''),
(68, 4, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(69, 4, 0, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/fr-FR_details.xml', ''),
(70, 4, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(71, 4, 0, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/it-IT_details.xml', ''),
(72, 4, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(73, 4, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(74, 4, 0, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ja-JP_details.xml', ''),
(75, 4, 0, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ar-AA_details.xml', ''),
(76, 4, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(77, 4, 0, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/pl-PL_details.xml', ''),
(78, 4, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', ''),
(79, 4, 0, 0, 'Tamil India', '', 'pkg_ta-IN', 'package', '', 0, '2.5.23.1', '', 'http://update.joomla.org/language/details/ta-IN_details.xml', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `bzrnp_update_sites`
--

INSERT INTO `bzrnp_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 0, 1405590115),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1406265355),
(5, 'JUNewsUltra', 'extension', 'http://www.joomla-ua.org/update/mod/junewsultra.xml', 0, 1403863764),
(3, 'Joomla! Russia Updates', 'collection', 'http://joomlaportal.ru/translations.xml', 0, 0),
(4, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist.xml', 1, 1406265355),
(6, 'Foxcontact update site', 'extension', 'http://www.fox.ra.it/phocadownload/foxcontact.xml', 0, 1405335982);

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
(5, 10037),
(6, 10047);

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
(42, 'Super User', 'admin', 'admin@build.ru', '$P$DVaHMrUe53xf8rND0M9IitdZBgikoE0', 'deprecated', 0, 1, '2014-06-27 06:56:38', '2014-07-25 05:15:52', '0', '{}', '0000-00-00 00:00:00', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `bzrnp_zoo_application`
--

INSERT INTO `bzrnp_zoo_application` (`id`, `name`, `alias`, `application_group`, `description`, `params`) VALUES
(1, 'Список товаров', 'stroitelnaya-kompaniya-centr', 'jbuniversal', '', ' {\n	"group": "jbuniversal",\n	"template": "catalog",\n	"global.config.yoo_support": "0",\n	"global.config.rborder": "0",\n	"global.config.column_heightfix": "0",\n	"global.config.wrap_item_style": "div",\n	"global.config.category_image_height": "150",\n	"global.config.category_image_width": "150",\n	"global.config.show_feed_link": "0",\n	"global.config.feed_title": "",\n	"global.config.alternate_feed_link": "",\n	"global.config.category_teaser_image_height": "50",\n	"global.config.category_teaser_image_width": "50",\n	"global.config.items_per_page": "20",\n	"global.config.item_order":  {\n		"0": "_jbzoo_0_field__none",\n		"1": "_jbzoo_0_mode_s",\n		"2": "_jbzoo_0_order_asc"\n	},\n	"global.config.alpha_index": "0",\n	"global.config.alpha_chars": "0",\n	"global.config.layout_frontpage": "__auto__",\n	"global.config.layout_category": "__auto__",\n	"global.config.layout_subcategory": "__auto__",\n	"global.config.layout_subcategory_columns": "__auto__",\n	"global.config.layout_subcategories": "__auto__",\n	"global.config.layout_items": "__auto__",\n	"global.config.layout_item_columns": "__auto__",\n	"global.config.layout_alphaindex": "__auto__",\n	"global.config.layout_pagination": "__auto__",\n	"global.config.layout_tag": "__auto__",\n	"global.config.layout_comments": "__auto__",\n	"global.config.layout_comment": "__auto__",\n	"global.config.layout_respond": "__auto__",\n	"global.config.layout_mysubmissions": "__auto__",\n	"global.config.layout_administration": "__auto__",\n	"global.config.layout_submission": "__auto__",\n	"global.config.lastmodified": "1405948650",\n	"global.template.show_alpha_index": "0",\n	"global.template.category_title_show": "1",\n	"global.template.category_show": "1",\n	"global.template.category_subtitle": "1",\n	"global.template.category_teaser_text": "1",\n	"global.template.category_image": "1",\n	"global.template.category_image_align": "left",\n	"global.template.category_text": "1",\n	"global.template.subcategory_show": "1",\n	"global.template.subcategory_teaser_text": "1",\n	"global.template.subcategory_teaser_image": "1",\n	"global.template.subcategory_teaser_image_align": "center",\n	"global.template.subcategory_empty": "1",\n	"global.template.subcategory_cols": "3",\n	"global.template.subcategory_order": "0",\n	"global.template.subcategory_items_count_show": "0",\n	"global.template.subcategory_items_count": "100",\n	"global.template.item_cols": "3",\n	"global.template.item_order": "0",\n	"global.template.item_pagination": "0",\n	"global.template.lastmodified": "1405948650",\n	"global.template.item_full_image_align": "left",\n	"global.template.item_teaser_image_align": "left",\n	"global.template.item_related_image_align": "left",\n	"global.template.item_subcategory_item_image_align": "left",\n	"global.jbzoo_cart_config.enable": "1",\n	"global.jbzoo_cart_config.is_advance": "1",\n	"global.jbzoo_cart_config.auth": "0",\n	"global.jbzoo_cart_config.submission-id": "1",\n	"global.jbzoo_cart_config.type-layout": "order:item.order.order",\n	"global.jbzoo_cart_config.currency": "RUB",\n	"global.jbzoo_cart_config.element-image":  {\n		"0": "84081cd8-d154-4247-8363-ec2e9b89aa94"\n	},\n	"global.jbzoo_cart_config.minimal-summa": "",\n	"global.jbzoo_cart_config.notificaction-create": "1",\n	"global.jbzoo_cart_config.notificaction-payment": "1",\n	"global.jbzoo_cart_config.admin-email": "",\n	"global.jbzoo_cart_config.email-admin-layout": "",\n	"global.jbzoo_cart_config.email-admin-layout-payment": "",\n	"global.jbzoo_cart_config.email-user-layout": "",\n	"global.jbzoo_cart_config.email-user-layout-payment": "",\n	"global.jbzoo_cart_config.nopaid-order": "1",\n	"global.jbzoo_cart_config.payment-enabled": "0",\n	"global.jbzoo_cart_config.payment-page-success": "",\n	"global.jbzoo_cart_config.payment-page-fail": "",\n	"global.jbzoo_cart_config.paypal-enabled": "0",\n	"global.jbzoo_cart_config.paypal-debug": "0",\n	"global.jbzoo_cart_config.paypal-email": "",\n	"global.jbzoo_cart_config.robox-enabled": "0",\n	"global.jbzoo_cart_config.robox-debug": "0",\n	"global.jbzoo_cart_config.robox-login": "admin",\n	"global.jbzoo_cart_config.robox-password1": "admin",\n	"global.jbzoo_cart_config.robox-password2": "",\n	"global.jbzoo_cart_config.ikassa-enabled": "0",\n	"global.jbzoo_cart_config.ikassa-new": "0",\n	"global.jbzoo_cart_config.ikassa-shopid": "",\n	"global.jbzoo_cart_config.ikassa-key": "",\n	"global.jbzoo_cart_config.ikassa-key-test": "",\n	"global.jbzoo_cart_config.manual-enabled": "0",\n	"global.jbzoo_cart_config.manual-title": "",\n	"global.jbzoo_cart_config.manual-text": "",\n	"global.jbzoo_cart_config.manual-message": "",\n	"global.comments.enable_comments": "1",\n	"global.comments.require_name_and_mail": "1",\n	"global.comments.registered_users_only": "0",\n	"global.comments.approved": "0",\n	"global.comments.time_between_user_posts": "120",\n	"global.comments.email_notification": "",\n	"global.comments.email_reply_notification": "0",\n	"global.comments.avatar": "1",\n	"global.comments.order": "ASC",\n	"global.comments.max_depth": "5",\n	"global.comments.facebook_enable": "0",\n	"global.comments.facebook_app_id": "",\n	"global.comments.facebook_app_secret": "",\n	"global.comments.twitter_enable": "0",\n	"global.comments.twitter_consumer_key": "",\n	"global.comments.twitter_consumer_secret": "",\n	"global.comments.akismet_enable": "0",\n	"global.comments.akismet_api_key": "",\n	"global.comments.mollom_enable": "0",\n	"global.comments.mollom_public_key": "",\n	"global.comments.mollom_private_key": "",\n	"global.comments.captcha": "",\n	"global.comments.captcha_guest_only": "1",\n	"global.comments.blacklist": ""\n}'),
(2, 'Заказы', 'zakazy', 'jbuniversal', '', ' {\n	"group": "jbuniversal",\n	"template": "catalog",\n	"global.config.yoo_support": "1",\n	"global.config.rborder": "1",\n	"global.config.column_heightfix": "0",\n	"global.config.wrap_item_style": "div",\n	"global.config.category_image_height": "150",\n	"global.config.category_image_width": "150",\n	"global.config.show_feed_link": "0",\n	"global.config.feed_title": "",\n	"global.config.alternate_feed_link": "",\n	"global.config.category_teaser_image_height": "50",\n	"global.config.category_teaser_image_width": "50",\n	"global.config.items_per_page": "20",\n	"global.config.item_order":  {\n		"0": "_jbzoo_0_field__none",\n		"1": "_jbzoo_0_mode_s",\n		"2": "_jbzoo_0_order_asc"\n	},\n	"global.config.alpha_index": "0",\n	"global.config.alpha_chars": "0",\n	"global.config.layout_frontpage": "__auto__",\n	"global.config.layout_category": "__auto__",\n	"global.config.layout_subcategory": "__auto__",\n	"global.config.layout_subcategory_columns": "__auto__",\n	"global.config.layout_subcategories": "__auto__",\n	"global.config.layout_items": "__auto__",\n	"global.config.layout_item_columns": "__auto__",\n	"global.config.layout_alphaindex": "__auto__",\n	"global.config.layout_pagination": "__auto__",\n	"global.config.layout_tag": "__auto__",\n	"global.config.layout_comments": "__auto__",\n	"global.config.layout_comment": "__auto__",\n	"global.config.layout_respond": "__auto__",\n	"global.config.layout_mysubmissions": "__auto__",\n	"global.config.layout_administration": "__auto__",\n	"global.config.layout_submission": "__auto__",\n	"global.config.lastmodified": "1405948686",\n	"global.template.show_alpha_index": "0",\n	"global.template.category_title_show": "1",\n	"global.template.category_show": "1",\n	"global.template.category_subtitle": "1",\n	"global.template.category_teaser_text": "1",\n	"global.template.category_image": "1",\n	"global.template.category_image_align": "left",\n	"global.template.category_text": "1",\n	"global.template.subcategory_show": "1",\n	"global.template.subcategory_teaser_text": "1",\n	"global.template.subcategory_teaser_image": "1",\n	"global.template.subcategory_teaser_image_align": "left",\n	"global.template.subcategory_empty": "1",\n	"global.template.subcategory_cols": "1",\n	"global.template.subcategory_order": "0",\n	"global.template.subcategory_items_count_show": "1",\n	"global.template.subcategory_items_count": "5",\n	"global.template.item_cols": "1",\n	"global.template.item_order": "0",\n	"global.template.item_pagination": "1",\n	"global.template.lastmodified": "1405948686",\n	"global.template.item_full_image_align": "left",\n	"global.template.item_teaser_image_align": "left",\n	"global.template.item_related_image_align": "left",\n	"global.template.item_subcategory_item_image_align": "left",\n	"global.jbzoo_cart_config.enable": "1",\n	"global.jbzoo_cart_config.is_advance": "1",\n	"global.jbzoo_cart_config.auth": "0",\n	"global.jbzoo_cart_config.submission-id": "2",\n	"global.jbzoo_cart_config.type-layout": "order:item.order.order",\n	"global.jbzoo_cart_config.currency": "RUB",\n	"global.jbzoo_cart_config.element-image":  {\n		"0": "84081cd8-d154-4247-8363-ec2e9b89aa94"\n	},\n	"global.jbzoo_cart_config.minimal-summa": "",\n	"global.jbzoo_cart_config.notificaction-create": "1",\n	"global.jbzoo_cart_config.notificaction-payment": "1",\n	"global.jbzoo_cart_config.admin-email": "",\n	"global.jbzoo_cart_config.email-admin-layout": "",\n	"global.jbzoo_cart_config.email-admin-layout-payment": "",\n	"global.jbzoo_cart_config.email-user-layout": "",\n	"global.jbzoo_cart_config.email-user-layout-payment": "",\n	"global.jbzoo_cart_config.nopaid-order": "0",\n	"global.jbzoo_cart_config.payment-enabled": "0",\n	"global.jbzoo_cart_config.payment-page-success": "",\n	"global.jbzoo_cart_config.payment-page-fail": "",\n	"global.jbzoo_cart_config.paypal-enabled": "0",\n	"global.jbzoo_cart_config.paypal-debug": "0",\n	"global.jbzoo_cart_config.paypal-email": "",\n	"global.jbzoo_cart_config.robox-enabled": "0",\n	"global.jbzoo_cart_config.robox-debug": "0",\n	"global.jbzoo_cart_config.robox-login": "admin",\n	"global.jbzoo_cart_config.robox-password1": "admin",\n	"global.jbzoo_cart_config.robox-password2": "",\n	"global.jbzoo_cart_config.ikassa-enabled": "0",\n	"global.jbzoo_cart_config.ikassa-new": "0",\n	"global.jbzoo_cart_config.ikassa-shopid": "",\n	"global.jbzoo_cart_config.ikassa-key": "",\n	"global.jbzoo_cart_config.ikassa-key-test": "",\n	"global.jbzoo_cart_config.manual-enabled": "0",\n	"global.jbzoo_cart_config.manual-title": "",\n	"global.jbzoo_cart_config.manual-text": "",\n	"global.jbzoo_cart_config.manual-message": "",\n	"global.comments.enable_comments": "1",\n	"global.comments.require_name_and_mail": "1",\n	"global.comments.registered_users_only": "0",\n	"global.comments.approved": "0",\n	"global.comments.time_between_user_posts": "120",\n	"global.comments.email_notification": "",\n	"global.comments.email_reply_notification": "0",\n	"global.comments.avatar": "1",\n	"global.comments.order": "ASC",\n	"global.comments.max_depth": "5",\n	"global.comments.facebook_enable": "0",\n	"global.comments.facebook_app_id": "",\n	"global.comments.facebook_app_secret": "",\n	"global.comments.twitter_enable": "0",\n	"global.comments.twitter_consumer_key": "",\n	"global.comments.twitter_consumer_secret": "",\n	"global.comments.akismet_enable": "0",\n	"global.comments.akismet_api_key": "",\n	"global.comments.mollom_enable": "0",\n	"global.comments.mollom_public_key": "",\n	"global.comments.mollom_private_key": "",\n	"global.comments.captcha": "",\n	"global.comments.captcha_guest_only": "1",\n	"global.comments.blacklist": ""\n}'),
(3, 'Список городов', 'spisok-gorodov', 'jbuniversal', '', ' {\n	"group": "jbuniversal",\n	"template": "catalog",\n	"global.config.yoo_support": "0",\n	"global.config.rborder": "0",\n	"global.config.column_heightfix": "0",\n	"global.config.wrap_item_style": "div",\n	"global.config.category_image_height": "150",\n	"global.config.category_image_width": "150",\n	"global.config.show_feed_link": "0",\n	"global.config.feed_title": "",\n	"global.config.alternate_feed_link": "",\n	"global.config.category_teaser_image_height": "50",\n	"global.config.category_teaser_image_width": "50",\n	"global.config.items_per_page": "20",\n	"global.config.item_order":  {\n		"0": "_jbzoo_0_field__none",\n		"1": "_jbzoo_0_mode_s",\n		"2": "_jbzoo_0_order_asc"\n	},\n	"global.config.alpha_index": "0",\n	"global.config.alpha_chars": "0",\n	"global.config.layout_frontpage": "__auto__",\n	"global.config.layout_category": "__auto__",\n	"global.config.layout_subcategory": "__auto__",\n	"global.config.layout_subcategory_columns": "__auto__",\n	"global.config.layout_subcategories": "__auto__",\n	"global.config.layout_items": "__auto__",\n	"global.config.layout_item_columns": "__auto__",\n	"global.config.layout_alphaindex": "__auto__",\n	"global.config.layout_pagination": "__auto__",\n	"global.config.layout_tag": "__auto__",\n	"global.config.layout_comments": "__auto__",\n	"global.config.layout_comment": "__auto__",\n	"global.config.layout_respond": "__auto__",\n	"global.config.layout_mysubmissions": "__auto__",\n	"global.config.layout_administration": "__auto__",\n	"global.config.layout_submission": "__auto__",\n	"global.config.lastmodified": "1405078267",\n	"global.template.show_alpha_index": "0",\n	"global.template.category_title_show": "1",\n	"global.template.category_show": "1",\n	"global.template.category_subtitle": "1",\n	"global.template.category_teaser_text": "1",\n	"global.template.category_image": "1",\n	"global.template.category_image_align": "left",\n	"global.template.category_text": "1",\n	"global.template.subcategory_show": "1",\n	"global.template.subcategory_teaser_text": "1",\n	"global.template.subcategory_teaser_image": "1",\n	"global.template.subcategory_teaser_image_align": "left",\n	"global.template.subcategory_empty": "1",\n	"global.template.subcategory_cols": "1",\n	"global.template.subcategory_order": "0",\n	"global.template.subcategory_items_count_show": "1",\n	"global.template.subcategory_items_count": "5",\n	"global.template.item_cols": "1",\n	"global.template.item_order": "0",\n	"global.template.item_pagination": "1",\n	"global.template.lastmodified": "1405078268",\n	"global.template.item_full_image_align": "left",\n	"global.template.item_teaser_image_align": "left",\n	"global.template.item_related_image_align": "left",\n	"global.template.item_subcategory_item_image_align": "left",\n	"global.jbzoo_cart_config.enable": "0",\n	"global.jbzoo_cart_config.is_advance": "0",\n	"global.jbzoo_cart_config.auth": "0",\n	"global.jbzoo_cart_config.submission-id": "",\n	"global.jbzoo_cart_config.type-layout": "order:item.order.order",\n	"global.jbzoo_cart_config.currency": "EUR",\n	"global.jbzoo_cart_config.minimal-summa": "",\n	"global.jbzoo_cart_config.notificaction-create": "1",\n	"global.jbzoo_cart_config.notificaction-payment": "1",\n	"global.jbzoo_cart_config.admin-email": "",\n	"global.jbzoo_cart_config.email-admin-layout": "item.order.orderemail",\n	"global.jbzoo_cart_config.email-admin-layout-payment": "",\n	"global.jbzoo_cart_config.email-user-layout": "item.order.orderemail",\n	"global.jbzoo_cart_config.email-user-layout-payment": "",\n	"global.jbzoo_cart_config.nopaid-order": "0",\n	"global.jbzoo_cart_config.payment-enabled": "0",\n	"global.jbzoo_cart_config.payment-page-success": "",\n	"global.jbzoo_cart_config.payment-page-fail": "",\n	"global.jbzoo_cart_config.paypal-enabled": "0",\n	"global.jbzoo_cart_config.paypal-debug": "0",\n	"global.jbzoo_cart_config.paypal-email": "",\n	"global.jbzoo_cart_config.robox-enabled": "0",\n	"global.jbzoo_cart_config.robox-debug": "0",\n	"global.jbzoo_cart_config.robox-login": "admin",\n	"global.jbzoo_cart_config.robox-password1": "admin",\n	"global.jbzoo_cart_config.robox-password2": "",\n	"global.jbzoo_cart_config.ikassa-enabled": "0",\n	"global.jbzoo_cart_config.ikassa-new": "0",\n	"global.jbzoo_cart_config.ikassa-shopid": "",\n	"global.jbzoo_cart_config.ikassa-key": "",\n	"global.jbzoo_cart_config.ikassa-key-test": "",\n	"global.jbzoo_cart_config.manual-enabled": "0",\n	"global.jbzoo_cart_config.manual-title": "",\n	"global.jbzoo_cart_config.manual-text": "",\n	"global.jbzoo_cart_config.manual-message": "",\n	"global.comments.enable_comments": "1",\n	"global.comments.require_name_and_mail": "1",\n	"global.comments.registered_users_only": "0",\n	"global.comments.approved": "0",\n	"global.comments.time_between_user_posts": "120",\n	"global.comments.email_notification": "",\n	"global.comments.email_reply_notification": "0",\n	"global.comments.avatar": "1",\n	"global.comments.order": "ASC",\n	"global.comments.max_depth": "5",\n	"global.comments.facebook_enable": "0",\n	"global.comments.facebook_app_id": "",\n	"global.comments.facebook_app_secret": "",\n	"global.comments.twitter_enable": "0",\n	"global.comments.twitter_consumer_key": "",\n	"global.comments.twitter_consumer_secret": "",\n	"global.comments.akismet_enable": "0",\n	"global.comments.akismet_api_key": "",\n	"global.comments.mollom_enable": "0",\n	"global.comments.mollom_public_key": "",\n	"global.comments.mollom_private_key": "",\n	"global.comments.captcha": "",\n	"global.comments.captcha_guest_only": "1",\n	"global.comments.blacklist": ""\n}');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Дамп данных таблицы `bzrnp_zoo_category`
--

INSERT INTO `bzrnp_zoo_category` (`id`, `application_id`, `name`, `alias`, `description`, `parent`, `ordering`, `published`, `params`) VALUES
(1, 1, 'Кровля', 'krovlya', '', 0, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864112",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(2, 1, 'Фасад', 'fasad', '', 0, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864178",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(3, 1, 'Стена', 'stena', '', 0, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864230",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(4, 1, 'Забор', 'zabor', '', 0, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864242",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(5, 1, 'Мой любимый дом', 'moj-lyubimyj-dom', '', 0, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403864255",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(8, 1, 'Материалы для кровли', 'materialy-dlya-krovli', '', 1, 8, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/materials.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110966",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110966",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(9, 1, 'Отделочные элементы кровли', 'otdelochnye-elementy-krovli', '', 1, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/otdelka.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110947",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110947",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(10, 1, 'Водостоки', 'vodostoki', '', 1, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/voda.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110923",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110924",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(11, 1, 'Крепеж', 'krepezh', '', 1, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/shurup.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110901",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110901",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(12, 1, 'Стропила и обрешетка (пиломатериал)', 'stropila-i-obreshetka-pilomaterial', '', 1, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/stropila.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110880",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110880",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(13, 1, 'Гидроизоляция', 'gidroizolyaciya', '', 1, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/gidro.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110861",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110861",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(14, 1, 'Снегозадержатели и элементы безопасности', 'snegozaderzhateli-i-elementy-bezopasnosti', '', 1, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/snow.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110833",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110833",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(15, 1, 'Подшив карниза', 'podshiv-karniza', '', 1, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/karniz.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110811",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110811",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(16, 1, 'Кровельные элементы', 'krovelnye-elementy', '', 1, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/elements.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.alpha_index": "0",\n	"config.alpha_chars": "0",\n	"config.layout_frontpage": "__auto__",\n	"config.lastmodified": "1406110784",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_image_align": "left",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "0",\n	"template.lastmodified": "1406110784",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(17, 1, 'Металлочерепица', 'metallocherepica', '', 8, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/metalocherepica.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111585",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111585",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(18, 1, 'Профнастил', 'profnastil', '', 8, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/profnastil.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111559",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111559",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(19, 1, 'Гибкая черепица', 'gibkaya-cherepica', '', 8, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/bitumnaycherepica.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111464",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111465",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(24, 1, 'Керамическая черепица', 'keramicheskaya-cherepica', '', 8, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/keramicheskaya-cherepica.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111300",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111300",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(21, 1, 'Ондулин', 'ondulin', '', 8, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/ondulin-rasschitat.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111433",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111433",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(22, 1, 'Шифер волновой', 'shifer-volnovoj', '', 8, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/shifer.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111384",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111384",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(23, 1, 'Наплавляемая кровля', 'naplavlyaemaya-krovlya', '', 8, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/krovlya3.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111528",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111528",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(29, 1, 'Благоустройство', 'blagoustrojstvo', '', 5, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866763",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(30, 1, 'Дренажные системы', 'drenazhnye-sistemy', '', 29, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403866906",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(31, 1, 'Тротуарная плитка', 'trotuarnaya-plitka', '', 29, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867052",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(32, 1, 'Террасная доска', 'terrasnaya-doska', '', 29, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867075",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(33, 1, 'Песок для песочниц', 'pesok-dlya-pesochnic', '', 29, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867096",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(34, 1, 'Туалет для дачи', 'tualet-dlya-dachi', '', 29, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867117",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(35, 1, 'Беседки', 'besedki', '', 5, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867136",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(36, 1, 'Теплицы', 'teplicy', '', 5, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867161",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(37, 1, 'Поликарбонат', 'polikarbonat', '', 5, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867176",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(38, 1, 'Забор из профнастила', 'zabor-iz-profnastila', '', 4, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867196",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(39, 1, 'Забор из сетки-рабицы', 'zabor-iz-setki-rabicy', '', 4, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867246",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(40, 1, '3D забор', '3d-zabor', '', 4, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867270",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(41, 1, 'Металлический штакетник', 'metallicheskij-shtaketnik', '', 4, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867296",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(42, 1, 'Элементы устройства забора', 'elementy-ustrojstva-zabora', '', 4, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867318",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(43, 1, 'Трехслойные сэндвич-панели', 'trehslojnye-sendvich-paneli', '', 3, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867342",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(44, 1, 'Сэндвич-панели поэлементной сборки', 'sendvich-paneli-poelementnoj-sborki', '', 3, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867382",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(45, 1, 'Сайдинг Металлический', 'sajding-metallicheskij', '', 2, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867415",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(46, 1, 'Сайдинг пластиковый', 'sajding-plastokoviy', '', 2, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867450",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(47, 1, 'Панели стеновые', 'paneli-stenovye', '', 2, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867493",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(48, 1, 'Панели металлические', 'paneli-metallicheskie', '', 47, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867519",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(49, 1, 'Панели пластиковые', 'paneli-plastikovye', '', 47, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867546",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(50, 1, 'Блок-хаус', 'blok-haus', '', 2, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867570",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(51, 1, 'Профнастил', 'profnastil-2', '', 2, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867598",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(52, 1, 'Элементы несущего каркаса', 'elementy-nesushhego-karkasa', '', 2, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1403867711",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(53, 1, 'Кровельная вентиляция', 'krovelnaya-ventilyaciya', '', 16, 9, 0, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/ventila.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112240",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112240",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(54, 1, 'Теплоизоляция', 'teploizolyaciya', '', 16, 8, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/teplo.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112174",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112174",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(55, 1, 'Эмаль ремонтная', 'emal-remontnaya', '', 16, 7, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/emal.JPG",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112145",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112145",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}');
INSERT INTO `bzrnp_zoo_category` (`id`, `application_id`, `name`, `alias`, `description`, `parent`, `ordering`, `published`, `params`) VALUES
(56, 1, 'Уплотнители', 'uplotniteli', '', 16, 6, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/uplotniteli.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112116",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112116",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(57, 1, 'Мансардные окна', 'mansardnye-okna', '', 16, 5, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/okna.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112084",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112084",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(58, 1, 'Чердачные лестницы', 'cherdachnye-lestnicy', '', 16, 4, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/lesnica.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112048",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112048",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(59, 1, 'Антенные выходы', 'antennye-vyhody', '', 16, 3, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/antena.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406112025",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406112025",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(60, 1, 'Флюгеры', 'flyugery', '', 16, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/fluger_1.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111997",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111997",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(61, 1, 'OSB', 'osb', '', 16, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/osb.jpg",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406111967",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406111967",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(62, 1, 'Кровельный иструмент и оборудование', 'krovelnyj-istrument-i-oborudovanie', '', 16, 0, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "images\\/elements.png",\n	"content.category_teaser_image_width": "320",\n	"content.category_teaser_image_height": "190",\n	"config.lastmodified": "1406110563",\n	"template.show_alpha_index": "0",\n	"template.category_show": "1",\n	"template.category_subtitle": "1",\n	"template.category_teaser_text": "1",\n	"template.category_image": "1",\n	"template.category_text": "1",\n	"template.subcategory_show": "1",\n	"template.subcategory_teaser_text": "1",\n	"template.subcategory_teaser_image": "1",\n	"template.subcategory_empty": "1",\n	"template.item_pagination": "1",\n	"template.lastmodified": "1406110563",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(66, 3, 'Тамбовская область', 'tambovskaya-oblast', '', 0, 2, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"config.lastmodified": "1405080867",\n	"template.lastmodified": "1405080867",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}'),
(67, 3, 'Московская область', 'moskovskaya-oblast', '', 0, 1, 1, ' {\n	"content.category_title": "",\n	"content.category_subtitle": "",\n	"content.category_teaser_text": "",\n	"content.category_image": "",\n	"content.category_image_width": "",\n	"content.category_image_height": "",\n	"content.category_teaser_image": "",\n	"content.category_teaser_image_width": "",\n	"content.category_teaser_image_height": "",\n	"config.lastmodified": "1405325591",\n	"template.lastmodified": "1405325591",\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": ""\n}');

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
(62, 11),
(62, 12),
(62, 13),
(62, 28),
(62, 29),
(62, 30),
(62, 31),
(62, 32),
(66, 21),
(66, 22),
(66, 27),
(67, 23),
(67, 24);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `bzrnp_zoo_item`
--

INSERT INTO `bzrnp_zoo_item` (`id`, `application_id`, `type`, `name`, `alias`, `created`, `modified`, `modified_by`, `publish_up`, `publish_down`, `priority`, `hits`, `state`, `access`, `created_by`, `created_by_alias`, `searchable`, `elements`, `params`) VALUES
(28, 1, 'product', 'Плитка Эвро2', 'plitka-evro2', '2014-07-23 10:58:23', '2014-07-24 05:35:39', 42, '2014-07-23 10:58:23', '0000-00-00 00:00:00', 0, 7, 1, 1, 42, '', 1, ' {\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u043c2"\n		}\n	},\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/plitka.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "28",\n			"value": "0",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "RUB",\n			"description": ""\n		},\n		"variations":  {\n			"28-p1-moskva_p2-7005_p3-2x1":  {\n				"balance": -1,\n				"value": "300",\n				"currency": "RUB",\n				"sku": "28",\n				"param1": "moskva",\n				"param2": "7005",\n				"param3": "2x1",\n				"description": "",\n				"hash": "28-p1-moskva_p2-7005_p3-2x1"\n			},\n			"28-p1-lobnya_p2-5005_p3-1x2":  {\n				"balance": -1,\n				"value": "700",\n				"currency": "RUB",\n				"sku": "28",\n				"param1": "lobnya",\n				"param2": "5005",\n				"param3": "1x2",\n				"description": "",\n				"hash": "28-p1-lobnya_p2-5005_p3-1x2"\n			},\n			"28-p1-moskva_p2-5021_p3-1x2":  {\n				"balance": -1,\n				"value": "1200",\n				"currency": "RUB",\n				"sku": "28",\n				"param1": "moskva",\n				"param2": "5021",\n				"param3": "1x2",\n				"description": "",\n				"hash": "28-p1-moskva_p2-5021_p3-1x2"\n			}\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(11, 1, 'product', 'Товар 2', 'tovar-2', '2014-07-09 09:57:25', '2014-07-24 12:45:14', 42, '2014-07-09 09:57:25', '0000-00-00 00:00:00', 0, 9, 1, 1, 42, '', 1, ' {\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u043c2"\n		}\n	},\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "11",\n			"value": "500",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "%",\n			"description": ""\n		},\n		"variations":  {\n\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "",\n		"hits": "0",\n		"download_limit": "",\n		"size": 0\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/ondulin-rasschitat.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(12, 1, 'product', 'Товар 3', 'tovar-3', '2014-07-09 10:02:04', '2014-07-24 12:45:52', 42, '2014-07-09 10:02:04', '0000-00-00 00:00:00', 0, 56, 1, 1, 42, '', 1, ' {\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u0448\\u0442"\n		}\n	},\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "12",\n			"value": "43252345",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "%",\n			"description": ""\n		},\n		"variations":  {\n\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "",\n		"hits": "0",\n		"download_limit": "",\n		"size": 0\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/fluger_1.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": "<p><em><span style=\\"text-decoration: underline;\\"><strong>\\u041f\\u0440\\u0438\\u0432\\u0435\\u0442<\\/strong><\\/span><\\/em><\\/p>"\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n		"item":  {\n			"0": "13",\n			"1": "11"\n		}\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"option":  {\n			"0": "1014"\n		},\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(13, 1, 'product', 'Товар 4', 'tovar-4', '2014-07-09 10:05:00', '2014-07-24 09:21:12', 42, '2014-07-09 10:05:00', '0000-00-00 00:00:00', 0, 287, 1, 1, 42, '', 1, ' {\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u0448\\u0442"\n		}\n	},\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 1,\n			"sku": "13",\n			"value": "0",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "%",\n			"description": ""\n		},\n		"variations":  {\n			"13-p1-moskva_p2-1014_p3-2x1":  {\n				"balance": -1,\n				"value": "54677",\n				"currency": "RUB",\n				"sku": "13",\n				"param1": "moskva",\n				"param2": "1014",\n				"param3": "2x1",\n				"description": "",\n				"hash": "13-p1-moskva_p2-1014_p3-2x1"\n			},\n			"13-p1-moskva_p2-1015_p3-1x2":  {\n				"balance": -1,\n				"value": "888",\n				"currency": "RUB",\n				"sku": "13",\n				"param1": "moskva",\n				"param2": "1015",\n				"param3": "1x2",\n				"description": "",\n				"hash": "13-p1-moskva_p2-1015_p3-1x2"\n			},\n			"13-p1-moskva_p2-3005_p3-3x2":  {\n				"balance": -1,\n				"value": "333",\n				"currency": "RUB",\n				"sku": "13",\n				"param1": "moskva",\n				"param2": "3005",\n				"param3": "3x2",\n				"description": "",\n				"hash": "13-p1-moskva_p2-3005_p3-3x2"\n			},\n			"13-p1-lobnya_p2-3009_p3-1x2":  {\n				"balance": -1,\n				"value": "2000",\n				"currency": "RUB",\n				"sku": "13",\n				"param1": "lobnya",\n				"param2": "3009",\n				"param3": "1x2",\n				"description": "",\n				"hash": "13-p1-lobnya_p2-3009_p3-1x2"\n			}\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "",\n		"hits": "0",\n		"download_limit": "",\n		"size": 0\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/snow.png",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": "moskva"\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(15, 2, 'order', 'Заказ #15 / 2014-07-11 09:51:01 (GMT 2)', 'zakaz-id-2014-07-11-095101-gmt-2', '2014-07-11 09:51:00', '2014-07-11 09:51:00', 0, '2014-07-11 09:51:00', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"94e70ec3-41aa-421d-a729-2c38f32a864f":  {\n		"option":  {\n			"0": "da"\n		}\n	},\n	"df261d4a-60c3-493a-89bf-6d3dc4f9c803":  {\n		"option":  {\n\n		}\n	},\n	"7e7025e5-098f-4b84-ab81-e4b87200cfbb":  {\n		"0":  {\n\n		}\n	}\n}', ' {\n	"config.enable_comments": true,\n	"config.primary_category": 0\n}'),
(16, 2, 'order', 'Заказ #16 / 2014-07-11 10:03:17 (GMT 2)', 'zakaz-id-2014-07-11-100317-gmt-2', '2014-07-11 10:03:17', '2014-07-11 10:03:17', 0, '2014-07-11 10:03:17', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"94e70ec3-41aa-421d-a729-2c38f32a864f":  {\n		"option":  {\n			"0": "net"\n		}\n	},\n	"df261d4a-60c3-493a-89bf-6d3dc4f9c803":  {\n		"option":  {\n\n		}\n	},\n	"7e7025e5-098f-4b84-ab81-e4b87200cfbb":  {\n		"0":  {\n\n		}\n	}\n}', ' {\n	"config.enable_comments": true,\n	"config.primary_category": 0\n}'),
(17, 2, 'order', 'Заказ #17 / 2014-07-11 10:30:48 (GMT 2)', 'zakaz-id-2014-07-11-103048-gmt-2', '2014-07-11 10:30:48', '2014-07-11 10:30:48', 0, '2014-07-11 10:30:48', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"3c3db6d8-8b9e-4ab6-9e31-0704efea7614":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"a95eb051-c43b-4d58-b7c5-ec0cd26fc604":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"cadbb59a-7bdf-4ceb-b51d-ec51a3917230":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"2a2d6ee9-aa98-4169-8753-6b47843405d3":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"7db9c36f-6831-41b7-9814-8facfa8720ac":  {\n		"option":  {\n\n		}\n	},\n	"e0e2eb90-00a9-4ea1-ad90-5f9883994ad1":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"8edc46a7-40a0-4acd-a21f-5626ebca9021":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"c66506eb-3c81-4b8a-acd4-0ef98b3c8a32":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"0d1c2d06-85f0-41ea-a752-bff2efb83c34":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"4d1f32fb-4dd3-40f7-adff-650647e7c9dc":  {\n		"option":  {\n\n		}\n	},\n	"c743cc81-de39-4424-a7fd-5bb256fbf769":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"932755cf-9ac7-455a-82be-8fe11a159cb5":  {\n		"option":  {\n			"0": "oplata-bankovskoj-kartoj"\n		}\n	}\n}', ' {\n	"config.enable_comments": true,\n	"config.primary_category": 0\n}'),
(18, 2, 'order', 'Заказ #18 / 2014-07-11 10:34:42 (GMT 2)', 'zakaz-id-2014-07-11-103442-gmt-2', '2014-07-11 10:34:42', '2014-07-11 10:34:42', 0, '2014-07-11 10:34:42', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"3c3db6d8-8b9e-4ab6-9e31-0704efea7614":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"a95eb051-c43b-4d58-b7c5-ec0cd26fc604":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"cadbb59a-7bdf-4ceb-b51d-ec51a3917230":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"2a2d6ee9-aa98-4169-8753-6b47843405d3":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"7db9c36f-6831-41b7-9814-8facfa8720ac":  {\n		"option":  {\n			"0": "dostavka-kurerom"\n		}\n	},\n	"e0e2eb90-00a9-4ea1-ad90-5f9883994ad1":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"8edc46a7-40a0-4acd-a21f-5626ebca9021":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"c66506eb-3c81-4b8a-acd4-0ef98b3c8a32":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"0d1c2d06-85f0-41ea-a752-bff2efb83c34":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"4d1f32fb-4dd3-40f7-adff-650647e7c9dc":  {\n		"option":  {\n\n		}\n	},\n	"c743cc81-de39-4424-a7fd-5bb256fbf769":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"932755cf-9ac7-455a-82be-8fe11a159cb5":  {\n		"option":  {\n			"0": "oplata-po-schetu-cherez-lyuboj-bank"\n		}\n	}\n}', ' {\n	"config.enable_comments": true,\n	"config.primary_category": 0\n}'),
(19, 2, 'order', 'Заказ #19 / 2014-07-11 10:44:40 (GMT 2)', 'zakaz-id-2014-07-11-104440-gmt-2', '2014-07-11 10:44:40', '2014-07-11 10:44:40', 0, '2014-07-11 10:44:40', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"3c3db6d8-8b9e-4ab6-9e31-0704efea7614":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"a95eb051-c43b-4d58-b7c5-ec0cd26fc604":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"cadbb59a-7bdf-4ceb-b51d-ec51a3917230":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"2a2d6ee9-aa98-4169-8753-6b47843405d3":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"7db9c36f-6831-41b7-9814-8facfa8720ac":  {\n		"option":  {\n\n		}\n	},\n	"e0e2eb90-00a9-4ea1-ad90-5f9883994ad1":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"8edc46a7-40a0-4acd-a21f-5626ebca9021":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"c66506eb-3c81-4b8a-acd4-0ef98b3c8a32":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"0d1c2d06-85f0-41ea-a752-bff2efb83c34":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"4d1f32fb-4dd3-40f7-adff-650647e7c9dc":  {\n		"option":  {\n\n		}\n	},\n	"c743cc81-de39-4424-a7fd-5bb256fbf769":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"932755cf-9ac7-455a-82be-8fe11a159cb5":  {\n		"option":  {\n\n		}\n	}\n}', ' {\n	"config.enable_comments": true,\n	"config.primary_category": 0\n}'),
(22, 3, 'gorod', 'город а', 'gorod-a', '2014-07-14 08:38:41', '2014-07-14 08:39:12', 42, '2014-07-14 08:38:41', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"6532e39e-2010-4c45-8c30-9d8f702dd606":  {\n		"0":  {\n			"value": "\\u0430\\u0434\\u0440\\u0435\\u0441 \\u0433\\u043e\\u0440\\u043e\\u0434\\u0430 \\u0430"\n		}\n	},\n	"619a8371-929a-4651-87af-78f70346201b":  {\n		"0":  {\n			"value": "\\u0444\\u0444\\u0444\\u0444\\u0444\\u0444\\u0444\\u0444\\u0444\\u0444"\n		}\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "66"\n}'),
(21, 3, 'gorod', 'Тамбов', 'tambov', '2014-07-14 08:09:03', '2014-07-14 08:09:30', 42, '2014-07-14 08:09:03', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"6532e39e-2010-4c45-8c30-9d8f702dd606":  {\n		"0":  {\n			"value": "\\u0430\\u0434\\u0440\\u0435\\u0441"\n		}\n	},\n	"619a8371-929a-4651-87af-78f70346201b":  {\n		"0":  {\n			"value": "1341234"\n		},\n		"1":  {\n			"value": "12341234"\n		},\n		"2":  {\n			"value": "1234"\n		}\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "66"\n}'),
(23, 3, 'gorod', 'Москва', 'moskva', '2014-07-14 10:28:23', '2014-07-14 10:29:07', 42, '2014-07-14 10:28:23', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"6532e39e-2010-4c45-8c30-9d8f702dd606":  {\n		"0":  {\n			"value": "\\u0442\\u0432\\u0435\\u0440\\u0441\\u043a\\u0430\\u044f"\n		}\n	},\n	"619a8371-929a-4651-87af-78f70346201b":  {\n		"0":  {\n			"value": "firts number"\n		},\n		"1":  {\n			"value": "second number"\n		}\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "67"\n}'),
(24, 3, 'gorod', 'Другой город', 'drugoj-gorod', '2014-07-14 10:29:15', '2014-07-14 10:29:40', 42, '2014-07-14 10:29:15', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 0, ' {\n	"6532e39e-2010-4c45-8c30-9d8f702dd606":  {\n		"0":  {\n			"value": "\\u0432\\u044b\\u0444\\u0430\\u0444\\u044b\\u0432\\u0430\\u044b\\u0444\\u0432\\u0430 \\u044b\\u0444 "\n		}\n	},\n	"619a8371-929a-4651-87af-78f70346201b":  {\n		"0":  {\n			"value": "5634653456346363465"\n		}\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "1",\n	"config.primary_category": "67"\n}'),
(25, 2, 'order', 'Заказ #25 / 2014-07-15 12:24:14 (GMT 2)', 'zakaz-id-2014-07-15-122414-gmt-2', '2014-07-15 12:24:14', '2014-07-15 12:24:14', 0, '2014-07-15 12:24:14', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"3c3db6d8-8b9e-4ab6-9e31-0704efea7614":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"a95eb051-c43b-4d58-b7c5-ec0cd26fc604":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"cadbb59a-7bdf-4ceb-b51d-ec51a3917230":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"2a2d6ee9-aa98-4169-8753-6b47843405d3":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"7db9c36f-6831-41b7-9814-8facfa8720ac":  {\n		"option":  {\n			"0": "samovyvoz-besplatno"\n		}\n	},\n	"e0e2eb90-00a9-4ea1-ad90-5f9883994ad1":  {\n		"0":  {\n			"value": "\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430"\n		}\n	},\n	"8edc46a7-40a0-4acd-a21f-5626ebca9021":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"c66506eb-3c81-4b8a-acd4-0ef98b3c8a32":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"0d1c2d06-85f0-41ea-a752-bff2efb83c34":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"4d1f32fb-4dd3-40f7-adff-650647e7c9dc":  {\n		"option":  {\n			"0": "1000-1400"\n		}\n	},\n	"c743cc81-de39-4424-a7fd-5bb256fbf769":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"932755cf-9ac7-455a-82be-8fe11a159cb5":  {\n		"option":  {\n			"0": "oplata-bankovskoj-kartoj"\n		}\n	}\n}', ' {\n	"config.enable_comments": 1,\n	"config.primary_category": 0,\n	"metadata.robots": "noindex, nofollow"\n}'),
(26, 2, 'order', 'Заказ #26 / 2014-07-15 12:27:10 (GMT 2)', 'zakaz-id-2014-07-15-122710-gmt-2', '2014-07-15 12:27:10', '2014-07-15 12:27:10', 0, '2014-07-15 12:27:10', '0000-00-00 00:00:00', 0, 0, 1, 1, 0, '', 0, ' {\n	"3c3db6d8-8b9e-4ab6-9e31-0704efea7614":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"a95eb051-c43b-4d58-b7c5-ec0cd26fc604":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"cadbb59a-7bdf-4ceb-b51d-ec51a3917230":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"2a2d6ee9-aa98-4169-8753-6b47843405d3":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"7db9c36f-6831-41b7-9814-8facfa8720ac":  {\n		"option":  {\n			"0": "samovyvoz-besplatno"\n		}\n	},\n	"e0e2eb90-00a9-4ea1-ad90-5f9883994ad1":  {\n		"0":  {\n			"value": "\\u041c\\u043e\\u0441\\u043a\\u0432\\u0430"\n		}\n	},\n	"8edc46a7-40a0-4acd-a21f-5626ebca9021":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"c66506eb-3c81-4b8a-acd4-0ef98b3c8a32":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"0d1c2d06-85f0-41ea-a752-bff2efb83c34":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"4d1f32fb-4dd3-40f7-adff-650647e7c9dc":  {\n		"option":  {\n			"0": "1000-1400"\n		}\n	},\n	"c743cc81-de39-4424-a7fd-5bb256fbf769":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"932755cf-9ac7-455a-82be-8fe11a159cb5":  {\n		"option":  {\n			"0": "oplata-bankovskoj-kartoj"\n		}\n	}\n}', ' {\n	"config.enable_comments": 1,\n	"config.primary_category": 0,\n	"metadata.robots": "noindex, nofollow"\n}'),
(27, 3, 'gorod', 'Лобня', 'lyubnya', '2014-07-20 06:11:23', '2014-07-20 06:12:55', 42, '2014-07-20 06:11:23', '0000-00-00 00:00:00', 0, 0, 1, 1, 42, '', 1, ' {\n	"6532e39e-2010-4c45-8c30-9d8f702dd606":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"619a8371-929a-4651-87af-78f70346201b":  {\n		"0":  {\n			"value": ""\n		}\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "1",\n	"config.primary_category": "66"\n}'),
(29, 1, 'product', 'Пинопласт Росия2', 'pinoplast-rosiya2', '2014-07-23 11:04:02', '2014-07-24 11:45:51', 42, '2014-07-23 11:04:02', '0000-00-00 00:00:00', 0, 28, 1, 1, 42, '', 1, ' {\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u043c"\n		}\n	},\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "29",\n			"value": "5000",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "RUB",\n			"description": ""\n		},\n		"variations":  {\n			"29-p1-moskva_p2-3005_p3-1x2":  {\n				"balance": -1,\n				"value": "600",\n				"currency": "RUB",\n				"sku": "29",\n				"param1": "moskva",\n				"param2": "3005",\n				"param3": "1x2",\n				"description": "",\n				"hash": "29-p1-moskva_p2-3005_p3-1x2"\n			},\n			"29-p1-_p2-3003_p3-1x2":  {\n				"balance": -1,\n				"value": "700",\n				"currency": "RUB",\n				"sku": "29",\n				"param1": "",\n				"param2": "3003",\n				"param3": "1x2",\n				"description": "",\n				"hash": "29-p1-_p2-3003_p3-1x2"\n			},\n			"29-p1-_p2-7005_p3-3x2":  {\n				"balance": -1,\n				"value": "800",\n				"currency": "RUB",\n				"sku": "29",\n				"param1": "",\n				"param2": "7005",\n				"param3": "3x2",\n				"description": "",\n				"hash": "29-p1-_p2-7005_p3-3x2"\n			}\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "",\n		"hits": "0",\n		"download_limit": "",\n		"size": 0\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/penplast.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": "<p>\\u0446\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442-\\"\\u0440\\u0438\\u0431\\u0430\\", \\u0449\\u043e \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u0432 \\u0434\\u0440\\u0443\\u043a\\u0430\\u0440\\u0441\\u0442\\u0432\\u0456 \\u0442\\u0430 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0456. Lorem Ipsum \\u0454, \\u0444\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u043e, \\u0441\\u0442\\u0430\\u043d\\u0434\\u0430\\u0440\\u0442\\u043d\\u043e\\u044e \\"\\u0440\\u0438\\u0431\\u043e\\u044e\\" \\u0430\\u0436 \\u0437 XVI \\u0441\\u0442\\u043e\\u0440\\u0456\\u0447\\u0447\\u044f, \\u043a\\u043e\\u043b\\u0438 \\u043d\\u0435\\u0432\\u0456\\u0434\\u043e\\u043c\\u0438\\u0439 \\u0434\\u0440\\u0443\\u043a\\u0430\\u0440 \\u0432\\u0437\\u044f\\u0432 \\u0448\\u0440\\u0438\\u0444\\u0442\\u043e\\u0432\\u0443 \\u0433\\u0440\\u0430\\u043d\\u043a\\u0443 \\u0442\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0432 \\u043d\\u0430 \\u043d\\u0456\\u0439 \\u043f\\u0456\\u0434\\u0431\\u0456\\u0440\\u043a\\u0443 \\u0437\\u0440\\u0430\\u0437\\u043a\\u0456\\u0432 \\u0448\\u0440\\u0438\\u0444\\u0442\\u0456\\u0432. \\"\\u0420\\u0438\\u0431\\u0430\\" \\u043d\\u0435 \\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0443\\u0441\\u043f\\u0456\\u0448\\u043d\\u043e \\u043f\\u0435\\u0440\\u0435\\u0436\\u0438\\u043b\\u0430 \\u043f''\\u044f\\u0442\\u044c \\u0441\\u0442\\u043e\\u043b\\u0456\\u0442\\u044c, \\u0430\\u043b\\u0435 \\u0439 \\u043f\\u0440\\u0438\\u0436\\u0438\\u043b\\u0430\\u0441\\u044f \\u0432<\\/p>"\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(30, 1, 'product', 'Плинтус Греция', 'plintus-greciya', '2014-07-23 11:10:48', '2014-07-24 07:33:43', 42, '2014-07-23 11:10:48', '0000-00-00 00:00:00', 0, 7, 1, 1, 42, '', 1, ' {\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u043c"\n		}\n	},\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/plintus.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 0,\n			"sku": "30",\n			"value": "10000",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "RUB",\n			"description": ""\n		},\n		"variations":  {\n			"30-p1-moskva_p2-7005_p3-2x1":  {\n				"balance": -1,\n				"value": "15000",\n				"currency": "RUB",\n				"sku": "30",\n				"param1": "moskva",\n				"param2": "7005",\n				"param3": "2x1",\n				"description": "",\n				"hash": "30-p1-moskva_p2-7005_p3-2x1"\n			},\n			"30-p1-moskva_p2-7024_p3-1x2":  {\n				"balance": -1,\n				"value": "10000",\n				"currency": "RUB",\n				"sku": "30",\n				"param1": "moskva",\n				"param2": "7024",\n				"param3": "1x2",\n				"description": "",\n				"hash": "30-p1-moskva_p2-7024_p3-1x2"\n			},\n			"30-p1-lobnya_p2-9003_p3-1x2":  {\n				"balance": -1,\n				"value": "12000",\n				"currency": "RUB",\n				"sku": "30",\n				"param1": "lobnya",\n				"param2": "9003",\n				"param3": "1x2",\n				"description": "",\n				"hash": "30-p1-lobnya_p2-9003_p3-1x2"\n			}\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": "<p>\\u0412\\u0436\\u0435 \\u0434\\u0430\\u0432\\u043d\\u043e \\u0432\\u0456\\u0434\\u043e\\u043c\\u043e, \\u0449\\u043e \\u0447\\u0438\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u043c\\u0456\\u0441\\u0442 \\u0431\\u0443\\u0434\\u0435 \\u0437\\u0430\\u0432\\u0430\\u0436\\u0430\\u0442\\u0438 \\u0437\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0441\\u044c \\u043b\\u044e\\u0434\\u0438\\u043d\\u0456, \\u044f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u044e\\u0454 \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0456\\u044e \\u0441\\u0442\\u043e\\u0440\\u0456\\u043d\\u043a\\u0438. \\u0421\\u0435\\u043d\\u0441 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u0430\\u043d\\u043d\\u044f Lorem Ipsum \\u043f\\u043e\\u043b\\u044f\\u0433\\u0430\\u0454 \\u0432 \\u0442\\u043e\\u043c\\u0443, \\u0449\\u043e \\u0446\\u0435\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043c\\u0430\\u0454 \\u0431\\u0456\\u043b\\u044c\\u0448-\\u043c\\u0435\\u043d\\u0448 \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u0435 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u043b\\u0456\\u0442\\u0435\\u0440 \\u043d\\u0430 \\u0432\\u0456\\u0434\\u043c\\u0456\\u043d\\u0443 \\u0432\\u0456\\u0434, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434, \\"\\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442. \\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442.\\" \\u0426\\u0435 \\u0440\\u043e\\u0431\\u0438\\u0442\\u044c \\u0442\\u0435\\u043a\\u0441\\u0442 \\u0441\\u0445\\u043e\\u0436\\u0438\\u043c \\u043d\\u0430 \\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439. \\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0432\\u0435\\u0431-\\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0443 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c Lorem Ipsum \\u044f\\u043a \\u0437\\u0440\\u0430\\u0437\\u043e\\u043a \\u0456 \\u043f\\u043e\\u0448\\u0443\\u043a \\u0437\\u0430 \\u0442\\u0435\\u0440\\u043c\\u0456\\u043d\\u043e\\u043c \\"lorem ipsum\\" \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0454 \\u0431\\u0430\\u0433\\u0430\\u0442\\u043e \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0456\\u0432, \\u044f\\u043a\\u0456 \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0449\\u0435 \\u0432 \\u0437\\u0430\\u0440\\u043e\\u0434\\u043a\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456. \\u0420\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum \\u0437''\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044c \\u0437\\u0430 \\u043c\\u0438\\u043d\\u0443\\u043b\\u0456 \\u0440\\u043e\\u043a\\u0438, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0432\\u0438\\u043f\\u0430\\u0434\\u043a\\u043e\\u0432\\u043e, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0431\\u0443\\u043b\\u043e \\u0441\\u0442\\u0432\\u043e\\u0440\\u0435\\u043d\\u043e \\u0437\\u0443\\u043c\\u0438\\u0441\\u043d\\u043e (\\u0437\\u043e\\u043a\\u0440\\u0435\\u043c\\u0430, \\u0436\\u0430\\u0440\\u0442\\u0456\\u0432\\u043b\\u0438\\u0432\\u0456).<\\/p>"\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}'),
(31, 1, 'product', 'Тестовый товар', 'testovyj-tovar', '2014-07-23 11:33:17', '2014-07-24 11:44:40', 42, '2014-07-23 11:33:17', '0000-00-00 00:00:00', 0, 63, 1, 1, 42, '', 1, ' {\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": ""\n		}\n	},\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 1,\n			"sku": "31",\n			"value": "600",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "RUB",\n			"description": ""\n		},\n		"variations":  {\n			"31-p1-moskva_p2-3009_p3-1x2":  {\n				"balance": -1,\n				"value": "600",\n				"currency": "RUB",\n				"sku": "31",\n				"param1": "moskva",\n				"param2": "3009",\n				"param3": "1x2",\n				"description": "",\n				"hash": "31-p1-moskva_p2-3009_p3-1x2"\n			},\n			"31-p1-lobnya_p2-_p3-3x2":  {\n				"balance": -1,\n				"value": "600",\n				"currency": "RUB",\n				"sku": "31",\n				"param1": "lobnya",\n				"param2": "",\n				"param3": "3x2",\n				"description": "",\n				"hash": "31-p1-lobnya_p2-_p3-3x2"\n			},\n			"31-p1-_p2-3005_p3-1x2":  {\n				"balance": -1,\n				"value": "600",\n				"currency": "RUB",\n				"sku": "31",\n				"param1": "",\n				"param2": "3005",\n				"param3": "1x2",\n				"description": "",\n				"hash": "31-p1-_p2-3005_p3-1x2"\n			},\n			"31-p1-_p2-6005_p3-3x2":  {\n				"balance": -1,\n				"value": "600",\n				"currency": "RUB",\n				"sku": "31",\n				"param1": "",\n				"param2": "6005",\n				"param3": "3x2",\n				"description": "",\n				"hash": "31-p1-_p2-6005_p3-3x2"\n			}\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "images\\/ral.pdf",\n		"hits": "4",\n		"download_limit": "",\n		"size": "137169"\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/antena.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": "<p>Lorem Ipsum - \\u0446\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442-\\"\\u0440\\u0438\\u0431\\u0430\\", \\u0449\\u043e \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u0454\\u0442\\u044c\\u0441\\u044f \\u0432 \\u0434\\u0440\\u0443\\u043a\\u0430\\u0440\\u0441\\u0442\\u0432\\u0456 \\u0442\\u0430 \\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0456. Lorem Ipsum \\u0454, \\u0444\\u0430\\u043a\\u0442\\u0438\\u0447\\u043d\\u043e, \\u0441\\u0442\\u0430\\u043d\\u0434\\u0430\\u0440\\u0442\\u043d\\u043e\\u044e \\"\\u0440\\u0438\\u0431\\u043e\\u044e\\" \\u0430\\u0436 \\u0437 XVI \\u0441\\u0442\\u043e\\u0440\\u0456\\u0447\\u0447\\u044f, \\u043a\\u043e\\u043b\\u0438 \\u043d\\u0435\\u0432\\u0456\\u0434\\u043e\\u043c\\u0438\\u0439 \\u0434\\u0440\\u0443\\u043a\\u0430\\u0440 \\u0432\\u0437\\u044f\\u0432 \\u0448\\u0440\\u0438\\u0444\\u0442\\u043e\\u0432\\u0443 \\u0433\\u0440\\u0430\\u043d\\u043a\\u0443 \\u0442\\u0430 \\u0441\\u043a\\u043b\\u0430\\u0432 \\u043d\\u0430 \\u043d\\u0456\\u0439 \\u043f\\u0456\\u0434\\u0431\\u0456\\u0440\\u043a\\u0443 \\u0437\\u0440\\u0430\\u0437\\u043a\\u0456\\u0432 \\u0448\\u0440\\u0438\\u0444\\u0442\\u0456\\u0432.<\\/p>\\r\\n<p>\\"\\u0420\\u0438\\u0431\\u0430\\" \\u043d\\u0435 \\u0442\\u0456\\u043b\\u044c\\u043a\\u0438 \\u0443\\u0441\\u043f\\u0456\\u0448\\u043d\\u043e \\u043f\\u0435\\u0440\\u0435\\u0436\\u0438\\u043b\\u0430 \\u043f''\\u044f\\u0442\\u044c \\u0441\\u0442\\u043e\\u043b\\u0456\\u0442\\u044c, \\u0430\\u043b\\u0435 \\u0439 \\u043f\\u0440\\u0438\\u0436\\u0438\\u043b\\u0430\\u0441\\u044f \\u0432 \\u0435\\u043b\\u0435\\u043a\\u0442\\u0440\\u043e\\u043d\\u043d\\u043e\\u043c\\u0443 \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u0456, \\u0437\\u0430\\u043b\\u0438\\u0448\\u0430\\u044e\\u0447\\u0438\\u0441\\u044c \\u043f\\u043e \\u0441\\u0443\\u0442\\u0456 \\u043d\\u0435\\u0437\\u043c\\u0456\\u043d\\u043d\\u043e\\u044e.<\\/p>\\r\\n<p>\\u0412\\u043e\\u043d\\u0430 \\u043f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u0438\\u0437\\u0443\\u0432\\u0430\\u043b\\u0430\\u0441\\u044c \\u0432 60-\\u0438\\u0445 \\u0440\\u043e\\u043a\\u0430\\u0445 \\u043c\\u0438\\u043d\\u0443\\u043b\\u043e\\u0433\\u043e \\u0441\\u0442\\u043e\\u0440\\u0456\\u0447\\u0447\\u044f \\u0437\\u0430\\u0432\\u0434\\u044f\\u043a\\u0438 \\u0432\\u0438\\u0434\\u0430\\u043d\\u043d\\u044e \\u0437\\u0440\\u0430\\u0437\\u043a\\u0456\\u0432 \\u0448\\u0440\\u0438\\u0444\\u0442\\u0456\\u0432 Letraset, \\u044f\\u043a\\u0456 \\u043c\\u0456\\u0441\\u0442\\u0438\\u043b\\u0438 \\u0443\\u0440\\u0438\\u0432\\u043a\\u0438 \\u0437 Lorem Ipsum, \\u0456 \\u0432\\u0434\\u0440\\u0443\\u0433\\u0435 - \\u043d\\u0435\\u0449\\u043e\\u0434\\u0430\\u0432\\u043d\\u043e \\u0437\\u0430\\u0432\\u0434\\u044f\\u043a\\u0438 \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c\\u0430\\u043c \\u043a\\u043e\\u043c\\u043f''\\u044e\\u0442\\u0435\\u0440\\u043d\\u043e\\u0433\\u043e \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u043d\\u0430 \\u043a\\u0448\\u0442\\u0430\\u043b\\u0442 Aldus Pagemaker, \\u044f\\u043a\\u0456 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u0432\\u0430\\u043b\\u0438 \\u0440\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum.<\\/p>"\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n		"item":  {\n			"0": "29",\n			"1": "32",\n			"2": "30",\n			"3": "28"\n		}\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}');
INSERT INTO `bzrnp_zoo_item` (`id`, `application_id`, `type`, `name`, `alias`, `created`, `modified`, `modified_by`, `publish_up`, `publish_down`, `priority`, `hits`, `state`, `access`, `created_by`, `created_by_alias`, `searchable`, `elements`, `params`) VALUES
(32, 1, 'product', 'Труба водосточная Италия', 'truba-vodostochnaya-italiya', '2014-07-23 12:03:20', '2014-07-24 08:59:12', 42, '2014-07-23 12:03:20', '0000-00-00 00:00:00', 0, 86, 1, 1, 42, '', 1, ' {\n	"083f753e-3caa-4a9a-8b9e-9f7bddb4967b":  {\n		"option":  {\n			"0": "da"\n		},\n		"check": "1"\n	},\n	"62ec77b4-9f86-4749-ad11-32353efe3f92":  {\n		"check": "1"\n	},\n	"ff61396c-fe57-4e7d-bc9b-b141bbea6067":  {\n		"0":  {\n			"value": "\\u043c"\n		}\n	},\n	"888260d0-e4b7-49ca-949a-063f17dedab1":  {\n		"basic":  {\n			"balance": -1,\n			"new": 0,\n			"hit": 1,\n			"sku": "32",\n			"value": "0",\n			"currency": "RUB",\n			"discount": "0",\n			"discount_currency": "RUB",\n			"description": ""\n		},\n		"variations":  {\n			"32-p1-moskva_p2-9003_p3-":  {\n				"balance": -1,\n				"value": "5500",\n				"currency": "RUB",\n				"sku": "32",\n				"param1": "moskva",\n				"param2": "9003",\n				"param3": "",\n				"description": "",\n				"hash": "32-p1-moskva_p2-9003_p3-"\n			},\n			"32-p1-lobnya_p2-9003_p3-":  {\n				"balance": -1,\n				"value": "4500",\n				"currency": "RUB",\n				"sku": "35",\n				"param1": "lobnya",\n				"param2": "9003",\n				"param3": "",\n				"description": "",\n				"hash": "32-p1-lobnya_p2-9003_p3-"\n			}\n		}\n	},\n	"c0a33b8a-2372-4c43-aafa-9401224a662f":  {\n		"file": "",\n		"hits": "0",\n		"download_limit": "",\n		"size": 0\n	},\n	"84081cd8-d154-4247-8363-ec2e9b89aa94":  {\n		"0":  {\n			"file": "images\\/truba.jpg",\n			"title": "",\n			"link": "",\n			"target": "0",\n			"rel": ""\n		}\n	},\n	"3dacc57d-2a23-4ec0-bdd0-d5608d31b684":  {\n		"0":  {\n			"value": "<p>\\u0412\\u0436\\u0435 \\u0434\\u0430\\u0432\\u043d\\u043e \\u0432\\u0456\\u0434\\u043e\\u043c\\u043e, \\u0449\\u043e \\u0447\\u0438\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u043c\\u0456\\u0441\\u0442 \\u0431\\u0443\\u0434\\u0435 \\u0437\\u0430\\u0432\\u0430\\u0436\\u0430\\u0442\\u0438 \\u0437\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0441\\u044c \\u043b\\u044e\\u0434\\u0438\\u043d\\u0456, \\u044f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u044e\\u0454 \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0456\\u044e \\u0441\\u0442\\u043e\\u0440\\u0456\\u043d\\u043a\\u0438. \\u0421\\u0435\\u043d\\u0441 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u0430\\u043d\\u043d\\u044f Lorem Ipsum \\u043f\\u043e\\u043b\\u044f\\u0433\\u0430\\u0454 \\u0432 \\u0442\\u043e\\u043c\\u0443, \\u0449\\u043e \\u0446\\u0435\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043c\\u0430\\u0454 \\u0431\\u0456\\u043b\\u044c\\u0448-\\u043c\\u0435\\u043d\\u0448 \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u0435 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u043b\\u0456\\u0442\\u0435\\u0440 \\u043d\\u0430 \\u0432\\u0456\\u0434\\u043c\\u0456\\u043d\\u0443 \\u0432\\u0456\\u0434, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434, \\"\\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442. \\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442.\\"<\\/p>\\r\\n<p>\\u0426\\u0435 \\u0440\\u043e\\u0431\\u0438\\u0442\\u044c \\u0442\\u0435\\u043a\\u0441\\u0442 \\u0441\\u0445\\u043e\\u0436\\u0438\\u043c \\u043d\\u0430 \\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439. \\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0432\\u0435\\u0431-\\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0443 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c Lorem Ipsum \\u044f\\u043a \\u0437\\u0440\\u0430\\u0437\\u043e\\u043a \\u0456 \\u043f\\u043e\\u0448\\u0443\\u043a \\u0437\\u0430 \\u0442\\u0435\\u0440\\u043c\\u0456\\u043d\\u043e\\u043c \\"lorem ipsum\\" \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0454 \\u0431\\u0430\\u0433\\u0430\\u0442\\u043e \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0456\\u0432, \\u044f\\u043a\\u0456 \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0449\\u0435 \\u0432 \\u0437\\u0430\\u0440\\u043e\\u0434\\u043a\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456. \\u0420\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum \\u0437''\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044c \\u0437\\u0430 \\u043c\\u0438\\u043d\\u0443\\u043b\\u0456 \\u0440\\u043e\\u043a\\u0438, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0432\\u0438\\u043f\\u0430\\u0434\\u043a\\u043e\\u0432\\u043e, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0431\\u0443\\u043b\\u043e \\u0441\\u0442\\u0432\\u043e\\u0440\\u0435\\u043d\\u043e \\u0437\\u0443\\u043c\\u0438\\u0441\\u043d\\u043e (\\u0437\\u043e\\u043a\\u0440\\u0435\\u043c\\u0430, \\u0436\\u0430\\u0440\\u0442\\u0456\\u0432\\u043b\\u0438\\u0432\\u0456). \\u0412\\u0436\\u0435 \\u0434\\u0430\\u0432\\u043d\\u043e \\u0432\\u0456\\u0434\\u043e\\u043c\\u043e, \\u0449\\u043e \\u0447\\u0438\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u043c\\u0456\\u0441\\u0442 \\u0431\\u0443\\u0434\\u0435 \\u0437\\u0430\\u0432\\u0430\\u0436\\u0430\\u0442\\u0438 \\u0437\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0441\\u044c \\u043b\\u044e\\u0434\\u0438\\u043d\\u0456, \\u044f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u044e\\u0454 \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0456\\u044e \\u0441\\u0442\\u043e\\u0440\\u0456\\u043d\\u043a\\u0438. \\u0421\\u0435\\u043d\\u0441 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u0430\\u043d\\u043d\\u044f Lorem Ipsum \\u043f\\u043e\\u043b\\u044f\\u0433\\u0430\\u0454 \\u0432 \\u0442\\u043e\\u043c\\u0443, \\u0449\\u043e \\u0446\\u0435\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043c\\u0430\\u0454 \\u0431\\u0456\\u043b\\u044c\\u0448-\\u043c\\u0435\\u043d\\u0448 \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u0435 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u043b\\u0456\\u0442\\u0435\\u0440 \\u043d\\u0430 \\u0432\\u0456\\u0434\\u043c\\u0456\\u043d\\u0443 \\u0432\\u0456\\u0434, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434, \\"\\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442. \\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442.\\" \\u0426\\u0435 \\u0440\\u043e\\u0431\\u0438\\u0442\\u044c \\u0442\\u0435\\u043a\\u0441\\u0442 \\u0441\\u0445\\u043e\\u0436\\u0438\\u043c \\u043d\\u0430 \\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439. \\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0432\\u0435\\u0431-\\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0443 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c Lorem Ipsum \\u044f\\u043a \\u0437\\u0440\\u0430\\u0437\\u043e\\u043a \\u0456 \\u043f\\u043e\\u0448\\u0443\\u043a \\u0437\\u0430 \\u0442\\u0435\\u0440\\u043c\\u0456\\u043d\\u043e\\u043c \\"lorem ipsum\\" \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0454 \\u0431\\u0430\\u0433\\u0430\\u0442\\u043e \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0456\\u0432, \\u044f\\u043a\\u0456 \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0449\\u0435 \\u0432 \\u0437\\u0430\\u0440\\u043e\\u0434\\u043a\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456. \\u0420\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum \\u0437''\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044c \\u0437\\u0430 \\u043c\\u0438\\u043d\\u0443\\u043b\\u0456 \\u0440\\u043e\\u043a\\u0438, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0432\\u0438\\u043f\\u0430\\u0434\\u043a\\u043e\\u0432\\u043e, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0431\\u0443\\u043b\\u043e \\u0441\\u0442\\u0432\\u043e\\u0440\\u0435\\u043d\\u043e \\u0437\\u0443\\u043c\\u0438\\u0441\\u043d\\u043e (\\u0437\\u043e\\u043a\\u0440\\u0435\\u043c\\u0430, \\u0436\\u0430\\u0440\\u0442\\u0456\\u0432\\u043b\\u0438\\u0432\\u0456). \\u0412\\u0436\\u0435 \\u0434\\u0430\\u0432\\u043d\\u043e \\u0432\\u0456\\u0434\\u043e\\u043c\\u043e, \\u0449\\u043e \\u0447\\u0438\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u043c\\u0456\\u0441\\u0442 \\u0431\\u0443\\u0434\\u0435 \\u0437\\u0430\\u0432\\u0430\\u0436\\u0430\\u0442\\u0438 \\u0437\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0441\\u044c \\u043b\\u044e\\u0434\\u0438\\u043d\\u0456, \\u044f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u044e\\u0454 \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0456\\u044e \\u0441\\u0442\\u043e\\u0440\\u0456\\u043d\\u043a\\u0438. \\u0421\\u0435\\u043d\\u0441 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u0430\\u043d\\u043d\\u044f Lorem Ipsum \\u043f\\u043e\\u043b\\u044f\\u0433\\u0430\\u0454 \\u0432 \\u0442\\u043e\\u043c\\u0443, \\u0449\\u043e \\u0446\\u0435\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043c\\u0430\\u0454 \\u0431\\u0456\\u043b\\u044c\\u0448-\\u043c\\u0435\\u043d\\u0448 \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u0435 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u043b\\u0456\\u0442\\u0435\\u0440 \\u043d\\u0430 \\u0432\\u0456\\u0434\\u043c\\u0456\\u043d\\u0443 \\u0432\\u0456\\u0434, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434, \\"\\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442. \\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442.\\" \\u0426\\u0435 \\u0440\\u043e\\u0431\\u0438\\u0442\\u044c \\u0442\\u0435\\u043a\\u0441\\u0442 \\u0441\\u0445\\u043e\\u0436\\u0438\\u043c \\u043d\\u0430 \\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439. \\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0432\\u0435\\u0431-\\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0443 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c Lorem Ipsum \\u044f\\u043a \\u0437\\u0440\\u0430\\u0437\\u043e\\u043a \\u0456 \\u043f\\u043e\\u0448\\u0443\\u043a \\u0437\\u0430 \\u0442\\u0435\\u0440\\u043c\\u0456\\u043d\\u043e\\u043c \\"lorem ipsum\\" \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0454 \\u0431\\u0430\\u0433\\u0430\\u0442\\u043e \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0456\\u0432, \\u044f\\u043a\\u0456 \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0449\\u0435 \\u0432 \\u0437\\u0430\\u0440\\u043e\\u0434\\u043a\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456. \\u0420\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum \\u0437''\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044c \\u0437\\u0430 \\u043c\\u0438\\u043d\\u0443\\u043b\\u0456 \\u0440\\u043e\\u043a\\u0438, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0432\\u0438\\u043f\\u0430\\u0434\\u043a\\u043e\\u0432\\u043e, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0431\\u0443\\u043b\\u043e \\u0441\\u0442\\u0432\\u043e\\u0440\\u0435\\u043d\\u043e \\u0437\\u0443\\u043c\\u0438\\u0441\\u043d\\u043e (\\u0437\\u043e\\u043a\\u0440\\u0435\\u043c\\u0430, \\u0436\\u0430\\u0440\\u0442\\u0456\\u0432\\u043b\\u0438\\u0432\\u0456).<\\/p>\\r\\n<p>\\u0412\\u0436\\u0435 \\u0434\\u0430\\u0432\\u043d\\u043e \\u0432\\u0456\\u0434\\u043e\\u043c\\u043e, \\u0449\\u043e \\u0447\\u0438\\u0442\\u0430\\u0431\\u0435\\u043b\\u044c\\u043d\\u0438\\u0439 \\u0437\\u043c\\u0456\\u0441\\u0442 \\u0431\\u0443\\u0434\\u0435 \\u0437\\u0430\\u0432\\u0430\\u0436\\u0430\\u0442\\u0438 \\u0437\\u043e\\u0441\\u0435\\u0440\\u0435\\u0434\\u0438\\u0442\\u0438\\u0441\\u044c \\u043b\\u044e\\u0434\\u0438\\u043d\\u0456, \\u044f\\u043a\\u0430 \\u043e\\u0446\\u0456\\u043d\\u044e\\u0454 \\u043a\\u043e\\u043c\\u043f\\u043e\\u0437\\u0438\\u0446\\u0456\\u044e \\u0441\\u0442\\u043e\\u0440\\u0456\\u043d\\u043a\\u0438. \\u0421\\u0435\\u043d\\u0441 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u0430\\u043d\\u043d\\u044f Lorem Ipsum \\u043f\\u043e\\u043b\\u044f\\u0433\\u0430\\u0454 \\u0432 \\u0442\\u043e\\u043c\\u0443, \\u0449\\u043e \\u0446\\u0435\\u0439 \\u0442\\u0435\\u043a\\u0441\\u0442 \\u043c\\u0430\\u0454 \\u0431\\u0456\\u043b\\u044c\\u0448-\\u043c\\u0435\\u043d\\u0448 \\u043d\\u043e\\u0440\\u043c\\u0430\\u043b\\u044c\\u043d\\u0435 \\u0440\\u043e\\u0437\\u043f\\u043e\\u0434\\u0456\\u043b\\u0435\\u043d\\u043d\\u044f \\u043b\\u0456\\u0442\\u0435\\u0440 \\u043d\\u0430 \\u0432\\u0456\\u0434\\u043c\\u0456\\u043d\\u0443 \\u0432\\u0456\\u0434, \\u043d\\u0430\\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434, \\"\\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442. \\u0422\\u0443\\u0442 \\u0456\\u0434\\u0435 \\u0442\\u0435\\u043a\\u0441\\u0442.\\"<\\/p>\\r\\n<p>\\u0426\\u0435 \\u0440\\u043e\\u0431\\u0438\\u0442\\u044c \\u0442\\u0435\\u043a\\u0441\\u0442 \\u0441\\u0445\\u043e\\u0436\\u0438\\u043c \\u043d\\u0430 \\u043e\\u043f\\u043e\\u0432\\u0456\\u0434\\u043d\\u0438\\u0439. \\u0411\\u0430\\u0433\\u0430\\u0442\\u043e \\u043f\\u0440\\u043e\\u0433\\u0440\\u0430\\u043c \\u0432\\u0435\\u0440\\u0441\\u0442\\u0443\\u0432\\u0430\\u043d\\u043d\\u044f \\u0442\\u0430 \\u0432\\u0435\\u0431-\\u0434\\u0438\\u0437\\u0430\\u0439\\u043d\\u0443 \\u0432\\u0438\\u043a\\u043e\\u0440\\u0438\\u0441\\u0442\\u043e\\u0432\\u0443\\u044e\\u0442\\u044c Lorem Ipsum \\u044f\\u043a \\u0437\\u0440\\u0430\\u0437\\u043e\\u043a \\u0456 \\u043f\\u043e\\u0448\\u0443\\u043a \\u0437\\u0430 \\u0442\\u0435\\u0440\\u043c\\u0456\\u043d\\u043e\\u043c \\"lorem ipsum\\" \\u0432\\u0456\\u0434\\u043a\\u0440\\u0438\\u0454 \\u0431\\u0430\\u0433\\u0430\\u0442\\u043e \\u0432\\u0435\\u0431-\\u0441\\u0430\\u0439\\u0442\\u0456\\u0432, \\u044f\\u043a\\u0456 \\u0437\\u043d\\u0430\\u0445\\u043e\\u0434\\u044f\\u0442\\u044c\\u0441\\u044f \\u0449\\u0435 \\u0432 \\u0437\\u0430\\u0440\\u043e\\u0434\\u043a\\u043e\\u0432\\u043e\\u043c\\u0443 \\u0441\\u0442\\u0430\\u043d\\u0456. \\u0420\\u0456\\u0437\\u043d\\u0456 \\u0432\\u0435\\u0440\\u0441\\u0456\\u0457 Lorem Ipsum \\u0437''\\u044f\\u0432\\u0438\\u043b\\u0438\\u0441\\u044c \\u0437\\u0430 \\u043c\\u0438\\u043d\\u0443\\u043b\\u0456 \\u0440\\u043e\\u043a\\u0438, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0432\\u0438\\u043f\\u0430\\u0434\\u043a\\u043e\\u0432\\u043e, \\u0434\\u0435\\u044f\\u043a\\u0456 \\u0431\\u0443\\u043b\\u043e \\u0441\\u0442\\u0432\\u043e\\u0440\\u0435\\u043d\\u043e \\u0437\\u0443\\u043c\\u0438\\u0441\\u043d\\u043e (\\u0437\\u043e\\u043a\\u0440\\u0435\\u043c\\u0430, \\u0436\\u0430\\u0440\\u0442\\u0456\\u0432\\u043b\\u0438\\u0432\\u0456).<\\/p>"\n		}\n	},\n	"b4e449f7-bfb7-44e2-aafe-1e31c0343b6c":  {\n\n	},\n	"fe9c90e8-e9ed-4443-bd6d-368c1b757978":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	},\n	"a9da76ee-6c08-4abd-bdec-804808de0d6b":  {\n		"check": "1"\n	},\n	"126be91c-d8af-4d0e-807f-6b97e7e42708":  {\n		"option":  {\n			"0": ""\n		},\n		"select": "1"\n	}\n}', ' {\n	"metadata.title": "",\n	"metadata.description": "",\n	"metadata.keywords": "",\n	"metadata.robots": "",\n	"metadata.author": "",\n	"config.enable_comments": "0",\n	"config.primary_category": "62"\n}');

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_config`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(50) DEFAULT NULL,
  `key` varchar(50) DEFAULT NULL,
  `value` text,
  `type` varchar(10) DEFAULT 'string',
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_key` (`group`,`key`),
  KEY `group` (`group`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
-- Структура таблицы `bzrnp_zoo_jbzoo_index_gorod`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_gorod` (
  `item_id` int(11) unsigned NOT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemtag_d` datetime DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) DEFAULT '0',
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemcategory_d` datetime DEFAULT NULL,
  `e_6532e39e20104c458c309d8f702dd606_s` varchar(50) DEFAULT NULL,
  `e_6532e39e20104c458c309d8f702dd606_n` double DEFAULT NULL,
  `e_6532e39e20104c458c309d8f702dd606_d` datetime DEFAULT NULL,
  `e_619a8371929a465187af78f70346201b_s` varchar(50) DEFAULT NULL,
  `e_619a8371929a465187af78f70346201b_n` double DEFAULT NULL,
  `e_619a8371929a465187af78f70346201b_d` datetime DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_6532e39e20104c458c309d8f702dd606_s` (`e_6532e39e20104c458c309d8f702dd606_s`),
  KEY `e_6532e39e20104c458c309d8f702dd606_n` (`e_6532e39e20104c458c309d8f702dd606_n`),
  KEY `e_6532e39e20104c458c309d8f702dd606_d` (`e_6532e39e20104c458c309d8f702dd606_d`),
  KEY `e_619a8371929a465187af78f70346201b_s` (`e_619a8371929a465187af78f70346201b_s`),
  KEY `e_619a8371929a465187af78f70346201b_n` (`e_619a8371929a465187af78f70346201b_n`),
  KEY `e_619a8371929a465187af78f70346201b_d` (`e_619a8371929a465187af78f70346201b_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_jbzoo_index_gorod`
--

INSERT INTO `bzrnp_zoo_jbzoo_index_gorod` (`item_id`, `e_itemtag_s`, `e_itemtag_n`, `e_itemtag_d`, `e_itemfrontpage_n`, `e_itemcategory_s`, `e_itemcategory_n`, `e_itemcategory_d`, `e_6532e39e20104c458c309d8f702dd606_s`, `e_6532e39e20104c458c309d8f702dd606_n`, `e_6532e39e20104c458c309d8f702dd606_d`, `e_619a8371929a465187af78f70346201b_s`, `e_619a8371929a465187af78f70346201b_n`, `e_619a8371929a465187af78f70346201b_d`) VALUES
(27, NULL, NULL, NULL, 0, 'Тамбовская область', 66, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_order`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_order` (
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemcategory_d` datetime DEFAULT NULL,
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemtag_d` datetime DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) DEFAULT '0',
  `e_932755cf9ac7455a82be8fe11a159cb5_s` varchar(50) DEFAULT NULL,
  `e_932755cf9ac7455a82be8fe11a159cb5_n` double DEFAULT NULL,
  `e_932755cf9ac7455a82be8fe11a159cb5_d` datetime DEFAULT NULL,
  `e_cadbb59a7bdf4cebb51dec51a3917230_s` varchar(50) DEFAULT NULL,
  `e_cadbb59a7bdf4cebb51dec51a3917230_n` double DEFAULT NULL,
  `e_cadbb59a7bdf4cebb51dec51a3917230_d` datetime DEFAULT NULL,
  `e_2a2d6ee9aa98416987536b47843405d3_s` varchar(50) DEFAULT NULL,
  `e_2a2d6ee9aa98416987536b47843405d3_n` double DEFAULT NULL,
  `e_2a2d6ee9aa98416987536b47843405d3_d` datetime DEFAULT NULL,
  `e_a95eb051c43b4d58b7c5ec0cd26fc604_s` varchar(50) DEFAULT NULL,
  `e_a95eb051c43b4d58b7c5ec0cd26fc604_n` double DEFAULT NULL,
  `e_a95eb051c43b4d58b7c5ec0cd26fc604_d` datetime DEFAULT NULL,
  `e_3c3db6d88b9e4ab69e310704efea7614_s` varchar(50) DEFAULT NULL,
  `e_3c3db6d88b9e4ab69e310704efea7614_n` double DEFAULT NULL,
  `e_3c3db6d88b9e4ab69e310704efea7614_d` datetime DEFAULT NULL,
  `e_37881601073944dfb2061d59f87bcd40_s` varchar(50) DEFAULT NULL,
  `e_37881601073944dfb2061d59f87bcd40_n` double DEFAULT NULL,
  `e_37881601073944dfb2061d59f87bcd40_d` datetime DEFAULT NULL,
  `e_7db9c36f683141b798148facfa8720ac_s` varchar(50) DEFAULT NULL,
  `e_7db9c36f683141b798148facfa8720ac_n` double DEFAULT NULL,
  `e_7db9c36f683141b798148facfa8720ac_d` datetime DEFAULT NULL,
  `e_e0e2eb9000a94ea1ad905f9883994ad1_s` varchar(50) DEFAULT NULL,
  `e_e0e2eb9000a94ea1ad905f9883994ad1_n` double DEFAULT NULL,
  `e_e0e2eb9000a94ea1ad905f9883994ad1_d` datetime DEFAULT NULL,
  `e_4d1f32fb4dd340f7adff650647e7c9dc_s` varchar(50) DEFAULT NULL,
  `e_4d1f32fb4dd340f7adff650647e7c9dc_n` double DEFAULT NULL,
  `e_4d1f32fb4dd340f7adff650647e7c9dc_d` datetime DEFAULT NULL,
  `e_0d1c2d0685f041eaa752bff2efb83c34_s` varchar(50) DEFAULT NULL,
  `e_0d1c2d0685f041eaa752bff2efb83c34_n` double DEFAULT NULL,
  `e_0d1c2d0685f041eaa752bff2efb83c34_d` datetime DEFAULT NULL,
  `e_c66506eb3c814b8aacd40ef98b3c8a32_s` varchar(50) DEFAULT NULL,
  `e_c66506eb3c814b8aacd40ef98b3c8a32_n` double DEFAULT NULL,
  `e_c66506eb3c814b8aacd40ef98b3c8a32_d` datetime DEFAULT NULL,
  `e_8edc46a740a04acda21f5626ebca9021_s` varchar(50) DEFAULT NULL,
  `e_8edc46a740a04acda21f5626ebca9021_n` double DEFAULT NULL,
  `e_8edc46a740a04acda21f5626ebca9021_d` datetime DEFAULT NULL,
  `e_6c0722d88b6647a6b80c76f99a9e3963_s` varchar(50) DEFAULT NULL,
  `e_6c0722d88b6647a6b80c76f99a9e3963_n` double DEFAULT NULL,
  `e_6c0722d88b6647a6b80c76f99a9e3963_d` datetime DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_932755cf9ac7455a82be8fe11a159cb5_s` (`e_932755cf9ac7455a82be8fe11a159cb5_s`),
  KEY `e_932755cf9ac7455a82be8fe11a159cb5_n` (`e_932755cf9ac7455a82be8fe11a159cb5_n`),
  KEY `e_932755cf9ac7455a82be8fe11a159cb5_d` (`e_932755cf9ac7455a82be8fe11a159cb5_d`),
  KEY `e_cadbb59a7bdf4cebb51dec51a3917230_s` (`e_cadbb59a7bdf4cebb51dec51a3917230_s`),
  KEY `e_cadbb59a7bdf4cebb51dec51a3917230_n` (`e_cadbb59a7bdf4cebb51dec51a3917230_n`),
  KEY `e_cadbb59a7bdf4cebb51dec51a3917230_d` (`e_cadbb59a7bdf4cebb51dec51a3917230_d`),
  KEY `e_2a2d6ee9aa98416987536b47843405d3_s` (`e_2a2d6ee9aa98416987536b47843405d3_s`),
  KEY `e_2a2d6ee9aa98416987536b47843405d3_n` (`e_2a2d6ee9aa98416987536b47843405d3_n`),
  KEY `e_2a2d6ee9aa98416987536b47843405d3_d` (`e_2a2d6ee9aa98416987536b47843405d3_d`),
  KEY `e_a95eb051c43b4d58b7c5ec0cd26fc604_s` (`e_a95eb051c43b4d58b7c5ec0cd26fc604_s`),
  KEY `e_a95eb051c43b4d58b7c5ec0cd26fc604_n` (`e_a95eb051c43b4d58b7c5ec0cd26fc604_n`),
  KEY `e_a95eb051c43b4d58b7c5ec0cd26fc604_d` (`e_a95eb051c43b4d58b7c5ec0cd26fc604_d`),
  KEY `e_3c3db6d88b9e4ab69e310704efea7614_s` (`e_3c3db6d88b9e4ab69e310704efea7614_s`),
  KEY `e_3c3db6d88b9e4ab69e310704efea7614_n` (`e_3c3db6d88b9e4ab69e310704efea7614_n`),
  KEY `e_3c3db6d88b9e4ab69e310704efea7614_d` (`e_3c3db6d88b9e4ab69e310704efea7614_d`),
  KEY `e_37881601073944dfb2061d59f87bcd40_s` (`e_37881601073944dfb2061d59f87bcd40_s`),
  KEY `e_37881601073944dfb2061d59f87bcd40_n` (`e_37881601073944dfb2061d59f87bcd40_n`),
  KEY `e_37881601073944dfb2061d59f87bcd40_d` (`e_37881601073944dfb2061d59f87bcd40_d`),
  KEY `e_7db9c36f683141b798148facfa8720ac_s` (`e_7db9c36f683141b798148facfa8720ac_s`),
  KEY `e_7db9c36f683141b798148facfa8720ac_n` (`e_7db9c36f683141b798148facfa8720ac_n`),
  KEY `e_7db9c36f683141b798148facfa8720ac_d` (`e_7db9c36f683141b798148facfa8720ac_d`),
  KEY `e_e0e2eb9000a94ea1ad905f9883994ad1_s` (`e_e0e2eb9000a94ea1ad905f9883994ad1_s`),
  KEY `e_e0e2eb9000a94ea1ad905f9883994ad1_n` (`e_e0e2eb9000a94ea1ad905f9883994ad1_n`),
  KEY `e_e0e2eb9000a94ea1ad905f9883994ad1_d` (`e_e0e2eb9000a94ea1ad905f9883994ad1_d`),
  KEY `e_4d1f32fb4dd340f7adff650647e7c9dc_s` (`e_4d1f32fb4dd340f7adff650647e7c9dc_s`),
  KEY `e_4d1f32fb4dd340f7adff650647e7c9dc_n` (`e_4d1f32fb4dd340f7adff650647e7c9dc_n`),
  KEY `e_4d1f32fb4dd340f7adff650647e7c9dc_d` (`e_4d1f32fb4dd340f7adff650647e7c9dc_d`),
  KEY `e_0d1c2d0685f041eaa752bff2efb83c34_s` (`e_0d1c2d0685f041eaa752bff2efb83c34_s`),
  KEY `e_0d1c2d0685f041eaa752bff2efb83c34_n` (`e_0d1c2d0685f041eaa752bff2efb83c34_n`),
  KEY `e_0d1c2d0685f041eaa752bff2efb83c34_d` (`e_0d1c2d0685f041eaa752bff2efb83c34_d`),
  KEY `e_c66506eb3c814b8aacd40ef98b3c8a32_s` (`e_c66506eb3c814b8aacd40ef98b3c8a32_s`),
  KEY `e_c66506eb3c814b8aacd40ef98b3c8a32_n` (`e_c66506eb3c814b8aacd40ef98b3c8a32_n`),
  KEY `e_c66506eb3c814b8aacd40ef98b3c8a32_d` (`e_c66506eb3c814b8aacd40ef98b3c8a32_d`),
  KEY `e_8edc46a740a04acda21f5626ebca9021_s` (`e_8edc46a740a04acda21f5626ebca9021_s`),
  KEY `e_8edc46a740a04acda21f5626ebca9021_n` (`e_8edc46a740a04acda21f5626ebca9021_n`),
  KEY `e_8edc46a740a04acda21f5626ebca9021_d` (`e_8edc46a740a04acda21f5626ebca9021_d`),
  KEY `e_6c0722d88b6647a6b80c76f99a9e3963_s` (`e_6c0722d88b6647a6b80c76f99a9e3963_s`),
  KEY `e_6c0722d88b6647a6b80c76f99a9e3963_n` (`e_6c0722d88b6647a6b80c76f99a9e3963_n`),
  KEY `e_6c0722d88b6647a6b80c76f99a9e3963_d` (`e_6c0722d88b6647a6b80c76f99a9e3963_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_index_product`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_index_product` (
  `item_id` int(11) unsigned NOT NULL,
  `e_itemcategory_s` varchar(50) DEFAULT NULL,
  `e_itemcategory_n` double DEFAULT NULL,
  `e_itemcategory_d` datetime DEFAULT NULL,
  `e_itemfrontpage_n` tinyint(1) DEFAULT '0',
  `e_itemtag_s` varchar(50) DEFAULT NULL,
  `e_itemtag_n` double DEFAULT NULL,
  `e_itemtag_d` datetime DEFAULT NULL,
  `e_62ec77b49f864749ad1132353efe3f92_s` varchar(50) DEFAULT NULL,
  `e_62ec77b49f864749ad1132353efe3f92_n` double DEFAULT NULL,
  `e_62ec77b49f864749ad1132353efe3f92_d` datetime DEFAULT NULL,
  `e_ff61396cfe574e7dbc9bb141bbea6067_s` varchar(50) DEFAULT NULL,
  `e_ff61396cfe574e7dbc9bb141bbea6067_n` double DEFAULT NULL,
  `e_ff61396cfe574e7dbc9bb141bbea6067_d` datetime DEFAULT NULL,
  `e_84081cd8d15442478363ec2e9b89aa94_s` varchar(50) DEFAULT NULL,
  `e_84081cd8d15442478363ec2e9b89aa94_n` double DEFAULT NULL,
  `e_84081cd8d15442478363ec2e9b89aa94_d` datetime DEFAULT NULL,
  `e_126be91cd8af4d0e807f6b97e7e42708_s` varchar(50) DEFAULT NULL,
  `e_126be91cd8af4d0e807f6b97e7e42708_n` double DEFAULT NULL,
  `e_126be91cd8af4d0e807f6b97e7e42708_d` datetime DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_s` varchar(50) DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_n` double DEFAULT NULL,
  `e_888260d0e4b749ca949a063f17dedab1_d` datetime DEFAULT NULL,
  `e_a9da76ee6c084abdbdec804808de0d6b_s` varchar(50) DEFAULT NULL,
  `e_a9da76ee6c084abdbdec804808de0d6b_n` double DEFAULT NULL,
  `e_a9da76ee6c084abdbdec804808de0d6b_d` datetime DEFAULT NULL,
  `e_fe9c90e8e9ed4443bd6d368c1b757978_s` varchar(50) DEFAULT NULL,
  `e_fe9c90e8e9ed4443bd6d368c1b757978_n` double DEFAULT NULL,
  `e_fe9c90e8e9ed4443bd6d368c1b757978_d` datetime DEFAULT NULL,
  `e_083f753e3caa4a9a8b9e9f7bddb4967b_s` varchar(50) DEFAULT NULL,
  `e_083f753e3caa4a9a8b9e9f7bddb4967b_n` double DEFAULT NULL,
  `e_083f753e3caa4a9a8b9e9f7bddb4967b_d` datetime DEFAULT NULL,
  `e_c0a33b8a23724c43aafa9401224a662f_s` varchar(50) DEFAULT NULL,
  `e_c0a33b8a23724c43aafa9401224a662f_n` double DEFAULT NULL,
  `e_c0a33b8a23724c43aafa9401224a662f_d` datetime DEFAULT NULL,
  KEY `item_id` (`item_id`),
  KEY `e_itemcategory_s` (`e_itemcategory_s`),
  KEY `e_itemcategory_n` (`e_itemcategory_n`),
  KEY `e_itemfrontpage_n` (`e_itemfrontpage_n`),
  KEY `e_itemtag_s` (`e_itemtag_s`),
  KEY `e_itemtag_n` (`e_itemtag_n`),
  KEY `e_62ec77b49f864749ad1132353efe3f92_s` (`e_62ec77b49f864749ad1132353efe3f92_s`),
  KEY `e_62ec77b49f864749ad1132353efe3f92_n` (`e_62ec77b49f864749ad1132353efe3f92_n`),
  KEY `e_62ec77b49f864749ad1132353efe3f92_d` (`e_62ec77b49f864749ad1132353efe3f92_d`),
  KEY `e_ff61396cfe574e7dbc9bb141bbea6067_s` (`e_ff61396cfe574e7dbc9bb141bbea6067_s`),
  KEY `e_ff61396cfe574e7dbc9bb141bbea6067_n` (`e_ff61396cfe574e7dbc9bb141bbea6067_n`),
  KEY `e_ff61396cfe574e7dbc9bb141bbea6067_d` (`e_ff61396cfe574e7dbc9bb141bbea6067_d`),
  KEY `e_84081cd8d15442478363ec2e9b89aa94_s` (`e_84081cd8d15442478363ec2e9b89aa94_s`),
  KEY `e_84081cd8d15442478363ec2e9b89aa94_n` (`e_84081cd8d15442478363ec2e9b89aa94_n`),
  KEY `e_84081cd8d15442478363ec2e9b89aa94_d` (`e_84081cd8d15442478363ec2e9b89aa94_d`),
  KEY `e_126be91cd8af4d0e807f6b97e7e42708_s` (`e_126be91cd8af4d0e807f6b97e7e42708_s`),
  KEY `e_126be91cd8af4d0e807f6b97e7e42708_n` (`e_126be91cd8af4d0e807f6b97e7e42708_n`),
  KEY `e_126be91cd8af4d0e807f6b97e7e42708_d` (`e_126be91cd8af4d0e807f6b97e7e42708_d`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_s` (`e_888260d0e4b749ca949a063f17dedab1_s`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_n` (`e_888260d0e4b749ca949a063f17dedab1_n`),
  KEY `e_888260d0e4b749ca949a063f17dedab1_d` (`e_888260d0e4b749ca949a063f17dedab1_d`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_s` (`e_a9da76ee6c084abdbdec804808de0d6b_s`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_n` (`e_a9da76ee6c084abdbdec804808de0d6b_n`),
  KEY `e_a9da76ee6c084abdbdec804808de0d6b_d` (`e_a9da76ee6c084abdbdec804808de0d6b_d`),
  KEY `e_fe9c90e8e9ed4443bd6d368c1b757978_s` (`e_fe9c90e8e9ed4443bd6d368c1b757978_s`),
  KEY `e_fe9c90e8e9ed4443bd6d368c1b757978_n` (`e_fe9c90e8e9ed4443bd6d368c1b757978_n`),
  KEY `e_fe9c90e8e9ed4443bd6d368c1b757978_d` (`e_fe9c90e8e9ed4443bd6d368c1b757978_d`),
  KEY `e_083f753e3caa4a9a8b9e9f7bddb4967b_s` (`e_083f753e3caa4a9a8b9e9f7bddb4967b_s`),
  KEY `e_083f753e3caa4a9a8b9e9f7bddb4967b_n` (`e_083f753e3caa4a9a8b9e9f7bddb4967b_n`),
  KEY `e_083f753e3caa4a9a8b9e9f7bddb4967b_d` (`e_083f753e3caa4a9a8b9e9f7bddb4967b_d`),
  KEY `e_c0a33b8a23724c43aafa9401224a662f_s` (`e_c0a33b8a23724c43aafa9401224a662f_s`),
  KEY `e_c0a33b8a23724c43aafa9401224a662f_n` (`e_c0a33b8a23724c43aafa9401224a662f_n`),
  KEY `e_c0a33b8a23724c43aafa9401224a662f_d` (`e_c0a33b8a23724c43aafa9401224a662f_d`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_jbzoo_index_product`
--

INSERT INTO `bzrnp_zoo_jbzoo_index_product` (`item_id`, `e_itemcategory_s`, `e_itemcategory_n`, `e_itemcategory_d`, `e_itemfrontpage_n`, `e_itemtag_s`, `e_itemtag_n`, `e_itemtag_d`, `e_62ec77b49f864749ad1132353efe3f92_s`, `e_62ec77b49f864749ad1132353efe3f92_n`, `e_62ec77b49f864749ad1132353efe3f92_d`, `e_ff61396cfe574e7dbc9bb141bbea6067_s`, `e_ff61396cfe574e7dbc9bb141bbea6067_n`, `e_ff61396cfe574e7dbc9bb141bbea6067_d`, `e_84081cd8d15442478363ec2e9b89aa94_s`, `e_84081cd8d15442478363ec2e9b89aa94_n`, `e_84081cd8d15442478363ec2e9b89aa94_d`, `e_126be91cd8af4d0e807f6b97e7e42708_s`, `e_126be91cd8af4d0e807f6b97e7e42708_n`, `e_126be91cd8af4d0e807f6b97e7e42708_d`, `e_888260d0e4b749ca949a063f17dedab1_s`, `e_888260d0e4b749ca949a063f17dedab1_n`, `e_888260d0e4b749ca949a063f17dedab1_d`, `e_a9da76ee6c084abdbdec804808de0d6b_s`, `e_a9da76ee6c084abdbdec804808de0d6b_n`, `e_a9da76ee6c084abdbdec804808de0d6b_d`, `e_fe9c90e8e9ed4443bd6d368c1b757978_s`, `e_fe9c90e8e9ed4443bd6d368c1b757978_n`, `e_fe9c90e8e9ed4443bd6d368c1b757978_d`, `e_083f753e3caa4a9a8b9e9f7bddb4967b_s`, `e_083f753e3caa4a9a8b9e9f7bddb4967b_n`, `e_083f753e3caa4a9a8b9e9f7bddb4967b_d`, `e_c0a33b8a23724c43aafa9401224a662f_s`, `e_c0a33b8a23724c43aafa9401224a662f_n`, `e_c0a33b8a23724c43aafa9401224a662f_d`) VALUES
(13, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, 'да', NULL, NULL, 'шт', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, 'Москва', NULL, NULL, '13', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '31', 31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да', NULL, NULL, '4', 4, NULL),
(32, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'м', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '32', 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да', NULL, NULL, NULL, NULL, NULL),
(29, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'м', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '29', 29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да', NULL, NULL, NULL, NULL, NULL),
(30, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, 'да', NULL, NULL, 'м', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '30', 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, 'да', NULL, NULL, 'м2', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '28', 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'шт', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '12', 12, NULL, 'Бежевый', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'Кровельный иструмент и оборудование', 62, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'м2', NULL, NULL, '__IMAGE_EXISTS__', NULL, NULL, NULL, NULL, NULL, '11', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `bzrnp_zoo_jbzoo_sku`
--

CREATE TABLE IF NOT EXISTS `bzrnp_zoo_jbzoo_sku` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `bzrnp_zoo_jbzoo_sku`
--

INSERT INTO `bzrnp_zoo_jbzoo_sku` (`item_id`, `element_id`, `sku`, `type`, `is_new`, `is_hit`, `is_sale`, `price`, `total`, `currency`, `balance`, `hash`, `params`) VALUES
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 2, 0, 0, 0, 2000, 2000, 'RUB', -1, '13-p1-lobnya_p2-3009_p3-1x2', ' {\n	"param1": "lobnya",\n	"param2": "3009",\n	"param3": "1x2",\n	"description": ""\n}'),
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 2, 0, 0, 0, 333, 333, 'RUB', -1, '13-p1-moskva_p2-3005_p3-3x2', ' {\n	"param1": "moskva",\n	"param2": "3005",\n	"param3": "3x2",\n	"description": ""\n}'),
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 2, 0, 0, 0, 888, 888, 'RUB', -1, '13-p1-moskva_p2-1015_p3-1x2', ' {\n	"param1": "moskva",\n	"param2": "1015",\n	"param3": "1x2",\n	"description": ""\n}'),
(11, '888260d0-e4b7-49ca-949a-063f17dedab1', '11', 1, 0, 0, 0, 500, 500, 'RUB', -1, '11', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31', 2, 0, 0, 0, 600, 600, 'RUB', -1, '31-p1-_p2-6005_p3-3x2', ' {\n	"param1": "",\n	"param2": "6005",\n	"param3": "3x2",\n	"description": ""\n}'),
(32, '888260d0-e4b7-49ca-949a-063f17dedab1', '35', 2, 0, 0, 0, 4500, 4500, 'RUB', -1, '32-p1-lobnya_p2-9003_p3-', ' {\n	"param1": "lobnya",\n	"param2": "9003",\n	"param3": "",\n	"description": ""\n}'),
(32, '888260d0-e4b7-49ca-949a-063f17dedab1', '32', 2, 0, 0, 0, 5500, 5500, 'RUB', -1, '32-p1-moskva_p2-9003_p3-', ' {\n	"param1": "moskva",\n	"param2": "9003",\n	"param3": "",\n	"description": ""\n}'),
(32, '888260d0-e4b7-49ca-949a-063f17dedab1', '32', 1, 0, 1, 0, 0, 0, 'RUB', -1, '32', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 1, 0, 1, 0, 0, 0, 'RUB', -1, '13', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13', 2, 0, 0, 0, 54677, 54677, 'RUB', -1, '13-p1-moskva_p2-1014_p3-2x1', ' {\n	"param1": "moskva",\n	"param2": "1014",\n	"param3": "2x1",\n	"description": ""\n}'),
(29, '888260d0-e4b7-49ca-949a-063f17dedab1', '29', 1, 0, 0, 0, 5000, 5000, 'RUB', -1, '29', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(30, '888260d0-e4b7-49ca-949a-063f17dedab1', '30', 2, 0, 0, 0, 12000, 12000, 'RUB', -1, '30-p1-lobnya_p2-9003_p3-1x2', ' {\n	"param1": "lobnya",\n	"param2": "9003",\n	"param3": "1x2",\n	"description": ""\n}'),
(30, '888260d0-e4b7-49ca-949a-063f17dedab1', '30', 2, 0, 0, 0, 10000, 10000, 'RUB', -1, '30-p1-moskva_p2-7024_p3-1x2', ' {\n	"param1": "moskva",\n	"param2": "7024",\n	"param3": "1x2",\n	"description": ""\n}'),
(30, '888260d0-e4b7-49ca-949a-063f17dedab1', '30', 2, 0, 0, 0, 15000, 15000, 'RUB', -1, '30-p1-moskva_p2-7005_p3-2x1', ' {\n	"param1": "moskva",\n	"param2": "7005",\n	"param3": "2x1",\n	"description": ""\n}'),
(30, '888260d0-e4b7-49ca-949a-063f17dedab1', '30', 1, 0, 0, 0, 10000, 10000, 'RUB', -1, '30', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(28, '888260d0-e4b7-49ca-949a-063f17dedab1', '28', 1, 0, 0, 0, 0, 0, 'RUB', -1, '28', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(28, '888260d0-e4b7-49ca-949a-063f17dedab1', '28', 2, 0, 0, 0, 300, 300, 'RUB', -1, '28-p1-moskva_p2-7005_p3-2x1', ' {\n	"param1": "moskva",\n	"param2": "7005",\n	"param3": "2x1",\n	"description": ""\n}'),
(28, '888260d0-e4b7-49ca-949a-063f17dedab1', '28', 2, 0, 0, 0, 700, 700, 'RUB', -1, '28-p1-lobnya_p2-5005_p3-1x2', ' {\n	"param1": "lobnya",\n	"param2": "5005",\n	"param3": "1x2",\n	"description": ""\n}'),
(28, '888260d0-e4b7-49ca-949a-063f17dedab1', '28', 2, 0, 0, 0, 1200, 1200, 'RUB', -1, '28-p1-moskva_p2-5021_p3-1x2', ' {\n	"param1": "moskva",\n	"param2": "5021",\n	"param3": "1x2",\n	"description": ""\n}'),
(12, '888260d0-e4b7-49ca-949a-063f17dedab1', '12', 1, 0, 0, 0, 43252300, 43252300, 'RUB', -1, '12', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31', 2, 0, 0, 0, 600, 600, 'RUB', -1, '31-p1-_p2-3005_p3-1x2', ' {\n	"param1": "",\n	"param2": "3005",\n	"param3": "1x2",\n	"description": ""\n}'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31', 2, 0, 0, 0, 600, 600, 'RUB', -1, '31-p1-lobnya_p2-_p3-3x2', ' {\n	"param1": "lobnya",\n	"param2": "",\n	"param3": "3x2",\n	"description": ""\n}'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31', 2, 0, 0, 0, 600, 600, 'RUB', -1, '31-p1-moskva_p2-3009_p3-1x2', ' {\n	"param1": "moskva",\n	"param2": "3009",\n	"param3": "1x2",\n	"description": ""\n}'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31', 1, 0, 1, 0, 600, 600, 'RUB', -1, '31', ' {\n	"param1": "",\n	"param2": "",\n	"param3": "",\n	"description": ""\n}'),
(29, '888260d0-e4b7-49ca-949a-063f17dedab1', '29', 2, 0, 0, 0, 600, 600, 'RUB', -1, '29-p1-moskva_p2-3005_p3-1x2', ' {\n	"param1": "moskva",\n	"param2": "3005",\n	"param3": "1x2",\n	"description": ""\n}'),
(29, '888260d0-e4b7-49ca-949a-063f17dedab1', '29', 2, 0, 0, 0, 700, 700, 'RUB', -1, '29-p1-_p2-3003_p3-1x2', ' {\n	"param1": "",\n	"param2": "3003",\n	"param3": "1x2",\n	"description": ""\n}'),
(29, '888260d0-e4b7-49ca-949a-063f17dedab1', '29', 2, 0, 0, 0, 800, 800, 'RUB', -1, '29-p1-_p2-7005_p3-3x2', ' {\n	"param1": "",\n	"param2": "7005",\n	"param3": "3x2",\n	"description": ""\n}');

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
(12, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(13, '62ec77b4-9f86-4749-ad11-32353efe3f92', 'да'),
(12, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'шт'),
(28, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'м2'),
(15, '94e70ec3-41aa-421d-a729-2c38f32a864f', 'Да'),
(16, '94e70ec3-41aa-421d-a729-2c38f32a864f', 'Нет'),
(17, '932755cf-9ac7-455a-82be-8fe11a159cb5', 'Оплата банковской картой'),
(18, '932755cf-9ac7-455a-82be-8fe11a159cb5', 'Оплата по счету через любой банк'),
(18, '7db9c36f-6831-41b7-9814-8facfa8720ac', 'Доставка курьером'),
(21, '619a8371-929a-4651-87af-78f70346201b', '1341234\n12341234\n1234'),
(21, '6532e39e-2010-4c45-8c30-9d8f702dd606', 'адрес'),
(22, '6532e39e-2010-4c45-8c30-9d8f702dd606', 'адрес города а'),
(22, '619a8371-929a-4651-87af-78f70346201b', 'фффффффффф'),
(23, '6532e39e-2010-4c45-8c30-9d8f702dd606', 'тверская'),
(23, '619a8371-929a-4651-87af-78f70346201b', 'firts number\nsecond number'),
(24, '6532e39e-2010-4c45-8c30-9d8f702dd606', 'выфафываыфва ыф '),
(24, '619a8371-929a-4651-87af-78f70346201b', '5634653456346363465'),
(25, '4d1f32fb-4dd3-40f7-adff-650647e7c9dc', '10:00 - 14:00'),
(25, '7db9c36f-6831-41b7-9814-8facfa8720ac', 'Самовывоз (бесплатно)'),
(25, 'e0e2eb90-00a9-4ea1-ad90-5f9883994ad1', 'Москва'),
(25, '932755cf-9ac7-455a-82be-8fe11a159cb5', 'Оплата банковской картой'),
(26, '4d1f32fb-4dd3-40f7-adff-650647e7c9dc', '10:00 - 14:00'),
(26, '7db9c36f-6831-41b7-9814-8facfa8720ac', 'Самовывоз (бесплатно)'),
(26, 'e0e2eb90-00a9-4ea1-ad90-5f9883994ad1', 'Москва'),
(26, '932755cf-9ac7-455a-82be-8fe11a159cb5', 'Оплата банковской картой'),
(13, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'шт'),
(13, '888260d0-e4b7-49ca-949a-063f17dedab1', '13'),
(12, '3dacc57d-2a23-4ec0-bdd0-d5608d31b684', 'Привет'),
(12, '888260d0-e4b7-49ca-949a-063f17dedab1', '12'),
(13, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(28, '62ec77b4-9f86-4749-ad11-32353efe3f92', 'да'),
(28, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(29, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'м'),
(29, '083f753e-3caa-4a9a-8b9e-9f7bddb4967b', 'Да'),
(29, '888260d0-e4b7-49ca-949a-063f17dedab1', '29'),
(29, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(29, '3dacc57d-2a23-4ec0-bdd0-d5608d31b684', 'це текст-"риба", що використовується в друкарстві та дизайні. Lorem Ipsum є, фактично, стандартною "рибою" аж з XVI сторіччя, коли невідомий друкар взяв шрифтову гранку та склав на ній підбірку зразків шрифтів. "Риба" не тільки успішно пережила п''ять століть, але й прижилася в'),
(30, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'м'),
(30, '62ec77b4-9f86-4749-ad11-32353efe3f92', 'да'),
(30, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(30, '888260d0-e4b7-49ca-949a-063f17dedab1', '30'),
(30, '3dacc57d-2a23-4ec0-bdd0-d5608d31b684', 'Вже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей текст має більш-менш нормальне розподілення літер на відміну від, наприклад, "Тут іде текст. Тут іде текст." Це робить текст схожим на оповідний. Багато програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук за терміном "lorem ipsum" відкриє багато веб-сайтів, які знаходяться ще в зародковому стані. Різні версії Lorem Ipsum з''явились за минулі роки, деякі випадково, деякі було створено зумисно (зокрема, жартівливі).'),
(11, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(11, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'м2'),
(31, '083f753e-3caa-4a9a-8b9e-9f7bddb4967b', 'Да'),
(31, '888260d0-e4b7-49ca-949a-063f17dedab1', '31'),
(31, 'c0a33b8a-2372-4c43-aafa-9401224a662f', '4'),
(31, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(31, '3dacc57d-2a23-4ec0-bdd0-d5608d31b684', 'Lorem Ipsum - це текст-"риба", що використовується в друкарстві та дизайні. Lorem Ipsum є, фактично, стандартною "рибою" аж з XVI сторіччя, коли невідомий друкар взяв шрифтову гранку та склав на ній підбірку зразків шрифтів.\r\n"Риба" не тільки успішно пережила п''ять століть, але й прижилася в електронному верстуванні, залишаючись по суті незмінною.\r\nВона популяризувалась в 60-их роках минулого сторіччя завдяки виданню зразків шрифтів Letraset, які містили уривки з Lorem Ipsum, і вдруге - нещодавно завдяки програмам комп''ютерного верстування на кшталт Aldus Pagemaker, які використовували різні версії Lorem Ipsum.'),
(32, '083f753e-3caa-4a9a-8b9e-9f7bddb4967b', 'Да'),
(32, 'ff61396c-fe57-4e7d-bc9b-b141bbea6067', 'м'),
(32, '888260d0-e4b7-49ca-949a-063f17dedab1', '32'),
(32, '84081cd8-d154-4247-8363-ec2e9b89aa94', '\n__IMAGE_EXISTS__'),
(32, '3dacc57d-2a23-4ec0-bdd0-d5608d31b684', 'Вже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей текст має більш-менш нормальне розподілення літер на відміну від, наприклад, "Тут іде текст. Тут іде текст."\r\nЦе робить текст схожим на оповідний. Багато програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук за терміном "lorem ipsum" відкриє багато веб-сайтів, які знаходяться ще в зародковому стані. Різні версії Lorem Ipsum з''явились за минулі роки, деякі випадково, деякі було створено зумисно (зокрема, жартівливі). Вже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей текст має більш-менш нормальне розподілення літер на відміну від, наприклад, "Тут іде текст. Тут іде текст." Це робить текст схожим на оповідний. Багато програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук за терміном "lorem ipsum" відкриє багато веб-сайтів, які знаходяться ще в зародковому стані. Різні версії Lorem Ipsum з''явились за минулі роки, деякі випадково, деякі було створено зумисно (зокрема, жартівливі). Вже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей текст має більш-менш нормальне розподілення літер на відміну від, наприклад, "Тут іде текст. Тут іде текст." Це робить текст схожим на оповідний. Багато програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук за терміном "lorem ipsum" відкриє багато веб-сайтів, які знаходяться ще в зародковому стані. Різні версії Lorem Ipsum з''явились за минулі роки, деякі випадково, деякі було створено зумисно (зокрема, жартівливі).\r\nВже давно відомо, що читабельний зміст буде заважати зосередитись людині, яка оцінює композицію сторінки. Сенс використання Lorem Ipsum полягає в тому, що цей текст має більш-менш нормальне розподілення літер на відміну від, наприклад, "Тут іде текст. Тут іде текст."\r\nЦе робить текст схожим на оповідний. Багато програм верстування та веб-дизайну використовують Lorem Ipsum як зразок і пошук за терміном "lorem ipsum" відкриє багато веб-сайтів, які знаходяться ще в зародковому стані. Різні версії Lorem Ipsum з''явились за минулі роки, деякі випадково, деякі було створено зумисно (зокрема, жартівливі).'),
(11, '083f753e-3caa-4a9a-8b9e-9f7bddb4967b', 'Да'),
(28, '888260d0-e4b7-49ca-949a-063f17dedab1', '28'),
(13, '126be91c-d8af-4d0e-807f-6b97e7e42708', 'Москва'),
(11, '888260d0-e4b7-49ca-949a-063f17dedab1', '11'),
(12, 'a9da76ee-6c08-4abd-bdec-804808de0d6b', 'Бежевый');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `bzrnp_zoo_submission`
--

INSERT INTO `bzrnp_zoo_submission` (`id`, `application_id`, `name`, `alias`, `state`, `access`, `params`) VALUES
(1, 1, 'Оформление заказа', 'oformlenie-zakaza', 1, 1, ' {\n	"trusted_mode": null,\n	"show_tooltip": "1",\n	"item_edit": "0",\n	"max_submissions": "0",\n	"captcha": "",\n	"captcha_guest_only": null,\n	"email_notification": ""\n}'),
(2, 2, 'Форма заказа', 'forma-zakaza', 1, 1, ' {\n	"form.order":  {\n		"layout": "order",\n		"category": ""\n	},\n	"trusted_mode": null,\n	"show_tooltip": "1",\n	"item_edit": "0",\n	"max_submissions": "0",\n	"captcha": "",\n	"captcha_guest_only": null,\n	"email_notification": ""\n}');

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

-- --------------------------------------------------------

--
-- Структура таблицы `orders_documents`
--

CREATE TABLE IF NOT EXISTS `orders_documents` (
  `order_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `order_date` varchar(50) CHARACTER SET utf8 NOT NULL,
  `fio` varchar(255) CHARACTER SET utf8 NOT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `firm_telephones` varchar(255) CHARACTER SET utf8 NOT NULL,
  `firm_city` varchar(255) CHARACTER SET cp1251 NOT NULL,
  `firm_city_address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `productList` text CHARACTER SET utf8 NOT NULL,
  `countProductList` varchar(255) CHARACTER SET utf8 NOT NULL,
  `priceProductList` varchar(255) CHARACTER SET utf8 NOT NULL,
  `total_price` varchar(100) CHARACTER SET utf8 NOT NULL,
  `number` varchar(100) CHARACTER SET utf8 NOT NULL,
  `elementsParameters` varchar(100) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `orders_documents`
--

INSERT INTO `orders_documents` (`order_id`, `order_date`, `fio`, `telephone`, `firm_telephones`, `firm_city`, `firm_city_address`, `productList`, `countProductList`, `priceProductList`, `total_price`, `number`, `elementsParameters`) VALUES
('53c68864508e8', '16.07.2014 16:12', 'ЫВФАФЫВАФЫВА', 'ЫВФАФЫВФЫВ', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 2|Товар', '1|1', '49 743,50  р. |500,00  р. ', '50 243,50  р.', '', ''),
('53c7896ae2ff7', '17.07.2014 10:29', 'Бойко Роман Валентинович', '0501376949', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 2', '2|1', '2 151 523 023,51  р. |49 743,50  р. ', '4 303 095 790,52  р.', 'ЦКФ100003', ''),
('53ce1b7abcbcc', '22.07.2014 10:06', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4|Товар 4', '2|3', '54 677,00  р. |333,00  р. ', '110 353,00  р.', 'ЦКФ100004', ''),
('53ce31ba8b712', '22.07.2014 11:41', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4|Товар 3|Товар 4', '2|1|3', '54 677,00  р. |2 151 523 023,51  р. |333,00  р. ', '2 151 633 376,51  р.', 'ЦКФ100005', ''),
('53ce34fe91c90', '22.07.2014 11:55', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3() |Товар 4(Красное вино) 1x2', '2|1|3', '54 677,00  р. |2 151 523 023,51  р. |333,00  р. ', '2 151 633 376,51  р.', 'ЦКФ100006', ''),
('53ce39a7cbe78', '22.07.2014 12:15', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3() ', '3', '43 252 345,00  р. ', '129 757 035,00  р.', 'ЦКФ100007', ''),
('53ce3b14efeb8', '22.07.2014 12:21', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100008', ''),
('53ce443b6d377', '22.07.2014 13:00', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100009', ''),
('53ce447c1e06a', '22.07.2014 13:01', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100010', ''),
('53ce4ac3e64ec', '22.07.2014 13:28', 'ыфваывафыва', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100011', 'штучка|м2'),
('53ce4ac3e64ec', '22.07.2014 13:28', 'ыфваывафыва', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100012', 'штучка|м2'),
('53ce4ac3e64ec', '22.07.2014 13:28', 'ыфваывафыва', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100013', 'штучка|м2'),
('53ce4ac3e64ec', '22.07.2014 13:28', 'ыфваывафыва', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2', '3|2', '43 252 345,00  р. |54 677,00  р. ', '129 866 389,00  р.', 'ЦКФ100014', 'штучка|м2'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100015', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100016', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100017', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100018', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100019', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100020', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100021', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100022', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100023', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100024', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100025', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100026', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 4(Бежевый) 2x1.2|Товар 3', '5|8', '54 677,00  р. |43 252 345,00  р. ', '346 292 145,00  р.', 'ЦКФ100027', 'м2|шт'),
('53ce4b95dfe94', '22.07.2014 13:31', 'Роман', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3', '8', '43 252 345,00  р. ', '346 018 760,00  р.', 'ЦКФ100028', 'шт'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100029', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100030', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100031', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100032', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100033', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100034', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100035', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100036', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100037', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100038', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100039', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100040', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100041', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100042', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100043', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100044', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100045', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100046', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100047', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100048', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100049', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100050', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100051', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100052', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100053', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100054', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100055', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100056', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100057', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100058', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100059', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100060', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100061', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100062', 'false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100063', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар 3|Товар 4(Бежевый) 2x1.2|Товар 4(Красное вино) 1x2|Товар 2|Товар', '8|2|7|9|1', '43 252 345,00  р. |54 677,00  р. |333,00  р. |49 743,50  р. |500,00  р. ', '346 578 636,50  р.', 'ЦКФ100064', 'шт|м2|м2|false|false'),
('53ce4c924c7ec', '22.07.2014 13:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар', '1', '500,00  р. ', '500,00  р.', 'ЦКФ100065', 'false'),
('53ce56669e236', '22.07.2014 14:17', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |28.799999999999997', '164 531,00  р.', 'ЦКФ100066', 'false|м2|м'),
('53ce56669e236', '22.07.2014 14:17', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |28.799999999999997', '164 531,00  р.', 'ЦКФ100067', 'false|м2|м'),
('53ce56669e236', '22.07.2014 14:17', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |28.799999999999997', '164 531,00  р.', 'ЦКФ100068', 'false|м2|м'),
('53ce57101f502', '22.07.2014 14:20', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29', '164 531,00  р.', 'ЦКФ100069', 'false|м2|м'),
('53ce57388e384', '22.07.2014 14:21', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100070', 'false|м2|м'),
('53ce57388e384', '22.07.2014 14:21', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100071', 'false|м2|м'),
('53ce57388e384', '22.07.2014 14:21', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100072', 'false|м2|м'),
('53ce57d88f31b', '22.07.2014 14:23', 'ААААААА', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100073', 'false|м2|м'),
('53ce5a803eacf', '22.07.2014 14:35', '', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100074', 'false|м2|м'),
('53ce5aa110403', '22.07.2014 14:35', 'ЫВПЫВП563465456436534653465', '', 'firts number, second number', 'г.Москва', 'тверская', 'Товар|Товар 4(Бежевый) 2x1.2|Упаковка', '1|3|1', '500,00  р. |54 677,00  р. |29 р.', '164 531,00  р.', 'ЦКФ100075', 'false|м2|м');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
