
forward onCheckPlayerAccount(playerid);
public onCheckPlayerAccount(playerid)
{
    new rows, sqlquery[256];
    cache_get_row_count(rows);
    if(rows)
    {
        mysql_format(sqlHandle, sqlquery, sizeof(sqlquery), "SELECT `Name` FROM `accbans` WHERE `Name` = '%s'", SpielerInfo[playerid][sName]);
	    mysql_tquery(sqlHandle, sqlquery, "onCheckPlayerBanned", "i", playerid);
    }
    else
    {
        if(strfind(SpielerInfo[playerid][sName], "[", true) != -1)
        {
            SendClientMessage(playerid,COLOR_RED,"[Warnung]: Clan-Tags oder etwaige Klammern sind nicht gedulded.");
            KickPlayer(playerid,"ClanTag-Login");
        }
        else
        {
            new reggstring[500];
            format(reggstring,sizeof(reggstring),"{FFFFFF}Herzlich Willkommen auf "SERV_NAME", {007DFF}/%s{FFFFFF}.\n\
            Das Team und die Community freut sich dass du zu uns gefunden hast. Bevor es richtig losgeht, möchten wir dir uns ein wenig näher bringen.",SpielerInfo[playerid][sName]);
            ShowPlayerDialog(playerid,DIALOG_TUTORIAL,DIALOG_STYLE_MSGBOX,"{007DFF}"SERV_NAME"{FFFFFF} - Herzlich Willkommen! (1/3)",reggstring,"Weiter","");
        }
    }
    return 1;
}