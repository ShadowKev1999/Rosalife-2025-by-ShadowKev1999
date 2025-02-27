new playerRadioList[MAX_PLAYERS][MAX_RADIOS];
new playerRadioMax[MAX_PLAYERS] = 0;

OpenVehicleRadios(playerid) {
    mysql_tquery(sqlHandle, "SELECT * FROM `vehicle_radios` WHERE `radioActive` = 1 LIMIT "#MAX_RADIOS"", "onLoadVehicleRadios", "i", playerid);
    return 1;
}

forward onLoadVehicleRadios(playerid);
public onLoadVehicleRadios(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es wurden keine Radiosender gefunden.");
    new string[512], tempCarRadio[MAX_RADIOS][2][128];
    for(new i = 0; i < rows; i++) {
        if(i >= MAX_RADIOS) continue;
        cache_get_value_name_int(i, "id", playerRadioList[playerid][i]);
        cache_get_value_name(i, "radioName", tempCarRadio[i][0]);
        cache_get_value_name(i, "radioColor", tempCarRadio[i][1]);

        format(string, sizeof(string), "%s\n%s%s", string, tempCarRadio[i][1], tempCarRadio[i][0]);
    }
    playerRadioMax[playerid] = rows;
    strcat(string, "\n{FFFFFF}Eigene Sender URL eingeben");
    strcat(string, "\n{FFFFFF}Radio ausschalten");
    ShowPlayerDialog(playerid,DIALOG_CARRADIO,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Fahrzeugradio",string,"Abspielen","Abbrechen");
    return 1;
}

SelectVehicleRadio(playerid, listitem) {
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `vehicle_radios` WHERE `id` = %i", playerRadioList[playerid][listitem]);
    mysql_tquery(sqlHandle, query, "onSelectedVehicleRadio", "ii", playerid, playerRadioList[playerid][listitem]);
    return 1;
}

forward onSelectedVehicleRadio(playerid, radioId);
public onSelectedVehicleRadio(playerid, radioId) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der ausgewählte Sender wurde nicht gefunden.");
    new tempRadioUrl[128], tempRadioName[64];
    cache_get_value_name(0, "radioUrl", tempRadioUrl);
    cache_get_value_name(0, "radioName", tempRadioName);

    new vehId = GetPlayerVehicleID(playerid), string[64];
    foreach(new i : Player)
    {
        if(GetPlayerVehicleID(i) == vehId)
        {
            PlayAudioStreamForPlayer(i, tempRadioUrl);
            format(string, sizeof(string), "~g~%s", tempRadioName);
            GameTextForPlayer(i, string, 3000, 3);
        }
    }
    CarRadio[vehId] = radioId;
    Radio[vehId] = true;
    return 1;
}

LoadVehicleRadioById(playerid, radioId) {
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `vehicle_radios` WHERE `id` = %i", radioId);
    mysql_tquery(sqlHandle, query, "onSelectedVehicleRadioById", "i", playerid);
    return 1;
}

forward onSelectedVehicleRadioById(playerid);
public onSelectedVehicleRadioById(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der ausgewählte Sender wurde nicht gefunden.");
    new tempRadioUrl[128], tempRadioName[64];
    cache_get_value_name(0, "radioUrl", tempRadioUrl);
    cache_get_value_name(0, "radioName", tempRadioName);

    new string[64];
    PlayAudioStreamForPlayer(playerid, tempRadioUrl);
    format(string, sizeof(string), "~g~%s", tempRadioName);
    GameTextForPlayer(playerid, string, 3000, 3);
    return 1;
}