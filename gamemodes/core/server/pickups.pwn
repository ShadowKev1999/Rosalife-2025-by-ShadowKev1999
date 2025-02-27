ServerPickupInit() {
    mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `server_pickups` \
                            (`id` INT(12) NOT NULL AUTO_INCREMENT , `x` FLOAT NOT NULL , \
                            `y` FLOAT NOT NULL , `z` FLOAT NOT NULL , `model` INT(12) NOT NULL , \
                            `world` INT(12) NOT NULL , `interior` INT(12) NOT NULL , \
                            `type` INT(12) NOT NULL , `text` VARCHAR(256) NOT NULL , \
                            PRIMARY KEY (`id`)) ENGINE = InnoDB;");

    mysql_tquery(sqlHandle, "SELECT * FROM `server_pickups`;", "onLoadServerPickups");
    return 1;
}

forward onLoadServerPickups();
public onLoadServerPickups() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "id", ServerPickups[i][ePickupId]);
            cache_get_value_name_float(i, "x", ServerPickups[i][ePickupX]);
            cache_get_value_name_float(i, "y", ServerPickups[i][ePickupY]);
            cache_get_value_name_float(i, "z", ServerPickups[i][ePickupZ]);
            cache_get_value_name_int(i, "model", ServerPickups[i][ePickupModel]);
            cache_get_value_name_int(i, "world", ServerPickups[i][ePickupWorld]);
            cache_get_value_name_int(i, "interior", ServerPickups[i][ePickupInterior]);
            cache_get_value_name_int(i, "type", ServerPickups[i][ePickupType]);
            cache_get_value_name(i, "text", ServerPickups[i][ePickupText]);

            ServerPickups[i][ePickupObj] = CreateDynamicPickup(ServerPickups[i][ePickupModel], 1, ServerPickups[i][ePickupX], ServerPickups[i][ePickupY], ServerPickups[i][ePickupZ], ServerPickups[i][ePickupWorld], ServerPickups[i][ePickupInterior]);
            ServerPickups[i][ePickupLabel] = CreateDynamic3DTextLabel(ServerPickups[i][ePickupText], 0x008080FF, ServerPickups[i][ePickupX], ServerPickups[i][ePickupY], ServerPickups[i][ePickupZ], 10.0, .worldid = ServerPickups[i][ePickupWorld], .interiorid = ServerPickups[i][ePickupInterior]);

            Iter_Add(IterPickup, i);
        }
    }
    return 1;
}

stock IsPlayerAtPickupByType(playerid, Float:playerrange, pickuptype) {
    foreach(new i : IterPickup) {
        if(ServerPickups[i][ePickupType] == pickuptype) {
            if(!IsPlayerInRangeOfPoint(playerid, playerrange, ServerPickups[i][ePickupX], ServerPickups[i][ePickupY], ServerPickups[i][ePickupZ])) continue;
            return 1;
        }
    }
    return 0;
}