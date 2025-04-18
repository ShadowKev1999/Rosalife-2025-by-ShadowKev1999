
CMD:lock(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keinem Fahrzeug.");
 	if(GetPlayerVehicleID(playerid) == WaffenTransporter)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Materialien-Transporter besitzt keine Schlösser!");
	if(DOOR[tmpcar] == true)
 	{
  		GetVehicleParamsEx(tmpcar,engine,lights,alarm,doors,bonnet,boot,objective);
    	if(Licht[tmpcar] == false)
	    {
	    	SetVehicleParamsEx(tmpcar,engine,false,alarm,doors,bonnet,boot,objective);
			SetTimerEx("LockLicht",1000,false,"i",tmpcar);
		}
		DOOR[tmpcar] = false;
		SetVehicleParamsEx(tmpcar,engine,lights,alarm,false,bonnet,boot,objective);
  		if(IsAHelikopter(tmpcar)){GameTextForPlayer(playerid,"~w~Helikopter~n~~g~aufgeschlossen",2000,6);}
    	else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~g~aufgeschlossen",2000,6);
		foreach(new i : Player)
		{
  			if(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
	    	{
      			PlayerTextDrawHide(i, Tacho[playerid][12]);
		    }
		}
  	}
   	else if(DOOR[tmpcar] == false)
    {
    	GetVehicleParamsEx(tmpcar,engine,lights,alarm,doors,bonnet,boot,objective);
	    if(Licht[tmpcar] == false)
	    {
	    	SetVehicleParamsEx(tmpcar,engine,true,alarm,doors,bonnet,boot,objective);
			SetTimerEx("LockLicht",1000,false,"i",tmpcar);
		}
		DOOR[tmpcar] = true;
		SetVehicleParamsEx(tmpcar,engine,lights,alarm,true,bonnet,boot,objective);
  		if(IsAHelikopter(tmpcar)){GameTextForPlayer(playerid,"~w~Helikopter~n~~r~abgeschlossen",2000,6);}
    	else GameTextForPlayer(playerid,"~w~Fahrzeug~n~~r~abgeschlossen",2000,6);
		foreach(new i : Player)
		{
  			if(GetPlayerVehicleID(i) == GetPlayerVehicleID(playerid))
	    	{
      			PlayerTextDrawShow(i, Tacho[playerid][12]);
		    }
		}
  	}
   	return 1;
}

CMD:fahrzeug(playerid, params[])
{
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
 	if(IsAFahrrad(GetPlayerVehicleID(playerid)))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrrad nicht möglich.");
  	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer des Fahrzeuges.");
   	new veh = GetPlayerVehicleID(playerid), string[264];
    format(string,sizeof(string),"{FFFFFF}Motor:		[%s{FFFFFF}]\nLicht:		[%s{FFFFFF}]\nTüren:		[%s{FFFFFF}]\nMotorhaube:	[%s{FFFFFF}]\nKofferraum:	[%s{FFFFFF}]\nRadio:		[%s{FFFFFF}]\nNeon:		[%s{FFFFFF}]",FahrzeugStatus(1,veh),FahrzeugStatus(2,veh),FahrzeugStatus(3,veh),FahrzeugStatus(4,veh),FahrzeugStatus(5,veh),FahrzeugStatus(6,veh),FahrzeugStatus(7,veh));
	ShowPlayerDialog(playerid,DIALOG_FAHRZEUG,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fahrzeugverwaltung",string,"Bestätigen","Abbrechen");
 	return 1;
}
CMD:carradio(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
 	if(IsAFahrrad(tmpcar))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrrad besitzt kein Radio.");
  	if(GetPlayerVehicleSeat(playerid) == 0 || GetPlayerVehicleSeat(playerid) == 1)
   	{
		OpenVehicleRadios(playerid);
 		return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Nur der Fahrer und der Beifahrer können das Radio bedienen.");
	return 1;
}
CMD:neonschalter(playerid, params[])
{
	new tmpcar = GetPlayerVehicleID(playerid);
 	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
  	if(IsAFahrrad(tmpcar))return 1;
   	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer des Fahrzeuges.");
	if(FahrzeugInfo[tmpcar][fFraktion] > 0 && FahrzeugInfo[tmpcar][fFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] > 0 && FahrzeugInfo[tmpcar][fGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fNebenjob] > 0 && FahrzeugInfo[tmpcar][fNebenjob] != SpielerInfo[playerid][sNebenjob])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fBesitzerID] > 0 && FahrzeugInfo[tmpcar][fBesitzerID] != playerid && SpielerInfo[playerid][sZweitKey] != FahrzeugInfo[tmpcar][fDatabaseID])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fSupmobil] != 0 && SpielerInfo[playerid][sAdmin] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fBankrob] != 0 && FahrzeugInfo[tmpcar][fBankrob] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(Neon[tmpcar] == true)
	{
 		PlayerTextDrawHide(playerid, Tacho[playerid][10]);
		PlayerTextDrawHide(playerid, Tacho[playerid][11]);
		if(FahrzeugInfo[tmpcar][fNeonStatus] == true)
		{
			FahrzeugInfo[tmpcar][fNeonColor] = FahrzeugInfo[tmpcar][fNeonColor];
			FahrzeugInfo[tmpcar][fNeonColor] = 0;

			DestroyDynamicObject(FahrzeugInfo[tmpcar][fNeonObj][0]);
	  		DestroyDynamicObject(FahrzeugInfo[tmpcar][fNeonObj][1]);
	    	FahrzeugInfo[tmpcar][fNeonObj][0] = INVALID_OBJECT_ID;
		    FahrzeugInfo[tmpcar][fNeonObj][1] = INVALID_OBJECT_ID;
		    FahrzeugInfo[tmpcar][fNeonStatus] = false;

			FahrzeugInfo[tmpcar][fNeonStatus] = true;
			FahrzeugInfo[tmpcar][fNeonObj][0] = CreateDynamicObject(FahrzeugInfo[tmpcar][fNeonColor],0,0,0,0,0,0);
			FahrzeugInfo[tmpcar][fNeonObj][1] = CreateDynamicObject(FahrzeugInfo[tmpcar][fNeonColor],0,0,0,0,0,0);
			AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fNeonObj][0], tmpcar, -0.8, 0.0, -0.60, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fNeonObj][1], tmpcar, 0.8, 0.0, -0.60, 0.0, 0.0, 0.0);
		}
  		else if(FahrzeugInfo[tmpcar][fNeonColor] != 0 && FahrzeugInfo[tmpcar][fNeonStatus] == false)
		{
			FahrzeugInfo[tmpcar][fNeonStatus] = true;
			FahrzeugInfo[tmpcar][fNeonObj][0] = CreateDynamicObject(FahrzeugInfo[tmpcar][fNeonColor],0,0,0,0,0,0);
			FahrzeugInfo[tmpcar][fNeonObj][1] = CreateDynamicObject(FahrzeugInfo[tmpcar][fNeonColor],0,0,0,0,0,0);
			AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fNeonObj][0], tmpcar, -0.8, 0.0, -0.60, 0.0, 0.0, 0.0);
			AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fNeonObj][1], tmpcar, 0.8, 0.0, -0.60, 0.0, 0.0, 0.0);
		}
	}
	return 1;
}
CMD:motor(playerid, params[])
{
	new string[128], tmpcar = GetPlayerVehicleID(playerid), Float:Health;
 	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
  	if(IsAFahrrad(tmpcar))return 1;
   	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer des Fahrzeuges.");
	if(FahrzeugInfo[tmpcar][fFraktion] > 0 && FahrzeugInfo[tmpcar][fFraktion] != SpielerInfo[playerid][sFraktion])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fFraktion] > 0 && FahrzeugInfo[tmpcar][fRang] > SpielerInfo[playerid][sRank])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt nicht den erforderlichen Rank.");
	if(FahrzeugInfo[tmpcar][fGruppe] > 0 && FahrzeugInfo[tmpcar][fGruppe] != SpielerInfo[playerid][sGruppe])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fGruppe] > 0 && FahrzeugInfo[tmpcar][fRang] > SpielerInfo[playerid][sGRank])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt nicht den erforderlichen Rank.");
	if(FahrzeugInfo[tmpcar][fNebenjob] > 0 && FahrzeugInfo[tmpcar][fNebenjob] != SpielerInfo[playerid][sNebenjob])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fBesitzerID] > 0 && FahrzeugInfo[tmpcar][fBesitzerID] != playerid && SpielerInfo[playerid][sZweitKey] != FahrzeugInfo[tmpcar][fDatabaseID])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fSupmobil] != 0 && SpielerInfo[playerid][sAdmin] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fBankrob] != 0 && FahrzeugInfo[tmpcar][fBankrob] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keine Schlüssel für dieses Fahrzeug.");
	if(FahrzeugInfo[tmpcar][fParkkralle] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug hat eine Parkkralle am Reifen.");
	if(FahrzeugInfo[tmpcar][fTank] <= 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug hat keinen Tank mehr.");
	if(FahrzeugInfo[tmpcar][fNebenjob] == 5 && GetPVarInt(playerid,"BusfahrerArbeitet") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Wähle zuerst eine Linie aus.");
	if(Motor[tmpcar] == true)
	{
 		PlayerTextDrawHide(playerid, Tacho[playerid][10]);
		PlayerTextDrawHide(playerid, Tacho[playerid][11]);
		if(Licht[tmpcar] == true)
		{
  			GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(tmpcar, false, false, alarm, doors, bonnet, boot, objective);
			GameTextForPlayer(playerid,"Motor ~r~ausgeschaltet",3000,6);
			Motor[tmpcar] = false;
			if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else{format(string,128,"%s stellt den Motor ab.",SpielerInfo[playerid][sName]);}
			SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 12.0, 3000);
			Licht[tmpcar] = false;
			return 1;
		}
  		else if(Licht[tmpcar] == false)
		{
			GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(tmpcar, false, lights, alarm, doors, bonnet, boot, objective);
			GameTextForPlayer(playerid,"Motor ~r~ausgeschaltet",3000,6);
			Motor[tmpcar] = false;
			if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"Unbekannter stellt den Motor ab.");}
			else{format(string,128,"%s stellt den Motor ab.",SpielerInfo[playerid][sName]);}
			SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 12.0, 3000);
			return 1;
   		}
	}
	else if(Motor[tmpcar] == false)
	{
		if(FahrzeugInfo[tmpcar][fImportCar] == 0 || FahrzeugInfo[tmpcar][fKurrierCar] == 0 && tmpcar != WaffenTransporter && tmpcar != BankRobVan)
  		{
    		GetVehicleHealth(tmpcar, Health);
		    if(Health <= 350)return GameTextForPlayer(playerid,"Motor ~r~zerstoert",3000,6);
		}
  		if(Licht[tmpcar] == true)
  		{
    		Licht[tmpcar] = true;
	    	GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(tmpcar, true, true, alarm, doors, bonnet, boot, objective);
   		}
	    else
	    {
	    	GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
			SetVehicleParamsEx(tmpcar, true, lights, alarm, doors, bonnet, boot, objective);
		}
		PlayerTextDrawShow(playerid, Tacho[playerid][10]);
		GameTextForPlayer(playerid,"Motor ~g~eingeschaltet",3000,6);
		Motor[tmpcar] = true;
		if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"Unbekannter betätigt die Zündung.");}
		else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"Unbekannter betätigt die Zündung.");}
		else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"Unbekannter betätigt die Zündung.");}
		else{format(string,128,"%s betätigt die Zündung.",SpielerInfo[playerid][sName]);}
		SetPlayerChatBubble(playerid, string, COLOR_PURPLE, 12.0, 3000);
		return 1;
	}
	return 1;
}
CMD:licht(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
   	//if(!IsPlayerInAnyVehicle(playerid) || GetVehicleModel(tmpcar) == 478)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
	new PLAYER_STATE:State=GetPlayerState(playerid);
	if(State!=PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
	if(Motor[tmpcar] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Um das Licht einschalten zu können, muss als erstes der Motor gestartet werden.");
	if(Licht[tmpcar] == true)
	{
 		PlayerTextDrawHide(playerid, Tacho[playerid][11]);
   		GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(tmpcar, engine, false, alarm, doors, bonnet, boot, objective);
		GameTextForPlayer(playerid,"Licht ~r~ausgeschaltet",3000,6);
		Licht[tmpcar] = false;
		return 1;
	}
	else if(Licht[tmpcar] == false)
	{
 		PlayerTextDrawShow(playerid, Tacho[playerid][11]);
   		GetVehicleParamsEx(tmpcar, engine, lights, alarm, doors, bonnet, boot, objective);
		SetVehicleParamsEx(tmpcar, engine, true, alarm, doors, bonnet, boot, objective);
		GameTextForPlayer(playerid,"Licht ~g~eingeschaltet",3000,6);
		Licht[tmpcar] = true;
		return 1;
	}
	return 1;
}
CMD:fenster(playerid, params[]) {
	new window[9],string[128],bool:w_driver,bool:w_passenger,bool:w_backleft,bool:w_backright,veh = GetPlayerVehicleID(playerid),Float:x,Float:y,Float:z, tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid) || GetVehicleModel(tmpcar) == 478)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Fahrzeug.");
	if(!IsACar(GetVehicleModel(veh))) return SendClientMessage(playerid, COLOR_RED, "[INFO] {FFFFFF}Du kannst das Fenster nur in Autos öffnen.");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return SendClientMessage(playerid, COLOR_RED, "[INFO] {FFFFFF}Du musst der Fahrer des Fahrzeuges sein!");
	if(sscanf(params,"s[9]",window)) return SendClientMessage(playerid, COLOR_BLUE, INFO_STRING"/Fenster [Alle | Vorne | VLinks | VRechts | Hinten | HLinks | HRechts]");
	GetVehicleParamsCarWindows(veh,w_driver,w_passenger,w_backleft,w_backright);
	GetPlayerPos(playerid, x, y, z);
	if(strfind(window, "Alle",true) != -1) {
	    if(w_driver == false || w_passenger == false ||w_backleft == false || w_backright == false) {
	        format(string,sizeof(string),"* %s hat alle Fenster vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,true,true,true,true);
	    }
	    format(string,sizeof(string),"* %s hat alle Fenster vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	    return SetVehicleParamsCarWindows(veh,false,false,false,false);
	}
	else if(strfind(window, "Vorne",true) != -1) {
		if(w_driver == false || w_passenger == false) {
	        format(string,sizeof(string),"* %s hat das Vordere Fenster vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,true,true,w_backleft,w_backright);
	    }
	    format(string,sizeof(string),"* %s hat das Vordere Fenster vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	    return SetVehicleParamsCarWindows(veh,false,false,w_backleft,w_backright);
	}
	else if(strfind(window, "VLinks",true) != -1) {
	    if(w_driver == false) {
	        format(string,sizeof(string),"* %s hat das Vordere Fenster Links vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,true,w_passenger,w_backleft,w_backright);
	    }
	    format(string,sizeof(string),"* %s hat das Vordere Fenster Links vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	    return SetVehicleParamsCarWindows(veh,false,w_passenger,w_backleft,w_backright);
	}
	else if(strfind(window, "VRechts",true) != -1) {
		if(w_passenger == false) {
	        format(string,sizeof(string),"* %s hat das Vordere Fenster Rechts vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,w_driver,true,w_backleft,w_backright);
	    }
	    format(string,sizeof(string),"* %s hat das Vordere Fenster Rechts vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	    return SetVehicleParamsCarWindows(veh,w_driver,false,w_backleft,w_backright);
	}
	else if(strfind(window, "Hinten",true) != -1) {
	    if(w_backleft == false || w_backright == false) {
	    	format(string,sizeof(string),"* %s hat das Hintere Fenster vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,w_driver,w_passenger,true,true);
	    }
	    format(string,sizeof(string),"* %s hat das Hintere Fenster vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	    return SetVehicleParamsCarWindows(veh,w_driver,w_passenger,false,false);
	}
	else if(strfind(window, "HLinks",true) != -1) {
	    if(w_backleft == false) {
	        format(string,sizeof(string),"* %s hat das Hintere Fenster Links vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,w_driver,w_passenger,true,w_backright);
	    }
	    format(string,sizeof(string),"* %s hat das Hintere Fenster Links vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
		SetVehicleParamsCarWindows(veh,w_driver,w_passenger,false,w_backright);
	}
	else if(strfind(window, "HRechts",true) != -1) {
	    if(w_backright == false) {
	        format(string,sizeof(string),"* %s hat das Hintere Fenster Rechts vom Fahrzeug geschlossen.",SpielerInfo[playerid][sName]);
	        SendRoundMessage(x, y, z, COLOR_PURPLE, string);
	        return SetVehicleParamsCarWindows(veh,w_driver,w_passenger,w_backleft,true);
	    }
	    format(string,sizeof(string),"* %s hat das Hintere Fenster Rechts vom Fahrzeug geöffnet.",SpielerInfo[playerid][sName]);
     	SendRoundMessage(x, y, z, COLOR_PURPLE, string);
		SetVehicleParamsCarWindows(veh,w_driver,w_passenger,w_backleft,false);
	}
	return 1;
}

CMD:sirenehupe(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 6)
	{
 		if(GetPVarInt(playerid,"SireneHupe") == 0)
   		{
     		SendClientMessage(playerid,COLOR_YELLOW,"Du schaltest die Sirene nun mit der Hupe an/aus.");
       		SetPVarInt(playerid,"SireneHupe",1);
	        return 1;
	    }
	    else if(GetPVarInt(playerid,"SireneHupe") == 1)
	    {
     		DeletePVar(playerid,"SireneHupe");
       		SendClientMessage(playerid,COLOR_YELLOW,"Du schaltest die Sirene wieder mit /sirene an und aus.");
	        return 1;
	    }
	}
	return NichtBerechtigt
}
CMD:usirene(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
		new PLAYER_STATE:State = GetPlayerState(playerid);
		if(State!=PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
		if(FahrzeugInfo[tmpcar][fSireneBool] == false)
		{
			if(GetVehicleModel(tmpcar) == 560)
			{
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(19288,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][2] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][3] = CreateDynamicObject(19292,0,0,0,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar,0 ,2.6,0,0,0,0);//Vorne Mitte
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar,0.7,2.6,0,0,0,0);//Vorne Licht Beifahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][2], tmpcar,-0.7,2.6,0,0,0,0);//Vorne Licht Fahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][3], tmpcar,0,0.9,0.4,0,0,0);//Mittig im Fenster
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			else if(GetVehicleModel(tmpcar) == 426)
			{
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][2] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar,0 ,2.6,0,0,0,0);//Vorne Mitte
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][2], tmpcar,0.7,2.6,0,0,0,0);//Vorne Licht Beifahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][3], tmpcar,-0.7,2.6,0,0,0,0);//Vorne Licht Fahrerseite
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			return 1;
		}
		else if(FahrzeugInfo[tmpcar][fSireneBool] == true)
		{
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][0]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][1]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][2]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][3]);
			FahrzeugInfo[tmpcar][fSirene][0] = -1;
			FahrzeugInfo[tmpcar][fSirene][1] = -1;
			FahrzeugInfo[tmpcar][fSirene][2] = -1;
			FahrzeugInfo[tmpcar][fSirene][3] = -1;
			FahrzeugInfo[tmpcar][fSireneBool] = false;
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Sirene abgeschraubt.");
			return 1;
		}
		return 1;
	}
	return 1;
}
CMD:sirene(playerid, params[])
{
    new tmpcar = GetPlayerVehicleID(playerid);
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 5 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
		new PLAYER_STATE:State = GetPlayerState(playerid);
		if(State!=PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
		if(FahrzeugInfo[tmpcar][fSireneBool] == false)
		{
			if(GetVehicleModel(tmpcar) == 560)
			{
   				if(SpielerInfo[playerid][sFraktion] == 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Sirene für dieses Fahrzeug.");
			    if(GetVehicleParamsSirenState(tmpcar) == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze die H - Taste um die Sirene einzuschalten!");
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(19288,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(19419,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][2] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][3] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][4] = CreateDynamicObject(19292,0,0,0,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar,0 ,2.6,0,0,0,0);//Vorne Mitte
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar,0.0,0.0,0.85,0,0,0);//Dach sirene
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][2], tmpcar,0.7,2.6,0,0,0,0);//Vorne Licht Beifahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][3], tmpcar,-0.7,2.6,0,0,0,0);//Vorne Licht Fahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][4], tmpcar,0,0.9,0.4,0,0,0);//Mittig im Fenster
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			else if(GetVehicleModel(tmpcar) == 426)
			{
   				if(SpielerInfo[playerid][sFraktion] == 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Sirene für dieses Fahrzeug.");
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(19419,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][2] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][3] = CreateDynamicObject(19288,0,0,0,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar,0 ,2.6,0,0,0,0);//Vorne Mitte
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar,0.0,0.0,0.85,0,0,0);//Dach sirene
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][2], tmpcar,0.7,2.6,0,0,0,0);//Vorne Licht Beifahrerseite
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][3], tmpcar,-0.7,2.6,0,0,0,0);//Vorne Licht Fahrerseite
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			else if(GetVehicleModel(tmpcar) == 552)
			{
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(18646,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(18646,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar, -0.750000,0.899999,1.350000,0.000000,0.000000,0.000000);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar, 0.749999,0.899999,1.350000,0.000000,0.000000,0.000000);
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			else if(GetVehicleModel(tmpcar) == 525)
			{
				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(18646,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				FahrzeugInfo[tmpcar][fSirene][1] = CreateDynamicObject(18646,0,0,-1000,0,0,0,-1,-1,-1,100,100);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar, 0.655000,-0.495000,1.435000,0.000000,0.000000,0.000000);
				AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][1], tmpcar, -0.469999,-0.495000,1.435000,0.000000,0.000000,0.000000);
				FahrzeugInfo[tmpcar][fSireneBool] = true;
				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
				return 1;
			}
			else if(GetVehicleModel(tmpcar) == 579)
			{
   				if(SpielerInfo[playerid][sFraktion] == 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Sirene für dieses Fahrzeug.");
			    FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(18646, 0.00700, -0.25640, 1.24680,   0.00000, 0.00000, 0.00000);
			    AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar, 0.00700, -0.25640, 1.24680, 0, 0, 0);
   				FahrzeugInfo[tmpcar][fSireneBool] = true;
			    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
			    return 1;
			}
			else if(GetVehicleModel(tmpcar) == 490)
			{
   				FahrzeugInfo[tmpcar][fSirene][0] = CreateDynamicObject(18646, -0.000000, 0.449999, 1.094999,   0.00000, 0.00000, 0.00000);
			    AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcar][fSirene][0], tmpcar, -0.000000, 0.449999, 1.094999, 0, 0, 0);
			    FahrzeugInfo[tmpcar][fSireneBool] = true;
   				SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du schraubst eine Sirene auf das Dach...");
			    return 1;
			}
			else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Auf dieses Flug-/Fahrzeug kann keine Sirene angebracht werden.");
			return 1;
		}
		else if(FahrzeugInfo[tmpcar][fSireneBool] == true)
		{
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][0]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][1]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][2]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][3]);
			DestroyDynamicObject(FahrzeugInfo[tmpcar][fSirene][4]);
			FahrzeugInfo[tmpcar][fSirene][0] = -1;
			FahrzeugInfo[tmpcar][fSirene][1] = -1;
			FahrzeugInfo[tmpcar][fSirene][2] = -1;
			FahrzeugInfo[tmpcar][fSirene][3] = -1;
			FahrzeugInfo[tmpcar][fSirene][4] = -1;
			FahrzeugInfo[tmpcar][fSireneBool] = false;
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Sirene abgeschraubt.");
			return 1;
		}
		return 1;
	}
	return NichtBerechtigt
}

CMD:givecarkey(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keinem Fahrzeug.");
	new tmpcar = GetPlayerVehicleID(playerid);
	if(FahrzeugInfo[tmpcar][fBesitzerID] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Fahrzeug gehört nicht dir.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givecarkey [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
 	if(SpielerInfo[pID][sZweitKey] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler hat bereits Zweitschlüssel für ein Fahrzeug.");
	SpielerInfo[pID][sZweitKey] = FahrzeugInfo[tmpcar][fDatabaseID];
	new string[128];
	format(string,sizeof(string),"[Info]: {FFFFFF}Du hast %s einen Zweitschlüssel zu deinem Fahrzeug gegeben.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,string);
	format(string,sizeof(string),"[Info]: {FFFFFF}%s hat dir einen Zweitschlüssel für sein Fahrzeug gegeben.",SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_SUPER,string);
	return 1;
}

CMD:takecarkey(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keinem Fahrzeug.");
	new tmpcar = GetPlayerVehicleID(playerid);
	if(FahrzeugInfo[tmpcar][fBesitzerID] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Fahrzeug gehört nicht dir.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/givecarkey [SpielerID]");
	if(!IsPlayerConnectedEx(playerid))return NichtOnline
	if(SpielerInfo[pID][sZweitKey] != FahrzeugInfo[tmpcar][fDatabaseID])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler hat keine Zweitschlüssel zu deinem Fahrzeug.");
	new string[128];
	format(string,sizeof(string),"[Info]: {FFFFFF}Du hast %s den Zweitschlüssel zu deinem Fahrzeug weggenommen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_RED,string);
	format(string,sizeof(string),"[Info]: {FFFFFF}%s hat dir den Zweitschlüssel für sein Fahrzeug weggenommen.",SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_RED,string);
	return 1;
}

CMD:throwcarkey(playerid,params[])
{
	if(SpielerInfo[playerid][sZweitKey] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Zweitschlüssel zur irgendeinem Fahrzeug.");
	SpielerInfo[playerid][sZweitKey] = 0;
	SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast die Zweitschlüssel weggeworfen.");
	return 1;
}

COMMAND:carlist(playerid, params[]) {
	showPlayerPrivateCarList(playerid);
	return 1;
}

COMMAND:vehupgrades(playerid, params[]) {
	if(!IsPlayerInRangeOfPoint(playerid, 10.0, 2130.0513,-1144.9211,24.3021)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du befindest dich nicht am Fahrzeugupgrade - Shop (/gps).");
	if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du musst dich in einem Fahrzeug befinden.");

	ShowPlayerDialog(playerid, DIALOG_CAR_UPGRADE_SHOP, DIALOG_STYLE_TABLIST_HEADERS, "{9933FF}RSL: {FFFFFF}Fahrzeugupgrades",
	"Upgrade\tKosten\n10x Fahrzeugrespawn\t2500$",
	"Auswählen", "Abbrechen");
	return 1;
}