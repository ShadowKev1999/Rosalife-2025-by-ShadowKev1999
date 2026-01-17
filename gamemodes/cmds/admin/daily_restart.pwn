/*
 * Rosalife 2025 - Täglicher Neustart Admin-Befehle
 * Erstellt von ShadowKev1999
 */

// Befehl zum manuellen Auslösen des täglichen Neustarts
CMD:dailyrestart(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt;
    
    if(DailyRestartActive)
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Der tägliche Neustart ist bereits aktiv!");
        return 1;
    }
    
    new string[128];
    format(string, sizeof(string), "{FFFF00}Möchtest du den täglichen Neustart jetzt manuell auslösen?\n\n{FFFFFF}Der Server wird in 2 Minuten neugestartet.");
    ShowPlayerDialog(playerid, DIALOG_ADMIN_DAILY_RESTART, DIALOG_STYLE_MSGBOX, "{164863}redv-reallife.de: {FFFFFF}Täglicher Neustart", string, "Auslösen", "Abbrechen");
    return 1;
}

// Befehl zum Abbrechen des täglichen Neustarts
CMD:canceldailyrestart(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt;
    
    if(!DailyRestartActive)
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Der tägliche Neustart ist aktuell nicht aktiv!");
        return 1;
    }
    
    if(!GMX_Data[restartActive])
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Es läuft aktuell kein Neustart!");
        return 1;
    }
    
    // Neustart abbrechen
    GMX_Data[restartActive] = false;
    GMX_Data[restartTime] = 0;
    GMX_Data[pendingRestartTime] = 0;
    format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "NIEMAND");
    stop GMX_Data[restartTimer];
    
    // Daily Restart Flag zurücksetzen
    DailyRestartActive = false;
    
    SendClientMessageToAll(-1, "{FF8080}{FFFF00}TÄGLICHER RESTART: {FFFFFF}%s hat den täglichen Neustart abgebrochen. Du kannst nun deine Tätigkeit fortsetzen!", GetName(playerid));
    SendClientMessage(playerid, COLOR_GREEN, "[SUCCESS] Täglicher Neustart wurde erfolgreich abgebrochen!");
    
    return 1;
}

// Befehl zum Setzen der täglichen Neustart-Zeit
CMD:setdailyrestarttime(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 5) return NichtBerechtigt;
    
    new hour;
    if(sscanf(params, "i", hour))
    {
        SendClientMessage(playerid, COLOR_YELLOW, "Benutze: {FFFFFF}/setdailyrestarttime [Stunde (0-23)]");
        return 1;
    }
    
    if(hour < 0 || hour > 23)
    {
        SendClientMessage(playerid, COLOR_ERRORTEXT, "[ERROR] Ungültige Stunde! Bitte eine Zahl zwischen 0 und 23 eingeben.");
        return 1;
    }
    
    SetDailyRestartHour(hour);
    
    new string[128];
    format(string, sizeof(string), "{FFFF00}Täglicher Neustart wurde auf %02d:00 Uhr gesetzt.", hour);
    SendClientMessage(playerid, COLOR_GREEN, string);
    
    return 1;
}

// Befehl zum Anzeigen des täglichen Neustart-Status
CMD:dailyrestartstatus(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3) return NichtBerechtigt;
    
    new string[256];
    new hour, minute, second;
    gettime(hour, minute, second);
    
    format(string, sizeof(string), "{FFFF00}=== TÄGLICHER RESTART STATUS ===\n\n{FFFFFF}Aktuelle Zeit: %02d:%02d:%02d\nEingestellte Restart-Zeit: %02d:00 Uhr\nStatus: %s\n\n{FFFF00}Nächster automatischer Restart: %s", 
        hour, minute, second,
        GetDailyRestartHour(),
        DailyRestartActive ? "{FF0000}Aktiv" : "{00FF00}Inaktiv",
        DailyRestartActive ? "{FF0000}Jetzt läuft!" : "{00FF00}Morgen um eingestellter Zeit}"
    );
    
    ShowPlayerDialog(playerid, DIALOG_ADMIN_DAILY_RESTART_STATUS, DIALOG_STYLE_MSGBOX, "{164863}redv-reallife.de: {FFFFFF}Täglicher Neustart Status", string, "Schließen", "");
    
    return 1;
}
