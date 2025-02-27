forward onLoadPlayerWeapons(playerid);
public onLoadPlayerWeapons(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        new Waffen[13][2];
		cache_get_value_name_int(0, "wpSlot1", Waffen[0][0]); cache_get_value_name_int(0, "wpSlot2", Waffen[1][0]); cache_get_value_name_int(0, "wpSlot3", Waffen[2][0]);
		cache_get_value_name_int(0, "wpSlot4", Waffen[3][0]); cache_get_value_name_int(0, "wpSlot5", Waffen[4][0]); cache_get_value_name_int(0, "wpSlot6", Waffen[5][0]);
		cache_get_value_name_int(0, "wpSlot7", Waffen[6][0]); cache_get_value_name_int(0, "wpSlot8", Waffen[7][0]); cache_get_value_name_int(0, "wpSlot9", Waffen[8][0]);
		cache_get_value_name_int(0, "wpSlot10", Waffen[9][0]); cache_get_value_name_int(0, "wpSlot11", Waffen[10][0]); cache_get_value_name_int(0, "wpSlot12", Waffen[11][0]);

		cache_get_value_name_int(0, "wpSlot1Ammu", Waffen[0][1]); cache_get_value_name_int(0, "wpSlot2Ammu", Waffen[1][1]); cache_get_value_name_int(0, "wpSlot3Ammu", Waffen[2][1]);
		cache_get_value_name_int(0, "wpSlot4Ammu", Waffen[3][1]); cache_get_value_name_int(0, "wpSlot5Ammu", Waffen[4][1]); cache_get_value_name_int(0, "wpSlot6Ammu", Waffen[5][1]);
		cache_get_value_name_int(0, "wpSlot7Ammu", Waffen[6][1]); cache_get_value_name_int(0, "wpSlot8Ammu", Waffen[7][1]); cache_get_value_name_int(0, "wpSlot9Ammu", Waffen[8][1]);
		cache_get_value_name_int(0, "wpSlot10Ammu", Waffen[9][1]); cache_get_value_name_int(0, "wpSlot11Ammu", Waffen[10][1]); cache_get_value_name_int(0, "wpSlot12Ammu", Waffen[11][1]);

		GivePlayerWeapon(playerid,WEAPON:Waffen[0][0],Waffen[0][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[1][0],Waffen[1][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[2][0],Waffen[2][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[3][0],Waffen[3][1]);
		GivePlayerWeapon(playerid,WEAPON:Waffen[4][0],Waffen[4][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[5][0],Waffen[5][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[6][0],Waffen[6][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[7][0],Waffen[7][1]);
		GivePlayerWeapon(playerid,WEAPON:Waffen[8][0],Waffen[8][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[9][0],Waffen[9][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[10][0],Waffen[10][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[11][0],Waffen[11][1]); GivePlayerWeapon(playerid,WEAPON:Waffen[12][0],Waffen[12][1]);
    }
    return 1;
}