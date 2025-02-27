// Player Commands
CMD:chainsaw(playerid, params[])
{
    if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You can't use this command in a vehicle.");
    if(!IsPlayerNearALogBuyer(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You're not near a Log Buyer.");
	if(GetPlayerMoneyEx(playerid) < CSAW_PRICE) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}You don't have enough money.");
    if(SpielerInfo[playerid][sChainsaw]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du besitzt bereits eine Kettensäge.");
    GivePlayerMoneyEx(playerid, -CSAW_PRICE);
    SpielerInfo[playerid][sChainsaw] = 1;
    
    new string[128];
    format(string, sizeof(string), "HOLZFÄLLER: {FFFFFF}Du hast eine Kettensäge für {2ECC71}$%d {FFFFFF}erworben.", CSAW_PRICE);
   	SendClientMessage(playerid, 0x3498DBFF, string);
	return 1;
}

CMD:log(playerid, params[])
{
	if(IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Der Befehl kann nicht in einem Fahrzeug verwendet werden.");
    if(isnull(params)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/log [load/take/takefromcar/takefromtree/sell]");
    
    if(!strcmp(params, "load", true)) {
        // loading to a bobcat
        if(!CarryingLog[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst keinen Baumstamm.");
		new id = GetNearestVehicleEx(playerid);
		if(GetVehicleModel(id) != 422) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht in der Nähe eines Bobcat.");
		new Float: x, Float: y, Float: z;
    	GetVehicleBoot(id, x, y, z);
    	if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht an der Ladefläche.");
    	if(Vehicle_LogCount(id) >= LOG_LIMIT) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Das Fahrzeug kann keine weiteren Baumstämme aufladen.");
    	for(new i; i < LOG_LIMIT; i++)
    	{
    	    if(!IsValidDynamicObject(LogObjects[id][i]))
    	    {
    	        LogObjects[id][i] = CreateDynamicObject(19793, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0);
    			AttachDynamicObjectToVehicle(LogObjects[id][i], id, LogAttachOffsets[i][0], LogAttachOffsets[i][1], LogAttachOffsets[i][2], 0.0, 0.0, LogAttachOffsets[i][3]);
    			break;
    	    }
    	}
    	
    	Streamer_Update(playerid);
    	Player_RemoveLog(playerid);
    	SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Du hast einen Baumstamm aufgeladen.");
    	// done
    }else if(!strcmp(params, "take")) {
        // taking from ground
        if(CarryingLog[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst bereits einen Baumstamm.");
		new id = GetClosestLog(playerid);
		if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich an keinem Baumstamm.");
		LogData[id][logSeconds] = 1;
		RemoveLog(id);
		
		Player_GiveLog(playerid);
		SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Du hast einen Baumstamm aufgehoben.");
		// done
    }else if(!strcmp(params, "takefromcar")) {
        // taking from a bobcat
        if(CarryingLog[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst bereits einen Baumstamm.");
        new id = GetNearestVehicleEx(playerid);
		if(GetVehicleModel(id) != 422) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich bei keinem Bobcat.");
		new Float: x, Float: y, Float: z;
    	GetVehicleBoot(id, x, y, z);
    	if(!IsPlayerInRangeOfPoint(playerid, 3.0, x, y, z)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht an der Ladefläche.");
    	if(Vehicle_LogCount(id) < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Die Ladefläche ist leer.");
    	for(new i = (LOG_LIMIT - 1); i >= 0; i--)
    	{
    	    if(IsValidDynamicObject(LogObjects[id][i]))
    	    {
    	        DestroyDynamicObject(LogObjects[id][i]);
    	        LogObjects[id][i] = -1;
    			break;
    	    }
    	}

    	Streamer_Update(playerid);
    	Player_GiveLog(playerid);
        SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Du hast einen Baumstamm von der Ladefläche entnommen.");
        // done
    }else if(!strcmp(params, "takefromtree")) {
		// taking from a cut tree
		if(CarryingLog[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst bereits einen Baumstamm.");
        new id = GetClosestTree(playerid);
        if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich bei keinem Baum.");
        if(TreeData[id][treeSeconds] < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Der Baum wurde nicht gefällt.");
        if(TreeData[id][treeLogs] < 1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Dieser Baum hat keine Baumstämme mehr.");
        TreeData[id][treeLogs]--;
        Tree_UpdateLogLabel(id);
        
        Player_GiveLog(playerid);
        SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Du hast einen Baumstamm aufgesammelt.");
        // done
    }else if(!strcmp(params, "sell")) {
        // selling a log
        if(!CarryingLog[playerid]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du trägst keinen Baumstamm.");
		if(!IsPlayerNearALogBuyer(playerid)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich bei keinem Holzkäufer.");
		Player_RemoveLog(playerid);
		GivePlayerMoneyEx(playerid, LOG_PRICE);

		UpdateEconomyValue(ECONOMY_TYPE_WOOD, 1);
		
		new string[128];
		format(string, sizeof(string), "HOLZFÄLLER: {FFFFFF}Du hast einen Baumstamm für {2ECC71}$%d {FFFFFF}verkauft.", LOG_PRICE);
    	SendClientMessage(playerid, 0x3498DBFF, string);
        // done
    }

	return 1;
}

// Admin Commands - Trees
CMD:createtree(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new id = Iter_Free(Trees);
	if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Es können keine weiteren Bäume platziert werden.");
 	new Float: x, Float: y, Float: z, Float: a;
 	GetPlayerPos(playerid, x, y, z);
 	GetPlayerFacingAngle(playerid, a);
 	x += (3.0 * floatsin(-a, degrees));
	y += (3.0 * floatcos(-a, degrees));
	z -= 1.0;
	
	TreeData[id][treeX] = x;
	TreeData[id][treeY] = y;
	TreeData[id][treeZ] = z;
	TreeData[id][treeRX] = TreeData[id][treeRY] = TreeData[id][treeRZ] = 0.0;
	
	TreeData[id][treeObjID] = CreateDynamicObject(657, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ], TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);

	new label[256];
	format(label, sizeof(label), "Baum (%d)\n\n{FFFFFF}Nutze {F1C40F}~k~~CONVERSATION_NO~ {FFFFFF}, um den Baum zu fällen.", id);
	TreeData[id][treeLabel] = CreateDynamic3DTextLabel(label, 0x2ECC71FF, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ] + 1.5, 5.0);
	Iter_Add(Trees, id);
    
    new query[256];

    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `wood_trees` (`ID`, `PosX`, `PosY`, `PosZ`, `RotX`, `RotY`, `RotZ`) VALUES (%i, %f, %f, %f, %f, %f, %f)",
    id, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ], TreeData[id][treeRX], TreeData[id][treeRY], TreeData[id][treeRZ]);
    mysql_tquery(sqlHandle, query);


    EditingTreeID[playerid] = id;
    EditDynamicObject(playerid, TreeData[id][treeObjID]);
    
    SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Baum wurde erstellt.");
    SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Du kannst den Baum nun editieren. Du kannst dieser zu jederzeit editieren.");
	return 1;
}

CMD:edittree(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    if(EditingTreeID[playerid] != -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du editierst bereits einen Baum.");
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/edittree [baum id]");
	if(!Iter_Contains(Trees, id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	if(TreeData[id][treeGettingCut]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Dieser Baum kann derzeit nicht editiert werden, da er aktuell verwendet wird.");
	if(!IsPlayerInRangeOfPoint(playerid, 30.0, TreeData[id][treeX], TreeData[id][treeY], TreeData[id][treeZ])) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Du befindest dich nicht in der Nähe des angegebenen Baums.");
	EditingTreeID[playerid] = id;
	EditDynamicObject(playerid, TreeData[id][treeObjID]);
	return 1;
}

CMD:removetree(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/removetree [baum id]");
	if(!Iter_Contains(Trees, id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	if(TreeData[id][treeGettingCut]) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Der Baum kann zurzeit nicht entfernt werden, da er derzeit benutzt wird.");
	if(Tree_BeingEdited(id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Baum kann nicht entfernt werden, da er derzeit editiert wird.");
	DestroyDynamicObject(TreeData[id][treeObjID]);
	DestroyDynamic3DTextLabel(TreeData[id][treeLabel]);
	if(TreeData[id][treeTimer] != -1) KillTimer(TreeData[id][treeTimer]);
	
	TreeData[id][treeLogs] = TreeData[id][treeSeconds] = 0;
	TreeData[id][treeObjID] = TreeData[id][treeTimer] = -1;
	TreeData[id][treeLabel] = Text3D: -1;
	Iter_Remove(Trees, id);
	
    new query[128];

	mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `wood_trees` WHERE `ID` = %i", id);
    mysql_tquery(sqlHandle, query);

	SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Baum wurde entfernt.");
	return 1;
}

// Admin Commands - Log Buyers
CMD:createwoodbuyer(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new skin;
	if(sscanf(params, "i", skin)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/createwoodbuyer [skin id]");
	if(!(0 <= skin <= 311)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige Skin ID."); 
	new id = Iter_Free(Buyers);
	if(id == -1) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Es können keine weiteren Verkäufer erstellt werden.");
	GetPlayerPos(playerid, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ]);
	GetPlayerFacingAngle(playerid, BuyerData[id][buyerA]);

	BuyerData[id][buyerActorID] = CreateActor(skin, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA]);
	SetActorInvulnerable(BuyerData[id][buyerActorID], true);
	
	new label[256];
	format(label, sizeof(label), "Holzkäufer (%d)\n\n{FFFFFF}Nutze {F1C40F}/chainsaw {FFFFFF}, um eine Kettensäge für {2ECC71}$%d{FFFFFF} zu kaufen.\n{FFFFFF}Nutze {F1C40F}/log sell{FFFFFF}, um einen Baumstamm für {2ECC71}$%d{FFFFFF} zu verkaufen.", id, CSAW_PRICE, LOG_PRICE);
	BuyerData[id][buyerLabel] = CreateDynamic3DTextLabel(label, 0xF1C40FFF, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ] + 0.25, 5.0, .testlos = 1);
	Iter_Add(Buyers, id);

    new query[256];

    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `wood_buyers` (`ID`, `Skin`, `PosX`, `PosY`, `PosZ`, `PosA`) VALUES (%i, %i, %f, %f, %f, %f)",
    id, skin, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA]);
    mysql_tquery(sqlHandle, query);

	SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Holzkäufer wurde erstellt.");
	SetPlayerPos(playerid, BuyerData[id][buyerX] + (1.5 * floatsin(-BuyerData[id][buyerA], degrees)), BuyerData[id][buyerY] + (1.5 * floatcos(-BuyerData[id][buyerA], degrees)), BuyerData[id][buyerZ]);
	return 1;
}

CMD:setwoodbuyerskin(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new id, skin;
	if(sscanf(params, "ii", id, skin)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/setwoodbuyerskin [verkäufer id] [skin id]");
	if(!Iter_Contains(Buyers, id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	if(!(0 <= skin <= 311)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige Skin ID.");
	BuyerData[id][buyerSkin] = skin;
	
	DestroyActor(BuyerData[id][buyerActorID]);
	BuyerData[id][buyerActorID] = CreateActor(skin, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA]);
	SetActorInvulnerable(BuyerData[id][buyerActorID], true);

    new query[256];

    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `wood_buyers` SET `Skin` = %i, `PosX`= %f, `PosY` = %f, `PosZ` = %f, `PosA` = %f WHERE `ID` = %i",
    skin, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA], id);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Holzkäufer wurde erfolgreich editiert.");
	return 1;
}

CMD:setwoodbuyerpos(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/setwoodbuyerpos [verkäufer id]");
	if(!Iter_Contains(Buyers, id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	GetPlayerPos(playerid, BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ]);
	GetPlayerFacingAngle(playerid, BuyerData[id][buyerA]);

	DestroyActor(BuyerData[id][buyerActorID]);
	BuyerData[id][buyerActorID] = CreateActor(BuyerData[id][buyerSkin], BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA]);
	SetActorInvulnerable(BuyerData[id][buyerActorID], true);

    Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BuyerData[id][buyerLabel], E_STREAMER_X, BuyerData[id][buyerX]);
	Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BuyerData[id][buyerLabel], E_STREAMER_Y, BuyerData[id][buyerY]);
	Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, BuyerData[id][buyerLabel], E_STREAMER_Z, BuyerData[id][buyerZ] + 0.25);

	new query[256];

    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `wood_buyers` SET `PosX`= %f, `PosY` = %f, `PosZ` = %f, `PosA` = %f WHERE `ID` = %i",
    BuyerData[id][buyerX], BuyerData[id][buyerY], BuyerData[id][buyerZ], BuyerData[id][buyerA], id);
    mysql_tquery(sqlHandle, query);

	SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Holzkäufer wurde editiert.");
    SetPlayerPos(playerid, BuyerData[id][buyerX] + (1.5 * floatsin(-BuyerData[id][buyerA], degrees)), BuyerData[id][buyerY] + (1.5 * floatcos(-BuyerData[id][buyerA], degrees)), BuyerData[id][buyerZ]);
	return 1;
}

CMD:removewoodbuyer(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
	new id;
	if(sscanf(params, "i", id)) return SendClientMessage(playerid, 0xE88732FF, "NUTZE: {FFFFFF}/removewoodbuyer [Verkäufer ID]");
	if(!Iter_Contains(Buyers, id)) return SendClientMessage(playerid, 0xE74C3CFF, "ERROR: {FFFFFF}Ungültige ID.");
	DestroyActor(BuyerData[id][buyerActorID]);
	DestroyDynamic3DTextLabel(BuyerData[id][buyerLabel]);
	
	BuyerData[id][buyerActorID] = -1;
	BuyerData[id][buyerLabel] = Text3D: -1;
	Iter_Remove(Buyers, id);
	
    new query[128];

	mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `wood_buyers` WHERE `ID` = %i", id);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, 0x3498DBFF, "HOLZFÄLLER: {FFFFFF}Holzkäufer wurde entfernt.");
	return 1;
}