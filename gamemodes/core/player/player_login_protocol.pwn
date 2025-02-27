addPlayerProtocoll(playerid) {
    if(!IsPlayerConnectedEx(playerid)) return 0;

    new query[128], _ip[16];
    GetPlayerIp(playerid, _ip);
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_protocol` (`userId`, `ip`) VALUES (%i, '%s')", SpielerInfo[playerid][sDBID], _ip);
    mysql_tquery(sqlHandle, query);
    return 1;
}