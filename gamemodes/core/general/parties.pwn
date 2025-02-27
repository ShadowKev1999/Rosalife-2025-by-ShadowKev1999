OnPartieInit() {

    mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `parties` ( \
	  `id` INT(11) NOT NULL, \
      `name` VARCHAR(32) NOT NULL, \
	  `memberlimit` INT(11) NOT NULL, \
	  `vehiclelimit` INT(11) NOT NULL, \
      `founder` VARCHAR(24) NOT NULL, \
      `upgrades` VARCHAR(24) NOT NULL, \
      `rankName1` VARCHAR(24) NOT NULL, \
      `rankName2` VARCHAR(24) NOT NULL, \
      `rankName3` VARCHAR(24) NOT NULL, \
      `centralconfirmed` INT(11) NOT NULL, \
      `centralpos` VARCHAR(24) NOT NULL, \
	  PRIMARY KEY  (`id`) \
	) ENGINE=MyISAM DEFAULT CHARSET=utf8;");

    mysql_tquery(sqlHandle, "SELECT * FROM `parties`;", "onLoadServerParties");
    return 1;
}

DestroyParteyVars(playerid) {
    DeletePVar(playerid, "PARTIE_PLAYER");
    DeletePVar(playerid, "PARTIE_TIMESTAMP");
    return 1;
}

forward onLoadServerParties();
public onLoadServerParties() {
    new rows, _id, helperVar[256];
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "id", _id);

            cache_get_value_name(i, "name", PartieData[_id][partieName]);
            cache_get_value_name_int(i, "memberlimit", PartieData[_id][partieMemberLimit]);
            cache_get_value_name_int(i, "vehiclelimit", PartieData[_id][partieVehicleLimit]);

            cache_get_value_name(i, "founder", helperVar);
            if(helperVar[0] != '|' && helperVar[1] != EOS) {
			    sscanf(helperVar,"p<|>dd", PartieData[_id][partieFounder][0], PartieData[_id][partieFounder][1]);
            }

            cache_get_value_name(i, "upgrades", helperVar);
            if(helperVar[0] != '|' && helperVar[1] != EOS) {
			    sscanf(helperVar,"p<|>dddd", PartieData[_id][partieUpgrades][0], PartieData[_id][partieUpgrades][1], PartieData[_id][partieUpgrades][2], PartieData[_id][partieUpgrades][3]);
            }

            for(new r = 0; r < 3; r++) {
                format(helperVar, sizeof(helperVar), "rankName%i", r+1);
                cache_get_value_name(i, helperVar, PartieRank[_id][r]);
            }

            cache_get_value_name_int(i, "centralconfirmed", PartieData[_id][partieCentralConfirmed]);

            cache_get_value_name(i, "centralpos", helperVar);
            if(helperVar[0] != '|' && helperVar[1] != EOS) {
			    sscanf(helperVar,"p<|>ffff", PartieData[_id][partieCentral][0], PartieData[_id][partieCentral][1], PartieData[_id][partieCentral][2], PartieData[_id][partieCentral][3]);
            }

            Iter_Add(IterParties, _id);
        }
    }
    return 1;
}

Partie_DialogResponse(playerid, dialogid, response, listitem) {
    switch(dialogid) {
        case DIALOG_CREATE_PARTIE: {
            if(!response) return 1;
            if(GetPlayerMoneyEx(playerid) < PARTIE_COSTS) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Du hast nicht genügend Geld bei dir!");
            if(GetPlayerScore(playerid) < PARTIE_CREATE_MIN_LEVEL) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Eine Partei kann erst ab Level "#PARTIE_CREATE_MIN_LEVEL" gegründet werden");

            new Float:_temp[3], counter = 0, string[512];
            GetPlayerPos(playerid, _temp[0], _temp[1], _temp[2]);
            strcat(string, "ID\tName\n");
            foreach(new i : Player) {
                if(GetPlayerVirtualWorld(i) != GetPlayerVirtualWorld(playerid)) continue;
                if(GetPlayerInterior(i) != GetPlayerInterior(playerid)) continue;
                if(!IsPlayerInRangeOfPoint(i, 5.0, _temp[0], _temp[1], _temp[2])) continue;
                if(i >= 5) break;

                format(string, sizeof(string), "%s\n%i\t%s", string, i, GetName(i));

                PartiePlayerSel[playerid][counter] = i;
                counter++;
            }
            if(!counter) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es befindet sich kein Spieler in deiner Nähe!");
            ShowPlayerDialog(playerid, DIALOG_CREATE_PARTIE_PLAYER, DIALOG_STYLE_TABLIST_HEADERS, "{CC33FF}redv-reallife.de: {FFFFFF}Partei erstellen", string, "Auswählen", "Abbrechen");
            return 1;
        }

        case DIALOG_CREATE_PARTIE_PLAYER: {
            if(!response) return 1;
            new pID = PartiePlayerSel[playerid][listitem], Float:_temp[3];
            GetPlayerPos(playerid, _temp[0], _temp[1], _temp[2]);
            if(!IsPlayerConnectedEx(pID)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der ausgewählte Spieler ist nicht Online.");
            if(!IsPlayerInRangeOfPoint(pID, 5.0, _temp[0], _temp[1], _temp[2])) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Spieler ist nicht mehr in deiner Nähe.");

            SetPVarInt(playerid, "PARTIE_TIMESTAMP", gettime() + (3 * 60));
            SetPVarInt(pID, "PARTIE_TIMESTAMP", gettime() + (3 * 60));

            SetPVarInt(playerid, "PARTIE_PLAYER", pID);
            SetPVarInt(pID, "PARTIE_PLAYER", playerid);

            SendClientMessage(playerid, -1, "{CC33FF}PARTEI: {FFFFFF}Du hast eine Anfrage an %s versendet. Warte auf seine Antwort!", GetName(pID));

            new string[256];
            format(string, sizeof(string), "%s möchte eine Partei mit dir gründen. Möchtest du eine Partei gründen?", GetName(playerid));
            ShowPlayerDialog(pID, DIALOG_CREATE_PARTIE_ASK_PLAYER, DIALOG_STYLE_MSGBOX, "{CC33FF}redv-reallife.de: {FFFFFF}Partei erstellen", string, "Bestätigen", "Abbrechen");
            return 1;
        }
        case DIALOG_CREATE_PARTIE_ASK_PLAYER: {
            if(!response) {
                new pID = GetPVarInt(playerid, "PARTIE_PLAYER");
                DeletePVar(playerid, "PARTIE_PLAYER");
                DeletePVar(playerid, "PARTIE_TIMESTAMP");

                if(IsPlayerConnectedEx(pID)) {
                    SendClientMessage(pID, COLOR_ERRORTEXT, "{CC33FF}PARTEI: {FFFFFF}%s hat deine Anfrage abgelehnt.", GetName(playerid));
                    DeletePVar(pID, "PARTIE_PLAYER");
                    DeletePVar(pID, "PARTIE_TIMESTAMP");
                }
                return 1;
            } else {
                new pID = GetPVarInt(playerid, "PARTIE_PLAYER");
                DeletePVar(playerid, "PARTIE_PLAYER");
                DeletePVar(playerid, "PARTIE_TIMESTAMP");
                if(IsPlayerConnectedEx(pID)) {
                    DeletePVar(pID, "PARTIE_PLAYER");
                    DeletePVar(pID, "PARTIE_TIMESTAMP");

                    if(!createPartey(playerid, pID)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es können keine weiteren Parteien gegründet werden!");

                } else {
                    SendClientMessage(playerid, COLOR_ERRORTEXT, "Der Spieler ist nicht mehr Online!");
                }
            }
            return 1;
        }
    }
    return 1;
}

createPartey(playerid, pID) {
    new id = Iter_Free(IterParties);
    if(id == -1) return 0;
    if(!IsPlayerConnectedEx(pID)) return 0;
    if(!IsPlayerConnectedEx(playerid)) return 0;

    Iter_Add(IterParties, id);

    format(PartieData[id][partieName], 32, "Partei%i", id);
    PartieData[id][partieFounder][0] = SpielerInfo[playerid][sDBID];
    PartieData[id][partieFounder][1] = SpielerInfo[pID][sDBID];
    PartieData[id][partieMemberLimit] = 0;
    PartieData[id][partieVehicleLimit] = 0;
    for(new i = 0; i < 4; i++) PartieData[id][partieUpgrades][i] = 0;

    for(new i = 0; i < 3; i++) {
        format(PartieRank[id][i], 16, "Rang%i", i+1);
    }

    PartieData[id][partieCentralConfirmed] = 0;

    for(new i = 0; i < 4; i++) PartieData[id][partieCentral][i] = 0.000;

    new query[512], string[128];
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `parties` (`id`, `name`, `memberlimit`, `vehiclelimit`, `founder`, `upgrades`, `rankName1`, `rankName2`, `rankName3`, `centralconfirmed`, `centralpos`) \
                                                    VALUES (%i, 'Partei%i', %i, %i, '%i|%i', '|', 'Rang1', 'Rang2', 'Rang3', 0, '|');",
                                                    id, id, PARTIE_DEFAULT_MEMBER, PARTIE_DEFAULT_VEHICLE, SpielerInfo[playerid][sDBID], SpielerInfo[pID][sDBID]);
    mysql_tquery(sqlHandle, query);

    format(string, sizeof(string), "{CC33FF}PARTEI: {FFFFFF}Heureka! Es wurde eine neue Partei von %s und %s gegründet!", GetName(pID), GetName(playerid));
    ProxDetector(10.0, pID, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
    SendClientMessage(playerid, -1, "{CC33FF}PARTEI: {FFFFFF}Du kannst deine Partei mit /parteiverwaltung verwalten.");
    SendClientMessage(pID, -1, "{CC33FF}PARTEI: {FFFFFF}Du kannst deine Partei mit /parteiverwaltung verwalten.");
    GivePlayerMoneyEx(playerid, -PARTIE_COSTS);
    return 1;
}