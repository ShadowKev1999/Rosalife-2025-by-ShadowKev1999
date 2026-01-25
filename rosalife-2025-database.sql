-- Rosalife-2025 Database Schema
-- Generated based on gamemode definitions

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `Connected` timestamp NOT NULL DEFAULT current_timestamp(),
  `ConnectIP` varchar(45) DEFAULT NULL,
  `ConnectGMX` int(11) NOT NULL DEFAULT 0,
  `Registerdatum` varchar(32) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `IP-Adresse` varchar(45) DEFAULT NULL,
  `Sicherheitscode` varchar(64) DEFAULT NULL,
  `Alter` int(11) DEFAULT NULL,
  `Geschlecht` int(11) NOT NULL DEFAULT 0,
  `Geburtsdatum` varchar(18) DEFAULT NULL,
  `Online` int(11) NOT NULL DEFAULT 0,
  `Admin` int(11) NOT NULL DEFAULT 0,
  `FV` int(11) NOT NULL DEFAULT 0,
  `PositionX` double NOT NULL DEFAULT 0,
  `PositionY` double NOT NULL DEFAULT 0,
  `PositionZ` double NOT NULL DEFAULT 0,
  `PositionA` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Tot_Y` double NOT NULL DEFAULT 0,
  `Tot_Z` double NOT NULL DEFAULT 0,
  `SkinID` int(11) NOT NULL DEFAULT 26,
  `KnastSkin` int(11) NOT NULL DEFAULT 62,
  `Stadt` int(11) NOT NULL DEFAULT 1,
  `Spawn` int(11) NOT NULL DEFAULT 0,
  `Fraktion` int(11) NOT NULL DEFAULT 0,
  `Leader` int(11) NOT NULL DEFAULT 0,
  `Rank` int(11) NOT NULL DEFAULT 0,
  `lVerbrechen` text DEFAULT NULL,
  `Wanteds` int(11) NOT NULL DEFAULT 0,
  `Knastzeit` int(11) NOT NULL DEFAULT 0,
  `Prison` int(11) NOT NULL DEFAULT 0,
  `PrisonCP` int(11) NOT NULL DEFAULT 0,
  `Zelle` int(11) NOT NULL DEFAULT 0,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `EXPNeeded` int(11) NOT NULL DEFAULT 400,
  `Level` int(11) NOT NULL DEFAULT 1,
  `Verwarnungen` int(11) NOT NULL DEFAULT 0,
  `Mutezeit` int(11) NOT NULL DEFAULT 0,
  `Badword` int(11) NOT NULL DEFAULT 0,
  `Bargeld` bigint(20) NOT NULL DEFAULT 3000,
  `AntiCheatGMX` int(11) NOT NULL DEFAULT 0,
  `Perso` int(11) NOT NULL DEFAULT 0,
  `Mission` int(11) NOT NULL DEFAULT 0,
  `MissionComplete` int(11) NOT NULL DEFAULT 0,
  `Startbonus` int(11) NOT NULL DEFAULT 0,
  `BankPIN` int(11) NOT NULL DEFAULT 0,
  `Bankkonto` bigint(20) NOT NULL DEFAULT 0,
  `Tankstelle` int(11) NOT NULL DEFAULT 0,
  `Ammunation` int(11) NOT NULL DEFAULT 0,
  `Store` int(11) NOT NULL DEFAULT 0,
  `Haus` int(11) NOT NULL DEFAULT 0,
  `Gruppenhaus` int(11) NOT NULL DEFAULT 0,
  `Mieter` int(11) NOT NULL DEFAULT 0,
  `Nebenjob` int(11) NOT NULL DEFAULT 0,
  `JobDuty` int(11) NOT NULL DEFAULT 0,
  `Stadtplan` int(11) NOT NULL DEFAULT 0,
  `Navi` int(11) NOT NULL DEFAULT 0,
  `Handy` int(11) NOT NULL DEFAULT 0,
  `HandyNummer` int(11) NOT NULL DEFAULT 0,
  `HandyGuthaben` int(11) NOT NULL DEFAULT 0,
  `Tutorial` int(11) NOT NULL DEFAULT 0,
  `ZweitKey` int(11) NOT NULL DEFAULT 0,
  `FischGewicht` int(11) NOT NULL DEFAULT 0,
  `VIP` int(11) NOT NULL DEFAULT 0,
  `VIPExpire` int(11) NOT NULL DEFAULT 0,
  `PlayTime` int(11) NOT NULL DEFAULT 0,
  `LastLogin` varchar(32) DEFAULT NULL,
  `ID_old` int(11),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `Online` (`Online`),
  KEY `Fraktion` (`Fraktion`),
  KEY `Admin` (`Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `vehicles`
--

CREATE TABLE IF NOT EXISTS `vehicles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DatabaseID` int(11) NOT NULL DEFAULT 0,
  `Model` int(11) NOT NULL DEFAULT 411,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `PosA` double NOT NULL DEFAULT 0,
  `Color1` int(11) NOT NULL DEFAULT 1,
  `Color2` int(11) NOT NULL DEFAULT 1,
  `Fraktion` int(11) NOT NULL DEFAULT 0,
  `Paintjob` int(11) NOT NULL DEFAULT -1,
  `Plate` varchar(12) NOT NULL DEFAULT 'ROSA2025',
  `Health` float NOT NULL DEFAULT 1000,
  `Fuel` float NOT NULL DEFAULT 100,
  `Locked` int(11) NOT NULL DEFAULT 1,
  `Impounded` int(11) NOT NULL DEFAULT 0,
  `Garage` int(11) NOT NULL DEFAULT 0,
  `Neon` int(11) NOT NULL DEFAULT 0,
  `NeonColor` varchar(12) NOT NULL DEFAULT '255,255,255',
  `Tuning` text DEFAULT NULL,
  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `Besitzer` (`Besitzer`),
  KEY `Fraktion` (`Fraktion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `houses`
--

CREATE TABLE IF NOT EXISTS `houses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Preis` int(11) NOT NULL DEFAULT 50000,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 1,
  `Miete` int(11) NOT NULL DEFAULT 0,
  `Mieter` varchar(24) DEFAULT NULL,
  `Mietzeit` int(11) NOT NULL DEFAULT 0,
  `Locked` int(11) NOT NULL DEFAULT 1,
  `Storage` text DEFAULT NULL,
  `Upgrade` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `Besitzer` (`Besitzer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `businesses`
--

CREATE TABLE IF NOT EXISTS `businesses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Name` varchar(64) NOT NULL DEFAULT 'Business',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Preis` int(11) NOT NULL DEFAULT 100000,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 1,
  `Typ` int(11) NOT NULL DEFAULT 0,
  `Products` int(11) NOT NULL DEFAULT 100,
  `MaxProducts` int(11) NOT NULL DEFAULT 500,
  `Storage` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Besitzer` (`Besitzer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `garages`
--

CREATE TABLE IF NOT EXISTS `garages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Preis` int(11) NOT NULL DEFAULT 25000,
  `Level` int(11) NOT NULL DEFAULT 1,
  `MaxVehicles` int(11) NOT NULL DEFAULT 2,
  `Locked` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `Besitzer` (`Besitzer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(64) NOT NULL,
  `Leader` varchar(24) NOT NULL,
  `Kasse` bigint(20) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 1,
  `MaxMembers` int(11) NOT NULL DEFAULT 10,
  `Created` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `Leader` (`Leader`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `group_members`
--

CREATE TABLE IF NOT EXISTS `group_members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `Member` varchar(24) NOT NULL,
  `Rank` int(11) NOT NULL DEFAULT 1,
  `Joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Member` (`Member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `licenses`
--

CREATE TABLE IF NOT EXISTS `licenses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Auto` int(11) NOT NULL DEFAULT 0,
  `Flug` int(11) NOT NULL DEFAULT 0,
  `LKW` int(11) NOT NULL DEFAULT 0,
  `Motorrad` int(11) NOT NULL DEFAULT 0,
  `Boot` int(11) NOT NULL DEFAULT 0,
  `Waffe` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `phone_contacts`
--

CREATE TABLE IF NOT EXISTS `phone_contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(24) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Number` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `phone_messages`
--

CREATE TABLE IF NOT EXISTS `phone_messages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Sender` varchar(24) NOT NULL,
  `Receiver` varchar(24) NOT NULL,
  `Message` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `Read` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `Sender` (`Sender`),
  KEY `Receiver` (`Receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(24) NOT NULL,
  `ItemName` varchar(64) NOT NULL,
  `ItemType` varchar(32) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT 1,
  `Value` int(11) NOT NULL DEFAULT 0,
  `Data` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`),
  KEY `ItemType` (`ItemType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `job_stats`
--

CREATE TABLE IF NOT EXISTS `job_stats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Job` int(11) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 1,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `TotalEarned` bigint(20) NOT NULL DEFAULT 0,
  `JobsCompleted` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_Job` (`Name`,`Job`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `atm_machines`
--

CREATE TABLE IF NOT EXISTS `atm_machines` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 100,
  `Defekt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `speed_cameras`
--

CREATE TABLE IF NOT EXISTS `speed_cameras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `SpeedLimit` int(11) NOT NULL DEFAULT 80,
  `Fine` int(11) NOT NULL DEFAULT 500,
  `Defekt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `admin_logs`
--

CREATE TABLE IF NOT EXISTS `admin_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Admin` varchar(24) NOT NULL,
  `Action` varchar(64) NOT NULL,
  `Target` varchar(24) DEFAULT NULL,
  `Reason` varchar(128) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `IP` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Admin` (`Admin`),
  KEY `Action` (`Action`),
  KEY `Timestamp` (`Timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_stats`
--

CREATE TABLE IF NOT EXISTS `server_stats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StatName` varchar(64) NOT NULL,
  `StatValue` bigint(20) NOT NULL DEFAULT 0,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StatName` (`StatName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `AchievementID` varchar(64) NOT NULL,
  `Description` varchar(128) NOT NULL,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `Completed` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_AchievementID` (`Name`,`AchievementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `faction_ranks`
--

CREATE TABLE IF NOT EXISTS `faction_ranks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fraktion` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `RankName` varchar(64) NOT NULL,
  `Pay` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Fraktion_Rank` (`Fraktion`,`Rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `faction_vehicles`
--

CREATE TABLE IF NOT EXISTS `faction_vehicles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fraktion` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `PosA` double NOT NULL DEFAULT 0,
  `Color1` int(11) NOT NULL DEFAULT 0,
  `Color2` int(11) NOT NULL DEFAULT 0,
  `Plate` varchar(12) NOT NULL DEFAULT '',
  `Health` float NOT NULL DEFAULT 1000,
  `Fuel` float NOT NULL DEFAULT 100,
  PRIMARY KEY (`ID`),
  KEY `Fraktion` (`Fraktion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_economy`
--

CREATE TABLE IF NOT EXISTS `server_economy` (
  `economyId` INT(12) NOT NULL,
  `value` INT(12) NOT NULL,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`economyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_enterexits`
--

CREATE TABLE IF NOT EXISTS `server_enterexits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Enter` varchar(256) DEFAULT '|',
  `Exit` varchar(256) DEFAULT '|',
  `Name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_pickups`
--

CREATE TABLE IF NOT EXISTS `server_pickups` (
  `id` INT(12) NOT NULL AUTO_INCREMENT,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `model` INT(12) NOT NULL,
  `world` INT(12) NOT NULL,
  `interior` INT(12) NOT NULL,
  `type` INT(12) NOT NULL,
  `text` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Dumping data for table `server_stats`
--

INSERT IGNORE INTO `server_stats` (`StatName`, `StatValue`) VALUES
('total_players', 0),
('total_money', 0),
('total_vehicles', 0),
('total_houses', 0),
('total_businesses', 0),
('server_uptime', 0);

--
-- Dumping data for table `faction_ranks`
--

INSERT IGNORE INTO `faction_ranks` (`Fraktion`, `Rank`, `RankName`, `Pay`) VALUES
(1, 1, 'Anwaerter', 100), (1, 2, 'Mitarbeiter', 200), (1, 3, 'Erfahrener Mitarbeiter', 300),
(1, 4, 'Abteilungsleiter', 400), (1, 5, 'Stellvertretender Leiter', 500), (1, 6, 'Leiter', 600),
(2, 1, 'Recruit', 200), (2, 2, 'Officer', 300), (2, 3, 'Sergeant', 400),
(2, 4, 'Lieutenant', 500), (2, 5, 'Captain', 600), (2, 6, 'Chief', 800);

COMMIT;
