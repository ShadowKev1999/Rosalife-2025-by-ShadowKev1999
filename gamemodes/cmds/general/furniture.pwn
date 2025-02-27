CMD:orderfurniture(playerid, params[]) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    if(!IsPlayerAtPickupByType(playerid, 5.0, PICKUP_TYPE_ORDERFURNITURE))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht im Büro für Möbel.");

    ShowFurnituresCategories(playerid);
    return 1;
}