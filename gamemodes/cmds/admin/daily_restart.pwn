/*
 * Rosalife 2025 - Taeglicher Neustart Admin-Befehle
 * Erstellt von ShadowKev1999
 */

// Befehl zum manuellen Ausloesen des taeglichen Neustarts
cmd:dailyrestart(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt
    
    if(DailyRestartActive)
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Der taegliche Neustart ist bereits aktiv!");
        return 1;
    }
    
    new string[128];
    format(string, sizeof(string), "{FFFF00}Moechtest du den taeglichen Neustart jetzt manuell ausloesen?\n\n{FFFFFF}Der Server wird in 2 Minuten neugestartet.");
    ShowPlayerDialog(playerid, DIALOG_ADMIN_DAILY_RESTART, DIALOG_STYLE_MSGBOX, "{164863}redv-reallife.de: {FFFFFF}Taeglicher Neustart", string, "Ausloesen", "Abbrechen");
    return 1;
}

// Befehl zum Abbrechen des taeglichen Neustarts
cmd:canceldailyrestart(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt
    
    if(!DailyRestartActive)
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Der taegliche Neustart ist aktuell nicht aktiv!");
        return 1;
    }
    
    if(!GMX_Data[restartActive])
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Es laeuft aktuell kein Neustart!");
        return 1;
    }
    
    // Neustart abbrechen
    GMX_Data[restartActive] = false;
    GMX_Data[restartTime] = 0;
    GMX_Data[pendingRestartTime] = 0;
    format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "NIEMAND");
    KillTimer(_:GMX_Data[restartTimer]);
    
    // Daily Restart Flag zuruecksetzen
    DailyRestartActive = false;
    
    SendClientMessageToAll(-1, "{FF8080}{FFFF00}TAEGLICHER RESTART: {FFFFFF}%s hat den taeglichen Neustart abgebrochen. Du kannst nun deine Taetigkeit fortsetzen!", GetName(playerid));
    return 1;
}

// Debug-Befehl um den Status zu pruefen
cmd:dailyrestartstatus(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt
    
    new string[256], hour, minute, second;
    gettime(hour, minute, second);
    
    format(string, sizeof(string), "DailyRestartActive: %s\nZeit: %02d:%02d:%02d\nZielzeit: %02d:00:00", 
        DailyRestartActive ? "JA" : "NEIN",
        hour, minute, second,
        DailyRestartHour);
        
    SendClientMessage(playerid, -1, string);
    return 1;
}

// Debug-Befehl um die Neustart-Zeit zu aendern
cmd:setdailyrestarttime(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt
    
    new time;
    if(sscanf(params, "i", time)) return SendUsage(playerid, "/setdailyrestarttime [Stunde (0-23)]");
    
    if(time < 0 || time > 23) return SendError(playerid, "Bitte eine Stunde zwischen 0 und 23 angeben.");
    
    DailyRestartHour = time;
    
    new string[128];
    format(string, sizeof(string), "Taegliche Neustart-Zeit auf %02d:00 Uhr gesetzt.", DailyRestartHour);
    SendClientMessage(playerid, -1, string);
    return 1;
}
