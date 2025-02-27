
CMD:werkzeug(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] != 11)return NichtBerechtigt
 	if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  	if(GetPVarInt(playerid,"ElektrikerArbeitet") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast dir noch kein Elektrikerfahrzeug reserviert. Benutze dazu '/startjob'");
   	if(GetPVarInt(playerid,"WerkzeugInHand") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast bereits ein Werkzeug in der Hand. Benutze '/reinlegen' um das aktuelle Werkzeug wegzulegen.");
   	new Float:x, Float:y, Float:z, i = GetPVarInt(playerid,"ElektrikerID");
	GetXYInFrontOfVehicle(i,x,y,z,-2.02);
 	if(IsPlayerInRangeOfPoint(playerid,2.0,x,y,z))
  	{
   		if(FahrzeugInfo[i][fJobFahrer] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Das Elektrikerfahrzeug gehört nicht dir.");
		ShowPlayerDialog(playerid,DIALOG_WERKZEUG_HOLEN,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Werkzeuge","Hammer\nSchraubendreher","Nehmen","Abbrechen");
  		return 1;
    }
	else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Kofferraum deines Elektrikerfahrzeuges.");
	return 1;
}
CMD:auftragsliste(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] != 11)return NichtBerechtigt
	if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(GetPVarInt(playerid,"ElektrikerArbeitet") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze erst '/startjob' um das Gerät einschalten zukönnen.");
 	ShowPlayerDialog(playerid,DIALOG_AUFTRAGSLISTE,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Auftragsliste","Bankautomaten\nBlitzer","Weiter","Beenden");
  	return 1;
}

CMD:reparieren(playerid,params[])
{
	if(SpielerInfo[playerid][sNebenjob] != 11)return NichtBerechtigt
    if(GetPVarInt(playerid,"ElektrikerDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
    if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
    if(GetPVarInt(playerid,"WerkzeugInHand") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast kein Werkzeug in der Hand. Benutze '/werkzeug' um dir ein Werkzeug zu holen.");
    if(GetPVarInt(playerid,"ReparaturArt") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist gerade am reparieren.");
    new Auswahl[24];
    if(sscanf(params,"s[24]",Auswahl))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/reparieren [Bankautomat|Blitzer]");
    if(strcmp(Auswahl,"Bankautomat",true)==0)
	{
	    if(!AmATM(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem defekten Bankautomat. Benutze '/auftragsliste'");
		new atmid = ATMID(playerid);
		if(ATMInfo[atmid][atmKaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Bankautomat ist nicht defekt. Benutze '/auftragsliste'");
		if(GetPVarInt(playerid,"WerkzeugInHand") != 2)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du benötigst hierfür den Schraubendreher. Benutze '/werkzeug' um dir das Werkzeug zu holen.");
        TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, false, false, false, 0);
		GameTextForPlayer(playerid, "~r~Wird repariert...", 10000, 5);
  		KillTimer(RepVorgangTimer[playerid]);
		RepVorgangTimer[playerid] = SetTimerEx("ReparaturVorgang",10000,false,"i",playerid);
		SetPVarInt(playerid,"ReparaturArt",1);
	    return 1;
	}
 	else if(strcmp(Auswahl,"Blitzer",true)==0)
	{
 		if(!AmBlitzer(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem defekten Blitzer. Benutze '/auftragsliste'");
		new blitzerid = BlitzerID(playerid);
		if(Blitzer[blitzerid][Kaputt] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der Blitzer ist nicht defekt. Benutze '/auftragsliste'");
		if(GetPVarInt(playerid,"WerkzeugInHand") != 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du benötigst hierfür den Hammer. Benutze '/werkzeug' um dir das Werkzeug zu holen.");
        TogglePlayerControllable(playerid, false);
		ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, true, false, false, false, 0);
		GameTextForPlayer(playerid, "~r~Wird repariert...", 10000, 5);
		KillTimer(RepVorgangTimer[playerid]);
		RepVorgangTimer[playerid] = SetTimerEx("ReparaturVorgang",10000,false,"i",playerid);
		SetPVarInt(playerid,"ReparaturArt",2);
		return 1;
	}
    return 1;
}