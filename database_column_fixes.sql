-- Fehlende Spalten für bestehende Tabellen hinzufügen
-- Basierend auf den Fehlerlogs

-- Spalten für accounts Tabelle
ALTER TABLE `accounts` 
ADD COLUMN IF NOT EXISTS `PlayerObjects` int(11) NOT NULL DEFAULT 0 AFTER `FischGewicht`,
ADD COLUMN IF NOT EXISTS `healthInsurance` int(11) NOT NULL DEFAULT -1 AFTER `PlayerObjects`,
ADD COLUMN IF NOT EXISTS `healthInsuranceTime` int(11) NOT NULL DEFAULT 0 AFTER `healthInsurance`;

-- Spalten für allgemein Tabelle
ALTER TABLE `allgemein` 
ADD COLUMN IF NOT EXISTS `WinterMode` tinyint(1) NOT NULL DEFAULT 0 AFTER `ServerID`,
ADD COLUMN IF NOT EXISTS `HalloweenEvent` tinyint(1) NOT NULL DEFAULT 0 AFTER `WinterMode`;

-- Spalten für mapping_objects Tabelle
ALTER TABLE `mapping_objects` 
ADD COLUMN IF NOT EXISTS `MaterialText0` varchar(128) NOT NULL DEFAULT '' AFTER `MaterialColor5`;
