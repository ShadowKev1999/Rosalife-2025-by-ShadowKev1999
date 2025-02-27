CMD:pfluecken(playerid)
{
	new rand = random(2), orangenrand = random(4)+1;
    if(!AmOrangenBaum(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem Orangenbaum.");
    if(SpielerInfo[playerid][sObstkorb] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du musst einen Obstkorb besitzen um Orangen pflücken zu können.");
    if(rand == 0)
    {
		SpielerInfo[playerid][sOrangen] += orangenrand;
		new string[128];
		format(string,sizeof(string),"[Info]: {FFFFFF}Du hast gerade %d Orange/n gepflückt!",orangenrand);
		SendClientMessage(playerid,COLOR_SUPER,string);
	//	ApplyAnimation(playerid, "BANK_ROB", "CAT_SAFE_ROB", 4.0, 0, 0, 0, 0, 0);//Essen
  	}
  	else{
  	SetPVarInt(playerid,!"orangen_pfluecken",gettime()+30);return SendClientMessage(playerid,COLOR_RED,"Du kannst nur alle 30 Sekunden Orangen sammeln.");
   	}
	if(SpielerInfo[playerid][sOrangen] >= 20)
	{
	    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Mehr Orangen kannst du nicht tragen. Verkaufe deine Orangen an den alten Farmer.");
	    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Gehe zum Farmer und gib '/orangenverkaufen' ein.");
	}
    return 1;
}

CMD:orangenverkaufen(playerid)
{
/*    new hour, minute, second;
    gettime(hour, minute, second);
    switch(hour) {
        case 1: verkaufsPreis = 20;
        case 2: verkaufsPreis = 28;
        case 3: verkaufsPreis = 25;
        case 4: verkaufsPreis = 39;
        case 5: verkaufsPreis = 45;
        case 6: verkaufsPreis = 50;
        case 7: verkaufsPreis = 31;
        case 8: verkaufsPreis = 38;
        case 9: verkaufsPreis = 43;
        case 10: verkaufsPreis = 49;
        case 11: verkaufsPreis = 35;
        case 12: verkaufsPreis = 32;
        case 13: verkaufsPreis = 50;
        case 14: verkaufsPreis = 48;
        case 15: verkaufsPreis = 43;
        case 16: verkaufsPreis = 24;
        case 17: verkaufsPreis = 27;
        case 18: verkaufsPreis = 38;
        case 19: verkaufsPreis = 36;
        case 20: verkaufsPreis = 46;
        case 21: verkaufsPreis = 44;
        case 22: verkaufsPreis = 42;
        case 23: verkaufsPreis = 22;
        case 24: verkaufsPreis = 25;
    }*/
    if(!IsPlayerInRangeOfPoint(playerid,5.0,301.2251, 1143.3342, 8.7459))return SendClientMessage(playerid, COLOR_RED, "Du bist nicht beim Farmer.(Orangen Feld)");
    if(SpielerInfo[playerid][sObstkorb] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du musst einen Obstkorb besitzen um Orangen zu verkaufen.");
    {
        if(SpielerInfo[playerid][sOrangen] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Orangen um sie zu Verkaufen.");
		GivePlayerMoneyEx(playerid,SpielerInfo[playerid][sOrangen] * 30);
		new string[128];
		format(string,sizeof(string),"[Info]: {FFFFFF}Du hast deine %d Orangen für $%d verkauft.",SpielerInfo[playerid][sOrangen],SpielerInfo[playerid][sOrangen] * 30);
		SendClientMessage(playerid,COLOR_SUPER,string);
		SpielerInfo[playerid][sOrangen] = 0;
    }
    return 1;
}