
CMD:truck(playerid,params[])
{
	if(SpielerInfo[playerid][sNebenjob] < 16)return NichtBerechtigt
	new truckcmd[24];
	if(sscanf(params,"s[24]",truckcmd))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/truck [beladen|abladen|schmuggel]");
	new string[128], jobcar = GetPVarInt(playerid,"LSFDutyCar"), tmpcar = GetPlayerVehicleID(playerid);
	if(strcmp(truckcmd, "beladen", true, strlen(truckcmd)) == 0)
	{
	    if(GetPVarInt(playerid,"LSFDutyArbeitet") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze zunächst '/startjob'.");
	    if(tmpcar != jobcar)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt nicht in deinem Jobfahrzeug.");
	    if(!IsPlayerInRangeOfPoint(playerid,12.0, 2401.6890,-2674.8210,13.6659))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht bei der Anhänger-Ausgabe.");
        new Float:xPosVeh[3];
        if(GetPVarInt(playerid,"LSFDutyStep") > 0)
        {
            SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze '/truck abladen' um diese Tour zu beenden.");
			return 1;
        }
		else if(FahrzeugInfo[tmpcar][fTruckMats] > 0 && GetVehicleModel(FahrzeugInfo[tmpcar][fTruckMats]) > 0)
		{
		    GetVehiclePos(FahrzeugInfo[tmpcar][fTruckMats],xPosVeh[0],xPosVeh[1],xPosVeh[2]);
		    SetPlayerCheckpointEx(playerid,xPosVeh[0],xPosVeh[1],xPosVeh[2],4.5);
			SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast bereits einen Anhänger (Checkpoint gesetzt).");
			return 1;
		}
		GetVehiclePos(tmpcar,xPosVeh[0],xPosVeh[1],xPosVeh[2]);
	    new traitruck = CreateVehicle(435, xPosVeh[0]+2,xPosVeh[1]+2,xPosVeh[2]+2, 0.0, -1, -1, -1, false);
	    SetTimerEx("AttachTrailer", 1000, false, "ii", traitruck, GetPlayerVehicleID(playerid));
		format(string,sizeof(string),"Anhänger von {FE0000}%s{FFFFFF}",SpielerInfo[playerid][sName]);
	    FahrzeugInfo[traitruck][fLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF,xPosVeh[0],xPosVeh[1],xPosVeh[2], 20.0, INVALID_PLAYER_ID, traitruck);
	    FahrzeugInfo[tmpcar][fTruckMats] = traitruck;
	    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Anhänger gespawnt. Fahre nun zur Fabrik und benutze dort '/truck abladen'.");
	    SetPlayerCheckpointEx(playerid, 2553.9133,-8456.9316,13.8301, 5.0);
	}
	else if(strcmp(truckcmd, "schmuggel", true, strlen(truckcmd)) == 0)
	{
	    if(GetPVarInt(playerid,"LSFDutyArbeitet") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze zunächst '/startjob'.");
	    if(tmpcar != jobcar)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt nicht in deinem Jobfahrzeug.");
	    if(!IsPlayerInRangeOfPoint(playerid,12.0, 2401.6890,-2674.8210,13.6659))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht bei der Anhänger-Ausgabe.");
	    if(FahrzeugInfo[tmpcar][fTruckMats] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast noch keinen Anhänger.");
		if(GetPVarInt(playerid,"LSFSchmuggel") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast bereits Schmuggelware dabei.");
		SetPVarInt(playerid,"LSFSchmuggel",1);
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Du hast Schmuggelware für die Mitarbeiter der Ölfabrik in Form von Zigaretten und alkoholischen Getränken mitgenommen.");
		SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Dein Arbeitgeber bietet dir keinen Schutz. Wenn du erwischt wirst, zieht das Strafen für dich mit sich.");
		SetPlayerCheckpointEx(playerid, 2553.9133,-8456.9316,13.8301, 5.0);
		return 1;
	}
	else if(strcmp(truckcmd, "abladen", true, strlen(truckcmd)) == 0)
	{
	    if(GetPVarInt(playerid,"LSFDutyArbeitet") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Benutze zunächst '/startjob'.");
	    if(tmpcar != jobcar)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt nicht in deinem Jobfahrzeug.");
	    if(GetPVarInt(playerid,"LSFDutyStep") < 1)
	    {
		    if(!IsPlayerInRangeOfPoint(playerid,12.0, 2553.7888,-8456.8926,13.8301))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht bei der Ölfabrik.");
		    if(FahrzeugInfo[tmpcar][fTruckMats] < 1)return SendClientMessage(playerid,COLOR_RED,"{FFFFFF}Du hast keinen Anhänger an der Anhänger-Ausgabe geholt.");
		    new Float:xPosVeh[3];
		    GetVehiclePos(tmpcar,xPosVeh[0],xPosVeh[1],xPosVeh[2]);
		    new trailerid = GetVehicleTrailer(tmpcar);
		    if(trailerid < 1)return SendClientMessage(playerid,COLOR_RED,"{FFFFFF}Du hast keinen Anhänger dabei.");
		    DestroyDynamic3DTextLabel(FahrzeugInfo[trailerid][fLabel]);
			FahrzeugInfo[trailerid][fLabel] = Text3D:INVALID_3DTEXT_ID;
		    DetachTrailerFromVehicle(tmpcar);
		    DestroyVehicle(trailerid);
		    new traitruck = CreateVehicle(584, xPosVeh[0]+3,xPosVeh[1]-1,xPosVeh[2]+2, 0.0, -1, -1, -1, false);
		    format(string,sizeof(string),"Anhänger von {FE0000}%s{FFFFFF}",SpielerInfo[playerid][sName]);
		    FahrzeugInfo[traitruck][fLabel] = CreateDynamic3DTextLabel(string, 0xFFFFFFFF, xPosVeh[0],xPosVeh[1],xPosVeh[2], 20.0, INVALID_PLAYER_ID, traitruck);
		    SetTimerEx("AttachTrailer", 1000, false, "ii", traitruck, GetPlayerVehicleID(playerid));
		    SetPlayerCheckpointEx(playerid, 2401.8530,-2674.6416,13.6662, 5.0);
		    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast den alten Anhänger abgegeben und einen neuen aufgeladen.");
		    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Bringe den neuen Anhänger zur Anhänger-Ausgabe und benutze dort wieder '/truck abladen'.");
		    SetPVarInt(playerid,"LSFDutyStep",1);
		    FahrzeugInfo[tmpcar][fTruckMats] = traitruck;
		    if(GetPVarInt(playerid,"LSFSchmuggel") > 0)
		    {
		        SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast für deine Schmuggelware 1.000$ in BAR von den Mitarbeitern bekommen.");
		        GivePlayerMoneyEx(playerid,1000);
		        DeletePVar(playerid,"LSFSchmuggel");
		    }
		}
		else
		{
		    if(!IsPlayerInRangeOfPoint(playerid,12.0, 2401.6890,-2674.8210,13.6659))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht bei der Anhänger-Ausgabe.");
		    new trailerid = GetVehicleTrailer(tmpcar);
		    if(trailerid < 1)return SendClientMessage(playerid,COLOR_RED,"{FFFFFF}Du hast keinen Anhänger dabei.");
		    DetachTrailerFromVehicle(tmpcar);
		    DestroyDynamic3DTextLabel(FahrzeugInfo[trailerid][fLabel]);
			FahrzeugInfo[trailerid][fLabel] = Text3D:INVALID_3DTEXT_ID;
		    DestroyVehicle(trailerid);
		    SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Du hast deine Tour erledigt. Fahre weiter oder beende deinen Dienst.");
		    DeletePVar(playerid,"LSFDutyStep");
            format(string,sizeof(string),"Dein Gehalt in Höhe von %d$ wird dir am Payday überwiesen. Benutze /payday um deinen Check einzusehen.",JobInfo[16][jiGehalt]);
      		SendClientMessage(playerid,COLOR_INFO,string);
      		SpielerInfo[playerid][sPayDayGeld] += JobInfo[16][jiGehalt];
      		GivePlayerEXP(playerid,JobInfo[16][jiEXP]);
      		FahrzeugInfo[tmpcar][fTruckMats] = 0;
		}
	}
	return 1;
}