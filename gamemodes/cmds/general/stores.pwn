CMD:createstore(playerid,params[])
{
    new query[256], Float:pX, Float:pY, Float:pZ, Text[224], Preis;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createstore [Preis]");
	GetPlayerPos(playerid,pX,pY,pZ);
	for(new mf=1;mf<MAX_STORES;mf++)
	{
	    if(StoreInfo[mf][siErstellt] == true)continue;
	    StoreInfo[mf][siErstellt] = true;
	    StoreInfo[mf][siPos_X] = pX;
	    StoreInfo[mf][siPos_Y] = pY;
	    StoreInfo[mf][siPos_Z] = pZ;
	    StoreInfo[mf][siPreis] = Preis;
        mysql_format(sqlHandle, query,sizeof(query),"INSERT INTO `stores` (`ID`,`Preis`,`Pos_X`,`Pos_Y`,`Pos_Z`) VALUES ('%d','%d','%f','%f','%f')",mf,Preis,pX,pY,pZ);
	 	mysql_tquery(sqlHandle, query);
		format(Text, sizeof(Text), "24/7 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das 24/7 zu kaufen", mf, Preis);
		StoreInfo[mf][siText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, pX, pY, pZ, 10.0);
		StoreInfo[mf][siPickup] = CreatePickup(1273, 23, pX, pY, pZ, -1);
	    format(query,sizeof(query),"Der 24/7 (ID: %d) wurde erfolgreich erstellt.",mf);
		SendClientMessage(playerid,COLOR_SUPER,query);
		return 1;
	}
	return 1;
}

CMD:editstore(playerid,params[])
{
    new Preis, query[224];
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(!AnStore(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem 24/7.");
    if(sscanf(params,"d",Preis))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/editstore [Preis]");
    new an = GetNearStoreID(playerid);
    StoreInfo[an][siPreis] = Preis;
	format(query,128,"Der Preis vom 24/7 (ID:%d) wurde auf %d$ gesetzt.",an,Preis);
	SendClientMessage(playerid,COLOR_SUPER,query);
	DestroyDynamic3DTextLabel(StoreInfo[an][siText]);
	StoreInfo[an][siText] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(StoreInfo[an][siPickup]);
    if(strlen(StoreInfo[an][siBesitzer]) < 2)
	{
		format(query, sizeof(query), "24/7 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das 24/7 zu kaufen", an, StoreInfo[an][siPreis]);
		StoreInfo[an][siPickup] = CreatePickup(1273, 23, StoreInfo[an][siPos_X], StoreInfo[an][siPos_Y], StoreInfo[an][siPos_Z], -1);
  	}
    StoreInfo[an][siText] = CreateDynamic3DTextLabel(query, COLOR_WHITE, StoreInfo[an][siPos_X], StoreInfo[an][siPos_Y], StoreInfo[an][siPos_Z], 10.0);
	return 1;
}

CMD:delstore(playerid,params[])
{
	new query[128], an;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(sscanf(params,"d",an))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/delstore [ID]");
    if(StoreInfo[an][siErstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser 24/7 existiert nicht.");
    mysql_format(sqlHandle, query,sizeof(query),"DELETE FROM `stores` WHERE `ID`='%d'",an);
    mysql_tquery(sqlHandle, query);
	DestroyDynamic3DTextLabel(StoreInfo[an][siText]);
	StoreInfo[an][siText] = Text3D:INVALID_3DTEXT_ID;
	DestroyPickup(StoreInfo[an][siPickup]);
	StoreInfo[an][siErstellt] = false;
	StoreInfo[an][siPos_X] = 0;
	StoreInfo[an][siPos_Y] = 0;
	StoreInfo[an][siPos_Z] = 0;
	StoreInfo[an][siPreis] = 0;
 	StoreInfo[an][siBesitzer] = 0;
    format(query,sizeof(query),"Der 24/7 (ID: %d) wurde erfolgreich gelöscht",an);
    SendClientMessage(playerid,COLOR_SUPER,query);
    return 1;
}