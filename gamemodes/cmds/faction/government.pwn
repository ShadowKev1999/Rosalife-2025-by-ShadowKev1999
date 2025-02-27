CMD:govmessage(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] == 1 && SpielerInfo[playerid][sRank] == 7)
	{
		new message[200];
		if(sscanf(params,"s[200]",message))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gov-message [Text]");
	    new string[250];
	    format(string,sizeof(string),"[Regierung]: Präsident %s: %s",SpielerInfo[playerid][sName],message);
	    SendClientMessageToAll(0xFF9600FF,string);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:setsteuern(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 1 && SpielerInfo[playerid][sRank] == 7)
	{
	    new taxes;
	    if(sscanf(params,"i",taxes))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setsteuern [geteilt durch X] (z.B. 20.000$ : 70 = 285$ Steuern)");
		if(taxes < 0 || taxes > 100)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Steuern müssen zwischen geteilt durch 1 und geteilt durch 100 liegen.");
		GovVars[govSteuern] = taxes;
		new string[128];
    	format(string,sizeof(string),"[Regierung]: Du hast die Steuern auf 'geteilt durch %d' geändert.",GovVars[govSteuern]);
    	SendClientMessage(playerid,COLOR_INFO,string);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:sethaussteuern(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 1 && SpielerInfo[playerid][sRank] == 7)
	{
	    new taxes;
	    if(sscanf(params,"i",taxes))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/sethaussteuern [geteilt durch X] (z.B. 450.000$ : 215 = 2.093$ Steuern)");
		if(taxes < 0 || taxes > 400)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Steuern müssen zwischen geteilt durch 1 und geteilt durch 400 liegen.");
		GovVars[govSteuernHaus] = taxes;
		new string[128];
    	format(string,sizeof(string),"[Regierung]: Du hast die Steuern auf 'geteilt durch %d' geändert.",GovVars[govSteuernHaus]);
    	SendClientMessage(playerid,COLOR_INFO,string);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:setkfzsteuern(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 1 && SpielerInfo[playerid][sRank] == 7)
	{
	    new taxes;
	    if(sscanf(params,"i",taxes))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setkfzsteuer [mal X pro Fahrzeug] (z.B. 2 Fahrzeuge * 400 = 800$ Steuern)");
		if(taxes < 0 || taxes > 1500)return SendClientMessage(playerid,COLOR_GREY,"[Info]: KFZ-Steuern müssen zwischen 1$ und 1.500 liegen.");
		GovVars[govSteuernKFZ] = taxes;
		new string[128];
    	format(string,sizeof(string),"[Regierung]: Du hast die KFZ-Steuern auf 'mal %d pro Fahrzeug' geändert.",GovVars[govSteuernKFZ]);
    	SendClientMessage(playerid,COLOR_INFO,string);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:govsenator(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] == 1 && SpielerInfo[playerid][sRank] == 7)
	{
		new pID;
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/govsenator [SpielerID]");
	    if(!IsPlayerConnectedEx(playerid))return NichtOnline
	    if(SpielerInfo[pID][sSenator] == 0)
	    {
			SpielerInfo[pID][sSenator] = 1;
			new string[128];
			format(string,sizeof(string),"[Regierung]: Der Präsident %s hat dich als Senator eingetragen.",SpielerInfo[playerid][sName]);
			SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"[Regierung]: Du hast %s als Senator eingetragen.",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_INFO,string);
		}
		else
		{
			SpielerInfo[pID][sSenator] = 0;
			new string[128];
			format(string,sizeof(string),"[Regierung]: Der Präsident %s hat dich als Senator ausgetragen.",SpielerInfo[playerid][sName]);
			SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"[Regierung]: Du hast %s als Senator ausgetragen.",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_INFO,string);
		}
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:govkasse(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] != 1)return NichtBerechtigt
 	new string[128];
 	format(string,sizeof(string),"[Regierung]: Die Staatskasse beträgt $%d.",GovVars[govKasse]);
  	SendClientMessage(playerid,COLOR_INFO,string);
	return 1;
}