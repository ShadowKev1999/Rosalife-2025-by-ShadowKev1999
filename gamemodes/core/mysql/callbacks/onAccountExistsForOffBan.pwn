forward onAccountExistsForOffBan(playerid, const _playerName[MAX_PLAYER_NAME], const _banReason[64]);
public onAccountExistsForOffBan(playerid, const _playerName[MAX_PLAYER_NAME], const _banReason[64]) {
    new rows, query[200];
    cache_get_row_count(rows);
    if(!rows) {
        SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Account-Name wurde in der Datenbank nicht gefunden.");
        return 1;
    }
    mysql_format(sqlHandle, query, sizeof(query),"SELECT Online FROM `accounts` WHERE `Name` = '%s'", _playerName);
    mysql_tquery(sqlHandle, query, "onAccountOnlineForOffBan", "iss", playerid, _playerName, _banReason);
    return 1;
}