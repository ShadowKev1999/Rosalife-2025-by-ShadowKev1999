
public StartDice(playerid)
{
	new pID = GetPVarInt(playerid,"DiceGegner");
	new random1 = randomEx(1,6), random2 = randomEx(1,6);
	new Gewinn = GetPVarInt(playerid,"DiceEinsatz")+GetPVarInt(pID,"DiceEinsatz");
	new string[164];

	SendClientMessage(playerid,COLOR_WHITE,"");
	SendClientMessage(playerid,COLOR_WHITE,"");
	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}|_____ Dice Ergebnis _____|");
	format(string,sizeof(string),"Deine Zahl: {FF0000}%d", random1);
	SendClientMessage(playerid,COLOR_WHITE,string);
	format(string,sizeof(string),"%s Zahl: {FF0000}%d", SpielerInfo[pID][sName], random2);
	SendClientMessage(playerid,COLOR_WHITE,string);


	SendClientMessage(pID,COLOR_WHITE,"");
	SendClientMessage(pID,COLOR_WHITE,"");
	SendClientMessage(pID,COLOR_RED,"[Info]: {FFFFFF}|_____ Dice Ergebnis _____|");
	format(string,sizeof(string),"Deine Zahl: {FF0000}%d", random2);
	SendClientMessage(pID,COLOR_WHITE,string);
	format(string,sizeof(string),"Zahl von %s: {FF0000}%d", SpielerInfo[playerid][sName], random1);
	SendClientMessage(pID,COLOR_WHITE,string);

	if(random1 > random2)//Spieler 1 gewinnt
	{
		format(string,sizeof(string),"Du hast beim Würfeln gegen %s, insgesamt $%d gewonnen. Herzlichen Glückwunsch!", SpielerInfo[pID][sName], Gewinn);
		SendClientMessage(playerid,COLOR_SUPER,string);
		format(string,sizeof(string),"Du hast beim Würfeln gegen {FFFFFF}%s{FF0000}, ${FFFFFF}%d{FF0000} verloren. Sei nicht traurig!", SpielerInfo[playerid][sName], GetPVarInt(pID,"DiceEinsatz"));
		SendClientMessage(pID,COLOR_RED,string);
	    GivePlayerMoneyEx(playerid,Gewinn);
	}
	else if(random1 < random2)//Spieler 2 gewinnt
	{
		format(string,sizeof(string),"Du hast beim Würfeln gegen %s, insgesamt $%d gewonnen. Herzlichen Glückwunsch!", SpielerInfo[playerid][sName], Gewinn);
		SendClientMessage(pID,COLOR_SUPER,string);
		format(string,sizeof(string),"Du hast beim Würfeln gegen {FFFFFF}%s{FF0000}, ${FFFFFF}%d{FF0000} verloren. Sei nicht traurig!", SpielerInfo[pID][sName], GetPVarInt(playerid,"DiceEinsatz"));
		SendClientMessage(playerid,COLOR_RED,string);
        GivePlayerMoneyEx(pID,Gewinn);
	}
	else if(random1 == random2)//Unentschieden
	{
		format(string,sizeof(string),"Unentschieden! Du hast dein Einsatz in Höhe von $%d zurückbekommen.", GetPVarInt(playerid,"DiceEinsatz"));
		SendClientMessage(playerid,COLOR_INFO,string);
		format(string,sizeof(string),"Unentschieden! Du hast dein Einsatz in Höhe von $%d zurückbekommen.", GetPVarInt(pID,"DiceEinsatz"));
		SendClientMessage(pID,COLOR_INFO,string);

        GivePlayerMoneyEx(playerid,GetPVarInt(playerid,"DiceEinsatz"));
        GivePlayerMoneyEx(pID,GetPVarInt(pID,"DiceEinsatz"));
	}
	DeletePVar(playerid,"DiceEinsatz");
	DeletePVar(playerid,"DiceGegner");
	DeletePVar(pID,"DiceEinsatz");
	DeletePVar(pID,"DiceGegner");
	DeletePVar(playerid,"DiceShow");
	DeletePVar(pID,"DiceShow");

	HideDice(playerid);
	HideDice(pID);
    return 1;
}

stock ShowDice(playerid,pID)
{
	SetPVarInt(playerid,"DiceShow",1);
	//format(stats,sizeof(stats),""); << zum kopieren für mein faulen Traummann :)<333
	new dice[1024];

	//Spielername 1
	format(dice,sizeof(dice),"%s",SpielerInfo[playerid][sName]);
	PlayerTextDrawSetString(playerid, DiceDraw[playerid][6], dice);
	PlayerTextDrawSetString(pID, DiceDraw[pID][6], dice);

	//Spielername 2
	format(dice,sizeof(dice),"%s",SpielerInfo[pID][sName]);
	PlayerTextDrawSetString(playerid, DiceDraw[playerid][1], dice);
	PlayerTextDrawSetString(pID, DiceDraw[pID][1], dice);

	//Einsatz
	PlayerTextDrawSetString(playerid, DiceDraw[playerid][7], "$0");
	PlayerTextDrawSetString(pID, DiceDraw[pID][7], "$0");

	ShowPlayerDice(playerid);
	ShowPlayerDice(pID);
	return 1;
}

stock ShowPlayerDice(playerid)
{
	SelectTextDraw(playerid, 0xFFFFFFFF);
	PlayerTextDrawSetSelectable(playerid, DiceDraw[playerid][11], true);
	PlayerTextDrawSetSelectable(playerid, DiceDraw[playerid][5], true);
	PlayerTextDrawSetSelectable(playerid, DiceDraw[playerid][9], true);
	for(new id = 0; id < 12; id++)
    {
    	PlayerTextDrawShow(playerid, DiceDraw[playerid][id]);
	}
	return 1;
}

stock HideDice(playerid)
{
    CancelSelectTextDraw(playerid);
	for(new id = 0; id < 12; id++)
    {
    	PlayerTextDrawHide(playerid, DiceDraw[playerid][id]);
	}
	return 1;
}