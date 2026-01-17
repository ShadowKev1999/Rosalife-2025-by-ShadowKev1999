-- Fehlende Tabellen für Rosalife 2025
-- Basierend auf den Fehlerlogs

-- Player Titles Table
CREATE TABLE IF NOT EXISTS `player_titles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `titleId` int(11) NOT NULL DEFAULT 0,
  `unlocked` tinyint(1) NOT NULL DEFAULT 0,
  `equipped` tinyint(1) NOT NULL DEFAULT 0,
  `unlocked_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_title` (`user_id`, `titleId`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Player Job Skills Table
CREATE TABLE IF NOT EXISTS `player_jobskills` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `jobId` int(11) NOT NULL DEFAULT 0,
  `skill_level` int(11) NOT NULL DEFAULT 0,
  `experience` int(11) NOT NULL DEFAULT 0,
  `jobs_completed` int(11) NOT NULL DEFAULT 0,
  `last_work` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_job` (`user_id`, `jobId`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Player Protocol Table
CREATE TABLE IF NOT EXISTS `player_protocol` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `action` varchar(64) NOT NULL DEFAULT 'login',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `userId` (`userId`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Server Timeline Table
CREATE TABLE IF NOT EXISTS `server_timeline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL DEFAULT -1,
  `tagId` int(11) NOT NULL DEFAULT 0,
  `description` varchar(255) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `userId` (`userId`),
  KEY `tagId` (`tagId`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Food Stood Table
CREATE TABLE IF NOT EXISTS `foodstood` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL DEFAULT '',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `PosA` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Owner` varchar(24) NOT NULL DEFAULT 'Staat',
  `Price` int(11) NOT NULL DEFAULT 0,
  `Locked` tinyint(1) NOT NULL DEFAULT 0,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Products` int(11) NOT NULL DEFAULT 0,
  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Furniture Model Table
CREATE TABLE IF NOT EXISTS `furniture_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `model` int(11) NOT NULL DEFAULT 0,
  `category` varchar(64) NOT NULL DEFAULT '',
  `price` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Player Objects Table
CREATE TABLE IF NOT EXISTS `player_objects` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `RotX` double NOT NULL DEFAULT 0,
  `RotY` double NOT NULL DEFAULT 0,
  `RotZ` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Robberies Table
CREATE TABLE IF NOT EXISTS `robberies` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT '',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `last_robbery` timestamp NULL DEFAULT NULL,
  `robbery_cooldown` int(11) NOT NULL DEFAULT 300,
  `max_reward` int(11) NOT NULL DEFAULT 5000,
  `min_reward` int(11) NOT NULL DEFAULT 1000,
  PRIMARY KEY (`ID`),
  KEY `type` (`type`),
  KEY `last_robbery` (`last_robbery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;


-- Job Infos Table (missing table)
CREATE TABLE IF NOT EXISTS jobinfos (
  ID int(11) NOT NULL AUTO_INCREMENT,
  Gehalt int(11) NOT NULL DEFAULT 0,
  EXP int(11) NOT NULL DEFAULT 0,
  JobName varchar(64) NOT NULL DEFAULT '',
  Beschreibung text DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Add missing columns to accounts table
ALTER TABLE ccounts 
ADD COLUMN IF NOT EXISTS PlayerObjects int(11) NOT NULL DEFAULT 0,
ADD COLUMN IF NOT EXISTS healthInsurance int(11) NOT NULL DEFAULT -1,
ADD COLUMN IF NOT EXISTS healthInsuranceTime int(11) NOT NULL DEFAULT 0;

