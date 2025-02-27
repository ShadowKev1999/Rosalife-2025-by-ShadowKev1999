GetClosestTree(playerid, Float: range = 2.0) {
	new id = -1, Float: dist = range, Float: tempdist;
	foreach(new i : Trees) {
	    tempdist = GetPlayerDistanceFromPoint(playerid, TreeData[i][treeX], TreeData[i][treeY], TreeData[i][treeZ]);

	    if(tempdist > range) continue;
		if(tempdist <= dist) {
			dist = tempdist;
			id = i;
		}
	}

	return id;
}

GetClosestLog(playerid, Float: range = 2.0) {
	new id = -1, Float: dist = range, Float: tempdist, Float: pos[3];
	foreach(new i : Logs) {
		GetDynamicObjectPos(LogData[i][logObjID], pos[0], pos[1], pos[2]);
	    tempdist = GetPlayerDistanceFromPoint(playerid, pos[0], pos[1], pos[2]);

	    if(tempdist > range) continue;
		if(tempdist <= dist) {
			dist = tempdist;
			id = i;
		}
	}

	return id;
}

IsPlayerNearALogBuyer(playerid) {
	foreach(new i : Buyers) {
	    if(IsPlayerInRangeOfPoint(playerid, 2.0, BuyerData[i][buyerX], BuyerData[i][buyerY], BuyerData[i][buyerZ])) return 1;
	}
	return 0;
}

Log_Player_Init(playerid) {
    CuttingTreeID[playerid] = -1;
    CuttingTimer[playerid] = -1;
	CarryingLog[playerid] = false;
    EditingTreeID[playerid] = -1;
    
    CuttingBar[playerid] = CreatePlayerProgressBar(playerid, 498.0, 104.0, 113.0, 6.2, 0x61381BFF, LOG_CUTTING_TIME, BAR_DIRECTION_RIGHT);
	return 1;
}

Player_ResetCutting(playerid) {
	if(!IsPlayerConnectedEx(playerid) || CuttingTreeID[playerid] == -1) return 0;
	new id = CuttingTreeID[playerid];
	TreeData[id][treeGettingCut] = false;
	if(TreeData[id][treeSeconds] < 1) Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[id][treeLabel], E_STREAMER_COLOR, 0x2ECC71FF);
	
    RemovePlayerWeapon(playerid, WEAPON_CHAINSAW);
	ClearAnimations(playerid);
    TogglePlayerControllable(playerid, true);
    CuttingTreeID[playerid] = -1;
    
    if(CuttingTimer[playerid] != -1) {
	    KillTimer(CuttingTimer[playerid]);
		CuttingTimer[playerid] = -1;
	}
	
	SetPlayerProgressBarValue(playerid, CuttingBar[playerid], 0.0);
	HidePlayerProgressBar(playerid, CuttingBar[playerid]);
	return 1;
}

Player_GiveLog(playerid) {
    if(!IsPlayerConnectedEx(playerid)) return 0;
	CarryingLog[playerid] = true;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
	SetPlayerAttachedObject(playerid, LOG_ATTACH_INDEX, 19793, 6, 0.077999, 0.043999, -0.170999, -13.799953, 79.70, 0.0);
	
	SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Nutze {F1C40F}~k~~CONVERSATION_NO~ {FFFFFF}, um den Holzstamm fallenzulassen.");
	return 1;
}

Player_DropLog(playerid, death_drop = 0) {
    if(!IsPlayerConnectedEx(playerid) || !CarryingLog[playerid]) return 0;
    new id = Iter_Free(Logs);
    if(id != -1)
    {
        new Float: x, Float: y, Float: z, Float: a, label[256];
        GetPlayerPos(playerid, x, y, z);
        GetPlayerFacingAngle(playerid, a);
        GetPlayerName(playerid, LogData[id][logDroppedBy], MAX_PLAYER_NAME);

		if(!death_drop)
		{
		    x += (1.0 * floatsin(-a, degrees));
			y += (1.0 * floatcos(-a, degrees));
			
			ApplyAnimation(playerid, "CARRY", "putdwn05", 4.1, false, true, true, false, 0, SYNC_ALL);
		}

		LogData[id][logSeconds] = LOG_LIFETIME;
		LogData[id][logObjID] = CreateDynamicObject(19793, x, y, z - 0.9, 0.0, 0.0, a);
		
		format(label, sizeof(label), "Log (%d)\n\n{FFFFFF}Fallen gelassen von {F1C40F}%s\n{FFFFFF}%s\nNutze {F1C40F}/log take {FFFFFF}, um ihn aufzuheben.", id, LogData[id][logDroppedBy], ConvertToMinutes(LOG_LIFETIME));
		LogData[id][logLabel] = CreateDynamic3DTextLabel(label, 0xF1C40FFF, x, y, z - 0.7, 5.0, .testlos = 1);
		
		LogData[id][logTimer] = SetTimerEx("RemoveLog", 1000, true, "i", id);
		Iter_Add(Logs, id);
    }
    
    Player_RemoveLog(playerid);
	return 1;
}

Player_RemoveLog(playerid) {
	if(!IsPlayerConnectedEx(playerid) || !CarryingLog[playerid]) return 0;
	RemovePlayerAttachedObject(playerid, LOG_ATTACH_INDEX);
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
	CarryingLog[playerid] = false;
	return 1;
}

Vehicle_LogCount(vehicleid) {
	if(GetVehicleModel(vehicleid) == 0) return 0;
	new count;
	for(new i; i < LOG_LIMIT; i++) if(IsValidDynamicObject(LogObjects[vehicleid][i])) count++;
	return count;
}

Vehicle_RemoveLogs(vehicleid) {
    if(GetVehicleModel(vehicleid) == 0) return 0;
    for(new i; i < LOG_LIMIT; i++) {
	    if(IsValidDynamicObject(LogObjects[vehicleid][i])) {
	        DestroyDynamicObject(LogObjects[vehicleid][i]);
	        LogObjects[vehicleid][i] = -1;
	    }
	}
	
	return 1;
}

Tree_BeingEdited(id) {
	if(!Iter_Contains(Trees, id)) return 0;
	foreach(new i : Player) if(EditingTreeID[i] == id) return 1;
	return 0;
}

Tree_UpdateLogLabel(id) {
    if(!Iter_Contains(Trees, id)) return 0;
    new label[256];
    
    if(TreeData[id][treeLogs] > 0) {
	    format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}Holzstämme: {F1C40F}%d\n{FFFFFF}Nutze {F1C40F}/log takefromtree {FFFFFF}um einen Holzstamm zu tragen.", id, TreeData[id][treeLogs]);
		UpdateDynamic3DTextLabelText(TreeData[id][treeLabel], 0xE74C3CFF, label);
	}else{
	    TreeData[id][treeTimer] = SetTimerEx("RespawnTree", 1000, true, "i", id);
	    
	    format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}%s", id, ConvertToMinutes(TreeData[id][treeSeconds]));
		UpdateDynamic3DTextLabelText(TreeData[id][treeLabel], 0xE74C3CFF, label);
	}
	return 1;
}

Log_ScriptInit()
{
    print("  [Holzfaeller] Initializing...");
    
    // assign default values to variables
	for(new i; i < MAX_TREES; i++)
	{
		TreeData[i][treeObjID] = TreeData[i][treeTimer] = -1;
		TreeData[i][treeLabel] = Text3D: -1;
	}
	
	for(new i; i < MAX_LOGS; i++)
	{
	    LogData[i][logObjID] = LogData[i][logTimer] = -1;
	    LogData[i][logLabel] = Text3D: -1;
	}
	
	for(new i; i < MAX_BUYERS; i++)
	{
	    BuyerData[i][buyerActorID] = -1;
	    BuyerData[i][buyerLabel] = Text3D: -1;
	}
	
	for(new i; i < MAX_VEHICLES; i++) for(new x; x < LOG_LIMIT; x++) LogObjects[i][x] = -1;
	
	// open database & create tables
	mysql_tquery(sqlHandle, "CREATE TABLE IF NOT EXISTS `wood_trees` (`ID` INT(12) NOT NULL , `PosX` FLOAT NOT NULL , `PosY` FLOAT NOT NULL , \
                            `PosZ` FLOAT NOT NULL , `RotX` FLOAT NOT NULL , `RotY` FLOAT NOT NULL , `RotZ` FLOAT NOT NULL , \
                            UNIQUE `ID` (`ID`)) ENGINE = InnoDB;");
	
	// load trees & load buyers
    mysql_tquery(sqlHandle, "SELECT * FROM `wood_trees`;", "onServerLoadedWoodTress");
	mysql_tquery(sqlHandle, "SELECT * FROM `wood_buyers`;", "onServerLoadedWoodBuyers");
	
	return 1;
}

forward onServerLoadedWoodBuyers();
public onServerLoadedWoodBuyers() {
    new label[256], rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {

            new skin, id, Float: bpos[4];
            cache_get_value_name_int(i, "ID", id);
            cache_get_value_name_int(i, "Skin", skin);
            cache_get_value_name_float(i, "PosX", bpos[0]);
            cache_get_value_name_float(i, "PosY", bpos[1]);
            cache_get_value_name_float(i, "PosZ", bpos[2]);
            cache_get_value_name_float(i, "PosA", bpos[3]);

            BuyerData[id][buyerSkin] = skin;
		 	BuyerData[id][buyerX] = bpos[0];
		  	BuyerData[id][buyerY] = bpos[1];
	        BuyerData[id][buyerZ] = bpos[2];
		 	BuyerData[id][buyerA] = bpos[3];

		    BuyerData[id][buyerActorID] = CreateActor(BuyerData[id][buyerSkin], BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA]);
            SetActorInvulnerable(BuyerData[id][buyerActorID], true);

			format(label, sizeof(label), "Holzkäufer (%d)\n\n{FFFFFF}Nutze {F1C40F}/chainsaw {FFFFFF}, um eine Kettensäge für {2ECC71}$%d{FFFFFF} zu kaufen.\n{FFFFFF}Nutze {F1C40F}/log sell{FFFFFF}, um einen Baumstamm für {2ECC71}$%d{FFFFFF} zu verkaufen.", id, CSAW_PRICE, LOG_PRICE);
			BuyerData[id][buyerLabel] = CreateDynamic3DTextLabel(label, 0xF1C40FFF, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ] + 0.25, 5.0, .testlos = 1);

			Iter_Add(Buyers, id);
        }
    }
    printf("  [Holzfaeller] Loaded %d wood buyers.", Iter_Count(Buyers));
    return 1;
}

forward onServerLoadedWoodTress();
public onServerLoadedWoodTress() {
    new rows;
    cache_get_row_count(rows);
    new label[256];
    if(rows) {
        for(new i = 0; i < rows; i++) {

            new id, Float: pos[3], Float: rot[3];
            cache_get_value_name_int(i, "ID", id);
            cache_get_value_name_float(i, "PosX", pos[0]);
            cache_get_value_name_float(i, "PosY", pos[1]);
            cache_get_value_name_float(i, "PosZ", pos[2]);
            cache_get_value_name_float(i, "RotX", rot[0]);
            cache_get_value_name_float(i, "RotY", rot[1]);
            cache_get_value_name_float(i, "RotZ", rot[2]);

            TreeData[id][treeX] = pos[0];
		 	TreeData[id][treeY] = pos[1];
		  	TreeData[id][treeZ] = pos[2];
	        TreeData[id][treeRX] = rot[0];
		 	TreeData[id][treeRY] = rot[1];
		  	TreeData[id][treeRZ] = rot[2];

		    TreeData[id][treeObjID] = CreateDynamicObject(657, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ], TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);
			
			format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}Nutze {F1C40F}~k~~CONVERSATION_NO~ {FFFFFF}, um den Baum zu fällen.", id);
			TreeData[id][treeLabel] = CreateDynamic3DTextLabel(label, 0x2ECC71FF, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ] + 1.5, 5.0);

			Iter_Add(Trees, id);
        }
    }
    printf("  [Holzfaeller] Loaded %d wood trees.", Iter_Count(Trees));
    return 1;
}

Log_ScriptExit()
{
	foreach(new i : Player)
	{
	    Player_ResetCutting(i);
		Player_RemoveLog(i);
		
		DestroyPlayerProgressBar(i, CuttingBar[i]);
	}
	
	foreach(new i : Buyers) DestroyActor(BuyerData[i][buyerActorID]);
	
	print("  [Holzfaeller] Unloaded.");
	return 1;
}

Log_PlayerConnect(playerid)
{
	Log_Player_Init(playerid);
	return 1;
}

Log_PlayerDisconnect(playerid)
{
	Player_ResetCutting(playerid);
	Player_RemoveLog(playerid);
	
	EditingTreeID[playerid] = -1;
	return 1;
}

Log_VehicleSpawn(vehicleid)
{
	Vehicle_RemoveLogs(vehicleid);
	return 1;
}

Log_VehicleDeath(vehicleid)
{
	Vehicle_RemoveLogs(vehicleid);
	return 1;
}

Log_PlayerDeath(playerid)
{
    Player_ResetCutting(playerid);
    Player_DropLog(playerid, 1);
	return 1;
}

Log_PlayerStateChange(playerid, PLAYER_STATE:newstate)
{
	if(newstate != PLAYER_STATE_WASTED)
	{
	    Player_ResetCutting(playerid);
	    Player_RemoveLog(playerid);
	}
	
	return 1;
}

Log_PlayerKeyStateChange(playerid, KEY:newkeys)
{
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
	    if(CarryingLog[playerid]) return Player_DropLog(playerid);
	    
	    if(SpielerInfo[playerid][sChainsaw] && CuttingTreeID[playerid] == -1 && !CarryingLog[playerid])
	    {
		    new id = GetClosestTree(playerid);

		    if(id != -1)
		    {
		        if(!Tree_BeingEdited(id) && !TreeData[id][treeGettingCut] && TreeData[id][treeSeconds] < 1)
				{
		            SetPlayerLookAt(playerid, TreeData[id][treeX], TreeData[id][treeY]);

		            Streamer_SetIntData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[id][treeLabel], E_STREAMER_COLOR, 0xE74C3CFF);
		            CuttingTimer[playerid] = SetTimerEx("CutTree", 1000, true, "i", playerid);
					CuttingTreeID[playerid] = id;
					SetPlayerProgressBarValue(playerid, CuttingBar[playerid], 0.0);
					ShowPlayerProgressBar(playerid, CuttingBar[playerid]);
					TogglePlayerControllable(playerid, false);
                    GivePlayerWeapon(playerid, WEAPON_CHAINSAW, 1);
					SetPlayerArmedWeapon(playerid, WEAPON_CHAINSAW);
					ApplyAnimation(playerid, "CHAINSAW", "WEAPON_csaw", 4.1, true, false, false, true, 0, SYNC_ALL);

					TreeData[id][treeGettingCut] = true;
		        }
		    }
	    }
	}

	return 1;
}

Log_OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(EditingTreeID[playerid] != -1 && Iter_Contains(Trees, EditingTreeID[playerid]))
	{
	    if(response == 1)
	    {
	        new id = EditingTreeID[playerid];
	        TreeData[id][treeX] = x;
	        TreeData[id][treeY] = y;
	        TreeData[id][treeZ] = z;
	        TreeData[id][treeRX] = rx;
	        TreeData[id][treeRY] = ry;
	        TreeData[id][treeRZ] = rz;

	        SetDynamicObjectPos(objectid, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[id][treeLabel], E_STREAMER_X, TreeData[id][treeX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[id][treeLabel], E_STREAMER_Y, TreeData[id][treeY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, TreeData[id][treeLabel], E_STREAMER_Z, TreeData[id][treeZ] + 1.5);

            new query[256];
            mysql_format(sqlHandle, query, sizeof(query), "UPDATE `wood_trees` SET `PosX` = %f, `PosY` = %f, `PosZ` = %f, `RotX` = %f, `RotY` = %f, `RotZ` = %f WHERE `ID` = %i",
            TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ], TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ], id);
            mysql_tquery(sqlHandle, query);

	        EditingTreeID[playerid] = -1;
	    }

	    if(response == 0)
	    {
	        new id = EditingTreeID[playerid];
	        SetDynamicObjectPos(objectid, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ]);
	        SetDynamicObjectRot(objectid, TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);
	        EditingTreeID[playerid] = -1;
	    }
	}

	return 1;
}

forward CutTree(playerid);
public CutTree(playerid)
{
    if(CuttingTreeID[playerid] != -1)
	{
	    new id = CuttingTreeID[playerid], Float: value = GetPlayerProgressBarValue(playerid, CuttingBar[playerid]) + 1.0;
	    
		if(value >= LOG_CUTTING_TIME) {
		    Player_ResetCutting(playerid);
			MoveDynamicObject(TreeData[id][treeObjID], TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ] + 0.03, 0.025, TreeData[id][treeRX], TreeData[id][treeRY] - 80.0, TreeData[id][treeRZ]);

			TreeData[id][treeLogs] = 5;
			TreeData[id][treeSeconds] = TREE_RESPAWN;
			Tree_UpdateLogLabel(id);
		}else{
		    SetPlayerProgressBarValue(playerid, CuttingBar[playerid], value);
		}
	}

	return 1;
}

forward RespawnTree(id);
public RespawnTree(id)
{
	new label[256];
	if(TreeData[id][treeSeconds] > 1) {
	    TreeData[id][treeSeconds]--;
	    
	    format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}%s", id, ConvertToMinutes(TreeData[id][treeSeconds]));
		UpdateDynamic3DTextLabelText(TreeData[id][treeLabel], 0xE74C3CFF, label);
	}else if(TreeData[id][treeSeconds] == 1) {
	    KillTimer(TreeData[id][treeTimer]);

	    TreeData[id][treeLogs] = 0;
	    TreeData[id][treeSeconds] = 0;
	    TreeData[id][treeTimer] = -1;
	    
	    SetDynamicObjectPos(TreeData[id][treeObjID], TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ]);
     	SetDynamicObjectRot(TreeData[id][treeObjID], TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);
     	
     	format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}Nutze {F1C40F}~k~~CONVERSATION_NO~ {FFFFFF}, um den Baum zu fällen.", id);
     	UpdateDynamic3DTextLabelText(TreeData[id][treeLabel], 0x2ECC71FF, label);
	}
	
	return 1;
}

forward RemoveLog(id);
public RemoveLog(id)
{
	if(!Iter_Count(Logs, id)) return 1;
	
	if(LogData[id][logSeconds] > 1) {
	    LogData[id][logSeconds]--;

        new label[256];
	    format(label, sizeof(label), "Baumstamm (%d)\n\n{FFFFFF}Fallen gelassen von {F1C40F}%s\n{FFFFFF}%s\nNutze {F1C40F}/log take {FFFFFF}, um ihn aufzuheben.", id, LogData[id][logDroppedBy], ConvertToMinutes(LogData[id][logSeconds]));
		UpdateDynamic3DTextLabelText(LogData[id][logLabel], 0xF1C40FFF, label);
	}else if(LogData[id][logSeconds] == 1) {
	    KillTimer(LogData[id][logTimer]);
	    DestroyDynamicObject(LogData[id][logObjID]);
		DestroyDynamic3DTextLabel(LogData[id][logLabel]);
		
	    LogData[id][logTimer] = -1;
        LogData[id][logObjID] = -1;
        LogData[id][logLabel] = Text3D: -1;

		Iter_Remove(Logs, id);
	}
	
	return 1;
}

ShowWoodBuyersLocationDialog(playerid) {
	new string[512], counter = 0;
	strcat(string, "ID\tStandort\n");
	foreach(new i : Buyers) {
		format(string, sizeof(string), "%s\n%i\t%s", string, i, GetPlayerAreaName(BuyerData[i][buyerX], BuyerData[i][buyerY], BuyerData[i][buyerZ]));

		playerBuyerDialogHelper[playerid][counter] = i;
		counter++;
	}
	if(!counter) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Es wurden keine Örtlichkeiten für Holzfäller gefunden!");
	ShowPlayerDialog(playerid, DIALOG_WOOD_BUYER_LOC, DIALOG_STYLE_TABLIST_HEADERS, "{F1C40F}redv-reallife.de: {FFFFFF}Holzfäller", string, "Absenden", "Abbrechen");
	return 1;
}

Log_OnDialogResponse(playerid, dialogid, response, listitem) {
	switch(dialogid) {
		case DIALOG_WOOD_BUYER_LOC: {
			if(!response) return 1;
			new id = playerBuyerDialogHelper[playerid][listitem];
			SetPlayerCheckpointEx(playerid, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], 5.0);
			SendClientMessage(playerid,COLOR_INFO,"[Info]: {FFFFFF}Holzfäller %s wurde dir auf der Minimap rot markiert.", GetPlayerAreaName(BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ]));
			return 1;
		}
	}
	return 1;
}