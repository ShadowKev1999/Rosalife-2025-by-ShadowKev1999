stock LoadDrogen()
{
	mysql_tquery(sqlHandle, "SELECT * FROM `drogenpflanzen` ORDER BY `ID` ASC", "onLoadDrugs");
    return 1;
}

forward onLoadDrugs();
public onLoadDrugs() {
    new rows, fc = 1, string[164];
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "ID", fc);
            cache_get_value_name(i, "Besitzer", DrogenInfo[fc][dBesitzer]);
            cache_get_value_name_float(i, "PosX", DrogenInfo[fc][dPos_X]);
            cache_get_value_name_float(i, "PosY", DrogenInfo[fc][dPos_Y]);  
            cache_get_value_name_float(i, "PosZ", DrogenInfo[fc][dPos_Z]);  
            cache_get_value_name_int(i, "Reife", DrogenInfo[fc][dReife]);  
            cache_get_value_name_int(i, "FrakID", DrogenInfo[fc][dFrakID]); 

            DrogenInfo[fc][dObject] = CreateDynamicObject(19473, DrogenInfo[fc][dPos_X], DrogenInfo[fc][dPos_Y], DrogenInfo[fc][dPos_Z]-1, 0.0, 0.0, 0.0);
            format(string, sizeof(string), "Drogenpflanze der {FF0000}%s{FFFFFF} (%d)\nReife: {FF0000}%d{FFFFFF} Prozent",FrakName(DrogenInfo[fc][dFrakID]),fc,DrogenInfo[fc][dReife]);
            DrogenInfo[fc][dText] = CreateDynamic3DTextLabel(string, COLOR_WHITE, DrogenInfo[fc][dPos_X], DrogenInfo[fc][dPos_Y], DrogenInfo[fc][dPos_Z], 5.0);
            DrogenInfo[fc][dErstellt] = true;
        }
    }
    printf(" Es wurde(n) %d Drogenpflanzen erfolgreich geladen und erstellt.", rows);
    return 1;
}

stock SaveDrogen()
{
	new query[230];
	for(new mf=1;mf<MAX_DROGEN;mf++)
    {
        if(DrogenInfo[mf][dErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `drogenpflanzen` SET `Reife`='%d' WHERE `ID`='%d'",DrogenInfo[mf][dReife],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock AnDrogenPflanze(playerid)
{
	for(new ts = 1;ts<MAX_DROGEN;ts++)
    {
		if(DrogenInfo[ts][dErstellt] == false)continue;
 		if(IsPlayerInRangeOfPoint(playerid,3.0,DrogenInfo[ts][dPos_X],DrogenInfo[ts][dPos_Y],DrogenInfo[ts][dPos_Z]))
 		{
 	    	return 1;
		}
	}
	return 0;
}

stock GetNearDrogenPflanzeID(playerid)
{
	for(new ts = 1;ts<MAX_DROGEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, DrogenInfo[ts][dPos_X], DrogenInfo[ts][dPos_Y], DrogenInfo[ts][dPos_Z]))return ts;
	}
	return -1;
}

public DrogenStatus()
{
	for(new mf=1;mf<MAX_DROGEN;mf++)
	{
	    new string[164];
		if(DrogenInfo[mf][dErstellt] == false)continue;
		if(DrogenInfo[mf][dReife] < 100)
		{
		    if(FrakInfo[DrogenInfo[mf][dFrakID]][fiDrogenUpgrade] > 0){DrogenInfo[mf][dReife] += 5;}
			else DrogenInfo[mf][dReife] += 4;
			format(string, sizeof(string), "Drogenpflanze der {FF0000}%s{FFFFFF} (%d)\nReife: {FF0000}%d{FFFFFF} Prozent",FrakName(DrogenInfo[mf][dFrakID]),mf,DrogenInfo[mf][dReife]);
			UpdateDynamic3DTextLabelText(DrogenInfo[mf][dText], COLOR_WHITE, string);
		}
	}
}

public DrogenpflanzeErnten(playerid, mf)
{
	new mfCheck = GetNearDrogenPflanzeID(playerid);
	if(mfCheck != mf)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast die Drogenpflanze nicht geerntet.");
	new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `drogenpflanzen` WHERE `ID` = '%i' ", mf);
	mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Drogenpflanze geerntet. +12 Drogen");
    SpielerInfo[playerid][sDrogen] += 12;

	DestroyDynamic3DTextLabel(DrogenInfo[mf][dText]);
	DrogenInfo[mf][dText] = Text3D:INVALID_3DTEXT_ID;

	DestroyDynamicObject(DrogenInfo[mf][dObject]);
	DrogenInfo[mf][dObject] = INVALID_OBJECT_ID;

	DrogenInfo[mf][dReife] = 0;
	DrogenInfo[mf][dBesitzer] = 0;
	format(DrogenInfo[mf][dBesitzer], 0, "");
	DrogenInfo[mf][dPos_X] = 0;
	DrogenInfo[mf][dPos_Y] = 0;
	DrogenInfo[mf][dPos_Z] = 0;
	DrogenInfo[mf][dErstellt] = false;
	ClearAnimations(playerid);
	return 1;
}