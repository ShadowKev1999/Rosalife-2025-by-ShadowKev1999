stock UpdatePlayerLocation(playerid)
{
    new Float:pos_x, Float:pos_y, Float:pos_z;
    GetPlayerPos(playerid, pos_x, pos_y, pos_z);
    
    for(new i = 0, j = sizeof(Zones); i < j; i++)
    {
        if( (floatcmp(pos_x, Zones[i][zone_minx]) == 1 && floatcmp(pos_x, Zones[i][zone_maxx]) == -1) &&
            (floatcmp(pos_y, Zones[i][zone_miny]) == 1 && floatcmp(pos_y, Zones[i][zone_maxy]) == -1) &&
            (floatcmp(pos_z, Zones[i][zone_minz]) == 1 && floatcmp(pos_z, Zones[i][zone_maxz]) == -1))
            {
                TextDrawSetString(gTD_Location[playerid], Zones[i][zone_name]);
 
                return 1;
            }
    }
 
    return 0;
}

forward Timer_UpdatePlayerLocation(playerid);
 
public Timer_UpdatePlayerLocation(playerid)
{
    if(GetPVarInt(playerid, "TextDrawHiding"))
        return 1;
        
    if(!gPlayerSpawned[playerid])
        return 1;
        
    if(UpdatePlayerLocation(playerid))
    {
        TextDrawHideForPlayer(playerid, gTD_Location[playerid]);
        TextDrawShowForPlayer(playerid, gTD_Location[playerid]);
    }
    return 1;
}
 
stock PlayerLoc_OnPlayerConnect(playerid)
{   //428.960113
    gTD_Location[playerid] = TextDrawCreate(87.000022, 315.960113, " ");
    TextDrawLetterSize(gTD_Location[playerid], 0.269665, 0.957868);
    TextDrawTextSize(gTD_Location[playerid], 61.000038, 245.280014);
    TextDrawAlignment(gTD_Location[playerid], TEXT_DRAW_ALIGN_CENTRE);
    TextDrawColour(gTD_Location[playerid], -1);
    TextDrawSetShadow(gTD_Location[playerid], 0);
    TextDrawSetOutline(gTD_Location[playerid], 1);
    TextDrawBackgroundColour(gTD_Location[playerid], 51);
    TextDrawFont(gTD_Location[playerid], TEXT_DRAW_FONT_2);
    TextDrawSetProportional(gTD_Location[playerid], true);
    
    gPlayerSpawned[playerid] = false;
    gLocationUpdateTimer[playerid] = SetTimerEx("Timer_UpdatePlayerLocation", UPDATE_INTERVAL, true, "i", playerid);
    return 1;
}
 
stock PlayerLoc_OnPlayerRequestClass(playerid)
{
    gPlayerSpawned[playerid] = false;
    TextDrawHideForPlayer(playerid, gTD_Location[playerid]);
    return 1;
}
 
stock PlayerLoc_OnPlayerSpawn(playerid)
{
    gPlayerSpawned[playerid] = true;
    
    UpdatePlayerLocation(playerid);
    TextDrawShowForPlayer(playerid, gTD_Location[playerid]);
    return 1;
}
 
stock PlayerLoc_OnPlayerDeath(playerid)
{
    gPlayerSpawned[playerid] = false;
    
    TextDrawHideForPlayer(playerid, gTD_Location[playerid]);
    return 1;
}
 
stock PlayerLoc_OnPlayerDisconnect(playerid)
{
    gPlayerSpawned[playerid] = false;
    
    TextDrawDestroy(gTD_Location[playerid]);
    KillTimer(gLocationUpdateTimer[playerid]);
    return 1;
}