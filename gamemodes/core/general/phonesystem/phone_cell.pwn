PhoneCell_Init() {
    for(new i = 0; i < MAX_TELEFONZELLEN; i++) {
	    TeleZelleInfo[i][EGmBhRubbishObject] = -1;
		TeleZelleInfo[i][EGmBhHp] = 100;
		TeleZelleInfo[i][EGmBhTstamp] = gettime() + ((random(10) + 10)*60);
		Create3DTextLabel("{FF8C00}Telefonzelle{FFFFFF}\nTelefon: /telefonzelle\nTelefonbuch: /telefonbuch\nService: /service", COLOR_WHITE, TeleFonPunkte[i][_posx],TeleFonPunkte[i][_posy],TeleFonPunkte[i][_posz]+1,8,TeleFonPunkte[i][_vworld],true);
	    CreateDynamicObject(1363,TeleFonPunkte[i][_posx],TeleFonPunkte[i][_posy],TeleFonPunkte[i][_posz],TeleFonPunkte[i][_posrx],TeleFonPunkte[i][_posry],TeleFonPunkte[i][_posrz]);
	}
    return 1;
}

stock ReturnTelefonzellenID(playerid) {
	for(new i=0;i<sizeof(TeleFonPunkte);i++) {
		if(IsPlayerInRangeOfPoint(playerid,1.5,TeleFonPunkte[i][_posx],TeleFonPunkte[i][_posy],TeleFonPunkte[i][_posz]) && GetPlayerVirtualWorld(playerid) == TeleFonPunkte[i][_vworld])
		return i;
	}
	return -1;
}

PhoneCell_OnDialogResponse(playerid, dialogid, response, const inputtext[]) {
	switch(dialogid) {
		case DIALOG_TELEFONZELLE_CALL: {
			new savetime;
			if(!response) return 1;
			if(!strlen(inputtext)) {
				return ShowPlayerDialog(playerid,DIALOG_TELEFONZELLE_CALL,DIALOG_STYLE_INPUT,"Telefon","Gib nun bitte die Nummer des Spielers ein,denn du anrufen willst!","Anrufen","Zur?ck");
			}
			if(!IsNumeric(inputtext)) {
				return ShowPlayerDialog(playerid,DIALOG_TELEFONZELLE_CALL,DIALOG_STYLE_INPUT,"Telefon","Gebe nur Zahlen ein !\nGib nun bitte die Nummer des Spielers ein,denn du anrufen willst!","Anrufen","Zur?ck");
			}
			SendClientMessage(playerid, COLOR_GREY,"Verbinde...");
			PlayerPlaySound(playerid,3600,0.0,0.0,0.0);
			SpielerInfo[playerid][sCallEntry] = strval(inputtext);
			if(SpielerInfo[playerid][sCallEntry] == 911 || SpielerInfo[playerid][sCallEntry] == 110)
			{
				return ShowPlayerDialog(playerid,DIALOG_SERVICE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Service","Polizei\nFBI\nFeuerwehr\nNotarzt\nOrdnungsamt (auch Mechaniker)","Weiter","Abbrechen");
			}
			if(IsHandyNummerEnable(SpielerInfo[playerid][sCallEntry]) == -1) {
				ShowPlayerDialog(playerid,DIALOG_TELEFONZELLE_CALL,DIALOG_STYLE_INPUT,"Telefon","Gib nun bitte die Nummer des Spielers ein,den du anrufen willst!","Anrufen","Abbrechen");
				return SendClientMessage(playerid,COLOR_GREY,"Anruf fehlgeschlagen");
			}
			new pID = IsHandyNummerEnable(SpielerInfo[playerid][sCallEntry]),time = ReturnHempfangRate(pID);
			if(time == -1) {
				savetime = 10;
			} else {
				savetime = ReturnHempfangRate(pID);
			}
			SetTimerEx("HandySendConnect",savetime*1000,false,"ii",playerid,2);
			
		}
	}
	return 1;
}