CMD:addblitzer(playerid,params[])
{
	new geschw,ortschaft[64];
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			if(GetPlayerInterior(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}In einem Interior kannst du keinen Blitzer aufstellen.");
			if(sscanf(params,"ds[64]",geschw,ortschaft)) return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/addblitzer [Geschwindigkeit] [Ortsname]");
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
		 	if(CreateBlitzer(playerid,geschw,ortschaft) == -1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst nicht mehr Blitzer erstellen.");
			SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast einen neuen Blitzer erstellt.");
			return 1;
  		}
  		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		return 1;
    }
    else NichtBerechtigt
	return 1;
}

CMD:delblitzer(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
			DeleteBlitzer(playerid);
			return 1;
		}
  		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		return 1;
    }
    else NichtBerechtigt
	return 1;
}

CMD:delallblitzer(playerid,params[])
{
	new string[128];
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
			SendClientMessageToAll(COLOR_BLUE, "");
			SendClientMessageToAll(COLOR_BLUE, "_______[ Regierungsnachricht ]_______");
			format(string,sizeof(string),"%s %s hat alle Blitzer entfernt.",RangName(playerid),SpielerInfo[playerid][sName]);
			SendClientMessageToAll(COLOR_BLUE,string);
			DeleteAllBlitzer();
			return 1;
  		}
  		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		return 1;
    }
    else NichtBerechtigt
	return 1;
}

CMD:blitzerinfo(playerid,params[])
{
	new string[128],merker = true;
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			SendClientMessage(playerid,COLOR_WHITE,">>>>> {FF0000}Aktuelle Blitzer{FFFFFF} <<<<<");
		    for(new i=1;i<MAX_BLITZER;i++)
			{
				if(Blitzer[i][Erstellt] == true)
				{
					format(string,sizeof(string),"Blitzer %i | Richtgeschwindigkeit %i Km/h | Standort: %s | Erstellt von: %s",i,Blitzer[i][Geschwindigkeit],Blitzer[i][BlitzerOrt],Blitzer[i][Ersteller]);
					SendClientMessage(playerid,COLOR_YELLOW,string);
					merker = false;
				}
		  	}
		  	if(merker)
		  	{
			  	SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es wurden keine Blitzer errichtet.");
		  		return 1;
			}
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}

CMD:blitzerorten(playerid,params[])
{
	new bid;
    if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 7)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || GetPVarInt(playerid,"OAmtDuty") == 1)
		{
			if(sscanf(params,"d",bid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/blitzerorten [BlitzerID]");
		 	if(Blitzer[bid][Erstellt] == false)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Dieser Blitzer existiert nicht.");
			SetPlayerCheckpointEx(playerid,Blitzer[bid][oPosX],Blitzer[bid][oPosY],Blitzer[bid][oPosZ],3.5);
		 	SendClientMessage(playerid,COLOR_SUPER,"Der Blitzer wurde dir rot auf der Minimap markiert.");
			return 1;
  		}
  		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
  		return 1;
    }
    else NichtBerechtigt
	return 1;
}