CMD:stopangeln(playerid, params[])
{
	if(GetPVarInt(playerid,"IstAmAngeln") < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist zurzeit nicht am angeln.");
 	KillTimer(FischTimer[playerid]);
  	SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Angeln beendet. Gefangene Fische kannst du hinten am Stand mit '/sellfish' verkaufen.");
   	ClearAnimations(playerid);
   	DeletePVar(playerid,"IstAmAngeln");
   	return 1;
}
CMD:sellfish(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,3.0,359.9088,-2031.9871,7.8359))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht am Fischstand am Steg von Los Santos.");
	if(SpielerInfo[playerid][sFischGewicht] < 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast keine Fische zum verkaufen.");
	GivePlayerMoneyEx(playerid,SpielerInfo[playerid][sFischGewicht] * 25);
	new string[128];
	format(string,sizeof(string),"[Info]: {FFFFFF}Du hast dein gefangenes Fischgewicht von %d Kilo für $%d verkauft.",SpielerInfo[playerid][sFischGewicht],SpielerInfo[playerid][sFischGewicht] * 25);
	SendClientMessage(playerid,COLOR_SUPER,string);
	SpielerInfo[playerid][sFischGewicht] = 0;
	return 1;
}
CMD:angeln(playerid, params[])
{
	if(GetPVarInt(playerid,"IstAmAngeln") > 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist bereits am Angeln.");
 	if(IsPlayerInRangeOfPoint(playerid,2.0,403.8289,-2088.7974,7.8359))
  	{
   		SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,403.8289,-2088.7974,7.8359);
      	SetPlayerFacingAngle(playerid,180.6706);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 1).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
   	}
    else if(IsPlayerInRangeOfPoint(playerid,2.0,398.7014,-2088.7983,7.8359))
    {
  		SetPVarInt(playerid,"IstAmAngeln",1);
  		SetPlayerPos(playerid,398.7014,-2088.7983,7.8359);
    	SetPlayerFacingAngle(playerid,180.2727);
     	SetCameraBehindPlayer(playerid);
      	ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
       	ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 2).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,396.1517,-2088.7983,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,396.1517,-2088.7983,7.8359);
      	SetPlayerFacingAngle(playerid,178.8467);
       	SetCameraBehindPlayer(playerid);
       	ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 3).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,391.0672,-2088.7976,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,391.0672,-2088.7976,7.8359);
      	SetPlayerFacingAngle(playerid,180.4716);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 4).");
	   	FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
  		return 1;
   	}
    else if(IsPlayerInRangeOfPoint(playerid,2.0,383.4083,-2088.7976,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,383.4083,-2088.7976,7.8359);
      	SetPlayerFacingAngle(playerid,180.2726);
       	SetCameraBehindPlayer(playerid);
       	ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 5).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,374.9251,-2088.7983,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,374.9251,-2088.7983,7.8359);
      	SetPlayerFacingAngle(playerid,179.7752);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 6).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,369.8544,-2088.7983,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,369.8544,-2088.7983,7.8359);
      	SetPlayerFacingAngle(playerid,179.9742);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 7).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,367.2825,-2088.7981,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,367.2825,-2088.7981,7.8359);
      	SetPlayerFacingAngle(playerid,179.2115);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 8).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,362.1932,-2088.7983,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,362.1932,-2088.7983,7.8359);
      	SetPlayerFacingAngle(playerid,179.7752);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 9).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else if(IsPlayerInRangeOfPoint(playerid,2.0,354.5322,-2088.7983,7.8359))
    {
    	SetPVarInt(playerid,"IstAmAngeln",1);
     	SetPlayerPos(playerid,354.5322,-2088.7983,7.8359);
      	SetPlayerFacingAngle(playerid,179.9410);
       	SetCameraBehindPlayer(playerid);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
        ApplyAnimation(playerid, "SAMP", "FishingIdle", 3.0,true,true,false,false,0);
   		SendClientMessage(playerid, COLOR_INFO, "[Info]: {FFFFFF}Benutze '/stopangeln' um mit dem Angeln aufzuhören (Angel 10).");
   		FischTimer[playerid] = SetTimerEx("SpielerFischt",10000,true,"i",playerid);
   		return 1;
    }
    else SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du stehst an keiner Angel am Steg von Los Santos.");
    return 1;
}
alias:angeln("fishing")