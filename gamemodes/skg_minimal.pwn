#define SAMP_COMPAT
#include <open.mp>
#include <a_mysql>
#include <Pawn.CMD>
#include <sscanf2>
#include <streamer>
#include <colandreas>

// Grundlegende Defines
#undef MAX_PLAYERS
#define MAX_PLAYERS 100
#define COLOR_RED 0xFF0000FF
#define COLOR_GREEN 0x00FF00FF
#define COLOR_BLUE 0x0000FFFF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_WHITE 0xFFFFFFFF

// Globale Variablen
new MySQL:g_SQLHandle;
new bool:g_DatabaseReady = false;

// Spieler-Struktur (vereinfacht)
enum E_PLAYER_DATA
{
    sName[MAX_PLAYER_NAME],
    sAdmin,
    sLevel,
    sBargeld,
    sBankkonto,
    sFraktion,
    sRank,
    sOnline,
    sLoggedIn
}
new SpielerInfo[MAX_PLAYERS][E_PLAYER_DATA];

// Forward-Deklarationen
forward OnDatabaseSetupComplete();

// Hauptfunktion
main()
{
    print("\n=================================");
    print("  Rosalife-2025 Minimal Version");
    print("  Copyright (c) 2025 by ShadowKev1999");
    print("=================================\n");
}

// Gamemode-Initialisierung
public OnGameModeInit()
{
    print("[SERVER] Starte Rosalife-2025 Minimal Version...");
    
    // MySQL-Verbindung herstellen
    g_SQLHandle = mysql_connect("localhost", "root", "", "rosalife2025");
    
    if(mysql_errno(g_SQLHandle) == 0)
    {
        print("[DATABASE] Verbindung zur Datenbank erfolgreich");
        
        // Datenbank-Setup starten
        DatabaseSimple_Initialize();
    }
    else
    {
        printf("[DATABASE] Fehler bei der Verbindung: %s", mysql_error(g_SQLHandle));
    }
    
    // Grundlegende Server-Einstellungen
    SetGameModeText("Rosalife-2025");
    UsePlayerPedAnims();
    DisableInteriorEnterExits();
    EnableStuntBonusForAll(0);
    SetNameTagDrawDistance(50.0);
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_GLOBAL);
    
    print("[SERVER] Gamemode initialisiert");
    return 1;
}

// Gamemode-Exit
public OnGameModeExit()
{
    print("[SERVER] Gamemode wird beendet");
    
    // MySQL-Verbindung schlie?en
    if(g_SQLHandle) mysql_close(g_SQLHandle);
    
    return 1;
}

// Spieler verbindet
public OnPlayerConnect(playerid)
{
    // Spieler-Daten zur?cksetzen
    ResetPlayerData(playerid);
    
    // Spieler-Name speichern
    GetPlayerName(playerid, SpielerInfo[playerid][sName], MAX_PLAYER_NAME);
    
    printf("[PLAYER] %s hat den Server betreten", SpielerInfo[playerid][sName]);
    
    // Warten auf Datenbank-Setup
    if(!g_DatabaseReady)
    {
        SendClientMessage(playerid, COLOR_YELLOW, "[SERVER] Datenbank wird eingerichtet... Bitte warten.");
    }
    else
    {
        SendClientMessage(playerid, COLOR_GREEN, "[SERVER] Willkommen auf Rosalife-2025!");
        ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Login", "Bitte gib dein Passwort ein:", "Login", "Abbrechen");
    }
    
    return 1;
}

// Spieler trennt
public OnPlayerDisconnect(playerid, reason)
{
    if(SpielerInfo[playerid][sLoggedIn])
    {
        // Spieler speichern
        SavePlayerData(playerid);
        printf("[PLAYER] %s hat den Server verlassen", SpielerInfo[playerid][sName]);
    }
    
    // Spieler-Daten zur?cksetzen
    ResetPlayerData(playerid);
    
    return 1;
}

// Spieler-Dialog
public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(!g_DatabaseReady)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Datenbank noch nicht bereit!");
        return 1;
    }
    
    switch(dialogid)
    {
        case 1: // Login
        {
            if(!response) return Kick(playerid);
            
            // Login-?berpr?fung (vereinfacht)
            if(strlen(inputtext) > 0)
            {
                // Hier w?rde die Passwort-?berpr?fung stattfinden
                SpielerInfo[playerid][sLoggedIn] = 1;
                SpielerInfo[playerid][sLevel] = 1;
                SpielerInfo[playerid][sBargeld] = 3000;
                SpielerInfo[playerid][sBankkonto] = 0;
                
                SendClientMessage(playerid, COLOR_GREEN, "[LOGIN] Erfolgreich eingeloggt!");
                printf("[LOGIN] %s hat sich eingeloggt", SpielerInfo[playerid][sName]);
            }
            else
            {
                SendClientMessage(playerid, COLOR_RED, "[ERROR] Ung?ltiges Passwort!");
                ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Login", "Bitte gib dein Passwort ein:", "Login", "Abbrechen");
            }
        }
    }
    
    return 1;
}

// Spieler spawnen
public OnPlayerSpawn(playerid)
{
    if(!SpielerInfo[playerid][sLoggedIn])
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Bitte logge dich zuerst ein!");
        return 1;
    }
    
    // Spawn-Position setzen
    SetPlayerPos(playerid, 1529.6, -1691.2, 13.3);
    SetPlayerFacingAngle(playerid, 90.0);
    SetCameraBehindPlayer(playerid);
    
    return 1;
}

// Spieler-Text
public OnPlayerText(playerid, text[])
{
    if(!SpielerInfo[playerid][sLoggedIn])
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Bitte logge dich zuerst ein!");
        return 0;
    }
    
    // Chat-Format
    new string[144];
    format(string, sizeof(string), "[%d] %s: %s", SpielerInfo[playerid][sLevel], SpielerInfo[playerid][sName], text);
    SendClientMessageToAll(COLOR_WHITE, string);
    
    return 0;
}

// Spieler-Befehl
public OnPlayerCommandReceived(playerid, cmdtext[])
{
    if(!SpielerInfo[playerid][sLoggedIn])
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Bitte logge dich zuerst ein!");
        return 0;
    }
    
    return 1;
}

// Datenbank-Setup abgeschlossen
public OnDatabaseSetupComplete()
{
    g_DatabaseReady = true;
    print("[DATABASE] Setup abgeschlossen - Server ist bereit!");
    
    // Alle verbundenen Spieler benachrichtigen
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i))
        {
            SendClientMessage(i, COLOR_GREEN, "[SERVER] Datenbank-Setup abgeschlossen! Bitte relogge.");
        }
    }
    
    return 1;
}

// Hilfsfunktionen
stock ResetPlayerData(playerid)
{
    for(new i = 0; i < E_PLAYER_DATA; i++)
    {
        SpielerInfo[playerid][E_PLAYER_DATA:i] = 0;
    }
    SpielerInfo[playerid][sOnline] = 1;
}

stock SavePlayerData(playerid)
{
    if(!SpielerInfo[playerid][sLoggedIn]) return 0;
    
    // Hier w?rde die Speicherung in die Datenbank stattfinden
    printf("[SAVE] Spieler %s wurde gespeichert", SpielerInfo[playerid][sName]);
    return 1;
}

stock IsPlayerLoggedIn(playerid)
{
    return SpielerInfo[playerid][sLoggedIn];
}

stock GetPlayerAdminLevel(playerid)
{
    return SpielerInfo[playerid][sAdmin];
}

// Grundlegende Befehle
CMD:help(playerid, params[])
{
    SendClientMessage(playerid, COLOR_BLUE, "=== Rosalife-2025 Befehle ===");
    SendClientMessage(playerid, COLOR_WHITE, "/stats - Zeigt deine Statistiken");
    SendClientMessage(playerid, COLOR_WHITE, "/admins - Zeigt Online Admins");
    SendClientMessage(playerid, COLOR_WHITE, "/money - Zeigt dein Geld");
    return 1;
}

CMD:stats(playerid, params[])
{
    new string[256];
    format(string, sizeof(string), "=== STATISTIKEN ===\nName: %s\nLevel: %d\nGeld: $%d\nBank: $%d", 
        SpielerInfo[playerid][sName], 
        SpielerInfo[playerid][sLevel], 
        SpielerInfo[playerid][sBargeld], 
        SpielerInfo[playerid][sBankkonto]);
    
    ShowPlayerDialog(playerid, 2, DIALOG_STYLE_MSGBOX, "Statistiken", string, "OK", "");
    return 1;
}

CMD:admins(playerid, params[])
{
    SendClientMessage(playerid, COLOR_BLUE, "=== ONLINE ADMINS ===");
    
    new count = 0;
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && SpielerInfo[i][sAdmin] > 0)
        {
            new string[64];
            format(string, sizeof(string), "Admin: %s (Level %d)", SpielerInfo[i][sName], SpielerInfo[i][sAdmin]);
            SendClientMessage(playerid, COLOR_YELLOW, string);
            count++;
        }
    }
    
    if(count == 0)
    {
        SendClientMessage(playerid, COLOR_WHITE, "Keine Admins online");
    }
    
    return 1;
}

CMD:money(playerid, params[])
{
    new string[128];
    format(string, sizeof(string), "Geld: $%d | Bank: $%d", SpielerInfo[playerid][sBargeld], SpielerInfo[playerid][sBankkonto]);
    SendClientMessage(playerid, COLOR_GREEN, string);
    return 1;
}

CMD:setupdb(playerid, params[])
{
    if(!IsPlayerAdmin(playerid))
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Nur Admins k?nnen diesen Befehl verwenden!");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "[INFO] Starte Datenbank-Setup...");
    DatabaseSimple_Initialize();
    
    return 1;
}

// Database Simple Functions (vereinfacht)
stock DatabaseSimple_Initialize()
{
    print("[DATABASE] Starte einfaches Datenbank-Setup...");
    
    // Accounts Tabelle erstellen
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
         `Online` int(11) NOT NULL DEFAULT 0,\
         PRIMARY KEY (`ID`),\
         UNIQUE KEY `Name` (`Name`)\
         ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci",
        "DatabaseSimple_OnTableCreated", "s", "accounts");
    
    return 1;
}

public DatabaseSimple_OnTableCreated(table_name[])
{
    printf("[DATABASE] Tabelle '%s' erstellt", table_name);
    
    if(strcmp(table_name, "accounts") == 0)
    {
        print("[DATABASE] Setup abgeschlossen!");
        CallRemoteFunction("OnDatabaseSetupComplete", "");
    }
    
    return 1;
}

stock IsPlayerAdmin(playerid)
{
    return SpielerInfo[playerid][sAdmin] > 0;
}
