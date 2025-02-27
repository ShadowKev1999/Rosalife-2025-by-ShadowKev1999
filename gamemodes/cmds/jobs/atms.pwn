CMD:createatm(playerid, params[]) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    ShowPlayerDialog(playerid, DIALOG_ADMIN_CREATE_ATM, DIALOG_STYLE_MSGBOX, "{007DFF}"SERV_NAME"{FFFFFF} - ATM", "Befindet sich der ATM in einem {007DFF}Interior?{FFFFFF}", "Ja", "Nein");
    return 1;
}

CMD:editatm(playerid, params[]) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt

    if(EditingATMID[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du editierst bereits einen ATM.");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/editatm [atm id]");
	if(!ATM_Created(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, ATMInfo[id][atmPos_X], ATMInfo[id][atmPos_Y], ATMInfo[id][atmPos_Z])) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht in der Nähe des angegebenen ATMs.");
	EditingATMID[playerid] = id;
	EditDynamicObject(playerid, ATMInfo[id][atmObj]);
    return 1;
}

CMD:deleteatm(playerid, params[]) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/deleteatm [atm id]");
	if(!ATM_Created(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	
	if(ATM_BeingEdited(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}ATM kann nicht entfernt werden, da er derzeit editiert wird.");
	DestroyDynamicObject(ATMInfo[id][atmObj]);
	DestroyDynamic3DTextLabel(ATMInfo[id][atmLabel]);
	
	
	ATMInfo[id][atmLabel] = Text3D: -1;
	ATMInfo[id][atmCreated] = false;
	
    new query[128];

	mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `atms` WHERE `id` = %i", id);
    mysql_tquery(sqlHandle, query);

	SendClientMessage(playerid, 0x3498DBFF, "ATM: {FFFFFF}ATM wurde entfernt.");
    return 1;
}

CMD:atm(playerid, params[]) {
	if(!AmATM(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem Bankautomat.");
	if(SpielerInfo[playerid][sBankPin] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du besitzt derzeit noch kein Bankkonto. Fahr zur Bank und lass dir ein Bankkonto erstellen.");
	if(ATMInfo[ATMID(playerid)][atmKaputt] == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Bankautomat ist derzeit Außerbetrieb. Die Elektriker wurden bereits alle informiert.");
	SetPVarInt(playerid,"ATMID",ATMID(playerid));
	ShowPlayerDialog(playerid,DIALOG_BANKLOGIN,DIALOG_STYLE_PASSWORD,"{007DFF}"SERV_NAME"{FFFFFF} - Banksystem","{FFFFFF}Bitte gebe deinen PIN für dein Konto an um fortzufahren.","Weiter","Zurück");
	return 1;
}