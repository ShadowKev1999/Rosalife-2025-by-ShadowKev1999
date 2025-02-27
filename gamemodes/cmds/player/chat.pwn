CMD:newb(playerid,params[])
{
	if(GetPlayerScore(playerid) > 2 && SpielerInfo[playerid][sAdmin] < 1)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist kein Neuling mehr. Wende dich per '/sup* an das Team.");
	if(SpielerInfo[playerid][sMuted] > 0)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist noch gemutet.");
	if(GetPVarInt(playerid,"NewbChatBlock") > 0 && SpielerInfo[playerid][sAdmin] < 1)
	{
		new string[128];
		format(string,sizeof(string),"[Info]: Du musst noch %d Sekunde/n vor deiner nächsten Nachricht warten.",GetPVarInt(playerid,"NewbChatBlock"));
	    SendClientMessage(playerid,COLOR_GREY,string);
	    return 1;
	}
	new text[256];
	if(sscanf(params,"s[256]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /newb [Frage]");
	new string[320];
	format(string,sizeof(string),"[Newb] %s: %s",SpielerInfo[playerid][sName],text);
	if(SpielerInfo[playerid][sAdmin] > 1){format(string,sizeof(string),"[Newb] %s %s: %s",AdminName(playerid),SpielerInfo[playerid][sName],text);}
	foreach(new i : Player)
	{
		if(GetPlayerScore(i) > 2 && SpielerInfo[i][sAdmin] < 1)continue;
		SendClientMessage(i,0x1874CDFF,string);
	}
	SetPVarInt(playerid,"NewbChatBlock",35);
	SetTimerEx("NewbChatBlock", 1000, true, "i", playerid);
	return 1;
}
alias:newb("nc")

CMD:whisper(playerid,params[])
{
	new textgstring[144], text[114], pID;
    if(SpielerInfo[playerid][sMuted] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist noch gemutet.");
    if(sscanf(params,"us[114]",pID,text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/whisper [SpielerID/Name] [Text]");
   	if(!IsPlayerConnectedEx(playerid))return NichtOnline
	if(GetDistanceBetweenPlayersEx(playerid, pID) >= 2)return NichtNahe
	format(textgstring,sizeof(textgstring),"%s flüstert dir zu: %s",SpielerInfo[playerid][sName],text);
	SendClientMessage(pID,COLOR_WHITE,textgstring);
	format(textgstring,sizeof(textgstring),"Du hast dem %s etwas ins Ohr geflüstert.",SpielerInfo[pID][sName]);
    SendClientMessage(playerid,COLOR_WHITE,textgstring);
	return 1;
}

CMD:leise(playerid,params[])
{
	new textgstring[144], text[114];
    if(SpielerInfo[playerid][sMuted] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist noch gemutet.");
    if(sscanf(params,"s[114]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/leise [Text]");
	if(GetPVarInt(playerid,"CopMaske") == 1){format(textgstring,sizeof(textgstring),"Unbekannter sagt leise: %s",text);}
	else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(textgstring,sizeof(textgstring),"Unbekannter sagt leise: %s",text);}
	else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(textgstring,sizeof(textgstring),"Unbekannter sagt leise: %s",text);}
	else {format(textgstring,sizeof(textgstring),"%s sagt leise: %s",SpielerInfo[playerid][sName],text);}
	SetPlayerChatBubble(playerid, text, 0xE10000FF, 3.0, 5000);
	ProxDetector(3.0, playerid, textgstring, 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF);
	return 1;
}
alias:leise("l")

CMD:b(playerid,params[])
{
	new textgstring[144], text[114];
    if(SpielerInfo[playerid][sMuted] > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist noch gemutet.");
    if(sscanf(params,"s[114]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/b [Text]");
	if(GetPVarInt(playerid,"CopMaske") == 1){format(textgstring,sizeof(textgstring),"(( Unbekannter sagt: %s ))",text);}
	else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(textgstring,sizeof(textgstring),"(( Unbekannter sagt: %s ))",text);}
	else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(textgstring,sizeof(textgstring),"(( Unbekannter sagt: %s ))",text);}
	else {format(textgstring,sizeof(textgstring),"(( %s sagt: %s ))",SpielerInfo[playerid][sName],text);}
	SetPlayerChatBubble(playerid, text, 0xE10000FF, 20.0, 5000);
	ProxDetector(20.0, playerid, textgstring, 0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF,0xFFFFFFFF);
	return 1;
}

CMD:ooc(playerid,params[])
{
    if(SpielerInfo[playerid][icpOChat] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Aktiviere deinen OOC-Chat im ICP um Nachrichten zu senden.");
    if(GlobalVars[OOC] != 1 && SpielerInfo[playerid][sAdmin] == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Der OOC Chat ist zurzeit deaktiviert.");
    if(SpielerInfo[playerid][sMuted] > 0)return SendClientMessage(playerid,COLOR_GREY,"[Info]: {FFFFFF}Du bist noch gemutet.");
	new string[254], Text[254];
	if(sscanf(params,"s[254]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/ooc [Text]");
	if(SpielerInfo[playerid][sAdmin] == 0)
    {
		format(string,sizeof(string),"(( [OOC] %s: %s ))",SpielerInfo[playerid][sName],Text);
		SendOOCMessage(string);
    }
    else
    {
		format(string,sizeof(string),"(( [OOC] {%s}%s {FFFFFF}%s: %s ))",AdminColor(playerid),AdminName(playerid),SpielerInfo[playerid][sName],Text);
		SendOOCMessage(string);
    	return 1;
	}
	return 1;
}
alias:ooc("o")

CMD:s(playerid,params[])
{
	new string[144], text[128];
 	if(SpielerInfo[playerid][sMuted] > 0)
    {
        format(string,128,"Du bist noch für %d Minute(n) gemutet.",SpielerInfo[playerid][sMuted]);
        SendClientMessage(playerid,COLOR_RED,string);
        return 1;
    }
	if(sscanf(params,"s[128]",text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/s [Text]");
	if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"Unbekannter schreit: %s!",text);}
	else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"Unbekannter sagt: %s",text);}
	else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"Unbekannter sagt: %s",text);}
	else format(string,sizeof(string),"%s schreit: %s!",SpielerInfo[playerid][sName],text);
	ProxDetector(30, playerid, string,COLOR_WHITE,COLOR_WHITE,COLOR_WHITE,COLOR_GREY,COLOR_GREY);
	return 1;
}

CMD:me(playerid,params[])
{
	new string[144], Text[128];
	if(sscanf(params,"s[128]",Text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/me [Text]");
	if(GetPVarInt(playerid,"CopMaske") == 1){format(string,sizeof(string),"** Unbekannter %s **",Text);}
	else if(GetPVarInt(playerid,"FraktionsMaske") == 1){format(string,sizeof(string),"** Unbekannter %s **",Text);}
	else if(GetPVarInt(playerid,"GruppenMaske") == 1){format(string,sizeof(string),"** Unbekannter %s **",Text);}
	else format(string,sizeof(string),"* %s %s",SpielerInfo[playerid][sName],Text);
	ProxDetector(10.0, playerid, string, 0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA,0xC2A2DAAA);
	return 1;
}