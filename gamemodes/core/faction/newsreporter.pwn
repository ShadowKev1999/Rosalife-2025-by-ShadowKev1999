stock getNewsSlot()
{
    for(new i = 0; i < MAX_NEWS_PAPER; i++)
	{
	    if(NewsPaper[i][dbID] == ServerLager[it_lager_newspaper_id])return i;
	}
	return -1;
}

stock getEmptyNewsPaperSlot()
{
	for(new i = 0; i < MAX_NEWS_PAPER; i++)
	{
	    if(NewsPaper[i][SlotUsed] == 1)continue;
	    return i;
	}
	return -1;
}

stock getNextFreeLine(newsPaperId)
{
	for(new i = 0;i < MAX_LINES_NEWSPAPER; i++)
	{
	    if(NewsPaperLine[newsPaperId][i] == 1)continue;
	    return i;
	}
	return -1;
}

stock ShowNewsPaperCreation(playerid)
{
	new longstring[256], string[32], news_var = GetPVarInt(playerid, "NewNewspaper");
	if(NewsPaper[news_var][Lines] != MAX_LINES_NEWSPAPER)
    {
		strcat(longstring, "Zeile hinzufügen\n");
	}
	for(new i = 0; i < MAX_LINES_NEWSPAPER; i++)
 	{
 	    if(NewsPaperLine[news_var][i] == 0)continue;
 	    format(string, sizeof(string),"Zeile %i belegt", i+1);
 	    strcat(longstring, string);
	}
	strcat(longstring, "Zeitung erstellen");
	return ShowPlayerDialog(playerid, DIALOG_CREATION_NEWSPAPER, DIALOG_STYLE_LIST, NewsPaper[news_var][Title], longstring, "Auswählen", "Abbrechen");
}

stock LoadServerLager()
{
	new var[24], Text[128];
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `serverlager` ORDER BY `id` ASC");

	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "drucker_farbe",var); ServerLager[drucker_farbe] = strval(var);
		cache_get_value_name(i, "drucker_papier",var); ServerLager[drucker_papier] = strval(var);

		cache_get_value_name(i, "it_lager_papier",var); ServerLager[it_lager_papier] = strval(var);
		cache_get_value_name(i, "it_lager_farbe",var); ServerLager[it_lager_farbe] = strval(var);
		cache_get_value_name(i, "it_lager_newspaper",var); ServerLager[it_lager_newspaper] = strval(var);
		cache_get_value_name(i, "it_lager_newspaper_id",var); ServerLager[it_lager_newspaper_id] = strval(var);
		cache_get_value_name(i, "it_newspaper_price",var); ServerLager[it_newspaper_price] = strval(var);
	}

	cache_delete(result);

	format(Text, sizeof(Text), "{FF6600}Interglobal Televison\n{FFCC99}Druckerfarben Lager\n%i/%i\n/getfarbe", ServerLager[drucker_farbe], MAX_DRUCKER_FARBE_IN_LAGER);
	ServerLager[druckerfarbe_label] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, DRUCKER_FARBEN_LAGER_POS+0.2, 10.0);
    CreatePickup(1580, 23, DRUCKER_FARBEN_LAGER_POS, -1);

	format(Text, sizeof(Text), "{FF6600}Interglobal Televison\n{FFCC99}Druckerpapier Lager\n%i/%i\n/getpapier", ServerLager[drucker_papier], MAX_DRUCKER_PAPIER_IN_LAGER);
	ServerLager[druckerpapier_label] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, DRUCKER_PAPIER_LAGER_POS+0.2, 10.0);
	CreatePickup(1575, 23, DRUCKER_PAPIER_LAGER_POS, -1);

	format(Text, sizeof(Text), "{FF6600}Interglobal Televison - Lager\n{FFCC99}Druckerfarbe: %i\nDruckerpapier: %i\nZeitungen: %i",
	ServerLager[it_lager_farbe], ServerLager[it_lager_papier], ServerLager[it_lager_newspaper]);
	ServerLager[it_lager_label] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, IT_LAGER_POS+0.2, 10.0);
	CreatePickup(2969, 23, IT_LAGER_POS, -1);

	format(Text, sizeof(Text), "{FF6600}Interglobal Televison - Lager\n{FFCC99}Zeitungen: %i\n/getnewspaper",ServerLager[it_lager_newspaper]);
	ServerLager[it_newspaper_lager_label] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, NEWSPAPER_GET_POS+0.2, 10.0);
	CreatePickup(2813, 23, NEWSPAPER_GET_POS, -1);

	print("Das Server Lager wurden erfolgreich geladen.");
}

stock SaveServerLager()
{
    new query[230];
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `serverlager` SET `drucker_farbe`='%d', `drucker_papier`='%d', `it_lager_papier`='%d', `it_lager_farbe`='%d', `it_lager_newspaper`='%d', `it_lager_newspaper_id`='%d', `it_newspaper_price`='%d'  WHERE `id`='1'",
	ServerLager[drucker_farbe],ServerLager[drucker_papier],ServerLager[it_lager_papier],ServerLager[it_lager_farbe], ServerLager[it_lager_newspaper], ServerLager[it_lager_newspaper_id], ServerLager[it_newspaper_price]);
	mysql_tquery(sqlHandle, query);
	return 1;
}

stock isNewsLive(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 6.0,656.7354,-1352.5840,1695.4037))return 1;
	new pvehicleid = GetPlayerVehicleID(playerid);
	if(pvehicleid == 0)return 0;
	foreach(new i : Player)
    {
        if(GetPVarInt(i,"News_Live") == 1)
        {
            if(GetPlayerVehicleID(i) == pvehicleid)
            {
                return 1;
            }
        }
	}
	return 0;
}

stock sendNewsMessage(const message[])
{
	foreach(new i : Player)
    {
	   	SendClientMessage(i,COLOR_NEWS,message);
    }
	return;
}