CMD:serverrestart(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt

    if(GMX_Data[restartActive]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Server wird aktuell bereits neugestartet (Zum Abbruch /cancelrestart).");

    new restart_minutes, string[128];
	if(sscanf(params,"i", restart_minutes))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/serverrestart [Minuten bis zum Neustart]");
    if(restart_minutes < 3 || restart_minutes > 15)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/serverrestart [Minuten bis zum Neustart (3 - 15 Minuten)]");
    SetPVarInt(playerid, "GMX_MINUTES", restart_minutes);

    format(string, sizeof(string), "Möchtest du den Server wirklich in %i Minuten neustarten?", restart_minutes);

    ShowPlayerDialog(playerid, DIALOG_ADMIN_GMX, DIALOG_STYLE_MSGBOX, "{164863}redv-reallife.de: {FFFFFF}Server Restart", string, "Bestätigen", "Abbrechen");
    return 1;
}

CMD:cancelrestart(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt

    if(!GMX_Data[restartActive]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Server wird aktuell nicht neugestartet (Zum Neustart /serverrestart).");

    new string[100];

    format(string, sizeof(string), "Möchtest du den Server Neustart in %i von %i Minuten abbrechen?", GMX_Data[pendingRestartTime], GMX_Data[restartTime]);

    ShowPlayerDialog(playerid, DIALOG_ADMIN_GMX_CANCEL, DIALOG_STYLE_MSGBOX, "{164863}redv-reallife.de: {FFFFFF}Server Restart", string, "Bestätigen", "Schließen");
    return 1;
}