CMD:createpartei(playerid, params[]) {
    if(!IsPlayerAtPickupByType(playerid, 5.0, PICKUP_TYPE_CREATEPARTIE)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Eine Partei kann nur in der Stadthalle in Los Santos gegr�ndet werden.");
    if(GetPVarInt(playerid, "PARTIE_TIMESTAMP") > gettime()) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Derzeit kannst du keine Partei gr�nden.");
    
    new string[1028];
    strcat(string, "Herzlich Willkommen in der Stadthalle Los Santos!\n");
    strcat(string, "Hier hast du die M�glichkeit durch die Gr�ndung deiner eigenen Partei\n");
    strcat(string, "in die Politik in San Andreas einzusteigen. Die Gr�ndung einer Partei kostet "#PARTIE_COSTS"$.\n");
    strcat(string, "Dazu kannst du eine Partei nur mit Hilfe eines weiteren Spielers gr�nden. Nachdem deine Partei\n");
    strcat(string, "gestaltet worden ist, hast du die M�glichkeit an den Wahlen der Regierung teilnehmen.\n\n");
    strcat(string, "Wurdest du �berzeugt? Dann kannst du jetzt mit der Gr�ndung deiner eigenen Partei beginnen.");
    ShowPlayerDialog(playerid, DIALOG_CREATE_PARTIE, DIALOG_STYLE_MSGBOX, "{CC33FF}redv-reallife.de: {FFFFFF}Partei erstellen", string, "Best�tigen", "Abbrechen");
    return 1;
}