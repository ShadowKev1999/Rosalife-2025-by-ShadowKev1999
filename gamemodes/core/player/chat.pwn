stock SendICPMsg(const message[])
{
	foreach(new i : Player)
	{
	    if(!SpielerInfo[i][icpNachrichten]) continue;
	    SendClientMessage(i,COLOR_ICP,message);
	}
	return 1;
}

stock SendOOCMessage(const message[])
{
	foreach(new i : Player)
	{
	    if(SpielerInfo[i][icpOChat] == 1)
	    {
	        SendSplitMessage(i,COLOR_WHITE,message);
	        //SendClientMessage(i,COLOR_WHITE,message);
	    }
	}
	return 1;
}