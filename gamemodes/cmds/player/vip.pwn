CMD:vipchat(playerid, params[])
{
    if(SpielerInfo[playerid][sMuted]== 1)return SendClientMessage(playerid, COLOR_CHAT_MUTED, "Du bist gemutet.");
    if(SpielerInfo[playerid][sVIP] != 1) return SendClientMessage(playerid,COLOR_RED,"Du bist kein Clubmitglied");
    new text[96];
    if(sscanf(params, "s[96]", text)) return SendClientMessage(playerid, COLOR_BLUE, INFO_STRING"/vipchat [Nachricht]");
    new string[128];
    format(string, sizeof(string), "* Clubmitglied %s sagt: %s *", SpielerInfo[playerid][sName], text);
    SendClubMessage(COLOR_CLUB,string);
    return 1;
}
alias:vipchat("cc")

CMD:clubfarbe(playerid)
{
    if(SpielerInfo[playerid][sVIP] != 1)return SendClientMessage(playerid,COLOR_RED,"Du bist kein Clubmitglied");
    {
        if(SpielerInfo[playerid][sVIPFarbe]==0)
        {
            SendClientMessage(playerid,COLOR_GREEN,"Clubfarbe wurde aktiviert.");
            SetPlayerColor(playerid, TEAM_OAMT_COLOR);
            SpielerInfo[playerid][sVIPFarbe] = 1;
        }
        else
        {
            SendClientMessage(playerid,COLOR_YELLOW,"Clubfarbe wurde deaktiviert.");
            SpielerInfo[playerid][sVIPFarbe] = 0;
            SetPlayerColor(playerid, COLOR_WHITE);
        }
    }
    return 1;
}

CMD:neon(playerid, params[])
{
	new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInRangeOfPoint(playerid,3.5,1569.3154,-2154.8662,14.0352))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Neon Shop.");
 	if(FahrzeugInfo[tmpcar][fBesitzerID] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Nur in einem Privatfahrzeug möglich.");
  	if(FahrzeugInfo[tmpcar][fBesitzerID] != playerid)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nur an deine eigenen Privatfahrzeuge, Unterbodenbeleuchtung einbauen lassen.");
   	if(SpielerInfo[playerid][sVIP] > 0)return ShowPlayerDialog(playerid,DIALOG_NEON,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Neon Shop","{FFFFFF}Weiß	| Kosten: {FF0000}2.000$\n{FFFFFF}Blau	| Kosten: {FF0000}2.000$\n{FFFFFF}Rot	| Kosten: {FF0000}2.000$\n{FFFFFF}Gelb	| Kosten: {FF0000}2.000$\n{FFFFFF}Grün	| Kosten: {FF0000}2.000$\n{FFFFFF}Pink	| Kosten: {FF0000}2.000$\n{FFFFFF}Neon entfernen	| Kosten: {FF0000}2.000$","Weiter","Abbrechen");
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist kein VIP.");
    return 1;
}