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

--
-- Table structure for table `mapping_objects`
--

CREATE TABLE IF NOT EXISTS `mapping_objects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) DEFAULT NULL,
  `X` DECIMAL(10,5) NOT NULL,
  `Y` DECIMAL(10,5) NOT NULL,
  `Z` DECIMAL(10,5) NOT NULL,
  `RX` DECIMAL(10,5) NOT NULL,
  `RY` DECIMAL(10,5) NOT NULL,
  `RZ` DECIMAL(10,5) NOT NULL,
  `worldid` int(11) NOT NULL,
  `interiorid` int(11) NOT NULL,
  `streamdistance` DECIMAL(10,5) NOT NULL,
  `drawdistance` DECIMAL(10,5) NOT NULL,
  `Material1` varchar(256) DEFAULT '|',
  `Material2` varchar(256) DEFAULT '|',
  `Material3` varchar(256) DEFAULT '|',
  `MaterialText` varchar(256) DEFAULT NULL,
  `kommentar` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `mapping_removes`
--

CREATE TABLE IF NOT EXISTS `mapping_removes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modelid` int(11) DEFAULT NULL,
  `centerX` DECIMAL(10,5) NOT NULL,
  `centerY` DECIMAL(10,5) NOT NULL,
  `centerZ` DECIMAL(10,5) NOT NULL,
  `radius` DECIMAL(10,5) NOT NULL,
  `kommentar` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_actors`
--

CREATE TABLE IF NOT EXISTS `server_actors` (
  `id` INT(12) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(24) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `a` FLOAT NOT NULL,
  `animation` INT(12) NOT NULL,
  `skin` INT(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `wood_trees`
--

CREATE TABLE IF NOT EXISTS `wood_trees` (
  `ID` INT(12) NOT NULL,
  `PosX` FLOAT NOT NULL,
  `PosY` FLOAT NOT NULL,
  `PosZ` FLOAT NOT NULL,
  `RotX` FLOAT NOT NULL,
  `RotY` FLOAT NOT NULL,
  `RotZ` FLOAT NOT NULL,
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `wood_buyers`
--

CREATE TABLE IF NOT EXISTS `wood_buyers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Skin` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosA` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `atms`
--

CREATE TABLE IF NOT EXISTS `atms` (
  `id` INT(12) NOT NULL,
  `x` FLOAT NOT NULL,
  `y` FLOAT NOT NULL,
  `z` FLOAT NOT NULL,
  `rx` FLOAT NOT NULL,
  `ry` FLOAT NOT NULL,
  `rz` FLOAT NOT NULL,
  `money` INT(12) NOT NULL,
  `state` INT(12) NOT NULL,
  `interior` INT(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_busroutes`
--

CREATE TABLE IF NOT EXISTS `server_busroutes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(16) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `skill` int(11) DEFAULT NULL,
  `bonusmoney` int(11) DEFAULT NULL,
  `jobexpbonus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `server_busroutes_cps`
--

CREATE TABLE IF NOT EXISTS `server_busroutes_cps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `busRoute` int(11) DEFAULT NULL,
  `checkpoint` varchar(256) DEFAULT '|',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `parties`
--

CREATE TABLE IF NOT EXISTS `parties` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `memberlimit` INT(11) NOT NULL,
  `vehiclelimit` INT(11) NOT NULL,
  `founder` VARCHAR(24) NOT NULL,
  `upgrades` VARCHAR(24) NOT NULL,
  `rankName1` VARCHAR(24) NOT NULL,
  `rankName2` VARCHAR(24) NOT NULL,
  `rankName3` VARCHAR(24) NOT NULL,
  `centralconfirmed` INT(11) NOT NULL,
  `centralpos` VARCHAR(24) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `housefurnitures`
--

CREATE TABLE IF NOT EXISTS `housefurnitures` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HouseID` int(11) NOT NULL,
  `FurnitureID` tinyint(11) NOT NULL,
  `FurnitureX` float NOT NULL,
  `FurnitureY` float NOT NULL,
  `FurnitureZ` float NOT NULL,
  `FurnitureRX` float NOT NULL,
  `FurnitureRY` float NOT NULL,
  `FurnitureRZ` float NOT NULL,
  `FurnitureVW` int(11) NOT NULL,
  `FurnitureInt` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `races`
--

CREATE TABLE IF NOT EXISTS `races` (
  `race` varchar(32) NOT NULL,
  `X1` float(10,4) NOT NULL, `Y1` float(10,4) NOT NULL, `Z1` float(10,4) NOT NULL,
  `X2` float(10,4) NOT NULL, `Y2` float(10,4) NOT NULL, `Z2` float(10,4) NOT NULL,
  `X3` float(10,4) NOT NULL, `Y3` float(10,4) NOT NULL, `Z3` float(10,4) NOT NULL,
  `X4` float(10,4) NOT NULL, `Y4` float(10,4) NOT NULL, `Z4` float(10,4) NOT NULL,
  `X5` float(10,4) NOT NULL, `Y5` float(10,4) NOT NULL, `Z5` float(10,4) NOT NULL,
  `X6` float(10,4) NOT NULL, `Y6` float(10,4) NOT NULL, `Z6` float(10,4) NOT NULL,
  `X7` float(10,4) NOT NULL, `Y7` float(10,4) NOT NULL, `Z7` float(10,4) NOT NULL,
  `X8` float(10,4) NOT NULL, `Y8` float(10,4) NOT NULL, `Z8` float(10,4) NOT NULL,
  `X9` float(10,4) NOT NULL, `Y9` float(10,4) NOT NULL, `Z9` float(10,4) NOT NULL,
  `X10` float(10,4) NOT NULL, `Y10` float(10,4) NOT NULL, `Z10` float(10,4) NOT NULL,
  `X11` float(10,4) NOT NULL, `Y11` float(10,4) NOT NULL, `Z11` float(10,4) NOT NULL,
  `X12` float(10,4) NOT NULL, `Y12` float(10,4) NOT NULL, `Z12` float(10,4) NOT NULL,
  `X13` float(10,4) NOT NULL, `Y13` float(10,4) NOT NULL, `Z13` float(10,4) NOT NULL,
  `X14` float(10,4) NOT NULL, `Y14` float(10,4) NOT NULL, `Z14` float(10,4) NOT NULL,
  `X15` float(10,4) NOT NULL, `Y15` float(10,4) NOT NULL, `Z15` float(10,4) NOT NULL,
  `X16` float(10,4) NOT NULL, `Y16` float(10,4) NOT NULL, `Z16` float(10,4) NOT NULL,
  `X17` float(10,4) NOT NULL, `Y17` float(10,4) NOT NULL, `Z17` float(10,4) NOT NULL,
  `X18` float(10,4) NOT NULL, `Y18` float(10,4) NOT NULL, `Z18` float(10,4) NOT NULL,
  `X19` float(10,4) NOT NULL, `Y19` float(10,4) NOT NULL, `Z19` float(10,4) NOT NULL,
  `X20` float(10,4) NOT NULL, `Y20` float(10,4) NOT NULL, `Z20` float(10,4) NOT NULL,
  `X21` float(10,4) NOT NULL, `Y21` float(10,4) NOT NULL, `Z21` float(10,4) NOT NULL,
  `X22` float(10,4) NOT NULL, `Y22` float(10,4) NOT NULL, `Z22` float(10,4) NOT NULL,
  `X23` float(10,4) NOT NULL, `Y23` float(10,4) NOT NULL, `Z23` float(10,4) NOT NULL,
  `X24` float(10,4) NOT NULL, `Y24` float(10,4) NOT NULL, `Z24` float(10,4) NOT NULL,
  `X25` float(10,4) NOT NULL, `Y25` float(10,4) NOT NULL, `Z25` float(10,4) NOT NULL,
  `X26` float(10,4) NOT NULL, `Y26` float(10,4) NOT NULL, `Z26` float(10,4) NOT NULL,
  `X27` float(10,4) NOT NULL, `Y27` float(10,4) NOT NULL, `Z27` float(10,4) NOT NULL,
  `X28` float(10,4) NOT NULL, `Y28` float(10,4) NOT NULL, `Z28` float(10,4) NOT NULL,
  `X29` float(10,4) NOT NULL, `Y29` float(10,4) NOT NULL, `Z29` float(10,4) NOT NULL,
  `X30` float(10,4) NOT NULL, `Y30` float(10,4) NOT NULL, `Z30` float(10,4) NOT NULL,
  `X31` float(10,4) NOT NULL, `Y31` float(10,4) NOT NULL, `Z31` float(10,4) NOT NULL,
  `X32` float(10,4) NOT NULL, `Y32` float(10,4) NOT NULL, `Z32` float(10,4) NOT NULL,
  `X33` float(10,4) NOT NULL, `Y33` float(10,4) NOT NULL, `Z33` float(10,4) NOT NULL,
  `X34` float(10,4) NOT NULL, `Y34` float(10,4) NOT NULL, `Z34` float(10,4) NOT NULL,
  `X35` float(10,4) NOT NULL, `Y35` float(10,4) NOT NULL, `Z35` float(10,4) NOT NULL,
  PRIMARY KEY (`race`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `serverlog_easter`
--

CREATE TABLE IF NOT EXISTS `serverlog_easter` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `content` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`logID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `eastereggs`
--

CREATE TABLE IF NOT EXISTS `eastereggs` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `model` int(12) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL DEFAULT '0.000',
  `ry` float NOT NULL DEFAULT '0.000',
  `rz` float NOT NULL DEFAULT '0.000',
  `lastPick` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `stores`
--

CREATE TABLE IF NOT EXISTS `stores` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Navi` int(11) NOT NULL DEFAULT 0,
  `Handy` int(11) NOT NULL DEFAULT 0,
  `Telefonbuch` int(11) NOT NULL DEFAULT 0,
  `Repairkit` int(11) NOT NULL DEFAULT 0,
  `Kamera` int(11) NOT NULL DEFAULT 0,
  `Pos_X` float NOT NULL DEFAULT 0,
  `Pos_Y` float NOT NULL DEFAULT 0,
  `Pos_Z` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `gruppen`
--

CREATE TABLE IF NOT EXISTS `gruppen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(32) NOT NULL,
  `Kennzeichen` varchar(32) NOT NULL,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `GehaltUpgrade` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `hauser`
--

CREATE TABLE IF NOT EXISTS `hauser` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Ort` int(11) NOT NULL DEFAULT 0,
  `Typ` int(11) NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `Locked` int(11) NOT NULL DEFAULT 0,
  `Mietbar` int(11) NOT NULL DEFAULT 0,
  `Miete` int(11) NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 0,
  `Pos_X` float NOT NULL DEFAULT 0,
  `Pos_Y` float NOT NULL DEFAULT 0,
  `Pos_Z` float NOT NULL DEFAULT 0,
  `IPos_X` float NOT NULL DEFAULT 0,
  `IPos_Y` float NOT NULL DEFAULT 0,
  `IPos_Z` float NOT NULL DEFAULT 0,
  `Gruppe` int(11) NOT NULL DEFAULT 0,
  `GruppenAnzeige` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `garagen`
--

CREATE TABLE IF NOT EXISTS `garagen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Ort` int(11) NOT NULL DEFAULT 0,
  `Locked` int(11) NOT NULL DEFAULT 0,
  `Mietbar` int(11) NOT NULL DEFAULT 0,
  `Miete` int(11) NOT NULL DEFAULT 0,
  `Pos_X` float NOT NULL DEFAULT 0,
  `Pos_Y` float NOT NULL DEFAULT 0,
  `Pos_Z` float NOT NULL DEFAULT 0,
  `OPos_X` float NOT NULL DEFAULT 0,
  `OPos_Y` float NOT NULL DEFAULT 0,
  `OPos_Z` float NOT NULL DEFAULT 0,
  `OPos_A` float NOT NULL DEFAULT 0,
  `Fahrzeug1` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug2` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug3` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug4` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug5` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug6` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug7` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug8` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug9` int(11) NOT NULL DEFAULT 0,
  `Fahrzeug10` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Table structure for table `tankstellen`
--

CREATE TABLE IF NOT EXISTS `tankstellen` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Beschreibung` varchar(64) DEFAULT NULL,
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Benzin` int(11) NOT NULL DEFAULT 0,
  `Benzin Preis` int(11) NOT NULL DEFAULT 0,
  `Diesel` int(11) NOT NULL DEFAULT 0,
  `Diesel Preis` int(11) NOT NULL DEFAULT 0,
  `Kerosin` int(11) NOT NULL DEFAULT 0,
  `Kerosin Preis` int(11) NOT NULL DEFAULT 0,
  `Benzin Liter` int(11) NOT NULL DEFAULT 0,
  `Diesel Liter` int(11) NOT NULL DEFAULT 0,
  `Kerosin Liter` int(11) NOT NULL DEFAULT 0,
  `TPos_X1` float NOT NULL DEFAULT 0,
  `TPos_Y1` float NOT NULL DEFAULT 0,
  `TPos_Z1` float NOT NULL DEFAULT 0,
  `TPos_X2` float NOT NULL DEFAULT 0,
  `TPos_Y2` float NOT NULL DEFAULT 0,
  `TPos_Z2` float NOT NULL DEFAULT 0,
  `EPos_X` float NOT NULL DEFAULT 0,
  `EPos_Y` float NOT NULL DEFAULT 0,
  `EPos_Z` float NOT NULL DEFAULT 0,
  `S_PosX` float NOT NULL DEFAULT 0,
  `S_PosY` float NOT NULL DEFAULT 0,
  `S_PosZ` float NOT NULL DEFAULT 0,
  `S_PosR` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

COMMIT;
