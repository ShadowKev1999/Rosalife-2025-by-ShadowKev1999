stock SaveStores()
{
	new query[364];
	for(new mf=1;mf<MAX_STORES;mf++)
    {
        if(StoreInfo[mf][siErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `stores` SET `Besitzer`='%s', `Kasse`='%d', `Preis`='%d', `Navi`='%d', `Handy`='%d', `Telefonbuch`='%d', `Repairkit`='%d', `Kamera`='%d' WHERE `ID`='%d'",
	    StoreInfo[mf][siBesitzer],StoreInfo[mf][siKasse],StoreInfo[mf][siPreis],StoreInfo[mf][siNavi],StoreInfo[mf][siHandy],StoreInfo[mf][siTelefonbuch],StoreInfo[mf][siRepairkit],StoreInfo[mf][siKamera],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

SaveStoreById(mf)
{
	new query[364];
	if(StoreInfo[mf][siErstellt] == false) return 1;
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `stores` SET `Besitzer`='%s', `Kasse`='%d', `Preis`='%d', `Navi`='%d', `Handy`='%d', `Telefonbuch`='%d', `Repairkit`='%d', `Kamera`='%d' WHERE `ID`='%d'",
	StoreInfo[mf][siBesitzer],StoreInfo[mf][siKasse],StoreInfo[mf][siPreis],StoreInfo[mf][siNavi],StoreInfo[mf][siHandy],StoreInfo[mf][siTelefonbuch],StoreInfo[mf][siRepairkit],StoreInfo[mf][siKamera],mf);
	mysql_tquery(sqlHandle, query);
	return 1;
}

stock AnStore(playerid)
{
	for(new ts = 1;ts<MAX_STORES;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, StoreInfo[ts][siPos_X], StoreInfo[ts][siPos_Y], StoreInfo[ts][siPos_Z]))
		{
 	    	return 1;
		}
	}
	return 0;
}

stock GetNearStoreID(playerid)
{
	for(new ts = 1;ts<MAX_STORES;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, StoreInfo[ts][siPos_X], StoreInfo[ts][siPos_Y], StoreInfo[ts][siPos_Z]))return ts;
	}
	return -1;
}

public LoadStores()
{
    new stores;
	new an = 1;
	new var[24], Text[224];
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `stores` ORDER BY `ID` ASC");

	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "ID",var);	an = strval(var);
		cache_get_value_name(i, "Besitzer",StoreInfo[an][siBesitzer]);
		cache_get_value_name(i, "Preis",var); StoreInfo[an][siPreis] = strval(var);
		cache_get_value_name(i, "Kasse",var); StoreInfo[an][siKasse] = strval(var);
		cache_get_value_name(i, "Navi",var); StoreInfo[an][siNavi] = strval(var);
		cache_get_value_name(i, "Handy",var); StoreInfo[an][siHandy] = strval(var);
		cache_get_value_name(i, "Telefonbuch",var); StoreInfo[an][siTelefonbuch] = strval(var);
		cache_get_value_name(i, "Repairkit",var); StoreInfo[an][siRepairkit] = strval(var);
		cache_get_value_name(i, "Kamera",var); StoreInfo[an][siKamera] = strval(var);
		cache_get_value_name(i, "Pos_X",var); StoreInfo[an][siPos_X] = floatstr(var);
		cache_get_value_name(i, "Pos_Y",var); StoreInfo[an][siPos_Y] = floatstr(var);
		cache_get_value_name(i, "Pos_Z",var); StoreInfo[an][siPos_Z] = floatstr(var);
		if(strlen(StoreInfo[an][siBesitzer]) < 2)
		{
			format(Text, sizeof(Text), "24/7 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir das 24/7 zu kaufen", an, StoreInfo[an][siPreis]);
			StoreInfo[an][siPickup] = CreatePickup(1273, 23, StoreInfo[an][siPos_X], StoreInfo[an][siPos_Y], StoreInfo[an][siPos_Z], -1);
		}
		else
		{
			format(Text, sizeof(Text), "24/7 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s", an, StoreInfo[an][siBesitzer]);
			StoreInfo[an][siPickup] = CreatePickup(1272, 23, StoreInfo[an][siPos_X], StoreInfo[an][siPos_Y], StoreInfo[an][siPos_Z], -1);
		}
		StoreInfo[an][siText] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, StoreInfo[an][siPos_X], StoreInfo[an][siPos_Y], StoreInfo[an][siPos_Z], 10.0);
		StoreInfo[an][siErstellt] = true;

		if(StoreInfo[an][siErstellt] == true)
		{
			BotSTORE[an] = CreateDynamicActor(296, -22.0128,-140.4201,1003.5469, 0.5603, .interiorid = 16, .worldid = an);
		}
		stores++;
	}
	cache_delete(result);
	printf("Es wurden %d 24/7 erfolgreich geladen und erstellt.",stores);
}