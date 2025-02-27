CMD:gruppenv(playerid, params[])
{
 	if(SpielerInfo[playerid][sGruppe] == 0)return NichtBerechtigt
	if(SpielerInfo[playerid][sGLeader] == 0)return NichtBerechtigt
	new gid = SpielerInfo[playerid][sGruppe];
	if(GruppenInfo[gid][gUpgrade][0] == 0){ShowPlayerDialog(playerid,DIALOG_GRUPPEV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppenverwaltung","Upgrades\nFahrzeugverwaltung\nRangnamen bearbeiten","Weiter","Abbrechen");}
	else if(GruppenInfo[gid][gUpgrade][0] == 1){ShowPlayerDialog(playerid,DIALOG_GRUPPEV,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppenverwaltung","Upgrades\nFahrzeugverwaltung\nRangnamen bearbeiten\nGehaltverwaltung","Weiter","Abbrechen");}
	return 1;
}

CMD:gupgrade(playerid,params[])
{
	new gid, str[144];
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"d",gid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gupgrade [GruppenID]");
    if(GruppenInfo[gid][gErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese GruppenID existiert nicht.");
    GruppenInfo[gid][gUpgrade][0] = 1;
	foreach(new i : Player)
	{
 	    if(SpielerInfo[i][sGruppe] != gid)continue;
		format(str,sizeof(str),"%s %s hat eurer Gruppe das Gehaltupgrade aktiviert.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessage(i,COLOR_INFO,str);
	}
	SendClientMessage(playerid,COLOR_SUPER,"Du hast der Gruppe erfolgreich das Upgrade freigeschaltet.");
	return 1;
}

CMD:ginvite(playerid,params[])
{
	if(SpielerInfo[playerid][sGRank] < 6)return NichtBerechtigt
	new pID, string[464];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ginvite [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[pID][sGruppe] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bereits in einer Gruppe.");
	if(GetPlayerScore(pID) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler hat noch nicht das zweite Level erreicht.");
	format(string,128,"Du hast %s in die Gruppe eingeladen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_YELLOW,string);
	format(string,sizeof(string),"{FFFFFF}Lieber %s\n\nDie Gruppe '{007DFF}%s{FFFFFF}' hat dich soeben eingeladen ein Teil von ihr zu werden.\nDu kannst das Angebot ablehnen, solltest du es annehmen beachte bitte die Regeln für die Gruppe.\nFalls es in der Gruppe Probleme gibt, kannst du jederzeit ein Teammitglied kontaktieren.",SpielerInfo[pID][sName],GruppenInfo[SpielerInfo[playerid][sGruppe]][gName]);
	ShowPlayerDialog(pID,DIALOG_GRUPPEN_INVITE,DIALOG_STYLE_MSGBOX,"{007DFF}Gruppeninvite",string,"Annehmen","Ablehnen");
	SetPVarInt(pID,"InvitedPID",playerid);
	return 1;
}

CMD:guninvite(playerid,params[])
{
	if(SpielerInfo[playerid][sGRank] < 6)return NichtBerechtigt
	new pID, string[128];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/guninvite [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(playerid == pID)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich nicht selber aus der Gruppe schmeißen.");
	if(SpielerInfo[pID][sGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist nicht in deiner Gruppe.");
	if(SpielerInfo[pID][sGRank] == 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Leader uninviten.");
	SpielerInfo[pID][sGruppe] = 0;
	SpielerInfo[pID][sGRank] = 0;
	SpielerInfo[pID][sGHaus] = 0;
	format(string,128,"Du hast Spieler %s aus deiner Gruppe geschmissen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_RED,string);
	format(string,128,"%s %s hat dich aus der Gruppe geschmissen.",GRangName(playerid),SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	return 1;
}

CMD:gc(playerid,params[])
{
	new Text[128], string[144];
	if(SpielerInfo[playerid][sGruppe] == 0)return NichtBerechtigt
 	if(SpielerInfo[playerid][sMuted] > 0)
    {
        format(string,sizeof(string),"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
        SendClientMessage(playerid,COLOR_RED,string);
        return 1;
    }
	if(sscanf(params,"s[128]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gc [Nachricht]");
	foreach(new i : Player)
	{
		if(SpielerInfo[i][sGruppe] != SpielerInfo[playerid][sGruppe])continue;
		format(string,128,"[Gruppenchat]: %s %s sagt: %s",GRangName(playerid),SpielerInfo[playerid][sName],Text);
		SendClientMessage(i,COLOR_ORANGE,string);
	}
	return 1;
}

CMD:givegrang(playerid,params[])
{
	if(SpielerInfo[playerid][sGRank] < 6)return NichtBerechtigt
    new pID, Rang, string[128];
	if(sscanf(params,"ui",pID,Rang))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/setgrang [SpielerID] [Rang]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(SpielerInfo[pID][sGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler gehört nicht zu deiner Gruppe.");
	if(Rang > 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst keinen Leaderrang vergeben. (Rang 1-6)");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir dein Rang nicht setzen.");
	if(SpielerInfo[pID][sGRank] > SpielerInfo[playerid][sGRank])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Gruppenmitglied besitzt einen höhren Rang als du.");
	SpielerInfo[pID][sGRank] = Rang;
	format(string,128,"%s %s hat dir den Rang '%s' vergeben.",GRangName(playerid),SpielerInfo[playerid][sName],GRangName(pID));
	SendClientMessage(pID,COLOR_BLUE,string);
	format(string,128,"Du hast %s den Rang '%s' vergeben.",SpielerInfo[pID][sName],GRangName(pID));
	SendClientMessage(playerid,COLOR_BLUE,string);
	return 1;
}
alias:givegrang("setgrang")

CMD:gmembers(playerid, params[])
{
	if(SpielerInfo[playerid][sGruppe] == 0)return NichtBerechtigt
	new string[144];
	SendClientMessage(playerid,COLOR_INFO,"** Gruppenmembers Online-Liste **");
	foreach(new i : Player)
	{
 		if(SpielerInfo[i][sGruppe] == SpielerInfo[playerid][sGruppe])
   		{
     		format(string,sizeof(string),"%s %s",GRangName(i),SpielerInfo[i][sName]);
       		SendClientMessage(playerid,COLOR_WHITE,string);
	    }
	}
	SendClientMessage(playerid,COLOR_INFO,"____________________________________");
	return 1;
}


CMD:gpark(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
   	if(SpielerInfo[playerid][sGRank] < 6)return NichtBerechtigt
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Gruppenfahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	new Float:Position[4], vehicleid;
	GetVehiclePos(tmpcar,Position[0],Position[1],Position[2]);
	GetVehicleZAngle(tmpcar,Position[3]);
	vehicleid = CreateVehicle(FahrzeugInfo[tmpcar][fModelID],Position[0],Position[1],Position[2],Position[3],FahrzeugInfo[tmpcar][fColor][0],FahrzeugInfo[tmpcar][fColor][1],-1);
	format(FahrzeugInfo[vehicleid][fKennzeichen], 5, FahrzeugInfo[tmpcar][fKennzeichen]);
	SetVehicleNumberPlate(vehicleid,FahrzeugInfo[tmpcar][fKennzeichen]);
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
	FahrzeugInfo[vehicleid][fGruppe] = FahrzeugInfo[tmpcar][fGruppe];
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
 	SendClientMessage(playerid,COLOR_SUPER,"Das Gruppenfahrzeug wurde erfolgreich umgeparkt.");
  	return 1;
}


CMD:glock(playerid, params[])
{
	if(SpielerInfo[playerid][sGruppe] == 0)return NichtBerechtigt
	new Float:x,Float:y,Float:z, merker = true;
	for(new i = 1;i<MAX_VEHICLES;i++)
	{
 		if(!IsValidVehicle(i))continue;
  		GetVehiclePos(i,x,y,z);
		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
		{
  			if(FahrzeugInfo[i][fGruppe] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug gehört keiner Gruppe an.");
	    	if(FahrzeugInfo[i][fGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
      		if(FahrzeugInfo[i][fRang] > SpielerInfo[playerid][sGRank])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt nicht den erforderlichen Rang");

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
        				PlayerTextDrawShow(i, Tacho[id][12]);
				    }
				}
    			return 1;
			}
		}
	}
	if(merker)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht in der Nähe eines Gruppenfahrzeuges.");
 	}
	return 1;
}

CMD:gcarsell(playerid, params[])
{
	new string[64], tmpcar = GetPlayerVehicleID(playerid);
 	if(SpielerInfo[playerid][sGruppe] == 0)return NichtBerechtigt
  	if(SpielerInfo[playerid][sGRank] < 6)return NichtBerechtigt
   	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Gruppenfahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Gruppenfahrzeug gehört nicht deiner Fraktion.");
 	SetPVarInt(playerid,"FahrzeugVerkaufen",3);
  	SetPVarInt(playerid,"FahrzeugVerkaufenPreis", FahrzeugInfo[tmpcar][fPreis]/2);
   	format(string,sizeof(string),"{FFFFFF}Möchtest du den {009BFF}%s{FFFFFF} für {009BFF}%d${FFFFFF} verkaufen ?",FahrzeugName[FahrzeugInfo[tmpcar][fModelID]-400], FahrzeugInfo[tmpcar][fPreis]/2);
    ShowPlayerDialog(playerid,DIALOG_FAHRZEUG_VERKAUFEN,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppenfahrzeug",string,"Ja","Nein");
	return 1;
}

CMD:creategruppe(playerid, params[])
{
	if(!IsPlayerAtPickupByType(playerid, 5.0, PICKUP_TYPE_CREATEGROUP))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht in der Stadthalle am Gruppen Icon.");
 	if(GetPlayerScore(playerid) < 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Um eine Gruppe gründen zu können, benötigst du min. das dritte Level.");
  	if(SpielerInfo[playerid][sGLeader] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt bereits eine Gruppe.");
	if(SpielerInfo[playerid][sGruppe] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist bereits in eine Gruppe. Verlasse diese vorher.");
	if(SpielerInfo[playerid][sGHaus] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}{FF0000}Michelle S.{FFFFFF} sagt: Komm wieder, wenn du ein Gruppenhaus besitzt.");
 	if(GetPlayerMoneyEx(playerid) < 250000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}{FF0000}Michelle S.{FFFFFF} sagt: Komm wieder, wenn du 250.000$ dabei hast.");
 	ShowPlayerDialog(playerid,DIALOG_CREATE_GRUPPE,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - Gruppe erstellen","Bitte gib unten ein Namen deiner Gruppe ein.","Weiter","Abbrechen");
  	return 1;
}