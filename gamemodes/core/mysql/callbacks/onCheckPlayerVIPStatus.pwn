forward onCheckPlayerVIPStatus(playerid);
public onCheckPlayerVIPStatus(playerid) {
    new rows, unvip = 0;
    cache_get_row_count(rows);
    if(rows) {
        cache_get_value_name_int(0, "serv_Data", unvip);
        if(gettime() > unvip) {
            new string[128];
            mysql_format(sqlHandle, string, sizeof(string), "DELETE FROM `vip` WHERE `Name` = '%s' ", SpielerInfo[playerid][sName]);
            mysql_tquery(sqlHandle, string);
            SendClientMessage(playerid,COLOR_RED,"[Wichtige Info]: {FFFFFF}Dein VIP ist ausgelaufen. Du kannst jederzeit wieder VIP holen!");
            GameTextForPlayer(playerid,"~r~VIP AUSGELAUFEN",3000,4);
            SpielerInfo[playerid][sVIP] = 0;
        }
    }
    return 1;
}