-- Rosalife-2025 Database Schema
-- Created for Open.MP Server
-- MySQL/MariaDB Database Structure

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------
-- Database: rosalife2025
-- --------------------------------------------------------

-- Accounts Table
CREATE TABLE `accounts` (
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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name` (`Name`),
  KEY `Online` (`Online`),
  KEY `Fraktion` (`Fraktion`),
  KEY `Admin` (`Admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Account Bans Table
CREATE TABLE `accbans` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `Teammitglied` varchar(24) NOT NULL,
  `Bangrund` varchar(128) NOT NULL,
  `GPCI` varchar(128) NOT NULL DEFAULT '0',
  `Uhrzeit` varchar(16) NOT NULL,
  `Datum` varchar(16) NOT NULL,
  `BanType` enum('permanent','temporary') NOT NULL DEFAULT 'permanent',
  `BanTime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `Name` (`Name`),
  KEY `GPCI` (`GPCI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Vehicles Table
CREATE TABLE `vehicles` (
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

-- Houses Table
CREATE TABLE `houses` (
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

-- Businesses Table
CREATE TABLE `businesses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `Name` varchar(64) NOT NULL DEFAULT 'Geschäft',
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

-- Garages Table
CREATE TABLE `garages` (
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

-- Groups Table
CREATE TABLE `groups` (
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

-- Group Members Table
CREATE TABLE `group_members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `Member` varchar(24) NOT NULL,
  `Rank` int(11) NOT NULL DEFAULT 1,
  `Joined` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Member` (`Member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Group Houses Table
CREATE TABLE `group_houses` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Storage` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Licenses Table
CREATE TABLE `licenses` (
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

-- Phone Contacts Table
CREATE TABLE `phone_contacts` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Owner` varchar(24) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Number` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `Owner` (`Owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Phone Messages Table
CREATE TABLE `phone_messages` (
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

-- Items Table
CREATE TABLE `items` (
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

-- Job Stats Table
CREATE TABLE `job_stats` (
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

-- ATM Machines Table
CREATE TABLE `atm_machines` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 100,
  `Defekt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Speed Cameras Table
CREATE TABLE `speed_cameras` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `SpeedLimit` int(11) NOT NULL DEFAULT 80,
  `Fine` int(11) NOT NULL DEFAULT 500,
  `Defekt` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Mining System Table
CREATE TABLE `mining_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `OreType` varchar(32) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT 0,
  `LastMine` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_OreType` (`Name`,`OreType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Trees Table (for Lumberjack Job)
CREATE TABLE `trees` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 100,
  `RespawnTime` int(11) NOT NULL DEFAULT 300,
  `LastCut` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Log Buyers Table (for Lumberjack Job)
CREATE TABLE `log_buyers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Skin` int(11) NOT NULL DEFAULT 50,
  `PricePerLog` int(11) NOT NULL DEFAULT 50,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Electrician Jobs Table
CREATE TABLE `electrician_jobs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(32) NOT NULL,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Defekt` int(11) NOT NULL DEFAULT 1,
  `AssignedTo` varchar(24) DEFAULT NULL,
  `AssignedTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `AssignedTo` (`AssignedTo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Admin Logs Table
CREATE TABLE `admin_logs` (
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

-- Server Statistics Table
CREATE TABLE `server_stats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StatName` varchar(64) NOT NULL,
  `StatValue` bigint(20) NOT NULL DEFAULT 0,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `StatName` (`StatName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Achievements Table
CREATE TABLE `achievements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(24) NOT NULL,
  `AchievementID` varchar(64) NOT NULL,
  `Description` varchar(128) NOT NULL,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `Completed` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Name_AchievementID` (`Name`,`AchievementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Faction Ranks Table
CREATE TABLE `faction_ranks` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Fraktion` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `RankName` varchar(64) NOT NULL,
  `Pay` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Fraktion_Rank` (`Fraktion`,`Rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Faction Vehicles Table
CREATE TABLE `faction_vehicles` (
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

-- Insert default data
INSERT INTO `server_stats` (`StatName`, `StatValue`) VALUES
('total_players', 0),
('total_money', 0),
('total_vehicles', 0),
('total_houses', 0),
('total_businesses', 0),
('server_uptime', 0);

-- Insert default faction ranks
INSERT INTO `faction_ranks` (`Fraktion`, `Rank`, `RankName`, `Pay`) VALUES
(1, 1, 'Anwärter', 100),
(1, 2, 'Mitarbeiter', 200),
(1, 3, 'Erfahrener Mitarbeiter', 300),
(1, 4, 'Abteilungsleiter', 400),
(1, 5, 'Stellvertretender Leiter', 500),
(1, 6, 'Leiter', 600),
(2, 1, 'Recruit', 200),
(2, 2, 'Officer', 300),
(2, 3, 'Sergeant', 400),
(2, 4, 'Lieutenant', 500),
(2, 5, 'Captain', 600),
(2, 6, 'Chief', 800);

-- Add indexes for better performance
ALTER TABLE `accounts` ADD INDEX `Level` (`Level`);
ALTER TABLE `accounts` ADD INDEX `LastLogin` (`LastLogin`);
ALTER TABLE `vehicles` ADD INDEX `Model` (`Model`);
ALTER TABLE `vehicles` ADD INDEX `Created` (`Created`);
ALTER TABLE `houses` ADD INDEX `Preis` (`Preis`);
ALTER TABLE `businesses` ADD INDEX `Typ` (`Typ`);
ALTER TABLE `businesses` ADD INDEX `Preis` (`Preis`);
ALTER TABLE `admin_logs` ADD INDEX `Target` (`Target`);

-- Set foreign key constraints
ALTER TABLE `group_members` ADD CONSTRAINT `group_members_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`ID`) ON DELETE CASCADE;
ALTER TABLE `group_houses` ADD CONSTRAINT `group_houses_ibfk_1` FOREIGN KEY (`GroupID`) REFERENCES `groups` (`ID`) ON DELETE CASCADE;

COMMIT;
