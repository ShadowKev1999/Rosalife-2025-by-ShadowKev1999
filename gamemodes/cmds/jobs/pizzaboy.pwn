CMD:pizza(playerid, params[])
{
	if(!IsPlayerInRangeOfPoint(playerid,3.0,379.7354,-116.4596,1001.4922))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du befindest dich nicht am Pizza Punkt.");
 	if(SpielerInfo[playerid][sNebenjob] != 2)return NichtBerechtigt
  	if(GetPVarInt(playerid,"PizzaboteDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht als Pizzabote im Dienst.");
   	if(GetPVarInt(playerid,"PizzaTragen") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du kannst max. 5 Pizzen tragen.");
    if(GetPVarInt(playerid,"PizzaGeholt") == 1)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Liefere die Pizzen erst aus, um neue zu erhalten.");
    SetPVarInt(playerid,"PizzaGeholt",1);
    TogglePlayerControllable(playerid, false);
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_CARRY);
   	GameTextForPlayer(playerid, "~r~Bitte warten...", 10000, 5);
    KillTimer(PizzaBekommenTimer[playerid]);
    PizzaBekommenTimer[playerid] = SetTimerEx("PizzaBekommen",2000,true,"i",playerid);
    return 1;
}

CMD:ausliefern(playerid, params[])
{
	new tmpcar = GetPlayerVehicleID(playerid);
	if(SpielerInfo[playerid][sNebenjob] != 2)return NichtBerechtigt
 	if(GetPVarInt(playerid,"PizzaboteDuty") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du bist nicht als Pizzabote im Dienst.");
  	if(GetPVarInt(playerid,"PizzaTragen") != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Lege die Pizzen erst mit '/reinlegen' in den Kofferraum.");
   	if(GetPVarInt(playerid,"PizzaGeholt") == 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Geh in die Pizzaria und hole dir erst die Pizzen.");
    if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Dienstfahrzeug.");
    if(GetVehicleModel(tmpcar) != 589)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du sitzt in keinem Dienstfahrzeug.");
    if(GetPVarInt(playerid,"PizzaAusliefern") == 1)
	{
		SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Bringe die Pizza erst zum Kunden um eine neue Pizza ausliefern zu können.");
		SetPlayerCheckpointEx(playerid,PizzaKundenPos[playerid][0],PizzaKundenPos[playerid][1],PizzaKundenPos[playerid][2],2.5);
		return 1;
	}
	loop_start2:
 	for(new mf=1;mf<MAX_HAUSER;mf++)
  	{
   		new hs = 1+random(MAX_HAUSER);
     	if(HausInfo[hs][hsErstellt] == false || HausInfo[hs][hsOrt] != 1 || HausInfo[hs][hsID] == 0 || HausInfo[hs][hsID] == 90)goto loop_start2;
		PizzaKundenPos[playerid][0] = HausInfo[hs][hsPos_X];
		PizzaKundenPos[playerid][1] = HausInfo[hs][hsPos_Y];
		PizzaKundenPos[playerid][2] = HausInfo[hs][hsPos_Z];
		SetPlayerCheckpointEx(playerid,HausInfo[hs][hsPos_X],HausInfo[hs][hsPos_Y],HausInfo[hs][hsPos_Z],2.5);
		SendClientMessage(playerid,COLOR_SUPER,"[Info]: {FFFFFF}Bringe die Pizza jetzt zum Kunden. Der Kunde befindet sich am roten Marker.");
  		SetPVarInt(playerid,"PizzaAusliefern",1);
		return 1;
	}
 	return 1;
}