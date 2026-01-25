/*
 * Rosalife-2025 Database Setup System
 * Erstellt und berprft automatisch alle Datenbanktabellen
 */

// Forward declarations
forward Database_Initialize();
forward Database_CheckTables();
forward Database_CreateTables();
forward Database_VerifyTables();
forward Database_CreateAdminAccount();
forward Database_SetupComplete();
forward Database_OnTableCreated(table_index, table_name[]);
forward Database_OnDefaultDataInserted(data_type[]);
forward Database_CheckAdminAccount();
forward Database_OnAdminAccountCreated();
forward Database_OnTableChecked(table_name[]);

// Tabellen-Definitionen
static const DatabaseTables[][][] = {
    // Haupttabellen
    {"accounts", 
        "CREATE TABLE IF NOT EXISTS `accounts` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(24) NOT NULL,\
         `Passwort` varchar(255) NOT NULL,\
         `Connected` timestamp NOT NULL DEFAULT current_timestamp(),\
         `ConnectIP` varchar(45) DEFAULT NULL,\
         `ConnectGMX` int(11) NOT NULL DEFAULT 0,\
         `Registerdatum` varchar(32) DEFAULT NULL,\
         `EMail` varchar(128) DEFAULT NULL,\
         `IP-Adresse` varchar(45) DEFAULT NULL,\
         `Sicherheitscode` varchar(64) DEFAULT NULL,\
         `Alter` int(11) DEFAULT NULL,\
         `Geschlecht` int(11) NOT NULL DEFAULT 0,\
         `Geburtsdatum` varchar(18) DEFAULT NULL,\
         `Online` int(11) NOT NULL DEFAULT 0,\
         `Admin` int(11) NOT NULL DEFAULT 0,\
         `FV` int(11) NOT NULL DEFAULT 0,\
         `PositionX` double NOT NULL DEFAULT 0,\
         `PositionY` double NOT NULL DEFAULT 0,\
         `PositionZ` double NOT NULL DEFAULT 0,\
         `PositionA` double NOT NULL DEFAULT 0,\
         `Interior` int(11) NOT NULL DEFAULT 0,\
         `VirtualWorld` int(11) NOT NULL DEFAULT 0,\
         `Tot_Y` double NOT NULL DEFAULT 0,\
         `Tot_Z` double NOT NULL DEFAULT 0,\
         `SkinID` int(11) NOT NULL DEFAULT 26,\
         `KnastSkin` int(11) NOT NULL DEFAULT 62,\
         `Stadt` int(11) NOT NULL DEFAULT 1,\
         `Spawn` int(11) NOT NULL DEFAULT 0,\
         `Fraktion` int(11) NOT NULL DEFAULT 0,\
         `Leader` int(11) NOT NULL DEFAULT 0,\
         `Rank` int(11) NOT NULL DEFAULT 0,\
         `lVerbrechen` text DEFAULT NULL,\
         `Wanteds` int(11) NOT NULL DEFAULT 0,\
         `Knastzeit` int(11) NOT NULL DEFAULT 0,\
         `Prison` int(11) NOT NULL DEFAULT 0,\
         `PrisonCP` int(11) NOT NULL DEFAULT 0,\
         `Zelle` int(11) NOT NULL DEFAULT 0,\
         `EXP` int(11) NOT NULL DEFAULT 0,\
         `EXPNeeded` int(11) NOT NULL DEFAULT 400,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `Verwarnungen` int(11) NOT NULL DEFAULT 0,\
         `Mutezeit` int(11) NOT NULL DEFAULT 0,\
         `Badword` int(11) NOT NULL DEFAULT 0,\
         `Bargeld` bigint(20) NOT NULL DEFAULT 3000,\
         `AntiCheatGMX` int(11) NOT NULL DEFAULT 0,\
         `Perso` int(11) NOT NULL DEFAULT 0,\
         `Mission` int(11) NOT NULL DEFAULT 0,\
         `MissionComplete` int(11) NOT NULL DEFAULT 0,\
         `Startbonus` int(11) NOT NULL DEFAULT 0,\
         `BankPIN` int(11) NOT NULL DEFAULT 0,\
         `Bankkonto` bigint(20) NOT NULL DEFAULT 0,\
         `Tankstelle` int(11) NOT NULL DEFAULT 0,\
         `Ammunation` int(11) NOT NULL DEFAULT 0,\
         `Store` int(11) NOT NULL DEFAULT 0,\
         `Haus` int(11) NOT NULL DEFAULT 0,\
         `Gruppenhaus` int(11) NOT NULL DEFAULT 0,\
         `Mieter` int(11) NOT NULL DEFAULT 0,\
         `Nebenjob` int(11) NOT NULL DEFAULT 0,\
         `JobDuty` int(11) NOT NULL DEFAULT 0,\
         `Stadtplan` int(11) NOT NULL DEFAULT 0,\
         `Navi` int(11) NOT NULL DEFAULT 0,\
         `Handy` int(11) NOT NULL DEFAULT 0,\
         `HandyNummer` int(11) NOT NULL DEFAULT 0,\
         `HandyGuthaben` int(11) NOT NULL DEFAULT 0,\
         `Tutorial` int(11) NOT NULL DEFAULT 0,\
         `ZweitKey` int(11) NOT NULL DEFAULT 0,\
         `FischGewicht` int(11) NOT NULL DEFAULT 0,\
         `VIP` int(11) NOT NULL DEFAULT 0,\
         `VIPExpire` int(11) NOT NULL DEFAULT 0,\
         `PlayTime` int(11) NOT NULL DEFAULT 0,\
         `LastLogin` varchar(32) DEFAULT NULL,\
         `wpSlot1` int(11) NOT NULL DEFAULT 0,\
         `wpSlot2` int(11) NOT NULL DEFAULT 0,\
         `wpSlot3` int(11) NOT NULL DEFAULT 0,\
         `wpSlot4` int(11) NOT NULL DEFAULT 0,\
         `wpSlot5` int(11) NOT NULL DEFAULT 0,\
         `wpSlot6` int(11) NOT NULL DEFAULT 0,\
         `wpSlot7` int(11) NOT NULL DEFAULT 0,\
         `wpSlot8` int(11) NOT NULL DEFAULT 0,\
         `wpSlot9` int(11) NOT NULL DEFAULT 0,\
         `wpSlot10` int(11) NOT NULL DEFAULT 0,\
         `wpSlot11` int(11) NOT NULL DEFAULT 0,\
         `wpSlot12` int(11) NOT NULL DEFAULT 0,\
         `wpSlot1Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot2Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot3Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot4Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot5Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot6Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot7Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot8Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot9Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot10Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot11Ammu` int(11) NOT NULL DEFAULT 0,\
         `wpSlot12Ammu` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name` (`Name`),\
         KEY `Online` (`Online`),\
         KEY `Fraktion` (`Fraktion`),\
         KEY `Admin` (`Admin`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"vehicles",
        "CREATE TABLE IF NOT EXISTS `vehicles` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `ModelID` int(11) NOT NULL DEFAULT 411,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `PositionX` double NOT NULL DEFAULT 0,\
         `PositionY` double NOT NULL DEFAULT 0,\
         `PositionZ` double NOT NULL DEFAULT 0,\
         `PositionA` double NOT NULL DEFAULT 0,\
         `Farbe1` int(11) NOT NULL DEFAULT 1,\
         `Farbe2` int(11) NOT NULL DEFAULT 1,\
         `Paintjob` int(11) NOT NULL DEFAULT -1,\
         `NeonFarbe` int(11) NOT NULL DEFAULT 0,\
         `Kennzeichen` varchar(12) NOT NULL DEFAULT 'ROSA2025',\
         `Abgeschleppt` int(11) NOT NULL DEFAULT 0,\
         `Parkkralle` int(11) NOT NULL DEFAULT 0,\
         `Kilometer` int(11) NOT NULL DEFAULT 0,\
         `Tank` float NOT NULL DEFAULT 100,\
         `Preis` int(11) NOT NULL DEFAULT 0,\
         `Garage` int(11) NOT NULL DEFAULT 0,\
         `GPark` int(11) NOT NULL DEFAULT 0,\
         `JobEXP` int(11) NOT NULL DEFAULT 0,\
         `Spoiler` int(11) NOT NULL DEFAULT 0,\
         `Hood` int(11) NOT NULL DEFAULT 0,\
         `Roof` int(11) NOT NULL DEFAULT 0,\
         `Sideskirt` int(11) NOT NULL DEFAULT 0,\
         `Lamps` int(11) NOT NULL DEFAULT 0,\
         `Nitro` int(11) NOT NULL DEFAULT 0,\
         `Exhaust` int(11) NOT NULL DEFAULT 0,\
         `Wheels` int(11) NOT NULL DEFAULT 0,\
         `Stereo` int(11) NOT NULL DEFAULT 0,\
         `Hydraulics` int(11) NOT NULL DEFAULT 0,\
         `Front Bumper` int(11) NOT NULL DEFAULT 0,\
         `Rear Bumper` int(11) NOT NULL DEFAULT 0,\
         `Vent Right` int(11) NOT NULL DEFAULT 0,\
         `Vent Left` int(11) NOT NULL DEFAULT 0,\
         `Panels` int(11) NOT NULL DEFAULT 0,\
         `Doors` int(11) NOT NULL DEFAULT 0,\
         `Lights` int(11) NOT NULL DEFAULT 0,\
         `Tires` int(11) NOT NULL DEFAULT 0,\
         `Geld` int(11) NOT NULL DEFAULT 0,\
         `Drogen` int(11) NOT NULL DEFAULT 0,\
         `upgradeRespawn` int(11) NOT NULL DEFAULT 0,\
         `Fraktion` int(11) NOT NULL DEFAULT 0,\
         `Gruppe` int(11) NOT NULL DEFAULT 0,\
         `Autohaus` int(11) NOT NULL DEFAULT 0,\
         `Nebenjob` int(11) NOT NULL DEFAULT 0,\
         `Fahrschule` int(11) NOT NULL DEFAULT 0,\
         `Rang` int(11) NOT NULL DEFAULT 0,\
         `TuningGemeldet` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         KEY `Besitzer` (`Besitzer`),\
         KEY `Fraktion` (`Fraktion`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"carinfos",
        "CREATE TABLE IF NOT EXISTS `carinfos` (\
         `ModelID` int(11) NOT NULL,\
         `TankArt` int(11) NOT NULL DEFAULT 1,\
         `Verbrauch` float NOT NULL DEFAULT 1.0,\
         `Liter` int(11) NOT NULL DEFAULT 50,\
         PRIMARY KEY (`ModelID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},

    {"player_jobskills",
        "CREATE TABLE IF NOT EXISTS `player_jobskills` (\
         `user_id` int(11) NOT NULL,\
         `jobId` int(11) NOT NULL,\
         `level` int(11) NOT NULL DEFAULT '0',\
         `amount` int(11) NOT NULL DEFAULT '0',\
         PRIMARY KEY (`user_id`, `jobId`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},

    {"accbans",
        "CREATE TABLE IF NOT EXISTS `accbans` (\
         `Name` varchar(24) NOT NULL,\
         `Teammitglied` varchar(24) NOT NULL,\
         `Bangrund` varchar(64) NOT NULL,\
         `Uhrzeit` varchar(16) NOT NULL,\
         `Datum` varchar(16) NOT NULL,\
         PRIMARY KEY (`Name`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},

    {"accplaytime",
        "CREATE TABLE IF NOT EXISTS `accplaytime` (\
         `Name` varchar(24) NOT NULL,\
         `PlayedTime` int(11) NOT NULL DEFAULT '0'\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},

    
    {"houses",
        "CREATE TABLE IF NOT EXISTS `houses` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Interior` int(11) NOT NULL DEFAULT 0,\
         `VirtualWorld` int(11) NOT NULL DEFAULT 0,\
         `Preis` int(11) NOT NULL DEFAULT 50000,\
         `Kasse` int(11) NOT NULL DEFAULT 0,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `Miete` int(11) NOT NULL DEFAULT 0,\
         `Mieter` varchar(24) DEFAULT NULL,\
         `Mietzeit` int(11) NOT NULL DEFAULT 0,\
         `Locked` int(11) NOT NULL DEFAULT 1,\
         `Storage` text DEFAULT NULL,\
         `Upgrade` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         KEY `Besitzer` (`Besitzer`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"businesses",
        "CREATE TABLE IF NOT EXISTS `businesses` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `Name` varchar(64) NOT NULL DEFAULT 'Geschft',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Interior` int(11) NOT NULL DEFAULT 0,\
         `VirtualWorld` int(11) NOT NULL DEFAULT 0,\
         `Preis` int(11) NOT NULL DEFAULT 100000,\
         `Kasse` int(11) NOT NULL DEFAULT 0,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `Typ` int(11) NOT NULL DEFAULT 0,\
         `Products` int(11) NOT NULL DEFAULT 100,\
         `MaxProducts` int(11) NOT NULL DEFAULT 500,\
         `Storage` text DEFAULT NULL,\
         PRIMARY KEY (`ID`),\
         KEY `Besitzer` (`Besitzer`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"garages",
        "CREATE TABLE IF NOT EXISTS `garages` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Preis` int(11) NOT NULL DEFAULT 25000,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `MaxVehicles` int(11) NOT NULL DEFAULT 2,\
         `Locked` int(11) NOT NULL DEFAULT 1,\
         PRIMARY KEY (`ID`),\
         KEY `Besitzer` (`Besitzer`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"groups",
        "CREATE TABLE IF NOT EXISTS `groups` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(64) NOT NULL,\
         `Leader` varchar(24) NOT NULL,\
         `Kasse` bigint(20) NOT NULL DEFAULT 0,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `MaxMembers` int(11) NOT NULL DEFAULT 10,\
         `Created` timestamp NOT NULL DEFAULT current_timestamp(),\
         PRIMARY KEY (`ID`),\
         KEY `Leader` (`Leader`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"group_members",
        "CREATE TABLE IF NOT EXISTS `group_members` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `GroupID` int(11) NOT NULL,\
         `Member` varchar(24) NOT NULL,\
         `Rank` int(11) NOT NULL DEFAULT 1,\
         `Joined` timestamp NOT NULL DEFAULT current_timestamp(),\
         PRIMARY KEY (`ID`),\
         KEY `GroupID` (`GroupID`),\
         KEY `Member` (`Member`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"licenses",
        "CREATE TABLE IF NOT EXISTS `licenses` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(24) NOT NULL,\
         `Auto` int(11) NOT NULL DEFAULT 0,\
         `Flug` int(11) NOT NULL DEFAULT 0,\
         `LKW` int(11) NOT NULL DEFAULT 0,\
         `Motorrad` int(11) NOT NULL DEFAULT 0,\
         `Boot` int(11) NOT NULL DEFAULT 0,\
         `Waffe` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name` (`Name`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"phone_contacts",
        "CREATE TABLE IF NOT EXISTS `phone_contacts` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Owner` varchar(24) NOT NULL,\
         `Name` varchar(32) NOT NULL,\
         `Number` int(11) NOT NULL,\
         PRIMARY KEY (`ID`),\
         KEY `Owner` (`Owner`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"phone_messages",
        "CREATE TABLE IF NOT EXISTS `phone_messages` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Sender` varchar(24) NOT NULL,\
         `Receiver` varchar(24) NOT NULL,\
         `Message` text NOT NULL,\
         `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),\
         `Read` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         KEY `Sender` (`Sender`),\
         KEY `Receiver` (`Receiver`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"items",
        "CREATE TABLE IF NOT EXISTS `items` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Owner` varchar(24) NOT NULL,\
         `ItemName` varchar(64) NOT NULL,\
         `ItemType` varchar(32) NOT NULL,\
         `Amount` int(11) NOT NULL DEFAULT 1,\
         `Value` int(11) NOT NULL DEFAULT 0,\
         `Data` text DEFAULT NULL,\
         PRIMARY KEY (`ID`),\
         KEY `Owner` (`Owner`),\
         KEY `ItemType` (`ItemType`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"job_stats",
        "CREATE TABLE IF NOT EXISTS `job_stats` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(24) NOT NULL,\
         `Job` int(11) NOT NULL,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `EXP` int(11) NOT NULL DEFAULT 0,\
         `TotalEarned` bigint(20) NOT NULL DEFAULT 0,\
         `JobsCompleted` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name_Job` (`Name`,`Job`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"atm_machines",
        "CREATE TABLE IF NOT EXISTS `atm_machines` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Health` int(11) NOT NULL DEFAULT 100,\
         `Defekt` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"speed_cameras",
        "CREATE TABLE IF NOT EXISTS `speed_cameras` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `SpeedLimit` int(11) NOT NULL DEFAULT 80,\
         `Fine` int(11) NOT NULL DEFAULT 500,\
         `Defekt` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"admin_logs",
        "CREATE TABLE IF NOT EXISTS `admin_logs` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Admin` varchar(24) NOT NULL,\
         `Action` varchar(64) NOT NULL,\
         `Target` varchar(24) DEFAULT NULL,\
         `Reason` varchar(128) DEFAULT NULL,\
         `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),\
         `IP` varchar(45) DEFAULT NULL,\
         PRIMARY KEY (`ID`),\
         KEY `Admin` (`Admin`),\
         KEY `Action` (`Action`),\
         KEY `Timestamp` (`Timestamp`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"server_stats",
        "CREATE TABLE IF NOT EXISTS `server_stats` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `StatName` varchar(64) NOT NULL,\
         `StatValue` bigint(20) NOT NULL DEFAULT 0,\
         `LastUpdated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `StatName` (`StatName`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"achievements",
        "CREATE TABLE IF NOT EXISTS `achievements` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(24) NOT NULL,\
         `AchievementID` varchar(64) NOT NULL,\
         `Description` varchar(128) NOT NULL,\
         `EXP` int(11) NOT NULL DEFAULT 0,\
         `Completed` timestamp NOT NULL DEFAULT current_timestamp(),\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name_AchievementID` (`Name`,`AchievementID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"faction_ranks",
        "CREATE TABLE IF NOT EXISTS `faction_ranks` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Fraktion` int(11) NOT NULL,\
         `Rank` int(11) NOT NULL,\
         `RankName` varchar(64) NOT NULL,\
         `Pay` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Fraktion_Rank` (`Fraktion`,`Rank`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"},
    
    {"faction_vehicles",
        "CREATE TABLE IF NOT EXISTS `faction_vehicles` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Fraktion` int(11) NOT NULL,\
         `Model` int(11) NOT NULL,\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `PosA` double NOT NULL DEFAULT 0,\
         `Color1` int(11) NOT NULL DEFAULT 0,\
         `Color2` int(11) NOT NULL DEFAULT 0,\
         `Plate` varchar(12) NOT NULL DEFAULT '',\
         `Health` float NOT NULL DEFAULT 1000,\
         `Fuel` float NOT NULL DEFAULT 100,\
         PRIMARY KEY (`ID`),\
         KEY `Fraktion` (`Fraktion`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci"}
};

static const RequiredTableCount = sizeof(DatabaseTables);

// Globale Variablen
new g_DatabaseTablesCreated = 0;
new g_DatabaseSetupComplete = false;

/*
 * Hauptfunktion - Initialisiert das Datenbank-Setup
 * Wird beim Serverstart aufgerufen
 */
public Database_Initialize()
{
    printf("[DATABASE] Starte Datenbank-Setup...");
    printf("[DATABASE] berprfe %d erforderliche Tabellen...", RequiredTableCount);
    
    // Timer fr asynchrone berprfung starten
    SetTimer("Database_CheckTables", 1000, false);
    return 1;
}

/*
 * berprft ob alle Tabellen existieren
 */
public Database_CheckTables()
{
    printf("[DATABASE] berprfe Tabellen-Existenz...");
    
    // Zhle vorhandene Tabellen
    mysql_tquery(sqlHandle, "SELECT COUNT(*) as table_count FROM information_schema.tables WHERE table_schema = DATABASE()", "Database_VerifyTables", "");
    return 1;
}

/*
 * berprft die Tabellen und erstellt fehlende
 */
public Database_VerifyTables()
{
    new rows;
    cache_get_row_count(rows);
    
    if(rows > 0)
    {
        new table_count;
        cache_get_value_name_int(0, "table_count", table_count);
        printf("[DATABASE] Gefunden: %d/%d Tabellen", table_count, RequiredTableCount);
        
        if(table_count >= RequiredTableCount)
        {
            printf("[DATABASE] Alle Tabellen vorhanden. Setup nicht erforderlich.");
            Database_SetupComplete();
            return 1;
        }
        else
        {
            printf("[DATABASE] %d Tabellen fehlen. Erstelle fehlende Tabellen...", RequiredTableCount - table_count);
            Database_CreateTables();
        }
    }
    else
    {
        printf("[DATABASE] Konnte Tabellen nicht berprfen. Erstelle alle Tabellen...");
        Database_CreateTables();
    }
    return 1;
}

/*
 * Erstellt alle Datenbanktabellen
 */
public Database_CreateTables()
{
    printf("[DATABASE] Erstelle Datenbanktabellen...");
    
    // Erstelle Tabellen nacheinander
    for(new i = 0; i < RequiredTableCount; i++)
    {
        new query[4096];
        format(query, sizeof(query), DatabaseTables[i][1]);
        
        printf("[DATABASE] Erstelle Tabelle: %s", DatabaseTables[i][0]);
        mysql_tquery(sqlHandle, query, "Database_OnTableCreated", "ds", i, DatabaseTables[i][0]);
    }
    return 1;
}

/*
 * Callback nach Tabellen-Erstellung
 */
public Database_OnTableCreated(table_index, table_name[])
{
    g_DatabaseTablesCreated++;
    printf("[DATABASE] Tabelle '%s' erstellt (%d/%d)", table_name, g_DatabaseTablesCreated, RequiredTableCount);
    
    // Wenn alle Tabellen erstellt wurden
    if(g_DatabaseTablesCreated >= RequiredTableCount)
    {
        printf("[DATABASE] Alle Tabellen erfolgreich erstellt!");
        
        // Erstelle Standard-Daten
        Database_CreateDefaultData();
    }
    return 1;
}

/*
 * Erstellt Standard-Daten und Admin-Account
 */
Database_CreateDefaultData()
{
    printf("[DATABASE] Erstelle Standard-Daten...");
    
    // Server-Statistiken einfgen
    mysql_tquery(sqlHandle, 
        "INSERT IGNORE INTO `server_stats` (`StatName`, `StatValue`) VALUES \
         ('total_players', 0), \
         ('total_money', 0), \
         ('total_vehicles', 0), \
         ('total_houses', 0), \
         ('total_businesses', 0), \
         ('server_uptime', 0)",
        "Database_OnDefaultDataInserted", "s", "server_stats");
    
    // Fraktions-Rnge einfgen
    mysql_tquery(sqlHandle,
        "INSERT IGNORE INTO `faction_ranks` (`Fraktion`, `Rank`, `RankName`, `Pay`) VALUES \
         (1, 1, 'Anwrter', 100), (1, 2, 'Mitarbeiter', 200), (1, 3, 'Erfahrener Mitarbeiter', 300), \
         (1, 4, 'Abteilungsleiter', 400), (1, 5, 'Stellvertretender Leiter', 500), (1, 6, 'Leiter', 600), \
         (2, 1, 'Recruit', 200), (2, 2, 'Officer', 300), (2, 3, 'Sergeant', 400), \
         (2, 4, 'Lieutenant', 500), (2, 5, 'Captain', 600), (2, 6, 'Chief', 800)",
        "Database_OnDefaultDataInserted", "s", "faction_ranks");
    
    // Admin-Account erstellen (falls nicht vorhanden)
    Database_CreateAdminAccount();
    return 1;
}

/*
 * Callback nach Standard-Daten-Einfgung
 */
public Database_OnDefaultDataInserted(data_type[])
{
    printf("[DATABASE] Standard-Daten '%s' eingefgt", data_type);
    return 1;
}

/*
 * Erstellt den Admin-Account
 */
Database_CreateAdminAccount()
{
    printf("[DATABASE] Erstelle Admin-Account...");
    
    // berprfen ob Admin-Account bereits existiert
    mysql_tquery(sqlHandle, "SELECT ID FROM `accounts` WHERE Name = 'ShadowKev1999' LIMIT 1", "Database_CheckAdminAccount", "");
    return 1;
}

/*
 * berprft ob Admin-Account existiert
 */
public Database_CheckAdminAccount()
{
    new rows;
    cache_get_row_count(rows);
    
    if(rows == 0)
    {
        // Admin-Account nicht vorhanden - erstellen
        new query[512];
        
        format(query, sizeof(query), 
            "INSERT INTO `accounts` (`Name`, `Passwort`, `EMail`, `Admin`, `Level`, `Bargeld`, `Bankkonto`, `Perso`, `Registerdatum`) \
             VALUES ('ShadowKev1999', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin@rosalife2025.de', 5, 10, 100000, 500000, 1, NOW())");
        
        mysql_tquery(sqlHandle, query, "Database_OnAdminAccountCreated", "");
    }
    else
    {
        printf("[DATABASE] Admin-Account existiert bereits");
        Database_SetupComplete();
    }
    return 1;
}

/*
 * Callback nach Admin-Account-Erstellung
 */
public Database_OnAdminAccountCreated()
{
    printf("[DATABASE] Admin-Account 'ShadowKev1999' erstellt");
    printf("[DATABASE] Standard-Passwort: 'admin123' - BITTE NDERN!");
    Database_SetupComplete();
    return 1;
}

/*
 * Setup abgeschlossen
 */
Database_SetupComplete()
{
    Database_UpdateSchema();
    g_DatabaseSetupComplete = true;
    printf("[DATABASE] ==================================");
    printf("[DATABASE] Datenbank-Setup abgeschlossen!");
    printf("[DATABASE] ==================================");
    printf("[DATABASE] Alle Tabellen wurden berprft/erstellt");
    printf("[DATABASE] Standard-Daten wurden eingefgt");
    printf("[DATABASE] Admin-Account wurde vorbereitet");
    printf("[DATABASE] Server ist bereit fr den Betrieb");
    printf("[DATABASE] ==================================");
    
    // Server-weiten Broadcast senden
    SendClientMessageToAll(0x00FF00FF, "[SERVER] Datenbank-Setup abgeschlossen. Server ist bereit!");
    
    // Hier knnen weitere Initialisierungen folgen
    CallRemoteFunction("OnDatabaseSetupComplete", "");
    return 1;
}

/*
 * Aktualisiert das Datenbankschema (z.B. fehlende Spalten)
 */
Database_UpdateSchema()
{
    printf("[DATABASE] Prfe auf fehlende Spalten in 'accounts'...");
    mysql_tquery(sqlHandle, "SELECT count(*) as count FROM information_schema.columns WHERE table_schema = DATABASE() AND table_name = 'accounts' AND column_name = 'wpSlot1'", "Database_OnCheckSchema", "");
    return 1;
}

forward Database_OnCheckSchema();
public Database_OnCheckSchema()
{
    new rows;
    cache_get_row_count(rows);
    if(rows)
    {
        new count;
        cache_get_value_name_int(0, "count", count);
        if(count == 0)
        {
            printf("[DATABASE] Fge fehlende Waffenslots zu 'accounts' hinzu...");
            new query[2048];
            strcat(query, "ALTER TABLE `accounts` ");
            strcat(query, "ADD COLUMN `wpSlot1` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot2` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot3` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot4` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot5` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot6` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot7` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot8` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot9` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot10` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot11` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot12` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot1Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot2Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot3Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot4Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot5Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot6Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot7Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot8Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot9Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot10Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot11Ammu` int(11) NOT NULL DEFAULT 0, ");
            strcat(query, "ADD COLUMN `wpSlot12Ammu` int(11) NOT NULL DEFAULT 0");
            
            mysql_tquery(sqlHandle, query);
        }
    }
    return 1;
}

/*
 * berprft ob das Setup abgeschlossen ist
 * (kann von anderen Systemen verwendet werden)
 */
stock IsDatabaseSetupComplete()
{
    return g_DatabaseSetupComplete;
}

/*
 * Manuelles Setup-Trigger (fr Admin-Befehle)
 */
stock TriggerDatabaseSetup()
{
    if(g_DatabaseSetupComplete)
    {
        printf("[DATABASE] Setup bereits abgeschlossen");
        return 0;
    }
    
    printf("[DATABASE] Manuelles Setup gestartet...");
    Database_Initialize();
    return 1;
}

/*
 * berprft eine spezifische Tabelle
 */
stock CheckTableExists(const table_name[])
{
    new query[256];
    format(query, sizeof(query), "SELECT COUNT(*) as exists FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = '%s'", table_name);
    
    mysql_tquery(sqlHandle, query, "Database_OnTableChecked", "s", table_name);
    return 1;
}

/*
 * Callback fr Tabellen-berprfung
 */
public Database_OnTableChecked(table_name[])
{
    new rows;
    cache_get_row_count(rows);
    
    if(rows > 0)
    {
        new exists;
        cache_get_value_name_int(0, "exists", exists);
        printf("[DATABASE] Tabelle '%s': %s", table_name, exists ? "VORHANDEN" : "FEHLEND");
    }
    return 1;
}

/*
 * CMD:setupdb - Admin-Befehl fr manuelles Setup
 */
CMD:setupdb(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Du bentigst Admin Level 5 fr diesen Befehl!");
        return 1;
    }
    
    if(g_DatabaseSetupComplete)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "[INFO] Datenbank-Setup wurde bereits abgeschlossen.");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "[INFO] Starte Datenbank-Setup...");
    TriggerDatabaseSetup();
    
    SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS] Datenbank-Setup wurde gestartet. berprfe Server-Konsole fr Details.");
    return 1;
}

/*
 * CMD:checkdb - Admin-Befehl zur Tabellen-berprfung
 */
CMD:checkdb(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Du bentigst Admin Level 3 fr diesen Befehl!");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "[INFO] berprfe Datenbanktabellen...");
    
    // berprfe alle Tabellen
    for(new i = 0; i < RequiredTableCount; i++)
    {
        CheckTableExists(DatabaseTables[i][0]);
    }
    
    SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS] Tabellen-berprfung gestartet. berprfe Server-Konsole fr Ergebnisse.");
    return 1;
}
