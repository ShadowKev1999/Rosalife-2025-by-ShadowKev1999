CMD:contracts(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] != 19)return NichtBerechtigt
    new counter = 0;
	foreach(new i : Player)
	{
	    new string[128], str[144], Auftrag[24], var[64], Preis;
	    if(SpielerInfo[i][sContract] != 1)continue;
     	mysql_format(sqlHandle, string, sizeof(string),"SELECT * FROM `contracts` WHERE `Contract` = '%s'", SpielerInfo[i][sName]);
   	 	new Cache:result = mysql_query(sqlHandle, string);
		new rows = cache_num_rows();
		for(new c = 0; c < rows; c++)
		{
  			cache_get_value_name(c, "Preis",var); Preis = strval(var);
	    	cache_get_value_name(c, "Name",Auftrag);
	    	format(str, sizeof(str), "Auftraggeber: {FF0000}%s{FFFFFF} | Contract auf: {FF0000}%s{FFFFFF} | Belohnung: {FF0000}%d$", Auftrag, SpielerInfo[i][sName], Preis);
	    	SendClientMessage(playerid,COLOR_WHITE,str);
	    	counter++;
	    }
	    cache_delete(result);
	}
	if(counter == 0)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Zurzeit gibt es keine offene Contracts *");
 	}
	return 1;
}


CMD:contract(playerid,params[])
{
    new pID, Preis, query[144];
    if(SpielerInfo[playerid][sFraktion] == 19)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Als Hitman, kannst du auf niemanden einen Contract aussetzen.");
	if(GetPlayerScore(playerid) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Um ein Contract schreiben zu können, benötigst du das zweite Level.");
	if(sscanf(params,"dd",pID,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/contract [SpielerID/Name] [Preis]");
	if(playerid == pID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Contract auf dich selbst aussetzen.");
	if(Preis < 3000 || Preis > 25000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Contract muss zwischen 3.000$ und 25.000$ betragen.");
	if(GetPlayerMoneyEx(playerid) < Preis)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
	if(!IsPlayerConnectedEx(playerid))return NichtOnline
	if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Contract auf Bots aussetzen.");
	if(GetPlayerScore(pID) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Contract auf Neulinge unter Level 2 aussetzen.");
	if(CopHasBeenContracted == true)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst zurzeit keinen Contract auf diese Person aussetzen!");
    mysql_format(sqlHandle, query, 128, "SELECT `Contract` FROM `contracts` WHERE `Contract` = '%s'", SpielerInfo[pID][sName]);
   	new Cache:result = mysql_query(sqlHandle, query);

	if(cache_num_rows() > 0)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Auf den Spieler wurde bereits ein Contract ausgesetzt.");
		return 1;
	}
	else
	{
	    SpielerInfo[pID][sContract] = 1;
	    SetPVarInt(playerid,"NoPAYBACK",1);
	    GivePlayerMoneyEx(playerid,-Preis);
		mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `contracts` (`Name`, `Contract`, `Preis`) VALUES ('%s', '%s', '%d')", SpielerInfo[playerid][sName], SpielerInfo[pID][sName], Preis);
  		mysql_tquery(sqlHandle, query);
   		mysql_format(sqlHandle, query,sizeof(query),"UPDATE `accounts` SET `Contract`='1' WHERE `Name`='%s'",SpielerInfo[pID][sName]);
		mysql_tquery(sqlHandle, query);

		format(query,sizeof(query),"[Info]: {FFFFFF}Du hast erfolgreich ein Contract in Höhe von %d$ auf den Spieler %s ausgesetzt.",Preis, SpielerInfo[pID][sName]);
		SendClientMessage(playerid,COLOR_RED,query);

        if(SpielerInfo[pID][sFraktion] > 1 && SpielerInfo[pID][sFraktion] < 8)
        {
            CopHasBeenContracted = true;
            SetTimer("CopHasBeenContractedT", 900000, false);
        }

		foreach(new i : Player)
		{
		    if(SpielerInfo[i][sFraktion] != 19)continue;
		    format(query,sizeof(query),"[Info]: {FFFFFF}Spieler %s hat einen Contract in Höhe von %d$ auf den Spieler %s ausgesetzt.",SpielerInfo[playerid][sName], Preis, SpielerInfo[pID][sName]);
		    SendClientMessage(i,COLOR_INFO,query);
		}
	}
	cache_delete(result);
	return 1;
}