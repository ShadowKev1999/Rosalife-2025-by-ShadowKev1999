stock mysql_CheckBeta(playerid)
{
    new Name[MAX_PLAYER_NAME];
  	GetPlayerName(playerid, Name, MAX_PLAYER_NAME);
    if(strcmp(mysql_GetString("beta", "Aktiviert", "Name", Name), "regist") == 0)
	{
	    return false;
	}
	return true;
}