CMD:service(playerid, params[])
{
	if(SpielerInfo[playerid][sHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
	ShowPlayerDialog(playerid,DIALOG_SERVICE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Service","Polizei\nFBI\nFeuerwehr\nNotarzt\nOrdnungsamt (auch Mechaniker)","Weiter","Abbrechen");
 	return 1;
}

CMD:kontakte(playerid, params[])
{
	if(SpielerInfo[playerid][sHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
 	if(SpielerInfo[playerid][icpHandy] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dein Handy ist ausgeschaltet.");
  	new string[500], Kontakt1[25], Kontakt2[25], Kontakt3[25], Kontakt4[25], Kontakt5[25], var[25];
  	mysql_format(sqlHandle, string, sizeof(string),"SELECT Kontakt1, Kontakt2, Kontakt3, Kontakt4, Kontakt5 FROM `accounts` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
 	new Cache:result = mysql_query(sqlHandle, string);

	cache_get_value_name(0, "Kontakt1",var); format(Kontakt1,25,"%s",var);
	cache_get_value_name(0, "Kontakt2",var); format(Kontakt2,25,"%s",var);
	cache_get_value_name(0, "Kontakt3",var); format(Kontakt3,25,"%s",var);
	cache_get_value_name(0, "Kontakt4",var); format(Kontakt4,25,"%s",var);
	cache_get_value_name(0, "Kontakt5",var); format(Kontakt5,25,"%s",var);
    
    cache_delete(result);
    format(string,sizeof(string),"%s\n%s\n%s\n%s\n%s",Kontakt1,Kontakt2,Kontakt3,Kontakt4,Kontakt5);
    ShowPlayerDialog(playerid,DIALOG_KONTAKTE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Handy - Kontakte",string,"Weiter","Abbrechen");
    return 1;
}
CMD:guthaben(playerid, params[])
{
	new string[128];
 	if(SpielerInfo[playerid][sHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
  	format(string,sizeof(string),"[Handy]: {FFFFFF}Dein aktuelles Guthaben beträgt: %d$",SpielerInfo[playerid][sGuthaben]);
   	SendClientMessage(playerid,COLOR_YELLOW,string);
    return 1;
}


CMD:anrufen(playerid,params[])
{
	if(SpielerInfo[playerid][sHandy] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
	if(SpielerInfo[playerid][icpHandy] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Schalte dein Handy per '/icp' erst an.");
 	if(SpielerInfo[playerid][sGuthaben] < 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Kosten eines Anrufs: 6$. Dein Guthaben reicht nicht aus.");
	if(GetPVarInt(playerid,"TelefoniertMit") > 0 || GetPVarInt(playerid,"WirdAngerufen") > 0 || GetPVarInt(playerid,"RuftGeradeAn") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Leitung ist bereits belegt.");
	new nummer;
	if(sscanf(params,"i",nummer))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/anrufen [Nummer]");
	new bool:merker = false;
	foreach(new i : Player)
	{
	    if(SpielerInfo[i][sHandy] != nummer || i == playerid)continue;
		merker = true;
		if(SpielerInfo[i][icpHandy] < 1)return SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Das Handy des anzurufenden ist ausgeschaltet.");
		if(GetPVarInt(i,"TelefoniertMit") > 0)return SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Die Leitung ist zurzeit besetzt.");
		SetPVarInt(playerid,"RuftGeradeAn",i);
		SetPVarInt(i,"WirdAngerufen",playerid);
		SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Nummer wird gewählt... (-3$ Guthaben)");
		HandyKlingelt(i,playerid);
		AnrufenTimer[i] = SetTimerEx("HandyKlingelt", 7000, true, "ii", i, playerid);
		SpielerInfo[playerid][sGuthaben] -= 6;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	}
	if(merker == false)return SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Kein Anschluss über diese Nummer.");
	return 1;
}
alias:anrufen("call")

CMD:pickup(playerid,params[])
{
	if(SpielerInfo[playerid][sHandy] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
	if(GetPVarInt(playerid,"WirdAngerufen") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du wirst nicht angerufen.");
	new pID = GetPVarInt(playerid,"WirdAngerufen");
	SetPVarInt(playerid,"TelefoniertMit",GetPVarInt(playerid,"WirdAngerufen"));
	SetPVarInt(GetPVarInt(playerid,"WirdAngerufen"),"TelefoniertMit",playerid);
	SendClientMessage(GetPVarInt(playerid,"WirdAngerufen"),COLOR_YELLOW,"[Handy]: {FFFFFF}Anruf angenommen.");
	SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Anruf angenommen.");
	DeletePVar(playerid,"RuftGeradeAn");
	DeletePVar(playerid,"WirdAngerufen");
	DeletePVar(pID,"RuftGeradeAn");
	DeletePVar(pID,"WirdAngerufen");
	KillTimer(AnrufenTimer[playerid]); KillTimer(AnrufenTimer[pID]);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
	return 1;
}
alias:pickup("annehmen")

CMD:auflegen(playerid,params[])
{
	if(SpielerInfo[playerid][sHandy] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
	if(GetPVarInt(playerid,"TelefoniertMit") < 1 && GetPVarInt(playerid,"WirdAngerufen") < 1 && GetPVarInt(playerid,"RuftGeradeAn") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Leitung ist bereits frei.");
 	new pID;
 	if(GetPVarInt(playerid,"TelefoniertMit") > 0){pID = GetPVarInt(playerid,"TelefoniertMit");}
 	else if(GetPVarInt(playerid,"WirdAngerufen") > 0){pID = GetPVarInt(playerid,"WirdAngerufen");}
 	else if(GetPVarInt(playerid,"RuftGeradeAn") > 0){pID = GetPVarInt(playerid,"RuftGeradeAn");}
	SendClientMessage(playerid,COLOR_YELLOW,"[Handy]: {FFFFFF}Aufgelegt.");
	SendClientMessage(GetPVarInt(playerid,"TelefoniertMit"),COLOR_YELLOW,"[Handy]: {FFFFFF}Aufgelegt.");
	DeletePVar(playerid,"RuftGeradeAn");
	DeletePVar(playerid,"TelefoniertMit");
	DeletePVar(playerid,"WirdAngerufen");
	DeletePVar(pID,"RuftGeradeAn");
	DeletePVar(pID,"WirdAngerufen");
	DeletePVar(pID,"TelefoniertMit");
	KillTimer(AnrufenTimer[playerid]); KillTimer(AnrufenTimer[pID]);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	SetPlayerSpecialAction(pID, SPECIAL_ACTION_STOPUSECELLPHONE);
	return 1;
}

CMD:sms(playerid,params[])
{
	new Nummer, merker = true, Text[128], string[144];
	if(SpielerInfo[playerid][sHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Handy.");
	if(SpielerInfo[playerid][sGuthaben] < 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Kosten einer SMS: 3$. Dein Guthaben reicht nicht aus.");
    if(sscanf(params,"ds[128]",Nummer,Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/sms [Handynummer] [Text]");
    foreach(new i : Player)
	{
		if(SpielerInfo[i][sHandy] == Nummer)
		{
		    if(SpielerInfo[i][icpHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine SMS konnte nicht zugestellt werden, da das Handy vom Spieler ausgeschaltet ist.");
			SpielerInfo[playerid][sGuthaben] -= 3;
			format(string,sizeof(string),"SMS von %s: %s",SpielerInfo[playerid][sName],Text);
			SendClientMessage(i,COLOR_YELLOW,string);
			SendClientMessage(playerid,COLOR_SUPER,"Deine SMS wurde erfolgreich zugestellt. Kosten: 3$");
		    merker = false;
		}
	}
	if(merker)
	{
	    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die SMS konnte nicht zugestellt werden.");
	    return 1;
	}
	return 1;
}

CMD:nummer(playerid,params[])
{
	new pID, string[144];
	if(SpielerInfo[playerid][sTelefonbuch] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Telefonbuch.");
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/nummer [SpielerID/Name]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(SpielerInfo[pID][sHandy] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein Handy.");
    format(string,sizeof(string),"Name: {FF0000}%s{FFFFFF} | Handynummer: {FF0000}%d",SpielerInfo[pID][sName],SpielerInfo[pID][sHandy]);
    SendClientMessage(playerid,COLOR_WHITE,string);
	return 1;
}
alias:nummer("number")