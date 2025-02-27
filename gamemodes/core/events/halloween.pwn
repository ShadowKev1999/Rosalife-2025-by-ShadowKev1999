
InitHalloweenEvent() {
    Halloween::Init();
    return 1;
}

ExitHalloweenEvent() {
    KillTimer(Halloween::Timer);
    for(new mobid = 0; mobid < MAX_HALLOWEEN_GIFTS; mobid++) DestroyDynamicPickup(Halloween::Pickup[mobid]);
    return 1;
}

stock Halloween::SetSpawnRectangle(Float:minx,Float:miny,Float:maxx,Float:maxy,bool:reset=true){
	Halloween::SpawnZoneType = 0;
	Halloween::SpawnZoneRectangle[0] = minx;
	Halloween::SpawnZoneRectangle[1] = miny;
	Halloween::SpawnZoneRectangle[2] = maxx;
	Halloween::SpawnZoneRectangle[3] = maxy;
	if(reset) Halloween::Reset();
	return 1;
}

stock Halloween::RandomCreate(giftid, bool:reset){
	new smodel = random(sizeof(HalloweenPickupModel)),Float:x,Float:y,Float:z;
	switch(Halloween::SpawnZoneType){
		case 0: {
			Tryg3D::GetPointInRectangle(Halloween::SpawnZoneRectangle[0],Halloween::SpawnZoneRectangle[1],Halloween::SpawnZoneRectangle[2],Halloween::SpawnZoneRectangle[3],x,y);
			while(Tryg3D::IsPointInWater(x,y,0.0)){
				Tryg3D::GetPointInRectangle(Halloween::SpawnZoneRectangle[0],Halloween::SpawnZoneRectangle[1],Halloween::SpawnZoneRectangle[2],Halloween::SpawnZoneRectangle[3],x,y);
			}
		}
	}
	ColAndreas::FindZ_For2DCoord(x,y,z);
	if(reset){
		Streamer::SetItemPos(STREAMER_TYPE_PICKUP,Halloween::Pickup[giftid],x,y,z+1.0);
		Streamer::SetIntData(STREAMER_TYPE_PICKUP,Halloween::Pickup[giftid],E_STREAMER_MODEL_ID,HalloweenPickupModel[smodel][0]);
	} else {
		Halloween::Pickup[giftid] = CreateDynamicPickup(HalloweenPickupModel[smodel][0],2,x,y,z+1.0,0,0);
	}
	return 1;
}

stock Halloween::Init(){
	if(!Tryg3D::IsColAndreasInit()){
		printf("[ADM] Error: Invalid ColAndreas Memory.");
		return 0;
	}
	Halloween::SetSpawnRectangle(-3000.0,-3000.0,3000.0,3000.0,false);
	for(new mobid = 0; mobid < MAX_HALLOWEEN_GIFTS; mobid++) Halloween::RandomCreate(mobid,false);
	Halloween::Timer = SetTimer("Halloween_Reset",REFRESH_HALLOWEEN_GIFTS,true);
	return 1;
}

T3D:function Halloween::Reset(){
	if(!Tryg3D::IsColAndreasInit()){
		printf("[ADM] Error: Invalid ColAndreas Memory.");
		return 0;
	}
	for(new mobid = 0; mobid < MAX_HALLOWEEN_GIFTS; mobid++) Halloween::RandomCreate(mobid,true);
	return 1;
}

Hallo_PlayerPickUpDynamicPickup(playerid, pickupid) {
	for(new mobid = 0; mobid < MAX_HALLOWEEN_GIFTS; mobid++){
		if(pickupid == Halloween::Pickup[mobid]){
			Halloween::RandomCreate(mobid,true);
			CallLocalFunction("OnHalloweenPickupReward","d",playerid);
			return 1;
		}
	}
	return 1;
}

forward OnHalloweenPickupReward(playerid);
public OnHalloweenPickupReward(playerid) {
    new amount = 0, string[128];
    switch(random(9)) {
        case 0: {
            amount = randomEx(1500, 5000);

            GivePlayerMoneyEx(playerid, amount);

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i $ erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
        case 1: {
            amount = randomEx(50, 150);

            GivePlayerEXP(playerid, amount);

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i EXP erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
        case 2: {
            SetPVarInt(playerid,"LevelUpTime",1);
		    SetTimerEx("LevelUpPlayer",1000,false,"i",playerid);

            amount = 1;

            format(string, sizeof(string), "{FF6600}HALLOWEEN: {FFFFFF}%s hat ein Halloween Pickup gefunden und %i Level erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 3: {
            amount = randomEx(5, 15);

            SpielerInfo[playerid][sDrogen] += amount;

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Drogen erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 4: {
            amount = randomEx(2, 10);

            SpielerInfo[playerid][sFeuerzeug] += amount;

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Feuerzeuge erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 5: {
            amount = randomEx(5, 15);

            SpielerInfo[playerid][sMaterialien] += amount;

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Materialien erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 6: {
            amount = 1;

            SpielerInfo[playerid][sPayDay] = 44;

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Payday erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 7: {
            amount = randomEx(5, 15);

            SpielerInfo[playerid][sRepairkit] += amount;

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Repairkits erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
		case 8: {
            amount = randomEx(50, 75);

            SetPlayerArmour(playerid, float(amount));

            format(string, sizeof(string), "{FF6600}HALLOWEEN:{FFFFFF} %s hat ein Halloween Pickup gefunden und %i Weste erhalten.", GetName(playerid), amount);
            SendClientMessageToAll(-1, string);
        }
    }
    return 1;
}