
stock SavePlayerWeapons(playerid)
{
    if(!IsPlayerNPC(playerid) && GetPVarInt(playerid,"LoggedIn") == 1 && GetPVarInt(playerid,"ServerPasswort") == 0)
    {
	    new Waffen[13][2], query[600];
		for (new i = 0; i <= 12; i++)
		{
		    GetPlayerWeaponData(playerid, WEAPON_SLOT:i, WEAPON:Waffen[i][0], Waffen[i][1]);
		}
		mysql_format(sqlHandle, query,sizeof(query),"UPDATE `accounts` SET `wpSlot1`='%d', `wpSlot2`='%d', `wpSlot3`='%d', `wpSlot4`='%d', `wpSlot5`='%d', `wpSlot6`='%d', `wpSlot7`='%d', `wpSlot8`='%d', `wpSlot9`='%d', `wpSlot10`='%d', `wpSlot11`='%d', `wpSlot12`='%d' WHERE `Name`='%s'"
		,Waffen[0][0],Waffen[1][0],Waffen[2][0],Waffen[3][0],Waffen[4][0],Waffen[5][0],Waffen[6][0],Waffen[7][0],Waffen[8][0],Waffen[9][0],Waffen[10][0],Waffen[11][0],SpielerInfo[playerid][sName]);
		mysql_tquery(sqlHandle, query);

	    mysql_format(sqlHandle, query,sizeof(query),"UPDATE `accounts` SET `wpSlot1Ammu`='%d', `wpSlot2Ammu`='%d', `wpSlot3Ammu`='%d', `wpSlot4Ammu`='%d', `wpSlot5Ammu`='%d', `wpSlot6Ammu`='%d', `wpSlot7Ammu`='%d', `wpSlot8Ammu`='%d', `wpSlot9Ammu`='%d', `wpSlot10Ammu`='%d', `wpSlot11Ammu`='%d', `wpSlot12Ammu`='%d' WHERE `Name`='%s'"
		,Waffen[0][1],Waffen[1][1],Waffen[2][1],Waffen[3][1],Waffen[4][1],Waffen[5][1],Waffen[6][1],Waffen[7][1],Waffen[8][1],Waffen[9][1],Waffen[10][1],Waffen[11][1],SpielerInfo[playerid][sName]);
		mysql_tquery(sqlHandle, query);
	}
	return 1;
}

stock LoadPlayerWeapons(playerid)
{
	new string[500];
    mysql_format(sqlHandle, string, sizeof(string),"SELECT wpSlot1, wpSlot2, wpSlot3, wpSlot4, wpSlot5, wpSlot6, wpSlot7, wpSlot8, wpSlot9, wpSlot10, wpSlot11, wpSlot12,\
	wpSlot1Ammu, wpSlot2Ammu, wpSlot3Ammu, wpSlot4Ammu, wpSlot5Ammu, wpSlot6Ammu, wpSlot7Ammu, wpSlot8Ammu, wpSlot9Ammu, wpSlot10Ammu, wpSlot11Ammu, wpSlot12Ammu FROM `accounts` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
    mysql_tquery(sqlHandle, string, "onLoadPlayerWeapons", "i", playerid);
	return 1;
}