CMD:creategarage(playerid,params[])
{
    new query[256], Float:pX, Float:pY, Float:pZ, Text[224], Ort, Preis;
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"dd",Ort,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/creategarage [LS=1|SF=2|LV=3] [Preis]");
	GetPlayerPos(playerid,pX,pY,pZ);
	for(new mf=1;mf<MAX_GARAGEN;mf++)
	{
	    if(GaragenInfo[mf][giErstellt] == true)continue;
	    GaragenInfo[mf][giErstellt] = true;
	    GaragenInfo[mf][giPos_X] = pX;
	    GaragenInfo[mf][giPos_Y] = pY;
	    GaragenInfo[mf][giPos_Z] = pZ;
	    GaragenInfo[mf][giPreis] = Preis;
	    GaragenInfo[mf][giOrt] = Ort;

		mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `garagen` (`ID`,`Preis`,`Ort`, `Pos_X`,`Pos_Y`,`Pos_Z`) VALUES ('%d','%d','%d','%f','%f','%f')",mf,Preis,Ort,pX,pY,pZ);
		mysql_tquery(sqlHandle, query);
		format(Text, sizeof(Text), "Garage 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Garage zu kaufen", mf, Preis);
    	format(query,sizeof(query),"Die Garage (ID: %d) wurde erfolgreich erstellt.",mf);

		GaragenInfo[mf][giText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX, pY, pZ, 10.0);
		GaragenInfo[mf][giPickup] = CreateDynamicPickup(1273, 23, pX, pY, pZ, -1);
		SendClientMessage(playerid,COLOR_SUPER,query);
		return 1;
	}
	return 1;
}

CMD:creategarageout(playerid,params[])
{
    new query[256], Float:Pos[4], gid;
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du musst dafür in einem Fahrzeug sitzen.");
    if(sscanf(params,"d",gid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/creategarageout [GaragenID]");
    if(GaragenInfo[gid][giErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Garage existiert nicht.");
    new vehicleid = GetPlayerVehicleID(playerid);

    GetVehiclePos(vehicleid,Pos[0],Pos[1],Pos[2]);
    GetVehicleZAngle(vehicleid,Pos[3]);

    GaragenInfo[gid][giOPos_X] = Pos[0];
    GaragenInfo[gid][giOPos_Y] = Pos[1];
    GaragenInfo[gid][giOPos_Z] = Pos[2];
    GaragenInfo[gid][giOPos_A] = Pos[3];

	mysql_format(sqlHandle, query,sizeof(query),"UPDATE `garagen` SET `OPos_X`='%f', `OPos_Y`='%f', `OPos_Z`='%f', `OPos_A`='%f' WHERE `ID`='%d'",Pos[0],Pos[1],Pos[2],Pos[3],gid);
	mysql_tquery(sqlHandle, query);

	format(query,sizeof(query),"Die Ausgang Position der GaragenID: %d wurde erfolgreich erstellt.",gid);
	SendClientMessage(playerid,COLOR_SUPER,query);
	return 1;
}

CMD:editgarage(playerid,params[])
{
    new Preis, query[224];
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(!AnGarage(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keiner Garage.");
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/editgarage [Preis]");
    new hs = GetNearGarageID(playerid);
    if(strlen(GaragenInfo[hs][giBesitzer]) > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es können nur unverkaufte Garagen bearbeitet werden.");
    GaragenInfo[hs][giPreis] = Preis;
	format(query,128,"Der Preis von der Garage (ID:%d) wurde auf %d$ gesetzt.",hs,Preis);
	SendClientMessage(playerid,COLOR_SUPER,query);
	DestroyDynamic3DTextLabel(GaragenInfo[hs][giText]);
	GaragenInfo[hs][giText] = Text3D:INVALID_3DTEXT_ID;
	DestroyDynamicPickup(GaragenInfo[hs][giPickup]);
    if(strlen(HausInfo[hs][hsBesitzer]) < 2)
	{
		format(query, sizeof(query), "Haus 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Haus zu kaufen", hs, GaragenInfo[hs][giPreis]);
		GaragenInfo[hs][giPickup] = CreateDynamicPickup(1273, 23, GaragenInfo[hs][giPos_X], GaragenInfo[hs][giPos_Y], GaragenInfo[hs][giPos_Z], -1);
   	}
   	GaragenInfo[hs][giText] = CreateDynamic3DTextLabel(query, COLOR_WHITE, GaragenInfo[hs][giPos_X], GaragenInfo[hs][giPos_Y], GaragenInfo[hs][giPos_Z], 10.0);
	return 1;
}

CMD:delgarage(playerid,params[])
{
	new query[128], hs;
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"d",hs))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/delgarage [ID]");
    if(GaragenInfo[hs][giErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Diese Garage existiert nicht.");
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `garagen` WHERE `ID`='%d'",hs);
    mysql_tquery(sqlHandle, query);
	DestroyDynamic3DTextLabel(GaragenInfo[hs][giText]);
	GaragenInfo[hs][giText] = Text3D:INVALID_3DTEXT_ID;
	DestroyDynamicPickup(GaragenInfo[hs][giPickup]);
	GaragenInfo[hs][giErstellt] = false;
	GaragenInfo[hs][giPos_X] = 0;
	GaragenInfo[hs][giPos_Y] = 0;
	GaragenInfo[hs][giPos_Z] = 0;
	GaragenInfo[hs][giPreis] = 0;
 	GaragenInfo[hs][giBesitzer] = 0;
    format(query,sizeof(query),"Die Garage (ID: %d) wurde erfolgreich gelöscht",hs);
    SendClientMessage(playerid,COLOR_SUPER,query);
    return 1;
}

CMD:garage(playerid,params[])
{
    if(!AnGarage(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keiner Garage.");
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Fahrzeug.");
    new hs = GetNearGarageID(playerid);
    if(SpielerInfo[playerid][sGarage] == hs || SpielerInfo[playerid][sGMieter] == hs)
    {
        new str[340], string[10][34], vehicleid = GetPlayerVehicleID(playerid);
        if(FahrzeugInfo[vehicleid][fDatabaseID] != 0 || FahrzeugInfo[vehicleid][fGruppe] != 0 || FahrzeugInfo[vehicleid][fBesitzerID] != 0)
        {
			if(GaragenInfo[hs][giFahrzeug][0] == 0){format(string[0],34,"{9ACD32}Parkplatz frei");}
			else{format(string[0],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][0]-400]);}
			if(GaragenInfo[hs][giFahrzeug][1] == 0){format(string[1],34,"{9ACD32}Parkplatz frei");}
			else{format(string[1],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][1]-400]);}
			if(GaragenInfo[hs][giFahrzeug][2] == 0){format(string[2],34,"{9ACD32}Parkplatz frei");}
			else{format(string[2],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][2]-400]);}
			if(GaragenInfo[hs][giFahrzeug][3] == 0){format(string[3],34,"{9ACD32}Parkplatz frei");}
			else{format(string[3],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][3]-400]);}
			if(GaragenInfo[hs][giFahrzeug][4] == 0){format(string[4],34,"{9ACD32}Parkplatz frei");}
			else{format(string[4],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][4]-400]);}
			if(GaragenInfo[hs][giFahrzeug][5] == 0){format(string[5],34,"{9ACD32}Parkplatz frei");}
			else{format(string[5],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][5]-400]);}
			if(GaragenInfo[hs][giFahrzeug][6] == 0){format(string[6],34,"{9ACD32}Parkplatz frei");}
			else{format(string[6],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][6]-400]);}
			if(GaragenInfo[hs][giFahrzeug][7] == 0){format(string[7],34,"{9ACD32}Parkplatz frei");}
			else{format(string[7],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][7]-400]);}
			if(GaragenInfo[hs][giFahrzeug][8] == 0){format(string[8],34,"{9ACD32}Parkplatz frei");}
			else{format(string[8],34,"{FF0000}%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][8]-400]);}
			if(GaragenInfo[hs][giFahrzeug][9] == 0){format(string[9],34,"{9ACD32}Parkplatz frei");}
			else{format(string[9],34,"%s",FahrzeugName[GaragenInfo[hs][giFahrzeug][9]-400]);}
			format(str,sizeof str,"%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string[0],string[1],string[2],string[3],string[4],string[5],string[6],string[7],string[8],string[9]);
	        ShowPlayerDialog(playerid,DIALOG_GARAGE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Garagen System",str,"Parken","Abbrechen");
	        return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst in Garagen nur Gruppen & Privatfahrzeuge unterbringen.");
		return 1;
    }
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst deine Fahrzeuge hier nicht unterbringen.");
	return 1;
}