/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : l2jwz_new

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-22 22:45:01
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `login` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastactive` bigint(13) unsigned NOT NULL DEFAULT '0',
  `accessLevel` tinyint(4) NOT NULL DEFAULT '0',
  `lastIP` char(15) DEFAULT NULL,
  `lastServer` tinyint(4) DEFAULT '1',
  `pcIp` char(15) DEFAULT NULL,
  `hop1` char(15) DEFAULT NULL,
  `hop2` char(15) DEFAULT NULL,
  `hop3` char(15) DEFAULT NULL,
  `hop4` char(15) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for accounts_ipauth
-- ----------------------------
DROP TABLE IF EXISTS `accounts_ipauth`;
CREATE TABLE `accounts_ipauth` (
  `login` varchar(45) NOT NULL,
  `ip` char(15) NOT NULL,
  `type` enum('deny','allow') DEFAULT 'allow'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for account_data
-- ----------------------------
DROP TABLE IF EXISTS `account_data`;
CREATE TABLE `account_data` (
  `account_name` varchar(45) NOT NULL DEFAULT '',
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_name`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for account_gsdata
-- ----------------------------
DROP TABLE IF EXISTS `account_gsdata`;
CREATE TABLE `account_gsdata` (
  `account_name` varchar(45) NOT NULL DEFAULT '',
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_name`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for achievements
-- ----------------------------
DROP TABLE IF EXISTS `achievements`;
CREATE TABLE `achievements` (
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `a1` int(11) DEFAULT '0',
  `a2` int(11) DEFAULT '0',
  `a3` int(11) DEFAULT '0',
  `a4` int(11) DEFAULT '0',
  `a5` int(11) DEFAULT '0',
  `a6` int(11) DEFAULT '0',
  `a7` int(11) DEFAULT '0',
  `a8` int(11) DEFAULT '0',
  `a9` int(11) DEFAULT '0',
  `a10` int(11) DEFAULT '0',
  `a11` int(11) DEFAULT '0',
  `a12` int(11) DEFAULT '0',
  `a13` int(11) DEFAULT '0',
  `a14` int(11) DEFAULT '0',
  `a15` int(11) DEFAULT '0',
  `a16` int(11) DEFAULT '0',
  `a17` int(11) DEFAULT '0',
  `a18` int(11) DEFAULT '0',
  `a19` int(11) DEFAULT '0',
  `a20` int(11) DEFAULT '0',
  `a21` int(11) DEFAULT '0',
  `a22` int(11) DEFAULT '0',
  `a23` int(11) DEFAULT '0',
  `a24` int(11) DEFAULT '0',
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for aio_scheme_profiles_buffs
-- ----------------------------
DROP TABLE IF EXISTS `aio_scheme_profiles_buffs`;
CREATE TABLE `aio_scheme_profiles_buffs` (
  `charId` int(10) unsigned NOT NULL,
  `profile` varchar(45) NOT NULL DEFAULT '',
  `buff_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for airships
-- ----------------------------
DROP TABLE IF EXISTS `airships`;
CREATE TABLE `airships` (
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `fuel` decimal(5,0) NOT NULL DEFAULT '600',
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for announcements
-- ----------------------------
DROP TABLE IF EXISTS `announcements`;
CREATE TABLE `announcements` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `initial` bigint(20) NOT NULL DEFAULT '0',
  `delay` bigint(20) NOT NULL DEFAULT '0',
  `repeat` int(11) NOT NULL DEFAULT '0',
  `author` text NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auction
-- ----------------------------
DROP TABLE IF EXISTS `auction`;
CREATE TABLE `auction` (
  `id` int(11) NOT NULL DEFAULT '0',
  `sellerId` int(11) NOT NULL DEFAULT '0',
  `sellerName` varchar(50) NOT NULL DEFAULT 'NPC',
  `sellerClanName` varchar(50) NOT NULL DEFAULT '',
  `itemType` varchar(25) NOT NULL DEFAULT '',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `itemObjectId` int(11) NOT NULL DEFAULT '0',
  `itemName` varchar(40) NOT NULL DEFAULT '',
  `itemQuantity` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startingBid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `currentBid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `endDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemType`,`itemId`,`itemObjectId`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auction_bid
-- ----------------------------
DROP TABLE IF EXISTS `auction_bid`;
CREATE TABLE `auction_bid` (
  `id` int(11) NOT NULL DEFAULT '0',
  `auctionId` int(11) NOT NULL DEFAULT '0',
  `bidderId` int(11) NOT NULL DEFAULT '0',
  `bidderName` varchar(50) NOT NULL,
  `clan_name` varchar(50) NOT NULL,
  `maxBid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time_bid` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`auctionId`,`bidderId`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for auction_watch
-- ----------------------------
DROP TABLE IF EXISTS `auction_watch`;
CREATE TABLE `auction_watch` (
  `charObjId` int(11) NOT NULL DEFAULT '0',
  `auctionId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charObjId`,`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bbs_favorites
-- ----------------------------
DROP TABLE IF EXISTS `bbs_favorites`;
CREATE TABLE `bbs_favorites` (
  `favId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `favTitle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `favBypass` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `favAddDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`favId`),
  UNIQUE KEY `favId_playerId` (`favId`,`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves the Favorite links from each player.';

-- ----------------------------
-- Table structure for bot_reported_char_data
-- ----------------------------
DROP TABLE IF EXISTS `bot_reported_char_data`;
CREATE TABLE `bot_reported_char_data` (
  `botId` int(10) unsigned NOT NULL DEFAULT '0',
  `reporterId` int(10) unsigned NOT NULL DEFAULT '0',
  `reportDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`botId`,`reporterId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for buylists
-- ----------------------------
DROP TABLE IF EXISTS `buylists`;
CREATE TABLE `buylists` (
  `buylist_id` int(10) unsigned NOT NULL DEFAULT '0',
  `item_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `next_restock_time` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`buylist_id`,`item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle
-- ----------------------------
DROP TABLE IF EXISTS `castle`;
CREATE TABLE `castle` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL,
  `taxPercent` int(11) NOT NULL DEFAULT '15',
  `treasury` bigint(20) NOT NULL DEFAULT '0',
  `siegeDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  `regTimeOver` enum('true','false') NOT NULL DEFAULT 'true',
  `regTimeEnd` bigint(13) unsigned NOT NULL DEFAULT '0',
  `showNpcCrest` enum('true','false') NOT NULL DEFAULT 'false',
  `ticketBuyCount` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `castle_doorupgrade`;
CREATE TABLE `castle_doorupgrade` (
  `doorId` int(8) unsigned NOT NULL DEFAULT '0',
  `ratio` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `castleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`doorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_functions
-- ----------------------------
DROP TABLE IF EXISTS `castle_functions`;
CREATE TABLE `castle_functions` (
  `castle_id` int(2) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `lvl` int(3) NOT NULL DEFAULT '0',
  `lease` int(10) NOT NULL DEFAULT '0',
  `rate` decimal(20,0) NOT NULL DEFAULT '0',
  `endTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`castle_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_manor_procure
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_procure`;
CREATE TABLE `castle_manor_procure` (
  `castle_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `crop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `start_amount` int(11) unsigned NOT NULL DEFAULT '0',
  `price` int(11) unsigned NOT NULL DEFAULT '0',
  `reward_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `next_period` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`castle_id`,`crop_id`,`next_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_manor_production
-- ----------------------------
DROP TABLE IF EXISTS `castle_manor_production`;
CREATE TABLE `castle_manor_production` (
  `castle_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `seed_id` int(11) unsigned NOT NULL DEFAULT '0',
  `amount` int(11) unsigned NOT NULL DEFAULT '0',
  `start_amount` int(11) unsigned NOT NULL DEFAULT '0',
  `price` int(11) unsigned NOT NULL DEFAULT '0',
  `next_period` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`castle_id`,`seed_id`,`next_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `castle_siege_guards`;
CREATE TABLE `castle_siege_guards` (
  `castleId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `x` mediumint(6) NOT NULL DEFAULT '0',
  `y` mediumint(6) NOT NULL DEFAULT '0',
  `z` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawnDelay` mediumint(5) NOT NULL DEFAULT '0',
  `isHired` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`castleId`)
) ENGINE=MyISAM AUTO_INCREMENT=3690 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for castle_trapupgrade
-- ----------------------------
DROP TABLE IF EXISTS `castle_trapupgrade`;
CREATE TABLE `castle_trapupgrade` (
  `castleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `towerIndex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`towerIndex`,`castleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `account_name` varchar(45) DEFAULT NULL,
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `char_name` varchar(35) NOT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL,
  `maxHp` mediumint(8) unsigned DEFAULT NULL,
  `curHp` mediumint(8) unsigned DEFAULT NULL,
  `maxCp` mediumint(8) unsigned DEFAULT NULL,
  `curCp` mediumint(8) unsigned DEFAULT NULL,
  `maxMp` mediumint(8) unsigned DEFAULT NULL,
  `curMp` mediumint(8) unsigned DEFAULT NULL,
  `face` tinyint(3) unsigned DEFAULT NULL,
  `hairStyle` tinyint(3) unsigned DEFAULT NULL,
  `hairColor` tinyint(3) unsigned DEFAULT NULL,
  `sex` tinyint(3) unsigned DEFAULT NULL,
  `heading` mediumint(9) DEFAULT NULL,
  `x` mediumint(9) DEFAULT NULL,
  `y` mediumint(9) DEFAULT NULL,
  `z` mediumint(9) DEFAULT NULL,
  `exp` bigint(20) unsigned DEFAULT '0',
  `expBeforeDeath` bigint(20) unsigned DEFAULT '0',
  `sp` int(10) unsigned NOT NULL DEFAULT '0',
  `karma` int(10) unsigned DEFAULT NULL,
  `fame` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pvpkills` smallint(5) unsigned DEFAULT NULL,
  `pkkills` smallint(5) unsigned DEFAULT NULL,
  `clanid` int(10) unsigned DEFAULT NULL,
  `race` tinyint(3) unsigned DEFAULT NULL,
  `classid` tinyint(3) unsigned DEFAULT NULL,
  `base_class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `transform_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `deletetime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `cancraft` tinyint(3) unsigned DEFAULT NULL,
  `title` varchar(21) DEFAULT NULL,
  `title_color` mediumint(8) unsigned NOT NULL DEFAULT '15530402',
  `accesslevel` mediumint(9) DEFAULT '0',
  `online` tinyint(3) unsigned DEFAULT NULL,
  `onlinetime` int(11) DEFAULT NULL,
  `char_slot` tinyint(3) unsigned DEFAULT NULL,
  `newbie` mediumint(8) unsigned DEFAULT '1',
  `lastAccess` bigint(13) unsigned NOT NULL DEFAULT '0',
  `clan_privs` mediumint(8) unsigned DEFAULT '0',
  `wantspeace` tinyint(3) unsigned DEFAULT '0',
  `isin7sdungeon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `power_grade` tinyint(3) unsigned DEFAULT NULL,
  `nobless` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subpledge` smallint(6) NOT NULL DEFAULT '0',
  `lvl_joined_academy` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `apprentice` int(10) unsigned NOT NULL DEFAULT '0',
  `sponsor` int(10) unsigned NOT NULL DEFAULT '0',
  `clan_join_expiry_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `clan_create_expiry_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `death_penalty_level` smallint(5) unsigned NOT NULL DEFAULT '0',
  `bookmarkslot` smallint(5) unsigned NOT NULL DEFAULT '0',
  `vitality_points` smallint(5) unsigned NOT NULL DEFAULT '0',
  `createDate` date NOT NULL DEFAULT '0000-00-00',
  `pccafe_points` int(11) DEFAULT '0',
  `language` varchar(2) DEFAULT NULL,
  `enchant_bot` int(10) unsigned DEFAULT '0',
  `enchant_chance` double unsigned DEFAULT '80',
  `achievementmobkilled` int(10) unsigned DEFAULT '0',
  `aio` decimal(1,0) NOT NULL DEFAULT '0',
  `aio_end` decimal(20,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`),
  KEY `account_name` (`account_name`),
  KEY `char_name` (`char_name`),
  KEY `clanid` (`clanid`),
  KEY `online` (`online`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for characters_premium
-- ----------------------------
DROP TABLE IF EXISTS `characters_premium`;
CREATE TABLE `characters_premium` (
  `account_name` varchar(45) NOT NULL DEFAULT '',
  `premium_service` int(1) NOT NULL DEFAULT '0',
  `enddate` decimal(20,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for character_contacts
-- ----------------------------
DROP TABLE IF EXISTS `character_contacts`;
CREATE TABLE `character_contacts` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `contactId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_friends
-- ----------------------------
DROP TABLE IF EXISTS `character_friends`;
CREATE TABLE `character_friends` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `friendId` int(10) unsigned NOT NULL DEFAULT '0',
  `relation` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`friendId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_hennas
-- ----------------------------
DROP TABLE IF EXISTS `character_hennas`;
CREATE TABLE `character_hennas` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `symbol_id` int(11) DEFAULT NULL,
  `slot` int(11) NOT NULL DEFAULT '0',
  `class_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`slot`,`class_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_instance_time
-- ----------------------------
DROP TABLE IF EXISTS `character_instance_time`;
CREATE TABLE `character_instance_time` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `instanceId` int(3) NOT NULL DEFAULT '0',
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`instanceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_item_mall_points
-- ----------------------------
DROP TABLE IF EXISTS `character_item_mall_points`;
CREATE TABLE `character_item_mall_points` (
  `account_name` varchar(45) NOT NULL,
  `game_points` bigint(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_item_mall_transactions
-- ----------------------------
DROP TABLE IF EXISTS `character_item_mall_transactions`;
CREATE TABLE `character_item_mall_transactions` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `productId` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '1',
  `transactionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_item_reuse_save
-- ----------------------------
DROP TABLE IF EXISTS `character_item_reuse_save`;
CREATE TABLE `character_item_reuse_save` (
  `charId` int(11) NOT NULL DEFAULT '0',
  `itemId` int(11) NOT NULL DEFAULT '0',
  `itemObjId` int(3) NOT NULL DEFAULT '1',
  `reuseDelay` int(8) NOT NULL DEFAULT '0',
  `systime` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`itemId`,`itemObjId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_macroses
-- ----------------------------
DROP TABLE IF EXISTS `character_macroses`;
CREATE TABLE `character_macroses` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL DEFAULT '0',
  `icon` int(11) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `descr` varchar(80) DEFAULT NULL,
  `acronym` varchar(4) DEFAULT NULL,
  `commands` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`charId`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_mail
-- ----------------------------
DROP TABLE IF EXISTS `character_mail`;
CREATE TABLE `character_mail` (
  `charId` int(10) NOT NULL,
  `letterId` int(10) NOT NULL AUTO_INCREMENT,
  `senderId` int(10) NOT NULL,
  `location` varchar(45) NOT NULL,
  `recipientNames` varchar(200) DEFAULT NULL,
  `subject` varchar(128) DEFAULT NULL,
  `message` varchar(3000) DEFAULT NULL,
  `sentDate` timestamp NULL DEFAULT NULL,
  `unread` smallint(1) DEFAULT '1',
  PRIMARY KEY (`letterId`),
  KEY `charId` (`charId`,`location`,`unread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_norestart_zone_time
-- ----------------------------
DROP TABLE IF EXISTS `character_norestart_zone_time`;
CREATE TABLE `character_norestart_zone_time` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `time_limit` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_offline_trade
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade`;
CREATE TABLE `character_offline_trade` (
  `charId` int(10) unsigned NOT NULL,
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_offline_trade_items
-- ----------------------------
DROP TABLE IF EXISTS `character_offline_trade_items`;
CREATE TABLE `character_offline_trade_items` (
  `charId` int(10) unsigned NOT NULL,
  `item` int(10) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `price` bigint(20) unsigned NOT NULL DEFAULT '0',
  KEY `charId` (`charId`),
  KEY `item` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_pet_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_pet_skills_save`;
CREATE TABLE `character_pet_skills_save` (
  `petObjItemId` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `skill_level` int(3) NOT NULL DEFAULT '1',
  `effect_count` int(11) NOT NULL DEFAULT '0',
  `effect_cur_time` int(11) NOT NULL DEFAULT '0',
  `buff_index` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`petObjItemId`,`skill_id`,`skill_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_premium_items
-- ----------------------------
DROP TABLE IF EXISTS `character_premium_items`;
CREATE TABLE `character_premium_items` (
  `charId` int(11) NOT NULL,
  `itemNum` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `itemCount` bigint(20) unsigned NOT NULL,
  `itemSender` varchar(50) NOT NULL,
  KEY `charId` (`charId`),
  KEY `itemNum` (`itemNum`),
  KEY `itemId` (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_quests
-- ----------------------------
DROP TABLE IF EXISTS `character_quests`;
CREATE TABLE `character_quests` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  `class_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`name`,`var`,`class_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_quest_global_data
-- ----------------------------
DROP TABLE IF EXISTS `character_quest_global_data`;
CREATE TABLE `character_quest_global_data` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`charId`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_raid_points
-- ----------------------------
DROP TABLE IF EXISTS `character_raid_points`;
CREATE TABLE `character_raid_points` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `boss_id` int(10) unsigned NOT NULL DEFAULT '0',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_recipebook
-- ----------------------------
DROP TABLE IF EXISTS `character_recipebook`;
CREATE TABLE `character_recipebook` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `id` decimal(11,0) NOT NULL DEFAULT '0',
  `classIndex` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`charId`,`classIndex`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_recipeshoplist
-- ----------------------------
DROP TABLE IF EXISTS `character_recipeshoplist`;
CREATE TABLE `character_recipeshoplist` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `recipeId` int(11) unsigned NOT NULL DEFAULT '0',
  `price` bigint(20) unsigned NOT NULL DEFAULT '0',
  `index` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`recipeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_reco_bonus
-- ----------------------------
DROP TABLE IF EXISTS `character_reco_bonus`;
CREATE TABLE `character_reco_bonus` (
  `charId` int(10) unsigned NOT NULL,
  `rec_have` int(3) NOT NULL DEFAULT '0',
  `rec_left` int(3) NOT NULL DEFAULT '0',
  `time_left` int(13) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `charId` (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_shortcuts
-- ----------------------------
DROP TABLE IF EXISTS `character_shortcuts`;
CREATE TABLE `character_shortcuts` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `slot` decimal(3,0) NOT NULL DEFAULT '0',
  `page` decimal(3,0) NOT NULL DEFAULT '0',
  `type` decimal(3,0) DEFAULT NULL,
  `shortcut_id` decimal(16,0) DEFAULT NULL,
  `level` varchar(4) DEFAULT NULL,
  `class_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`slot`,`page`,`class_index`),
  KEY `shortcut_id` (`shortcut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_skills
-- ----------------------------
DROP TABLE IF EXISTS `character_skills`;
CREATE TABLE `character_skills` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `skill_level` int(3) NOT NULL DEFAULT '1',
  `class_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`skill_id`,`class_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_skills_save`;
CREATE TABLE `character_skills_save` (
  `charId` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `skill_level` int(3) NOT NULL DEFAULT '1',
  `effect_count` int(11) NOT NULL DEFAULT '0',
  `effect_cur_time` int(11) NOT NULL DEFAULT '0',
  `reuse_delay` int(8) NOT NULL DEFAULT '0',
  `systime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `restore_type` int(1) NOT NULL DEFAULT '0',
  `class_index` int(1) NOT NULL DEFAULT '0',
  `buff_index` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`skill_id`,`skill_level`,`class_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_subclasses
-- ----------------------------
DROP TABLE IF EXISTS `character_subclasses`;
CREATE TABLE `character_subclasses` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `class_id` int(2) NOT NULL DEFAULT '0',
  `exp` decimal(20,0) NOT NULL DEFAULT '0',
  `sp` decimal(11,0) NOT NULL DEFAULT '0',
  `level` int(2) NOT NULL DEFAULT '40',
  `class_index` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_summons
-- ----------------------------
DROP TABLE IF EXISTS `character_summons`;
CREATE TABLE `character_summons` (
  `ownerId` int(10) unsigned NOT NULL,
  `summonSkillId` int(10) unsigned NOT NULL,
  `curHp` int(9) unsigned DEFAULT '0',
  `curMp` int(9) unsigned DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerId`,`summonSkillId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_summon_skills_save
-- ----------------------------
DROP TABLE IF EXISTS `character_summon_skills_save`;
CREATE TABLE `character_summon_skills_save` (
  `ownerId` int(11) NOT NULL DEFAULT '0',
  `ownerClassIndex` int(1) NOT NULL DEFAULT '0',
  `summonSkillId` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `skill_level` int(3) NOT NULL DEFAULT '1',
  `effect_count` int(11) NOT NULL DEFAULT '0',
  `effect_cur_time` int(11) NOT NULL DEFAULT '0',
  `buff_index` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ownerId`,`ownerClassIndex`,`summonSkillId`,`skill_id`,`skill_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_tpbookmark
-- ----------------------------
DROP TABLE IF EXISTS `character_tpbookmark`;
CREATE TABLE `character_tpbookmark` (
  `charId` int(20) NOT NULL,
  `Id` int(20) NOT NULL,
  `x` int(20) NOT NULL,
  `y` int(20) NOT NULL,
  `z` int(20) NOT NULL,
  `icon` int(20) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`charId`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_ui_actions
-- ----------------------------
DROP TABLE IF EXISTS `character_ui_actions`;
CREATE TABLE `character_ui_actions` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `cat` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `cmd` int(8) NOT NULL DEFAULT '0',
  `key` int(8) NOT NULL,
  `tgKey1` int(8) DEFAULT NULL,
  `tgKey2` int(8) DEFAULT NULL,
  `show` tinyint(4) NOT NULL,
  PRIMARY KEY (`charId`,`cat`,`cmd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_ui_categories
-- ----------------------------
DROP TABLE IF EXISTS `character_ui_categories`;
CREATE TABLE `character_ui_categories` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `catId` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `cmdId` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`,`catId`,`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for character_variables
-- ----------------------------
DROP TABLE IF EXISTS `character_variables`;
CREATE TABLE `character_variables` (
  `charId` int(10) unsigned NOT NULL,
  `var` varchar(255) NOT NULL,
  `val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clanhall
-- ----------------------------
DROP TABLE IF EXISTS `clanhall`;
CREATE TABLE `clanhall` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `ownerId` int(11) NOT NULL DEFAULT '0',
  `lease` int(10) NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `location` varchar(15) NOT NULL DEFAULT '',
  `paidUntil` bigint(13) unsigned NOT NULL DEFAULT '0',
  `Grade` decimal(1,0) NOT NULL DEFAULT '0',
  `paid` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ownerId` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clanhall_functions
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_functions`;
CREATE TABLE `clanhall_functions` (
  `hall_id` int(2) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `lvl` int(3) NOT NULL DEFAULT '0',
  `lease` int(10) NOT NULL DEFAULT '0',
  `rate` decimal(20,0) NOT NULL DEFAULT '0',
  `endTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hall_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clanhall_siege_attackers
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_siege_attackers`;
CREATE TABLE `clanhall_siege_attackers` (
  `clanhall_id` int(3) NOT NULL DEFAULT '0',
  `attacker_id` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clanhall_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `clanhall_siege_guards`;
CREATE TABLE `clanhall_siege_guards` (
  `clanHallId` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `npcId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `x` mediumint(6) NOT NULL DEFAULT '0',
  `y` mediumint(6) NOT NULL DEFAULT '0',
  `z` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawnDelay` mediumint(5) NOT NULL DEFAULT '0',
  `isSiegeBoss` enum('false','true') NOT NULL DEFAULT 'false',
  KEY `clanHallId` (`clanHallId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_data
-- ----------------------------
DROP TABLE IF EXISTS `clan_data`;
CREATE TABLE `clan_data` (
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `clan_name` varchar(45) DEFAULT NULL,
  `clan_level` int(11) DEFAULT NULL,
  `reputation_score` int(11) NOT NULL DEFAULT '0',
  `hasCastle` int(11) DEFAULT NULL,
  `blood_alliance_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `blood_oath_count` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ally_id` int(11) DEFAULT NULL,
  `ally_name` varchar(45) DEFAULT NULL,
  `leader_id` int(11) DEFAULT NULL,
  `crest_id` int(11) DEFAULT NULL,
  `crest_large_id` int(11) DEFAULT NULL,
  `ally_crest_id` int(11) DEFAULT NULL,
  `auction_bid_at` int(11) NOT NULL DEFAULT '0',
  `ally_penalty_expiry_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `ally_penalty_type` tinyint(1) NOT NULL DEFAULT '0',
  `char_penalty_expiry_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `dissolving_expiry_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `new_leader_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`),
  KEY `ally_id` (`ally_id`),
  KEY `leader_id` (`leader_id`),
  KEY `auction_bid_at` (`auction_bid_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_notices
-- ----------------------------
DROP TABLE IF EXISTS `clan_notices`;
CREATE TABLE `clan_notices` (
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `notice` text NOT NULL,
  PRIMARY KEY (`clan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_privs
-- ----------------------------
DROP TABLE IF EXISTS `clan_privs`;
CREATE TABLE `clan_privs` (
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `party` int(11) NOT NULL DEFAULT '0',
  `privs` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`,`rank`,`party`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_skills
-- ----------------------------
DROP TABLE IF EXISTS `clan_skills`;
CREATE TABLE `clan_skills` (
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) NOT NULL DEFAULT '0',
  `skill_level` int(5) NOT NULL DEFAULT '0',
  `skill_name` varchar(26) DEFAULT NULL,
  `sub_pledge_id` int(11) NOT NULL DEFAULT '-2',
  PRIMARY KEY (`clan_id`,`skill_id`,`sub_pledge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_subpledges
-- ----------------------------
DROP TABLE IF EXISTS `clan_subpledges`;
CREATE TABLE `clan_subpledges` (
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `sub_pledge_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `leader_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`,`sub_pledge_id`),
  KEY `leader_id` (`leader_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for clan_wars
-- ----------------------------
DROP TABLE IF EXISTS `clan_wars`;
CREATE TABLE `clan_wars` (
  `clan1` varchar(35) NOT NULL DEFAULT '',
  `clan2` varchar(35) NOT NULL DEFAULT '',
  `wantspeace1` decimal(1,0) NOT NULL DEFAULT '0',
  `wantspeace2` decimal(1,0) NOT NULL DEFAULT '0',
  KEY `clan1` (`clan1`),
  KEY `clan2` (`clan2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for crests
-- ----------------------------
DROP TABLE IF EXISTS `crests`;
CREATE TABLE `crests` (
  `crest_id` int(11) NOT NULL DEFAULT '0',
  `data` varbinary(2176) NOT NULL,
  `type` tinyint(4) NOT NULL,
  PRIMARY KEY (`crest_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cursed_weapons
-- ----------------------------
DROP TABLE IF EXISTS `cursed_weapons`;
CREATE TABLE `cursed_weapons` (
  `itemId` int(11) NOT NULL DEFAULT '0',
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `playerKarma` int(11) DEFAULT '0',
  `playerPkKills` int(11) DEFAULT '0',
  `nbKills` int(11) DEFAULT '0',
  `endTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`),
  KEY `charId` (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_droplist
-- ----------------------------
DROP TABLE IF EXISTS `custom_droplist`;
CREATE TABLE `custom_droplist` (
  `mobId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min` int(8) unsigned NOT NULL DEFAULT '0',
  `max` int(8) unsigned NOT NULL DEFAULT '0',
  `category` smallint(3) NOT NULL DEFAULT '0',
  `chance` mediumint(7) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mobId`,`itemId`,`category`),
  KEY `key_mobId` (`mobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_npc
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc`;
CREATE TABLE `custom_npc` (
  `id` mediumint(7) unsigned NOT NULL,
  `idTemplate` smallint(5) unsigned NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `serverSideName` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(45) NOT NULL DEFAULT '',
  `serverSideTitle` tinyint(1) NOT NULL DEFAULT '1',
  `class` varchar(200) DEFAULT NULL,
  `collision_radius` decimal(6,2) DEFAULT NULL,
  `collision_height` decimal(6,2) DEFAULT NULL,
  `level` tinyint(2) DEFAULT NULL,
  `sex` enum('etc','female','male') NOT NULL DEFAULT 'etc',
  `type` varchar(22) DEFAULT NULL,
  `attackrange` smallint(4) DEFAULT NULL,
  `hp` decimal(30,15) DEFAULT NULL,
  `mp` decimal(30,15) DEFAULT NULL,
  `hpreg` decimal(30,15) DEFAULT NULL,
  `mpreg` decimal(30,15) DEFAULT NULL,
  `str` tinyint(2) NOT NULL DEFAULT '40',
  `con` tinyint(2) NOT NULL DEFAULT '43',
  `dex` tinyint(2) NOT NULL DEFAULT '30',
  `int` tinyint(2) NOT NULL DEFAULT '21',
  `wit` tinyint(2) NOT NULL DEFAULT '20',
  `men` tinyint(2) NOT NULL DEFAULT '20',
  `exp` int(9) NOT NULL DEFAULT '0',
  `sp` int(9) NOT NULL DEFAULT '0',
  `patk` decimal(12,5) DEFAULT NULL,
  `pdef` decimal(12,5) DEFAULT NULL,
  `matk` decimal(12,5) DEFAULT NULL,
  `mdef` decimal(12,5) DEFAULT NULL,
  `atkspd` smallint(4) NOT NULL DEFAULT '230',
  `critical` tinyint(1) NOT NULL DEFAULT '1',
  `matkspd` smallint(4) NOT NULL DEFAULT '333',
  `rhand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lhand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enchant` tinyint(1) NOT NULL DEFAULT '0',
  `walkspd` decimal(10,5) NOT NULL DEFAULT '60.00000',
  `runspd` decimal(10,5) NOT NULL DEFAULT '120.00000',
  `dropHerbGroup` tinyint(1) NOT NULL DEFAULT '0',
  `basestats` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_npcaidata
-- ----------------------------
DROP TABLE IF EXISTS `custom_npcaidata`;
CREATE TABLE `custom_npcaidata` (
  `npcId` mediumint(7) unsigned NOT NULL,
  `minSkillChance` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `maxSkillChance` tinyint(3) unsigned NOT NULL DEFAULT '15',
  `primarySkillId` smallint(5) unsigned DEFAULT '0',
  `agroRange` smallint(4) unsigned NOT NULL DEFAULT '0',
  `canMove` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `targetable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showName` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `minRangeSkill` smallint(5) unsigned DEFAULT '0',
  `minRangeChance` tinyint(3) unsigned DEFAULT '0',
  `maxRangeSkill` smallint(5) unsigned DEFAULT '0',
  `maxRangeChance` tinyint(3) unsigned DEFAULT '0',
  `soulShot` smallint(4) unsigned DEFAULT '0',
  `spiritShot` smallint(4) unsigned DEFAULT '0',
  `spsChance` tinyint(3) unsigned DEFAULT '0',
  `ssChance` tinyint(3) unsigned DEFAULT '0',
  `aggro` smallint(4) unsigned NOT NULL DEFAULT '0',
  `isChaos` smallint(4) unsigned DEFAULT '0',
  `clan` varchar(40) DEFAULT NULL,
  `clanRange` smallint(4) unsigned DEFAULT '0',
  `enemyClan` varchar(40) DEFAULT NULL,
  `enemyRange` smallint(4) unsigned DEFAULT '0',
  `dodge` tinyint(3) unsigned DEFAULT '0',
  `aiType` varchar(8) NOT NULL DEFAULT 'fighter',
  PRIMARY KEY (`npcId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_npcskills
-- ----------------------------
DROP TABLE IF EXISTS `custom_npcskills`;
CREATE TABLE `custom_npcskills` (
  `npcid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `skillid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npcid`,`skillid`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_npc_elementals
-- ----------------------------
DROP TABLE IF EXISTS `custom_npc_elementals`;
CREATE TABLE `custom_npc_elementals` (
  `npc_id` mediumint(7) unsigned NOT NULL,
  `elemAtkType` tinyint(1) NOT NULL DEFAULT '-1',
  `elemAtkValue` int(3) NOT NULL DEFAULT '0',
  `fireDefValue` int(3) NOT NULL DEFAULT '0',
  `waterDefValue` int(3) NOT NULL DEFAULT '0',
  `windDefValue` int(3) NOT NULL DEFAULT '0',
  `earthDefValue` int(3) NOT NULL DEFAULT '0',
  `holyDefValue` int(3) NOT NULL DEFAULT '0',
  `darkDefValue` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `custom_spawnlist`;
CREATE TABLE `custom_spawnlist` (
  `location` varchar(40) NOT NULL DEFAULT '',
  `spawn_name` varchar(100) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `npc_templateid` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `locx` mediumint(6) NOT NULL DEFAULT '0',
  `locy` mediumint(6) NOT NULL DEFAULT '0',
  `locz` mediumint(6) NOT NULL DEFAULT '0',
  `randomx` mediumint(6) NOT NULL DEFAULT '0',
  `randomy` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawn_delay` mediumint(5) NOT NULL DEFAULT '0',
  `respawn_random` mediumint(5) NOT NULL DEFAULT '0',
  `loc_id` int(9) NOT NULL DEFAULT '0',
  `periodOfDay` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_teleport
-- ----------------------------
DROP TABLE IF EXISTS `custom_teleport`;
CREATE TABLE `custom_teleport` (
  `Description` varchar(75) DEFAULT NULL,
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `loc_x` mediumint(6) DEFAULT NULL,
  `loc_y` mediumint(6) DEFAULT NULL,
  `loc_z` mediumint(6) DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `fornoble` tinyint(1) NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '57',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_teleports
-- ----------------------------
DROP TABLE IF EXISTS `custom_teleports`;
CREATE TABLE `custom_teleports` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `tpname` varchar(45) DEFAULT NULL,
  `x` int(10) NOT NULL,
  `y` int(10) NOT NULL,
  `z` int(10) NOT NULL,
  `onlyForNoble` int(10) unsigned NOT NULL DEFAULT '0',
  `itemIdToGet` int(10) unsigned NOT NULL DEFAULT '57',
  `teleportPrice` int(10) unsigned NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for dimensional_rift
-- ----------------------------
DROP TABLE IF EXISTS `dimensional_rift`;
CREATE TABLE `dimensional_rift` (
  `type` tinyint(1) unsigned NOT NULL,
  `room_id` tinyint(1) unsigned NOT NULL,
  `xMin` mediumint(6) NOT NULL,
  `xMax` mediumint(6) NOT NULL,
  `yMin` mediumint(6) NOT NULL,
  `yMax` mediumint(6) NOT NULL,
  `zMin` mediumint(6) NOT NULL,
  `zMax` mediumint(6) NOT NULL,
  `xT` mediumint(6) NOT NULL,
  `yT` mediumint(6) NOT NULL,
  `zT` mediumint(6) NOT NULL,
  `boss` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`,`room_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for droplist
-- ----------------------------
DROP TABLE IF EXISTS `droplist`;
CREATE TABLE `droplist` (
  `mobId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `min` int(8) unsigned NOT NULL DEFAULT '0',
  `max` int(8) unsigned NOT NULL DEFAULT '0',
  `category` smallint(3) NOT NULL DEFAULT '0',
  `chance` decimal(30,15) unsigned NOT NULL DEFAULT '0.000000000000000',
  PRIMARY KEY (`mobId`,`itemId`,`category`),
  KEY `key_mobId` (`mobId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fake_pcs
-- ----------------------------
DROP TABLE IF EXISTS `fake_pcs`;
CREATE TABLE `fake_pcs` (
  `npc_id` int(11) NOT NULL,
  `race` int(11) NOT NULL DEFAULT '0',
  `sex` int(11) NOT NULL DEFAULT '0',
  `class` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `title_color` varchar(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `name_color` varchar(11) DEFAULT NULL,
  `hair_style` int(11) NOT NULL DEFAULT '0',
  `hair_color` int(11) NOT NULL DEFAULT '0',
  `face` int(11) NOT NULL DEFAULT '0',
  `mount` tinyint(4) NOT NULL DEFAULT '0',
  `team` tinyint(4) NOT NULL DEFAULT '0',
  `hero` tinyint(4) NOT NULL DEFAULT '0',
  `pd_under` int(11) NOT NULL DEFAULT '0',
  `pd_under_aug` int(11) NOT NULL DEFAULT '0',
  `pd_head` int(11) NOT NULL DEFAULT '0',
  `pd_head_aug` int(11) NOT NULL DEFAULT '0',
  `pd_rhand` int(11) NOT NULL DEFAULT '0',
  `pd_rhand_aug` int(11) NOT NULL DEFAULT '0',
  `pd_lhand` int(11) NOT NULL DEFAULT '0',
  `pd_lhand_aug` int(11) NOT NULL DEFAULT '0',
  `pd_gloves` int(11) NOT NULL DEFAULT '0',
  `pd_gloves_aug` int(11) NOT NULL DEFAULT '0',
  `pd_chest` int(11) NOT NULL DEFAULT '0',
  `pd_chest_aug` int(11) NOT NULL DEFAULT '0',
  `pd_legs` int(11) NOT NULL DEFAULT '0',
  `pd_legs_aug` int(11) NOT NULL DEFAULT '0',
  `pd_feet` int(11) NOT NULL DEFAULT '0',
  `pd_feet_aug` int(11) NOT NULL DEFAULT '0',
  `pd_back` int(11) NOT NULL DEFAULT '0',
  `pd_back_aug` int(11) NOT NULL DEFAULT '0',
  `pd_lrhand` int(11) NOT NULL DEFAULT '0',
  `pd_lrhand_aug` int(11) NOT NULL DEFAULT '0',
  `pd_hair` int(11) NOT NULL DEFAULT '0',
  `pd_hair_aug` int(11) NOT NULL DEFAULT '0',
  `pd_hair2` int(11) NOT NULL DEFAULT '0',
  `pd_hair2_aug` int(11) NOT NULL DEFAULT '0',
  `pd_rbracelet` int(11) NOT NULL DEFAULT '0',
  `pd_rbracelet_aug` int(11) NOT NULL DEFAULT '0',
  `pd_lbracelet` int(11) NOT NULL DEFAULT '0',
  `pd_lbracelet_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco1` int(11) NOT NULL DEFAULT '0',
  `pd_deco1_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco2` int(11) NOT NULL DEFAULT '0',
  `pd_deco2_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco3` int(11) NOT NULL DEFAULT '0',
  `pd_deco3_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco4` int(11) NOT NULL DEFAULT '0',
  `pd_deco4_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco5` int(11) NOT NULL DEFAULT '0',
  `pd_deco5_aug` int(11) NOT NULL DEFAULT '0',
  `pd_deco6` int(11) NOT NULL DEFAULT '0',
  `pd_deco6_aug` int(11) NOT NULL DEFAULT '0',
  `enchant_effect` tinyint(4) NOT NULL DEFAULT '0',
  `pvp_flag` int(11) NOT NULL DEFAULT '0',
  `karma` int(11) NOT NULL DEFAULT '0',
  `fishing` tinyint(4) NOT NULL DEFAULT '0',
  `fishing_x` int(11) NOT NULL DEFAULT '0',
  `fishing_y` int(11) NOT NULL DEFAULT '0',
  `fishing_z` int(11) NOT NULL DEFAULT '0',
  `invisible` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fort
-- ----------------------------
DROP TABLE IF EXISTS `fort`;
CREATE TABLE `fort` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL,
  `siegeDate` bigint(13) unsigned NOT NULL DEFAULT '0',
  `lastOwnedTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `fortType` int(1) NOT NULL DEFAULT '0',
  `state` int(1) NOT NULL DEFAULT '0',
  `castleId` int(1) NOT NULL DEFAULT '0',
  `supplyLvL` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fortsiege_clans
-- ----------------------------
DROP TABLE IF EXISTS `fortsiege_clans`;
CREATE TABLE `fortsiege_clans` (
  `fort_id` int(1) NOT NULL DEFAULT '0',
  `clan_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`clan_id`,`fort_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fort_doorupgrade
-- ----------------------------
DROP TABLE IF EXISTS `fort_doorupgrade`;
CREATE TABLE `fort_doorupgrade` (
  `doorId` int(11) NOT NULL DEFAULT '0',
  `fortId` int(11) NOT NULL,
  `hp` int(11) NOT NULL DEFAULT '0',
  `pDef` int(11) NOT NULL DEFAULT '0',
  `mDef` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`doorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fort_functions
-- ----------------------------
DROP TABLE IF EXISTS `fort_functions`;
CREATE TABLE `fort_functions` (
  `fort_id` int(2) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  `lvl` int(3) NOT NULL DEFAULT '0',
  `lease` int(10) NOT NULL DEFAULT '0',
  `rate` decimal(20,0) NOT NULL DEFAULT '0',
  `endTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fort_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fort_siege_guards
-- ----------------------------
DROP TABLE IF EXISTS `fort_siege_guards`;
CREATE TABLE `fort_siege_guards` (
  `fortId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `x` mediumint(6) NOT NULL DEFAULT '0',
  `y` mediumint(6) NOT NULL DEFAULT '0',
  `z` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawnDelay` mediumint(5) NOT NULL DEFAULT '0',
  `isHired` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`fortId`)
) ENGINE=MyISAM AUTO_INCREMENT=3708 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fort_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `fort_spawnlist`;
CREATE TABLE `fort_spawnlist` (
  `fortId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `x` mediumint(6) NOT NULL DEFAULT '0',
  `y` mediumint(6) NOT NULL DEFAULT '0',
  `z` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `spawnType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `castleId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`fortId`)
) ENGINE=MyISAM AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for forums
-- ----------------------------
DROP TABLE IF EXISTS `forums`;
CREATE TABLE `forums` (
  `forum_id` int(8) NOT NULL DEFAULT '0',
  `forum_name` varchar(255) NOT NULL DEFAULT '',
  `forum_parent` int(8) NOT NULL DEFAULT '0',
  `forum_post` int(8) NOT NULL DEFAULT '0',
  `forum_type` int(8) NOT NULL DEFAULT '0',
  `forum_perm` int(8) NOT NULL DEFAULT '0',
  `forum_owner_id` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`forum_id`),
  KEY `forum_owner_id` (`forum_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for four_sepulchers_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `four_sepulchers_spawnlist`;
CREATE TABLE `four_sepulchers_spawnlist` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(19) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `npc_templateid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `locx` mediumint(6) NOT NULL DEFAULT '0',
  `locy` mediumint(6) NOT NULL DEFAULT '0',
  `locz` mediumint(6) NOT NULL DEFAULT '0',
  `randomx` mediumint(6) NOT NULL DEFAULT '0',
  `randomy` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawn_delay` mediumint(5) NOT NULL DEFAULT '0',
  `key_npc_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spawntype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1613 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for games
-- ----------------------------
DROP TABLE IF EXISTS `games`;
CREATE TABLE `games` (
  `id` int(11) NOT NULL DEFAULT '0',
  `idnr` int(11) NOT NULL DEFAULT '0',
  `number1` int(11) NOT NULL DEFAULT '0',
  `number2` int(11) NOT NULL DEFAULT '0',
  `prize` int(11) NOT NULL DEFAULT '0',
  `newprize` int(11) NOT NULL DEFAULT '0',
  `prize1` int(11) NOT NULL DEFAULT '0',
  `prize2` int(11) NOT NULL DEFAULT '0',
  `prize3` int(11) NOT NULL DEFAULT '0',
  `enddate` bigint(13) unsigned NOT NULL DEFAULT '0',
  `finished` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`idnr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gameservers
-- ----------------------------
DROP TABLE IF EXISTS `gameservers`;
CREATE TABLE `gameservers` (
  `server_id` int(11) NOT NULL DEFAULT '0',
  `hexid` varchar(50) NOT NULL DEFAULT '',
  `host` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`server_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for global_tasks
-- ----------------------------
DROP TABLE IF EXISTS `global_tasks`;
CREATE TABLE `global_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task` varchar(50) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `last_activation` bigint(13) unsigned NOT NULL DEFAULT '0',
  `param1` varchar(100) NOT NULL DEFAULT '',
  `param2` varchar(100) NOT NULL DEFAULT '',
  `param3` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for global_variables
-- ----------------------------
DROP TABLE IF EXISTS `global_variables`;
CREATE TABLE `global_variables` (
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for grandboss_data
-- ----------------------------
DROP TABLE IF EXISTS `grandboss_data`;
CREATE TABLE `grandboss_data` (
  `boss_id` smallint(5) unsigned NOT NULL,
  `loc_x` mediumint(6) NOT NULL,
  `loc_y` mediumint(6) NOT NULL,
  `loc_z` mediumint(6) NOT NULL,
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawn_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `currentHP` decimal(30,15) NOT NULL,
  `currentMP` decimal(30,15) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for grandboss_list
-- ----------------------------
DROP TABLE IF EXISTS `grandboss_list`;
CREATE TABLE `grandboss_list` (
  `player_id` decimal(11,0) NOT NULL,
  `zone` decimal(11,0) NOT NULL,
  PRIMARY KEY (`player_id`,`zone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for heroes
-- ----------------------------
DROP TABLE IF EXISTS `heroes`;
CREATE TABLE `heroes` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `class_id` decimal(3,0) NOT NULL DEFAULT '0',
  `count` decimal(3,0) NOT NULL DEFAULT '0',
  `played` decimal(1,0) NOT NULL DEFAULT '0',
  `claimed` enum('true','false') NOT NULL DEFAULT 'false',
  `message` varchar(300) NOT NULL DEFAULT '',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for heroes_diary
-- ----------------------------
DROP TABLE IF EXISTS `heroes_diary`;
CREATE TABLE `heroes_diary` (
  `charId` int(10) unsigned NOT NULL,
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `param` int(11) unsigned NOT NULL DEFAULT '0',
  KEY `charId` (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for hwid_bans
-- ----------------------------
DROP TABLE IF EXISTS `hwid_bans`;
CREATE TABLE `hwid_bans` (
  `HWID` varchar(32) DEFAULT NULL,
  `expiretime` int(11) NOT NULL DEFAULT '0',
  `comments` varchar(255) DEFAULT NULL,
  UNIQUE KEY `HWID` (`HWID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hwid_info
-- ----------------------------
DROP TABLE IF EXISTS `hwid_info`;
CREATE TABLE `hwid_info` (
  `HWID` varchar(32) NOT NULL DEFAULT '',
  `WindowsCount` int(10) unsigned NOT NULL DEFAULT '1',
  `Account` varchar(45) NOT NULL DEFAULT '',
  `PlayerID` int(10) unsigned NOT NULL DEFAULT '0',
  `LockType` enum('PLAYER_LOCK','ACCOUNT_LOCK','NONE') NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`HWID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `owner_id` int(11) DEFAULT NULL,
  `object_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) DEFAULT NULL,
  `count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enchant_level` int(11) DEFAULT NULL,
  `loc` varchar(10) DEFAULT NULL,
  `loc_data` int(11) DEFAULT NULL,
  `time_of_use` int(11) DEFAULT NULL,
  `custom_type1` int(11) DEFAULT '0',
  `custom_type2` int(11) DEFAULT '0',
  `mana_left` decimal(5,0) NOT NULL DEFAULT '-1',
  `time` decimal(13,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`),
  KEY `owner_id` (`owner_id`),
  KEY `item_id` (`item_id`),
  KEY `loc` (`loc`),
  KEY `time_of_use` (`time_of_use`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for itemsonground
-- ----------------------------
DROP TABLE IF EXISTS `itemsonground`;
CREATE TABLE `itemsonground` (
  `object_id` int(11) NOT NULL DEFAULT '0',
  `item_id` int(11) DEFAULT NULL,
  `count` bigint(20) unsigned NOT NULL DEFAULT '0',
  `enchant_level` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `drop_time` bigint(13) NOT NULL DEFAULT '0',
  `equipable` int(1) DEFAULT '0',
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_attributes
-- ----------------------------
DROP TABLE IF EXISTS `item_attributes`;
CREATE TABLE `item_attributes` (
  `itemId` int(11) NOT NULL DEFAULT '0',
  `augAttributes` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_auction
-- ----------------------------
DROP TABLE IF EXISTS `item_auction`;
CREATE TABLE `item_auction` (
  `auctionId` int(11) NOT NULL,
  `instanceId` int(11) NOT NULL,
  `auctionItemId` int(11) NOT NULL,
  `startingTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `endingTime` bigint(13) unsigned NOT NULL DEFAULT '0',
  `auctionStateId` tinyint(1) NOT NULL,
  PRIMARY KEY (`auctionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_auction_bid
-- ----------------------------
DROP TABLE IF EXISTS `item_auction_bid`;
CREATE TABLE `item_auction_bid` (
  `auctionId` int(11) NOT NULL,
  `playerObjId` int(11) NOT NULL,
  `playerBid` bigint(20) NOT NULL,
  PRIMARY KEY (`auctionId`,`playerObjId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_elementals
-- ----------------------------
DROP TABLE IF EXISTS `item_elementals`;
CREATE TABLE `item_elementals` (
  `itemId` int(11) NOT NULL DEFAULT '0',
  `elemType` tinyint(1) NOT NULL DEFAULT '-1',
  `elemValue` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`itemId`,`elemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `loc_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `loc_x` mediumint(6) NOT NULL DEFAULT '0',
  `loc_y` mediumint(6) NOT NULL DEFAULT '0',
  `loc_zmin` mediumint(6) NOT NULL DEFAULT '0',
  `loc_zmax` mediumint(6) NOT NULL DEFAULT '0',
  `proc` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`loc_id`,`loc_x`,`loc_y`),
  KEY `proc` (`proc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for merchant_lease
-- ----------------------------
DROP TABLE IF EXISTS `merchant_lease`;
CREATE TABLE `merchant_lease` (
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `player_id` int(11) NOT NULL DEFAULT '0',
  `bid` int(11) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `player_name` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`merchant_id`,`player_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `messageId` int(11) NOT NULL DEFAULT '0',
  `senderId` int(11) NOT NULL DEFAULT '0',
  `receiverId` int(11) NOT NULL DEFAULT '0',
  `subject` tinytext,
  `content` text,
  `expiration` bigint(13) unsigned NOT NULL DEFAULT '0',
  `reqAdena` bigint(20) NOT NULL DEFAULT '0',
  `hasAttachments` enum('true','false') NOT NULL DEFAULT 'false',
  `isUnread` enum('true','false') NOT NULL DEFAULT 'true',
  `isDeletedBySender` enum('true','false') NOT NULL DEFAULT 'false',
  `isDeletedByReceiver` enum('true','false') NOT NULL DEFAULT 'false',
  `isLocked` enum('true','false') NOT NULL DEFAULT 'false',
  `sendBySystem` tinyint(1) NOT NULL DEFAULT '0',
  `isReturned` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`messageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for minions
-- ----------------------------
DROP TABLE IF EXISTS `minions`;
CREATE TABLE `minions` (
  `boss_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minion_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount_min` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `amount_max` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`boss_id`,`minion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mods_wedding
-- ----------------------------
DROP TABLE IF EXISTS `mods_wedding`;
CREATE TABLE `mods_wedding` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player1Id` int(11) NOT NULL DEFAULT '0',
  `player2Id` int(11) NOT NULL DEFAULT '0',
  `married` varchar(5) DEFAULT NULL,
  `affianceDate` decimal(20,0) DEFAULT '0',
  `weddingDate` decimal(20,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player1Id` (`player1Id`),
  KEY `player2Id` (`player2Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc
-- ----------------------------
DROP TABLE IF EXISTS `npc`;
CREATE TABLE `npc` (
  `id` smallint(5) unsigned NOT NULL,
  `idTemplate` smallint(5) unsigned NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `serverSideName` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(45) NOT NULL DEFAULT '',
  `serverSideTitle` tinyint(1) NOT NULL DEFAULT '0',
  `class` varchar(200) DEFAULT NULL,
  `collision_radius` decimal(6,2) DEFAULT NULL,
  `collision_height` decimal(6,2) DEFAULT NULL,
  `level` tinyint(2) DEFAULT NULL,
  `sex` enum('etc','female','male') NOT NULL DEFAULT 'etc',
  `type` varchar(22) DEFAULT NULL,
  `attackrange` smallint(4) DEFAULT NULL,
  `hp` decimal(30,15) DEFAULT NULL,
  `mp` decimal(30,15) DEFAULT NULL,
  `hpreg` decimal(30,15) DEFAULT NULL,
  `mpreg` decimal(30,15) DEFAULT NULL,
  `str` tinyint(2) NOT NULL DEFAULT '40',
  `con` tinyint(2) NOT NULL DEFAULT '43',
  `dex` tinyint(2) NOT NULL DEFAULT '30',
  `int` tinyint(2) NOT NULL DEFAULT '21',
  `wit` tinyint(2) NOT NULL DEFAULT '20',
  `men` tinyint(2) NOT NULL DEFAULT '20',
  `exp` int(9) NOT NULL DEFAULT '0',
  `sp` int(9) NOT NULL DEFAULT '0',
  `patk` decimal(12,5) DEFAULT NULL,
  `pdef` decimal(12,5) DEFAULT NULL,
  `matk` decimal(12,5) DEFAULT NULL,
  `mdef` decimal(12,5) DEFAULT NULL,
  `atkspd` smallint(4) NOT NULL DEFAULT '230',
  `critical` tinyint(1) NOT NULL DEFAULT '1',
  `matkspd` smallint(4) NOT NULL DEFAULT '333',
  `rhand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lhand` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enchant` tinyint(1) NOT NULL DEFAULT '0',
  `walkspd` decimal(10,5) NOT NULL DEFAULT '60.00000',
  `runspd` decimal(10,5) NOT NULL DEFAULT '120.00000',
  `dropHerbGroup` tinyint(1) NOT NULL DEFAULT '0',
  `basestats` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`idTemplate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npcaidata
-- ----------------------------
DROP TABLE IF EXISTS `npcaidata`;
CREATE TABLE `npcaidata` (
  `npcId` smallint(5) unsigned NOT NULL,
  `minSkillChance` tinyint(3) unsigned NOT NULL DEFAULT '7',
  `maxSkillChance` tinyint(3) unsigned NOT NULL DEFAULT '15',
  `primarySkillId` smallint(5) unsigned DEFAULT '0',
  `agroRange` smallint(4) unsigned NOT NULL DEFAULT '0',
  `canMove` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `targetable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showName` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `minRangeSkill` smallint(5) unsigned DEFAULT '0',
  `minRangeChance` tinyint(3) unsigned DEFAULT '0',
  `maxRangeSkill` smallint(5) unsigned DEFAULT '0',
  `maxRangeChance` tinyint(3) unsigned DEFAULT '0',
  `soulShot` smallint(4) unsigned DEFAULT '0',
  `spiritShot` smallint(4) unsigned DEFAULT '0',
  `spsChance` tinyint(3) unsigned DEFAULT '0',
  `ssChance` tinyint(3) unsigned DEFAULT '0',
  `aggro` smallint(4) unsigned NOT NULL DEFAULT '0',
  `isChaos` smallint(4) unsigned DEFAULT '0',
  `clan` varchar(40) DEFAULT NULL,
  `clanRange` smallint(4) unsigned DEFAULT '0',
  `enemyClan` varchar(40) DEFAULT NULL,
  `enemyRange` smallint(4) unsigned DEFAULT '0',
  `dodge` tinyint(3) unsigned DEFAULT '0',
  `aiType` varchar(8) NOT NULL DEFAULT 'fighter',
  PRIMARY KEY (`npcId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npcskills
-- ----------------------------
DROP TABLE IF EXISTS `npcskills`;
CREATE TABLE `npcskills` (
  `npcid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `skillid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npcid`,`skillid`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_buffer
-- ----------------------------
DROP TABLE IF EXISTS `npc_buffer`;
CREATE TABLE `npc_buffer` (
  `npc_id` int(6) NOT NULL,
  `skill_id` int(6) NOT NULL,
  `skill_level` int(6) NOT NULL DEFAULT '1',
  `skill_fee_id` int(6) NOT NULL DEFAULT '0',
  `skill_fee_amount` int(6) NOT NULL DEFAULT '0',
  `buff_group` int(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_id`,`skill_id`,`buff_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_elementals
-- ----------------------------
DROP TABLE IF EXISTS `npc_elementals`;
CREATE TABLE `npc_elementals` (
  `npc_id` smallint(5) unsigned NOT NULL,
  `elemAtkType` tinyint(1) NOT NULL DEFAULT '-1',
  `elemAtkValue` int(3) NOT NULL DEFAULT '0',
  `fireDefValue` int(3) NOT NULL DEFAULT '0',
  `waterDefValue` int(3) NOT NULL DEFAULT '0',
  `windDefValue` int(3) NOT NULL DEFAULT '0',
  `earthDefValue` int(3) NOT NULL DEFAULT '0',
  `holyDefValue` int(3) NOT NULL DEFAULT '0',
  `darkDefValue` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for olympiad_data
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_data`;
CREATE TABLE `olympiad_data` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `current_cycle` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `olympiad_end` bigint(13) unsigned NOT NULL DEFAULT '0',
  `validation_end` bigint(13) unsigned NOT NULL DEFAULT '0',
  `next_weekly_change` bigint(13) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for olympiad_fights
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_fights`;
CREATE TABLE `olympiad_fights` (
  `charOneId` int(10) unsigned NOT NULL,
  `charTwoId` int(10) unsigned NOT NULL,
  `charOneClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `charTwoClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `winner` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `start` bigint(13) unsigned NOT NULL DEFAULT '0',
  `time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `classed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `charOneId` (`charOneId`),
  KEY `charTwoId` (`charTwoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for olympiad_nobles
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles`;
CREATE TABLE `olympiad_nobles` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `class_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `olympiad_points` int(10) unsigned NOT NULL DEFAULT '0',
  `competitions_done` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_won` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_lost` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_drawn` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_done_week` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_done_week_classed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_done_week_non_classed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_done_week_team` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for olympiad_nobles_eom
-- ----------------------------
DROP TABLE IF EXISTS `olympiad_nobles_eom`;
CREATE TABLE `olympiad_nobles_eom` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `class_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `olympiad_points` int(10) unsigned NOT NULL DEFAULT '0',
  `competitions_done` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_won` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_lost` smallint(3) unsigned NOT NULL DEFAULT '0',
  `competitions_drawn` smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for petition_feedback
-- ----------------------------
DROP TABLE IF EXISTS `petition_feedback`;
CREATE TABLE `petition_feedback` (
  `charName` varchar(35) NOT NULL,
  `gmName` varchar(35) NOT NULL,
  `rate` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `message` text NOT NULL,
  `date` bigint(13) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pets
-- ----------------------------
DROP TABLE IF EXISTS `pets`;
CREATE TABLE `pets` (
  `item_obj_id` int(10) unsigned NOT NULL,
  `name` varchar(16) DEFAULT NULL,
  `level` smallint(2) unsigned NOT NULL,
  `curHp` int(9) unsigned DEFAULT '0',
  `curMp` int(9) unsigned DEFAULT '0',
  `exp` bigint(20) unsigned DEFAULT '0',
  `sp` int(10) unsigned DEFAULT '0',
  `fed` int(10) unsigned DEFAULT '0',
  `ownerId` int(10) NOT NULL DEFAULT '0',
  `restore` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`item_obj_id`),
  KEY `ownerId` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pets_skills
-- ----------------------------
DROP TABLE IF EXISTS `pets_skills`;
CREATE TABLE `pets_skills` (
  `templateId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `minLvl` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `skillId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `skillLvl` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`templateId`,`skillId`,`skillLvl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `post_id` int(8) NOT NULL DEFAULT '0',
  `post_owner_name` varchar(255) NOT NULL DEFAULT '',
  `post_ownerid` int(8) NOT NULL DEFAULT '0',
  `post_date` bigint(13) unsigned NOT NULL DEFAULT '0',
  `post_topic_id` int(8) NOT NULL DEFAULT '0',
  `post_forum_id` int(8) NOT NULL DEFAULT '0',
  `post_txt` text NOT NULL,
  KEY `post_forum_id` (`post_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for punishments
-- ----------------------------
DROP TABLE IF EXISTS `punishments`;
CREATE TABLE `punishments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `affect` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL,
  `reason` text NOT NULL,
  `punishedBy` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quest_global_data
-- ----------------------------
DROP TABLE IF EXISTS `quest_global_data`;
CREATE TABLE `quest_global_data` (
  `quest_name` varchar(40) NOT NULL DEFAULT '',
  `var` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`quest_name`,`var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for raidboss_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `raidboss_spawnlist`;
CREATE TABLE `raidboss_spawnlist` (
  `boss_id` smallint(5) unsigned NOT NULL,
  `amount` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `loc_x` mediumint(6) NOT NULL,
  `loc_y` mediumint(6) NOT NULL,
  `loc_z` mediumint(6) NOT NULL,
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawn_delay` mediumint(6) unsigned NOT NULL DEFAULT '129600',
  `respawn_random` mediumint(6) unsigned NOT NULL DEFAULT '86400',
  `respawn_time` bigint(13) unsigned NOT NULL DEFAULT '0',
  `currentHp` decimal(8,0) DEFAULT NULL,
  `currentMp` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`boss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rainbowsprings_attacker_list
-- ----------------------------
DROP TABLE IF EXISTS `rainbowsprings_attacker_list`;
CREATE TABLE `rainbowsprings_attacker_list` (
  `clanId` int(10) DEFAULT NULL,
  `war_decrees_count` double(20,0) DEFAULT NULL,
  KEY `clanid` (`clanId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for random_spawn
-- ----------------------------
DROP TABLE IF EXISTS `random_spawn`;
CREATE TABLE `random_spawn` (
  `groupId` tinyint(3) unsigned NOT NULL,
  `npcId` smallint(5) unsigned NOT NULL,
  `count` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `initialDelay` int(8) NOT NULL DEFAULT '-1',
  `respawnDelay` int(8) NOT NULL DEFAULT '-1',
  `despawnDelay` int(8) NOT NULL DEFAULT '-1',
  `broadcastSpawn` enum('true','false') NOT NULL DEFAULT 'false',
  `randomSpawn` enum('true','false') NOT NULL DEFAULT 'true',
  PRIMARY KEY (`groupId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for random_spawn_loc
-- ----------------------------
DROP TABLE IF EXISTS `random_spawn_loc`;
CREATE TABLE `random_spawn_loc` (
  `groupId` tinyint(3) unsigned NOT NULL,
  `x` mediumint(6) NOT NULL,
  `y` mediumint(6) NOT NULL,
  `z` mediumint(6) NOT NULL,
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupId`,`x`,`y`,`z`,`heading`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for server_variables
-- ----------------------------
DROP TABLE IF EXISTS `server_variables`;
CREATE TABLE `server_variables` (
  `name` varchar(86) NOT NULL DEFAULT '',
  `value` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for seven_signs
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs`;
CREATE TABLE `seven_signs` (
  `charId` int(10) unsigned NOT NULL DEFAULT '0',
  `cabal` varchar(4) NOT NULL DEFAULT '',
  `seal` int(1) NOT NULL DEFAULT '0',
  `red_stones` int(11) NOT NULL DEFAULT '0',
  `green_stones` int(11) NOT NULL DEFAULT '0',
  `blue_stones` int(11) NOT NULL DEFAULT '0',
  `ancient_adena_amount` decimal(20,0) NOT NULL DEFAULT '0',
  `contribution_score` decimal(20,0) NOT NULL DEFAULT '0',
  PRIMARY KEY (`charId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seven_signs_festival
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs_festival`;
CREATE TABLE `seven_signs_festival` (
  `festivalId` int(1) NOT NULL DEFAULT '0',
  `cabal` varchar(4) NOT NULL DEFAULT '',
  `cycle` int(4) NOT NULL DEFAULT '0',
  `date` bigint(13) unsigned NOT NULL DEFAULT '0',
  `score` int(5) NOT NULL DEFAULT '0',
  `members` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`festivalId`,`cabal`,`cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for seven_signs_status
-- ----------------------------
DROP TABLE IF EXISTS `seven_signs_status`;
CREATE TABLE `seven_signs_status` (
  `id` int(3) NOT NULL DEFAULT '0',
  `current_cycle` int(10) NOT NULL DEFAULT '1',
  `festival_cycle` int(10) NOT NULL DEFAULT '1',
  `active_period` int(10) NOT NULL DEFAULT '1',
  `date` bigint(13) unsigned NOT NULL DEFAULT '0',
  `previous_winner` int(10) NOT NULL DEFAULT '0',
  `dawn_stone_score` decimal(20,0) NOT NULL DEFAULT '0',
  `dawn_festival_score` int(10) NOT NULL DEFAULT '0',
  `dusk_stone_score` decimal(20,0) NOT NULL DEFAULT '0',
  `dusk_festival_score` int(10) NOT NULL DEFAULT '0',
  `avarice_owner` int(10) NOT NULL DEFAULT '0',
  `gnosis_owner` int(10) NOT NULL DEFAULT '0',
  `strife_owner` int(10) NOT NULL DEFAULT '0',
  `avarice_dawn_score` int(10) NOT NULL DEFAULT '0',
  `gnosis_dawn_score` int(10) NOT NULL DEFAULT '0',
  `strife_dawn_score` int(10) NOT NULL DEFAULT '0',
  `avarice_dusk_score` int(10) NOT NULL DEFAULT '0',
  `gnosis_dusk_score` int(10) NOT NULL DEFAULT '0',
  `strife_dusk_score` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus0` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus1` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus2` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus3` int(10) NOT NULL DEFAULT '0',
  `accumulated_bonus4` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for siegable_clanhall
-- ----------------------------
DROP TABLE IF EXISTS `siegable_clanhall`;
CREATE TABLE `siegable_clanhall` (
  `clanHallId` int(10) NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `ownerId` int(10) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `nextSiege` bigint(20) DEFAULT NULL,
  `siegeLenght` int(10) DEFAULT NULL,
  `schedule_config` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`clanHallId`),
  KEY `ownerId` (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for siegable_hall_flagwar_attackers
-- ----------------------------
DROP TABLE IF EXISTS `siegable_hall_flagwar_attackers`;
CREATE TABLE `siegable_hall_flagwar_attackers` (
  `hall_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `flag` int(10) unsigned NOT NULL DEFAULT '0',
  `npc` int(10) unsigned NOT NULL DEFAULT '0',
  `clan_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`flag`),
  KEY `hall_id` (`hall_id`),
  KEY `clan_id` (`clan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for siegable_hall_flagwar_attackers_members
-- ----------------------------
DROP TABLE IF EXISTS `siegable_hall_flagwar_attackers_members`;
CREATE TABLE `siegable_hall_flagwar_attackers_members` (
  `hall_id` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `clan_id` int(10) unsigned NOT NULL DEFAULT '0',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `hall_id` (`hall_id`),
  KEY `clan_id` (`clan_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for siege_clans
-- ----------------------------
DROP TABLE IF EXISTS `siege_clans`;
CREATE TABLE `siege_clans` (
  `castle_id` int(1) NOT NULL DEFAULT '0',
  `clan_id` int(11) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT NULL,
  `castle_owner` int(1) DEFAULT NULL,
  PRIMARY KEY (`clan_id`,`castle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `spawnlist`;
CREATE TABLE `spawnlist` (
  `location` varchar(40) NOT NULL DEFAULT '',
  `count` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `npc_templateid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `locx` mediumint(6) NOT NULL DEFAULT '0',
  `locy` mediumint(6) NOT NULL DEFAULT '0',
  `locz` mediumint(6) NOT NULL DEFAULT '0',
  `randomx` mediumint(6) NOT NULL DEFAULT '0',
  `randomy` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `respawn_delay` mediumint(5) NOT NULL DEFAULT '0',
  `respawn_random` mediumint(5) NOT NULL DEFAULT '0',
  `loc_id` int(9) NOT NULL DEFAULT '0',
  `periodOfDay` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sunrise_buffs
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_buffs`;
CREATE TABLE `sunrise_buffs` (
  `category` varchar(20) NOT NULL,
  `buffId` int(5) NOT NULL,
  `level` tinyint(3) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`buffId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_configs
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_configs`;
CREATE TABLE `sunrise_configs` (
  `event` varchar(25) NOT NULL,
  `allowed` varchar(5) NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_eventorder
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_eventorder`;
CREATE TABLE `sunrise_eventorder` (
  `event` varchar(30) NOT NULL,
  `eventOrder` tinyint(5) NOT NULL,
  `chance` tinyint(5) NOT NULL,
  PRIMARY KEY (`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_globalconfigs
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_globalconfigs`;
CREATE TABLE `sunrise_globalconfigs` (
  `configType` varchar(20) NOT NULL,
  `key` varchar(30) NOT NULL,
  `desc` text,
  `value` varchar(255) NOT NULL DEFAULT '',
  `inputType` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_main_instances
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_main_instances`;
CREATE TABLE `sunrise_main_instances` (
  `event` varchar(25) NOT NULL,
  `id` tinyint(3) NOT NULL,
  `name` varchar(25) NOT NULL,
  `visible_name` varchar(30) NOT NULL,
  `params` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`event`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_maps
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_maps`;
CREATE TABLE `sunrise_maps` (
  `mapId` tinyint(5) NOT NULL DEFAULT '0',
  `mapName` varchar(25) NOT NULL,
  `eventType` varchar(70) NOT NULL,
  `configs` text,
  `description` text,
  PRIMARY KEY (`mapId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_modes
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_modes`;
CREATE TABLE `sunrise_modes` (
  `event` varchar(25) NOT NULL,
  `modeId` tinyint(3) NOT NULL,
  `name` varchar(25) NOT NULL,
  `visible_name` varchar(30) NOT NULL,
  `allowed` varchar(5) NOT NULL,
  `params` text NOT NULL,
  `disallowedMaps` text NOT NULL,
  `times` text NOT NULL,
  `npcId` mediumint(5) DEFAULT '0',
  PRIMARY KEY (`event`,`modeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_playerbuffs
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_playerbuffs`;
CREATE TABLE `sunrise_playerbuffs` (
  `playerId` int(15) NOT NULL,
  `scheme` varchar(25) NOT NULL,
  `buffs` varchar(230) NOT NULL,
  `active` tinyint(2) NOT NULL,
  PRIMARY KEY (`playerId`,`scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_playervalue_classes
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_playervalue_classes`;
CREATE TABLE `sunrise_playervalue_classes` (
  `classId` int(5) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_playervalue_items
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_playervalue_items`;
CREATE TABLE `sunrise_playervalue_items` (
  `itemId` int(11) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_playervalue_levels
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_playervalue_levels`;
CREATE TABLE `sunrise_playervalue_levels` (
  `level` tinyint(3) NOT NULL,
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_playervalue_skills
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_playervalue_skills`;
CREATE TABLE `sunrise_playervalue_skills` (
  `skillId` int(11) NOT NULL,
  `level` tinyint(3) NOT NULL DEFAULT '-1',
  `score` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`skillId`,`level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_rewards
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_rewards`;
CREATE TABLE `sunrise_rewards` (
  `eventType` varchar(25) NOT NULL,
  `modeId` tinyint(5) NOT NULL DEFAULT '1',
  `position` varchar(50) NOT NULL DEFAULT 'winner',
  `parameter` varchar(50) NOT NULL DEFAULT '',
  `item_id` decimal(11,0) NOT NULL DEFAULT '0',
  `min` int(10) NOT NULL DEFAULT '1',
  `max` int(10) NOT NULL DEFAULT '1',
  `chance` tinyint(3) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_scheduler_config
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_scheduler_config`;
CREATE TABLE `sunrise_scheduler_config` (
  `min_delay` int(5) NOT NULL,
  `max_delay` int(5) NOT NULL,
  `running_events` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_spawns
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_spawns`;
CREATE TABLE `sunrise_spawns` (
  `mapId` mediumint(10) NOT NULL,
  `spawnId` mediumint(10) NOT NULL,
  `x` int(10) NOT NULL,
  `y` int(10) DEFAULT NULL,
  `z` int(10) DEFAULT NULL,
  `teamId` tinyint(3) NOT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mapId`,`spawnId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_stats
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_stats`;
CREATE TABLE `sunrise_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `event` int(2) NOT NULL,
  `num` int(11) NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `scores` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_stats_full
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_stats_full`;
CREATE TABLE `sunrise_stats_full` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `winpercent` int(11) NOT NULL,
  `kdratio` double NOT NULL,
  `wins` int(11) NOT NULL,
  `losses` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `favevent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_stats_global
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_stats_global`;
CREATE TABLE `sunrise_stats_global` (
  `player` int(10) NOT NULL,
  `event` varchar(30) NOT NULL,
  `count_played` mediumint(20) NOT NULL,
  `wins` mediumint(20) NOT NULL,
  `loses` mediumint(20) NOT NULL,
  `kills` mediumint(20) NOT NULL,
  `deaths` mediumint(20) NOT NULL,
  `score` mediumint(20) NOT NULL,
  `mostPlayedEvent` varchar(30) NOT NULL,
  PRIMARY KEY (`player`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for sunrise_variables
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_variables`;
CREATE TABLE `sunrise_variables` (
  `obj_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(86) NOT NULL DEFAULT '0',
  `name` varchar(86) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `expire_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `prim` (`obj_id`,`type`,`name`),
  KEY `obj_id` (`obj_id`),
  KEY `type` (`type`),
  KEY `name` (`name`),
  KEY `expire_time` (`expire_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sunrise_warnings
-- ----------------------------
DROP TABLE IF EXISTS `sunrise_warnings`;
CREATE TABLE `sunrise_warnings` (
  `id` int(10) NOT NULL DEFAULT '0',
  `points` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for teleport
-- ----------------------------
DROP TABLE IF EXISTS `teleport`;
CREATE TABLE `teleport` (
  `Description` varchar(75) DEFAULT NULL,
  `id` mediumint(7) unsigned NOT NULL DEFAULT '0',
  `loc_x` mediumint(6) DEFAULT NULL,
  `loc_y` mediumint(6) DEFAULT NULL,
  `loc_z` mediumint(6) DEFAULT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `fornoble` tinyint(1) NOT NULL DEFAULT '0',
  `itemId` smallint(5) unsigned NOT NULL DEFAULT '57',
  PRIMARY KEY (`id`),
  KEY `itemId` (`itemId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for territories
-- ----------------------------
DROP TABLE IF EXISTS `territories`;
CREATE TABLE `territories` (
  `territoryId` int(11) NOT NULL DEFAULT '0',
  `castleId` int(11) NOT NULL DEFAULT '0',
  `fortId` int(11) NOT NULL DEFAULT '0',
  `ownedWardIds` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`territoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for territory_registrations
-- ----------------------------
DROP TABLE IF EXISTS `territory_registrations`;
CREATE TABLE `territory_registrations` (
  `castleId` int(1) NOT NULL DEFAULT '0',
  `registeredId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`castleId`,`registeredId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for territory_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `territory_spawnlist`;
CREATE TABLE `territory_spawnlist` (
  `castleId` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `npcId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `x` mediumint(6) NOT NULL DEFAULT '0',
  `y` mediumint(6) NOT NULL DEFAULT '0',
  `z` mediumint(6) NOT NULL DEFAULT '0',
  `heading` mediumint(6) NOT NULL DEFAULT '0',
  `spawnType` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`castleId`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(8) NOT NULL DEFAULT '0',
  `topic_forum_id` int(8) NOT NULL DEFAULT '0',
  `topic_name` varchar(255) NOT NULL DEFAULT '',
  `topic_date` bigint(13) unsigned NOT NULL DEFAULT '0',
  `topic_ownername` varchar(255) NOT NULL DEFAULT '0',
  `topic_ownerid` int(8) NOT NULL DEFAULT '0',
  `topic_type` int(8) NOT NULL DEFAULT '0',
  `topic_reply` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vanhalter_spawnlist
-- ----------------------------
DROP TABLE IF EXISTS `vanhalter_spawnlist`;
CREATE TABLE `vanhalter_spawnlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(40) NOT NULL DEFAULT '',
  `count` int(9) NOT NULL DEFAULT '0',
  `npc_templateid` int(9) NOT NULL DEFAULT '0',
  `locx` int(9) NOT NULL DEFAULT '0',
  `locy` int(9) NOT NULL DEFAULT '0',
  `locz` int(9) NOT NULL DEFAULT '0',
  `randomx` int(9) NOT NULL DEFAULT '0',
  `randomy` int(9) NOT NULL DEFAULT '0',
  `heading` int(9) NOT NULL DEFAULT '0',
  `respawn_delay` int(9) NOT NULL DEFAULT '0',
  `loc_id` int(9) NOT NULL DEFAULT '0',
  `periodOfDay` decimal(2,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `key_npc_templateid` (`npc_templateid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `value` char(100) NOT NULL DEFAULT '1',
  `value_type` tinyint(4) NOT NULL DEFAULT '1',
  `date_voted_website` bigint(10) DEFAULT '1',
  `date_take_reward_in_game` bigint(10) DEFAULT '1',
  `vote_count` int(3) DEFAULT '1',
  PRIMARY KEY (`value`,`value_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
