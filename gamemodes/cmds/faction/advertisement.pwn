CMD:searchwerbetafel(playerid,params[])
{
	new string[128],wtafel;
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
    if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(sscanf(params,"i",wtafel))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/searchwtafel [TafelID]");
	if(wtafel < 0 || wtafel > (MAX_WERBETAFELN)-1)
	{
		format(string,sizeof(string),"Benutze: {FFFFFF}/searchwtafel [TafelID 0-%d]",MAX_WERBETAFELN-1);
		return SendClientMessage(playerid,COLOR_YELLOW,string);
	}
    if(IsPlayerInRangeOfPoint(playerid,20.0,Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz]))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist bereits an der angegebenen Werbetafel.");
	format(string,sizeof(string),"Die Werbetafel Nr.%d wurde auf deiner Karte rot markiert.",wtafel);
	SendClientMessage(playerid,COLOR_SUPER,string);
	SetPlayerCheckpointEx(playerid,Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz],3.0);
	return 1;
}
CMD:clearwtafel(playerid,params[])
{
	new string[128],wtafel;
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
    if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(sscanf(params,"d",wtafel))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/clearwtafel [TafelID]");
	if(wtafel < 0 || wtafel > (MAX_WERBETAFELN)-1)
	{
		format(string,sizeof(string),"Benutze: {FFFFFF}/clearwerbetafel [Tafelid 0-%i]",MAX_WERBETAFELN-1);
		return SendClientMessage(playerid,COLOR_RED,string);
	}
	if(!IsPlayerInRangeOfPoint(playerid,50.0,Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz]))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der angegebene Werbetafel.");
	format(string,sizeof(string),"Du hast die Werbetafel %d wieder frei gemacht.",wtafel);
	SendClientMessage(playerid,COLOR_SUPER,string);
    DestroyDynamicObject(Werbetafelobject[wtafel]);
    strmid(Werbetafeln[wtafel][wtafeltext],"Werbung gefälligst?--Kontakt: Interglobal Television",0,strlen("Werbung gefälligst?--Kontakt: Interglobal Television"),80);
	Werbetafelobject[wtafel] = CreateDynamicObject(Werbetafeln[wtafel][wtafelobjectid],Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz],Werbetafeln[wtafel][wtafelxrot],Werbetafeln[wtafel][wtafelyrot],Werbetafeln[wtafel][wtafelzrot]);
	SetDynamicObjectMaterialText(Werbetafelobject[wtafel],Werbetafeln[wtafel][wtafeltmindex],Werbetafeln[wtafel][wtafeltext],Werbetafeln[wtafel][wtafeltmsize],Werbetafeln[wtafel][wtafeltfonts],Werbetafeln[wtafel][wtafeltfontsize],Werbetafeln[wtafel][wtafeltbold],Werbetafeln[wtafel][wtafeltfontcolor],Werbetafeln[wtafel][wtafeltbackcolor],Werbetafeln[wtafel][wtafeltaligment]);
	return 1;
}
CMD:listwtafel(playerid,params[])
{
	new string[128];
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
    if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	SendClientMessage(playerid,COLOR_WHITE,"|__________ {FF0000}Werbetafeln{FFFFFF} __________|");
	for(new wtafel=0;wtafel<sizeof(Werbetafeln);wtafel++)
	{
		format(string,sizeof(string),"Werbetafel Nr.{FF0000}%d{FFFFFF} | Text: {FF0000}%s",wtafel,Werbetafeln[wtafel][wtafeltext]);
		SendClientMessage(playerid,COLOR_WHITE,string);
	}
	return 1;
}
CMD:wtafeltext(playerid,params[])
{
	new string[128],text[80],wtafel;
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
    if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
 	if(sscanf(params,"ds[61]",wtafel,text))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/wtafeltext [TafelID] [Text]");
	if(wtafel < 0 || wtafel > (MAX_WERBETAFELN)-1)
	{
		format(string,sizeof(string),"Benutze: {FFFFFF}/wtafeltext [TafelID 0-%d] [Text] | Maximal 64 Zeichen",MAX_WERBETAFELN-1);
		return SendClientMessage(playerid,COLOR_YELLOW,string);
	}
	if(!IsPlayerInRangeOfPoint(playerid,50.0,Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz]))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht an der angegebene Werbetafel.");
	if(strlen(text) > 60)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/wtafeltext [TafelID] [Text (max. 64 Zeichen)]");
    format(string,sizeof(string),"[Info]: {FFFFFF}Die neue Werbung auf der Werbetafel (ID:%d) lautet: '%s'",wtafel,text);
	SendClientMessage(playerid,COLOR_SUPER,string);
    DestroyDynamicObject(Werbetafelobject[wtafel]);
    strmid(Werbetafeln[wtafel][wtafeltext],text,0,strlen(text),sizeof(text));

    new stringwtafeltext[200];
    if(strfind(Werbetafeln[wtafel][wtafeltext], "--", true) != -1)
    {
        new firstline[64];
        new postext = strfind(Werbetafeln[wtafel][wtafeltext], "--", true);

		strmid(firstline, Werbetafeln[wtafel][wtafeltext], 0, postext);
		strdel(Werbetafeln[wtafel][wtafeltext], 0, postext+2);

        format(stringwtafeltext,sizeof(stringwtafeltext),"%s\n%s",firstline,Werbetafeln[wtafel][wtafeltext]);
    }
    else format(stringwtafeltext,sizeof(stringwtafeltext),"%s",Werbetafeln[wtafel][wtafeltext]);

    //format(Werbetafeln[wtafel][wtafeltext],sizeof(Werbetafeln[wtafel][wtafeltext]),"%s",text);
    Werbetafeln[wtafel][wtafeltext] = text;

	Werbetafelobject[wtafel] = CreateDynamicObject(Werbetafeln[wtafel][wtafelobjectid],Werbetafeln[wtafel][wtafelx],Werbetafeln[wtafel][wtafely],Werbetafeln[wtafel][wtafelz],Werbetafeln[wtafel][wtafelxrot],Werbetafeln[wtafel][wtafelyrot],Werbetafeln[wtafel][wtafelzrot]);
	SetDynamicObjectMaterialText(Werbetafelobject[wtafel],Werbetafeln[wtafel][wtafeltmindex],stringwtafeltext,Werbetafeln[wtafel][wtafeltmsize],Werbetafeln[wtafel][wtafeltfonts],Werbetafeln[wtafel][wtafeltfontsize],Werbetafeln[wtafel][wtafeltbold],Werbetafeln[wtafel][wtafeltfontcolor],Werbetafeln[wtafel][wtafeltbackcolor],Werbetafeln[wtafel][wtafeltaligment]);

	SaveWerbetafel();
	return 1;
}