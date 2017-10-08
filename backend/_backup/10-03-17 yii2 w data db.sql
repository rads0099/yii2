-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2017 at 11:34 AM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yii2`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', NULL),
('organizer', '20', 1506795830);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, NULL, NULL, NULL, NULL, NULL),
('create-event', 2, NULL, NULL, NULL, NULL, NULL),
('create-event-team', 2, NULL, NULL, NULL, NULL, NULL),
('create-location', 2, NULL, NULL, NULL, NULL, NULL),
('create-occasion', 2, NULL, NULL, NULL, NULL, NULL),
('create-player', 2, NULL, NULL, NULL, NULL, NULL),
('create-team', 2, NULL, NULL, NULL, NULL, NULL),
('create-venue', 2, NULL, NULL, NULL, NULL, NULL),
('delete-event', 2, NULL, NULL, NULL, NULL, NULL),
('delete-event-team', 2, NULL, NULL, NULL, NULL, NULL),
('delete-location', 2, NULL, NULL, NULL, NULL, NULL),
('delete-occasion', 2, NULL, NULL, NULL, NULL, NULL),
('delete-player', 2, NULL, NULL, NULL, NULL, NULL),
('delete-team', 2, NULL, NULL, NULL, NULL, NULL),
('delete-venue', 2, NULL, NULL, NULL, NULL, NULL),
('organizer', 1, NULL, NULL, NULL, NULL, NULL),
('update-event', 2, NULL, NULL, NULL, NULL, NULL),
('update-event-team', 2, NULL, NULL, NULL, NULL, NULL),
('update-location', 2, NULL, NULL, NULL, NULL, NULL),
('update-occasion', 2, NULL, NULL, NULL, NULL, NULL),
('update-player', 2, NULL, NULL, NULL, NULL, NULL),
('update-team', 2, NULL, NULL, NULL, NULL, NULL),
('update-venue', 2, NULL, NULL, NULL, NULL, NULL),
('view-event', 2, NULL, NULL, NULL, NULL, NULL),
('view-event-team', 2, NULL, NULL, NULL, NULL, NULL),
('view-location', 2, NULL, NULL, NULL, NULL, NULL),
('view-occasion', 2, NULL, NULL, NULL, NULL, NULL),
('view-player', 2, NULL, NULL, NULL, NULL, NULL),
('view-team', 2, NULL, NULL, NULL, NULL, NULL),
('view-venue', 2, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('organizer', 'create-event'),
('organizer', 'create-event-team'),
('organizer', 'create-location'),
('organizer', 'create-occasion'),
('organizer', 'create-player'),
('organizer', 'create-team'),
('organizer', 'create-venue'),
('organizer', 'delete-event'),
('organizer', 'delete-event-team'),
('organizer', 'delete-location'),
('organizer', 'delete-occasion'),
('organizer', 'delete-player'),
('organizer', 'delete-team'),
('organizer', 'delete-venue'),
('admin', 'organizer'),
('organizer', 'update-event'),
('organizer', 'update-event-team'),
('organizer', 'update-location'),
('organizer', 'update-occasion'),
('organizer', 'update-player'),
('organizer', 'update-team'),
('organizer', 'update-venue'),
('organizer', 'view-event'),
('organizer', 'view-event-team'),
('organizer', 'view-location'),
('organizer', 'view-occasion'),
('organizer', 'view-player'),
('organizer', 'view-team'),
('organizer', 'view-venue');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(10) UNSIGNED NOT NULL,
  `occasion_id` tinyint(3) UNSIGNED NOT NULL,
  `location_venue_id` int(10) UNSIGNED NOT NULL,
  `event_type_id` tinyint(3) UNSIGNED NOT NULL,
  `event` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_category_id` tinyint(3) UNSIGNED NOT NULL,
  `event_status_id` tinyint(3) UNSIGNED NOT NULL,
  `match_system_id` tinyint(3) UNSIGNED NOT NULL,
  `sort_order_id` tinyint(3) UNSIGNED NOT NULL,
  `min_team` tinyint(3) UNSIGNED NOT NULL,
  `max_team` tinyint(3) UNSIGNED NOT NULL,
  `champ` int(10) UNSIGNED DEFAULT NULL,
  `first` int(10) UNSIGNED DEFAULT NULL,
  `second` int(10) UNSIGNED DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `occasion_id`, `location_venue_id`, `event_type_id`, `event`, `description`, `event_category_id`, `event_status_id`, `match_system_id`, `sort_order_id`, `min_team`, `max_team`, `champ`, `first`, `second`, `date_start`, `date_end`) VALUES
(1, 1, 1, 1, 'Basketball Men 2017', '', 2, 1, 3, 1, 2, 12, NULL, NULL, NULL, NULL, NULL),
(2, 1, 5, 6, 'Chess Women 2017', '', 3, 1, 3, 1, 2, 12, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_category`
--

CREATE TABLE `event_category` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_category`
--

INSERT INTO `event_category` (`id`, `category`, `description`) VALUES
(1, 'All', NULL),
(2, 'Men', NULL),
(3, 'Women', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_classification`
--

CREATE TABLE `event_classification` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `classification` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_classification`
--

INSERT INTO `event_classification` (`id`, `classification`, `description`) VALUES
(1, 'Academics', NULL),
(2, 'Sports', NULL),
(3, 'Cultural', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_round`
--

CREATE TABLE `event_round` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `round` tinyint(3) UNSIGNED NOT NULL,
  `round_status_id` tinyint(3) UNSIGNED NOT NULL,
  `date_start` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_round`
--

INSERT INTO `event_round` (`id`, `event_id`, `round`, `round_status_id`, `date_start`) VALUES
(1, 1, 1, 1, NULL),
(2, 1, 2, 1, NULL),
(3, 1, 3, 1, NULL),
(4, 2, 1, 1, NULL),
(5, 2, 2, 1, NULL),
(6, 2, 3, 1, NULL),
(7, 2, 4, 1, NULL),
(8, 2, 5, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_round_match`
--

CREATE TABLE `event_round_match` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_team1_round_id` int(10) UNSIGNED NOT NULL,
  `event_team2_round_id` int(10) UNSIGNED NOT NULL,
  `match_status_id` tinyint(3) UNSIGNED NOT NULL,
  `team1_score` tinyint(3) UNSIGNED NOT NULL,
  `team2_score` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_round_match`
--

INSERT INTO `event_round_match` (`id`, `event_team1_round_id`, `event_team2_round_id`, `match_status_id`, `team1_score`, `team2_score`) VALUES
(1, 7, 4, 1, 0, 0),
(2, 10, 1, 1, 0, 0),
(3, 8, 11, 1, 0, 0),
(4, 2, 5, 1, 0, 0),
(5, 9, 3, 1, 0, 0),
(6, 6, 12, 1, 0, 0),
(7, 18, 33, 1, 0, 0),
(8, 13, 23, 1, 0, 0),
(9, 38, 28, 1, 0, 0),
(10, 19, 14, 1, 0, 0),
(11, 39, 34, 1, 0, 0),
(12, 29, 24, 1, 0, 0),
(13, 20, 40, 1, 0, 0),
(14, 30, 15, 1, 0, 0),
(15, 25, 35, 1, 0, 0),
(16, 21, 31, 1, 0, 0),
(17, 26, 41, 1, 0, 0),
(18, 36, 16, 1, 0, 0),
(19, 22, 27, 1, 0, 0),
(20, 37, 32, 1, 0, 0),
(21, 17, 42, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `event_status`
--

CREATE TABLE `event_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_status`
--

INSERT INTO `event_status` (`id`, `status`, `description`) VALUES
(1, 'Waiting', NULL),
(2, 'In Progress', NULL),
(3, 'Finished', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_team`
--

CREATE TABLE `event_team` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `team_event_id` bigint(20) UNSIGNED NOT NULL,
  `event_team_status_id` tinyint(3) UNSIGNED NOT NULL,
  `team_order` tinyint(3) UNSIGNED DEFAULT NULL,
  `total_wins` tinyint(3) UNSIGNED DEFAULT NULL,
  `total_draws` tinyint(3) UNSIGNED DEFAULT NULL,
  `total_loss` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_team`
--

INSERT INTO `event_team` (`id`, `event_id`, `team_event_id`, `event_team_status_id`, `team_order`, `total_wins`, `total_draws`, `total_loss`) VALUES
(1, 1, 26, 1, 3, NULL, NULL, NULL),
(2, 1, 38, 1, 1, NULL, NULL, NULL),
(4, 1, 50, 1, 2, NULL, NULL, NULL),
(24, 1, 14, 2, 4, NULL, NULL, NULL),
(26, 2, 31, 1, 2, NULL, NULL, NULL),
(27, 2, 43, 1, 1, NULL, NULL, NULL),
(28, 2, 55, 1, 5, NULL, NULL, NULL),
(29, 2, 67, 1, 6, NULL, NULL, NULL),
(30, 2, 79, 1, 4, NULL, NULL, NULL),
(31, 2, 19, 2, 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_team_round`
--

CREATE TABLE `event_team_round` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_team_id` int(10) UNSIGNED NOT NULL,
  `event_round_id` int(10) UNSIGNED NOT NULL,
  `match_result_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `remarks` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_team_round`
--

INSERT INTO `event_team_round` (`id`, `event_team_id`, `event_round_id`, `match_result_id`, `remarks`) VALUES
(1, 24, 1, NULL, NULL),
(2, 24, 2, NULL, NULL),
(3, 24, 3, NULL, NULL),
(4, 1, 1, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 1, 3, NULL, NULL),
(7, 2, 1, NULL, NULL),
(8, 2, 2, NULL, NULL),
(9, 2, 3, NULL, NULL),
(10, 4, 1, NULL, NULL),
(11, 4, 2, NULL, NULL),
(12, 4, 3, NULL, NULL),
(13, 26, 4, NULL, NULL),
(14, 26, 5, NULL, NULL),
(15, 26, 6, NULL, NULL),
(16, 26, 7, NULL, NULL),
(17, 26, 8, NULL, NULL),
(18, 27, 4, NULL, NULL),
(19, 27, 5, NULL, NULL),
(20, 27, 6, NULL, NULL),
(21, 27, 7, NULL, NULL),
(22, 27, 8, NULL, NULL),
(23, 28, 4, NULL, NULL),
(24, 28, 5, NULL, NULL),
(25, 28, 6, NULL, NULL),
(26, 28, 7, NULL, NULL),
(27, 28, 8, NULL, NULL),
(28, 29, 4, NULL, NULL),
(29, 29, 5, NULL, NULL),
(30, 29, 6, NULL, NULL),
(31, 29, 7, NULL, NULL),
(32, 29, 8, NULL, NULL),
(33, 30, 4, NULL, NULL),
(34, 30, 5, NULL, NULL),
(35, 30, 6, NULL, NULL),
(36, 30, 7, NULL, NULL),
(37, 30, 8, NULL, NULL),
(38, 31, 4, NULL, NULL),
(39, 31, 5, NULL, NULL),
(40, 31, 6, NULL, NULL),
(41, 31, 7, NULL, NULL),
(42, 31, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_team_status`
--

CREATE TABLE `event_team_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_team_status`
--

INSERT INTO `event_team_status` (`id`, `status`, `description`) VALUES
(1, 'Qualified', NULL),
(2, 'Disqualified', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event_type`
--

CREATE TABLE `event_type` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_classification_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `event_type`
--

INSERT INTO `event_type` (`id`, `type`, `description`, `event_classification_id`) VALUES
(1, 'Basketball', NULL, 2),
(2, 'Volleyball', NULL, 2),
(3, 'Track and Field', NULL, 2),
(4, 'Shotput', NULL, 2),
(5, 'Table Tennis', NULL, 2),
(6, 'Chess', NULL, 2),
(7, 'Scrabble', NULL, 1),
(8, 'Poster Making', NULL, 1),
(9, 'Masining na Pagkukwento', NULL, 1),
(10, 'Cheer Dance', NULL, 3),
(11, 'Solo Singing', NULL, 3),
(12, 'Acoustic', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `gender` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `gender`) VALUES
(2, 'Female'),
(1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `location` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `location`, `address`, `description`) VALUES
(1, 'CCA', 'Angeles City', 'City College of Angeles');

-- --------------------------------------------------------

--
-- Table structure for table `location_venue`
--

CREATE TABLE `location_venue` (
  `id` int(10) UNSIGNED NOT NULL,
  `location_id` smallint(5) UNSIGNED NOT NULL,
  `venue_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `location_venue`
--

INSERT INTO `location_venue` (`id`, `location_id`, `venue_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `match_result`
--

CREATE TABLE `match_result` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `result` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `match_result`
--

INSERT INTO `match_result` (`id`, `result`, `description`) VALUES
(1, 'Win', NULL),
(2, 'Draw', NULL),
(3, 'Loss', NULL),
(4, 'Default', NULL),
(5, 'Disqualified', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `match_status`
--

CREATE TABLE `match_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `match_status`
--

INSERT INTO `match_status` (`id`, `status`, `description`) VALUES
(1, '1', 'Waiting'),
(2, '2', 'In Progress'),
(3, '3', 'Finished');

-- --------------------------------------------------------

--
-- Table structure for table `match_system`
--

CREATE TABLE `match_system` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `system` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `match_system`
--

INSERT INTO `match_system` (`id`, `system`, `description`) VALUES
(1, 'Single Elimination', NULL),
(2, 'Double Elimination', NULL),
(3, 'Round Robin', NULL),
(4, 'Plain Ranking', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1506763813),
('m140506_102106_rbac_init', 1506764292);

-- --------------------------------------------------------

--
-- Table structure for table `occasion`
--

CREATE TABLE `occasion` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `occasion` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `occasion`
--

INSERT INTO `occasion` (`id`, `occasion`, `description`, `date_start`) VALUES
(1, 'CCA Foundation Day 2017', NULL, '2017-09-19');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `order` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order`, `description`) VALUES
(1, 'None', 'None'),
(2, 'Ascending', 'Ascending'),
(3, 'Descending', 'Descending');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_event_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `round_status`
--

CREATE TABLE `round_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `round_status`
--

INSERT INTO `round_status` (`id`, `status`, `description`) VALUES
(1, 'Waiting', NULL),
(2, 'In Progress', NULL),
(3, 'Finished', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sort`
--

CREATE TABLE `sort` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `sort` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sort`
--

INSERT INTO `sort` (`id`, `sort`, `description`) VALUES
(1, 'Random', NULL),
(2, 'Rank', NULL),
(3, 'Champion', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sort_order`
--

CREATE TABLE `sort_order` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `sort_id` tinyint(3) UNSIGNED NOT NULL,
  `order_id` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sort_order`
--

INSERT INTO `sort_order` (`id`, `sort_id`, `order_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 2, 3),
(8, 3, 2),
(9, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(10) UNSIGNED NOT NULL,
  `team` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `team_status_id` tinyint(3) UNSIGNED NOT NULL,
  `champ` tinyint(3) UNSIGNED NOT NULL,
  `first` tinyint(3) UNSIGNED NOT NULL,
  `second` tinyint(3) UNSIGNED NOT NULL,
  `wins` smallint(5) UNSIGNED NOT NULL,
  `draws` smallint(5) UNSIGNED NOT NULL,
  `losses` smallint(5) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED DEFAULT NULL,
  `since` year(4) NOT NULL,
  `last_played` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `team`, `team_status_id`, `champ`, `first`, `second`, `wins`, `draws`, `losses`, `rating`, `since`, `last_played`) VALUES
(0, 'Bye', 0, 0, 0, 0, 0, 0, 0, NULL, 0000, NULL),
(1, 'Team 1', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(2, 'Team 2', 0, 0, 0, 0, 0, 0, 0, 0, 2017, NULL),
(3, 'Team 3', 0, 0, 0, 0, 0, 0, 0, 0, 2017, NULL),
(4, 'Team 4', 0, 0, 0, 0, 0, 0, 0, 0, 2017, NULL),
(5, 'Team 5', 0, 0, 0, 0, 0, 0, 0, 0, 2017, NULL),
(6, 'Team 6', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(7, 'Team 7', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(8, 'Team 8', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(9, 'Team 9', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(10, 'Team 10', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(11, 'Team 11', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL),
(12, 'Team 12', 0, 0, 0, 0, 0, 0, 0, NULL, 2017, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_event`
--

CREATE TABLE `team_event` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `event_type_id` tinyint(3) UNSIGNED NOT NULL,
  `team_status_id` tinyint(3) UNSIGNED NOT NULL,
  `champ` tinyint(3) UNSIGNED NOT NULL,
  `first` tinyint(3) UNSIGNED NOT NULL,
  `second` tinyint(3) UNSIGNED NOT NULL,
  `wins` smallint(5) UNSIGNED NOT NULL,
  `draws` smallint(5) UNSIGNED NOT NULL,
  `losses` smallint(5) UNSIGNED NOT NULL,
  `rating` smallint(5) UNSIGNED DEFAULT NULL,
  `last_played` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team_event`
--

INSERT INTO `team_event` (`id`, `team_id`, `event_type_id`, `team_status_id`, `champ`, `first`, `second`, `wins`, `draws`, `losses`, `rating`, `last_played`) VALUES
(14, 0, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(15, 0, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(16, 0, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(17, 0, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(18, 0, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(19, 0, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(20, 0, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(21, 0, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(22, 0, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(23, 0, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(24, 0, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(25, 0, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(26, 1, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(27, 1, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(28, 1, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(29, 1, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(30, 1, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(31, 1, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(32, 1, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(33, 1, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(34, 1, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(35, 1, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(36, 1, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(37, 1, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(38, 2, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(39, 2, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(40, 2, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(41, 2, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(42, 2, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(43, 2, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(44, 2, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(45, 2, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(46, 2, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(47, 2, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(48, 2, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(49, 2, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(50, 3, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(51, 3, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(52, 3, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(53, 3, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(54, 3, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(55, 3, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(56, 3, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(57, 3, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(58, 3, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(59, 3, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(60, 3, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(61, 3, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(62, 4, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(63, 4, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(64, 4, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(65, 4, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(66, 4, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(67, 4, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(68, 4, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(69, 4, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(70, 4, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(71, 4, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(72, 4, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(73, 4, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(74, 5, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(75, 5, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(76, 5, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(77, 5, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(78, 5, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(79, 5, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(80, 5, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(81, 5, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(82, 5, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(83, 5, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(84, 5, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(85, 5, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(86, 6, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(87, 6, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(88, 6, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(89, 6, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(90, 6, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(91, 6, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(92, 6, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(93, 6, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(94, 6, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(95, 6, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(96, 6, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(97, 6, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(98, 7, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(99, 7, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(100, 7, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(101, 7, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(102, 7, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(103, 7, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(104, 7, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(105, 7, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(106, 7, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(107, 7, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(108, 7, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(109, 7, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(110, 8, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(111, 8, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(112, 8, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(113, 8, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(114, 8, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(115, 8, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(116, 8, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(117, 8, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(118, 8, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(119, 8, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(120, 8, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(121, 8, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(122, 9, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(123, 9, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(124, 9, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(125, 9, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(126, 9, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(127, 9, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(128, 9, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(129, 9, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(130, 9, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(131, 9, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(132, 9, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(133, 9, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(134, 10, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(135, 10, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(136, 10, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(137, 10, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(138, 10, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(139, 10, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(140, 10, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(141, 10, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(142, 10, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(143, 10, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(144, 10, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(145, 10, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(146, 11, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(147, 11, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(148, 11, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(149, 11, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(150, 11, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(151, 11, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(152, 11, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(153, 11, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(154, 11, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(155, 11, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(156, 11, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(157, 11, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(158, 12, 1, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(159, 12, 2, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(160, 12, 3, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(161, 12, 4, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(162, 12, 5, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(163, 12, 6, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(164, 12, 7, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(165, 12, 8, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(166, 12, 9, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(167, 12, 10, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(168, 12, 11, 1, 0, 0, 0, 0, 0, 0, NULL, NULL),
(169, 12, 12, 1, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_status`
--

CREATE TABLE `team_status` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `team_status`
--

INSERT INTO `team_status` (`id`, `status`, `description`) VALUES
(0, 'New', NULL),
(1, 'Active', NULL),
(2, 'Inactive', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin123', 'jCJziKTRWckwNV9KGPGK8VSxkqjtrgae', '$2y$13$E9niAnf78XfuDwuYbihw3OlgCbY1.FE1s6Zk9ZYdrzGsaOWAEM436', NULL, 'admin@admin.com', 10, 1501224956, 1501224956),
(2, 'admin', 'tzT8wGoAIjbk7QnaKNnW3zOz5I-S0wLN', '$2y$13$mOMSYt.PpPkSuCcrjSmQWeMh6UUrDM4/86durp1vJ8TAygttOJHiG', NULL, 'admin123@admin.com', 10, 1501224969, 1501224969),
(3, 'jakezyrus', 'VrcK7070w7pNThP2ULofhoQj87eD3nvS', '$2y$13$G/vX6n9yRei89p9xfe3rYuzaHv5V0GJj6fkTtn1SFfNZL23.GNv8O', NULL, 'jakezyrus@abs.com', 10, 1501225046, 1501225046),
(4, 'test', 'vr927efYfN8CZv9GcAKC0RRnq1h1ppzr', '$2y$13$P6ze9LV0.SsMO2t3oujM6OXAqJgRQeMjQV3N/WBx6TaHDN.qaF6TO', NULL, 'test@test.com', 10, 1506768570, 1506768570),
(20, 'org123', 'A07qcgbyUJIQ7_1TfSQfERa_Z9TOhCq9', '$2y$13$/U2uEKUkvY3wak8UUKgY5.5JB9jvnmOGaHFVnoWYRiil7SIhHjdMq', NULL, 'org@org.com', 10, 1506795830, 1506795830);

-- --------------------------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE `venue` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `venue` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `venue`, `description`) VALUES
(1, 'Gymnasium', NULL),
(2, 'Library', NULL),
(3, 'Lobby', NULL),
(4, 'Student Center', NULL),
(5, 'Classroom', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indexes for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indexes for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indexes for table `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_E_occasion_id` (`occasion_id`),
  ADD KEY `fk_location_venue_id` (`location_venue_id`),
  ADD KEY `fk_E_event_type_id` (`event_type_id`),
  ADD KEY `fk_event_category_id` (`event_category_id`),
  ADD KEY `fk_event_status_id` (`event_status_id`),
  ADD KEY `fk_match_system_id` (`match_system_id`),
  ADD KEY `fk_sort_order_id` (`sort_order_id`);

--
-- Indexes for table `event_category`
--
ALTER TABLE `event_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category` (`category`);

--
-- Indexes for table `event_classification`
--
ALTER TABLE `event_classification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classification` (`classification`);

--
-- Indexes for table `event_round`
--
ALTER TABLE `event_round`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `event_id_many_round` (`event_id`,`round`),
  ADD KEY `fk_round_status_id` (`round_status_id`);

--
-- Indexes for table `event_round_match`
--
ALTER TABLE `event_round_match`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_event_team1_round_id` (`event_team1_round_id`),
  ADD KEY `fk_event_team2_round_id` (`event_team2_round_id`),
  ADD KEY `fk_match_status_id` (`match_status_id`);

--
-- Indexes for table `event_status`
--
ALTER TABLE `event_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `event_team`
--
ALTER TABLE `event_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_one_event_id_many_team_id` (`event_id`,`team_event_id`),
  ADD KEY `fk_ET_team_event_id` (`team_event_id`),
  ADD KEY `fk_event_team_status_id` (`event_team_status_id`);

--
-- Indexes for table `event_team_round`
--
ALTER TABLE `event_team_round`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fk_one_event_team_id_many_round_id` (`event_team_id`,`event_round_id`),
  ADD KEY `fk_event_round_id` (`event_round_id`),
  ADD KEY `fk_match_result_id` (`match_result_id`);

--
-- Indexes for table `event_team_status`
--
ALTER TABLE `event_team_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `event_type`
--
ALTER TABLE `event_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `type` (`type`),
  ADD KEY `fk_event_classification_id` (`event_classification_id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gender` (`gender`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `location` (`location`);

--
-- Indexes for table `location_venue`
--
ALTER TABLE `location_venue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_LV_occasion_id` (`location_id`),
  ADD KEY `fk_LV_location_id` (`venue_id`);

--
-- Indexes for table `match_result`
--
ALTER TABLE `match_result`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `result` (`result`);

--
-- Indexes for table `match_status`
--
ALTER TABLE `match_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `match_system`
--
ALTER TABLE `match_system`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system` (`system`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `occasion`
--
ALTER TABLE `occasion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `occasion` (`occasion`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order` (`order`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_event_id` (`team_event_id`),
  ADD KEY `fk_gender_id` (`gender_id`);

--
-- Indexes for table `round_status`
--
ALTER TABLE `round_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `sort`
--
ALTER TABLE `sort`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sort` (`sort`);

--
-- Indexes for table `sort_order`
--
ALTER TABLE `sort_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sort_id` (`sort_id`),
  ADD KEY `fk_order_id` (`order_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team` (`team`),
  ADD KEY `fk_team_status_id` (`team_status_id`);

--
-- Indexes for table `team_event`
--
ALTER TABLE `team_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_TE_team_id` (`team_id`),
  ADD KEY `fk_TE_team_status_id` (`team_status_id`),
  ADD KEY `fk_TE_event_type_id` (`event_type_id`);

--
-- Indexes for table `team_status`
--
ALTER TABLE `team_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `status` (`status`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`);

--
-- Indexes for table `venue`
--
ALTER TABLE `venue`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `event_category`
--
ALTER TABLE `event_category`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `event_classification`
--
ALTER TABLE `event_classification`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `event_round`
--
ALTER TABLE `event_round`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `event_round_match`
--
ALTER TABLE `event_round_match`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `event_status`
--
ALTER TABLE `event_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `event_team`
--
ALTER TABLE `event_team`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `event_team_round`
--
ALTER TABLE `event_team_round`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `event_team_status`
--
ALTER TABLE `event_team_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `event_type`
--
ALTER TABLE `event_type`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `location_venue`
--
ALTER TABLE `location_venue`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `match_result`
--
ALTER TABLE `match_result`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `match_status`
--
ALTER TABLE `match_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `match_system`
--
ALTER TABLE `match_system`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `occasion`
--
ALTER TABLE `occasion`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `round_status`
--
ALTER TABLE `round_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sort`
--
ALTER TABLE `sort`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `sort_order`
--
ALTER TABLE `sort_order`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `team_event`
--
ALTER TABLE `team_event`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `team_status`
--
ALTER TABLE `team_status`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `venue`
--
ALTER TABLE `venue`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_E_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_E_occasion_id` FOREIGN KEY (`occasion_id`) REFERENCES `occasion` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_category_id` FOREIGN KEY (`event_category_id`) REFERENCES `event_category` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_status_id` FOREIGN KEY (`event_status_id`) REFERENCES `event_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_location_venue_id` FOREIGN KEY (`location_venue_id`) REFERENCES `location_venue` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_match_system_id` FOREIGN KEY (`match_system_id`) REFERENCES `match_system` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sort_order_id` FOREIGN KEY (`sort_order_id`) REFERENCES `sort_order` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_round`
--
ALTER TABLE `event_round`
  ADD CONSTRAINT `fk_ER_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_round_status_id` FOREIGN KEY (`round_status_id`) REFERENCES `round_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_round_match`
--
ALTER TABLE `event_round_match`
  ADD CONSTRAINT `fk_event_team1_round_id` FOREIGN KEY (`event_team1_round_id`) REFERENCES `event_team_round` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_team2_round_id` FOREIGN KEY (`event_team2_round_id`) REFERENCES `event_team_round` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_match_status_id` FOREIGN KEY (`match_status_id`) REFERENCES `match_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_team`
--
ALTER TABLE `event_team`
  ADD CONSTRAINT `fk_ET_team_event_id` FOREIGN KEY (`team_event_id`) REFERENCES `team_event` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_team_status_id` FOREIGN KEY (`event_team_status_id`) REFERENCES `event_team_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_team_round`
--
ALTER TABLE `event_team_round`
  ADD CONSTRAINT `fk_event_round_id` FOREIGN KEY (`event_round_id`) REFERENCES `event_round` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_event_team_id` FOREIGN KEY (`event_team_id`) REFERENCES `event_team` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_match_result_id` FOREIGN KEY (`match_result_id`) REFERENCES `match_result` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_type`
--
ALTER TABLE `event_type`
  ADD CONSTRAINT `fk_event_classification_id` FOREIGN KEY (`event_classification_id`) REFERENCES `event_classification` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `location_venue`
--
ALTER TABLE `location_venue`
  ADD CONSTRAINT `fk_LV_location_id` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_LV_occasion_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team_event_id` FOREIGN KEY (`team_event_id`) REFERENCES `team_event` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `sort_order`
--
ALTER TABLE `sort_order`
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sort_id` FOREIGN KEY (`sort_id`) REFERENCES `sort` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team_status_id` FOREIGN KEY (`team_status_id`) REFERENCES `team_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `team_event`
--
ALTER TABLE `team_event`
  ADD CONSTRAINT `fk_TE_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TE_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_TE_team_status_id` FOREIGN KEY (`team_status_id`) REFERENCES `team_status` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
