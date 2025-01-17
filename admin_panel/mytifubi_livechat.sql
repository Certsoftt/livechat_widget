-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2025 at 06:17 PM
-- Server version: 10.6.20-MariaDB-cll-lve-log
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mytifubi_livechat`
--

-- --------------------------------------------------------

--
-- Table structure for table `lc3_answers`
--

CREATE TABLE `lc3_answers` (
  `id` int(10) NOT NULL,
  `department` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(5) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `fireup` smallint(5) UNSIGNED NOT NULL DEFAULT 60,
  `msgtype` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=standard,2=welcome,3=closed,4=expired,5=firstmsg',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_answers`
--

INSERT INTO `lc3_answers` (`id`, `department`, `lang`, `title`, `message`, `fireup`, `msgtype`, `created`) VALUES
(1, 0, 'en', 'Enters Chat', '%operator% enters the chat.', 15, 2, '2025-01-15 07:52:52'),
(2, 0, 'en', 'Expired', 'This chat has been ended for good. Please start a new one or use your personal restore code.', 15, 4, '2025-01-15 07:52:52'),
(3, 0, 'en', 'Ended', '%client% has ended the conversation', 15, 3, '2025-01-15 07:52:52'),
(4, 0, 'en', 'Welcome', 'Welcome %client%, a representative will be with you shortly.', 15, 5, '2025-01-15 07:52:52'),
(5, 0, 'en', 'Leave', 'has left the conversation.', 15, 6, '2025-01-15 07:52:52'),
(6, 0, 'en', 'Start Page', 'Please insert your name to begin, a representative will be with you shortly.', 15, 7, '2025-01-15 07:52:52'),
(7, 0, 'en', 'Contact Page', 'None of our representatives are available right now, although you are welcome to leave a message!', 15, 8, '2025-01-15 07:52:52'),
(8, 0, 'en', 'Feedback Page', 'We would appreciate your feedback to improve our service.', 15, 9, '2025-01-15 07:52:52'),
(9, 0, 'en', 'Quickstart Page', 'Please type a message and hit enter to start the conversation.', 15, 10, '2025-01-15 07:52:52'),
(10, 0, 'en', 'Group Chat Welcome Message', 'Welcome to our weekly support session, sharing experience and feedback.', 0, 11, '2025-01-15 07:52:52'),
(11, 0, 'en', 'Group Chat Offline Message', 'The public chat is offline at this moment, please try again later.', 15, 12, '2025-01-15 07:52:52'),
(12, 0, 'en', 'Group Chat Full Message', 'The public chat is full, please try again later.', 15, 13, '2025-01-15 07:52:52'),
(13, 0, 'en', 'Select Operator', 'Please select an operator of your choice and add your name and message to start a conversation.', 15, 14, '2025-01-15 07:52:52'),
(14, 0, 'en', 'Expired Soft', 'The chat has been ended due the inactivity, please type a message to restart again.', 15, 15, '2025-01-15 07:52:52'),
(15, 0, 'en', 'Transfer Message', 'We have transferred your conversation to %operator%, please hold.', 15, 16, '2025-01-15 07:52:52'),
(16, 0, 'en', 'WhatsApp Online', 'Please click on a operator below to connect via WhatsApp and get help immediately.', 15, 26, '2025-01-15 07:52:52'),
(17, 0, 'en', 'WhatsApp Offline', 'We are currently offline however please check below for available operators in WhatsApp, we try to help you as soon as possible.', 15, 27, '2025-01-15 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_autoproactive`
--

CREATE TABLE `lc3_autoproactive` (
  `id` int(10) NOT NULL,
  `path` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `btn_confirm` varchar(50) DEFAULT NULL,
  `btn_cancel` varchar(50) DEFAULT NULL,
  `showalert` smallint(1) UNSIGNED NOT NULL DEFAULT 1,
  `soundalert` varchar(100) DEFAULT NULL,
  `timeonsite` smallint(3) UNSIGNED NOT NULL DEFAULT 2,
  `visitedsites` smallint(2) UNSIGNED NOT NULL DEFAULT 1,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_bot_chatgpt`
--

CREATE TABLE `lc3_bot_chatgpt` (
  `id` int(10) NOT NULL,
  `widgetids` varchar(100) DEFAULT '0',
  `depid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(5) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_bot_question`
--

CREATE TABLE `lc3_bot_question` (
  `id` int(10) NOT NULL,
  `widgetids` varchar(100) DEFAULT '0',
  `depid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(5) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_bot_question`
--

INSERT INTO `lc3_bot_question` (`id`, `widgetids`, `depid`, `lang`, `question`, `answer`, `updated`, `created`, `active`) VALUES
(1, '1', 0, 'en', 'hello', 'hello', '2025-01-15 14:15:07', '2025-01-15 14:15:07', 1);

-- --------------------------------------------------------

--
-- Table structure for table `lc3_buttonstats`
--

CREATE TABLE `lc3_buttonstats` (
  `id` int(10) NOT NULL,
  `depid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `opid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `referrer` varchar(255) DEFAULT NULL,
  `firstreferrer` varchar(255) DEFAULT NULL,
  `crossurl` varchar(255) DEFAULT NULL,
  `agent` varchar(255) DEFAULT NULL,
  `hits` int(10) NOT NULL DEFAULT 0,
  `ip` char(45) NOT NULL DEFAULT '0',
  `country` varchar(64) DEFAULT NULL,
  `countrycode` char(2) NOT NULL DEFAULT 'xx',
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `readtime` smallint(1) NOT NULL DEFAULT 0,
  `session` varchar(64) DEFAULT NULL,
  `lasttime` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_buttonstats`
--

INSERT INTO `lc3_buttonstats` (`id`, `depid`, `opid`, `referrer`, `firstreferrer`, `crossurl`, `agent`, `hits`, `ip`, `country`, `countrycode`, `latitude`, `longitude`, `message`, `readtime`, `session`, `lasttime`, `time`) VALUES
(1, 0, 0, 'https://mytime360.com/', 'https://mytime360.com/', NULL, 'Windows - Chrome 131.0.0.0', 12, '102.90.102.224', 'Nigeria', 'ng', '10', '8', NULL, 0, '289741736946438', '2025-01-17 00:10:44', '2025-01-15 14:07:19'),
(2, 0, 0, 'https://mytime360.com/', 'https://mytime360.com/', NULL, 'unknown - Mozilla 5.0', 1, '202.8.42.93', 'Singapore', 'sg', '1.3673', '103.8014', NULL, 0, '287251737024235', '2025-01-16 11:43:56', '2025-01-16 11:43:55');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_chatcustomfields`
--

CREATE TABLE `lc3_chatcustomfields` (
  `id` int(10) NOT NULL,
  `convid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `contactid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `settname` varchar(100) DEFAULT NULL,
  `settvalue` text DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_chatsettings`
--

CREATE TABLE `lc3_chatsettings` (
  `id` int(10) NOT NULL,
  `widgetid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `template` varchar(20) DEFAULT 'business',
  `formtype` varchar(20) DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `settname` varchar(100) DEFAULT NULL,
  `settvalue` text DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_chatsettings`
--

INSERT INTO `lc3_chatsettings` (`id`, `widgetid`, `template`, `formtype`, `lang`, `settname`, `settvalue`, `updated`, `created`) VALUES
(1, 1, 'business', 'btn_form', 'en', 'btn_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(2, 1, 'business', 'btn_form', 'en', 'btn_animation_offline', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(3, 1, 'business', 'start_form', 'en', 'start_colour_theme', 'blue', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(4, 1, 'business', 'start_form', 'en', 'start_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(5, 1, 'business', 'chat_form', 'en', 'chat_colour_theme', 'blue', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(6, 1, 'business', 'chat_form', 'en', 'chat_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(7, 1, 'business', 'contact_form', 'en', 'contact_colour_theme', 'blue', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(8, 1, 'business', 'contact_form', 'en', 'contact_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(9, 1, 'business', 'profile_form', 'en', 'profile_colour_theme', 'blue', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(10, 1, 'business', 'profile_form', 'en', 'profile_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(11, 1, 'business', 'feedback_form', 'en', 'feedback_colour_theme', 'blue', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(12, 1, 'business', 'feedback_form', 'en', 'feedback_animation', 'animate__fadeIn', '2025-01-17 00:10:20', '2025-01-15 14:05:56'),
(13, 1, 'business', 'btn_form', 'en', 'btn_icon', 'fas fa-comment-alt', '2025-01-17 00:10:20', '2025-01-17 00:07:57'),
(14, 1, 'business', 'btn_form', 'en', 'btn_icon_offline', 'fas fa-comment-alt', '2025-01-17 00:10:20', '2025-01-17 00:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_chatwidget`
--

CREATE TABLE `lc3_chatwidget` (
  `id` int(10) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `depid` varchar(50) NOT NULL DEFAULT '0',
  `opid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang` varchar(5) DEFAULT NULL,
  `dsgvo` text DEFAULT NULL,
  `redirect_url` varchar(200) DEFAULT NULL,
  `redirect_active` tinyint(3) UNSIGNED DEFAULT 0,
  `redirect_after` tinyint(3) UNSIGNED DEFAULT 8,
  `feedback` tinyint(3) UNSIGNED DEFAULT 0,
  `hidewhenoff` tinyint(3) UNSIGNED DEFAULT 0,
  `onlymembers` tinyint(3) UNSIGNED DEFAULT 0,
  `chatgpt` tinyint(3) UNSIGNED DEFAULT 0,
  `chatgpt_helpful` text DEFAULT NULL,
  `template` varchar(20) DEFAULT 'business',
  `avatarset` varchar(20) DEFAULT 'business',
  `btn_tpl` varchar(100) DEFAULT 'icon_bottom_right.php',
  `start_tpl` varchar(100) DEFAULT 'small_big_bottom_right.php',
  `chat_tpl` varchar(100) DEFAULT 'small_big_bottom_right.php',
  `contact_tpl` varchar(100) DEFAULT 'small_big_bottom_right.php',
  `profile_tpl` varchar(100) DEFAULT 'small_big_bottom_right.php',
  `feedback_tpl` varchar(100) DEFAULT 'small_big_bottom_right.php',
  `updated` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_chatwidget`
--

INSERT INTO `lc3_chatwidget` (`id`, `title`, `depid`, `opid`, `lang`, `dsgvo`, `redirect_url`, `redirect_active`, `redirect_after`, `feedback`, `hidewhenoff`, `onlymembers`, `chatgpt`, `chatgpt_helpful`, `template`, `avatarset`, `btn_tpl`, `start_tpl`, `chat_tpl`, `contact_tpl`, `profile_tpl`, `feedback_tpl`, `updated`, `created`) VALUES
(1, 'Live Support Chat', '0', 0, 'en', '', '', 0, 8, 1, 0, 0, 1, '', 'business', 'business', 'icon_bottom_right.php', 'small_big_bottom_right.php', 'small_big_bottom_right.php', 'small_big_bottom_right.php', 'small_big_bottom_right.php', 'small_big_bottom_right.php', '2025-01-15 07:52:52', '2025-01-15 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_chat_ai_translations`
--

CREATE TABLE `lc3_chat_ai_translations` (
  `id` int(10) NOT NULL,
  `chatid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `answerid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `original_lang` text DEFAULT NULL,
  `translated_lang` text DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_checkstatus`
--

CREATE TABLE `lc3_checkstatus` (
  `convid` int(10) UNSIGNED NOT NULL,
  `depid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `department` varchar(100) DEFAULT NULL,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operator` varchar(100) DEFAULT NULL,
  `pusho` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `newc` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `newo` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `files` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `knockknock` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `msgdel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `msgedit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `typec` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `typeo` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `transferoid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `transferid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `denied` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `hide` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `datac` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `alert` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `statusc` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `statuso` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `initiated` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_checkstatus`
--

INSERT INTO `lc3_checkstatus` (`convid`, `depid`, `department`, `operatorid`, `operator`, `pusho`, `newc`, `newo`, `files`, `knockknock`, `msgdel`, `msgedit`, `typec`, `typeo`, `transferoid`, `transferid`, `denied`, `hide`, `datac`, `alert`, `statusc`, `statuso`, `initiated`) VALUES
(1, 1, 'Live Support', 1, 'Ubong Ukpe', 1, 0, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1737069054, 1737069340, 1737068403);

-- --------------------------------------------------------

--
-- Table structure for table `lc3_clientcontact`
--

CREATE TABLE `lc3_clientcontact` (
  `id` int(10) NOT NULL,
  `sessionid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorname` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_contacts`
--

CREATE TABLE `lc3_contacts` (
  `id` int(10) NOT NULL,
  `depid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `ip` char(45) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `countrycode` varchar(2) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `reply` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `answered` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `sent` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_contactsreply`
--

CREATE TABLE `lc3_contactsreply` (
  `id` int(10) NOT NULL,
  `contactid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorname` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `sent` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_departments`
--

CREATE TABLE `lc3_departments` (
  `id` int(10) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `faq_url` text DEFAULT NULL,
  `active` smallint(1) UNSIGNED NOT NULL DEFAULT 1,
  `dorder` smallint(2) UNSIGNED NOT NULL DEFAULT 1,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_departments`
--

INSERT INTO `lc3_departments` (`id`, `title`, `description`, `email`, `faq_url`, `active`, `dorder`, `time`) VALUES
(1, 'Live Support', 'Edit this department to your needs...', NULL, NULL, 1, 1, '2025-01-15 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_files`
--

CREATE TABLE `lc3_files` (
  `id` int(10) NOT NULL,
  `path` text DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_groupchat`
--

CREATE TABLE `lc3_groupchat` (
  `id` int(10) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `opids` varchar(10) DEFAULT '0',
  `maxclients` tinyint(3) UNSIGNED NOT NULL DEFAULT 20,
  `lang` varchar(5) DEFAULT NULL,
  `chatstyle` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bgimage` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `buttonimg` varchar(100) NOT NULL,
  `floatpopup` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `floatcss` varchar(100) DEFAULT NULL,
  `active` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_groupchat`
--

INSERT INTO `lc3_groupchat` (`id`, `password`, `title`, `description`, `opids`, `maxclients`, `lang`, `chatstyle`, `bgimage`, `buttonimg`, `floatpopup`, `floatcss`, `active`, `created`) VALUES
(1, NULL, 'Weekly Support', NULL, '0', 10, 'en', 0, 0, 'colour_on.png', 0, 'bottom:20px;left:20px', 0, '2025-01-15 07:52:52');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_groupchatmsg`
--

CREATE TABLE `lc3_groupchatmsg` (
  `id` int(10) NOT NULL,
  `groupchatid` int(10) NOT NULL DEFAULT 0,
  `chathistory` mediumtext DEFAULT NULL,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_groupchatuser`
--

CREATE TABLE `lc3_groupchatuser` (
  `id` int(10) NOT NULL,
  `groupchatid` int(10) NOT NULL DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `usr_avatar` varchar(255) DEFAULT NULL,
  `statusc` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastmsg` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `banned` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ip` char(45) NOT NULL DEFAULT '0',
  `isop` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `session` varchar(64) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_operatorchat`
--

CREATE TABLE `lc3_operatorchat` (
  `id` int(10) UNSIGNED NOT NULL,
  `fromid` int(10) NOT NULL DEFAULT 0,
  `toid` int(10) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `sent` int(10) NOT NULL DEFAULT 0,
  `received` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `msgpublic` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `system_message` varchar(3) DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_operatorchat`
--

INSERT INTO `lc3_operatorchat` (`id`, `fromid`, `toid`, `message`, `sent`, `received`, `msgpublic`, `system_message`) VALUES
(1, 1, 0, 'hello', 1737066420, 1, 1, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_push_notification_devices`
--

CREATE TABLE `lc3_push_notification_devices` (
  `id` int(10) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ostype` enum('ios','android') NOT NULL DEFAULT 'ios',
  `token` varchar(255) DEFAULT NULL,
  `appname` enum('lc3','hd3') DEFAULT NULL,
  `appversion` varchar(10) DEFAULT NULL,
  `lastedit` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_responses`
--

CREATE TABLE `lc3_responses` (
  `id` int(10) NOT NULL,
  `department` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(200) DEFAULT NULL,
  `short_code` varchar(200) DEFAULT NULL,
  `message` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_responses`
--

INSERT INTO `lc3_responses` (`id`, `department`, `title`, `short_code`, `message`) VALUES
(1, 0, 'Assist Today', '/assist', 'How can I assist you today?');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_sessions`
--

CREATE TABLE `lc3_sessions` (
  `id` int(10) NOT NULL,
  `widgetid` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `uniqueid` varchar(20) DEFAULT NULL,
  `userid` varchar(200) DEFAULT NULL,
  `department` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `operatorname` varchar(255) DEFAULT NULL,
  `template` varchar(20) DEFAULT 'business',
  `avatarset` varchar(20) DEFAULT 'business',
  `usr_avatar` varchar(255) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `countrycode` varchar(2) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `lang` varchar(5) DEFAULT 'en',
  `notes` text DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `fcontact` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `initiated` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ended` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `deniedoid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `session` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_sessions`
--

INSERT INTO `lc3_sessions` (`id`, `widgetid`, `uniqueid`, `userid`, `department`, `operatorid`, `operatorname`, `template`, `avatarset`, `usr_avatar`, `name`, `email`, `phone`, `country`, `city`, `countrycode`, `latitude`, `longitude`, `lang`, `notes`, `status`, `fcontact`, `initiated`, `ended`, `deniedoid`, `session`) VALUES
(1, 1, '4dd637df24', 'Guest102.90.102.224286674', 1, 1, 'Ubong Ukpe', 'business', 'business', '/lctemplate/business/avatar/business/1.jpg', 'Ubong Ukpe', 'atmonidexz@gmail.com', '08148106698', 'Nigeria', 'Disabled', 'ng', '10', '8', 'en', NULL, 0, 0, 1737068403, 1737068857, 0, '289741736946438');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_settings`
--

CREATE TABLE `lc3_settings` (
  `id` int(10) NOT NULL,
  `varname` varchar(100) DEFAULT NULL,
  `used_value` text DEFAULT NULL,
  `default_value` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_settings`
--

INSERT INTO `lc3_settings` (`id`, `varname`, `used_value`, `default_value`) VALUES
(1, 'allowedo_files', '.zip,.rar,.jpg,.jpeg,.png,.gif', '.zip,.rar,.jpg,.jpeg,.png,.gif'),
(2, 'allowed_files', '.zip,.rar,.jpg,.jpeg,.png,.gif', '.zip,.rar,.jpg,.jpeg,.png,.gif'),
(3, 'validtill', '0', '0'),
(4, 'client_expired', '600', '600'),
(5, 'client_left', '300', '300'),
(6, 'crating', '1', '0'),
(7, 'dateformat', 'd.m.Y', 'd.m.Y'),
(8, 'email', 'atmonidexz@gmail.com', '@lc3jak'),
(9, 'emailcc', '', '@jakcc'),
(10, 'email_block', '', NULL),
(11, 'facebook', '', ''),
(12, 'facebook_big', '', ''),
(13, 'ip_block', '', NULL),
(14, 'lang', 'en', 'en'),
(15, 'live_online_status', '1', '0'),
(16, 'chat_upload_standard', '1', '0'),
(17, 'msg_tone', '', 'new_message'),
(18, 'openop', '1', '1'),
(19, 'o_number', '4tjviirm-6y6h-mdqx-q1v2-9smu9kri4a9j', 'JaKwEb'),
(20, 'o_uname', 'xxxxx', 'jAkWEb'),
(21, 'pro_alert', '1', '1'),
(22, 'ring_tone', '', 'ring'),
(23, 'send_tscript', '1', '1'),
(24, 'show_ips', '1', '1'),
(25, 'smtp_sender', 'atmonidexz@gmail.com', ''),
(26, 'smtphost', '', ''),
(27, 'smtppassword', '', ''),
(28, 'smtpport', '25', '25'),
(29, 'smtpusername', '', ''),
(30, 'smtp_alive', '0', '0'),
(31, 'smtp_auth', '0', '0'),
(32, 'smtp_mail', '0', '0'),
(33, 'smtp_prefix', '', ''),
(34, 'timeformat', 'g:i a', 'g:i a'),
(35, 'timezoneserver', 'Europe/Zurich', 'Europe/Zurich'),
(36, 'title', 'Live Chat 3', 'Live Chat 3'),
(37, 'twilio_nexmo', '0', '1'),
(38, 'twitter', '', ''),
(39, 'twitter_big', '', ''),
(40, 'tw_msg', 'A customer is requesting attention.', 'A customer is requesting attention.'),
(41, 'tw_phone', '', ''),
(42, 'tw_sid', '', ''),
(43, 'tw_token', '', ''),
(44, 'updated', '1736945572', '1475494685'),
(45, 'useravatheight', '113', '113'),
(46, 'useravatwidth', '150', '150'),
(47, 'version', '5.1.4', '5.1.4'),
(48, 'holiday_mode', '0', '0'),
(49, 'push_reminder', '120', '120'),
(50, 'native_app_token', '', 'jakweb_app'),
(51, 'native_app_key', '', 'jakweb_app'),
(52, 'client_push_not', '1', '1'),
(53, 'engage_sound', 'sound/new_message3', 'sound/new_message3'),
(54, 'engage_icon', 'fa-bells', 'fa-bells'),
(55, 'client_sound', 'sound/hello', 'sound/hello'),
(56, 'proactive_time', '3', '3'),
(57, 'openai_chatgpt', '1', '0'),
(58, 'openai_apikey', 'your api key here', ''),
(59, 'chatgpt_version', 'gpt-4o-mini', 'gpt-4o-mini');

-- --------------------------------------------------------

--
-- Table structure for table `lc3_transcript`
--

CREATE TABLE `lc3_transcript` (
  `id` int(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `convid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `standardmsg` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `quoted` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `replied` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `starred` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `editoid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `edited` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `sentstatus` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `class` varchar(20) DEFAULT NULL,
  `plevel` smallint(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_transcript`
--

INSERT INTO `lc3_transcript` (`id`, `name`, `message`, `user`, `operatorid`, `convid`, `standardmsg`, `quoted`, `replied`, `starred`, `editoid`, `edited`, `time`, `sentstatus`, `class`, `plevel`) VALUES
(1, 'System', 'Welcome Ubong Ukpe, a representative will be with you shortly.', NULL, 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:00:03', 1, 'notice', 1),
(2, 'System', 'Your personal restore code in case you want to reopen the chat later: <strong>4dd637df24</strong>', NULL, 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:00:03', 1, 'notice', 1),
(3, 'Ubong Ukpe', 'hello', 'Guest102.90.102.224286674', 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:00:03', 1, 'user', 1),
(4, 'Chat Bot', 'hello', NULL, 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:00:03', 1, 'bot', 1),
(5, 'Ubong Ukpe', 'Ubong Ukpe enters the chat.', '1::Ubsimple', 1, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:00:51', 1, 'admin', 1),
(6, 'Ubong Ukpe', 'hello ubong', '1::Ubsimple', 1, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:01:59', 1, 'admin', 1),
(7, 'System', 'Ubong Ukpe has probably left the conversation due inactivity.', NULL, 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:07:37', 0, 'notice', 2),
(8, 'Ubong Ukpe', 'The chat has been ended due the inactivity, please type a message to restart again.', NULL, 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:08:46', 1, 'notice', 1),
(9, 'Ubong Ukpe', 'Client changed page: https://mytime360.com/', 'Guest102.90.102.224286674', 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:10:28', 0, 'notice', 2),
(10, 'Ubong Ukpe', 'Client changed page: https://mytime360.com/', 'Guest102.90.102.224286674', 0, 1, 0, 0, 0, 0, 0, '1980-05-06 00:00:00', '2025-01-17 00:10:44', 0, 'notice', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lc3_transfer`
--

CREATE TABLE `lc3_transfer` (
  `id` int(10) NOT NULL,
  `convid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fromoid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fromname` varchar(100) DEFAULT NULL,
  `tooid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `toname` varchar(100) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `used` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_urlblacklist`
--

CREATE TABLE `lc3_urlblacklist` (
  `id` int(10) NOT NULL,
  `path` varchar(200) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_user`
--

CREATE TABLE `lc3_user` (
  `id` int(10) NOT NULL,
  `departments` varchar(100) DEFAULT '0',
  `available` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `busy` smallint(1) UNSIGNED NOT NULL DEFAULT 0,
  `hours_array` text DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `whatsappnumber` varchar(255) DEFAULT NULL,
  `pusho_tok` varchar(50) DEFAULT NULL,
  `pusho_key` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` char(64) DEFAULT NULL,
  `idhash` varchar(32) DEFAULT NULL,
  `session` varchar(64) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `picture` varchar(100) NOT NULL DEFAULT '/standard.jpg',
  `aboutme` text DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `invitationmsg` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00',
  `lastactivity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `logins` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `responses` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `files` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `useronlinelist` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `operatorchat` tinyint(1) NOT NULL DEFAULT 0,
  `operatorchatpublic` tinyint(1) NOT NULL DEFAULT 1,
  `operatorlist` tinyint(1) NOT NULL DEFAULT 0,
  `transferc` tinyint(1) NOT NULL DEFAULT 1,
  `chat_latency` smallint(4) UNSIGNED NOT NULL DEFAULT 3000,
  `push_notifications` tinyint(1) NOT NULL DEFAULT 1,
  `sound` tinyint(1) NOT NULL DEFAULT 1,
  `ringing` tinyint(2) NOT NULL DEFAULT 3,
  `alwaysnot` tinyint(1) NOT NULL DEFAULT 0,
  `alwaysonline` tinyint(1) NOT NULL DEFAULT 0,
  `emailnot` tinyint(1) NOT NULL DEFAULT 0,
  `navsidebar` tinyint(1) NOT NULL DEFAULT 1,
  `themecolour` varchar(10) NOT NULL DEFAULT 'blue',
  `access` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `permissions` varchar(512) DEFAULT NULL,
  `forgot` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_user`
--

INSERT INTO `lc3_user` (`id`, `departments`, `available`, `busy`, `hours_array`, `phonenumber`, `whatsappnumber`, `pusho_tok`, `pusho_key`, `username`, `password`, `idhash`, `session`, `email`, `name`, `picture`, `aboutme`, `language`, `invitationmsg`, `time`, `lastactivity`, `hits`, `logins`, `responses`, `files`, `useronlinelist`, `operatorchat`, `operatorchatpublic`, `operatorlist`, `transferc`, `chat_latency`, `push_notifications`, `sound`, `ringing`, `alwaysnot`, `alwaysonline`, `emailnot`, `navsidebar`, `themecolour`, `access`, `permissions`, `forgot`) VALUES
(1, '0', 1, 0, NULL, NULL, NULL, NULL, NULL, 'Ubsimple', '9e666ab8fbaedf8cafc5f3f6f71dc6a35a3d5f752cb397369994ae7c56b85f86', 'dbf2835cf5b4d7128eabb01ee4008c4d', '8umt4bl3c2tbtj1rc3nkjup32j', 'atmonidexz@gmail.com', 'Ubong Ukpe', '/standard.jpg', NULL, NULL, NULL, '2025-01-15 13:53:36', 1737069383, 0, 2, 1, 1, 1, 1, 1, 0, 1, 3000, 1, 1, 3, 0, 0, 0, 1, 'blue', 1, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `lc3_user_stats`
--

CREATE TABLE `lc3_user_stats` (
  `id` int(10) NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `vote` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `support_time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lc3_whatslog`
--

CREATE TABLE `lc3_whatslog` (
  `id` int(10) NOT NULL,
  `guestid` varchar(200) DEFAULT NULL,
  `operatorid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `clientid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) DEFAULT NULL,
  `whatsid` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `itemid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `fromwhere` varchar(255) DEFAULT NULL,
  `ip` char(45) NOT NULL DEFAULT '0',
  `country` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `countrycode` varchar(2) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `usragent` varchar(255) DEFAULT NULL,
  `time` datetime NOT NULL DEFAULT '1980-05-06 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `lc3_whatslog`
--

INSERT INTO `lc3_whatslog` (`id`, `guestid`, `operatorid`, `clientid`, `name`, `whatsid`, `itemid`, `fromwhere`, `ip`, `country`, `city`, `countrycode`, `latitude`, `longitude`, `usragent`, `time`) VALUES
(1, '', 0, 0, 'atmonidexz@gmail.com', 1, 0, '/livechat/operator/', '102.90.82.89', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-15 13:55:04'),
(2, '', 1, 0, 'Ubsimple', 18, 1, '/livechat/operator/index.php?p=widget&amp;sp=edit&amp;ssp=1', '102.90.82.89', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-15 14:05:56'),
(3, '', 1, 0, 'Ubsimple', 77, 1, '/livechat/operator/index.php?p=bot', '102.90.82.89', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-15 14:15:07'),
(4, '', 0, 0, 'atmonidexz@gmail.com', 1, 0, '/livechat/operator/', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:25:28'),
(5, '', 1, 0, 'Ubsimple', 16, 0, '/livechat/operator/index.php?p=settings', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:29:20'),
(6, '', 1, 0, 'Ubsimple', 16, 0, '/livechat/operator/index.php?p=settings', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:30:09'),
(7, '', 1, 0, 'Ubsimple', 16, 0, '/livechat/operator/index.php?p=settings', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:49:15'),
(8, '', 1, 0, 'Ubsimple', 16, 0, '/livechat/operator/index.php?p=settings', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:49:34'),
(9, '', 1, 0, 'Ubsimple', 16, 0, '/livechat/operator/index.php?p=settings', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-16 23:49:50'),
(10, 'Guest102.90.102.224286674', 0, 0, 'Ubong Ukpe', 7, 1, '/livechat/include/chatdata.php?id=1&amp;run=start&amp;lang=en', '102.90.102.224', 'Nigeria', '', 'ng', '10', '8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-17 00:00:03'),
(11, '', 1, 0, 'Ubsimple', 18, 1, '/livechat/operator/index.php?p=widget&amp;sp=edit&amp;ssp=1', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-17 00:04:06'),
(12, '', 1, 0, 'Ubsimple', 18, 1, '/livechat/operator/index.php?p=widget&amp;sp=edit&amp;ssp=1', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-17 00:07:57'),
(13, '', 1, 0, 'Ubsimple', 18, 1, '/livechat/operator/index.php?p=widget&amp;sp=edit&amp;ssp=1', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-17 00:08:26'),
(14, '', 1, 0, 'Ubsimple', 18, 1, '/livechat/operator/index.php?p=widget&amp;sp=edit&amp;ssp=1', '102.90.102.224', 'Disabled', 'Disabled', 'xx', '', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2025-01-17 00:10:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lc3_answers`
--
ALTER TABLE `lc3_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depid` (`department`,`lang`,`fireup`,`msgtype`);

--
-- Indexes for table `lc3_autoproactive`
--
ALTER TABLE `lc3_autoproactive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `path` (`path`);

--
-- Indexes for table `lc3_bot_chatgpt`
--
ALTER TABLE `lc3_bot_chatgpt`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `lc3_bot_chatgpt` ADD FULLTEXT KEY `question_answer` (`question`,`answer`);

--
-- Indexes for table `lc3_bot_question`
--
ALTER TABLE `lc3_bot_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgetids` (`widgetids`,`depid`,`lang`);

--
-- Indexes for table `lc3_buttonstats`
--
ALTER TABLE `lc3_buttonstats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depid` (`depid`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `lc3_chatcustomfields`
--
ALTER TABLE `lc3_chatcustomfields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `convid` (`convid`,`contactid`);

--
-- Indexes for table `lc3_chatsettings`
--
ALTER TABLE `lc3_chatsettings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgetid` (`widgetid`,`template`);

--
-- Indexes for table `lc3_chatwidget`
--
ALTER TABLE `lc3_chatwidget`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depid` (`depid`,`opid`,`lang`);

--
-- Indexes for table `lc3_chat_ai_translations`
--
ALTER TABLE `lc3_chat_ai_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chatid` (`chatid`,`answerid`);

--
-- Indexes for table `lc3_checkstatus`
--
ALTER TABLE `lc3_checkstatus`
  ADD UNIQUE KEY `convid` (`convid`),
  ADD KEY `denied` (`denied`,`hide`,`statusc`,`statuso`);

--
-- Indexes for table `lc3_clientcontact`
--
ALTER TABLE `lc3_clientcontact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_contacts`
--
ALTER TABLE `lc3_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `depid` (`depid`);

--
-- Indexes for table `lc3_contactsreply`
--
ALTER TABLE `lc3_contactsreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contactid` (`contactid`);

--
-- Indexes for table `lc3_departments`
--
ALTER TABLE `lc3_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_files`
--
ALTER TABLE `lc3_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_groupchat`
--
ALTER TABLE `lc3_groupchat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opids` (`opids`);

--
-- Indexes for table `lc3_groupchatmsg`
--
ALTER TABLE `lc3_groupchatmsg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupchatid` (`groupchatid`);

--
-- Indexes for table `lc3_groupchatuser`
--
ALTER TABLE `lc3_groupchatuser`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupchatid` (`groupchatid`);

--
-- Indexes for table `lc3_operatorchat`
--
ALTER TABLE `lc3_operatorchat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_push_notification_devices`
--
ALTER TABLE `lc3_push_notification_devices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`,`ostype`,`token`);

--
-- Indexes for table `lc3_responses`
--
ALTER TABLE `lc3_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_sessions`
--
ALTER TABLE `lc3_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `operatorid` (`operatorid`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `lc3_settings`
--
ALTER TABLE `lc3_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_transcript`
--
ALTER TABLE `lc3_transcript`
  ADD PRIMARY KEY (`id`),
  ADD KEY `convid` (`convid`);

--
-- Indexes for table `lc3_transfer`
--
ALTER TABLE `lc3_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `convid` (`convid`,`tooid`,`used`);

--
-- Indexes for table `lc3_urlblacklist`
--
ALTER TABLE `lc3_urlblacklist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `path` (`path`);

--
-- Indexes for table `lc3_user`
--
ALTER TABLE `lc3_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_user_stats`
--
ALTER TABLE `lc3_user_stats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lc3_whatslog`
--
ALTER TABLE `lc3_whatslog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lc3_answers`
--
ALTER TABLE `lc3_answers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lc3_autoproactive`
--
ALTER TABLE `lc3_autoproactive`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_bot_chatgpt`
--
ALTER TABLE `lc3_bot_chatgpt`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_bot_question`
--
ALTER TABLE `lc3_bot_question`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_buttonstats`
--
ALTER TABLE `lc3_buttonstats`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lc3_chatcustomfields`
--
ALTER TABLE `lc3_chatcustomfields`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_chatsettings`
--
ALTER TABLE `lc3_chatsettings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lc3_chatwidget`
--
ALTER TABLE `lc3_chatwidget`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_chat_ai_translations`
--
ALTER TABLE `lc3_chat_ai_translations`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_clientcontact`
--
ALTER TABLE `lc3_clientcontact`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_contacts`
--
ALTER TABLE `lc3_contacts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_contactsreply`
--
ALTER TABLE `lc3_contactsreply`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_departments`
--
ALTER TABLE `lc3_departments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_files`
--
ALTER TABLE `lc3_files`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_groupchat`
--
ALTER TABLE `lc3_groupchat`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_groupchatmsg`
--
ALTER TABLE `lc3_groupchatmsg`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_groupchatuser`
--
ALTER TABLE `lc3_groupchatuser`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_operatorchat`
--
ALTER TABLE `lc3_operatorchat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_push_notification_devices`
--
ALTER TABLE `lc3_push_notification_devices`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_responses`
--
ALTER TABLE `lc3_responses`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_sessions`
--
ALTER TABLE `lc3_sessions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_settings`
--
ALTER TABLE `lc3_settings`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `lc3_transcript`
--
ALTER TABLE `lc3_transcript`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `lc3_transfer`
--
ALTER TABLE `lc3_transfer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_urlblacklist`
--
ALTER TABLE `lc3_urlblacklist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_user`
--
ALTER TABLE `lc3_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lc3_user_stats`
--
ALTER TABLE `lc3_user_stats`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lc3_whatslog`
--
ALTER TABLE `lc3_whatslog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
