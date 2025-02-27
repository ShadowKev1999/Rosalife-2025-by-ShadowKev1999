stock CreateTuningGarage()
{
	new Float:Pos[3];
	for(new i=0;i<sizeof(TuningInfo);i++)
	{
        SetDynamicObjectMaterialText(
		CreateDynamicObject(12978,TuningInfo[i][tPos][0],TuningInfo[i][tPos][1],TuningInfo[i][tPos][2],0.0,0.0,TuningInfo[i][tPos][3])
		,0 , TuningInfo[i][tName], 90, "Comic Sans MS", 40, 1, 0xFF263739, 0xFFBDBEC6, 0);

		CreateDynamicObject(13027,TuningInfo[i][tPos][0],TuningInfo[i][tPos][1],TuningInfo[i][tPos][2]+2.83,0.0,0.0,TuningInfo[i][tPos][3]+180.0);
        Pos[0] = TuningInfo[i][tPos][0];
        Pos[1] = TuningInfo[i][tPos][1];
        Pos[2] = TuningInfo[i][tPos][2];
        GetPosInFront(TuningInfo[i][tPos][3], -7.89, Pos[0], Pos[1], Pos[2]);
		TuningInfo[i][tTor] = CreateDynamicObject(13028,Pos[0], Pos[1], Pos[2]+4.5,0.0,0.0,TuningInfo[i][tPos][3] + 90);

    	CreateDynamic3DTextLabel("{FFFFFF}\nBenutze '{FF0000}N{FFFFFF}' zum Tunen", 0x008080FF, Pos[0], Pos[1], TuningInfo[i][tPos][2], 10);
	}
}

stock MoveTuningOpen(TuningID,bool:open)
{
	new Float:Pos[3];
	if(open)//auf
	{
		Pos[0] = TuningInfo[TuningID][tPos][0];
		Pos[1] = TuningInfo[TuningID][tPos][1];
		Pos[2] = TuningInfo[TuningID][tPos][2];
		GetPosInFront(TuningInfo[TuningID][tPos][3], -7.89, Pos[0], Pos[1], Pos[2]);
	    MoveDynamicObject(TuningInfo[TuningID][tTor], Pos[0], Pos[1], Pos[2]+4.5,3.0,0.0,0.0,TuningInfo[TuningID][tPos][3]+90);
	}
	else//zu
	{
		Pos[0] = TuningInfo[TuningID][tPos][0];
		Pos[1] = TuningInfo[TuningID][tPos][1];
		Pos[2] = TuningInfo[TuningID][tPos][2];
        GetPosInFront(TuningInfo[TuningID][tPos][3], -7.89, Pos[0], Pos[1], Pos[2]);
	    MoveDynamicObject(TuningInfo[TuningID][tTor], Pos[0], Pos[1], Pos[2]+1.53,3.0,0.0,0.0,TuningInfo[TuningID][tPos][3]+90);
	}
}

stock Menu:CreateTuningMenu(TuningID)
{
	new string[128];
    TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Art");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "Preis");


	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Reparatur");AddMenuItem(TuningInfo[TuningID][tMenu], 1,"~>~");

	if(!isVehicleTuning(TuningInfo[TuningID][tVehicleID]))
	{
		TuningInfo[TuningID][tMenuID] = tkMenu;

    	SetTuningCamera(TuningID,6.0,-35.0,3.0);
		return TuningInfo[TuningID][tMenu];
	}
    AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Tuning Entfernen");AddMenuItem(TuningInfo[TuningID][tMenu], 1,"~>~");

	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tColorPreis][0]+TuningInfo[TuningID][tColorPreis][1]+TuningInfo[TuningID][tPaintjobPreis]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Lackierung");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	format(string,sizeof(string),MenuPreis"%d$",
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HOOD] +
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_ROOF] +
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SIDESKIRT] +
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_LAMPS] +
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_FRONT_BUMPER]+
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_REAR_BUMPER] +
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_RIGHT]+
	TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_LEFT]
	);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Karosserie");AddMenuItem(TuningInfo[TuningID][tMenu], 1,string);
	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_EXHAUST]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Auspuff");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SPOILER]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Spoiler");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_WHEELS]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Felgen");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HYDRAULICS]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Hydraulik");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_NITRO]);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Nitro");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);

	new gespreis = 0;
	for(new i=0;i<14;i++)
	{
	    gespreis += TuningInfo[TuningID][tTuningPreis][i];
	}
	gespreis += TuningInfo[TuningID][tColorPreis][0];
	gespreis += TuningInfo[TuningID][tColorPreis][1];
	gespreis += TuningInfo[TuningID][tPaintjobPreis];
    format(string,sizeof(string),MenuGesPreis"%d$",gespreis);
	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKasseButton);	AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);

	TuningInfo[TuningID][tMenuID] = tkMenu;

    SetTuningCamera(TuningID,6.0,-35.0,3.0);
	return TuningInfo[TuningID][tMenu];
}

stock SetTuningCamera(TuningID,Float:distance,Float:rotation=0.0,Float:high = 1.0)
{
	new Float:xPos[4];
	GetVehiclePos(TuningInfo[TuningID][tVehicleID],xPos[0],xPos[1],xPos[2]);
 	GetVehicleZAngle(TuningInfo[TuningID][tVehicleID],xPos[3]);
	SetPlayerCameraLookAt(TuningInfo[TuningID][tPlayerID],xPos[0],xPos[1],xPos[2]);
    GetPosInFront(xPos[3] + rotation ,distance ,xPos[0],xPos[1],xPos[2]);
	SetPlayerCameraPos(TuningInfo[TuningID][tPlayerID],xPos[0],xPos[1],xPos[2]+high);
	return 1;
}

stock OpenPlayerTuning(playerid)
{
	if(!IsPlayerInAnyVehicle(playerid))return 0;
	new vehicleid = GetPlayerVehicleID(playerid);

	new TuningID = GetFreeTuningID(playerid);
	if(TuningID == INVALID_TUNING_ID)return 0;

	SetVehiclePos(vehicleid,TuningInfo[TuningID][tPos][0],TuningInfo[TuningID][tPos][1],TuningInfo[TuningID][tPos][2]);
	SetVehicleZAngle(vehicleid,TuningInfo[TuningID][tPos][3]);

    TuningInfo[TuningID][tVehicleID] = vehicleid;
    TuningInfo[TuningID][tPlayerID] = playerid;
	for(new i=0;i<14;i++)
	{
	    TuningInfo[TuningID][tTuning][i] = FahrzeugInfo[vehicleid][fTuning][i];
	    TuningInfo[TuningID][tTuningPreis][i] = 0;
	}
	TuningInfo[TuningID][tColor][0] = FahrzeugInfo[vehicleid][fColor][0];
	TuningInfo[TuningID][tColorPreis][0] = 0;
	TuningInfo[TuningID][tColor][1] = FahrzeugInfo[vehicleid][fColor][1];
	TuningInfo[TuningID][tColorPreis][1] = 0;
	TuningInfo[TuningID][tPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];
	TuningInfo[TuningID][tPaintjobPreis] = 0;


	//________ Tor Kamera
	new Float:Pos[3];
	Pos[0] = TuningInfo[TuningID][tPos][0];
    Pos[1] = TuningInfo[TuningID][tPos][1];
    Pos[2] = TuningInfo[TuningID][tPos][2];
    GetPosInFront(TuningInfo[TuningID][tPos][3], -7.89, Pos[0], Pos[1], Pos[2]);
	SetPlayerCameraLookAt(TuningInfo[TuningID][tPlayerID],Pos[0],Pos[1],Pos[2]);
    GetPosInFront(TuningInfo[TuningID][tPos][3] - 30, -10.0, Pos[0], Pos[1], Pos[2]);
	SetPlayerCameraPos(TuningInfo[TuningID][tPlayerID],Pos[0],Pos[1],Pos[2] + 6);

    SetTimerEx("OpenPlayerTuningEx",2000,false,"d",TuningID);
    MoveTuningOpen(TuningID,false);

	TogglePlayerControllable(playerid, false);
	return 1;
}


forward OpenPlayerTuningEx(TuningID);
public OpenPlayerTuningEx(TuningID)
{
	ShowMenuForPlayer(CreateTuningMenu(TuningID), TuningInfo[TuningID][tPlayerID]);
	return 1;
}

stock OnPlayerTuningKey(playerid)
{
	new TuningID = GetPlayerTuningID(playerid);
	if(TuningID!= INVALID_TUNING_ID)
   	{
   	    new vehicleid = TuningInfo[TuningID][tVehicleID];
   	    if(TuningInfo[TuningID][tMenuID] == tkMenu)
   	    {
		   	for(new i=0;i<14;i++)
			{
		    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE:i));
		   		AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][i]);
			}
	    	ChangeVehiclePaintjob(vehicleid, FahrzeugInfo[vehicleid][fPaintjob]);
			ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1]);

			MoveTuningOpen(TuningID,true);
   	    	TogglePlayerControllable(playerid, true);
   	    	SetCameraBehindPlayer(playerid);
   	        HideMenuForPlayer(TuningInfo[TuningID][tMenu],playerid);
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
            TuningInfo[TuningID][tVehicleID] = INVALID_VEHICLE_ID;
			TuningInfo[TuningID][tPlayerID] = INVALID_PLAYER_ID;
			TuningInfo[TuningID][tMenuID] = INVALID_TUNINGMENU_ID;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch1)
   	    {
   	        TuningInfo[TuningID][tColorPreis][0] = 0;
			TuningInfo[TuningID][tColor][0] = FahrzeugInfo[vehicleid][fColor][0];
			ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0], TuningInfo[TuningID][tColor][1]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch2)
   	    {
   	        TuningInfo[TuningID][tColorPreis][1] = 0;
			TuningInfo[TuningID][tColor][1] = FahrzeugInfo[vehicleid][fColor][1];
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], FahrzeugInfo[vehicleid][fColor][1]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch3)
   	    {
   	        TuningInfo[TuningID][tPaintjobPreis] = 0;
			TuningInfo[TuningID][tPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];	TuningInfo[TuningID][tColor][0] = FahrzeugInfo[vehicleid][fColor][0];
	    	ChangeVehiclePaintjob(vehicleid, FahrzeugInfo[vehicleid][fPaintjob]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuAuspuff)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_EXHAUST));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_EXHAUST] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_EXHAUST];
            TuningInfo[TuningID][tTuningPreis][CARMODTYPE_EXHAUST] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_EXHAUST));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_EXHAUST]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuSpoiler)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SPOILER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_SPOILER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_SPOILER];
      		TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SPOILER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SPOILER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_SPOILER]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuWheels)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_WHEELS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_WHEELS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_WHEELS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_WHEELS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_WHEELS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_WHEELS]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuHydraulik)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HYDRAULICS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_HYDRAULICS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_HYDRAULICS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HYDRAULICS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HYDRAULICS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_HYDRAULICS]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuNitro)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_NITRO));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_NITRO] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_NITRO];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_NITRO] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_NITRO));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_NITRO]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossHood)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HOOD));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_HOOD] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_HOOD];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HOOD] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HOOD));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_HOOD]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRoof)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_ROOF));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_ROOF] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_ROOF];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_ROOF] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_ROOF));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_ROOF]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossSideskirt)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SIDESKIRT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_SIDESKIRT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_SIDESKIRT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SIDESKIRT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SIDESKIRT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_SIDESKIRT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLamps)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_LAMPS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_LAMPS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_LAMPS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_LAMPS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_LAMPS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_LAMPS]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossFBumper)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_FRONT_BUMPER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_FRONT_BUMPER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_FRONT_BUMPER];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_FRONT_BUMPER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_FRONT_BUMPER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_FRONT_BUMPER]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRBumper)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_REAR_BUMPER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_REAR_BUMPER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_REAR_BUMPER];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_REAR_BUMPER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_REAR_BUMPER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_REAR_BUMPER]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRVent)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_RIGHT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_RIGHT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_VENT_RIGHT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_RIGHT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_RIGHT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_VENT_RIGHT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLVent)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_LEFT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_LEFT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_VENT_LEFT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_LEFT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_LEFT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_VENT_LEFT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   		DestroyMenu(TuningInfo[TuningID][tMenu]);
		ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
    }

	return 1;
}

stock TuningEnterPress(playerid)
{
   	new TuningID = GetPlayerTuningID(playerid);
	if(TuningID!= INVALID_TUNING_ID)
   	{
   	    new vehicleid = TuningInfo[TuningID][tVehicleID];
   	    if(TuningInfo[TuningID][tMenuID] == tkMenu)
   	    {
		   	for(new i=0;i<14;i++)
			{
		    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE:i));
		   		AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][i]);
			}
	    	ChangeVehiclePaintjob(vehicleid, FahrzeugInfo[vehicleid][fPaintjob]);
			ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1]);


			MoveTuningOpen(TuningID,true);
   	    	TogglePlayerControllable(playerid, true);
   	    	SetCameraBehindPlayer(playerid);
   	        HideMenuForPlayer(TuningInfo[TuningID][tMenu],playerid);
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
            TuningInfo[TuningID][tVehicleID] = INVALID_VEHICLE_ID;
			TuningInfo[TuningID][tPlayerID] = INVALID_PLAYER_ID;
			TuningInfo[TuningID][tMenuID] = INVALID_TUNINGMENU_ID;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch1)
   	    {
   	        TuningInfo[TuningID][tColorPreis][0] = 0;
			TuningInfo[TuningID][tColor][0] = FahrzeugInfo[vehicleid][fColor][0];
			ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0], TuningInfo[TuningID][tColor][1]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch2)
   	    {
   	        TuningInfo[TuningID][tColorPreis][1] = 0;
			TuningInfo[TuningID][tColor][1] = FahrzeugInfo[vehicleid][fColor][1];
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], FahrzeugInfo[vehicleid][fColor][1]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch3)
   	    {
   	        TuningInfo[TuningID][tPaintjobPreis] = 0;
			TuningInfo[TuningID][tPaintjob] = FahrzeugInfo[vehicleid][fPaintjob];	TuningInfo[TuningID][tColor][0] = FahrzeugInfo[vehicleid][fColor][0];
	    	ChangeVehiclePaintjob(vehicleid, FahrzeugInfo[vehicleid][fPaintjob]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
   	    }
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuAuspuff)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_EXHAUST));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_EXHAUST] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_EXHAUST];
            TuningInfo[TuningID][tTuningPreis][CARMODTYPE_EXHAUST] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_EXHAUST));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_EXHAUST]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuSpoiler)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SPOILER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_SPOILER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_SPOILER];
      		TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SPOILER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SPOILER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_SPOILER]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuWheels)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_WHEELS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_WHEELS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_WHEELS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_WHEELS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_WHEELS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_WHEELS]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuHydraulik)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HYDRAULICS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_HYDRAULICS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_HYDRAULICS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HYDRAULICS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HYDRAULICS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_HYDRAULICS]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuNitro)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_NITRO));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_NITRO] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_NITRO];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_NITRO] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_NITRO));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_NITRO]);
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossHood)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HOOD));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_HOOD] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_HOOD];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HOOD] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_HOOD));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_HOOD]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRoof)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_ROOF));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_ROOF] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_ROOF];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_ROOF] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_ROOF));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_ROOF]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossSideskirt)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SIDESKIRT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_SIDESKIRT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_SIDESKIRT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SIDESKIRT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_SIDESKIRT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_SIDESKIRT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLamps)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_LAMPS));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_LAMPS] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_LAMPS];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_LAMPS] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_LAMPS));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_LAMPS]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossFBumper)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_FRONT_BUMPER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_FRONT_BUMPER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_FRONT_BUMPER];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_FRONT_BUMPER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_FRONT_BUMPER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_FRONT_BUMPER]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRBumper)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_REAR_BUMPER));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_REAR_BUMPER] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_REAR_BUMPER];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_REAR_BUMPER] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_REAR_BUMPER));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_REAR_BUMPER]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRVent)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_RIGHT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_RIGHT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_VENT_RIGHT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_RIGHT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_RIGHT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_VENT_RIGHT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   	    else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLVent)
   	    {
   	    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_LEFT));
   	    	TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_LEFT] = FahrzeugInfo[TuningID][fTuning][CARMODTYPE_VENT_LEFT];
   	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_LEFT] = 0;
		   	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE_VENT_LEFT));
		   	AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][CARMODTYPE_VENT_LEFT]);

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
   		DestroyMenu(TuningInfo[TuningID][tMenu]);
		ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
    }
	return 1;
}

stock TuningSelectedMenuRow(playerid,TuningID, row)
{
	new string[128];
    DestroyMenu(TuningInfo[TuningID][tMenu]);
    new vehicleid = TuningInfo[TuningID][tVehicleID];

	if(TuningInfo[TuningID][tMenuID] == tkMenu)
	{
	    switch(row)
	    {
	        case 0://Reparatur
	        {
	            TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX-100, TUNINGMENU_POSY, 210.0, 10.0);
	            SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Reparatur");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

				for(new i = 0;i<10;i++)
				{
				    TuningInfo[TuningID][tReparatur][i] = 0;
				}

				new Ges_Preis;

                new panels, tires, _doors, _lights, _bonnet, _boot;
				GetVehicleDamageStatus (vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				new driver_door, passenger_door /*, behind_driver_door, behind_passenger_door*/ = 0 ;
				driver_door = _doors >> 16 & 0x7;
				passenger_door = _doors >> 24 & 0x7;

 				_bonnet = _doors & 0x7;
				_boot = _doors >> 8 & 0x7;

				new windshield, front_bumper, rear_bumper;
				windshield = panels >> 16 & 0xF;
				front_bumper = panels >> 20 & 0xF;
				rear_bumper = panels >> 24 & 0xF;

				new tyre1, tyre2, tyre3, tyre4;
				tyre1 = tires >> 0 & 0x1;
				tyre2 = tires >> 1 & 0x1;
				tyre3 = tires >> 2 & 0x1;
				tyre4 = tires >> 3 & 0x1;

				new light1, light2, light3, light4;
				light1 = _lights >> 0 & 0x1;
				light2 = _lights >> 1 & 0x1;
				light3 = _lights >> 2 & 0x1;
				light4 = _lights >> 3 & 0x1;


				new Float:Heal;
				GetVehicleHealth (vehicleid, Heal);

				if(Heal<900)
				{
				    TuningInfo[TuningID][tReparatur][0]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_MOTOR);Ges_Preis=PREIS_MOTOR;
		       		AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Motor reparieren");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Fahrertür
				if(driver_door==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][1]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_FDOOR_E);Ges_Preis+=PREIS_FDOOR_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Fahrertuer ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(driver_door>=2)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][1]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_FDOOR_R);Ges_Preis+=PREIS_FDOOR_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Fahrertuer repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Beifahrertür
				if(passenger_door==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][2]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HDOOR_E);Ges_Preis+=PREIS_HDOOR_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Beifahrertuer ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(passenger_door>=2)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][2]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HDOOR_R);Ges_Preis+=PREIS_HDOOR_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Beifahrertuer repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Motorhaube
				if(_bonnet==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][3]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HAUBE_E);Ges_Preis+=PREIS_HAUBE_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Motorhaube ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(_bonnet>=2)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][3]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HAUBE_R);Ges_Preis+=PREIS_HAUBE_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Motorhaube repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Kofferraum
				if(_boot==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][4]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_KOFFER_E);Ges_Preis+=PREIS_KOFFER_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Kofferraum ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(_boot>=2)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][4]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_KOFFER_R);Ges_Preis+=PREIS_KOFFER_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Kofferraum repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Windschutzscheibe
				if(windshield!=0)
				{
				    TuningInfo[TuningID][tReparatur][5]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_FGLASS);Ges_Preis+=PREIS_FGLASS;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Windschutzscheibe ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Front Stoßstange
				if(front_bumper==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][6]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_FBUMPER_E);Ges_Preis+=PREIS_FBUMPER_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Stossstange vorne ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(front_bumper>=1)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][6]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_FBUMPER_R);Ges_Preis+=PREIS_FBUMPER_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Stossstange vorne repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}

				//Rear Stoßstange
				if(rear_bumper==4)//weg
				{
				    TuningInfo[TuningID][tReparatur][7]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HBUMPER_E);Ges_Preis+=PREIS_HBUMPER_E;
	                AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Stossstange hinten ersetzt");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(rear_bumper>=1)//kaputt
				{
				    TuningInfo[TuningID][tReparatur][7]=2;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_HBUMPER_R);Ges_Preis+=PREIS_HBUMPER_R;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Stossstange hinten repariert");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				//Räder
				new rad=0;
				if(tyre1==1)
				{
					rad++;
				}
				if(tyre2==1)
				{
					rad++;
				}
				if(tyre3==1)
				{
					rad++;
				}
				if(tyre4==1)
				{
					rad++;
				}
				new radstring[128];
				if(rad==1)
				{
			        TuningInfo[TuningID][tReparatur][8]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_WHEEL);Ges_Preis+=PREIS_WHEEL;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "1 Rad ersetzen");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(rad!=0)
				{
			      	TuningInfo[TuningID][tReparatur][8]=rad;
				    format(string,sizeof(string),MenuPreis"%d$",rad*PREIS_WHEEL);Ges_Preis+=rad*PREIS_WHEEL;
				    format(radstring,sizeof(radstring),"%d Raeder ersetzen",rad);
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, radstring);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				//lampen
				new light=0;
				if(light1==1)
				{
					light++;
				}
				if(light2==1)
				{
					light++;
				}
				if(light3==1)
				{
					light++;
				}
				if(light4==1)
				{
					light++;
				}
				if(light==1)
				{
			        TuningInfo[TuningID][tReparatur][9]=1;
				    format(string,sizeof(string),MenuPreis"%d$",PREIS_LAMP);Ges_Preis+=PREIS_LAMP;
					AddMenuItem(TuningInfo[TuningID][tMenu], 0, "1 Lampe ersetzen");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				}
				else if(light!=0)
				{
			      	TuningInfo[TuningID][tReparatur][9]=light;
				    format(string,sizeof(string),MenuPreis"%d$",light*PREIS_LAMP);Ges_Preis+=light*PREIS_LAMP;
				    format(radstring,sizeof(radstring),"%d Lampen ersetzen",light);
				}

				if(Ges_Preis == 0)
				{
   					DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
				}

				format(string,sizeof(string),MenuPreis"%d$",Ges_Preis);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Alles");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	            SetPVarInt(playerid,"Ges_Rep_Preis",Ges_Preis);

                TuningInfo[TuningID][tMenuID] = tkMenuRep;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-35.0,3.0);
				return 1;
	        }
	        case 1://Entfernen
	        {
	        	for(new i=0;i<14;i++)
				{
			    	RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE:i));
			    	TuningInfo[TuningID][tTuning][i] = 0;
			    	TuningInfo[TuningID][tTuningPreis][i] = 0;
				}
		    	ChangeVehiclePaintjob(vehicleid, 3);
				TuningInfo[TuningID][tPaintjob] = 3;
				TuningInfo[TuningID][tPaintjobPreis] = 0;

				SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Das entfernen des Tuning ist gratis. Drücke trotzdem auf 'Bezahlen'.");
				ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
				return 1;
	        }
	        case 2://Lackierungen
	        {
	            TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Lackierungen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tColorPreis][0]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Farbe1");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tColorPreis][1]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Farbe2");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tPaintjobPreis]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Vinyl");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				TuningInfo[TuningID][tMenuID] = tkMenuLack;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-35.0,3.0);
				return 1;
	        }
            case 3://Karosserie
            {
	            TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Karosserie");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
				format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_LAMPS]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Lampen");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HOOD]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Motorhaube");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_ROOF]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Dach");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SIDESKIRT]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "Seite");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_FRONT_BUMPER]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "V.Stossstange");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_REAR_BUMPER]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "H.Stosssstange");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_RIGHT]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "R.Abzug");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
	    		format(string,sizeof(string),MenuPreis"%d$",TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_LEFT]);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, "L.Abzug");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tMenuID] = tkMenuKaross;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-35.0,3.0);
				return 1;
            }
            case 4://Auspuff
            {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Auspuff");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_EXHAUST)
				    {
				        merker = true;
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, GetComponentName(component));AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_EXHAUST);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuAuspuff;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,-6.0,20.0,0.0);
				return 1;
            }
            case 5://Spoiler
            {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Spoiler");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_SPOILER)
				    {
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
                        merker = true;
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_SPOILER);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuSpoiler;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,-6.0,-20.0,2.0);
				return 1;
            }
            case 6://Felgen
            {
				if(!isAVehicle(TuningInfo[TuningID][tVehicleID]))
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Felgen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~y~");
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_WHEELS);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tItemWhl] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuWheels;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,4.0,-35.0,0.0);
				return 1;
            }
            case 7://Hydraulik
            {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Hydraulik");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_HYDRAULICS)
				    {
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!isAVehicle(TuningInfo[TuningID][tVehicleID]))
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_HYDRAULICS);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuHydraulik;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,40.0,3.0);
				return 1;
            }
            case 8://Nitro
            {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Nitro");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(!isAVehicle(TuningInfo[TuningID][tVehicleID]))
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
				format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO2);
		    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "2x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
    			format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO5);
		    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "5x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
    			format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO10);
		    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, "10x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);

				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuNitro;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,-6.0,-20.0,2.0);
				return 1;
            }
	        default:
	        {

				new gespreis = 0;
				for(new i=0;i<14;i++)
				{
					gespreis += TuningInfo[TuningID][tTuningPreis][i];
				}
				gespreis += TuningInfo[TuningID][tColorPreis][0];
				gespreis += TuningInfo[TuningID][tColorPreis][1];
				gespreis += TuningInfo[TuningID][tPaintjobPreis];

	            if(GetPlayerMoneyEx(playerid) < gespreis)
				{
					for(new i=0;i<14;i++)
					{
						RemoveVehicleComponent(vehicleid,GetVehicleComponentInSlot(vehicleid,CARMODTYPE:i));
						AddVehicleComponent(vehicleid, FahrzeugInfo[vehicleid][fTuning][i]);
					}
					ChangeVehiclePaintjob(vehicleid, FahrzeugInfo[vehicleid][fPaintjob]);
					ChangeVehicleColours(vehicleid, FahrzeugInfo[vehicleid][fColor][0],FahrzeugInfo[vehicleid][fColor][1]);


					MoveTuningOpen(TuningID,true);
					TogglePlayerControllable(playerid, true);
					SetCameraBehindPlayer(playerid);

					TuningInfo[TuningID][tVehicleID] = INVALID_VEHICLE_ID;
					TuningInfo[TuningID][tPlayerID] = INVALID_PLAYER_ID;
					TuningInfo[TuningID][tMenuID] = INVALID_TUNINGMENU_ID;
					return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				GivePlayerMoneyEx(playerid,-gespreis);
				new bool:tmerker = false;
				for(new i=0;i<14;i++)
				{
				    if(TuningInfo[TuningID][tTuning][i] > 0){tmerker = true;}
					FahrzeugInfo[vehicleid][fTuning][i] = TuningInfo[TuningID][tTuning][i];
				}
				if(tmerker == true)
				{
				    SendClientMessage(playerid,COLOR_RED,"[Info]: {FF0000}Tuner V.{FFFFFF} sagt: Vergesse nicht dein neues Tuning beim Ordnungsamt anzumelden!");
					FahrzeugInfo[vehicleid][fTuningGemeldet] = 0;
				}
	            FahrzeugInfo[vehicleid][fPaintjob] = TuningInfo[TuningID][tPaintjob];
                FahrzeugInfo[vehicleid][fColor][0] = TuningInfo[TuningID][tColor][0];
                FahrzeugInfo[vehicleid][fColor][1] = TuningInfo[TuningID][tColor][1];

				MoveTuningOpen(TuningID,true);
				TogglePlayerControllable(playerid, true);
				SetCameraBehindPlayer(playerid);

				TuningInfo[TuningID][tVehicleID] = INVALID_VEHICLE_ID;
				TuningInfo[TuningID][tPlayerID] = INVALID_PLAYER_ID;
				TuningInfo[TuningID][tMenuID] = INVALID_TUNINGMENU_ID;
				return 1;
	        }
	    }
	    return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuRep)
	{//#########################################################################################################################
		new panels, tires, _doors, _lights, _bonnet, _boot;
		GetVehicleDamageStatus (vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);

		new driver_door, passenger_door /*, behind_driver_door, behind_passenger_door*/ = 0 ;
		driver_door = _doors >> 16 & 0x7;
		passenger_door = _doors >> 24 & 0x7;

		_bonnet = _doors & 0x7;
		_boot = _doors >> 8 & 0x7;

		new windshield, front_bumper, rear_bumper;
		windshield = panels >> 16 & 0xF;
		front_bumper = panels >> 20 & 0xF;
		rear_bumper = panels >> 24 & 0xF;



		new mrow = 0;
        new repairid = -1;

    	for(new i=0;i<10;i++)
    	{
			if(TuningInfo[TuningID][tReparatur][i]>0)
			{
			   	if(mrow == row)
			   	{
					repairid = i;
			   	}
     			mrow++;

			}
    	}
		if(repairid == -1)
		{
			if(GetPlayerMoneyEx(playerid) < GetPVarInt(playerid,"Ges_Rep_Preis"))
			{
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
			}
			else
			{
				GivePlayerMoneyEx(playerid,-GetPVarInt(playerid,"Ges_Rep_Preis"));
				SetVehicleHealth(vehicleid,1000);
				DeletePVar(playerid,"Ges_Rep_Preis");
        		RepairVehicle(vehicleid);
			}
		}
		else if(repairid == 0)//Motor
		{
			if(GetPlayerMoneyEx(playerid) < PREIS_MOTOR)
			{
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
			}
			else
			{
				GivePlayerMoneyEx(playerid,-PREIS_MOTOR);
				SetVehicleHealth(vehicleid,1000);
			}
		}
		else if(repairid == 1)//FDOOR
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_FDOOR_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_FDOOR_R);
	   				_doors = encode_doors(_bonnet, _boot, 0, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_FDOOR_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_FDOOR_E);
	   				_doors = encode_doors(_bonnet, _boot, 0, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 2)//HDOOR
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HDOOR_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HDOOR_R);
	   				_doors = encode_doors(_bonnet, _boot, driver_door, 0);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HDOOR_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HDOOR_E);
	   				_doors = encode_doors(_bonnet, _boot, driver_door, 0);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 3)//HAUBE
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HAUBE_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HAUBE_R);
	   				_doors = encode_doors(0, _boot, driver_door, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HAUBE_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HAUBE_E);
	   				_doors = encode_doors(0, _boot, driver_door, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 4)//KOFFER
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_KOFFER_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_KOFFER_R);
	   				_doors = encode_doors(_bonnet, 0, driver_door, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_KOFFER_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_KOFFER_E);
	   				_doors = encode_doors(_bonnet, 0, driver_door, passenger_door);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 5)//FGLASS
		{
			if(GetPlayerMoneyEx(playerid) < PREIS_FGLASS)
			{
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
			}
			else
			{
				GivePlayerMoneyEx(playerid,-PREIS_FGLASS);
				panels = encode_panels(0, 0, 0, 0, 0, front_bumper, rear_bumper);
	   			TuningInfo[TuningID][tReparatur][repairid] = 0;
        		RepairVehicle(vehicleid);
	   			UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
			}
		}
		else if(repairid == 6)//FBUMPER
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_FBUMPER_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_FBUMPER_R);
					panels = encode_panels(0, 0, 0, 0, windshield, 0, rear_bumper);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_FBUMPER_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_FBUMPER_E);
					panels = encode_panels(0, 0, 0, 0, windshield, 0, rear_bumper);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 7)//HBUMPER
		{
            if(TuningInfo[TuningID][tReparatur][repairid] == 1)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HBUMPER_R)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HBUMPER_R);
					panels = encode_panels(0, 0, 0, 0, windshield, front_bumper, 0);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
            else if(TuningInfo[TuningID][tReparatur][repairid] == 2)
            {
				if(GetPlayerMoneyEx(playerid) < PREIS_HBUMPER_E)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
				}
				else
				{
					GivePlayerMoneyEx(playerid,-PREIS_HBUMPER_E);
					panels = encode_panels(0, 0, 0, 0, windshield, front_bumper, 0);
	   				TuningInfo[TuningID][tReparatur][repairid] = 0;
        			RepairVehicle(vehicleid);
	   				UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
				}
            }
		}
		else if(repairid == 8)//WHEEL
		{
			if(GetPlayerMoneyEx(playerid) < (PREIS_WHEEL*TuningInfo[TuningID][tReparatur][repairid]))
			{
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
			}
			else
			{
				GivePlayerMoneyEx(playerid,-(PREIS_WHEEL*TuningInfo[TuningID][tReparatur][repairid]));
				tires = encode_tires(0, 0, 0, 0); // fix all tires
	   			TuningInfo[TuningID][tReparatur][repairid] = 0;
        		RepairVehicle(vehicleid);
	   			UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
			}
		}
		else if(repairid == 9)//LAMP
		{
			if(GetPlayerMoneyEx(playerid) < (PREIS_LAMP*TuningInfo[TuningID][tReparatur][repairid]))
			{
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
			}
			else
			{
				GivePlayerMoneyEx(playerid,-(PREIS_LAMP*TuningInfo[TuningID][tReparatur][repairid]));
				_lights = encode_lights(0, 0, 0, 0); // fix all _lights
	   			TuningInfo[TuningID][tReparatur][repairid] = 0;
       			RepairVehicle(vehicleid);
	   			UpdateVehicleDamageStatus(vehicleid, VEHICLE_PANEL_STATUS:panels, VEHICLE_DOOR_STATUS:_doors, VEHICLE_LIGHT_STATUS:_lights, VEHICLE_TYRE_STATUS:tires);
			}
		}

		TuningInfo[TuningID][tMenuID] = tkMenu;
		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX-100, TUNINGMENU_POSY, 210.0, 10.0);
		OnPlayerSelectedMenuRow(playerid, 0);
	//#ä################################################################################################################################
	    return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuLack)
	{
		switch(row)
	    {
	        case 0://Color1
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
	    		format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][0]);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Farbe1");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_COLOR1);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch1;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				return 1;
	        }
	        case 1://Color2
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
	    		format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][1]);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Farbe2");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_COLOR2);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch2;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				return 1;
	        }
	        case 2://Paintjob
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
	    		format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tPaintjob]);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Vinyl");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_PAINT);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch3;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				return 1;
	        }
	        case 3://Zurück
	        {
				DestroyMenu(TuningInfo[TuningID][tMenu]);
				ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
				return 1;
	        }
	    }
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch1)
	{
	    if(row == 2)
	    {
	        TuningInfo[TuningID][tColorPreis][0] = PREIS_COLOR1;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
	    }
    	TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Farbe1");
		if(row == TuningInfo[TuningID][tItemTo])
	    {
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tColor][0] ++;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][0]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
	    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], TuningInfo[TuningID][tColor][1]);
		}
		else
		{
			TuningInfo[TuningID][tItemTo] = 1;
			TuningInfo[TuningID][tColor][0] --;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][0]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], TuningInfo[TuningID][tColor][1]);
		}

	    format(string,sizeof(string),MenuPreis"%d$",PREIS_COLOR1);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch1;
		ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch2)
	{
	    if(row == 2)
	    {
	        TuningInfo[TuningID][tColorPreis][1] = PREIS_COLOR2;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
	    }
    	TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Farbe2");
	    format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][0]);
		if(row == TuningInfo[TuningID][tItemTo])
	    {
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tColor][1] ++;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][1]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
	    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], TuningInfo[TuningID][tColor][1]);
		}
		else
		{
			TuningInfo[TuningID][tItemTo] = 1;
			TuningInfo[TuningID][tColor][1] --;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][1]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			ChangeVehicleColours(vehicleid, TuningInfo[TuningID][tColor][0], TuningInfo[TuningID][tColor][1]);
		}
	    format(string,sizeof(string),MenuPreis"%d$",PREIS_COLOR2);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch2;
		ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuLackSwitch3)
	{
	    if(row == 2)
	    {
	        TuningInfo[TuningID][tPaintjobPreis] = PREIS_PAINT;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 2);
			return 1;
	    }
    	TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Vinyl");
	    format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tColor][0]);
		if(row == TuningInfo[TuningID][tItemTo])
	    {
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tPaintjob] ++;
			if(TuningInfo[TuningID][tPaintjob]>=3)TuningInfo[TuningID][tPaintjob]=0;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tPaintjob]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
	    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    	ChangeVehiclePaintjob(vehicleid, TuningInfo[TuningID][tPaintjob]);
		}
		else
		{
			TuningInfo[TuningID][tItemTo] = 1;
			TuningInfo[TuningID][tPaintjob] --;
			if(TuningInfo[TuningID][tPaintjob]<0)TuningInfo[TuningID][tPaintjob]=2;
	    	format(string,sizeof(string),"~y~%d",TuningInfo[TuningID][tPaintjob]);
	    	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    	ChangeVehiclePaintjob(vehicleid, TuningInfo[TuningID][tPaintjob]);
		}
	    format(string,sizeof(string),MenuPreis"%d$",PREIS_PAINT);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		TuningInfo[TuningID][tMenuID] = tkMenuLackSwitch3;
		ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKaross)
	{
		switch(row)
	    {
	        case 0://Lampe
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Lampen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_LAMPS)
				    {
				    	merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_LAMPS);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossLamps;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-5.0,1.0);
				return 1;
	        }
	        case 1://Motorhaube
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Motorhaube");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_HOOD)
				    {
				    	merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_HOOD);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossHood;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-10.0,3.0);
				return 1;
	        }
	        case 2://Dach
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Dach");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_ROOF)
				    {
				    	merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_ROOF);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossRoof;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-35.0,3.0);
				return 1;
	        }
	        case 3://Seite
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Seite");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_SIDESKIRT)
				    {
				    	merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_SIDESKIRT);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossSideskirt;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,5.0,-45.0,0.0);
				return 1;
	        }
	        case 4://V.Stossstange
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "V.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_FRONT_BUMPER)
				    {
				    	merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_FRONT_BUMPER);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossFBumper;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,-5.0,1.0);
				return 1;
	        }
	        case 5://H.Stossstange
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "H.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_REAR_BUMPER)
				    {
				        merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_REAR_BUMPER);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossRBumper;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,-6.0,-5.0,1.0);
				return 1;
	        }
	        case 6://R.Abzug
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "R.Abzug");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_VENT_RIGHT)
				    {
				        merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_VENT_RIGHT);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossRVent;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,5.0,3.0);
				return 1;
	        }
	        case 7://L.Abzug
	        {
	    		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "L.Abzug");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

                new component, count=1,bool:merker = false;
				while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
				{
				    if(GetVehicleComponentType(component) == CARMODTYPE_VENT_LEFT)
				    {
				        merker = true;
				        format(string,sizeof(string),"%s",GetComponentName(component));
						AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
					}
					count++;
				}
				if(!merker)
				{
		   			DestroyMenu(TuningInfo[TuningID][tMenu]);
					ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
					return 1;
	   			}
	    		format(string,sizeof(string),MenuPreis"%d$",PREIS_VENT_LEFT);
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tItemTo] = 0;
				TuningInfo[TuningID][tMenuID] = tkMenuKarossLVent;
				ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
				SetTuningCamera(TuningID,6.0,5.0,3.0);
				return 1;
	        }
	    }
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLamps)// tkMenuKarossLamps PREIS_LAMPS CARMODTYPE_LAMPS
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Lampen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_LAMPS)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_LAMPS] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_LAMPS);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossLamps;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_LAMPS] = PREIS_LAMPS;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossHood)// PREIS_HOOD CARMODTYPE_HOOD tkMenuKarossHood
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Motorhaube");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_HOOD)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_HOOD] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_HOOD);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossHood;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HOOD] = PREIS_HOOD;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRoof)// PREIS_ROOF CARMODTYPE_ROOF tkMenuKarossRoof
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Dach");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_ROOF)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_ROOF] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_ROOF);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossRoof;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_ROOF] = PREIS_ROOF;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossSideskirt)//CARMODTYPE_SIDESKIRT PREIS_SIDESKIRT tkMenuKarossSideskirt
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Seite");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_SIDESKIRT)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_SIDESKIRT] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_SIDESKIRT);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossSideskirt;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SIDESKIRT] = PREIS_SIDESKIRT;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossFBumper)// CARMODTYPE_FRONT_BUMPER PREIS_FRONT_BUMPER tkMenuKarossFBumper
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "V.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_FRONT_BUMPER)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_FRONT_BUMPER] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_FRONT_BUMPER);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossFBumper;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_FRONT_BUMPER] = PREIS_FRONT_BUMPER;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRBumper)// CARMODTYPE_REAR_BUMPER PREIS_REAR_BUMPER tkMenuKarossFBumper
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "H.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_REAR_BUMPER)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_REAR_BUMPER] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_REAR_BUMPER);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossRBumper;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_REAR_BUMPER] = PREIS_REAR_BUMPER;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossRVent)//CARMODTYPE_VENT_RIGHT PREIS_VENT_RIGHT tkMenuKarossRVent
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "H.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_VENT_RIGHT)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_RIGHT] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_VENT_RIGHT);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossRVent;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_RIGHT] = PREIS_VENT_RIGHT;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuKarossLVent)//CARMODTYPE_VENT_LEFT PREIS_VENT_LEFT tkMenuKarossRVent
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "H.Stossstange");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_VENT_LEFT)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_VENT_LEFT] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_VENT_LEFT);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuKarossLVent;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_VENT_LEFT] = PREIS_VENT_LEFT;

			TuningInfo[TuningID][tMenuID] = tkMenu;
			OnPlayerSelectedMenuRow(playerid, 3);
			return 1;
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuAuspuff)
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Auspuff");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_EXHAUST)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_EXHAUST] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_EXHAUST);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuAuspuff;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_EXHAUST] = PREIS_EXHAUST;
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuSpoiler)
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Spoiler");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_SPOILER)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_SPOILER] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}
		if(merker == 0)
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_SPOILER);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuSpoiler;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_SPOILER] = PREIS_SPOILER;
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuWheels)
	{
	    if(row == 2)
	    {
	        TuningInfo[TuningID][tTuningPreis][CARMODTYPE_WHEELS] = PREIS_WHEELS;
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
	    }
    	TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);

		new component, count=1, merker;
		new componentf,componentex;
        new bool:isComp = false;
        if(row == TuningInfo[TuningID][tItemTo])
	    {
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tItemWhl]++;
			while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
			{
			    if(GetVehicleComponentType(component) == CARMODTYPE_WHEELS)
			    {
			        if(componentf == 0)componentf = component;
					if(merker == TuningInfo[TuningID][tItemWhl] && isComp == false)
					{
						isComp = true;
						componentex = component;
					}
					merker++;
			    }
				count++;
			}
			if(merker == 0)
			{
	   			DestroyMenu(TuningInfo[TuningID][tMenu]);
				ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
				return 1;
   			}
			if(isComp)
			{
		    	format(string,sizeof(string),"~y~%s",GetComponentName(componentex));
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Felgen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tTuning][CARMODTYPE_WHEELS] = componentex;
				AddVehicleComponent(vehicleid, componentex);
			}
			else
			{
		    	format(string,sizeof(string),"~y~%s",GetComponentName(componentf));
				SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Felgen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
				TuningInfo[TuningID][tTuning][CARMODTYPE_WHEELS] = componentf;
				AddVehicleComponent(vehicleid, componentf);
				TuningInfo[TuningID][tItemWhl] = 0;
			}

	    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

		}
		else
		{
			TuningInfo[TuningID][tItemTo] = 1;
			TuningInfo[TuningID][tItemWhl]--;
			while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
			{
			    if(GetVehicleComponentType(component) == CARMODTYPE_WHEELS)
			    {
			        if(TuningInfo[TuningID][tItemWhl] >= 0)
			        {
						if(merker == TuningInfo[TuningID][tItemWhl])
						{
							componentex = component;
						}
			        }
			        componentf = component;
					merker++;
			    }
				count++;
			}
			if(merker == 0)
			{
	   			DestroyMenu(TuningInfo[TuningID][tMenu]);
				ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
				return 1;
   			}
	        if(TuningInfo[TuningID][tItemWhl] < 0)
	        {
	            TuningInfo[TuningID][tItemWhl] = merker-1;
	            componentex = componentf;
	        }
		    format(string,sizeof(string),"~y~%s",GetComponentName(componentex));
			SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Felgen");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tTuning][CARMODTYPE_WHEELS] = componentex;
			AddVehicleComponent(vehicleid, componentex);

			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuBackButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
	    	AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuNextButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
		}


	    format(string,sizeof(string),MenuPreis"%d$",PREIS_WHEELS);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		TuningInfo[TuningID][tMenuID] = tkMenuWheels;
		ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuHydraulik)
	{
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Hydraulik");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");
        new component, count=1, merker;
        new bool:isComp = false;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_HYDRAULICS)
		    {
				format(string,sizeof(string),"%s",GetComponentName(component));
				AddMenuItem(TuningInfo[TuningID][tMenu], 0, string);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");

				if(merker == row)
				{
				    TuningInfo[TuningID][tTuning][CARMODTYPE_HYDRAULICS] = component;
				    AddVehicleComponent(vehicleid, component);
				    isComp = true;
				}
				merker++;
		    }
			count++;
		}

		if(!isAVehicle(TuningInfo[TuningID][tVehicleID]))
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}
		if(isComp)
		{
			format(string,sizeof(string),MenuPreis"%d$",PREIS_HYDRAULICS);
			AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
			TuningInfo[TuningID][tItemTo] = 0;
			TuningInfo[TuningID][tMenuID] = tkMenuHydraulik;
			ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		}
		else
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_HYDRAULICS] = PREIS_HYDRAULICS;
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
		}
		return 1;
	}
	else if(TuningInfo[TuningID][tMenuID] == tkMenuNitro)
	{
		if(row == 3)
		{
			TuningInfo[TuningID][tTuningPreis][CARMODTYPE_NITRO] = TuningInfo[TuningID][tItemTo];
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}
  		TuningInfo[TuningID][tMenu] = CreateMenu(TuningInfo[TuningID][tName], 2, TUNINGMENU_POSX, TUNINGMENU_POSY, 110.0, 10.0);
		SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 0, "Nitro");	SetMenuColumnHeader(TuningInfo[TuningID][tMenu], 1, "~r~");

		new component, count=1;
		while(GetVehicleCompatibleUpgrades(GetVehicleModel(TuningInfo[TuningID][tVehicleID]), count, component))
		{
		    if(GetVehicleComponentType(component) == CARMODTYPE_NITRO)
		    {

				if((row == 0) && (strfind(GetComponentName(component), "2x", true) != -1))
				{
					TuningInfo[TuningID][tItemTo] = PREIS_NITRO2;
				    TuningInfo[TuningID][tTuning][CARMODTYPE_NITRO] = component;
				    AddVehicleComponent(vehicleid, component);
				}
				if((row == 1) && (strfind(GetComponentName(component), "5x", true) != -1))
				{
					TuningInfo[TuningID][tItemTo] = PREIS_NITRO5;
				    TuningInfo[TuningID][tTuning][CARMODTYPE_NITRO] = component;
				    AddVehicleComponent(vehicleid, component);
				}
				if((row == 2) && (strfind(GetComponentName(component), "10x", true) != -1))
				{
					TuningInfo[TuningID][tItemTo] = PREIS_NITRO10;
				    TuningInfo[TuningID][tTuning][CARMODTYPE_NITRO] = component;
				    AddVehicleComponent(vehicleid, component);
				}
			}
			count++;
		}
		if(!isAVehicle(TuningInfo[TuningID][tVehicleID]))
		{
   			DestroyMenu(TuningInfo[TuningID][tMenu]);
			ShowMenuForPlayer(CreateTuningMenu(TuningID), playerid);
			return 1;
		}

		format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO2);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, "2x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO5);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, "5x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);
		format(string,sizeof(string),MenuPreis"%d$",PREIS_NITRO10);
		AddMenuItem(TuningInfo[TuningID][tMenu], 0, "10x");AddMenuItem(TuningInfo[TuningID][tMenu], 1, string);

		AddMenuItem(TuningInfo[TuningID][tMenu], 0, MenuKaufButton);AddMenuItem(TuningInfo[TuningID][tMenu], 1, "~r~");
		TuningInfo[TuningID][tMenuID] = tkMenuNitro;
		ShowMenuForPlayer(TuningInfo[TuningID][tMenu], playerid);
		return 1;
	}
	return 1;
}

stock GetPlayerTuningID(playerid)
{
	for(new i=0;i<sizeof(TuningInfo);i++)
	{
	    if(TuningInfo[i][tPlayerID] == playerid)
	    {
    		return i;
	    }
	}
	return INVALID_TUNING_ID;
}

stock GetFreeTuningID(playerid)
{
	for(new i=0;i<sizeof(TuningInfo);i++)
	{
	    if(TuningInfo[i][tPlayerID] == INVALID_PLAYER_ID)
	    {
	        if(IsPlayerInRangeOfPoint(playerid,5.0, TuningInfo[i][tPos][0],TuningInfo[i][tPos][1],TuningInfo[i][tPos][2]-2.0))
	        {
	        	return i;
	        }
	    }
	}
	return INVALID_TUNING_ID;
}

stock isVehicleTuning(vehicleid)
{
	if(vehicleid == INVALID_VEHICLE_ID){return false;}
	if(FahrzeugInfo[vehicleid][fNebenjob] != 0 || FahrzeugInfo[vehicleid][fAutohaus] != 0 || FahrzeugInfo[vehicleid][fZiviroller] != 0
	|| FahrzeugInfo[vehicleid][fFahrschule] != 0 || FahrzeugInfo[vehicleid][fImportCar] != 0 || FahrzeugInfo[vehicleid][fKurrierCar] != 0)
	{
	    return false;
	}
	return true;
}

stock isAVehicle(tmpcar)
{
	if((IsABoot(tmpcar))||(IsALKW(tmpcar))||(IsAFlugzeug(tmpcar))||(IsAHelikopter(tmpcar))||IsAFahrrad(tmpcar)||(IsAMotorrad(tmpcar)))
	{
	    return 0;
	}
	return 1;
}

encode_tires(tire1, tire2, tire3, tire4) return tire1 | (tire2 << 1) | (tire3 << 2) | (tire4 << 3);
encode_panels(flp, frp, rlp, rrp, windshield, front_bumper, rear_bumper)
{
    return flp | (frp << 4) | (rlp << 8) | (rrp << 12) | (windshield << 16) | (front_bumper << 20) | (rear_bumper << 24);
}
encode_doors(bonnet2, boot2, driver_door, passenger_door)
{
    return bonnet2 | (boot2 << 8) | (driver_door << 16) | (passenger_door << 24);
}
encode_lights(light1, light2, light3, light4)
{
    return light1 | (light2 << 1) | (light3 << 2) | (light4 << 3);
}

stock IsPlayerInInvalidNosVehicle(playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	#define MAX_INVALID_NOS_VEHICLES 52
	new InvalidNosVehicles[MAX_INVALID_NOS_VEHICLES] = {
	581,523,462,521,463,522,461,448,468,586,
	509,481,510,472,473,493,595,484,430,453,
	452,446,454,590,569,537,538,570,449,
	406 };

	if(IsPlayerInAnyVehicle(playerid))
	{
		for(new i = 0; i < MAX_INVALID_NOS_VEHICLES; i++)
		{
			if(GetVehicleModel(vehicleid) == InvalidNosVehicles[i]) return true;
		}
	}
	return false;
}

stock IsComponentidCompatible(modelid, componentid)
{
	if(componentid == 1025 || componentid == 1073 || componentid == 1074 || componentid == 1075 || componentid == 1076 ||
	componentid == 1077 || componentid == 1078 || componentid == 1079 || componentid == 1080 || componentid == 1081 ||
	componentid == 1082 || componentid == 1083 || componentid == 1084 || componentid == 1085 || componentid == 1096 ||
	componentid == 1097 || componentid == 1098 || componentid == 1087 || componentid == 1086)
	return true;

	switch (modelid)
	{
		case 400: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 401: return (componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 114 || componentid == 1020 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 402: return (componentid == 1009 || componentid == 1009 || componentid == 1010);
		case 404: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
		case 405: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1023 || componentid == 1000);
		case 409: return (componentid == 1009);
		case 410: return (componentid == 1019 || componentid == 1021 || componentid == 1020 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 411: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 412: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 415: return (componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 418: return (componentid == 1020 || componentid == 1021 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016);
		case 419: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 420: return (componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1003);
		case 421: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1016 || componentid == 1000);
		case 422: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007);
		case 426: return (componentid == 1005 || componentid == 1004 || componentid == 1021 || componentid == 1019 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003);
		case 429: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 436: return (componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1019 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 438: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 439: return (componentid == 1003 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1017 || componentid == 1007 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1013);
		case 442: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 445: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 451: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 458: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 466: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 467: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 474: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 475: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 477: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007);
		case 478: return (componentid == 1005 || componentid == 1004 || componentid == 1012 || componentid == 1020 || componentid == 1021 || componentid == 1022 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 479: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 480: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 489: return (componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1016 || componentid == 1000);
		case 491: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 492: return (componentid == 1005 || componentid == 1004 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1016 || componentid == 1000);
		case 496: return (componentid == 1006 || componentid == 1017 || componentid == 1007 || componentid == 1011 || componentid == 1019 || componentid == 1023 || componentid == 1001 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1003 || componentid == 1002 || componentid == 1142 || componentid == 1143 || componentid == 1020);
		case 500: return (componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1013 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 506: return (componentid == 1009);
		case 507: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 516: return (componentid == 1004 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1015 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
		case 517: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 518: return (componentid == 1005 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 526: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 527: return (componentid == 1021 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1014 || componentid == 1015 || componentid == 1017 || componentid == 1007);
		case 529: return (componentid == 1012 || componentid == 1011 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 533: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 534: return (componentid == 1126 || componentid == 1127 || componentid == 1179 || componentid == 1185 || componentid == 1100 || componentid == 1123 || componentid == 1125 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1180 || componentid == 1178 || componentid == 1101 || componentid == 1122 || componentid == 1124 || componentid == 1106);
		case 535: return (componentid == 1109 || componentid == 1110 || componentid == 1113 || componentid == 1114 || componentid == 1115 || componentid == 1116 || componentid == 1117 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1120 || componentid == 1118 || componentid == 1121 || componentid == 1119);
		case 536: return (componentid == 1104 || componentid == 1105 || componentid == 1182 || componentid == 1181 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1184 || componentid == 1183 || componentid == 1128 || componentid == 1103 || componentid == 1107 || componentid == 1108);
		case 540: return (componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
		case 541: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 542: return (componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1014 || componentid == 1015);
		case 545: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 546: return (componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
		case 547: return (componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1016 || componentid == 1003 || componentid == 1000);
		case 549: return (componentid == 1012 || componentid == 1011 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 550: return (componentid == 1005 || componentid == 1004 || componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003);
		case 551: return (componentid == 1005 || componentid == 1020 || componentid == 1021 || componentid == 1019 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1002 || componentid == 1023 || componentid == 1016 || componentid == 1003);
		case 555: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 558: return (componentid == 1092 || componentid == 1089 || componentid == 1166 || componentid == 1165 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1168 || componentid == 1167 || componentid == 1088 || componentid == 1091 || componentid == 1164 || componentid == 1163 || componentid == 1094 || componentid == 1090 || componentid == 1095 || componentid == 1093);
		case 559: return (componentid == 1065 || componentid == 1066 || componentid == 1160 || componentid == 1173 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1159 || componentid == 1161 || componentid == 1162 || componentid == 1158 || componentid == 1067 || componentid == 1068 || componentid == 1071 || componentid == 1069 || componentid == 1072 || componentid == 1070 || componentid == 1009);
		case 560: return (componentid == 1028 || componentid == 1029 || componentid == 1169 || componentid == 1170 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1141 || componentid == 1140 || componentid == 1032 || componentid == 1033 || componentid == 1138 || componentid == 1139 || componentid == 1027 || componentid == 1026 || componentid == 1030 || componentid == 1031);
		case 561: return (componentid == 1064 || componentid == 1059 || componentid == 1155 || componentid == 1157 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1154 || componentid == 1156 || componentid == 1055 || componentid == 1061 || componentid == 1058 || componentid == 1060 || componentid == 1062 || componentid == 1056 || componentid == 1063 || componentid == 1057);
		case 562: return (componentid == 1034 || componentid == 1037 || componentid == 1171 || componentid == 1172 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1149 || componentid == 1148 || componentid == 1038 || componentid == 1035 || componentid == 1147 || componentid == 1146 || componentid == 1040 || componentid == 1036 || componentid == 1041 || componentid == 1039);
		case 565: return (componentid == 1046 || componentid == 1045 || componentid == 1153 || componentid == 1152 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1150 || componentid == 1151 || componentid == 1054 || componentid == 1053 || componentid == 1049 || componentid == 1050 || componentid == 1051 || componentid == 1047 || componentid == 1052 || componentid == 1048);
		case 566: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 567: return (componentid == 1129 || componentid == 1132 || componentid == 1189 || componentid == 1188 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1187 || componentid == 1186 || componentid == 1130 || componentid == 1131 || componentid == 1102 || componentid == 1133);
		case 575: return (componentid == 1044 || componentid == 1043 || componentid == 1174 || componentid == 1175 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1176 || componentid == 1177 || componentid == 1099 || componentid == 1042);
		case 576: return (componentid == 1136 || componentid == 1135 || componentid == 1191 || componentid == 1190 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1192 || componentid == 1193 || componentid == 1137 || componentid == 1134);
		case 579: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 580: return (componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
		case 585: return (componentid == 1142 || componentid == 1143 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1003 || componentid == 1017 || componentid == 1007);
		case 587: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 589: return (componentid == 1005 || componentid == 1004 || componentid == 1144 || componentid == 1145 || componentid == 1020 || componentid == 1018 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1024 || componentid == 1013 || componentid == 1006 || componentid == 1016 || componentid == 1000 || componentid == 1017 || componentid == 1007);
		case 600: return (componentid == 1005 || componentid == 1004 || componentid == 1020 || componentid == 1022 || componentid == 1018 || componentid == 1013 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1017 || componentid == 1007);
		case 602: return (componentid == 1008 || componentid == 1009 || componentid == 1010);
		case 603: return (componentid == 1144 || componentid == 1145 || componentid == 1142 || componentid == 1143 || componentid == 1020 || componentid == 1019 || componentid == 1018 || componentid == 1024 || componentid == 1008 || componentid == 1009 || componentid == 1010 || componentid == 1006 || componentid == 1001 || componentid == 1023 || componentid == 1017 || componentid == 1007);
	}
	return false;
}