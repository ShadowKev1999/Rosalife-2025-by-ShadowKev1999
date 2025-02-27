forward onCheckPlayerVip(playerid);
public onCheckPlayerVip(playerid)
{
    new rows, sqlquery[256];
    cache_get_row_count(rows);
    if(rows)
    {
        new vip = mysql_GetInt("vip", "serv_Data", "Name", SpielerInfo[playerid][sName]);
        if(gettime() >= vip)
        {
            mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "DELETE FROM `vip` WHERE `Name` = '%s' ", SpielerInfo[playerid][sName]);
            mysql_tquery(sqlHandle, sqlquery);
        }
    }
    new logingstring[340];
    format(logingstring,sizeof(logingstring),"{FFFFFF}Willkommen zurück auf "SERV_NAME" {007DFF}%s{FFFFFF}.\nIn unserer Datenbank wurde dein Account gefunden. Bitte logge dich ein indem du das Passwort\neingibst was du bei deiner Registration gewählt hattest. Bei Fragen wende dich an unser Team.",SpielerInfo[playerid][sName]);
    ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"{007DFF}"SERV_NAME"{FFFFFF} - Einloggen",logingstring,"Weiter","");
    return 1;
}