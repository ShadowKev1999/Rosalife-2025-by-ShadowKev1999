stock GivePlayerEXP(playerid,Anzahl)
{
	new newAnzahl = Anzahl;
	if(GlobalVars[DoubleEXP] == true)
	{
	    newAnzahl += Anzahl;
	    SendClientMessage(playerid,COLOR_INFO,"[Double-EXP]: {FFFFFF}Doppelte Menge EXP dank aktivem Double-EXP Event.");
	}
	SpielerInfo[playerid][sEXP] += newAnzahl;
	new string[128];
	format(string,sizeof(string),"~g~+%d EXP",newAnzahl);
	PlayerTextDrawSetString(playerid, PlusMinusTD[playerid], string);
	PlayerTextDrawShow(playerid, PlusMinusTD[playerid]);
	SetTimerEx("PlusMinusHide",2000,false,"i",playerid);

	format(string,sizeof(string),"%s hat %d EXP erhalten.",SpielerInfo[playerid][sName],newAnzahl);
	CreateServerLogEntry("EXP_LOG", string);
	if(SpielerInfo[playerid][sEXP] >= SpielerInfo[playerid][sEXPNeeded])
	{
	    PlayAudioStreamForPlayer(playerid,"https://"SERV_WURL"/sounds/levelup.mp3");
		PlayerTextDrawShow(playerid, LevelUP[playerid]);
		SetPVarInt(playerid,"LevelUpTime",1);
		SetTimerEx("LevelUpPlayer",1000,false,"i",playerid);
		if(SpielerInfo[playerid][sVIP] > 0)
		{
			SpielerInfo[playerid][sEXP] = SpielerInfo[playerid][sEXP]-SpielerInfo[playerid][sEXPNeeded];
			SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Da du VIP bist wurden dir die überschüssigen erhaltenen EXP nicht abgezogen.");
		}
		else SpielerInfo[playerid][sEXP] = 0;
		SpielerInfo[playerid][sEXPNeeded] = ExpInfo[GetPlayerScore(playerid)][eExp];
	    mysql_SetInt("accounts", "EXPNeeded", SpielerInfo[playerid][sEXPNeeded], "Name", SpielerInfo[playerid][sName]);
	}
	format(string,sizeof(string),"EXP: %d / %d",SpielerInfo[playerid][sEXP],SpielerInfo[playerid][sEXPNeeded]);
	PlayerTextDrawSetString(playerid, EXPInfo[playerid], string);
	return 1;
}

stock LoadEXPStatus(playerid)
{
    new string[128];
	format(string,sizeof(string),"EXP: %d / %d",SpielerInfo[playerid][sEXP],SpielerInfo[playerid][sEXPNeeded]);
	PlayerTextDrawSetString(playerid, EXPInfo[playerid], string);
    PlayerTextDrawShow(playerid, EXPInfo[playerid]);
    return 1;
}