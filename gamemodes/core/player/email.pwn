forward onPlayerStartChangeEmail(playerid);
public onPlayerStartChangeEmail(playerid) {
    new rows;
    cache_get_row_count(rows);
    if(!rows) {
        SendClientMessage(playerid, COLOR_GREY, "Deine Account wurde entweder nicht gefunden oder deine E-Mail wurde bereits verifiziert.");
        SendClientMessage(playerid, COLOR_GREY, "Wenn deine E-Mail bereits verifiziert wurde, kannst du diese ausschließlich im UCP ändern.");
        return 1;
    }
    new string[256];
    cache_get_value_name(0, "EMail", string);

    SetPVarString(playerid, "Email_Change", string);

    format(string, sizeof(string), "{FFFFFF}eine derzeitige E-Mail lautet: {164863}%s{FFFFFF}!\n \
    Falls du bei der Registration eine falsche E-Mail angegeben hast,\n \
    kannst du diese nun wechseln, um dich für das User Control Panel zu verifizieren.", string);

    ShowPlayerDialog(playerid, DIALOG_CHANGE_EMAIL, DIALOG_STYLE_INPUT, "{164863}redv-reallife.de: {FFFFFF}Email ändern", string, "Ändern", "Abbrechen");
    return 1;
}

forward onCheckEmailBlacklist(playerid, const inputtext[]);
public onCheckEmailBlacklist(playerid, const inputtext[]) {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        new oldEmail[65], string[256];
        GetPVarString(playerid, "Email_Change", oldEmail);
        format(string, sizeof(string), "{FFFFFF}eine derzeitige E-Mail lautet: {164863}%s{FFFFFF}!\n \
        Falls du bei der Registration eine falsche E-Mail angegeben hast,\n \
        kannst du diese nun wechseln, um dich für das User Control Panel zu verifizieren.", string);

        ShowPlayerDialog(playerid, DIALOG_CHANGE_EMAIL, DIALOG_STYLE_INPUT, "{164863}redv-reallife.de: {FFFFFF}Email ändern", string, "Ändern", "Abbrechen");

        SendClientMessage(playerid, COLOR_ERRORTEXT, "Dein angegebener E-Mail %s Anbieter befindet sich auf der Blacklist und kann nicht verwendet werden", inputtext);
        SendClientMessage(playerid, COLOR_ERRORTEXT, "Sollte es sich dabei um einen Fehler handeln, melde dich bitte bei der Projektleitung!");
        return 1;
    }

    new query[128];
    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `accounts` SET `EMail` = '%s' WHERE `ID` = %i", inputtext, SpielerInfo[playerid][sDBID]);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, -1, "{164863}INFO: {FFFFFF} Du hast deine E-Mail erfolgreich zu {164863}%s{FFFFFF} geändert", inputtext);
    return 1;
}

PlayerEmail_DialogResponse(playerid, dialogid, response, const inputtext[]) {
    switch(dialogid) {
        case DIALOG_CHANGE_EMAIL: {
            if(!response) return 1;
            new string[256], oldEmail[65];

            if(strlen(inputtext) < 5 || strlen(inputtext) > 20) {
                GetPVarString(playerid, "Email_Change", oldEmail);
                format(string, sizeof(string), "{FFFFFF}eine derzeitige E-Mail lautet: {164863}%s{FFFFFF}!\n \
                Falls du bei der Registration eine falsche E-Mail angegeben hast,\n \
                kannst du diese nun wechseln, um dich für das User Control Panel zu verifizieren.", string);

                ShowPlayerDialog(playerid, DIALOG_CHANGE_EMAIL, DIALOG_STYLE_INPUT, "{164863}redv-reallife.de: {FFFFFF}Email ändern", string, "Ändern", "Abbrechen");

                SendClientMessage(playerid, COLOR_ERRORTEXT, "Deine Eingabe '%s' war fehlerhaft!", inputtext);
                return 1;
            }
            
            new email[65], domain[15];
            if(sscanf(inputtext, "s[65]'@'s[15]'", email, domain)) {
                GetPVarString(playerid, "Email_Change", oldEmail);
                format(string, sizeof(string), "{FFFFFF}eine derzeitige E-Mail lautet: {164863}%s{FFFFFF}!\n \
                Falls du bei der Registration eine falsche E-Mail angegeben hast,\n \
                kannst du diese nun wechseln, um dich für das User Control Panel zu verifizieren.", string);

                ShowPlayerDialog(playerid, DIALOG_CHANGE_EMAIL, DIALOG_STYLE_INPUT, "{164863}redv-reallife.de: {FFFFFF}Email ändern", string, "Ändern", "Abbrechen");

                SendClientMessage(playerid, COLOR_ERRORTEXT, "Deine Eingabe '%s' war fehlerhaft!", inputtext);
                return 1;
            }
            new query[128];
            mysql_format(sqlHandle, query, sizeof(query), "SELECT * FROM `email_blacklist` WHERE `name` = %s", domain);
            mysql_tquery(sqlHandle, query, "onCheckEmailBlacklist", "is", playerid, inputtext);
            return 1;
        }
    }
    return 1;  
}