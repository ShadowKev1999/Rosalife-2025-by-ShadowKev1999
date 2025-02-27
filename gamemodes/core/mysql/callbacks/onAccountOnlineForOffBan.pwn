forward onAccountOnlineForOffBan(playerid, const _playerName[MAX_PLAYER_NAME], const _banReason[64]);
public onAccountOnlineForOffBan(playerid, const _playerName[MAX_PLAYER_NAME], const _banReason[64]) {
    new rows, query[200];
    cache_get_row_count(rows);
    if(rows) {
        new merker[4];
        cache_get_value_name(0, "Online",merker);
        
        if(strval(merker) > 0)return SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Der angegebene Spieler ist online. Benutze /ban [SpielerName] [Grund]");

        new Uhrzeit[16], Datum[16];
        gettime(Hour, Minute, Second);
        getdate(Year, Month, Day);
        format(Uhrzeit,sizeof(Uhrzeit),"%02d:%02d:%02d",Hour,Minute,Second);
        format(Datum,sizeof(Datum),"%d/%02d/%02d",Day,Month,Year);
        mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `accbans` (`Name`, `Teammitglied`, `Bangrund`, `Uhrzeit`, `Datum`) VALUES ('%s', '%s', '%s', '%s', '%s')", _playerName, SpielerInfo[playerid][sName], _banReason, Uhrzeit, Datum);
        mysql_tquery(sqlHandle, query);
        format(query,sizeof(query),"Der Account '%s' wurde von %s %s Offline gebannt. Grund: %s",_playerName, AdminName(playerid), SpielerInfo[playerid][sName], _banReason);
        SendClientMessageToAll(COLOR_RED,query);
        return 1;
    }
    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Account-Name wurde in der Datenbank nicht gefunden.");
    return 1;
}