CMD:createammu(playerid,params[])
{
    new query[256], Float:pX, Float:pY, Float:pZ, Text[224], Preis;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createammu [Preis]");
	GetPlayerPos(playerid,pX,pY,pZ);
	for(new mf=1;mf<MAX_AMMUS;mf++)
	{
	    if(AmmunationInfo[mf][amErstellt] == true)continue;
	    AmmunationInfo[mf][amErstellt] = true;
	    AmmunationInfo[mf][amPos_X] = pX;
	    AmmunationInfo[mf][amPos_Y] = pY;
	    AmmunationInfo[mf][amPos_Z] = pZ;
	    AmmunationInfo[mf][amPreis] = Preis;
        mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `ammunation` (`ID`,`Preis`,`Pos_X`,`Pos_Y`,`Pos_Z`) VALUES ('%d','%d','%f','%f','%f')",mf,Preis,pX,pY,pZ);
	 	mysql_tquery(sqlHandle, query);
		format(Text, sizeof(Text), "Ammunation 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Ammunation zu kaufen", mf, Preis);
		AmmunationInfo[mf][amText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX, pY, pZ, 10.0);
		AmmunationInfo[mf][amPickup] = CreatePickup(1273, 23, pX, pY, pZ, -1);
	    format(query,sizeof(query),"Das Ammunation (ID: %d) wurde erfolgreich erstellt.",mf);
		SendClientMessage(playerid,COLOR_SUPER,query);
		return 1;
	}
	return 1;
}

CMD:editammu(playerid,params[])
{
    new Preis, query[224];
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(!AnAmmunation(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keiner Ammunation.");
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/editammu [Preis]");
    new an = GetNearAmmunationID(playerid);
    AmmunationInfo[an][amPreis] = Preis;
	format(query,128,"Der Preis vom Ammunation (ID:%d) wurde auf %d$ gesetzt.",an,Preis);
	SendClientMessage(playerid,COLOR_SUPER,query);
	DestroyDynamic3DTextLabel(AmmunationInfo[an][amText]);
	AmmunationInfo[an][amText] = Text3D:INVALID_3DTEXT_ID;
    if(strlen(AmmunationInfo[an][amBesitzer]) < 2)
	{
		format(query, sizeof(query), "Ammunation 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das Ammunation zu kaufen", an, AmmunationInfo[an][amPreis]);

  	}
   	else if(strlen(AmmunationInfo[an][amBesitzer]) > 2)
	{
		format(query, sizeof(query), "Ammunation 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s", an, AmmunationInfo[an][amBesitzer]);
	}
	SaveAmmunationById(an);
	AmmunationInfo[an][amText] = CreateDynamic3DTextLabel(query, COLOR_WHITE, AmmunationInfo[an][amPos_X], AmmunationInfo[an][amPos_Y], AmmunationInfo[an][amPos_Z], 10.0);
	return 1;
}

CMD:delammu(playerid,params[])
{
	new query[128], an;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",an))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/delammu [ID]");
    if(AmmunationInfo[an][amErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieses Ammunation existiert nicht.");
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `ammunation` WHERE `ID`='%d'",an);
    mysql_tquery(sqlHandle, query);
	DestroyDynamic3DTextLabel(AmmunationInfo[an][amText]);
	AmmunationInfo[an][amText] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(AmmunationInfo[an][amPickup]);
	AmmunationInfo[an][amErstellt] = false;
	AmmunationInfo[an][amPos_X] = 0;
	AmmunationInfo[an][amPos_Y] = 0;
	AmmunationInfo[an][amPos_Z] = 0;
	AmmunationInfo[an][amPreis] = 0;
 	AmmunationInfo[an][amBesitzer] = 0;
    format(query,sizeof(query),"Das Ammunation (ID: %d) wurde erfolgreich gelöscht",an);
    SendClientMessage(playerid,COLOR_SUPER,query);
    return 1;
}