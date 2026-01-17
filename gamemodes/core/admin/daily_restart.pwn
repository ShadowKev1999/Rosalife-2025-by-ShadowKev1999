/*
 * Rosalife 2025 - Täglicher automatischer Neustart um 5 Uhr
 * Erstellt von ShadowKev1999
 */

// Forward declarations
forward DailyRestartCheck();
forward DailyRestartExecute();

// Globale Variablen
new bool:DailyRestartActive = false;
new DailyRestartHour = 5; // 5 Uhr morgens

// Timer für tägliche Überprüfung (jede Minute)
task DailyRestartCheck[60000]()
{
    // Aktuelle Zeit holen
    new hour, minute, second;
    gettime(hour, minute, second);
    
    // Prüfen ob es 5:00 Uhr ist und der Neustart noch nicht aktiv ist
    if(hour == DailyRestartHour && minute == 0 && second == 0 && !DailyRestartActive)
    {
        DailyRestartActive = true;
        
        // Automatischen Neustart starten
        printf("[DAILY-RESTART] Täglicher Neustart um 05:00 Uhr wird gestartet!");
        
        // Nachricht an alle Spieler
        SendClientMessageToAll(-1, "{FF8080}{FFFF00}TÄGLICHER RESTART: {FFFFFF}Der Server wird täglich um 05:00 Uhr neugestartet!");
        SendClientMessageToAll(-1, "{FF8080}{FFFF00}TÄGLICHER RESTART: {FFFFFF}Alle Daten werden gespeichert. Der Server ist in 2 Minuten wieder erreichbar.");
        
        // Neustart mit 2 Minuten Vorwarnzeit
        GMX_Data[restartActive] = true;
        GMX_Data[restartTime] = 2;
        GMX_Data[pendingRestartTime] = 2;
        format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "System");
        
        // Neustart-Timer starten
        GMX_Data[restartTimer] = repeat RestartServerTimer();
        
        // Timer zurücksetzen nach 5 Minuten (um mehrfache Ausführung zu verhindern)
        SetTimer("ResetDailyRestartFlag", 300000, false);
    }
    
    return 1;
}

// Reset der DailyRestart Flag
forward ResetDailyRestartFlag();
public ResetDailyRestartFlag()
{
    DailyRestartActive = false;
    printf("[DAILY-RESTART] Daily Restart Flag wurde zurückgesetzt.");
    return 1;
}

// Manuelles Auslösen des täglichen Neustarts (für Admins)
stock TriggerDailyRestart()
{
    if(DailyRestartActive)
    {
        printf("[DAILY-RESTART] Täglicher Neustart ist bereits aktiv.");
        return 0;
    }
    
    DailyRestartActive = true;
    
    printf("[DAILY-RESTART] Manueller täglicher Neustart wurde ausgelöst!");
    
    // Nachricht an alle Spieler
    SendClientMessageToAll(-1, "{FF8080}{FFFF00}TÄGLICHER RESTART: {FFFFFF}Der Server wird jetzt neugestartet (manuell ausgelöst)!");
    SendClientMessageToAll(-1, "{FF8080}{FFFF00}TÄGLICHER RESTART: {FFFFFF}Alle Daten werden gespeichert. Der Server ist in 2 Minuten wieder erreichbar.");
    
    // Neustart mit 2 Minuten Vorwarnzeit
    GMX_Data[restartActive] = true;
    GMX_Data[restartTime] = 2;
    GMX_Data[pendingRestartTime] = 2;
    format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "System");
    
    // Neustart-Timer starten
    GMX_Data[restartTimer] = repeat RestartServerTimer();
    
    // Timer zurücksetzen nach 5 Minuten
    SetTimer("ResetDailyRestartFlag", 300000, false);
    
    return 1;
}

// Status des täglichen Neustarts abfragen
stock IsDailyRestartActive()
{
    return DailyRestartActive;
}

// Zeit des täglichen Neustarts setzen
stock SetDailyRestartHour(hour)
{
    if(hour < 0 || hour > 23)
    {
        printf("[DAILY-RESTART] Ungültige Stunde: %d (0-23 erlaubt)", hour);
        return 0;
    }
    
    DailyRestartHour = hour;
    printf("[DAILY-RESTART] Täglicher Neustart wurde auf %02d:00 Uhr gesetzt.", hour);
    return 1;
}

// Aktuelle Zeit des täglichen Neustarts abfragen
stock GetDailyRestartHour()
{
    return DailyRestartHour;
}
