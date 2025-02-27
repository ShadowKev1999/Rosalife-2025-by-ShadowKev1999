FishingInit() {

    //Angeln und Sellfish
	AddStaticPickup(1239, 1, 403.8289,-2088.7974,7.8359, -1); //Angel 1
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 403.8289,-2088.7974,7.8359, 5.0);
	AddStaticPickup(1239, 1, 398.7014,-2088.7983,7.8359, -1); //Angel 2
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 398.7014,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 396.1517,-2088.7983,7.8359, -1); //Angel 3
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 396.1517,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 391.0672,-2088.7976,7.8359, -1); //Angel 4
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 391.0672,-2088.7976,7.8359, 5.0);
	AddStaticPickup(1239, 1, 383.4083,-2088.7976,7.8359, -1); //Angel 5
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 383.4083,-2088.7976,7.8359, 5.0);
	AddStaticPickup(1239, 1, 374.9251,-2088.7983,7.8359, -1); //Angel 6
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 374.9251,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 369.8544,-2088.7983,7.8359, -1); //Angel 7
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 369.8544,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 367.2825,-2088.7981,7.8359, -1); //Angel 8
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 367.2825,-2088.7981,7.8359, 5.0);
	AddStaticPickup(1239, 1, 362.1932,-2088.7983,7.8359, -1); //Angel 9
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 362.1932,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 354.5322,-2088.7983,7.8359, -1); //Angel 10
	CreateDynamic3DTextLabel("{FFFFFF}Angelsteg\nBenutze '{FF0000}/angeln{FFFFFF}' um Fische zu fangen", 0x008080FF, 354.5322,-2088.7983,7.8359, 5.0);
	AddStaticPickup(1239, 1, 359.9088,-2031.9871,7.8359, -1); //Sellfish
	CreateDynamic3DTextLabel("{FFFFFF}Fischverkauf\nBenutze '{FF0000}/sellfish{FFFFFF}' um dein Fischgewicht zu verkaufen", 0x008080FF, 359.9088,-2031.9871,7.8359, 5.0);
    return 1;
}

forward SpielerFischt(playerid);
public SpielerFischt(playerid)
{
	new rand = random(2), fischrand = random(4)+1;
    if(IsPlayerInRangeOfPoint(playerid,2.0,403.8289,-2088.7974,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,396.1517,-2088.7983,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,391.0672,-2088.7976,7.8359)
	|| IsPlayerInRangeOfPoint(playerid,2.0,383.4083,-2088.7976,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,374.9251,-2088.7983,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,369.8544,-2088.7983,7.8359)
	|| IsPlayerInRangeOfPoint(playerid,2.0,367.2825,-2088.7981,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,362.1932,-2088.7983,7.8359) || IsPlayerInRangeOfPoint(playerid,2.0,354.5322,-2088.7983,7.8359)
	|| IsPlayerInRangeOfPoint(playerid,2.0,398.7014,-2088.7983,7.8359))
    {
        if(rand == 0)
        {
			SpielerInfo[playerid][sFischGewicht] += fischrand;
			new string[128];
			format(string,sizeof(string),"[Info]: {FFFFFF}Du hast gerade einen %d Kilogramm schweren Fisch gefangen!",fischrand);
			SendClientMessage(playerid,COLOR_SUPER,string);
			if(SpielerInfo[playerid][sFischGewicht] >= 20)
			{
			    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Mehr Fisch kannst du nicht tragen. Verkaufe dein gefangenes Fischgewicht erst.");
			    SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Angeln abgebrochen.");
		        KillTimer(FischTimer[playerid]);
			    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Angeln beendet. Gefangene Fische kannst du hinten am Stand mit '/sellfish' verkaufen.");
			    ClearAnimations(playerid);
			    DeletePVar(playerid,"IstAmAngeln");
			}
			return 1;
        }
        else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Noch nichts gefangen...");
		return 1;
    }
    else
    {
        SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Angeln abgebrochen.");
        KillTimer(FischTimer[playerid]);
	    SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Angeln beendet. Gefangene Fische kannst du hinten am Stand mit '/sellfish' verkaufen.");
	    ClearAnimations(playerid);
	    DeletePVar(playerid,"IstAmAngeln");
    }
    return 1;
}