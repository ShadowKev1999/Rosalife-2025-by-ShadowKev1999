COMMAND:playertitle(playerid, params[]) {
    SendClientMessage(playerid, COLOR_ERRORTEXT, "Diese Funktion folgt im nächsten Update.");
    return 1;
}

COMMAND:giveplayertitle(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    SendClientMessage(playerid, COLOR_ERRORTEXT, "Diese Funktion folgt im nächsten Update.");
    return 1;
}