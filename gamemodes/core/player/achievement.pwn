stock ShowPlayerAchievement(playerid)
{
	for(new id = 0; id < 6; id++)
    {
    	PlayerTextDrawShow(playerid, AchievementDraw[playerid][id]);
	}
	return 1;
}

stock HideAchievement(playerid)
{
	for(new id = 0; id < 6; id++)
    {
    	PlayerTextDrawHide(playerid, AchievementDraw[playerid][id]);
	}
	return 1;
}


stock GiveTagesBelohnung(playerid)
{
	SpielerInfo[playerid][sLastTagesbelohnung] = gettime() + 86400;
	switch(SpielerInfo[playerid][sTagesbelohnung])
	{
	    case 0:
	    {
	        SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 1]: Du hast +2.500$ erhalten!");
	        GivePlayerMoneyEx(playerid,2500);
	        SpielerInfo[playerid][sTagesbelohnung] = 1;
	        return 1;
	    }
	    case 1:
	    {
	        SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 2]: Du hast ein gratis Ersthilfe-Paket erhalten! Verwende es in der Not mit \"/erstehilfe\".");
	        SpielerInfo[playerid][sPaket] = 1;
	        SpielerInfo[playerid][sTagesbelohnung] = 2;
	        return 1;
	    }
	    case 2:
	    {
			SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 3]: Du hast +250 EXP erhalten!");
			GivePlayerEXP(playerid,250);
			SpielerInfo[playerid][sTagesbelohnung] = 3;
			return 1;
	    }
	    case 3:
	    {
            SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 4]: Du hast +25 Minuten auf deinen Payday erhalten!");
            SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 4]: Falls deine Payday-Minuten nun über 45 sind, warte bitte eine Minute.");
			SpielerInfo[playerid][sPayDay] += 25;
			SpielerInfo[playerid][sTagesbelohnung] = 4;
			return 1;
	    }
	    case 4:
	    {
			SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 5]: Du hast +5.000$ erhalten!");
			GivePlayerMoneyEx(playerid,5000);
			SpielerInfo[playerid][sTagesbelohnung] = 5;
			return 1;
	    }
	    case 5:
	    {
			SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 6]: Du hast +75 Pfandflaschen und einen Beutel erhalten!");
			SpielerInfo[playerid][sPfandflaschen] += 75;
			SpielerInfo[playerid][sBeutel] += 1;
			SpielerInfo[playerid][sTagesbelohnung] = 6;
			return 1;
	    }
	    case 6:
	    {
	        if(SpielerInfo[playerid][sVIP] < 1)
	        {
	            SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 7]: Du genießt jetzt für 24 Stunden alle InGame-Vorteile des VIP-Status!");
	            GiveVIP(SpielerInfo[playerid][sName],1,"Tagesbelohnung");
	            SpielerInfo[playerid][sVIP] = 1;
		        if(SpielerInfo[playerid][sAchivVIP] < 1)
		        {
		            SpielerInfo[playerid][sAchivVIP] = 1;
					ShowAchievement(playerid,"Werde VIP Mitglied","+ 2250 EXP");
					GivePlayerEXP(playerid,2250);
		        }
			}
			else
			{
                SendClientMessage(playerid,COLOR_INFO,"[Tagesbelohnung - Tag 7]: Du erhälst statte 350 EXP und 2.500$!");
                GivePlayerEXP(playerid,350);
                GivePlayerMoneyEx(playerid,2500);
			}
	        SpielerInfo[playerid][sTagesbelohnung] = 0;
            return 1;
	    }
	}
	return 1;
}