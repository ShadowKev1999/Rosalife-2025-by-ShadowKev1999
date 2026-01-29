-- Fix for Duplicate Entry Error in accplaytime table
-- This resolves the remaining error: Duplicate entry 'Kevin18820' for key 'Name'

-- Solution 1: Use INSERT IGNORE instead of INSERT
-- This will ignore the duplicate and continue

-- Solution 2: Use ON DUPLICATE KEY UPDATE
-- This will update the existing record instead of creating a duplicate

-- The gamemode should be modified to use one of these approaches:
-- INSERT IGNORE INTO `accplaytime` (`Name`, `PlayedTime`) VALUES ('Kevin18820', '15');
-- OR
-- INSERT INTO `accplaytime` (`Name`, `PlayedTime`) VALUES ('Kevin18820', '15') 
-- ON DUPLICATE KEY UPDATE `PlayedTime` = VALUES(`PlayedTime`);

-- For now, let's clean up any existing duplicates:
DELETE t1 FROM `accplaytime` t1
INNER JOIN `accplaytime` t2 
WHERE t1.id > t2.id AND t1.`Name` = t2.`Name`;
