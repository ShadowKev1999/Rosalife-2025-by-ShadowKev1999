ATM_Init() {
	mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `atms` (`id` INT(12) NOT NULL , `x` FLOAT NOT NULL , `y` FLOAT NOT NULL , `z` FLOAT NOT NULL , \
							`rx` FLOAT NOT NULL , `ry` FLOAT NOT NULL , `rz` FLOAT NOT NULL , `money` INT(12) NOT NULL, `state` INT(12) NOT NULL , \
							`interior` INT(12) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;");
	mysql_tquery(sqlHandle, "SELECT * FROM `atms`;", "onServerLoadATMs");
	return 1;
}

forward onServerLoadATMs();
public onServerLoadATMs() {
	new rows, helper = 0, id = 0;
	cache_get_row_count(rows);
	if(rows) {
		for(new atm = 0; atm < rows; atm++) {
			if(atm >= MAX_ATMS) continue;
			
			cache_get_value_name_int(atm, "id", id);

			cache_get_value_name_float(atm, "x", ATMInfo[id][atmPos_X]);
			cache_get_value_name_float(atm, "y", ATMInfo[id][atmPos_Y]);
			cache_get_value_name_float(atm, "z", ATMInfo[id][atmPos_Z]);
			cache_get_value_name_float(atm, "rx", ATMInfo[id][atmRPos_X]);
			cache_get_value_name_float(atm, "ry", ATMInfo[id][atmRPos_Y]);
			cache_get_value_name_float(atm, "rz", ATMInfo[id][atmRPos_Z]);

			cache_get_value_name_int(atm, "money", ATMInfo[id][atmGeld]);
			cache_get_value_name_int(atm, "state", ATMInfo[id][atmKaputt]);
			cache_get_value_name_int(atm, "interior", helper);
			ATMInfo[id][atmInterior] = (helper) ? true : false;

			if(ATMInfo[id][atmKaputt]) {
				ATMInfo[id][atmRauch] = CreateDynamicObject(18727, ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z]-2, 0.0, 0.0, 0.0);
			}

			ATMInfo[id][atmObj] = CreateDynamicObject(ATM_OBJECT_MODEL,ATMInfo[id][atmPos_X],ATMInfo[id][atmPos_Y],ATMInfo[id][atmPos_Z],ATMInfo[id][atmRPos_X],ATMInfo[id][atmRPos_Y],ATMInfo[id][atmRPos_Z]);
 	    	new label[256];
			format(label, sizeof(label), "{FFFFFF}Bankautomat (%i)\nBenutze '{FF0000}N' {FFFFFF}oder {FF0000}'/atm{FFFFFF}", id);
			ATMInfo[id][atmLabel] = CreateDynamic3DTextLabel(label, 0x008080FF, ATMInfo[id][atmPos_X],ATMInfo[id][atmPos_Y],ATMInfo[id][atmPos_Z] + 1.5, 10.0);
			ATMInfo[id][atmCreated] = true;
		}
	}
	return 1;
}

SaveATMById(id) {
	if(!ATMInfo[id][atmCreated]) return 1;
	new query[512];
	mysql_format(sqlHandle, query, sizeof(query), "UPDATE `atms` SET `x` = %f, `y` = %f, `z` = %f, `rx` = %f, `ry` = %f, `rz` = %f, \
													`money` = %i, `state` = %i, `interior` = %i WHERE `id` = %i",
	ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z], ATMInfo[id][atmRPos_X], ATMInfo[id][atmRPos_Y], ATMInfo[id][atmRPos_Z],
	ATMInfo[id][atmGeld], ATMInfo[id][atmKaputt], (ATMInfo[id][atmInterior]) ? 1 : 0, id);
	mysql_tquery(sqlHandle, query);
	return 1;
}

SaveAllAtms() {
	new query[512];
	for(new id=1; id<MAX_ATMS; id++) {
		if(!ATMInfo[id][atmCreated]) continue;
		mysql_format(sqlHandle, query, sizeof(query), "UPDATE `atms` SET `x` = %f, `y` = %f, `z` = %f, `rx` = %f, `ry` = %f, `rz` = %f, \
														`money` = %i, `state` = %i, `interior` = %i WHERE `id` = %i",
		ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z], ATMInfo[id][atmRPos_X], ATMInfo[id][atmRPos_Y], ATMInfo[id][atmRPos_Z],
		ATMInfo[id][atmGeld], ATMInfo[id][atmKaputt], (ATMInfo[id][atmInterior]) ? 1 : 0, id);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock ATMZustand(atmid)
{
    new zustand[30];
    if(ATMInfo[atmid][atmKaputt] == 1){zustand="{FF0000}Außer Betrieb";}
    else {zustand="{9ACD32}In Betrieb";}
    return zustand;
}

stock getFreeAtmSlot() {
	for(new atm=1; atm<MAX_ATMS; atm++)
 	{
		if(ATMInfo[atm][atmCreated]) continue;
		return atm;
	}
	return -1;
}

stock AmATM(playerid)
{
 	for(new atm=1; atm<MAX_ATMS; atm++)
 	{
		if(!ATMInfo[atm][atmCreated]) continue;
 		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMInfo[atm][atmPos_X],ATMInfo[atm][atmPos_Y],ATMInfo[atm][atmPos_Z]))
 		{
 	    	return 1;
		}
	}
	return 0;
}

stock ATMID(playerid)
{
	for(new atm=1; atm<MAX_ATMS; atm++)
	{
		if(!ATMInfo[atm][atmCreated]) continue;
		if(IsPlayerInRangeOfPoint(playerid,1.5,ATMInfo[atm][atmPos_X],ATMInfo[atm][atmPos_Y],ATMInfo[atm][atmPos_Z]))return atm;
	}
	return -1;
}

ATM_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(EditingATMID[playerid] != -1 && ATM_Created(EditingATMID[playerid]))
	{
	    if(response == 1)
	    {
	        new id = EditingATMID[playerid];
	        ATMInfo[id][atmPos_X] = x;
	        ATMInfo[id][atmPos_Y] = y;
	        ATMInfo[id][atmPos_Z] = z;
	        ATMInfo[id][atmRPos_X] = rx;
	        ATMInfo[id][atmRPos_Y] = ry;
	        ATMInfo[id][atmRPos_Z] = rz;

	        SetDynamicObjectPos(objectid, ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z]);
	        SetDynamicObjectRot(objectid, ATMInfo[id][atmRPos_X], ATMInfo[id][atmRPos_Y], ATMInfo[id][atmRPos_Z]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, ATMInfo[id][atmLabel], E_STREAMER_X, ATMInfo[id][atmPos_X]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, ATMInfo[id][atmLabel], E_STREAMER_Y, ATMInfo[id][atmPos_Y]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, ATMInfo[id][atmLabel], E_STREAMER_Z, ATMInfo[id][atmPos_Z] + 1.5);

            new query[256];
            mysql_format(sqlHandle, query, sizeof(query), "UPDATE `atms` SET `x` = %f, `y` = %f, `z` = %f, `rx` = %f, `ry` = %f, `rz` = %f WHERE `id` = %i",
            ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z], ATMInfo[id][atmRPos_X], ATMInfo[id][atmRPos_Y], ATMInfo[id][atmRPos_Z], id);
            mysql_tquery(sqlHandle, query);

			SendClientMessage(playerid, 0x3498DBFF, "ATM: {FFFFFF}ATM %i wurde erfolgreich editiert.", id);

			if(ATMInfo[id][atmKaputt]) {
				SetDynamicObjectPos(ATMInfo[id][atmRauch], x, y, z-2);
			}

	        EditingATMID[playerid] = -1;
	    }

	    if(response == 0)
	    {
	        new id = EditingATMID[playerid];
	        SetDynamicObjectPos(objectid, ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z]);
	        SetDynamicObjectRot(objectid, ATMInfo[id][atmRPos_X], ATMInfo[id][atmRPos_Y], ATMInfo[id][atmRPos_Z]);
	        EditingATMID[playerid] = -1;
	    }
	}

	return 1;
}

ATM_PlayerConnect(playerid) {
	EditingATMID[playerid] = -1;
	return 1;
}

ATM_onDialogResponse(playerid, dialogid, response) {
	switch(dialogid) {
		case DIALOG_ADMIN_CREATE_ATM: {
			new atm = getFreeAtmSlot();
    		if(atm == -1) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es können keine weiteren ATMs erstellt werden. Maximales Limit erreicht!");
			if(response) {
				//Ja
				ATMInfo[atm][atmCreated] = true;
				ATMInfo[atm][atmInterior] = true;
			} else {
				//Nein
				ATMInfo[atm][atmCreated] = true;
				ATMInfo[atm][atmInterior] = false;
			}
			new Float: x, Float: y, Float: z, Float: a;
			GetPlayerPos(playerid, x, y, z);
			GetPlayerFacingAngle(playerid, a);
			x += (3.0 * floatsin(-a, degrees));
			y += (3.0 * floatcos(-a, degrees));
			z -= 1.0;
			
			ATMInfo[atm][atmPos_X] = x;
			ATMInfo[atm][atmPos_Y] = y;
			ATMInfo[atm][atmPos_Z] = z + 1.5;
			ATMInfo[atm][atmRPos_X] = ATMInfo[atm][atmRPos_Y] = ATMInfo[atm][atmRPos_Z] = 0.0;

			ATMInfo[atm][atmObj] = CreateDynamicObject(ATM_OBJECT_MODEL,ATMInfo[atm][atmPos_X],ATMInfo[atm][atmPos_Y],ATMInfo[atm][atmPos_Z],ATMInfo[atm][atmRPos_X],ATMInfo[atm][atmRPos_Y],ATMInfo[atm][atmRPos_Z]);
 	    	
			ATMInfo[atm][atmGeld] = ATM_DEFAULT_MONEY;
			ATMInfo[atm][atmKaputt] = 0;

			new label[256];
			format(label, sizeof(label), "{FFFFFF}Bankautomat (%i)\nBenutze '{FF0000}N' {FFFFFF}oder {FF0000}'/atm{FFFFFF}", atm);

			ATMInfo[atm][atmLabel] = CreateDynamic3DTextLabel(label, 0x008080FF, ATMInfo[atm][atmPos_X],ATMInfo[atm][atmPos_Y],ATMInfo[atm][atmPos_Z], 10.0);
			
			new query[256];

			mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `atms` (`id`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `state`, `money`, `interior`) VALUES (%i, %f, %f, %f, %f, %f, %f, %i, %i, %i)",
			atm, ATMInfo[atm][atmPos_X], ATMInfo[atm][atmPos_Y], ATMInfo[atm][atmPos_Z], ATMInfo[atm][atmRPos_X], ATMInfo[atm][atmRPos_Y], ATMInfo[atm][atmRPos_Z],
			ATMInfo[atm][atmKaputt], ATMInfo[atm][atmGeld], (ATMInfo[atm][atmInterior]) ? 1 : 0);
			mysql_tquery(sqlHandle, query);


			EditingATMID[playerid] = atm;
			EditDynamicObject(playerid, ATMInfo[atm][atmObj]);
			
			SendClientMessage(playerid, 0x3498DBFF, "ATM: {FFFFFF}ATM wurde erstellt.");
			SendClientMessage(playerid, 0x3498DBFF, "ATM: {FFFFFF}Du kannst den ATM nun editieren. Du kannst dieser zu jederzeit editieren.");
		}
	}
	return 1;
}

ATM_Created(id) {
	if(id < 0 || id > MAX_ATMS) return 0;
	if(ATMInfo[id][atmCreated]) return 1;
	return 0;
}

ATM_BeingEdited(id) {
	if(id < 0 || id > MAX_ATMS) return 0;
	if(!ATMInfo[id][atmCreated]) return 0;
	foreach(new i : Player) if(EditingATMID[i] == id) return 1;
	return 0;
}