stock givePlayerTitle(playerid, titleId, amount = 1) {
    if(PlayerTitle[playerid][titleId][0]) return 1;

    PlayerTitle[playerid][titleId][1] += amount;

    if(ServerTitles[titleId][tAmount] >= PlayerTitle[playerid][titleId][1]) {
        PlayerTitle[playerid][titleId][0] = 1;
        PlayerTitle[playerid][titleId][1] = 0;

        SendClientMessage(playerid, -1, "{3366FF}[TITEL]: {FFFFFF}Du hast erfolgreich den Titel %s freigeschaltet!", ServerTitles[titleId][tName]);
        SendClientMessage(playerid, -1, "{3366FF}[TITEL]: {FFFFFF}Du kannst einen Spielertitel mit /playertitle auswählen.");

        new query[128];
        mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_titles` WHERE `user_id` = %i AND `titleId` = %i", GetPlayerDb(playerid), titleId);
        mysql_tquery(sqlHandle, query, "finishPlayerTitle", "iii", playerid, titleId, GetPlayerDb(playerid));
    }
    return 1;
}

forward finishPlayerTitle(playerid, titleId, databaseId);
public finishPlayerTitle(playerid, titleId, databaseId) {
    new rows, query[128];
    cache_get_row_count(rows);
    if(!rows) {
        mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_titles` (`user_id`, `titleId`, `status`, `amount`) VALUES (%i, %i, 1, 0)", databaseId, titleId);
        mysql_tquery(sqlHandle, query);
    } else {
        mysql_format(sqlHandle, query, sizeof(query), "UPDATE `player_titles` SET `status` = 1 WHERE `user_id` = %i AND `titleId` = %i", databaseId, titleId);
        mysql_tquery(sqlHandle, query);
    }
    return 1;
}

stock LoadPlayerTitles(playerid) {
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_titles` WHERE `user_id` = %i", GetPlayerDb(playerid));
    mysql_tquery(sqlHandle, query, "onLoadPlayerTitles", "i", playerid);
    return 1;
}

forward onLoadPlayerTitles(playerid);
public onLoadPlayerTitles(playerid) {
    new rows, tempId;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "titleId", tempId);
            cache_get_value_name_int(i, "status", PlayerTitle[playerid][tempId][0]);
            cache_get_value_name_int(i, "amount", PlayerTitle[playerid][tempId][1]);
        }
    }
    return 1;
}

stock SavePlayerTitles(playerid) {
    new query[128];
    for(new i = 0; i < MAX_SERVER_TITLES; i++) {
        if(PlayerTitle[playerid][i][0]) continue;
        mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_titles` WHERE `titleId` = %i AND `user_id` = %i", i, GetPlayerDb(playerid));
        mysql_tquery(sqlHandle, query, "onSavePlayerTitles", "iii", playerid, i, GetPlayerDb(playerid));
    }
    return 1;
}

forward onSavePlayerTitles(playerid, titleId, databaseId);
public onSavePlayerTitles(playerid, titleId, databaseId) {
    new rows, query[128];
    cache_get_row_count(rows);
    if(rows) {
        mysql_format(sqlHandle, query, sizeof(query), "UPDATE `player_titles` SET `status` = %i, `amount` = %i WHERE `titleId` = %i AND `user_id` = %i",
        PlayerTitle[playerid][titleId][0], PlayerTitle[playerid][titleId][1], titleId, databaseId);
        mysql_tquery(sqlHandle, query);
    } else {
        mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_titles` (`user_id`, `titleId`, `status`, `amount`) VALUES (%i, %i, %i, %i)",
        databaseId, titleId, PlayerTitle[playerid][titleId][0], PlayerTitle[playerid][titleId][1]);
        mysql_tquery(sqlHandle, query);
    }
    return 1;
}