/*
 * Rosalife-2025 Simple Database Setup
 * Vereinfachte Version für schnelle Integration
 */

// Globale Variable
new bool:g_DatabaseReady = false;

/*
 * Einfache Datenbank-Initialisierung
 * Kann in OnGameModeInit() aufgerufen werden
 */
stock DatabaseSimple_Initialize()
{
    print("[DATABASE] Starte einfaches Datenbank-Setup...");
    
    // Überprüfe Haupttabelle
    mysql_tquery(g_SQLHandle, "SELECT 1 FROM `accounts` LIMIT 1", "DatabaseSimple_OnAccountsCheck", "");
    return 1;
}

/*
 * Überprüft ob die Haupttabelle existiert
 */
public DatabaseSimple_OnAccountsCheck()
{
    if(cache_num_rows() > 0)
    {
        print("[DATABASE] Haupttabelle gefunden - Überprüfe weitere Tabellen...");
        
        // Überprüfe wichtige Tabellen
        mysql_tquery(g_SQLHandle, 
            "SELECT COUNT(*) as count FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name IN ('vehicles', 'houses', 'businesses')", 
            "DatabaseSimple_OnTablesCheck", "");
    }
    else
    {
        print("[DATABASE] Haupttabelle nicht gefunden - Erstelle alle Tabellen...");
        DatabaseSimple_CreateAllTables();
    }
    return 1;
}

/*
 * Überprüft wichtige Tabellen
 */
public DatabaseSimple_OnTablesCheck()
{
    new count = cache_get_field_content_int(0, "count", g_SQLHandle);
    
    if(count >= 3)
    {
        print("[DATABASE] Wichtige Tabellen vorhanden - Setup abgeschlossen");
        DatabaseSimple_SetupComplete();
    }
    else
    {
        print("[DATABASE] Tabellen fehlen - Erstelle fehlende Tabellen...");
        DatabaseSimple_CreateAllTables();
    }
    return 1;
}

/*
 * Erstellt alle wichtigen Tabellen
 */
stock DatabaseSimple_CreateAllTables()
{
    print("[DATABASE] Erstelle Datenbankstruktur...");
    
    // Accounts Tabelle
    mysql_tquery(g_SQLHandle, 
        "CREATE TABLE IF NOT EXISTS `accounts` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Name` varchar(24) NOT NULL,\
         `Passwort` varchar(255) NOT NULL,\
         `Admin` int(11) NOT NULL DEFAULT 0,\
         `Level` int(11) NOT NULL DEFAULT 1,\
         `Bargeld` bigint(20) NOT NULL DEFAULT 3000,\
         `Bankkonto` bigint(20) NOT NULL DEFAULT 0,\
         `Fraktion` int(11) NOT NULL DEFAULT 0,\
         `Rank` int(11) NOT NULL DEFAULT 0,\
         `Perso` int(11) NOT NULL DEFAULT 0,\
         `Online` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name` (`Name`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "accounts");
    
    // Vehicles Tabelle
    mysql_tquery(g_SQLHandle,
        "CREATE TABLE IF NOT EXISTS `vehicles` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Model` int(11) NOT NULL DEFAULT 411,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `PosA` double NOT NULL DEFAULT 0,\
         `Color1` int(11) NOT NULL DEFAULT 1,\
         `Color2` int(11) NOT NULL DEFAULT 1,\
         `Health` float NOT NULL DEFAULT 1000,\
         `Fuel` float NOT NULL DEFAULT 100,\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "vehicles");
    
    // Houses Tabelle
    mysql_tquery(g_SQLHandle,
        "CREATE TABLE IF NOT EXISTS `houses` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Preis` int(11) NOT NULL DEFAULT 50000,\
         `Locked` int(11) NOT NULL DEFAULT 1,\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "houses");
    
    // Businesses Tabelle
    mysql_tquery(g_SQLHandle,
        "CREATE TABLE IF NOT EXISTS `businesses` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Besitzer` varchar(24) NOT NULL DEFAULT 'Server',\
         `Name` varchar(64) NOT NULL DEFAULT 'Geschäft',\
         `PosX` double NOT NULL DEFAULT 0,\
         `PosY` double NOT NULL DEFAULT 0,\
         `PosZ` double NOT NULL DEFAULT 0,\
         `Preis` int(11) NOT NULL DEFAULT 100000,\
         `Kasse` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "businesses");
    
    // Admin Logs Tabelle
    mysql_tquery(g_SQLHandle,
        "CREATE TABLE IF NOT EXISTS `admin_logs` (\
         `ID` int(11) NOT NULL AUTO_INCREMENT,\
         `Admin` varchar(24) NOT NULL,\
         `Action` varchar(64) NOT NULL,\
         `Target` varchar(24) DEFAULT NULL,\
         `Reason` varchar(128) DEFAULT NULL,\
         `Timestamp` timestamp NOT NULL DEFAULT current_timestamp(),\
         PRIMARY KEY (`ID`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "admin_logs");
    
    return 1;
}

/*
 * Callback nach Tabellen-Erstellung
 */
public DatabaseSimple_OnTableCreated(table_name[])
{
    printf("[DATABASE] Tabelle '%s' erstellt", table_name);
    
    // Überprüfe ob alle wichtigen Tabellen erstellt wurden
    static created_tables = 0;
    created_tables++;
    
    if(created_tables >= 5)
    {
        print("[DATABASE] Alle wichtigen Tabellen erstellt");
        DatabaseSimple_CreateAdminAccount();
    }
    return 1;
}

/*
 * Erstellt Admin-Account
 */
stock DatabaseSimple_CreateAdminAccount()
{
    print("[DATABASE] Erstelle Admin-Account...");
    
    mysql_tquery(g_SQLHandle, "SELECT ID FROM `accounts` WHERE Name = 'ShadowKev1999' LIMIT 1", "DatabaseSimple_CheckAdmin", "");
    return 1;
}

/*
 * Überprüft Admin-Account
 */
public DatabaseSimple_CheckAdmin()
{
    if(cache_num_rows() == 0)
    {
        // Admin-Account erstellen
        mysql_tquery(g_SQLHandle,
            "INSERT INTO `accounts` (`Name`, `Passwort`, `Admin`, `Level`, `Bargeld`, `Bankkonto`, `Perso`) \
             VALUES ('ShadowKev1999', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 5, 10, 100000, 500000, 1)",
            "DatabaseSimple_OnAdminCreated", "");
    }
    else
    {
        print("[DATABASE] Admin-Account existiert bereits");
        DatabaseSimple_SetupComplete();
    }
    return 1;
}

/*
 * Callback nach Admin-Erstellung
 */
public DatabaseSimple_OnAdminCreated()
{
    print("[DATABASE] Admin-Account 'ShadowKev1999' erstellt");
    print("[DATABASE] Passwort: admin123 (BITTE ÄNDERN!)");
    DatabaseSimple_SetupComplete();
    return 1;
}

/*
 * Setup abgeschlossen
 */
stock DatabaseSimple_SetupComplete()
{
    g_DatabaseReady = true;
    print("[DATABASE] ==================================");
    print("[DATABASE] Datenbank-Setup abgeschlossen!");
    print("[DATABASE] ==================================");
    print("[DATABASE] Server ist bereit für den Betrieb");
    print("[DATABASE] ==================================");
    
    // Callback für andere Systeme
    CallRemoteFunction("OnDatabaseSetupComplete", "");
    
    // Nachricht an alle Spieler
    SendClientMessageToAll(0x00FF00FF, "[SERVER] Datenbank-Setup abgeschlossen!");
    return 1;
}

/*
 * Überprüft ob Datenbank bereit ist
 */
stock IsDatabaseReady()
{
    return g_DatabaseReady;
}

/*
 * Manuelles Setup-Trigger
 */
stock TriggerDatabaseSetup()
{
    if(g_DatabaseReady)
    {
        print("[DATABASE] Setup bereits abgeschlossen");
        return 0;
    }
    
    print("[DATABASE] Manuelles Setup gestartet...");
    DatabaseSimple_Initialize();
    return 1;
}

/*
 * Einfache Tabellen-Überprüfung
 */
stock CheckDatabaseTables()
{
    print("[DATABASE] Überprüfe Tabellen...");
    
    mysql_tquery(g_SQLHandle, 
        "SHOW TABLES", 
        "DatabaseSimple_OnTablesList", "");
    return 1;
}

/*
 * Zeigt alle Tabellen an
 */
public DatabaseSimple_OnTablesList()
{
    new rows = cache_num_rows();
    printf("[DATABASE] Gefunden: %d Tabellen", rows);
    
    for(new i = 0; i < rows; i++)
    {
        new table_name[64];
        cache_get_field_content(i, "Tables_in_rosalife2025", table_name, g_SQLHandle, sizeof(table_name));
        printf("[DATABASE] - %s", table_name);
    }
    
    return 1;
}

/*
 * Admin-Befehl für Setup
 */
CMD:setupdb(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Du benötigst Admin Level 5!");
        return 1;
    }
    
    if(g_DatabaseReady)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "[INFO] Setup bereits abgeschlossen");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "[INFO] Starte Datenbank-Setup...");
    TriggerDatabaseSetup();
    
    SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS] Setup gestartet - siehe Konsole");
    return 1;
}

/*
 * Admin-Befehl für Tabellen-Überprüfung
 */
CMD:checkdb(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Du benötigst Admin Level 3!");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "[INFO] Überprüfe Datenbank...");
    CheckDatabaseTables();
    
    SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS] Überprüfung gestartet - siehe Konsole");
    return 1;
}
