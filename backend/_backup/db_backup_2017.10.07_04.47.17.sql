-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `auth_assignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_item_child`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `auth_rule`
-- -------------------------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event`
-- -------------------------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `occasion_id` tinyint(3) unsigned NOT NULL,
  `location_venue_id` int(10) unsigned NOT NULL,
  `event_type_id` tinyint(3) unsigned NOT NULL,
  `event` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_category_id` tinyint(3) unsigned NOT NULL,
  `event_status_id` tinyint(3) unsigned NOT NULL,
  `match_system_id` tinyint(3) unsigned NOT NULL,
  `sort_order_id` tinyint(3) unsigned NOT NULL,
  `min_team` tinyint(3) unsigned NOT NULL,
  `max_team` tinyint(3) unsigned NOT NULL,
  `champ` int(10) unsigned DEFAULT NULL,
  `first` int(10) unsigned DEFAULT NULL,
  `second` int(10) unsigned DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_E_occasion_id` (`occasion_id`),
  KEY `fk_location_venue_id` (`location_venue_id`),
  KEY `fk_E_event_type_id` (`event_type_id`),
  KEY `fk_event_category_id` (`event_category_id`),
  KEY `fk_event_status_id` (`event_status_id`),
  KEY `fk_match_system_id` (`match_system_id`),
  KEY `fk_sort_order_id` (`sort_order_id`),
  CONSTRAINT `fk_E_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_E_occasion_id` FOREIGN KEY (`occasion_id`) REFERENCES `occasion` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_category_id` FOREIGN KEY (`event_category_id`) REFERENCES `event_category` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_status_id` FOREIGN KEY (`event_status_id`) REFERENCES `event_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_location_venue_id` FOREIGN KEY (`location_venue_id`) REFERENCES `location_venue` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_match_system_id` FOREIGN KEY (`match_system_id`) REFERENCES `match_system` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sort_order_id` FOREIGN KEY (`sort_order_id`) REFERENCES `sort_order` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_category`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_category`;
CREATE TABLE IF NOT EXISTS `event_category` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_classification`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_classification`;
CREATE TABLE IF NOT EXISTS `event_classification` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `classification` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `classification` (`classification`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_round`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_round`;
CREATE TABLE IF NOT EXISTS `event_round` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `round` tinyint(3) unsigned NOT NULL,
  `round_status_id` tinyint(3) unsigned NOT NULL,
  `date_start` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `event_id_many_round` (`event_id`,`round`),
  KEY `fk_round_status_id` (`round_status_id`),
  CONSTRAINT `fk_ER_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_round_status_id` FOREIGN KEY (`round_status_id`) REFERENCES `round_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_round_match`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_round_match`;
CREATE TABLE IF NOT EXISTS `event_round_match` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_team1_round_id` int(10) unsigned NOT NULL,
  `event_team2_round_id` int(10) unsigned NOT NULL,
  `match_status_id` tinyint(3) unsigned NOT NULL,
  `team1_score` tinyint(3) unsigned NOT NULL,
  `team2_score` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_event_team1_round_id` (`event_team1_round_id`),
  KEY `fk_event_team2_round_id` (`event_team2_round_id`),
  KEY `fk_match_status_id` (`match_status_id`),
  CONSTRAINT `fk_event_team1_round_id` FOREIGN KEY (`event_team1_round_id`) REFERENCES `event_team_round` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_team2_round_id` FOREIGN KEY (`event_team2_round_id`) REFERENCES `event_team_round` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_match_status_id` FOREIGN KEY (`match_status_id`) REFERENCES `match_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_status`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_status`;
CREATE TABLE IF NOT EXISTS `event_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_team`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_team`;
CREATE TABLE IF NOT EXISTS `event_team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `team_event_id` bigint(20) unsigned NOT NULL,
  `event_team_status_id` tinyint(3) unsigned NOT NULL,
  `team_order` tinyint(3) unsigned DEFAULT NULL,
  `total_wins` tinyint(3) unsigned DEFAULT NULL,
  `total_draws` tinyint(3) unsigned DEFAULT NULL,
  `total_loss` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_one_event_id_many_team_id` (`event_id`,`team_event_id`),
  KEY `fk_ET_team_event_id` (`team_event_id`),
  KEY `fk_event_team_status_id` (`event_team_status_id`),
  CONSTRAINT `fk_ET_team_event_id` FOREIGN KEY (`team_event_id`) REFERENCES `team_event` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_id` FOREIGN KEY (`event_id`) REFERENCES `event` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_team_status_id` FOREIGN KEY (`event_team_status_id`) REFERENCES `event_team_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_team_round`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_team_round`;
CREATE TABLE IF NOT EXISTS `event_team_round` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_team_id` int(10) unsigned NOT NULL,
  `event_round_id` int(10) unsigned NOT NULL,
  `match_result_id` tinyint(3) unsigned DEFAULT NULL,
  `remarks` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_one_event_team_id_many_round_id` (`event_team_id`,`event_round_id`),
  KEY `fk_event_round_id` (`event_round_id`),
  KEY `fk_match_result_id` (`match_result_id`),
  CONSTRAINT `fk_event_round_id` FOREIGN KEY (`event_round_id`) REFERENCES `event_round` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_event_team_id` FOREIGN KEY (`event_team_id`) REFERENCES `event_team` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_match_result_id` FOREIGN KEY (`match_result_id`) REFERENCES `match_result` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_team_status`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_team_status`;
CREATE TABLE IF NOT EXISTS `event_team_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `event_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `event_type`;
CREATE TABLE IF NOT EXISTS `event_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_classification_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`),
  KEY `fk_event_classification_id` (`event_classification_id`),
  CONSTRAINT `fk_event_classification_id` FOREIGN KEY (`event_classification_id`) REFERENCES `event_classification` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `gender`
-- -------------------------------------------
DROP TABLE IF EXISTS `gender`;
CREATE TABLE IF NOT EXISTS `gender` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `gender` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender` (`gender`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `location`
-- -------------------------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE IF NOT EXISTS `location` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location` (`location`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `location_venue`
-- -------------------------------------------
DROP TABLE IF EXISTS `location_venue`;
CREATE TABLE IF NOT EXISTS `location_venue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` smallint(5) unsigned NOT NULL,
  `venue_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_LV_occasion_id` (`location_id`),
  KEY `fk_LV_location_id` (`venue_id`),
  CONSTRAINT `fk_LV_location_id` FOREIGN KEY (`venue_id`) REFERENCES `venue` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_LV_occasion_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `match_result`
-- -------------------------------------------
DROP TABLE IF EXISTS `match_result`;
CREATE TABLE IF NOT EXISTS `match_result` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `result` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `result` (`result`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `match_status`
-- -------------------------------------------
DROP TABLE IF EXISTS `match_status`;
CREATE TABLE IF NOT EXISTS `match_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `match_system`
-- -------------------------------------------
DROP TABLE IF EXISTS `match_system`;
CREATE TABLE IF NOT EXISTS `match_system` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `system` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system` (`system`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `occasion`
-- -------------------------------------------
DROP TABLE IF EXISTS `occasion`;
CREATE TABLE IF NOT EXISTS `occasion` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `occasion` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_start` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `occasion` (`occasion`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `order`
-- -------------------------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `order` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order` (`order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `player`
-- -------------------------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_event_id` bigint(20) unsigned NOT NULL,
  `gender_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_team_event_id` (`team_event_id`),
  KEY `fk_gender_id` (`gender_id`),
  CONSTRAINT `fk_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_team_event_id` FOREIGN KEY (`team_event_id`) REFERENCES `team_event` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `round_status`
-- -------------------------------------------
DROP TABLE IF EXISTS `round_status`;
CREATE TABLE IF NOT EXISTS `round_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `sort`
-- -------------------------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE IF NOT EXISTS `sort` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `sort` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sort` (`sort`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `sort_order`
-- -------------------------------------------
DROP TABLE IF EXISTS `sort_order`;
CREATE TABLE IF NOT EXISTS `sort_order` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `sort_id` tinyint(3) unsigned NOT NULL,
  `order_id` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sort_id` (`sort_id`),
  KEY `fk_order_id` (`order_id`),
  CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_sort_id` FOREIGN KEY (`sort_id`) REFERENCES `sort` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `team`
-- -------------------------------------------
DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `team` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `team_status_id` tinyint(3) unsigned NOT NULL,
  `champ` tinyint(3) unsigned NOT NULL,
  `first` tinyint(3) unsigned NOT NULL,
  `second` tinyint(3) unsigned NOT NULL,
  `wins` smallint(5) unsigned NOT NULL,
  `draws` smallint(5) unsigned NOT NULL,
  `losses` smallint(5) unsigned NOT NULL,
  `rating` smallint(5) unsigned DEFAULT NULL,
  `since` year(4) NOT NULL,
  `last_played` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team` (`team`),
  KEY `fk_team_status_id` (`team_status_id`),
  CONSTRAINT `fk_team_status_id` FOREIGN KEY (`team_status_id`) REFERENCES `team_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `team_event`
-- -------------------------------------------
DROP TABLE IF EXISTS `team_event`;
CREATE TABLE IF NOT EXISTS `team_event` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` int(10) unsigned NOT NULL,
  `event_type_id` tinyint(3) unsigned NOT NULL,
  `team_status_id` tinyint(3) unsigned NOT NULL,
  `champ` tinyint(3) unsigned NOT NULL,
  `first` tinyint(3) unsigned NOT NULL,
  `second` tinyint(3) unsigned NOT NULL,
  `wins` smallint(5) unsigned NOT NULL,
  `draws` smallint(5) unsigned NOT NULL,
  `losses` smallint(5) unsigned NOT NULL,
  `rating` smallint(5) unsigned DEFAULT NULL,
  `last_played` year(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TE_team_id` (`team_id`),
  KEY `fk_TE_team_status_id` (`team_status_id`),
  KEY `fk_TE_event_type_id` (`event_type_id`),
  CONSTRAINT `fk_TE_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TE_team_id` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_TE_team_status_id` FOREIGN KEY (`team_status_id`) REFERENCES `team_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `team_status`
-- -------------------------------------------
DROP TABLE IF EXISTS `team_status`;
CREATE TABLE IF NOT EXISTS `team_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `user`
-- -------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE `venue`
-- -------------------------------------------
DROP TABLE IF EXISTS `venue`;
CREATE TABLE IF NOT EXISTS `venue` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `venue` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -------------------------------------------
-- TABLE DATA auth_assignment
-- -------------------------------------------
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('admin','1',NULL);
INSERT INTO `auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('organizer','20','1506795830');



-- -------------------------------------------
-- TABLE DATA auth_item
-- -------------------------------------------
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin','1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-event','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-event-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-location','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-occasion','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-player','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('create-venue','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-event','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-event-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-location','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-occasion','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-player','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('delete-venue','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('organizer','1',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-event','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-event-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-location','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-occasion','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-player','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('update-venue','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-event','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-event-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-location','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-occasion','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-player','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-team','2',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('view-venue','2',NULL,NULL,NULL,NULL,NULL);



-- -------------------------------------------
-- TABLE DATA auth_item_child
-- -------------------------------------------
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-event');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-event-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-location');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-occasion');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-player');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','create-venue');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-event');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-event-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-location');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-occasion');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-player');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','delete-venue');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('admin','organizer');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-event');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-event-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-location');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-occasion');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-player');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','update-venue');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-event');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-event-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-location');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-occasion');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-player');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-team');
INSERT INTO `auth_item_child` (`parent`,`child`) VALUES
('organizer','view-venue');



-- -------------------------------------------
-- TABLE DATA event
-- -------------------------------------------
INSERT INTO `event` (`id`,`occasion_id`,`location_venue_id`,`event_type_id`,`event`,`description`,`event_category_id`,`event_status_id`,`match_system_id`,`sort_order_id`,`min_team`,`max_team`,`champ`,`first`,`second`,`date_start`,`date_end`) VALUES
('1','1','1','1','Basketball Men 2017',NULL,'2','1','3','1','2','12',NULL,NULL,NULL,NULL,NULL);
INSERT INTO `event` (`id`,`occasion_id`,`location_venue_id`,`event_type_id`,`event`,`description`,`event_category_id`,`event_status_id`,`match_system_id`,`sort_order_id`,`min_team`,`max_team`,`champ`,`first`,`second`,`date_start`,`date_end`) VALUES
('2','1','5','6','Chess Women 2017',NULL,'3','1','3','1','2','12',NULL,NULL,NULL,NULL,NULL);



-- -------------------------------------------
-- TABLE DATA event_category
-- -------------------------------------------
INSERT INTO `event_category` (`id`,`category`,`description`) VALUES
('1','All',NULL);
INSERT INTO `event_category` (`id`,`category`,`description`) VALUES
('2','Men',NULL);
INSERT INTO `event_category` (`id`,`category`,`description`) VALUES
('3','Women',NULL);



-- -------------------------------------------
-- TABLE DATA event_classification
-- -------------------------------------------
INSERT INTO `event_classification` (`id`,`classification`,`description`) VALUES
('1','Academics',NULL);
INSERT INTO `event_classification` (`id`,`classification`,`description`) VALUES
('2','Sports',NULL);
INSERT INTO `event_classification` (`id`,`classification`,`description`) VALUES
('3','Cultural',NULL);



-- -------------------------------------------
-- TABLE DATA event_round
-- -------------------------------------------
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('1','1','1','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('2','1','2','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('3','1','3','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('4','2','1','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('5','2','2','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('6','2','3','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('7','2','4','1',NULL);
INSERT INTO `event_round` (`id`,`event_id`,`round`,`round_status_id`,`date_start`) VALUES
('8','2','5','1',NULL);



-- -------------------------------------------
-- TABLE DATA event_round_match
-- -------------------------------------------
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('1','7','4','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('2','10','1','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('3','8','11','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('4','2','5','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('5','9','3','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('6','6','12','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('7','18','33','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('8','13','23','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('9','38','28','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('10','19','14','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('11','39','34','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('12','29','24','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('13','20','40','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('14','30','15','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('15','25','35','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('16','21','31','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('17','26','41','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('18','36','16','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('19','22','27','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('20','37','32','1','0','0');
INSERT INTO `event_round_match` (`id`,`event_team1_round_id`,`event_team2_round_id`,`match_status_id`,`team1_score`,`team2_score`) VALUES
('21','17','42','1','0','0');



-- -------------------------------------------
-- TABLE DATA event_status
-- -------------------------------------------
INSERT INTO `event_status` (`id`,`status`,`description`) VALUES
('1','Waiting',NULL);
INSERT INTO `event_status` (`id`,`status`,`description`) VALUES
('2','In Progress',NULL);
INSERT INTO `event_status` (`id`,`status`,`description`) VALUES
('3','Finished',NULL);



-- -------------------------------------------
-- TABLE DATA event_team
-- -------------------------------------------
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('1','1','26','1','3',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('2','1','38','1','1',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('4','1','50','1','2',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('24','1','14','2','4',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('26','2','31','1','2',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('27','2','43','1','1',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('28','2','55','1','5',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('29','2','67','1','6',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('30','2','79','1','4',NULL,NULL,NULL);
INSERT INTO `event_team` (`id`,`event_id`,`team_event_id`,`event_team_status_id`,`team_order`,`total_wins`,`total_draws`,`total_loss`) VALUES
('31','2','19','2','3',NULL,NULL,NULL);



-- -------------------------------------------
-- TABLE DATA event_team_round
-- -------------------------------------------
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('1','24','1',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('2','24','2',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('3','24','3',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('4','1','1',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('5','1','2',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('6','1','3',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('7','2','1',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('8','2','2',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('9','2','3',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('10','4','1',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('11','4','2',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('12','4','3',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('13','26','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('14','26','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('15','26','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('16','26','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('17','26','8',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('18','27','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('19','27','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('20','27','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('21','27','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('22','27','8',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('23','28','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('24','28','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('25','28','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('26','28','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('27','28','8',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('28','29','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('29','29','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('30','29','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('31','29','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('32','29','8',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('33','30','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('34','30','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('35','30','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('36','30','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('37','30','8',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('38','31','4',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('39','31','5',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('40','31','6',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('41','31','7',NULL,NULL);
INSERT INTO `event_team_round` (`id`,`event_team_id`,`event_round_id`,`match_result_id`,`remarks`) VALUES
('42','31','8',NULL,NULL);



-- -------------------------------------------
-- TABLE DATA event_team_status
-- -------------------------------------------
INSERT INTO `event_team_status` (`id`,`status`,`description`) VALUES
('1','Qualified',NULL);
INSERT INTO `event_team_status` (`id`,`status`,`description`) VALUES
('2','Disqualified',NULL);



-- -------------------------------------------
-- TABLE DATA event_type
-- -------------------------------------------
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('1','Basketball',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('2','Volleyball',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('3','Track and Field',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('4','Shotput',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('5','Table Tennis',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('6','Chess',NULL,'2');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('7','Scrabble',NULL,'1');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('8','Poster Making',NULL,'1');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('9','Masining na Pagkukwento',NULL,'1');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('10','Cheer Dance',NULL,'3');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('11','Solo Singing',NULL,'3');
INSERT INTO `event_type` (`id`,`type`,`description`,`event_classification_id`) VALUES
('12','Acoustic',NULL,'3');



-- -------------------------------------------
-- TABLE DATA gender
-- -------------------------------------------
INSERT INTO `gender` (`id`,`gender`) VALUES
('2','Female');
INSERT INTO `gender` (`id`,`gender`) VALUES
('1','Male');



-- -------------------------------------------
-- TABLE DATA location
-- -------------------------------------------
INSERT INTO `location` (`id`,`location`,`address`,`description`) VALUES
('1','CCA','Angeles City','City College of Angeles');



-- -------------------------------------------
-- TABLE DATA location_venue
-- -------------------------------------------
INSERT INTO `location_venue` (`id`,`location_id`,`venue_id`) VALUES
('1','1','1');
INSERT INTO `location_venue` (`id`,`location_id`,`venue_id`) VALUES
('2','1','2');
INSERT INTO `location_venue` (`id`,`location_id`,`venue_id`) VALUES
('3','1','3');
INSERT INTO `location_venue` (`id`,`location_id`,`venue_id`) VALUES
('4','1','4');
INSERT INTO `location_venue` (`id`,`location_id`,`venue_id`) VALUES
('5','1','5');



-- -------------------------------------------
-- TABLE DATA match_result
-- -------------------------------------------
INSERT INTO `match_result` (`id`,`result`,`description`) VALUES
('1','Win',NULL);
INSERT INTO `match_result` (`id`,`result`,`description`) VALUES
('2','Draw',NULL);
INSERT INTO `match_result` (`id`,`result`,`description`) VALUES
('3','Loss',NULL);
INSERT INTO `match_result` (`id`,`result`,`description`) VALUES
('4','Default',NULL);
INSERT INTO `match_result` (`id`,`result`,`description`) VALUES
('5','Disqualified',NULL);



-- -------------------------------------------
-- TABLE DATA match_status
-- -------------------------------------------
INSERT INTO `match_status` (`id`,`status`,`description`) VALUES
('1','1','Waiting');
INSERT INTO `match_status` (`id`,`status`,`description`) VALUES
('2','2','In Progress');
INSERT INTO `match_status` (`id`,`status`,`description`) VALUES
('3','3','Finished');



-- -------------------------------------------
-- TABLE DATA match_system
-- -------------------------------------------
INSERT INTO `match_system` (`id`,`system`,`description`) VALUES
('1','Single Elimination',NULL);
INSERT INTO `match_system` (`id`,`system`,`description`) VALUES
('2','Double Elimination',NULL);
INSERT INTO `match_system` (`id`,`system`,`description`) VALUES
('3','Round Robin',NULL);
INSERT INTO `match_system` (`id`,`system`,`description`) VALUES
('4','Plain Ranking',NULL);



-- -------------------------------------------
-- TABLE DATA migration
-- -------------------------------------------
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1506763813');
INSERT INTO `migration` (`version`,`apply_time`) VALUES
('m140506_102106_rbac_init','1506764292');



-- -------------------------------------------
-- TABLE DATA occasion
-- -------------------------------------------
INSERT INTO `occasion` (`id`,`occasion`,`description`,`date_start`) VALUES
('1','CCA Foundation Day 2017',NULL,'2017-09-19');



-- -------------------------------------------
-- TABLE DATA order
-- -------------------------------------------
INSERT INTO `order` (`id`,`order`,`description`) VALUES
('1','None','None');
INSERT INTO `order` (`id`,`order`,`description`) VALUES
('2','Ascending','Ascending');
INSERT INTO `order` (`id`,`order`,`description`) VALUES
('3','Descending','Descending');



-- -------------------------------------------
-- TABLE DATA round_status
-- -------------------------------------------
INSERT INTO `round_status` (`id`,`status`,`description`) VALUES
('1','Waiting',NULL);
INSERT INTO `round_status` (`id`,`status`,`description`) VALUES
('2','In Progress',NULL);
INSERT INTO `round_status` (`id`,`status`,`description`) VALUES
('3','Finished',NULL);



-- -------------------------------------------
-- TABLE DATA sort
-- -------------------------------------------
INSERT INTO `sort` (`id`,`sort`,`description`) VALUES
('1','Random',NULL);
INSERT INTO `sort` (`id`,`sort`,`description`) VALUES
('2','Rank',NULL);
INSERT INTO `sort` (`id`,`sort`,`description`) VALUES
('3','Champion',NULL);



-- -------------------------------------------
-- TABLE DATA sort_order
-- -------------------------------------------
INSERT INTO `sort_order` (`id`,`sort_id`,`order_id`) VALUES
('1','1','1');
INSERT INTO `sort_order` (`id`,`sort_id`,`order_id`) VALUES
('2','2','2');
INSERT INTO `sort_order` (`id`,`sort_id`,`order_id`) VALUES
('3','2','3');
INSERT INTO `sort_order` (`id`,`sort_id`,`order_id`) VALUES
('8','3','2');
INSERT INTO `sort_order` (`id`,`sort_id`,`order_id`) VALUES
('9','3','3');



-- -------------------------------------------
-- TABLE DATA team
-- -------------------------------------------
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('0','Bye','0','0','0','0','0','0','0',NULL,'0000',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('1','Team 1','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('2','Team 2','0','0','0','0','0','0','0','0','2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('3','Team 3','0','0','0','0','0','0','0','0','2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('4','Team 4','0','0','0','0','0','0','0','0','2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('5','Team 5','0','0','0','0','0','0','0','0','2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('6','Team 6','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('7','Team 7','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('8','Team 8','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('9','Team 9','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('10','Team 10','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('11','Team 11','0','0','0','0','0','0','0',NULL,'2017',NULL);
INSERT INTO `team` (`id`,`team`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`since`,`last_played`) VALUES
('12','Team 12','0','0','0','0','0','0','0',NULL,'2017',NULL);



-- -------------------------------------------
-- TABLE DATA team_event
-- -------------------------------------------
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('14','0','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('15','0','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('16','0','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('17','0','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('18','0','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('19','0','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('20','0','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('21','0','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('22','0','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('23','0','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('24','0','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('25','0','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('26','1','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('27','1','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('28','1','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('29','1','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('30','1','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('31','1','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('32','1','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('33','1','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('34','1','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('35','1','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('36','1','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('37','1','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('38','2','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('39','2','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('40','2','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('41','2','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('42','2','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('43','2','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('44','2','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('45','2','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('46','2','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('47','2','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('48','2','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('49','2','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('50','3','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('51','3','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('52','3','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('53','3','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('54','3','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('55','3','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('56','3','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('57','3','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('58','3','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('59','3','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('60','3','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('61','3','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('62','4','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('63','4','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('64','4','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('65','4','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('66','4','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('67','4','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('68','4','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('69','4','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('70','4','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('71','4','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('72','4','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('73','4','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('74','5','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('75','5','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('76','5','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('77','5','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('78','5','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('79','5','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('80','5','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('81','5','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('82','5','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('83','5','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('84','5','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('85','5','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('86','6','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('87','6','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('88','6','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('89','6','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('90','6','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('91','6','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('92','6','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('93','6','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('94','6','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('95','6','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('96','6','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('97','6','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('98','7','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('99','7','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('100','7','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('101','7','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('102','7','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('103','7','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('104','7','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('105','7','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('106','7','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('107','7','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('108','7','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('109','7','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('110','8','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('111','8','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('112','8','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('113','8','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('114','8','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('115','8','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('116','8','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('117','8','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('118','8','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('119','8','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('120','8','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('121','8','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('122','9','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('123','9','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('124','9','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('125','9','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('126','9','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('127','9','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('128','9','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('129','9','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('130','9','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('131','9','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('132','9','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('133','9','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('134','10','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('135','10','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('136','10','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('137','10','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('138','10','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('139','10','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('140','10','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('141','10','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('142','10','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('143','10','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('144','10','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('145','10','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('146','11','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('147','11','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('148','11','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('149','11','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('150','11','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('151','11','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('152','11','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('153','11','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('154','11','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('155','11','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('156','11','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('157','11','12','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('158','12','1','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('159','12','2','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('160','12','3','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('161','12','4','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('162','12','5','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('163','12','6','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('164','12','7','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('165','12','8','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('166','12','9','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('167','12','10','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('168','12','11','1','0','0','0','0','0','0',NULL,NULL);
INSERT INTO `team_event` (`id`,`team_id`,`event_type_id`,`team_status_id`,`champ`,`first`,`second`,`wins`,`draws`,`losses`,`rating`,`last_played`) VALUES
('169','12','12','1','0','0','0','0','0','0',NULL,NULL);



-- -------------------------------------------
-- TABLE DATA team_status
-- -------------------------------------------
INSERT INTO `team_status` (`id`,`status`,`description`) VALUES
('0','New',NULL);
INSERT INTO `team_status` (`id`,`status`,`description`) VALUES
('1','Active',NULL);
INSERT INTO `team_status` (`id`,`status`,`description`) VALUES
('2','Inactive',NULL);



-- -------------------------------------------
-- TABLE DATA user
-- -------------------------------------------
INSERT INTO `user` (`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) VALUES
('1','admin123','jCJziKTRWckwNV9KGPGK8VSxkqjtrgae','$2y$13$E9niAnf78XfuDwuYbihw3OlgCbY1.FE1s6Zk9ZYdrzGsaOWAEM436',NULL,'admin@admin.com','10','1501224956','1501224956');
INSERT INTO `user` (`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) VALUES
('2','admin','tzT8wGoAIjbk7QnaKNnW3zOz5I-S0wLN','$2y$13$mOMSYt.PpPkSuCcrjSmQWeMh6UUrDM4/86durp1vJ8TAygttOJHiG',NULL,'admin123@admin.com','10','1501224969','1501224969');
INSERT INTO `user` (`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) VALUES
('3','jakezyrus','VrcK7070w7pNThP2ULofhoQj87eD3nvS','$2y$13$G/vX6n9yRei89p9xfe3rYuzaHv5V0GJj6fkTtn1SFfNZL23.GNv8O',NULL,'jakezyrus@abs.com','10','1501225046','1501225046');
INSERT INTO `user` (`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) VALUES
('4','test','vr927efYfN8CZv9GcAKC0RRnq1h1ppzr','$2y$13$P6ze9LV0.SsMO2t3oujM6OXAqJgRQeMjQV3N/WBx6TaHDN.qaF6TO',NULL,'test@test.com','10','1506768570','1506768570');
INSERT INTO `user` (`id`,`username`,`auth_key`,`password_hash`,`password_reset_token`,`email`,`status`,`created_at`,`updated_at`) VALUES
('20','org123','A07qcgbyUJIQ7_1TfSQfERa_Z9TOhCq9','$2y$13$/U2uEKUkvY3wak8UUKgY5.5JB9jvnmOGaHFVnoWYRiil7SIhHjdMq',NULL,'org@org.com','10','1506795830','1506795830');



-- -------------------------------------------
-- TABLE DATA venue
-- -------------------------------------------
INSERT INTO `venue` (`id`,`venue`,`description`) VALUES
('1','Gymnasium',NULL);
INSERT INTO `venue` (`id`,`venue`,`description`) VALUES
('2','Library',NULL);
INSERT INTO `venue` (`id`,`venue`,`description`) VALUES
('3','Lobby',NULL);
INSERT INTO `venue` (`id`,`venue`,`description`) VALUES
('4','Student Center',NULL);
INSERT INTO `venue` (`id`,`venue`,`description`) VALUES
('5','Classroom',NULL);



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
