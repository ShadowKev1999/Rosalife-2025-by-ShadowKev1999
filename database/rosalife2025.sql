-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 29. Jan 2026 um 10:09
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `rosalife2025`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accbans`
--

CREATE TABLE `accbans` (
  `id` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Grund` varchar(256) DEFAULT NULL,
  `Admin` varchar(24) DEFAULT NULL,
  `Datum` varchar(32) DEFAULT NULL,
  `Dauer` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
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
  `ID_old` int(11) DEFAULT NULL,
  `Datum` varchar(32) DEFAULT NULL,
  `Uhrzeit` varchar(32) DEFAULT NULL,
  `Team` int(11) NOT NULL DEFAULT 0,
  `QuitJob` int(11) NOT NULL DEFAULT 0,
  `Guthaben` int(11) NOT NULL DEFAULT 0,
  `Lotto1` int(11) NOT NULL DEFAULT 0,
  `Lotto2` int(11) NOT NULL DEFAULT 0,
  `Lotto3` int(11) NOT NULL DEFAULT 0,
  `Tagesbelohnung` int(11) NOT NULL DEFAULT 0,
  `LastTagesbelohnung` int(11) NOT NULL DEFAULT 0,
  `Mission1` int(11) NOT NULL DEFAULT 0,
  `Mission2` int(11) NOT NULL DEFAULT 0,
  `Mission3` int(11) NOT NULL DEFAULT 0,
  `Mission4` int(11) NOT NULL DEFAULT 0,
  `Mission5` int(11) NOT NULL DEFAULT 0,
  `Mission6` int(11) NOT NULL DEFAULT 0,
  `VictimBrille` int(11) NOT NULL DEFAULT 0,
  `VictimBrilleF` int(11) NOT NULL DEFAULT 0,
  `VictimCap` int(11) NOT NULL DEFAULT 0,
  `VictimCapF` int(11) NOT NULL DEFAULT 0,
  `VictimBandana` int(11) NOT NULL DEFAULT 0,
  `VictimBandanaF` int(11) NOT NULL DEFAULT 0,
  `PDSwat` int(11) NOT NULL DEFAULT 0,
  `BankAngelegt` int(11) NOT NULL DEFAULT 0,
  `BankAngelegtMoney` bigint(20) NOT NULL DEFAULT 0,
  `ICPCarlock` int(11) NOT NULL DEFAULT 0,
  `ICPFlock` int(11) NOT NULL DEFAULT 0,
  `ICPMotor` int(11) NOT NULL DEFAULT 0,
  `ICPLicht` int(11) NOT NULL DEFAULT 0,
  `AchivLeader` int(11) NOT NULL DEFAULT 0,
  `AchivMillion` int(11) NOT NULL DEFAULT 0,
  `AchivAuto` int(11) NOT NULL DEFAULT 0,
  `AchivJobGehalt` int(11) NOT NULL DEFAULT 0,
  `AchivFlugLic` int(11) NOT NULL DEFAULT 0,
  `AchivPfand` int(11) NOT NULL DEFAULT 0,
  `AchivVIP` int(11) NOT NULL DEFAULT 0,
  `AchivPaintball` int(11) NOT NULL DEFAULT 0,
  `AchivPerso` int(11) NOT NULL DEFAULT 0,
  `PlayerObjects` int(11) NOT NULL DEFAULT 0,
  `healthInsurance` int(11) NOT NULL DEFAULT -1,
  `healthInsuranceTime` int(11) NOT NULL DEFAULT 0,
  `Kampfstyle` int(11) NOT NULL DEFAULT 1,
  `Kongress` int(11) NOT NULL DEFAULT 0,
  `Senator` int(11) NOT NULL DEFAULT 0,
  `Kanister` int(11) NOT NULL DEFAULT 0,
  `PayBackCard` int(11) NOT NULL DEFAULT 0,
  `PayBackPunkte` int(11) NOT NULL DEFAULT 0,
  `LegBroken` int(11) NOT NULL DEFAULT 0,
  `Tot_X` double NOT NULL DEFAULT 0,
  `Tot_Int` int(11) NOT NULL DEFAULT 0,
  `Tot_World` int(11) NOT NULL DEFAULT 0,
  `Paket` int(11) NOT NULL DEFAULT 0,
  `PayDay` int(11) NOT NULL DEFAULT 0,
  `Handschellen` int(11) NOT NULL DEFAULT 0,
  `Fraksperre` int(11) NOT NULL DEFAULT 0,
  `icpNachrichten` int(11) NOT NULL DEFAULT 0,
  `icpHitsound` int(11) NOT NULL DEFAULT 0,
  `icpOChat` int(11) NOT NULL DEFAULT 0,
  `icpHandy` int(11) NOT NULL DEFAULT 1,
  `icpBlinker` int(11) NOT NULL DEFAULT 0,
  `stvoAutoschein` int(11) NOT NULL DEFAULT 0,
  `stvoMotorradschein` int(11) NOT NULL DEFAULT 0,
  `stvoFlugschein` int(11) NOT NULL DEFAULT 0,
  `stvoTruckschein` int(11) NOT NULL DEFAULT 0,
  `stvoBootschein` int(11) NOT NULL DEFAULT 0,
  `TicketsBearbeitet` int(11) NOT NULL DEFAULT 0,
  `PayDayGeld` bigint(20) NOT NULL DEFAULT 0,
  `TruckerSkill` int(11) NOT NULL DEFAULT 0,
  `PizzaboteSkill` int(11) NOT NULL DEFAULT 0,
  `KehrmaschinenSkill` int(11) NOT NULL DEFAULT 0,
  `PilotenSkill` int(11) NOT NULL DEFAULT 0,
  `BusfahrerSkill` int(11) NOT NULL DEFAULT 0,
  `MullmannSkill` int(11) NOT NULL DEFAULT 0,
  `GeldlieferSkill` int(11) NOT NULL DEFAULT 0,
  `Drogen` int(11) NOT NULL DEFAULT 0,
  `Contract` int(11) NOT NULL DEFAULT 0,
  `Gruppe` int(11) NOT NULL DEFAULT 0,
  `GLeader` int(11) NOT NULL DEFAULT 0,
  `GRank` int(11) NOT NULL DEFAULT 0,
  `Garage` int(11) NOT NULL DEFAULT 0,
  `GMieter` int(11) NOT NULL DEFAULT 0,
  `Materialien` int(11) NOT NULL DEFAULT 0,
  `Kurrier` int(11) NOT NULL DEFAULT 0,
  `Bombe` int(11) NOT NULL DEFAULT 0,
  `Pfandflaschen` int(11) NOT NULL DEFAULT 0,
  `Beutel` int(11) NOT NULL DEFAULT 0,
  `Helm` int(11) NOT NULL DEFAULT 0,
  `Kicks` int(11) NOT NULL DEFAULT 0,
  `Timebans` int(11) NOT NULL DEFAULT 0,
  `Prisons` int(11) NOT NULL DEFAULT 0,
  `Feuerzeug` int(11) NOT NULL DEFAULT 0,
  `Obstkorb` int(11) NOT NULL DEFAULT 0,
  `Orangen` int(11) NOT NULL DEFAULT 0,
  `Wiederbeleben` int(11) NOT NULL DEFAULT 0,
  `wpSlot1` int(11) NOT NULL DEFAULT 0,
  `wpSlot2` int(11) NOT NULL DEFAULT 0,
  `wpSlot3` int(11) NOT NULL DEFAULT 0,
  `wpSlot4` int(11) NOT NULL DEFAULT 0,
  `wpSlot5` int(11) NOT NULL DEFAULT 0,
  `wpSlot6` int(11) NOT NULL DEFAULT 0,
  `wpSlot7` int(11) NOT NULL DEFAULT 0,
  `wpSlot8` int(11) NOT NULL DEFAULT 0,
  `wpSlot9` int(11) NOT NULL DEFAULT 0,
  `wpSlot10` int(11) NOT NULL DEFAULT 0,
  `wpSlot11` int(11) NOT NULL DEFAULT 0,
  `wpSlot12` int(11) NOT NULL DEFAULT 0,
  `wpSlot1Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot2Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot3Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot4Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot5Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot6Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot7Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot8Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot9Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot10Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot11Ammu` int(11) NOT NULL DEFAULT 0,
  `wpSlot12Ammu` int(11) NOT NULL DEFAULT 0,
  `WerbungSperre` int(11) NOT NULL DEFAULT 0,
  `Autoschein` int(11) NOT NULL DEFAULT 0,
  `Bootschein` int(11) NOT NULL DEFAULT 0,
  `Waffenschein` int(11) NOT NULL DEFAULT 0,
  `Flugschein` int(11) NOT NULL DEFAULT 0,
  `LKWschein` int(11) NOT NULL DEFAULT 0,
  `Motorradschein` int(11) NOT NULL DEFAULT 0,
  `Telefonbuch` int(11) NOT NULL DEFAULT 0,
  `Krankenhaus` int(11) NOT NULL DEFAULT 0,
  `Repairkit` int(11) NOT NULL DEFAULT 0,
  `PBKills` int(11) NOT NULL DEFAULT 0,
  `PBTode` int(11) NOT NULL DEFAULT 0,
  `icpCamera` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accplaytime`
--

CREATE TABLE `accplaytime` (
  `id` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `PlayedTime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievements`
--

CREATE TABLE `achievements` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `AchievementID` varchar(64) NOT NULL,
  `Description` varchar(128) NOT NULL,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `Completed` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `admin_logs`
--

CREATE TABLE `admin_logs` (
  `ID` int(11) NOT NULL,
  `Admin` varchar(24) NOT NULL,
  `Action` varchar(64) NOT NULL,
  `Target` varchar(24) DEFAULT NULL,
  `Reason` varchar(128) DEFAULT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `IP` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airdroppos`
--

CREATE TABLE `airdroppos` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `lastPick` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `airdroppos`
--

INSERT INTO `airdroppos` (`id`, `posX`, `posY`, `posZ`, `lastPick`) VALUES
(1, 2000, -1500, 20, '2026-01-29 05:33:56'),
(2, 1500, -2000, 15, '2026-01-29 05:33:56'),
(3, 1000, -2500, 25, '2026-01-29 05:33:56'),
(4, 2500, -1000, 30, '2026-01-29 05:33:56'),
(5, 3000, -2000, 18, '2026-01-29 05:33:56');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `allgemein`
--

CREATE TABLE `allgemein` (
  `ServerID` int(11) NOT NULL DEFAULT 1,
  `Rekord` int(11) NOT NULL DEFAULT 0,
  `WinterMode` int(11) NOT NULL DEFAULT 0,
  `DoubleEXP` int(11) NOT NULL DEFAULT 0,
  `EasterEvent` int(11) NOT NULL DEFAULT 0,
  `HalloweenEvent` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `allgemein`
--

INSERT INTO `allgemein` (`ServerID`, `Rekord`, `WinterMode`, `DoubleEXP`, `EasterEvent`, `HalloweenEvent`) VALUES
(1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ammunation`
--

CREATE TABLE `ammunation` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atms`
--

CREATE TABLE `atms` (
  `id` int(12) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `ry` float NOT NULL,
  `rz` float NOT NULL,
  `money` int(12) NOT NULL,
  `state` int(12) NOT NULL,
  `interior` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `atm_machines`
--

CREATE TABLE `atm_machines` (
  `ID` int(11) NOT NULL,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 100,
  `Defekt` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blitzer`
--

CREATE TABLE `blitzer` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `SpeedLimit` int(11) NOT NULL DEFAULT 50,
  `Fine` int(11) NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `businesses`
--

CREATE TABLE `businesses` (
  `ID` int(11) NOT NULL,
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
  `Storage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carinfos`
--

CREATE TABLE `carinfos` (
  `ModelID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Tank` int(11) NOT NULL DEFAULT 100,
  `TankArt` int(11) NOT NULL DEFAULT 1,
  `Verbrauch` float NOT NULL DEFAULT 8.5,
  `Liter` int(11) NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `carinfos`
--

INSERT INTO `carinfos` (`ModelID`, `Name`, `Preis`, `Tank`, `TankArt`, `Verbrauch`, `Liter`) VALUES
(400, 'Landstalker', 35000, 100, 1, 12.5, 65),
(401, 'Bravura', 22000, 100, 1, 8.5, 45),
(402, 'Buffalo', 28000, 100, 1, 11.2, 55),
(403, 'Linerunner', 45000, 100, 1, 15.8, 80),
(404, 'Perennial', 18000, 100, 1, 7.8, 40),
(405, 'Sentinel', 32000, 100, 1, 10.5, 50),
(406, 'Dumper', 75000, 100, 1, 25, 120),
(407, 'Fire Truck', 85000, 100, 1, 22, 100),
(408, 'Trashmaster', 55000, 100, 1, 18.5, 90),
(409, 'Stretch', 120000, 100, 1, 14.2, 75),
(410, 'Manana', 15000, 100, 1, 6.8, 35),
(411, 'Infernus', 95000, 100, 1, 13.8, 60),
(412, 'Voodoo', 25000, 100, 1, 9.2, 45),
(413, 'Pony', 20000, 100, 1, 8.8, 40),
(414, 'Mule', 35000, 100, 1, 16.5, 85),
(415, 'Cheetah', 105000, 100, 1, 14.5, 65),
(416, 'Ambulance', 60000, 100, 1, 12.8, 70),
(417, 'Leviathan', 45000, 100, 1, 20.5, 110),
(418, 'Moonbeam', 28000, 100, 1, 10.2, 55),
(419, 'Esperanto', 30000, 100, 1, 11.5, 58),
(420, 'Taxi', 22000, 100, 1, 9.8, 48),
(421, 'Washington', 38000, 100, 1, 10.8, 52),
(422, 'Bobcat', 26000, 100, 1, 9.5, 42),
(423, 'Mr. Whoopee', 15000, 100, 1, 8.2, 38),
(424, 'BF Injection', 18000, 100, 1, 7.5, 35),
(425, 'Hunter', 150000, 100, 1, 35, 150),
(426, 'Premier', 34000, 100, 1, 10.2, 50),
(427, 'Enforcer', 65000, 100, 1, 15.2, 80),
(428, 'Securicar', 42000, 100, 1, 13.8, 75),
(429, 'Banshee', 85000, 100, 1, 12.8, 60),
(430, 'Predator', 55000, 100, 1, 18.5, 95),
(431, 'Bus', 70000, 100, 1, 22.5, 120),
(432, 'Rhino', 200000, 100, 1, 45, 200),
(433, 'Barracks', 80000, 100, 1, 25.5, 130),
(434, 'Hotknife', 35000, 100, 1, 8.8, 40),
(435, 'Article Trailer', 5000, 100, 1, 0, 0),
(436, 'Previon', 28000, 100, 1, 9.2, 45),
(437, 'Coach', 75000, 100, 1, 24.5, 125),
(438, 'Cabbie', 20000, 100, 1, 9.5, 48),
(439, 'Stallion', 24000, 100, 1, 10.8, 52),
(440, 'Rumpo', 32000, 100, 1, 12.5, 65),
(441, 'RC Bandit', 5000, 100, 1, 2.5, 15),
(442, 'Romero', 18000, 100, 1, 11.2, 58),
(443, 'Packer', 60000, 100, 1, 28.5, 140),
(444, 'Monster A', 45000, 100, 1, 22.8, 110),
(445, 'Admiral', 36000, 100, 1, 10.5, 50),
(446, 'Squalo', 42000, 100, 1, 15.8, 75),
(447, 'Seasparrow', 55000, 100, 1, 18.2, 85),
(448, 'PCJ-600', 8500, 100, 2, 4.2, 12),
(449, 'Faggio', 6200, 100, 2, 3.8, 8),
(450, 'Freeway', 9800, 100, 2, 4.5, 14),
(451, 'Sanchez', 7500, 100, 2, 3.5, 10),
(452, 'Pizza Boy', 5500, 100, 2, 3.2, 8),
(453, 'Police Maverick', 65000, 100, 1, 16.5, 85),
(454, 'Enforcer', 65000, 100, 1, 15.2, 80),
(455, 'Securicar', 42000, 100, 1, 13.8, 75),
(456, 'Buster', 25000, 100, 1, 12.5, 65),
(457, 'Flatbed', 55000, 100, 1, 28.5, 140),
(458, 'Yankee', 48000, 100, 1, 22.5, 115),
(459, 'Caddy', 8000, 100, 1, 6.5, 25),
(460, 'Glendale', 22000, 100, 1, 9.8, 48),
(461, 'Oceanic', 28000, 100, 1, 10.2, 52),
(462, 'PCJ-600', 8500, 100, 2, 4.2, 12),
(463, 'Faggio', 6200, 100, 2, 3.8, 8),
(464, 'Sanchez', 7500, 100, 2, 3.5, 10),
(465, 'Landstalker', 35000, 100, 1, 12.5, 65),
(466, 'Blade', 32000, 100, 1, 11.8, 58),
(467, 'Stafford', 42000, 100, 1, 10.8, 52),
(468, 'Sabre', 30000, 100, 1, 11.2, 55),
(469, 'ZR-350', 38000, 100, 1, 12.8, 60),
(470, 'Walton', 18000, 100, 1, 8.8, 42),
(471, 'Regina', 16000, 100, 1, 8.5, 40),
(472, 'Comet', 45000, 100, 1, 11.5, 56),
(473, 'Burrito', 28000, 100, 1, 11.8, 62),
(474, 'Camper', 32000, 100, 1, 13.5, 70),
(475, 'Marquis', 35000, 100, 1, 18.5, 90),
(476, 'Baggage', 12000, 100, 1, 9.2, 45),
(477, 'Cuban Hermes', 22000, 100, 1, 10.5, 50),
(478, 'Boxville', 26000, 100, 1, 14.5, 75),
(479, 'Benson', 38000, 100, 1, 16.8, 85),
(480, 'Mesa', 24000, 100, 1, 10.2, 48),
(481, 'Rancher', 28000, 100, 1, 11.5, 55),
(482, 'FBI Rancher', 45000, 100, 1, 12.8, 60),
(483, 'Virgo', 26000, 100, 1, 10.8, 52),
(484, 'Greenwood', 22000, 100, 1, 9.8, 48),
(485, 'Sandking', 42000, 100, 1, 15.5, 75),
(486, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(487, 'Maverick', 58000, 100, 1, 16.5, 85),
(488, 'News Chopper', 75000, 100, 1, 18.5, 95),
(489, 'Rancher', 28000, 100, 1, 11.5, 55),
(490, 'FBI Truck', 65000, 100, 1, 20.5, 100),
(491, 'Virgo', 26000, 100, 1, 10.8, 52),
(492, 'Greenwood', 22000, 100, 1, 9.8, 48),
(493, 'Jetmax', 35000, 100, 1, 15.8, 80),
(494, 'Hotring Racer', 45000, 100, 1, 12.8, 65),
(495, 'Sandking', 42000, 100, 1, 15.5, 75),
(496, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(497, 'Police Maverick', 65000, 100, 1, 16.5, 85),
(498, 'Boxville', 26000, 100, 1, 14.5, 75),
(499, 'Benson', 38000, 100, 1, 16.8, 85),
(500, 'Mesa', 24000, 100, 1, 10.2, 48),
(501, 'Rancher', 28000, 100, 1, 11.5, 55),
(502, 'FBI Rancher', 45000, 100, 1, 12.8, 60),
(503, 'Virgo', 26000, 100, 1, 10.8, 52),
(504, 'Greenwood', 22000, 100, 1, 9.8, 48),
(505, 'Sandking', 42000, 100, 1, 15.5, 75),
(506, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(507, 'Maverick', 58000, 100, 1, 16.5, 85),
(508, 'News Chopper', 75000, 100, 1, 18.5, 95),
(509, 'Rancher', 28000, 100, 1, 11.5, 55),
(510, 'FBI Truck', 65000, 100, 1, 20.5, 100),
(511, 'Virgo', 26000, 100, 1, 10.8, 52),
(512, 'Greenwood', 22000, 100, 1, 9.8, 48),
(513, 'Jetmax', 35000, 100, 1, 15.8, 80),
(514, 'Hotring Racer', 45000, 100, 1, 12.8, 65),
(515, 'Sandking', 42000, 100, 1, 15.5, 75),
(516, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(517, 'Police Maverick', 65000, 100, 1, 16.5, 85),
(518, 'Boxville', 26000, 100, 1, 14.5, 75),
(519, 'Benson', 38000, 100, 1, 16.8, 85),
(520, 'Mesa', 24000, 100, 1, 10.2, 48),
(521, 'Faggio', 6200, 100, 2, 3.8, 8),
(522, 'Sanchez', 7500, 100, 2, 3.5, 10),
(523, 'Freeway', 9800, 100, 2, 4.5, 14),
(524, 'RC Baron', 5000, 100, 1, 2.8, 18),
(525, 'RC Raider', 5000, 100, 1, 2.8, 18),
(526, 'RC Goblin', 5000, 100, 1, 2.5, 15),
(527, 'RC Tiger', 5000, 100, 1, 2.2, 12),
(528, 'Combine Harvester', 75000, 100, 1, 35.5, 180),
(529, 'Dodo', 45000, 100, 1, 25.8, 130),
(530, 'Cement Truck', 65000, 100, 1, 32.5, 160),
(531, 'Tow Truck', 35000, 100, 1, 14.8, 75),
(532, 'Fortune', 28000, 100, 1, 10.5, 52),
(533, 'Cadrona', 16000, 100, 1, 8.2, 40),
(534, 'FBI Truck', 65000, 100, 1, 20.5, 100),
(535, 'Willard', 20000, 100, 1, 9.5, 45),
(536, 'Forklift', 12000, 100, 1, 6.8, 30),
(537, 'Tractor', 18000, 100, 1, 12.5, 60),
(538, 'Combine Harvester', 75000, 100, 1, 35.5, 180),
(539, 'Feltzer', 32000, 100, 1, 10.8, 52),
(540, 'Remington', 30000, 100, 1, 11.2, 55),
(541, 'Slamvan', 28000, 100, 1, 12.5, 60),
(542, 'Blade', 32000, 100, 1, 11.8, 58),
(543, 'Freeway', 9800, 100, 2, 4.5, 14),
(544, 'Sanchez', 7500, 100, 2, 3.5, 10),
(545, 'Savanna', 26000, 100, 1, 10.8, 52),
(546, 'Bandito', 8500, 100, 1, 7.5, 35),
(547, 'Kart', 3500, 100, 1, 3.2, 12),
(548, 'Mower', 4000, 100, 1, 2.8, 10),
(549, 'Dune', 22000, 100, 1, 15.8, 80),
(550, 'Rancher', 28000, 100, 1, 11.5, 55),
(551, 'Romero', 18000, 100, 1, 11.2, 58),
(552, 'Speeder', 42000, 100, 1, 15.8, 75),
(553, 'Reefer', 38000, 100, 1, 18.5, 90),
(554, 'Tropic', 45000, 100, 1, 16.8, 85),
(555, 'Flatbed', 55000, 100, 1, 28.5, 140),
(556, 'Yankee', 48000, 100, 1, 22.5, 115),
(557, 'Caddy', 8000, 100, 1, 6.5, 25),
(558, 'Solair', 24000, 100, 1, 10.2, 48),
(559, 'Berkley\'s RC Van', 15000, 100, 1, 8.8, 42),
(560, 'Squalo', 42000, 100, 1, 15.8, 75),
(561, 'Skimmer', 35000, 100, 1, 18.2, 85),
(562, 'PCJ-600', 8500, 100, 2, 4.2, 12),
(563, 'Faggio', 6200, 100, 2, 3.8, 8),
(564, 'Freeway', 9800, 100, 2, 4.5, 14),
(565, 'RC Baron', 5000, 100, 1, 2.8, 18),
(566, 'RC Raider', 5000, 100, 1, 2.8, 18),
(567, 'Glendale', 22000, 100, 1, 9.8, 48),
(568, 'Oceanic', 28000, 100, 1, 10.2, 52),
(569, 'Sanchez', 7500, 100, 2, 3.5, 10),
(570, 'Sparrow', 55000, 100, 1, 16.5, 80),
(571, 'Patriot', 45000, 100, 1, 13.8, 70),
(572, 'Quad', 6500, 100, 2, 4.8, 15),
(573, 'Coastguard', 38000, 100, 1, 15.8, 75),
(574, 'Dinghy', 12000, 100, 1, 8.5, 40),
(575, 'Hermes', 18000, 100, 1, 10.5, 50),
(576, 'Sabre', 30000, 100, 1, 11.2, 55),
(577, 'ZR-350', 38000, 100, 1, 12.8, 60),
(578, 'Walton', 18000, 100, 1, 8.8, 42),
(579, 'Regina', 16000, 100, 1, 8.5, 40),
(580, 'Comet', 45000, 100, 1, 11.5, 56),
(581, 'Burrito', 28000, 100, 1, 11.8, 62),
(582, 'Camper', 32000, 100, 1, 13.5, 70),
(583, 'Marquis', 35000, 100, 1, 18.5, 90),
(584, 'Baggage', 12000, 100, 1, 9.2, 45),
(585, 'Rancher', 28000, 100, 1, 11.5, 55),
(586, 'FBI Rancher', 45000, 100, 1, 12.8, 60),
(587, 'Virgo', 26000, 100, 1, 10.8, 52),
(588, 'Greenwood', 22000, 100, 1, 9.8, 48),
(589, 'Jetmax', 35000, 100, 1, 15.8, 80),
(590, 'Hotring Racer', 45000, 100, 1, 12.8, 65),
(591, 'Sandking', 42000, 100, 1, 15.5, 75),
(592, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(593, 'Police Maverick', 65000, 100, 1, 16.5, 85),
(594, 'Boxville', 26000, 100, 1, 14.5, 75),
(595, 'Benson', 38000, 100, 1, 16.8, 85),
(596, 'Mesa', 24000, 100, 1, 10.2, 48),
(597, 'Rancher', 28000, 100, 1, 11.5, 55),
(598, 'FBI Rancher', 45000, 100, 1, 12.8, 60),
(599, 'Virgo', 26000, 100, 1, 10.8, 52),
(600, 'Greenwood', 22000, 100, 1, 9.8, 48),
(601, 'Sandking', 42000, 100, 1, 15.5, 75),
(602, 'Blista Compact', 18000, 100, 1, 7.8, 38),
(603, 'Police Maverick', 65000, 100, 1, 16.5, 85),
(604, 'Boxville', 26000, 100, 1, 14.5, 75),
(605, 'Benson', 38000, 100, 1, 16.8, 85),
(606, 'Mesa', 24000, 100, 1, 10.2, 48),
(607, 'Rancher', 28000, 100, 1, 11.5, 55),
(608, 'FBI Rancher', 45000, 100, 1, 12.8, 60),
(609, 'Virgo', 26000, 100, 1, 10.8, 52),
(610, 'Greenwood', 22000, 100, 1, 9.8, 48),
(611, 'Sandking', 42000, 100, 1, 15.5, 75);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `casino_pools`
--

CREATE TABLE `casino_pools` (
  `id` int(11) NOT NULL,
  `pool_type` varchar(32) NOT NULL,
  `amount` bigint(20) NOT NULL DEFAULT 0,
  `last_winner` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `config`
--

CREATE TABLE `config` (
  `Config` varchar(64) NOT NULL,
  `ValueInt` int(11) NOT NULL DEFAULT 0,
  `ValueString` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `config`
--

INSERT INTO `config` (`Config`, `ValueInt`, `ValueString`) VALUES
('Beta', 0, NULL),
('LottoGewinn', 1000000, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drogenpflanzen`
--

CREATE TABLE `drogenpflanzen` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `Growth` int(11) NOT NULL DEFAULT 0,
  `Owner` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `eastereggs`
--

CREATE TABLE `eastereggs` (
  `id` int(12) NOT NULL,
  `model` int(12) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL DEFAULT 0,
  `ry` float NOT NULL DEFAULT 0,
  `rz` float NOT NULL DEFAULT 0,
  `lastPick` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `eventboxen`
--

CREATE TABLE `eventboxen` (
  `ID` int(11) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faction_ranks`
--

CREATE TABLE `faction_ranks` (
  `ID` int(11) NOT NULL,
  `Fraktion` int(11) NOT NULL,
  `Rank` int(11) NOT NULL,
  `RankName` varchar(64) NOT NULL,
  `Pay` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `faction_ranks`
--

INSERT INTO `faction_ranks` (`ID`, `Fraktion`, `Rank`, `RankName`, `Pay`) VALUES
(1, 1, 1, 'Anwaerter', 100),
(2, 1, 2, 'Mitarbeiter', 200),
(3, 1, 3, 'Erfahrener Mitarbeiter', 300),
(4, 1, 4, 'Abteilungsleiter', 400),
(5, 1, 5, 'Stellvertretender Leiter', 500),
(6, 1, 6, 'Leiter', 600),
(7, 2, 1, 'Recruit', 200),
(8, 2, 2, 'Officer', 300),
(9, 2, 3, 'Sergeant', 400),
(10, 2, 4, 'Lieutenant', 500),
(11, 2, 5, 'Captain', 600),
(12, 2, 6, 'Chief', 800);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `faction_vehicles`
--

CREATE TABLE `faction_vehicles` (
  `ID` int(11) NOT NULL,
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
  `Fuel` float NOT NULL DEFAULT 100
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `foodstood`
--

CREATE TABLE `foodstood` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `virtualworld` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `frakinfos`
--

CREATE TABLE `frakinfos` (
  `FID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Kasse` bigint(20) NOT NULL DEFAULT 0,
  `Rang1` varchar(32) DEFAULT NULL,
  `Rang2` varchar(32) DEFAULT NULL,
  `Rang3` varchar(32) DEFAULT NULL,
  `Rang4` varchar(32) DEFAULT NULL,
  `Rang5` varchar(32) DEFAULT NULL,
  `Rang6` varchar(32) DEFAULT NULL,
  `Members` int(11) NOT NULL DEFAULT 0,
  `Mats` int(11) NOT NULL DEFAULT 0,
  `Drogen` int(11) NOT NULL DEFAULT 0,
  `Bomben` int(11) NOT NULL DEFAULT 0,
  `GVerbrecher` int(11) NOT NULL DEFAULT 0,
  `WarGegner` int(11) NOT NULL DEFAULT 0,
  `WarPoints` int(11) NOT NULL DEFAULT 0,
  `Skinordnung` int(11) NOT NULL DEFAULT 0,
  `BaseZugang` int(11) NOT NULL DEFAULT 0,
  `Baseheal` int(11) NOT NULL DEFAULT 0,
  `BND9` int(11) NOT NULL DEFAULT 0,
  `BND10` int(11) NOT NULL DEFAULT 0,
  `BND11` int(11) NOT NULL DEFAULT 0,
  `BND12` int(11) NOT NULL DEFAULT 0,
  `BND13` int(11) NOT NULL DEFAULT 0,
  `BND14` int(11) NOT NULL DEFAULT 0,
  `BND15` int(11) NOT NULL DEFAULT 0,
  `BND16` int(11) NOT NULL DEFAULT 0,
  `BND17` int(11) NOT NULL DEFAULT 0,
  `BND18` int(11) NOT NULL DEFAULT 0,
  `Gangpunkte` int(11) NOT NULL DEFAULT 0,
  `DrogenUpgrade` int(11) NOT NULL DEFAULT 0,
  `AmmunationUpgrade` int(11) NOT NULL DEFAULT 0,
  `BasehealUpgrade` int(11) NOT NULL DEFAULT 0,
  `GangzonenUpgrade` int(11) NOT NULL DEFAULT 0,
  `MatsUpgrade` int(11) NOT NULL DEFAULT 0,
  `Masken` int(11) NOT NULL DEFAULT 0,
  `KidnapCMD` int(11) NOT NULL DEFAULT 0,
  `SelldrugsCMD` int(11) NOT NULL DEFAULT 0,
  `GangfightCMD` int(11) NOT NULL DEFAULT 0,
  `BasehealCMD` int(11) NOT NULL DEFAULT 0,
  `MaskeCMD` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `furniture_model`
--

CREATE TABLE `furniture_model` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `furniture_orders`
--

CREATE TABLE `furniture_orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `furniture_id` int(11) NOT NULL,
  `delivery` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `delivered_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gangzones`
--

CREATE TABLE `gangzones` (
  `GID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `MinX` float NOT NULL DEFAULT 0,
  `MinY` float NOT NULL DEFAULT 0,
  `MaxX` float NOT NULL DEFAULT 0,
  `MaxY` float NOT NULL DEFAULT 0,
  `Owner` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `garagen`
--

CREATE TABLE `garagen` (
  `ID` int(11) NOT NULL,
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
  `Fahrzeug10` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `garages`
--

CREATE TABLE `garages` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `Preis` int(11) NOT NULL DEFAULT 25000,
  `Level` int(11) NOT NULL DEFAULT 1,
  `MaxVehicles` int(11) NOT NULL DEFAULT 2,
  `Locked` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `groups`
--

CREATE TABLE `groups` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Leader` varchar(24) NOT NULL,
  `Kasse` bigint(20) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 1,
  `MaxMembers` int(11) NOT NULL DEFAULT 10,
  `Created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `group_members`
--

CREATE TABLE `group_members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL,
  `Member` varchar(24) NOT NULL,
  `Rank` int(11) NOT NULL DEFAULT 1,
  `Joined` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gruppen`
--

CREATE TABLE `gruppen` (
  `ID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Kennzeichen` varchar(32) NOT NULL,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `GehaltUpgrade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hauser`
--

CREATE TABLE `hauser` (
  `ID` int(11) NOT NULL,
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
  `GruppenAnzeige` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `housefurnitures`
--

CREATE TABLE `housefurnitures` (
  `ID` int(11) NOT NULL,
  `HouseID` int(11) NOT NULL,
  `FurnitureID` tinyint(11) NOT NULL,
  `FurnitureX` float NOT NULL,
  `FurnitureY` float NOT NULL,
  `FurnitureZ` float NOT NULL,
  `FurnitureRX` float NOT NULL,
  `FurnitureRY` float NOT NULL,
  `FurnitureRZ` float NOT NULL,
  `FurnitureVW` int(11) NOT NULL,
  `FurnitureInt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
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
  `Upgrade` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items`
--

CREATE TABLE `items` (
  `ID` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `ItemName` varchar(64) NOT NULL,
  `ItemType` varchar(32) NOT NULL,
  `Amount` int(11) NOT NULL DEFAULT 1,
  `Value` int(11) NOT NULL DEFAULT 0,
  `Data` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jobinfos`
--

CREATE TABLE `jobinfos` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `Lohn` int(11) NOT NULL DEFAULT 0,
  `Level` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `job_stats`
--

CREATE TABLE `job_stats` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Job` int(11) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 1,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `TotalEarned` bigint(20) NOT NULL DEFAULT 0,
  `JobsCompleted` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `licenses`
--

CREATE TABLE `licenses` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Auto` int(11) NOT NULL DEFAULT 0,
  `Flug` int(11) NOT NULL DEFAULT 0,
  `LKW` int(11) NOT NULL DEFAULT 0,
  `Motorrad` int(11) NOT NULL DEFAULT 0,
  `Boot` int(11) NOT NULL DEFAULT 0,
  `Waffe` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mapping_objects`
--

CREATE TABLE `mapping_objects` (
  `id` int(11) NOT NULL,
  `modelid` int(11) DEFAULT NULL,
  `X` decimal(10,5) NOT NULL,
  `Y` decimal(10,5) NOT NULL,
  `Z` decimal(10,5) NOT NULL,
  `RX` decimal(10,5) NOT NULL,
  `RY` decimal(10,5) NOT NULL,
  `RZ` decimal(10,5) NOT NULL,
  `worldid` int(11) NOT NULL,
  `interiorid` int(11) NOT NULL,
  `streamdistance` decimal(10,5) NOT NULL,
  `drawdistance` decimal(10,5) NOT NULL,
  `Material1` varchar(256) DEFAULT '|',
  `Material2` varchar(256) DEFAULT '|',
  `Material3` varchar(256) DEFAULT '|',
  `MaterialText` varchar(256) DEFAULT NULL,
  `kommentar` varchar(30) DEFAULT NULL,
  `MaterialText0` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mapping_removes`
--

CREATE TABLE `mapping_removes` (
  `id` int(11) NOT NULL,
  `modelid` int(11) DEFAULT NULL,
  `centerX` decimal(10,5) NOT NULL,
  `centerY` decimal(10,5) NOT NULL,
  `centerZ` decimal(10,5) NOT NULL,
  `radius` decimal(10,5) NOT NULL,
  `kommentar` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `mapping_removes`
--

INSERT INTO `mapping_removes` (`id`, `modelid`, `centerX`, `centerY`, `centerZ`, `radius`, `kommentar`) VALUES
(1, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(2, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(3, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(4, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(5, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(6, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(7, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(8, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(9, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(10, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(11, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(12, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(13, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(14, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(15, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(16, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(17, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(18, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(19, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(20, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(21, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(22, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(23, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(24, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(25, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(26, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(27, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(28, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(29, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(30, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(31, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(32, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(33, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(34, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(35, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(36, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(37, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(38, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(39, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(40, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(41, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(42, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(43, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(44, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(45, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(46, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(47, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(48, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(49, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(50, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(51, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(52, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(53, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(54, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(55, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(56, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(57, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(58, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(59, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(60, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(61, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(62, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(63, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(64, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(65, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(66, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(67, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(68, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(69, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(70, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(71, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(72, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(73, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(74, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(75, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(76, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(77, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(78, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(79, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(80, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(81, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(82, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(83, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(84, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(85, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(86, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(87, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(88, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(89, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(90, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(91, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(92, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(93, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(94, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(95, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(96, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(97, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(98, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(99, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(100, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(101, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(102, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(103, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(104, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(105, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(106, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(107, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(108, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(109, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(110, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(111, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(112, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(113, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(114, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(115, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(116, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(117, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(118, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(119, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(120, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(121, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(122, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(123, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(124, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(125, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(126, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(127, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(128, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(129, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(130, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(131, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(132, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(133, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(134, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(135, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(136, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(137, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(138, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(139, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(140, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(141, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(142, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(143, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(144, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(145, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(146, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(147, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(148, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(149, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(150, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(151, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(152, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(153, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(154, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(155, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(156, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(157, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(158, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(159, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(160, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(161, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(162, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(163, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(164, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(165, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(166, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(167, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(168, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(169, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(170, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(171, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(172, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(173, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(174, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(175, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(176, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(177, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(178, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(179, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(180, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(181, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(182, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(183, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(184, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(185, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(186, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(187, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(188, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(189, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(190, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(191, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(192, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(193, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(194, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(195, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(196, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(197, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(198, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(199, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(200, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(201, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(202, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(203, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(204, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(205, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(206, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(207, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(208, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(209, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(210, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(211, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(212, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(213, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(214, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(215, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(216, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(217, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(218, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(219, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(220, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(221, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(222, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(223, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(224, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(225, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(226, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(227, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(228, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(229, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(230, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(231, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(232, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(233, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(234, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(235, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(236, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(237, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(238, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(239, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(240, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(241, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(242, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(243, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(244, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(245, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(246, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(247, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(248, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(249, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(250, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(251, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(252, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(253, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(254, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(255, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(256, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(257, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(258, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(259, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(260, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(261, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(262, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(263, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(264, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(265, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(266, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(267, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(268, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(269, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(270, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(271, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(272, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(273, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(274, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(275, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(276, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(277, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(278, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(279, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(280, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(281, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(282, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(283, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(284, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(285, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(286, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(287, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(288, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(289, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(290, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(291, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(292, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(293, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(294, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(295, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(296, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(297, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(298, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(299, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(300, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(301, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(302, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(303, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(304, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(305, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(306, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(307, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(308, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(309, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(310, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(311, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(312, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, ''),
(313, 4024, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(314, 4044, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(315, 4045, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(316, 1527, 1448.23438, -1755.89844, 14.52340, 0.25000, ''),
(317, 713, 1407.19531, -1749.31250, 13.09380, 0.25000, ''),
(318, 713, 1405.23438, -1821.11719, 13.10160, 0.25000, ''),
(319, 620, 1417.97656, -1832.53125, 11.98440, 0.25000, ''),
(320, 673, 1405.57813, -1831.69531, 12.39840, 0.25000, ''),
(321, 700, 1447.10156, -1832.50000, 12.91410, 0.25000, ''),
(322, 1231, 1432.30469, -1832.91406, 15.28910, 0.25000, ''),
(323, 4174, 1435.76563, -1823.66406, 15.17970, 0.25000, ''),
(324, 620, 1456.39844, -1832.53125, 11.98440, 0.25000, ''),
(325, 673, 1464.09375, -1831.88281, 12.39840, 0.25000, ''),
(326, 1231, 1480.03125, -1832.91406, 15.28910, 0.25000, ''),
(327, 3997, 1479.33594, -1802.28906, 12.54690, 0.25000, ''),
(328, 620, 1504.84375, -1832.53125, 11.98440, 0.25000, ''),
(329, 673, 1499.04688, -1832.27344, 12.88280, 0.25000, ''),
(330, 700, 1512.94531, -1832.35156, 13.46880, 0.25000, ''),
(331, 700, 1404.91406, -1765.26563, 12.91410, 0.25000, ''),
(332, 4173, 1427.27344, -1756.17969, 15.00000, 0.25000, ''),
(333, 673, 1415.31250, -1748.56250, 12.39840, 0.25000, ''),
(334, 620, 1429.53125, -1748.42188, 12.90630, 0.25000, ''),
(335, 700, 1438.03125, -1747.93750, 13.44530, 0.25000, ''),
(336, 620, 1447.90625, -1748.22656, 12.90630, 0.25000, ''),
(337, 4002, 1479.86719, -1790.39844, 56.02340, 0.25000, ''),
(338, 3980, 1481.18750, -1785.07031, 22.38280, 0.25000, ''),
(339, 4003, 1481.07813, -1747.03125, 33.52340, 0.25000, ''),
(340, 1283, 1513.23438, -1732.92188, 15.62500, 0.25000, ''),
(341, 620, 1516.00000, -1748.60156, 13.00780, 0.25000, ''),
(342, 1231, 1529.28906, -1832.91406, 15.28910, 0.25000, ''),
(343, 620, 1549.53125, -1832.31250, 12.88280, 0.25000, ''),
(344, 673, 1555.66406, -1830.59375, 13.02340, 0.25000, ''),
(345, 4175, 1524.41406, -1823.85156, 15.17970, 0.25000, ''),
(346, 700, 1554.82031, -1816.15625, 13.47660, 0.25000, ''),
(347, 673, 1553.25781, -1764.81250, 12.79690, 0.25000, ''),
(348, 4172, 1534.76563, -1756.17969, 15.00000, 0.25000, ''),
(349, 620, 1533.26563, -1749.02344, 12.80470, 0.25000, ''),
(350, 673, 1522.16406, -1748.57031, 13.02340, 0.25000, ''),
(351, 700, 1553.70313, -1747.93750, 13.40630, 0.25000, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newskiosk`
--

CREATE TABLE `newskiosk` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `Interior` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `memberlimit` int(11) NOT NULL,
  `vehiclelimit` int(11) NOT NULL,
  `founder` varchar(24) NOT NULL,
  `upgrades` varchar(24) NOT NULL,
  `rankName1` varchar(24) NOT NULL,
  `rankName2` varchar(24) NOT NULL,
  `rankName3` varchar(24) NOT NULL,
  `centralconfirmed` int(11) NOT NULL,
  `centralpos` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `phone_contacts`
--

CREATE TABLE `phone_contacts` (
  `ID` int(11) NOT NULL,
  `Owner` varchar(24) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `phone_messages`
--

CREATE TABLE `phone_messages` (
  `ID` int(11) NOT NULL,
  `Sender` varchar(24) NOT NULL,
  `Receiver` varchar(24) NOT NULL,
  `Message` text NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `Read` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_jobskills`
--

CREATE TABLE `player_jobskills` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `jobId` int(11) NOT NULL,
  `skill` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `player_jobskills`
--

INSERT INTO `player_jobskills` (`id`, `user_id`, `jobId`, `skill`, `level`, `amount`) VALUES
(1, 4, 1, 0, 0, 0),
(2, 4, 2, 0, 0, 0),
(3, 4, 3, 0, 0, 0),
(4, 4, 4, 0, 0, 0),
(5, 4, 5, 0, 0, 0),
(6, 4, 6, 0, 0, 0),
(7, 4, 7, 0, 0, 0),
(8, 4, 8, 0, 0, 0),
(9, 4, 9, 0, 0, 0),
(10, 4, 10, 0, 0, 0),
(11, 4, 11, 0, 0, 0),
(12, 4, 12, 0, 0, 0),
(13, 4, 13, 0, 0, 0),
(14, 4, 14, 0, 0, 0),
(15, 4, 15, 0, 0, 0),
(16, 4, 16, 0, 0, 0),
(17, 4, 17, 0, 0, 0),
(18, 4, 18, 0, 0, 0),
(19, 4, 19, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_objects`
--

CREATE TABLE `player_objects` (
  `id` int(11) NOT NULL,
  `owner` varchar(24) NOT NULL,
  `model` int(11) NOT NULL DEFAULT 0,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `rx` float NOT NULL DEFAULT 0,
  `ry` float NOT NULL DEFAULT 0,
  `rz` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `virtualworld` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_protocol`
--

CREATE TABLE `player_protocol` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `player_protocol`
--

INSERT INTO `player_protocol` (`id`, `userId`, `ip`, `timestamp`) VALUES
(1, 1, '127.0.0.1', '2026-01-25 19:45:41'),
(2, 2, '127.0.0.1', '2026-01-25 20:56:45'),
(3, 3, '127.0.0.1', '2026-01-29 05:43:29'),
(4, 4, '127.0.0.1', '2026-01-29 06:01:20');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_titles`
--

CREATE TABLE `player_titles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titleId` int(11) NOT NULL,
  `unlocked` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `amount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `player_titles`
--

INSERT INTO `player_titles` (`id`, `user_id`, `titleId`, `unlocked`, `status`, `amount`) VALUES
(1, 4, 0, 0, 0, 0),
(2, 4, 1, 0, 0, 0),
(3, 4, 2, 0, 0, 0),
(4, 4, 3, 0, 0, 0),
(5, 4, 4, 0, 0, 0),
(6, 4, 5, 0, 0, 0),
(7, 4, 6, 0, 0, 0),
(8, 4, 7, 0, 0, 0),
(9, 4, 8, 0, 0, 0),
(10, 4, 9, 0, 0, 0),
(11, 4, 10, 0, 0, 0),
(12, 4, 11, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `races`
--

CREATE TABLE `races` (
  `race` varchar(32) NOT NULL,
  `X1` float(10,4) NOT NULL,
  `Y1` float(10,4) NOT NULL,
  `Z1` float(10,4) NOT NULL,
  `X2` float(10,4) NOT NULL,
  `Y2` float(10,4) NOT NULL,
  `Z2` float(10,4) NOT NULL,
  `X3` float(10,4) NOT NULL,
  `Y3` float(10,4) NOT NULL,
  `Z3` float(10,4) NOT NULL,
  `X4` float(10,4) NOT NULL,
  `Y4` float(10,4) NOT NULL,
  `Z4` float(10,4) NOT NULL,
  `X5` float(10,4) NOT NULL,
  `Y5` float(10,4) NOT NULL,
  `Z5` float(10,4) NOT NULL,
  `X6` float(10,4) NOT NULL,
  `Y6` float(10,4) NOT NULL,
  `Z6` float(10,4) NOT NULL,
  `X7` float(10,4) NOT NULL,
  `Y7` float(10,4) NOT NULL,
  `Z7` float(10,4) NOT NULL,
  `X8` float(10,4) NOT NULL,
  `Y8` float(10,4) NOT NULL,
  `Z8` float(10,4) NOT NULL,
  `X9` float(10,4) NOT NULL,
  `Y9` float(10,4) NOT NULL,
  `Z9` float(10,4) NOT NULL,
  `X10` float(10,4) NOT NULL,
  `Y10` float(10,4) NOT NULL,
  `Z10` float(10,4) NOT NULL,
  `X11` float(10,4) NOT NULL,
  `Y11` float(10,4) NOT NULL,
  `Z11` float(10,4) NOT NULL,
  `X12` float(10,4) NOT NULL,
  `Y12` float(10,4) NOT NULL,
  `Z12` float(10,4) NOT NULL,
  `X13` float(10,4) NOT NULL,
  `Y13` float(10,4) NOT NULL,
  `Z13` float(10,4) NOT NULL,
  `X14` float(10,4) NOT NULL,
  `Y14` float(10,4) NOT NULL,
  `Z14` float(10,4) NOT NULL,
  `X15` float(10,4) NOT NULL,
  `Y15` float(10,4) NOT NULL,
  `Z15` float(10,4) NOT NULL,
  `X16` float(10,4) NOT NULL,
  `Y16` float(10,4) NOT NULL,
  `Z16` float(10,4) NOT NULL,
  `X17` float(10,4) NOT NULL,
  `Y17` float(10,4) NOT NULL,
  `Z17` float(10,4) NOT NULL,
  `X18` float(10,4) NOT NULL,
  `Y18` float(10,4) NOT NULL,
  `Z18` float(10,4) NOT NULL,
  `X19` float(10,4) NOT NULL,
  `Y19` float(10,4) NOT NULL,
  `Z19` float(10,4) NOT NULL,
  `X20` float(10,4) NOT NULL,
  `Y20` float(10,4) NOT NULL,
  `Z20` float(10,4) NOT NULL,
  `X21` float(10,4) NOT NULL,
  `Y21` float(10,4) NOT NULL,
  `Z21` float(10,4) NOT NULL,
  `X22` float(10,4) NOT NULL,
  `Y22` float(10,4) NOT NULL,
  `Z22` float(10,4) NOT NULL,
  `X23` float(10,4) NOT NULL,
  `Y23` float(10,4) NOT NULL,
  `Z23` float(10,4) NOT NULL,
  `X24` float(10,4) NOT NULL,
  `Y24` float(10,4) NOT NULL,
  `Z24` float(10,4) NOT NULL,
  `X25` float(10,4) NOT NULL,
  `Y25` float(10,4) NOT NULL,
  `Z25` float(10,4) NOT NULL,
  `X26` float(10,4) NOT NULL,
  `Y26` float(10,4) NOT NULL,
  `Z26` float(10,4) NOT NULL,
  `X27` float(10,4) NOT NULL,
  `Y27` float(10,4) NOT NULL,
  `Z27` float(10,4) NOT NULL,
  `X28` float(10,4) NOT NULL,
  `Y28` float(10,4) NOT NULL,
  `Z28` float(10,4) NOT NULL,
  `X29` float(10,4) NOT NULL,
  `Y29` float(10,4) NOT NULL,
  `Z29` float(10,4) NOT NULL,
  `X30` float(10,4) NOT NULL,
  `Y30` float(10,4) NOT NULL,
  `Z30` float(10,4) NOT NULL,
  `X31` float(10,4) NOT NULL,
  `Y31` float(10,4) NOT NULL,
  `Z31` float(10,4) NOT NULL,
  `X32` float(10,4) NOT NULL,
  `Y32` float(10,4) NOT NULL,
  `Z32` float(10,4) NOT NULL,
  `X33` float(10,4) NOT NULL,
  `Y33` float(10,4) NOT NULL,
  `Z33` float(10,4) NOT NULL,
  `X34` float(10,4) NOT NULL,
  `Y34` float(10,4) NOT NULL,
  `Z34` float(10,4) NOT NULL,
  `X35` float(10,4) NOT NULL,
  `Y35` float(10,4) NOT NULL,
  `Z35` float(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `regierung`
--

CREATE TABLE `regierung` (
  `ID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Value` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `robberies`
--

CREATE TABLE `robberies` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `x` float NOT NULL DEFAULT 0,
  `y` float NOT NULL DEFAULT 0,
  `z` float NOT NULL DEFAULT 0,
  `interior` int(11) NOT NULL DEFAULT 0,
  `virtualworld` int(11) NOT NULL DEFAULT 0,
  `reward` int(11) NOT NULL DEFAULT 0,
  `cooldown` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `serverlager`
--

CREATE TABLE `serverlager` (
  `id` int(11) NOT NULL,
  `item` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `drucker_farbe` int(11) NOT NULL DEFAULT 50,
  `drucker_papier` int(11) NOT NULL DEFAULT 100,
  `it_lager_papier` int(11) NOT NULL DEFAULT 0,
  `it_lager_farbe` int(11) NOT NULL DEFAULT 0,
  `it_lager_newspaper` int(11) NOT NULL DEFAULT 0,
  `it_lager_newspaper_id` int(11) NOT NULL DEFAULT 0,
  `it_newspaper_price` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `serverlog_easter`
--

CREATE TABLE `serverlog_easter` (
  `logID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `content` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_actors`
--

CREATE TABLE `server_actors` (
  `id` int(12) NOT NULL,
  `name` varchar(24) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `a` float NOT NULL,
  `animation` int(12) NOT NULL,
  `skin` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_busroutes`
--

CREATE TABLE `server_busroutes` (
  `id` int(11) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `skill` int(11) DEFAULT NULL,
  `bonusmoney` int(11) DEFAULT NULL,
  `jobexpbonus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_busroutes_cps`
--

CREATE TABLE `server_busroutes_cps` (
  `id` int(11) NOT NULL,
  `busRoute` int(11) DEFAULT NULL,
  `checkpoint` varchar(256) DEFAULT '|'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_economy`
--

CREATE TABLE `server_economy` (
  `economyId` int(12) NOT NULL,
  `value` int(12) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_enterexits`
--

CREATE TABLE `server_enterexits` (
  `id` int(11) NOT NULL,
  `Enter` varchar(256) DEFAULT '|',
  `Exit` varchar(256) DEFAULT '|',
  `Name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_pickups`
--

CREATE TABLE `server_pickups` (
  `id` int(12) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `model` int(12) NOT NULL,
  `world` int(12) NOT NULL,
  `interior` int(12) NOT NULL,
  `type` int(12) NOT NULL,
  `text` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_stats`
--

CREATE TABLE `server_stats` (
  `ID` int(11) NOT NULL,
  `StatName` varchar(64) NOT NULL,
  `StatValue` bigint(20) NOT NULL DEFAULT 0,
  `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `server_stats`
--

INSERT INTO `server_stats` (`ID`, `StatName`, `StatValue`, `LastUpdated`) VALUES
(1, 'total_players', 0, '2026-01-25 19:29:37'),
(2, 'total_money', 0, '2026-01-25 19:29:37'),
(3, 'total_vehicles', 0, '2026-01-25 19:29:37'),
(4, 'total_houses', 0, '2026-01-25 19:29:37'),
(5, 'total_businesses', 0, '2026-01-25 19:29:37'),
(6, 'server_uptime', 0, '2026-01-25 19:29:37');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_timeline`
--

CREATE TABLE `server_timeline` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `description` varchar(256) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `server_timeline`
--

INSERT INTO `server_timeline` (`id`, `userId`, `tagId`, `description`, `timestamp`) VALUES
(1, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-25 19:35:24'),
(2, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-25 19:44:31'),
(3, 1, 0, 'hat sich auf dem Gameserver registriert.', '2026-01-25 19:45:41'),
(4, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-25 20:54:04'),
(5, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-25 20:54:22'),
(6, 2, 0, 'hat sich auf dem Gameserver registriert.', '2026-01-25 20:56:45'),
(7, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-25 21:09:30'),
(8, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-29 05:26:27'),
(9, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-29 05:38:48'),
(10, 3, 0, 'hat sich auf dem Gameserver registriert.', '2026-01-29 05:43:29'),
(11, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-29 05:54:16'),
(12, 4, 0, 'hat sich auf dem Gameserver registriert.', '2026-01-29 06:01:20'),
(13, -1, 9, 'Der Server wurde erfolgreich gestartet.', '2026-01-29 08:18:32');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `speed_cameras`
--

CREATE TABLE `speed_cameras` (
  `ID` int(11) NOT NULL,
  `PosX` double NOT NULL DEFAULT 0,
  `PosY` double NOT NULL DEFAULT 0,
  `PosZ` double NOT NULL DEFAULT 0,
  `SpeedLimit` int(11) NOT NULL DEFAULT 80,
  `Fine` int(11) NOT NULL DEFAULT 500,
  `Defekt` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `spraytags`
--

CREATE TABLE `spraytags` (
  `ID` int(11) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0,
  `Sprayed` int(11) NOT NULL DEFAULT 0,
  `Sprayer` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stores`
--

CREATE TABLE `stores` (
  `ID` int(11) NOT NULL,
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
  `Pos_Z` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `streetschilder`
--

CREATE TABLE `streetschilder` (
  `ID` int(11) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tankstellen`
--

CREATE TABLE `tankstellen` (
  `ID` int(11) NOT NULL,
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
  `S_PosR` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `timebans`
--

CREATE TABLE `timebans` (
  `id` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Reason` varchar(128) NOT NULL DEFAULT '',
  `Admin` varchar(24) NOT NULL DEFAULT '',
  `BanTime` int(11) NOT NULL DEFAULT 0,
  `UnbanTime` int(11) NOT NULL DEFAULT 0,
  `Timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int(11) NOT NULL,
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
  `Created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vip`
--

CREATE TABLE `vip` (
  `id` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Level` int(11) NOT NULL DEFAULT 0,
  `ExpireTime` int(11) NOT NULL DEFAULT 0,
  `Benefits` text DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Daten für Tabelle `vip`
--

INSERT INTO `vip` (`id`, `Name`, `Level`, `ExpireTime`, `Benefits`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Server', 0, 0, NULL, '2026-01-29 09:03:48', '2026-01-29 09:03:48');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `werbetafel`
--

CREATE TABLE `werbetafel` (
  `ID` int(11) NOT NULL,
  `Text` varchar(256) NOT NULL,
  `X` float NOT NULL DEFAULT 0,
  `Y` float NOT NULL DEFAULT 0,
  `Z` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wood_buyers`
--

CREATE TABLE `wood_buyers` (
  `ID` int(11) NOT NULL,
  `Skin` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wood_trees`
--

CREATE TABLE `wood_trees` (
  `ID` int(12) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `RotX` float NOT NULL,
  `RotY` float NOT NULL,
  `RotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accbans`
--
ALTER TABLE `accbans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`),
  ADD KEY `Online` (`Online`),
  ADD KEY `Fraktion` (`Fraktion`),
  ADD KEY `Admin` (`Admin`);

--
-- Indizes für die Tabelle `accplaytime`
--
ALTER TABLE `accplaytime`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_AchievementID` (`Name`,`AchievementID`);

--
-- Indizes für die Tabelle `admin_logs`
--
ALTER TABLE `admin_logs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Admin` (`Admin`),
  ADD KEY `Action` (`Action`),
  ADD KEY `Timestamp` (`Timestamp`);

--
-- Indizes für die Tabelle `airdroppos`
--
ALTER TABLE `airdroppos`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `allgemein`
--
ALTER TABLE `allgemein`
  ADD PRIMARY KEY (`ServerID`);

--
-- Indizes für die Tabelle `ammunation`
--
ALTER TABLE `ammunation`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `atms`
--
ALTER TABLE `atms`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `atm_machines`
--
ALTER TABLE `atm_machines`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `blitzer`
--
ALTER TABLE `blitzer`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `businesses`
--
ALTER TABLE `businesses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Besitzer` (`Besitzer`);

--
-- Indizes für die Tabelle `carinfos`
--
ALTER TABLE `carinfos`
  ADD PRIMARY KEY (`ModelID`);

--
-- Indizes für die Tabelle `casino_pools`
--
ALTER TABLE `casino_pools`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`Config`);

--
-- Indizes für die Tabelle `drogenpflanzen`
--
ALTER TABLE `drogenpflanzen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `eastereggs`
--
ALTER TABLE `eastereggs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `eventboxen`
--
ALTER TABLE `eventboxen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `faction_ranks`
--
ALTER TABLE `faction_ranks`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Fraktion_Rank` (`Fraktion`,`Rank`);

--
-- Indizes für die Tabelle `faction_vehicles`
--
ALTER TABLE `faction_vehicles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Fraktion` (`Fraktion`);

--
-- Indizes für die Tabelle `foodstood`
--
ALTER TABLE `foodstood`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `frakinfos`
--
ALTER TABLE `frakinfos`
  ADD PRIMARY KEY (`FID`);

--
-- Indizes für die Tabelle `furniture_model`
--
ALTER TABLE `furniture_model`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `furniture_orders`
--
ALTER TABLE `furniture_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `gangzones`
--
ALTER TABLE `gangzones`
  ADD PRIMARY KEY (`GID`);

--
-- Indizes für die Tabelle `garagen`
--
ALTER TABLE `garagen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `garages`
--
ALTER TABLE `garages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Besitzer` (`Besitzer`);

--
-- Indizes für die Tabelle `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Leader` (`Leader`);

--
-- Indizes für die Tabelle `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Member` (`Member`);

--
-- Indizes für die Tabelle `gruppen`
--
ALTER TABLE `gruppen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `hauser`
--
ALTER TABLE `hauser`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `housefurnitures`
--
ALTER TABLE `housefurnitures`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Besitzer` (`Besitzer`);

--
-- Indizes für die Tabelle `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Owner` (`Owner`),
  ADD KEY `ItemType` (`ItemType`);

--
-- Indizes für die Tabelle `jobinfos`
--
ALTER TABLE `jobinfos`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `job_stats`
--
ALTER TABLE `job_stats`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name_Job` (`Name`,`Job`);

--
-- Indizes für die Tabelle `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `mapping_objects`
--
ALTER TABLE `mapping_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `mapping_removes`
--
ALTER TABLE `mapping_removes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `newskiosk`
--
ALTER TABLE `newskiosk`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `phone_contacts`
--
ALTER TABLE `phone_contacts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Owner` (`Owner`);

--
-- Indizes für die Tabelle `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Sender` (`Sender`),
  ADD KEY `Receiver` (`Receiver`);

--
-- Indizes für die Tabelle `player_jobskills`
--
ALTER TABLE `player_jobskills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_job` (`user_id`,`jobId`);

--
-- Indizes für die Tabelle `player_objects`
--
ALTER TABLE `player_objects`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `player_protocol`
--
ALTER TABLE `player_protocol`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `player_titles`
--
ALTER TABLE `player_titles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_title` (`user_id`,`titleId`);

--
-- Indizes für die Tabelle `races`
--
ALTER TABLE `races`
  ADD PRIMARY KEY (`race`);

--
-- Indizes für die Tabelle `regierung`
--
ALTER TABLE `regierung`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `robberies`
--
ALTER TABLE `robberies`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `serverlager`
--
ALTER TABLE `serverlager`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `serverlog_easter`
--
ALTER TABLE `serverlog_easter`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `userID` (`userID`);

--
-- Indizes für die Tabelle `server_actors`
--
ALTER TABLE `server_actors`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_busroutes`
--
ALTER TABLE `server_busroutes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_busroutes_cps`
--
ALTER TABLE `server_busroutes_cps`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_economy`
--
ALTER TABLE `server_economy`
  ADD PRIMARY KEY (`economyId`);

--
-- Indizes für die Tabelle `server_enterexits`
--
ALTER TABLE `server_enterexits`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_pickups`
--
ALTER TABLE `server_pickups`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_stats`
--
ALTER TABLE `server_stats`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `StatName` (`StatName`);

--
-- Indizes für die Tabelle `server_timeline`
--
ALTER TABLE `server_timeline`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `speed_cameras`
--
ALTER TABLE `speed_cameras`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `spraytags`
--
ALTER TABLE `spraytags`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `streetschilder`
--
ALTER TABLE `streetschilder`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `tankstellen`
--
ALTER TABLE `tankstellen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `timebans`
--
ALTER TABLE `timebans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Besitzer` (`Besitzer`),
  ADD KEY `Fraktion` (`Fraktion`);

--
-- Indizes für die Tabelle `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `werbetafel`
--
ALTER TABLE `werbetafel`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `wood_buyers`
--
ALTER TABLE `wood_buyers`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `wood_trees`
--
ALTER TABLE `wood_trees`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accbans`
--
ALTER TABLE `accbans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `accplaytime`
--
ALTER TABLE `accplaytime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `achievements`
--
ALTER TABLE `achievements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `admin_logs`
--
ALTER TABLE `admin_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `airdroppos`
--
ALTER TABLE `airdroppos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `ammunation`
--
ALTER TABLE `ammunation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `atm_machines`
--
ALTER TABLE `atm_machines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `blitzer`
--
ALTER TABLE `blitzer`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `businesses`
--
ALTER TABLE `businesses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `casino_pools`
--
ALTER TABLE `casino_pools`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `drogenpflanzen`
--
ALTER TABLE `drogenpflanzen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `eastereggs`
--
ALTER TABLE `eastereggs`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `eventboxen`
--
ALTER TABLE `eventboxen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `faction_ranks`
--
ALTER TABLE `faction_ranks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `faction_vehicles`
--
ALTER TABLE `faction_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `foodstood`
--
ALTER TABLE `foodstood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `frakinfos`
--
ALTER TABLE `frakinfos`
  MODIFY `FID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `furniture_model`
--
ALTER TABLE `furniture_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `furniture_orders`
--
ALTER TABLE `furniture_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gangzones`
--
ALTER TABLE `gangzones`
  MODIFY `GID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `garagen`
--
ALTER TABLE `garagen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `garages`
--
ALTER TABLE `garages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `groups`
--
ALTER TABLE `groups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `group_members`
--
ALTER TABLE `group_members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gruppen`
--
ALTER TABLE `gruppen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `hauser`
--
ALTER TABLE `hauser`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `housefurnitures`
--
ALTER TABLE `housefurnitures`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `items`
--
ALTER TABLE `items`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `jobinfos`
--
ALTER TABLE `jobinfos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `job_stats`
--
ALTER TABLE `job_stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `licenses`
--
ALTER TABLE `licenses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `mapping_objects`
--
ALTER TABLE `mapping_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `mapping_removes`
--
ALTER TABLE `mapping_removes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=352;

--
-- AUTO_INCREMENT für Tabelle `newskiosk`
--
ALTER TABLE `newskiosk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `phone_contacts`
--
ALTER TABLE `phone_contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `player_jobskills`
--
ALTER TABLE `player_jobskills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT für Tabelle `player_objects`
--
ALTER TABLE `player_objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `player_protocol`
--
ALTER TABLE `player_protocol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `player_titles`
--
ALTER TABLE `player_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `regierung`
--
ALTER TABLE `regierung`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `robberies`
--
ALTER TABLE `robberies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `serverlager`
--
ALTER TABLE `serverlager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `serverlog_easter`
--
ALTER TABLE `serverlog_easter`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_actors`
--
ALTER TABLE `server_actors`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_busroutes`
--
ALTER TABLE `server_busroutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_busroutes_cps`
--
ALTER TABLE `server_busroutes_cps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_enterexits`
--
ALTER TABLE `server_enterexits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_pickups`
--
ALTER TABLE `server_pickups`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_stats`
--
ALTER TABLE `server_stats`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `server_timeline`
--
ALTER TABLE `server_timeline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `speed_cameras`
--
ALTER TABLE `speed_cameras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `spraytags`
--
ALTER TABLE `spraytags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `stores`
--
ALTER TABLE `stores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `streetschilder`
--
ALTER TABLE `streetschilder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tankstellen`
--
ALTER TABLE `tankstellen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `timebans`
--
ALTER TABLE `timebans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `vip`
--
ALTER TABLE `vip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `werbetafel`
--
ALTER TABLE `werbetafel`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `wood_buyers`
--
ALTER TABLE `wood_buyers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
