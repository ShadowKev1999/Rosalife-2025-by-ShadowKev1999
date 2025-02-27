stock Kilometer(playerid)
{
	new PLAYER_STATE:State = GetPlayerState(playerid);
	if(State == PLAYER_STATE_DRIVER){OldKilometer[GetPlayerVehicleID(playerid)] += (NewKilometer[GetPlayerVehicleID(playerid)]*5)/36;}
    if(OldKilometer[GetPlayerVehicleID(playerid)]  > 499)
    {
        new string[46];
        OldKilometer[GetPlayerVehicleID(playerid)] = 0;
        FahrzeugInfo[GetPlayerVehicleID(playerid)][fKilometer]++;

		new Float:tankverlust = VehicleData[GetVehicleModel(GetPlayerVehicleID(playerid))-400][vehVerbrauch]/100;
	    FahrzeugInfo[GetPlayerVehicleID(playerid)][fTank] -= floatabs(tankverlust)*27;
		foreach(new i : Player)
        {
            if(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
            {
                PlayerTextDrawHide(i, Tacho[i][9]);
		        format(string,sizeof(string),"%i Kilometer",FahrzeugInfo[GetPlayerVehicleID(playerid)][fKilometer]);
			    PlayerTextDrawSetString(i, Tacho[i][9], string);
			    PlayerTextDrawShow(i, Tacho[i][9]);
			    PlayerTextDrawHide(i, Tacho[i][3]);
		        format(string,sizeof(string),"%s %.2f/%dL",TankArtName(GetPlayerVehicleID(playerid)),FahrzeugInfo[GetPlayerVehicleID(playerid)][fTank],VehicleData[GetVehicleModel(GetPlayerVehicleID(playerid))-400][vehLiter]);
			    PlayerTextDrawSetString(i, Tacho[i][3], string);
			    PlayerTextDrawShow(i, Tacho[i][3]);
			}
		}
    }
    return 1;
}

stock SaveVehicleById(i)
{
	new query[364], stringzusammen[1024], panels, tires;

	if(!IsValidVehicle(i) || FahrzeugInfo[i][fDatabaseID] == 0) return 1;
	if(FahrzeugInfo[i][fFahrschule] == 1 || FahrzeugInfo[i][fSupmobil] == 1 || FahrzeugInfo[i][fZiviroller] == 1 || FahrzeugInfo[i][fImportCar] == 1 || FahrzeugInfo[i][fKurrierCar] != 0 || FahrzeugInfo[i][fBankrob] != 0) return 1;
	GetVehicleDamageStatus(i,VEHICLE_PANEL_STATUS:panels,VEHICLE_DOOR_STATUS:doors,VEHICLE_LIGHT_STATUS:lights,VEHICLE_TYRE_STATUS:tires);

	mysql_format(sqlHandle, query,sizeof query,"UPDATE `vehicles` SET `ModelID`='%d', `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f', `Farbe1`='%d', `Farbe2`='%d', `Paintjob`='%d', `Fraktion`='%d', `Gruppe`='%d', `Autohaus`='%d', `Nebenjob`='%d', `Garage`='%d', `GPark`='%d', `Fahrschule`='%d', `Besitzer`='%s',",
	FahrzeugInfo[i][fModelID],FahrzeugInfo[i][fPosition][0],FahrzeugInfo[i][fPosition][1],FahrzeugInfo[i][fPosition][2],FahrzeugInfo[i][fPosition][3],FahrzeugInfo[i][fColor][0],FahrzeugInfo[i][fColor][1],FahrzeugInfo[i][fPaintjob],FahrzeugInfo[i][fFraktion],FahrzeugInfo[i][fGruppe],FahrzeugInfo[i][fAutohaus],
	FahrzeugInfo[i][fNebenjob],FahrzeugInfo[i][fGarage],FahrzeugInfo[i][fGPark],FahrzeugInfo[i][fFahrschule],FahrzeugInfo[i][fBesitzer]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Kennzeichen`='%s', `Abgeschleppt`='%d', `Parkkralle`='%d', `Kilometer`='%d', `Tank`='%f', `Rang`='%d', `Preis`='%d',",
	FahrzeugInfo[i][fKennzeichen],FahrzeugInfo[i][fAbgeschleppt],FahrzeugInfo[i][fParkkralle],FahrzeugInfo[i][fKilometer],FahrzeugInfo[i][fTank],FahrzeugInfo[i][fRang],FahrzeugInfo[i][fPreis]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Spoiler`='%d', `Hood`='%d', `Roof`='%d', `Sideskirt`='%d', `Lamps`='%f', `Nitro`='%d', `Exhaust`='%d', `Wheels`='%d', `Stereo`='%d', `Hydraulics`='%d', `TuningGemeldet`='%d',",
	FahrzeugInfo[i][fTuning][0],FahrzeugInfo[i][fTuning][1],FahrzeugInfo[i][fTuning][2],FahrzeugInfo[i][fTuning][3],FahrzeugInfo[i][fTuning][4],FahrzeugInfo[i][fTuning][5],FahrzeugInfo[i][fTuning][6],FahrzeugInfo[i][fTuning][7],
	FahrzeugInfo[i][fTuning][8],FahrzeugInfo[i][fTuning][9],FahrzeugInfo[i][fTuningGemeldet]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Front Bumper`='%d', `Rear Bumper`='%d', `Vent Right`='%d', `Vent Left`='%d', `Panels`='%f', `Doors`='%d', `Lights`='%d', `Tires`='%d', `Geld`='%d', `Drogen`='%d', `JobEXP`='%d', `upgradeRespawn`='%d' WHERE `ID`='%d'",
	FahrzeugInfo[i][fTuning][10],FahrzeugInfo[i][fTuning][11],FahrzeugInfo[i][fTuning][12],FahrzeugInfo[i][fTuning][13],panels,doors,lights,tires,FahrzeugInfo[i][fkGeld],FahrzeugInfo[i][fkDrogen],FahrzeugInfo[i][fJobEXP],FahrzeugInfo[i][fkUpgradeRespawn],FahrzeugInfo[i][fDatabaseID]);
	strcat(stringzusammen,query);
	mysql_tquery(sqlHandle, stringzusammen);
	strdel(query,0,sizeof(query));
	strdel(stringzusammen,0,sizeof(stringzusammen));
	return 1;
}

stock SaveVehicles()
{
	new query[364], stringzusammen[1024], panels, tires;
	for(new i=1;i<MAX_VEHICLES;i++)
    {
		if(!IsValidVehicle(i) || FahrzeugInfo[i][fDatabaseID] == 0)continue;
		if(FahrzeugInfo[i][fFahrschule] == 1 || FahrzeugInfo[i][fSupmobil] == 1 || FahrzeugInfo[i][fZiviroller] == 1 || FahrzeugInfo[i][fImportCar] == 1 || FahrzeugInfo[i][fKurrierCar] != 0 || FahrzeugInfo[i][fBankrob] != 0)continue;
		GetVehicleDamageStatus(i,VEHICLE_PANEL_STATUS:panels,VEHICLE_DOOR_STATUS:doors,VEHICLE_LIGHT_STATUS:lights,VEHICLE_TYRE_STATUS:tires);

   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `vehicles` SET `ModelID`='%d', `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f', `Farbe1`='%d', `Farbe2`='%d', `Paintjob`='%d', `Fraktion`='%d', `Gruppe`='%d', `Autohaus`='%d', `Nebenjob`='%d', `Garage`='%d', `GPark`='%d', `Fahrschule`='%d', `Besitzer`='%s',",
	    FahrzeugInfo[i][fModelID],FahrzeugInfo[i][fPosition][0],FahrzeugInfo[i][fPosition][1],FahrzeugInfo[i][fPosition][2],FahrzeugInfo[i][fPosition][3],FahrzeugInfo[i][fColor][0],FahrzeugInfo[i][fColor][1],FahrzeugInfo[i][fPaintjob],FahrzeugInfo[i][fFraktion],FahrzeugInfo[i][fGruppe],FahrzeugInfo[i][fAutohaus],
		FahrzeugInfo[i][fNebenjob],FahrzeugInfo[i][fGarage],FahrzeugInfo[i][fGPark],FahrzeugInfo[i][fFahrschule],FahrzeugInfo[i][fBesitzer]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Kennzeichen`='%s', `Abgeschleppt`='%d', `Parkkralle`='%d', `Kilometer`='%d', `Tank`='%f', `Rang`='%d', `Preis`='%d',",
	    FahrzeugInfo[i][fKennzeichen],FahrzeugInfo[i][fAbgeschleppt],FahrzeugInfo[i][fParkkralle],FahrzeugInfo[i][fKilometer],FahrzeugInfo[i][fTank],FahrzeugInfo[i][fRang],FahrzeugInfo[i][fPreis]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Spoiler`='%d', `Hood`='%d', `Roof`='%d', `Sideskirt`='%d', `Lamps`='%f', `Nitro`='%d', `Exhaust`='%d', `Wheels`='%d', `Stereo`='%d', `Hydraulics`='%d', `TuningGemeldet`='%d',",
	    FahrzeugInfo[i][fTuning][0],FahrzeugInfo[i][fTuning][1],FahrzeugInfo[i][fTuning][2],FahrzeugInfo[i][fTuning][3],FahrzeugInfo[i][fTuning][4],FahrzeugInfo[i][fTuning][5],FahrzeugInfo[i][fTuning][6],FahrzeugInfo[i][fTuning][7],
		FahrzeugInfo[i][fTuning][8],FahrzeugInfo[i][fTuning][9],FahrzeugInfo[i][fTuningGemeldet]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Front Bumper`='%d', `Rear Bumper`='%d', `Vent Right`='%d', `Vent Left`='%d', `Panels`='%f', `Doors`='%d', `Lights`='%d', `Tires`='%d', `Geld`='%d', `Drogen`='%d', `JobEXP`='%d', `upgradeRespawn`='%d' WHERE `ID`='%d'",
	    FahrzeugInfo[i][fTuning][10],FahrzeugInfo[i][fTuning][11],FahrzeugInfo[i][fTuning][12],FahrzeugInfo[i][fTuning][13],panels,doors,lights,tires,FahrzeugInfo[i][fkGeld],FahrzeugInfo[i][fkDrogen],FahrzeugInfo[i][fJobEXP],FahrzeugInfo[i][fkUpgradeRespawn],FahrzeugInfo[i][fDatabaseID]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);
		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));
	}
	return 1;
}

stock SavePrivatCarVehicle(vehicleid)
{
	new query[364], stringzusammen[1024], panels, tires;
	GetVehicleDamageStatus(vehicleid,VEHICLE_PANEL_STATUS:panels,VEHICLE_DOOR_STATUS:doors,VEHICLE_LIGHT_STATUS:lights,VEHICLE_TYRE_STATUS:tires);

	mysql_format(sqlHandle, query,sizeof query,"UPDATE `vehicles` SET `ModelID`='%d', `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f', `Farbe1`='%d', `Farbe2`='%d', `Paintjob`='%d', `Fraktion`='%d', `Gruppe`='%d', `Autohaus`='%d', `Nebenjob`='%d', `Garage`='%d', `GPark`='%d', `Fahrschule`='%d', `Besitzer`='%s',",
    FahrzeugInfo[vehicleid][fModelID],FahrzeugInfo[vehicleid][fPosition][0],FahrzeugInfo[vehicleid][fPosition][1],FahrzeugInfo[vehicleid][fPosition][2],FahrzeugInfo[vehicleid][fPosition][3],FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1],FahrzeugInfo[vehicleid][fPaintjob],
	FahrzeugInfo[vehicleid][fFraktion],FahrzeugInfo[vehicleid][fGruppe],FahrzeugInfo[vehicleid][fAutohaus],FahrzeugInfo[vehicleid][fNebenjob],FahrzeugInfo[vehicleid][fGarage],FahrzeugInfo[vehicleid][fGPark],FahrzeugInfo[vehicleid][fFahrschule],FahrzeugInfo[vehicleid][fBesitzer]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Kennzeichen`='%s', `Abgeschleppt`='%d', `Parkkralle`='%d', `Kilometer`='%d', `Tank`='%f', `Rang`='%d',",
    FahrzeugInfo[vehicleid][fKennzeichen],FahrzeugInfo[vehicleid][fAbgeschleppt],FahrzeugInfo[vehicleid][fParkkralle],FahrzeugInfo[vehicleid][fKilometer],FahrzeugInfo[vehicleid][fTank],FahrzeugInfo[vehicleid][fRang]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Spoiler`='%d', `Hood`='%d', `Roof`='%d', `Sideskirt`='%d', `Lamps`='%f', `Nitro`='%d', `Exhaust`='%d', `Wheels`='%d', `Stereo`='%d', `Hydraulics`='%d', `TuningGemeldet`='%d',",
    FahrzeugInfo[vehicleid][fTuning][0],FahrzeugInfo[vehicleid][fTuning][1],FahrzeugInfo[vehicleid][fTuning][2],FahrzeugInfo[vehicleid][fTuning][3],FahrzeugInfo[vehicleid][fTuning][4],FahrzeugInfo[vehicleid][fTuning][5],FahrzeugInfo[vehicleid][fTuning][6],FahrzeugInfo[vehicleid][fTuning][7],
	FahrzeugInfo[vehicleid][fTuning][8],FahrzeugInfo[vehicleid][fTuning][9],FahrzeugInfo[vehicleid][fTuningGemeldet]);
	strcat(stringzusammen,query);
	strdel(query,0,sizeof(query));

	mysql_format(sqlHandle, query,sizeof query,"`Front Bumper`='%d', `Rear Bumper`='%d', `Vent Right`='%d', `Vent Left`='%d', `Panels`='%f', `Doors`='%d', `Lights`='%d', `Tires`='%d', `Geld`='%d', `Drogen`='%d', `upgradeRespawn` = '%d' WHERE `ID`='%d'",
    FahrzeugInfo[vehicleid][fTuning][10],FahrzeugInfo[vehicleid][fTuning][11],FahrzeugInfo[vehicleid][fTuning][12],FahrzeugInfo[vehicleid][fTuning][13],panels,doors,lights,tires,FahrzeugInfo[vehicleid][fkGeld],FahrzeugInfo[vehicleid][fkDrogen],FahrzeugInfo[vehicleid][fkUpgradeRespawn],FahrzeugInfo[vehicleid][fDatabaseID]);
	strcat(stringzusammen,query);
	mysql_tquery(sqlHandle, stringzusammen);
	strdel(query,0,sizeof(query));
	strdel(stringzusammen,0,sizeof(stringzusammen));
	return 1;
}

stock SavePrivatCar(playerid)
{
	new query[664], stringzusammen[1024], panels, tires;
	for(new i=1;i<MAX_VEHICLES;i++)
    {
		if(FahrzeugInfo[i][fDatabaseID] == 0 || FahrzeugInfo[i][fBesitzerID] != playerid)continue;
		GetVehicleDamageStatus(i,VEHICLE_PANEL_STATUS:panels,VEHICLE_DOOR_STATUS:doors,VEHICLE_LIGHT_STATUS:lights,VEHICLE_TYRE_STATUS:tires);

   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `vehicles` SET `ModelID`='%d', `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f', `Farbe1`='%d', `Farbe2`='%d', `Paintjob`='%d', `Fraktion`='%d', `Gruppe`='%d', `Autohaus`='%d', `Nebenjob`='%d', `Garage`='%d', `GPark`='%d', `Fahrschule`='%d', `Besitzer`='%s',",
	    FahrzeugInfo[i][fModelID],FahrzeugInfo[i][fPosition][0],FahrzeugInfo[i][fPosition][1],FahrzeugInfo[i][fPosition][2],FahrzeugInfo[i][fPosition][3],FahrzeugInfo[i][fColor][0],FahrzeugInfo[i][fColor][1],FahrzeugInfo[i][fPaintjob],FahrzeugInfo[i][fFraktion],FahrzeugInfo[i][fGruppe],
		FahrzeugInfo[i][fAutohaus],FahrzeugInfo[i][fNebenjob],FahrzeugInfo[i][fGarage],FahrzeugInfo[i][fGPark],FahrzeugInfo[i][fFahrschule],FahrzeugInfo[i][fBesitzer]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Kennzeichen`='%s', `Abgeschleppt`='%d', `Parkkralle`='%d', `Kilometer`='%d', `Tank`='%f', `Rang`='%d',",
	    FahrzeugInfo[i][fKennzeichen],FahrzeugInfo[i][fAbgeschleppt],FahrzeugInfo[i][fParkkralle],FahrzeugInfo[i][fKilometer],FahrzeugInfo[i][fTank],FahrzeugInfo[i][fRang]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Spoiler`='%d', `Hood`='%d', `Roof`='%d', `Sideskirt`='%d', `Lamps`='%f', `Nitro`='%d', `Exhaust`='%d', `Wheels`='%d', `Stereo`='%d', `Hydraulics`='%d', `TuningGemeldet`='%d',",
	    FahrzeugInfo[i][fTuning][0],FahrzeugInfo[i][fTuning][1],FahrzeugInfo[i][fTuning][2],FahrzeugInfo[i][fTuning][3],FahrzeugInfo[i][fTuning][4],FahrzeugInfo[i][fTuning][5],FahrzeugInfo[i][fTuning][6],FahrzeugInfo[i][fTuning][7],
		FahrzeugInfo[i][fTuning][8],FahrzeugInfo[i][fTuning][9],FahrzeugInfo[i][fTuningGemeldet]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Front Bumper`='%d', `Rear Bumper`='%d', `Vent Right`='%d', `Vent Left`='%d', `Panels`='%f', `Doors`='%d', `Lights`='%d', `Tires`='%d', `Geld`='%d', `Drogen`='%d', `upgradeRespawn` = '%d' WHERE `ID`='%d'",
	    FahrzeugInfo[i][fTuning][10],FahrzeugInfo[i][fTuning][11],FahrzeugInfo[i][fTuning][12],FahrzeugInfo[i][fTuning][13],panels,doors,lights,tires,FahrzeugInfo[i][fkGeld],FahrzeugInfo[i][fkDrogen],FahrzeugInfo[i][fkUpgradeRespawn],FahrzeugInfo[i][fDatabaseID]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);
		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		DeleteVehicle(i);
	}
	return 1;
}

stock DeleteVehicle(vehicleid)
{
    RemoveTuning(vehicleid);
	FahrzeugInfo[vehicleid][fDatabaseID] = 0;
	FahrzeugInfo[vehicleid][fErstellt] = false;
	FahrzeugInfo[vehicleid][fModelID] = 0;
	FahrzeugInfo[vehicleid][fPosition][0] = 0.0;
	FahrzeugInfo[vehicleid][fPosition][1] = 0.0;
	FahrzeugInfo[vehicleid][fPosition][2] = 0.0;
	FahrzeugInfo[vehicleid][fPosition][3] = 0.0;
	FahrzeugInfo[vehicleid][fColor][0] = 0;
	FahrzeugInfo[vehicleid][fColor][1] = 0;
	FahrzeugInfo[vehicleid][fPaintjob] = 3;
	FahrzeugInfo[vehicleid][fKennzeichen] = 0;
	FahrzeugInfo[vehicleid][fAbgeschleppt] = 0;
	FahrzeugInfo[vehicleid][fParkkralle] = 0;
	FahrzeugInfo[vehicleid][fKilometer] = 0;
	FahrzeugInfo[vehicleid][fTank] = 0.0;
	FahrzeugInfo[vehicleid][fRang] = 0;
	for(new i=0;i<14;i++){
	FahrzeugInfo[vehicleid][fTuning][i] = 0;}
	FahrzeugInfo[vehicleid][fFraktion] = 0;
	FahrzeugInfo[vehicleid][fGruppe] = 0;
	FahrzeugInfo[vehicleid][fPreis] = 0;
	FahrzeugInfo[vehicleid][fBesitzerID] = -1;
	FahrzeugInfo[vehicleid][fBesitzer] = 0; format(FahrzeugInfo[vehicleid][fBesitzer], 0, "");
	FahrzeugInfo[vehicleid][fkGeld] = 0;
	FahrzeugInfo[vehicleid][fkDrogen] = 0;
	FahrzeugInfo[vehicleid][fkUpgradeRespawn] = 0;
	FahrzeugInfo[vehicleid][fJobEXP] = 0;
	FahrzeugInfo[vehicleid][fBankrob] = 0;
	FahrzeugInfo[vehicleid][fAutohaus] = 0;
	FahrzeugInfo[vehicleid][fNebenjob] = 0;
	FahrzeugInfo[vehicleid][fGarage] = 0;
	FahrzeugInfo[vehicleid][fGPark] = 0;
	FahrzeugInfo[vehicleid][fFahrschule] = 0;
	FahrzeugInfo[vehicleid][fSupmobil] = 0;
	FahrzeugInfo[vehicleid][fZiviroller] = 0;
	FahrzeugInfo[vehicleid][fImportCar] = 0;
	FahrzeugInfo[vehicleid][fKurrierCar] = 0;
	DestroyDynamic3DTextLabel(FahrzeugInfo[vehicleid][fLabel]);
	FahrzeugInfo[vehicleid][fLabel] = Text3D:INVALID_3DTEXT_ID;

	for(new supobjects; supobjects < 4; supobjects++)
	{
	    DestroyDynamicObject(FahrzeugInfo[vehicleid][fSupMobilObj][supobjects]);
	    FahrzeugInfo[vehicleid][fSupMobilObj][supobjects] = INVALID_OBJECT_ID;
	}
	if(FahrzeugInfo[vehicleid][fNeonStatus] == true)
	{
		DestroyDynamicObject(FahrzeugInfo[vehicleid][fNeonObj][0]);
		DestroyDynamicObject(FahrzeugInfo[vehicleid][fNeonObj][1]);
		FahrzeugInfo[vehicleid][fNeonObj][0] = INVALID_OBJECT_ID;
		FahrzeugInfo[vehicleid][fNeonObj][1] = INVALID_OBJECT_ID;
		FahrzeugInfo[vehicleid][fNeonStatus] = false;
	}
	DestroyDynamicObject(FahrzeugInfo[vehicleid][fPDObject]);
	FahrzeugInfo[vehicleid][fPDObject] = INVALID_OBJECT_ID;

	DestroyDynamicObject(FahrzeugInfo[vehicleid][fSirene][0]);
	DestroyDynamicObject(FahrzeugInfo[vehicleid][fSirene][1]);
	DestroyDynamicObject(FahrzeugInfo[vehicleid][fSirene][2]);
	DestroyDynamicObject(FahrzeugInfo[vehicleid][fSirene][3]);
	DestroyDynamicObject(FahrzeugInfo[vehicleid][fSirene][4]);

	FahrzeugInfo[vehicleid][fSirene][0] = INVALID_OBJECT_ID;
	FahrzeugInfo[vehicleid][fSirene][1] = INVALID_OBJECT_ID;
	FahrzeugInfo[vehicleid][fSirene][2] = INVALID_OBJECT_ID;
	FahrzeugInfo[vehicleid][fSirene][3] = INVALID_OBJECT_ID;
	FahrzeugInfo[vehicleid][fSirene][4] = INVALID_OBJECT_ID;

	FahrzeugInfo[vehicleid][fSireneBool] = false;

	Motor[vehicleid] = false;
	Licht[vehicleid] = false;
	DOOR[vehicleid] = true;
	Motorhaube[vehicleid] = false;
	Kofferraum[vehicleid] = false;
	DestroyVehicle(vehicleid);
	return 1;
}

stock AddOther(vehicleid)
{
	new var[264];
    if(FahrzeugInfo[vehicleid][fAutohaus] != 0)//Autohausfahrzeug
	{
		format(var,sizeof(var),"{FE0000}%s {FFFFFF}zu verkaufen!\nPreis: {FE0000}%d$",FahrzeugName[FahrzeugInfo[vehicleid][fModelID]-400],FahrzeugInfo[vehicleid][fPreis]);
		FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel(var, 0xFFFFFFFF, 0.0, 0.0, 0.0, 7.0, INVALID_PLAYER_ID, vehicleid);
		Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
		return 1;
	}
	else if(FahrzeugInfo[vehicleid][fNebenjob] > 0)//Nebenjobfahrzeug
	{
		if(FahrzeugInfo[vehicleid][fNebenjob] == 1)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("LKW-Fahrer:\n{FE0000}Niemand", 0xFFFFFFFF, 0.0, 0.0, 0.0, 7.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 2)
		{
			FahrzeugInfo[vehicleid][fPizzaObjekt] = CreateDynamicObject(1582,0,0,-1000,0,0,0,100);
			AttachObjectToVehicle(FahrzeugInfo[vehicleid][fPizzaObjekt], vehicleid, 0.000000,-0.674999,1.350000,-90.000000,89.099983,0.000000);
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Pizzabote:\n{FE0000}Niemand", 0xFFFFFFFF, 0.0, 0.0, 0.0, 7.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 3)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("K-Fahrer:\n{FE0000}Niemand{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter", 0xFFFFFFFF, 0.0, 0.0, 0.0, 7.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 4)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Pilot:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 5)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Busfahrer:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 6)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Müllmann:\n{FE0000}Niemand{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 7)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Landwirt:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 10)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Geldlieferant:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 11)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Elektriker:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 16)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Langstreckenfahrer:\n{FE0000}Niemand{FFFFFF}", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 17)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Fluglieferant", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
		else if(FahrzeugInfo[vehicleid][fNebenjob] == 18)
		{
			FahrzeugInfo[vehicleid][fLabel] = CreateDynamic3DTextLabel("Hochseefischer", 0xFFFFFFFF, 0.0, 0.0, 0.0, 10.0, INVALID_PLAYER_ID, vehicleid);
			Attach3DTextLabelToVehicle(FahrzeugInfo[vehicleid][fLabel],vehicleid,0.0,0.0,0.2);
			return 1;
		}
	}
 	else if(FahrzeugInfo[vehicleid][fFraktion] != 0)//Fraktionsfahrzeug
	{
	    if(FahrzeugInfo[vehicleid][fFraktion] == 2 || FahrzeugInfo[vehicleid][fFraktion] == 3 || FahrzeugInfo[vehicleid][fFraktion] == 4)//Cop car
	 	{
	 	    if(FahrzeugInfo[vehicleid][fModelID] == 596 || FahrzeugInfo[vehicleid][fModelID] == 597 || FahrzeugInfo[vehicleid][fModelID] == 598)
	 	    {
	 	        new pdobjtext[20];
				FahrzeugInfo[vehicleid][fPDObject] = CreateDynamicObject(19477, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fPDObject], vehicleid, 0.0100, -0.8700, 0.8050, 0.0000, -90.0000, 270.0000);
				format(pdobjtext,sizeof(pdobjtext),"{000000}PD %d",FahrzeugInfo[vehicleid][fDatabaseID]);
				SetDynamicObjectMaterialText(FahrzeugInfo[vehicleid][fPDObject], 0, pdobjtext, OBJECT_MATERIAL_SIZE_256x128, "Arial", 48, 0, 0xFFFF8200, 0x00000000, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
				SetVehicleHealth(vehicleid, 1500);
				return 1;
			}
		}
   	}
	return 1;
}

stock AddTuning(vehicleid)
{
	if(FahrzeugInfo[vehicleid][fNeonColor] != 0 && FahrzeugInfo[vehicleid][fNeonStatus] == false)
	{
		FahrzeugInfo[vehicleid][fNeonStatus] = true;
		FahrzeugInfo[vehicleid][fNeonObj][0] = CreateDynamicObject(FahrzeugInfo[vehicleid][fNeonColor],0,0,0,0,0,0);
		FahrzeugInfo[vehicleid][fNeonObj][1] = CreateDynamicObject(FahrzeugInfo[vehicleid][fNeonColor],0,0,0,0,0,0);
		AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fNeonObj][0], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
		AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fNeonObj][1], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
	}
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][0]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][1]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][2]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][3]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][4]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][5]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][6]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][7]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][8]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][9]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][10]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][11]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][12]);
	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][13]);
	ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1]);
	return 1;
}

stock RemoveTuning(vehicleid)
{
	if(FahrzeugInfo[vehicleid][fNeonStatus] == true)
	{
		DestroyDynamicObject(FahrzeugInfo[vehicleid][fNeonObj][0]);
		DestroyDynamicObject(FahrzeugInfo[vehicleid][fNeonObj][1]);
		FahrzeugInfo[vehicleid][fNeonObj][0] = INVALID_OBJECT_ID;
		FahrzeugInfo[vehicleid][fNeonObj][1] = INVALID_OBJECT_ID;
		FahrzeugInfo[vehicleid][fNeonColor] = 0;
		FahrzeugInfo[vehicleid][fNeonStatus] = false;
	}
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][0]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][1]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][2]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][3]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][4]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][5]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][6]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][7]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][8]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][9]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][10]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][11]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][12]);
	RemoveVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][13]);
	return 1;
}

stock IsAPlane(carid2)
{
	new carid = GetVehicleModel(carid2);
	if(carid == 592 || carid == 577 || carid == 511 || carid == 512 || carid == 593 || carid == 520 || carid == 553 || carid == 476 || carid == 519 || carid == 460 || carid == 513) return 1;
	return 0;
}
stock IsABoat(carid)
{
	new modelid = GetVehicleModel(carid);
	if(modelid == 430 || modelid == 446 || modelid == 452 || modelid == 453 || modelid == 454 || modelid == 472 || modelid == 473 || modelid == 484 || modelid == 493 || modelid == 595)
	{
			return 1;
	}
	return 0;
}

stock CreateNummernSchild(playerid)
{
	new Float:xx, Float:yy, Float:zz;
	GetPlayerPos(playerid, xx, yy, zz);
	new bla1 = random(26), bla2 = random(26);
	new zahl1 = random(9)+1, zahl2 = random(9)+1, zahl3 = random(9)+1, zahl4 = random(9)+1;
	new string[10], stadt[3], mitte[2], zahlen[4];
	new zahl = random(4)+1;

	if(SpielerInfo[playerid][sStadt] == 1)
	{
 		format(stadt, sizeof(stadt), "LS");
	}
	else if(SpielerInfo[playerid][sStadt] == 2)
	{
 		format(stadt, sizeof(stadt), "SF");
	}
	else if(SpielerInfo[playerid][sStadt] == 3)
	{
	    format(stadt, sizeof(stadt), "LV");
	}

	format(mitte, sizeof(mitte), "%s%s", ABC[bla1], ABC[bla2]);

	if(zahl == 1){format(zahlen, sizeof(zahlen), "%d", zahl1);}
	else if(zahl == 2){format(zahlen, sizeof(zahlen), "%d%d", zahl1, zahl2);}
	else if(zahl == 3){format(zahlen, sizeof(zahlen), "%d%d%d", zahl1, zahl2, zahl3);}
	else if(zahl == 4){format(zahlen, sizeof(zahlen), "%d%d%d%d", zahl1, zahl2, zahl3, zahl4);}

	format(string, sizeof(string), "%s:%s:%s", stadt, mitte, zahlen);
	return string;
}

stock FahrzeugStatus(Zahl,tmpcar)
{
    new status[25];
	if(Zahl == 1)
	{
		switch(Motor[tmpcar])
		{
		    case false:{status="{FF0000}Aus";}
			case true:{status="{9ACD32}An";}
		}
		return status;
	}
	if(Zahl == 2)
	{
		switch(Licht[tmpcar])
		{
			case false:{status="{FF0000}Ausgeschaltet";}
			case true:{status="{9ACD32}Angeschaltet";}
		}
		return status;
	}
	if(Zahl == 3)
	{
		switch(DOOR[tmpcar])
		{
			case false:{status="{9ACD32}Offen";}
			case true:{status="{FF0000}Geschlossen";}
		}
		return status;
	}
	if(Zahl == 4)
	{
		switch(Motorhaube[tmpcar])
		{
			case false:{status="{FF0000}Geschlossen";}
			case true:{status="{9ACD32}Offen";}
		}
		return status;
	}
	if(Zahl == 5)
	{
		switch(Kofferraum[tmpcar])
		{
			case false:{status="{FF0000}Geschlossen";}
			case true:{status="{9ACD32}Offen";}
		}
		return status;
	}
	if(Zahl == 6)
	{
		switch(Radio[tmpcar])
		{
			case false:{status="{FF0000}Ausgeschaltet";}
			case true:{status="{9ACD32}Angeschaltet";}
		}
		return status;
	}
	if(Zahl == 7)
	{
	    switch(Neon[tmpcar])
		{
		case false:{status="{FF0000}Ausgeschalten";}
		case true:{status="{9ACD32}Angeschalten";}
		}
		return status;
 	}
	return status;
}

stock AddVehicleTuning(vehicleid)
{
	if(FahrzeugInfo[vehicleid][fTuning][0] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][0]);}
	if(FahrzeugInfo[vehicleid][fTuning][1] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][1]);}
	if(FahrzeugInfo[vehicleid][fTuning][2] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][2]);}
	if(FahrzeugInfo[vehicleid][fTuning][3] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][3]);}
	if(FahrzeugInfo[vehicleid][fTuning][4] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][4]);}
	if(FahrzeugInfo[vehicleid][fTuning][5] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][5]);}
	if(FahrzeugInfo[vehicleid][fTuning][6] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][6]);}
	if(FahrzeugInfo[vehicleid][fTuning][7] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][7]);}
	if(FahrzeugInfo[vehicleid][fTuning][8] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][8]);}
	if(FahrzeugInfo[vehicleid][fTuning][9] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][9]);}
	if(FahrzeugInfo[vehicleid][fTuning][10] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][10]);}
	if(FahrzeugInfo[vehicleid][fTuning][11] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][11]);}
	if(FahrzeugInfo[vehicleid][fTuning][12] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][12]);}
	if(FahrzeugInfo[vehicleid][fTuning][13] != 0){AddVehicleComponent(vehicleid,FahrzeugInfo[vehicleid][fTuning][13]);}
	return 1;
}

stock LoadPrivatCar(playerid)
{
	if(IsPlayerNPC(playerid) || GetPVarInt(playerid,"LoggedIn") == 0)return 0;
    new vehicleid, ModelID, Float:Position[4], Color[2], Schild[10], var[64], Float:Tank, string[264], Besitzer[24], NeonFarbe,
	Garage, GPark, Database, Abgeschleppt, Parkkralle, loadKilometer, Preis, JobEXP, Tuning[14], Paintjob, Panels, Doors, Lights, Tires,
	UpgradeRespawns;

    mysql_format(sqlHandle, string, sizeof(string),"SELECT * FROM `vehicles` WHERE `Besitzer` = '%s'", SpielerInfo[playerid][sName]);
    new Cache:result = mysql_query(sqlHandle, string);
   
	for(new i = 0; i < cache_num_rows(); i++)
	{
	    //Hauptvariablen
        cache_get_value_name(i, "ID",var); Database = strval(var);
	    cache_get_value_name(i, "ModelID",var); ModelID = strval(var);
	    cache_get_value_name(i, "PositionX",var); Position[0] = floatstr(var);
	    cache_get_value_name(i, "PositionY",var); Position[1] = floatstr(var);
	    cache_get_value_name(i, "PositionZ",var); Position[2] = floatstr(var);
	    cache_get_value_name(i, "PositionA",var); Position[3] = floatstr(var);
	    cache_get_value_name(i, "Farbe1",var); Color[0] = strval(var);
	    cache_get_value_name(i, "Farbe2",var); Color[1] = strval(var);
	    cache_get_value_name(i, "Paintjob",var); Paintjob = strval(var);
	    cache_get_value_name(i, "NeonFarbe",var); NeonFarbe = strval(var);

	    //Nebenvariablen
     	cache_get_value_name(i, "Kennzeichen",Schild);
	    cache_get_value_name(i, "Abgeschleppt",var); Abgeschleppt = strval(var);
	    cache_get_value_name(i, "Parkkralle",var); Parkkralle = strval(var);
	    cache_get_value_name(i, "Kilometer",var); loadKilometer = strval(var);
	    cache_get_value_name(i, "Tank",var); Tank = floatstr(var);
	    cache_get_value_name(i, "Preis",var); Preis = strval(var);
     	cache_get_value_name(i, "Garage",var); Garage = strval(var);
     	cache_get_value_name(i, "GPark",var); GPark = strval(var);
	    cache_get_value_name(i, "Besitzer",Besitzer);
	    cache_get_value_name(i, "JobEXP",var); JobEXP = strval(var);

	    //Tuningvariablen
	    cache_get_value_name(i, "Spoiler",var); Tuning[0] = strval(var);
	    cache_get_value_name(i, "Hood",var); Tuning[1] = strval(var);
	    cache_get_value_name(i, "Roof",var); Tuning[2] = strval(var);
	    cache_get_value_name(i, "Sideskirt",var); Tuning[3] = strval(var);
	    cache_get_value_name(i, "Lamps",var); Tuning[4] = strval(var);
	    cache_get_value_name(i, "Nitro",var); Tuning[5] = strval(var);
	    cache_get_value_name(i, "Exhaust",var); Tuning[6] = strval(var);
	    cache_get_value_name(i, "Wheels",var); Tuning[7] = strval(var);
	    cache_get_value_name(i, "Stereo",var); Tuning[8] = strval(var);
	    cache_get_value_name(i, "Hydraulics",var); Tuning[9] = strval(var);
	    cache_get_value_name(i, "Front Bumper",var); Tuning[10] = strval(var);
	    cache_get_value_name(i, "Rear Bumper",var); Tuning[11] = strval(var);
	    cache_get_value_name(i, "Vent Right",var); Tuning[12] = strval(var);
	    cache_get_value_name(i, "Vent Left",var); Tuning[13] = strval(var);

	    //Damagevariablen
	    cache_get_value_name(i, "Panels",var); Panels = strval(var);
	    cache_get_value_name(i, "Doors",var); Doors = strval(var);
	    cache_get_value_name(i, "Lights",var); Lights = strval(var);
	    cache_get_value_name(i, "Tires",var); Tires = strval(var);

		cache_get_value_name(i, "upgradeRespawn", var); UpgradeRespawns = strval(var);

        //Fahrzeugerstellung
	    if(Abgeschleppt == 0)
		{
		    if(Garage == 0)
		    {
				vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],-1);
				format(FahrzeugInfo[vehicleid][fKennzeichen], 10, Schild);
				SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);
				FahrzeugInfo[vehicleid][fTank] = Tank;
			}
			else
			{
			    if(GPark == 1)
			    {
			        vehicleid = CreateVehicle(ModelID,2405.1667,2826.0759,-47.9936,269.1802,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 2)
			    {
			        vehicleid = CreateVehicle(ModelID,2405.3621,2830.8975,-47.9936,269.5629,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 3)
			    {
			        vehicleid = CreateVehicle(ModelID,2405.5627,2835.4319,-47.9936,270.1735,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 4)
			    {
			        vehicleid = CreateVehicle(ModelID,2405.7219,2839.9592,-47.9936,269.2777,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 5)
			    {
			        vehicleid = CreateVehicle(ModelID,2405.8633,2844.2336,-47.9936,270.2021,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 6)
			    {
			        vehicleid = CreateVehicle(ModelID,2422.6580,2826.0208,-47.9936,89.9365,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 7)
			    {
			        vehicleid = CreateVehicle(ModelID,2422.6277,2830.5173,-47.9936,89.4820,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 8)
			    {
			        vehicleid = CreateVehicle(ModelID,2422.6326,2835.1450,-47.9936,89.6107,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 9)
			    {
			        vehicleid = CreateVehicle(ModelID,2422.6853,2839.8669,-47.9936,89.6220,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
			    else if(GPark == 10)
			    {
			        vehicleid = CreateVehicle(ModelID,2422.7322,2844.5952,-47.9936,89.1004,Color[0],Color[1],-1);
			        SetVehicleVirtualWorld(vehicleid,Garage);
			    }
				format(FahrzeugInfo[vehicleid][fKennzeichen], 10, Schild);
				SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);
				FahrzeugInfo[vehicleid][fTank] = Tank;
			}
			if(NeonFarbe != 0)
			{
				FahrzeugInfo[vehicleid][fNeonStatus] = true;
				FahrzeugInfo[vehicleid][fNeonColor] = NeonFarbe;
				FahrzeugInfo[vehicleid][fNeonObj][0] = CreateDynamicObject(NeonFarbe,0,0,0,0,0,0);
				FahrzeugInfo[vehicleid][fNeonObj][1] = CreateDynamicObject(NeonFarbe,0,0,0,0,0,0);
				AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fNeonObj][0], vehicleid, -0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
				AttachDynamicObjectToVehicle(FahrzeugInfo[vehicleid][fNeonObj][1], vehicleid, 0.8, 0.0, -0.70, 0.0, 0.0, 0.0);
			}

			//Fahrzeughauptvariablen
	        FahrzeugInfo[vehicleid][fErstellt] = true;
			FahrzeugInfo[vehicleid][fModelID] = ModelID;
			FahrzeugInfo[vehicleid][fColor][0] = Color[0];
			FahrzeugInfo[vehicleid][fColor][1] = Color[1];
			FahrzeugInfo[vehicleid][fPaintjob] = Paintjob;
			FahrzeugInfo[vehicleid][fPosition][0] = Position[0];
			FahrzeugInfo[vehicleid][fPosition][1] = Position[1];
			FahrzeugInfo[vehicleid][fPosition][2] = Position[2];
			FahrzeugInfo[vehicleid][fPosition][3] = Position[3];

			//Fahrzeugteilvergabe
			UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:Panels, VEHICLE_DOOR_STATUS:Doors, VEHICLE_LIGHT_STATUS:Lights, VEHICLE_TYRE_STATUS:Tires);

			//Fahrzeugparameter
			Motor[vehicleid] = false;
			Licht[vehicleid] = false;
			DOOR[vehicleid] = true;
			Motorhaube[vehicleid] = false;
			Kofferraum[vehicleid] = false;

			//Nebenvariablenvergabe
			format(FahrzeugInfo[vehicleid][fBesitzer], MAX_PLAYER_NAME, SpielerInfo[playerid][sName]);
			FahrzeugInfo[vehicleid][fBesitzerID] = playerid;
			FahrzeugInfo[vehicleid][fFraktion] = 0;
			FahrzeugInfo[vehicleid][fGruppe] = 0;
			FahrzeugInfo[vehicleid][fAutohaus] = 0;
			FahrzeugInfo[vehicleid][fNebenjob] = 0;
			FahrzeugInfo[vehicleid][fGarage] = Garage;
			FahrzeugInfo[vehicleid][fGPark] = GPark;
			FahrzeugInfo[vehicleid][fFahrschule] = 0;
			FahrzeugInfo[vehicleid][fSupmobil] = 0;
			FahrzeugInfo[vehicleid][fZiviroller] = 0;
			FahrzeugInfo[vehicleid][fImportCar] = 0;
			FahrzeugInfo[vehicleid][fKurrierCar] = 0;
			FahrzeugInfo[vehicleid][fDatabaseID] = Database;
			FahrzeugInfo[vehicleid][fAbgeschleppt] = Abgeschleppt;
			FahrzeugInfo[vehicleid][fParkkralle] = Parkkralle;
			FahrzeugInfo[vehicleid][fKilometer] = loadKilometer;
			FahrzeugInfo[vehicleid][fRang] = 0,
			FahrzeugInfo[vehicleid][fPreis] = Preis;
			FahrzeugInfo[vehicleid][fJobEXP] = JobEXP;
			FahrzeugInfo[vehicleid][fkUpgradeRespawn] = UpgradeRespawns;

			//Fahrzeugtuningvariablen
			FahrzeugInfo[vehicleid][fTuning][0] = Tuning[0]; FahrzeugInfo[vehicleid][fTuning][1] = Tuning[1]; FahrzeugInfo[vehicleid][fTuning][2] = Tuning[2];
			FahrzeugInfo[vehicleid][fTuning][3] = Tuning[3]; FahrzeugInfo[vehicleid][fTuning][4] = Tuning[4]; FahrzeugInfo[vehicleid][fTuning][5] = Tuning[5];
			FahrzeugInfo[vehicleid][fTuning][6] = Tuning[6]; FahrzeugInfo[vehicleid][fTuning][7] = Tuning[7]; FahrzeugInfo[vehicleid][fTuning][8] = Tuning[8];
			FahrzeugInfo[vehicleid][fTuning][9] = Tuning[9]; FahrzeugInfo[vehicleid][fTuning][10] = Tuning[10]; FahrzeugInfo[vehicleid][fTuning][11] = Tuning[11];
			FahrzeugInfo[vehicleid][fTuning][12] = Tuning[12]; FahrzeugInfo[vehicleid][fTuning][13] = Tuning[13];

			GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);

			AddVehicleTuning(vehicleid);
		}
		else
		{
		    format(string, 128, "SMS von 113 (SAPD): Sehr geeherte/r Bürger/in, Ihr %s befindet sich in unserer Verwahrstelle.",FahrzeugName[ModelID-400]);
			SendClientMessage(playerid,COLOR_INFO,string);
		}
	}
	cache_delete(result);
	return 1;
}

Vehicles_OnDialogResponse(playerid, dialogid, response, listitem) {
	switch(dialogid) {
		case DIALOG_PLAYER_CAR_LIST: {
			if(!response) return 1;

			if(listitem < 0 || listitem >= MAX_VEHICLE_PLAYER_LIST) return 1;

			new i = PrivateCarList[playerid][listitem], headerstring[32], mainstring[512];
			format(headerstring, sizeof(headerstring), "{9933FF}RSL: {FFFFFF}%s", FahrzeugName[FahrzeugInfo[i][fModelID]-400]);

			strcat(mainstring, "Upgrade\tWert");
			format(mainstring, sizeof(mainstring), "%s\nCar Respawns\t%i", mainstring, FahrzeugInfo[i][fkUpgradeRespawn]);
			format(mainstring, sizeof(mainstring), "%s\nFahrzeugortung\tunendlich", mainstring);

			SetPVarInt(playerid, "RESPAWN_VEH_SELECTED", i);

			ShowPlayerDialog(playerid, DIALOG_CAR_LIST_SELECT, DIALOG_STYLE_TABLIST_HEADERS, headerstring, mainstring, "Auswählen", "Zurück");
			return 1;
		}

		case DIALOG_CAR_LIST_SELECT: {
			if(!response) return showPlayerPrivateCarList(playerid);

			switch(listitem) {
				case 0: { //FahrzeugUpgrades
					if(listitem < 0 || listitem >= MAX_VEHICLE_PLAYER_LIST) return 1;

					new i = GetPVarInt(playerid, "RESPAWN_VEH_SELECTED");

					DeletePVar(playerid, "RESPAWN_VEH_SELECTED");

					if(!FahrzeugInfo[i][fkUpgradeRespawn]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Dein Fahrzeug %s kannst du nicht mehr respawnen. Du musst erneut ein Fahrzeugupgrade erwerben.", FahrzeugName[FahrzeugInfo[i][fModelID]-400]);
				
					new vehID = getVehicleIdByDatabaseId(FahrzeugInfo[i][fDatabaseID]);

					if(!IsValidVehicle(vehID))return SendClientMessage(playerid, COLOR_ERRORTEXT, "Das Fahrzeug existiert nicht.");
					if(GetVehicleDriverEx(vehID) != -1)return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es dürfen sich keine Personen im ausgewählten Fahrzeug befinden.");
    				SetVehicleToRespawn(vehID);

					FahrzeugInfo[i][fkUpgradeRespawn]--;
					SendClientMessage(playerid, -1, "Du hast dein Fahrzeug {9933FF}%s{FFFFFF} erfolgreich respawned (Verbleibende Respawns {9933FF}%i{FFFFFF})", FahrzeugName[FahrzeugInfo[i][fModelID]-400], FahrzeugInfo[i][fkUpgradeRespawn]);
				}
				case 1: {
					new i = GetPVarInt(playerid, "RESPAWN_VEH_SELECTED");

					DeletePVar(playerid, "RESPAWN_VEH_SELECTED");

					new vehID = getVehicleIdByDatabaseId(FahrzeugInfo[i][fDatabaseID]);
					if(!IsValidVehicle(vehID))return SendClientMessage(playerid, COLOR_ERRORTEXT, "Das Fahrzeug existiert nicht.");

					if(FahrzeugInfo[vehID][fGarage] != 0)return SendClientMessage(playerid, COLOR_ERRORTEXT, "Das Fahrzeug befindet sich in deiner Garage.");

					new Float:_tempPos[3];
					GetVehiclePos(vehID, _tempPos[0], _tempPos[1], _tempPos[2]);

					SetPlayerCheckpointEx(playerid, _tempPos[0], _tempPos[1], _tempPos[2], 5.0);

					SendClientMessage(playerid, -1, "Du hast dein Fahrzeug {9933FF}%s{FFFFFF} erfolgreich auf der Karte markiert.", FahrzeugName[FahrzeugInfo[i][fModelID]-400]);
				}
			}
			return 1;
		}

		case DIALOG_CAR_UPGRADE_SHOP: {
			if(!response) return 1;

			if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du musst dich in einem Fahrzeug befinden.");

			new vehID = GetPlayerVehicleID(playerid);
			if(!IsValidVehicle(vehID)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Das Fahrzeug existiert nicht.");
			if(FahrzeugInfo[vehID][fDatabaseID] == 0 || FahrzeugInfo[vehID][fBesitzerID] != playerid) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du kannst nur deine eigenen Fahrzeuge upgraden.");

			switch(listitem) {
				case 0: { //Fahrzeugrespawns

					if(FahrzeugInfo[vehID][fGarage]) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Dein Fahrzeug befindet sich in einer Garage und kann deshalb nicht respawned werden.");

					if(GetPlayerMoneyEx(playerid) < 2500) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du hast nicht genügend Geld (2500$).");

					SendClientMessage(playerid, COLOR_YELLOW, "Du hast erfolgreich 10 Fahrzeugrespawns erworben.");

					GivePlayerMoneyEx(playerid, 2500);

					FahrzeugInfo[vehID][fkUpgradeRespawn] += 10;
				}
			}
		}
	}
	return 1;
}

stock getVehicleIdByDatabaseId(databaseId) {
	new vehicleid = INVALID_VEHICLE_ID;

	for(new i = 1; i < MAX_VEHICLES; i++) {
		if(!IsValidVehicle(i)) continue;
		if(FahrzeugInfo[i][fDatabaseID] != databaseId) continue;
		vehicleid = i;
		break;
	}

	return vehicleid;
}

showPlayerPrivateCarList(playerid) {
	new carCount = 0, mainstring[1028];
	strcat(mainstring, "Fahrzeug\tKennzeichen\tStatus");
	for(new i=1;i<MAX_VEHICLES;i++) {
		if(FahrzeugInfo[i][fDatabaseID] == 0 || FahrzeugInfo[i][fBesitzerID] != playerid)continue;
		format(mainstring, sizeof(mainstring), "%s\n%s\t%s\t%s", mainstring, FahrzeugName[FahrzeugInfo[i][fModelID]-400], FahrzeugInfo[i][fKennzeichen], (FahrzeugInfo[i][fGarage]) ? "GARAGE" : "-");
		PrivateCarList[playerid][carCount] = i;
		carCount++;
		if(carCount == MAX_VEHICLE_PLAYER_LIST) {
			SendClientMessage(playerid, COLOR_GREY, "Im Spiel können nur "#MAX_VEHICLE_PLAYER_LIST" Fahrzeuge angezeigt werden, falls du weitere Fahrzeuge besitzt, nutze das User Control Panel.");
			break;
		}
	}
	if(!carCount) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du besitzt keine Fahrzeuge.");
	ShowPlayerDialog(playerid, DIALOG_PLAYER_CAR_LIST, DIALOG_STYLE_TABLIST_HEADERS, "{9933FF}RSL: {FFFFFF}Meine Fahrzeuge", mainstring, "Schließen", "");
	return 1;
}

Vehicle_Init() {
	CreateDynamic3DTextLabel(COLOR_HEX_YELLOW"Fahrzeugupgrades\n"COLOR_HEX_WHITE"Tippe /vehupgrades", COLOR_WHITE, 2130.0513,-1144.9211,24.3021 + 0.5, 8.0);
    CreateDynamicPickup(1277, 1,  2130.0513,-1144.9211,24.3021, 0);
	return 1;
}

public LoadVehicles()
{
	new vehicleid, ModelID, Float:Position[4], Color[2], counter = 0, var[64], Besitzer[24], Schild[5],
	Database, Abgeschleppt, Parkkralle, loadKilometer, Rang, Preis, Tuning[14], Fraktion, loadAutohaus, Nebenjob, JobEXP, Gruppe,
	Garage, GPark, Fahrschule, Panels, Doors, Lights, Tires, Paintjob, TuningGemeldet;
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `vehicles` ORDER BY `ID` ASC");
	
	for(new i = 0; i < cache_num_rows(); i++)
	{
	    //Hauptvariablen
	    cache_get_value_name(i, "ID",var); Database = strval(var);
	    cache_get_value_name(i, "ModelID",var); ModelID = strval(var);
	    cache_get_value_name(i, "PositionX",var); Position[0] = floatstr(var);
	    cache_get_value_name(i, "PositionY",var); Position[1] = floatstr(var);
	    cache_get_value_name(i, "PositionZ",var); Position[2] = floatstr(var);
	    cache_get_value_name(i, "PositionA",var); Position[3] = floatstr(var);
	    cache_get_value_name(i, "Farbe1",var); Color[0] = strval(var);
	    cache_get_value_name(i, "Farbe2",var); Color[1] = strval(var);
	    cache_get_value_name(i, "Paintjob",var); Paintjob = strval(var);

	    //Zugehörigkeitsvariablen
	    cache_get_value_name(i, "Kennzeichen",Schild);
     	cache_get_value_name(i, "Fraktion",var); Fraktion = strval(var);
     	cache_get_value_name(i, "Gruppe",var); Gruppe = strval(var);
      	cache_get_value_name(i, "Autohaus",var); loadAutohaus = strval(var);
      	cache_get_value_name(i, "Nebenjob",var); Nebenjob = strval(var);
      	cache_get_value_name(i, "Fahrschule",var); Fahrschule = strval(var);
      	cache_get_value_name(i, "Garage",var); Garage = strval(var);
      	cache_get_value_name(i, "GPark",var); GPark = strval(var);
      	cache_get_value_name(i, "Besitzer",Besitzer);

	    //Nebenvariablen
	    cache_get_value_name(i, "Abgeschleppt",var); Abgeschleppt = strval(var);
	    cache_get_value_name(i, "Parkkralle",var); Parkkralle = strval(var);
	    cache_get_value_name(i, "Kilometer",var); loadKilometer = strval(var);
	    cache_get_value_name(i, "Rang",var); Rang = strval(var);
	    cache_get_value_name(i, "Preis",var); Preis = strval(var);
	    cache_get_value_name(i, "JobEXP",var); JobEXP = strval(var);

	    //Tuningvariablen
	    cache_get_value_name(i, "Spoiler",var); Tuning[0] = strval(var);
	    cache_get_value_name(i, "Hood",var); Tuning[1] = strval(var);
	    cache_get_value_name(i, "Roof",var); Tuning[2] = strval(var);
	    cache_get_value_name(i, "Sideskirt",var); Tuning[3] = strval(var);
	    cache_get_value_name(i, "Lamps",var); Tuning[4] = strval(var);
	    cache_get_value_name(i, "Nitro",var); Tuning[5] = strval(var);
	    cache_get_value_name(i, "Exhaust",var); Tuning[6] = strval(var);
	    cache_get_value_name(i, "Wheels",var); Tuning[7] = strval(var);
	    cache_get_value_name(i, "Stereo",var); Tuning[8] = strval(var);
	    cache_get_value_name(i, "Hydraulics",var); Tuning[9] = strval(var);
	    cache_get_value_name(i, "Front Bumper",var); Tuning[10] = strval(var);
	    cache_get_value_name(i, "Rear Bumper",var); Tuning[11] = strval(var);
	    cache_get_value_name(i, "Vent Right",var); Tuning[12] = strval(var);
	    cache_get_value_name(i, "Vent Left",var); Tuning[13] = strval(var);
	    cache_get_value_name(i, "TuningGemeldet",var); TuningGemeldet = strval(var);

	    //Damagevariablen
	    cache_get_value_name(i, "Panels",var); Panels = strval(var);
	    cache_get_value_name(i, "Doors",var); Doors = strval(var);
	    cache_get_value_name(i, "Lights",var); Lights = strval(var);
	    cache_get_value_name(i, "Tires",var); Tires = strval(var);

	    //Fahrzeugerstellung
	    if(Abgeschleppt == 0)
		{
		    if(strlen(Besitzer) == 0)
		    {
		        if(Nebenjob > 0)
		        {
				    if(Nebenjob == 2 || Nebenjob == 7 || Nebenjob == 10 || Nebenjob == 11)//Pizzabote || Landwirt || Geldlieferant || Elektriker
				    {
						vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],1800);
	 				}
	 				else
	 				{
	 				    vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],1800);
	 				}
	 				format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "Nebenjob");
	 				SetVehicleNumberPlate(vehicleid,"Nebenjob");
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, false, false, false, false, false, false, false);
					DOOR[vehicleid] = false;
				}
				else if(loadAutohaus > 0)
				{
				    vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],180);
  	 				format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "Autohaus");
	 				SetVehicleNumberPlate(vehicleid,"Autohaus");
		    		GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);
					DOOR[vehicleid] = true;
				}
				else if(Fraktion > 0)
				{
				    if(ModelID == 560) {
				        if(Fraktion == 2 || Fraktion == 6 || Fraktion == 5)//PD - FBI - Rettungsdienst
				        {
				        	vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],-1,true);
						}
				        else vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],-1, false);
				    } else {
				        vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],-1);
				    }
				    CreateFrakNummernSchild(vehicleid,Fraktion);
				    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);
					DOOR[vehicleid] = true;
				}
				else if(Gruppe > 0)
				{
				    if(GPark == 0)
				    {
				        vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],-1);
					}
					else
					{
					    if(GPark == 1)
					    {
					        vehicleid = CreateVehicle(ModelID,2405.1667,2826.0759,-47.9936,269.1802,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 2)
					    {
					        vehicleid = CreateVehicle(ModelID,2405.3621,2830.8975,-47.9936,269.5629,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 3)
					    {
					        vehicleid = CreateVehicle(ModelID,2405.5627,2835.4319,-47.9936,270.1735,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 4)
					    {
					        vehicleid = CreateVehicle(ModelID,2405.7219,2839.9592,-47.9936,269.2777,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 5)
					    {
					        vehicleid = CreateVehicle(ModelID,2405.8633,2844.2336,-47.9936,270.2021,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 6)
					    {
					        vehicleid = CreateVehicle(ModelID,2422.6580,2826.0208,-47.9936,89.9365,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 7)
					    {
					        vehicleid = CreateVehicle(ModelID,2422.6277,2830.5173,-47.9936,89.4820,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 8)
					    {
					        vehicleid = CreateVehicle(ModelID,2422.6326,2835.1450,-47.9936,89.6107,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 9)
					    {
					        vehicleid = CreateVehicle(ModelID,2422.6853,2839.8669,-47.9936,89.6220,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					    else if(GPark == 10)
					    {
					        vehicleid = CreateVehicle(ModelID,2422.7322,2844.5952,-47.9936,89.1004,Color[0],Color[1],-1);
					        SetVehicleVirtualWorld(vehicleid,Garage);
					    }
					}
					format(FahrzeugInfo[vehicleid][fKennzeichen], 5, Schild);
					SetVehicleNumberPlate(vehicleid,Schild);
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);
					DOOR[vehicleid] = true;
				}
				else if(Fahrschule > 0)
				{
				    vehicleid = CreateVehicle(ModelID,Position[0],Position[1],Position[2],Position[3],Color[0],Color[1],180);
  	 				format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "Fahrschule");
	 				SetVehicleNumberPlate(vehicleid,"Fahrschule");
					GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
					SetVehicleParamsEx(vehicleid, false, false, false, false, false, false, false);
					DOOR[vehicleid] = false;
				}
				FahrzeugInfo[vehicleid][fTank] = VehicleData[GetVehicleModel(vehicleid)-400][vehLiter];

				//Fahrzeughauptvariablen
		        FahrzeugInfo[vehicleid][fErstellt] = true;
				FahrzeugInfo[vehicleid][fModelID] = ModelID;
				FahrzeugInfo[vehicleid][fColor][0] = Color[0];
				FahrzeugInfo[vehicleid][fColor][1] = Color[1];
				FahrzeugInfo[vehicleid][fPaintjob] = Paintjob;
				FahrzeugInfo[vehicleid][fPosition][0] = Position[0];
				FahrzeugInfo[vehicleid][fPosition][1] = Position[1];
				FahrzeugInfo[vehicleid][fPosition][2] = Position[2];
				FahrzeugInfo[vehicleid][fPosition][3] = Position[3];

				//Fahrzeugteilvergabe
				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:Panels, VEHICLE_DOOR_STATUS:Doors, VEHICLE_LIGHT_STATUS:Lights, VEHICLE_TYRE_STATUS:Tires);
				FahrzeugInfo[vehicleid][fBesitzer] = Besitzer;
				FahrzeugInfo[vehicleid][fBesitzerID] = -1;

				//Fahrzeugparameter
				Motor[vehicleid] = false;
				Licht[vehicleid] = false;
				Motorhaube[vehicleid] = false;
				Kofferraum[vehicleid] = false;

				//Nebenvariablenvergabe
				FahrzeugInfo[vehicleid][fFraktion] = Fraktion;
				FahrzeugInfo[vehicleid][fGruppe] = Gruppe;
				FahrzeugInfo[vehicleid][fAutohaus] = loadAutohaus;
				FahrzeugInfo[vehicleid][fNebenjob] = Nebenjob;
				FahrzeugInfo[vehicleid][fGarage] = Garage;
				FahrzeugInfo[vehicleid][fGPark] = GPark;
				FahrzeugInfo[vehicleid][fFahrschule] = Fahrschule;
				FahrzeugInfo[vehicleid][fDatabaseID] = Database;
				FahrzeugInfo[vehicleid][fAbgeschleppt] = Abgeschleppt;
				FahrzeugInfo[vehicleid][fParkkralle] = Parkkralle;
				FahrzeugInfo[vehicleid][fKilometer] = loadKilometer;
				FahrzeugInfo[vehicleid][fRang] = Rang,
				FahrzeugInfo[vehicleid][fPreis] = Preis;
				FahrzeugInfo[vehicleid][fJobEXP] = JobEXP;

				//Fahrzeugtuningvariablen
				FahrzeugInfo[vehicleid][fTuning][0] = Tuning[0]; FahrzeugInfo[vehicleid][fTuning][1] = Tuning[1]; FahrzeugInfo[vehicleid][fTuning][2] = Tuning[2];
				FahrzeugInfo[vehicleid][fTuning][3] = Tuning[3]; FahrzeugInfo[vehicleid][fTuning][4] = Tuning[4]; FahrzeugInfo[vehicleid][fTuning][5] = Tuning[5];
				FahrzeugInfo[vehicleid][fTuning][6] = Tuning[6]; FahrzeugInfo[vehicleid][fTuning][7] = Tuning[7]; FahrzeugInfo[vehicleid][fTuning][8] = Tuning[8];
				FahrzeugInfo[vehicleid][fTuning][9] = Tuning[9]; FahrzeugInfo[vehicleid][fTuning][10] = Tuning[10]; FahrzeugInfo[vehicleid][fTuning][11] = Tuning[11];
				FahrzeugInfo[vehicleid][fTuning][12] = Tuning[12]; FahrzeugInfo[vehicleid][fTuning][13] = Tuning[13]; FahrzeugInfo[vehicleid][fTuningGemeldet] = TuningGemeldet;

				AddVehicleTuning(vehicleid);

				//Labelerstellung
				AddOther(vehicleid);
			    counter++;
			}
		}
	}
	cache_delete(result);
	printf("MYSQL: Es wurden '%d' Fahrzeuge geladen und erstellt.",counter);
	return 1;
}

GetVehicleBoot(vehicleid, &Float:x, &Float:y, &Float:z)
{
    if (!GetVehicleModel(vehicleid) || vehicleid == INVALID_VEHICLE_ID)
        return (x = 0.0, y = 0.0, z = 0.0), 0;
    static
        Float:pos[7]
    ;
    GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, pos[0], pos[1], pos[2]);
    GetVehiclePos(vehicleid, pos[3], pos[4], pos[5]);
    GetVehicleZAngle(vehicleid, pos[6]);
    x = pos[3] - (floatsqroot(pos[1] + pos[1]) * floatsin(-pos[6], degrees));
    y = pos[4] - (floatsqroot(pos[1] + pos[1]) * floatcos(-pos[6], degrees));
    z = pos[5];
    return 1;
}