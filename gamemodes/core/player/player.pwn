stock CreateAccount(playerid, pass[])
{
	new query[256],Name[MAX_PLAYER_NAME],DaTum[64];
    GetPlayerName(playerid, Name, MAX_PLAYER_NAME);
    getdate(Year, Month, Day);
	if(Day < 10){format(DaTum,sizeof(DaTum),"0%d.%02d.%02d",Day, Month, Year);}
	else if(Day > 9){format(DaTum,sizeof(DaTum),"%d.%02d.%02d",Day, Month, Year);}
 	mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `accounts` WHERE `Name` = '%s'", Name);
	mysql_tquery(sqlHandle, query);
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `accounts` (`Name`, `Passwort`, `Registerdatum`, `IP-Adresse`) VALUES ('%s', '%s', '%s', '%s')", Name, pass, DaTum, SpielerInfo[playerid][sIPAdresse]);
    mysql_tquery(sqlHandle, query, "onPlayerAccountCreated", "i", playerid);
	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `accounts` SET `Connected` = NOW(), `Kampfstyle` = '1' WHERE `Name` = '%s'",Name);
	mysql_tquery(sqlHandle, query);
	SetPlayerScore(playerid,1);
	SpielerInfo[playerid][sEXPNeeded] = 400;
	SpielerInfo[playerid][sKampfstyle] = 1;
	SpielerInfo[playerid][icpHandy] = 1;
	SpielerInfo[playerid][icpBlinker] = 0;
	GivePlayerMoneyEx(playerid,3500);
	SetPlayerColor(playerid,COLOR_WHITE);
	SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
	KillTimer(PayDayTimer[playerid]);
	PayDayTimer[playerid] = SetTimerEx("PayDay",60000,true,"i",playerid);
	KillTimer(AC_Check[playerid]);
	AC_Check[playerid] = SetTimerEx("AC_CheckStatus",1000,true,"i",playerid);
	KillTimer(Afktimer[playerid]);
	Afktimer[playerid] = SetTimerEx("Afktimered",60000, true,"i",playerid);
    return true;
}

forward onPlayerAccountCreated(playerid);
public onPlayerAccountCreated(playerid) {
	SpielerInfo[playerid][sDBID] = cache_insert_id();

	addServerTimelineEvent(TIMELINE_TAG_USER_REG, SpielerInfo[playerid][sDBID], "hat sich auf dem Gameserver registriert.");
	addPlayerProtocoll(playerid);
	return 1;
}

stock GetPlayerWantedLevelEx(playerid)
{
	return SpielerInfo[playerid][sWanteds];
}

stock FScheinInfo(Variable)
{
    new status[30];
    if(Variable == 0){status="Fehlt";}
    else {status="Vorhanden";}
    return status;
}

stock MissionenInfo(Variable)
{
    new status[30];
    if(Variable == 0){status="{FF0000}Offen{FFFFFF}";}
    else {status="{9ACD32}Erfüllt{FFFFFF}";}
    return status;
}


stock SetPlayerWantedLevelEx(playerid,Anzahl)
{
	SpielerInfo[playerid][sWanteds] = Anzahl;
	if(SpielerInfo[playerid][sWanteds] > 0)
	{
		new string[10];
		format(string,sizeof(string),"%d ]",SpielerInfo[playerid][sWanteds]);
		PlayerTextDrawHide(playerid,WantedDraw[playerid]);
		PlayerTextDrawSetString(playerid, WantedDraw[playerid], string);
		PlayerTextDrawShow(playerid,WantedDraw[playerid]);
	}
	else if(SpielerInfo[playerid][sWanteds] <= 0)
	{
	    PlayerTextDrawHide(playerid,WantedDraw[playerid]);
	}
	return 1;
}

stock SpawnPlayerEx(playerid)
{
    if(IsPlayerInAnyVehicle(playerid))
    {
        new tmpcar = GetPlayerVehicleID(playerid);
        if(FahrzeugInfo[tmpcar][fFraktion] == 0 && FahrzeugInfo[tmpcar][fGruppe] == 0 && strlen(FahrzeugInfo[tmpcar][fBesitzer]) == 0){SetVehicleParamsEx(tmpcar,engine,lights,alarm,false,bonnet,boot,objective);}
        new Float:pX, Float:pY, Float:pZ;
        GetPlayerPos(playerid,pX,pY,pZ);
        SetPlayerPos(playerid,pX,pY,pZ+5);
        SetTimerEx("OnPlayerSpawn",10,false,"i",playerid);
    }
    else
	{
		SpawnPlayer(playerid);
	}
    return 1;
}

stock ShowStats(playerid, targetid)
{
    new stats[1024], PayDayTime = 45-SpielerInfo[targetid][sPayDay];

    //Name
    format(stats,sizeof(stats),"%s",SpielerInfo[targetid][sName]);
    PlayerTextDrawSetString(playerid, StatsDraw[playerid][3], stats);

    //Aktueller Skin (Links)
    PlayerTextDrawSetPreviewModel(playerid, StatsDraw[playerid][4], GetPlayerSkin(targetid));

    //Fortschritt
	format(stats,sizeof(stats),"Level: %d~n~EXP: %d/%d~n~Noch ~g~%d Minuten~w~ bis zum Payday~n~Paintball: %d Kills - %d Tode",GetPlayerScore(targetid),SpielerInfo[targetid][sEXP],SpielerInfo[targetid][sEXPNeeded],PayDayTime,SpielerInfo[targetid][sPBKills],SpielerInfo[targetid][sPBTode]);
	PlayerTextDrawSetString(playerid, StatsDraw[playerid][6], stats);

	//Fraktion und Nebenjob
	new GehaltRang[32], FrakID[3];
    format(GehaltRang,sizeof(GehaltRang),"Gehalt_Rang%d",SpielerInfo[targetid][sRank]);
    format(FrakID,sizeof(FrakID),"%d",SpielerInfo[targetid][sFraktion]);
    new Gehalt = mysql_GetInt("frakinfos", GehaltRang, "FID", FrakID);

	format(stats,sizeof(stats),"Fraktion: %s~n~Rang: %s~n~Gehalt: ~g~%d$",FrakKurzel(SpielerInfo[targetid][sFraktion]),RangName(targetid),Gehalt);
	PlayerTextDrawSetString(playerid, StatsDraw[playerid][8], stats);

	format(stats,sizeof(stats),"Nebenjob: %s~n~Scheck: ~g~%d$",JobName(SpielerInfo[targetid][sNebenjob]),SpielerInfo[targetid][sPayDayGeld]);
	PlayerTextDrawSetString(playerid, StatsDraw[playerid][9], stats);

	//Allgemeine Informationen
	format(stats,sizeof(stats),"Verwarnungen: %d~n~Fraktionssperre: %s~w~~n~Kongressmitglied: %s~n~Senator: %s",SpielerInfo[targetid][sWarns],JaNein(SpielerInfo[targetid][sFrakSperre]),JaNein(SpielerInfo[targetid][sKongress]),JaNein(SpielerInfo[targetid][sSenator]));
    PlayerTextDrawSetString(playerid, StatsDraw[playerid][11], stats);

    //Weiteres - Ohne Titel
	new statsone[128], statstwo[128];
		//Gruppe
	if(SpielerInfo[targetid][sGruppe] < 1){format(statsone,sizeof(statsone),"Du bist in keiner Gruppe");}
	else {format(statsone,sizeof(statsone),"Du bist in der Gruppe ~g~%s~w~",GruppenInfo[SpielerInfo[targetid][sGruppe]][gName]);}
	    //Adminrang
	if(SpielerInfo[targetid][sAdmin] < 1){format(statstwo,sizeof(statstwo),"Du bist kein Teammitglied");}
	else {format(statstwo,sizeof(statstwo),"Du bist %s",AdminName(targetid));}

	format(stats,sizeof(stats),"%s - %s",statsone,statstwo);
	PlayerTextDrawSetString(playerid, StatsDraw[playerid][15], stats);

	//Job-Skin (Rechts)
	PlayerTextDrawSetPreviewModel(playerid, StatsDraw[playerid][17], JobSkin(SpielerInfo[targetid][sNebenjob]));

	// ---------------- Textdraw-Anzeige --------------- //
	for(new x = 0; x < 18; x++)
	{
	    PlayerTextDrawShow(playerid, StatsDraw[playerid][x]);
	}
	return 1;
}

stock HideStatsTextDraws(playerid)
{
	for(new x = 0; x < 18; x++){PlayerTextDrawHide(playerid,StatsDraw[playerid][x]);}
	return 1;
}

stock GetGeschlecht(playerid)
{
	new geschl[24];
	switch(SpielerInfo[playerid][sGeschlecht])
	{
		case 1:{geschl="Männlich";}
		case 2:{geschl="Weiblich";}
	}
	return geschl;
}

stock ShowPlayerStats(playerid)
{
    for(new id = 0; id < 23; id++)
    {
		PlayerTextDrawShow(playerid, StatsDraw[playerid][id]);
	}
	return 1;
}

stock HidePlayerStats(playerid)
{
	for(new id = 0; id < 23; id++)
    {
    	PlayerTextDrawHide(playerid, StatsDraw[playerid][id]);
	}
	return 1;
}

stock ResetPlayerMoneyEx(playerid)
{
	if(!IsPlayerConnectedEx(playerid))return 1;
	AnticheatInfo[playerid][sBargeld] = 0;
	setMoneyDraw(playerid, 0;
	return ResetPlayerMoney(playerid);
}

stock GetPlayerMoneyEx(playerid)
{
	if(!IsPlayerConnectedEx(playerid))return 1;
	return AnticheatInfo[playerid][sBargeld];
}

stock SetPlayerHealthEx(playerid, Float: health)
{
    AnticheatInfo[playerid][sStopAC][0] = 3;
    AnticheatInfo[playerid][sSetHealth] = true;
    AnticheatInfo[playerid][sHealth] = health;
    return SetPlayerHealth(playerid, health);
}

stock GivePlayerMoneyEx(playerid, money)
{
	if(!IsPlayerConnectedEx(playerid))return 1;
	new logstr[128];
    new string[11];
    if(GetPlayerMoneyEx(playerid) > 1000000 && SpielerInfo[playerid][sAchivMillion] < 1)
    {
        ShowAchievement(playerid,"Besitze eine Millionen Dollar in Bar","+ 100 EXP");
        GivePlayerEXP(playerid,100);
        SpielerInfo[playerid][sAchivMillion] = 1;
    }
	if(money > 0)
	{
	    format(string,sizeof(string),"~g~+%d$",money);
		PlayerTextDrawSetString(playerid,PlusMinusTD[playerid],string);
		PlayerTextDrawShow(playerid,PlusMinusTD[playerid]);
		SetTimerEx("PlusMinusHide",2000,false,"i",playerid);

		format(logstr,sizeof(logstr),"%s hat $%d Bargeld erhalten.",SpielerInfo[playerid][sName],money);
	    CreateServerLogEntry("BARGELD_LOG", logstr);
	}
	else if(money < 0)
	{
	    format(string,sizeof(string),"~r~%d$",money);
		PlayerTextDrawSetString(playerid,PlusMinusTD[playerid],string);
		PlayerTextDrawShow(playerid,PlusMinusTD[playerid]);
		SetTimerEx("PlusMinusHide",2000,false,"i",playerid);

		if(SpielerInfo[playerid][sPayBackCard] > 0)
		{
			new paybpunkte = abs(money) / 50;
			if(paybpunkte > 2 && GetPVarInt(playerid,"NoPAYBACK") < 1)
			{
			    PlayerTextDrawSetString(playerid, PaybackKarte[playerid], SpielerInfo[playerid][sName]);
				for(new i = 0; i < 12; i++)
				{
				    TextDrawShowForPlayer(playerid, PaybackCardTD[i]);
				}
				PlayerTextDrawShow(playerid, PaybackKarte[playerid]);
				SetTimerEx("HidePaybackCard", 5500, false, "i", playerid);
				new stringpb[128];
				format(stringpb,sizeof(stringpb),"[PAYBACK]: {FFFFFF}Du hast soeben +%d PAYPACK-Punkte erworben.",paybpunkte);
				SendClientMessage(playerid,COLOR_BLUE,stringpb);
				SpielerInfo[playerid][sPayBackPunkte] += paybpunkte;
			}
			DeletePVar(playerid,"NoPAYBACK");
		}

		format(logstr,sizeof(logstr),"%s hat $%d Bargeld verloren.",SpielerInfo[playerid][sName],money);
	    CreateServerLogEntry("BARGELD_LOG", logstr);
	}

	AnticheatInfo[playerid][sSetMoney] = true;
	AnticheatInfo[playerid][sBargeld] += money;

	setMoneyDraw(playerid, AnticheatInfo[playerid][sBargeld]);
	return GivePlayerMoney(playerid, money);
}

stock DestroyPayDayTextdraw(playerid) {
    PlayerTextDrawDestroy(playerid,SpielerInfo[playerid][ptPayDay]);
    return 1;
}
stock CreatePayDayTextdraw(playerid) {
    SpielerInfo[playerid][ptPayDay] = CreatePlayerTextDraw(playerid, 540.0, 12.0, "PayDay");
    PlayerTextDrawBackgroundColour(playerid,SpielerInfo[playerid][ptPayDay], 255);
    PlayerTextDrawFont(playerid,SpielerInfo[playerid][ptPayDay], TEXT_DRAW_FONT_3);
    PlayerTextDrawLetterSize(playerid,SpielerInfo[playerid][ptPayDay], 0.28, 1.0);
    PlayerTextDrawColour(playerid,SpielerInfo[playerid][ptPayDay], -1);
    PlayerTextDrawSetOutline(playerid,SpielerInfo[playerid][ptPayDay], 1);
    PlayerTextDrawSetProportional(playerid,SpielerInfo[playerid][ptPayDay], true);
    PlayerTextDrawAlignment(playerid, SpielerInfo[playerid][ptPayDay], TEXT_DRAW_ALIGN_RIGHT);
    UpdatePayDayTextdraw(playerid);
    return 1;
}
stock UpdatePayDayTextdraw(playerid) {
    new String[64];
    format(String,sizeof(String),"~b~~h~~h~PayDay in: ~w~~h~~h~%d ~b~~h~~h~Min", 45 - SpielerInfo[playerid][sPayDay]);
    PlayerTextDrawSetString(playerid,SpielerInfo[playerid][ptPayDay],String);
    return 1;
}

stock OnlineByName(const string[])
{
	foreach(new i : Player)
	{
		if(IsPlayerConnected(i))
		{
			if(strcmp(string, SpielerInfo[i][sName], true, strlen(string)) == 0)
			{
				return 1;
			}
		}
	}
	return 0;
}


stock SaveAccount(playerid)
{
    if(!IsPlayerNPC(playerid) && GetPVarInt(playerid,"LoggedIn") == 1 && GetPVarInt(playerid,"ServerPasswort") == 0 && GetPVarInt(playerid,"acc_locked") < 1)
    {
        if(GetPVarInt(playerid,"SWATDuty") > 0)
        {
            SetPlayerName(playerid,SwatDutyName[playerid]);
        }

        if(GetPVarInt(playerid,"CopUndercover") > 0)
        {
            SpielerInfo[playerid][sHandy] = GetPVarInt(playerid,"RealHandyNummer");
        }

		new query[900], query1[128], stringzusammen[900], uhrzeit[64], datum[64];
	    gettime(Hour, Minute, Second);
		getdate(Year, Month, Day);
		format(datum,sizeof(datum),"%d.%02d.%02d",Day,Month,Year);
		format(uhrzeit,sizeof(uhrzeit),"%02d:%02d",Hour,Minute);

		GetPlayerPos(playerid,SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ]);
		GetPlayerFacingAngle(playerid,SpielerInfo[playerid][sPosA]);
		mysql_format(sqlHandle, query1,sizeof(query1),"UPDATE `accounts` SET `Connected` = NOW(), `Datum` = '%s', `Uhrzeit` = '%s' WHERE `Name` = '%s'",datum,uhrzeit,SpielerInfo[playerid][sName]);
		mysql_tquery(sqlHandle, query1);


		if(GetPVarInt(playerid,"CopDuty") == 1)
		{
		    DeletePVar(playerid,"CopDuty");
		    CopDuty--;
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid,0);
	        SetPlayerColor(playerid,COLOR_WHITE);
	        SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
			KillTimer(PDEquiptTimer[playerid]);
		}
		else if(GetPVarInt(playerid,"FBIDuty") == 1)
		{
		    DeletePVar(playerid,"FBIDuty");
		    FBIDuty--;
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid,0);
	        SetPlayerColor(playerid,COLOR_WHITE);
	        SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
			KillTimer(PDEquiptTimer[playerid]);
		}
		else if(GetPVarInt(playerid,"MedicDuty") == 1)
		{
			DeletePVar(playerid,"MedicDuty");
			MedicDuty--;
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid,0);
	        SetPlayerColor(playerid,COLOR_WHITE);
	        SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
		}
		else if(GetPVarInt(playerid,"FeuerwehrDuty") == 1)
		{
			DeletePVar(playerid,"FeuerwehrDuty");
			FeuerwehrDuty--;
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid,0);
	        SetPlayerColor(playerid,COLOR_WHITE);
	        SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
		}
		else if(GetPVarInt(playerid,"SanNewsDuty") == 1)
		{
			DeletePVar(playerid,"SanNewsDuty");
			SanNewsDuty--;
			ResetPlayerWeapons(playerid);
	        SetPlayerArmour(playerid,0);
	        SetPlayerColor(playerid,COLOR_WHITE);
	        SetPlayerColor(playerid, GetPlayerColor(playerid) & 0xFFFFFF00);
		}
		else if(GetPVarInt(playerid,"TruckerDuty") == 1){DeletePVar(playerid,"TruckerDuty");}
	    else if(GetPVarInt(playerid,"PizzaboteDuty") == 1){DeletePVar(playerid,"PizzaboteDuty");}
	    else if(GetPVarInt(playerid,"KehrmaschinenDuty") == 1){DeletePVar(playerid,"KehrmaschinenDuty");}
	    else if(GetPVarInt(playerid,"PilotDuty") == 1){DeletePVar(playerid,"PilotDuty");}
	    else if(GetPVarInt(playerid,"BusfahrerDuty") == 1){DeletePVar(playerid,"BusfahrerDuty");}
	    else if(GetPVarInt(playerid,"MüllmannDuty") == 1){DeletePVar(playerid,"MüllmannDuty");}
	    else if(GetPVarInt(playerid,"LandwirtDuty") == 1){DeletePVar(playerid,"LandwirtDuty");}
	    else if(GetPVarInt(playerid,"GeldlieferantDuty") == 1){DeletePVar(playerid,"GeldlieferantDuty");}
	    else if(GetPVarInt(playerid,"ElektrikerDuty") == 1){DeletePVar(playerid,"ElektrikerDuty");}


		if(SpielerInfo[playerid][sFraktion] >= 9 && SpielerInfo[playerid][sFraktion] != 19 && FrakInfo[SpielerInfo[playerid][sFraktion]][fiSkinordnung] > 0)//Gang
		{
			new skinid[3], string[25];
			format(skinid,sizeof(skinid),"%d",SpielerInfo[playerid][sFraktion]);
			format(string,sizeof(string),"Rang%d",SpielerInfo[playerid][sRank]);
			SetPlayerSkin(playerid,mysql_GetInt("skinordnung", string, "frakid", skinid));
		}
		else SetPlayerSkin(playerid,mysql_GetInt("accounts", "SkinID", "Name", SpielerInfo[playerid][sName]));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `PositionX`='%f', `PositionY`='%f', `PositionZ`='%f', `PositionA`='%f', `Spawn`='%d', `Stadt`='%d', `SkinID`='%d', `Admin`='%d', `FV`='%d', `Fraktion`='%d', `Team`='%d', `Leader`='%d', `Rank`='%d',",
	    SpielerInfo[playerid][sPosX],SpielerInfo[playerid][sPosY],SpielerInfo[playerid][sPosZ],SpielerInfo[playerid][sPosA],SpielerInfo[playerid][sSpawn],SpielerInfo[playerid][sStadt],GetPlayerSkin(playerid),SpielerInfo[playerid][sAdmin],
		SpielerInfo[playerid][sFV],SpielerInfo[playerid][sFraktion],SpielerInfo[playerid][sTeam],SpielerInfo[playerid][sLeader],SpielerInfo[playerid][sRank]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Wanteds`='%d', `Knastzeit`='%d', `Zelle`='%d', `EXP`='%d', `Verwarnungen`='%d', `Mutezeit`='%d', `WerbungSperre`='%d', `Badword`='%d', `IP-Adresse`='%s', `Bargeld`='%d', `Perso`='%d', `Stadtplan`='%d' WHERE `Name`='%s'",
	    GetPlayerWantedLevelEx(playerid),SpielerInfo[playerid][sKnast],SpielerInfo[playerid][sZelle],SpielerInfo[playerid][sEXP],SpielerInfo[playerid][sWarns],
		SpielerInfo[playerid][sMuted],SpielerInfo[playerid][sADSperre],SpielerInfo[playerid][sBadword],SpielerInfo[playerid][sIPAdresse],GetPlayerMoneyEx(playerid),SpielerInfo[playerid][sPerso],SpielerInfo[playerid][sStadtplan],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `Level`='%d', `BankPIN`='%d', `Bankkonto`='%d', `Tankstelle`='%d', `Nebenjob`='%d', `QuitJob`='%d', `Autoschein`='%d', `Bootschein`='%d', `Waffenschein`='%d', `Flugschein`='%d', `LKWschein`='%d', `Motorradschein`='%d',",
	    GetPlayerScore(playerid),SpielerInfo[playerid][sBankPin],SpielerInfo[playerid][sBankkonto],SpielerInfo[playerid][sTankstelle],SpielerInfo[playerid][sNebenjob],SpielerInfo[playerid][sQuitJob],
		SpielerInfo[playerid][sCarLic],SpielerInfo[playerid][sBootLic],SpielerInfo[playerid][sWeaponLic],SpielerInfo[playerid][sFlugLic],SpielerInfo[playerid][sTruckLic],SpielerInfo[playerid][sBikeLic]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Krankenhaus`='%d', `Wiederbeleben`='%d', `Tot_X`='%f', `Tot_Y`='%f', `Tot_Z`='%f', `Tot_Int`='%d', `Tot_World`='%d', `Paket`='%d', `Ammunation`='%d', `Store`='%d', `Haus`='%d', `Gruppenhaus`='%d', `Mieter`='%d', `PayDay`='%d', `Navi`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][sKrankenhaus],SpielerInfo[playerid][sWiederbeleben],Tot_X[playerid],Tot_Y[playerid],Tot_Z[playerid],Tot_Int[playerid],Tot_World[playerid],SpielerInfo[playerid][sPaket],
		SpielerInfo[playerid][sAmmunation],SpielerInfo[playerid][sStore],SpielerInfo[playerid][sHaus],SpielerInfo[playerid][sGHaus],SpielerInfo[playerid][sMieter],SpielerInfo[playerid][sPayDay],SpielerInfo[playerid][sNavi],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `Handy`='%d', `Guthaben`='%d', `Telefonbuch`='%d', `Repairkit`='%d', `PBKills`='%d', `PBTode`='%d', `Interior`='%d', `VirtualWorld`='%d', `Handschellen`='%d', `Startbonus`='%d', `Fraksperre`='%d',",
		SpielerInfo[playerid][sHandy],SpielerInfo[playerid][sGuthaben],SpielerInfo[playerid][sTelefonbuch],SpielerInfo[playerid][sRepairkit],SpielerInfo[playerid][sPBKills],
		SpielerInfo[playerid][sPBTode],SpielerInfo[playerid][sInterior],SpielerInfo[playerid][sVirtualWorld],GetPVarInt(playerid,"Handschellen"),SpielerInfo[playerid][sStartbonus],SpielerInfo[playerid][sFrakSperre]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`icpNachrichten`='%d', `icpHitsound`='%d', `icpOChat`='%d', `icpCamera`='%d', `icpHandy`='%d', `icpBlinker`='%d', `stvoAutoschein`='%d', `stvoMotorradschein`='%d', `stvoFlugschein`='%d', `stvoTruckschein`='%d', `stvoBootschein`='%d', `TicketsBearbeitet`='%d', `PayDayGeld`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][icpNachrichten],SpielerInfo[playerid][icpHitsound],SpielerInfo[playerid][icpOChat],SpielerInfo[playerid][icpCamera],SpielerInfo[playerid][icpHandy],SpielerInfo[playerid][icpBlinker],SpielerInfo[playerid][stvoCarLic],SpielerInfo[playerid][stvoBikeLic],SpielerInfo[playerid][stvoFlugLic],SpielerInfo[playerid][stvoTruckLic],SpielerInfo[playerid][stvoBootLic],
		SpielerInfo[playerid][sTicketsBearbeitet],SpielerInfo[playerid][sPayDayGeld],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `Lotto1`='%d', `Lotto2`='%d', `Lotto3`='%d', `TruckerSkill`='%d', `PizzaboteSkill`='%d', `KehrmaschinenSkill`='%d', `PilotenSkill`='%d', `BusfahrerSkill`='%d', `MullmannSkill`='%d', `GeldlieferSkill`='%d', `Drogen`='%d', `Tutorial`='%d', `Contract`='%d',",
		SpielerInfo[playerid][sLotto][0],SpielerInfo[playerid][sLotto][1],SpielerInfo[playerid][sLotto][2],SpielerInfo[playerid][sJobEXP][0],SpielerInfo[playerid][sJobEXP][1],SpielerInfo[playerid][sJobEXP][2],SpielerInfo[playerid][sJobEXP][3],
		SpielerInfo[playerid][sJobEXP][4],SpielerInfo[playerid][sJobEXP][5],SpielerInfo[playerid][sJobEXP][10],SpielerInfo[playerid][sDrogen],SpielerInfo[playerid][sTutorial],SpielerInfo[playerid][sContract]);
		strcat(stringzusammen,query);
		strdel(query,0,sizeof(query));

		mysql_format(sqlHandle, query,sizeof query,"`Gruppe`='%d', `GLeader`='%d', `GRank`='%d', `VIP`='%d', `Garage`='%d', `GMieter`='%d', `Materialien`='%d', `Kurrier`='%d', `Bombe`='%d', `Pfandflaschen`='%d', `Beutel`='%d', `Kampfstyle`='%d', `Helm`='%d', `Kicks`='%d', `Timebans`='%d', `Prisons`='%d', `Feuerzeug`='%d', `Bombe`='%d', `Obstkorb`='%d', `Orangen`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][sGruppe],SpielerInfo[playerid][sGLeader],SpielerInfo[playerid][sGRank],SpielerInfo[playerid][sVIP],SpielerInfo[playerid][sGarage],
		SpielerInfo[playerid][sGMieter],SpielerInfo[playerid][sMaterialien],SpielerInfo[playerid][sKurrier],SpielerInfo[playerid][sBombe],SpielerInfo[playerid][sPfandflaschen],SpielerInfo[playerid][sBeutel],SpielerInfo[playerid][sKampfstyle],
		SpielerInfo[playerid][sHelm],SpielerInfo[playerid][sKicks],SpielerInfo[playerid][sTimebans],SpielerInfo[playerid][sPrisons],SpielerInfo[playerid][sFeuerzeug],SpielerInfo[playerid][sBombe],SpielerInfo[playerid][sObstkorb],SpielerInfo[playerid][sOrangen],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `PrisonCP`='%d', `Prison`='%d', `Tagesbelohnung`='%d', `LastTagesbelohnung`='%d', `Mission1`='%d', `Mission2`='%d', `Mission3`='%d', `Mission4`='%d', `Mission5`='%d', `Mission6`='%d', `Kongress`='%d', `Senator`='%d', `Kanister`='%d', `PayBackCard`='%d', `PayBackPunkte`='%d', `ZweitKey`='%d', `LegBroken`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][sPrisonCP],SpielerInfo[playerid][sPrison],SpielerInfo[playerid][sTagesbelohnung],SpielerInfo[playerid][sLastTagesbelohnung],SpielerInfo[playerid][sMissionSolved][1],SpielerInfo[playerid][sMissionSolved][2],
		SpielerInfo[playerid][sMissionSolved][3],SpielerInfo[playerid][sMissionSolved][4],SpielerInfo[playerid][sMissionSolved][5],SpielerInfo[playerid][sMissionSolved][6],SpielerInfo[playerid][sKongress],SpielerInfo[playerid][sSenator],SpielerInfo[playerid][sKanister],SpielerInfo[playerid][sPayBackCard],SpielerInfo[playerid][sPayBackPunkte],SpielerInfo[playerid][sZweitKey],SpielerInfo[playerid][sLegBroken],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `VictimBrille`='%d', `VictimBrilleF`='%d', `VictimCap`='%d', `VictimCapF`='%d', `VictimBandana`='%d', `VictimBandanaF`='%d', `PDSwat`='%d', `BankAngelegt`='%d', `BankAngelegtMoney`='%d', `ICPCarlock`='%d', `ICPFlock`='%d', `ICPMotor`='%d', `ICPLicht`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][sVictimBrille],SpielerInfo[playerid][sVictimBrilleF],SpielerInfo[playerid][sVictimCap],SpielerInfo[playerid][sVictimCapF],SpielerInfo[playerid][sVictimBandana],SpielerInfo[playerid][sVictimBandanaF],SpielerInfo[playerid][sPDSwat],SpielerInfo[playerid][sBankAngelegt],SpielerInfo[playerid][sBankAngelegtMoney],
		SpielerInfo[playerid][sICPTasteCarlock],SpielerInfo[playerid][sICPTasteFlock],SpielerInfo[playerid][sICPTasteMotor],SpielerInfo[playerid][sICPTasteLicht],SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		//Achivements
		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `AchivLeader`='%d', `AchivMillion`='%d', `AchivAuto`='%d', `AchivJobGehalt`='%d', `AchivFlugLic`='%d', `AchivPfand`='%d', `AchivVIP`='%d', `AchivPaintball`='%d', `AchivPerso`='%d', `FischGewicht`='%d', `PlayerObjects` = %d WHERE `Name`='%s'",
		SpielerInfo[playerid][sAchivLeader],SpielerInfo[playerid][sAchivMillion],SpielerInfo[playerid][sAchivAuto],SpielerInfo[playerid][sAchivJobGehalt],SpielerInfo[playerid][sAchivFlugLic],SpielerInfo[playerid][sAchivPfand],SpielerInfo[playerid][sAchivVIP],SpielerInfo[playerid][sAchivPB],SpielerInfo[playerid][sAchivPerso],SpielerInfo[playerid][sFischGewicht],SpielerInfo[playerid][sPlayerObjects], SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		mysql_format(sqlHandle, query,sizeof query,"UPDATE `accounts` SET `healthInsurance`='%d', `healthInsuranceTime`='%d' WHERE `Name`='%s'",
		SpielerInfo[playerid][sHealthInsurance], SpielerInfo[playerid][sHealthInsuranceTime], SpielerInfo[playerid][sName]);
		strcat(stringzusammen,query);
		mysql_tquery(sqlHandle, stringzusammen);

		strdel(query,0,sizeof(query));
		strdel(stringzusammen,0,sizeof(stringzusammen));
		strdel(stringzusammen,0,sizeof(stringzusammen));

		//PlayerTitles
		SavePlayerTitles(playerid);
		SavePlayerJobSkills(playerid);
	    return 1;
	}
	return 1;
}

stock LoadAccount(playerid)
{
	if(!IsPlayerNPC(playerid) && GetPVarInt(playerid,"LoggedIn") == 1 && GetPVarInt(playerid,"ServerPasswort") == 0)
 	{
  		SetPVarInt(playerid,"NoPAYBACK",1);
	    new string[1024], pname[24];
	    GetPlayerName(playerid, pname, sizeof(pname));
		mysql_format(sqlHandle, string,sizeof(string),"UPDATE `accounts` SET `Online`='1' WHERE `Name`='%s'", pname);
		mysql_tquery(sqlHandle, string);

		mysql_format(sqlHandle, string, sizeof(string), "UPDATE `accounts` SET `Connected` = NOW() WHERE `Name` = '%s'", pname);
		mysql_tquery(sqlHandle, string);

	    mysql_format(sqlHandle, string, sizeof(string),"SELECT * FROM `accounts` WHERE `Name` = '%s'", pname);
	    mysql_tquery(sqlHandle, string, "onLoadAccount", "i", playerid);
	}
	return 1;
}

stock PreloadAnimationLibrary(playerid)
{
    if(!IsPlayerConnectedEx(playerid) || playerid == INVALID_PLAYER_ID)return 0;
    if(GetPVarInt(playerid,"PreloadAnimationLibrary") == 1)return 0;
    for(new index = 0; index < sizeof(AnimationLibrarys); index++){ApplyAnimation(playerid, AnimationLibrarys[index], "NULL", 4.0, false, false, false, false, 0);}
    SetPVarInt(playerid,"PreloadAnimationLibrary",1);
    return 1;
}

stock SetPlayerCheckpointEx(playerid, Float:x, Float:y, Float:z, Float:size)
{
	SpielerInfo[playerid][sLastCPX] = x;
	SpielerInfo[playerid][sLastCPY] = y;
	SpielerInfo[playerid][sLastCPZ] = z;
	SpielerInfo[playerid][sLastCPSize] = size;
    SetPlayerCheckpoint(playerid, x, y, z, size);
    return 1;
}

public Unfreeze(playerid)
{
	TogglePlayerControllable(playerid, true);
	return 1;
}

public NotrufTimer1(playerid)
{
	NotrufSperre[playerid][0] = 0;
	SendClientMessage(playerid,COLOR_SUPER,"Du kanst nun wieder einen Streifenwagen anfordern.");
	return 1;
}

public NotrufTimer2(playerid)
{
    NotrufSperre[playerid][1] = 0;
    SendClientMessage(playerid,COLOR_SUPER,"Du kanst nun wieder das FBI anfordern.");
	return 1;
}

public NotrufTimer3(playerid)
{
    NotrufSperre[playerid][2] = 0;
    SendClientMessage(playerid,COLOR_SUPER,"Du kanst nun wieder die Feuerwehr anfordern.");
	return 1;
}

public NotrufTimer4(playerid)
{
    NotrufSperre[playerid][3] = 0;
    SendClientMessage(playerid,COLOR_SUPER,"Du kanst nun wieder einen Sanitäter anfordern.");
	return 1;
}

public NotrufTimer5(playerid)
{
    NotrufSperre[playerid][4] = 0;
    SendClientMessage(playerid,COLOR_SUPER,"Du kanst nun wieder das O-Amt anfordern.");
	return 1;
}