

task airdropTimer[AIRDROP_TIMER]() {
    if(!AirdropData[airActive]) GetNextAirdrop();
    else RemoveAirdrop();
    return 1;
}

GetNextAirdrop() {
    mysql_tquery(sqlHandle, "SELECT * FROM `airdroppos` WHERE TIMESTAMPDIFF(MINUTE, lastPick, NOW()) > 1440 ORDER BY lastPick, RAND() LIMIT 1", "onGetNextAirdrop");
    return 1;
}

Airdrop_OnPlayerConnect(playerid) {
    DeletePVar(playerid, "AIRDROP_PICKING");
    return 1;
}

forward onGetNextAirdrop();
public onGetNextAirdrop() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        new Float:tempX, Float:tempY, tempId;
        cache_get_value_name_int(0, "id", tempId);
        cache_get_value_name_float(0, "x", tempX);
        cache_get_value_name_float(0, "y", tempY);
        DropAirdrop(tempX, tempY);

        new sqlquery[128];
        mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "UPDATE `airdroppos` SET `lastPick`=NOW() WHERE `id` = %d", tempId);
	    mysql_tquery(sqlHandle, sqlquery);
    }
    return 1;
}

DropAirdrop(Float:rX, Float:rY) {
	new Float:rayoZ;

    CA_FindZ_For2DCoord(rX, rY, rayoZ);

    rayoZ += 7.5;

    AirdropData[rayX] = rX;
    AirdropData[rayY] = rY;
    AirdropData[rayZ] = rayoZ;
    AirdropData[rayRX] = 0.00;
    AirdropData[rayRY] = 0.00;
    AirdropData[rayRZ] = 0.00;

    SendClientMessageToAll(-1, "{CCFF33}AIRDROP: {FFFFFF}Ein neuer Airdrop wurde über San Andreas abgeworfen (%s).", GetPlayerAreaName(rX, rY, rayoZ));

    AirdropData[airObject] = CreateDynamicObject(18849, rX, rY, rayoZ+100, 0.0, 0.0, 0.0);
    MoveDynamicObject(AirdropData[airObject], rX, rY, rayoZ, 4.0, 0.00, 0.00, 0.00);
    return 1;
}

RemoveAirdrop() {
    if(!AirdropData[airActive]) return 1;

    DestroyDynamicObject(AirdropData[airObject]);
    DestroyDynamic3DTextLabel(AirdropData[airLabel]);
    AirdropData[airActive] = false;
    SendClientMessageToAll(-1, "{CCFF33}AIRDROP: {FFFFFF}Der Airdrop wurde von keinem Spieler gefunden. Dieser wurde automatisch vom Server entfernt.");
    return 1;
}

Airdrop_DynObjectMoved(objectid)
{
	if(objectid == AirdropData[airObject])
	{
		AirdropData[airLabel] = CreateDynamic3DTextLabel("{CCFF33}AirDrop\n{FFFFFF}Tippe /airdrop", 0x0066FFCC, AirdropData[rayX], AirdropData[rayY], AirdropData[rayZ] - 6.5, 7.5, .testlos = 1);
        AirdropData[airActive] = true;
	}
	return 1;
}

forward OnPlayerPickupAirdrop(playerid);
public OnPlayerPickupAirdrop(playerid) {
    new amount = 0, string[128];
    switch(random(3)) {
        case 0: {
            amount = randomEx(1500, 5000);

            GivePlayerMoneyEx(playerid, amount);

            format(string, sizeof(string), "{CCFF33}AIRDROP:{FFFFFF} %s hat den Airdrop gefunden und %i $ erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
        case 1: {
            amount = randomEx(50, 150);

            GivePlayerEXP(playerid, amount);

            format(string, sizeof(string), "{CCFF33}AIRDROP:{FFFFFF} %s hat den Airdrop gefunden und %i EXP erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
        case 2: {
            SetPVarInt(playerid,"LevelUpTime",1);
		    SetTimerEx("LevelUpPlayer",1000,false,"i",playerid);

            amount = 1;

            format(string, sizeof(string), "{CCFF33}AIRDROP: {FFFFFF}%s hat den Airdrop gefunden und %i Level erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
    }
    AirdropData[airActive] = false;
    DestroyDynamicObject(AirdropData[airObject]);
    DestroyDynamic3DTextLabel(AirdropData[airLabel]);

    addServerTimelineEvent(TIMELINE_TAG_USER_AIRDROP, SpielerInfo[playerid][sDBID], "hat einen Airdrop gefunden und eine Belohnung erhalten.");

    DeletePVar(playerid, "AIRDROP_PICKING");

    ClearAnimations(playerid);
    return 1;
}