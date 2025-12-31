/*
 * Rosalife-2025 Anti-Cheat System - Minimale Version
 * Optimiert für Qawno Compiler
 */

// Forward-Deklarationen
forward OnPlayerCheatDetected(playerid, cheat_type[]);
forward AntiCheat_Initialize();

// Cheat-Typen
enum CHEAT_TYPES {
    CHEAT_WEAPON_HACK = 1,
    CHEAT_MONEY_HACK = 2,
    CHEAT_HEALTH_HACK = 3,
    CHEAT_SPEED_HACK = 4,
    CHEAT_TELEPORT_HACK = 5
}

// Anti-Cheat Variablen
new PlayerLastPos[MAX_PLAYERS][3];
new PlayerLastHealth[MAX_PLAYERS];
new PlayerLastMoney[MAX_PLAYERS];
new PlayerLastUpdate[MAX_PLAYERS];
new PlayerSpeedWarnings[MAX_PLAYERS];
new PlayerTeleportWarnings[MAX_PLAYERS];

// Konfiguration
#define MAX_SPEED_WARNINGS 2
#define MAX_TELEPORT_WARNINGS 2
#define TELEPORT_DISTANCE_THRESHOLD 150.0
#define SPEED_LIMIT_THRESHOLD 200.0
#define MONEY_CHANGE_THRESHOLD 30000

// Anti-Cheat Initialisierung
stock AntiCheat_Initialize()
{
    print("[ANTI-CHEAT] Minimal Anti-Cheat System aktiv");
    SetTimer("AntiCheat_UpdateAll", 2000, true);
    return 1;
}

// Spieler verbindet
stock AntiCheat_PlayerConnect(playerid)
{
    GetPlayerPos(playerid, PlayerLastPos[playerid][0], PlayerLastPos[playerid][1], PlayerLastPos[playerid][2]);
    PlayerLastHealth[playerid] = GetPlayerHealth(playerid);
    PlayerLastMoney[playerid] = GetPlayerMoney(playerid);
    PlayerLastUpdate[playerid] = gettime();
    PlayerSpeedWarnings[playerid] = 0;
    PlayerTeleportWarnings[playerid] = 0;
    return 1;
}

// Spieler trennt sich
stock AntiCheat_PlayerDisconnect(playerid)
{
    PlayerLastPos[playerid][0] = 0.0;
    PlayerLastPos[playerid][1] = 0.0;
    PlayerLastPos[playerid][2] = 0.0;
    PlayerLastHealth[playerid] = 0.0;
    PlayerLastMoney[playerid] = 0.0;
    PlayerLastUpdate[playerid] = 0;
    PlayerSpeedWarnings[playerid] = 0;
    PlayerTeleportWarnings[playerid] = 0;
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

// Spieler-Update
stock AntiCheat_PlayerUpdate(playerid)
{
    if(!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) return 0;
    
    if(SpielerInfo[playerid][sAdmin] > 0) return 0;
    
    new currentTime = gettime();
    new Float:posX, Float:posY, Float:posZ;
    new Float:health;
    new money;
    
    GetPlayerPos(playerid, posX, posY, posZ);
    health = GetPlayerHealth(playerid);
    money = GetPlayerMoney(playerid);
    
    // Health Hack prüfen
    if(health > PlayerLastHealth[playerid] + 30.0)
    {
        if(currentTime - PlayerLastUpdate[playerid] < 3)
        {
            OnPlayerCheatDetected(playerid, "Health Hack");
            Kick(playerid);
            return 1;
        }
    }
    
    // Money Hack prüfen
    new moneyDiff = money - PlayerLastMoney[playerid];
    if(abs(moneyDiff) > MONEY_CHANGE_THRESHOLD)
    {
        OnPlayerCheatDetected(playerid, "Money Hack");
        Ban(playerid);
        return 1;
    }
    
    // Speed/Teleport Hack prüfen
    if(!IsPlayerInAnyVehicle(playerid))
    {
        new Float:distance = GetDistanceBetweenPoints(
            PlayerLastPos[playerid][0], PlayerLastPos[playerid][1], PlayerLastPos[playerid][2],
            posX, posY, posZ
        );
        
        new timeDiff = currentTime - PlayerLastUpdate[playerid];
        if(timeDiff <= 0) timeDiff = 1;
        
        new Float:speed = (distance / timeDiff) * 1000.0;
        
        if(speed > SPEED_LIMIT_THRESHOLD)
        {
            PlayerSpeedWarnings[playerid]++;
            if(PlayerSpeedWarnings[playerid] >= MAX_SPEED_WARNINGS)
            {
                OnPlayerCheatDetected(playerid, "Speed Hack");
                Kick(playerid);
                return 1;
            }
        }
        
        if(distance > TELEPORT_DISTANCE_THRESHOLD && timeDiff < 3)
        {
            PlayerTeleportWarnings[playerid]++;
            if(PlayerTeleportWarnings[playerid] >= MAX_TELEPORT_WARNINGS)
            {
                OnPlayerCheatDetected(playerid, "Teleport Hack");
                Kick(playerid);
                return 1;
            }
        }
    }
    
    // Werte für nächste Überprüfung speichern
    PlayerLastPos[playerid][0] = posX;
    PlayerLastPos[playerid][1] = posY;
    PlayerLastPos[playerid][2] = posZ;
    PlayerLastHealth[playerid] = health;
    PlayerLastMoney[playerid] = money;
    PlayerLastUpdate[playerid] = currentTime;
    
    return 1;
}

// Public Callbacks
public OnPlayerCheatDetected(playerid, cheat_type[])
{
    printf("[ANTI-CHEAT] Cheat erkannt: %s - Spieler: %s", 
            cheat_type, SpielerInfo[playerid][sName]);
    return 1;
}

// Admin-Befehle
CMD:anticheat(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)
    {
        SendClientMessage(playerid, COLOR_RED, "[ERROR] Admin Level 3 erforderlich!");
        return 1;
    }
    
    SendClientMessage(playerid, COLOR_BLUE, "=== ANTI-CHEAT SYSTEM ===");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_status - Zeigt Status");
    SendClientMessage(playerid, COLOR_WHITE, "/ac_reload - Lädt neu");
    return 1;
}

CMD:ac_status(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3) return 0;
    
    new msg[128];
    format(msg, sizeof(msg), "[ANTI-CHEAT] Status: Aktiv | Geschützt: %d Spieler", GetConnectedPlayers());
    SendClientMessage(playerid, COLOR_GREEN, msg);
    return 1;
}

CMD:ac_reload(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4) return 0;
    
    SendClientMessage(playerid, COLOR_BLUE, "[ANTI-CHEAT] System wird neu geladen...");
    AntiCheat_Initialize();
    SendClientMessage(playerid, COLOR_GREEN, "[ANTI-CHEAT] System neu geladen!");
    return 1;
}
