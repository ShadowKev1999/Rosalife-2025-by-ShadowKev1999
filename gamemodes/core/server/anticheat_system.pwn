/*
 * Rosalife-2025 Anti-Cheat System
 * Umfassender Schutz gegen gängige Cheats und Hacks
 */

// Forward-Deklarationen
forward OnPlayerCheatDetected(playerid, cheat_type[], details[]);
forward OnPlayerPunished(playerid, reason[], punishment_type);
forward AntiCheat_Initialize();
forward AntiCheat_PlayerConnect(playerid);
forward AntiCheat_PlayerUpdate(playerid);
forward AntiCheat_PlayerDisconnect(playerid);

// Cheat-Typen
enum CHEAT_TYPES {
    CHEAT_WEAPON_HACK = 1,
    CHEAT_MONEY_HACK = 2,
    CHEAT_HEALTH_HACK = 3,
    CHEAT_ARMOR_HACK = 4,
    CHEAT_SPEED_HACK = 5,
    CHEAT_FLY_HACK = 6,
    CHEAT_TELEPORT_HACK = 7,
    CHEAT_AIMBOT = 8,
    CHEAT_CAR_HACK = 9,
    CHEAT_ADMIN_ABUSE = 10,
    CHEAT_SPAM_HACK = 11,
    CHEAT_BUG_ABUSE = 12
}

// Straf-Typen
enum PUNISHMENT_TYPES {
    PUNISHMENT_WARNING = 1,
    PUNISHMENT_KICK = 2,
    PUNISHMENT_BAN = 3,
    PUNISHMENT_JAIL = 4,
    PUNISHMENT_MONEY_RESET = 5
}

// Anti-Cheat Variablen
new PlayerLastPos[MAX_PLAYERS][3];
new PlayerLastHealth[MAX_PLAYERS];
new PlayerLastArmour[MAX_PLAYERS];
new PlayerLastMoney[MAX_PLAYERS];
new PlayerLastWeapon[MAX_PLAYERS];
new PlayerLastUpdate[MAX_PLAYERS];
new PlayerSpeedWarnings[MAX_PLAYERS];
new PlayerTeleportWarnings[MAX_PLAYERS];
new PlayerWeaponShots[MAX_PLAYERS];
new PlayerChatMessages[MAX_PLAYERS];
new PlayerLastChatTime[MAX_PLAYERS];
new PlayerJoinTime[MAX_PLAYERS];
new bool:PlayerSpectating[MAX_PLAYERS];
new PlayerVehicleEnterTime[MAX_PLAYERS];
new PlayerLastVehicle[MAX_PLAYERS];

// Konfiguration
#define MAX_SPEED_WARNINGS 3
#define MAX_TELEPORT_WARNINGS 2
#define MAX_CHAT_MESSAGES_PER_MINUTE 10
#define MAX_WEAPON_SHOTS_PER_SECOND 5
#define TELEPORT_DISTANCE_THRESHOLD 100.0
#define SPEED_LIMIT_THRESHOLD 250.0
#define HEALTH_REGEN_THRESHOLD 50.0
#define ARMOR_REGEN_THRESHOLD 30.0
#define MONEY_CHANGE_THRESHOLD 50000

// Anti-Cheat Initialisierung
stock AntiCheat_Initialize()
{
    print("[ANTI-CHEAT] Anti-Cheat System wird initialisiert...");
    
    // Timer für regelmäßige Überprüfungen
    SetTimer("AntiCheat_UpdateAll", 1000, true);
    
    print("[ANTI-CHEAT] Anti-Cheat System aktiv");
    return 1;
}

// Spieler verbindet
stock AntiCheat_PlayerConnect(playerid)
{
    // Variablen zurücksetzen
    ResetAntiCheatVars(playerid);
    
    // Join-Zeit speichern
    PlayerJoinTime[playerid] = gettime();
    
    // Anfangsposition speichern
    GetPlayerPos(playerid, PlayerLastPos[playerid][0], PlayerLastPos[playerid][1], PlayerLastPos[playerid][2]);
    PlayerLastHealth[playerid] = GetPlayerHealth(playerid);
    PlayerLastArmour[playerid] = GetPlayerArmour(playerid);
    PlayerLastMoney[playerid] = GetPlayerMoney(playerid);
    PlayerLastWeapon[playerid] = GetPlayerWeapon(playerid);
    PlayerLastUpdate[playerid] = gettime();
    
    printf("[ANTI-CHEAT] Spieler %s verbunden - Anti-Cheat aktiviert", SpielerInfo[playerid][sName]);
    return 1;
}

// Spieler trennt sich
stock AntiCheat_PlayerDisconnect(playerid)
{
    // Anti-Cheat-Status zurücksetzen
    ResetAntiCheatVars(playerid);
    
    printf("[ANTI-CHEAT] Spieler %s getrennt - Anti-Cheat deaktiviert", SpielerInfo[playerid][sName]);
    return 1;
}

// Anti-Cheat Variablen zurücksetzen
stock ResetAntiCheatVars(playerid)
{
    PlayerLastPos[playerid][0] = 0.0;
    PlayerLastPos[playerid][1] = 0.0;
    PlayerLastPos[playerid][2] = 0.0;
    PlayerLastHealth[playerid] = 0.0;
    PlayerLastArmour[playerid] = 0.0;
    PlayerLastMoney[playerid] = 0;
    PlayerLastWeapon[playerid] = 0;
    PlayerLastUpdate[playerid] = 0;
    PlayerSpeedWarnings[playerid] = 0;
    PlayerTeleportWarnings[playerid] = 0;
    PlayerWeaponShots[playerid] = 0;
    PlayerChatMessages[playerid] = 0;
    PlayerLastChatTime[playerid] = 0;
    PlayerSpectating[playerid] = false;
    PlayerVehicleEnterTime[playerid] = 0;
    PlayerLastVehicle[playerid] = 0;
    
    return 1;
}

// Regelmäßige Überprüfung aller Spieler
public AntiCheat_UpdateAll()
{
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(IsPlayerConnected(i) && !IsPlayerNPC(i))
        {
            AntiCheat_PlayerUpdate(i);
        }
    }
    return 1;
}

// Spieler-Update (wird jede Sekunde aufgerufen)
stock AntiCheat_PlayerUpdate(playerid)
{
    if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    
    new currentTime = gettime();
    new Float:posX, Float:posY, Float:posZ;
    new Float:health, Float:armour;
    new money, weapon;
    
    // Aktuelle Werte holen
    GetPlayerPos(playerid, posX, posY, posZ);
    health = GetPlayerHealth(playerid);
    armour = GetPlayerArmour(playerid);
    money = GetPlayerMoney(playerid);
    weapon = GetPlayerWeapon(playerid);
    
    // Health Hack prüfen
    CheckHealthHack(playerid, health, currentTime);
    
    // Armor Hack prüfen
    CheckArmorHack(playerid, armour, currentTime);
    
    // Money Hack prüfen
    CheckMoneyHack(playerid, money, currentTime);
    
    // Speed Hack prüfen
    CheckSpeedHack(playerid, posX, posY, posZ, currentTime);
    
    // Teleport Hack prüfen
    CheckTeleportHack(playerid, posX, posY, posZ, currentTime);
    
    // Weapon Hack prüfen
    CheckWeaponHack(playerid, weapon, currentTime);
    
    // Fahrzeug-Hack prüfen
    if(IsPlayerInAnyVehicle(playerid))
    {
        CheckVehicleHack(playerid);
    }
    
    // Werte für nächste Überprüfung speichern
    PlayerLastPos[playerid][0] = posX;
    PlayerLastPos[playerid][1] = posY;
    PlayerLastPos[playerid][2] = posZ;
    PlayerLastHealth[playerid] = health;
    PlayerLastArmour[playerid] = armour;
    PlayerLastMoney[playerid] = money;
    PlayerLastWeapon[playerid] = weapon;
    PlayerLastUpdate[playerid] = currentTime;
    
    return 1;
}

// Health Hack prüfen
stock CheckHealthHack(playerid, Float:health, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Health-Regeneration prüfen
    if(health > PlayerLastHealth[playerid] + HEALTH_REGEN_THRESHOLD)
    {
        if(currentTime - PlayerLastUpdate[playerid] < 2)
        {
            new details[128];
            format(details, sizeof(details), "Health: %.1f -> %.1f (Regen: %.1f)", 
                PlayerLastHealth[playerid], health, health - PlayerLastHealth[playerid]);
            
            OnPlayerCheatDetected(playerid, "Health Hack", details);
            PunishPlayer(playerid, "Health Hack", PUNISHMENT_KICK);
            return 1;
        }
    }
    
    return 0;
}

// Armor Hack prüfen
stock CheckArmorHack(playerid, Float:armour, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Armor-Regeneration prüfen
    if(armour > PlayerLastArmour[playerid] + ARMOR_REGEN_THRESHOLD)
    {
        if(currentTime - PlayerLastUpdate[playerid] < 2)
        {
            new details[128];
            format(details, sizeof(details), "Armor: %.1f -> %.1f (Regen: %.1f)", 
                PlayerLastArmour[playerid], armour, armour - PlayerLastArmour[playerid]);
            
            OnPlayerCheatDetected(playerid, "Armor Hack", details);
            PunishPlayer(playerid, "Armor Hack", PUNISHMENT_KICK);
            return 1;
        }
    }
    
    return 0;
}

// Money Hack prüfen
stock CheckMoneyHack(playerid, money, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Große Geldänderungen prüfen
    new moneyDiff = money - PlayerLastMoney[playerid];
    
    if(abs(moneyDiff) > MONEY_CHANGE_THRESHOLD)
    {
        new details[128];
        format(details, sizeof(details), "Money: %d -> %d (Differenz: %d)", 
                PlayerLastMoney[playerid], money, moneyDiff);
        
        OnPlayerCheatDetected(playerid, "Money Hack", details);
        PunishPlayer(playerid, "Money Hack", PUNISHMENT_BAN);
        return 1;
    }
    
    return 0;
}

// Speed Hack prüfen
stock CheckSpeedHack(playerid, Float:posX, Float:posY, Float:posZ, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Im Fahrzeug oder als Beifahrer ignorieren
    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return 0;
    
    // Distanz berechnen
    new Float:distance = GetDistanceBetweenPoints(
        PlayerLastPos[playerid][0], PlayerLastPos[playerid][1], PlayerLastPos[playerid][2],
        posX, posY, posZ
    );
    
    // Zeitdifferenz
    new timeDiff = currentTime - PlayerLastUpdate[playerid];
    if(timeDiff <= 0) timeDiff = 1;
    
    // Geschwindigkeit berechnen
    new Float:speed = (distance / timeDiff) * 1000.0; // m/s
    
    // Geschwindigkeitslimit prüfen
    if(speed > SPEED_LIMIT_THRESHOLD)
    {
        PlayerSpeedWarnings[playerid]++;
        
        new details[128];
        format(details, sizeof(details), "Speed: %.1f m/s (Limit: %.1f)", speed, SPEED_LIMIT_THRESHOLD);
        
        OnPlayerCheatDetected(playerid, "Speed Hack", details);
        
        if(PlayerSpeedWarnings[playerid] >= MAX_SPEED_WARNINGS)
        {
            PunishPlayer(playerid, "Speed Hack", PUNISHMENT_KICK);
        }
        else
        {
            new msg[128];
            format(msg, sizeof(msg), "[ANTI-CHEAT] Warnung: Geschwindigkeit zu hoch! (%d/%d)", 
                    PlayerSpeedWarnings[playerid], MAX_SPEED_WARNINGS);
            SendClientMessage(playerid, COLOR_RED, msg);
        }
        
        return 1;
    }
    
    return 0;
}

// Teleport Hack prüfen
stock CheckTeleportHack(playerid, Float:posX, Float:posY, Float:posZ, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Im Fahrzeug ignorieren
    if(IsPlayerInAnyVehicle(playerid)) return 0;
    
    // Distanz berechnen
    new Float:distance = GetDistanceBetweenPoints(
        PlayerLastPos[playerid][0], PlayerLastPos[playerid][1], PlayerLastPos[playerid][2],
        posX, posY, posZ
    );
    
    // Zeitdifferenz
    new timeDiff = currentTime - PlayerLastUpdate[playerid];
    if(timeDiff <= 0) timeDiff = 1;
    
    // Unmögliche Geschwindigkeit prüfen
    if(distance > TELEPORT_DISTANCE_THRESHOLD && timeDiff < 2)
    {
        PlayerTeleportWarnings[playerid]++;
        
        new details[128];
        format(details, sizeof(details), "Teleport: %.1f Einheiten in %d Sekunden", distance, timeDiff);
        
        OnPlayerCheatDetected(playerid, "Teleport Hack", details);
        
        if(PlayerTeleportWarnings[playerid] >= MAX_TELEPORT_WARNINGS)
        {
            PunishPlayer(playerid, "Teleport Hack", PUNISHMENT_KICK);
        }
        else
        {
            new msg[128];
            format(msg, sizeof(msg), "[ANTI-CHEAT] Warnung: Verdacht auf Teleport-Hack! (%d/%d)", 
                    PlayerTeleportWarnings[playerid], MAX_TELEPORT_WARNINGS);
            SendClientMessage(playerid, COLOR_RED, msg);
        }
        
        return 1;
    }
    
    return 0;
}

// Weapon Hack prüfen
stock CheckWeaponHack(playerid, weapon, currentTime)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    // Waffenwechsel prüfen
    if(weapon != PlayerLastWeapon[playerid])
    {
        // Erlaubte Waffen prüfen
        if(!IsValidWeapon(weapon))
        {
            new details[128];
            format(details, sizeof(details), "Invalid Weapon: %d", weapon);
            
            OnPlayerCheatDetected(playerid, "Weapon Hack", details);
            PunishPlayer(playerid, "Weapon Hack", PUNISHMENT_KICK);
            return 1;
        }
    }
    
    return 0;
}

// Fahrzeug-Hack prüfen
stock CheckVehicleHack(playerid)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    new vehicleid = GetPlayerVehicleID(playerid);
    
    // Fahrzeugwechsel prüfen
    if(vehicleid != PlayerLastVehicle[playerid])
    {
        // Prüfen ob Spieler im Fahrzeug ist
        if(!IsPlayerInVehicle(playerid))
        {
            new details[128];
            format(details, sizeof(details), "Vehicle ID: %d (Nicht im Fahrzeug)", vehicleid);
            
            OnPlayerCheatDetected(playerid, "Vehicle Hack", details);
            PunishPlayer(playerid, "Vehicle Hack", PUNISHMENT_KICK);
            return 1;
        }
    }
    
    PlayerLastVehicle[playerid] = vehicleid;
    return 0;
}

// Chat-Spam prüfen
stock CheckChatSpam(playerid)
{
    // Admins ausschließen
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    new currentTime = gettime();
    
    // Nachrichten pro Minute prüfen
    if(currentTime - PlayerLastChatTime[playerid] < 60)
    {
        PlayerChatMessages[playerid]++;
        
        if(PlayerChatMessages[playerid] > MAX_CHAT_MESSAGES_PER_MINUTE)
        {
            new details[128];
            format(details, sizeof(details), "Messages: %d in %d Sekunden", 
                    PlayerChatMessages[playerid], currentTime - PlayerLastChatTime[playerid]);
            
            OnPlayerCheatDetected(playerid, "Chat Spam", details);
            PunishPlayer(playerid, "Chat Spam", PUNISHMENT_KICK);
            return 1;
        }
    }
    else
    {
        PlayerChatMessages[playerid] = 0;
    }
    
    PlayerLastChatTime[playerid] = currentTime;
    return 0;
}

// Waffe auf Gültigkeit prüfen
stock IsValidWeapon(weaponid)
{
    // Erlaubte Waffen-IDs
    switch(weaponid)
    {
        case 0..46: return true; // Gültige Waffen
        default: return false;
    }
}

// Spieler bestrafen
stock PunishPlayer(playerid, reason[], punishment_type)
{
    new msg[256];
    new details[256];
    
    switch(punishment_type)
    {
        case PUNISHMENT_WARNING:
        {
            format(msg, sizeof(msg), "[ANTI-CHEAT] Warnung: %s", reason);
            SendClientMessage(playerid, COLOR_YELLOW, msg);
            
            // Loggen
            format(details, sizeof(details), "WARNING: %s - Spieler: %s", reason, SpielerInfo[playerid][sName]);
            LogCheatIncident(playerid, reason, "WARNING");
        }
        
        case PUNISHMENT_KICK:
        {
            format(msg, sizeof(msg), "[ANTI-CHEAT] Gekickt wegen: %s", reason);
            SendClientMessage(playerid, COLOR_RED, msg);
            SendClientMessageToAll(COLOR_RED, sprintf("[ANTI-CHEAT] %s wurde gekickt (Grund: %s)", SpielerInfo[playerid][sName], reason));
            
            // Loggen
            format(details, sizeof(details), "KICK: %s - Spieler: %s", reason, SpielerInfo[playerid][sName]);
            LogCheatIncident(playerid, reason, "KICK");
            
            // Spieler kicken
            SetTimerEx("DelayedKick", 1000, false, "i", playerid);
        }
        
        case PUNISHMENT_BAN:
        {
            format(msg, sizeof(msg), "[ANTI-CHEAT] Gebannt wegen: %s", reason);
            SendClientMessage(playerid, COLOR_RED, msg);
            SendClientMessageToAll(COLOR_RED, sprintf("[ANTI-CHEAT] %s wurde gebannt (Grund: %s)", SpielerInfo[playerid][sName], reason));
            
            // Loggen
            format(details, sizeof(details), "BAN: %s - Spieler: %s", reason, SpielerInfo[playerid][sName]);
            LogCheatIncident(playerid, reason, "BAN");
            
            // Spieler bannen
            Ban(playerid);
        }
        
        case PUNISHMENT_JAIL:
        {
            format(msg, sizeof(msg), "[ANTI-CHEAT] In den Knast gesteckt wegen: %s", reason);
            SendClientMessage(playerid, COLOR_RED, msg);
            
            // Loggen
            format(details, sizeof(details), "JAIL: %s - Spieler: %s", reason, SpielerInfo[playerid][sName]);
            LogCheatIncident(playerid, reason, "JAIL");
            
            // Spieler ins Gefängnis
            SpielerInfo[playerid][sKnastzeit] = 300; // 5 Minuten
        }
        
        case PUNISHMENT_MONEY_RESET:
        {
            ResetPlayerMoney(playerid);
            format(msg, sizeof(msg), "[ANTI-CHEAT] Geld zurückgesetzt wegen: %s", reason);
            SendClientMessage(playerid, COLOR_RED, msg);
            
            // Loggen
            format(details, sizeof(details), "MONEY_RESET: %s - Spieler: %s", reason, SpielerInfo[playerid][sName]);
            LogCheatIncident(playerid, reason, "MONEY_RESET");
        }
    }
    
    // Callback aufrufen
    OnPlayerPunished(playerid, reason, punishment_type);
    
    return 1;
}

// Verzögerter Kick
public DelayedKick(playerid)
{
    Kick(playerid);
    return 1;
}

// Cheat-Vorfall loggen
stock LogCheatIncident(playerid, reason[], action[])
{
    new query[512];
    mysql_format(g_SQLHandle, query, sizeof(query), 
        "INSERT INTO `anti_cheat_logs` (`player_name`, `reason`, `action`, `ip`, `timestamp`) \
         VALUES ('%e', '%s', '%s', '%s', NOW())",
        SpielerInfo[playerid][sName], reason, action, SpielerInfo[playerid][sIP]);
    
    mysql_tquery(g_SQLHandle, query);
    return 1;
}

// Public Callbacks
public OnPlayerCheatDetected(playerid, cheat_type[], details[])
{
    printf("[ANTI-CHEAT] Cheat erkannt: %s - Spieler: %s - Details: %s", 
            cheat_type, SpielerInfo[playerid][sName], details);
    return 1;
}

public OnPlayerPunished(playerid, reason[], punishment_type)
{
    printf("[ANTI-CHEAT] Spieler bestraft: %s - Grund: %s - Typ: %d", 
            SpielerInfo[playerid][sName], reason, punishment_type);
    return 1;
}

// Admin-Befehle für Anti-Cheat
CMD:anticheat(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Admin Level 3 erforderlich!");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "=== ANTI-CHEAT SYSTEM ===");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_status - Zeigt Anti-Cheat Status");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_logs - Zeigt Cheat-Logs");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_reload - Lädt Anti-Cheat neu");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_ban [player] - Bannt Spieler wegen Cheat");
    return 1;
}

CMD:ac_status(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3) return 0;
    
    new msg[256];
    format(msg, sizeof(msg), "[ANTI-CHEAT] Status: Aktiv | Geschützt: %d Spieler", GetConnectedPlayers());
    SendClientMessage(playerid, COLOR_GREEN, msg);
    
    return 1;
}

CMD:ac_logs(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4) return 0;
    
    SendClientMessage(playerid, COLOR_BLUE, "[ANTI-CHEAT] Letzte Cheat-Vorfälle:");
    
    // Letzte 10 Einträge aus Datenbank holen
    mysql_tquery(g_SQLHandle, 
        "SELECT * FROM `anti_cheat_logs` ORDER BY `timestamp` DESC LIMIT 10", 
        "OnAntiCheatLogsLoaded", "i", playerid);
    
    return 1;
}

public OnAntiCheatLogsLoaded(playerid)
{
    new rows, fields;
    cache_get_data(rows, fields, g_SQLHandle);
    
    if(rows == 0)
    {
        SendClientMessage(playerid, COLOR_WHITE, "Keine Cheat-Vorfälle gefunden.");
        return 1;
    }
    
    for(new i = 0; i < rows; i++)
    {
        new player_name[64], reason[128], action[64], timestamp[32];
        
        cache_get_field_content(i, "player_name", player_name, g_SQLHandle, sizeof(player_name));
        cache_get_field_content(i, "reason", reason, g_SQLHandle, sizeof(reason));
        cache_get_field_content(i, "action", action, g_SQLHandle, sizeof(action));
        cache_get_field_content(i, "timestamp", timestamp, g_SQLHandle, sizeof(timestamp));
        
        new msg[256];
        format(msg, sizeof(msg), "[%s] %s - %s (%s)", timestamp, player_name, reason, action);
        SendClientMessage(playerid, COLOR_YELLOW, msg);
    }
    
    return 1;
}

CMD:ac_ban(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return 0;
    
    new targetid, reason[64];
    if(sscanf(params, "us[64]", targetid, reason) != 2)
    {
        SendClientMessage(playerid, COLOR_WHITE, "NUTZE: /ac_ban [playerid] [grund]");
        return 1;
    }
    
    if(!IsPlayerConnected(targetid))
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Spieler nicht online!");
        return 1;
    }
    
    // Spieler bannen
    new msg[256];
    format(msg, sizeof(msg), "[ANTI-CHEAT] %s wurde von Admin %s wegen Cheat gebannt: %s", 
            SpielerInfo[targetid][sName], SpielerInfo[playerid][sName], reason);
    SendClientMessageToAll(COLOR_RED, msg);
    
    // Loggen
    LogCheatIncident(targetid, reason, "ADMIN_BAN");
    
    Ban(targetid);
    return 1;
}
