CMD:downtime(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
 	new string[128];
  	foreach(new i : Player){ClearChat(i,50);}
   	SendClientMessageToAll(COLOR_YELLOW,"Downtime wurde gestartet. Alle Spieler die kein Teammitglied sind wurden gekickt.");
    SendClientMessageToAll(COLOR_YELLOW,"Das aktuelle Passwort vom Server wurde aufgrund der Downtime geändert. Mehr Infos unter "SERV_WURL"!");
    SendClientMessage(playerid,COLOR_SUPER,"Neues Passwort: "SERV_PASS"");
    SendRconCommand("password "SERV_PASS"");
    format(string,128,"%s %s hat die Downtime gestartet.",AdminName(playerid),SpielerInfo[playerid][sName]);
    print(string);
    foreach(new i : Player)
    {
    	if(SpielerInfo[i][sAdmin] < 1)
     	{
      		ShowPlayerDialog(i,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Zurzeit geschlossen",""SERV_NAME" ist momentan geschlossen. Mögliche Gründe dafür sind:\nBackups, Wartungsarbeiten, DDoS-Angriffe oder anderes. Weitere Informationen solltest du unter "SERV_WURL" finden. Dein Team von "SERV_NAME".","Close","");
			KickPlayer(i,"");
			return 1;
   		}
	}
	return 1;
}
CMD:saveall(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	SendClientMessageToAll(COLOR_RED,"[Info]: {FFFFFF}Server: Es wurde eine Server Speicherung eingeleitet.");
	SendClientMessageToAll(COLOR_RED,"[Info]: {FFFFFF}Server: Es könnte in den paar Sekunden zu Laggs kommen.");
	ServerSpeichernStatus = 1;
 	ServerSpeichernTimer = SetTimer("ServerSpeichern",2000,true);
  	return 1;
}

CMD:dbsave(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new loading[24];
	if(sscanf(params,"s[24]",loading))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/dbsave [frakinfos|gangzones|drogenpflanzen|werbetafeln]");
	new string[128];
	if(strcmp(loading, "frakinfos", true, strlen(loading)) == 0)
	{
	    SaveFrakInfo();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurden geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Speichervorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "gangzones", true, strlen(loading)) == 0)
	{
	    SaveGangZones();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurden geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Speichervorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "drogenpflanzen", true, strlen(loading)) == 0)
	{
	    SaveDrogen();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurden geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Speichervorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "werbetafeln", true, strlen(loading)) == 0)
	{
	    SaveWerbetafel();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurden geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Speichervorgang kann einige Sekunden in Anspruch nehmen.");
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/dbsave' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:acc_lock(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/acc_lock [SpielerID]");
	if(IsPlayerNPC(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese ID kann keinem Spieler zugeordnet werden.");
	if(!IsPlayerConnected(pID))return NichtOnline
	new string[128];
	if(GetPVarInt(pID,"acc_locked") == 0)
	{
		format(string,sizeof(string),"[Achtung]: %s %s hat deinen Account eingefroren. Er kann deinen Account nun in der Datenbank bearbeiten.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_RED," ");
        SendClientMessage(pID,COLOR_RED," ");
        SendClientMessage(pID,COLOR_RED," ");
        SendClientMessage(playerid,COLOR_RED," ");
        SendClientMessage(playerid,COLOR_RED," ");
        SendClientMessage(playerid,COLOR_RED," ");
		SendClientMessage(pID,COLOR_RED,string);
		TogglePlayerControllable(pID,false);

		//Speicherung des aktuellen Accounts
		SaveAccount(pID);
		SavePrivatCar(pID);
		SavePlayerWeapons(pID);
		ResetPlayerWeapons(pID);
		ResetPlayerMoney(pID);
		//////////////////////////////////////

	    SetPVarInt(pID,"acc_locked",playerid);
	    DeletePVar(pID,"LoggedIn");
	    format(string,sizeof(string),"[Achtung]: {FFFFFF}Du hast den Account von %s eingefroren. Seine Datenbank-ID lautet: %d",SpielerInfo[pID][sName],SpielerInfo[pID][sDBID]);
	    SendClientMessage(playerid,COLOR_RED,string);
	}
	else if(GetPVarInt(pID,"acc_locked") > 0)
	{
	    if(GetPVarInt(pID,"acc_locked") != playerid && IsPlayerConnected(GetPVarInt(pID,"acc_locked")) && SpielerInfo[GetPVarInt(pID,"acc_locked")][sAdmin] > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Account wurde von einem anderen Teammitglied eingefroren.");
	    format(string,sizeof(string),"[Achtung]: {FFFFFF}%s %s hat deinen Account entforen. Du kannst jetzt weiter spielen.",AdminName(playerid),SpielerInfo[playerid][sName]);
        SendClientMessage(pID,COLOR_SUPER," ");
        SendClientMessage(pID,COLOR_SUPER," ");
        SendClientMessage(pID,COLOR_SUPER," ");
        SendClientMessage(playerid,COLOR_SUPER," ");
        SendClientMessage(playerid,COLOR_SUPER," ");
        SendClientMessage(playerid,COLOR_SUPER," ");
		SendClientMessage(pID,COLOR_SUPER,string);
		TogglePlayerControllable(pID,true);

		//Laden des neuen Accounts
		SetPVarInt(pID,"LoggedIn",1);
        KillTimer(CamFahrten[pID]);
		LoadAccount(pID);
		LoadEXPStatus(pID);

		if(SpielerInfo[pID][sFraktion] >= 9 && SpielerInfo[pID][sFraktion] != 19 && FrakInfo[SpielerInfo[pID][sFraktion]][fiSkinordnung] > 0)//Gang
		{
			new skinid[3];
			format(skinid,sizeof(skinid),"%d",SpielerInfo[pID][sFraktion]);
			format(string,sizeof(string),"Rang%d",SpielerInfo[pID][sRank]);
			SetPlayerSkin(pID,mysql_GetInt("skinordnung", string, "frakid", skinid));
		}

		SetPVarInt(pID,"acc_locked",0);
	    format(string,sizeof(string),"[Achtung]: Du hast den Account von %s entfroren.",SpielerInfo[pID][sName]);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/acc_lock' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:givemats(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new fID, Betrag;
	if(sscanf(params,"ii",fID,Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givemats [FraktionsID] [Anzahl]");
	{
	    if(fID > 18 || fID < 9)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Nur kriminelle Organisationen können Materialien besitzen.");
	    FrakInfo[fID][fiMats] += Betrag;
		new string[128];
		format(string,sizeof(string),"[Info]: {FFFFFF}Du hast der Fraktion '%s' '%d' Materialien gegeben.",FrakName(fID),Betrag);
		SendClientMessage(playerid,COLOR_SUPER,string);
		format(string,sizeof(string),"[Info]: {FFFFFF}%s %s hat eurer Fraktion '%d' Materialien gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],Betrag);
		foreach(new i : Player)
		{
		    if(SpielerInfo[i][sFraktion] == fID)
		    {
		        SendClientMessage(i,COLOR_SUPER,string);
		    }
		}
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givemats' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:givevip(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new pID, Tage, string[144];
	if(sscanf(params,"ui",pID,Tage))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givevip [SpielerID] [Tage]");
	{
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    if(Tage < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/givevip [SpielerID] [Tage(min. 1)]");
	    if(SpielerInfo[pID][sVIP] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler hat bereits den VIP-Status!");
	    format(string,128,"%s %s hat %s für %d Tag(e) den VIP-Status gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Tage);
	    SendAdminMessage(COLOR_INFO,string);
	    CreateServerLogEntry("VIP_LOG", string);
	    format(string,128,"%s %s hat dir für %d Tag(e) den VIP-Status gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],Tage);
	    SendClientMessage(pID,COLOR_INFO,string);
        GiveVIP(SpielerInfo[pID][sName],Tage,SpielerInfo[playerid][sName]);
        SpielerInfo[pID][sVIP] = 1;
        if(SpielerInfo[pID][sAchivVIP] < 1)
        {
            SpielerInfo[pID][sAchivVIP] = 1;
			ShowAchievement(pID,"Werde VIP Mitglied","+ 2250 EXP");
			GivePlayerEXP(pID,2250);
        }
        new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givevip' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
        return 1;
	}
}

CMD:ogivevip(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new Name[24], Tage, string[144], query[250];
	if(sscanf(params,"s[24]i",Name,Tage))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ogivevip [SpielerName] [Tage(min. 1)]");
	{
	    foreach(new i : Player)
	    {
	        if(strcmp(Name, SpielerInfo[i][sName], true, strlen(Name)) == 0)return SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der angegebene Spieler ist online. Benutze /givevip [SpielerID] [Tage]");
		    mysql_format(sqlHandle, query, 128, "SELECT `Name` FROM `accounts` WHERE `Name` = '%s'", Name);
		   	new Cache:result = mysql_query(sqlHandle, query);

	 		if(cache_num_rows() > 0)
			{
			    if(Tage < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/givevip [SpielerID] [Tage(min. 1)]");
			    format(string,128,"%s %s hat %s für %d Tag(e) den VIP-Status gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],Name,Tage);
			    SendAdminMessage(COLOR_INFO,string);
			    GiveVIP(Name,Tage,SpielerInfo[playerid][sName]);
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
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/ogivevip' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:otakevip(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new Name[24], Grund[64];
	if(sscanf(params,"s[64]s[64]",Name,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/otakevip [Name] [Grund]");
	{
  		new query[128];
	    mysql_format(sqlHandle, query,sizeof(query), "SELECT `Name` FROM `vip` WHERE `Name` = '%s'", Name);
	   	new Cache:result = mysql_query(sqlHandle, query);
   		
 		if(cache_num_rows() > 0)
		{
			mysql_Delete("vip", "Name", Name);
			format(query,sizeof(query),"Der VIP-Status vom Account '%s' wurde von %s %s entfernt. Grund: %s",Name,AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendAdminMessage(COLOR_SUPER,query);
			CreateServerLogEntry("VIPTAKE_LOG", query);
			return 1;
		}
		else
		{
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Account-Name wurde in der Datenbank nicht gefunden.");
		}
		cache_delete(result);
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/otakevip' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
}

CMD:takevip(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new pID, string[144], query[128], Grund[64];
	if(sscanf(params,"us[64]",pID,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/takevip [SpielerID] [Grund]");
	{
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    mysql_format(sqlHandle, query,sizeof(query), "SELECT `Name` FROM `vip` WHERE `Name` = '%s'", SpielerInfo[pID][sName]);
	   	new Cache:result = mysql_query(sqlHandle, query);
   		
 		if(cache_num_rows() > 0)
		{
			mysql_Delete("vip", "Name", SpielerInfo[pID][sName]);
			format(query,sizeof(query),"Der VIP-Status vom Account '%s' wurde von %s %s entfernt. Grund: %s",SpielerInfo[pID][sName],AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendAdminMessage(COLOR_SUPER,query);
			CreateServerLogEntry("VIPTAKE_LOG", query);

			SpielerInfo[pID][sVIP] = 0;
	  	 	format(string,128,"Du hast %s seinen VIP-Status entfernt. Grund: %s.",SpielerInfo[pID][sName],Grund);
			SendClientMessage(playerid,COLOR_SUPER,string);
			format(string,128,"Dein VIP-Status wurde von %s %s entfernt. Grund: %s.",AdminName(playerid),SpielerInfo[playerid][sName],Grund);
			SendClientMessage(pID,COLOR_SUPER,string);
			new log_admstring[128];
			format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/takevip' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
			CreateServerLogEntry("ADMIN_LOG", log_admstring);
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

CMD:makeadmin(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] >= 4 || IsPlayerAdmin(playerid))
	{
		new pID, Rang, string[128];
		if(sscanf(params,"ui",pID,Rang))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /makeadmin [SpielerID] [Rang]");
	    if(Rang > 5 || Rang < 0)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /makeadmin [SpielerID] [Rang(1-5)]");
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    SpielerInfo[pID][sAdmin] = Rang;
	    if(Rang != 0)
	    {
		    format(string,128,"%s %s hat %s zu einem '%s' ernannt. Willkommen im Team!",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],AdminName(pID));
			SendAdminMessage(COLOR_INFO,string);

			givePlayerTitle(pID, TITLE_TEAMMEMBER);
		}
		else if(Rang == 0)
		{
		    if(GetPVarInt(pID,"AdminDuty") > 0)
			{
			    SetPlayerHealth(pID,100);
	  			if(GetPVarInt(pID,"Supmobil") != 0)
		    	{
					DeleteVehicle(GetPVarInt(pID,"Supmobil"));
					DeletePVar(pID,"Supmobil");
					SendClientMessage(pID,COLOR_RED,"Supmobil wurde gelöscht.");
				}
	   			format(string,sizeof(string),"%s",SpielerInfo[pID][sName]);
			    SetPlayerName(pID, string);
				DeletePVar(pID,"AdminDuty");
				DestroyDynamic3DTextLabel(AdmDutyLabel[playerid]);
			}

		    format(string,128,"%s %s hat %s zu einem '%s' ernannt. Er ist nun kein Teammitglied mehr.",AdminName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],AdminName(pID));
			SendAdminMessage(COLOR_INFO,string);
			format(string,128,"%s %s hat dich zu einem '%s' ernannt. Du bist nun kein Teammitglied mehr.",AdminName(playerid),SpielerInfo[playerid][sName],AdminName(pID));
			SendClientMessage(pID,COLOR_INFO,string);
		}
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/makeadmin' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}