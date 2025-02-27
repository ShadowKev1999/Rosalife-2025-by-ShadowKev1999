stock Init_Furnitures() {
    mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `housefurnitures` (\
	  `ID` int(11) NOT NULL auto_increment,\
	  `HouseID` int(11) NOT NULL,\
	  `FurnitureID` tinyint(11) NOT NULL,\
	  `FurnitureX` float NOT NULL,\
	  `FurnitureY` float NOT NULL,\
	  `FurnitureZ` float NOT NULL,\
	  `FurnitureRX` float NOT NULL,\
	  `FurnitureRY` float NOT NULL,\
	  `FurnitureRZ` float NOT NULL,\
	  `FurnitureVW` int(11) NOT NULL,\
	  `FurnitureInt` int(11) NOT NULL,\
	  PRIMARY KEY  (`ID`)\
	) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

    mysql_tquery(sqlHandle, "SELECT * FROM `housefurnitures` INNER JOIN `furniture_model` ON housefurnitures.FurnitureID = furniture_model.id;", "LoadFurnitures", "");
    return 1;
}

stock DeleteAllFurnitures(houseId) {

    new query[64], data[e_furniture];

    for(new i, maxval = Streamer_GetUpperBound(STREAMER_TYPE_OBJECT); i <= maxval; ++i) {
        if(!IsValidDynamicObject(i)) continue;
		Streamer_GetArrayData(STREAMER_TYPE_OBJECT, i, E_STREAMER_EXTRA_ID, data);
		if(data[SQLID] > 0 && data[HouseID] == houseId) DestroyDynamicObject(i);
    }

    mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `housefurnitures` WHERE `HouseID` = %d ", houseId);
    mysql_tquery(sqlHandle, query);
    return 1;
}

forward LoadFurnitures();
public LoadFurnitures()
{
	new rows = cache_num_rows();
 	if(rows)
  	{
   		new id, loaded, vw, interior, data[e_furniture];
     	while(loaded < rows)
      	{
       		cache_get_value_name_int(loaded, "ID", data[SQLID]);
         	cache_get_value_name_int(loaded, "HouseID", data[HouseID]);
         	cache_get_value_name_int(loaded, "FurnitureID", data[ArrayID]);
          	cache_get_value_name_float(loaded, "FurnitureX", data[furnitureX]);
           	cache_get_value_name_float(loaded, "FurnitureY", data[furnitureY]);
            cache_get_value_name_float(loaded, "FurnitureZ", data[furnitureZ]);
            cache_get_value_name_float(loaded, "FurnitureRX", data[furnitureRX]);
            cache_get_value_name_float(loaded, "FurnitureRY", data[furnitureRY]);
            cache_get_value_name_float(loaded, "FurnitureRZ", data[furnitureRZ]);
            cache_get_value_name_int(loaded, "FurnitureVW", vw);
            cache_get_value_name_int(loaded, "FurnitureInt", interior);

            cache_get_value_name_float(loaded, "weight", data[furnitureWeight]);
            cache_get_value_name_int(loaded, "price", data[furniturePrice]);
            cache_get_value_name_int(loaded, "modelid", data[furnitureModel]);

			id = CreateDynamicObject(
   				data[furnitureModel],
       			data[furnitureX], data[furnitureY], data[furnitureZ],
          		data[furnitureRX], data[furnitureRY], data[furnitureRZ],
				vw, interior
			);

			Streamer_SetArrayData(STREAMER_TYPE_OBJECT, id, E_STREAMER_EXTRA_ID, data);
   			loaded++;
 		}

 		printf(" [Furniture System] %d Moebel geladen.", loaded);
   	}

	return 1;
}

stock ShowFurnituresCategories(playerid) {
    mysql_tquery(sqlHandle, "SELECT * FROM `furniture_category`;", "onShowFurnituresCategories", "i", playerid);
    return 1;
}

forward onShowFurnituresCategories(playerid);
public onShowFurnituresCategories(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es wurden keine Möbel-Kategorien gefunden.");
    new tempData[32], mainString[1028], _value;
    for(new i = 0; i < rows; i++) {
        if(i >= MAX_FURNITURE_ITEMS_LIST) break;
        cache_get_value_name_int(i, "id", _value);
        cache_get_value_name(i, "name", tempData);
        format(mainString, sizeof(mainString), "%s\n%i. %s", mainString, i, tempData);
        furnitureList[playerid][i] = _value;
    }
    ShowPlayerDialog(playerid, DIALOG_FURNITURES_CATEGORIES, DIALOG_STYLE_LIST, "{007DFF}"SERV_NAME"{FFFFFF} - Möbel-Kategorien", mainString, "Auswählen", "Abbrechen");
    return 1;
}

Furnitures_DialogResponse(playerid, dialogid, response, listitem) {
    switch(dialogid) {
        case DIALOG_FURNITURES_CATEGORIES: {
            if(!response) return 1;
            new query[128];
            mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `furniture_model` WHERE `catalogid` = %i", furnitureList[playerid][listitem]);
            mysql_tquery(sqlHandle, query, "onShowFurnituresModels", "i", playerid);
            return 1;
        }

        case DIALOG_FURNITURES_ORDER: {
            if(!response) {
                DeletePVar(playerid, "Furniture_ID");
                DeletePVar(playerid, "Furniture_Name");
                DeletePVar(playerid, "Furniture_Price");
                ShowFurnituresCategories(playerid);
                return 1;
            }
            if(GetPlayerMoneyEx(playerid) < GetPVarInt(playerid, "Furniture_Price")) {
                DeletePVar(playerid, "Furniture_ID");
                DeletePVar(playerid, "Furniture_Name");
                DeletePVar(playerid, "Furniture_Price");
                ShowFurnituresCategories(playerid);
                return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du hast nicht genügend Geld bei dir.");
            }
            new _id = GetPVarInt(playerid, "Furniture_ID"), query[128];

            GivePlayerMoneyEx(playerid, -GetPVarInt(playerid, "Furniture_Price"));
            GetPVarString(playerid, "Furniture_Name", query);

            SendClientMessage(playerid, -1, "{3399FF}[MÖBELSYSTEM]: {FFFFFF}Bestellung von {3399FF}'%s'{FFFFFF} erfolgreich (-%i$).", query, GetPVarInt(playerid, "Furniture_Price"));
            SendClientMessage(playerid, -1, "{3399FF}[MÖBELSYSTEM]: {FFFFFF}Die Bestellung wird in maximal 24 Stunden zugestellt.");

            mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `furnitures_orders` (`userId`, `house_id`, `furniture_id`) VALUES (%i, %i)", SpielerInfo[playerid][sDBID], SpielerInfo[playerid][sHaus], _id);
            mysql_tquery(sqlHandle, query);

            foreach(new i : Player) {
                if(SpielerInfo[playerid][sNebenjob] != 1) continue;

                SendClientMessage(playerid, -1, "{33ff99}TRUCKER: {FFFFFF}Ein neuer Lieferauftrag ist verfügbar - dieser kann mit /beliefern (- Möbellieferung) angenommen werden.");
                SendClientMessage(playerid, -1, "{33ff99}TRUCKER: {FFFFFF}Dieser Auftrag ist für 24 Stunden verfügbar und kann ausschließlich einmalig ausgeführt werden.");
            }

            DeletePVar(playerid, "Furniture_ID");
            DeletePVar(playerid, "Furniture_Name");
            DeletePVar(playerid, "Furniture_Price");
            return 1;
        }
    }
    return 1;
}

forward onShowFurnituresModels(playerid);
public onShowFurnituresModels(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Zu dieser Kategorie konnten keine Einträge geladen werden!");
    for(new i = 0; i < rows; i++) {
        if(i >= MAX_FURNITURE_ITEMS_LIST) break;
        cache_get_value_name_int(i, "modelid", furnitureList[playerid][i]);
    }
    ShowModelSelectionMenuEx(playerid, furnitureList[playerid], rows, "Furniture Selection", MENU_FURNITURE_MODEL, 16.0, 0.0, 180.0, 1.0, 0x00000033, 0x00000066, 0xA1A1A133);
    return 1;
}

Furniture_ModelSelectionEx(playerid, response, extraid, modelid) {
    if(!response) return 1;
    switch(extraid) {
        case MENU_FURNITURE_MODEL: {
            new query[128];
            mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `furniture_model` WHERE `modelid` = %i LIMIT 1;", modelid);
            mysql_tquery(sqlHandle, query, "onPlayerSelectedFurniture", "ii", playerid, modelid);
            return 1;
        }
    }
    return 1;
}

forward onPlayerSelectedFurniture(playerid, modelid);
public onPlayerSelectedFurniture(playerid, modelid) {
    new rows, string[324], Float:_weight, _price, _id;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Das ausgewählte Möbelstück ist nicht mehr verfügbar!");

    cache_get_value_name_int(0, "id", _id);
    cache_get_value_name(0, "name", string);
    cache_get_value_name_float(0, "weight", _weight);
    cache_get_value_name_int(0, "price", _price);

    SetPVarInt(playerid, "Furniture_ID", _id);
    SetPVarString(playerid, "Furniture_Name", string);
    SetPVarInt(playerid, "Furniture_Price", _price);

    format(string, sizeof(string), "{FFFFFF}Möchtest du das Möbelstück {3399FF}%s{FFFFFF} für {3399FF}%i${FFFFFF} kaufen?\n \
                                    Das Möbelstück besitzt ein Gewicht von {3399FF}%f kg{FFFFFF}. Die Lieferzeit beträgt \n \
                                    maximal 24 Stunden. Ein Trucker hat die Möglichkeit deine Bestellung umgehend zu liefern.", string, _price, _weight);
    ShowPlayerDialog(playerid, DIALOG_FURNITURES_ORDER, DIALOG_STYLE_MSGBOX, "{007DFF}"SERV_NAME"{FFFFFF} - Möbelbestellung", string, "Auswählen", "Abbrechen");
    return 1;
}

task furnitureHourCheck[60000 * FURNITURE_SERVER_WAIT]() //JEDE NACH EINSTELLUNG (DEFAULT 60 Minuten)
{  
    mysql_tquery(sqlHandle, "SELECT furniture_orders.*, furniture_model.*, furniture_orders.id as databaseId FROM `furniture_orders` \
                            INNER JOIN \
                            `furniture_model` ON \
                            furniture_orders.furniture_id = furniture_model.id \
                            WHERE `delivery` = 0 AND TIMESTAMPDIFF(MINUTE, `created_at`, NOW()) >= "#FURNITURE_SERVER_WAIT";", "onServerDeliverFurnitures");
    return 1;
}

forward onServerDeliverFurnitures();
public onServerDeliverFurnitures() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            new _userId, _furnName[64], _id;
            cache_get_value_name_int(i, "databaseId", _id);
            cache_get_value_name_int(i, "userId", _userId);
            cache_get_value_name(i, "name", _furnName);

            foreach(new playerid : Player) {
                if(SpielerInfo[playerid][sDBID] != _userId) continue;

                SendClientMessage(playerid, -1, "{3399FF}[MÖBELSYSTEM]: {FFFFFF}Deine Bestellung ({3399FF}'%s'{FFFFFF}) wurde automatisch geliefert.", _furnName);
                SendClientMessage(playerid, -1, "{3399FF}[MÖBELSYSTEM]: {FFFFFF}Du kannst nun dein Möbelstück im Innenraum deines Hauses platzieren (/furnitures).");
            }
            new query[128];

            mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `furniture_orders` WHERE `id` = %i", _id);
            mysql_tquery(sqlHandle, query);
        }
    }
    return 1;
}