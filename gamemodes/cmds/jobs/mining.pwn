CMD:mineveh(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/mineveh [ores/take]");
    if(!strcmp(params, "ores", true)) {
        new vehicleid = GetNearestVehicleEx(playerid);
        if(!IsValidVehicle(vehicleid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich an keinem Fahrzeug.");
        if(!Vehicle_IsMiningVehicle(vehicleid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug ist ungeeignet.");
        new string[196], title[32];
        format(string, sizeof(string), "Name\tMenge\tWert\n");
        for(new i; i < MAX_ORE_TYPES; i++) format(string, sizeof(string), "%s%s\t%d\t{2ECC71}$%d\n", string, OreData[i][oName], LoadedOres[vehicleid][i], Vehicle_GetOreValueByType(vehicleid, i));
        format(title, sizeof(title), "Geladene Erze {E74C3C}(%d/%d)", Vehicle_LoadedOres(vehicleid), MINING_VEHICLE_LIMIT);
        ShowPlayerDialog(playerid, DIALOG_ORE_INFO, DIALOG_STYLE_TABLIST_HEADERS, title, string, "Schlieﬂen", "");
    }else if(!strcmp(params, "take")) {
        if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich in einem Fahrzeug.");
        if(MiningVein[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du baust gerade ein Erz ab.");
        if(CarryingOre[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du tr‰gst bereits ein Erz.");
        new id = GetNearestVehicleEx(playerid);
        if(!IsValidVehicle(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich an keinem Fahrzeug.");
        if(!Vehicle_IsMiningVehicle(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug ist ungeeignet.");
        new Float: x, Float: y, Float: z;
        GetVehicleBoot(id, x, y, z);
        if(GetPlayerDistanceFromPoint(playerid, x, y, z) > 3.0) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht am Kofferraum.");
        new string[196], title[32];
        format(string, sizeof(string), "Name\tMenge\n");
        for(new i; i < MAX_ORE_TYPES; i++) format(string, sizeof(string), "%s%s\t%d\n", string, OreData[i][oName], LoadedOres[id][i]);
        format(title, sizeof(title), "Erze {E74C3C}(%d/%d)", Vehicle_LoadedOres(id), MINING_VEHICLE_LIMIT);
        ShowPlayerDialog(playerid, DIALOG_ORE_TAKE, DIALOG_STYLE_TABLIST_HEADERS, title, string, "Nehmen", "Schlieﬂen");
    }
 
    return 1;
}

CMD:mineinfo(playerid, params[]) {
    if(!IsPlayerInRangeOfPoint(playerid, 5.0, 817.1186, 856.8585, 12.7891)) return SendClientMessage(playerid, -1, "ERROR: {FFFFFF}Du befindest dich nicht an der Mine von San Andreas (/gps).");
    new mainstring[1500];
    strcat(mainstring, "{FFFFFF}Herzlich Willkommen an der {E74C3C}Mine von San Andreas{FFFFFF}!\n");
    strcat(mainstring, "{FFFFFF}Um ein Erz abzubauen benˆtigst du ein geeignetes Fahrzeug daf¸r, es ist daf¸r egal, ob es sich dabei\n");
    strcat(mainstring, "{FFFFFF}um ein Privatfahrzeug, Fraktionsfahrzeug oder Gruppenfahrzeug handelt. Folgende Modelle kˆnnen dazu\n");
    strcat(mainstring, "{FFFFFF}verwendet werden: {E74C3C}Mule{FFFFFF}, {E74C3C}Flatbed{FFFFFF}, {E74C3C}Yankee{FFFFFF}, {E74C3C}Boxville{FFFFFF} oder {E74C3C}Benson{FFFFFF}!\n");
    strcat(mainstring, "{FFFFFF}Fahre mit deinem Fahrzeug in die Mine und starte mit dem Abbau von Erzen. Du musst diese anschlieﬂend\n");
    strcat(mainstring, "{FFFFFF}in dein Fahrzeug einladen. Du kannst diese anschlieﬂend zu einem Erzh‰ndler bringen und verkaufen.\n");
    strcat(mainstring, "\n");
    strcat(mainstring, "{E74C3C}ACHTUNG: {FFFFFF}Beim Abbau von Erzen darfst du das Fahrzeug {E74C3C}nicht{FFFFFF} wechseln! Nutze ausschlieﬂlich dein Fahrzeug\n");
    strcat(mainstring, "{FFFFFF}bis du alle deine Erze abgeliefert und verkauft hast!");
    ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_MSGBOX, "{E74C3C}RSL: {FFFFFF}Mining", mainstring, "Schlieﬂen", "");
    return 1;
}
 
CMD:ore(playerid, params[])
{
    if(isnull(params)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/ore [info/mine/take]");
    if(!strcmp(params, "info", true)) {
        new id = Player_GetClosestVein(playerid);
        if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich bei keinem Vorkommen..");
        new string[128], type = VeinData[id][Type];
        format(string, sizeof(string), "Name\t{%06x}%s\nWert\t{2ECC71}$%d\nAder Wert\t{2ECC71}$%d\nAbbauzeit\t%.2f Sekunden", OreData[type][oColor] >>> 8, OreData[type][oName], OreData[type][Value], (OreData[type][Value] * VeinData[id][Amount]), Vein_CalculateTime(id) / 1000);
        ShowPlayerDialog(playerid, DIALOG_ORE_INFO, DIALOG_STYLE_TABLIST, "Erz Information", string, "Schlieﬂen", "");
    }else if(!strcmp(params, "mine")) {
        if(!Vehicle_IsMiningVehicle(GetPVarInt(playerid, "mine_LastVehicleID"))) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug ist ungeeignet.");
        if(MiningVein[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du baust bereits ein Erz ab.");
        if(CarryingOre[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du tr‰gst bereits ein Erz.");
        new id = Player_GetClosestVein(playerid);
        if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich bei keinem Vorkommen..");
        if(VeinData[id][BeingMined]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Vorkommen wird derzeit bereits von einem anderen Spieler bearbeitet.");
        if(VeinData[id][Amount] < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Vorkommen ist ausgeschˆpft.");
        new Float: x, Float: y, Float: z;
        GetVehicleBoot(GetPVarInt(playerid, "mine_LastVehicleID"), x, y, z);
        if(GetPlayerDistanceFromPoint(playerid, x, y, z) > 60.0) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Dein Fahrzeug ist zu weit von dir entfernt.");
        MiningVein[playerid] = id;
 
        MiningTimer[playerid] = SetTimerEx("Player_Mine", MINING_UPDATE_RATE, true, "i", playerid);
        SetPlayerProgressBarColour(playerid, MiningBar[playerid], OreData[ VeinData[id][Type] ][oColor]);
        SetPlayerProgressBarValue(playerid, MiningBar[playerid], 0.0);
        ShowPlayerProgressBar(playerid, MiningBar[playerid]);
        SetPlayerAttachedObject(playerid, ATTACH_INDEX, 19631, 6, 0.048, 0.029, 0.103, -80.0, 80.0, 0.0);
        TogglePlayerControllable(playerid, false);
        SetPlayerArmedWeapon(playerid, WEAPON_FIST);
        ApplyAnimation(playerid, "BASEBALL", "Bat_1", 4.1, true, false, false, true, 0, SYNC_ALL);
 
        new string[64];
        format(string, sizeof(string), "~n~~y~~h~Abbau %s...", OreData[ VeinData[id][Type] ][oName]);
        GameTextForPlayer(playerid, string, floatround(Vein_CalculateTime(id)) + 1000, 3);
 
        VeinData[id][BeingMined] = true;
        Vein_Update(id);
    }else if(!strcmp(params, "take")) {
        if(!Vehicle_IsMiningVehicle(GetPVarInt(playerid, "mine_LastVehicleID"))) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug ist ungeeignet.");
        if(MiningVein[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du baust bereits ein Erz ab.");
        if(CarryingOre[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du tr‰gst bereits ein Erz.");
        new id = Player_GetClosestOre(playerid);
        if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich an keinem Erz.");
        new Float: x, Float: y, Float: z;
        GetVehicleBoot(GetPVarInt(playerid, "mine_LastVehicleID"), x, y, z);
        if(GetPlayerDistanceFromPoint(playerid, x, y, z) > 60.0) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Dein Fahrzeug ist zu weit von dir entfernt.");
        Player_GiveOre(playerid, DroppedOres[id][Type]);
        Ore_Destroy(id);
    }
    
    return 1;
}