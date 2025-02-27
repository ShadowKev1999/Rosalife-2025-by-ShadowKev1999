stock SendClubMessage(color, const string[])
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
        if(IsPlayerConnected(i))
        {
            if(SpielerInfo[i][sVIP] >= 1)
            {
                SendClientMessage(i, color, string);
            }
        }
    }
}