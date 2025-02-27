CMD:animlist(playerid, params[])
{
	SendClientMessage(playerid,COLOR_RED,"|__ - {FF0000}"SERV_NAME" - Animationen{FFFFFF} - __|");
 	SendClientMessage(playerid,COLOR_WHITE,"/handsup, /dance[1-4], /wank, /lay, /sit, /ghand, /crossarms, /smoke, /chat, /laugh - Stop: /stopanim");
  	SendClientMessage(playerid,COLOR_WHITE,"/gsign1, /gsign2, /gsign3, /gsign4, /gsign5, /deal, /crack, /wave, /eat, /fucku, /chairsit");
   	SendClientMessage(playerid,COLOR_WHITE,"Benutze /stopanim um eine Animation zu stoppen.");
    return 1;
}
CMD:fucku(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"PED","fucku",4.0,false,false,false,false,0,SYNC_ALL);
  	return 1;
}
CMD:eat(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, false, false, false, false, 0, SYNC_ALL);
  	return 1;
}
CMD:wave(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "ON_LOOKERS", "wave_loop", 4.0, true, false, false, false, 0, SYNC_ALL);
  	return 1;
}
CMD:deal(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "DEALER", "DEALER_DEAL", 3.0, false, false, false, false, 0, SYNC_ALL);
  	return 1;
}
CMD:crack(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
	ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, true, false, false, false, 0, SYNC_ALL);
 	return 1;
}
CMD:handsup(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
	return 1;
}
CMD:sit(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
	ApplyAnimation(playerid,"BEACH", "ParkSit_M_loop", 4.0, true, false, false, false, 0, SYNC_ALL);
 	return 1;
}
CMD:chairsit(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
	ApplyAnimation(playerid,"PED","SEAT_down",4.1, true, true, true, true, 0, SYNC_ALL);
	return 1;
}
CMD:dance(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE1);
  	return 1;
}
CMD:dance2(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE2);
  	return 1;
}
CMD:dance3(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE3);
  	return 1;
}
CMD:dance4(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_DANCE4);
  	return 1;
}
CMD:stopanim(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "CARRY", "crry_prtial", 2.0, false, false, false, false, 0, SYNC_ALL);
  	ClearAnimations(playerid, SYNC_ALL);
	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_NONE);
   	return 1;
}
CMD:wank(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"PAULNMAC","wank_loop",4.0,true,true,true,true,0, SYNC_ALL);
  	return 1;
}
CMD:laugh(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, false, false, false, false, 0, SYNC_ALL);
  	return 1;
}
CMD:crossarms(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid, "COP_AMBIENT", "Coplook_loop", 4.0, false, true, true, true, -1, SYNC_ALL);
  	return 1;
}
CMD:lay(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"BEACH", "bather", 4.0, true, false, false, false, 0, SYNC_ALL);
  	return 1;
}
CMD:smoke(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"SMOKING", "M_smklean_loop", 4.0, true, false, false, false, 0);
  	return 1;
}
CMD:ghand(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"GHANDS","gsign2LH",4.0,false,true,true,true,1);
  	return 1;
}
CMD:gsign1(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
	ApplyAnimation(playerid,"GHANDS","gsign1",4.0,false,true,true,true,1);
 	return 1;
}
CMD:gsign2(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"GHANDS","gsign2",4.0,false,true,true,true,1);
  	return 1;
}
CMD:gsign3(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"GHANDS","gsign3",4.0,false,true,true,true,1);
  	return 1;
}
CMD:gsign4(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"GHANDS","gsign4",4.0,false,true,true,true,1);
  	return 1;
}
CMD:gsign5(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Animationen sind im Fahr/Flugzeug nicht verfügbar.");
 	ApplyAnimation(playerid,"GHANDS","gsign5",4.0,false,true,true,true,1);
  	return 1;
}