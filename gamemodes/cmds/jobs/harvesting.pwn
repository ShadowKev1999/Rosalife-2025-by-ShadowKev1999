CMD:aufsammeln(playerid, params[])
{
	if(SpielerInfo[playerid][sNebenjob] != 7)return NichtBerechtigt
 	if(GetPVarInt(playerid,"LandwirtStufe") != 3)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Es befinden sich noch nicht genug Heuballen auf dem Feld.");
  	if(GetPVarInt(playerid,"LandwirtHatWalton") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Besorg dir erst einen Walton, um die Heuballen aufheben zu können.");
   	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Im Fahrzeug nicht möglich.");
	if(!AmHeuballen(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist an keinem Heuballen.");
	if(GetPVarInt(playerid,"HatHeuballen") == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst immer nur einen Heuballen tragen.");
	new ballenid = GetHeuballen(playerid);
	if(LandwirtObjekt[playerid][ballenid] == 0)return 1;
	new Float:x,Float:y,Float:z, vehid = GetPVarInt(playerid,"LandwirtAuto");
	GetXYInFrontOfVehicle(vehid,x,y,z,-2.02);
	SetPVarInt(playerid,"HatHeuballen",1);
	SetPVarInt(playerid,"HeuballenID",ballenid);
 	DestroyDynamicObject(LandwirtObjekt[playerid][ballenid]);
  	LandwirtObjekt[playerid][ballenid] = -1;
   	SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
    SetPlayerAttachedObject(playerid,ATTACH_INDEX_JOB,2901,6,0.055999,0.055999,-0.334999,-40.699996,87.699966,14.099964,1.000000,1.000000,1.000000);
	SetPlayerCheckpointEx(playerid,x,y,z,2.0);
	WaltonKofferraumPos[vehid][0] = x;
 	WaltonKofferraumPos[vehid][1] = y;
  	WaltonKofferraumPos[vehid][2] = z;
	return 1;
}