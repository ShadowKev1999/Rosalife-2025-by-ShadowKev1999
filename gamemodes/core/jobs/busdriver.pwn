BusJob_Init() {
	new query[512];

    strcat(query,"CREATE TABLE IF NOT EXISTS `server_busroutes` (`id` int(11) NOT NULL AUTO_INCREMENT, `color` varchar(16) DEFAULT NULL, `name` varchar(32) DEFAULT NULL,");
    strcat(query,"`skill` int(11) DEFAULT NULL, `bonusmoney` int(11) DEFAULT NULL, `jobexpbonus` int(11) DEFAULT NULL, PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=latin1;");
    mysql_tquery(sqlHandle, query);

	strdel(query,0,sizeof(query));

	strcat(query,"CREATE TABLE IF NOT EXISTS `server_busroutes_cps` (`id` int(11) NOT NULL AUTO_INCREMENT, `busRoute` int(11) DEFAULT NULL, `checkpoint` varchar(256) DEFAULT '|',");
    strcat(query,"PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=latin1;");
    mysql_tquery(sqlHandle, query);

	mysql_tquery(sqlHandle, "SELECT * FROM `server_busroutes`;", "onLoadBusRoutes");
	return 1;
}

/*

 */

forward onLoadBusRoutes();
public onLoadBusRoutes() {
	new rows, query[128];
	cache_get_row_count(rows);
	if(rows) {
		for(new i = 0; i < rows; i++) {
			cache_get_value_name_int(i, "id", busRoutesData[i][bRouteDatabaseId]);
			cache_get_value_name(i, "color", busRoutesData[i][bRouteColor]);
			cache_get_value_name(i, "name", busRoutesData[i][bRouteName]);
			cache_get_value_name_int(i, "skill", busRoutesData[i][bBusSkill]);
			cache_get_value_name_int(i, "bonusmoney", busRoutesData[i][bBusMoneyBonus]);
			cache_get_value_name_int(i, "jobexpbonus", busRoutesData[i][bBusJobExpBonus]);

			mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `server_busroutes_cps` WHERE `busRoute` = %i;", busRoutesData[i][bRouteDatabaseId]);
			mysql_tquery(sqlHandle, query, "onLoadBusRouteCheckpoints", "i", i);

			busRoutesData[i][bRouteCreated] = true;
		}
	}
	return 1;
}

forward onLoadBusRouteCheckpoints(index);
public onLoadBusRouteCheckpoints(index) {
	new rows, helperVar[256];
	cache_get_row_count(rows);
	if(rows) {
		for(new i = 0; i < rows; i++) {
			cache_get_value_name(i, "checkpoint", helperVar);

			if(helperVar[0] != '|' && helperVar[1] != EOS) {
				sscanf(helperVar,"p<|>fff", busRouteCheckpoint[index][i][0], busRouteCheckpoint[index][i][1], busRouteCheckpoint[index][i][2]);
			}
		}
	}
	return 1;
}

stock showBusRoutes(playerid) {
	new string[16 * 32 * MAX_BUS_ROUTES + 250], counter = 0;
	for(new i = 0; i < MAX_BUS_ROUTES; i++) {
		if(!busRoutesData[i][bRouteCreated]) continue;
		format(string, sizeof(string), "%s\n{%s}%s {FF0000}(%i){FFFFFF}| Benötigte Erfahrung: {FF0000}%i", string, busRoutesData[i][bRouteColor], busRoutesData[i][bRouteName], busRoutesData[i][bRouteDatabaseId], busRoutesData[i][bBusSkill]);
		busRoutePlayerList[playerid][counter] = i;
		counter++;
	}
	if(!counter) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es wurden noch keine Busrouten für diesen Job definiert.");
	ShowPlayerDialog(playerid, DIALOG_LINIEN, DIALOG_STYLE_LIST, "{007DFF}"SERV_NAME"{FFFFFF} - Busfahrer", string, "Starten", "Abbrechen");
	return 1;
}

BusJob_OnDialogResponse(playerid, dialogid, response, listitem) {
	switch(dialogid) {
		case DIALOG_LINIEN: {
			if(!response) {
				if(GetPVarInt(playerid, "BusfahrerArbeitet")) {
					new tmpcar = GetPVarInt(playerid,"BusID");
					
					UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, "Busfahrer:\n{FE0000}Niemand{FFFFFF}");
					SetVehicleToRespawn(tmpcar);
					FahrzeugInfo[tmpcar][fJobFahrer] = 0;
					DeletePVar(playerid, "BusfahrerArbeitet");
					DeletePVar(playerid,"BusID");
				}
				return 1;
			}
			new routeId = busRoutePlayerList[playerid][listitem], tmpcar = GetPlayerVehicleID(playerid), str[128];
			
			if(SpielerInfo[playerid][sJobEXP][4] < busRoutesData[routeId][bBusSkill]) {
				showBusRoutes(playerid);
				SendClientMessage(playerid, COLOR_ERRORTEXT, "Für die ausgewähle Route ist dein Skill-Level zu niedrig.");
				return 1;
			}

			SetPVarInt(playerid,"BusID", tmpcar);
			SetPVarInt(playerid,"BusfahrerArbeitet", 1);
			SetPVarInt(playerid,"BusfahrerLinie", routeId);
			SetPVarInt(playerid,"BusfahrerRoute", 0);
			FahrzeugInfo[tmpcar][fJobFahrer] = playerid;
			format(str, sizeof(str), "Busfahrer:\n{FE0000}%s{FFFFFF}\nLinie: {FF0000}%s{FFFFFF}", SpielerInfo[playerid][sName], busRoutesData[routeId][bRouteName]);
			UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, str);
			SetPlayerJobCheckpoint(playerid, busRouteCheckpoint[routeId][0][0], busRouteCheckpoint[routeId][0][1], busRouteCheckpoint[routeId][0][2], 5.0);
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
			SendClientMessage(playerid,COLOR_SUPER,"Dann mal ran an die Arbeit! Fahre die einzelnen Haltestellen ab. Begib dich nun zum roten Marker.");
			return 1;
		}

		case DIALOG_BUSFAHRER_ASK: {
			if(!response) {
				return ShowPlayerDialog(playerid,DIALOG_BUSFAHRER_ASK,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Busfahrer","Weiter Jobben\nAufhören","Bestätigen","Abbrechen");
			}
			new tmpcar = GetPVarInt(playerid,"BusID");
			switch(listitem)
			{
				case 0: { //Weiter Jobben
					TogglePlayerControllable(playerid, true);
					showBusRoutes(playerid);
					SetPVarInt(playerid,"BusfahrerArbeitet",1);
					DeletePVar(playerid,"BusID");
				}
				case 1: { //Aufhören
					TogglePlayerControllable(playerid, true);
					UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, "Busfahrer:\n{FE0000}Niemand{FFFFFF}");
					SetVehicleToRespawn(tmpcar);
					FahrzeugInfo[tmpcar][fJobFahrer] = 0;
					DeletePVar(playerid,"BusID");
					DeletePVar(playerid,"BusfahrerArbeitet");
				}
	    	}
			return 1;
		}
	}
	return 1;
}

forward Busfahrer(playerid);
public Busfahrer(playerid)
{
	new string[144];
	if(GetPVarInt(playerid,"BusCountdown") > 1)
 	{
		SetPVarInt(playerid,"BusCountdown",GetPVarInt(playerid,"BusCountdown")-1);
		format(string,sizeof(string),"Weiterfahrt in %d",GetPVarInt(playerid,"BusCountdown"));
		PlayerTextDrawSetString(playerid, RobBar[playerid][2], string);
		if(RobBarValue[playerid] < 409.000000)
		{
		    RobBarValue[playerid] += 19.07;
		    if(RobBarValue[playerid] > 409.000000)
		    {
		        RobBarValue[playerid] = 409.000000;
		    }
		    PlayerTextDrawHide(playerid,RobBar[playerid][1]);
	    	PlayerTextDrawTextSize(playerid,RobBar[playerid][1], RobBarValue[playerid], -1.000000);
	    	PlayerTextDrawShow(playerid, RobBar[playerid][1]);
		}
		return 1;
 	}
 	PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	KillTimer(BusfahrerTimer[playerid]);
    SetPVarInt(playerid,"BusfahrerRoute",GetPVarInt(playerid,"BusfahrerRoute")+1);
	new id = GetPVarInt(playerid,"BusfahrerLinie"), cp = GetPVarInt(playerid,"BusfahrerRoute");
    TogglePlayerControllable(playerid, true);
    SetPlayerJobCheckpoint(playerid, busRouteCheckpoint[id][cp][0], busRouteCheckpoint[id][cp][1], busRouteCheckpoint[id][cp][2], 5.0);
    DeletePVar(playerid,"AnBusHaltestelle");
    DeletePVar(playerid,"BusCountdown");
    PlayerTextDrawHide(playerid, RobBar[playerid][0]);
    PlayerTextDrawHide(playerid, RobBar[playerid][1]);
    PlayerTextDrawHide(playerid, RobBar[playerid][2]);
    RobBarValue[playerid] = 0;
	return 1;
}