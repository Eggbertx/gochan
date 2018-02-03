-- Initial setup file for Gochan
-- Deleted after setup is finished

-- Turn off warnings in case tables are already there.
SET sql_notes=0;

CREATE TABLE IF NOT EXISTS `DBPREFIXannouncements` (
	`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`subject` VARCHAR(45) NOT NULL,
	`message` TEXT NOT NULL,
	`poster` VARCHAR(45) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXbanlist` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`allow_read` TINYINT(1) DEFAULT '1',
	`ip` VARCHAR(45) NOT NULL DEFAULT '',
	`name` VARCHAR(255) NOT NULL,
	`tripcode` CHAR(10) NOT NULL,
	`message` TEXT NOT NULL,
	`silent_ban` TINYINT(1) DEFAULT '0',
	`boards` VARCHAR(255) NOT NULL DEFAULT '*',
	`banned_by` VARCHAR(50) NOT NULL,
	`timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	`expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`reason` VARCHAR(255) NOT NULL,
	`staff_note` VARCHAR(255) NOT NULL,
	`appeal_message` VARCHAR(255) NOT NULL,
	`appeal_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXbannedhashes` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`checksum` VARCHAR(45) NOT NULL,
	`description` VARCHAR(45) NOT NULL,
	PRIMARY KEY(`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXboards` (
	`id` int UNSIGNED NOT NULL AUTO_INCREMENT,
	`order` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`dir` VARCHAR(45) NOT NULL,
	`type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`upload_type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`title` VARCHAR(45) NOT NULL,
	`subtitle` VARCHAR(64) NOT NULL DEFAULT '',
	`description` VARCHAR(64) NOT NULL DEFAULT '',
	`section` VARCHAR(45) NOT NULL,
	`max_image_size` INT UNSIGNED NOT NULL DEFAULT 4718592,
	`max_pages` TINYINT UNSIGNED NOT NULL DEFAULT 11,
	`locale` VARCHAR(10) NOT NULL DEFAULT 'en-us',
	`default_style` VARCHAR(45) NOT NULL,
	`locked` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`created_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`anonymous` VARCHAR(45) NOT NULL DEFAULT 'Anonymous',
	`forced_anon` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`max_age` INT(20) UNSIGNED NOT NULL DEFAULT 0,
	`autosage_after` INT(5) UNSIGNED NOT NULL DEFAULT 200,
	`no_images_after` INT(5) UNSIGNED NOT NULL DEFAULT 0,
	`max_message_length` INT(10) UNSIGNED NOT NULL DEFAULT 8192,
	`embeds_allowed` TINYINT(1) NOT NULL DEFAULT 1,
	`redirect_to_thread` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`require_file` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`enable_catalog` TINYINT(1) UNSIGNED NOT NULL DEFAULT 1,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `DBPREFIXembeds` (
	`id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`filetype` VARCHAR(3) NOT NULL,
	`name` VARCHAR(45) NOT NULL,
	`video_url` VARCHAR(255) NOT NULL,
	`width` SMALLINT UNSIGNED NOT NULL,
	`height` SMALLINT UNSIGNED NOT NULL,
	`embed_code` TEXT NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXfiletypes` (
	`id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`filetype` VARCHAR(10) NOT NULL,
	`mime` VARCHAR(45) NOT NULL,
	`thumb_image` VARCHAR(255) NOT NULL,
	`image_w` INT UNSIGNED NOT NULL DEFAULT 0,
	`image_h` INT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXfrontpage` (
	`id` SMALLINT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
	`page` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
	`order` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0,
	`subject` VARCHAR(140) NOT NULL,
	`message` TEXT NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`poster` VARCHAR(45) NOT NULL,
	`email` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXlinks` (
	`id` TINYINT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(45) NOT NULL,
	`url` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXloginattempts` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`ip` VARCHAR(45) NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXpluginsettings` (
	`module` CHAR(32) NOT NULL,
	`key` VARCHAR(200) NOT NULL DEFAULT '',
	`value` TEXT NOT NULL,
	PRIMARY KEY(`module`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXposts` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`boardid` INT NOT NULL,
	`parentid` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`name` VARCHAR(50) NOT NULL,
	`tripcode` CHAR(10) NOT NULL,
	`email` VARCHAR(50) NOT NULL,
	`subject` VARCHAR(100) NOT NULL,
	`message` TEXT NOT NULL,
	`message_raw` TEXT NOT NULL,
	`password` VARCHAR(45) NOT NULL,
	`filename` VARCHAR(45) NOT NULL DEFAULT '',
	`filename_original` VARCHAR(255) NOT NULL DEFAULT '',
	`file_checksum` VARCHAR(45) NOT NULL DEFAULT '',
	`filesize` INT(20) UNSIGNED NOT NULL DEFAULT 0,
	`image_w` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0,
	`image_h` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0,
	`thumb_w` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0,
	`thumb_h` SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0,
	`ip` VARCHAR(45) NOT NULL DEFAULT '',
	`tag` VARCHAR(5) NOT NULL DEFAULT '',
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`autosage` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`poster_authority` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`deleted_timestamp` TIMESTAMP,
	`bumped` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`stickied` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`locked` TINYINT(1) NOT NULL DEFAULT 0,
	`reviewed` TINYINT(1) NOT NULL DEFAULT 0,
	`sillytag` TINYINT(1) NOT NULL DEFAULT 0,
	PRIMARY KEY  (`boardid`,`id`),
	KEY `parentid` (`parentid`),
	KEY `bumped` (`bumped`),
	KEY `file_checksum` (`file_checksum`),
	KEY `stickied` (`stickied`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `DBPREFIXreports` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`board` VARCHAR(45) NOT NULL,
	`postid` INT(10) UNSIGNED NOT NULL,
	`timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`ip` VARCHAR(45) NOT NULL,
	`reason` VARCHAR(255) NOT NULL,
	`cleared` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	`istemp` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXsections` (
	`id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`order` TINYINT UNSIGNED NOT NULL DEFAULT 0,
	`hidden` TINYINT(1) UNSIGNED NOT NULL,
	`name` VARCHAR(45) NOT NULL,
	`abbreviation` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXsessions` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`key` CHAR(10) NOT NULL,
	`data` VARCHAR(45) NOT NULL,
	`expires` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `DBPREFIXstaff` (
	`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(45) NOT NULL,
	`password_checksum` VARCHAR(120) NOT NULL,
	`salt` CHAR(3) NOT NULL,
	`rank` TINYINT(1) UNSIGNED NOT NULL,
	`boards` VARCHAR(128) NOT NULL DEFAULT 'all',
	`added_on` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	`last_active` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

# create a temp table with the same columns as the posts table to be stored in memory
# This is currently not used, and commented out.
#CREATE TABLE IF NOT EXISTS `DBPREFIXtempposts` SELECT * FROM DBPREFIXposts;
#ALTER TABLE `DBPREFIXtempposts` CHANGE `message` `message` VARCHAR(1024);
#ALTER TABLE `DBPREFIXtempposts` ENGINE=MEMORY;

CREATE TABLE IF NOT EXISTS `DBPREFIXwordfilters` (
	`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
	`from` VARCHAR(75) NOT NULL,
	`to` VARCHAR(75) NOT NULL,
	`boards` TEXT NOT NULL,
	`regex` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

SET sql_notes=1;
