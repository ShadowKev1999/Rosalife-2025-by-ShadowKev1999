CMD:verlassen(playerid, params[])
{
	new string[128];
 	if(GetPVarInt(playerid,"Paintball") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht in der Paintballarena.");
	foreach(new i : Player)
	{
		if(GetPVarInt(i,"Paintball") == 0)continue;
		if(GetPVarInt(i,"Paintball") != GetPVarInt(playerid,"Paintball"))continue;
		if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid))continue;
		format(string,sizeof(string),"[Info]: {FFFFFF}%s hat die Paintballarena verlassen.",SpielerInfo[playerid][sName]);
		SendClientMessage(i,COLOR_YELLOW,string);
	}
	if(GetPVarInt(playerid,"Paintball") == 1){PaintballSpieler[0]--;}
	else if(GetPVarInt(playerid,"Paintball") == 2){PaintballSpieler[1]--;}
	else if(GetPVarInt(playerid,"Paintball") == 3){PaintballSpieler[2]--;}
	else if(GetPVarInt(playerid,"Paintball") == 4){PaintballSpieler[3]--;}
	else if(GetPVarInt(playerid,"Paintball") == 5){PaintballSpieler[4]--;}
	DeletePVar(playerid,"Paintball");
	ResetPlayerWeapons(playerid);
	SetPlayerArmour(playerid,0);
	SetPlayerHealth(playerid,100);
	SetPlayerInterior(playerid,0);
 	SetPlayerVirtualWorld(playerid,0);
	SetPlayerPos(playerid,1024.3059,-982.7781,42.6476);
	SetPlayerFacingAngle(playerid,358.5271);
	LoadPlayerWeapons(playerid);
 	return 1;
}