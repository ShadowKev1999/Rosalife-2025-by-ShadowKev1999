forward onUnbanPlayer(playerid, const reason[]);
public onUnbanPlayer(playerid, const reason[]) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Account-Name wurde in der Datenbank nicht gefunden.");
    new _id, _Name[MAX_PLAYER_NAME], query[128];
    cache_get_value_name_int(0, "ID", _id);
    cache_get_value_name(0, "Name", _Name);

    valstr(query, _id);
    mysql_Delete("accbans", "ID", query);
    format(query,sizeof(query),"Der Account '%s' wurde von %s %s entbannt. Grund: %s", _Name, AdminName(playerid), SpielerInfo[playerid][sName], reason);
    SendAdminMessage(COLOR_SUPER,query);
    CreateServerLogEntry("UNBAN_LOG", query);
    return 1;
}