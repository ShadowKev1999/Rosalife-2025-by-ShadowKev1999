public LoadJobInfos()
{
    new ts = 0, jobs = 0;
	new  var[24];

	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `jobinfos` ORDER BY `ID` ASC");

	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "ID",var); ts = strval(var);
		cache_get_value_name(i, "ID",var); JobInfo[ts][jiID] = strval(var);
		cache_get_value_name(i, "Gehalt",var); JobInfo[ts][jiGehalt] = strval(var);
		cache_get_value_name(i, "EXP",var); JobInfo[ts][jiEXP] = strval(var);
		jobs++;
	}
	cache_delete(result);
	printf(" Es wurden %d Jobinformationen erfolgreich geladen.",jobs);

	BusJob_Init();
}

stock DeleteJobFahrzeug(playerid)
{
	if(GetPVarInt(playerid,"PizzaAuto") != 0)
	{
		new vehicleid = GetPVarInt(playerid,"PizzaAuto");
		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem");
	    SetVehicleToRespawn(vehicleid);
		DestroyDynamicObject(PizzaSpieler[playerid][0]);
		DestroyDynamicObject(PizzaSpieler[playerid][1]);
		DestroyDynamicObject(PizzaSpieler[playerid][2]);
		DestroyDynamicObject(PizzaSpieler[playerid][3]);
		DestroyDynamicObject(PizzaSpieler[playerid][4]);
	    PizzaKundenPos[playerid][0] = 0;
	    PizzaKundenPos[playerid][1] = 0;
	    PizzaKundenPos[playerid][2] = 0;
	    PizzaKofferraumPos[playerid][0] = 0;
	    PizzaKofferraumPos[playerid][1] = 0;
	    PizzaKofferraumPos[playerid][2] = 0;
		PizzaAusgeliefert[playerid] = 0;
	    DeletePVar(playerid,"PizzaTragen");
	    DeletePVar(playerid,"PizzaGeholt");
	    DeletePVar(playerid,"PizzaAusliefern");
	    DeletePVar(playerid,"PizzaAuto");
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"KehrmaschinenAuftrag") != 0)
	{
		new vehicleid = GetPVarInt(playerid,"Kehrmaschine");
	    UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter");
	    SetVehicleToRespawn(vehicleid);
   	    DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"Kehrmaschine");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"KehrmaschinenAuftrag");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"KfahrerArbeitet");
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"PilotArbeitet") != 0)
	{
	    new vehicleid = GetPVarInt(playerid,"FlugID");
 		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}");
 		SetVehicleToRespawn(vehicleid);
   	    DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"FlugID");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"PilotArbeitet");
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"BusfahrerArbeitet") != 0)
	{
	    new vehicleid = GetPVarInt(playerid,"BusID");
		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}");
		SetVehicleToRespawn(vehicleid);
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"BusID");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"BusfahrerArbeitet");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"BusfahrerLinie");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"BusfahrerRoute");
		FahrzeugInfo[vehicleid][fJobFahrer] = 0;
		return 1;
	}
	else if(GetPVarInt(playerid,"MüllmannArbeitet") != 0)
	{
	    KillTimer(MuellmannTimer[playerid]);
  		new tmpcar = GetPVarInt(playerid,"MüllAuto");
	    UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, "Müllmann:\n{FE0000}Niemand{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter");
	    SetVehicleToRespawn(tmpcar);
	    FahrzeugInfo[tmpcar][fJobFahrer] = 0;
	    DeletePVar(playerid,"MüllBeutel");
	    DeletePVar(playerid,"MüllBeutelHand");
	    DeletePVar(playerid,"MüllmannArbeitet");
	    MuellHausPos[playerid][0] = 0;
	    MuellHausPos[playerid][1] = 0;
	    MuellHausPos[playerid][2] = 0;
	    MuellAutoPos[playerid][0] = 0;
	    MuellAutoPos[playerid][1] = 0;
	    MuellAutoPos[playerid][2] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"LandwirtArbeitet") != 0)
	{
	    KillTimer(LandwirtTimer[playerid]);

	    new vehid = GetPVarInt(playerid,"LandwirtAuto");
		if(GetPVarInt(playerid,"LandwirtStufe") == 2)
		{
		    DestroyVehicle(GetPVarInt(playerid,"TraktorTrailer"));
 	    	UpdateDynamic3DTextLabelText(FahrzeugInfo[vehid][fLabel], COLOR_WHITE, "Landwirt\n{FE0000}Niemand");
	    	SetVehicleToRespawn(vehid);
		}
		else if(GetPVarInt(playerid,"LandwirtStufe") == 3 || GetPVarInt(playerid,"LandwirtStufe") == 5)
		{
 	    	UpdateDynamic3DTextLabelText(FahrzeugInfo[vehid][fLabel], COLOR_WHITE, "Landwirt\n{FE0000}Niemand");
	    	SetVehicleToRespawn(vehid);
		}
		for(new ballen=0; ballen<sizeof(LandwirtInfo); ballen++)
 		{
			if(LandwirtObjekt[playerid][ballen] <= 0)continue;
			DestroyDynamicObject(LandwirtObjekt[playerid][ballen]);
			LandwirtObjekt[playerid][ballen] = -1;
		}
	    FahrzeugInfo[vehid][fJobFahrer] = 0;
	    WaltonKofferraumPos[playerid][0] = 0;
	    WaltonKofferraumPos[playerid][1] = 0;
	    WaltonKofferraumPos[playerid][2] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"GeldlieferantArbeitet") != 0)
	{
	    new vehicleid = GetPVarInt(playerid,"GeldtransporterID");
 		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}");
 		SetVehicleToRespawn(vehicleid);
   	    DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"GeldtransporterID");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"GeldlieferantArbeitet");
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"ElektrikerArbeitet") != 0)
	{
	    new vehicleid = GetPVarInt(playerid,"ElektrikerID");
 		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}");
 		SetVehicleToRespawn(vehicleid);
   	    DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"ElektrikerID");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"ElektrikerArbeitet");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"ElektrikerAbgabe");
		DeletePVar(FahrzeugInfo[vehicleid][fJobFahrer],"ElektrikerGehalt");
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    return 1;
	}
	else if(GetPVarInt(playerid,"LSFDutyCar") != 0)
	{
 		new vehicleid = GetPVarInt(playerid,"LSFDutyCar");
 		UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, "Jobfahrzeug von\n{FE0000}Niemandem{FFFFFF}");
 		SetVehicleToRespawn(vehicleid);
	    FahrzeugInfo[vehicleid][fJobFahrer] = 0;
	    if(FahrzeugInfo[vehicleid][fTruckMats] > 0)
	    {
	        if(GetVehicleModel(FahrzeugInfo[vehicleid][fTruckMats]) == 435 || GetVehicleModel(FahrzeugInfo[vehicleid][fTruckMats]) == 584)
	        {
	        	DeleteVehicle(FahrzeugInfo[vehicleid][fTruckMats]);
			}
	    }
	    FahrzeugInfo[vehicleid][fTruckMats] = 0;
	    DeletePVar(playerid,"LSFDutyCar");
	    return 1;
	}
	else if(GetPVarInt(playerid,"ZugFahrerVehicle") != INVALID_VEHICLE_ID)
	{
	    new vehicleid[4];
	    vehicleid[0] = SpielerInfo[playerid][sZugID][0];//Hauptzug
	    vehicleid[1] = SpielerInfo[playerid][sZugID][1];//Wagon 1
	    vehicleid[2] = SpielerInfo[playerid][sZugID][2];//Wagon 2
	    vehicleid[3] = SpielerInfo[playerid][sZugID][3];//Wagon 3

		//Löschen der Zugmaschine und der Trailer
        DestroyVehicle(SpielerInfo[playerid][sZugID][0]);
        DestroyVehicle(SpielerInfo[playerid][sZugID][1]);
        DestroyVehicle(SpielerInfo[playerid][sZugID][2]);
        DestroyVehicle(SpielerInfo[playerid][sZugID][3]);

        //Zurücksetzen der Trailer-Variablen und Löschung der Trailer-Objekte
        DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][0]);
		DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][1]);
		FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][0] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][1] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fJobFahrer] = 0;
	    SpielerInfo[playerid][sZugID][1] = 0;

	    DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][0]);
		DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][1]);
		FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][0] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][1] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fJobFahrer] = 0;
	    SpielerInfo[playerid][sZugID][2] = 0;

	    DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][0]);
		DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][1]);
		FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][0] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][1] = INVALID_OBJECT_ID;
	    FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fJobFahrer] = 0;
	    SpielerInfo[playerid][sZugID][3] = 0;
	    SpielerInfo[playerid][sZugID][0] = 0;
	    SetCameraBehindPlayer(playerid);
	    return 1;
	}
	return 1;
}

stock JobName(JobID)
{
	new jbname[22];
	switch(JobID)
	{
		case 0:{jbname="Arbeitslos";}
		case 1:{jbname="Trucker";}
		case 2:{jbname="Pizzabote";}
		case 3:{jbname="KM-Fahrer";}
		case 4:{jbname="Pilot";}
		case 5:{jbname="Busfahrer";}
		case 6:{jbname="Muellmann";}
		case 7:{jbname="Landwirt";}
		case 8:{jbname="D-";}
		case 9:{jbname="W-";}
		case 10:{jbname="Geldlieferant";}
		case 11:{jbname="Elektriker";}
		case 12:{jbname="Drogendealer";}
		case 13:{jbname="Waffendealer";}
		case 14:{jbname="Zugfahrer";}
		case 15:{jbname="Detektiv";}
		case 16:{jbname="Langstreckenfahrer";}
		case 17:{jbname="Fluglieferant";}
		case 18:{jbname="Hochseefischer";}
	}
	return jbname;
}

stock JobSkin(job)
{
	new ausgabe;
	switch(job)
	{
		case 0:{ausgabe=26;}//Zivilist
		case 1:{ausgabe=202;}
		case 2:{ausgabe=155;}
		case 3:{ausgabe=260;}
		case 4:{ausgabe=61;}
		case 5:{ausgabe=253;}
		case 6:{ausgabe=15;}
		case 7:{ausgabe=161;}
		case 8:{ausgabe=26;}
		case 9:{ausgabe=26;}
		case 10:{ausgabe=164;}
		case 11:{ausgabe=27;}
		case 14:{ausgabe=255;}
		case 16:{ausgabe=34;}
	}
	return ausgabe;
}

stock IsJobDuty(playerid)
{
    if(GetPVarInt(playerid,"TruckerDuty") == 0 && GetPVarInt(playerid,"PizzaboteDuty") == 0 &&
	GetPVarInt(playerid,"KehrmaschinenDuty") == 0 && GetPVarInt(playerid,"PilotDuty") == 0 &&
	GetPVarInt(playerid,"BusfahrerDuty") == 0 && GetPVarInt(playerid,"MüllmannDuty") == 0 &&
	GetPVarInt(playerid,"LandwirtDuty") == 0 && GetPVarInt(playerid,"GeldlieferantDuty") == 0 &&
	GetPVarInt(playerid,"ElektrikerDuty") == 0){return false;}
	else return true;
}

Job_OnPlayerDisconnect(playerid) {
	if(SpielerInfo[playerid][sJobCPActive]) {
		DeletePlayerJobCheckpoint(playerid);
	}
	return 1;
}

SetPlayerJobCheckpoint(playerid, Float:x, Float:y, Float:z, Float:size) {
	SpielerInfo[playerid][sJobCP][0] = x;
	SpielerInfo[playerid][sJobCP][1] = y;
	SpielerInfo[playerid][sJobCP][2] = z;
	SpielerInfo[playerid][sJobCPSize] = size;
	SpielerInfo[playerid][sJobCPActive] = true;
	SpielerInfo[playerid][sJobMarker] = CreateDynamicMapIcon(x, y, z, 53, 0, _, _, playerid, 8000.0, MAPICON_GLOBAL);
	SetPlayerCheckpointEx(playerid, x, y, z, size);
	return 1;
}

RestoreJobCheckpoint(playerid) {
	SetPlayerCheckpointEx(playerid, SpielerInfo[playerid][sJobCP][0], SpielerInfo[playerid][sJobCP][1], SpielerInfo[playerid][sJobCP][2], SpielerInfo[playerid][sJobCPSize]);
	return 1;
}

DeletePlayerJobCheckpoint(playerid) {
	if(!SpielerInfo[playerid][sJobCPActive]) return 0;
	SpielerInfo[playerid][sJobCPActive] = false;
	if(IsValidDynamicMapIcon(SpielerInfo[playerid][sJobMarker])) DestroyDynamicMapIcon(SpielerInfo[playerid][sJobMarker]);
	DisablePlayerCheckpoint(playerid);
	return 1;
}

Job_Streamer_OnItemStreamOut(type, forplayerid) {
	if(type == STREAMER_TYPE_CP) {
		if(SpielerInfo[forplayerid][sJobCPActive]) {
			RestoreJobCheckpoint(forplayerid);
		}
	}
	return 1;
}