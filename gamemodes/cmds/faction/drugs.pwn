CMD:createdroge(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 19)
 	{
 		new Zone = IsPlayerInGangZoneEx(playerid), Float:Position[3], query[264];
		if(Zone < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du befindest dich in keinem Gang-/Mafiengebiet.");
		if(GangZoneInfo[Zone][gzFightTime] >= 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Hier wird zurzeit gekämpft!");
  		if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du kannst keine Drogenpflanze aus einem Fahrzeug heraus pflanzen.");
		if(GangZoneInfo[Zone][gzOwner] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Gebiet gehört euch nicht.");
		if(GangZoneInfo[Zone][gzType] != 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst hier keine Drogen pflanzen.");
		if(GangZoneInfo[Zone][gzValue] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es sind nicht genügend Samen in der Gebietskiste.");
  		if(AnDrogenPflanze(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Platziere deine Pflanze ein Stück weiter weg.");

  		mysql_format(sqlHandle, query, sizeof(query),"SELECT ID FROM `drogenpflanzen` WHERE `Besitzer` = '%s'", SpielerInfo[playerid][sName]);
 	 	new Cache:result = mysql_query(sqlHandle, query);
		new hatDrugs = cache_num_rows();
	    cache_delete(result);

		if(hatDrugs > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt bereits drei Drogenpflanzen.");
		for(new mf=1;mf<MAX_DROGEN;mf++)
		{
			if(DrogenInfo[mf][dErstellt] == true)continue;
			GetPlayerPos(playerid,Position[0],Position[1],Position[2]);
   			DrogenInfo[mf][dErstellt] = true;
   			DrogenInfo[mf][dPos_X] = Position[0];
			DrogenInfo[mf][dPos_Y] = Position[1];
			DrogenInfo[mf][dPos_Z] = Position[2];
			DrogenInfo[mf][dReife] = 0;
			DrogenInfo[mf][dFrakID] = SpielerInfo[playerid][sFraktion];
			format(DrogenInfo[mf][dBesitzer], MAX_PLAYER_NAME, SpielerInfo[playerid][sName]);

			GangZoneInfo[Zone][gzValue]--;
			DrogenInfo[mf][dObject] = CreateDynamicObject(19473, Position[0], Position[1], Position[2]-1, 0.0, 0.0, 0.0);
			mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `drogenpflanzen` (`ID`, `Besitzer`, `PosX`, `PosY`, `PosZ`, `FrakID`) VALUES ('%d', '%s', '%f', '%f', '%f', '%d')", mf, SpielerInfo[playerid][sName], Position[0], Position[1], Position[2]-1, SpielerInfo[playerid][sFraktion]);
			mysql_tquery(sqlHandle, query);
			ClearAnimations(playerid);
			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, false, false, false, false, 0);
   			ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, false, false, false, false, 0);
			format(query,sizeof(query),"Gangzone der %s [ID:%d]\nTyp: %s | Wert: %d",FrakName(GangZoneInfo[Zone][gzOwner]),Zone,GangZoneTyp(GangZoneInfo[Zone][gzType]),GangZoneInfo[Zone][gzValue]);
			UpdateDynamic3DTextLabelText(GangZoneInfo[Zone][gzLabel], 0xFFC800FF, query);
			format(query, sizeof(query), "Drogenpflanze der {FF0000}%s{FFFFFF} (%d)\nReife: {FF0000}%d{FFFFFF} Prozent",FrakName(SpielerInfo[playerid][sFraktion]),mf,DrogenInfo[mf][dReife]);
			DrogenInfo[mf][dText] = CreateDynamic3DTextLabel(query, COLOR_WHITE, Position[0], Position[1], Position[2], 5.0);

			SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast eine Drogenpflanze angepflanzt.");
			return 1;
		}
  	}
   	else NichtBerechtigt
    return 1;
}
CMD:destroydroge(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 19)
 	{
  		if(!AnDrogenPflanze(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keiner Drogenpflanze.");
    	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Steige zuerst aus deinem Fahrzeug.");
     	if(SpielerInfo[playerid][sFeuerzeug] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast kein Feuerzeug bei dir.");
      	new string[128];
       	format(string,sizeof(string),"* %s dreht das Rädchen und schnippst das Feuerzeug in die Pflanze.",SpielerInfo[playerid][sName]);
        ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
        SpielerInfo[playerid][sFeuerzeug] -= 1;
        new mf = GetNearDrogenPflanzeID(playerid);
        new query[128], var[25], mfFrakID = 0;
        mysql_format(sqlHandle, query, sizeof(query),"SELECT FrakID FROM `drogenpflanzen` WHERE `ID` = '%i'", mf);
   	 	new Cache:result = mysql_query(sqlHandle, query);
  		cache_get_value_name(0, "FrakID",var); mfFrakID = strval(var);
	    cache_delete(result);

		if(SpielerInfo[playerid][sFraktion] == mfFrakID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Drogenpflanze gehört zu deiner Gang / Mafia.");

		DestroyDynamic3DTextLabel(DrogenInfo[mf][dText]);
		DrogenInfo[mf][dText] = Text3D:INVALID_3DTEXT_ID;

		DestroyDynamicObject(DrogenInfo[mf][dObject]);
		DrogenInfo[mf][dObject] = INVALID_OBJECT_ID;

		DrogenInfo[mf][dReife] = 0;
		DrogenInfo[mf][dPos_X] = 0;
		DrogenInfo[mf][dPos_Y] = 0;
		DrogenInfo[mf][dPos_Z] = 0;
		DrogenInfo[mf][dErstellt] = false;

		mysql_format(sqlHandle, string, sizeof(string), "DELETE FROM `drogenpflanzen` WHERE `ID` = '%i' ", mf);
		mysql_tquery(sqlHandle, string);
		DrogenInfo[mf][dBesitzer] = 0;
		format(DrogenInfo[mf][dBesitzer], 0, "");
		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast die Drogenpflanze zerstört.");
		return 1;
  	}
   	else NichtBerechtigt
    return 1;
}
CMD:ernten(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 19)
 	{
		if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst die Drogenpflanze nicht aus einem Fahrzeug heraus ernten.");
		if(!AnDrogenPflanze(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keiner Drogenpflanze.");
		new mf = GetNearDrogenPflanzeID(playerid);
		if(DrogenInfo[mf][dReife] < 100)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Drogenpflanze ist noch nicht reif.");
		new mfFrakID = 0, var[11], query[128];
  		mysql_format(sqlHandle, query, sizeof(query),"SELECT FrakID FROM `drogenpflanzen` WHERE `ID` = '%i'", mf);
 	 	new Cache:result = mysql_query(sqlHandle, query);
		cache_get_value_name(0, "FrakID",var); mfFrakID = strval(var);
	    cache_delete(result);
	    if(SpielerInfo[playerid][sFraktion] != mfFrakID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst diese Drogenpflanze nicht ernten.");
		ClearAnimations(playerid);
  		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, false, false, false, false, 5000);
    	ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, false, false, false, false, 5000);
		SetTimerEx("DrogenpflanzeErnten",5000,false,"ii",playerid,mf);
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Die Drogenpflanze wird geerntet, warte einen Moment...");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}