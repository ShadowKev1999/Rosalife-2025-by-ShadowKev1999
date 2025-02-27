stock SaveTankstelleByID(mf)
{
	new query[364];
	if(TankstellenInfo[mf][tsErstellt] == false) return 0;
	mysql_format(sqlHandle, query,sizeof query,"UPDATE `tankstellen` SET `Besitzer`='%s', `Beschreibung`='%s', `Preis`='%d', `Benzin`='%d', `Diesel`='%d', `Kerosin`='%d', `Benzin Preis`='%d', `Diesel Preis`='%d', `Kerosin Preis`='%d', `Benzin Liter`='%d', `Diesel Liter`='%d', `Kerosin Liter`='%d', `Kasse`='%d' WHERE `ID`='%d'",
	TankstellenInfo[mf][tsBesitzer],TankstellenInfo[mf][tsBeschreibung],TankstellenInfo[mf][tsPreis],TankstellenInfo[mf][tsBenzin],TankstellenInfo[mf][tsDiesel],TankstellenInfo[mf][tsKerosin],TankstellenInfo[mf][tsBenzinPreis],TankstellenInfo[mf][tsDieselPreis],TankstellenInfo[mf][tsKerosinPreis],
	TankstellenInfo[mf][tsBenzinLiter],TankstellenInfo[mf][tsDieselLiter],TankstellenInfo[mf][tsKerosinLiter],TankstellenInfo[mf][tsKasse],mf);
	mysql_tquery(sqlHandle, query);
	return 1;
}

stock SaveTankstellen()
{
	new query[364];
	for(new mf=1;mf<MAX_TSTELLEN;mf++)
    {
        if(TankstellenInfo[mf][tsErstellt] == false)continue;
   		mysql_format(sqlHandle, query,sizeof query,"UPDATE `tankstellen` SET `Besitzer`='%s', `Beschreibung`='%s', `Preis`='%d', `Benzin`='%d', `Diesel`='%d', `Kerosin`='%d', `Benzin Preis`='%d', `Diesel Preis`='%d', `Kerosin Preis`='%d', `Benzin Liter`='%d', `Diesel Liter`='%d', `Kerosin Liter`='%d', `Kasse`='%d' WHERE `ID`='%d'",
	    TankstellenInfo[mf][tsBesitzer],TankstellenInfo[mf][tsBeschreibung],TankstellenInfo[mf][tsPreis],TankstellenInfo[mf][tsBenzin],TankstellenInfo[mf][tsDiesel],TankstellenInfo[mf][tsKerosin],TankstellenInfo[mf][tsBenzinPreis],TankstellenInfo[mf][tsDieselPreis],TankstellenInfo[mf][tsKerosinPreis],
		TankstellenInfo[mf][tsBenzinLiter],TankstellenInfo[mf][tsDieselLiter],TankstellenInfo[mf][tsKerosinLiter],TankstellenInfo[mf][tsKasse],mf);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock AnTankstelle(playerid)
{
	for(new ts = 1;ts<MAX_TSTELLEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid,5.0,TankstellenInfo[ts][tsPos_X][0],TankstellenInfo[ts][tsPos_Y][0],TankstellenInfo[ts][tsPos_Z][0]) || IsPlayerInRangeOfPoint(playerid,5.0,TankstellenInfo[ts][tsPos_X][1],TankstellenInfo[ts][tsPos_Y][1],TankstellenInfo[ts][tsPos_Z][1]))
		{
 	    	return 1;
		}
	}
	return 0;
}

stock AnTankstellenHaus(playerid)
{
	for(new ts = 1;ts<MAX_TSTELLEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid,3.0,TankstellenInfo[ts][tsEPos_X],TankstellenInfo[ts][tsEPos_Y],TankstellenInfo[ts][tsEPos_Z]))
		{
 	    	return 1;
		}
	}
	return 0;
}

stock GetNearTankstellenHausID(playerid)
{
	for(new ts = 1;ts<MAX_TSTELLEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid, 3.0, TankstellenInfo[ts][tsEPos_X], TankstellenInfo[ts][tsEPos_Y], TankstellenInfo[ts][tsEPos_Z]))return ts;
	}
	return -1;
}

stock GetNearTankstelleID(playerid)
{
	for(new ts = 1;ts<MAX_TSTELLEN;ts++)
    {
		if(IsPlayerInRangeOfPoint(playerid,5.0,TankstellenInfo[ts][tsPos_X][0],TankstellenInfo[ts][tsPos_Y][0],TankstellenInfo[ts][tsPos_Z][0]) || IsPlayerInRangeOfPoint(playerid,5.0,TankstellenInfo[ts][tsPos_X][1],TankstellenInfo[ts][tsPos_Y][1],TankstellenInfo[ts][tsPos_Z][1]))return ts;
	}
	return -1;
}

public LoadTankstellen()
{
    new tstelleninfos;
	new ts = 1;
	new var[24], Text[224], itxt[128], ioID;
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM `tankstellen` ORDER BY `ID` ASC");
	
	for(new i = 0; i < cache_num_rows(); i++)
	{
		cache_get_value_name(i, "ID",var);	ts = strval(var);
		cache_get_value_name(i, "Besitzer",TankstellenInfo[ts][tsBesitzer]);
		cache_get_value_name(i, "Beschreibung",TankstellenInfo[ts][tsBeschreibung]);
		cache_get_value_name(i, "Preis",var); TankstellenInfo[ts][tsPreis] = strval(var);
		cache_get_value_name(i, "Kasse",var); TankstellenInfo[ts][tsKasse] = strval(var);
		cache_get_value_name(i, "Benzin",var); TankstellenInfo[ts][tsBenzin] = strval(var);
		cache_get_value_name(i, "Benzin Preis",var); TankstellenInfo[ts][tsBenzinPreis] = strval(var);
		cache_get_value_name(i, "Diesel",var); TankstellenInfo[ts][tsDiesel] = strval(var);
		cache_get_value_name(i, "Diesel Preis",var); TankstellenInfo[ts][tsDieselPreis] = strval(var);
		cache_get_value_name(i, "Kerosin",var); TankstellenInfo[ts][tsKerosin] = strval(var);
		cache_get_value_name(i, "Kerosin Preis",var); TankstellenInfo[ts][tsKerosinPreis] = strval(var);
		cache_get_value_name(i, "Benzin Liter",var); TankstellenInfo[ts][tsBenzinLiter] = strval(var);
		cache_get_value_name(i, "Diesel Liter",var); TankstellenInfo[ts][tsDieselLiter] = strval(var);
		cache_get_value_name(i, "Kerosin Liter",var); TankstellenInfo[ts][tsKerosinLiter] = strval(var);
		cache_get_value_name(i, "TPos_X1",var); TankstellenInfo[ts][tsPos_X][0] = floatstr(var);
		cache_get_value_name(i, "TPos_Y1",var); TankstellenInfo[ts][tsPos_Y][0] = floatstr(var);
		cache_get_value_name(i, "TPos_Z1",var); TankstellenInfo[ts][tsPos_Z][0] = floatstr(var);
		cache_get_value_name(i, "TPos_X2",var); TankstellenInfo[ts][tsPos_X][1] = floatstr(var);
		cache_get_value_name(i, "TPos_Y2",var); TankstellenInfo[ts][tsPos_Y][1] = floatstr(var);
		cache_get_value_name(i, "TPos_Z2",var); TankstellenInfo[ts][tsPos_Z][1] = floatstr(var);
		cache_get_value_name(i, "EPos_X",var); TankstellenInfo[ts][tsEPos_X] = floatstr(var);
		cache_get_value_name(i, "EPos_Y",var); TankstellenInfo[ts][tsEPos_Y] = floatstr(var);
		cache_get_value_name(i, "EPos_Z",var); TankstellenInfo[ts][tsEPos_Z] = floatstr(var);
		cache_get_value_name(i, "S_PosX",var); TankstellenInfo[ts][tsTPos_X] = floatstr(var);
		cache_get_value_name(i, "S_PosY",var); TankstellenInfo[ts][tsTPos_Y] = floatstr(var);
		cache_get_value_name(i, "S_PosZ",var); TankstellenInfo[ts][tsTPos_Z] = floatstr(var);
		cache_get_value_name(i, "S_PosR",var); TankstellenInfo[ts][tsTPos_R] = floatstr(var);

		ioID = CreateDynamicObject(5811, TankstellenInfo[ts][tsTPos_X], TankstellenInfo[ts][tsTPos_Y], TankstellenInfo[ts][tsTPos_Z], 0.000, 0.000, TankstellenInfo[ts][tsTPos_R]);
		TankstellenInfo[ts][tsTafel] = ioID;

		new pdisel,pbenzien,pkerosin;

        if(strlen(TankstellenInfo[ts][tsBesitzer]) < 2)
		{
 			format(itxt, 128, "\
			{D8D8D8}Petrol Station\n\
			{FF8000}———————————————");
			SetDynamicObjectMaterialText(ioID, 5, itxt, 90, "Tahoma", 35, 0, -32256, -16777216, 1);

			format(itxt, 128, "\
			Besitzer:\n\
			{FFFFFF}Staat");
			SetDynamicObjectMaterialText(ioID, 1, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);

			pdisel = 3;
			pbenzien = 5;
			pkerosin = 10;

   			format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}' zu verkaufen!\nBesitzer: {FF0000}Staat{FFFFFF}\nPreis: {FF0000}%d${FFFFFF}\nBenutze '{FF0000}/kaufen{FFFFFF}'\num dir die Tankstelle zu kaufen", ts, TankstellenInfo[ts][tsPreis]);
   			TankstellenInfo[ts][tsPickup][0] = CreatePickup(1273, 23, TankstellenInfo[ts][tsEPos_X], TankstellenInfo[ts][tsEPos_Y], TankstellenInfo[ts][tsEPos_Z], -1);
      	}
       	else
  		{
 			format(itxt, 128, "\
			{D8D8D8}%s\n\
			{FF8000}———————————————",TankstellenInfo[ts][tsBeschreibung]);
			SetDynamicObjectMaterialText(ioID, 5, itxt, 90, "Tahoma", 35, 0, -32256, -16777216, 1);

 			format(itxt, 128, "\
			Besitzer:\n\
			{FFFFFF}%s",TankstellenInfo[ts][tsBesitzer]);
			SetDynamicObjectMaterialText(TankstellenInfo[ts][tsTafel], 1, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);

		 	pdisel = TankstellenInfo[ts][tsDieselPreis];
			pbenzien = TankstellenInfo[ts][tsBenzinPreis];
			pkerosin = TankstellenInfo[ts][tsKerosinPreis];

    		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBesitzer: {FF0000}%s", ts, TankstellenInfo[ts][tsBesitzer]);
    		TankstellenInfo[ts][tsPickup][0] = CreatePickup(1272, 23, TankstellenInfo[ts][tsEPos_X], TankstellenInfo[ts][tsEPos_Y], TankstellenInfo[ts][tsEPos_Z], -1);
      	}
      	if(strlen(TankstellenInfo[ts][tsBesitzer]) > 2 && TankstellenInfo[ts][tsBenzin] > 0 || strlen(TankstellenInfo[ts][tsBesitzer]) < 2)
		{
			format(itxt, 128, "\
			\n\
			{FFFFFF}Benzin {FF8000} $%d\n\
			{FF8000}———————————————",pbenzien);
			SetDynamicObjectMaterialText(ioID, 4, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}
		else
		{
			format(itxt, 128, "\
			\n\
			{FFFFFF}Benzin {FF8000} $---\n\
			{FF8000}———————————————");
			SetDynamicObjectMaterialText(ioID, 4, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}

		if(strlen(TankstellenInfo[ts][tsBesitzer]) > 2 && TankstellenInfo[ts][tsDiesel] > 0 || strlen(TankstellenInfo[ts][tsBesitzer]) < 2)
		{
	        format(itxt, 128,"\
			\n\
			{FFFFFF}Diesel {FF8000} $%d\n\
			{FF8000}———————————————",pdisel);
			SetDynamicObjectMaterialText(ioID, 3, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}
		else
		{
       		format(itxt, 128,"\
			\n\
			{FFFFFF}Diesel {FF8000} $---\n\
			{FF8000}———————————————");
			SetDynamicObjectMaterialText(ioID, 3, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}

		if(strlen(TankstellenInfo[ts][tsBesitzer]) > 2 && TankstellenInfo[ts][tsKerosin] > 0 || strlen(TankstellenInfo[ts][tsBesitzer]) < 2)
		{
	        format(itxt, 128,"\
			\n\
			{FFFFFF}Kerosin {FF8000} $%d\n\
			{FF8000}———————————————",pkerosin);
			SetDynamicObjectMaterialText(ioID, 2, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}
		else
		{
	       	format(itxt, 128,"\
			\n\
			{FFFFFF}Kerosin {FF8000} $---\n\
			{FF8000}———————————————");
			SetDynamicObjectMaterialText(ioID, 2, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
		}

		TankstellenInfo[ts][tsText][0] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, TankstellenInfo[ts][tsEPos_X], TankstellenInfo[ts][tsEPos_Y], TankstellenInfo[ts][tsEPos_Z], 10.0);

		TankstellenInfo[ts][tsPickup][1] = CreatePickup(1650, 23, TankstellenInfo[ts][tsPos_X][0], TankstellenInfo[ts][tsPos_Y][0], TankstellenInfo[ts][tsPos_Z][0], -1);
		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", ts);
		TankstellenInfo[ts][tsText][1] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, TankstellenInfo[ts][tsPos_X][0], TankstellenInfo[ts][tsPos_Y][0], TankstellenInfo[ts][tsPos_Z][0], 10.0);

		TankstellenInfo[ts][tsPickup][2] = CreatePickup(1650, 23, TankstellenInfo[ts][tsPos_X][1], TankstellenInfo[ts][tsPos_Y][1], TankstellenInfo[ts][tsPos_Z][1], -1);
		format(Text, sizeof(Text), "Tankstelle 'ID: {FF0000}%d{FFFFFF}'\nBenutze '{FF0000}/tanken{FFFFFF}'\num dein Fahrzeug zu betanken", ts);
		TankstellenInfo[ts][tsText][2] = CreateDynamic3DTextLabel(Text, COLOR_WHITE, TankstellenInfo[ts][tsPos_X][1], TankstellenInfo[ts][tsPos_Y][1], TankstellenInfo[ts][tsPos_Z][1], 10.0);

        TankstellenInfo[ts][tsErstellt] = true;

        tstelleninfos++;
	}
	cache_delete(result);
	printf(" Es wurden %d Tankstellen erfolgreich geladen und erstellt.",tstelleninfos);
}

stock TankstellenTafelUpdate(itankid)
{
	if(IsValidDynamicObject(TankstellenInfo[itankid][tsTafel])) {
		DestroyDynamicObject(TankstellenInfo[itankid][tsTafel]);
	}

	new query[128];
	mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `tankstellen` WHERE `ID` = '%d' LIMIT 1;", itankid);
	mysql_tquery(sqlHandle, query, "onFuelstationBoardUpdate", "i", itankid);
	return 1;
}

forward onFuelstationBoardUpdate(itankid);
public onFuelstationBoardUpdate(itankid) {
	new rows;
	
	if(!rows) return 1;
	
    new itxt[128], ioID;

	cache_get_value_name_float(0, "S_PosX", TankstellenInfo[itankid][tsTPos_X]);
	cache_get_value_name_float(0, "S_PosY", TankstellenInfo[itankid][tsTPos_Y]);
	cache_get_value_name_float(0, "S_PosZ", TankstellenInfo[itankid][tsTPos_Z]);
	cache_get_value_name_float(0, "S_PosR", TankstellenInfo[itankid][tsTPos_R]);

	ioID = CreateDynamicObject(5811, TankstellenInfo[itankid][tsTPos_X], TankstellenInfo[itankid][tsTPos_Y], TankstellenInfo[itankid][tsTPos_Z], 0.000, 0.000, TankstellenInfo[itankid][tsTPos_R]);

	TankstellenInfo[itankid][tsTafel] = ioID;

	new pdisel,pbenzien,pkerosin;

    if(strlen(TankstellenInfo[itankid][tsBesitzer]) > 2)
    {

		format(itxt, 128, "\
		{D8D8D8}%s\n\
		{FF8000}———————————————",TankstellenInfo[itankid][tsBeschreibung]);
		SetDynamicObjectMaterialText(ioID, 5, itxt, 90, "Tahoma", 35, 0, -32256, -16777216, 1);

	   	format(itxt, 128, "\
		Besitzer:\n\
		{FFFFFF}%s",TankstellenInfo[itankid][tsBesitzer]);
		SetDynamicObjectMaterialText(TankstellenInfo[itankid][tsTafel], 1, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);

	 	pdisel = TankstellenInfo[itankid][tsDieselPreis];
		pbenzien = TankstellenInfo[itankid][tsBenzinPreis];
		pkerosin = TankstellenInfo[itankid][tsKerosinPreis];
    }
    else
    {
		format(itxt, 128, "\
		{D8D8D8}Petrol Station\n\
		{FF8000}———————————————");
		SetDynamicObjectMaterialText(ioID, 5, itxt, 90, "Tahoma", 35, 0, -32256, -16777216, 1);

    	format(itxt, 128, "\
		Besitzer:\n\
		{FFFFFF}Staat");
		SetDynamicObjectMaterialText(ioID, 1, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);

	 	pdisel = 3;
		pbenzien = 5;
		pkerosin = 10;
    }


	if(strlen(TankstellenInfo[itankid][tsBesitzer]) > 2 && TankstellenInfo[itankid][tsBenzin] > 0 || strlen(TankstellenInfo[itankid][tsBesitzer]) < 2)
	{
		format(itxt, 128, "\
		\n\
		{FFFFFF}Benzin {FF8000} $%d\n\
		{FF8000}———————————————",pbenzien);
		SetDynamicObjectMaterialText(ioID, 4, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}
	else
	{
		format(itxt, 128, "\
		\n\
		{FFFFFF}Benzin {FF8000} $---\n\
		{FF8000}———————————————");
		SetDynamicObjectMaterialText(ioID, 4, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}

	if(strlen(TankstellenInfo[itankid][tsBesitzer]) > 2 && TankstellenInfo[itankid][tsDiesel] > 0 || strlen(TankstellenInfo[itankid][tsBesitzer]) < 2)
	{
        format(itxt, 128,"\
		\n\
		{FFFFFF}Diesel {FF8000} $%d\n\
		{FF8000}———————————————",pdisel);
		SetDynamicObjectMaterialText(ioID, 3, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}
	else
	{
       	format(itxt, 128,"\
		\n\
		{FFFFFF}Diesel {FF8000} $---\n\
		{FF8000}———————————————");
		SetDynamicObjectMaterialText(ioID, 3, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}

	if(strlen(TankstellenInfo[itankid][tsBesitzer]) > 2 && TankstellenInfo[itankid][tsKerosin] > 0 || strlen(TankstellenInfo[itankid][tsBesitzer]) < 2)
	{
        format(itxt, 128,"\
		\n\
		{FFFFFF}Kerosin {FF8000} $%d\n\
		{FF8000}———————————————",pkerosin);
		SetDynamicObjectMaterialText(ioID, 2, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}
	else
	{
       	format(itxt, 128,"\
		\n\
		{FFFFFF}Kerosin {FF8000} $---\n\
		{FF8000}———————————————");
		SetDynamicObjectMaterialText(ioID, 2, itxt, 90, "Tahoma", 40, 0,  -32256, -16777216, 1);
	}
	return 1;
}

stock TStelleUpgrades(Variable)
{
    new status[30];
    if(Variable == 0){status="{FF0000}Nicht vorhanden";}
    else {status="{9ACD32}Vorhanden";}
    return status;
}