stock FastFoodStood_Init() {

    new
        str[ 64 ],
        fid;
	new Cache:result = mysql_query(sqlHandle, "SELECT * FROM foodstood" );

	for(new i = 0; i < cache_num_rows(); i++)
	{
        cache_get_value_name_int( i, "id", fid );
        Iter_Add(Foods, fid);

        cache_get_value_name_int( i, "modelid" , FoodInfo[ fid ] [ fmodelid ] );

        cache_get_value_name( i, "text" , FoodInfo[ fid ] [ foodtext ] );

        cache_get_value_name_float( i , "x" , FoodInfo[ fid ] [ ObjPosX ]);
        cache_get_value_name_float( i , "y" , FoodInfo[ fid ] [ ObjPosY ] );
        cache_get_value_name_float( i , "z" , FoodInfo[ fid ] [ ObjPosZ ]);

        cache_get_value_name_float( i , "rotx" , FoodInfo[ fid ] [ ObjRotX ]);
        cache_get_value_name_float( i , "roty" , FoodInfo[ fid ] [ ObjRotY ]);
        cache_get_value_name_float( i , "rotz" , FoodInfo[ fid ] [ ObjRotZ ]);

        cache_get_value_name_int( i, "Actorskin" , FoodInfo[ fid ] [ ActorSkin ] );
        cache_get_value_name_float( i , "ActorX" , FoodInfo[ fid ] [ ActorX ]);
        cache_get_value_name_float( i , "ActorY" , FoodInfo[ fid ] [ ActorY ]);
        cache_get_value_name_float( i , "ActorZ" , FoodInfo[ fid ] [ ActorZ ]);
        cache_get_value_name_float( i , "ActorRot" , FoodInfo[ fid ] [ ActorRot ]);

        format( str, sizeof( str ) , "%s\nID(%d)", FoodInfo[ fid ] [ foodtext ], fid );
        FoodInfo[ fid ] [ textid ] = CreateDynamic3DTextLabel( str, -1, FoodInfo[ fid ] [ ObjPosX ], FoodInfo[ fid ] [ ObjPosY ], FoodInfo[ fid ] [ ObjPosZ ], 10.0 );

        FoodInfo[ fid ] [ foodid ] = CreateDynamicObject( FoodInfo[ fid ] [ fmodelid ], FoodInfo[ fid ] [ ObjPosX ], FoodInfo[ fid ] [ ObjPosY ], FoodInfo[ fid ] [ ObjPosZ ], FoodInfo[ fid ] [ ObjRotX ], FoodInfo[ fid ] [ ObjRotY ], FoodInfo[ fid ] [ ObjRotZ ] );
        
        FoodInfo[ fid ] [ ActorID ] = CreateActor( FoodInfo[ fid ] [ ActorSkin ] , FoodInfo[ fid ] [ ActorX ], FoodInfo[ fid ] [ ActorY ], FoodInfo[ fid ] [ ActorZ ], FoodInfo[ fid ] [ ActorRot ] );

        GetXYInFrontOfActor( FoodInfo[ fid ] [ ActorID ], FoodInfo[ fid ] [ ActorX ], FoodInfo[ fid ] [ ActorY ], 2.0 );
        FoodInfo[ fid ] [ fcheckpointid ] = CreateDynamicCP( FoodInfo[ fid ] [ ActorX ], FoodInfo[ fid ] [ ActorY ],FoodInfo[ fid ] [ ActorZ ] , 1.0, -1, -1, -1, 10.0);

	}
    cache_delete(result);

	Foodobj[1] = TextDrawCreate(192.699951, 118.449996, "");
	TextDrawLetterSize(Foodobj[1], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[1], 248.000000, 209.000000);
	TextDrawAlignment(Foodobj[1], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[1], 255);
	TextDrawSetShadow(Foodobj[1], 0);
	TextDrawSetOutline(Foodobj[1], 0);
	TextDrawBackgroundColour(Foodobj[1], 0);
	TextDrawFont(Foodobj[1], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[1], false);
	TextDrawSetShadow(Foodobj[1], 0);
	TextDrawSetPreviewModel(Foodobj[1], 1895);
	TextDrawSetPreviewRot(Foodobj[1], 0.000000, 0.000000, 0.000000, 1.000000);
	
	Foodobj[0] = TextDrawCreate(278.500000, 120.000000, "box");
	TextDrawLetterSize(Foodobj[0], 0.000000, 15.299999);
	TextDrawTextSize(Foodobj[0], 350.000000, 0.000000);
	TextDrawAlignment(Foodobj[0], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[0], -1);
	TextDrawUseBox(Foodobj[0], true);
	TextDrawBoxColour(Foodobj[0], -935582209);
	TextDrawSetShadow(Foodobj[0], 0);
	TextDrawSetOutline(Foodobj[0], 0);
	TextDrawBackgroundColour(Foodobj[0], 255);
	TextDrawFont(Foodobj[0], TEXT_DRAW_FONT_1);
	TextDrawSetProportional(Foodobj[0], true);
	TextDrawSetShadow(Foodobj[0], 0);
	
	Foodobj[2] = TextDrawCreate(219.500000, 206.187500, "");
	TextDrawLetterSize(Foodobj[2], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[2], 186.000000, 81.000000);
	TextDrawAlignment(Foodobj[2], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[2], 255);
	TextDrawSetShadow(Foodobj[2], 0);
	TextDrawSetOutline(Foodobj[2], 0);
	TextDrawBackgroundColour(Foodobj[2], 0);
	TextDrawFont(Foodobj[2], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[2], false);
	TextDrawSetShadow(Foodobj[2], 0);
	TextDrawSetPreviewModel(Foodobj[2], 19134);
	TextDrawSetPreviewRot(Foodobj[2], 0.000000, 0.000000, 90.000000, 1.000000);

	Foodobj[3] = TextDrawCreate(296.500000, 144.062500, "FAST~n~~n~~n~MENU");
	TextDrawLetterSize(Foodobj[3], 0.400000, 1.600000);
	TextDrawAlignment(Foodobj[3], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[3], -54630401);
	TextDrawSetShadow(Foodobj[3], 0);
	TextDrawSetOutline(Foodobj[3], 0);
	TextDrawBackgroundColour(Foodobj[3], 255);
	TextDrawFont(Foodobj[3], TEXT_DRAW_FONT_1);
	TextDrawSetProportional(Foodobj[3], true);
	TextDrawSetShadow(Foodobj[3], 0);

	Foodobj[4] = TextDrawCreate(287.500000, 162.000000, "FOOD");
	TextDrawLetterSize(Foodobj[4], 0.539499, 1.888749);
	TextDrawAlignment(Foodobj[4], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[4], -1);
	TextDrawSetShadow(Foodobj[4], 0);
	TextDrawSetOutline(Foodobj[4], 0);
	TextDrawBackgroundColour(Foodobj[4], 255);
	TextDrawFont(Foodobj[4], TEXT_DRAW_FONT_1);
	TextDrawSetProportional(Foodobj[4], true);
	TextDrawSetShadow(Foodobj[4], 0);

	Foodobj[5] = TextDrawCreate(183.500000, 120.000000, "");
	TextDrawLetterSize(Foodobj[5], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[5], 90.000000, 90.000000);
	TextDrawAlignment(Foodobj[5], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[5], -1);
	TextDrawSetShadow(Foodobj[5], 0);
	TextDrawSetOutline(Foodobj[5], 0);
	TextDrawBackgroundColour(Foodobj[5], 0);
	TextDrawFont(Foodobj[5], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[5], false);
	TextDrawSetShadow(Foodobj[5], 0);
	TextDrawSetSelectable(Foodobj[5], true);
	TextDrawSetPreviewModel(Foodobj[5], 2702);
	TextDrawSetPreviewRot(Foodobj[5], 0.000000, -60.000000, 90.000000, 1.000000);

	Foodobj[6] = TextDrawCreate(221.500000, 197.875000, "PIZZA~n~~g~$10");
	TextDrawLetterSize(Foodobj[6], 0.282500, 0.865000);
	TextDrawAlignment(Foodobj[6], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[6], -1);
	TextDrawSetShadow(Foodobj[6], 0);
	TextDrawSetOutline(Foodobj[6], 0);
	TextDrawBackgroundColour(Foodobj[6], 255);
	TextDrawFont(Foodobj[6], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(Foodobj[6], true);
	TextDrawSetShadow(Foodobj[6], 0);

	Foodobj[7] = TextDrawCreate(183.000000, 193.500000, "");
	TextDrawLetterSize(Foodobj[7], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[7], 83.000000, 101.000000);
	TextDrawAlignment(Foodobj[7], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[7], -1);
	TextDrawSetShadow(Foodobj[7], 0);
	TextDrawSetOutline(Foodobj[7], 0);
	TextDrawBackgroundColour(Foodobj[7], 0);
	TextDrawFont(Foodobj[7], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[7], false);
	TextDrawSetShadow(Foodobj[7], 0);
	TextDrawSetSelectable(Foodobj[7], true);
	TextDrawSetPreviewModel(Foodobj[7], 2858);
	TextDrawSetPreviewRot(Foodobj[7], 0.000000, 0.000000, 270.000000, 1.000000);

	Foodobj[8] = TextDrawCreate(227.500000, 260.875000, "POMMES~n~~g~$5");
	TextDrawLetterSize(Foodobj[8], 0.282500, 0.865000);
	TextDrawAlignment(Foodobj[8], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[8], -1);
	TextDrawSetShadow(Foodobj[8], 0);
	TextDrawSetOutline(Foodobj[8], 0);
	TextDrawBackgroundColour(Foodobj[8], 255);
	TextDrawFont(Foodobj[8], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(Foodobj[8], true);
	TextDrawSetShadow(Foodobj[8], 0);

	Foodobj[9] = TextDrawCreate(282.000000, 239.437500, "");
	TextDrawLetterSize(Foodobj[9], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[9], 58.000000, 66.000000);
	TextDrawAlignment(Foodobj[9], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[9], -1);
	TextDrawSetShadow(Foodobj[9], 0);
	TextDrawSetOutline(Foodobj[9], 0);
	TextDrawBackgroundColour(Foodobj[9], 0);
	TextDrawFont(Foodobj[9], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[9], false);
	TextDrawSetShadow(Foodobj[9], 0);
	TextDrawSetSelectable(Foodobj[9], true);
	TextDrawSetPreviewModel(Foodobj[9], 2647);
	TextDrawSetPreviewRot(Foodobj[9], 0.000000, 0.000000, 270.000000, 1.000000);

	Foodobj[10] = TextDrawCreate(300.000000, 294.562500, "COLA~n~~g~$2");
	TextDrawLetterSize(Foodobj[10], 0.282500, 0.865000);
	TextDrawAlignment(Foodobj[10], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[10], -1);
	TextDrawSetShadow(Foodobj[10], 0);
	TextDrawSetOutline(Foodobj[10], 0);
	TextDrawBackgroundColour(Foodobj[10], 255);
	TextDrawFont(Foodobj[10], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(Foodobj[10], true);
	TextDrawSetShadow(Foodobj[10], 0);

	Foodobj[11] = TextDrawCreate(360.000000, 213.625000, "");
	TextDrawLetterSize(Foodobj[11], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[11], 58.000000, 66.000000);
	TextDrawAlignment(Foodobj[11], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[11], -1);
	TextDrawSetShadow(Foodobj[11], 0);
	TextDrawSetOutline(Foodobj[11], 0);
	TextDrawBackgroundColour(Foodobj[11], 0);
	TextDrawFont(Foodobj[11], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[11], false);
	TextDrawSetShadow(Foodobj[11], 0);
	TextDrawSetSelectable(Foodobj[11], true);
	TextDrawSetPreviewModel(Foodobj[11], 2880);
	TextDrawSetPreviewRot(Foodobj[11], 180.000000, 90.000000, 360.000000, 1.000000);

	Foodobj[12] = TextDrawCreate(374.500000, 249.500000, "BURGER~n~~g~$10");
	TextDrawLetterSize(Foodobj[12], 0.282500, 0.865000);
	TextDrawAlignment(Foodobj[12], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[12], -1);
	TextDrawSetShadow(Foodobj[12], 0);
	TextDrawSetOutline(Foodobj[12], 0);
	TextDrawBackgroundColour(Foodobj[12], 255);
	TextDrawFont(Foodobj[12], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(Foodobj[12], true);
	TextDrawSetShadow(Foodobj[12], 0);

	Foodobj[13] = TextDrawCreate(292.500000, 95.500000, "");
	TextDrawLetterSize(Foodobj[13], 0.000000, 0.000000);
	TextDrawTextSize(Foodobj[13], 165.000000, 125.000000);
	TextDrawAlignment(Foodobj[13], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[13], -1);
	TextDrawSetShadow(Foodobj[13], 0);
	TextDrawSetOutline(Foodobj[13], 0);
	TextDrawBackgroundColour(Foodobj[13], 0);
	TextDrawFont(Foodobj[13], TEXT_DRAW_FONT_MODEL_PREVIEW);
	TextDrawSetProportional(Foodobj[13], false);
	TextDrawSetShadow(Foodobj[13], 0);
	TextDrawSetSelectable(Foodobj[13], true);
	TextDrawSetPreviewModel(Foodobj[13], 2769);
	TextDrawSetPreviewRot(Foodobj[13], 0.000000, 60.000000, 90.000000, 1.000000);

	Foodobj[14] = TextDrawCreate(364.000000, 192.625000, "Hot-dog~n~~g~$15");
	TextDrawLetterSize(Foodobj[14], 0.282500, 0.865000);
	TextDrawAlignment(Foodobj[14], TEXT_DRAW_ALIGN_LEFT);
	TextDrawColour(Foodobj[14], -1);
	TextDrawSetShadow(Foodobj[14], 0);
	TextDrawSetOutline(Foodobj[14], 0);
	TextDrawBackgroundColour(Foodobj[14], 255);
	TextDrawFont(Foodobj[14], TEXT_DRAW_FONT_2);
	TextDrawSetProportional(Foodobj[14], true);
	TextDrawSetShadow(Foodobj[14], 0);
    return 1;
}

stock FastFoodStood_Exit() {
    for( new o = 0; o < 15; o++ )
	{
	    TextDrawDestroy( Foodobj[o] );
	}
	for( new p = 0; p < MAX_FOOD; p ++ )
	{
	    if( IsValidDynamicObject( FoodInfo[ p ] [ foodid ] ) ) { DestroyDynamicObject( FoodInfo[ p ] [ foodid ] );  }
	    if( IsValidDynamicCP( FoodInfo[ p ] [ fcheckpointid ] ) ) { DestroyDynamicCP( FoodInfo[ p ] [ fcheckpointid ] );  }
	    if( IsValidDynamic3DTextLabel( FoodInfo[ p ] [ textid ] ) ) { DestroyDynamic3DTextLabel( FoodInfo[ p ] [ textid ] );  }
    	DestroyActor( FoodInfo[ p ] [ ActorID ] );
	}
    return 1;
}

stock FastFoodStood_OnPlayerConnect(playerid)
{
    EnablePlayerCameraTarget(playerid, true);
    
    return true;
}

stock FastFoodStood_OnDialogResponse(playerid, dialogid, response, listitem, const inputtext[])
{
    if(dialogid == DIALOG_FASTFOOD_OPTION )
    {
		if(response)
		{
		    switch( listitem )
		    {
		        case 0:
		        {
				    new
						objects[ 3 ];
					objects [ 0 ] = 1340, objects[ 1 ] = 956, objects[ 2 ] = 1776;
				    ShowModelSelectionMenuEx(playerid, objects, 3, "waehle das object model", MENU_FASTFOOD_OBJECT, 16.0, 0.0, 180.0, 1.0, 0x00000033, 0x00000066, 0xA1A1A133);
		        }
		        case 1:
		        {
					new
					    str[ 256 ];
					for( new i = 0; i < MAX_FOOD; i++ )
					{
					    if( IsValidDynamicObject( FoodInfo[ i ] [ foodid ] ) )
					    {
		            		format( str, sizeof( str ), "%s %s [ID:%d]\n", str, FoodInfo[ i ] [ foodtext ], i );
		            	}
					}
					ShowPlayerDialog( playerid, DIALOG_NULL, DIALOG_STYLE_LIST, "Information", str, "Ok","" );
		        }
		        case 2:
		        {
					ShowPlayerDialog( playerid, DIALOG_FASTFOOD_TELEPORT, DIALOG_STYLE_INPUT, "ID eintippen", "Gib die ID des Standes für den Teleport ein", "Ok","" );
		        }
		        case 3:
		        {
		            ShowPlayerDialog( playerid, DIALOG_FASTFOOD_DELETE, DIALOG_STYLE_INPUT, "ID eintippen","Gib die ID des Standes ein, welchen du löschen möchtest", "Ok", "Zurück" );
		        }
		    }
		}
    }
    if( dialogid == DIALOG_FASTFOOD_TEXT )
    {
        if( ! response ) return ShowPlayerDialog( playerid, 123, DIALOG_STYLE_INPUT, "Texteingabe", "Gib den Text ein, den du diesem Stand geben möchtest.\n{FF0000}Diese Option kann nicht übersprungen werden", "Ok", "");
        if( response )
        {
	        new
	            str[ 64 ], query[ 520 ], f_id;
			f_id = Iter_Free(Foods);
			format( str, sizeof( str ) , "%s\nID(%d)", inputtext, f_id );
			FoodInfo[ f_id] [ textid ] = CreateDynamic3DTextLabel( str, -1, FoodInfo[ f_id ] [ ObjPosX ], FoodInfo[ f_id ] [ ObjPosY ], FoodInfo[ f_id ] [ ObjPosZ ], 10.0 );
			format(FoodInfo[ f_id ] [ foodtext ], 32, "%s", inputtext);
			mysql_format( sqlHandle, query , sizeof( query ) , "INSERT INTO foodstood (id, modelid, text, x, y, z, rotx, roty, rotz, Actorskin, ActorX, ActorY, ActorZ , ActorRot) VALUES (%d, %d, '%s', %f, %f, %f, %f, %f, %f, %d, %f, %f, %f, %f)",\
			f_id,
			FoodInfo[ f_id ] [ fmodelid ],
			inputtext ,
			FoodInfo[ f_id ] [ ObjPosX ] ,
			FoodInfo[ f_id ] [ ObjPosY ],
			FoodInfo[ f_id ] [ ObjPosZ ],
			FoodInfo[ f_id ] [ ObjRotX ],
			FoodInfo[ f_id ] [ ObjRotY ],
			FoodInfo[ f_id ] [ ObjRotZ ],
			FoodInfo[ f_id ] [ ActorSkin ] ,
			FoodInfo[ f_id ] [ ActorX ],
			FoodInfo[ f_id ] [ ActorY ],
			FoodInfo[ f_id ] [ ActorZ ],
			FoodInfo[ f_id ] [ ActorRot ] );
			
			mysql_tquery( sqlHandle, query );
			
			GetXYInFrontOfActor( FoodInfo[ f_id ] [ ActorID ], FoodInfo[ f_id ] [ ActorX ], FoodInfo[ f_id ] [ ActorY ], 2.0 );
			FoodInfo[ f_id ] [ fcheckpointid ] = CreateDynamicCP( FoodInfo[ f_id ] [ ActorX ], FoodInfo[ f_id ] [ ActorY ],FoodInfo[ f_id ] [ ActorZ ] , 1.0, -1, -1, -1, 10.0);
            
			Iter_Add(Foods, f_id);
		}
    }
    if( dialogid == DIALOG_FASTFOOD_TELEPORT )
    {
		if( response )
		{
		    new
		        f_id = strval(inputtext);
		    if(! strval( inputtext ) ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du musst eine Nummer eingeben." );
		    if( !IsValidDynamicObject( FoodInfo[ f_id ] [ foodid ] ))  return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Stand existiert nicht!" );
		    
		    new
				Float:x, Float:y, Float:z;
		    GetDynamicObjectPos( FoodInfo[ strval(inputtext) ] [ foodid ] , x, y, z );
		    SetPlayerPos( playerid, x+2.0, y+1.0,z );
		    GameTextForPlayer( playerid, "~b~~h~Teleported!", 2000, 3 );
		}
    }
	if( dialogid == DIALOG_FASTFOOD_DELETE )
	{
		if(response)
		{
		    new
		        f_id = strval(inputtext);
		    if(!Iter_Contains(Foods, f_id)) return SendClientMessage( playerid, 0x00B503FF, "[INFO]{FFFFFF} Gib die ID des Standes ein (0-99)" );
		    if( !IsValidDynamicObject( FoodInfo[ f_id ] [ foodid ] ))  return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Stand existiert nicht!" );

		    DestroyDynamicObject( FoodInfo[ f_id ] [ foodid ] );

		    DestroyDynamic3DTextLabel( FoodInfo[ f_id ] [ textid ] );
		    DestroyActor( FoodInfo[ f_id ] [ ActorID ] );
		    DestroyDynamicCP( FoodInfo[ f_id ] [ fcheckpointid ] );
		    new
		        query[ 64 ];
			mysql_format( sqlHandle, query, sizeof( query ) , "DELETE FROM `foodstood` WHERE id = %d", f_id );
			mysql_tquery( sqlHandle, query );
			GameTextForPlayer( playerid, "~g~Object entfernt!", 3000, 3 );
			Iter_Remove(Foods, f_id);
		}
	}
    return false;
}

stock FastFoodStood_ClickTextDraw(playerid, Text:clickedid)
{
 	if( clickedid == Text:INVALID_TEXT_DRAW )//if escape button is pressed
	{
		if( Isviewingobj[ playerid ] == true )
		{
        	HidefoodTD( playerid );
        	Isviewingobj[ playerid ] = false;
        }
 	}
 	if( clickedid == Foodobj[5] )
 	{
 	    if( GetPlayerMoneyEx( playerid ) < PIZZA_PRICE ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du hast nicht genügend Geld" );
 	    GivePlayerMoneyEx( playerid, - PIZZA_PRICE );
 	    SetPlayerArmedWeapon(playerid,WEAPON:0);
 	    HidefoodTD( playerid );
 	    
 	    new
 	        actorid = GetPlayerCameraTargetActor(playerid);
        ApplyActorAnimation( actorid ,  "DEALER" ,  "shop_pay" ,  4.0 ,  false ,  false ,  false ,  false ,  0 );
        
        PlayerAttachedObject[ playerid ] = FindFreeObjectSlot( playerid );
        SetPlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ], 2702, 6, 0.138999, 0.046999, 0.021999, 0.000000, -7.300000, -90.100006, 1.000000, 1.000000, 1.000000);
        ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.0, false ,false ,false ,true ,0 );
        SetTimerEx("RemoveObject", 3000, false, "i", playerid );
        
 	}
 	if ( clickedid == Foodobj[7] )
 	{
 	    if( GetPlayerMoneyEx( playerid ) < FRIES_PRICE ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du hast nicht genügend Geld" );
 	    GivePlayerMoneyEx( playerid, - FRIES_PRICE );
 	    SetPlayerArmedWeapon(playerid,WEAPON:0);
 	    HidefoodTD( playerid );

 	    new
 	        actorid = GetPlayerCameraTargetActor(playerid);
        ApplyActorAnimation( actorid ,  "DEALER" ,  "shop_pay" ,  4.0 ,  false ,  false ,  false ,  false ,  0 );

        PlayerAttachedObject[ playerid ] = FindFreeObjectSlot( playerid );
        SetPlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ], 2858, 6, 0.127000, 0.005999, 0.019999, 0.000000, -97.199974, 0.000000, 0.243000, 0.248000, 0.934000);
        ApplyAnimation(playerid, "FOOD", "EAT_Pizza", 4.0, false ,false ,false ,true ,0 );
        SetTimerEx("RemoveObject", 3000, false, "i", playerid );

 	}
 	if ( clickedid == Foodobj[9] )
 	{
 	    if( GetPlayerMoneyEx( playerid ) < COLA_PRICE ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du hast nicht genügend Geld" );
 	    GivePlayerMoneyEx( playerid, - COLA_PRICE );
 	    SetPlayerArmedWeapon(playerid,WEAPON:0);
 	    HidefoodTD( playerid );

 	    new
 	        actorid = GetPlayerCameraTargetActor(playerid);
        ApplyActorAnimation( actorid ,  "DEALER" ,  "shop_pay" ,  4.0 ,  false ,  false ,  false ,  false ,  0 );

        PlayerAttachedObject[ playerid ] = FindFreeObjectSlot( playerid );
        SetPlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ], 2647, 5, 0.147000, 0.036000, -0.009999, -45.299995, -95.299987, 0.000000, 0.715999, 0.839999, 0.786000);
        ApplyAnimation(playerid, "VENDING", "VEND_Drink_P", 4.0, false ,false ,false ,true ,0 );
        SetTimerEx("RemoveObject", 3000, false, "i", playerid );

 	}
 	if ( clickedid == Foodobj[11] )
 	{
 	    if( GetPlayerMoneyEx( playerid ) < BURGER_PRICE ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du hast nicht genügend Geld" );
 	    GivePlayerMoneyEx( playerid, - BURGER_PRICE );
 	    SetPlayerArmedWeapon(playerid,WEAPON:0);
 	    HidefoodTD( playerid );

 	    new
 	        actorid = GetPlayerCameraTargetActor(playerid);
        ApplyActorAnimation( actorid ,  "DEALER" ,  "shop_pay" ,  4.0 ,  false ,  false ,  false ,  false ,  0 );

        PlayerAttachedObject[ playerid ] = FindFreeObjectSlot( playerid );
        SetPlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ], 2880, 6, 0.111999, 0.178000, 0.007999, 0.000000, 0.000000, -157.000045, 1.000000, 1.000000, 1.000000);
        ApplyAnimation(playerid, "FOOD", "EAT_Burger", 4.0, false ,false ,false ,true ,0 );
        SetTimerEx("RemoveObject", 3000, false, "i", playerid );

 	}
 	if ( clickedid == Foodobj[13] )
 	{
 	    if( GetPlayerMoneyEx( playerid ) < HOTDOG_PRICE ) return SendClientMessage( playerid, 0xFF0000FF, "[ERROR]{FFFFFF} Du hast nicht genügend Geld" );
 	    GivePlayerMoneyEx( playerid, - HOTDOG_PRICE );
 	    HidefoodTD( playerid );

 	    new
 	        actorid = GetPlayerCameraTargetActor(playerid);
        ApplyActorAnimation( actorid ,  "DEALER" ,  "shop_pay" ,  4.0 ,  false ,  false ,  false ,  false ,  0 );

        PlayerAttachedObject[ playerid ] = FindFreeObjectSlot( playerid );
        SetPlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ], 2769, 6, 0.109999, 0.034999, 0.009000, 11.599999, 0.000000, -12.899994, 1.000000, 1.000000, 1.000000);
        ApplyAnimation(playerid, "FOOD", "EAT_Chicken", 4.0, false ,false ,false ,true ,0 );
        SetTimerEx("RemoveObject", 3000, false, "i", playerid );

 	}
 	return true;
}
forward RemoveObject( playerid );
public RemoveObject( playerid )
{
	new
		Float:h;
	GetPlayerHealth( playerid, h );
    RemovePlayerAttachedObject( playerid, PlayerAttachedObject[ playerid ] );
    ClearAnimations( playerid );
	if( h < 100 && h >= 89 )
	{
	    SetPlayerHealth( playerid, 100 );
	}
    if( h < 89)
	{
		SetPlayerHealth( playerid, h+10 );
	}
}
stock FastFoodStood_EditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	new f_id;
	f_id = Iter_Free(Foods);
	if( objectid == FoodInfo[ f_id ] [ foodid ] )
	{
	    if( response == 2 )
	    {
	        SetDynamicObjectPos( objectid, x, y, z );
	        SetDynamicObjectRot( objectid, rx, ry, rz );// to update it so others may see it.
	    }
		if ( response == 1 )
		{
            FoodInfo[ f_id ] [ foodid ]= objectid;

            FoodInfo[ f_id ] [ ObjPosX ] = x;
            FoodInfo[ f_id ] [ ObjPosY ] = y;
            FoodInfo[ f_id ] [ ObjPosZ ] = z;

            FoodInfo[ f_id ] [ ObjRotX ] = rx;
            FoodInfo[ f_id ] [ ObjRotY ] = ry;
            FoodInfo[ f_id ] [ ObjRotZ ] = rz;
            SetDynamicObjectPos( objectid, x, y, z );
            SetDynamicObjectRot( objectid, rx, ry, rz );
            new
                skins[ 6 ];
            skins [ 0 ] = 171, skins[ 1 ] = 172, skins[ 2 ] = 169, skins[ 3 ] = 167, skins[ 4 ] = 168, skins[ 5 ] = 161;
            ShowModelSelectionMenuEx(playerid, skins, 6, "waehle actor skin", MENU_FASTFOOD_ACTORSKIN, 16.0, 0.0, -55.0, 1.0, 0x00000033, 0x00000066, 0xA1A1A133);
		}
		else if( response == 0 ) { DestroyDynamicObject( FoodInfo[ f_id ] [ foodid ]) ; }
	}
	return 1;
}
stock FastFoodStood_ModelSelectionEx(playerid, response, extraid, modelid)
{
	if(extraid == MENU_FASTFOOD_ACTORSKIN)
	{
	    if(response)
	    {
	        new
	                f_id;
			f_id = Iter_Free(Foods);
            FoodInfo[ f_id ] [ ActorSkin ] = modelid;
            SendClientMessage( playerid, 0x00B503FF, "[INFO]{FFFFFF} Gehe zum Standort des NPCs und tippe /saveact" );
		}
	}
	if(extraid == MENU_FASTFOOD_OBJECT)
	{
   		new
		Float:x, Float:y, Float:z, f_id;
		f_id = Iter_Free(Foods);
		if( f_id == -1 || f_id == MAX_FOOD ) return SendClientMessage( playerid , 0xFF0000FF, "[ERROR]{FFFFFF}Du hast das maximale Limit bereits erreicht." );
	  	GetPlayerPos( playerid, x, y, z );
	  	FoodInfo[ f_id ] [ foodid ] = CreateDynamicObject( modelid, x+2.0, y, z, 0.0, 0.0, 0.0 );
	  	EditDynamicObject( playerid, FoodInfo[ f_id ] [ foodid ] );
	  	FoodInfo[ f_id ] [ fmodelid ] = modelid;
	}
	return 1;
}
stock FastFoodStood_EnterDynamicCP(playerid, checkpointid)
{
	for( new i = 0; i <= MAX_FOOD; i++ )
	{
		if( checkpointid == FoodInfo[ i ] [ fcheckpointid ] )
		{
			if(Isviewingobj[ playerid ] == false)
			{
				ShowfoodTD( playerid );
				Isviewingobj[ playerid ] = true;
			}
		}
	}
	return 1;
}

ShowfoodTD( playerid )
{
	for ( new i = 0; i < 15; i ++ )
	{
	    TextDrawShowForPlayer( playerid, Foodobj[ i ] );

	}
	SelectTextDraw(playerid, 0x00FF00FF);
}

HidefoodTD( playerid )
{
	for ( new i = 0; i < 15; i ++ )
	{
	    TextDrawHideForPlayer( playerid, Foodobj[ i ] );
	}
	CancelSelectTextDraw(playerid);
}

FindFreeObjectSlot( playerid )
{
	new
		objid;
    for( new i = 0; i < MAX_PLAYER_ATTACHED_OBJECTS; i++ )
    {
        if( IsPlayerAttachedObjectSlotUsed( playerid, i ) ) continue;
        objid = i;
    }
    return objid;
}