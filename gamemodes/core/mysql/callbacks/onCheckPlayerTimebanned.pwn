
forward onCheckPlayerTimebanned(playerid);
public onCheckPlayerTimebanned(playerid)
{
    new rows, sqlquery[256];
    cache_get_row_count(rows);
    if(rows)
    {
        DeletePVar(playerid,"LoggedIn");
        new unban = mysql_GetInt("timebans", "serv_Data", "Name", SpielerInfo[playerid][sName]);
        if(gettime() < unban)
        {
            new differenz = unban - gettime();
            new minuten = differenz / 60;
            new bannedgstring[370];
            new Teamler[24];
            format(Teamler,sizeof(Teamler),"%s",mysql_GetString("timebans", "Teammitglied", "Name", SpielerInfo[playerid][sName]));
            new Bgrund[64];
            format(Bgrund,sizeof(Bgrund),"%s",mysql_GetString("timebans", "Bangrund", "Name", SpielerInfo[playerid][sName]));
            new UhrZeit[16];
            format(UhrZeit,sizeof(UhrZeit),"%s",mysql_GetString("timebans", "Uhrzeit", "Name", SpielerInfo[playerid][sName]));
            new DaTum[16];
            format(DaTum,sizeof(DaTum),"%s",mysql_GetString("timebans", "Datum", "Name", SpielerInfo[playerid][sName]));
            format(bannedgstring,sizeof(bannedgstring),"{FFFFFF}Dein Account wurde auf Zeit gesperrt!\nGesperrt von: %s\nGrundangabe: %s\nUhrzeit: %s \nDatum: %s\nNoch gebannt: %i Minuten\n\nWenn du glaubst zu Unrecht gebannt wurden zu sein, kannst du mit {007DFF}'F8'{FFFFFF} einen Screenshot\nvon diesem Dialog machen, und dich im Forum melden. Erstelle einen Entbanantrag indem du die Vorlage dort ausfüllst.",Teamler,Bgrund,UhrZeit,DaTum,minuten);
            ShowPlayerDialog(playerid,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Benutzerverwaltung",bannedgstring,"Schliessen","");
            KickPlayer(playerid,"");
            return 1;
        }
        else
        {
            mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "DELETE FROM `timebans` WHERE `Name` = '%s' ", SpielerInfo[playerid][sName]);
            mysql_tquery(sqlHandle, sqlquery);

            new logingstring[340];
            format(logingstring,sizeof(logingstring),"{FFFFFF}Willkommen zurück auf "SERV_NAME" {007DFF}%s{FFFFFF}.\nIn unserer Datenbank wurde dein Account gefunden. Bitte logge dich ein indem du das Passwort\neingibst was du bei deiner Registration gewählt hattest. Bei Fragen wende dich an unser Team.",SpielerInfo[playerid][sName]);
            ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"{007DFF}"SERV_NAME"{FFFFFF} - Einloggen",logingstring,"Weiter","");
        }
    }
    mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "SELECT `Name` FROM `vip` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
    mysql_tquery(sqlHandle, sqlquery, "onCheckPlayerVip", "i", playerid);
    return 1;
}