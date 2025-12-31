-- Anti-Cheat System Database Tables
-- Erstellt für Rosalife-2025 Anti-Cheat System

-- Cheat-Logs Tabelle
CREATE TABLE IF NOT EXISTS `anti_cheat_logs` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(24) NOT NULL,
  `reason` varchar(128) NOT NULL,
  `action` varchar(64) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `player_name` (`player_name`),
  KEY `timestamp` (`timestamp`),
  KEY `action` (`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Cheat-Statistics Tabelle
CREATE TABLE IF NOT EXISTS `anti_cheat_stats` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total_detections` int(11) NOT NULL DEFAULT 0,
  `weapon_hacks` int(11) NOT NULL DEFAULT 0,
  `money_hacks` int(11) NOT NULL DEFAULT 0,
  `health_hacks` int(11) NOT NULL DEFAULT 0,
  `speed_hacks` int(11) NOT NULL DEFAULT 0,
  `teleport_hacks` int(11) NOT NULL DEFAULT 0,
  `bans` int(11) NOT NULL DEFAULT 0,
  `kicks` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `date` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Suspicious IPs Tabelle
CREATE TABLE IF NOT EXISTS `suspicious_ips` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL,
  `reason` varchar(128) NOT NULL,
  `detection_count` int(11) NOT NULL DEFAULT 1,
  `last_seen` timestamp NOT NULL DEFAULT current_timestamp(),
  `banned` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ip` (`ip`),
  KEY `last_seen` (`last_seen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Player Anti-Cheat Status Tabelle
CREATE TABLE IF NOT EXISTS `player_anticheat_status` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(24) NOT NULL,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `last_detection` timestamp NULL DEFAULT NULL,
  `total_detections` int(11) NOT NULL DEFAULT 0,
  `banned` int(11) NOT NULL DEFAULT 0,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `player_name` (`player_name`),
  KEY `banned` (`banned`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- Index für bessere Performance
ALTER TABLE `anti_cheat_logs` ADD INDEX `player_timestamp` (`player_name`, `timestamp`);
ALTER TABLE `anti_cheat_stats` ADD INDEX `date_stats` (`date`, `total_detections`);
ALTER TABLE `suspicious_ips` ADD INDEX `ip_count` (`ip`, `detection_count`);

-- Trigger für tägliche Statistiken
DELIMITER //
CREATE TRIGGER IF NOT EXISTS `update_daily_cheat_stats`
AFTER INSERT ON `anti_cheat_logs`
FOR EACH ROW
BEGIN
    INSERT INTO `anti_cheat_stats` (`date`, `total_detections`)
    VALUES (CURRENT_DATE, 1)
    ON DUPLICATE KEY UPDATE
        SET `total_detections` = `total_detections` + 1;
    
    -- Spezifische Cheat-Typen aktualisieren
    IF NEW.reason LIKE '%Weapon%' THEN
        UPDATE `anti_cheat_stats` 
        SET `weapon_hacks` = `weapon_hacks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.reason LIKE '%Money%' THEN
        UPDATE `anti_cheat_stats` 
        SET `money_hacks` = `money_hacks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.reason LIKE '%Health%' THEN
        UPDATE `anti_cheat_stats` 
        SET `health_hacks` = `health_hacks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.reason LIKE '%Speed%' THEN
        UPDATE `anti_cheat_stats` 
        SET `speed_hacks` = `speed_hacks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.reason LIKE '%Teleport%' THEN
        UPDATE `anti_cheat_stats` 
        SET `teleport_hacks` = `teleport_hacks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.action = 'BAN' THEN
        UPDATE `anti_cheat_stats` 
        SET `bans` = `bans` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
    
    IF NEW.action = 'KICK' THEN
        UPDATE `anti_cheat_stats` 
        SET `kicks` = `kicks` + 1
        WHERE `date` = CURRENT_DATE();
    END IF;
END//
DELIMITER ;

-- Initiale Statistiken für heute
INSERT IGNORE INTO `anti_cheat_stats` (`date`, `total_detections`) 
VALUES (CURRENT_DATE(), 0);
