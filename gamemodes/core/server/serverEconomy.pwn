ServerEconomy_Init() {
    mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `server_economy` (`economyId` INT(12) NOT NULL , \
                            `value` INT(12) NOT NULL , `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , \
                            PRIMARY KEY (`economyId`)) ENGINE = InnoDB;");

    mysql_tquery(sqlHandle, "SELECT * FROM `server_economy`;", "onLoadServerEconomy");
    return 1;
}

stock UpdateEconomyValue(economyValue, addingValue) {
    new query[256];
    switch(economyValue) {
        case ECONOMY_TYPE_WOOD: {
            EconomyInfo[eWood] += addingValue;
            mysql_format(sqlHandle, query, sizeof(query), "UPDATE `server_economy` SET `value` = %i, `updated_at` = current_timestamp() WHERE economyId = %i", EconomyInfo[eWood], economyValue);
        }
    }
    mysql_tquery(sqlHandle, query);
    return 1;
}

stock GetEconomyValue(economyValue) {
    switch(economyValue) {
        case ECONOMY_TYPE_WOOD: return EconomyInfo[eWood];
    }
    return 0;
}

forward onLoadServerEconomy();
public onLoadServerEconomy() {
    new rows, tempId, tempValue;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "economyId", tempId);
            cache_get_value_name_int(i, "value", tempValue);

            switch(tempId) {
                case ECONOMY_TYPE_WOOD: EconomyInfo[eWood] += tempValue;
            }
        }
    }
    return 1;
}