COMMAND:telefonzelle(playerid,params[]) {
	if(ReturnTelefonzellenID(playerid) == -1)return SendClientMessage(playerid, COLOR_GREY,"An keiner Telefonzelle.");
    if(SpielerInfo[playerid][sMuted] == 1)return SendClientMessage(playerid, COLOR_GREY,"Du bist gemuted und kannst somit niemanden anrufen.");
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid, COLOR_GREY,"Du sitzt im Fahrzeug.");
    if(SpielerInfo[playerid][sCallHim] == 1)return SendClientMessage(playerid, COLOR_GREY,"Du bist bereits in einem Gespräch.");
    if(TeleZelleInfo[ReturnTelefonzellenID(playerid)][EGmBhHp] <= 0)return SendClientMessage(playerid, COLOR_GREY,"Die Telefonzelle ist defekt,rufe einen Elektroniker!");
    AnTelefonZelle[playerid] = 1;
	ShowPlayerDialog(playerid,DIALOG_TELEFONZELLE_CALL,DIALOG_STYLE_INPUT,"Telefon","Gib nun bitte die Nummer des Spielers ein,den du anrufen willst!","Anrufen","Abbrechen");
	return 1;
}

COMMAND:telefonbuch(playerid,params[]) {
	new pID,string[128];
    if(ReturnTelefonzellenID(playerid) == -1)return SendClientMessage(playerid, COLOR_GREY,"An keiner Telefonzelle.");
 	if(sscanf(params,"u",pID)) return SendClientMessage(playerid,COLOR_RED,"BENUTZE: /telefonbuch [playerid/Name]");
 	if(!IsPlayerConnected(pID))return SendClientMessage(playerid, COLOR_GREY,"Der angegebene Spieler ist nicht eingeloggt!");
    if(GetPVarInt(pID,"Eingeloggt") == 0)return SendClientMessage(playerid,COLOR_GREY,"Der angegebene Spieler ist nicht eingeloggt!");
	if(SpielerInfo[pID][sHandy] < 1)return SendClientMessage(playerid,COLOR_GREY,"Der Spieler konnte im Telefonbuch nicht gefunden werden.");
	format(string,sizeof(string),"Name: %s (ID:%i) | Handy: %i",GetName(pID),pID,SpielerInfo[pID][sHandy]);
	SendClientMessage(playerid, COLOR_WHITE, string);
	return 1;
}