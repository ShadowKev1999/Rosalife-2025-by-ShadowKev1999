
CMD:delschild(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
			RemoveSchild(playerid);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
CMD:delallschilder(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
  			new string[128];
			RemoveAllSchilder();
			foreach(new i : Player)
			{
				SendClientMessage(i,COLOR_BLUE, "");
				SendClientMessage(i,COLOR_BLUE, "_______[ Regierungsnachricht ]_______");
				format(string,sizeof(string),"%s %s hat alle Straßenschilder entfernt.",RangName(playerid),SpielerInfo[playerid][sName]);
				SendClientMessage(i,COLOR_BLUE,string);
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
CMD:delsperre(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 5)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"FeuerwehrDuty") == 1)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Im Fahrzeug nicht möglich.");
			RemoveSperre(playerid);
			new string[128];
			format(string,sizeof(string),"* %s %s baut eine Sperre ab.",RangName(playerid),SpielerInfo[playerid][sName]);
			ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:schild(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Im Fahrzeug nicht möglich.");
			if(SchilderCount() == MAX_SCHILDER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es wurde bereits die maximale Anzahl an Straßenschilder errichtet!");
			ShowPlayerDialog(playerid,DIALOG_CREATE_STREETSIGN,DIALOG_STYLE_LIST,"{007DFF}"SERV_NAME"{FFFFFF} - Straßenschilder","Vorfahrt gewähren\nRadarkontrolle\nSpeed Limit 30\nSpeed Limit 50\nSpeed Limit aufgehoben\nWiderrechtlich parkend wird abgeschleppt\nStop\nDurchfahrt verboten\nNur Links abbiegen\nNur rechts abbiegen","Erstellen","Zurück");
			return 1;
 		}
		else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
 	}
 	else NichtBerechtigt
	return 1;
}