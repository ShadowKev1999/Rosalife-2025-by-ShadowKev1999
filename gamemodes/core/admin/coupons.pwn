stock Coupons_Init() {
    mysql_tquery(sqlHandle, "SELECT * FROM `player_objects`", "onLoadPlayerObjects");
    return 1;
}

forward onLoadPlayerObjects();
public onLoadPlayerObjects() {
    new rows;
    cache_get_row_count(rows);
    if(rows) {
        for(new i = 0; i < rows; i++) {
            cache_get_value_name_int(i, "id", ServerObjects[i][serverObjectDbId]);
            cache_get_value_name_int(i, "modelid", ServerObjects[i][serverObjectModelId]);
            cache_get_value_name_float(i, "x", ServerObjects[i][serverObjectPosX]);
            cache_get_value_name_float(i, "y", ServerObjects[i][serverObjectPosY]);
            cache_get_value_name_float(i, "z", ServerObjects[i][serverObjectPosZ]);
            cache_get_value_name_float(i, "rx", ServerObjects[i][serverObjectRotX]);
            cache_get_value_name_float(i, "ry", ServerObjects[i][serverObjectRotY]);
            cache_get_value_name_float(i, "rz", ServerObjects[i][serverObjectRotZ]);
            cache_get_value_name_int(i, "user_id", ServerObjects[i][serverObjectUserId]);

            ServerObjects[ i ] [ serverObjectId ] = CreateDynamicObject( ServerObjects[i][serverObjectModelId],
                                                                            ServerObjects[i][serverObjectPosX],
                                                                            ServerObjects[i][serverObjectPosY],
                                                                            ServerObjects[i][serverObjectPosZ],
                                                                            ServerObjects[i][serverObjectRotX],
                                                                            ServerObjects[i][serverObjectRotY],
                                                                            ServerObjects[i][serverObjectRotZ]);
            Iter_Add(ServerObjectsItter, i);
        }
    }
    return 1;
}

stock Coupons_OnDialogResponse(playerid, dialogid, response, listitem) {
    switch(dialogid) {
        case DIALOG_GIVE_COUPON: {
            if(!response) return 1;
            new pID = PlayerCouponId[playerid], query[128];
            if(!IsPlayerConnectedEx(pID))return NichtOnline

            mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_coupons` (`user_id`, `couponId`, `servertime`) VALUES (%i, %i, %i)",
            SpielerInfo[pID][sDBID], listitem, gettime());
            mysql_tquery(sqlHandle, query);

            PlayerCouponId[playerid] = INVALID_PLAYER_ID;

            SendClientMessage(pID, COLOR_YELLOW, "Du hast von %s den Coupon '%s' erhalten. Du kannst ihn mit /coupons einlösen.", GetName(playerid), ServerCoupons[listitem]);
            SendClientMessage(playerid, COLOR_YELLOW, "Du hast %s den Coupon '%s' übergeben", GetName(pID), ServerCoupons[listitem]);
            return 1;
        }

        case DIALOG_PLAYER_COUPON: {
            if(!response) return 1;
            chosePlayerCoupon(playerid, listitem);
            return 1;
        }
    }
    return 1;
}

forward showPlayerCoupons(playerid);
public showPlayerCoupons(playerid) {
    new rows, couponId, couponIndex, string[1028];
    cache_get_row_count(rows);
    if(!rows) return SendClientMessage(playerid, COLOR_GREY, "Du besitzt noch keine Coupons!");
    for(new i = 0; i < rows; i++) {
        if(i > MAX_COUPON_LIST) continue;
        cache_get_value_name_int(i, "couponId", couponId);
        cache_get_value_name_int(i, "id", couponIndex);
        PlayerCouponList[i][0] = couponIndex;
        PlayerCouponList[i][1] = couponId;
        format(string, sizeof(string), "%s\n%s", string, ServerCoupons[couponId]);
        ShowPlayerDialog(playerid, DIALOG_PLAYER_COUPON, DIALOG_STYLE_LIST, "Player Coupons", string, "Auswählen", "Abbrechen");
    }
    return 1;
}

stock chosePlayerCoupon(playerid, index) {
    switch(PlayerCouponList[index][1]) {
        case COUPON_MONSTER_TRUCK: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_MONSTER_TRUCK]);
        }
        case COUPON_MONSTERA_TRUCK: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_MONSTERA_TRUCK]);
        }
        case COUPON_MONSTERB_TRUCK: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_MONSTERB_TRUCK]);
        }
        case COUPON_PLAYER_OBJECTS: {
            SpielerInfo[playerid][sPlayerObjects] += ServerCouponsModel[COUPON_PLAYER_OBJECTS];
            SendClientMessage(playerid, COLOR_YELLOW, "Befehle: /playerobjects, /editplayerobj, /delplayerobj, /playerobjlist");
        }
        case COUPON_SULTAN_VEHICLE: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_SULTAN_VEHICLE]);
        }
        case COUPON_PLAYER_VIP: {
            if(SpielerInfo[playerid][sVIP] != 0)return SendClientMessage(playerid,COLOR_RED,"[Info]: {FFFFFF}Du hast bereits den VIP-Status! Du kannst den Coupon aktuell nicht einlösen.");
            new string[128];
            format(string, sizeof(string), "INFO: %s hat %i Tage VIP durch einen Coupon erhalten!", GetName(playerid), ServerCouponsModel[COUPON_PLAYER_VIP]);
            CreateServerLogEntry("VIP_LOG", string);
            SendAdminMessage(COLOR_INFO,string);
            SendClientMessage(playerid,COLOR_INFO, "INFO: Du hast %i Tage VIP durch einen Coupon erhalten!", ServerCouponsModel[COUPON_PLAYER_VIP]);
            GiveVIP(SpielerInfo[playerid][sName], ServerCouponsModel[COUPON_PLAYER_VIP], "SERVER COUPON");
            SpielerInfo[playerid][sVIP] = 1;
            if(SpielerInfo[playerid][sAchivVIP] < 1)
            {
                SpielerInfo[playerid][sAchivVIP] = 1;
                ShowAchievement(playerid,"Werde VIP Mitglied","+ 2250 EXP");
                GivePlayerEXP(playerid,2250);
            }
        }
        case COUPON_BOXVILLE_VEHICLE: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_BOXVILLE_VEHICLE]);
        }
        case COUPON_BOBCAT_VEHICLE: {
            createCouponCar(playerid, ServerCouponsModel[COUPON_BOBCAT_VEHICLE]);
        }
    }

    new query[128];

    mysql_format(sqlHandle, query, sizeof(query), "DELETE FROM `player_coupons` WHERE `id` = %i", PlayerCouponList[index][0]);
    mysql_tquery(sqlHandle, query);

    SendClientMessage(playerid, COLOR_YELLOW, "Du hast den Coupon '%s' erfolgreich eingelöst.", ServerCoupons[PlayerCouponList[index][1]]);

    PlayerCouponList[index][0] = -1;
    PlayerCouponList[index][1] = -1;
    return 1;
}

stock createCouponCar(playerid, modelid) {
    new crstring[364], Float:pX, Float:pY, Float:pZ, Float:pA, vehicleid;

    GetPlayerPos(playerid, pX, pY, pZ);
    GetPlayerFacingAngle(playerid, pA);

    vehicleid = CreateVehicle(modelid,pX,pY,pZ,pA,1,1,-1);
    format(FahrzeugInfo[vehicleid][fKennzeichen], 10, CreateNummernSchild(playerid));
    SetVehicleNumberPlate(vehicleid,FahrzeugInfo[vehicleid][fKennzeichen]);

    FahrzeugInfo[vehicleid][fErstellt] = true; FahrzeugInfo[vehicleid][fModelID] = modelid;
    FahrzeugInfo[vehicleid][fPosition][0] = pX; FahrzeugInfo[vehicleid][fPosition][1] = pY; FahrzeugInfo[vehicleid][fPosition][2] = pZ; FahrzeugInfo[vehicleid][fPosition][3] = pA; FahrzeugInfo[vehicleid][fColor][1] = 1;
    FahrzeugInfo[vehicleid][fAbgeschleppt] = 0; FahrzeugInfo[vehicleid][fParkkralle] = 0; FahrzeugInfo[vehicleid][fKilometer] = 0; FahrzeugInfo[vehicleid][fColor][0] = 1; FahrzeugInfo[vehicleid][fPaintjob] = 3;
    FahrzeugInfo[vehicleid][fTank] = 20.0; FahrzeugInfo[vehicleid][fRang] = 0; FahrzeugInfo[vehicleid][fFraktion] = 0; FahrzeugInfo[vehicleid][fGruppe] = 0; FahrzeugInfo[vehicleid][fAutohaus] = 0; FahrzeugInfo[vehicleid][fNebenjob] = 0; FahrzeugInfo[vehicleid][fGarage] = 0; FahrzeugInfo[vehicleid][fGPark] = 0;
    FahrzeugInfo[vehicleid][fFahrschule] = 0; FahrzeugInfo[vehicleid][fSupmobil] = 0; FahrzeugInfo[vehicleid][fZiviroller] = 0; FahrzeugInfo[vehicleid][fImportCar] = 0; FahrzeugInfo[vehicleid][fKurrierCar] = 0;
    FahrzeugInfo[vehicleid][fPreis] = 0; format(FahrzeugInfo[vehicleid][fBesitzer], MAX_PLAYER_NAME, SpielerInfo[playerid][sName]); FahrzeugInfo[vehicleid][fBesitzerID] = playerid; FahrzeugInfo[vehicleid][fTuning][0] = 0; FahrzeugInfo[vehicleid][fTuning][1] = 0; FahrzeugInfo[vehicleid][fTuning][2] = 0;
    FahrzeugInfo[vehicleid][fTuning][3] = 0; FahrzeugInfo[vehicleid][fTuning][4] = 0; FahrzeugInfo[vehicleid][fTuning][5] = 0; FahrzeugInfo[vehicleid][fTuning][6] = 0; FahrzeugInfo[vehicleid][fTuning][7] = 0;
    FahrzeugInfo[vehicleid][fTuning][8] = 0; FahrzeugInfo[vehicleid][fTuning][9] = 0; FahrzeugInfo[vehicleid][fTuning][10] = 0; FahrzeugInfo[vehicleid][fTuning][11] = 0; FahrzeugInfo[vehicleid][fTuning][12] = 0; FahrzeugInfo[vehicleid][fTuning][13] = 0;
    FahrzeugInfo[vehicleid][fkGeld] = 0; FahrzeugInfo[vehicleid][fkDrogen] = 0; FahrzeugInfo[vehicleid][fJobEXP] = 0;

    GetVehicleParamsEx(vehicleid, engine, lights, alarm, doors, bonnet, boot, objective);
    SetVehicleParamsEx(vehicleid, false, false, false, true, false, false, false);

    Motor[vehicleid] = false;
    Licht[vehicleid] = false;
    DOOR[vehicleid] = true;
    Motorhaube[vehicleid] = false;
    Kofferraum[vehicleid] = false;

    PutPlayerInVehicle(playerid,vehicleid,0);

    mysql_format(sqlHandle, crstring,sizeof(crstring),"INSERT INTO `vehicles` (`ModelID`, `PositionX`, `PositionY`, `PositionZ`, `PositionA`, `Farbe1`, `Farbe2`, `Besitzer`, `Kennzeichen`, `Preis`) VALUES ('%d', '%f', '%f', '%f', '%f', '1', '1', '%s', '%s', '%d')"
    ,FahrzeugInfo[vehicleid][fModelID],FahrzeugInfo[vehicleid][fPosition][0],FahrzeugInfo[vehicleid][fPosition][1],FahrzeugInfo[vehicleid][fPosition][2],FahrzeugInfo[vehicleid][fPosition][3],
    SpielerInfo[playerid][sName],FahrzeugInfo[vehicleid][fKennzeichen],FahrzeugInfo[vehicleid][fPreis]);
    mysql_tquery(sqlHandle, crstring, "OnVehicleRegistered", "d", vehicleid);
    return 1;
}

Coupon_ModelSelectionEx(playerid, response, extraid, modelid) {
    if(!response) return 1;
    switch(extraid) {
        case MENU_PLAYER_OBJECT: {
            if(!SpielerInfo[playerid][sPlayerObjects]) return SendClientMessage(playerid, COLOR_GREY, "Du besitzt derzeit keine weiteren Spieler Objekte!");

            new Float:x, Float:y, Float:z, _object_id = Iter_Free(ServerObjectsItter);
            if( _object_id == -1 || _object_id == MAX_SERVER_OBJECTS ) return SendClientMessage( playerid , 0xFF0000FF, "[ERROR]{FFFFFF}Du hast das maximale Limit bereits erreicht." );
            GetPlayerPos(playerid, x, y, z);

            Iter_Add(ServerObjectsItter, _object_id);

            SetPVarInt(playerid, "OBJECT_CREATOR", _object_id);
            SetPVarInt(playerid, "OBJECT_CREATOR_INSERT", 1);

            ServerObjects[ _object_id ] [ serverObjectId ] = CreateDynamicObject( modelid, x+2.0, y, z, 0.0, 0.0, 0.0 );
	  	    EditDynamicObject( playerid, ServerObjects[ _object_id ] [ serverObjectId ] );
	  	    ServerObjects[ _object_id ] [ serverObjectModelId ] = modelid;
            ServerObjects[ _object_id ] [ serverObjectUserId ] = SpielerInfo[playerid][sDBID];
        }
    }
    return 1;
}

stock Coupon_EditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
    new _object_id = GetPVarInt(playerid, "OBJECT_CREATOR");
	if( objectid == ServerObjects[ _object_id ] [ serverObjectId ] )
	{
	    if( response == 2 ) {
	        SetDynamicObjectPos( objectid, x, y, z );
	        SetDynamicObjectRot( objectid, rx, ry, rz );// to update it so others may see it.
	    } else if ( response == 1 ) {
            ServerObjects[ _object_id ] [ serverObjectPosX ] = x;
            ServerObjects[ _object_id ] [ serverObjectPosY ] = y;
            ServerObjects[ _object_id ] [ serverObjectPosZ ] = z;

            ServerObjects[ _object_id ] [ serverObjectRotX ] = rx;
            ServerObjects[ _object_id ] [ serverObjectRotY ] = ry;
            ServerObjects[ _object_id ] [ serverObjectRotZ ] = rz;
            SetDynamicObjectPos( objectid, x, y, z );
            SetDynamicObjectRot( objectid, rx, ry, rz );
            
            if(GetPVarInt(playerid, "OBJECT_CREATOR_INSERT")) savePlayerObject(playerid, _object_id);
            else updatePlayerObject(playerid, _object_id);

            DeletePVar(playerid, "OBJECT_CREATOR");
            DeletePVar(playerid, "OBJECT_CREATOR_INSERT");
		} else if( response == 0 ) {
            if(GetPVarInt(playerid, "OBJECT_CREATOR_INSERT")) {
                DestroyDynamicObject( ServerObjects[ _object_id ] [ serverObjectId ]) ; 
                Iter_Remove(ServerObjectsItter, _object_id);
            } else {
                SetDynamicObjectPos( objectid, ServerObjects[ _object_id ] [ serverObjectPosX ], ServerObjects[ _object_id ] [ serverObjectPosY ], ServerObjects[ _object_id ] [ serverObjectPosZ ] );
	            SetDynamicObjectRot( objectid, ServerObjects[ _object_id ] [ serverObjectRotX ], ServerObjects[ _object_id ] [ serverObjectRotY ], ServerObjects[ _object_id ] [ serverObjectRotZ ] );
            }
            DeletePVar(playerid, "OBJECT_CREATOR");
            DeletePVar(playerid, "OBJECT_CREATOR_INSERT");
        }
	}
	return 1;
}

stock updatePlayerObject(playerid, index) {
    if(SpielerInfo[playerid][sDBID] != ServerObjects[ index ] [ serverObjectUserId ]) return 1;
    new query[512];
    mysql_format(sqlHandle, query, sizeof(query), "UPDATE `player_objects` SET `x` = %f, `y` = %f, `z` = %f, `rx` = %f, `ry` = %f, `rz` = %f WHERE id = %i",
    ServerObjects[ index ] [ serverObjectPosX ], ServerObjects[ index ] [ serverObjectPosY ], ServerObjects[ index ] [ serverObjectPosZ ],
    ServerObjects[ index ] [ serverObjectRotX ], ServerObjects[ index ] [ serverObjectRotY ], ServerObjects[ index ] [ serverObjectRotZ ],
    ServerObjects[ index ][ serverObjectDbId ]);
    mysql_tquery(sqlHandle, query);
    return 1;
}

stock savePlayerObject(playerid, index) {
    new query[512];

    SpielerInfo[playerid][sPlayerObjects]--;

    mysql_format(sqlHandle, query, sizeof(query), "INSERT INTO `player_objects` (`modelid`, `x`, `y`, `z`, `rx`, `ry`, `rz`, `user_id`) VALUES (%i, %f, %f, %f, %f, %f, %f, %i)",
    ServerObjects[ index ] [ serverObjectModelId ], ServerObjects[ index ] [ serverObjectPosX ], ServerObjects[ index ] [ serverObjectPosY ], ServerObjects[ index ] [ serverObjectPosZ ],
    ServerObjects[ index ] [ serverObjectRotX ], ServerObjects[ index ] [ serverObjectRotY ], ServerObjects[ index ] [ serverObjectRotZ ], ServerObjects[ index ] [ serverObjectUserId ]);
    mysql_tquery(sqlHandle, query, "onPlayerObjectInsert", "ii", playerid, index);
    return 1;
}

forward onPlayerObjectInsert(playerid, index);
public onPlayerObjectInsert(playerid, index) {

    ServerObjects[index][serverObjectDbId] = cache_insert_id();
    SendClientMessage(playerid, COLOR_YELLOW, "Objekt %i wurde erfolgreich angelegt. Du kannst das Objekt mit /editplayerobj editieren.", index);
    SendClientMessage(playerid, COLOR_YELLOW, "Nutze /delplayerobj, um das Objekt zu löschen.");
    return 1;
}

stock getNearestPlayerObject(playerid) {
    foreach(new i : ServerObjectsItter) {
        if(ServerObjects[i][serverObjectUserId] != SpielerInfo[playerid][sDBID]) continue;
        if(IsPlayerInRangeOfPoint(playerid, 10.0, ServerObjects[ i ] [ serverObjectPosX ], ServerObjects[ i ] [ serverObjectPosY ], ServerObjects[ i ] [ serverObjectPosZ ])) return i;
    }
    return -1;
}

stock countPlayerObjects(playerid) {
    new p_objects = 0;
    foreach(new i : ServerObjectsItter) {
        if(ServerObjects[i][serverObjectUserId] == SpielerInfo[playerid][sDBID]) p_objects ++;
    }
    return p_objects;
}