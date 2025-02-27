CMD:gueter(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] != 14)return NichtBerechtigt
 	if(GetPVarInt(playerid,"ZugfahrerDuty") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(GetVehicleModel(GetPlayerVehicleID(playerid)) != 537)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist in keinem Zug.");
 	if(GetPlayerSpeed(playerid) > 5)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Bringe deinen Zug zum stehen damit er entladen werden kann.");
  	if(IsPlayerInRangeOfPoint(playerid,20.0,1394.7555,2632.2500,12.3495))//Las Venturas (Trailer ID 2)
	{
 		if(GetPVarInt(playerid,"ZugWarInLV") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Container wurden bereits entladen. Fahre weiter nach San Fierro.");
   		SetPlayerCheckpointEx(playerid,-1944.3750,102.6988,27.2245,7.0);
	    DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][0]); DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][2]][fAttachedObject][1]);
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Die von dir gelieferten gueter wurden entladen.");
	    SetPVarInt(playerid,"ZugWarInLV",1);
	    return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,20.0,-1944.3750,102.6988,27.2245))//San Fierro (Trailer ID 3)
	{
 		if(GetPVarInt(playerid,"ZugWarInSF") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Die Container wurden bereits entladen. Fahre weiter nach Los Santos.");
   		if(GetPVarInt(playerid,"ZugWarInLV") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast noch gueter für Las Venturas auf dem Zug. Liefere sie erst ab!");
	    SetPlayerCheckpointEx(playerid,1777.6743,-1953.8064,15.0995,7.0);
	    DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][0]); DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][3]][fAttachedObject][1]);
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Die von dir gelieferten gueter wurden entladen.");
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast neue gueter für Los Santos erhalten. Sie wurden in die vorderen Container verfrachtet.");
	    DeletePVar(playerid,"ZugWarInLV");
	    SetPVarInt(playerid,"ZugWarInSF",1);
	    return 1;
	}
	else if(IsPlayerInRangeOfPoint(playerid,20.0,1777.6743,-1953.8064,15.0995))//Los Santos (Trailer ID 1)
	{
 		if(GetPVarInt(playerid,"ZugWarInSF") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast noch gueter für San Fierro auf dem Zug. Liefere sie erst ab!");
   		DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][0]); DestroyDynamicObject(FahrzeugInfo[SpielerInfo[playerid][sZugID][1]][fAttachedObject][1]);
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Die von dir aus San Fierror mitgenommenen gueter wurden entladen.");
	    DeleteJobFahrzeug(playerid);

		new string[128];
  		format(string,sizeof(string),"Dein Gehalt in Höhe von %d$ wird dir am Payday überwiesen. Benutze /payday um deinen Check einzusehen.",JobInfo[14][jiGehalt]);
  		SendClientMessage(playerid,COLOR_INFO,string);
  		SpielerInfo[playerid][sPayDayGeld] += JobInfo[14][jiGehalt];
  		DeletePVar(playerid,"ZugWarInSF");
  		GivePlayerEXP(playerid,35);

		SetCameraBehindPlayer(playerid);

		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Um eine neue Tour beginnen zu können, gehe in den Feierabend und wieder in den Dienst.");
  		return 1;
	}
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem Bahnhof.");
 	return 1;
}