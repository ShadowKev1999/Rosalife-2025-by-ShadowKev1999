CMD:changeemail(playerid, params[]) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    new query[128];

    mysql_format(sqlHandle, query, sizeof(query), "SELECT `EMail` FROM `accounts` WHERE `ID` = %i AND `is_email_verified` = 0", SpielerInfo[playerid][sDBID]);
    mysql_tquery(sqlHandle, query, "onPlayerStartChangeEmail", "i", playerid);
    return 1;
}