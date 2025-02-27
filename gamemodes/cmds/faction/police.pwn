
CMD:suspect(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			new pID, Anzahl, Grund[64], string2[255];
		    if(sscanf(params,"uis[64]",pID,Anzahl,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/su [SpielerID] [Anzahl] [Grund]");
			if(Anzahl<1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Anzahl darf nicht höher als 6 und nicht niedriger als 0 sein.");
			if(!IsPlayerConnectedEx(pID))return NichtOnline
			if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
		    SetPlayerWantedLevelEx(pID, GetPlayerWantedLevelEx(pID) +Anzahl);
			format(string2,128,"Officer %s hat dir %i Wanted(s) gegeben. Grund: %s",SpielerInfo[playerid][sName],Anzahl,Grund);
			SendClientMessage(pID,COLOR_RED,string2);
			format(string2,128,"Aktuelles Wantedlevel: %d",GetPlayerWantedLevelEx(pID));
			SendClientMessage(pID,COLOR_YELLOW,string2);
			format(string2,sizeof(string2),"[Fahndung]:{FFFFFF} Officer %s hat %s %i Wanted(s) gegeben. Grund: %s",SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Anzahl,Grund);
			SendCopMessage(COLOR_YELLOW,string2);
			if(GetPVarInt(pID,"MissionActive") == 2)
			{
			    if(GetPlayerWantedLevelEx(pID) >= 10)
			    {
			        DeletePVar(playerid,"MissionActive");
			        ShowAchievement(pID,"~g~Mission 2","Belohnung: ~n~~g~200 EXP!");
			        SendClientMessage(pID,COLOR_LIGHTGREEN,"[Mission]: Du hast die Mission abgeschlossen! +200 EXP!");
			        GivePlayerEXP(pID,200);
			        SpielerInfo[pID][sMissionSolved][2] = 1;
			    }
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:suspect("su")

CMD:clear(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			new pID, Anzahl, Grund[64], string2[144];
		    if(sscanf(params,"uis[64]",pID,Anzahl,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/clear [SpielerID] [Anzahl] [Grund]");
			if(Anzahl<1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Anzahl darf nicht niedriger als 1 sein.");
		    if(!IsPlayerConnectedEx(pID))return NichtOnline
			if((GetPlayerWantedLevelEx(pID) - Anzahl) < 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler hat nicht so viele Wanteds.");
			if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
			SetPlayerWantedLevelEx(pID, GetPlayerWantedLevelEx(pID) -Anzahl);
			format(string2,128,"Officer %s hat %i Wanted(s) aus deiner Akte entfernt. Grund: %s",SpielerInfo[playerid][sName],Anzahl,Grund);
			SendClientMessage(pID,COLOR_RED,string2);
			format(string2,128,"Aktuelles Wantedlevel: %d",GetPlayerWantedLevelEx(pID));
			SendClientMessage(pID,COLOR_YELLOW,string2);
			format(string2,128,"Officer %s hat %i Wanted(s) aus der Akte von %s entfernt. Grund: %s",SpielerInfo[playerid][sName],Anzahl,SpielerInfo[pID][sName],Grund);
			SendCopMessage(COLOR_BLUE,string2);
			return 1;
 		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:hs(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    new pID, string[144];
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/hs [SpielerID]");
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du kannst dies nicht tun solange du im Fahrzeug sitzt.");
		if(IsPlayerInAnyVehicle(pID))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du kannst dies nicht tun solange der angegebene Spieler im Fahrzeug sitzt.");
		if(GetDistanceBetweenPlayersEx(playerid, pID) >= 3)return NichtNahe
	    if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
		if(GetPVarInt(pID,"Handschellen") == 1)
		{
	        format(string,128,"Officer %s hat dir deine Handschellen abgenommen.",SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_YELLOW,string);
	        format(string,128,"Du hast dem %s seine Handschellen abgenommen.",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_SUPER,string);
			SetPlayerSpecialAction(pID, SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF);
			DeletePVar(pID,"Handschellen");
		}
		else if(GetPVarInt(playerid,"Handschellen") == 0)
		{
	        format(string,128,"Officer %s hat dir Handschellen angelegt.",SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_YELLOW,string);
	        format(string,128,"Du hast dem %s Handschellen angelegt.",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_SUPER,string);
			SetPlayerSpecialAction(pID, SPECIAL_ACTION_CUFFED);
			SetPlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF, 19418, 6, -0.011000, 0.028000, -0.022000, -15.600012, -33.699977, -81.700035, 0.891999, 1.000000, 1.168000);
			SetPVarInt(pID,"Handschellen",1);
			return 1;
		}
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:cuff(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur in Fahrzeugen fesseln.");
	    new pID, string[144];
	    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/cuff [SpielerID]");
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    if(GetPlayerVehicleID(pID) == GetPlayerVehicleID(playerid))
		{
			if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
			if(GetPVarInt(pID,"Gefesselt") == 1)
			{
			    TogglePlayerControllable(pID, true);
				DeletePVar(playerid,"Gefesselt");
				format(string,128,"Officer %s befreit den %s.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
				ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		        return 1;
			}
			TogglePlayerControllable(pID, false);
	        SetPVarInt(pID,"Gefesselt",1);
	        format(string,128,"Officer %s fesselt den %s.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
			ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	        return 1;
	    }
	    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler sitzt nicht in deinem Auto.");
	    return 1;
  	}
	else NichtBerechtigt
	return 1;
}

CMD:uncuff(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		new pID, string[144];
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/uncuff [SpielerID]");
		if(GetDistanceBetweenPlayersEx(playerid, pID) >= 12)return NichtNahe
		if(GetPVarInt(pID,"Gefesselt") != 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler wurde nicht gefesselt.");
		if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
		TogglePlayerControllable(pID, true);
		DeletePVar(playerid,"Gefesselt");
		format(string,128,"Officer %s befreit den %s.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
		ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:grab(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    new pID, SitzID, string[144];
	    if(sscanf(params,"ui",pID,SitzID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/grab [SpielerID] [SitzID - 1 = Links hinten | 2 = Rechts hinten");
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(GetDistanceBetweenPlayersEx(playerid, pID) >= 12)return NichtNahe
		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur in Fahrzeugen graben.");
		new PLAYER_STATE:State=GetPlayerState(playerid);
	 	if(State!=PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
	    if(IsPlayerInAnyVehicle(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler sitzt in einem Fahrzeug.");
	    new Float:armour;
		GetPlayerArmour(pID, armour);
		if(armour != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler darf kein Armour haben.");
		if(GetPVarInt(pID,"Getazert") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler muss erst getazert werden.");
	    if(SpielerInfo[pID][sFraktion] == 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler ist bei der Staatsgewalt.");
		format(string,128,"Officer %s zieht den %s in sein Fahrzeug und fesselt Ihn.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
		ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		if(SitzID==1){PutPlayerInVehicle(pID, GetPlayerVehicleID(playerid), 2);}
		else if(SitzID==2){PutPlayerInVehicle(pID, GetPlayerVehicleID(playerid), 3);}
		TogglePlayerControllable(pID, false);
	  	SetPVarInt(pID,"Gefesselt",1);
		return 1;
 	}
	else NichtBerechtigt
	return 1;
}

CMD:afkarrest(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
    {
        new pID;
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/afkarrest [SpielerID/Name]");
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(GetPlayerWantedLevelEx(pID) == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler ist kein Verbrecher.");
	    if(GetDistanceBetweenPlayersEx(playerid, pID) > 12)return NichtNahe
	    if(Afk[pID] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler ist nicht AFK gemeldet.");
	    new Zeit, string[128];
		Zeit = GetPlayerWantedLevelEx(pID)*1;
		new Gehalt = GetPlayerWantedLevelEx(pID)*250;
		SetPVarInt(pID,"NoPAYBACK",1);
		GivePlayerMoneyEx(pID,-Gehalt);
		FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Gehalt;
		GivePlayerEXP(playerid,10);

		SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}Willkommen im Knast. Alle illegalen Dinge wie Waffen, Drogen und Materialien wurden dir abgenommen.");
		SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}Du wurdest während du AFK warst in das Gefängnis gesteckt. Sei in Zukunft besser auf der Hut!");
		ResetPlayerWeapons(pID);

		SpielerInfo[pID][sZelle] = 1;
		format(string,128,"[Regierung]: {FFFFFF}%s %s hat den Verbrecher %s für %d Minuten eingesperrt (AFK-Arrest).",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Zeit);
		SendClientMessageToAll(COLOR_BLUE,string);
		SpielerInfo[pID][sKnast] = Zeit;
		SetPlayerWantedLevelEx(pID,0);
		SetPlayerSpecialAction(pID, SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF);
		DeletePVar(pID,"Handschellen");
		FrakInfo[2][fiFrakGVerbrecher]++;
		SpawnPlayerEx(pID);
		if(GetPVarInt(pID,"HatSichGestellt") > 0)
	    {
	    	DeletePVar(pID,"HatSichGestellt");
	    	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der Täter hat sich widerstandslos gestellt. Ein Nachlass der Knastzeit wäre vielleicht angebracht.");
		}

		if(GetPVarInt(playerid,"Bankrob") == 1)
		{
			format(string,164,"%s %s hat den gesuchten Bankräuber %s gefasst.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
			SendICPMsg(string);
            SpielerInfo[playerid][sZelle] = 1;
   			new Geld = GetPlayerWantedLevelEx(pID)*350;
   			SetPVarInt(playerid,"NoPAYBACK",1);
   			GivePlayerMoneyEx(playerid,-Geld);
   			GivePlayerEXP(playerid,50);
		    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Geld;
		    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakGVerbrecher]++;
		    Zeit = GetPlayerWantedLevelEx(pID)*1;
	        SpielerInfo[pID][sKnast] = Zeit;
	        SetPlayerWantedLevelEx(pID,0);
       		SetPlayerHealth(pID,100);

			PlayerTextDrawHide(pID, BankraubTD[playerid][0]);
			PlayerTextDrawHide(pID, BankraubTD[playerid][1]);
			PlayerTextDrawHide(pID, BankraubTD[playerid][2]);
			PlayerTextDrawHide(pID, BankraubTD[playerid][3]);
			PlayerTextDrawHide(pID, BankraubTD[playerid][4]);
			PlayerTextDrawHide(pID, BankraubTD[playerid][5]);
	    	BankRobAmLaufen = 0;
	    	DeleteVehicle(BankRobVan);
	    	BankRobVan = INVALID_VEHICLE_ID;
	    	BankRobGeldSackSpawned[1] = 0;
	    	KillTimer(PlayerBankRobTimer[pID]);
	    	SpawnPlayerEx(pID);
			for(new sackid=0; sackid<sizeof(GeldSack); sackid++)
 			{
 		    	DestroyDynamicObject(BankRobGeldSack[sackid]);
 		    	DestroyDynamic3DTextLabel(BankRobGeldSackLabel[sackid]);
 		    	BankRobGeldSackLabel[sackid] = Text3D:INVALID_3DTEXT_ID;
 			}
 			return 1;
		}
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:arrest(playerid,params[])
{
    new pID;
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
    {
		if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/arrest [SpielerID/Name]");
		if(!IsPlayerConnectedEx(pID))return NichtOnline
		if(GetPlayerWantedLevelEx(pID) == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Spieler ist kein Verbrecher.");
	    if(GetDistanceBetweenPlayersEx(playerid, pID) > 12)return NichtNahe
        if(IsPlayerInRangeOfPoint(playerid,10.0,349.7434,1805.8898,2241.5850))
		{
		    new Zeit, string[128];
			Zeit = GetPlayerWantedLevelEx(pID)*1;
			new Gehalt = GetPlayerWantedLevelEx(pID)*250;
			SetPVarInt(pID,"NoPAYBACK",1);
			GivePlayerMoneyEx(pID,-Gehalt);
			FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Gehalt;
			GivePlayerEXP(playerid,10);

			SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}Willkommen im Knast. Alle illegalen Dinge wie Waffen, Drogen und Materialien wurden dir abgenommen.");
			ResetPlayerWeapons(pID);

			SpielerInfo[pID][sZelle] = 1;
    		format(string,128,"[Regierung]: {FFFFFF}%s %s hat den Verbrecher %s für %d Minuten eingesperrt.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Zeit);
    		SendClientMessageToAll(COLOR_BLUE,string);
    		SpielerInfo[pID][sKnast] = Zeit;
    		SetPlayerWantedLevelEx(pID,0);
    		SetPlayerSpecialAction(pID, SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF);
			DeletePVar(pID,"Handschellen");
			FrakInfo[2][fiFrakGVerbrecher]++;
			SpawnPlayerEx(pID);
			if(GetPVarInt(pID,"HatSichGestellt") > 0)
		    {
		    	DeletePVar(pID,"HatSichGestellt");
		    	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der Täter hat sich widerstandslos gestellt. Ein Nachlass der Knastzeit wäre vielleicht angebracht.");
			}

			if(GetPVarInt(playerid,"Bankrob") == 1)
			{
				format(string,164,"%s %s hat den gesuchten Bankräuber %s gefasst.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
				SendICPMsg(string);
	            SpielerInfo[playerid][sZelle] = 1;
	   			new Geld = GetPlayerWantedLevelEx(pID)*350;
	   			SetPVarInt(playerid,"NoPAYBACK",1);
	   			GivePlayerMoneyEx(playerid,-Geld);
	   			GivePlayerEXP(playerid,50);
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Geld;
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakGVerbrecher]++;
			    Zeit = GetPlayerWantedLevelEx(pID)*1;
		        SpielerInfo[pID][sKnast] = Zeit;
		        SetPlayerWantedLevelEx(pID,0);
	       		SetPlayerHealth(pID,100);

				PlayerTextDrawHide(pID, BankraubTD[playerid][0]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][1]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][2]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][3]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][4]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][5]);
		    	BankRobAmLaufen = 0;
		    	DeleteVehicle(BankRobVan);
		    	BankRobVan = INVALID_VEHICLE_ID;
		    	BankRobGeldSackSpawned[1] = 0;
		    	KillTimer(PlayerBankRobTimer[pID]);
		    	SpawnPlayerEx(pID);
				for(new sackid=0; sackid<sizeof(GeldSack); sackid++)
	 			{
	 		    	DestroyDynamicObject(BankRobGeldSack[sackid]);
	 		    	DestroyDynamic3DTextLabel(BankRobGeldSackLabel[sackid]);
	 		    	BankRobGeldSackLabel[sackid] = Text3D:INVALID_3DTEXT_ID;
	 			}
	 			return 1;
			}
			return 1;
		}
		else if(IsPlayerInRangeOfPoint(playerid,10.0,221.7328,114.3382,999.0156))
    	{
    	    new Zeit, string[128];
			Zeit = GetPlayerWantedLevelEx(pID)*1;
			new Gehalt = GetPlayerWantedLevelEx(pID)*350;
			SetPVarInt(pID,"NoPAYBACK",1);
			GivePlayerMoneyEx(pID,-150);
			FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Gehalt;
			GivePlayerEXP(playerid,10);

			SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}Willkommen im Knast. Alle illegalen Dinge wie Waffen, Drogen und Materialien wurden dir abgenommen.");
			ResetPlayerWeapons(pID);

            SpielerInfo[pID][sZelle] = 2;
    		format(string,128,"[Regierung]: {FFFFFF}%s %s hat den Verbrecher %s für %d Minuten eingesperrt.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Zeit);
    		SendClientMessageToAll(COLOR_BLUE,string);
    		SpielerInfo[pID][sKnast] = Zeit;
    		SetPlayerWantedLevelEx(pID,0);
    		SetPlayerSpecialAction(pID, SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF);
			FrakInfo[2][fiFrakGVerbrecher]++;
			SpawnPlayerEx(pID);
			if(GetPVarInt(pID,"HatSichGestellt") > 0)
		    {
		    	DeletePVar(pID,"HatSichGestellt");
		    	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der Täter hat sich widerstandslos gestellt. Ein Nachlass der Knastzeit wäre vielleicht angebracht.");
			}

			if(GetPVarInt(playerid,"Bankrob") == 1)
			{
				format(string,164,"%s %s hat den gesuchten Bankräuber %s gefasst.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
				SendICPMsg(string);
	            SpielerInfo[playerid][sZelle] = 1;
	   			new Geld = GetPlayerWantedLevelEx(pID)*350;
	   			SetPVarInt(playerid,"NoPAYBACK",1);
	   			GivePlayerMoneyEx(playerid,-Geld);
	   			GivePlayerEXP(playerid,50);
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Geld;
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakGVerbrecher]++;
			    Zeit = GetPlayerWantedLevelEx(pID)*1;
		        SpielerInfo[pID][sKnast] = Zeit;
		        SetPlayerWantedLevelEx(pID,0);
	       		SetPlayerHealth(pID,100);

				PlayerTextDrawHide(pID, BankraubTD[playerid][0]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][1]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][2]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][3]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][4]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][5]);
		    	BankRobAmLaufen = 0;
		    	DeleteVehicle(BankRobVan);
		    	BankRobVan = INVALID_VEHICLE_ID;
		    	BankRobGeldSackSpawned[1] = 0;
		    	KillTimer(PlayerBankRobTimer[pID]);
		    	SpawnPlayerEx(pID);
				for(new sackid=0; sackid<sizeof(GeldSack); sackid++)
	 			{
	 		    	DestroyDynamicObject(BankRobGeldSack[sackid]);
	 		    	DestroyDynamic3DTextLabel(BankRobGeldSackLabel[sackid]);
	 		    	BankRobGeldSackLabel[sackid] = Text3D:INVALID_3DTEXT_ID;
	 			}
	 			return 1;
			}
			return 1;
	    }
		else if(IsPlayerInRangeOfPoint(playerid,7.0,195.1364,179.2897,1003.0234) || IsPlayerInRangeOfPoint(playerid,7.0,194.7606,157.9839,1003.0234))
		{
		    new Zeit, string[128];
			Zeit = GetPlayerWantedLevelEx(pID)*1;
			new Gehalt = GetPlayerWantedLevelEx(pID)*350;
			SetPVarInt(pID,"NoPAYBACK",1);
			GivePlayerMoneyEx(pID,-150);
			FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Gehalt;
			GivePlayerEXP(playerid,10);

			SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}Willkommen im Knast. Alle illegalen Dinge wie Waffen, Drogen und Materialien wurden dir abgenommen.");
			ResetPlayerWeapons(pID);

			SpielerInfo[pID][sZelle] = 3;
    		format(string,128,"[Regierung]: {FFFFFF}%s %s hat den Verbrecher %s für %d Minuten eingesperrt.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Zeit);
    		SendClientMessageToAll(COLOR_BLUE,string);
    		SpielerInfo[pID][sKnast] = Zeit;
    		SetPlayerWantedLevelEx(pID,0);
    		SetPlayerSpecialAction(pID, SPECIAL_ACTION_NONE);
			RemovePlayerAttachedObject(pID, ATTACH_INDEX_HANDCUFF);
			FrakInfo[2][fiFrakGVerbrecher]++;
			SpawnPlayerEx(pID);
			if(GetPVarInt(pID,"HatSichGestellt") > 0)
		    {
		    	DeletePVar(pID,"HatSichGestellt");
		    	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der Täter hat sich widerstandslos gestellt. Ein Nachlass der Knastzeit wäre vielleicht angebracht.");
			}

			if(GetPVarInt(pID,"Bankrob") == 1)
			{
				format(string,164,"%s %s hat den gesuchten Bankräuber %s gefasst.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
				SendICPMsg(string);
	            SpielerInfo[playerid][sZelle] = 1;
	   			new Geld = GetPlayerWantedLevelEx(pID)*350;
	   			SetPVarInt(playerid,"NoPAYBACK",1);
	   			GivePlayerMoneyEx(playerid,-Geld);
	   			GivePlayerEXP(playerid,50);
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] += Geld;
			    FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakGVerbrecher]++;
			    Zeit = GetPlayerWantedLevelEx(pID)*1;
		        SpielerInfo[pID][sKnast] = Zeit;
		        SetPlayerWantedLevelEx(pID,0);
	       		SetPlayerHealth(pID,100);

				PlayerTextDrawHide(pID, BankraubTD[playerid][0]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][1]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][2]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][3]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][4]);
				PlayerTextDrawHide(pID, BankraubTD[playerid][5]);
		    	BankRobAmLaufen = 0;
		    	DeleteVehicle(BankRobVan);
		    	BankRobVan = INVALID_VEHICLE_ID;
		    	BankRobGeldSackSpawned[1] = 0;
		    	KillTimer(PlayerBankRobTimer[pID]);
		    	SpawnPlayerEx(pID);
				for(new sackid=0; sackid<sizeof(GeldSack); sackid++)
	 			{
	 		    	DestroyDynamicObject(BankRobGeldSack[sackid]);
	 		    	DestroyDynamic3DTextLabel(BankRobGeldSackLabel[sackid]);
	 		    	BankRobGeldSackLabel[sackid] = Text3D:INVALID_3DTEXT_ID;
	 			}
	 			return 1;
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst hier niemanden einsperren.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:unarrest(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 2 && SpielerInfo[playerid][sFraktion] != 6)return NichtBerechtigt
    new pID, Zeit, string[144];
    if(sscanf(params,"ui",pID,Zeit))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /unarrest [SpielerID] [Zeit]");
    if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(GetDistanceBetweenPlayersEx(playerid, pID) > 5)return NichtNahe
    if(SpielerInfo[pID][sKnast] == 0)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Der angegebene Spieler ist nicht im Gefängnis.");
    if(Zeit < 1 && Zeit > SpielerInfo[playerid][sKnast])return SendClientMessage(playerid,COLOR_GREY,"[Info]: Die Zeit darf nicht kleiner als 1 sein.");
	format(string,128,"Officer %s hat %s %d Minuten Nachlass gegeben.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName],Zeit);
	SendCopMessage(COLOR_BLUE,string);
	format(string,128,"Officer %s hat dir %d Minuten Nachlass gegeben.",SpielerInfo[playerid][sName],Zeit);
	SendClientMessage(pID,COLOR_YELLOW,string);
	SpielerInfo[pID][sKnast] -= Zeit;
	TimeToKnast(pID);
	return 1;
}

CMD:showammu(playerid,params[])
{
    new id;
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
    {
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
		    if(sscanf(params,"d",id))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/showammu [ID]");
			if(AmmunationInfo[id][amErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Ammunation existiert nicht.");
			SetPlayerCheckpointEx(playerid,AmmunationInfo[id][amPos_X],AmmunationInfo[id][amPos_Y],AmmunationInfo[id][amPos_Z],2.5);
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Marker zum angegebenen Ammunation, wurde gesetzt.");
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du bist nicht im Dienst!");
		return 1;
	}
	else NichtBerechtigt
 	return 1;
}

CMD:showstore(playerid,params[])
{
    new id;
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
    {
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
		    if(sscanf(params,"d",id))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/showstore [ID]");
			if(StoreInfo[id][siErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses 24/7 existiert nicht.");
			SetPlayerCheckpointEx(playerid,StoreInfo[id][siPos_X],StoreInfo[id][siPos_Y],StoreInfo[id][siPos_Z],2.5);
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Marker zum angegebenen 24/7, wurde gesetzt.");
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du bist nicht im Dienst!");
		return 1;
	}
	else NichtBerechtigt
 	return 1;
}

CMD:unmask(playerid)
{
    if(SpielerInfo[playerid][sFraktion] != 2 && SpielerInfo[playerid][sFraktion] != 6 && SpielerInfo[playerid][sAdmin] < 1)return NichtBerechtigt
	if(GetPVarInt(playerid,"CopDuty") != 1 && GetPVarInt(playerid,"FBIDuty") != 1 && SpielerInfo[playerid][sAdmin] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	new Float:pX,  Float:pY,  Float:pZ, merker = 0;
	GetPlayerPos(playerid,pX,pY,pZ);
	foreach(new i : Player)
	{
	    if(!IsPlayerInRangeOfPoint(i,3.5,pX,pY,pZ))continue;
	    if(GetPVarInt(i,"FraktionsMaske") < 1 && GetPVarInt(i,"GruppenMaske") < 1)continue;
	    merker = i;
	    break;
	}
	if(merker < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es befindet sich kein maskierter Spieler in deiner Nähe.");
    new string[128];
    if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"Unbekannter zieht %s die Maske ab.",SpielerInfo[merker][sName]);}
	else {format(string,sizeof(string),"%s %s zieht %s die Maske ab.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[merker][sName]);}
	foreach(new i : Player){ShowPlayerNameTagForPlayer(i, merker, true);}
	DeletePVar(merker,"FraktionsMaske"); DeletePVar(merker,"GruppenMaske");
	return 1;
}

CMD:mautstationen(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
 	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
		    SendClientMessage(playerid,COLOR_WHITE," ");
		    SendClientMessage(playerid,COLOR_WHITE,"|__________ {FF0000}Mautstationen{FFFFFF} __________|");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 1: {FF0000}LS nach SF{FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 2: {FF0000}SF nach LS{FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 3: {FF0000}SF (Tunnel) nach LS (Tunnel){FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 4: {FF0000}LS (Tunnel) nach SF (Tunnel){FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 5: {FF0000}Blueberryfarm LS/LV nach LV/LS{FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 6: {FF0000}Brücke LV - LS{FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE,"	Mautstation 7: {FF0000}Brücke LS - LV{FFFFFF}");
		    SendClientMessage(playerid,COLOR_WHITE," ");
		}
 		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
 		return 1;
 	}
 	else NichtBerechtigt
 	return 1;
}
CMD:mautkontrolle(playerid,params[])
{
	new Auswahl;
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
 	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
		    if(sscanf(params,"d",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/mautkontrolle [MautID(1-7)]");
	        if(Auswahl < 1 || Auswahl > 7)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/mautkontrolle [MautID(1-7)]");
		    if(Auswahl == 1)//LS-SF
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,56.1354,-1525.3245,4.9989))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 1.");
				if(MautStatus[0] == false)
 				{
					MautStatus[0] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 1 geschlossen.");
 				}
 				else if(MautStatus[0] == true)
 				{
					MautStatus[0] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 1 geöffnet.");
 				}
 				return 1;
			}
			else if(Auswahl == 2)//SF-LS
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,49.5451,-1538.1730,5.1519))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 2.");
				if(MautStatus[1] == false)
 				{
					MautStatus[1] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 2 geschlossen.");
 				}
 				else if(MautStatus[1] == true)
 				{
					MautStatus[1] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 2 geöffnet.");
 				}
 				return 1;
			}
			else if(Auswahl == 3)//SFTunnel - LSTunnel
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,26.1980,-1338.1219,10.1589))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 3.");
				if(MautStatus[2] == false)
 				{
					MautStatus[2] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 3 geschlossen.");
 				}
 				else if(MautStatus[2] == true)
 				{
					MautStatus[2] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 3 geöffnet.");
 				}
 				return 1;
			}
			else if(Auswahl == 4)//LSTunnel - SFTunnel
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,-1.1519,-1323.5649,11.2628))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 4.");
				if(MautStatus[3] == false)
 				{
					MautStatus[3] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 4 geschlossen.");
 				}
 				else if(MautStatus[3] == true)
 				{
					MautStatus[3] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 4 geöffnet.");
 				}
 				return 1;
			}
			else if(Auswahl == 5)
			{
				if(IsPlayerInRangeOfPoint(playerid,3.5,523.5012,469.5414,18.9297) ||//LS - LV
				IsPlayerInRangeOfPoint(playerid,3.5,518.9169,475.9107,18.9297))//LV - LS
        		{
					if(MautStatus[4] == false)
	 				{
						MautStatus[4] = true;
						SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 5 geschlossen.");
	 				}
	 				else if(MautStatus[4] == true)
	 				{
						MautStatus[4] = false;
						SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 5 geöffnet.");
	 				}
	 				return 1;
				}
				else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 5.");
				return 1;
			}
			else if(Auswahl == 6)//LV-LS
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,1730.1222,520.3935,28.2204))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 6.");
				if(MautStatus[5] == false)
 				{
					MautStatus[5] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 6 geschlossen.");
 				}
 				else if(MautStatus[5] == true)
 				{
					MautStatus[5] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 6 geöffnet.");
 				}
 				return 1;
			}
			else if(Auswahl == 7)//LS-LV
			{
				if(!IsPlayerInRangeOfPoint(playerid,3.5,1743.9443,515.8735,28.2149))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der Mautstation 7.");
				if(MautStatus[6] == false)
 				{
					MautStatus[6] = true;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 7 geschlossen.");
 				}
 				else if(MautStatus[6] == true)
 				{
					MautStatus[6] = false;
					SendClientMessage(playerid,COLOR_SUPER,"Du hast die Mautstation 7 geöffnet.");
 				}
 				return 1;
			}
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:showmarke(playerid,params[])
{
	new pID, string[144];
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
 	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"CopUndercover") > 0)
		{
			if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/showmarke [SpielerID/Name]");
			if(!IsPlayerConnectedEx(playerid))return NichtOnline
			if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
			format(string,sizeof(string),"* %s %s zeigt %s seine Dienstmarke",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
			ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			format(string,sizeof(string),"|*** Dienstmarke von {FF0000}%s{FFFFFF} ***|",SpielerInfo[playerid][sName]);
			SendClientMessage(pID,COLOR_WHITE,string);
			if(GetPVarInt(playerid,"CopUndercover")){format(string,sizeof(string),"Name: {FF0000}%s (zurzeit Undercover)",SpielerInfo[playerid][sName]);}
			else format(string,sizeof(string),"Name: {FF0000}%s",SpielerInfo[playerid][sName]);
			SendClientMessage(pID,COLOR_WHITE,string);
			format(string,sizeof(string),"Fraktion: {FF0000}%s",FrakName(SpielerInfo[playerid][sFraktion]));
			SendClientMessage(pID,COLOR_WHITE,string);
			format(string,sizeof(string),"Rang: {FF0000}%s",RangName(playerid));
			SendClientMessage(pID,COLOR_WHITE,string);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
 	}
 	else NichtBerechtigt
 	return 1;
}

CMD:knastinfo(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Verbrecher    Verbleibende Zeit");
		for(new i = 0; i < MAX_PLAYERS; i++)
		{
			if(SpielerInfo[i][sKnast] > 0)
			{
    			new string[128];
				format(string, 128, "%s       |    %d Minute(n)",SpielerInfo[i][sName],SpielerInfo[i][sKnast]);
				SendClientMessage(playerid, COLOR_RED, string);
			}
		}
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:cop(playerid)
{
    if(!IsPlayerInRangeOfPoint(playerid,3.0,298.3004,1828.1854,2241.5850))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Duty Punkt.");
	if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6))
   	{
       return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
   	}
   	ShowPlayerDialog(playerid,DIALOG_COPSACHEN,DIALOG_STYLE_LIST,"{FFFFFF}Polizei Ausrüstung","Copman\nRankabzeichen\nPolizeimütze\nCopcap\nSonnenbrille\nCopcap(Frau)\nCopman(Frau)\nRank(Frau)\nPolizeischild\nCophut\nEntfernen","Wählen","Abbruch");
   	return 1;
}
CMD:copbrille(playerid)
{
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6))return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    if( IsPlayerAttachedObjectSlotUsed(playerid,7) )
	{
        RemovePlayerAttachedObject(playerid,7);
        SendClientMessage(playerid,COLOR_YELLOW,"Entfernt");
    }
    else
	{
        SetPlayerAttachedObject( playerid, 7, 19138, 2, 0.097560, 0.028507, 0.001079, 0.000000, 89.436622, 87.944313, 1.000000, 1.000000, 1.332124 ); // PoliceGlasses1 - brille
        SendClientMessage(playerid,COLOR_YELLOW,"Angesteckt");
    }
    return 1;
}

CMD:tcop(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6))
	{
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,1) ) {
        RemovePlayerAttachedObject(playerid,1);
        RemovePlayerAttachedObject(playerid,2);
        RemovePlayerAttachedObject(playerid,3);
        RemovePlayerAttachedObject(playerid,4);
        RemovePlayerAttachedObject(playerid,5);
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare entfernt");
    }
    else {
        SetPlayerAttachedObject( playerid, 1, 334, 1, -0.065741, 0.160072, 0.172787, 270.569549, 232.509368, 179.829772, 1.000000, 1.000000, 1.000000 ); // nitestick - temp schlagstock
        SetPlayerAttachedObject( playerid, 2, 365, 1, 0.063731, -0.160821, -0.047001, 0.000000, 66.562774, 356.750793, 1.131842, 1.000000, 1.000000 ); // spraycan - temp spray
        SetPlayerAttachedObject( playerid, 3, 348, 1, 0.121761, -0.053540, -0.227441, 265.897705, 17.023633, 180.622070, 1.000000, 1.000000, 1.000000 ); // desert_eagle - temp waffe
        SetPlayerAttachedObject( playerid, 4, 19418, 1, 0.027343, -0.141089, 0.049022, 0.000000, 285.274627, 0.000000, 1.000000, 1.000000, 1.000000 ); // handcuffs01 - temp handschellen
        SetPlayerAttachedObject( playerid, 5, 18642, 1, 0.038319, 0.181583, -0.080996, 350.396789, 291.574859, 186.331298, 1.133488, 1.000000, 0.707106 ); // Taser1 - temp tazer
        SetPlayerAttachedObject( playerid, 6, 19077, 2, 0.078594, -0.013809, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 ); // Hair3 - haare
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare genommen");
    }
    return 1;
}

CMD:copman(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    if( IsPlayerAttachedObjectSlotUsed(playerid,1) ) {
        RemovePlayerAttachedObject(playerid,1);
        RemovePlayerAttachedObject(playerid,2);
        RemovePlayerAttachedObject(playerid,3);
        RemovePlayerAttachedObject(playerid,4);
        RemovePlayerAttachedObject(playerid,5);
        RemovePlayerAttachedObject(playerid,8);
        RemovePlayerAttachedObject(playerid,9);
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare entfernt");
    }
    else {
        SetPlayerAttachedObject(playerid, 1, 19942, 1, -0.125000, 0.198000, -0.112999, 172.599914, 85.399932, 2.500000, 1.116999, 1.385999, 0.883999, 0, 0); //Funkgerät Mann
        SetPlayerAttachedObject(playerid, 2, 19773, 1, -0.143000, 0.026999, -0.177999, 84.899955, 90.099967, 93.599998, 1.423998, 1.141999, 0.988000, 0, 0); //Holster
        SetPlayerAttachedObject(playerid, 3, 334, 1, -0.157210, -0.015581, 0.224168, 79.199546, 276.988647, 171.322982, 0.899999, 1.500000, 0.899999 ); // Schlagstock
        SetPlayerAttachedObject(playerid, 4, 365, 1, -0.104437, -0.049196, 0.147933, 297.971160, 102.321350, 351.918975, 1.100000, 1.100000, 0.949999 ); // Spray Mann
        SetPlayerAttachedObject(playerid, 5, 19418, 1, -0.187242, -0.061019, -0.076611, 0.000000, 280.079772, 350.378234, 1.000000, 1.000000, 1.000000 ); //Handschellen Mann
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare genommen");
    }
    return 1;
}

CMD:copfrau(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    if( IsPlayerAttachedObjectSlotUsed(playerid,1) ) {
        RemovePlayerAttachedObject(playerid,1);
        RemovePlayerAttachedObject(playerid,2);
        RemovePlayerAttachedObject(playerid,3);
        RemovePlayerAttachedObject(playerid,4);
        RemovePlayerAttachedObject(playerid,5);
        RemovePlayerAttachedObject(playerid,8);
        RemovePlayerAttachedObject(playerid,9);
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare entfernt");
    }
    else {
        SetPlayerAttachedObject(playerid, 1, 19942, 1, -0.114000, 0.133999, -0.112999, 172.599914, 85.399932, 2.500000, 1.116999, 1.385999, 0.883999, 0, 0); //Funkgerät Frau
        SetPlayerAttachedObject(playerid, 2, 19773, 1, -0.143000, 0.032999, -0.177999, 84.899955, 90.099967, 93.599998, 1.423998, 1.141999, 0.928000, 0, 0); //Holster
        SetPlayerAttachedObject(playerid, 3, 334, 1, -0.157210, -0.025581, 0.219168, 79.199546, 276.988647, 171.322982, 0.899999, 1.500000, 0.899999 ); // Schlagstock
        SetPlayerAttachedObject(playerid, 4, 365, 1, -0.062999, -0.127000, 0.107999, 7.499993, 95.599967, 0.000000, 1.000000, 1.000000, 1.000000, 0, 0); //Spray Frau
        SetPlayerAttachedObject(playerid, 5, 19418, 1, -0.143005, -0.100765, -0.064808, 0.000000, 282.527740, 347.844085, 1.000000, 1.000000, 1.000000 ); // Handschellen Frau
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Inventare genommen");
    }
    return 1;
}
CMD:copcap(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,6) ) {
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizei-Cap abgenommen");
    }
    else {
        SetPlayerAttachedObject( playerid, 6, 19161, 2, 0.085200, 0.009999, 0.000000, 0.000000, 356.292083, 346.747100, 1.000000, 1.000000, 1.100000 ); // PoliceHat1 - polizeihut
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Cap aufgesetzt");
    }
    return 1;
}

CMD:cophut(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,6) ) {
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizei-Cap abgenommen");
    }
    else {
        SetPlayerAttachedObject(playerid, 6, 19099, 2, 0.168000, 0.002000, -0.001000, 0.000000, 0.699999, 5.800001, 0.962999, 1.166999, 1.235000, 0, 0 );
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Cap aufgesetzt");
    }
    return 1;
}

CMD:copmuetze(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,6) ) {
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizei-Cap abgenommen");
    }
    else {
        SetPlayerAttachedObject(playerid, 6, 19521, 2, 0.168000, 0.002000, -0.001000, 0.000000, 0.699999, 5.800001, 0.962999, 1.166999, 1.235000, 0, 0 );
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Cap aufgesetzt");
    }
    return 1;
}

CMD:copcapf(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,6) ) {
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizei-Cap abgenommen");
    }
    else {
        SetPlayerAttachedObject( playerid, 6, 19161, 2, 0.073311, -0.008209, 0.000000, 0.000000, 0.000000, 0.000000, 1.100000, 1.100000, 1.100000 ); // PoliceHat1 - polizeimütze woman
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Cap aufgesetzt");
    }
    return 1;
}

CMD:pcopcap(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,6) ) {
        RemovePlayerAttachedObject(playerid,6);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizei-Cap abgenommen");
    }
    else {
        SetPlayerAttachedObject( playerid, 6, 19161, 2, 0.085200, -0.014271, 0.000000, 0.000000, 356.292083, 346.747100, 1.000000, 1.000000, 1.100000 ); // PoliceHat1 - polizeigut vor puma
        SendClientMessage(playerid,COLOR_YELLOW,"Polizei-Cap aufgesetzt");
    }
    return 1;
}

CMD:pschild(playerid){
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)) {
        return SendClientMessage(playerid, COLOR_RED, "Du bist kein Polizist!");
    }
    /*
    if( GetPlayerSkin(playerid) != 280 ) {
        return SendClientMessage(playerid, COLOR_RED, "Du kannst diese Funktion nur mit dem Polizei Skin nutzen");
    }
    */
    if( IsPlayerAttachedObjectSlotUsed(playerid,9) ) {
        RemovePlayerAttachedObject(playerid,9);
        SendClientMessage(playerid,COLOR_ORANGE,"Polizeischild angesteckt");
    }
    else {
        SetPlayerAttachedObject(playerid,9, 18637, 4, 0.3, 0, 0, 0, 170, 270, 1, 1, 1);
        SendClientMessage(playerid,COLOR_YELLOW,"Polizeischild abgesteckt");
    }
    return 1;
}


CMD:rank(playerid)
{
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6))return SendClientMessage(playerid, COLOR_RED, "Du bist kein LSPD/FBI Mitglied.");
    if(SpielerInfo[playerid][sRank] == 1)//Rank 0
    {
        SetPlayerAttachedObject(playerid, 8, 19783, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19783, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 2)//Rank 1
    {
        SetPlayerAttachedObject(playerid, 8, 19784, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19784, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 3)//Rank 2
    {
        SetPlayerAttachedObject(playerid, 8, 19781, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19781, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 4)//Rank 3
    {
        SetPlayerAttachedObject(playerid, 8, 19779, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19779, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 5)//Rank 4
    {
        SetPlayerAttachedObject(playerid, 8, 19782, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19782, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 6)//Rank 5
    {
        SetPlayerAttachedObject(playerid, 8, 19780, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19780, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 7)//Rank 6
    {
        SetPlayerAttachedObject(playerid, 8, 19780, 3, 0.116000, 0.015999, 0.047999, -17.899951, -2.000002, -88.100028, 0.474000, 0.547000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19780, 4, 0.094999, 0.000000, -0.046000, -0.300000, 1.700000, -86.499977, 0.513999, 0.571000, 1.000000, 0, 0); //Wappen RECHTS
    }
    return 1;
}

CMD:rankfrau(playerid)
{
    if(!(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6))return SendClientMessage(playerid, COLOR_RED, "Du bist kein LSPD/FBI Mitglied.");
    if(SpielerInfo[playerid][sRank] == 1)//Rank 0
    {
        SetPlayerAttachedObject(playerid, 8, 19783, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19783, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 2)//Rank 1
    {
        SetPlayerAttachedObject(playerid, 8, 19784, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19784, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 3)//Rank 2
    {
        SetPlayerAttachedObject(playerid, 8, 19781, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19781, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 4)//Rank 3
    {
        SetPlayerAttachedObject(playerid, 8, 19779, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19779, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 5)//Rank 4
    {
        SetPlayerAttachedObject(playerid, 8, 19782, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19782, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 6)//Rank 5
    {
        SetPlayerAttachedObject(playerid, 8, 19780, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19780, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    if(SpielerInfo[playerid][sRank] == 7)//Rank 6
    {
        SetPlayerAttachedObject(playerid, 8, 19780, 3, 0.115999, 0.015999, 0.045999, 172.000091, -3.700002, -93.900077, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen LINKS
        SetPlayerAttachedObject(playerid, 9, 19780, 4, 0.109000, 0.014999, -0.039000, 12.100017, -4.400001, -84.700019, 0.394000, 0.503000, 1.000000, 0, 0); //Wappen RECHTS
    }
    return 1;
}

CMD:wanteds(playerid, params[])
{
 	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			new bool:merker = false;
			SendClientMessage(playerid, COLOR_YELLOW, "Nach folgenden Verbrechern wird gefahndet:");
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
   				new string[128];
				if(GetPlayerWantedLevelEx(i) == 0)continue;
				if(SpielerInfo[i][sPrisonCP] > 0)continue;
				if(SpielerInfo[i][sPrison] > 0)continue;
				format(string,128, "%s | %d Wanted(s)",SpielerInfo[i][sName],GetPlayerWantedLevelEx(i));
				SendClientMessage(playerid, COLOR_WHITE, string);
				merker = true;
			}
			if(merker == false)
			{
   				SendClientMessage(playerid, COLOR_WHITE, "Aktuell steht keine Person zur Fahndung aus.");
			}
			return 1;
 		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:wanteds("gesuchte")

CMD:beisatz(playerid, params[])
{
	if(GetPVarInt(playerid,"CopDuty") < 1 && GetPVarInt(playerid,"FBIDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht als Beamte im Dienst.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 497)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keinem Polizei-Helikopter.");
	new tmpcarX = GetPlayerVehicleID(playerid);
	if(FahrzeugInfo[tmpcarX][fAttachedObject][0] != INVALID_OBJECT_ID)
	{
 		DestroyDynamicObject(FahrzeugInfo[tmpcarX][fAttachedObject][0]);
   		DestroyDynamicObject(FahrzeugInfo[tmpcarX][fAttachedObject][1]);
	    FahrzeugInfo[tmpcarX][fAttachedObject][0] = INVALID_OBJECT_ID;
	    FahrzeugInfo[tmpcarX][fAttachedObject][1] = INVALID_OBJECT_ID;
	    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast die Beisätze des Helikopters eingefahren.");
	}
	else
	{
 		FahrzeugInfo[tmpcarX][fAttachedObject][0] = CreateDynamicObject(19848, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
   		AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcarX][fAttachedObject][0], tmpcarX, -1.274999, 0.904999, -1.004999, 0.000000, 0.000000, 0.000000);

		FahrzeugInfo[tmpcarX][fAttachedObject][1] = CreateDynamicObject(19848, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
		AttachDynamicObjectToVehicle(FahrzeugInfo[tmpcarX][fAttachedObject][1], tmpcarX, 1.274998, 0.904999, -1.004999, -0.000000, 0.000000, 180.000000);

		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast die Beisätze des Helikopters ausgefahren.");
	}
 	return 1;
}

CMD:pdskin(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] != 2)return NichtBerechtigt
 	if(!IsPlayerInRangeOfPoint(playerid,3.0,298.3799,1822.3867,2241.5850))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht am Skinchange in der Waffenkammer.");
	if(GetPVarInt(playerid,"CopDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(FrakInfo[2][fiSkinordnung] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Skinordnung des SAPD ist aktiviert. Skinauswahl nicht möglich.");
	SetPVarInt(playerid,"PDSkinChange",1);
	ShowModelSelectionMenu(playerid, SkinordnungSAPD, "Skinordnung");
	return 1;
}
CMD:swatduty(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] != 2)return NichtBerechtigt
 	if(!IsPlayerInRangeOfPoint(playerid,3.0,307.2472,1822.1039,2241.5850))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht am Skinchange in der Waffenkammer.");
	if(GetPVarInt(playerid,"CopDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht als Beamte im Dienst.");
	if(SpielerInfo[playerid][sPDSwat] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist für diesen Dienst nicht freigegeben.");
	if(GetPVarInt(playerid,"SWATDuty") < 1)
	{
		SetPlayerSkin(playerid,285);
		SetPVarInt(playerid,"SWATDuty",1);
		GetPlayerName(playerid, SwatDutyName[playerid], MAX_PLAYER_NAME);
		new string[MAX_PLAYER_NAME];
		format(string,sizeof(string),"SWAT74%d86",playerid);
		SetPlayerName(playerid,string);
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Benutze '/sorten' für eine Ortung via Satellit!");
	}
	else
	{
 		SetPlayerName(playerid,SwatDutyName[playerid]);
   		DeletePVar(playerid,"SWATDuty");
	    SpawnPlayerEx(playerid);
	}
	return 1;
}


CMD:frisk(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
	    {
			new pID;
			if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/frisk [SpielerID]");
			if(IsPlayerNPC(playerid))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Ein Bot kann nicht durchsucht werden.");
			if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
			new string[364], _Waffe, Munition, marker = true;
			format(string,sizeof(string),"Inventar von %s:",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"* Unbekannter zieht seine Handschuhe an und durchsucht %s.",SpielerInfo[pID][sName]);}
			else format(string,sizeof(string),"* %s %s zieht seine Handschuhe an und durchsucht %s.",RangName(playerid),SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	        ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			format(string,sizeof(string),"Pfandflaschen: %d | Beutel: %d | Drogen: %d | Materialien: %d | Bomben: %d",SpielerInfo[pID][sPfandflaschen],SpielerInfo[pID][sBeutel],SpielerInfo[pID][sDrogen],SpielerInfo[pID][sMaterialien],SpielerInfo[pID][sBombe]);
			SendClientMessage(playerid,COLOR_WHITE,string);
			if(GetPVarInt(pID,"LSFSchmuggel") > 0){SendClientMessage(playerid,COLOR_WHITE,"Die Person führt Schmuggelware für die Ölfabrik-Mitarbeiter mit sich.");}
            format(string,sizeof(string),"[_____Waffen von {FF0000}%s{FFFFFF}_____]",SpielerInfo[pID][sName]);
            SendClientMessage(playerid,COLOR_WHITE,string);
            for(new i=0;i<13;i++)
            {
                GetPlayerWeaponData(pID,WEAPON_SLOT:i,WEAPON:_Waffe,Munition);
                if(_Waffe != 0)
                {
                    format(string,sizeof(string),"Waffenslot %d: %s %d Munition",i,WaffenName(_Waffe),Munition);
                    SendClientMessage(playerid,COLOR_INFO,string);
                    marker = false;
                }
            }
            if(marker)
            {
                SendClientMessage(playerid,COLOR_GREY,"[Info]: Der Spieler hat keine Waffen dabei.");
                return 1;
            }
			return 1;
	    }
		else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:akte(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
	    {
	        new pID;
	        if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /akte [SpielerID]");
	        if(IsPlayerNPC(pID) || !IsPlayerConnected(pID))return SendClientMessage(playerid,COLOR_GREY,"[Dienst-Tablet]: StatusC=404NotFound - Es wurde keine Akte zu dieser ID gefunden.");
	        new string[1024];
	        SetPVarInt(playerid,"AktenEintrag",pID);
	        if(SpielerInfo[pID][sNebenjob] == 12 || SpielerInfo[pID][sNebenjob] == 13)
			{
				format(string,sizeof(string),"{FFFFFF}Name: %s [ID: %d] - Level %d - %d Jahre alt\nDieser Spieler wird der Fraktion '%s' zugeordnet.\nGruppenangehörigkeit: '%s'\nNebenjob: Arbeitslos",SpielerInfo[pID][sName],pID,GetPlayerScore(pID),SpielerInfo[pID][sAlter],FrakName(SpielerInfo[pID][sFraktion]),GruppenInfo[SpielerInfo[pID][sGruppe]][gName]);
			}
			else
			{
				format(string,sizeof(string),"{FFFFFF}Name: %s [ID: %d] - Level %d - %d Jahre alt\nDieser Spieler wird der Fraktion '%s' zugeordnet.\nGruppenangehörigkeit: '%s'\nNebenjob: '%s'",SpielerInfo[pID][sName],pID,GetPlayerScore(pID),SpielerInfo[pID][sAlter],FrakName(SpielerInfo[pID][sFraktion]),GruppenInfo[SpielerInfo[pID][sGruppe]][gName],JobName(SpielerInfo[pID][sNebenjob]));
			}
            format(string,sizeof(string),"%s\n\n{FFFFFF}Strafpunkte von {FF0000}%s\n\n{FFFFFF}Autoschein:		{FF0000}%d{FFFFFF}/10 Strafpunkte\nMotorradschein:	{FF0000}%d{FFFFFF}/10 Strafpunkte\nFlugschein:		{FF0000}%d{FFFFFF}/10 Strafpunkte\nLKWschein:		{FF0000}%d{FFFFFF}/10 Strafpunkte\nBootsschein:		{FF0000}%d{FFFFFF}/10 Strafpunkte",
			string,SpielerInfo[pID][sName],SpielerInfo[pID][stvoCarLic],SpielerInfo[pID][stvoBikeLic],SpielerInfo[pID][stvoFlugLic],SpielerInfo[pID][stvoTruckLic],SpielerInfo[pID][stvoBootLic]);

			new query[400];
            mysql_format(sqlHandle, query, sizeof(query),"SELECT `Akte` FROM `accounts` WHERE `Name` = '%s'", SpielerInfo[pID][sName]);
	   	 	new Cache:result = mysql_query(sqlHandle, query);
			new rows = cache_num_rows();
			new var[255];
			for(new i = 0; i < rows; i++)
			{
	  			cache_get_value_name(i, "Akte",var);
		    	format(string,sizeof(string),"%s\n\n{00CDFF}Akteneinträge:{FFFFFF}\n%s",string,var);
		    }
			cache_delete(result);

			ShowPlayerDialog(playerid,DIALOG_PDAKTE,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Dienst-Tablet",string,"OK","Eintrag");
			if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"* Unbekannter holt sein Dienst-Tablet heraus und tippt darauf herum.");}
			else format(string,sizeof(string),"* %s %s holt sein Dienst-Tablet heraus und tippt darauf herum.",RangName(playerid),SpielerInfo[playerid][sName]);
	        ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	        return 1;
	    }
	    else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:clearakte(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
	    {
	        if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	        new pID;
	        if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /clearakte [SpielerID]");
	        if(IsPlayerNPC(pID) || !IsPlayerConnected(pID))return SendClientMessage(playerid,COLOR_GREY,"[Dienst-Tablet]: StatusC=404NotFound - Es wurde keine Akte zu dieser ID gefunden.");
			new string[128];
			mysql_format(sqlHandle, string,sizeof(string),"UPDATE `accounts` SET `Akte`='Keine Einträge vorhanden.' WHERE `Name`='%s'",SpielerInfo[pID][sName]);
			mysql_tquery(sqlHandle, string);
			format(string,sizeof(string),"[Info]: {FFFFFF}Du hast die Akte von '%s' vernichtet.",SpielerInfo[pID][sName]);
			SendClientMessage(playerid,COLOR_INFO,string);
			if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"* Unbekannter holt sein Dienst-Tablet heraus und tippt darauf herum.");}
			else format(string,sizeof(string),"* %s %s holt sein Dienst-Tablet heraus und tippt darauf herum.",RangName(playerid),SpielerInfo[playerid][sName]);
	        ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:pdswat(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] != 2 && SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	new pID;
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/pdswat [SpielerID]");
    if(!IsPlayerConnected(pID))return NichtOnline
    if(SpielerInfo[pID][sFraktion] != 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler ist kein Polizeibeamte.");
    new string[128];
    if(SpielerInfo[playerid][sPDSwat] < 1)
    {
	    format(string,sizeof(string),"[Info]: {FFFFFF}%s %s hat dich für den S.W.A.T-Dienst freigeschaltet.",RangName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessage(pID,COLOR_SUPER,string);
	    format(string,sizeof(string),"[Info]: {FFFFFF}Du hast %s %s für S.W.A.T-Dienst freigeschaltet.",RangName(pID),SpielerInfo[pID][sName]);
	    SendClientMessage(playerid,COLOR_SUPER,string);
	    SpielerInfo[pID][sPDSwat] = 1;
	}
	else
	{
	    format(string,sizeof(string),"[Info]: {FFFFFF}%s %s hat dich für den S.W.A.T-Dienst abgemeldet.",RangName(playerid),SpielerInfo[playerid][sName]);
	    SendClientMessage(pID,COLOR_RED,string);
	    format(string,sizeof(string),"[Info]: {FFFFFF}Du hast %s %s für S.W.A.T-Dienst abgemeldet.",RangName(pID),SpielerInfo[pID][sName]);
	    SendClientMessage(playerid,COLOR_RED,string);
	    SpielerInfo[pID][sPDSwat] = 0;
	}
	return 1;
}

CMD:sorten(playerid,params[])
{
    if(GetPVarInt(playerid,"SWATDuty") < 1)return NichtBerechtigt
    if(SatOrtung > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Eine Ortung via Satellit ist nur alle 3 Minuten möglich.");
    new pID;
    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/sorten [SpielerID]");
    if(!IsPlayerConnected(pID))return NichtOnline
    new string[128];
    format(string,sizeof(string),"* %s holt sein Dienst-Tablet heraus und tippt darauf herum.",SpielerInfo[playerid][sName]);
    ProxDetector(12.0, playerid, string, COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
    new Float:Position[3];
    GetPlayerPos(pID,Position[0],Position[1],Position[2]);
    SetPlayerCheckpointEx(playerid,Position[0],Position[1],Position[2],4.0);
    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Paket wurde durch Satelliten-Bilder ausfindig gemacht.");
    SatOrtung = 1;
    SetTimer("SatOrtungTimer",180000,false);
	return 1;
}


CMD:delpunkte(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    if(SpielerInfo[playerid][sRank] < 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du benötigst min. den Co-Leader Rang, um Punkte zu entfernen.");
   		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			new string[144], Auswahl[20], pID, Anzahl, Grund[64];
			if(sscanf(params,"us[20]ds[64]",pID,Auswahl,Anzahl,Grund))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/delpunkte [SpielerID/Name] [Autoschein|Motorradschein|Flugschein|LKWschein|Bootsschein] [Anzahl] [Grund]");
			if(!IsPlayerConnectedEx(pID))return NichtOnline
            if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir keine Punkte aus deiner eigenen Akte entfernen.");
			if(strcmp(Auswahl, "Autoschein", true, strlen(Auswahl)) == 0)
	    	{
	    	    if(SpielerInfo[pID][sCarLic] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein Autoschein.");
				if(SpielerInfo[pID][stvoCarLic] < Anzahl)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt nicht so viele Strafpunkte.");
		        SpielerInfo[pID][stvoCarLic] -= Anzahl;
		        format(string,sizeof(string),"%s %s hat dir %d Strafpunkt(e) für den Autoschein entfernt. Grund: %s",RangName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
		        SendClientMessage(pID,COLOR_RED,string);
		        format(string,sizeof(string),"Du hast dem %s %d Strafpunkt(e) für den Autoschein entfernt. Grund: %s",SpielerInfo[pID][sName],Anzahl,Grund);
		        SendClientMessage(playerid,COLOR_SUPER,string);
		        return 1;
	    	}
			else if(strcmp(Auswahl, "Motorradschein", true, strlen(Auswahl)) == 0)
	    	{
	    	    if(SpielerInfo[pID][sBikeLic] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein Motorradschein.");
				if(SpielerInfo[pID][stvoBikeLic] < Anzahl)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt nicht so viele Strafpunkte.");
		        SpielerInfo[pID][stvoBikeLic] -= Anzahl;
		        format(string,sizeof(string),"%s %s hat dir %d Strafpunkt(e) für den Motorradschein entfernt. Grund: %s",RangName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
		        SendClientMessage(pID,COLOR_RED,string);
		        format(string,sizeof(string),"Du hast dem %s %d Strafpunkt(e) für den Motorradschein entfernt. Grund: %s",SpielerInfo[pID][sName],Anzahl,Grund);
		        SendClientMessage(playerid,COLOR_SUPER,string);
		        return 1;
	    	}
			else if(strcmp(Auswahl, "Flugschein", true, strlen(Auswahl)) == 0)
	    	{
	    	    if(SpielerInfo[pID][sFlugLic] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein Flugschein.");
	            if(SpielerInfo[pID][stvoFlugLic] < Anzahl)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt nicht so viele Strafpunkte.");
		        SpielerInfo[pID][stvoFlugLic] -= Anzahl;
		        format(string,sizeof(string),"%s %s hat dir %d Strafpunkt(e) für den Flugschein entfernt. Grund: %s",RangName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
		        SendClientMessage(pID,COLOR_RED,string);
		        format(string,sizeof(string),"Du hast dem %s %d Strafpunkt(e) für den Flugschein entfernt. Grund: %s",SpielerInfo[pID][sName],Anzahl,Grund);
		        SendClientMessage(playerid,COLOR_SUPER,string);
		        return 1;
	    	}
			else if(strcmp(Auswahl, "LKWschein", true, strlen(Auswahl)) == 0)
	    	{
	    	    if(SpielerInfo[pID][sTruckLic] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein LKWschein.");
	    	    if(SpielerInfo[pID][stvoTruckLic] < Anzahl)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt nicht so viele Strafpunkte.");
		        SpielerInfo[pID][stvoTruckLic] -= Anzahl;
		        format(string,sizeof(string),"%s %s hat dir %d Strafpunkt(e) für den LKWschein entfernt. Grund: %s",RangName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
		        SendClientMessage(pID,COLOR_RED,string);
		        format(string,sizeof(string),"Du hast dem %s %d Strafpunkt(e) für den LKWschein entfernt. Grund: %s",SpielerInfo[pID][sName],Anzahl,Grund);
		        SendClientMessage(playerid,COLOR_SUPER,string);
		        return 1;
	    	}
			else if(strcmp(Auswahl, "Bootsschein", true, strlen(Auswahl)) == 0)
	    	{
	    	    if(SpielerInfo[pID][sBootLic] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt kein Bootsschein.");
				if(SpielerInfo[pID][stvoBootLic] < Anzahl)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler besitzt nicht so viele Strafpunkte.");
		        SpielerInfo[pID][stvoBootLic] -= Anzahl;
		        format(string,sizeof(string),"%s %s hat dir %d Strafpunkt(e) für den Bootsschein entfernt. Grund: %s",RangName(playerid),SpielerInfo[playerid][sName],Anzahl,Grund);
		        SendClientMessage(pID,COLOR_RED,string);
		        format(string,sizeof(string),"Du hast dem %s %d Strafpunkt(e) für den Bootsschein entfernt. Grund: %s",SpielerInfo[pID][sName],Anzahl,Grund);
		        SendClientMessage(playerid,COLOR_SUPER,string);
		        return 1;
	    	}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:take(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
	    new pID, licname[24];
	    if(sscanf(params,"us[24]",pID,licname))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/take [SpielerID] [Autoschein|Bikeschein|Flugschein|LKWschein|BootSchein|WaffenSchein|Alle]");
	    if(!IsPlayerConnectedEx(pID))return NichtOnline
	    new string[128];
	    if(strcmp(licname,"Autoschein",true)==0)
		{
		    if(SpielerInfo[pID][sCarLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
		    SpielerInfo[pID][sCarLic] = 0;
			format(string,sizeof(string),"%s %s hat dir deinen Autoschein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein Autoschein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
		else if(strcmp(licname,"Bikeschein",true)==0)
		{
		    if(SpielerInfo[pID][sBikeLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
	        SpielerInfo[pID][sBikeLic] = 0;
			format(string,sizeof(string),"%s %s hat dir deinen Bikeschein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein Bikeschein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
		else if(strcmp(licname,"Flugschein",true)==0)
		{
		    if(SpielerInfo[pID][sFlugLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
	        SpielerInfo[pID][sFlugLic] = 0;
			format(string,sizeof(string),"%s %s hat dir Spieler deinen Flugschein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein Flugschein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
		else if(strcmp(licname,"LKWschein",true)==0)
		{
		    if(SpielerInfo[pID][sTruckLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
	        SpielerInfo[pID][sTruckLic] = 0;
			format(string,sizeof(string),"%s %s hat dir deinen LKWschein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein LKWschein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
	  	}
		else if(strcmp(licname,"BootSchein",true)==0)
		{
		    if(SpielerInfo[pID][sBootLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
	        SpielerInfo[pID][sBootLic] = 0;
			format(string,sizeof(string),"%s %s hat dir deinen BootSchein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein BootSchein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
		else if(strcmp(licname,"WaffenSchein",true)==0)
		{
		    if(SpielerInfo[pID][sWeaponLic] == 0)return SendClientMessage(playerid,COLOR_RED,"Info: Der Spieler besitzt diesen Schein nicht.");
	        SpielerInfo[pID][sWeaponLic] = 0;
			format(string,sizeof(string),"%s %s hat dir deinen Waffenschein abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s sein Waffenschein abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
		else if(strcmp(licname,"Alle",true)==0)
		{
		    SpielerInfo[pID][sCarLic] = 0;
		    SpielerInfo[pID][sBikeLic] = 0;
		    SpielerInfo[pID][sFlugLic] = 0;
		    SpielerInfo[pID][sTruckLic] = 0;
		    SpielerInfo[pID][sBootLic] = 0;
		    SpielerInfo[pID][sWeaponLic] = 0;
		    format(string,sizeof(string),"%s %s hat dir all deine Scheine abgenommen.",RangName(playerid),SpielerInfo[playerid][sName]);
	        SendClientMessage(pID,COLOR_INFO,string);
			format(string,sizeof(string),"Du hast %s all seine Scheine abgenommen.",SpielerInfo[pID][sName]);
	        SendClientMessage(playerid,COLOR_SUPER,string);
		}
	}
	else NichtBerechtigt
	return 1;
}

CMD:tazer(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			new string[128];
		    if(GetPVarInt(playerid,"Tazer") == 1)//Tazer in der Hand
		    {
		        if(GetPVarInt(playerid,"DeagleAmmo") == 0)//Keine Deagle gehabt
		        {
		            SendClientMessage(playerid,COLOR_INFO,"Du hast deinen Tazer reingelegt.");
			        RemovePlayerWeapon(playerid,WEAPON:23);
			        DeletePVar(playerid,"Tazer");
				}
				else
				{
				    GivePlayerWeapon(playerid,WEAPON:24,GetPVarInt(playerid,"DeagleAmmo"));
					DeletePVar(playerid,"DeagleAmmo");
				    SendClientMessage(playerid,COLOR_INFO,"Du hast deinen Tazer reingelegt und deine Desert Eagle wieder rausgenommen.");
			        DeletePVar(playerid,"Tazer");
				}
				format(string,sizeof(string),"* %s %s sichert seinen Tazer und steckt ihn in den Holster.",RangName(playerid),SpielerInfo[playerid][sName]);
				ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		    }
		    else
		    {
		    	new OldDeagle, OldAmmo;
				GetPlayerWeaponData(playerid, WEAPON_SLOT:2, WEAPON:OldDeagle, OldAmmo);
		        if(OldDeagle == 24)
		        {
					SetPVarInt(playerid,"DeagleAmmo",OldAmmo);
		            SetPVarInt(playerid,"Tazer",1);
		        	SendClientMessage(playerid,COLOR_INFO,"Du hast deine Desert Eagle reingelegt und deinen Tazer wieder rausgenommen.");
		            RemovePlayerWeapon(playerid,WEAPON:24);
		            GivePlayerWeapon(playerid,WEAPON:23,50);
			        return 1;
				}
				else
				{
				    SetPVarInt(playerid,"Tazer",1);
		 			SendClientMessage(playerid,COLOR_INFO,"Du hast deinen Tazer rausgenommen.");
					GivePlayerWeapon(playerid,WEAPON:23,50);
					format(string,sizeof(string),"* %s %s zieht seinen Tazer aus dem Polster und entsichert ihn.",RangName(playerid),SpielerInfo[playerid][sName]);
					ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
				}
				format(string,sizeof(string),"* %s %s zieht seinen Tazer aus dem Polster und entsichert ihn.",RangName(playerid),SpielerInfo[playerid][sName]);
				ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}