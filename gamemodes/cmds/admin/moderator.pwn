CMD:warn(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, Grund[64], string[144];
	if(sscanf(params,"us[64]",pID,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/warn [SpielerID] [Grund]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	format(string,128,"%s %s hat %s verwarnt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Grund);
	SendICPMsg(string);
	CreateServerLogEntry("WARN_LOG", string);
	WarnPlayer(pID,SpielerInfo[playerid][sName],Grund);
	format(string,128,"%s %s hat dich verwant. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Grund);
	SendClientMessage(pID,COLOR_RED,string);
	if(SpielerInfo[playerid][sWarns] == 5)
	{
		format(string,128,"%s wurde vom System permanent gebannt: Grund: 5 Verwarnungen",SpielerInfo[pID][sName]);
	    SendClientMessageToAll(COLOR_RED,string);
		format(string,128,"Das System hat dich permanent gebannt. Grund: 5 Verwarnungen");
		CreateServerLogEntry("BAN_LOG", string);
		BanPlayer(pID,"System",Grund);
		return 1;
	}
	else
	{
	    format(string,128,"Anzahl Verwarnungen: %d",SpielerInfo[pID][sWarns]);
	    SendClientMessage(pID,COLOR_INFO,string);
	    SendClientMessage(pID,COLOR_INFO,"Du kannst im Control Panel deine Verwarnungen unter 'Mein Profil' einsehen.");
	    return 1;
	}
}

/*CMD:godtest(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/godtest [SpielerID/Name]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	new Float:px,Float:py,Float:pz,string[128];
	GetPlayerPos(pID,px,py,pz);
	format(string,sizeof(string),"Achtung: Du wirst nun vom %s %s auf Godmode überprüft.",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_YELLOW,string);
	SendClientMessage(pID,COLOR_YELLOW,"Achtung: Solltest du versuchen, den Godmode Check zu umgehen, wirst du permanent vom Server gesperrt!");
	SendClientMessage(pID,COLOR_INFO,"Achtung: Du wirst nun überprüft, bitte habe einen Moment Geduld.");
	new Float:Health, Float:Armour;
	GetPlayerHealth(playerid,Health); GetPlayerArmour(playerid,Armour);
	SetPVarFloat(pID,"GodtestHealth",Health);
	SetPVarFloat(pID,"GodtestArmour",Armour);
	SetPlayerHealth(pID,100),	SetPlayerArmour(pID,0);
	SetTimerEx("GodmodeCheck",2000,false,"dd",playerid,pID);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/godtest' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return CreateExplosion(px, py, pz, 0, 10.0);
}*/

CMD:lic(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    new pID, licname[24];
    if(sscanf(params,"us[24]",pID,licname))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/lic [SpielerID] [Autoschein|Bikeschein|Flugschein|LKWschein|BootSchein|WaffenSchein|Perso|Alle]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    new string[128];
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/lic' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
    if(strcmp(licname,"Autoschein",true)==0)
	{
	    SpielerInfo[pID][sCarLic] = 1;
		format(string,sizeof(string),"%s %s hat dir einen Autoschein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den Autoschein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	else if(strcmp(licname,"Bikeschein",true)==0)
	{
        SpielerInfo[pID][sBikeLic] = 1;
		format(string,sizeof(string),"%s %s hat dir einen Bikeschein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den Bikeschein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	else if(strcmp(licname,"Flugschein",true)==0)
	{
        SpielerInfo[pID][sFlugLic] = 1;
		format(string,sizeof(string),"%s %s hat dir Spieler einen Flugschein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den Flugschein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	else if(strcmp(licname,"LKWschein",true)==0)
	{
        SpielerInfo[pID][sTruckLic] = 1;
		format(string,sizeof(string),"%s %s hat dir einen LKWschein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den LKWschein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
  	}
	else if(strcmp(licname,"BootSchein",true)==0)
	{
        SpielerInfo[pID][sBootLic] = 1;
		format(string,sizeof(string),"%s %s hat dir einen BootSchein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den BootSchein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	else if(strcmp(licname,"WaffenSchein",true)==0)
	{
        SpielerInfo[pID][sWeaponLic] = 1;
		format(string,sizeof(string),"%s %s hat dir einen Waffenschein gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den Waffenschein gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	else if(strcmp(licname,"Perso",true)==0)
	{
 		SpielerInfo[pID][sPerso] = 1;
		format(string,sizeof(string),"%s %s hat dir einen Personalausweis gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s den Personalausweis gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
        if(SpielerInfo[pID][sAchivPerso] < 1)
        {
            ShowAchievement(pID,"Besorge dir deinen Personalausweis","+ 50 EXP");
            GivePlayerEXP(pID,50);
            SpielerInfo[pID][sAchivPerso] = 1;
        }
	}
	else if(strcmp(licname,"Alle",true)==0)
	{
	    SpielerInfo[pID][sCarLic] = 1;
	    SpielerInfo[pID][sBikeLic] = 1;
	    SpielerInfo[pID][sFlugLic] = 1;
	    SpielerInfo[pID][sTruckLic] = 1;
	    SpielerInfo[pID][sBootLic] = 1;
	    SpielerInfo[pID][sWeaponLic] = 1;
	    SpielerInfo[pID][sPerso] = 1;
		format(string,sizeof(string),"%s %s hat dir alle Scheine gegeben.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_INFO,string);
		format(string,sizeof(string),"Du hast dem %s alle Scheine gegeben.",SpielerInfo[pID][sName]);
        SendClientMessage(playerid,COLOR_SUPER,string);
	}
	return 1;
}

CMD:giveexp(playerid,params[])
{
	new pID,Anzahl,string[144];
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	if(sscanf(params,"ud",pID,Anzahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/giveexp [SpielerID] [Anzahl]");
	GivePlayerEXP(pID,Anzahl);
	format(string,sizeof(string),"Du hast %s %d EXP gegeben.",SpielerInfo[pID][sName],Anzahl);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"%s %s hat dir %d EXP vergeben.",AdminName(playerid),SpielerInfo[playerid][sName],Anzahl);
	SendClientMessage(pID,COLOR_INFO,string);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/clearchat' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:getcarinfo(playerid,params[])
{
	new carid, string[144];
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    if(sscanf(params,"d",carid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/getcarinfo [FahrzeugID]");
    format(string,sizeof(string),"FahrzeugID: %d - Fraktion: %d - Nebenjob: %d - Autohaus: %d - GruppenID: %d - Besitzer: %s - Kennzeichen: %s",
	carid,
	FahrzeugInfo[carid][fFraktion],
	FahrzeugInfo[carid][fNebenjob],
	FahrzeugInfo[carid][fAutohaus],
	FahrzeugInfo[carid][fGruppe],
	FahrzeugInfo[carid][fBesitzer],
	FahrzeugInfo[carid][fKennzeichen]);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"ModelID: %d - Fahrzeug erstellt: %d - AttachedObject0: %d - DatenbankID: %d",GetVehicleModel(carid),FahrzeugInfo[carid][fErstellt],FahrzeugInfo[carid][fAttachedObject][0],FahrzeugInfo[carid][fDatabaseID]);
    SendClientMessage(playerid,COLOR_INFO,string);
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/getcarinfo' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:carrespawn(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	if(GlobalVars[crespawn] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es findet derzeit einen Carrespawn statt.");
    new Auswahl[24], string[144];
    if(sscanf(params,"s[24]",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/carrespawn [Alle|Trucker|Pizzabote|KFahrer|Pilot|Busfahrer|Müllmann|Landwirt|Geldlieferant|Elektriker|LSF|Fraktion|Autohaus|FLR|Hochseefischer|]");
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/carrespawn' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	if(strcmp(Auswahl,"Alle",true)==0)
	{
 		format(string,128,"%s %s hat einen allgemeinen Carrespawn gestartet. Er beginnt in 30 Sekunden.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 1;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);

   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
	    return 1;
	}
	else if(strcmp(Auswahl,"Trucker",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Trucker Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 2;
        KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Pizzabote",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Pizzaboten Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 3;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"KFahrer",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Kehrmaschinenfahrer Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 4;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Pilot",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Piloten Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 5;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Busfahrer",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Busfahrer Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 6;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Müllmann",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Müllmann Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 7;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Landwirt",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Landwirt Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 8;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Geldlieferant",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Geldlieferanten Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 9;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Elektriker",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Elektriker Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 10;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"LSF",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Langstreckenfahrer Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 11;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"FLR",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Fluglieferanten Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 14;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Hochseefischer",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge vom Hochseefischer Job.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 15;
	    KillTimer(CountdownTimer);
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Fraktion",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge von Fraktionen.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 12;
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	else if(strcmp(Auswahl,"Autohaus",true)==0)
	{
		format(string,128,"%s %s respawnt in 30 Sekunden alle Fahrzeuge von Autohäusern.",AdminName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessageToAll(COLOR_INFO,string);

	    GlobalVars[crespawn] = 13;
	    CountdownTimer = SetTimerEx("CountdownTime",1000,true,"i",30);
   		foreach(new i : Player)
		{
		    if(GetPVarInt(i,"ProbeFahrt") == 1 || GetPVarInt(i,"ImImportCar") == 1 || GetPVarInt(i,"ImKurrierCar") == 1)continue;
			PlayerTextDrawSetString(i,CountdownDraw[i][2],"CARRESPAWN");
			PlayerTextDrawSetString(i,CountdownDraw[i][3],"30 Sekunden");
			PlayerTextDrawShow(i,CountdownDraw[i][0]);
			PlayerTextDrawShow(i,CountdownDraw[i][1]);
			PlayerTextDrawShow(i,CountdownDraw[i][2]);
			PlayerTextDrawShow(i,CountdownDraw[i][3]);
		}
		return 1;
	}
	return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/carrespawn [Alle|Trucker|Pizzabote|KFahrer|Pilot|Busfahrer|Müllmann|Landwirt|Geldlieferant|Elektriker|LSF|Fraktion|Autohaus|FLR|Hochseefischer|]");
}
alias:carrespawn("cr")

CMD:refill(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	if(GlobalVars[crespawn] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es findet derzeit einen Carrespawn statt.");
    new Auswahl[24], string[144];
    if(sscanf(params,"s[24]",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/refill [Eigenes|Alle|Trucker|Pizzabote|KFahrer|Pilot|Busfahrer|Müllmann|Landwirt|Geldlieferant|Elektriker|Fraktion]");
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/refill' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	if(strcmp(Auswahl,"Eigenes",true)==0)
	{
	    new tmpcar = GetPlayerVehicleID(playerid);
	    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
		if(IsAFahrrad(tmpcar))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Fahrräder haben keinen Tank.");
		FahrzeugInfo[tmpcar][fTank] = VehicleData[GetVehicleModel(tmpcar)-400][vehLiter];
		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast das Fahrzeug betankt.");
	}
	else if(strcmp(Auswahl,"Alle",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Trucker",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 1)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Trucker' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Pizzabote",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 2)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Pizzabote' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"KFahrer",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 3)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Kehrmaschinen-Fahrer' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Pilot",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 4)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Flugzeuge des Nebenjobs 'Pilot' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Busfahrer",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 5)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Busfahrer' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Müllmann",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 6)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Müllmann' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Landwirt",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 7)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Landwirt' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Geldlieferant",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 10)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Geldlieferant' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Elektriker",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fNebenjob] != 11)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge des Nebenjobs 'Elektriker' betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
	else if(strcmp(Auswahl,"Fraktion",true)==0)
	{
	    for(new id = 1; id < MAX_VEHICLES; id++)
	 	{
	  		if(!IsValidVehicle(id))continue;
	  		if(IsAFahrrad(id))continue;
	  		if(FahrzeugInfo[id][fFraktion] < 1)continue;
	   		FahrzeugInfo[id][fTank] = VehicleData[GetVehicleModel(id)-400][vehLiter];
		}
		format(string,sizeof(string),"%s %s hat alle Fahrzeuge von Fraktionen betankt.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_YELLOW,string);
	}
 	return 1;
}

CMD:wetter(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
 	Wetter();
  	return 1;
}

CMD:fixveh(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	RepairVehicle(GetPlayerVehicleID(playerid));
	return 1;
}
alias:fixveh("fixcar")

CMD:giveall(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	ShowPlayerDialog(playerid,DIALOG_GIVEALL,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Geschenk an Alle","Geld\nEXP\nPayDay","Weiter","Abbrechen");
	return 1;
}
CMD:givepayday(playerid,params[])
{
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    new pID;
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givepayday [SpielerID]");
    if(!IsPlayerConnected(pID))return NichtOnline
    if(Afk[pID] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler ist abwesend (AFK) gemeldet.");
    SpielerInfo[pID][sPayDay] = 44;
    PayDay(pID);
	new string[128];
	format(string,sizeof(string),"["SERV_STAG"-Geschenk]: %s %s hat dir einen PayDay geschenkt!",AdminName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_SUPER,string);
	format(string,sizeof(string),"["SERV_STAG"-Geschenk]: Du hast dem Spieler %s einen PayDay geschenkt!",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,string);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givepayday' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:adminachiv(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, achivdesc[64], exp;
	if(sscanf(params,"us[64]i",pID,achivdesc,exp))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/adminachiv [SpielerID] [Achivbeschreibung] [EXP]");
	new expstring[64];
	format(expstring,sizeof(expstring),"+ %d EXP",exp);
	ShowAchievement(pID,achivdesc,expstring);
	SendClientMessage(playerid,COLOR_SUPER,"[Info]: Achievement abgesendet.");
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/adminachiv' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:lottogewinn(playerid,params[])
{
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    new Betrag;
    if(sscanf(params,"i",Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/lottogewinn [Betrag]");
    if(Betrag < 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Bitte gebe einen gültigen Betrag ein den du addieren möchtest.");
    LottoJackpot += Betrag;
    setJackpotScreen();
    GovVars[govKasse] -= Betrag;
    new string[128];
    format(string,sizeof(string),"[News]: Der Lottogewinn hat sich soeben um $%d erhöht und beträgt jetzt $%d!",Betrag,LottoJackpot);
    SendClientMessageToAll(COLOR_NEWS,string);
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/lottogewinn' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:prisoncp(playerid,params[])
{
    new pID, Anzahl, Grund[64], string[264], prisoncpstring[400];
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    if(sscanf(params,"uis[64]",pID,Anzahl,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/prisoncp [SpielerID] [Anzahl] [Grund]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(SpielerInfo[playerid][sAdmin] < SpielerInfo[pID][sAdmin])return NichtBerechtigt
    if(SpielerInfo[pID][sPrison] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler befindet sich bereits im Prison auf Zeit.");

	format(string,128,"%s wurde von %s %s für %d Checkpoint(s) in den Prison teleportiert. Grund: %s",SpielerInfo[pID][sName],AdminName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
	SendClientMessageToAll(COLOR_RED,string);
	CreateServerLogEntry("PRISONCP_LOG", string);
	format(string,128,"%s %s hat dich für %d Checkpoint(s) in den Prison teleportiert. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
	SendClientMessage(pID,COLOR_RED,string);

    SetPlayerPos(pID,1359.3730,2132.4219,11.0156);
    SetPlayerFacingAngle(pID,87.9827);
	SetPlayerInterior(pID,0);
	SetPlayerVirtualWorld(pID,pID);

 	SpielerInfo[pID][sPrisonCP] = Anzahl;

 	SetPlayerCheckpointEx(pID,1354.3055,2123.5054,11.0156,2.5);

	new Uhrzeit[16], Datum[16];
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);

	format(prisoncpstring,sizeof(prisoncpstring),"{FFFFFF}Du wurdest in das Prison teleportiert!\nTeleportiert von: %s %s\nCheckpoints: %d\nGrundangabe: %s\nUhrzeit: %s\nDatum: %s\n\nWenn du glaubst zu Unrecht in den Prison teleportiert wurden zu sein,\nkannst du mit {007DFF}'F8'{FFFFFF} einen Screenshot von diesem Dialog machen,\nund dich im Forum melden. Erstelle einen Entprisonantrag indem du die Vorlage dort ausfüllst.",AdminName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund,Uhrzeit,Datum);
	ShowPlayerDialog(pID,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Prison",prisoncpstring,"Schliessen","");
	SpielerInfo[pID][sPrisons]++;

	PlayAudioStreamForPlayer(pID,"https://"SERV_WURL"/sounds/Prison.mp3");
	ResetPlayerWeapons(pID);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/prisoncp' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:prison(playerid,params[])
{
    new pID, Minuten, Grund[64], string[264], prisoncpstring[400];
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    if(sscanf(params,"uis[64]",pID,Minuten,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/prison [SpielerID] [Minuten] [Grund]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(SpielerInfo[playerid][sAdmin] < SpielerInfo[pID][sAdmin])return NichtBerechtigt
    if(SpielerInfo[pID][sPrisonCP] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler befindet sich bereits im Laufprison.");

	format(string,128,"%s wurde von %s %s für %d Minute(n) in das Prison teleportiert. Grund: %s",SpielerInfo[pID][sName],AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund);
	SendClientMessageToAll(COLOR_RED,string);
    CreateServerLogEntry("PRISON_LOG", string);
	format(string,128,"%s %s hat dich für %d Minute(n) in das Prison teleportiert. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund);
	SendClientMessage(pID,COLOR_RED,string);

    SetPlayerPos(pID,302.3349,304.6149,999.1484);
    SetPlayerFacingAngle(pID,358.4268);
	SetPlayerInterior(pID,4);
	SetPlayerVirtualWorld(pID,500);

 	SpielerInfo[pID][sPrison] = Minuten;

	new Uhrzeit[16], Datum[16];
	gettime(Hour, Minute, Second);
	getdate(Year, Month, Day);
	format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
	format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);

	format(prisoncpstring,sizeof(prisoncpstring),"{FFFFFF}Du wurdest in das Prison teleportiert!\nTeleportiert von: %s %s\nMinuten: %d\nGrundangabe: %s\nUhrzeit: %s\nDatum: %s\n\nWenn du glaubst zu Unrecht in den Prison teleportiert wurden zu sein,\nkannst du mit {007DFF}'F8'{FFFFFF} einen Screenshot von diesem Dialog machen,\nund dich im Forum melden. Erstelle einen Entprisonantrag indem du die Vorlage dort ausfüllst.",AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund,Uhrzeit,Datum);
	ShowPlayerDialog(pID,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Prison",prisoncpstring,"Schliessen","");
	SpielerInfo[pID][sPrisons]++;

	PlayAudioStreamForPlayer(pID,"https://"SERV_WURL"/sounds/Prison.mp3");

	KillTimer(PrisonTimer[pID]);
	PrisonTimer[pID] = SetTimerEx("TimeToPrison",60000,true,"i",pID);
	ResetPlayerWeapons(pID);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/prison' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:givemoney(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, Betrag, string[128];
	if(sscanf(params,"ui",pID,Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givemoney [SpielerID] [Betrag]");
	{
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    GivePlayerMoneyEx(pID,Betrag);
  	 	format(string,128,"[Info]: {FFFFFF}Du hast %s $%d gegeben.",SpielerInfo[pID][sName],Betrag);
		SendClientMessage(playerid,COLOR_SUPER,string);
		format(string,128,"[Info]: {FFFFFF}%s %s hat dir $%d gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],Betrag);
		SendClientMessage(pID,COLOR_SUPER,string);
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givemoney' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
}

CMD:respawncar(playerid,params[])
{
	new vehID;
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    if(sscanf(params,"i",vehID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/respawncar [VehicleID]");
    if(!IsValidVehicle(vehID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene FahrzeugID existiert nicht.");
    SetVehicleToRespawn(vehID);
    SendClientMessage(playerid,COLOR_SUPER,"Das Fahrzeug wurde erfolgreich respawnt.");
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/respawncar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:getcar(playerid,params[])
{
    new vehID, Float:Pos[3];
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    if(sscanf(params,"i",vehID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/getcar [VehicleID]");
    if(!IsValidVehicle(vehID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene FahrzeugID existiert nicht.");
    GetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
    SetVehiclePos(vehID,Pos[0],Pos[1],Pos[2]);
    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Du hast das Flug/Fahzeug erfolgreich zu dir geportet.");
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/getcar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:gotocar(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new vehID, Float:Pos[3];
	if(sscanf(params,"i",vehID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gotocar [VehicleID]");
	if(!IsValidVehicle(vehID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die angegebene FahrzeugID existiert nicht.");
	GetVehiclePos(vehID,Pos[0],Pos[1],Pos[2]);
	SetPlayerPos(playerid,Pos[0],Pos[1],Pos[2]);
	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Du hast dich erfolgreich zum Flug/Fahrzeug geportet.");
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/gotocar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:veh(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	if(GetPVarInt(playerid,"AdminDuty") != 1)return AdminDienst
	new vehID, Farbe1, Farbe2;
	if(sscanf(params,"iii",vehID,Farbe1,Farbe2))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/veh [VehicleID] [Farbe1] [Farbe2]");
    new Float: vX, Float: vY, Float: vZ;
    GetPlayerPos(playerid,vX,vY,vZ);
	if(vehID < 400 || vehID > 611)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/veh [VehicleID(400-611)] [Farbe1] [Farbe2]");
	if(Farbe1 < 0 || Farbe1 > 255)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/veh [VehicleID] [Farbe1(0-255)] [Farbe2]");
	if(Farbe2 < 0 || Farbe2 > 255)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/veh [VehicleID] [Farbe1] [Farbe2(0-255)]");
	new car = CreateVehicle(vehID, vX,vY,vZ, 0.0, Farbe1, Farbe2, -1);
	FahrzeugInfo[car][fTank] = VehicleData[GetVehicleModel(car)-400][vehLiter];
	SetPlayerPos(playerid,vX,vY,vZ+2);
	LinkVehicleToInterior(car,GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(car,GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, car, 0);
	SendClientMessage(playerid,COLOR_INFO,"Bitte vergesse nicht das Fahrzeug mit /carcontrol zu löschen.");
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/veh' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:carcontrol(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new Aktion[8];
	if(sscanf(params,"s[8]",Aktion))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/carcontrol [Respawn/Delete]");
    if(strcmp(Aktion, "Respawn", true, strlen(Aktion)) == 0)
    {
        if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
        SetVehicleToRespawn(GetPlayerVehicleID(playerid));
        SendClientMessage(playerid,COLOR_INFO,"Das Fahrzeug wurde respawnt.");
    }
    if(strcmp(Aktion, "Delete", true, strlen(Aktion)) == 0)
	{
		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
		DestroyVehicleEx(GetPlayerVehicleID(playerid));
		SendClientMessage(playerid,COLOR_INFO,"Das Fahrzeug wurde gelöscht.");
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/carcontrol' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:gotopos(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new Float:PosX, Float:PosY, Float:PosZ, string[128];
	if(sscanf(params,"fff",PosX,PosY,PosZ))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gotopos [PosX] [PosY] [PosZ]");
    if(IsPlayerInAnyVehicle(playerid))
    {
        SetVehiclePos(GetPlayerVehicleID(playerid), PosX, PosY, PosZ);
    }
    else
    {
        SetPlayerPos(playerid, PosX, PosY, PosZ);
    }
	format(string,128,"Du hast dich zur folgenden Koordinaten geportet: PosX: %f | PosY: %f | PosZ: %f",PosX,PosY,PosZ);
 	SendClientMessage(playerid,COLOR_SUPER,string);
 	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/gotopos' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:ban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, Grund[64], string[144];
	if(sscanf(params,"us[128]",pID,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ban [SpielerID] [Grund]");
	{
	    if(IsPlayerConnectedEx(pID))
	    {
			if(SpielerInfo[playerid][sAdmin] < SpielerInfo[pID][sAdmin])return NichtBerechtigt
			format(string,128,"%s wurde von %s %s permanent gebannt: Grund: %s",SpielerInfo[pID][sName],AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendClientMessageToAll(COLOR_RED,string);
			CreateServerLogEntry("BAN_LOG", string);
			format(string,128,"%s %s hat dich permanent gebannt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendClientMessage(pID,COLOR_RED,string);
			BanPlayer(pID,SpielerInfo[playerid][sName],Grund);
			return 1;
		}
		else NichtOnline
		return 1;
	}
}

CMD:checkip(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/checkip [SpielerID]");
	{
	    if(IsPlayerConnectedEx(pID))
	    {
			SendClientMessage(playerid,COLOR_RED, "Die IP Adresse von %s lautet : %s", SpielerInfo[playerid][sName], SpielerInfo[playerid][sIPAdresse]);
			return 1;
		}
		else NichtOnline
		return 1;
	}
}

CMD:tban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, Minuten, Grund[64], string[144];
	if(sscanf(params,"uis[64]",pID,Minuten,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/tban [SpielerID] [Minuten] [Grund]");
	{
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    if(SpielerInfo[playerid][sAdmin] < SpielerInfo[pID][sAdmin])return NichtBerechtigt
	    if(Minuten < 5 || Minuten > 1440)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/tban [SpielerID] [Minuten(5-1440)] [Grund]");
	    format(string,128,"%s %s hat den %s für %d Minuten gebannt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Minuten,Grund);
	    SendClientMessageToAll(COLOR_RED,string);
	    CreateServerLogEntry("TBAN_LOG", string);
	    format(string,128,"%s %s hat dich für %d Minuten gebannt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Minuten,Grund);
	    SendClientMessage(pID,COLOR_RED,string);
        TBanPlayer(pID,Minuten,SpielerInfo[playerid][sName],Grund);
        SpielerInfo[pID][sTimebans]++;
        return 1;
	}
}
alias:tban("timeban")

CMD:untimeban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new Name[24], Grund[64];
	if(sscanf(params,"s[24]s[64]",Name,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/untban [Name] [Grund]");
	{
  		new query[128];
	    mysql_format(sqlHandle, query,sizeof(query), "SELECT `Name` FROM `timebans` WHERE `Name` = '%s'", Name);
	   	new Cache:result = mysql_query(sqlHandle, query);
   	
 		if(cache_num_rows() > 0)
		{
			mysql_Delete("timebans", "Name", Name);
			format(query,sizeof(query),"Der auf Zeit gebannte Account '%s' wurde von %s %s entbannt. Grund: %s",Name,AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendAdminMessage(COLOR_SUPER,query);
			CreateServerLogEntry("UNTBAN_LOG", query);
			return 1;
		}
		else
		{
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Account-Name wurde in der Datenbank nicht gefunden.");
		}
		cache_delete(result);
		return 1;
	}
}
alias:untimeban("untban")

CMD:awiederbeleben(playerid,params[])
{
    if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/awiederbeleben [SpielerID]");
	if(SpielerInfo[pID][sWiederbeleben] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler muss nicht wiederbelebt werden.");
	format(string,sizeof(string),"%s %s hat %s wiederbelebt..",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	SpielerInfo[pID][sWiederbeleben] = 0;
	SpielerInfo[pID][sKrankenhaus] = 0;
	SetPlayerHealth(pID,10);
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/awiederbeleben' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:defektliste(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
 	ShowPlayerDialog(playerid,DIALOG_AUFTRAGSLISTE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Auftragsliste","Bankautomaten\nBlitzer","Weiter","Beenden");
  	return 1;
}
alias:defektliste("aauftragsliste")

CMD:areparieren(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    new Auswahl[24];
    if(sscanf(params,"s[24]",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/areparieren [Bankautomat|Blitzer]");
    if(strcmp(Auswahl,"Bankautomat",true)==0)
	{
	    if(!AmATM(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem defekten Bankautomat.");
		new atmid = ATMID(playerid);
		if(ATMInfo[atmid][atmKaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Bankautomat ist nicht defekt.");
		new id = ATMID(playerid);
		DestroyDynamicObject(ATMInfo[id][atmRauch]);
		ATMInfo[id][atmRauch] = INVALID_OBJECT_ID;
		ATMInfo[id][atmKaputt] = 0;
		SaveATMById(id);
	    return 1;
	}
 	else if(strcmp(Auswahl,"Blitzer",true)==0)
	{
 		if(!AmBlitzer(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem defekten Blitzer.");
		new blitzerid = BlitzerID(playerid);
		if(Blitzer[blitzerid][Kaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Blitzer ist nicht defekt.");
		new id = BlitzerID(playerid);
		DestroyDynamicObject(Blitzer[id][Rauch]);
		Blitzer[id][Rauch] = INVALID_OBJECT_ID;
		Blitzer[id][Kaputt] = 0;
		return 1;
	}
    return 1;
}

CMD:areparierenall(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
    new Auswahl[24];
    if(sscanf(params,"s[24]",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/areparieren [Bankautomat|Blitzer]");
    if(strcmp(Auswahl,"Bankautomat",true)==0)
	{
		new atmid = ATMID(playerid);
		if(ATMInfo[atmid][atmKaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Bankautomat ist nicht defekt.");
		DestroyDynamicObject(ATMInfo[atmid][atmRauch]);
		ATMInfo[atmid][atmRauch] = INVALID_OBJECT_ID;
		ATMInfo[atmid][atmKaputt] = 0;
	    return 1;
	}
 	else if(strcmp(Auswahl,"Blitzer",true)==0)
	{
		new blitzerid = BlitzerID(playerid);
		if(Blitzer[blitzerid][Kaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Blitzer ist nicht defekt.");
		DestroyDynamicObject(Blitzer[blitzerid][Rauch]);
		Blitzer[blitzerid][Rauch] = INVALID_OBJECT_ID;
		Blitzer[blitzerid][Kaputt] = 0;
		return 1;
	}
    return 1;
}

CMD:atankefill(playerid, params[])
{
 	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
  	{
		if(!AnTankstelle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keiner Tankstelle.");
		if(GetPVarInt(playerid,"TStelleBetanken") == 1)return 1;
		new tsid = GetNearTankstelleID(playerid);
		if(GetPVarInt(playerid,"TrailerBetanken") == 1)//Benzin
  		{
    		if(TankstellenInfo[tsid][tsIsFillingB] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diesel Tankstelle wird gerade schon mit Benzin aufgefüllt. Bitte warte einen Moment.");
      		if(TankstellenInfo[tsid][tsBenzinLiter] == 10000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Tankstelle benötigt kein Benzin.");
			TankstellenInfo[tsid][tsIsFillingB] = 1;
			SetPVarInt(playerid,"TStelleBetanken",1);
   		}
	    else if(GetPVarInt(playerid,"TrailerBetanken") == 2)//Diesel
	 	{
   			if(TankstellenInfo[tsid][tsIsFillingD] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diesel Tankstelle wird gerade schon mit Diesel aufgefüllt. Bitte warte einen Moment.");
      		if(TankstellenInfo[tsid][tsDieselLiter] == 10000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Tankstelle benötigt kein Diesel.");
			TankstellenInfo[tsid][tsIsFillingD] = 1;
			SetPVarInt(playerid,"TStelleBetanken",1);
	 	}
	 	else if(GetPVarInt(playerid,"TrailerBetanken") == 3)//Kerosin
	 	{
   			if(TankstellenInfo[tsid][tsIsFillingK] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diesel Tankstelle wird gerade schon mit Kerosin aufgefüllt. Bitte warte einen Moment.");
      		if(TankstellenInfo[tsid][tsKerosinLiter] == 10000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Tankstelle benötigt kein Kerosin.");
			TankstellenInfo[tsid][tsIsFillingK] = 1;
			SetPVarInt(playerid,"TStelleBetanken",1);
	 	}
	}
	return 1;
}