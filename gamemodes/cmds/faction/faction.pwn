CMD:invite(playerid,params[])
{
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	new pID, string[464];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/invite [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[pID][sFraktion] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bereits in einer Fraktion.");
	if(GetPlayerScore(pID) < 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler hat nicht das dritte Level erreicht.");
	if(SpielerInfo[pID][sFrakSperre] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der einzuladene Spieler hat eine aktive Fraksperre.");
	format(string,128,"Du hast %s in die Fraktion eingeladen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_YELLOW,string);
	format(string,sizeof(string),"{FFFFFF}Lieber %s\n\nDie Fraktion '{007DFF}%s{FFFFFF}' hat dich soeben eingeladen ein Teil von ihr zu werden.\nDu kannst das Angebot ablehnen, solltest du es annehmen beachte bitte die Regeln für Fraktionen\nim Forum. Du hast dann eine Art Mindesvertragslaufzeit. Falls es in der Fraktion Probleme gibt und kannst du ein Teammitglied kontaktieren.",SpielerInfo[pID][sName],FrakName(SpielerInfo[playerid][sFraktion]));
	ShowPlayerDialog(pID,DIALOG_INVITE,DIALOG_STYLE_MSGBOX,"{007DFF}Fraktionsinvite",string,"Annehmen","Ablehnen");
	SetPVarInt(pID,"InvitedPID",playerid);
	return 1;
}

CMD:uninvite(playerid,params[])
{
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/uninvite [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(playerid == pID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich nicht selber aus der Fraktion schmeißen.");
	if(SpielerInfo[pID][sFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist nicht in deiner Fraktion.");
	if(SpielerInfo[pID][sLeader] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Leader uninviten.");
 	if(GetPVarInt(pID,"CopDuty") == 1){DeletePVar(pID,"CopDuty"); CopDuty--;}
 	if(GetPVarInt(pID,"FBIDuty") == 1){DeletePVar(pID,"FBIDuty"); FBIDuty--;}
 	if(GetPVarInt(pID,"MedicDuty") == 1){DeletePVar(pID,"MedicDuty"); MedicDuty--;}
 	if(GetPVarInt(pID,"FeuerwehrDuty") == 1){DeletePVar(pID,"FeuerwehrDuty"); FeuerwehrDuty--;}
 	if(GetPVarInt(pID,"SanNewsDuty") == 1){DeletePVar(pID,"SanNewsDuty"); SanNewsDuty--;}
 	if(GetPVarInt(pID,"OAmtDuty") == 1){DeletePVar(pID,"OAmtDuty"); OAmtDuty--;}
	ResetPlayerWeapons(pID);
	SetPlayerArmour(pID,0);
	SetPlayerColor(pID,COLOR_WHITE);
	SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
	SpielerInfo[pID][sFraktion] = 0;
	if(SpielerInfo[pID][sSpawn] == 1){SpielerInfo[pID][sSpawn] = 0;}
	FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakMembers]--;
	SpawnPlayerEx(pID);
	format(string,128,"Du hast %s aus deiner Fraktion geschmissen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_RED,string);
	format(string,128,"%s %s hat dich aus der Fraktion geschmissen. Du bist nun wieder Zivilist.",RangName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	return 1;
}

CMD:giverang(playerid,params[])
{
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
    new pID, Rang, string[128];
	if(sscanf(params,"ud",pID,Rang))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setrang [SpielerID] [Rang]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[pID][sFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler gehört nicht zu deiner Fraktion.");
	if(Rang > 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Leaderrang vergeben. (Rang 1-6)");
	if(Rang < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es können nur Ränge von 1-6 vergeben werden.");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir dein Rang nicht setzen.");
	if(SpielerInfo[pID][sRank] > SpielerInfo[playerid][sRank])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Fraktionsmitglied besitzt einen höhren Rang als du.");
	SpielerInfo[pID][sRank] = Rang;
	format(string,128,"%s %s hat dir den Rang '%s' vergeben.",RangName(playerid),SpielerInfo[playerid][sName],RangName(pID));
	SendClientMessage(pID,COLOR_BLUE,string);
	format(string,128,"Du hast %s den Rang '%s' vergeben.",SpielerInfo[pID][sName],RangName(pID));
	SendClientMessage(playerid,COLOR_BLUE,string);
	return 1;
}
alias:giverang("setrang")

CMD:members(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du gehörst keiner Fraktion an.");
 	new string[300];
  	mysql_format(sqlHandle, string, sizeof(string),"SELECT Name, Online, Rank, Connected FROM `accounts` WHERE `Fraktion` = '%d' ORDER BY `ID` ASC", SpielerInfo[playerid][sFraktion]);
 	new Cache:result = mysql_query(sqlHandle, string);

	new membername[25], allemember[1024], onoff[3] = 0, rank[3] = 0, headstring[50], dialogtistring[128], members = 0, lastseen[36];
	format(headstring,sizeof(headstring),"Name\tRang\tStatus\tZul. Online\n");
	new rows = cache_num_rows();
	for(new i = 0; i < rows; i++)
	{
 		members++;
   		cache_get_value_name(i, "Name",membername);
	    cache_get_value_name(i, "Online",onoff);
	    cache_get_value_name(i, "Rank",rank);
	    cache_get_value_name(i, "Connected",lastseen);

		if(strval(onoff) > 0)
  		{
    		format(allemember,sizeof(allemember),"{00FE00}%s\t{00FE00}%d\t{00FE00}Online{FFFFFF}\t%s\n%s",membername,strval(rank),lastseen,allemember);
    	}
	    else
	    {
     		format(allemember,sizeof(allemember),"{FFFFFF}%s\t%d\tOffline\t%s\n%s",membername,strval(rank),lastseen,allemember);
	    }
	}
	strins(allemember, headstring, 0);
	format(dialogtistring,sizeof(dialogtistring),"{007DFF}"SERV_NAME"{FFFFFF} - %s - %d Mitglieder",FrakKurzel(SpielerInfo[playerid][sFraktion]),members);
 	ShowPlayerDialog(playerid,9992,DIALOG_STYLE_TABLIST_HEADERS,dialogtistring,allemember,"OK","");
  	cache_delete(result);
   	return 1;
}
alias:members("mitglieder")


CMD:flock(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 0)return NichtBerechtigt
	new Float:x,Float:y,Float:z, merker = true;
	for(new i = 1;i<MAX_VEHICLES;i++)
	{
 		if(!IsValidVehicle(i))continue;
  		GetVehiclePos(i,x,y,z);
		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
		{
  			if(FahrzeugInfo[i][fFraktion] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug gehört keiner Fraktion an.");
	    	if(FahrzeugInfo[i][fFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");

			if(DOOR[i] == false)
			{
			    GetVehicleParamsEx(i,engine,lights,alarm,doors,bonnet,boot,objective);
			    if(Licht[i] == false)
			    {
			    	SetVehicleParamsEx(i,engine,true,alarm,doors,bonnet,boot,objective);
    				SetTimerEx("LockLicht",1000,false,"i",i);
				}
				SetVehicleParamsEx(i,engine,lights,alarm,true,bonnet,boot,objective);
    			DOOR[i] = true;
			    if(IsAHelikopter(i)){GameTextForPlayer(playerid,"~w~Helikopter~n~~r~abgeschlossen",2000,6);}
			    else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~r~abgeschlossen",2000,6);
			    merker = false;
			    foreach(new id : Player)
				{
					if(IsPlayerInRangeOfPoint(id,12.0,x,y,z))
					{
						PlayerPlaySound(id, 1147, 0.0, 0.0, 0.0);
					}
					if(GetPlayerVehicleID(id) == i)
	    			{
        				PlayerTextDrawShow(i, Tacho[id][12]);
				    }
				}
				return 1;
			}
			else if(DOOR[i] == true)
			{
			    GetVehicleParamsEx(i,engine,lights,alarm,doors,bonnet,boot,objective);
   				if(Licht[i] == false)
			    {
			    	SetVehicleParamsEx(i,engine,true,alarm,doors,bonnet,boot,objective);
    				SetTimerEx("LockLicht",1000,false,"i",i);
				}
				SetVehicleParamsEx(i,engine,lights,alarm,false,bonnet,boot,objective);
    			DOOR[i] = false;
			    if(IsAHelikopter(i)){GameTextForPlayer(playerid,"~w~Helikopter~n~~g~aufgeschlossen",2000,6);}
			    else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~g~aufgeschlossen",2000,6);
			    merker = false;
			    foreach(new id : Player)
				{
					if(IsPlayerInRangeOfPoint(id,12.0,x,y,z))
					{
						PlayerPlaySound(id, 1147, 0.0, 0.0, 0.0);
					}
     				if(GetPlayerVehicleID(id) == i)
 					{
      					PlayerTextDrawHide(i, Tacho[id][12]);
   					}
				}
    			return 1;
			}
		}
	}
	if(merker)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht in der Nähe eines Fraktionsfahrzeugs.");
 	}
	return 1;
}

CMD:frakv(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 0)return NichtBerechtigt
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	ShowFrakVerwaltung(playerid);
	return 1;
}

CMD:leaderlist(playerid)
{
	new fName,igName[MAX_PLAYER_NAME],showList[1200];
	new Cache:result = mysql_query(sqlHandle, "SELECT `Name`, `Leader` FROM `accounts` WHERE `Leader` > 0");
	new rows = cache_num_rows();
	for(new i = 0; i < rows; i++) {
		cache_get_value_name_int(i, "Leader", fName);
		cache_get_value_name(i, "Name", igName);
		format(showList,sizeof(showList),"{FFFFFF}%s Leader: %s (%s{FFFFFF})\n%s",GetFraktion(fName),igName,((!OnlineByName(igName))?("{F6000F}Offline"):("{00EE14}Online")), showList);
	}
	cache_delete(result);
	ShowPlayerDialog(playerid,DIALOG_LEADERS,DIALOG_STYLE_MSGBOX,"Leaders",showList,"Bestätigen","");
	return 1;
}
alias:leaderlist("leader")

CMD:fpark(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
    if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fFraktion] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fraktionsfahrzeug.");
	if(FahrzeugInfo[tmpcar][fFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	new Float:Position[4], vehicleid;
	GetVehiclePos(tmpcar,Position[0],Position[1],Position[2]);
	GetVehicleZAngle(tmpcar,Position[3]);
	vehicleid = CreateVehicle(FahrzeugInfo[tmpcar][fModelID],Position[0],Position[1],Position[2],Position[3],FahrzeugInfo[tmpcar][fColor][0],FahrzeugInfo[tmpcar][fColor][1],-1);
 	CreateFrakNummernSchild(vehicleid,FahrzeugInfo[tmpcar][fFraktion]);
	FahrzeugInfo[vehicleid][fDatabaseID] = FahrzeugInfo[tmpcar][fDatabaseID];
	FahrzeugInfo[vehicleid][fErstellt] = FahrzeugInfo[tmpcar][fErstellt];
	FahrzeugInfo[vehicleid][fModelID] = FahrzeugInfo[tmpcar][fModelID];
	FahrzeugInfo[vehicleid][fPosition][0] = Position[0];
	FahrzeugInfo[vehicleid][fPosition][1] = Position[1];
	FahrzeugInfo[vehicleid][fPosition][2] = Position[2];
	FahrzeugInfo[vehicleid][fPosition][3] = Position[3];
	FahrzeugInfo[vehicleid][fColor][0] = FahrzeugInfo[tmpcar][fColor][0];
	FahrzeugInfo[vehicleid][fColor][1] = FahrzeugInfo[tmpcar][fColor][1];
	FahrzeugInfo[vehicleid][fPaintjob] = FahrzeugInfo[tmpcar][fPaintjob];
	FahrzeugInfo[vehicleid][fKennzeichen] = FahrzeugInfo[tmpcar][fKennzeichen];
	FahrzeugInfo[vehicleid][fAbgeschleppt] = FahrzeugInfo[tmpcar][fAbgeschleppt];
	FahrzeugInfo[vehicleid][fParkkralle] = FahrzeugInfo[tmpcar][fParkkralle];
	FahrzeugInfo[vehicleid][fKilometer] = FahrzeugInfo[tmpcar][fKilometer];
	FahrzeugInfo[vehicleid][fTank] = FahrzeugInfo[tmpcar][fTank];
	FahrzeugInfo[vehicleid][fRang] = FahrzeugInfo[tmpcar][fRang];
	for(new i=0;i<14;i++){ FahrzeugInfo[vehicleid][fTuning][i] = FahrzeugInfo[tmpcar][fTuning][i]; }
	FahrzeugInfo[vehicleid][fFraktion] = FahrzeugInfo[tmpcar][fFraktion];
	FahrzeugInfo[vehicleid][fAutohaus] = FahrzeugInfo[tmpcar][fAutohaus];
	FahrzeugInfo[vehicleid][fNebenjob] = FahrzeugInfo[tmpcar][fNebenjob];
	FahrzeugInfo[vehicleid][fGarage] = FahrzeugInfo[tmpcar][fGarage];
	FahrzeugInfo[vehicleid][fGPark] = FahrzeugInfo[tmpcar][fGPark];
	FahrzeugInfo[vehicleid][fFahrschule] = FahrzeugInfo[tmpcar][fFahrschule];
	FahrzeugInfo[vehicleid][fSupmobil] = FahrzeugInfo[tmpcar][fSupmobil];
	FahrzeugInfo[vehicleid][fZiviroller] = FahrzeugInfo[tmpcar][fZiviroller];
	FahrzeugInfo[vehicleid][fImportCar] = FahrzeugInfo[tmpcar][fImportCar];
	FahrzeugInfo[vehicleid][fKurrierCar] = FahrzeugInfo[tmpcar][fKurrierCar];
	FahrzeugInfo[vehicleid][fPreis] = FahrzeugInfo[tmpcar][fPreis];
	FahrzeugInfo[vehicleid][fLabel] = FahrzeugInfo[tmpcar][fLabel];
	FahrzeugInfo[vehicleid][fBesitzer] = FahrzeugInfo[tmpcar][fBesitzer];
	FahrzeugInfo[vehicleid][fBesitzerID] = FahrzeugInfo[tmpcar][fBesitzerID];
	FahrzeugInfo[vehicleid][fPizzaObjekt] = FahrzeugInfo[tmpcar][fPizzaObjekt];
	FahrzeugInfo[vehicleid][fkGeld] = FahrzeugInfo[tmpcar][fkGeld];
	FahrzeugInfo[vehicleid][fkDrogen] = FahrzeugInfo[tmpcar][fkDrogen];
	FahrzeugInfo[vehicleid][fJobEXP] = FahrzeugInfo[tmpcar][fJobEXP];
	new Float:vehHealth;
	GetVehicleHealth(tmpcar,vehHealth);
	SetVehicleHealth(vehicleid,vehHealth);
	DeleteVehicle(tmpcar);
	AddTuning(vehicleid);
	AddOther(vehicleid);
	PutPlayerInVehicle(playerid,vehicleid,0);
	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);
	Motor[vehicleid] = false;
	Licht[vehicleid] = false;
	Motorhaube[vehicleid] = false;
	Kofferraum[vehicleid] = false;
	DOOR[vehicleid] = true;
 	SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Das Fraktionsfahrzeug wurde erfolgreich umgeparkt.");
 	return 1;
}

CMD:fcarsell(playerid, params[])
{
	new string[64], tmpcar = GetPlayerVehicleID(playerid);
 	if(SpielerInfo[playerid][sFraktion] == 0)return NichtBerechtigt
  	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
   	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fFraktion] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fraktionsfahrzeug.");
	if(FahrzeugInfo[tmpcar][fFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fraktionsfahrzeug gehört nicht deiner Fraktion.");
 	SetPVarInt(playerid,"FahrzeugVerkaufen",1);
	SetPVarInt(playerid,"FahrzeugVerkaufenPreis", FahrzeugInfo[tmpcar][fPreis]/2);
 	format(string,sizeof(string),"{FFFFFF}Möchtest du den {009BFF}%s{FFFFFF} für {009BFF}%d${FFFFFF} verkaufen ?",FahrzeugName[FahrzeugInfo[tmpcar][fModelID]-400], FahrzeugInfo[tmpcar][fPreis]/2);
  	ShowPlayerDialog(playerid,DIALOG_FAHRZEUG_VERKAUFEN,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsfahrzeug",string,"Ja","Nein");
	return 1;
}

CMD:frakliste(playerid, params[])
{
	new frakliste[7][128], fraklistestr[564];
	format(frakliste[0],128,"{FFFFFF}1. San Andreas Government Department\n2. San Andreas Police Department\n3. Keine Fraktion (SFPD)");
	format(frakliste[1],128,"{FFFFFF}4. Keine Fraktion (LVPD)\n5. San Andreas Medical Department\n6. Federal Bureau of Investigation");
	format(frakliste[2],128,"{FFFFFF}7. San Andreas Ordnungsamt\n8. Interglobal Television\n9. Grove Street Families");
	format(frakliste[3],128,"{FFFFFF}10. Rolling High Ballas\n11. Los Santos Vagos\n12. Los Aztecas");
	format(frakliste[4],128,"{FFFFFF}13. San Fierro Rifa\n14. Triaden\n15. Yakuza");
	format(frakliste[5],128,"{FFFFFF}16. Camorra\n17. La Cosa Nostra\n18. Russian Mafia\n19. International Contract Agency");
	format(fraklistestr,sizeof fraklistestr,"%s\n%s\n%s\n%s\n%s\n%s",frakliste[0],frakliste[1],frakliste[2],frakliste[3],frakliste[4],frakliste[5]);
	ShowPlayerDialog(playerid,DIALOG_FSCHULE_THEORI,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Fraktionsliste",fraklistestr,"Weiter","");
 	return 1;
}
alias:frakliste("fl")

CMD:f(playerid,params[])
{
	if(IsPlayerInAnyGang(playerid) || SpielerInfo[playerid][sFraktion] == 8 || SpielerInfo[playerid][sFraktion] == 19)
	{
	    new text[254], string[300];
	    if(sscanf(params,"s[254]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/f [Text]");
	    format(string,sizeof(string),"* %s %s: %s",RangName(playerid),SpielerInfo[playerid][sName],text);
	    SendClientMessage(playerid,COLOR_BLUE,string);
		for(new ss = 0; ss < MAX_PLAYERS; ss++)
	    {
	        if(SpielerInfo[ss][sFraktion] == SpielerInfo[playerid][sFraktion])
	        {
	            if(playerid != ss)
				{
				    SendSplitMessage(ss,COLOR_BLUE,string);
		        	//SCM(ss,COLOR_BLUE,string);
				}
			}
	    }
	    return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:kidnap(playerid,params[])
{
	if(IsPlayerInAnyGang(playerid))
	{
	    if(!IsAllowedForCommand(playerid,"Kidnap"))return KeinRang
	    if(GetPVarInt(playerid,"TriedToNap") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Nach einer gescheiterten Entführung musst du 30 Sekunden nachdenken.");
	    new pID, Platz;
	    if(sscanf(params,"ui",pID,Platz))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/kidnap [SpielerID] [Sitzplatz | Hinten Links = 1 | Hinten Rechts = 2]");
        if(!IsPlayerConnectedEx(pID))return NichtOnline
        if(GetDistanceBetweenPlayersEx(playerid, pID) >= 8)return NichtNahe
        new Float:armour;
		GetPlayerArmour(pID, armour);
		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
		new PLAYER_STATE:State=GetPlayerState(playerid);
		if(State!=PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
		if(armour > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler hat eine Schutzweste an.");
		if(Platz < 1 || Platz > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Sitzplatz: Du kannst jemanden nur auf der Rückbank fesseln.");
		new rand = random(3), string[128];
		if(rand == 0)
		{
		    format(string,sizeof(string),"* %s zieht %s in sein Fahrzeug und fesselt ihn.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
		    TogglePlayerControllable(pID,false);
		    SetPVarInt(pID,"GangCuffed",1);
		    if(Platz == 1){PutPlayerInVehicle(pID,GetPlayerVehicleID(playerid),2);}
		    else if(Platz == 2){PutPlayerInVehicle(pID,GetPlayerVehicleID(playerid),3);}
		    ProxDetector(20.0, playerid, string, 0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF);
		    return 1;
		}
		else
		{
		    format(string,sizeof(string),"* %s scheitert bei dem Versuch %s in sein Fahrzeug zu ziehen und zu fesseln.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
		    SetTimerEx("TryToNap",30000,false,"i",playerid);
		    SetPVarInt(playerid,"TriedToNap",1);
		    ProxDetector(20.0, playerid, string, 0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF);
		    return 1;
	    }
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du gehörst keiner Gang/Mafia an.");
	return 1;
}

CMD:fesseln(playerid,params[])
{
	if(!IsPlayerInAnyGang(playerid))return NichtBerechtigt
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/fesseln [SpielerID]");
	if(GetPlayerVehicleID(pID) != GetPlayerVehicleID(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler sitzt nicht in deinem Fahrzeug.");
	new PLAYER_STATE:State=GetPlayerState(pID);
	if(State==PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst den Fahrer nicht ent/fesseln.");
	new string[128];
	if(GetPVarInt(pID,"GangCuffed") > 0)
	{
	    format(string,sizeof(string),"* %s nimmt %s die fesseln ab.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	    TogglePlayerControllable(pID,true);
	    DeletePVar(pID,"GangCuffed");
	    ProxDetector(20.0, playerid, string, 0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF);
	}
	else
	{
	    format(string,sizeof(string),"* %s nimmt ein paar Seile und fesselt %s.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	    TogglePlayerControllable(pID,false);
	    SetPVarInt(pID,"GangCuffed",1);
	    ProxDetector(20.0, playerid, string, 0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF,0xB400FFFF);
	}
	return 1;
}