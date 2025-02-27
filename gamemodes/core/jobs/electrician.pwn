
public ReparaturVorgang(playerid)
{
	new payday[164];
	TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);

	if(GetPVarInt(playerid,"ReparaturArt") == 1)//Bankautomat
	{
	    new id = ATMID(playerid);
		DestroyDynamicObject(ATMInfo[id][atmRauch]);
		ATMInfo[id][atmRauch] = INVALID_OBJECT_ID;
		ATMInfo[id][atmKaputt] = 0;
		SaveATMById(id);

    	SetPVarInt(playerid,"ElektrikerGehalt",GetPVarInt(playerid,"ElektrikerGehalt")+750);
    	format(payday,sizeof(payday),"[JOB]: {FFFFFF}Dir werden +${FF0000}750{9ACD32} am nächsten PayDay ausgezahlt, sofern du dein Job beendet hast.");
	}
	else if(GetPVarInt(playerid,"ReparaturArt") == 2)//Blitzer
	{
 		new id = BlitzerID(playerid);
		DestroyDynamicObject(Blitzer[id][Rauch]);
		Blitzer[id][Rauch] = INVALID_OBJECT_ID;
		Blitzer[id][Kaputt] = 0;

		SetPVarInt(playerid,"ElektrikerGehalt",GetPVarInt(playerid,"ElektrikerGehalt")+900);
    	format(payday,sizeof(payday),"[JOB]: {FFFFFF}Dir werden +${FF0000}900{9ACD32} am nächsten PayDay ausgezahlt, sofern du dein Job beendet hast.");
	}
	DeletePVar(playerid,"ReparaturArt");
	SendClientMessage(playerid,COLOR_SUPER,payday);
}

public AReparaturVorgang(playerid)
{
	TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);

	if(GetPVarInt(playerid,"AReparaturArt") == 1)//Bankautomat
	{
	    new id = ATMID(playerid);
		DestroyDynamicObject(ATMInfo[id][atmRauch]);
		ATMInfo[id][atmRauch] = INVALID_OBJECT_ID;
		ATMInfo[id][atmKaputt] = 0;
		SaveATMById(id);
	}
	else if(GetPVarInt(playerid,"AReparaturArt") == 2)//Blitzer
	{
 		new id = BlitzerID(playerid);
		DestroyDynamicObject(Blitzer[id][Rauch]);
		Blitzer[id][Rauch] = INVALID_OBJECT_ID;
		Blitzer[id][Kaputt] = 0;
	}
	DeletePVar(playerid,"AReparaturArt");
}


public WerkzeugHolen(playerid)
{
    new vehicleid = GetPVarInt(playerid,"ElektrikerID");
    TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);
    Kofferraum[vehicleid] = false;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, false, objective);

	if(GetPVarInt(playerid,"HoleWerkzeug") == 1)//Hammer
	{
 		SetPVarInt(playerid,"WerkzeugInHand",1);
    	SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,18635,6,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
	}
	else if(GetPVarInt(playerid,"HoleWerkzeug") == 2)//Schraubendreher
	{
		SetPVarInt(playerid,"WerkzeugInHand",2);
    	SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,18644,6,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,1.000000,1.000000);
	}
}

public WerkzeugReinlegen(playerid)
{
   	new vehicleid = GetPVarInt(playerid,"ElektrikerID");
    TogglePlayerControllable(playerid, true);
    ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0);
    DeletePVar(playerid,"WerkzeugInHand");
    RemovePlayerAttachedObject(playerid, ATTACH_INDEX_JOB);
    Kofferraum[vehicleid] = false;
    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, false, objective);
}



public RandomDefekte()
{
	new rand1 = random(2), string[128];
	switch(rand1)
	{
	    case 0://Blitzer
		{
			new counter = 0;
		    new DestroyBlitzer[MAX_BLITZER];
			for(new blitzerid=1;blitzerid<MAX_BLITZER;blitzerid++)
			{
				if(Blitzer[blitzerid][Erstellt] == false)continue;
		 		if(Blitzer[blitzerid][Kaputt] == 1)continue;
			    DestroyBlitzer[counter] = blitzerid;
			    counter++;
			}
			if(counter > 0)
			{
			    new rand, bid;

				if(counter == 1) {
				  	bid = DestroyBlitzer[0];
			  	} else {
					rand = random(counter-1);
				  	bid = DestroyBlitzer[rand];
			  	}

		   		Blitzer[bid][Kaputt] = 1;
		   		Blitzer[bid][Rauch] = CreateDynamicObject(18727, Blitzer[bid][oPosX], Blitzer[bid][oPosY], Blitzer[bid][oPosZ]-2, 0.0, 0.0, 0.0);

				foreach(new i : Player)
		 		{
		 		    if(SpielerInfo[i][sNebenjob] != 11)continue;
				    if(GetPVarInt(i,"ElektrikerDuty") != 1)continue;
					format(string,sizeof(string),"Hinweis: Blitzer Nr.%d ist gerade ausgefallen. Benutze '/auftragsliste' um ihn zu orten",bid);
					SendClientMessage(i,COLOR_INFO,string);
		 		}
			}
		}
		case 1://Bankautomaten
		{
		    new counter = 0;
		    new DestroyATM[MAX_ATMS];
			for(new atm = 1; atm < MAX_ATMS; atm++)
			{
				if(!ATMInfo[atm][atmCreated]) continue;
			    if(ATMInfo[atm][atmKaputt] == 1)continue;
				if(ATMInfo[atm][atmInterior]) continue;
			    DestroyATM[counter] = atm;
			    counter++;
			}
			if(counter > 0)
			{
			    new rand, atmid;

				if(counter == 1) {
				  	atmid = DestroyATM[0];
			  	} else {
					rand = random(counter-1);
				  	atmid = DestroyATM[rand];
			  	}
				
				if(!ATMInfo[atmid][atmCreated]) return 1;
				if(ATMInfo[atmid][atmInterior]) return 1;

				ATMInfo[atmid][atmKaputt] = 1;
				ATMInfo[atmid][atmRauch] = CreateDynamicObject(18727, ATMInfo[atmid][atmPos_X], ATMInfo[atmid][atmPos_Y], ATMInfo[atmid][atmPos_Z]-2, 0.0, 0.0, 0.0);
				SaveATMById(atmid);

				foreach(new i : Player)
				{
				    if(SpielerInfo[i][sNebenjob] != 11)continue;
				    if(GetPVarInt(i,"ElektrikerDuty") != 1)continue;
					format(string,sizeof(string),"Hinweis: Bankautomat Nr.%d ist gerade ausgefallen. Benutze '/auftragsliste' um ihn zu orten",atmid);
					SendClientMessage(i,COLOR_INFO,string);
				}
			}
		}
	}
	return 1;
}