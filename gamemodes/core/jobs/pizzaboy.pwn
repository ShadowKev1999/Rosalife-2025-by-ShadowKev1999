public PizzaRausnehmen(playerid)
{
    GetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, boot, objective);
	if(PizzaAusgeliefert[playerid] == 0)
	{
	    DestroyDynamicObject(PizzaSpieler[playerid][4]);
	    SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
     	Kofferraum[GetPVarInt(playerid,"PizzaAuto")] = false;
		SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
		TogglePlayerControllable(playerid, true);
	}
	else if(PizzaAusgeliefert[playerid] == 1)
	{
        DestroyDynamicObject(PizzaSpieler[playerid][3]);
        SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
        Kofferraum[GetPVarInt(playerid,"PizzaAuto")] = false;
        SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
		TogglePlayerControllable(playerid, true);
	}
	else if(PizzaAusgeliefert[playerid] == 2)
	{
        DestroyDynamicObject(PizzaSpieler[playerid][2]);
        SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
        Kofferraum[GetPVarInt(playerid,"PizzaAuto")] = false;
        SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
		TogglePlayerControllable(playerid, true);
	}
	else if(PizzaAusgeliefert[playerid] == 3)
	{
        DestroyDynamicObject(PizzaSpieler[playerid][1]);
        SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
        Kofferraum[GetPVarInt(playerid,"PizzaAuto")] = false;
        SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
		TogglePlayerControllable(playerid, true);
	}
	else if(PizzaAusgeliefert[playerid] == 4)
	{
        DestroyDynamicObject(PizzaSpieler[playerid][0]);
        SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
        Kofferraum[GetPVarInt(playerid,"PizzaAuto")] = false;
        SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public PizzaReinlegen(playerid)
{
	if(GetPVarInt(playerid,"PizzaTragen") == 5)
 	{
 	    SetPVarInt(playerid,"PizzaTragen",4);
 	    RemovePlayerAttachedObject(playerid,4);
 	    PizzaSpieler[playerid][0] = CreateDynamicObject(1582,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(PizzaSpieler[playerid][0], GetPVarInt(playerid,"PizzaAuto"), -0.524999,-1.875000,0.325000,0.000000,0.000000,0.000000);
		Streamer_Update(playerid);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 4)
 	{
 	    SetPVarInt(playerid,"PizzaTragen",3);
 	    RemovePlayerAttachedObject(playerid,3);
 	    PizzaSpieler[playerid][1] = CreateDynamicObject(1582,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(PizzaSpieler[playerid][1], GetPVarInt(playerid,"PizzaAuto"), 0.124999,-1.875000,0.325000,0.000000,0.000000,0.000000);
		Streamer_Update(playerid);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 3)
 	{
        SetPVarInt(playerid,"PizzaTragen",2);
        RemovePlayerAttachedObject(playerid,2);
        PizzaSpieler[playerid][2] = CreateDynamicObject(1582,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(PizzaSpieler[playerid][2], GetPVarInt(playerid,"PizzaAuto"), 0.609999,-1.875000,0.325000,0.000000,0.000000,0.000000);
		Streamer_Update(playerid);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 2)
 	{
        SetPVarInt(playerid,"PizzaTragen",1);
        RemovePlayerAttachedObject(playerid,1);
        PizzaSpieler[playerid][3] = CreateDynamicObject(1582,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(PizzaSpieler[playerid][3], GetPVarInt(playerid,"PizzaAuto"), -0.270000,-1.875000,0.394999,0.000000,0.000000,0.000000);
		Streamer_Update(playerid);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 1)
 	{
        SetPVarInt(playerid,"PizzaTragen",0);
        RemovePlayerAttachedObject(playerid,0);
        PizzaSpieler[playerid][4] = CreateDynamicObject(1582,0,0,-1000,0,0,0,-1,-1,-1,100,100);
		AttachDynamicObjectToVehicle(PizzaSpieler[playerid][4], GetPVarInt(playerid,"PizzaAuto"), 0.379999,-1.875000,0.394999,0.000000,0.000000,0.000000);
		Streamer_Update(playerid);
		GetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(GetPVarInt(playerid,"PizzaAuto"), engine, lights, alarm, doors, bonnet, false, objective);
        TogglePlayerControllable(playerid, true);
        SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
        KillTimer(PizzaReinlegenTimer[playerid]);
        SendClientMessage(playerid,COLOR_SUPER,"Steige jetzt in das Fahrzeug ein und benutze anschlieﬂend '/ausliefern'.");
        SendClientMessage(playerid,COLOR_INFO,"Hinweis: Sollte mal kein Checkpoint gesetzt werden, verwende dann anschlieﬂend erneut '/ausliefern'.");
 	}
	return 1;
}

public PizzaBekommen(playerid)
{
 	if(GetPVarInt(playerid,"PizzaTragen") == 0)
 	{
 	    SetPVarInt(playerid,"PizzaTragen",1);
 	    SetPlayerAttachedObject(playerid,0,1582,5,0.165000,0.112000,0.090999,96.500038,9.499996,-111.499992,1.000000,1.000000,1.000000);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 1)
 	{
 	    SetPVarInt(playerid,"PizzaTragen",2);
 	    SetPlayerAttachedObject(playerid,1,1582,6,0.144000,0.125000,-0.271000,64.000068,11.300006,95.000099,1.000000,1.000000,1.000000);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 2)
 	{
        SetPVarInt(playerid,"PizzaTragen",3);
        SetPlayerAttachedObject(playerid,2,1582,5,0.140000,0.242999,0.091000,-84.100090,171.000045,-111.600036,1.000000,1.000000,1.000000);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 3)
 	{
        SetPVarInt(playerid,"PizzaTragen",4);
        SetPlayerAttachedObject(playerid,3,1582,5,0.128000,0.304999,0.102000,-84.599952,170.100112,-111.000007,1.000000,1.000000,1.000000);
 	}
 	else if(GetPVarInt(playerid,"PizzaTragen") == 4)
 	{
        SetPVarInt(playerid,"PizzaTragen",5);
        TogglePlayerControllable(playerid, true);
        SetPlayerAttachedObject(playerid,4,1582,5,0.113999,0.361999,0.106000,95.900123,8.800045,69.599998,1.000000,1.000000,1.000000);
        KillTimer(PizzaBekommenTimer[playerid]);
        SendClientMessage(playerid,COLOR_SUPER,"Begebe dich jetzt zu einem Dienstfahrzeug und benutze hinten am Kofferraum '/reinlegen'.");
 	}
	return 1;
}