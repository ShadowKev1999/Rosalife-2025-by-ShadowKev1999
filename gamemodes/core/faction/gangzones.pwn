stock LoadGangZones()
{
	return mysql_tquery(sqlHandle, "SELECT * FROM `gangzones` ORDER BY `GID` ASC", "onLoadGangzones");
}

forward onLoadGangzones();
public onLoadGangzones() {
    new rows, fc = 1, str[128];
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "GID", fc);
            cache_get_value_name_float(i, "GangzoneX1",GangZoneInfo[fc][gzX1]);
            cache_get_value_name_float(i, "GangzoneY1",GangZoneInfo[fc][gzY1]);  
            cache_get_value_name_float(i, "GangzoneX2",GangZoneInfo[fc][gzX2]); 
            cache_get_value_name_float(i, "GangzoneY2",GangZoneInfo[fc][gzY2]); 
            cache_get_value_name_float(i, "CTFX",GangZoneInfo[fc][gzCTFX]);
            cache_get_value_name_float(i, "CTFY",GangZoneInfo[fc][gzCTFY]);  
            cache_get_value_name_float(i, "CTFZ",GangZoneInfo[fc][gzCTFZ]); 
            cache_get_value_name_int(i, "Attacker",GangZoneInfo[fc][gzAttacker]);
            cache_get_value_name_int(i, "Type",GangZoneInfo[fc][gzType]); 
            cache_get_value_name_int(i, "Value",GangZoneInfo[fc][gzValue]);  
            cache_get_value_name_int(i, "Owner",GangZoneInfo[fc][gzOwner]);  
            cache_get_value_name_int(i, "OwnerPunkte",GangZoneInfo[fc][gzOwnerPunkte]); 
            cache_get_value_name_int(i, "AttackerPunkte",GangZoneInfo[fc][gzAttackerPunkte]);
            cache_get_value_name_int(i, "LastFight",GangZoneInfo[fc][gzLastFight]);  
            cache_get_value_name_int(i, "FightTime",GangZoneInfo[fc][gzFightTime]); 
            cache_get_value_name_int(i, "Gebiet",GangZoneInfo[fc][gzGebiet]);
            GangZoneInfo[fc][gzID] = GangZoneCreate(GangZoneInfo[fc][gzX1],GangZoneInfo[fc][gzY1],GangZoneInfo[fc][gzX2],GangZoneInfo[fc][gzY2]);
            GangZoneInfo[fc][gzBox] = CreateDynamicObject(964, GangZoneInfo[fc][gzCTFX], GangZoneInfo[fc][gzCTFY], GangZoneInfo[fc][gzCTFZ], 0, 0, 0);
            if(GangZoneInfo[fc][gzFightTime] > 0){GangZoneInfo[fc][gzTimer] = SetTimerEx("GangfightTime",60000,false,"i",fc);}
            if(GangZoneInfo[fc][gzLastFight] > 0){GangZoneInfo[fc][gzTimerLast] = SetTimerEx("LastGangFightZone",60000,true,"i",fc);}
            GangZoneInfo[fc][gzTimerWert] = SetTimerEx("WertGangFightZone",3600000,true,"i",fc);
            format(str,sizeof(str),"Gangzone der %s [ID:%d]\nTyp: %s | Wert: %d",FrakName(GangZoneInfo[fc][gzOwner]),fc,GangZoneTyp(GangZoneInfo[fc][gzType]),GangZoneInfo[fc][gzValue]);
            GangZoneInfo[fc][gzLabel] = CreateDynamic3DTextLabel(str, 0xFFC800FF, GangZoneInfo[fc][gzCTFX], GangZoneInfo[fc][gzCTFY], GangZoneInfo[fc][gzCTFZ], 15.0);
            GangZoneInfo[fc][gzErstellt] = true;
        }
    }
    printf(" Es wurde(n) %d Gangzonen erfolgreich geladen und erstellt.", rows);
    return 1;
}

stock GangZoneTyp(Typ)
{
	new typname[12];
	if(Typ == 1){typname="Geld";}
	else if(Typ == 2){typname="Materialien";}
	else if(Typ == 3){typname="Samen";}
	return typname;
}

stock getFreeGangZoneSlot()
{
	for(new mf=1;mf<MAX_GANGZONES;mf++)
    {
        if(GangZoneInfo[mf][gzErstellt] == false) return mf;
	}
	return -1;
}

stock IsPlayerInGangZoneEx(playerid)
{
    new Float:GangZone[3];
    GetPlayerPos(playerid,GangZone[0],GangZone[1],GangZone[2]);
    for(new fs = 1;fs<MAX_GANGZONES;fs++)
	{
	    if(GangZoneInfo[fs][gzErstellt] == false)continue;
    	if((GangZone[0] >= GangZoneInfo[fs][gzX2] && GangZone[0] <= GangZoneInfo[fs][gzX1]) && (GangZone[1] >= GangZoneInfo[fs][gzY2] && GangZone[1] <= GangZoneInfo[fs][gzY1]) && GangZone[2] <= 500)return fs;
	}
	return -255;
}

stock SaveGangZones()
{
	new query[230];
	for(new mf=1;mf<MAX_GANGZONES;mf++)
    {
        if(GangZoneInfo[mf][gzErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `gangzones` SET `Owner`='%d', `Attacker`='%d', `Value`='%d', `OwnerPunkte`='%d', `AttackerPunkte`='%d', `LastFight`='%d', `FightTime`='%d', `Gebiet`='%d' WHERE `GID`='%d'",
	    GangZoneInfo[mf][gzOwner],GangZoneInfo[mf][gzAttacker],GangZoneInfo[mf][gzValue],GangZoneInfo[mf][gzOwnerPunkte],GangZoneInfo[mf][gzAttackerPunkte],GangZoneInfo[mf][gzLastFight],GangZoneInfo[mf][gzFightTime],GangZoneInfo[mf][gzGebiet],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

public WertGangFightZone(Zone)//Stündlich
{
	if(GangZoneInfo[Zone][gzOwner] < 9)return 1;
    new string[100], rand;
	if(GangZoneInfo[Zone][gzType] == 1 && GangZoneInfo[Zone][gzValue] < 40000)//Geld
	{
	    if(FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGangzonenUpgrade] > 0){rand = random(1000)+4000;}
		else rand = random(1000)+2000;
	}
	else if(GangZoneInfo[Zone][gzType] == 2 && GangZoneInfo[Zone][gzValue] < 10000){rand = random(850);}//Materialien
	else if(GangZoneInfo[Zone][gzType] == 3 && GangZoneInfo[Zone][gzValue] < 45){rand = random(4)+6;}//Samen
	GangZoneInfo[Zone][gzValue] += rand;
    format(string,sizeof(string),"Gangzone der %s [ID:%d]\nTyp: %s | Wert: %d",FrakName(GangZoneInfo[Zone][gzOwner]),Zone,GangZoneTyp(GangZoneInfo[Zone][gzType]),GangZoneInfo[Zone][gzValue]);
    UpdateDynamic3DTextLabelText(GangZoneInfo[Zone][gzLabel], 0xFFC800FF, string);
    return 1;
}

public CTFTryTimeOut(Zone)
{
	GangZoneInfo[Zone][gzCTFTry] = 0;
}

public LastGangFightZone(Zone)
{
	GangZoneInfo[Zone][gzLastFight]--;
	if(GangZoneInfo[Zone][gzLastFight] == 0)
	{
	    KillTimer(GangZoneInfo[Zone][gzTimerLast]);
	}
	return 1;
}

public GangfightTime(Zone)
{
	GangZoneInfo[Zone][gzFightTime]--;
    KillTimer(GangZoneInfo[Zone][gzTimer]);
	GangZoneInfo[Zone][gzTimer] = SetTimerEx("GangfightTime",60000,false,"i",Zone);
	new gfstring[200];
	if(GangZoneInfo[Zone][gzFightTime] != 0)
	{
		foreach(new i : Player)
		{
			if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker] || SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner])
			{
			    format(gfstring,sizeof(gfstring),"Noch ~r~%d Minuten ~w~verbleibend",GangZoneInfo[Zone][gzFightTime]);
			    PlayerTextDrawSetString(i, Gangfight[i][6], gfstring);
			}
		}
		return 1;
	}
	if(GangZoneInfo[Zone][gzFightTime] < 1)
	{
	    foreach(new i : Player)
		{
			if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner] || SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker])
			{
			    PlayerTextDrawDestroy(i, Gangfight[i][0]); PlayerTextDrawDestroy(i, Gangfight[i][1]); PlayerTextDrawDestroy(i, Gangfight[i][2]);
				PlayerTextDrawDestroy(i, Gangfight[i][3]); PlayerTextDrawDestroy(i, Gangfight[i][4]); PlayerTextDrawDestroy(i, Gangfight[i][5]); PlayerTextDrawDestroy(i, Gangfight[i][6]);
			}
		}
	    FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGFAktiv] = 0;
	    FrakInfo[GangZoneInfo[Zone][gzAttacker]][fiGFAktiv] = 0;
	    KillTimer(GangZoneInfo[Zone][gzTimer]);
	    FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGangFightDisabled] = 1;
	    FrakInfo[GangZoneInfo[Zone][gzAttacker]][fiGangFightDisabled] = 1;
	    SetTimerEx("CanGangFightAgain", 3600000, false, "i", GangZoneInfo[Zone][gzOwner]);
     	SetTimerEx("CanGangFightAgain", 3600000, false, "i", GangZoneInfo[Zone][gzAttacker]);
	    if(GangZoneInfo[Zone][gzOwnerPunkte] > GangZoneInfo[Zone][gzAttackerPunkte] || GangZoneInfo[Zone][gzOwnerPunkte] == GangZoneInfo[Zone][gzAttackerPunkte])
	    {
	        format(gfstring,sizeof(gfstring),"NEWS: Die Fraktion '%s' hat Ihr Ganggebiet gegen die Fraktion '%s' mit '%d' zu '%d' Kills verteidigt!",FrakName(GangZoneInfo[Zone][gzOwner]),FrakName(GangZoneInfo[Zone][gzAttacker]),GangZoneInfo[Zone][gzOwnerPunkte],GangZoneInfo[Zone][gzAttackerPunkte]);
            SendClientMessageToAll(COLOR_GANGFIGHT,gfstring);
			foreach(new i : Player)
	    	{
	    	    UpdateGangZones(i);
				if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner])
				{
				    SendClientMessage(i,COLOR_GANGFIGHT,"[Gangfight]: {FFFFFF}Deine Fraktion hat das Gangfight gewonnen! Ihr habt euer Gebiet erfolgreich verteidigt! +5 Gangpunkte!");
				}
				else if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzAttacker])
				{
				    SendClientMessage(i,COLOR_GANGFIGHT,"[Gangfight]: {FFFFFF}Deine Fraktion hat das Gangfight verloren! Strengt euch in Zukunft mehr an!");
				}
				DeletePVar(i,"TodGFZone");
			}
			GangZoneInfo[Zone][gzAttacker] = 0;
		    GangZoneInfo[Zone][gzLastFight] = 60;
		    GangZoneInfo[Zone][gzTimerLast] = SetTimerEx("LastGangFightZone",60000,true,"i",Zone);
		    FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGangpunkte] += 5;
		}
		else if(GangZoneInfo[Zone][gzOwnerPunkte] < GangZoneInfo[Zone][gzAttackerPunkte])
		{
		    FrakInfo[GangZoneInfo[Zone][gzAttacker]][fiFrakKasse] += 50000;
		    FrakInfo[GangZoneInfo[Zone][gzOwner]][fiFrakKasse] -= 50000;
			new loser = GangZoneInfo[Zone][gzOwner];
			new loserpoints = GangZoneInfo[Zone][gzOwnerPunkte];
		    GangZoneInfo[Zone][gzOwner] = GangZoneInfo[Zone][gzAttacker];
		    GangZoneInfo[Zone][gzAttacker] = 0;
		    GangZoneInfo[Zone][gzLastFight] = 60;
		    new string[4];
			new iValue = GangZoneInfo[Zone][gzID];
			valstr(string,iValue);
			mysql_SetInt("gangzones", "Owner", GangZoneInfo[Zone][gzAttacker], "GID", string);
		    format(gfstring,sizeof(gfstring),"Gangzone der %s [ID:%d]\nTyp: %s | Wert: %d",FrakName(GangZoneInfo[Zone][gzOwner]),Zone,GangZoneTyp(GangZoneInfo[Zone][gzType]),GangZoneInfo[Zone][gzValue]);
		    UpdateDynamic3DTextLabelText(GangZoneInfo[Zone][gzLabel], 0xFFC800FF, gfstring);
		    format(gfstring,sizeof(gfstring),"NEWS: Die Fraktion '%s' hat das Ganggebiet der Fraktion '%s' mit '%d' zu '%d' Kills übernommen!",FrakName(GangZoneInfo[Zone][gzOwner]),FrakName(loser),GangZoneInfo[Zone][gzAttackerPunkte],loserpoints);
            SendClientMessageToAll(COLOR_GANGFIGHT,gfstring);
            GangZoneInfo[Zone][gzTimerLast] = SetTimerEx("LastGangFightZone",60000,true,"i",Zone);
			foreach(new i : Player)
	    	{
	    	    UpdateGangZones(i);
				if(SpielerInfo[i][sFraktion] == GangZoneInfo[Zone][gzOwner])
				{
				    SendClientMessage(i,COLOR_GANGFIGHT,"Deine Fraktion hat das Gangfight gewonnen! Ihr habt den anderen das Gebiet und 50.000$ abgeknöpft! +5 Gangpunkte!");
				}
				else if(SpielerInfo[i][sFraktion] == loser)
				{
				    SendClientMessage(i,COLOR_GANGFIGHT,"Deine Fraktion hat das Gangfight verloren! Das Ganggebiet & 50.000$ eures Fraktionskonto gehören nun nicht mehr euch!");
				}
			}
			FrakInfo[GangZoneInfo[Zone][gzOwner]][fiGangpunkte] += 5;
		}
	}
	return 1;
}

stock UpdateGangZones(playerid)
{
    for(new mf=1;mf<MAX_GANGZONES;mf++)
    {
        if(GangZoneInfo[mf][gzErstellt] == false)continue;
        GangZoneHideForPlayer(playerid, GangZoneInfo[mf][gzID]);
        GangZoneShowForPlayer(playerid, GangZoneInfo[mf][gzID], FrakZoneColor(GangZoneInfo[mf][gzOwner]));
        GangZoneStopFlashForPlayer(playerid, GangZoneInfo[mf][gzID]);
        if(GangZoneInfo[mf][gzFightTime] > 1)
        {
            GangZoneFlashForPlayer(playerid, GangZoneInfo[mf][gzID], FrakZoneColor(GangZoneInfo[mf][gzAttacker]));
        }
    }
}

stock StartGangfight(playerid)
{
    for(new mf=1;mf<MAX_GANGZONES;mf++)
    {
        if(GangZoneInfo[mf][gzErstellt] == false)continue;
        if(SpielerInfo[playerid][sFraktion] == GangZoneInfo[mf][gzAttacker] || SpielerInfo[playerid][sFraktion] == GangZoneInfo[mf][gzOwner] && GangZoneInfo[mf][gzFightTime] > 1)
        {
			PlayerTextDrawDestroy(playerid, Gangfight[playerid][0]); PlayerTextDrawDestroy(playerid, Gangfight[playerid][1]); PlayerTextDrawDestroy(playerid, Gangfight[playerid][2]);
			PlayerTextDrawDestroy(playerid, Gangfight[playerid][3]); PlayerTextDrawDestroy(playerid, Gangfight[playerid][4]); PlayerTextDrawDestroy(playerid, Gangfight[playerid][5]); PlayerTextDrawDestroy(playerid, Gangfight[playerid][6]);

			Gangfight[playerid][0] = CreatePlayerTextDraw(playerid,468.000000, 120.000000, "~r~");
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][0], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][0], TEXT_DRAW_FONT_1);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][0], 0.000000, 5.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][0], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][0], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][0], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][0], 1);
			PlayerTextDrawUseBox(playerid,Gangfight[playerid][0], true);
			PlayerTextDrawBoxColour(playerid,Gangfight[playerid][0], 16843188);
			PlayerTextDrawTextSize(playerid,Gangfight[playerid][0], 610.000000, 0.000000);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][0], false);

			Gangfight[playerid][1] = CreatePlayerTextDraw(playerid,491.000000, 113.000000, "Gangfight");
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][1], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][1], TEXT_DRAW_FONT_2);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][1], 0.400000, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][1], -4980481);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][1], 1);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][1], true);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][1], false);

			Gangfight[playerid][2] = CreatePlayerTextDraw(playerid,470.000000, 126.000000, "Grove Street Families");
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][2], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][2], TEXT_DRAW_FONT_2);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][2], 0.190000, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][2], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][2], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][2], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][2], 1);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][2], false);

			Gangfight[playerid][3] = CreatePlayerTextDraw(playerid,470.000000, 138.000000, "Rolling High Ballas");
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][3], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][3], TEXT_DRAW_FONT_2);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][3], 0.199999, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][3], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][3], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][3], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][3], 1);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][3], false);

			Gangfight[playerid][4] = CreatePlayerTextDraw(playerid,607.000000, 126.000000, "75 Kills");
			PlayerTextDrawAlignment(playerid,Gangfight[playerid][4], TEXT_DRAW_ALIGN_RIGHT);
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][4], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][4], TEXT_DRAW_FONT_2);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][4], 0.170000, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][4], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][4], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][4], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][4], 1);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][4], false);

			Gangfight[playerid][5] = CreatePlayerTextDraw(playerid,607.000000, 138.000000, "32 Kills");
			PlayerTextDrawAlignment(playerid,Gangfight[playerid][5], TEXT_DRAW_ALIGN_RIGHT);
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][5], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][5], TEXT_DRAW_FONT_2);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][5], 0.170000, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][5], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][5], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][5], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][5], 1);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][5], false);

			Gangfight[playerid][6] = CreatePlayerTextDraw(playerid,539.000000, 151.000000, "Noch ~r~19 Minuten ~w~ verbleibend");
			PlayerTextDrawAlignment(playerid,Gangfight[playerid][6], TEXT_DRAW_ALIGN_CENTER);
			PlayerTextDrawBackgroundColour(playerid,Gangfight[playerid][6], 255);
			PlayerTextDrawFont(playerid,Gangfight[playerid][6], TEXT_DRAW_FONT_3);
			PlayerTextDrawLetterSize(playerid,Gangfight[playerid][6], 0.250000, 1.000000);
			PlayerTextDrawColour(playerid,Gangfight[playerid][6], -1);
			PlayerTextDrawSetOutline(playerid,Gangfight[playerid][6], 0);
			PlayerTextDrawSetProportional(playerid,Gangfight[playerid][6], true);
			PlayerTextDrawSetShadow(playerid,Gangfight[playerid][6], 1);
			PlayerTextDrawSetSelectable(playerid,Gangfight[playerid][6], false);

            new gfstring[60];
            format(gfstring,sizeof(gfstring),"%s",FrakName(GangZoneInfo[mf][gzOwner]));
	        PlayerTextDrawSetString(playerid, Gangfight[playerid][2], gfstring);
	        format(gfstring,sizeof(gfstring),"%s",FrakName(GangZoneInfo[mf][gzAttacker]));
	        PlayerTextDrawSetString(playerid, Gangfight[playerid][3], gfstring);
	        format(gfstring,sizeof(gfstring),"%d P.",GangZoneInfo[mf][gzOwnerPunkte]);
	        PlayerTextDrawSetString(playerid, Gangfight[playerid][4], gfstring);
	        format(gfstring,sizeof(gfstring),"%d P.",GangZoneInfo[mf][gzAttackerPunkte]);
	        PlayerTextDrawSetString(playerid, Gangfight[playerid][5], gfstring);
	        format(gfstring,sizeof(gfstring),"Noch ~r~%d Minuten ~w~verbleibend",GangZoneInfo[mf][gzFightTime]);
	        PlayerTextDrawSetString(playerid, Gangfight[playerid][6], gfstring);

			PlayerTextDrawShow(playerid, Gangfight[playerid][0]); PlayerTextDrawShow(playerid, Gangfight[playerid][1]); PlayerTextDrawShow(playerid, Gangfight[playerid][2]);
			PlayerTextDrawShow(playerid, Gangfight[playerid][3]); PlayerTextDrawShow(playerid, Gangfight[playerid][4]); PlayerTextDrawShow(playerid, Gangfight[playerid][5]); PlayerTextDrawShow(playerid, Gangfight[playerid][6]);
	        UpdateGangZones(playerid);
        }
    }
    return 1;
}

stock FrakZoneColor(Fraktion)
{
    if(Fraktion == 9)return 0x00C71EA1;//Grove
    else if(Fraktion == 10)return 0xD633AFA1;//Ballas
    else if(Fraktion == 11)return 0xFFDB00A1;//Vagos
    else if(Fraktion == 12)return 0x436FFEA1;//Aztecas
    else if(Fraktion == 13)return 0x43CFFEA1;//Rifa
    else if(Fraktion == 14)return 0x002768A1;//Triads
    else if(Fraktion == 15)return 0x0A0A0AA1;//DaNangBoys
    else if(Fraktion == 16)return 0xDCDCDCA1;//Camorra
    else if(Fraktion == 17)return 0x8E744FA1;//Italian
    else if(Fraktion == 18)return 0x0A0A0AA1;//Russian
    else return 0xFFFFFF77;//keine Fraktion
}