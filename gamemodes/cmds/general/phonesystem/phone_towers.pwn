COMMAND:addtmast(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
	if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(GetPlayerInterior(playerid) != 0)return SendClientMessage(playerid,COLOR_RED,"Du kannst hier keine Telefonmasten aufstellen!");
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"Im Fahrzeug nicht möglich.");
    if(TMastenCount() == MAX_MASTEN)return SendClientMessage(playerid,COLOR_RED,"Es wurde bereits die maximal Anzahl an Funkmasten erstellt!");
    if(ReturnHempfangRate(playerid) != -1)return SendClientMessage(playerid,COLOR_RED,"Es befindet sich schon im Umkreis von 600 Metern ein Funkmast.");
	if((FrakInfo[SpielerInfo[playerid][sFraktion]][fiFrakKasse] - MAX_TMASTENPRICE) < 0)return SendClientMessage(playerid,COLOR_RED,"Eure Fraktionskasse besitzt nicht so viel Geld.("#MAX_TMASTENPRICE"$)");
	CreateTmasten(playerid);
  	return 1;
}

COMMAND:deltmast(playerid,params[])
{
    if(SpielerInfo[playerid][sFraktion] != 8)return NichtBerechtigt
	if(GetPVarInt(playerid,"SanNewsDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht im Dienst.");
	if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid, COLOR_RED, "Im Fahrzeug nicht m?glich.");
	DeleteTMasten(playerid);
  	return 1;
}