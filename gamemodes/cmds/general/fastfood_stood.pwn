CMD:food(playerid) {
    if(SpielerInfo[playerid][sAdmin] < 3)return NichtBerechtigt
	ShowPlayerDialog( playerid, DIALOG_FASTFOOD_OPTION, DIALOG_STYLE_LIST, "Optionsauswahl", "Stand erstellen\nStände auflisten\nZu einem Stand teleportieren\nStand löschen", "Auswählen", "Abbrechen" );
	return true;
}
CMD:saveact( playerid ) {
    new
        Float:x, Float:y, Float:z, Float:ang, f_id;
    f_id = Iter_Free(Foods);
	GetPlayerPos( playerid, x, y, z );
	GetPlayerFacingAngle( playerid, ang );
	if(! IsPlayerInRangeOfPoint( playerid, 3.0, FoodInfo[ f_id ] [ ObjPosX ], FoodInfo[ f_id ] [ ObjPosY ], FoodInfo[ f_id ] [ ObjPosZ ] ) ) return SendClientMessage( playerid, -1, "Du befindest dich nicht bei einem Stand." );

	
	FoodInfo[ f_id ] [ ActorX ] = x;
	FoodInfo[ f_id ] [ ActorY ] = y;
	FoodInfo[ f_id ] [ ActorZ ] = z;
	FoodInfo[ f_id ] [ ActorRot ] = ang;
	
	FoodInfo[ f_id ] [ ActorID ] = CreateActor( FoodInfo[ f_id ] [ ActorSkin ] , FoodInfo[ f_id ] [ ActorX ], FoodInfo[ f_id ] [ ActorY ], FoodInfo[ f_id ] [ ActorZ ], FoodInfo[ f_id ] [ ActorRot ] );
	
	SetPlayerPos( playerid, x+2.0, y, z );

	ShowPlayerDialog( playerid, DIALOG_FASTFOOD_TEXT, DIALOG_STYLE_INPUT, "Texteingabe", "Gib deinen gewünschten Text für diesen Stand ein:", "Ok", "");
	return true;
}