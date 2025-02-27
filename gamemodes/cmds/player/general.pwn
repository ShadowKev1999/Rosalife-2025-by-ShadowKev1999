CMD:fahrschule(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,3.0,2109.6850, -3883.6213, 819.8867))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Prüfungsschalter.");
	ShowPlayerDialog(playerid,DIALOG_FAHRSCHULE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fahrschule","{FFFFFF}Autoschein		| Kosten: {FF0000}1000${FFFFFF}\nFlugschein		| Kosten: {FF0000}3000${FFFFFF}\nLKWschein		| Kosten: {FF0000}2000${FFFFFF}\nMotorradschein	| Kosten: {FF0000}800$\nBootschein		| Kosten: {FF0000}600$","Weiter","Abbrechen");
	return 1;
}

CMD:lizenzen(playerid, params[])
{
	new string2[7][128];
	new str[864];
	format(string2[0],128,"{FFFFFF}Lizenzen von {FF0000}%s",SpielerInfo[playerid][sName]);
	format(string2[1],128,"{FFFFFF}Autoschein:			%s{FFFFFF}	{FF0000}%d{FFFFFF}/10 Strafpunkt(e)",FScheinInfo(SpielerInfo[playerid][sCarLic]),SpielerInfo[playerid][stvoCarLic]);
	format(string2[2],128,"{FFFFFF}Motorradschein:		%s{FFFFFF}	{FF0000}%d{FFFFFF}/10 Strafpunkt(e)",FScheinInfo(SpielerInfo[playerid][sBikeLic]),SpielerInfo[playerid][stvoBikeLic]);
	format(string2[3],128,"{FFFFFF}Flugschein:			%s{FFFFFF}	{FF0000}%d{FFFFFF}/10 Strafpunkt(e)",FScheinInfo(SpielerInfo[playerid][sFlugLic]),SpielerInfo[playerid][stvoFlugLic]);
	format(string2[4],128,"{FFFFFF}LKWschein:			%s{FFFFFF}	{FF0000}%d{FFFFFF}/10 Strafpunkt(e)",FScheinInfo(SpielerInfo[playerid][sTruckLic]),SpielerInfo[playerid][stvoTruckLic]);
	format(string2[5],128,"{FFFFFF}Bootsschein:			%s{FFFFFF}	{FF0000}%d{FFFFFF}/10 Strafpunkt(e)",FScheinInfo(SpielerInfo[playerid][sBootLic]),SpielerInfo[playerid][stvoBootLic]);
	format(string2[6],128,"{FFFFFF}Waffenschein:			%s [Klasse: %d]",FScheinInfo(SpielerInfo[playerid][sWeaponLic]),SpielerInfo[playerid][sWeaponLic]);
	format(str,sizeof str,"%s\n\n%s\n%s\n%s\n%s\n%s\n%s",string2[0],string2[1],string2[2],string2[3],string2[4],string2[5],string2[6]);
	ShowPlayerDialog(playerid,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Lizenzen",str,"Weiter","");
	return 1;
}
alias:lizenzen("licenses", "scheine")

/*
CMD:starterpack(playerid){
    if(GetPlayerScore(playerid) > 3) return SendClientMessage(playerid, COLOR_RED, "[STARTERPACK] {FFFFFF}Du kannst kein Starterpack kriegen da du über Level 3 bist!");
    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 839.6967,-1734.4006,13.5698)) return SendClientMessage(playerid, COLOR_RED, "[STARTERPACK] {FFFFFF}Du bist nicht am Starterpack Punkt! (Zivispawn)");
    new jahr, monat, tag;
    getdate(jahr, monat, tag);
    if(jahr == 2020 && monat >= 05 && tag >= 02) return SendClientMessage(playerid, COLOR_RED, "[RSL-STARTERPACK] {FFFFFF}Die Aktion ist leider abgelaufen!");
	SetPlayerScore(playerid,5);
    GivePlayerMoneyEx(playerid,50000);
    SpielerInfo[playerid][sCarLic] = 1;
	SpielerInfo[playerid][sBikeLic] = 1;
	SpielerInfo[playerid][sFlugLic] = 1;
	SpielerInfo[playerid][sTruckLic] = 1;
	SpielerInfo[playerid][sBootLic] = 1;
	SpielerInfo[playerid][sWeaponLic] = 1;
    SendClientMessage(playerid, COLOR_RED, "[RSL-STARTERPACK] {FFFFFF}Du hast folgende Dinge erhalten: Level 5, $50.000 und alle Scheine.");
    SaveAccount(playerid);
    return 1;
}*/

CMD:help(playerid, params[])
{
    ShowPlayerDialog(playerid,DIALOG_HELP,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Hilfe","Admin Befehle\nAllgemeine Befehle\nFraktions Befehle\nNebenjob Befehle\nFahrzeug Befehle\nGeschäft Befehle\nGruppen Befehle\nGaragen Befehle\nHaus Befehle\nHandy Befehle","Weiter","Abbrechen");
	return 1;
}
alias:help("hilfe")

CMD:missionen(playerid, params[])
{
	new missionString[7][264], str[1400];
	format(missionString[0],264,"Mission\tBelohnung\tStatus");
	format(missionString[1],264,"Raube ein Geschäft ERFOLGREICH aus\t+300 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][1]));
	format(missionString[2],264,"Erreiche 10 Wanteds durch Cops\t+200 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][2]));
	format(missionString[3],264,"Kaufe Drogen von einer Gang\t+100 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][3]));
	format(missionString[4],264,"Erhalte 175HP durch /usedrugs\t+250 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][4]));
	format(missionString[5],264,"Sammle und verkaufe min. 15 Pfandflaschen\t+250 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][5]));
	format(missionString[6],264,"Lasse Emilio versuchen deine Wanteds zu entfernen\t+100 EXP\t%s",MissionenInfo(SpielerInfo[playerid][sMissionSolved][6]));
	format(str,sizeof(str),"%s\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s\n\t%s",missionString[0],missionString[1],missionString[2],missionString[3],missionString[4],missionString[5],missionString[6]);
	ShowPlayerDialog(playerid,DIALOG_MISSIONEN,DIALOG_STYLE_TABLIST_HEADERS,"{007DFF}"SERV_NAME"{FFFFFF} - Missionen",str,"Weiter","Abbrechen");
	return 1;
}
CMD:startbonus(playerid, params[])
{
	if(SpielerInfo[playerid][sStartbonus] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast deinen Startbonus bereits erhalten.");
 	if(GetPlayerScore(playerid) > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Startbonus kann nur von Level 1 bis Level 2 eingelöst werden.");
  	new string[100];
   	SpielerInfo[playerid][sStartbonus] = 1;
    SetPlayerScore(playerid,3);
    GivePlayerMoneyEx(playerid,5000);
    SendClientMessage(playerid,COLOR_SUPER,"[Startbonus]: {FFFFFF}Du hast deinen Startbonus eingelöst.");
    SendClientMessage(playerid,COLOR_SUPER,"[Startbonus]: {FFFFFF}Das Team von "SERV_NAME" schenkt dir 5.000$ und Level 3!");
    SpielerInfo[playerid][sEXPNeeded] = ExpInfo[GetPlayerScore(playerid)][eExp];
    mysql_SetInt("accounts", "EXPNeeded", SpielerInfo[playerid][sEXPNeeded], "Name", SpielerInfo[playerid][sName]);
    format(string,sizeof(string),"EXP: %d / %d",SpielerInfo[playerid][sEXP],SpielerInfo[playerid][sEXPNeeded]);
	PlayerTextDrawSetString(playerid, EXPInfo[playerid], string);
 	return 1;
}

CMD:spawnchange(playerid, params[])
{
	ShowPlayerDialog(playerid,DIALOG_SPAWNCHANGE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Benutzerverwaltung","Zivilisten-Spawn\nFraktion\nHaus/Wohnung\nGruppenhaus","Weiter","Zurück");
	return 1;
}

CMD:knastzeit(playerid, params[])
{
	new string[128];
	if(SpielerInfo[playerid][sKnast] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Gefängnis.");
	format(string, 128, "Du bist noch für %d Minute(n) im Gefängnis.",SpielerInfo[playerid][sKnast]);
	SendClientMessage(playerid, COLOR_RED, string);
	return 1;
}

CMD:admins(playerid,params[])
{
    #pragma unused params
    new string[1700],onlineadmins = 0;
	for(new i = 0; i < MAX_PLAYERS; i++)
    {
		if(IsPlayerConnected(i) && !IsPlayerNPC(i))
		{
			if(GetPVarInt(playerid,"LoggedIn") == 1)
			{
					if(SpielerInfo[i][sAdmin] > 0)
					{
						format(string,sizeof(string),"{FF0F00}%s: {FFFFFF} %s | Status: %s | HandyNr.: %d \n%s",AdminNameList(i),SpielerInfo[i][sName],AdmDuty(i),SpielerInfo[i][sHandy],string);
						ShowPlayerDialog(playerid,DIALOG_ADMINS,DIALOG_STYLE_MSGBOX,"Aktive Team-Mitglieder",string,"Verlassen","");
						onlineadmins++;
					}
			}
		}
	}
	if(onlineadmins == 0)return SendClientMessage(playerid,COLOR_RED,"Es ist kein Team-Mitglied online.");
	return 1;
}

CMD:freikaufen(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,3.0,1055.1564,-1682.1302,16.7169))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht an der Verwahrstelle.");
	ShowPlayerDialog(playerid,DIALOG_FREIKAUFEN,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Freikaufen","Fraktionsfahrzeug\nPrivatfahrzeug\nGruppenfahrzeug","Weiter","Abbrechen");
	return 1;
}

CMD:carsell(playerid, params[])
{
	new string[64], tmpcar = GetPlayerVehicleID(playerid);
 	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
  	new carid = GetPlayerVehicleID(playerid);
   	if(strlen(FahrzeugInfo[carid][fBesitzer]) == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Privatfahrzeug.");
	if(FahrzeugInfo[carid][fBesitzerID] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Besitzer dieses Fahrzeugs.");
	SetPVarInt(playerid,"FahrzeugVerkaufen",2);
	SetPVarInt(playerid,"FahrzeugVerkaufenPreis", FahrzeugInfo[tmpcar][fPreis]/2);
	format(string,sizeof(string),"{FFFFFF}Möchtest du den {009BFF}%s{FFFFFF} für {009BFF}%d${FFFFFF} verkaufen ?",FahrzeugName[FahrzeugInfo[tmpcar][fModelID]-400], FahrzeugInfo[tmpcar][fPreis]/2);
 	ShowPlayerDialog(playerid,DIALOG_FAHRZEUG_VERKAUFEN,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Privatfahrzeug",string,"Ja","Nein");
	return 1;
}

CMD:delcp(playerid, params[])
{
	DisablePlayerCheckpoint(playerid);
 	DisablePlayerRaceCheckpoint(playerid);
  	SendClientMessage(playerid,COLOR_SUPER,"[Erfolg]: Dein gesetzer Checkpoint wurde entfernt.");
   	return 1;
}

CMD:afklist(playerid, params[])
{
	new stringafklist[25];
 	SendClientMessage(playerid,COLOR_WHITE,"* Liste aller Spieler die AFK gemeldet sind:");
	foreach(new i : Player)
	{
 		if(IsPlayerNPC(i) || !IsPlayerConnectedEx(i))continue;
   		if(Afk[i] > 0)
     	{
      		format(stringafklist,sizeof(stringafklist),"%s",SpielerInfo[i][sName]);
      		SendClientMessage(playerid,COLOR_GREY,stringafklist);
        }
	}
 	return 1;
}

CMD:stadtplan(playerid, params[])
{
	if(SpielerInfo[playerid][sStadtplan] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Stadtplan.");
 	ShowPlayerDialog(playerid,DIALOG_STADTPLAN,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Stadtplan","Stadthalle\nBank\nFahrschule\nAutohaus - Los Santos\nMotorradhändler - Los Santos\nAutohaus - San Fierro","Weiter","Zurück");
  	return 1;
}
CMD:navi(playerid, params[])
{
	if(SpielerInfo[playerid][sNavi] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt kein Navigationsgerät. Kaufe dir ein im 24/7.");
 	ShowPlayerDialog(playerid,DIALOG_NAVI,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Navi","Öffentliche Orte\nNebenjobs\nAutohäuser\nAmmunations\n24/7\nTankstellen\nGym\nImmobilien\nSchwarzmarkt","Weiter","Zurück");
  	return 1;
}
alias:navi("gps")
CMD:waffenschein(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid,3.0,341.2662,1830.4661,2241.5850) || IsPlayerInRangeOfPoint(playerid,3.0,252.1846,117.4193,1003.2188) || IsPlayerInRangeOfPoint(playerid,3.0,292.4972,180.1965,1007.1794))
 	{
  		if(SpielerInfo[playerid][sWeaponLic] == 0)
  		{
    		if(GetPlayerScore(playerid) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst Level 2 für einen Waffenschein Klasse 1.");
      		//if(SpielerInfo[playerid][sPBKills] < 50)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst mindestens 50 Paintball-Kills.");
			if(GetPlayerMoneyEx(playerid) < 8000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du musst 8.000$ in Bar mitbringen.");
			SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-8000);
			SendClientMessage(playerid,COLOR_GREEN,"* Du hast dir einen Waffenschein Klasse 1 gekauft!");
			SendClientMessage(playerid,COLOR_GREEN,"* Beachte das dir Klasse 1 nur den Kauf von Schlagwaffen ermöglicht!");
			SpielerInfo[playerid][sWeaponLic] = 1;
   		}
     	else if(SpielerInfo[playerid][sWeaponLic] == 1)
      	{
       		if(GetPlayerScore(playerid) < 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst Level 3 für einen Waffenschein Klasse 2.");
         	//if(SpielerInfo[playerid][sPBKills] < 75)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst mindestens 100 Paintball-Kills.");
			if(GetPlayerMoneyEx(playerid) < 16000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du musst 16.000$ in Bar mitbringen.");
			SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-16000);
			SendClientMessage(playerid,COLOR_GREEN,"* Du hast dir einen Waffenschein Klasse 2 gekauft!");
			SendClientMessage(playerid,COLOR_GREEN,"* Beachte das dir Klasse 2 nur den Kauf von Schlag und Handfeuerwaffen ermöglicht!");
			SpielerInfo[playerid][sWeaponLic] = 2;
   		}
     	else if(SpielerInfo[playerid][sWeaponLic] == 2)
      	{
       		if(GetPlayerScore(playerid) < 4)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst Level 4 für einen Waffenschein Klasse 3.");
         	//if(SpielerInfo[playerid][sPBKills] < 200)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst mindestens 200 Paintball-Kills.");
			if(GetPlayerMoneyEx(playerid) < 32000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du musst 32.000$ in Bar mitbringen.");
			SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-32000);
			SendClientMessage(playerid,COLOR_GREEN,"* Du hast dir einen Waffenschein Klasse 3 gekauft!");
			SendClientMessage(playerid,COLOR_GREEN,"* Beachte das dir Klasse 3 nur den Kauf von Schlagwaffen, Handfeuerwaffen und Sturmgewehren ermöglicht!");
			SpielerInfo[playerid][sWeaponLic] = 3;
   		}
     	else if(SpielerInfo[playerid][sWeaponLic] == 3)
      	{
       		if(GetPlayerScore(playerid) < 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst Level 6 für einen Waffenschein Klasse 4.");
         	//if(SpielerInfo[playerid][sPBKills] < 400)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du brauchst mindestens 500 Paintball-Kills.");
			if(GetPlayerMoneyEx(playerid) < 64000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du musst 64.000$ in Bar mitbringen.");
			SetPVarInt(playerid,"NoPAYBACK",1);
			GivePlayerMoneyEx(playerid,-64000);
			SendClientMessage(playerid,COLOR_GREEN,"* Du hast dir einen Waffenschein Klasse 4 gekauft!");
			SendClientMessage(playerid,COLOR_GREEN,"* Ab sofort kannst du alle Waffen erwerben. Das bedeutet; Schlagwaffen, Handfeuerwaffen, Sturm und Langschützengewehre!");
			SpielerInfo[playerid][sWeaponLic] = 4;
   		}
     	else if(SpielerInfo[playerid][sWeaponLic] == 4)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du besitzt bereits die höchste Waffenschein-Klasse!");
      	return 1;
   	}
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst hier keinen Waffenschein kaufen.");
    return 1;
}


CMD:roller(playerid, params[])
{
	if(GetPVarInt(playerid,"Ziviroller") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast bereits einen Roller. Du kannst es mit '/delroller' löschen.");
	if(GetPlayerScore(playerid) > 6)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir kein Roller mehr mieten (max. Level 6).");
	if(!IsPlayerInRangeOfPoint(playerid,5.0,834.5435, -1750.6958, 13.0305) && !IsPlayerInRangeOfPoint(playerid,5.0,645.2800,-1345.7362,13.5469))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Rollerverleih.");
	new vehicleid;

	vehicleid = CreateVehicle(462,834.9726,-1755.6968,13.1735,180.0000,1,1,-1);
	format(FahrzeugInfo[vehicleid][fKennzeichen], 0, "[RSL]");
	SetVehicleNumberPlate(vehicleid,"[RSL]");
	FahrzeugInfo[vehicleid][fModelID] = 481;
 	FahrzeugInfo[vehicleid][fTank] = VehicleData[GetVehicleModel(vehicleid)-400][vehLiter];

	GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
	SetVehicleParamsEx(vehicleid, true, false, false, false, false, false, false);
	PutPlayerInVehicle(playerid,vehicleid,0);

	FahrzeugInfo[vehicleid][fDatabaseID] = 0; FahrzeugInfo[vehicleid][fErstellt] = true;
	FahrzeugInfo[vehicleid][fPosition][0] = 1675.8872; FahrzeugInfo[vehicleid][fPosition][1] = -2315.2986; FahrzeugInfo[vehicleid][fPosition][2] = 12.9821; FahrzeugInfo[vehicleid][fPosition][3] = 90.3960; FahrzeugInfo[vehicleid][fColor][1] = 1;
	FahrzeugInfo[vehicleid][fAbgeschleppt] = 0; FahrzeugInfo[vehicleid][fParkkralle] = 0; FahrzeugInfo[vehicleid][fKilometer] = 0; FahrzeugInfo[vehicleid][fColor][0] = 1; FahrzeugInfo[vehicleid][fPaintjob] = 3;
	FahrzeugInfo[vehicleid][fRang] = 0; FahrzeugInfo[vehicleid][fFraktion] = 0; FahrzeugInfo[vehicleid][fGruppe] = 0; FahrzeugInfo[vehicleid][fAutohaus] = 0; FahrzeugInfo[vehicleid][fNebenjob] = 0;  FahrzeugInfo[vehicleid][fGarage] = 0; FahrzeugInfo[vehicleid][fGPark] = 0; FahrzeugInfo[vehicleid][fFahrschule] = 0;
	FahrzeugInfo[vehicleid][fSupmobil] = 0; FahrzeugInfo[vehicleid][fZiviroller] = 1; FahrzeugInfo[vehicleid][fImportCar] = 0; FahrzeugInfo[vehicleid][fKurrierCar] = 0; FahrzeugInfo[vehicleid][fPreis] = 0; FahrzeugInfo[vehicleid][fBesitzer] = 0;
	format(FahrzeugInfo[vehicleid][fBesitzer], 0, ""); FahrzeugInfo[vehicleid][fBesitzerID] = 0; FahrzeugInfo[vehicleid][fTuning][0] = 0; FahrzeugInfo[vehicleid][fTuning][1] = 0; FahrzeugInfo[vehicleid][fTuning][2] = 0;
	FahrzeugInfo[vehicleid][fTuning][3] = 0; FahrzeugInfo[vehicleid][fTuning][4] = 0; FahrzeugInfo[vehicleid][fTuning][5] = 0; FahrzeugInfo[vehicleid][fTuning][6] = 0; FahrzeugInfo[vehicleid][fTuning][7] = 0;
	FahrzeugInfo[vehicleid][fTuning][8] = 0; FahrzeugInfo[vehicleid][fTuning][9] = 0; FahrzeugInfo[vehicleid][fTuning][10] = 0; FahrzeugInfo[vehicleid][fTuning][11] = 0; FahrzeugInfo[vehicleid][fTuning][12] = 0;
	FahrzeugInfo[vehicleid][fTuning][13] = 0; FahrzeugInfo[vehicleid][fJobEXP] = 0;

	SetPVarInt(playerid,"Ziviroller",vehicleid);

	Motor[vehicleid] = true;
	Licht[vehicleid] = false;
	DOOR[vehicleid] = false;
	Motorhaube[vehicleid] = false;
	Kofferraum[vehicleid] = false;
	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du kannst dein Roller mit '/delroller' wieder löschen und mit '/rlock' auf/zuschliessen.");
	if(SpielerInfo[playerid][sTutorial] > 0){SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Du kannst dir jederzeit einen Roller mieten, solange du unter Level 3 bist.");}
 	return 1;
}
CMD:delroller(playerid, params[])
{
	if(GetPVarInt(playerid,"Ziviroller") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du hast kein Roller ausgeliehen.");
	DeleteVehicle(GetPVarInt(playerid,"Ziviroller"));
	DeletePVar(playerid,"Ziviroller");
	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du hast deinen Roller gelöscht.");
 	return 1;
}
CMD:stats(playerid, params[])
{
	if(SpielerInfo[playerid][sPerso] == 0)return SendClientMessage(playerid,COLOR_RED,"Du besitzt keinen Personalausweis. Begebe dich zur Stadthalle und beantrage dort deinen Personalausweis.");
	if(GetPVarInt(playerid,"StatsOpen") == 0)
	{
		ShowStats(playerid,playerid);
		SetPVarInt(playerid,"StatsOpen",1);
		SendClientMessage(playerid,COLOR_GREY,"[Info]: Mittels '/connection' kannst du deine Verbindungsinformationen einsehen.");
		SendClientMessage(playerid,COLOR_GREY,"[Info]: Du kannst deine Statistiken mit '/stats' wieder schliessen.");
		if(SpielerInfo[playerid][sVIP] > 0)
		{
  			new VIPTimeStamp = mysql_GetInt("vip", "serv_Data", "Name", SpielerInfo[playerid][sName]);
	    	new diff_secs = ( VIPTimeStamp - gettime() );
      		new remain_months = ( diff_secs / (60 * 60 * 24 * 30) );
        	diff_secs -= remain_months * 60 * 60 * 24 * 30;
	        new remain_days = ( diff_secs / (60 * 60 * 24) );
	        diff_secs -= remain_days * 60 * 60 * 24;
	        new remain_hours = ( diff_secs / (60 * 60) );
	        diff_secs -= remain_hours * 60 * 60;
	        new remain_minutes = ( diff_secs / 60 );
	        diff_secs -= remain_minutes * 60;
	        new estring[128];
	        format(estring, 128, "Dein VIP läuft noch: %d Monate / %d Tage / %d Stunden / %d Minuten / %d Sekunden.", remain_months, remain_days, remain_hours, remain_minutes, diff_secs);
	        SendClientMessage(playerid, COLOR_YELLOW, estring);
		}
	}
	else if(GetPVarInt(playerid,"StatsOpen") == 1)
	{
 		HideStatsTextDraws(playerid);
		SetPVarInt(playerid,"StatsOpen",0);
	}
	return 1;
}

CMD:fahrzeugschein(playerid,params[])
{
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
    if(FahrzeugInfo[GetPlayerVehicleID(playerid)][fDatabaseID] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrzeug besitzt keinen Fahrzeugschein.");
    if(IsAFahrrad(GetPlayerVehicleID(playerid)))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Fahrrad besitzt keinen Fahrzeugschein.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/fahrzeugschein [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
	new string[128], tmpcar = GetPlayerVehicleID(playerid);
	format(string,sizeof(string),"* %s holt etwas aus dem Handschuhfach und zeigt %s den Fahrzeugschein.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SendClientMessage(pID,COLOR_RED,"** Fahrzeugschein **");
	format(string,sizeof(string),"Model: %s",FahrzeugName[FahrzeugInfo[tmpcar][fModelID]-400]);
	SendClientMessage(pID,COLOR_WHITE,string);
	format(string,sizeof(string),"Zugelassen auf: %s [FID: %d] [GID: %d]",FahrzeugInfo[tmpcar][fBesitzer],FahrzeugInfo[tmpcar][fFraktion],FahrzeugInfo[tmpcar][fGruppe]);
	SendClientMessage(pID,COLOR_WHITE,string);
	format(string,sizeof(string),"Tuning angemeldet: %s",JaNein(FahrzeugInfo[tmpcar][fTuningGemeldet]));
	SendClientMessage(pID,COLOR_WHITE,string);
	return 1;
}

CMD:knacken(playerid,params[])
{
	if(GetPVarInt(playerid,"Handschellen") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast selber Handschellen um.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/knacken [SpielerID]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
	if(GetPVarInt(pID,"Handschellen") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Spieler hat keine Handschellen um.");
	if(GetPVarInt(playerid,"vHandschellenKnack") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du versuchst bereits Handschellen zu knacken.");
	if(GetPVarInt(pID,"HandschellenKnack") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Jemand versucht bereits die Handschellen des Spielers zu knacken.");
	new string[128];
	format(string,sizeof(string),"%s versucht die Handschellen von %s zu knacken.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	SetPVarInt(pID,"HandschellenKnack",playerid);
	SetPVarInt(playerid,"vHandschellenKnack",pID);
	SetTimerEx("HandschellenKnacken", 30000, false, "ii", playerid, pID);
	return 1;
}

CMD:prisoncps(playerid,params[])
{
	if(SpielerInfo[playerid][sPrisonCP] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht im Laufprison.");
	new prisonstring[128];
	format(prisonstring,sizeof(prisonstring),"%d Checkpoint(s) verbleiben",SpielerInfo[playerid][sPrisonCP]);
	GameTextForPlayer(playerid, prisonstring, 3000, 1);
	return 1;
}

CMD:prisonzeit(playerid,params[])
{
	if(SpielerInfo[playerid][sPrison] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht im Prison auf Zeit.");
	new prisonstring[128];
	format(prisonstring,sizeof(prisonstring),"%d Minute(n) verbleiben",SpielerInfo[playerid][sPrison]);
	GameTextForPlayer(playerid, prisonstring, 3000, 1);
	return 1;
}

CMD:showperso(playerid,params[])
{
	if(SpielerInfo[playerid][sPerso] < 1)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du besitzt keinen Personalausweis.");
	new pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/showperso [SpielerID]");
	{
	    if(!IsPlayerConnectedEx(playerid))return NichtOnline
		if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe

		new string[128];

		if(playerid != pID)
		{
			format(string,sizeof(string),"* %s zeigt %s seinen Personalausweis",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
			ProxDetector(7, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
		}

		format(string,sizeof(string),"|*** Personalausweis von {FF0000}%s{FFFFFF} ***|",SpielerInfo[playerid][sName]);
		SendClientMessage(pID,COLOR_WHITE,string);
		format(string,sizeof(string),"Name: {FF0000}%s",SpielerInfo[playerid][sName]);
		SendClientMessage(pID,COLOR_WHITE,string);
		format(string,sizeof(string),"Geschlecht: {FF0000}%s",GetGeschlecht(playerid));
		SendClientMessage(pID,COLOR_WHITE,string);
		format(string,sizeof(string),"Alter: {FF0000}%d",SpielerInfo[playerid][sAlter]);
		SendClientMessage(pID,COLOR_WHITE,string);
		if(SpielerInfo[playerid][sNebenjob] == 12 || SpielerInfo[playerid][sNebenjob] == 13){format(string,sizeof(string),"Nebenjob: {FF0000}Arbeitslos");}
		else format(string,sizeof(string),"Nebenjob: {FF0000}%s",JobName(SpielerInfo[playerid][sNebenjob]));
		SendClientMessage(pID,COLOR_WHITE,string);
		if(SpielerInfo[playerid][sKongress] == 1){SendClientMessage(pID,COLOR_WHITE,"Mitglied des {FF0000}U.S Kongress{FFFFFF} - Die Regierung.");}
		if(SpielerInfo[playerid][sSenator] == 1){SendClientMessage(pID,COLOR_WHITE,"Senator der {FF0000}vereinigten Staaten{FFFFFF} - Die Regierung.");}
		return 1;
	}
}

CMD:afk(playerid,params[])
{
    if(Afk[playerid] == 0)
    {
        Afk[playerid]=1;
        lastUpdate[playerid] = GetTickCount();
        new hour,minute,second;
        new string1[10];
        gettime(hour,minute,second);
        format(string1, sizeof string1, "%s%d:%s%d:%s%d", (hour < 10) ? ("0") : (""), hour, (minute < 10) ? ("0") : (""), minute, (second < 10) ? ("0") : (""), second);
        new string[125];
        format(string,sizeof(string),"* Spieler ist Abwesend seit [{FF0000}%s{FFFFFF}] *",string1);
        Afklabel[playerid] = Create3DTextLabel(string, COLOR_WHITE, 30.0, 40.0, 0.3, 20.0, 0);
        Attach3DTextLabelToPlayer(Afklabel[playerid], playerid, 0.0, 0.0, 0.4);
        TogglePlayerControllable(playerid, false);
        TextDrawShowForPlayer(playerid, StatusAFK);
    }
    return 1;
}

CMD:back(playerid,params[])
{
	if(Afk[playerid] != 1)return SendClientMessage(playerid,COLOR_RED,"Du bist nicht AFK.");
	new afkstring[128], nr = random(89999) + 10000;
	SetPVarInt(playerid,"BackNummer",nr);
	format(afkstring, sizeof(afkstring), "{FFFFFF}Du bist als Abwesend gemeldet.\nGebe diesen Code ein um wieder ins Spiel hinein zu kommen.\nCode: {FF0000}%d",nr);
	ShowPlayerDialog(playerid,DIALOG_ANTIAFK,DIALOG_STYLE_INPUT,"{007DFF}"SERV_NAME"{FFFFFF} - AFK",afkstring,"Bestätigen","");
	return 1;
}

CMD:id(playerid,params[])
{
	new pID,string[144];
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/id [SpielerName]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
   	format(string,sizeof(string),"%s [ID: %d] | Paketverlust: %.2f | Ping: %d",SpielerInfo[pID][sName],pID,GetPlayerPacketLoss(pID),GetPlayerPing(playerid));
    SendClientMessage(playerid,COLOR_GREY,string);
	return 1;
}

CMD:showscheine(playerid,params[])
{
	new string[364], pID;
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/showscheine [SpielerID]");
	if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze '/scheine' um deine Fahrscheine zu sehen.");
 	if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(GetDistanceBetweenPlayersEx(playerid,pID) > 12)return NichtNahe
	format(string,sizeof(string),"{FFFFFF}Autoschein:		%s{FFFFFF}\nFlugschein:		%s{FFFFFF}\nLKWschein:		%s{FFFFFF}\nBootschein:		%s{FFFFFF}\nMotorradschein:	%s{FFFFFF}\nWaffenschein:		%s [Klasse: %d]",FScheinInfo(SpielerInfo[playerid][sCarLic]),FScheinInfo(SpielerInfo[playerid][sFlugLic]),
	FScheinInfo(SpielerInfo[playerid][sTruckLic]),FScheinInfo(SpielerInfo[playerid][sBootLic]),FScheinInfo(SpielerInfo[playerid][sBikeLic]),FScheinInfo(SpielerInfo[playerid][sWeaponLic]),SpielerInfo[playerid][sWeaponLic]);
	ShowPlayerDialog(pID,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Lizenzen",string,"Weiter","");
	format(string,sizeof(string),"* %s zeigt %s seine Lizenzen",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	ProxDetector(7.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
	return 1;
}

CMD:eject(playerid,params[])
{
    new pID, str[144];
	if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
 	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht der Fahrer dieses Fahrzeugs.");
	if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/eject [SpielerID/Name]");
	if(!IsPlayerInAnyVehicle(pID))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler sitzt in keinem Fahrzeug.");
	if(GetPlayerVehicleID(pID) != GetPlayerVehicleID(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der angegebene Spieler sitzt nicht in deinem Fahrzeug.");
	format(str,sizeof(str),"Du hast %s aus dem Fahrzeug geworfen.",SpielerInfo[pID][sName]);
	SendClientMessage(playerid,COLOR_SUPER,str);
	format(str,sizeof(str),"Fahrer %s hat dich aus dem Fahrzeug geworfen.",SpielerInfo[playerid][sName]);
	SendClientMessage(pID,COLOR_INFO,str);
	RemovePlayerFromVehicle(pID);
	return 1;
}
alias:eject("rauswerfen")

CMD:pay(playerid,params[])
{
	new pID,Betrag,string[144];
    if(sscanf(params,"ud",pID,Betrag))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/pay [SpielerID/Name] [Betrag]");
	if(!IsPlayerConnectedEx(pID))return NichtOnline
    if(GetDistanceBetweenPlayersEx(playerid, pID) >= 7)return NichtNahe
    if(GetPlayerMoneyEx(playerid) < Betrag)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
    if(Betrag < 0 || Betrag > 5000)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst maximal 5.000$ in Bar geben.");
    if(pID == playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dir selbst kein Geld aus deiner eigenen Tasche geben.");
    SetPVarInt(playerid,"NoPAYBACK",1);
	GivePlayerMoneyEx(playerid,-Betrag);
	GivePlayerMoneyEx(pID,Betrag);
	format(string,sizeof(string),"[Info]: %s hat dir gerade %d$ gegeben.",SpielerInfo[playerid][sName],Betrag);
	SendClientMessage(pID,COLOR_INFO,string);
	format(string,sizeof(string),"[Info]: Du hast %s hat gerade %d$ gegeben.",SpielerInfo[pID][sName],Betrag);
	SendClientMessage(playerid,COLOR_INFO,string);
	format(string,sizeof(string),"* %s nimmt etwas Geld aus seiner Tasche und gibt es %s.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName]);
	ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
	return 1;
}

CMD:ad(playerid,params[])
{
    if(GlobalVars[Werbung] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Werbung ist zurzeit deaktiviert.");
    if(GetPVarInt(playerid,"HatGradeWerbungGemacht") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur alle 5 Minuten eine Werbung schalten.");
	if(GlobalVars[WerbungAktiv] == 0)
	{
	    new text[80];
	    if(GetPlayerScore(playerid) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du brauchst Level 2 um eine Werbung zu schalten.");
	    if(SpielerInfo[playerid][sADSperre] > 0)
	    {
	        format(text,sizeof(text),"Du bist noch für %d Minute(n) von der Werbung ausgeschlossen.",SpielerInfo[playerid][sADSperre]);
	        SendClientMessage(playerid,COLOR_RED,text);
	        return 1;
	    }
		if(sscanf(params,"s[80]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ad [Text] | Maximal 80 Zeichen - Pro Zeichen 15$");
		if(strlen(text) < 10)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Werbung muss zwischen 10 & 80 Zeichen lang sein.");
		if(strlen(text) > 80)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Werbung muss zwischen 10 & 80 Zeichen lang sein.");
  		if(GetPlayerMoneyEx(playerid) >= strlen(text)*15)
	    {
			new string[144];
			if(SpielerInfo[playerid][sVIP] == 0) { SetTimer("WerbungTimer",120000,false); }
			else if(SpielerInfo[playerid][sVIP] > 0) { SetTimer("WerbungTimer",240000,false); }
			GlobalVars[WerbungAktiv] = 1;
			format(string,sizeof(string),"~g~Werbung: ~w~%s ~g~Kontakt: ~w~%s",text,SpielerInfo[playerid][sName]);
			TextDrawSetString(StatusWerbung, string);
			format(string,sizeof(string),"{00A900}Werbung: {FFFFFF}%s {00A900}Kontakt: {FFFFFF}%s",text,SpielerInfo[playerid][sName]);
			SendICPMsg(string);
			GivePlayerMoneyEx(playerid,-strlen(text)*15);
			FrakInfo[8][fiFrakKasse] += strlen(text)*15;
			format(string,sizeof(string),"Deine Werbung hat %d Zeichen gehabt und %d$ gekostet.",strlen(text),strlen(text)*15);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			SetPVarInt(playerid,"HatGradeWerbungGemacht",1);
			SetTimerEx("HatGradeWerbungGemachtTimer", 300000, false, "i", playerid);
			return 1;
	    }
	    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
	    return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die nächste Werbung kann noch nicht geschrieben werden.");
	return 1;
}
alias:ad("werbung")

CMD:uad(playerid,params[])
{
    if(GlobalVars[Werbung] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Werbung ist zurzeit deaktiviert.");
	if(SpielerInfo[playerid][sFraktion] != 19)return NichtBerechtigt
	if(GlobalVars[WerbungAktiv] == 0)
	{
	    new text[128];
	    if(GetPlayerScore(playerid) < 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du brauchst Level 2 um eine Werbung zu schalten.");
	    if(SpielerInfo[playerid][sADSperre] > 0)
	    {
	        format(text,sizeof(text),"Du bist noch für %d Minute(n) von der Werbung ausgeschlossen.",SpielerInfo[playerid][sADSperre]);
	        SendClientMessage(playerid,COLOR_RED,text);
	        return 1;
	    }
		if(sscanf(params,"s[128]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ad [Text] | Pro Zeichen 15$");
		if(strlen(text) < 10)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Werbung muss zwischen 10 & 128 Zeichen lang sein.");
		if(strlen(text) > 128)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Deine Werbung muss zwischen 10 & 128 Zeichen lang sein.");
  		if(GetPlayerMoneyEx(playerid) >= strlen(text)*15)
	    {
			new string[144];
			SetTimer("WerbungTimer",120000,false);
			GlobalVars[WerbungAktiv] = 1;
			format(string,sizeof(string),"~g~Werbung: ~w~%s ~g~Kontakt: ~w~Unbekannt",text);
			TextDrawSetString(StatusWerbung, string);
			format(string,sizeof(string),"{00A900}Werbung: {FFFFFF}%s {00A900}Kontakt: {FFFFFF}Unbekannt",text);
			SendICPMsg(string);
			GivePlayerMoneyEx(playerid,-strlen(text)*15);
			FrakInfo[8][fiFrakKasse] += strlen(text)*15;
			format(string,sizeof(string),"Deine Werbung hat %d Zeichen gehabt und %d$ gekostet.",strlen(text),strlen(text)*15);
			SendClientMessage(playerid,COLOR_YELLOW,string);
			return 1;
	    }
	    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast nicht genügend Geld bei dir.");
	    return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die nächste Werbung kann noch nicht geschrieben werden.");
	return 1;
}
alias:uad("uwerbung")