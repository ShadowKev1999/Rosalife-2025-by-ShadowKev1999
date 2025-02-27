timer RestartServerTimer[60000]() {
    GMX_Data[pendingRestartTime] --;
    if(GMX_Data[pendingRestartTime] <= 0) {
        ServerRestartFolgt = 1;
        SendClientMessageToAll(-1, "{FF8080}SERVER-RESTART: {FFFFFF}Server wird neugestartet! Alle Daten werden nun gespeichert!");
		foreach(new i : Player) {
			if(IsPlayerNPC(i)) {
				KickPlayer(i,"Server Restart");
			} else {
			    SaveAccount(i);
	     		SavePlayerWeapons(i);
	  			SavePrivatCar(i);
                KickPlayer(i,"Server Restart");
  			}
		}
	    SaveFrakInfo();
    	SaveGangZones();
    	SaveDrogen();
    	SaveGruppen();
        SaveTankstellen();
        SaveAmmunations();
        SaveStores();
        SaveHauser();
        SaveGarage();
        SaveWerbetafel();
        SaveVehicles();

        stop GMX_Data[restartTimer];

        SetTimer("ServerRestart", 10000, false);
    } else {
        SendClientMessageToAll(-1, "{FF8080}SERVER-RESTART: {FFFFFF}Server wird in %i Minuten neugestartet (Teammitglied: %s)", GMX_Data[pendingRestartTime], GMX_Data[restartAdmin]);
    }
    return 1;
}

ServerRestart_OnDialogResponse(playerid, dialogid, response) {
    switch(dialogid) {
        case DIALOG_ADMIN_GMX: {
            if(!response) return 1;

            if(GMX_Data[restartActive]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Server wird aktuell bereits neugestartet (Zum Abbruch /cancelrestart).");
            new restart_time = GetPVarInt(playerid, "GMX_MINUTES");

            GMX_Data[restartActive] = true;
            GMX_Data[restartTime] = restart_time;
            GMX_Data[pendingRestartTime] = restart_time;
            format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "%s", GetName(playerid));

            GMX_Data[restartTimer] = repeat RestartServerTimer();

            SendClientMessageToAll(-1, "{FF8080}SERVER-RESTART: {FFFFFF}%s hat einen Serverneustart gestartet! Der Server startet in %i Minuten neu.", GetName(playerid), restart_time);
            SendClientMessageToAll(-1, "{FF8080}SERVER-RESTART: {FFFFFF}Beende sämtliche Tätigkeiten, damit dein Spielstand nicht verloren geht!");

            SendClientMessage(playerid, COLOR_YELLOW, "Um den Serverneustart abzubrechen, nutze /cancelrestart");

            DeletePVar(playerid, "GMX_MINUTES");
            return 1;
        }

        case DIALOG_ADMIN_GMX_CANCEL: {
            if(!response) return 1;

            if(!GMX_Data[restartActive]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Server wird aktuell nicht neugestartet (Zum Neustart /serverrestart).");

            GMX_Data[restartActive] = false;
            GMX_Data[restartTime] = 0;
            GMX_Data[pendingRestartTime] = 0;
            format(GMX_Data[restartAdmin], MAX_PLAYER_NAME, "NIEMAND");

            stop GMX_Data[restartTimer];

            SendClientMessageToAll(-1, "{FF8080}SERVER-RESTART: {FFFFFF}%s hat den Serverneustart abgebrochen. Du kannst nun deine Tätigkeit fortsetzen!", GetName(playerid));
            return 1;
        }
    }
    return 1;
}