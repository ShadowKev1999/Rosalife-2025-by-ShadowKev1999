CMD:createhaus(playerid,params[])
{
    new query[256], Float:pX, Float:pY, Float:pZ, Text[224], Ort, Typ, Preis;
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"ddd",Ort,Typ,Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createhaus [LS=1|SF=2|LV=3] [Appartment=1|Haus=2|Villa=3] [Preis]");
	GetPlayerPos(playerid,pX,pY,pZ);
	for(new mf=1;mf<MAX_HAUSER;mf++)
	{
	    if(HausInfo[mf][hsErstellt] == true)continue;
	    HausInfo[mf][hsErstellt] = true;
	    HausInfo[mf][hsPos_X] = pX;
	    HausInfo[mf][hsPos_Y] = pY;
	    HausInfo[mf][hsPos_Z] = pZ;
	    HausInfo[mf][hsPreis] = Preis;
	    HausInfo[mf][hsOrt] = Ort;
	    HausInfo[mf][hsTyp] = Typ;
	 	if(Typ == 1)//Appartment
	 	{
   			mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `hauser` (`ID`,`Preis`,`Ort`,`Typ`,`Interior`,`Pos_X`,`Pos_Y`,`Pos_Z`,`IPos_X`,`IPos_Y`,`IPos_Z`) VALUES ('%d','%d','%d','%d','1','%f','%f','%f','223.043991','1289.259888','1082.199951')",mf,Preis,Ort,Typ,pX,pY,pZ);
			mysql_tquery(sqlHandle, query);
			HausInfo[mf][hsIPos_X] = 223.043991;
			HausInfo[mf][hsIPos_Y] = 1289.259888;
			HausInfo[mf][hsIPos_Z] = 1082.199951;
			HausInfo[mf][hsInterior] = 1;
			format(Text, sizeof(Text), "Appartment 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Appartment zu kaufen", mf, Preis);
	    	format(query,sizeof(query),"Das Appartment (ID: %d) wurde erfolgreich erstellt.",mf);
		}
		else if(Typ == 2)//Haus
		{
   			mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `hauser` (`ID`,`Preis`,`Ort`,`Typ`,`Interior`,`Pos_X`,`Pos_Y`,`Pos_Z`,`IPos_X`,`IPos_Y`,`IPos_Z`) VALUES ('%d','%d','%d','%d','2','%f','%f','%f','225.756989','1240.000000','1082.149902')",mf,Preis,Ort,Typ,pX,pY,pZ);
			mysql_tquery(sqlHandle, query);
			HausInfo[mf][hsIPos_X] = 225.756989;
			HausInfo[mf][hsIPos_Y] = 1240.000000;
			HausInfo[mf][hsIPos_Z] = 1082.149902;
			HausInfo[mf][hsInterior] = 2;
			format(Text, sizeof(Text), "Haus 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Haus zu kaufen", mf, Preis);
	    	format(query,sizeof(query),"Das Haus (ID: %d) wurde erfolgreich erstellt.",mf);
		}
		else if(Typ == 3)//Villa
		{
   			mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `hauser` (`ID`,`Preis`,`Ort`,`Typ`,`Interior`,`Pos_X`,`Pos_Y`,`Pos_Z`,`IPos_X`,`IPos_Y`,`IPos_Z`) VALUES ('%d','%d','%d','%d','7','%f','%f','%f','225.630997','1022.479980','1084.069946')",mf,Preis,Ort,Typ,pX,pY,pZ);
			mysql_tquery(sqlHandle, query);
			HausInfo[mf][hsIPos_X] = 225.630997;
			HausInfo[mf][hsIPos_Y] = 1022.479980;
			HausInfo[mf][hsIPos_Z] = 1084.069946;
			HausInfo[mf][hsInterior] = 7;
			format(Text, sizeof(Text), "Villa 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Villa zu kaufen", mf, Preis);
	    	format(query,sizeof(query),"Die Villa (ID: %d) wurde erfolgreich erstellt.",mf);
		}
		HausInfo[mf][hsText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX, pY, pZ, 10.0);
		HausInfo[mf][hsPickup] = CreateDynamicPickup(1273, 23, pX, pY, pZ, -1);
		SendClientMessage(playerid,COLOR_SUPER,query);
		return 1;
	}
	return 1;
}

CMD:edithaus(playerid,params[])
{
    new Preis, query[224];
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(!AnHaus(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem Haus.");
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/edithaus [Preis]");
    new hs = GetNearHausID(playerid);
    if(strlen(HausInfo[hs][hsBesitzer]) > 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es können nur unverkaufte Häuser bearbeitet werden.");
    HausInfo[hs][hsPreis] = Preis;
	format(query,128,"Der Preis vom Haus (ID:%d) wurde auf %d$ gesetzt.",hs,Preis);
	SendClientMessage(playerid,COLOR_SUPER,query);
	DestroyDynamic3DTextLabel(HausInfo[hs][hsText]);
	HausInfo[hs][hsText] = Text3D:INVALID_3DTEXT_ID;
	DestroyDynamicPickup(HausInfo[hs][hsPickup]);
    if(strlen(HausInfo[hs][hsBesitzer]) < 2)
	{
	    if(HausInfo[hs][hsTyp] == 1)//Appartment
	    {
			format(query, sizeof(query), "Appartment 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Appartment zu kaufen", hs, HausInfo[hs][hsPreis]);
			HausInfo[hs][hsPickup] = CreateDynamicPickup(1273, 23, HausInfo[hs][hsPos_X], HausInfo[hs][hsPos_Y], HausInfo[hs][hsPos_Z], -1);
		}
		else if(HausInfo[hs][hsTyp] == 2)//Haus
		{
			format(query, sizeof(query), "Haus 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Haus zu kaufen", hs, HausInfo[hs][hsPreis]);
			HausInfo[hs][hsPickup] = CreateDynamicPickup(1273, 23, HausInfo[hs][hsPos_X], HausInfo[hs][hsPos_Y], HausInfo[hs][hsPos_Z], -1);
		}
		else if(HausInfo[hs][hsTyp] == 3)//Villa
		{
			format(query, sizeof(query), "Villa 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Villa zu kaufen", hs, HausInfo[hs][hsPreis]);
			HausInfo[hs][hsPickup] = CreateDynamicPickup(1273, 23, HausInfo[hs][hsPos_X], HausInfo[hs][hsPos_Y], HausInfo[hs][hsPos_Z], -1);
		}
   	}
	SaveHouseById(hs);
   	HausInfo[hs][hsText] = CreateDynamic3DTextLabel(query, COLOR_WHITE, HausInfo[hs][hsPos_X], HausInfo[hs][hsPos_Y], HausInfo[hs][hsPos_Z], 10.0);
	return 1;
}

CMD:delhaus(playerid,params[])
{
	new query[128], hs;
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
    if(sscanf(params,"d",hs))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/delhaus [ID]");
    if(HausInfo[hs][hsErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Haus existiert nicht.");
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `hauser` WHERE `ID`='%d'",hs);
    mysql_tquery(sqlHandle, query);
	DestroyDynamic3DTextLabel(HausInfo[hs][hsText]);
	HausInfo[hs][hsText] = Text3D:INVALID_3DTEXT_ID;
	DestroyDynamicPickup(HausInfo[hs][hsPickup]);
	HausInfo[hs][hsErstellt] = false;
	HausInfo[hs][hsPos_X] = 0;
	HausInfo[hs][hsPos_Y] = 0;
	HausInfo[hs][hsPos_Z] = 0;
	HausInfo[hs][hsPreis] = 0;
 	HausInfo[hs][hsBesitzer] = 0;
    format(query,sizeof(query),"Das Haus (ID: %d) wurde erfolgreich gelöscht",hs);
    SendClientMessage(playerid,COLOR_SUPER,query);
	//FurniureSystem
	DeleteAllFurnitures(hs);
    return 1;
}

CMD:heilen(playerid, params[])
{
	if(GetPVarInt(playerid,"InHaus") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich in keinem Haus.");
	new hs = GetPVarInt(playerid,"HausID");
 	if(IsPlayerInRangeOfPoint(playerid,5.0,HausInfo[hs][hsIPos_X],HausInfo[hs][hsIPos_Y],HausInfo[hs][hsIPos_Z]))
  	{
   		if(HausInfo[hs][hsHealth] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Haus besitzt kein Health-Upgrade.");
     	SendClientMessage(playerid,COLOR_SUPER,"Du hast dich geheilt.");
		SetPlayerHealth(playerid,100);
		return 1;
  	}
   	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Eingang vom Haus.");
    return 1;
}

CMD:mieten(playerid, params[])
{
	new string[64], hs = GetNearHausID(playerid);
 	if(!AnHaus(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich an keinem Haus.");
  	if(HausInfo[hs][hsMietbar] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst dich hier nicht einmieten.");
   	if(SpielerInfo[playerid][sHaus] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt bereits ein Haus und kannst dich daher nirgendswo einmieten.");
	if(SpielerInfo[playerid][sPerso] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt keinen Personalausweis. Begebe dich zu Stadthalle und beantrage dort deinen Personalausweis.");
 	format(string,sizeof(string),"{FFFFFF}Möchtest du dich für %d$ hier einmieten ?",HausInfo[hs][hsMiete]);
	ShowPlayerDialog(playerid,DIALOG_HAUS_MIETEN,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Haussystem",string,"Ja","Nein");
	return 1;
}