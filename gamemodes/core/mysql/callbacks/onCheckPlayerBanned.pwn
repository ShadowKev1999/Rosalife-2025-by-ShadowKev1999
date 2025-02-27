
forward onCheckPlayerBanned(playerid);
public onCheckPlayerBanned(playerid)
{
    new rows, sqlquery[256];
    cache_get_row_count(rows);
    if(rows)
    {
        DeletePVar(playerid,"LoggedIn");
        new bannedgstring[400];
        new Teamler[24];
        format(Teamler,sizeof(Teamler),"%s",mysql_GetString("accbans", "Teammitglied", "Name", SpielerInfo[playerid][sName]));
        new Bgrund[64];
        format(Bgrund,sizeof(Bgrund),"%s",mysql_GetString("accbans", "Bangrund", "Name", SpielerInfo[playerid][sName]));
        new UhrZeit[16];
        format(UhrZeit,sizeof(UhrZeit),"%s",mysql_GetString("accbans", "Uhrzeit", "Name", SpielerInfo[playerid][sName]));
        new DaTum[16];
        format(DaTum,sizeof(DaTum),"%s",mysql_GetString("accbans", "Datum", "Name", SpielerInfo[playerid][sName]));
        format(bannedgstring,sizeof(bannedgstring),"{FFFFFF}Dein Account wurde gesperrt!\nGesperrt von: %s\nGrundangabe: %s\nUhrzeit: %s\nDatum: %s\n\nWenn du glaubst zu Unrecht gebannt wurden zu sein, kannst du mit {007DFF}'F8'{FFFFFF} einen Screenshot\nvon diesem Dialog machen, und dich im Forum melden. Erstelle einen Entbanantrag indem du die Vorlage dort ausfüllst.",Teamler,Bgrund,UhrZeit,DaTum);
        ShowPlayerDialog(playerid,9992,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Benutzerverwaltung",bannedgstring,"Schliessen","");
        KickPlayer(playerid,"");
    }
    else
    {
        mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "SELECT `Name` FROM `timebans` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
		mysql_tquery(sqlHandle, sqlquery, "onCheckPlayerTimebanned", "i", playerid);
    }
    return 1;
}