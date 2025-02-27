
EnterExit_Init() {
    new query[512];

    strcat(query,"CREATE TABLE IF NOT EXISTS `server_enterexits` (`id` int(11) NOT NULL AUTO_INCREMENT, `Enter` varchar(256) DEFAULT '|', `Exit` varchar(256) DEFAULT '|',");
    strcat(query,"`Name` varchar(30) DEFAULT NULL, PRIMARY KEY (`id`))ENGINE=InnoDB DEFAULT CHARSET=latin1;");
    mysql_tquery(sqlHandle, query);

    mysql_tquery(sqlHandle, "SELECT * FROM `server_enterexits`;", "onLoadEnterExits");
    return 1;   
}

EnterExit_PlayerConnect(playerid) {
    SetPVarInt(playerid, "EnterExitId", -1);
    return 1;
}

EnterExit_PlayerEnterDynamicArea(playerid, areaid) {
    new slot = GetEnterExitByArea(areaid);
    if(slot != -1) {
        SetPVarInt(playerid, "EnterExitId", slot);
    }
    return 1;
}

EnterExit_PlayerExitDynamicArea(playerid, areaid) {
    new slot = GetEnterExitByArea(areaid);
    if(slot != -1) {
        SetPVarInt(playerid, "EnterExitId", -1);
    }
    return 1;
}

InteractEnterExit(playerid) {
    if(IsPlayerInAnyVehicle(playerid)) return 1;
    new slot = GetPVarInt(playerid, "EnterExitId");
    if(slot == -1) return 1;
    if(!sEnterExits[slot][sEnterCreated]) return 1;
    if(IsPlayerInDynamicArea(playerid, sEnterExits[slot][sEnterExitArea][0])) { //Enter
        if(IsAntiInteriorFlucht(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Anti-Interiorflucht: Warte bis du das Gebäude betrittst/verlässt.");

        SetPlayerPos(playerid, sEnterExits[slot][sExitPos][0], sEnterExits[slot][sExitPos][1], sEnterExits[slot][sExitPos][2]);
        SetPlayerFacingAngle(playerid, sEnterExits[slot][sExitPos][3]);
        SetPlayerInterior(playerid, sEnterExits[slot][sEnterExitInteriorId][1]);
        SetPlayerVirtualWorld(playerid, sEnterExits[slot][sEnterExitWorldId][1]);

        SetTimerEx("Unfreeze",3000,false,"i",playerid);
        TogglePlayerControllable(playerid, false);

        GameTextForPlayer(playerid,"~r~Welt~w~ wird geladen",3000,6);

    } else if(IsPlayerInDynamicArea(playerid, sEnterExits[slot][sEnterExitArea][1])) { //Exit
        if(IsAntiInteriorFlucht(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Anti-Interiorflucht: Warte bis du das Gebäude betrittst/verlässt.");
        
        SetPlayerPos(playerid, sEnterExits[slot][sEnterPos][0], sEnterExits[slot][sEnterPos][1], sEnterExits[slot][sEnterPos][2]);
        SetPlayerFacingAngle(playerid, sEnterExits[slot][sEnterPos][3]);
        SetPlayerInterior(playerid, sEnterExits[slot][sEnterExitInteriorId][0]);
        SetPlayerVirtualWorld(playerid, sEnterExits[slot][sEnterExitWorldId][0]);

        SetTimerEx("Unfreeze",3000,false,"i",playerid);
        TogglePlayerControllable(playerid, false);

        GameTextForPlayer(playerid,"~r~Welt~w~ wird geladen",3000,6);
    }
    return 1;
}

forward onLoadEnterExits();
public onLoadEnterExits() {
    new rows, helperVar[256], string[128];
    cache_get_row_count(rows);

    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name(i, "id", sEnterExits[i][sEnterDbId]);

            cache_get_value_name(i, "Enter", helperVar);
            
            if(helperVar[0] != '|' && helperVar[1] != EOS) {
			    sscanf(helperVar,"p<|>ffffdd", sEnterExits[i][sEnterPos][0], sEnterExits[i][sEnterPos][1], sEnterExits[i][sEnterPos][2], sEnterExits[i][sEnterPos][3], sEnterExits[i][sEnterExitInteriorId][0], sEnterExits[i][sEnterExitWorldId][0]);
            }

            cache_get_value_name(i, "Exit", helperVar);

            if(helperVar[0] != '|' && helperVar[1] != EOS) {
			    sscanf(helperVar,"p<|>ffffdd", sEnterExits[i][sExitPos][0], sEnterExits[i][sExitPos][1], sEnterExits[i][sExitPos][2], sEnterExits[i][sExitPos][3], sEnterExits[i][sEnterExitInteriorId][1], sEnterExits[i][sEnterExitWorldId][1]);
            }

            cache_get_value_name(i, "Name", sEnterExits[i][sEnterExitName]);

            sEnterExits[i][sEnterExitArea][0] = CreateDynamicSphere(sEnterExits[i][sEnterPos][0], sEnterExits[i][sEnterPos][1], sEnterExits[i][sEnterPos][2], 1.5, .worldid = sEnterExits[i][sEnterExitWorldId][0], .interiorid = sEnterExits[i][sEnterExitInteriorId][0]);
            sEnterExits[i][sEnterExitArea][1] = CreateDynamicSphere(sEnterExits[i][sExitPos][0], sEnterExits[i][sExitPos][1], sEnterExits[i][sExitPos][2], 1.5, .worldid = sEnterExits[i][sEnterExitWorldId][1], .interiorid = sEnterExits[i][sEnterExitInteriorId][1]);

            sEnterExits[i][sEnterExitPickup][0] = CreateDynamicPickup(ENTER_EXIT_PICKUP_MODEL, 1, sEnterExits[i][sEnterPos][0], sEnterExits[i][sEnterPos][1], sEnterExits[i][sEnterPos][2], .worldid = sEnterExits[i][sEnterExitWorldId][0], .interiorid = sEnterExits[i][sEnterExitInteriorId][0]);
            sEnterExits[i][sEnterExitPickup][1] = CreateDynamicPickup(ENTER_EXIT_PICKUP_MODEL, 1, sEnterExits[i][sExitPos][0], sEnterExits[i][sExitPos][1], sEnterExits[i][sExitPos][2], .worldid = sEnterExits[i][sEnterExitWorldId][1], .interiorid = sEnterExits[i][sEnterExitInteriorId][1]);
            format(string, sizeof(string), "{FFFFFF}%s\nBenutze '{FF0000}Enter{FFFFFF}'\num das Gebäude zu betreten.", sEnterExits[i][sEnterExitName]);
            sEnterExits[i][sEnterExitLabel][0] = CreateDynamic3DTextLabel(string, 0x008080FF, sEnterExits[i][sEnterPos][0], sEnterExits[i][sEnterPos][1], sEnterExits[i][sEnterPos][2], 5.0, .worldid = sEnterExits[i][sEnterExitWorldId][0], .interiorid = sEnterExits[i][sEnterExitInteriorId][0]);
            format(string, sizeof(string), "{FFFFFF}%s\nBenutze '{FF0000}Enter{FFFFFF}'\num das Gebäude zu verlassen.", sEnterExits[i][sEnterExitName]);
            sEnterExits[i][sEnterExitLabel][1] = CreateDynamic3DTextLabel(string, 0x008080FF, sEnterExits[i][sExitPos][0], sEnterExits[i][sExitPos][1], sEnterExits[i][sExitPos][2], 5.0, .worldid = sEnterExits[i][sEnterExitWorldId][1], .interiorid = sEnterExits[i][sEnterExitInteriorId][1]);
            
            sEnterExits[i][sEnterCreated] = true;
        }
        return 1;
    }
    return printf("MySQL: %i EnterExits geladen!");
}

stock addEnterExit(Float:enterX, Float:enterY, Float:enterZ, Float:enterA, enterInt, enterWorld, Float:exitX, Float:exitY, Float:exitZ, Float:exitA, exitInt, exitWorld, const enterExitName[32]) {
    new slot = GetFreeEnterExitSlot(), string[128], query[256];
    if(slot == -1) return printf("addEnterExit failed > MAX_ENTER_EXITS succeed!");

    sEnterExits[slot][sEnterPos][0] = enterX;
    sEnterExits[slot][sEnterPos][1] = enterY;
    sEnterExits[slot][sEnterPos][2] = enterZ;
    sEnterExits[slot][sEnterPos][3] = enterA;

    sEnterExits[slot][sExitPos][0] = exitX;
    sEnterExits[slot][sExitPos][1] = exitY;
    sEnterExits[slot][sExitPos][2] = exitZ;
    sEnterExits[slot][sExitPos][3] = exitA;

    format(sEnterExits[slot][sEnterExitName], 32, "%s", enterExitName);

    sEnterExits[slot][sEnterExitArea][0] = CreateDynamicSphere(sEnterExits[slot][sEnterPos][0], sEnterExits[slot][sEnterPos][1], sEnterExits[slot][sEnterPos][2], 1.5, .worldid = sEnterExits[slot][sEnterExitWorldId][0], .interiorid = sEnterExits[slot][sEnterExitInteriorId][0]);
    sEnterExits[slot][sEnterExitArea][1] = CreateDynamicSphere(sEnterExits[slot][sExitPos][0], sEnterExits[slot][sExitPos][1], sEnterExits[slot][sExitPos][2], 1.5, .worldid = sEnterExits[slot][sEnterExitWorldId][1], .interiorid = sEnterExits[slot][sEnterExitInteriorId][1]);

    sEnterExits[i][sEnterExitPickup][0] = CreateDynamicPickup(ENTER_EXIT_PICKUP_MODEL, 1, sEnterExits[slot][sEnterPos][0], sEnterExits[slot][sEnterPos][1], sEnterExits[slot][sEnterPos][2], .worldid = sEnterExits[slot][sEnterExitWorldId][0], .interiorid = sEnterExits[slot][sEnterExitInteriorId][0]);
            sEnterExits[slot][sEnterExitPickup][1] = CreateDynamicPickup(ENTER_EXIT_PICKUP_MODEL, 1, sEnterExits[slot][sExitPos][0], sEnterExits[slot][sExitPos][1], sEnterExits[slot][sExitPos][2], .worldid = sEnterExits[slot][sEnterExitWorldId][1], .interiorid = sEnterExits[slot][sEnterExitInteriorId][1]);
            format(string, sizeof(string), "{FFFFFF}%s\nBenutze '{FF0000}Enter{FFFFFF}'\num das Gebäude zu betreten.", sEnterExits[slot][sEnterExitName]);
            sEnterExits[slot][sEnterExitLabel][0] = CreateDynamic3DTextLabel(string, 0x008080FF, sEnterExits[slot][sEnterPos][0], sEnterExits[slot][sEnterPos][1], sEnterExits[slot][sEnterPos][2], 5.0, .worldid = sEnterExits[slot][sEnterExitWorldId][0], .interiorid = sEnterExits[slot][sEnterExitInteriorId][0]);
            format(string, sizeof(string), "{FFFFFF}%s\nBenutze '{FF0000}Enter{FFFFFF}'\num das Gebäude zu verlassen.", sEnterExits[slot][sEnterExitName]);
            sEnterExits[slot][sEnterExitLabel][1] = CreateDynamic3DTextLabel(string, 0x008080FF, sEnterExits[slot][sExitPos][0], sEnterExits[slot][sExitPos][1], sEnterExits[slot][sExitPos][2], 5.0, .worldid = sEnterExits[slot][sEnterExitWorldId][1], .interiorid = sEnterExits[slot][sEnterExitInteriorId][1]);

    sEnterExits[slot][sEnterCreated] = true;

    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `server_enterexits` (`Enter`, `Exit`, `Name`) VALUES ('%f|%f|%f|%f|%d|%d', '%f|%f|%f|%f|%d|%d', '%s');",
    enterX, enterY, enterZ, enterA, enterInt, enterWorld, exitX, exitY, exitZ, exitA, exitInt, exitWorld, enterExitName);
    mysql_tquery(sqlHandle, query, "onServerEnterExitInsert", "i", slot);
    return 1;
}

forward onServerEnterExitInsert(slot);
public onServerEnterExitInsert(slot) {
    sEnterExits[slot][sEnterDbId] = cache_insert_id();
    return 1;
}

stock GetEnterExitByArea(areaid) {
    for(new i = 0; i < MAX_ENTER_EXITS; i++) {
        if(!sEnterExits[i][sEnterCreated]) continue;

        if(sEnterExits[i][sEnterExitArea][0] == areaid) return i;
        if(sEnterExits[i][sEnterExitArea][1] == areaid) return i;
    }
    return -1;
}

stock GetFreeEnterExitSlot() {
    for(new i = 0; i < MAX_ENTER_EXITS; i++) {
        if(sEnterExits[i][sEnterCreated]) continue;
        return i;
    }
    return -1;
}