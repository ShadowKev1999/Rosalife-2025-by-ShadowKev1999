#define 	PACKAGE_MODEL   (2912)
#define     MAPICON_INDEX   (69)

enum    e_droplocations
{
    dropLocation[32],
	Float: dropX,
	Float: dropY,
	Float: dropZ
};

enum    e_dropobjects
{
	OBJECT_PACKAGE,
	OBJECT_ZONE
};

new
	DropLocations[][e_droplocations] = {
	// example locations
		{"Farm", 22.3, 17.4, 5.0},
		{"Area 51", 302.2160, 1955.8740, 17.6406},
		{"Flying School", 415.5471, 2503.8643, 16.9425},
		{"NSA HQ", -317.4946, 1523.1005, 75.3594}
	};

new
	bool: InDelivery[MAX_PLAYERS] = {false, ...},
	PackageCount[MAX_PLAYERS] = {5, ...},
	TraffickingObjects[MAX_PLAYERS][2];

stock IsATraffickingPlane(vehicleid)
{
    if(!IsValidVehicle(vehicleid)) return 0;
    if(FahrzeugInfo[vehicleid][fNebenjob] != 17) return 0;
	new planes[] = {593, 511, 460};
	for(new i; i < sizeof(planes); ++i)
	{
		if(planes[i] == GetVehicleModel(vehicleid)) return 1;
	}

	return 0;
}

stock ResetDelivery(playerid)
{
	if(!IsPlayerConnected(playerid)) return 0;
	InDelivery[playerid] = false;
	PackageCount[playerid] = 5;
	RemovePlayerMapIcon(playerid, MAPICON_INDEX);
	SetPVarInt(playerid, "DeliveryCooldown", tickcount()+120000);
	
	if(IsValidObject(TraffickingObjects[playerid][OBJECT_PACKAGE]))
	{
		DestroyObject(TraffickingObjects[playerid][OBJECT_PACKAGE]);
		TraffickingObjects[playerid][OBJECT_PACKAGE] = INVALID_OBJECT_ID;
	}

	if(IsValidPlayerObject(playerid, TraffickingObjects[playerid][OBJECT_ZONE]))
	{
		DestroyPlayerObject(playerid, TraffickingObjects[playerid][OBJECT_ZONE]);
		TraffickingObjects[playerid][OBJECT_ZONE] = INVALID_OBJECT_ID;
	}
	
	return 1;
}

AirTrafficking_OnPlayerConnect(playerid)
{
	InDelivery[playerid] = false;
	PackageCount[playerid] = 5;
	TraffickingObjects[playerid][OBJECT_PACKAGE] = INVALID_OBJECT_ID;
	TraffickingObjects[playerid][OBJECT_ZONE] = INVALID_OBJECT_ID;
	return 1;
}

AirTrafficking_OnPlayerDisconnect(playerid)
{
	ResetDelivery(playerid);
	return 1;
}

AirTrafficking_OnPlayerDeath(playerid)
{
    if(InDelivery[playerid])
	{
	    SendClientMessage(playerid, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Du bist gestorben.");
        ResetDelivery(playerid);
	}
	
	return 1;
}

AirTrafficking_OnPlayerStateChange(playerid, PLAYER_STATE:newstate)
{
	if(newstate == PLAYER_STATE_DRIVER && IsATraffickingPlane(GetPlayerVehicleID(playerid)) && GetPVarInt(playerid, "DeliveryCooldown") < tickcount())
	{
        GameTextForPlayer(playerid, "~n~~n~~n~~w~Fluglieferung~n~Druecke ~y~~k~~TOGGLE_SUBMISSIONS~ ~w~zum starten", 3000, 3);
	}
	
	return 1;
}

AirTrafficking_OnPlayerExitVehicle(playerid)
{
    if(InDelivery[playerid])
	{
	    SendClientMessage(playerid, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Du hast dein Flugzeug verlassen.");
        ResetDelivery(playerid);
	}
	
	return 1;
}

AirTrafficking_OnPlayerKeyStateChange(playerid, KEY:newkeys, KEY:oldkeys)
{
	if(IsATraffickingPlane(GetPlayerVehicleID(playerid)) && PRESSED(KEY_SUBMISSION))
	{
		if(!InDelivery[playerid]) {
		    if(GetPVarInt(playerid, "DeliveryCooldown") > tickcount()) return SendClientMessage(playerid, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Du kannst aktuell keine Fluglieferungen durchführen.");
			new id = random(sizeof(DropLocations)), string[144];
			TraffickingObjects[playerid][OBJECT_ZONE] = CreatePlayerObject(playerid, 19946, DropLocations[id][dropX], DropLocations[id][dropY], DropLocations[id][dropZ], 0.0, 0.0, 0.0, 1200.0);
            
			SetPlayerMapIcon(playerid, MAPICON_INDEX, DropLocations[id][dropX], DropLocations[id][dropY], DropLocations[id][dropZ], 24, 0, MAPICON_GLOBAL);
			SendClientMessage(playerid, 0x2ECC71FF, "FLUGLIEFERANT: {FFFFFF}Du hast die Lieferung begonnen.");
            format(string, sizeof(string), "FLUGLIEFERANT: {FFFFFF}Wirf ein Paket über dem markierten Bereich {3498DB}%s {FFFFFF}ab und du erhälst deinen Lohn.", DropLocations[id][dropLocation]);
            SendClientMessage(playerid, 0x2ECC71FF, string);
            SendClientMessage(playerid, 0x2ECC71FF, "FLUGLIEFERANT: {FFFFFF}Du kannst Pakete mit H/CAPS LOCK abwerfen.");
			SendClientMessage(playerid, 0x2ECC71FF, "FLUGLIEFERANT: {FFFFFF}Du kannst die Lieferung mit der Taste 2 oder beim Verlassen des Fahrzeugs abbrechen.");
			InDelivery[playerid] = true;
			PackageCount[playerid] = 5;
		}else{
		    SendClientMessage(playerid, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Du hast die Lieferung abgebrochen.");
			ResetDelivery(playerid);
		}
	}
	
	if(InDelivery[playerid] && PRESSED(KEY_CROUCH))
	{
	    if(IsValidObject(TraffickingObjects[playerid][OBJECT_PACKAGE])) return 1;
	    if(PackageCount[playerid] == 0) return SendClientMessage(playerid, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Du hast keine weiteren Pakete.");
		new Float: x, Float: y, Float: z, Float: z2;
		GetPlayerPos(playerid, x, y, z);
        CA_FindZ_For2DCoord(x, y, z2);
		TraffickingObjects[playerid][OBJECT_PACKAGE] = CreateObject(PACKAGE_MODEL, x, y, z-1.5, 0.0, 0.0, 0.0);
		MoveObject(TraffickingObjects[playerid][OBJECT_PACKAGE], x, y, z2, 20.0);
		PackageCount[playerid]--;
	}
	
	return 1;
}

AirTrafficking_OnObjectMoved(objectid)
{
	if(GetObjectModel(objectid) == PACKAGE_MODEL)
	{
		new owner = INVALID_PLAYER_ID;
		foreach(new i : Player)
		{
			if(objectid == TraffickingObjects[i][OBJECT_PACKAGE])
			{
				owner = i;
				break;
			}
		}
		
		new Float: objx, Float: objy, Float: objz, Float: zonex, Float: zoney, Float: zonez, money;
		GetObjectPos(objectid, objx, objy, objz);
		GetPlayerObjectPos(owner, TraffickingObjects[owner][OBJECT_ZONE], zonex, zoney, zonez);
		new Float: dist = Distance(objx, objy, objz, zonex, zoney, zonez);
		if(dist < 8.0) {
			money = 1500 + floatround(-100 * dist, floatround_floor);
			if(money < 250) money = 250;
			GivePlayerMoney(owner, money);

            SpielerInfo[owner][sPayDayGeld] += JobInfo[17][jiGehalt];
            GivePlayerEXP(owner, JobInfo[17][jiEXP]);

			new id = random(sizeof(DropLocations)), string[144];
			format(string, sizeof(string), "FLUGLIEFERANT: {FFFFFF}Du hast ein Paket abgeliefert, du erhälst {2ECC71}$%d{FFFFFF} am Zahltag und {2ECC71}%i{FFFFFF} Exp.", money, JobInfo[17][jiEXP]);
            SendClientMessage(owner, 0x2ECC71FF, string);
            
			DestroyPlayerObject(owner, TraffickingObjects[owner][OBJECT_ZONE]);
			TraffickingObjects[owner][OBJECT_ZONE] = CreatePlayerObject(owner, 19946, DropLocations[id][dropX], DropLocations[id][dropY], DropLocations[id][dropZ], 0.0, 0.0, 0.0, 1200.0);
			SetPlayerMapIcon(owner, 69, DropLocations[id][dropX], DropLocations[id][dropY], DropLocations[id][dropZ], 24, 0, MAPICON_GLOBAL);
            format(string, sizeof(string), "FLUGLIEFERANT: {FFFFFF}Wirf ein Paket über dem markierten Bereich {3498DB}%s{FFFFFF} ab.", DropLocations[id][dropLocation]);
            SendClientMessage(owner, 0x2ECC71FF, string);
            format(string, sizeof(string), "FLUGLIEFERANT: {FFFFFF}Verbleibende Pakete: {3498DB}%d{FFFFFF}.", PackageCount[owner]);
            SendClientMessage(owner, 0x2ECC71FF, string);
		}else{
            SendClientMessage(owner, 0xE74C3CFF, "FLUGLIEFERANT: {FFFFFF}Das Paket ist nicht im markierten Bereich gelandet, versuch es nochmal.");
		}
		
		DestroyObject(TraffickingObjects[owner][OBJECT_PACKAGE]);
		TraffickingObjects[owner][OBJECT_PACKAGE] = INVALID_OBJECT_ID;
		if(PackageCount[owner] == 0)
		{
		    SendClientMessage(owner, 0x2ECC71FF, "FLUGLIEFERANT: {FFFFFF}Du hast keine weiteren Pakete.");
			ResetDelivery(owner);
		}
	}
	
	return 1;
}