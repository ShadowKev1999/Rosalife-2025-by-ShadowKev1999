-- Rosalife 2025 Database Initialization
-- This file contains basic database setup for the server

-- You can import the main database schema from rosalife-2025-database.sql
-- and then run the fixes from database_fixes.sql

-- Basic server configuration
INSERT IGNORE INTO `allgemein` (`ServerID`, `Rekord`, `WinterMode`, `DoubleEXP`, `EasterEvent`, `HalloweenEvent`) 
VALUES (1, 0, 0, 0, 0, 0);

INSERT IGNORE INTO `config` (`Config`, `ValueInt`) VALUES 
('LottoGewinn', 1000000),
('Beta', 0);
