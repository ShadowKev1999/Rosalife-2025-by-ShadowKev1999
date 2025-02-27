
Race_Init() {
    CreateRaceTable();
    mysql_tquery(sqlHandle, "SELECT * FROM races","onLoadRaces");

    RaceStarted = -1;
    return 1;
}

CreateRaceTable() {
    new query[4000];
    strcat(query,"CREATE TABLE IF NOT EXISTS `races` (`race` varchar(32) NOT NULL,`X1` float(10,4) NOT NULL,`Y1` float(10,4) NOT NULL,`Z1` float(10,4) NOT NULL,`X2` float(10,4) NOT NULL,`Y2` float(10,4) NOT NULL,`Z2` float(10,4) NOT NULL,`X3` float(10,4) NOT NULL,`Y3` float(10,4) NOT NULL,`Z3` float(10,4) NOT NULL,`X4` float(10,4) NOT NULL,`Y4` float(10,4) NOT NULL,`Z4` float(10,4) NOT NULL,`X5` float(10,4) NOT NULL,`Y5` float(10,4) NOT NULL,`Z5` float(10,4) NOT NULL,");
	strcat(query,"`X6` float(10,4) NOT NULL,`Y6` float(10,4) NOT NULL,`Z6` float(10,4) NOT NULL,`X7` float(10,4) NOT NULL,`Y7` float(10,4) NOT NULL,`Z7` float(10,4) NOT NULL,`X8` float(10,4) NOT NULL,`Y8` float(10,4) NOT NULL,`Z8` float(10,4) NOT NULL,`X9` float(10,4) NOT NULL,`Y9` float(10,4) NOT NULL,`Z9` float(10,4) NOT NULL,`X10` float(10,4) NOT NULL,`Y10` float(10,4) NOT NULL,`Z10` float(10,4) NOT NULL,`X11` float(10,4) NOT NULL,`Y11` float(10,4) NOT NULL,`Z11` float(10,4) NOT NULL,");
	strcat(query,"`X12` float(10,4) NOT NULL,`Y12` float(10,4) NOT NULL,`Z12` float(10,4) NOT NULL,`X13` float(10,4) NOT NULL,`Y13` float(10,4) NOT NULL,`Z13` float(10,4) NOT NULL,`X14` float(10,4) NOT NULL,`Y14` float(10,4) NOT NULL,`Z14` float(10,4) NOT NULL,`X15` float(10,4) NOT NULL,`Y15` float(10,4) NOT NULL,`Z15` float(10,4) NOT NULL,`X16` float(10,4) NOT NULL,`Y16` float(10,4) NOT NULL,`Z16` float(10,4) NOT NULL,`X17` float(10,4) NOT NULL,`Y17` float(10,4) NOT NULL,`Z17` float(10,4) NOT NULL,");
	strcat(query,"`X18` float(10,4) NOT NULL,`Y18` float(10,4) NOT NULL,`Z18` float(10,4) NOT NULL,`X19` float(10,4) NOT NULL,`Y19` float(10,4) NOT NULL,`Z19` float(10,4) NOT NULL,`X20` float(10,4) NOT NULL,`Y20` float(10,4) NOT NULL,`Z20` float(10,4) NOT NULL,`X21` float(10,4) NOT NULL,`Y21` float(10,4) NOT NULL,`Z21` float(10,4) NOT NULL,`X22` float(10,4) NOT NULL,`Y22` float(10,4) NOT NULL,`Z22` float(10,4) NOT NULL,`X23` float(10,4) NOT NULL,`Y23` float(10,4) NOT NULL,`Z23` float(10,4) NOT NULL,");
	strcat(query,"`X24` float(10,4) NOT NULL,`Y24` float(10,4) NOT NULL,`Z24` float(10,4) NOT NULL,`X25` float(10,4) NOT NULL,`Y25` float(10,4) NOT NULL,`Z25` float(10,4) NOT NULL,`X26` float(10,4) NOT NULL,`Y26` float(10,4) NOT NULL,`Z26` float(10,4) NOT NULL,`X27` float(10,4) NOT NULL,`Y27` float(10,4) NOT NULL,`Z27` float(10,4) NOT NULL,`X28` float(10,4) NOT NULL,`Y28` float(10,4) NOT NULL,`Z28` float(10,4) NOT NULL,`X29` float(10,4) NOT NULL,`Y29` float(10,4) NOT NULL,`Z29` float(10,4) NOT NULL,");
    strcat(query,"`X30` float(10,4) NOT NULL,`Y30` float(10,4) NOT NULL,`Z30` float(10,4) NOT NULL,`X31` float(10,4) NOT NULL,`Y31` float(10,4) NOT NULL,`Z31` float(10,4) NOT NULL,`X32` float(10,4) NOT NULL,`Y32` float(10,4) NOT NULL,`Z32` float(10,4) NOT NULL,`X33` float(10,4) NOT NULL,`Y33` float(10,4) NOT NULL,`Z33` float(10,4) NOT NULL,`X34` float(10,4) NOT NULL,`Y34` float(10,4) NOT NULL,`Z34` float(10,4) NOT NULL,`X35` float(10,4) NOT NULL,`Y35` float(10,4) NOT NULL,`Z35` float(10,4) NOT NULL,");
	strcat(query,"PRIMARY KEY (`race`))");
	mysql_tquery(sqlHandle, query);
    return 1;
}

forward onLoadRaces();
public onLoadRaces() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new r = 0; r < rows; r++) {
            cache_get_value_name(r,"race", RaceName[r]);
            
            for(new rcp=1;rcp<MAX_RACECPS;rcp++) {
                new savestring[3];
                format(savestring,sizeof(savestring),"X%i",rcp);
                cache_get_value_name_float(r,savestring, RaceInfo[r][rcp-1][0]);
                format(savestring,sizeof(savestring),"Y%i",rcp);
                cache_get_value_name_float(r,savestring, RaceInfo[r][rcp-1][1]);
                format(savestring,sizeof(savestring),"Z%i",rcp);
                cache_get_value_name_float(r,savestring, RaceInfo[r][rcp-1][2]);
                if(RaceInfo[r][rcp-1][0] != 0.0 && RaceInfo[r][rcp-1][1] != 0.0 && RaceInfo[r][rcp-1][2] != 0.0) {
                    RaceInfoUsed[r][rcp-1] = 1;
                }
            }
            RaceCreated[r] = 1;
        }
    }
    return 1;
}

SaveRaces() {
    new mainquery[2000],
		r = 0;
    while(r<MAX_RACES && RaceCreated[r] == 1)
	{
	    format(mainquery,sizeof(mainquery),"UPDATE races SET X1='%f',Y1='%f',Z1='%f',X2='%f',Y2='%f',Z2='%f',X3='%f',Y3='%f',Z3='%f',X4='%f',Y4='%f',Z4='%f',X5='%f',Y5='%f',Z5='%f',X6='%f',Y6='%f',Z6='%f',X7='%f',Y7='%f',Z7='%f',X8='%f',Y8='%f',Z8='%f',X9='%f',Y9='%f',Z9='%f',X10='%f',Y10='%f',Z10='%f',X11='%f',Y11='%f',Z11='%f',X12='%f',Y12='%f',Z12='%f' WHERE race='%s'",
		RaceInfo[r][0][0],RaceInfo[r][0][1],RaceInfo[r][0][2],RaceInfo[r][1][0],RaceInfo[r][1][1],RaceInfo[r][1][2],RaceInfo[r][2][0],RaceInfo[r][2][1],RaceInfo[r][2][2],RaceInfo[r][3][0],RaceInfo[r][3][1],RaceInfo[r][3][2],RaceInfo[r][4][0],RaceInfo[r][4][1],RaceInfo[r][4][2],
		RaceInfo[r][5][0],RaceInfo[r][5][1],RaceInfo[r][5][2],RaceInfo[r][6][0],RaceInfo[r][6][1],RaceInfo[r][6][2],RaceInfo[r][7][0],RaceInfo[r][7][1],RaceInfo[r][7][2],RaceInfo[r][8][0],RaceInfo[r][8][1],RaceInfo[r][8][2],RaceInfo[r][9][0],RaceInfo[r][9][1],RaceInfo[r][9][2],
		RaceInfo[r][10][0],RaceInfo[r][10][1],RaceInfo[r][10][2],RaceInfo[r][11][0],RaceInfo[r][11][1],RaceInfo[r][11][2],RaceName[r]);
		mysql_tquery(sqlHandle,mainquery);
		strdel(mainquery,0,sizeof(mainquery));
		format(mainquery,sizeof(mainquery),"UPDATE races SET X13='%f',Y13='%f',Z13='%f',X14='%f',Y14='%f',Z14='%f',X15='%f',Y15='%f',Z15='%f',X16='%f',Y16='%f',Z16='%f',X17='%f',Y17='%f',Z17='%f',X18='%f',Y18='%f',Z18='%f',X19='%f',Y19='%f',Z19='%f',X20='%f',Y20='%f',Z20='%f',X21='%f',Y21='%f',Z21='%f',X22='%f',Y22='%f',Z22='%f',X23='%f',Y23='%f',Z23='%f' WHERE race='%s'",
		RaceInfo[r][12][0],RaceInfo[r][12][1],RaceInfo[r][12][2],RaceInfo[r][13][0],RaceInfo[r][13][1],RaceInfo[r][13][2],RaceInfo[r][14][0],RaceInfo[r][14][1],RaceInfo[r][14][2],RaceInfo[r][15][0],RaceInfo[r][15][1],RaceInfo[r][15][2],RaceInfo[r][16][0],RaceInfo[r][16][1],RaceInfo[r][16][2],
		RaceInfo[r][17][0],RaceInfo[r][17][1],RaceInfo[r][17][2],RaceInfo[r][18][0],RaceInfo[r][18][1],RaceInfo[r][18][2],RaceInfo[r][19][0],RaceInfo[r][19][1],RaceInfo[r][19][2],RaceInfo[r][20][0],RaceInfo[r][20][1],RaceInfo[r][20][2],RaceInfo[r][21][0],RaceInfo[r][21][1],RaceInfo[r][21][2],
		RaceInfo[r][22][0],RaceInfo[r][22][1],RaceInfo[r][22][2],RaceName[r]);
	    mysql_tquery(sqlHandle,mainquery);
		strdel(mainquery,0,sizeof(mainquery));
		format(mainquery,sizeof(mainquery),"UPDATE races SET X24='%f',Y24='%f',Z24='%f',X25='%f',Y25='%f',Z25='%f',X26='%f',Y26='%f',Z26='%f',X27='%f',Y27='%f',Z27='%f',X28='%f',Y28='%f',Z28='%f',X29='%f',Y29='%f',Z29='%f',X30='%f',Y30='%f',Z30='%f',X31='%f',Y31='%f',Z31='%f',X32='%f',Y32='%f',Z32='%f',X33='%f',Y33='%f',Z33='%f',X34='%f',Y34='%f',Z34='%f',X35='%f',Y35='%f',Z35='%f' WHERE race='%s'",
		RaceInfo[r][23][0],RaceInfo[r][23][1],RaceInfo[r][23][2],RaceInfo[r][24][0],RaceInfo[r][24][1],RaceInfo[r][24][2],RaceInfo[r][25][0],RaceInfo[r][25][1],RaceInfo[r][25][2],RaceInfo[r][26][0],RaceInfo[r][26][1],RaceInfo[r][26][2],RaceInfo[r][27][0],RaceInfo[r][27][1],RaceInfo[r][27][2],
		RaceInfo[r][28][0],RaceInfo[r][28][1],RaceInfo[r][28][2],RaceInfo[r][29][0],RaceInfo[r][29][1],RaceInfo[r][29][2],RaceInfo[r][30][0],RaceInfo[r][30][1],RaceInfo[r][30][2],RaceInfo[r][31][0],RaceInfo[r][31][1],RaceInfo[r][31][2],RaceInfo[r][32][0],RaceInfo[r][32][1],RaceInfo[r][32][2],
		RaceInfo[r][33][0],RaceInfo[r][33][1],RaceInfo[r][33][2],RaceInfo[r][34][0],RaceInfo[r][34][1],RaceInfo[r][34][2],RaceName[r]);
	    mysql_tquery(sqlHandle,mainquery);
		strdel(mainquery,0,sizeof(mainquery));
		r++;
	}
    return 1;
}

Race_PlayerDeath(playerid) {
    if(InviteInRace[playerid] == 1) {
		RaceCps[playerid] = 0;
		for(new t=0;t<6;t++){ PlayerTextDrawHide(playerid,RACEdraw[playerid][t]); }
        new string[128];
		foreach(new i : Player)
		{
			if(IsPlayerConnected(i) && !IsPlayerNPC(i))
			{
				if(InviteInRace[i] == 1)
				{
					format(string,sizeof(string),"[RACE-INFO]: %s hat das Rennen verlassen! [Grund: Gestorben]", GetName(playerid));
					SendClientMessage(i, COLOR_WHITE, string);
				}
			}
		}
		InviteInRace[playerid] = 0;
	}
    return 1;
}

Race_PlayerEnterRaceCheckpoint(playerid) {
    if(InviteInRace[playerid] == 1) {
	    new r = RaceStarted, string[128];
	 	DisablePlayerRaceCheckpoint(playerid);
	    PlayerPlaySound(playerid,1058,0.0,0.0,0.0);
	   	RaceCps[playerid]++;
	   	if(RaceCps[playerid] < MAX_RACECPS)
	   	{
		    if(RaceCps[playerid] == RaceMaxCps-1)//zielcp
		    {
		    	SetPlayerRaceCheckpoint(playerid,CP_TYPE:1,RaceInfo[r][RaceCps[playerid]][0],RaceInfo[r][RaceCps[playerid]][1],RaceInfo[r][RaceCps[playerid]][2],0.0,0.0,0.0,10.0);
		    }
		    else
		    {
		    	SetPlayerRaceCheckpoint(playerid,CP_TYPE:0,RaceInfo[r][RaceCps[playerid]][0],RaceInfo[r][RaceCps[playerid]][1],RaceInfo[r][RaceCps[playerid]][2],RaceInfo[r][RaceCps[playerid]+1][0],RaceInfo[r][RaceCps[playerid]+1][1],RaceInfo[r][RaceCps[playerid]+1][2],8.0);
			}
		}
	 	format(string,sizeof(string),"%i/%i ~y~Cps",RaceCps[playerid],RaceMaxCps);
		PlayerTextDrawSetString(playerid,RACEdraw[playerid][2],string);

		new firstracer,secondracer,thirdracer,
			firstracerid,secondracerid,thirdracerid;

		foreach(new i : Player)
		{
			if(IsPlayerConnected(i) && !IsPlayerNPC(i))
			{
				if(InviteInRace[i] == 1)
				{
					if(firstracer<RaceCps[i])
					{
						firstracer = RaceCps[i];
						firstracerid = i;
					}
					if(secondracer<RaceCps[firstracerid] && (i != firstracerid))
					{
						secondracer = RaceCps[i];
						secondracerid = i;
					}
					if(thirdracer<RaceCps[secondracerid] && (i != secondracerid))
					{
					    thirdracer = RaceCps[i];
					    thirdracerid = i;
					}
				}
			}
		}
		if(firstracerid != 0)
		{
			format(string,sizeof(string),"1.~r~%s",GetName(firstracerid));
			PlayerTextDrawSetString(playerid,RACEdraw[playerid][3],string);
		}
		else PlayerTextDrawSetString(playerid,RACEdraw[playerid][3],"1.~r~Keiner");
		if(secondracerid != 0)
		{
			format(string,sizeof(string),"2.~r~%s",GetName(secondracerid));
			PlayerTextDrawSetString(playerid,RACEdraw[playerid][4],string);
		}
		else PlayerTextDrawSetString(playerid,RACEdraw[playerid][4],"2.~r~Keiner");
		if(thirdracerid != 0)
		{
			format(string,sizeof(string),"3.~r~%s",GetName(thirdracerid));
			PlayerTextDrawSetString(playerid,RACEdraw[playerid][5],string);
		}
		else PlayerTextDrawSetString(playerid,RACEdraw[playerid][5],"3.~r~Keiner");
		if(RaceCps[playerid] == RaceMaxCps)
		{
			RaceZeitAfterRace[playerid] = gettime()-RaceBestzeit[playerid];
			format(string,sizeof(string),"[RACE-INFO]: Du hast das Rennen in %i.%02d Minuten beendet.",RaceZeitAfterRace[playerid]/60,RaceZeitAfterRace[playerid]%60);
			SendClientMessage(playerid, COLOR_YELLOW, string);
			if(RaceWinner == -1)
			{
				foreach(new i : Player)
				{
					if(IsPlayerConnected(i) && !IsPlayerNPC(i))
					{
						if(InviteInRace[i] == 1)
						{
							format(string,sizeof(string),"~g~%s~w~ hat das Rennen gewonnen.", GetName(playerid));
							GameTextForPlayer(i,string,7500,5);
						}
					}
				}
				RaceWinner = playerid;
			}
			DisablePlayerRaceCheckpoint(playerid);
		}
    }
    return 1;
}

Race_PlayerConnect(playerid) {
    RACEdraw[playerid][0] = CreatePlayerTextDraw(playerid,490,232,"_");//renname
	PlayerTextDrawSetShadow(playerid,RACEdraw[playerid][0],1);
	PlayerTextDrawFont(playerid,RACEdraw[playerid][0],TEXT_DRAW_FONT_1);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][0],630,135);
	PlayerTextDrawColour(playerid,RACEdraw[playerid][0],0xFEFEFEFF);
	PlayerTextDrawBackgroundColour(playerid,RACEdraw[playerid][0],0x000000FF);
	PlayerTextDrawUseBox(playerid,RACEdraw[playerid][0],true);
	PlayerTextDrawBoxColour(playerid,RACEdraw[playerid][0],0x05000041);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][0],0.500000,0.999990);

	RACEdraw[playerid][1] = CreatePlayerTextDraw(playerid,490,245,"_");//infobox box
	PlayerTextDrawUseBox(playerid,RACEdraw[playerid][1],true);
	PlayerTextDrawBoxColour(playerid,RACEdraw[playerid][1],0x05000041);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][1],630,135);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][1],0.500000,9.000000);

	RACEdraw[playerid][2] = CreatePlayerTextDraw(playerid,490,330,"_");//infobox box 2 cps
	PlayerTextDrawUseBox(playerid,RACEdraw[playerid][2],true);
	PlayerTextDrawBoxColour(playerid,RACEdraw[playerid][2],0x05000041);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][2],630,135);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][2],0.500000,0.999990);

	RACEdraw[playerid][3] = CreatePlayerTextDraw(playerid,492,250,"_");//platz 1
	PlayerTextDrawSetShadow(playerid,RACEdraw[playerid][3],1);
	PlayerTextDrawFont(playerid,RACEdraw[playerid][3],TEXT_DRAW_FONT_1);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][3],630,135);
	PlayerTextDrawColour(playerid,RACEdraw[playerid][3],0xFEFEFEFF);
	PlayerTextDrawBackgroundColour(playerid,RACEdraw[playerid][3],0x000000FF);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][3],0.300000,0.999990);

	RACEdraw[playerid][4] = CreatePlayerTextDraw(playerid,492,265,"_");//platz 2
	PlayerTextDrawSetShadow(playerid,RACEdraw[playerid][4],1);
	PlayerTextDrawFont(playerid,RACEdraw[playerid][4],TEXT_DRAW_FONT_1);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][4],630,135);
	PlayerTextDrawColour(playerid,RACEdraw[playerid][4],0xFEFEFEFF);
	PlayerTextDrawBackgroundColour(playerid,RACEdraw[playerid][4],0x000000FF);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][4],0.300000,0.999990);

	RACEdraw[playerid][5] = CreatePlayerTextDraw(playerid,492,280,"_");//platz 3
	PlayerTextDrawSetShadow(playerid,RACEdraw[playerid][5],1);
	PlayerTextDrawFont(playerid,RACEdraw[playerid][5],TEXT_DRAW_FONT_1);
	PlayerTextDrawTextSize(playerid,RACEdraw[playerid][5],630,135);
	PlayerTextDrawColour(playerid,RACEdraw[playerid][5],0xFEFEFEFF);
	PlayerTextDrawBackgroundColour(playerid,RACEdraw[playerid][5],0x000000FF);
	PlayerTextDrawLetterSize(playerid,RACEdraw[playerid][5],0.300000,0.999990);

    MakeRace[playerid] = -1;
    return 1;
}

forward CountDown(countdownc);
public CountDown(countdownc) {
    switch(countdownc) {
	    case 1: {
            new string[25],r = RaceStarted;

            RCountdownSec--;
            foreach(new i : Player) {
                if(IsPlayerConnected(i)) {
                    if(InviteInRace[i] == 1) {
                        format(string,sizeof(string),"~g~%i",RCountdownSec);
                        GameTextForPlayer(i,string,1000,3);
                        PlayerPlaySound(i,1056,0.0,0.0,0.0);
                        if(RCountdownSec <= 0) {
                            TogglePlayerControllable(i,true);
                            RaceBestzeit[i] = gettime();
                            SendClientMessage(i, COLOR_YELLOW, "Los Los Los !!!");
                            DisablePlayerRaceCheckpoint(i);
                            RaceCps[i] = 0;
                            PlayerTextDrawShow(i,RACEdraw[i][0]);
                            format(string,sizeof(string),"%s",RaceName[r]);
                            PlayerTextDrawSetString(i,RACEdraw[i][0],string);
                            PlayerTextDrawShow(i,RACEdraw[i][1]);
                            PlayerTextDrawShow(i,RACEdraw[i][2]);
                            format(string,sizeof(string),"0/%i ~y~Cps",RaceMaxCps);
                            PlayerTextDrawSetString(i,RACEdraw[i][2],string);
                            PlayerTextDrawShow(i,RACEdraw[i][3]);
                            PlayerTextDrawSetString(i,RACEdraw[i][3],"1.~r~Keiner");
                            PlayerTextDrawShow(i,RACEdraw[i][4]);
                            PlayerTextDrawSetString(i,RACEdraw[i][4],"2.~r~Keiner");
                            PlayerTextDrawShow(i,RACEdraw[i][5]);
                            PlayerTextDrawSetString(i,RACEdraw[i][5],"3.~r~Keiner");
                            SetPlayerRaceCheckpoint(i,CP_TYPE:0,RaceInfo[r][0][0],RaceInfo[r][0][1],RaceInfo[r][0][2],RaceInfo[r][1][0],RaceInfo[r][1][1],RaceInfo[r][1][2],6.0);
                            RCountdownSec = 0;
                            KillTimer(RCountDownTimer);
                            GameTextForPlayer(i,"~y~LOS LOS LOS",1000,3);
                            PlayerPlaySound(i,3201,0.0,0.0,0.0);
                        }
                    }
                }
            }
        }
    }
    return 1;
}