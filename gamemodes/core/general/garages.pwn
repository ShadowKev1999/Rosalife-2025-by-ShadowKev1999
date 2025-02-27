stock SaveGarage()
{
	new query[364];
	for(new mf=1;mf<MAX_GARAGEN;mf++)
    {
        if(GaragenInfo[mf][giErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof(query),"UPDATE `garagen` SET `Besitzer`='%s', `Preis`='%d', `Ort`='%d', `Locked`='%d', `Mietbar`='%d', `Miete`='%d', `Fahrzeug1`='%d', `Fahrzeug2`='%d', `Fahrzeug3`='%d' WHERE `ID`='%d'",
	    GaragenInfo[mf][giBesitzer],GaragenInfo[mf][giPreis],GaragenInfo[mf][giOrt],GaragenInfo[mf][giLocked],GaragenInfo[mf][giMietbar],GaragenInfo[mf][giMiete],GaragenInfo[mf][giFahrzeug][0],GaragenInfo[mf][giFahrzeug][1],GaragenInfo[mf][giFahrzeug][2],mf);
		mysql_tquery(sqlHandle, query);

		mysql_format(sqlHandle, query,sizeof(query),"UPDATE `garagen` SET `Fahrzeug4`='%d', `Fahrzeug5`='%d', `Fahrzeug6`='%d', `Fahrzeug7`='%d', `Fahrzeug8`='%d', `Fahrzeug9`='%d', `Fahrzeug10`='%d' WHERE `ID`='%d'",
	    GaragenInfo[mf][giFahrzeug][3],GaragenInfo[mf][giFahrzeug][4],GaragenInfo[mf][giFahrzeug][5],GaragenInfo[mf][giFahrzeug][6],GaragenInfo[mf][giFahrzeug][7],GaragenInfo[mf][giFahrzeug][8],GaragenInfo[mf][giFahrzeug][9],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock AnGarage(playerid)
{
	for(new ts = 1;ts<MAX_GARAGEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GaragenInfo[ts][giPos_X], GaragenInfo[ts][giPos_Y], GaragenInfo[ts][giPos_Z]))
		{
 	    	return 1;
		}
	}
	return 0;
}

stock GetNearGarageID(playerid)
{
	for(new ts = 1;ts<MAX_GARAGEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, GaragenInfo[ts][giPos_X], GaragenInfo[ts][giPos_Y], GaragenInfo[ts][giPos_Z]))return ts;
	}
	return -1;
}

stock GetGarageID(playerid)
{
	if(SpielerInfo[playerid][sGarage] != 0 || SpielerInfo[playerid][sGMieter] != 0)
	{
		if(SpielerInfo[playerid][sGarage] != 0)
		{
		    return SpielerInfo[playerid][sGarage];
		}
		else if(SpielerInfo[playerid][sGMieter] != 0)
		{
		    return SpielerInfo[playerid][sGMieter];
		}
	}
	return -1;
}

public LoadGaragen()
{
    new garageninfo;
	new hs = 1;
	new var[24], Text[224];
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `garagen` ORDER BY `ID` ASC");

	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "ID",var);	hs = strval(var);
		cache_get_value_name(i, "Besitzer",GaragenInfo[hs][giBesitzer]);
		cache_get_value_name(i, "Preis",var); GaragenInfo[hs][giPreis] = strval(var);
		cache_get_value_name(i, "Ort",var); GaragenInfo[hs][giOrt] = strval(var);
		cache_get_value_name(i, "Locked",var); GaragenInfo[hs][giLocked] = strval(var);
		cache_get_value_name(i, "Mietbar",var); GaragenInfo[hs][giMietbar] = strval(var);
		cache_get_value_name(i, "Miete",var); GaragenInfo[hs][giMiete] = strval(var);
		cache_get_value_name(i, "Pos_X",var); GaragenInfo[hs][giPos_X] = floatstr(var);
		cache_get_value_name(i, "Pos_Y",var); GaragenInfo[hs][giPos_Y] = floatstr(var);
		cache_get_value_name(i, "Pos_Z",var); GaragenInfo[hs][giPos_Z] = floatstr(var);
		cache_get_value_name(i, "OPos_X",var); GaragenInfo[hs][giOPos_X] = floatstr(var);
		cache_get_value_name(i, "OPos_Y",var); GaragenInfo[hs][giOPos_Y] = floatstr(var);
		cache_get_value_name(i, "OPos_Z",var); GaragenInfo[hs][giOPos_Z] = floatstr(var);
		cache_get_value_name(i, "OPos_A",var); GaragenInfo[hs][giOPos_A] = floatstr(var);
		cache_get_value_name(i, "Fahrzeug1",var); GaragenInfo[hs][giFahrzeug][0] = strval(var);
		cache_get_value_name(i, "Fahrzeug2",var); GaragenInfo[hs][giFahrzeug][1] = strval(var);
		cache_get_value_name(i, "Fahrzeug3",var); GaragenInfo[hs][giFahrzeug][2] = strval(var);
		cache_get_value_name(i, "Fahrzeug4",var); GaragenInfo[hs][giFahrzeug][3] = strval(var);
		cache_get_value_name(i, "Fahrzeug5",var); GaragenInfo[hs][giFahrzeug][4] = strval(var);
		cache_get_value_name(i, "Fahrzeug6",var); GaragenInfo[hs][giFahrzeug][5] = strval(var);
		cache_get_value_name(i, "Fahrzeug7",var); GaragenInfo[hs][giFahrzeug][6] = strval(var);
		cache_get_value_name(i, "Fahrzeug8",var); GaragenInfo[hs][giFahrzeug][7] = strval(var);
		cache_get_value_name(i, "Fahrzeug9",var); GaragenInfo[hs][giFahrzeug][8] = strval(var);
		cache_get_value_name(i, "Fahrzeug10",var); GaragenInfo[hs][giFahrzeug][9] = strval(var);
        if(strlen(GaragenInfo[hs][giBesitzer]) < 2)
		{
			format(Text, sizeof(Text), "Garage 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Garage zu kaufen", hs, GaragenInfo[hs][giPreis]);
   			GaragenInfo[hs][giPickup] = CreateDynamicPickup(1273, 23, GaragenInfo[hs][giPos_X], GaragenInfo[hs][giPos_Y], GaragenInfo[hs][giPos_Z], -1);
      	}
       	else
  		{
  		    if(GaragenInfo[hs][giMietbar] == 0)
  		    {
 				format(Text, sizeof(Text), "Garage 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s", hs, GaragenInfo[hs][giBesitzer]);
			}
			else
			{
				format(Text, sizeof(Text), "Garage 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s{FFFFFF}\nMiete:	{FF0000}%d${FFFFFF}\nBenutze '{FF0000}/mieten{FFFFFF}' um\ndich hier einzumieten", hs, GaragenInfo[hs][giBesitzer], GaragenInfo[hs][giMiete]);
			}
			GaragenInfo[hs][giPickup] = CreateDynamicPickup(1272, 23, GaragenInfo[hs][giPos_X], GaragenInfo[hs][giPos_Y], GaragenInfo[hs][giPos_Z], -1);
       	}
		GaragenInfo[hs][giText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, GaragenInfo[hs][giPos_X], GaragenInfo[hs][giPos_Y], GaragenInfo[hs][giPos_Z], 10.0);
		GaragenInfo[hs][giErstellt] = true;
		garageninfo++;
	}
	cache_delete(result);
	printf("Es wurden %d Garagen erfolgreich geladen und erstellt.",garageninfo);
}

stock GarageLocked(playerid)
{
	new ginfo[35], hs = SpielerInfo[playerid][sGarage];
	switch(GaragenInfo[hs][giLocked])
	{
	    case 0:{ginfo="{9ACD32}Aufgeschlossen";}
		case 1:{ginfo="{FF0000}Abgeschlossen";}
	}
	return ginfo;
}


stock GarageMietbar(playerid)
{
	new ginfo[35], hs = SpielerInfo[playerid][sGarage];
	switch(GaragenInfo[hs][giMietbar])
	{
	    case 0:{ginfo="{9ACD32}Nein";}
		case 1:{ginfo="{FF0000}Ja";}
	}
	return ginfo;
}

public SpawnCarInGarage(playerid)
{
	new vehicleid = GetPVarInt(playerid,"GarageVehicleID"), hs = GetPVarInt(playerid,"GaragenID"), parkid = GetPVarInt(playerid,"Parkplatz"), Float:Pos[4];
	Pos[0] = GetPVarFloat(playerid,"ParkPosX"); Pos[1] = GetPVarFloat(playerid,"ParkPosY"); Pos[2] = GetPVarFloat(playerid,"ParkPosZ"); Pos[3] = GetPVarFloat(playerid,"ParkPosA");
	DeletePVar(playerid,"GarageVehicleID"); DeletePVar(playerid,"GaragenID"); DeletePVar(playerid,"Parkplatz"); DeletePVar(playerid,"ParkPosX");
	DeletePVar(playerid,"ParkPosY"); DeletePVar(playerid,"ParkPosZ"); DeletePVar(playerid,"ParkPosA");
	SetVehicleVirtualWorld(vehicleid,hs);
	SetVehiclePos(vehicleid,Pos[0],Pos[1],Pos[2]);
	SetVehicleZAngle(vehicleid,Pos[3]);

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);
	Motor[vehicleid] = false;
	Licht[vehicleid] = false;
	DOOR[vehicleid] = true;
	Motorhaube[vehicleid] = false;
	Kofferraum[vehicleid] = false;
	CarRadio[vehicleid] = 0;
	format(CarRadioUrl[vehicleid], 128, "none");
	Radio[vehicleid] = false;
	//Warnblinker[vehicleid] = false;

	if(parkid == 1){GaragenInfo[hs][giFahrzeug][0] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 2){GaragenInfo[hs][giFahrzeug][1] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 3){GaragenInfo[hs][giFahrzeug][2] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 4){GaragenInfo[hs][giFahrzeug][3] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 5){GaragenInfo[hs][giFahrzeug][4] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 6){GaragenInfo[hs][giFahrzeug][5] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 7){GaragenInfo[hs][giFahrzeug][6] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 8){GaragenInfo[hs][giFahrzeug][7] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 9){GaragenInfo[hs][giFahrzeug][8] = FahrzeugInfo[vehicleid][fModelID];}
	else if(parkid == 10){GaragenInfo[hs][giFahrzeug][9] = FahrzeugInfo[vehicleid][fModelID];}
	FahrzeugInfo[vehicleid][fGarage] = hs;
	FahrzeugInfo[vehicleid][fGPark] = parkid;
	SendClientMessage(playerid,COLOR_SUPER,"Das Fahrzeug wurde erfolgreich in die Garage geparkt.");
	return 1;
}