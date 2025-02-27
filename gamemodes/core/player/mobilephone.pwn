public HandyKlingelt(playerid,anruferid)
{
	if(anruferid == INVALID_PLAYER_ID || anruferid == 0 || SpielerInfo[anruferid][sHandy] == 0 || GetPVarInt(playerid,"WirdAngerufen") < 1)
	{
		DeletePVar(playerid,"RuftGeradeAn");
		DeletePVar(playerid,"TelefoniertMit");
		DeletePVar(playerid,"WirdAngerufen");
		DeletePVar(anruferid,"RuftGeradeAn");
		DeletePVar(anruferid,"WirdAngerufen");
		DeletePVar(anruferid,"TelefoniertMit");
		KillTimer(AnrufenTimer[playerid]); KillTimer(AnrufenTimer[anruferid]);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		SetPlayerSpecialAction(anruferid, SPECIAL_ACTION_NONE);
		return 1;
	}
	new stringx[200], Kontakt1[25], Kontakt2[25], Kontakt3[25], Kontakt4[25], Kontakt5[25], var[25];
    mysql_format(sqlHandle, stringx, sizeof(stringx),"SELECT Kontakt1, Kontakt2, Kontakt3, Kontakt4, Kontakt5 FROM `accounts` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
 	new Cache:result = mysql_query(sqlHandle, stringx);

	cache_get_value_name(0, "Kontakt1",var); format(Kontakt1,25,"%s",var);
	cache_get_value_name(0, "Kontakt2",var); format(Kontakt2,25,"%s",var);
	cache_get_value_name(0, "Kontakt3",var); format(Kontakt3,25,"%s",var);
	cache_get_value_name(0, "Kontakt4",var); format(Kontakt4,25,"%s",var);
	cache_get_value_name(0, "Kontakt5",var); format(Kontakt5,25,"%s",var);
    
    cache_delete(result);
    if(strfind(Kontakt1, SpielerInfo[playerid][sName], true) != -1 || strfind(Kontakt2, SpielerInfo[playerid][sName], true) != -1 ||
    strfind(Kontakt3, SpielerInfo[playerid][sName], true) != -1 || strfind(Kontakt4, SpielerInfo[playerid][sName], true) != -1 || strfind(Kontakt5, SpielerInfo[playerid][sName], true) != -1)
	{
	    format(stringx,sizeof(stringx),"[Handy]: {FFFFFF}Dein Kontakt '%s' versucht dich anzurufen. Benutze '/annehmen' um ranzugehen.",SpielerInfo[anruferid][sName]);
	}
	else format(stringx,sizeof(stringx),"[Handy]: {FFFFFF}Die Nummer '%i' versucht dich anzurufen. Benutze '/annehmen' um ranzugehen.",SpielerInfo[anruferid][sHandy]);
	SendClientMessage(playerid,COLOR_YELLOW,stringx);
	return 1;
}