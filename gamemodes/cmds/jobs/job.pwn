CMD:jduty(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
 	if(IsPlayerInRangeOfPoint(playerid,3.0,2504.7148,-2640.4246,13.8623))
	{
		if(SpielerInfo[playerid][sNebenjob] != 16)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Langstreckenfahrer.");
  		if(GetPVarInt(playerid,"LSFDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
 	else if(IsPlayerInRangeOfPoint(playerid,3.0,2132.3325,-2282.8867,20.6719))
	{
		if(SpielerInfo[playerid][sNebenjob] != 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein LKW-Fahrer / Trucker.");
  		if(GetPVarInt(playerid,"TruckerDuty") == 0)
    	{
     		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,369.0709,-114.6389,1001.4995))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Pizzabote.");
		if(GetPVarInt(playerid,"PizzaboteDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1378.4637,-1640.7590,13.5469))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Kehrmaschinenfahrer.");
		if(GetPVarInt(playerid,"KehrmaschinenDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1957.0295,-2183.6008,13.5469))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 4)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Pilot.");
		if(GetPVarInt(playerid,"PilotDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1523.1068,-2325.8340,13.5469))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 5)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Busfahrer.");
		if(GetPVarInt(playerid,"BusfahrerDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1734.5929,-2060.1526,13.5910))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Müllmann.");
		if(GetPVarInt(playerid,"MüllmannDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,-62.7901,76.2742,3.1172))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Landwirt.");
		if(GetPVarInt(playerid,"LandwirtDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1789.3868,-1706.7506,13.5509))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 10)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Geldlieferant.");
		if(GetPVarInt(playerid,"GeldlieferantDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,2147.0122,-1733.2238,13.5624))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 11)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Elektriker.");
		if(GetPVarInt(playerid,"ElektrikerDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	else if(IsPlayerInRangeOfPoint(playerid,3.0,1747.0460,-1944.3030,13.5671))
	{
 		if(SpielerInfo[playerid][sNebenjob] != 14)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein Zugfahrer.");
		if(GetPVarInt(playerid,"ZugfahrerDuty") == 0)
  		{
    		ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Dienst gehen","Weiter","Abbrechen");
		}
		else
		{
			ShowPlayerDialog(playerid,DIALOG_JOB_DUTY,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Dienstauswahl","In den Feierabend gehen","Weiter","Abbrechen");
		}
	}
	return 1;
}
CMD:beenden(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] == 10)
 	{
  		if(GetPVarInt(playerid,"GeldlieferantDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
    	if(GetPVarInt(playerid,"GeldlieferantArbeitet") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast derzeit keine Tour begonnen.");
	    if(GetPVarInt(playerid,"GeldlieferantGehalt") != 0)
	    {
			SendClientMessage(playerid,COLOR_SUPER,"Gute Arbeit Sir! Gib dein Geldtransporter nun am roten Marker ab um dein Gehalt am nächsten PayDay zu kriegen.");
		}
		else
		{
  			SetPVarInt(playerid,"KeineExpFürJob",1);
  			SendClientMessage(playerid,COLOR_SUPER,"Schade Sir, dass Sie schon so früh aufhören wollen. Gib dein Geldtransporter am roten Marker ab.");
   		}
		PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		SetPlayerCheckpointEx(playerid,1801.7838,-1707.5288,13.6681,5.0);
		SetPVarInt(playerid,"GeldlieferantAbgabe",1);
 		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 11)
 	{
		if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(GetPVarInt(playerid,"ElektrikerArbeitet") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast derzeit keine Tour begonnen.");
  		if(GetPVarInt(playerid,"ElektrikerGehalt") != 0)
    	{
			SendClientMessage(playerid,COLOR_SUPER,"Gute Arbeit Sir! Gib dein Elektrikerfahrzeug nun am roten Marker ab um dein Gehalt am nächsten PayDay zu kriegen.");
		}
		else
		{
  			SetPVarInt(playerid,"KeineExpFürJob",1);
  			SendClientMessage(playerid,COLOR_SUPER,"Schade Sir, dass Sie schon so früh aufhören wollen. Gib dein Elektrikerfahrzeug am roten Marker ab.");
   		}
		PlayerPlaySound(playerid, 1139, 0.0, 0.0, 0.0);
		SetPlayerCheckpointEx(playerid,2130.8152,-1737.6101,13.5597,5.0);
		SetPVarInt(playerid,"ElektrikerAbgabe",1);
  	}
	else NichtBerechtigt
	return 1;
}


CMD:reinlegen(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] == 2)
	{
 		if(GetPVarInt(playerid,"PizzaboteDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht als Pizzabote im Dienst.");
   		if(GetPVarInt(playerid,"PizzaTragen") != 5)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Hole dir erst die Pizzen aus der Pizzaria.");
    	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	    new Float:x, Float:y, Float:z, merker = true;
     	for(new i=1; i<MAX_VEHICLES; i++)
      	{
       		if(FahrzeugInfo[i][fNebenjob] == 2)
			GetXYInFrontOfVehicle(i,x,y,z,-2.02);
   			if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
   			{
				if(FahrzeugInfo[i][fJobFahrer] != 0)
				{
					SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug ist bereits von einem Mitarbeiter belegt.");
					return 1;
				}
				else
				{
    				new Text[64];
		 			FahrzeugInfo[i][fJobFahrer] = playerid;
   					SetPVarInt(playerid,"PizzaAuto",i);
	    			GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, boot, objective);
    				SetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, true, objective);
				    TogglePlayerControllable(playerid, false);
	    			GameTextForPlayer(playerid, "~r~Bitte warten...", 10000, 5);
        			KillTimer(PizzaReinlegenTimer[playerid]);
	    			PizzaReinlegenTimer[playerid] = SetTimerEx("PizzaReinlegen",2000,true,"i",playerid);
					format(Text, sizeof(Text), "Jobfahrzeug von\n{FE0000}%s", SpielerInfo[playerid][sName]);
 					UpdateDynamic3DTextLabelText(FahrzeugInfo[i][fLabel], COLOR_WHITE, Text);
  					FahrzeugInfo[i][fNebenjobDuty] = playerid;
     				merker = false;
         			return 1;
				}
    		}
      	}
       	if(merker)
		{
  			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Kofferraum eines Dienstwagens.");
     		return 1;
       	}
       	return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 7)
	{
		if(GetPVarInt(playerid,"LandwirtHatWalton") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast noch keinen Walton als Jobfahrzeug.");
  		if(GetPVarInt(playerid,"HatHeuballen") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Hebe erst einen Heuballen auf, um sie anschließend in den Walton legen zu können.");
   		if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	    new Float:x, Float:y, Float:z, merker = true;
		GetXYInFrontOfVehicle(GetPVarInt(playerid,"LandwirtAuto"),x,y,z,-2.02);
  		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
    	{
	    	new vehid = GetPVarInt(playerid,"LandwirtAuto");
   			GetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, boot, objective);
   			SetVehicleParamsEx(vehid, engine, lights, alarm, doors, bonnet, true, objective);
		    TogglePlayerControllable(playerid, false);
   			GameTextForPlayer(playerid, "~r~Bitte warten...", 3000, 5);
   			SetTimerEx("HeuballenReinlegen",2000,false,"i",playerid);
    		merker = false;
      		return 1;
       	}
        if(merker)
		{
  			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Kofferraum des Waltons.");
     		return 1;
       	}
    	return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 10)
	{
		if(GetPVarInt(playerid,"GeldlieferantDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(GetPVarInt(playerid,"GeldkofferInHand") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast hast keinen Geldkoffer in der Hand.");
    	if(GetPVarInt(playerid,"GeldtransporterID") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast dir noch keinen Geldtransporter reserviert.");
    	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	    new Float:x, Float:y, Float:z, i = GetPVarInt(playerid,"GeldtransporterID");
		GetXYInFrontOfVehicle(i,x,y,z,-2.02);
  		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
    	{
     		if(FahrzeugInfo[i][fJobFahrer] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Geldtransporter gehört nicht dir.");
			SetVehicleParamsCarDoors(i,false,false,true,true);
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid,"DEALER","DRUGS_BUY", 4.0, true, false, false, false, 0);
			GameTextForPlayer(playerid, "~r~Bitte warten...", 5000, 5);
			KillTimer(GeldkofferTimer[playerid]);
			GeldkofferTimer[playerid] = SetTimerEx("GeldkofferReinlegen",5000,false,"i",playerid);
   			return 1;
      	}
     	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Kofferraum deines Geldtransporters.");
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 11)
	{
		if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(GetPVarInt(playerid,"WerkzeugInHand") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast hast kein Werkzeug in der Hand.");
    	if(GetPVarInt(playerid,"ElektrikerID") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast dir noch keinen Elektrikerfahrzeug reserviert.");
    	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	    new Float:x, Float:y, Float:z, i = GetPVarInt(playerid,"ElektrikerID");
		GetXYInFrontOfVehicle(i,x,y,z,-2.02);
  		if(IsPlayerInRangeOfPoint(playerid,3.0,x,y,z))
    	{
     		if(FahrzeugInfo[i][fJobFahrer] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Elektrikerfahrzeug gehört nicht dir.");
			if(Kofferraum[i] == false)
			{
   				Kofferraum[i] = true;
		    	GetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, boot, objective);
			    SetVehicleParamsEx(i, engine, lights, alarm, doors, bonnet, true, objective);
			}
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid,"DEALER","DRUGS_BUY", 4.0, true, false, false, false, 0);
			GameTextForPlayer(playerid, "~r~Bitte warten...", 5000, 5);
			KillTimer(WerkzeugTimer[playerid]);
			WerkzeugTimer[playerid] = SetTimerEx("WerkzeugReinlegen",5000,false,"i",playerid);
   			return 1;
      	}
     	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Kofferraum deines Elektrikerfahrzeuges.");
  		return 1;
	}
	return NichtBerechtigt
}

CMD:startjob(playerid, params[])
{
	new tmpcar = GetPlayerVehicleID(playerid), string[298];
	if(SpielerInfo[playerid][sNebenjob] == 0)return NichtBerechtigt
	if(SpielerInfo[playerid][sNebenjob] == 3)
	{
 		if(GetPVarInt(playerid,"KehrmaschinenDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
   		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keiner Kehrmaschine.");
		new vehicleid = GetPlayerVehicleID(playerid);
		if(FahrzeugInfo[vehicleid][fNebenjob] != 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keiner Kehrmaschine.");
		if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
		if(GetPVarInt(playerid,"KfahrerArbeitet") == 1)
		{
			new id = GetPVarInt(playerid,"KehrmaschinenAuftrag");
   			SendClientMessage(playerid,COLOR_SUPER,"Du hast bereits eine Route gestartet. Fahr zum roten Marker um den Müll aufzukehren.");
		    SetPlayerCheckpointEx(playerid,MuellRouteInfo[id][mrPos_X],MuellRouteInfo[id][mrPos_Y],MuellRouteInfo[id][mrPos_Z],1.5);
		    return 1;
		}
		if(FahrzeugInfo[vehicleid][fNebenjob] == 3)
		{
  			FahrzeugInfo[vehicleid][fJobFahrer] = playerid;
	    	SetPVarInt(playerid,"Kehrmaschine",vehicleid);
		    FahrzeugInfo[vehicleid][fNebenjobDuty] = playerid;
	    	format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter", SpielerInfo[playerid][sName]);
	    	UpdateDynamic3DTextLabelText(FahrzeugInfo[vehicleid][fLabel], COLOR_WHITE, string);
		}
		for(new id=0; id<sizeof(MuellRouteInfo); id++)
		{
  			MuellObjekt[playerid][id] = CreateDynamicObject(MuellRouteInfo[id][mrObjekt], MuellRouteInfo[id][mrPos_X],MuellRouteInfo[id][mrPos_Y],MuellRouteInfo[id][mrPos_Z], MuellRouteInfo[id][mrRPos_X],MuellRouteInfo[id][mrRPos_Y],MuellRouteInfo[id][mrRPos_Z], -1, -1, playerid, 200.0);
		}
		SetPVarInt(playerid,"KfahrerArbeitet",1);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SetPlayerCheckpointEx(playerid,MuellRouteInfo[0][mrPos_X],MuellRouteInfo[0][mrPos_Y],MuellRouteInfo[0][mrPos_Z],1.5);
		SendClientMessage(playerid,COLOR_SUPER,"Dann mal ran an die Arbeit! Kehre den Müll auf der sich am roten Marker befindet.");
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 4)
	{
		if(GetPVarInt(playerid,"PilotDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(FahrzeugInfo[tmpcar][fNebenjob] != 4)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
   		if(GetPVarInt(playerid,"PilotArbeitet") != 0)
		{
  			SendClientMessage(playerid,COLOR_SUPER,"Flieg zum roten Marker um deine Route fortzusetzen.");
	    	if(GetPVarInt(playerid,"PilotArbeitet") == 1){SetPlayerCheckpointEx(playerid,2061.6660,-2593.2915,14.2723,7.0);}
		    else if(GetPVarInt(playerid,"PilotArbeitet") == 2){SetPlayerCheckpointEx(playerid,-1642.5271,-149.6707,14.8681,7.0);}
		    else if(GetPVarInt(playerid,"PilotArbeitet") == 3){SetPlayerCheckpointEx(playerid,1388.8792,1683.4226,11.5457,7.0);}
		    else if(GetPVarInt(playerid,"PilotArbeitet") == 4){SetPlayerCheckpointEx(playerid,2061.6660,-2593.2915,14.2723,7.0);}
		    return 1;
		}
  		SetPVarInt(playerid,"FlugID",tmpcar);
    	SetPVarInt(playerid,"PilotArbeitet",1);
    	format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}", SpielerInfo[playerid][sName]);
    	FahrzeugInfo[tmpcar][fNebenjobDuty] = playerid;
    	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
		SetPlayerCheckpointEx(playerid,2061.6660,-2593.2915,14.2723,7.0);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SendClientMessage(playerid,COLOR_SUPER,"Dann mal ran an die Arbeit! Flieg die einzelnen Airports ab. Begib dich nun zum roten Marker.");
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 5)
	{
		if(GetPVarInt(playerid,"BusfahrerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(FahrzeugInfo[tmpcar][fNebenjob] != 5)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
   		if(GetPVarInt(playerid,"BusfahrerArbeitet") != 0)
		{
			new id = GetPVarInt(playerid,"BusfahrerLinie"), cp = GetPVarInt(playerid, "BusfahrerRoute");

   			SetPlayerJobCheckpoint(playerid, busRouteCheckpoint[id][cp][0], busRouteCheckpoint[id][cp][1], busRouteCheckpoint[id][cp][2], 5.0);
		    SendClientMessage(playerid,COLOR_SUPER,"Du hast bereits eine Linie ausgewählt. Begib dich zur nächsten Haltestelle.");
		    return 1;
		}
		showBusRoutes(playerid);
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 6)
	{
		if(GetPVarInt(playerid,"MüllmannDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(FahrzeugInfo[tmpcar][fNebenjob] != 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");

		if(GetPVarInt(playerid,"MüllmannArbeitet") == 1 && GetPVarInt(playerid,"MüllBeutel") == 10)
  		{
    		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Bringe den Müllwagen erst zurück zur Firma um anschließen dein Gehalt zu erhalten.");
      		SetPlayerCheckpointEx(playerid,1770.9084,-2022.5839,14.1376,3.0);
        	return 1;
    	}
	    else if(GetPVarInt(playerid,"MüllmannArbeitet") == 1 && GetPVarInt(playerid,"MüllBeutelHand") == 0)
		{
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Hole erst den Müll bei dem Haus ab um den nächsten Müll holen zu können.");
			SetPlayerCheckpointEx(playerid,MuellHausPos[playerid][0],MuellHausPos[playerid][1],MuellHausPos[playerid][2],1.5);
			return 1;
		}
		else if(GetPVarInt(playerid,"MüllmannArbeitet") == 1 && GetPVarInt(playerid,"MüllBeutelHand") == 1)
		{
			new Float:x, Float:y, Float:z;
			GetXYInFrontOfVehicle(tmpcar,x,y,z,-4.5);
			MuellAutoPos[playerid][0] = x;
			MuellAutoPos[playerid][1] = y;
			MuellAutoPos[playerid][2] = z;

			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Bring den Müllbeutel zum Müllwagen.");
			SetPlayerCheckpointEx(playerid,MuellAutoPos[playerid][0],MuellAutoPos[playerid][1],MuellAutoPos[playerid][2],3.0);
			return 1;
		}
		loop_start:
  		for(new mf=1;mf<MAX_HAUSER;mf++)
    	{
     		new hs = 1+random(MAX_HAUSER);
       		if(HausInfo[hs][hsErstellt] == false || HausInfo[hs][hsOrt] != 1)goto loop_start;
			MuellHausPos[playerid][0] = HausInfo[hs][hsPos_X];
			MuellHausPos[playerid][1] = HausInfo[hs][hsPos_Y];
			MuellHausPos[playerid][2] = HausInfo[hs][hsPos_Z];
			SetPlayerCheckpointEx(playerid,HausInfo[hs][hsPos_X],HausInfo[hs][hsPos_Y],HausInfo[hs][hsPos_Z],1.5);
			PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
			SendClientMessage(playerid,COLOR_SUPER,"Hole den Müll nun vom Haus ab. Das Haus befindet sich am roten Marker.");
   			SetPVarInt(playerid,"MüllmannArbeitet",1);
 	    	SetPVarInt(playerid,"Müllauto",tmpcar);
    		format(string, sizeof(string), "Müllmann\n{FE0000}%s{FFFFFF}\nMüll: {FF0000}0{FFFFFF} Liter", SpielerInfo[playerid][sName]);
			UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
			break;
	 	}
	}
	else if(SpielerInfo[playerid][sNebenjob] == 7)
	{
		if(GetPVarInt(playerid,"LandwirtDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(FahrzeugInfo[tmpcar][fNebenjob] != 7)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
	    if(GetPVarInt(playerid,"LandwirtArbeitet") == 0 && GetVehicleModel(tmpcar) != 531)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Steige in einen Traktor ein, um loszulegen.");
	    if(GetPVarInt(playerid,"LandwirtArbeitet") == 1 && GetPVarInt(playerid,"LandwirtStufe") == 1)
	    {
			new id = GetPVarInt(playerid,"LandwirtCheckpoint");
 			SetPlayerCheckpointEx(playerid,LandwirtInfo[id][lPos_X],LandwirtInfo[id][lPos_Y],LandwirtInfo[id][lPos_Z],2.5);
    		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Beende erst die Arbeit um eine neue zu beginnen. Fahre zum roten Marker.");
      		return 1;
    	}
	    if(GetPVarInt(playerid,"LandwirtArbeitet") == 1 && GetPVarInt(playerid,"LandwirtAbgabe") == 1)
	    {
     		SetPlayerCheckpointEx(playerid,-105.4470,72.9262,3.1172,3.5);
			SendClientMessage(playerid,COLOR_INFO,"Bringe den Traktor zum roten Marker um ihn abzugeben.");
   			return 1;
   		}
	    if(GetPVarInt(playerid,"LandwirtArbeitet") == 1 && GetPVarInt(playerid,"LandwirtAbgabe") == 2)
	    {
     		SetPlayerCheckpointEx(playerid,-105.4470,72.9262,3.1172,3.5);
			SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Bringe den Mähdrescher zum roten Marker um ihn abzugeben.");
   			return 1;
   		}
	    if(GetPVarInt(playerid,"LandwirtArbeitet") == 1 && GetPVarInt(playerid,"LandwirtAutoHolen") == 1)
	    {
     		GameTextForPlayer(playerid,"~w~Steige nun in ein ~r~Meadrescher ~w~ein",3000,4);
       		return 1;
 		}
  		if(GetPVarInt(playerid,"LandwirtArbeitet") == 1 && GetPVarInt(playerid,"LandwirtAutoHolen") == 2)
  		{
			GameTextForPlayer(playerid,"~w~Steige nun in ein ~r~Walton ~w~ein",3000,4);
   			return 1;
 		}
 		if(GetPVarInt(playerid,"HeuballenImWalton") == 23)
		{
  			SetPVarInt(playerid,"HeuballenAbgabe",1);
			SetPlayerCheckpointEx(playerid,-23.2852,-274.7156,5.4197,3.5);
			SendClientMessage(playerid,COLOR_INFO,"Sehr gut, das waren alle Heuballen. Bringe die nun zum roten Marker.");
			return 1;
		}
		FahrzeugInfo[tmpcar][fJobFahrer] = playerid;
		format(string, sizeof(string), "Landwirt\n{FE0000}%s{FFFFFF}", SpielerInfo[playerid][sName]);
		UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
  		SetPlayerCheckpointEx(playerid,-105.4470,72.9262,3.1172,3.5);
    	GameTextForPlayer(playerid,"~w~Dann mal ran an die ~r~Arbeit",3000,4);
	    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
	    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Begib dich zum roten Marker.");
	    SetPVarInt(playerid,"LandwirtAuto",tmpcar);
	    SetPVarInt(playerid,"LandwirtArbeitet",1);
	    SetPVarInt(playerid,"LandwirtStufe",1);
	    return 1;
    }
	else if(SpielerInfo[playerid][sNebenjob] == 10)
	{
		if(GetPVarInt(playerid,"GeldlieferantDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	   	if(FahrzeugInfo[tmpcar][fNebenjob] != 10)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
	    if(GetPVarInt(playerid,"GeldtransporterGeld") > 0)return SendClientMessage(playerid,COLOR_INFO,"Beende deine Tour mit '/beenden' oder beliefere weiter die Bankautomaten mit Geld.");
   		if(GetPVarInt(playerid,"GeldlieferantArbeitet") == 1 && GetPVarInt(playerid,"GeldlieferantAbholung") == 1)
		{
  			SendClientMessage(playerid,COLOR_SUPER,"Begib dich zum roten Marker, um das Geld abzuholen.");
   			SetPlayerCheckpointEx(playerid,1623.6760,-1894.1190,13.6745,5.0);
		    return 1;
		}
		FahrzeugInfo[tmpcar][fJobFahrer] = playerid;
  		SetPVarInt(playerid,"GeldtransporterID",tmpcar);
	   	SetPVarInt(playerid,"GeldlieferantArbeitet",1);
	    SetPVarInt(playerid,"GeldlieferantAbholung",1);
	    if(SpielerInfo[playerid][sJobEXP][10] < 50){format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$0{FFFFFF} / {009300}$15.000", SpielerInfo[playerid][sName]);}
	    else format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s{FFFFFF}\nKapazität{FFFFFF}\n{FE0000}$0{FFFFFF} / {009300}$15.000", SpielerInfo[playerid][sName]);
    	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
    	FahrzeugInfo[tmpcar][fNebenjobDuty] = playerid;
		SetPlayerCheckpointEx(playerid,1623.6760,-1894.1190,13.6745,5.0);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SendClientMessage(playerid,COLOR_SUPER,"Dann mal ran an die Arbeit! Begib dich zum roten Marker, um das Geld abzuholen.");
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 11)
	{
		if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
  		if(FahrzeugInfo[tmpcar][fNebenjob] != 11)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
   		if(GetPVarInt(playerid,"ElektrikerArbeitet") == 1)
		{
  			SendClientMessage(playerid,COLOR_INFO,"Hinweis: Benutze '/auftragsliste' um zu schauen was repariert werden muss.");
   			return 1;
		}
		FahrzeugInfo[tmpcar][fJobFahrer] = playerid;
  		SetPVarInt(playerid,"ElektrikerID",tmpcar);
    	SetPVarInt(playerid,"ElektrikerArbeitet",1);
    	format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s", SpielerInfo[playerid][sName]);
    	FahrzeugInfo[tmpcar][fNebenjobDuty] = playerid;
    	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SendClientMessage(playerid,COLOR_INFO,"Hinweis: Benutze '/auftragsliste' um zu schauen was repariert werden muss.");
  		return 1;
	}
	else if(SpielerInfo[playerid][sNebenjob] == 16)
	{
		if(GetPVarInt(playerid,"LSFDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
    	if(FahrzeugInfo[tmpcar][fNebenjob] != 16)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Jobfahrzeug.");
	    if(GetPlayerVehicleSeat(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
   		if(GetPVarInt(playerid,"LSFDutyArbeitet") == 1)
		{
  			SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Bereits gestartet. Benutze '/truck' um deine Tour zu managen.");
	    	return 1;
		}
		FahrzeugInfo[tmpcar][fJobFahrer] = playerid;
  		SetPVarInt(playerid,"LSFDutyCar",tmpcar);
    	SetPVarInt(playerid,"LSFDutyArbeitet",1);
    	format(string, sizeof(string), "Jobfahrzeug von\n{FE0000}%s", SpielerInfo[playerid][sName]);
    	FahrzeugInfo[tmpcar][fNebenjobDuty] = playerid;
    	UpdateDynamic3DTextLabelText(FahrzeugInfo[tmpcar][fLabel], COLOR_WHITE, string);
		PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Benutze '/truck' um deine Tour zu managen.");
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Du erhälst am Ende jeder Tour dein Gehalt.");
		SetPlayerCheckpointEx(playerid, 2401.8530,-2674.6416,13.6662, 5.0);
  		return 1;
	}
	return 1;
}

CMD:jobstats(playerid, params[])
{
	new str[364];
	format(str,364,"\
	{FFFFFF}Pilot\t{FF0000}%d EXP{FFFFFF}\n\
	{FFFFFF}Busfahrer\t{FF0000}%d EXP{FFFFFF}\n\
	{FFFFFF}Geldlieferant\t{FF0000}%d EXP{FFFFFF}\n\
	",SpielerInfo[playerid][sJobEXP][3],SpielerInfo[playerid][sJobEXP][4],SpielerInfo[playerid][sJobEXP][10]);
	ShowPlayerDialog(playerid,9992,DIALOG_STYLE_TABLIST,"{007DFF}"SERV_NAME"{FFFFFF} - Jobstats",str,"OK","");
 	return 1;
}
CMD:jobbase(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keinen Nebenjob.");
 	if(SpielerInfo[playerid][sNebenjob] == 12 || SpielerInfo[playerid][sNebenjob] == 13 || SpielerInfo[playerid][sNebenjob] == 15)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Für deinen Nebenjob gibt es keine feste Position.");
  	if(SpielerInfo[playerid][sNebenjob] == 1)//Trucker
   	{
   		SetPlayerCheckpointEx(playerid,2130.3323,-2281.1829,20.6643,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 2)//Pizzabote
    {
    	SetPlayerCheckpointEx(playerid,2113.1394,-1769.8885,13.0996,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 3)//Kehrmaschinenfahrer
    {
    	SetPlayerCheckpointEx(playerid,1416.9246,-1648.7014,13.3828,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 4)//Pilot
   	{
    	SetPlayerCheckpointEx(playerid,1957.0295,-2183.6008,13.5469,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 5)//Busfahrer
    {
    	SetPlayerCheckpointEx(playerid,1514.1377,-2319.1445,13.3828,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 6)//Müllmann
    {
    	SetPlayerCheckpointEx(playerid,1734.5929,-2060.1526,13.5910,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 7)//Landwirt
    {
    	SetPlayerCheckpointEx(playerid,-62.7901,76.2742,3.1172,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 10)//Geldlieferant
    {
    	SetPlayerCheckpointEx(playerid,1789.4388,-1704.9324,13.5509,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 11)//Elektriker
    {
    	SetPlayerCheckpointEx(playerid,2147.0122,-1733.2238,13.5624,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 14)//Zugfahrer
    {
    	SetPlayerCheckpointEx(playerid,1747.0460,-1944.3030,13.5671,5.0);
    }
    else if(SpielerInfo[playerid][sNebenjob] == 16)//Langstreckenfahrer
    {
    	SetPlayerCheckpointEx(playerid,2504.7148,-2640.4246,13.8623,5.0);
    }
	else if(SpielerInfo[playerid][sNebenjob] == 17)//Fluglieferant
    {
    	SetPlayerCheckpointEx(playerid,1855.1876,-2557.1145,13.5469,5.0);
    }
	else if(SpielerInfo[playerid][sNebenjob] == 18)//Hochseefischer
    {
    	SetPlayerCheckpointEx(playerid,154.7544,-1852.1448,3.7734,5.0);
    }
    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Deine Jobbase wurde dir rot auf der Karte markiert.");
    return 1;
}


CMD:kuendigen(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Nebenjob.");
	if(GetPVarInt(playerid,"TruckerDuty") == 0 && GetPVarInt(playerid,"PizzaboteDuty") == 0 &&
	GetPVarInt(playerid,"KehrmaschinenDuty") == 0 && GetPVarInt(playerid,"PilotDuty") == 0 &&
	GetPVarInt(playerid,"BusfahrerDuty") == 0 && GetPVarInt(playerid,"MüllmannDuty") == 0 &&
	GetPVarInt(playerid,"LandwirtDuty") == 0 && GetPVarInt(playerid,"GeldlieferantDuty") == 0 &&
	GetPVarInt(playerid,"ElektrikerDuty") == 0)
	{
 		if(SpielerInfo[playerid][sVIP] > 0)
   		{
	    	SpielerInfo[playerid][sQuitJob] = 0;
 	    	SpielerInfo[playerid][sNebenjob] = 0;
	 	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast dein Nebenjob erfolgreich gekündigt.");
       	}
        else
        {
    		if(SpielerInfo[playerid][sQuitJob] < 3)
	    	{
 	    		new str[144];
   	    		format(str,sizeof(str),"[Info]: {FFFFFF}Du hast erst %i von 3 Paydays, um dein Nebenjob kündigen zu können.",SpielerInfo[playerid][sQuitJob]);
	    	    SendClientMessage(playerid,COLOR_RED,str);
	    	    return 1;
			}
	 		else
		 	{
    			SpielerInfo[playerid][sQuitJob] = 0;
	 	    	SpielerInfo[playerid][sNebenjob] = 0;
		 	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast dein Nebenjob erfolgreich gekündigt.");
		 	    return 1;
		 	}
		}
		return 1;
	}
	else SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Beende erst dein Nebenjob um ihn kündigen zu können.");
	return 1;
}


CMD:jc(playerid,params[])//ende
{
	new Text[128], string[144];
	if(SpielerInfo[playerid][sNebenjob] == 0)return NichtBerechtigt
	if(sscanf(params,"s[128]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/jc [Nachricht]");
	{
		if(GetPVarInt(playerid,"TruckerDuty") == 1 || GetPVarInt(playerid,"PizzaboteDuty") == 1 ||
		GetPVarInt(playerid,"KehrmaschinenDuty") == 1 || GetPVarInt(playerid,"PilotDuty") == 1 ||
		GetPVarInt(playerid,"BusfahrerDuty") == 1 || GetPVarInt(playerid,"MüllmannDuty") == 1 ||
		GetPVarInt(playerid,"LandwirtDuty") == 1 || GetPVarInt(playerid,"GeldlieferantDuty") == 1 ||
		GetPVarInt(playerid,"ElektrikerDuty") == 1 || GetPVarInt(playerid,"LSFDuty") == 1)
		{
		    if(SpielerInfo[playerid][sNebenjob] == 1)
		    {
		 		foreach(new i : Player)
		 		{
	    			if(SpielerInfo[i][sNebenjob] != 1)continue;
				    if(GetPVarInt(playerid,"TruckerDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
	  		else if(SpielerInfo[playerid][sNebenjob] == 2)
	  		{
		 		foreach(new i : Player)
		 		{
	    			if(SpielerInfo[i][sNebenjob] != 2)continue;
				    if(GetPVarInt(playerid,"PizzaboteDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 3)
	  		{
		 		foreach(new i : Player)
		 		{
	    			if(SpielerInfo[i][sNebenjob] != 3)continue;
				    if(GetPVarInt(playerid,"KehrmaschinenDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 4)
	  		{
		 		foreach(new i : Player)
		 		{
	    			if(SpielerInfo[i][sNebenjob] != 4)continue;
				    if(GetPVarInt(playerid,"PilotDuty") != 1)continue;
					format(string,128,"[Job]: %s (%d EXP): %s",SpielerInfo[playerid][sName],SpielerInfo[playerid][sJobEXP][4],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 5)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 5)continue;
				    if(GetPVarInt(playerid,"BusfahrerDuty") != 1)continue;
					format(string,128,"[Job]: %s (%d EXP): %s",SpielerInfo[playerid][sName],SpielerInfo[playerid][sJobEXP][5],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 6)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 6)continue;
				    if(GetPVarInt(playerid,"MüllmannDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 7)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 7)continue;
				    if(GetPVarInt(playerid,"LandwirtDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 10)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 10)continue;
				    if(GetPVarInt(playerid,"GeldlieferantDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
			else if(SpielerInfo[playerid][sNebenjob] == 11)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 11)continue;
				    if(GetPVarInt(playerid,"ElektrikerDuty") != 1)continue;
					format(string,128,"[Job]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
	  		else if(SpielerInfo[playerid][sNebenjob] == 16)
	  		{
		 		foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 16)continue;
				    if(GetPVarInt(playerid,"LSFDuty") != 1)continue;
					format(string,128,"[CB-Funk]: %s: %s",SpielerInfo[playerid][sName],Text);
					SendClientMessage(i,COLOR_JOB,string);
		 		}
		 		return 1;
	  		}
		}
		else
		{
		    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Nebenjob Chat ist für dich deaktiviert, da du nicht im Dienst bist.");
		    return 1;
		}
	}
	return 1;
}

CMD:jobliste(playerid, params[])
{
	new frakliste[3][128], fraklistestr[564];
	format(frakliste[0],128,"{FFFFFF}1. Trucker\n2. Pizzabote\n3. KM-Fahrer\n4. Pilot\n5. Busfahrer\n6. Müllmann\n7. Landwirt");
	format(frakliste[1],128,"{FFFFFF}8. D-(DEAKTIVIERT)\n9. W-(DEAKTIVIERT)\n10. Geldlieferant\n11. Elektriker\n12. Drogendealer");
	format(frakliste[2],128,"{FFFFFF}13. Waffendealer\n14. Zugfahrer\n15. Detektiv\n16. Langstreckenfahrer\n17. Fluglieferant\n18. Hochseefischer");
	format(fraklistestr,sizeof fraklistestr,"%s\n%s\n%s",frakliste[0],frakliste[1],frakliste[2]);
	ShowPlayerDialog(playerid,DIALOG_NULL,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Jobliste",fraklistestr,"Weiter","");
 	return 1;
}
alias:jobliste("jl")