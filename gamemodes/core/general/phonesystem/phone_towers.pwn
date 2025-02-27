stock ReturnHempfangRate(playerid) {
	new Float:HzonePos[3], prozent = MAX_TMASTENRANGE/100;
 	GetPlayerPos(playerid, HzonePos[0], HzonePos[1], HzonePos[2]);
	for(new i=0;i<MAX_MASTEN;i++) {
		if(FMastenInfo[i][Erstellt] == 1 && FMastenInfo[i][EGmBhHp] > 0) {
			if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*10)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*10)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*10)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*10)) && HzonePos[2] <= (prozent*10))) return 1;
			if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*25)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*25)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*25)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*25)) && HzonePos[2] <= (prozent*25))) return 2;
			if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*50)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*50)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*50)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*50)) && HzonePos[2] <= (prozent*50))) return 3;
			if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*75)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*75)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*75)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*75)) && HzonePos[2] <= (prozent*75))) return 4;
			if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*90)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*90)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*90)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*90)) && HzonePos[2] <= (prozent*90))) return 5;
		 	if((HzonePos[0] >= (FMastenInfo[i][sperreX]-(prozent*100)) && HzonePos[0] <= (FMastenInfo[i][sperreX]+(prozent*100)) && HzonePos[1] >= (FMastenInfo[i][sperreY]-(prozent*100)) && HzonePos[1] <= (FMastenInfo[i][sperreY]+(prozent*100)) && HzonePos[2] <= (prozent*100))) return 6;
		}
	}
	return -1;
}

stock ReturnTMastenID(playerid) {
    for(new msten=0;msten<MAX_MASTEN;msten++) {
		if(!FMastenInfo[msten][Erstellt]) continue;
        if(IsPlayerInRangeOfPoint(playerid,30.0,FMastenInfo[msten][sperreX],FMastenInfo[msten][sperreY],FMastenInfo[msten][sperreZ])) return msten;
	}
	return -1;
}

stock TMastenCount() {
	new index;
	for(new msten=0;msten<MAX_MASTEN;msten++) {
	 	if(!FMastenInfo[msten][Erstellt]) continue;
		index++;
	}
 	return index;
}

CreateTmasten(playerid) {
	new query[256],Float:Pos[3];
    for(new msten=0;msten<MAX_MASTEN;msten++) {
	 	if(FMastenInfo[msten][Erstellt]) continue;

        GetPlayerPos(playerid, Pos[0], Pos[1], Pos[2]);

        FMastenInfo[msten][sperreX] = Pos[0];
        FMastenInfo[msten][sperreY] = Pos[1];
        FMastenInfo[msten][sperreZ] = Pos[2];
        FMastenInfo[msten][Erstellt] = 1;
        FMastenInfo[msten][EGmBhHp] = 100;
        FMastenInfo[msten][EGmBhRubbishObject] = -1;
        FMastenInfo[msten][ID] = CreateDynamicObject(10357,FMastenInfo[msten][sperreX],FMastenInfo[msten][sperreY],FMastenInfo[msten][sperreZ],0.0,0.0,10);
        FMastenInfo[msten][EGmBhMastenZone] = GangZoneCreate(FMastenInfo[msten][sperreX]-600,FMastenInfo[msten][sperreY]-600,FMastenInfo[msten][sperreX]+600,FMastenInfo[msten][sperreY]+600);
        FMastenInfo[msten][EGmBhTstamp] = gettime() + ((random(10) + 10)*60);

        foreach(new i : Player)
        {
            if(IsPlayerConnected(i) && !IsPlayerNPC(i) && SpielerInfo[playerid][sShowNetworks] != 0)
            {
                GangZoneShowForPlayer(playerid,FMastenInfo[msten][EGmBhMastenZone],0xB9FF006A);
            }
        }
        FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] -= MAX_TMASTENPRICE;
        GovVars[govKasse] += MAX_TMASTENPRICE;

        SendClientMessage(playerid, COLOR_YELLOW, "Funkmast erstellt!");
        SendClientMessage(playerid, COLOR_YELLOW, "Im Umkreis von "#MAX_TMASTENRANGE" Metern ist mit Handyempfang zu rechnen!");
        format(query,sizeof(query),"%s (ID:%i) hat einen Funkmast erstellt. | Die Erbauung kostet der Fraktion "#MAX_TMASTENPRICE".", SpielerInfo[playerid][sName], playerid);
        sendFactionMessage(COLOR_BLUE, SpielerInfo[playerid][sFraktion], query);
        mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO networktowers (`id`,`X`,`Y`,`Z`,`HP`) VALUES ('%d','%f','%f','%f','%d')",msten,FMastenInfo[msten][sperreX],FMastenInfo[msten][sperreY],FMastenInfo[msten][sperreZ],FMastenInfo[msten][EGmBhHp]);
        mysql_tquery(sqlHandle, query);
        return 1;
	}
	return 1;
}

DeleteTMasten(playerid)
{
    new query[128];
    for(new msten=0;msten<MAX_MASTEN;msten++) {
	  	if(!IsPlayerInRangeOfPoint(playerid,5,FMastenInfo[msten][sperreX],FMastenInfo[msten][sperreY],FMastenInfo[msten][sperreZ])) continue;
        if(!FMastenInfo[msten][Erstellt]) continue;

        FMastenInfo[msten][Erstellt] = 0;
        FMastenInfo[msten][sperreX] = -1;
        FMastenInfo[msten][sperreY] = -1;
        FMastenInfo[msten][sperreZ] = -1;
        FMastenInfo[msten][EGmBhHp] = 0;

        if(FMastenInfo[msten][EGmBhRubbishObject] != -1) DestroyDynamicObject(FMastenInfo[msten][EGmBhRubbishObject]);

        FMastenInfo[msten][EGmBhRubbishObject] = -1;
        GangZoneHideForAll(FMastenInfo[msten][EGmBhMastenZone]);
        GangZoneDestroy(FMastenInfo[msten][EGmBhMastenZone]);
        DestroyDynamicObject(FMastenInfo[msten][ID]);
        SendClientMessage(playerid, COLOR_YELLOW, "Funkmast entfernt!");
        SendClientMessage(playerid, COLOR_YELLOW, "Im Umkreis von "#MAX_TMASTENRANGE" Metern ist kein Handyempfang zu erreichen!");
        mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM networktowers WHERE id = '%d'",msten);
        mysql_tquery(sqlHandle, query);
        return 1;
    }
	return SendClientMessage(playerid, COLOR_RED, "An keinem Funkmasten.");
}