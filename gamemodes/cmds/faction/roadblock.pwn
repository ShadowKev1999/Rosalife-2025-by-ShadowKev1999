
CMD:nagelband(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			if(GetPlayerInterior(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst hier keine Nagelbänder errichten!");
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
   			if(NagelBandCount() == MAX_NAGELBAENDER)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es wurde bereits die maximal Anzahl an Nagelbändern erstellt!");
			AddNagelBand(playerid);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:nagelband("nb")
CMD:delnagelband(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
			RemoveNagelBand(playerid);
			return 1;
		}
		else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
		return 1;
	}
	else NichtBerechtigt
	return 1;
}
alias:delnagelband("dnb")
CMD:delallnagelband(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
 		if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
  			new string[128];
			RemoveAllNagelBand();
			foreach(new i : Player)
			{
				SendClientMessage(i,COLOR_BLUE, "");
				SendClientMessage(i,COLOR_BLUE, "_______[ Regierungsnachricht ]_______");
				format(string,sizeof(string),"%s %s hat alle Nagelbänder entfernt.",RangName(playerid),SpielerInfo[playerid][sName]);
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
alias:delallnagelband("danb")
CMD:delallsperre(playerid, params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6)
	{
		if(SpielerInfo[playerid][sRank] < 6)return NichtBerechtigt
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1)
		{
  			new string[128];
			RemoveAllSperre();
			foreach(new i : Player)
			{
				SendClientMessage(i,COLOR_BLUE, "");
				SendClientMessage(i,COLOR_BLUE, "_______[ Regierungsnachricht ]_______");
				format(string,sizeof(string),"%s %s hat alle Straßensperren entfernt.",RangName(playerid),SpielerInfo[playerid][sName]);
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

CMD:sperre(playerid,params[])
{
	if(SpielerInfo[playerid][sFraktion] == 2 || SpielerInfo[playerid][sFraktion] == 6 || SpielerInfo[playerid][sFraktion] == 5)
	{
		if(GetPVarInt(playerid,"CopDuty") == 1 || GetPVarInt(playerid,"FBIDuty") == 1 || SpielerInfo[playerid][sFraktion] == 5)
		{
			if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_GREY,"[Info]: Im Fahrzeug nicht möglich.");
			new sperre,Float:x,Float:y,Float:z,Float:a, string[80];
			if(SperreCount() == MAX_SPERREN)return SendClientMessage(playerid,COLOR_RED,"Es wurde bereits die maximale Anzahl an Straßensperren errichtet!");
			if(sscanf(params,"d",sperre))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /sperre [1-5]");
		    if(sperre<1||sperre>5)return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: /sperre [1-5]");
		    if(SpielerInfo[playerid][sFraktion] == 5 && sperre > 2)return SendClientMessage(playerid,COLOR_GREY,"[Info]: Rettungsdienstkräfte können nur die Sperren 1 und 2 nutzen.");
		    GetPlayerPos(playerid,x,y,z);
		  	GetPlayerFacingAngle(playerid,a);
			switch(sperre)
			{
				case 1:{AddSperre(playerid,1237,x,y,z-1,a);}
				case 2:{AddSperre(playerid,1459,x,y,z-0.5,a);}
				case 3:{AddSperre(playerid,1238,x,y,z-0.5,a);}
				case 4:{AddSperre(playerid,981,x,y,z-0.3,a);}
				case 5:{AddSperre(playerid,1422,x,y,z-0.7,a);}
			}
			format(string,sizeof(string),"* %s %s baut eine Sperre auf.",RangName(playerid),SpielerInfo[playerid][sName]);
			ProxDetector(12, playerid, string,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE,COLOR_PURPLE);
 		}
		else SendClientMessage(playerid,COLOR_GREY,"[Info]: Du bist nicht im Dienst.");
		return 1;
 	}
 	else NichtBerechtigt
	return 1;
}