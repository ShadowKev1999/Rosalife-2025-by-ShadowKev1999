CMD:gangzoneeditor(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new option[24];
	if(sscanf(params,"s[24]", option))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/gangzoneeditor [new | ctfpos | zone1 | zone2 | save | clear]");
	if(strcmp(option,"new",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") == 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst bereits ein neues Gebiet.");
		SetPVarInt(playerid, "Zone_Editor", 1);
		SendClientMessage(playerid, COLOR_YELLOW, "Du startest eine neue Zone, nutze /gangzoneeditor ctfpos um die Flagge zu positionieren.");
	}
	else if(strcmp(option,"ctfpos",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") != 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst derzeit kein neues Gebiet.");
		new Float:ctfPosition[3];
		GetPlayerPos(playerid, ctfPosition[0], ctfPosition[1], ctfPosition[2]);
		SetPVarFloat(playerid, "ctfx", ctfPosition[0]);
		SetPVarFloat(playerid, "ctfy", ctfPosition[1]);
		SetPVarFloat(playerid, "ctfz", ctfPosition[2]);
		SendClientMessage(playerid, COLOR_YELLOW, "Hier möchtest du also die Flagge positionieren, falls du eine andere Position wählen möchtest, nutze einfach erneut /gangzoneeditor ctfpos");
		SendClientMessage(playerid, COLOR_YELLOW, "Wenn du zufrieden mit deiner Auswahl bist, nutze /gangzoneeditor zone1 | zone2 um die Zone abzustecken.");
	}
	else if(strcmp(option,"zone1",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") != 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst derzeit kein neues Gebiet.");
		new Float:zonePos[3];
		GetPlayerPos(playerid, zonePos[0], zonePos[1], zonePos[2]);
		SetPVarFloat(playerid, "zone1x", zonePos[0]);
		SetPVarFloat(playerid, "zone1y", zonePos[1]);
		SendClientMessage(playerid, COLOR_YELLOW, "Das ist also eine Ecke der Gangzone, gehe nun diagonal zu anderen Ecke und nutze /gangzoneeditor zone2");
	}
	else if(strcmp(option,"zone2",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") != 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst derzeit kein neues Gebiet.");
		new Float:zonePos[3];
		GetPlayerPos(playerid, zonePos[0], zonePos[1], zonePos[2]);
		SetPVarFloat(playerid, "zone2x", zonePos[0]);
		SetPVarFloat(playerid, "zone2y", zonePos[1]);
		SendClientMessage(playerid, COLOR_YELLOW, "Das ist also die andere Ecke diagonal zur Zone1 Position. Nutze /gangzoneeditor save, um die Zone zu erstellen.");
	}
	else if(strcmp(option,"save",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") != 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst derzeit kein neues Gebiet.");
		new slot = getFreeGangZoneSlot();
		if(slot == -1) return SendClientMessage(playerid, COLOR_RED, "Es können keine weiteren Gangzones erstellt werden.");

		GangZoneInfo[slot][gzType] = randomEx(1, 2);
		GangZoneInfo[slot][gzGebiet] = randomEx(1, 2);

		GangZoneInfo[slot][gzX1] = GetPVarFloat(playerid, "zone1x");
		GangZoneInfo[slot][gzY1] = GetPVarFloat(playerid, "zone1y");
		GangZoneInfo[slot][gzX2] = GetPVarFloat(playerid, "zone2x");
		GangZoneInfo[slot][gzY2] = GetPVarFloat(playerid, "zone2y");

		new Float:calcZ;
		CA_FindZ_For2DCoord(GetPVarFloat(playerid, "ctfx"), GetPVarFloat(playerid, "ctfy"), calcZ);

		GangZoneInfo[slot][gzCTFX] = GetPVarFloat(playerid, "ctfx");
		GangZoneInfo[slot][gzCTFY] = GetPVarFloat(playerid, "ctfy");
		GangZoneInfo[slot][gzCTFZ] = calcZ;
		GangZoneInfo[slot][gzAttacker] = 0;
		GangZoneInfo[slot][gzValue] = 0;
		GangZoneInfo[slot][gzOwner] = 0;
		GangZoneInfo[slot][gzOwnerPunkte] = 0;
		GangZoneInfo[slot][gzAttackerPunkte] = 0;
		GangZoneInfo[slot][gzLastFight] = 0;
		GangZoneInfo[slot][gzFightTime] = 0;

		new query[512];

		mysql_format(sqlHandle, query, sizeof(query), "\
		INSERT INTO `gangzones` (`GID`, `GangzoneX1`, `GangzoneY1`, `GangzoneX2`, `GangzoneY2`, `CTFX`, `CTFY`, `CTFZ`, `Attacker`, `Type`, `Value`, `Owner`, `OwnerPunkte`, `AttackerPunkte`, `LastFight`, `FightTime`, `Gebiet`) \
		VALUES (%i, %f, %f, %f, %f, %f, %f, %f, %i, %i, %i, %i, %i, %i, %i, %i, %i)",
		slot, GangZoneInfo[slot][gzX1], GangZoneInfo[slot][gzY1], GangZoneInfo[slot][gzX2], GangZoneInfo[slot][gzY2], GangZoneInfo[slot][gzCTFX], GangZoneInfo[slot][gzCTFY],
		GangZoneInfo[slot][gzCTFZ], GangZoneInfo[slot][gzAttacker], GangZoneInfo[slot][gzType], GangZoneInfo[slot][gzValue], GangZoneInfo[slot][gzOwner],
		GangZoneInfo[slot][gzOwnerPunkte], GangZoneInfo[slot][gzAttackerPunkte], GangZoneInfo[slot][gzLastFight], GangZoneInfo[slot][gzFightTime], GangZoneInfo[slot][gzGebiet]);
		mysql_tquery(sqlHandle, query);

		GangZoneInfo[slot][gzID] = GangZoneCreate(GangZoneInfo[slot][gzX1],GangZoneInfo[slot][gzY1],GangZoneInfo[slot][gzX2],GangZoneInfo[slot][gzY2]);
		GangZoneInfo[slot][gzBox] = CreateDynamicObject(964, GangZoneInfo[slot][gzCTFX], GangZoneInfo[slot][gzCTFY], GangZoneInfo[slot][gzCTFZ], 0, 0, 0);

		GangZoneInfo[slot][gzTimerWert] = SetTimerEx("WertGangFightZone",3600000,true,"i",slot);
		new str[256];
		format(str,sizeof(str),"Gangzone der %s [ID:%d]\nTyp: %s | Wert: %d",FrakName(GangZoneInfo[slot][gzOwner]),slot,GangZoneTyp(GangZoneInfo[slot][gzType]),GangZoneInfo[slot][gzValue]);
		GangZoneInfo[slot][gzLabel] = CreateDynamic3DTextLabel(str, 0xFFC800FF, GangZoneInfo[slot][gzCTFX], GangZoneInfo[slot][gzCTFY], GangZoneInfo[slot][gzCTFZ], 15.0);
		GangZoneInfo[slot][gzErstellt] = true;

		SendClientMessage(playerid, COLOR_YELLOW, "Gangzone erfolgreich erstellt!!!!");
	}
	else if(strcmp(option,"clear",true)==0)
	{
		if(GetPVarInt(playerid, "Zone_Editor") != 1) return SendClientMessage(playerid, COLOR_RED, "Du erstellst derzeit kein neues Gebiet.");
		DeletePVar(playerid, "Zone_Editor");
		DeletePVar(playerid, "zone1x");
		DeletePVar(playerid, "zone1y");
		DeletePVar(playerid, "zone2x");
		DeletePVar(playerid, "zone2y");
		DeletePVar(playerid, "ctfx");
		DeletePVar(playerid, "ctfy");
		DeletePVar(playerid, "ctfz");
		SendClientMessage(playerid, COLOR_YELLOW, "Alle bisherigen Positionen zurückgesetzt.");
	}
	return 1;
}

CMD:ctf(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] < 9)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du bist in keiner Gang / Mafia.");
	new Zone = IsPlayerInGangZoneEx(playerid);
	if(Zone < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Ganggebiet.");
	if(GangZoneInfo[Zone][gzFightTime] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Hier wird zurzeit nicht gekämpft!");
	if(GangZoneInfo[Zone][gzCTFTry] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Die Flagge kann noch nicht erobert werden (nur alle 4 Minuten)!");
	if(!IsPlayerInRangeOfPoint(playerid,7.0,GangZoneInfo[Zone][gzCTFX],GangZoneInfo[Zone][gzCTFY],GangZoneInfo[Zone][gzCTFZ]))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du bist nicht an der Gebietbox!");
	if(SpielerInfo[playerid][sFraktion] == GangZoneInfo[Zone][gzOwner] || SpielerInfo[playerid][sFraktion] == GangZoneInfo[Zone][gzAttacker])
	{
		GangZoneInfo[Zone][gzCTFTry] = 1;
  		SetTimerEx("CTFTryTimeOut",240000,false,"d",Zone);
  		new string[128], anzeige[16], anzeige2[16];
    	format(string,sizeof(string),"[GANGFIGHT] %s hat die Flagge erobert! +1 Kill %s!",SpielerInfo[playerid][sName],FrakName(SpielerInfo[playerid][sFraktion]));
		if(SpielerInfo[playerid][sFraktion] == GangZoneInfo[Zone][gzOwner]){GangZoneInfo[Zone][gzOwnerPunkte]++;}
		else if(SpielerInfo[playerid][sFraktion] == GangZoneInfo[Zone][gzAttacker]){GangZoneInfo[Zone][gzAttackerPunkte]++;}
		format(anzeige,sizeof(anzeige),"%d KILLS",GangZoneInfo[Zone][gzOwnerPunkte]); format(anzeige2,sizeof(anzeige2),"%d P.",GangZoneInfo[Zone][gzAttackerPunkte]);
		foreach(new i : Player)
  		{
    		if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner] || SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker])
      		{
        		SendClientMessage(i,COLOR_GANGFIGHT,string);
          		PlayerTextDrawSetString(i, Gangfight[i][4], anzeige);
            	PlayerTextDrawSetString(i, Gangfight[i][5], anzeige2);
        	}
    	}
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Deine Gang / Mafia ist nicht an diesem Gangfight beteiltigt!");
	return 1;
}
CMD:gebietinfo(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] < 9 || SpielerInfo[playerid][sFraktion] == 19)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keiner Gang.");
 	new Zone = IsPlayerInGangZoneEx(playerid);
	if(Zone == -255)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Ganggebiet.");
	if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
	if(GangZoneInfo[Zone][gzOwner] == SpielerInfo[playerid][sFraktion])
	{
 		SetPVarInt(playerid,"GBInfoZone",Zone);
   		ShowPlayerDialog(playerid,DIALOG_GEBIET,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Gebietverwaltung","Gebietinfo\nWert auszahlen","Weiter","Schliessen");
	}
	else
	{
 		SetPVarInt(playerid,"GBInfoZone",Zone);
   		ShowPlayerDialog(playerid,DIALOG_GEBIET,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Gebietverwaltung","Gebietinfo","Weiter","Schliessen");
	}
	return 1;
}
CMD:gangfight(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] < 9 || SpielerInfo[playerid][sFraktion] == 19)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keiner Gang.");
 	if(!IsAllowedForCommand(playerid,"Gangfight"))return KeinRang
	new gfhour, gfmin, gfsec;
	gettime(gfhour, gfmin, gfsec);
	if(gfhour < 8)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Gangfights sind zwischen 0 Uhr und 8 Uhr nicht möglich.");

	new Zone = IsPlayerInGangZoneEx(playerid);
	if(Zone < 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Ganggebiet.");
	if(GangZoneInfo[Zone][gzGebiet] == 1)
	{
 		if(SpielerInfo[playerid][sFraktion] == 17 || SpielerInfo[playerid][sFraktion] == 18)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dies ist ein Ganggebiet & kein Mafiengebiet.");
	}
	else if(GangZoneInfo[Zone][gzGebiet] == 2)
	{
		if(SpielerInfo[playerid][sFraktion] > 8 && SpielerInfo[playerid][sFraktion] < 17)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dies ist ein Mafiengebiet & kein Ganggebiet.");
	}
	if(GangZoneInfo[Zone][gzOwner] > 8 && GangZoneInfo[Zone][gzOwner] < 19)
	{
		if(SpielerInfo[playerid][sFraktion] == GangZoneInfo[Zone][gzOwner])return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Ganggebiet ist bereits in eurer Gewalt.");
		if(GangZoneInfo[Zone][gzLastFight] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Ganggebiet hatte gerade einen Kampf hinter sich.");
		if(GangZoneInfo[Zone][gzAttacker] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Ganggebiet wird bereits angegriffen.");
		if(FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGFAktiv] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Gebietbesitzer haben bereits einen anderen Gangfight.");
		if(FrakInfo[SpielerInfo[playerid][sFraktion]][fiGFAktiv] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Ihr habt bereits einen Gangfight!");
		if(FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGangFightDisabled] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die hier herrschende Gang hatte erst kürzlich ein Gangfight.");
		if(FrakInfo[GangZoneInfo[Zone][gzAttacker]][fiGangFightDisabled] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Gang hatte erst kürzlich ein Gangfight (ca. 60 Minuten Wartezeit).");
		new owner, angreifer;
		foreach(new i : Player)
		{
  			if(SpielerInfo[i][sFraktion] < 9 || SpielerInfo[i][sFraktion] == 19)continue;
   			if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner] && GetPVarInt(i,"AdminDuty") < 1 && GetPVarInt(i,"IsAutoAFK") < 1)
		    {
				owner++;
    		}
		    if(SpielerInfo[i][sFraktion] == SpielerInfo[playerid][sFraktion])
		    {
      			angreifer++;
		    }
		}
		if(angreifer < 0 && owner < 0)
		{
			new string[212], string2[212], string3[200], gfstring[60], gfstring2[60];
			GangZoneInfo[Zone][gzAttacker] = SpielerInfo[playerid][sFraktion];
			GangZoneInfo[Zone][gzOwnerPunkte] = 0;
			GangZoneInfo[Zone][gzAttackerPunkte] = 0;
			format(string,sizeof(string),"[Gangfight]: {FFFFFF}Die Fraktion %s greift eines euer Ganggebiete an! Schaltet Sie aus, oder Ihr verliert 50.000$ und das Gebiet!",FrakName(SpielerInfo[playerid][sFraktion]));
   			format(string2,sizeof(string2),"[Gangfight]: {FFFFFF}Ihr habt ein Gangfight gegen die %s gestartet! Schaltet Sie aus und Ihr gewinnt 50.000$ und das Gebiet!",FrakName(GangZoneInfo[Zone][gzOwner]));
      		format(string3,sizeof(string3),"[Gangfight]: {FFFFFF}%s & %s befinden sich nun in einem Gangfight.",FrakName(GangZoneInfo[Zone][gzOwner]),FrakName(GangZoneInfo[Zone][gzAttacker]));
			format(gfstring,sizeof(gfstring),"%s",FrakName(GangZoneInfo[Zone][gzOwner]));
			format(gfstring2,sizeof(gfstring2),"%s",FrakName(GangZoneInfo[Zone][gzAttacker]));
			FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGFAktiv] = 1;
			FrakInfo[GangZoneInfo[Zone][gzAttacker]][fiGFAktiv] = 1;
			GangZoneInfo[Zone][gzFightTime] = 35;
			GangZoneInfo[Zone][gzTimer] = SetTimerEx("GangfightTime",60000,false,"i",Zone);
			GangZoneInfo[Zone][gzCTFTry] = 1;
			SetTimerEx("CTFTryTimeOut",240000,false,"d",Zone);
			foreach(new i : Player)
			{
   				if(SpielerInfo[i][sFraktion] == 2 || SpielerInfo[i][sFraktion] == 6)
			    {
       				SendClientMessage(i,COLOR_GANGFIGHT,string3);
			    }

				UpdateGangZones(i);
    			if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner] || SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker])
			    {
       				StartGangfight(i);
			    }
			    if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner])
			    {
       				SendClientMessage(i,COLOR_GANGFIGHT,string);
			    }
			    else if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker])
			    {
       				SendClientMessage(i,COLOR_GANGFIGHT,string2);
				}
   				PlayerTextDrawSetString(playerid, Gangfight[playerid][6], "Noch ~r~35 Minuten ~w~verbleibend");
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es müssen min. 1 Gegner & min. 1 Member aus deiner Fraktion verfügbar sein.");
		return 1;
	}
	else
	{
 		GangZoneInfo[Zone][gzOwner] = SpielerInfo[playerid][sFraktion];
   		SendClientMessage(playerid,COLOR_GANGFIGHT,"[Gangfight]: {FFFFFF}Dieses Ganggebiet gehört nun euch! Verteidigt es in Zukunft mit eurem Leben!");
	    new string[4];
		new iValue = GangZoneInfo[Zone][gzID];
		valstr(string,iValue);
  		mysql_SetInt("gangzones", "Owner", SpielerInfo[playerid][sFraktion], "GID", string);
    	return 1;
	}
}


CMD:gangwars(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] >= 9 && SpielerInfo[playerid][sFraktion]  < 19)
 	{
 		new string[128], idlisted[18] = 0;
   		SendClientMessage(playerid,COLOR_GREEN,"Alle aktuellen Gangwars:");
     	for(new id = 0; id < 19; id++)
		{
  			if(FrakInfo[id][fiWarGegner] > 0 && idlisted[FrakInfo[id][fiWarGegner]] != 1)
	    	{
      			idlisted[FrakInfo[id][fiWarGegner]] = 1;
       			format(string,sizeof(string),"%s vs. %s | %d zu %d Kills!",FrakName(id),FrakName(FrakInfo[id][fiWarGegner]),FrakInfo[id][fiWarPoints],FrakInfo[FrakInfo[id][fiWarGegner]][fiWarPoints]);
		        SendClientMessage(playerid,COLOR_GREY,string);
	    	}
		}
  		return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du bist in keiner Gang/Mafia!");
	return 1;
}