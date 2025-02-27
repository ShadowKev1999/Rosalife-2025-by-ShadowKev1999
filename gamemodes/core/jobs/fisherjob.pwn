//Core Fisherjob

stock FisherJobInit() {
    for(new i = 0; i < MAX_FISHING_TRAPS; i++) {
        fishingTrap[i][fTrapTimestamp] = -1;
        fishingTrap[i][fTrapPlayerUse] = INVALID_PLAYER_ID;
    }
    return 1;
}

stock FisherJob_OnPlayerConnect(playerid) {
    for(new i = 0; i < MAX_FISH_TYPES; i++) {
        fishingInv[playerid][i] = 0;
    }
    return 1;
}

stock FisherJob_PlayerDisconnect(playerid) {
    if(GetPVarInt(playerid, "FISHING_CP_ACTIVE")) {
        new cp = GetPVarInt(playerid, "FISHING_CP_ID");

        if(IsValidDynamicCP(cp)) {
            DestroyDynamicCP(cp);
        }

        DeletePVar(playerid, "FISHING_CP_ACTIVE");
        DeletePVar(playerid, "FISHING_CP_ID");
    }
    return 1;
}

stock GetFishingInvAmount(playerid) {
    new amount = 0;
    for(new i = 0; i < MAX_FISH_TYPES; i++) {
        amount += fishingInv[playerid][i];
    }
    return amount;
}

stock Float:GetNearestFishingTrap(playerid) {
    new Float:tempX, Float:tempY, Float:tempZ, Float:dist = 99999.00, Float:tempDist;
    GetPlayerPos(playerid, tempX, tempY, tempZ);
    for(new i = 0; i < MAX_FISHING_TRAPS; i++) {
        if(fishingTrap[i][fTrapTimestamp] == -1)continue;
        tempDist = GetDistanceBetweenPoints(tempX, tempY, tempZ, fishingTrap[i][fTrapX], fishingTrap[i][fTrapY], fishingTrap[i][fTrapZ]);
        if(tempDist < dist) {
            dist = tempDist;
        }
    }
    return dist;
}

task fisherTimer[60000]()
{
    for(new i = 0; i < MAX_FISHING_TRAPS; i++) {
        if(fishingTrap[i][fTrapTimestamp] != -1) {
            new timeStamp = (gettime() - fishingTrap[i][fTrapTimestamp]) / 60;
            if(timeStamp >= 30) continue;
            for(new t = 0; t < MAX_FISH_TYPES; t++) {
                new rand = random(100);

                if(rand < floatround(fishingTypes[t][fishingTypePercent])) {
                    rand = randomEx(1, fishingTypes[t][fishingTypeOccur]);
                    fishingTrap[i][fTrapFishes][t] += rand;
                }
            }
        }
    }
	return 1;
}

FisherJob_OnDialogResponse(playerid, dialogid, response, listitem)
{
    switch(dialogid)
    {
        case DIALOG_JOB_FISHING:
        {
            if(!response) return 1;

            if(GetPVarInt(playerid, "FISHING_BLOCKED")) return 1;

            if(listitem < MAX_FISHING_TRAPS)
            {
                if(fishingTrap[listitem][fTrapTimestamp] == -1)
                {
                    if(IsPlayerInRangeOfPoint(playerid, 250.0, 123.6412, -1869.3879, -0.3128)) {
                        new Float:tempDist = GetPlayerDistanceFromPoint(playerid, 123.6412, -1869.3879, -0.3128);
                        return SendClientMessage(playerid, -1, "{3366FF}Du musst dich 250 Meter vom Hafen entfernt befinden, um eine Reuse zu platzieren. (Aktuell: %i Meter)", floatround(tempDist));
                    }
                    if(fishingSkillDistance[GetPlayerJobSkill(playerid, 18)] < GetNearestFishingTrap(playerid))
                    {
                        if(fishingTrap[listitem][fTrapPlayerUse] != INVALID_PLAYER_ID) return SendClientMessage(playerid, -1, "{3366FF}Die angegebene Reuse wird bereits von einem Spieler bearbeitet.");
                        SetPVarInt(playerid, "FISHING_BLOCKED", 1);
                        fishingTrap[listitem][fTrapPlayerUse] = playerid;
                        SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.0);
                        TogglePlayerControllable(playerid, false);
   			            GameTextForPlayer(playerid, "~r~Bitte warten...", 5000, 5);
                        SetTimerEx("placeFishingTrap", 5000, false, "ii", playerid, listitem);
                        return 1;
                    } 
                    else 
                    {
                        SendClientMessage(playerid, -1, "{3366FF}Mit deinem Skill-Level %i kannst du die nächste Reuse erst in %i Metern Entfernung platzieren",
                        GetPlayerJobSkill(playerid, 18), floatround(fishingSkillDistance[GetPlayerJobSkill(playerid, 18)]));
                        return 1;
                    }
                } 
                else
                {
                    new tempTime = (gettime() - fishingTrap[listitem][fTrapTimestamp]) / 60;
                    if(tempTime >= 5)
                    {
                        new cp = CreateDynamicCP(fishingTrap[listitem][fTrapX], fishingTrap[listitem][fTrapY], fishingTrap[listitem][fTrapZ], 10.0, .streamdistance = 50000, .playerid = playerid);
                        Streamer_SetIntData(STREAMER_TYPE_CP, cp, E_STREAMER_EXTRA_ID, FISHING_TRAP_EXTRA_ID);
                        SendClientMessage(playerid, -1, "{3366FF}Reuse %i wurde auf der Karte zum Einziehen markiert.", listitem + 1);
                        SetPVarInt(playerid, "FISHING_SPOT", cp);
                        SetPVarInt(playerid, "FISHING_SPOT_ID", listitem);
                        SetPVarInt(playerid, "FISHING_CP_ACTIVE", 1);
                        SetPVarInt(playerid, "FISHING_CP_ID", cp);
                        return 1;
                    } 
                    else 
                    {
                        return SendClientMessage(playerid, -1, "{3366FF}Du kannst Reuse %i frühestens nach 5 Minuten einziehen.", listitem + 1);
                    }
                }
            }
            else if(listitem == MAX_FISHING_TRAPS)
            {
                new mainstring[618];
                for(new i = 0; i < MAX_FISH_TYPES; i++) {
                    format(mainstring, sizeof(mainstring), "%s\n%s: %i Stück", mainstring, fishingTypes[i][fishingTypeName], fishingInv[playerid][i]);
                }
                ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_MSGBOX, "{99CC00}RSL: {FFFFFF}Hochseefischer", mainstring, "Schließen", "");
            }
            else
            {
                new cp = CreateDynamicCP(123.6412, -1869.3879, -0.3128, 10.0, .streamdistance = 50000, .playerid = playerid);
                Streamer_SetIntData(STREAMER_TYPE_CP, cp, E_STREAMER_EXTRA_ID, FISHING_OUTPUT_ZONE);
                SendClientMessage(playerid, -1, "{3366FF}Der Abgabepunkt wurde markiert. Liefere deine gefangenen Fische am Hafen ab.");
                SetPVarInt(playerid, "FISHING_CP_ACTIVE", 1);
                SetPVarInt(playerid, "FISHING_CP_ID", cp);
            }
        }
    }
    return 1;
}

FishingJob_OnPlayerEnterDynamicCP(playerid, checkpointid) {
    if(Streamer_GetIntData(STREAMER_TYPE_CP, checkpointid, E_STREAMER_EXTRA_ID) == FISHING_TRAP_EXTRA_ID) {
        if(GetPVarInt(playerid, "FISHING_SPOT") == checkpointid) {
            new listitem = GetPVarInt(playerid, "FISHING_SPOT_ID");
            if(fishingTrap[listitem][fTrapPlayerUse] != INVALID_PLAYER_ID) {
                DestroyDynamicCP(checkpointid);
                DeletePVar(playerid, "FISHING_SPOT");
                DeletePVar(playerid, "FISHING_SPOT_ID");
                DeletePVar(playerid, "FISHING_BLOCKED");
                DeletePVar(playerid, "FISHING_CP_ACTIVE");
                DeletePVar(playerid, "FISHING_CP_ID");
                return SendClientMessage(playerid, -1, "{3366FF}Die angegebene Reuse wird bereits von einem Spieler bearbeitet.");
            }
            TogglePlayerControllable(playerid, false);
            GameTextForPlayer(playerid, "~r~Bitte warten...", 5000, 5);
            SetTimerEx("takeFishingTrap", 5000, false, "ii", playerid, listitem);
            fishingTrap[listitem][fTrapPlayerUse] = playerid;
            SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.0);
            DestroyDynamicCP(checkpointid);
            SetPVarInt(playerid, "FISHING_BLOCKED", 1);
            DeletePVar(playerid, "FISHING_CP_ACTIVE");
            DeletePVar(playerid, "FISHING_CP_ID");
        }
    } else if(Streamer_GetIntData(STREAMER_TYPE_CP, checkpointid, E_STREAMER_EXTRA_ID) == FISHING_OUTPUT_ZONE) {
        TogglePlayerControllable(playerid, false);
        GameTextForPlayer(playerid, "~r~Bitte warten...", 8000, 5);
        SetTimerEx("releaseFishing", 8000, false, "i", playerid);
        SetVehicleVelocity(GetPlayerVehicleID(playerid), 0.0, 0.0, 0.0);
        DestroyDynamicCP(checkpointid);
        SetPVarInt(playerid, "FISHING_BLOCKED", 1);
        DeletePVar(playerid, "FISHING_CP_ACTIVE");
        DeletePVar(playerid, "FISHING_CP_ID");
    }
    return 1;
}

forward placeFishingTrap(playerid, index);
public placeFishingTrap(playerid, index) {
    fishingTrap[index][fTrapPlayerUse] = INVALID_PLAYER_ID;

    if(!IsPlayerConnectedEx(playerid)) return 1;
    new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return 1;
	if(FahrzeugInfo[tmpcar][fNebenjob] != 18)return 1;

    TogglePlayerControllable(playerid, true);

    fishingTrap[index][fTrapTimestamp] = gettime();
    GetPlayerPos(playerid, fishingTrap[index][fTrapX], fishingTrap[index][fTrapY], fishingTrap[index][fTrapZ]);
    
    DeletePVar(playerid, "FISHING_BLOCKED");

    SendClientMessage(playerid, -1, "{3366FF}Du hast Reuse %i hier ausgelegt und kannst sie in frühestens 5 Minuten einziehen.", index + 1);
    return 1;
}

forward takeFishingTrap(playerid, index);
public takeFishingTrap(playerid, index) {
    fishingTrap[index][fTrapPlayerUse] = INVALID_PLAYER_ID;

    if(!IsPlayerConnectedEx(playerid)) return 1;
    new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return 1;
	if(FahrzeugInfo[tmpcar][fNebenjob] != 18)return 1;

    new fishInvAmount = GetFishingInvAmount(playerid), bool:fishMessage = false;

    SendClientMessage(playerid, -1, "{3366FF}Du hast Reuse %i erfolgreich eingezogen. Dein Fisch-Fang:", index + 1);
    for(new i = 0; i < MAX_FISH_TYPES; i++) {
        if(!fishingTrap[index][fTrapFishes][i]) continue;

        if(fishInvAmount + fishingTrap[index][fTrapFishes][i] >= fishingSkillInv[GetPlayerJobSkill(playerid, 18)]) {
            fishMessage = true;
            continue;
        }

        fishingInv[playerid][i] += fishingTrap[index][fTrapFishes][i];
        SendClientMessage(playerid, -1, "{3366FF}%s: %i",fishingTypes[i][fishingTypeName], fishingTrap[index][fTrapFishes][i]);
        fishingTrap[index][fTrapFishes][i] = 0;
    }
    if(fishMessage) SendClientMessage(playerid, -1, "{3366FF}Dein Fisch-Inventar ist voll. Liefere deinen gefangenen Fisch ab. Mit deinem aktuellen Skill-Level kannst du maximal %i Fische fangen.", fishingSkillInv[GetPlayerJobSkill(playerid, 18)]);
    TogglePlayerControllable(playerid, true);
    fishingTrap[index][fTrapTimestamp] = -1;
    DeletePVar(playerid, "FISHING_SPOT");
    DeletePVar(playerid, "FISHING_SPOT_ID");
    DeletePVar(playerid, "FISHING_BLOCKED");
    return 1;
}

forward releaseFishing(playerid);
public releaseFishing(playerid) {
    if(!IsPlayerConnectedEx(playerid)) return 1;
    new tmpcar = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid))return 1;
	if(FahrzeugInfo[tmpcar][fNebenjob] != 18)return 1;

    new amount, temp_money;

    for(new i = 0; i < MAX_FISH_TYPES; i++) {
        if(!fishingInv[playerid][i]) continue;
        temp_money += floatround(fishingInv[playerid][i] * fishingTypes[i][fishingTypeMoney]);

        SendClientMessage(playerid, -1, "{3366FF}%i %s für %i $", fishingInv[playerid][i], fishingTypes[i][fishingTypeName], temp_money);

        amount += temp_money;

        fishingInv[playerid][i] = 0;
    }

    DeletePVar(playerid, "FISHING_BLOCKED");

    SpielerInfo[playerid][sPayDayGeld] += amount;

    TogglePlayerControllable(playerid, true);

    SendClientMessage(playerid, -1, "{3366FF}Du hast deinen Fisch erfolgreich abgegeben, du erhälst %i $ zu deinem nächsten Payday!", amount);
    new randSkill = randomEx(3, 5);
    GivePlayerJobSkill(playerid, 18, randSkill);
    new randExp = randomEx(5, 18);
    GivePlayerEXP(playerid, randExp);
    SendClientMessage(playerid, -1, "{3366FF}Du hast für deine Arbeit %i EXP erhalten.", randExp);
    return 1;
}