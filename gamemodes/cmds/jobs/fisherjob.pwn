COMMAND:fishing(playerid, params[]) {
    if(SpielerInfo[playerid][sNebenjob] != 18)return NichtBerechtigt
	new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	if(FahrzeugInfo[tmpcar][fNebenjob] != 18)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	new mainstring[1028], string[128], colorString[16], Float:_PlayerX, Float:_PlayerY, Float:_PlayerZ;
	GetPlayerPos(playerid, _PlayerX, _PlayerY, _PlayerZ);

	format(mainstring, sizeof(mainstring), "ID\tStatus\tEntfernung\n");

	for(new i = 0; i < MAX_FISHING_TRAPS; i++) {
		if(fishingTrap[i][fTrapTimestamp] != -1) {
			new timeStamp = (gettime() - fishingTrap[i][fTrapTimestamp]) / 60;
			new Float:dist = GetDistanceBetweenPoints(fishingTrap[i][fTrapX], fishingTrap[i][fTrapY], fishingTrap[i][fTrapZ], _PlayerX, _PlayerY, _PlayerZ);
			if(timeStamp < 10) format(colorString, sizeof(colorString), "{FF0000}");
			else if(timeStamp >= 15) format(colorString, sizeof(colorString), "{FF9900}");
			else format(colorString, sizeof(colorString), "{00CC00}");
			format(string, sizeof(string), "Reuse %i\tAusgelegt vor %s%i Minuten\t%i Meter\n", i+1, colorString, timeStamp, floatround(dist));
		} else {
			format(string, sizeof(string), "Reuse %i\tAuslegen\t-\n", i+1);
		}
		strcat(mainstring, string);
	}
	strcat(mainstring, "\nGefangene Fische");
	strcat(mainstring, "\nZum Abgabepunkt");
	ShowPlayerDialog(playerid, DIALOG_JOB_FISHING, DIALOG_STYLE_TABLIST_HEADERS, "{99CC00}RSL: {FFFFFF}Hochseefischer",mainstring, "Auswählen", "Abbrechen");
    return 1;
}