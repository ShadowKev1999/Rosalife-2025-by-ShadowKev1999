stock AmLTM(playerid)
{
 	for(new ltm=0; ltm<sizeof(LTMs); ltm++)
 	{
 		if(IsPlayerInRangeOfPoint(playerid,2.5,LTMs[ltm][0],LTMs[ltm][1],LTMs[ltm][2]))
 		{
 	    	return 1;
		}
	}
	return 0;
}

stock setJackpotScreen()
{
	if(LottoWandJackpot[0]!=0)
	{
	 	DestroyObject(LottoWandJackpot[0]);
	 	DestroyObject(LottoWandJackpot[1]);
	}

	new str[64];
	format(str,sizeof(str),"Jackpot\n%d$",LottoJackpot);

	LottoWandJackpot[0] = CreateDynamicObject(18244, 826.2974, -1.8443, 1005.5643, 90.0, -180.0000, -1.0);
	SetDynamicObjectMaterialText(LottoWandJackpot[0], 0, str, 90, "Arial", 48, 1, -65536, -1, 1);

	LottoWandJackpot[1] = CreateDynamicObject(7901, 648.1074, -1357.6789, 25.5318, 0.0000, 0.0000, -90.1999);
	SetDynamicObjectMaterialText(LottoWandJackpot[1], 0, str, 130, "Arial", 130, 1, 0xFFD78E10, 0x0, 1);
	return 1;
}

stock showlottoschein(playerid)
{
	SetPVarInt(playerid,"Lottoschein",1);
	new tdstring[128];
    format(tdstring, sizeof(tdstring), "Losnummer~n~0%d - 0%d - 0%d~n~~n~Betrag:~t~120$"
	, SpielerInfo[playerid][sLotto][0],SpielerInfo[playerid][sLotto][1],SpielerInfo[playerid][sLotto][2]);
    PlayerTextDrawSetString(playerid, PLottoSchein[playerid], tdstring);
    PlayerTextDrawShow(playerid,PLottoSchein[playerid]);
	TextDrawShowForPlayer(playerid, LottoSchein[0]);
	TextDrawShowForPlayer(playerid, LottoSchein[1]);
	TextDrawShowForPlayer(playerid, LottoSchein[2]);
	TextDrawShowForPlayer(playerid, LottoSchein[3]);
	TextDrawShowForPlayer(playerid, LottoSchein[4]);
	TextDrawShowForPlayer(playerid, LottoSchein[5]);
	TextDrawShowForPlayer(playerid, LottoSchein[6]);
	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF} Du kannst dein Lottoschein mit '/lottoschein' wieder einstecken.");
	return;
}

stock hidelottoschein(playerid)
{
	DeletePVar(playerid,"Lottoschein");
    PlayerTextDrawHide(playerid,PLottoSchein[playerid]);
	TextDrawHideForPlayer(playerid, LottoSchein[0]);
	TextDrawHideForPlayer(playerid, LottoSchein[1]);
	TextDrawHideForPlayer(playerid, LottoSchein[2]);
	TextDrawHideForPlayer(playerid, LottoSchein[3]);
	TextDrawHideForPlayer(playerid, LottoSchein[4]);
	TextDrawHideForPlayer(playerid, LottoSchein[5]);
	TextDrawHideForPlayer(playerid, LottoSchein[6]);
	return;
}

stock buylottoschein(playerid,Lotto0,Lotto1,Lotto2)
{
	if(!AmLTM(playerid))return SendClientMessage(playerid,COLOR_YELLOW,"Du bist nicht an der Lottoscheinausgabe");
    if(GetPlayerMoneyEx(playerid) < 120)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Ein Lottoschein kostet 120$.");
	new diff = SpielerInfo[playerid][sLotto][0] + SpielerInfo[playerid][sLotto][1] + SpielerInfo[playerid][sLotto][2];
    if(diff>0)return SendClientMessage(playerid,COLOR_YELLOW,"Du besitzt bereits einen Lottoschein");
	if(Lotto0==Lotto1)return SendClientMessage(playerid,COLOR_YELLOW,"Du brauchst 3 verschiedene Zahlen");
	else if(Lotto1==Lotto2)return SendClientMessage(playerid,COLOR_YELLOW,"Du brauchst 3 verschiedene Zahlen");
	else if(Lotto2==Lotto0)return SendClientMessage(playerid,COLOR_YELLOW,"Du brauchst 3 verschiedene Zahlen");
	SpielerInfo[playerid][sLotto][0] = Lotto0;SpielerInfo[playerid][sLotto][1] = Lotto1;SpielerInfo[playerid][sLotto][2] = Lotto2;
    LottoJackpot+=120;
	mysql_SetInt("config", "ValueInt",LottoJackpot, "Config", "LottoGewinn");
    GivePlayerMoneyEx(playerid,-120);
    LottoFind=true;
    showlottoschein(playerid);
    setJackpotScreen();
	return 1;
}

forward Lottostart();

public Lottostart()
{
    new Lotto[3];
    Lotto[0] = random(9);
	Lotto1_start:
	Lotto[1] = random(9);
    if(Lotto[0] == Lotto[1])goto Lotto1_start;
	Lotto2_start:
 	Lotto[2]= random(9);
    if(Lotto[0] == Lotto[2])goto Lotto2_start;
    if(Lotto[1] == Lotto[2])goto Lotto2_start;

	new diff,gewinner1, richtige;
    new string[200];
    sendNewsMessage(" ============ Lotto 3/9 ============");
    format(string,200," Die Gewinnnummern: %d, %d, %d",Lotto[0],Lotto[1],Lotto[2]);
    sendNewsMessage(string);
    foreach(new i : Player)
    {
    	diff = SpielerInfo[i][sLotto][0] + SpielerInfo[i][sLotto][1] + SpielerInfo[i][sLotto][2];
		if(diff>0)
		{
		    richtige = 0;
  			format(string,200," Deine Losnummer: %d, %d, %d",SpielerInfo[i][sLotto][0],SpielerInfo[i][sLotto][1],SpielerInfo[i][sLotto][2]);
			SendClientMessage(i,COLOR_NEWS,string);
		    if((SpielerInfo[i][sLotto][0]==Lotto[0])||(SpielerInfo[i][sLotto][1]==Lotto[0])||(SpielerInfo[i][sLotto][2]==Lotto[0]))
		    {
		       richtige++;
      		}
      		if((SpielerInfo[i][sLotto][0]==Lotto[1])||(SpielerInfo[i][sLotto][1]==Lotto[1])||(SpielerInfo[i][sLotto][2]==Lotto[1]))
		    {
		       richtige++;
		    }
      		if((SpielerInfo[i][sLotto][0]==Lotto[2])||(SpielerInfo[i][sLotto][1]==Lotto[2])||(SpielerInfo[i][sLotto][2]==Lotto[2]))
		    {
		       richtige++;
 			}
 			if(richtige==3)
 			{
 				SetPVarInt(i,"Lottogewinn",1);
		        gewinner1++;
 			}
 			else if(richtige==2)
			{
		 		LottoJackpot -= 120;
            	GivePlayerMoneyEx(i,120);
    			SendClientMessage(i,COLOR_NEWS," Herzlichen Glückwunsch du hast 2 richtige und bekommst dein Geld zurück!");
  	 		}
		    SpielerInfo[i][sLotto][0]=0;
		    SpielerInfo[i][sLotto][1]=0;
	     	SpielerInfo[i][sLotto][2]=0;
	     	hidelottoschein(i);
		}
    }
    if(gewinner1==0)
	{
		sendNewsMessage(" Der Lottojackpot wurde nicht geknackt.");
		format(string,200," Der momentane Lottojackpot bleibt bei %d$!",LottoJackpot);
    	sendNewsMessage(string);
    	sendNewsMessage(" ================================");
    	setJackpotScreen();
    	return 1;
	}
	diff = floatround(LottoJackpot / gewinner1, floatround_ceil);
	format(string,200," In dieser Runde gab es %d Gewinner!",gewinner1);
    sendNewsMessage(string);
	format(string,200," Die Gewinner bekommen den betrag von %d$!",diff);
    sendNewsMessage(string);
    foreach(new i : Player)
    {
        if(GetPVarInt(i,"Lottogewinn")==1)
        {
            DeletePVar(i,"Lottogewinn");
            GivePlayerMoneyEx(i,diff);
    		SendClientMessage(i,COLOR_NEWS,"Herzlichen Glückwunsch du hast 3 richtige!");
        }
    }
    sendNewsMessage(" ================================");
    LottoJackpot = 0;
    setJackpotScreen();
	return 1;
}