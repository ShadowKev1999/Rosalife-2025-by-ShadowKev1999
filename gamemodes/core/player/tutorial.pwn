
stock ShowPlayerTutorial(playerid)
{
	if(SpielerInfo[playerid][sTutorial] > 9)return 1;
	if(GetPVarInt(playerid,"TutorialTDSet") < 1)
	{
	    TutorialTD[playerid][0] = CreatePlayerTextDraw(playerid, 360.000000, 355.000000, "~r~");
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][0], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][0], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][0], 0.600000, 5.900000);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][0], -1);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][0], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][0], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][0], 1);
		PlayerTextDrawUseBox(playerid, TutorialTD[playerid][0], true);
		PlayerTextDrawBoxColour(playerid, TutorialTD[playerid][0], 100);
		PlayerTextDrawTextSize(playerid, TutorialTD[playerid][0], 220.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][0], false);

		TutorialTD[playerid][1] = CreatePlayerTextDraw(playerid, 267.000000, 343.000000, "~r~redv-reallife.de");
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][1], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][1], TEXT_DRAW_FONT_0);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][1], 0.379999, 1.000000);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][1], -16770561);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][1], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][1], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][1], 1);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][1], false);

		TutorialTD[playerid][2] = CreatePlayerTextDraw(playerid, 360.000000, 345.000000, "~r~");
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][2], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][2], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][2], 0.600000, 8.000000);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][2], -1);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][2], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][2], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][2], 1);
		PlayerTextDrawUseBox(playerid, TutorialTD[playerid][2], true);
		PlayerTextDrawBoxColour(playerid, TutorialTD[playerid][2], 100);
		PlayerTextDrawTextSize(playerid, TutorialTD[playerid][2], 220.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][2], false);

		TutorialTD[playerid][3] = CreatePlayerTextDraw(playerid, 360.000000, 355.000000, "~r~");
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][3], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][3], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][3], 0.500000, -0.300000);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][3], -1);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][3], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][3], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][3], 1);
		PlayerTextDrawUseBox(playerid, TutorialTD[playerid][3], true);
		PlayerTextDrawBoxColour(playerid, TutorialTD[playerid][3], -1);
		PlayerTextDrawTextSize(playerid, TutorialTD[playerid][3], 220.000000, 0.000000);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][3], false);

		TutorialTD[playerid][4] = CreatePlayerTextDraw(playerid, 290.000000, 372.000000, "Besuche ~r~Michelle S.~w~~n~in der Stadthalle.");
		PlayerTextDrawAlignment(playerid, TutorialTD[playerid][4], TEXT_DRAW_ALIGN_CENTER);
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][4], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][4], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][4], 0.400000, 1.000000);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][4], -1);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][4], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][4], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][4], 1);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][4], false);

		TutorialTD[playerid][5] = CreatePlayerTextDraw(playerid, 223.000000, 409.000000, "Tipp: Mit ~b~/achiv ~w~siehst du alle Achievements.");
		PlayerTextDrawBackgroundColour(playerid, TutorialTD[playerid][5], 255);
		PlayerTextDrawFont(playerid, TutorialTD[playerid][5], TEXT_DRAW_FONT_1);
		PlayerTextDrawLetterSize(playerid, TutorialTD[playerid][5], 0.149999, 0.899999);
		PlayerTextDrawColour(playerid, TutorialTD[playerid][5], -1);
		PlayerTextDrawSetOutline(playerid, TutorialTD[playerid][5], 0);
		PlayerTextDrawSetProportional(playerid, TutorialTD[playerid][5], true);
		PlayerTextDrawSetShadow(playerid, TutorialTD[playerid][5], 1);
		PlayerTextDrawSetSelectable(playerid, TutorialTD[playerid][5], false);
		SetPVarInt(playerid,"TutorialTDSet",1);
	}

	if(SpielerInfo[playerid][sTutorial] == 4)//Mission 1
	{
		PlayerTextDrawShow(playerid,TutorialTD[playerid][0]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][1]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][2]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][3]);

		PlayerTextDrawSetString(playerid,TutorialTD[playerid][4],"Besuche ~r~Michelle S.~w~~n~in der Stadthalle.");
		new rand = random(4);
		if(rand == 0){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Mit ~b~/achiv ~w~siehst du alle Achievements.");}
 		if(rand == 1){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: ~b~/icp ~w~bietet dir viele Einstellungen an.");}
		if(rand == 2){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Erledige mit ~b~/missionen ~w~coole Aufgaben.");}
		if(rand == 3){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Via ~b~/newb ~w~kannst du das Team erreichen.");}

		PlayerTextDrawShow(playerid,TutorialTD[playerid][4]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][5]);
		SetPlayerCheckpointEx(playerid,1479.3213,-1738.0897,13.5469,3.0);
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Dir wurde ein Marker zur Stadthalle gesetzt.");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Du kannst Marker jederzeit mit '/delcp' löschen & mit '/lastcp' wieder anzeigen lassen.");
	}
	else if(SpielerInfo[playerid][sTutorial] == 5)//Mission 2
	{
		PlayerTextDrawShow(playerid,TutorialTD[playerid][0]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][1]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][2]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][3]);

		PlayerTextDrawSetString(playerid,TutorialTD[playerid][4],"Erstelle dir dein~n~eigenes ~b~Girokonto~w~.");
		new rand = random(4);
		if(rand == 0){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Mit ~b~/achiv ~w~siehst du alle Achievements.");}
 		if(rand == 1){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: ~b~/icp ~w~bietet dir viele Einstellungen an.");}
		if(rand == 2){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Erledige mit ~b~/missionen ~w~coole Aufgaben.");}
		if(rand == 3){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Via ~b~/newb ~w~kannst du das Team erreichen.");}

		PlayerTextDrawShow(playerid,TutorialTD[playerid][4]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][5]);
		SetPlayerCheckpointEx(playerid,1778.7935,-1703.7747,13.5609,3.0);
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Dir wurde ein Marker zur Bank (Los Santos) gesetzt.");
	}
	else if(SpielerInfo[playerid][sTutorial] == 6)//Mission 3
	{
		PlayerTextDrawShow(playerid,TutorialTD[playerid][0]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][1]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][2]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][3]);

		PlayerTextDrawSetString(playerid,TutorialTD[playerid][4],"Hol dir einen ~y~Nebenjob ~w~~n~ und verdiene Geld.");
		new rand = random(4);
		if(rand == 0){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Mit ~b~/achiv ~w~siehst du alle Achievements.");}
 		if(rand == 1){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: ~b~/icp ~w~bietet dir viele Einstellungen an.");}
		if(rand == 2){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Erledige mit ~b~/missionen ~w~coole Aufgaben.");}
		if(rand == 3){PlayerTextDrawSetString(playerid,TutorialTD[playerid][5],"Tipp: Via ~b~/newb ~w~kannst du das Team erreichen.");}

		PlayerTextDrawShow(playerid,TutorialTD[playerid][4]);
		PlayerTextDrawShow(playerid,TutorialTD[playerid][5]);
		SetPlayerCheckpointEx(playerid,1479.3213,-1738.0897,13.5469,3.0);
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Dir wurde ein Marker zur Stadthalle gesetzt.");
	}
	else if(SpielerInfo[playerid][sTutorial] == 7)//Missionen ENDE
	{
		PlayerTextDrawHide(playerid,TutorialTD[playerid][0]);
		PlayerTextDrawHide(playerid,TutorialTD[playerid][1]);
		PlayerTextDrawHide(playerid,TutorialTD[playerid][2]);
		PlayerTextDrawHide(playerid,TutorialTD[playerid][3]);
		PlayerTextDrawHide(playerid,TutorialTD[playerid][4]);
		PlayerTextDrawHide(playerid,TutorialTD[playerid][5]);

		ShowAchievement(playerid,"Beende das Tutorial!","+100 EXP");
		GivePlayerEXP(playerid,100);
		SendClientMessage(playerid,COLOR_WHITE," ");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Du bist bereit für die Welt von "SERV_NAME".");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Am besten verdienst du etwas Geld und bringst dein Level voran. So kannst du später");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}einer Fraktion beitreten & deinen Traum des Lebens verwirklichen. Viel Spaß!");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: ");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Noch eine Idee gefälligst? Im 24/7 kannst du dir ein Handy zulegen.");
		SendClientMessage(playerid,COLOR_YELLOW,"[Tutorial]: {FFFFFF}Dort findest du auch ein Navi im Angebot. Im Navi findest du auch den Weg zum Autohaus.");
		SpielerInfo[playerid][sTutorial] = 10;
		DeletePVar(playerid,"TutorialTDSet");
	}
	return 1;
}