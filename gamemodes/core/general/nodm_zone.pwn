stock Init_NoDeathmatch() {

    for(new zone=0; zone<sizeof(NoDMZoneInfo); zone++) {
 		NoDMZoneInfo[zone][ndzID] = GangZoneCreate(NoDMZoneInfo[zone][ndzMinX],NoDMZoneInfo[zone][ndzMinY],NoDMZoneInfo[zone][ndzMaxX],NoDMZoneInfo[zone][ndzMaxY]);
 	}
    return 1;
}

stock IsPlayerInNoDMZone(playerid)
{
   	for(new zone=0; zone<sizeof(NoDMZoneInfo); zone++)
	{
	    if(IsPlayerInArea(playerid, NoDMZoneInfo[zone][ndzMinX], NoDMZoneInfo[zone][ndzMaxX], NoDMZoneInfo[zone][ndzMinY], NoDMZoneInfo[zone][ndzMaxY]))return true;
	}
	return false;
}