CMD:givegun(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 2)return NichtBerechtigt
	new pID, Waffenid, Munition, string[128];
	if(sscanf(params,"uii",pID,Waffenid,Munition))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze /givegun [SpielerID] [WaffenID] [Munition]");
	{
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		GivePlayerWeapon(pID,WEAPON:Waffenid,Munition);
		format(string,128,"Du hast dem %s die Waffe '%s' mit %d Munition gegeben.",SpielerInfo[pID][sName],WaffenName(Waffenid),Munition);
		SendClientMessage(playerid,COLOR_SUPER,string);
		format(string,128,"%s %s hat dir die Waffe '%s' mit %d Munition gegeben.",AdminName(playerid),SpielerInfo[playerid][sName],WaffenName(Waffenid),Munition);
		SendClientMessage(pID,COLOR_SUPER,string);
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givegun' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
}

CMD:parkcar(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
 	new vehicleid = GetPlayerVehicleID(playerid), Float:Position[4];
 	GetVehiclePos(vehicleid,Position[0],Position[1],Position[2]);
	GetVehicleZAngle(vehicleid,Position[3]);
	new newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1],-1);
    if(FahrzeugInfo[vehicleid][fNebenjob] > 0)
    {
		format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Nebenjob");
		SetVehicleNumberPlate(newvehicleid,"Nebenjob");
	}
	else if(FahrzeugInfo[vehicleid][fAutohaus] > 0)
	{
		format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Autohaus");
		SetVehicleNumberPlate(newvehicleid,"Autohaus");
	}
	else if(FahrzeugInfo[vehicleid][fFraktion] > 0)
	{
	    CreateFrakNummernSchild(newvehicleid,FahrzeugInfo[vehicleid][fFraktion]);
	}
	else if(FahrzeugInfo[vehicleid][fGruppe] > 0)
	{
		format(FahrzeugInfo[newvehicleid][fKennzeichen], 5, FahrzeugInfo[vehicleid][fKennzeichen]);
		SetVehicleNumberPlate(newvehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);
	}
	else if(FahrzeugInfo[vehicleid][fFahrschule] > 0)
	{
		format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Fahrschule");
		SetVehicleNumberPlate(newvehicleid,"Fahrschule");
	}
	DestroyDynamic3DTextLabel(FahrzeugInfo[vehicleid][fLabel]);
	FahrzeugInfo[vehicleid][fLabel] = Text3D:INVALID_3DTEXT_ID;
	FahrzeugInfo[newvehicleid][fDatabaseID] = FahrzeugInfo[vehicleid][fDatabaseID];
	FahrzeugInfo[newvehicleid][fErstellt] = FahrzeugInfo[vehicleid][fErstellt];
	FahrzeugInfo[newvehicleid][fModelID] = FahrzeugInfo[vehicleid][fModelID];
	FahrzeugInfo[newvehicleid][fPosition][0] = Position[0];
	FahrzeugInfo[newvehicleid][fPosition][1] = Position[1];
	FahrzeugInfo[newvehicleid][fPosition][2] = Position[2];
	FahrzeugInfo[newvehicleid][fPosition][3] = Position[3];
	FahrzeugInfo[newvehicleid][fColor][0] = FahrzeugInfo[vehicleid][fColor][0];
	FahrzeugInfo[newvehicleid][fColor][1] = FahrzeugInfo[vehicleid][fColor][1];
	FahrzeugInfo[newvehicleid][fPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];
	FahrzeugInfo[newvehicleid][fAbgeschleppt] = FahrzeugInfo[vehicleid][fAbgeschleppt];
	FahrzeugInfo[newvehicleid][fParkkralle] = FahrzeugInfo[vehicleid][fParkkralle];
	FahrzeugInfo[newvehicleid][fKilometer] = FahrzeugInfo[vehicleid][fKilometer];
	FahrzeugInfo[newvehicleid][fTank] = FahrzeugInfo[vehicleid][fTank];
	FahrzeugInfo[newvehicleid][fRang] = FahrzeugInfo[vehicleid][fRang];
	for(new i=0;i<14;i++){
	FahrzeugInfo[newvehicleid][fTuning][i] = FahrzeugInfo[vehicleid][fTuning][i];}
	FahrzeugInfo[newvehicleid][fFraktion] = FahrzeugInfo[vehicleid][fFraktion];
	FahrzeugInfo[newvehicleid][fGruppe] = FahrzeugInfo[vehicleid][fGruppe];
	FahrzeugInfo[newvehicleid][fAutohaus] = FahrzeugInfo[vehicleid][fAutohaus];
	FahrzeugInfo[newvehicleid][fNebenjob] = FahrzeugInfo[vehicleid][fNebenjob];
	FahrzeugInfo[newvehicleid][fGarage] = FahrzeugInfo[vehicleid][fGarage];
	FahrzeugInfo[newvehicleid][fGPark] = FahrzeugInfo[vehicleid][fGPark];
	FahrzeugInfo[newvehicleid][fFahrschule] = FahrzeugInfo[vehicleid][fFahrschule];
	FahrzeugInfo[newvehicleid][fSupmobil] = FahrzeugInfo[vehicleid][fSupmobil];
	FahrzeugInfo[newvehicleid][fZiviroller] = FahrzeugInfo[vehicleid][fZiviroller];
	FahrzeugInfo[newvehicleid][fImportCar] = FahrzeugInfo[vehicleid][fImportCar];
 	FahrzeugInfo[newvehicleid][fKurrierCar] = FahrzeugInfo[vehicleid][fKurrierCar];
	FahrzeugInfo[newvehicleid][fPreis] = FahrzeugInfo[vehicleid][fPreis];
	FahrzeugInfo[newvehicleid][fLabel] = FahrzeugInfo[vehicleid][fLabel];
	FahrzeugInfo[newvehicleid][fBesitzer] = FahrzeugInfo[vehicleid][fBesitzer];
	FahrzeugInfo[newvehicleid][fBesitzerID] = FahrzeugInfo[vehicleid][fBesitzerID];
	FahrzeugInfo[newvehicleid][fPizzaObjekt] = FahrzeugInfo[vehicleid][fPizzaObjekt];
	FahrzeugInfo[newvehicleid][fkGeld] = FahrzeugInfo[vehicleid][fkGeld];
	FahrzeugInfo[newvehicleid][fkDrogen] = FahrzeugInfo[vehicleid][fkDrogen];
	FahrzeugInfo[newvehicleid][fJobEXP] = FahrzeugInfo[vehicleid][fJobEXP];
	DeleteVehicle(vehicleid);
	AddTuning(newvehicleid);
	AddOther(newvehicleid);
	PutPlayerInVehicle(playerid,newvehicleid,0);
	GetVehicleParamsEx(newvehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(newvehicleid, false, false, false, true, false, false, false);
	Motor[newvehicleid] = false;
	Licht[newvehicleid] = false;
	Motorhaube[newvehicleid] = false;
	Kofferraum[newvehicleid] = false;
	DOOR[newvehicleid] = true;

	new query[256];
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `vehicles` SET `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f' WHERE `ID`='%d'",
	FahrzeugInfo[newvehicleid][fPosition][0], FahrzeugInfo[newvehicleid][fPosition][1], FahrzeugInfo[newvehicleid][fPosition][2], FahrzeugInfo[newvehicleid][fPosition][3],
	FahrzeugInfo[newvehicleid][fDatabaseID]);
	mysql_tquery(sqlHandle, query);

	SendClientMessage(playerid,COLOR_SUPER,"Das Fahrzeug wurde erfolgreich umgeparkt.");
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/parkcar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:deletecar(playerid,params[])
{
	new vehicleid, query[128];
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"d",vehicleid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/deletecar [FahrzeugID]");
    if(IsValidVehicle(vehicleid) || FahrzeugInfo[vehicleid][fDatabaseID] != 0)
    {
		mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `vehicles` WHERE `ID` = '%d'", FahrzeugInfo[vehicleid][fDatabaseID]);
		mysql_tquery(sqlHandle, query);
   		DeleteVehicle(vehicleid);
		SendClientMessage(playerid,COLOR_SUPER,"Das Fahrzeug wurde erfolgreich gelöscht.");
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/deletecar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
        return 1;
    }
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Entweder exestiert das Fahrzeug nicht, oder das angegebene Fahrzeug steht nicht in der vehicles Tabelle.");
    return 1;
}

CMD:editcar(playerid,params[])
{
	new vehicleid, Betrag, Auswahl[64], string[128];
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"ds[64]d",vehicleid,Auswahl,Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/editcar [FahrzeugID] [Fraktion|Nebenjob|Autohaus|Preis|Farbe1|Farbe2]");
    if(IsValidVehicle(vehicleid) || FahrzeugInfo[vehicleid][fDatabaseID] != 0)
    {
        new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/editcar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
   		if(strcmp(Auswahl, "Fraktion", true, strlen(Auswahl)) == 0)
    	{
			format(string,sizeof(string),"FahrzeugID: %d - Alte Fraktion: %d - Neue Fraktion: %d",vehicleid,FahrzeugInfo[vehicleid][fFraktion],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
			FahrzeugInfo[vehicleid][fFraktion] = Betrag;
	        return 1;
		}
		else if(strcmp(Auswahl, "Nebenjob", true, strlen(Auswahl)) == 0)
    	{
  			format(string,sizeof(string),"FahrzeugID: %d - Alter Nebenjob: %d - Neuer Nebenjob: %d",vehicleid,FahrzeugInfo[vehicleid][fNebenjob],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
			FahrzeugInfo[vehicleid][fNebenjob] = Betrag;
	        return 1;
		}
		else if(strcmp(Auswahl, "Autohaus", true, strlen(Auswahl)) == 0)
    	{
  			format(string,sizeof(string),"FahrzeugID: %d - Altes Autohaus: %d - Neues Autohaus: %d",vehicleid,FahrzeugInfo[vehicleid][fAutohaus],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
			FahrzeugInfo[vehicleid][fAutohaus] = Betrag;
			SaveVehicleById(vehicleid);
	        return 1;
		}
		else if(strcmp(Auswahl, "Preis", true, strlen(Auswahl)) == 0)
    	{
  			format(string,sizeof(string),"FahrzeugID: %d - Alter Preis: %d - Neuer Preis: %d",vehicleid,FahrzeugInfo[vehicleid][fPreis],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
			FahrzeugInfo[vehicleid][fPreis] = Betrag;
			format(string, sizeof(string), "{FE0000}%s {FFFFFF}zu verkaufen!\nPreis: {FE0000}%d$",FahrzeugName[FahrzeugInfo[vehicleid][fModelID]-400],FahrzeugInfo[vehicleid][fPreis]);
			UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, string);
			SaveVehicleById(vehicleid);
	        return 1;
		}
		else if(strcmp(Auswahl, "Farbe1", true, strlen(Auswahl)) == 0)
    	{
  			format(string,sizeof(string),"FahrzeugID: %d - Alte Farbe1: %d - Neue Farbe1: %d",vehicleid,FahrzeugInfo[vehicleid][fColor][0],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
	 		new Float:Position[4], newvehicleid;
		 	GetVehiclePos(vehicleid,Position[0],Position[1],Position[2]);
			GetVehicleZAngle(vehicleid,Position[3]);
			if(FahrzeugInfo[vehicleid][fNebenjob] != 0)
			{
				if(FahrzeugInfo[vehicleid][fNebenjob] == 1 || FahrzeugInfo[vehicleid][fNebenjob] == 3 || FahrzeugInfo[vehicleid][fNebenjob] == 4 ||
				FahrzeugInfo[vehicleid][fNebenjob] == 5 || FahrzeugInfo[vehicleid][fNebenjob] == 6)
				{
				    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],180);
				}
	   			else if(FahrzeugInfo[vehicleid][fNebenjob] == 2 || FahrzeugInfo[vehicleid][fNebenjob] == 7 || FahrzeugInfo[vehicleid][fNebenjob] == 10
				   || FahrzeugInfo[vehicleid][fNebenjob] == 11)//Pizzabote | Landwirt | Geldlieferant | Elektriker
			    {
					newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],1800);
				}
				format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Nebenjob");
				SetVehicleNumberPlate(newvehicleid,"Nebenjob");
			}
			else if(FahrzeugInfo[vehicleid][fAutohaus] != 0)
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],180);
	    		format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Autohaus");
				SetVehicleNumberPlate(newvehicleid,"Autohaus");
			}
			else if(FahrzeugInfo[vehicleid][fFraktion] > 0)
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],-1);
			    CreateFrakNummernSchild(newvehicleid,FahrzeugInfo[vehicleid][fFraktion]);
			}
			else if(FahrzeugInfo[vehicleid][fGruppe] > 0)
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],-1);
	    		format(FahrzeugInfo[newvehicleid][fKennzeichen], 5, FahrzeugInfo[vehicleid][fKennzeichen]);
				SetVehicleNumberPlate(newvehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);
			}
			else if(FahrzeugInfo[vehicleid][fFahrschule] > 0)
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],180);
	    		format(FahrzeugInfo[newvehicleid][fKennzeichen], 0, "Fahrschule");
				SetVehicleNumberPlate(newvehicleid,"Fahrschule");
			}

			FahrzeugInfo[newvehicleid][fDatabaseID] = FahrzeugInfo[vehicleid][fDatabaseID];
			FahrzeugInfo[newvehicleid][fErstellt] = FahrzeugInfo[vehicleid][fErstellt];
			FahrzeugInfo[newvehicleid][fModelID] = FahrzeugInfo[vehicleid][fModelID];
			FahrzeugInfo[newvehicleid][fPosition][0] = Position[0];
			FahrzeugInfo[newvehicleid][fPosition][1] = Position[1];
			FahrzeugInfo[newvehicleid][fPosition][2] = Position[2];
			FahrzeugInfo[newvehicleid][fPosition][3] = Position[3];
			FahrzeugInfo[newvehicleid][fColor][0] = Betrag;
			FahrzeugInfo[newvehicleid][fColor][1] = FahrzeugInfo[vehicleid][fColor][1];
			FahrzeugInfo[newvehicleid][fPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];
			FahrzeugInfo[newvehicleid][fAbgeschleppt] = FahrzeugInfo[vehicleid][fAbgeschleppt];
			FahrzeugInfo[newvehicleid][fParkkralle] = FahrzeugInfo[vehicleid][fParkkralle];
			FahrzeugInfo[newvehicleid][fKilometer] = FahrzeugInfo[vehicleid][fKilometer];
			FahrzeugInfo[newvehicleid][fTank] = FahrzeugInfo[vehicleid][fTank];
			FahrzeugInfo[newvehicleid][fRang] = FahrzeugInfo[vehicleid][fRang];
			for(new i=0;i<14;i++){
			FahrzeugInfo[newvehicleid][fTuning][i] = FahrzeugInfo[vehicleid][fTuning][i];}
			FahrzeugInfo[newvehicleid][fFraktion] = FahrzeugInfo[vehicleid][fFraktion];
			FahrzeugInfo[newvehicleid][fGruppe] = FahrzeugInfo[vehicleid][fGruppe];
			FahrzeugInfo[newvehicleid][fAutohaus] = FahrzeugInfo[vehicleid][fAutohaus];
			FahrzeugInfo[newvehicleid][fNebenjob] = FahrzeugInfo[vehicleid][fNebenjob];
			FahrzeugInfo[newvehicleid][fGarage] = FahrzeugInfo[vehicleid][fGarage];
			FahrzeugInfo[newvehicleid][fGPark] = FahrzeugInfo[vehicleid][fGPark];
			FahrzeugInfo[newvehicleid][fFahrschule] = FahrzeugInfo[vehicleid][fFahrschule];
			FahrzeugInfo[newvehicleid][fSupmobil] = FahrzeugInfo[vehicleid][fSupmobil];
			FahrzeugInfo[newvehicleid][fZiviroller] = FahrzeugInfo[vehicleid][fZiviroller];
			FahrzeugInfo[newvehicleid][fImportCar] = FahrzeugInfo[vehicleid][fImportCar];
			FahrzeugInfo[newvehicleid][fKurrierCar] = FahrzeugInfo[vehicleid][fKurrierCar];
			FahrzeugInfo[newvehicleid][fPreis] = FahrzeugInfo[vehicleid][fPreis];
			FahrzeugInfo[newvehicleid][fLabel] = FahrzeugInfo[vehicleid][fLabel];
			FahrzeugInfo[newvehicleid][fBesitzer] = FahrzeugInfo[vehicleid][fBesitzer];
			FahrzeugInfo[newvehicleid][fBesitzerID] = FahrzeugInfo[vehicleid][fBesitzerID];
			FahrzeugInfo[newvehicleid][fPizzaObjekt] = FahrzeugInfo[vehicleid][fPizzaObjekt];
			FahrzeugInfo[newvehicleid][fkGeld] = FahrzeugInfo[vehicleid][fkGeld];
			FahrzeugInfo[newvehicleid][fkDrogen] = FahrzeugInfo[vehicleid][fkDrogen];
			FahrzeugInfo[newvehicleid][fJobEXP] = FahrzeugInfo[vehicleid][fJobEXP];
			DeleteVehicle(vehicleid);
			AddTuning(newvehicleid);
			AddOther(newvehicleid);
			PutPlayerInVehicle(playerid,newvehicleid,0);
	        return 1;
		}
		else if(strcmp(Auswahl, "Farbe2", true, strlen(Auswahl)) == 0)
    	{
  			format(string,sizeof(string),"FahrzeugID: %d - Alte Farbe2: %d - Neue Farbe2: %d",vehicleid,FahrzeugInfo[vehicleid][fColor][1],Betrag);
			SendClientMessage(playerid,COLOR_INFO,string);
	 		new Float:Position[4], newvehicleid;
		 	GetVehiclePos(vehicleid,Position[0],Position[1],Position[2]);
			GetVehicleZAngle(vehicleid,Position[3]);
			if(FahrzeugInfo[vehicleid][fNebenjob] != 0)
			{
				if(FahrzeugInfo[vehicleid][fNebenjob] == 1 || FahrzeugInfo[vehicleid][fNebenjob] == 3 || FahrzeugInfo[vehicleid][fNebenjob] == 4 ||
				FahrzeugInfo[vehicleid][fNebenjob] == 5 || FahrzeugInfo[vehicleid][fNebenjob] == 6)
				{
				    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],180);
				}
	   			else if(FahrzeugInfo[vehicleid][fNebenjob] == 2 || FahrzeugInfo[vehicleid][fNebenjob] == 7 || FahrzeugInfo[vehicleid][fNebenjob] == 10
				   || FahrzeugInfo[vehicleid][fNebenjob] == 11)//Pizzabote | Landwirt | Geldlieferant | Elektriker
			    {
					newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],1800);
				}
			}
			else if(FahrzeugInfo[vehicleid][fAutohaus] != 0)
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],180);
			}
			else
			{
			    newvehicleid = CreateVehicle(FahrzeugInfo[vehicleid][fModelID],Position[0],Position[1],Position[2],Position[3],Betrag,FahrzeugInfo[vehicleid][fColor][1],-1);
			}
            SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);
			FahrzeugInfo[newvehicleid][fDatabaseID] = FahrzeugInfo[vehicleid][fDatabaseID];
			FahrzeugInfo[newvehicleid][fErstellt] = FahrzeugInfo[vehicleid][fErstellt];
			FahrzeugInfo[newvehicleid][fModelID] = FahrzeugInfo[vehicleid][fModelID];
			FahrzeugInfo[newvehicleid][fPosition][0] = Position[0];
			FahrzeugInfo[newvehicleid][fPosition][1] = Position[1];
			FahrzeugInfo[newvehicleid][fPosition][2] = Position[2];
			FahrzeugInfo[newvehicleid][fPosition][3] = Position[3];
			FahrzeugInfo[newvehicleid][fColor][0] = FahrzeugInfo[vehicleid][fColor][0];
			FahrzeugInfo[newvehicleid][fColor][1] = Betrag;
			FahrzeugInfo[newvehicleid][fPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];
			FahrzeugInfo[newvehicleid][fKennzeichen] = FahrzeugInfo[vehicleid][fKennzeichen];
			FahrzeugInfo[newvehicleid][fAbgeschleppt] = FahrzeugInfo[vehicleid][fAbgeschleppt];
			FahrzeugInfo[newvehicleid][fParkkralle] = FahrzeugInfo[vehicleid][fParkkralle];
			FahrzeugInfo[newvehicleid][fKilometer] = FahrzeugInfo[vehicleid][fKilometer];
			FahrzeugInfo[newvehicleid][fTank] = FahrzeugInfo[vehicleid][fTank];
			FahrzeugInfo[newvehicleid][fRang] = FahrzeugInfo[vehicleid][fRang];
			for(new i=0;i<14;i++){FahrzeugInfo[newvehicleid][fTuning][i] = FahrzeugInfo[vehicleid][fTuning][i];}
			FahrzeugInfo[newvehicleid][fFraktion] = FahrzeugInfo[vehicleid][fFraktion];
			FahrzeugInfo[newvehicleid][fGruppe] = FahrzeugInfo[vehicleid][fGruppe];
			FahrzeugInfo[newvehicleid][fAutohaus] = FahrzeugInfo[vehicleid][fAutohaus];
			FahrzeugInfo[newvehicleid][fNebenjob] = FahrzeugInfo[vehicleid][fNebenjob];
			FahrzeugInfo[newvehicleid][fGarage] = FahrzeugInfo[vehicleid][fGarage];
			FahrzeugInfo[newvehicleid][fGPark] = FahrzeugInfo[vehicleid][fGPark];
			FahrzeugInfo[newvehicleid][fFahrschule] = FahrzeugInfo[vehicleid][fFahrschule];
			FahrzeugInfo[newvehicleid][fSupmobil] = FahrzeugInfo[vehicleid][fSupmobil];
			FahrzeugInfo[newvehicleid][fZiviroller] = FahrzeugInfo[vehicleid][fZiviroller];
			FahrzeugInfo[newvehicleid][fImportCar] = FahrzeugInfo[vehicleid][fImportCar];
			FahrzeugInfo[newvehicleid][fKurrierCar] = FahrzeugInfo[vehicleid][fKurrierCar];
			FahrzeugInfo[newvehicleid][fPreis] = FahrzeugInfo[vehicleid][fPreis];
			FahrzeugInfo[newvehicleid][fLabel] = FahrzeugInfo[vehicleid][fLabel];
			FahrzeugInfo[newvehicleid][fBesitzer] = FahrzeugInfo[vehicleid][fBesitzer];
			FahrzeugInfo[newvehicleid][fBesitzerID] = FahrzeugInfo[vehicleid][fBesitzerID];
			FahrzeugInfo[newvehicleid][fPizzaObjekt] = FahrzeugInfo[vehicleid][fPizzaObjekt];
			FahrzeugInfo[newvehicleid][fkGeld] = FahrzeugInfo[vehicleid][fkGeld];
			FahrzeugInfo[newvehicleid][fkDrogen] = FahrzeugInfo[vehicleid][fkDrogen];
			FahrzeugInfo[newvehicleid][fJobEXP] = FahrzeugInfo[vehicleid][fJobEXP];
			DeleteVehicle(vehicleid);
			AddTuning(newvehicleid);
			AddOther(newvehicleid);
			PutPlayerInVehicle(playerid,newvehicleid,0);
	        return 1;
		}
    }
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Entweder exestiert das Fahrzeug nicht, oder das angegebene Fahrzeug steht nicht in der vehicles Tabelle.");
    return 1;
}

CMD:createcar(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	ShowPlayerDialog(playerid,DIALOG_CREATECAR,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fahrzeugerstellung","Fraktionsfahrzeug\nAutohausfahrzeug\nNebenjobfahrzeug\nFahrschulfahrzeug","Weiter","Abbrechen");
    new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/createcar' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:ahlock(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new Float:x,Float:y,Float:z, merker = true, tmpcar = GetPlayerVehicleID(playerid);
 	for(new fv;fv<MAX_VEHICLES;fv++)
	{
		if(FahrzeugInfo[fv][fAutohaus] == 0)continue;
 		GetVehiclePos(fv,x,y,z);
		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
		{
  			merker = false;
	    	if(DOOR[fv] == true)
		    {
      			GetVehicleParamsEx(fv,engine,lights,alarm,doors,bonnet,boot,objective);
		    	if(Licht[fv] == false)
			    {
			    	SetVehicleParamsEx(fv,engine,false,alarm,doors,bonnet,boot,objective);
					SetTimerEx("LockLicht",1000,false,"i",tmpcar);
				}
				DOOR[fv] = false;
				SetVehicleParamsEx(fv,engine,lights,alarm,false,bonnet,boot,objective);
    			if(IsAHelikopter(fv)){GameTextForPlayer(playerid,"~w~Helikopter~n~~g~aufgeschlossen",2000,6);}
			    else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~g~aufgeschlossen",2000,6);
    		}
		    else
		    {
      			GetVehicleParamsEx(fv,engine,lights,alarm,doors,bonnet,boot,objective);
		    	if(Licht[fv] == false)
			    {
			    	SetVehicleParamsEx(fv,engine,true,alarm,doors,bonnet,boot,objective);
					SetTimerEx("LockLicht",1000,false,"i",tmpcar);
				}
				DOOR[fv] = true;
				SetVehicleParamsEx(fv,engine,lights,alarm,true,bonnet,boot,objective);
    			if(IsAHelikopter(fv)){GameTextForPlayer(playerid,"~w~Helikopter~n~~r~abgeschlossen",2000,6);}
			    else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~r~abgeschlossen",2000,6);
    		}
		}
	}
	if(merker)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht in der Nähe eines Autohausfahrzeugs.");
 	}
	return 1;
}

CMD:dbload(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new loading[24];
	if(sscanf(params,"s[24]",loading))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/dbload [carinfos|frakinfos|gangzones|drogenpflanzen|werbetafeln|jobinfos]");
	new string[128];
	if(strcmp(loading, "carinfos", true, strlen(loading)) == 0)
	{
	    LoadCarInfos();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "frakinfos", true, strlen(loading)) == 0)
	{
	    LoadFrakInfo();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "gangzones", true, strlen(loading)) == 0)
	{
	    for(new x = 0; x < MAX_GANGZONES; x++)
	    {
	        if(GangZoneInfo[x][gzFightTime] > 0)return SendClientMessage(playerid,COLOR_RED,"[DB-Load]: Ein aktives Gangfight blockiert den Ladevorgang.");
	        KillTimer(GangZoneInfo[x][gzFightTime]); KillTimer(GangZoneInfo[x][gzTimerLast]); KillTimer(GangZoneInfo[x][gzTimerWert]);
	        DestroyDynamic3DTextLabel(GangZoneInfo[x][gzLabel]); DestroyObject(GangZoneInfo[x][gzBox]); GangZoneInfo[x][gzErstellt] = false;
	        GangZoneDestroy(x); GangZoneInfo[x][gzID] = -1;
	    }
	    SendClientMessage(playerid,COLOR_YELLOW,"[DB-Load]: {FFFFFF}Alle aktuellen InGame-GangZonen werden gelöscht.");
	    LoadGangZones();
	    foreach(new i : Player){UpdateGangZones(i);}
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "drogenpflanzen", true, strlen(loading)) == 0)
	{
	    for(new x = 0; x < MAX_DROGEN; x++)
	    {
	        DestroyDynamicObject(DrogenInfo[x][dObject]); DestroyDynamic3DTextLabel(DrogenInfo[x][dText]);
	        DrogenInfo[x][dErstellt] = false;
	    }
	    SendClientMessage(playerid,COLOR_YELLOW,"[DB-Load]: {FFFFFF}Alle aktuellen InGame-Drogenpflanzen werden gelöscht.");
	    LoadDrogen();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "werbetafeln", true, strlen(loading)) == 0)
	{
	    for(new x = 0; x < MAX_WERBETAFELN; x++)
	    {
	        DestroyDynamicObject(Werbetafelobject[x]);
	    }
	    SendClientMessage(playerid,COLOR_YELLOW,"[DB-Load]: {FFFFFF}Alle aktuellen InGame-Werbetafeln werden gelöscht.");
	    LoadWerbetafeln();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	else if(strcmp(loading, "jobinfos", true, strlen(loading)) == 0)
	{
	    LoadJobInfos();
	    format(string,sizeof(string),"[DB-Load]: {FFFFFF}Die Tabelle '%s' wurde geladen.",loading);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SendClientMessage(playerid,COLOR_SUPER,"[DB-Load]: {FFFFFF}Der Ladevorgang kann einige Sekunden in Anspruch nehmen.");
	}
	new log_admstring[128];
	format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/dbload' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
	CreateServerLogEntry("ADMIN_LOG", log_admstring);
	return 1;
}

CMD:givebank(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new pID, Betrag, string[128];
	if(sscanf(params,"ui",pID,Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givebank [SpielerID] [Betrag]");
	{
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    SpielerInfo[pID][sBankkonto] += Betrag;
  	 	format(string,128,"[Info]: {FFFFFF}Du hast %s zusätzlich $%d auf sein Bankkonto gelegt.",SpielerInfo[pID][sName],Betrag);
		SendClientMessage(playerid,COLOR_SUPER,string);
		format(string,128,"[Info]: {FFFFFF}%s %s hat dir zusätzlich $%d auf dein Bankkonto gelegt.",AdminName(playerid),SpielerInfo[playerid][sName],Betrag);
		SendClientMessage(pID,COLOR_SUPER,string);
		new log_admstring[128];
		format(log_admstring,sizeof(log_admstring),"%s %s hat den Befehl '/givebank' benutzt. [%d]",AdminName(playerid),SpielerInfo[playerid][sName],GetPVarInt(playerid,"AdminDuty"));
		CreateServerLogEntry("ADMIN_LOG", log_admstring);
		return 1;
	}
}

CMD:oban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new Name[24], Grund[64], query[200];
	if(sscanf(params,"s[24]s[64]",Name,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/oban [SpielerName] [Grund]");
	mysql_format(sqlHandle, query, sizeof(query), "SELECT `Name` FROM `accounts` WHERE `Name` = '%s'", Name);
	mysql_tquery(sqlHandle, query, "onAccountExistsForOffBan", "iss", playerid, Name, Grund);
	return 1;
}

CMD:unban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new Name[24], Grund[64];
	if(sscanf(params,"s[24]s[64]",Name,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/unban [Name] [Grund]");
	new query[144];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT `Name` FROM `accbans` WHERE `Name` = '%s' LIMIT 1;", Name);
   	mysql_tquery(sqlHandle, query, "onUnbanPlayer", "is", playerid, Grund);
	return 1;
}

CMD:otban(playerid,params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new Name[24], Minuten, Grund[64], string[144], query[250];
	if(sscanf(params,"s[24]is[64]",Name,Minuten,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/otban [SpielerName] [Minuten(5-1440)] [Grund]");
	{
	    foreach(new i : Player)
	    {
	        if(strcmp(Name, SpielerInfo[i][sName], true, strlen(Name)) == 0)return SendClientMessage(playerid,COLOR_INFO,"Der angegebene Spieler ist online. Benutze /ban [SpielerID] [Grund]");
		    mysql_format(sqlHandle, query, 128, "SELECT `Name` FROM `accounts` WHERE `Name` = '%s'", Name);
		   	new Cache:result = mysql_query(sqlHandle, query);
	   		
	 		if(cache_num_rows() > 0)
			{
			    if(Minuten < 5 || Minuten > 1440)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze: {FFFFFF}/otban [SpielerName] [Minuten(5-1440)] [Grund]");
			    format(string,128,"%s %s hat den %s für %d Minuten Offline gebannt. Grund: %s",AdminName(playerid),SpielerInfo[playerid][sName],Name,Minuten,Grund);
			    CreateServerLogEntry("TBAN_LOG", string);
			    SendClientMessageToAll(COLOR_RED,string);
	      		new timestamp, Uhrzeit[16], Datum[16];
				timestamp = gettime();
				timestamp += Minuten * 60;
				gettime(Hour, Minute, Second);
				getdate(Year, Month, Day);
				format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
				format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
				mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `timebans` (`Name`, `Teammitglied`, `Bangrund`, `Uhrzeit`, `Datum`, `serv_Data`) VALUES ('%s', '%s', '%s', '%s', '%s', '%i')", Name, SpielerInfo[playerid][sName] , Grund , Uhrzeit, Datum, timestamp);
			    mysql_tquery(sqlHandle, query);
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
	return 1;
}
alias:otban("otimeban")

CMD:aduty(playerid, params[])
{
	new string[128];
	if(SpielerInfo[playerid][sAdmin] == 0)return NichtBerechtigt
	if(GetPVarInt(playerid,"AdminDuty") == 1)
	{
		if(GetPVarInt(playerid,"Supmobil") != 0)
 		{
			DestroyVehicleEx(GetPVarInt(playerid,"Supmobil"));
			DeletePVar(playerid,"Supmobil");
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Supmobil wurde gelöscht.");
		}
  		format(string,128,"%s %s hat sich vom Support abgemeldet.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_RED,string);
		DeletePVar(playerid,"AdminDuty");
		TextDrawHideForPlayer(playerid, AlsAdminImDienst);
		DestroyDynamic3DTextLabel(AdmDutyLabel[playerid]);
		SetPlayerColor(playerid,COLOR_WHITE);
		SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
	}
	else
	{
		format(string,128,"%s %s hat sich zum Support angemeldet.",AdminName(playerid),SpielerInfo[playerid][sName]);
		SendClientMessageToAll(COLOR_RED,string);
		SetPVarInt(playerid,"AdminDuty",1);
		TextDrawShowForPlayer(playerid, AlsAdminImDienst);
		AdmDutyLabel[playerid] = CreateDynamic3DTextLabel("Im Admin-Dienst", 0xCD2626FF, 0.0, 0.0, 0.7, 80.0, playerid);
		SetPlayerColor(playerid, COLOR_RED);
	}
	return 1;
}

CMD:gotoliste(playerid)
{
    if(SpielerInfo[playerid][sAdmin] < 1) return SendClientMessage(playerid, COLOR_WHITE, ERROR_ADMIN);
    ShowPlayerDialog(playerid, DIALOG_GOTOLISTE, DIALOG_STYLE_LIST, "Goto-Liste", "Stadthalle\nBSN\nAmmunation\nLS Strand\nFahrschule\nAutohaus günstig\nAutohaus Luxus\nKrankenhaus\nBank\nLSPD\nMotorradverkauf\nFlugzeugverkauf\nNeulingsspawn\nOrangenfeld LV\nStandesamt\n", "Teleportieren", "Abbrechen");
    return 1;
}
CMD:gotocp(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] == 0)return NichtBerechtigt
	if(GetPVarInt(playerid,"AdminDuty") != 1)return AdminDienst
	if(SpielerInfo[playerid][sLastCPX] != 0.00)
  	{
    	SetPlayerPos(playerid,SpielerInfo[playerid][sLastCPX],SpielerInfo[playerid][sLastCPY],SpielerInfo[playerid][sLastCPZ]);
    	SendClientMessage(playerid,COLOR_GREY,"[Info]: Zum Checkpoint geportet.");
      	if(IsPlayerInAnyVehicle(playerid))
   		{
   			new vehid = GetPlayerVehicleID(playerid);
 		    SetVehiclePos(vehid,SpielerInfo[playerid][sLastCPX],SpielerInfo[playerid][sLastCPY],SpielerInfo[playerid][sLastCPZ]+5);
 		    LinkVehicleToInterior(vehid,0);
 		    SetVehicleVirtualWorld(vehid,0);
 		    PutPlayerInVehicle(playerid, vehid, 0);
   		}
		SpielerInfo[playerid][sLastCPX] = 0.00;
   		return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Fehler]: {FFFFFF}Bisher wurde dir noch kein Checkpoint gesetzt.");
	return 1;
}
CMD:gotohaus(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] == 0)return NichtBerechtigt
	if(GetPVarInt(playerid,"AdminDuty") != 1)return AdminDienst
	new hs;
	if(sscanf(params,"d",hs))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gotohaus [HausID]");
	
	if(hs < 1 || hs > MAX_HAUSER) return SendClientMessage(playerid,COLOR_RED,"[Fehler]: {FFFFFF}Die angegebene HausID existiert nicht.");
	if(!HausInfo[hs][hsErstellt]) return SendClientMessage(playerid,COLOR_RED,"[Fehler]: {FFFFFF}Die angegebene HausID existiert nicht.");
	if(HausInfo[hs][hsPos_X] > 0.1)
  	{
    	SetPlayerPos(playerid,HausInfo[hs][hsPos_X],HausInfo[hs][hsPos_Y],HausInfo[hs][hsPos_Z]);
    	SendClientMessage(playerid,COLOR_GREY,"[Info]: Du hast dich zum Haus geportet.");
      	if(IsPlayerInAnyVehicle(playerid))
   		{
   			new vehid = GetPlayerVehicleID(playerid);
 		    SetVehiclePos(vehid,HausInfo[hs][hsPos_X],HausInfo[hs][hsPos_Y],HausInfo[hs][hsPos_Z]+5);
 		    LinkVehicleToInterior(vehid,0);
 		    SetVehicleVirtualWorld(vehid,0);
 		    PutPlayerInVehicle(playerid, vehid, 0);
   		}
	}
	return 1;
}
CMD:supmobil(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] == 0)return NichtBerechtigt
	if(GetPVarInt(playerid,"AdminDuty") != 1)return AdminDienst
 	if(GetPVarInt(playerid,"Supmobil") != 0)
  	{
		DeleteVehicle(GetPVarInt(playerid,"Supmobil"));
		DeletePVar(playerid,"Supmobil");
		SendClientMessage(playerid,COLOR_RED,"Supmobil wurde gelöscht.");
		return 1;
  	}
   	else
   	{
	   new vehicleid, Float:Position[4];
	   GetPlayerPos(playerid,Position[0],Position[1],Position[2]);
	   GetPlayerFacingAngle(playerid,Position[3]);
	   vehicleid = CreateVehicle(560,Position[0],Position[1],Position[2],Position[3],248,248,-1);
	   FahrzeugInfo[vehicleid][fModelID] = 560;
	   LinkVehicleToInterior(vehicleid,GetPlayerInterior(playerid));
	   SetVehicleVirtualWorld(vehicleid,GetPlayerVirtualWorld(playerid));
	   FahrzeugInfo[vehicleid][fTank] = VehicleData[FahrzeugInfo[vehicleid][fModelID]-400][vehLiter];
	   GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	   SetVehicleParamsEx(vehicleid, false, false, false, false, false, false, false);
	   PutPlayerInVehicle(playerid,vehicleid,0);
	   FahrzeugInfo[vehicleid][fDatabaseID] = 0; FahrzeugInfo[vehicleid][fErstellt] = true;
	   FahrzeugInfo[vehicleid][fPosition][0] = Position[0]; FahrzeugInfo[vehicleid][fPosition][1] = Position[1]; FahrzeugInfo[vehicleid][fPosition][2] = Position[2]; FahrzeugInfo[vehicleid][fPosition][3] = Position[3]; FahrzeugInfo[vehicleid][fColor][1] = 6;
	   format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "Support"); FahrzeugInfo[vehicleid][fAbgeschleppt] = 0; FahrzeugInfo[vehicleid][fParkkralle] = 0; FahrzeugInfo[vehicleid][fKilometer] = 0; FahrzeugInfo[vehicleid][fColor][0] = 6; FahrzeugInfo[vehicleid][fPaintjob] = 3;
	   FahrzeugInfo[vehicleid][fTank] = VehicleData[GetVehicleModel(vehicleid)-400][vehLiter]; FahrzeugInfo[vehicleid][fRang] = 0; FahrzeugInfo[vehicleid][fFraktion] = 0; FahrzeugInfo[vehicleid][fGruppe] = 0; FahrzeugInfo[vehicleid][fAutohaus] = 0; FahrzeugInfo[vehicleid][fNebenjob] = 0;
	   FahrzeugInfo[vehicleid][fGarage] = 0; FahrzeugInfo[vehicleid][fGPark] = 0; FahrzeugInfo[vehicleid][fFahrschule] = 0; FahrzeugInfo[vehicleid][fSupmobil] = 1; FahrzeugInfo[vehicleid][fZiviroller] = 0; FahrzeugInfo[vehicleid][fImportCar] = 0; FahrzeugInfo[vehicleid][fKurrierCar] = 0; FahrzeugInfo[vehicleid][fPreis] = 0;
	   FahrzeugInfo[vehicleid][fBesitzer] = 0; format(FahrzeugInfo[vehicleid][fBesitzer], 0, ""); FahrzeugInfo[vehicleid][fBesitzerID] = 0; FahrzeugInfo[vehicleid][fJobEXP] = 0;

	   FahrzeugInfo[vehicleid][fTuning][0] = 1138;
	   FahrzeugInfo[vehicleid][fTuning][1] = 0;
	   FahrzeugInfo[vehicleid][fTuning][2] = 1032;
	   FahrzeugInfo[vehicleid][fTuning][3] = 1026;
	   FahrzeugInfo[vehicleid][fTuning][4] = 0;
	   FahrzeugInfo[vehicleid][fTuning][5] = 1010;
	   FahrzeugInfo[vehicleid][fTuning][6] = 1028;
	   FahrzeugInfo[vehicleid][fTuning][7] = 0;
	   FahrzeugInfo[vehicleid][fTuning][8] = 0;
	   FahrzeugInfo[vehicleid][fTuning][9] = 0;
	   FahrzeugInfo[vehicleid][fTuning][10] = 1169;
	   FahrzeugInfo[vehicleid][fTuning][11] = 1141;
	   FahrzeugInfo[vehicleid][fTuning][12] = 0;
	   FahrzeugInfo[vehicleid][fTuning][13] = 0;

	   SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);

	   AddVehicleComponent(vehicleid, 1010);
	   AddVehicleComponent(vehicleid, 1026);
	   AddVehicleComponent(vehicleid, 1027);
	   AddVehicleComponent(vehicleid, 1028);
	   AddVehicleComponent(vehicleid, 1032);
	   AddVehicleComponent(vehicleid, 1138);
	   AddVehicleComponent(vehicleid, 1141);
	   AddVehicleComponent(vehicleid, 1169);

	   SetPVarInt(playerid,"Supmobil",vehicleid);
	   Motor[vehicleid] = false;
	   Licht[vehicleid] = false;
	   DOOR[vehicleid] = false;
	   Motorhaube[vehicleid] = false;
	   Kofferraum[vehicleid] = false;

	   FahrzeugInfo[vehicleid][fSupMobilObj][0] = CreateDynamicObject(19483,Position[0],Position[1],Position[2],0,0,Position[3],-1,-1,-1,100,100);
	   AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fSupMobilObj][0], vehicleid, 1.06, -0.10, 0.03, 0.0, 0.0, 0.0);
	   SetDynamicObjectMaterialText(FahrzeugInfo[vehicleid][fSupMobilObj][0],0,"{FFFFFF}"SERV_STAG" {FFFFFF}Support",OBJECT_MATERIAL_SIZE_256x128,\
	   "Arial", 28, 0, 0xFFFF8200, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
	   FahrzeugInfo[vehicleid][fSupMobilObj][1] = CreateDynamicObject(19483,Position[0],Position[1],Position[2],0,0,Position[3],-1,-1,-1,100,100);
	   AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fSupMobilObj][1], vehicleid, -1.06, -0.10, 0.03, 180.0, -180.0, 0.0);
	   SetDynamicObjectMaterialText(FahrzeugInfo[vehicleid][fSupMobilObj][1],0,"{FFFFFF}"SERV_STAG" {FFFFFF}Support",OBJECT_MATERIAL_SIZE_256x128,\
	   "Arial", 28, 0, 0xFFFF8200, 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);

	   SendClientMessage(playerid,COLOR_SUPER,"Supmobil wurde erstellt.");
	   return 1;
	}
}