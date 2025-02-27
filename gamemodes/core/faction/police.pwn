stock SendCopMessage(color,const message[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(IsPlayerConnectedEx(i) && SpielerInfo[i][sFraktion] == 2 || SpielerInfo[i][sFraktion] == 6)
		{
			SendClientMessage(i,color,message);
		}
	}
	return 1;
}

stock CountOnlineCops()
{
    new c;
    foreach(new i : Player)
    {
        if(IsPlayerConnected(i) && GetPVarInt(i,"CopDuty") == 1 || GetPVarInt(i,"FBIDuty") == 1) c++;
    }
    return c;
}

stock isACop(playerid)
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)return 1;
 	else return 0;
}