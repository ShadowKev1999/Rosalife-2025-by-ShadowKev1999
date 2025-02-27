forward onCheckPlayerPassword(playerid, inputtext[]);
public onCheckPlayerPassword(playerid, inputtext[])
{
    new rows;
    cache_get_row_count(rows);
    if(rows)
    {
        new _Password[70];
        cache_get_value_name(0, "Passwort", _Password);

        bcrypt_verify(playerid,"OnPasswordChecked",inputtext, _Password);
    }
    else
    {
        SendClientMessage(playerid, -1, "Dein Spieleraccount ist fehlerhaft, melde dich bei einem Teammitglied");
        KickPlayer(playerid,"");
    }
    return 1;
}