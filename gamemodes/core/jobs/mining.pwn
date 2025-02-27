Vehicle_LoadedOres(vehicleid)
{
    if(!IsValidVehicle(vehicleid)) return -1;
    new count = 0;
    for(new i; i < MAX_ORE_TYPES; i++) count += LoadedOres[vehicleid][i];
    return count;
}
 
Vehicle_GetOreValue(vehicleid)
{
    if(!IsValidVehicle(vehicleid)) return -1;
    new value = 0;
    for(new i; i < MAX_ORE_TYPES; i++) value += (LoadedOres[vehicleid][i] * OreData[i][Value]);
    return value;
}
 
Vehicle_GetOreValueByType(vehicleid, type)
{
    if(!IsValidVehicle(vehicleid)) return -1;
    return (LoadedOres[vehicleid][type] * OreData[type][Value]);
}
 
Vehicle_CleanUp(vehicleid)
{
    if(!IsValidVehicle(vehicleid)) return -1;
    for(new i; i < MAX_ORE_TYPES; i++) LoadedOres[vehicleid][i] = 0;
    return 1;
}
 
Vehicle_IsMiningVehicle(vehicleid)
{
    switch(GetVehicleModel(vehicleid))
    {
        case 414, 455, 456, 498, 499, 609: return 1;
        default: return 0;
    }
 
    return 0;
}
 
// Player Functions
Player_Init(playerid)
{
    MiningVein[playerid] = -1;
    MiningTimer[playerid] = -1;
    CarryingOre[playerid] = -1;
    LoadingPoint[playerid] = -1;
    MiningBar[playerid] = CreatePlayerProgressBar(playerid, 498.0, 104.0, 113.0, 6.2, -1429936641, MINING_BAR_MAX, BAR_DIRECTION_RIGHT);
    for(new i; i < sizeof(DropPoints); i++)
    {
        TogglePlayerDynamicCP(playerid, DropPoints[i][PointCP], 0);
        PointIcons[playerid][i] = -1;
    }
    
    return 1;
}
 
Player_CleanUp(playerid, ore = 0)
{
    if(MiningVein[playerid] != -1)
    {
        VeinData[ MiningVein[playerid] ][BeingMined] = false;
        Vein_Update(MiningVein[playerid]);
        ClearAnimations(playerid);
        TogglePlayerControllable(playerid, true);
        MiningVein[playerid] = -1;
    }
    
    if(MiningTimer[playerid] != -1)
    {
        KillTimer(MiningTimer[playerid]);
        MiningTimer[playerid] = -1;
    }
    
    if(ore && CarryingOre[playerid] != -1)
    {
        CarryingOre[playerid] = -1;
        SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
    }
    
    if(ore && LoadingPoint[playerid] != -1)
    {
        DestroyDynamicCP(LoadingPoint[playerid]);
        LoadingPoint[playerid] = -1;
    }
    
    if(IsPlayerAttachedObjectSlotUsed(playerid, MINING_ATTACH_INDEX)) RemovePlayerAttachedObject(playerid, MINING_ATTACH_INDEX);
    SetPlayerProgressBarValue(playerid, MiningBar[playerid], 0.0);
    HidePlayerProgressBar(playerid, MiningBar[playerid]);
    return 1;
}
 
Player_GetClosestVein(playerid, Float: range = 3.0)
{
    new id = -1, Float: dist = range, Float: tempdist, Float: pos[3];
    for(new i; i < MAX_VEINS; i++)
    {
        if(!VeinData[i][VeinExists]) continue;
        GetDynamicObjectPos(VeinData[i][VeinObject], pos[0], pos[1], pos[2]);
        tempdist = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);
        
        if(tempdist > range) continue;
        if(tempdist <= dist)
        {
            dist = tempdist;
            id = i;
        }
    }
    
    return id;
}
 
Player_GetClosestOre(playerid, Float: range = 3.0)
{
    new id = -1, Float: dist = range, Float: tempdist, Float: pos[3];
    for(new i; i < MAX_ORES; i++)
    {
        if(!DroppedOres[i][OreExists]) continue;
        GetDynamicObjectPos(DroppedOres[i][OreObject], pos[0], pos[1], pos[2]);
        tempdist = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);
 
        if(tempdist > range) continue;
        if(tempdist <= dist)
        {
            dist = tempdist;
            id = i;
        }
    }
 
    return id;
}
 
Player_GiveOre(playerid, type, cooldown = 0)
{
    CarryingOre[playerid] = type;
    SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
    SetPlayerAttachedObject(playerid, MINING_ATTACH_INDEX, 2936, 5, 0.105, 0.086, 0.22, -80.3, 3.3, 28.7, 0.35, 0.35, 0.35, RGBAToARGB(OreData[type][oColor]));
    SetPVarInt(playerid, "LoadingCooldown", gettime() + cooldown);
    
    new Float: x, Float: y, Float: z;
    GetVehicleBoot(GetPVarInt(playerid, "mine_LastVehicleID"), x, y, z);
    LoadingPoint[playerid] = CreateDynamicCP(x, y, z, 3.0, .playerid = playerid);
    SendClientMessage(playerid, 0x2ECC71FF, "MINING: {FFFFFF}Tippe N um das abgebaute Erz abzulegen.");
    return 1;
}
 
// Vein Functions
Vein_Update(id)
{
    new label[64], type = VeinData[id][Type], bool: is_red = false;
    if(VeinData[id][BeingMined] || VeinData[id][Amount] < 1) is_red = true;
    format(label, sizeof(label), "%s\n%d/%d%s\n\n/ore info - /ore mine", OreData[type][oName], VeinData[id][Amount], OreData[type][Amount], (is_red) ? ("{E74C3C}") : ("{FFFFFF}"));
    UpdateDynamic3DTextLabelText(VeinData[id][VeinLabel], OreData[type][oColor], label);
    return 1;
}
 
Float: Vein_CalculateTime(id)
    return (MINING_BAR_MAX / OreData[ VeinData[id][Type] ][Modifier]) * MINING_UPDATE_RATE;
 
// Ore Functions
Ore_FindFreeID()
{
    new id = -1;
    for(new i; i < MAX_ORES; i++)
    {
        if(!DroppedOres[i][OreExists])
        {
            id = i;
            break;
        }
    }
    
    return id;
}

RGBAToARGB(rgba) return rgba >>> 8 | rgba << 24;
    
// edited from evf
GetNearestVehicleEx(playerid, Float: range = 6.5)
{
    new Float: fX, Float: fY, Float: fZ, Float: fSX, Float: fSY, Float: fSZ;
 
    for (new i = 1;  i < MAX_VEHICLES; i ++)
    {
        if (!IsVehicleStreamedIn(i, playerid)) continue;
        GetVehiclePos(i, fX, fY, fZ);
        GetVehicleModelInfo(GetVehicleModel(i), VEHICLE_MODEL_INFO_SIZE, fSX, fSY, fSZ);
        if(IsPlayerInRangeOfPoint(playerid, range, fX, fY, fZ) && GetPlayerInterior(playerid) == GetVehicleInterior(i) && GetPlayerVirtualWorld(playerid) == GetVehicleVirtualWorld(i)) return i;
    }
    
    return INVALID_VEHICLE_ID;
}

Minining_Init()
{
    Vein_Generate();
    SetTimer("Vein_Generate", MINING_REGEN_TIME * 60000, true);
    
    new label[128];
    for(new i; i < sizeof(DropPoints); i++)
    {
        format(label, sizeof(label), "Erzhandel - %s\n\n{FFFFFF}Liefere Erze um Geld zu erhalten!", DropPoints[i][Location]);
        DropPoints[i][PointLabel] = CreateDynamic3DTextLabel(label, 0xF1C40FFF, DropPoints[i][PointX], DropPoints[i][PointY], DropPoints[i][PointZ] + 0.5, 15.0, .testlos = 1);
        DropPoints[i][PointCP] = CreateDynamicCP(DropPoints[i][PointX], DropPoints[i][PointY], DropPoints[i][PointZ], 6.0);
    }

    CreateDynamic3DTextLabel(COLOR_HEX_YELLOW"Mine von San Andreas\n"COLOR_HEX_WHITE"Tippe /mineinfo", COLOR_WHITE, 817.1186, 856.8585, 12.7891 + 0.5, 8.0);
    CreateDynamicPickup(1277, 1,  817.1186, 856.8585, 12.7891, 0);
    return 1;
}

Minining_Exit() {
    for(new i = 0; i < MAX_PLAYERS; i++) {
        if(!IsPlayerConnected(i)) continue;
        Player_CleanUp(i, 1);
        if(IsValidPlayerProgressBar(i, MiningBar[i])) DestroyPlayerProgressBar(i, MiningBar[i]);
    }
    
    return 1;
}

Minining_PlayerConnect(playerid) {
    Player_Init(playerid);
    return 1;
}

Minining_PlayerStateChange(playerid, PLAYER_STATE:newstate, PLAYER_STATE:oldstate) {
    if(newstate == PLAYER_STATE_DRIVER) {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(Vehicle_LoadedOres(vehicleid) > 0) {
            new string[128];
            format(string, sizeof(string), "MINING: {FFFFFF}Das Fahrzeug hat {F39C12}%d {FFFFFF}Erze geladen mit einem Wert von {2ECC71}$%d.", Vehicle_LoadedOres(vehicleid), Vehicle_GetOreValue(vehicleid));
            SendClientMessage(playerid, 0x2ECC71FF, string);
            SendClientMessage(playerid, 0x2ECC71FF, "MINING: {FFFFFF}Du kannst deine Erze am angezeigten Truck Icon abladen.");
            SendClientMessage(playerid, 0x2ECC71FF, "MINING: {FFFFFF}Nutze /mineveh um weitere Informationen zu erhalten.");
            for(new i; i < sizeof(DropPoints); i++) {
                PointIcons[playerid][i] = CreateDynamicMapIcon(DropPoints[i][PointX], DropPoints[i][PointY], DropPoints[i][PointZ], 51, 0, _, _, playerid, 8000.0, MAPICON_GLOBAL);
                TogglePlayerDynamicCP(playerid, DropPoints[i][PointCP], 1);
            }
        }
        
        SetPVarInt(playerid, "mine_LastVehicleID", vehicleid);
    }
    
    if(oldstate == PLAYER_STATE_DRIVER) {
        for(new i; i < sizeof(DropPoints); i++) {
            if(IsValidDynamicMapIcon(PointIcons[playerid][i])) {
                DestroyDynamicMapIcon(PointIcons[playerid][i]);
                PointIcons[playerid][i] = -1;
            }
            
            TogglePlayerDynamicCP(playerid, DropPoints[i][PointCP], 0);
        }
    }
    
    Player_CleanUp(playerid, 1);
    return 1;
}

Mining_PlayerKeyStateChange(playerid, KEY:newkeys) {
    if((newkeys & KEY_NO) && CarryingOre[playerid] != -1) {
        new id = Ore_FindFreeID();
        if(id != -1) {
            if(Player_GetClosestOre(playerid, 1.5) != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du kannst dein Erz hier nicht ablegen.");
            new label[48], type = CarryingOre[playerid], Float: x, Float: y, Float: z, Float: a;
            GetPlayerPos(playerid, x, y, z);
            GetPlayerFacingAngle(playerid, a);
            x += (1.25 * floatsin(-a, degrees));
            y += (1.25 * floatcos(-a, degrees));
            
            DroppedOres[id][Type] = type;
            DroppedOres[id][OreTimer] = SetTimerEx("Ore_Destroy", ORE_TIME * 60000, false, "i", id);
            DroppedOres[id][OreObject] = CreateDynamicObject(3929, x, y, z - 0.65, 0.0, 0.0, random(360));
            SetDynamicObjectMaterial(DroppedOres[id][OreObject], 0, 2936, "kmb_rckx", "larock256", RGBAToARGB(OreData[type][oColor]));
            format(label, sizeof(label), "%s Erz\n{FFFFFF}\n\n/ore take", OreData[type][oName]);
            DroppedOres[id][OreLabel] = CreateDynamic3DTextLabel(label, OreData[type][oColor], x, y, z, 5.0, .testlos = 1);
            DroppedOres[id][OreExists] = true;
        }
        
        ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, false, true, true, false, 0, SYNC_ALL);
        Player_CleanUp(playerid, 1);
    }
    
    return 1;
}

Mining_PlayerDisconnect(playerid) {
    Player_CleanUp(playerid, 1);
    return 1;
}
 
Mining_VehicleSpawn(vehicleid) {
    Vehicle_CleanUp(vehicleid);
    return 1;
}

Mining_PlayerEnterDynamicCP(playerid, checkpointid) {
    if(checkpointid == LoadingPoint[playerid]) {
        if(GetPVarInt(playerid, "LoadingCooldown") > gettime()) return 1;
        new vehicleid = GetPVarInt(playerid, "mine_LastVehicleID");
        if(Vehicle_LoadedOres(vehicleid) >= MINING_VEHICLE_LIMIT) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Die Ladefläche deines Fahrzeuges ist voll.");
        LoadedOres[vehicleid][ CarryingOre[playerid] ]++;
        
        new string[128];
        format(string, sizeof(string), "MINING: {FFFFFF}%s in dein Fahrzeug geladen.", OreData[ CarryingOre[playerid] ][oName]);
        SendClientMessage(playerid, 0x2ECC71FF, string);
        ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, false, true, true, false, 0, SYNC_ALL);
        Player_CleanUp(playerid, 1);
        return 1;
    }
    
    if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
    {
        for(new i; i < sizeof(DropPoints); i++)
        {
            if(checkpointid == DropPoints[i][PointCP])
            {
                new string[128], vehicleid = GetPlayerVehicleID(playerid), cash = Vehicle_GetOreValue(vehicleid);
                format(string, sizeof(string), "MINING: {F39C12} %d {FFFFFF}Erze verkauft und {2ECC71}$%d {FFFFFF}verdient.", Vehicle_LoadedOres(vehicleid), cash);
                SendClientMessage(playerid, 0x2ECC71FF, string);
                GivePlayerMoneyEx(playerid, cash);
                GivePlayerEXP(playerid, randomEx(1, 4));
                Vehicle_CleanUp(vehicleid);
                
                for(new x; x < sizeof(DropPoints); x++)
                {
                    if(IsValidDynamicMapIcon(PointIcons[playerid][x]))
                    {
                        DestroyDynamicMapIcon(PointIcons[playerid][x]);
                        PointIcons[playerid][x] = -1;
                    }
 
                    TogglePlayerDynamicCP(playerid, DropPoints[x][PointCP], 0);
                }
 
                break;
            }
        }
    }
    
    return 1;
}

Mining_DialogResponse(playerid, dialogid, response, listitem)
{
    switch(dialogid)
    {
        case DIALOG_ORE_TAKE:
        {
            if(!response) return 1;
            if(MiningVein[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du baust bereits ein Erz ab.");
            if(CarryingOre[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst bereits ein Erz.");
            new id = GetNearestVehicleEx(playerid);
            if(!IsValidVehicle(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Es befindet sich kein Fahrzeug in deiner Nähe.");
            new Float: x, Float: y, Float: z;
            GetVehicleBoot(id, x, y, z);
            if(GetPlayerDistanceFromPoint(playerid, x, y, z) > 3.0) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht in der Nähe des Kofferraums.");
            if(LoadedOres[id][listitem] < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug hat dieses Erz nicht geladen.");
            LoadedOres[id][listitem]--;
            Player_GiveOre(playerid, listitem, 2);
        }
    }
    
    return 0; 
}

forward Vein_Generate();
public Vein_Generate()
{
    new Float: spawn_coords[][3] = {
        {670.500732, 926.557067, -41.475772},
        {678.838012, 925.259582, -41.473415},
        {673.852478, 922.303161, -41.548767},
        {679.489379, 917.357727, -41.276176},
        {673.862670, 914.984008, -41.207321},
        {666.973205, 921.626342, -41.613155},
        {686.447021, 913.041320, -40.560043},
        {679.475769, 910.190124, -41.048439},
        {689.223510, 906.631835, -40.269996},
        {683.865295, 905.557067, -40.672229},
        {685.984741, 899.446899, -40.296852},
        {694.975097, 902.076049, -39.668643},
        {692.622558, 896.177978, -39.817611},
        {697.621154, 891.354370, -39.355659},
        {687.311584, 891.855468, -40.107055},
        {692.106262, 887.992187, -39.684555},
        {690.451110, 879.733947, -40.143363},
        {696.097167, 882.666015, -39.491031},
        {694.623901, 872.130493, -41.227066},
        {693.549255, 862.414123, -43.129112},
        {688.462280, 868.132019, -42.136383},
        {688.172607, 857.167358, -43.610939},
        {667.181762, 819.235046, -43.610939},
        {663.166503, 811.138061, -43.610939},
        {654.977294, 812.527770, -43.610939},
        {651.793762, 805.835571, -43.610939},
        {660.028137, 820.449340, -43.610939},
        {646.762756, 814.375671, -43.610939},
        {643.352294, 808.098266, -43.610939},
        {637.106994, 812.568725, -43.610939},
        {630.459289, 810.016418, -43.610939},
        {624.303833, 813.422485, -43.610939},
        {615.880615, 812.158264, -43.610939},
        {610.537963, 815.100646, -43.603439},
        {603.759033, 817.793640, -43.646705},
        {597.451904, 822.874328, -43.579505},
        {605.012512, 823.405212, -43.728958},
        {618.658691, 818.265625, -43.603439},
        {580.120239, 931.571899, -43.610939},
        {569.243530, 928.569763, -43.610939},
        {560.821105, 926.251770, -43.610939},
        {576.770385, 923.246215, -43.610939},
        {567.994628, 919.691223, -43.610939},
        {575.571472, 916.415344, -43.664150},
        {569.872924, 912.386962, -43.610939},
        {587.315368, 913.924743, -43.796096},
        {582.004028, 910.695190, -43.892337},
        {560.253540, 909.118286, -43.610939},
        {560.626708, 917.773559, -43.610939},
        {530.954040, 909.995849, -43.610939},
        {611.991699, 933.569702, -40.581710},
        {609.077209, 922.338073, -42.479446},
        {608.724792, 927.748413, -41.762489},
        {649.643249, 928.250976, -39.830272},
        {653.457092, 922.054199, -41.079425},
        {644.637756, 922.242431, -41.463893},
        {647.455993, 914.794494, -42.107845},
        {657.229248, 914.974731, -41.061988},
        {590.929870, 838.788818, -43.386558},
        {600.051147, 841.034545, -44.017189},
        {590.187194, 846.630859, -43.336963},
        {582.725158, 843.719238, -43.011596},
        {576.576538, 849.726928, -43.056209},
        {573.548828, 844.638610, -42.740356},
        {566.613159, 843.542358, -42.616565},
        {559.421691, 840.400390, -42.141761},
        {552.358398, 837.908569, -41.532897},
        {562.215698, 848.450744, -42.990608},
        {553.209289, 843.931945, -42.226833},
        {545.759094, 836.563537, -41.645462},
        {546.358886, 844.129211, -42.148715},
        {553.752990, 849.901916, -42.900249},
        {539.853637, 845.818481, -42.563919},
        {528.839843, 843.820007, -43.529937},
        {533.157653, 848.349853, -43.296516},
        {520.944458, 846.692749, -43.610939},
        {526.440917, 850.654602, -43.610939},
        {536.822448, 852.424804, -43.107326},
        {546.298095, 850.573242, -42.897747},
        {551.512939, 879.981933, -43.265190},
        {559.212646, 886.721923, -43.916355},
        {566.831054, 885.784973, -44.073543},
        {574.826660, 883.917602, -44.008312},
        {573.601867, 877.364135, -44.474807},
        {573.405334, 865.376098, -43.900402},
        {566.972229, 867.566162, -44.025466},
        {566.110717, 875.090148, -44.276050},
        {559.155700, 867.633850, -43.972709},
        {552.657165, 871.074157, -43.586654},
        {590.525634, 884.257019, -44.786952},
        {581.356384, 885.243469, -44.612636},
        {595.025329, 891.404907, -45.047763},
        {601.949951, 893.569396, -45.066448},
        {599.344055, 887.141723, -44.512237},
        {597.956787, 880.352294, -43.925403},
        {597.799316, 872.847290, -43.639019},
        {603.701110, 881.868469, -43.749420},
        {609.776245, 877.436706, -43.610939},
        {609.780212, 888.589721, -44.169811},
        {609.496215, 894.040039, -44.493488},
        {615.364379, 883.519409, -43.610939},
        {616.436218, 866.841308, -43.610939},
        {624.843017, 869.950256, -43.603439},
        {620.875671, 875.108886, -43.603439},
        {631.959045, 874.122375, -43.603439},
        {626.006774, 879.856384, -43.610939},
        {638.100219, 880.400573, -43.610939},
        {634.172485, 885.813476, -43.610939},
        {635.576660, 893.294067, -43.603439},
        {641.967956, 898.003051, -43.558959},
        {648.679199, 897.242004, -42.743541},
        {654.830322, 895.541931, -42.002933},
        {662.546447, 893.076171, -41.048439},
        {652.472778, 889.743713, -42.355361},
        {644.680358, 887.102661, -43.205955},
        {638.895996, 888.600891, -43.603439},
        {643.382629, 892.997375, -43.376350},
        {681.386230, 863.475097, -42.681892},
        {646.588012, 860.239013, -43.376369},
        {648.004821, 851.773437, -43.610939},
        {654.417053, 855.355895, -43.610939},
        {660.318481, 849.473388, -43.610939},
        {661.591796, 861.592041, -43.277667},
        {660.899780, 867.371459, -42.788570}
    };
 
    for(new i = 0; i < MAX_PLAYERS; i++)
    {
        if(!IsPlayerConnected(i)) continue;
        Player_CleanUp(i);
    }
 
    // Destroy Old Veins
    for(new i; i < MAX_VEINS; i++)
    {
        if(!VeinData[i][VeinExists]) continue;
        DestroyDynamicObject(VeinData[i][VeinObject]);
        DestroyDynamic3DTextLabel(VeinData[i][VeinLabel]);
        VeinData[i][VeinExists] = false;
    }
 
    // Respawn
    new type;
    for(new i; i < sizeof(spawn_coords); i++)
    {
        if(i >= MAX_VEINS) break;
        type = random(MAX_ORE_TYPES);
 
        VeinData[i][Type] = type;
        VeinData[i][Amount] = OreData[type][Amount];
        VeinData[i][VeinObject] = CreateDynamicObject(867, spawn_coords[i][0], spawn_coords[i][1], spawn_coords[i][2], 0.0, 0.0, random(360));
        SetDynamicObjectMaterial(VeinData[i][VeinObject], 0, 2936, "kmb_rckx", "larock256", RGBAToARGB(OreData[type][oColor]));
        VeinData[i][VeinLabel] = CreateDynamic3DTextLabel("Label", OreData[type][oColor], spawn_coords[i][0], spawn_coords[i][1], spawn_coords[i][2] + 0.5, 5.0, .testlos = 1);
        VeinData[i][VeinExists] = true;
        Vein_Update(i);
    }
 
    return 1;
}
 
forward Player_Mine(playerid);
public Player_Mine(playerid)
{
    if(MiningVein[playerid] != -1)
    {
        new vein_id = MiningVein[playerid], Float: value = GetPlayerProgressBarValue(playerid, MiningBar[playerid]) + OreData[ VeinData[vein_id][Type] ][Modifier];
        if(value >= MINING_BAR_MAX) {
            Player_CleanUp(playerid);
            
            if(random(100) < OreData[ VeinData[vein_id][Type] ][Rate]) {
                VeinData[vein_id][Amount]--;
                Player_GiveOre(playerid, VeinData[vein_id][Type]);
                Vein_Update(vein_id);
                
                new string[64];
                format(string, sizeof(string), "~n~~g~~h~%s abgebaut", OreData[ VeinData[vein_id][Type] ][oName]);
                GameTextForPlayer(playerid, string, 2000, 3);
            }else{
                GameTextForPlayer(playerid, "~n~~r~~h~Fehlgeschlagen", 2000, 3);
            }
        }else{
            SetPlayerProgressBarValue(playerid, MiningBar[playerid], value);
        }
    }
    
    return 1;
}
 
forward Ore_Destroy(id);
public Ore_Destroy(id)
{
    KillTimer(DroppedOres[id][OreTimer]);
    DestroyDynamicObject(DroppedOres[id][OreObject]);
    DestroyDynamic3DTextLabel(DroppedOres[id][OreLabel]);
    DroppedOres[id][OreExists] = false;
    return 1;
}