-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 20. Apr 2023 um 15:47
-- Server-Version: 10.5.18-MariaDB-0+deb11u1
-- PHP-Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `rosalife-reloaded`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accbans`
--

CREATE TABLE `accbans` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Teammitglied` varchar(24) NOT NULL,
  `Bangrund` varchar(64) NOT NULL,
  `GPCI` varchar(128) NOT NULL DEFAULT '0',
  `Uhrzeit` varchar(16) NOT NULL,
  `Datum` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Passwort` varchar(70) NOT NULL,
  `Connected` timestamp NOT NULL DEFAULT current_timestamp(),
  `ConnectIP` varchar(255) DEFAULT NULL,
  `ConnectGMX` int(11) NOT NULL DEFAULT 0,
  `Registerdatum` varchar(32) DEFAULT NULL,
  `EMail` varchar(128) DEFAULT NULL,
  `IP-Adresse` varchar(32) DEFAULT NULL,
  `Sicherheitscode` varchar(34) DEFAULT NULL,
  `Alter` varchar(12) DEFAULT NULL,
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
  `Tot_Y` double NOT NULL DEFAULT 0,
  `Tot_Z` double NOT NULL DEFAULT 0,
  `SkinID` int(11) NOT NULL DEFAULT 26,
  `KnastSkin` int(11) NOT NULL DEFAULT 62,
  `Stadt` int(11) NOT NULL DEFAULT 1,
  `Spawn` int(11) NOT NULL DEFAULT 0,
  `Fraktion` int(11) NOT NULL DEFAULT 0,
  `Leader` int(11) NOT NULL DEFAULT 0,
  `Rank` int(11) NOT NULL DEFAULT 0,
  `lVerbrechen` varchar(84) DEFAULT NULL,
  `Wanteds` int(11) NOT NULL DEFAULT 0,
  `Knastzeit` int(11) NOT NULL DEFAULT 0,
  `Zelle` int(11) NOT NULL DEFAULT 0,
  `EXP` int(11) NOT NULL DEFAULT 0,
  `EXPNeeded` int(11) NOT NULL DEFAULT 400,
  `Level` int(11) NOT NULL DEFAULT 1,
  `Verwarnungen` int(11) NOT NULL DEFAULT 0,
  `Mutezeit` int(11) NOT NULL DEFAULT 0,
  `Badword` int(11) NOT NULL DEFAULT 0,
  `Bargeld` int(11) NOT NULL DEFAULT 3000,
  `AntiCheatGMX` int(11) NOT NULL DEFAULT 0,
  `Perso` int(11) NOT NULL DEFAULT 0,
  `Mission` int(11) NOT NULL DEFAULT 0,
  `MissionComplete` int(11) NOT NULL DEFAULT 0,
  `BankPIN` int(11) NOT NULL DEFAULT 0,
  `Bankkonto` int(11) NOT NULL DEFAULT 0,
  `Tankstelle` int(11) NOT NULL DEFAULT 0,
  `Ammunation` int(11) NOT NULL DEFAULT 0,
  `Store` int(11) NOT NULL DEFAULT 0,
  `Haus` int(11) NOT NULL DEFAULT 0,
  `Gruppenhaus` int(11) NOT NULL DEFAULT 0,
  `Mieter` int(11) NOT NULL DEFAULT 0,
  `Nebenjob` int(11) NOT NULL DEFAULT 0,
  `QuitJob` int(11) NOT NULL DEFAULT 0,
  `Firma` int(11) NOT NULL DEFAULT 0,
  `FirmaLeader` int(11) NOT NULL DEFAULT 0,
  `Autoschein` int(11) NOT NULL DEFAULT 0,
  `Bootschein` int(11) NOT NULL DEFAULT 0,
  `Waffenschein` int(11) NOT NULL DEFAULT 0,
  `Flugschein` int(11) NOT NULL DEFAULT 0,
  `LKWschein` int(11) NOT NULL DEFAULT 0,
  `Motorradschein` int(11) NOT NULL DEFAULT 0,
  `Krankenhaus` int(11) NOT NULL DEFAULT 0,
  `Wiederbeleben` int(11) NOT NULL DEFAULT 0,
  `Tot_Int` int(11) NOT NULL DEFAULT 0,
  `Tot_World` int(11) NOT NULL DEFAULT 0,
  `Paket` int(11) NOT NULL DEFAULT 0,
  `PayDay` int(11) NOT NULL DEFAULT 0,
  `Stadtplan` int(11) NOT NULL DEFAULT 0,
  `Navi` int(11) NOT NULL DEFAULT 0,
  `Handy` int(11) NOT NULL DEFAULT 0,
  `Guthaben` int(11) NOT NULL DEFAULT 0,
  `Telefonbuch` int(11) NOT NULL DEFAULT 0,
  `Repairkit` int(11) NOT NULL DEFAULT 0,
  `Musikbox` int(12) NOT NULL DEFAULT 0,
  `PBKills` int(11) NOT NULL DEFAULT 0,
  `PBTode` int(11) NOT NULL DEFAULT 0,
  `VirtualWorld` int(11) NOT NULL DEFAULT 0,
  `Tot_X` double NOT NULL DEFAULT 0,
  `Handschellen` int(11) NOT NULL DEFAULT 0,
  `Startbonus` int(11) NOT NULL DEFAULT 0,
  `Fraksperre` int(11) NOT NULL DEFAULT 0,
  `icpNachrichten` int(11) NOT NULL DEFAULT 1,
  `icpHitsound` int(11) NOT NULL DEFAULT 1,
  `icpOChat` int(11) NOT NULL DEFAULT 1,
  `icpCamera` int(11) NOT NULL DEFAULT 0,
  `icpHandy` int(11) NOT NULL DEFAULT 0,
  `icpBlinker` int(11) NOT NULL DEFAULT 0,
  `stvoAutoschein` int(11) NOT NULL DEFAULT 0,
  `stvoMotorradschein` int(11) NOT NULL DEFAULT 0,
  `stvoFlugschein` int(11) NOT NULL DEFAULT 0,
  `stvoTruckschein` int(11) NOT NULL DEFAULT 0,
  `stvoBootschein` int(11) NOT NULL DEFAULT 0,
  `TicketsBearbeitet` int(11) NOT NULL DEFAULT 0,
  `PayDayGeld` int(11) NOT NULL DEFAULT 0,
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
  `Lotto1` int(11) NOT NULL DEFAULT 0,
  `Lotto2` int(11) NOT NULL DEFAULT 0,
  `Lotto3` int(11) NOT NULL DEFAULT 0,
  `TruckerSkill` int(11) NOT NULL DEFAULT 0,
  `PizzaboteSkill` int(11) NOT NULL DEFAULT 0,
  `KehrmaschinenSkill` int(11) NOT NULL DEFAULT 0,
  `PilotenSkill` int(11) NOT NULL DEFAULT 0,
  `BusfahrerSkill` int(11) NOT NULL DEFAULT 0,
  `MullmannSkill` int(11) NOT NULL DEFAULT 0,
  `Drogen` int(11) NOT NULL DEFAULT 0,
  `Tutorial` int(11) NOT NULL DEFAULT 0,
  `Quest` int(11) NOT NULL DEFAULT 0,
  `Contract` int(11) NOT NULL DEFAULT 0,
  `Gruppe` int(11) NOT NULL DEFAULT 0,
  `GLeader` int(11) NOT NULL DEFAULT 0,
  `GRank` int(11) NOT NULL DEFAULT 0,
  `sFLeader` int(11) NOT NULL DEFAULT 0,
  `sFirma` int(11) NOT NULL DEFAULT 0,
  `sFRank` int(11) NOT NULL DEFAULT 0,
  `sGFirma` int(11) NOT NULL DEFAULT 0,
  `Donator` int(11) NOT NULL DEFAULT 0,
  `Premium` int(11) NOT NULL DEFAULT 0,
  `Garage` int(11) NOT NULL DEFAULT 0,
  `GMieter` int(11) NOT NULL DEFAULT 0,
  `Materialien` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `coins` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000,
  `Kurrier` int(11) NOT NULL DEFAULT 0,
  `Bombe` int(11) NOT NULL DEFAULT 0,
  `Pfandflaschen` int(11) NOT NULL DEFAULT 0,
  `Beutel` int(11) NOT NULL DEFAULT 0,
  `Kampfstyle` int(11) NOT NULL DEFAULT 0,
  `Helm` int(11) NOT NULL DEFAULT 0,
  `WerbungSperre` int(11) NOT NULL DEFAULT 0,
  `Kongress` int(11) NOT NULL DEFAULT 0,
  `Senator` int(11) NOT NULL DEFAULT 0,
  `VIP` int(11) NOT NULL DEFAULT 0,
  `PrisonCP` int(11) NOT NULL DEFAULT 0,
  `Kicks` int(11) NOT NULL DEFAULT 0,
  `Prison` int(11) NOT NULL DEFAULT 0,
  `Tagesbelohnung` int(11) NOT NULL DEFAULT 0,
  `LastTagesbelohnung` int(11) NOT NULL DEFAULT 0,
  `Timebans` int(11) DEFAULT NULL,
  `Datum` varchar(32) DEFAULT NULL,
  `Uhrzeit` varchar(32) DEFAULT NULL,
  `Prisons` int(11) NOT NULL DEFAULT 0,
  `Mission1` int(11) NOT NULL DEFAULT 0,
  `Mission2` int(11) NOT NULL DEFAULT 0,
  `Mission3` int(11) NOT NULL DEFAULT 0,
  `Mission4` int(11) NOT NULL DEFAULT 0,
  `Mission5` int(11) NOT NULL DEFAULT 0,
  `Mission6` int(11) NOT NULL DEFAULT 0,
  `Kanister` int(11) NOT NULL DEFAULT 0,
  `Likes` int(11) NOT NULL DEFAULT 0,
  `LastVote` varchar(128) DEFAULT NULL,
  `Team` int(11) NOT NULL DEFAULT 0,
  `UCP_DesignColor` int(11) NOT NULL DEFAULT 0,
  `ACEnable` int(11) NOT NULL DEFAULT 0,
  `AchivLeader` int(11) NOT NULL DEFAULT 0,
  `AchivMillion` int(11) NOT NULL DEFAULT 0,
  `AchivAuto` int(11) NOT NULL DEFAULT 0,
  `AchivJobGehalt` int(11) NOT NULL DEFAULT 0,
  `AchivFlugLic` int(11) NOT NULL DEFAULT 0,
  `AchivPfand` int(11) NOT NULL DEFAULT 0,
  `AchivVIP` int(11) NOT NULL DEFAULT 0,
  `AchivPaintball` int(11) NOT NULL DEFAULT 0,
  `AchivPerso` int(11) NOT NULL DEFAULT 0,
  `PayBackCard` int(11) NOT NULL DEFAULT 0,
  `PayBackPunkte` int(11) NOT NULL DEFAULT 0,
  `VPNOK` int(11) NOT NULL DEFAULT 0,
  `Akte` varchar(255) NOT NULL DEFAULT 'Keine Einträge vorhanden.',
  `Feuerzeug` int(11) NOT NULL DEFAULT 0,
  `Kontakt1` varchar(80) NOT NULL DEFAULT 'Niemand',
  `Kontakt2` varchar(80) NOT NULL DEFAULT 'Niemand',
  `Kontakt3` varchar(80) NOT NULL DEFAULT 'Niemand',
  `Kontakt4` varchar(80) NOT NULL DEFAULT 'Niemand',
  `Kontakt5` varchar(80) NOT NULL DEFAULT 'Niemand',
  `FischGewicht` int(11) NOT NULL DEFAULT 0,
  `GeldlieferSkill` int(11) NOT NULL DEFAULT 0,
  `ZweitKey` int(11) NOT NULL DEFAULT 0,
  `LegBroken` int(11) NOT NULL DEFAULT 0,
  `VictimBrille` int(11) NOT NULL DEFAULT 0,
  `VictimBrilleF` int(11) NOT NULL DEFAULT 0,
  `VictimCap` int(11) NOT NULL DEFAULT 0,
  `VictimCapF` int(11) NOT NULL DEFAULT 0,
  `VictimBandana` int(11) NOT NULL DEFAULT 0,
  `VictimBandanaF` int(11) NOT NULL DEFAULT 0,
  `sVictimBrilleOffX` double NOT NULL DEFAULT 0,
  `sVictimBrilleOffY` double NOT NULL DEFAULT 0,
  `sVictimBrilleOffZ` double NOT NULL DEFAULT 0,
  `sVictimBrilleRotX` double NOT NULL DEFAULT 0,
  `sVictimBrilleRotY` double NOT NULL DEFAULT 0,
  `sVictimBrilleRotZ` double NOT NULL DEFAULT 0,
  `sVictimBrilleScaX` double NOT NULL DEFAULT 0,
  `sVictimBrilleScaY` double NOT NULL DEFAULT 0,
  `sVictimBrilleScaZ` double NOT NULL DEFAULT 0,
  `sVictimCapOffX` double NOT NULL DEFAULT 0,
  `sVictimCapOffY` double NOT NULL DEFAULT 0,
  `sVictimCapOffZ` double NOT NULL DEFAULT 0,
  `sVictimCapRotX` double NOT NULL DEFAULT 0,
  `sVictimCapRotY` double NOT NULL DEFAULT 0,
  `sVictimCapRotZ` double NOT NULL DEFAULT 0,
  `sVictimCapScaX` double NOT NULL DEFAULT 0,
  `sVictimCapScaY` double NOT NULL DEFAULT 0,
  `sVictimCapScaZ` double NOT NULL DEFAULT 0,
  `sVictimBandanaOffX` double NOT NULL DEFAULT 0,
  `sVictimBandanaOffY` double NOT NULL DEFAULT 0,
  `sVictimBandanaOffZ` double NOT NULL DEFAULT 0,
  `sVictimBandanaRotX` double NOT NULL DEFAULT 0,
  `sVictimBandanaRotY` double NOT NULL DEFAULT 0,
  `sVictimBandanaRotZ` double NOT NULL DEFAULT 0,
  `sVictimBandanaScaX` double NOT NULL DEFAULT 0,
  `sVictimBandanaScaY` double NOT NULL DEFAULT 0,
  `sVictimBandanaScaZ` double NOT NULL DEFAULT 0,
  `PDSwat` int(11) NOT NULL DEFAULT 0,
  `BankAngelegt` int(11) NOT NULL DEFAULT 0 COMMENT '0',
  `BankAngelegtMoney` int(11) NOT NULL DEFAULT 0,
  `ICPCarlock` int(24) NOT NULL DEFAULT 0,
  `ICPFlock` int(24) NOT NULL DEFAULT 0,
  `ICPMotor` int(24) NOT NULL DEFAULT 0,
  `ICPLicht` int(24) NOT NULL DEFAULT 0,
  `EhePartner` varchar(24) DEFAULT NULL,
  `AchivCompleteFahrschule` int(11) NOT NULL DEFAULT 0,
  `AchivBuyHouse` int(11) NOT NULL DEFAULT 0,
  `AchivBuyBiz` int(11) NOT NULL DEFAULT 0,
  `AchivStaatsfraktion` int(11) NOT NULL DEFAULT 0,
  `AchivGangMafia` int(11) NOT NULL DEFAULT 0,
  `AchivCompleteTutorial` int(11) NOT NULL DEFAULT 0,
  `AchivTeammitglied` int(11) NOT NULL DEFAULT 0,
  `AirdropsTaken` int(11) NOT NULL DEFAULT 0,
  `AirdropsDeliver` int(11) NOT NULL DEFAULT 0,
  `Kills` int(11) NOT NULL DEFAULT 0,
  `Deaths` int(11) NOT NULL DEFAULT 0,
  `Assists` int(11) NOT NULL DEFAULT 0,
  `Xmasbonus` int(11) NOT NULL DEFAULT 0,
  `Obstkorb` int(12) NOT NULL DEFAULT 0,
  `Orangen` int(12) NOT NULL DEFAULT 0,
  `eastereggsfound` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


--
-- Tabellenstruktur für Tabelle `accplaytime`
--

CREATE TABLE `accplaytime` (
  `Name` varchar(24) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `PlayedTime` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `accplaytime`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accwarns`
--

CREATE TABLE `accwarns` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Teammitglied` varchar(24) NOT NULL,
  `Warngrund` varchar(64) NOT NULL,
  `Uhrzeit` varchar(16) NOT NULL,
  `Datum` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `allgemein`
--

CREATE TABLE `allgemein` (
  `ServerID` int(11) NOT NULL,
  `Rekord` int(11) NOT NULL,
  `DoubleEXP` int(11) NOT NULL DEFAULT 0,
  `DoublePayback` int(11) NOT NULL,
  `EasterEvent` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `allgemein`
--

INSERT INTO `allgemein` (`ServerID`, `Rekord`, `DoubleEXP`, `DoublePayback`, `EasterEvent`) VALUES
(1, 5, 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ammunation`
--

CREATE TABLE `ammunation` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL,
  `Preis` int(11) NOT NULL,
  `Pos_X` double NOT NULL,
  `Pos_Y` double NOT NULL,
  `Pos_Z` double NOT NULL,
  `Armour` int(11) NOT NULL,
  `Schlagring` int(11) NOT NULL,
  `Messer` int(11) NOT NULL,
  `Baseball` int(11) NOT NULL,
  `Deagle` int(11) NOT NULL,
  `MP5` int(11) NOT NULL,
  `AK` int(11) NOT NULL,
  `M4` int(11) NOT NULL,
  `Sniper` int(11) NOT NULL,
  `Fallschirm` int(11) NOT NULL,
  `Kasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `ammunation`
--

INSERT INTO `ammunation` (`ID`, `Besitzer`, `Preis`, `Pos_X`, `Pos_Y`, `Pos_Z`, `Armour`, `Schlagring`, `Messer`, `Baseball`, `Deagle`, `MP5`, `AK`, `M4`, `Sniper`, `Fallschirm`, `Kasse`) VALUES
(1, '', 3000000, 1368.051513, -1279.742797, 13.546875, 5000, 500, 400, 300, 2000, 3000, 2000, 2000, 4000, 100, 35694),
(2, '', 3000000, 1791.596557, -1164.169799, 23.828125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '', 3000000, 242.439682, -178.336822, 1.578125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '', 3000000, -2287.927246, -79.693222, 35.320312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '', 3000000, 2158.504638, 943.120239, 10.820312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `beta`
--

CREATE TABLE `beta` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Key` varchar(12) NOT NULL,
  `Aktiviert` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blitzer`
--

CREATE TABLE `blitzer` (
  `ID` int(11) NOT NULL,
  `Geschwindigkeit` int(11) NOT NULL,
  `Ort` varchar(64) NOT NULL,
  `PosX` double NOT NULL,
  `PosY` double NOT NULL,
  `PosZ` double NOT NULL,
  `PosA` double NOT NULL,
  `Ersteller` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carinfos`
--

CREATE TABLE `carinfos` (
  `ModelID` int(11) NOT NULL,
  `TankArt` int(11) NOT NULL DEFAULT 0,
  `Verbrauch` double NOT NULL,
  `Liter` int(11) NOT NULL,
  `Freikaufpreis` int(11) NOT NULL DEFAULT 1500,
  `Name` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `carinfos`
--

INSERT INTO `carinfos` (`ModelID`, `TankArt`, `Verbrauch`, `Liter`, `Freikaufpreis`, `Name`) VALUES
(400, 1, 0.6, 80, 1500, 'Landstalker'),
(401, 0, 0.95, 60, 1500, 'Bravura'),
(402, 0, 0.95, 60, 1500, 'Buffalo'),
(403, 0, 0.95, 80, 1500, 'Linerunner'),
(404, 0, 0.95, 60, 1500, 'Perenail'),
(405, 0, 0.95, 60, 1500, 'Sentinel'),
(406, 1, 0.6, 80, 1500, 'Dumper'),
(407, 1, 0.6, 80, 1500, 'Firetruck'),
(408, 1, 0.6, 80, 1500, 'Trashmaster'),
(409, 0, 0.95, 80, 1500, 'Stretch'),
(410, 0, 0.95, 40, 1500, 'Manana'),
(411, 1, 0.6, 60, 1500, 'Infernus'),
(412, 0, 0.9, 60, 1500, 'Voodoo'),
(413, 1, 0.6, 60, 1500, 'Pony'),
(414, 1, 0.6, 80, 1500, 'Mule'),
(415, 1, 0.6, 40, 1500, 'Cheetah'),
(416, 1, 0.6, 80, 1500, 'Ambulance'),
(417, 2, 1.4, 150, 1500, 'Levetian'),
(418, 0, 0.95, 80, 1500, 'Moonbeam'),
(419, 0, 0.95, 40, 1500, 'Esperanto'),
(420, 1, 0.6, 60, 1500, 'Taxi'),
(421, 0, 0.95, 40, 1500, 'Washington'),
(422, 0, 0.95, 60, 1500, 'Bobcat'),
(423, 0, 0.95, 60, 1500, 'Mr Whoopee'),
(424, 1, 0.6, 60, 1500, 'BF Injection'),
(425, 2, 1.4, 150, 1500, 'Hunter'),
(426, 0, 0.95, 60, 1500, 'Premier'),
(427, 1, 0.6, 80, 1500, 'Enforcer'),
(428, 1, 0.6, 60, 1500, 'Securicar'),
(429, 1, 0.6, 40, 1500, 'Banshee'),
(430, 1, 0.6, 100, 1500, 'Predator'),
(431, 0, 0.95, 80, 1500, 'Bus'),
(432, 0, 0.95, 80, 1500, 'Rhino'),
(433, 0, 0.95, 80, 1500, 'Barracks'),
(434, 0, 0.95, 40, 1500, 'Hotknife'),
(435, 0, 0.95, 60, 1500, 'Artic Trailer 1'),
(436, 0, 0.95, 60, 1500, 'Previon'),
(437, 1, 0.6, 80, 1500, 'Coach'),
(438, 0, 0.95, 60, 1500, 'Cabbie'),
(439, 0, 0.9, 40, 1500, 'Stallion'),
(440, 0, 0.9, 60, 1500, 'Rumpo'),
(441, 1, 0.6, 80, 1500, 'RC Bandit'),
(442, 0, 0.9, 60, 1500, 'Romero'),
(443, 0, 0.9, 80, 1500, 'Packer'),
(444, 0, 0.9, 80, 1500, 'Monster'),
(445, 0, 0.9, 60, 1500, 'Admiral'),
(446, 1, 0.6, 100, 1500, 'Squalo'),
(447, 2, 1.4, 100, 1500, 'Seasparrow'),
(448, 1, 0.6, 50, 1500, 'Pizza Boy'),
(449, 0, 0.9, 50, 1500, 'Tram'),
(450, 0, 0.9, 0, 1500, 'Artic Trailer 2'),
(451, 1, 0.6, 40, 1500, 'Turismo'),
(452, 1, 0.6, 100, 1500, 'Speeder'),
(453, 1, 0.6, 100, 1500, 'Reefer'),
(454, 1, 0.6, 100, 1500, 'Tropic'),
(455, 0, 0.9, 80, 1500, 'Flatbed'),
(456, 0, 0.9, 80, 1500, 'Yankee'),
(457, 0, 0.9, 40, 1500, 'Caddy'),
(458, 0, 0.9, 60, 1500, 'Solair'),
(459, 0, 1.1, 60, 1500, 'Top Fun'),
(460, 2, 1.4, 150, 1500, 'Skimmer'),
(461, 1, 0.6, 50, 1500, 'PCJ-600'),
(462, 0, 0.6, 50, 1500, 'Faggio'),
(463, 1, 0.6, 50, 1500, 'Freeway'),
(464, 2, 1.4, 0, 1500, ' RC Baron'),
(465, 2, 1.4, 0, 1500, 'RC Raider'),
(466, 0, 0.9, 60, 1500, 'Glendale'),
(467, 0, 0.9, 60, 1500, 'Oceanic'),
(468, 1, 0.6, 50, 1500, 'Sanchez'),
(469, 2, 1.4, 150, 1500, 'Sparrow'),
(470, 0, 0.9, 60, 1500, 'Patriot'),
(471, 1, 0.6, 50, 1500, 'Quad'),
(472, 1, 0.6, 100, 1500, 'Coastguard'),
(473, 1, 0.6, 100, 1500, 'Dinghy'),
(474, 0, 0.9, 60, 1500, 'Hermes'),
(475, 0, 0.9, 40, 1500, 'Sabre'),
(476, 2, 1.4, 150, 1500, 'Rustler'),
(477, 1, 0.6, 60, 1500, 'ZR-350'),
(478, 0, 0.9, 60, 1500, 'Walton'),
(479, 0, 0.9, 60, 1500, 'Regina'),
(480, 0, 0.9, 60, 1500, 'Comet'),
(481, 0, 0.9, 0, 1500, 'BMX'),
(482, 0, 0.9, 60, 1500, 'Burrito'),
(483, 0, 0.9, 50, 1500, 'Camper'),
(484, 1, 0.6, 100, 1500, 'Marquis'),
(485, 0, 0.9, 40, 1500, 'Baggage'),
(486, 0, 0.9, 80, 1500, 'Dozer'),
(487, 2, 1.75, 150, 1500, 'Maverick'),
(488, 2, 1.4, 150, 1500, 'SAN Maverick'),
(489, 1, 0.6, 80, 1500, 'Rancher'),
(490, 1, 0.6, 90, 1500, 'FBI Rancher'),
(491, 0, 0.9, 60, 1500, 'Virgo'),
(492, 0, 0.9, 60, 1500, 'Greenwood'),
(493, 1, 0.6, 100, 1500, 'Jetmax'),
(494, 1, 0.6, 60, 1500, 'Hotring'),
(495, 1, 0.6, 80, 1500, 'Sandking'),
(496, 0, 0.7, 40, 1500, 'Blista Compact'),
(497, 2, 1.75, 150, 1500, 'Police Maverick'),
(498, 0, 0.9, 80, 1500, 'Boxvillie'),
(499, 0, 0.9, 80, 1500, 'Benson'),
(500, 0, 0.9, 60, 1500, 'Mesa'),
(501, 2, 0.9, 150, 1500, 'RC Goblin'),
(502, 1, 0.6, 60, 1500, ' Hotring A'),
(503, 1, 0.6, 60, 1500, 'Hotring B'),
(504, 0, 0.9, 60, 1500, 'Bloodring Banger'),
(505, 1, 0.6, 80, 1500, ' 	Rancher (lure)'),
(506, 1, 0.6, 40, 1500, 'Super GT'),
(507, 0, 0.9, 60, 1500, 'Elegant'),
(508, 0, 0.9, 80, 1500, 'Journey'),
(509, 0, 0.9, 0, 1500, 'Bike'),
(510, 0, 0.9, 0, 1500, 'Mountain bike'),
(511, 2, 1.4, 150, 1500, 'Beagle'),
(512, 2, 1.4, 150, 1500, 'Cropduster'),
(513, 2, 1.4, 150, 1500, 'Stuntplane'),
(514, 1, 0.6, 80, 1500, 'Petrol'),
(515, 1, 0.6, 80, 1500, 'Roadtrain'),
(516, 0, 0.9, 60, 1500, 'Nebula'),
(517, 0, 0.9, 40, 1500, 'Majestic'),
(518, 0, 0.9, 60, 1500, 'Buccaneer'),
(519, 2, 1.4, 150, 1500, 'Shamal'),
(520, 2, 1.4, 150, 1500, 'Hydra'),
(521, 1, 0.82, 25, 1500, 'FCR-900'),
(522, 1, 0.82, 25, 1500, 'NRG-500'),
(523, 1, 0.6, 50, 1500, 'HPV-1000'),
(524, 0, 0.9, 40, 1500, ' 	Cement Truck'),
(525, 0, 1.25, 60, 1500, ' 	Tow Truck'),
(526, 0, 0.9, 40, 1500, 'Fortune'),
(527, 0, 0.9, 40, 1500, 'Cadrona'),
(528, 1, 0.6, 60, 1500, 'FBI Truck'),
(529, 0, 0.9, 40, 1500, 'Williard'),
(530, 0, 0.9, 50, 1500, 'Forklift'),
(531, 1, 0.6, 40, 1500, 'Tractor'),
(532, 1, 0.8, 80, 1500, 'Combine'),
(533, 0, 1.05, 60, 1500, 'Feltzer'),
(534, 0, 0.9, 60, 1500, 'Remington'),
(535, 0, 0.9, 60, 1500, 'Slamvan'),
(536, 0, 0.9, 60, 1500, 'Blade'),
(537, 0, 0.9, 80, 1500, 'Freight'),
(538, 0, 0.9, 80, 1500, 'Streak'),
(539, 1, 0.6, 60, 1500, 'Vortex'),
(540, 0, 0.9, 60, 1500, 'Vincent'),
(541, 1, 0.6, 40, 1500, 'Bullet'),
(542, 0, 0.9, 60, 1500, 'Clover'),
(543, 0, 0.9, 60, 1500, 'Sadler'),
(544, 1, 0.6, 80, 1500, 'Firetruck LS'),
(545, 0, 0.9, 40, 1500, 'Hustler'),
(546, 0, 0.9, 40, 1500, 'Intruder'),
(547, 0, 0.9, 60, 1500, 'Primo'),
(548, 2, 1.4, 150, 1500, 'Cargobob'),
(549, 0, 0.9, 60, 1500, 'Tampa'),
(550, 0, 0.9, 60, 1500, 'Sunrise'),
(551, 0, 0.9, 60, 1500, 'Merit'),
(552, 1, 0.6, 60, 1500, 'Utility Van'),
(553, 2, 1.4, 150, 1500, 'Nevada'),
(554, 1, 0.6, 60, 1500, 'Yosemite'),
(555, 0, 0.9, 40, 1500, 'Windsor'),
(556, 0, 0.9, 80, 1500, 'Monster A'),
(557, 0, 0.9, 80, 1500, 'Monster B'),
(558, 1, 0.6, 60, 1500, 'Uranus'),
(559, 1, 0.8, 40, 1500, 'Jester'),
(560, 0, 1.05, 60, 1500, 'Sultan'),
(561, 1, 0.6, 60, 1500, 'Stratum'),
(562, 1, 0.6, 40, 1500, 'Elegy'),
(563, 2, 1.4, 150, 1500, 'Raindance'),
(564, 0, 0.9, 0, 1500, 'RC Tiger'),
(565, 0, 0.9, 40, 1500, 'Flash'),
(566, 0, 0.9, 60, 1500, 'Tahoma'),
(567, 0, 0.9, 60, 1500, 'Savanna'),
(568, 0, 0.9, 40, 1500, 'Bandito'),
(569, 0, 0.9, 0, 1500, ' 	Freight Flat'),
(570, 0, 0.9, 0, 1500, 'Streak'),
(571, 0, 0.9, 40, 1500, 'Kart'),
(572, 1, 0.6, 40, 1500, 'Mower'),
(573, 1, 0.6, 80, 1500, 'Duneride'),
(574, 0, 0.9, 40, 1500, 'Sweeper'),
(575, 0, 0.9, 60, 1500, 'Broadway'),
(576, 0, 0.9, 60, 1500, 'Tornado'),
(577, 2, 1.4, 100, 1500, 'AT-400'),
(578, 1, 0.6, 80, 1500, 'DFT-30'),
(579, 1, 1.05, 80, 1500, 'Huntley'),
(580, 0, 1.5, 80, 1500, 'Stafford'),
(581, 1, 0.8, 50, 1500, 'BF-400'),
(582, 0, 0.9, 60, 1500, 'News van'),
(583, 0, 0.9, 40, 1500, 'Tug'),
(584, 0, 0.9, 0, 1500, 'Petrol Tanker'),
(585, 0, 0.9, 60, 1500, 'Emperor'),
(586, 1, 0.8, 50, 1500, 'Wayfarer'),
(587, 0, 0.9, 40, 1500, 'Euros'),
(588, 0, 0.9, 60, 1500, 'Hotdog'),
(589, 1, 0.8, 40, 1500, 'Club'),
(590, 0, 0.9, 0, 1500, 'Freight Box'),
(591, 0, 0.9, 0, 1500, 'Artic Trailer'),
(592, 2, 1.4, 150, 1500, 'Andromada'),
(593, 2, 1.4, 150, 1500, 'Dodo'),
(594, 0, 0.9, 0, 1500, 'RC Cam'),
(595, 1, 0.85, 100, 1500, 'Launch'),
(596, 1, 0.85, 80, 1500, 'Cop Car LS'),
(597, 1, 0.85, 80, 1500, 'Cop Car SF'),
(598, 1, 0.85, 80, 1500, 'Cop Cop LV'),
(599, 1, 0.4, 80, 3000, 'Ranger'),
(600, 0, 1.1, 60, 1500, 'Picador'),
(601, 1, 0.6, 80, 5000, 'Swat Tank'),
(602, 0, 0.9, 40, 1500, 'Alpha'),
(603, 0, 0.9, 60, 1500, 'Phoenix'),
(604, 0, 0.9, 60, 1500, 'Glendale (damaged)'),
(605, 0, 0.9, 60, 1500, ' 	Sadler (damaged)'),
(606, 0, 0.9, 0, 1500, 'Bag Box A'),
(607, 0, 0.9, 0, 1500, 'Bag Box B'),
(608, 0, 0.9, 50, 1500, 'Stairs'),
(609, 0, 0.9, 80, 1500, ' Boxville (black)'),
(610, 0, 0.9, 0, 1500, 'Farm Trailer'),
(611, 0, 0.9, 0, 1500, 'Utility Trailer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `CASINO_POOLS`
--

CREATE TABLE `CASINO_POOLS` (
  `ID` int(11) NOT NULL,
  `POOL` int(11) DEFAULT 0,
  `TOTAL_WINNINGS` int(11) DEFAULT 0,
  `TOTAL_GAMBLED` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `CASINO_POOLS`
--

INSERT INTO `CASINO_POOLS` (`ID`, `POOL`, `TOTAL_WINNINGS`, `TOTAL_GAMBLED`) VALUES
(0, 5000000, 0, 0),
(1, 25000000, 0, 0),
(2, 100020000, 0, 25000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `date_of_creation` datetime NOT NULL,
  `creator` varchar(45) NOT NULL,
  `perpetrator` varchar(45) NOT NULL,
  `case` varchar(45) NOT NULL,
  `info` text NOT NULL,
  `screen_1` varchar(120) NOT NULL,
  `screen_2` varchar(120) NOT NULL,
  `screen_3` varchar(120) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `config`
--

CREATE TABLE `config` (
  `Index` int(11) NOT NULL,
  `Config` varchar(16) DEFAULT NULL,
  `ValueStr` varchar(32) DEFAULT NULL,
  `ValueInt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `config`
--

INSERT INTO `config` (`Index`, `Config`, `ValueStr`, `ValueInt`) VALUES
(14, 'LottoGewinn', '0', 240),
(15, 'Beta', '0', 0),
(16, 'Feuer', '0', 16),
(17, 'Eventboxes', '0', 0),
(18, 'UCP-Wartung', '0', 0),
(19, 'UCP-Casino', '0', 1),
(20, 'UCP-Roulette', '0', 1),
(21, 'UCP-Wheel', '0', 1),
(22, 'UCP-Bank', '0', 1),
(23, 'UCP-Auktionshaus', '0', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `contracts`
--

CREATE TABLE `contracts` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Contract` varchar(24) NOT NULL,
  `Preis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `drogenpflanzen`
--

CREATE TABLE `drogenpflanzen` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL,
  `PosX` double NOT NULL,
  `PosY` double NOT NULL,
  `PosZ` double NOT NULL,
  `Reife` int(11) NOT NULL DEFAULT 0,
  `FrakID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `dynamic_atms`
--

CREATE TABLE `dynamic_atms` (
  `ID` int(11) NOT NULL,
  `PosX` double NOT NULL,
  `PosY` double NOT NULL,
  `PosZ` double NOT NULL,
  `PosA` double NOT NULL,
  `Ort` varchar(128) NOT NULL,
  `Betrag` int(11) NOT NULL DEFAULT 10000
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `dynamic_atms`
--

INSERT INTO `dynamic_atms` (`ID`, `PosX`, `PosY`, `PosZ`, `PosA`, `Ort`, `Betrag`) VALUES
(1, 1501.576538, -1743.380981, 13.192808, 0.03844, 'Commerce', 10000),
(2, 1763.908813, -1884.103393, 13.19454, 0.065104, 'El Corona', 10000),
(3, 1928.579345, -1772.226562, 13.172807, 89.842636, 'Idlewood', 10000),
(4, 1173.276367, -1337.155639, 13.601047, 90.378433, 'Market', 10000),
(5, 1201.404541, -915.079956, 42.993705, 8.042025, 'Temple', 10000),
(6, 1000.933898, -923.212768, 41.94971, -82.117835, 'Mulholland', 10000),
(7, 1237.018676, -1158.328735, 23.192174, 179.800994, 'Market', 10000),
(8, 649.2677, -1357.264648, 13.177701, -90.563217, 'Vinewood', 10000),
(9, 461.809173, -1506.31726, 30.624155, -96.977035, 'Rodeo', 10000),
(10, 378.649932, -2062.056152, 7.455934, 89.83229, 'Santa Maria Beach', 10000),
(11, 1087.235473, -1687.955444, 12.91403, 179.176971, 'Verona Beach', 10000),
(12, 1367.246826, -1290.16748, 13.166866, -90.072624, 'Market', 10000),
(13, 1796.320556, -1165.124389, 23.448116, -12.848535, 'Downtown Los Santos', 10000),
(14, 2105.454589, -1809.082275, 13.164678, -90.187744, 'Idlewood', 10000),
(16, 1837.216064, -1406.907836, 13.16249, 90.907974, 'Glen Park', 10000);

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
  `lastPick` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Daten für Tabelle `eastereggs`
--

INSERT INTO `eastereggs` (`id`, `model`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `lastPick`) VALUES
(1, 19341, 814.284, -1806.78, 13.0234, 0, 0, 0, '2023-04-15 15:41:15'),
(2, 19341, 846.329, -1854.69, 8.4944, 0, 0, 0, '2023-04-15 15:41:04'),
(3, 19341, 500.478, -1873.77, 4.67697, 0, 0, 0, '2023-04-15 15:41:26'),
(4, 19341, 385.882, -1880.07, 2.66097, 0, 0, 0, '2023-04-15 15:39:51'),
(5, 19341, 109.076, -1733.73, 8.77193, 0, 0, 0, '2023-04-15 15:41:37'),
(6, 19341, 65.2753, -1534.22, 5.15666, 0, 0, 0, '2023-04-15 15:41:48'),
(7, 19341, -96.7051, -1438.56, 7.85491, 0, 0, 0, '2023-04-15 15:40:29'),
(8, 19341, -87.9155, -1434.07, 6.54925, 0, 0, 0, '2023-04-15 15:40:39'),
(9, 19341, -110.563, -1178.59, 2.89062, 0, 0, 0, '2023-04-15 15:40:17'),
(10, 19341, -77.9371, -1182.93, 5.6728, 0, 0, 0, '2023-04-15 15:40:04'),
(11, 19341, -89.0903, -1169.66, 7.74387, 0, 0, 0, '2023-04-11 13:31:11'),
(12, 19341, -102.45, -1027.29, 13.7116, 0, 0, 0, '2023-04-15 15:38:10'),
(13, 19341, -146.444, -1028.03, 1.2646, 0, 0, 0, '2023-04-15 15:37:55'),
(14, 19341, -152.526, -1031.33, 1.69678, 0, 0, 0, '2023-04-15 15:37:47'),
(15, 19341, -167.705, -1041.75, 11.0911, 0, 0, 0, '2023-04-15 15:37:38'),
(16, 19341, -173.734, -1029.19, 11.8626, 0, 0, 0, '2023-04-15 15:37:29'),
(17, 19341, -206.92, -1017.1, 17.5393, 0, 0, 0, '2023-04-15 15:40:56'),
(18, 19341, -219.875, -989.286, 19.7518, 0, 0, 0, '2023-04-15 15:37:15'),
(19, 19341, -282.506, -982.95, 41.7913, 0, 0, 0, '2023-04-15 15:40:47'),
(20, 19341, -371.46, -976.561, 55.8761, 0, 0, 0, '2023-04-15 15:39:28'),
(21, 19341, -424.772, -979.114, 41.667, 0, 0, 0, '2023-04-15 09:17:31'),
(22, 19343, 290.561, -1328.9, 53.4436, 0, 0, 0, NULL),
(23, 19341, 1922.71, -1774.04, 17.9766, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_einsatzdata`
--

CREATE TABLE `einsatzsys_einsatzdata` (
  `ID` int(12) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `X` double NOT NULL,
  `Y` double NOT NULL,
  `Z` double NOT NULL,
  `Beschreibung` varchar(256) NOT NULL,
  `MinFire` int(12) NOT NULL,
  `MinCops` int(12) NOT NULL,
  `MaxTime` int(12) NOT NULL,
  `MinMedic` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_fires`
--

CREATE TABLE `einsatzsys_fires` (
  `ID` int(12) NOT NULL,
  `EinsatzID` int(12) NOT NULL,
  `X` double NOT NULL,
  `Y` double NOT NULL,
  `Z` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_npcs`
--

CREATE TABLE `einsatzsys_npcs` (
  `ID` int(12) NOT NULL,
  `EinsatzID` int(12) NOT NULL,
  `X` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_objects`
--

CREATE TABLE `einsatzsys_objects` (
  `ID` int(12) NOT NULL,
  `EinsatzID` int(12) NOT NULL,
  `X` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_vehs`
--

CREATE TABLE `einsatzsys_vehs` (
  `ID` int(12) NOT NULL,
  `EinsatzID` int(12) NOT NULL,
  `Model` int(12) NOT NULL,
  `X` double NOT NULL,
  `Y` double NOT NULL,
  `Z` double NOT NULL,
  `A` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `einsatzsys_verltypes`
--

CREATE TABLE `einsatzsys_verltypes` (
  `ID` int(12) NOT NULL,
  `Name` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `einsatzsys_verltypes`
--

INSERT INTO `einsatzsys_verltypes` (`ID`, `Name`) VALUES
(1, 'Herzinfarkt'),
(2, 'Schlaganfall'),
(3, 'gestürzte Person'),
(4, 'Rauchvergiftung'),
(5, 'Schädelbasisbruch'),
(6, 'Blinddarmentzündung'),
(7, 'Beinfraktur'),
(8, 'Armfraktur'),
(9, 'Alkoholintoxikation'),
(10, 'Kreislaufzusammenbruch'),
(11, 'Unterkühlung');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `eventboxen`
--

CREATE TABLE `eventboxen` (
  `ID` int(11) NOT NULL,
  `ObjectID` int(11) NOT NULL,
  `Pos_X` double NOT NULL,
  `Pos_Y` double NOT NULL,
  `Pos_Z` double NOT NULL,
  `Gift` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `frakequip`
--

CREATE TABLE `frakequip` (
  `frakid` int(11) NOT NULL,
  `Equip1Name` varchar(32) NOT NULL DEFAULT 'Equip1',
  `Equip2Name` varchar(32) NOT NULL DEFAULT 'Equip2',
  `Equip3Name` varchar(32) NOT NULL DEFAULT 'Equip3',
  `Equip1Waffe1` int(11) NOT NULL,
  `Equip1Waffe2` int(11) NOT NULL,
  `Equip1Waffe3` int(11) NOT NULL,
  `Equip1Waffe4` int(11) NOT NULL,
  `Equip1Waffe5` int(11) NOT NULL,
  `Equip2Waffe1` int(11) NOT NULL,
  `Equip2Waffe2` int(11) NOT NULL,
  `Equip2Waffe3` int(11) NOT NULL,
  `Equip2Waffe4` int(11) NOT NULL,
  `Equip2Waffe5` int(11) NOT NULL,
  `Equip3Waffe1` int(11) NOT NULL,
  `Equip3Waffe2` int(11) NOT NULL,
  `Equip3Waffe3` int(11) NOT NULL,
  `Equip3Waffe4` int(11) NOT NULL,
  `Equip3Waffe5` int(11) NOT NULL,
  `Equip1Rang` int(11) NOT NULL,
  `Equip2Rang` int(11) NOT NULL,
  `Equip3Rang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `frakequip`
--

INSERT INTO `frakequip` (`frakid`, `Equip1Name`, `Equip2Name`, `Equip3Name`, `Equip1Waffe1`, `Equip1Waffe2`, `Equip1Waffe3`, `Equip1Waffe4`, `Equip1Waffe5`, `Equip2Waffe1`, `Equip2Waffe2`, `Equip2Waffe3`, `Equip2Waffe4`, `Equip2Waffe5`, `Equip3Waffe1`, `Equip3Waffe2`, `Equip3Waffe3`, `Equip3Waffe4`, `Equip3Waffe5`, `Equip1Rang`, `Equip2Rang`, `Equip3Rang`) VALUES
(2, 'Streifendienst I', 'Streifendienst II', 'Sondereinsatzkommando', 3, 24, 25, 0, 0, 3, 24, 25, 29, 31, 16, 24, 29, 31, 34, 0, 2, 4),
(3, 'Equip1', 'Equip2', 'Equip3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 'Equip1', 'Equip2', 'Equip3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `frakinfos`
--

CREATE TABLE `frakinfos` (
  `FID` int(11) NOT NULL,
  `Members` int(11) NOT NULL DEFAULT 0,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Mats` int(11) NOT NULL DEFAULT 0,
  `Drogen` int(11) NOT NULL DEFAULT 0,
  `Bomben` int(11) NOT NULL,
  `WarGegner` int(11) NOT NULL DEFAULT 0,
  `WarPoints` int(11) NOT NULL DEFAULT 0,
  `GVerbrecher` int(11) NOT NULL DEFAULT 0,
  `UCPAllow` int(11) NOT NULL DEFAULT 1,
  `Beschreibung` varchar(1000) NOT NULL DEFAULT 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.',
  `Gehalt_Rang0` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang1` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang2` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang3` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang4` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang5` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang6` int(11) NOT NULL DEFAULT 0,
  `Gehalt_Rang7` int(11) NOT NULL DEFAULT 0,
  `Gehalt_TRang1` int(11) NOT NULL,
  `Gehalt_TRang2` int(11) NOT NULL,
  `Gehalt_TRang3` int(11) NOT NULL,
  `Gehalt_TRang4` int(11) NOT NULL,
  `Gehalt_TRang5` int(11) NOT NULL,
  `Gehalt_TRang6` int(11) NOT NULL,
  `Gehalt_TRang7` int(11) NOT NULL,
  `Bild` varchar(255) NOT NULL,
  `Skinordnung` int(11) NOT NULL DEFAULT 1,
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
  `MaskeCMD` int(11) NOT NULL DEFAULT 0,
  `Undercover1` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover2` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover3` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover4` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover5` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover6` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover7` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover8` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover9` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `Undercover10` varchar(24) NOT NULL DEFAULT 'Kein_Name',
  `ActiveDeactivate` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `frakinfos`
--

INSERT INTO `frakinfos` (`FID`, `Members`, `Kasse`, `Mats`, `Drogen`, `Bomben`, `WarGegner`, `WarPoints`, `GVerbrecher`, `UCPAllow`, `Beschreibung`, `Gehalt_Rang0`, `Gehalt_Rang1`, `Gehalt_Rang2`, `Gehalt_Rang3`, `Gehalt_Rang4`, `Gehalt_Rang5`, `Gehalt_Rang6`, `Gehalt_Rang7`, `Gehalt_TRang1`, `Gehalt_TRang2`, `Gehalt_TRang3`, `Gehalt_TRang4`, `Gehalt_TRang5`, `Gehalt_TRang6`, `Gehalt_TRang7`, `Bild`, `Skinordnung`, `BaseZugang`, `Baseheal`, `BND9`, `BND10`, `BND11`, `BND12`, `BND13`, `BND14`, `BND15`, `BND16`, `BND17`, `BND18`, `Gangpunkte`, `DrogenUpgrade`, `AmmunationUpgrade`, `BasehealUpgrade`, `GangzonenUpgrade`, `MatsUpgrade`, `Masken`, `KidnapCMD`, `SelldrugsCMD`, `GangfightCMD`, `BasehealCMD`, `MaskeCMD`, `Undercover1`, `Undercover2`, `Undercover3`, `Undercover4`, `Undercover5`, `Undercover6`, `Undercover7`, `Undercover8`, `Undercover9`, `Undercover10`, `ActiveDeactivate`) VALUES
(1, 13, 22500425, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(2, 17, 3906790, 0, 0, 0, 0, 0, 4, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Skywrath', 'Ursa', 'Outworld', 'Clinkz', 'Underlord', 'Juggernaut', 'Bloodseeker', 'Natures_Prophet', 'Ogre_Magi', 'Windranger', 0),
(3, 2, 2000000, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(4, 5, 2000000, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(5, 4, 2629671, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(6, 2, 2000000, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(7, 2, 2010000, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(8, 2, 2001770, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(9, 7, 1674250, 69240, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1001, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(10, 1, 2000000, 50000, 0, 1, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1002, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 3, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(11, 1, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(12, 1, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(13, 1, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(14, 1, 2000000, 50000, 0, 0, 15, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(15, 12, 3245500, 6889, 168, 1, 14, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 527, 1, 1, 1, 1, 1, 15, 3, 2, 5, 1, 2, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(16, 1, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(17, 1, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(18, 4, 2000000, 50000, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0),
(19, 7, 2000000, 0, 0, 0, 0, 0, 0, 1, 'Die Fraktionsleitung hat keine Beschreibung über diese Fraktion angegeben.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 1, 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 'Kein_Name', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fraktionen`
--

CREATE TABLE `fraktionen` (
  `ID` int(11) NOT NULL,
  `Name` varchar(40) DEFAULT NULL,
  `frakMembers` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `fraktionen`
--

INSERT INTO `fraktionen` (`ID`, `Name`, `frakMembers`) VALUES
(1, 'San Andreas Government', 0),
(2, 'Los Santos Police Department', 0),
(3, 'Keine Fraktion', 0),
(4, 'Keine Fraktion', 0),
(5, 'San Andreas Rettungsdienst', 0),
(6, 'Federal Bureau of Investigation', 0),
(7, 'San Andreas Ordnungsamt', 0),
(8, 'San Andreas News', 0),
(9, 'Grove Street', 0),
(10, 'Rollin High Ballas', 0),
(11, 'Los Santos Vagos', 0),
(12, 'Keine Fraktion', 0),
(13, 'San Fierro Rifas', 0),
(14, 'Triaden', 0),
(15, 'Yakuza', 0),
(16, 'Keine Fraktion', 0),
(17, 'La Cosa Nostra', 0),
(18, 'Russian Mafia', 0),
(19, 'Wheelman Agency', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `freikaufpreise`
--

CREATE TABLE `freikaufpreise` (
  `ID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `Preis` int(11) NOT NULL DEFAULT 500
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gangzones`
--

CREATE TABLE `gangzones` (
  `GID` int(11) NOT NULL,
  `GangzoneX1` double NOT NULL,
  `GangzoneY1` double NOT NULL,
  `GangzoneX2` double NOT NULL,
  `GangzoneY2` double NOT NULL,
  `Owner` int(11) NOT NULL,
  `Attacker` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `OwnerPunkte` int(11) NOT NULL,
  `AttackerPunkte` int(11) NOT NULL,
  `CTFX` double NOT NULL,
  `CTFY` double NOT NULL,
  `CTFZ` double NOT NULL,
  `LastFight` int(11) NOT NULL DEFAULT 0,
  `FightTime` int(11) NOT NULL DEFAULT 0,
  `Gebiet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `gangzones`
--

INSERT INTO `gangzones` (`GID`, `GangzoneX1`, `GangzoneY1`, `GangzoneX2`, `GangzoneY2`, `Owner`, `Attacker`, `Type`, `Value`, `OwnerPunkte`, `AttackerPunkte`, `CTFX`, `CTFY`, `CTFZ`, `LastFight`, `FightTime`, `Gebiet`) VALUES
(1, 2422.520996, -1876.885253, 2310.520996, -1988.885253, 15, 0, 1, 42185, 0, 0, 2378.0681, -1935.3723, 12.5469, 0, 0, 0),
(2, 2722.843994, -1965.385253, 2626.843994, -2045.385253, 15, 0, 2, 10195, 0, 0, 2635.0061, -2001.9636, 12.5544, 0, 0, 0),
(3, 2292.075439, -1401.131835, 2204.075439, -1481.131835, 15, 0, 3, 48, 0, 0, 2262.397, -1433.0641, 23.0053, 0, 0, 0),
(4, 2209.264404, 216.15094, 2547.237793, -84.083565, 15, 0, 1, 40792, 0, 0, 2264.656006, 70.24926, 31.983433, 0, 0, 1),
(5, 786.21875, -1207.211303, 642.21875, -1319.211303, 15, 0, 2, 10369, 0, 0, 691.1516, -1275.9996, 12.5604, 0, 0, 0),
(6, 851.810668, -520.363037, 771.810668, -616.363037, 15, 0, 3, 48, 0, 0, 803.9826, -612.9736, 15.3432, 0, 0, 0),
(7, 817.991027, -1583.265502, 737.991027, -1687.265502, 15, 0, 1, 41008, 0, 0, 791.4386, -1621.16785, 12.29772, 0, 0, 0),
(8, 2041.667114, -1743.831299, 2091.570068, -1622.181763, 0, 0, 1, 0, 0, 0, 2041.223877, -1704.187744, 13.554684, 0, 0, 1),
(9, 1578.26355, 782.837219, 1757.029175, 664.123596, 0, 0, 1, 0, 0, 0, 1688.495972, 718.815613, -2, 0, 0, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `garagen`
--

CREATE TABLE `garagen` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL,
  `Preis` int(11) NOT NULL,
  `Ort` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `Mietbar` int(11) NOT NULL,
  `Miete` int(11) NOT NULL,
  `Pos_X` double NOT NULL,
  `Pos_Y` double NOT NULL,
  `Pos_Z` double NOT NULL,
  `OPos_X` double NOT NULL,
  `OPos_Y` double NOT NULL,
  `OPos_Z` double NOT NULL,
  `OPos_A` double NOT NULL,
  `Fahrzeug1` int(11) NOT NULL,
  `Fahrzeug2` int(11) NOT NULL,
  `Fahrzeug3` int(11) NOT NULL,
  `Fahrzeug4` int(11) NOT NULL,
  `Fahrzeug5` int(11) NOT NULL,
  `Fahrzeug6` int(11) NOT NULL,
  `Fahrzeug7` int(11) NOT NULL,
  `Fahrzeug8` int(11) NOT NULL,
  `Fahrzeug9` int(11) NOT NULL,
  `Fahrzeug10` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Daten für Tabelle `garagen`
--

INSERT INTO `garagen` (`ID`, `Besitzer`, `Preis`, `Ort`, `Locked`, `Mietbar`, `Miete`, `Pos_X`, `Pos_Y`, `Pos_Z`, `OPos_X`, `OPos_Y`, `OPos_Z`, `OPos_A`, `Fahrzeug1`, `Fahrzeug2`, `Fahrzeug3`, `Fahrzeug4`, `Fahrzeug5`, `Fahrzeug6`, `Fahrzeug7`, `Fahrzeug8`, `Fahrzeug9`, `Fahrzeug10`) VALUES
(1, '', 225000, 1, 0, 0, 0, 1847.404174, -1761.440429, 13.546875, 1848.816406, -1757.857788, 13.167663, 94.352363, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '', 225000, 1, 0, 0, 0, 1866.021362, -1761.421875, 13.546875, 1866.088989, -1758.035034, 13.166523, 91.028694, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 'ShadowKev1999', 225000, 1, 1, 0, 0, 1884.874023, -1761.267456, 13.546875, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '', 225000, 1, 0, 0, 0, 1654.98767, -1863.121582, 13.534399, 1655.496826, -1868.076293, 13.16021, 89.47541, 0, 0, 579, 0, 0, 0, 0, 0, 0, 0),
(5, '', 225000, 1, 0, 0, 0, 1639.92395, -1863.953125, 13.537779, 1639.965698, -1868.022583, 13.161445, 89.689926, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '', 225000, 1, 0, 0, 0, 1631.954711, -1864.031372, 13.546875, 1631.859619, -1868.013183, 13.164455, 89.758255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '', 225000, 1, 0, 0, 0, 1652.828857, -1841.280761, 13.545263, 1646.81311, -1837.123779, 13.249505, 92.105224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '', 225000, 1, 0, 0, 0, 1657.555297, -1838.10498, 13.547192, 1653.275268, -1833.154907, 13.254367, 52.659465, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '', 225000, 1, 0, 0, 0, 1659.158813, -1821.019409, 13.551077, 1653.916992, -1820.922729, 13.247972, 90.524002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '', 225000, 1, 0, 0, 0, 1658.919067, -1807.322998, 13.550726, 1654.034057, -1806.754028, 13.24903, 87.649971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '', 225000, 1, 0, 0, 0, 1602.124145, -1824.712158, 13.458395, 1605.54956, -1824.298095, 13.172292, 271.21997, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, '', 225000, 1, 0, 0, 0, 1602.539672, -1836.945922, 13.497717, 1605.66101, -1835.909301, 13.208221, 275.41397, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, '', 225000, 1, 0, 0, 0, 1606.448852, -1840.716552, 13.509072, 1613.231567, -1840.655273, 13.22942, 268.501861, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '', 225000, 1, 0, 0, 0, 1041.027709, -1056.085327, 31.703125, 1041.340576, -1052.414306, 31.408609, 359.605346, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '', 225000, 1, 0, 0, 0, 1028.29602, -1055.774902, 31.666507, 1028.992919, -1050.015502, 31.34061, 359.892425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '', 225000, 1, 0, 0, 0, 1016.143127, -1053.766479, 31.14377, 1015.924011, -1050.369018, 31.268114, 0.665329, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '', 225000, 1, 0, 0, 0, 1004.263183, -1053.374511, 31.014911, 1004.394226, -1049.561279, 31.021965, 2.166803, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '', 225000, 1, 0, 0, 0, 1421.132202, -917.17102, 36.046875, 1421.981323, -923.691955, 35.735084, 172.757888, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '', 225000, 1, 0, 0, 0, 1450.684082, -922.574768, 37.593051, 1452.650878, -927.803344, 37.087589, 171.125473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, '', 75000, 1, 0, 0, 0, 284.882537, -1153.988769, 80.914062, 289.502014, -1159.38916, 80.614364, 224.735824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, '', 75000, 1, 0, 0, 0, 280.859344, -1158.006835, 80.914062, 285.735015, -1163.692138, 80.616378, 221.631378, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, '', 50000, 3, 0, 0, 0, -798.369934, 2418.155517, 156.903274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, '', 100000, 1, 0, 0, 0, 1248.874633, -800.886291, 84.140625, 0, 0, 0, 0, 0, 409, 0, 0, 0, 0, 0, 0, 0, 0),
(24, '', 50000, 1, 0, 0, 0, 1118.231689, -1318.078247, 13.631562, 1092.177978, -1336.777587, 13.140359, 97.920944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, '', 50000, 1, 0, 0, 0, 1120.630981, -1371.598632, 13.850592, 1092.177978, -1336.777587, 13.140359, 97.920944, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, '', 250000, 1, 1, 0, 0, 1254.904418, -881.702758, 42.882812, 1255.161621, -887.94049, 42.592037, 188.225479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, '', 250000, 1, 0, 0, 0, 1295.199218, -877.283508, 42.95436, 1287.367431, -885.540771, 42.532024, 96.008193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `grangnamen`
--

CREATE TABLE `grangnamen` (
  `gid` int(11) NOT NULL,
  `1` varchar(24) NOT NULL DEFAULT 'Rang 1',
  `2` varchar(24) NOT NULL DEFAULT 'Rang 2',
  `3` varchar(24) NOT NULL DEFAULT 'Rang 3',
  `4` varchar(24) NOT NULL DEFAULT 'Rang 4',
  `5` varchar(24) NOT NULL DEFAULT 'Rang 5',
  `6` varchar(24) NOT NULL DEFAULT 'Rang 6',
  `7` varchar(24) NOT NULL DEFAULT 'Rang 7'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Daten für Tabelle `grangnamen`
--

INSERT INTO `grangnamen` (`gid`, `1`, `2`, `3`, `4`, `5`, `6`, `7`) VALUES
(1, 'Azubi', 'Mitarbeiter', 'Betriebsrat', 'Ausbilder', 'Ausbildungsleiter', 'Stv.Geschäftsführer', 'Geschäftsführer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gruppen`
--

CREATE TABLE `gruppen` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Kennzeichen` varchar(11) NOT NULL,
  `Kasse` int(11) NOT NULL,
  `GehaltUpgrade` int(11) NOT NULL,
  `Gehalt_Rang1` int(11) NOT NULL,
  `Gehalt_Rang2` int(11) NOT NULL,
  `Gehalt_Rang3` int(11) NOT NULL,
  `Gehalt_Rang4` int(11) NOT NULL,
  `Gehalt_Rang5` int(11) NOT NULL,
  `Gehalt_Rang6` int(11) NOT NULL,
  `Gehalt_Rang7` int(11) NOT NULL,
  `Bild` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hauser`
--

CREATE TABLE `hauser` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL DEFAULT '',
  `Preis` int(11) NOT NULL,
  `Ort` int(11) NOT NULL,
  `Typ` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `Locked` int(11) NOT NULL DEFAULT 0,
  `Mietbar` int(11) NOT NULL DEFAULT 0,
  `Miete` int(11) NOT NULL DEFAULT 0,
  `Health` int(11) NOT NULL DEFAULT 0,
  `Pos_X` double NOT NULL,
  `Pos_Y` double NOT NULL,
  `Pos_Z` double NOT NULL,
  `IPos_X` double NOT NULL,
  `IPos_Y` double NOT NULL,
  `IPos_Z` double NOT NULL,
  `Gruppe` int(11) NOT NULL DEFAULT 0,
  `GruppenAnzeige` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `hauser`
--

INSERT INTO `hauser` (`ID`, `Besitzer`, `Preis`, `Ort`, `Typ`, `Interior`, `Locked`, `Mietbar`, `Miete`, `Health`, `Pos_X`, `Pos_Y`, `Pos_Z`, `IPos_X`, `IPos_Y`, `IPos_Z`, `Gruppe`, `GruppenAnzeige`) VALUES
(1, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1188.491333, -1011.798706, 36.226699, 223.043991, 1289.259888, 1082.199951, 0, 0),
(2, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1195.669555, -1010.820861, 36.226699, 223.043991, 1289.259888, 1082.199951, 0, 0),
(3, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1196.09497, -1017.03955, 36.234375, 223.043991, 1289.259888, 1082.199951, 0, 0),
(4, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1189.280029, -1017.997802, 36.234375, 223.043991, 1289.259888, 1082.199951, 0, 0),
(5, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1227.124023, -1016.588317, 36.214309, 223.043991, 1289.259888, 1082.199951, 0, 0),
(6, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1233.61621, -1016.364013, 36.174411, 223.043991, 1289.259888, 1082.199951, 0, 0),
(7, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1226.244384, -1010.538208, 36.132785, 223.043991, 1289.259888, 1082.199951, 0, 0),
(8, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1233.358032, -1010.059143, 36.086036, 223.043991, 1289.259888, 1082.199951, 0, 0),
(9, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1226.960083, -1016.901123, 32.601562, 223.043991, 1289.259888, 1082.199951, 0, 0),
(10, '', 125000, 1, 1, 1, 0, 0, 0, 0, 1233.701782, -1016.258422, 32.606651, 223.043991, 1289.259888, 1082.199951, 0, 0),
(11, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2067.604492, -1731.595458, 13.876157, 225.756989, 1240, 1082.149902, 0, 0),
(12, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2066.937255, -1716.998535, 13.554683, 225.756989, 1240, 1082.149902, 0, 0),
(13, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2065.12622, -1703.534423, 14.148437, 225.756989, 1240, 1082.149902, 0, 0),
(14, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2066.947753, -1656.544921, 14.093161, 225.756989, 1240, 1082.149902, 0, 0),
(15, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2067.565429, -1643.822021, 14.136316, 225.756989, 1240, 1082.149902, 0, 0),
(16, '', 475000, 1, 2, 2, 0, 0, 0, 0, 2068.368652, -1628.871948, 13.876157, 225.756989, 1240, 1082.149902, 0, 0),
(17, '', 600000, 1, 2, 2, 0, 0, 0, 0, 2139.198974, -1698.128417, 15.078443, 225.756989, 1240, 1082.149902, 0, 0),
(18, '', 600000, 1, 2, 2, 0, 0, 0, 0, 2155.497802, -1698.927856, 15.085937, 225.756989, 1240, 1082.149902, 0, 0),
(19, '', 450000, 1, 2, 2, 0, 0, 0, 0, 2166.262207, -1671.585693, 15.073861, 225.756989, 1240, 1082.149902, 0, 0),
(20, '', 450000, 1, 2, 2, 0, 0, 0, 0, 2178.466552, -1660.817749, 14.954196, 225.756989, 1240, 1082.149902, 0, 0),
(21, '', 450000, 1, 2, 2, 0, 0, 0, 0, 2185.902099, -1608.334472, 14.355303, 225.756989, 1240, 1082.149902, 0, 0),
(22, '', 450000, 1, 2, 2, 0, 0, 0, 0, 2143.065185, -1605.268432, 14.351562, 225.756989, 1240, 1082.149902, 0, 0),
(23, '', 250000, 1, 1, 1, 0, 0, 0, 0, 2068.243652, -1589.151733, 13.491003, 223.043991, 1289.259888, 1082.199951, 0, 0),
(24, '', 250000, 1, 1, 1, 0, 0, 0, 0, 2073.368896, -1583.248657, 13.47423, 223.043991, 1289.259888, 1082.199951, 0, 0),
(25, '', 250000, 1, 1, 1, 0, 0, 0, 0, 2065.621582, -1583.367431, 13.481378, 223.043991, 1289.259888, 1082.199951, 0, 0),
(26, '', 250000, 1, 1, 1, 0, 0, 0, 0, 2075.964111, -1588.067871, 13.48971, 223.043991, 1289.259888, 1082.199951, 0, 0),
(27, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2091.531738, -1067.680297, 27.729553, 225.756989, 1240, 1082.149902, 0, 0),
(28, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2101.825439, -1075.217773, 25.823419, 225.756989, 1240, 1082.149902, 0, 0),
(29, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2108.766357, -1082.227294, 25.429924, 225.756989, 1240, 1082.149902, 0, 0),
(30, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2099.622558, -1051.657714, 28.748813, 225.756989, 1240, 1082.149902, 0, 0),
(31, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2094.041992, -1047.651733, 29.984626, 225.756989, 1240, 1082.149902, 0, 0),
(32, '', 150000, 1, 2, 2, 0, 0, 0, 0, 2082.922851, -1039.72644, 32.082832, 225.756989, 1240, 1082.149902, 0, 0),
(33, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1468.333007, -905.913879, 54.835937, 225.756989, 1240, 1082.149902, 0, 0),
(34, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1536.131591, -885.131103, 57.657482, 225.756989, 1240, 1082.149902, 0, 0),
(35, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1540.459228, -851.632873, 64.336059, 225.756989, 1240, 1082.149902, 0, 0),
(36, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1534.908325, -800.284545, 72.849456, 225.756989, 1240, 1082.149902, 0, 0),
(37, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1527.825439, -772.76477, 80.578125, 225.756989, 1240, 1082.149902, 0, 0),
(38, '', 950000, 1, 3, 7, 0, 0, 0, 0, 1497.029785, -688.175109, 95.537345, 225.630997, 1022.47998, 1084.069946, 0, 0),
(39, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1442.70642, -628.932617, 95.718566, 225.756989, 1240, 1082.149902, 0, 0),
(40, '', 950000, 1, 3, 7, 0, 0, 0, 0, 989.811401, -828.650573, 95.468574, 225.630997, 1022.47998, 1084.069946, 0, 0),
(41, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1016.650512, -763.361938, 112.563018, 225.756989, 1240, 1082.149902, 0, 0),
(42, '', 600000, 1, 2, 2, 0, 0, 0, 0, 891.246704, -782.945678, 101.312416, 225.756989, 1240, 1082.149902, 0, 0),
(43, '', 600000, 1, 2, 2, 0, 0, 0, 0, 848.179748, -745.726867, 94.969268, 225.756989, 1240, 1082.149902, 0, 0),
(44, '', 600000, 1, 2, 2, 0, 0, 0, 0, 808.229736, -759.251342, 76.531364, 225.756989, 1240, 1082.149902, 0, 0),
(45, '', 600000, 1, 2, 2, 0, 0, 0, 0, 785.993957, -828.011291, 70.289581, 225.756989, 1240, 1082.149902, 0, 0),
(46, '', 250000, 3, 1, 1, 0, 0, 0, 0, 753.660339, 1973.254394, 5.699619, 223.043991, 1289.259888, 1082.199951, 0, 0),
(47, '', 250000, 3, 1, 1, 0, 0, 0, 0, 789.85852, 1974.165039, 5.738682, 223.043991, 1289.259888, 1082.199951, 0, 0),
(48, '', 250000, 3, 1, 1, 0, 0, 0, 0, 793.16748, 1991.540283, 5.793369, 223.043991, 1289.259888, 1082.199951, 0, 0),
(49, '', 250000, 3, 1, 1, 0, 0, 0, 0, 767.79718, 2007.592773, 6.066807, 223.043991, 1289.259888, 1082.199951, 0, 0),
(50, '', 250000, 3, 1, 1, 0, 0, 0, 0, 767.06195, 1989.728149, 5.335937, 223.043991, 1289.259888, 1082.199951, 0, 0),
(51, '', 250000, 3, 1, 1, 0, 0, 0, 0, 755.8703, 1958.525146, 5.335937, 223.043991, 1289.259888, 1082.199951, 0, 0),
(52, '', 250000, 3, 1, 1, 0, 0, 0, 0, 777.694519, 1937.622192, 5.57799, 223.043991, 1289.259888, 1082.199951, 0, 0),
(53, '', 250000, 3, 1, 1, 0, 0, 0, 0, -1450.61499, 2691.176513, 56.176181, 223.043991, 1289.259888, 1082.199951, 0, 0),
(54, '', 250000, 3, 1, 1, 0, 0, 0, 0, -1465.8656, 2693.114257, 56.269931, 223.043991, 1289.259888, 1082.199951, 0, 0),
(55, '', 600000, 3, 2, 2, 0, 0, 0, 0, -1491.517822, 2685.678222, 55.859375, 225.756989, 1240, 1082.149902, 0, 0),
(56, '', 600000, 3, 2, 2, 0, 0, 0, 0, -1511.795043, 2695.358398, 55.872341, 225.756989, 1240, 1082.149902, 0, 0),
(57, '', 250000, 3, 1, 1, 0, 0, 0, 0, -1476.181884, 2563.298583, 56.176181, 223.043991, 1289.259888, 1082.199951, 0, 0),
(58, '', 250000, 3, 1, 1, 0, 0, 0, 0, -1478.81665, 2547.343505, 56.254306, 223.043991, 1289.259888, 1082.199951, 0, 0),
(59, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2654.152832, 200.841812, 5, 225.756989, 1240, 1082.149902, 0, 0),
(60, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2660.732177, 200.458374, 7.195312, 225.756989, 1240, 1082.149902, 0, 0),
(61, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2672.298583, 200.822525, 5, 225.756989, 1240, 1082.149902, 0, 0),
(62, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2678.158447, 200.352416, 7.195312, 225.756989, 1240, 1082.149902, 0, 0),
(63, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2688.933593, 197.830612, 7.203125, 225.756989, 1240, 1082.149902, 0, 0),
(64, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2044.954589, -2522.519042, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(65, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2052.960693, -2544.572509, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(66, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2069.308349, -2561.576171, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(67, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2081.91455, -2548.276611, 30.841997, 223.043991, 1289.259888, 1082.199951, 0, 0),
(68, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2075.206298, -2526.480957, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(69, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2058.249267, -2503.766601, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(70, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2069.270996, -2494.967773, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(71, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2087.155517, -2510.706298, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(72, '', 250000, 2, 1, 1, 0, 0, 0, 0, -2101.253906, -2532.513671, 31.066806, 223.043991, 1289.259888, 1082.199951, 0, 0),
(73, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2134.601806, -2504.504638, 31.81627, 225.756989, 1240, 1082.149902, 0, 0),
(74, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2161.318115, -2535.474121, 31.81627, 225.756989, 1240, 1082.149902, 0, 0),
(75, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2181.098876, -2519.918701, 31.81627, 225.756989, 1240, 1082.149902, 0, 0),
(76, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2192.767578, -2510.351074, 31.816272, 225.756989, 1240, 1082.149902, 0, 0),
(77, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2173.89038, -2481.480224, 31.816272, 225.756989, 1240, 1082.149902, 0, 0),
(78, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2227.871093, -2489.058105, 31.816272, 225.756989, 1240, 1082.149902, 0, 0),
(79, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2214.073974, -2451.929199, 31.81627, 225.756989, 1240, 1082.149902, 0, 0),
(80, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2239.074218, -2423.912841, 32.707267, 225.756989, 1240, 1082.149902, 0, 0),
(81, '', 600000, 2, 2, 2, 0, 0, 0, 0, -2220.155029, -2400.115234, 32.582267, 225.756989, 1240, 1082.149902, 0, 0),
(82, '', 375000, 1, 2, 2, 0, 0, 0, 0, 736.678222, -556.717895, 18.012926, 225.756989, 1240, 1082.149902, 0, 0),
(83, '', 375000, 1, 2, 2, 0, 0, 0, 0, 766.618591, -556.783874, 18.012924, 225.756989, 1240, 1082.149902, 0, 0),
(84, '', 375000, 1, 2, 2, 0, 0, 0, 0, 768.06958, -503.484741, 18.012926, 225.756989, 1240, 1082.149902, 0, 0),
(85, '', 375000, 1, 2, 2, 0, 0, 0, 0, 794.908813, -506.568237, 18.012922, 225.756989, 1240, 1082.149902, 0, 0),
(86, '', 375000, 1, 2, 2, 0, 0, 0, 0, 818.149169, -509.626892, 18.012922, 225.756989, 1240, 1082.149902, 0, 0),
(87, '', 210000, 1, 1, 1, 0, 0, 0, 0, 759.185791, -591.778076, 18.013332, 223.043991, 1289.259888, 1082.199951, 0, 0),
(88, '', 375000, 1, 2, 2, 0, 0, 0, 0, 745.19104, -590.883056, 18.012922, 225.756989, 1240, 1082.149902, 0, 0),
(89, '', 375000, 1, 2, 2, 0, 0, 0, 0, 1421.631103, -885.74707, 50.668472, 225.756989, 1240, 1082.149902, 0, 0),
(90, '', 950000, 1, 3, 7, 1, 0, 0, 0, 1259.398315, -785.357727, 92.03125, 225.630997, 1022.47998, 1084.069946, 0, 0),
(91, '', 950000, 1, 3, 7, 0, 0, 0, 0, 1093.948486, -807.125976, 107.419219, 225.630997, 1022.47998, 1084.069946, 0, 0),
(92, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1853.85852, -1914.946166, 15.256797, 225.756989, 1240, 1082.149902, 0, 0),
(93, '', 600000, 1, 2, 2, 0, 0, 0, 0, 1440.735961, -926.586303, 39.640625, 225.756989, 1240, 1082.149902, 0, 0),
(94, '', 950000, 1, 3, 7, 0, 0, 0, 0, 1331.781738, -632.586791, 109.134902, 225.630997, 1022.47998, 1084.069946, 0, 0),
(95, '', 950000, 1, 3, 7, 0, 0, 0, 0, 298.843109, -1338.443604, 53.441528, 225.630997, 1022.47998, 1084.069946, 0, 0),
(96, '', 950000, 1, 3, 7, 0, 0, 0, 0, 1217.353637, -1692.563232, 19.734375, 225.630997, 1022.47998, 1084.069946, 0, 0),
(97, '', 950000, 1, 3, 7, 0, 0, 0, 0, 980.38208, -677.093017, 121.976257, 225.630997, 1022.47998, 1084.069946, 0, 0),
(98, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1285.48291, -870.277404, 43.355484, 225.756989, 1240, 1082.149902, 0, 0),
(99, '', 100000, 1, 2, 2, 1, 0, 0, 1, 1244.686035, -875.048889, 43.493904, 225.756989, 1240, 1082.149902, 0, 0),
(100, '', 500000, 1, 2, 2, 0, 0, 0, 0, -787.154602, -819.655334, 149.607864, 225.756989, 1240, 1082.149902, 0, 0),
(101, '', 500000, 3, 2, 2, 0, 0, 0, 0, -788.868835, 2419.431884, 158.018661, 225.756989, 1240, 1082.149902, 0, 0),
(102, '', 500000, 1, 3, 7, 1, 0, 0, 0, 300.207733, -1154.415405, 81.390823, 225.630997, 1022.47998, 1084.069946, 0, 0),
(103, '', 500000, 1, 3, 7, 0, 0, 0, 0, 1045.230102, -642.927246, 120.117187, 225.630997, 1022.47998, 1084.069946, 0, 0),
(104, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1078.52124, -1311.057495, 13.98154, 225.756989, 1240, 1082.149902, 0, 0),
(105, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1079.4906, -1367.010131, 13.98154, 225.756989, 1240, 1082.149902, 0, 0),
(106, '', 75000, 1, 1, 1, 0, 0, 0, 0, 1095.557373, -1358.243896, 13.839006, 223.043991, 1289.259888, 1082.199951, 0, 0),
(107, '', 75000, 1, 1, 1, 0, 0, 0, 0, 1095.660522, -1372.789794, 13.839006, 223.043991, 1289.259888, 1082.199951, 0, 0),
(108, '', 75000, 1, 1, 1, 0, 0, 0, 0, 1096.444091, -1316.969726, 13.783634, 223.043991, 1289.259888, 1082.199951, 0, 0),
(109, '', 75000, 1, 1, 1, 0, 0, 0, 0, 1096.317382, -1301.165649, 13.783634, 223.043991, 1289.259888, 1082.199951, 0, 0),
(110, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1125.574462, -1308.895996, 14.354201, 225.756989, 1240, 1082.149902, 0, 0),
(111, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1130.364501, -1337.967285, 14.330089, 225.756989, 1240, 1082.149902, 0, 0),
(112, '', 100000, 1, 2, 2, 0, 0, 0, 0, 1127.877197, -1362.358886, 14.573231, 225.756989, 1240, 1082.149902, 0, 0),
(113, '', 600000, 1, 3, 7, 0, 0, 0, 0, 354.812958, -1280.606079, 53.70364, 225.630997, 1022.47998, 1084.069946, 0, 0),
(114, '', 250000, 1, 2, 2, 0, 0, 0, 0, 398.951873, -1000.092712, 92.32048, 402.6189, -1000.0576, 92.3859, 0, 0),
(115, '', 1000000, 1, 3, 7, 0, 0, 0, 0, -982.24591, 2484.214111, 50.802143, 225.630997, 1022.47998, 1084.069946, 0, 0),
(116, '', 250000, 1, 2, 2, 0, 0, 0, 0, 1111.33667, -976.446777, 42.765625, 225.756989, 1240, 1082.149902, 0, 0),
(117, '', 550000, 1, 1, 1, 0, 0, 0, 0, 1022.264832, -1121.58728, 23.871677, 223.043991, 1289.259888, 1082.199951, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jobinfos`
--

CREATE TABLE `jobinfos` (
  `ID` int(11) NOT NULL DEFAULT 0,
  `Jobname` varchar(30) NOT NULL,
  `Gehalt` int(11) NOT NULL DEFAULT 0,
  `EXP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `jobinfos`
--

INSERT INTO `jobinfos` (`ID`, `Jobname`, `Gehalt`, `EXP`) VALUES
(1, 'Trucker', 3500, 35),
(2, 'Pizzabote', 4150, 35),
(3, 'KM-Fahrer', 2500, 35),
(4, 'Pilot', 8800, 35),
(5, 'Busfahrer', 3500, 35),
(6, 'Muellmann', 4800, 35),
(7, 'Landwirt', 6000, 35),
(14, 'Zugfahrer', 7700, 35),
(16, 'Langstreckenfahrer', 6500, 35),
(17, 'Fluglieferant', 600, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `languages`
--

CREATE TABLE `languages` (
  `ID` int(11) NOT NULL,
  `LanguageName` tinytext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `languages`
--

INSERT INTO `languages` (`ID`, `LanguageName`) VALUES
(1, 'DE');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `languagevars`
--

CREATE TABLE `languagevars` (
  `ID` int(11) NOT NULL,
  `langID` int(11) DEFAULT NULL,
  `languageVar` varchar(30) DEFAULT NULL,
  `languageValue` varchar(1000) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `languagevars`
--

INSERT INTO `languagevars` (`ID`, `langID`, `languageVar`, `languageValue`) VALUES
(1, 1, 'ERROR_LOGOUT', 'Du kannst dich nicht Ausloggen!'),
(2, 1, 'ERROR_NOTUAP', 'Du musst einen Namen und ein Passwort angeben!'),
(3, 1, 'ERROR_PW', 'Das Passwort oder der Benutzername waren nicht korrekt'),
(4, 1, 'de.sampcp.loginfield', 'Benutzername (InGame)'),
(5, 1, 'de.sampcp.passwordfield', 'Passwort (InGame)'),
(6, 1, 'de.sampcp.login.text', 'Anmeldung in das Control Panel'),
(7, 1, 'de.sampcp.loginb', 'Einloggen!'),
(8, 1, 'ERROR_FAILSITE', 'Diese Seite existiert leider nicht.'),
(9, 1, 'de.sampcp.title', 'German Samplife User Control Panel'),
(10, 1, 'HOME_WARNING', 'Achtung'),
(11, 1, 'HOME_WARNING_TEXT', 'Wenn es ein Problem gibt, k?nnt ihr euch gerne bei dem Team Melden im Forum, im Spiel oder im Controll Panel.'),
(12, 1, 'de.sampcp.home.welcome', 'Herzlich Willkommen, '),
(13, 1, 'NAV_NOLOGGED_1', 'Anmelden'),
(14, 1, 'NAV_LOGGED_1', 'Startseite'),
(15, 1, 'NAV_LOGGED_2', 'Statistiken'),
(16, 1, 'NAV_LOGGED_3', 'Deine Fraktion'),
(17, 1, 'NAV_LOGGED_4', 'Abmelden'),
(18, 1, 'STATS_HEADLINE', 'Deine Statistiken'),
(19, 1, 'STATS_PLAYER', 'Spielername'),
(20, 1, 'STATS_INGAMESTATUS', 'Ingame Status:'),
(21, 1, 'de.sampcp.profil.level', 'InGame Level'),
(22, 1, 'de.sampcp.profil.email', 'Gew?hlte E-Mail Adresse'),
(23, 1, 'de.sampcp.profil.warnings', 'InGame Verwarnungen'),
(24, 1, 'de.sampcp.profil.admin', 'Administrator Level'),
(25, 1, 'STATS_GELD', 'Geld:'),
(26, 1, 'STATS_BANK', 'Bank:'),
(27, 1, 'de.sampcp.offline', 'InGame Offline'),
(28, 1, 'de.sampcp.profil.yes', 'Du bist Administrator'),
(29, 1, 'de.sampcp.profil.licenses', 'Deine Licensen'),
(30, 1, 'de.sampcp.datenschutz', 'Datenschutz'),
(31, NULL, 'de.sampcp.back', 'Zur?ck..'),
(32, 1, 'de.sampcp.back', 'Zur?ck..'),
(33, 1, 'de.sampcp.users', 'Serverstatistik:'),
(34, 1, 'de.sampcp.dontlogin', 'Du bist nicht eingeloggt.'),
(35, 1, 'de.sampcp.', 'Mein Profil'),
(36, 1, 'de.sampcp.myprofil', 'Mein Profil'),
(37, 1, 'de.sampcp.edit.password', 'Passwort ?ndern'),
(38, 1, 'de.sampcp.edit.password', 'Passwort ?ndern'),
(39, 1, 'de.sampcp.edit.userdata', 'Nickname ?ndern'),
(40, 1, 'de.sampcp.edit.userdata', 'Nickname ?ndern'),
(41, 1, 'de.sampcp.profilsettings', 'Einstellungen'),
(42, 1, 'de.sampcp.administration', 'Administration'),
(43, 1, 'de.sampcp.logout', 'Abmelden'),
(44, 1, 'de.sampcp.nav1', 'Startseite'),
(45, 1, 'de.sampcp.edit.headline', 'Einstellungen'),
(46, NULL, 'de.sampcp.signatur', 'Server Signatur'),
(47, 1, 'de.sampcp.signatur', 'Server Signatur'),
(48, NULL, 'de.sampcp.nav2.drop', 'Fraktionen'),
(49, 1, 'de.sampcp.nav2.drop', 'Fraktionen'),
(50, 1, 'de.sampcp.nav2', 'Mehr..'),
(51, 1, 'de.sampcp.factionu', 'Fraktionsliste'),
(52, 1, 'de.sampcp.factionn', 'Fraktionsname'),
(53, 1, 'de.sampcp.factionn', 'Fraktionsname'),
(54, 1, 'de.sampcp.f.members', 'Fraktions Mitglieder'),
(55, 1, 'de.sampcp.dontnav1', 'Einloggen'),
(56, 1, 'de.sampcp.f.survey', 'Fraktionss?bersicht'),
(57, 1, 'de.sampcp.f.rang', 'Fraktionsrang'),
(58, 1, 'de.sampcp.f.lastlogin', 'Letzter Login'),
(59, 1, 'de.sampcp.f.name', 'Name'),
(60, 1, 'de.sampcp.f.leader', 'Leader'),
(61, 1, 'de.sampcp.f.member', 'Member'),
(62, 1, 'de.sampcp.f.back', 'Zurueck'),
(63, 1, 'de.sampcp.online', 'InGame Online');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lastplayerdata`
--

CREATE TABLE `lastplayerdata` (
  `ID` int(12) NOT NULL,
  `DBid` int(12) NOT NULL,
  `Time` int(12) NOT NULL,
  `PosX` double NOT NULL,
  `PosY` double NOT NULL,
  `PosZ` double NOT NULL,
  `PosA` double NOT NULL,
  `State` int(12) NOT NULL,
  `StateData` int(12) NOT NULL,
  `VehicleDBid` int(12) NOT NULL,
  `VirtualWorld` int(12) NOT NULL,
  `Interior` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `lastplayerdata`
--

INSERT INTO `lastplayerdata` (`ID`, `DBid`, `Time`, `PosX`, `PosY`, `PosZ`, `PosA`, `State`, `StateData`, `VehicleDBid`, `VirtualWorld`, `Interior`) VALUES
(1, 0, 1546958428, 1007.813354, -1364.36914, 13.3351, 18.014036, 0, 0, -1, 0, 0),
(2, 0, 1546965576, 1784.812377, -1897.551757, 13.392842, 203.179244, 0, 0, -1, 0, 0),
(3, 1, 1546965576, 1786.061889, -1895.554931, 13.393757, 264.469329, 0, 0, -1, 0, 0),
(4, 0, 1547022688, 1206.76123, -914.861999, 43.329399, 116.27304, 0, 0, -1, 0, 0),
(5, 0, 1547025937, 303.541137, 1877.817626, 904.375915, 273.051879, 0, 0, -1, 0, 0),
(6, 1, 1547025954, 303.976562, 1883.273681, 904.126892, 359.80368, 0, 0, -1, 0, 0),
(7, 1, 1547084572, -2656.128662, 1416.210815, 906.273437, 161.060867, 0, 0, -1, 0, 3),
(8, 1, 1547085045, -2653.358886, 1414.29663, 906.273437, 215.162353, 0, 0, -1, 0, 3),
(9, 1, 1547085314, -2651.716552, 1391.41809, 912.40625, 102.19062, 0, 0, -1, 0, 3),
(10, 1, 1547102829, 1758.525634, -1894.127563, 13.55593, 268.346405, 0, 0, -1, 0, 0),
(11, 1, 1547103234, 0, 0, 0, 0, 1, 10, -1, 0, 0),
(12, 0, 1547103825, 1766.590698, -1891.255737, 13.848063, 226.386718, 0, 0, -1, 0, 0),
(13, 1, 1547104681, 1352.070556, -1748.179931, 13.367486, 8.950035, 0, 0, -1, 0, 0),
(14, 1, 1547111648, 298.300415, 1828.185424, 2241.58496, 273.524505, 0, 0, -1, 0, 0),
(15, 1, 1547343382, 302.433532, 1826.875488, 2241.58496, 134.027053, 0, 0, -1, 0, 0),
(16, 1, 1547343950, 321.884521, 1835.770507, 2241.58496, 134.358642, 0, 0, -1, 0, 0),
(17, 1, 1547344874, 1253.915893, -930.218383, 42.287155, 103.561431, 0, 0, -1, 0, 0),
(18, 1, 1547348478, 1524.307128, -1705.458618, 13.546875, 155.279861, 0, 0, -1, 0, 0),
(19, 1, 1547349329, 381.101745, -69.448585, 1001.507812, 297.220336, 0, 0, -1, 1, 10),
(20, 1, 1547349848, -23.971181, -139.170516, 1003.546875, 303.174591, 0, 0, -1, 1, 16),
(21, 6, 1547351105, -23.138462, -138.60997, 1003.546875, 116.916007, 0, 0, -1, 1, 16),
(22, 1, 1547361902, 298.300415, 1828.185424, 2241.58496, 273.524536, 0, 0, -1, 0, 0),
(23, 1, 1547469717, 1931.520263, -1770.46289, 13.546875, 0.083929, 0, 0, -1, 0, 0),
(24, 1, 1547471319, 1791.629882, -1730.008422, 14.836204, 273.191894, 0, 0, -1, 0, 0),
(25, 1, 1547474621, 1536.489257, -1675.444091, 13.382812, 115.018142, 0, 0, -1, 0, 0),
(26, 1, 1547486925, 794.034118, -1452.875122, 13.09367, 172.760696, 0, 0, -1, 0, 0),
(27, 6, 1547487368, 893.018676, -992.802734, 36.359107, 298.075958, 0, 0, -1, 0, 0),
(28, 0, 1547503393, 1773.739868, -1903.670288, 13.550321, 165.52304, 0, 0, -1, 0, 0),
(29, 1, 1547634042, 1131.933227, -1.6374, 1000.679687, 270.160797, 0, 0, -1, 0, 12),
(30, 7, 1547665565, 2501.260253, -2638.895996, 13.233633, 254.064682, 0, 0, -1, 0, 0),
(31, 1, 1547737637, 1124.631958, -4.955564, 1000.679687, 110.359283, 0, 0, -1, 0, 12),
(32, 7, 1547764386, 2162.995849, -1748.648315, 14.69121, 162.00003, 0, 0, -1, 0, 0),
(33, 1, 1547774926, 1128.269775, 2.994812, 1000.679687, 69.233917, 0, 0, -1, 0, 12),
(34, 0, 1547809902, 304.299224, 1892.736694, 904.375915, 219.990173, 0, 0, -1, 0, 0),
(35, 8, 1547813240, 2284.875, -1241.957763, 25.724542, 0, 0, 0, -1, 0, 0),
(36, 0, 1547817953, 1204.302368, -441.824218, 14.889663, 93.006782, 0, 0, -1, 0, 0),
(37, 0, 1547818037, 1757.546752, -1908.554687, 14.506455, 0, 0, 0, -1, 0, 0),
(38, 0, 1547820422, 0, 0, 0, 0, 0, 0, -1, 0, 0),
(39, 6, 1547821821, 926.542846, -1719.42871, 129.854873, 75.948577, 0, 0, -1, 0, 0),
(40, 6, 1547829068, 2053.697753, -1747.089355, 13.542162, 254.690811, 0, 0, -1, 0, 0),
(41, 1, 1547833178, 309.562164, 1880.863891, 904.375915, 188.770858, 0, 0, -1, 0, 0),
(42, 6, 1547836414, 315.585327, 1835.291503, 2241.58496, 123.672904, 0, 0, -1, 0, 0),
(43, 6, 1547844487, 1768.676147, -1910.960205, 16.606456, 342.344635, 0, 0, -1, 0, 0),
(44, 1, 1547847690, 1782.647216, -1914.781005, 13.391255, 242.830459, 0, 0, -1, 0, 0),
(45, 7, 1547856871, 0, 0, 0, 0, 0, 0, -1, 0, 0),
(46, 1, 1547905444, 1530.002319, -1665.728027, 12.996625, 359.205505, 0, 0, 0, 0, 0),
(47, 1, 1547908670, 1493.766113, -1753.673461, 13.176526, 183.804489, 0, 0, 0, 0, 0),
(48, 7, 1547909083, 1487.731933, -1744.859252, 13.5766, 351.110687, 0, 0, -1, 0, 0),
(49, 7, 1547913635, 1801.12854, -1895.732421, 13.404795, 96.661537, 0, 0, -1, 0, 0),
(50, 7, 1547919615, 1880.716186, -1758.430664, 13.546875, 95.361938, 0, 0, -1, 0, 0),
(51, 1, 1547925388, 299.9953, 1827.937744, 2241.58496, 268.448455, 0, 0, -1, 0, 0),
(52, 7, 1547925424, 304.246368, 1827.145385, 2241.58496, 95.962242, 0, 0, -1, 0, 0),
(53, 6, 1547931337, 1506.259277, -1621.167724, 16.590177, 209.158843, 0, 0, -1, 0, 0),
(54, 7, 1547931671, 0, 0, 0.5, 0, 0, 0, -1, 0, 0),
(55, 7, 1547933388, 1758.525634, -1894.127563, 13.55593, 268.346405, 0, 0, -1, 0, 0),
(56, 6, 1547933390, -2652.815429, 1409.788085, 906.273437, 73.475669, 0, 0, -1, 0, 3),
(57, 1, 1547933884, 1821.594848, -1890.244995, 12.968906, 298.036926, 0, 0, -1, 0, 0),
(58, 1, 1547937739, 1518.684936, -1594.94458, 13.945884, 89.556129, 0, 0, -1, 0, 0),
(59, 0, 1547937746, 1508.735839, -1606.482543, 14.046875, 186.975143, 0, 0, -1, 0, 0),
(60, 12, 1547939545, 1570.173583, -1618.033691, 14.315937, 83.451782, 0, 0, -1, 0, 0),
(61, 1, 1547939633, 1882.398437, -1779.101318, 30.4626, 12.738247, 0, 0, -1, 0, 0),
(62, 6, 1547940059, 1463.250244, -1633.139404, 14.046875, 23.541322, 0, 0, -1, 0, 0),
(63, 7, 1547943714, 1796.012817, -1911.277709, 13.396827, 231.224197, 0, 0, -1, 0, 0),
(64, 6, 1547944931, 1738.992797, -1944.324096, 13.567048, 267.964294, 0, 0, -1, 0, 0),
(65, 7, 1547976210, 1758.525634, -1894.127563, 13.55593, 268.346405, 0, 0, -1, 0, 0),
(66, 7, 1547976664, 1758.525634, -1894.127563, 13.55593, 268.346405, 0, 0, -1, 0, 0),
(67, 7, 1547977132, 1771.573852, -1896.822509, 13.554553, 179.944046, 0, 0, -1, 0, 0),
(68, 12, 1547977992, 2041.560058, -1726.46228, 18.2513, 179.114196, 0, 0, -1, 0, 0),
(69, 8, 1547978040, -2248.253906, -161.265197, 39.970695, 0.625888, 0, 0, -1, 0, 0),
(70, 8, 1547978750, 1929.492553, -1770.714721, 16.919353, 90, 0, 0, -1, 0, 0),
(71, 12, 1547979923, 1806.335937, -1873.527832, 19.79091, 90.837562, 0, 0, -1, 0, 0),
(72, 0, 1547980578, 1204.074829, -1369.324584, 13.316228, 51.306076, 0, 0, -1, 0, 0),
(73, 13, 1547981011, 1842.331298, -1395.938842, 14.005446, 180.202713, 0, 0, -1, 0, 0),
(74, 13, 1547982081, 1451.301757, -1584.341552, 13.546875, 50.3694, 0, 0, -1, 0, 0),
(75, 13, 1547984906, 1758.525634, -1894.127563, 13.55593, 268.346405, 0, 0, -1, 0, 0),
(76, 7, 1547985863, 1779.402343, -1938.244018, 13.554227, 315.711456, 0, 0, -1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newskiosk`
--

CREATE TABLE `newskiosk` (
  `ID` int(12) NOT NULL,
  `nkX` double NOT NULL,
  `nkY` double NOT NULL,
  `nkZ` double NOT NULL,
  `ZeitungAmount` int(12) NOT NULL,
  `Ersteller` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `newspaper`
--

CREATE TABLE `newspaper` (
  `id` int(12) NOT NULL,
  `title` varchar(32) NOT NULL,
  `zeile1` varchar(64) NOT NULL,
  `zeile2` varchar(64) NOT NULL,
  `zeile3` varchar(64) NOT NULL,
  `zeile4` varchar(64) NOT NULL,
  `zeile5` varchar(64) NOT NULL,
  `zeile6` varchar(64) NOT NULL,
  `zeile7` varchar(64) NOT NULL,
  `zeile8` varchar(64) NOT NULL,
  `zeile9` varchar(64) NOT NULL,
  `zeile10` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `oldtickets`
--

CREATE TABLE `oldtickets` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Text` varchar(128) NOT NULL,
  `Uhrzeit` varchar(16) NOT NULL,
  `Datum` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `oldtickets`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rangnamen`
--

CREATE TABLE `rangnamen` (
  `frakid` int(11) NOT NULL,
  `1` varchar(24) NOT NULL DEFAULT 'Rang 1',
  `2` varchar(24) NOT NULL DEFAULT 'Rang 2',
  `3` varchar(24) NOT NULL DEFAULT 'Rang 3',
  `4` varchar(24) NOT NULL DEFAULT 'Rang 4',
  `5` varchar(24) NOT NULL DEFAULT 'Rang 5',
  `6` varchar(24) NOT NULL DEFAULT 'Co-Leader',
  `7` varchar(24) NOT NULL DEFAULT 'Leader',
  `T1` varchar(24) NOT NULL DEFAULT 'Rang 1',
  `T2` varchar(24) NOT NULL DEFAULT 'Rang 2',
  `T3` varchar(24) NOT NULL DEFAULT 'Rang 3',
  `T4` varchar(24) NOT NULL DEFAULT 'Rang 4',
  `T5` varchar(24) NOT NULL DEFAULT 'Rang 5',
  `T6` varchar(24) NOT NULL DEFAULT 'Co-Leader',
  `T7` varchar(24) NOT NULL DEFAULT 'Leader'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `rangnamen`
--

INSERT INTO `rangnamen` (`frakid`, `1`, `2`, `3`, `4`, `5`, `6`, `7`, `T1`, `T2`, `T3`, `T4`, `T5`, `T6`, `T7`) VALUES
(1, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(2, 'Officer', 'Seargent', 'Lieutenant', 'Captain', 'Deputy Chief', 'Assistant Chief', 'Chief of Police', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(3, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(4, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(5, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(6, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(7, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(8, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(9, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(10, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(11, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(12, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(13, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(14, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(15, 'Wakashu', 'Shiroto', 'Kyodai', 'Gashira', 'Saiko', 'Komon', 'Oyabun', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(16, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(17, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(18, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader'),
(19, 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader', 'Rang 1', 'Rang 2', 'Rang 3', 'Rang 4', 'Rang 5', 'Co-Leader', 'Leader');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `records`
--

CREATE TABLE `records` (
  `Name` varchar(30) NOT NULL,
  `Record` int(11) NOT NULL,
  `Day` int(11) NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Second` int(11) NOT NULL,
  `Minute` int(11) NOT NULL,
  `Hour` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `regierung`
--

CREATE TABLE `regierung` (
  `ID` int(11) NOT NULL DEFAULT 1,
  `Steuern` int(11) NOT NULL DEFAULT 70,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `SteuernHaus` int(11) NOT NULL DEFAULT 215,
  `SteuernKFZ` int(11) NOT NULL DEFAULT 400,
  `SteuerSchlagring` int(11) NOT NULL DEFAULT 0,
  `SteuerMesser` int(11) NOT NULL DEFAULT 0,
  `SteuerBaseball` int(11) NOT NULL DEFAULT 0,
  `SteuerDeagle` int(11) NOT NULL DEFAULT 2500,
  `SteuerMP5` int(11) NOT NULL DEFAULT 3000,
  `SteuerAK` int(11) NOT NULL DEFAULT 6000,
  `SteuerM4` int(11) NOT NULL DEFAULT 6000,
  `SteuerSniper` int(11) NOT NULL DEFAULT 20000,
  `SteuerShopNavi` int(11) NOT NULL DEFAULT 100,
  `SteuerShopHandy` int(11) NOT NULL DEFAULT 100,
  `SteuerShopBuch` int(11) NOT NULL DEFAULT 100,
  `SteuerShopKit` int(11) NOT NULL DEFAULT 100,
  `SteuerShopKamera` int(11) NOT NULL DEFAULT 100,
  `SteuerShopMusik` int(11) NOT NULL DEFAULT 100,
  `BlitzerSteuer` int(11) NOT NULL DEFAULT 15
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `regierung`
--

INSERT INTO `regierung` (`ID`, `Steuern`, `Kasse`, `SteuernHaus`, `SteuernKFZ`, `SteuerSchlagring`, `SteuerMesser`, `SteuerBaseball`, `SteuerDeagle`, `SteuerMP5`, `SteuerAK`, `SteuerM4`, `SteuerSniper`, `SteuerShopNavi`, `SteuerShopHandy`, `SteuerShopBuch`, `SteuerShopKit`, `SteuerShopKamera`, `SteuerShopMusik`, `BlitzerSteuer`) VALUES
(1, 125, 38468973, 215, 1, 0, 0, 0, 2500, 3000, 6000, 6000, 20000, 100, 100, 100, 100, 100, 100, 15);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `serverlager`
--

CREATE TABLE `serverlager` (
  `id` int(12) NOT NULL,
  `drucker_farbe` int(12) NOT NULL,
  `drucker_papier` int(12) NOT NULL,
  `it_lager_papier` int(12) NOT NULL,
  `it_lager_farbe` int(12) NOT NULL,
  `it_lager_newspaper` int(12) NOT NULL,
  `it_newspaper_price` int(12) NOT NULL,
  `it_lager_newspaper_id` int(12) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `serverlager`
--

INSERT INTO `serverlager` (`id`, `drucker_farbe`, `drucker_papier`, `it_lager_papier`, `it_lager_farbe`, `it_lager_newspaper`, `it_newspaper_price`, `it_lager_newspaper_id`) VALUES
(1, 50, 100, 50, 25, 0, 500, -1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `serverlog_easter`
--

CREATE TABLE `serverlog_easter` (
  `logID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `content` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Daten für Tabelle `serverlog_easter`
--

INSERT INTO `serverlog_easter` (`logID`, `userID`, `content`, `date`) VALUES
(1, 30, '10 Feuerzeuge', '2023-04-12 14:19:30'),
(2, 30, '30 Drogen', '2023-04-12 14:20:32'),
(3, 30, '50 Drogen', '2023-04-12 14:21:07'),
(4, 30, '10000 SA$', '2023-04-12 14:21:32'),
(5, 29, '20 Materialien', '2023-04-15 09:17:31'),
(6, 29, '10 Feuerzeuge', '2023-04-15 15:37:15'),
(7, 29, '2000 EXP', '2023-04-15 15:37:29'),
(8, 29, '1 Level', '2023-04-15 15:37:38'),
(9, 29, '25000 SA$', '2023-04-15 15:37:47'),
(10, 29, '60 Drogen', '2023-04-15 15:37:55'),
(11, 29, '500 EXP', '2023-04-15 15:38:10'),
(12, 29, 'Payday geschenkt', '2023-04-15 15:39:28'),
(13, 29, '20 Materialien', '2023-04-15 15:39:51'),
(14, 29, '25000 SA$', '2023-04-15 15:40:04'),
(15, 29, '100.000000 Weste, 120 HP', '2023-04-15 15:40:17'),
(16, 29, '50 Drogen', '2023-04-15 15:40:29'),
(17, 29, '500 EXP', '2023-04-15 15:40:39'),
(18, 29, '50 Drogen', '2023-04-15 15:40:47'),
(19, 29, '30 Drogen', '2023-04-15 15:40:56'),
(20, 29, '1 Level', '2023-04-15 15:41:04'),
(21, 29, '5000 EXP', '2023-04-15 15:41:15'),
(22, 29, '1000 EXP', '2023-04-15 15:41:26'),
(23, 29, '2000 EXP', '2023-04-15 15:41:37'),
(24, 29, '20 Materialien', '2023-04-15 15:41:48');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `skinordnung`
--

CREATE TABLE `skinordnung` (
  `frakid` int(11) NOT NULL,
  `Rang1` int(11) NOT NULL,
  `Rang2` int(11) NOT NULL,
  `Rang3` int(11) NOT NULL,
  `Rang4` int(11) NOT NULL,
  `Rang5` int(11) NOT NULL,
  `Rang6` int(11) NOT NULL,
  `Rang7` int(11) NOT NULL,
  `TRang1` int(11) NOT NULL,
  `TRang2` int(11) NOT NULL,
  `TRang3` int(11) NOT NULL,
  `TRang4` int(11) NOT NULL,
  `TRang5` int(11) NOT NULL,
  `TRang6` int(11) NOT NULL,
  `TRang7` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `skinordnung`
--

INSERT INTO `skinordnung` (`frakid`, `Rang1`, `Rang2`, `Rang3`, `Rang4`, `Rang5`, `Rang6`, `Rang7`, `TRang1`, `TRang2`, `TRang3`, `TRang4`, `TRang5`, `TRang6`, `TRang7`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 302, 280, 281, 311, 310, 288, 283, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0, 0, 0, 0, 279),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 270, 0, 0, 0, 0, 0, 0, 0),
(10, 102, 103, 104, 104, 104, 185, 185, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 121, 122, 122, 122, 122, 123, 123, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 113, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `SLOT_MACHINES`
--

CREATE TABLE `SLOT_MACHINES` (
  `ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(16) DEFAULT NULL,
  `ENTRY_FEE` int(11) DEFAULT NULL,
  `POOL_ID` int(11) DEFAULT NULL,
  `X` float DEFAULT NULL,
  `Y` float DEFAULT NULL,
  `Z` float DEFAULT NULL,
  `ROTATION` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `SLOT_MACHINES`
--

INSERT INTO `SLOT_MACHINES` (`ID`, `DESCRIPTION`, `ENTRY_FEE`, `POOL_ID`, `X`, `Y`, `Z`, `ROTATION`) VALUES
(1, 'calig-petty', 5000, 0, 2255.19, 1618.08, 1006.77, 180),
(2, 'calig-low', 5000, 0, 2255.15, 1617.55, 1006.77, 0),
(3, 'calig-petty', 5000, 0, 2255.19, 1614.19, 1006.77, 180),
(4, 'calig-low', 5000, 0, 2255.15, 1613.63, 1006.77, 0),
(5, 'calig-petty', 5000, 0, 2255.19, 1610.14, 1006.77, 180),
(6, 'calig-petty', 5000, 0, 2255.15, 1609.59, 1006.77, 0),
(7, 'calig-high', 5000, 0, 2269.24, 1606.68, 1006.77, -90),
(8, 'calig-high', 5000, 0, 2269.8, 1606.65, 1006.77, 90),
(9, 'calig-high', 5000, 0, 2273.28, 1606.68, 1006.77, -90),
(10, 'calig-high', 5000, 0, 2273.85, 1606.65, 1006.77, 90),
(11, 'calig-med', 5000, 0, 2220.66, 1603.93, 1006.77, -90),
(12, 'calig-med', 5000, 0, 2221.22, 1603.9, 1006.77, 90),
(13, 'calig-med', 5000, 0, 2217.01, 1603.93, 1006.77, -90),
(14, 'calig-med', 5000, 0, 2217.57, 1603.9, 1006.77, 90),
(15, 'calig-low', 5000, 0, 2218.63, 1614.2, 1006.77, 0),
(16, 'calig-low', 5000, 0, 2218.66, 1614.76, 1006.77, 180),
(17, 'calig-low', 5000, 0, 2218.63, 1618.55, 1006.77, 0),
(18, 'calig-low', 5000, 0, 2218.66, 1619.1, 1006.77, 180),
(19, 'calig-low', 5000, 0, 2218.66, 1592.92, 1006.77, 180),
(20, 'calig-low', 5000, 0, 2218.63, 1592.36, 1006.77, 0),
(21, 'calig-low', 5000, 0, 2218.66, 1588.62, 1006.77, 180),
(22, 'calig-low', 5000, 0, 2218.63, 1588.06, 1006.77, 0),
(23, 'drag-med', 10000, 1, 1965.1, 1037.35, 992.981, 101.8),
(24, 'drag-med', 10000, 1, 1964.56, 1037.28, 992.981, -77.6999),
(25, 'drag-med', 10000, 1, 1961.92, 1043.37, 992.981, -56.2999),
(26, 'drag-med', 10000, 1, 1962.39, 1043.64, 992.981, 124.2),
(27, 'drag-med', 10000, 1, 1957.33, 1047.98, 992.981, -34.5998),
(28, 'drag-med', 10000, 1, 1957.65, 1048.41, 992.981, 145.4),
(29, 'drag-low', 10000, 1, 1965.08, 998.305, 992.981, 79.2),
(30, 'drag-low', 10000, 1, 1964.58, 998.448, 992.981, -100.9),
(31, 'drag-low', 10000, 1, 1962.41, 991.869, 992.981, 55.3999),
(32, 'drag-low', 10000, 1, 1961.99, 992.215, 992.981, -124.8),
(33, 'drag-low', 10000, 1, 1957.45, 987.664, 992.981, -146.399),
(34, 'drag-low', 10000, 1, 1957.72, 987.198, 992.981, 33.9),
(35, 'visage', 25000, 2, 2597.91, 1612.59, 1506.72, 0),
(36, 'visage', 25000, 2, 2597.91, 1618.59, 1506.72, 0),
(37, 'visage', 25000, 2, 2597.91, 1618.94, 1506.74, 180),
(38, 'visage', 25000, 2, 2597.91, 1612.94, 1506.74, 180),
(39, 'visage', 25000, 2, 2597.91, 1594.46, 1506.74, 180),
(40, 'visage', 25000, 2, 2597.91, 1594.12, 1506.72, 0),
(41, 'visage', 25000, 2, 2597.91, 1588.12, 1506.72, 0),
(42, 'visage', 25000, 2, 2597.91, 1588.46, 1506.74, 180),
(43, 'visage', 25000, 2, 2608.91, 1588.12, 1506.72, 0),
(44, 'visage', 25000, 2, 2608.91, 1588.46, 1506.74, 180),
(45, 'visage', 25000, 2, 2608.91, 1594.46, 1506.74, 180),
(46, 'visage', 25000, 2, 2608.91, 1612.59, 1506.72, 0),
(47, 'visage', 25000, 2, 2608.91, 1612.94, 1506.74, 180),
(48, 'visage', 25000, 2, 2608.91, 1618.59, 1506.72, 0),
(49, 'visage', 25000, 2, 2608.91, 1618.94, 1506.74, 180),
(50, 'visage', 25000, 2, 2608.91, 1594.11, 1506.74, 0),
(51, 'visage', 50000, 2, 2587.27, 1609.03, 1506.74, 0),
(52, 'visage', 50000, 2, 2587.27, 1609.53, 1506.74, 180),
(53, 'visage', 50000, 2, 2587.08, 1615.62, 1506.74, -90),
(54, 'visage', 50000, 2, 2587.6, 1615.58, 1506.74, 90);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `spraytags`
--

CREATE TABLE `spraytags` (
  `ID` int(11) NOT NULL,
  `PosX` double NOT NULL,
  `PosY` double NOT NULL,
  `PosZ` double NOT NULL,
  `RotX` double NOT NULL,
  `RotY` double NOT NULL,
  `RotZ` double NOT NULL,
  `FactionID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `spraytags`
--

INSERT INTO `spraytags` (`ID`, `PosX`, `PosY`, `PosZ`, `RotX`, `RotY`, `RotZ`, `FactionID`) VALUES
(1, 1673.6699, -1708.4034, 14.9465, 0, 0, 90, 0),
(2, 1027.4544, -1731.8027, 14.6965, 0, 0, 90, 0),
(3, 1364.1259, -1749.8153, 15.0332, 0, 0, -90, 0),
(4, 1389.8884, -1130.9901, 24.5556, 0, 0, 0, 0),
(5, 1135.5977, -882.9584, 44.9294, 0, 0, 90, 0),
(6, 926.7588, -944.0137, 40.9565, 0, 0, 3, 0),
(7, 807.5396, -1261.487, 14.6152, 0, 0, -90, 0),
(8, 653.7018, -1384.8227, 14.5744, 0, 0, 0, 0),
(9, 394.5335, -2053.2263, 8.3056, 0, 0, -90, 9),
(10, 1799.23438, -1881.50366, 14.43192, 0, 0, 0, 0),
(11, 2109.68213, -1551.66394, 16.19917, 0, 0, -20, 0),
(12, 2430.97339, -1681.06226, 14.87916, 0, 0, -180, 0),
(13, 1082.44568, -1379.3866, 14.41758, 0, 0, 90, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `stores`
--

CREATE TABLE `stores` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL,
  `Preis` int(11) NOT NULL,
  `Pos_X` double NOT NULL,
  `Pos_Y` double NOT NULL,
  `Pos_Z` double NOT NULL,
  `Kasse` int(11) NOT NULL DEFAULT 0,
  `Navi` int(11) NOT NULL DEFAULT 0,
  `Handy` int(11) NOT NULL DEFAULT 0,
  `Telefonbuch` int(11) NOT NULL,
  `Repairkit` int(11) NOT NULL,
  `Kamera` int(11) NOT NULL DEFAULT 0,
  `Musikbox` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `stores`
--

INSERT INTO `stores` (`ID`, `Besitzer`, `Preis`, `Pos_X`, `Pos_Y`, `Pos_Z`, `Kasse`, `Navi`, `Handy`, `Telefonbuch`, `Repairkit`, `Kamera`, `Musikbox`) VALUES
(1, '', 650000, 1352.285156, -1758.549926, 13.507812, 0, 5000, 3500, 2000, 1500, 500, 2500),
(2, '', 650000, 1833.220092, -1842.541503, 13.578125, 0, 5000, 3500, 2000, 1500, 500, 2500),
(3, '', 650000, 1315.484375, -899.482482, 39.578125, 0, 5000, 3500, 2000, 1500, 500, 2500),
(4, '', 650000, 2070.916992, -1784.992065, 13.559293, 0, 5000, 3500, 2000, 1500, 500, 2500),
(5, '', 650000, 994.264953, -1296.49353, 13.546875, 0, 5000, 3500, 2000, 1500, 500, 2500);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `streetschilder`
--

CREATE TABLE `streetschilder` (
  `ID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `PosX` varchar(65) NOT NULL,
  `PosY` varchar(65) NOT NULL,
  `PosZ` varchar(65) NOT NULL,
  `PosA` varchar(65) NOT NULL,
  `createdby` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `suptickets`
--

CREATE TABLE `suptickets` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Text` varchar(164) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tankstellen`
--

CREATE TABLE `tankstellen` (
  `ID` int(11) NOT NULL,
  `Besitzer` varchar(24) NOT NULL,
  `Preis` int(11) NOT NULL,
  `Beschreibung` varchar(15) NOT NULL DEFAULT 'Tankstelle',
  `TPos_X1` double NOT NULL,
  `TPos_Y1` double NOT NULL,
  `TPos_Z1` double NOT NULL,
  `TPos_X2` double NOT NULL,
  `TPos_Y2` double NOT NULL,
  `TPos_Z2` double NOT NULL,
  `EPos_X` double NOT NULL,
  `EPos_Y` double NOT NULL,
  `EPos_Z` double NOT NULL,
  `S_PosX` double NOT NULL,
  `S_PosY` double NOT NULL,
  `S_PosZ` double NOT NULL,
  `S_PosR` double NOT NULL,
  `Benzin` int(11) NOT NULL DEFAULT 0,
  `Benzin Preis` int(11) NOT NULL DEFAULT 0,
  `Benzin Liter` int(11) NOT NULL DEFAULT 0,
  `Diesel` int(11) NOT NULL DEFAULT 0,
  `Diesel Preis` int(11) NOT NULL DEFAULT 0,
  `Diesel Liter` int(11) NOT NULL DEFAULT 0,
  `Kerosin` int(11) NOT NULL DEFAULT 0,
  `Kerosin Preis` int(11) NOT NULL DEFAULT 0,
  `Kerosin Liter` int(11) NOT NULL DEFAULT 0,
  `Kasse` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `tankstellen`
--

INSERT INTO `tankstellen` (`ID`, `Besitzer`, `Preis`, `Beschreibung`, `TPos_X1`, `TPos_Y1`, `TPos_Z1`, `TPos_X2`, `TPos_Y2`, `TPos_Z2`, `EPos_X`, `EPos_Y`, `EPos_Z`, `S_PosX`, `S_PosY`, `S_PosZ`, `S_PosR`, `Benzin`, `Benzin Preis`, `Benzin Liter`, `Diesel`, `Diesel Preis`, `Diesel Liter`, `Kerosin`, `Kerosin Preis`, `Kerosin Liter`, `Kasse`) VALUES
(1, '', 1500000, 'Tankstelle', 1944.050048, -1774.610717, 13.390598, 1939.189575, -1772.728637, 13.382812, 1929.544677, -1776.140747, 13.546875, 1953.978515, -1775.527465, 16.546875, 358.037353, 0, 0, 974, 0, 0, 0, 0, 0, 0, 127),
(2, '', 1500000, 'Tankstelle', 1001.642822, -934.17749, 42.179687, 1004.676147, -940.409606, 42.179687, 1000.087341, -920.203796, 42.328125, 1011.976623, -947.444396, 45.3125, 95.438476, 0, 0, 978, 0, 0, 0, 0, 0, 0, 110),
(4, '', 1500000, 'Tankstelle', 658.382751, -561.38739, 16.335937, 652.621643, -569.286315, 16.335937, 661.130493, -573.699584, 16.335937, 649.334289, -550.607849, 19.262317, 3.103874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '', 1500000, 'Tankstelle', 1547.512695, -2173.49121, 13.553199, 1534.34143, -2173.531005, 13.553199, 1558.405273, -2177.197998, 13.553199, 1521.183715, -2183.368896, 16.553199, 88.182228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '', 1500000, 'Tankstelle', -2239.983398, -2562.378417, 31.921875, -2244.526611, -2561.085693, 31.921875, -2231.933593, -2558.055419, 31.921875, -2254.985107, -2572.146728, 35.406925, 169.963531, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '', 1500000, 'Tankstelle', -1608.861938, -2718.819091, 48.539062, -1605.446899, -2714.280273, 48.533473, -1561.898193, -2733.44458, 48.743457, -1626.042846, -2719.333007, 51.715324, 237.073394, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, '', 1500000, 'Tankstelle', -2029.046997, 157.820953, 28.835937, -2024.041259, 157.014511, 28.835937, -2032.975219, 161.512115, 29.046106, -1683.953125, 387.886962, 10.179687, 136.387725, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, '', 1500000, 'Tankstelle', -1677.833374, 420.560455, 7.179687, -1672.066528, 415.094055, 7.179687, -1675.939208, 431.726043, 7.179687, -1687.506469, 384.046691, 10.179687, 315.128448, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, '', 1500000, 'Tankstelle', -2413.463867, 974.741699, 45.296875, -2407.608154, 975.394836, 45.296875, -2420.154785, 969.918457, 45.296875, -2400.309326, 951.403625, 48.296875, 175.468704, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, '', 1500000, 'Tankstelle', 2114.633544, 922.690979, 10.820312, 2115.071289, 911.989868, 10.820312, 2117.326171, 896.778442, 11.179687, 2136.118408, 916.965026, 14.21875, 180.344345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, '', 1500000, 'Tankstelle', 2640.003173, 1114.106811, 10.820312, 2640.025146, 1103.231689, 10.820312, 2637.186767, 1129.675781, 11.179687, 2618.645263, 1111.156494, 14.21875, 1.155213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, '', 1500000, 'Tankstelle', 2148.050048, 2740.587646, 10.820312, 2147.570312, 2751.137695, 10.820312, 2150.535888, 2733.865722, 11.176349, 2153.202148, 2761.820068, 14.179687, 90.456283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, '', 1500000, 'Tankstelle', 2194.827148, 2474.072998, 10.820312, 2206.144287, 2474.389404, 10.820312, 2188.13916, 2469.684814, 11.242187, 2215.064697, 2475.997802, 14.209033, 1.484771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, '', 1500000, 'Tankstelle', 1595.802734, 2206.16333, 10.820312, 1595.893676, 2195.986083, 10.820312, 1599.552734, 2221.314453, 11.0625, 1593.210083, 2183.287353, 14.060997, 265.439147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, '', 1500000, 'Tankstelle', 621.724182, 1681.093139, 6.992187, 618.365722, 1686.533081, 6.992187, 638.821472, 1683.937133, 7.1875, 614.207092, 1721.312622, 9.909277, 313.497528, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, '', 1500000, 'Tankstelle', -1465.037719, 1862.63269, 32.632812, -1476.599243, 1865.120971, 32.632812, -1465.767456, 1873.213256, 32.632812, -1489.670166, 1853.051147, 34.993988, 86.685073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, '', 1500000, 'Tankstelle', -1327.960937, 2682.549316, 50.0625, -1328.448364, 2676.884033, 50.0625, -1320.428588, 2698.68164, 50.266281, -1350.08081, 2660.762207, 54.25135, 222.974777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, '', 1500000, 'Tankstelle', -98.160453, -1165.539672, 2.5339, -91.150566, -1169.158203, 2.424324, -79.895622, -1169.180908, 2.176658, -108.733108, -1175.337646, 5.890625, 156.626464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `timebans`
--

CREATE TABLE `timebans` (
  `ID` int(11) NOT NULL,
  `Name` varchar(24) NOT NULL,
  `Teammitglied` varchar(24) NOT NULL,
  `Bangrund` varchar(64) NOT NULL,
  `Uhrzeit` varchar(16) NOT NULL,
  `Datum` varchar(16) NOT NULL,
  `serv_Data` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ucp_beschwerden`
--

CREATE TABLE `ucp_beschwerden` (
  `ID` int(12) NOT NULL,
  `Gegen` varchar(64) DEFAULT NULL,
  `Von` varchar(64) DEFAULT NULL,
  `Grund` varchar(64) DEFAULT NULL,
  `Zeugen` varchar(200) DEFAULT NULL,
  `Beweise` varchar(200) DEFAULT NULL,
  `Text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Date` varchar(64) DEFAULT NULL,
  `Antworten` int(12) DEFAULT NULL,
  `Status` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `ucp_beschwerden`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ucp_beschwerden_antworten`
--

CREATE TABLE `ucp_beschwerden_antworten` (
  `ID` int(12) NOT NULL,
  `bID` int(12) DEFAULT NULL,
  `Von` varchar(64) DEFAULT NULL,
  `Datum` varchar(64) DEFAULT NULL,
  `Text` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `PositionX` double NOT NULL,
  `PositionY` double NOT NULL,
  `PositionZ` double NOT NULL,
  `PositionA` double NOT NULL,
  `Farbe1` int(11) NOT NULL,
  `Farbe2` int(11) NOT NULL,
  `Paintjob` int(11) NOT NULL DEFAULT 3,
  `Fraktion` int(11) NOT NULL DEFAULT 0,
  `Gruppe` int(11) NOT NULL DEFAULT 0,
  `Autohaus` int(11) NOT NULL DEFAULT 0,
  `Nebenjob` int(11) NOT NULL DEFAULT 0,
  `Fahrschule` int(11) NOT NULL DEFAULT 0,
  `Garage` int(11) NOT NULL DEFAULT 0,
  `Firma` int(11) NOT NULL DEFAULT 0,
  `GPark` int(11) NOT NULL DEFAULT 0,
  `JobEXP` int(11) NOT NULL DEFAULT 0,
  `Besitzer` varchar(24) DEFAULT '',
  `Kennzeichen` varchar(10) NOT NULL DEFAULT '',
  `Abgeschleppt` int(11) NOT NULL DEFAULT 0,
  `Parkkralle` int(11) NOT NULL DEFAULT 0,
  `SchlepperName` varchar(24) DEFAULT '',
  `Kilometer` int(11) NOT NULL DEFAULT 0,
  `Tank` double NOT NULL DEFAULT 100,
  `Rang` int(11) NOT NULL DEFAULT 0,
  `Preis` int(11) NOT NULL DEFAULT 0,
  `Neon` int(11) NOT NULL DEFAULT 0,
  `Spoiler` int(11) NOT NULL DEFAULT 0,
  `Hood` int(11) NOT NULL DEFAULT 0,
  `Roof` int(11) NOT NULL DEFAULT 0,
  `Sideskirt` int(11) NOT NULL DEFAULT 0,
  `Lamps` int(11) NOT NULL DEFAULT 0,
  `Nitro` int(11) NOT NULL DEFAULT 0,
  `Exhaust` int(11) NOT NULL DEFAULT 0,
  `Wheels` int(11) NOT NULL DEFAULT 0,
  `Stereo` int(11) NOT NULL DEFAULT 0,
  `Hydraulics` int(11) NOT NULL DEFAULT 0,
  `Front Bumper` int(11) NOT NULL DEFAULT 0,
  `Rear Bumper` int(11) NOT NULL DEFAULT 0,
  `Vent Right` int(11) NOT NULL DEFAULT 0,
  `Vent Left` int(11) NOT NULL DEFAULT 0,
  `Panels` int(11) NOT NULL DEFAULT 0,
  `Doors` int(11) NOT NULL DEFAULT 0,
  `Lights` int(11) NOT NULL DEFAULT 0,
  `Tires` int(11) NOT NULL DEFAULT 0,
  `Geld` int(11) NOT NULL DEFAULT 0,
  `Drogen` int(11) NOT NULL DEFAULT 0,
  `C4` int(11) NOT NULL DEFAULT 0,
  `NeonFarbe` int(11) NOT NULL DEFAULT 0,
  `TuningGemeldet` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `vehicles`
--

INSERT INTO `vehicles` (`ID`, `ModelID`, `PositionX`, `PositionY`, `PositionZ`, `PositionA`, `Farbe1`, `Farbe2`, `Paintjob`, `Fraktion`, `Gruppe`, `Autohaus`, `Nebenjob`, `Fahrschule`, `Garage`, `Firma`, `GPark`, `JobEXP`, `Besitzer`, `Kennzeichen`, `Abgeschleppt`, `Parkkralle`, `SchlepperName`, `Kilometer`, `Tank`, `Rang`, `Preis`, `Neon`, `Spoiler`, `Hood`, `Roof`, `Sideskirt`, `Lamps`, `Nitro`, `Exhaust`, `Wheels`, `Stereo`, `Hydraulics`, `Front Bumper`, `Rear Bumper`, `Vent Right`, `Vent Left`, `Panels`, `Doors`, `Lights`, `Tires`, `Geld`, `Drogen`, `C4`, `NeonFarbe`, `TuningGemeldet`) VALUES
(382, 497, -2188.664062, 299.710236, 40.631481, 0.863201, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 183, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(383, 497, -2176.989746, 305.440521, 40.644806, 358.235504, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 27, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(384, 497, -2165.534668, 305.192627, 40.609879, 1.30936, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(385, 425, -2227.523438, 292.414673, 43.818188, 271.677277, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(387, 560, -2192.897949, 238.466125, 35.041466, 267.623108, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 1483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1080, 0, 1087, 0, 1140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(388, 560, -2193.160645, 234.959, 35.041553, 267.399475, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 433, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(389, 579, -2193.156494, 231.585175, 35.26741, 267.933624, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 5, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(390, 579, -2193.268311, 228.226196, 35.26746, 267.789307, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(392, 416, 1688.652954, -1277.969482, 14.961153, 359.192291, 1, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 564, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(393, 416, 1682.724976, -1278.40564, 14.994771, 358.664978, 1, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 587, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(394, 416, 1696.192871, -1276.566772, 14.869707, 40.373547, 1, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 2194, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(396, 560, 1680.100586, -1238.992554, 14.606492, 231.19838, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 305, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(404, 427, -2206.059326, 271.413269, 27.047447, 90.170486, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(405, 427, -2206.031982, 267.458649, 27.047438, 91.070045, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(406, 427, -2205.922363, 263.354248, 27.047318, 90.148888, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(407, 490, -2221.742676, 279.822632, 27.043224, 270.299011, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 302, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(408, 490, -2221.70459, 275.638092, 27.043915, 269.900513, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(409, 490, -2221.634521, 271.533295, 27.043806, 269.238068, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 22, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(410, 490, -2221.830078, 259.182709, 27.043077, 269.050018, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 263, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(411, 490, -2221.732422, 255.005325, 27.043419, 269.536926, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(412, 596, -2184.78418, 222.151291, 35.050861, 359.855988, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(414, 597, -2207.031982, 259.262268, 26.684324, 90.088417, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(415, 597, -2207.024902, 255.04454, 26.683582, 90.399475, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(416, 597, -2207.012695, 251.030441, 26.684141, 90.296074, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(417, 599, -2222.05835, 246.98819, 27.105513, 268.621582, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(418, 523, -2206.832031, 247.954147, 26.485676, 88.867828, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(419, 523, -2206.752197, 246.045166, 26.486307, 88.867828, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 68, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(421, 589, 2102.137695, -1779.493652, 13.050827, 293.734894, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 358, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(422, 589, 2101.580566, -1783.61731, 13.05128, 292.7146, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1588, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(423, 589, 2102.565674, -1775.782104, 13.051215, 295.65686, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 71, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(424, 589, 2103.354004, -1771.678833, 13.051769, 296.861633, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 27, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(425, 589, 2121.066406, -1783.872192, 13.045742, 68.237976, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 156, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(426, 589, 2121.01709, -1780.009155, 13.046998, 68.704247, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(427, 589, 2121.047363, -1776.135376, 13.049407, 66.719101, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(428, 589, 2121.101562, -1771.930176, 13.051465, 65.399857, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(429, 589, 2121.113281, -1767.356689, 13.053686, 61.949467, 3, 3, 3, 0, 0, 0, 2, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(433, 599, 1574.441162, -1711.034058, 5.888782, 357.587952, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 981, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(434, 599, 1570.389038, -1710.768555, 5.889081, 0.61522, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 1061, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(435, 599, 622.369751, -610.552429, 17.312313, 269.736908, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 11, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(436, 599, 622.546753, -606.023621, 17.304672, 269.328491, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 35, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(437, 596, 1545.055176, -1684.353394, 5.611768, 90.749718, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, 'LandWirt', 9731, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(438, 596, 1544.93103, -1680.175171, 5.554461, 91.940308, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 4513, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(439, 596, 1545.054321, -1676.220215, 5.566696, 89.835777, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 2524, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(440, 596, 1545.089844, -1672.00354, 5.611935, 89.913307, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 1153, 80, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(441, 596, 1545.091675, -1667.805054, 5.61169, 89.942085, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 868, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(442, 596, 1545.090454, -1663.079956, 5.610877, 89.849739, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 714, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(443, 560, 1545.077759, -1658.942871, 5.673365, 90.215019, 4, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 941, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(444, 560, 1545.26062, -1655.014404, 5.67346, 89.397675, 4, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 484, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(445, 547, 1545.221802, -1651.025635, 5.625988, 89.917488, 53, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 42, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(446, 427, 1538.897339, -1645.168945, 6.022634, 179.918427, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 72, 80, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(447, 427, 1534.80249, -1645.062744, 6.022614, 179.934387, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 34, 80, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(448, 427, 1530.55127, -1645.138306, 6.03125, 181.226212, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 80, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(449, 427, 1526.509399, -1645.212158, 6.0225, 180.84996, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 80, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(450, 523, 1529.585815, -1682.865234, 5.453372, 269.611267, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 1697, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(451, 523, 1529.476685, -1684.732666, 5.453958, 270.090729, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 329, 50, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(452, 601, 1558.803467, -1711.232666, 5.649372, 359.815491, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 82, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(453, 601, 1564.213867, -1711.205444, 5.649404, 359.157898, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 38, 80, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(454, 497, 1566.169922, -1654.692993, 28.562962, 90.031067, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 1137, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(455, 497, 1554.290649, -1643.94751, 28.569435, 89.995132, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(456, 497, 1566.593994, -1694.330811, 28.571472, 90.285202, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 37, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(457, 497, 1557.865234, -1708.228394, 28.56756, 90.225159, 1, 1, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(478, 462, 1833.486084, -1404.749756, 13.162154, 1.183868, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 50, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(479, 463, 1831.272339, -1404.746216, 13.104515, 0.10835, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 50, 0, 32500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(480, 461, 1828.966797, -1404.459351, 13.147598, 0.429396, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 2, 50, 0, 66000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(481, 468, 1826.654541, -1404.581665, 13.231055, 0.493371, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 50, 0, 22500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(482, 471, 1820.373047, -1404.437256, 13.043725, 0.605912, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 50, 0, 17000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(484, 521, 1824.37854, -1404.420532, 13.133945, 0.704491, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 25, 0, 87000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(485, 586, 1835.484741, -1404.549805, 13.08275, 0.566483, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 50, 0, 19000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(488, 402, -1549.726196, 1134.325073, 7.02634, 270.527466, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 185000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(489, 415, -1546.689575, 1191.811768, 6.966485, 316.815063, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 142000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(490, 429, -1550.330811, 1199.224976, 6.874422, 283.451172, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 135000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(491, 477, -1549.870361, 1207.718628, 6.949551, 246.345306, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 136000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(492, 480, -1541.948486, 1212.020508, 6.96841, 201.775909, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 147000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(494, 506, -1548.988647, 1129.141602, 6.898983, 280.732239, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 195000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(495, 534, -1526.391479, 1202.92688, 6.919497, 124.744949, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 92000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(496, 541, -1546.7146, 1123.791626, 6.819674, 304.899963, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 475000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(497, 559, -1529.110962, 1211.800781, 6.852062, 129.581253, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 127000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(499, 587, -1527.45874, 1129.383301, 6.922791, 58.889164, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 165000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(500, 603, -1527.345947, 1135.306519, 7.032691, 56.744144, 1, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 172000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(502, 574, 1359.992432, -1652.169678, 13.162652, 269.723999, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 8, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(503, 574, 1359.795776, -1660.104126, 13.180665, 269.704346, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 16, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(504, 574, 1359.860474, -1657.583496, 13.174076, 270.518341, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 54, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(505, 574, 1359.797485, -1650.187744, 13.18155, 270.15921, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 207, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(506, 574, 1359.798828, -1644.433716, 13.182641, 270.96756, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 92, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(507, 574, 1359.794312, -1642.224609, 13.182209, 269.994019, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 89, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(508, 574, 1359.805664, -1636.640259, 13.179718, 269.549225, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 16, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(509, 574, 1359.809082, -1634.412964, 13.17768, 269.59317, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 15, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(510, 574, 1375.566772, -1654.9198, 13.107986, 90.316071, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 176, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(511, 574, 1375.542847, -1658.045898, 13.10799, 90.489944, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 23, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(512, 574, 1375.523071, -1661.312988, 13.107992, 89.576332, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 9, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(513, 574, 1375.477539, -1642.844482, 13.10799, 90.29097, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1080, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(514, 574, 1375.493042, -1639.435913, 13.107988, 89.763123, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 411, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(515, 574, 1375.545044, -1636.095703, 13.107994, 89.577057, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 92, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(516, 574, 1375.520386, -1632.406128, 13.107989, 88.948975, 86, 86, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(517, 408, 1749.029175, -2057.832275, 14.376907, 180.220825, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1339, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(518, 408, 1753.947632, -2057.894531, 14.380349, 180.189697, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 328, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(519, 408, 1768.567993, -2051.677979, 14.352293, 270.11261, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 172, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(520, 408, 1768.550293, -2046.62146, 14.326375, 270.915527, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 71, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(521, 408, 1768.556274, -2034.458496, 14.316102, 270.215271, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 145, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(522, 408, 1768.533936, -2029.494995, 14.324357, 271.104675, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 71, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(523, 408, 1808.297119, -2023.942993, 14.086783, 88.948273, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 83, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(524, 408, 1808.285156, -2029.794312, 14.086977, 89.283897, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(525, 408, 1808.270996, -2036.244629, 14.106122, 89.485443, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(526, 408, 1808.311035, -2043.12561, 14.106225, 89.410088, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 75, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(527, 408, 1808.280518, -2050.467041, 14.110786, 89.43071, 1, 1, 3, 0, 0, 0, 6, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 75, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(528, 532, -31.831539, 58.015495, 4.092325, 68.880386, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 29, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(529, 532, -28.288551, 67.658447, 4.093315, 68.827354, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 34, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(530, 532, -24.947206, 76.463463, 4.088407, 70.691811, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(531, 532, -21.2612, 86.432907, 4.086964, 66.772797, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(532, 532, -56.141884, 88.648506, 4.091042, 250.070282, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 30, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(533, 532, -65.402206, 102.089607, 4.091464, 66.149849, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 15, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(534, 532, -57.072086, 98.491989, 4.099246, 66.64946, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(535, 531, -99.94384, 78.56916, 3.081515, 220.033356, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 36, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(536, 531, -98.974228, 82.977776, 3.077903, 214.702286, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 11, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(537, 531, -97.62899, 86.912865, 3.07359, 210.083328, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 12, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(538, 531, -96.383125, 91.051147, 3.075931, 210.623962, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 9, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(539, 531, -94.930481, 95.167854, 3.080075, 210.030716, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 2, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(540, 531, -93.706078, 99.835632, 3.080327, 210.572632, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(541, 531, -92.47657, 103.658829, 3.083137, 214.114075, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(542, 531, -91.062233, 107.565086, 3.082602, 217.481064, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(543, 531, -89.857292, 111.695091, 3.081346, 222.500381, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 2, 40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(544, 478, -54.215023, 55.525715, 3.101227, 29.07622, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 54, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(545, 478, -55.933853, 51.041187, 3.101632, 21.516594, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(546, 478, -57.413723, 46.192966, 3.107882, 26.848719, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(547, 478, -58.96928, 42.032059, 3.107789, 27.145948, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(548, 478, -63.050911, 56.489605, 3.097208, 284.895294, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 172, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(549, 478, -64.580254, 52.191067, 3.103001, 286.263184, 1, 0, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 12, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(550, 478, -65.985619, 47.782295, 3.09834, 288.782471, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(551, 478, -67.676949, 43.45118, 3.101994, 291.637329, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(552, 478, -69.145592, 39.382362, 3.104825, 291.730133, 1, 1, 3, 0, 0, 0, 7, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 5, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(557, 431, 1560.119141, -2315.452393, 13.640786, 90.038612, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 10669, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(558, 431, 1560.063843, -2322.132812, 13.641156, 89.959755, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 2958, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(559, 431, 1560.125732, -2328.618896, 13.646739, 90.073936, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 2531, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(560, 431, 1560.06604, -2335.164551, 13.647665, 89.578056, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1862, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(561, 437, 1539.80481, -2302.200684, 13.680191, 180.23407, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 40, '', 'Nebenjob', 0, 0, '', 450, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(562, 437, 1539.838013, -2317.960938, 13.682126, 180.327469, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 40, '', 'Nebenjob', 0, 0, '', 1128, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(563, 437, 1539.885986, -2332.999756, 13.686525, 179.831528, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 40, '', 'Nebenjob', 0, 0, '', 2789, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(564, 437, 1532.258789, -2341.664795, 13.680335, 90.129425, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 40, '', 'Nebenjob', 0, 0, '', 1142, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(565, 437, 1517.562866, -2341.663086, 13.680191, 90.101601, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 40, '', 'Nebenjob', 0, 0, '', 4238, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(566, 431, 1560.186523, -2351.762207, 13.649351, 88.774162, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1480, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(567, 431, 1560.190186, -2345.35791, 13.645537, 89.189842, 1, 1, 3, 0, 0, 0, 5, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1743, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(569, 511, 1994.209229, -2240.035156, 14.920907, 90.179398, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 543, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(570, 511, 1994.220825, -2261.631836, 14.920385, 90.809601, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 577, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(571, 511, 1994.220215, -2306.634521, 14.92068, 90.050835, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 218, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(572, 511, 1994.228027, -2328.125488, 14.931878, 90.410225, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 122, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(573, 511, 1994.20752, -2373.502441, 14.918869, 89.892464, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 257, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(574, 511, 1994.227783, -2395.242188, 14.92928, 89.884453, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 2043, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(575, 577, 1821.793213, -2422.359619, 13.470499, 178.237656, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 100, '', 'Nebenjob', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(576, 577, 1725.283447, -2441.002686, 13.469676, 180.561981, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 100, '', 'Nebenjob', 0, 0, '', 63, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(577, 553, 1889.200562, -2630.125732, 14.874688, 359.002869, 3, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 50, '', 'Nebenjob', 0, 0, '', 15269, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(590, 472, -2222.440186, 2396.500977, -0.175429, 41.702644, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(591, 472, -2229.900635, 2403.695068, -0.234641, 45.288887, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(592, 472, -2227.970459, 2390.480957, 0.003225, 44.140259, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(593, 472, -2235.45752, 2398.004639, 0.137307, 45.388878, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(594, 595, -2203.675049, 2418.216797, 0.227375, 43.252354, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(595, 595, -2209.039551, 2411.576904, 0.393519, 46.147991, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(612, 515, 2159.635254, -2280.655762, 14.390151, 223.944763, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 630, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(613, 515, 2166.77417, -2273.400391, 14.379014, 224.448593, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 325, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(614, 515, 2174.074951, -2266.127441, 14.391448, 226.712662, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 452, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(615, 515, 2169.136719, -2224.550049, 14.428092, 225.360168, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 28, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(616, 515, 2176.289307, -2217.512695, 14.536887, 224.424408, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(618, 515, 2183.549072, -2210.125977, 14.56727, 224.619141, 3, 3, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 12, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(638, 490, 1675.075317, -1231.755981, 15.035319, 180.604935, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 145, 90, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(639, 490, 1675.133789, -1223.537842, 15.03719, 179.679596, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 20, 90, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(655, 560, -2188.240723, 221.954636, 35.038425, 0.499305, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(661, 487, -2192.768799, 264.767395, 35.506317, 89.306335, 0, 0, 3, 6, 0, 0, 0, 0, 0, 0, 0, 0, '', 'FBI', 0, 0, '', 201, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(671, 426, 1585.056396, -1679.875977, 5.668138, 270.656006, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 262, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(695, 560, -1526.254395, 1140.74292, 6.899515, 52.29435, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 0, 0, 275000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(699, 411, -1540.244141, 1145.328125, 6.921813, 215.123627, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(710, 582, 736.7005, -1333.27356, 13.59531, 270.025085, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 1, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(711, 582, 765.953735, -1333.22229, 13.601531, 270.627319, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 656, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(712, 582, 746.436401, -1333.219116, 13.598129, 270.0177, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 46, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(713, 582, 756.608154, -1333.161377, 13.596899, 269.671631, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 180, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(714, 488, 744.607422, -1373.267334, 27.193497, 91.44487, 0, 6, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 88, 150, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(715, 560, 760.171143, -1367.280151, 13.1784, 0.326893, 6, 6, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 573, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1010, 1028, 1080, 0, 1087, 1170, 1141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(717, 579, 760.348633, -1358.721436, 13.45217, 2.004667, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 673, 80, 4, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1073, 0, 1087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(718, 586, 749.119263, -1357.690918, 13.038944, 0, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 689, 50, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(719, 586, 753.660889, -1357.523804, 13.038866, 359.47995, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 672, 50, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(730, 426, 1680.502197, -1244.587402, 14.679158, 228.978928, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 496, 60, 1, 42000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(749, 552, 2138.47998, -1739.190552, 13.253327, 90.877274, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 486, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(750, 552, 2138.624023, -1735.111206, 13.247076, 87.587395, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1183, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(752, 552, 2126.139893, -1735.615112, 13.251173, 269.540924, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 681, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(753, 552, 2125.998779, -1731.161621, 13.249394, 270.725555, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 164, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(754, 552, 2138.374268, -1726.535156, 13.236145, 90.115479, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 165, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(755, 552, 2138.39917, -1730.439575, 13.242435, 90.224564, 7, 1, 3, 0, 0, 0, 11, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1417, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(756, 428, 1741.092163, -1692.732788, 13.653074, 269.356232, 0, 0, 3, 0, 0, 0, 10, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 268, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(759, 428, 1741.299072, -1704.16626, 13.652029, 269.600037, 0, 0, 3, 0, 0, 0, 10, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 165, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(762, 428, 1741.14624, -1698.308594, 13.650753, 269.76413, 0, 0, 3, 0, 0, 0, 10, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 105, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(763, 428, 1741.067749, -1709.911621, 13.653672, 269.883972, 0, 0, 3, 0, 0, 0, 10, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1017, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(768, 528, 612.78418, -596.953064, 17.263836, 269.616852, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 8, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(769, 528, 613.398987, -601.447266, 17.259144, 270.470612, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 8, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(770, 528, 1528.889771, -1687.892334, 5.921479, 270.226074, 0, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 503, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(805, 487, 658.073608, -1547.801392, 15.027932, 90.913849, 1, 1, 3, 0, 0, 4, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 150, 0, 1200000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(806, 469, 675.669739, -1528.620483, 14.862339, 180.985443, 1, 1, 3, 0, 0, 4, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 150, 0, 950000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(810, 562, -1526.387451, 1192.915283, 6.853371, 49.791718, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 225000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(841, 466, 1873.493164, -1581.899902, 13.351984, 203.111084, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 15500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(842, 550, 1900.447266, -1581.330444, 13.428522, 192.275665, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 27500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(843, 533, 1891.436157, -1582.056519, 13.319231, 201.505524, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 32500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(844, 542, 1881.732788, -1581.820068, 13.364027, 200.218964, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 27500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(845, 565, 1869.462402, -1592.916504, 13.234272, 27.877979, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(848, 496, 1877.675171, -1593.580933, 13.332612, 27.775156, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 3, 40, 0, 22500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(849, 579, 1903.565308, -1591.539673, 13.550784, 36.76672, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 80, 0, 78000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(858, 553, 1822.046143, -2626.11377, 14.878005, 359.845398, 1, 3, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1154, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(906, 544, 1697.035645, -1213.928589, 15.228382, 139.415207, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(907, 544, 1696.627441, -1223.031982, 15.218518, 140.306076, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(931, 593, 1871.783447, -2270.916992, 13.546875, 276.422607, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(933, 593, 1871.546021, -2286.681885, 13.546875, 279.535736, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 40, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(934, 593, 1870.945923, -2301.969482, 13.546875, 272.530975, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 915, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(935, 593, 1906.254761, -2240.029785, 13.546875, 183.500626, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(936, 593, 1919.06665, -2239.583984, 13.546875, 186.260345, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 172, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(937, 593, 1932.007935, -2239.102783, 13.546875, 181.496201, 1, 1, 3, 0, 0, 0, 4, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1616, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(938, 407, 1696.122437, -1232.161255, 15.104393, 139.089233, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 41, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(939, 407, 1697.659424, -1239.816284, 15.221564, 140.591583, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 209, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(944, 481, 1818.277344, -1404.01001, 13.563055, 358.718689, 1, 1, 3, 0, 0, 2, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 0, 0, 1500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(958, 522, 1685.523315, -1214.611816, 14.554697, 180.023804, 1, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 3, 25, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(961, 522, 1680.927002, -1214.359863, 14.536437, 179.71727, 1, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 137, 25, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(965, 597, 1697.475708, -1262.719727, 14.584465, 42.553623, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 294, 80, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(966, 597, 1697.198975, -1270.304443, 14.585491, 40.338886, 3, 3, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 0, 80, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(972, 541, 1578.626099, -1711.413574, 5.5156, 358.141266, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 919, 40, 0, 215000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(990, 525, 1130.850708, -1696.694702, 13.125843, 0.611222, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 104, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(991, 525, 1126.337524, -1696.727783, 13.140501, 0, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 71, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(992, 525, 1121.88269, -1696.696167, 13.141777, 359.458771, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 1029, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(993, 525, 1117.562866, -1696.560303, 13.139245, 359.117737, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 1226, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(994, 552, 1113.227905, -1696.652344, 12.957365, 0.113649, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 425, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(995, 552, 1108.46521, -1696.642456, 12.954125, 359.02774, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 15, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(996, 490, 1100.64563, -1666.394287, 13.387324, 89.972664, 1, 2, 3, 7, 0, 0, 0, 0, 0, 0, 0, 0, '', 'O-AMT', 0, 0, '', 209, 90, 5, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1005, 515, 2469.910889, -2646.527832, 14.665369, 178.97258, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 4574, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1015, 480, 745.61908, -1355.146729, 13.273344, 270.655457, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 994, 60, 5, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 1080, 0, 1087, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(1028, 463, 742.038391, -1358.291016, 13.04006, 359.23819, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 428, 50, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1029, 586, 751.383911, -1357.259644, 13.038702, 358.74408, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 30, 50, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1038, 542, 764.966492, -1367.807983, 13.260286, 1.607745, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 30, 60, 0, 13500, 0, 0, 0, 0, 0, 0, 1010, 0, 1074, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(1039, 542, 764.347778, -1358.641724, 13.26723, 2.462414, 6, 0, 3, 8, 0, 0, 0, 0, 0, 0, 0, 0, '', 'NEWS', 0, 0, '', 20, 60, 0, 13500, 0, 0, 0, 0, 0, 0, 1010, 0, 1074, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(1040, 489, 1885.845825, -1592.783447, 13.88519, 30.302448, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 80, 0, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1041, 405, 1895.248657, -1592.318604, 13.490384, 33.023712, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1042, 535, 1855.690918, -1584.869141, 13.390972, 236.078918, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 3, 60, 0, 75000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1043, 422, 1852.260498, -1588.867188, 13.61777, 233.581543, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 4, 60, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1044, 451, -1533.033936, 1124.698242, 6.901484, 63.128002, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 40, 0, 450000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1046, 409, -1548.872437, 1144.296875, 6.994729, 230.256851, 1, 1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 80, 0, 295000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1047, 412, 1909.45874, -1590.369507, 13.448616, 36.917229, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 0, 60, 0, 60000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `vehicles` (`ID`, `ModelID`, `PositionX`, `PositionY`, `PositionZ`, `PositionA`, `Farbe1`, `Farbe2`, `Paintjob`, `Fraktion`, `Gruppe`, `Autohaus`, `Nebenjob`, `Fahrschule`, `Garage`, `Firma`, `GPark`, `JobEXP`, `Besitzer`, `Kennzeichen`, `Abgeschleppt`, `Parkkralle`, `SchlepperName`, `Kilometer`, `Tank`, `Rang`, `Preis`, `Neon`, `Spoiler`, `Hood`, `Roof`, `Sideskirt`, `Lamps`, `Nitro`, `Exhaust`, `Wheels`, `Stereo`, `Hydraulics`, `Front Bumper`, `Rear Bumper`, `Vent Right`, `Vent Left`, `Panels`, `Doors`, `Lights`, `Tires`, `Geld`, `Drogen`, `C4`, `NeonFarbe`, `TuningGemeldet`) VALUES
(1062, 523, 1526.668457, -1682.743164, 5.461087, 273.409912, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 130, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1063, 523, 1526.657959, -1685.28186, 5.459743, 264.561371, 1, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 86, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1071, 515, 2503.822021, -2632.580078, 14.668869, 90.309563, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 6045, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1072, 515, 2456.755371, -2648.56543, 14.682906, 179.08783, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 642, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1073, 515, 2469.662354, -2639.563477, 14.673336, 227.842087, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1244, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1074, 515, 2503.819824, -2626.548828, 14.665184, 89.784195, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1684, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1075, 515, 2469.848633, -2628.563232, 14.683259, 227.506378, 1, 1, 3, 0, 0, 0, 16, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 1623, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1087, 567, 1909.238403, -1581.561646, 13.480792, 136.42131, 1, 1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0, '', 'Autohaus', 0, 0, '', 1, 60, 0, 67000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1096, 567, 1585.164062, -1676.021484, 5.799335, 268.929138, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 38, 60, 0, 67000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1105, 521, 1679.870483, -1233.983032, 14.519268, 233.025848, 3, 1, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 5, 25, 2, 19800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1106, 579, 1585.625977, -1683.887329, 6.155733, 267.505493, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 119, 80, 0, 64000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1107, 521, 1680.01355, -1229.480103, 14.515974, 234.284668, 3, 1, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 1, 25, 2, 19800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1108, 422, 1585.863159, -1669.367065, 5.878386, 269.642456, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 2, 60, 0, 50000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1109, 405, 1585.272217, -1672.59021, 5.806886, 268.541901, 79, 1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SAPD', 0, 0, '', 3, 60, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1132, 487, 1652.695312, -1230.978271, 21.314932, 88.386101, 3, 1, 3, 5, 0, 0, 0, 0, 0, 0, 0, 0, '', 'SARD', 0, 0, '', 17, 150, 4, 800000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1144, 426, 1002.777588, -1354.017334, 13.0232, 270.206909, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1145, 426, 1002.878906, -1350.158936, 13.023797, 269.619904, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1146, 461, 1003.359314, -1338.773193, 12.898097, 270.403107, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1147, 461, 1003.254883, -1342.383301, 12.903697, 267.733002, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1148, 515, 1025.401978, -1341.371338, 14.3402, 89.292297, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1149, 487, 1036.516968, -1376.650146, 13.4951, 89.598297, 2, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, '', 'Fahrschule', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1185, 597, -1616.391357, 692.601013, -5.471936, 182.98613, 1, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1186, 597, -1600.183228, 692.371582, -5.473958, 181.302673, 1, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1187, 597, -1608.708984, 692.333923, -5.471803, 180.750305, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1188, 597, -1604.344727, 692.40802, -5.473093, 179.342087, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1189, 597, -1612.179565, 692.606934, -5.470345, 181.410233, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1190, 427, -1639.115112, 686.500488, -5.109608, 270.517883, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1191, 601, -1639.119507, 682.110291, -5.479947, 268.801117, 2, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 2, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1192, 497, -1689.417603, 706.263977, 30.601562, 0.402511, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1193, 497, -1674.111694, 706.031738, 30.601562, 1.3653, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 16, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1194, 523, -1639.511841, 691.502563, -5.587481, 245.730499, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1195, 523, -1637.709473, 693.790466, -5.587806, 221.960785, 2, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1196, 599, -1620.727173, 692.605225, -5.053687, 179.099869, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1197, 599, -1624.966187, 693.003723, -5.05339, 180.958725, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1198, 560, -1572.574829, 709.941284, -5.482625, 90.225533, 2, 2, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1199, 560, -1572.513794, 705.619934, -5.523818, 86.888893, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, '', 'CDMS', 0, 0, '', 16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1200, 542, 1834.749389, -1872.031494, 13.131362, 358.691986, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Robin', 'LS:E:869', 0, 0, '', 63, 4.690998, 0, 27500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 50463234, 5, 0, 0, 0, 0, 0, 0),
(1201, 550, 1787.653808, -1910.113891, 13.212813, 89.827468, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tobi_DeKey', 'LS:T:3', 0, 0, '', 15, 19.513999, 0, 27500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1202, 451, 1886.473876, -1759.4104, 13.251097, 297.991546, 128, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Tobi_DeKey', 'LS:I:9', 0, 0, '', 74, 8.011995, 0, 450000, 0, 0, 0, 0, 0, 0, 1010, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1203, 535, 1895.753295, -1573.172851, 13.413297, 359.441192, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'time', 'LS:V:3', 0, 0, '', 0, 0, 0, 75000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1204, 560, 293.374938, -1147.654663, 80.615318, 183.729049, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'David2099', 'LS:O:4', 0, 0, '', 320, 12.088399, 0, 275000, 0, 1139, 0, 1032, 1027, 0, 1010, 1028, 1079, 0, 0, 1169, 1141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1205, 565, 1113.323364, -1680.797485, 12.892578, 352.929016, 7, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'seven', 'LS:N:112', 0, 0, '', 140, 26.148998, 0, 25000, 0, 0, 0, 0, 0, 0, 1010, 1046, 1083, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0),
(1209, 411, -1517.790771, 1145.604736, 6.8796, 269.588897, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, -1, 0, 'Colon_Moneyrain', 'LS:R:61', 0, 0, '', 10, 25, 0, 1000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1210, 409, -1517.821777, 1131.095214, 6.8926, 270.015991, 1, 1, 3, 0, 0, 0, 0, 0, 23, 0, 2, 0, 'Colon_Moneyrain', 'LS:V:674', 0, 0, '', 5, 78.717498, 0, 295000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 514, 5, 0, 0, 0, 0, 0, 0),
(1211, 432, 1254.664672, -807.971435, 84.149597, 358.965515, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Colon_Moneyrain', 'LS:V:675', 0, 0, '', 27, 73.074493, 0, 295000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1212, 573, -976.590942, 2641.023925, 42.762241, 60.832565, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RayN.', 'LS:V:676', 0, 0, '', 0, 80, 0, 295000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1213, 520, -887.563598, 2546.937988, 42.839641, 239.230224, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'RayN.', 'LS:V:677', 0, 0, '', 15, 144.32991, 0, 295000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1214, 560, 1233.981079, -894.128784, 42.588001, 278.333099, 1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zack', 'LS:U:234', 0, 0, '', 43, 7.809494, 0, 275000, 0, 1139, 0, 1033, 1030, 0, 1010, 1029, 0, 0, 0, 1170, 1140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1215, 560, 1544.548583, 13.631148, 23.842941, 301.921752, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 1, 0, '', 29, 51.77848, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0),
(1216, 560, 1543.910278, 19.015562, 23.845648, 255.092438, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1217, 560, 1514.286865, 10.044322, 23.845907, 328.840485, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1218, 560, 1519.643677, 10.752978, 23.845366, 325.438293, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1219, 522, 1566.269165, 29.860445, 23.735643, 95.060722, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1220, 522, 1566.033325, 31.709938, 23.736115, 96.257385, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1221, 411, 1551.585083, -32.328011, 21.074074, 1.343685, 0, 0, 3, 19, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, '', 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1223, 406, 1264.790527, -866.515869, 44.408786, 186.778915, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Zack', 'LS:I:7', 0, 0, '', 4, 19.351997, 0, 500000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1224, 560, -2701.436523, 242.583572, 3.905045, 357.860809, -34, 14, 1, 0, 0, 0, 0, 0, 27, 0, 1, 0, 'RayN.', '', 0, 0, '', 15, 15.74749, 0, 275000, 0, 1139, 0, 1033, 1031, 0, 1010, 1029, 1082, 0, 1087, 1170, 1140, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0),
(1225, 405, 1902.418579, -1555.258057, 13.4382, 271.552795, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'lePasi', 'LS:K:662', 0, 0, '', 0, 100, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1226, 579, 1899.768921, -1573.217285, 13.4064, 359.165192, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'c0kkie', 'LS:Y:4', 0, 0, '', 0, 80, 0, 78000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1227, 560, 265.839752, -1375.654175, 52.814999, 10.764384, 1, 1, 3, 15, 0, 0, 0, 0, 0, 0, 0, 0, '', 'YAKUZA', 0, 0, '', 115, 0, 0, 0, 0, 1139, 0, 1033, 1026, 0, 1010, 1029, 1075, 0, 0, 1169, 1141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(1228, 565, 2508.634277, -1686.126343, 13.182309, 45.711349, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'NoxiZ', 'LS:O:66', 0, 0, '', 16, 96.112061, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0),
(1229, 579, 2507.572754, -1677.437988, 13.389297, 329.292603, 16, 16, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 'GROVE', 0, 0, '', 3, 79.149498, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1230, 579, 1902.418579, -1555.258057, 13.4382, 271.552795, 16, 16, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 'GROVE', 0, 0, '', 0, 80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1231, 593, 1851.665771, -2543.421143, 13.546875, 88.481926, 5, 5, 3, 0, 0, 0, 17, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1232, 593, 1848.539429, -2564.839111, 13.546875, 88.481926, 5, 5, 3, 0, 0, 0, 17, 0, 0, 0, 0, 0, '', 'Nebenjob', 0, 0, '', 0, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1234, 567, 1899.768921, -1573.217285, 13.4064, 359.165192, 16, 16, 3, 9, 0, 0, 0, 0, 0, 0, 0, 0, '', 'Fraktion', 0, 0, '', 0, 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1235, 489, 1895.753296, -1573.172852, 13.4133, 359.441193, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'VegaZ', 'LS:R:638', 0, 0, '', 0, 100, 0, 100000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1236, 496, 1899.768921, -1573.217285, 13.4064, 359.165192, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Basti', 'LS:G:25', 0, 0, '', 0, 100, 0, 22500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1237, 466, 1895.753296, -1573.172852, 13.4133, 359.441193, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Basti', 'LS:H:56', 0, 0, '', 0, 100, 0, 15500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vip`
--

CREATE TABLE `vip` (
  `ID` int(11) NOT NULL,
  `Name` varchar(65) NOT NULL,
  `Teammitglied` varchar(65) NOT NULL,
  `Uhrzeit` varchar(65) NOT NULL,
  `Datum` varchar(65) NOT NULL,
  `serv_Data` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `vip`
--

INSERT INTO `vip` (`ID`, `Name`, `Teammitglied`, `Uhrzeit`, `Datum`, `serv_Data`) VALUES
(2, 'Colon_Moneyrain', 'Colon_Moneyrain', '23:58:44', '27/12/2019', 1627466532),
(4, 'David2099', 'RayN.', '12:57:27', '28/12/2019', 1727730471),
(5, 'Zack', 'Zack', '00:31:09', '4/01/2020', 1664494269),
(10, 'ShadowKev1999', 'Tagesbelohnung', '20:02:28', '18/04/2023', 1681927348);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wantedkatalog`
--

CREATE TABLE `wantedkatalog` (
  `ID` int(12) NOT NULL,
  `wantedcount` int(12) NOT NULL,
  `wanteddesc` varchar(64) NOT NULL,
  `Ersteller` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `wantedkatalog`
--

INSERT INTO `wantedkatalog` (`ID`, `wantedcount`, `wanteddesc`, `Ersteller`) VALUES
(14, 2, 'Beschuss', 'GangstaSunny'),
(15, 1, 'Behinderung der Justiz', 'GangstaSunny'),
(16, 2, 'Waffen/Drogen-Handel', 'GangstaSunny'),
(17, 1, 'Drogenbesitz', 'GangstaSunny'),
(18, 1, 'Illegaler Waffenbesitz', 'GangstaSunny'),
(19, 4, 'Betreten eines Sperrgebiets', 'GangstaSunny'),
(20, 6, 'Geiselnahme', 'GangstaSunny'),
(21, 2, 'Flucht', 'GangstaSunny'),
(22, 1, 'Bestechungsversuch', 'GangstaSunny'),
(23, 1, 'Beleidigung', 'GangstaSunny');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `werbetafel`
--

CREATE TABLE `werbetafel` (
  `ID` int(11) NOT NULL,
  `Text` varchar(256) NOT NULL DEFAULT 'Hier könnte Ihre Werbung stehen!'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `werbetafel`
--

INSERT INTO `werbetafel` (`ID`, `Text`) VALUES
(0, 'Hier könnte Ihre Werbung stehen!'),
(1, 'Hier könnte Ihre Werbung stehen!'),
(2, 'Hier könnte Ihre Werbung stehen!'),
(3, 'Hier könnte Ihre Werbung stehen!'),
(4, 'Hier könnte Ihre Werbung stehen!'),
(5, 'Hier könnte Ihre Werbung stehen!'),
(6, 'Hier könnte Ihre Werbung stehen!'),
(7, 'Hier könnte Ihre Werbung stehen!'),
(8, 'Hier könnte Ihre Werbung stehen!'),
(9, 'Hier könnte Ihre Werbung stehen!'),
(10, 'Hier könnte Ihre Werbung stehen!'),
(11, 'Hier könnte Ihre Werbung stehen!'),
(12, 'Hier könnte Ihre Werbung stehen!'),
(13, 'Hier könnte Ihre Werbung stehen!'),
(14, 'Hier könnte Ihre Werbung stehen!'),
(15, 'Hier könnte Ihre Werbung stehen!'),
(16, 'Hier könnte Ihre Werbung stehen!'),
(17, 'Hier könnte Ihre Werbung stehen!'),
(18, 'Hier könnte Ihre Werbung stehen!'),
(19, 'Hier könnte Ihre Werbung stehen!'),
(20, 'Hier könnte Ihre Werbung stehen!'),
(21, 'Hier könnte Ihre Werbung stehen!');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `whitelist`
--

CREATE TABLE `whitelist` (
  `Name` varchar(24) NOT NULL,
  `Code` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Daten für Tabelle `whitelist`
--

INSERT INTO `whitelist` (`Name`, `Code`) VALUES
('Alex_Capone', 'h6kjl13fds');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `zz_colucp_transactions`
--

CREATE TABLE `zz_colucp_transactions` (
  `id` int(12) NOT NULL,
  `Kontoinhaber` varchar(128) NOT NULL,
  `Sender` varchar(128) NOT NULL,
  `Betrag` int(12) NOT NULL,
  `Verwendungszweck` varchar(64) NOT NULL,
  `Datum` varchar(16) NOT NULL,
  `Uhrzeit` varchar(16) NOT NULL,
  `serv_Data` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `zz_colucp_transactions`
--


--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accbans`
--
ALTER TABLE `accbans`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indizes für die Tabelle `accwarns`
--
ALTER TABLE `accwarns`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ammunation`
--
ALTER TABLE `ammunation`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `beta`
--
ALTER TABLE `beta`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `blitzer`
--
ALTER TABLE `blitzer`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `carinfos`
--
ALTER TABLE `carinfos`
  ADD PRIMARY KEY (`ModelID`);

--
-- Indizes für die Tabelle `CASINO_POOLS`
--
ALTER TABLE `CASINO_POOLS`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`Index`);

--
-- Indizes für die Tabelle `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `dynamic_atms`
--
ALTER TABLE `dynamic_atms`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `eastereggs`
--
ALTER TABLE `eastereggs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `einsatzsys_einsatzdata`
--
ALTER TABLE `einsatzsys_einsatzdata`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `einsatzsys_fires`
--
ALTER TABLE `einsatzsys_fires`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `einsatzsys_npcs`
--
ALTER TABLE `einsatzsys_npcs`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `einsatzsys_objects`
--
ALTER TABLE `einsatzsys_objects`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `einsatzsys_vehs`
--
ALTER TABLE `einsatzsys_vehs`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `einsatzsys_verltypes`
--
ALTER TABLE `einsatzsys_verltypes`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `eventboxen`
--
ALTER TABLE `eventboxen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `frakequip`
--
ALTER TABLE `frakequip`
  ADD PRIMARY KEY (`frakid`);

--
-- Indizes für die Tabelle `frakinfos`
--
ALTER TABLE `frakinfos`
  ADD PRIMARY KEY (`FID`);

--
-- Indizes für die Tabelle `fraktionen`
--
ALTER TABLE `fraktionen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `freikaufpreise`
--
ALTER TABLE `freikaufpreise`
  ADD PRIMARY KEY (`ID`);

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
-- Indizes für die Tabelle `grangnamen`
--
ALTER TABLE `grangnamen`
  ADD PRIMARY KEY (`gid`);

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
-- Indizes für die Tabelle `jobinfos`
--
ALTER TABLE `jobinfos`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `lastplayerdata`
--
ALTER TABLE `lastplayerdata`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `newskiosk`
--
ALTER TABLE `newskiosk`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `newspaper`
--
ALTER TABLE `newspaper`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `oldtickets`
--
ALTER TABLE `oldtickets`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `rangnamen`
--
ALTER TABLE `rangnamen`
  ADD PRIMARY KEY (`frakid`);

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
-- Indizes für die Tabelle `skinordnung`
--
ALTER TABLE `skinordnung`
  ADD PRIMARY KEY (`frakid`);

--
-- Indizes für die Tabelle `SLOT_MACHINES`
--
ALTER TABLE `SLOT_MACHINES`
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
-- Indizes für die Tabelle `suptickets`
--
ALTER TABLE `suptickets`
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
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ucp_beschwerden`
--
ALTER TABLE `ucp_beschwerden`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ucp_beschwerden_antworten`
--
ALTER TABLE `ucp_beschwerden_antworten`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`,`Geld`);

--
-- Indizes für die Tabelle `vip`
--
ALTER TABLE `vip`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `wantedkatalog`
--
ALTER TABLE `wantedkatalog`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `werbetafel`
--
ALTER TABLE `werbetafel`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`Name`);

--
-- Indizes für die Tabelle `zz_colucp_transactions`
--
ALTER TABLE `zz_colucp_transactions`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accbans`
--
ALTER TABLE `accbans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `accounts`
--
ALTER TABLE `accounts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT für Tabelle `accwarns`
--
ALTER TABLE `accwarns`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `beta`
--
ALTER TABLE `beta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `config`
--
ALTER TABLE `config`
  MODIFY `Index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `contracts`
--
ALTER TABLE `contracts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `dynamic_atms`
--
ALTER TABLE `dynamic_atms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `eastereggs`
--
ALTER TABLE `eastereggs`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_einsatzdata`
--
ALTER TABLE `einsatzsys_einsatzdata`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_fires`
--
ALTER TABLE `einsatzsys_fires`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_npcs`
--
ALTER TABLE `einsatzsys_npcs`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_objects`
--
ALTER TABLE `einsatzsys_objects`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_vehs`
--
ALTER TABLE `einsatzsys_vehs`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `einsatzsys_verltypes`
--
ALTER TABLE `einsatzsys_verltypes`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `eventboxen`
--
ALTER TABLE `eventboxen`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `freikaufpreise`
--
ALTER TABLE `freikaufpreise`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `languages`
--
ALTER TABLE `languages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `lastplayerdata`
--
ALTER TABLE `lastplayerdata`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT für Tabelle `newskiosk`
--
ALTER TABLE `newskiosk`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `newspaper`
--
ALTER TABLE `newspaper`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `oldtickets`
--
ALTER TABLE `oldtickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `serverlager`
--
ALTER TABLE `serverlager`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `serverlog_easter`
--
ALTER TABLE `serverlog_easter`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `SLOT_MACHINES`
--
ALTER TABLE `SLOT_MACHINES`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT für Tabelle `spraytags`
--
ALTER TABLE `spraytags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `streetschilder`
--
ALTER TABLE `streetschilder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `suptickets`
--
ALTER TABLE `suptickets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `timebans`
--
ALTER TABLE `timebans`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `ucp_beschwerden`
--
ALTER TABLE `ucp_beschwerden`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `ucp_beschwerden_antworten`
--
ALTER TABLE `ucp_beschwerden_antworten`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1238;

--
-- AUTO_INCREMENT für Tabelle `vip`
--
ALTER TABLE `vip`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `wantedkatalog`
--
ALTER TABLE `wantedkatalog`
  MODIFY `ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `zz_colucp_transactions`
--
ALTER TABLE `zz_colucp_transactions`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
