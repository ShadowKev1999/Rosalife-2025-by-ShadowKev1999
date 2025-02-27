CMD:adminhelp(playerid, params[]){
    new String[1024];
    if(SpielerInfo[playerid][sFV] == 1) format(String, sizeof(String), "%s\nFraktionsverwalter Befehle\n", String);
    if(SpielerInfo[playerid][sAdmin] > 0) format(String, sizeof(String), "%sSupporter Befehle", String);
    if(SpielerInfo[playerid][sAdmin] > 1) format(String, sizeof(String), "%s\nModerator Befehle", String);
    if(SpielerInfo[playerid][sAdmin] > 2) format(String, sizeof(String), "%s\nAdministrator Befehle", String);
    if(SpielerInfo[playerid][sAdmin] > 3) format(String, sizeof(String), "%s\nServer-Manager Befehle", String);
    if(SpielerInfo[playerid][sAdmin] > 4) format(String, sizeof(String), "%s\nProjektleiter Befehle", String);

    ShowPlayerDialog(playerid, DIALOG_AHELP, DIALOG_STYLE_LIST, "Admin Help", String, "Öffnen", "Schließen");
    return 1;
}
alias:adminhelp("ahelp")

CMD:a(playerid,params[])
{
	new string[254];
	if(SpielerInfo[playerid][sAdmin] == 0)
	{
	    new pID;
	    if(sscanf(params,"u",pID))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/a(dmin) [SpielerID]");
        if(!IsPlayerConnectedEx(pID) && IsPlayerNPC(playerid))return NichtOnline
		format(string,128,"%s meldet %s [ID: %d] als Cheater.",SpielerInfo[playerid][sName],SpielerInfo[pID][sName],pID);
		SendAdminMessage(COLOR_YELLOW,string);
		SendClientMessage(playerid,COLOR_GREY,"[Info]: Deine Meldung wurde an alle verfügbaren Teammitglieder gesendet.");
	}
	else if(SpielerInfo[playerid][sAdmin] != 0)
	{
	    new text[254];
		if(sscanf(params,"s[254]",text))return SendClientMessage(playerid,COLOR_YELLOW,"{FFFFFF}Benutze: /a(dmin) [Text]");
	    format(string,sizeof(string),"[Admin-Chat] %s %s [ID: %i]: %s",AdminName(playerid),SpielerInfo[playerid][sName],playerid,text);
	    SendAdminMessage(0xFF4500FF,string);
	}
	return 1;
}
alias:a("admin")