CMD:adsperre(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Grund[64], string[224], Minuten;
	if(sscanf(params,"uis[64]",pID,Minuten,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/adsperre [SpielerID] [Minuten] [Grund]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat den Spieler %s für %d Minute(n) von der Werbung ausgeschlossen. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Minuten,Grund);
	SendICPMsg(string);
	format(string,128,"%s %s hat dich für %d Minute(n) von der Werbung ausgeschlossen. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund);
	SendClientMessage(pID,COLOR_RED,string);
	WerbungSperre(pID,Minuten);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/adsperre' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:adentsperre(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/adentsperre [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat den Spieler %s für die Werbung wieder freigegeben.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	SendICPMsg(string);
	format(string,128,"%s %s hat dich für die Werbung wieder freigegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	SpielerInfo[pID][sADSperre] = 0;
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/adentsperre' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:mute(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Grund[64], string[224], Minuten;
	if(sscanf(params,"uis[64]",pID,Minuten,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/mute [SpielerID] [Minuten] [Grund]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat den %s für %d Minute(n) gemutet. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Minuten,Grund);
	SendICPMsg(string);
	format(string,128,"%s %s hat dich für %d Minute(n) gemutet. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund);
	SendClientMessage(pID,COLOR_RED,string);
	MutePlayer(pID,Minuten);
	return 1;
}

CMD:unmute(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/unmute [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat den %s entmutet.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	SendICPMsg(string);
	format(string,128,"%s %s hat dich entmutet.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	SpielerInfo[pID][sMuted] = 0;
	return 1;
}

CMD:freeze(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/frezze [SpielerID]");
    if(GetPVarInt(pID,"Freezed") == 0)
    {
	    TogglePlayerControllable(pID,false);
		format(string,128,"%s %s hat dich gefreezt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessage(pID,COLOR_RED,string);
		format(string,128,"Du hast %s gefreezt.",SpielerInfo[pID][sName]);
		SendClientMessage(playerid,COLOR_RED,string);
		SetPVarInt(pID,"Freezed",1);
	}
	else
	{
		TogglePlayerControllable(pID,true);
		format(string,128,"%s %s hat dich entfreezt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessage(pID,COLOR_RED,string);
		format(string,128,"Du hast %s entfreezt.",SpielerInfo[pID][sName]);
		SendClientMessage(playerid,COLOR_RED,string);
		DeletePVar(pID,"Freezed");
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/freeze' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:spec(playerid,params[])
{
	new pID,string[128];
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	if(GetPVarInt(playerid,"SpectateMode") == 0)
	{
	    if(SpielerInfo[playerid][sSpectate] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du spectatest bereits einen Spieler.");
	    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/spec [SpielerID/Name]");
    	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich nicht selber Spectaten.");
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das kannst keinen Bot Spectaten.");
		if(SpielerInfo[pID][sSpectate] != 0)
		{
			format(string,sizeof(string),"[Info]: {FFFFFF}%s %s spectatet bereits %s %s.",AdminName(pID),SpielerInfo[pID][sName],AdminName(SpielerInfo[pID][sSpectate]),SpielerInfo[SpielerInfo[pID][sSpectate]][sName]);
			SendClientMessage(playerid,COLOR_RED,string);
		    return 1;
		}
		GetPlayerPos(playerid,SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ]);
		SetPlayerVirtualWorld(playerid, GetPlayerVirtualWorld(pID));
	    SetPlayerInterior(playerid, GetPlayerInterior(pID));
		SendClientMessage(playerid,COLOR_INFO,"Hinweis: Benutze erneut '/spec' um das spionieren abzubrechen.");
		format(string,sizeof(string),"Du spionerst jetzt %s (ID:%d) aus.",SpielerInfo[pID][sName],pID);
		SendClientMessage(playerid,COLOR_SUPER,string);
		SetPlayerInterior(playerid,GetPlayerInterior(pID));
	 	SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(pID));
	   	TogglePlayerSpectating(playerid,true);
	   	if (IsPlayerInAnyVehicle(pID))
        PlayerSpectateVehicle(playerid, GetPlayerVehicleID(pID));
	   	SpielerInfo[playerid][sSpectate] = pID;
	   	SetPVarInt(playerid,"SpectateMode",1);
	   	SetPVarInt(pID,"SpectateVon",playerid);
	   	format(string,sizeof(string),"~y~Spieler: ~w~%s (id: %d) ~n~~y~Bargeld: ~w~%d$ ~n~~y~Bank: ~w~%d$",SpielerInfo[pID][sName],pID,GetPlayerMoneyEx(pID),SpielerInfo[pID][sBankkonto]);
	   	PlayerTextDrawSetString(playerid, SpectateTD[playerid], string);
	   	PlayerTextDrawShow(playerid, SpectateTD[playerid]);
	   	return 1;
	}
	else
	{
		TogglePlayerSpectating(playerid,false);
		SetPlayerPos(playerid,SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ]);
		SetPlayerVirtualWorld(playerid,SpielerInfo[playerid][sVirtualWorld]);
		SetPlayerInterior(playerid,SpielerInfo[playerid][sInterior]);
		SendClientMessage(playerid,COLOR_INFO,"Du spectatest nun nicht mehr.");
	    DeletePVar(playerid,"SpectateMode");
	    DeletePVar(SpielerInfo[playerid][sSpectate],"SpectateVon");
	    SpielerInfo[playerid][sSpectate] = 0;
	    PlayerTextDrawHide(playerid, SpectateTD[playerid]);
	    return 1;
	}
}

CMD:clearchat(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new string[128];
 	foreach(new i : Player)
	{
	    ClearChat(i,100);
	}
	format(string,128,"%s %s hat den Chat geleert.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessageToAll(COLOR_INFO,string);
	return 1;
}

CMD:hidetd(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
 	if(GetPVarInt(playerid,"TextDrawHiding") < 1)
  	{
		if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
  		TextDrawHideForPlayer(playerid, Statusleiste[0]); TextDrawHideForPlayer(playerid, Statusleiste[1]); TextDrawHideForPlayer(playerid, Statusleiste[2]); TextDrawHideForPlayer(playerid, Statusleiste[3]);
    	TextDrawHideForPlayer(playerid, Time); TextDrawHideForPlayer(playerid, StatusWerbung); TextDrawHideForPlayer(playerid, DoubleEXPTD[0]); TextDrawHideForPlayer(playerid, DoubleEXPTD[1]);
	    TextDrawHideForPlayer(playerid, AlsAdminImDienst); PlayerTextDrawHide(playerid, EXPInfo[playerid]); PlayerTextDrawHide(playerid, WantedDraw[playerid]);
		PlayerTextDrawHide(playerid, SpielerInfo[playerid][ptPayDay]);
		TextDrawHideForPlayer(playerid, gTD_Location[playerid]);
		hideMoneyDraw(playerid);
		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Textdraws ausgeblendet.");
		SetPVarInt(playerid,"TextDrawHiding",1);
	}
	else
	{
 		TextDrawShowForPlayer(playerid, Statusleiste[0]); TextDrawShowForPlayer(playerid, Statusleiste[1]); TextDrawShowForPlayer(playerid, Statusleiste[2]); TextDrawShowForPlayer(playerid, Statusleiste[3]);
   		TextDrawShowForPlayer(playerid, Time); TextDrawShowForPlayer(playerid, StatusWerbung); TextDrawShowForPlayer(playerid, DoubleEXPTD[0]); TextDrawShowForPlayer(playerid, DoubleEXPTD[1]);
	    TextDrawShowForPlayer(playerid, AlsAdminImDienst); PlayerTextDrawShow(playerid, EXPInfo[playerid]); PlayerTextDrawShow(playerid, WantedDraw[playerid]);
		PlayerTextDrawShow(playerid, SpielerInfo[playerid][ptPayDay]);
		TextDrawShowForPlayer(playerid, gTD_Location[playerid]);
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Textdraws eingeblendet.");
		showMoneyDraw(playerid);
	    DeletePVar(playerid,"TextDrawHiding");
	}
 	return 1;
}

CMD:delad(playerid, params[]) //anfang
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	if(GlobalVars[WerbungAktiv] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es wurde keine Werbung erstellt.");
 	new string[128];
  	format(string,sizeof(string),"%s %s hat die Werbung gelöscht.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendICPMsg(string);
	GlobalVars[WerbungAktiv] = 0;
	TextDrawSetString(StatusWerbung, "~g~Werbung: ~w~Keine - Benutze /ad um eine Werbung zu schalten.");
	return 1;
}
CMD:tog(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
 	new string[264];
  	format(string,sizeof(string),"{FFFFFF}Typ\tStatus\nOOC Chat:\t[%s]\nWerbung Aus:\t[%s]\nDouble EXP:\t[%s]\nOster-Event:\t[%s]\nHalloween-Event:\t[%s]\nWinter-Modus:\t[%s]", JaNein(GlobalVars[OOC]), JaNein(GlobalVars[Werbung]), JaNein(GlobalVars[DoubleEXP]), JaNein(GlobalVars[EasterEvent]), JaNein(GlobalVars[HalloweenEvent]),JaNein(GlobalVars[WinterMode]));
	ShowPlayerDialog(playerid,DIALOG_TOG,DIALOG_STYLE_TABLIST_HEADERS, "{007DFF}"SERV_NAME"{FFFFFF} - Adminverwaltung", string, "Weiter", "Schließen");
	return 1;
}

CMD:gotomark(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
 	if(!GetPVarInt(playerid,"MapMarkerSetted"))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es wurde noch kein Map-Marker (erneut) gesetzt.");
  	DeletePVar(playerid,"MapMarkerSetted");
	SetPlayerPos(playerid,SpielerInfo[playerid][sAdminClickedMap][0],SpielerInfo[playerid][sAdminClickedMap][1],SpielerInfo[playerid][sAdminClickedMap][2] + 2.5);
	if(IsPlayerInAnyVehicle(playerid))
	{
 		SetVehiclePos(tmpcar,SpielerInfo[playerid][sAdminClickedMap][0],SpielerInfo[playerid][sAdminClickedMap][1],SpielerInfo[playerid][sAdminClickedMap][2] + 2.5);
   		LinkVehicleToInterior(tmpcar,0);
	    SetVehicleVirtualWorld(tmpcar,0);
	    PutPlayerInVehicle(playerid, tmpcar, 0);
	}
	SendClientMessage(playerid,COLOR_YELLOW,"[Info]: {FFFFFF}Du hast dich geportet. Der Map-Marker-Eintrag wurde gelöscht.");
	new string[128];
	format(string,sizeof(string),"%s %s hat dich zur Position %.2f %.2f %.2f geportet.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[playerid][sAdminClickedMap][0],SpielerInfo[playerid][sAdminClickedMap][1],SpielerInfo[playerid][sAdminClickedMap][2]);
	CreateServerLogEntry("GOTOMARK_LOG", string);
	return 1;
}
CMD:marker(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
 	if(GetPVarInt(playerid,"MarkerSetted") < 1)
  	{
		GetPlayerPos(playerid, markerX[playerid], markerY[playerid], markerZ[playerid]);
		GetPlayerFacingAngle(playerid,markerA[playerid]);
		markerInt[playerid] = GetPlayerInterior(playerid);
		markerVw[playerid] = GetPlayerVirtualWorld(playerid);
  		SetPVarInt(playerid,"MarkerSetted",1);
    	SendClientMessage(playerid,COLOR_YELLOW,"[Info]: {FFFFFF}Marker gesetzt. Benutze '/marker' um dich auf diese Position zu porten.");
     	return 1;
    }
    else if(GetPVarInt(playerid,"MarkerSetted") > 0)
    {
    	SetPlayerPos(playerid, markerX[playerid], markerY[playerid], markerZ[playerid]);
     	SetPlayerFacingAngle(playerid,markerA[playerid]);
      	SetPlayerInterior(playerid, markerInt[playerid]);
       	SetPlayerVirtualWorld(playerid, markerVw[playerid]);
        if(IsPlayerInAnyVehicle(playerid))
		{
  			SetVehiclePos(tmpcar,markerX[playerid], markerY[playerid], markerZ[playerid]+5);
	    	SetVehicleZAngle(tmpcar,markerA[playerid]);
		    LinkVehicleToInterior(tmpcar,0);
		    SetVehicleVirtualWorld(tmpcar,0);
		    PutPlayerInVehicle(playerid, tmpcar, 0);
		}
  		SendClientMessage(playerid,COLOR_YELLOW,"[Info]: {FFFFFF}Du hast dich geportet. Der Marker-Eintrag wurde gelöscht.");
    	DeletePVar(playerid,"MarkerSetted");
     	return 1;
    }
    return 1;
}

CMD:namechange(playerid,params[])
{
    if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
    new pID;
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/namechange [SpielerID]");
    new ncstring[300];
    format(ncstring,sizeof(ncstring),"{FFFFFF}%s %s hat dir ein Namechange-Ticket gegeben.\nDu kannst jetzt deinen neuen Namen einfach unten in das Feld eintippen und auf 'Weiter' klicken.",AdminName(playerid),SpielerInfo[playerid][sName]);
	ShowPlayerDialog(pID,DIALOG_NAMECHANGE,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - Namensänderung",ncstring,"Weiter","Abbrechen");
	SetPVarInt(pID,"NameChangeGiver",playerid);
	format(ncstring,sizeof(ncstring),"[Info]: {FFFFFF}Du hast %s ein Namechange-Ticket gegeben. Warte auf Antwort vom System...",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,ncstring);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/namechange' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:acheck(playerid,params[])
{
	if(GetPVarInt(playerid,"AdminMachtACHECK") == 0)
	{
		new pID;
		if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/acheck [SpielerID]");
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene ID ist einem Bot zugewiesen.");
		ShowStats(playerid,pID);
		new string[128];
		SendClientMessage(playerid,COLOR_INFO," ");
		format(string,sizeof(string),"Finanzcheck von %s ergab: %d$ Bargeld & %d$ Girokonto",SpielerInfo[pID][sName],GetPlayerMoneyEx(pID),SpielerInfo[pID][sBankkonto]);
		SendClientMessage(playerid,COLOR_INFO,string);
		SetPVarInt(playerid,"AdminMachtACHECK",1);
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/acheck' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
	else
	{
	    DeletePVar(playerid,"AdminMachtACHECK");
	    HideStatsTextDraws(playerid);
		return 1;
	}
}

CMD:apn(playerid,params[])
{
    if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
    new string[144], pID, text[128];
	if(sscanf(params,"us[128]",pID,text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/apn [SpielerID] [Text]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,sizeof(string),"[ADM-NACHRICHT] %s %s: %s",AdminName(playerid),SpielerInfo[playerid][sName],text);
	SendClientMessage(playerid,COLOR_GANGFIGHT,string);
	SendClientMessage(pID,COLOR_GANGFIGHT,string);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/apn' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:spawn(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/spawn [SpielerID]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    format(string,128,"%s %s hat dich gespawnt.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_SUPER,string);
	format(string,128,"Du hast %s gespawnt.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,string);
	SpawnPlayerEx(pID);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/spawn' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:slap(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/slap [SpielerID]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
	GetPlayerPos(pID,SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ]);
	SetPlayerPos(pID,SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ]+10);
	format(string,128,"%s %s hat dich geslappt.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	format(string,128,"Du hast %s geslappt.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_RED,string);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/slap' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:setskin(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, SkinID, string[128];
	if(sscanf(params,"ui",pID,SkinID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setskin [SpielerID]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat dir die SkinID: %d gesetzt.",AdminName(playerid),SpielerInfo[playerid][sName],SkinID);
	SendClientMessage(pID,COLOR_SUPER,string);
	format(string,128,"Du hast %s die SkinID: %d gesetzt.",SpielerInfo[pID][sName],SkinID);
	SendClientMessage(playerid,COLOR_SUPER,string);
	SetPlayerSkin(pID,SkinID);
	mysql_SetInt("accounts", "SkinID", SkinID, "Name", SpielerInfo[pID][sName]);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/setskin' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:gotoort(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new Ort[3];
	if(sscanf(params,"s[3]",Ort))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /gotoort [LS|SF|LV|MC]");
	if(strcmp(Ort, "LS", true, strlen(Ort)) == 0)
    {
	    SetPlayerPos(playerid,2041.5601,-1726.4623,13.2513);
	    SetPlayerFacingAngle(playerid,179.1141);
	    SetCameraBehindPlayer(playerid);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		if(IsPlayerInAnyVehicle(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
		    SetVehiclePos(tmpcar,2041.5601,-1726.4623,13.2513+5);
		    SetVehicleZAngle(tmpcar,179.1141);
		    LinkVehicleToInterior(tmpcar,0);
		    SetVehicleVirtualWorld(tmpcar,0);
		    PutPlayerInVehicle(playerid, tmpcar, 0);
		}
	}
	else if(strcmp(Ort, "SF", true, strlen(Ort)) == 0)
    {
	    SetPlayerPos(playerid,-2248.2539,-161.2652,34.9977);
	    SetPlayerFacingAngle(playerid,0.6259);
	    SetCameraBehindPlayer(playerid);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		if(IsPlayerInAnyVehicle(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
		    SetVehiclePos(tmpcar,-2248.2539,-161.2652,34.9977+5);
		    SetVehicleZAngle(tmpcar,0.6259);
		    LinkVehicleToInterior(tmpcar,0);
		    SetVehicleVirtualWorld(tmpcar,0);
		    PutPlayerInVehicle(playerid, tmpcar, 0);
		}
	}
	else if(strcmp(Ort, "LV", true, strlen(Ort)) == 0)
    {
	    SetPlayerPos(playerid,2068.7690,1761.4879,10.3772);
	    SetPlayerFacingAngle(playerid,152.6356);
	    SetCameraBehindPlayer(playerid);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		if(IsPlayerInAnyVehicle(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
		    SetVehiclePos(tmpcar,2068.7690,1761.4879,10.3772+5);
		    SetVehicleZAngle(tmpcar,358.8096);
		    LinkVehicleToInterior(tmpcar,0);
		    SetVehicleVirtualWorld(tmpcar,0);
		    PutPlayerInVehicle(playerid, tmpcar, 0);
		}
	}
	else if(strcmp(Ort, "MC", true, strlen(Ort)) == 0)
    {
	    SetPlayerPos(playerid,-2246.5522,-1713.1758,480.1397);
	    SetPlayerFacingAngle(playerid,45.5076);
	    SetCameraBehindPlayer(playerid);
		SetPlayerInterior(playerid,0);
		SetPlayerVirtualWorld(playerid,0);
		if(IsPlayerInAnyVehicle(playerid))
		{
			new tmpcar = GetPlayerVehicleID(playerid);
		    SetVehiclePos(tmpcar,-2246.5522,-1713.1758,480.1397+5);
		    SetVehicleZAngle(tmpcar,45.5076);
		    LinkVehicleToInterior(tmpcar,0);
		    SetVehicleVirtualWorld(tmpcar,0);
		    PutPlayerInVehicle(playerid, tmpcar, 0);
		}
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/gotoort' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:goto(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/goto [SpielerID]");
 	if(!IsPlayerConnectedEx(pID))return NichtOnline
	new Float: pX, Float: pY, Float: pZ;
	format(string,128,"Du hast dich zum %s %s geportet.",AdminName(pID),SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,128,"%s %s hat sich zu dir geportet.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_SUPER,string);
	GetPlayerPos(pID,pX,pY,pZ);
	SetPlayerPos(playerid,pX+1,pY,pZ);
	SetPlayerInterior(playerid,GetPlayerInterior(pID));
	SetPlayerVirtualWorld(playerid,GetPlayerVirtualWorld(pID));
	if(IsPlayerInAnyVehicle(playerid))
	{
		new tmpcar = GetPlayerVehicleID(playerid);
	    SetVehiclePos(tmpcar,pX,pY,pZ+2);
	    LinkVehicleToInterior(tmpcar,GetPlayerInterior(pID));
	    SetVehicleVirtualWorld(tmpcar,GetPlayerVirtualWorld(pID));
	    PutPlayerInVehicle(playerid, tmpcar, 0);
	    AddTuning(tmpcar);
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/goto' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:gethere(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gethere [SpielerID]");
 	if(!IsPlayerConnectedEx(pID))return NichtOnline
	new Float: pX, Float: pY, Float: pZ;
	format(string,128,"%s %s hat dich zu sich geportet.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_SUPER,string);
	format(string,128,"Du hast %s %s zu dir geportet.",AdminName(pID),SpielerInfo[pID][sName]);
	GetPlayerPos(playerid,pX,pY,pZ);
	SetPlayerPos(pID,pX+1,pY,pZ);
	SetPlayerInterior(pID,GetPlayerInterior(playerid));
	SetPlayerVirtualWorld(pID,GetPlayerVirtualWorld(playerid));
	if(IsPlayerInAnyVehicle(pID))
	{
		new tmpcar = GetPlayerVehicleID(pID);
	    SetVehiclePos(tmpcar,pX,pY,pZ+2);
	    LinkVehicleToInterior(tmpcar,GetPlayerInterior(playerid));
	    SetVehicleVirtualWorld(tmpcar,GetPlayerVirtualWorld(playerid));
	    PutPlayerInVehicle(pID, tmpcar, 0);
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/gethere' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:setint(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Interior, string[128];
	if(sscanf(params,"ui",pID,Interior))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setint [SpielerID] [Interior]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    SetPlayerInterior(pID,Interior);
 	format(string,128,"Du hast dem %s das Interior auf %d gesetzt.",SpielerInfo[pID][sName],Interior);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,128,"%s %s hat deinen Interior auf %d gesetzt.",AdminName(playerid),SpielerInfo[playerid][sName],Interior);
	SendClientMessage(pID,COLOR_SUPER,string);
	if(IsPlayerInAnyVehicle(pID))
	{
	    LinkVehicleToInterior(GetPlayerVehicleID(pID),Interior);
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/setint' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
    return 1;
}

CMD:setvw(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Interior, string[128];
	if(sscanf(params,"ui",pID,Interior))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setvw [SpielerID] [Welt]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    SetPlayerVirtualWorld(pID,Interior);
 	format(string,128,"Du hast dem %s die Welt auf %d gesetzt.",SpielerInfo[pID][sName],Interior);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,128,"%s %s hat deine Welt auf %d gesetzt.",AdminName(playerid),SpielerInfo[playerid][sName],Interior);
	SendClientMessage(pID,COLOR_SUPER,string);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/setvw' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
    return 1;
}

CMD:sethp(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Float:HPAnzahl, string[128];
	if(sscanf(params,"uf",pID,HPAnzahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/sethp [SpielerID] [Anzahl]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
 	format(string,128,"Du hast dem %s das HP auf %.2f gesetzt.",SpielerInfo[pID][sName],HPAnzahl);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,128,"%s %s hat deine Healthpoint(HP) auf %.2f gesetzt.",AdminName(playerid),SpielerInfo[playerid][sName],HPAnzahl);
	SendClientMessage(pID,COLOR_SUPER,string);
	SetPlayerHealth(pID,HPAnzahl);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/sethp' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:setarmour(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Float:HPAnzahl, string[128];
	if(sscanf(params,"uf",pID,HPAnzahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setarmour [SpielerID] [Anzahl]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(HPAnzahl < 0 || HPAnzahl > 99)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setarmour [SpielerID] [Anzahl(0-99)]");
 	format(string,128,"Du hast dem %s das Armour auf %.2f gesetzt.",SpielerInfo[pID][sName],HPAnzahl);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,128,"%s %s hat dein Armour auf %.2f gesetzt.",AdminName(playerid),SpielerInfo[playerid][sName],HPAnzahl);
	SendClientMessage(pID,COLOR_SUPER,string);
	SetPlayerArmour(pID,HPAnzahl);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/setarmour' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:kick(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	new pID, Grund[64], string[144];
	if(sscanf(params,"us[64]",pID,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/kick [SpielerID] [Grund]");
	if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene ID ist einem Bot zugewiesen.");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[playerid][sAdmin] < SpielerInfo[pID][sAdmin])return NichtBerechtigt
	format(string,128,"%s %s hat dich vom Server gekickt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Grund);
	SendClientMessage(pID,COLOR_RED,string);
	format(string,128,"%s wurde von %s %s gekickt. Grund: %s",SpielerInfo[pID][sName],AdminName(playerid),SpielerInfo[playerid][sName],Grund);
	SendClientMessageToAll(COLOR_RED,string);
	SpielerInfo[pID][sKicks]++;
	KickPlayer(pID,string);
	return 1;
}