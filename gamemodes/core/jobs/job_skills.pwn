LoadPlayerJobSkills(playerid) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_jobskills` WHERE `user_id` = %i", GetPlayerDb(playerid));
    mysql_tquery(sqlHandle, query, "onLoadPlayerJobSkills", "i", playerid);
    return 1;
}

forward onLoadPlayerJobSkills(playerid);
public onLoadPlayerJobSkills(playerid) {
    new rows, tempId;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "jobId", tempId);

            cache_get_value_name_int(i, "level", playerJobSkill[playerid][tempId][0]);
            cache_get_value_name_int(i, "amount", playerJobSkill[playerid][tempId][1]);
        }
    }
    return 1;
}

SavePlayerJobSkills(playerid) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    for(new i = 1; i < MAX_JOBS; i++) {
        SavePlayerJobSkillById(playerid, i);
    }
    return 1;
}

SavePlayerJobSkillById(playerid, jobId) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `player_jobskills` WHERE `user_id` = %i AND `jobId` = %i", GetPlayerDb(playerid), jobId);
    mysql_tquery(sqlHandle, query, "onSavePlayerJobSkillById", "iii", playerid, jobId, GetPlayerDb(playerid));
    return 1;
}

forward onSavePlayerJobSkillById(playerid, jobId, databaseId);
public onSavePlayerJobSkillById(playerid, jobId, databaseId) {
    new rows, query[128];
    cache_get_row_count(rows);
    if(rows) {
        mysql_format(sqlHandle, query, sizeof(query), "UPDATE `player_jobskills` SET `level` = %i, `amount` = %i WHERE `user_id` = %i AND `jobId` = %i",
        playerJobSkill[playerid][jobId][0], playerJobSkill[playerid][jobId][1], databaseId, jobId);
        mysql_tquery(sqlHandle, query);
    } else {
        mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_jobskills` (`user_id`, `jobId`, `level`, `amount`) VALUES (%i, %i, %i, %i)",
        databaseId, jobId, playerJobSkill[playerid][jobId][0], playerJobSkill[playerid][jobId][1]);
        mysql_tquery(sqlHandle, query);
    }
    return 1;
} 

GivePlayerJobSkill(playerid, jobId, amount = 1) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    playerJobSkill[playerid][jobId][1] += amount;

    switch(jobId) {
        case 18: {
            if(playerJobSkill[playerid][jobId][0] >= MAX_FISHING_JOB_SKILL_LEVEL) return 1;
            new getLevel = playerJobSkill[playerid][jobId][0];
            SendClientMessage(playerid, -1, "{99CC00}JOB-SKILL: {FFFFFF}Du hast %i EXP für den Beruf 'Hochseefischer' erhalten. (Nächstes Level %i/%i Exp)", amount, playerJobSkill[playerid][jobId][1], fishingSkillExp[getLevel]);
            if(playerJobSkill[playerid][jobId][1] >= fishingSkillExp[getLevel]) {
                playerJobSkill[playerid][jobId][0] ++;
                playerJobSkill[playerid][jobId][1] -= fishingSkillExp[getLevel];

                SendClientMessage(playerid, -1, "{99CC00}JOB-SKILL: {FFFFFF}Dein Skill-Level für den Beruf 'Hochseefischer' ist gestiegen. (Level %i)", playerJobSkill[playerid][jobId][0]);
            }
        }
    }
    SavePlayerJobSkillById(playerid, jobId);
    return 1;
}

GetPlayerJobSkill(playerid, jobId) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    return playerJobSkill[playerid][jobId][0];
}