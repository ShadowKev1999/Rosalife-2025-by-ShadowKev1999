enum adminObject_enum {
	ao_ObjectId, ao_Model, Float:ao_Position[3], bool:ao_Created
};
new adminObject[MAX_GAME_OBJECTS][adminObject_enum];

CMD:object(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt

	new object, cmd_string[128];
    if(sscanf(params, "i", object))return SendClientMessage(playerid, COLOR_GREY, "Tippe: /object [OBJEKT-ID]");

	new freeslot = -1;
	for(new i = 0; i < MAX_GAME_OBJECTS; i++) {
		if(!adminObject[i][ao_Created]) {
		    freeslot = i;
			break;
		}
	}
	if(freeslot != -1) {
	    new Float:X, Float:Y, Float:Z;
		GetPlayerPos(playerid, X, Y, Z);
        adminObject[freeslot][ao_Created] = true;
        adminObject[freeslot][ao_Model] = object;
        adminObject[freeslot][ao_Position][0] = X;
        adminObject[freeslot][ao_Position][1] = Y;
        adminObject[freeslot][ao_Position][2] = Z;
        adminObject[freeslot][ao_ObjectId] = CreateDynamicObject(object, X, Y, Z, 0.0, 0.0, 0.0);
		format(cmd_string, 256, "Objekt erstellt! ID: %d Model: %d Slot: %d", adminObject[freeslot][ao_ObjectId], object, freeslot);
        SendClientMessage(playerid, COLOR_WHITE, cmd_string);
	} else {
        SendClientMessage(playerid, COLOR_RED, "Es können keine weiteren Objekte erstellt werden.");
	}
	return 1;
}

CMD:dobject(playerid, params[])
{
	if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	for(new i = 0; i < MAX_GAME_OBJECTS; i++) {
		if(!adminObject[i][ao_Created]) continue;
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, adminObject[i][ao_Position][0], adminObject[i][ao_Position][1], adminObject[i][ao_Position][2])) {
	        adminObject[i][ao_Created] = false;
	        DestroyDynamicObject(adminObject[i][ao_ObjectId]);
	        adminObject[i][ao_ObjectId] = 0;
		}
	}
	return 1;
}

CMD:dallobjects(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	for(new i = 0; i < MAX_GAME_OBJECTS; i++) {
		if(!adminObject[i][ao_Created]) continue;
        adminObject[i][ao_Created] = false;
        DestroyDynamicObject(adminObject[i][ao_ObjectId]);
        adminObject[i][ao_ObjectId] = 0;
	}
	return 1;
}

COMMAND:oedit(playerid, params[])
{
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	new object;
	if(sscanf(params, "i", object))return SendClientMessage(playerid, COLOR_GREY, "Tippe: /oedit [Objekt-ID]");
	EditDynamicObject(playerid, object);
	SetPVarInt(playerid, "EDIT_ADMIN_OBJECT", 1);
	return 1;
}

stock AdminEditor_EditDynObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(!IsValidDynamicObject(objectid)) return 1;

	new Float:oldX, Float:oldY, Float:oldZ, Float:oldRotX, Float:oldRotY, Float:oldRotZ,  cmd_string[128];
	GetDynamicObjectPos(objectid, oldX, oldY, oldZ);
	GetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

	if(response == 2) {
		if(GetPVarInt(playerid, "EDIT_ADMIN_OBJECT")) {
			SetDynamicObjectPos(objectid, x, y, z);
		    SetDynamicObjectRot(objectid, rx, ry, rz);
			format(cmd_string, 256, "Objekt-ID %d erfolgreich bearbeitet.", objectid);
	        SendClientMessage(playerid, COLOR_WHITE, cmd_string);

	        new model = 0;
	        for(new i = 0; i < MAX_GAME_OBJECTS; i++) {
				if(adminObject[i][ao_Created] && adminObject[i][ao_ObjectId] == objectid) {
                    model = adminObject[i][ao_Model];
				}
			}

	        format(cmd_string, 256, "{%d, %f, %f, %f, %f, %f, %f}", model, x, y, z, rx, ry, rz);
	        SendClientMessage(playerid, COLOR_WHITE, cmd_string);
		}
	} else if(response == 1) {
		if(GetPVarInt(playerid, "EDIT_ADMIN_OBJECT")) {
			//The player cancelled, so put the object back to it's old position
			SetDynamicObjectPos(objectid, oldX, oldY, oldZ);
			SetDynamicObjectRot(objectid, oldRotX, oldRotY, oldRotZ);

			format(cmd_string, 256, "Objekt-ID %d nicht bearbeitet.", objectid);
	        SendClientMessage(playerid, COLOR_WHITE, cmd_string);
	        DeletePVar(playerid, "EDIT_ADMIN_OBJECT");
		}
	}
	return 1;
}