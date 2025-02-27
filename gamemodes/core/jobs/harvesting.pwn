public HeuballenReinlegen(playerid)
{
    GetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, boot, objective);
	new ballenid = GetPVarInt(playerid,"HeuballenID");
	if(GetPVarInt(playerid,"HeuballenImWalton") == 0)
 	{
 		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
 	    SetPVarInt(playerid,"HeuballenImWalton",1);
 	    DeletePVar(playerid,"HatHeuballen");
 	    RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
 	    LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.26598, -1.49226, 0.17318,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 1)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
 	    SetPVarInt(playerid,"HeuballenImWalton",2);
 	    DeletePVar(playerid,"HatHeuballen");
 	    RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
 	    LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.24678, -1.93366, 0.17318,   0.00000, 0.00000, 0.0000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 2)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",3);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.21002, -2.37258, 0.17318,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 3)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",4);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), -0.72677, -1.88892, 0.17320,   0.00000, 0.00000, 90.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 4)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",5);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.74135, -1.88724, 0.57277,   0.00000, 0.00000, 90.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 5)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",6);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.27960, -1.89879, 0.57277,   0.00000, 0.00000, 90.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 6)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",7);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), -0.18153, -1.95572, 0.57277,   0.00000, 0.00000, 90.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 7)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",8);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), -0.64335, -2.03803, 0.57277,   0.00000, 0.00000, 90.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 8)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",9);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.00488, -1.54170, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 9)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",10);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.01010, -1.78495, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 10)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",11);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), -0.00862, -2.06432, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 11)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",12);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.02584, -2.44748, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 12)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",GetPVarInt(playerid,"HeuballenImWalton")+1);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.02584, -2.44748, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
 	    return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") > 12 && GetPVarInt(playerid,"HeuballenImWalton") < 23)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",GetPVarInt(playerid,"HeuballenImWalton")+1);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
        AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.02584, -2.44748, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
 	    return 1;
 	}
 	else if(GetPVarInt(playerid,"HeuballenImWalton") == 23)
 	{
		TogglePlayerControllable(playerid, true);
  		SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
 		SetVehicleParamsEx(GetPVarInt(playerid,"LandwirtAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        SetPVarInt(playerid,"HeuballenImWalton",GetPVarInt(playerid,"HeuballenImWalton")+1);
        DeletePVar(playerid,"HatHeuballen");
        RemovePlayerAttachedObject(playerid,ATTACH_INDEX_JOB);
        LandwirtObjekt[playerid][ballenid] = CreateDynamicObject(2901,0,0,-1000,0,0,0,-1,-1,-1,100,100);
        AttachDynamicObjectToVehicle(LandwirtObjekt[playerid][ballenid], GetPVarInt(playerid,"LandwirtAuto"), 0.02584, -2.44748, 0.93270,   0.00000, 0.00000, 0.00000);
		Streamer_Update(playerid);
		SetPlayerCheckpointEx(playerid,-23.2852,-274.7156,5.4197,3.5);
		SetPVarInt(playerid,"LandwirtStufe",4);
		SetPVarInt(playerid,"HeuballenAbgabe",1);
		SendClientMessage(playerid,COLOR_INFO,"Sehr gut, das waren alle Heuballen. Bringe die nun zum roten Marker.");
		return 1;
 	}
	return 1;
}

public HeuballenAbgabe(playerid)
{
	SetPVarInt(playerid,"LandwirtStufe",5);
	DeletePVar(playerid,"HeuballenAbgabe");
	TogglePlayerControllable(playerid, true);
	GameTextForPlayer(playerid,"~w~Bringe den ~r~Walton~w~ nun zum ~r~Abgabepunkt~w~.",3000,4);
	SetPlayerCheckpointEx(playerid,-105.4470,72.9262,3.1172,3.5);
	for(new ballen=0; ballen<sizeof(LandwirtInfo); ballen++)
 	{
		if(LandwirtInfo[ballen][lStufe] != 3)continue;
		if(LandwirtObjekt[playerid][ballen] <= 0)continue;
		DestroyDynamicObject(LandwirtObjekt[playerid][ballen]);
		LandwirtObjekt[playerid][ballen] = -1;
	}
	return 1;
}

stock AmHeuballen(playerid)
{
	new Float:Pos[3];
 	for(new ballen=0; ballen<sizeof(LandwirtInfo); ballen++)
 	{
		if(LandwirtInfo[ballen][lStufe] != 3)continue;
		if(LandwirtObjekt[playerid][ballen] <= 0)continue;
        GetDynamicObjectPos(LandwirtObjekt[playerid][ballen],Pos[0],Pos[1],Pos[2]);
 		if(IsPlayerInRangeOfPoint(playerid,2.5,Pos[0],Pos[1],Pos[2]))
 		{
 	    	return 1;
		}
	}
	return 0;
}

stock GetHeuballen(playerid)
{
    new Float:Pos[3];
 	for(new ballen=0; ballen<sizeof(LandwirtInfo); ballen++)
 	{
 	    if(LandwirtInfo[ballen][lStufe] != 3)continue;
 	    if(LandwirtObjekt[playerid][ballen] <= 0)continue;
 	    GetDynamicObjectPos(LandwirtObjekt[playerid][ballen],Pos[0],Pos[1],Pos[2]);
		if(IsPlayerInRangeOfPoint(playerid,2.5,Pos[0],Pos[1],Pos[2]))return ballen;
	}
	return -1;
}