COMMAND:givecoupon(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] == 5 || IsPlayerAdmin(playerid)) {
        new pID, string[1028];
		if(sscanf(params,"u",pID)) return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /givecoupon [SpielerID]");

        for(new i = 0; i < MAX_SERVER_COUPONS; i++) {
            format(string, sizeof(string), "%s\n%s", string, ServerCoupons[i]);
        }
        ShowPlayerDialog(playerid, DIALOG_GIVE_COUPON, DIALOG_STYLE_LIST, "Server Coupons", string, "Auswählen", "Abbrechen");
        PlayerCouponId[playerid] = pID;
        return 1;
    }
	else return NichtBerechtigt
}

COMMAND:coupons(playerid, params[]) {
    if(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return SendClientMessage(playerid, COLOR_GREY, "Du kannst einen Coupon nicht in einem Interior einlösen");
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Du kannst keinen Coupon in einem Fahrzeug einlösen");
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_coupons` WHERE `user_id` = %i", SpielerInfo[playerid][sDBID]);
    mysql_tquery(sqlHandle, query, "showPlayerCoupons", "i", playerid);
    return 1;
}

COMMAND:playerobjects(playerid, params[]) {
    if(!SpielerInfo[playerid][sPlayerObjects]) return SendClientMessage(playerid, COLOR_GREY, "Du besitzt derzeit keine weiteren Spieler Objekte!");
    
    ShowModelSelectionMenuEx(playerid, ServerCouponPlayObj, MAX_PLAYER_OBJECT_CATALOG, "Objektauswahl", MENU_PLAYER_OBJECT);
    return 1;
}

COMMAND:editplayerobj(playerid, params[]) {
    new obj = getNearestPlayerObject(playerid);
    if(obj == -1) return SendClientMessage(playerid, COLOR_GREY, "Du befindest dich bei keinen deiner Spielerobjekten!");
    SetPVarInt(playerid, "OBJECT_CREATOR", obj);
    DeletePVar(playerid, "OBJECT_CREATOR_INSERT");
    EditDynamicObject( playerid, ServerObjects[ obj ] [ serverObjectId ] );
    return 1;
}

COMMAND:delplayerobj(playerid, params[]) {
    new obj = getNearestPlayerObject(playerid), query[128];
    if(obj == -1) return SendClientMessage(playerid, COLOR_GREY, "Du befindest dich bei keinen deiner Spielerobjekten!");

    DestroyDynamicObject( ServerObjects[ obj ] [ serverObjectId ]) ; 
    Iter_Remove(ServerObjectsItter, obj);

    mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `player_objects` WHERE `id` = %i", ServerObjects[ obj ][ serverObjectDbId ]);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, COLOR_YELLOW, "Objekt %i wurde erfolgreich gelöscht.", obj);

    SpielerInfo[playerid][sPlayerObjects] ++;
    return 1;
}

COMMAND:playerobjlist(playerid, params[]) {
    new counter = countPlayerObjects(playerid);

    SendClientMessage(playerid, COLOR_YELLOW, "Du besitzt %i Spielerobjekte und hast bereits %i Objekte platziert.", SpielerInfo[playerid][sPlayerObjects], counter);
    return 1;
}