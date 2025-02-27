CMD:createactor(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new skinid, animationid, _actorname[24];
    if(sscanf(params,"s[24]dd", _actorname, skinid, animationid))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/createactor [name] [skinid] [animationsid]");
    if(!(0 <= skinid <= 311)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Ungültige Skin ID.");
    if(animationid < 1 || animationid > 1) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Ungültige Animations ID (/actoranimations).");
    if(strlen(_actorname) < 0 || strlen(_actorname) > 24) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Ungültiger Name.");
    new slot = Iter_Free(IterServerActors);
    if(slot == -1) return SendClientMessage(playerid, COLOR_YELLOW, "Keine weitere Erstellung möglich. Slots voll!");

    GetPlayerPos(playerid, ServerActors[slot][actorPos][0], ServerActors[slot][actorPos][1], ServerActors[slot][actorPos][2]);
    GetPlayerFacingAngle(playerid, ServerActors[slot][actorPos][3]);

    format(ServerActors[slot][actorName], 24, "%s", _actorname);
    ServerActors[slot][actorAnimation] = animationid;
    ServerActors[slot][actorSkinId] = skinid;

    ServerActors[slot][actorId] = CreateDynamicActor(ServerActors[slot][actorSkinId], ServerActors[slot][actorPos][0], ServerActors[slot][actorPos][1], ServerActors[slot][actorPos][2], ServerActors[slot][actorPos][3]);

    new label[64];
    format(label, sizeof(label), "{99CCFF}%s (%i)", ServerActors[slot][actorName], slot);
    ServerActors[slot][actorLabel] = CreateDynamic3DTextLabel(label, COLOR_WHITE, ServerActors[slot][actorPos][0], ServerActors[slot][actorPos][1], ServerActors[slot][actorPos][2] + 1.0, 5.0);

    switch(ServerActors[slot][actorAnimation]) {
        case 1: {
            ApplyDynamicActorAnimation(ServerActors[slot][actorId], "PED", "IDLE_CHAT", 4.1, true, false, false, true, 5);
        }
    }

    SetPlayerPos(playerid, ServerActors[slot][actorPos][0] + (1.5 * floatsin(-ServerActors[slot][actorPos][3], degrees)), ServerActors[slot][actorPos][1] + (1.5 * floatcos(-ServerActors[slot][actorPos][3], degrees)), ServerActors[slot][actorPos][2]);
    
    Iter_Add(IterServerActors, slot);

    new query[256];
    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `server_actors` (`name`, `x`, `y`, `z`, `a`, `animation`, `skin`) VALUES ('%s', %f, %f, %f, %f, %i, %i)",
    ServerActors[slot][actorName], ServerActors[slot][actorPos][0], ServerActors[slot][actorPos][1], ServerActors[slot][actorPos][2], ServerActors[slot][actorPos][3],
    ServerActors[slot][actorAnimation], ServerActors[slot][actorSkinId]);
    mysql_tquery(sqlHandle, query, "onActorInserted", "i", slot);

    SendClientMessage(playerid, COLOR_YELLOW, "Actor erstellt!");
    return 1;
}

CMD:actoranimations(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new string[512];
    strcat(string, "ID\tBeschreibung\n");
    strcat(string, "1\tUnterhaltung");
    ShowPlayerDialog(playerid, DIALOG_NULL, DIALOG_STYLE_TABLIST_HEADERS, "Actor Animation", string, "Schließen", "");
    return 1;
}

CMD:deleteactor(playerid, params[]) {
    if(SpielerInfo[playerid][sAdmin] < 4)return NichtBerechtigt
    new id;
    if(sscanf(params,"d", id))return SendClientMessage(playerid,COLOR_YELLOW,"Benutze: {FFFFFF}/deleteactor [ActorId]");
    
    if(!Iter_Contains(IterServerActors, id)) return SendClientMessage(playerid, COLOR_ERRORTEXT, "Ungültige ID.");
	DestroyDynamicActor(ServerActors[id][actorId]);
	DestroyDynamic3DTextLabel(ServerActors[id][actorLabel]);
	
	ServerActors[id][actorId] = -1;
	ServerActors[id][actorLabel] = Text3D: -1;
	Iter_Remove(IterServerActors, id);
	
    new query[128];

	mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `server_actors` WHERE `id` = %i", ServerActors[id][actorDatabase]);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, COLOR_YELLOW, "Actor entfernt!");
    return 1;
}