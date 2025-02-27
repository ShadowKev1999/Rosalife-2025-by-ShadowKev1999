COMMAND:playroom(playerid, params[]) {

    if(!IsPlayerInRangeOfPoint(playerid, 7.5, playroomBarCoords[0][0], playroomBarCoords[0][1], playroomBarCoords[0][2])) {
        return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du befindest dich nicht an der Playroom Beach Bar in Los Santos (/navi).");
    }
    if(BeachRadioBlocker > gettime()) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Befehl kann nur alle 30 Sekunden aufgerufen werden.");
    OpenBeachRadios(playerid);
    return 1;
}